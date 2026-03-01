SET TERM ^ ;
CREATE PROCEDURE PROC_INS_CUADRE_DIST_VENTA (
    COD_EMPLEADO integer,
    FECHA timestamp,
    monto_desembolso numeric(15,2),
    capital numeric(15,2),
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
    INICIAL_FINANCIAMIENTO numeric(15,2) )
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
    monto_desembolso,
    capital,
    Interes,
    Mora,
    CapitalPendiente,
    AbonoCapital,
    InteresPendiente,
    OtrosIngresos,
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
    :monto_desembolso,
    :capital,
    :Interes,
    :Mora,
    :CapitalPendiente,
    :AbonoCapital,
    :InteresPendiente,
    :OtrosIngresos,
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
    SET 
    monto_desembolso=:monto_desembolso,
    capital=:capital,
    Interes=:Interes,
    Mora=:Mora,
    CapitalPendiente=:CapitalPendiente,
    AbonoCapital=:AbonoCapital,
    InteresPendiente=:InteresPendiente,
    OtrosIngresos=:OtrosIngresos,
    MONTO_EN_CHEQUE =:MONTO_EN_CHEQUE,
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

GRANT EXECUTE
 ON PROCEDURE PROC_INS_CUADRE_DIST_VENTA TO  DIVISON;



-- TODO:
-- * add triggers and their ddl
-- * for each trigger, look for dependent generators via dependecies

