CREATE TABLE CUADRE_DIST_VENTA
(
  COD_EMPLEADO integer NOT NULL,
  FECHA timestamp NOT NULL,
  monto_desembolso numeric(15,2),
  Capital numeric(15,2),
  Interes numeric(15,2),
  Mora numeric(15,2),
  CapitalPendiente numeric(15,2),
  AbonoCapital numeric(15,2),
  InteresPendiente numeric(15,2),
  OtrosIngresos numeric(15,2),  
  MONTO_EN_CHEQUE numeric(15,2),
  M2000 integer,
  M1000 integer,
  M500 integer,
  M200 integer,
  M100 integer,
  M50 integer,
  M25 integer,
  M20 integer,
  M10 integer,
  M5 integer,
  MONTO_MONEDAS numeric(15,2),
  MONTO_AJUSTE numeric(15,2),
  MONTO_DIETA numeric(15,2),
  MONTO_RETIRO numeric(15,2),
  COD_USUARIO integer,
  STATUS char(1),
  FECHA_IN timestamp,
  FECHA_UPDATE timestamp,
  MONTO_EN_FONDO numeric(15,2),
  INICIAL_FINANCIAMIENTO numeric(15,2),
  CONSTRAINT CUADRE_DIST_VENTAPRIMARYKEY1 PRIMARY KEY (COD_EMPLEADO,FECHA)
);

CREATE UNIQUE INDEX CUADRE_DIST_VENTAINDEX1 ON CUADRE_DIST_VENTA (COD_EMPLEADO,FECHA);
GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON CUADRE_DIST_VENTA TO  DIVISON WITH GRANT OPTION;



-- TODO:
-- * add triggers and their ddl
-- * for each trigger, look for dependent generators via dependecies

