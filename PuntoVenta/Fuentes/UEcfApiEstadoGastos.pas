unit UEcfApiEstadoGastos;
interface
uses IBDatabase,UEcfCanalConfig,UEcfApiClienteV1;
type
  TContextoEstadoGasto=record
    Rnc,ENcf,Ambiente,Codigo,Comprador:string;
  end;
  TConsultaDetallesGasto=function(const C:TEcfCanalConfiguracion;
    const Ini,ENcf,Comprador,Codigo:string):TEcfApiRespuestaV1;
function CargarContextoEstadoGasto(ADB:TIBDatabase;Tx:TIBTransaction;
  const C:TEcfCanalConfiguracion;ACia,ATrn:Integer;
  const AENcf,AIdIntento:string):TContextoEstadoGasto;
function ResolverEstadoGastoConDetalles(const C:TEcfCanalConfiguracion;
  const Ini,ENcf:string;const Meta:TEcfApiRespuestaV1;
  const Contexto:TContextoEstadoGasto;out Usada:Boolean;out Mensaje:string;
  Consulta:TConsultaDetallesGasto=nil):TEcfApiRespuestaV1;
implementation
uses SysUtils,Classes,DB,IBQuery,UEcfApiGastoArtefactos;

function EsRnc(const S:string):Boolean;
var I:Integer;
begin
 Result:=(Length(S)=9)or(Length(S)=11);if not Result then Exit;
 for I:=1 to Length(S) do if not(S[I] in ['0'..'9']) then begin Result:=False;Exit;end;
end;
function EsCodigo(const S:string):Boolean;
var I:Integer;
begin
 Result:=Length(S)=6;if not Result then Exit;
 for I:=1 to Length(S) do if not(S[I] in ['a'..'z','A'..'Z','0'..'9','+','/']) then begin Result:=False;Exit;end;
end;
function MismaIdentidad(const Body:AnsiString;const Rnc,ENcf:string):Boolean;
begin Result:=(CampoJson(Body,'companyRnc')=Rnc)and(CampoJson(Body,'eNcf')=ENcf);end;
function Blob(Q:TIBQuery;const Campo:string):AnsiString;
var M:TMemoryStream;
begin
 Result:='';if Q.FieldByName(Campo).IsNull then Exit;M:=TMemoryStream.Create;
 try TBlobField(Q.FieldByName(Campo)).SaveToStream(M);SetLength(Result,M.Size);
  M.Position:=0;if M.Size>0 then M.ReadBuffer(Result[1],M.Size);
 finally M.Free;end;
end;
function ParametroUrl(const Url,Clave:string):string;
var P,F,I,N:Integer;Raw:string;
begin
 Result:='';P:=Pos('?'+LowerCase(Clave)+'=',LowerCase(Url));
 if P=0 then P:=Pos('&'+LowerCase(Clave)+'=',LowerCase(Url));
 if P=0 then Exit;Inc(P,Length(Clave)+2);F:=P;
 while(F<=Length(Url))and not(Url[F] in ['&','#'])do Inc(F);Raw:=Copy(Url,P,F-P);I:=1;
 while I<=Length(Raw)do begin
  if Raw[I]='%' then begin
   if I+2>Length(Raw) then begin Result:='';Exit;end;
   N:=StrToIntDef('$'+Copy(Raw,I+1,2),-1);if N<0 then begin Result:='';Exit;end;
   Result:=Result+Char(N);Inc(I,3);
  end else begin Result:=Result+Raw[I];Inc(I);end;
 end;
end;

function CargarContextoEstadoGasto(ADB:TIBDatabase;Tx:TIBTransaction;
  const C:TEcfCanalConfiguracion;ACia,ATrn:Integer;
  const AENcf,AIdIntento:string):TContextoEstadoGasto;
var Q:TIBQuery;Iniciada:Boolean;Req,Resp:AnsiString;Codigo,Url,Buyer,Amb:string;
begin
 Result.Rnc:=C.RncEmisor;Result.ENcf:=AENcf;Result.Ambiente:=NombreAmbienteEcf(C.Ambiente);
 Result.Codigo:='';Result.Comprador:='';
 Iniciada:=not Tx.InTransaction;if Iniciada then Tx.StartTransaction;
 Q:=TIBQuery.Create(nil);
 try
  Q.Database:=ADB;Q.Transaction:=Tx;
  if AIdIntento<>'' then begin
   Q.SQL.Text:='SELECT REQUEST_BODY,RESPONSE_BODY FROM ECF_API_GASTO_INTENTO '+
    'WHERE ID_INTENTO=:I AND RNC_EMISOR=:R AND ENCF=:E AND NUMERO_TRN=:N AND API_AMBIENTE=:A';
   Q.ParamByName('I').AsString:=AIdIntento;Q.ParamByName('R').AsString:=C.RncEmisor;
   Q.ParamByName('E').AsString:=AENcf;Q.ParamByName('N').AsInteger:=ATrn;
   Q.ParamByName('A').AsString:=Result.Ambiente;Q.Open;
   if not Q.Eof then begin
    Req:=Blob(Q,'REQUEST_BODY');Resp:=Blob(Q,'RESPONSE_BODY');
    if MismaIdentidad(Req,C.RncEmisor,AENcf)and(Copy(AENcf,1,3)='E41') then begin
     Buyer:=CampoJson(Req,'documentNumber');if EsRnc(Buyer)then Result.Comprador:=Buyer;
    end;
    if MismaIdentidad(Resp,C.RncEmisor,AENcf)then begin
     Codigo:=CampoJson(Resp,'securityCode');if EsCodigo(Codigo)then Result.Codigo:=Codigo;
     Buyer:=CampoJson(Resp,'buyerRnc');if EsRnc(Buyer)then Result.Comprador:=Buyer;
    end;
   end;Q.Close;
  end;
  Q.SQL.Text:='SELECT FIRST 1 G.CODIGO_SEGURIDAD,G.URL_IMAGE '+
   'FROM ECF_GASTO_ENVIO G JOIN COMPANIA C ON C.CODIGO=G.CIA_KEY '+
   'WHERE G.CIA_KEY=:C AND G.TRN=:N AND G.ENCF=:E AND TRIM(C.RNC_NUMERO)=:R '+
   'AND G.CODIGO_SEGURIDAD IS NOT NULL ORDER BY G.ID DESC';
  Q.ParamByName('C').AsInteger:=ACia;Q.ParamByName('N').AsInteger:=ATrn;
  Q.ParamByName('E').AsString:=AENcf;Q.ParamByName('R').AsString:=C.RncEmisor;Q.Open;
  if not Q.Eof then begin
   Codigo:=Trim(Q.FieldByName('CODIGO_SEGURIDAD').AsString);Url:=Q.FieldByName('URL_IMAGE').AsString;
   Amb:='';if Pos('/testecf/',LowerCase(Url))>0 then Amb:='TEST'
   else if Pos('/ecf/',LowerCase(Url))>0 then Amb:='PROD';
   if EsCodigo(Codigo) and(Amb=Result.Ambiente)and
    ((Pos('https://ecf.dgii.gov.do/',LowerCase(Url))=1)or(Pos('https://fc.dgii.gov.do/',LowerCase(Url))=1))and
    (ParametroUrl(Url,'RncEmisor')=C.RncEmisor)and(ParametroUrl(Url,'ENCF')=AENcf)then begin
     if(Result.Codigo<>'')and(Result.Codigo<>Codigo)then
      raise Exception.Create('Hay codigos de seguridad diferentes para el mismo documento. Requiere conciliacion.');
     Result.Codigo:=Codigo;Buyer:=ParametroUrl(Url,'RncComprador');
     if EsRnc(Buyer)then begin
      if(Result.Comprador<>'')and(Result.Comprador<>Buyer)then
       raise Exception.Create('El comprador fiscal difiere del intento original.');
      Result.Comprador:=Buyer;
     end;
   end;
  end;
 finally Q.Free;if Iniciada and Tx.InTransaction then Tx.Rollback;end;
end;

function ResolverEstadoGastoConDetalles(const C:TEcfCanalConfiguracion;
  const Ini,ENcf:string;const Meta:TEcfApiRespuestaV1;
  const Contexto:TContextoEstadoGasto;out Usada:Boolean;out Mensaje:string;
  Consulta:TConsultaDetallesGasto):TEcfApiRespuestaV1;
var Codigo,Buyer,Estado:string;D:TEcfApiRespuestaV1;
begin
 Result:=Meta;Usada:=False;Mensaje:='';
 if Meta.StatusCode<>200 then Exit;
 if not MismaIdentidad(Meta.BodyBytes,C.RncEmisor,ENcf)then
  raise Exception.Create('La respuesta inicial pertenece a otro comprobante.');
 if not SameText(CampoJson(Meta.BodyBytes,'status'),'NOT_FOUND')then Exit;
 if (Contexto.Rnc<>C.RncEmisor)or(Contexto.ENcf<>ENcf)or
  (Contexto.Ambiente<>NombreAmbienteEcf(C.Ambiente))then
  raise Exception.Create('El contexto de consulta no coincide con el documento y ambiente.');
 Codigo:=CampoJson(Meta.BodyBytes,'securityCode');
 if not EsCodigo(Codigo)then Codigo:=Contexto.Codigo
 else if EsCodigo(Contexto.Codigo)and(Codigo<>Contexto.Codigo)then
  raise Exception.Create('El codigo de metadata difiere del documento original.');
 Buyer:=CampoJson(Meta.BodyBytes,'buyerRnc');
 if not EsRnc(Buyer)then Buyer:=Contexto.Comprador
 else if EsRnc(Contexto.Comprador)and(Buyer<>Contexto.Comprador)then
  raise Exception.Create('El comprador de metadata difiere del documento original.');
 if not EsCodigo(Codigo)then begin Mensaje:='Sin codigo de seguridad del comprobante para segunda consulta.';Exit;end;
 if not EsRnc(Buyer)then begin Mensaje:='Segunda consulta pendiente: falta el RNC comprador requerido por /details.';Exit;end;
 if not Assigned(Consulta)then Consulta:=ConsultarDetallesIdesiV1;
 Usada:=True;
 try D:=Consulta(C,Ini,ENcf,Buyer,Codigo);
 except
  Result.StatusCode:=0;Result.BodyBytes:='';
  Mensaje:='La consulta con codigo de seguridad no pudo completarse; estado pendiente.';Exit;
 end;
 if D.StatusCode<>200 then begin
  Result:=D;Mensaje:='Consulta con codigo de seguridad HTTP '+IntToStr(D.StatusCode)+'. Estado pendiente.';Exit;
 end;
 if not MismaIdentidad(D.BodyBytes,C.RncEmisor,ENcf)then
  raise Exception.Create('La segunda consulta pertenece a otro comprobante.');
 Result:=D;Estado:=CampoJson(D.BodyBytes,'status');
 Mensaje:='Consulta con codigo de seguridad: '+Estado+', verificado='+CampoJson(D.BodyBytes,'currentStatusVerified')+'.';
end;
end.
