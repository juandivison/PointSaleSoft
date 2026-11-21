unit UEcfApiOAuthTest;

{
  CP12-H2: verificacion manual OAuth TEST y consulta READ ONLY del certificado.
  No envia e-CF. No usa Firebird, IBX, transacciones ni modifica la API.
  Reutiliza el cliente OAuth existente UEcfApiHttp sin cambiarlo.
  Nunca retorna, muestra o registra el token o el client_secret.
}

interface

uses
  SysUtils, UEcfCanalConfig;

type
  TEcfApiOAuthTestResultado = record
    OAuthValido: Boolean;
    CodigoConsulta: Integer;
    Detalle: string;
  end;

function ProbarAutenticacionIdesiApiTest(
  const AConfig: TEcfCanalConfiguracion;
  const AClientSecret: string): TEcfApiOAuthTestResultado;

implementation

uses
  ComObj, Variants, UEcfApiHttp;

const
  WINHTTP_OPTION_SECURE_PROTOCOLS = 9;
  WINHTTP_TLS12 = $00000800;
  WINHTTP_OPTION_ENABLE_REDIRECTS = 6;

function ProbarAutenticacionIdesiApiTest(
  const AConfig: TEcfCanalConfiguracion;
  const AClientSecret: string): TEcfApiOAuthTestResultado;
var
  Cache: TEcfApiTokenCache;
  Token: string;
  Http: OleVariant;
  Url: string;
begin
  Result.OAuthValido := False;
  Result.CodigoConsulta := 0;
  Result.Detalle := 'OAuth TEST: sin comprobar';

  if (AConfig.Canal <> ceIdesiApi) or
     (AConfig.Ambiente <> aeTest) or
     (AConfig.BaseUrl <> UrlBaseIdesiApi(aeTest)) or
     (AConfig.ClientId <> ClientIdIdesiApi(aeTest)) or
     (Trim(AConfig.RncEmisor) = '') then
    raise Exception.Create('Solo se permite verificar IDESI_API / TEST del RNC actual.');

  { Cache LOCAL de prueba: fuerza solicitud de un token nuevo. No reutiliza
    un token anterior, que podria ocultar un client_secret incorrecto. }
  Cache := TEcfApiTokenCache.Create;
  Token := '';
  try
    Token := Cache.ObtenerTokenTest(AConfig, AClientSecret);
    Result.OAuthValido := Token <> '';
    if not Result.OAuthValido then
      raise Exception.Create('No se obtuvo Bearer TEST.');

    { Lectura con Bearer para confirmar permiso del RNC. No se guarda
      ni se interpreta el contenido del certificado. }
    Url := AConfig.BaseUrl + '/api/v1/companies/' +
      AConfig.RncEmisor + '/certificate';
    Http := CreateOleObject('WinHttp.WinHttpRequest.5.1');
    Http.SetTimeouts(5000, 5000, 8000, 10000);
    Http.Option[WINHTTP_OPTION_SECURE_PROTOCOLS] := WINHTTP_TLS12;
    Http.Option[WINHTTP_OPTION_ENABLE_REDIRECTS] := False;
    Http.Open('GET', Url, False);
    Http.SetRequestHeader('Accept', 'application/json');
    Http.SetRequestHeader('Authorization', 'Bearer ' + Token);
    Http.Send('');
    Result.CodigoConsulta := Integer(Http.Status);
    if Result.CodigoConsulta = 200 then
      Result.Detalle := 'OAuth TEST: OK; consulta del RNC autorizada (HTTP 200).'
    else
      Result.Detalle := 'OAuth TEST: token OK; consulta RNC HTTP ' +
        IntToStr(Result.CodigoConsulta) + ' (revisar permisos/endpoint).';
  finally
    Token := '';
    Cache.Limpiar;
    Cache.Free;
  end;
end;

end.
