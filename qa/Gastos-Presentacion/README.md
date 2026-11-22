# Presentacion y consulta de gastos e-CF

Ejecutar `./Verificar.ps1` con Delphi 7 y Firebird local. Se crea una base sintetica independiente; no se emiten documentos ni se modifica la base comercial. El proveedor .NET de Firebird se obtiene del build de PointSaleSoft.Sync o de PSS_FIREBIRD_PROVIDER; PSS_DCC32 permite indicar el compilador.

Comprueba el propietario y las opciones de primer plano del aviso mediante una funcion simulada; no abre el dialogo real. Verifica formato del mensaje, conservacion de la respuesta original, errores y escapes Unicode. Ejecuta el SQL real con estados recientes, reservas positivas, documentos sin reserva, empresas distintas y secuencias anteriores, sin duplicar gastos.

La consulta toma ECF_GASTO_ENVIO por empresa/transaccion/e-NCF y usa como respaldo la reserva por e-NCF y HASH_DOC exacto del gasto. El mensaje almacenado permanece intacto. Los avisos finales de envio usan la ventana del gasto como propietaria.

Pendiente de comprobacion manual en Delphi: compilar PointSaleSoft, abrir gastos, consultar E41/E43 y confirmar que el aviso final queda delante del formulario al terminar un envio autorizado. Las pruebas automatizadas no envian a DGII.
