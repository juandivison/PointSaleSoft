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
  AAutorizadoPorOperador: Boolean): TEcfApiRespuestaHttp;

implementation

uses
  SysUtils, UEcfApiIntento;

function EjecutarPrimerPostE31Test(
  ADatabase: TIBDatabase; const AConfig: TEcfCanalConfiguracion;
  ANumeroTrn: Integer; const AClientSecret: string;
  AAutorizadoPorOperador: Boolean): TEcfApiRespuestaHttp;
var
  Intento: TEcfApiIntento;
  Token: string;
begin
  Result.StatusCode := 0;
  Result.BodyUtf8 := '';
  Result.IdempotencyReplayed := '';
  if not AAutorizadoPorOperador then
    raise Exception.Create('El primer envio E31 TEST requiere autorizacion expresa.');
  if AConfig.Ambiente <> aeTest then
    raise Exception.Create('Esta version NO permite emitir en PROD.');
  if not CargarIntentoApiPorFactura(ADatabase,AConfig.RncEmisor,
     ANumeroTrn,Intento) then
    raise Exception.Create('No se encontro request persistido. No se enviara.');
  if (Intento.Ambiente <> 'TEST') or
     (Intento.BaseUrl <> AConfig.BaseUrl) or
     (Intento.ClientId <> AConfig.ClientId) or
     (Intento.EstadoLocal <> 'PREPARADO') then
    raise Exception.Create('Intento de otro ambiente o ya transmitido. Conciliar antes.');
  Token := ObtenerTokenIdesiTestCacheGlobal(AConfig,AClientSecret);
    { Commit antes de conectar a la API: limita riesgo de POST duplicado. }
    MarcarIntentoApiTransmitiendo(ADatabase,Intento.IdIntento);
    Intento.EstadoLocal := 'TRANSMITIENDO';
    try
      Result := EnviarIntentoE31TestUnaVez(Intento,Token,True);
    except
      on E: Exception do
      begin
        { La red pudo enviar el request antes del fallo: marcar AMBIGUO. }
        try
          MarcarIntentoApiAmbiguo(ADatabase,Intento.IdIntento);
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
        Result.StatusCode,Result.BodyUtf8);
    except
      on E: Exception do
        raise Exception.Create('La API respondio, pero no se pudo persistir. ' +
          'NO repetir POST; conciliar el intento: ' + E.Message);
    end;
end;

end.
