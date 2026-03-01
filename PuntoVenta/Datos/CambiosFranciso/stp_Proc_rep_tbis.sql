SET TERM ^ ;
CREATE or alter PROCEDURE PROC_REP_TBIS (
    FECHAINI timestamp,
    FECHAFIN timestamp )
RETURNS (
    TIPODOC VARCHAR(12),
    CODIGO_CTE integer,
    ITBI_DET numeric(15,2),
    NOMBRE_CTE varchar(60),
    FECHA timestamp,
    MONEDA char(1),
    VALOR_TOTAL_DET numeric(15,2),
    NUMERO integer,
    RNC_NUMERO varchar(14),
    CEDULA char(15),
    NUMERO_NCF varchar(21),
    NumeroDoc varchar(12)
     )
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

GRANT EXECUTE
 ON PROCEDURE PROC_REP_TBIS TO  DIVISON;

GRANT EXECUTE
 ON PROCEDURE PROC_REP_TBIS TO  sysadmin;


-- TODO:
-- * add triggers and their ddl
-- * for each trigger, look for dependent generators via dependecies

