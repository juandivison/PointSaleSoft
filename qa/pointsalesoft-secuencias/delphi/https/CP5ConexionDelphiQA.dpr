program CP5ConexionDelphiQA;
{$APPTYPE CONSOLE}
uses SysUtils, Classes, IniFiles, ActiveX, IBDatabase, IBQuery,
  UEcfSecuenciaRemota, UEcfSecuenciaCola, UEcfSecuenciaVenta,
  UEcfApiCredencialesIni;

function DfmValue(const S,N:string):string;
var P,F:Integer;
begin
  P:=Pos(N+'=',S);
  if P=0 then raise Exception.Create('CONFIG_LOCAL');
  Inc(P,Length(N)+1);F:=P;
  while (F<=Length(S)) and (S[F]<>#39) do Inc(F);
  Result:=Copy(S,P,F-P);
end;

procedure Mostrar(const R:TRespuestaSecuencia);
begin
  Write('{"resultado":"',R.Resultado,'","request_id":"',R.RequestId,
    '","reserva_id":"',R.ReservaId,'","lote_id":"',R.LoteId,
    '","correlativo":"',R.Correlativo,'","encf":"',R.ENcf,'","fecha_vence":"');
  if R.FechaVence>0 then Write(FormatDateTime('yyyy"-"mm"-"dd',R.FechaVence));
  WriteLn('"}');
end;

procedure Validar(const R:TRespuestaSecuencia);
begin
  if (R.HttpStatus<>200) or
     ((R.Resultado<>'ASIGNADO') and (R.Resultado<>'MISMA_RESERVA')) or
     (R.ENcf='') or (R.FechaVence<=0) then
    raise Exception.Create('RESPUESTA_NO_CONFIRMADA');
end;

var DB:TIBDatabase;Tx:TIBTransaction;Q:TIBQuery;S:TStringList;Ini:TIniFile;
  Rnc,Sucursal,Doc,Id,IniPath,Section,Token,Url,Stage:string;
  Primero,Segundo,Tercero:TRespuestaSecuencia;
begin
  if CoInitialize(nil) < 0 then
  begin
    WriteLn('CP5_HTTPS_DELPHI_QA=FAIL ETAPA=INICIAR_COM');
    Halt(1);
  end;
  DB:=TIBDatabase.Create(nil);Tx:=TIBTransaction.Create(nil);
  Q:=TIBQuery.Create(nil);S:=TStringList.Create;
  Stage:='CONFIG_LOCAL';
  try
    try
      IniPath:='C:\Proyectos\PointSaleSoftResp\PuntoVenta\Bin\Idesi\repconf_cr.ini';
      if ParamCount>0 then IniPath:=ExpandFileName(ParamStr(1));
      S.LoadFromFile('C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes\UDatModConectar.dfm');
      DB.DatabaseName:='localhost:C:\Proyectos\Datos\Repositorio\PuntoVenta\IDESISRL\DBDATOSIDESISRL.FDB';
      DB.SQLDialect:=1;DB.LoginPrompt:=False;
      DB.Params.Values['user_name']:=DfmValue(S.Text,'user_name');
      DB.Params.Values['password']:=DfmValue(S.Text,'password');
      S.Clear;
      Stage:='FIREBIRD_QA';
      DB.Connected:=True;
      Tx.DefaultDatabase:=DB;Tx.Params.Add('read_committed');Tx.Params.Add('rec_version');
      Q.Database:=DB;Q.Transaction:=Tx;Tx.StartTransaction;
      Q.SQL.Text:='SELECT RNC_NUMERO,NUM_SUCURSAL FROM COMPANIA WHERE CODIGO=1';
      Q.Open;
      if Q.Eof then raise Exception.Create('EMPRESA_QA_NO_ENCONTRADA');
      Rnc:=Trim(Q.FieldByName('RNC_NUMERO').AsString);
      Sucursal:=Trim(Q.FieldByName('NUM_SUCURSAL').AsString);
      if Sucursal='' then Sucursal:='0001';
      Q.Close;Tx.Commit;
      Section:='ECF_SECUENCIA_1_'+Sucursal;
      Ini:=TIniFile.Create(IniPath);
      try
        if Ini.ReadString(Section,'Ambiente','')<>'TEST' then
          raise Exception.Create('SE_REQUIERE_TEST');
        Url:=Ini.ReadString(Section,'Url','');
        Stage:='DPAPI';
        Token:=DescifrarDPAPI(Ini.ReadString(Section,'TokenProtected_E31',''),Section+'_E31');
      finally Ini.Free;end;
      Doc:='QA-DELPHI-HTTPS-E31';
      Stage:='IDENTIDAD_DURABLE';
      Id:=PrepararSolicitudSecuencia(DB,Rnc,Sucursal,Doc,'E31');
      WriteLn('REQUEST_ID=',Id);
      Stage:='RESERVAR_HTTPS';
      Primero:=ObtenerReservaSecuenciaVenta(DB,IniPath,1,Sucursal,Id);
      Mostrar(Primero);Validar(Primero);
      Stage:='RECUPERAR_LOCAL';
      Segundo:=ObtenerReservaSecuenciaVenta(DB,IniPath,1,Sucursal,Id);
      Mostrar(Segundo);Validar(Segundo);
      Stage:='CONSULTAR_HTTPS';
      Tercero:=SolicitarSecuenciaTest(Url,Token,Id,Doc,Rnc,Sucursal,'E31',True);
      Token:='';
      Mostrar(Tercero);Validar(Tercero);
      if (Primero.ReservaId<>Segundo.ReservaId) or (Primero.ReservaId<>Tercero.ReservaId) or
         (Primero.ENcf<>Segundo.ENcf) or (Primero.ENcf<>Tercero.ENcf) or
         (Primero.FechaVence<>Segundo.FechaVence) or (Primero.FechaVence<>Tercero.FechaVence) then
        raise Exception.Create('RESERVAS_DIFERENTES');
      WriteLn('CP5_HTTPS_DELPHI_QA=PASS');
      WriteLn('La solicitud sintetica se conserva para conciliacion y reintentos.');
    except on E:Exception do
      begin
        WriteLn('CP5_HTTPS_DELPHI_QA=FAIL ETAPA=',Stage);
        WriteLn('Repetir este ejecutable conserva la misma identidad de documento.');
        ExitCode:=1;
      end;
    end;
  finally
    Token:='';
    Q.Close;if Tx.InTransaction then Tx.Rollback;
    S.Free;Q.Free;Tx.Free;DB.Free;
    CoUninitialize;
  end;
end.

