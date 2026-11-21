unit UEcfApiDespachoIngresos;

{
  CP13.9 - Orquestacion de ingresos E31/E32/E34/E44/E45.
  NO incorporar en los eventos de UI hasta compilar y validar la integracion.
  Un unico POST; nunca fallback a ASLAN ni reenvio automatizado.
  Trabaja EXCLUSIVAMENTE con dmConectar.IBDatabase1/IBTransaction1.
  Acepta CommitRetaining de los flujos comerciales ya validados.
  No confirma trabajo de otros formularios.
}

interface

uses
  IBDatabase, UEcfApiClienteV1;

function EnviarIngresoPersistidoIdesiApi(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  ANumeroTrn: Integer; AUsarFacturaTxt: Integer;
  const AIniPath, ARutaFacturaTxt: string;
  AAutorizarPost: Boolean): TEcfApiRespuestaV1;

implementation

uses
  SysUtils, DB, IBQuery, UEcfCanalConfig, UEcfApiSwitch,
  UEcfApiIntento, UEcfApiFirebirdJson, UEcfApiV1Json,
  UFacturaTxtBuilder, UDatModConectar;

procedure ExigirTransaccionLibre(ADatabase: TIBDatabase;
  ATransaction: TIBTransaction);
begin
  if (dmConectar = nil) or (ADatabase = nil) or
     (ATransaction = nil) or (ADatabase <> dmConectar.IBDatabase1) or
     (ATransaction <> dmConectar.IBTransaction1) or
     (ATransaction.DefaultDatabase <> ADatabase) or
     (not ADatabase.Connected) then
    raise Exception.Create('Se requieren IBDatabase1 e IBTransaction1 globales.');
  { El flujo comercial usa CommitRetaining y puede dejar IBTransaction1
    activa. No bloquear una factura por este indicador. }
end;

procedure LeerIdentidadFactura(ADatabase: TIBDatabase;
  ATransaction: TIBTransaction; ANumeroTrn: Integer;
  out ARncEmisor, AENcf: string);
var
  Q: TIBQuery;
  TxIniciadaAqui: Boolean;
begin
  ARncEmisor := '';
  AENcf := '';
  TxIniciadaAqui := not ATransaction.InTransaction;
  if TxIniciadaAqui then ATransaction.StartTransaction;
  try
    Q := TIBQuery.Create(nil);
    try
      Q.Database := ADatabase;
      Q.Transaction := ATransaction;
      Q.SQL.Text :=
        'SELECT N.NUMERO_NCF, C.RNC_NUMERO AS RNC_EMISOR ' +
        'FROM VENTAS_MAST V ' +
        'LEFT JOIN NCF_ASIGNADOS N ON N.SERIE = V.SERIE_NCF_ASIGNADO ' +
        'LEFT JOIN COMPANIA C ON C.CODIGO = V.CIA_KEY ' +
        'WHERE V.NUMERO = :NUMERO';
      Q.ParamByName('NUMERO').AsInteger := ANumeroTrn;
      Q.Open;
      if Q.Eof then
        raise Exception.Create('Factura no existe en VENTAS_MAST.');
      if not Q.FieldByName('NUMERO_NCF').IsNull then
        AENcf := Trim(Q.FieldByName('NUMERO_NCF').AsString);
      if not Q.FieldByName('RNC_EMISOR').IsNull then
        ARncEmisor := Trim(Q.FieldByName('RNC_EMISOR').AsString);
    finally
      Q.Free;
    end;
  finally
    if TxIniciadaAqui and ATransaction.InTransaction then ATransaction.Rollback;
  end;
  if (ARncEmisor = '') or (Length(AENcf) <> 13) then
    raise Exception.Create('Factura sin RNC emisor o e-NCF persistido.');
end;

procedure ValidarVentaFiscalPersistida(ADatabase: TIBDatabase;
  ATransaction: TIBTransaction; ANumeroTrn: Integer);
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(nil);
  try
    Q.Database := ADatabase;
    Q.Transaction := ATransaction;
    Q.SQL.Text :=
      'SELECT VALIDA, MENSAJE FROM PROC_VALIDA_VENTA_PERSISTIDA(:P_NUMERO)';
    Q.ParamByName('P_NUMERO').AsInteger := ANumeroTrn;
    Q.Open;
    if Q.Eof then
      raise Exception.Create('PROC_VALIDA_VENTA_PERSISTIDA no devolvio datos.');
    if Q.FieldByName('VALIDA').AsInteger <> 1 then
      raise Exception.Create('Factura persistida no cuadra: ' +
        Trim(Q.FieldByName('MENSAJE').AsString));
  finally
    Q.Free;
  end;
end;

function EnviarIngresoPersistidoIdesiApi(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  ANumeroTrn: Integer; AUsarFacturaTxt: Integer;
  const AIniPath, ARutaFacturaTxt: string;
  AAutorizarPost: Boolean): TEcfApiRespuestaV1;
var
  Config: TEcfCanalConfiguracion;
  Intento: TEcfApiIntento;
  RncEmisor, ENcf, ENcfGenerado, TipoEcf, IdIntento,
  ReferenciaExterna, Token: string;
  JsonUtf8: AnsiString;
  Builder: TFacturaTxtBuilder;
  BuildResult: TFacturaTxtBuildResult;
  TxIniciadaAqui: Boolean;
begin
  Result.StatusCode := 0;
  Result.BodyBytes := '';
  Result.ContentType := '';
  Result.IdempotencyReplayed := '';
  if not AAutorizarPost then
    raise Exception.Create('Envio fiscal no autorizado por el flujo comercial.');
  if ANumeroTrn <= 0 then
    raise Exception.Create('Numero de factura invalido para IDESI API.');
  if (AUsarFacturaTxt <> 0) and (AUsarFacturaTxt <> 1) then
    raise Exception.Create('GlbUsarFacturaTxtECF debe ser 0 o 1.');
  ExigirTransaccionLibre(ADatabase,ATransaction);

  LeerIdentidadFactura(ADatabase,ATransaction,ANumeroTrn,RncEmisor,ENcf);
  { Este resolver BLOQUEA cualquier intento previo incluso si fue ambiguo. }
  Config := ResolverCanalEcfTransaccion(ADatabase,ATransaction,
    RncEmisor,ANumeroTrn);
  if Config.Canal <> ceIdesiApi then
    raise Exception.Create('Factura configurada para ASLAN; ' +
      'el despachador IDESI no ejecutara la ruta legacy.');
  Config := ResolverConfiguracionIdesiIni(Config,AIniPath);

  { OAuth antes de escribir PREPARADO. Si falla no hay intento inutil. }
  Token := ObtenerAccessTokenIdesiV1(Config,AIniPath);
  if Token = '' then
    raise Exception.Create('OAuth IDESI no devolvio access token.');

  IdIntento := NuevoIdIntentoEcf;
  ReferenciaExterna := 'PS-' + NombreAmbienteEcf(Config.Ambiente) +
    '-' + RncEmisor + '-' + IntToStr(ANumeroTrn) + '-' + IdIntento;

  { El snapshot PREPARADO se confirma en transaccion propia global.
    No hay ninguna operacion HTTP mientras la transaccion esta activa. }
  TxIniciadaAqui := not ATransaction.InTransaction;
  if TxIniciadaAqui then ATransaction.StartTransaction;
  try
    ValidarVentaFiscalPersistida(ADatabase,ATransaction,ANumeroTrn);
    if AUsarFacturaTxt = 0 then
    begin
      if not ConstruirJsonIngresosDesdeFirebird(ADatabase,ATransaction,
        ANumeroTrn,RncEmisor,ReferenciaExterna,
        ENcfGenerado,TipoEcf,JsonUtf8) then
        raise Exception.Create('No se pudo construir JSON desde Firebird.');
    end
    else
    begin
      if Trim(ARutaFacturaTxt) = '' then
        raise Exception.Create('Ruta TXT requerida cuando GlbUsarFacturaTxtECF=1.');
      Builder := TFacturaTxtBuilder.Create(ADatabase,ATransaction);
      try
        BuildResult := Builder.GenerateFacturaTxt(ANumeroTrn,ARutaFacturaTxt);
      finally
        Builder.Free;
      end;
      ENcfGenerado := BuildResult.ENcf;
      TipoEcf := BuildResult.TipoEcf;
      JsonUtf8 := AnsiString(ConstruirJsonIngresosPublicV1(
        BuildResult.OutputFile,RncEmisor,ReferenciaExterna));
    end;

    if not SameText(ENcfGenerado,ENcf) or
       not SameText(Copy(ENcf,1,3),TipoEcf) then
      raise Exception.Create('JSON no coincide con factura fiscal persistida.');

    Intento := PrepararIntentoApiIngresos(ADatabase,Config,ANumeroTrn,
      ENcf,string(JsonUtf8),IdIntento);
    if TxIniciadaAqui then
      ATransaction.Commit
    else
      ATransaction.CommitRetaining;
  except
    if TxIniciadaAqui and ATransaction.InTransaction then ATransaction.Rollback;
    { La ruta existente maneja CommitRetaining. Nunca hacer Rollback
      general sobre transacciones comerciales que no abrimos. }
    raise;
  end;

  { Esta transicion se confirma ANTES del POST. Si falla, no hay POST. }
  MarcarIntentoApiTransmitiendo(ADatabase,Intento.IdIntento,True);
  Intento.EstadoLocal := 'TRANSMITIENDO';
  try
    Result := EnviarIntentoIdesiV1UnaVez(Intento,Config,Token,True);
  except
    on E: Exception do
    begin
      try
        MarcarIntentoApiAmbiguo(ADatabase,Intento.IdIntento,True);
      except
        { TRANSMITIENDO tambien impide emitir nuevamente. }
      end;
      raise Exception.Create('Resultado fiscal incierto. NO reenviar ni ' +
        'cambiar a ASLAN: consultar IDESI API. ' + E.Message);
    end;
  end;

  try
    RegistrarResultadoHttpIntento(ADatabase,Intento.IdIntento,
      Result.StatusCode,Result.BodyBytes,True);
  except
    on E: Exception do
      raise Exception.Create('API respondio, pero fallo persistir su resultado. ' +
        'NO reenviar: conciliar desde IDESI API. ' + E.Message);
  end;
  { HTTP no aceptado por API: ya existe intento y resultado persistidos.
    Informar sin repetir POST ni cambiar a ASLAN. }
  if (Result.StatusCode < 200) or (Result.StatusCode >= 300) then
    raise Exception.Create('IDESI API respondio HTTP ' +
      IntToStr(Result.StatusCode) + '. Revise el intento y su respuesta; ' +
      'no se realizara otro envio automatico.');
  { NO marcar CONCILIADO solo por HTTP 2xx. }
end;

end.
