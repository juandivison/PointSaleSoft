# TODO: lotes fraccionarios y devolucion anticipada a proveedores

Acuerdo 22/11/2026. No implementar en el registro de pedidos nuevo de este corte.

## Milestone: lotes y vencimientos

- Migrar CANT_IN/CANT_OUT y parametros/consumidores que hoy son enteros.
- Conciliar entradas y ventas fraccionarias con stock por lote, almacen y Kardex.
- Preservar proveedor, recepcion, numero de lote y vencimiento; impedir mezclas.
- Consulta/alerta configurable de proximidad al vencimiento y disponibilidad.
- Ensayar migracion sobre base aislada y validar saldos antes/despues, sin DDL
  automatico sobre bases comerciales ni cambios por inferencia.

## Milestone: devolucion al proveedor y credito

- Seleccionar proveedor, recepcion, lote, cantidad disponible y motivo.
- Preparar la salida antes del vencimiento, con anticipacion configurable.
- Separar salida fisica del producto y credito reconocido por el proveedor.
- Vincular documento del proveedor a CXP y conservar trazabilidad sin doble salida.
- Recuperacion ante fallos y pruebas de devoluciones parciales/fracciones.
- Definir aparte la integracion fiscal aplicable; no emitir/reemitir documentos
  desde la recepcion ni modificar el motor actualmente bajo auditoria.

Pagos Combinados / Cuadre de Caja permanece TODO independiente.
