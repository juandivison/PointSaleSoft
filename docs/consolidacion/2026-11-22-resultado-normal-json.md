# Resultado JSON de la ruta normal y caso Ferrecentro

22/11/2026. La ruta normal PrintFinal del fuente inspeccionado imprime D7T
opcional y un SendInvoiceResultDto JSON de seis campos; no imprime D7.
UUtilecf exigia D7 antes de persistir y producia un aviso aunque el motor
hubiera actualizado sus tablas. No se conoce stdout/version del equipo afectado.

Se mantiene D7 y se admite el DTO JSON completo y estricto. Se rechazan texto
libre, DTO ambiguo/duplicado/truncado, claves duplicadas, tipos incorrectos y
aceptacion con Error. Se admite TrackId vacio para respuestas que no lo incluyen;
PersistirResultadoFiscalVenta conserva un TrackId previo, no inventa uno.
SecuenciaUtilizada no se usa para inferir aceptacion: el motor puede emitir false
en un resultado aceptado. Se validan e-NCF/venta/RNC con la base y el timbre o
la configuracion del ejecutable. Luego se utiliza el procedimiento existente,
su lectura de comprobacion y la proteccion del estado aceptado/TrackId previo.
Si falla la persistencia, el resultado fiscal aceptado sigue siendo exitoso;
el aviso sigue visible y no se realiza un nuevo envio.

Pruebas: 90 comprobaciones de integracion en Firebird aislado y 18 de parser
sin base/red. Compilacion aislada Delphi 7. Normal D7 y JSON, timbre/QR/XML,
fallo de SP, e-NCF/RNC/TrackId ajenos y conservacion de aceptacion comprobados.
Factura.txt y API no se modificaron; no se acredita nueva ejecucion end-to-end
de esas rutas con esta entrega. No se compila ni distribuye el ERP completo.

## Hechos del incidente (informados por el usuario)

Ocurrio en la PC de Ferrecentro, e-NCF E320000000803. ECF_RESERVA y
NCF_ASIGNADOS se actualizaron. La venta no termino ni imprimio; la pantalla
quedo bloqueada y el usuario tuvo que cerrarla por la X. TRN, modalidad de pago,
RNC/base, hash/version del ejecutable, stdout y excepcion final no disponibles.
No se ha accedido a esa PC ni se ha modificado su base.

El aviso no demuestra ausencia de persistencia. En el fuente revisado,
EjecutarECF_y_Mostrar retorna True para aceptado incluso con aviso. El flujo
normal de venta continua a DGII FIN OK y despues a impresion. Por tanto esta
correccion del contrato no se presenta como solucion verificada del bloqueo.
No se altera el cierre de venta ni los cambios locales UProcVentaRapida PAS/DFM.

## Verificacion en el equipo afectado, sin nueva emision

1. Conservar e identificar el ERP y motor exactos (ruta, SHA-256, version), INI
   usado y hora del evento, sin divulgar configuraciones con secretos.
2. Ejecutar solo las SELECT de qa/resultado-normal-json/DIAGNOSTICO-FERRECENTRO.sql
   en la base correcta: obtener TRN/RNC/e-NCF/TrackId/estado y timbre completo.
   Comprobar ECF_RESERVA ya actualizada sin modificarla. No inferir TRN del e-NCF.
3. Revisar el registro <nombreERP.exe>_log.txt junto al ERP, si el diagnostico
   fiscal ya estaba activado. Buscar DGII INICIO, DGII ENVIO ruta normal,
   DGII FIN OK ruta normal, Timbre Delphi y la excepcion posterior. El registro
   solo se genera con GlbEsDebugFiscal activo; no inventar eventos ausentes.
4. Conservar stdout/stderr o artefactos YA EXISTENTES de esa ejecucion. La
   captura del ERP combina ambos canales. No volver a invocar el envio normal.
5. Con identidad/timbre/cierre comercial verificados, utilizar la reimpresion
   existente del documento; no el boton de emitir/reenvio ni una nueva venta.
   Si faltan datos, conciliar primero. No ejecutar esta entrega como reparacion
   automatica de documentos comerciales aceptados.

Pendiente: reproduccion visual del bloqueo, prueba de impresion y cierre en el
puesto. La configuracion local de desarrollo Ferrecentro no acredita lo instalado
en el cliente. Pagos Combinados permanece TODO.
