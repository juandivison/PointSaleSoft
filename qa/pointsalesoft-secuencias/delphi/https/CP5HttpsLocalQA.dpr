program CP5HttpsLocalQA;
{$APPTYPE CONSOLE}
uses SysUtils, Classes, IBDatabase, IBQuery,
  UEcfSecuenciaRemota, UEcfSecuenciaCola, UEcfSecuenciaVenta;
function DfmValue(const S,N: string): string;
var P,F: Integer;
begin
  P:=Pos(N+'=',S);
  if P=0 then raise Exception.Create('Configuracion local ausente.');
  Inc(P,Length(N)+1); F:=P;
  while (F<=Length(S)) and (S[F]<>#39) do Inc(F);
  Result:=Copy(S,P,F-P);
end;
procedure Check(B:Boolean;const N:string);
begin
  if not B then raise Exception.Create(N);
  WriteLn('PASS ',N);
end;
var DB:TIBDatabase;Tx:TIBTransaction;Q:TIBQuery;S:TStringList;G:TGUID;
  Doc,Id1,Id2,MissingIni:string;R,Cached:TRespuestaSecuencia;
  Serie1,Serie2:Integer;Conflict:Boolean;Stage:string;
begin
  DB:=TIBDatabase.Create(nil);Tx:=TIBTransaction.Create(nil);
  Q:=TIBQuery.Create(nil);S:=TStringList.Create;
  Id1:='';Id2:='';Stage:='conexion';
  try
    try
      S.LoadFromFile('C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UDatModConectar.dfm');
      DB.DatabaseName:='localhost:C:\Proyectos\Datos\Repositorio\PuntoVenta\IDESISRL\DBDATOSIDESISRL.FDB';
      DB.SQLDialect:=1;DB.LoginPrompt:=False;
      DB.Params.Values['user_name']:=DfmValue(S.Text,'user_name');
      DB.Params.Values['password']:=DfmValue(S.Text,'password');
      S.Clear;DB.Connected:=True;
      Tx.DefaultDatabase:=DB;Tx.Params.Add('read_committed');Tx.Params.Add('rec_version');
      Q.Database:=DB;Q.Transaction:=Tx;
      CreateGUID(G);Doc:='QA-HTTPS-'+Copy(GUIDToString(G),2,36);
      Stage:='preparar';Id1:=PrepararSolicitudSecuencia(DB,'000000000','QA01',Doc,'E31');
      R.HttpStatus:=200;R.Resultado:='ASIGNADO';R.RequestId:=Id1;
      R.ReservaId:='9999999901';R.LoteId:='9999999901';
      R.Correlativo:='9999999901';R.ENcf:='E319999999901';R.FechaVence:=Date+30;
      GuardarReservaSecuencia(DB,R);
      Stage:='registro_ncf';
      Serie1:=RegistrarNcfSecuenciaVenta(DB,R,Date,0,0,1);
      Serie2:=RegistrarNcfSecuenciaVenta(DB,R,Date,0,0,1);
      Check((Serie1>0) and (Serie1=Serie2),'registro NCF local idempotente');
      Conflict:=False;
      try RegistrarNcfSecuenciaVenta(DB,R,Date,0,0,2);except Conflict:=True;end;
      Check(Conflict,'monto alterado no sustituye registro');
      MissingIni:=ExtractFilePath(ParamStr(0))+'QA_HTTPS_SIN_TOKEN.ini';
      if FileExists(MissingIni) then raise Exception.Create('INI QA inesperado.');
      Stage:='recuperacion';
      Cached:=ObtenerReservaSecuenciaVenta(DB,MissingIni,1,'QA01',Id1);
      Check((Cached.Resultado='MISMA_RESERVA') and (Cached.ENcf=R.ENcf)
        and (Cached.FechaVence=R.FechaVence),'reserva local recuperada sin credencial ni red');
      Id2:=PrepararSolicitudSecuencia(DB,'000000000','QA01',Doc+'-P','E31');
      Stage:='sin_token';
      Cached:=ObtenerReservaSecuenciaVenta(DB,MissingIni,1,'QA01',Id2);
      Check((Cached.Resultado='NO_DISPONIBLE') and (Cached.RequestId=Id2)
        and (Cached.ENcf=''),'falta de credencial conserva solicitud pendiente');
      Tx.StartTransaction;
      Q.SQL.Text:='SELECT ESTADO,ENCF FROM ECF_SEC_SOLICITUD WHERE REQUEST_ID=:I';
      Q.ParamByName('I').AsString:=Id2;Q.Open;
      Check((Q.FieldByName('ESTADO').AsString='PENDIENTE_CONCILIACION')
        and Q.FieldByName('ENCF').IsNull,'sin NCF inventado en cola');
      Q.Close;Tx.Rollback;
      WriteLn('CP5_HTTPS_LOCAL_QA=PASS');
    except on E:Exception do
      begin WriteLn('CP5_HTTPS_LOCAL_QA=FAIL ETAPA=',Stage,' CLASE=',E.ClassName);ExitCode:=1;end;
    end;
  finally
    Q.Close;if Tx.InTransaction then Tx.Rollback;
    if DB.Connected and (Id1<>'') then
    begin
      Tx.StartTransaction;
      Q.SQL.Text:='DELETE FROM NCF_ASIGNADOS WHERE SERIE IN '+
        '(SELECT SERIE_NCF_LOCAL FROM ECF_SEC_SOLICITUD WHERE REQUEST_ID=:I AND DOCUMENTO_CLAVE=:D)';
      Q.ParamByName('I').AsString:=Id1;Q.ParamByName('D').AsString:=Doc;Q.ExecSQL;
      Q.Close;Q.SQL.Text:='DELETE FROM ECF_SEC_SOLICITUD WHERE REQUEST_ID=:I AND DOCUMENTO_CLAVE=:D';
      Q.ParamByName('I').AsString:=Id1;Q.ParamByName('D').AsString:=Doc;Q.ExecSQL;
      if Id2<>'' then
      begin
        Q.ParamByName('I').AsString:=Id2;Q.ParamByName('D').AsString:=Doc+'-P';Q.ExecSQL;
      end;
      Tx.Commit;WriteLn('LIMPIEZA_HTTPS_QA=OK');
    end;
    S.Free;Q.Free;Tx.Free;DB.Free;
  end;
end.
