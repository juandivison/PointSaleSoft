unit UEcfApiRutaGastos;
interface
uses IBDatabase, UUtilecfGastos;
{ True means this document belongs to IDESI. Exceptions never permit ASLAN fallback. }
function ProcesarGastoIdesiSiCorresponde(ADB:TIBDatabase; ATrn:Integer;
  const AExe:string; out R:TGastoEcfCliResult; out AMensaje:string;
  ADescargarXml:Boolean=True):Boolean;
implementation
uses SysUtils,Classes,DB,IBQuery,IniFiles,ComObj,Variants,DateUtils,
  UEcfCanalConfig,UEcfApiIntento,UEcfApiIntentoGasto,UEcfApiClienteV1,
  UGastoTxtBuilder,UEcfApiGastoJson,UEcfEnvioGastos,UDatModConectar,
  UEcfApiGastoArtefactos, UEcfApiEstadoGastos, UEcfApiGastoPolitica, Windows, Forms;

function FechaHora(const S:string):TDateTime;
var H,N,Seg:Word;
begin
  Result:=FechaFiscal(S);
  if Length(S)<19 then raise Exception.Create('Fecha de firma sin hora.');
  H:=StrToInt(Copy(S,12,2));N:=StrToInt(Copy(S,15,2));Seg:=StrToInt(Copy(S,18,2));
  Result:=Result+EncodeTime(H,N,Seg,0);
  if S[Length(S)]='Z' then Result:=Result-4/24;
end;

function ProcesarGastoIdesiSiCorresponde(ADB:TIBDatabase; ATrn:Integer;
  const AExe:string; out R:TGastoEcfCliResult; out AMensaje:string;
  ADescargarXml:Boolean):Boolean;
var T:TIBTransaction;Q:TIBQuery;C:TEcfCanalConfiguracion;
  Intento:TEcfApiIntento;Hay,Iniciada,XmlActivado,FiscalPrevio,RechazoLocal:Boolean;
  Rnc,ENcf,Tipo,Ini,Carpeta,Txt,Id,Referencia,Token,Estado,Destino,ErrorXml:string;
  Contexto:TContextoEstadoGasto;Fiscal:TEcfApiRespuestaV1;
  DetalleUsado:Boolean;MensajeDetalle:string;
  MensajeLocal:string;PJson,PViejo:Integer;
  Cia:Integer;B:TGastoTxtBuilder;BR:TGastoTxtBuildResult;L:TStringList;
  Json:AnsiString;Resp,Meta,Xml:TEcfApiRespuestaV1;F:TIniFile;Timbre:TTimbreApi;
begin
  Result:=False;AMensaje:='';Token:='';ErrorXml:='';
  Hay:=False;Cia:=0;FiscalPrevio:=False;RechazoLocal:=False;
  if (ADB=nil) or not ADB.Connected or (ATrn<=0) then
    raise Exception.Create('Conexion o identidad del gasto invalida.');
  if (dmConectar=nil) or (ADB<>dmConectar.IBDatabase1) then
    raise Exception.Create('Ruta IDESI requiere conexion principal del ERP.');
  T:=dmConectar.IBTransaction1;Iniciada:=not T.InTransaction;
  if Iniciada then T.StartTransaction;
  Q:=TIBQuery.Create(nil);
  try
    Q.Database:=ADB;Q.Transaction:=T;
    Q.SQL.Text:='SELECT M.CIA_KEY,M.ECF,M.TIPO_CF,C.RNC_NUMERO FROM TRANS_OPERACION_MASTER M '+
      'JOIN COMPANIA C ON C.CODIGO=M.CIA_KEY WHERE M.NUMERO=:N';
    Q.ParamByName('N').AsInteger:=ATrn;Q.Open;
    if Q.Eof then raise Exception.Create('No existe el gasto persistido.');
    Cia:=Q.FieldByName('CIA_KEY').AsInteger;Rnc:=Trim(Q.FieldByName('RNC_NUMERO').AsString);
    ENcf:=Trim(Q.FieldByName('ECF').AsString);Tipo:=Trim(Q.FieldByName('TIPO_CF').AsString);Q.Close;
    C:=CargarConfiguracionCanalEcf(ADB,T,Rnc);
    { Consultar primero el diario si existe; el canal historico prevalece. }
    Q.SQL.Text:='SELECT RDB$RELATION_NAME FROM RDB$RELATIONS '+
      'WHERE RDB$RELATION_NAME=''ECF_API_GASTO_INTENTO''';Q.Open;Hay:=not Q.Eof;Q.Close;
    if Hay then Hay:=CargarIntentoApiPorGasto(ADB,Rnc,ATrn,Intento);
    if Hay then begin
      C.Canal:=ceIdesiApi;C.RncEmisor:=Intento.RncEmisor;
      if Intento.Ambiente='TEST' then C.Ambiente:=aeTest
      else if Intento.Ambiente='PROD' then C.Ambiente:=aeProd
      else raise Exception.Create('Ambiente historico del gasto invalido.');
      C.BaseUrl:=Intento.BaseUrl;C.ClientId:=Intento.ClientId;
    end;
    Q.SQL.Text:='SELECT FIRST 1 ID FROM ECF_GASTO_ENVIO WHERE CIA_KEY=:C AND ENCF=:E '+
      'AND (ESTADO=''ACEPTADO'' OR NULLIF(TRIM(TRACK_ID),'''') IS NOT NULL)';
    Q.ParamByName('C').AsInteger:=Cia;Q.ParamByName('E').AsString:=ENcf;Q.Open;
    FiscalPrevio:=not Q.Eof;Q.Close;
  finally
    Q.Free;if Iniciada and T.InTransaction then T.Rollback;
  end;
  if C.Canal<>ceIdesiApi then Exit;
  if FiscalPrevio then Hay:=True;
  Result:=True;
  if (Length(ENcf)<>13) or (Copy(ENcf,1,3)<>'E'+Tipo) or
     ((Tipo<>'41') and (Tipo<>'43')) then
    raise Exception.Create('Gasto pendiente de e-NCF o tipo invalido. No se hara POST.');
  Ini:=IncludeTrailingPathDelimiter(ExtractFilePath(ExpandFileName(AExe)))+'repconf_cr.ini';
  C:=ResolverConfiguracionIdesiIni(C,Ini);
  ExigirAmbienteGastoIdesi(C,Ini);
  R.ENCF:=ENcf;R.Estado:='NO_CONFIRMADO';R.ExitCode:=0;R.TieneTimbre:=False;
  R.Mensaje:='';R.TrackId:='';R.SalidaCompleta:='';
  R.Timbre.CodigoSeguridad:='';R.Timbre.ENCF:=ENcf;
  R.Timbre.FechaEmision:=0;R.Timbre.TieneFechaEmision:=False;
  R.Timbre.FechaFirma:=0;R.Timbre.TieneFechaFirma:=False;
  R.Timbre.MontoTotal:=0;R.Timbre.TieneMontoTotal:=False;
  R.Timbre.UrlImage:='';R.Timbre.XmlFirmado:='';
  if Hay and (not FiscalPrevio) and (Intento.IdIntento<>'') then
    RechazoLocal:=LeerRechazoLocalGasto(ADB,Intento.IdIntento,MensajeLocal);
  if (not Hay) or RechazoLocal then begin
    Token:=ObtenerAccessTokenIdesiV1(C,Ini);
    Id:=NuevoIdIntentoGasto;
    Referencia:='PS-GASTO-'+NombreAmbienteEcf(C.Ambiente)+'-'+Rnc+'-'+IntToStr(ATrn)+'-'+Id;
    Carpeta:=IncludeTrailingPathDelimiter(ExtractFilePath(Ini))+'gasto_txt';
    if not DirectoryExists(Carpeta) and not ForceDirectories(Carpeta) then
      raise Exception.Create('No se pudo preparar el snapshot fiscal del gasto.');
    Txt:=IncludeTrailingPathDelimiter(Carpeta)+'gasto_'+IntToStr(ATrn)+'_'+Id+'.txt';
    B:=TGastoTxtBuilder.Create(ADB,T);
    try BR:=B.GenerateGastosTxt(ATrn,Txt);finally B.Free;end;
    if BR.ENcf<>ENcf then raise Exception.Create('Snapshot de gasto con e-NCF diferente.');
    L:=TStringList.Create;
    try L.LoadFromFile(Txt);Json:=AnsiString(ConstruirJsonGastoPublicV1(L.Text,Rnc,Referencia));finally L.Free;end;
    if RechazoLocal then begin
      PJson:=Pos('"document":',string(Json));PViejo:=Pos('"document":',string(Intento.RequestUtf8));
      if (PJson=0) or (PViejo=0) or
         (Copy(string(Json),PJson,MaxInt)=Copy(string(Intento.RequestUtf8),PViejo,MaxInt)) then
        raise Exception.Create('El documento mantiene los datos rechazados. Corrija el gasto antes de autorizar otro intento.');
      R.Estado:='RECH_LOCAL';R.Mensaje:=MensajeLocal;
      if Application.MessageBox(PChar('La API rechazo el intento anterior en la validacion de Gastos.txt.'+#13#10+
        MensajeLocal+#13#10#13#10+'Se preparo el documento corregido con el mismo e-NCF '+ENcf+'.'+#13#10+
        'El intento original se conservara. Autoriza un nuevo envio corregido?'),
        'Autorizar correccion',MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2)<>IDYES then begin
        PersistirResultadoEcfGasto(ADB,ATrn,Cia,Tipo,ENcf,R);
        AMensaje:='Correccion no enviada. '+MensajeLocal;Exit;
      end;
      ConfirmarRechazoLocalGasto(ADB,Intento.IdIntento);
      R.Estado:='NO_CONFIRMADO';R.Mensaje:='';
    end;
    Iniciada:=not T.InTransaction;if Iniciada then T.StartTransaction;
    try
      Intento:=PrepararIntentoApiGasto(ADB,C,ATrn,ENcf,string(Json),Id,RechazoLocal);
      if Iniciada then T.Commit else T.CommitRetaining;
    except if Iniciada and T.InTransaction then T.Rollback;raise;end;
    MarcarIntentoGastoTransmitiendo(ADB,Id,True);Intento.EstadoLocal:='TRANSMITIENDO';
    try
      Resp:=EnviarIntentoIdesiV1UnaVez(Intento,C,Token,True);Token:='';
    except
      Token:='';MarcarIntentoGastoAmbiguo(ADB,Id,True);
      R.Mensaje:='Envio IDESI incierto. Conservar intento '+Id+' y consultar; no reenviar.';
      R.SalidaCompleta:=R.Mensaje;
      PersistirResultadoEcfGasto(ADB,ATrn,Cia,Tipo,ENcf,R);AMensaje:=R.Mensaje;Exit;
    end;
    RegistrarResultadoHttpGasto(ADB,Id,Resp.StatusCode,Resp.BodyBytes,True);
    R.SalidaCompleta:=string(UTF8Decode(Resp.BodyBytes));
    if EsValidacionLocalGasto(Resp.StatusCode,Resp.BodyBytes) then begin
      R.Estado:='RECH_LOCAL';
      R.Mensaje:=string(UTF8Decode(AnsiString(CampoJson(Resp.BodyBytes,'message'))));
      PersistirResultadoEcfGasto(ADB,ATrn,Cia,Tipo,ENcf,R);
      AMensaje:=R.Mensaje;Exit;
    end;
    if (Resp.StatusCode<200) or (Resp.StatusCode>=300) then begin
      R.Mensaje:='IDESI API HTTP '+IntToStr(Resp.StatusCode)+'. Conservar intento para conciliacion. '+
        string(UTF8Decode(AnsiString(CampoJson(Resp.BodyBytes,'message'))));
      PersistirResultadoEcfGasto(ADB,ATrn,Cia,Tipo,ENcf,R);AMensaje:=R.Mensaje;Exit;
    end;
  end;
  { Tanto un segundo clic como una recuperacion posterior SOLO hacen GET. }
  R.Mensaje:='Intento IDESI registrado. Consultar estado fiscal; no reenviar.';
  PersistirResultadoEcfGasto(ADB,ATrn,Cia,Tipo,ENcf,R);
  try Meta:=ConsultarMetadatosIdesiV1(C,Ini,ENcf);
  except on E:Exception do begin
    AMensaje:=R.Mensaje+' Consulta pendiente: '+E.Message;Exit;
  end;end;
  Fiscal:=Meta;DetalleUsado:=False;MensajeDetalle:='';
  if (Meta.StatusCode=200) and SameText(CampoJson(Meta.BodyBytes,'status'),'NOT_FOUND') then begin
    Contexto:=CargarContextoEstadoGasto(ADB,T,C,Cia,ATrn,ENcf,Intento.IdIntento);
    Fiscal:=ResolverEstadoGastoConDetalles(C,Ini,ENcf,Meta,Contexto,DetalleUsado,MensajeDetalle);
  end;
  R.Mensaje:='IDESI API: consulta fiscal HTTP '+IntToStr(Fiscal.StatusCode)+'. Sin nuevo POST.';
  if (Meta.StatusCode=200) and (Fiscal.StatusCode=200) then begin
    if (CampoJson(Meta.BodyBytes,'companyRnc')<>Rnc) or
       (CampoJson(Meta.BodyBytes,'eNcf')<>ENcf) then
      raise Exception.Create('Metadatos IDESI pertenecen a otro documento.');
    Estado:=UpperCase(CampoJson(Fiscal.BodyBytes,'status'));
    if SameText(CampoJson(Fiscal.BodyBytes,'currentStatusVerified'),'true') then begin
      if Estado='ACCEPTED' then R.Estado:='ACEPTADO'
      else if Estado='REJECTED' then R.Estado:='RECHAZADO'
      else if (Estado='IN_PROCESS') or (Estado='PROCESSING') then R.Estado:='IN_PROCESS';
    end;
    R.TrackId:=CampoJson(Fiscal.BodyBytes,'trackId');
    R.Mensaje:='IDESI API: estado '+Estado+', verificado='+
      CampoJson(Fiscal.BodyBytes,'currentStatusVerified')+'.';
    R.SalidaCompleta:=R.SalidaCompleta+#13#10+string(UTF8Decode(Meta.BodyBytes));
    if DetalleUsado then R.SalidaCompleta:=R.SalidaCompleta+#13#10+
      'CONSULTA_DETALLES '+string(UTF8Decode(Fiscal.BodyBytes));
    if (R.Estado='ACEPTADO') and SameText(CampoJson(Meta.BodyBytes,'metadataStatus'),'AVAILABLE') then begin
      try
      R.Timbre.CodigoSeguridad:=CampoJson(Meta.BodyBytes,'securityCode');
      R.Timbre.ENCF:=ENcf;R.Timbre.FechaEmision:=FechaFiscal(CampoJson(Meta.BodyBytes,'issueDate'));
      R.Timbre.TieneFechaEmision:=True;
      R.Timbre.FechaFirma:=FechaHora(CampoJson(Meta.BodyBytes,'signatureDate'));
      R.Timbre.TieneFechaFirma:=True;R.Timbre.MontoTotal:=MontoFiscal(CampoJson(Meta.BodyBytes,'totalAmount'));
      R.Timbre.TieneMontoTotal:=True;R.Timbre.UrlImage:=CampoJson(Meta.BodyBytes,'urlImage');
      if (R.Timbre.CodigoSeguridad='') or
         (Pos('https://ecf.dgii.gov.do/',LowerCase(R.Timbre.UrlImage))<>1) then
        raise Exception.Create('Timbre fiscal incompleto o URL invalida.');
      R.TieneTimbre:=True;
      except on E:Exception do begin
        R.TieneTimbre:=False;ErrorXml:=' Timbre pendiente: '+E.Message;
      end;end;
    end;
  end;
  if MensajeDetalle<>'' then R.Mensaje:=R.Mensaje+' '+MensajeDetalle;
  if (R.Estado='ACEPTADO') and not R.TieneTimbre then
    ErrorXml:=' Timbre y XML pendientes de recuperacion de metadatos.';
  { Aceptacion y timbre sobreviven a un fallo de descarga. }
  PersistirResultadoEcfGasto(ADB,ATrn,Cia,Tipo,ENcf,R);
  XmlActivado:=ADescargarXml;
  if R.TieneTimbre and XmlActivado then begin
    try
      Xml:=DescargarXmlFirmadoIdesiV1(C,Ini,ENcf);
      if Xml.StatusCode<>200 then raise Exception.Create('HTTP '+IntToStr(Xml.StatusCode));
      Timbre.Rnc:=Rnc;Timbre.ENcf:=ENcf;Timbre.Monto:=R.Timbre.MontoTotal;
      Destino:=XmlDestino(Ini,NombreAmbienteEcf(C.Ambiente),Rnc,ENcf);
      GuardarXmlFirmado(Destino,Xml.BodyBytes,Timbre);R.Timbre.XmlFirmado:=Destino;
      PersistirResultadoEcfGasto(ADB,ATrn,Cia,Tipo,ENcf,R);
    except on E:Exception do ErrorXml:=' XML pendiente: '+E.Message;end;
  end;
  AMensaje:=R.Mensaje+ErrorXml;
end;
end.
