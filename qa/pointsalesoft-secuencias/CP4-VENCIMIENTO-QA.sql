-- Ejecutar UNA VEZ en QA antes de reemplazar el PHP.
ALTER TABLE ecf_reservas_secuencia
    ADD COLUMN fecha_vence_reserva DATE NULL;

-- Solo reconstruye la fecha de las tres reservas sintéticas ya verificadas.
-- Se usa el lote de QA que conserva su fecha original.
UPDATE ecf_reservas_secuencia AS r
JOIN ecf_lotes_secuencia AS l ON l.id=r.lote_id AND l.control_id=r.control_id
JOIN ecf_control_secuencia AS c ON c.id=r.control_id
SET r.fecha_vence_reserva=l.fecha_vence
WHERE c.rnc_emisor='000000000' AND c.ambiente='TEST' AND c.tipo_cf='E31'
  AND r.sucursal_id='QA01'
  AND r.request_id IN (
    '10000000-0000-4000-8000-000000000001',
    '10000000-0000-4000-8000-000000000003',
    '10000000-0000-4000-8000-000000000004'
  );

-- Network Solutions rechazó CREATE TRIGGER con 1419 por binary logging/SUPER.
-- El servicio copia la fecha solo al insertar y la recupera desde la reserva.
-- Cuenta API: SELECT en control y reservas, INSERT en reservas,
-- SELECT y UPDATE(ultimo_asignado) en lotes. Sin UPDATE/DELETE en reservas.
-- Verificar privilegios efectivos, incluidos los heredados de base o globales.
-- Un administrador con permisos de escritura puede modificar datos directamente.
