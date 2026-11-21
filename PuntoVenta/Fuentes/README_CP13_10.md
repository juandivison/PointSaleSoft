# Checkpoint CP13.10 - Unidad de configuracion recuperada y auditoria de integracion

**Estado:** comprobacion de interfaz y rutas. Sin integracion automatica de botones.
No hubo POST, cambios de tablas ni modificacion de la unidad canonica.

## Conclusiones confirmadas

1. `UEcfCanalConfig.pas` de la persona usuaria expone exactamente los tipos y funciones
   esperados por CP13.9. No requiere cambiar nombres ni recompilar aun.
2. Las URL son TEST (`https://api-staging.idesisa.com`) y PROD (`https://api.idesisa.com`).
3. `ECF_CANAL_CONFIG` persiste el selector por RNC. Si falta fila, el valor conservador es ASLAN.
4. `ClientIdIdesiApi(AAmbiente)` devuelve valores predeterminados, no credenciales multi-RNC.
   El cliente CP13.8 debe consultar `repconf_cr.ini` para resolver el ClientId efectivo
   y descifrar el secreto bajo la cuenta de Windows autorizada.
5. `UfrmEcfCanalConfig` permanece ligado a la prueba manual CP12 E31 TEST y presenta
   el ClientId predeterminado: la pantalla NO aprovisiona aun credenciales multi-RNC
   en el INI ni demuestra compatibilidad con PROD para emision.
6. `UProcVentaRapida.DgiiSolicitareCF` bloquea la ruta IDESI_API; dos formularios
   administrativos siguen llamando directamente a `UUtilecf`.

## Bloqueantes reales antes de habilitar POST

- `UEcfApiDespachoIngresos` exige que `IBTransaction1` este INACTIVA; las rutas
  comerciales usan operaciones `CommitRetaining`. Hay que observar el estado
  real por evento antes de modificar transacciones. NO forzar COMMIT de trabajo ajeno.
- `ECF_API_INTENTO` debe tener indice UNIQUE ACTIVO sobre exactamente
  `(RNC_EMISOR, NUMERO_TRN)`. El check secuencial no evita colisiones entre estaciones.
- Aun no existe conciliacion persistente completa ni validacion criptografica XMLDSig.
- Falta conectar operaciones de GET y descargar XML/QR; un HTTP 200 de XML
  no autoriza por si solo pasar a CONCILIADO.

## Orden de activacion propuesto

1. Ejecutar `PRECHECK_CP13_10_FB25.sql` de solo lectura en DB de desarrollo/TEST.
2. Confirmar `IBTransaction1.InTransaction` en los cinco puntos de entrada;
   no ejecutar POST si hay transaccion comercial pendiente.
3. Conectar en primer lugar una ruta GET-only de consulta/metadata contra un documento
   ya aceptado; no reenviar la TRN 5001 / E310000000801.
4. Implementar el dispatcher por operacion (envio vs consulta vs XML) con el
   canal historico del intento y despues conectar el POST nuevo.
5. Preparar provision de secretos DPAPI por RNC/TEST/PROD (sin secretos en logs).
6. Compilar y realizar QA puntual, no una bateria innecesaria de POST.

## Alcance por tipo fiscal

El adaptador publico `ApiPublicV1IncomeAdapter` consultado en IntegracionSaaS
acepta E31, E32, E34, E44, E45. No asumir E33/E46 en ese contrato ni
alterar el motivo de una E34 de manera silenciosa.

El E32 con importe >= RD$250,000 requiere RNC o cedula (9/11 digitos) y nombre;
por debajo del umbral solo se transmite identidad opcional cuando hay RNC
(9 digitos) con nombre real, segun la regla acordada. No modificar Firebird.

## Archivos

- `UEcfCanalConfig.pas`: unidad recibida, bytes originales, sin modificaciones.
- `PRECHECK_CP13_10_FB25.sql`: cuatro SELECT, sin mutaciones.
- `MAPA_RUTAS_CP13_10.md`: ubicaciones de llamadas fiscales directas.
- `QA_ESTATICO_CP13_10.txt`: comprobaciones ejecutadas y limites.

**No instalar como activacion de produccion.** CP13.9 tampoco se encuentra compilado
ni cableado con los eventos; este ZIP no pretende sustituirlo.
