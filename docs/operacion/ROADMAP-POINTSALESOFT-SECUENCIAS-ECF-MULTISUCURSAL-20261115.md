# Roadmap técnico — Secuencias e-CF centralizadas para PointSaleSoft

**Versión:** 1.0 — 15 de noviembre de 2026  
**Milestone:** Asignación de e-NCF multisucursal, con continuidad operativa sin conexión  
**Sistema principal:** PointSaleSoft (Delphi 7 / Firebird 2.5)  
**Infraestructura central prevista:** API PHP por HTTPS + MySQL en Network Solutions  
**Cliente piloto:** definido internamente; no publicar identificadores del cliente ni credenciales en el repositorio  
**Ventana objetivo:** 16 y 17 de noviembre de 2026 (sujeta a QA, sin prometer despliegue sin validación)  
**Estado:** DISEÑO / ROADMAP. Ninguna modificación funcional de este milestone está acreditada en este documento.

> **Propósito de continuidad:** Este archivo es la fuente de referencia para futuras conversaciones y checkpoints. Separar estrictamente DECISIONES CONFIRMADAS, DISEÑO PROPUESTO, DATOS A VERIFICAR y PRUEBAS EFECTUADAS. No declarar una tarea PASS sin evidencia registrada.

## 1. Problema y objetivo

Una empresa con varias sucursales puede necesitar un servicio coordinador para asignar e-NCF sin colisiones. Actualmente PointSaleSoft utiliza Firebird y la tabla **DGII_SERIE_NFC**, cuyo campo **NCF** se interpreta operativamente como la última secuencia utilizada. Se desea incorporar un origen REMOTO opcional, sin reemplazar ni degradar el origen LOCAL.

Objetivos, en este orden:

1. **No duplicar e-NCF** entre solicitudes concurrentes.
2. **No bloquear el registro de facturas comerciales** si falla MySQL/Internet. La factura podrá quedar **pendiente de e-NCF**, conservando el tipo fiscal solicitado.
3. **No reasignar secuencias automáticamente.** Una sustitución de un e-NCF previamente asignado exige decisión explícita del usuario autorizado o soporte.
4. Minimizar pérdidas/saltos mediante transacciones atómicas, solicitudes idempotentes y conciliación.
5. Consumir primero lotes vigentes con **vencimiento más próximo**, incluso si existe otro lote más reciente del mismo tipo.
6. Mantener un servicio ligero y una base remota compacta; histórico completo consolidado en la base local de la oficina principal.
7. Preservar funcionalidad existente de facturación, gastos, NC/NDB y e-CF; no introducir refactorizaciones ajenas.

**Distinción obligatoria:** Una factura comercial registrada sin e-NCF **no es un e-CF fiscal emitido**. No inventar e-NCF, fecha fiscal, timbre, aceptación ni envío a DGII. Identificarla como pendiente fiscal por la vía compatible con el modelo actual.

## 2. Decisiones confirmadas por el propietario del proyecto

| Clave | Decisión | Estado |
|---|---|---|
| D-01 | PointSaleSoft tendrá parámetro de origen de secuencia LOCAL / REMOTO. | Confirmada |
| D-02 | En REMOTO se consulta MySQL y se incrementa la secuencia de forma central y segura; después se registra como reservada en Firebird local. | Confirmada |
| D-03 | Sin conexión remota: no se asigna secuencia; se conserva la factura y se completa posteriormente mediante proceso por lote existente, manual o automático. | Confirmada |
| D-04 | La factura sin e-NCF retendrá el **tipo e-CF solicitado** (E31, E32, etc.). | Confirmada |
| D-05 | **Jamás reasignar automáticamente** una secuencia ya atribuida; exigir autorización expresa. | Confirmada |
| D-06 | El origen remoto no será obligatorio para todas las sucursales: la DGII puede autorizar **rangos distintos por sucursal** para operar desconectadas. | Confirmada |
| D-07 | Soportar simultáneamente varios lotes del mismo tipo con distintas fechas de vencimiento; consumir primero el que vence antes. | Confirmada |
| D-08 | Minimizar registros en MySQL; consolidar el histórico completo en la base de la oficina principal; limpieza periódica segura. | Confirmada |
| D-09 | Prever NC/NDB contra operaciones originales sin e-NCF, conservando la identidad de la factura afectada. | Confirmada |
| D-10 | Auditoría periódica de secuencias y alertas: **TODO** posterior. | Confirmada |
| D-11 | PHP está disponible en el hosting, pero conectividad y capacidad real deben probarse. | Pendiente de prueba |
| D-12 | Fecha objetivo de implementación: 16/11/2026 o, como máximo deseado, 17/11/2026. | Objetivo, no aprobación de producción |

### Invariantes no negociables

- Ningún e-NCF puede entregarse a dos reservas distintas dentro del mismo emisor, ambiente y tipo.
- Nunca reutilizar automáticamente un e-NCF cuya asignación o transmisión pudiera haber ocurrido.
- Un timeout **no prueba** que una reserva remota haya fallado.
- No ejecutar un segundo consumo de secuencia si puede recuperarse la reserva original.
- Una sucursal LOCAL no debe consumir rangos que puedan ser consumidos simultáneamente por REMOTO.
- No pasar silenciosamente de REMOTO a LOCAL cuando falla la conexión.
- La operación comercial puede persistir sin e-NCF; el flujo de emisión fiscal necesita e-NCF válido y la referencia de origen exigible.
- Mantener la ruta LOCAL sin cambios de comportamiento cuando no se habilita la opción REMOTO.

## 3. Estructura actual conocida de Firebird

DDL compartido por el usuario, reproducido únicamente como inventario de columnas (los dominios **CAMPO_*** todavía no se han inspeccionado):

~~~sql
CREATE TABLE DGII_SERIE_NFC
(
    SERIE CAMPO_CHAR1 NOT NULL,
    DIV_NEGOCIO CAMPO_CHAR2 NOT NULL,
    PECF CAMPO_CHAR3 NOT NULL,
    AICF CAMPO_CHAR3 NOT NULL,
    TIPO_CF CAMPO_CHAR2 NOT NULL,
    NCF CAMPO_DOBLE_PREC NOT NULL,
    ACTIVO NUM_SMALLINT NOT NULL,
    FECHA_IN CAMPO_FECHA_HORA,
    FECHA_UPD CAMPO_FECHA_HORA,
    CANT_MIN_AVISO1 SMALLINT,
    CANT_MIN_AVISO2 SMALLINT,
    FECHA_VENCE CAMPO_FECHA_HORA
);

CREATE UNIQUE INDEX DGII_SERIE_NFCINDEX1
ON DGII_SERIE_NFC (SERIE, DIV_NEGOCIO, PECF, AICF, TIPO_CF, NCF);
~~~

**Observaciones sin concluir:** 

- **NCF** contiene la última secuencia usada según la regla operativa informada, pero su dominio numérico y su manejo real deben comprobarse antes de cualquier migración. **No usar flotantes en el contador MySQL**; usar entero exacto.
- **FECHA_VENCE** ya existe, pero no se ha demostrado que la tabla actual represente sin ambigüedad el inicio, final e identidad de distintos lotes autorizados.
- El índice único mostrado incluye **NCF**: por sí solo no certifica que dos lotes/rangos no se superpongan.
- Verificar mapeo entre **TIPO_CF** y tipos e-CF E31/E32/E33/E34/E41/E43/etc., así como **SERIE**, **DIV_NEGOCIO**, **PECF**, **AICF**, antes de modelar equivalencias.
- No asumir que el DDL compartido corresponde íntegramente a todas las instalaciones o que revela los triggers, generadores y procedimientos que lo consumen.

## 4. Diseño propuesto (NO IMPLEMENTADO)

### 4.1 Selector de origen

Parámetro conceptual: **ORIGEN_SECUENCIA_ECF = LOCAL | REMOTO**.

Su **nombre final, alcance (empresa/sucursal), persistencia y ubicación** quedan pendientes de inspección de los parámetros actuales de PointSaleSoft. Evitar inventar una nueva tabla o un nombre definitivo antes de auditar la configuración existente.

- LOCAL: procedimiento y comportamiento vigentes, con los rangos legalmente asignados a esa sucursal.
- REMOTO: todas las nuevas reservas de ese ámbito provienen del servicio central.
- Se permite convivencia de modalidades solo cuando los **rangos autorizados no se superponen**. Registrar/validar las delegaciones de rangos locales durante la activación de una empresa.
- No efectuar fallback automático LOCAL por falla del servicio remoto.

### 4.2 API y persistencia central

Propuesta: PointSaleSoft → **HTTPS API PHP** → **MySQL/InnoDB**; no distribuir credenciales MySQL entre sucursales.

Tres tablas lógicas mínimas, nombres sujetos a revisión:

1. **ecf_control_secuencia**: una fila de bloqueo/coordinación por RNC emisor + ambiente DGII + tipo e-CF (y otros discriminadores necesarios tras auditar los datos).
2. **ecf_lotes_secuencia**: identificador del lote autorizado, emisor, ambiente, tipo, rango inicial/final, último asignado, fecha de vencimiento si aplica, activo, modalidad de consumo (central/delegada) y sucursal delegada cuando proceda.
3. **ecf_reservas_secuencia**: identificador inmutable de solicitud, sucursal, identidad del documento comercial de origen, e-NCF/número, lote, estado mínimo, marcas temporales y referencias de conciliación.

No almacenar en MySQL datos de clientes, líneas de facturas, XML, archivos firmados, certificados ni estados contables innecesarios.

**Índices/controles requeridos:** unicidad global de identificador de solicitud en su ámbito; unicidad de e-NCF por emisor+ambiente; control de rangos que se superpongan; imposibilidad de dos reservas activas incompatibles para el mismo documento, considerando que una reasignación manual puede dejar historial de números anteriores.

### 4.3 Selección de lote y asignación atómica

Operación propuesta, dentro de **UNA** transacción InnoDB:

1. Autenticar y autorizar emisor, sucursal, ambiente, tipo y solicitud.
2. Si ya existe la solicitud idempotente, **devolver exactamente la reserva original**, sin incrementar contador.
3. Bloquear la fila de coordinación de ese emisor/ambiente/tipo (**SELECT ... FOR UPDATE**).
4. Confirmar de nuevo la idempotencia bajo el bloqueo.
5. Escoger el lote activo, autorizado, no agotado y vigente que **venza primero**. Validar excepciones de vencimiento por tipo según normativa vigente, sin inventar fechas.
6. Incrementar una sola secuencia exacta; insertar la reserva y confirmar la transacción.
7. Responder con identificador de reserva, e-NCF, lote, vencimiento y resultado mínimo.

Si no hay lote disponible, **no asignar**. No saltar al siguiente lote mientras exista un lote anterior vigente y con saldo. No utilizar **SKIP LOCKED** si alteraría el orden de vencimiento. Bloqueos y restricciones únicas deben proteger también cargas administrativas de lotes.

**Ejemplo de requisito confirmado:** si existen 100 autorizaciones E31 que vencen el 31/12/2026 y otras que vencen el 31/12/2027, consumir primero las disponibles del lote 2026; después pasar al lote 2027. No asumir números iniciales/finales no proporcionados.

### 4.4 Idempotencia y fallos entre dos bases de datos

Firebird y MySQL **no comparten una transacción distribuida**. El protocolo debe resolver el intervalo entre la confirmación remota y la persistencia local:

1. Persistir localmente el documento y un **ID de solicitud estable**, vinculado a empresa, sucursal, documento y tipo e-CF solicitado; conservarlo antes del primer contacto remoto.
2. Invocar el servicio de reserva usando ese ID.
3. Si llega confirmación, registrar localmente el e-NCF y su lote/fecha de vencimiento en transacción local.
4. Si hay timeout o corte de red, conservar estado **PENDIENTE_CONCILIACION** y el mismo ID. No solicitar otra secuencia con ID nuevo.
5. Al recuperar conexión, consultar o repetir **la misma solicitud idempotente**: el servicio devuelve la reserva original si fue confirmada.
6. Una nueva secuencia para el mismo documento solo nace por una **acción explícita y auditable** del usuario autorizado/soporte, conservando la anterior.

**Diferenciar:** primer procesamiento por lote de una factura **sin número asignado** (permitido conforme al proceso existente) versus **reasignación** de un número ya atribuido (nunca automática). La recuperación de la misma reserva tampoco es reasignación.

Los estados citados son **conceptuales**: no reutilizar ni cambiar arbitrariamente **VENTAS_MAST.STATUS** ni nombres de campos sin revisar la implementación real. Antes de crear tablas/campos nuevos, examinar **ECF_RESERVA**, **VENTAS_MAST**, tablas de notas y procedimientos actuales.

### 4.5 Vencimiento fiscal

- Guardar vencimiento asociado al **lote real** y propagarlo al documento/XML cuando sea requerido.
- Confirmar reglas por tipo e-CF y excepciones aplicables con la DGII. **NULL no implica automáticamente permiso de asignar**; la excepción debe estar verificada.
- Definir zona horaria/fecha de corte y comportamiento del último día autorizado. No asignar lotes vencidos.
- Una factura comercial pendiente puede solicitar secuencia posteriormente, pero la **fecha de emisión fiscal y su validez** deben determinarse conforme a normativa, nunca copiando una fecha antigua sin validación.

### 4.6 NC/NDB con factura origen pendiente

Conservar identidad local inmutable del documento origen/afectado (empresa, sucursal, clave interna) aunque no tenga e-NCF. La nota comercial podrá quedar vinculada a ese origen. **No emitir fiscalmente E34/E33 (u otra nota) sin referencia fiscal de origen válida cuando la normativa la exige.**

Tras regularizar la factura origen, el proceso de conciliación debe resolver la referencia del documento afectado antes de preparar la nota fiscal. No emitir/reenviar automáticamente una nota fiscal por el simple hecho de asignar el e-NCF origen. Auditar todos los flujos actuales de devolución/notas antes de codificar.

## 5. Retención, auditoría y trazabilidad

**Remoto:** datos mínimos para contadores, lotes, reservas, unicidad e idempotencia. **Oficina principal:** histórico completo consolidado desde las sucursales.

La limpieza NO puede eliminar el último contador, lotes autorizados ni evidencia necesaria para impedir duplicidades y resolver solicitudes repetidas. La exportación a la oficina principal debe tener acuse verificable y control de duplicados. Definir retención según obligaciones fiscales, ventana real de reintentos y conciliación; no fijar un plazo arbitrario.

**TODO posterior:** conciliación al final del día, preferiblemente automática, con alertas por duplicidad, saltos no explicados, reservas remotas no reflejadas localmente, rangos superpuestos, lotes vencidos, documentos pendientes y discrepancias entre sucursales. La auditoría debe ser **solo lectura/alerta**, sin reasignaciones silenciosas.

**Limitación reconocida:** se puede garantizar exclusividad de reserva si las condiciones e invariantes se cumplen; no se pueden garantizar «cero saltos absolutos» ante caída de clientes, reservas confirmadas no utilizadas o rechazo fiscal. La mitigación es reconciliación, no reciclaje automático de e-NCF.

## 6. Seguridad, eficiencia y operación

- Confirmar que el hosting de Network Solutions admite PHP, MySQL **InnoDB**, transacciones y HTTPS con TLS válido; PHP está disponible según el usuario, **no probado aún**.
- Preferir conexión PHP→MySQL dentro del hosting; no abrir MySQL públicamente a cada sucursal.
- Autenticar por empresa/sucursal con credenciales independientes; autorización estricta del RNC y ambiente. Protección contra replay y filtración de tokens; secretos fuera de Git y de logs.
- Usar consultas parametrizadas, transacciones cortas, índices selectivos, límites de conexiones y respuesta JSON mínima.
- Evitar reintentos ilimitados; tiempos de espera breves y configurables. Ante indisponibilidad, la venta local sigue adelante **sin emisión fiscal**.
- Medir p50/p95 de asignación, tasa de timeouts y volumen de reservas; metas cuantitativas por aprobar después de prueba real de red/hosting.
- No ejecutar pruebas fiscales reales para medir concurrencia: los tests de numeración deben funcionar con datos y ambiente controlados.

## 7. Plan por checkpoints (ventana 16–17/11/2026)

| CP | Entregable mínimo | Condición de cierre | Estado |
|---|---|---|---|
| CP0 | Roadmap, DDL aportado y reglas del negocio | Decisiones y dudas registradas | DOCUMENTADO |
| CP1 | Auditoría Delphi/Firebird de numeración LOCAL | Mapa entrada→condiciones→mutaciones→persistencia→salidas, ventas/gastos/NC/NDB, parámetros y efectos colaterales | EN PROGRESO: hallazgos parciales al 15/11; ver sección 12 |
| CP2 | Prueba controlada PHP/MySQL/HTTPS en Network Solutions | InnoDB, credenciales seguras, conexión y bloqueo transaccional demostrados | PASS: CP2-A, CP2-B y bloqueo/rollback en QA |
| CP3 | DDL remoto mínimo, lotes y validación de rangos | No solapamiento, prioridad de vencimiento y unicidad verificadas | PASS en QA; ver sección 26 |
| CP4 | Servicio PHP de reserva/consulta idempotente | Respuesta estable y transacción atómica; sin duplicados concurrentes | EN PROGRESO: servicio QA implementado; ejecución pendiente |
| CP5 | Adaptador REMOTO en PointSaleSoft con selector | Regresión LOCAL sin cambios; fallo de red no impide registrar venta | EN PROGRESO: selector y cola integrados; cierre HTTPS y QA pendientes |
| CP6 | Estado local pendiente/reservado, tipo e-CF y origen afectado | Reconciliación de timeout y nota vinculada al origen sin e-NCF | EN PROGRESO: cola y tipo solicitado; conciliación y notas pendientes |
| CP7 | QA de concurrencia, error y vencimiento | Evidencias y criterios del apartado 8 | PENDIENTE |
| CP8 | Piloto y plan de retroceso | Aprobación expresa; copias, rangos segregados y trazabilidad | PENDIENTE |
| TODO | Conciliación y alertas diarias; refactor del proceso por lote | Fuera del corte inicial, sin perder diseño | FUTURO |

**Orden obligatorio:** CP1/CP2 antes de modificar asignación; CP3/CP4 antes de integrar; CP7 antes de activar en producción. Compromiso de calidad prevalece sobre la fecha objetivo. Trabajar por cambios pequeños, revisables y reversibles; sin refactorizar por oportunidad.

## 8. Matriz mínima de QA y aceptación

| Caso | Resultado exigido |
|---|---|
| LOCAL sin activar REMOTO | Mismo resultado que antes para la misma operación; cero dependencia de MySQL |
| Dos sucursales REMOTO simultáneas | e-NCF diferentes, nunca colisión |
| Ráfaga concurrente controlada | Reservas únicas, sin dobles incrementos ni rango sobrepasado |
| 100 E31 con vencimiento 2026 y lote 2027 | Consume primero lote vigente 2026 y después 2027 |
| Lote vencido/agotado | Nunca entrega número del lote inválido |
| Rangos solapados en carga | Rechazo de configuración antes de reservar |
| Sucursal LOCAL con rango delegado | Nunca coincide con rango central; no fallback implícito |
| Sin Internet / servicio caído | Se registra venta sin e-NCF, preservando tipo solicitado y condición pendiente |
| Timeout justo después del COMMIT MySQL | Recupera reserva previa usando mismo ID, sin consumir otra |
| Misma solicitud enviada varias veces | Devuelve mismo resultado, contador se incrementa una sola vez |
| Nueva secuencia para documento ya numerado | Denegada sin intervención autorizada; historial anterior conservado |
| NCR/NDB vinculada a factura sin e-NCF | Conserva referencia interna y no fabrica origen fiscal |
| Fallo local después de reserva central | Reserva recuperable y conciliable, sin reciclaje automático |
| Limpieza/sincronización | No destruye idempotencia, histórico consolidado ni posibilidad de auditoría |
| Regresión de emisión e-CF tradicional | E31/E32, E34, gastos E41/E43 y rutas existentes sin cambios no aprobados |

**PASS exige evidencia**: datos iniciales, pasos, resultado observado, referencias de logs (sin secretos), versión/commit y validación del flujo. Un build satisfactorio no equivale a QA fiscal.

## 9. Riesgos y decisiones pendientes

### Bloqueantes para implementar

- Identificar **todos** los procedimientos y métodos que leen/incrementan **DGII_SERIE_NFC.NCF** y consumen/asignan e-NCF. No conocer nombres no autoriza inventarlos.
- Inspeccionar DDL y restricciones reales de factura, reserva, notas y parámetros locales; definir cómo persistir factura sin e-NCF sin romper flujo contable ni fiscal.
- Determinar ámbito correcto del contador y los lotes: RNC, ambiente, tipo, serie/división y sucursal autorizada. Revisar dominios Firebird.
- Demostrar transacciones InnoDB y disponibilidad del servicio PHP; validar permisos de hosting, latencia y TLS.
- Inventariar rangos autorizados por DGII y lo ya consumido/reservado en **todas** las sucursales antes de habilitar REMOTO.
- Acordar autorización/registro de reasignación y tratamiento de e-NCF previamente asignado.

### No bloqueantes / TODO

- Automatizar la conciliación diaria con avisos, sin modificaciones fiscales automáticas.
- Refactorizar posteriormente el procesamiento por lote ya existente, solo si QA muestra necesidad.
- Dashboard de consumo, avisos de agotamiento/vencimiento y retención ajustada por auditoría.
- Evaluar tipos e-CF adicionales conforme se verifiquen rutas reales.

## 10. Plan de activación y reversión

1. Respaldos de Firebird y MySQL; snapshot de rangos autorizados y últimos consumos.
2. Confirmación de no solapamiento entre rangos locales y remotos por emisor/ambiente/tipo/sucursal.
3. Activar REMOTO solo para el ámbito piloto explícitamente aprobado; no cambiar parámetros de otras empresas.
4. Monitorear reservas centrales y reflejos locales; no emitir documentos ambiguos ni reusar secuencias.
5. Reversión: desactivar solicitudes REMOTAS nuevas de forma controlada, **sin** pasar al mismo rango LOCAL. Conservar reservas y conciliarlas; LOCAL solo con rango separado autorizado.
6. Registrar commit exacto, versión de base, pruebas y acta de aprobación antes de declarar producción.

## 11. Continuidad de conversaciones: plantilla de reanudación

> Estamos implementando el milestone **PointSaleSoft — Gestor centralizado de secuencias e-CF multisucursal**. Leer primero este roadmap del repositorio. Stack: Delphi 7, Firebird 2.5; servicio propuesto PHP HTTPS y MySQL en Network Solutions. El origen LOCAL debe mantenerse intacto y REMOTO es opcional. Sin acceso remoto, guardar factura **sin e-NCF**, conservando tipo solicitado; nunca emitir fiscalmente sin e-NCF válido. Reservas atómicas, idempotencia, lotes por vencimiento, sin reasignación automática, rangos LOCAL/REMOTO no solapados y NC/NDB vinculadas a origen interno pendiente. Histórico completo en la oficina principal; limpieza segura; auditoría diaria TODO. **No asumir que ya se programó nada**: consultar CP y evidencias actualizadas. Próximo paso: auditar el flujo Delphi/Firebird de asignación y probar PHP/MySQL en hosting antes de modificar producción.

### Registro vivo de avance

| Fecha | Checkpoint | Evidencia / commit | Estado / siguiente paso |
|---|---|---|---|
| 2026-11-15 | CP0 | Este documento | Reglas y arquitectura preliminar documentadas; CP1/CP2 pendientes |
| 2026-11-15 | CP1 parcial | Inspección del repositorio juandivison/PointSaleSoft, rama main, árbol 8,508 entradas; ver sección 12 | Confirmado procedimiento local PROC_ACTNCF y reserva propia de GASTOS; falta DDL de PROC_ACTNCF y verificar versión real de producción |
| 2026-11-15 | CP2 documental | Documentación pública Network Solutions y MySQL; ver sección 12 | Soporte general de PHP/MySQL documentado; instalación concreta, InnoDB y API HTTPS real no probados |
| 2026-11-16 | CP1: DDL PROC_ACTNCF recibido | Fuente Firebird proporcionado por usuario; ver sección 13 | Riesgos concretos demostrados para múltiples lotes; PROC_VERIFICA_SECNCF y transacciones pendientes |
| 2026-11-16 | CP2: MySQL comprobado | Resultados de SELECT VERSION() e information_schema.ENGINES aportados por usuario; ver sección 13 | MySQL 5.6.51-log, InnoDB DEFAULT, transacciones y savepoints YES; PHP/HTTPS aún pendientes |
| 2026-11-16 | CP1: PROC_VERIFICA_SECNCF analizado | Código del SP aportado directamente por el usuario; ver sección 14 | Validación de rango confirmada, sin fecha ni garantía de unicidad; aislamiento LOCAL obligatorio |
| 2026-11-16 | CP1: CONTROL_SEC_NCF inspeccionada | Captura del resultado RDB$RELATION_FIELDS/RDB$FIELDS aportada por usuario; ver sección 15 | Campos y tipos confirmados; falta DDL de índices/triggers y evidencia de límites por lote |
| 2026-11-16 | CP1: índices y rangos verificados | Capturas de índices CONTROL_SEC_NCF y consulta sin registros de solapamientos; ver sección 16 | Ningún solapamiento de rangos activos con límites no nulos observado; los índices no los previenen; DDL de triggers y relación de lotes pendientes |
| 2026-11-16 | CP1: corrección TEST y cola de pendientes | Aclaración explícita del usuario y verificación de qryAsignarECFASerieB en DFM; ver sección 17 | Datos DGII_SERIE_NFC solo TEST; lote actual B→E32 no selecciona facturas sin e-NCF; modo remoto sigue sin implementar |
| 2026-11-16 | CP2-A: PHP ejecutado en HTTPS | Resultado textual obtenido por usuario en idesisa.com; ver sección 22 | PASS: PHP 5.6.34, mysqli y pdo_mysql presentes. CP2-B conectar PHP→MySQL solo lectura pendiente; seguridad EOL bloquea publicación fiscal productiva sin mitigación |

| 2026-11-16 | CP2-B: prueba preparada | Procedimiento de ejecución privada, ver sección 23 | PENDIENTE: ejecutar desde el hosting con cuenta MySQL de QA de solo lectura |

| 2026-11-16 | CP2-B: PHP → MySQL QA | `TCP=OK` en 25 ms; `PASS` con PHP 5.6.34, conexión 54 ms, total 90 ms; ver sección 23 | PASS de conectividad y consultas de lectura. Pendientes limpieza del diagnóstico y ensayo concurrente de InnoDB. |

| 2026-11-17 | CP2: concurrencia InnoDB QA | A observó `1` dentro de su transacción; B esperó `13458 ms`; consulta posterior obtuvo `0`; ver sección 24 | PASS de bloqueo y rollback. Siguiente: DDL de lotes y validación de rangos en CP3. |

| 2026-11-17 | CP3: esquema y alta de lotes | DDL MySQL 5.6 en el PR #3; guion de prueba en sección 25 | Preparado; instalación y prueba en QA pendientes |

| 2026-11-17 | CP3: validación del esquema QA | Solapamiento, prioridad, bloqueo de alta y cuatro índices únicos verificados; ver sección 26 | PASS del esquema y alta de lotes. Siguiente: CP4, servicio de reserva idempotente. |

Al finalizar cada sesión, actualizar **solo** el registro de avance, los puntos resueltos, las pruebas realmente ejecutadas y las decisiones nuevas. Si un cambio altera una regla confirmada, documentar la autorización antes del commit.

---

**Protección de alcance:** Este roadmap pertenece funcionalmente a **PointSaleSoft**. Se guarda temporalmente en el repositorio privado **IdesiToolECF** para continuidad porque la integración de GitHub no otorgó escritura al repositorio **PointSaleSoft** al crear este archivo. **No implica** que el CLI, la IDESI API, ASLAN o DGII deban modificarse para este milestone. No incorporar credenciales, RNC de clientes, URL internas ni secretos en documentación versionada.

## 12. Hallazgos CP1 y CP2 — inspección documental del 15/11/2026

**Evidencia inspeccionada:** repositorio **juandivison/PointSaleSoft** (rama **main**, árbol `8c42ea68c6042723bc4b57964926c6e3b06adc1f`). **No asumir** que esa versión coincide con el código compilado actualmente en instalaciones de producción. No se ejecutaron scripts, no se emitieron e-CF ni se modificó código.

### CP1: Fuente exacta de numeración de VENTAS

- `PuntoVenta/Fuentes/uFormAsignarNCFVenta.dfm`, líneas 2649–2715: el componente **ibStpMaxNCF** invoca el stored procedure Firebird **PROC_ACTNCF** sobre **dmConectar.IBDatabase1 / IBTransaction1**. Entradas: **XSERIE, XDIV_NEGOCIO, XPECF, XAICF, XTIPO_CF**; salidas: **XNCF, SERIE, DIV_NEGOCIO, PECF, AICF, TIPO_CF, ERROR_DESC**.
- `PuntoVenta/Fuentes/uFormAsignarNCFVenta.pas`, líneas 222–355: **ProcesaNCF** llama **ibStpMaxNCF.ExecProc**, forma el e-NCF y **BitBtn13Click** lo coloca en **IBDataSet1NUMERO_NCF**. **PROC_ACTNCF puede consumir el contador ANTES de que exista la venta persistida**. Debe inspeccionarse el DDL real y los COMMIT/ROLLBACK que lo rodean.
- `PuntoVenta/Fuentes/UProcVentaRapida.pas`, líneas 12354–12432: **ProcVentaConNCF** invoca **BitBtn13Click**, exige un `ncfGenerado` no vacío, guarda **NCF_ASIGNADOS** con **BitBtn4Click** y enlaza el número a los totales. No puede simplemente hacerse que `ProcesaNCF` devuelva vacío por indisponibilidad remota sin refactorizar la ruta de factura pendiente.
- `UProcVentaRapida.pas`, líneas 13548–13665: **ProcVenta** permite que **ipStpInsertVentMast.Params[16]** (serie NCF asignado) sea **NULL** si no existe un número (`Serie_asignadoncf <= 0`). Es una capacidad parcial prometedora; todavía hay que verificar las otras rutas, status fiscal, cierres, pagos, interfaces y validaciones de Firebird.
- El procedimiento **PROC_ACTNCF** es el siguiente artefacto indispensable: extraer **RDB$PROCEDURE_SOURCE** de una BD de desarrollo representativa y rastrear quién hace `COMMIT`; no reemplazar su comportamiento de manera ciega.

### CP1: GASTOS y riesgos concretos

- `PuntoVenta/Fuentes/UEcfReservaGastos.pas`, líneas 421–470: **CargarConfiguracionSerie** usa `SELECT FIRST 1 ... FROM DGII_SERIE_NFC ... ORDER BY NCF DESC`. No ordena por vencimiento ni conoce un identificador explícito de lote/rango. En ese código **FECHA_VENCE es obligatoria** y **ValidarVencimientoSerie** rechaza `FECHA_VENCE <= Date`, incluyendo el día de expiración. Revisar normativa sobre inclusividad del último día; no corregirlo sin verificar.
- La misma unidad, líneas 767–844 y 957–1053, ya aplica **reserva por HASH_DOC**, registro en **ECF_RESERVA**, **NCF_ASIGNADOS_COMPRA**, actualización de **TRANS_OPERACION_MASTER** y transacción Firebird con hasta tres intentos por concurrencia. **No destruir esta idempotencia local al integrar la remota**.
- `UEcfReservaGastos.pas`, líneas 635–663: **IncrementarSecuencia** usa `UPDATE DGII_SERIE_NFC ... AND NCF=:NCF_ANTERIOR` y verifica `RowsAffected=1`, una comparación optimista local; no resuelve exclusividad entre Firebirds de sucursales diferentes.
- La misma unidad, líneas 574–603, usa **SiguienteCorrelativoLibreLocal**, que puede saltar números usados localmente. La ruta REMOTO no debe inventar incrementos locales para eludir colisiones.
- `UEcfReservaGastos.pas`, líneas 767–813: **CargarConfiguracionSerie** y **ValidarVencimientoSerie** se ejecutan **antes** de **BuscarReservaExistente**: incluso reutilizar una reserva vieja podría fallar si la configuración actual ha vencido. Separar validación de asignación NUEVA de recuperación de asignación EXISTENTE.
- `PuntoVenta/Fuentes/UEcfEnvioGastos.pas`, líneas 246–271 y 715–793: reconoce **SECUENCIA_USADA**; comentario explícito indica que el caller **btnEnviarEcfClick** puede continuar hacia una **reasignación automática**. **La llamada efectiva al botón todavía no está verificada**. Inspeccionar antes de conectar REMOTO; bajo este modo no debe ejecutarse ninguna reasignación automática.

### CP1: procesamiento por lote existente, alcance real

- `PuntoVenta/Fuentes/UFormAsignareCFAVentasSineCF.pas`, líneas 169–219: el botón ejecuta bucle manual y **solo procesa TIPO_NCF='02'** llamando **ProcesaNCF('32')** y **ProcReAsignareCF** con `NCF_Anterior`. **No asumir que ya es un procesador genérico** de E31/E32 sin e-NCF. Es una ruta de **reasignación** que requiere instrumentación y permisos para REMOTO, no equivalente automáticamente al nuevo procesamiento de facturas pendientes sin e-NCF.
- Necesitamos auditar origen y criterios del dataset **qryAsignarECFASerieB** y su SQL, así como rechazo, lote y persistencia de ventas y notas.

### CP2: viabilidad PHP/MySQL en Network Solutions

Documentación oficial disponible:

- Network Solutions: [acceso a phpMyAdmin](https://www.networksolutions.com/help/article/how-do-i-access-phpmyadmin) y [creación de base MySQL](https://www.networksolutions.com/help/article/how-do-i-create-a-microsoft-sql-database) confirman que el proveedor ofrece panel y gestión MySQL en paquetes compatibles.
- Network Solutions: [cambiar versión PHP](https://www.networksolutions.com/help/article/change-php-version-hosting) confirma administración de PHP en hosting UNIX. **No certifica** la versión ni permisos de la cuenta concreta.
- MySQL: [bloqueos InnoDB](https://dev.mysql.com/doc/refman/8.4/en/innodb-locks-set.html) y [niveles de aislamiento](https://dev.mysql.com/doc/refman/8.4/en/innodb-transaction-isolation-levels.html) documentan el fundamento para la transacción atómica.

**Prueba de lectura pendiente en phpMyAdmin, sin DDL ni cambios de datos:**

~~~sql
SELECT VERSION() AS version_mysql, DATABASE() AS base_actual, @@autocommit AS autocommit;
SELECT ENGINE, SUPPORT, TRANSACTIONS, SAVEPOINTS
FROM information_schema.ENGINES
WHERE ENGINE = 'InnoDB';
~~~

La cuenta de MySQL debe devolver **InnoDB** con soporte de transacciones, y el entorno PHP debe confirmar **PDO / pdo_mysql o mysqli** por vía privada segura. Posteriormente probar conexión HTTPS con autenticación y una base/control de QA; **no subir un phpinfo público ni exponer credenciales, secretos ni cadenas de conexión**.

### Riesgos que quedan ABIERTOS al cerrar esta inspección

1. Falta el código SQL del **PROC_ACTNCF** y su manejo transaccional real.
2. Falta certificar la versión de GitHub frente al árbol Delphi real de desarrollo/producción.
3. Falta localizar el caller real de **btnEnviarEcfClick**, en especial el disparo de reasignación.
4. Falta verificar el procesamiento por lote, datos de origen de notas y pagos sin e-NCF.
5. Falta prueba **real** de PHP/MySQL/InnoDB/HTTPS en el hosting.
6. Ningún comportamiento de producción está aprobado ni ha sido modificado.

**Actualización 16/11:** PROC_ACTNCF y las consultas MySQL de CP2 ya fueron aportados por el usuario. Ver sección 13. Próxima acción: PROC_VERIFICA_SECNCF, entorno PHP/TLS y rutas efectivas de persistencia; mantener LOCAL intacto.

## 13. CP1/CP2 — Validación real del 16/11/2026

**Fuentes:** DDL textual de `PROC_ACTNCF` (Firebird 2.5) y capturas de resultados de consultas de solo lectura MySQL aportadas por el propietario. No son pruebas ejecutadas por GitHub ni cambios de esquema. No divulgar la identidad de la base ni credenciales en el repo.

### CP2: resultado MySQL efectivamente observado

| Campo | Resultado observado |
|---|---|
| `VERSION()` | `5.6.51-log` |
| `@@autocommit` | `1` |
| `information_schema.ENGINES` | `InnoDB` |
| `SUPPORT` | `DEFAULT` |
| `TRANSACTIONS` | `YES` |
| `SAVEPOINTS` | `YES` |

**Conclusión parcial:** la cuenta MySQL puede usar tablas InnoDB y transacciones, pero **no está probada** la ejecución PHP, las extensiones PDO MySQL/mysqli, el certificado HTTPS del endpoint, conectividad de PHP a MySQL, latencia real ni permisos de creación de tablas para el servicio.

**Compatibilidad obligatoria:** MySQL **5.6**, no 8.x. Son apropiados `START TRANSACTION`, `SELECT ... FOR UPDATE`, `INSERT`, `UPDATE`, `COMMIT`/`ROLLBACK` con InnoDB. No utilizar `SKIP LOCKED`, `NOWAIT`, CTE, tipo de columna `JSON` nativo, ni depender de CHECK constraints para integridad. Envolver la reserva en transacción explícita incluso con `@@autocommit=1`. Crear siempre filas de control por emisor/ambiente/tipo antes de admitir reservas para bloquear una **fila existente**.

**Alerta de seguridad:** Oracle confirma que **5.6.51 fue la última versión de mantenimiento 5.6**, sin nuevas correcciones a partir de 2021; está bajo Sustaining Support. Consultar opción de actualización de hosting o backend seguro antes del piloto productivo. Referencias oficiales:
- https://dev.mysql.com/blog-archive/5-6-goes-deep-six/
- https://www.mysql.com/support/eol-notice.html
- https://downloads.mysql.com/docs/refman-5.6-en.pdf

No exponer puerto MySQL al público; usar PHP→MySQL local bajo TLS HTTPS y credenciales restringidas, sujetas a comprobación.

### CP1: análisis línea a línea de PROC_ACTNCF (texto provisto)

**Entradas:** `XSERIE CHAR(1)`, `XDIV_NEGOCIO CHAR(2)`, `XPECF CHAR(3)`, `XAICF CHAR(3)`, `XTIPO_CF CHAR(2)`.

**Salidas:** `XNCF DOUBLE PRECISION`, `SERIE`, `DIV_NEGOCIO`, `PECF`, `AICF`, `TIPO_CF`, `ERROR_DESC VARCHAR(40)`.

**Flujo comprobado por el texto:**

1. Ejecuta `SELECT MAX(NCF)+1` de `DGII_SERIE_NFC` filtrando `ACTIVO=1` y 5 componentes de secuencia.
2. Agrupa por los componentes y además por la expresión `IIF(... FECHA_VENCE IS NOT NULL ...)`; no selecciona el lote por fecha real más próxima.
3. Invoca `PROC_VERIFICA_SECNCF(:XNCF, :XTIPO_CF, "ToDay")` (representación textual del código recibido); la implementación/validaciones de este procedimiento **siguen desconocidas**.
4. Si `ESVALIDO = 1`, hace `UPDATE DGII_SERIE_NFC SET NCF=:XNCF` con filtros de componentes y `ACTIVO=1`.
5. No incluye en ese `UPDATE` el valor anterior de NCF, ID de lote, `FECHA_VENCE` ni verificación de `RowsAffected`. Devuelve `SUSPEND`.

**Riesgos demostrables para varios lotes:**

- Si dos lotes activos tienen fechas de vencimiento **no nulas** diferentes, el `GROUP BY` basado en presencia de vencimiento puede mezclarlos; `MAX(NCF)+1` consume el mayor número, no el lote más próximo a vencer.
- Si coexisten filas con vencimiento **nulo y no nulo**, la expresión de agrupación puede producir **varias filas** para un `SELECT ... INTO` escalar; requiere revisar el error real y las reglas de carga antes de asumir funcionamiento.
- El `UPDATE` no identifica lote: si hay varias filas activas con la misma clave de componentes, puede asignar `XNCF` a **todas**, destruyendo sus contadores independientes.
- Dos sesiones podrían leer el mismo `MAX(NCF)+1`; sin comparar NCF previo ni comprobar filas actualizadas **el cuerpo del procedimiento por sí solo no demuestra exclusión concurrente**. El resultado exacto depende de aislamiento, transacción y `PROC_VERIFICA_SECNCF`; no declarar colisión real sin prueba.
- `NCF DOUBLE PRECISION` es el campo heredado: la mayoría de correlativos decimales pequeños son enteros representables exactamente, por lo que **no afirmar un defecto de redondeo sin evidencia**. Para el diseño MySQL usar `BIGINT` por claridad e integridad.
- No se ha probado dónde se realizan COMMIT/ROLLBACK; el procedimiento no contiene COMMIT propio.
- Si `PROC_VERIFICA_SECNCF` rechaza la secuencia, `ERROR_DESC` indica agotamiento, pero no demuestra que la causa sea realmente falta de números (podría haber otras validaciones).

**Decisión resultante:** congelar el comportamiento **LOCAL** hasta terminar auditoría. No introducir más filas con distintos vencimientos suponiendo que `PROC_ACTNCF` funcionará igual. El modo REMOTO debe recibir número + lote + vencimiento desde PHP y persistirlo con una ruta controlada, sin invocar `PROC_ACTNCF` como segunda fuente de numeración. No cambiar silenciosamente la regla de reasignación heredada de modo LOCAL.

### Siguientes pruebas necesarias y criterios

1. Obtener SQL/DDL íntegro de **`PROC_VERIFICA_SECNCF`**, más sus dependencias: verificaciones de rango, fecha, NCF ocupado y parámetros.
2. En Firebird de desarrollo: revisar transacciones alrededor de `ibStpMaxNCF.ExecProc` y `BitBtn4Click`; determinar si falla posterior deja correlativo consumido.
3. En Network Solutions: comprobar versión PHP y extensión PDO MySQL/mysqli **sin publicar phpinfo ni secretos**; una prueba HTTP mínima autenticada y sin operaciones fiscales.
4. Determinar si los rangos autorizados se representan en una tabla distinta a `DGII_SERIE_NFC`; extraer su DDL de desarrollo. La frontera entre lotes requiere `DESDE`/`HASTA`.
5. Antes de crear DDL remoto, confirmar límites de tipo E31/E32 y custodia de rangos por sucursal (sin registrar datos reales de clientes en un repo público).

**Estado:** CP1 parcialmente comprobado, CP2 motor/transacciones confirmados, API PHP/HTTPS pendiente; CP3 (DDL remoto) NO iniciado. No se ha alterado Firebird ni MySQL.

## 14. CP1 — PROC_VERIFICA_SECNCF y no regresión del modo LOCAL (16/11/2026)

**Fuente inspeccionada:** cuerpo íntegro del procedimiento Firebird `PROC_VERIFICA_SECNCF`, aportado por el usuario. No se ha modificado ni ejecutado.

### Firma

- Entrada `SEC_NCF INTEGER`: correlativo candidato.
- Entrada `IDNCF VARCHAR(2)`: identificador de tipo, como `31`, `32` (no prefijo `E31`).
- Entrada `FECHA TIMESTAMP`: parámetro presente pero **NO UTILIZADO** en la lógica activa.
- Salida `ES_VALIDO SMALLINT`.

### Lógica real confirmada

1. `SELECT c.FIN_SECUENCIA, c.ID_SERIE FROM CONTROL_SEC_NCF c`
   con filtros `c.INICIO_SECUECIA <= :SEC_NCF`, `c.FIN_SECUENCIA >= :SEC_NCF`, `c.STATUS=1`, `c.IDNCF=:IDNCF` en `ncf_actual` e `idserie`.
2. Inicializa `ES_VALIDO=0`.
3. El bloque `IF (:ncf_actual=:SEC_NCF) THEN BEGIN ... END` **no ejecuta operación**: desactivación del rango está comentada.
4. `IF (:SEC_NCF <= NCF_ACTUAL) THEN ES_VALIDO=1`. Por el propio WHERE del SELECT, si existe exactamente un rango coincidente, la condición es redundante y valida cualquier número en ese rango.
5. Hay un bloque antiguo comentado que comprobaba `FECHA_ASIGNACION <= :FECHA`; **no forma parte del comportamiento actual**.
6. No actualiza tabla ni reserva contador: es una validación de pertenencia a rango autorizado activo, no mecanismo de unicidad o de vencimiento.

### Hallazgos/riesgos

- Si no existe coincidencia, las variables permanecen NULL, por lo que `ES_VALIDO` queda en 0.
- Si existen varios rangos activos coincidentes (solapamiento), la selección PSQL en `INTO` no es singleton y puede producir error; Firebird 2.5 exige a lo sumo una fila para SELECT...INTO.
- `FECHA` no se utiliza; ninguna validación de vencimiento se realiza en este SP.
- Ni este SP ni `PROC_ACTNCF` garantizan por sí solos exclusividad entre sucursales.
- **Límite técnico a vigilar:** `SEC_NCF INTEGER` soporta hasta 2,147,483,647. El formato e-NCF utiliza campo decimal con ceros iniciales y puede requerir un correlativo de más de 32 bits; no trasladar este límite a MySQL. En REMOTO usar `BIGINT` y transportar correlativo como valor exacto/string validado. No cambiar tipos de Firebird LOCAL sin análisis.
- Confirmar el DDL, índices y triggers de `CONTROL_SEC_NCF` para verificar prevención de rangos superpuestos; actualmente no se proporcionaron.

### Restricción de compatibilidad: decisión de ingeniería

**No modificar** `PROC_ACTNCF`, `PROC_VERIFICA_SECNCF` ni tablas/triggers empleados por clientes LOCAL para implementar el modo multisucursal. El nuevo selector por empresa/sucursal debe iniciar en **LOCAL** (o equivalente si el parámetro no existe), con rutas separadas:

- **LOCAL:** llamada exacta al `ibStpMaxNCF.ExecProc` existente, validación `PROC_VERIFICA_SECNCF`, creación y persistencia actual de NCF.
- **REMOTO:** **NO** invoca `PROC_ACTNCF` para consumir números. La API PHP/InnoDB controla por sí misma lote autorizado, vigencia, contador y reserva idempotente. Delphi registra localmente e-NCF devuelto y el tipo solicitado, sin actualizar el contador de `DGII_SERIE_NFC` mediante el SP local.
- Ante fallo remoto: mantener factura comercial sin e-NCF y con su tipo solicitado, bajo estado fiscal explícito; no encadenar a LOCAL ni fabricar un correlativo. Debe auditarse el cierre contable y la impresión; no aceptar que una factura sin e-NCF sea rotulada fiscalmente emitida.
- En REMOTO, ningún flujo (ventas, gastos, reprocesamiento, E33/E34) puede ejecutar reasignación automática. Inspeccionar llamadas de `btnEnviarEcfClick` y procesador por lote para impedir saltos no autorizados. Para LOCAL, conservar comportamiento hasta modificación independiente aprobada: documentar el riesgo heredado.
- **No añadir lógica condicional remota dentro de los stored procedures legados** ni imponerles chequeos de red; hacer selección en la capa Delphi antes de invocar el generador adecuado.
- No ejecutar cambios DDL masivos ni triggers generales en la base de todos los clientes. Objetos auxiliares necesarios para REMOTO, si se aprueban, deben crearse con migración aditiva/opt-in y regresión LOCAL.

### Criterios de regresión no negociables

1. Configuración ausente: comportamiento LOCAL inalterado.
2. LOCAL, con MySQL y PHP fuera de servicio: mismas secuencias/persistencia, sin timeout externo.
3. LOCAL con ventas, gastos, devolución y facturación pendiente: mismas salidas/efectos que antes; no crear registros remotos.
4. REMOTO con respuesta válida: reserva remota estable, una sola asignación local; no invoca generador LOCAL.
5. REMOTO sin conexión: venta comercial persistida sin e-NCF (solo tras comprobar su flujo completo) y tipo fiscal solicitado guardado.
6. REMOTO con timeout después de COMMIT MySQL: consulta idempotente del mismo ID; no reasignación.
7. Cambiar modo no habilita consumir el mismo rango simultáneamente en LOCAL y REMOTO.
8. Fallos de prueba no constituyen aprobación productiva; no se emiten e-CF a DGII durante QA del contador.

**Próximos insumos CP1:** DDL de `CONTROL_SEC_NCF`, flujo exacto de commits en ventas y gastos, y prueba segura de código local que respalde que `SERIE_NCF_ASIGNADO=NULL` puede conservar venta sin e-CF sin ruptura. **CP2:** probar PHP→MySQL y HTTPS con credenciales privadas en entorno controlado.

Fuentes externas de verificación técnica:
- Firebird 2.5 Language Reference — `SELECT ... INTO` singleton: https://www.firebirdsql.org/file/documentation/html/en/refdocs/fblangref25/firebird-25-language-reference.html
- Firebird 2.5 Language Reference — `INTEGER` 32 bits y `BIGINT` 64 bits: https://firebirdsql.org/file/documentation/html/en/refdocs/fblangref25/firebird-25-language-reference.html

## 15. CP1 — CONTROL_SEC_NCF: metadatos confirmados (16/11/2026)

**Fuente:** captura enviada por el propietario con resultado de consulta de metadatos Firebird. **Confirmación estructural solamente**; la captura no muestra índices, PK, CHECK, triggers, defaults ni datos.

| Campo exacto | RDB$FIELD_TYPE | Interpretación Firebird 2.5 | LONGITUD | RDB$NULL_FLAG |
|---|---:|---|---:|---|
| `ID_SERIE` | 8 | INTEGER | 4 | 1 |
| `IDNCF` | 37 | VARCHAR(2) | 2 | 1 |
| `INICIO_SECUECIA` | 8 | INTEGER | 4 | NULL |
| `FIN_SECUENCIA` | 8 | INTEGER | 4 | NULL |
| `FECHA_ASIGNACION` | 35 | TIMESTAMP | 8 | NULL |
| `STATUS` | 7 | SMALLINT | 2 | NULL |

**Respetar el identificador literal `INICIO_SECUECIA`**, sin normalizar ortografía en Delphi, SQL o migraciones retrospectivas.

### Consecuencias técnicas

- La tabla controla `INICIO_SECUECIA` y `FIN_SECUENCIA` para validación en `PROC_VERIFICA_SECNCF`, pero **no incluye FECHA_VENCE**. La fecha de asignación no es equivalente a la de vencimiento.
- `DGII_SERIE_NFC.FECHA_VENCE` existe por separado; no se ha demostrado correspondencia uno-a-uno entre filas de ambas tablas ni una clave de lote compartida. No asumir asociación a partir solo de `IDNCF`.
- Los límites actuales usan `INTEGER`; REMOTO debe usar entero exacto (`BIGINT` en MySQL) y validar formato/rango fiscal independientemente. No cambiar los dominios heredados LOCAL como parte del milestone.
- `STATUS` es nullable según metadatos; el SP solo considera activo `STATUS=1`. Confirmar los defaults y el tratamiento efectivo de NULL antes de importar lotes.
- El diseño remoto debe registrar **inicio, fin, último asignado, vencimiento, emisor, tipo, ambiente y ámbito de sucursal autorizada** en una fila de lote identificable. No guardar credenciales o detalles fiscales del contribuyente en el roadmap público.
- Falta la verificación de rangos solapados y consistencia de índices/triggers. No asegurar que el sistema actual impide solapamientos solo porque tenga `ID_SERIE`.

### Consultas pendientes — SOLO LECTURA en Firebird de desarrollo

**Índices, unicidad y segmentos:**

~~~sql
SELECT TRIM(i.RDB$INDEX_NAME) AS INDICE,
       i.RDB$UNIQUE_FLAG AS ES_UNICO,
       i.RDB$INDEX_INACTIVE AS INACTIVO,
       TRIM(s.RDB$FIELD_NAME) AS CAMPO,
       s.RDB$FIELD_POSITION AS POSICION
FROM RDB$INDICES i
JOIN RDB$INDEX_SEGMENTS s ON s.RDB$INDEX_NAME = i.RDB$INDEX_NAME
WHERE i.RDB$RELATION_NAME = 'CONTROL_SEC_NCF'
ORDER BY i.RDB$INDEX_NAME, s.RDB$FIELD_POSITION;
~~~

**Triggers y estado:**

~~~sql
SELECT TRIM(t.RDB$TRIGGER_NAME) AS TRIGGER_NOMBRE,
       t.RDB$TRIGGER_TYPE AS TIPO,
       t.RDB$TRIGGER_INACTIVE AS INACTIVO,
       t.RDB$TRIGGER_SOURCE AS FUENTE
FROM RDB$TRIGGERS t
WHERE t.RDB$RELATION_NAME = 'CONTROL_SEC_NCF'
  AND COALESCE(t.RDB$SYSTEM_FLAG, 0) = 0
ORDER BY t.RDB$TRIGGER_NAME;
~~~

**Solapamientos activos para el mismo tipo (puede mostrar información interna; no divulgar datos identificativos sin anonimización):**

~~~sql
SELECT a.IDNCF, a.ID_SERIE AS RANGO_A, b.ID_SERIE AS RANGO_B,
       a.INICIO_SECUECIA AS A_DESDE, a.FIN_SECUENCIA AS A_HASTA,
       b.INICIO_SECUECIA AS B_DESDE, b.FIN_SECUENCIA AS B_HASTA
FROM CONTROL_SEC_NCF a
JOIN CONTROL_SEC_NCF b
  ON a.IDNCF = b.IDNCF
 AND a.ID_SERIE < b.ID_SERIE
WHERE a.STATUS = 1 AND b.STATUS = 1
  AND a.INICIO_SECUECIA IS NOT NULL
  AND a.FIN_SECUENCIA IS NOT NULL
  AND b.INICIO_SECUECIA IS NOT NULL
  AND b.FIN_SECUENCIA IS NOT NULL
  AND a.INICIO_SECUECIA <= b.FIN_SECUENCIA
  AND b.INICIO_SECUECIA <= a.FIN_SECUENCIA;
~~~

**Siguiente control:** obtener índices/triggers para cerrar integridad de lotes LOCAL. No ejecutar procedimientos que consuman secuencias para verificar esta estructura.

## 16. CP1 — índices y evidencia de no solapamiento (16/11/2026)

**Fuente:** capturas aportadas por usuario, en Firebird de una instalación examinada. Las consultas fueron de solo lectura. Los valores de contadores vistos son una observación de esta base, **no** autorización fiscal de una sucursal específica ni inventario definitivo del piloto.

### Índices de CONTROL_SEC_NCF confirmados

| Índice | Campo | ES_UNICO |
|---|---|---:|
| `CONTROL_SEC_NCFINDEX1` | `ID_SERIE` | 1 |
| `CONTROL_SEC_NCFINDEX2` | `IDNCF` | 0 |
| `RDB$PRIMARY5` | `ID_SERIE` | 1 |

**Consulta de pares de rangos activos solapados:** **0 filas**. El resultado prueba únicamente que no se detectan solapamientos entre rangos **activos con límites no nulos** para el mismo `IDNCF` en esta instancia y momento. **No existe garantía estructural observada contra futuros solapamientos**: ni el índice único por `ID_SERIE` ni el índice no único por `IDNCF` impiden la superposición de rangos. La ausencia de solapamientos debe comprobarse también en nuevas importaciones o delegaciones de sucursales.

### DGII_SERIE_NFC: aclaración confirmada

**`FECHA_VENCE` está en `DGII_SERIE_NFC` (terminación literal NFC)**, no en `CONTROL_SEC_NCF`. En la captura existen configuraciones activas de tipos E31/E32/E33/E34/E44/E45 con contadores y vencimientos distintos; otras están inactivas. No copiar esos valores al esquema central como inventario completo ni inferir de `NCF=0` que exista rango autorizado disponible.

**Diferencia de responsabilidades existente:**
- `CONTROL_SEC_NCF`: rango autorizado por `IDNCF` (`INICIO_SECUECIA`-`FIN_SECUENCIA`) y estado; `FECHA_ASIGNACION`.
- `DGII_SERIE_NFC`: última secuencia `NCF`, `ACTIVO` y `FECHA_VENCE`, con filtros de serie/división/PECF/AICF/tipo.

**No existe enlace explícito de identidad de lote entre ambas tablas según los DDL conocidos.** `PROC_ACTNCF` realiza la selección por componentes, luego `PROC_VERIFICA_SECNCF` valida por tipo y rango. Para un esquema remoto con lotes de vencimiento distinto, la relación entre rango, contador y `FECHA_VENCE` debe ser **una única fila de lote con identificador único**, sin depender de una unión ambigua por tipo.

### Riesgo adicional del índice DGII_SERIE_NFC

El DDL recibido contiene un índice único sobre `(SERIE, DIV_NEGOCIO, PECF, AICF, TIPO_CF, NCF)`, que **excluye `FECHA_VENCE`**. Si se colocan múltiples filas activas con mismos cinco componentes y contadores inicialmente distintos, el `UPDATE` actual de `PROC_ACTNCF` intenta asignar el **mismo NCF nuevo** a todas, pudiendo provocar **violación del índice único**. No asumir que bastaría con insertar nuevas filas por fecha de vencimiento en LOCAL.

### Decisiones para avanzar CP3 sin modificar LOCAL

- **No ampliar ni modificar** `CONTROL_SEC_NCF`, `DGII_SERIE_NFC`, `PROC_ACTNCF` ni `PROC_VERIFICA_SECNCF` de instalaciones LOCAL para introducir nuevos lotes del modo REMOTO.
- Modelo remoto explícito por lote: emisor + ambiente + tipo + identidad de lote + rango DESDE/HASTA + último asignado + fecha de vencimiento (cuando aplica) + estado + ámbito autorizado de sucursal. Guardar mínimo de reservas para idempotencia y reconciliación; **sin histórico contable completo** remoto.
- Dar prioridad al lote vigente **con vencimiento más próximo**; el cursor de cada lote inicia conceptualmente en `DESDE-1`, nunca en cero salvo que `DESDE=1` y se aplique el valor correcto. Evitar saltos al alternar lotes.
- Aplicar validación de rango superpuesto en el servicio remoto dentro de una operación protegida por transacción/lock de control; las claves únicas de una tabla por sí solas no detectan intersecciones de intervalos.
- Si la sucursal opera en LOCAL con un rango delegado independiente, no debe estar habilitado ese mismo rango en REMOTO.
- Registros de muestra no prueban que todas las autorizaciones DGII estén cargadas; comprobar asignaciones y consumos reales antes del piloto.

### Pendientes remanentes CP1

1. Verificar índices/triggers o DDL integral de `DGII_SERIE_NFC` y `CONTROL_SEC_NCF` (sin mutaciones).
2. Auditar end-to-end la persistencia de venta sin e-NCF y su tipo fiscal solicitado, especialmente estado fiscal, impresión y procesos batch.
3. Confirmar cuándo/por qué `PROC_ACTNCF` consume contador respecto al COMMIT de `NCF_ASIGNADOS` y de la venta.
4. No modificar el comportamiento de CLIENTES LOCAL, incluidas funciones heredadas, sin QA y autorización.

**Estado:** CP1 auditoría estructural sustancialmente avanzada; la revisión transaccional y de flujos queda abierta. CP2 InnoDB confirmado, PHP/HTTPS pendiente. CP3 modelo lógico listo para DDL propuesto tras revisar restricciones de MySQL 5.6 y de rangos del emisor piloto.

## 17. Evidencia de TEST exclusivamente, auditoría de pendientes y diseño CP2/CP3 (16/11/2026)

### Rectificación explícita del origen de datos

**El usuario confirma que TODOS los contadores, flags, fechas y filas vistos en la captura de `DGII_SERIE_NFC` pertenecen a una base de TEST y NO reflejan valores actuales de producción.** Queda expresamente prohibido copiar o inferir de esas capturas el próximo e-NCF, el saldo, los rangos vigentes, el vencimiento o el estado de numeración del piloto. La consulta de índices y solapamientos también es evidencia **solamente de la instancia inspeccionada**, no prueba de ausencia de solapamiento en todas las sucursales.

**Condición de activación piloto:** antes de migrar/activar REMOTO, obtener en procedimiento autorizado y exclusivamente lectura: autorizaciones DGII reales por RNC/ambiente/tipo/rango/vencimiento, reservas sin resolver, e-NCF efectivamente emitidos/aceptados/rechazados y rangos delegados a sucursales. Realizar conciliación formal y firmar checkpoint. No copiar datos identificativos de producción al repositorio.

### Nueva auditoría del procesador por lote existente — hechos de código

`PuntoVenta/Fuentes/UDatModFacturaElectronica.dfm` líneas 534–550 define `qryAsignarECFASerieB` como consulta que:

- Obtiene `VENTAS_MAST` unido a `NCF_ASIGNADOS` por `SERIE_NCF_ASIGNADO`.
- Filtra **`r.numero_ncf LIKE 'B%'`** y `r.fecha=:fecha`.
- Por construcción **no selecciona** facturas con `SERIE_NCF_ASIGNADO IS NULL` o sin `NCF_ASIGNADOS`.

`PuntoVenta/Fuentes/UFormAsignareCFAVentasSineCF.pas` líneas 169–219 confirma que el botón usa ese dataset, restringe su operación a `TIPO_NCF='02'` y realiza `ProcesaNCF('32')` seguido de `ProcReAsignareCF`.

**Decisión:** NO reutilizar ciegamente esa rutina para facturas REMOTO sin e-NCF. La nueva cola debe identificar documentos cuyo **tipo e-CF solicitado** esté persistido y cuyo e-NCF esté efectivamente ausente, y distinguir *primera asignación* de *reasignación autorizada* de un número anterior. Las emisiones fiscales no deben iniciarse si la referencia original no es válida.

### Evidencia de ruta de venta sin e-NCF; faltan invariantes end-to-end

- `PuntoVenta/Fuentes/UDatModFactura.dfm` líneas 397–404: `ibQryViewNCF` procede de `View_nfc` y obtiene `FECHA_VENCE`; todavía se debe inspeccionar el DDL de `View_nfc`.
- `PuntoVenta/Fuentes/UProcVentaRapida.pas` líneas 12354–12432: `ProcVentaConNCF` exige un número no vacío antes de persistir `NCF_ASIGNADOS`. No basta con forzar `ncfGenerado=''`; puede abortar o dejar estados parciales.
- `UProcVentaRapida.pas` líneas 13548–13665: `ProcVenta` asigna `ipStpInsertVentMast.Params[16]=NULL` si `Serie_asignadoncf<=0`, pero por sí solo **no demuestra** que todas las vías de contado, crédito, devoluciones, inventario, CxC, pagos, timbre, impresión y emisión puedan completar correctamente la operación comercial sin e-NCF.
- `VENTAS_MAST.TIPONCFIFISCAL` se observa en dataset; **no dar por demostrado** que por sí solo conserva inequívocamente el tipo E31/E32 solicitado. Verificar semántica y mapeo real; en caso contrario, crear campo o registro auxiliar opt-in sin afectar clientes LOCAL.

### Decisiones de CP3 — propuesta de contrato, no desplegada

- API HTTPS autenticada por empresa/sucursal. Nunca exponer MySQL directamente a clientes Delphi 7.
- `POST` lógico de reserva con `request_id` **persistido previamente en Firebird**, empresa/ambiente/tipo/sucursal y clave estable del documento de origen; la respuesta devuelve **reserva existente** si se repite `request_id`.
- Un `request_id` con atributos alterados debe responder **conflicto**, no entregar otro número. No aceptar que el cliente suministre libremente el RNC/ambiente de otro tenant; derivarlo o validarlo por sus credenciales.
- Tres tablas lógicas: control de bloqueo por emisor/ambiente/tipo, lotes vigentes (inicio, fin, último, vencimiento), reservas (UUID, sucursal, documento local, e-NCF, estado y timestamp), con índices de unicidad.
- Compatibilidad MySQL 5.6: transacción InnoDB y `SELECT ... FOR UPDATE` sobre **fila de control ya existente**, no `SKIP LOCKED`. Validar que no se superponen rangos centralizados y rangos delegados.
- Minimizar almacenamiento central; **no borrar claves de idempotencia ni evidencia de asignación** antes de archivarlas con acuse verificable. Mantener tombstones mínimos con `request_id` y número cuando proceda para evitar que una solicitud antigua sea tratada como nueva.
- En caso de corte de red, el documento comercial persiste sin e-NCF; la solicitud pendiente conserva la misma identidad. **No fallback LOCAL**, **no nueva solicitud automática por error ambiguo**. Recuperación por reintento del mismo ID o consulta sin incremento.
- No codificar ni activar todavía cambios en Firebird LOCAL ni en los flujos de reasignación.

### CP2 — próximo ensayo mínimo controlado en Network Solutions

**Prueba remota A (sin cambios de datos):** confirmar en el PHP Manager la versión concreta de PHP y, por un mecanismo privado de diagnóstico no publicado, la disponibilidad de **PDO_MYSQL o mysqli**. Confirmar que el PHP del mismo hosting puede conectarse a MySQL con un usuario de **solo lectura** y realizar `SELECT 1` y `SELECT VERSION()`, sin imprimir secretos ni servidor/base en respuestas públicas. No usar `phpinfo()` público.

**Prueba remota B (posterior, con BD/usuario de QA separados):** ejecutar dos sesiones concurrentes sobre filas de prueba InnoDB para validar bloqueo, rollback, idempotencia y respuesta determinista. **Nunca** utilizar numeraciones reales de producción en esta prueba.

**Control de seguridad:** MySQL 5.6.51 es fin de mantenimiento (Oracle); solicitar al proveedor plan de actualización o controles de aislamiento adecuados antes de explotación fiscal productiva. Documentación oficial: https://dev.mysql.com/blog-archive/5-6-goes-deep-six/ y https://www.networksolutions.com/help/article/change-php-version-hosting

**Evidencias aún requeridas:** PHP real, TLS/endpoint, transacción concurrente QA, semántica de tipos y persistencia comercial sin e-NCF. CP2 NO cerrado; CP3 NO implementado.

## 18. CP2 — verificación PHP sin cambiar hosting (16/11/2026)

**Tipo de trabajo:** plan de verificación, NO prueba ejecutada. **Sistema actual:** MySQL 5.6.51-log, InnoDB DEFAULT, TRANSACTIONS=YES, SAVEPOINTS=YES. Este resultado **no confirma** que PHP puede conectarse a MySQL, ni la versión de PHP o sus extensiones.

### Checkpoint pequeño CP2-A — PHP Manager, solo consulta

1. Network Solutions → Hosting → Manage → Configurations → PHP Manager.
2. Registrar versión **efectivamente activa** de PHP en ese plan. **No modificarla** hasta comprobar que el módulo de licenciamiento existente sea compatible.
3. Comprobar por vía privada si PHP tiene `PDO_MYSQL` o `mysqli` instalados. Evitar `phpinfo()` público, pantallas que impriman credenciales, o subir archivos de diagnóstico al repositorio.
4. Resultado esperado: versión PHP concreta y al menos un driver MySQL disponible.

Referencia del proveedor: https://www.networksolutions.com/help/article/change-php-version-hosting

### CP2-B — prueba PHP→MySQL (todavía pendiente)

- Preferir ejecución **no pública**, dentro del hosting, mediante PHP CLI/cron/administrador autorizado si el plan lo permite; si no, preparar una ruta HTTPS temporal autenticada y protegida, no un diagnóstico sin autenticación publicado.
- Configuración de conexión con secreto fuera del directorio público y fuera de Git. Usuario MySQL **solo SELECT** sobre una base de QA o vistas de inspección.
- Ejecución read-only de `SELECT 1 AS OK` y `SELECT VERSION()`; devolver solamente un resultado reducido `PASS/FAIL` al operador autenticado. No revelar mensajes de excepción SQL sin filtrado, contraseñas, hosts o nombres de bases.
- Medir latencia de conexión y respuesta en condiciones reales; documentar entorno, momento y resultado. Una consulta satisfactoria en phpMyAdmin NO reemplaza esta prueba.
- No crear todavía tablas fiscales ni alterar la base del módulo de licenciamiento.
- **PASS CP2** requiere PHP efectivo + driver + HTTPS seguro + conexión autorizada + respuesta reproducible y evidencia de manejo de error; por ahora solo motor InnoDB está confirmado.

### Dependencia importante

La implementación definitiva PHP del servicio se escribirá conforme a la versión real detectada y no será desplegada antes de las pruebas de autenticación y concurrencia. Los errores transitorios no deben permitir que PointSaleSoft cambie de REMOTO a LOCAL.

## 19. CP3 — contrato de reserva propuesto (sin DDL ejecutado)

**Ámbito del control central:** emisor (RNC) + ambiente fiscal (TEST/PROD) + tipo de e-CF. **Modelo:** controlar un lote/rango independiente en una fila por autorización; no reutilizar el contador único de DGII_SERIE_NFC.

**Tipos y unicidad mínima, compatibles con MySQL 5.6:**

| Tabla lógica | Datos esenciales / índices |
|---|---|
| `ecf_control_secuencia` | `ID BIGINT`, RNC emisor, ambiente, tipo CF. UNIQUE(RNC, ambiente, tipo). Fila existente que se bloquea con `SELECT ... FOR UPDATE`. |
| `ecf_lotes_secuencia` | `ID BIGINT`, `CONTROL_ID`, DESDE, HASTA, ULTIMO_ASIGNADO todos `BIGINT`, vencimiento `DATE NULL`, activo, central/delegado, sucursal titular cuando aplique. Índices para búsqueda por control, vigencia y prioridad de vencimiento. |
| `ecf_reservas_secuencia` | `REQUEST_ID` inmutable y único; `CONTROL_ID`, `LOTE_ID`, SUCURSAL_ID, huella/clave estable de documento, generación de asignación autorizada, correlativo `BIGINT`, e-NCF, estado mínimo y timestamps. UNIQUE(control_id,correlativo), UNIQUE(request_id) y unicidad de generación por documento. |

**Precisión:** el diseño físico de índices compuesto debe adaptarse al límite de índices de MySQL 5.6; usar identificadores ASCII compactos o hashes binarios para evitar claves varchar largas. No usar tipo JSON nativo, CTE, `SKIP LOCKED` ni restricciones CHECK como única defensa. `fecha_vence=NULL` requiere regla explícita por tipo fiscal, no inferencia.

**Operación de reserva idempotente:**

1. Antes de realizar petición HTTP, persistir `request_id` estable en Firebird asociado al documento comercial y tipo pretendido. No crear uno nuevo ante timeout.
2. En MySQL, `START TRANSACTION` y bloquear fila `ecf_control_secuencia` existente con `SELECT ... FOR UPDATE`.
3. Verificar `request_id` previamente asignado; si coincide el contexto, devolver **la misma** reserva sin incrementar. Si cambian atributos, error de conflicto sin asignación.
4. En solicitud nueva, elegir lote central válido con contador disponible y orden de vencimiento más próximo; validar rango no delegado ni superpuesto. Incrementar contador del lote e insertar reserva dentro de la MISMA transacción. `COMMIT` y responder.
5. Si el cliente no recibe la respuesta, consultar/reintentar con el mismo `request_id`. No recurrir a numeración LOCAL ni solicitar sustitución.
6. Cualquier **nueva** secuencia para un documento ya numerado requiere acción autorizada, generación distinta, razón y rastro de la reserva anterior. No se crea desde la ruta general de reintento.

**Posibles respuestas funcionales:** `ASIGNADO`, `MISMA_RESERVA`, `SIN_LOTE`, `CONFLICTO_SOLICITUD`, `NO_AUTORIZADO`, `NO_DISPONIBLE`. Son nombres de contrato **provisionales**, sujetos a versión del endpoint y QA de integridad.

**Barrera contra colisiones:** los rangos LOCAL delegados y REMOTO deben ser disjuntos por RNC/ambiente/tipo, y cargarse/validarse al habilitar una sucursal. Una base central no puede controlar consumos offline de sucursales que comparten su rango.

**Estado CP3:** diseño de contrato en revisión. Ningún endpoint, tabla ni migración desplegados.

## 20. Handoff de conversación antes de alcanzar límites

La conversación del milestone ya es extensa. **Recomendación operativa:** abrir una conversación nueva al cerrar CP2-A (versión PHP) o antes de comenzar la implementación PHP/DDL, tomando este archivo como referencia principal. No es posible conocer de antemano el bloqueo o límite exacto de la interfaz; el checkpoint y commit en GitHub sirven para trasladar el contexto sin depender de la longitud del chat.

**Prompt para continuar:**

> Continuemos PointSaleSoft — Secuencias e-CF multisucursal. Leer el roadmap `docs/operacion/ROADMAP-POINTSALESOFT-SECUENCIAS-ECF-MULTISUCURSAL-20261115.md` del PR #3 en `juandivison/IdesiToolECF`. Estado: CP1 DDL PROC_ACTNCF, PROC_VERIFICA_SECNCF, CONTROL_SEC_NCF, DGII_SERIE_NFC analizados; las capturas de contadores son **solo TEST**, no producción. CP2 MySQL 5.6.51 con InnoDB y transacciones confirmado; PHP Manager, PDO/mysqli y conexión HTTPS pendientes. CP3 contrato de reserva idempotente y lotes por vencimiento propuesto, sin ejecutar DDL. Modo LOCAL totalmente intacto, REMOTO opcional, sin fallback ni reasignación automática, factura comercial puede persistirse sin e-NCF conservando tipo fiscal; cola B→E32 existente NO cubre facturas sin e-NCF. Se requiere QA y separar rangos de sucursales. Próximo paso: registrar versión PHP y comprobar driver/conexión; después revisar DDL remoto seguro. No tocar producción.

## 21. CP2 — hosting Windows IIS, PHP preexistente y licenciamiento ASP.NET (16/11/2026)

**Evidencia nueva del usuario:** panel Network Solutions presenta **IIS Manager**, **IIS Settings**, Database Manager y File Manager. Captura FTP/SFTP del hosting muestra carpeta `/www/proyecto-api-php/api` con al menos `index.php` y `grupos.php`. Usuario confirmó **sitio de licenciamiento C# ASP.NET**, diferente de esos archivos PHP.

**Hechos y límites:**
- El hosting utiliza la presentación de Windows/IIS y existen archivos con extensión PHP. **No está comprobado aún que se ejecuten correctamente ni qué versión PHP/extensiones MySQL están disponibles**.
- El portal de licenciamiento en **C# ASP.NET** y la carpeta API PHP deben permanecer desacoplados del nuevo gestor de secuencias. No modificar el website de licencias ni archivos `index.php`/`grupos.php` como prueba.
- Documentación oficial de Network Solutions para hosting Windows confirma configuración de PHP por **IIS Manager → PHP Manager**, o control de handlers `*.php` vía `web.config`. Consulta: https://www.networksolutions.com/help/article/boost-php-memory-limit-guide . En planes UNIX aparece PHP Manager en el panel principal; no confundir interfaces.
- La ruta física `/www` es consistente con hosting Windows de Network Solutions. Referencia: https://www.networksolutions.com/help/article/point-domain-or-subdomain-to-hosting-package .
- No se deduce de una carpeta FTP la URL pública concreta ni si el sitio está asignado al dominio. No inventar ni probar rutas productivas sin autorización.

**Próximo paso CP2-A (lectura):** entrar a **IIS Manager** en el panel observado; localizar **PHP Manager**, **Handler Mappings** o el handler de `*.php`, y registrar versión efectiva sin cambiar nada. No alterar mapeos IIS, `web.config`, versiones ni permisos. Si no aparece PHP Manager, planear una prueba PHP independiente, temporal y protegida en sitio de QA, con eliminación inmediata; nunca publicar `phpinfo()` sin protección.

**CP2-B pendiente:** comprobar PDO_MySQL/mysqli y conexión PHP→MySQL mediante prueba protegida `SELECT 1`, usuario de solo lectura; luego pruebas InnoDB concurrentes exclusivamente con datos QA. Seguridad de hosting MySQL 5.6.51 requiere revisión previa a producción.

**Recordatorio de continuidad:** el hilo ya es extenso. Antes de implementar PHP/DDL o empezar CP3, hacer transición a una conversación nueva usando este roadmap del PR #3 y el estado exacto de CP2, sin solicitar repetición de decisiones cerradas.

## 22. CP2-A ejecutado: PHP 5.6.34 y drivers MySQL presentes (16/11/2026)

**Evidencia primaria:** el usuario visitó un script temporal de diagnóstico bajo el dominio HTTPS y obtuvo exactamente:

```text
IDESI_PHP_OK
PHP_VERSION=5.6.34
MYSQLI=SI
PDO_MYSQL=SI
```

**CP2-A: PASS.** PHP se ejecuta en el hosting Network Solutions y tiene tanto `mysqli` como `PDO_MySQL`. Esto **NO demuestra aún** que la extensión tenga una conexión configurada, que la cuenta de servicio exista, que PDO acepte las credenciales o que el endpoint sea seguro bajo concurrencia. La fase **CP2-B (PHP→MySQL `SELECT 1`)** sigue pendiente.

**Acción inmediata:** eliminar el archivo temporal de diagnóstico `test_php_idesi.php` del directorio público. No registrar datos internos de hosting, contraseñas, cookies ni DSN en el repositorio.

**Riesgo de seguridad:** PHP 5.6.34 y MySQL 5.6.51 están descontinuados y sin parches normales. Aceptable únicamente como ensayo controlado de conectividad sin credenciales privilegiadas, sin reserva fiscal real y sin tablas/correlativos de producción; **NO aprobar despliegue fiscal público** sobre este stack sin actualización o mitigación de infraestructura acordada. El portal ASP.NET de licenciamiento y los scripts PHP existentes quedan sin cambios.

**Siguiente paso CP2-B:** identificar cómo el alojamiento obtiene actualmente las credenciales MySQL (solo nombre/ubicación del archivo de configuración, nunca su contenido ni secretos), realizar diagnóstico temporal autenticado/privado con usuario solo lectura y `SELECT 1`. Registrar tiempo, versión de PHP, resultado PASS/FAIL y eliminar endpoint temporal.

**Continuidad:** se recomienda abrir conversación nueva inmediatamente después de CP2-B, o antes de diseñar/implantar tablas/API PHP. Leer este archivo y no repetir CP1 ni CP2-A. La prueba de ejecución PHP ya está efectuada.

## 23. CP2-B — prueba preparada (16/11/2026)

**Estado: PENDIENTE DE EJECUCIÓN.** La evidencia de CP2-A y la verificación previa de InnoDB se conservan. Falta ejecutar PHP contra MySQL dentro del mismo alojamiento y registrar el resultado observado.

- Ejecutar el diagnóstico desde PHP CLI si está disponible dentro del alojamiento. Si el plan solo admite ejecución web, utilizar una ruta temporal autenticada en QA, según la sección 18.
- Usar una cuenta MySQL de QA de solo lectura y mantener la configuración de conexión fuera del directorio público y de Git. Consultas de la prueba: `SELECT 1 AS OK` y `SELECT VERSION()`.
- Registrar fecha y hora, versión de PHP, latencia de conexión y total, y resultado PASS/FAIL. En la evidencia incluir únicamente la salida reducida, sin datos de conexión ni detalles de excepciones. Retirar el diagnóstico temporal al terminar.
- La prueba de bloqueo concurrente sobre filas InnoDB de QA sigue pendiente. El diseño de CP3 permanece sin implementar.

**Actualización del 16/11/2026:** el operador confirma que no dispone de consola en el hosting. Se preparó una variante web temporal para QA, accesible por HTTPS y autenticada mediante clave temporal enviada por POST. La configuración reside fuera de la raíz pública y la consulta requiere una cuenta de QA de solo lectura. Falta desplegar temporalmente el diagnóstico en QA y obtener el resultado desde PHP. El HTTP 404 observado al abrir el nombre del script de consola no constituye evidencia de conexión a MySQL.

**Primera ejecución web (16/11/2026):** el operador reportó `CP2-B FAIL PHP=5.6.34 TOTAL_MS=0`. El diagnóstico pasó la comprobación de la clave temporal y no registró una conexión PDO abierta. El tiempo está redondeado a milisegundos. La salida no distingue entre configuración local incompleta y fallo al abrir la conexión. CP2-B continúa pendiente de una ejecución satisfactoria.

**Seguimiento del 16/11/2026:** el operador confirmó la creación de una base y un usuario de QA en Network Solutions. El siguiente intento devolvió `CP2-B FAIL PHP=5.6.34 TOTAL_MS=0`, sin indicador de etapa ni confirmación de conexión. Falta ejecutar la variante con etapa de fallo y verificar el acceso del usuario de QA desde PHP. CP2-B sigue pendiente.

**Diagnóstico por etapa (16/11/2026):** la variante web devolvió `CP2-B FAIL PHP=5.6.34 TOTAL_MS=0 ETAPA=CONFIG`, según captura del operador. El INI se pudo leer y la clave temporal fue aceptada. La validación de los parámetros MySQL falló antes de abrir PDO. CP2-B queda pendiente de corregir la configuración privada y repetir la prueba.

**Reintento de conexión (16/11/2026):** el operador reportó `CP2-B FAIL PHP=5.6.34 TOTAL_MS=5004 ETAPA=PDO`. La configuración pasó la validación local y PHP intentó abrir la conexión. El tiempo observado es compatible con el límite de cinco segundos del diagnóstico. La causa sigue pendiente de confirmar mediante un código de error filtrado y la revisión del destino MySQL de QA. Ninguna de las consultas de CP2-B se ejecutó en este intento.

**Código de conexión filtrado (16/11/2026):** `CP2-B FAIL PHP=5.6.34 TOTAL_MS=4992 ETAPA=PDO MYSQL_ERR=2002`. PDO no consiguió abrir la conexión dentro del tiempo observado. No se ejecutó SQL. Pendiente confirmar con el proveedor el host, puerto y acceso al MySQL de QA desde el sitio PHP/IIS. CP2-B sigue pendiente.

**Prueba TCP desde PHP/IIS (16/11/2026):** `CP2-B TCP=FAIL ERRNO=10060 TIEMPO_MS=4992`. El destino configurado no completó la conexión TCP dentro del tiempo de prueba. La comprobación no utilizó la contraseña MySQL ni ejecutó consultas. Falta verificar el destino publicado para la base de QA y la ruta desde el sitio PHP. CP2-B sigue pendiente.

**Alternativa C# (16/11/2026):** con el destino de QA y el puerto 3306, el operador reportó `CP2-B TCP=FAIL ERRNO=10060 TIEMPO_MS=5044` desde PHP. El propietario indicó avanzar con C#. Siguiente verificación: `SELECT 1` desde una aplicación ASP.NET de QA independiente, con `MySql.Data` y la cuenta de solo lectura de QA. Pendiente de ejecutar. Si se confirma la conectividad, revisar el cambio de tecnología de la API conservando el contrato, el modelo de lotes y las decisiones del modo LOCAL. El portal de licencias permanece independiente.

**Revisión del portal de licencias (16/11/2026):** la copia local de `IdesiLicensing_V1` confirma ASP.NET Framework 4.0, `MySql.Data` 6.9.12.0 en `bin` y apertura directa mediante `MySqlConnection.Open()` con la entrada `LicenseDb` de `web.config`. La configuración local de servidor usa el puerto 3306 y apunta a un clúster distinto del mostrado en el perfil QA. Falta verificar que la configuración desplegada coincide y comparar, desde el diagnóstico actual, solo la conectividad TCP de ambos destinos. No se modificó el portal ni se transfirieron credenciales. CP2-B sigue pendiente.

**Contraprueba en phpMyAdmin (16/11/2026):** el operador seleccionó la base de QA y obtuvo `QA_OK=1 PUERTO=3306`. Esto confirma que la sesión del panel pudo ejecutar una consulta de lectura. Queda por confirmar el destino que muestra phpMyAdmin y si la sesión usó la cuenta de QA. PHP/IIS sigue sin completar la conexión TCP al destino probado. CP2-B sigue pendiente.

**CP2-B PASS (16/11/2026):** el operador configuró el destino indicado en el campo Servidor de phpMyAdmin para QA, conservando el puerto 3306. El diagnóstico temporal, ejecutado por HTTPS desde PHP/IIS, devolvió:

```text
CP2-B TCP=OK TIEMPO_MS=25
CP2-B PASS PHP=5.6.34 TOTAL_MS=90 CONEXION_MS=54
```

La variante PDO devuelve PASS después de comprobar `SELECT 1 AS OK` y obtener un resultado de `SELECT VERSION()`. Los tiempos son observaciones de esta ejecución. El destino anterior agotó el tiempo desde PHP/IIS; el nuevo destino permitió la conexión. No se ejecutaron escrituras ni se usó el portal de licencias para la prueba. No se publican identificadores de conexión ni credenciales.

**Seguimiento:** retirar el diagnóstico y el INI temporales, con retirada pendiente de confirmación. El siguiente subcheckpoint de CP2 es verificar bloqueo y rollback con dos sesiones sobre datos sintéticos en InnoDB de QA. CP3 continúa sin implementar. La prueba C# queda sin ejecutar; PHP → MySQL ya está verificado en QA.

## 24. CP2 — bloqueo y rollback concurrentes en InnoDB (17/11/2026)

**PASS.** En phpMyAdmin, dos sesiones de la base QA operaron sobre una sola fila sintética InnoDB (`id=1`, valor inicial `0`). La sesión A ejecutó `UPDATE` a `1` dentro de una transacción, sostuvo el bloqueo durante la pausa programada de 15 segundos y ejecutó `ROLLBACK`. La sesión B solicitó `SELECT ... FOR UPDATE` sobre la misma fila y reportó `espera_ms=13458`. A reportó `valor_dentro_de_a=1`. Una consulta posterior independiente devolvió `valor_final=0`. No se registró el valor de la lectura de B; la reversión se verificó con la lectura posterior.

CP2-A y CP2-B ya estaban aprobados. Este ensayo completa la evidencia de bloqueo transaccional en QA. La concurrencia e idempotencia de reservas fiscales corresponden a CP3/CP4/CP7 y siguen pendientes de implementación y pruebas. Retirada de la tabla sintética y del diagnóstico web temporal pendiente de confirmación.

## 25. CP3 — esquema y alta de lotes preparados para QA (17/11/2026)

**Estado: preparado en la rama del PR #3; pendiente de instalación y prueba en MySQL 5.6.** DDL y rutina en [CP3-SECUENCIAS-ECF-MYSQL56-QA.sql](./CP3-SECUENCIAS-ECF-MYSQL56-QA.sql). Los índices de reservas quedan preparados para CP4. Todavía no hay API, importación de lotes con saldo previo, reserva ni política implementada de excepciones de vencimiento.

La rutina de alta abre su propia transacción, bloquea la fila existente de control y rechaza cualquier intersección inclusiva del ámbito, incluso con lotes delegados, inactivos o vencidos. Las altas y futuras modificaciones de rangos deben compartir el bloqueo de esa fila; limitar las escrituras directas sobre lotes. El cursor de un lote nuevo inicia en `desde - 1`. El procedimiento no se llama dentro de otra transacción.

### Primera ejecución de QA

1. Seleccionar explícitamente la base QA en phpMyAdmin e importar **una sola vez** el archivo SQL como un bloque, con una cuenta de instalación de QA que pueda crear tablas y rutinas. El DDL de MySQL 5.6 hace commits implícitos. Si hay error durante la importación, registrar el código y la sentencia afectada antes de reintentar.
2. Con la misma base seleccionada, crear estos datos sintéticos una sola vez:

~~~sql
INSERT INTO ecf_control_secuencia (rnc_emisor, ambiente, tipo_cf)
VALUES ('000000000', 'TEST', 'E31');
SET @control = LAST_INSERT_ID();

CALL ecf_alta_lote(@control, 100, 199, CURDATE() + INTERVAL 10 DAY, 'CENTRAL', NULL);
CALL ecf_alta_lote(@control, 200, 299, CURDATE() + INTERVAL 2 DAY, 'CENTRAL', NULL);
CALL ecf_alta_lote(@control, 300, 399, CURDATE() + INTERVAL 1 DAY, 'DELEGADO', 'QA01');
CALL ecf_alta_lote(@control, 400, 499, CURDATE() - INTERVAL 1 DAY, 'CENTRAL', NULL);
CALL ecf_alta_lote(@control, 500, 599, NULL, 'CENTRAL', NULL);
~~~

3. Ejecutar la siguiente llamada por separado. Debe devolver `RANGO_SOLAPADO` porque el límite `399` pertenece al lote delegado. Este rechazo es el resultado esperado.

~~~sql
SET @control = (
    SELECT id FROM ecf_control_secuencia
    WHERE rnc_emisor = '000000000' AND ambiente = 'TEST' AND tipo_cf = 'E31'
);
CALL ecf_alta_lote(@control, 399, 399, CURDATE() + INTERVAL 1 DAY, 'CENTRAL', NULL);
~~~

4. Verificar que siguen existiendo cinco lotes y que el primero elegible es `200–299`, con cursor `199`. Esta consulta de QA excluye vencimiento nulo hasta que se documenten excepciones por tipo y usa la fecha actual solo para los datos sintéticos.

~~~sql
SET @control = (
    SELECT id FROM ecf_control_secuencia
    WHERE rnc_emisor = '000000000' AND ambiente = 'TEST' AND tipo_cf = 'E31'
);
SELECT COUNT(*) AS lotes FROM ecf_lotes_secuencia WHERE control_id = @control;
SELECT desde, hasta, ultimo_asignado
FROM ecf_lotes_secuencia
WHERE control_id = @control AND modalidad = 'CENTRAL' AND activo = 1
  AND ultimo_asignado < hasta AND fecha_vence >= CURDATE()
ORDER BY fecha_vence, id
LIMIT 1;
~~~

**Cierre de esta prueba:** código del rechazo, total de lotes y fila prioritaria observados. La validación concurrente de altas y las restricciones de unicidad de reservas se verifican antes de cerrar CP3.

**Ejecución parcial en QA (17/11/2026):** el operador verificó cinco lotes sintéticos en el ámbito de prueba mediante consulta de inventario. Los cursores observados fueron `99`, `199`, `299`, `399` y `499`; hay dos lotes centrales vigentes, un lote delegado, un lote vencido y un lote sin fecha. El reintento de alta `100–199` devolvió `1644 RANGO_SOLAPADO`. También se observaron `1062` al repetir la fila de control y `1451` al intentar eliminarla mientras tenía lotes asociados. Quedan pendientes la prueba explícita del límite delegado `399`, la consulta de prioridad y las verificaciones concurrentes y de unicidad de reserva.

**Validación de límite delegado y prioridad (17/11/2026): PASS.** El alta CENTRAL `399–399` devolvió `1644 RANGO_SOLAPADO` en `0.063 s`, al coincidir con el final del lote DELEGADO `300–399`. Con fecha de corte fija `2026-11-17`, la consulta de elegibilidad devolvió `desde=200`, `hasta=299`, `ultimo_asignado=199`, `fecha_vence=2026-11-19`. Quedan pendientes la serialización de altas concurrentes y las restricciones de unicidad de reservas. CP3 sigue en progreso.

**Ensayo de alta concurrente (17/11/2026, evidencia parcial):** phpMyAdmin devolvió `1644 RANGO_SOLAPADO` para el alta sintética `650–749` frente al rango `600–699`. La salida aportada no incluye duración ni evidencia de que la llamada estuviera en curso antes de liberarse el bloqueo. Se acredita el rechazo del cruce; quedan pendientes la observación de la espera en el alta y las pruebas de unicidad de reservas.

**Bloqueo del alta de lotes: PASS.** En un ensayo de QA, la sesión A bloqueó con `FOR UPDATE` la fila del ámbito sintético y mantuvo la transacción abierta durante `20.063 s` antes de `ROLLBACK`. La sesión B, con `innodb_lock_wait_timeout=3`, devolvió `1205 Lock wait timeout exceeded` al llamar `ecf_alta_lote`. Se acredita que el alta espera el bloqueo de control. En la ejecución sin bloqueo ya se observó `1644 RANGO_SOLAPADO` sobre el mismo intento. Falta verificar la unicidad de reservas antes de cerrar CP3.

## 26. CP3 — cierre de validación del esquema QA (17/11/2026)

**CP3 PASS.** El operador aportó errores `1062` independientes para los índices `uq_ecf_reserva_solicitud`, `uq_ecf_reserva_correlativo`, `uq_ecf_reserva_encf` y `uq_ecf_reserva_documento`. Cada caso intentó insertar dos filas sintéticas en una única sentencia InnoDB. Los tres últimos errores correspondieron a correlativo, e-NCF y documento/generación, con tiempos observados de `0.094 s`, `0.063 s` y `0.094 s`, respectivamente.

Junto con los ensayos registrados en la sección 25, se verificaron instalación del esquema en MySQL 5.6 de QA, cursor inicial por lote, rechazo de intersecciones incluyendo límite delegado, selección por vencimiento y espera de la rutina de alta sobre el bloqueo del ámbito. El operador confirmó `reservas_sinteticas=0` en la consulta de comprobación final solicitada tras `ROLLBACK`. Las pruebas de unicidad no dejaron las reservas sintéticas de esos dos identificadores persistidas.

**Siguiente CP4:** implementar y probar reserva/consulta idempotente desde PHP con la misma fila de control, validación del contexto del request, asignación y reserva en una sola transacción, y respuesta recuperable tras timeout. La unicidad SQL verificada no acredita todavía el comportamiento idempotente de una API. Las reglas de fecha fiscal y vencimientos excepcionales por tipo siguen requiriendo validación antes del piloto.

## 27. CP4 — reserva idempotente QA implementada (17/11/2026)

**EN PROGRESO.** Servicio en `qa/pointsalesoft-secuencias/ecf-cp4-qa.php`, preparado para PHP 5.6 y el esquema CP3. Pendiente de ejecutar en el hosting. El ámbito de este ensayo es fijo: emisor sintético de CP3, TEST/E31, QA01 y generación 1.

Implementa POST autenticado, consultas parametrizadas, bloqueo del control, comprobación de contexto, recuperación sin incremento y reserva con cursor e INSERT dentro de una transacción. Otro request para el mismo documento es rechazado. BIGINT se calcula en SQL y se devuelve como string. Un fallo ambiguo indica recuperar con el mismo ID.

**Pendientes para cerrar CP4:** ensayos reales, concurrencia de reservas, recuperación de timeout, autorización multitenant y vencimiento inmutable en la respuesta. El vencimiento inclusivo y la fecha America/Santo_Domingo son decisiones de QA sujetas a validación fiscal antes del piloto. Lotes sin fecha quedan excluidos.

**Instalación:** PHP directamente en `/www/ecf-cp4-qa.php`, configuración privada en `/database/ecf-cp4-qa.ini` con las claves `dsn`, `user`, `password`, `token_sha256` ya utilizadas en CP2-B. Para este ensayo, la cuenta QA requiere SELECT en las tres tablas, UPDATE en lotes e INSERT en reservas. Usar una cuenta QA con esos permisos; conservar la cuenta de CP2-B como solo lectura.

**Ensayo por navegador HTTPS:** con la clave temporal original, request `10000000-0000-4000-8000-000000000001` y documento `CP4-QA-001`, pulsar Reservar. Repetir con los mismos valores debe devolver MISMA_RESERVA y el mismo número. Cambiar el documento conservando el request debe devolver CONFLICTO_SOLICITUD. Usar request terminado en `0002` con el documento original debe devolver DOCUMENTO_YA_RESERVADO. La acción Consultar con los valores originales recupera la reserva sin incremento. Las reservas sintéticas de este ensayo se confirman en QA. Registrar respuestas antes de declarar PASS.

**Primer ensayo PHP de idempotencia en QA: PASS.** El operador recibió `ASIGNADO` para el request sintético terminado en `0001`, documento `CP4-QA-001`, reserva `16`, lote `2`, correlativo `200`, e-NCF `E310000000200`. Al repetir los mismos datos recibió `MISMA_RESERVA` con exactamente esos mismos identificadores y número. Pendientes los ensayos de conflicto, consulta, verificación del cursor, concurrencia y recuperación de timeout. CP4 sigue en progreso.

**Conflictos de identidad de reserva en QA: PASS.** El operador obtuvo `CONFLICTO_SOLICITUD` al reservar con el request original y documento `CP4-QA-ALTERADO`, y `DOCUMENTO_YA_RESERVADO` al usar un request distinto para `CP4-QA-001`. Se recibió asimismo otra respuesta `MISMA_RESERVA` con reserva `16`, lote `2` y correlativo `200`; no se identificó expresamente el botón usado en esa respuesta, por lo que la acción Consultar queda pendiente de confirmación. Falta comprobar el cursor tras los rechazos y ejecutar concurrencia y recuperación de timeout. CP4 sigue abierto.

**Cursor e identidad tras conflictos: PASS.** El operador confirmó `ultimo_asignado=200` en el lote QA `2` y `reservas_documento=1` para el documento de prueba. Los intentos rechazados conservaron el cursor observado. Siguiente ensayo: dos procesos cliente envían el mismo request nuevo para verificar una única reserva bajo peticiones concurrentes; ejecución pendiente.

**Dos procesos cliente con el mismo request en QA: PASS de respuestas idempotentes.** El operador ejecutó dos trabajos PowerShell sincronizados para el request sintético terminado en `0003`, documento `CP4-QA-CONCURRENTE-001`. Las respuestas fueron `ASIGNADO` y `MISMA_RESERVA`, ambas con reserva `17`, lote `2`, correlativo `201` y e-NCF `E310000000201`. Pendiente comprobar por SQL el cursor `201` y una única fila para ese request. La superposición de transacciones en el servidor no se midió en este ensayo. La recuperación después de un timeout confirmado posterior a COMMIT sigue pendiente.

**Verificación SQL de concurrencia: PASS.** El operador confirmó cursor `201` y una sola reserva para el request terminado en `0003`.

**Ensayo de respuesta perdida preparado, pendiente de ejecución:** la variante QA incorpora una pausa de ocho segundos inmediatamente después del COMMIT de una reserva nueva. Solo se activa con `qa_post_commit_delay="1"` en el INI privado y `qa_delay=1` en la petición autenticada. El cliente usará timeout de dos segundos con un request nuevo terminado en `0004`; después consultará ese mismo request y lo repetirá. Esperado: MISMA_RESERVA, mismo número, una sola fila y un único incremento. La pausa no se aplica a consultas ni recuperaciones. Desactivar la opción privada al terminar.

**Recuperación tras fallo del primer intento de respuesta en QA: PASS de recuperación.** Con la pausa post-COMMIT preparada y timeout cliente de dos segundos, el operador reportó `PRIMER_INTENTO=WebException`. La consulta y el reintento del mismo request terminado en `0004` devolvieron ambos `MISMA_RESERVA`, reserva `18`, lote `2`, correlativo `202`, e-NCF `E310000000202`. El tipo WebException aislado no identifica la causa de transporte; el resultado acredita que una reserva confirmada fue recuperada tras el fallo observado por el cliente. Pendiente conteo SQL de una sola fila y cursor `202`, y confirmación de desactivar la pausa QA. CP4 sigue abierto por autorización multitenant, vencimiento inmutable en respuesta y validaciones restantes.

## 28. CP4 — autorización por clave y vencimiento persistido (17/11/2026)

El operador confirmó el conteo de una fila y cursor 202 tras la recuperación del request terminado en 0004. La desactivación de la pausa sigue pendiente de confirmación explícita.

**Implementación preparada, pendiente de ejecución:** el PHP actualizado lee secciones `cliente_*` del INI privado. Cada hash autoriza un emisor, ambiente TEST, sucursal y tipo. Se rechazan identidades enviadas que difieran del ámbito autorizado y hashes duplicados entre secciones. El despliegue de esta variante sigue limitado a QA. Generación fija 1.

La migración `qa/pointsalesoft-secuencias/CP4-VENCIMIENTO-QA.sql` agrega la fecha original en reservas y reconstruye únicamente las tres reservas sintéticas ya verificadas, usando sus lotes actuales de QA. El trigger propuesto fue rechazado por el hosting con error 1419 y se retiró de la migración. El servicio conserva la fecha sin actualizarla. La protección de escritura directa requiere verificar una cuenta API sin UPDATE/DELETE sobre reservas, considerando permisos heredados. El PHP copia fecha del lote dentro de la transacción y devuelve `fecha_vence` desde la reserva tanto en asignación como recuperación. La consulta de reservas usa esa fecha aunque después cambie el lote.

**Orden de instalación:** ejecutar SQL una vez en QA; adaptar el INI según `ecf-cp4-qa.ini.example`, moviendo el hash a la sección `[cliente_qa01]` y conservando los datos privados de conexión; reemplazar el PHP. Se esperan tres fechas 2026-11-19 en las reservas sintéticas originales. Recuperar request terminado en 0004 con documento CP4-QA-TIMEOUT-001 debe conservar reserva 18 y devolver fecha_vence 2026-11-19.

Pendientes las pruebas de aislamiento entre claves/sucursales, rechazo de identidad alterada, inmutabilidad y regresión tras esta actualización. CP4 sigue abierto.

**Ejecución parcial de migración de vencimiento:** el operador confirmó columna agregada y tres filas sintéticas actualizadas, sin advertencias. CREATE TRIGGER falló con `1419`, por binary logging y ausencia de SUPER. Se corrigió la migración retirando el trigger. No repetir ALTER ni backfill ya ejecutados. Continuar con configuración y PHP actualizado y consultar la reserva existente. La inmutabilidad ante escritura SQL directa no está acreditada; pendiente verificar privilegios de cuenta API. No se requiere alterar variables globales ni solicitar SUPER para seguir con el servicio.

**Reintento tras actualización:** el operador obtuvo `SOLICITUD_INVALIDA`. No se acredita aún la recuperación con fecha. Se añadió un indicador `campo` para identificar errores de validación sin exponer valores. La validación sigue siendo estricta; no se modifica la identidad de solicitudes por normalización automática.

**Recuperación con vencimiento persistido: PASS.** Tras adaptar el INI a la sección `cliente_qa01`, el operador obtuvo `MISMA_RESERVA` para el request terminado en `0004`, reserva `18`, lote `2`, correlativo `202`, e-NCF `E310000000202` y `fecha_vence=2026-11-19`. La consulta del servicio recuperó la fecha almacenada en la reserva. Pendientes aislamiento entre credenciales, rechazo de ámbito alterado y verificación de permisos efectivos sobre reservas. El trigger sigue sin instalar por la restricción 1419.

**Vinculación de reserva a sucursal: PASS.** Al cambiar temporalmente el ámbito de la credencial a QA02, la consulta del request de QA01 devolvió `CONFLICTO_SOLICITUD`. Restaurado QA01, devolvió `MISMA_RESERVA`, reserva `18`, lote `2`, correlativo `202`, e-NCF `E310000000202`, fecha `2026-11-19`. Esto acredita la comparación de sucursal con la identidad persistida. La prueba con dos credenciales distintas simultáneamente configuradas y el rechazo de identidades explícitas alteradas siguen pendientes. Falta verificar privilegios efectivos de la cuenta API sobre reservas. CP4 continúa abierto.

**Privilegios de cuenta API: protección pendiente.** El operador ejecutó `UPDATE ecf_reservas_secuencia SET fecha_vence_reserva=fecha_vence_reserva WHERE 1=0` y la sentencia terminó sin error ni filas modificadas. En la conexión usada, UPDATE sobre reservas está permitido. Falta confirmar/restringir la cuenta efectiva del INI. Preparar una cuenta QA dedicada con SELECT en control/lotes/reservas, INSERT en reservas y UPDATE únicamente de ultimo_asignado en lotes; revisar permisos heredados antes de acreditar protección del vencimiento. La cuenta administrativa conserva su función de instalación.

**Aislamiento con dos credenciales simultáneas: PASS.** Con las secciones QA01 y QA02 configuradas, la clave QA02 recibió `CONFLICTO_SOLICITUD` al consultar el request de QA01 terminado en `0004`. QA02 reservó el request terminado en `0005` para `CP4-QA02-001`: reserva `19`, lote `2`, correlativo `203`, e-NCF `E310000000203`, fecha `2026-11-19`. La consulta con QA02 devolvió esa misma reserva. Tras aclarar qué clave correspondía al ensayo cruzado, el operador repitió con la clave original QA01 y obtuvo `CONFLICTO_SOLICITUD` para la reserva QA02. La primera salida de ese ensayo cruzado no acreditaba la identidad de la clave usada; la repetición explícita resuelve la ambigüedad.

**Restricción de permisos confirmada por el operador:** CREATE USER fue rechazado con `1227`. El panel observado solo permite editar el usuario asociado y la consulta de privilegios reportó USAGE con IS_GRANTABLE=NO. La protección contra escritura SQL directa del vencimiento continúa pendiente. La cuenta usada para QA había podido ejecutar un UPDATE sin filas sobre reservas. No se ha cerrado CP4 ni autorizado producción.

## 29. CP5/CP6 — inspección de la copia local y base Delphi compilada (18/11/2026)

La copia indicada por el propietario contiene las fuentes en `PuntoVenta/Fuentes`. HEAD local coincide con el árbol auditado de CP1, commit `8c42ea68c6042723bc4b57964926c6e3b06adc1f`, pero hay cambios locales previos en múltiples fuentes y formularios, incluida la ruta de ventas. La inspección se realizó sobre esos archivos actuales.

**Hallazgo para la integración:** en UProcVentaRapida.pas, el cierre contado establece Params[36] (tipo fiscal) en NULL cuando no hay serie NCF, mientras ProcVenta de crédito conserva TotalesTipoNCFIFiscal. ProcVentaConNCF exige ncfGenerado y registra NCF_ASIGNADOS antes de continuar. Los callers y las transacciones de venta tienen varios puntos de commit. La integración debe preservar explícitamente el tipo remoto pendiente y vincular la identidad estable al documento comercial a través de esos puntos.

**Base preparada en** `qa/pointsalesoft-secuencias/delphi/`:
- UEcfSecuenciaRemota.pas: WinHTTP COM, TLS 1.2, redirecciones deshabilitadas, ámbito TEST explícito y validación de la respuesta. Transporta identificadores y correlativos como strings y comprueba correspondencia tipo/correlativo/e-NCF. Ante error conserva request y devuelve NO_DISPONIBLE; no realiza un segundo POST.
- UEcfSecuenciaCola.pas: identidad durable de solicitud por empresa/ambiente/sucursal/documento, tipo solicitado, guardado idempotente de reserva y vínculo con venta. Usa transacciones IBX propias que confirman exclusivamente sus objetos auxiliares.
- CP5-COLA-FB25.sql: tabla aditiva opt-in, pendiente de ejecutar en Firebird QA.

**Verificación ejecutada:** DCC32 Delphi 7 versión 15.0 compiló los dos módulos conjuntamente: 383 líneas, salida satisfactoria. Todavía no se ejecutaron contra Firebird ni HTTPS desde Delphi. El script SQL no se ejecutó. Integración de los módulos en las rutas normales de contado, crédito, notas e impresión pendiente. CP5/CP6 siguen abiertos. Los tres archivos se copiaron a PuntoVenta/Fuentes con la autorización de escritura correspondiente. Se verificó igualdad byte a byte con las copias compiladas y el SQL preparado.

## 30. CP5/CP6 — factura pendiente en contado y crédito, primer checkpoint (18/11/2026)

**Implementado en la copia local y pendiente de QA mediante las pantallas normales.** El patch `qa/pointsalesoft-secuencias/delphi/CP5-VENTAS-PENDIENTES.patch` documenta los cambios sobre la versión local del propietario. Se instalaron UEcfSecuenciaVenta.pas, la actualización de UEcfSecuenciaCola.pas y UProcVentaRapida.pas, con respaldo previo de los archivos existentes y comprobación de hashes antes de sobrescribir.

- Selector opt-in por empresa y sucursal en repconf_cr.ini junto al ejecutable: sección `ECF_SECUENCIA_<CIA>_<SUCURSAL>`, clave Origen con valores LOCAL/REMOTO; ausencia significa LOCAL. Este checkpoint de QA exige Ambiente=TEST al seleccionar REMOTO.
- En los cierres adaptados, REMOTO prepara una solicitud local durable antes del guardado y omite el generador LOCAL. La factura queda sin e-NCF, con el tipo solicitado en la cola y en el parámetro de master correspondiente.
- El vínculo NUMERO_TRN de la cola se escribe dentro de la misma transacción que inserta la cabecera. Un rollback revierte ese vínculo conservando la identidad durable preparada.
- Este checkpoint solo implementa el camino de factura pendiente. La invocación HTTPS durante el cierre, el registro del NCF remoto en NCF_ASIGNADOS, conciliación operativa, notas y propagación del vencimiento a XML siguen pendientes. Por tanto CP5/CP6 continúan en progreso y REMOTO no está listo para activación productiva.

**Inspección de Firebird QA mediante transacción de solo lectura:** tabla auxiliar instalada. PROC_INS_VENTAS_MAST conserva el parámetro TipoNCFIFiscal independientemente de la serie NCF; PROC_VALIDA_VENTA_PERSISTIDA no exige NCF para validar importes/pagos. Esto respalda la viabilidad estructural; no acredita aún el recorrido completo de la interfaz y la impresión.

**Pruebas ejecutadas con CP5ColaQA.dpr, compilado con Delphi 7:** PASS en configuración ausente LOCAL, selector REMOTO explícito, empresa distinta LOCAL, identidad durable estable, tipo solicitado inmutable, rollback del vínculo, guardado repetido y rechazo de sustitución de reserva. La prueba creó únicamente una solicitud sintética en la tabla auxiliar y la eliminó al terminar. Una lectura independiente confirmó cero filas con el prefijo sintético QA-CP5-.

**Compilación:** módulos y ejecutable de prueba de cola compilan. La construcción del ejecutable completo requirió reconstruir las rutas de bibliotecas y recursos del entorno. Se encontraron recursos homónimos de dos componentes de códigos de barras; se preparó una resolución únicamente en la carpeta de build de QA. La compilación/enlace completo aún debe confirmarse y no equivale a QA funcional de ventas.

**Cierre del intento de compilación completa:** el enlace inicialmente reportó recursos faltantes y una colisión de BARCODE.D32 entre componentes. Tras preparar rutas y copias de recursos diferenciadas solo en el directorio de build de QA, otro intento no completó el enlace durante varios minutos y se detuvo el proceso DCC32 iniciado para ese ensayo. No se acredita un build completo ni se entrega el EXE generado parcialmente. Las ocho verificaciones del ejecutable de cola/selector sí terminaron con CP5_COLA_QA=PASS y limpieza confirmada. La integración de interfaz y su regresión continúan pendientes.

## 31. CP5/CP6 — llamada HTTPS integrada en fuentes (18/11/2026)

**Implementada y pendiente de compilar/probar**, según el orden solicitado por el propietario. Instalación local con respaldo y hashes previos verificados.

El método común PrepararSecuenciaRemotaVenta se usa en contado y crédito. Confirma el request en Firebird antes de HTTPS, valida comprador requerido, recupera primero una reserva local ya persistida y envía como máximo un POST en esta llamada si aún no tiene número. Un fallo de transporte o un resultado ambiguo conserva el mismo request y permite el camino comercial pendiente. Se guarda la reserva antes de registrar su NCF local.

RegistrarNcfSecuenciaVenta bloquea la solicitud y conserva SERIE_NCF_LOCAL. La primera asignación registra NCF_ASIGNADOS mediante su generador de clave interna, sin llamar al contador fiscal LOCAL. Una repetición comprueba identidad, número, tipo, cliente, monto y fecha del registro existente; una discrepancia conserva la reserva para revisión. El vínculo de solicitud y cabecera comercial mantiene la transacción del checkpoint anterior.

**Migración incremental preparada, no ejecutada:** CP5-NCF-LOCAL-FB25.sql agrega SERIE_NCF_LOCAL a la tabla auxiliar e índice por NUMERO_TRN. Debe aplicarse a QA antes de usar REMOTO con esta versión. La comprobación del esquema precede al contacto HTTPS.

**Credenciales:** TokenProtected_E31, TokenProtected_E32, etc., por sección ECF_SECUENCIA_<CIA>_<SUCURSAL> de repconf_cr.ini. Se reutiliza el cifrado DPAPI existente mediante AprovisionarTokenSecuencia; el secreto queda vinculado a la cuenta Windows, sección y tipo. Se agregaron declaraciones públicas de CifrarDPAPI/DescifrarDPAPI sin cambiar su implementación. La credencial del servidor debe autorizar exactamente el RNC de COMPANIA, sucursal y tipo enviados; los identificadores sintéticos de CP4 no sustituyen esa identidad.

**Vencimiento y emisión:** UFacturaTxtBuilder usa la fecha persistida en la reserva cuando la venta está vinculada a ella y comprueba que su e-NCF coincide. Para la variante QA del servicio, el despacho comprueba canal IDESI_API y ambiente TEST antes de emitir una venta con solicitud remota. Las rutas de emisión remota por otros canales y PROD requieren su validación correspondiente. Las reglas fiscales de fecha de emisión y vencimientos excepcionales siguen pendientes de aprobación antes del piloto.

Archivos de cambios revisables en qa/pointsalesoft-secuencias/delphi/https, más UEcfSecuenciaVenta.pas y la migración incremental. Las pruebas aprobadas del checkpoint anterior no se trasladan automáticamente a esta actualización. Pendientes compilación, aprovisionamiento privado del token, venta normal online, venta sin conexión, reintento después de fallo local, impresión y notas/conciliación.

## 32. CP5/CP6 — verificación de integración local y preparación privada (18/11/2026)

**Esquema verificado:** la base Firebird QA ya tiene SERIE_NCF_LOCAL y el índice IX_ECF_SEC_NUMERO_TRN. No se repitió DDL.

**Compilación aprobada de módulos:** Delphi 7 compiló UEcfSecuenciaVenta con sus dependencias (968 líneas) y UFacturaTxtBuilder (1831 líneas, con un hint previo sobre MontoObjetivo). El formulario completo sigue pendiente de compilación con las rutas coherentes del proyecto: los intentos aislados encontraron incompatibilidades de DCU y errores de identificadores en UImpresionVentas. No se acredita un ejecutable completo. La consulta del IDE mediante la herramienta de escritorio falló por timeout incluso tras reintentos y reinicio del helper.

**CP5HttpsLocalQA: PASS.** En Firebird QA se verificaron cinco casos: registro local idempotente de NCF, rechazo de monto cambiado, recuperación de reserva local sin credencial/red, falta de token dejando solicitud pendiente con el mismo ID y ausencia de NCF inventado en esa solicitud. El ensayo creó dos solicitudes y un NCF sintéticos y eliminó sus registros al terminar. Consultas independientes confirmaron cero solicitudes con el prefijo del ensayo y cero filas del e-NCF sintético utilizado. Estas pruebas no acreditan aún el recorrido de venta por la interfaz ni una petición real con la identidad de la empresa.

**Identidad del cliente QA comprobada:** empresa 1 y sucursal 0001. La clave del servidor debe autorizar esa sucursal y el RNC de COMPANIA, no el ámbito sintético anterior QA01/000000000.

**Aprovisionamiento preparado:** qa/pointsalesoft-secuencias/delphi/https/Preparar-CP5-QA.ps1 genera una clave aleatoria nueva, la protege con DPAPI por cuenta Windows/sección/tipo, actualiza el INI del cliente con respaldo y produce en LocalAppData un fragmento privado para el servidor y SQL de lote sintético TEST del emisor. El script conserva el Origen existente o inicia LOCAL si no existe. Debe ejecutarlo la cuenta Windows que utiliza PointSaleSoft para que pueda descifrar el token. La sintaxis PowerShell fue verificada; el aprovisionamiento del operador está pendiente.

El SQL generado utiliza un rango sintético de QA independiente del inventario fiscal real. Antes de probar la emisión, completar configuración privada del servidor, lote TEST, compilación del programa y validación de ambiente. CP5/CP6 continúan abiertos.

**Aprovisionamiento del operador: PASS de generación/protección.** El operador reportó `CP5_DPAPI=OK`, ejecutado bajo la cuenta Windows habitual de PointSaleSoft. Se generaron la configuración cifrada del cliente, el fragmento privado para la credencial de empresa/sucursal 0001/tipo E31 y el SQL de lote sintético TEST. El RNC, el hash y la clave permanecen fuera de la documentación versionada. La comprobación DPAPI del script acredita cifrado/descifrado en PowerShell con esa cuenta; la lectura desde el programa Delphi y la conexión del cliente con este ámbito siguen pendientes. Siguiente paso: agregar el fragmento al INI privado del servidor y ejecutar una vez el SQL generado en MySQL QA.

## 33. Lote TEST del cliente y prueba nativa preparada (18/11/2026)

El operador reportó creación satisfactoria del ámbito TEST/E31 y alta del lote sintético 7000000000–7000000999, con consulta de inventario que devolvió una fila. Al repetir la preparación, la fila de control se reutilizó y el alta fue rechazada con 1644 RANGO_SOLAPADO. La repetición no requiere otra carga ni reinicializar el cursor. Se omite el RNC de esta evidencia versionada.

**Prueba nativa preparada y compilada, pendiente de ejecución por el operador:** CP5ConexionDelphiQA.dpr utiliza los mismos módulos Delphi/IBX/WinHTTP/DPAPI de la integración, lee empresa 1 y sucursal de COMPANIA en la base QA indicada, confirma una solicitud local estable para el documento sintético QA-DELPHI-HTTPS-E31 y reserva por HTTPS. Después recupera localmente y consulta al servidor con el mismo ID; compara reserva, número y vencimiento. El ensayo se limita al servicio de secuencias y conserva la solicitud sintética para auditoría/reintentos. Consume como máximo una reserva nueva para ese documento de prueba si aún no existe.

DCC32 Delphi 7 compiló el ejecutable de prueba (1079 líneas, salida 0). Su ejecución requiere la misma cuenta Windows que aprovisionó TokenProtected_E31 y el fragmento correspondiente instalado en el INI privado del servidor. Este ensayo permite comprobar la ruta nativa sin esperar al enlace del programa completo; no acredita la venta end-to-end por la interfaz. La compilación completa y las restantes pruebas siguen pendientes.

**Prueba HTTPS nativa ejecutada: PASS.** El operador recibió ASIGNADO y dos respuestas MISMA_RESERVA para el mismo request sintético, todas con reserva 20, lote 7, correlativo 7000000000, e-NCF E317000000000 y vencimiento 2026-12-18. El ejecutable terminó con CP5_HTTPS_DELPHI_QA=PASS. Quedan comprobados DPAPI desde Delphi bajo la cuenta del operador, conexión WinHTTP/HTTPS autenticada con el ámbito de la empresa, persistencia local de reserva, recuperación local, consulta remota del mismo ID y transporte exacto del correlativo superior a 32 bits. La solicitud sintética permanece para auditoría/reintentos. Esta evidencia corresponde al ejecutable de prueba; la compilación del programa completo y la venta por las pantallas normales siguen pendientes. CP5/CP6 continúan abiertos.

## 34. Auditoría E41/E43 y persistencia de gastos (18/11/2026)

**Alcance confirmado:** E41/E43 forman parte del milestone, pero la integración HTTPS probada en CP5 corresponde a ventas. Gastos todavía utiliza las rutinas locales. Se protege esa diferencia: si el ámbito está configurado REMOTO, reserva y reasignación de gastos se detienen sin consumir LOCAL. No declarar E41/E43 remoto implementado.

**Defecto confirmado en QA:** ECF_RESERVA.MENSAJE admite 255 caracteres; la ruta Gastos.txt enviaba hasta 1024. Un rechazo largo podía revertir la persistencia del resultado. Se unificó la persistencia TXT/directa, con límites obtenidos de metadata y detalle en log. INSERT y UPDATE del historial usan el mismo ajuste. La pantalla detiene todo fallo de persistencia antes de evaluar otro consumo, aunque la respuesta indique SECUENCIA_USADA.

**Fuentes locales corregidas con respaldo y hashes:** guardado de datasets de gastos que propaga errores (sin alterar el helper global), botón Guardar que atiende detalle/cabecera, confirmación explícita antes de los dos recorridos de sustitución y bloqueo de vencimiento ambiguo en Gastos.txt. Ya no se elige automáticamente la mayor fecha entre varias series activas. La fecha histórica del lote sigue requiriendo persistencia en la integración remota; no se reconstruyó ni inventó una fecha para documentos anteriores. El caso informado por el operador se leyó sin cambios: conserva el número anterior histórico y el posterior ACEPTADO. No se reenvió.

**Verificación:** 14 comprobaciones PASS del ejecutable Delphi/IBX contra Firebird QA: rechazos largos E41/E43, historial atómico, aceptación no degradada, rechazo de e-NCF diferente, guardado de dataset, fallo de escritura propagado y reserva ausente. Limpieza realizada; consultas independientes confirmaron cero filas sintéticas. Compilación Delphi 7 PASS del ejecutable de prueba y de UEcfGuardarDataset, UEcfReservaGastos y UGastoTxtBuilder. No se acredita aún build del formulario/aplicación completos ni QA por pantalla.

**XML firmado solicitado por el propietario:** en las rutas CLI directa y TXT de gastos, DGII:RetrieveSignedXmlOnAccept ausente/vacío ahora significa descargar. Se respeta desactivación explícita y llamadas con bool explícito. Nueve casos de configuración PASS, sin red ni emisión fiscal. El CLI completo compiló con cero errores (297 advertencias; consulta de vulnerabilidades NuGet no disponible). El ejecutable instalado del operador todavía no se reemplazó y la descarga real del proveedor sigue pendiente. Un fallo de artefactos no debe sustituir el resultado fiscal ni consumir otra secuencia.

Cambios y evidencia revisables en [auditoria/README.md](../../qa/pointsalesoft-secuencias/delphi/auditoria/README.md), con patches Delphi y CLI y pruebas portables sin credenciales. Los PAS originales usan codificación de un byte; preservar su codificación al aplicar cambios. El módulo ASP.NET de licenciamiento permanece independiente.

**Siguiente checkpoint obligatorio:** cola durable de gastos con identidad distinta de ventas, HTTPS E41/E43 por su ámbito/tipo, guardado atómico local y fecha original del lote en XML, sin fallback, sin reasignación automática y conservando gasto/tipo ante fallo. No vincular gastos mediante NUMERO_TRN de ventas. Preparar lotes y credenciales TEST de E41/E43 y completar QA antes de habilitar REMOTO. CP5/CP6 continúan abiertos.

## 35. E41/E43: verificación comparada de --gasto y --gasto-txt (18/11/2026)

**Verificado en QA, sin envío fiscal real:** el builder Delphi generó TXT desde un E41 y un E43 existentes. La extracción normal Firebird y la extracción TXT produjeron un modelo fiscal completo idéntico en ambos casos. Dos pruebas negativas comprobaron bloqueo de vencimiento ambiguo. Se alineó el SQL normal con esta validación; distribuir su columna SeriesActivas junto con el extractor actualizado.

**Hallazgos corregidos durante la comparación:** normalización por texto del cuerpo podía convertir un rechazo que mencionara ACEPTADO en aceptación y perder TrackId; la ruta normal podía reenviar un e-NCF con TrackId previo. Gastos usa ahora opciones estrictas del servicio, sin cambiar los valores predeterminados para los otros callers. Conserva respuesta original, clasifica estados exactos, da prioridad a aceptación comprobada, bloquea intentos previos y falla sin reenviar si la consulta es inconclusa. Comprueba e-NCF en preflight, respuesta y consulta final. JSON sin estado/mal formado o respuesta vacía no equivalen a un rechazo fiscal. Delphi preserva ACEPTADO ante diagnósticos de secuencia usada y conserva NOT_FOUND/NO_CONFIRMADO.

**80 escenarios PASS:** veinte por cada combinación E41/E43 × ruta normal/TXT. Se ejecutaron los procesadores y servicio compilados con transporte HTTP simulado; se comprobaron estado, número de POST, descargas, archivo XML simulado y TrackId. Incluyen rechazo con la palabra ACEPTADO, aceptación con mensaje de secuencia usada, estado previo/final inconcluso, HTTP500/JSON inválido, identidad discrepante, XML no disponible, configuración sin parámetro y desactivación explícita. No se llamó a ASLAN/DGII ni se consumieron secuencias por estos escenarios.

**Persistencia Delphi ampliada: 20 verificaciones PASS**, con limpieza confirmada por consultas independientes (cero filas sintéticas). Las dos fuentes adicionales corregidas se instalaron con respaldo y comprobación de hashes. **Regresión AslanTransportRegression PASS:** cuarenta solicitudes paralelas aisladas y preservación de payload/eventos de fallo, sin red. Las nueve verificaciones de configuración de XML del checkpoint anterior permanecen aprobadas. El CLI compiló al ejecutar esta batería.

Evidencia y cambios en [auditoria/README.md](../../qa/pointsalesoft-secuencias/delphi/auditoria/README.md) y PARIDAD-GASTOS.patch. Son pruebas de código/QA y proveedor simulado: los ejecutables instalados no se reemplazaron, no se acredita aún la interfaz completa ni descarga/firma del XML real del proveedor. La reserva central HTTPS E41/E43 sigue pendiente, sin fallback LOCAL. CP5/CP6 continúan abiertos.

## 36. Ajuste de impresión solicitado: banco/cuenta en crédito Ayaco y Tapicería (18/11/2026)

El propietario solicitó revisar la factura 8.5×11 a crédito y confirmó que el bloque bancario también se utiliza con GlBTapiceria=1. La ruta compartida selecciona UQckFactServ8_5Ayaco. La consulta qryctabcofact lee BANCOS_DET y filtra CIA_KEY y ACTIVAENFCT=1, devolviendo FACT_DESCBANCO, FACT_TITLAR y FACT_DESCNUMCTA.

**Defecto encontrado:** el llenado para Ayaco estaba comentado; la lógica dependía de un cursor global que no se refrescaba en el reporte y de flags que excluyen Ayaco en otros puntos. El DFM contiene textos de diseño que no deben quedar como alternativa cuando no hay filas autorizadas.

**Corrección instalada con respaldo y hashes:** Ayaco o Tapicería utilizan PrepararCuentasBancarias. El bloque se limpia antes de cada impresión y solo carga cuentas para crédito (FORMA_PAGO 7/8), refrescando la consulta con CIA_KEY de la factura. Imprime nombre de banco, titular y cuenta de todas las filas autorizadas, con separación entre cuentas y altura ajustable. No utiliza RecordSize/RecordCount para decidir si existen filas ni depende de GlbShowCtaBanco para ignorar ACTIVAENFCT. Sin filas, campos vacíos o cuentas no marcadas, no imprime textos anteriores. Los demás formatos conservan su ruta. DFM y datos bancarios no modificados; no se reemplazó el ejecutable.

**Siete verificaciones PASS** del helper Delphi/IBX, mediante datos sintéticos CTE y transacción de solo lectura: cuenta marcada, empresa distinta, ausencia de filas limpiando texto anterior, varias cuentas, reimpresión sin duplicados, campos NULL e indicador NULL. No se insertaron cuentas ni se modificó la base. La consulta de inventario de QA encontró una fila sin empresa/indicador; no hay cuenta de QA marcada para impresión. Para validar datos reales, la empresa debe tener ACTIVAENFCT=1 y completar los tres campos de presentación correspondientes.

**Límite de verificación:** helper y ejecutable de prueba compilan con Delphi 7. El intento de compilación del reporte con las dependencias actuales se detuvo en qckRepCertificadoSAM por falta de grimgctrl.dcu; no se acredita compilación completa ni vista previa/impresión real. Esa revisión visual queda pendiente al compilar en el entorno configurado del proyecto.

Patch y prueba revisables en [BANCO-AYACO-TAPICERIA.patch](../../qa/pointsalesoft-secuencias/impresion/BANCO-AYACO-TAPICERIA.patch). La prueba recibe DFM de conexión y base QA como argumentos y no contiene credenciales. Este ajuste de impresión no cambia la gestión de secuencias, envío fiscal ni licenciamiento.
