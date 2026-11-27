# PointSaleSoft.Sync — PROSESUR: continuidad CP18.3

Fecha de corte: 2026-11-26 (GMT-4). Estado: milestone suspendido, producción operativa; no detener agentes. No se ha certificado la conciliación definitiva.

## Prompt para iniciar otra conversación

> Continuemos PointSaleSoft.Sync — PROSESUR desde CP18.3. Lee primero PointSaleSoft.Sync/docs/README-PROSESUR-CONTINUIDAD.md en juandivison/PointSaleSoft, rama consolidacion/pointsalesoft-20261121. No repetir migración, instalación, QA previa ni publicación masiva. Verifica el estado actual de las colas y concilia los costos individualmente usando los CSV de principal y sucursal, identifica las exclusiones y el producto adicional. Mantén Delphi 7 y Firebird 2.5; cambios mínimos, no tocar otros clientes ni facturación electrónica. Antes de cada script indica si es solo lectura, si modifica producción (máquina, impacto y rollback) o si no debe ejecutarse todavía. No reiniciar agentes ni modificar datos comerciales sin evidencia y autorización. Continúa por checkpoints pequeños. Distingue hechos de hipótesis y no cierres el milestone sin conciliación.

## Estado técnico y Git

- Rama: consolidacion/pointsalesoft-20261121. Base de código publicada: 7f59b0dcbd998bd31501b90ea2703eb9b76b75e4 (protección anticipada de precios); 1dd8771 (híbrido Delphi), b6ab0e5 (costo centralizado).
- QA histórica: 50/50 legacy, 66/66 centralizado, 57/57 local. Release PROSESUR-Release-20261125-215902, manifest SHA256 y build PASS. No inferir que todo el árbol de trabajo estaba limpio al compilar.
- PC desarrollo: C:\Proyectos\PointSaleSoftResp. Al corte, 13 archivos Delphi modificados (229 inserciones, 62 eliminaciones), entre ellos UInventarioProd.pas (4 líneas). Revisar individualmente; no incluirlos en el commit documental, no git add ., reset, restore ni stash. El README se publica directamente en GitHub; el clon local deberá actualizarse preservando sus modificaciones.
- Alcance: centralización de PRECIO_COMPRA y catálogo; preservar existencias, entradas/salidas y comportamiento de clientes independientes y modo DIRECTO. No modificar módulos fiscales.

## Producción

- Principal: C:\Proyectos\PuntoVenta\Datos\DBDATOSPROSESUR.FDB; sucursal: C:\Proyectos\PuntoVenta\Datos\DBDATOSPROSESUR_II.FDB.
- Tenant prosesur, branch prosesur_ii, MySQL pointsale_sync_prosesur, versión 5.6.51-log.
- Epoch conservado: 7bd6c91f-72dd-4909-89ef-fd4995b9cf29. READY=1. Policy hash nuevo: 41752e004060b56648cf6e7630e7399d51c9eef667a2b253801132c776ff698b; anterior: 71ff9bca276049d2d9aff215879e240d24f19dec79a1ce9dc93eac57b3933f22.
- PSSYNC_C_8 principal y PSSYNC_G_8 sucursal incluyen PRECIO_COMPRA; BLR válido. Triggers comerciales de sucursal ya tenían bypass PSSYNC_BRANCH_CATALOG_V1; no se cambiaron. Prueba 10147: costo 34.45 sincronizado, stock sucursal preservado.
- Tareas: PointSaleSoft.Sync-Prosesur-principal, PointSaleSoft.Sync-Prosesur-relay, PointSaleSoft.Sync-Prosesur-sucursal. Ejecutables bajo C:\ProgramData\PointSaleSoftSync\{principal,relay,sucursal}\app\PointSaleSoft.Sync.exe. No publicar tokens, credenciales ni archivos de configuración sensibles.
- Backups de app: backup-app-principal-20261126-003324, backup-app-relay-20261126-005520, backup-app-sucursal-20261126-095934. Config backups: principal/config-backup-20261126-012340.json, relay/config-backup-20261126-012518.json, sucursal/config-backup-20261126-100415.json. Sucursal FBK: C:\Backups\PointSaleSoftSync\DBDATOSPROSESUR_II_PRE_MIGRACION_20261126-094747.fbk, 118219264 bytes, SHA256 1E1B4A30C3656C87947C2BC60F3A71A2A5A535B78267FAD9E3FF9F0610E50615. Respaldo principal confirmado por usuario, ruta/hash no registrados; restore no probado.

## Publicación masiva

Lotes iniciales 100 y 1000, luego tres de 5000 y último de 2431. Límites de código observados: 10198, 13949 (reconstruido), 19704, 25160, 32203, 35544. Acumulado esperado 18589 eventos publicados, no productos únicos. Último lote generado; verificar drenaje final, no asumirlo por un único reporte de cero sin origen inequívoco. Antes del tercer lote se confirmó 11158 publicados y cero pendientes en ambas colas.

Bloqueos por dependencias de UNIDADES inválidas: el primer evento sin payload impide continuar (orden CREATED_AT, EVENT_ID). Se decidió excluir productos completos con referencia inválida, sin inventar unidades ni modificar precios comerciales. Se archivaron siete eventos (10203,13939,11554,12575,13032,13646,13246) en PSSYNC_OUTBOX_EXCLUIDOS y se retiraron de la cola activa en una transacción. Luego 24080 (unidad 185 inexistente) requirió aislamiento sin depender de UUID transcrito; usuario confirmó reanudación. Ocho archivados esperados, verificar. No falsear PUBLISHED ni alterar PSSYNC_REV. La cuarentena manual no evita bloqueos futuros.

## Conciliación CP18.3

| Indicador | Principal | Sucursal |
|---|---:|---:|
| Productos | 18652 | 18653 |
| Costos no nulos antes | 14740 | 4 |
| Costos no nulos después | 14740 | 14611 |
| Costos nulos después | 3912 | 4042 |
| Costos cero | 1 | 1 |
| Suma costos | 2929255.02 | 2914364.34 |

Diferencia agregada 129 costos no nulos y RD$14890.68. Auditoría posterior: 127 productos inválidos con costos agregados RD$14803.68. Residuo aritmético preliminar RD$87 y 2 costos; no demuestra que sean exactamente dos productos ni que todos los inválidos expliquen la diferencia. Identificar producto adicional de sucursal sin borrar automáticamente. Exportación individual pendiente; apagón interrumpió trabajo.

### Consultas de reanudación

**SOLO LECTURA — principal Firebird, transacción nueva:**
```sql
SELECT PUBLISHED, COUNT(*) AS CANTIDAD
FROM PSSYNC_OUTBOX GROUP BY PUBLISHED;
SELECT COUNT(*) FROM PSSYNC_OUTBOX_EXCLUIDOS;
SELECT COUNT(*) FROM INVENTARIO_PRODUCTO WHERE CODIGO > 35544;
```
**SOLO LECTURA — MySQL:**
```sql
SELECT COUNT(*) AS PENDIENTES
FROM pointsale_sync_prosesur.sync_delivery
WHERE tenant='prosesur' AND ack_at IS NULL;
```
**SOLO LECTURA — principal, exportar Costos_Principal.csv:**
```sql
SELECT I.CODIGO, I.PRECIO_COMPRA,
 CASE WHEN X.CODIGO IS NULL THEN 0 ELSE 1 END AS UNIDAD_INVALIDA
FROM INVENTARIO_PRODUCTO I
LEFT JOIN (
 SELECT A.CODIGO FROM INVENTARIO_PRODUCTO A
 LEFT JOIN UNIDADES U ON U.IDUNIDAD=A.TIPO_UNIDAD
 WHERE U.IDUNIDAD IS NULL
 UNION
 SELECT P.COD_PRODUCTO FROM PRECIO_UNIDADSURTIDORA P
 LEFT JOIN UNIDADES U ON U.IDUNIDAD=P.IDUNIDAD
 WHERE U.IDUNIDAD IS NULL
) X ON X.CODIGO=I.CODIGO
ORDER BY I.CODIGO;
```
**SOLO LECTURA — sucursal, exportar Costos_Sucursal.csv:**
```sql
SELECT CODIGO, PRECIO_COMPRA FROM INVENTARIO_PRODUCTO ORDER BY CODIGO;
```
Comparar por código, distinguir NULL de cero, usar decimal exacto, detectar duplicados y faltantes. Si la consulta de principal tarda, exportar por separado costos y lista inválida con UNION, cruzar fuera de producción. Evitar subconsultas correlacionadas costosas. Capturar ambas exportaciones en ventana cercana y con colas drenadas; cambios concurrentes pueden requerir revalidación selectiva. No publicar masivamente otra vez.

## CP18-R: resiliencia

Apagón real, planta de respaldo, UPS no compatible con planta según usuario. Windows reinició 19:24:44, tarea inició 19:25:22, proceso correcto PID 8488 inició 19:25:24 (40 s después del arranque Windows, no duración total del apagón). Estado Running, LastTaskResult 267009 (0x41301, tarea en ejecución). BootTrigger 30 s, Enabled True, StartWhenAvailable True, RestartCount 5, RestartInterval 1 min, ExecutionTimeLimit 0, MultipleInstances IgnoreNew. Arranque automático PASS; entrega e integridad posterior aún pendientes de validación. Relay independiente de Firebird principal, conserva eventos ya confirmados en MySQL; no reiniciarlo por apagón de principal.

## Deuda técnica (no implementar durante esta pausa)

- DT-001 Alta: MySqlException en VPS a 16:42:17 y 18:35:03. RelayHost registra tipo solamente; HTTP 503/retryable para excepción MySQL según código revisado. Registrar Number, SqlState, operación, correlación/event ID, duración, sin secretos. Causa raíz desconocida. MySQL 5.6, acceso performance_schema denegado 1142 (consulta diagnóstica, no error original); no ampliar privilegios. 20 conexiones de 2000, 2 running, máximo histórico 152, cero esperas activas en medición, uptime 65 días; no evidencia de saturación. wait_timeout 600, connect_timeout 10, net_read_timeout 30, net_write_timeout 60, lock_wait 50, packet 256 MiB. Contadores globales no atribuibles al relay.
- DT-002 Alta: cuarentena automática/DLQ para dependencias inválidas, conservar evento, diagnóstico, reintento selectivo, revisión de orden/revisiones e idempotencia; no perder eventos ni marcar publicados falsamente.
- DT-003 Planificada: evaluar migración MySQL a versión soportada y compatibilidad de conector.
- DT-004 Media: watchdog de disponibilidad y progreso efectivo; cinco reintentos de tarea no son supervisión indefinida.
- DT-005 Propuesta: validación previa eficiente y conciliación automatizada por producto.

## Criterios de cierre

CP18.3: confirmar colas drenadas, comparar CSV, justificar diferencias por código. CP18.4: identificar producto adicional y exclusiones; recuperación selectiva solo con autorización. CP19: verificar costos, consistencia comercial, stock preservado, ausencia de duplicados y recuperación post apagón; documentar resultados y pendientes aceptados. No declarar PASS definitivo antes de evidencia. Mantener agentes activos y congelar código de producción durante pausa.
