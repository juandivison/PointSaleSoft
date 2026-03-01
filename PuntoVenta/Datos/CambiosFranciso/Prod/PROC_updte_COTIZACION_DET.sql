SET TERM ^ ;
ALTER PROCEDURE PROC_UPDTE_COTIZACION_DET (
    NUMERO integer,
    CODIGO_PROD varchar(12),
    CODIGO_BARRA varchar(20),
    DESCRIPCION varchar(80),
    DESCRIPCIONESPECIAL blob sub_type 1 CHARACTER SET OCTETS,
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
    MOD_POR varchar(12),
    TIPO_UNIDAD integer,
    ITBIS_EXENTO smallint,
    TIPO_VENTA smallint,
    SERIE_COTIZA integer )
RETURNS (
    SERIE_TRNS integer )
AS
declare variable xSerie integer;
BEGIN
  serie_trns =:serie_cotiza;
  
  Update COTIZACION_DET 
   set 
    CODIGO_PROD=:CODIGO_PROD,
    CODIGO_BARRA=:CODIGO_BARRA,
    DescripcionEspecial=:DescripcionEspecial,
    DESCRIPCION=:DESCRIPCION,
    CANTIDAD=:CANTIDAD,
    PRECIO=:PRECIO,
    PORC_DESC_DET=:PORC_DESC_DET,
    ITBI_DET=:ITBI_DET,
    VALOR_SERVICIO_DET=:VALOR_SERVICIO_DET,
    VALOR_TOTAL_DET=:VALOR_TOTAL_DET,
    STATUS_DET=:STATUS_DET,
    FECHA_IN=:FECHA_IN,
    IN_POR=:IN_POR,
    FECHA_MOD=:FECHA_MOD,
    MOD_POR=:MOD_POR,
     tipo_unidad=:tipo_unidad,
    itbis_exento=:itbis_exento,
    COTIZACION_DET.TIPO_VENTA=:tipo_venta
  Where COTIZACION_DET.NUMERO=:NUMERO
  And COTIZACION_DET.SERIE=:serie_cotiza;
SUSPEND;
END^
SET TERM ; ^


GRANT EXECUTE
 ON PROCEDURE PROC_UPDTE_COTIZACION_DET TO  DIVISON;

GRANT EXECUTE
 ON PROCEDURE PROC_UPDTE_COTIZACION_DET TO  SYSDBA;

