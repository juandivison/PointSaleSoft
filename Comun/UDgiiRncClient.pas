unit UDgiiRncClient;

interface

uses
  Classes, SysUtils;

type
  // Datos devueltos por la API DGII
  TDgiiRncInfo = record
    Rnc: string;
    NombreCompleto: string;
    NombreComercial: string;
    Actividad: string;
    FechaRegistro: string;
    Estado: string;
    Categoria: string;
  end;

  // Estado simplificado de la consulta
  TDgiiRncEstadoConsulta = (
    drcDesconocido,
    drcActivo,
    drcNoEncontrado,
    drcNoActivo,
    drcError
  );

  // Cliente HTTP para la API DGII /api/DGII/{rnc}
  TDgiiRncClient = class
  private
    FBaseUrl: string;
    FEndpoint: string;
    FTimeout: Integer;
    function BuildUrl(const ARncOCedula: string): string;
  public
    constructor Create(const ABaseUrl, AEndpoint: string; ATimeoutMs: Integer = 15000);

    // RESULT:
    //   True  -> la llamada HTTP fue válida (incluye caso "no encontrado")
    //   False -> error técnico (no hubo forma de obtener/parsing la respuesta)
    function ConsultarRnc(
      const ARncOCedula: string;
      out AInfo: TDgiiRncInfo;
      out AEstadoConsulta: TDgiiRncEstadoConsulta;
      out AError: string
    ): Boolean;
  end;

  // Función de alto nivel:
  // RESULT:
  //   True  -> RNC/Cédula EXISTE y está ACTIVO
  //   False -> no existe, no está ACTIVO o hubo error (ver AError)
  function DGIIRncEstaActivo(
    const ABaseUrl, AEndpoint: string;
    const ARncOCedula: string;
    out AInfo: TDgiiRncInfo;
    out AError: string
  ): Boolean;

implementation

uses
  StrUtils,
  IdHTTP, IdURI, IdException;

{ Helpers internos ---------------------------------------------------------- }

function ExtractJsonValue(const AJson, AKey: string): string;
var
  keyPos, colonPos, startPos, endPos: Integer;
  keyPattern: string;
begin
  Result := '';
  keyPattern := '"' + AKey + '"';
  keyPos := Pos(keyPattern, AJson);
  if keyPos = 0 then
    Exit;

  colonPos := PosEx(':', AJson, keyPos + Length(keyPattern));
  if colonPos = 0 then
    Exit;

  startPos := colonPos + 1;

  // Saltar espacios
  while (startPos <= Length(AJson)) and (AJson[startPos] in [' ', #9, #10, #13]) do
    Inc(startPos);

  if startPos > Length(AJson) then
    Exit;

  if AJson[startPos] = '"' then
  begin
    // Valor string
    Inc(startPos);
    endPos := startPos;
    while (endPos <= Length(AJson)) and (AJson[endPos] <> '"') do
    begin
      // Versión simple (no maneja \" escapado)
      Inc(endPos);
    end;
    Result := Copy(AJson, startPos, endPos - startPos);
  end
  else
  begin
    // Valor numérico / boolean (hasta coma, cierre de objeto o espacio)
    endPos := startPos;
    while (endPos <= Length(AJson)) and not (AJson[endPos] in [',', '}', ' ', #9, #10, #13]) do
      Inc(endPos);
    Result := Trim(Copy(AJson, startPos, endPos - startPos));
  end;
end;

function ParseDgiiRncJson(
  const AJson: string;
  out AInfo: TDgiiRncInfo;
  out AEstadoConsulta: TDgiiRncEstadoConsulta;
  out AError: string
): Boolean;
begin
  FillChar(AInfo, SizeOf(AInfo), 0);
  AEstadoConsulta := drcDesconocido;
  AError := '';

  AInfo.Rnc             := ExtractJsonValue(AJson, 'rnc');
  AInfo.NombreCompleto  := ExtractJsonValue(AJson, 'nombreCompleto');
  AInfo.NombreComercial := ExtractJsonValue(AJson, 'nombreComercial');
  AInfo.Actividad       := ExtractJsonValue(AJson, 'actividad');
  AInfo.FechaRegistro   := ExtractJsonValue(AJson, 'fechaRegistro');
  AInfo.Estado          := ExtractJsonValue(AJson, 'estado');
  AInfo.Categoria       := ExtractJsonValue(AJson, 'categoria');

  if Trim(AInfo.Rnc) = '' then
  begin
    Result := False;
    AError := 'Respuesta DGII sin campo "rnc".';
    Exit;
  end;

  if SameText(Trim(AInfo.Estado), 'ACTIVO') then
    AEstadoConsulta := drcActivo
  else if Trim(AInfo.Estado) = '' then
    AEstadoConsulta := drcDesconocido
  else
    AEstadoConsulta := drcNoActivo;

  Result := True;
end;

{ TDgiiRncClient ----------------------------------------------------------- }

constructor TDgiiRncClient.Create(const ABaseUrl, AEndpoint: string; ATimeoutMs: Integer);
begin
  inherited Create;
  FBaseUrl  := Trim(ABaseUrl);
  FEndpoint := Trim(AEndpoint);
  FTimeout  := ATimeoutMs;

  // Normalizar base URL
  if (FBaseUrl <> '') and (FBaseUrl[Length(FBaseUrl)] = '/') then
    Delete(FBaseUrl, Length(FBaseUrl), 1);

  // Asegurar '/' inicial en el endpoint
  if (FEndpoint <> '') and (FEndpoint[1] <> '/') then
    FEndpoint := '/' + FEndpoint;
end;

function TDgiiRncClient.BuildUrl(const ARncOCedula: string): string;
var
  Doc: string;
begin
  Doc := Trim(ARncOCedula);
  // Quitar guiones por si acaso
  Doc := StringReplace(Doc, '-', '', [rfReplaceAll]);

  // /api/DGII/{rnc}
  Result :=
    FBaseUrl +
    FEndpoint + '/' +
    TIdURI.PathEncode(Doc);
end;

function TDgiiRncClient.ConsultarRnc(
  const ARncOCedula: string;
  out AInfo: TDgiiRncInfo;
  out AEstadoConsulta: TDgiiRncEstadoConsulta;
  out AError: string
): Boolean;
var
  Http: TIdHTTP;
  Url, Json: string;
begin
  Result := False;
  AError := '';
  AEstadoConsulta := drcDesconocido;
  FillChar(AInfo, SizeOf(AInfo), 0);

  if Trim(ARncOCedula) = '' then
  begin
    AError := 'RNC/Cédula vacío.';
    Exit;
  end;

  Http := TIdHTTP.Create(nil);
  try
    Http.ReadTimeout := FTimeout;
    // En Indy de Delphi 7 no hay ConnectTimeout, usamos solo ReadTimeout
    Http.Request.Accept := 'application/json';
    Http.Request.ContentType := 'application/json';

    Url := BuildUrl(ARncOCedula);

    try
      Json := Http.Get(Url);
      Result := ParseDgiiRncJson(Json, AInfo, AEstadoConsulta, AError);
    except
      on E: EIdHTTPProtocolException do
      begin
        // En Indy viejo no tenemos ErrorCode; usamos el texto del mensaje
        if Pos('404', E.Message) > 0 then
        begin
          AEstadoConsulta := drcNoEncontrado;
          AError := 'RNC/Cédula no encontrado en DGII (HTTP 404).';
          Result := True; // consulta válida pero sin registro
        end
        else
        begin
          AEstadoConsulta := drcError;
          AError := 'Error HTTP al consultar DGII: ' + E.Message;
        end;
      end;
      on E: Exception do
      begin
        AEstadoConsulta := drcError;
        AError := 'Error al consultar DGII: ' + E.Message;
      end;
    end;
  finally
    Http.Free;
  end;
end;

{ Función de alto nivel ---------------------------------------------------- }

function DGIIRncEstaActivo(
  const ABaseUrl, AEndpoint: string;
  const ARncOCedula: string;
  out AInfo: TDgiiRncInfo;
  out AError: string
): Boolean;
var
  Client: TDgiiRncClient;
  Estado: TDgiiRncEstadoConsulta;
  Ok: Boolean;
begin
  Client := TDgiiRncClient.Create(ABaseUrl, AEndpoint);
  try
    Ok := Client.ConsultarRnc(ARncOCedula, AInfo, Estado, AError);
    if not Ok then
    begin
      Result := False;
      Exit;
    end;

    if Estado = drcActivo then
    begin
      Result := True;
      AError := '';
    end
    else
    begin
      Result := False;

      if AError = '' then
      begin
        case Estado of
          drcNoEncontrado:
            AError := 'RNC/Cédula no encontrado en DGII.';
          drcNoActivo:
            AError := 'El contribuyente no se encuentra ACTIVO en DGII (estado=' +
                      AInfo.Estado + ').';
          drcDesconocido:
            AError := 'No fue posible determinar el estado del contribuyente en DGII.';
          drcError:
            AError := 'Error al validar RNC/Cédula en DGII.';
        end;
      end;
    end;
  finally
    Client.Free;
  end;
end;

end.

