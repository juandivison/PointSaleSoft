object dmIngresos: TdmIngresos
  OldCreateOrder = False
  Left = 294
  Top = 122
  Height = 496
  Width = 465
  object tblIngresoMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblIngresoMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from INGRESOS'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  TIPO = :OLD_TIPO and'
      '  NUMERO = :OLD_NUMERO and'
      '  MONEDA = :OLD_MONEDA')
    InsertSQL.Strings = (
      'insert into INGRESOS'
      
        '  (SERIE, TIPO, NUMERO, MONEDA, FECHA, VALOR_ING, TIPO_ING, NOMB' +
        'RE_CTE, '
      
        '   CODIGO_CTE, COD_SERVICIO, FORMA_PAGO, DOCUMENTO, TIPO_TARGETA' +
        ', STATUS_TARGETA, '
      
        '   CONCEPTO, STATUS, OBSERVACION, COD_LINEA, FECHA_IN, IN_POR, F' +
        'ECHA_MOD, '
      '   MOD_POR, COD_EMPLEADO)'
      'values'
      
        '  (:SERIE, :TIPO, :NUMERO, :MONEDA, :FECHA, :VALOR_ING, :TIPO_IN' +
        'G, :NOMBRE_CTE, '
      
        '   :CODIGO_CTE, :COD_SERVICIO, :FORMA_PAGO, :DOCUMENTO, :TIPO_TA' +
        'RGETA, '
      
        '   :STATUS_TARGETA, :CONCEPTO, :STATUS, :OBSERVACION, :COD_LINEA' +
        ', :FECHA_IN, '
      '   :IN_POR, :FECHA_MOD, :MOD_POR, :COD_EMPLEADO)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  TIPO,'
      '  NUMERO,'
      '  MONEDA,'
      '  FECHA,'
      '  VALOR_ING,'
      '  TIPO_ING,'
      '  NOMBRE_CTE,'
      '  CODIGO_CTE,'
      '  COD_SERVICIO,'
      '  FORMA_PAGO,'
      '  DOCUMENTO,'
      '  TIPO_TARGETA,'
      '  STATUS_TARGETA,'
      '  CONCEPTO,'
      '  STATUS,'
      '  OBSERVACION,'
      '  COD_LINEA,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  COD_EMPLEADO'
      'from INGRESOS '
      'where'
      '  SERIE = :SERIE and'
      '  TIPO = :TIPO and'
      '  NUMERO = :NUMERO and'
      '  MONEDA = :MONEDA')
    SelectSQL.Strings = (
      'select * from INGRESOS'
      'WHERE FECHA BETWEEN :FECHAINI AND :FECHAFIN')
    ModifySQL.Strings = (
      'update INGRESOS'
      'set'
      '  SERIE = :SERIE,'
      '  TIPO = :TIPO,'
      '  NUMERO = :NUMERO,'
      '  MONEDA = :MONEDA,'
      '  FECHA = :FECHA,'
      '  VALOR_ING = :VALOR_ING,'
      '  TIPO_ING = :TIPO_ING,'
      '  NOMBRE_CTE = :NOMBRE_CTE,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  COD_SERVICIO = :COD_SERVICIO,'
      '  FORMA_PAGO = :FORMA_PAGO,'
      '  DOCUMENTO = :DOCUMENTO,'
      '  TIPO_TARGETA = :TIPO_TARGETA,'
      '  STATUS_TARGETA = :STATUS_TARGETA,'
      '  CONCEPTO = :CONCEPTO,'
      '  STATUS = :STATUS,'
      '  OBSERVACION = :OBSERVACION,'
      '  COD_LINEA = :COD_LINEA,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  COD_EMPLEADO = :COD_EMPLEADO'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  TIPO = :OLD_TIPO and'
      '  NUMERO = :OLD_NUMERO and'
      '  MONEDA = :OLD_MONEDA')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_NUM_INGRESO_MAST'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 112
    Top = 24
    object tblIngresoMasterSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'INGRESOS.SERIE'
      Required = True
    end
    object tblIngresoMasterTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'INGRESOS.TIPO'
      Required = True
    end
    object tblIngresoMasterNUMERO: TFloatField
      FieldName = 'NUMERO'
      Origin = 'INGRESOS.NUMERO'
      Required = True
    end
    object tblIngresoMasterMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'INGRESOS.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tblIngresoMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'INGRESOS.FECHA'
    end
    object tblIngresoMasterVALOR_ING: TFloatField
      FieldName = 'VALOR_ING'
      Origin = 'INGRESOS.VALOR_ING'
    end
    object tblIngresoMasterTIPO_ING: TSmallintField
      FieldName = 'TIPO_ING'
      Origin = 'INGRESOS.TIPO_ING'
    end
    object tblIngresoMasterNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'INGRESOS.NOMBRE_CTE'
      Size = 40
    end
    object tblIngresoMasterCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'INGRESOS.CODIGO_CTE'
    end
    object tblIngresoMasterCOD_SERVICIO: TIntegerField
      FieldName = 'COD_SERVICIO'
      Origin = 'INGRESOS.COD_SERVICIO'
    end
    object tblIngresoMasterDOCUMENTO: TIBStringField
      FieldName = 'DOCUMENTO'
      Origin = 'INGRESOS.DOCUMENTO'
    end
    object tblIngresoMasterTIPO_TARGETA: TSmallintField
      FieldName = 'TIPO_TARGETA'
      Origin = 'INGRESOS.TIPO_TARGETA'
    end
    object tblIngresoMasterSTATUS_TARGETA: TIBStringField
      FieldName = 'STATUS_TARGETA'
      Origin = 'INGRESOS.STATUS_TARGETA'
      FixedChar = True
      Size = 1
    end
    object tblIngresoMasterCONCEPTO: TIBStringField
      FieldName = 'CONCEPTO'
      Origin = 'INGRESOS.CONCEPTO'
      Size = 40
    end
    object tblIngresoMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INGRESOS.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblIngresoMasterOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'INGRESOS.OBSERVACION'
      Size = 40
    end
    object tblIngresoMasterCOD_LINEA: TIBStringField
      FieldName = 'COD_LINEA'
      Origin = 'INGRESOS.COD_LINEA'
      FixedChar = True
      Size = 6
    end
    object tblIngresoMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'INGRESOS.FECHA_IN'
    end
    object tblIngresoMasterIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'INGRESOS.IN_POR'
      Size = 12
    end
    object tblIngresoMasterFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'INGRESOS.FECHA_MOD'
    end
    object tblIngresoMasterMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'INGRESOS.MOD_POR'
      Size = 12
    end
    object tblIngresoMasterFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'INGRESOS.FORMA_PAGO'
    end
    object tblIngresoMasterCOD_EMPLEADO: TIntegerField
      FieldName = 'COD_EMPLEADO'
      Origin = 'INGRESOS.COD_EMPLEADO'
    end
  end
  object dstblIngresoMaster: TDataSource
    DataSet = tblIngresoMaster
    Left = 56
    Top = 80
  end
  object tblIngresoDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from INGRESOS_DET'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  SERIE_MASTER = :OLD_SERIE_MASTER')
    InsertSQL.Strings = (
      'insert into INGRESOS_DET'
      
        '  (SERIE, SERIE_MASTER, NUMERO_ING, COD_SERVICIO, COD_DEPARTAMEN' +
        'TO, DETALLE, '
      
        '   VALOR_DET, STATUS, VALOR_IMPUESTO, PORC_DESCUENTO, FECHA_IN, ' +
        'IN_POR, '
      
        '   FECHA_MOD, MOD_POR, TIPO_TARJETA, NUMERO_TARJETA_CRED, ANO_VE' +
        'NCE, MES_VENCE, '
      
        '   MONTOAUTORIZADO, NUMERO_APROBACION, TIPO, CODIGO_PROVEEDOR, F' +
        'CTING_SERIE)'
      'values'
      
        '  (:SERIE, :SERIE_MASTER, :NUMERO_ING, :COD_SERVICIO, :COD_DEPAR' +
        'TAMENTO, '
      
        '   :DETALLE, :VALOR_DET, :STATUS, :VALOR_IMPUESTO, :PORC_DESCUEN' +
        'TO, :FECHA_IN, '
      
        '   :IN_POR, :FECHA_MOD, :MOD_POR, :TIPO_TARJETA, :NUMERO_TARJETA' +
        '_CRED, '
      
        '   :ANO_VENCE, :MES_VENCE, :MONTOAUTORIZADO, :NUMERO_APROBACION,' +
        ' :TIPO, '
      '   :CODIGO_PROVEEDOR, :FCTING_SERIE)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  SERIE_MASTER,'
      '  NUMERO_ING,'
      '  COD_SERVICIO,'
      '  COD_DEPARTAMENTO,'
      '  DETALLE,'
      '  VALOR_DET,'
      '  STATUS,'
      '  VALOR_IMPUESTO,'
      '  PORC_DESCUENTO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  TIPO_TARJETA,'
      '  NUMERO_TARJETA_CRED,'
      '  ANO_VENCE,'
      '  MES_VENCE,'
      '  MONTOAUTORIZADO,'
      '  NUMERO_APROBACION,'
      '  TIPO,'
      '  CODIGO_PROVEEDOR,'
      '  FCTING_SERIE'
      'from INGRESOS_DET '
      'where'
      '  SERIE = :SERIE and'
      '  SERIE_MASTER = :SERIE_MASTER')
    SelectSQL.Strings = (
      'SELECT  * FROM  INGRESOS_DET'
      'Where Numero_Ing =:NUMERO')
    ModifySQL.Strings = (
      'update INGRESOS_DET'
      'set'
      '  SERIE = :SERIE,'
      '  SERIE_MASTER = :SERIE_MASTER,'
      '  NUMERO_ING = :NUMERO_ING,'
      '  COD_SERVICIO = :COD_SERVICIO,'
      '  COD_DEPARTAMENTO = :COD_DEPARTAMENTO,'
      '  DETALLE = :DETALLE,'
      '  VALOR_DET = :VALOR_DET,'
      '  STATUS = :STATUS,'
      '  VALOR_IMPUESTO = :VALOR_IMPUESTO,'
      '  PORC_DESCUENTO = :PORC_DESCUENTO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  TIPO_TARJETA = :TIPO_TARJETA,'
      '  NUMERO_TARJETA_CRED = :NUMERO_TARJETA_CRED,'
      '  ANO_VENCE = :ANO_VENCE,'
      '  MES_VENCE = :MES_VENCE,'
      '  MONTOAUTORIZADO = :MONTOAUTORIZADO,'
      '  NUMERO_APROBACION = :NUMERO_APROBACION,'
      '  TIPO = :TIPO,'
      '  CODIGO_PROVEEDOR = :CODIGO_PROVEEDOR,'
      '  FCTING_SERIE = :FCTING_SERIE'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  SERIE_MASTER = :OLD_SERIE_MASTER')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_NUM_INGRESO_DET'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 208
    Top = 24
    object tblIngresoDetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'INGRESOS_DET.SERIE'
      Required = True
    end
    object tblIngresoDetSERIE_MASTER: TIntegerField
      FieldName = 'SERIE_MASTER'
      Origin = 'INGRESOS_DET.SERIE_MASTER'
      Required = True
    end
    object tblIngresoDetNUMERO_ING: TIntegerField
      FieldName = 'NUMERO_ING'
      Origin = 'INGRESOS_DET.NUMERO_ING'
      Required = True
    end
    object tblIngresoDetCOD_SERVICIO: TIntegerField
      FieldName = 'COD_SERVICIO'
      Origin = 'INGRESOS_DET.COD_SERVICIO'
    end
    object tblIngresoDetCOD_DEPARTAMENTO: TIBStringField
      FieldName = 'COD_DEPARTAMENTO'
      Origin = 'INGRESOS_DET.COD_DEPARTAMENTO'
      Size = 12
    end
    object tblIngresoDetDETALLE: TIBStringField
      FieldName = 'DETALLE'
      Origin = 'INGRESOS_DET.DETALLE'
      Size = 40
    end
    object tblIngresoDetVALOR_DET: TFloatField
      FieldName = 'VALOR_DET'
      Origin = 'INGRESOS_DET.VALOR_DET'
    end
    object tblIngresoDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INGRESOS_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblIngresoDetVALOR_IMPUESTO: TFloatField
      FieldName = 'VALOR_IMPUESTO'
      Origin = 'INGRESOS_DET.VALOR_IMPUESTO'
    end
    object tblIngresoDetPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'INGRESOS_DET.PORC_DESCUENTO'
    end
    object tblIngresoDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'INGRESOS_DET.FECHA_IN'
    end
    object tblIngresoDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'INGRESOS_DET.IN_POR'
      Size = 12
    end
    object tblIngresoDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'INGRESOS_DET.FECHA_MOD'
    end
    object tblIngresoDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'INGRESOS_DET.MOD_POR'
      Size = 12
    end
    object tblIngresoDetTIPO_TARJETA: TSmallintField
      FieldName = 'TIPO_TARJETA'
      Origin = 'INGRESOS_DET.TIPO_TARJETA'
    end
    object tblIngresoDetNUMERO_TARJETA_CRED: TIBStringField
      FieldName = 'NUMERO_TARJETA_CRED'
      Origin = 'INGRESOS_DET.NUMERO_TARJETA_CRED'
      Size = 14
    end
    object tblIngresoDetANO_VENCE: TIntegerField
      FieldName = 'ANO_VENCE'
      Origin = 'INGRESOS_DET.ANO_VENCE'
    end
    object tblIngresoDetMES_VENCE: TSmallintField
      FieldName = 'MES_VENCE'
      Origin = 'INGRESOS_DET.MES_VENCE'
    end
    object tblIngresoDetMONTOAUTORIZADO: TFloatField
      FieldName = 'MONTOAUTORIZADO'
      Origin = 'INGRESOS_DET.MONTOAUTORIZADO'
    end
    object tblIngresoDetNUMERO_APROBACION: TIBStringField
      FieldName = 'NUMERO_APROBACION'
      Origin = 'INGRESOS_DET.NUMERO_APROBACION'
      FixedChar = True
      Size = 15
    end
    object tblIngresoDetTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'INGRESOS_DET.TIPO'
    end
    object tblIngresoDetCODIGO_PROVEEDOR: TSmallintField
      FieldName = 'CODIGO_PROVEEDOR'
      Origin = 'INGRESOS_DET.CODIGO_PROVEEDOR'
    end
    object tblIngresoDetFCTING_SERIE: TIntegerField
      FieldName = 'FCTING_SERIE'
      Origin = 'INGRESOS_DET.FCTING_SERIE'
    end
  end
  object dstblIngresoDet: TDataSource
    DataSet = tblIngresoDet
    Left = 256
    Top = 80
  end
  object IBTableTipoIng: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_ING'
    Left = 112
    Top = 136
    object IBTableTipoIngCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object IBTableTipoIngDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
    end
  end
  object dtIBTableTipoIng: TDataSource
    DataSet = IBTableTipoIng
    Left = 112
    Top = 192
  end
  object dtIBTableCliente: TDataSource
    DataSet = IBQryCliente
    Left = 128
    Top = 312
  end
  object IBQryCliente: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select CODIGO_CTE, NOMBRE_FACTURAR from CLIENTEs'
      'WHERE STATUS_CLIENTE = '#39'A'#39)
    Left = 120
    Top = 240
  end
  object IBTableServicio: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'SERVICIO'
    Left = 216
    Top = 136
    object IBTableServicioCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object IBTableServicioFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object IBTableServicioDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object IBTableServicioAFECTA_INVENTARIO: TSmallintField
      FieldName = 'AFECTA_INVENTARIO'
    end
    object IBTableServicioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object dtIBTableServicio: TDataSource
    DataSet = IBTableServicio
    Left = 216
    Top = 192
  end
  object tblFormaPago: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DESCRIPCION'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ORIGEN'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'TIPO_PAGOINDEX1'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY14'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TIPO_PAGO'
    Left = 32
    Top = 24
    object tblFormaPagoCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tblFormaPagoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 15
    end
    object tblFormaPagoORIGEN: TSmallintField
      FieldName = 'ORIGEN'
    end
  end
  object stpFactPendiente: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROCFACT_PENDIENTE'
    Left = 304
    Top = 240
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALOR_PENDIENTE'
        ParamType = ptOutput
        Value = 2596.000000000000000000
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_FACT'
        ParamType = ptInput
        Value = '2'
      end
      item
        DataType = ftFloat
        Name = 'MONTO_PENDIENTE'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
        Value = 'A'
      end
      item
        DataType = ftSmallint
        Name = 'ACCION'
        ParamType = ptInput
        Value = '-1'
      end>
  end
  object stpInsertarReciboIngreso: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INSERTAR_RECIBO_ING'
    Left = 224
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO_RECIBO'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_ING'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_ING'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMBRE_CTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_SERVICIO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'FORMA_PAGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_TARGETA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS_TARGETA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONCEPTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COD_LINEA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end>
  end
  object qryfctingresos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  f.SERIE,  f.NUMERO,  f.NUMERO_FACT,'
      '  f.MONTO_FACT,  f.MONEDA,  f.STATUS,'
      '  f.CODIGO_SERVICIO'
      'FROM FCTINGRESOS  f, ingresos i'
      'Where '
      'i.fecha = :fecha and'
      'f.Numero = :numeroing'
      'And f.tipo = i.tipo'
      'And i.numero = f.numero')
    Left = 32
    Top = 240
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'numeroing'
        ParamType = ptInput
      end>
    object qryfctingresosSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'FCTINGRESOS.SERIE'
      Required = True
    end
    object qryfctingresosNUMERO: TFloatField
      FieldName = 'NUMERO'
      Origin = 'FCTINGRESOS.NUMERO'
      Required = True
    end
    object qryfctingresosNUMERO_FACT: TFloatField
      FieldName = 'NUMERO_FACT'
      Origin = 'FCTINGRESOS.NUMERO_FACT'
      Required = True
    end
    object qryfctingresosMONTO_FACT: TFloatField
      FieldName = 'MONTO_FACT'
      Origin = 'FCTINGRESOS.MONTO_FACT'
    end
    object qryfctingresosMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'FCTINGRESOS.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryfctingresosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FCTINGRESOS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryfctingresosCODIGO_SERVICIO: TIntegerField
      FieldName = 'CODIGO_SERVICIO'
      Origin = 'FCTINGRESOS.CODIGO_SERVICIO'
    end
  end
  object stpFactPagoIng: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROCFACT_PAGO_ING'
    Left = 40
    Top = 376
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALOR_FACTURA'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUMERO_FACT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_FACT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ACCION'
        ParamType = ptInput
      end>
  end
  object IBTable1: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_PAGO'
    Left = 128
    Top = 384
    object SmallintField1: TSmallintField
      FieldName = 'CODIGO'
    end
    object IBStringField1: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 15
    end
  end
  object qryRepIngDetalle: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT INGRESOS_DET.NUMERO_ING,'
      '                INGRESOS_DET.DETALLE,'
      '                INGRESOS_DET.VALOR_IMPUESTO,'
      '                INGRESOS_DET.PORC_DESCUENTO,'
      '                INGRESOS_DET.TIPO_TARJETA,'
      '                INGRESOS_DET.NUMERO_TARJETA_CRED,'
      '                INGRESOS_DET.ANO_VENCE,'
      '                INGRESOS_DET.MES_VENCE,'
      '                INGRESOS_DET.valor_det,'
      '                INGRESOS_DET.MONTOAUTORIZADO,'
      '                INGRESOS_DET.NUMERO_APROBACION,'
      '                INGRESOS_DET.TIPO AS DESCTIPOPAGOTARJETA,'
      '                INGRESOS_DET.CODIGO_PROVEEDOR,'
      '                TARJETA.DESCRIPCION AS DESCTARJETA,'
      
        '                PROVEEDOR_COBRO_TARJETA.DESCRIPCION AS DESCPROVE' +
        'EDORTARJETA,'
      '                FCTINGRESOS.NUMERO,'
      '                FCTINGRESOS.NUMERO_FACT,'
      '                FCTINGRESOS.MONTO_FACT'
      'FROM FCTINGRESOS'
      
        '   RIGHT OUTER JOIN INGRESOS_DET ON (FCTINGRESOS.SERIE = INGRESO' +
        'S_DET.FCTING_SERIE)'
      
        '   LEFT OUTER JOIN TARJETA ON (INGRESOS_DET.TIPO_TARJETA = TARJE' +
        'TA.CODIGO)'
      
        '   LEFT OUTER JOIN PROVEEDOR_COBRO_TARJETA ON (INGRESOS_DET.CODI' +
        'GO_PROVEEDOR = PROVEEDOR_COBRO_TARJETA.CODIGO)'
      ''
      'Where INGRESOS_DET.NUMERO_ING =:NumeroIng')
    Left = 240
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NumeroIng'
        ParamType = ptInput
        Value = '48'
      end>
    object qryRepIngDetalleNUMERO_ING: TIntegerField
      FieldName = 'NUMERO_ING'
      Origin = 'INGRESOS_DET.NUMERO_ING'
      Required = True
    end
    object qryRepIngDetalleDETALLE: TIBStringField
      FieldName = 'DETALLE'
      Origin = 'INGRESOS_DET.DETALLE'
      Size = 40
    end
    object qryRepIngDetalleVALOR_IMPUESTO: TFloatField
      FieldName = 'VALOR_IMPUESTO'
      Origin = 'INGRESOS_DET.VALOR_IMPUESTO'
    end
    object qryRepIngDetallePORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'INGRESOS_DET.PORC_DESCUENTO'
    end
    object qryRepIngDetalleTIPO_TARJETA: TSmallintField
      FieldName = 'TIPO_TARJETA'
      Origin = 'INGRESOS_DET.TIPO_TARJETA'
    end
    object qryRepIngDetalleNUMERO_TARJETA_CRED: TIBStringField
      FieldName = 'NUMERO_TARJETA_CRED'
      Origin = 'INGRESOS_DET.NUMERO_TARJETA_CRED'
      Size = 14
    end
    object qryRepIngDetalleANO_VENCE: TIntegerField
      FieldName = 'ANO_VENCE'
      Origin = 'INGRESOS_DET.ANO_VENCE'
    end
    object qryRepIngDetalleMES_VENCE: TSmallintField
      FieldName = 'MES_VENCE'
      Origin = 'INGRESOS_DET.MES_VENCE'
    end
    object qryRepIngDetalleMONTOAUTORIZADO: TFloatField
      FieldName = 'MONTOAUTORIZADO'
      Origin = 'INGRESOS_DET.MONTOAUTORIZADO'
    end
    object qryRepIngDetalleNUMERO_APROBACION: TIBStringField
      FieldName = 'NUMERO_APROBACION'
      Origin = 'INGRESOS_DET.NUMERO_APROBACION'
      FixedChar = True
      Size = 15
    end
    object qryRepIngDetalleDESCTIPOPAGOTARJETA: TSmallintField
      FieldName = 'DESCTIPOPAGOTARJETA'
      Origin = 'INGRESOS_DET.TIPO'
    end
    object qryRepIngDetalleCODIGO_PROVEEDOR: TSmallintField
      FieldName = 'CODIGO_PROVEEDOR'
      Origin = 'INGRESOS_DET.CODIGO_PROVEEDOR'
    end
    object qryRepIngDetalleDESCTARJETA: TIBStringField
      FieldName = 'DESCTARJETA'
      Origin = 'TARJETA.DESCRIPCION'
      Size = 30
    end
    object qryRepIngDetalleDESCPROVEEDORTARJETA: TIBStringField
      FieldName = 'DESCPROVEEDORTARJETA'
      Origin = 'PROVEEDOR_COBRO_TARJETA.DESCRIPCION'
      Size = 30
    end
    object qryRepIngDetalleMontoCldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MontoCldo'
      Calculated = True
    end
    object qryRepIngDetalleNUMERO: TFloatField
      FieldName = 'NUMERO'
      Origin = 'FCTINGRESOS.NUMERO'
    end
    object qryRepIngDetalleNUMERO_FACT: TFloatField
      FieldName = 'NUMERO_FACT'
      Origin = 'FCTINGRESOS.NUMERO_FACT'
    end
    object qryRepIngDetalleMONTO_FACT: TFloatField
      FieldName = 'MONTO_FACT'
      Origin = 'FCTINGRESOS.MONTO_FACT'
    end
    object qryRepIngDetalleVALOR_DET: TFloatField
      FieldName = 'VALOR_DET'
      Origin = 'INGRESOS_DET.VALOR_DET'
    end
  end
  object qryRepIngMaster: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepIngMasterAfterScroll
    OnCalcFields = qryRepIngMasterCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT INGRESOS.NUMERO,       '
      '       INGRESOS.CODIGO_CTE,'
      '       MONEDA.DESCRIPCION Desc_moneda,'
      '       TIPO_PAGO.DESCRIPCION Forma_de_pago,'
      '       INGRESOS.FORMA_PAGO,'
      '       CLIENTES.NOMBRE_CTE,'
      '       '
      '       CLIENTES.NOMBRE_FACTURAR NOMBRE_EMPRESA,'
      '       INGRESOS.FECHA,'
      '       MONEDA.SIMBOLO Simbolo_Moneda,'
      '       CLIENTES.DIRECCION_CONT DIRECCION_LOCAL,'
      '       CLIENTES.TELEF_CONTACTO TELEFONO_LOCAL,'
      '       CLIENTES.TELEF_REFERENCIA TELEF_CONTACTO'
      'FROM MONEDA'
      '   INNER JOIN INGRESOS ON (MONEDA.CODIGO = INGRESOS.MONEDA)'
      
        '   INNER JOIN CLIENTES ON (INGRESOS.CODIGO_CTE = CLIENTES.CODIGO' +
        '_CTE)'
      
        '   LEFT OUTER JOIN TIPO_PAGO ON (INGRESOS.FORMA_PAGO = TIPO_PAGO' +
        '.CODIGO)'
      'Where Ingresos.Numero =:Numero')
    Left = 216
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Numero'
        ParamType = ptInput
        Value = '11'
      end>
    object qryRepIngMasterNUMERO: TFloatField
      FieldName = 'NUMERO'
      Origin = 'INGRESOS.NUMERO'
      Required = True
    end
    object qryRepIngMasterNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'INGRESOS.NOMBRE_CTE'
      Size = 40
    end
    object qryRepIngMasterCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'INGRESOS.CODIGO_CTE'
    end
    object qryRepIngMasterDESC_MONEDA: TIBStringField
      FieldName = 'DESC_MONEDA'
      Origin = 'MONEDA.DESCRIPCION'
      FixedChar = True
      Size = 15
    end
    object qryRepIngMasterFORMA_DE_PAGO: TIBStringField
      FieldName = 'FORMA_DE_PAGO'
      Origin = 'TIPO_PAGO.DESCRIPCION'
      FixedChar = True
      Size = 15
    end
    object qryRepIngMasterFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'INGRESOS.FORMA_PAGO'
    end
    object qryRepIngMasterNOMBRE_EMPRESA: TIBStringField
      FieldName = 'NOMBRE_EMPRESA'
      Origin = 'CLIENTES.NOMBRE_EMPRESA'
      Size = 40
    end
    object qryRepIngMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'INGRESOS.FECHA'
    end
    object qryRepIngMasterSIMBOLO_MONEDA: TIBStringField
      FieldName = 'SIMBOLO_MONEDA'
      Origin = 'MONEDA.SIMBOLO'
      FixedChar = True
      Size = 6
    end
    object qryRepIngMasterNOMBRECLIENTECLD: TIBStringField
      FieldKind = fkCalculated
      FieldName = 'NOMBRECLIENTECLD'
      Calculated = True
    end
    object qryRepIngMasterDIRECCION_LOCAL: TIBStringField
      FieldName = 'DIRECCION_LOCAL'
      Origin = 'CLIENTES.DIRECCION_LOCAL'
      Size = 60
    end
    object qryRepIngMasterTELEFONO_LOCAL: TIBStringField
      FieldName = 'TELEFONO_LOCAL'
      Origin = 'CLIENTES.TELEFONO_LOCAL'
    end
    object qryRepIngMasterTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
    end
  end
  object DataSource1: TDataSource
    DataSet = IBTable2
    Left = 304
    Top = 192
  end
  object IBTable2: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'SERVICIO'
    Left = 296
    Top = 136
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO'
    end
    object IBTableServicioMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Size = 1
    end
    object IBTableServicioFECHA_INI: TDateTimeField
      FieldName = 'FECHA_INI'
    end
    object IBTableServicioFECHA_FIN: TDateTimeField
      FieldName = 'FECHA_FIN'
    end
    object IBStringField2: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object IBTableServicioPRECIO: TFloatField
      FieldName = 'PRECIO'
    end
    object SmallintField2: TSmallintField
      FieldName = 'AFECTA_INVENTARIO'
    end
    object IBStringField3: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object dstblFormaPago: TDataSource
    DataSet = tblFormaPago
    Left = 160
    Top = 80
  end
  object IBTable3: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_ING'
    Left = 32
    Top = 192
    object IntegerField2: TIntegerField
      FieldName = 'CODIGO'
    end
    object IBStringField4: TIBStringField
      FieldName = 'DESCRIPCION'
    end
  end
  object DataSource2: TDataSource
    DataSet = IBTable3
    Left = 32
    Top = 136
  end
end
