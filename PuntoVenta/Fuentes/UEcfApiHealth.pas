unit UEcfApiHealth;

{
  CP12-H1: solo GET /health para TEST o PROD, sin OAuth ni envio fiscal.
  Delphi 7 / Windows 10 / WinHTTP COM (TLS 1.2).
  No usa ni modifica bases de datos, transacciones o e-NCF.
}

interface

uses
  SysUtils, UEcfCanalConfig;

type
  TEcfApiHealthResultado = record
    Ambiente: TAmbienteEcf;
    Url: string;
    CodigoHttp: Integer;
    Accesible: Boolean;
    Detalle: string;
  end;

function ConsultarSaludIdesiApi(
  AAmbiente: TAmbienteEcf): TEcfApiHealthResultado;

implementation

uses
  ComObj, Variants;

const
  WINHTTP_OPTION_SECURE_PROTOCOLS = 9;
  WINHTTP_TLS12 = $00000800;
  WINHTTP_OPTION_ENABLE_REDIRECTS = 6;

function ConsultarSaludIdesiApi(
  AAmbiente: TAmbienteEcf): TEcfApiHealthResultado;
var
  Http: OleVariant;
begin
  Result.Ambiente := AAmbiente;
  Result.Url := UrlBaseIdesiApi(AAmbiente) + '/health';
  Result.CodigoHttp := 0;
  Result.Accesible := False;
  Result.Detalle := 'Sin respuesta HTTP';

  { La URL procede exclusivamente del mapeo de ambientes del cliente.
    Sin headers Authorization ni POST; no guarda datos de respuesta. }
  try
    Http := CreateOleObject('WinHttp.WinHttpRequest.5.1');
    Http.SetTimeouts(5000, 5000, 8000, 10000);
    Http.Option[WINHTTP_OPTION_SECURE_PROTOCOLS] := WINHTTP_TLS12;
    Http.Option[WINHTTP_OPTION_ENABLE_REDIRECTS] := False;
    Http.Open('GET', Result.Url, False);
    Http.SetRequestHeader('Accept', 'application/json');
    Http.Send('');
    Result.CodigoHttp := Integer(Http.Status);
    Result.Accesible := Result.CodigoHttp = 200;
    if Result.Accesible then
      Result.Detalle := 'HTTP 200 (endpoint accesible)'
    else
      Result.Detalle := 'HTTP ' + IntToStr(Result.CodigoHttp);
  except
    on E: Exception do
      Result.Detalle := 'Error de conexion: ' + E.Message;
  end;
end;

end.
