unit UEcfSecuenciaVenta;

interface

uses SysUtils, IBDatabase, UEcfSecuenciaRemota;

function OrigenSecuenciaRemoto(const AIni: string;
  ACia: Integer; const ASucursal: string): Boolean;
function PrepararPendienteSecuenciaVenta(ADB: TIBDatabase;
  const AIni: string; ACia: Integer; const ASucursal: string;
  APos: Integer; const ATipo: string): string;

function ObtenerReservaSecuenciaVenta(ADB: TIBDatabase; const AIni: string;
  ACia: Integer; const ASucursal, ARequestId: string): TRespuestaSecuencia;
procedure AprovisionarTokenSecuencia(const AIni: string; ACia: Integer;
  const ASucursal, ATipo, AToken: string);
function RegistrarNcfSecuenciaVenta(ADB: TIBDatabase;
  const AReserva: TRespuestaSecuencia; AFecha: TDateTime;
  ACliente, AUsuario: Integer; AMonto: Currency): Integer;

function EsVentaSecuenciaRemota(ADB: TIBDatabase; ATx: TIBTransaction;
  ANumero: Integer): Boolean;

implementation

uses Classes, IniFiles, IBQuery, UEcfSecuenciaCola, UEcfApiCredencialesIni;

function Seccion(ACia: Integer; const ASucursal: string): string;
begin
  Result := 'ECF_SECUENCIA_' + IntToStr(ACia) + '_' + ASucursal;
end;

function OrigenSecuenciaRemoto(const AIni: string;
  ACia: Integer; const ASucursal: string): Boolean;
var Ini: TIniFile; Origen: string;
begin
  Result := False;
  Ini := TIniFile.Create(AIni);
  try
    Origen := UpperCase(Trim(Ini.ReadString(Seccion(ACia, ASucursal), 'Origen', 'LOCAL')));
    if (Origen <> 'LOCAL') and (Origen <> 'REMOTO') then
      raise Exception.Create('Origen de secuencia no reconocido.');
    Result := Origen = 'REMOTO';
    if Result and (Ini.ReadString(Seccion(ACia, ASucursal), 'Ambiente', '') <> 'TEST') then
      raise Exception.Create('La integracion de secuencias actual requiere ambiente TEST.');
  finally
    Ini.Free;
  end;
end;

function PrepararPendienteSecuenciaVenta(ADB: TIBDatabase;
  const AIni: string; ACia: Integer; const ASucursal: string;
  APos: Integer; const ATipo: string): string;
var Tx: TIBTransaction; Q: TIBQuery; Rnc, Tipo: string;
begin
  Result := '';
  if not OrigenSecuenciaRemoto(AIni, ACia, ASucursal) then Exit;
  if (APos <= 0) or (ASucursal = '') then
    raise Exception.Create('Falta identidad POS para solicitud de secuencia.');
  Tipo := ATipo;
  if Length(Tipo) = 2 then Tipo := 'E' + Tipo;
  if (Length(Tipo) <> 3) or (Tipo[1] <> 'E') or
     not (Tipo[2] in ['0'..'9']) or not (Tipo[3] in ['0'..'9']) then
    raise Exception.Create('Tipo e-CF solicitado invalido.');
  if (ADB = nil) or not ADB.Connected then
    raise Exception.Create('No existe conexion local para la solicitud.');
  Tx := TIBTransaction.Create(nil);
  Q := TIBQuery.Create(nil);
  try
    Tx.DefaultDatabase := ADB;
    Tx.Params.Add('read_committed');
    Tx.Params.Add('rec_version');
    Tx.Params.Add('nowait');
    Q.Database := ADB;
    Q.Transaction := Tx;
    Tx.StartTransaction;
    Q.SQL.Text := 'SELECT RNC_NUMERO FROM COMPANIA WHERE CODIGO=:C';
    Q.ParamByName('C').AsInteger := ACia;
    Q.Open;
    if Q.Eof then raise Exception.Create('Empresa no encontrada.');
    Rnc := Trim(Q.FieldByName('RNC_NUMERO').AsString);
    if Rnc = '' then raise Exception.Create('RNC emisor no configurado.');
    Q.Close;
    Tx.Commit;
  finally
    if Tx.InTransaction then Tx.Rollback;
    Q.Free;
    Tx.Free;
  end;
  Result := PrepararSolicitudSecuencia(ADB, Rnc, ASucursal,
    'POS-' + IntToStr(ACia) + '-' + IntToStr(APos), Tipo);
end;

function ObtenerReservaSecuenciaVenta(ADB: TIBDatabase; const AIni: string;
  ACia: Integer; const ASucursal, ARequestId: string): TRespuestaSecuencia;
var Tx: TIBTransaction; Q: TIBQuery; Ini: TIniFile;
  Rnc, Documento, Tipo, Url, TokenProtegido, Token: string;
begin
  Result.HttpStatus := 0;
  Result.Resultado := 'NO_DISPONIBLE';
  Result.RequestId := ARequestId;
  Result.ReservaId := '';
  Result.LoteId := '';
  Result.Correlativo := '';
  Result.ENcf := '';
  Result.FechaVence := 0;
  Tx := TIBTransaction.Create(nil);
  Q := TIBQuery.Create(nil);
  try
    Tx.DefaultDatabase := ADB;
    Tx.Params.Add('read_committed');
    Tx.Params.Add('rec_version');
    Q.Database := ADB;
    Q.Transaction := Tx;
    Tx.StartTransaction;
    Q.SQL.Text := 'SELECT * FROM ECF_SEC_SOLICITUD WHERE REQUEST_ID=:I';
    Q.ParamByName('I').AsString := ARequestId;
    Q.Open;
    if Q.Eof then raise Exception.Create('Solicitud no confirmada antes de HTTPS.');
    if Q.FindField('SERIE_NCF_LOCAL') = nil then
      raise Exception.Create('Falta migracion CP5-NCF-LOCAL-FB25.sql.');
    if (Q.FieldByName('SUCURSAL_ID').AsString <> ASucursal) or
       (Q.FieldByName('AMBIENTE').AsString <> 'TEST') then
      raise Exception.Create('Ambito de solicitud no coincide.');
    Rnc := Q.FieldByName('RNC_EMISOR').AsString;
    Documento := Q.FieldByName('DOCUMENTO_CLAVE').AsString;
    Tipo := Trim(Q.FieldByName('TIPO_ECF').AsString);
    if not Q.FieldByName('ENCF').IsNull then
    begin
      Result.HttpStatus := 200;
      Result.Resultado := 'MISMA_RESERVA';
      Result.ReservaId := Q.FieldByName('RESERVA_ID').AsString;
      Result.LoteId := Q.FieldByName('LOTE_ID').AsString;
      Result.ENcf := Q.FieldByName('ENCF').AsString;
      Result.Correlativo := IntToStr(StrToInt64(Copy(Result.ENcf,4,10)));
      Result.FechaVence := Q.FieldByName('FECHA_VENCE').AsDateTime;
    end;
    Q.Close;
    Tx.Commit;
  finally
    if Tx.InTransaction then Tx.Rollback;
    Q.Free;
    Tx.Free;
  end;
  if Result.ENcf <> '' then Exit;
  // A partir de aqui, toda indisponibilidad deja la solicitud durable pendiente.
  try
    Ini := TIniFile.Create(AIni);
    try
      Url := Ini.ReadString(Seccion(ACia,ASucursal),'Url',
        'https://idesisa.com/ecf-cp4-qa.php');
      TokenProtegido := Ini.ReadString(Seccion(ACia,ASucursal),'TokenProtected_' + Tipo,'');
    finally
      Ini.Free;
    end;
    Token := DescifrarDPAPI(TokenProtegido,Seccion(ACia,ASucursal) + '_' + Tipo);
    Result := SolicitarSecuenciaTest(Url,Token,ARequestId,Documento,Rnc,ASucursal,Tipo,False);
    Token := '';
    if (Result.Resultado = 'ASIGNADO') or (Result.Resultado = 'MISMA_RESERVA') then
      GuardarReservaSecuencia(ADB,Result);
  except
    Result.HttpStatus := 0;
    Result.Resultado := 'NO_DISPONIBLE';
    Result.RequestId := ARequestId;
    Result.ReservaId := '';
    Result.LoteId := '';
    Result.Correlativo := '';
    Result.ENcf := '';
    Result.FechaVence := 0;
  end;
end;

procedure AprovisionarTokenSecuencia(const AIni: string; ACia: Integer;
  const ASucursal, ATipo, AToken: string);
var Ini: TIniFile; Protegido: string;
begin
  Protegido := CifrarDPAPI(AToken,Seccion(ACia,ASucursal) + '_' + ATipo);
  Ini := TIniFile.Create(AIni);
  try
    Ini.WriteString(Seccion(ACia,ASucursal),'TokenProtected_' + ATipo,Protegido);
  finally
    Ini.Free;
  end;
end;

function RegistrarNcfSecuenciaVenta(ADB: TIBDatabase;
  const AReserva: TRespuestaSecuencia; AFecha: TDateTime;
  ACliente, AUsuario: Integer; AMonto: Currency): Integer;
var Tx: TIBTransaction; Q: TIBQuery; Serie: Integer;
begin
  Result := -1;
  if (AReserva.ENcf = '') or (AReserva.RequestId = '') then Exit;
  Tx := TIBTransaction.Create(nil);
  Q := TIBQuery.Create(nil);
  try
    Tx.DefaultDatabase := ADB;
    Tx.Params.Add('read_committed');
    Tx.Params.Add('rec_version');
    Tx.Params.Add('nowait');
    Q.Database := ADB;
    Q.Transaction := Tx;
    Tx.StartTransaction;
    Q.SQL.Text := 'SELECT ENCF, SERIE_NCF_LOCAL FROM ECF_SEC_SOLICITUD ' +
      'WHERE REQUEST_ID=:I WITH LOCK';
    Q.ParamByName('I').AsString := AReserva.RequestId;
    Q.Open;
    if Q.Eof or (Q.FieldByName('ENCF').AsString <> AReserva.ENcf) then
      raise Exception.Create('Reserva local no coincide.');
    if not Q.FieldByName('SERIE_NCF_LOCAL').IsNull then
    begin
      Serie := Q.FieldByName('SERIE_NCF_LOCAL').AsInteger;
      Q.Close;
      Q.SQL.Text := 'SELECT NUMERO_NCF, TIPO_NCF, CODIGO_CTE, MONTO, FECHA ' +
        'FROM NCF_ASIGNADOS WHERE SERIE=:S';
      Q.ParamByName('S').AsInteger := Serie;
      Q.Open;
      if Q.Eof or (Q.FieldByName('NUMERO_NCF').AsString <> AReserva.ENcf) or
         (Trim(Q.FieldByName('TIPO_NCF').AsString) <> Copy(AReserva.ENcf,2,2)) or
         (Q.FieldByName('CODIGO_CTE').AsInteger <> ACliente) or
         (Abs(Q.FieldByName('MONTO').AsCurrency-AMonto) > 0.001) or
         (Trunc(Q.FieldByName('FECHA').AsDateTime) <> Trunc(AFecha)) then
        raise Exception.Create('Los datos difieren del NCF ya registrado.');
    end
    else
    begin
      Q.Close;
      Q.SQL.Text := 'SELECT GEN_ID(GEN_SERIE_NCF_ASIG,1) AS S FROM RDB$DATABASE';
      Q.Open;
      Serie := Q.FieldByName('S').AsInteger;
      Q.Close;
      Q.SQL.Text := 'INSERT INTO NCF_ASIGNADOS ' +
        '(SERIE,TIPO_NCF,NUMERO_NCF,FECHA,CODIGO_CTE,MONTO,STATUS,CODIGO_USUARIO,FECHA_INSERT) ' +
        'VALUES (:S,:T,:E,:F,:C,:M,''A'',:U,CURRENT_TIMESTAMP)';
      Q.ParamByName('S').AsInteger := Serie;
      Q.ParamByName('T').AsString := Copy(AReserva.ENcf,2,2);
      Q.ParamByName('E').AsString := AReserva.ENcf;
      Q.ParamByName('F').AsDate := Trunc(AFecha);
      Q.ParamByName('C').AsInteger := ACliente;
      Q.ParamByName('M').AsCurrency := AMonto;
      Q.ParamByName('U').AsInteger := AUsuario;
      Q.ExecSQL;
      Q.Close;
      Q.SQL.Text := 'UPDATE ECF_SEC_SOLICITUD SET SERIE_NCF_LOCAL=:S, ' +
        'ACTUALIZADO_EN=CURRENT_TIMESTAMP WHERE REQUEST_ID=:I';
      Q.ParamByName('S').AsInteger := Serie;
      Q.ParamByName('I').AsString := AReserva.RequestId;
      Q.ExecSQL;
    end;
    Q.Close;
    Tx.Commit;
    Result := Serie;
  finally
    if Tx.InTransaction then Tx.Rollback;
    Q.Free;
    Tx.Free;
  end;
end;

function EsVentaSecuenciaRemota(ADB: TIBDatabase; ATx: TIBTransaction;
  ANumero: Integer): Boolean;
var Q: TIBQuery;
begin
  Result := False;
  Q := TIBQuery.Create(nil);
  try
    Q.Database := ADB;
    Q.Transaction := ATx;
    Q.SQL.Text := 'SELECT RDB$RELATION_NAME FROM RDB$RELATIONS ' +
      'WHERE RDB$RELATION_NAME=''ECF_SEC_SOLICITUD''';
    Q.Open;
    if Q.Eof then Exit;
    Q.Close;
    Q.SQL.Text := 'SELECT REQUEST_ID FROM ECF_SEC_SOLICITUD WHERE NUMERO_TRN=:N';
    Q.ParamByName('N').AsInteger := ANumero;
    Q.Open;
    Result := not Q.Eof;
  finally
    Q.Free;
  end;
end;

end.
