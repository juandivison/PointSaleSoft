unit UEcfApiIntento;

{
  PointSaleSoft / Delphi 7 / IBX / Firebird 2.5.
  CP8: diario local de intentos API. No llama la red, no toca la transaccion
  de venta existente: usa una transaccion IBX propia, con COMMIT explicito.
  El JSON recibido ya debe estar serializado en bytes UTF-8. NO convertirlo.
}

interface

uses
  SysUtils, Classes, IBDatabase, UEcfCanalConfig;

type
  TEcfApiIntento = record
    IdIntento: string;
    RncEmisor: string;
    NumeroTrn: Integer;
    ENcf: string;
    Ambiente: string;
    BaseUrl: string;
    ClientId: string;
    ExternalReference: string;
    IdempotencyKey: string;
    CorrelationId: string;
    EstadoLocal: string;
    HttpStatus: Integer;
    RequestUtf8: AnsiString;
  end;

function NuevoIdIntentoEcf: string;
function PrepararIntentoApiE31(
  ADatabase: TIBDatabase;
  const AConfig: TEcfCanalConfiguracion;
  ANumeroTrn: Integer;
  const AENcf, AJsonUtf8, AIdIntento: string): TEcfApiIntento;
function CargarIntentoApiPorFactura(
  ADatabase: TIBDatabase; const ARncEmisor: string;
  ANumeroTrn: Integer; out AIntento: TEcfApiIntento): Boolean;
procedure MarcarIntentoApiTransmitiendo(
  ADatabase: TIBDatabase; const AIdIntento: string);
procedure RegistrarResultadoHttpIntento(
  ADatabase: TIBDatabase; const AIdIntento: string;
  AHttpStatus: Integer; const AResponseUtf8: AnsiString);
procedure MarcarIntentoApiAmbiguo(
  ADatabase: TIBDatabase; const AIdIntento: string);

implementation

uses
  DB, IBQuery;

function NuevoIdIntentoEcf: string;
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
    raise Exception.Create('No existe conexion Firebird activa para ECF_API_INTENTO.');
end;

function NuevaTransaccion(ADatabase: TIBDatabase): TIBTransaction;
begin
  ValidarBase(ADatabase);
  Result := TIBTransaction.Create(nil);
  Result.DefaultDatabase := ADatabase;
  Result.Params.Clear;
  Result.Params.Add('read_committed');
  Result.Params.Add('rec_version');
  Result.Params.Add('wait');
  Result.Params.Add('write');
  try
    Result.StartTransaction;
  except
    Result.Free;
    raise;
  end;
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

function PrepararIntentoApiE31(
  ADatabase: TIBDatabase;
  const AConfig: TEcfCanalConfiguracion;
  ANumeroTrn: Integer;
  const AENcf, AJsonUtf8, AIdIntento: string): TEcfApiIntento;
var
  Tx: TIBTransaction;
  Q: TIBQuery;
  G: string;
  I: Integer;
begin
  ValidarBase(ADatabase);
  if AConfig.Canal <> ceIdesiApi then
    raise Exception.Create('El canal configurado no es IDESI_API.');
  { CP8 deliberadamente TEST-only; evita un POST productivo prematuro. }
  if AConfig.Ambiente <> aeTest then
    raise Exception.Create('CP8: emision API PROD bloqueada. Solo TEST.');
  if (AConfig.BaseUrl <> 'https://api-staging.idesisa.com') or
     (AConfig.ClientId <> 'idesi-staging') then
    raise Exception.Create('Configuracion TEST de API no corresponde al ambiente esperado.');
  if (Trim(AConfig.RncEmisor) = '') or (ANumeroTrn <= 0) then
    raise Exception.Create('RNC y transaccion obligatorios para registrar el intento.');
  if (Length(AENcf) <> 13) or (Copy(AENcf,1,3) <> 'E31') then
    raise Exception.Create('CP8 solo admite E31.');
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
  Result.ExternalReference := 'PS-' + Result.Ambiente + '-' +
    Result.RncEmisor + '-' + IntToStr(ANumeroTrn) + '-' + G;
  Result.IdempotencyKey := 'ps-' + LowerCase(Result.Ambiente) + '-' + G;
  Result.CorrelationId := 'ps-' + LowerCase(Result.Ambiente) + '-' + G;
  Result.EstadoLocal := 'PREPARADO';
  Result.HttpStatus := 0;
  Result.RequestUtf8 := AnsiString(AJsonUtf8);
  if Pos('"externalReference":"' + Result.ExternalReference + '"', AJsonUtf8) = 0 then
    raise Exception.Create('ExternalReference del JSON no es la identidad del intento.');

  Tx := NuevaTransaccion(ADatabase);
  try
    try
      Q := NuevaQuery(ADatabase, Tx);
    try
      Q.SQL.Text :=
        'INSERT INTO ECF_API_INTENTO (' +
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
      { Indispensable: COMMIT del body original ANTES de transmitir. }
      Tx.Commit;
    finally
      Q.Free;
    end;
    except
      if Tx.InTransaction then Tx.Rollback;
      raise;
    end;
  finally
    Tx.Free;
  end;
end;

function CargarIntentoApiPorFactura(
  ADatabase: TIBDatabase; const ARncEmisor: string;
  ANumeroTrn: Integer; out AIntento: TEcfApiIntento): Boolean;
var
  Tx: TIBTransaction;
  Q: TIBQuery;
begin
  Result := False;
  AIntento.IdIntento := '';
  AIntento.RequestUtf8 := '';
  Tx := NuevaTransaccion(ADatabase);
  try
    try
      Q := NuevaQuery(ADatabase, Tx);
    try
      Q.SQL.Text :=
        'SELECT * FROM ECF_API_INTENTO ' +
        'WHERE RNC_EMISOR = :RNC AND NUMERO_TRN = :TRN';
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
      Tx.Commit;
    finally
      Q.Free;
    end;
    except
      if Tx.InTransaction then Tx.Rollback;
      raise;
    end;
  finally
    Tx.Free;
  end;
end;

procedure CambiarEstadoIntento(
  ADatabase: TIBDatabase; const AIdIntento, AOrigen, ADestino: string;
  AHttpStatus: Integer; const AResponseUtf8: AnsiString;
  AGuardarRespuesta: Boolean);
var
  Tx: TIBTransaction;
  Q: TIBQuery;
begin
  Tx := NuevaTransaccion(ADatabase);
  try
    try
      Q := NuevaQuery(ADatabase, Tx);
    try
      if AGuardarRespuesta then
        Q.SQL.Text :=
          'UPDATE ECF_API_INTENTO SET ESTADO_LOCAL = :DESTINO,' +
          ' FECHA_CAMBIO = CURRENT_TIMESTAMP, HTTP_STATUS = :HTTP,' +
          ' RESPONSE_BODY = :RESPUESTA' +
          ' WHERE ID_INTENTO = :ID AND ESTADO_LOCAL = :ORIGEN'
      else
        Q.SQL.Text :=
          'UPDATE ECF_API_INTENTO SET ESTADO_LOCAL = :DESTINO,' +
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
      Tx.Commit;
    finally
      Q.Free;
    end;
    except
      if Tx.InTransaction then Tx.Rollback;
      raise;
    end;
  finally
    Tx.Free;
  end;
end;

procedure MarcarIntentoApiTransmitiendo(
  ADatabase: TIBDatabase; const AIdIntento: string);
begin
  CambiarEstadoIntento(ADatabase, AIdIntento,
    'PREPARADO', 'TRANSMITIENDO', 0, '', False);
end;

procedure RegistrarResultadoHttpIntento(
  ADatabase: TIBDatabase; const AIdIntento: string;
  AHttpStatus: Integer; const AResponseUtf8: AnsiString);
begin
  if (AHttpStatus < 100) or (AHttpStatus > 599) then
    raise Exception.Create('Codigo HTTP invalido.');
  { HTTP 408/5xx, incluido 502, es AMBIGUO: puede haber emitido.
    Incluso HTTP 2xx NO significa aceptacion fiscal. Verificar /details. }
  if (AHttpStatus = 408) or (AHttpStatus >= 500) then
    CambiarEstadoIntento(ADatabase, AIdIntento,
      'TRANSMITIENDO', 'AMBIGUO', AHttpStatus, AResponseUtf8, True)
  else
    CambiarEstadoIntento(ADatabase, AIdIntento,
      'TRANSMITIENDO', 'HTTP_RECIBIDO', AHttpStatus, AResponseUtf8, True);
end;

procedure MarcarIntentoApiAmbiguo(
  ADatabase: TIBDatabase; const AIdIntento: string);
begin
  CambiarEstadoIntento(ADatabase, AIdIntento,
    'TRANSMITIENDO', 'AMBIGUO', 0, '', False);
end;

end.
