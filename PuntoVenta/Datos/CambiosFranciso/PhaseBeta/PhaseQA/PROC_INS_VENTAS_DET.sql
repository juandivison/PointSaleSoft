SET TERM ^ ;
alter PROCEDURE PROC_INS_VENTAS_DET (
    NUMERO integer,
    CODIGO_PROD varchar(40),
    CODIGO_BARRA varchar(20),
    DESCRIPCION varchar(60),
    CANTIDAD numeric(15,2),
    PRECIO float,
    PORC_DESC_DET float,
    ITBI_DET float,
    VALOR_SERVICIO_DET numeric(15,2),
    VALOR_TOTAL_DET numeric(15,2),
    NUM_FACTURA double precision,
    STATUS_DET char(1),
    FECHA_IN timestamp,
    IN_POR varchar(12),
    FECHA_MOD timestamp,
    MOD_POR varchar(12),
    CANT_REGRESO numeric(15,2),
    CANT_PROMO numeric(15,2),
    MONTO_DIETA numeric(15,2),
    MONTO_AJUSTE numeric(15,2),
    SERIE_PROD varchar(50),
    TIPO_UNIDAD integer,
    ITBIS_EXENTO smallint,
    TIPO_VENTA smallint,
    descripcionproducto blob sub_type 1 )
AS
declare variable xSerie integer;
BEGIN
  Select Gen_id(GEN_NUM_VENTA_DET,1) From rdb$Database
  Into :xSerie;
  INSERT INTO VENTAS_DET (
    Serie,
    NUMERO,
    CODIGO_PROD,
    CODIGO_BARRA,
    DESCRIPCION,
    CANTIDAD,
    PRECIO,
    PORC_DESC_DET,
    ITBI_DET,
    VALOR_SERVICIO_DET,
    VALOR_TOTAL_DET,
    NUM_FACTURA,
    STATUS_DET,
    FECHA_IN,
    IN_POR,
    FECHA_MOD,
    MOD_POR,
    CANT_REGRESO,
    CANT_PROMO,
    MONTO_DIETA,
    MONTO_AJUSTE, Serie_Prod, TIPO_UNIDAD, ITBIS_EXENTO, TIPO_VENTA, DESCRIPCIONPRODUCTO
 
    )
  VALUES (
    :XSERIE,
    :NUMERO,
    :CODIGO_PROD,
    :CODIGO_BARRA,
    :DESCRIPCION,
    :CANTIDAD,
    :PRECIO,
    :PORC_DESC_DET,
    :ITBI_DET,
    :VALOR_SERVICIO_DET,
    :VALOR_TOTAL_DET,
    :NUM_FACTURA,
    :STATUS_DET,
    :FECHA_IN,
    :IN_POR,
    :FECHA_MOD,
    :MOD_POR,
    :CANT_REGRESO,
    :CANT_PROMO,
    :MONTO_DIETA,
    :MONTO_AJUSTE, :Serie_Prod, :TIPO_UNIDAD, :ITBIS_EXENTO, :TIPO_VENTA,:DESCRIPCIONPRODUCTO);
  SUSPEND;
END^
SET TERM ; ^

GRANT EXECUTE
 ON PROCEDURE PROC_INS_VENTAS_DET TO  DIVISON;



-- TODO:
-- * add triggers and their ddl
-- * for each trigger, look for dependent generators via dependecies

