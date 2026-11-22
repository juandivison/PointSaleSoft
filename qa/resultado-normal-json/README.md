# Pruebas aisladas

Compilar PruebasJson.dpr con Delphi 7, -U apuntando a PuntoVenta/Fuentes,
y -E/-N apuntando a una carpeta temporal. Ejecutar solo ese EXE: 18 controles,
sin HTTP ni base. La suite de integracion incluida utiliza fuentes reales,
un proveedor Fixture simulado y una base Firebird sintetica.

La suite de integracion referencia rutas del entorno de desarrollo del autor.
Crear-Base.ps1 necesita el proveedor .NET de Firebird y la configuracion local
de conexion del propietario; no incluye credenciales. La base se crea con
nombre aleatorio en Build, no sustituye una base comercial. Compilar desde
integracion con -U.;<repo>/PuntoVenta/Fuentes y -E/-N Build. Nunca usar una base
comercial como argumento de Pruebas.exe. Fixture.exe debe estar junto al EXE.
Antes de compilar, poner los tres PAS modificados de esta entrega y
UUtilecftimbre.pas en la carpeta aislada de compilacion junto a los shims.
Resultado del ensayo de esta entrega: 90 PASS, cero HTTP, cero emision fiscal.

Los artefactos historicos del PR #3 estan en qa/pointsalesoft-secuencias:
algunos tienen rutas de base/HTTPS fijas. Su traslado NO autoriza ejecutarlos.
