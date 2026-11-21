unit UEcfApiIntentoGasto;

{
  PointSaleSoft / Delphi 7 / IBX / Firebird 2.5.
  Gastos E41/E43. Usa EXCLUSIVAMENTE dmConectar.IBDatabase1/IBTransaction1.
  PrepararIntentoApiGasto no hace COMMIT: el orquestador lo controla.
  Las transiciones HTTP confirman antes del POST. Si IBTransaction1 ya
  estaba activa, CommitRetaining requiere autorizacion del operador TEST;
  puede confirmar cambios ajenos, por lo que NO es un commit silencioso.
  El JSON es un snapshot inmutable UTF-8: NO convertirlo.
}

interface

uses
  SysUtils, Classes, IBDatabase, UEcfCanalConfig, UEcfApiIntento;

function NuevoIdIntentoGasto: string;
{ Gastos E41/E43. Identidad independiente del diario de ventas. }
function PrepararIntentoApiGasto(
  ADatabase: TIBDatabase;
  const AConfig: TEcfCanalConfiguracion;
  ANumeroTrn: Integer;
  const AENcf, AJsonUtf8, AIdIntento: string;
  AAutorizarCorreccion:Boolean = False): TEcfApiIntento;
function CargarIntentoApiPorGasto(
  ADatabase: TIBDatabase; const ARncEmisor: string;
  ANumeroTrn: Integer; out AIntento: TEcfApiIntento): Boolean;
procedure MarcarIntentoGastoTransmitiendo(
  ADatabase: TIBDatabase; const AIdIntento: string;
  AAutorizarCommitRetaining: Boolean = False);
procedure RegistrarResultadoHttpGasto(
  ADatabase: TIBDatabase; const AIdIntento: string;
  AHttpStatus: Integer; const AResponseUtf8: AnsiString;
  AAutorizarCommitRetaining: Boolean = False);
procedure MarcarIntentoGastoAmbiguo(
  ADatabase: TIBDatabase; const AIdIntento: string;
  AAutorizarCommitRetaining: Boolean = False);

function LeerRechazoLocalGasto(ADB:TIBDatabase;const AId:string;
  out AMensaje:string):Boolean;
procedure ConfirmarRechazoLocalGasto(ADB:TIBDatabase;const AId:string);

implementation

uses
  DB, IBQuery, UDatModConectar, UEcfApiGastoArtefactos;

function NuevoIdIntentoGasto: string;
var
  G: TGUID;
begin
  if CreateGUID(G) <> 0 then
    raise Exception.Create('No se pudo generar GUID para el intento API.');
  Result := UpperCase(GUIDToString(G));
  Result := StringReplace(Result, '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);
end;

procedure ValidarBase(ADatabase: TIBDatabase);
begin
  if (ADatabase = nil) or not ADatabase.Connected then
    raise Exception.Create('No existe conexion Firebird activa para ECF_API_GASTO_INTENTO.');
end;

function TransaccionGlobal(ADatabase: TIBDatabase): TIBTransaction;
begin
  ValidarBase(ADatabase);
  if dmConectar = nil then
    raise Exception.Create('dmConectar no disponible para intento API.');
  if ADatabase <> dmConectar.IBDatabase1 then
    raise Exception.Create('Intento API debe utilizar dmConectar.IBDatabase1.');
  Result := dmConectar.IBTransaction1;
  if (Result = nil) or (Result.DefaultDatabase <> ADatabase) then
    raise Exception.Create('IBTransaction1 no vinculada con IBDatabase1.');
end;

function NuevaQuery(ADatabase: TIBDatabase; ATx: TIBTransaction): TIBQuery;
begin
  Result := TIBQuery.Create(nil);
  Result.Database := ADatabase;
  Result.Transaction := ATx;
end;

procedure PonerBlob(Q: TIBQuery; const AParam: string; const ABytes: AnsiString);
var
  M: TMemoryStream;
begin
  M := TMemoryStream.Create;
  try
    if Length(ABytes) > 0 then
      M.WriteBuffer(ABytes[1], Length(ABytes));
    M.Position := 0;
    Q.ParamByName(AParam).LoadFromStream(M, ftBlob);
  finally
    M.Free;
  end;
end;

function LeerBlob(Q: TIBQuery; const ACampo: string): AnsiString;
var
  M: TMemoryStream;
  N: Integer;
begin
  Result := '';
  if Q.FieldByName(ACampo).IsNull then
    Exit;
  M := TMemoryStream.Create;
  try
    TBlobField(Q.FieldByName(ACampo)).SaveToStream(M);
    N := M.Size;
    SetLength(Result, N);
    M.Position := 0;
    if N > 0 then
      M.ReadBuffer(Result[1], N);
  finally
    M.Free;
  end;
end;

function PrepararIntentoApiGasto(
  ADatabase: TIBDatabase;
  const AConfig: TEcfCanalConfiguracion;
  ANumeroTrn: Integer;
  const AENcf, AJsonUtf8, AIdIntento: string;
  AAutorizarCorreccion:Boolean): TEcfApiIntento;
var
  Tx: TIBTransaction;
  Q: TIBQuery;
  G: string;
  I: Integer;
  Tipo: string;
  Ambiente: string;
  Previo: TEcfApiIntento;
begin
  ValidarBase(ADatabase);
  if AConfig.Canal <> ceIdesiApi then
    raise Exception.Create('El canal configurado no es IDESI_API.');
  Ambiente := NombreAmbienteEcf(AConfig.Ambiente);
  if (Ambiente <> 'TEST') and (Ambiente <> 'PROD') then
    raise Exception.Create('Ambiente IDESI API no soportado.');
  if ((Ambiente = 'TEST') and
      (AConfig.BaseUrl <> 'https://api-staging.idesisa.com')) or
     ((Ambiente = 'PROD') and
      (AConfig.BaseUrl <> 'https://api.idesisa.com')) then
    raise Exception.Create('Host IDESI API no corresponde al ambiente.');
  if Trim(AConfig.ClientId) = '' then
    raise Exception.Create('ClientId efectivo IDESI no configurado.');
  if (Trim(AConfig.RncEmisor) = '') or (ANumeroTrn <= 0) then
    raise Exception.Create('RNC y transaccion obligatorios para el intento.');
  Tipo := Copy(AENcf,1,3);
  if (Length(AENcf) <> 13) or
     ((Tipo <> 'E41') and (Tipo <> 'E43')) then
    raise Exception.Create('Tipo e-CF no soportado por API publica de ingresos.');
  for I := 4 to 13 do
    if not (AENcf[I] in ['0'..'9']) then
      raise Exception.Create('e-NCF contiene caracteres invalidos.');
  if Length(AJsonUtf8) = 0 then
    raise Exception.Create('No se permite guardar un JSON fiscal vacio.');
  if Pos('"eNcf":"' + AENcf + '"', AJsonUtf8) = 0 then
    raise Exception.Create('El JSON no coincide con el e-NCF solicitado.');
  if Pos('"companyRnc":"' + AConfig.RncEmisor + '"', AJsonUtf8) = 0 then
    raise Exception.Create('El JSON no coincide con el RNC emisor.');
  G := Trim(AIdIntento);
  if G = '' then
    raise Exception.Create('AIdIntento obligatorio: generar antes del JSON y persistir identidad estable.');
  if Length(G) <> 36 then
    raise Exception.Create('Formato de ID_INTENTO invalido.');

  Result.IdIntento := G;
  Result.RncEmisor := AConfig.RncEmisor;
  Result.NumeroTrn := ANumeroTrn;
  Result.ENcf := AENcf;
  Result.Ambiente := NombreAmbienteEcf(AConfig.Ambiente);
  Result.BaseUrl := AConfig.BaseUrl;
  Result.ClientId := AConfig.ClientId;
  Result.ExternalReference := 'PS-GASTO-' + Result.Ambiente + '-' +
    Result.RncEmisor + '-' + IntToStr(ANumeroTrn) + '-' + G;
  Result.IdempotencyKey := 'ps-gasto-' + LowerCase(Result.Ambiente) + '-' + G;
  Result.CorrelationId := 'ps-gasto-' + LowerCase(Result.Ambiente) + '-' + G;
  Result.EstadoLocal := 'PREPARADO';
  Result.HttpStatus := 0;
  Result.RequestUtf8 := AnsiString(AJsonUtf8);
  if Pos('"externalReference":"' + Result.ExternalReference + '"', AJsonUtf8) = 0 then
    raise Exception.Create('ExternalReference del JSON no es la identidad del intento.');

  Tx := TransaccionGlobal(ADatabase);
  if not Tx.InTransaction then
    raise Exception.Create('Preparacion sin transaccion global activa. Usar UEcfApiQaE31.');

  { Verificar ausencia de intento dentro de la misma transaccion.
    Requiere adicionalmente UNIQUE(RNC_EMISOR,NUMERO_TRN) en Firebird. }
  if CargarIntentoApiPorGasto(ADatabase,AConfig.RncEmisor,
     ANumeroTrn,Previo) and
     not (AAutorizarCorreccion and (Previo.EstadoLocal='RECH_LOCAL')) then
    raise Exception.Create('Existe intento API previo: ' + Previo.IdIntento +
      '. Solo puede consultarse/conciliarse; no preparar otro POST.');

  Q := NuevaQuery(ADatabase, Tx);
  try
    Q.SQL.Text :=
      'INSERT INTO ECF_API_GASTO_INTENTO (' +
      'ID_INTENTO,RNC_EMISOR,NUMERO_TRN,ENCF,CANAL_ENVIO,API_AMBIENTE,' +
      'BASE_URL,CLIENT_ID,EXTERNAL_REFERENCE,IDEMPOTENCY_KEY,CORRELATION_ID,' +
      'REQUEST_BODY,REQUEST_BYTES,ESTADO_LOCAL) VALUES (' +
      ':ID,:RNC,:TRN,:ENCF,:CANAL,:AMB,:URL,:CLIENT,:EXT,:IDEMP,:CORR,' +
      ':BODY,:BYTES,:ESTADO)';
    Q.ParamByName('ID').AsString := G;
    Q.ParamByName('RNC').AsString := Result.RncEmisor;
    Q.ParamByName('TRN').AsInteger := ANumeroTrn;
    Q.ParamByName('ENCF').AsString := AENcf;
    Q.ParamByName('CANAL').AsString := 'IDESI_API';
    Q.ParamByName('AMB').AsString := Result.Ambiente;
    Q.ParamByName('URL').AsString := Result.BaseUrl;
    Q.ParamByName('CLIENT').AsString := Result.ClientId;
    Q.ParamByName('EXT').AsString := Result.ExternalReference;
    Q.ParamByName('IDEMP').AsString := Result.IdempotencyKey;
    Q.ParamByName('CORR').AsString := Result.CorrelationId;
    Q.ParamByName('BYTES').AsInteger := Length(Result.RequestUtf8);
    Q.ParamByName('ESTADO').AsString := Result.EstadoLocal;
    PonerBlob(Q, 'BODY', Result.RequestUtf8);
    Q.ExecSQL;
    if Q.RowsAffected <> 1 then
      raise Exception.Create('No fue insertado el intento API.');
    { El orquestador QA confirma el intento completo ANTES del POST. }
  finally
    Q.Free;
  end;
end;

function CargarIntentoApiPorGasto(
  ADatabase: TIBDatabase; const ARncEmisor: string;
  ANumeroTrn: Integer; out AIntento: TEcfApiIntento): Boolean;
var
  Tx: TIBTransaction;
  Q: TIBQuery;
  IniciadaAqui: Boolean;
begin
  Result := False;
  AIntento.IdIntento := '';
  AIntento.RequestUtf8 := '';
  Tx := TransaccionGlobal(ADatabase);
  IniciadaAqui := not Tx.InTransaction;
  if IniciadaAqui then Tx.StartTransaction;
  try
    Q := NuevaQuery(ADatabase, Tx);
    try
      Q.SQL.Text :=
        'SELECT FIRST 1 * FROM ECF_API_GASTO_INTENTO ' +
        'WHERE RNC_EMISOR = :RNC AND NUMERO_TRN = :TRN '+
        'AND ENCF=(SELECT ECF FROM TRANS_OPERACION_MASTER WHERE NUMERO=:TRN) '+
        'ORDER BY CASE WHEN ESTADO_LOCAL=''RECH_LOCAL'' THEN 1 ELSE 0 END, '+
        'FECHA_CREACION DESC,ID_INTENTO DESC';
      Q.ParamByName('RNC').AsString := ARncEmisor;
      Q.ParamByName('TRN').AsInteger := ANumeroTrn;
      Q.Open;
      if not Q.Eof then
      begin
        AIntento.IdIntento := Q.FieldByName('ID_INTENTO').AsString;
        AIntento.RncEmisor := Q.FieldByName('RNC_EMISOR').AsString;
        AIntento.NumeroTrn := Q.FieldByName('NUMERO_TRN').AsInteger;
        AIntento.ENcf := Q.FieldByName('ENCF').AsString;
        AIntento.Ambiente := Q.FieldByName('API_AMBIENTE').AsString;
        AIntento.BaseUrl := Q.FieldByName('BASE_URL').AsString;
        AIntento.ClientId := Q.FieldByName('CLIENT_ID').AsString;
        AIntento.ExternalReference := Q.FieldByName('EXTERNAL_REFERENCE').AsString;
        AIntento.IdempotencyKey := Q.FieldByName('IDEMPOTENCY_KEY').AsString;
        AIntento.CorrelationId := Q.FieldByName('CORRELATION_ID').AsString;
        AIntento.EstadoLocal := Q.FieldByName('ESTADO_LOCAL').AsString;
        if Q.FieldByName('HTTP_STATUS').IsNull then
          AIntento.HttpStatus := 0
        else
          AIntento.HttpStatus := Q.FieldByName('HTTP_STATUS').AsInteger;
        AIntento.RequestUtf8 := LeerBlob(Q, 'REQUEST_BODY');
        if Length(AIntento.RequestUtf8) <>
           Q.FieldByName('REQUEST_BYTES').AsInteger then
          raise Exception.Create('Integridad comprometida: longitud JSON original no coincide.');
        Result := True;
      end;
      Q.Close;
    finally
      Q.Free;
    end;
  finally
    if IniciadaAqui and Tx.InTransaction then Tx.Rollback;
  end;
end;

procedure CambiarEstadoIntento(
  ADatabase: TIBDatabase; const AIdIntento, AOrigen, ADestino: string;
  AHttpStatus: Integer; const AResponseUtf8: AnsiString;
  AGuardarRespuesta: Boolean; AAutorizarCommitRetaining: Boolean);
var
  Tx: TIBTransaction;
  Q: TIBQuery;
  ActivaAlEntrar: Boolean;
  SavepointCreado: Boolean;

  procedure EjecutarControlTx(const ASql: string);
  var
    C: TIBQuery;
  begin
    C := NuevaQuery(ADatabase, Tx);
    try
      C.SQL.Text := ASql;
      C.ExecSQL;
    finally
      C.Free;
    end;
  end;
begin
  Tx := TransaccionGlobal(ADatabase);
  ActivaAlEntrar := Tx.InTransaction;
  if ActivaAlEntrar and (not AAutorizarCommitRetaining) then
    raise Exception.Create('Transicion HTTP bloqueada: transaccion global activa ' +
      'sin autorizacion de CommitRetaining.');
  if not ActivaAlEntrar then
    Tx.StartTransaction;
  SavepointCreado := False;
  try
    if ActivaAlEntrar then
    begin
      { Un solo CommitRetaining al confirmar la transicion; el caller
        ya valido y persisitio su venta en el flujo comercial. }
      EjecutarControlTx('SAVEPOINT SP_ECF_API_TRANSICION');
      SavepointCreado := True;
    end;
    Q := NuevaQuery(ADatabase, Tx);
    try
      if AGuardarRespuesta then
        Q.SQL.Text :=
          'UPDATE ECF_API_GASTO_INTENTO SET ESTADO_LOCAL = :DESTINO,' +
          ' FECHA_CAMBIO = CURRENT_TIMESTAMP, HTTP_STATUS = :HTTP,' +
          ' RESPONSE_BODY = :RESPUESTA' +
          ' WHERE ID_INTENTO = :ID AND ESTADO_LOCAL = :ORIGEN'
      else
        Q.SQL.Text :=
          'UPDATE ECF_API_GASTO_INTENTO SET ESTADO_LOCAL = :DESTINO,' +
          ' FECHA_CAMBIO = CURRENT_TIMESTAMP' +
          ' WHERE ID_INTENTO = :ID AND ESTADO_LOCAL = :ORIGEN';
      Q.ParamByName('DESTINO').AsString := ADestino;
      Q.ParamByName('ID').AsString := AIdIntento;
      Q.ParamByName('ORIGEN').AsString := AOrigen;
      if AGuardarRespuesta then
      begin
        Q.ParamByName('HTTP').AsInteger := AHttpStatus;
        PonerBlob(Q, 'RESPUESTA', AResponseUtf8);
      end;
      Q.ExecSQL;
      if Q.RowsAffected <> 1 then
        raise Exception.Create('Transicion de intento no autorizada: ' +
          AOrigen + ' -> ' + ADestino + ' (' + AIdIntento + ').');
      if ActivaAlEntrar then
        Tx.CommitRetaining
      else
        Tx.Commit;
    finally
      Q.Free;
    end;
  except
    on E: Exception do
    begin
      if ActivaAlEntrar then
      begin
        if SavepointCreado and Tx.InTransaction then
        begin
          try
            EjecutarControlTx('ROLLBACK TO SAVEPOINT SP_ECF_API_TRANSICION');
          except
            on E2: Exception do
              raise Exception.Create('Fallo al revertir la transicion ECF: ' +
                E2.Message + '. Error original: ' + E.Message);
          end;
        end;
      end
      else if Tx.InTransaction then
        Tx.Rollback;
      raise;
    end;
  end;
end;

procedure MarcarIntentoGastoTransmitiendo(
  ADatabase: TIBDatabase; const AIdIntento: string;
  AAutorizarCommitRetaining: Boolean);
begin
  CambiarEstadoIntento(ADatabase, AIdIntento,
    'PREPARADO', 'TRANSMITIENDO', 0, '', False,
    AAutorizarCommitRetaining);
end;

procedure RegistrarResultadoHttpGasto(
  ADatabase: TIBDatabase; const AIdIntento: string;
  AHttpStatus: Integer; const AResponseUtf8: AnsiString;
  AAutorizarCommitRetaining: Boolean);
begin
  if (AHttpStatus < 100) or (AHttpStatus > 599) then
    raise Exception.Create('Codigo HTTP invalido.');
  { HTTP 408/5xx, incluido 502, es AMBIGUO: puede haber emitido.
    Incluso HTTP 2xx NO significa aceptacion fiscal. Verificar /details. }
  if EsValidacionLocalGasto(AHttpStatus,AResponseUtf8) then
    CambiarEstadoIntento(ADatabase,AIdIntento,'TRANSMITIENDO','RECH_LOCAL',
      AHttpStatus,AResponseUtf8,True,AAutorizarCommitRetaining)
  else if (AHttpStatus = 408) or (AHttpStatus >= 500) then
    CambiarEstadoIntento(ADatabase, AIdIntento,
      'TRANSMITIENDO', 'AMBIGUO', AHttpStatus, AResponseUtf8, True,
      AAutorizarCommitRetaining)
  else
    CambiarEstadoIntento(ADatabase, AIdIntento,
      'TRANSMITIENDO', 'HTTP_RECIBIDO', AHttpStatus, AResponseUtf8, True,
      AAutorizarCommitRetaining);
end;

procedure MarcarIntentoGastoAmbiguo(
  ADatabase: TIBDatabase; const AIdIntento: string;
  AAutorizarCommitRetaining: Boolean);
begin
  CambiarEstadoIntento(ADatabase, AIdIntento,
    'TRANSMITIENDO', 'AMBIGUO', 0, '', False,
    AAutorizarCommitRetaining);
end;

function LeerRechazoLocalGasto(ADB:TIBDatabase;const AId:string;
  out AMensaje:string):Boolean;
var T:TIBTransaction;Q:TIBQuery;Iniciada:Boolean;Body:AnsiString;
begin
  Result:=False;AMensaje:='';T:=TransaccionGlobal(ADB);
  Iniciada:=not T.InTransaction;if Iniciada then T.StartTransaction;
  Q:=NuevaQuery(ADB,T);
  try
    Q.SQL.Text:='SELECT ESTADO_LOCAL,HTTP_STATUS,RESPONSE_BODY FROM ECF_API_GASTO_INTENTO WHERE ID_INTENTO=:I';
    Q.ParamByName('I').AsString:=AId;Q.Open;
    if Q.Eof then Exit;
    if (Q.FieldByName('ESTADO_LOCAL').AsString<>'HTTP_RECIBIDO') and
       (Q.FieldByName('ESTADO_LOCAL').AsString<>'RECH_LOCAL') then Exit;
    Body:=LeerBlob(Q,'RESPONSE_BODY');
    Result:=EsValidacionLocalGasto(Q.FieldByName('HTTP_STATUS').AsInteger,Body);
    if Result then AMensaje:=string(UTF8Decode(AnsiString(CampoJson(Body,'message'))));
  finally Q.Free;if Iniciada and T.InTransaction then T.Rollback;end;
end;

procedure ConfirmarRechazoLocalGasto(ADB:TIBDatabase;const AId:string);
var M:string;T:TIBTransaction;Q:TIBQuery;Estado:string;Iniciada:Boolean;
begin
  if not LeerRechazoLocalGasto(ADB,AId,M) then
    raise Exception.Create('No hay evidencia de validacion local para autorizar correccion.');
  T:=TransaccionGlobal(ADB);Iniciada:=not T.InTransaction;
  if Iniciada then T.StartTransaction;Q:=NuevaQuery(ADB,T);
  try
    Q.SQL.Text:='SELECT ESTADO_LOCAL FROM ECF_API_GASTO_INTENTO WHERE ID_INTENTO=:I';
    Q.ParamByName('I').AsString:=AId;Q.Open;Estado:=Q.FieldByName('ESTADO_LOCAL').AsString;
  finally Q.Free;if Iniciada and T.InTransaction then T.Rollback;end;
  if Estado='RECH_LOCAL' then Exit;
  CambiarEstadoIntento(ADB,AId,'HTTP_RECIBIDO','RECH_LOCAL',0,'',False,True);
end;

end.
