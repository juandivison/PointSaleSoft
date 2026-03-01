object dmIngresos: TdmIngresos
  OldCreateOrder = False
  Left = 634
  Top = 185
  Height = 498
  Width = 773
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
      
        '   MOD_POR, COD_EMPLEADO, NOTA_DEBITO, NOTA_CREDITO, MONTO_INTER' +
        'ES, MONTO_MORA, '
      '   MONTO_CAPITAL, CIA_KEY)'
      'values'
      
        '  (:SERIE, :TIPO, :NUMERO, :MONEDA, :FECHA, :VALOR_ING, :TIPO_IN' +
        'G, :NOMBRE_CTE, '
      
        '   :CODIGO_CTE, :COD_SERVICIO, :FORMA_PAGO, :DOCUMENTO, :TIPO_TA' +
        'RGETA, '
      
        '   :STATUS_TARGETA, :CONCEPTO, :STATUS, :OBSERVACION, :COD_LINEA' +
        ', :FECHA_IN, '
      
        '   :IN_POR, :FECHA_MOD, :MOD_POR, :COD_EMPLEADO, :NOTA_DEBITO, :' +
        'NOTA_CREDITO, '
      '   :MONTO_INTERES, :MONTO_MORA, :MONTO_CAPITAL, :CIA_KEY)')
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
      '  COD_EMPLEADO,'
      '  NOTA_DEBITO,'
      '  NOTA_CREDITO,'
      '  MONTO_INTERES,'
      '  MONTO_MORA,'
      '  MONTO_CAPITAL,'
      '  CIA_KEY'
      'from INGRESOS '
      'where'
      '  SERIE = :SERIE and'
      '  TIPO = :TIPO and'
      '  NUMERO = :NUMERO and'
      '  MONEDA = :MONEDA')
    SelectSQL.Strings = (
      'SELECT * '
      'FROM INGRESOS'
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
      '  COD_EMPLEADO = :COD_EMPLEADO,'
      '  NOTA_DEBITO = :NOTA_DEBITO,'
      '  NOTA_CREDITO = :NOTA_CREDITO,'
      '  MONTO_INTERES = :MONTO_INTERES,'
      '  MONTO_MORA = :MONTO_MORA,'
      '  MONTO_CAPITAL = :MONTO_CAPITAL,'
      '  CIA_KEY = :CIA_KEY'
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
    object tblIngresoMasterNOTA_DEBITO: TFloatField
      FieldName = 'NOTA_DEBITO'
      Origin = 'INGRESOS.NOTA_DEBITO'
    end
    object tblIngresoMasterNOTA_CREDITO: TFloatField
      FieldName = 'NOTA_CREDITO'
      Origin = 'INGRESOS.NOTA_CREDITO'
    end
    object tblIngresoMasterMONTO_INTERES: TFloatField
      FieldName = 'MONTO_INTERES'
      Origin = 'INGRESOS.MONTO_INTERES'
    end
    object tblIngresoMasterMONTO_MORA: TFloatField
      FieldName = 'MONTO_MORA'
      Origin = 'INGRESOS.MONTO_MORA'
    end
    object tblIngresoMasterMONTO_CAPITAL: TFloatField
      FieldName = 'MONTO_CAPITAL'
      Origin = 'INGRESOS.MONTO_CAPITAL'
    end
    object tblIngresoMasterCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'INGRESOS.CIA_KEY'
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
        'CTING_SERIE, '
      '   COD_PRODUCTO, MES_PAGADO, MONTO_FACT_PENDTE)'
      'values'
      
        '  (:SERIE, :SERIE_MASTER, :NUMERO_ING, :COD_SERVICIO, :COD_DEPAR' +
        'TAMENTO, '
      
        '   :DETALLE, :VALOR_DET, :STATUS, :VALOR_IMPUESTO, :PORC_DESCUEN' +
        'TO, :FECHA_IN, '
      
        '   :IN_POR, :FECHA_MOD, :MOD_POR, :TIPO_TARJETA, :NUMERO_TARJETA' +
        '_CRED, '
      
        '   :ANO_VENCE, :MES_VENCE, :MONTOAUTORIZADO, :NUMERO_APROBACION,' +
        ' :TIPO, '
      
        '   :CODIGO_PROVEEDOR, :FCTING_SERIE, :COD_PRODUCTO, :MES_PAGADO,' +
        ' :MONTO_FACT_PENDTE)')
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
      '  FCTING_SERIE,'
      '  COD_PRODUCTO,'
      '  MES_PAGADO,'
      '  MONTO_FACT_PENDTE'
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
      '  FCTING_SERIE = :FCTING_SERIE,'
      '  COD_PRODUCTO = :COD_PRODUCTO,'
      '  MES_PAGADO = :MES_PAGADO,'
      '  MONTO_FACT_PENDTE = :MONTO_FACT_PENDTE'
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
    object tblIngresoDetCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'INGRESOS_DET.COD_PRODUCTO'
    end
    object tblIngresoDetMES_PAGADO: TDateTimeField
      FieldName = 'MES_PAGADO'
      Origin = 'INGRESOS_DET.MES_PAGADO'
    end
    object tblIngresoDetMONTO_FACT_PENDTE: TFloatField
      FieldName = 'MONTO_FACT_PENDTE'
      Origin = 'INGRESOS_DET.MONTO_FACT_PENDTE'
      DisplayFormat = ',0.00'
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
    object IBQryClienteCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object IBQryClienteNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
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
    Left = 48
    Top = 384
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
    AfterScroll = qryRepIngDetalleAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT INGRESOS_DET.NUMERO_ING,'
      'INGRESOS_DET.MES_PAGADO,'
      '                INGRESOS_DET.DETALLE,'
      '                INGRESOS_DET.VALOR_IMPUESTO,'
      '                INGRESOS_DET.PORC_DESCUENTO,'
      '                INGRESOS_DET.TIPO_TARJETA,'
      '                INGRESOS_DET.NUMERO_TARJETA_CRED,'
      '                INGRESOS_DET.ANO_VENCE,'
      '                INGRESOS_DET.MES_VENCE,'
      'INGRESOS_DET.MONTO_FACT_PENDTE,'
      'INGRESOS_DET.valor_det,'
      '                case  '
      
        '                    when (ingresos_det.detalle = '#39'Abono'#39') then I' +
        'NGRESOS_DET.valor_det '
      '                else 0'
      
        '                end as MontoAbono,                              ' +
        '    '
      '                case  '
      
        '                  when (ingresos_det.detalle = '#39'Saldo'#39') then ING' +
        'RESOS_DET.valor_det                  '
      '                  else 0'
      '                end as MontoSaldo,                  '
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
    object qryRepIngDetalleMES_PAGADO: TDateTimeField
      FieldName = 'MES_PAGADO'
      Origin = 'INGRESOS_DET.MES_PAGADO'
    end
    object qryRepIngDetalleMONTOABONO: TFloatField
      FieldName = 'MONTOABONO'
    end
    object qryRepIngDetalleMONTOSALDO: TFloatField
      FieldName = 'MONTOSALDO'
    end
    object qryRepIngDetalleMONTO_FACT_PENDTE: TFloatField
      FieldName = 'MONTO_FACT_PENDTE'
      Origin = 'INGRESOS_DET.MONTO_FACT_PENDTE'
      DisplayFormat = ',0.00'
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
      'SELECT '
      '  u.NOMBRECOMPLETO DescUsuario,'
      '  T.NUMERO_TRANSF,'
      '  INGRESOS.NUMERO,'
      '  INGRESOS.CODIGO_CTE,'
      '  INGRESOS.CONCEPTO, moneda.codigo codigomoneda,'
      '  MONEDA.DESCRIPCION AS DESC_MONEDA,'
      '  TIPO_PAGO.DESCRIPCION AS FORMA_DE_PAGO,'
      '  INGRESOS.FORMA_PAGO,'
      'INGRESOS.VALOR_ING,'
      '  INGRESOS.NOTA_CREDITO,'
      '  INGRESOS.NOTA_DEBITO,'
      '  CLIENTES.NOMBRE_CTE,'
      '  INGRESOS.OBSERVACION,'
      '  CLIENTES.NOMBRE_FACTURAR AS NOMBRE_EMPRESA,'
      '  CLIENTES.NOMBRE_ABREV,'
      '  INGRESOS.FECHA,'
      '  MONEDA.SIMBOLO AS SIMBOLO_MONEDA,'
      '  CLIENTES.DIRECCION_CONT AS DIRECCION_LOCAL,'
      '  CLIENTES.TELEF_CONTACTO AS TELEF_CONTACTO1,'
      '  CLIENTES.TELEF_REFERENCIA AS TELEF_CONTACTO,'
      '  COBROS_EN_CHEQUE.MONTO_CHEQUE,'
      '  COBROS_EN_CHEQUE.NUMERO_CHEQUE'
      'FROM'
      '  MONEDA'
      '  INNER JOIN INGRESOS ON (MONEDA.CODIGO = INGRESOS.MONEDA)'
      
        '  INNER JOIN CLIENTES ON (INGRESOS.CODIGO_CTE = CLIENTES.CODIGO_' +
        'CTE)'
      
        '  LEFT OUTER JOIN TIPO_PAGO ON (INGRESOS.FORMA_PAGO = TIPO_PAGO.' +
        'CODIGO)'
      
        '  LEFT OUTER JOIN COBROS_EN_CHEQUE ON (INGRESOS.NUMERO = COBROS_' +
        'EN_CHEQUE.NUMERO_RECIBO)'
      
        '  LEFT OUTER JOIN TRANSFERENCIAS T ON (T.NUMERO_RECIBO = INGRESO' +
        'S.NUMERO)'
      
        '  LEFT OUTER JOIN USUARIO U ON u.CODIGO_EMPLEADO = ingresos.COD_' +
        'EMPLEADO'
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
      DisplayWidth = 60
      FieldKind = fkCalculated
      FieldName = 'NOMBRECLIENTECLD'
      Size = 60
      Calculated = True
    end
    object qryRepIngMasterDIRECCION_LOCAL: TIBStringField
      FieldName = 'DIRECCION_LOCAL'
      Origin = 'CLIENTES.DIRECCION_LOCAL'
      Size = 60
    end
    object qryRepIngMasterTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
    end
    object qryRepIngMasterNOTA_CREDITO: TFloatField
      FieldName = 'NOTA_CREDITO'
      Origin = 'INGRESOS.NOTA_CREDITO'
    end
    object qryRepIngMasterNOTA_DEBITO: TFloatField
      FieldName = 'NOTA_DEBITO'
      Origin = 'INGRESOS.NOTA_DEBITO'
    end
    object qryRepIngMasterOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'INGRESOS.OBSERVACION'
      Size = 40
    end
    object qryRepIngMasterCONCEPTO: TIBStringField
      FieldName = 'CONCEPTO'
      Origin = 'INGRESOS.CONCEPTO'
      Size = 40
    end
    object qryRepIngMasterNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object qryRepIngMasterMONTO_CHEQUE: TFloatField
      FieldName = 'MONTO_CHEQUE'
      Origin = 'COBROS_EN_CHEQUE.MONTO_CHEQUE'
    end
    object qryRepIngMasterNUMERO_CHEQUE: TIntegerField
      FieldName = 'NUMERO_CHEQUE'
      Origin = 'COBROS_EN_CHEQUE.NUMERO_CHEQUE'
    end
    object qryRepIngMasterTELEF_CONTACTO1: TIBStringField
      FieldName = 'TELEF_CONTACTO1'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryRepIngMasterVALOR_ING: TFloatField
      FieldName = 'VALOR_ING'
      Origin = 'INGRESOS.VALOR_ING'
    end
    object qryRepIngMasterCODIGOMONEDA: TIBStringField
      FieldName = 'CODIGOMONEDA'
      Origin = 'MONEDA.CODIGO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryRepIngMasterNUMERO_TRANSF: TIntegerField
      FieldName = 'NUMERO_TRANSF'
      Origin = 'TRANSFERENCIAS.NUMERO_TRANSF'
    end
    object qryRepIngMasterDESCUSUARIO: TIBStringField
      FieldName = 'DESCUSUARIO'
      Origin = 'USUARIO.NOMBRECOMPLETO'
      Size = 40
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
  object ibstpProcReversarCobroEst: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROCREVERSARCOBROEST'
    Left = 312
    Top = 352
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'RESULTADO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_RECIBO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODUSUARIO'
        ParamType = ptInput
      end>
  end
  object qryReciboAReversar: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select c.CODIGO_CTE, p.FECHA_PAGO, p.IDANOESCOLAR, p.NUMERO_RECI' +
        'BO, '
      'upper(c.NOMBRE_CTE) NombreEstudiante, p.STATUS'
      'From PAGOS_ESTUDIANTES p, CLIENTES c'
      'Where c.CODIGO_CTE = p.IDESTUDIANTE'
      'And p.numero_recibo=:numerorecibo')
    Left = 40
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerorecibo'
        ParamType = ptInput
      end>
    object qryReciboAReversarCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryReciboAReversarFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Origin = 'PAGOS_ESTUDIANTES.FECHA_PAGO'
      Required = True
    end
    object qryReciboAReversarIDANOESCOLAR: TIntegerField
      FieldName = 'IDANOESCOLAR'
      Origin = 'PAGOS_ESTUDIANTES.IDANOESCOLAR'
      Required = True
    end
    object qryReciboAReversarNUMERO_RECIBO: TIntegerField
      FieldName = 'NUMERO_RECIBO'
      Origin = 'PAGOS_ESTUDIANTES.NUMERO_RECIBO'
    end
    object qryReciboAReversarNOMBREESTUDIANTE: TIBStringField
      FieldName = 'NOMBREESTUDIANTE'
      Size = 60
    end
    object qryReciboAReversarSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PAGOS_ESTUDIANTES.STATUS'
      Size = 1
    end
  end
  object dsqryReciboAReversar: TDataSource
    DataSet = qryReciboAReversar
    Left = 40
    Top = 336
  end
  object tblRetencionesDgii: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from retenciones_dgii'
      'where'
      '  IDRETENCION = :OLD_IDRETENCION')
    InsertSQL.Strings = (
      'insert into retenciones_dgii'
      
        '  (IDRETENCION, FECHAINI, FECHAFINAL, PORCIENTO, DESCRIPCION, ST' +
        'ATUS)'
      'values'
      
        '  (:IDRETENCION, :FECHAINI, :FECHAFINAL, :PORCIENTO, :DESCRIPCIO' +
        'N, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  IDRETENCION,'
      '  FECHAINI,'
      '  FECHAFINAL,'
      '  PORCIENTO,'
      '  DESCRIPCION,'
      '  STATUS'
      'from retenciones_dgii '
      'where'
      '  IDRETENCION = :IDRETENCION')
    SelectSQL.Strings = (
      'Select * from retenciones_dgii'
      'where :fecha between FECHAINI and FECHAFINAL')
    ModifySQL.Strings = (
      'update retenciones_dgii'
      'set'
      '  IDRETENCION = :IDRETENCION,'
      '  FECHAINI = :FECHAINI,'
      '  FECHAFINAL = :FECHAFINAL,'
      '  PORCIENTO = :PORCIENTO,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  STATUS = :STATUS'
      'where'
      '  IDRETENCION = :OLD_IDRETENCION')
    Left = 416
    Top = 24
    object tblRetencionesDgiiIDRETENCION: TIntegerField
      FieldName = 'IDRETENCION'
      Origin = 'RETENCIONES_DGII.IDRETENCION'
      Required = True
    end
    object tblRetencionesDgiiFECHAINI: TDateTimeField
      FieldName = 'FECHAINI'
      Origin = 'RETENCIONES_DGII.FECHAINI'
    end
    object tblRetencionesDgiiFECHAFINAL: TDateTimeField
      FieldName = 'FECHAFINAL'
      Origin = 'RETENCIONES_DGII.FECHAFINAL'
    end
    object tblRetencionesDgiiPORCIENTO: TFloatField
      FieldName = 'PORCIENTO'
      Origin = 'RETENCIONES_DGII.PORCIENTO'
    end
    object tblRetencionesDgiiDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'RETENCIONES_DGII.DESCRIPCION'
      Size = 80
    end
    object tblRetencionesDgiiSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'RETENCIONES_DGII.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object tblRetencioensDgiiMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblRetencioensDgiiMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from retenciones_dgiiMaster'
      'where'
      '  NUMERO = :OLD_NUMERO and'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    InsertSQL.Strings = (
      'insert into retenciones_dgiiMaster'
      '  (NUMERO, CODIGO_CTE)'
      'values'
      '  (:NUMERO, :CODIGO_CTE)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  CODIGO_CTE'
      'from retenciones_dgiiMaster '
      'where'
      '  NUMERO = :NUMERO and'
      '  CODIGO_CTE = :CODIGO_CTE')
    SelectSQL.Strings = (
      'Select * from retenciones_dgiiMaster')
    ModifySQL.Strings = (
      'update retenciones_dgiiMaster'
      'set'
      '  NUMERO = :NUMERO,'
      '  CODIGO_CTE = :CODIGO_CTE'
      'where'
      '  NUMERO = :OLD_NUMERO and'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    Left = 416
    Top = 72
    object tblRetencioensDgiiMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'RETENCIONES_DGIIMASTER.NUMERO'
      Required = True
    end
    object tblRetencioensDgiiMasterCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'RETENCIONES_DGIIMASTER.CODIGO_CTE'
      Required = True
    end
    object tblRetencioensDgiiMasterNombreCliente: TStringField
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'NombreCliente'
      LookupDataSet = IBQryCliente
      LookupKeyFields = 'CODIGO_CTE'
      LookupResultField = 'NOMBRE_FACTURAR'
      KeyFields = 'CODIGO_CTE'
      Size = 40
      Lookup = True
    end
  end
  object tblRetencionesDgiiDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from Retenciones_dgiiDet'
      'where'
      '  IDSERIE = :OLD_IDSERIE')
    InsertSQL.Strings = (
      'insert into Retenciones_dgiiDet'
      '  (IDSERIE, NUMERO, IDRETENCION)'
      'values'
      '  (:IDSERIE, :NUMERO, :IDRETENCION)')
    RefreshSQL.Strings = (
      'Select '
      '  IDSERIE,'
      '  NUMERO,'
      '  IDRETENCION'
      'from Retenciones_dgiiDet '
      'where'
      '  IDSERIE = :IDSERIE')
    SelectSQL.Strings = (
      'Select * From Retenciones_dgiiDet'
      'Where numero=:numero')
    ModifySQL.Strings = (
      'update Retenciones_dgiiDet'
      'set'
      '  IDSERIE = :IDSERIE,'
      '  NUMERO = :NUMERO,'
      '  IDRETENCION = :IDRETENCION'
      'where'
      '  IDSERIE = :OLD_IDSERIE')
    Left = 416
    Top = 128
    object tblRetencionesDgiiDetIDSERIE: TIntegerField
      FieldName = 'IDSERIE'
      Origin = 'RETENCIONES_DGIIDET.IDSERIE'
      Required = True
    end
    object tblRetencionesDgiiDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'RETENCIONES_DGIIDET.NUMERO'
      Required = True
    end
    object tblRetencionesDgiiDetIDRETENCION: TIntegerField
      FieldName = 'IDRETENCION'
      Origin = 'RETENCIONES_DGIIDET.IDRETENCION'
    end
  end
  object dstblRetencionesDgii: TDataSource
    DataSet = tblRetencionesDgii
    Left = 528
    Top = 24
  end
  object dstblRetencioensDgiiMaster: TDataSource
    DataSet = tblRetencioensDgiiMaster
    Left = 528
    Top = 72
  end
  object dstblRetencionesDgiiDet: TDataSource
    DataSet = tblRetencionesDgiiDet
    Left = 528
    Top = 136
  end
  object qryRetencionesDgii: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from retenciones_dgii'
      'where :fecha between FECHAINI and FECHAFINAL')
    Left = 528
    Top = 216
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptUnknown
      end>
    object qryRetencionesDgiiIDRETENCION: TIntegerField
      FieldName = 'IDRETENCION'
      Origin = 'RETENCIONES_DGII.IDRETENCION'
      Required = True
    end
    object qryRetencionesDgiiFECHAINI: TDateTimeField
      FieldName = 'FECHAINI'
      Origin = 'RETENCIONES_DGII.FECHAINI'
    end
    object qryRetencionesDgiiFECHAFINAL: TDateTimeField
      FieldName = 'FECHAFINAL'
      Origin = 'RETENCIONES_DGII.FECHAFINAL'
    end
    object qryRetencionesDgiiPORCIENTO: TFloatField
      FieldName = 'PORCIENTO'
      Origin = 'RETENCIONES_DGII.PORCIENTO'
    end
    object qryRetencionesDgiiDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'RETENCIONES_DGII.DESCRIPCION'
      Size = 80
    end
    object qryRetencionesDgiiSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'RETENCIONES_DGII.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dsqryRetencionesDgii: TDataSource
    DataSet = qryRetencionesDgii
    Left = 528
    Top = 272
  end
  object qryRepIngDetalleAdicional: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qryRepIngDetalleAdicionalCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT '
      '  CLIENTES.NOMBRE_FACTURAR,'
      '  FACTURAS.FECHA,'
      '  FACTURAS.NUMERO,'
      '  CLIENTES.CANT_DIAS_CREDITO,'
      '  BALANCE_CTE.BALANCE_ACT,'
      '  TRANS_CXC.SERIE,'
      '  TRANS_CXC.NUMERO_TRN_VENTA,'
      '  TRANS_CXC.NUMERO_RECIBO'
      'FROM'
      '  FACTURAS'
      
        '  INNER JOIN CLIENTES ON (FACTURAS.CODIGO_CTE = CLIENTES.CODIGO_' +
        'CTE)'
      
        '  INNER JOIN BALANCE_CTE ON (CLIENTES.CODIGO_CTE = BALANCE_CTE.C' +
        'ODIGO)'
      
        '  INNER JOIN TRANS_CXC ON (FACTURAS.CODIGO_CTE = TRANS_CXC.CODIG' +
        'O_CLIENTE)'
      '  AND (FACTURAS.NUMERO = TRANS_CXC.NUMERO_DOC)'
      'WHERE'
      '  (FACTURAS.NUMERO =:num_fact)')
    Left = 368
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'num_fact'
        ParamType = ptInput
      end>
    object qryRepIngDetalleAdicionalNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryRepIngDetalleAdicionalFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FACTURAS.FECHA'
    end
    object qryRepIngDetalleAdicionalNUMERO: TFloatField
      FieldName = 'NUMERO'
      Origin = 'FACTURAS.NUMERO'
      Required = True
    end
    object qryRepIngDetalleAdicionalCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'CLIENTES.CANT_DIAS_CREDITO'
    end
    object qryRepIngDetalleAdicionalBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'BALANCE_CTE.BALANCE_ACT'
    end
    object qryRepIngDetalleAdicionalSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'TRANS_CXC.SERIE'
      Required = True
    end
    object qryRepIngDetalleAdicionalNUMERO_TRN_VENTA: TIntegerField
      FieldName = 'NUMERO_TRN_VENTA'
      Origin = 'TRANS_CXC.NUMERO_TRN_VENTA'
    end
    object qryRepIngDetalleAdicionalNUMERO_RECIBO: TIntegerField
      FieldName = 'NUMERO_RECIBO'
      Origin = 'TRANS_CXC.NUMERO_RECIBO'
    end
    object qryRepIngDetalleAdicionalFechaVence: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'FechaVence'
      Calculated = True
    end
  end
  object qryFactura: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select moneda, monto_pendiente MONTO_FACT From FACTURAS_PENDIENT' +
        'ES'
      'where tipo =:tipo'
      'And moneda =:MONEDA'
      'and numero_fact = :numero ')
    Left = 424
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryFacturaMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'FACTURAS_PENDIENTES.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryFacturaMONTO_FACT: TFloatField
      FieldName = 'MONTO_FACT'
      Origin = 'FACTURAS_PENDIENTES.MONTO_PENDIENTE'
    end
  end
  object tblTransferencias: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TRANSFERENCIAS'
      'where'
      '  NUMERO_TRANSF = :OLD_NUMERO_TRANSF')
    InsertSQL.Strings = (
      'insert into TRANSFERENCIAS'
      
        '  (NUMERO_TRANSF, CODIGO_CTE, CODIGO_BANCO, MONTO, NUMERO_RECIBO' +
        ', NUMERO_TRN_VTA)'
      'values'
      
        '  (:NUMERO_TRANSF, :CODIGO_CTE, :CODIGO_BANCO, :MONTO, :NUMERO_R' +
        'ECIBO, '
      '   :NUMERO_TRN_VTA)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_TRANSF,'
      '  CODIGO_CTE,'
      '  CODIGO_BANCO,'
      '  MONTO,'
      '  NUMERO_RECIBO,'
      '  NUMERO_TRN_VTA'
      'from TRANSFERENCIAS '
      'where'
      '  NUMERO_TRANSF = :NUMERO_TRANSF')
    SelectSQL.Strings = (
      'select *  from TRANSFERENCIAS'
      'where numero_transf =:numtransf')
    ModifySQL.Strings = (
      'update TRANSFERENCIAS'
      'set'
      '  NUMERO_TRANSF = :NUMERO_TRANSF,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  CODIGO_BANCO = :CODIGO_BANCO,'
      '  MONTO = :MONTO,'
      '  NUMERO_RECIBO = :NUMERO_RECIBO,'
      '  NUMERO_TRN_VTA = :NUMERO_TRN_VTA'
      'where'
      '  NUMERO_TRANSF = :OLD_NUMERO_TRANSF')
    Left = 648
    Top = 144
    object tblTransferenciasNUMERO_TRANSF: TIntegerField
      FieldName = 'NUMERO_TRANSF'
      Origin = 'TRANSFERENCIAS.NUMERO_TRANSF'
      Required = True
    end
    object tblTransferenciasCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'TRANSFERENCIAS.CODIGO_CTE'
      Required = True
    end
    object tblTransferenciasCODIGO_BANCO: TIntegerField
      FieldName = 'CODIGO_BANCO'
      Origin = 'TRANSFERENCIAS.CODIGO_BANCO'
    end
    object tblTransferenciasMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'TRANSFERENCIAS.MONTO'
    end
    object tblTransferenciasNUMERO_RECIBO: TIntegerField
      FieldName = 'NUMERO_RECIBO'
      Origin = 'TRANSFERENCIAS.NUMERO_RECIBO'
    end
    object tblTransferenciasNUMERO_TRN_VTA: TIntegerField
      FieldName = 'NUMERO_TRN_VTA'
      Origin = 'TRANSFERENCIAS.NUMERO_TRN_VTA'
    end
  end
  object tblTransf: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TRANSFERENCIAS'
      'where'
      '  NUMERO_TRANSF = :OLD_NUMERO_TRANSF')
    InsertSQL.Strings = (
      'insert into TRANSFERENCIAS'
      
        '  (NUMERO_TRANSF, CODIGO_CTE, CODIGO_BANCO, MONTO, NUMERO_RECIBO' +
        ', NUMERO_TRN_VTA)'
      'values'
      
        '  (:NUMERO_TRANSF, :CODIGO_CTE, :CODIGO_BANCO, :MONTO, :NUMERO_R' +
        'ECIBO, '
      '   :NUMERO_TRN_VTA)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_TRANSF,'
      '  CODIGO_CTE,'
      '  CODIGO_BANCO,'
      '  MONTO,'
      '  NUMERO_RECIBO,'
      '  NUMERO_TRN_VTA'
      'from TRANSFERENCIAS '
      'where'
      '  NUMERO_TRANSF = :NUMERO_TRANSF')
    SelectSQL.Strings = (
      'Select * From TRANSFERENCIAS'
      'Where  CODIGO_CTE=:codigocte')
    ModifySQL.Strings = (
      'update TRANSFERENCIAS'
      'set'
      '  NUMERO_TRANSF = :NUMERO_TRANSF,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  CODIGO_BANCO = :CODIGO_BANCO,'
      '  MONTO = :MONTO,'
      '  NUMERO_RECIBO = :NUMERO_RECIBO,'
      '  NUMERO_TRN_VTA = :NUMERO_TRN_VTA'
      'where'
      '  NUMERO_TRANSF = :OLD_NUMERO_TRANSF')
    Left = 648
    Top = 208
    object tblTransfNUMERO_TRANSF: TIntegerField
      FieldName = 'NUMERO_TRANSF'
      Origin = 'TRANSFERENCIAS.NUMERO_TRANSF'
      Required = True
    end
    object tblTransfCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'TRANSFERENCIAS.CODIGO_CTE'
      Required = True
    end
    object tblTransfCODIGO_BANCO: TIntegerField
      FieldName = 'CODIGO_BANCO'
      Origin = 'TRANSFERENCIAS.CODIGO_BANCO'
    end
    object tblTransfMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'TRANSFERENCIAS.MONTO'
    end
    object tblTransfNUMERO_RECIBO: TIntegerField
      FieldName = 'NUMERO_RECIBO'
      Origin = 'TRANSFERENCIAS.NUMERO_RECIBO'
    end
    object tblTransfNUMERO_TRN_VTA: TIntegerField
      FieldName = 'NUMERO_TRN_VTA'
      Origin = 'TRANSFERENCIAS.NUMERO_TRN_VTA'
    end
  end
end
