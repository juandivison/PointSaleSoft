program QANormal;
{$APPTYPE CONSOLE}
uses SysUtils,Classes,IBDatabase,IBQuery,UEcfEnvioGastos,UUtilecfGastos,
 UDatModConectar in '..\..\Integracion-IDESI-PointSaleSoft\TestSupport\UDatModConectar.pas',UEcfGastoPrintData;
var D:TIBDatabase;T:TIBTransaction;Q:TIBQuery;L:TStringList;R:TGastoEcfCliResult;P:TEcfGastoPrintData;
 Msg,Fixture,Flag:string;N:Integer;
function Valor(const S,K:string):string;var A,B:Integer;
begin A:=Pos(K+'=',S)+Length(K)+1;B:=A;while(B<=Length(S))and(S[B]<>#39)do Inc(B);Result:=Copy(S,A,B-A);end;
procedure Check(B:Boolean;const S:string);begin if not B then raise Exception.Create(S);Inc(N);WriteLn('PASS ',S);end;
procedure Open(const Sql:string);begin Q.Close;if not T.InTransaction then T.StartTransaction;Q.SQL.Text:=Sql;Q.Open;end;
begin
try
 D:=TIBDatabase.Create(nil);T:=TIBTransaction.Create(nil);Q:=TIBQuery.Create(nil);L:=TStringList.Create;dmConectar:=TdmConectar.Create;N:=0;
 try
  Fixture:=ExpandFileName(ParamStr(2));Flag:=ExtractFilePath(Fixture)+'sin-timbre.flag';
  L.LoadFromFile(GetEnvironmentVariable('PSS_TEST_DFM'));
  D.DatabaseName:='localhost:'+ParamStr(1);D.SQLDialect:=1;D.LoginPrompt:=False;
  D.Params.Values['user_name']:=Valor(L.Text,'user_name');D.Params.Values['password']:=Valor(L.Text,'password');L.Clear;D.Connected:=True;
  T.DefaultDatabase:=D;T.Params.Add('read_committed');T.Params.Add('rec_version');Q.Database:=D;Q.Transaction:=T;
  dmConectar.IBDatabase1:=D;dmConectar.IBTransaction1:=T;
  Check(ProcesarEnvioEcfGasto(D,Fixture,9001,R,Msg,False),'ruta normal sin TXT ni XML');
  Check(R.TieneTimbre and(R.Timbre.CodigoSeguridad='QASIGN'),'D7GT leido del SDK corregido');
  Open('SELECT * FROM ECF_GASTO_ENVIO WHERE TRN=9001');
  Check(not Q.Eof,'historial de gastos creado');
  Check(Q.FieldByName('CODIGO_SEGURIDAD').AsString='QASIGN','codigo guardado en Firebird');
  Check(not Q.FieldByName('FECHA_FIRMA').IsNull,'firma guardada');
  Check(not Q.FieldByName('FECHA_EMISION').IsNull,'emision guardada');
  Check(Q.FieldByName('MONTO_TOTAL').AsCurrency=1180,'total guardado');
  Check(Q.FieldByName('URL_IMAGE').AsString='https://example.invalid/timbre','URL guardada');
  Check(Q.FieldByName('XML_FIRMADO').IsNull,'XML desmarcado no requerido para timbre');Q.Close;T.Rollback;
  Open('SELECT * FROM ECF_RESERVA WHERE NCF=''E419999999991''');Check(Q.FieldByName('CODIGO_SEGURIDAD').AsString='QASIGN','reserva de gastos actualizada');Q.Close;T.Rollback;
  P:=TEcfGastoPrintData.Create;
  try P.Cargar(9001);Check(P.EsAceptado,'impresion lee aceptado');Check(P.Master.FieldByName('CODIGO_SEGURIDAD').AsString='QASIGN','impresion recibe timbre Firebird');finally P.Free;if T.InTransaction then T.Rollback;end;
  Check(ProcesarEnvioEcfGasto(D,Fixture,9002,R,Msg,False),'E43 por ruta normal');
  Open('SELECT CODIGO_SEGURIDAD FROM ECF_GASTO_ENVIO WHERE TRN=9002');Check(Q.FieldByName('CODIGO_SEGURIDAD').AsString='QASIGN','E43 timbre persistido');Q.Close;T.Rollback;
  Check(not ProcesarEnvioEcfGasto(D,Fixture,9003,R,Msg,False),'otro eNCF se rechaza');
  Open('SELECT ESTADO FROM ECF_RESERVA WHERE NCF=''E419999999993''');Check(Q.FieldByName('ESTADO').AsString='RESERVADO','rechazo no altera reserva');Q.Close;T.Rollback;
  L.SaveToFile(Flag);
  try Check(ProcesarEnvioEcfGasto(D,Fixture,9001,R,Msg,False),'resultado sin timbre procesado');finally DeleteFile(Flag);end;
  Open('SELECT CODIGO_SEGURIDAD FROM ECF_GASTO_ENVIO WHERE TRN=9001');Check(Q.FieldByName('CODIGO_SEGURIDAD').AsString='QASIGN','resultado incompleto conserva timbre anterior');Q.Close;T.Rollback;
  WriteLn('NORMAL_FIREBIRD_IMPRESION=PASS; CASOS=',N,'; HTTP=0; EMISION_FISCAL=0');
 finally if T.InTransaction then T.Rollback;Q.Free;T.Free;D.Free;L.Free;dmConectar.Free;dmConectar:=nil;end;
except on E:Exception do begin WriteLn('FAIL ',E.Message);Halt(1);end;end;
end.
