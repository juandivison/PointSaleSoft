SET TERM ^ ;
create PROCEDURE PROC_gettrncxc(numerodoc integer, ciakey integer)
RETURNS (
    SERIE double precision,
    CIA_KEY integer,
    TIPO_DOC integer,
    MONEDA char(1),
    FECHA timestamp,
    NUMERO_DOC integer,
    CODIGO_CLIENTE integer,
    CONCEPTO varchar(60),
    VALOR_DOCUMENTO numeric(15,2) )
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


GRANT EXECUTE
 ON PROCEDURE PROC_UPDATECXC_U1 TO  DIVISON;

GRANT EXECUTE
 ON PROCEDURE PROC_UPDATECXC_U1 TO  sysdba;

