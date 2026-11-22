-- CP4 / MySQL 5.6. Ejecutar con el administrador de QA.
-- Antes de ejecutar, reemplazar en TODO el archivo:
-- CP4_API_QA_USUARIO: nombre de usuario NUEVO (máximo 16 caracteres en MySQL 5.6).
-- ORIGEN_IIS: host de origen de la conexión PHP, no el hostname del servidor MySQL.
-- CLAVE_QA_NUEVA: contraseña nueva. Duplicar cualquier comilla simple dentro de SQL.
-- Identificar el origen con SELECT USER(), CURRENT_USER() desde la conexión PHP,
-- o usar el mismo host de cuenta permitido por el proveedor para ese sitio.
-- Si se usa %, la cuenta acepta cualquier origen con acceso de red y su contraseña.
-- No versionar el archivo una vez completado con la contraseña.
-- Crear una cuenta NUEVA evita heredar permisos de la cuenta administrativa.
-- Si CREATE USER falla porque ya existe, detenerse y revisar sus permisos.

CREATE USER 'CP4_API_QA_USUARIO'@'ORIGEN_IIS'
IDENTIFIED BY 'CLAVE_QA_NUEVA';

GRANT SELECT
ON `idesimysqldb_qa`.`ecf_control_secuencia`
TO 'CP4_API_QA_USUARIO'@'ORIGEN_IIS';

GRANT SELECT, UPDATE (`ultimo_asignado`)
ON `idesimysqldb_qa`.`ecf_lotes_secuencia`
TO 'CP4_API_QA_USUARIO'@'ORIGEN_IIS';

GRANT SELECT, INSERT
ON `idesimysqldb_qa`.`ecf_reservas_secuencia`
TO 'CP4_API_QA_USUARIO'@'ORIGEN_IIS';

-- Revisar privadamente. Esta salida puede contener información de autenticación
-- en MySQL 5.6. No pegarla completa en chats, logs o Git.
SHOW GRANTS FOR 'CP4_API_QA_USUARIO'@'ORIGEN_IIS';

-- No se necesita FLUSH PRIVILEGES tras CREATE USER / GRANT.
-- Las sentencias de administración no se revierten con ROLLBACK.
-- Si un GRANT falla, corregirlo antes de configurar la cuenta en el servicio.
