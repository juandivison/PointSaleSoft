unit UEcfGastoRecuperacion;
interface
uses Windows,IBDatabase,UEcfCanalConfig,UEcfApiClienteV1,UEcfApiEstadoGastos;
type
 TConsultaDocumentoGasto=function(const C:TEcfCanalConfiguracion;const Ini,ENcf:string):TEcfApiRespuestaV1;
 TEjecutarRecoveryGasto=function(const Cmd,Directorio:string;out Salida:string;out Codigo:DWORD):Boolean;
 TTransporteRecoveryGasto=record
  Metadata,Xml:TConsultaDocumentoGasto;
  Detalles:TConsultaDetallesGasto;
  Cli:TEjecutarRecoveryGasto;
 end;
function RecuperarTimbreEcfGasto(ADB:TIBDatabase;Tx:TIBTransaction;ATrn:Integer;
 const AExe:string;ADescargarXml:Boolean;out AMensaje:string):Boolean;
function RecuperarTimbreEcfGastoConTransporte(ADB:TIBDatabase;Tx:TIBTransaction;ATrn:Integer;
 const AExe:string;ADescargarXml:Boolean;out AMensaje:string;const Transporte:TTransporteRecoveryGasto):Boolean;
function FechaFirmaRecuperada(const S:string):TDateTime;
implementation
uses SysUtils,Classes,DB,IBQuery,UEcfApiIntento,UEcfApiIntentoGasto,
 UEcfApiGastoArtefactos,UUtilecf;
function EjecutarCliDefecto(const Cmd,Directorio:string;out Salida:string;out Codigo:DWORD):Boolean;
begin Result:=ExecAndCapture(Cmd,Directorio,Salida,Codigo);end;
type TDocumentoRecovery=record
 Cia,Trn:Integer;Rnc,ENcf,Tipo,CodigoPrevio,UrlPrevia,AmbienteEsperado:string;
 Fecha:TDateTime;Total:Currency;
end;
 TTimbreRecuperado=record
 Codigo,Track,Url,Xml:string;Emision,Firma:TDateTime;Total:Currency;
end;
function FechaFirmaRecuperada(const S:string):TDateTime;
var Z:string;P,Signo,Minutos:Integer;
begin
 if Length(S)<19 then raise Exception.Create('Fecha de firma incompleta.');
 Result:=FechaFiscal(S)+EncodeTime(StrToInt(Copy(S,12,2)),StrToInt(Copy(S,15,2)),StrToInt(Copy(S,18,2)),0);
 Z:=Copy(S,20,MaxInt);
 if Pos('Z',UpperCase(Z))>0 then Result:=Result-4/24
 else begin P:=Pos('+',Z);Signo:=1;if P=0 then begin P:=Pos('-',Z);Signo:=-1;end;
  if P>0 then begin Minutos:=Signo*(60*StrToInt(Copy(Z,P+1,2))+StrToInt(Copy(Z,P+4,2)));Result:=Result-(Minutos+240)/1440;end;
 end;
end;
function Parametro(const Url,Clave:string):string;
var P,J,I,C:Integer;Raw:string;
begin
 Result:='';P:=Pos('?'+LowerCase(Clave)+'=',LowerCase(Url));
 if P=0 then P:=Pos('&'+LowerCase(Clave)+'=',LowerCase(Url));if P=0 then Exit;
 Inc(P,Length(Clave)+2);J:=P;while(J<=Length(Url))and not(Url[J] in ['&','#'])do Inc(J);
 Raw:=Copy(Url,P,J-P);I:=1;
 while I<=Length(Raw)do begin
  if Raw[I]='%' then begin
   C:=StrToIntDef('$'+Copy(Raw,I+1,2),-1);if(C<0)or(I+2>Length(Raw))then raise Exception.Create('URL de timbre invalida.');
   Result:=Result+Chr(C);Inc(I,3);
  end else begin Result:=Result+Raw[I];Inc(I);end;
 end;
end;
procedure ValidarTimbre(const D:TDocumentoRecovery;const R:TTimbreRecuperado;const Ambiente:string);
var I:Integer;Prefijo:string;
begin
 if Length(R.Codigo)<>6 then raise Exception.Create('Codigo de seguridad incompleto.');
 for I:=1 to Length(R.Codigo)do if not(R.Codigo[I] in ['a'..'z','A'..'Z','0'..'9','+','/'])then raise Exception.Create('Codigo de seguridad invalido.');
 if(D.CodigoPrevio<>'')and(D.CodigoPrevio<>R.Codigo)then raise Exception.Create('El codigo recibido difiere del timbre anterior. Requiere conciliacion.');
 if Abs(R.Total-D.Total)>0.01 then raise Exception.Create('El total del timbre no coincide con el gasto guardado.');
 if Trunc(R.Emision)<>Trunc(D.Fecha)then raise Exception.Create('La fecha de emision no coincide con el gasto.');
 if Ambiente='TEST' then Prefijo:='https://ecf.dgii.gov.do/testecf/'
 else if Ambiente='PROD' then Prefijo:='https://ecf.dgii.gov.do/ecf/'
 else raise Exception.Create('Ambiente de recuperacion invalido.');
 if(D.AmbienteEsperado<>'')and(D.AmbienteEsperado<>Ambiente)then raise Exception.Create('El timbre pertenece a otro ambiente.');
 if(Pos(Prefijo,LowerCase(R.Url))<>1)or(Parametro(R.Url,'RncEmisor')<>D.Rnc)or
   (Parametro(R.Url,'ENCF')<>D.ENcf)or(Parametro(R.Url,'CodigoSeguridad')<>R.Codigo)then
  raise Exception.Create('La URL del timbre no corresponde al emisor, e-NCF y codigo seleccionados.');
 if Abs(MontoFiscal(Parametro(R.Url,'MontoTotal'))-R.Total)>0.01 then raise Exception.Create('El total de la URL no coincide con el timbre.');
end;
procedure GuardarTimbre(ADB:TIBDatabase;const D:TDocumentoRecovery;const R:TTimbreRecuperado);
var T:TIBTransaction;Q:TIBQuery;
 procedure Parametros;
 begin
  Q.ParamByName('C').AsInteger:=D.Cia;Q.ParamByName('N').AsInteger:=D.Trn;Q.ParamByName('E').AsString:=D.ENcf;
  Q.ParamByName('COD').AsString:=R.Codigo;Q.ParamByName('F').AsDateTime:=R.Firma;
  Q.ParamByName('EM').AsDateTime:=R.Emision;Q.ParamByName('M').AsCurrency:=R.Total;Q.ParamByName('U').AsString:=R.Url;
  if R.Track='' then Q.ParamByName('TRACK').Clear else Q.ParamByName('TRACK').AsString:=R.Track;
  if R.Xml='' then Q.ParamByName('XML').Clear else Q.ParamByName('XML').AsString:=R.Xml;
 end;
begin
 T:=TIBTransaction.Create(nil);Q:=TIBQuery.Create(nil);
 try
  T.DefaultDatabase:=ADB;T.Params.Add('read_committed');T.Params.Add('rec_version');T.Params.Add('nowait');T.StartTransaction;
  Q.Database:=ADB;Q.Transaction:=T;
  Q.SQL.Text:='SELECT CIA_KEY,ECF,FECHA,TIPO_CF FROM TRANS_OPERACION_MASTER WHERE NUMERO=:N WITH LOCK';
  Q.ParamByName('N').AsInteger:=D.Trn;Q.Open;
  if Q.Eof or(Q.FieldByName('CIA_KEY').AsInteger<>D.Cia)or(Trim(Q.FieldByName('ECF').AsString)<>D.ENcf)or
    (Trim(Q.FieldByName('TIPO_CF').AsString)<>D.Tipo)or
    (Trunc(Q.FieldByName('FECHA').AsDateTime)<>Trunc(D.Fecha))then raise Exception.Create('El gasto cambio durante la consulta. Actualice la pantalla.');Q.Close;
  Q.SQL.Text:='SELECT SUM(COALESCE(D.VALOR,0)+CASE WHEN COALESCE(M.IND_MONTO_GRAVADO,0)=1 THEN 0 ELSE COALESCE(D.MONTO_ITBIS,0) END) TOTAL '+
   'FROM TRANS_OPERACION_DET D JOIN TRANS_OPERACION_MASTER M ON M.NUMERO=D.NUMERO WHERE D.NUMERO=:N AND COALESCE(D.STATUS,''A'')<>''C''';
  Q.ParamByName('N').AsInteger:=D.Trn;Q.Open;
  if Q.FieldByName('TOTAL').IsNull or(Abs(Q.FieldByName('TOTAL').AsCurrency-R.Total)>0.01)then raise Exception.Create('El detalle del gasto cambio durante la consulta.');Q.Close;
  Q.SQL.Text:='SELECT RNC_NUMERO FROM COMPANIA WHERE CODIGO=:C';Q.ParamByName('C').AsInteger:=D.Cia;Q.Open;
  if Q.Eof or(Trim(Q.FieldByName('RNC_NUMERO').AsString)<>D.Rnc)then raise Exception.Create('La empresa del gasto cambio.');Q.Close;
  Q.SQL.Text:='SELECT CODIGO_SEGURIDAD FROM ECF_GASTO_ENVIO WHERE CIA_KEY=:C AND TRN=:N AND ENCF=:E WITH LOCK';
  Q.ParamByName('C').AsInteger:=D.Cia;Q.ParamByName('N').AsInteger:=D.Trn;Q.ParamByName('E').AsString:=D.ENcf;Q.Open;
  if not Q.Eof and(Trim(Q.FieldByName('CODIGO_SEGURIDAD').AsString)<>'')and(Trim(Q.FieldByName('CODIGO_SEGURIDAD').AsString)<>R.Codigo)then
   raise Exception.Create('Otro proceso guardo un timbre diferente.');Q.Close;
  Q.SQL.Text:='UPDATE ECF_RESERVA SET CODIGO_SEGURIDAD=:COD,FECHA_FIRMA=:F,ESTADO=''ACEPTADO'',UPDATED_AT=CURRENT_TIMESTAMP '+
   'WHERE HASH_DOC=:H AND NCF=:E';
  Q.ParamByName('COD').AsString:=R.Codigo;Q.ParamByName('F').AsDateTime:=R.Firma;
  Q.ParamByName('H').AsString:=Format('GASTO|CIA=%d|TRN=%d|TIPO=%s',[D.Cia,D.Trn,D.Tipo]);Q.ParamByName('E').AsString:=D.ENcf;Q.ExecSQL;
  if Q.RowsAffected<>1 then raise Exception.Create('No existe la reserva local del gasto. No se guardaron cambios.');
  Q.SQL.Text:='UPDATE ECF_GASTO_ENVIO SET ESTADO=''ACEPTADO'',CODIGO_SEGURIDAD=:COD,FECHA_EMISION=:EM,FECHA_FIRMA=:F,'+
   'MONTO_TOTAL=:M,URL_IMAGE=:U,XML_FIRMADO=COALESCE(:XML,XML_FIRMADO),TRACK_ID=COALESCE(NULLIF(TRIM(TRACK_ID),''''),:TRACK),'+
   'FECHA_UPDATE=CURRENT_TIMESTAMP WHERE CIA_KEY=:C AND TRN=:N AND ENCF=:E';Parametros;Q.ExecSQL;
  if Q.RowsAffected=0 then begin
   Q.SQL.Text:='INSERT INTO ECF_GASTO_ENVIO(ID,CIA_KEY,TRN,TIPO_CF,ENCF,ESTADO,TRACK_ID,MENSAJE,INTENTOS,CODIGO_SEGURIDAD,'+
    'FECHA_EMISION,FECHA_FIRMA,MONTO_TOTAL,URL_IMAGE,XML_FIRMADO,FECHA_CREACION) '+
    'VALUES(GEN_ID(GEN_ECF_GASTO_ENVIO_ID,1),:C,:N,:TIPO,:E,''ACEPTADO'',:TRACK,''Timbre recuperado por consulta'',0,:COD,:EM,:F,:M,:U,:XML,CURRENT_TIMESTAMP)';
   Parametros;Q.ParamByName('TIPO').AsInteger:=StrToInt(D.Tipo);Q.ExecSQL;
  end else if Q.RowsAffected<>1 then raise Exception.Create('Historial duplicado para el mismo gasto.');
  T.Commit;
 finally if T.InTransaction then T.Rollback;Q.Free;T.Free;end;
end;
function RecuperarTimbreEcfGasto(ADB:TIBDatabase;Tx:TIBTransaction;ATrn:Integer;
 const AExe:string;ADescargarXml:Boolean;out AMensaje:string):Boolean;
var Transporte:TTransporteRecoveryGasto;
begin FillChar(Transporte,SizeOf(Transporte),0);Result:=RecuperarTimbreEcfGastoConTransporte(ADB,Tx,ATrn,AExe,ADescargarXml,AMensaje,Transporte);end;
function RecuperarTimbreEcfGastoConTransporte(ADB:TIBDatabase;Tx:TIBTransaction;ATrn:Integer;
 const AExe:string;ADescargarXml:Boolean;out AMensaje:string;const Transporte:TTransporteRecoveryGasto):Boolean;
var D:TDocumentoRecovery;R:TTimbreRecuperado;C:TEcfCanalConfiguracion;I:TEcfApiIntento;
 Q:TIBQuery;Inicio,Hay,Detalles:Boolean;Meta,Fiscal,X:TEcfApiRespuestaV1;Ctx:TContextoEstadoGasto;
 Ini,Salida,Ambiente,Aviso,IdIntento,Cmd,Ruta:string;Codigo:DWORD;L:TStringList;F:TFileStream;
 Bytes:AnsiString;Stamp:TTimbreApi;Consulta,Descarga:TConsultaDocumentoGasto;Ejecutar:TEjecutarRecoveryGasto;
begin
 Result:=False;AMensaje:='';Aviso:='';IdIntento:='';R.Xml:='';
 try
  if(ADB=nil)or(Tx=nil)or not ADB.Connected or(ATrn<=0)then raise Exception.Create('Conexion o gasto invalido.');
  Inicio:=not Tx.InTransaction;if Inicio then Tx.StartTransaction;Q:=TIBQuery.Create(nil);
  try
   Q.Database:=ADB;Q.Transaction:=Tx;
   Q.SQL.Text:='SELECT M.CIA_KEY,M.ECF,M.TIPO_CF,M.FECHA,C.RNC_NUMERO,G.CODIGO_SEGURIDAD,G.URL_IMAGE '+
    'FROM TRANS_OPERACION_MASTER M JOIN COMPANIA C ON C.CODIGO=M.CIA_KEY '+
    'LEFT JOIN ECF_GASTO_ENVIO G ON G.CIA_KEY=M.CIA_KEY AND G.TRN=M.NUMERO AND G.ENCF=M.ECF WHERE M.NUMERO=:N';
   Q.ParamByName('N').AsInteger:=ATrn;Q.Open;if Q.Eof then raise Exception.Create('No existe el gasto guardado.');
   D.Trn:=ATrn;D.Cia:=Q.FieldByName('CIA_KEY').AsInteger;D.ENcf:=Trim(Q.FieldByName('ECF').AsString);D.Tipo:=Trim(Q.FieldByName('TIPO_CF').AsString);
   D.Fecha:=Q.FieldByName('FECHA').AsDateTime;D.Rnc:=Trim(Q.FieldByName('RNC_NUMERO').AsString);
   D.CodigoPrevio:=Trim(Q.FieldByName('CODIGO_SEGURIDAD').AsString);D.UrlPrevia:=Trim(Q.FieldByName('URL_IMAGE').AsString);Q.Close;
   if(Length(D.ENcf)<>13)or(D.ENcf<>'E'+D.Tipo+Copy(D.ENcf,4,10))or((D.Tipo<>'41')and(D.Tipo<>'43'))then raise Exception.Create('El gasto necesita un e-NCF E41/E43 reservado.');
   C.RncEmisor:=D.Rnc;C.Canal:=ceAslan;C.Ambiente:=aeTest;C.BaseUrl:='';C.ClientId:='';D.AmbienteEsperado:='';
   Q.SQL.Text:='SELECT RDB$RELATION_NAME FROM RDB$RELATIONS WHERE RDB$RELATION_NAME=''ECF_CANAL_CONFIG''';Q.Open;Hay:=not Q.Eof;Q.Close;
   if Hay then begin
    C:=CargarConfiguracionCanalEcf(ADB,Tx,D.Rnc);
    Q.SQL.Text:='SELECT RNC_EMISOR FROM ECF_CANAL_CONFIG WHERE RNC_EMISOR=:R';Q.ParamByName('R').AsString:=D.Rnc;Q.Open;
    if not Q.Eof then D.AmbienteEsperado:=NombreAmbienteEcf(C.Ambiente);Q.Close;
   end;
   Q.SQL.Text:='SELECT RDB$RELATION_NAME FROM RDB$RELATIONS WHERE RDB$RELATION_NAME=''ECF_API_GASTO_INTENTO''';Q.Open;Hay:=not Q.Eof;Q.Close;
   if Hay then Hay:=CargarIntentoApiPorGasto(ADB,D.Rnc,ATrn,I);
   if Hay then begin
    if I.ENcf<>D.ENcf then raise Exception.Create('El intento API pertenece a otro e-NCF.');
    C.Canal:=ceIdesiApi;C.RncEmisor:=D.Rnc;C.BaseUrl:=I.BaseUrl;C.ClientId:=I.ClientId;IdIntento:=I.IdIntento;
    if I.Ambiente='TEST' then C.Ambiente:=aeTest else if I.Ambiente='PROD' then C.Ambiente:=aeProd else raise Exception.Create('Ambiente historico invalido.');
    D.AmbienteEsperado:=I.Ambiente;
   end;
   if Pos('/testecf/',LowerCase(D.UrlPrevia))>0 then Ambiente:='TEST'
   else if Pos('/ecf/',LowerCase(D.UrlPrevia))>0 then Ambiente:='PROD' else Ambiente:='';
   if Ambiente<>'' then begin
    if(D.AmbienteEsperado<>'')and(D.AmbienteEsperado<>Ambiente)then raise Exception.Create('El ambiente actual difiere del timbre guardado.');
    D.AmbienteEsperado:=Ambiente;
   end;
   Q.SQL.Text:='SELECT SUM(COALESCE(D.VALOR,0)+CASE WHEN COALESCE(M.IND_MONTO_GRAVADO,0)=1 THEN 0 ELSE COALESCE(D.MONTO_ITBIS,0) END) TOTAL '+
    'FROM TRANS_OPERACION_DET D JOIN TRANS_OPERACION_MASTER M ON M.NUMERO=D.NUMERO WHERE D.NUMERO=:N AND COALESCE(D.STATUS,''A'')<>''C''';
   Q.ParamByName('N').AsInteger:=ATrn;Q.Open;if Q.FieldByName('TOTAL').IsNull then raise Exception.Create('El gasto no tiene detalle fiscal guardado.');
   D.Total:=Q.FieldByName('TOTAL').AsCurrency;Q.Close;
  finally Q.Free;if Inicio and Tx.InTransaction then Tx.Rollback;end;
  Ini:=IncludeTrailingPathDelimiter(ExtractFilePath(ExpandFileName(AExe)))+'repconf_cr.ini';
  if C.Canal=ceIdesiApi then begin
   C:=ResolverConfiguracionIdesiIni(C,Ini);Ambiente:=NombreAmbienteEcf(C.Ambiente);
   Consulta:=Transporte.Metadata;if not Assigned(Consulta)then Consulta:=ConsultarMetadatosIdesiV1;
   Meta:=Consulta(C,Ini,D.ENcf);Ctx:=CargarContextoEstadoGasto(ADB,Tx,C,D.Cia,D.Trn,D.ENcf,IdIntento);
   Fiscal:=ResolverEstadoGastoConDetalles(C,Ini,D.ENcf,Meta,Ctx,Detalles,Aviso,Transporte.Detalles);
   if(Meta.StatusCode<>200)or(Fiscal.StatusCode<>200)then raise Exception.Create('Consulta de timbre pendiente. HTTP '+IntToStr(Fiscal.StatusCode));
   if(CampoJson(Meta.BodyBytes,'companyRnc')<>D.Rnc)or(CampoJson(Meta.BodyBytes,'eNcf')<>D.ENcf)then raise Exception.Create('La respuesta API pertenece a otro documento.');
   if not SameText(CampoJson(Fiscal.BodyBytes,'status'),'ACCEPTED')or not SameText(CampoJson(Fiscal.BodyBytes,'currentStatusVerified'),'true')then
    raise Exception.Create('No se recupero timbre: estado '+CampoJson(Fiscal.BodyBytes,'status')+'. Se conservaron los datos anteriores.');
   if not SameText(CampoJson(Meta.BodyBytes,'metadataStatus'),'AVAILABLE')then raise Exception.Create('El comprobante esta aceptado; los metadatos del timbre siguen pendientes.');
   R.Codigo:=CampoJson(Meta.BodyBytes,'securityCode');R.Track:=CampoJson(Fiscal.BodyBytes,'trackId');R.Url:=CampoJson(Meta.BodyBytes,'urlImage');
   R.Emision:=FechaFiscal(CampoJson(Meta.BodyBytes,'issueDate'));R.Firma:=FechaFirmaRecuperada(CampoJson(Meta.BodyBytes,'signatureDate'));R.Total:=MontoFiscal(CampoJson(Meta.BodyBytes,'totalAmount'));
   ValidarTimbre(D,R,Ambiente);
   if ADescargarXml then begin
    try
     Descarga:=Transporte.Xml;if not Assigned(Descarga)then Descarga:=DescargarXmlFirmadoIdesiV1;
     X:=Descarga(C,Ini,D.ENcf);if X.StatusCode<>200 then raise Exception.Create('HTTP '+IntToStr(X.StatusCode));Bytes:=X.BodyBytes;
     Ruta:=XmlDestino(Ini,Ambiente,D.Rnc,D.ENcf);Stamp.Rnc:=D.Rnc;Stamp.ENcf:=D.ENcf;Stamp.Monto:=R.Total;
     GuardarXmlFirmado(Ruta,Bytes,Stamp);R.Xml:=Ruta;
    except on E:Exception do Aviso:=' XML pendiente: '+E.Message;end;
   end;
  end else begin
   L:=TStringList.Create;
   try
    Ruta:=IncludeTrailingPathDelimiter(ExtractFilePath(ExpandFileName(AExe)))+'gasto_recovery_v2.marker';
    if not FileExists(Ruta)then raise Exception.Create('Actualice IdesiToolECF: falta soporte de recuperacion de timbre con descarga XML opcional.');
    L.LoadFromFile(Ruta);if Trim(L.Text)<>'GASTO_RECOVERY_V2' then raise Exception.Create('Version de recuperacion no reconocida.');
    Cmd:='"'+AExe+'" --gasto-recover '+D.ENcf+' --xml-firmado='+IntToStr(Ord(ADescargarXml))+
     ' --fecha-emision='+FormatDateTime('yyyy-mm-dd',D.Fecha)+' --rnc-esperado='+D.Rnc;
    if D.AmbienteEsperado<>'' then Cmd:=Cmd+' --ambiente-esperado='+D.AmbienteEsperado;
    Ejecutar:=Transporte.Cli;if not Assigned(Ejecutar)then Ejecutar:=EjecutarCliDefecto;
    if not Ejecutar(Cmd,ExtractFilePath(AExe),Salida,Codigo)then raise Exception.Create('No se pudo ejecutar la consulta de recuperacion.');
    L.Text:=Salida;
    if SameText(Trim(L.Values['Estado']),'ERROR')then raise Exception.Create('No se completo la recuperacion: '+L.Values['Mensajes']);
    if(Trim(L.Values['RecoveryProtocol'])<>'2')or(Trim(L.Values['RNC'])<>D.Rnc)or(Trim(L.Values['ENCF'])<>D.ENcf)then raise Exception.Create('La recuperacion no corresponde al motor, emisor y e-NCF seleccionados.');
    if not SameText(Trim(L.Values['Estado']),'ACEPTADO')or(Trim(L.Values['ValidoDGII'])<>'1')then raise Exception.Create('No se recupero timbre: '+L.Values['Estado']+'. '+L.Values['Mensajes']);
    Ambiente:=Trim(L.Values['Ambiente']);R.Codigo:=Trim(L.Values['CodigoSeguridad']);R.Track:=Trim(L.Values['TrackId']);R.Url:=Trim(L.Values['UrlImage']);
    R.Emision:=FechaFiscal(L.Values['FechaEmision']);R.Firma:=FechaFirmaRecuperada(L.Values['FechaFirma']);R.Total:=MontoFiscal(L.Values['MontoTotalTimbre']);
    ValidarTimbre(D,R,Ambiente);
    if ADescargarXml then begin
     try
      Ruta:=Trim(L.Values['XmlFirmado']);F:=TFileStream.Create(Ruta,fmOpenRead or fmShareDenyWrite);
      try if F.Size>10*1024*1024 then raise Exception.Create('XML demasiado grande.');SetLength(Bytes,F.Size);if Length(Bytes)>0 then F.ReadBuffer(Bytes[1],Length(Bytes));finally F.Free;end;
      Ruta:=XmlDestino(Ini,Ambiente,D.Rnc,D.ENcf);Stamp.Rnc:=D.Rnc;Stamp.ENcf:=D.ENcf;Stamp.Monto:=R.Total;
      GuardarXmlFirmado(Ruta,Bytes,Stamp);R.Xml:=Ruta;
     except on E:Exception do Aviso:=' XML pendiente: '+E.Message;end;
    end;
   finally L.Free;end;
  end;
  GuardarTimbre(ADB,D,R);
  AMensaje:='Timbre recuperado y guardado en Firebird.'+#13#10+'e-NCF: '+D.ENcf+Aviso;Result:=True;
 except on E:Exception do AMensaje:=E.Message;end;
end;
end.
