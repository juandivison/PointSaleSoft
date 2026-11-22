# Busqueda por codigo de texto en venta rapida

Solo GlbFerreteria=1 y una letra seguida de un digito al inicio activan la ruta nueva en edtCodigo. F12 y f12 filtran CODIGO_TEXTO por prefijo; numeros, palabras y otros modos conservan su ruta. Los resultados se seleccionan en la lista habitual. La ruta nueva tambien funciona con el lector activado, sin cambiar el tratamiento de codigos numericos o barras.

La consulta usa un parametro STARTING WITH, mantiene empresa, division y procedimiento de inventario actuales y evita repetir la consulta cuando no hay resultados. No agrega indices ni cambia procedimientos almacenados. No se afirma una mejora medida en el catalogo comercial; el procedimiento seleccionable mantiene su costo interno de acceso al inventario.

Ejecutar Verificar.ps1 con Delphi 7, Python y Firebird local. PSS_PYTHON, PSS_DCC32 y PSS_FIREBIRD_PROVIDER permiten indicar dependencias. Se extraen del PAS real el detector y el metodo AsignarSqlText y se prueban en una base sintetica con procedimientos de inventario simulados. Verifica prefijo, empresa, almacen, parametros, caracteres literales, una sola apertura de consulta y rutas anteriores. No toca inventario comercial ni emite documentos.

Pendiente comprobacion manual al compilar PointSaleSoft en Delphi: escribir F12, elegir un producto, revisar cantidad/precio y repetir con codigo numerico y descripcion. El query para migrar prefijos P a F se entrega por separado y no se ejecuta automaticamente.
