SET TERM ^ ;
alter PROCEDURE PROC_BUSCARULTNUMSEC(ciakey integer)
RETURNS (
    SERIE_VTA integer,
    NUM_FACTURA integer )
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

GRANT EXECUTE
 ON PROCEDURE PROC_BUSCARULTNUMSEC TO  DIVISON;



-- TODO:
-- * add triggers and their ddl
-- * for each trigger, look for dependent generators via dependecies

