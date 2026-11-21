unit UEcfApiHttp;

{
  PointSaleSoft / Delphi 7 (Windows 10/11) / WinHTTP COM.
  HTTP + OAuth de IDESI API. No toca la base ni guarda tokens ni secretos.
  NO calcula impuestos y NO interpreta HTTP 2xx como aceptacion fiscal.
  Primer alcance: SOLO TEST. Nunca retransmite automaticamente un POST.
  WinHTTP exige TLS 1.2; no se desactiva validacion de certificados HTTPS.
}

interface

uses
  SysUtils, Classes, UEcfCanalConfig, UEcfApiIntento;

type
  TEcfApiRespuestaHttp = record
    StatusCode: Integer;
    BodyUtf8: AnsiString;
    IdempotencyReplayed: string;
  end;

  TEcfApiTokenCache = class
  private
    FKey: string;
    FToken: string;
    FValidoHasta: TDateTime;
  public
    constructor Create;
    procedure Limpiar;
    function ObtenerTokenTest(
      const AConfig: TEcfCanalConfiguracion;
      const AClientSecret: string): string;
  end;

function ObtenerTokenIdesiTestCacheGlobal(
  const AConfig: TEcfCanalConfiguracion;
  const AClientSecret: string): string;
function HealthIdesiApiTest(
  const AConfig: TEcfCanalConfiguracion): TEcfApiRespuestaHttp;
function EnviarIntentoE31TestUnaVez(
  const AIntento: TEcfApiIntento; const AAccessToken: string;
  AEmisionAutorizada: Boolean): TEcfApiRespuestaHttp;
function ConsultarDetallesEcfTest(
  const AConfig: TEcfCanalConfiguracion; const AAccessToken,
  AENcf, ARncComprador, ACodigoSeguridad: string): TEcfApiRespuestaHttp;

implementation

uses
  ComObj, Variants, DateUtils, Windows;

const
  URL_TEST = 'https://api-staging.idesisa.com';
  CLIENT_TEST = 'idesi-staging';
  WINHTTP_OPTION_SECURE_PROTOCOLS = 9;
  WINHTTP_TLS12 = $00000800;

var
  CacheGlobal: TEcfApiTokenCache;
  TokenCS: TRTLCriticalSection;

procedure ExigirConfigTest(const C: TEcfCanalConfiguracion);
begin
  if (C.Canal <> ceIdesiApi) or (C.Ambiente <> aeTest) or
     (C.BaseUrl <> URL_TEST) or (C.ClientId <> CLIENT_TEST) then
    raise Exception.Create('UEcfApiHttp: solo se permite IDESI_API / TEST.');
  if Trim(C.RncEmisor) = '' then
    raise Exception.Create('UEcfApiHttp: RNC emisor obligatorio.');
end;

function CodificarBytesUrl(const S: AnsiString): string;
var
  I: Integer;
  C: Char;
begin
  Result := '';
  for I := 1 to Length(S) do
  begin
    C := S[I];
    if C in ['A'..'Z', 'a'..'z', '0'..'9', '-', '_', '.', '~'] then
      Result := Result + C
    else
      Result := Result + '%' + IntToHex(Ord(C),2);
  end;
end;

function AVariantBytes(const S: AnsiString): OleVariant;
var
  I: Integer;
begin
  if Length(S) = 0 then
    raise Exception.Create('No se permite enviar un body HTTP vacio.');
  Result := VarArrayCreate([0,Length(S)-1],varByte);
  for I := 1 to Length(S) do
    Result[I-1] := Ord(S[I]);
end;

function BytesDeRespuesta(const ABytes: OleVariant): AnsiString;
var
  I, Bajo, Alto: Integer;
begin
  Result := '';
  if VarIsEmpty(ABytes) or VarIsNull(ABytes) then Exit;
  if not VarIsArray(ABytes) then
    raise Exception.Create('ResponseBody WinHTTP no devolvio un array de bytes.');
  Bajo := VarArrayLowBound(ABytes,1);
  Alto := VarArrayHighBound(ABytes,1);
  SetLength(Result, Alto - Bajo + 1);
  for I := Bajo to Alto do
    Result[I-Bajo+1] := Chr(Integer(ABytes[I]));
end;

function BuscarJsonRaiz(const S, AClave: string): string;
var
  I, J, Inicio, Profundidad: Integer;
  EnString, Escapado: Boolean;
  Nombre: string;
begin
  Result := '';
  I := 1;
  Profundidad := 0;
  EnString := False;
  Escapado := False;
  while I <= Length(S) do
  begin
    if EnString then
    begin
      if Escapado then Escapado := False
      else if S[I] = '\' then Escapado := True
      else if S[I] = '"' then EnString := False;
      Inc(I);
      Continue;
    end;
    if (S[I] = '{') or (S[I] = '[') then Inc(Profundidad)
    else if (S[I] = '}') or (S[I] = ']') then Dec(Profundidad)
    else if S[I] = '"' then
    begin
      Inicio := I+1;
      Inc(I);
      Escapado := False;
      while I <= Length(S) do
      begin
        if Escapado then Escapado := False
        else if S[I] = '\' then Escapado := True
        else if S[I] = '"' then Break;
        Inc(I);
      end;
      if I > Length(S) then
        raise Exception.Create('Respuesta OAuth JSON incompleta.');
      Nombre := Copy(S,Inicio,I-Inicio);
      if Profundidad = 1 then
      begin
        J := I+1;
        while (J <= Length(S)) and (S[J] in [' ',#9,#10,#13]) do Inc(J);
        if (J <= Length(S)) and (S[J] = ':') and (Nombre = AClave) then
        begin
          Inc(J);
          while (J <= Length(S)) and (S[J] in [' ',#9,#10,#13]) do Inc(J);
          if J > Length(S) then raise Exception.Create('Campo OAuth incompleto.');
          if S[J] = '"' then
          begin
            Inicio := J+1;
            J := Inicio;
            while (J <= Length(S)) and (S[J] <> '"') do
            begin
              if S[J] = '\' then
                raise Exception.Create('Escape no admitido en el valor OAuth.');
              Inc(J);
            end;
            if J > Length(S) then raise Exception.Create('Cadena OAuth incompleta.');
            Result := Copy(S,Inicio,J-Inicio);
          end
          else
          begin
            Inicio := J;
            while (J <= Length(S)) and (S[J] in ['0'..'9']) do Inc(J);
            Result := Copy(S,Inicio,J-Inicio);
          end;
          Exit;
        end;
      end;
    end;
    Inc(I);
  end;
end;

{ Devuelve cadena vacia cuando la cabecera opcional no esta presente.
  GetResponseHeader puede generar una excepcion COM en ese caso. }
function ValorCabeceraOpcional(const AEncabezados, ANombre: string): string;
var
  Inicio, Fin, Separador: Integer;
  Linea: string;
begin
  Result := '';
  Inicio := 1;
  while Inicio <= Length(AEncabezados) do
  begin
    Fin := Inicio;
    while (Fin <= Length(AEncabezados)) and (AEncabezados[Fin] <> #10) do
      Inc(Fin);
    Linea := Copy(AEncabezados, Inicio, Fin - Inicio);
    if (Linea <> '') and (Linea[Length(Linea)] = #13) then
      Delete(Linea, Length(Linea), 1);
    Separador := Pos(':', Linea);
    if (Separador > 0) and
       SameText(Trim(Copy(Linea, 1, Separador - 1)), ANombre) then
    begin
      Result := Trim(Copy(Linea, Separador + 1, MaxInt));
      Exit;
    end;
    Inicio := Fin + 1;
  end;
end;

function EjecutarHttp(
  const AMetodo, AUrl, AContentType, ABearer, AIdempotencyKey,
  ACorrelationId: string; const ABodyUtf8: AnsiString): TEcfApiRespuestaHttp;
var
  Http: OleVariant;
  ByteBody, ByteReply: OleVariant;
  Encabezados: string;
begin
  Result.StatusCode := 0;
  Result.BodyUtf8 := '';
  Result.IdempotencyReplayed := '';
  if Copy(AUrl, 1, Length(URL_TEST) + 1) <> URL_TEST + '/' then
    raise Exception.Create('Bloqueo HTTP: direccion fuera del host STAGING autorizado.');
  Http := CreateOleObject('WinHttp.WinHttpRequest.5.1');
  Http.SetTimeouts(20000,20000,30000,60000);
  { Windows 10/11: forzar TLS 1.2, sin ignorar errores de certificado. }
  Http.Option[WINHTTP_OPTION_SECURE_PROTOCOLS] := WINHTTP_TLS12;
  Http.Open(AMetodo, AUrl, False);
  if AContentType <> '' then
    Http.SetRequestHeader('Content-Type',AContentType);
  if ABearer <> '' then
    Http.SetRequestHeader('Authorization','Bearer ' + ABearer);
  if AIdempotencyKey <> '' then
    Http.SetRequestHeader('Idempotency-Key',AIdempotencyKey);
  if ACorrelationId <> '' then
    Http.SetRequestHeader('X-Correlation-Id',ACorrelationId);
  Http.SetRequestHeader('Accept','application/json');
  if ABodyUtf8 <> '' then
  begin
    ByteBody := AVariantBytes(ABodyUtf8);
    Http.Send(ByteBody);
  end
  else
    Http.Send('');
  Result.StatusCode := Integer(Http.Status);
  ByteReply := Http.ResponseBody;
  Result.BodyUtf8 := BytesDeRespuesta(ByteReply);
  { Esta cabecera solo es relevante en POST de emision con clave estable.
    Su ausencia es normal: no se debe disparar una excepcion COM. }
  if SameText(AMetodo, 'POST') and (AIdempotencyKey <> '') then
  begin
    Encabezados := string(Http.GetAllResponseHeaders);
    Result.IdempotencyReplayed :=
      ValorCabeceraOpcional(Encabezados, 'Idempotency-Replayed');
  end;
end;

constructor TEcfApiTokenCache.Create;
begin
  inherited Create;
  Limpiar;
end;

procedure TEcfApiTokenCache.Limpiar;
begin
  FKey := '';
  FToken := '';
  FValidoHasta := 0;
end;

function TEcfApiTokenCache.ObtenerTokenTest(
  const AConfig: TEcfCanalConfiguracion;
  const AClientSecret: string): string;
var
  Llave, Token, Tipo: string;
  R: TEcfApiRespuestaHttp;
  Vigencia: Integer;
  FormBody: AnsiString;
begin
  ExigirConfigTest(AConfig);
  if AClientSecret = '' then
    raise Exception.Create('client_secret TEST no aprovisionado.');
  Llave := AConfig.BaseUrl + '|' + NombreAmbienteEcf(AConfig.Ambiente) +
    '|' + AConfig.ClientId + '|' + AConfig.RncEmisor;
  if (FKey = Llave) and (FToken <> '') and (Now < FValidoHasta) then
  begin
    Result := FToken;
    Exit;
  end;
  Limpiar;
  FormBody := 'grant_type=client_credentials&client_id=' +
    CodificarBytesUrl(AnsiString(AConfig.ClientId)) + '&client_secret=' +
    CodificarBytesUrl(AnsiString(AClientSecret));
  R := EjecutarHttp('POST', AConfig.BaseUrl + '/oauth/token',
    'application/x-www-form-urlencoded', '', '', '', FormBody);
  if R.StatusCode <> 200 then
    raise Exception.CreateFmt('OAuth TEST no autorizo el cliente (HTTP %d).', [R.StatusCode]);
  Token := BuscarJsonRaiz(string(R.BodyUtf8),'access_token');
  Tipo := BuscarJsonRaiz(string(R.BodyUtf8),'token_type');
  Vigencia := StrToIntDef(BuscarJsonRaiz(string(R.BodyUtf8),'expires_in'),0);
  if (Token = '') or (not SameText(Tipo,'Bearer')) or (Vigencia <= 120) then
    raise Exception.Create('OAuth TEST: token, tipo o vigencia no validos.');
  FKey := Llave;
  FToken := Token;
  FValidoHasta := IncSecond(Now, Vigencia-120);
  Result := FToken;
end;

function ObtenerTokenIdesiTestCacheGlobal(
  const AConfig: TEcfCanalConfiguracion;
  const AClientSecret: string): string;
begin
  EnterCriticalSection(TokenCS);
  try
    Result := CacheGlobal.ObtenerTokenTest(AConfig,AClientSecret);
  finally
    LeaveCriticalSection(TokenCS);
  end;
end;

function HealthIdesiApiTest(
  const AConfig: TEcfCanalConfiguracion): TEcfApiRespuestaHttp;
begin
  ExigirConfigTest(AConfig);
  Result := EjecutarHttp('GET', AConfig.BaseUrl + '/health', '', '', '', '', '');
end;

function EnviarIntentoE31TestUnaVez(
  const AIntento: TEcfApiIntento; const AAccessToken: string;
  AEmisionAutorizada: Boolean): TEcfApiRespuestaHttp;
begin
  if not AEmisionAutorizada then
    raise Exception.Create('Emision bloqueada: requiere autorizacion explicita de TEST.');
  if (AIntento.Ambiente <> 'TEST') or (AIntento.BaseUrl <> URL_TEST) or
     (AIntento.ClientId <> CLIENT_TEST) or
     (Copy(AIntento.ENcf,1,3) <> 'E31') then
    raise Exception.Create('Envio E31 bloqueado: canal/ambiente no permitido.');
  if AIntento.EstadoLocal <> 'TRANSMITIENDO' then
    raise Exception.Create('El intento debe estar TRANSMITIENDO antes de hacer POST.');
  if (Trim(AIntento.IdempotencyKey) = '') or
     (Trim(AIntento.CorrelationId) = '') or (AIntento.RequestUtf8 = '') then
    raise Exception.Create('El intento no tiene identidad o request persistido.');
  if Trim(AAccessToken) = '' then
    raise Exception.Create('No hay token OAuth TEST para emitir.');
  Result := EjecutarHttp('POST',URL_TEST + '/api/v1/ecf','application/json',
    AAccessToken,AIntento.IdempotencyKey,AIntento.CorrelationId,
    AIntento.RequestUtf8);
end;

function ConsultarDetallesEcfTest(
  const AConfig: TEcfCanalConfiguracion; const AAccessToken,
  AENcf, ARncComprador, ACodigoSeguridad: string): TEcfApiRespuestaHttp;
var
  Url: string;
begin
  ExigirConfigTest(AConfig);
  if (AAccessToken = '') or (ACodigoSeguridad = '') or (AENcf = '') then
    raise Exception.Create('Consulta /details requiere token, e-NCF y codigoSeguridad.');
  Url := URL_TEST + '/api/v1/ecf/' +
    CodificarBytesUrl(AnsiString(AConfig.RncEmisor)) + '/' +
    CodificarBytesUrl(AnsiString(AENcf)) + '/details?codigoSeguridad=' +
    CodificarBytesUrl(AnsiString(ACodigoSeguridad));
  if ARncComprador <> '' then
    Url := Url + '&rncComprador=' + CodificarBytesUrl(AnsiString(ARncComprador));
  { No registrar Url: contiene codigoSeguridad. }
  Result := EjecutarHttp('GET',Url,'',AAccessToken,'','','');
end;

initialization
  InitializeCriticalSection(TokenCS);
  CacheGlobal := TEcfApiTokenCache.Create;

finalization
  CacheGlobal.Free;
  DeleteCriticalSection(TokenCS);

end.
