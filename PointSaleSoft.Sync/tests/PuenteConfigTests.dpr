program PuenteConfigTests;
{$APPTYPE CONSOLE}
uses SysUtils, IniFiles, IBDatabase, IBQuery, UPuenteCatalogoConfig;
var Checks: Integer; IniPath: string; DB: TIBDatabase; Tx: TIBTransaction; Q: TIBQuery;
procedure Check(Ok: Boolean; const Name: string);
begin
  if not Ok then raise Exception.Create(Name);
  Inc(Checks); Writeln('PASS ',Name);
end;
procedure Mode(const Value: string);
var Ini: TIniFile;
begin
  Ini:=TIniFile.Create(IniPath);
  try Ini.WriteString('CATALOGO_SYNC','Modo',Value); finally Ini.Free; end;
end;
procedure VerifyDatabase(const VariableName: string);
var Rejected: Boolean;
begin
  DB.DatabaseName:='localhost:'+GetEnvironmentVariable(VariableName);
  DB.Connected:=True;
  try
    VerificarPuenteCatalogo(DB,Tx);
    Check(True,'PUENTE acepta base lista '+VariableName);
    Tx.Rollback;
    Tx.StartTransaction;
    Q.SQL.Text:='UPDATE PSSYNC_META SET READY=0 WHERE ID=1';Q.ExecSQL;
    Rejected:=False;
    try VerificarPuenteCatalogo(DB,Tx); except on E: Exception do Rejected:=True; end;
    Check(Rejected,'PUENTE rechaza carga incompleta');Tx.Rollback;
    Tx.StartTransaction;
    Q.SQL.Text:='UPDATE PSSYNC_META SET NODE_ROLE=''otro'' WHERE ID=1';Q.ExecSQL;
    Rejected:=False;
    try VerificarPuenteCatalogo(DB,Tx); except on E: Exception do Rejected:=True; end;
    Check(Rejected,'PUENTE rechaza rol ajeno');Tx.Rollback;
  finally
    if Tx.InTransaction then Tx.Rollback;
    DB.Connected:=False;
  end;
end;
var Rejected: Boolean;
begin
  IniPath:=ExtractFilePath(ParamStr(0))+'repconf_cr.ini';
  try
    if FileExists(IniPath) then raise Exception.Create('Use directorio QA sin INI previo');
    Check(not PuenteCatalogoActivo,'sin INI usa DIRECTO');
    VerificarPuenteCatalogo(nil,nil);Check(True,'DIRECTO no requiere base puente');
    Mode('DIRECTO');Check(not PuenteCatalogoActivo,'DIRECTO explicito');
    Mode(' puente ');Check(PuenteCatalogoActivo,'PUENTE admite espacios y minusculas');
    Mode('error');Rejected:=False;
    try PuenteCatalogoActivo; except on E: Exception do Rejected:=True; end;
    Check(Rejected,'modo invalido rechaza guardado');
    Mode('PUENTE');
    DB:=TIBDatabase.Create(nil);Tx:=TIBTransaction.Create(nil);Q:=TIBQuery.Create(nil);
    try
      DB.LoginPrompt:=False;DB.Params.Values['user_name']:=GetEnvironmentVariable('ISC_USER');
      DB.Params.Values['password']:=GetEnvironmentVariable('ISC_PASSWORD');DB.Params.Values['lc_ctype']:='ISO8859_1';
      DB.SQLDialect:=1;DB.DefaultTransaction:=Tx;Tx.DefaultDatabase:=DB;
      Q.Database:=DB;Q.Transaction:=Tx;
      VerifyDatabase('PSSYNC_TEST_MAIN');VerifyDatabase('PSSYNC_TEST_BRANCH');
    finally Q.Free;Tx.Free;DB.Free; end;
    DeleteFile(IniPath);Writeln('DELPHI_TOGGLE=PASS; CHECKS=',Checks);
  except
    on E: Exception do begin DeleteFile(IniPath);Writeln('DELPHI_TOGGLE_FAILED ',E.ClassName);Halt(1);end;
  end;
end.
