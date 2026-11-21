unit UEcfSecuenciaCola;

interface

uses SysUtils, IBDatabase, UEcfSecuenciaRemota;

function PrepararSolicitudSecuencia(ADB: TIBDatabase;
  const ARnc, ASucursal, ADocumento, ATipo: string): string;
procedure GuardarReservaSecuencia(ADB: TIBDatabase;
  const ARespuesta: TRespuestaSecuencia);
procedure VincularVentaSecuencia(ADB: TIBDatabase;
  const ARequestId: string; ANumeroTrn: Integer);
procedure VincularVentaSecuenciaEnTransaccion(ADB: TIBDatabase;
  ATx: TIBTransaction; const ARequestId: string; ANumeroTrn: Integer);

implementation

uses Classes, DB, IBQuery;

function NuevaTransaccion(ADB: TIBDatabase): TIBTransaction;
begin
  if (ADB = nil) or not ADB.Connected then
    raise Exception.Create('Conexion Firebird no disponible.');
  Result := TIBTransaction.Create(nil);
  Result.DefaultDatabase := ADB;
  Result.Params.Add('read_committed');
  Result.Params.Add('rec_version');
  Result.Params.Add('nowait');
end;

function NuevaConsulta(ADB: TIBDatabase; ATx: TIBTransaction): TIBQuery;
begin
  Result := TIBQuery.Create(nil);
  Result.Database := ADB;
  Result.Transaction := ATx;
end;

function PrepararSolicitudSecuencia(ADB: TIBDatabase;
  const ARnc, ASucursal, ADocumento, ATipo: string): string;
var Tx: TIBTransaction; Q: TIBQuery; G: TGUID;
begin
  Result := '';
  if (ARnc = '') or (ASucursal = '') or (ADocumento = '') or
     (Length(ATipo) <> 3) then
    raise Exception.Create('Identidad de documento requerida para reserva.');
  Tx := NuevaTransaccion(ADB);
  Q := NuevaConsulta(ADB, Tx);
  try
    Tx.StartTransaction;
    Q.SQL.Text := 'SELECT REQUEST_ID, TIPO_ECF FROM ECF_SEC_SOLICITUD ' +
      'WHERE RNC_EMISOR=:R AND AMBIENTE=''TEST'' AND SUCURSAL_ID=:S ' +
      'AND DOCUMENTO_CLAVE=:D';
    Q.ParamByName('R').AsString := ARnc;
    Q.ParamByName('S').AsString := ASucursal;
    Q.ParamByName('D').AsString := ADocumento;
    Q.Open;
    if not Q.Eof then
    begin
      if Trim(Q.FieldByName('TIPO_ECF').AsString) <> ATipo then
        raise Exception.Create('El tipo solicitado ya esta vinculado al documento.');
      Result := Q.FieldByName('REQUEST_ID').AsString;
    end
    else
    begin
      Q.Close;
      if CreateGUID(G) <> 0 then raise Exception.Create('No se pudo generar request.');
      Result := LowerCase(Copy(GUIDToString(G), 2, 36));
      Q.SQL.Text := 'INSERT INTO ECF_SEC_SOLICITUD ' +
        '(REQUEST_ID,RNC_EMISOR,AMBIENTE,SUCURSAL_ID,DOCUMENTO_CLAVE,TIPO_ECF,ESTADO) ' +
        'VALUES (:ID,:R,''TEST'',:S,:D,:T,''PENDIENTE_CONCILIACION'')';
      Q.ParamByName('ID').AsString := Result;
      Q.ParamByName('R').AsString := ARnc;
      Q.ParamByName('S').AsString := ASucursal;
      Q.ParamByName('D').AsString := ADocumento;
      Q.ParamByName('T').AsString := ATipo;
      Q.ExecSQL;
    end;
    Q.Close;
    Tx.Commit;
  finally
    if Tx.InTransaction then Tx.Rollback;
    Q.Free;
    Tx.Free;
  end;
end;

procedure GuardarReservaSecuencia(ADB: TIBDatabase;
  const ARespuesta: TRespuestaSecuencia);
var Tx: TIBTransaction; Q: TIBQuery; Tipo: string;
begin
  if ((ARespuesta.Resultado <> 'ASIGNADO') and
      (ARespuesta.Resultado <> 'MISMA_RESERVA')) or
     (ARespuesta.HttpStatus <> 200) or (ARespuesta.RequestId = '') or
     (Length(ARespuesta.ENcf) <> 13) or (ARespuesta.ReservaId = '') or
     (ARespuesta.LoteId = '') or (ARespuesta.FechaVence <= 0) then
    raise Exception.Create('Respuesta no apta para guardar reserva.');
  Tx := NuevaTransaccion(ADB);
  Q := NuevaConsulta(ADB, Tx);
  try
    Tx.StartTransaction;
    Q.SQL.Text := 'SELECT ENCF, RESERVA_ID, LOTE_ID, FECHA_VENCE, TIPO_ECF ' +
      'FROM ECF_SEC_SOLICITUD WHERE REQUEST_ID=:ID WITH LOCK';
    Q.ParamByName('ID').AsString := ARespuesta.RequestId;
    Q.Open;
    if Q.Eof then raise Exception.Create('Solicitud no persistida.');
    Tipo := Trim(Q.FieldByName('TIPO_ECF').AsString);
    if Copy(ARespuesta.ENcf, 1, 3) <> Tipo then
      raise Exception.Create('Tipo de respuesta distinto al solicitado.');
    if not Q.FieldByName('ENCF').IsNull then
    begin
      if (Q.FieldByName('ENCF').AsString <> ARespuesta.ENcf) or
         (Q.FieldByName('RESERVA_ID').AsString <> ARespuesta.ReservaId) or
         (Q.FieldByName('LOTE_ID').AsString <> ARespuesta.LoteId) or
         (Q.FieldByName('FECHA_VENCE').AsDateTime <> ARespuesta.FechaVence) then
        raise Exception.Create('Conflicto con reserva guardada. Requiere revision.');
    end
    else
    begin
      Q.Close;
      Q.SQL.Text := 'UPDATE ECF_SEC_SOLICITUD SET ENCF=:E, RESERVA_ID=:R, ' +
        'LOTE_ID=:L, FECHA_VENCE=:F, ESTADO=''RESERVADA'', ' +
        'ACTUALIZADO_EN=CURRENT_TIMESTAMP WHERE REQUEST_ID=:ID';
      Q.ParamByName('E').AsString := ARespuesta.ENcf;
      Q.ParamByName('R').AsString := ARespuesta.ReservaId;
      Q.ParamByName('L').AsString := ARespuesta.LoteId;
      Q.ParamByName('F').AsDate := ARespuesta.FechaVence;
      Q.ParamByName('ID').AsString := ARespuesta.RequestId;
      Q.ExecSQL;
    end;
    Q.Close;
    Tx.Commit;
  finally
    if Tx.InTransaction then Tx.Rollback;
    Q.Free;
    Tx.Free;
  end;
end;

procedure VincularVentaSecuencia(ADB: TIBDatabase;
  const ARequestId: string; ANumeroTrn: Integer);
var Tx: TIBTransaction;
begin
  Tx := NuevaTransaccion(ADB);
  try
    Tx.StartTransaction;
    VincularVentaSecuenciaEnTransaccion(ADB, Tx, ARequestId, ANumeroTrn);
    Tx.Commit;
  finally
    if Tx.InTransaction then Tx.Rollback;
    Tx.Free;
  end;
end;

procedure VincularVentaSecuenciaEnTransaccion(ADB: TIBDatabase;
  ATx: TIBTransaction; const ARequestId: string; ANumeroTrn: Integer);
var Q: TIBQuery;
begin
  if ANumeroTrn <= 0 then raise Exception.Create('Numero de venta invalido.');
  if (ATx = nil) or not ATx.InTransaction or (ATx.DefaultDatabase <> ADB) then
    raise Exception.Create('Se requiere la transaccion activa de la venta.');
  Q := NuevaConsulta(ADB, ATx);
  try
    Q.SQL.Text := 'SELECT NUMERO_TRN FROM ECF_SEC_SOLICITUD ' +
      'WHERE REQUEST_ID=:ID WITH LOCK';
    Q.ParamByName('ID').AsString := ARequestId;
    Q.Open;
    if Q.Eof then raise Exception.Create('Solicitud no encontrada.');
    if not Q.FieldByName('NUMERO_TRN').IsNull and
       (Q.FieldByName('NUMERO_TRN').AsInteger <> ANumeroTrn) then
      raise Exception.Create('Solicitud vinculada a otra venta.');
    Q.Close;
    Q.SQL.Text := 'UPDATE ECF_SEC_SOLICITUD SET NUMERO_TRN=:N, ' +
      'ACTUALIZADO_EN=CURRENT_TIMESTAMP WHERE REQUEST_ID=:ID';
    Q.ParamByName('N').AsInteger := ANumeroTrn;
    Q.ParamByName('ID').AsString := ARequestId;
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

end.
