unit UEcfCanalConfig;

{
  PointSaleSoft / Delphi 7 / IBX / Firebird 2.5.
  Lee la seleccion del transporte, NO emite comprobantes.
  No contiene ni almacena client_secret, access_token o credenciales ASLAN.
  No modifica transacciones Firebird existentes.
}

interface

uses
  SysUtils, IBDatabase;

type
  TCanalEnvioEcf = (ceAslan, ceIdesiApi);
  TAmbienteEcf = (aeTest, aeProd);

  TEcfCanalConfiguracion = record
    RncEmisor: string;
    Canal: TCanalEnvioEcf;
    Ambiente: TAmbienteEcf;
    BaseUrl: string;
    ClientId: string;
  end;

function CargarConfiguracionCanalEcf(
  ADatabase: TIBDatabase;
  ATransaction: TIBTransaction;
  const ARncEmisor: string): TEcfCanalConfiguracion;

function NombreCanalEcf(ACanal: TCanalEnvioEcf): string;
function NombreAmbienteEcf(AAmbiente: TAmbienteEcf): string;
function UrlBaseIdesiApi(AAmbiente: TAmbienteEcf): string;
function ClientIdIdesiApi(AAmbiente: TAmbienteEcf): string;

implementation

uses
  DB, IBQuery;

function NombreCanalEcf(ACanal: TCanalEnvioEcf): string;
begin
  case ACanal of
    ceAslan: Result := 'ASLAN';
    ceIdesiApi: Result := 'IDESI_API';
  else
    raise Exception.Create('Canal e-CF no reconocido.');
  end;
end;

function NombreAmbienteEcf(AAmbiente: TAmbienteEcf): string;
begin
  case AAmbiente of
    aeTest: Result := 'TEST';
    aeProd: Result := 'PROD';
  else
    raise Exception.Create('Ambiente e-CF no reconocido.');
  end;
end;

function UrlBaseIdesiApi(AAmbiente: TAmbienteEcf): string;
begin
  case AAmbiente of
    aeTest: Result := 'https://api-staging.idesisa.com';
    aeProd: Result := 'https://api.idesisa.com';
  else
    raise Exception.Create('Ambiente IDESI API no reconocido.');
  end;
end;

function ClientIdIdesiApi(AAmbiente: TAmbienteEcf): string;
begin
  case AAmbiente of
    aeTest: Result := 'idesi-staging';
    aeProd: Result := 'idesi-prod';
  else
    raise Exception.Create('Ambiente IDESI API no reconocido.');
  end;
end;

function CargarConfiguracionCanalEcf(
  ADatabase: TIBDatabase;
  ATransaction: TIBTransaction;
  const ARncEmisor: string): TEcfCanalConfiguracion;
var
  Q: TIBQuery;
  SCanal: string;
  SAmbiente: string;
begin
  if ADatabase = nil then
    raise Exception.Create('CargarConfiguracionCanalEcf: ADatabase es obligatorio.');
  if ATransaction = nil then
    raise Exception.Create('CargarConfiguracionCanalEcf: ATransaction es obligatorio.');
  if not ADatabase.Connected then
    raise Exception.Create('CargarConfiguracionCanalEcf: conexion Firebird no disponible.');
  if not ATransaction.InTransaction then
    raise Exception.Create('CargarConfiguracionCanalEcf: transaccion Firebird no iniciada.');

  Result.RncEmisor := Trim(ARncEmisor);
  if Result.RncEmisor = '' then
    raise Exception.Create('CargarConfiguracionCanalEcf: RNC emisor obligatorio.');

  { Fallback conservador para un RNC que todavia no haya sido configurado.
    No se permite apuntar a IDESI_API por un valor implícito. }
  Result.Canal := ceAslan;
  Result.Ambiente := aeTest;
  Result.BaseUrl := '';
  Result.ClientId := '';

  Q := TIBQuery.Create(nil);
  try
    Q.Database := ADatabase;
    Q.Transaction := ATransaction;
    Q.SQL.Text :=
      'SELECT CANAL_ENVIO, API_AMBIENTE ' +
      'FROM ECF_CANAL_CONFIG ' +
      'WHERE RNC_EMISOR = :RNC_EMISOR';
    Q.ParamByName('RNC_EMISOR').AsString := Result.RncEmisor;
    Q.Open;
    if not Q.Eof then
    begin
      SCanal := UpperCase(Trim(Q.FieldByName('CANAL_ENVIO').AsString));
      SAmbiente := UpperCase(Trim(Q.FieldByName('API_AMBIENTE').AsString));

      if SCanal = 'ASLAN' then
        Result.Canal := ceAslan
      else if SCanal = 'IDESI_API' then
        Result.Canal := ceIdesiApi
      else
        raise Exception.Create('ECF_CANAL_CONFIG: valor CANAL_ENVIO no permitido.');

      if SAmbiente = 'TEST' then
        Result.Ambiente := aeTest
      else if SAmbiente = 'PROD' then
        Result.Ambiente := aeProd
      else
        raise Exception.Create('ECF_CANAL_CONFIG: valor API_AMBIENTE no permitido.');
    end;
  finally
    Q.Free;
  end;

  if Result.Canal = ceIdesiApi then
  begin
    Result.BaseUrl := UrlBaseIdesiApi(Result.Ambiente);
    Result.ClientId := ClientIdIdesiApi(Result.Ambiente);
  end;
end;

end.
