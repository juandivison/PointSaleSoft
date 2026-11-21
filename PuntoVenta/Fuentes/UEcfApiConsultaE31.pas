unit UEcfApiConsultaE31;

{
  CP12-H4: reconciliacion E31 TEST, exclusivamente HTTP GET.
  Sin Firebird, sin POST, sin cambio de estado de intento.
  XML firmado: guarda los bytes tal como los entrega /signed-xml.
  No valida criptograficamente la firma en el cliente.
}

interface

uses SysUtils, UEcfCanalConfig;

type
  TConsultaE31Test = record
    EstadoHttp: Integer;
    EstadoJson: AnsiString;
    MetadataHttp: Integer;
    MetadataJson: AnsiString;
    XmlHttp: Integer;
    XmlBytes: Integer;
    XmlDetalle: string;
    ArchivoXml: string;
  end;

function ConsultarE31YRecuperarXmlTest(
  const AConfig: TEcfCanalConfiguracion;
  const AToken, AENcf: string;
  ANumeroTrn: Integer): TConsultaE31Test;

implementation

uses Windows, Classes, ComObj, Variants;

const
  URL_TEST = 'https://api-staging.idesisa.com';
  WINHTTP_OPTION_SECURE_PROTOCOLS = 9;
  WINHTTP_TLS12 = $00000800;
  WINHTTP_OPTION_ENABLE_REDIRECTS = 6;
  MAX_RESPUESTA = 10 * 1024 * 1024;

type
  TRespuestaGet = record
    Codigo: Integer;
    Bytes: AnsiString;
  end;

procedure ExigirIdentidad(const C: TEcfCanalConfiguracion;
  const AToken, AENcf: string; ANumeroTrn: Integer);
var
  I: Integer;
begin
  if (C.Canal <> ceIdesiApi) or (C.Ambiente <> aeTest) or
     (C.BaseUrl <> URL_TEST) or (C.ClientId <> 'idesi-staging') or
     (C.RncEmisor <> '130177092') then
    raise Exception.Create('Conciliacion H4 limitada a IDESI SRL / TEST.');
  if (Trim(AToken) = '') or (ANumeroTrn <= 0) then
    raise Exception.Create('Token OAuth o numero de transaccion invalido.');
  if (Length(AENcf) <> 13) or (Copy(AENcf,1,3) <> 'E31') then
    raise Exception.Create('Solo e-NCF E31 de 13 caracteres.');
  for I := 4 to 13 do
    if not (AENcf[I] in ['0'..'9']) then
      raise Exception.Create('e-NCF contiene caracteres no numericos.');
end;

function HacerGetTest(const AUrl, AToken, AAccept: string): TRespuestaGet;
var
  Http: OleVariant;
  Datos: OleVariant;
  I, Bajo, Alto, Tamano: Integer;
begin
  Result.Codigo := 0;
  Result.Bytes := '';
  if Copy(AUrl,1,Length(URL_TEST)+1) <> URL_TEST + '/' then
    raise Exception.Create('Host remoto no permitido en consulta TEST.');
  Http := CreateOleObject('WinHttp.WinHttpRequest.5.1');
  Http.SetTimeouts(5000,5000,20000,65000);
  Http.Option[WINHTTP_OPTION_SECURE_PROTOCOLS] := WINHTTP_TLS12;
  { No seguir redirecciones llevando el token fuera del host. }
  Http.Option[WINHTTP_OPTION_ENABLE_REDIRECTS] := False;
  Http.Open('GET',AUrl,False);
  Http.SetRequestHeader('Authorization','Bearer ' + AToken);
  Http.SetRequestHeader('Accept',AAccept);
  Http.Send('');
  Result.Codigo := Integer(Http.Status);
  Datos := Http.ResponseBody;
  if VarIsArray(Datos) then
  begin
    Bajo := VarArrayLowBound(Datos,1);
    Alto := VarArrayHighBound(Datos,1);
    Tamano := Alto-Bajo+1;
    if (Tamano < 0) or (Tamano > MAX_RESPUESTA) then
      raise Exception.Create('Respuesta de consulta excede limite de 10 MB.');
    SetLength(Result.Bytes,Tamano);
    for I := Bajo to Alto do
      Result.Bytes[I-Bajo+1] := Chr(Integer(Datos[I]));
  end;
end;

function GuardarXmlSinSobrescribir(const ABytes: AnsiString;
  const ARnc, AENcf: string; ANumeroTrn: Integer): string;
var
  Directorio, Ruta: string;
  F: TFileStream;
  Anterior: AnsiString;
begin
  Directorio := IncludeTrailingPathDelimiter(GetEnvironmentVariable('TEMP')) +
    'PointSaleSoft_EcfApi_Test';
  if not ForceDirectories(Directorio) then
    raise Exception.Create('No se pudo crear carpeta de XML TEST.');
  Ruta := IncludeTrailingPathDelimiter(Directorio) +
    'TRN_' + IntToStr(ANumeroTrn) + '_' + ARnc + '_' + AENcf + '_firmado.xml';
  if FileExists(Ruta) then
  begin
    { No sobrescribir: verificar bytes del XML previo. }
    F := TFileStream.Create(Ruta,fmOpenRead or fmShareDenyNone);
    try
      if F.Size <> Length(ABytes) then
        raise Exception.Create('XML existente tiene tamano distinto. Revisar.');
      SetLength(Anterior,Length(ABytes));
      if Length(Anterior) > 0 then
        F.ReadBuffer(Anterior[1],Length(Anterior));
    finally
      F.Free;
    end;
    if Anterior <> ABytes then
      raise Exception.Create('XML existente difiere del recuperado. No sobrescribir.');
    Result := Ruta;
    Exit;
  end;
  try
    F := TFileStream.Create(Ruta,fmCreate);
    try
      F.WriteBuffer(ABytes[1],Length(ABytes));
    finally
      F.Free;
    end;
  except
    DeleteFile(PChar(Ruta));
    raise;
  end;
  Result := Ruta;
end;

{
  CP12-H4-R2: leer SOLO campos de texto ASCII conocidos de la
  respuesta JSON de /metadata. Rechaza propiedades duplicadas, controles,
  comillas escapadas y valores no textuales. No es un parser JSON general.
  Campos esperados: companyRnc, eNcf, buyerRnc, securityCode.
}
function CampoTextoJsonMetadata(const AJson: AnsiString;
  const ACampo: string): string;
var
  Clave: AnsiString;
  P, I, Inicio, Segundo: Integer;
begin
  Result := '';
  Clave := AnsiString('"' + ACampo + '"');
  P := Pos(Clave, AJson);
  if P = 0 then
    Exit;

  Segundo := Pos(Clave, Copy(AJson, P + Length(Clave), MaxInt));
  if Segundo > 0 then
    raise Exception.Create('Campo metadata duplicado: ' + ACampo);

  I := P + Length(Clave);
  while (I <= Length(AJson)) and (AJson[I] in [#9, #10, #13, ' ']) do
    Inc(I);
  if (I > Length(AJson)) or (AJson[I] <> ':') then
    raise Exception.Create('Campo metadata sin separador: ' + ACampo);
  Inc(I);
  while (I <= Length(AJson)) and (AJson[I] in [#9, #10, #13, ' ']) do
    Inc(I);
  if (I > Length(AJson)) or (AJson[I] <> '"') then
    raise Exception.Create('Campo metadata no es texto: ' + ACampo);
  Inc(I);
  Inicio := I;
  while (I <= Length(AJson)) and (AJson[I] <> '"') do
  begin
    if (AJson[I] = '\') or (Ord(AJson[I]) < 32) or (Ord(AJson[I]) > 127) then
      raise Exception.Create('Campo metadata ASCII invalido: ' + ACampo);
    Inc(I);
  end;
  if I > Length(AJson) then
    raise Exception.Create('Campo metadata sin cierre: ' + ACampo);
  Result := string(Copy(AJson, Inicio, I - Inicio));
  Inc(I);
  while (I <= Length(AJson)) and (AJson[I] in [#9, #10, #13, ' ']) do
    Inc(I);
  if (I <= Length(AJson)) and not (AJson[I] in [',', '}']) then
    raise Exception.Create('Campo metadata mal delimitado: ' + ACampo);
end;

function CodigoSeguridadEnUrl(const Codigo: string): string;
var
  I: Integer;
begin
  if Length(Codigo) <> 6 then
    raise Exception.Create('Codigo de seguridad debe tener 6 caracteres.');
  Result := '';
  for I := 1 to Length(Codigo) do
    case Codigo[I] of
      'A'..'Z', 'a'..'z', '0'..'9': Result := Result + Codigo[I];
      '+': Result := Result + '%2B';
      '/': Result := Result + '%2F';
    else
      raise Exception.Create('Caracter invalido en codigo de seguridad.');
    end;
end;

function RncCompradorValido(const ARnc: string): Boolean;
var
  I: Integer;
begin
  Result := (Length(ARnc) = 9) or (Length(ARnc) = 11);
  if Result then
    for I := 1 to Length(ARnc) do
      if not (ARnc[I] in ['0'..'9']) then
      begin
        Result := False;
        Exit;
      end;
end;

function ConsultarE31YRecuperarXmlTest(
  const AConfig: TEcfCanalConfiguracion;
  const AToken, AENcf: string;
  ANumeroTrn: Integer): TConsultaE31Test;
var
  Url, Comprador, Seguridad, EmisorMetadata, ENcfMetadata: string;
  MensajeEstado: string;
  R: TRespuestaGet;
  PuedeConsultarDetalles: Boolean;
begin
  Result.EstadoHttp := 0;
  Result.EstadoJson := '';
  Result.MetadataHttp := 0;
  Result.MetadataJson := '';
  Result.XmlHttp := 0;
  Result.XmlBytes := 0;
  Result.XmlDetalle := '';
  Result.ArchivoXml := '';
  ExigirIdentidad(AConfig,AToken,AENcf,ANumeroTrn);
  Url := URL_TEST + '/api/v1/ecf/' + AConfig.RncEmisor + '/' + AENcf;

  { 1. Obtener RNC del comprador y codigo de seguridad desde la API,
    no del numero de transaccion ni de datos digitados nuevamente. }
  PuedeConsultarDetalles := False;
  MensajeEstado := '';
  Comprador := '';
  Seguridad := '';
  try
    R := HacerGetTest(Url + '/metadata',AToken,'application/json');
    Result.MetadataHttp := R.Codigo;
    Result.MetadataJson := R.Bytes;
    if R.Codigo = 200 then
    begin
      try
        EmisorMetadata := CampoTextoJsonMetadata(R.Bytes, 'companyRnc');
        ENcfMetadata := CampoTextoJsonMetadata(R.Bytes, 'eNcf');
        Comprador := CampoTextoJsonMetadata(R.Bytes, 'buyerRnc');
        Seguridad := CampoTextoJsonMetadata(R.Bytes, 'securityCode');
        if (EmisorMetadata <> AConfig.RncEmisor) or
           (ENcfMetadata <> AENcf) then
          raise Exception.Create('metadata no corresponde a emisor/e-NCF solicitado.');
        if not RncCompradorValido(Comprador) then
          raise Exception.Create('RNC comprador no valido en metadata.');
        { Valida los 6 caracteres y codifica + y /; no se escribe
          el token ni la URL autenticada en archivos. }
        CodigoSeguridadEnUrl(Seguridad);
        PuedeConsultarDetalles := True;
      except
        on E: Exception do
          MensajeEstado := 'DETALLES NO DISPONIBLES: ' + E.Message;
      end;
    end
    else
      MensajeEstado := 'Metadata HTTP ' + IntToStr(R.Codigo) +
        ': se intenta consulta basica.';
  except
    on E: Exception do
    begin
      Result.MetadataHttp := 0;
      Result.MetadataJson := AnsiString('Error metadata: ' + E.Message);
      MensajeEstado := 'Metadata no disponible; se intenta consulta basica.';
    end;
  end;

  { 2. Consulta fiscal real: /details con RNC comprador y CodigoSeguridad.
    Si faltan, la consulta basica puede devolver ECF_SECURITY_CODE_REQUIRED;
    eso no equivale a un rechazo. No cambia el estado del intento. }
  try
    if PuedeConsultarDetalles then
      R := HacerGetTest(Url + '/details?rncComprador=' + Comprador +
        '&codigoSeguridad=' + CodigoSeguridadEnUrl(Seguridad),
        AToken,'application/json')
    else
      R := HacerGetTest(Url,AToken,'application/json');
    Result.EstadoHttp := R.Codigo;
    if MensajeEstado = '' then
      Result.EstadoJson := R.Bytes
    else
      Result.EstadoJson := AnsiString(MensajeEstado + #13#10) + R.Bytes;
  except
    on E: Exception do
    begin
      Result.EstadoHttp := 0;
      Result.EstadoJson := AnsiString('Error consultando estado: ' + E.Message);
    end;
  end;

  { 3. Descarga siempre independiente. Los bytes del XML NO se
    decodifican, transforman ni sobrescriben silenciosamente. }
  try
    R := HacerGetTest(Url + '/signed-xml',AToken,'application/xml');
    Result.XmlHttp := R.Codigo;
    if R.Codigo = 200 then
    begin
      Result.XmlBytes := Length(R.Bytes);
      if (Result.XmlBytes = 0) or
         (Pos(AnsiString(AENcf),R.Bytes) = 0) or
         (Pos(AnsiString(AConfig.RncEmisor),R.Bytes) = 0) then
        Result.XmlDetalle :=
          'XML recibido pero su contenido no confirma RNC/e-NCF: NO guardado.'
      else
        Result.ArchivoXml := GuardarXmlSinSobrescribir(R.Bytes,
          AConfig.RncEmisor,AENcf,ANumeroTrn);
    end
    else
      Result.XmlDetalle := 'XML no disponible. Respuesta HTTP ' +
        IntToStr(R.Codigo) + ': ' + Copy(string(R.Bytes),1,800);
  except
    on E: Exception do
      Result.XmlDetalle := 'Error recuperando XML: ' + E.Message;
  end;
end;

end.
