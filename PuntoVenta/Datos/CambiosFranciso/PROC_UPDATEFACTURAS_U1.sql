SET TERM ^ ;
alter  PROCEDURE PROC_UPDATEFACTURAS_U1 (
    SERIE double precision,
    NUMERO double precision,
    MONEDA char(2),
    TIPO smallint,
    CODIGO_CTE integer,
    FECHA timestamp,
    DESCRIPCION varchar(40),
    MONTO_FACT numeric(15,2),
    RCXC char(1),
    RCNT char(1),
    STATUS char(1),
    FECHA_MOD timestamp,
    MOD_POR varchar(12),
    FECHA_VENCE timestamp,
    TIPO_FACTURA smallint,
    APLICA_TIPODESC smallint )
AS
BEGIN
  UPDATE FACTURAS
  SET
    CODIGO_CTE = :CODIGO_CTE,
    FECHA = :FECHA,
    DESCRIPCION = :DESCRIPCION,
    MONTO_FACT = :MONTO_FACT,
    --RCXC = :RCXC,
    --RCNT = :RCNT,
    --STATUS = :STATUS,    
    FECHA_MOD = :FECHA_MOD,
    MOD_POR = :MOD_POR,
    FECHA_VENCE = :FECHA_VENCE,
    TIPO_FACTURA = :TIPO_FACTURA,
    APLICA_TIPODESC = :APLICA_TIPODESC
  WHERE
  (SERIE = :SERIE) AND 
  (NUMERO = :NUMERO) AND 
  (MONEDA = :MONEDA) AND 
  (TIPO = :TIPO);
END^
SET TERM ; ^

GRANT EXECUTE
 ON PROCEDURE PROC_UPDATEFACTURAS_U1 TO  DIVISON;



-- TODO:
-- * add triggers and their ddl
-- * for each trigger, look for dependent generators via dependecies

