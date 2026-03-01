object dmVentas: TdmVentas
  OldCreateOrder = False
  Left = 468
  Top = 117
  Height = 418
  Width = 368
  object tblVentasMast: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterInsert = tblVentasMastAfterInsert
    AfterScroll = tblVentasMastAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from VENTAS_MAST'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into VENTAS_MAST'
      
        '  (NUMERO, FECHA, CODIGO_CTE, CODIGO_VENDEDOR, FORMA_PAGO, OBSER' +
        'VACION, '
      
        '   MONEDA, VALOR_TOTAL_DET, STATUS, FECHA_IN, IN_POR, FECHA_MOD,' +
        ' MOD_POR, '
      '   NUMERO_FACTURA, NUMERO_DOC_PAGO)'
      'values'
      
        '  (:NUMERO, :FECHA, :CODIGO_CTE, :CODIGO_VENDEDOR, :FORMA_PAGO, ' +
        ':OBSERVACION, '
      
        '   :MONEDA, :VALOR_TOTAL_DET, :STATUS, :FECHA_IN, :IN_POR, :FECH' +
        'A_MOD, '
      '   :MOD_POR, :NUMERO_FACTURA, :NUMERO_DOC_PAGO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA,'
      '  CODIGO_CTE,'
      '  CODIGO_VENDEDOR,'
      '  FORMA_PAGO,'
      '  OBSERVACION,'
      '  MONEDA,'
      '  VALOR_TOTAL_DET,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  NUMERO_FACTURA,'
      '  NUMERO_DOC_PAGO'
      'from VENTAS_MAST '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'select * from VENTAS_MAST'
      'Where Fecha Between :fechaini and :fechafin'
      'and Status in (:statusA, :StatusB, :StatusC)'
      '')
    ModifySQL.Strings = (
      'update VENTAS_MAST'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  CODIGO_VENDEDOR = :CODIGO_VENDEDOR,'
      '  FORMA_PAGO = :FORMA_PAGO,'
      '  OBSERVACION = :OBSERVACION,'
      '  MONEDA = :MONEDA,'
      '  VALOR_TOTAL_DET = :VALOR_TOTAL_DET,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  NUMERO_FACTURA = :NUMERO_FACTURA,'
      '  NUMERO_DOC_PAGO = :NUMERO_DOC_PAGO'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_NUM_VENTA_MAST'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 232
    Top = 63
    object tblVentasMastNUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object tblVentasMastFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object tblVentasMastCODIGO_CTE: TIntegerField
      DisplayLabel = 'Codigo Cliente'
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST.CODIGO_CTE'
    end
    object tblVentasMastOBSERVACION: TIBStringField
      DisplayLabel = 'Observacion'
      FieldName = 'OBSERVACION'
      Origin = 'VENTAS_MAST.OBSERVACION'
      Size = 60
    end
    object tblVentasMastMONEDA: TIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Origin = 'VENTAS_MAST.MONEDA'
      FixedChar = True
      Size = 1
    end
    object tblVentasMastVALOR_TOTAL_DET: TFloatField
      DisplayLabel = 'Valor Total '
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST.VALOR_TOTAL_DET'
      DisplayFormat = ',0.00'
    end
    object tblVentasMastSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'VENTAS_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblVentasMastFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_MAST.FECHA_IN'
    end
    object tblVentasMastIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_MAST.IN_POR'
      Size = 12
    end
    object tblVentasMastFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_MAST.FECHA_MOD'
    end
    object tblVentasMastMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_MAST.MOD_POR'
      Size = 12
    end
    object tblVentasMastFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VENTAS_MAST.FORMA_PAGO'
    end
    object tblVentasMastNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST.NUMERO_FACTURA'
    end
    object tblVentasMastCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VENTAS_MAST.CODIGO_VENDEDOR'
    end
    object tblVentasMastNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VENTAS_MAST.NUMERO_DOC_PAGO'
    end
  end
  object tblVentasDetalle: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BeforePost = tblVentasDetalleBeforePost
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from VENTAS_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into VENTAS_DET'
      
        '  (SERIE, NUMERO, CODIGO_PROD, CODIGO_BARRA, DESCRIPCION, CANTID' +
        'AD, PRECIO, '
      
        '   PORC_DESC_DET, ITBI_DET, VALOR_SERVICIO_DET, VALOR_TOTAL_DET,' +
        ' NUM_FACTURA, '
      
        '   STATUS_DET, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, CANT_REGRES' +
        'O, CANT_PROMO, '
      '   MONTO_DIETA, MONTO_AJUSTE)'
      'values'
      
        '  (:SERIE, :NUMERO, :CODIGO_PROD, :CODIGO_BARRA, :DESCRIPCION, :' +
        'CANTIDAD, '
      
        '   :PRECIO, :PORC_DESC_DET, :ITBI_DET, :VALOR_SERVICIO_DET, :VAL' +
        'OR_TOTAL_DET, '
      
        '   :NUM_FACTURA, :STATUS_DET, :FECHA_IN, :IN_POR, :FECHA_MOD, :M' +
        'OD_POR, '
      '   :CANT_REGRESO, :CANT_PROMO, :MONTO_DIETA, :MONTO_AJUSTE)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  CODIGO_PROD,'
      '  CODIGO_BARRA,'
      '  DESCRIPCION,'
      '  CANTIDAD,'
      '  PRECIO,'
      '  PORC_DESC_DET,'
      '  ITBI_DET,'
      '  VALOR_SERVICIO_DET,'
      '  VALOR_TOTAL_DET,'
      '  NUM_FACTURA,'
      '  STATUS_DET,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  CANT_REGRESO,'
      '  CANT_PROMO,'
      '  MONTO_DIETA,'
      '  MONTO_AJUSTE'
      'from VENTAS_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select * from VENTAS_DET'
      'where NUMERO =:numero')
    ModifySQL.Strings = (
      'update VENTAS_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  CODIGO_BARRA = :CODIGO_BARRA,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO = :PRECIO,'
      '  PORC_DESC_DET = :PORC_DESC_DET,'
      '  ITBI_DET = :ITBI_DET,'
      '  VALOR_SERVICIO_DET = :VALOR_SERVICIO_DET,'
      '  VALOR_TOTAL_DET = :VALOR_TOTAL_DET,'
      '  NUM_FACTURA = :NUM_FACTURA,'
      '  STATUS_DET = :STATUS_DET,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  CANT_REGRESO = :CANT_REGRESO,'
      '  CANT_PROMO = :CANT_PROMO,'
      '  MONTO_DIETA = :MONTO_DIETA,'
      '  MONTO_AJUSTE = :MONTO_AJUSTE'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_NUM_VENTA_DET'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 136
    Top = 63
    object tblVentasDetalleSERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET.SERIE'
      Required = True
    end
    object tblVentasDetalleNUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
      Origin = 'VENTAS_DET.NUMERO'
      Required = True
    end
    object tblVentasDetalleCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object tblVentasDetalleCODIGO_BARRA: TIBStringField
      DisplayLabel = 'Codigo Barra'
      FieldName = 'CODIGO_BARRA'
      Origin = 'VENTAS_DET.CODIGO_BARRA'
    end
    object tblVentasDetalleDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 60
    end
    object tblVentasDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET.PRECIO'
      DisplayFormat = ',0.00'
    end
    object tblVentasDetalleCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET.CANTIDAD'
    end
    object tblVentasDetallePORC_DESC_DET: TFloatField
      DisplayLabel = '%Descuento'
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET.PORC_DESC_DET'
      DisplayFormat = ',0.00'
    end
    object tblVentasDetalleITBI_DET: TFloatField
      DisplayLabel = 'Itbi'
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET.ITBI_DET'
      DisplayFormat = ',0.00'
    end
    object tblVentasDetalleVALOR_SERVICIO_DET: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET.VALOR_SERVICIO_DET'
      DisplayFormat = ',0.00'
    end
    object tblVentasDetalleVALOR_TOTAL_DET: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_DET.VALOR_TOTAL_DET'
      DisplayFormat = ',0.00'
    end
    object tblVentasDetalleNUM_FACTURA: TFloatField
      DisplayLabel = '# Factura'
      FieldName = 'NUM_FACTURA'
      Origin = 'VENTAS_DET.NUM_FACTURA'
    end
    object tblVentasDetalleSTATUS_DET: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object tblVentasDetalleFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_DET.FECHA_IN'
    end
    object tblVentasDetalleIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_DET.IN_POR'
      Size = 12
    end
    object tblVentasDetalleFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_DET.FECHA_MOD'
    end
    object tblVentasDetalleMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_DET.MOD_POR'
      Size = 12
    end
    object tblVentasDetalleCANT_REGRESO: TFloatField
      DisplayLabel = 'CantRegreso'
      FieldName = 'CANT_REGRESO'
      Origin = 'VENTAS_DET.CANT_REGRESO'
      DisplayFormat = ',0.00'
    end
    object tblVentasDetalleCANT_PROMO: TFloatField
      DisplayLabel = 'CantPromo'
      FieldName = 'CANT_PROMO'
      Origin = 'VENTAS_DET.CANT_PROMO'
      DisplayFormat = ',0.00'
    end
    object tblVentasDetalleMONTO_DIETA: TFloatField
      DisplayLabel = 'MontoDieta'
      FieldName = 'MONTO_DIETA'
      Origin = 'VENTAS_DET.MONTO_DIETA'
      DisplayFormat = ',0.00'
    end
    object tblVentasDetalleMONTO_AJUSTE: TFloatField
      DisplayLabel = 'MontoAjuste'
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VENTAS_DET.MONTO_AJUSTE'
      DisplayFormat = ',0.00'
    end
  end
  object dsVentasDetalle: TDataSource
    DataSet = tblVentasDetalle
    Left = 136
    Top = 119
  end
  object dsVentasMast: TDataSource
    DataSet = tblVentasMast
    Left = 232
    Top = 119
  end
  object IBUpdateSQL2: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA,'
      '  CODIGO_CTE,'
      '  OBSERVACION,'
      '  MONEDA,'
      '  VALOR_TOTAL_DET,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from VENTAS_MAST '
      'where'
      '  NUMERO = :NUMERO')
    ModifySQL.Strings = (
      'update VENTAS_MAST'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  OBSERVACION = :OBSERVACION,'
      '  MONEDA = :MONEDA,'
      '  VALOR_TOTAL_DET = :VALOR_TOTAL_DET,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into VENTAS_MAST'
      
        '  (NUMERO, FECHA, CODIGO_CTE, OBSERVACION, MONEDA, VALOR_TOTAL_D' +
        'ET, STATUS, '
      '   FECHA_IN, IN_POR, FECHA_MOD, MOD_POR)'
      'values'
      
        '  (:NUMERO, :FECHA, :CODIGO_CTE, :OBSERVACION, :MONEDA, :VALOR_T' +
        'OTAL_DET, '
      '   :STATUS, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR)')
    DeleteSQL.Strings = (
      'delete from VENTAS_MAST'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 136
    Top = 13
  end
  object qryClientes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select CODIGO_CTE, '
      'NOMBRE_CTE, '
      'CIUDAD, '
      'DIRECCION_CONT, '
      'NOMBRE_FACTURAR, '
      'PAIS, RNC_NUMERO,'
      'TELEF_CONTACTO, '
      'Foto from CLIENTES'
      'order by NOMBRE_FACTURAR, codigo_cte')
    Left = 232
    Top = 167
    object qryClientesCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryClientesNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 30
    end
    object qryClientesCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryClientesDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryClientesNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryClientesPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryClientesTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryClientesFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'CLIENTES.FOTO'
      Size = 8
    end
    object qryClientesRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
  end
  object dsqryClientes: TDataSource
    DataSet = qryClientes
    Left = 232
    Top = 215
  end
  object qryitbi: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT  * FROM ITBI'
      'WHERE  :fecha BETWEEN fecha_ini AND fecha_fin')
    Left = 40
    Top = 69
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end>
    object qryitbiFECHA_INI: TDateTimeField
      FieldName = 'FECHA_INI'
      Origin = 'ITBI.FECHA_INI'
      Required = True
    end
    object qryitbiFECHA_FIN: TDateTimeField
      FieldName = 'FECHA_FIN'
      Origin = 'ITBI.FECHA_FIN'
      Required = True
    end
    object qryitbiPORCIENTO: TFloatField
      FieldName = 'PORCIENTO'
      Origin = 'ITBI.PORCIENTO'
    end
    object qryitbiOBSERVACIONES: TIBStringField
      FieldName = 'OBSERVACIONES'
      Origin = 'ITBI.OBSERVACIONES'
      Size = 40
    end
    object qryitbiSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ITBI.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dsqryitbi: TDataSource
    DataSet = qryitbi
    Left = 40
    Top = 116
  end
  object tblDoc_tran_cxc: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DOC_TRAN_CXT'
    Left = 136
    Top = 167
    object tblDoc_tran_cxcCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tblDoc_tran_cxcCODIGO_ABR: TIBStringField
      FieldName = 'CODIGO_ABR'
      Size = 6
    end
    object tblDoc_tran_cxcDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object dstblDoc_tran_cxc: TDataSource
    DataSet = tblDoc_tran_cxc
    Left = 136
    Top = 215
  end
  object TblFormaPago: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_PAGO'
    Left = 40
    Top = 163
    object TblFormaPagoCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object TblFormaPagoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 15
    end
    object TblFormaPagoORIGEN: TSmallintField
      FieldName = 'ORIGEN'
    end
  end
  object dsTblFormaPago: TDataSource
    DataSet = TblFormaPago
    Left = 41
    Top = 215
  end
  object IBUpdateSQL1: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  CODIGO_PROD,'
      '  CODIGO_BARRA,'
      '  DESCRIPCION,'
      '  CANTIDAD,'
      '  PRECIO,'
      '  PORC_DESC_DET,'
      '  ITBI_DET,'
      '  VALOR_SERVICIO_DET,'
      '  VALOR_TOTAL_DET,'
      '  NUM_FACTURA,'
      '  STATUS_DET,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from VENTAS_DET '
      'where'
      '  SERIE = :SERIE and'
      '  NUMERO = :NUMERO')
    ModifySQL.Strings = (
      'update VENTAS_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  CODIGO_BARRA = :CODIGO_BARRA,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO = :PRECIO,'
      '  PORC_DESC_DET = :PORC_DESC_DET,'
      '  ITBI_DET = :ITBI_DET,'
      '  VALOR_SERVICIO_DET = :VALOR_SERVICIO_DET,'
      '  VALOR_TOTAL_DET = :VALOR_TOTAL_DET,'
      '  NUM_FACTURA = :NUM_FACTURA,'
      '  STATUS_DET = :STATUS_DET,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into VENTAS_DET'
      
        '  (SERIE, NUMERO, CODIGO_PROD, CODIGO_BARRA, DESCRIPCION, CANTID' +
        'AD, PRECIO, '
      
        '   PORC_DESC_DET, ITBI_DET, VALOR_SERVICIO_DET, VALOR_TOTAL_DET,' +
        ' NUM_FACTURA, '
      '   STATUS_DET, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR)'
      'values'
      
        '  (:SERIE, :NUMERO, :CODIGO_PROD, :CODIGO_BARRA, :DESCRIPCION, :' +
        'CANTIDAD, '
      
        '   :PRECIO, :PORC_DESC_DET, :ITBI_DET, :VALOR_SERVICIO_DET, :VAL' +
        'OR_TOTAL_DET, '
      
        '   :NUM_FACTURA, :STATUS_DET, :FECHA_IN, :IN_POR, :FECHA_MOD, :M' +
        'OD_POR)')
    DeleteSQL.Strings = (
      'delete from VENTAS_DET'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  NUMERO = :OLD_NUMERO')
    Left = 40
    Top = 20
  end
  object GenNumFactura: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'SELECT PROXIMO_NUM '
      'FROM VIEW_GEN_NUM_FACT')
    Transaction = dmConectar.IBTransaction1
    Left = 136
    Top = 265
  end
  object IBStoredProc1: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_ACTUALIZAINVENTARIO'
    Left = 40
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO_PRODUCTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUEVACANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPOTRN'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'PORCODIGO'
        ParamType = ptInput
      end>
  end
  object qryProveedor: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select CODIGO_CTE, '
      'descripcion NOMBRE_CTE, '
      'CIUDAD, '
      'CALYYNUM DIRECCION_CONT, '
      'descripcion NOMBRE_FACTURAR, '
      'PAIS, null RNC_NUMERO,'
      'telefono TELEF_CONTACTO'
      'From  PROVEEDORES'
      'Where codigo_cte = :codigocliente')
    Left = 232
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigocliente'
        ParamType = ptInput
      end>
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 30
    end
    object IBStringField2: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object IBStringField3: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object IBStringField4: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object IBStringField5: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object IBStringField6: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object IBStringField7: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
  end
end
