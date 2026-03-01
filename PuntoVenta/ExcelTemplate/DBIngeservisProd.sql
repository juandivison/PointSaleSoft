/* SQL Manager 2005 for InterBase and Firebird 4.1.0.3             */
/* --------------------------------------------------------------- */
/* Host     : localhost1                                           */
/* Database : F:\Datos\PuntoVenta\Ingeservis\Prod\DBDATOS_DIST.FDB */


/* Definition for the `DYNAMICSAMPLETHREE` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE DYNAMICSAMPLETHREE(
  TEXTFIELD VARCHAR(100) CHARACTER SET NONE,
  TABLENAME VARCHAR(100) CHARACTER SET NONE)
RETURNS(
  LONGLINE VARCHAR(32000) CHARACTER SET NONE)
AS
declare variable Chunk varchar(100);
begin
  Chunk = 'hola';
  LongLine = '';
  for execute statement
   'select '|| '4*2' ||','|| TextField || ' from ' || TableName into :Chunk
  do
    if (Chunk is not null) then
      LongLine = LongLine || Chunk || ' | ';
  suspend;
end^

SET TERM ; ^

/* Definition for the `EJEMPLOEXECUTESTATEMENT3` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE EJEMPLOEXECUTESTATEMENT3
AS
DECLARE VARIABLE cPedazo Varchar(100);
BEGIN
   cPedazo = '';
   EXECUTE STATEMENT 'select * from catalogo';
   /*
   FOR EXECUTE STATEMENT
      'SELECT ' || :cColumnaTexto || ' FROM ' || :cNombreTabla into :cPedazo
   DO BEGIN
      IF (cPedazo IS NOT NULL) THEN
         cLineaLarga = cLineaLarga || cPedazo || ' ';
      SUSPEND;
   END 
   EXECUTE STATEMENT
      'SELECT ' || :cColumnaTexto || ' FROM ' || :cNombreTabla  into :cPedazo;
      */
END^

SET TERM ; ^

/* Definition for the `PORC_APLICADO_COTIZA_SERV_S1` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PORC_APLICADO_COTIZA_SERV_S1
RETURNS(
  NUMERO_TRN INTEGER,
  PORCGADMIN NUMERIC(15, 2),
  PORCITBISGADMIN NUMERIC(15, 2),
  PORCTRANS NUMERIC(15, 2),
  PORCDIRTEC NUMERIC(15, 2),
  PORCITBISDIRTEC NUMERIC(15, 2),
  PORCIMPREVISTO NUMERIC(15, 2),
  PORCITBISIMPREVISTO NUMERIC(15, 2))
AS
BEGIN
  FOR SELECT NUMERO_TRN,
             PORCGADMIN,
             PORCITBISGADMIN,
             PORCTRANS,
             PORCDIRTEC,
             PORCITBISDIRTEC,
             PORCIMPREVISTO,
             PORCITBISIMPREVISTO
  FROM PORC_APLICADO_COTIZA_SERV
  INTO :NUMERO_TRN,
       :PORCGADMIN,
       :PORCITBISGADMIN,
       :PORCTRANS,
       :PORCDIRTEC,
       :PORCITBISDIRTEC,
       :PORCIMPREVISTO,
       :PORCITBISIMPREVISTO
  DO
    BEGIN
      SUSPEND;
    END
END^

SET TERM ; ^

/* Definition for the `PROCFACT_CXPPENDIENTE` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROCFACT_CXPPENDIENTE(
  CODIGO_PROV INTEGER,
  TIPO INTEGER,
  MONEDA CHAR(1) CHARACTER SET NONE,
  NUMERO_FACT INTEGER,
  MONTO_PENDIENTE FLOAT,
  STATUS CHAR(1) CHARACTER SET NONE,
  ACCION SMALLINT)
RETURNS(
  VALOR_PENDIENTE FLOAT)
AS
BEGIN
  IF (:ACCION = 1) THEN
  BEGIN
    UPDATE FACTURAS_cxp_PENDIENTES
    SET MONTO_PENDIENTE = :MONTO_PENDIENTE
    WHERE CODIGO_PROV =:CODIGO_PROV
          AND TIPO =:TIPO
          AND MONEDA =:MONEDA
          AND NUMERO_FACT =:NUMERO_FACT;
  END ELSE
  if (:accion = -1) then
  begin
    SELECT MONTO_PENDIENTE from  FACTURAS_cxp_PENDIENTES
    WHERE CODIGO_PROV=:CODIGO_PROV
    AND TIPO =:TIPO
    AND MONEDA =:MONEDA
    AND NUMERO_FACT =:NUMERO_FACT
    INTO :VALOR_PENDIENTE;
  end
END^

SET TERM ; ^

/* Definition for the `PROCFACT_PENDIENTE` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROCFACT_PENDIENTE(
  TIPO INTEGER,
  MONEDA CHAR(1) CHARACTER SET NONE,
  NUMERO_FACT INTEGER,
  MONTO_PENDIENTE FLOAT,
  STATUS CHAR(1) CHARACTER SET NONE,
  ACCION SMALLINT)
RETURNS(
  VALOR_PENDIENTE FLOAT)
AS
BEGIN
  IF (:ACCION = 1) THEN
  BEGIN
    UPDATE FACTURAS_PENDIENTES 
    SET MONTO_PENDIENTE = :MONTO_PENDIENTE
    WHERE TIPO = :TIPO AND MONEDA = :MONEDA
          AND NUMERO_FACT = :NUMERO_FACT;
  END else 
  if (:accion = -1) then
  begin
    SELECT MONTO_PENDIENTE from  FACTURAS_PENDIENTES 
    WHERE TIPO = :TIPO AND MONEDA = :MONEDA
    AND NUMERO_FACT = :NUMERO_FACT
    INTO :VALOR_PENDIENTE;
  end
END^

SET TERM ; ^

/* Definition for the `PROCFACT_SALDAR` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROCFACT_SALDAR(
  NUMERO_FACT INTEGER)
AS
BEGIN
  UPDATE FACTURAS
  SET STATUS = 'S'
  WHERE (NUMERO =:NUMERO_FACT)
  AND (STATUS = 'F') 
  AND (RCXC = 'R');
  SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROCGETDESCFACTSERVICIO` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROCGETDESCFACTSERVICIO(
  SUBTOTAL NUMERIC(15, 2))
RETURNS(
  TIPO SMALLINT,
  DESCRIPCION VARCHAR(60) CHARACTER SET NONE,
  PORCIENTO NUMERIC(15, 2),
  FORMULA VARCHAR(100) CHARACTER SET NONE,
  STATUS CHAR(1) CHARACTER SET NONE,
  MONTODESCUENTO NUMERIC(15, 2))
AS
DECLARE VARIABLE P_SQL_STMT VARCHAR(1024);
BEGIN
  FOR
    SELECT 
      c.TIPO,
      c.DESCRIPCION,
      c.PORCIENTO,
      c.FORMULA,
      c.STATUS
    FROM
      CONF_DESC_FACTURAS c

    INTO
      :TIPO,
      :DESCRIPCION,
      :PORCIENTO,
      :FORMULA,
      :STATUS
  DO
  BEGIN
    P_SQL_STMT = 'EXECUTE PROCEDURE  Proc_GetFacDescFormula(' || :tipo ||')';
    
    EXECUTE STATEMENT P_SQL_STMT 
    INTO
    :FORMULA;
    formula = REPLACE(formula,':nombrecampo','125');
    formula = REPLACE(formula,':Porciento',:Porciento);
    EXECUTE STATEMENT :formula into :MontoDescuento;
    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROCGETTEMPLATEXLS` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROCGETTEMPLATEXLS
RETURNS(
  NOMBRE_TEMPLATE VARCHAR(110) CHARACTER SET NONE,
  NOMBRE_ARCHIVO VARCHAR(110) CHARACTER SET NONE,
  SERIEID INTEGER,
  NUMEROID INTEGER,
  SECCION VARCHAR(30) CHARACTER SET NONE,
  NOMBRE_CAMPO VARCHAR(70) CHARACTER SET NONE,
  DESCRIPCION_LABEL VARCHAR(100) CHARACTER SET NONE,
  COLUMNA_NOMBRE VARCHAR(8) CHARACTER SET NONE,
  FILE_NUMERO VARCHAR(8) CHARACTER SET NONE,
  ISDETAIL SMALLINT,
  STATUS CHAR(1) CHARACTER SET NONE)
AS
BEGIN
  FOR
    SELECT 
      TEMPLATE_XLS_DOC.NOMBRE_TEMPLATE,
      TEMPLATE_XLS_MASTER.NOMBRE_ARCHIVO,
      TEMPLATE_XLS.SERIEID,
      TEMPLATE_XLS.NUMEROID,
      TEMPLATE_XLS.SECCION,
      TEMPLATE_XLS.NOMBRE_CAMPO,
      TEMPLATE_XLS.DESCRIPCION_LABEL,
      TEMPLATE_XLS.COLUMNA_NOMBRE,
      TEMPLATE_XLS.FILE_NUMERO,
      TEMPLATE_XLS.ISDETAIL,
      TEMPLATE_XLS.STATUS
    FROM
      TEMPLATE_XLS_MASTER
      INNER JOIN TEMPLATE_XLS ON (TEMPLATE_XLS_MASTER.NUMEROID = TEMPLATE_XLS.NUMEROID)
      INNER JOIN TEMPLATE_XLS_DOC ON (TEMPLATE_XLS_MASTER.IDDOC = TEMPLATE_XLS_DOC.IDDOC)
    where TEMPLATE_XLS.NOMBRE_CAMPO is not null
    and TEMPLATE_XLS.NOMBRE_CAMPO <> ''
    INTO
      :NOMBRE_TEMPLATE,
      :NOMBRE_ARCHIVO,
      :SERIEID,
      :NUMEROID,
      :SECCION,
      :NOMBRE_CAMPO,
      :DESCRIPCION_LABEL,
      :COLUMNA_NOMBRE,
      :FILE_NUMERO,
      :ISDETAIL,
      :STATUS
  DO
  BEGIN
    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROCREVERSARCOBROEST` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROCREVERSARCOBROEST(
  NUMERO_RECIBO INTEGER,
  CODUSUARIO INTEGER)
RETURNS(
  RESULTADO SMALLINT)
AS
--DECLARE VARIABLE variable_name < datatype>;
BEGIN
  resultado = 0;
  update INGRESOS 
  set STATUS = 'C'
  where NUMERO =:numero_recibo;
  
  update INGRESOS_DET d
  set status = 'C'
  where d.NUMERO_ING =:numero_recibo;
  
  update PAGOS_ESTUDIANTES p
  set p.STATUS = 'A',
  p.NUMERO_RECIBO = null,
  p.COD_USUARIO =:codUsuario
  where p.numero_recibo =:numero_recibo; 
  
  resultado = 1;
END^

SET TERM ; ^

/* Definition for the `PROC_ACTFECHACATLGO` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_ACTFECHACATLGO(
  FECHAACTUAL DATE)
AS
BEGIN
  update  catalogo
  set  fecha_act= :fechaactual;
END^

SET TERM ; ^

/* Definition for the `PROC_ACTNCF` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_ACTNCF(
  XSERIE CHAR(1) CHARACTER SET NONE,
  XDIV_NEGOCIO CHAR(2) CHARACTER SET NONE,
  XPECF CHAR(3) CHARACTER SET NONE,
  XAICF CHAR(3) CHARACTER SET NONE,
  XTIPO_CF CHAR(2) CHARACTER SET NONE)
RETURNS(
  XNCF DOUBLE PRECISION,
  SERIE CHAR(1) CHARACTER SET NONE,
  DIV_NEGOCIO CHAR(2) CHARACTER SET NONE,
  PECF CHAR(3) CHARACTER SET NONE,
  AICF CHAR(3) CHARACTER SET NONE,
  TIPO_CF CHAR(2) CHARACTER SET NONE,
  ERROR_DESC VARCHAR(40) CHARACTER SET NONE)
AS
DECLARE VARIABLE ESVALIDO SMALLINT;
begin

  SELECT MAX(NCF)+1,
  serie, 
  div_negocio, 
  pecf, 
  aicf, 
  tipo_cf
  FROM DGII_SERIE_NFC
  Where Activo = 1
  And serie =:xserie 
  And div_negocio = :xdiv_negocio
  And pecf = :xpecf
  and aicf = :xaicf
  And tipo_cf = :xtipo_cf

  Group by serie, div_negocio, pecf, aicf, tipo_cf
  INTO  :XNCF,
  :serie, 
  :div_negocio, 
  :pecf, 
  :aicf, 
  :tipo_cf;

  XSERIE = 0;

  SELECT * FROM  
  PROC_VERIFICA_SECNCF(:XNCF,:xtipo_cf,"ToDay")  
  INTO ESVALIDO;  
 
  IF (ESVALIDO = 1) THEN
  BEGIN
    Update DGII_SERIE_NFC
    Set NCF = :XNCF
    Where (Activo = 1)
    And (serie =:serie) 
    And (div_negocio =:div_negocio)
    And (pecf =:pecf)
    And (aicf =:aicf)
    And (tipo_cf =:tipo_cf); 
    ERROR_DESC="";   
  END ELSE ERROR_DESC= "NO HAY SECUENCIA NCF DISPONIBLE";
  SUSPEND;
end^

SET TERM ; ^

/* Definition for the `PROC_ACTUALIZAINVENTARIO` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_ACTUALIZAINVENTARIO(
  CODIGO_PRODUCTO INTEGER,
  NUEVACANTIDAD NUMERIC(15, 2),
  TIPOTRN SMALLINT,
  PORCODIGO SMALLINT)
AS
begin
  if (porcodigo = 0) then
  begin
    if (:tipotrn = 0) then /* Venta */
    begin
      update inventario_producto
      set cantidad = cantidad - :NuevaCantidad,
      Blce_cant_salida = Blce_cant_salida - :nuevacantidad,
      fecha_ultima_trn = "today"
      Where codigo_texto = :CODIGO_producto;
    end else
    if (:tipotrn = 1) then  /* Compra */
    begin
      update inventario_producto
      set cantidad = 0
      where cantidad is null and
      codigo_texto =:CODIGO_producto;
      update inventario_producto
      set cantidad = cantidad + :NuevaCantidad,
      Blce_cant_entrada = Blce_cant_entrada + :nuevacantidad,
      fecha_ultima_trn = "today"
      Where codigo_texto = :CODIGO_producto;
    end
  end else if (porcodigo =1) then
  begin
    if (:tipotrn = 0) then /* Venta */
    begin
      update inventario_producto
      set cantidad = 0
      where cantidad is null and
      codigo =:CODIGO_producto;
      update inventario_producto
      set cantidad = cantidad - :NuevaCantidad,
      Blce_cant_salida = Blce_cant_salida - :nuevacantidad,
      fecha_ultima_trn = "today"
     Where codigo = :CODIGO_producto;
    end else
    if (:tipotrn = 1) then  /* Compra */
    begin
      update inventario_producto
      set cantidad = 0
      where cantidad is null and
      codigo =:CODIGO_producto;
      update inventario_producto
      set cantidad = cantidad + :NuevaCantidad,
      Blce_cant_entrada = Blce_cant_entrada + :nuevacantidad,
      fecha_ultima_trn = "today"
      Where codigo = :CODIGO_producto;
    end
  end
  suspend;
end^

SET TERM ; ^

/* Definition for the `PROC_ACTUALIZAINVENTARIOFISICO` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_ACTUALIZAINVENTARIOFISICO(
  CODIGO_PRODUCTO INTEGER,
  NUEVACANTIDAD NUMERIC(15, 2),
  TIPOTRN SMALLINT,
  PORCODIGO SMALLINT,
  PRECIOCOMPRA NUMERIC(15, 2))
AS
begin
  if (porcodigo = 0) then
  begin
    if (:tipotrn = 0) then /* Venta */
    begin
      update inventario_producto
      set cantidad = cantidad - :NuevaCantidad,
      Blce_cant_salida = Blce_cant_salida - :nuevacantidad,
      fecha_ultima_trn = "TODAY"
      Where codigo_texto = :CODIGO_producto;
    end else
    if (:tipotrn = 1) then  /* Compra */
    begin
      update inventario_producto
      set cantidad = 0
      where cantidad is null and
      codigo_texto =:CODIGO_producto;
      
      update inventario_producto
      set cantidad = cantidad + :NuevaCantidad,
      Blce_cant_entrada = Blce_cant_entrada + :nuevacantidad,
      fecha_ultima_trn = "today",
      PRECIO_COMPRA = :PRECIOCOMPRA
      Where codigo_texto = :CODIGO_producto;
    end
  end else if (porcodigo =1) then
  begin
    if (:tipotrn = 0) then /* Venta */
    begin
      update inventario_producto
      set cantidad = 0
      where cantidad is null and
      codigo =:CODIGO_producto;
      
      update inventario_producto
      set cantidad = cantidad - :NuevaCantidad,
      Blce_cant_salida = Blce_cant_salida - :nuevacantidad,
      fecha_ultima_trn = "today"
     Where codigo = :CODIGO_producto;
    end else
    if (:tipotrn = 1) then  /* Compra */
    begin
      update inventario_producto
      set cantidad = 0
      where cantidad is null and
      codigo =:CODIGO_producto;
      
      update inventario_producto
      set cantidad = cantidad + :NuevaCantidad,
      Blce_cant_entrada = Blce_cant_entrada + :nuevacantidad,
      fecha_ultima_trn = "today",
      PRECIO_COMPRA = :PRECIOCOMPRA
      Where codigo = :CODIGO_producto;
    end
  end
  suspend;
end^

SET TERM ; ^

/* Definition for the `PROC_ACT_BALANCE_CTE_CXC` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_ACT_BALANCE_CTE_CXC(
  CODIGO_CTE INTEGER,
  CODIGO_SERVICIO INTEGER,
  MONEDA CHAR(1) CHARACTER SET NONE,
  ORIGEN SMALLINT,
  MONTO NUMERIC(15, 2),
  FECHATRN DATE,
  NUMEROTRN INTEGER)
AS
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
end^

SET TERM ; ^

/* Definition for the `PROC_ACT_BALANCE_PROV_CXP` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_ACT_BALANCE_PROV_CXP(
  CODIGO_CTE INTEGER,
  XTIPO INTEGER,
  MONEDA CHAR(1) CHARACTER SET NONE,
  ORIGEN SMALLINT,
  MONTO NUMERIC(15, 2),
  FECHATRN DATE,
  NUMEROTRN INTEGER)
AS
DECLARE VARIABLE EXISTE SMALLINT;
begin
  EXISTE = -1;
  SELECT Distinct CODIGO FROM BALANCE_CXP
  WHERE CODIGO =:CODIGO_CTE
        AND TIPO=:XTIPO
        AND MONEDA=:MONEDA

  INTO :EXISTE;

  if (:ORIGEN = 1) then /* DEBITO */
  begin
    IF (EXISTE >= 0) THEN
    BEGIN
      UPDATE BALANCE_CXP
      SET
         BALANCE_ANT = BALANCE_ACT,
         BALANCE_ACT = BALANCE_ACT + :MONTO,
         DEBITO_MES  =  DEBITO_MES + :MONTO,
         DEBITO_ACM  =  DEBITO_ACM + :MONTO
      WHERE CODIGO =:CODIGO_CTE
        AND TIPO=:XTIPO
        AND MONEDA=:MONEDA;

      UPDATE TRANS_CXP
        SET STATUS = "R"
      WHERE SERIE = :NUMEROTRN;
    END ELSE
    BEGIN
       INSERT INTO BALANCE_CXP (
       CODIGO,        TIPO,    MONEDA, BALANCE_ACT,
       BALANCE_ANT,   DEBITO_MES,  CREDITO_MES,
       DEBITO_ACM,    CREDITO_ACM, FECHA_BCE ,
       FECHA_ULT_PAGO,STATUS_BCE, FECHA_IN)

       VALUES (:CODIGO_CTE, :XTIPO, :MONEDA,
               :MONTO,0,:MONTO,0,:MONTO,0,"TODAY",NULL,"A", "TODAY");

      UPDATE TRANS_CXP
        SET STATUS = "R"
      WHERE SERIE = :NUMEROTRN;
    END
  END
 if (:ORIGEN = 2) then  /* CREDITO  */
  begin
     IF (:EXISTE >= 0) THEN
     BEGIN
         UPDATE BALANCE_CXP
         SET
             BALANCE_ANT = BALANCE_ACT,
             BALANCE_ACT = BALANCE_ACT - :MONTO,
             CREDITO_MES  =  CREDITO_MES + :MONTO,
             CREDITO_ACM  =  CREDITO_ACM + :MONTO,
             FECHA_ULT_PAGO=:fechatrn
        WHERE CODIGO =:CODIGO_CTE
        AND TIPO=:XTIPO
        AND MONEDA=:MONEDA;

        UPDATE TRANS_CXP
        SET STATUS = "R"
        WHERE SERIE = :NUMEROTRN;
    END  ELSE
    BEGIN
       INSERT INTO BALANCE_CXP(
       CODIGO,        TIPO,    MONEDA, BALANCE_ACT,
       BALANCE_ANT,   DEBITO_MES,  CREDITO_MES,
       DEBITO_ACM,    CREDITO_ACM, FECHA_BCE ,
       FECHA_ULT_PAGO,STATUS_BCE)

       VALUES (:CODIGO_CTE, :XTIPO, :MONEDA,
               -:MONTO,0,0,:MONTO,0,:MONTO,:FECHATRN,:FECHATRN,"A");

      UPDATE TRANS_CXP
        SET STATUS = "R"
      WHERE SERIE =:NUMEROTRN;
   END
 END

end^

SET TERM ; ^

/* Definition for the `PROC_ACT_CKSDANADO` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_ACT_CKSDANADO(
  SERIE DOUBLE PRECISION,
  NUM_TRANS DOUBLE PRECISION,
  NUMERO_CKS INTEGER,
  FECHA DATE,
  CODIGO_CIA INTEGER,
  SOL_EXPNO INTEGER,
  COD_BENEFICIARIO INTEGER,
  FECHA_EMISION DATE,
  BENEFICIARIO VARCHAR(60) CHARACTER SET NONE,
  MONTO NUMERIC(15, 2),
  FECHA_PAGO DATE,
  TIPO_CKS SMALLINT,
  COD_BANCO INTEGER,
  STATUS CHAR(1) CHARACTER SET NONE)
AS
Declare Variable xSerie Integer;
Declare Variable SERIE_TRNS Integer;
BEGIN  
  Select Gen_id(GEN_NUM_CKS,1) From rdb$database
  into :SERIE_TRNS;
  
  Select Gen_id(GEN_NUM_CKS_SERIE,1) From rdb$database
  Into :xSerie;
    
  xSerie =:SERIE_TRNS;
  Insert Into Cheques(
  NUM_TRANS,CODIGO_CIA,
  SOL_EXPNO,COD_BENEFICIARIO,
  FECHA_EMISION,BENEFICIARIO,
  MONTO,CONCEPTO,  NUMERO_CKS,FECHA_PAGO,
  TIPO_CKS,COD_BANCO,STATUS)  
 VALUES
 (:SERIE_TRNS,:CODIGO_CIA,
  :SOL_EXPNO,:COD_BENEFICIARIO,
  :FECHA_EMISION,'CKS NULO',
  :MONTO,NULL,  :NUMERO_CKS,:FECHA_PAGO,
  :TIPO_CKS,:COD_BANCO,"N");

  Insert Into CHEQUES_DET 
  (
   SERIE,NUM_TRANS,
   CUENTA1,CUENTA2,CUENTA3,
   CREDITO,DEBITO, STATUS,
   COD_DIST_CTA 
  )  
  VALUES
  (:xSerie,:SERIE_TRNS,
   ' ',' ',' ',
   0,0, "N",
   0
  );  
  
END^

SET TERM ; ^

/* Definition for the `PROC_ACT_CKSPDET` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_ACT_CKSPDET
RETURNS(
  ACTNO_SERIE DOUBLE PRECISION)
AS
BEGIN
  select serie+1 from SEC_CKS_PDET
  into :actno_serie;
  update SEC_CKS_PDET
  set serie = :actno_serie;
END^

SET TERM ; ^

/* Definition for the `PROC_ACT_FCTINGRESOS` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_ACT_FCTINGRESOS(
  SERIE INTEGER,
  NUMERO INTEGER,
  NUMERO_FACT INTEGER,
  MONTO_FACT NUMERIC(15, 2),
  MONEDA CHAR(1) CHARACTER SET NONE,
  STATUS CHAR(1) CHARACTER SET NONE,
  CODIGO_SERVICIO INTEGER,
  TIPO INTEGER,
  TIPO_DOC INTEGER)
AS
begin
  Insert into fctingresos(serie,numero,numero_fact,monto_fact,moneda,status,codigo_servicio,tipo,tipo_doc)
  Values (:serie,:numero,:numero_fact,:monto_fact,:moneda,:status,:codigo_servicio,:tipo,:tipo_doc);
end^

SET TERM ; ^

/* Definition for the `PROC_ACT_FCTPAGOSCXCP` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_ACT_FCTPAGOSCXCP(
  SERIE INTEGER,
  NUMERO INTEGER,
  NUMERO_FACT INTEGER,
  MONTO_FACT NUMERIC(15, 2),
  MONEDA CHAR(1) CHARACTER SET NONE,
  STATUS CHAR(1) CHARACTER SET NONE,
  CODIGO_SERVICIO INTEGER,
  TIPO INTEGER,
  TIPO_DOC INTEGER)
AS
begin
  Insert INTO FCTPAGOSCXCP(serie,numero,numero_fact,monto_fact,moneda,status,codigo_servicio,tipo,tipo_doc)
  Values (:serie,:numero,:numero_fact,:monto_fact,:moneda,:status,:codigo_servicio,:tipo,:tipo_doc);
end^

SET TERM ; ^

/* Definition for the `PROC_BALANCE_CAJA` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_BALANCE_CAJA(
  COD_CAJA INTEGER,
  ACCION INTEGER,
  MONTO NUMERIC(15, 2))
RETURNS(
  MONTO_BALANCE_ACTUAL NUMERIC(15, 2))
AS
BEGIN

    UPDATE caja
    SET 
    BALANCE_ACTUAL = 0
    WHERE COD_CAJA =:COD_CAJA AND 
    BALANCE_ACTUAL IS NULL;

    UPDATE caja
    SET 
    MONTO_RETIRADO_ACUM = 0    
    WHERE COD_CAJA =:COD_CAJA AND 
    MONTO_RETIRADO_ACUM IS NULL;

    UPDATE caja
    SET 
    MONTO_ENTRADA_ACUM = 0    
    WHERE COD_CAJA =:COD_CAJA AND
    MONTO_ENTRADA_ACUM IS NULL;


  IF (:ACCION = 1) THEN  /* SUMAR */
  BEGIN
    UPDATE caja
    SET 
    BALANCE_ANT = BALANCE_ACTUAL,
    BALANCE_ACTUAL = BALANCE_ACTUAL + :MONTO,
    MONTO_ENTRADA_ACUM = MONTO_ENTRADA_ACUM + :MONTO     
    WHERE COD_CAJA =:COD_CAJA;
  END else
  if (:accion = -1) then  /* RESTAR */
  begin
    UPDATE caja
    SET 
    BALANCE_ANT = BALANCE_ACTUAL,
    BALANCE_ACTUAL = BALANCE_ACTUAL - :MONTO,
    MONTO_RETIRADO_ACUM = MONTO_RETIRADO_ACUM + :MONTO     
    WHERE COD_CAJA =:COD_CAJA;
  end
  SELECT BALANCE_ACTUAL from CAJA
  WHERE COD_CAJA =:COD_CAJA
  INTO :MONTO_balance_actual;
END^

SET TERM ; ^

/* Definition for the `PROC_BALANCE_CTE_U1` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_BALANCE_CTE_U1(
  TIPOACCION SMALLINT,
  CODIGO INTEGER,
  SERVICIO INTEGER,
  MONEDA CHAR(1) CHARACTER SET NONE,
  BALANCE_ACT NUMERIC(15, 2),
  BALANCE_ANT NUMERIC(15, 2),
  DEBITO_MES NUMERIC(15, 2),
  DEBITO_ACM NUMERIC(15, 2),
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE)
AS
BEGIN
    if (tipoaccion = 0) then --anula cargo
    begin
      UPDATE BALANCE_CTE
      SET          
      BALANCE_ANT = :BALANCE_ACT,
      BALANCE_ACT = BALANCE_ACT - :BALANCE_ACT,        
      DEBITO_MES = DEBITO_MES - :DEBITO_MES,    
      DEBITO_ACM = DEBITO_ACM - :DEBITO_ACM,  
 
      FECHA_MOD = :FECHA_MOD,
      MOD_POR = :MOD_POR        
      WHERE
      (CODIGO = :CODIGO) AND 
     (SERVICIO = :SERVICIO) AND 
     (MONEDA = :MONEDA);
   end else  
  if (tipoaccion = 1) then --carga valor
  begin
    UPDATE BALANCE_CTE
    SET   
    BALANCE_ANT = :BALANCE_ACT,
    BALANCE_ACT = BALANCE_ACT + :BALANCE_ACT,        
    DEBITO_MES = DEBITO_MES + :DEBITO_MES,    
    DEBITO_ACM = DEBITO_ACM + :DEBITO_ACM, 
    FECHA_MOD = :FECHA_MOD,
    MOD_POR = :MOD_POR
   WHERE
      (CODIGO = :CODIGO) AND 
     (SERVICIO = :SERVICIO) AND 
     (MONEDA = :MONEDA);    
  end  
END^

SET TERM ; ^

/* Definition for the `PROC_BALANCE_CXC` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_BALANCE_CXC(
  CODIGOCTEINI INTEGER,
  CODIGOCTEFIN INTEGER,
  FECHAINI DATE,
  FECHAFIN DATE,
  MONEDA CHAR(1) CHARACTER SET NONE,
  FECHA_BLC_ANTERIOR DATE)
RETURNS(
  CODIGO_CLIENTE INTEGER,
  DEBITO NUMERIC(15, 2),
  CREDITO NUMERIC(15, 2),
  BALANCE_ANT NUMERIC(15, 2))
AS
BEGIN
  FOR
    SELECT 
      DISTINCT codigo_cte      
    FROM clientes
    Where codigo_cte between :codigocteini And :codigoctefin    
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
    And tipo_tranf = 1 
    And status in ("R","A")   
    AND MONEDA =:MONEDA

    INTO    
    :DEBITO;

    SELECT                       
    Sum(TRANS_CXC.VALOR_DOCUMENTO) * -1
    FROM TRANS_CXC
    Where fecha between :fechaini and :fechafin
    and codigo_cliente =:CODIGO_CLIENTE
    AND MONEDA =:MONEDA 
    And tipo_tranf = 2 
    And status in ("R","A")   

    INTO
    :CREDITO;

    SELECT
    BALANCE_ACT
    FROM BLCE_CTE_HISTORICO 
    WHERE 
    FECHA_HISTORICO = :fecha_blc_anterior
    And CODIGO =:CODIGO_CLIENTE
    And MONEDA =:MONEDA   

    INTO  
    :BALANCE_ANT;

    SUSPEND;
  END

END^

SET TERM ; ^

/* Definition for the `PROC_BALANCE_CXP` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_BALANCE_CXP(
  CODIGOCTEINI INTEGER,
  CODIGOCTEFIN INTEGER,
  FECHAINI DATE,
  FECHAFIN DATE,
  MONEDA CHAR(1) CHARACTER SET NONE,
  FECHA_BLC_ANTERIOR DATE)
RETURNS(
  CODIGO_CLIENTE INTEGER,
  DEBITO NUMERIC(15, 2),
  CREDITO NUMERIC(15, 2),
  BALANCE_ANT NUMERIC(15, 2))
AS
BEGIN
  FOR
    SELECT
      DISTINCT codigo_cte
    FROM proveedores
    Where codigo_cte between :codigocteini And :codigoctefin
    /* AND "1" =:MONEDA */
    INTO
      :Codigo_cliente
  DO
  BEGIN
    SELECT
          sum(TRANS_CXp.VALOR_DOCUMENTO)
    FROM TRANS_CXp
    Where fecha between :fechaini and :fechafin
     and codigo_cliente =:codigo_cliente
    And tipo_tranf = 1
    And status in ("R","A")
    AND MONEDA =:MONEDA

    INTO
    :DEBITO;

    SELECT
    Sum(TRANS_CXp.VALOR_DOCUMENTO) * -1
    FROM TRANS_CXp
    Where fecha between :fechaini and :fechafin
    and codigo_cliente =:CODIGO_CLIENTE
    AND MONEDA =:MONEDA
    And tipo_tranf = 2
    And status in ("R","A")

    INTO
    :CREDITO;

    SELECT
    BALANCE_ACT
    FROM BALANCE_CXP_HISTORICO
    WHERE
    FECHA_BCE = :fecha_blc_anterior
    And CODIGO =:CODIGO_CLIENTE
    And MONEDA =:MONEDA

    INTO
    :BALANCE_ANT;

    SUSPEND;
  END

END^

SET TERM ; ^

/* Definition for the `PROC_BUSCANOMBCTEYBLC` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_BUSCANOMBCTEYBLC(
  CODIGO_CLIENTE INTEGER)
RETURNS(
  NOMBRECLIENTE VARCHAR(60) CHARACTER SET NONE,
  BALANCEACTUAL NUMERIC(15, 2))
AS
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

end^

SET TERM ; ^

/* Definition for the `PROC_BUSCARCODPROV` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_BUSCARCODPROV(
  CODPRODABUSCAR INTEGER,
  N INTEGER)
RETURNS(
  XCODIGOPROVEEDOR INTEGER,
  XCODIGO_ARTICULO INTEGER,
  XFECHA_ULT_PEDIDO DATE,
  XPRECIO NUMERIC(15, 2))
AS
DECLARE VARIABLE XFECHA TIMESTAMP;
begin
  Select max(fecha_ult_pedido) from costo_producto
  Where codigo_articulo =:codProdABuscar
  INTO :XFECHA;
 FOR
  Select
  CODIGOPROVEEDOR,
  CODIGO_ARTICULO,
  FECHA_ULT_PEDIDO,
  PRECIO
  From Costo_Producto
  Where codigo_articulo =:codProdABuscar
  AND FECHA_ULT_PEDIDO =:XFECHA
  INTO
  :XCODIGOPROVEEDOR,
  :XCODIGO_ARTICULO,
  :XFECHA_ULT_PEDIDO,
  :XPRECIO
 DO
  BEGIN
    Suspend;
    N = N -1;
    if (N = 0) Then EXIT;
 END
END^

SET TERM ; ^

/* Definition for the `PROC_BUSCARFBLCINI` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_BUSCARFBLCINI(
  CODIGO_CTE_IN INTEGER,
  FECHA_IN DATE)
RETURNS(
  FECHA_BLC_INICIAL DATE,
  BALANCE_ACT_OUT NUMERIC(15, 2),
  FECHA_INI_TRN DATE,
  DESCRIPCION VARCHAR(80) CHARACTER SET NONE)
AS
DECLARE VARIABLE XFECHA date;
begin
  Select max(fecha_historico) from blce_cte_historico
  Where fecha_historico <=:fecha_in
  And codigo = :codigo_cte_in
  Into :xfecha;
  /* descripcion = "1 "; */
  if (xfecha is null) then
  Begin
    Select Min(fecha_historico)
    From blce_cte_historico
    Where (fecha_historico >=:fecha_in)
    And codigo = :codigo_cte_in
    Into :xfecha;
   /* descripcion = descripcion || "uno "; */
  end
  if (xfecha is not null) then
  begin
     fecha_blc_inicial = xfecha;
     /*    descripcion =descripcion || "dos "; */
  end
  Select balance_act  From balance_cte
  Where
  codigo =:CODIGO_CTE_IN
  Into
  :balance_act_out;
  if (fecha_blc_inicial is not null) then
  begin
    Select Max(fecha) from trans_cxc
    Where codigo_cliente =:codigo_cte_in
    And fecha <=:fecha_blc_inicial+1
    Into :fecha_ini_trn;
    /* descripcion = descripcion || "tres "; */
  end
  if (fecha_ini_trn is null) then
  begin
    Select Min(fecha) from trans_cxc
    Where codigo_cliente =:codigo_cte_in
    And fecha >=:fecha_blc_inicial+1
    Into :fecha_ini_trn;
    /* descripcion = descripcion || "cuatro "; */
  end
  if (fecha_ini_trn is null) then
  Descripcion = " *** Cliente no tiene transacciones ***";
  Suspend;
END^

SET TERM ; ^

/* Definition for the `PROC_BUSCARPERMISOS` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_BUSCARPERMISOS(
  IDUSUARIO SMALLINT)
RETURNS(
  PROCESOID INTEGER,
  TAREAID INTEGER,
  STATUS INTEGER,
  VISIBLE SMALLINT,
  ISPERSON INTEGER,
  USERID INTEGER)
AS
Declare Variable xid Integer;
BEGIN

  /*

    SELECT 
      DISTINCT ROLES_USUARIO.ID_ROL
    FROM
      ROLES_USUARIO
    WHERE
      (ID_USUARIO = :IDUSUARIO)
  INTO 
  :xid;

  IF (:xid >=0) THEN
  BEGIN
    FOR
      SELECT Distinct
      p.isPerson, p.PROCESOID, p.TAREAID, p.STATUS, t.visible
    FROM
      PERMISOS p, tareas t
    Where p.tareaid = t.tareaid and     
      (USERID =:xid)
    INTO
    :PROCESOID, :TAREAID, :STATUS,:visible
  DO
  BEGIN
    SUSPEND;
  END
  END ELSE
  BEGIN 

*/
    FOR
      SELECT DISTINCT 
      P.USERID, p.isPerson, p.PROCESOID, p.TAREAID, p.STATUS, t.visible
    FROM
      PERMISOS p, tareas t
    Where p.tareaid = t.tareaid and 
      (USERID =:IDUSUARIO )
    INTO
      :USERID, :PROCESOID, :TAREAID, :STATUS,:visible, :isperson
    DO
    BEGIN
      SUSPEND;
    END

/*  END */
END^

SET TERM ; ^

/* Definition for the `PROC_BUSCARULTNUMSEC` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_BUSCARULTNUMSEC(
  CIAKEY INTEGER)
RETURNS(
  SERIE_VTA INTEGER,
  NUM_FACTURA INTEGER)
AS
BEGIN
  Select max(numero) from facturas where CIA_KEY =:ciakey
  Into :num_factura;

  Select max(cast(numero_doc_pago as integer)) 
  from ventas_mast  
  Where forma_pago not in (7)
  and CIA_KEY =:ciakey
  Into :serie_vta;
SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_BUSCARULTNUMSECORDEN` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_BUSCARULTNUMSECORDEN
RETURNS(
  NUM_ORDEN INTEGER)
AS
BEGIN
  Select max(num_orden) From orden_comp_mast
  Into :num_orden;
SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_BUSCARULTNUMSEC_PREVENTA` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_BUSCARULTNUMSEC_PREVENTA
RETURNS(
  SERIE_VTA INTEGER,
  NUM_FACTURA INTEGER)
AS
BEGIN
  Select max(numero) from facturas
  Into :num_factura;

  Select max(cast(numero_doc_pago as integer)) from ventas_mast_preventa
  Where forma_pago Not in (7)
  Into :serie_vta;
SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_BUSCAR_CUOTAFINANC` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_BUSCAR_CUOTAFINANC(
  CODIGOCTE INTEGER,
  FECHAACTUAL DATE)
RETURNS(
  SERIE INTEGER,
  NUMERO_TRN INTEGER,
  FECHA DATE,
  CODIGO_CTE INTEGER,
  TIPO_FREC_PAGO INTEGER,
  PORCIENTO NUMERIC(15, 2),
  PORC_MORA NUMERIC(15, 2),
  MONTO_CAP_INICIAL NUMERIC(15, 2),
  CANT_CUOTAS INTEGER,
  MONTOINICIAL NUMERIC(15, 2),
  BALANCE_ACT NUMERIC(15, 2),
  FECHA_ULT_PAGO DATE,
  CANTMESATRASO INTEGER,
  MONTO_APAGAR_PORMORA NUMERIC(15, 2),
  MONTO_INTERES NUMERIC(15, 2),
  MONTO_CUOTA NUMERIC(15, 2),
  MONTO_CUOTA_TOTAL NUMERIC(15, 2),
  DIASTRANS INTEGER,
  CANTPERIODOSATRASO INTEGER,
  NUM_FACTURA INTEGER,
  CUOTASPEND INTEGER,
  MONTOCAPITAL_PARASALDO NUMERIC(15, 2))
AS
DECLARE VARIABLE DiasTranscurrido Integer;
  DECLARE VARIABLE CANT_MODULO Integer;
  DECLARE VARIABLE xCantCuotas Integer;
  DECLARE VARIABLE frecDiasPago integer;
BEGIN
  FOR 
      SELECT SERIE,
             NUMERO_TRN,
             FECHA,
             CODIGO_CTE,
             TIPO_FREC_PAGO,
             PORCIENTO,
             PORC_MORA, monto_cap_inicial,
             CANT_CUOTAS, MONTOINICIAL,
             BALANCE_ACT,
             FECHA_ULT_PAGO, CUOTASPEND, num_factura, CUOTASPEND

      FROM FINANCIAMIENTO
      WHERE CODIGO_CTE =:CODIGOCTE AND STATUS IN ('A')
      INTO :SERIE,
           :NUMERO_TRN,
           :FECHA,
           :CODIGO_CTE,
           :TIPO_FREC_PAGO,
           :PORCIENTO,
           :PORC_MORA, :Monto_Cap_Inicial,
           :CANT_CUOTAS,:MONTOINICIAL,
           :BALANCE_ACT,
           :FECHA_ULT_PAGO, :CUOTASPEND, :num_factura, :CUOTASPEND
  DO
    BEGIN
      MONTO_INTERES = 0; 
      MONTO_CUOTA = 0;
      MONTO_CUOTA_TOTAL = 0;   

      DiasTranscurrido = 0;
      xCantCuotas  = 0;
      frecDiasPago = 0;

      Select frecuencia_dias from frec_pago_loan where codigo=:TIPO_FREC_PAGO
      into :frecDiasPago;

      if (:FECHA_ULT_PAGO is not null) then
      DiasTranscurrido = f_ageinDays(:FECHA_ULT_PAGO,:fechaActual);
      else  DiasTranscurrido = f_ageinDays(:FECHA,:fechaActual);

     DiasTrans = DiasTranscurrido;
     
      MONTO_INTERES = 0;
      MONTO_CUOTA = 0;
      if (:DiasTranscurrIdo > :frecDiasPago) then 
      CANT_MODULO = F_MODULO(DiasTranscurrido , :frecDiasPago);

      if ( CANT_MODULO > 3 ) then
      CantMesAtraso =  ((DiasTranscurrido  / :frecDiasPago) - f_modulo(DiasTranscurrido, :frecDiasPago)/:frecDiasPago) +1;

      CantPeriodosAtraso  =  CantMesAtraso;

      MONTO_Apagar_PorMora = 0;

      if ((:DiasTranscurrido - :frecDiasPago ) >= 3 ) then
      begin
        Monto_apagar_pormora = (/* :MONTOINICIAL * :PORCIENTO / 100 + */ :BALANCE_ACT) * :PORC_MORA/100;
        if (CantMesAtraso > 1) Then
        MONTO_apagar_pormora = MONTO_apagar_pormora * CantMesAtraso;
      end

      MONTO_INTERES = :Monto_Cap_Inicial * :PORCIENTO/100; 
      MONTO_CUOTA   = :Monto_Cap_Inicial / CANT_CUOTAS;

      MONTO_CUOTA_TOTAL = MONTO_CUOTA + MONTO_INTERES + MONTO_apagar_pormora; 
      
      montoCapital_paraSaldo = :BALANCE_ACT; 

    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROC_BUSCAR_CUOTAFINANC_BACKUP` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_BUSCAR_CUOTAFINANC_BACKUP(
  CODIGOCTE INTEGER,
  FECHAACTUAL DATE)
RETURNS(
  SERIE INTEGER,
  NUMERO_TRN INTEGER,
  FECHA DATE,
  CODIGO_CTE INTEGER,
  TIPO_FREC_PAGO INTEGER,
  PORCIENTO NUMERIC(15, 2),
  PORC_MORA NUMERIC(15, 2),
  MONTO_CAP_INICIAL NUMERIC(15, 2),
  CANT_CUOTAS INTEGER,
  MONTOINICIAL NUMERIC(15, 2),
  BALANCE_ACT NUMERIC(15, 2),
  FECHA_ULT_PAGO DATE,
  CANTMESATRASO INTEGER,
  MONTO_APAGAR_PORMORA NUMERIC(15, 2),
  MONTO_INTERES NUMERIC(15, 2),
  MONTO_CUOTA NUMERIC(15, 2),
  MONTO_CUOTA_TOTAL NUMERIC(15, 2),
  DIASTRANS INTEGER,
  CANTPERIODOSATRASO INTEGER,
  NUM_FACTURA INTEGER,
  CUOTASPEND INTEGER)
AS
DECLARE VARIABLE DiasTranscurrido Integer;
  DECLARE VARIABLE CANT_MODULO Integer;
  DECLARE VARIABLE xCantCuotas Integer;
  DECLARE VARIABLE frecDiasPago integer;
BEGIN
  FOR SELECT SERIE,
             NUMERO_TRN,
             FECHA,
             CODIGO_CTE,
             TIPO_FREC_PAGO,
             PORCIENTO,
             PORC_MORA, monto_cap_inicial,
             CANT_CUOTAS, MONTOINICIAL,
             BALANCE_ACT,
             FECHA_ULT_PAGO, CUOTASPEND, num_factura, CUOTASPEND

      FROM FINANCIAMIENTO
      WHERE CODIGO_CTE =:CODIGOCTE AND STATUS IN ('A')
      INTO :SERIE,
           :NUMERO_TRN,
           :FECHA,
           :CODIGO_CTE,
           :TIPO_FREC_PAGO,
           :PORCIENTO,
           :PORC_MORA, :Monto_Cap_Inicial,
           :CANT_CUOTAS,:MONTOINICIAL,
           :BALANCE_ACT,
           :FECHA_ULT_PAGO, :CUOTASPEND, :num_factura, :CUOTASPEND
  DO
    BEGIN
      MONTO_INTERES = 0; 
      MONTO_CUOTA = 0;
      MONTO_CUOTA_TOTAL = 0;   

      DiasTranscurrido = 0;
      xCantCuotas  = 0;
      frecDiasPago = 0;

      Select frecuencia_dias from frec_pago_loan where codigo=:TIPO_FREC_PAGO
      into :frecDiasPago;

      if (:FECHA_ULT_PAGO is not null) then
      DiasTranscurrido = f_ageinDays(:FECHA_ULT_PAGO,:fechaActual);
      else  DiasTranscurrido = f_ageinDays(:FECHA,:fechaActual);

     DiasTrans = DiasTranscurrido;
     
      MONTO_INTERES = 0;
      MONTO_CUOTA = 0;
      if (:DiasTranscurrIdo > :frecDiasPago) then 
      CANT_MODULO = F_MODULO(DiasTranscurrido , :frecDiasPago);

      if ( CANT_MODULO > 3 ) then
      CantMesAtraso =  ((DiasTranscurrido  / :frecDiasPago) - f_modulo(DiasTranscurrido, :frecDiasPago)/:frecDiasPago) +1;

      CantPeriodosAtraso  =  CantMesAtraso;

      MONTO_Apagar_PorMora = 0;

      if ((:DiasTranscurrido - :frecDiasPago ) >= 3 ) then
      begin
        Monto_apagar_pormora = (:MONTOINICIAL * :PORCIENTO / 100 + :BALANCE_ACT) * :PORC_MORA/100;
        if (CantMesAtraso > 1) Then
        MONTO_apagar_pormora = MONTO_apagar_pormora * CantMesAtraso;
      end

      MONTO_INTERES = :Monto_Cap_Inicial * :PORCIENTO/100; 
      MONTO_CUOTA   = :Monto_Cap_Inicial / CANT_CUOTAS;

      MONTO_CUOTA_TOTAL = MONTO_CUOTA + MONTO_INTERES + MONTO_apagar_pormora;   

    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROC_CANCELA_VENTA` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_CANCELA_VENTA(
  TRNUMERO INTEGER)
AS
BEGIN
 Update ventas_mast 
 Set Status = "C"
 Where numero=:trNumero;

 Update Ventas_det
 Set Status_det = "C"
 Where numero=:trNumero;
 Suspend;
END^

SET TERM ; ^

/* Definition for the `PROC_CKSENTRANSITO` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_CKSENTRANSITO(
  FECHACONCILIA DATE,
  CUENTABCO VARCHAR(20) CHARACTER SET NONE,
  CODBANCO INTEGER,
  STRUSERNAME VARCHAR(12) CHARACTER SET NONE,
  FECHAANTINI DATE,
  FECHAANTFIN DATE)
AS
begin
 Insert Into TRANSAC_BANCARIA( 
   CODIGO_BCO,     
   CUENTA_BCO,     
   TIPO_TRN,       
   NUMERO_DOC,     
   FECHA_TRN,      
   DESCRIPCION_TRN,
   MONTO_TRN,      
   STATUS,         
   STATUS_CKS,     
   FECHA_IN,       
   INSERTADO_POR,  
   FECHA_MOD,      
   MODIFICADO_POR) 
 Select distinct 
  CODIGO_BCO,
  CUENTA_BCO,
  TIPO_TRN,
  NUMERO_DOC,
  :FECHACONCILIA,
  DESCRIPCION_TRN,
  MONTO_TRN,
  STATUS,
  "K",
  "Today",
  :strusername,
  FECHA_MOD,
  MODIFICADO_POR
From  TRANSAC_BANCARIA
Where (Status_cks  IS NULL 
       or  status_cks = "T")      
      and tipo_trn = 4 
      And Cuenta_bco = :cuentabco
      and CODIGO_BCO = :CODBANCO
      and fecha_trn between :fechaantini and :fechaantfin
      AND MONTO_TRN > 0;
Update transac_bancaria
Set Status_cks = Null
Where Status_cks   = "K"
      And tipo_trn = 4 
      And Cuenta_bco = :cuentabco
      And Fecha_trn  = :FECHACONCILIA
      and CODIGO_BCO = :CODBANCO;

end^

SET TERM ; ^

/* Definition for the `PROC_CKS_CONCILIAR` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_CKS_CONCILIAR(
  FECHAINI DATE,
  FECHAFIN DATE,
  CUENTABANCO VARCHAR(20) CHARACTER SET NONE,
  CODIGOBANCO INTEGER)
RETURNS(
  TIPO_DOC INTEGER,
  NUMERO_CKS INTEGER,
  BENEFICIARIO VARCHAR(60) CHARACTER SET NONE,
  FECHA_EMISION DATE,
  COD_BANCO INTEGER,
  CUENTA_BANCO VARCHAR(20) CHARACTER SET NONE,
  CUENTA1 VARCHAR(3) CHARACTER SET NONE,
  CUENTA2 VARCHAR(2) CHARACTER SET NONE,
  CUENTA3 VARCHAR(2) CHARACTER SET NONE,
  DEBITO NUMERIC(15, 2),
  CREDITO NUMERIC(15, 2),
  TIPO_CKS INTEGER,
  STATUS CHAR(1) CHARACTER SET NONE,
  AREA_CKS VARCHAR(15) CHARACTER SET NONE)
AS
BEGIN
  For SELECT Distinct 
         4,
         Cheques.NUMERO_CKS, 
         Cheques.BENEFICIARIO, 
         Cheques.FECHA_EMISION, 
         Cheques.COD_BANCO, 
         Bancos_det.CUENTA_BANCO,
         Bancos_det.CUENTA1, 
         Bancos_det.CUENTA2, 
         Bancos_det.CUENTA3, 
         NULL,
         CHEQUES_det.CREDITO,
         Cheques.TIPO_CKS,
         Cheques.STATUS,"Mod.Provee"
  FROM CHEQUES Cheques
  INNER JOIN CHEQUES_DET Cheques_det
  ON  (Cheques.NUM_TRANS = Cheques_det.NUM_TRANS)  
  INNER JOIN BANCOS_DET Bancos_det
  ON  (Cheques.COD_BANCO = Bancos_det.CODIGO)  
  And Cheques.TIPO_CKS = bancos_Det.tipo
  And Cheques.FECHA_EMISION between :FECHAINI And :FECHAFIN
  And Bancos_det.CUENTA_BANCO = :cuentabanco
  And CHEQUES_det.CREDITO > 0
  And Bancos_det.CUENTA1 = cheques_det.CUENTA1
  And Bancos_det.CUENTA2 = cheques_det.CUENTA2 
  And Bancos_det.CUENTA3 = cheques_det.CUENTA3

  Into  
         :TIPO_DOC,
         :NUMERO_CKS, 
         :BENEFICIARIO, 
         :FECHA_EMISION, 
         :COD_BANCO, 
         :CUENTA_BANCO,
         :CUENTA1, 
         :CUENTA2, 
         :CUENTA3, 
         :DEBITO,
         :CREDITO,
         :TIPO_CKS, 
         :STATUS,
         :AREA_CKS
Do 
  Suspend;
FOR
  SELECT Distinct 
         4,
         Cheques_NOMINA.NUMERO_CKS, 
         Cheques_NOMINA.BENEFICIARIO, 
         Cheques_NOMINA.FECHA_EMISION, 
         Cheques_NOMINA.COD_BANCO, 
         Bancos_det.CUENTA_BANCO,
         Bancos_det.CUENTA1, 
         Bancos_det.CUENTA2, 
         Bancos_det.CUENTA3, 
         NULL,
         Cheques_DET_NOMINA.CREDITO,
         Cheques_NOMINA.TIPO_CKS, 
         Cheques_NOMINA.STATUS,"Mod.Nom"
  FROM CHEQUES_NOMINA Cheques_NOMINA
  INNER JOIN CHEQUES_DET_NOMINA Cheques_det_NOMINA
  ON  (Cheques_NOMINA.NUM_TRANS = Cheques_det_NOMINA.NUM_TRANS)  
  INNER JOIN BANCOS_DET Bancos_det
  ON  (Cheques_NOMINA.COD_BANCO = Bancos_det.CODIGO)  
  And Cheques_NOMINA.TIPO_CKS = bancos_Det.tipo
  And Cheques_NOMINA.FECHA_EMISION between :FECHAINI And :FECHAFIN
  And CHEQUES_det_nomina.CREDITO > 0
  And Bancos_det.CUENTA_BANCO = :cuentabanco
  And Bancos_det.CUENTA1 = cheques_det_nomina.CUENTA1 
  And Bancos_det.CUENTA2 = cheques_det_nomina.CUENTA2 
  And Bancos_det.CUENTA3 = cheques_det_nomina.CUENTA3 
Into     :TIPO_DOC,
         :NUMERO_CKS, 
         :BENEFICIARIO, 
         :FECHA_EMISION, 
         :COD_BANCO, 
         :CUENTA_BANCO,
         :CUENTA1, 
         :CUENTA2, 
         :CUENTA3, 
         :DEBITO,
         :CREDITO,
         :TIPO_CKS, 
         :STATUS,:AREA_CKS 
do 
suspend;
/* DEPOSITOS */
FOR
   SELECT 
   Trncnt_master.TIPO_DOC,
   Trncnt_detalle.NUM_DOC,
   Trncnt_detalle.DESCRIPCION_TRN, 
   Trncnt_master.FECHA,
   Bancos.CODIGO, 
   Bancos_det.CUENTA_BANCO, 
   Trncnt_detalle.CUENTA1,
   Trncnt_detalle.CUENTA2,
   Trncnt_detalle.CUENTA3,   
   Trncnt_detalle.DEBITO_TRN,
   Trncnt_detalle.CREDITO_TRN, 
   NULL,
   "P",
   "TRN DEP"
   FROM TRNCNT_MASTER Trncnt_master
   INNER JOIN TRNCNT_DETALLE Trncnt_detalle
   ON  (Trncnt_master.NUMERO = Trncnt_detalle.NUMERO)  
   INNER JOIN BANCOS_DET Bancos_det
   ON  (Trncnt_detalle.CUENTA1 = Bancos_det.CUENTA1)  
   AND  (Trncnt_detalle.CUENTA2 = Bancos_det.CUENTA2)  
   AND  (Trncnt_detalle.CUENTA3 = Bancos_det.CUENTA3)  
   INNER JOIN BANCOS Bancos
   ON  (Bancos.CODIGO = Bancos_det.CODIGO)  
WHERE  Trncnt_master.TIPO_DOC in (11)
   AND (Trncnt_detalle.Status <> "C")
   AND (Trncnt_detalle.CREDITO_TRN <> 0)
   AND Bancos_det.CUENTA_BANCO = :cuentabanco 
   AND Trncnt_master.FECHA between :FECHAINI 
   AND :FECHAFIN

   INTO  :TIPO_DOC, 
         :NUMERO_CKS, 
         :BENEFICIARIO, 
         :FECHA_EMISION, 
         :COD_BANCO, 
         :CUENTA_BANCO,
         :CUENTA1, 
         :CUENTA2, 
         :CUENTA3, 
         :DEBITO,
         :CREDITO,
         :TIPO_CKS, 
         :STATUS,
         :AREA_CKS 
Do 
  Suspend;
END^

SET TERM ; ^

/* Definition for the `PROC_COBRAR_FINANCIAMIENTO` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_COBRAR_FINANCIAMIENTO(
  SERIE INTEGER,
  TIPO SMALLINT,
  NUMERO INTEGER,
  MONEDA CHAR(1) CHARACTER SET NONE,
  FECHA DATE,
  VALOR_ING NUMERIC(15, 2),
  TIPO_ING SMALLINT,
  NOMBRE_CTE VARCHAR(40) CHARACTER SET NONE,
  CODIGO_CTE INTEGER,
  COD_SERVICIO INTEGER,
  FORMA_PAGO SMALLINT,
  DOCUMENTO VARCHAR(20) CHARACTER SET NONE,
  TIPO_TARGETA SMALLINT,
  STATUS_TARGETA CHAR(1) CHARACTER SET NONE,
  CONCEPTO VARCHAR(40) CHARACTER SET NONE,
  STATUS CHAR(1) CHARACTER SET NONE,
  OBSERVACION VARCHAR(40) CHARACTER SET NONE,
  COD_LINEA CHAR(6) CHARACTER SET NONE,
  FECHA_IN DATE,
  IN_POR VARCHAR(12) CHARACTER SET NONE,
  COD_EMPLEADO INTEGER,
  NOTA_DEBITO NUMERIC(15, 2),
  NOTA_CREDITO NUMERIC(15, 2),
  MONTO_INTERES NUMERIC(15, 2),
  MONTO_MORA NUMERIC(15, 2),
  MONTO_CAPITAL NUMERIC(15, 2),
  NUMERO_FACTURA INTEGER,
  TIPO_FACTURA INTEGER,
  TIPO_COBRO INTEGER,
  CANT_CUOTAS INTEGER)
RETURNS(
  NUMERO_RECIBO INTEGER)
AS
DECLARE VARIABLE XSERIE INTEGER;
DECLARE VARIABLE XNUMERO INTEGER;
DECLARE VARIABLE XSERIE_FCTI INTEGER;
DECLARE VARIABLE xserie_trncxc INTEGER;
DECLARE VARIABLE XMONTOPENDIENTE NUMERIC(15,2);
DECLARE VARIABLE cCuota integer;
begin
/* tipo_pago 0-abono 1-saldo cuota, 2-saldo financiamiento*/
  if (:tipo_cobro = 0) then
  cCuota = 0;
  else if (:tipo_cobro = 1) then 
  cCuota = 1;  
  else if (:tipo_cobro = 2) then 
  cCuota = cant_cuotas;    
  
  Update FINANCIAMIENTO f 
  Set 
    f.FECHA_ULT_PAGO = :fecha,
    f.FECHA_UPDATE = "TODAY",
    f.ID_USUARIO_UPDATE = :COD_EMPLEADO,
    f.CREDITO_ACUM = f.CREDITO_ACUM + :valor_ing + :NOTA_CREDITO,
    f.DEBITO_ACUM = f.DEBITO_ACUM + :NOTA_DEBITO,
    f.BALANCE_ACT = f.BALANCE_ACT - :valor_ing - :NOTA_CREDITO,
    f.CUOTASPEND = f.CUOTASPEND - :cCuota,
    f.NOTA_CREDITO = :nota_credito,
    f.NOTA_DEBITO = :nota_debito
  Where f.serie =:serie;  
  if (:tipo_cobro = 2 ) then
  begin
    update FINANCIAMIENTO f
    set f.STATUS = 'R'
    where f.serie = :serie;
  end

  SELECT MAX(SERIE) FROM INGRESOS
  INTO XSERIE;
  SELECT MAX(NUMERO) FROM INGRESOS
  INTO XNUMERO;
      
  if (xserie is null or xserie = 0) then
  xserie = 1; 
  else xserie = xserie + 1;
  
  if (xnumero is null or xnumero = 0) then
  xnumero = 1;
  else xnumero = xnumero  + 1;
  
  numero_recibo = XNUMERO;
  
  /* actualiza tabla INGRESOS*/
  INSERT INTO INGRESOS(
  SERIE,  TIPO,  NUMERO,  MONEDA,  FECHA,  VALOR_ING,  TIPO_ING,
  NOMBRE_CTE,  CODIGO_CTE,  COD_SERVICIO,  FORMA_PAGO,  DOCUMENTO,
  TIPO_TARGETA,  STATUS_TARGETA, CONCEPTO,  STATUS,  OBSERVACION,
  COD_LINEA,  FECHA_IN,  IN_POR, COD_EMPLEADO,  NOTA_DEBITO,
  NOTA_CREDITO,  MONTO_INTERES,MONTO_MORA,  MONTO_CAPITAL)
  VALUES (:xSERIE,:TIPO,:xNUMERO,:MONEDA,:FECHA,:VALOR_ING,  :TIPO_ING,
  :NOMBRE_CTE,:CODIGO_CTE,:COD_SERVICIO,:FORMA_PAGO,:DOCUMENTO,  :TIPO_TARGETA,  :STATUS_TARGETA,
  :CONCEPTO,:STATUS,:OBSERVACION,:COD_LINEA,:FECHA_IN,:IN_POR,  
  :COD_EMPLEADO,:NOTA_DEBITO,:NOTA_CREDITO,:MONTO_INTERES,:MONTO_MORA,:MONTO_CAPITAL
  );
  
    
  SELECT MAX(SERIE) FROM FCTINGRESOS
  INTO XSERIE_FCTI;
 
  if (XSERIE_FCTI is null or XSERIE_FCTI = 0) then
  XSERIE_FCTI = 1;
  else XSERIE_FCTI = XSERIE_FCTI + 1;
   
  /* actualiza tabla FCTINGRESOS*/ 
  Insert Into fctingresos(serie,numero,numero_fact,monto_fact,moneda,status,codigo_servicio,tipo,tipo_doc)
  Values (:XSERIE_FCTI,:XNUMERO,:NUMERO_FACTURA,:VALOR_ING,:moneda,:status,0,:TIPO_FACTURA,2);

  xserie = 0;
  SELECT MAX(SERIE) FROM INGRESOS_DET
  INTO XSERIE;

  if (xserie is null or xserie = 0) then
  xserie = 1; 
  else xserie = xserie + 1;
  
  /* actualiza tabla INGRESOS_DET*/
  
  Insert into INGRESOS_DET(
  serie,
  serie_master,
  numero_ing, 
  cod_servicio, 
  cod_departamento,
  detalle, 
  valor_det, 
  status, 
  valor_impuesto, 
  porc_descuento,
  fecha_in, 
  in_por, 
  tipo_tarjeta, 
  numero_tarjeta_cred, 
  ano_vence, 
  mes_vence,
  montoautorizado, 
  numero_aprobacion,
  tipo, 
  codigo_proveedor, 
  fcting_serie)
  values(:xserie, :XNUMERO, :XNUMERO,0,0,:CONCEPTO,:valor_ing, :status, 0.0,0.0,
  :fecha_in, :in_por, null, null, null, null, null, null, null, null, :XSERIE_FCTI);
  
  Select max(serie) from TRANS_CXC
  Into :xserie_trncxc;
  
  if (xserie_trncxc is null or xserie_trncxc= 0) then
  xserie_trncxc = 1; 
  else xserie_trncxc= xserie_trncxc+ 1;
  
  /* actualiza tabla TRANS_CXC*/
  insert into TRANS_CXC(
  serie,   
  tipo_doc,
  moneda,
  fecha,
  numero_doc,
  tipo_serv,
  codigo_cliente,
  codigo_serv,
  concepto,
  Valor_documento,
  Tipo_tranf,
  Status,
  NUMERO_RECIBO)
  values(    
  :xserie_trncxc,    
  2, /* recibo */
  :moneda,
  :fecha,
  :numero_factura,
  2,
  :codigo_cte,
  :cod_servicio,
  :concepto,
  :valor_ing,
  2,
  'R',
  :XNUMERO);
  
  /* Inserta nota de credito */
  if (:NOTA_CREDITO > 0) then
  begin  
  concepto = concepto  ||  " -Nota CR";
  Select max(serie) from TRANS_CXC
  Into :xserie_trncxc;
  insert into TRANS_CXC(
  serie,   
  tipo_doc,
  moneda,
  fecha,
  numero_doc,
  tipo_serv,
  codigo_cliente,
  codigo_serv,
  concepto,
  Valor_documento,
  Tipo_tranf,
  Status,
  NUMERO_RECIBO)
  values(    
  :xserie_trncxc,    
  5, /* nota de credito */
  :moneda,
  :fecha,
  :numero_factura,
  2,
  :codigo_cte,
  :cod_servicio,
  :concepto,
  :NOTA_CREDITO,
  2,
  "R",
  :XNUMERO);
  end
  
  /* actualiza tabla BALANCE_CTE*/
  EXECUTE PROCEDURE PROC_ACT_BALANCE_CTE_CXC (
  :CODIGO_CTE,
  :COD_SERVICIO,
  :MONEDA,
  :tipo_ing,
  :valor_ing + :nota_credito,
  :FECHA,
  :xserie_trncxc);

EXECUTE PROCEDURE PROCFACT_PENDIENTE (
    :TIPO,
    :MONEDA,
    :NUMERO_FACTURA,
    0,
    :STATUS,
    -1) RETURNING_VALUES :XMONTOPENDIENTE;

XMONTOPENDIENTE = XMONTOPENDIENTE - :valor_ing + :nota_credito;

EXECUTE PROCEDURE PROCFACT_PENDIENTE (
    :TIPO,
    :MONEDA,
    :NUMERO_FACTURA,
    :XMONTOPENDIENTE,
    :STATUS,
    1 ) RETURNING_VALUES :XMONTOPENDIENTE;    
/*for 
    Select numero 
    From ingresos
    INTO
    :numero_recibo
    DO
    BEGIN
    SUSPEND;
  END    
  */
end^

SET TERM ; ^

/* Definition for the `PROC_DATOSREPPERMISOS` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_DATOSREPPERMISOS(
  TIPO INTEGER,
  USUARIOID INTEGER)
RETURNS(
  TAREA VARCHAR(60) CHARACTER SET NONE,
  VISIBLE SMALLINT,
  NOMBRECOMPLETO VARCHAR(40) CHARACTER SET NONE,
  PERMISOID SMALLINT,
  PROCESOID SMALLINT,
  TAREAID SMALLINT,
  USERID SMALLINT,
  ISPERSON SMALLINT,
  STATUS SMALLINT,
  PROCESO VARCHAR(60) CHARACTER SET NONE)
AS
BEGIN
  if (:tipo = 1) then
  begin
    FOR
      SELECT DISTINCT 
      TAREAS.DESCRIPCION AS TAREA,
      TAREAS.VISIBLE,
      USUARIO.NOMBRECOMPLETO,
      PERMISOS.PERMISOID,
      PERMISOS.PROCESOID,
      PERMISOS.TAREAID,
      PERMISOS.USERID,
      PERMISOS.ISPERSON,
      PERMISOS.STATUS,
      PROCESOS.DESCRIPCION AS PROCESO
    FROM
      USUARIO
      LEFT OUTER JOIN PERMISOS ON (USUARIO.CODIGO_EMPLEADO = PERMISOS.USERID)
      INNER JOIN TAREAS ON (PERMISOS.TAREAID = TAREAS.TAREAID)
      INNER JOIN PROCESOS ON (PERMISOS.PROCESOID = PROCESOS.PROCESOID)
    INTO
      :TAREA,:VISIBLE,
      :NOMBRECOMPLETO,
      :PERMISOID,
      :PROCESOID,
      :TAREAID,
      :USERID,
      :ISPERSON,
      :STATUS,
      :PROCESO
  DO
  BEGIN
    SUSPEND;
  END
  end else
  if (:tipo = 0) then
  begin
    FOR
      SELECT DISTINCT 
      TAREAS.DESCRIPCION AS TAREA,
      TAREAS.VISIBLE,
      SEC_ROLES.DESCRIPCION,
      PERMISOS.PERMISOID,
      PERMISOS.PROCESOID,
      PERMISOS.TAREAID,
      PERMISOS.USERID,
      PERMISOS.ISPERSON,
      PERMISOS.STATUS,
      PROCESOS.DESCRIPCION AS PROCESO

    FROM
      PERMISOS
      INNER JOIN TAREAS ON (PERMISOS.TAREAID = TAREAS.TAREAID)
      INNER JOIN PROCESOS ON (PERMISOS.PROCESOID = PROCESOS.PROCESOID)
      INNER JOIN SEC_ROLES ON (PERMISOS.USERID = SEC_ROLES.USERID)

    INTO
      :TAREA, :VISIBLE,
      :NOMBRECOMPLETO,
      :PERMISOID,
      :PROCESOID,
      :TAREAID,
      :USERID,
      :ISPERSON,
      :STATUS,
      :PROCESO
  DO
  BEGIN
    SUSPEND;
  END
  END
END^

SET TERM ; ^

/* Definition for the `PROC_DATOS_ACNT` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_DATOS_ACNT(
  MODULO INTEGER,
  FECHACNT DATE,
  CIA_KEY INTEGER)
RETURNS(
  NUMERO INTEGER,
  SERIE INTEGER,
  FECHA DATE,
  OBSERVACION VARCHAR(60) CHARACTER SET NONE,
  FORMA_PAGO SMALLINT,
  NUMERO_FACTURA INTEGER,
  NUMERO_DOC_PAGO VARCHAR(20) CHARACTER SET NONE,
  MONTO_BRUTO NUMERIC(15, 2),
  MONTO_DESCUENTO NUMERIC(15, 2),
  PORC_DESCUENTO_MASTER INTEGER,
  DESCRIPCION VARCHAR(60) CHARACTER SET NONE,
  CANTIDAD NUMERIC(15, 2),
  CODIGO_PROD VARCHAR(40) CHARACTER SET NONE,
  PRECIO FLOAT,
  PORC_DESC_DET FLOAT,
  ITBI_DET FLOAT,
  VALOR_SERVICIO_DET NUMERIC(15, 2),
  VALOR_TOTAL_DET NUMERIC(15, 2),
  MONTO_DIETA NUMERIC(15, 2),
  MONTO_AJUSTE NUMERIC(15, 2),
  PRECIO_COMPRA NUMERIC(15, 2),
  COSTO_PRODUCTO NUMERIC(15, 2))
AS
BEGIN
/*
   MODULO CNT
   1 - PuntoVenta
   2 - RegistroPedidos
   3 - CobroFacturas
   4 - Devoluciones
*/
IF (:MODULO = 1) THEN
BEGIN
FOR
   SELECT
       VENTAS_MAST.NUMERO,
       VENTAS_DET.SERIE,
       VENTAS_MAST.FECHA,
       VENTAS_MAST.OBSERVACION,
       VENTAS_MAST.FORMA_PAGO,
       VENTAS_MAST.NUMERO_FACTURA,
       VENTAS_MAST.NUMERO_DOC_PAGO,
       VENTAS_MAST.MONTO_BRUTO,
       VENTAS_MAST.MONTO_DESCUENTO,
       VENTAS_MAST.PORC_DESCUENTO,
       VENTAS_DET.DESCRIPCION,
       VENTAS_DET.CANTIDAD,
       VENTAS_DET.CODIGO_PROD,
       VENTAS_DET.PRECIO,
       VENTAS_DET.PORC_DESC_DET,
       VENTAS_DET.ITBI_DET,
       VENTAS_DET.VALOR_SERVICIO_DET,
       VENTAS_DET.VALOR_TOTAL_DET,
       VENTAS_DET.MONTO_DIETA,
       VENTAS_DET.MONTO_AJUSTE,
       INVENTARIO_PRODUCTO.PRECIO_COMPRA,
       VENTAS_DET.CANTIDAD * INVENTARIO_PRODUCTO.PRECIO_COMPRA
FROM VENTAS_DET
   INNER JOIN VENTAS_MAST ON (VENTAS_DET.NUMERO = VENTAS_MAST.NUMERO)
   LEFT OUTER JOIN INVENTARIO_PRODUCTO ON (VENTAS_DET.CODIGO_PROD = INVENTARIO_PRODUCTO.CODIGO_TEXTO)
WHERE (VENTAS_DET.STATUS_CNT IS NULL OR VENTAS_DET.STATUS_CNT = '0')
and ventas_mast.fecha =:fechacnt
and VENTAS_MAST.CIA_KEY=:cia_key
INTO
  :NUMERO,
  :SERIE,
  :FECHA,
  :OBSERVACION,
  :FORMA_PAGO,
  :NUMERO_FACTURA,
  :NUMERO_DOC_PAGO,
  :MONTO_BRUTO,
  :MONTO_DESCUENTO,
  :PORC_DESCUENTO_master,
  :DESCRIPCION,
  :CANTIDAD,
  :CODIGO_PROD,
  :PRECIO,
  :PORC_DESC_DET,
  :ITBI_DET,
  :VALOR_SERVICIO_DET,
  :VALOR_TOTAL_DET,
  :MONTO_DIETA,
  :MONTO_AJUSTE,
  :PRECIO_COMPRA,
  :COSTO_PRODUCTO
DO
  BEGIN
    suspend;
  END
END

/* Datos Pedidos*/
IF (:MODULO = 2) THEN
BEGIN
FOR
   SELECT
       DESPACHO_MASTER.NUMERO,
       DESPACHO.SERIE,
       DESPACHO_MASTER.FECHA,
       "", /* VENTAS_MAST.OBSERVACION, */
       DESPACHO_MASTER.FORMA_PAGO,
       DESPACHO_MASTER.NUMERO_FACTURA,
       NULL, /* VENTAS_MAST.NUMERO_DOC_PAGO,*/
       DESPACHO.VALOR_BRUTO,
       0, /* VENTAS_MAST.MONTO_DESCUENTO, */
       0, /* VENTAS_MAST.PORC_DESCUENTO, */
       DESPACHO.DESCRIPCION,
       DESPACHO.CANTIDAD,
       DESPACHO.CODIGO_PROD,
       DESPACHO.PRECIO,
       DESPACHO.PORC_DESC_DET,
       DESPACHO.ITBI_DET,
       DESPACHO.VALOR_BRUTO,
       DESPACHO.VALOR_TOTAL_DET,
       0, /* VENTAS_DET.MONTO_DIETA, */
       0, /* VENTAS_DET.MONTO_AJUSTE, */
       INVENTARIO_PRODUCTO.PRECIO_COMPRA,
       DESPACHO.CANTIDAD * INVENTARIO_PRODUCTO.PRECIO_COMPRA
FROM DESPACHO
   INNER JOIN DESPACHO_MASTER ON (DESPACHO.NUMERO = DESPACHO_MASTER.NUMERO)
   LEFT OUTER JOIN INVENTARIO_PRODUCTO ON (DESPACHO.CODIGO_PROD = INVENTARIO_PRODUCTO.CODIGO_TEXTO)
WHERE (DESPACHO.STATUS_CNT IS NULL OR DESPACHO_MASTER.STATUS_CNT = '0')
And despacho_master.FECHA=:fechacnt
INTO
  :NUMERO,
  :SERIE,
  :FECHA,
  :OBSERVACION,
  :FORMA_PAGO,
  :NUMERO_FACTURA,
  :NUMERO_DOC_PAGO,
  :MONTO_BRUTO,
  :MONTO_DESCUENTO,
  :PORC_DESCUENTO_master,
  :DESCRIPCION,
  :CANTIDAD,
  :CODIGO_PROD,
  :PRECIO,
  :PORC_DESC_DET,
  :ITBI_DET,
  :VALOR_SERVICIO_DET,
  :VALOR_TOTAL_DET,
  :MONTO_DIETA,
  :MONTO_AJUSTE,
  :PRECIO_COMPRA,
  :COSTO_PRODUCTO
DO
  BEGIN
    suspend;
  END
END

END^

SET TERM ; ^

/* Definition for the `PROC_DATOS_DESPACHO_DIARIO` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_DATOS_DESPACHO_DIARIO(
  FECHAINI DATE,
  FECHAFIN DATE)
RETURNS(
  CODIGO_CLIENTE INTEGER,
  NOMBRE_FACTURAR VARCHAR(40) CHARACTER SET NONE,
  NUMERO_DOCUMENTO INTEGER,
  VALOR_DOCUMENTO NUMERIC(15, 2),
  TIPO_TRANF SMALLINT,
  MONEDA CHAR(1) CHARACTER SET NONE,
  FECHA DATE,
  TIPO_DOC INTEGER,
  STATUS CHAR(1) CHARACTER SET NONE,
  DEBITO NUMERIC(15, 2),
  CREDITO NUMERIC(15, 2),
  TIPO_DOCUMENTO VARCHAR(30) CHARACTER SET NONE,
  NOMBRE_VENDEDOR VARCHAR(35) CHARACTER SET NONE,
  CODIGO_EMPLEADO INTEGER,
  CODIGO_PRODUCTO VARCHAR(12) CHARACTER SET NONE,
  PRECIO_PRODUCTO INTEGER,
  DESCUENTO NUMERIC(15, 2),
  DESCRIPCION_PRODUCTO VARCHAR(60) CHARACTER SET NONE,
  CANTIDAD NUMERIC(15, 2))
AS
BEGIN

FOR
SELECT despacho_master.CODIGO_emp,
       empleado.NOMBRE||" "||empleado.apellido as nombre,
       despacho_master.NUM_orden,
       DESPACHO.VALOR_TOTAL_DET,
       despacho_master.TIPO_TRN,null,
       despacho_master.FECHA,
       null,
       despacho_master.STATUS,
       0,
       0,
       null,
       EMPLEADO.NOMBRE||" "||EMPLEADO.APELLIDO AS NOMBRE,
       EMPLEADO.CODIGO,
       despacho.CODIGO_PROD,
       despacho.PRECIO,
       despacho.PORC_DESC_DET,
       inventario_producto.descripcion, despacho.cantidad
FROM EMPLEADO
   INNER JOIN DESPACHO_MASTER ON (EMPLEADO.CODIGO = despacho_master.CODIGO_emp)
   INNER JOIN DESPACHO ON (despacho_master.NUMERO = despacho.NUMERO)
   INNER JOIN inventario_producto ON (INVENTARIO_PRODUCTO.codigo = despacho.codigo_prod)
        
   
   WHERE 
       ((despacho_master.FECHA Between :Fechaini And :Fechafin)
       And 
          (despacho_master.STATUS IN ("A","R","D","P"))
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
    if (:tipo_tranf = 3) then
    begin
      credito = :valor_documento;
    end else 
    if (:tipo_tranf = 1) then
    begin
      credito = :valor_documento;
    end else 
    if (:tipo_tranf = 2) then
    begin
      debito = :valor_documento;     
    end
    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROC_DATOS_REP_INVENTARIO` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_DATOS_REP_INVENTARIO
RETURNS(
  DESCRIPCION VARCHAR(80) CHARACTER SET NONE,
  CANTIDAD NUMERIC(15, 2),
  UNIDAD NUMERIC(15, 2),
  CODIGO INTEGER,
  PRECIO NUMERIC(15, 2),
  FECHA_ULTIMA_TRN DATE,
  CODIGO_TEXTO VARCHAR(40) CHARACTER SET NONE,
  FECHA DATE,
  CODIGO_BARRA VARCHAR(40) CHARACTER SET NONE,
  TIPO INTEGER,
  CANTIDAD_REORDEN INTEGER,
  PRECIO_ANT NUMERIC(15, 2),
  BLCE_CANT_ENTRADA NUMERIC(15, 2),
  BLCE_CANT_SALIDA NUMERIC(15, 2),
  STATUS CHAR(1) CHARACTER SET NONE,
  PORC_DESCUENTO NUMERIC(15, 2),
  FOTO BLOB,
  PAGA_ITBI SMALLINT,
  CODIGO_PRECIO CHAR(6) CHARACTER SET NONE,
  BALANCE_EN_RUTA NUMERIC(15, 2),
  PRECIO_COMPRA NUMERIC(15, 2))
AS
DECLARE VARIABLE BLC_RUTA NUMERIC(15,2);
DECLARE VARIABLE cant_otro NUMERIC(15,2);
BEGIN
  FOR
    SELECT INVENTARIO_PRODUCTO.DESCRIPCION,
           INVENTARIO_PRODUCTO.CANTIDAD,
           INVENTARIO_PRODUCTO.UNIDAD,
           INVENTARIO_PRODUCTO.CODIGO,
           INVENTARIO_PRODUCTO.PRECIO,
           INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN,
           INVENTARIO_PRODUCTO.CODIGO_TEXTO,
           INVENTARIO_PRODUCTO.FECHA,
           INVENTARIO_PRODUCTO.CODIGO_BARRA,
           INVENTARIO_PRODUCTO.TIPO,
           INVENTARIO_PRODUCTO.CANTIDAD_REORDEN,
           INVENTARIO_PRODUCTO.PRECIO_ANT,
           INVENTARIO_PRODUCTO.BLCE_CANT_ENTRADA,
           INVENTARIO_PRODUCTO.BLCE_CANT_SALIDA,
           INVENTARIO_PRODUCTO.STATUS,
           INVENTARIO_PRODUCTO.PORC_DESCUENTO,
           INVENTARIO_PRODUCTO.FOTO,
           INVENTARIO_PRODUCTO.PAGA_ITBI,
           INVENTARIO_PRODUCTO.CODIGO_PRECIO,
           INVENTARIO_PRODUCTO.PRECIO_COMPRA

    FROM INVENTARIO_PRODUCTO
    ORDER BY INVENTARIO_PRODUCTO.CODIGO
    INTO
      :DESCRIPCION,
      :CANTIDAD,
      :UNIDAD,
      :CODIGO,
      :PRECIO,
      :FECHA_ULTIMA_TRN,
      :CODIGO_TEXTO,
      :FECHA,
      :CODIGO_BARRA,
      :TIPO,
      :CANTIDAD_REORDEN,
      :PRECIO_ANT,
      :BLCE_CANT_ENTRADA,
      :BLCE_CANT_SALIDA,
      :STATUS,
      :PORC_DESCUENTO,
      :FOTO,
      :PAGA_ITBI,
      :CODIGO_PRECIO, :PRECIO_COMPRA
  DO
  BEGIN
    SELECT SUM(Balance_Act) From balance_despacho
    WHERE BALANCE_DESPACHO.CODIGO_PRODUCTO = :CODIGO
    INTO
    :BLC_RUTA;

    Select sum(i.cantidad)
    From inventario_almacen i,
    division_inventario d
    Where i.codigo =:CODIGO
    And d.Inventario_id = i.Inventario_id
    And d.Inventario_id = 1 /* INVENTARIO PRINCIPAL */
    /* And d.Status = 'A' */
    into 
    :cant_otro;

   if (blc_ruta is not null) then
    BEGIN
      CANTIDAD = CANTIDAD + BLC_RUTA;
    END
    else BLC_RUTA = 0;

    if (cant_otro is not null) then
    BEGIN
      CANTIDAD = cant_otro;
    END
    else 
    begin cant_otro = 0; end

 /*   
    CANTIDAD = CANTIDAD + cant_otro;
    end

    balance_en_ruta=BLC_RUTA + cant_otro; 
*/
    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROC_DATOS_REP_INVENTARIO_P` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_DATOS_REP_INVENTARIO_P
RETURNS(
  DESCRIPCION VARCHAR(80) CHARACTER SET NONE,
  CANTIDAD NUMERIC(15, 2),
  UNIDAD NUMERIC(15, 2),
  CODIGO INTEGER,
  PRECIO NUMERIC(15, 2),
  FECHA_ULTIMA_TRN DATE,
  CODIGO_TEXTO VARCHAR(40) CHARACTER SET NONE,
  FECHA DATE,
  CODIGO_BARRA VARCHAR(40) CHARACTER SET NONE,
  TIPO INTEGER,
  CANTIDAD_REORDEN INTEGER,
  PRECIO_ANT NUMERIC(15, 2),
  BLCE_CANT_ENTRADA NUMERIC(15, 2),
  BLCE_CANT_SALIDA NUMERIC(15, 2),
  STATUS CHAR(1) CHARACTER SET NONE,
  PORC_DESCUENTO NUMERIC(15, 2),
  FOTO BLOB,
  PAGA_ITBI SMALLINT,
  CODIGO_PRECIO CHAR(6) CHARACTER SET NONE,
  BALANCE_EN_RUTA NUMERIC(15, 2),
  PRECIO_COMPRA NUMERIC(15, 2))
AS
DECLARE VARIABLE BLC_RUTA NUMERIC(15,2);
DECLARE VARIABLE cant_otro NUMERIC(15,2);
BEGIN
  FOR
    SELECT INVENTARIO_PRODUCTO.DESCRIPCION,
           INVENTARIO_PRODUCTO.CANTIDAD,
           INVENTARIO_PRODUCTO.UNIDAD,
           INVENTARIO_PRODUCTO.CODIGO,
           INVENTARIO_PRODUCTO.PRECIO,
           INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN,
           INVENTARIO_PRODUCTO.CODIGO_TEXTO,
           INVENTARIO_PRODUCTO.FECHA,
           INVENTARIO_PRODUCTO.CODIGO_BARRA,
           INVENTARIO_PRODUCTO.TIPO,
           INVENTARIO_PRODUCTO.CANTIDAD_REORDEN,
           INVENTARIO_PRODUCTO.PRECIO_ANT,
           INVENTARIO_PRODUCTO.BLCE_CANT_ENTRADA,
           INVENTARIO_PRODUCTO.BLCE_CANT_SALIDA,
           INVENTARIO_PRODUCTO.STATUS,
           INVENTARIO_PRODUCTO.PORC_DESCUENTO,
           INVENTARIO_PRODUCTO.FOTO,
           INVENTARIO_PRODUCTO.PAGA_ITBI,
           INVENTARIO_PRODUCTO.CODIGO_PRECIO,
           INVENTARIO_PRODUCTO.PRECIO_COMPRA

    FROM INVENTARIO_PRODUCTO
    ORDER BY INVENTARIO_PRODUCTO.CODIGO
    INTO
      :DESCRIPCION,
      :CANTIDAD,
      :UNIDAD,
      :CODIGO,
      :PRECIO,
      :FECHA_ULTIMA_TRN,
      :CODIGO_TEXTO,
      :FECHA,
      :CODIGO_BARRA,
      :TIPO,
      :CANTIDAD_REORDEN,
      :PRECIO_ANT,
      :BLCE_CANT_ENTRADA,
      :BLCE_CANT_SALIDA,
      :STATUS,
      :PORC_DESCUENTO,
      :FOTO,
      :PAGA_ITBI,
      :CODIGO_PRECIO, :PRECIO_COMPRA
  DO
  BEGIN
   /*
    SELECT SUM(Balance_Act) From balance_despacho
    WHERE BALANCE_DESPACHO.CODIGO_PRODUCTO = :CODIGO
    INTO
    :BLC_RUTA;

    Select sum(i.cantidad)
    From inventario_almacen i,
    division_inventario d
    Where i.codigo =:CODIGO
    And d.Inventario_id = i.Inventario_id
    And d.Inventario_id = 1 

    into
    :cant_otro;

   if (blc_ruta is not null) then
    BEGIN
      CANTIDAD = CANTIDAD + BLC_RUTA;
    END
    else BLC_RUTA = 0;

    if (cant_otro is not null) then
    BEGIN
      CANTIDAD = cant_otro;
    END
    else
    begin cant_otro = 0; end
    */
    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROC_DATOS_REP_INV_ID` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_DATOS_REP_INV_ID(
  INVENTARIOID INTEGER)
RETURNS(
  DESCRIPCION VARCHAR(80) CHARACTER SET NONE,
  CANTIDAD NUMERIC(15, 2),
  UNIDAD NUMERIC(15, 2),
  CODIGO INTEGER,
  PRECIO NUMERIC(15, 2),
  FECHA_ULTIMA_TRN DATE,
  CODIGO_TEXTO VARCHAR(40) CHARACTER SET NONE,
  FECHA DATE,
  CODIGO_BARRA VARCHAR(40) CHARACTER SET NONE,
  TIPO INTEGER,
  CANTIDAD_REORDEN INTEGER,
  PRECIO_ANT NUMERIC(15, 2),
  BLCE_CANT_ENTRADA NUMERIC(15, 2),
  BLCE_CANT_SALIDA NUMERIC(15, 2),
  STATUS CHAR(1) CHARACTER SET NONE,
  PORC_DESCUENTO NUMERIC(15, 2),
  FOTO BLOB,
  PAGA_ITBI SMALLINT,
  CODIGO_PRECIO CHAR(6) CHARACTER SET NONE,
  BALANCE_EN_RUTA NUMERIC(15, 2),
  PRECIO_COMPRA NUMERIC(15, 2))
AS
DECLARE VARIABLE BLC_RUTA NUMERIC(15,2);
DECLARE VARIABLE cant_otro NUMERIC(15,2);
BEGIN
  FOR
    SELECT INVENTARIO_PRODUCTO.DESCRIPCION,
           INVENTARIO_PRODUCTO.CANTIDAD,
           INVENTARIO_PRODUCTO.UNIDAD,
           INVENTARIO_PRODUCTO.CODIGO,
           INVENTARIO_PRODUCTO.PRECIO,
           INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN,
           INVENTARIO_PRODUCTO.CODIGO_TEXTO,
           INVENTARIO_PRODUCTO.FECHA,
           INVENTARIO_PRODUCTO.CODIGO_BARRA,
           INVENTARIO_PRODUCTO.TIPO,
           INVENTARIO_PRODUCTO.CANTIDAD_REORDEN,
           INVENTARIO_PRODUCTO.PRECIO_ANT,
           INVENTARIO_PRODUCTO.BLCE_CANT_ENTRADA,
           INVENTARIO_PRODUCTO.BLCE_CANT_SALIDA,
           INVENTARIO_PRODUCTO.STATUS,
           INVENTARIO_PRODUCTO.PORC_DESCUENTO,
           INVENTARIO_PRODUCTO.FOTO,
           INVENTARIO_PRODUCTO.PAGA_ITBI,
           INVENTARIO_PRODUCTO.CODIGO_PRECIO,
           INVENTARIO_PRODUCTO.PRECIO_COMPRA

    FROM INVENTARIO_PRODUCTO
    ORDER BY INVENTARIO_PRODUCTO.CODIGO
    INTO
      :DESCRIPCION,
      :CANTIDAD,
      :UNIDAD,
      :CODIGO,
      :PRECIO,
      :FECHA_ULTIMA_TRN,
      :CODIGO_TEXTO,
      :FECHA,
      :CODIGO_BARRA,
      :TIPO,
      :CANTIDAD_REORDEN,
      :PRECIO_ANT,
      :BLCE_CANT_ENTRADA,
      :BLCE_CANT_SALIDA,
      :STATUS,
      :PORC_DESCUENTO,
      :FOTO,
      :PAGA_ITBI,
      :CODIGO_PRECIO, :PRECIO_COMPRA
  DO
  BEGIN
 /* Para el Reporte Localidades no interesa */

    balance_en_ruta =0;
    cant_otro = 0;
    BLC_RUTA  =0;

    Select sum(i.cantidad)
    From inventario_almacen i, division_inventario d
    Where i.codigo =:CODIGO
    And d.Inventario_id = :inventarioid
    And d.inventario_id = i.inventario_id
    INTO 
    :cant_otro;
    
    if (cant_otro is not null) then
    BEGIN
      CANTIDAD = cant_otro;
    END else 
    BEGIN
      cant_otro = 0;
      CANTIDAD = cant_otro;
    END    

    /* balance_en_ruta = BLC_RUTA + cant_otro; */
    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROC_DATOS_REP_INV_VENCE` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_DATOS_REP_INV_VENCE
RETURNS(
  CODIGO INTEGER,
  LOTE_NUM VARCHAR(25) CHARACTER SET NONE,
  CODIGO_PROV INTEGER,
  CANT_IN INTEGER,
  CANT_OUT INTEGER,
  FECHA_VENCIMIENTO DATE,
  NOMBRE_PROVEEDOR VARCHAR(40) CHARACTER SET NONE,
  DESCRIPCION_PRODUCTO VARCHAR(80) CHARACTER SET NONE,
  CODIGO_TEXTO VARCHAR(40) CHARACTER SET NONE,
  DIASPORVENCER INTEGER,
  DIASVENCIDOS INTEGER)
AS
Declare Variable dias Integer;
BEGIN
  FOR
    SELECT LOTE.CODIGO,
           LOTE.LOTE_NUM,
           LOTE.CODIGO_PROV,
           LOTE.CANT_IN,
           LOTE.CANT_OUT,
           LOTE.FECHA_VENCIMIENTO,
           PROVEEDORES.DESCRIPCION,
           INVENTARIO_PRODUCTO.DESCRIPCION,
           INVENTARIO_PRODUCTO.CODIGO_TEXTO,
           F_AGEINDAYS("today", LOTE.FECHA_VENCIMIENTO)
    FROM INVENTARIO_PRODUCTO
       INNER JOIN LOTE ON (INVENTARIO_PRODUCTO.CODIGO = LOTE.CODIGO)
       INNER JOIN PROVEEDORES ON (LOTE.CODIGO_PROV = PROVEEDORES.CODIGO_CTE)
    WHERE  (LOTE.CANT_IN - LOTE.CANT_OUT) > 0
    INTO
      :CODIGO,
      :LOTE_NUM,
      :CODIGO_PROV,
      :CANT_IN,
      :CANT_OUT,
      :FECHA_VENCIMIENTO,
      :NOMBRE_PROVEEDOR,
      :DESCRIPCION_PRODUCTO,
      :CODIGO_TEXTO,
      :DIAS
  DO
  BEGIN    
    DiasVencidos=0;
    DiasPorVencer=0;
    IF (DIAS <= 0) THEN
    DiasVencidos = DIAS * -1;
    ELSE
    DiasPorVencer =  DIAS;
    if (F_YEAR(:FECHA_VENCIMIENTO)  = 1899) then
    begin
      DiasVencidos = 0;
      DiasPorVencer=0;
      FECHA_VENCIMIENTO = null;
    end
    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROC_DATOS_VENTA_DIARIA` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_DATOS_VENTA_DIARIA(
  FECHAINI DATE,
  FECHAFIN DATE)
RETURNS(
  CODIGO_CLIENTE INTEGER,
  NOMBRE_FACTURAR VARCHAR(40) CHARACTER SET NONE,
  NUMERO_DOCUMENTO INTEGER,
  VALOR_DOCUMENTO NUMERIC(15, 2),
  TIPO_TRANF SMALLINT,
  MONEDA CHAR(1) CHARACTER SET NONE,
  FECHA DATE,
  TIPO_DOC INTEGER,
  STATUS CHAR(1) CHARACTER SET NONE,
  DEBITO NUMERIC(15, 2),
  CREDITO NUMERIC(15, 2),
  TIPO_DOCUMENTO VARCHAR(30) CHARACTER SET NONE,
  NOMBRE_VENDEDOR VARCHAR(35) CHARACTER SET NONE,
  CODIGO_EMPLEADO INTEGER,
  CODIGO_PRODUCTO VARCHAR(40) CHARACTER SET NONE,
  PRECIO_PRODUCTO INTEGER,
  DESCUENTO NUMERIC(15, 2),
  DESCRIPCION_PRODUCTO VARCHAR(60) CHARACTER SET NONE,
  CANTIDAD NUMERIC(15, 2),
  DESC_PRODUCTO VARCHAR(40) CHARACTER SET NONE,
  DESC_TIPO_INVENTARIO VARCHAR(30) CHARACTER SET NONE,
  XTIPO_INVENTARIO INTEGER,
  STATUS_DET CHAR(1) CHARACTER SET NONE,
  NUMERO_TRN INTEGER,
  MONTO_INICIAL NUMERIC(15, 2))
AS
DECLARE VARIABLE XNUM_DOC  VARCHAR(20);   
DECLARE VARIABLE esFinanciamiento smallint;
DECLARE VARIABLE XNOMBRE_CLIENTE VARCHAR(40);
DECLARE VARIABLE montoCobrado numeric(15,2);
BEGIN
FOR
SELECT
   Ingresos.CODIGO_CTE,
   Clientes.NOMBRE_FACTURAR,
   Ingresos.NUMERO,
   /*Ingresos.Valor_ing,*/
   fctingresos.monto_fact,
   null,
   Ingresos.MONEDA,
   Ingresos.FECHA,
   2, /* tipo_doc */
   Ingresos.Status,
   0,
   0,
   "Ing. Cxc", null, cod_empleado, Ingresos.Valor_ing, INGRESOS.CONCEPTO
FROM INGRESOS Ingresos
   INNER JOIN CLIENTES Clientes
   ON  (Ingresos.CODIGO_CTE = Clientes.CODIGO_CTE)
   Inner join tipo_cliente tipo_cliente On
   (Clientes.tipo_cliente = tipo_cliente.CODIGO)
   LEFT OUTER JOIN FCTINGRESOS Fctingresos
   ON  (Ingresos.NUMERO = Fctingresos.NUMERO)
   AND  (Ingresos.TIPO = Fctingresos.TIPO)
WHERE   Ingresos.STATUS IN ('A', 'P','C')
   AND  (Ingresos.TIPO_ING = 2)
   AND Ingresos.Fecha Between :fechaini And :fechafin
INTO
      :CODIGO_CLIENTE,
      :NOMBRE_FACTURAR,
      :NUMERO_DOCUMENTO,
      :VALOR_DOCUMENTO,
      :TIPO_TRANF,
      :MONEDA,
      :FECHA,
      :TIPO_DOC,
      :STATUS, 
      :debito, 
      :credito, 
      :TIPO_DOCUMENTO,
      :NOMBRE_VENDEDOR,
      :CODIGO_EMPLEADO,
      :montoCobrado, :DESCRIPCION_PRODUCTO 
 DO
  BEGIN
    if (:TIPO_DOC = 1) then
    begin
      debito = :valor_documento;
      TIPO_TRANF = 1;
    end else
    if (:TIPO_DOC = 2) then
    begin
      TIPO_TRANF = 2;
      if (valor_documento is null) then
      begin
      credito = :montoCobrado;
      valor_documento = :montoCobrado;
      end else
      begin
        credito = :valor_documento;
      end      
    end
    if (:STATUS = 'C') then
    begin
      credito = 0;
      debito = 0;
      valor_documento = 0;
      DESCRIPCION_PRODUCTO = '*** CANCELADO ***'; 
    end    
    SUSPEND;
  END
/*  END INGRESOS CXC   */
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
          (TRANS_CXC.STATUS IN ("A"))
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
    if (:TIPO_DOC in (1,2,3,4)) then
    begin
      debito = :valor_documento;
      TIPO_TRANF = 1;
    end else
    if (:TIPO_DOC In (7,8)) then
    begin
      TIPO_TRANF = 2;
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
       2,
       VENTAS_MAST.MONEDA,
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
       VENTAS_DET.DESCRIPCION,
       VENTAS_DET.CANTIDAD,
       INVENTARIO_PRODUCTO.DESCRIPCION,
       TIPO_INVENTARIO.DESCRIPCION, TIPO_INVENTARIO.CODIGO,
       VENTAS_DET.STATUS_DET, 
       Ventas_Mast.Numero, 
       Ventas_Mast.Numero_Doc_Pago, VENTAS_MAST.NOMBRE_CLIENTE_GENERAL 
FROM VENTAS_DET
   INNER JOIN VENTAS_MAST ON (VENTAS_DET.NUMERO = VENTAS_MAST.NUMERO)
   LEFT OUTER JOIN EMPLEADO ON (VENTAS_MAST.CODIGO_VENDEDOR = EMPLEADO.CODIGO)
   LEFT OUTER JOIN CLIENTES ON (VENTAS_MAST.CODIGO_CTE = CLIENTES.CODIGO_CTE)
   LEFT OUTER JOIN TIPO_PAGO ON (VENTAS_MAST.FORMA_PAGO = TIPO_PAGO.CODIGO)
   LEFT OUTER JOIN INVENTARIO_PRODUCTO ON (VENTAS_DET.CODIGO_PROD = INVENTARIO_PRODUCTO.CODIGO_TEXTO)
   LEFT OUTER JOIN TIPO_INVENTARIO ON (INVENTARIO_PRODUCTO.TIPO = TIPO_INVENTARIO.CODIGO)
WHERE
   (
   (VENTAS_MAST.FECHA Between :Fechaini And :Fechafin)
   And 
   --VENTAS_MAST.MONTO_INICIAL is null and 
   (VENTAS_MAST.STATUS IN ("C","A", "R", "D", "P"))
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
      :DESCRIPCION_PRODUCTO, :cantidad,
      :DESC_PRODUCTO, :DESC_TIPO_INVENTARIO,
      :xtipo_inventario,
      :STATUS_DET, :numero_trn, :XNUM_DOC, :XNOMBRE_CLIENTE
  DO
  BEGIN
    esFinanciamiento = 0;
    Select FINANCIAMIENTO.NUMERO_TRN from FINANCIAMIENTO
    Where numero_trn = :numero_trn
    into
    :esFinanciamiento;
    
    if (esFinanciamiento is not null and esFinanciamiento > 0) then
    begin
      TIPO_DOC = 16;
      TIPO_DOCUMENTO = 'Vta.Financiada ';
    end
    
    
    IF (UPPER(:STATUS_DET) = "C") THEN
    BEGIN
      Debito = 0;
      Credito = 0;
      Valor_documento = 0;
      Cantidad = 0;
      DESCRIPCION_PRODUCTO = '*** Venta Cancelada ***';
    END
    IF (:TIPO_DOC in (1,2,3,4)) THEN
    BEGIN
      debito = :valor_documento;
      TIPO_TRANF=1;
    END ELSE
    IF (:TIPO_DOC in (6,7,8,16)) THEN
    BEGIN
      TIPO_TRANF = 2;
      credito = :valor_documento;
    END    
    if (:XNUM_DOC <> "") then
    NUMERO_DOCUMENTO =:XNUM_DOC;
    
     if (:XNOMBRE_CLIENTE <> "")  then
    NOMBRE_FACTURAR = :XNOMBRE_CLIENTE;        
    SUSPEND;
  END
  --Detalle Monto Inicial x Venta con Financiamiento
  For
  SELECT 
  VENTAS_MAST.CODIGO_CTE,
  CLIENTES.NOMBRE_FACTURAR,
  VENTAS_MAST.NUMERO_FACTURA,
  VENTAS_DET.VALOR_TOTAL_DET,
  2 AS FIELD_1,
  VENTAS_MAST.MONEDA,
  VENTAS_MAST.FECHA,
  15, --Inicial financiamiento
  VENTAS_MAST.STATUS,
  0 AS FIELD_2,
  0 AS FIELD_3,
  'Inicial Financiamiento',--TIPO_PAGO.DESCRIPCION,
  EMPLEADO.NOMBRE||" " ||EMPLEADO.APELLIDO AS NOMBRE,
  EMPLEADO.CODIGO,
  VENTAS_DET.CODIGO_PROD,
  VENTAS_DET.PRECIO,
  VENTAS_DET.PORC_DESC_DET,
  VENTAS_DET.DESCRIPCION,
  VENTAS_DET.CANTIDAD,
  INVENTARIO_PRODUCTO.DESCRIPCION,
  TIPO_INVENTARIO.DESCRIPCION,
  TIPO_INVENTARIO.CODIGO,
  VENTAS_DET.STATUS_DET,
  VENTAS_MAST.NUMERO,
  VENTAS_MAST.NUMERO_DOC_PAGO,
  FINANCIAMIENTO.MONTOINICIAL, VENTAS_MAST.NOMBRE_CLIENTE_GENERAL 
FROM
  VENTAS_DET
  INNER JOIN VENTAS_MAST ON (VENTAS_DET.NUMERO = VENTAS_MAST.NUMERO)
  LEFT OUTER JOIN EMPLEADO ON (VENTAS_MAST.CODIGO_VENDEDOR = EMPLEADO.CODIGO)
  LEFT OUTER JOIN CLIENTES ON (VENTAS_MAST.CODIGO_CTE = CLIENTES.CODIGO_CTE)
  --LEFT OUTER JOIN TIPO_PAGO ON (VENTAS_MAST.FORMA_PAGO = TIPO_PAGO.CODIGO)
  LEFT OUTER JOIN INVENTARIO_PRODUCTO ON (VENTAS_DET.CODIGO_PROD = INVENTARIO_PRODUCTO.CODIGO_TEXTO)
  LEFT OUTER JOIN TIPO_INVENTARIO ON (INVENTARIO_PRODUCTO.TIPO = TIPO_INVENTARIO.CODIGO)
  INNER JOIN FINANCIAMIENTO ON (VENTAS_MAST.NUMERO = FINANCIAMIENTO.NUMERO_TRN)
WHERE
  (VENTAS_MAST.FECHA BETWEEN  :Fechaini And :Fechafin) AND 
  (FINANCIAMIENTO.MONTOINICIAL > 0) AND
  (VENTAS_MAST.STATUS IN ('C','A','R','D','P'))
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
      :DESCRIPCION_PRODUCTO, :cantidad,
      :DESC_PRODUCTO, :DESC_TIPO_INVENTARIO,
      :xtipo_inventario,
      :STATUS_DET, :numero_trn, :XNUM_DOC, :monto_inicial,:XNOMBRE_CLIENTE
  DO
  BEGIN
    IF (UPPER(:STATUS_DET) = "C") THEN
    BEGIN
      Debito = 0;
      Credito = 0;
      monto_inicial = 0;
      Cantidad = 0;
      DESCRIPCION_PRODUCTO = '*** Venta Cancelada ***';
    END
    IF (:TIPO_DOC in (1,2,3,4)) THEN
    BEGIN
      debito = :monto_inicial;
      TIPO_TRANF=1;
    END ELSE
    IF (:TIPO_DOC in (15)) THEN
    BEGIN
      TIPO_TRANF = 2;
      credito = :monto_inicial;
    END
    if (:XNUM_DOC <> "") then
    NUMERO_DOCUMENTO =:XNUM_DOC;
 if (:XNOMBRE_CLIENTE <> "")  then
    NOMBRE_FACTURAR = :XNOMBRE_CLIENTE;            
   
    SUSPEND;
  END   
END^

SET TERM ; ^

/* Definition for the `PROC_DATOS_VENTA_DIA_MES` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_DATOS_VENTA_DIA_MES(
  FECHAINI DATE,
  FECHAFIN DATE)
RETURNS(
  MES SMALLINT,
  DIA SMALLINT,
  MONEDA CHAR(1) CHARACTER SET NONE,
  MONTO NUMERIC(15, 2))
AS
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
END^

SET TERM ; ^

/* Definition for the `PROC_ESTADO_CTA_CXC` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_ESTADO_CTA_CXC(
  FECHAINI DATE,
  FECHAFIN DATE,
  CODIGOCTE INTEGER)
RETURNS(
  SERIE INTEGER,
  TIPOSERVICIO INTEGER,
  DESCRIPCION VARCHAR(40) CHARACTER SET NONE,
  FECHA_DET DATE,
  CODIGO_CTE INTEGER,
  NOMBRE_FACTURAR VARCHAR(120) CHARACTER SET NONE,
  NOMBRE_CLIENTE_DET VARCHAR(60) CHARACTER SET NONE,
  DIRECCION_CONT VARCHAR(60) CHARACTER SET NONE,
  FAX_CONTACTO VARCHAR(20) CHARACTER SET NONE,
  WEBSITE VARCHAR(40) CHARACTER SET NONE,
  PAIS VARCHAR(30) CHARACTER SET NONE,
  CIUDAD VARCHAR(30) CHARACTER SET NONE,
  CANTIDAD_DETA INTEGER,
  CANT_ADULTO_DETA INTEGER,
  TARIFA_SERV_DETA NUMERIC(15, 2),
  MONEDA_DET CHAR(1) CHARACTER SET NONE,
  PORC_DESC_DET NUMERIC(15, 2),
  VALOR_SERVICIO_DET NUMERIC(15, 2),
  VALOR_TOTAL_DET NUMERIC(15, 2),
  NUM_FACT_DET INTEGER,
  NUMERO_RECIBO INTEGER,
  IMPUESTO_SERV_DET NUMERIC(15, 2),
  STATUS_DET CHAR(1) CHARACTER SET NONE,
  COD_AREA_FACT INTEGER,
  CONTACTO VARCHAR(40) CHARACTER SET NONE,
  TELEF_CONTACTO VARCHAR(20) CHARACTER SET NONE,
  EMAIL VARCHAR(40) CHARACTER SET NONE,
  AREA VARCHAR(60) CHARACTER SET NONE,
  ORIGEN INTEGER,
  VALOR_INGRESO_RECIBO NUMERIC(15, 2),
  TIPO_DOC SMALLINT,
  DEBITO NUMERIC(15, 2),
  CREDITO NUMERIC(15, 2))
AS
declare variable v integer;
begin
  For
      Select
           serie,
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
           VALOR_TOTAL_DET DEBITO,
           0 CREDITO
        From PROC_SERV(:FECHAINI,:FECHAFIN)
        Where codigo_cte =:CODIGOCTE
        And origen = 1
        Into
           :serie,
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
 begin
 Suspend;
end
 For
      Select
           serie,
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
        From PROC_SERV(:FECHAINI,:FECHAFIN)
        Where codigo_cte =:CODIGOCTE
        And origen = 2
        Into
           :serie,
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
End^

SET TERM ; ^

/* Definition for the `PROC_ESTADO_CTA_CXC_D2_08` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_ESTADO_CTA_CXC_D2_08(
  FECHAINI DATE,
  FECHAFIN DATE,
  CODIGOCTE INTEGER)
RETURNS(
  TIPOSERVICIO INTEGER,
  DESCRIPCION VARCHAR(40) CHARACTER SET NONE,
  FECHA_DET DATE,
  CODIGO_CTE INTEGER,
  NOMBRE_FACTURAR VARCHAR(40) CHARACTER SET NONE,
  NOMBRE_CLIENTE_DET VARCHAR(40) CHARACTER SET NONE,
  DIRECCION_CONT VARCHAR(60) CHARACTER SET NONE,
  FAX_CONTACTO VARCHAR(14) CHARACTER SET NONE,
  WEBSITE VARCHAR(40) CHARACTER SET NONE,
  PAIS VARCHAR(30) CHARACTER SET NONE,
  CIUDAD VARCHAR(30) CHARACTER SET NONE,
  CANTIDAD_DETA INTEGER,
  CANT_ADULTO_DETA INTEGER,
  TARIFA_SERV_DETA NUMERIC(15, 2),
  MONEDA_DET CHAR(1) CHARACTER SET NONE,
  PORC_DESC_DET NUMERIC(15, 2),
  VALOR_SERVICIO_DET NUMERIC(15, 2),
  VALOR_TOTAL_DET NUMERIC(15, 2),
  NUM_FACT_DET INTEGER,
  NUMERO_RECIBO INTEGER,
  IMPUESTO_SERV_DET NUMERIC(15, 2),
  STATUS_DET CHAR(1) CHARACTER SET NONE,
  COD_AREA_FACT INTEGER,
  CONTACTO VARCHAR(40) CHARACTER SET NONE,
  TELEF_CONTACTO VARCHAR(14) CHARACTER SET NONE,
  EMAIL VARCHAR(40) CHARACTER SET NONE,
  AREA VARCHAR(20) CHARACTER SET NONE,
  ORIGEN INTEGER,
  VALOR_INGRESO_RECIBO NUMERIC(15, 2),
  TIPO_DOC SMALLINT,
  DEBITO NUMERIC(15, 2),
  CREDITO NUMERIC(15, 2))
AS
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

        From PROC_SERV_n2_08(:FECHAINI,:FECHAFIN)
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

        From PROC_SERV_n2_08 (:FECHAINI,:FECHAFIN)
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
End^

SET TERM ; ^

/* Definition for the `PROC_ESTADO_CTA_CXP` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_ESTADO_CTA_CXP(
  FECHAINI DATE,
  FECHAFIN DATE,
  CODIGOCTE INTEGER)
RETURNS(
  SERIE INTEGER,
  TIPOSERVICIO INTEGER,
  DESCRIPCION VARCHAR(40) CHARACTER SET NONE,
  FECHA_DET DATE,
  CODIGO_CTE INTEGER,
  NOMBRE_FACTURAR VARCHAR(120) CHARACTER SET NONE,
  NOMBRE_CLIENTE_DET VARCHAR(60) CHARACTER SET NONE,
  DIRECCION_CONT VARCHAR(60) CHARACTER SET NONE,
  FAX_CONTACTO VARCHAR(20) CHARACTER SET NONE,
  WEBSITE VARCHAR(40) CHARACTER SET NONE,
  PAIS VARCHAR(30) CHARACTER SET NONE,
  CIUDAD VARCHAR(30) CHARACTER SET NONE,
  CANTIDAD_DETA INTEGER,
  CANT_ADULTO_DETA INTEGER,
  TARIFA_SERV_DETA NUMERIC(15, 2),
  MONEDA_DET CHAR(1) CHARACTER SET NONE,
  PORC_DESC_DET NUMERIC(15, 2),
  VALOR_SERVICIO_DET NUMERIC(15, 2),
  VALOR_TOTAL_DET NUMERIC(15, 2),
  NUM_FACT_DET INTEGER,
  NUMERO_RECIBO INTEGER,
  IMPUESTO_SERV_DET NUMERIC(15, 2),
  STATUS_DET CHAR(1) CHARACTER SET NONE,
  COD_AREA_FACT INTEGER,
  CONTACTO VARCHAR(40) CHARACTER SET NONE,
  TELEF_CONTACTO VARCHAR(20) CHARACTER SET NONE,
  EMAIL VARCHAR(40) CHARACTER SET NONE,
  AREA VARCHAR(60) CHARACTER SET NONE,
  ORIGEN INTEGER,
  VALOR_INGRESO_RECIBO NUMERIC(15, 2),
  TIPO_DOC SMALLINT,
  DEBITO NUMERIC(15, 2),
  CREDITO NUMERIC(15, 2))
AS
declare variable v integer;
begin
  For
      Select
           serie,
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
           VALOR_TOTAL_DET DEBITO,
           0 CREDITO
        From PROC_SERV_cxp(:FECHAINI,:FECHAFIN)
        Where codigo_cte =:CODIGOCTE
        And origen = 1
        Into
           :serie,
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
 begin
 Suspend;
end
 For
      Select
           serie,
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
        From PROC_SERV_cxp(:FECHAINI,:FECHAFIN)
        Where codigo_cte =:CODIGOCTE
        And origen = 2
        Into
           :serie,
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

End^

SET TERM ; ^

/* Definition for the `PROC_FACTURAS_PENDIENTES_U1` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_FACTURAS_PENDIENTES_U1(
  TIPO INTEGER,
  MONEDA CHAR(1) CHARACTER SET NONE,
  NUMERO_FACT INTEGER,
  MONTO_PENDIENTE NUMERIC(15, 2),
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE)
AS
BEGIN
  UPDATE FACTURAS_PENDIENTES
  SET
    MONTO_PENDIENTE = :MONTO_PENDIENTE,        
    FECHA_MOD = :FECHA_MOD,
    MOD_POR = :MOD_POR
  WHERE
  (TIPO = :TIPO) AND 
  (MONEDA = :MONEDA) AND 
  (NUMERO_FACT = :NUMERO_FACT);
END^

SET TERM ; ^

/* Definition for the `PROC_GENERA_FACTPLAN` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_GENERA_FACTPLAN(
  FECHA DATE,
  XDESCRIPCION VARCHAR(40) CHARACTER SET NONE,
  CODIGOUSUARIO INTEGER)
AS
DECLARE VARIABLE XID_TIPO_PLAN SMALLINT;
DECLARE VARIABLE XCODIGO_CTE INTEGER;
DECLARE VARIABLE XPRECIO NUMERIC(15, 2);
DECLARE VARIABLE XSERIE INTEGER;
DECLARE VARIABLE XNUMERO INTEGER;
DECLARE VARIABLE EXISTE_CTE INTEGER;
DECLARE VARIABLE XTIPO_NCF VARCHAR(2);
DECLARE VARIABLE XCARGAR_ITBIS SMALLINT;
BEGIN
  FOR
    SELECT ID_TIPO_PLAN, CODIGO_CTE, TIPO_NCF, CARGAR_ITBIS
    FROM PLAN_FUNERARIO
    WHERE STATUS = "A" AND FECHA_PAGO <=:FECHA
    INTO :XID_TIPO_PLAN, :XCODIGO_CTE, :XTIPO_NCF, :XCARGAR_ITBIS
  DO
  BEGIN
    SELECT
      TARIFA_TIPO_PLAN.PRECIO
    FROM
      TARIFA_TIPO_PLAN
    WHERE ID_TIPO=:XID_TIPO_PLAN
    AND :FECHA BETWEEN FECHA_INICIAL AND FECHA_FINAL
    INTO
    :XPRECIO;

    Select Gen_id(GEN_SERIE_FACTURA,1) From rdb$database
    INTO :XSERIE;

    SELECT MAX(NUMERO)
    FROM facturas
    INTO
    :XNUMERO;

    IF (XNUMERO <= 0) THEN
    BEGIN
      XNUMERO =0;
    END
    XNUMERO = XNUMERO + 1;

    INSERT INTO FACTURAS(SERIE,NUMERO,MONEDA,TIPO,CODIGO_CTE,FECHA,DESCRIPCION,
    MONTO_FACT, STATUS, FECHA_IN,IN_POR)
    VALUES(:XSERIE, :XNUMERO, "1",2,:XCODIGO_CTE, :FECHA, :XDESCRIPCION,
    :XPRECIO,"A","TODAY","AUTO");

    INSERT INTO
    FACTURAS_PENDIENTES(TIPO,MONEDA,NUMERO_FACT,MONTO_PENDIENTE,STATUS)
    Select TIPO,MONEDA,NUMERO,MONTO_FACT,"A"
    From facturas
    WHERE FECHA BETWEEN :FECHA AND :FECHA
    And moneda = "1"
    And Numero =:XNUMERO;

    UPDATE FACTURAS
    SET STATUS = "F"
    Where Numero =:XNUMERO;

    Select Gen_id(GEN_SERIE_TRN_CXC,1) From rdb$database
    INTO :XSERIE;

    Insert into TRANS_CXC(serie, tipo_doc, moneda, fecha, numero_doc,
    codigo_cliente, codigo_serv, concepto, valor_documento, tipo_tranf,
    status, tipo_serv,fecha_in, in_por, CODIGO_VENDEDOR)
    Values(:XSERIE,1,"1",:fecha,:XNUMERO,:xcodigo_cte,0,:XDESCRIPCION,
    :xprecio,1,"A",2,"today","AUTO",:CODIGOUSUARIO);

    UPDATE TRANS_CXC
    SET STATUS = "R"
    WHERE SERIE = :XSERIE;


    Select CODIGO From BALANCE_CTE
    Where codigo=:xcodigo_cte
    INTO
    :EXISTE_CTE;

    IF (:EXISTE_CTE > 0) THEN /* UPDATE */
    BEGIN
       UPDATE BALANCE_CTE
       SET BALANCE_ANT = BALANCE_ACT,
       BALANCE_ACT = BALANCE_ACT + :XPRECIO,
       DEBITO_MES = DEBITO_MES + :XPRECIO,
       DEBITO_ACM  = DEBITO_ACM + :XPRECIO,
       FECHA_BCE =:FECHA,
       FECHA_MOD ="TODAY"
       WHERE CODIGO=:XCODIGO_CTE;
    END ELSE
    BEGIN
      INSERT INTO BALANCE_CTE(CODIGO,SERVICIO,MONEDA,BALANCE_ACT,
      BALANCE_ANT,DEBITO_MES,CREDITO_MES,DEBITO_ACM,CREDITO_ACM, FECHA_BCE,
      FECHA_IN,IN_POR)
      VALUES(:XCODIGO_CTE,1,"1",:XPRECIO,0,:XPRECIO,0,:XPRECIO,0,:FECHA,
      "TODAY","AUTO");
    END

    EXISTE_CTE = -1;
    Select CODIGO_CTE From BLC_PLAN_FUNERARIO
    Where codigo_CTE=:xcodigo_cte
    INTO
    :EXISTE_CTE;

    IF (:EXISTE_CTE > 0) THEN /* UPDATE */
    BEGIN
       UPDATE BLC_PLAN_FUNERARIO
       SET BALANCE_ANT = BALANCE_ACT,
       BALANCE_ACT = BALANCE_ACT + :XPRECIO,
       DEBITO_ACM  = DEBITO_ACM + :XPRECIO,
       FECHA_BLCE =:FECHA
       WHERE CODIGO_CTE=:XCODIGO_CTE;
    END ELSE
    BEGIN
      INSERT INTO BLC_PLAN_FUNERARIO(CODIGO_CTE,BALANCE_ACT,
      BALANCE_ANT,DEBITO_ACM,CREDITO_ACM, FECHA_BLCE,STATUS)
      VALUES(:XCODIGO_CTE,:XPRECIO,0,:XPRECIO,0,:FECHA,"A");
    END

    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROC_GENERA_FACTPLAN_NEW` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_GENERA_FACTPLAN_NEW(
  FECHA DATE,
  XDESCRIPCION VARCHAR(40) CHARACTER SET NONE,
  CODIGOUSUARIO INTEGER,
  XID_TIPO_PLAN SMALLINT,
  XCODIGO_CTE INTEGER,
  XPRECIO NUMERIC(15, 2),
  XNUMERO INTEGER,
  XTIPO_NCF VARCHAR(2) CHARACTER SET NONE,
  XCARGAR_ITBIS SMALLINT)
AS
DECLARE VARIABLE EXISTE_CTE INTEGER;
DECLARE VARIABLE XSERIE INTEGER;
BEGIN
   /* SELECT
      TARIFA_TIPO_PLAN.PRECIO
    FROM TARIFA_TIPO_PLAN
    WHERE ID_TIPO=:XID_TIPO_PLAN
    AND :FECHA BETWEEN FECHA_INICIAL AND FECHA_FINAL
    INTO
    :XPRECIO;

    SELECT MAX(NUMERO)
    FROM facturas
    INTO
    :XNUMERO;

    IF (XNUMERO <= 0) THEN
    BEGIN
      XNUMERO =0;
    END
    XNUMERO = XNUMERO + 1;*/

    Select Gen_id(GEN_SERIE_FACTURA,1) From rdb$database
    INTO :XSERIE;

    INSERT INTO FACTURAS(SERIE,NUMERO,MONEDA,TIPO,CODIGO_CTE,FECHA,DESCRIPCION,
    MONTO_FACT, STATUS, FECHA_IN,IN_POR)
    VALUES(:XSERIE, :XNUMERO, "1",2,:XCODIGO_CTE, :FECHA, :XDESCRIPCION,
    :XPRECIO,"A","TODAY","AUTO");

    INSERT INTO
    FACTURAS_PENDIENTES(TIPO,MONEDA,NUMERO_FACT,MONTO_PENDIENTE,STATUS)
    Select TIPO,MONEDA,NUMERO,MONTO_FACT,"A"
    From facturas
    WHERE FECHA BETWEEN :FECHA AND :FECHA
    And moneda = "1"
    And Numero =:XNUMERO;

    UPDATE FACTURAS
    SET STATUS = "F"
    Where Numero =:XNUMERO;

    SELECT Gen_id(GEN_SERIE_TRN_CXC,1) From rdb$database
    INTO :XSERIE;

    Insert into TRANS_CXC(serie, tipo_doc, moneda, fecha, numero_doc,
    codigo_cliente, codigo_serv, concepto, valor_documento, tipo_tranf,
    status, tipo_serv,fecha_in, in_por, CODIGO_VENDEDOR)
    Values(:XSERIE,1,"1",:fecha,:XNUMERO,:xcodigo_cte,0,:XDESCRIPCION,
    :xprecio,1,"A",2,"today","AUTO",:CODIGOUSUARIO);

    UPDATE TRANS_CXC
    SET STATUS = "R"
    WHERE SERIE = :XSERIE;

    Select CODIGO From BALANCE_CTE
    Where codigo=:xcodigo_cte
    INTO
    :EXISTE_CTE;

    IF (:EXISTE_CTE > 0) THEN /* UPDATE */
    BEGIN
       UPDATE BALANCE_CTE
       SET BALANCE_ANT = BALANCE_ACT,
       BALANCE_ACT = BALANCE_ACT + :XPRECIO,
       DEBITO_MES = DEBITO_MES + :XPRECIO,
       DEBITO_ACM  = DEBITO_ACM + :XPRECIO,
       FECHA_BCE =:FECHA,
       FECHA_MOD ="TODAY"
       WHERE CODIGO=:XCODIGO_CTE;
    END ELSE
    BEGIN
      INSERT INTO BALANCE_CTE(CODIGO,SERVICIO,MONEDA,BALANCE_ACT,
      BALANCE_ANT,DEBITO_MES,CREDITO_MES,DEBITO_ACM,CREDITO_ACM, FECHA_BCE,
      FECHA_IN,IN_POR)
      VALUES(:XCODIGO_CTE,1,"1",:XPRECIO,0,:XPRECIO,0,:XPRECIO,0,:FECHA,
      "TODAY","AUTO");
    END

    EXISTE_CTE = -1;
    Select CODIGO_CTE From BLC_PLAN_FUNERARIO
    Where codigo_CTE=:xcodigo_cte
    INTO
    :EXISTE_CTE;

    IF (:EXISTE_CTE > 0) THEN /* UPDATE */
    BEGIN
       UPDATE BLC_PLAN_FUNERARIO
       SET BALANCE_ANT = BALANCE_ACT,
       BALANCE_ACT = BALANCE_ACT + :XPRECIO,
       DEBITO_ACM  = DEBITO_ACM + :XPRECIO,
       FECHA_BLCE =:FECHA
       WHERE CODIGO_CTE=:XCODIGO_CTE;
    END ELSE
    BEGIN
      INSERT INTO BLC_PLAN_FUNERARIO(CODIGO_CTE,BALANCE_ACT,
      BALANCE_ANT,DEBITO_ACM,CREDITO_ACM, FECHA_BLCE,STATUS)
      VALUES(:XCODIGO_CTE,:XPRECIO,0,:XPRECIO,0,:FECHA,"A");
    END
    SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_GEN_NUM_ORDEN` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_GEN_NUM_ORDEN
RETURNS(
  NUMERO_SERIE INTEGER,
  NUMERO_ORDEN INTEGER)
AS
DECLARE VARIABLE XNUMERO INTEGER;
BEGIN
  For
    Select numero From orden_comp_mast
    Where (num_orden is null ) or (num_orden = 0)
    into 
    :numero_serie
  Do
  BEGIN
    SELECT Gen_id(GEN_NUM_ORDEN, 1) From rdb$database
    INTO
    :XNUMERO;
    UPDATE ORDEN_COMP_MAST
    SET NUM_ORDEN = :XNUMERO
    WHERE NUMERO = :NUMERO_SERIE;
    NUMERO_ORDEN=:XNUMERO;
  END
SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_GETDATOSCOTIZA_NEW` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_GETDATOSCOTIZA_NEW(
  NUMEROCOTIZA INTEGER)
RETURNS(
  TIPO_CLIENTE SMALLINT,
  NOMBRE_CTE VARCHAR(60) CHARACTER SET NONE,
  NOMBRE_ABREV VARCHAR(30) CHARACTER SET NONE,
  NOMBRE_FACTURAR VARCHAR(40) CHARACTER SET NONE,
  DIRECCION_CONT VARCHAR(60) CHARACTER SET NONE,
  TELEF_CONTACTO VARCHAR(14) CHARACTER SET NONE,
  FORMA_PAGO SMALLINT,
  LIMITE_CREDITO NUMERIC(15, 2),
  EMAIL VARCHAR(40) CHARACTER SET NONE,
  PAIS VARCHAR(30) CHARACTER SET NONE,
  CIUDAD VARCHAR(30) CHARACTER SET NONE,
  CEDULA CHAR(15) CHARACTER SET NONE,
  RNC VARCHAR(12) CHARACTER SET NONE,
  CANT_DIAS_CREDITO SMALLINT,
  RNC_NUMERO VARCHAR(14) CHARACTER SET NONE,
  CONDICION SMALLINT,
  PRECIO_ID SMALLINT,
  NUMERO INTEGER,
  FECHA DATE,
  CIA_KEY SMALLINT,
  FECHA_VENCE DATE,
  CODIGO_CTE SMALLINT,
  CODIGO_VENDEDOR SMALLINT,
  OBSERVACION VARCHAR(60) CHARACTER SET NONE,
  MONEDA CHAR(1) CHARACTER SET NONE,
  VALOR_TOTAL NUMERIC(15, 2),
  STATUS CHAR(1) CHARACTER SET NONE,
  FECHA_IN DATE,
  IN_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  NUMERO_FACTURA SMALLINT,
  NUMERO_DOC_PAGO VARCHAR(20) CHARACTER SET NONE,
  SERIE_NCF_ASIGNADO SMALLINT,
  MONTO_BRUTO NUMERIC(15, 2),
  PORC_DESCUENTO SMALLINT,
  MONTO_DESCUENTO NUMERIC(15, 2),
  MONTO_INICIAL NUMERIC(15, 2),
  NOMBRE_CLIENTE_GENERAL VARCHAR(60) CHARACTER SET NONE,
  MONTO_PAGADO NUMERIC(15, 2),
  MONTO_CAMBIO NUMERIC(15, 2),
  MONTO_TOTAL_ITBIS NUMERIC(15, 2),
  MONTODESCGASTOSADMIN NUMERIC(15, 2),
  MONTODESCITBISGASTOSADMIN NUMERIC(15, 2),
  MONTODESCTRANSP NUMERIC(15, 2),
  MONTODESCDIRTECNICA NUMERIC(15, 2),
  MONTODESCITBISDIRTECNICA NUMERIC(15, 2),
  MONTODESCIMPREVISTO NUMERIC(15, 2),
  MONTODESCITBISIMPREVISTO NUMERIC(15, 2),
  TIPO_FACTURA SMALLINT,
  APLICA_TIPODESC SMALLINT,
  MONEDA_FACT CHAR(1) CHARACTER SET NONE)
AS
BEGIN
  FOR
    SELECT 
      CLIENTES.TIPO_CLIENTE,
      CLIENTES.NOMBRE_CTE,
      CLIENTES.NOMBRE_ABREV,
      CLIENTES.NOMBRE_FACTURAR,
      CLIENTES.DIRECCION_CONT,
      CLIENTES.TELEF_CONTACTO,
      CLIENTES.FORMA_PAGO,
      CLIENTES.LIMITE_CREDITO,
      CLIENTES.EMAIL,
      CLIENTES.PAIS,
      CLIENTES.CIUDAD,
      CLIENTES.CEDULA,
      CLIENTES.RNC,
      CLIENTES.CANT_DIAS_CREDITO,
      CLIENTES.RNC_NUMERO,
      CLIENTES.CONDICION,
      CLIENTES.PRECIO_ID,
      COTIZACION_MAST.NUMERO,
      COTIZACION_MAST.FECHA,
      COTIZACION_MAST.CIA_KEY,
      COTIZACION_MAST.FECHA_VENCE,
      COTIZACION_MAST.CODIGO_CTE,
      COTIZACION_MAST.CODIGO_VENDEDOR,
      COTIZACION_MAST.OBSERVACION,
      COTIZACION_MAST.MONEDA,
      COTIZACION_MAST.VALOR_TOTAL,
      COTIZACION_MAST.STATUS,
      COTIZACION_MAST.FECHA_IN,
      COTIZACION_MAST.IN_POR,
      COTIZACION_MAST.FECHA_MOD,
      COTIZACION_MAST.MOD_POR,
      COTIZACION_MAST.NUMERO_FACTURA,
      COTIZACION_MAST.NUMERO_DOC_PAGO,
      COTIZACION_MAST.SERIE_NCF_ASIGNADO,
      COTIZACION_MAST.MONTO_BRUTO,
      COTIZACION_MAST.PORC_DESCUENTO,
      COTIZACION_MAST.MONTO_DESCUENTO,
      COTIZACION_MAST.MONTO_INICIAL,
      COTIZACION_MAST.NOMBRE_CLIENTE_GENERAL,
      COTIZACION_MAST.MONTO_PAGADO,
      COTIZACION_MAST.MONTO_CAMBIO,
      COTIZACION_MAST.MONTO_TOTAL_ITBIS,
      COTIZACION_MAST.MONTODESCGASTOSADMIN,
      COTIZACION_MAST.MONTODESCITBISGASTOSADMIN,
      COTIZACION_MAST.MONTODESCTRANSP,
      COTIZACION_MAST.MONTODESCDIRTECNICA,
      COTIZACION_MAST.MONTODESCITBISDIRTECNICA,
      COTIZACION_MAST.MONTODESCIMPREVISTO,
      COTIZACION_MAST.MONTODESCITBISIMPREVISTO,
      COTIZACION_MAST.TIPO_FACTURA,
      COTIZACION_MAST.APLICA_TIPODESC,
      CLIENTES.MONEDA_FACT
    FROM
      COTIZACION_MAST
      INNER JOIN CLIENTES ON (COTIZACION_MAST.CODIGO_CTE = CLIENTES.CODIGO_CTE)
      Where COTIZACION_MAST.NUMERO =:numerocotiza 
    INTO
      :TIPO_CLIENTE,
      :NOMBRE_CTE,
      :NOMBRE_ABREV,
      :NOMBRE_FACTURAR,
      :DIRECCION_CONT,
      :TELEF_CONTACTO,
      :FORMA_PAGO,
      :LIMITE_CREDITO,
      :EMAIL,
      :PAIS,
      :CIUDAD,
      :CEDULA,
      :RNC,
      :CANT_DIAS_CREDITO,
      :RNC_NUMERO,
      :CONDICION,
      :PRECIO_ID,
      :NUMERO,
      :FECHA,
      :CIA_KEY,
      :FECHA_VENCE,
      :CODIGO_CTE,
      :CODIGO_VENDEDOR,
      :OBSERVACION,
      :MONEDA,
      :VALOR_TOTAL,
      :STATUS,
      :FECHA_IN,
      :IN_POR,
      :FECHA_MOD,
      :MOD_POR,
      :NUMERO_FACTURA,
      :NUMERO_DOC_PAGO,
      :SERIE_NCF_ASIGNADO,
      :MONTO_BRUTO,
      :PORC_DESCUENTO,
      :MONTO_DESCUENTO,
      :MONTO_INICIAL,
      :NOMBRE_CLIENTE_GENERAL,
      :MONTO_PAGADO,
      :MONTO_CAMBIO,
      :MONTO_TOTAL_ITBIS,
      :MONTODESCGASTOSADMIN,
      :MONTODESCITBISGASTOSADMIN,
      :MONTODESCTRANSP,
      :MONTODESCDIRTECNICA,
      :MONTODESCITBISDIRTECNICA,
      :MONTODESCIMPREVISTO,
      :MONTODESCITBISIMPREVISTO,
      :TIPO_FACTURA,
      :APLICA_TIPODESC,
      :MONEDA_FACT
  DO
  BEGIN
    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROC_GETFACDESCFORMULA` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_GETFACDESCFORMULA(
  TIPO INTEGER)
RETURNS(
  FORMULA VARCHAR(100) CHARACTER SET NONE)
AS
DECLARE VARIABLE fNombre Varchar(100);
BEGIN
   fNombre = '';      
   Select formula from CONF_DESC_FACTURAS
   where tipo=:tipo
   into
   :formula;
   --EXECUTE STATEMENT CONF_DESC_FACTURAS into :fNombre;
   
END^

SET TERM ; ^

/* Definition for the `PROC_GETPRECIOPROVEEDOR` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_GETPRECIOPROVEEDOR(
  CODIGOPROD INTEGER)
RETURNS(
  FECHA DATE,
  CODIGO_PROV SMALLINT,
  NOMBREPROVEEDOR VARCHAR(40) CHARACTER SET NONE,
  PRECIO FLOAT,
  TELEFONO VARCHAR(12) CHARACTER SET NONE,
  EMAIL VARCHAR(40) CHARACTER SET NONE)
AS
BEGIN
  FOR
    SELECT 
      Max(DESPACHO_MASTER.FECHA) fecha,
      DESPACHO.CODIGO_PROD,      
      PROVEEDORES.DESCRIPCION,
      DESPACHO.PRECIO,
      PROVEEDORES.TELEFONO,
      PROVEEDORES.EMAIL
    FROM
      DESPACHO_MASTER
      INNER JOIN DESPACHO ON (DESPACHO_MASTER.NUMERO = DESPACHO.NUMERO)
      INNER JOIN PROVEEDORES ON (DESPACHO_MASTER.CODIGO_PROV = PROVEEDORES.CODIGO_CTE)
    Where DESPACHO.CODIGO_PROD =:codigoprod                                                                     
   
      Group by 
      DESPACHO.CODIGO_PROD,      
      PROVEEDORES.DESCRIPCION,
      DESPACHO_MASTER.CODIGO_PROV,      
      DESPACHO.PRECIO,
      PROVEEDORES.TELEFONO,
      PROVEEDORES.EMAIL
    INTO
    :fecha,
    :CODIGO_PROV,
    :NombreProveedor,    
    :PRECIO,
    :TELEFONO,
    :EMAIL
  DO
  BEGIN
    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROC_GETTRNCXC` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_GETTRNCXC(
  NUMERODOC INTEGER,
  CIAKEY INTEGER)
RETURNS(
  SERIE DOUBLE PRECISION,
  CIA_KEY INTEGER,
  TIPO_DOC INTEGER,
  MONEDA CHAR(1) CHARACTER SET NONE,
  FECHA DATE,
  NUMERO_DOC INTEGER,
  CODIGO_CLIENTE INTEGER,
  CONCEPTO VARCHAR(60) CHARACTER SET NONE,
  VALOR_DOCUMENTO NUMERIC(15, 2))
AS
BEGIN
  FOR
    SELECT 
      TRANS_CXC.SERIE,
      TRANS_CXC.CIA_KEY,
      TRANS_CXC.TIPO_DOC,
      TRANS_CXC.MONEDA,
      TRANS_CXC.FECHA,
      TRANS_CXC.NUMERO_DOC,
      TRANS_CXC.CODIGO_CLIENTE,
      TRANS_CXC.CONCEPTO,
      TRANS_CXC.VALOR_DOCUMENTO
    FROM
      TRANS_CXC
    Where numero_doc =:numerodoc
    And tipo_doc = 1
    And cia_key =:ciakey
    
    INTO
      :SERIE,
      :CIA_KEY,
      :TIPO_DOC,
      :MONEDA,
      :FECHA,
      :NUMERO_DOC,
      :CODIGO_CLIENTE,
      :CONCEPTO,
      :VALOR_DOCUMENTO
  DO
  BEGIN
    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROC_GETUSUARIOYROLES` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_GETUSUARIOYROLES(
  TIPO INTEGER)
RETURNS(
  USERID INTEGER,
  DESCRIPCION VARCHAR(60) CHARACTER SET NONE)
AS
BEGIN
 if (tipo = 1 ) then
 begin
  for 
   Select codigo_empleado, NOMBRECOMPLETO
    From USUARIO 
    Into :userid, :DESCRIPCION
  do
  begin
    Suspend;
  end
 end else
 if (tipo = 0) then
 begin
  for 
   Select userid, DESCRIPCION
    From SEC_ROLES
    Into :userid, :DESCRIPCION
  do
  begin
    Suspend;
  end
 end
END^

SET TERM ; ^

/* Definition for the `PROC_HISTBCECXC` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_HISTBCECXC(
  ACTUAL SMALLINT)
RETURNS(
  CODIGO INTEGER,
  SERVICIO INTEGER,
  FECHA_HISTORICO DATE,
  MONEDA CHAR(1) CHARACTER SET NONE,
  BALANCE_ACT NUMERIC(15, 2),
  BALANCE_ANT NUMERIC(15, 2),
  DEBITO_MES NUMERIC(15, 2),
  CREDITO_MES NUMERIC(15, 2),
  DEBITO_ACM NUMERIC(15, 2),
  CREDITO_ACM NUMERIC(15, 2),
  STATUS CHAR(1) CHARACTER SET NONE)
AS
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
  END^

SET TERM ; ^

/* Definition for the `PROC_HISTBCECXP` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_HISTBCECXP(
  ACTUAL SMALLINT)
RETURNS(
  CODIGO INTEGER,
  TIPO INTEGER,
  FECHA_HISTORICO DATE,
  MONEDA CHAR(1) CHARACTER SET NONE,
  BALANCE_ACT NUMERIC(15, 2),
  BALANCE_ANT NUMERIC(15, 2),
  DEBITO_MES NUMERIC(15, 2),
  CREDITO_MES NUMERIC(15, 2),
  DEBITO_ACM NUMERIC(15, 2),
  CREDITO_ACM NUMERIC(15, 2),
  STATUS CHAR(1) CHARACTER SET NONE)
AS
BEGIN
   IF (:ACTUAL = 0) THEN
   BEGIN
     FOR
       SELECT
       CODIGO,
       TIPO,
       FECHA_BCE,
       MONEDA,
       BALANCE_ACT,
       BALANCE_ANT,
       DEBITO_MES,
       CREDITO_MES,
       DEBITO_ACM,
       CREDITO_ACM,
       STATUS_BCE
     FROM BALANCE_CXP_HISTORICO
     INTO
       :CODIGO,
       :TIPO,
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
       TIPO,
       FECHA_bce,
       MONEDA,
       BALANCE_ACT,
       BALANCE_ANT,
       DEBITO_MES,
       CREDITO_MES,
       DEBITO_ACM,
       CREDITO_ACM,
       STATUS_BCE
     FROM balance_CXP
     INTO
       :CODIGO,
       :TIPO,
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
  END^

SET TERM ; ^

/* Definition for the `PROC_HIST_BLC_CXC_RECIBO` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_HIST_BLC_CXC_RECIBO(
  NUMERO_RECIBO INTEGER,
  CODIGO_CTE INTEGER)
RETURNS(
  BALANCE_ACTUAL NUMERIC(15, 2))
AS
declare variable blc_actual numeric(15,2);
BEGIN
  blc_actual =0;
  Select Balance_act From balance_cte
  Where codigo =:codigo_cte
  Into 
  :blc_actual;
  balance_actual = :blc_actual;
  Insert Into balance_cxc_recibo( numero_recibo, codigo_cte, balance_actual)
  Values (:numero_recibo, :codigo_cte, :blc_actual);
  Suspend;
END^

SET TERM ; ^

/* Definition for the `PROC_INC_BLCE_CXP_HIST` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INC_BLCE_CXP_HIST(
  SERIE INTEGER,
  CODIGO INTEGER,
  TIPO INTEGER,
  MONEDA CHAR(1) CHARACTER SET NONE,
  BALANCE_ACT NUMERIC(15, 2),
  BALANCE_ANT NUMERIC(15, 2),
  DEBITO_MES NUMERIC(15, 2),
  CREDITO_MES NUMERIC(15, 2),
  DEBITO_ACM NUMERIC(15, 2),
  CREDITO_ACM NUMERIC(15, 2),
  FECHA_BCE DATE,
  FECHA_ULT_PAGO DATE,
  STATUS_BCE CHAR(1) CHARACTER SET NONE,
  FECHA_IN DATE,
  IN_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  CODIGO_USUARIO INTEGER)
AS
BEGIN
  INSERT INTO BALANCE_CXP_HISTORICO (
    SERIE,
    CODIGO,
    TIPO,
    MONEDA,
    BALANCE_ACT,
    BALANCE_ANT,
    DEBITO_MES,
    CREDITO_MES,
    DEBITO_ACM,
    CREDITO_ACM,
    FECHA_BCE,
    FECHA_ULT_PAGO,
    STATUS_BCE,
    FECHA_IN,
    IN_POR,
    FECHA_MOD,
    MOD_POR,
    CODIGO_USUARIO)
  VALUES (
    :SERIE,
    :CODIGO,
    :TIPO,
    :MONEDA,
    :BALANCE_ACT,
    :BALANCE_ANT,
    :DEBITO_MES,
    :CREDITO_MES,
    :DEBITO_ACM,
    :CREDITO_ACM,
    :FECHA_BCE,
    :FECHA_ULT_PAGO,
    :STATUS_BCE,
    :FECHA_IN,
    :IN_POR,
    :FECHA_MOD,
    :MOD_POR,
    :CODIGO_USUARIO);
END^

SET TERM ; ^

/* Definition for the `PROC_INSCOSTO_PRODUCTO` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INSCOSTO_PRODUCTO(
  CODIGOPROVEEDOR INTEGER,
  CODIGO_ARTICULO INTEGER,
  FECHA_ULT_PEDIDO DATE,
  NUMERO_CONDUCE INTEGER,
  PRECIO NUMERIC(15, 2),
  CODIGO_USUARIO INTEGER)
AS
declare variable codigo integer;
BEGIN
   codigo = -1;
   select codigoproveedor from costo_producto
   where codigoproveedor =:codigoproveedor
   and codigo_articulo =:codigo_articulo
   and fecha_ult_pedido =:fecha_ult_pedido
   into :codigo;
  if (:codigo is null or :codigo < 0) then
  begin
  INSERT INTO COSTO_PRODUCTO (
    CODIGOPROVEEDOR,
    CODIGO_ARTICULO,
    FECHA_ULT_PEDIDO,
    NUMERO_CONDUCE,
    PRECIO,
    CODIGO_USUARIO)
  VALUES (
    :CODIGOPROVEEDOR,
    :CODIGO_ARTICULO,
    :FECHA_ULT_PEDIDO,
    :NUMERO_CONDUCE,
    :PRECIO,
    :CODIGO_USUARIO);
  end else
  begin
    update COSTO_PRODUCTO
    Set CODIGOPROVEEDOR = :codigoproveedor,
    CODIGO_ARTICULO  = :codigo_articulo,
    FECHA_ULT_PEDIDO = :fecha_ult_pedido,
    NUMERO_CONDUCE = :numero_conduce,
    PRECIO = :precio,
    CODIGO_USUARIO =:codigo_usuario
    where
    codigoproveedor =:codigoproveedor
   and codigo_articulo =:codigo_articulo
   and fecha_ult_pedido =:fecha_ult_pedido;
  end
suspend;
END^

SET TERM ; ^

/* Definition for the `PROC_INSERTARTRANCXC` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INSERTARTRANCXC(
  TIPO_DOC INTEGER,
  CIA_KEY INTEGER,
  MONEDA CHAR(1) CHARACTER SET NONE,
  FECHA DATE,
  NUMERO_DOC INTEGER,
  CODIGO_CLIENTE INTEGER,
  CODIGO_SERV INTEGER,
  CONCEPTO VARCHAR(60) CHARACTER SET NONE,
  VALOR_DOCUMENTO NUMERIC(15, 2),
  TIPO_TRANF SMALLINT,
  STATUS CHAR(1) CHARACTER SET NONE,
  TIPO_SERV INTEGER,
  NUMERO_TRN_VENTA INTEGER,
  CODIGO_VENDEDOR INTEGER)
RETURNS(
  NUMERO_SERIE INTEGER)
AS
declare variable gen_serie integer;
begin
  
  Select Gen_id(GEN_SERIE_TRN_CXC,1) From rdb$database
  Into 
  :Gen_serie;

  NUMERO_SERIE=:GEN_SERIE;

  Insert into TRANS_CXC
  (SERIE, cia_key, TIPO_DOC, MONEDA, FECHA, NUMERO_DOC, CODIGO_CLIENTE, CODIGO_SERV, 
   CONCEPTO, VALOR_DOCUMENTO, TIPO_TRANF, STATUS, TIPO_SERV,numero_trn_venta,codigo_vendedor)
  Values
  (:Gen_Serie, :cia_key, :TIPO_DOC, :MONEDA, :FECHA, :NUMERO_DOC, :CODIGO_CLIENTE, :CODIGO_SERV, 
   :CONCEPTO, :VALOR_DOCUMENTO, :TIPO_TRANF, :STATUS, :TIPO_SERV,:numero_trn_venta,:codigo_vendedor);  
 
end^

SET TERM ; ^

/* Definition for the `PROC_INSFACTURAS_PEND` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INSFACTURAS_PEND(
  CODIGO_PROV INTEGER,
  TIPO INTEGER,
  MONEDA CHAR(1) CHARACTER SET NONE,
  NUMERO_FACT INTEGER,
  MONTO_PENDIENTE NUMERIC(15, 2))
AS
BEGIN
  INSERT INTO 
  FACTURAS_cxp_PENDIENTES(CODIGO_PROV, TIPO,MONEDA,NUMERO_FACT,MONTO_PENDIENTE,STATUS)
  Values(:CODIGO_PROV, :TIPO,:MONEDA,:NUMERO_FACT,:MONTO_PENDIENTE,"A"); 
END^

SET TERM ; ^

/* Definition for the `PROC_INSHISTORICOCXP` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INSHISTORICOCXP(
  FECHABCE DATE)
RETURNS(
  CANT_RECORD_INS INTEGER)
AS
DECLARE VARIABLE xSerie INTEGER;
DECLARE VARIABLE xCODIGO INTEGER;
DECLARE VARIABLE xTIPO INTEGER;
DECLARE VARIABLE xMONEDA CHAR(1);
DECLARE VARIABLE xBALANCE_ACT NUMERIC(15, 2);
DECLARE VARIABLE xBALANCE_ANT NUMERIC(15, 2);
DECLARE VARIABLE xDEBITO_MES NUMERIC(15, 2);
DECLARE VARIABLE xCREDITO_MES NUMERIC(15, 2);
DECLARE VARIABLE xDEBITO_ACM NUMERIC(15, 2);
DECLARE VARIABLE xCREDITO_ACM NUMERIC(15, 2);
DECLARE VARIABLE xFECHA_ULT_PAGO DATE;
DECLARE VARIABLE xSTATUS_BCE CHAR(1);
DECLARE VARIABLE xFECHA_IN DATE;
DECLARE VARIABLE xIN_POR VARCHAR(12);
DECLARE VARIABLE xFECHA_MOD DATE;
DECLARE VARIABLE xMOD_POR VARCHAR(12);
DECLARE VARIABLE xCODIGO_USUARIO INTEGER;
BEGIN
  FOR SELECT CODIGO,
             TIPO,
             MONEDA,
             BALANCE_ACT,
             BALANCE_ANT,
             DEBITO_MES,
             CREDITO_MES,
             DEBITO_ACM,
             CREDITO_ACM,
             FECHA_ULT_PAGO,
             STATUS_BCE,
             FECHA_IN,
             IN_POR,
             FECHA_MOD,
             MOD_POR,
             CODIGO_USUARIO
      FROM BALANCE_CXP
      INTO :xCODIGO,
           :xTIPO,
           :xMONEDA,
           :xBALANCE_ACT,
           :xBALANCE_ANT,
           :xDEBITO_MES,
           :xCREDITO_MES,
           :xDEBITO_ACM,
           :xCREDITO_ACM,
           :xFECHA_ULT_PAGO,
           :xSTATUS_BCE,
           :xFECHA_IN,
           :xIN_POR,
           :xFECHA_MOD,
           :xMOD_POR,
           :xCODIGO_USUARIO
  DO
      BEGIN
        Select Gen_id(GEN_SERIE_BLC_HIST_CXP,1) From rdb$database
        into xSerie;
        Execute Procedure proc_Inc_BLCE_CXP_HIST (
           xSerie,
           :xCODIGO,
           :xTIPO,
           :xMONEDA,
           :xBALANCE_ACT,
           :xBALANCE_ANT,
           :xDEBITO_MES,
           :xCREDITO_MES,
           :xDEBITO_ACM,
           :xCREDITO_ACM,
           :fechabce,
           :xFECHA_ULT_PAGO,
           :xSTATUS_BCE,
           :xFECHA_IN,
           :xIN_POR,
           :xFECHA_MOD,
           :xMOD_POR,
           :xCODIGO_USUARIO
        );
        SUSPEND;
      END
END^

SET TERM ; ^

/* Definition for the `PROC_INS_COTIZACION_DET` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INS_COTIZACION_DET(
  NUMERO INTEGER,
  CODIGO_PROD VARCHAR(12) CHARACTER SET NONE,
  CODIGO_BARRA VARCHAR(20) CHARACTER SET NONE,
  DESCRIPCION VARCHAR(60) CHARACTER SET NONE,
  DESCRIPCIONESPECIAL BLOB SUB_TYPE 1 CHARACTER SET OCTETS,
  CANTIDAD NUMERIC(15, 2),
  PRECIO FLOAT,
  PORC_DESC_DET FLOAT,
  ITBI_DET FLOAT,
  VALOR_SERVICIO_DET NUMERIC(15, 2),
  VALOR_TOTAL_DET NUMERIC(15, 2),
  STATUS_DET CHAR(1) CHARACTER SET NONE,
  FECHA_IN DATE,
  IN_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  TIPO_UNIDAD INTEGER,
  ITBIS_EXENTO SMALLINT,
  TIPO_VENTA SMALLINT)
RETURNS(
  SERIE_TRNS INTEGER)
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
    MOD_POR,
     tipo_unidad,
    itbis_exento,
    tipo_venta)
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
    :MOD_POR,
    :tipo_unidad,
    :itbis_exento,
    :tipo_venta);
SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_INS_COTIZACION_MAST` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INS_COTIZACION_MAST(
  FECHA DATE,
  FECHA_VENCE DATE,
  CODIGO_CTE INTEGER,
  CODIGO_VENDEDOR INTEGER,
  OBSERVACION VARCHAR(60) CHARACTER SET NONE,
  MONEDA CHAR(1) CHARACTER SET NONE,
  VALOR_TOTAL NUMERIC(15, 2),
  STATUS CHAR(1) CHARACTER SET NONE,
  FECHA_IN DATE,
  IN_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  NUMERO_FACTURA SMALLINT,
  NUMERO_DOC_PAGO VARCHAR(20) CHARACTER SET NONE,
  SERIE_NCF_ASIGNADO SMALLINT,
  MONTO_BRUTO NUMERIC(15, 2),
  PORC_DESCUENTO SMALLINT,
  MONTO_DESCUENTO NUMERIC(15, 2),
  MONTO_INICIAL NUMERIC(15, 2),
  NOMBRE_CLIENTE_GENERAL VARCHAR(60) CHARACTER SET NONE,
  MONTO_PAGADO NUMERIC(15, 2),
  MONTO_CAMBIO NUMERIC(15, 2),
  MONTO_TOTAL_ITBIS NUMERIC(15, 2),
  MONTODESCGASTOSADMIN NUMERIC(15, 2),
  MONTODESCITBISGASTOSADMIN NUMERIC(15, 2),
  MONTODESCTRANSP NUMERIC(15, 2),
  MONTODESCDIRTECNICA NUMERIC(15, 2),
  MONTODESCITBISDIRTECNICA NUMERIC(15, 2),
  MONTODESCIMPREVISTO NUMERIC(15, 2),
  MONTODESCITBISIMPREVISTO NUMERIC(15, 2),
  TIPO_FACTURA SMALLINT,
  APLICA_TIPODESC SMALLINT)
RETURNS(
  NUMERO_TRNS INTEGER)
AS
declare variable xnumero integer;
BEGIN
  
  Select Gen_id(GEN_NUM_COTIZA_MAST,1) From rdb$database
  Into :NUMERO_TRNS;
  
  xNumero =:NUMERO_TRNS;

  INSERT INTO COTIZACION_MAST (
    NUMERO,
    FECHA,
    FECHA_VENCE,
    CODIGO_CTE,
    CODIGO_VENDEDOR,
    OBSERVACION,
    MONEDA,
    VALOR_TOTAL,
    STATUS,
    FECHA_IN,
    IN_POR,
    FECHA_MOD,
    MOD_POR,
NUMERO_FACTURA,
  NUMERO_DOC_PAGO,
  SERIE_NCF_ASIGNADO,
  MONTO_BRUTO,
  PORC_DESCUENTO,
  MONTO_DESCUENTO ,
  MONTO_INICIAL,
  NOMBRE_CLIENTE_GENERAL,
  MONTO_PAGADO,
  MONTO_CAMBIO,
  MONTO_TOTAL_ITBIS,
  MONTODESCGASTOSADMIN,
  MONTODESCITBISGASTOSADMIN,
  MONTODESCTRANSP ,
  MONTODESCDIRTECNICA,
  MONTODESCITBISDIRTECNICA,
  MONTODESCIMPREVISTO ,
  MONTODESCITBISIMPREVISTO,
  TIPO_FACTURA,
  APLICA_TIPODESC)
  VALUES (
    :XNUMERO,
    :FECHA,
    :FECHA_VENCE,
    :CODIGO_CTE,
    :CODIGO_VENDEDOR,
    :OBSERVACION,
    :MONEDA,
    :VALOR_TOTAL,
    :STATUS,
    :FECHA_IN,
    :IN_POR,
    :FECHA_MOD,
    :MOD_POR,
    :NUMERO_FACTURA,
  :NUMERO_DOC_PAGO,
  :SERIE_NCF_ASIGNADO,
  :MONTO_BRUTO,
  :PORC_DESCUENTO,
  :MONTO_DESCUENTO ,
  :MONTO_INICIAL,
  :NOMBRE_CLIENTE_GENERAL,
  :MONTO_PAGADO,
  :MONTO_CAMBIO,
  :MONTO_TOTAL_ITBIS,
  :MONTODESCGASTOSADMIN,
  :MONTODESCITBISGASTOSADMIN,
  :MONTODESCTRANSP ,
  :MONTODESCDIRTECNICA,
  :MONTODESCITBISDIRTECNICA,
  :MONTODESCIMPREVISTO ,
  :MONTODESCITBISIMPREVISTO,
  :TIPO_FACTURA,
  :APLICA_TIPODESC
);
  SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_INS_CUADRE_DIST_VENTA` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INS_CUADRE_DIST_VENTA(
  COD_EMPLEADO INTEGER,
  FECHA DATE,
  INGRESO_CXC NUMERIC(15, 2),
  VENTA_A_CREDITO NUMERIC(15, 2),
  VENTA_AL_CONTADO NUMERIC(15, 2),
  MONTO_DEVOLUCION NUMERIC(15, 2),
  MONTO_EN_CHEQUE NUMERIC(15, 2),
  M2000 INTEGER,
  M1000 INTEGER,
  M500 INTEGER,
  M200 INTEGER,
  M100 INTEGER,
  M50 INTEGER,
  M25 INTEGER,
  M20 INTEGER,
  M10 INTEGER,
  M5 INTEGER,
  MONTO_MONEDAS NUMERIC(15, 2),
  MONTO_AJUSTE NUMERIC(15, 2),
  MONTO_DIETA NUMERIC(15, 2),
  MONTO_RETIRO NUMERIC(15, 2),
  COD_USUARIO INTEGER,
  STATUS CHAR(1) CHARACTER SET NONE,
  FECHA_IN DATE,
  FECHA_UPDATE DATE,
  MONTO_EN_FONDO NUMERIC(15, 2),
  INICIAL_FINANCIAMIENTO NUMERIC(15, 2))
AS
declare variable existe smallint;
BEGIN
  existe = -1; 
  Select cod_empleado from cuadre_dist_venta
  where cod_empleado = :COD_EMPLEADO
  and fecha=:fecha
  into :existe;

  if (existe < 0 or existe is null) then
  begin
  INSERT INTO CUADRE_DIST_VENTA (
    COD_EMPLEADO,
    FECHA,
    INGRESO_CXC,
    VENTA_A_CREDITO,
    VENTA_AL_CONTADO,
    MONTO_DEVOLUCION,
    MONTO_EN_CHEQUE,
    M2000,
    M1000,
    M500,
    M200,
    M100,
    M50,
    M25,
    M20,
    M10,
    M5,
    MONTO_MONEDAS,
    MONTO_AJUSTE,
    MONTO_DIETA,
    MONTO_RETIRO,
    COD_USUARIO,
    STATUS,
    FECHA_IN,
    FECHA_UPDATE, monto_en_fondo,inicial_financiamiento)
  VALUES (
    :COD_EMPLEADO,
    :FECHA,
    :INGRESO_CXC,
    :VENTA_A_CREDITO,
    :VENTA_AL_CONTADO,
    :MONTO_DEVOLUCION,
    :MONTO_EN_CHEQUE,
    :M2000,
    :M1000,
    :M500,
    :M200,
    :M100,
    :M50,
    :M25,
    :M20,
    :M10,
    :M5,
    :MONTO_MONEDAS,
    :MONTO_AJUSTE,
    :MONTO_DIETA,
    :MONTO_RETIRO,
    :COD_USUARIO,
    :STATUS,
    :FECHA_IN,
    :FECHA_UPDATE, :monto_en_fondo, :inicial_financiamiento);
  end else
  begin
    UPDATE CUADRE_DIST_VENTA 
    SET ingreso_cxc =:ingreso_cxc,
    VENTA_A_CREDITO  =:VENTA_A_CREDITO,
    VENTA_AL_CONTADO =:VENTA_AL_CONTADO,
    MONTO_DEVOLUCION =:MONTO_DEVOLUCION,
    MONTO_EN_CHEQUE  =:MONTO_EN_CHEQUE,
    M2000 =:M2000,
    M1000 =:M1000,
    M500 =:M500,
    M200 =:M200,
    M100 =:M100,
    M50  =:M50,
    M25  =:M25,
    M20  =:M20,
    M10  =:M10,
    M5   =:M5, 
    MONTO_MONEDAS =:MONTO_MONEDAS,
    MONTO_AJUSTE  =:MONTO_AJUSTE,
    MONTO_DIETA   =:MONTO_DIETA,
    MONTO_RETIRO  =:MONTO_RETIRO,
    COD_USUARIO   =:COD_USUARIO,
    STATUS =:STATUS,
    FECHA_UPDATE = "TODAY",
    monto_en_fondo =:monto_en_fondo,
    inicial_financiamiento =:inicial_financiamiento
    Where cod_empleado =:COD_EMPLEADO
    And fecha=:fecha;
    /* */
  end
END^

SET TERM ; ^

/* Definition for the `PROC_INS_DESGLOSE_DEP` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INS_DESGLOSE_DEP(
  ID_DEPOSITO INTEGER,
  FECHA DATE,
  MONTO_DEPOSITADO NUMERIC(15, 2),
  M2000 INTEGER,
  M1000 INTEGER,
  M500 INTEGER,
  M200 INTEGER,
  M100 INTEGER,
  M50 INTEGER,
  M25 INTEGER,
  M20 INTEGER,
  M10 INTEGER,
  M5 INTEGER,
  MONTO_MONEDAS NUMERIC(15, 2),
  COD_USUARIO INTEGER,
  STATUS CHAR(1) CHARACTER SET NONE,
  FECHA_IN DATE,
  FECHA_UPDATE DATE,
  MONTO_ENCHEQUE NUMERIC(15, 2))
AS
declare variable existe smallint;
BEGIN
  existe = -1; 
  Select ID_DEPOSITO
  From DESGLOSE_DEP_BANCARIO
  Where ID_DEPOSITO=:ID_DEPOSITO
  INTO :existe;
         
  if (existe < 0 or existe is null) then
  begin
  INSERT INTO DESGLOSE_DEP_BANCARIO (
    ID_DEPOSITO,
    FECHA,
    MONTO_DEPOSITADO,
    M2000,
    M1000,
    M500,
    M200,
    M100,
    M50,
    M25,
    M20,
    M10,
    M5,
    MONTO_MONEDAS,
    COD_USUARIO,
    STATUS,
    FECHA_IN,
    FECHA_UPDATE,
    MONTO_ENCHEQUE)
  VALUES (
    :ID_DEPOSITO,
    :FECHA,
    :MONTO_DEPOSITADO,
    :M2000,
    :M1000,
    :M500,
    :M200,
    :M100,
    :M50,
    :M25,
    :M20,
    :M10,
    :M5,
    :MONTO_MONEDAS,
    :COD_USUARIO,
    :STATUS,
    :FECHA_IN,
    :FECHA_UPDATE,
    :MONTO_ENCHEQUE);
  end else
  begin
    UPDATE DESGLOSE_DEP_BANCARIO 
    SET 
    MONTO_DEPOSITADO  =:MONTO_DEPOSITADO,
    M2000 =:M2000,
    M1000 =:M1000,
    M500 =:M500,
    M200 =:M200,
    M100 =:M100,
    M50  =:M50,
    M25  =:M25,
    M20  =:M20,
    M10  =:M10,
    M5   =:M5,
    MONTO_MONEDAS =:MONTO_MONEDAS,
    STATUS =:STATUS,
    FECHA_UPDATE = "TODAY",
    MONTO_ENCHEQUE =:MONTO_ENCHEQUE
    Where ID_DEPOSITO =:ID_DEPOSITO;    
  end
END^

SET TERM ; ^

/* Definition for the `PROC_INS_DESPACHO_DET` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INS_DESPACHO_DET(
  NUMERO INTEGER,
  TIPO_TRN SMALLINT,
  CODIGO_PROD INTEGER,
  CANTIDAD NUMERIC(15, 2),
  PRECIO FLOAT,
  PORC_DESC_DET FLOAT,
  ITBI_DET FLOAT,
  VALOR_BRUTO NUMERIC(15, 2),
  VALOR_TOTAL_DET NUMERIC(15, 2),
  NUM_ORDEN DOUBLE PRECISION,
  STATUS_DET CHAR(1) CHARACTER SET NONE,
  FECHA_IN DATE,
  IN_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  DESCRIPCION VARCHAR(60) CHARACTER SET NONE,
  RECARGA NUMERIC(15, 2),
  CANT_UNIDADES NUMERIC(15, 2),
  UNIDADID INTEGER)
RETURNS(
  SERIE_TRNS INTEGER)
AS
DECLARE VARIABLE XSERIE INTEGER;
BEGIN

  Select Gen_id(GEN_SERIE_DESPACHODET,1) From rdb$database
  Into :SERIE_TRNS;

  XSERIE =:SERIE_TRNS;
  INSERT INTO DESPACHO (
    SERIE,
    NUMERO,
    TIPO_TRN,
    CODIGO_PROD,
    CANTIDAD,
    PRECIO,
    PORC_DESC_DET,
    ITBI_DET,
    VALOR_BRUTO,
    VALOR_TOTAL_DET,
    NUM_ORDEN,
    STATUS_DET,
    FECHA_IN,
    IN_POR,
    FECHA_MOD,
    MOD_POR,
    DESCRIPCION,
    RECARGA,cant_unidades,
  unidadid)
  VALUES (
    :SERIE_TRNS,
    :NUMERO,
    :TIPO_TRN,
    :CODIGO_PROD,
    :CANTIDAD,
    :PRECIO,
    :PORC_DESC_DET,
    :ITBI_DET,
    :VALOR_BRUTO,
    :VALOR_TOTAL_DET,
    :NUM_ORDEN,
    :STATUS_DET,
    :FECHA_IN,
    :IN_POR,
    :FECHA_MOD,
    :MOD_POR,
    :DESCRIPCION,
    :RECARGA, :cant_unidades, :unidadid);
END^

SET TERM ; ^

/* Definition for the `PROC_INS_DESPACHO_MASTER` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INS_DESPACHO_MASTER(
  FECHA DATE,
  TIPO_TRN SMALLINT,
  CODIGO_DESPACHADOR INTEGER,
  CODIGO_EMP INTEGER,
  MONTO_TOTAL NUMERIC(15, 2),
  STATUS CHAR(1) CHARACTER SET NONE,
  FECHA_IN DATE,
  IN_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  CODIGO_RUTA INTEGER,
  NUM_CONDUCE INTEGER,
  CODIGO_PROV INTEGER,
  NCF VARCHAR(21) CHARACTER SET NONE,
  RNC_PROVEEDOR VARCHAR(15) CHARACTER SET NONE,
  INVENTARIO_ID INTEGER,
  SERIE_INV_ID INTEGER,
  INV_ID_ORIGEN INTEGER,
  INV_ID_DESTINO INTEGER,
  FORMA_PAGO SMALLINT)
RETURNS(
  SERIE_TRNS INTEGER,
  NUMORDEN INTEGER)
AS
DECLARE VARIABLE XSERIE INTEGER;
DECLARE VARIABLE xnumorden INTEGER;
BEGIN

  Select Gen_id(GEN_NUM_DESPACHOMASTER,1) From rdb$database
  Into :SERIE_TRNS;

  Select Gen_id(GEN_NUM_FACTURA,1) From rdb$database
  Into  :numorden;

  xnumorden=:numorden;

  XSERIE =:SERIE_TRNS;

  INSERT INTO DESPACHO_MASTER (
    NUMERO, fecha,
    TIPO_TRN,
    CODIGO_DESPACHADOR,
    CODIGO_EMP,
    MONTO_TOTAL,
    NUM_ORDEN,
    STATUS,
    FECHA_IN,
    IN_POR,
    FECHA_MOD,
    MOD_POR,
    CODIGO_RUTA,
    NUM_CONDUCE, codigo_prov,
    ncf,
    rnc_proveedor, inventario_id, serie_inv_id,  inv_id_origen,
    inv_id_destino, forma_pago, numero_factura)
  VALUES (
    :XSERIE,
    :FECHA,
    :TIPO_TRN,
    :CODIGO_DESPACHADOR,
    :CODIGO_EMP,
    :MONTO_TOTAL,
    :xnumorden,
    :STATUS,
    :FECHA_IN,
    :IN_POR,
    :FECHA_MOD,
    :MOD_POR,
    :CODIGO_RUTA,
    :NUM_CONDUCE, :codigo_prov,
    :ncf,
    :rnc_proveedor, :inventario_id,:serie_inv_id,
    :inv_id_origen,
    :inv_id_destino, :forma_pago,:NUM_CONDUCE);
Suspend;
END^

SET TERM ; ^

/* Definition for the `PROC_INS_FINANC` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INS_FINANC(
  NUMERO_TRN INTEGER,
  FECHA DATE,
  CODIGO_CTE INTEGER,
  TIPO_FREC_PAGO INTEGER,
  PORCIENTO NUMERIC(15, 2),
  PORC_MORA NUMERIC(15, 2),
  CANT_CUOTAS INTEGER,
  MONTOINICIAL NUMERIC(15, 2),
  DEBITO_ACUM NUMERIC(15, 2),
  CREDITO_ACUM NUMERIC(15, 2),
  MONTO_MORA_ACUM NUMERIC(15, 2),
  MONTO_DESC_PRONTOPAGO NUMERIC(15, 2),
  BALANCE_ACT NUMERIC(15, 2),
  FECHA_ULT_PAGO DATE,
  STATUS CHAR(1) CHARACTER SET NONE,
  ID_USUARIO_IN INTEGER,
  FECHA_IN DATE,
  NOMBREPC VARCHAR(12) CHARACTER SET NONE,
  FECHA_UPDATE DATE,
  ID_USUARIO_UPDATE INTEGER,
  NUMERO_FACTURA INTEGER,
  CUOTASPEND INTEGER,
  MONTO_CAP_INICIAL NUMERIC(15, 2))
AS
Declare Variable xSerie Integer;
BEGIN
  Select Gen_id(GEN_serie_financ,1) From rdb$Database
  Into :xSerie;

  INSERT INTO FINANCIAMIENTO (
    SERIE,
    NUMERO_TRN,
    FECHA,
    CODIGO_CTE,
    TIPO_FREC_PAGO,
    PORCIENTO,
    PORC_MORA,
    CANT_CUOTAS,
    MONTOINICIAL,
    DEBITO_ACUM,
    CREDITO_ACUM,
    MONTO_MORA_ACUM,
    MONTO_DESC_PRONTOPAGO,
    BALANCE_ACT,
    FECHA_ULT_PAGO,
    STATUS,
    ID_USUARIO_IN,
    FECHA_IN,
    NOMBREPC,
    FECHA_UPDATE,
    ID_USUARIO_UPDATE, num_factura, CUOTASPEND,Monto_Cap_Inicial)
  VALUES (
    :xSerie,
    :NUMERO_TRN,
    :FECHA,
    :CODIGO_CTE,
    :TIPO_FREC_PAGO,
    :PORCIENTO,
    :PORC_MORA,
    :CANT_CUOTAS,
    :MONTOINICIAL,
    :DEBITO_ACUM,
    :CREDITO_ACUM,
    :MONTO_MORA_ACUM,
    :MONTO_DESC_PRONTOPAGO,
    :BALANCE_ACT,
    :FECHA_ULT_PAGO,
    :STATUS,
    :ID_USUARIO_IN,
    :FECHA_IN,
    :NOMBREPC,
    :FECHA_UPDATE,
    :ID_USUARIO_UPDATE, :numero_factura, :CUOTASPEND, :Monto_Cap_Inicial);
Suspend;
END^

SET TERM ; ^

/* Definition for the `PROC_INS_LOTE` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INS_LOTE(
  CODIGO INTEGER,
  LOTE_NUM VARCHAR(25) CHARACTER SET NONE,
  CODIGO_PROV INTEGER,
  FECHA DATE,
  CANT_IN INTEGER,
  CANT_OUT INTEGER,
  FECHA_VENCIMIENTO DATE)
AS
BEGIN
  INSERT INTO LOTE(
  CODIGO,
  LOTE_NUM,
  CODIGO_PROV,
  FECHA,
  CANT_IN,
  CANT_OUT,
  FECHA_VENCIMIENTO
   )
  VALUES (
  :CODIGO,
  :LOTE_NUM,
  :CODIGO_PROV,
  :FECHA,
  :CANT_IN,
  :CANT_OUT,
  :FECHA_VENCIMIENTO);
Suspend;
END^

SET TERM ; ^

/* Definition for the `PROC_INS_ORDEN_COMP_DET` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INS_ORDEN_COMP_DET(
  NUMERO INTEGER,
  COD_SERV_PROD INTEGER,
  DEPARTAMENTO INTEGER,
  OBSERVACION VARCHAR(40) CHARACTER SET NONE,
  CANTIDAD FLOAT,
  VALOR NUMERIC(15, 2),
  STATUS CHAR(1) CHARACTER SET NONE,
  IN_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_IN DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_MOD DATE,
  NUMERO_DOCUMENTO INTEGER,
  NUMERO_FACTURA INTEGER,
  COD_CTA_CONCEPTO INTEGER,
  TIPOSERVICIO INTEGER,
  SUBTIPOSERV INTEGER,
  NO_SERIE_RES INTEGER,
  CODIGO_CONDUCTOR INTEGER,
  CODIGO_SERVCOSTO INTEGER,
  PRECIO NUMERIC(15, 2),
  AREA_ORDEN INTEGER,
  ITBI_DET FLOAT,
  PORC_DESC_DET FLOAT,
  MONTO_DESCUENTO NUMERIC(15, 2))
AS
DECLARE VARIABLE xSERIE INTEGER;
BEGIN
  Select Gen_id(GEN_NUM_ORDEN_DET,1) From rdb$database
  Into :xSERIE;

  INSERT INTO ORDEN_COMP_DET (
    SERIE,
    NUMERO,
    COD_SERV_PROD,
    DEPARTAMENTO,
    OBSERVACION,
    CANTIDAD,
    VALOR,
    STATUS,
    IN_POR,
    FECHA_IN,
    MOD_POR,
    FECHA_MOD,
    NUMERO_DOCUMENTO,
    NUMERO_FACTURA,
    COD_CTA_CONCEPTO,
    TIPOSERVICIO,
    SUBTIPOSERV,
    NO_SERIE_RES,
    CODIGO_CONDUCTOR,
    CODIGO_SERVCOSTO,
    PRECIO,
    AREA_ORDEN,
    ITBI_DET,
    PORC_DESC_DET,
    MONTO_DESCUENTO)
  VALUES (
    :XSERIE,
    :NUMERO,
    :COD_SERV_PROD,
    :DEPARTAMENTO,
    :OBSERVACION,
    :CANTIDAD,
    :VALOR,
    :STATUS,
    :IN_POR,
    :FECHA_IN,
    :MOD_POR,
    :FECHA_MOD,
    :NUMERO_DOCUMENTO,
    :NUMERO_FACTURA,
    :COD_CTA_CONCEPTO,
    :TIPOSERVICIO,
    :SUBTIPOSERV,
    :NO_SERIE_RES,
    :CODIGO_CONDUCTOR,
    :CODIGO_SERVCOSTO,
    :PRECIO,
    :AREA_ORDEN,
    :ITBI_DET,
    :PORC_DESC_DET,
    :MONTO_DESCUENTO);
END^

SET TERM ; ^

/* Definition for the `PROC_INS_ORDEN_COMP_MAST` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INS_ORDEN_COMP_MAST(
  CODIGO_PROVEE INTEGER,
  FECHA DATE,
  FPAGO SMALLINT,
  COD_CAJA_CHICA SMALLINT,
  CODIGO_BANCO SMALLINT,
  CUENTABANCO VARCHAR(20) CHARACTER SET NONE,
  OBSERVACION VARCHAR(40) CHARACTER SET NONE,
  MONTO NUMERIC(15, 2),
  STATUS CHAR(1) CHARACTER SET NONE,
  IN_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_IN DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_MOD DATE,
  TIPO_INV SMALLINT,
  STATUS_CNT CHAR(1) CHARACTER SET NONE,
  NUM_ORDEN SMALLINT,
  STATUS_ORD CHAR(1) CHARACTER SET NONE,
  AREA_ORDEN SMALLINT)
RETURNS(
  NUMERO INTEGER)
AS
DECLARE VARIABLE XNUMERO INTEGER;
BEGIN
  Select Gen_id(GEN_NUM_ORDEN_MAST,1) From rdb$database
  Into :NUMERO;
  XNUMERO =:NUMERO;

  INSERT INTO ORDEN_COMP_MAST(
      ORDEN_COMP_MAST.NUMERO,
      ORDEN_COMP_MAST.CODIGO_PROVEE,
      ORDEN_COMP_MAST.FECHA,
      ORDEN_COMP_MAST.FPAGO,
      ORDEN_COMP_MAST.COD_CAJA_CHICA,
      ORDEN_COMP_MAST.CODIGO_BANCO,
      ORDEN_COMP_MAST.CUENTABANCO,
      ORDEN_COMP_MAST.OBSERVACION,
      ORDEN_COMP_MAST.MONTO,
      ORDEN_COMP_MAST.STATUS,
      ORDEN_COMP_MAST.IN_POR,
      ORDEN_COMP_MAST.FECHA_IN,
      ORDEN_COMP_MAST.MOD_POR,
      ORDEN_COMP_MAST.FECHA_MOD,
      ORDEN_COMP_MAST.TIPO_INV,
      ORDEN_COMP_MAST.STATUS_CNT,
      ORDEN_COMP_MAST.NUM_ORDEN,
      ORDEN_COMP_MAST.STATUS_ORD,
      ORDEN_COMP_MAST.AREA_ORDEN)
   VALUES
      (:xNUMERO,
      :CODIGO_PROVEE,
      :FECHA,
      :FPAGO,
      :COD_CAJA_CHICA,
      :CODIGO_BANCO,
      :CUENTABANCO,
      :OBSERVACION,
      :MONTO,
      :STATUS,
      :IN_POR,
      :FECHA_IN,
      :MOD_POR,
      :FECHA_MOD,
      :TIPO_INV,
      :STATUS_CNT,
      :NUM_ORDEN,
      :STATUS_ORD,
      :AREA_ORDEN);
SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_INS_VENTAS_DET` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INS_VENTAS_DET(
  NUMERO INTEGER,
  CODIGO_PROD VARCHAR(40) CHARACTER SET NONE,
  CODIGO_BARRA VARCHAR(20) CHARACTER SET NONE,
  DESCRIPCION VARCHAR(60) CHARACTER SET NONE,
  CANTIDAD NUMERIC(15, 2),
  PRECIO FLOAT,
  PORC_DESC_DET FLOAT,
  ITBI_DET FLOAT,
  VALOR_SERVICIO_DET NUMERIC(15, 2),
  VALOR_TOTAL_DET NUMERIC(15, 2),
  NUM_FACTURA DOUBLE PRECISION,
  STATUS_DET CHAR(1) CHARACTER SET NONE,
  FECHA_IN DATE,
  IN_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  CANT_REGRESO NUMERIC(15, 2),
  CANT_PROMO NUMERIC(15, 2),
  MONTO_DIETA NUMERIC(15, 2),
  MONTO_AJUSTE NUMERIC(15, 2),
  SERIE_PROD VARCHAR(50) CHARACTER SET NONE,
  TIPO_UNIDAD INTEGER,
  ITBIS_EXENTO SMALLINT,
  TIPO_VENTA SMALLINT)
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
    MONTO_AJUSTE, Serie_Prod, TIPO_UNIDAD, ITBIS_EXENTO, TIPO_VENTA
 
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
    :MONTO_AJUSTE, :Serie_Prod, :TIPO_UNIDAD, :ITBIS_EXENTO, :TIPO_VENTA);
  SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_INS_VENTAS_DET_PREVENTA` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INS_VENTAS_DET_PREVENTA(
  NUMERO INTEGER,
  CODIGO_PROD VARCHAR(40) CHARACTER SET NONE,
  CODIGO_BARRA VARCHAR(20) CHARACTER SET NONE,
  DESCRIPCION VARCHAR(60) CHARACTER SET NONE,
  CANTIDAD NUMERIC(15, 2),
  PRECIO FLOAT,
  PORC_DESC_DET FLOAT,
  ITBI_DET FLOAT,
  VALOR_SERVICIO_DET NUMERIC(15, 2),
  VALOR_TOTAL_DET NUMERIC(15, 2),
  NUM_FACTURA DOUBLE PRECISION,
  STATUS_DET CHAR(1) CHARACTER SET NONE,
  FECHA_IN DATE,
  IN_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  CANT_REGRESO NUMERIC(15, 2),
  CANT_PROMO NUMERIC(15, 2),
  MONTO_DIETA NUMERIC(15, 2),
  MONTO_AJUSTE NUMERIC(15, 2),
  SERIE_PROD VARCHAR(50) CHARACTER SET NONE,
  TIPO_UNIDAD INTEGER)
AS
declare variable xSerie integer;
BEGIN
  Select Gen_id(GEN_NUM_VENTA_DET_preventa,1) From rdb$Database
  Into :xSerie;
  INSERT INTO VENTAS_DET_preventa (
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
    MONTO_AJUSTE, Serie_Prod, TIPO_UNIDAD )
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
    :MONTO_AJUSTE, :Serie_Prod, :TIPO_UNIDAD);
  SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_INS_VENTAS_MAST` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INS_VENTAS_MAST(
  FECHA DATE,
  CIA_KEY INTEGER,
  CODIGO_CTE INTEGER,
  CODIGO_VENDEDOR INTEGER,
  FORMA_PAGO SMALLINT,
  OBSERVACION VARCHAR(60) CHARACTER SET NONE,
  MONEDA CHAR(1) CHARACTER SET NONE,
  VALOR_TOTAL_DET NUMERIC(15, 2),
  STATUS CHAR(1) CHARACTER SET NONE,
  FECHA_IN DATE,
  IN_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  NUMERO_FACTURA INTEGER,
  NUMERO_DOC_PAGO VARCHAR(20) CHARACTER SET NONE,
  SERIE_NCF_ASIGNADO INTEGER,
  MONTO_BRUTO NUMERIC(15, 2),
  PORC_DESCUENTO INTEGER,
  MONTO_DESCUENTO NUMERIC(15, 2),
  MONTO_PAGADO NUMERIC(15, 2),
  MONTO_CAMBIO NUMERIC(15, 2),
  MONTO_TOTAL_ITBIS NUMERIC(15, 2),
  MONTO_INICIAL NUMERIC(15, 2),
  NOMBRE_CLIENTE_GENERAL VARCHAR(60) CHARACTER SET NONE,
  E_MONTODESCGASTOSADMIN NUMERIC(15, 2),
  E_MONTODESCITBISGASTOSADMIN NUMERIC(15, 2),
  E_MONTODESCTRANSP NUMERIC(15, 2),
  E_MONTODESCDIRTECNICA NUMERIC(15, 2),
  E_MONTODESCITBISDIRTECNICA NUMERIC(15, 2),
  E_MONTODESCIMPREVISTO NUMERIC(15, 2),
  E_MONTODESCITBISIMPREVISTO NUMERIC(15, 2))
RETURNS(
  NUMERO_TRNS INTEGER)
AS
declare variable xnumero integer;
BEGIN
  
  Select Gen_id(GEN_NUM_VENTA_MAST,1) From rdb$database
  into NUMERO_TRNS;
  
  xNumero =NUMERO_TRNS;
 
  INSERT INTO VENTAS_MAST (
    NUMERO,
    cia_key,
    FECHA,
    CODIGO_CTE,
    CODIGO_VENDEDOR,
    FORMA_PAGO,
    OBSERVACION,
    MONEDA,
    VALOR_TOTAL_DET,
    STATUS,
    FECHA_IN,
    IN_POR,
    FECHA_MOD,
    MOD_POR,
    NUMERO_FACTURA,
    NUMERO_DOC_PAGO, serie_ncf_asignado,
    monto_bruto,
    porc_descuento,
    monto_descuento, 
	MONTO_PAGADO,
    MONTO_CAMBIO,
    MONTO_TOTAL_ITBIS,
	MONTO_INICIAL, 
	NOMBRE_CLIENTE_GENERAL,
    MONTODESCGASTOSADMIN,
    MONTODESCITBISGASTOSADMIN,
    MONTODESCTRANSP,
    MONTODESCDIRTECNICA,
    MONTODESCITBISDIRTECNICA,
    MONTODESCIMPREVISTO,
    MONTODESCITBISIMPREVISTO 	
 )
  VALUES (
    :xNumero,
    :cia_key,
    :FECHA,
    :CODIGO_CTE,
    :CODIGO_VENDEDOR,
    :FORMA_PAGO,
    :OBSERVACION,
    :MONEDA,
    :VALOR_TOTAL_DET,
    :STATUS,
    :FECHA_IN,
    :IN_POR,
    :FECHA_MOD,
    :MOD_POR,
    :NUMERO_FACTURA,
    :NUMERO_DOC_PAGO, :serie_ncf_asignado,
    :monto_bruto,
    :porc_descuento,
    :monto_descuento,
    :monto_pagado,
    :monto_cambio,
    :monto_total_itbis,
    :MONTO_INICIAL, 
    :NOMBRE_CLIENTE_GENERAL,
    :e_MONTODESCGASTOSADMIN,
    :e_MONTODESCITBISGASTOSADMIN,
    :e_MONTODESCTRANSP,
    :e_MONTODESCDIRTECNICA,
    :e_MONTODESCITBISDIRTECNICA,
    :e_MONTODESCIMPREVISTO,
    :e_MONTODESCITBISIMPREVISTO);   
   SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_INS_VENTAS_MAST_PREVENTA` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INS_VENTAS_MAST_PREVENTA(
  FECHA DATE,
  CIA_KEY INTEGER,
  CODIGO_CTE INTEGER,
  CODIGO_VENDEDOR INTEGER,
  FORMA_PAGO SMALLINT,
  OBSERVACION VARCHAR(60) CHARACTER SET NONE,
  MONEDA CHAR(1) CHARACTER SET NONE,
  VALOR_TOTAL_DET NUMERIC(15, 2),
  STATUS CHAR(1) CHARACTER SET NONE,
  FECHA_IN DATE,
  IN_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  NUMERO_FACTURA INTEGER,
  NUMERO_DOC_PAGO VARCHAR(20) CHARACTER SET NONE,
  SERIE_NCF_ASIGNADO INTEGER,
  MONTO_BRUTO NUMERIC(15, 2),
  PORC_DESCUENTO INTEGER,
  MONTO_DESCUENTO NUMERIC(15, 2),
  MONTO_INICIAL NUMERIC(15, 2),
  NOMBRE_CLIENTE_GENERAL VARCHAR(60) CHARACTER SET NONE)
RETURNS(
  NUMERO_TRNS INTEGER)
AS
declare variable xnumero integer;
BEGIN
  
  Select Gen_id(GEN_NUM_VENTA_MAST_preventa,1) From rdb$database
  into NUMERO_TRNS;
  
  xNumero =NUMERO_TRNS;
 
  INSERT INTO VENTAS_MAST_preventa (
    NUMERO,cia_key,
    FECHA,
    CODIGO_CTE,
    CODIGO_VENDEDOR,
    FORMA_PAGO,
    OBSERVACION,
    MONEDA,
    VALOR_TOTAL_DET,
    STATUS,
    FECHA_IN,
    IN_POR,
    FECHA_MOD,
    MOD_POR,
    NUMERO_FACTURA,
    NUMERO_DOC_PAGO, serie_ncf_asignado,
    monto_bruto,
    porc_descuento,
    monto_descuento, MONTO_INICIAL, NOMBRE_CLIENTE_GENERAL
 )
  VALUES (
    :xNumero,:cia_key,
    :FECHA,
    :CODIGO_CTE,
    :CODIGO_VENDEDOR,
    :FORMA_PAGO,
    :OBSERVACION,
    :MONEDA,
    :VALOR_TOTAL_DET,
    :STATUS,
    :FECHA_IN,
    :IN_POR,
    :FECHA_MOD,
    :MOD_POR,
    :NUMERO_FACTURA,
    :NUMERO_DOC_PAGO, :serie_ncf_asignado,
    :monto_bruto,
    :porc_descuento,
    :monto_descuento,:MONTO_INICIAL, :NOMBRE_CLIENTE_GENERAL);   
   SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_INTEGRARPRODPAN` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INTEGRARPRODPAN(
  FECHANOMINI DATE,
  FECHANOMFIN DATE,
  CIA_KEY SMALLINT,
  TIPO_NOMINA SMALLINT)
RETURNS(
  COD_EMPLEADO SMALLINT,
  MONTOPAGAR NUMERIC(15, 2))
AS
Declare Variable ID_PRODUCCION INTEGER;
BEGIN
  FOR
    SELECT 
      PAN_PRODUCCION_MAST.ID_PRODUCCION,
      PAN_PRODUCCION_MAST.COD_EMPLEADO
    FROM      
      PAN_PRODUCCION_MAST
    Where PAN_PRODUCCION_MAST.FECHA_PRODUCCION
    Between :fechaNomIni And :fechaNomFin
    and PAN_PRODUCCION_MAST.STATUS = 'A'
    and PAN_PRODUCCION_MAST.TIPO_NOMINA =:TIPO_NOMINA
    and  PAN_PRODUCCION_MAST.CIA_KEY =:cia_key

    INTO
      :ID_PRODUCCION,
      :COD_EMPLEADO
  DO
  BEGIN
    Select sum(PAN_PRODUCCION_DET.PRECIO * 
           PAN_PRODUCCION_DET.CANTIDAD)
    from PAN_PRODUCCION_DET
    Where PAN_PRODUCCION_DET.FECHA 
    Between :fechaNomIni And :fechaNomFin
    and PAN_PRODUCCION_DET.STATUS = 'A'
    and PAN_PRODUCCION_DET.ID_PRODUCCION =:ID_PRODUCCION
    Into 
    :MontoPagar;
            
    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROC_INV_VENTA` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INV_VENTA(
  INVID INTEGER)
RETURNS(
  CODIGO INTEGER,
  CODIGO_TEXTO VARCHAR(40) CHARACTER SET NONE,
  FECHA DATE,
  CODIGO_BARRA VARCHAR(40) CHARACTER SET NONE,
  TIPO INTEGER,
  DESCRIPCION VARCHAR(80) CHARACTER SET NONE,
  CANTIDAD_REORDEN INTEGER,
  PRECIO_ANT NUMERIC(15, 2),
  CANTIDAD NUMERIC(15, 2),
  PRECIO NUMERIC(15, 2),
  BLCE_CANT_ENTRADA NUMERIC(15, 2),
  BLCE_CANT_SALIDA NUMERIC(15, 2),
  FECHA_ULTIMA_TRN DATE,
  STATUS CHAR(1) CHARACTER SET NONE,
  PORC_DESCUENTO NUMERIC(15, 2),
  FOTO BLOB,
  PAGA_ITBI SMALLINT,
  CODIGO_PRECIO CHAR(6) CHARACTER SET NONE,
  UNIDAD NUMERIC(15, 2),
  PRECIO_COMPRA NUMERIC(15, 2),
  PRECIO_MINIMO NUMERIC(15, 2),
  REFERENCIA VARCHAR(50) CHARACTER SET NONE,
  FECHA_VENCIMIENTO DATE,
  INVENTARIAR SMALLINT,
  PRECIO_TIPO_UNIDAD NUMERIC(15, 2),
  TIPO_UNIDAD INTEGER,
  PRECIOVENTA1 NUMERIC(15, 2),
  PRECIOVENTA2 NUMERIC(15, 2),
  PRECIOVENTA3 NUMERIC(15, 2),
  PRECIOVENTA4 NUMERIC(15, 2),
  USARLEVELPRECIO SMALLINT,
  CIA_KEY INTEGER)
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
             a.CANTIDAD,
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
             p.INVENTARIAR, p.PRECIO_TIPO_UNIDAD, p.TIPO_UNIDAD,
             p.PRECIOVENTA1,
             p.precioventa2,
             p.precioventa3,
             p.precioventa4,
             p.USARLEVELPRECIO, p.CIA_KEY             
      FROM INVENTARIO_PRODUCTO p, inventario_almacen a
      Where a.inventario_id =:invid 
         and p.codigo = a.codigo
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
           :INVENTARIAR,:PRECIO_TIPO_UNIDAD,:tipo_unidad,
           :precioventa1,
           :precioventa2,
           :precioventa3,
           :precioventa4,
           :USARLEVELPRECIO, :cia_key           
  DO
      BEGIN
        SUSPEND;
      END
END^

SET TERM ; ^

/* Definition for the `PROC_INV_VENTA_EST` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_INV_VENTA_EST(
  INVID INTEGER)
RETURNS(
  CODIGO INTEGER,
  CODIGO_TEXTO VARCHAR(40) CHARACTER SET NONE,
  FECHA DATE,
  CODIGO_BARRA VARCHAR(40) CHARACTER SET NONE,
  TIPO INTEGER,
  DESCRIPCION VARCHAR(80) CHARACTER SET NONE,
  CANTIDAD_REORDEN INTEGER,
  PRECIO_ANT NUMERIC(15, 2),
  CANTIDAD NUMERIC(15, 2),
  PRECIO NUMERIC(15, 2),
  BLCE_CANT_ENTRADA NUMERIC(15, 2),
  BLCE_CANT_SALIDA NUMERIC(15, 2),
  FECHA_ULTIMA_TRN DATE,
  STATUS CHAR(1) CHARACTER SET NONE,
  PORC_DESCUENTO NUMERIC(15, 2),
  FOTO BLOB,
  PAGA_ITBI SMALLINT,
  CODIGO_PRECIO CHAR(6) CHARACTER SET NONE,
  UNIDAD NUMERIC(15, 2),
  PRECIO_COMPRA NUMERIC(15, 2),
  PRECIO_MINIMO NUMERIC(15, 2),
  REFERENCIA VARCHAR(50) CHARACTER SET NONE,
  FECHA_VENCIMIENTO DATE,
  INVENTARIAR SMALLINT,
  PRECIO_TIPO_UNIDAD NUMERIC(15, 2),
  TIPO_UNIDAD INTEGER,
  PRECIOVENTA1 NUMERIC(15, 2),
  PRECIOVENTA2 NUMERIC(15, 2),
  PRECIOVENTA3 NUMERIC(15, 2),
  PRECIOVENTA4 NUMERIC(15, 2),
  USARLEVELPRECIO SMALLINT,
  CIA_KEY INTEGER)
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
             p.precioventa4,
             p.USARLEVELPRECIO,
             p.CIA_KEY
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
           :precioventa4,
           :USARLEVELPRECIO,:CIA_KEY
  DO
      BEGIN
        SUSPEND;
      END
END^

SET TERM ; ^

/* Definition for the `PROC_LISTADOESTUDIANTE` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_LISTADOESTUDIANTE
RETURNS(
  ID_ESTUDIANTE INTEGER,
  IDFAMILIA INTEGER,
  PRIMERNOMBRE VARCHAR(40) CHARACTER SET NONE,
  SEGUNDONOMBRE VARCHAR(40) CHARACTER SET NONE,
  PRIMERAPELLIDO VARCHAR(35) CHARACTER SET NONE,
  SEGUNDOAPELLIDO VARCHAR(35) CHARACTER SET NONE,
  FECHANACIMIENTO DATE,
  TELEFONO VARCHAR(14) CHARACTER SET NONE,
  CELULAR VARCHAR(14) CHARACTER SET NONE,
  EMAIL VARCHAR(60) CHARACTER SET NONE,
  STATUS CHAR(1) CHARACTER SET NONE,
  DESCRIPCION_CURSOS VARCHAR(35) CHARACTER SET NONE,
  NUMERO_ESTUDIANTE VARCHAR(10) CHARACTER SET NONE,
  IDCURSO INTEGER,
  DESC_SECCION CHAR(8) CHARACTER SET NONE)
AS
BEGIN
  FOR
    SELECT 
      ESTUDIANTES_MASTER.ID_ESTUDIANTE,
      ESTUDIANTES_MASTER.IDFAMILIA,
      UPPER(ESTUDIANTES_MASTER.PRIMERNOMBRE),
      UPPER(ESTUDIANTES_MASTER.SEGUNDONOMBRE),
      UPPER(ESTUDIANTES_MASTER.PRIMERAPELLIDO),
      UPPER(ESTUDIANTES_MASTER.SEGUNDOAPELLIDO),
      ESTUDIANTES_MASTER.FECHANACIMIENTO,
      ESTUDIANTES_MASTER.TELEFONO,
      ESTUDIANTES_MASTER.CELULAR,
      ESTUDIANTES_MASTER.EMAIL,            
      ESTUDIANTES_MASTER.STATUS
    FROM
      ESTUDIANTES_MASTER
    INTO
      :ID_ESTUDIANTE,
      :IDFAMILIA,
      :PRIMERNOMBRE,
      :SEGUNDONOMBRE,
      :PRIMERAPELLIDO,
      :SEGUNDOAPELLIDO,
      :FECHANACIMIENTO,
      :TELEFONO,
      :CELULAR,
      :EMAIL,            
      :STATUS
  DO
  BEGIN
    SELECT 
    UPPER(CURSOS.DESCRIPCION), ESTUDIANTE_DET.NUMERO_ESTUDIANTE,
    CURSOS.IDCURSO, cursos.SECCION
    FROM
    ESTUDIANTE_DET
    INNER JOIN CURSOS ON (ESTUDIANTE_DET.IDCURSO = CURSOS.IDCURSO)
    AND (ESTUDIANTE_DET.IDNIVEL = CURSOS.IDNIVEL)    
    WHERE ESTUDIANTE_DET.ID_ESTUDIANTE = :ID_ESTUDIANTE
    into
    :Descripcion_Cursos, :NUMERO_ESTUDIANTE, :IDCURSO, :desc_seccion;
    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROC_MANT_INVENTARIO_ALMACEN` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_MANT_INVENTARIO_ALMACEN(
  CODIGO INTEGER,
  INVENTARIO_ID INTEGER,
  CANTIDAD NUMERIC(15, 2),
  CODIGO_USUARIO INTEGER,
  FECHA_IN DATE,
  IN_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  STATUS CHAR(1) CHARACTER SET NONE)
AS
DECLARE VARIABLE ACCION SMALLINT;
BEGIN
  ACCION = -1;
  SELECT CODIGO 
  FROM INVENTARIO_ALMACEN
  WHERE CODIGO=:CODIGO AND INVENTARIO_ID=:INVENTARIO_ID
  INTO
  :ACCION;
  if (accion is null) then
  accion = -1;

  IF (ACCION > 0) THEN  /*  ACTUALIZAR  */
  BEGIN 
   UPDATE INVENTARIO_ALMACEN
   SET 
    CANTIDAD =CANTIDAD + :CANTIDAD,
    FECHA_MOD=:FECHA_MOD,
    MOD_POR =:MOD_POR
    WHERE CODIGO=:CODIGO AND INVENTARIO_ID=:INVENTARIO_ID;
  END ELSE
  BEGIN

   INSERT INTO INVENTARIO_ALMACEN(
    CODIGO,
    INVENTARIO_ID,
    CANTIDAD,
    CODIGO_USUARIO,
    FECHA_IN,
    IN_POR,
    FECHA_MOD,
    MOD_POR,
    STATUS)
    VALUES
    (
    :CODIGO,
    :INVENTARIO_ID,
    :CANTIDAD,
    :CODIGO_USUARIO,
    :FECHA_IN,
    :IN_POR,
    :FECHA_MOD,
    :MOD_POR,
    :STATUS
    ); 
 END  
   suspend; 
 END^

SET TERM ; ^

/* Definition for the `PROC_MANT_REGISTRO_DET` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_MANT_REGISTRO_DET(
  ACCION SMALLINT,
  COD_USUARIO INTEGER,
  NOMBRE_PC VARCHAR(12) CHARACTER SET NONE)
RETURNS(
  PERMITIDO SMALLINT,
  LOGUEADO SMALLINT)
AS
DECLARE VARIABLE EXISTE INTEGER;  
    DECLARE VARIABLE cant_pc INTEGER;
    DECLARE VARIABLE cant_pcLic INTEGER;
    DECLARE VARIABLE xStatus INTEGER;
BEGIN
  /* ACCION = 1 > LOGGIN*/
  /* ACCION = 0 > LOGOFF*/
  EXISTE = 0;
  SELECT COD_USUARIO, STATUS FROM REGISTRO_DET
  WHERE COD_USUARIO=:COD_USUARIO
  INTO :EXISTE, :xStatus;

  LOGUEADO = 0;  

  IF (:xStatus = 1) THEN
  BEGIN
    PERMITIDO = 0;
    LOGUEADO = 1;
  END

  SELECT Count(nombre_pc) 
  FROM REGISTRO_DET
  WHERE STATUS = 1
  INTO
  :cant_pc;
  
  SELECT cant_licencias
  FROM REGISTRO 
  INTO
  :cant_pcLic;
  
  permitido = 1;

  IF ((:cant_pc >= :cant_pcLic) OR (:cant_pcLic = 0)) THEN
  BEGIN
    permitido = 0;
  END 

  IF (EXISTE > 0) THEN
  BEGIN
    UPDATE REGISTRO_DET
    SET FECHA_SALIDA = "TODAY",
        STATUS =:ACCION
    WHERE cod_usuario =:cod_usuario;
    LOGUEADO = :ACCION;
  END ELSE
  IF (ACCION = 1) THEN
  BEGIN
    INSERT INTO REGISTRO_DET (
                COD_USUARIO,
                NOMBRE_PC,
                FECHA_INICIO,
                FECHA_SALIDA,
                STATUS)
    VALUES (:COD_USUARIO,
            upper(:NOMBRE_PC),
            "TODAY",
             NULL,
            :ACCION); 
  END  
  SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_NUMDOC` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_NUMDOC(
  TIPODOC INTEGER)
RETURNS(
  NUMERO_GEN INTEGER)
AS
BEGIN
  IF (:TIPODOC = 5) THEN  /* NOTA DE CREDITO */
  BEGIN
  Select Gen_id(GEN_NUM_TRANS_NCR,1) From rdb$database
  Into :NUMERO_GEN;
  END ELSE
  IF (:TIPODOC = 3) THEN  /* NOTA DE DEBITO */
  BEGIN
    Select Gen_id(GEN_NUM_TRANS_NDB,1) From rdb$database
    Into :NUMERO_GEN;
  END
SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_NUMDOC_CXP` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_NUMDOC_CXP(
  TIPODOC INTEGER)
RETURNS(
  NUMERO_GEN INTEGER)
AS
BEGIN
  IF (:TIPODOC = 5) THEN  /* NOTA DE CREDITO */
  BEGIN
  Select Gen_id(GEN_NUM_TRANS_NCR_CXP,1) From rdb$database
  Into :NUMERO_GEN;
  END ELSE
  IF (:TIPODOC = 3) THEN  /* NOTA DE DEBITO */
  BEGIN
    Select Gen_id(GEN_NUM_TRANS_NDB_CXP,1) From rdb$database
    Into :NUMERO_GEN;
  END
SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_NUM_CKS` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_NUM_CKS(
  TIPO SMALLINT,
  TABLA VARCHAR(30) CHARACTER SET NONE,
  NUMCKS INTEGER,
  CODBANCO INTEGER)
RETURNS(
  ACTNO_SERIE DOUBLE PRECISION)
AS
DECLARE VARIABLE NUM_aUXI NUMERIC(8,0);
BEGIN
  NUM_AUXI= :numcks;
  if (NUM_AUXI = 0) then
  begin
    select serie+1 from SEC_NUM_CKS
    where tipo = :tipo 
    and codbanco = :codbanco 
    into :actno_serie;
    update SEC_NUM_CKS
    set serie = :actno_serie
    where tipo = :tipo
    and codbanco = :codbanco;
  end else 
  if (num_auxi = -1 ) then
  begin
    select serie from sec_num_cks
    where tipo = :tipo
    and codbanco = :codbanco 
    into :actno_serie;
  end else
  begin
    update SEC_NUM_CKS
    set serie = :numcks
    where tipo = :tipo
    and codbanco = :codbanco;
    select serie from SEC_NUM_CKS
    where tipo = :tipo  
    and codbanco = :codbanco 
    into :actno_serie;
  end
END^

SET TERM ; ^

/* Definition for the `PROC_PANDATOSREQUISICION` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_PANDATOSREQUISICION(
  CANT INTEGER,
  XIDRECETA INTEGER)
RETURNS(
  ID_RECETA INTEGER,
  CODIGO_PROD SMALLINT,
  PORCENTAJE FLOAT,
  TIPO_UNIDAD SMALLINT,
  DESCTIPOUNIDAD VARCHAR(50) CHARACTER SET NONE,
  CANTIDAD NUMERIC(15, 2),
  PRECIO NUMERIC(15, 2),
  DESCPRODUCTO VARCHAR(40) CHARACTER SET NONE,
  STATUS CHAR(1) CHARACTER SET NONE)
AS
DECLARE VARIABLE cantXTipoUnidad integer;
DECLARE VARIABLE xPrecio numeric(15,2);
BEGIN
  FOR
    SELECT 
      PAN_RECETA_DET.ID_RECETA,
      PAN_RECETA_DET.CODIGO_PROD,
      PAN_RECETA_DET.PORCENTAJE,
      PAN_RECETA_DET.TIPO_UNIDAD,
      PAN_RECETA_DET.STATUS
    FROM
      PAN_RECETA_DET where id_receta=:xidReceta
    INTO
      :ID_RECETA,
      :CODIGO_PROD,
      :PORCENTAJE,
      :TIPO_UNIDAD,
      :STATUS
  DO
  BEGIN
    Select cantidad, descripcion from UNIDADES
    where idunidad =:tipo_unidad
    into
    :cantXTipoUnidad,:DescTipoUnidad;
    
    --Buscar precio`
    xPrecio = 0;
    Select Precio From PRECIO_XUNIDAD
    Where ID_PROD=:CODIGO_PROD
    And id_unidad=:TIPO_UNIDAD
    into
    :xPrecio;
    --Si no existe precio por unidad, use precio tabla inventario.
    IF (xPrecio is null or xPrecio =0) then
    begin
      Select i.PRECIO, i.DESCRIPCION From INVENTARIO_PRODUCTO i
      where i.CODIGO =:codigo_prod
      into 
      :xPrecio,
      :DescProducto;
    end
    if (xPrecio is not null) then
    Precio = xPrecio;
    else Precio = 0;
    
    cantidad = :cant * (:porcentaje/100);
    SUSPEND; 
  END
  
END^

SET TERM ; ^

/* Definition for the `PROC_PORC_APLICADO_FCT_SERV_I1` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_PORC_APLICADO_FCT_SERV_I1(
  NUMERO_TRN INTEGER,
  PORCGADMIN NUMERIC(15, 2),
  PORCITBISGADMIN NUMERIC(15, 2),
  PORCTRANS NUMERIC(15, 2),
  PORCDIRTEC NUMERIC(15, 2),
  PORCITBISDIRTEC NUMERIC(15, 2),
  PORCIMPREVISTO NUMERIC(15, 2),
  PORCITBISIMPREVISTO NUMERIC(15, 2))
AS
BEGIN
  INSERT INTO PORC_APLICADO_FCT_SERV (
    NUMERO_TRN,
    PORCGADMIN,
    PORCITBISGADMIN,
    PORCTRANS,
    PORCDIRTEC,
    PORCITBISDIRTEC,
    PORCIMPREVISTO,
    PORCITBISIMPREVISTO)
  VALUES (
    :NUMERO_TRN,
    :PORCGADMIN,
    :PORCITBISGADMIN,
    :PORCTRANS,
    :PORCDIRTEC,
    :PORCITBISDIRTEC,
    :PORCIMPREVISTO,
    :PORCITBISIMPREVISTO);
END^

SET TERM ; ^

/* Definition for the `PROC_PORC_APLICADO_FCT_SERV_S1` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_PORC_APLICADO_FCT_SERV_S1(
  XNUMERO_TRN INTEGER)
RETURNS(
  PORCGADMIN NUMERIC(15, 2),
  PORCITBISGADMIN NUMERIC(15, 2),
  PORCTRANS NUMERIC(15, 2),
  PORCDIRTEC NUMERIC(15, 2),
  PORCITBISDIRTEC NUMERIC(15, 2),
  PORCIMPREVISTO NUMERIC(15, 2),
  PORCITBISIMPREVISTO NUMERIC(15, 2))
AS
BEGIN
  FOR SELECT
             PORCGADMIN,
             PORCITBISGADMIN,
             PORCTRANS,
             PORCDIRTEC,
             PORCITBISDIRTEC,
             PORCIMPREVISTO,
             PORCITBISIMPREVISTO
  FROM PORC_APLICADO_FCT_SERV
  where numero_trn =:xNUMERO_TRN 
  INTO 
       :PORCGADMIN,
       :PORCITBISGADMIN,
       :PORCTRANS,
       :PORCDIRTEC,
       :PORCITBISDIRTEC,
       :PORCIMPREVISTO,
       :PORCITBISIMPREVISTO
  DO
    BEGIN
      SUSPEND;
    END
END^

SET TERM ; ^

/* Definition for the `PROC_PORC_APL_COTIZA_SERV_I` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_PORC_APL_COTIZA_SERV_I(
  NUMERO_TRN INTEGER,
  PORCGADMIN NUMERIC(15, 2),
  PORCITBISGADMIN NUMERIC(15, 2),
  PORCTRANS NUMERIC(15, 2),
  PORCDIRTEC NUMERIC(15, 2),
  PORCITBISDIRTEC NUMERIC(15, 2),
  PORCIMPREVISTO NUMERIC(15, 2),
  PORCITBISIMPREVISTO NUMERIC(15, 2))
AS
BEGIN
  INSERT INTO PORC_APLICADO_COTIZA_SERV (
    NUMERO_TRN,
    PORCGADMIN,
    PORCITBISGADMIN,
    PORCTRANS,
    PORCDIRTEC,
    PORCITBISDIRTEC,
    PORCIMPREVISTO,
    PORCITBISIMPREVISTO)
  VALUES (
    :NUMERO_TRN,
    :PORCGADMIN,
    :PORCITBISGADMIN,
    :PORCTRANS,
    :PORCDIRTEC,
    :PORCITBISDIRTEC,
    :PORCIMPREVISTO,
    :PORCITBISIMPREVISTO);
END^

SET TERM ; ^

/* Definition for the `PROC_REPARACIONES_DET_I` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_REPARACIONES_DET_I(
  SERIE INTEGER,
  NUMERO INTEGER,
  COD_PRODUCTO INTEGER,
  COD_USUARIO INTEGER,
  MONTO_SERVICIO NUMERIC(15, 2),
  INSERTADO_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_IN DATE,
  STATUS CHAR(1) CHARACTER SET NONE)
AS
declare variable xSerie integer;
BEGIN
  Select Gen_id(GEN_SERIE_REP_DET,1) From rdb$Database
  Into :xSerie;
  INSERT INTO REPARACIONES_DET (
    SERIE,
    NUMERO,
    COD_PRODUCTO,
    COD_USUARIO,
    MONTO_SERVICIO,
    INSERTADO_POR,
    FECHA_IN,
    STATUS)
  VALUES (
    :xSerie,
    :NUMERO,
    :COD_PRODUCTO,
    :COD_USUARIO,
    :MONTO_SERVICIO,
    :INSERTADO_POR,
    :FECHA_IN,
    :STATUS);
END^

SET TERM ; ^

/* Definition for the `PROC_REPARACIONES_DET_U` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_REPARACIONES_DET_U(
  SERIE INTEGER,
  NUMERO INTEGER,
  COD_PRODUCTO INTEGER,
  COD_USUARIO INTEGER,
  MONTO_SERVICIO NUMERIC(15, 2),
  INSERTADO_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_IN DATE,
  STATUS CHAR(1) CHARACTER SET NONE)
AS
BEGIN
  UPDATE REPARACIONES_DET
  SET
    SERIE = :SERIE,
    NUMERO = :NUMERO,
    COD_PRODUCTO = :COD_PRODUCTO,
    COD_USUARIO = :COD_USUARIO,
    MONTO_SERVICIO = :MONTO_SERVICIO,
    INSERTADO_POR = :INSERTADO_POR,
    FECHA_IN = :FECHA_IN,
    STATUS = :STATUS
  where serie=:serie
  and numero=:numero;
END^

SET TERM ; ^

/* Definition for the `PROC_REPARACIONES_HIST_I` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_REPARACIONES_HIST_I(
  SERIE INTEGER,
  TIPO_TRN INTEGER,
  COD_PRODUCTO INTEGER,
  FECHA DATE,
  COD_PROVEEDOR INTEGER,
  MONTO_SERVICIO NUMERIC(15, 2),
  COD_USUARIO INTEGER,
  INSERTADO_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_IN DATE)
AS
declare variable xSerie integer;
BEGIN
  Select Gen_id(GEN_SERIE_REP_HIST,1) From rdb$Database
  Into :xSerie;
  INSERT INTO REPARACIONES_HIST (
    SERIE,
    TIPO_TRN,
    COD_PRODUCTO,
    FECHA,
    COD_PROVEEDOR,
    MONTO_SERVICIO,
    COD_USUARIO,
    INSERTADO_POR,
    FECHA_IN)
  VALUES (
    :xSerie,
    :TIPO_TRN,
    :COD_PRODUCTO,
    :FECHA,
    :COD_PROVEEDOR,
    :MONTO_SERVICIO,
    :COD_USUARIO,
    :INSERTADO_POR,
    :FECHA_IN);
END^

SET TERM ; ^

/* Definition for the `PROC_REPARACIONES_HIST_S` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_REPARACIONES_HIST_S
RETURNS(
  SERIE INTEGER,
  TIPO_TRN INTEGER,
  COD_PRODUCTO INTEGER,
  FECHA DATE,
  COD_PROVEEDOR INTEGER,
  MONTO_SERVICIO NUMERIC(15, 2),
  COD_USUARIO INTEGER,
  INSERTADO_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_IN DATE)
AS
BEGIN
  FOR SELECT SERIE,
             TIPO_TRN,
             COD_PRODUCTO,
             FECHA,
             COD_PROVEEDOR,
             MONTO_SERVICIO,
             COD_USUARIO,
             INSERTADO_POR,
             FECHA_IN
      FROM REPARACIONES_HIST
      INTO :SERIE,
           :TIPO_TRN,
           :COD_PRODUCTO,
           :FECHA,
           :COD_PROVEEDOR,
           :MONTO_SERVICIO,
           :COD_USUARIO,
           :INSERTADO_POR,
           :FECHA_IN
  DO
      BEGIN
        SUSPEND;
      END
END^

SET TERM ; ^

/* Definition for the `PROC_REPARACIONES_HIST_U` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_REPARACIONES_HIST_U(
  SERIE INTEGER,
  TIPO_TRN INTEGER,
  COD_PRODUCTO INTEGER,
  FECHA DATE,
  COD_PROVEEDOR INTEGER,
  MONTO_SERVICIO NUMERIC(15, 2),
  COD_USUARIO INTEGER,
  INSERTADO_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_IN DATE)
AS
BEGIN
  UPDATE REPARACIONES_HIST
  SET
    SERIE = :SERIE,
    TIPO_TRN = :TIPO_TRN,
    COD_PRODUCTO = :COD_PRODUCTO,
    FECHA = :FECHA,
    COD_PROVEEDOR = :COD_PROVEEDOR,
    MONTO_SERVICIO = :MONTO_SERVICIO,
    COD_USUARIO = :COD_USUARIO,
    INSERTADO_POR = :INSERTADO_POR,
    FECHA_IN = :FECHA_IN
  WHERE SERIE=:SERIE
  AND TIPO_TRN=:TIPO_TRN;
    
END^

SET TERM ; ^

/* Definition for the `PROC_REPARACIONES_MASTER_I` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_REPARACIONES_MASTER_I(
  NUMERO INTEGER,
  TIPO_TRN INTEGER,
  COD_PROVEEDOR INTEGER,
  FECHA DATE,
  OBSERVACION VARCHAR(100) CHARACTER SET NONE,
  STATUS CHAR(1) CHARACTER SET NONE)
AS
declare variable xNumero integer;
BEGIN
  Select Gen_id(GEN_SERIE_REP_MASTER,1) From rdb$Database
  Into :xNumero;
  INSERT INTO REPARACIONES_MASTER (
    NUMERO,
    TIPO_TRN,
    COD_PROVEEDOR,
    FECHA,
    OBSERVACION,
    STATUS)
  VALUES (
    :xNumero,
    :TIPO_TRN,
    :COD_PROVEEDOR,
    :FECHA,
    :OBSERVACION,
    :STATUS);
END^

SET TERM ; ^

/* Definition for the `PROC_REPARACIONES_MASTER_S` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_REPARACIONES_MASTER_S
RETURNS(
  NUMERO INTEGER,
  TIPO_TRN INTEGER,
  COD_PROVEEDOR INTEGER,
  FECHA DATE,
  OBSERVACION VARCHAR(100) CHARACTER SET NONE,
  STATUS CHAR(1) CHARACTER SET NONE)
AS
BEGIN
  FOR SELECT NUMERO,
             TIPO_TRN,
             COD_PROVEEDOR,
             FECHA,
             OBSERVACION,
             STATUS
      FROM REPARACIONES_MASTER
      INTO :NUMERO,
           :TIPO_TRN,
           :COD_PROVEEDOR,
           :FECHA,
           :OBSERVACION,
           :STATUS
  DO
      BEGIN
        SUSPEND;
      END
END^

SET TERM ; ^

/* Definition for the `PROC_REPARACIONES_MASTER_U` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_REPARACIONES_MASTER_U(
  NUMERO INTEGER,
  TIPO_TRN INTEGER,
  COD_PROVEEDOR INTEGER,
  FECHA DATE,
  OBSERVACION VARCHAR(100) CHARACTER SET NONE,
  STATUS CHAR(1) CHARACTER SET NONE)
AS
BEGIN
  UPDATE REPARACIONES_MASTER
  SET
    NUMERO = :NUMERO,
    TIPO_TRN = :TIPO_TRN,
    COD_PROVEEDOR = :COD_PROVEEDOR,
    FECHA = :FECHA,
    OBSERVACION = :OBSERVACION,
    STATUS = :STATUS
  Where numero=:numero;
END^

SET TERM ; ^

/* Definition for the `PROC_REPORTEDIFERENCIACUADRE` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_REPORTEDIFERENCIACUADRE(
  FECHAINI DATE,
  FECHAFIN DATE)
RETURNS(
  FECHA DATE,
  RUTA INTEGER,
  CODIGO_EMP INTEGER,
  NOMBRE VARCHAR(35) CHARACTER SET NONE,
  APELLIDO VARCHAR(35) CHARACTER SET NONE,
  EFECTIVO NUMERIC(15, 2),
  CHEQUE NUMERIC(15, 2),
  CREDITO_DIRECTO NUMERIC(15, 2),
  CREDITO_NORMAL NUMERIC(15, 2),
  PROMOCION NUMERIC(15, 2),
  MONTO_VENTA NUMERIC(15, 2),
  AJUSTE NUMERIC(15, 2),
  COMENTARIO BLOB SUB_TYPE 1 CHARACTER SET NONE)
AS
BEGIN
  FOR
    SELECT DISTINCT CUADRE_RUTA_DET.FECHA,
           CUADRE_RUTA_DET.RUTA,
           CUADRE_RUTA_DET.CODIGO_EMP,
           EMPLEADO.NOMBRE,
           EMPLEADO.APELLIDO,
           CUADRE_RUTA_DET.EFECTIVO,
           CUADRE_RUTA_DET.CHEQUE,
           CUADRE_RUTA_DET.CREDITO_DIRECTO,
           CUADRE_RUTA_DET.CREDITO_NORMAL,
           CUADRE_RUTA_DET.PROMOCION,
           CUADRE_RUTA_DET.ajuste,
           CUADRE_RUTA_DET.comentario
           
    FROM CUADRE_RUTA_DET
       INNER JOIN RUTA ON (CUADRE_RUTA_DET.RUTA = RUTA.CODIGO)
       INNER JOIN EMPLEADO ON (CUADRE_RUTA_DET.CODIGO_EMP = EMPLEADO.CODIGO)
    Where CUADRE_RUTA_DET.FECHA between :fechaini and :fechafin
    INTO
      :FECHA,
      :RUTA,
      :CODIGO_EMP,
      :NOMBRE,
      :APELLIDO,
      :EFECTIVO,
      :CHEQUE,
      :CREDITO_DIRECTO,
      :CREDITO_NORMAL,
      :PROMOCION,:ajuste, :comentario
      
  DO
  BEGIN
    Select Sum(Valortotal) FROM cuadre_ruta c
    Where C.FECHA = :fecha
    And c.ruta = :ruta
    into :monto_venta; 

    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROC_REP_AVISO_ATRASO` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_REP_AVISO_ATRASO(
  CODIGOCTE INTEGER,
  FECHAACTUAL DATE)
RETURNS(
  CODIGO_CTE INTEGER,
  DIAS_EN_ATRASO INTEGER,
  FECHA DATE,
  NOMBRE_CTE VARCHAR(60) CHARACTER SET NONE,
  DIRECCION_CONT VARCHAR(60) CHARACTER SET NONE,
  TELEF_CONTACTO VARCHAR(14) CHARACTER SET NONE,
  APODO VARCHAR(20) CHARACTER SET NONE,
  SERIE INTEGER,
  CIUDAD VARCHAR(30) CHARACTER SET NONE,
  FECHA_ULT_PAGO DATE,
  TIPO_FREC_PAGO INTEGER,
  CODIGO_AVISO INTEGER,
  AVISO_DESC BLOB SUB_TYPE 1 CHARACTER SET NONE)
AS
DECLARE VARIABLE DiasTranscurrido Integer;
  DECLARE VARIABLE CANT_MODULO Integer;
  DECLARE VARIABLE xCantCuotas Integer;
  DECLARE VARIABLE CUOTASPEND INTEGER;
  DECLARE VARIABLE frecDiasPago integer;
  DECLARE VARIABLE avisocodigo integer;
  DECLARE VARIABLE avisoDesc BLOB SUB_TYPE 1 SEGMENT SIZE 80;
  DECLARE VARIABLE DiasTrans INTEGER;
BEGIN
  FOR
    SELECT FINANCIAMIENTO.CODIGO_CTE, FINANCIAMIENTO.FECHA, CLIENTES.NOMBRE_CTE,
           CLIENTES.DIRECCION_CONT,
           CLIENTES.TELEF_CONTACTO,
           CLIENTES.APODO,
           FINANCIAMIENTO.SERIE,
           CLIENTES.CIUDAD,
           FINANCIAMIENTO.FECHA_ULT_PAGO, FINANCIAMIENTO.TIPO_FREC_PAGO
    FROM CLIENTES
       INNER JOIN FINANCIAMIENTO ON (CLIENTES.CODIGO_CTE = FINANCIAMIENTO.CODIGO_CTE)

    INTO
      :CODIGO_CTE, :FECHA, :NOMBRE_CTE,
      :DIRECCION_CONT,
      :TELEF_CONTACTO,
      :APODO,
      :SERIE,
      :CIUDAD, 
      :FECHA_ULT_PAGO, 
      :TIPO_FREC_PAGO
  DO
  BEGIN
 
      DiasTranscurrido = 0;
      xCantCuotas  = 0;
      frecDiasPago = 0;

      Select frecuencia_dias from frec_pago_loan where codigo=:TIPO_FREC_PAGO
      into :frecDiasPago;

      if (:FECHA_ULT_PAGO is not null) then
      DiasTranscurrido = f_ageinDays(:FECHA_ULT_PAGO,:fechaActual);
      else  DiasTranscurrido = f_ageinDays(:FECHA,:fechaActual);

      DiasTrans = DiasTranscurrido;

      if (:DiasTranscurrIdo > :frecDiasPago) then 
      CANT_MODULO = F_MODULO(DiasTranscurrido , :frecDiasPago);
  
/*     if ( CANT_MODULO > 3 ) Then
      CantMesAtraso =  ((DiasTranscurrido  / :frecDiasPago) - f_modulo(DiasTranscurrido, :frecDiasPago)/:frecDiasPago) +1;

      CantPeriodosAtraso = CantMesAtraso; */

     DIAS_EN_ATRASO =:DiasTranscurrido - :frecDiasPago;
     

     SELECT DISTINCT CODIGO, DESCRIPCION From AVISO_VENC_FINANC
     WHERE :DIAS_EN_ATRASO BETWEEN AVISO_VENC_FINANC.DIA_INICIAL AND AVISO_VENC_FINANC.DIA_FINAL
     AND AVISO_VENC_FINANC.STATUS = "A"
     INTO :avisocodigo, :avisoDesc;

     CODIGO_AVISO=:avisocodigo;
     aviso_Desc=:avisoDesc; 
  suspend;
  end
END^

SET TERM ; ^

/* Definition for the `PROC_REP_TBIS` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_REP_TBIS(
  FECHAINI DATE,
  FECHAFIN DATE)
RETURNS(
  TIPODOC VARCHAR(12) CHARACTER SET NONE,
  CODIGO_CTE INTEGER,
  ITBI_DET NUMERIC(15, 2),
  NOMBRE_CTE VARCHAR(60) CHARACTER SET NONE,
  FECHA DATE,
  MONEDA CHAR(1) CHARACTER SET NONE,
  VALOR_TOTAL_DET NUMERIC(15, 2),
  NUMERO INTEGER,
  RNC_NUMERO VARCHAR(14) CHARACTER SET NONE,
  CEDULA CHAR(15) CHARACTER SET NONE,
  NUMERO_NCF VARCHAR(21) CHARACTER SET NONE,
  NUMERODOC VARCHAR(12) CHARACTER SET NONE)
AS
DECLARE VARIABLE XSERIE INTEGER;
BEGIN
  FOR
    SELECT DISTINCT 
           'FACTURAS',
           VENTAS_MAST.CODIGO_CTE,     
           CLIENTES.NOMBRE_CTE,
           VENTAS_MAST.FECHA,
           VENTAS_MAST.MONEDA,
           VENTAS_MAST.VALOR_TOTAL_DET,           
           VENTAS_MAST.NUMERO,
           CLIENTES.RNC_NUMERO,
           CLIENTES.CEDULA,
           NCF_ASIGNADOS.NUMERO_NCF,
           coalesce(ventas_mast.NUMERO_FACTURA, ventas_mast.NUMERO_DOC_PAGO, '*****') as NumeroDoc 
    FROM NCF_ASIGNADOS
       RIGHT OUTER JOIN VENTAS_MAST ON (NCF_ASIGNADOS.SERIE = VENTAS_MAST.SERIE_NCF_ASIGNADO)
       INNER JOIN VENTAS_DET ON (VENTAS_MAST.NUMERO = VENTAS_DET.NUMERO)
       LEFT OUTER JOIN CLIENTES ON (VENTAS_MAST.CODIGO_CTE = CLIENTES.CODIGO_CTE)
    Where VENTAS_MAST.FECHA BETWEEN :fechaini and :fechafin
    ORDER BY VENTAS_MAST.FECHA, VENTAS_MAST.CODIGO_CTE, NCF_ASIGNADOS.NUMERO_NCF    

    INTO
      :TIPODOC,
      :CODIGO_CTE,
      :NOMBRE_CTE,
      :FECHA,
      :MONEDA,
      :VALOR_TOTAL_DET,
      :NUMERO,
      :RNC_NUMERO,
      :CEDULA,
      :NUMERO_NCF,
      :NumeroDoc
  DO
  BEGIN
    if (NOMBRE_CTE = ''  or NOMBRE_CTE is null) THEN
    NOMBRE_CTE= '*** CLIENTE GENERICO ***';
     /* VENTAS_DET.ITBI_DET, */
    SELECT SUM(VENTAS_DET.ITBI_DET)
    FROM VENTAS_DET WHERE NUMERO=:NUMERO
    AND VENTAS_DET.STATUS_DET IN ("R","A")
    INTO :ITBI_DET; 
    SUSPEND;
  END
END^

SET TERM ; ^

/* Definition for the `PROC_RFACTURAS` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_RFACTURAS(
  FECHAINI DATE,
  FECHAFIN DATE,
  MONEDAI CHAR(1) CHARACTER SET NONE,
  MONEDAF CHAR(1) CHARACTER SET NONE)
AS
BEGIN
  INSERT INTO 
  FACTURAS_PENDIENTES(TIPO,MONEDA,NUMERO_FACT,MONTO_PENDIENTE,STATUS)
  Select TIPO,MONEDA,NUMERO,MONTO_FACT,"A"
  From facturas
  WHERE FECHA BETWEEN :FECHAINI AND :FECHAFIN
  and moneda BETWEEN  :monedaI AND :MONEDAF
  and status = "P";

  UPDATE FACTURAS
  SET STATUS = "F" 
  where fecha between :fechaini and :fechafin
  and moneda BETWEEN  :monedaI AND :MONEDAF
  and status = "P";
END^

SET TERM ; ^

/* Definition for the `PROC_SECUENCIA` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_SECUENCIA(
  TIPO INTEGER,
  COD_USUARIO INTEGER)
RETURNS(
  SECUENCIA INTEGER)
AS
DECLARE VARIABLE XSEC INTEGER;
BEGIN
 XSEC = 0;
 SELECT MAX(secuencia) 
 FROM SECUENCIA
 WHERE tipo =:Tipo
 INTO :XSEC;

 IF (XSEC IS NULL) THEN
 BEGIN 
   INSERT INTO SECUENCIA(TIPO, SECUENCIA, FECHA_UPDATE, COD_USUARIO)
   VALUES(:TIPO, 0, "TODAY", :COD_USUARIO);
   XSEC = 1;
 END ELSE XSEC = XSEC + 1;
  
 UPDATE SECUENCIA 
 SET secuencia=:XSEC,
 COD_USUARIO=:COD_USUARIO,
 FECHA_UPDATE="TODAY"
 WHERE tipo =:tipo;
 SECUENCIA =XSEC;
 SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_SECUENCIA_PREVENTA` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_SECUENCIA_PREVENTA(
  TIPO INTEGER,
  COD_USUARIO INTEGER)
RETURNS(
  SECUENCIA INTEGER)
AS
DECLARE VARIABLE XSEC INTEGER;
BEGIN
 XSEC = 0;
 SELECT MAX(secuencia) 
 FROM SECUENCIA_preventa
 WHERE tipo =:Tipo
 INTO :XSEC;

 IF (XSEC IS NULL) THEN
 BEGIN 
   INSERT INTO SECUENCIA_preventa(TIPO, SECUENCIA, FECHA_UPDATE, COD_USUARIO)
   VALUES(:TIPO, 0, "TODAY", :COD_USUARIO);
   XSEC = 1;
 END ELSE XSEC = XSEC + 1;
  
 UPDATE SECUENCIA_preventa 
 SET secuencia=:XSEC,
 COD_USUARIO=:COD_USUARIO,
 FECHA_UPDATE="TODAY"
 WHERE tipo =:tipo;
 SECUENCIA =XSEC;
 SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_SERV` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_SERV(
  FECHAINI DATE,
  FECHAFIN DATE)
RETURNS(
  SERIE INTEGER,
  TIPOSERVICIO INTEGER,
  DESCRIPCION VARCHAR(40) CHARACTER SET NONE,
  FECHA_DET DATE,
  CODIGO_CTE INTEGER,
  NOMBRE_FACTURAR VARCHAR(160) CHARACTER SET NONE,
  NOMBRE_CLIENTE_DET VARCHAR(60) CHARACTER SET NONE,
  DIRECCION_CONT VARCHAR(60) CHARACTER SET NONE,
  FAX_CONTACTO VARCHAR(20) CHARACTER SET NONE,
  WEBSITE VARCHAR(40) CHARACTER SET NONE,
  PAIS VARCHAR(30) CHARACTER SET NONE,
  CIUDAD VARCHAR(30) CHARACTER SET NONE,
  CANTIDAD_DETA INTEGER,
  CANT_ADULTO_DETA INTEGER,
  TARIFA_SERV_DETA NUMERIC(15, 2),
  MONEDA_DET CHAR(1) CHARACTER SET NONE,
  PORC_DESC_DET NUMERIC(15, 2),
  VALOR_SERVICIO_DET NUMERIC(15, 2),
  VALOR_TOTAL_DET NUMERIC(15, 2),
  NUM_FACT_DET INTEGER,
  NUMERO_RECIBO INTEGER,
  IMPUESTO_SERV_DET NUMERIC(15, 2),
  STATUS_DET CHAR(1) CHARACTER SET NONE,
  COD_AREA_FACT INTEGER,
  CONTACTO VARCHAR(40) CHARACTER SET NONE,
  TELEF_CONTACTO VARCHAR(20) CHARACTER SET NONE,
  EMAIL VARCHAR(40) CHARACTER SET NONE,
  AREA VARCHAR(60) CHARACTER SET NONE,
  ORIGEN INTEGER,
  VALOR_INGRESO_RECIBO NUMERIC(15, 2),
  TIPO_DOC SMALLINT)
AS
begin
/* Transacciones Cxc */
For
SELECT
    distinct
    Trans_cxc.Serie,
    Trans_cxc.TIPO_SERV,
    tipo_cliente.DESCRIPCION,
    Trans_cxc.FECHA,
    Clientes.CODIGO_CTE,
    Clientes.NOMBRE_CTE,
    Clientes.Nombre_FACTURAR,
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
    trans_cxc.NUMERO_RECIBO,
    null,
    Trans_cxc.STATUS,
    null,
    Clientes.nombre_facturar,
    Clientes.TELEF_CONTACTO,
    Clientes.EMAIL,
    Trans_cxc.Concepto,
    Trans_cxc.tipo_tranf,
    Trans_cxc.VALOR_DOCUMENTO,
    Trans_cxc.tipo_doc
FROM TRANS_CXC Trans_cxc
   LEFT OUTER JOIN CLIENTES Clientes
   ON  (Trans_cxc.CODIGO_CLIENTE = Clientes.CODIGO_CTE)
   LEFT OUTER JOIN tipo_cliente tipo_cliente
   ON  (Clientes.tipo_cliente = tipo_cliente.CODIGO)
   LEFT OUTER JOIN Doc_tran_cxt
   ON  (Trans_cxc.tipo_doc = Doc_tran_cxt.codigo)
Where Trans_cxc.STATUS in ('A','R')
And Trans_cxc.tipo_doc in (1,2,3,5,10)
And Trans_cxc.FECHA BetWeen :fechaini And :fechafin
Into
   :serie,
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
   :Tipo_doc
Do
 Suspend;
for
SELECT
    null,
    null,
    null,
    null,
    Clientes.CODIGO_CTE,
    Clientes.NOMBRE_CTE,
    Clientes.Nombre_FACTURAR,
   Clientes.DIRECCION_CONT,
   Clientes.FAX_CONTACTO,
   Clientes.WEBSITE,
   Clientes.PAIS,
   Clientes.CIUDAD,
    null,
    null,
    null,
    null,
    Null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    Clientes.nombre_facturar,
    Clientes.TELEF_CONTACTO,
    Clientes.EMAIL,
    null,
    2,
    null,
    2
FROM CLIENTES Clientes
Into
   :serie,
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
   :EMAIL, :AREA,:origen,
   :valor_ingreso_recibo,
   :Tipo_doc
  Do
 Suspend;
End^

SET TERM ; ^

/* Definition for the `PROC_SERV_CXP` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_SERV_CXP(
  FECHAINI DATE,
  FECHAFIN DATE)
RETURNS(
  SERIE INTEGER,
  TIPOSERVICIO INTEGER,
  DESCRIPCION VARCHAR(40) CHARACTER SET NONE,
  FECHA_DET DATE,
  CODIGO_CTE INTEGER,
  NOMBRE_FACTURAR VARCHAR(160) CHARACTER SET NONE,
  NOMBRE_CLIENTE_DET VARCHAR(60) CHARACTER SET NONE,
  DIRECCION_CONT VARCHAR(60) CHARACTER SET NONE,
  FAX_CONTACTO VARCHAR(20) CHARACTER SET NONE,
  WEBSITE VARCHAR(40) CHARACTER SET NONE,
  PAIS VARCHAR(30) CHARACTER SET NONE,
  CIUDAD VARCHAR(30) CHARACTER SET NONE,
  CANTIDAD_DETA INTEGER,
  CANT_ADULTO_DETA INTEGER,
  TARIFA_SERV_DETA NUMERIC(15, 2),
  MONEDA_DET CHAR(1) CHARACTER SET NONE,
  PORC_DESC_DET NUMERIC(15, 2),
  VALOR_SERVICIO_DET NUMERIC(15, 2),
  VALOR_TOTAL_DET NUMERIC(15, 2),
  NUM_FACT_DET INTEGER,
  NUMERO_RECIBO INTEGER,
  IMPUESTO_SERV_DET NUMERIC(15, 2),
  STATUS_DET CHAR(1) CHARACTER SET NONE,
  COD_AREA_FACT INTEGER,
  CONTACTO VARCHAR(40) CHARACTER SET NONE,
  TELEF_CONTACTO VARCHAR(20) CHARACTER SET NONE,
  EMAIL VARCHAR(40) CHARACTER SET NONE,
  AREA VARCHAR(60) CHARACTER SET NONE,
  ORIGEN INTEGER,
  VALOR_INGRESO_RECIBO NUMERIC(15, 2),
  TIPO_DOC SMALLINT)
AS
begin

/* Transacciones Cxc */
For
SELECT
    Trans_cxc.Serie,
    Trans_cxc.TIPO_SERV,
    tipo_cliente.DESCRIPCION,
    Trans_cxc.FECHA,
    Clientes.CODIGO_CTE,
    Clientes.descripcion NOMBRE_CTE,
    Clientes.descripcion Nombre_FACTURAR,
   Clientes.calyynum DIRECCION_CONT,
   Clientes.fax FAX_CONTACTO,
   null WEBSITE,
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
    trans_cxc.numero_doc NUMERO_RECIBO,
    null,
    Trans_cxc.STATUS,
    null,
    Clientes.descripcion nombre_facturar,
    Clientes.telefono TELEF_CONTACTO,
    Clientes.EMAIL,
    Trans_cxc.Concepto,
    Trans_cxc.tipo_tranf,
    Trans_cxc.VALOR_DOCUMENTO,
    Trans_cxc.tipo_doc
FROM TRANS_CXp Trans_cxc
   LEFT OUTER JOIN proveedores Clientes
   ON  (Trans_cxc.CODIGO_CLIENTE = Clientes.CODIGO_CTE)

   LEFT OUTER JOIN tipo_cliente tipo_cliente
   ON  (Clientes.tipo_cliente = tipo_cliente.CODIGO)
   LEFT OUTER JOIN Doc_tran_cxt
   ON  (Trans_cxc.tipo_doc = Doc_tran_cxt.codigo)
Where Trans_cxc.STATUS in ('A','R')
And Trans_cxc.tipo_doc in (1,2,3,5,10)
And Trans_cxc.FECHA BetWeen :fechaini And :fechafin
Into
   :serie,
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
   :Tipo_doc
Do
 Suspend;
end^

SET TERM ; ^

/* Definition for the `PROC_SERV_N2_08` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_SERV_N2_08(
  FECHAINI DATE,
  FECHAFIN DATE)
RETURNS(
  TIPOSERVICIO INTEGER,
  DESCRIPCION VARCHAR(40) CHARACTER SET NONE,
  FECHA_DET DATE,
  CODIGO_CTE INTEGER,
  NOMBRE_FACTURAR VARCHAR(40) CHARACTER SET NONE,
  NOMBRE_CLIENTE_DET VARCHAR(40) CHARACTER SET NONE,
  DIRECCION_CONT VARCHAR(60) CHARACTER SET NONE,
  FAX_CONTACTO VARCHAR(14) CHARACTER SET NONE,
  WEBSITE VARCHAR(40) CHARACTER SET NONE,
  PAIS VARCHAR(30) CHARACTER SET NONE,
  CIUDAD VARCHAR(30) CHARACTER SET NONE,
  CANTIDAD_DETA INTEGER,
  CANT_ADULTO_DETA INTEGER,
  TARIFA_SERV_DETA NUMERIC(15, 2),
  MONEDA_DET CHAR(1) CHARACTER SET NONE,
  PORC_DESC_DET NUMERIC(15, 2),
  VALOR_SERVICIO_DET NUMERIC(15, 2),
  VALOR_TOTAL_DET NUMERIC(15, 2),
  NUM_FACT_DET INTEGER,
  NUMERO_RECIBO INTEGER,
  IMPUESTO_SERV_DET NUMERIC(15, 2),
  STATUS_DET CHAR(1) CHARACTER SET NONE,
  COD_AREA_FACT INTEGER,
  CONTACTO VARCHAR(40) CHARACTER SET NONE,
  TELEF_CONTACTO VARCHAR(14) CHARACTER SET NONE,
  EMAIL VARCHAR(40) CHARACTER SET NONE,
  AREA VARCHAR(20) CHARACTER SET NONE,
  ORIGEN INTEGER,
  VALOR_INGRESO_RECIBO NUMERIC(15, 2),
  TIPO_DOC SMALLINT)
AS
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
End^

SET TERM ; ^

/* Definition for the `PROC_TRANS_CXC_U1` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_TRANS_CXC_U1(
  SERIE DOUBLE PRECISION,
  CIA_KEY INTEGER,
  TIPO_DOC INTEGER,
  MONEDA CHAR(1) CHARACTER SET NONE,
  FECHA DATE,
  NUMERO_DOC INTEGER,
  CODIGO_CLIENTE INTEGER,
  CODIGO_SERV INTEGER,
  CONCEPTO VARCHAR(60) CHARACTER SET NONE,
  VALOR_DOCUMENTO NUMERIC(15, 2),
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  NUMERO_TRN_VENTA INTEGER)
AS
BEGIN
  UPDATE TRANS_CXC
  SET
    CIA_KEY = :CIA_KEY,
    MONEDA = :MONEDA,
    FECHA = :FECHA,
    NUMERO_DOC = :NUMERO_DOC,
    CODIGO_CLIENTE = :CODIGO_CLIENTE,
    CODIGO_SERV = :CODIGO_SERV,
    CONCEPTO = :CONCEPTO,
    VALOR_DOCUMENTO = :VALOR_DOCUMENTO,
    FECHA_MOD = :FECHA_MOD,
    MOD_POR = :MOD_POR,
    NUMERO_TRN_VENTA = :NUMERO_TRN_VENTA
  
  WHERE
  (SERIE = :SERIE) AND 
  (NUMERO_DOC=:NUMERO_DOC) and
  (CIA_KEY =:CIA_KEY) and
  (TIPO_DOC = :TIPO_DOC);
END^

SET TERM ; ^

/* Definition for the `PROC_UPDATECXC` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_UPDATECXC(
  TIPO INTEGER,
  MONEDA CHAR(1) CHARACTER SET NONE,
  NUMERO_FACT INTEGER,
  MONTO_PAGADO FLOAT,
  STATUS CHAR(1) CHARACTER SET NONE,
  ACCION SMALLINT,
  CODIGO_CTE_IN INTEGER,
  FECHATRN DATE,
  NUMEROTRN_CXC INTEGER)
RETURNS(
  VALOR_PENDIENTE FLOAT)
AS
declare variable lnumFact integer;
BEGIN
  IF (:ACCION = 1) THEN
  BEGIN
    UPDATE FACTURAS_PENDIENTES
    SET MONTO_PENDIENTE = MONTO_PENDIENTE - :MONTO_PAGADO
    WHERE TIPO =:TIPO AND MONEDA =:MONEDA
          AND NUMERO_FACT =:NUMERO_FACT;
  EXECUTE PROCEDURE PROC_ACT_BALANCE_CTE_CXC(
  :CODIGO_CTE_IN,
  0,
  '1',
  2,
  :MONTO_PAGADO,
  :FECHATRN,
  :NUMEROTRN_CXC);
  END else
  if (:accion = -1) then
  begin
    SELECT MONTO_PENDIENTE from  FACTURAS_PENDIENTES
    WHERE TIPO = :TIPO AND MONEDA = :MONEDA
    AND NUMERO_FACT = :NUMERO_FACT
    INTO :VALOR_PENDIENTE;
  EXECUTE PROCEDURE PROC_ACT_BALANCE_CTE_CXC(
  :CODIGO_CTE_IN,
  0,
  '1',
   1,
  :MONTO_PAGADO,
  :FECHATRN,
  :NUMEROTRN_CXC);
  end
  Select monto_pendiente from facturas_pendientes
  where TIPO =:TIPO AND MONEDA =:MONEDA
          AND NUMERO_FACT =:NUMERO_FACT
  Into :lnumFact;
  If (lnumFact <= 0) Then
  Execute procedure procfact_saldar(:NUMERO_FACT);
END^

SET TERM ; ^

/* Definition for the `PROC_UPDATECXP` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_UPDATECXP(
  TIPO INTEGER,
  MONEDA CHAR(1) CHARACTER SET NONE,
  NUMERO_FACT INTEGER,
  MONTO_PAGADO FLOAT,
  STATUS CHAR(1) CHARACTER SET NONE,
  ACCION SMALLINT,
  CODIGO_CTE_IN INTEGER,
  FECHATRN DATE,
  NUMEROTRN_CXC INTEGER)
RETURNS(
  VALOR_PENDIENTE FLOAT)
AS
declare variable lnumFact integer;
BEGIN
  IF (:ACCION = 1) THEN
  BEGIN
    UPDATE FACTURAS_CXP_PENDIENTES
    SET MONTO_PENDIENTE = MONTO_PENDIENTE - :MONTO_PAGADO
    WHERE TIPO =:TIPO AND MONEDA =:MONEDA
          AND NUMERO_FACT =:NUMERO_FACT;

    EXECUTE PROCEDURE PROC_ACT_BALANCE_PROV_CXP(
    :CODIGO_CTE_IN,
    0,
    '1',
    2,
    :MONTO_PAGADO,
    :FECHATRN,
    :NUMEROTRN_CXC);
  END else
  if (:accion = -1) then
  begin
    SELECT MONTO_PENDIENTE From  FACTURAS_CXP_PENDIENTES
    WHERE TIPO = :TIPO AND MONEDA = :MONEDA
    AND NUMERO_FACT = :NUMERO_FACT
    INTO :VALOR_PENDIENTE;

  EXECUTE PROCEDURE PROC_ACT_BALANCE_PROV_CXP(
  :CODIGO_CTE_IN,
  0,
  '1',
   1,
  :MONTO_PAGADO,
  :FECHATRN,
  :NUMEROTRN_CXC);
  end
  Select monto_pendiente From facturas_CXP_pendientes
  Where TIPO =:TIPO AND MONEDA =:MONEDA
          AND NUMERO_FACT =:NUMERO_FACT
  Into :lnumFact;

END^

SET TERM ; ^

/* Definition for the `PROC_UPDATEFACTURAS_U1` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_UPDATEFACTURAS_U1(
  SERIE DOUBLE PRECISION,
  NUMERO DOUBLE PRECISION,
  MONEDA CHAR(2) CHARACTER SET NONE,
  TIPO SMALLINT,
  CODIGO_CTE INTEGER,
  FECHA DATE,
  DESCRIPCION VARCHAR(40) CHARACTER SET NONE,
  MONTO_FACT NUMERIC(15, 2),
  RCXC CHAR(1) CHARACTER SET NONE,
  RCNT CHAR(1) CHARACTER SET NONE,
  STATUS CHAR(1) CHARACTER SET NONE,
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  FECHA_VENCE DATE,
  TIPO_FACTURA SMALLINT,
  APLICA_TIPODESC SMALLINT)
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

/* Definition for the `PROC_UPDATEPRECIOINV` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_UPDATEPRECIOINV(
  CODIGO_PROC INTEGER,
  NEWPRECIO NUMERIC(15, 2))
AS
BEGIN
  Update INVENTARIO_PRODUCTO
  Set precio_ant = precio,
  precio=:newprecio
  Where codigo=:codigo_proc;
suspend;
END^

SET TERM ; ^

/* Definition for the `PROC_UPDATEVENTAS_DET_U1` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_UPDATEVENTAS_DET_U1(
  SERIE INTEGER,
  NUMERO INTEGER,
  CODIGO_PROD VARCHAR(40) CHARACTER SET NONE,
  CODIGO_BARRA VARCHAR(20) CHARACTER SET NONE,
  DESCRIPCION VARCHAR(60) CHARACTER SET NONE,
  CANTIDAD NUMERIC(15, 2),
  PRECIO FLOAT,
  PORC_DESC_DET FLOAT,
  ITBI_DET FLOAT,
  VALOR_SERVICIO_DET NUMERIC(15, 2),
  VALOR_TOTAL_DET NUMERIC(15, 2),
  NUM_FACTURA DOUBLE PRECISION,
  STATUS_DET CHAR(1) CHARACTER SET NONE,
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  CANT_REGRESO NUMERIC(15, 2),
  CANT_PROMO NUMERIC(15, 2),
  MONTO_DIETA NUMERIC(15, 2),
  MONTO_AJUSTE NUMERIC(15, 2),
  SERIE_PROD VARCHAR(50) CHARACTER SET NONE,
  STATUS_CNT CHAR(1) CHARACTER SET NONE,
  TIPO_UNIDAD INTEGER,
  ITBIS_EXENTO SMALLINT,
  TIPO_VENTA SMALLINT,
  DESCRIPCIONPRODUCTO BLOB SUB_TYPE 1 CHARACTER SET NONE)
AS
BEGIN
  UPDATE VENTAS_DET
  SET
    NUMERO = :NUMERO,
    CODIGO_PROD = :CODIGO_PROD,
    --CODIGO_BARRA = :CODIGO_BARRA,
    DESCRIPCION = :DESCRIPCION,
    CANTIDAD = :CANTIDAD,
    PRECIO = :PRECIO,
    PORC_DESC_DET = :PORC_DESC_DET,
    ITBI_DET = :ITBI_DET,
    VALOR_SERVICIO_DET = :VALOR_SERVICIO_DET,
    VALOR_TOTAL_DET = :VALOR_TOTAL_DET,
    NUM_FACTURA = :NUM_FACTURA,
    STATUS_DET = :STATUS_DET,    
    FECHA_MOD = :FECHA_MOD,
    MOD_POR = :MOD_POR,
    --CANT_REGRESO = :CANT_REGRESO,
    --CANT_PROMO = :CANT_PROMO,
    --MONTO_DIETA = :MONTO_DIETA,
    --MONTO_AJUSTE = :MONTO_AJUSTE,
    SERIE_PROD = :SERIE_PROD,
    --STATUS_CNT = :STATUS_CNT,
    TIPO_UNIDAD = :TIPO_UNIDAD,
    ITBIS_EXENTO = :ITBIS_EXENTO,
    TIPO_VENTA = :TIPO_VENTA,
    DESCRIPCIONPRODUCTO = :DESCRIPCIONPRODUCTO
  WHERE
  (SERIE = :SERIE);
END^

SET TERM ; ^

/* Definition for the `PROC_UPDATEVENTAS_MAST_U1` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_UPDATEVENTAS_MAST_U1(
  NUMERO INTEGER,
  FECHA DATE,
  CIA_KEY INTEGER,
  CODIGO_CTE INTEGER,
  CODIGO_VENDEDOR INTEGER,
  FORMA_PAGO SMALLINT,
  OBSERVACION VARCHAR(60) CHARACTER SET NONE,
  MONEDA CHAR(1) CHARACTER SET NONE,
  VALOR_TOTAL_DET NUMERIC(15, 2),
  STATUS CHAR(1) CHARACTER SET NONE,
  FECHA_MOD DATE,
  MOD_POR VARCHAR(12) CHARACTER SET NONE,
  NUMERO_FACTURA INTEGER,
  NUMERO_DOC_PAGO VARCHAR(20) CHARACTER SET NONE,
  SERIE_NCF_ASIGNADO INTEGER,
  MONTO_BRUTO NUMERIC(15, 2),
  PORC_DESCUENTO INTEGER,
  MONTO_DESCUENTO NUMERIC(15, 2),
  MONTO_INICIAL NUMERIC(15, 2),
  NOMBRE_CLIENTE_GENERAL VARCHAR(60) CHARACTER SET NONE,
  MONTO_PAGADO NUMERIC(15, 2),
  MONTO_CAMBIO NUMERIC(15, 2),
  MONTO_TOTAL_ITBIS NUMERIC(15, 2),
  MONTODESCGASTOSADMIN NUMERIC(15, 2),
  MONTODESCITBISGASTOSADMIN NUMERIC(15, 2),
  MONTODESCTRANSP NUMERIC(15, 2),
  MONTODESCDIRTECNICA NUMERIC(15, 2),
  MONTODESCITBISDIRTECNICA NUMERIC(15, 2),
  MONTODESCIMPREVISTO NUMERIC(15, 2),
  MONTODESCITBISIMPREVISTO NUMERIC(15, 2))
AS
BEGIN
  UPDATE VENTAS_MAST
  SET
    FECHA = :FECHA,
    CIA_KEY = :CIA_KEY,
    CODIGO_CTE = :CODIGO_CTE,
    --CODIGO_VENDEDOR = :CODIGO_VENDEDOR,
    FORMA_PAGO = :FORMA_PAGO,
    OBSERVACION = :OBSERVACION,
    MONEDA = :MONEDA,
    VALOR_TOTAL_DET = :VALOR_TOTAL_DET,
    STATUS = :STATUS,

    FECHA_MOD = :FECHA_MOD,
    MOD_POR = :MOD_POR,
    NUMERO_FACTURA = :NUMERO_FACTURA,
    --NUMERO_DOC_PAGO = :NUMERO_DOC_PAGO,
    --SERIE_NCF_ASIGNADO = :SERIE_NCF_ASIGNADO,
    MONTO_BRUTO = :MONTO_BRUTO,
    PORC_DESCUENTO = :PORC_DESCUENTO,
    MONTO_DESCUENTO = :MONTO_DESCUENTO,
    MONTO_INICIAL = :MONTO_INICIAL,
    NOMBRE_CLIENTE_GENERAL = :NOMBRE_CLIENTE_GENERAL,
    MONTO_PAGADO = :MONTO_PAGADO,
    MONTO_CAMBIO = :MONTO_CAMBIO,
    MONTO_TOTAL_ITBIS = :MONTO_TOTAL_ITBIS,
    MONTODESCGASTOSADMIN = :MONTODESCGASTOSADMIN,
    MONTODESCITBISGASTOSADMIN = :MONTODESCITBISGASTOSADMIN,
    MONTODESCTRANSP = :MONTODESCTRANSP,
    MONTODESCDIRTECNICA = :MONTODESCDIRTECNICA,
    MONTODESCITBISDIRTECNICA = :MONTODESCITBISDIRTECNICA,
    MONTODESCIMPREVISTO = :MONTODESCIMPREVISTO,
    MONTODESCITBISIMPREVISTO = :MONTODESCITBISIMPREVISTO
  WHERE
  (NUMERO = :NUMERO);
END^

SET TERM ; ^

/* Definition for the `PROC_UPDATE_INV_PAN` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_UPDATE_INV_PAN(
  CODIGO_PRODUCTO INTEGER,
  NUEVACANTIDAD NUMERIC(15, 2),
  TIPO_UNIDAD INTEGER)
AS
begin
   Update inventario_producto
   Set cantidad = 0
   Where cantidad Is Null And
   Codigo =:CODIGO_producto;
   
   Update inventario_producto
   Set cantidad = cantidad + :NuevaCantidad,
   Blce_cant_entrada = Blce_cant_entrada + :nuevacantidad,
   fecha_ultima_trn = "today",
   TIPO_UNIDAD=:TIPO_UNIDAD
   Where codigo =:CODIGO_producto;
   Suspend;
end^

SET TERM ; ^

/* Definition for the `PROC_UPDATE_INV_PED` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_UPDATE_INV_PED(
  CODIGO_PRODUCTO INTEGER,
  NUEVACANTIDAD NUMERIC(15, 2),
  I_PRECIO_COMPRA NUMERIC(15, 2),
  I_PRECIO_VENTA NUMERIC(15, 2),
  FECHA_VENCIMIENTO DATE,
  PRECIO_TIPO_UNIDAD NUMERIC(15, 2),
  TIPO_UNIDAD INTEGER,
  RECALCULAR_UTILIDAD SMALLINT)
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

/* Definition for the `PROC_UPDATE_LOTE` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_UPDATE_LOTE(
  CODIGO INTEGER,
  LOTE_NUM VARCHAR(25) CHARACTER SET NONE,
  CANT_OUT INTEGER)
AS
BEGIN
  UPDATE LOTE
  SET CANT_OUT = CANT_OUT + :CANT_OUT
  WHERE CODIGO=:CODIGO
  AND LOTE_NUM=:LOTE_NUM;
Suspend;
END^

SET TERM ; ^

/* Definition for the `PROC_UPDTESECDESP_ALMCEN` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_UPDTESECDESP_ALMCEN(
  INVTIPO INTEGER,
  COD_USUARIO INTEGER)
RETURNS(
  SECUENCIA INTEGER)
AS
DECLARE VARIABLE XSEC INTEGER;
BEGIN
 XSEC = 0;
 SELECT MAX(serie) 
 FROM SEC_DESPACHO_ALMACEN
 WHERE INVENTARIO_ID=:invTipo
 INTO :XSEC;

 IF (XSEC IS NULL) THEN
 BEGIN 
   INSERT INTO SEC_DESPACHO_ALMACEN(INVENTARIO_ID, SERIE, FECHA, COD_USUARIO)
   VALUES(:INVTIPO, 0, "today", :COD_USUARIO);
   XSEC = 1;
 END ELSE XSEC = XSEC + 1;
 
 UPDATE SEC_DESPACHO_ALMACEN
 SET SERIE=:XSEC,
 COD_USUARIO=:COD_USUARIO,
 FECHA ="TODAY"
 WHERE INVENTARIO_ID =:invTipo;


 SECUENCIA =XSEC;
 SUSPEND;
END^

SET TERM ; ^

/* Definition for the `PROC_UPD_STATUS_ORDEN` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_UPD_STATUS_ORDEN(
  XNUMERO INTEGER,
  STATUSORDEN CHAR(1) CHARACTER SET NONE)
AS
begin
  UPDATE orden_comp_mast
  SET status_ord=:statusorden
  WHERE numero=:xnumero;
  SUSPEND;
end^

SET TERM ; ^

/* Definition for the `PROC_VERIFICA_SECNCF` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE PROC_VERIFICA_SECNCF(
  SEC_NCF INTEGER,
  IDNCF VARCHAR(2) CHARACTER SET NONE,
  FECHA DATE)
RETURNS(
  ES_VALIDO SMALLINT)
AS
DECLARE VARIABLE IDSERIE INTEGER;
Declare variable ncf_actual integer;
begin    
   Select c.FIN_secuencia, c.id_serie FROM CONTROL_SEC_NCF  c
   Where  c.inicio_secuecia <= :SEC_NCF And  c.fin_secuencia >=:SEC_NCF 
   AND c.status = 1 and c.IDNCF =:IDNCF
   Into :ncf_actual, :idserie;
   ES_VALIDO = 0;
   If (:ncf_actual =:SEC_NCF) then
   begin
      update control_sec_ncf C
      Set control_sec_ncf.status = 0
      Where c.id_serie =:idserie
      AND c.status = 1 And c.IDNCF =:IDNCF;       
   end
   IF (:SEC_NCF <= NCF_ACTUAL) THEN
   ES_VALIDO = 1;    
 
 /* IDSERIE = 0;
  Select ID_SERIE FROM CONTROL_SEC_NCF
  Where ((:SEC_NCF >= INICIO_SECUECIA) AND 
  (:SEC_NCF <= FIN_SECUENCIA )) AND
  (IDNCF =:IDNCF ) AND (FECHA_ASIGNACION <=:FECHA)
  INTO :IDSERIE;
  
  IF(IDSERIE=0 OR IDSERIE IS NULL) THEN
  BEGIN
    ES_VALIDO = 0;  INVALIDO-NO HAY NUMERO NCF DISPONIBLE 
  END ELSE ES_VALIDO=1;  NCF ES VALIDO  */
  SUSPEND;
end^

SET TERM ; ^

/* Definition for the `VALORMONEDA` procedure :  */

SET TERM ^ ;

CREATE PROCEDURE VALORMONEDA(
  CODIGO CHAR(2) CHARACTER SET NONE,
  FECHA_SERVICIO DATE)
RETURNS(
  SERIE INTEGER,
  VALORMONEDA FLOAT,
  SIMBOLO CHAR(6) CHARACTER SET NONE)
AS
BEGIN
FOR SELECT moneda_det.serie, moneda_det.VALOR, 
moneda.simbolo FROM MONEDA_det,moneda
WHERE CODIGO = :CODIGO
      And :FECHA_SERVICIO BETWEEN FECHA_INICIAL AND FECHA_FINAL
      And Moneda.codigo = moneda_det.codigo
INTO :serie,:VALORMONEDA, :Simbolo
DO
SUSPEND;
END^

SET TERM ; ^
