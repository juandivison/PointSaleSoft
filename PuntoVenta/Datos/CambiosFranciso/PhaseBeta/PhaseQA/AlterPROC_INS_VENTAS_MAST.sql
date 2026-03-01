SET TERM ^ ;
ALTER PROCEDURE PROC_INS_VENTAS_MAST (
    FECHA timestamp,
    CIA_KEY integer,
    CODIGO_CTE integer,
    CODIGO_VENDEDOR integer,
    FORMA_PAGO smallint,
    OBSERVACION varchar(60),
    MONEDA char(1),
    VALOR_TOTAL_DET numeric(15,2),
    STATUS char(1),
    FECHA_IN timestamp,
    IN_POR varchar(12),
    FECHA_MOD timestamp,
    MOD_POR varchar(12),
    NUMERO_FACTURA integer,
    NUMERO_DOC_PAGO varchar(20),
    SERIE_NCF_ASIGNADO integer,
    MONTO_BRUTO numeric(15,2),
    PORC_DESCUENTO integer,
    MONTO_DESCUENTO numeric(15,2),
    MONTO_PAGADO numeric(15,2),
    MONTO_CAMBIO numeric(15,2),
    MONTO_TOTAL_ITBIS numeric(15,2),
    MONTO_INICIAL numeric(15,2),
    NOMBRE_CLIENTE_GENERAL varchar(60),
    E_MONTODESCGASTOSADMIN numeric(15,2),
    E_MONTODESCITBISGASTOSADMIN numeric(15,2),
    E_MONTODESCTRANSP numeric(15,2),
    E_MONTODESCDIRTECNICA numeric(15,2),
    E_MONTODESCITBISDIRTECNICA numeric(15,2),
    E_MONTODESCIMPREVISTO numeric(15,2),
    E_MONTODESCITBISIMPREVISTO numeric(15,2),
    COMENTARIO varchar(80) )
RETURNS (
    NUMERO_TRNS integer )
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
    MONTODESCITBISIMPREVISTO, comentario 	
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
    :e_MONTODESCITBISIMPREVISTO,:comentario);   
   SUSPEND;
END^
SET TERM ; ^


GRANT EXECUTE
 ON PROCEDURE PROC_INS_VENTAS_MAST TO  DIVISON;

