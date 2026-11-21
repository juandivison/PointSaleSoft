unit UEcfApiGastoArtefactos;
interface
uses SysUtils,Classes;
type TTimbreApi = record
 Rnc,ENcf,Codigo:string;Fecha:TDateTime;Monto:Currency;Url:string;
end;
function CampoJson(const Json,Clave:AnsiString):string;
function FechaFiscal(const S:string):TDateTime;
function MontoFiscal(const S:string):Currency;
function XmlDestino(const AIniPath,Ambiente,Rnc,ENcf:string):string;
procedure GuardarXmlFirmado(const Destino:string;const Bytes:AnsiString;const T:TTimbreApi);
function EsValidacionLocalGasto(AHttp:Integer;const ABody:AnsiString):Boolean;
implementation
uses ComObj,Variants;
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


function EsValidacionLocalGasto(AHttp:Integer;const ABody:AnsiString):Boolean;
var Mensaje:string;
begin
  Result:=False;
  if AHttp<>422 then Exit;
  try
    if CampoJson(ABody,'code')<>'ECF_VALIDATION_ERROR' then Exit;
    Mensaje:=CampoJson(ABody,'message');
    { Solo el validador local conocido, antes de construir/enviar al proveedor. }
    Result:=(Pos('Gastos.txt no ',Mensaje)=1) and
      (CampoJson(ABody,'operationId')='') and
      (CampoJson(ABody,'trackId')='') and
      (CampoJson(ABody,'status')='') and
      not SameText(CampoJson(ABody,'sequenceUsed'),'true');
  except Result:=False;end;
end;

end.
