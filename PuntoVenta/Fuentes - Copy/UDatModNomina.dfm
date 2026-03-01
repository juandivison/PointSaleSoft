object dmNomina: TdmNomina
  OldCreateOrder = False
  Left = 501
  Top = 143
  Height = 521
  Width = 794
  object tblNomina: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    OnCalcFields = tblNominaCalcFields
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
      '   TSS, COMISION, SFS_DEPENDIENTES, SFS_COMPLEMENTARIO)'
      'values'
      
        '  (:SERIE_NOMINA, :CIA_KEY, :TIPO_NOMINA, :CODIGO_EMP, :FECHA_NO' +
        'MINA, :SALARIO_BRUTO, '
      
        '   :IDSS, :COOPERATIVA, :MONTO_AFP, :SEGURO_MEDICO, :ISR, :OTROS' +
        '_INGRESOS, '
      
        '   :OTRAS_DEDUCCIONES, :SALARIO_NETO, :FECHA_IN, :CODIGO_USUARIO' +
        ', :STATUS_NOMINA, '
      
        '   :NUMERO_CKS, :CUOTA_PRESTAMO, :TSS, :COMISION, :SFS_DEPENDIEN' +
        'TES, :SFS_COMPLEMENTARIO)')
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
      '  COMISION,'
      '  SFS_DEPENDIENTES,'
      '  SFS_COMPLEMENTARIO'
      'from NOMINA '
      'where'
      '  SERIE_NOMINA = :SERIE_NOMINA')
    SelectSQL.Strings = (
      'Select * '
      'FROM NOMINA Nomina'
      'Where Cia_Key =:Cia_Key'
      'And Tipo_Nomina =:Tipo_Nom'
      'And Fecha_Nomina =:Fecha_Nom'
      'Order By Codigo_emp')
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
      '  COMISION = :COMISION,'
      '  SFS_DEPENDIENTES = :SFS_DEPENDIENTES,'
      '  SFS_COMPLEMENTARIO = :SFS_COMPLEMENTARIO'
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
    object tblNominaSFS_DEPENDIENTES: TFloatField
      FieldName = 'SFS_DEPENDIENTES'
      Origin = 'NOMINA.SFS_DEPENDIENTES'
    end
    object tblNominaSFS_COMPLEMENTARIO: TFloatField
      FieldName = 'SFS_COMPLEMENTARIO'
      Origin = 'NOMINA.SFS_COMPLEMENTARIO'
    end
    object tblNominaDiasTrab: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'DiasTrab'
      Calculated = True
    end
  end
  object qryEmpleados: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select r.*, r.nombre ||'#39' '#39'||r.apellido as nombrecompleto '
      'From EMPLEADO r'
      'where r.status = '#39'A'#39)
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
    object qryEmpleadosNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Size = 71
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
      '       EMPLEADO.CEDULA,'
      '       NOMINA.SFS_DEPENDIENTES,'
      'NOMINA.SFS_COMPLEMENTARIO'
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
    object qryRepNominaSFS_DEPENDIENTES: TFloatField
      FieldName = 'SFS_DEPENDIENTES'
      Origin = 'NOMINA.SFS_DEPENDIENTES'
    end
    object qryRepNominaSFS_COMPLEMENTARIO: TFloatField
      FieldName = 'SFS_COMPLEMENTARIO'
      Origin = 'NOMINA.SFS_COMPLEMENTARIO'
    end
  end
  object qryTipoNomina: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  * From TIPO_NOMINA')
    Left = 216
    Top = 136
    object qryTipoNominaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TIPO_NOMINA.CODIGO'
      Required = True
    end
    object qryTipoNominaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_NOMINA.DESCRIPCION'
      Size = 30
    end
    object qryTipoNominaOBSERVACIONES: TIBStringField
      FieldName = 'OBSERVACIONES'
      Origin = 'TIPO_NOMINA.OBSERVACIONES'
      Size = 30
    end
    object qryTipoNominaSTATUS_TIPO_NOMINA: TIBStringField
      FieldName = 'STATUS_TIPO_NOMINA'
      Origin = 'TIPO_NOMINA.STATUS_TIPO_NOMINA'
      FixedChar = True
      Size = 1
    end
  end
  object dsqryTipoNomina: TDataSource
    DataSet = qryTipoNomina
    Left = 224
    Top = 200
  end
  object DtTipoEmp: TDataSource
    DataSet = QryTipoEmp
    Left = 561
    Top = 50
  end
  object QryTipoEmp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CODIGO_TIPO_EMP, DESCRIPCION, OBSERVACIONES, STATUS_TIPO_' +
        'EMP'
      'FROM TIPO_EMPLEADO Tipo_empleado')
    Left = 561
    Top = 6
    object QryTipoEmpCODIGO_TIPO_EMP: TSmallintField
      FieldName = 'CODIGO_TIPO_EMP'
      Origin = 'TIPO_EMPLEADO.CODIGO_TIPO_EMP'
    end
    object QryTipoEmpDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_EMPLEADO.DESCRIPCION'
      Size = 12
    end
    object QryTipoEmpOBSERVACIONES: TIBStringField
      FieldName = 'OBSERVACIONES'
      Origin = 'TIPO_EMPLEADO.OBSERVACIONES'
      Size = 30
    end
    object QryTipoEmpSTATUS_TIPO_EMP: TIBStringField
      FieldName = 'STATUS_TIPO_EMP'
      Origin = 'TIPO_EMPLEADO.STATUS_TIPO_EMP'
      FixedChar = True
      Size = 1
    end
  end
  object QryDepto: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CODIGO, NOMBRE, STATUS, FECHA_IN, IN_POR, FECHA_MOD, MOD_' +
        'POR'
      'FROM DEPTOS Deptos')
    Left = 561
    Top = 95
    object QryDeptoCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'DEPTOS.CODIGO'
      Required = True
    end
    object QryDeptoNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'DEPTOS.NOMBRE'
      Size = 40
    end
    object QryDeptoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DEPTOS.STATUS'
      FixedChar = True
      Size = 1
    end
    object QryDeptoFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DEPTOS.FECHA_IN'
    end
    object QryDeptoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DEPTOS.IN_POR'
      Size = 12
    end
    object QryDeptoFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DEPTOS.FECHA_MOD'
    end
    object QryDeptoMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DEPTOS.MOD_POR'
      Size = 12
    end
  end
  object DtDepto: TDataSource
    DataSet = QryDepto
    Left = 561
    Top = 137
  end
  object QryTipoNom: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *'
      'FROM TIPO_NOMINA Tipo_nom')
    Left = 562
    Top = 184
    object QryTipoNomCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TIPO_NOMINA.CODIGO'
      Required = True
    end
    object QryTipoNomDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_NOMINA.DESCRIPCION'
      Size = 30
    end
    object QryTipoNomOBSERVACIONES: TIBStringField
      FieldName = 'OBSERVACIONES'
      Origin = 'TIPO_NOMINA.OBSERVACIONES'
      Size = 30
    end
    object QryTipoNomSTATUS_TIPO_NOMINA: TIBStringField
      FieldName = 'STATUS_TIPO_NOMINA'
      Origin = 'TIPO_NOMINA.STATUS_TIPO_NOMINA'
      FixedChar = True
      Size = 1
    end
  end
  object DtTipoNom: TDataSource
    AutoEdit = False
    DataSet = QryTipoNom
    Left = 562
    Top = 231
  end
  object tCargosEmp: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CARGO_EMPLEADOS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into CARGO_EMPLEADOS'
      '  (CODIGO, NOMBRE, STATUS, IN_POR, FECHA_IN, MOD_POR, FECHA_MOD)'
      'values'
      
        '  (:CODIGO, :NOMBRE, :STATUS, :IN_POR, :FECHA_IN, :MOD_POR, :FEC' +
        'HA_MOD)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  NOMBRE,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD'
      'from CARGO_EMPLEADOS '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'Select * from CARGO_EMPLEADOS')
    ModifySQL.Strings = (
      'update CARGO_EMPLEADOS'
      'set'
      '  CODIGO = :CODIGO,'
      '  NOMBRE = :NOMBRE,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 312
    Top = 24
    object tCargosEmpCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object tCargosEmpNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 40
    end
    object tCargosEmpSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object tCargosEmpIN_POR: TStringField
      FieldName = 'IN_POR'
      Size = 12
    end
    object tCargosEmpFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
    end
    object tCargosEmpMOD_POR: TStringField
      FieldName = 'MOD_POR'
      Size = 12
    end
    object tCargosEmpFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
    end
  end
  object dtCargosEmp: TDataSource
    DataSet = tCargosEmp
    Left = 312
    Top = 80
  end
  object dtDeptoSeccion: TDataSource
    DataSet = tDeptoSeccion
    Left = 394
    Top = 80
  end
  object tDeptoSeccion: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DEPTO_SECCION'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into DEPTO_SECCION'
      '  (CODIGO, NOMBRE, STATUS, IN_POR, FECHA_IN, MOD_POR, FECHA_MOD)'
      'values'
      
        '  (:CODIGO, :NOMBRE, :STATUS, :IN_POR, :FECHA_IN, :MOD_POR, :FEC' +
        'HA_MOD)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  NOMBRE,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD'
      'from DEPTO_SECCION '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'Select * from DEPTO_SECCION')
    ModifySQL.Strings = (
      'update DEPTO_SECCION'
      'set'
      '  CODIGO = :CODIGO,'
      '  NOMBRE = :NOMBRE,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 387
    Top = 24
    object tDeptoSeccionCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'DEPTO_SECCION.CODIGO'
      Required = True
    end
    object tDeptoSeccionNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'DEPTO_SECCION.NOMBRE'
      Size = 40
    end
    object tDeptoSeccionSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DEPTO_SECCION.STATUS'
      FixedChar = True
      Size = 1
    end
    object tDeptoSeccionIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DEPTO_SECCION.IN_POR'
      Size = 12
    end
    object tDeptoSeccionFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DEPTO_SECCION.FECHA_IN'
    end
    object tDeptoSeccionMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DEPTO_SECCION.MOD_POR'
      Size = 12
    end
    object tDeptoSeccionFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DEPTO_SECCION.FECHA_MOD'
    end
  end
  object tDeptosEmp: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DEPTOS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into DEPTOS'
      '  (CODIGO, NOMBRE, STATUS, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR)'
      'values'
      
        '  (:CODIGO, :NOMBRE, :STATUS, :FECHA_IN, :IN_POR, :FECHA_MOD, :M' +
        'OD_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  NOMBRE,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from DEPTOS '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'Select * from DEPTOS')
    ModifySQL.Strings = (
      'update DEPTOS'
      'set'
      '  CODIGO = :CODIGO,'
      '  NOMBRE = :NOMBRE,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 216
    Top = 256
    object tDeptosEmpCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'DEPTOS.CODIGO'
      Required = True
    end
    object tDeptosEmpNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'DEPTOS.NOMBRE'
      Size = 40
    end
    object tDeptosEmpSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DEPTOS.STATUS'
      FixedChar = True
      Size = 1
    end
    object tDeptosEmpFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DEPTOS.FECHA_IN'
    end
    object tDeptosEmpIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DEPTOS.IN_POR'
      Size = 12
    end
    object tDeptosEmpFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DEPTOS.FECHA_MOD'
    end
    object tDeptosEmpMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DEPTOS.MOD_POR'
      Size = 12
    end
  end
  object dtTipoPax: TDataSource
    DataSet = tTipoPax
    Left = 440
    Top = 208
  end
  object tTipoPax: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TIPO_PAX'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TIPO_PAX'
      '  (CODIGO, DESCRIPCION, DESC_ABR)'
      'values'
      '  (:CODIGO, :DESCRIPCION, :DESC_ABR)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  DESCRIPCION,'
      '  DESC_ABR,'
      '  CODIGOOLD,'
      '  DESCRIPCIONOLD'
      'from TIPO_PAX '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'Select * from TIPO_PAX')
    ModifySQL.Strings = (
      'update TIPO_PAX'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  DESC_ABR = :DESC_ABR'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 464
    Top = 136
    object tTipoPaxCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TIPO_PAX.CODIGO'
      Required = True
    end
    object tTipoPaxDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_PAX.DESCRIPCION'
    end
    object tTipoPaxDESC_ABR: TIBStringField
      FieldName = 'DESC_ABR'
      Origin = 'TIPO_PAX.DESC_ABR'
      FixedChar = True
      Size = 6
    end
    object tTipoPaxCODIGOOLD: TIntegerField
      FieldName = 'CODIGOOLD'
      Origin = 'TIPO_PAX.CODIGOOLD'
      Required = True
    end
    object tTipoPaxDESCRIPCIONOLD: TIBStringField
      FieldName = 'DESCRIPCIONOLD'
      Origin = 'TIPO_PAX.DESCRIPCIONOLD'
    end
  end
  object tDepartamentos: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DEPARTAMENTOS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into DEPARTAMENTOS'
      
        '  (CODIGO, NOMBRE, STATUS, IN_POR, FECHA_IN, MOD_POR, FECHA_MOD,' +
        ' COD_CTA1, '
      '   COD_ORDEN, COD_DEPTO_NOM)'
      'values'
      
        '  (:CODIGO, :NOMBRE, :STATUS, :IN_POR, :FECHA_IN, :MOD_POR, :FEC' +
        'HA_MOD, '
      '   :COD_CTA1, :COD_ORDEN, :COD_DEPTO_NOM)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  NOMBRE,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD,'
      '  COD_CTA1,'
      '  COD_ORDEN,'
      '  COD_DEPTO_NOM'
      'from DEPARTAMENTOS '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'Select * from DEPARTAMENTOS')
    ModifySQL.Strings = (
      'update DEPARTAMENTOS'
      'set'
      '  CODIGO = :CODIGO,'
      '  NOMBRE = :NOMBRE,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  COD_CTA1 = :COD_CTA1,'
      '  COD_ORDEN = :COD_ORDEN,'
      '  COD_DEPTO_NOM = :COD_DEPTO_NOM'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 40
    Top = 248
    object tDepartamentosCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 12
    end
    object tDepartamentosNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 40
    end
    object tDepartamentosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object tDepartamentosIN_POR: TStringField
      FieldName = 'IN_POR'
      Size = 12
    end
    object tDepartamentosFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
    end
    object tDepartamentosMOD_POR: TStringField
      FieldName = 'MOD_POR'
      Size = 12
    end
    object tDepartamentosFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
    end
    object tDepartamentosJCodigo: TStringField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'JCodigo'
      Calculated = True
    end
  end
  object dtDepartamentos: TDataSource
    DataSet = tDepartamentos
    Left = 40
    Top = 296
  end
  object tblDependienteNomDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DESCUENTO_DEPENDIENTE_D'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  CODIGO_EMP = :OLD_CODIGO_EMP')
    InsertSQL.Strings = (
      'insert into DESCUENTO_DEPENDIENTE_D'
      
        '  (SERIE, CODIGO_EMP, TIPO_PLAN, CEDULA, NSS, NOMBRE_DEPENDIENTE' +
        ', OBSERVACION, '
      
        '   MONTO, STATUS, COD_USUARIO, FECHA_IN, IN_POR, FECHA_MOD, MOD_' +
        'POR, MONTO_COMPLEMENTARIO)'
      'values'
      
        '  (:SERIE, :CODIGO_EMP, :TIPO_PLAN, :CEDULA, :NSS, :NOMBRE_DEPEN' +
        'DIENTE, '
      
        '   :OBSERVACION, :MONTO, :STATUS, :COD_USUARIO, :FECHA_IN, :IN_P' +
        'OR, :FECHA_MOD, '
      '   :MOD_POR, :MONTO_COMPLEMENTARIO)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  CODIGO_EMP,'
      '  TIPO_PLAN,'
      '  CEDULA,'
      '  NSS,'
      '  NOMBRE_DEPENDIENTE,'
      '  OBSERVACION,'
      '  MONTO,'
      '  STATUS,'
      '  COD_USUARIO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  MONTO_COMPLEMENTARIO'
      'from DESCUENTO_DEPENDIENTE_D '
      'where'
      '  SERIE = :SERIE and'
      '  CODIGO_EMP = :CODIGO_EMP')
    SelectSQL.Strings = (
      'Select * From DESCUENTO_DEPENDIENTE_D'
      'Where codigo_emp=:codigoemp')
    ModifySQL.Strings = (
      'update DESCUENTO_DEPENDIENTE_D'
      'set'
      '  SERIE = :SERIE,'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  TIPO_PLAN = :TIPO_PLAN,'
      '  CEDULA = :CEDULA,'
      '  NSS = :NSS,'
      '  NOMBRE_DEPENDIENTE = :NOMBRE_DEPENDIENTE,'
      '  OBSERVACION = :OBSERVACION,'
      '  MONTO = :MONTO,'
      '  STATUS = :STATUS,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  MONTO_COMPLEMENTARIO = :MONTO_COMPLEMENTARIO'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  CODIGO_EMP = :OLD_CODIGO_EMP')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'Gen_serie_dep_Nomdet'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 288
    Top = 296
    object tblDependienteNomDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DESCUENTO_DEPENDIENTE_D.SERIE'
      Required = True
    end
    object tblDependienteNomDetCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'DESCUENTO_DEPENDIENTE_D.CODIGO_EMP'
      Required = True
    end
    object tblDependienteNomDetTIPO_PLAN: TSmallintField
      FieldName = 'TIPO_PLAN'
      Origin = 'DESCUENTO_DEPENDIENTE_D.TIPO_PLAN'
      Required = True
    end
    object tblDependienteNomDetCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'DESCUENTO_DEPENDIENTE_D.CEDULA'
      FixedChar = True
      Size = 15
    end
    object tblDependienteNomDetNSS: TIBStringField
      FieldName = 'NSS'
      Origin = 'DESCUENTO_DEPENDIENTE_D.NSS'
    end
    object tblDependienteNomDetNOMBRE_DEPENDIENTE: TIBStringField
      FieldName = 'NOMBRE_DEPENDIENTE'
      Origin = 'DESCUENTO_DEPENDIENTE_D.NOMBRE_DEPENDIENTE'
      Size = 80
    end
    object tblDependienteNomDetMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'DESCUENTO_DEPENDIENTE_D.MONTO'
    end
    object tblDependienteNomDetOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'DESCUENTO_DEPENDIENTE_D.OBSERVACION'
      Size = 60
    end
    object tblDependienteNomDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DESCUENTO_DEPENDIENTE_D.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblDependienteNomDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'DESCUENTO_DEPENDIENTE_D.COD_USUARIO'
    end
    object tblDependienteNomDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DESCUENTO_DEPENDIENTE_D.FECHA_IN'
    end
    object tblDependienteNomDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DESCUENTO_DEPENDIENTE_D.IN_POR'
      Size = 12
    end
    object tblDependienteNomDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DESCUENTO_DEPENDIENTE_D.FECHA_MOD'
    end
    object tblDependienteNomDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DESCUENTO_DEPENDIENTE_D.MOD_POR'
      Size = 12
    end
    object tblDependienteNomDetMONTO_COMPLEMENTARIO: TFloatField
      FieldName = 'MONTO_COMPLEMENTARIO'
      Origin = 'DESCUENTO_DEPENDIENTE_D.MONTO_COMPLEMENTARIO'
    end
  end
  object tblDependienteNomMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblDependienteNomMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DESCUENTO_DEPENDIENTE_M'
      'where'
      '  CODIGO_EMP = :OLD_CODIGO_EMP and'
      '  TIPO_DESCUENTO = :OLD_TIPO_DESCUENTO and'
      '  FECHA_INI = :OLD_FECHA_INI and'
      '  FECHA_FIN = :OLD_FECHA_FIN')
    InsertSQL.Strings = (
      'insert into DESCUENTO_DEPENDIENTE_M'
      
        '  (CODIGO_EMP, TIPO_DESCUENTO, FECHA_INI, FECHA_FIN, OBSERVACION' +
        ', STATUS, '
      
        '   COD_USUARIO, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, MONTO_COMP' +
        'LENTARIO)'
      'values'
      
        '  (:CODIGO_EMP, :TIPO_DESCUENTO, :FECHA_INI, :FECHA_FIN, :OBSERV' +
        'ACION, '
      
        '   :STATUS, :COD_USUARIO, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_P' +
        'OR, :MONTO_COMPLENTARIO)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_EMP,'
      '  TIPO_DESCUENTO,'
      '  FECHA_INI,'
      '  FECHA_FIN,'
      '  OBSERVACION,'
      '  STATUS,'
      '  COD_USUARIO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  MONTO_COMPLENTARIO'
      'from DESCUENTO_DEPENDIENTE_M '
      'where'
      '  CODIGO_EMP = :CODIGO_EMP and'
      '  TIPO_DESCUENTO = :TIPO_DESCUENTO and'
      '  FECHA_INI = :FECHA_INI and'
      '  FECHA_FIN = :FECHA_FIN')
    SelectSQL.Strings = (
      'Select * From DESCUENTO_DEPENDIENTE_M'
      '')
    ModifySQL.Strings = (
      'update DESCUENTO_DEPENDIENTE_M'
      'set'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  TIPO_DESCUENTO = :TIPO_DESCUENTO,'
      '  FECHA_INI = :FECHA_INI,'
      '  FECHA_FIN = :FECHA_FIN,'
      '  OBSERVACION = :OBSERVACION,'
      '  STATUS = :STATUS,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  MONTO_COMPLENTARIO = :MONTO_COMPLENTARIO'
      'where'
      '  CODIGO_EMP = :OLD_CODIGO_EMP and'
      '  TIPO_DESCUENTO = :OLD_TIPO_DESCUENTO and'
      '  FECHA_INI = :OLD_FECHA_INI and'
      '  FECHA_FIN = :OLD_FECHA_FIN')
    Left = 424
    Top = 280
    object tblDependienteNomMasterCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'DESCUENTO_DEPENDIENTE_M.CODIGO_EMP'
      Required = True
    end
    object tblDependienteNomMasterTIPO_DESCUENTO: TIntegerField
      FieldName = 'TIPO_DESCUENTO'
      Origin = 'DESCUENTO_DEPENDIENTE_M.TIPO_DESCUENTO'
      Required = True
    end
    object tblDependienteNomMasterFECHA_INI: TDateTimeField
      FieldName = 'FECHA_INI'
      Origin = 'DESCUENTO_DEPENDIENTE_M.FECHA_INI'
      Required = True
    end
    object tblDependienteNomMasterFECHA_FIN: TDateTimeField
      FieldName = 'FECHA_FIN'
      Origin = 'DESCUENTO_DEPENDIENTE_M.FECHA_FIN'
      Required = True
    end
    object tblDependienteNomMasterOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = 'DESCUENTO_DEPENDIENTE_M.OBSERVACION'
      BlobType = ftMemo
      Size = 8
    end
    object tblDependienteNomMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DESCUENTO_DEPENDIENTE_M.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblDependienteNomMasterCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'DESCUENTO_DEPENDIENTE_M.COD_USUARIO'
    end
    object tblDependienteNomMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DESCUENTO_DEPENDIENTE_M.FECHA_IN'
    end
    object tblDependienteNomMasterIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DESCUENTO_DEPENDIENTE_M.IN_POR'
      Size = 12
    end
    object tblDependienteNomMasterFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DESCUENTO_DEPENDIENTE_M.FECHA_MOD'
    end
    object tblDependienteNomMasterMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DESCUENTO_DEPENDIENTE_M.MOD_POR'
      Size = 12
    end
    object tblDependienteNomMasterMONTO_COMPLENTARIO: TFloatField
      FieldName = 'MONTO_COMPLENTARIO'
      Origin = 'DESCUENTO_DEPENDIENTE_M.MONTO_COMPLENTARIO'
    end
  end
  object tblTipoPlanSFS: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_PLAN_SFS'
    Left = 552
    Top = 288
    object tblTipoPlanSFSCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tblTipoPlanSFSDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
    end
  end
  object qryListaDependienteEmp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select m.CODIGO_EMP, m.TIPO_DESCUENTO,'
      
        'd.monto monto_dependiente, d.MONTO_COMPLEMENTARIO  monto_complem' +
        'entarioasegurado, m.MONTO_COMPLENTARIO monto_complementarioDepen' +
        'diente, d.tipo_plan'
      'From DESCUENTO_DEPENDIENTE_M m,'
      'DESCUENTO_DEPENDIENTE_D d'
      'Where '
      ':fecha Between m.fecha_ini and m.fecha_fin'
      'And m.codigo_emp=:codigoemp'
      'And d.codigo_emp = m.codigo_emp'
      'And m.status = '#39'A'#39
      'And d.status ='#39'A'#39)
    Left = 432
    Top = 336
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigoemp'
        ParamType = ptInput
      end>
    object qryListaDependienteEmpCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'DESCUENTO_DEPENDIENTE_M.CODIGO_EMP'
      Required = True
    end
    object qryListaDependienteEmpTIPO_DESCUENTO: TIntegerField
      FieldName = 'TIPO_DESCUENTO'
      Origin = 'DESCUENTO_DEPENDIENTE_M.TIPO_DESCUENTO'
      Required = True
    end
    object qryListaDependienteEmpMONTO_DEPENDIENTE: TFloatField
      FieldName = 'MONTO_DEPENDIENTE'
      Origin = 'DESCUENTO_DEPENDIENTE_D.MONTO'
    end
    object qryListaDependienteEmpMONTO_COMPLEMENTARIOASEGURADO: TFloatField
      FieldName = 'MONTO_COMPLEMENTARIOASEGURADO'
      Origin = 'DESCUENTO_DEPENDIENTE_D.MONTO_COMPLEMENTARIO'
    end
    object qryListaDependienteEmpMONTO_COMPLEMENTARIODEPENDIENTE: TFloatField
      FieldName = 'MONTO_COMPLEMENTARIODEPENDIENTE'
      Origin = 'DESCUENTO_DEPENDIENTE_M.MONTO_COMPLENTARIO'
    end
    object qryListaDependienteEmpTIPO_PLAN: TSmallintField
      FieldName = 'TIPO_PLAN'
      Origin = 'DESCUENTO_DEPENDIENTE_D.TIPO_PLAN'
      Required = True
    end
  end
  object ibstpAplicaISR: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_ACT_NOMINA_ISR'
    Left = 336
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'TIPOESCALA'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'XISR'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'XDCODIGO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'XDSALARIO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'XDDIAS_VACACIONES'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'XDESCALA_RETENCION'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'XDTASA_EXENTO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'XDEXCEDENTE'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'VCIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'VTIPO_NOMINA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'VFECHA_NOMINA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESCALA_RETENCION1'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESCALA_RETENCION2'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESCALA_RETENCION3'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VPORC_AFP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VPORC_SALUD'
        ParamType = ptInput
      end>
  end
  object qryEscalaISR: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'with RetISR as ('
      '  Select * FROM RETENCION_ISR'
      'Where  :Fecha between fecha_ini And fecha_fin'
      ')'
      'Select '
      'a.escala_retencion r1, --,a.tasa_exento, a.excedente,'
      'b.escala_retencion r2, --,b.tasa_exento, b.excedente,'
      'c.escala_retencion r3--,c.tasa_exento, c.excedente'
      'from RDB$DATABASE'
      'join RetISR a on a.codigo_escala = 1'
      'join RetISR b on b.codigo_escala = 2'
      'join RetISR c on c.codigo_escala = 3'
      '')
    Left = 336
    Top = 152
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Fecha'
        ParamType = ptInput
      end>
    object qryEscalaISRR1: TFloatField
      FieldName = 'R1'
    end
    object qryEscalaISRR2: TFloatField
      FieldName = 'R2'
    end
    object qryEscalaISRR3: TFloatField
      FieldName = 'R3'
    end
  end
  object QryVaca: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from VACACIONES'
      'where'
      '  CODIGO_TRANS = :OLD_CODIGO_TRANS')
    InsertSQL.Strings = (
      'insert into VACACIONES'
      
        '  (CODIGO_TRANS, CODIGO_TIPO_TRANS, CODIGO_TIPO_NOMINA, CODIGO, ' +
        'VALOR_TRANS, '
      
        '   FECHA_ENT, FECHA_SAL, OBSERVACIONES, STATUS_TRANS, TIPO_CTA, ' +
        'CANT_DIAS, '
      '   FECHA_EFECTIVA)'
      'values'
      
        '  (:CODIGO_TRANS, :CODIGO_TIPO_TRANS, :CODIGO_TIPO_NOMINA, :CODI' +
        'GO, :VALOR_TRANS, '
      
        '   :FECHA_ENT, :FECHA_SAL, :OBSERVACIONES, :STATUS_TRANS, :TIPO_' +
        'CTA, :CANT_DIAS, '
      '   :FECHA_EFECTIVA)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_TRANS,'
      '  CODIGO_TIPO_TRANS,'
      '  CODIGO_TIPO_NOMINA,'
      '  CODIGO,'
      '  VALOR_TRANS,'
      '  FECHA_ENT,'
      '  FECHA_SAL,'
      '  OBSERVACIONES,'
      '  STATUS_TRANS,'
      '  TIPO_CTA,'
      '  CANT_DIAS,'
      '  FECHA_EFECTIVA'
      'from VACACIONES '
      'where'
      '  CODIGO_TRANS = :CODIGO_TRANS')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VACACIONES Vacaciones'
      'Where Fecha_Ent >=:Fecha_ini '
      'and Fecha_Sal <=:Fecha_Fin'
      'Order By Codigo')
    ModifySQL.Strings = (
      'update VACACIONES'
      'set'
      '  CODIGO_TRANS = :CODIGO_TRANS,'
      '  CODIGO_TIPO_TRANS = :CODIGO_TIPO_TRANS,'
      '  CODIGO_TIPO_NOMINA = :CODIGO_TIPO_NOMINA,'
      '  CODIGO = :CODIGO,'
      '  VALOR_TRANS = :VALOR_TRANS,'
      '  FECHA_ENT = :FECHA_ENT,'
      '  FECHA_SAL = :FECHA_SAL,'
      '  OBSERVACIONES = :OBSERVACIONES,'
      '  STATUS_TRANS = :STATUS_TRANS,'
      '  TIPO_CTA = :TIPO_CTA,'
      '  CANT_DIAS = :CANT_DIAS,'
      '  FECHA_EFECTIVA = :FECHA_EFECTIVA'
      'where'
      '  CODIGO_TRANS = :OLD_CODIGO_TRANS')
    Left = 296
    Top = 344
    object QryVacaCODIGO_TRANS: TIntegerField
      FieldName = 'CODIGO_TRANS'
      Origin = 'VACACIONES.CODIGO_TRANS'
      Required = True
    end
    object QryVacaCODIGO_TIPO_TRANS: TSmallintField
      FieldName = 'CODIGO_TIPO_TRANS'
      Origin = 'VACACIONES.CODIGO_TIPO_TRANS'
    end
    object QryVacaCODIGO_TIPO_NOMINA: TSmallintField
      FieldName = 'CODIGO_TIPO_NOMINA'
      Origin = 'VACACIONES.CODIGO_TIPO_NOMINA'
    end
    object QryVacaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'VACACIONES.CODIGO'
    end
    object QryVacaVALOR_TRANS: TFloatField
      FieldName = 'VALOR_TRANS'
      Origin = 'VACACIONES.VALOR_TRANS'
    end
    object QryVacaFECHA_ENT: TDateTimeField
      FieldName = 'FECHA_ENT'
      Origin = 'VACACIONES.FECHA_ENT'
    end
    object QryVacaFECHA_SAL: TDateTimeField
      FieldName = 'FECHA_SAL'
      Origin = 'VACACIONES.FECHA_SAL'
    end
    object QryVacaOBSERVACIONES: TIBStringField
      FieldName = 'OBSERVACIONES'
      Origin = 'VACACIONES.OBSERVACIONES'
      Size = 40
    end
    object QryVacaSTATUS_TRANS: TIBStringField
      FieldName = 'STATUS_TRANS'
      Origin = 'VACACIONES.STATUS_TRANS'
      FixedChar = True
      Size = 1
    end
    object QryVacaTIPO_CTA: TSmallintField
      FieldName = 'TIPO_CTA'
      Origin = 'VACACIONES.TIPO_CTA'
    end
    object QryVacaCANT_DIAS: TIntegerField
      FieldName = 'CANT_DIAS'
      Origin = 'VACACIONES.CANT_DIAS'
    end
    object QryVacaFECHA_EFECTIVA: TDateTimeField
      FieldName = 'FECHA_EFECTIVA'
      Origin = 'VACACIONES.FECHA_EFECTIVA'
    end
  end
  object StpVacaciones: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_ACT_VACACIONES'
    Left = 176
    Top = 312
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'VTRANSACCION'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'VCIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'VFECHA_INI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'VFECHA_FIN'
        ParamType = ptInput
      end>
  end
  object QryRepNomGral: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = QryRepNomGralCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT '
      'Nomina.SERIE_NOMINA, '
      'Nomina.CIA_KEY, '
      'Nomina.TIPO_NOMINA, '
      'Nomina.CODIGO_EMP, '
      'Nomina.FECHA_NOMINA, '
      'Nomina.SALARIO_BRUTO, '
      'Nomina.IDSS, '
      'Nomina.COOPERATIVA, '
      'Nomina.MONTO_AFP,'
      '0 BMI, '
      'Nomina.ISR, '
      'Coalesce(Nomina.OTROS_INGRESOS,0)+ '
      'Coalesce(Nomina.COMISION,0) OTROS_INGRESOS,'
      'Nomina.OTRAS_DEDUCCIONES, '
      'Nomina.SALARIO_NETO, '
      'NULL FECHA_ENT, '
      'Nomina.STATUS_NOMINA, '
      'Nomina.CUOTA_PRESTAMO PREST_OFIC, '
      'Empleado.NOMBRE, '
      'Empleado.APELLIDO, '
      'Deptos.Nombre nombre_emp_dep, '
      'Nomina.NUMERO_CKS, '
      'Departamentos.CODIGO,'
      'Departamentos.COD_ORDEN,'
      'Empleado.DEPTO_EMP,  '
      'Empleado.SECCION SECCION_EMP,  '
      'Empleado.CARGO CARGO_EMP'
      ', SFS_COMPLEMENTARIO, SFS_DEPENDIENTES, TSS'
      'FROM Empleado Empleado'
      
        '   INNER JOIN NOMINA Nomina   ON  (Nomina.CODIGO_EMP = Empleado.' +
        'CODIGO)  '
      
        '   left outer JOIN DEPTOS Deptos    ON  (Empleado.DEPTO_EMP = De' +
        'ptos.CODIGO)  '
      
        '   LEFT OUTER JOIN DEPARTAMENTOS Departamentos ON  (Empleado.dep' +
        'to_emp = Departamentos.COD_DEPTO_NOM)  '
      'Where Cia_Key =:Cia_Key'
      'And Tipo_Nomina =:Tipo_Nom'
      'And Fecha_Nomina =:Fecha_Nom'
      'Order By '
      '  Empleado.DEPTO_EMP,  '
      '  Empleado.SECCION,  '
      '  Empleado.CARGO')
    Left = 168
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Cia_Key'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tipo_Nom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fecha_Nom'
        ParamType = ptUnknown
      end>
    object QryRepNomGralSERIE_NOMINA: TIntegerField
      FieldName = 'SERIE_NOMINA'
      Origin = 'NOMINA.SERIE_NOMINA'
      Required = True
    end
    object QryRepNomGralCIA_KEY: TSmallintField
      FieldName = 'CIA_KEY'
      Origin = 'NOMINA.CIA_KEY'
    end
    object QryRepNomGralTIPO_NOMINA: TSmallintField
      FieldName = 'TIPO_NOMINA'
      Origin = 'NOMINA.TIPO_NOMINA'
    end
    object QryRepNomGralCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'NOMINA.CODIGO_EMP'
    end
    object QryRepNomGralFECHA_NOMINA: TDateTimeField
      FieldName = 'FECHA_NOMINA'
      Origin = 'NOMINA.FECHA_NOMINA'
    end
    object QryRepNomGralSALARIO_BRUTO: TFloatField
      FieldName = 'SALARIO_BRUTO'
      Origin = 'NOMINA.SALARIO_BRUTO'
    end
    object QryRepNomGralIDSS: TFloatField
      FieldName = 'IDSS'
      Origin = 'NOMINA.IDSS'
    end
    object QryRepNomGralCOOPERATIVA: TFloatField
      FieldName = 'COOPERATIVA'
      Origin = 'NOMINA.COOPERATIVA'
    end
    object QryRepNomGralMONTO_AFP: TFloatField
      FieldName = 'MONTO_AFP'
      Origin = 'NOMINA.MONTO_AFP'
    end
    object QryRepNomGralBMI: TIntegerField
      FieldName = 'BMI'
      Required = True
    end
    object QryRepNomGralISR: TFloatField
      FieldName = 'ISR'
      Origin = 'NOMINA.ISR'
    end
    object QryRepNomGralOTROS_INGRESOS: TFloatField
      FieldName = 'OTROS_INGRESOS'
      Origin = 'NOMINA.OTROS_INGRESOS'
    end
    object QryRepNomGralOTRAS_DEDUCCIONES: TFloatField
      FieldName = 'OTRAS_DEDUCCIONES'
      Origin = 'NOMINA.OTRAS_DEDUCCIONES'
    end
    object QryRepNomGralDEPTO_EMP_DESC: TStringField
      FieldKind = fkLookup
      FieldName = 'DEPTO_EMP_DESC'
      LookupDataSet = QryDepto
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOMBRE'
      KeyFields = 'DEPTO_EMP'
      Lookup = True
    end
    object QryRepNomGralSECCION_EMP_DESC: TStringField
      FieldKind = fkLookup
      FieldName = 'SECCION_EMP_DESC'
      LookupDataSet = tDeptoSeccion
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOMBRE'
      KeyFields = 'SECCION_EMP'
      Lookup = True
    end
    object QryRepNomGralCARGO_EMP_DESC: TStringField
      FieldKind = fkLookup
      FieldName = 'CARGO_EMP_DESC'
      LookupDataSet = tCargosEmp
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOMBRE'
      KeyFields = 'CARGO_EMP'
      Lookup = True
    end
    object QryRepNomGralSALARIO_NETO: TFloatField
      FieldName = 'SALARIO_NETO'
      Origin = 'NOMINA.SALARIO_NETO'
    end
    object QryRepNomGralFECHA_ENT: TIBStringField
      FieldName = 'FECHA_ENT'
      FixedChar = True
      Size = 1
    end
    object QryRepNomGralSTATUS_NOMINA: TIBStringField
      FieldName = 'STATUS_NOMINA'
      Origin = 'NOMINA.STATUS_NOMINA'
      FixedChar = True
      Size = 1
    end
    object QryRepNomGralPREST_OFIC: TFloatField
      FieldName = 'PREST_OFIC'
      Origin = 'NOMINA.CUOTA_PRESTAMO'
    end
    object QryRepNomGralNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object QryRepNomGralAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADO.APELLIDO'
      Size = 35
    end
    object QryRepNomGralNUMERO_CKS: TIntegerField
      FieldName = 'NUMERO_CKS'
      Origin = 'NOMINA.NUMERO_CKS'
    end
    object QryRepNomGralCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'DEPARTAMENTOS.CODIGO'
      Size = 12
    end
    object QryRepNomGralCOD_ORDEN: TIntegerField
      FieldName = 'COD_ORDEN'
      Origin = 'DEPARTAMENTOS.COD_ORDEN'
    end
    object QryRepNomGralDEPTO_EMP: TSmallintField
      FieldName = 'DEPTO_EMP'
      Origin = 'EMPLEADO.DEPTO_EMP'
    end
    object QryRepNomGralSECCION_EMP: TSmallintField
      FieldName = 'SECCION_EMP'
      Origin = 'EMPLEADO.SECCION'
    end
    object QryRepNomGralCARGO_EMP: TSmallintField
      FieldName = 'CARGO_EMP'
      Origin = 'EMPLEADO.CARGO'
    end
    object QryRepNomGralTotal_Deduc: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Total_Deduc'
      Calculated = True
    end
    object QryRepNomGralTotal_Ing: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Total_Ing'
      Calculated = True
    end
    object QryRepNomGralSFS_COMPLEMENTARIO: TFloatField
      FieldName = 'SFS_COMPLEMENTARIO'
      Origin = 'NOMINA.SFS_COMPLEMENTARIO'
    end
    object QryRepNomGralSFS_DEPENDIENTES: TFloatField
      FieldName = 'SFS_DEPENDIENTES'
      Origin = 'NOMINA.SFS_DEPENDIENTES'
    end
    object QryRepNomGralTSS: TFloatField
      FieldName = 'TSS'
      Origin = 'NOMINA.TSS'
    end
    object QryRepNomGralNOMBRE_EMP_DEP: TIBStringField
      FieldName = 'NOMBRE_EMP_DEP'
      Origin = 'DEPTOS.NOMBRE'
      Size = 40
    end
  end
  object StpStatus: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_ACT_NOMINA_STATUS'
    Left = 464
    Top = 64
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'VTIPO_NOMINA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'VCIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'VFECHA_NOMINA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VSTATUS'
        ParamType = ptInput
      end>
  end
  object ibstpProcActNomTotales: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_ACT_NOMINA_TOTALES'
    Left = 304
    Top = 392
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'VTIPO_NOMINA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'VCIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'VFECHA_NOMINA'
        ParamType = ptInput
      end>
  end
  object tblNominaContratista: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from NOMINA_CONTRATISTA'
      'where'
      '  CIA_KEY = :OLD_CIA_KEY and'
      '  CODIGO_EMP = :OLD_CODIGO_EMP and'
      '  CODIGO_PROY = :OLD_CODIGO_PROY and'
      '  FECHA_NOMINA = :OLD_FECHA_NOMINA')
    InsertSQL.Strings = (
      'insert into NOMINA_CONTRATISTA'
      
        '  (CIA_KEY, CODIGO_EMP, CODIGO_PROY, FECHA_NOMINA, CANT_DIAS, PR' +
        'ECIO_XDIA, '
      
        '   SALARIO_BRUTO, COOPERATIVA, MONTO_AFP, ISR, CUOTA_PRESTAMO, T' +
        'SS, SFS_DEPENDIENTES, '
      
        '   SFS_COMPLEMENTARIO, OTROS_INGRESOS, OTRAS_DEDUCCIONES, SALARI' +
        'O_NETO, '
      
        '   CODIGO_USUARIO, STATUS, NUMERO_CKS, FECHA_IN, IN_POR, FECHA_M' +
        'OD, MOD_POR, '
      '   MONTO_RETENCIONDGII)'
      'values'
      
        '  (:CIA_KEY, :CODIGO_EMP, :CODIGO_PROY, :FECHA_NOMINA, :CANT_DIA' +
        'S, :PRECIO_XDIA, '
      
        '   :SALARIO_BRUTO, :COOPERATIVA, :MONTO_AFP, :ISR, :CUOTA_PRESTA' +
        'MO, :TSS, '
      
        '   :SFS_DEPENDIENTES, :SFS_COMPLEMENTARIO, :OTROS_INGRESOS, :OTR' +
        'AS_DEDUCCIONES, '
      
        '   :SALARIO_NETO, :CODIGO_USUARIO, :STATUS, :NUMERO_CKS, :FECHA_' +
        'IN, :IN_POR, '
      '   :FECHA_MOD, :MOD_POR, :MONTO_RETENCIONDGII)')
    RefreshSQL.Strings = (
      'Select '
      '  CIA_KEY,'
      '  CODIGO_EMP,'
      '  CODIGO_PROY,'
      '  FECHA_NOMINA,'
      '  CANT_DIAS,'
      '  PRECIO_XDIA,'
      '  SALARIO_BRUTO,'
      '  COOPERATIVA,'
      '  MONTO_AFP,'
      '  ISR,'
      '  CUOTA_PRESTAMO,'
      '  TSS,'
      '  SFS_DEPENDIENTES,'
      '  SFS_COMPLEMENTARIO,'
      '  OTROS_INGRESOS,'
      '  OTRAS_DEDUCCIONES,'
      '  SALARIO_NETO,'
      '  CODIGO_USUARIO,'
      '  STATUS,'
      '  NUMERO_CKS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  MONTO_RETENCIONDGII'
      'from NOMINA_CONTRATISTA '
      'where'
      '  CIA_KEY = :CIA_KEY and'
      '  CODIGO_EMP = :CODIGO_EMP and'
      '  CODIGO_PROY = :CODIGO_PROY and'
      '  FECHA_NOMINA = :FECHA_NOMINA')
    SelectSQL.Strings = (
      'Select * From NOMINA_CONTRATISTA'
      'Where fecha_nomina =:fecha')
    ModifySQL.Strings = (
      'update NOMINA_CONTRATISTA'
      'set'
      '  CIA_KEY = :CIA_KEY,'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  CODIGO_PROY = :CODIGO_PROY,'
      '  FECHA_NOMINA = :FECHA_NOMINA,'
      '  CANT_DIAS = :CANT_DIAS,'
      '  PRECIO_XDIA = :PRECIO_XDIA,'
      '  SALARIO_BRUTO = :SALARIO_BRUTO,'
      '  COOPERATIVA = :COOPERATIVA,'
      '  MONTO_AFP = :MONTO_AFP,'
      '  ISR = :ISR,'
      '  CUOTA_PRESTAMO = :CUOTA_PRESTAMO,'
      '  TSS = :TSS,'
      '  SFS_DEPENDIENTES = :SFS_DEPENDIENTES,'
      '  SFS_COMPLEMENTARIO = :SFS_COMPLEMENTARIO,'
      '  OTROS_INGRESOS = :OTROS_INGRESOS,'
      '  OTRAS_DEDUCCIONES = :OTRAS_DEDUCCIONES,'
      '  SALARIO_NETO = :SALARIO_NETO,'
      '  CODIGO_USUARIO = :CODIGO_USUARIO,'
      '  STATUS = :STATUS,'
      '  NUMERO_CKS = :NUMERO_CKS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  MONTO_RETENCIONDGII = :MONTO_RETENCIONDGII'
      'where'
      '  CIA_KEY = :OLD_CIA_KEY and'
      '  CODIGO_EMP = :OLD_CODIGO_EMP and'
      '  CODIGO_PROY = :OLD_CODIGO_PROY and'
      '  FECHA_NOMINA = :OLD_FECHA_NOMINA')
    Left = 560
    Top = 352
    object tblNominaContratistaCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'NOMINA_CONTRATISTA.CIA_KEY'
      Required = True
    end
    object tblNominaContratistaCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'NOMINA_CONTRATISTA.CODIGO_EMP'
      Required = True
    end
    object tblNominaContratistaCODIGO_PROY: TIntegerField
      FieldName = 'CODIGO_PROY'
      Origin = 'NOMINA_CONTRATISTA.CODIGO_PROY'
      Required = True
    end
    object tblNominaContratistaFECHA_NOMINA: TDateTimeField
      FieldName = 'FECHA_NOMINA'
      Origin = 'NOMINA_CONTRATISTA.FECHA_NOMINA'
      Required = True
    end
    object tblNominaContratistaCANT_DIAS: TFloatField
      FieldName = 'CANT_DIAS'
      Origin = 'NOMINA_CONTRATISTA.CANT_DIAS'
    end
    object tblNominaContratistaPRECIO_XDIA: TFloatField
      FieldName = 'PRECIO_XDIA'
      Origin = 'NOMINA_CONTRATISTA.PRECIO_XDIA'
      DisplayFormat = ',0.00'
    end
    object tblNominaContratistaSALARIO_BRUTO: TFloatField
      FieldName = 'SALARIO_BRUTO'
      Origin = 'NOMINA_CONTRATISTA.SALARIO_BRUTO'
      DisplayFormat = ',0.00'
    end
    object tblNominaContratistaCOOPERATIVA: TFloatField
      FieldName = 'COOPERATIVA'
      Origin = 'NOMINA_CONTRATISTA.COOPERATIVA'
      DisplayFormat = ',0.00'
    end
    object tblNominaContratistaMONTO_AFP: TFloatField
      FieldName = 'MONTO_AFP'
      Origin = 'NOMINA_CONTRATISTA.MONTO_AFP'
      DisplayFormat = ',0.00'
    end
    object tblNominaContratistaISR: TFloatField
      FieldName = 'ISR'
      Origin = 'NOMINA_CONTRATISTA.ISR'
      DisplayFormat = ',0.00'
    end
    object tblNominaContratistaCUOTA_PRESTAMO: TFloatField
      FieldName = 'CUOTA_PRESTAMO'
      Origin = 'NOMINA_CONTRATISTA.CUOTA_PRESTAMO'
      DisplayFormat = ',0.00'
    end
    object tblNominaContratistaTSS: TFloatField
      FieldName = 'TSS'
      Origin = 'NOMINA_CONTRATISTA.TSS'
      DisplayFormat = ',0.00'
    end
    object tblNominaContratistaSFS_DEPENDIENTES: TFloatField
      FieldName = 'SFS_DEPENDIENTES'
      Origin = 'NOMINA_CONTRATISTA.SFS_DEPENDIENTES'
      DisplayFormat = ',0.00'
    end
    object tblNominaContratistaSFS_COMPLEMENTARIO: TFloatField
      FieldName = 'SFS_COMPLEMENTARIO'
      Origin = 'NOMINA_CONTRATISTA.SFS_COMPLEMENTARIO'
      DisplayFormat = ',0.00'
    end
    object tblNominaContratistaOTROS_INGRESOS: TFloatField
      FieldName = 'OTROS_INGRESOS'
      Origin = 'NOMINA_CONTRATISTA.OTROS_INGRESOS'
      DisplayFormat = ',0.00'
    end
    object tblNominaContratistaOTRAS_DEDUCCIONES: TFloatField
      FieldName = 'OTRAS_DEDUCCIONES'
      Origin = 'NOMINA_CONTRATISTA.OTRAS_DEDUCCIONES'
      DisplayFormat = ',0.00'
    end
    object tblNominaContratistaMONTO_RETENCIONDGII: TFloatField
      FieldName = 'MONTO_RETENCIONDGII'
      Origin = 'NOMINA_CONTRATISTA.MONTO_RETENCIONDGII'
      DisplayFormat = ',0.00'
    end
    object tblNominaContratistaSALARIO_NETO: TFloatField
      FieldName = 'SALARIO_NETO'
      Origin = 'NOMINA_CONTRATISTA.SALARIO_NETO'
      DisplayFormat = ',0.00'
    end
    object tblNominaContratistaCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'NOMINA_CONTRATISTA.CODIGO_USUARIO'
    end
    object tblNominaContratistaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'NOMINA_CONTRATISTA.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblNominaContratistaNUMERO_CKS: TIntegerField
      FieldName = 'NUMERO_CKS'
      Origin = 'NOMINA_CONTRATISTA.NUMERO_CKS'
    end
    object tblNominaContratistaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'NOMINA_CONTRATISTA.FECHA_IN'
    end
    object tblNominaContratistaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'NOMINA_CONTRATISTA.IN_POR'
      Size = 12
    end
    object tblNominaContratistaFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'NOMINA_CONTRATISTA.FECHA_MOD'
    end
    object tblNominaContratistaMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'NOMINA_CONTRATISTA.MOD_POR'
      Size = 12
    end
  end
  object dstblNominaContratista: TDataSource
    AutoEdit = False
    DataSet = tblNominaContratista
    Left = 560
    Top = 400
  end
  object tblProyectos: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PROYECTOS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into PROYECTOS'
      
        '  (CODIGO, FECHA_INICIAL, FECHA_FINAL, NOMBRE_PROYECTO, OBSERVAC' +
        'ION, STATUS, '
      '   IN_POR, FECHA_IN, FECHA_MOD, MODI_POR, PORC_RETENCION)'
      'values'
      
        '  (:CODIGO, :FECHA_INICIAL, :FECHA_FINAL, :NOMBRE_PROYECTO, :OBS' +
        'ERVACION, '
      
        '   :STATUS, :IN_POR, :FECHA_IN, :FECHA_MOD, :MODI_POR, :PORC_RET' +
        'ENCION)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  FECHA_INICIAL,'
      '  FECHA_FINAL,'
      '  NOMBRE_PROYECTO,'
      '  OBSERVACION,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  FECHA_MOD,'
      '  MODI_POR,'
      '  PORC_RETENCION'
      'from PROYECTOS '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'Select * From PROYECTOS')
    ModifySQL.Strings = (
      'update PROYECTOS'
      'set'
      '  CODIGO = :CODIGO,'
      '  FECHA_INICIAL = :FECHA_INICIAL,'
      '  FECHA_FINAL = :FECHA_FINAL,'
      '  NOMBRE_PROYECTO = :NOMBRE_PROYECTO,'
      '  OBSERVACION = :OBSERVACION,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MODI_POR = :MODI_POR,'
      '  PORC_RETENCION = :PORC_RETENCION'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 640
    Top = 24
    object tblProyectosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'PROYECTOS.CODIGO'
      Required = True
    end
    object tblProyectosFECHA_INICIAL: TDateTimeField
      FieldName = 'FECHA_INICIAL'
      Origin = 'PROYECTOS.FECHA_INICIAL'
    end
    object tblProyectosFECHA_FINAL: TDateTimeField
      FieldName = 'FECHA_FINAL'
      Origin = 'PROYECTOS.FECHA_FINAL'
    end
    object tblProyectosNOMBRE_PROYECTO: TIBStringField
      FieldName = 'NOMBRE_PROYECTO'
      Origin = 'PROYECTOS.NOMBRE_PROYECTO'
      Size = 60
    end
    object tblProyectosOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = 'PROYECTOS.OBSERVACION'
      BlobType = ftMemo
      Size = 8
    end
    object tblProyectosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROYECTOS.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblProyectosIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PROYECTOS.IN_POR'
      Size = 12
    end
    object tblProyectosFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PROYECTOS.FECHA_IN'
    end
    object tblProyectosFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PROYECTOS.FECHA_MOD'
    end
    object tblProyectosMODI_POR: TIBStringField
      FieldName = 'MODI_POR'
      Origin = 'PROYECTOS.MODI_POR'
      Size = 12
    end
    object tblProyectosPORC_RETENCION: TFloatField
      FieldName = 'PORC_RETENCION'
      Origin = 'PROYECTOS.PORC_RETENCION'
      DisplayFormat = ',0.00'
    end
  end
  object dstblProyectos: TDataSource
    DataSet = tblProyectos
    Left = 640
    Top = 96
  end
  object qryProyectos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  * From PROYECTOS'
      'Where Status = '#39'A'#39)
    Left = 640
    Top = 152
    object qryProyectosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'PROYECTOS.CODIGO'
      Required = True
    end
    object qryProyectosFECHA_INICIAL: TDateTimeField
      FieldName = 'FECHA_INICIAL'
      Origin = 'PROYECTOS.FECHA_INICIAL'
    end
    object qryProyectosFECHA_FINAL: TDateTimeField
      FieldName = 'FECHA_FINAL'
      Origin = 'PROYECTOS.FECHA_FINAL'
    end
    object qryProyectosNOMBRE_PROYECTO: TIBStringField
      FieldName = 'NOMBRE_PROYECTO'
      Origin = 'PROYECTOS.NOMBRE_PROYECTO'
      Size = 60
    end
    object qryProyectosOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = 'PROYECTOS.OBSERVACION'
      BlobType = ftMemo
      Size = 8
    end
    object qryProyectosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROYECTOS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryProyectosIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PROYECTOS.IN_POR'
      Size = 12
    end
    object qryProyectosFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PROYECTOS.FECHA_IN'
    end
    object qryProyectosFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PROYECTOS.FECHA_MOD'
    end
    object qryProyectosMODI_POR: TIBStringField
      FieldName = 'MODI_POR'
      Origin = 'PROYECTOS.MODI_POR'
      Size = 12
    end
    object qryProyectosPORC_RETENCION: TFloatField
      FieldName = 'PORC_RETENCION'
      Origin = 'PROYECTOS.PORC_RETENCION'
      DisplayFormat = ',0.00'
    end
  end
  object dsqryProyectos: TDataSource
    DataSet = qryProyectos
    Left = 640
    Top = 208
  end
  object tblContratistas: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CONTRATISTAS'
      'where'
      '  CIA_KEY = :OLD_CIA_KEY and'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into CONTRATISTAS'
      
        '  (CIA_KEY, CODIGO, IDPROYECTO, NOMBRE, APELLIDO, CEDULA, LICENC' +
        'IA, FECHA_VENCE_LICENCIA, '
      
        '   FOTO, PASSPORT, FECHA_VENCE_PASSPORT, CALLE, NUM_CASA, CIUDAD' +
        ', PAIS, '
      
        '   TELEF_CASA, CELULAR, EMAIL, SEXO, ESTADO_CIVIL, TELEF_CONYUGU' +
        'E, NOMBRE_CONYUGUE, '
      
        '   FECHA_NAC, NACIONALIDAD, FECHA_ENTRADA, FECHA_SALIDA, SALARIO' +
        '_XDIA, '
      
        '   TIPO_NOMINA, TIPO_EMPLEADO, CARGO, PAGA_AFP, PAGA_TSS, PAGA_R' +
        'ETENCION, '
      '   STATUS, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR)'
      'values'
      
        '  (:CIA_KEY, :CODIGO, :IDPROYECTO, :NOMBRE, :APELLIDO, :CEDULA, ' +
        ':LICENCIA, '
      
        '   :FECHA_VENCE_LICENCIA, :FOTO, :PASSPORT, :FECHA_VENCE_PASSPOR' +
        'T, :CALLE, '
      
        '   :NUM_CASA, :CIUDAD, :PAIS, :TELEF_CASA, :CELULAR, :EMAIL, :SE' +
        'XO, :ESTADO_CIVIL, '
      
        '   :TELEF_CONYUGUE, :NOMBRE_CONYUGUE, :FECHA_NAC, :NACIONALIDAD,' +
        ' :FECHA_ENTRADA, '
      
        '   :FECHA_SALIDA, :SALARIO_XDIA, :TIPO_NOMINA, :TIPO_EMPLEADO, :' +
        'CARGO, '
      
        '   :PAGA_AFP, :PAGA_TSS, :PAGA_RETENCION, :STATUS, :FECHA_IN, :I' +
        'N_POR, '
      '   :FECHA_MOD, :MOD_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  CIA_KEY,'
      '  CODIGO,'
      '  IDPROYECTO,'
      '  NOMBRE,'
      '  APELLIDO,'
      '  CEDULA,'
      '  LICENCIA,'
      '  FECHA_VENCE_LICENCIA,'
      '  FOTO,'
      '  PASSPORT,'
      '  FECHA_VENCE_PASSPORT,'
      '  CALLE,'
      '  NUM_CASA,'
      '  CIUDAD,'
      '  PAIS,'
      '  TELEF_CASA,'
      '  CELULAR,'
      '  EMAIL,'
      '  SEXO,'
      '  ESTADO_CIVIL,'
      '  TELEF_CONYUGUE,'
      '  NOMBRE_CONYUGUE,'
      '  FECHA_NAC,'
      '  NACIONALIDAD,'
      '  FECHA_ENTRADA,'
      '  FECHA_SALIDA,'
      '  SALARIO_XDIA,'
      '  TIPO_NOMINA,'
      '  TIPO_EMPLEADO,'
      '  CARGO,'
      '  PAGA_AFP,'
      '  PAGA_TSS,'
      '  PAGA_RETENCION,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from CONTRATISTAS '
      'where'
      '  CIA_KEY = :CIA_KEY and'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'Select *  From CONTRATISTAS')
    ModifySQL.Strings = (
      'update CONTRATISTAS'
      'set'
      '  CIA_KEY = :CIA_KEY,'
      '  CODIGO = :CODIGO,'
      '  IDPROYECTO = :IDPROYECTO,'
      '  NOMBRE = :NOMBRE,'
      '  APELLIDO = :APELLIDO,'
      '  CEDULA = :CEDULA,'
      '  LICENCIA = :LICENCIA,'
      '  FECHA_VENCE_LICENCIA = :FECHA_VENCE_LICENCIA,'
      '  FOTO = :FOTO,'
      '  PASSPORT = :PASSPORT,'
      '  FECHA_VENCE_PASSPORT = :FECHA_VENCE_PASSPORT,'
      '  CALLE = :CALLE,'
      '  NUM_CASA = :NUM_CASA,'
      '  CIUDAD = :CIUDAD,'
      '  PAIS = :PAIS,'
      '  TELEF_CASA = :TELEF_CASA,'
      '  CELULAR = :CELULAR,'
      '  EMAIL = :EMAIL,'
      '  SEXO = :SEXO,'
      '  ESTADO_CIVIL = :ESTADO_CIVIL,'
      '  TELEF_CONYUGUE = :TELEF_CONYUGUE,'
      '  NOMBRE_CONYUGUE = :NOMBRE_CONYUGUE,'
      '  FECHA_NAC = :FECHA_NAC,'
      '  NACIONALIDAD = :NACIONALIDAD,'
      '  FECHA_ENTRADA = :FECHA_ENTRADA,'
      '  FECHA_SALIDA = :FECHA_SALIDA,'
      '  SALARIO_XDIA = :SALARIO_XDIA,'
      '  TIPO_NOMINA = :TIPO_NOMINA,'
      '  TIPO_EMPLEADO = :TIPO_EMPLEADO,'
      '  CARGO = :CARGO,'
      '  PAGA_AFP = :PAGA_AFP,'
      '  PAGA_TSS = :PAGA_TSS,'
      '  PAGA_RETENCION = :PAGA_RETENCION,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  CIA_KEY = :OLD_CIA_KEY and'
      '  CODIGO = :OLD_CODIGO')
    Left = 664
    Top = 264
    object tblContratistasCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'CONTRATISTAS.CIA_KEY'
      Required = True
    end
    object tblContratistasIDPROYECTO: TIntegerField
      FieldName = 'IDPROYECTO'
      Origin = 'CONTRATISTAS.IDPROYECTO'
    end
    object tblContratistasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CONTRATISTAS.CODIGO'
      Required = True
    end
    object tblContratistasNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'CONTRATISTAS.NOMBRE'
      Size = 60
    end
    object tblContratistasAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'CONTRATISTAS.APELLIDO'
      Size = 60
    end
    object tblContratistasCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CONTRATISTAS.CEDULA'
      Size = 14
    end
    object tblContratistasLICENCIA: TIBStringField
      FieldName = 'LICENCIA'
      Origin = 'CONTRATISTAS.LICENCIA'
      Size = 14
    end
    object tblContratistasFECHA_VENCE_LICENCIA: TDateTimeField
      FieldName = 'FECHA_VENCE_LICENCIA'
      Origin = 'CONTRATISTAS.FECHA_VENCE_LICENCIA'
    end
    object tblContratistasFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'CONTRATISTAS.FOTO'
      Size = 8
    end
    object tblContratistasPASSPORT: TIBStringField
      FieldName = 'PASSPORT'
      Origin = 'CONTRATISTAS.PASSPORT'
      Size = 14
    end
    object tblContratistasFECHA_VENCE_PASSPORT: TDateTimeField
      FieldName = 'FECHA_VENCE_PASSPORT'
      Origin = 'CONTRATISTAS.FECHA_VENCE_PASSPORT'
    end
    object tblContratistasCALLE: TIBStringField
      FieldName = 'CALLE'
      Origin = 'CONTRATISTAS.CALLE'
      Size = 40
    end
    object tblContratistasNUM_CASA: TSmallintField
      FieldName = 'NUM_CASA'
      Origin = 'CONTRATISTAS.NUM_CASA'
    end
    object tblContratistasCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CONTRATISTAS.CIUDAD'
      Size = 40
    end
    object tblContratistasPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CONTRATISTAS.PAIS'
      Size = 40
    end
    object tblContratistasTELEF_CASA: TIBStringField
      FieldName = 'TELEF_CASA'
      Origin = 'CONTRATISTAS.TELEF_CASA'
      Size = 12
    end
    object tblContratistasCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'CONTRATISTAS.CELULAR'
      Size = 12
    end
    object tblContratistasEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CONTRATISTAS.EMAIL'
      Size = 40
    end
    object tblContratistasSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = 'CONTRATISTAS.SEXO'
      FixedChar = True
      Size = 1
    end
    object tblContratistasESTADO_CIVIL: TIBStringField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'CONTRATISTAS.ESTADO_CIVIL'
      FixedChar = True
      Size = 1
    end
    object tblContratistasTELEF_CONYUGUE: TIBStringField
      FieldName = 'TELEF_CONYUGUE'
      Origin = 'CONTRATISTAS.TELEF_CONYUGUE'
      Size = 12
    end
    object tblContratistasNOMBRE_CONYUGUE: TIBStringField
      FieldName = 'NOMBRE_CONYUGUE'
      Origin = 'CONTRATISTAS.NOMBRE_CONYUGUE'
      Size = 40
    end
    object tblContratistasFECHA_NAC: TDateTimeField
      FieldName = 'FECHA_NAC'
      Origin = 'CONTRATISTAS.FECHA_NAC'
    end
    object tblContratistasNACIONALIDAD: TIBStringField
      FieldName = 'NACIONALIDAD'
      Origin = 'CONTRATISTAS.NACIONALIDAD'
      FixedChar = True
      Size = 1
    end
    object tblContratistasFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'CONTRATISTAS.FECHA_ENTRADA'
    end
    object tblContratistasFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'CONTRATISTAS.FECHA_SALIDA'
    end
    object tblContratistasSALARIO_XDIA: TFloatField
      FieldName = 'SALARIO_XDIA'
      Origin = 'CONTRATISTAS.SALARIO_XDIA'
    end
    object tblContratistasTIPO_NOMINA: TSmallintField
      FieldName = 'TIPO_NOMINA'
      Origin = 'CONTRATISTAS.TIPO_NOMINA'
    end
    object tblContratistasTIPO_EMPLEADO: TSmallintField
      FieldName = 'TIPO_EMPLEADO'
      Origin = 'CONTRATISTAS.TIPO_EMPLEADO'
    end
    object tblContratistasCARGO: TSmallintField
      FieldName = 'CARGO'
      Origin = 'CONTRATISTAS.CARGO'
    end
    object tblContratistasPAGA_AFP: TSmallintField
      FieldName = 'PAGA_AFP'
      Origin = 'CONTRATISTAS.PAGA_AFP'
    end
    object tblContratistasPAGA_TSS: TSmallintField
      FieldName = 'PAGA_TSS'
      Origin = 'CONTRATISTAS.PAGA_TSS'
    end
    object tblContratistasPAGA_RETENCION: TSmallintField
      FieldName = 'PAGA_RETENCION'
      Origin = 'CONTRATISTAS.PAGA_RETENCION'
    end
    object tblContratistasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CONTRATISTAS.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblContratistasFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CONTRATISTAS.FECHA_IN'
    end
    object tblContratistasIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'CONTRATISTAS.IN_POR'
      Size = 12
    end
    object tblContratistasFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CONTRATISTAS.FECHA_MOD'
    end
    object tblContratistasMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'CONTRATISTAS.MOD_POR'
      Size = 12
    end
  end
  object dstblContratistas: TDataSource
    DataSet = tblContratistas
    Left = 664
    Top = 320
  end
  object qryContratistas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   c.* '
      'FROM CONTRATISTAS c'
      'WHERE c.status = '#39'A'#39
      'And Tipo_nomina =:tiponomina'
      'And CIA_KEY =:ciakey'
      'And idProyecto =:idproyecto'
      '')
    Left = 664
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tiponomina'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ciakey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idproyecto'
        ParamType = ptInput
      end>
    object qryContratistasCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'CONTRATISTAS.CIA_KEY'
      Required = True
    end
    object qryContratistasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CONTRATISTAS.CODIGO'
      Required = True
    end
    object qryContratistasNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'CONTRATISTAS.NOMBRE'
      Size = 60
    end
    object qryContratistasAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'CONTRATISTAS.APELLIDO'
      Size = 60
    end
    object qryContratistasCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CONTRATISTAS.CEDULA'
      Size = 14
    end
    object qryContratistasLICENCIA: TIBStringField
      FieldName = 'LICENCIA'
      Origin = 'CONTRATISTAS.LICENCIA'
      Size = 14
    end
    object qryContratistasFECHA_VENCE_LICENCIA: TDateTimeField
      FieldName = 'FECHA_VENCE_LICENCIA'
      Origin = 'CONTRATISTAS.FECHA_VENCE_LICENCIA'
    end
    object qryContratistasFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'CONTRATISTAS.FOTO'
      Size = 8
    end
    object qryContratistasPASSPORT: TIBStringField
      FieldName = 'PASSPORT'
      Origin = 'CONTRATISTAS.PASSPORT'
      Size = 14
    end
    object qryContratistasFECHA_VENCE_PASSPORT: TDateTimeField
      FieldName = 'FECHA_VENCE_PASSPORT'
      Origin = 'CONTRATISTAS.FECHA_VENCE_PASSPORT'
    end
    object qryContratistasCALLE: TIBStringField
      FieldName = 'CALLE'
      Origin = 'CONTRATISTAS.CALLE'
      Size = 40
    end
    object qryContratistasNUM_CASA: TSmallintField
      FieldName = 'NUM_CASA'
      Origin = 'CONTRATISTAS.NUM_CASA'
    end
    object qryContratistasCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CONTRATISTAS.CIUDAD'
      Size = 40
    end
    object qryContratistasPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CONTRATISTAS.PAIS'
      Size = 40
    end
    object qryContratistasTELEF_CASA: TIBStringField
      FieldName = 'TELEF_CASA'
      Origin = 'CONTRATISTAS.TELEF_CASA'
      Size = 12
    end
    object qryContratistasCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'CONTRATISTAS.CELULAR'
      Size = 12
    end
    object qryContratistasEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CONTRATISTAS.EMAIL'
      Size = 40
    end
    object qryContratistasSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = 'CONTRATISTAS.SEXO'
      FixedChar = True
      Size = 1
    end
    object qryContratistasESTADO_CIVIL: TIBStringField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'CONTRATISTAS.ESTADO_CIVIL'
      FixedChar = True
      Size = 1
    end
    object qryContratistasTELEF_CONYUGUE: TIBStringField
      FieldName = 'TELEF_CONYUGUE'
      Origin = 'CONTRATISTAS.TELEF_CONYUGUE'
      Size = 12
    end
    object qryContratistasNOMBRE_CONYUGUE: TIBStringField
      FieldName = 'NOMBRE_CONYUGUE'
      Origin = 'CONTRATISTAS.NOMBRE_CONYUGUE'
      Size = 40
    end
    object qryContratistasFECHA_NAC: TDateTimeField
      FieldName = 'FECHA_NAC'
      Origin = 'CONTRATISTAS.FECHA_NAC'
    end
    object qryContratistasNACIONALIDAD: TIBStringField
      FieldName = 'NACIONALIDAD'
      Origin = 'CONTRATISTAS.NACIONALIDAD'
      FixedChar = True
      Size = 1
    end
    object qryContratistasFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'CONTRATISTAS.FECHA_ENTRADA'
    end
    object qryContratistasFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'CONTRATISTAS.FECHA_SALIDA'
    end
    object qryContratistasSALARIO_XDIA: TFloatField
      FieldName = 'SALARIO_XDIA'
      Origin = 'CONTRATISTAS.SALARIO_XDIA'
    end
    object qryContratistasTIPO_NOMINA: TSmallintField
      FieldName = 'TIPO_NOMINA'
      Origin = 'CONTRATISTAS.TIPO_NOMINA'
    end
    object qryContratistasTIPO_EMPLEADO: TSmallintField
      FieldName = 'TIPO_EMPLEADO'
      Origin = 'CONTRATISTAS.TIPO_EMPLEADO'
    end
    object qryContratistasCARGO: TSmallintField
      FieldName = 'CARGO'
      Origin = 'CONTRATISTAS.CARGO'
    end
    object qryContratistasPAGA_AFP: TSmallintField
      FieldName = 'PAGA_AFP'
      Origin = 'CONTRATISTAS.PAGA_AFP'
    end
    object qryContratistasPAGA_TSS: TSmallintField
      FieldName = 'PAGA_TSS'
      Origin = 'CONTRATISTAS.PAGA_TSS'
    end
    object qryContratistasPAGA_RETENCION: TSmallintField
      FieldName = 'PAGA_RETENCION'
      Origin = 'CONTRATISTAS.PAGA_RETENCION'
    end
    object qryContratistasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CONTRATISTAS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryContratistasFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CONTRATISTAS.FECHA_IN'
    end
    object qryContratistasIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'CONTRATISTAS.IN_POR'
      Size = 12
    end
    object qryContratistasFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CONTRATISTAS.FECHA_MOD'
    end
    object qryContratistasMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'CONTRATISTAS.MOD_POR'
      Size = 12
    end
    object qryContratistasIDPROYECTO: TIntegerField
      FieldName = 'IDPROYECTO'
      Origin = 'CONTRATISTAS.IDPROYECTO'
    end
  end
  object dsqryContratistas: TDataSource
    DataSet = qryContratistas
    Left = 672
    Top = 424
  end
  object qryRepNominaContratista: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select Distinct p.nombre_proyecto, r.* '
      
        'From ProcRepNominaContratista(:ciakey,:codigoProyecto,:fechanomi' +
        'na) r, Proyectos p'
      'Order By  r.codigo_CARGO, r.CODIGO_EMP')
    Left = 440
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ciakey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigoProyecto'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechanomina'
        ParamType = ptInput
      end>
    object qryRepNominaContratistaCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'PROCREPNOMINACONTRATISTA.CIA_KEY'
    end
    object qryRepNominaContratistaCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'PROCREPNOMINACONTRATISTA.CODIGO_EMP'
    end
    object qryRepNominaContratistaCODIGO_PROY: TIntegerField
      FieldName = 'CODIGO_PROY'
      Origin = 'PROCREPNOMINACONTRATISTA.CODIGO_PROY'
    end
    object qryRepNominaContratistaFECHA_NOMINA: TDateTimeField
      FieldName = 'FECHA_NOMINA'
      Origin = 'PROCREPNOMINACONTRATISTA.FECHA_NOMINA'
    end
    object qryRepNominaContratistaCANT_DIAS: TFloatField
      FieldName = 'CANT_DIAS'
      Origin = 'PROCREPNOMINACONTRATISTA.CANT_DIAS'
    end
    object qryRepNominaContratistaPRECIO_XDIA: TFloatField
      FieldName = 'PRECIO_XDIA'
      Origin = 'PROCREPNOMINACONTRATISTA.PRECIO_XDIA'
    end
    object qryRepNominaContratistaSALARIO_BRUTO: TFloatField
      FieldName = 'SALARIO_BRUTO'
      Origin = 'PROCREPNOMINACONTRATISTA.SALARIO_BRUTO'
    end
    object qryRepNominaContratistaCOOPERATIVA: TFloatField
      FieldName = 'COOPERATIVA'
      Origin = 'PROCREPNOMINACONTRATISTA.COOPERATIVA'
    end
    object qryRepNominaContratistaMONTO_AFP: TFloatField
      FieldName = 'MONTO_AFP'
      Origin = 'PROCREPNOMINACONTRATISTA.MONTO_AFP'
    end
    object qryRepNominaContratistaISR: TFloatField
      FieldName = 'ISR'
      Origin = 'PROCREPNOMINACONTRATISTA.ISR'
    end
    object qryRepNominaContratistaCUOTA_PRESTAMO: TFloatField
      FieldName = 'CUOTA_PRESTAMO'
      Origin = 'PROCREPNOMINACONTRATISTA.CUOTA_PRESTAMO'
    end
    object qryRepNominaContratistaTSS: TFloatField
      FieldName = 'TSS'
      Origin = 'PROCREPNOMINACONTRATISTA.TSS'
    end
    object qryRepNominaContratistaSFS_DEPENDIENTES: TFloatField
      FieldName = 'SFS_DEPENDIENTES'
      Origin = 'PROCREPNOMINACONTRATISTA.SFS_DEPENDIENTES'
    end
    object qryRepNominaContratistaSFS_COMPLEMENTARIO: TFloatField
      FieldName = 'SFS_COMPLEMENTARIO'
      Origin = 'PROCREPNOMINACONTRATISTA.SFS_COMPLEMENTARIO'
    end
    object qryRepNominaContratistaOTROS_INGRESOS: TFloatField
      FieldName = 'OTROS_INGRESOS'
      Origin = 'PROCREPNOMINACONTRATISTA.OTROS_INGRESOS'
    end
    object qryRepNominaContratistaOTRAS_DEDUCCIONES: TFloatField
      FieldName = 'OTRAS_DEDUCCIONES'
      Origin = 'PROCREPNOMINACONTRATISTA.OTRAS_DEDUCCIONES'
    end
    object qryRepNominaContratistaSALARIO_NETO: TFloatField
      FieldName = 'SALARIO_NETO'
      Origin = 'PROCREPNOMINACONTRATISTA.SALARIO_NETO'
    end
    object qryRepNominaContratistaCODIGO_USUARIO: TSmallintField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'PROCREPNOMINACONTRATISTA.CODIGO_USUARIO'
    end
    object qryRepNominaContratistaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROCREPNOMINACONTRATISTA.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepNominaContratistaNUMERO_CKS: TSmallintField
      FieldName = 'NUMERO_CKS'
      Origin = 'PROCREPNOMINACONTRATISTA.NUMERO_CKS'
    end
    object qryRepNominaContratistaMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PROCREPNOMINACONTRATISTA.MOD_POR'
      Size = 12
    end
    object qryRepNominaContratistaMONTO_RETENCIONDGII: TFloatField
      FieldName = 'MONTO_RETENCIONDGII'
      Origin = 'PROCREPNOMINACONTRATISTA.MONTO_RETENCIONDGII'
    end
    object qryRepNominaContratistaNOMBRE_CONTRATISTA: TIBStringField
      FieldName = 'NOMBRE_CONTRATISTA'
      Origin = 'PROCREPNOMINACONTRATISTA.NOMBRE_CONTRATISTA'
      Size = 120
    end
    object qryRepNominaContratistaCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'PROCREPNOMINACONTRATISTA.CEDULA'
      Size = 14
    end
    object qryRepNominaContratistaDESCCARGOCONTRATISTA: TIBStringField
      FieldName = 'DESCCARGOCONTRATISTA'
      Origin = 'PROCREPNOMINACONTRATISTA.DESCCARGOCONTRATISTA'
      Size = 40
    end
    object qryRepNominaContratistaCODIGO_CARGO: TSmallintField
      FieldName = 'CODIGO_CARGO'
      Origin = 'PROCREPNOMINACONTRATISTA.CODIGO_CARGO'
    end
    object qryRepNominaContratistaNOMBRE_PROYECTO: TIBStringField
      FieldName = 'NOMBRE_PROYECTO'
      Origin = 'PROYECTOS.NOMBRE_PROYECTO'
      Size = 60
    end
  end
  object ibstpAplicaISRC: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_ACT_NOMINA_ISRC'
    Left = 336
    Top = 256
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'VCIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'VFECHA_NOMINA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESCALA_RETENCION1'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESCALA_RETENCION2'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VESCALA_RETENCION3'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VPORC_AFP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VPORC_SALUD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_PROY'
        ParamType = ptInput
      end>
  end
  object tblTipoNomina: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'OBSERVACIONES'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'STATUS_TIPO_NOMINA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ULT_FECHA_NOM'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY62'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TIPO_NOMINA'
    Left = 48
    Top = 352
    object tblTipoNominaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblTipoNominaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
    object tblTipoNominaOBSERVACIONES: TIBStringField
      FieldName = 'OBSERVACIONES'
      Size = 30
    end
    object tblTipoNominaSTATUS_TIPO_NOMINA: TIBStringField
      FieldName = 'STATUS_TIPO_NOMINA'
      Size = 1
    end
    object tblTipoNominaULT_FECHA_NOM: TDateTimeField
      FieldName = 'ULT_FECHA_NOM'
    end
  end
  object StpIntegraComisionXVta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from '
      'proc_RepComisionTrab(:fechaPago,:fechaini,:fechafin,:codusurio)')
    Left = 168
    Top = 416
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaPago'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codusurio'
        ParamType = ptInput
      end>
  end
  object ibstpProcActNomComisiones: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_ACT_NOMINA_COMISIONES'
    Left = 392
    Top = 432
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'VTIPO_NOMINA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'VCIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'VFECHA_NOMINA'
        ParamType = ptInput
      end>
  end
end
