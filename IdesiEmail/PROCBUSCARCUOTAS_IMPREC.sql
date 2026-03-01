SET TERM ^ ;
CREATE PROCEDURE PROCBUSCARCUOTAS_IMPREC (
    FECHA timestamp )
RETURNS (
    CODIGO_CTE integer,
    FECHA_PAGO_CUOTA timestamp,
    DIASTRANSCURRIDO integer,
    FECHA_REAL_PAGO timestamp,
    SERIE integer,
    NUMERO integer,
    TIPO_CUOTA integer,
    NUM_CUOTA integer,
    MONTO_CAPITAL_INICIAL numeric(15,2),
    MONTO_CAPITAL_APAGAR numeric(15,2),
    MONTO_INTERES_APAGAR numeric(15,2),
    MONTO_CUOTA numeric(15,2),
    ABONO_EXT_A_CAPITAL numeric(15,2),
    MONTO_CAPITAL_ENMORA numeric(15,2),
    MONTO_PAGADO numeric(15,2),
    MONTO_APAGAR_PORMORA numeric(15,2),
    MONTO_MORA_PAGADO numeric(15,2),
    FECHA_UPDATE timestamp,
    TIPO_INTERES integer,
    NOMBRE varchar(60) CHARACTER SET NONE,
    APELLIDO varchar(60) CHARACTER SET NONE,
    NOMBRE_EMPRESA varchar(40) CHARACTER SET NONE,
    CEDULA char(15) CHARACTER SET NONE,
    TELEF_CONTACTO varchar(20) CHARACTER SET NONE,
    DIRECCION_REAL varchar(60) CHARACTER SET NONE,
    STATUS char(1) CHARACTER SET NONE,
    CANTMESATRASO integer,
    MONTO_PENDIENTE numeric(15,2),
    MONTO_PENDIENTE_INTERES numeric(15,2),
    CANT_MES_INT_PGDO integer,
    PORCIENTOINTERES numeric(15,2),
    TIPO_FRECUENCIA smallint,
    CODIGO_CIUDAD integer,
    DESCCIUDAD varchar(35) CHARACTER SET NONE )
AS
DECLARE VARIABLE CANT_MODULO INTEGER;
  DECLARE VARIABLE xCantCuotas INTEGER;
  DECLARE VARIABLE PORC_INTERES_MORA NUMERIC(15,2);
  DECLARE VARIABLE MONTO_CAP_COBRADO NUMERIC(15,2);
  DECLARE VARIABLE MONTO_IN_COBRADO NUMERIC(15,2);
  DECLARE VARIABLE Xtipo_frec_pago INTEGER;
  DECLARE VARIABLE XFRECUENCIA_DIAS INTEGER;
  DECLARE VARIABLE Xdias_resto INTEGER;
  DECLARE VARIABLE xMontoInteresPgdo NUMERIC(15,2);
  DECLARE VARIABLE xCLINTrsPORCMESATRSD smallint;
  DECLARE VARIABLE AplicaInteres smallint; --1-Anual 2-Mensual
  DECLARE VARIABLE xREDONDEAR_PERIODO smallint;
  DECLARE VARIABLE DIST_MORA_XDIA SMALLINT;
  DECLARE VARIABLE Inc_mtoItres_ClcMora  SMALLINT;
  DECLARE VARIABLE CALCMORASIMPLE SMALLINT;
  DECLARE VARIABLE xtipo_mora SMALLINT;
  
  /*DECLARE VARIABLE auxi INTEGER; */
BEGIN
  FOR
    SELECT PAGOS_PRESTAMO.CODIGO_CTE,
           PAGOS_PRESTAMO.FECHA_PAGO_CUOTA,
           PAGOS_PRESTAMO.FECHA_REAL_PAGO,
           PAGOS_PRESTAMO.SERIE,
           PAGOS_PRESTAMO.NUMERO,
           PAGOS_PRESTAMO.TIPO_CUOTA,
           PAGOS_PRESTAMO.NUM_CUOTA,
           PAGOS_PRESTAMO.MONTO_CAPITAL_INICIAL,
           PAGOS_PRESTAMO.MONTO_CAPITAL_APAGAR,
           ( PAGOS_PRESTAMO.MONTO_INTERES_APAGAR +
             PAGOS_PRESTAMO.MONTO_PENDIENTE_INTERES ),
           PAGOS_PRESTAMO.MONTO_CUOTA,
           PAGOS_PRESTAMO.ABONO_EXT_A_CAPITAL,
           PAGOS_PRESTAMO.MONTO_CAPITAL_ENMORA,
           PAGOS_PRESTAMO.MONTO_PAGADO,
           PAGOS_PRESTAMO.MONTO_MORA_PAGADO,
           PAGOS_PRESTAMO.FECHA_UPDATE,
           PAGOS_PRESTAMO.TIPO_INTERES,
           CLIENTES.NOMBRE,
           CLIENTES.APELLIDO,
           CLIENTES.NOMBRE_EMPRESA,
           CLIENTES.CEDULA,
           CLIENTES.TELEF_CONTACTO,
           CLIENTES.DIRECCION_REAL,
           PAGOS_PRESTAMO.STATUS,
           PAGOS_PRESTAMO.MONTO_PENDIENTE,
           PAGOS_PRESTAMO.MONTO_PENDIENTE_INTERES,
           PAGOS_PRESTAMO.Cant_Mes_int_pgdo           
    FROM CLIENTES
       INNER JOIN PAGOS_PRESTAMO ON (CLIENTES.CODIGO = PAGOS_PRESTAMO.CODIGO_CTE)
    Where 
    --PAGOS_PRESTAMO.FECHA_PAGO_CUOTA <=:fecha
    --And PAGOS_PRESTAMO.CODIGO_CTE =:CodigoCte AND
    PAGOS_PRESTAMO.FECHA_REAL_PAGO Is Null
    And PAGOS_PRESTAMO.STATUS = 'A'
    Order by  PAGOS_PRESTAMO.NUMERO, PAGOS_PRESTAMO.SERIE,
           PAGOS_PRESTAMO.FECHA_PAGO_CUOTA
    INTO
      :CODIGO_CTE,
      :FECHA_PAGO_CUOTA,
      :FECHA_REAL_PAGO,
      :SERIE,
      :NUMERO,
      :TIPO_CUOTA,
      :NUM_CUOTA,
      :MONTO_CAPITAL_INICIAL,
      :MONTO_CAPITAL_APAGAR,
      :MONTO_INTERES_APAGAR,
      :MONTO_CUOTA,
      :ABONO_EXT_A_CAPITAL,
      :MONTO_CAPITAL_ENMORA,
      :MONTO_PAGADO,
      :MONTO_MORA_PAGADO,
      :FECHA_UPDATE,
      :TIPO_INTERES,
      :NOMBRE,
      :APELLIDO,
      :NOMBRE_EMPRESA,
      :CEDULA,
      :TELEF_CONTACTO,
      :DIRECCION_REAL,
      :Status,
      :MONTO_PENDIENTE, 
      :MONTO_PENDIENTE_INTERES, 
      :Cant_Mes_int_pgdo
  DO
  BEGIN    
    Select r.CAL_INTERESPORCMESATRASADO, r.REDONDEAR_PERIODO, r.CALCMORASIMPLE
    From CONF_RECIBO r
    INTO
    :xCLINTrsPORCMESATRSD, :xREDONDEAR_PERIODO, :CALCMORASIMPLE;

    SELECT CANT_CUOTAS, PORC_MORA, tipo_frec_pago, 
    PORC_INTERES, APLICA_INTERES, tipo_mora, CODIGO_CIUDAD
    FROM PRESTAMO
    Where serie =:NUMERO
    into
    :xCantCuotas,
    :PORC_INTERES_MORA,
    :Xtipo_frec_pago,
    :porcientoInteres,
    :AplicaInteres,
    :xtipo_mora,
    :CODIGO_CIUDAD;
    
    DescCiudad = '';
    Select Distinct r.descripcion from CIUDAD r 
    Where r.CODIGO =:codigo_ciudad
    Into :DescCiudad;
    
    if (:DescCiudad is null or :DescCiudad = '') then
    DescCiudad = 'Ruta no asignada';
                
    TIPO_FRECUENCIA =:Xtipo_frec_pago;
    
    if (:AplicaInteres = 1) then
    porcientoInteres = porcientoInteres / 12;

    DiasTranscurrido = f_ageinDays(:fecha_pago_cuota,"today");

    Select Sum(montointeres) From COBROCUOTAHIST
    Where idprestamo =:NUMERO
    Into
    :xMontoInteresPgdo;

    if (xMontoInteresPgdo is null ) then
    xMontoInteresPgdo = 0;

    SELECT FRECUENCIA_DIAS
    FROM FREC_PAGO_LOAN
    WHERE CODIGO = :Xtipo_frec_pago
    INTO
    :XFRECUENCIA_DIAS;

    if (:XFRECUENCIA_DIAS = 1) then
    Xdias_resto = 1;

    if (:XFRECUENCIA_DIAS = 7) then
    Xdias_resto = 2;
    if (:XFRECUENCIA_DIAS = 15) then
    Xdias_resto = 2;

    if (:XFRECUENCIA_DIAS = 30) then
    Xdias_resto = 3;

    DiasTranscurrido =  DiasTranscurrido  + :XFRECUENCIA_DIAS;

    Select Distinct r.CANT_DIASCOBRARMORA,r.DIST_MORA_XDIA, r.Inc_mtoItres_ClcMora
    From CONF_RECIBO r
    into
    :Xdias_resto,
    :DIST_MORA_XDIA,
    :Inc_mtoItres_ClcMora;

    if (Xdias_resto is null) then
    Xdias_resto = 3;
    /* XFRECUENCIA_DIAS = 30; */

    IF (DiasTranscurrido < 0) THEN
    DiasTranscurrido =0;

    CANT_MODULO = 0;
    if (DiasTranscurrido > :XFRECUENCIA_DIAS) then
    CANT_MODULO = F_MODULO(DiasTranscurrido, :XFRECUENCIA_DIAS);

    if (CANT_MODULO > XDias_resto AND xCantCuotas = 1 and DiasTranscurrido > 0) then
    begin
      CantMesAtraso = (f_div(DiasTranscurrido,:XFRECUENCIA_DIAS) - f_modulo(DiasTranscurrido, :XFRECUENCIA_DIAS)/:XFRECUENCIA_DIAS) +1;
    end else
    CantMesAtraso = f_div(DiasTranscurrido,:XFRECUENCIA_DIAS);

    if ( :XFRECUENCIA_DIAS = 1) then
    begin
      CantMesAtraso = f_div(DiasTranscurrido,30);
    end

    if ((DiasTranscurrido - CantMesAtraso * :XFRECUENCIA_DIAS) > Xdias_resto or (CantMesAtraso >= 1)) then
    begin
      CantMesAtraso = CantMesAtraso + 1;
    end

    if (:XFRECUENCIA_DIAS = 1) then
    CantMesAtraso = DiasTranscurrido;

    if (xREDONDEAR_PERIODO = 0 And xCantCuotas = 1)  then
    CantMesAtraso = f_DIV(DiasTranscurrido, :XFRECUENCIA_DIAS);

    MONTO_apagar_pormora = 0;

    MONTO_CAP_COBRADO =0;
    MONTO_IN_COBRADO  =0;

    Select  sum(monto_capital),  sum(monto_interes)
    From pago_cuota
    Where pago_cuota.Serie=:SERIE
    And pago_cuota.id_prestamo=:NUMERO
    And pago_cuota.num_cuota=num_cuota
    into
    :MONTO_CAP_COBRADO,
    :MONTO_IN_COBRADO;

    if (MONTO_CAP_COBRADO is null) then
    MONTO_CAP_COBRADO = 0;
    if (MONTO_IN_COBRADO is null) then
    MONTO_IN_COBRADO = 0;

    if (MONTO_CAP_COBRADO > 0) then
    begin
      MONTO_CAPITAL_APAGAR = :MONTO_CAPITAL_APAGAR - MONTO_CAP_COBRADO;
      MONTO_CUOTA = :MONTO_CUOTA - MONTO_CAP_COBRADO;
    end

    if (MONTO_IN_COBRADO > 0) then
    begin
      MONTO_INTERES_APAGAR = :MONTO_INTERES_APAGAR - MONTO_IN_COBRADO;
      MONTO_CUOTA = :MONTO_CUOTA - MONTO_IN_COBRADO;
    end

    if (PORC_INTERES_MORA is null) then
    PORC_INTERES_MORA = 0;

	if (CALCMORASIMPLE = 0) then
	CantMesAtraso = 1;
	
	if (CantMesAtraso = 0) then
	CantMesAtraso = 1;
		
    if ((DiasTranscurrido >=Xdias_resto) or CantMesAtraso >= 1 ) then
    begin
      if (tipo_interes = 1) then
      Begin
         if (xCantCuotas = 1 and xCLINTrsPORCMESATRSD = 1) then
         MONTO_INTERES_APAGAR = MONTO_INTERES_APAGAR * CantMesAtraso;

         MONTO_apagar_pormora = (:MONTO_INTERES_APAGAR + :MONTO_CAPITAL_APAGAR) * :PORC_INTERES_MORA/100;

         if (CantMesAtraso > 1) Then
         MONTO_apagar_pormora = MONTO_apagar_pormora * CantMesAtraso; /* + :MONTO_INTERES_APAGAR * CantMesAtraso; */

    	/* nuevo para Enriquillo*/
		if (PORC_INTERES_MORA = 0) then
		MONTO_INTERES_APAGAR = :MONTO_INTERES_APAGAR * CantMesAtraso;
      End else --Interes Fijo --Agosto 29,2014 JRDivison SDQ Este
      if ((tipo_interes = 3 And DIST_MORA_XDIA = 1) or (tipo_interes = 4)) then
      begin
        --DESC_TEMPORAL = 'NIVEL 1';
        --xxxxcondicion = 'else aqui';
        if (xCantCuotas = 1 and xCLINTrsPORCMESATRSD = 1) then
        MONTO_INTERES_APAGAR = MONTO_INTERES_APAGAR * CantMesAtraso;

        --temporal = 'calculo tipo interes 3';
        if (Inc_mtoItres_ClcMora = 1) then
        Begin
          MONTO_apagar_pormora =  (:MONTO_INTERES_APAGAR + :MONTO_CAPITAL_APAGAR) * :PORC_INTERES_MORA/100;
          --DESC_TEMPORAL = 'Calculo mora if (Inc_mtoItres_ClcMora = 1) then ';
        end
        else
        MONTO_apagar_pormora =  :MONTO_CAPITAL_APAGAR * :PORC_INTERES_MORA/100;

        --if (CantMesAtraso > 1) then
        --MONTO_apagar_pormora = MONTO_apagar_pormora * CantMesAtraso;

        if (DiasTranscurrido > 0) then
        BEGIN
          --MORA_BASE  = MONTO_apagar_pormora;
          MONTO_apagar_pormora  = (MONTO_apagar_pormora / :XFRECUENCIA_DIAS) * (DiasTranscurrido-:XFRECUENCIA_DIAS);
        END
      End else
      if (tipo_interes = 4) then --metodo frances
      begin
        --NOT EN USE
        --MONTO_apagar_pormora = (:monto_capital_inicial +MONTO_INTERES_APAGAR  + :MONTO_PENDIENTE) * (Power(1 + :PORC_INTERES_MORA/100, F_MODULO(DiasTranscurrido,30)/360) - 1);

      end else
      Begin
         if (xCantCuotas = 1 and xCLINTrsPORCMESATRSD = 1) then
         MONTO_INTERES_APAGAR = MONTO_INTERES_APAGAR * CantMesAtraso;

		if (PORC_INTERES_MORA = 0 and :xCLINTrsPORCMESATRSD = 1) then
		MONTO_INTERES_APAGAR = :MONTO_INTERES_APAGAR * CantMesAtraso;

        MONTO_apagar_pormora =  (:MONTO_INTERES_APAGAR + :MONTO_CAPITAL_APAGAR) * :PORC_INTERES_MORA/100;

        if (CantMesAtraso > 1) then
        MONTO_apagar_pormora = MONTO_apagar_pormora * CantMesAtraso; /* + :MONTO_INTERES_APAGAR * CantMesAtraso; */	
	
      End
    end

    IF (DiasTranscurrido < (:XFRECUENCIA_DIAS + Xdias_resto)) then
    MONTO_apagar_pormora = 0;

   --tipo_mora = 1 aplica mora por prestamo
    --tipo_mora = 2 aplica mora por cuota
    if (xtipo_mora = 1 And  :NUM_CUOTA < xCantCuotas) then
    begin
      monto_apagar_pormora = 0;
    end
    
    if (monto_apagar_pormora > 0 and :MONTO_MORA_PAGADO > 0 ) then
    begin
      if (:MONTO_MORA_PAGADO <= monto_apagar_pormora) then
      monto_apagar_pormora = monto_apagar_pormora - :MONTO_MORA_PAGADO;
      else
      monto_apagar_pormora = monto_apagar_pormora;

      MONTO_MORA_PAGADO = 0;

    end

    MONTO_INTERES_APAGAR = MONTO_INTERES_APAGAR - :xMontoInteresPgdo;
    if (CANTMESATRASO = 1) then
    CANTMESATRASO = 0;
    else
    CANTMESATRASO = CANTMESATRASO - 1;

    SUSPEND;
  END
END^
SET TERM ; ^

GRANT EXECUTE
 ON PROCEDURE PROCBUSCARCUOTAS_IMPREC TO  DIVISON;

GRANT EXECUTE
 ON PROCEDURE PROCBUSCARCUOTAS_IMPREC TO  SYSDBA;



-- TODO:
-- * add triggers and their ddl
-- * for each trigger, look for dependent generators via dependecies

