unit UEcfApiEnvioE31;

{
  Orquestador CP8. SOLO EMISION TEST EXPLICITA.
  Precondicion: PrepararFacturaE31ParaApiTest ya hizo COMMIT del body.
  OAuth ANTES de marcar TRANSMITIENDO, sin almacenar secretos en BD.
  La transicion PREPARADO -> TRANSMITIENDO es atomica y comprometida
  ANTES del POST. No hay reintentos automaticos.
}

interface

uses
  IBDatabase, UEcfCanalConfig, UEcfApiHttp;

function EjecutarPrimerPostE31Test(
  ADatabase: TIBDatabase; const AConfig: TEcfCanalConfiguracion;
  ANumeroTrn: Integer; const AClientSecret: string;
  AAutorizadoPorOperador: Boolean;
  AAutorizarCommitRetaining: Boolean = False): TEcfApiRespuestaHttp;

implementation

uses
  SysUtils, UEcfApiIntento, UDatModConectar;

function EjecutarPrimerPostE31Test(
  ADatabase: TIBDatabase; const AConfig: TEcfCanalConfiguracion;
  ANumeroTrn: Integer; const AClientSecret: string;
  AAutorizadoPorOperador: Boolean;
  AAutorizarCommitRetaining: Boolean): TEcfApiRespuestaHttp;
var
  Intento: TEcfApiIntento;
  Token: string;
begin
  Result.StatusCode := 0;
  Result.BodyUtf8 := '';
  Result.IdempotencyReplayed := '';
  if (dmConectar = nil) or (ADatabase = nil) or
     (ADatabase <> dmConectar.IBDatabase1) or
     (not ADatabase.Connected) or
     (dmConectar.IBTransaction1 = nil) then
    raise Exception.Create('Envio E31 debe utilizar la conexion y transaccion globales.');
  if dmConectar.IBTransaction1.InTransaction and
     (not AAutorizarCommitRetaining) then
    raise Exception.Create('Envio TEST bloqueado: IBTransaction1 activa ' +
      'sin autorizacion de CommitRetaining.');
  if not AAutorizadoPorOperador then
    raise Exception.Create('El primer envio E31 TEST requiere autorizacion expresa.');
  if (AConfig.Canal <> ceIdesiApi) or
     (AConfig.Ambiente <> aeTest) or
     (AConfig.BaseUrl <> 'https://api-staging.idesisa.com') or
     (AConfig.ClientId <> 'idesi-staging') then
    raise Exception.Create('Esta version NO permite emitir en PROD.');
  if not CargarIntentoApiPorFactura(ADatabase,AConfig.RncEmisor,
     ANumeroTrn,Intento) then
    raise Exception.Create('No se encontro request persistido. No se enviara.');
  if (Intento.RncEmisor <> AConfig.RncEmisor) or
     (Intento.NumeroTrn <> ANumeroTrn) or
     (Intento.Ambiente <> 'TEST') or
     (Intento.BaseUrl <> AConfig.BaseUrl) or
     (Intento.ClientId <> AConfig.ClientId) or
     (Intento.EstadoLocal <> 'PREPARADO') then
    raise Exception.Create('Intento de otro ambiente o ya transmitido. Conciliar antes.');
  Token := ObtenerTokenIdesiTestCacheGlobal(AConfig,AClientSecret);
    { Commit antes de conectar a la API: limita riesgo de POST duplicado. }
    MarcarIntentoApiTransmitiendo(ADatabase,Intento.IdIntento,
      AAutorizarCommitRetaining);
    Intento.EstadoLocal := 'TRANSMITIENDO';
    try
      Result := EnviarIntentoE31TestUnaVez(Intento,Token,True);
    except
      on E: Exception do
      begin
        { La red pudo enviar el request antes del fallo: marcar AMBIGUO. }
        try
          MarcarIntentoApiAmbiguo(ADatabase,Intento.IdIntento,
            AAutorizarCommitRetaining);
        except
          { La marca TRANSMITIENDO persistida tambien bloquea otro POST. }
        end;
        raise Exception.Create('Envio de resultado incierto. NO reintentar ' +
          'ni cambiar a ASLAN. Conciliar con IDESI/DGII. ' + E.Message);
      end;
    end;
    { Cualquier respuesta HTTP se registra; HTTP 2xx NO implica ACCEPTED. }
    try
      RegistrarResultadoHttpIntento(ADatabase,Intento.IdIntento,
        Result.StatusCode,Result.BodyUtf8,AAutorizarCommitRetaining);
    except
      on E: Exception do
        raise Exception.Create('La API respondio, pero no se pudo persistir. ' +
          'NO repetir POST; conciliar el intento: ' + E.Message);
    end;
end;

end.
