# Contrato de persistencia e-CF en Firebird

Instrucción expresa del propietario, 21/11/2026: cuando Firebird es la persistencia,
el resultado debe conservar todos los datos necesarios para la operación y los
reportes. Una respuesta fiscal satisfactoria no acredita persistencia local completa.

Para ventas, comprobar:

- La relación VENTAS_MAST.SERIE_NCF_ASIGNADO → NCF_ASIGNADOS identifica la misma
  transacción, compañía y e-NCF que el resultado.
- NCF_ASIGNADOS conserva estado fiscal, TrackId disponible, mensaje y datos que
  mantenga SP_ECF_UPDATE_ESTADO. Después de ejecutar, leer y verificar lo persistido.
- ECF_TIMBRE_LOG contiene e-NCF, código de seguridad, fecha fiscal, monto y URL
  coherentes con la factura. Una fila existente con nulos no completa la operación.
- La impresión lee esos datos persistidos, no valores inventados ni la fecha de
  creación del log como sustituto de la fecha fiscal.
- Las tablas de negocio, asignación, reserva, historial o intercambio que utilice
  cada ruta deben mantener sus relaciones y datos necesarios. No crear filas
  genéricas ni mezclar claves de ventas y gastos para aparentar completitud.

La aceptación DGII y la persistencia local son resultados diferentes. Un fallo de
base de datos posterior a la aceptación se informa como persistencia pendiente:
no se cambia la aceptación a rechazo, no se reasigna el número y no se reemite.
No ocultar excepciones de escritura ni informar éxito local sin lectura de comprobación.
Reintentos deben ser idempotentes y conservar el historial y la transacción de negocio.

La ampliación de esta entrega implementa la comprobación del flujo legacy de
ventas. Sus 65 pruebas no equivalen a certificación de todos los flujos API,
gastos, notas, intercambio o diseños de reporte. Cada cambio posterior debe
verificar su contrato de tablas y su lectura para impresión antes de declararse listo.
