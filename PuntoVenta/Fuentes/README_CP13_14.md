# CP13.14 — Persistencia DGII_STATUS para IDESI API

## Alcance y evidencias

**Base:** `CP13.13/UEcfApiTimbreLog.pas` (mismo punto de integración, sin cambios en botones, UProcVentaRapida, UFormFacturas o procedimientos comerciales).

Se verificó en el repositorio `juandivison/IdesiToolECF`, rama `IntegracionSaaS`:

- `Services/FirebirdRepo.cs`: `SpUpdateEstado` ejecuta `SP_ECF_UPDATE_ESTADO(serie, estado, trackId, mensaje)`.
- `Program.cs`: el flujo DGII directo llama a `repo.SpUpdateEstado(serie, 'ACEPTADO', trackId, ...)` tras conocer resultado fiscal. **La función `UpdateEcfEstadoAsync` de `Program.cs` no actualiza Firebird; solo registra una línea en DEBUG**.
- `Services/EcfTimbreLogRepository.cs`: persistencia de 7 columnas de `ECF_TIMBRE_LOG` por TRN.
- `UDatModFactura.dfm`: el SELECT `qryVentaFactura` lee `DGII_STATUS`, `TRACK_ID`, `LAST_ERROR` y `REINTENTOS` desde `NCF_ASIGNADOS`, no desde `VENTAS_MAST`.

## Cambio concreto

En `RecuperarTimbreIdesiApi` se conserva la secuencia original CP13.13:

1. GET metadata; exigir `currentStatusVerified=true`, `status=ACCEPTED`, `metadataStatus=AVAILABLE` y RNC/e-NCF coincidentes.
2. GET XML firmado; validar contenido, timbre y guardar copia local.
3. Upsert de `ECF_TIMBRE_LOG`.
4. **Nuevo:** recuperar por TRN la serie NCF y estado; invocar `SP_ECF_UPDATE_ESTADO` con `ACEPTADO` **solo si aún no consta `ACEPTADO`**.
5. Preservar `TRACK_ID` existente cuando el API no suministre un `trackId`; volver a leer el estado para comprobar la persistencia.

**Sin POST. Sin cambiar** `VENTAS_MAST.STATUS`, `VENTAS_MAST.ESTADO_VENTA`, referencia NCR, `ECF_API_INTENTO.ESTADO_LOCAL`, ni estado `CONCILIADO`. Sin modificaciones en `CommitRetaining` del proceso de venta.

Se reutiliza la convención transaccional existente: los cambios de estado invocan `CommitRetaining` cuando `IBTransaction1` ya está activa y `Commit` solo cuando la rutina tuvo que iniciar una transacción. Esta unidad ya hacía lo mismo al persistir el timbre.

## Qué sigue sin estar demostrado

No contamos con la definición **real** de `SP_ECF_UPDATE_ESTADO` en tu Firebird, por lo que **no afirmamos** qué otros campos (`FECHA_ESTADO`, `LAST_ERROR`, `REINTENTOS`, `BLOQUEADO`, etc.) actualiza internamente. `AUDITORIA_E310000000802_FB25.sql` incluye la fuente y parámetros del procedimiento y el catálogo completo de columnas de `NCF_ASIGNADOS` y `VENTAS_MAST` para verificarlo.

No existe evidencia en las fuentes revisadas de que debamos escribir columnas adicionales de `VENTAS_MAST` por la aceptación DGII. No se crean escrituras especulativas sobre esa tabla.

## Integración

1. Respaldar `UEcfApiTimbreLog.pas` actual de CP13.13.
2. Sustituir **solo** esa unidad por la incluida en este paquete.
3. Compilar PointSaleSoft con Delphi 7. No se ha compilado aquí.
4. Ejecutar el SQL de auditoría **solo lectura** para revisar la firma real del procedimiento.
5. Sobre `E310000000802`, usar **Validar e-CF** (GET + recuperación, no POST). Reconsultar el SQL sección A y B. Debe conservarse el mismo e-NCF y verse `DGII_STATUS='ACEPTADO'` y el timbre completo.

Si el procedimiento no existe, tiene otra firma o falla, la rutina reportará error y podrá reintentarse mediante GET: **no permitirá un POST adicional**.

**Observación importante:** no confundir comprobación estructural del XML (CP13.13) con verificación criptográfica XMLDSig; `ECF_API_INTENTO` permanece sin pasar a `CONCILIADO`.
