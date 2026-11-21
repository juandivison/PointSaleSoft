unit UEcfApiTimbreLog;

{ CP13.13 - PointSaleSoft / Delphi 7 / Firebird 2.5.
  Recupera XML firmado y timbre por IDESI API (solo GET).
  No hace POST ni cambia ECF_API_INTENTO ni STATUS de la factura.
  ECF_TIMBRE_LOG reproduce las 7 columnas usadas por IdesiToolECF.exe.
}

interface

uses IBDatabase;

function EsDocumentoCanalIdesiApi(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  ANumeroTrn: Integer): Boolean;

function RecuperarTimbreIdesiApi(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  ANumeroTrn: Integer; const AIniPath: string;
  out AMensaje: string): Boolean;

implementation

uses SysUtils, Classes, DB, IBQuery, ComObj, Variants,
  UEcfApiConsultaDocumento, UEcfApiClienteV1, UEcfApiSwitch,
  UEcfApiIntento, UEcfCanalConfig;

type
  TTimbreApi = record
    Rnc: string;
    ENcf: string;
    Codigo: string;
    Fecha: TDateTime;
    Monto: Currency;
    Url: string;
  end;

function CampoJson(const Json, Clave: AnsiString): string;
var
  P, I, J, Codigo: Integer;
  Raw, S: AnsiString;
  Hex: string;
begin
  Result := '';
  P := Pos('"' + Clave + '"', Json);
  if P = 0 then Exit;
  I := P + Length(Clave) + 2;
  while (I <= Length(Json)) and (Json[I] in [#9, #10, #13, ' ']) do Inc(I);
  if (I > Length(Json)) or (Json[I] <> ':') then
    raise Exception.Create('Respuesta metadata JSON invalida.');
  Inc(I);
  while (I <= Length(Json)) and (Json[I] in [#9, #10, #13, ' ']) do Inc(I);
  if I > Length(Json) then
    raise Exception.Create('Respuesta metadata JSON incompleta.');
  if Json[I] <> '"' then
  begin
    J := I;
    while (J <= Length(Json)) and not (Json[J] in [',', '}', #9, #10, #13, ' ']) do Inc(J);
    Result := string(Copy(Json, I, J-I));
    if SameText(Result,'null') then Result := '';
    Exit;
  end;
  Inc(I);
  Raw := '';
  while I <= Length(Json) do
  begin
    if Json[I] = '"' then
    begin
      Result := string(Raw);
      Exit;
    end;
    if Json[I] <> '\' then
    begin
      Raw := Raw + Json[I];
      Inc(I);
      Continue;
    end;
    Inc(I);
    if I > Length(Json) then Break;
    case Json[I] of
      '"', '\', '/': Raw := Raw + Json[I];
      'n': Raw := Raw + #10;
      'r': Raw := Raw + #13;
      't': Raw := Raw + #9;
      'u':
        begin
          if I + 4 > Length(Json) then Break;
          Hex := '$' + string(Copy(Json,I+1,4));
          Codigo := StrToIntDef(Hex,-1);
          if (Codigo < 0) or (Codigo > 127) then
            raise Exception.Create('Metadata contiene escape Unicode inesperado.');
          Raw := Raw + AnsiChar(Codigo);
          Inc(I,4);
        end;
    else
      raise Exception.Create('Escape JSON no admitido en metadata.');
    end;
    Inc(I);
  end;
  raise Exception.Create('Cadena JSON metadata sin cierre.');
end;

function FechaFiscal(const S: string): TDateTime;
var
  D, M, Y: Word;
  T: string;
begin
  T := Trim(S);
  if Length(T) < 10 then
    raise Exception.Create('FechaEmision ausente o invalida en metadata.');
  T := Copy(T,1,10);
  if (T[5] = '-') and (T[8] = '-') then
  begin
    Y := StrToInt(Copy(T,1,4));
    M := StrToInt(Copy(T,6,2));
    D := StrToInt(Copy(T,9,2));
  end
  else if (T[3] in ['/','-']) and (T[6] in ['/','-']) then
  begin
    D := StrToInt(Copy(T,1,2));
    M := StrToInt(Copy(T,4,2));
    Y := StrToInt(Copy(T,7,4));
  end
  else
    raise Exception.Create('Formato FechaEmision no admitido.');
  Result := EncodeDate(Y,M,D);
end;

function MontoFiscal(const S: string): Currency;
var
  T: string;
begin
  T := StringReplace(Trim(S),'.',DecimalSeparator,[rfReplaceAll]);
  if T = '' then raise Exception.Create('MontoTotal vacio en metadata.');
  Result := StrToCurr(T);
  if Result < 0 then raise Exception.Create('MontoTotal negativo en metadata.');
end;

procedure CargarIdentidadLocal(ADatabase: TIBDatabase;
  ATransaction: TIBTransaction; ANumeroTrn: Integer;
  out ARnc, AENcf: string);
var
  Q: TIBQuery;
  Iniciada: Boolean;
begin
  ARnc := ''; AENcf := '';
  Iniciada := not ATransaction.InTransaction;
  if Iniciada then ATransaction.StartTransaction;
  try
    Q := TIBQuery.Create(nil);
    try
      Q.Database := ADatabase;
      Q.Transaction := ATransaction;
      Q.SQL.Text :=
        'SELECT C.RNC_NUMERO AS RNC, N.NUMERO_NCF AS ENCF ' +
        'FROM VENTAS_MAST V JOIN COMPANIA C ON C.CODIGO=V.CIA_KEY ' +
        'JOIN NCF_ASIGNADOS N ON N.SERIE=V.SERIE_NCF_ASIGNADO ' +
        'WHERE V.NUMERO=:TRN';
      Q.ParamByName('TRN').AsInteger := ANumeroTrn;
      Q.Open;
      if Q.Eof then raise Exception.Create('Factura no encontrada en Firebird.');
      ARnc := Trim(Q.FieldByName('RNC').AsString);
      AENcf := Trim(Q.FieldByName('ENCF').AsString);
    finally Q.Free; end;
  finally
    if Iniciada and ATransaction.InTransaction then ATransaction.Rollback;
  end;
end;

procedure ValidarXmlFirmado(const Archivo: string; const T: TTimbreApi);
var
  Xml: OleVariant;
  N: OleVariant;
  Valor, XmlENcf: string;

  function Texto(const XPath: string): string;
  begin
    N := Xml.selectSingleNode(XPath);
    if VarIsNull(N) or VarIsEmpty(N) then Result := ''
    else Result := Trim(string(N.text));
  end;
begin
  Xml := CreateOleObject('Msxml2.DOMDocument.6.0');
  Xml.async := False;
  Xml.resolveExternals := False;
  Xml.validateOnParse := False;
  Xml.setProperty('ProhibitDTD', True);
  Xml.setProperty('SelectionLanguage', 'XPath');
  if not Xml.load(Archivo) then
    raise Exception.Create('XML firmado no es XML valido.');
  if not SameText(Texto('//*[local-name()="RNCEmisor"]'),T.Rnc) then
    raise Exception.Create('XML firmado: RNC emisor diferente de la factura.');
  XmlENcf := Texto('//*[local-name()="eNCF"]');
  if XmlENcf = '' then
    XmlENcf := Texto('//*[local-name()="ENCF"]');
  if not SameText(XmlENcf,T.ENcf) then
    raise Exception.Create('XML firmado: e-NCF diferente de la factura.');
  Valor := Texto('//*[local-name()="MontoTotal"]');
  if (Valor = '') or (Abs(MontoFiscal(Valor)-T.Monto) > 0.01) then
    raise Exception.Create('XML firmado: monto diferente de metadata.');
  Valor := Texto('//*[local-name()="SignatureValue"]');
  if Valor = '' then
    raise Exception.Create('XML no contiene SignatureValue.');
  { Esta comprobacion es estructural; NO es verificacion criptografica XMLDSig. }
end;

function XmlDestino(const AIniPath, Ambiente, Rnc, ENcf: string): string;
var
  Dir: string;
begin
  Dir := IncludeTrailingPathDelimiter(ExtractFilePath(ExpandFileName(AIniPath))) +
    'XML_Firmados' + '\' + Ambiente;
  if not DirectoryExists(Dir) and not ForceDirectories(Dir) then
    raise Exception.Create('No se pudo crear directorio XML firmados.');
  Result := IncludeTrailingPathDelimiter(Dir) + Rnc + ENcf + '.xml';
end;

procedure GuardarXmlFirmado(const Destino: string; const Bytes: AnsiString;
  const T: TTimbreApi);
var
  Tmp: string;
  F: TFileStream;
  Ant: TMemoryStream;
  Actual: TMemoryStream;
  Igual: Boolean;
  G: TGUID;
  GTexto: string;
begin
  if (Bytes = '') or (Length(Bytes) > 10*1024*1024) then
    raise Exception.Create('XML firmado ausente o demasiado grande.');
  if CreateGUID(G) <> 0 then
    raise Exception.Create('No se pudo crear nombre temporal para XML.');
  GTexto := GUIDToString(G);
  GTexto := StringReplace(GTexto,'{','',[rfReplaceAll]);
  GTexto := StringReplace(GTexto,'}','',[rfReplaceAll]);
  Tmp := Destino + '.' + GTexto + '.tmp';
  F := TFileStream.Create(Tmp,fmCreate);
  try
    F.WriteBuffer(Bytes[1], Length(Bytes));
  finally F.Free; end;
  try
    ValidarXmlFirmado(Tmp,T);
    if FileExists(Destino) then
    begin
      Ant := TMemoryStream.Create;
      Actual := TMemoryStream.Create;
      try
        Ant.LoadFromFile(Destino);
        Actual.LoadFromFile(Tmp);
        Igual := (Ant.Size=Actual.Size);
        if Igual and (Ant.Size > 0) then
          Igual := CompareMem(Ant.Memory,Actual.Memory,Ant.Size);
      finally
        Actual.Free;
        Ant.Free;
      end;
      if not Igual then
        raise Exception.Create('XML firmado anterior diferente: no sobrescribir.');
    end
    else if not RenameFile(Tmp,Destino) then
      raise Exception.Create('No se pudo guardar el XML firmado.');
  finally
    if FileExists(Tmp) then DeleteFile(Tmp);
  end;
end;

function GeneradorDisponible(ADatabase: TIBDatabase;
  ATransaction: TIBTransaction; const Nombre: string): Boolean;
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(nil);
  try
    Q.Database := ADatabase;
    Q.Transaction := ATransaction;
    Q.SQL.Text := 'SELECT FIRST 1 RDB$GENERATOR_NAME FROM RDB$GENERATORS ' +
      'WHERE RDB$GENERATOR_NAME=:GEN';
    Q.ParamByName('GEN').AsString := Nombre;
    Q.Open;
    Result := not Q.Eof;
  finally Q.Free; end;
end;

function SiguienteId(ADatabase: TIBDatabase;
  ATransaction: TIBTransaction): Integer;
var
  Q: TIBQuery;
  Nombre: string;
begin
  Nombre := '';
  if GeneradorDisponible(ADatabase,ATransaction,'GEN_ECF_TIMBRE_LOG_ID') then
    Nombre := 'GEN_ECF_TIMBRE_LOG_ID'
  else if GeneradorDisponible(ADatabase,ATransaction,'GEN_ECF_TIMBRE_LOG') then
    Nombre := 'GEN_ECF_TIMBRE_LOG';
  if Nombre = '' then
    raise Exception.Create('No existe generador para ECF_TIMBRE_LOG; revisar esquema.');
  Q := TIBQuery.Create(nil);
  try
    Q.Database := ADatabase;
    Q.Transaction := ATransaction;
    { Nombre procede exclusivamente de una lista fija; nunca del usuario. }
    Q.SQL.Text := 'SELECT GEN_ID(' + Nombre + ',1) AS ID FROM RDB$DATABASE';
    Q.Open;
    Result := Q.FieldByName('ID').AsInteger;
  finally Q.Free; end;
end;

procedure GuardarTimbre(ADatabase: TIBDatabase;
  ATransaction: TIBTransaction; ANumeroTrn: Integer; const T: TTimbreApi);
var
  Q: TIBQuery;
  Iniciada, Existe: Boolean;
  Id: Integer;
  ENcfPrevio: string;
begin
  Iniciada := not ATransaction.InTransaction;
  if Iniciada then ATransaction.StartTransaction;
  try
    Q := TIBQuery.Create(nil);
    try
      Q.Database := ADatabase;
      Q.Transaction := ATransaction;
      Q.SQL.Text := 'SELECT FIRST 1 ID,ENCF FROM ECF_TIMBRE_LOG ' +
        'WHERE TRN=:TRN ORDER BY FECHA_CREACION DESC';
      Q.ParamByName('TRN').AsInteger := ANumeroTrn;
      Q.Open;
      Existe := not Q.Eof;
      if Existe then
      begin
        Id := Q.FieldByName('ID').AsInteger;
        ENcfPrevio := Trim(Q.FieldByName('ENCF').AsString);
        if (ENcfPrevio <> '') and not SameText(ENcfPrevio,T.ENcf) then
          raise Exception.Create('ECF_TIMBRE_LOG ya contiene otro e-NCF para este TRN.');
      end;
      Q.Close;
      if not Existe then Id := SiguienteId(ADatabase,ATransaction);
      if Existe then
        Q.SQL.Text :=
          'UPDATE ECF_TIMBRE_LOG SET ENCF=:ENCF, ' +
          'CODIGO_SEGURIDAD=:CODIGO,FECHA_EMISION=:FECHA, ' +
          'MONTO_TOTAL=:MONTO,URL_IMAGE=:URL WHERE ID=:ID'
      else
        Q.SQL.Text :=
          'INSERT INTO ECF_TIMBRE_LOG ' +
          '(ID,TRN,ENCF,CODIGO_SEGURIDAD,FECHA_EMISION,MONTO_TOTAL,URL_IMAGE) ' +
          'VALUES(:ID,:TRN,:ENCF,:CODIGO,:FECHA,:MONTO,:URL)';
      Q.ParamByName('ID').AsInteger := Id;
      if not Existe then Q.ParamByName('TRN').AsInteger := ANumeroTrn;
      Q.ParamByName('ENCF').AsString := T.ENcf;
      Q.ParamByName('CODIGO').AsString := T.Codigo;
      Q.ParamByName('FECHA').AsDateTime := T.Fecha;
      Q.ParamByName('MONTO').AsCurrency := T.Monto;
      Q.ParamByName('URL').AsString := T.Url;
      Q.ExecSQL;
      if Q.RowsAffected <> 1 then
        raise Exception.Create('No se pudo persistir ECF_TIMBRE_LOG.');
    finally Q.Free; end;
    if Iniciada then ATransaction.Commit
    else ATransaction.CommitRetaining; { Convencion vigente del ERP. }
  except
    if Iniciada and ATransaction.InTransaction then ATransaction.Rollback;
    raise;
  end;
end;

{ CP13.14: solo despues de metadata ACCEPTED verificada, XML correspondiente
  y timbre persistido. Reutiliza SP_ECF_UPDATE_ESTADO del flujo legacy.
  No modifica VENTAS_MAST ni el estado local ECF_API_INTENTO. }
procedure ActualizarEstadoDgiiAceptado(ADatabase: TIBDatabase;
  ATransaction: TIBTransaction; ANumeroTrn: Integer;
  const AENcf, ATrackId: string);
var
  Q: TIBQuery;
  Iniciada: Boolean;
  Serie: Integer;
  EstadoActual, ENcfLocal, TrackId: string;
  DebeActualizar: Boolean;
begin
  Iniciada := not ATransaction.InTransaction;
  if Iniciada then ATransaction.StartTransaction;
  try
    Q := TIBQuery.Create(nil);
    try
      Q.Database := ADatabase;
      Q.Transaction := ATransaction;
      Q.SQL.Text :=
        'SELECT V.SERIE_NCF_ASIGNADO AS SERIE, N.NUMERO_NCF, ' +
        'N.DGII_STATUS, N.TRACK_ID ' +
        'FROM VENTAS_MAST V JOIN NCF_ASIGNADOS N ' +
        'ON N.SERIE=V.SERIE_NCF_ASIGNADO ' +
        'WHERE V.NUMERO=:TRN';
      Q.ParamByName('TRN').AsInteger := ANumeroTrn;
      Q.Open;
      if Q.Eof then
        raise Exception.Create('No existe asociacion TRN/NCF para persistir estado DGII.');
      Serie := Q.FieldByName('SERIE').AsInteger;
      ENcfLocal := Trim(Q.FieldByName('NUMERO_NCF').AsString);
      EstadoActual := Trim(Q.FieldByName('DGII_STATUS').AsString);
      TrackId := Trim(ATrackId);
      if TrackId = '' then
        TrackId := Trim(Q.FieldByName('TRACK_ID').AsString);
      if (Serie <= 0) or (not SameText(ENcfLocal,AENcf)) then
        raise Exception.Create('Estado DGII: TRN y e-NCF no coinciden con Firebird.');
      DebeActualizar := not SameText(EstadoActual,'ACEPTADO');
      Q.Close;
      if DebeActualizar then
      begin
        { Misma firma utilizada por IdesiToolECF.Services.FirebirdRepo.SpUpdateEstado. }
        Q.SQL.Text :=
          'EXECUTE PROCEDURE SP_ECF_UPDATE_ESTADO(' +
          ':SERIE,:ESTADO,:TRACKID,:MENSAJE)';
        Q.ParamByName('SERIE').AsInteger := Serie;
        Q.ParamByName('ESTADO').AsString := 'ACEPTADO';
        Q.ParamByName('TRACKID').AsString := TrackId;
        Q.ParamByName('MENSAJE').AsString := '';
        Q.ExecSQL;
        Q.SQL.Text :=
          'SELECT DGII_STATUS FROM NCF_ASIGNADOS WHERE SERIE=:SERIE';
        Q.ParamByName('SERIE').AsInteger := Serie;
        Q.Open;
        if Q.Eof or
           (not SameText(Trim(Q.FieldByName('DGII_STATUS').AsString),'ACEPTADO')) then
          raise Exception.Create('SP_ECF_UPDATE_ESTADO no persistio ACEPTADO.');
        Q.Close;
        if Iniciada then ATransaction.Commit
        else ATransaction.CommitRetaining;
      end
      else if Iniciada then
        ATransaction.Rollback;
    finally
      Q.Free;
    end;
  except
    if Iniciada and ATransaction.InTransaction then
      ATransaction.Rollback;
    raise;
  end;
end;

function EsDocumentoCanalIdesiApi(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  ANumeroTrn: Integer): Boolean;
var
  Rnc, ENcf: string;
  Config: TEcfCanalConfiguracion;
  Intento: TEcfApiIntento;
  TieneIntento: Boolean;
begin
  if (ADatabase = nil) or (ATransaction = nil) or
     (not ADatabase.Connected) or (ANumeroTrn <= 0) then
    raise Exception.Create('Documento invalido para resolver canal e-CF.');
  CargarIdentidadLocal(ADatabase,ATransaction,ANumeroTrn,Rnc,ENcf);
  Config := ResolverCanalEcfConsulta(ADatabase,ATransaction,
    Rnc,ANumeroTrn,TieneIntento,Intento);
  if TieneIntento and not SameText(Intento.ENcf,ENcf) then
    raise Exception.Create('Intento API historico no coincide con el e-NCF.');
  Result := Config.Canal = ceIdesiApi;
end;

function RecuperarTimbreIdesiApi(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  ANumeroTrn: Integer; const AIniPath: string;
  out AMensaje: string): Boolean;
var
  Meta, Xml: TEcfApiRespuestaV1;
  Rnc, ENcf, Ambiente, Destino, EStatus, MetaStatus: string;
  Config: TEcfCanalConfiguracion;
  Intento: TEcfApiIntento;
  TieneIntento: Boolean;
  T: TTimbreApi;
  I: Integer;
begin
  Result := False;
  AMensaje := '';
  if (ADatabase = nil) or (ATransaction = nil) or
     (not ADatabase.Connected) or (ANumeroTrn <= 0) then
    raise Exception.Create('Parametros invalidos para recuperar timbre IDESI.');
  CargarIdentidadLocal(ADatabase,ATransaction,ANumeroTrn,Rnc,ENcf);
  Config := ResolverCanalEcfConsulta(ADatabase,ATransaction,
    Rnc,ANumeroTrn,TieneIntento,Intento);
  if Config.Canal <> ceIdesiApi then
    raise Exception.Create('La factura no pertenece al canal IDESI API.');
  if TieneIntento and not SameText(Intento.ENcf,ENcf) then
    raise Exception.Create('Intento previo corresponde a otro e-NCF.');
  Meta := ConsultarDocumentoIdesiApi(ADatabase,ATransaction,
    ANumeroTrn,AIniPath,ectMetadatos,'','');
  if Meta.StatusCode <> 200 then
  begin
    AMensaje := 'Metadata IDESI HTTP '+IntToStr(Meta.StatusCode)+'. Sin modificar timbre.';
    Exit;
  end;
  EStatus := CampoJson(Meta.BodyBytes,'status');
  MetaStatus := CampoJson(Meta.BodyBytes,'metadataStatus');
  if not SameText(CampoJson(Meta.BodyBytes,'currentStatusVerified'),'true') or
     not SameText(EStatus,'ACCEPTED') or
     not SameText(MetaStatus,'AVAILABLE') then
  begin
    AMensaje := 'Timbre pendiente: estado DGII='+EStatus+
      ', verificado='+CampoJson(Meta.BodyBytes,'currentStatusVerified')+
      ', metadata='+MetaStatus+'. Sin escribir ECF_TIMBRE_LOG.';
    Exit;
  end;
  if (not SameText(CampoJson(Meta.BodyBytes,'companyRnc'),Rnc)) or
     (not SameText(CampoJson(Meta.BodyBytes,'eNcf'),ENcf)) then
    raise Exception.Create('Metadata fiscal no corresponde a la factura local.');
  T.Rnc := Rnc;
  T.ENcf := ENcf;
  T.Codigo := CampoJson(Meta.BodyBytes,'securityCode');
  if Length(T.Codigo) <> 6 then
    raise Exception.Create('CodigoSeguridad invalido en metadata.');
  for I := 1 to 6 do
    if not (T.Codigo[I] in ['a'..'z','A'..'Z','0'..'9','+','/']) then
      raise Exception.Create('CodigoSeguridad contiene caracteres invalidos.');
  T.Fecha := FechaFiscal(CampoJson(Meta.BodyBytes,'issueDate'));
  T.Monto := MontoFiscal(CampoJson(Meta.BodyBytes,'totalAmount'));
  T.Url := CampoJson(Meta.BodyBytes,'urlImage');
  if (Length(T.Url) > 1024) or
     ((Pos('https://ecf.dgii.gov.do/',LowerCase(T.Url)) <> 1) and
      (Pos('https://fc.dgii.gov.do/',LowerCase(T.Url)) <> 1)) then
    raise Exception.Create('URL_IMAGE ausente o URL DGII invalida.');
  Xml := ConsultarDocumentoIdesiApi(ADatabase,ATransaction,
    ANumeroTrn,AIniPath,ectXmlFirmado,'','');
  if (Xml.StatusCode <> 200) or (Xml.BodyBytes = '') then
  begin
    AMensaje := 'DGII acepto el e-CF, XML firmado aun no disponible (HTTP '+
      IntToStr(Xml.StatusCode)+'). Sin modificar timbre.';
    Exit;
  end;
  Ambiente := NombreAmbienteEcf(Config.Ambiente);
  Destino := XmlDestino(AIniPath,Ambiente,Rnc,ENcf);
  GuardarXmlFirmado(Destino,Xml.BodyBytes,T);
  GuardarTimbre(ADatabase,ATransaction,ANumeroTrn,T);
  { CP13.14: el estado fiscal se toma de metadata DGII, nunca del HTTP POST. }
  ActualizarEstadoDgiiAceptado(ADatabase,ATransaction,ANumeroTrn,
    T.ENcf,CampoJson(Meta.BodyBytes,'trackId'));
  Result := True;
  AMensaje := 'XML firmado recuperado y ECF_TIMBRE_LOG actualizado. e-NCF='+
    ENcf+', TRN='+IntToStr(ANumeroTrn)+'. No se hizo POST.';
  { La firma XMLDSig y estado CONCILIADO siguen siendo otro checkpoint. }
end;

end.
