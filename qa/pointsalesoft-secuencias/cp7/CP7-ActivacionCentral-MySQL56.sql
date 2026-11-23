-- CP7 QA, MySQL 5.6 / InnoDB. Ejecutar con cuenta DDL, no la cuenta PHP.
-- No modifica ecf_control_secuencia, ecf_lotes_secuencia ni ecf_reservas_secuencia.
-- Los tipos listados son los diez tipos e-CF publicados por DGII a noviembre 2026.
-- integrado=1 SOLO si existe flujo de asignacion remota probado en PointSaleSoft.

CREATE TABLE IF NOT EXISTS ecf_config_tipo (
  tipo_cf CHAR(3) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  nombre VARCHAR(120) NOT NULL,
  integrado TINYINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (tipo_cf)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO ecf_config_tipo(tipo_cf,nombre,integrado) VALUES
 ('E31','Factura de Credito Fiscal Electronica',1),
 ('E32','Factura de Consumo Electronica',1),
 ('E33','Nota de Debito Electronica',0),
 ('E34','Nota de Credito Electronica',0),
 ('E41','Comprobante de Compras Electronico',0),
 ('E43','Comprobante de Gastos Menores Electronico',0),
 ('E44','Comprobante de Regimenes Especiales Electronico',0),
 ('E45','Comprobante Gubernamental Electronico',0),
 ('E46','Comprobante de Exportaciones Electronico',0),
 ('E47','Comprobante para Pagos al Exterior Electronico',0)
ON DUPLICATE KEY UPDATE nombre=VALUES(nombre);

CREATE TABLE IF NOT EXISTS ecf_config_solicitud (
  solicitud_id CHAR(36) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  rnc_emisor VARCHAR(11) CHARACTER SET ascii NOT NULL,
  ambiente ENUM('TEST','PROD') NOT NULL,
  sucursal_id VARCHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  dispositivo_id CHAR(36) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  secreto_sha256 CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  estado ENUM('PENDIENTE','APROBADA','ACTIVA','REVOCADA') NOT NULL DEFAULT 'PENDIENTE',
  solicitada_en DATETIME NOT NULL,
  autorizada_en DATETIME NULL,
  activada_en DATETIME NULL,
  solicitante_ip VARCHAR(45) NULL,
  PRIMARY KEY (solicitud_id),
  KEY ix_ecf_config_pendiente(ambiente,estado,solicitada_en),
  KEY ix_ecf_config_dispositivo(rnc_emisor,ambiente,sucursal_id,dispositivo_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS ecf_config_solicitud_tipo (
  solicitud_id CHAR(36) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  tipo_cf CHAR(3) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  autorizado TINYINT UNSIGNED NOT NULL DEFAULT 0,
  token_sha256 CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NULL,
  activo TINYINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (solicitud_id,tipo_cf),
  KEY ix_ecf_config_token(token_sha256,activo),
  CONSTRAINT fk_ecf_config_solicitud FOREIGN KEY(solicitud_id)
    REFERENCES ecf_config_solicitud(solicitud_id),
  CONSTRAINT fk_ecf_config_tipo FOREIGN KEY(tipo_cf)
    REFERENCES ecf_config_tipo(tipo_cf)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La cuenta PHP requiere SELECT/INSERT/UPDATE en tablas ecf_config_* y SELECT
-- ecf_control_secuencia/ecf_lotes_secuencia. Prohibir DELETE/ALTER/DROP.
-- Mantener PROD deshabilitado hasta completar la integracion y auditoria.
