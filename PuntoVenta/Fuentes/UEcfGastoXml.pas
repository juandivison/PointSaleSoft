unit UEcfGastoXml;
interface
uses IBDatabase;
function DescargarXmlFirmadoGasto(ADB:TIBDatabase; Tx:TIBTransaction;
 ATrn:Integer;const AExe:string;APermitido:Boolean;out AMensaje:string):Boolean;
implementation
uses Windows,SysUtils,Classes,DB,IBQuery,UEcfCanalConfig,UEcfApiIntento,
 UEcfApiIntentoGasto,UEcfApiClienteV1,UEcfApiGastoArtefactos,UUtilecf;
function DescargarXmlFirmadoGasto(ADB:TIBDatabase; Tx:TIBTransaction;
 ATrn:Integer;const AExe:string;APermitido:Boolean;out AMensaje:string):Boolean;
var Q:TIBQuery;T:TIBTransaction;Inicio,Hay:Boolean;Cia:Integer;
 Rnc,ENcf,Ini,Destino,S,Salida:string;C:TEcfCanalConfiguracion;
 I:TEcfApiIntento;R:TEcfApiRespuestaV1;Timbre:TTimbreApi;
 L:TStringList;F:TFileStream;Bytes:AnsiString;Codigo:DWORD;
begin
 Result:=False;Cia:=0;AMensaje:='Descarga de XML desactivada.';
 if not APermitido then Exit;
 try
  if (ADB=nil) or (Tx=nil) or not ADB.Connected then
   raise Exception.Create('Conexion del gasto no disponible.');
  Inicio:=not Tx.InTransaction;
  if Inicio then Tx.StartTransaction;
  Q:=TIBQuery.Create(nil);
  try
   Q.Database:=ADB;Q.Transaction:=Tx;
   Q.SQL.Text:='SELECT M.CIA_KEY,M.ECF,C.RNC_NUMERO FROM TRANS_OPERACION_MASTER M '+
    'JOIN COMPANIA C ON C.CODIGO=M.CIA_KEY WHERE M.NUMERO=:N';
   Q.ParamByName('N').AsInteger:=ATrn;Q.Open;
   if Q.Eof then raise Exception.Create('No existe el gasto guardado.');
   Cia:=Q.FieldByName('CIA_KEY').AsInteger;ENcf:=Trim(Q.FieldByName('ECF').AsString);
   Rnc:=Trim(Q.FieldByName('RNC_NUMERO').AsString);Q.Close;
   if (Length(ENcf)<>13) or ((Copy(ENcf,1,3)<>'E41') and (Copy(ENcf,1,3)<>'E43')) then
    raise Exception.Create('El gasto no tiene un e-NCF E41/E43 reservado.');
   C:=CargarConfiguracionCanalEcf(ADB,Tx,Rnc);
   Q.SQL.Text:='SELECT RDB$RELATION_NAME FROM RDB$RELATIONS '+
    'WHERE RDB$RELATION_NAME=''ECF_API_GASTO_INTENTO''';Q.Open;Hay:=not Q.Eof;Q.Close;
   if Hay then Hay:=CargarIntentoApiPorGasto(ADB,Rnc,ATrn,I);
   S:='';
   if Hay then begin
    if I.ENcf<>ENcf then raise Exception.Create('El intento corresponde a otro e-NCF.');
    C.Canal:=ceIdesiApi;C.RncEmisor:=I.RncEmisor;
    if I.Ambiente='TEST' then C.Ambiente:=aeTest
    else if I.Ambiente='PROD' then C.Ambiente:=aeProd
    else raise Exception.Create('Ambiente del intento invalido.');
    C.BaseUrl:=I.BaseUrl;C.ClientId:=I.ClientId;
    S:=CampoJson(I.RequestUtf8,'totalAmount');
   end;
   if S='' then begin
    Q.SQL.Text:='SELECT FIRST 1 MONTO_TOTAL FROM ECF_GASTO_ENVIO '+
     'WHERE CIA_KEY=:C AND TRN=:N AND ENCF=:E ORDER BY ID DESC';
    Q.ParamByName('C').AsInteger:=Cia;Q.ParamByName('N').AsInteger:=ATrn;
    Q.ParamByName('E').AsString:=ENcf;Q.Open;
    if Q.Eof or Q.FieldByName('MONTO_TOTAL').IsNull then
     raise Exception.Create('Consulte el resultado del envio antes de descargar el XML.');
    Timbre.Monto:=Q.FieldByName('MONTO_TOTAL').AsCurrency;Q.Close;
   end else Timbre.Monto:=MontoFiscal(S);
  finally Q.Free;if Inicio and Tx.InTransaction then Tx.Rollback;end;
  Timbre.Rnc:=Rnc;Timbre.ENcf:=ENcf;
  Ini:=IncludeTrailingPathDelimiter(ExtractFilePath(ExpandFileName(AExe)))+'repconf_cr.ini';
  if C.Canal=ceIdesiApi then begin
   C:=ResolverConfiguracionIdesiIni(C,Ini);
   R:=DescargarXmlFirmadoIdesiV1(C,Ini,ENcf);
   if R.StatusCode<>200 then raise Exception.Create('XML firmado no disponible. HTTP '+IntToStr(R.StatusCode)+'.');
   Bytes:=R.BodyBytes;
   Destino:=XmlDestino(Ini,NombreAmbienteEcf(C.Ambiente),Rnc,ENcf);
  end else begin
   if not ExecAndCapture('"'+AExe+'" --gasto-recover "'+ENcf+'" --xml-firmado=1 --rnc-esperado='+Rnc,ExtractFilePath(AExe),Salida,Codigo) then
    raise Exception.Create('No se pudo consultar el XML firmado: '+Salida);
   L:=TStringList.Create;
   try
    L.Text:=Salida;
    if (Trim(L.Values['RNC'])<>Rnc) or (Trim(L.Values['ENCF'])<>ENcf) then
     raise Exception.Create('La recuperacion no corresponde al emisor y e-NCF seleccionados.');
    S:=Trim(L.Values['XmlFirmado']);
    if not FileExists(S) then raise Exception.Create('XML firmado no disponible. '+L.Values['Mensajes']);
    F:=TFileStream.Create(S,fmOpenRead or fmShareDenyWrite);
    try SetLength(Bytes,F.Size);if Length(Bytes)>0 then F.ReadBuffer(Bytes[1],Length(Bytes));finally F.Free;end;
   finally L.Free;end;
   Destino:=XmlDestino(Ini,'ASLAN',Rnc,ENcf);
  end;
  { El guardado valida firma, emisor, e-NCF y total sin transformar los bytes. }
  GuardarXmlFirmado(Destino,Bytes,Timbre);
  T:=TIBTransaction.Create(nil);Q:=TIBQuery.Create(nil);
  try
   T.DefaultDatabase:=ADB;T.Params.Add('read_committed');T.Params.Add('rec_version');T.Params.Add('nowait');
   T.StartTransaction;Q.Database:=ADB;Q.Transaction:=T;
   Q.SQL.Text:='UPDATE ECF_GASTO_ENVIO SET XML_FIRMADO=:P,FECHA_UPDATE=CURRENT_TIMESTAMP '+
    'WHERE CIA_KEY=:C AND TRN=:N AND ENCF=:E AND EXISTS '+
    '(SELECT 1 FROM TRANS_OPERACION_MASTER M WHERE M.NUMERO=:N AND M.CIA_KEY=:C AND M.ECF=:E)';
   Q.ParamByName('P').AsString:=Destino;Q.ParamByName('C').AsInteger:=Cia;
   Q.ParamByName('N').AsInteger:=ATrn;Q.ParamByName('E').AsString:=ENcf;Q.ExecSQL;T.Commit;
  finally Q.Free;if T.InTransaction then T.Rollback;T.Free;end;
  Result:=True;AMensaje:='XML firmado descargado en:'+#13#10+Destino;
 except on E:Exception do AMensaje:=E.Message;end;
end;
end.
