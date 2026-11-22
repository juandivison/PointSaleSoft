# Auditoría E41/E43 — 18/11/2026

E41 y E43 están incluidos en el alcance del milestone. La integración HTTPS existente cubre ventas; la reserva remota de gastos todavía no está implementada ni aprobada.

## Correcciones instaladas en fuentes PointSaleSoft

- Persistencia compartida por las rutas directa y Gastos.txt. ECF_RESERVA.MENSAJE tiene 255 caracteres en QA; la variante TXT intentaba escribir 1024. Se ajusta a la capacidad real, con detalle completo en el log.
- INSERT y UPDATE del historial usan el mismo criterio de longitud. El guardado de reserva e historial es una sola transacción.
- Un fallo técnico o de persistencia detiene la pantalla antes de intentar consumir otra secuencia, incluso cuando la respuesta fiscal contiene SECUENCIA_USADA.
- Guardado de datasets limitado al formulario de gastos: los errores de escritura/confirmación se propagan. No se modifica GlbSalvarQuery para otros módulos.
- Guardar atiende detalle y cabecera; si la validación del detalle falla, no continúa.
- Toda sustitución por los dos recorridos existentes exige confirmación explícita, con No como opción predeterminada.
- Gastos.txt rechaza múltiples series activas del mismo tipo en lugar de elegir arbitrariamente la mayor fecha. Esto no reconstruye el lote histórico de una reserva.
- Si el ámbito está configurado REMOTO, las rutinas locales de reserva/reasignación de gastos se detienen. No hay fallback ni consumo LOCAL. Falta conectar E41/E43 a la cola y API HTTPS.

El histórico del caso reportado se consultó en modo lectura: el e-NCF anterior permanece histórico y el posterior está ACEPTADO. No se modificó ese documento ni se realizó un envío fiscal.

## XML firmado

El patch CLI cambia las sobrecargas de ProcessAsync de E41/E43, tanto directa como TXT, para leer DGII:RetrieveSignedXmlOnAccept. Ausente o vacío significa true. false/0/no/off deshabilitan; true/1/yes/on habilitan. Valor inválido genera error de configuración. Las llamadas con bool explícito conservan su elección.

La descarga ocurre en la recuperación de artefactos de documentos aceptados. Su fallo conserva el resultado fiscal y se informa como artefacto pendiente. XML_FIRMADO almacena la ruta del archivo, no el contenido XML. La variante C# fue compilada localmente; el CLI instalado en el puesto no se reemplazó.

## Evidencia

- GastosPersistenciaQA: 14 comprobaciones PASS en Firebird QA. Incluye E41/E43, rechazo largo, inserción de historial, actualización, aceptación no degradada, e-NCF distinto rechazado, escritura por dataset, fallo de escritura propagado y reserva ausente.
- Se eliminan las filas sintéticas. Lecturas independientes: cero reservas e historiales del ensayo.
- Compilación Delphi 7 PASS del ejecutable de prueba, UEcfGuardarDataset, UEcfReservaGastos y UGastoTxtBuilder.
- ExpenseArtifactOptionsRegression: 9 casos PASS, sin red ni emisión fiscal.
- IdesiToolECF.csproj: build PASS, 0 errores y 297 advertencias. La consulta de vulnerabilidades NuGet no estuvo disponible; no se declara verificación de vulnerabilidades.
- No se acredita compilación del formulario completo ni del ejecutable principal PointSaleSoft con esta actualización. Pendiente QA por pantalla, XML descargado con el proveedor y nuevas reservas HTTPS E41/E43.

## Archivos y uso

AUDITORIA-GASTOS.patch documenta cambios sobre las fuentes locales del propietario; no aplicar ciegamente sobre otra versión. Las fuentes originales Delphi usan codificación de un byte; el patch se publica como texto UTF-8. Aplicarlo exige conservar la codificación original de cada PAS.

El patch incluye UEcfGuardarDataset.pas y una prueba portable. La prueba recibe archivo DFM de conexión y ruta de Firebird QA como argumentos; no contiene credenciales. TestSupport/UGlobal.pas sustituye únicamente la variable de ruta del ejecutable para evitar enlazar toda la aplicación; las consultas, transacciones y persistencia probadas son reales. Ese shim no debe copiarse a las fuentes de PointSaleSoft. Compilar la prueba en una carpeta aislada con IBX y las bibliotecas Delphi 7.

XML-FIRMADO-DEFAULT.patch contiene los cambios C#, helper y prueba de configuración. Corresponde al CLI y no modifica el módulo ASP.NET de licenciamiento.

## Pendiente de este alcance

Integrar gastos con documento durable distinto de POS, token por E41/E43, idempotencia y recuperación, registro atómico en ECF_RESERVA/NCF_ASIGNADOS_COMPRA/TRANS_OPERACION_MASTER y vencimiento persistido del lote. No utilizar el vínculo NUMERO_TRN de ventas para gastos: ambas tablas tienen espacios de identificadores independientes. Preparar y probar los ámbitos/lotes TEST específicos antes de habilitar REMOTO. No asignar un vencimiento fiscal supuesto ni corregir rechazos consumiendo números automáticamente.

## Segunda verificación: ruta normal y --gasto-txt

La versión final de PARIDAD-GASTOS.patch complementa los patches anteriores. Se aplicó localmente a las fuentes Delphi con respaldo y hashes; los cambios C#/SQL están en la copia de trabajo del CLI y compilaron al ejecutar las pruebas. No se reemplazaron ejecutables instalados.

**PASS:** modelo fiscal completo idéntico entre la extracción normal y el TXT generado por Delphi, para un E41 y un E43 reales de QA. Ambos extractores validaron los documentos. Dos pruebas negativas de SQL verificaron que varias series activas se rechazan antes del envío. El SQL normal y su extractor deben distribuirse juntos por el campo adicional SeriesActivas.

**80 escenarios PASS:** veinte escenarios, por dos tipos y dos rutas. Se ejecutan los procesadores y servicio reales con HttpMessageHandler simulado, sin salida a ASLAN/DGII. Cubren aceptación previa, rechazo previo, NOT_FOUND, estado desconocido/NO ACEPTADO, HTTP500, JSON inválido, rechazo que menciona ACEPTADO, aceptación con mensaje de secuencia usada, XML no disponible, desactivación explícita de XML, e-NCF diferente en preflight/respuesta/consulta final, polling NOT_FOUND o inconcluso, JSON sin estado/mal formado y respuesta vacía. Se comprueban estado, cantidad de POST, descargas, existencia de XML simulado y conservación del TrackId aceptado.

**Fallos adicionales corregidos:** la ruta normal infería ACEPTADO del cuerpo completo; el servicio compartido podía convertir un rechazo que mencionara ACEPTADO en aceptación y descartar TrackId. Gastos ahora usa respuesta original y opciones estrictas, con valores predeterminados de los demás callers conservados. Los TrackId previos bloquean reenvíos y los errores de consulta no se interpretan como ausencia. La respuesta incompleta se conserva como no confirmada/error, nunca como aceptación o rechazo supuesto. Delphi tampoco convierte una aceptación en SECUENCIA_USADA por encontrar esa frase en el diagnóstico y persiste NOT_FOUND/NO_CONFIRMADO.

**20 verificaciones Delphi/IBX PASS:** amplían las 14 anteriores con aceptación dominante, estados inconclusos y su persistencia. Cero filas sintéticas remanentes confirmadas por consultas independientes. Regresión AslanTransportRegression PASS: cuarenta solicitudes paralelas aisladas, eventos de fallo y payload preservados, sin red. Los nueve casos de configuración de XML ya estaban aprobados.

La descarga y el archivo XML de estos escenarios son simulados; no acreditan disponibilidad ni firma del XML real en el proveedor. Falta validación por pantalla con los ejecutables actualizados y proveedor. La integración HTTPS de secuencias para gastos permanece pendiente y protegida contra fallback LOCAL. No se cerró CP5/CP6.
