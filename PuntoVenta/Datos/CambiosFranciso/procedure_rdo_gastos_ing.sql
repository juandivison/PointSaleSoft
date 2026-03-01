SET TERM ^ ;
CREATE OR ALTER PROCEDURE RPT_GASTOS_ING (
    FECHAINI timestamp,
    FECHAFIN timestamp,
    IDMONEDA smallint )
RETURNS (
    AREA smallint,
    TRANSTIPO smallint,
    DESC_OFICINA varchar(35),
    CODIGO_CIUDDAD smallint,
    DESC_CIUDAD varchar(35),
    CAJADEID integer,
    RDOID integer,
    bovid integer,
    OFFICE_ID smallint,
    FECHA timestamp,
    AREANO varchar(6),
    AREANOMB varchar(20),
    CNT smallint,
    DEBITO numeric(15,2),
    CREDITO numeric(15,2),
    DESCRIPCION varchar(60),
    DOCUMENTO varchar(80),
    DENOMIN1 varchar(15),
    TIPO varchar(10) )
AS
BEGIN
/*
idMoneda = 1 RD
idMoneda = 2 US

*/
if (idMoneda = 1) then
begin
FOR
SELECT 
      1,
      BOVEDA.TRANSTIPO,
      OFICINA.DESCRIPCION,
      OFICINA.CODIGO_CIUDDAD,
      CIUDAD.DESCRIPCION,
      BOVEDA.BOVID, 
      null,null,
      BOVEDA.OFFICE_ID,
      BOVEDA.FECHA,
      null AREANO, 
      'GASTOS', 
      BOVEDA.CNT, 
      ABS(BOVEDA.VALOR) DEBITO,
      0 CREDITO,
      BOVEDA.DESCRIPCION,
      BOVEDA.DOCUMENTO,
      BOVEDA.DENOMIN1,
      BOVEDA.TIPO
    FROM
      OFICINA
      INNER JOIN CIUDAD ON (OFICINA.CODIGO_CIUDDAD = CIUDAD.CODIGO)
      RIGHT OUTER JOIN BOVEDA ON (OFICINA.CODIGO = BOVEDA.OFFICE_ID)
    WHERE
      (FECHA BETWEEN :FECHAINI AND :FECHAFIN) AND 
      (BOVEDA.TRANSTIPO = 4) AND (us = 1) --Pesos
    INTO
      :AREA,
      :TRANSTIPO,
      :desc_oficina,
      :CODIGO_CIUDDAD,
      :desc_ciudad,
      :bovid,      
      :CAJADEID,      
      :rdoid,
      :OFFICE_ID,
      :FECHA,
      :AREANO,
      :AREANOMB,
      :CNT,
      :DEBITO,
      :CREDITO,
      :DESCRIPCION,
      :DOCUMENTO,
      :DENOMIN1,
      :TIPO
  DO
  BEGIN
    if (debito > 0) then
    SUSPEND;
  END
  
  FOR
    SELECT 
      0,
      CAJADET.TRANSTIPO,
      OFICINA.DESCRIPCION,
      OFICINA.CODIGO_CIUDDAD,
      CIUDAD.DESCRIPCION,
      null,
      CAJADET.CAJADEID, 
      null,
       CAJADET.OFFICE_ID,
      CAJADET.FECHA,
      CAJADET.AREANO,
      'GASTOS',
      CAJADET.CNT,
      CAJADET.DEBITO,
      CAJADET.CREDITO,
      CAJADET.DESCRIPCION,
      CAJADET.DOCUMENTO,
      CAJADET.DENOMIN1,
      CAJADET.TIPO
    FROM
      OFICINA
      INNER JOIN CIUDAD ON (OFICINA.CODIGO_CIUDDAD = CIUDAD.CODIGO)
      RIGHT OUTER JOIN CAJADET ON (OFICINA.CODIGO = CAJADET.OFFICE_ID)
    WHERE
      (FECHA BETWEEN :FECHAINI AND :FECHAFIN) AND 
      (TRANSTIPO = 4) and (us=1)
    INTO
      :AREA,
      :TRANSTIPO,
      :desc_oficina,
      :CODIGO_CIUDDAD,
      :desc_ciudad,
      :bovid,      
      :CAJADEID,      
      :rdoid,
      :OFFICE_ID,
      :FECHA,
      :AREANO,
      :AREANOMB,
      :CNT,
      :DEBITO,
      :CREDITO,
      :DESCRIPCION,
      :DOCUMENTO,
      :DENOMIN1,
      :TIPO
  DO
  BEGIN
  if (debito > 0) then
    SUSPEND;
  END
  
  /*INGRESOS*/ 
  FOR  
    SELECT 
      1,
      NULL TRANSTIPO,
      OFICINA.DESCRIPCION,
      OFICINA.CODIGO_CIUDDAD,
      CIUDAD.DESCRIPCION,null,null,
      RDO.RDOID, 
      RDO.OFFICE_ID,
      RDO.FECHA,
      RDO.AREANO, 
      RDO.AREANOMB, 
      RDO.CNT, 
      0 DEBITO,
      (-cfillrd-cfillcr)+(cingresord+cmarcard+ctarjetard+ccreditrd+ccreditcr) CREDITO,
      RDO.AREANOMB DESCRIPCION,
      NULL DOCUMENTO,
      'PESOS',
      NULL TIPO
    FROM
      OFICINA
      INNER JOIN CIUDAD ON (OFICINA.CODIGO_CIUDDAD = CIUDAD.CODIGO)
      RIGHT OUTER JOIN RDO ON (OFICINA.CODIGO = RDO.OFFICE_ID)
    WHERE
      (FECHA BETWEEN :FECHAINI AND :FECHAFIN)
    INTO
      :AREA,
      :TRANSTIPO,
      :desc_oficina,
      :CODIGO_CIUDDAD,
      :desc_ciudad,
      :bovid,      
      :CAJADEID,      
      :rdoid,
      :OFFICE_ID,
      :FECHA,
      :AREANO,
      :AREANOMB,
      :CNT,
      :DEBITO,
      :CREDITO,
      :DESCRIPCION,
      :DOCUMENTO,
      :DENOMIN1,
      :TIPO
  DO
  BEGIN
    if (:CREDITO > 0) then
    SUSPEND;
  END 
end else ---US
if (idMoneda = 2) then
Begin
  --BOVEDA
  FOR
    SELECT 
       1,
      BOVEDA.TRANSTIPO,
      OFICINA.DESCRIPCION,
      OFICINA.CODIGO_CIUDDAD,
      CIUDAD.DESCRIPCION,
      BOVEDA.BOVID, 
      null,
      null,
      BOVEDA.OFFICE_ID,
      BOVEDA.FECHA,
      null AREANO, 
      'GASTOS', 
      BOVEDA.CNT, 
      ABS(BOVEDA.VALOR) DEBITO,
      0 CREDITO,
      BOVEDA.DESCRIPCION,
      BOVEDA.DOCUMENTO,
      BOVEDA.DENOMIN1,
      BOVEDA.TIPO
    FROM
      OFICINA
      INNER JOIN CIUDAD ON (OFICINA.CODIGO_CIUDDAD = CIUDAD.CODIGO)
      RIGHT OUTER JOIN BOVEDA ON (OFICINA.CODIGO = BOVEDA.OFFICE_ID)
    WHERE
      (FECHA BETWEEN :FECHAINI AND :FECHAFIN) AND 
      (TRANSTIPO = 4) AND (us = 2) --us
    INTO
      :AREA,
      :TRANSTIPO,
      :desc_oficina,
      :CODIGO_CIUDDAD,
      :desc_ciudad,
      :bovid,      
      :CAJADEID,      
      :rdoid,
      :OFFICE_ID,
      :FECHA,
      :AREANO,
      :AREANOMB,
      :CNT,
      :DEBITO,
      :CREDITO,
      :DESCRIPCION,
      :DOCUMENTO,
      :DENOMIN1,
      :TIPO
  DO
  BEGIN
    if (debito > 0) then
    SUSPEND;
  END
FOR
    SELECT 
      0,
      CAJADET.TRANSTIPO,
      OFICINA.DESCRIPCION,
      OFICINA.CODIGO_CIUDDAD,
      CIUDAD.DESCRIPCION,
      null,
      CAJADET.CAJADEID,
      null,
      CAJADET.OFFICE_ID,
      CAJADET.FECHA,
      CAJADET.AREANO,
      'GASTOS',
      CAJADET.CNT,
      CAJADET.DEBITO,
      CAJADET.CREDITO,
      CAJADET.DESCRIPCION,
      CAJADET.DOCUMENTO,
      CAJADET.DENOMIN1,
      CAJADET.TIPO
    FROM
      OFICINA
      INNER JOIN CIUDAD ON (OFICINA.CODIGO_CIUDDAD = CIUDAD.CODIGO)
      RIGHT OUTER JOIN CAJADET ON (OFICINA.CODIGO = CAJADET.OFFICE_ID)
    WHERE
      (FECHA BETWEEN :FECHAINI AND :FECHAFIN) AND 
      (TRANSTIPO = 4) AND (us = 2)
    INTO
      :AREA,
      :TRANSTIPO,
      :desc_oficina,
      :CODIGO_CIUDDAD,
      :desc_ciudad,    
      :BOVID,
      :CAJADEID,
      :rdoid,      
      :OFFICE_ID,
      :FECHA,
      :AREANO,
      :AREANOMB,
      :CNT,
      :DEBITO,
      :CREDITO,
      :DESCRIPCION,
      :DOCUMENTO,
      :DENOMIN1,
      :TIPO
  DO
  BEGIN
  if (debito > 0) then
    SUSPEND;
  END
  
  /*INGRESOS*/ 
  FOR  
    SELECT 
      1,
      NULL TRANSTIPO,
      OFICINA.DESCRIPCION,
      OFICINA.CODIGO_CIUDDAD,
      CIUDAD.DESCRIPCION,null,null,
      RDO.RDOID, 
      RDO.OFFICE_ID,
      RDO.FECHA,
      RDO.AREANO, 
      RDO.AREANOMB, 
      RDO.CNT, 
      0 DEBITO,
      (-cfillus-rdo.CFILLCRUS)+(cingresous+cmarcaus+ctarjetaus+ccreditus+ccreditcrus) CREDITO,      
      RDO.AREANOMB DESCRIPCION,
      NULL DOCUMENTO,
      'DÓLARES',
      NULL TIPO
    FROM
      OFICINA
      INNER JOIN CIUDAD ON (OFICINA.CODIGO_CIUDDAD = CIUDAD.CODIGO)
      RIGHT OUTER JOIN RDO ON (OFICINA.CODIGO = RDO.OFFICE_ID)
    WHERE
      (FECHA BETWEEN :FECHAINI AND :FECHAFIN)      
    INTO
      :AREA,
      :TRANSTIPO,
      :desc_oficina,
      :CODIGO_CIUDDAD,
      :desc_ciudad,
      :BOVID,
      :CAJADEID,
      :rdoid,
      :OFFICE_ID,
      :FECHA,
      :AREANO,
      :AREANOMB,
      :CNT,
      :DEBITO,
      :CREDITO,
      :DESCRIPCION,
      :DOCUMENTO,
      :DENOMIN1,
      :TIPO
  DO
  BEGIN
   if (:CREDITO > 0) then
    SUSPEND;
  END
end
END^
SET TERM ; ^

GRANT EXECUTE
 ON PROCEDURE RPT_GASTOS_ING TO  DIVISON;

GRANT EXECUTE
 ON PROCEDURE RPT_GASTOS_ING TO  SYSDBA;



-- TODO:
-- * add triggers and their ddl
-- * for each trigger, look for dependent generators via dependecies

