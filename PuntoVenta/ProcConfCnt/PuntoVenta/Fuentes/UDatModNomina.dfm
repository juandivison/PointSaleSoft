object dmNomina: TdmNomina
  OldCreateOrder = False
  Left = 507
  Top = 117
  Height = 316
  Width = 351
  object tblNomina: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from NOMINA'
      'where'
      '  SERIE_NOMINA = :OLD_SERIE_NOMINA')
    InsertSQL.Strings = (
      'insert into NOMINA'
      
        '  (SERIE_NOMINA, CIA_KEY, TIPO_NOMINA, CODIGO_EMP, FECHA_NOMINA,' +
        ' SALARIO_BRUTO, '
      
        '   IDSS, COOPERATIVA, MONTO_AFP, SEGURO_MEDICO, ISR, OTROS_INGRE' +
        'SOS, OTRAS_DEDUCCIONES, '
      
        '   SALARIO_NETO, FECHA_IN, CODIGO_USUARIO, STATUS_NOMINA, NUMERO' +
        '_CKS, CUOTA_PRESTAMO, '
      '   TSS, COMISION)'
      'values'
      
        '  (:SERIE_NOMINA, :CIA_KEY, :TIPO_NOMINA, :CODIGO_EMP, :FECHA_NO' +
        'MINA, :SALARIO_BRUTO, '
      
        '   :IDSS, :COOPERATIVA, :MONTO_AFP, :SEGURO_MEDICO, :ISR, :OTROS' +
        '_INGRESOS, '
      
        '   :OTRAS_DEDUCCIONES, :SALARIO_NETO, :FECHA_IN, :CODIGO_USUARIO' +
        ', :STATUS_NOMINA, '
      '   :NUMERO_CKS, :CUOTA_PRESTAMO, :TSS, :COMISION)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE_NOMINA,'
      '  CIA_KEY,'
      '  TIPO_NOMINA,'
      '  CODIGO_EMP,'
      '  FECHA_NOMINA,'
      '  SALARIO_BRUTO,'
      '  IDSS,'
      '  COOPERATIVA,'
      '  MONTO_AFP,'
      '  SEGURO_MEDICO,'
      '  ISR,'
      '  OTROS_INGRESOS,'
      '  OTRAS_DEDUCCIONES,'
      '  SALARIO_NETO,'
      '  FECHA_IN,'
      '  CODIGO_USUARIO,'
      '  STATUS_NOMINA,'
      '  NUMERO_CKS,'
      '  CUOTA_PRESTAMO,'
      '  TSS,'
      '  COMISION'
      'from NOMINA '
      'where'
      '  SERIE_NOMINA = :SERIE_NOMINA')
    SelectSQL.Strings = (
      'select * from NOMINA'
      'Where fecha_nomina =:fecha')
    ModifySQL.Strings = (
      'update NOMINA'
      'set'
      '  SERIE_NOMINA = :SERIE_NOMINA,'
      '  CIA_KEY = :CIA_KEY,'
      '  TIPO_NOMINA = :TIPO_NOMINA,'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  FECHA_NOMINA = :FECHA_NOMINA,'
      '  SALARIO_BRUTO = :SALARIO_BRUTO,'
      '  IDSS = :IDSS,'
      '  COOPERATIVA = :COOPERATIVA,'
      '  MONTO_AFP = :MONTO_AFP,'
      '  SEGURO_MEDICO = :SEGURO_MEDICO,'
      '  ISR = :ISR,'
      '  OTROS_INGRESOS = :OTROS_INGRESOS,'
      '  OTRAS_DEDUCCIONES = :OTRAS_DEDUCCIONES,'
      '  SALARIO_NETO = :SALARIO_NETO,'
      '  FECHA_IN = :FECHA_IN,'
      '  CODIGO_USUARIO = :CODIGO_USUARIO,'
      '  STATUS_NOMINA = :STATUS_NOMINA,'
      '  NUMERO_CKS = :NUMERO_CKS,'
      '  CUOTA_PRESTAMO = :CUOTA_PRESTAMO,'
      '  TSS = :TSS,'
      '  COMISION = :COMISION'
      'where'
      '  SERIE_NOMINA = :OLD_SERIE_NOMINA')
    GeneratorField.Field = 'SERIE_NOMINA'
    GeneratorField.Generator = 'GEN_SERIE_NOMINA'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 40
    Top = 24
    object tblNominaSERIE_NOMINA: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_NOMINA'
      Origin = 'NOMINA.SERIE_NOMINA'
      Required = True
    end
    object tblNominaCIA_KEY: TSmallintField
      DisplayLabel = 'Cia'
      FieldName = 'CIA_KEY'
      Origin = 'NOMINA.CIA_KEY'
    end
    object tblNominaTIPO_NOMINA: TSmallintField
      DisplayLabel = 'TipoNom'
      FieldName = 'TIPO_NOMINA'
      Origin = 'NOMINA.TIPO_NOMINA'
    end
    object tblNominaCODIGO_EMP: TIntegerField
      DisplayLabel = 'CodEmp'
      FieldName = 'CODIGO_EMP'
      Origin = 'NOMINA.CODIGO_EMP'
    end
    object tblNominaFECHA_NOMINA: TDateTimeField
      DisplayLabel = 'Fecha Nomina'
      FieldName = 'FECHA_NOMINA'
      Origin = 'NOMINA.FECHA_NOMINA'
    end
    object tblNominaSALARIO_BRUTO: TFloatField
      DisplayLabel = 'Salario Bruto'
      FieldName = 'SALARIO_BRUTO'
      Origin = 'NOMINA.SALARIO_BRUTO'
      OnChange = tblNominaSALARIO_BRUTOChange
      DisplayFormat = ',0.00'
    end
    object tblNominaCOOPERATIVA: TFloatField
      DisplayLabel = 'Cooperativa'
      FieldName = 'COOPERATIVA'
      Origin = 'NOMINA.COOPERATIVA'
      OnChange = tblNominaSALARIO_BRUTOChange
      DisplayFormat = ',0.00'
    end
    object tblNominaISR: TFloatField
      DisplayLabel = 'Isr'
      FieldName = 'ISR'
      Origin = 'NOMINA.ISR'
      OnChange = tblNominaSALARIO_BRUTOChange
      DisplayFormat = ',0.00'
    end
    object tblNominaIDSS: TFloatField
      DisplayLabel = 'Idss'
      FieldName = 'IDSS'
      Origin = 'NOMINA.IDSS'
      OnChange = tblNominaSALARIO_BRUTOChange
      DisplayFormat = ',0.00'
    end
    object tblNominaTSS: TFloatField
      DisplayLabel = 'Tss'
      FieldName = 'TSS'
      Origin = 'NOMINA.TSS'
      OnChange = tblNominaSALARIO_BRUTOChange
      DisplayFormat = ',0.00'
    end
    object tblNominaSEGURO_MEDICO: TFloatField
      DisplayLabel = 'Seguro Medico'
      FieldName = 'SEGURO_MEDICO'
      Origin = 'NOMINA.SEGURO_MEDICO'
      OnChange = tblNominaSALARIO_BRUTOChange
      DisplayFormat = ',0.00'
    end
    object tblNominaMONTO_AFP: TFloatField
      DisplayLabel = 'Monto Afp'
      FieldName = 'MONTO_AFP'
      Origin = 'NOMINA.MONTO_AFP'
      OnChange = tblNominaSALARIO_BRUTOChange
      DisplayFormat = ',0.00'
    end
    object tblNominaOTROS_INGRESOS: TFloatField
      DisplayLabel = 'Otros Ingresos'
      FieldName = 'OTROS_INGRESOS'
      Origin = 'NOMINA.OTROS_INGRESOS'
      OnChange = tblNominaSALARIO_BRUTOChange
      DisplayFormat = ',0.00'
    end
    object tblNominaOTRAS_DEDUCCIONES: TFloatField
      DisplayLabel = 'Otras Deducciones'
      FieldName = 'OTRAS_DEDUCCIONES'
      Origin = 'NOMINA.OTRAS_DEDUCCIONES'
      OnChange = tblNominaSALARIO_BRUTOChange
      DisplayFormat = ',0.00'
    end
    object tblNominaSALARIO_NETO: TFloatField
      DisplayLabel = 'Salario Neto'
      FieldName = 'SALARIO_NETO'
      Origin = 'NOMINA.SALARIO_NETO'
      DisplayFormat = ',0.00'
    end
    object tblNominaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'NOMINA.FECHA_IN'
    end
    object tblNominaCODIGO_USUARIO: TIntegerField
      DisplayLabel = 'Codigo Usuario'
      FieldName = 'CODIGO_USUARIO'
      Origin = 'NOMINA.CODIGO_USUARIO'
    end
    object tblNominaSTATUS_NOMINA: TIBStringField
      DisplayLabel = 'Status Nom'
      FieldName = 'STATUS_NOMINA'
      Origin = 'NOMINA.STATUS_NOMINA'
      FixedChar = True
      Size = 1
    end
    object tblNominaNUMERO_CKS: TIntegerField
      DisplayLabel = 'Numero Cks'
      FieldName = 'NUMERO_CKS'
      Origin = 'NOMINA.NUMERO_CKS'
    end
    object tblNominaCUOTA_PRESTAMO: TFloatField
      DisplayLabel = 'Cuota Prestamo'
      FieldName = 'CUOTA_PRESTAMO'
      Origin = 'NOMINA.CUOTA_PRESTAMO'
      OnChange = tblNominaSALARIO_BRUTOChange
      DisplayFormat = ',0.00'
    end
    object tblNominaCOMISION: TFloatField
      FieldName = 'COMISION'
      Origin = 'NOMINA.COMISION'
      OnChange = tblNominaSALARIO_BRUTOChange
    end
  end
  object qryEmpleados: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from EMPLEADO'
      'where status = '#39'A'#39)
    Left = 128
    Top = 24
    object qryEmpleadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMPLEADO.CODIGO'
      Required = True
    end
    object qryEmpleadosCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
      Origin = 'EMPLEADO.CODIGO_CIA'
      Required = True
    end
    object qryEmpleadosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object qryEmpleadosAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADO.APELLIDO'
      Size = 35
    end
    object qryEmpleadosCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'EMPLEADO.CEDULA'
      Size = 14
    end
    object qryEmpleadosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'EMPLEADO.FOTO'
      Size = 8
    end
    object qryEmpleadosPASSPORT: TIBStringField
      FieldName = 'PASSPORT'
      Origin = 'EMPLEADO.PASSPORT'
      Size = 14
    end
    object qryEmpleadosCALLE: TIBStringField
      FieldName = 'CALLE'
      Origin = 'EMPLEADO.CALLE'
      Size = 40
    end
    object qryEmpleadosNUM_CASA: TSmallintField
      FieldName = 'NUM_CASA'
      Origin = 'EMPLEADO.NUM_CASA'
    end
    object qryEmpleadosCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'EMPLEADO.CIUDAD'
      Size = 40
    end
    object qryEmpleadosPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'EMPLEADO.PAIS'
      Size = 40
    end
    object qryEmpleadosTELEF_CASA: TIBStringField
      FieldName = 'TELEF_CASA'
      Origin = 'EMPLEADO.TELEF_CASA'
      Size = 12
    end
    object qryEmpleadosTELEF_OFICINA: TIBStringField
      FieldName = 'TELEF_OFICINA'
      Origin = 'EMPLEADO.TELEF_OFICINA'
      Size = 12
    end
    object qryEmpleadosCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'EMPLEADO.CELULAR'
      Size = 12
    end
    object qryEmpleadosEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'EMPLEADO.EMAIL'
      Size = 40
    end
    object qryEmpleadosSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = 'EMPLEADO.SEXO'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadosESTADO_CIVIL: TIBStringField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'EMPLEADO.ESTADO_CIVIL'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadosTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'EMPLEADO.TELEF_REFERENCIA'
      Size = 12
    end
    object qryEmpleadosNOMBRE_REFERENCIA: TIBStringField
      FieldName = 'NOMBRE_REFERENCIA'
      Origin = 'EMPLEADO.NOMBRE_REFERENCIA'
      Size = 40
    end
    object qryEmpleadosFECHA_NAC: TDateTimeField
      FieldName = 'FECHA_NAC'
      Origin = 'EMPLEADO.FECHA_NAC'
    end
    object qryEmpleadosNACIONALIDAD: TIBStringField
      FieldName = 'NACIONALIDAD'
      Origin = 'EMPLEADO.NACIONALIDAD'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadosFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'EMPLEADO.FECHA_ENTRADA'
    end
    object qryEmpleadosFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'EMPLEADO.FECHA_SALIDA'
    end
    object qryEmpleadosSALARIO: TFloatField
      FieldName = 'SALARIO'
      Origin = 'EMPLEADO.SALARIO'
    end
    object qryEmpleadosTIPO_NOMINA: TSmallintField
      FieldName = 'TIPO_NOMINA'
      Origin = 'EMPLEADO.TIPO_NOMINA'
    end
    object qryEmpleadosTIPO_EMPLEADO: TSmallintField
      FieldName = 'TIPO_EMPLEADO'
      Origin = 'EMPLEADO.TIPO_EMPLEADO'
    end
    object qryEmpleadosDEPTO_EMP: TSmallintField
      FieldName = 'DEPTO_EMP'
      Origin = 'EMPLEADO.DEPTO_EMP'
    end
    object qryEmpleadosSECCION: TSmallintField
      FieldName = 'SECCION'
      Origin = 'EMPLEADO.SECCION'
    end
    object qryEmpleadosCARGO: TSmallintField
      FieldName = 'CARGO'
      Origin = 'EMPLEADO.CARGO'
    end
    object qryEmpleadosPAGA_AFP: TSmallintField
      FieldName = 'PAGA_AFP'
      Origin = 'EMPLEADO.PAGA_AFP'
    end
    object qryEmpleadosPAGA_TSS: TSmallintField
      FieldName = 'PAGA_TSS'
      Origin = 'EMPLEADO.PAGA_TSS'
    end
    object qryEmpleadosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'EMPLEADO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadosFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'EMPLEADO.FECHA_IN'
    end
    object qryEmpleadosIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'EMPLEADO.IN_POR'
      Size = 12
    end
    object qryEmpleadosFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'EMPLEADO.FECHA_MOD'
    end
    object qryEmpleadosMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'EMPLEADO.MOD_POR'
      Size = 12
    end
    object qryEmpleadosLICENCIA: TIBStringField
      FieldName = 'LICENCIA'
      Origin = 'EMPLEADO.LICENCIA'
      Size = 14
    end
    object qryEmpleadosFECHA_VENCE_LICENCIA: TDateTimeField
      FieldName = 'FECHA_VENCE_LICENCIA'
      Origin = 'EMPLEADO.FECHA_VENCE_LICENCIA'
    end
  end
  object dstblNomina: TDataSource
    DataSet = tblNomina
    Left = 40
    Top = 80
  end
  object dsqryEmpleados: TDataSource
    DataSet = qryEmpleados
    Left = 128
    Top = 80
  end
  object qryDeducciones: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * FROM DESCUENTO_NOMINA'
      'Where :fecha Between fecha_inicial'
      'And fecha_final')
    Left = 40
    Top = 136
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end>
    object qryDeduccionesTIPO_NOMINA: TIntegerField
      FieldName = 'TIPO_NOMINA'
      Origin = 'DESCUENTO_NOMINA.TIPO_NOMINA'
      Required = True
    end
    object qryDeduccionesCODIGO_DESCUENTO: TSmallintField
      FieldName = 'CODIGO_DESCUENTO'
      Origin = 'DESCUENTO_NOMINA.CODIGO_DESCUENTO'
      Required = True
    end
    object qryDeduccionesFECHA_INICIAL: TDateTimeField
      FieldName = 'FECHA_INICIAL'
      Origin = 'DESCUENTO_NOMINA.FECHA_INICIAL'
      Required = True
    end
    object qryDeduccionesFECHA_FINAL: TDateTimeField
      FieldName = 'FECHA_FINAL'
      Origin = 'DESCUENTO_NOMINA.FECHA_FINAL'
      Required = True
    end
    object qryDeduccionesPORCIENTO_EMP: TFloatField
      FieldName = 'PORCIENTO_EMP'
      Origin = 'DESCUENTO_NOMINA.PORCIENTO_EMP'
    end
    object qryDeduccionesPORCIENTO_EMPLEADOR: TFloatField
      FieldName = 'PORCIENTO_EMPLEADOR'
      Origin = 'DESCUENTO_NOMINA.PORCIENTO_EMPLEADOR'
    end
    object qryDeduccionesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DESCUENTO_NOMINA.DESCRIPCION'
      Size = 30
    end
    object qryDeduccionesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DESCUENTO_NOMINA.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object tblPrestamo: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PRESTAMO'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into PRESTAMO'
      
        '  (NUMERO, CODIGO_EMP, RUTA, FECHA, TIPO_PRESTAMO, CUOTAS, PORC_' +
        'INTERES, '
      
        '   MONTO_PRESTAMO, MONTO_PAGADO, FECHA_ULTIMO_PAGO, STATUS, IN_P' +
        'OR, FECHA_IN, '
      '   MOD_POR, FECHA_MOD)'
      'values'
      
        '  (:NUMERO, :CODIGO_EMP, :RUTA, :FECHA, :TIPO_PRESTAMO, :CUOTAS,' +
        ' :PORC_INTERES, '
      
        '   :MONTO_PRESTAMO, :MONTO_PAGADO, :FECHA_ULTIMO_PAGO, :STATUS, ' +
        ':IN_POR, '
      '   :FECHA_IN, :MOD_POR, :FECHA_MOD)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  CODIGO_EMP,'
      '  RUTA,'
      '  FECHA,'
      '  TIPO_PRESTAMO,'
      '  CUOTAS,'
      '  PORC_INTERES,'
      '  MONTO_PRESTAMO,'
      '  MONTO_PAGADO,'
      '  FECHA_ULTIMO_PAGO,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD'
      'from PRESTAMO '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'select * from PRESTAMO'
      'where monto_prestamo > 0 ')
    ModifySQL.Strings = (
      'update PRESTAMO'
      'set'
      '  NUMERO = :NUMERO,'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  RUTA = :RUTA,'
      '  FECHA = :FECHA,'
      '  TIPO_PRESTAMO = :TIPO_PRESTAMO,'
      '  CUOTAS = :CUOTAS,'
      '  PORC_INTERES = :PORC_INTERES,'
      '  MONTO_PRESTAMO = :MONTO_PRESTAMO,'
      '  MONTO_PAGADO = :MONTO_PAGADO,'
      '  FECHA_ULTIMO_PAGO = :FECHA_ULTIMO_PAGO,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 40
    Top = 192
    object tblPrestamoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PRESTAMO.NUMERO'
      Required = True
    end
    object tblPrestamoCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'PRESTAMO.CODIGO_EMP'
      Required = True
    end
    object tblPrestamoRUTA: TIntegerField
      FieldName = 'RUTA'
      Origin = 'PRESTAMO.RUTA'
      Required = True
    end
    object tblPrestamoFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PRESTAMO.FECHA'
    end
    object tblPrestamoTIPO_PRESTAMO: TSmallintField
      FieldName = 'TIPO_PRESTAMO'
      Origin = 'PRESTAMO.TIPO_PRESTAMO'
    end
    object tblPrestamoCUOTAS: TFloatField
      FieldName = 'CUOTAS'
      Origin = 'PRESTAMO.CUOTAS'
    end
    object tblPrestamoPORC_INTERES: TFloatField
      FieldName = 'PORC_INTERES'
      Origin = 'PRESTAMO.PORC_INTERES'
    end
    object tblPrestamoMONTO_PRESTAMO: TFloatField
      FieldName = 'MONTO_PRESTAMO'
      Origin = 'PRESTAMO.MONTO_PRESTAMO'
    end
    object tblPrestamoMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'PRESTAMO.MONTO_PAGADO'
    end
    object tblPrestamoFECHA_ULTIMO_PAGO: TDateTimeField
      FieldName = 'FECHA_ULTIMO_PAGO'
      Origin = 'PRESTAMO.FECHA_ULTIMO_PAGO'
    end
    object tblPrestamoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PRESTAMO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblPrestamoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PRESTAMO.IN_POR'
      Size = 12
    end
    object tblPrestamoFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PRESTAMO.FECHA_IN'
    end
    object tblPrestamoMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PRESTAMO.MOD_POR'
      Size = 12
    end
    object tblPrestamoFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PRESTAMO.FECHA_MOD'
    end
  end
  object qryDatosComision: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT '
      '  CODIGO_EMP,'
      '  CODIGO_RUTA,'
      '  TIPO_COMISION,'
      '  CODIGO_PROD,'
      '  MONTO_COMISION,'
      '  CANT_CAJAS_VENDIDAS,'
      '  COMISION_NETA'
      
        'FROM PROC_COMISION_A_PAGAR(:codigoIni,:codigoFin,:FechaIni, :Fec' +
        'haFin)')
    Left = 136
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoIni'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigoFin'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryDatosComisionCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'PROC_COMISION_A_PAGAR.CODIGO_EMP'
    end
    object qryDatosComisionCODIGO_RUTA: TIntegerField
      FieldName = 'CODIGO_RUTA'
      Origin = 'PROC_COMISION_A_PAGAR.CODIGO_RUTA'
    end
    object qryDatosComisionTIPO_COMISION: TIntegerField
      FieldName = 'TIPO_COMISION'
      Origin = 'PROC_COMISION_A_PAGAR.TIPO_COMISION'
    end
    object qryDatosComisionCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'PROC_COMISION_A_PAGAR.CODIGO_PROD'
      Size = 12
    end
    object qryDatosComisionMONTO_COMISION: TFloatField
      FieldName = 'MONTO_COMISION'
      Origin = 'PROC_COMISION_A_PAGAR.MONTO_COMISION'
    end
    object qryDatosComisionCANT_CAJAS_VENDIDAS: TFloatField
      FieldName = 'CANT_CAJAS_VENDIDAS'
      Origin = 'PROC_COMISION_A_PAGAR.CANT_CAJAS_VENDIDAS'
    end
    object qryDatosComisionCOMISION_NETA: TFloatField
      FieldName = 'COMISION_NETA'
      Origin = 'PROC_COMISION_A_PAGAR.COMISION_NETA'
    end
  end
  object tblControl: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      'Select '
      '  SISTEMA,'
      '  SUB_SISTEMA,'
      '  COD_CIA,'
      '  FECHA_ACT,'
      '  DESCRIPCION,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from CONTROL '
      'where'
      '  SISTEMA = :SISTEMA and'
      '  SUB_SISTEMA = :SUB_SISTEMA')
    SelectSQL.Strings = (
      'SELECT FECHA_ACT, SISTEMA, SUB_SISTEMA FROM CONTROL'
      'WHERE SISTEMA =:SISTEMA'
      'AND SUB_SISTEMA =:SUBSISTEMA')
    ModifySQL.Strings = (
      'update CONTROL'
      'set'
      '  FECHA_ACT = :FECHA_ACT,'
      '  SISTEMA = :SISTEMA,'
      '  SUB_SISTEMA = :SUB_SISTEMA'
      'where'
      '  SISTEMA = :OLD_SISTEMA and'
      '  SUB_SISTEMA = :OLD_SUB_SISTEMA')
    Left = 216
    Top = 24
    object tblControlFECHA_ACT: TDateTimeField
      FieldName = 'FECHA_ACT'
      Origin = 'CONTROL.FECHA_ACT'
      Required = True
    end
    object tblControlSISTEMA: TIntegerField
      FieldName = 'SISTEMA'
      Origin = 'CONTROL.SISTEMA'
      Required = True
    end
    object tblControlSUB_SISTEMA: TIntegerField
      FieldName = 'SUB_SISTEMA'
      Origin = 'CONTROL.SUB_SISTEMA'
      Required = True
    end
  end
  object qryRepNomina: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT NOMINA.SERIE_NOMINA,'
      '       NOMINA.CIA_KEY,'
      '       NOMINA.TIPO_NOMINA,'
      '       NOMINA.CODIGO_EMP,'
      '       NOMINA.FECHA_NOMINA,'
      '       NOMINA.SALARIO_BRUTO,'
      '       NOMINA.IDSS,'
      '       NOMINA.COOPERATIVA,'
      '       NOMINA.MONTO_AFP,'
      '       NOMINA.SEGURO_MEDICO,'
      '       NOMINA.ISR,'
      '       NOMINA.OTROS_INGRESOS,'
      '       NOMINA.OTRAS_DEDUCCIONES,'
      '       NOMINA.SALARIO_NETO,'
      '       NOMINA.FECHA_IN,'
      '       NOMINA.CODIGO_USUARIO,'
      '       NOMINA.STATUS_NOMINA,'
      '       NOMINA.NUMERO_CKS,'
      '       NOMINA.CUOTA_PRESTAMO,'
      '       NOMINA.TSS,'
      '       NOMINA.COMISION,'
      '       EMPLEADO.NOMBRE,'
      '       EMPLEADO.APELLIDO,'
      '       EMPLEADO.CEDULA'
      'FROM EMPLEADO'
      '   INNER JOIN NOMINA ON (EMPLEADO.CODIGO = NOMINA.CODIGO_EMP)'
      'WHERE '
      '( (Fecha_Nomina =:FechaNomina)'
      ')'
      'ORDER BY NOMINA.CODIGO_EMP')
    Left = 224
    Top = 80
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FechaNomina'
        ParamType = ptInput
        Value = '2006-04-15'
      end>
    object qryRepNominaSERIE_NOMINA: TIntegerField
      FieldName = 'SERIE_NOMINA'
      Origin = 'NOMINA.SERIE_NOMINA'
      Required = True
    end
    object qryRepNominaCIA_KEY: TSmallintField
      FieldName = 'CIA_KEY'
      Origin = 'NOMINA.CIA_KEY'
    end
    object qryRepNominaTIPO_NOMINA: TSmallintField
      FieldName = 'TIPO_NOMINA'
      Origin = 'NOMINA.TIPO_NOMINA'
    end
    object qryRepNominaCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'NOMINA.CODIGO_EMP'
    end
    object qryRepNominaFECHA_NOMINA: TDateTimeField
      FieldName = 'FECHA_NOMINA'
      Origin = 'NOMINA.FECHA_NOMINA'
    end
    object qryRepNominaSALARIO_BRUTO: TFloatField
      FieldName = 'SALARIO_BRUTO'
      Origin = 'NOMINA.SALARIO_BRUTO'
    end
    object qryRepNominaIDSS: TFloatField
      FieldName = 'IDSS'
      Origin = 'NOMINA.IDSS'
    end
    object qryRepNominaCOOPERATIVA: TFloatField
      FieldName = 'COOPERATIVA'
      Origin = 'NOMINA.COOPERATIVA'
    end
    object qryRepNominaMONTO_AFP: TFloatField
      FieldName = 'MONTO_AFP'
      Origin = 'NOMINA.MONTO_AFP'
    end
    object qryRepNominaSEGURO_MEDICO: TFloatField
      FieldName = 'SEGURO_MEDICO'
      Origin = 'NOMINA.SEGURO_MEDICO'
    end
    object qryRepNominaISR: TFloatField
      FieldName = 'ISR'
      Origin = 'NOMINA.ISR'
    end
    object qryRepNominaOTROS_INGRESOS: TFloatField
      FieldName = 'OTROS_INGRESOS'
      Origin = 'NOMINA.OTROS_INGRESOS'
    end
    object qryRepNominaOTRAS_DEDUCCIONES: TFloatField
      FieldName = 'OTRAS_DEDUCCIONES'
      Origin = 'NOMINA.OTRAS_DEDUCCIONES'
    end
    object qryRepNominaSALARIO_NETO: TFloatField
      FieldName = 'SALARIO_NETO'
      Origin = 'NOMINA.SALARIO_NETO'
    end
    object qryRepNominaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'NOMINA.FECHA_IN'
    end
    object qryRepNominaCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'NOMINA.CODIGO_USUARIO'
    end
    object qryRepNominaSTATUS_NOMINA: TIBStringField
      FieldName = 'STATUS_NOMINA'
      Origin = 'NOMINA.STATUS_NOMINA'
      FixedChar = True
      Size = 1
    end
    object qryRepNominaNUMERO_CKS: TIntegerField
      FieldName = 'NUMERO_CKS'
      Origin = 'NOMINA.NUMERO_CKS'
    end
    object qryRepNominaCUOTA_PRESTAMO: TFloatField
      FieldName = 'CUOTA_PRESTAMO'
      Origin = 'NOMINA.CUOTA_PRESTAMO'
    end
    object qryRepNominaTSS: TFloatField
      FieldName = 'TSS'
      Origin = 'NOMINA.TSS'
    end
    object qryRepNominaCOMISION: TFloatField
      FieldName = 'COMISION'
      Origin = 'NOMINA.COMISION'
    end
    object qryRepNominaNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object qryRepNominaAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADO.APELLIDO'
      Size = 35
    end
    object qryRepNominaCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'EMPLEADO.CEDULA'
      Size = 14
    end
  end
end
