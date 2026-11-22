-- CP3: instalar una sola vez en una base QA seleccionada y vacía de objetos ecf_*.
-- MySQL 5.6 / InnoDB. El DDL hace commits implícitos.
-- Ejecutar con una cuenta de instalación de QA, no con la cuenta de CP2-B.

CREATE TABLE ecf_control_secuencia (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    rnc_emisor VARCHAR(11) NOT NULL,
    ambiente ENUM('TEST', 'PROD') NOT NULL,
    tipo_cf CHAR(3) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uq_ecf_control_ambito (rnc_emisor, ambiente, tipo_cf)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

CREATE TABLE ecf_lotes_secuencia (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    control_id BIGINT UNSIGNED NOT NULL,
    desde BIGINT UNSIGNED NOT NULL,
    hasta BIGINT UNSIGNED NOT NULL,
    ultimo_asignado BIGINT UNSIGNED NOT NULL,
    fecha_vence DATE NULL,
    modalidad ENUM('CENTRAL', 'DELEGADO') NOT NULL,
    sucursal_delegada VARCHAR(64) NULL,
    activo TINYINT UNSIGNED NOT NULL DEFAULT 1,
    PRIMARY KEY (id),
    UNIQUE KEY uq_ecf_lote_control (control_id, id),
    KEY ix_ecf_lote_rango (control_id, desde, hasta),
    KEY ix_ecf_lote_prioridad (control_id, modalidad, activo, fecha_vence, id),
    CONSTRAINT fk_ecf_lote_control FOREIGN KEY (control_id)
        REFERENCES ecf_control_secuencia (id)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

CREATE TABLE ecf_reservas_secuencia (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    request_id CHAR(36) NOT NULL,
    control_id BIGINT UNSIGNED NOT NULL,
    lote_id BIGINT UNSIGNED NOT NULL,
    sucursal_id VARCHAR(64) NOT NULL,
    documento_clave VARCHAR(128) NOT NULL,
    generacion INT UNSIGNED NOT NULL,
    correlativo BIGINT UNSIGNED NOT NULL,
    encf CHAR(13) NOT NULL,
    estado VARCHAR(24) NOT NULL,
    creado_en TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uq_ecf_reserva_solicitud (request_id),
    UNIQUE KEY uq_ecf_reserva_correlativo (control_id, correlativo),
    UNIQUE KEY uq_ecf_reserva_encf (control_id, encf),
    UNIQUE KEY uq_ecf_reserva_documento (control_id, sucursal_id, documento_clave, generacion),
    KEY ix_ecf_reserva_lote (control_id, lote_id),
    CONSTRAINT fk_ecf_reserva_lote FOREIGN KEY (control_id, lote_id)
        REFERENCES ecf_lotes_secuencia (control_id, id)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

DELIMITER $$

-- Alta de un lote nuevo. La rutina administra su propia transacción.
-- Invocarla sin una transacción previa. Importar saldos existentes queda fuera de esta rutina.
CREATE PROCEDURE ecf_alta_lote (
    IN p_control_id BIGINT UNSIGNED,
    IN p_desde BIGINT UNSIGNED,
    IN p_hasta BIGINT UNSIGNED,
    IN p_fecha_vence DATE,
    IN p_modalidad VARCHAR(8),
    IN p_sucursal VARCHAR(64)
)
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    DECLARE v_control_id BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_solapados BIGINT UNSIGNED DEFAULT 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF p_desde IS NULL OR p_hasta IS NULL OR p_desde < 1 OR p_desde > p_hasta THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'RANGO_INVALIDO';
    END IF;

    IF p_modalidad IS NULL OR BINARY p_modalidad NOT IN ('CENTRAL', 'DELEGADO')
        OR (p_modalidad = 'CENTRAL' AND p_sucursal IS NOT NULL)
        OR (p_modalidad = 'DELEGADO' AND (p_sucursal IS NULL OR TRIM(p_sucursal) = '')) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'MODALIDAD_INVALIDA';
    END IF;

    SELECT id INTO v_control_id
    FROM ecf_control_secuencia
    WHERE id = p_control_id
    FOR UPDATE;

    IF v_control_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CONTROL_INEXISTENTE';
    END IF;

    -- Primera lectura consistente después de adquirir el bloqueo del ámbito.
    -- Incluye lotes vencidos, inactivos y delegados para conservar rangos históricos.
    SELECT COUNT(*) INTO v_solapados
    FROM ecf_lotes_secuencia
    WHERE control_id = v_control_id AND desde <= p_hasta AND hasta >= p_desde;

    IF v_solapados > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'RANGO_SOLAPADO';
    END IF;

    INSERT INTO ecf_lotes_secuencia
        (control_id, desde, hasta, ultimo_asignado, fecha_vence, modalidad, sucursal_delegada)
    VALUES
        (v_control_id, p_desde, p_hasta, p_desde - 1, p_fecha_vence, p_modalidad, p_sucursal);

    COMMIT;
END$$

DELIMITER ;
