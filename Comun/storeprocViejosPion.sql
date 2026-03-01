
/*  Procedure PROC_ACT_BALANCE_CTE_CXC  */
CREATE PROCEDURE PROC_ACT_BALANCE_CTE_CXC (
  CODIGO_CTE INTEGER,
  CODIGO_SERVICIO INTEGER,
  MONEDA CHAR(1),
  ORIGEN SMALLINT,
  MONTO NUMERIC(15, 2),
  FECHATRN DATE,
  NUMEROTRN INTEGER
)  AS               
DECLARE VARIABLE EXISTE SMALLINT;
begin
  EXISTE = -1;
  SELECT CODIGO FROM BALANCE_CTE 
  WHERE CODIGO =:CODIGO_CTE
        AND SERVICIO=:CODIGO_SERVICIO
        AND MONEDA=:MONEDA   

  INTO :EXISTE;


  if (:ORIGEN = 1) then /* DEBITO */
  begin
    IF (EXISTE > 0) THEN
    BEGIN
      UPDATE BALANCE_CTE
      SET 
         BALANCE_ANT = BALANCE_ACT,
         BALANCE_ACT = BALANCE_ACT + :MONTO,
         DEBITO_MES  =  DEBITO_MES + :MONTO,
         DEBITO_ACM  =  DEBITO_ACM + :MONTO
      WHERE CODIGO =:CODIGO_CTE
        AND SERVICIO=:CODIGO_SERVICIO
        AND MONEDA=:MONEDA; 

      UPDATE TRANS_CXC
        SET STATUS = "R" 
      WHERE SERIE = :NUMEROTRN;
    END ELSE
    BEGIN
       INSERT INTO BALANCE_CTE(
       CODIGO,        SERVICIO,    MONEDA,       CTA1_BCE,
       CTA2_BCE,      CTA3_BCE,    BALANCE_ACT,
       BALANCE_ANT,   DEBITO_MES,  CREDITO_MES,
       DEBITO_ACM,    CREDITO_ACM, FECHA_BCE ,
       FECHA_ULT_PAGO,STATUS_BCE)
       
       VALUES (:CODIGO_CTE, :CODIGO_SERVICIO, :MONEDA,NULL,NULL,NULL,
               :MONTO,0,:MONTO,0,:MONTO,0,"TODAY",NULL,"A");

      UPDATE TRANS_CXC
        SET STATUS = "R" 
      WHERE SERIE = :NUMEROTRN;

    END    
  end else 
  if (:ORIGEN = 2) then  /* CREDITO */
  begin
    IF (EXISTE > 0) THEN
    BEGIN
       UPDATE BALANCE_CTE
      SET 
         BALANCE_ANT = BALANCE_ACT,
         BALANCE_ACT = BALANCE_ACT - :MONTO,
         CREDITO_MES  =  CREDITO_MES + :MONTO,
         CREDITO_ACM  =  CREDITO_ACM + :MONTO,
         FECHA_ULT_PAGO=:fechatrn
      WHERE CODIGO =:CODIGO_CTE
        AND SERVICIO=:CODIGO_SERVICIO
        AND MONEDA=:MONEDA; 

      UPDATE TRANS_CXC
        SET STATUS = "R" 
      WHERE SERIE = :NUMEROTRN;

    END ELSE
    BEGIN
       INSERT INTO BALANCE_CTE(
       CODIGO,        SERVICIO,    MONEDA,       CTA1_BCE,
       CTA2_BCE,      CTA3_BCE,    BALANCE_ACT,
       BALANCE_ANT,   DEBITO_MES,  CREDITO_MES,
       DEBITO_ACM,    CREDITO_ACM, FECHA_BCE ,
       FECHA_ULT_PAGO,STATUS_BCE)
       
       VALUES (:CODIGO_CTE, :CODIGO_SERVICIO, :MONEDA,NULL,NULL,NULL,
               -:MONTO,0,0,:MONTO,0,:MONTO,:FECHATRN,:FECHATRN,"A"); 

      UPDATE TRANS_CXC
        SET STATUS = "R" 
      WHERE SERIE = :NUMEROTRN;

   END    
  end
end
---

/*  Procedure PROC_ACTUALIZAINVENTARIO  */
CREATE PROCEDURE PROC_ACTUALIZAINVENTARIO (
  CODIGO_TEXTO VARCHAR(12),
  NUEVACANTIDAD NUMERIC(15, 2),
  TIPOTRN SMALLINT
)  AS    
begin
  if (:tipotrn = 0) then /* Venta */
  begin
    update inventario_producto
    set cantidad = cantidad - :NuevaCantidad,
      Blce_cant_salida = Blce_cant_salida - :nuevacantidad
    Where Upper(codigo_texto) = upper(:codigo_texto);
  end else 
  if (:tipotrn = 1) then  /* Compra */
  begin
    update inventario_producto
    set cantidad = cantidad + :NuevaCantidad,
      Blce_cant_entrada = Blce_cant_entrada + :nuevacantidad
    Where Upper(codigo_texto) = upper(:codigo_texto);
  end
end
---

/*  Procedure PROC_BALANCE_CXC  */
CREATE PROCEDURE PROC_BALANCE_CXC (
  CODIGOCTEINI INTEGER,
  CODIGOCTEFIN INTEGER,
  FECHAINI DATE,
  FECHAFIN DATE,
  MONEDA CHAR(1),
  FECHA_BLC_ANTERIOR DATE
) RETURNS (
  CODIGO_CLIENTE INTEGER,
  DEBITO NUMERIC(15, 2),
  CREDITO NUMERIC(15, 2),
  BALANCE_ANT NUMERIC(15, 2)
) AS               
          
BEGIN
  FOR
    SELECT 
      DISTINCT codigo_cte      
    FROM clientes
    Where codigo_cte between :codigocteini and :codigoctefin    
    AND MONEDA_fact =:MONEDA 
    INTO
      :Codigo_cliente 
  DO
  BEGIN
    SELECT                  
          sum(TRANS_CXC.VALOR_DOCUMENTO)
    FROM TRANS_CXC
    Where fecha between :fechaini and :fechafin
     and codigo_cliente =:codigo_cliente
    and tipo_tranf = 1 
    and status in ("R","A")   
    AND MONEDA =:MONEDA
    INTO    
      :DEBITO;

    SELECT                       
       sum(TRANS_CXC.VALOR_DOCUMENTO) * -1
       FROM TRANS_CXC
    Where fecha between :fechaini and :fechafin
    and codigo_cliente =:CODIGO_CLIENTE
    AND MONEDA =:MONEDA 
    and tipo_tranf = 2 
    and status in ("R","A")   
    INTO
           :CREDITO;

    SELECT
           BALANCE_ACT
     FROM BLCE_CTE_HISTORICO 
     WHERE 
     FECHA_HISTORICO = :fecha_blc_anterior
     and CODIGO =:CODIGO_CLIENTE
     and MONEDA =:MONEDA   

    INTO  
      :BALANCE_ANT;
    SUSPEND;
  END

END
---

/*  Procedure PROC_BUSCANOMBCTEYBLC  */
CREATE PROCEDURE PROC_BUSCANOMBCTEYBLC (
  CODIGO_CLIENTE INTEGER
) RETURNS (
  NOMBRECLIENTE VARCHAR(60),
  BALANCEACTUAL NUMERIC(15, 2)
) AS         
begin
  for    
  Select nombre_facturar from clientes
  where codigo_cte =:codigo_cliente
  into :nombrecliente
DO
  BEGIN
    Select sum(b.balance_act) from balance_cte b
    where b.codigo=:codigo_cliente
    Into :balanceactual; 
    SUSPEND;
  END

end
---

/*  Procedure PROC_DATOS_VENTA_DIA_MES  */
CREATE PROCEDURE PROC_DATOS_VENTA_DIA_MES (
  FECHAINI DATE,
  FECHAFIN DATE
) RETURNS (
  MES SMALLINT,
  DIA SMALLINT,
  MONEDA CHAR(1),
  MONTO NUMERIC(15, 2)
) AS                 
BEGIN
  FOR
    SELECT f_month(FECHA), f_DayofMonth(fecha), MONEDA, SUM(debito+credito)
    FROM Proc_datos_venta_diaria(:FECHAINI,:FECHAFIN)
    Group By MONEDA, FECHA    
    INTO 
    :MES, :DIA, :MONEDA, :MONTO
  DO
  BEGIN
    SUSPEND;
  END
END
---

/*  Procedure PROC_DATOS_VENTA_DIARIA  */
CREATE PROCEDURE PROC_DATOS_VENTA_DIARIA (
  FECHAINI DATE,
  FECHAFIN DATE
) RETURNS (
  CODIGO_CLIENTE INTEGER,
  NOMBRE_FACTURAR VARCHAR(40),
  NUMERO_DOCUMENTO INTEGER,
  VALOR_DOCUMENTO NUMERIC(15, 2),
  TIPO_TRANF SMALLINT,
  MONEDA CHAR(1),
  FECHA DATE,
  TIPO_DOC INTEGER,
  STATUS CHAR(1),
  DEBITO NUMERIC(15, 2),
  CREDITO NUMERIC(15, 2),
  TIPO_DOCUMENTO VARCHAR(30),
  NOMBRE_VENDEDOR VARCHAR(35),
  CODIGO_EMPLEADO INTEGER,
  CODIGO_PRODUCTO VARCHAR(12),
  PRECIO_PRODUCTO INTEGER,
  DESCUENTO NUMERIC(15, 2),
  DESCRIPCION_PRODUCTO VARCHAR(60),
  CANTIDAD NUMERIC(15, 2)
) AS                
BEGIN
  FOR
    SELECT TRANS_CXC.CODIGO_CLIENTE,
           CLIENTES.NOMBRE_FACTURAR,
           TRANS_CXC.NUMERO_DOC,
           TRANS_CXC.VALOR_DOCUMENTO,           
           TRANS_CXC.TIPO_TRANF,
           TRANS_CXC.MONEDA,
           TRANS_CXC.FECHA,
           TRANS_CXC.TIPO_DOC,
           TRANS_CXC.STATUS,0,0, DOC_TRAN_CXT.DESCRIPCION,
           EMPLEADO.NOMBRE||" "||EMPLEADO.APELLIDO,
           EMPLEADO.CODIGO            
           
FROM CLIENTES
   INNER JOIN TRANS_CXC ON (CLIENTES.CODIGO_CTE = TRANS_CXC.CODIGO_CLIENTE)
   INNER JOIN DOC_TRAN_CXT ON (TRANS_CXC.TIPO_DOC = DOC_TRAN_CXT.CODIGO)
   INNER JOIN EMPLEADO ON (EMPLEADO.CODIGO = TRANS_CXC.CODIGO_VENDEDOR)

    WHERE 
       ((FECHA Between :Fechaini And :Fechafin)
       And   
          (TRANS_CXC.NUMERO_TRN_VENTA IS NULL )
       And 
          (TRANS_CXC.STATUS IN ("A","R"))
       )

    INTO
      :CODIGO_CLIENTE,
      :NOMBRE_FACTURAR,
      :NUMERO_DOCUMENTO,      
      :VALOR_DOCUMENTO,
      :TIPO_TRANF,
      :MONEDA,
      :FECHA,
      :TIPO_DOC,
      :STATUS, :debito, :credito, :TIPO_DOCUMENTO,
      :NOMBRE_VENDEDOR,:CODIGO_EMPLEADO
  DO
  BEGIN
    if (:tipo_tranf = 1) then
    begin
      debito = :valor_documento;
    end else 
    begin
      credito = :valor_documento;     
    end
    SUSPEND;
  END
/* VENTA PROCESADAS EN NUEVO SISTEMA  ENERO-2006 */

/* venta counter */
FOR
SELECT VENTAS_MAST.CODIGO_CTE,
       CLIENTES.NOMBRE_FACTURAR,
       VENTAS_MAST.NUMERO_FACTURA,
       VENTAS_DET.VALOR_TOTAL_DET,
       2,VENTAS_MAST.MONEDA,
       VENTAS_MAST.FECHA,
       VENTAS_MAST.FORMA_PAGO,
       VENTAS_MAST.STATUS,
       0,
       0,
       TIPO_PAGO.DESCRIPCION,
       EMPLEADO.NOMBRE||" "||EMPLEADO.APELLIDO AS NOMBRE,
       EMPLEADO.CODIGO,
       VENTAS_DET.CODIGO_PROD,
       VENTAS_DET.PRECIO,
       VENTAS_DET.PORC_DESC_DET,
       VENTAS_DET.DESCRIPCION, Ventas_Det.cantidad
FROM EMPLEADO
   INNER JOIN VENTAS_MAST ON (EMPLEADO.CODIGO = VENTAS_MAST.CODIGO_VENDEDOR)
   INNER JOIN VENTAS_DET ON (VENTAS_MAST.NUMERO = VENTAS_DET.NUMERO)
   INNER JOIN CLIENTES ON (VENTAS_MAST.CODIGO_CTE = CLIENTES.CODIGO_CTE)
   INNER JOIN TIPO_PAGO ON (VENTAS_MAST.FORMA_PAGO = TIPO_PAGO.CODIGO)    
   WHERE 
       ((VENTAS_MAST.FECHA Between :Fechaini And :Fechafin)
       And 
          (VENTAS_MAST.STATUS IN ("A","R","D","P"))
       )

    INTO
      :CODIGO_CLIENTE,
      :NOMBRE_FACTURAR,
      :NUMERO_DOCUMENTO,      
      :VALOR_DOCUMENTO,
      :TIPO_TRANF,
      :MONEDA,
      :FECHA,
      :TIPO_DOC,
      :STATUS, :debito, :credito, :TIPO_DOCUMENTO,
      :NOMBRE_VENDEDOR, :CODIGO_EMPLEADO,
      :CODIGO_PRODUCTO,
      :PRECIO_PRODUCTO,
      :DESCUENTO,
      :DESCRIPCION_PRODUCTO, :cantidad
  DO
  BEGIN
    if (:tipo_tranf = 1) then
    begin
      debito = :valor_documento;
    end else 
    begin
      credito = :valor_documento;     
    end
    SUSPEND;
  END
END
---

/*  Procedure PROC_ESTADO_CTA_CXC  */
CREATE PROCEDURE PROC_ESTADO_CTA_CXC (
  FECHAINI DATE,
  FECHAFIN DATE,
  CODIGOCTE INTEGER
) RETURNS (
  TIPOSERVICIO INTEGER,
  DESCRIPCION VARCHAR(40),
  FECHA_DET DATE,
  CODIGO_CTE INTEGER,
  NOMBRE_FACTURAR VARCHAR(40),
  NOMBRE_CLIENTE_DET VARCHAR(40),
  DIRECCION_CONT VARCHAR(60),
  FAX_CONTACTO VARCHAR(14),
  WEBSITE VARCHAR(40),
  PAIS VARCHAR(30),
  CIUDAD VARCHAR(30),
  CANTIDAD_DETA INTEGER,
  CANT_ADULTO_DETA INTEGER,
  TARIFA_SERV_DETA NUMERIC(15, 2),
  MONEDA_DET CHAR(1),
  PORC_DESC_DET NUMERIC(15, 2),
  VALOR_SERVICIO_DET NUMERIC(15, 2),
  VALOR_TOTAL_DET NUMERIC(15, 2),
  NUM_FACT_DET INTEGER,
  NUMERO_RECIBO INTEGER,
  IMPUESTO_SERV_DET NUMERIC(15, 2),
  STATUS_DET CHAR(1),
  COD_AREA_FACT INTEGER,
  CONTACTO VARCHAR(40),
  TELEF_CONTACTO VARCHAR(14),
  EMAIL VARCHAR(40),
  AREA VARCHAR(20),
  ORIGEN INTEGER,
  VALOR_INGRESO_RECIBO NUMERIC(15, 2),
  TIPO_DOC SMALLINT,
  DEBITO NUMERIC(15, 2),
  CREDITO NUMERIC(15, 2)
) AS                        
begin
  For 
      Select 
           tiposervicio,
           DESCRIPCION, 
           FECHA_DET, 
           CODIGO_CTE, 
           NOMBRE_FACTURAR, 
           NOMBRE_CLIENTE_DET, 
           DIRECCION_CONT,
           FAX_CONTACTO,
           WEBSITE,
           PAIS,
           CIUDAD,

           CANTIDAD_DETA, 
           CANT_ADULTO_DETA, 
           TARIFA_SERV_DETA, 
           MONEDA_DET, 
           PORC_DESC_DET, 
           VALOR_SERVICIO_DET, 
           VALOR_TOTAL_DET, 
           NUM_FACT_DET, 
           null,
           IMPUESTO_SERV_DET, 
           STATUS_DET, 
           COD_AREA_FACT, 
           CONTACTO, 
           TELEF_CONTACTO, 
           EMAIL,
           AREA,
           origen,
           valor_ingreso_recibo,
           Tipo_doc,
           VALOR_TOTAL_DET DEBITO,
           0 CREDITO

        From PROC_SERV (:FECHAINI,:FECHAFIN)
        Where codigo_cte =:CODIGOCTE
        And origen = 1 

        Into 
           :tiposervicio,
           :DESCRIPCION, 
           :FECHA_DET, 
           :CODIGO_CTE, 
           :NOMBRE_FACTURAR, 
           :NOMBRE_CLIENTE_DET, 
           :DIRECCION_CONT,
           :FAX_CONTACTO,
           :WEBSITE,
           :PAIS,
           :CIUDAD,

           :CANTIDAD_DETA, 
           :CANT_ADULTO_DETA, 
           :TARIFA_SERV_DETA, 
           :MONEDA_DET, 
           :PORC_DESC_DET, 
           :VALOR_SERVICIO_DET, 
           :VALOR_TOTAL_DET, 
           :NUM_FACT_DET, 
           :numero_recibo,
           :IMPUESTO_SERV_DET, 
           :STATUS_DET, 
           :COD_AREA_FACT, 
           :CONTACTO, 
           :TELEF_CONTACTO, 
           :EMAIL,
           :AREA,
           :origen,
           :valor_ingreso_recibo,
           :Tipo_doc,
           :DEBITO,
           :CREDITO

Do 
 Suspend;

 For 
      Select 
           tiposervicio,
           DESCRIPCION, 
           FECHA_DET, 
           CODIGO_CTE, 
           NOMBRE_FACTURAR, 
           NOMBRE_CLIENTE_DET, 
           DIRECCION_CONT,
           FAX_CONTACTO,
           WEBSITE,
           PAIS,
           CIUDAD,

           CANTIDAD_DETA, 
           CANT_ADULTO_DETA, 
           TARIFA_SERV_DETA, 
           MONEDA_DET, 
           PORC_DESC_DET, 
           VALOR_SERVICIO_DET, 
           VALOR_TOTAL_DET, 
           null, 
           numero_recibo,
           IMPUESTO_SERV_DET, 
           STATUS_DET, 
           COD_AREA_FACT, 
           CONTACTO, 
           TELEF_CONTACTO, 
           EMAIL,
           AREA,
           origen,
           valor_ingreso_recibo,
           Tipo_doc,
           0 DEBITO,
           VALOR_INGRESO_RECIBO CREDITO

        From PROC_SERV (:FECHAINI,:FECHAFIN)
        Where codigo_cte =:CODIGOCTE
        And origen = 2 

        Into 
           :tiposervicio,
           :DESCRIPCION, 
           :FECHA_DET, 
           :CODIGO_CTE, 
           :NOMBRE_FACTURAR, 
           :NOMBRE_CLIENTE_DET, 
           :DIRECCION_CONT,
           :FAX_CONTACTO,
           :WEBSITE,
           :PAIS,
           :CIUDAD,

           :CANTIDAD_DETA, 
           :CANT_ADULTO_DETA, 
           :TARIFA_SERV_DETA, 
           :MONEDA_DET, 
           :PORC_DESC_DET, 
           :VALOR_SERVICIO_DET, 
           :VALOR_TOTAL_DET, 
           :NUM_FACT_DET, 
           :numero_recibo,
           :IMPUESTO_SERV_DET, 
           :STATUS_DET, 
           :COD_AREA_FACT, 
           :CONTACTO, 
           :TELEF_CONTACTO, 
           :EMAIL,
           :AREA,
           :origen,
           :valor_ingreso_recibo,
           :Tipo_doc,
           :DEBITO,
           :CREDITO

Do 
 Suspend;
End
---

/*  Procedure PROC_HISTBCECXC  */
CREATE PROCEDURE PROC_HISTBCECXC (
  ACTUAL SMALLINT
) RETURNS (
  CODIGO INTEGER,
  SERVICIO INTEGER,
  FECHA_HISTORICO DATE,
  MONEDA CHAR(1),
  BALANCE_ACT NUMERIC(15, 2),
  BALANCE_ANT NUMERIC(15, 2),
  DEBITO_MES NUMERIC(15, 2),
  CREDITO_MES NUMERIC(15, 2),
  DEBITO_ACM NUMERIC(15, 2),
  CREDITO_ACM NUMERIC(15, 2),
  STATUS CHAR(1)
) AS   
  BEGIN
   IF (:ACTUAL = 0) THEN
   BEGIN
     FOR 
       SELECT   
       CODIGO,
       SERVICIO,  
       FECHA_HISTORICO,
       MONEDA, 
       BALANCE_ACT,
       BALANCE_ANT,
       DEBITO_MES,
       CREDITO_MES,
       DEBITO_ACM,
       CREDITO_ACM,
       STATUS
     FROM BLCE_CTE_HISTORICO
     INTO
       :CODIGO,
       :SERVICIO,  
       :FECHA_HISTORICO,
       :MONEDA,
       :BALANCE_ACT,
       :BALANCE_ANT,
       :DEBITO_MES,
       :CREDITO_MES,
       :DEBITO_ACM,
       :CREDITO_ACM,
       :STATUS
DO 
 SUSPEND;
end
   IF (:ACTUAL = 1) THEN
   BEGIN
     FOR 
     SELECT   
       CODIGO,
       SERVICIO,  
       FECHA_bce,
       MONEDA,
       BALANCE_ACT,
       BALANCE_ANT,
       DEBITO_MES,
       CREDITO_MES,
       DEBITO_ACM,
       CREDITO_ACM,
       STATUS_BCE
     FROM balance_cte
     INTO
       :CODIGO,
       :SERVICIO,  
       :FECHA_HISTORICO,
       :MONEDA,
       :BALANCE_ACT,
       :BALANCE_ANT,
       :DEBITO_MES,
       :CREDITO_MES,
       :DEBITO_ACM,
       :CREDITO_ACM,
       :STATUS
     DO 
     SUSPEND;      
    END
  END
---

/*  Procedure PROC_INSERTAR_HIST_BLC  */
CREATE PROCEDURE PROC_INSERTAR_HIST_BLC (
  CODIGO INTEGER,
  SERVICIO INTEGER,
  MONEDA CHAR(1),
  FECHA_HISTORICO DATE,
  BALANCE_ACT NUMERIC(15, 2),
  BALANCE_ANT NUMERIC(15, 2),
  DEBITO_MES NUMERIC(15, 2),
  CREDITO_MES NUMERIC(15, 2),
  DEBITO_ACM NUMERIC(15, 2),
  CREDITO_ACM NUMERIC(15, 2),
  STATUS CHAR(1)
)  AS    
BEGIN
  Insert into BLCE_CTE_HISTORICO_nuevo
  (CODIGO,
  SERVICIO,
  MONEDA,
  FECHA_HISTORICO,
  BALANCE_ACT,
  BALANCE_ANT,
  DEBITO_MES,
  CREDITO_MES,
  DEBITO_ACM,
  CREDITO_ACM,
  STATUS)
  Values
  (:CODIGO,
   :SERVICIO,
   :MONEDA,
   :FECHA_HISTORICO,
   :BALANCE_ACT,
   :BALANCE_ANT,
   :DEBITO_MES,
   :CREDITO_MES,
   :DEBITO_ACM,
   :CREDITO_ACM,
   :STATUS);  
END
---

/*  Procedure PROC_INSERTARTRANCXC  */
CREATE PROCEDURE PROC_INSERTARTRANCXC (
  TIPO_DOC INTEGER,
  MONEDA CHAR(1),
  FECHA DATE,
  NUMERO_DOC INTEGER,
  CODIGO_CLIENTE INTEGER,
  CODIGO_SERV INTEGER,
  CONCEPTO VARCHAR(60),
  VALOR_DOCUMENTO NUMERIC(15, 2),
  TIPO_TRANF SMALLINT,
  STATUS CHAR(1),
  TIPO_SERV INTEGER,
  NUMERO_TRN_VENTA INTEGER,
  CODIGO_VENDEDOR INTEGER
)  AS   
declare variable gen_serie integer;
begin
  
  Select Gen_id(GEN_SERIE_TRN_CXC,1) From rdb$database
  Into 
  :Gen_serie;
  
  Insert into TRANS_CXC
  (SERIE, TIPO_DOC, MONEDA, FECHA, NUMERO_DOC, CODIGO_CLIENTE, CODIGO_SERV, 
   CONCEPTO, VALOR_DOCUMENTO, TIPO_TRANF, STATUS, TIPO_SERV,numero_trn_venta,codigo_vendedor)
  Values
  (:Gen_Serie, :TIPO_DOC, :MONEDA, :FECHA, :NUMERO_DOC, :CODIGO_CLIENTE, :CODIGO_SERV, 
   :CONCEPTO, :VALOR_DOCUMENTO, :TIPO_TRANF, :STATUS, :TIPO_SERV,:numero_trn_venta,:codigo_vendedor);
end
---

/*  Procedure PROC_SERV  */
CREATE PROCEDURE PROC_SERV (
  FECHAINI DATE,
  FECHAFIN DATE
) RETURNS (
  TIPOSERVICIO INTEGER,
  DESCRIPCION VARCHAR(40),
  FECHA_DET DATE,
  CODIGO_CTE INTEGER,
  NOMBRE_FACTURAR VARCHAR(40),
  NOMBRE_CLIENTE_DET VARCHAR(40),
  DIRECCION_CONT VARCHAR(60),
  FAX_CONTACTO VARCHAR(14),
  WEBSITE VARCHAR(40),
  PAIS VARCHAR(30),
  CIUDAD VARCHAR(30),
  CANTIDAD_DETA INTEGER,
  CANT_ADULTO_DETA INTEGER,
  TARIFA_SERV_DETA NUMERIC(15, 2),
  MONEDA_DET CHAR(1),
  PORC_DESC_DET NUMERIC(15, 2),
  VALOR_SERVICIO_DET NUMERIC(15, 2),
  VALOR_TOTAL_DET NUMERIC(15, 2),
  NUM_FACT_DET INTEGER,
  NUMERO_RECIBO INTEGER,
  IMPUESTO_SERV_DET NUMERIC(15, 2),
  STATUS_DET CHAR(1),
  COD_AREA_FACT INTEGER,
  CONTACTO VARCHAR(40),
  TELEF_CONTACTO VARCHAR(14),
  EMAIL VARCHAR(40),
  AREA VARCHAR(20),
  ORIGEN INTEGER,
  VALOR_INGRESO_RECIBO NUMERIC(15, 2),
  TIPO_DOC SMALLINT
) AS                     
begin


For 
SELECT 
Ingresos.TIPO,
tipo_cliente.DESCRIPCION, 
Ingresos.FECHA, 
Ingresos.CODIGO_CTE, 
Clientes.NOMBRE_FACTURAR, 
Ingresos.NOMBRE_CTE, 
   Clientes.DIRECCION_CONT,
   Clientes.FAX_CONTACTO,
   Clientes.WEBSITE,
   Clientes.PAIS,
   Clientes.CIUDAD,

0, 
0, 
0, 
Ingresos.MONEDA, 
0, 
Fctingresos.MONTO_FACT, 
Fctingresos.MONTO_FACT, 
Fctingresos.NUMERO_FACT, 
Ingresos.NUMERO, 
0,
Ingresos.status,
0,
Clientes.CONTACTO, 
Clientes.TELEF_CONTACTO, 
Clientes.EMAIL,
"Recibo Ing.",2,Ingresos.VALOR_ING,
2
FROM INGRESOS Ingresos
   INNER JOIN CLIENTES Clientes
   ON  (Ingresos.CODIGO_CTE = Clientes.CODIGO_CTE)  
   Inner join tipo_cliente tipo_cliente On
   (Clientes.tipo_cliente = tipo_cliente.CODIGO)  
   LEFT OUTER JOIN FCTINGRESOS Fctingresos
   ON  (Ingresos.NUMERO = Fctingresos.NUMERO)  
   AND  (Ingresos.TIPO = Fctingresos.TIPO)  
WHERE   Ingresos.STATUS IN ('A', 'P') 
   AND  (Ingresos.TIPO_ING = 2)  
   AND Ingresos.Fecha Between :fechaini And :fechafin
Into 
   :tiposervicio,
   :DESCRIPCION, 
   :FECHA_DET, 
   :CODIGO_CTE, 
   :NOMBRE_FACTURAR, 
   :NOMBRE_CLIENTE_DET, 
   :DIRECCION_CONT,
   :FAX_CONTACTO,
   :WEBSITE,
   :PAIS,
   :CIUDAD,

   :CANTIDAD_DETA, 
   :CANT_ADULTO_DETA, 
   :TARIFA_SERV_DETA, 
   :MONEDA_DET, 
   :PORC_DESC_DET, 
   :VALOR_SERVICIO_DET, 
   :VALOR_TOTAL_DET, 
   :NUM_FACT_DET, 
   :numero_recibo,
   :IMPUESTO_SERV_DET, 
   :STATUS_DET, 
   :COD_AREA_FACT, 
   :CONTACTO, 
   :TELEF_CONTACTO, 
   :EMAIL,
   :AREA,:origen,:valor_ingreso_recibo,:Tipo_doc

Do 
 Suspend;
/* Transacciones Cxc */
For
SELECT 
    Trans_cxc.TIPO_SERV,
    tipo_cliente.DESCRIPCION, 
    Trans_cxc.FECHA, 
    Clientes.CODIGO_cte, 
    Clientes.NOMBRE_FACTURAR, 
    Clientes.NOMBRE_CTE, 
   Clientes.DIRECCION_CONT,
   Clientes.FAX_CONTACTO,
   Clientes.WEBSITE,
   Clientes.PAIS,
   Clientes.CIUDAD,

    null,
    null,
    null,
    Trans_cxc.Moneda,
    Null,
    Trans_cxc.VALOR_DOCUMENTO, 
    Trans_cxc.VALOR_DOCUMENTO, 
    trans_cxc.numero_doc, 
    trans_cxc.numero_doc,
    null,
    Trans_cxc.STATUS, 
    null,
    Clientes.CONTACTO, 
    Clientes.TELEF_CONTACTO, 
    Clientes.EMAIL, 
    Doc_tran_cxt.Descripcion, Trans_cxc.tipo_tranf,
    Trans_cxc.VALOR_DOCUMENTO , Trans_cxc.tipo_doc
FROM TRANS_CXC Trans_cxc
   LEFT OUTER JOIN CLIENTES Clientes
   ON  (Trans_cxc.CODIGO_CLIENTE = Clientes.CODIGO_CTE)  
   LEFT OUTER JOIN FCTINGRESOS Fctingresos
   ON  (Trans_cxc.NUMERO_DOC = Fctingresos.NUMERO)  
   AND  (Trans_cxc.TIPO_DOC = Fctingresos.TIPO_DOC)  
   LEFT OUTER JOIN tipo_cliente tipo_cliente
   ON  (Clientes.tipo_cliente = tipo_cliente.CODIGO)  
   LEFT OUTER JOIN Doc_tran_cxt
   ON  (Trans_cxc.tipo_doc = Doc_tran_cxt.codigo)  
Where Trans_cxc.STATUS in ('A','R')
And Trans_cxc.tipo_doc in (1,2,3,5,10)
And Trans_cxc.FECHA BetWeen :fechaini And :fechafin
Into
   :tiposervicio,
   :DESCRIPCION, 
   :FECHA_DET, 
   :CODIGO_CTE, 
   :NOMBRE_FACTURAR, 
   :NOMBRE_CLIENTE_DET, 
   :DIRECCION_CONT,
   :FAX_CONTACTO,
   :WEBSITE,
   :PAIS,
   :CIUDAD,

   :CANTIDAD_DETA, 
   :CANT_ADULTO_DETA, 
   :TARIFA_SERV_DETA, 
   :MONEDA_DET, 
   :PORC_DESC_DET, 
   :VALOR_SERVICIO_DET, 
   :VALOR_TOTAL_DET, 
   :NUM_FACT_DET, 
   :numero_recibo,
   :IMPUESTO_SERV_DET, 
   :STATUS_DET, 
   :COD_AREA_FACT, 
   :CONTACTO, 
   :TELEF_CONTACTO, 
   :EMAIL, :AREA,:origen,:valor_ingreso_recibo,:Tipo_doc
Do
 Suspend;
End