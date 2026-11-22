# Registro de pedidos nuevo — 22/11/2026

Rama: consolidacion/pointsalesoft-20261121. Ventana nueva independiente:
`URegPedidoProvNuevo.pas`. El menu ofrece Registro de pedidos (nuevo) y
Registro de pedidos (legacy). URegPedidoProv.pas y su DFM no se modifican.
La ventana nueva se construye con controles VCL nativos desde el PAS; no requiere
un nuevo DFM. Conserva fuente CP1252 y CRLF, sin bibliotecas de interfaz nuevas.

## Operacion

1. Seleccionar proveedor, factura numerica, fecha, pago, NCF/RNC y total del
   documento del proveedor. El numero de factura sigue el tipo entero del esquema
   existente; no se cambia su esquema para admitir referencias alfanumericas.
2. Buscar por codigo interno, codigo texto/prefijo, codigo de barras, referencia
   o descripcion. La busqueda muestra hasta 80 productos de la empresa actual.
3. Elegir presentacion de compra; cantidad y oferta se capturan en esa misma
   presentacion. Se muestra su equivalencia en unidades base de inventario.
4. Indicar costo del proveedor y si ya incluye ITBIS. Se utiliza la tasa del ERP
   por producto/fecha, no una tasa fija. El costo guardado en inventario incluye
   ITBIS y se expresa por unidad base. No se aplica el impuesto una segunda vez.
5. Revisar precio o utilidad. El descuento cuadra la factura; no reduce el costo.
   La oferta solo aumenta stock, almacen, Kardex y, cuando corresponda, lote.
6. Completar lote/vencimiento cuando aplique. Se permiten varias lineas/lotes
   del mismo producto, conservando sus cantidades/costos documentales.
7. Agregar al pedido, revisar y Procesar. Se exige cuadrar el total exacto con
   el proveedor. La fecha queda fija mientras hay lineas para no invalidar tasas.

Todo lo anterior es memoria y consultas de lectura. Cancelar un item o el editor
de precios no guarda registros. Si existen varios costos documentales para el
mismo producto, el ultimo costo/precio revisado y agregado al borrador define el
costo/precio final de inventario; los importes de las lineas anteriores no se
reescriben. Verificar este criterio por pantalla con el operador en QA.

## Los tres modos de precios

- Sencillo: costo < minimo <= venta, calculo por porcentaje sobre costo o precio
  directo. La captura por caja se convierte a la base del inventario.
- Niveles: reutiliza PORCUTILIDAD1-4 de INVENTARIO_PRODUCTO; si falta porcentaje
  y hay costo/precio previo coherente, propone el porcentaje correspondiente.
  Permite editar precio o porcentaje. No impone un orden entre niveles.
  Precio y PRECIO_MINIMO quedan iguales a precio1.
- Presentaciones: reutiliza PRECIO_UNIDADSURTIDORA y sus equivalencias/porcentajes.
  Si no existe Unidad/equivalencia 1, prepara una fila en memoria usando el ID
  real del catalogo UNIDADES; no supone IDUNIDAD=1. Permite agregar presentaciones.
  Los niveles 2-4 en cero se consideran no utilizados, sin inventarles precios.

Se agrega EditarPreciosRecepcion a UFormPrecioXUnidadNivel.pas. Esta ruta crea una
instancia TfrmPrecioUnidadNivel con CreateNew y el editor de borrador; no carga
el DFM, datasets, guardado ni eventos de sincronizacion legacy. Los metodos
existentes de esa ventana permanecen sin cambio. Se confirma antes de agregar
un producto/costo nuevo; no se repite la confirmacion por cada lote del mismo
producto si sus precios ya fueron revisados en el mismo borrador.

## Persistencia y comprobaciones

UPedidoRecepcionDatos utiliza una transaccion independiente. Antes de insertar
comprueba empresa, proveedor, producto, precios confirmados, total, lote y
modificaciones concurrentes de costos/precios. Serializa recepciones por empresa
y bloquea los productos/precios existentes durante el guardado. Una factura ya
registrada de ese proveedor/empresa no se vuelve a procesar.

Cabecera, detalle, inventario, almacen, Kardex, costo del proveedor, lotes y CXP
se guardan juntos. Un fallo propaga el error y revierte la transaccion completa.
No confirma las transacciones de otras pantallas. Los generadores Firebird
pueden dejar huecos si hay rollback; no son secuencias fiscales.

Se releen cantidades, costo, precio, minimo, niveles y total del detalle antes de
confirmar. La auditoria de precios se conserva; se llenan los campos adicionales
AUD_* solo cuando existen en ese cliente. No se ejecuta DDL en bases comerciales.
DESPACHO conserva la descomposicion documental neto/ITBIS compatible con sus
campos existentes; el costo de inventario y la captura/impresion son con ITBIS.

El reporte nuevo utiliza la presentacion, costo con ITBIS y descuento revisados.
Solo se habilita despues de confirmar. Si falla impresion, la recepcion queda
guardada y no se ejecuta de nuevo el registro. La confirmacion de resultado
incierto se consulta por su numero tentativo antes de habilitar otro intento.

El control de costo conserva Tag=656. El acceso nuevo replica el permiso del
menu legacy y aplica los roles existentes; Nueva recepcion no restablece un
permiso de costo que estuviera denegado.

## Prosesur y segunda base

Esta ruta guarda la recepcion y sus precios en la base seleccionada. No ejecuta
sincronizacion ni escribe en una segunda base. La sincronizacion existente sigue
en el editor legacy; no se cambia su comportamiento ni se declara probada la
publicacion a sucursales desde esta ventana. Antes de sustituir el recorrido
legacy de un puesto que dependa de esa sincronizacion, validar su publicacion
posterior y recuperacion de fallos como integracion separada. No convertir una
publicacion pendiente en un segundo registro de la compra.

## Validacion y limites

Compilacion aislada Delphi 7 de los componentes nuevos y del puente de precios
extraido del fuente. Pruebas de persistencia en base Firebird sintetica con las
firmas/procedimientos y cinco triggers del esquema inspeccionado. Pruebas VCL
del flujo real del formulario, cancelar/confirmar precios, procesar, reporte y
permisos. Ver resumen y ensayos en qa/pedidos-nuevo.

No se compila el ERP completo, no se emiten documentos fiscales y no se escriben
datos comerciales. No se acredita ejecucion del menu dentro del ERP recompilado,
impresion fisica ni pruebas de todas las variantes de esquema de los clientes.
El propietario recompila el ERP y prueba el acceso nuevo en QA. La captura
programatica de controles fuera de pantalla es parcial y no se usa como
evidencia de fidelidad visual; revisar la ventana real tras esa recompilacion.

## Milestones siguientes

1. Lotes con fracciones: migracion de campos, procedimientos, consumidores y
   saldos de venta; alertas por proximidad al vencimiento y trazabilidad.
2. Devolucion anticipada al proveedor y posterior vinculacion de su nota de
   credito/CXP. Separar salida fisica y credito reconocido para no descontar dos
   veces. No emitir automaticamente una nota fiscal desde esta recepcion.

Pagos Combinados sigue TODO. No se cambia el motor e-CF ni su auditoria paralela.
