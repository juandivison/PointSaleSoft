unit UEcfTimbreVentaLocal;
interface
uses SysUtils, Classes, IBDatabase;
type TTimbreVentaLocal = record
  Rnc, Encf, Codigo, Url, Raw: string;
  Fecha: TDateTime;
  Monto: Currency;
end;
function LeerRetornoTimbre(const S: string; out T: TTimbreVentaLocal): Boolean;
function NombreXmlFirmadoVenta(Trn:Integer;const Encf: string): string;
function RestaurarTimbreVentaLocal(DB: TIBDatabase; Trn: Integer;
  const ExePath, Retorno: string; out Mensaje: string; Desde:TDateTime=0): Boolean;
function GuardarTimbreVentaLocal(DB: TIBDatabase; Trn: Integer;
  const T: TTimbreVentaLocal): Boolean;
function FechaTimbreLocal(const S: string; out D: TDateTime): Boolean;
function RestaurarTimbrePorEncf(DB:TIBDatabase;const Encf,ExePath:string;out Mensaje:string;Desde:TDateTime=0):Boolean;
procedure CrearImagenQrTimbre(const Url,Destino:string);
procedure PersistirResultadoFiscalVenta(DB:TIBDatabase;Trn:Integer;
  const Encf,Estado,TrackId,Mensaje:string);
implementation
uses IBQuery, ComObj, Variants, UEcfApiGastoArtefactos, DelphiZXingQRCode, Graphics, JPEG, Windows;

procedure PersistirResultadoFiscalVenta(DB:TIBDatabase;Trn:Integer;
  const Encf,Estado,TrackId,Mensaje:string);
var Tx:TIBTransaction;Q:TIBQuery;S,Previo,Track:string;Serie:Integer;
begin
  S:=UpperCase(Trim(StringReplace(Estado,'_',' ',[rfReplaceAll])));
  if(S='ACEPTADO')or(S='ACEPTADO CONDICIONAL')or(S='ACCEPTED')then S:='ACEPTADO'
  else if(S='IN PROCESS')or(S='EN PROCESO')or(S='PENDIENTE')then S:='EN PROCESO'
  else if(S='RECHAZADO')or(S='REJECTED')then S:='RECHAZADO'
  else raise Exception.Create('Estado sin evidencia fiscal suficiente; requiere consulta');
  if(Trn<=0)or(Trim(Encf)='')then raise Exception.Create('TRN/e-NCF requerido para persistir resultado');
  Tx:=TIBTransaction.Create(nil);Q:=TIBQuery.Create(nil);
  try
    Tx.DefaultDatabase:=DB;Tx.Params.Add('read_committed');Tx.Params.Add('rec_version');Tx.Params.Add('nowait');
    Q.Database:=DB;Q.Transaction:=Tx;Tx.StartTransaction;
    Q.SQL.Text:='SELECT NUMERO FROM VENTAS_MAST WHERE NUMERO=:T WITH LOCK';Q.ParamByName('T').AsInteger:=Trn;Q.Open;
    if Q.Eof then raise Exception.Create('Venta inexistente para resultado fiscal');Q.Close;
    Q.SQL.Text:='SELECT N.SERIE,N.NUMERO_NCF,N.DGII_STATUS,N.TRACK_ID FROM VENTAS_MAST V JOIN NCF_ASIGNADOS N ON N.SERIE=V.SERIE_NCF_ASIGNADO WHERE V.NUMERO=:T';Q.ParamByName('T').AsInteger:=Trn;Q.Open;
    if Q.Eof then raise Exception.Create('Venta sin NCF_ASIGNADOS');
    Serie:=Q.Fields[0].AsInteger;
    if Trim(Q.Fields[1].AsString)<>Encf then raise Exception.Create('Resultado fiscal de otro e-NCF');
    Previo:=UpperCase(Trim(Q.Fields[2].AsString));Track:=Trim(Q.Fields[3].AsString);Q.Close;
    if(Previo='ACEPTADO')and(S<>'ACEPTADO')then raise Exception.Create('Resultado anterior aceptado: no se retrocede estado');
    if Trim(TrackId)<>''then begin
      if(Track<>'')and(Track<>Trim(TrackId))then raise Exception.Create('TrackId diferente al historial; conciliar');
      Track:=Trim(TrackId);
    end;
    Q.SQL.Text:='EXECUTE PROCEDURE SP_ECF_UPDATE_ESTADO(:SERIE,:ESTADO,:TRACK,:MENSAJE)';
    Q.ParamByName('SERIE').AsInteger:=Serie;Q.ParamByName('ESTADO').AsString:=S;
    Q.ParamByName('TRACK').AsString:=Track;Q.ParamByName('MENSAJE').AsString:=Mensaje;Q.ExecSQL;
    Q.SQL.Text:='SELECT NUMERO_NCF,DGII_STATUS,TRACK_ID FROM NCF_ASIGNADOS WHERE SERIE=:S';Q.ParamByName('S').AsInteger:=Serie;Q.Open;
    if Q.Eof or(Trim(Q.Fields[0].AsString)<>Encf)or(UpperCase(Trim(Q.Fields[1].AsString))<>S)or(Trim(Q.Fields[2].AsString)<>Track)then
      raise Exception.Create('NCF_ASIGNADOS no conservo resultado fiscal completo');
    Q.Close;Tx.Commit;
  finally if Tx.InTransaction then Tx.Rollback;Q.Free;Tx.Free;end;
end;

function Decode(const S: string): string;
var I,N: Integer;
begin
  Result:='';I:=1;
  while I<=Length(S) do begin
    if (S[I]='%') and (I+2<=Length(S)) then begin
      N:=StrToIntDef('$'+Copy(S,I+1,2),-1);
      if N<0 then raise Exception.Create('Escape URL invalido');
      Result:=Result+Chr(N);Inc(I,3);
    end else begin Result:=Result+S[I];Inc(I);end;
  end;
end;
function QueryValue(const Url,Key: string): string;
var L:TStringList;S:string;I,P:Integer;
begin
  Result:='';P:=Pos('?',Url);if P=0 then Exit;
  S:=Copy(Url,P+1,MaxInt);L:=TStringList.Create;
  try
    L.Text:=StringReplace(S,'&',#13#10,[rfReplaceAll]);
    for I:=0 to L.Count-1 do begin
      P:=Pos('=',L[I]);
      if (P>0) and SameText(Copy(L[I],1,P-1),Key) then begin
        if Result<>'' then raise Exception.Create('Parametro QR duplicado');
        Result:=Decode(Copy(L[I],P+1,MaxInt));
      end;
    end;
  finally L.Free;end;
end;
function FechaTimbreLocal(const S: string; out D: TDateTime): Boolean;
var V,A:string;Y,M,Day,H,N,Sec:Word;
begin
  Result:=False;D:=0;V:=Trim(S);
  try
    if Length(V)<10 then Exit;
    if V[5]='-' then begin Y:=StrToInt(Copy(V,1,4));M:=StrToInt(Copy(V,6,2));Day:=StrToInt(Copy(V,9,2));end
    else begin Day:=StrToInt(Copy(V,1,2));M:=StrToInt(Copy(V,4,2));Y:=StrToInt(Copy(V,7,4));end;
    D:=EncodeDate(Y,M,Day);A:=Trim(Copy(V,12,MaxInt));
    if A<>'' then begin
      if (Length(A)<8) or ((Length(A)>8) and (Copy(A,9,MaxInt)<>'.000')) then Exit;
      H:=StrToInt(Copy(A,1,2));N:=StrToInt(Copy(A,4,2));Sec:=StrToInt(Copy(A,7,2));
      D:=D+EncodeTime(H,N,Sec,0);
    end;
    Result:=True;
  except Result:=False;end;
end;
function Monto(const S: string): Currency;
var I:Integer;V:string;
begin
  V:=Trim(S);if V='' then raise Exception.Create('Monto de timbre ausente');
  for I:=1 to Length(V) do if not(V[I] in ['0'..'9','.']) then raise Exception.Create('Monto de timbre invalido');
  Result:=StrToCurr(StringReplace(V,'.',DecimalSeparator,[rfReplaceAll]));
end;
procedure Validar(const T:TTimbreVentaLocal);
var I:Integer;V:string;
begin
  if (Length(T.Encf)<>13) or (T.Encf[1]<>'E') then raise Exception.Create('e-NCF de timbre invalido');
  for I:=2 to 13 do if not(T.Encf[I] in ['0'..'9'])then raise Exception.Create('e-NCF de timbre invalido');
  if Length(T.Codigo)<>6 then raise Exception.Create('Codigo de seguridad incompleto');
  for I:=1 to 6 do if not(T.Codigo[I] in ['a'..'z','A'..'Z','0'..'9','+','/'])then raise Exception.Create('Codigo de seguridad invalido');
  if (T.Fecha<=0) or (T.Monto<0) then raise Exception.Create('Fecha o monto fiscal invalido');
  V:=LowerCase(T.Url);
  if (Length(V)>2048) or ((Pos('https://ecf.dgii.gov.do/',V)<>1) and (Pos('https://fc.dgii.gov.do/',V)<>1)) then raise Exception.Create('URL de timbre invalida');
  if QueryValue(T.Url,'ENCF')<>T.Encf then raise Exception.Create('URL de otro e-NCF');
  if QueryValue(T.Url,'CodigoSeguridad')<>T.Codigo then raise Exception.Create('Codigo de seguridad no coincide con URL');
  if Abs(Monto(QueryValue(T.Url,'MontoTotal'))-T.Monto)>0.005 then raise Exception.Create('Monto no coincide con URL');
  if (T.Rnc<>'') and (QueryValue(T.Url,'RncEmisor')<>T.Rnc) then raise Exception.Create('URL de otra empresa');
end;
function LeerRetornoTimbre(const S:string;out T:TTimbreVentaLocal):Boolean;
var L:TStringList;V,K,F,M:string;I,P:Integer;
begin
  Result:=False;T.Rnc:='';T.Encf:='';T.Codigo:='';T.Url:='';T.Fecha:=0;T.Monto:=0;T.Raw:=S;F:='';M:='';
  if Trim(S)='' then Exit;
  L:=TStringList.Create;
  try
    V:=StringReplace(S,'%7C','|',[rfReplaceAll,rfIgnoreCase]);
    if Pos('D7T|',V)=1 then Delete(V,1,4);
    L.Text:=StringReplace(V,'|',#13#10,[rfReplaceAll]);
    if L.Count<2 then Exit;
    T.Codigo:=Trim(L[0]);T.Encf:=Trim(L[1]);
    for I:=2 to L.Count-1 do begin
      V:=Trim(L[I]);P:=Pos('=',V);
      if P>0 then begin
        K:=LowerCase(Copy(V,1,P-1));V:=Copy(V,P+1,MaxInt);
        if K='fechaemision' then F:=V else if K='montototal' then M:=V else if K='urlimage' then T.Url:=V;
      end else if I=2 then F:=V else if I=3 then M:=V;
    end;
    if F='' then F:=QueryValue(T.Url,'FechaEmision');
    if M='' then M:=QueryValue(T.Url,'MontoTotal');
    T.Rnc:=QueryValue(T.Url,'RncEmisor');
    if not FechaTimbreLocal(F,T.Fecha) then Exit;
    T.Monto:=Monto(M);Validar(T);Result:=True;
  finally L.Free;end;
end;
function NombreXmlFirmadoVenta(Trn:Integer;const Encf:string):string;
var I:Integer;
begin
  if(Trn<=0)or (Length(Encf)<>13) or (Encf[1]<>'E') then raise Exception.Create('TRN/e-NCF invalido para nombre XML');
  for I:=2 to 13 do if not(Encf[I] in ['0'..'9']) then raise Exception.Create('e-NCF invalido para nombre XML');
  Result:='Factura_TRN'+IntToStr(Trn)+'_'+Encf+'.xml';
end;
function GuardarTimbreVentaLocal(DB:TIBDatabase;Trn:Integer;const T:TTimbreVentaLocal):Boolean;
var Tx:TIBTransaction;Q:TIBQuery;Id:Integer;Existe:Boolean;Rnc,Encf:string;
begin
  Result:=False;Validar(T);
  if (DB=nil) or not DB.Connected or (Trn<=0) then raise Exception.Create('Factura requerida para timbre');
  Tx:=TIBTransaction.Create(nil);Q:=TIBQuery.Create(nil);
  try
    Tx.DefaultDatabase:=DB;Tx.Params.Add('read_committed');Tx.Params.Add('rec_version');Tx.Params.Add('nowait');Q.Database:=DB;Q.Transaction:=Tx;Tx.StartTransaction;
    Q.SQL.Text:='SELECT NUMERO FROM VENTAS_MAST WHERE NUMERO=:T WITH LOCK';Q.ParamByName('T').AsInteger:=Trn;Q.Open;
    if Q.Eof then raise Exception.Create('Factura de timbre no encontrada');Q.Close;
    Q.SQL.Text:='SELECT N.NUMERO_NCF,C.RNC_NUMERO FROM VENTAS_MAST V JOIN NCF_ASIGNADOS N ON N.SERIE=V.SERIE_NCF_ASIGNADO JOIN COMPANIA C ON C.CODIGO=V.CIA_KEY WHERE V.NUMERO=:T';
    Q.ParamByName('T').AsInteger:=Trn;Q.Open;
    if Q.Eof then raise Exception.Create('Identidad fiscal local ausente');
    Encf:=Trim(Q.Fields[0].AsString);Rnc:=Trim(Q.Fields[1].AsString);Q.Close;
    if (Encf<>T.Encf) or (Rnc='') or (QueryValue(T.Url,'RncEmisor')<>Rnc) then raise Exception.Create('Timbre no corresponde a factura/empresa local');
    Q.SQL.Text:='SELECT ID,ENCF,CODIGO_SEGURIDAD,FECHA_EMISION,MONTO_TOTAL,URL_IMAGE FROM ECF_TIMBRE_LOG WHERE TRN=:T ORDER BY ID DESC';Q.ParamByName('T').AsInteger:=Trn;Q.Open;
    Existe:=not Q.Eof;Id:=0;if Existe then Id:=Q.Fields[0].AsInteger;
    while not Q.Eof do begin
      if (Trim(Q.Fields[1].AsString)<>'') and (Trim(Q.Fields[1].AsString)<>T.Encf) then raise Exception.Create('TRN contiene timbre de otro e-NCF; conciliar');
      if(Length(Trim(Q.Fields[2].AsString))=6)and not Q.Fields[3].IsNull and not Q.Fields[4].IsNull and(Trim(Q.Fields[5].AsString)<>'')then
        if(Q.Fields[2].AsString<>T.Codigo)or(Abs(Q.Fields[4].AsCurrency-T.Monto)>0.005)then raise Exception.Create('Timbre completo anterior diferente; conciliar');
      Q.Next;
    end;Q.Close;
    if Existe then Q.SQL.Text:='UPDATE ECF_TIMBRE_LOG SET CODIGO_SEGURIDAD=:C,FECHA_EMISION=:F,MONTO_TOTAL=:M,URL_IMAGE=:U,ENCF=:E WHERE ID=:ID'
    else Q.SQL.Text:='INSERT INTO ECF_TIMBRE_LOG(TRN,ENCF,CODIGO_SEGURIDAD,FECHA_EMISION,MONTO_TOTAL,URL_IMAGE) VALUES(:T,:E,:C,:F,:M,:U)';
    if Existe then Q.ParamByName('ID').AsInteger:=Id else Q.ParamByName('T').AsInteger:=Trn;
    Q.ParamByName('E').AsString:=T.Encf;Q.ParamByName('C').AsString:=T.Codigo;Q.ParamByName('F').AsDateTime:=T.Fecha;Q.ParamByName('M').AsCurrency:=T.Monto;Q.ParamByName('U').AsString:=T.Url;
    Q.ExecSQL;if Q.RowsAffected<>1 then raise Exception.Create('No se guardo timbre completo');Tx.Commit;Result:=True;
  finally if Tx.InTransaction then Tx.Rollback;Q.Free;Tx.Free;end;
end;
function Encode(const S:string):string;
var I:Integer;
begin
  Result:='';for I:=1 to Length(S) do
    if S[I] in ['a'..'z','A'..'Z','0'..'9','-','_','.','~']then Result:=Result+S[I]
    else Result:=Result+'%'+IntToHex(Ord(S[I]),2);
end;
function XmlTimbre(const Archivo,Rnc,Encf,Ambiente:string):TTimbreVentaLocal;
var X,N:OleVariant;Signature,F,Firma,Buyer,Amb,Path:string;Small:Boolean;
  function Texto(const Name:string):string;
  begin
    N:=X.selectSingleNode('//*[local-name()="'+Name+'"]');
    if VarIsNull(N)or VarIsEmpty(N)or((VarType(N)=varDispatch)and(TVarData(N).VDispatch=nil))then Result:='' else Result:=Trim(string(N.text));
  end;
begin
  X:=CreateOleObject('Msxml2.DOMDocument.6.0');X.async:=False;X.resolveExternals:=False;X.validateOnParse:=False;
  X.setProperty('ProhibitDTD',True);X.setProperty('SelectionLanguage','XPath');
  if not X.load(Archivo)then raise Exception.Create('XML firmado invalido');
  Result.Rnc:=Texto('RNCEmisor');Result.Encf:=Texto('eNCF');
  if(Result.Rnc<>Rnc)or(Result.Encf<>Encf)then raise Exception.Create('XML firmado pertenece a otra empresa/factura');
  Signature:=Texto('SignatureValue');Signature:=StringReplace(Signature,#13,'',[rfReplaceAll]);Signature:=StringReplace(Signature,#10,'',[rfReplaceAll]);Signature:=StringReplace(Signature,' ','',[rfReplaceAll]);
  if Length(Signature)<6 then raise Exception.Create('XML sin firma');
  Result.Codigo:=Copy(Signature,1,6);Result.Monto:=Monto(Texto('MontoTotal'));F:=Texto('FechaEmision');Firma:=Texto('FechaHoraFirma');
  if not FechaTimbreLocal(F,Result.Fecha)then raise Exception.Create('XML sin fecha fiscal valida');
  if(Firma<>'')and not FechaTimbreLocal(Firma,Result.Fecha)then raise Exception.Create('XML con fecha/hora firma invalida');
  Amb:=LowerCase(Ambiente);
  if(Amb='test')then Amb:='testecf';if(Amb='prod')or(Amb='produccion')or(Amb='production')then Amb:='ecf';
  if(Amb<>'ecf')and(Amb<>'testecf')and(Amb<>'certecf')then raise Exception.Create('Ambiente fiscal ausente o invalido');
  Small:=(Copy(Encf,1,3)='E32')and(Result.Monto>0)and(Result.Monto<250000);
  if Small then begin Result.Url:='https://fc.dgii.gov.do';Path:='consultatimbrefc';end
  else begin Result.Url:='https://ecf.dgii.gov.do';Path:='consultatimbre';end;
  if Amb='ecf' then begin if Small then Path:='ConsultaTimbreFC'else Path:='ConsultaTimbre';Result.Url:=Result.Url+'/eCF/'+Path;end
  else Result.Url:=Result.Url+'/'+Amb+'/'+Path;
  Result.Url:=Result.Url+'?RncEmisor='+Encode(Rnc);
  if not Small then begin Buyer:=Texto('RNCComprador');if Buyer<>'' then Result.Url:=Result.Url+'&RncComprador='+Encode(Buyer)
    else begin Buyer:=Texto('IdentificadorExtranjero');if Buyer<>''then Result.Url:=Result.Url+'&IdentificadorExtranjero='+Encode(Buyer);end;end;
  Result.Url:=Result.Url+'&ENCF='+Encf;
  if not Small then Result.Url:=Result.Url+'&FechaEmision='+Encode(F);
  Result.Url:=Result.Url+'&MontoTotal='+StringReplace(FormatFloat('0.00',Result.Monto),DecimalSeparator,'.',[rfReplaceAll]);
  if not Small then begin
    if not FechaTimbreLocal(Firma,Result.Fecha)then raise Exception.Create('XML sin fecha/hora firma valida');
    Result.Url:=Result.Url+'&FechaFirma='+Encode(Firma);
  end;
  Result.Url:=Result.Url+'&CodigoSeguridad='+Encode(Result.Codigo);
  Result.Raw:=Result.Codigo+'|'+Encf+'|fechaEmision='+FormatDateTime('dd-mm-yyyy hh:nn:ss',Result.Fecha)+'|montoTotal='+StringReplace(CurrToStr(Result.Monto),DecimalSeparator,'.',[rfReplaceAll])+'|urlImage='+Result.Url;
  Validar(Result);
  { Validacion estructural/identidad. No se declara verificacion criptografica XMLDSig. }
end;
function Iguales(const A,B:string):Boolean;
var X,Y:TMemoryStream;
begin
  X:=TMemoryStream.Create;Y:=TMemoryStream.Create;
  try X.LoadFromFile(A);Y.LoadFromFile(B);Result:=(X.Size=Y.Size);if Result and(X.Size>0)then Result:=CompareMem(X.Memory,Y.Memory,X.Size);finally X.Free;Y.Free;end;
end;
function ModificadoDesde(const Archivo:string;Desde:TDateTime):Boolean;
var Data:TWin32FileAttributeData;Local:TFileTime;St:TSystemTime;D:TDateTime;
begin
  Result:=False;
  if not GetFileAttributesEx(PChar(Archivo),GetFileExInfoStandard,@Data)then Exit;
  if not FileTimeToLocalFileTime(Data.ftLastWriteTime,Local)then Exit;
  if not FileTimeToSystemTime(Local,St)then Exit;
  D:=EncodeDate(St.wYear,St.wMonth,St.wDay)+EncodeTime(St.wHour,St.wMinute,St.wSecond,St.wMilliseconds);
  Result:=D>=Desde;
end;
function RestaurarTimbreVentaLocal(DB:TIBDatabase;Trn:Integer;
  const ExePath,Retorno:string;out Mensaje:string;Desde:TDateTime):Boolean;
const Meses:array[1..12]of string=('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');
var Tx:TIBTransaction;Q:TIBQuery;L,Archivos,Nuevos:TStringList;T,XT:TTimbreVentaLocal;
  Rnc,Encf,Root,Cfg,Dir,Canon,Seq,FileName,Amb,Estado:string;D:TDateTime;Y,M,Day:Word;I:Integer;Valido:Boolean;
begin
  Result:=False;Mensaje:='Timbre pendiente de recuperacion';
  Tx:=TIBTransaction.Create(nil);Q:=TIBQuery.Create(nil);L:=TStringList.Create;Archivos:=TStringList.Create;Nuevos:=TStringList.Create;
  try
    Tx.DefaultDatabase:=DB;Q.Database:=DB;Q.Transaction:=Tx;Tx.StartTransaction;
    Q.SQL.Text:='SELECT N.NUMERO_NCF,C.RNC_NUMERO,N.FECHA,N.DGII_STATUS FROM VENTAS_MAST V JOIN NCF_ASIGNADOS N ON N.SERIE=V.SERIE_NCF_ASIGNADO JOIN COMPANIA C ON C.CODIGO=V.CIA_KEY WHERE V.NUMERO=:T';
    Q.ParamByName('T').AsInteger:=Trn;Q.Open;if Q.Eof then raise Exception.Create('Factura no encontrada para recuperar timbre');
    Encf:=Trim(Q.Fields[0].AsString);Rnc:=Trim(Q.Fields[1].AsString);D:=Q.Fields[2].AsDateTime;Estado:=UpperCase(Trim(Q.Fields[3].AsString));Q.Close;Tx.Rollback;
    Valido:=False;
    try Valido:=LeerRetornoTimbre(Retorno,T);except on E:Exception do Mensaje:=E.Message;end;
    if Valido and((T.Encf<>Encf)or(T.Rnc<>Rnc))then raise Exception.Create('Retorno de otra factura/empresa');
    if not Valido and(Pos('ACEPTADO',Estado)<>1)and(Estado<>'ACCEPTED')then begin Mensaje:='Recuperacion local requiere estado fiscal aceptado';Exit;end;
    Root:=IncludeTrailingPathDelimiter(ExtractFilePath(ExpandFileName(ExePath)));Cfg:=Root+'estandar_appsettings.json';
    if not FileExists(Cfg)then Mensaje:='No existe configuracion de recuperacion: '+Cfg;
    if FileExists(Cfg)then begin
      L.LoadFromFile(Cfg);Cfg:=L.Text;
      I:=Pos('"DGII"',Cfg);if I=0 then raise Exception.Create('Configuracion DGII ausente');
      Cfg:=Copy(Cfg,I,MaxInt);
      Dir:=CampoJson(Cfg,'OutputXmlFirmed');Amb:=CampoJson(Cfg,'Ambiente');
      if Pos('://',Amb)>0 then begin
        if Pos('/testecf',LowerCase(Amb))>0 then Amb:='testecf'
        else if Pos('/certecf',LowerCase(Amb))>0 then Amb:='certecf'
        else if SameText(CampoJson(Cfg,'AmbienteTipo'),'Prod')then Amb:='ecf'
        else raise Exception.Create('Ambiente fiscal URL no reconocido');
      end;
      if(CampoJson(Cfg,'RncEmisor')<>'')and(CampoJson(Cfg,'RncEmisor')<>Rnc)then raise Exception.Create('Configuracion XML pertenece a otra empresa');
      if Dir=''then Dir:=Root+'out\xml'else if(ExtractFileDrive(Dir)='')and(Copy(Dir,1,2)<>'\\')then Dir:=Root+Dir;
      if SameText(CampoJson(Cfg,'EnableDateDirArtifacts'),'true')then begin
        DecodeDate(D,Y,M,Day);Dir:=IncludeTrailingPathDelimiter(Dir)+Format('%.4d\%s\%.2d\%s',[Y,Meses[M],Day,Copy(Encf,1,3)]);
      end;
      Canon:=IncludeTrailingPathDelimiter(Dir)+NombreXmlFirmadoVenta(Trn,Encf);Seq:=Copy(Encf,4,10);while(Length(Seq)>1)and(Seq[1]='0')do Delete(Seq,1,1);
      if FileExists(Canon)then Archivos.Add(Canon);
      FileName:=IncludeTrailingPathDelimiter(Dir)+'Factura_'+Copy(Encf,1,3)+'_'+Seq+'TRN'+IntToStr(Trn)+'_signed.xml';
      if FileExists(FileName)then Archivos.Add(FileName);
      FileName:=IncludeTrailingPathDelimiter(Dir)+'Factura_'+Copy(Encf,1,3)+'_'+Copy(Encf,4,10)+'_signed.xml';
      if(FileName<>Canon)and FileExists(FileName)then Archivos.Add(FileName);
      FileName:=IncludeTrailingPathDelimiter(Dir)+'Factura_'+Copy(Encf,1,3)+'_'+Copy(Encf,2,12)+'_signed.xml';
      if FileExists(FileName)then Archivos.Add(FileName);
      // La antiguedad limita renombrar, nunca impide leer un XML existente.
      if Desde>0 then for I:=0 to Archivos.Count-1 do
        if ModificadoDesde(Archivos[I],Desde)then Nuevos.Add(Archivos[I]);
      if Archivos.Count=0 then Mensaje:='No se encontro XML firmado para '+Encf+
        ' en '+Dir+'. Revise OutputXmlFirmed y las carpetas por fecha. No reenviar la factura.';
      for I:=0 to Archivos.Count-1 do begin
        XT:=XmlTimbre(Archivos[I],Rnc,Encf,Amb);
        if Valido and((T.Codigo<>XT.Codigo)or(Abs(T.Monto-XT.Monto)>0.005))then raise Exception.Create('Timbre y XML firmado no coinciden');
        if(I>0)and not Iguales(Archivos[0],Archivos[I])then raise Exception.Create('XML firmados diferentes: conservar y conciliar');
        if not Valido then begin T:=XT;Valido:=True;end;
      end;
    end;
    if not Valido then Exit;
    Result:=GuardarTimbreVentaLocal(DB,Trn,T);
    if Result and(Nuevos.Count>0)then begin
      if FileExists(Canon)and not Iguales(Nuevos[0],Canon)then raise Exception.Create('XML canonico anterior diferente; conservar ambos');
      if not FileExists(Canon)then begin
        if not RenameFile(Nuevos[0],Canon)then raise Exception.Create('Timbre guardado; no se pudo normalizar nombre XML');
      end;
      for I:=0 to Nuevos.Count-1 do if not SameText(Nuevos[I],Canon)and FileExists(Nuevos[I])then
        if Iguales(Nuevos[I],Canon)then if not SysUtils.DeleteFile(Nuevos[I])then raise Exception.Create('Timbre guardado; no se pudo retirar duplicado XML identico');
    end;
    Mensaje:='Timbre validado y guardado en Delphi';
  finally if Tx.InTransaction then Tx.Rollback;Q.Free;Tx.Free;L.Free;Archivos.Free;Nuevos.Free;end;
end;
function RestaurarTimbrePorEncf(DB:TIBDatabase;const Encf,ExePath:string;out Mensaje:string;Desde:TDateTime):Boolean;
var Tx:TIBTransaction;Q:TIBQuery;Trn:Integer;
begin
  Trn:=0;Tx:=TIBTransaction.Create(nil);Q:=TIBQuery.Create(nil);
  try
    Tx.DefaultDatabase:=DB;Q.Database:=DB;Q.Transaction:=Tx;Tx.StartTransaction;
    Q.SQL.Text:='SELECT V.NUMERO FROM VENTAS_MAST V JOIN NCF_ASIGNADOS N ON N.SERIE=V.SERIE_NCF_ASIGNADO WHERE N.NUMERO_NCF=:E';Q.ParamByName('E').AsString:=Encf;Q.Open;
    if Q.Eof then raise Exception.Create('e-NCF descargado no corresponde a venta local');
    Trn:=Q.Fields[0].AsInteger;Q.Next;if not Q.Eof then raise Exception.Create('e-NCF ambiguo en ventas locales');Q.Close;Tx.Rollback;
  finally if Tx.InTransaction then Tx.Rollback;Q.Free;Tx.Free;end;
  Result:=RestaurarTimbreVentaLocal(DB,Trn,ExePath,'',Mensaje,Desde);
end;
procedure CrearImagenQrTimbre(const Url,Destino:string);
var QR:TDelphiZXingQRCode;B:Graphics.TBitmap;J:TJPEGImage;X,Y:Integer;Tmp:string;G:TGUID;
begin
  if(Url='')or(Destino='')then raise Exception.Create('URL y destino QR requeridos');
  if not DirectoryExists(ExtractFilePath(Destino))then if not ForceDirectories(ExtractFilePath(Destino))then raise Exception.Create('No se pudo crear carpeta QR');
  CreateGUID(G);Tmp:=Destino+'.'+GUIDToString(G)+'.tmp';
  QR:=TDelphiZXingQRCode.Create;B:=Graphics.TBitmap.Create;J:=TJPEGImage.Create;
  try
    QR.Data:=Url;QR.Encoding:=qrAuto;QR.QuietZone:=4;B.Width:=QR.Columns*5;B.Height:=QR.Rows*5;
    B.Canvas.Brush.Color:=clWhite;B.Canvas.FillRect(Rect(0,0,B.Width,B.Height));B.Canvas.Brush.Color:=clBlack;
    for Y:=0 to QR.Rows-1 do for X:=0 to QR.Columns-1 do if QR.IsBlack[Y,X]then B.Canvas.FillRect(Rect(X*5,Y*5,(X+1)*5,(Y+1)*5));
    J.Assign(B);J.CompressionQuality:=100;J.SaveToFile(Tmp);
    if not MoveFileEx(PChar(Tmp),PChar(Destino),MOVEFILE_REPLACE_EXISTING or MOVEFILE_WRITE_THROUGH)then raise Exception.Create('No se pudo guardar QR');
  finally if FileExists(Tmp)then SysUtils.DeleteFile(Tmp);QR.Free;B.Free;J.Free;end;
end;
end.
