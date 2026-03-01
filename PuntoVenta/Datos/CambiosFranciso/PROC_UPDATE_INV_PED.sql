SET TERM ^ ;
alter PROCEDURE PROC_UPDATE_INV_PED (
    CODIGO_PRODUCTO integer,
    NUEVACANTIDAD numeric(15,2),
    I_PRECIO_COMPRA numeric(15,2),
    I_PRECIO_VENTA numeric(15,2),
    FECHA_VENCIMIENTO timestamp,
    PRECIO_TIPO_UNIDAD numeric(15,2),
    TIPO_UNIDAD integer,
    recalcular_utilidad smallint )
AS
begin
   Update inventario_producto
   Set cantidad = 0
   Where cantidad Is Null And
   Codigo =:CODIGO_producto;
   
   if (:recalcular_utilidad = 1) then
   begin
     Update inventario_producto
     Set cantidad = cantidad + :NuevaCantidad,
     Blce_cant_entrada = Blce_cant_entrada + :nuevacantidad,
     fecha_ultima_trn = "today",
     Precio_Compra =:I_PRECIO_COMPRA,
     Precio_Ant = Precio,
     Precio=:I_PRECIO_VENTA,
     FECHA_VENCIMIENTO =:FECHA_VENCIMIENTO,
     PRECIO_TIPO_UNIDAD =:PRECIO_TIPO_UNIDAD,
     TIPO_UNIDAD=:TIPO_UNIDAD,
     PRECIOVENTA1 = :I_PRECIO_COMPRA * ( 1+ PORCUTILIDAD1/100),
     PRECIOVENTA2 = :I_PRECIO_COMPRA * ( 1+ PORCUTILIDAD2/100),
     PRECIOVENTA3 = :I_PRECIO_COMPRA * ( 1+ PORCUTILIDAD3/100),
     PRECIOVENTA4 = :I_PRECIO_COMPRA * ( 1+ PORCUTILIDAD4/100)
     Where codigo =:CODIGO_producto;
   end else
   begin
     Update inventario_producto
     Set cantidad = cantidad + :NuevaCantidad,
     Blce_cant_entrada = Blce_cant_entrada + :nuevacantidad,
     fecha_ultima_trn = "today",
     Precio_Compra =:I_PRECIO_COMPRA,
     Precio_Ant = Precio,
     Precio=:I_PRECIO_VENTA,
     FECHA_VENCIMIENTO =:FECHA_VENCIMIENTO,
     PRECIO_TIPO_UNIDAD =:PRECIO_TIPO_UNIDAD,
     TIPO_UNIDAD=:TIPO_UNIDAD
     Where codigo =:CODIGO_producto;  
   end
   Suspend;
end^
SET TERM ; ^

GRANT EXECUTE
 ON PROCEDURE PROC_UPDATE_INV_PED TO  DIVISON;



-- TODO:
-- * add triggers and their ddl
-- * for each trigger, look for dependent generators via dependecies


