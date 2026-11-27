# PointSaleSoft.Sync — PROSESUR
## Acta de suspensión y guía de continuidad
**Fecha:** 26/11/2026 (RD, UTC-4)  
**Estado:** milestone suspendido, producción operativa; conciliación definitiva pendiente.  
**Reanudar:** CP18.3. No repetir migración ni publicación masiva.

## 1. Control de versiones
- Repositorio: `juandivison/PointSaleSoft`.
- Rama: `consolidacion/pointsalesoft-20261121`.
- HEAD remoto verificado al cierre: `7f59b0dcbd998bd31501b90ea2703eb9b76b75e4`.
- Commits de referencia: C# `b6ab0e5`, Delphi híbrido `1dd877123c2d12585b205e04f61d145c689e0b03`, protección temprana de precios `7f59b0d`.
- Directorio de desarrollo: `C:\Proyectos\PointSaleSoftResp`.
- Estado local pendiente de verificar. No usar `git add .`, reset ni stash global: existían cambios e-CF ajenos al milestone.
- Paquete de release: `PointSaleSoft.Sync\artifacts\PROSESUR-Release-20261125-215902`, subdirectorios Sync y POS; manifest SHA256 verificado durante preparación. El manifest no prueba por sí solo que el árbol de fuentes estuviera limpio.

## 2. Arquitectura y alcance implementado
Principal Firebird → agente principal → relay VPS/MySQL → agente sucursal → Firebird sucursal. El ERP sucursal sigue operando localmente. El relay conserva entregas confirmadas en MySQL sin depender de una conexión directa al Firebird principal.

- Delphi 7, Firebird 2.5; relay MySQL 5.6.51-log.
- Centralización de `INVENTARIO_PRODUCTO.PRECIO_COMPRA` mediante política y triggers de captura/guardia. No centralizar stock, entradas ni salidas.
- Epoch conservado: `7bd6c91f-72dd-4909-89ef-fd4995b9cf29`.
- Hash anterior: `71ff9bca276049d2d9aff215879e240d24f19dec79a1ce9dc93eac57b3933f22`.
- Hash activo: `41752e004060b56648cf6e7630e7399d51c9eef667a2b253801132c776ff698b`.
- `PSSYNC_C_8` principal y `PSSYNC_G_8` sucursal incluyen la comparación de costo con `IS DISTINCT FROM`; activos, posición 32760, BLR válido verificado durante despliegue.
- Triggers comerciales de sucursal ya incluían bypass `PSSYNC_BRANCH_CATALOG_V1`. No se modificaron durante esta fase.
- Mantener funcionamiento DIRECTO histórico cuando aplica; no afectar instalaciones independientes, e-CF ni módulos de compra/inventario ajenos a la sincronización.
- Pruebas registradas durante desarrollo: política anterior 50/50, centralizada 66/66, local 57/57. No equivalen a certificación de todos los escenarios de producción.
- Prueba real producto 10147: costo sucursal recuperado a 34.45; precio 44.79 tras cambio concurrente en principal; existencias locales preservadas en la prueba.

## 3. Infraestructura operativa
| Nodo | Tarea programada | Ejecutable |
|---|---|---|
| Principal | PointSaleSoft.Sync-Prosesur-principal | C:\ProgramData\PointSaleSoftSync\principal\app\PointSaleSoft.Sync.exe |
| VPS | PointSaleSoft.Sync-Prosesur-relay | C:\ProgramData\PointSaleSoftSync\relay\app\PointSaleSoft.Sync.exe |
| Sucursal | PointSaleSoft.Sync-Prosesur-sucursal | C:\ProgramData\PointSaleSoftSync\sucursal\app\PointSaleSoft.Sync.exe |

Firebird principal: `C:\Proyectos\PuntoVenta\Datos\DBDATOSPROSESUR.FDB`. Sucursal: `C:\Proyectos\PuntoVenta\Datos\DBDATOSPROSESUR_II.FDB`. MySQL: `pointsale_sync_prosesur`; tenant `prosesur`; sucursal `prosesur_ii`.

Backups de aplicación bajo `C:\ProgramData\PointSaleSoftSync\`: `backup-app-principal-20261126-003324`, `backup-app-relay-20261126-005520`, `backup-app-sucursal-20261126-095934`. Config backups bajo cada nodo: principal `config-backup-20261126-012340.json`, relay `config-backup-20261126-012518.json`, sucursal `config-backup-20261126-100415.json`. Backup Firebird sucursal `C:\Backups\PointSaleSoftSync\DBDATOSPROSESUR_II_PRE_MIGRACION_20261126-094747.fbk`, 118219264 bytes, SHA256 `1E1B4A30C3656C87947C2BC60F3A71A2A5A535B78267FAD9E3FF9F0610E50615`. Backup reciente principal confirmado por usuario, ruta/hash no documentados. Restauración no probada en este cierre. No almacenar credenciales, tokens ni cadenas de conexión en Git.

## 4. Publicación masiva y excepciones
| Lote | Último código | Eventos generados |
|---|---:|---:|
| Pruebas iniciales | 13949 (reconstruido) | 100 + 1000, más eventos previos/concurrentes |
| Primer lote masivo | 19704 | 5000 |
| Segundo lote masivo | 25160 | 5000 |
| Tercer lote masivo | 32203 | 5000 |
| Último lote | 35544 | 2431 |

Acumulado esperado al finalizar: **18589 publicados**, no un conteo de productos únicos. Se confirmó 11158 publicados y cero pendientes antes del tercer lote; el total final y cero pendientes en ambas colas deben comprobarse explícitamente al retomar. Un mensaje aislado de `0` no identifica por sí solo el contador.

Incidentes: productos con referencias huérfanas en `INVENTARIO_PRODUCTO.TIPO_UNIDAD` o `PRECIO_UNIDADSURTIDORA.IDUNIDAD` bloquean la cabeza de la cola si no se puede construir el bundle. No inventar unidades, borrar filas comerciales ni ignorar únicamente la fila de precio: se excluye el producto completo de esta publicación. No excluir por ausencia de filas de precio si la unidad principal es válida.

Se creó `PSSYNC_OUTBOX_EXCLUIDOS`. Se resguardaron siete eventos inicialmente (10203,13939,11554,12575,13032,13646,13246), y luego el producto 24080 (unidad 185 inexistente). Total esperado: ocho eventos archivados; verificar. El primer intento de traslado de 24080 no persistió; se repitió usando KEY1 sin UUID transcrito y el procesamiento se restableció. El resto de productos inválidos se omitió preventivamente en los lotes. No confundir número de eventos archivados con número de productos inválidos.

Procedimiento de aislamiento ya utilizado: detener y deshabilitar exclusivamente agente principal; INSERT SELECT del evento pendiente sin PAYLOAD a archivo; DELETE del outbox solo si existe el mismo EVENT_ID en archivo; verificar filas y confirmar ambas operaciones en una transacción; verificar desde transacción nueva; reactivar agente. No marcar falsamente PUBLISHED ni borrar PSSYNC_REV. No ejecutar nuevamente sin una incidencia comprobada. La exclusión manual no protege de futuros eventos inválidos.

## 5. Conciliación preliminar (CP18.1–2)
| Indicador | Principal | Sucursal |
|---|---:|---:|
| Productos | 18652 | 18653 |
| Costo no nulo inicial | 14740 | 4 |
| Costo no nulo última medición | 14740 | 14611 |
| Costo nulo última medición | 3912 | 4042 |
| Costo cero | 1 | 1 |
| Suma de costos | 2929255.02 | 2914364.34 |

Diferencia agregada: 129 costos no nulos, RD$14890.68. Consulta de unidades inválidas: 127 costos no nulos y suma RD$14803.68 según interpretación registrada. Residual aritmético: 2 costos no nulos y RD$87.00. No implica exactamente dos productos ni que toda la suma de inválidos explique diferencias: es necesario comparar ambos costos por código. Existe un producto adicional neto en sucursal, cuya identidad y posibles faltantes cruzados deben establecerse. No borrar automáticamente.

## 6. CP18-R — Apagón real
Principal: Windows arrancó 19:24:44, tarea 19:25:22 y proceso PID 8488 19:25:24, ruta de producción correcta. `LastTaskResult=267009` (0x41301, tarea en ejecución). BootTrigger habilitado, Delay PT30S, StartWhenAvailable True, RestartCount 5, RestartInterval PT1M, ExecutionTimeLimit PT0S, MultipleInstances IgnoreNew. Recuperación del proceso en 40 s desde inicio de Windows: PASS. No demuestra por sí sola ausencia de pérdidas/duplicados o entrega de todos los eventos. La continuidad del relay y sucursal durante el apagón es comportamiento esperado, no medición histórica confirmada. Los UPS no sostuvieron las PCs durante transición a planta; no se requiere reiniciar relay por esta incidencia.

## 7. Guía de reanudación — ejecutar solo al retomar
**ROJO: NO EJECUTAR AHORA.** Todos los SQL siguientes son de solo lectura; realizar en transacciones nuevas para evitar snapshots obsoletos. Mantener agentes activos.

### CP18.3-A — Confirmar entrega definitiva
Principal:
```sql
SELECT PUBLISHED, COUNT(*) AS CANTIDAD FROM PSSYNC_OUTBOX GROUP BY PUBLISHED;
SELECT COUNT(*) AS EXCLUIDOS FROM PSSYNC_OUTBOX_EXCLUIDOS;
SELECT COUNT(*) AS RESTANTES FROM INVENTARIO_PRODUCTO WHERE CODIGO > 35544;
```
MySQL:
```sql
SELECT COUNT(*) AS PENDIENTES FROM pointsale_sync_prosesur.sync_delivery WHERE tenant='prosesur' AND ack_at IS NULL;
```
Esperar cero pendientes; 18589 y ocho archivados son referencias históricas, no exigir igualdad si hubo operaciones comerciales nuevas o mantenimiento. No regenerar productos automáticamente.

### CP18.3-B — Exportar y comparar costos
Principal:
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
Sucursal:
```sql
SELECT CODIGO, PRECIO_COMPRA FROM INVENTARIO_PRODUCTO ORDER BY CODIGO;
```
Exportar `Costos_Principal.csv` y `Costos_Sucursal.csv` completos. Si el join de la principal es lento, exportar costos simples y lista UNION de inválidos por separado y comparar fuera de Firebird. Evitar correlacionadas por producto. Confirmar NULL distinto de cero, decimal exacto, códigos únicos y conteos de filas; comparar por CODIGO mediante diccionario o merge ordenado. Capturar ambos snapshots lo más próximos posible, volver a comprobar diferencias por cambios concurrentes. No agregar CSV comerciales al repositorio.

### CP18.4 — Clasificar diferencias
- Solo principal / solo sucursal; identificar el producto adicional neto.
- Costo distinto incluyendo NULL frente a cero; separar unidades inválidas de otras causas.
- Verificar los códigos residuales selectivamente y los ocho eventos archivados.
- Si corresponde recuperar algún producto, autorizar individualmente después de confirmar todas sus dependencias. No alterar costos de sucursal directamente ni inventar unidades. Revisar stock local antes/después.

### CP19 — Criterios de cierre
Colas drenadas; diferencias individuales justificadas; exclusiones documentadas y aceptadas por responsable; producto adicional identificado; recuperación del apagón reconciliada; sin diferencias inexplicadas de costo ni modificación indebida de existencias; evidencias y Git actualizado. Si persisten exclusiones legítimas, el cierre debe indicar explícitamente su alcance; no declarar 100% de catálogo sincronizado.

## 8. Roadmap de mejoras (no implementadas)
| ID | Prioridad | Mejora / criterio de aceptación |
|---|---|---|
| DT-001 | Alta | Observabilidad: MySqlException.Number, SqlState, operación Publish/Pending/Ack, duración, correlación EVENT_ID cuando exista; distinguir retryable/permanente. Log seguro sin credenciales ni payload comercial. Pruebas de errores simulados. |
| DT-002 | Alta | DLQ/cuarentena automática durable de dependencias inválidas, transacción atómica, motivo, auditoría, alerta, recuperación selectiva y revisión de orden/revisión por producto. No poner en cuarentena errores transitorios ni perder eventos. Probar cabeza bloqueada, reintento, revisión posterior, reinicio. |
| DT-003 | Planificada | Evaluar migración MySQL 5.6 a versión soportada; QA de driver, esquema, idempotencia, transacciones, backup/restore y rollback, sin cambios improvisados en producción. |
| DT-004 | Media | Watchdog para recuperación prolongada: distinguir proceso vivo de progreso real, evitar reinicios ciegos/duplicación de instancias; alertar cola estancada y comprobar recuperación tras fallos. |
| DT-005 | Propuesta | Herramienta de conciliación offline por código, resumen de diferencias y validación de dependencias antes de publicación masiva; reporte sin modificar datos. |

MySqlException del relay observada 16:42:17 y 18:35:03 del 26/11. Causa raíz desconocida: log solo muestra tipo. MySQL 5.6.51, uptime 65 días, 20 conexiones abiertas de 2000, máximo histórico 152, sin esperas activas en muestra; contadores globales de abortos no atribuibles a PROSESUR. Acceso performance_schema rechazado 1142; no ampliar privilegios. No concluir que es deadlock, timeout o problema de pool. No cambiar configuración ni recompilar en este milestone suspendido.

## 9. Reglas de cierre y Git
**No ejecutar cambios de producción durante la suspensión.** Mantener agentes activos. Verificar `git status --short`, `git diff`, `git diff --cached`, rama y commits locales no publicados. Revisar cambios uno a uno; agregar solo documentación y fuentes pertenecientes al milestone. No incluir configuraciones sensibles, DB, CSV, binarios de producción ni modificaciones e-CF ajenas. Commit sugerido: `docs(sync): checkpoint PROSESUR CP18.3 and resilience follow-up`. Push normal de la rama, sin force, solo tras confirmar que el índice contiene exclusivamente cambios autorizados. Verificar HEAD remoto después del push. El estado local y la publicación de esta guía aún no están confirmados.
