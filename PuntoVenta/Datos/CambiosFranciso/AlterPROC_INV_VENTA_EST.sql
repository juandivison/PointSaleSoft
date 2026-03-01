SET TERM ^ ;
alter  PROCEDURE PROC_INV_VENTA_EST (
    INVID integer )
RETURNS (
    CODIGO integer,
    CODIGO_TEXTO varchar(40),
    FECHA timestamp,
    CODIGO_BARRA varchar(40),
    TIPO integer,
    DESCRIPCION varchar(40),
    CANTIDAD_REORDEN integer,
    PRECIO_ANT numeric(15,2),
    CANTIDAD numeric(15,2),
    PRECIO numeric(15,2),
    BLCE_CANT_ENTRADA numeric(15,2),
    BLCE_CANT_SALIDA numeric(15,2),
    FECHA_ULTIMA_TRN timestamp,
    STATUS char(1),
    PORC_DESCUENTO numeric(15,2),
    FOTO blob sub_type 0,
    PAGA_ITBI smallint,
    CODIGO_PRECIO char(6),
    UNIDAD numeric(15,2),
    PRECIO_COMPRA numeric(15,2),
    PRECIO_MINIMO numeric(15,2),
    REFERENCIA varchar(50),
    FECHA_VENCIMIENTO timestamp,
    INVENTARIAR smallint,
    PRECIO_TIPO_UNIDAD numeric(15,2),
    TIPO_UNIDAD integer,
    PRECIOVENTA1 numeric(15,2),
    PRECIOVENTA2 numeric(15,2),
    PRECIOVENTA3 numeric(15,2),
    PRECIOVENTA4 numeric(15,2)
    )
AS
BEGIN
  FOR  SELECT CODIGO,
             p.CODIGO_TEXTO,
             p.FECHA,
             p.CODIGO_BARRA,
             p.TIPO,
             p.DESCRIPCION,
             p.CANTIDAD_REORDEN,
             p.PRECIO_ANT,
             p.CANTIDAD,
             p.PRECIO,
             p.BLCE_CANT_ENTRADA,
             p.BLCE_CANT_SALIDA,
             p.FECHA_ULTIMA_TRN,
             p.STATUS,
             p.PORC_DESCUENTO,
             p.FOTO,
             p.PAGA_ITBI,
             p.CODIGO_PRECIO,
             p.UNIDAD,
             p.PRECIO_COMPRA,
             p.PRECIO_MINIMO,
             p.REFERENCIA,
             p.FECHA_VENCIMIENTO,
             p.INVENTARIAR, p.PRECIO_TIPO_UNIDAD, 
             p.TIPO_UNIDAD,
             p.PRECIOVENTA1,
             p.precioventa2,
             p.precioventa3,
             p.precioventa4
      FROM INVENTARIO_PRODUCTO p
      INTO :CODIGO,
           :CODIGO_TEXTO,
           :FECHA,
           :CODIGO_BARRA,
           :TIPO,
           :DESCRIPCION,
           :CANTIDAD_REORDEN,
           :PRECIO_ANT,
           :CANTIDAD,
           :PRECIO,
           :BLCE_CANT_ENTRADA,
           :BLCE_CANT_SALIDA,
           :FECHA_ULTIMA_TRN,
           :STATUS,
           :PORC_DESCUENTO,
           :FOTO,
           :PAGA_ITBI,
           :CODIGO_PRECIO,
           :UNIDAD,
           :PRECIO_COMPRA,
           :PRECIO_MINIMO,
           :REFERENCIA,
           :FECHA_VENCIMIENTO,
           :INVENTARIAR,:PRECIO_TIPO_UNIDAD,
           :tipo_unidad,           
           :precioventa1,
           :precioventa2,
           :precioventa3,
           :precioventa4 
  DO
      BEGIN
        SUSPEND;
      END
END^
SET TERM ; ^

GRANT EXECUTE
 ON PROCEDURE PROC_INV_VENTA_EST TO  DIVISON;



-- TODO:
-- * add triggers and their ddl
-- * for each trigger, look for dependent generators via dependecies

