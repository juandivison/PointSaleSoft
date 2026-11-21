# PointSaleSoft — CP13.7 (preparación JSON sin POST)

## Estado

**Patch de trabajo, NO instalado. No compilado en Delphi 7. No autorizado para producción.**
No se hicieron conexiones de red ni cambios en Firebird. Entregar estos fuentes no equivale a activar IDESI API.

## Fuente y canal

- `CANAL_ENVIO = IDESI_API`: todas las operaciones fiscales se enrutan por IDESI API. Ninguna opción debe usar el ejecutable ASLAN directo.
- `GlbUsarFacturaTxtECF = 0`: construir JSON a partir del registro persistido en Firebird, reutilizando las consultas fiscales de `UFacturaTxtBuilder.BuildFacturaTxtContent` **sin crear TXT**.
- `GlbUsarFacturaTxtECF = 1`: generar `Factura.txt` como antes, pero transformarlo a JSON y enviarlo por IDESI API, **no ejecutar `IdesiToolECF.exe`**.
- `CANAL_ENVIO = ASLAN`: ambos flujos anteriores de ASLAN quedan preservados.
- `GlbActivaECF` asigna e-NCF y `GlbValidarECF` autoriza el envío. No se modifica su semántica.

## Archivos

1. `UFacturaTxtBuilder.pas`: conserva `GenerateFacturaTxt` y añade `BuildFacturaTxtContent` para materializar los mismos registros fiscales en memoria. El wrapper de TXT sigue escribiendo UTF-8 sin BOM.
2. `UEcfApiV1Json.pas`: conserva `ConstruirJsonE31PublicV1` y añade el JSON multiformato E31/E32/E34/E44/E45 desde ruta o contenido UTF-8.
3. `UEcfApiFirebirdJson.pas`: nuevo adaptador para Firebird -> JSON UTF-8 sin escribir TXT ni abrir conexión alternativa.
4. `CP13_7.diff`: diferencias respecto a los archivos adjuntos del usuario.

## E32 comprador

- Total menor de 250000: incluir `buyer` solamente con RNC de 9 dígitos y nombre real; omitir cédula opcional y nombre, aunque estén en Firebird.
- Total mayor o igual a 250000: exigir identificación de 9 u 11 dígitos y nombre real.
- La regla no modifica `CLIENTES` ni la ficha de factura en Firebird.
- No se hizo validación en OFV.

## Bloqueos detectados (NO corregidos silenciosamente)

- API v1 acepta `document.reference.modificationCode` entre **1 y 3**, mientras que `UFacturaTxtBuilder` permite motivo NCR **1 a 5**. Los motivos 4/5 se rechazan antes de enviar; hay que reconciliar el contrato/API sin alterar NCR productivas.
- El contrato público API v1 revisado solamente acepta **E31/E32/E34/E44/E45**; E33 y E46 quedan fuera del patch hasta confirmar soporte.
- `UEcfApiHttp.pas`, `UEcfApiEnvioE31.pas` y `UEcfApiIntento.pas` siguen con restricciones E31/TEST. No se eliminaron por no estar listo el orquestador único ni la configuración multi-RNC cifrada.
- Los formularios de conciliación, consulta, timbre y descarga mantienen llamadas legacy y **no están aún migrados**. No activar `IDESI_API` hasta completar ese enrutamiento.
- El código actual del dispatcher `UEcfApiSwitch` rechaza cualquier intento anterior; para recuperación debe distinguir `resolver canal` de `autorizar POST nuevo`.

## Contrato confirmado en rama IntegracionSaaS

- POST `/api/v1/ecf`
- GET `/api/v1/ecf/{rnc}/{encf}`
- GET `/api/v1/ecf/{rnc}/{encf}/details` (requiere código seguridad y, según documento, RNC comprador)
- GET `/api/v1/ecf/{rnc}/{encf}/metadata`
- GET `/api/v1/ecf/{rnc}/{encf}/signed-xml`

## Verificaciones realizadas

- Diff automatizado de los dos fuentes existentes, conservación de declaraciones originales.
- Comprobación estática de que el adaptador Firebird no llama servicios de red ni usa `TFileStream`.
- No hay compilador Delphi 7 disponible en este entorno. **No se han realizado pruebas de ejecución ni fiscales**.

## Próximos pasos mínimos

1. Compilar únicamente las tres unidades nuevas/revisadas en el proyecto real, y comparar TXT de `GenerateFacturaTxt` anterior vs nuevo con un dataset TEST conocido.
2. Verificar contract JSON offline para E31/E32/E34/E44/E45, con una sola batería de casos puntual; comprobar que no se cambian importes originales.
3. Implementar OAuth multi-RNC TEST/PROD desde `repconf_cr.ini` protegido y el despacho de POST sin fallback.
4. Centralizar todas las rutas de consulta, conciliación, descarga XML y timbre a IDESI API con los endpoints verificados.
5. Hacer QA de integración acotado, sin POST sobre la E31 5001 ni retransmisiones automáticas.
