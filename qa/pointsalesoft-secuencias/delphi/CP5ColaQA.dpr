program CP5ColaQA;
{$APPTYPE CONSOLE}
uses SysUtils, Classes, IniFiles, IBDatabase, IBQuery,
  UEcfSecuenciaRemota, UEcfSecuenciaCola, UEcfSecuenciaVenta;

function ParametroDfm(const S, Nombre: string): string;
var P, F: Integer;
begin
  P := Pos(Nombre + '=', S);
  if P = 0 then raise Exception.Create('Configuracion Firebird no encontrada.');
  Inc(P, Length(Nombre)+1);
  F := P;
  while (F <= Length(S)) and (S[F] <> #39) do Inc(F);
  Result := Copy(S,P,F-P);
end;

procedure Exigir(B: Boolean; const Nombre: string);
begin
  if not B then raise Exception.Create(Nombre);
  WriteLn('PASS ', Nombre);
end;

var DB: TIBDatabase; Tx: TIBTransaction; Q: TIBQuery;
  S: TStringList; Doc, Id, Id2: string; G: TGUID;
  R: TRespuestaSecuencia; Conflicto: Boolean;
  Ini: TIniFile; IniPath: string;
  IniCreado: Boolean;
begin
  DB := TIBDatabase.Create(nil);
  Tx := TIBTransaction.Create(nil);
  Q := TIBQuery.Create(nil);
  S := TStringList.Create;
  Id := '';
  IniPath := ExtractFilePath(ParamStr(0)) + 'QA_CP5_selector.ini';
  IniCreado := False;
  try
    try
      if FileExists(IniPath) then raise Exception.Create('Archivo QA ya existe.');
      Exigir(not OrigenSecuenciaRemoto(IniPath,1,'QA01'),'configuracion ausente LOCAL');
      IniCreado := True;
      Ini := TIniFile.Create(IniPath);
      try
        Ini.WriteString('ECF_SECUENCIA_1_QA01','Origen','REMOTO');
        Ini.WriteString('ECF_SECUENCIA_1_QA01','Ambiente','TEST');
      finally
        Ini.Free;
      end;
      Exigir(OrigenSecuenciaRemoto(IniPath,1,'QA01'),'selector REMOTO explicito');
      Exigir(not OrigenSecuenciaRemoto(IniPath,2,'QA01'),'otra empresa sigue LOCAL');
      S.LoadFromFile('C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UDatModConectar.dfm');
      DB.DatabaseName := 'localhost:C:\Proyectos\Datos\Repositorio\PuntoVenta\IDESISRL\DBDATOSIDESISRL.FDB';
      DB.LoginPrompt := False;
      DB.SQLDialect := 1;
      DB.Params.Values['user_name'] := ParametroDfm(S.Text, 'user_name');
      DB.Params.Values['password'] := ParametroDfm(S.Text, 'password');
      S.Clear;
      DB.Connected := True;
      CreateGUID(G);
      Doc := 'QA-CP5-' + Copy(GUIDToString(G),2,36);
      Id := PrepararSolicitudSecuencia(DB,'000000000','QA01',Doc,'E31');
      Id2 := PrepararSolicitudSecuencia(DB,'000000000','QA01',Doc,'E31');
      Exigir(Id=Id2,'identidad durable estable');
      Conflicto := False;
      try
        PrepararSolicitudSecuencia(DB,'000000000','QA01',Doc,'E32');
      except
        Conflicto := True;
      end;
      Exigir(Conflicto,'tipo solicitado inmutable');
      Tx.DefaultDatabase := DB;
      Tx.Params.Add('read_committed');
      Tx.Params.Add('rec_version');
      Q.Database := DB;
      Q.Transaction := Tx;
      Tx.StartTransaction;
      VincularVentaSecuenciaEnTransaccion(DB,Tx,Id,2147483000);
      Tx.Rollback;
      Tx.StartTransaction;
      Q.SQL.Text := 'SELECT NUMERO_TRN FROM ECF_SEC_SOLICITUD WHERE REQUEST_ID=:I';
      Q.ParamByName('I').AsString := Id;
      Q.Open;
      Exigir(Q.FieldByName('NUMERO_TRN').IsNull,'vinculo revierte con transaccion');
      Q.Close;
      Tx.Rollback;
      R.HttpStatus := 200;
      R.Resultado := 'ASIGNADO';
      R.RequestId := Id;
      R.ReservaId := '9999999901';
      R.LoteId := '9999999901';
      R.Correlativo := '9999999901';
      R.ENcf := 'E319999999901';
      R.FechaVence := EncodeDate(2026,12,31);
      GuardarReservaSecuencia(DB,R);
      GuardarReservaSecuencia(DB,R);
      WriteLn('PASS guardado repetido de misma reserva');
      R.ENcf := 'E319999999902';
      Conflicto := False;
      try GuardarReservaSecuencia(DB,R); except Conflicto := True; end;
      Exigir(Conflicto,'rechazo de sustitucion de reserva');
      WriteLn('CP5_COLA_QA=PASS');
    except
      WriteLn('CP5_COLA_QA=FAIL');
      ExitCode := 1;
    end;
  finally
    if Tx.InTransaction then Tx.Rollback;
    Q.Close;
    if DB.Connected and (Id <> '') then
    begin
      Tx.StartTransaction;
      Q.SQL.Text := 'DELETE FROM ECF_SEC_SOLICITUD WHERE REQUEST_ID=:I AND DOCUMENTO_CLAVE=:D';
      Q.ParamByName('I').AsString := Id;
      Q.ParamByName('D').AsString := Doc;
      Q.ExecSQL;
      Tx.Commit;
      WriteLn('LIMPIEZA_QA=OK');
    end;
    S.Free;
    Q.Free;
    Tx.Free;
    DB.Free;
    if IniCreado and FileExists(IniPath) then DeleteFile(IniPath);
  end;
end.
