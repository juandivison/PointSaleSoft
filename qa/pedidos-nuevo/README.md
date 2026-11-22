# QA del registro de pedidos nuevo

Resultado: 66 controles de persistencia y 22 de interfaz PASS, total 88.
Solo bases sinteticas con prefijo pedidos-qa- junto a los EXE. Los programas
rechazan recibir la ruta de una base comercial. No se emiten documentos.

Verificar.ps1 crea una base vacia con esquema/firmas/procedimientos y cinco
triggers del esquema inspeccionado, compila unidades aisladas y ejecuta ambos
ensayos. Requiere Delphi 7, IBX, QuickReport, RxLib y Firebird local.
Indicar -Fuentes con el directorio PuntoVenta/Fuentes, -ConexionDfm con el
DFM local de conexion y -ProveedorFirebird con FirebirdSql.Data.FirebirdClient.dll.
El DFM solo proporciona credenciales de conexion, nunca se modifica ni publica.
Los valores predeterminados corresponden al entorno del propietario.

UBridgePedidoQA conserva un extracto del puente nuevo de UFormPrecioXUnidadNivel
con una clase TForm minima para compilar la firma y el constructor de borrador
sin arrastrar todo el ERP. Las pruebas funcionales ejecutan el editor real
UPedidoPreciosBorrador. Esto no acredita compilacion del menu o ERP completos.

Las capturas fuera de pantalla no reproducen fielmente todos los controles
nativos, por lo que no se usan como evidencia visual ni como entregable.
Probar manualmente el menu nuevo, la ventana, varias resoluciones, los tres
modos de precios y la vista previa/impresion desde el ERP recompilado en QA.

Se prueban: normalizacion de costo/ITBIS, descuento, oferta, equivalencias,
varios lotes, saldo general/almacen/Kardex, precios sencillos/niveles/unidades,
auditoria, ediciones concurrentes, aislamiento de empresas/transacciones,
duplicados, rollback por fallo de almacen o CXP, credito y total del proveedor;
tambien cancelar/confirmar precios, Cancelar item, Procesar, reporte, cierre
del pedido, Nueva recepcion y conservacion del permiso de costo.
