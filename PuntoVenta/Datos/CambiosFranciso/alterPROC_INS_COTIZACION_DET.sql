SET TERM ^ ;
alter PROCEDURE PROC_INS_COTIZACION_DET (
    NUMERO integer,
    CODIGO_PROD varchar(12),
    CODIGO_BARRA varchar(20),
    DESCRIPCION varchar(60),
    DESCRIPCIONESPECIAL BLOB SUB_TYPE 1 CHARACTER SET OCTETS,
    CANTIDAD numeric(15,2),
    PRECIO float,
    PORC_DESC_DET float,
    ITBI_DET float,
    VALOR_SERVICIO_DET numeric(15,2),
    VALOR_TOTAL_DET numeric(15,2),
    STATUS_DET char(1),
    FECHA_IN timestamp,
    IN_POR varchar(12),
    FECHA_MOD timestamp,
    MOD_POR varchar(12) )
RETURNS (
    SERIE_TRNS integer )
AS
declare variable xSerie integer;
BEGIN
  
  Select Gen_id(GEN_NUM_COTIZA_DET,1) From rdb$database
  into :SERIE_TRNS;
  
  xSerie =:SERIE_TRNS;

  INSERT INTO COTIZACION_DET (
    SERIE,
    NUMERO,
    CODIGO_PROD,
    CODIGO_BARRA,
    DescripcionEspecial,
    DESCRIPCION,
    CANTIDAD,
    PRECIO,
    PORC_DESC_DET,
    ITBI_DET,
    VALOR_SERVICIO_DET,
    VALOR_TOTAL_DET,
    STATUS_DET,
    FECHA_IN,
    IN_POR,
    FECHA_MOD,
    MOD_POR)
  VALUES (
    :xSerie,
    :NUMERO,
    :CODIGO_PROD,
    :CODIGO_BARRA,
    :DescripcionEspecial,
    :DESCRIPCION,
    :CANTIDAD,
    :PRECIO,
    :PORC_DESC_DET,
    :ITBI_DET,
    :VALOR_SERVICIO_DET,
    :VALOR_TOTAL_DET,
    :STATUS_DET,
    :FECHA_IN,
    :IN_POR,
    :FECHA_MOD,
    :MOD_POR);
SUSPEND;
END^
SET TERM ; ^

GRANT EXECUTE
 ON PROCEDURE PROC_INS_COTIZACION_DET TO  DIVISON;
GRANT EXECUTE
 ON PROCEDURE PROC_INS_COTIZACION_DET TO  sysdba;


-- TODO:
-- * add triggers and their ddl
-- * for each trigger, look for dependent generators via dependecies

