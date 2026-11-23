POINTSALESOFT / PROSESUR - CP7 (23-NOV-2026)
CONFIGURACION VISUAL Y APROBACION CENTRAL DE e-CF, SOLO QA/TEST

ALCANCE
- Catalogo DGII: E31, E32, E33, E34, E41, E43, E44, E45, E46 y E47.
- En la pantalla se pueden solicitar LOS DIEZ tipos.
- Solo E31/E32 disponen en este checkpoint de integracion de numeracion REMOTO
  en PointSaleSoft. Los ocho restantes NO se activan ni consumen rangos.
- Cada terminal inicia una solicitud con ID y secreto criptograficamente seguro;
  la Principal autoriza con credencial independiente; el servidor deriva por
  tipo un token seguro y solo guarda su SHA-256 en MySQL.
- En la terminal, el token se conserva protegido con DPAPI CURRENT USER.
- El origen REMOTO solo se persiste DESPUES de que el servidor confirma la
  activacion. Con falla de red, NO se cambia automaticamente de REMOTO a LOCAL.
- No se emiten documentos a DGII. Los lotes que se utilicen deben ser TEST.
- URLs de activacion/reservas, RNC, sucursal, lotes y credenciales no estan
  fijados a PROSESUR en el fuente. El catalogo oficial de 10 codigos existe
  como respaldo visual; los permisos y rutas operativas se leen del servidor.

ARCHIVOS
1) CP7-ActivacionCentral-MySQL56.sql: catalogo y tablas de activacion.
2) ecf-config-central-qa.php: API de solicitud, estado y aprobacion.
3) ecf-config-admin-qa.php: consola HTTPS de la Principal (requiere login).
4) ecf-config-central-qa.ini.example: configuracion de despliegue PRIVADA.
5) Integrar-AuthCP7-Reservador.py: parche para autenticacion dinamica en
   ecf-cp4-qa.php existente. PRIMERO --verificar, luego aplicar en QA.
6) UfrmEcfSecuenciasConfig.pas: formulario Delphi7 (sin DFM).
7) Aplicar-CP7-Delphi.py: integra formulario y control de URL HTTPS de forma
   conservadora en fuentes ya integrados anteriormente. Hace backups.

CONFIGURACION INICIAL (SOLO ADMINISTRADOR TECNICO, UNA VEZ)
A. Respaldar base MySQL QA, configuracion privada PHP, INI y fuentes Delphi.
B. Ejecutar exclusivamente el SQL nuevo CP7 en MySQL QA EXISTENTE;
   NO repetir los scripts CP2/CP3 ya instalados.
C. Crear un master_key_hex aleatorio de 32 bytes y token ADMIN independiente
   de 32 bytes. Guardar solo el SHA-256 del token ADMIN en ini privado y entregar
   el token de acceso exclusivamente al administrador de la Principal.
   NO USAR claves de ejemplo; nunca colocarlas en Git ni bajo /www.
D. Crear /database/ecf-config-central-qa.ini a partir de .example. Definir
   credenciales de BD de servicio, URL de reservas QA y ambiente TEST.
E. Instalar ambos PHP en el directorio HTTPS publico; verificar con php -l.
F. Migrar el PHP reservador YA PROBADO a autenticacion SQL dinamica:
   python3 Integrar-AuthCP7-Reservador.py /ruta/ecf-cp4-qa.php --verificar
   python3 Integrar-AuthCP7-Reservador.py /ruta/ecf-cp4-qa.php
   php -l /ruta/ecf-cp4-qa.php
   Hacer nueva prueba de autorizacion porque es una funcionalidad distinta
   de la conexion PHP-MySQL ya aprobada.
G. Configurar en el despliegue de cada terminal, una sola vez, la clave
   UrlActivacion de la seccion ECF_SECUENCIA_<CIA>_<SUCURSAL> en repconf_cr.ini.
   Debe apuntar al nuevo endpoint HTTPS; no hay un host fijo en el Delphi.

DELPHI / PC
- La opcion de menu ya existente usa el mismo procedimiento
  MostrarConfiguracionSecuencias(ACia,ASucursal,IniPath).
- Este parche presupone que el SCRIPT ANTERIOR de E31/E32 ya aplico el menu
  y OrigenSecuenciaRemotoPorTipo. No instala ese parche de nuevo.
- Al aplicar CP7 se sustituye el formulario PRELIMINAR solo si coincide
  exactamente con el SHA256 del archivo original de 8291 bytes. Si no
  coincide, DETENERSE para fusionar manualmente los cambios del usuario.
- Desde PuntoVenta/Fuentes:
  python3 Aplicar-CP7-Delphi.py "C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes" --verificar
  python3 Aplicar-CP7-Delphi.py "C:\Proyectos\PointSaleSoftResp\PuntoVenta\Fuentes"
- Revisar git diff y compilar Delphi 7 en la PC. DCC32 NO se ha ejecutado en
  este entorno; no afirmar compilacion ni pruebas end-to-end completas.

FLUJO HUMANO
1. La SUCURSAL abre Configuracion -> secuencias e-CF.
2. Marca los tipos deseados entre los diez.
3. Pulsa Solicitar activacion. PointSaleSoft crea la identidad y el secreto.
4. La PRINCIPAL abre ecf-config-admin-qa.php (HTTPS), inicia sesion,
   verifica identidad del dispositivo/RNC/sucursal y marca los tipos que
   puede autorizar: inicialmente E31 y E32 con lotes vigentes.
5. La SUCURSAL pulsa Consultar aprobacion.
6. El sistema guarda tokens DPAPI, confirma al servidor y solo entonces
   marca Origen_E31 / Origen_E32 como REMOTO. E33-E47 quedan pendientes.
7. En la venta, se conserva la cola durable y la no-reasignacion si falla
   la comunicacion, hasta pruebas de QA integral.

LIMITACIONES / NO-GO PRODUCCION
- Sin pruebas reales MySQL de CP7 y sin compilacion Delphi no hay PASS integral.
- No se han instalado archivos en el servidor real ni modificado GitHub.
- La API inicial es SOLO TEST. Nunca conectarla a lotes DGII productivos.
- El usuario de Windows que activa debe ser el mismo que consume DPAPI. Para
  cajas con varias cuentas Windows, implementar almacen seguro por equipo
  con ACL antes de desplegar.
- La consola ADMIN usa un secreto generado al desplegar el servicio central;
  ese paso bootstrap es responsabilidad tecnica de la Principal.
- El modo legacy QA del reservador conserva durante migracion su antigua URL
  en una lista de compatibilidad. Las nuevas activaciones reciben URL desde
  el servidor; no existe URL fija de PROSESUR en el formulario nuevo.
- Solicitar TODOS los tipos NO equivale a emitir TODOS los tipos. E33-E47
  requieren integrar sus flujos fiscales y pruebas aisladas antes de activar.
- Proteccion adicional de cierre de cuenta, logs, revocacion auditada,
  privilegios minimos SQL y migracion PROD seran checkpoints posteriores.