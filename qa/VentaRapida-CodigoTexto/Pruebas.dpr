program Pruebas;
{$APPTYPE CONSOLE}
uses SysUtils,Classes,DB,IBDatabase,IBQuery,IBSQL,FuentePrueba;
type TContador=class public Aperturas:Integer;procedure Abierto(D:TDataSet);end;
procedure TContador.Abierto(D:TDataSet);begin Inc(Aperturas);end;
var D:TIBDatabase;T:TIBTransaction;X:TIBSQL;F:TfrmProcVentaRapida;C:TContador;L:TStringList;N:Integer;
procedure Check(B:Boolean;const S:string);begin if not B then raise Exception.Create(S);Inc(N);WriteLn('PASS ',S);end;
function Cred(const S,K:string):string;var A,B:Integer;
begin A:=Pos(K+'=',S)+Length(K)+1;B:=A;while(B<=Length(S))and(S[B]<>#39)do Inc(B);Result:=Copy(S,A,B-A);end;
procedure Sql(const S:string);begin X.SQL.Text:=S;X.ExecQuery;X.Close;end;
begin
try
 Check(UsarCodigoTextoFerreteria(1,'F12'),'letra seguida de numero activa codigo texto');
 Check(UsarCodigoTextoFerreteria(1,'f12'),'letra minuscula activa codigo texto');
 Check(UsarCodigoTextoFerreteria(1,'P7'),'no limita regla al prefijo F');
 Check(not UsarCodigoTextoFerreteria(0,'F12'),'otros clientes conservan regla');
 Check(not UsarCodigoTextoFerreteria(2,'F12'),'solo modo igual a uno');
 Check(not UsarCodigoTextoFerreteria(1,'123'),'numeros conservan regla');
 Check(not UsarCodigoTextoFerreteria(1,'TALADRO'),'palabras conservan regla');
 Check(not UsarCodigoTextoFerreteria(1,'FF12'),'dos letras iniciales no activan regla');
 Check(not UsarCodigoTextoFerreteria(1,'1F'),'numero inicial no activa regla');
 Check(not UsarCodigoTextoFerreteria(1,'F'),'letra sola conserva regla');
 Check(not UsarCodigoTextoFerreteria(1,''),'vacio no accede fuera de rango');
 Check(not UsarCodigoTextoFerreteria(1,'F-1'),'letra y separador no activan regla');
 D:=TIBDatabase.Create(nil);T:=TIBTransaction.Create(nil);X:=TIBSQL.Create(nil);F:=TfrmProcVentaRapida.Create;C:=TContador.Create;L:=TStringList.Create;
 try
  L.LoadFromFile(GetEnvironmentVariable('PSS_TEST_DFM'));
  D.DatabaseName:='localhost:'+ParamStr(1);D.SQLDialect:=1;D.LoginPrompt:=False;
  D.Params.Values['user_name']:=Cred(L.Text,'user_name');D.Params.Values['password']:=Cred(L.Text,'password');D.Connected:=True;
  T.DefaultDatabase:=D;T.StartTransaction;X.Database:=D;X.Transaction:=T;X.ParamCheck:=False;
  Sql('CREATE TABLE PRODUCTOS(CIA_KEY INTEGER,CODIGO INTEGER,TIPO INTEGER,DESCRIPCION VARCHAR(60),REFERENCIA VARCHAR(20),CODIGO_TEXTO VARCHAR(30))');
  Sql('CREATE TABLE TIPO_INVENTARIO(CODIGO INTEGER PRIMARY KEY,DESCRIPCION VARCHAR(60))');
  T.Commit;T.StartTransaction;
  Sql('INSERT INTO TIPO_INVENTARIO VALUES(1,''HERRAMIENTAS'')');
  Sql('INSERT INTO PRODUCTOS VALUES(1,1,1,''TALADRO'',''QA'',''F123'')');
  Sql('INSERT INTO PRODUCTOS VALUES(1,2,1,''CLAVO'',''QA'',''F129'')');
  Sql('INSERT INTO PRODUCTOS VALUES(1,3,1,''F12 EN DESCRIPCION'',''QA'',''X991'')');
  Sql('INSERT INTO PRODUCTOS VALUES(1,4,1,''OTRO PREFIJO'',''QA'',''AF123'')');
  Sql('INSERT INTO PRODUCTOS VALUES(2,5,1,''OTRA EMPRESA'',''QA'',''F125'')');
  Sql('CREATE PROCEDURE PROC_INV_VENTA(DIVISION INTEGER) RETURNS(CIA_KEY INTEGER,CODIGO INTEGER,TIPO INTEGER,DESCRIPCION VARCHAR(60),REFERENCIA VARCHAR(20),CODIGO_TEXTO VARCHAR(30)) AS ' +
    'BEGIN FOR SELECT CIA_KEY,CODIGO,TIPO,DESCRIPCION,REFERENCIA,CODIGO_TEXTO FROM PRODUCTOS INTO :CIA_KEY,:CODIGO,:TIPO,:DESCRIPCION,:REFERENCIA,:CODIGO_TEXTO DO SUSPEND;END');
  Sql('CREATE PROCEDURE PROC_INV_VENTA_EST(DIVISION INTEGER) RETURNS(CIA_KEY INTEGER,CODIGO INTEGER,TIPO INTEGER,DESCRIPCION VARCHAR(60),REFERENCIA VARCHAR(20),CODIGO_TEXTO VARCHAR(30)) AS ' +
    'BEGIN FOR SELECT CIA_KEY,CODIGO,TIPO,DESCRIPCION,REFERENCIA,CODIGO_TEXTO FROM PRODUCTOS INTO :CIA_KEY,:CODIGO,:TIPO,:DESCRIPCION,:REFERENCIA,:CODIGO_TEXTO DO SUSPEND;END');
  T.Commit;T.StartTransaction;
  F.qryProductos:=TIBQuery.Create(nil);F.qryProductos.Database:=D;F.qryProductos.Transaction:=T;F.qryProductos.AfterOpen:=C.Abierto;F.Label64:=TEtiqueta.Create;
  GlbFerreteria:=1;GlbCodDivInventario:=2;glbCia_Key:=1;
  C.Aperturas:=0;F.AsignarSqlText('CODIGO_TEXTO','F12','');
  Check(F.qryProductos.RecordCount=2,'filtra solo prefijo codigo texto y empresa');
  Check(C.Aperturas=1,'una consulta por prefijo sin busqueda previa');
  Check(F.qryProductos.Locate('CODIGO_TEXTO','f12',[loCaseInsensitive,loPartialKey]),'localizacion acepta minusculas y prefijo');
  Check(F.qryProductos.ParamByName('CODIGOTEXTO').AsString='F12','prefijo como parametro');
  C.Aperturas:=0;F.AsignarSqlText('CODIGO_TEXTO','Z999','');
  Check(F.qryProductos.IsEmpty,'sin resultados no recurre a descripcion');
  Check(C.Aperturas=1,'sin resultados no repite consulta');
  F.AsignarSqlText('CODIGO_TEXTO','F12%','');Check(F.qryProductos.IsEmpty,'porcentaje es literal');
  F.AsignarSqlText('CODIGO_TEXTO','F12''','');Check(F.qryProductos.IsEmpty,'comilla no altera SQL');
  GlbCodDivInventario:=1;F.AsignarSqlText('CODIGO_TEXTO','F12','');Check(F.qryProductos.RecordCount=2,'almacen principal conserva procedimiento');
  F.AsignarSqlText('','','');Check(F.qryProductos.RecordCount=4,'consulta general conserva productos de empresa');
  F.AsignarSqlText('Descripcion',QuotedStr('%TALADRO%'),'');Check(F.qryProductos.RecordCount=1,'ruta descripcion conserva consulta actual');
  F.AsignarSqlText('Descripcion',QuotedStr('%F129%'),'');Check(F.qryProductos.RecordCount=1,'ruta anterior conserva respaldo codigo texto');
  F.qryProductos.Close;T.Rollback;
  WriteLn('BUSQUEDA_CODIGO_TEXTO=PASS; CHECKS=',N,'; BASE_COMERCIAL=0');
 finally F.qryProductos.Free;F.Label64.Free;F.Free;C.Free;L.Free;X.Free;T.Free;D.Free;end;
except on E:Exception do begin WriteLn('FAIL ',E.Message);Halt(1);end;end;
end.
