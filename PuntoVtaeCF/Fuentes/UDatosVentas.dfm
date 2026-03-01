object dmVentas: TdmVentas
  OldCreateOrder = False
  Left = 205
  Top = 117
  Height = 603
  Width = 852
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
      
        '  (NUMERO, FECHA, CIA_KEY, CODIGO_CTE, CODIGO_VENDEDOR, FORMA_PA' +
        'GO, OBSERVACION, '
      
        '   MONEDA, VALOR_TOTAL_DET, STATUS, FECHA_IN, IN_POR, FECHA_MOD,' +
        ' MOD_POR, '
      '   NUMERO_FACTURA, NUMERO_DOC_PAGO, COD_USR_CAJA)'
      'values'
      
        '  (:NUMERO, :FECHA, :CIA_KEY, :CODIGO_CTE, :CODIGO_VENDEDOR, :FO' +
        'RMA_PAGO, '
      
        '   :OBSERVACION, :MONEDA, :VALOR_TOTAL_DET, :STATUS, :FECHA_IN, ' +
        ':IN_POR, '
      
        '   :FECHA_MOD, :MOD_POR, :NUMERO_FACTURA, :NUMERO_DOC_PAGO, :COD' +
        '_USR_CAJA)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA,'
      '  CIA_KEY,'
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
      '  NUMERO_DOC_PAGO,'
      '  SERIE_NCF_ASIGNADO,'
      '  MONTO_BRUTO,'
      '  PORC_DESCUENTO,'
      '  MONTO_DESCUENTO,'
      '  MONTO_INICIAL,'
      '  NOMBRE_CLIENTE_GENERAL,'
      '  MONTO_PAGADO,'
      '  MONTO_CAMBIO,'
      '  MONTO_TOTAL_ITBIS,'
      '  MONTODESCGASTOSADMIN,'
      '  MONTODESCITBISGASTOSADMIN,'
      '  MONTODESCTRANSP,'
      '  MONTODESCDIRTECNICA,'
      '  MONTODESCITBISDIRTECNICA,'
      '  MONTODESCIMPREVISTO,'
      '  MONTODESCITBISIMPREVISTO,'
      '  DESC_MONTO_COMBUSTIBLE,'
      '  DESC_MONTO_PRESTAMO,'
      '  DESC_MONTO_SINDICATO,'
      '  DESC_IMP_SOBRE_RENTA,'
      '  DESC_OTROS,'
      '  PORC_DESC_SINDICATO,'
      '  PORC_DESC_IMP_SOBRE_RENTA,'
      '  DESC_RUTA,'
      '  OTROS_DESCUENTOS_2,'
      '  OTROS_DESCUENTOS_3,'
      '  MONTO_DESC_CHOFER,'
      '  TIPO_VENTA,'
      '  COMENTARIO,'
      '  COTIZACION_ORIGEN,'
      '  REFERENCIACTE,'
      '  MONTO_RECARGO,'
      '  TIPONCFIFISCAL,'
      '  MONTO_EXONERADO_ITBIS,'
      '  NIF_IMPRESO,'
      '  IDRETENCION,'
      '  PORCPROPINALEGAL,'
      '  PROPINA,'
      '  PROPINALEGAL,'
      '  TICKET_ID,'
      '  SUB_TOTALITBIS,'
      '  COD_USR_CAJA'
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
      '  CIA_KEY = :CIA_KEY,'
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
      '  NUMERO_DOC_PAGO = :NUMERO_DOC_PAGO,'
      '  COD_USR_CAJA = :COD_USR_CAJA'
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
    object tblVentasMastCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VENTAS_MAST.CIA_KEY'
    end
    object tblVentasMastCOD_USR_CAJA: TIntegerField
      FieldName = 'COD_USR_CAJA'
      Origin = 'VENTAS_MAST.COD_USR_CAJA'
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
      
        'SELECT  t.fechafin fecha_fin, t.fechaini fecha_ini,  iif(i.PAGA_' +
        'ITBI = 1,i.IDTASAITBIS,1) IDTASAITBIS, iif(i.PAGA_ITBI = 1,t.POR' +
        'CIENTO,0) PORCIENTO, i.PAGA_ITBI,'
      
        'iif(i.PAGA_ITBI = 1,t.DESCRIPCION,'#39'Exento'#39') observaciones, t.sta' +
        'tus, t.simbolo_tasa'
      'FROM INVENTARIO_PRODUCTO i, tasa_itbis t'
      'Where i.IDTASAITBIS = t.IDTASAITBIS'
      'And i.CODIGO =:codigo'
      'And :fecha BETWEEN t.fechaini AND t.fechafin ')
    Left = 40
    Top = 69
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end>
    object qryitbiFECHA_FIN: TDateTimeField
      FieldName = 'FECHA_FIN'
      Origin = 'TASA_ITBIS.FECHAFIN'
      Required = True
    end
    object qryitbiFECHA_INI: TDateTimeField
      FieldName = 'FECHA_INI'
      Origin = 'TASA_ITBIS.FECHAINI'
      Required = True
    end
    object qryitbiIDTASAITBIS: TSmallintField
      FieldName = 'IDTASAITBIS'
      Origin = 'INVENTARIO_PRODUCTO.IDTASAITBIS'
    end
    object qryitbiPORCIENTO: TFloatField
      FieldName = 'PORCIENTO'
      Origin = 'TASA_ITBIS.PORCIENTO'
    end
    object qryitbiOBSERVACIONES: TIBStringField
      FieldName = 'OBSERVACIONES'
      Origin = 'TASA_ITBIS.DESCRIPCION'
    end
    object qryitbiSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TASA_ITBIS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryitbiSIMBOLO_TASA: TIBStringField
      FieldName = 'SIMBOLO_TASA'
      Origin = 'TASA_ITBIS.SIMBOLO_TASA'
      FixedChar = True
      Size = 6
    end
    object qryitbiPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
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
  object tblRegServicioDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DETALLE_SERVICIO'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into DETALLE_SERVICIO'
      
        '  (SERIE, NUMERO, FECHA, COD_SERVICIO, CANT, VALOR_SERVICIO, POR' +
        'C_ITBIS, '
      
        '   PORC_DESC, VALOR_ITBIS, VALOR_DESCUENTO, DESCRIPCION, STATUS,' +
        ' IN_POR, '
      
        '   FECHA_IN, UPDATE_POR, FECHA_UPDATE, COD_USUARIO, PRECIO, DESC' +
        'RIPCIONESPECIAL)'
      'values'
      
        '  (:SERIE, :NUMERO, :FECHA, :COD_SERVICIO, :CANT, :VALOR_SERVICI' +
        'O, :PORC_ITBIS, '
      
        '   :PORC_DESC, :VALOR_ITBIS, :VALOR_DESCUENTO, :DESCRIPCION, :ST' +
        'ATUS, :IN_POR, '
      
        '   :FECHA_IN, :UPDATE_POR, :FECHA_UPDATE, :COD_USUARIO, :PRECIO,' +
        ' :DESCRIPCIONESPECIAL)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  FECHA,'
      '  COD_SERVICIO,'
      '  CANT,'
      '  VALOR_SERVICIO,'
      '  PORC_ITBIS,'
      '  PORC_DESC,'
      '  VALOR_ITBIS,'
      '  VALOR_DESCUENTO,'
      '  DESCRIPCION,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  UPDATE_POR,'
      '  FECHA_UPDATE,'
      '  COD_USUARIO,'
      '  PRECIO,'
      '  DESCRIPCIONESPECIAL'
      'from DETALLE_SERVICIO '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select *  From DETALLE_SERVICIO'
      'where numero =:numero')
    ModifySQL.Strings = (
      'update DETALLE_SERVICIO'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  COD_SERVICIO = :COD_SERVICIO,'
      '  CANT = :CANT,'
      '  VALOR_SERVICIO = :VALOR_SERVICIO,'
      '  PORC_ITBIS = :PORC_ITBIS,'
      '  PORC_DESC = :PORC_DESC,'
      '  VALOR_ITBIS = :VALOR_ITBIS,'
      '  VALOR_DESCUENTO = :VALOR_DESCUENTO,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  UPDATE_POR = :UPDATE_POR,'
      '  FECHA_UPDATE = :FECHA_UPDATE,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  PRECIO = :PRECIO,'
      '  DESCRIPCIONESPECIAL = :DESCRIPCIONESPECIAL'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 360
    Top = 168
    object tblRegServicioDetNUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
      Origin = 'DETALLE_SERVICIO.NUMERO'
      Required = True
    end
    object tblRegServicioDetSERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'DETALLE_SERVICIO.SERIE'
      Required = True
    end
    object tblRegServicioDetFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'DETALLE_SERVICIO.FECHA'
    end
    object tblRegServicioDetCOD_SERVICIO: TIntegerField
      DisplayLabel = 'CodServicio'
      FieldName = 'COD_SERVICIO'
      Origin = 'DETALLE_SERVICIO.COD_SERVICIO'
    end
    object tblRegServicioDetCANT: TFloatField
      DisplayLabel = 'Cant'
      FieldName = 'CANT'
      Origin = 'DETALLE_SERVICIO.CANT'
    end
    object tblRegServicioDetVALOR_SERVICIO: TFloatField
      DisplayLabel = 'Valor Servicio'
      FieldName = 'VALOR_SERVICIO'
      Origin = 'DETALLE_SERVICIO.VALOR_SERVICIO'
    end
    object tblRegServicioDetPORC_ITBIS: TFloatField
      FieldName = 'PORC_ITBIS'
      Origin = 'DETALLE_SERVICIO.PORC_ITBIS'
    end
    object tblRegServicioDetPORC_DESC: TFloatField
      FieldName = 'PORC_DESC'
      Origin = 'DETALLE_SERVICIO.PORC_DESC'
    end
    object tblRegServicioDetVALOR_ITBIS: TFloatField
      FieldName = 'VALOR_ITBIS'
      Origin = 'DETALLE_SERVICIO.VALOR_ITBIS'
    end
    object tblRegServicioDetVALOR_DESCUENTO: TFloatField
      FieldName = 'VALOR_DESCUENTO'
      Origin = 'DETALLE_SERVICIO.VALOR_DESCUENTO'
    end
    object tblRegServicioDetDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'DETALLE_SERVICIO.DESCRIPCION'
      Size = 60
    end
    object tblRegServicioDetSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'DETALLE_SERVICIO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblRegServicioDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DETALLE_SERVICIO.IN_POR'
      Size = 12
    end
    object tblRegServicioDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DETALLE_SERVICIO.FECHA_IN'
    end
    object tblRegServicioDetUPDATE_POR: TIBStringField
      FieldName = 'UPDATE_POR'
      Origin = 'DETALLE_SERVICIO.UPDATE_POR'
      Size = 12
    end
    object tblRegServicioDetFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'DETALLE_SERVICIO.FECHA_UPDATE'
    end
    object tblRegServicioDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'DETALLE_SERVICIO.COD_USUARIO'
    end
    object tblRegServicioDetPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'DETALLE_SERVICIO.PRECIO'
      DisplayFormat = ',0.00'
    end
    object tblRegServicioDetDESCRIPCIONESPECIAL: TMemoField
      FieldName = 'DESCRIPCIONESPECIAL'
      Origin = 'DETALLE_SERVICIO.DESCRIPCIONESPECIAL'
      BlobType = ftMemo
      Size = 8
    end
  end
  object tblRegServicioMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblRegServicioMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from SERVICIOS_MASTER'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into SERVICIOS_MASTER'
      
        '  (NUMERO, FECHA_ENTRADA, FECHA_SALIDA, LAVADO, PLANCHADO, NOMBR' +
        'E_CLIENTE, '
      
        '   MONTO_TOTAL, COD_USUARIO, STATUS, MONTO_RECIBIDO, MONTO_DEVUE' +
        'LTO, CODIGO_EMP, '
      '   CODIGO_CTE, NUM_TRNVENTA, FECHA_ESTIMADA_ENTREGA)'
      'values'
      
        '  (:NUMERO, :FECHA_ENTRADA, :FECHA_SALIDA, :LAVADO, :PLANCHADO, ' +
        ':NOMBRE_CLIENTE, '
      
        '   :MONTO_TOTAL, :COD_USUARIO, :STATUS, :MONTO_RECIBIDO, :MONTO_' +
        'DEVUELTO, '
      
        '   :CODIGO_EMP, :CODIGO_CTE, :NUM_TRNVENTA, :FECHA_ESTIMADA_ENTR' +
        'EGA)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA_ENTRADA,'
      '  FECHA_SALIDA,'
      '  LAVADO,'
      '  PLANCHADO,'
      '  NOMBRE_CLIENTE,'
      '  MONTO_TOTAL,'
      '  COD_USUARIO,'
      '  STATUS,'
      '  MONTO_RECIBIDO,'
      '  MONTO_DEVUELTO,'
      '  CODIGO_EMP,'
      '  CODIGO_CTE,'
      '  NUM_TRNVENTA,'
      '  FECHA_ESTIMADA_ENTREGA'
      'from SERVICIOS_MASTER '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select  * From SERVICIOS_MASTER'
      'Where (fecha_entrada >=:fechaentrada)'
      'And (fecha_salida <=:fechasalida)'
      'And (Status =:Status)'
      '')
    ModifySQL.Strings = (
      'update SERVICIOS_MASTER'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA_ENTRADA = :FECHA_ENTRADA,'
      '  FECHA_SALIDA = :FECHA_SALIDA,'
      '  LAVADO = :LAVADO,'
      '  PLANCHADO = :PLANCHADO,'
      '  NOMBRE_CLIENTE = :NOMBRE_CLIENTE,'
      '  MONTO_TOTAL = :MONTO_TOTAL,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  STATUS = :STATUS,'
      '  MONTO_RECIBIDO = :MONTO_RECIBIDO,'
      '  MONTO_DEVUELTO = :MONTO_DEVUELTO,'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  NUM_TRNVENTA = :NUM_TRNVENTA,'
      '  FECHA_ESTIMADA_ENTREGA = :FECHA_ESTIMADA_ENTREGA'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 360
    Top = 64
    object tblRegServicioMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'SERVICIOS_MASTER.NUMERO'
      Required = True
    end
    object tblRegServicioMasterFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'SERVICIOS_MASTER.FECHA_ENTRADA'
      Required = True
    end
    object tblRegServicioMasterFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'SERVICIOS_MASTER.FECHA_SALIDA'
      Required = True
    end
    object tblRegServicioMasterLAVADO: TSmallintField
      FieldName = 'LAVADO'
      Origin = 'SERVICIOS_MASTER.LAVADO'
    end
    object tblRegServicioMasterPLANCHADO: TSmallintField
      FieldName = 'PLANCHADO'
      Origin = 'SERVICIOS_MASTER.PLANCHADO'
    end
    object tblRegServicioMasterNOMBRE_CLIENTE: TIBStringField
      FieldName = 'NOMBRE_CLIENTE'
      Origin = 'SERVICIOS_MASTER.NOMBRE_CLIENTE'
      Size = 60
    end
    object tblRegServicioMasterMONTO_TOTAL: TFloatField
      FieldName = 'MONTO_TOTAL'
      Origin = 'SERVICIOS_MASTER.MONTO_TOTAL'
    end
    object tblRegServicioMasterCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'SERVICIOS_MASTER.COD_USUARIO'
    end
    object tblRegServicioMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'SERVICIOS_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblRegServicioMasterMONTO_RECIBIDO: TFloatField
      DisplayLabel = 'Monto Recibido'
      FieldName = 'MONTO_RECIBIDO'
      Origin = 'SERVICIOS_MASTER.MONTO_RECIBIDO'
    end
    object tblRegServicioMasterMONTO_DEVUELTO: TFloatField
      DisplayLabel = 'Monto Devuelto'
      FieldName = 'MONTO_DEVUELTO'
      Origin = 'SERVICIOS_MASTER.MONTO_DEVUELTO'
    end
    object tblRegServicioMasterCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'SERVICIOS_MASTER.CODIGO_EMP'
    end
    object tblRegServicioMasterCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'SERVICIOS_MASTER.CODIGO_CTE'
    end
    object tblRegServicioMasterNUM_TRNVENTA: TIntegerField
      FieldName = 'NUM_TRNVENTA'
      Origin = 'SERVICIOS_MASTER.NUM_TRNVENTA'
    end
    object tblRegServicioMasterFECHA_ESTIMADA_ENTREGA: TDateTimeField
      FieldName = 'FECHA_ESTIMADA_ENTREGA'
      Origin = 'SERVICIOS_MASTER.FECHA_ESTIMADA_ENTREGA'
    end
  end
  object dstblRegServicioMaster: TDataSource
    DataSet = tblRegServicioMaster
    Left = 360
    Top = 117
  end
  object dstblRegServicioDet: TDataSource
    DataSet = tblRegServicioDet
    Left = 362
    Top = 216
  end
  object qryRegServMasterRep: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRegServMasterRepAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  * From SERVICIOS_MASTER'
      'Where numero=:numero')
    Left = 360
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryRegServMasterRepNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'SERVICIOS_MASTER.NUMERO'
      Required = True
    end
    object qryRegServMasterRepFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'SERVICIOS_MASTER.FECHA_ENTRADA'
      Required = True
    end
    object qryRegServMasterRepFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'SERVICIOS_MASTER.FECHA_SALIDA'
      Required = True
    end
    object qryRegServMasterRepLAVADO: TSmallintField
      FieldName = 'LAVADO'
      Origin = 'SERVICIOS_MASTER.LAVADO'
    end
    object qryRegServMasterRepPLANCHADO: TSmallintField
      FieldName = 'PLANCHADO'
      Origin = 'SERVICIOS_MASTER.PLANCHADO'
    end
    object qryRegServMasterRepNOMBRE_CLIENTE: TIBStringField
      FieldName = 'NOMBRE_CLIENTE'
      Origin = 'SERVICIOS_MASTER.NOMBRE_CLIENTE'
      Size = 60
    end
    object qryRegServMasterRepMONTO_TOTAL: TFloatField
      FieldName = 'MONTO_TOTAL'
      Origin = 'SERVICIOS_MASTER.MONTO_TOTAL'
    end
    object qryRegServMasterRepCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'SERVICIOS_MASTER.COD_USUARIO'
    end
    object qryRegServMasterRepSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'SERVICIOS_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRegServMasterRepMONTO_RECIBIDO: TFloatField
      FieldName = 'MONTO_RECIBIDO'
      Origin = 'SERVICIOS_MASTER.MONTO_RECIBIDO'
    end
    object qryRegServMasterRepMONTO_DEVUELTO: TFloatField
      FieldName = 'MONTO_DEVUELTO'
      Origin = 'SERVICIOS_MASTER.MONTO_DEVUELTO'
    end
    object qryRegServMasterRepCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'SERVICIOS_MASTER.CODIGO_EMP'
    end
    object qryRegServMasterRepCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'SERVICIOS_MASTER.CODIGO_CTE'
    end
    object qryRegServMasterRepNUM_TRNVENTA: TIntegerField
      FieldName = 'NUM_TRNVENTA'
      Origin = 'SERVICIOS_MASTER.NUM_TRNVENTA'
    end
    object qryRegServMasterRepFECHA_ESTIMADA_ENTREGA: TDateTimeField
      FieldName = 'FECHA_ESTIMADA_ENTREGA'
      Origin = 'SERVICIOS_MASTER.FECHA_ESTIMADA_ENTREGA'
    end
    object qryRegServMasterRepNUM_ORDEN_TRABAJO: TFloatField
      FieldName = 'NUM_ORDEN_TRABAJO'
      Origin = 'SERVICIOS_MASTER.NUM_ORDEN_TRABAJO'
    end
  end
  object qryRegServMasterRepDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select d.*, i.DESCRIPCION as desc_servicio  From DETALLE_SERVICI' +
        'O d, INVENTARIO_PRODUCTO i'
      'Where numero =:numero'
      'And d.COD_SERVICIO = i.CODIGO'
      ''
      '')
    Left = 360
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryRegServMasterRepDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DETALLE_SERVICIO.SERIE'
      Required = True
    end
    object qryRegServMasterRepDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DETALLE_SERVICIO.NUMERO'
      Required = True
    end
    object qryRegServMasterRepDetFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DETALLE_SERVICIO.FECHA'
    end
    object qryRegServMasterRepDetCOD_SERVICIO: TIntegerField
      FieldName = 'COD_SERVICIO'
      Origin = 'DETALLE_SERVICIO.COD_SERVICIO'
    end
    object qryRegServMasterRepDetCANT: TFloatField
      FieldName = 'CANT'
      Origin = 'DETALLE_SERVICIO.CANT'
    end
    object qryRegServMasterRepDetVALOR_SERVICIO: TFloatField
      FieldName = 'VALOR_SERVICIO'
      Origin = 'DETALLE_SERVICIO.VALOR_SERVICIO'
    end
    object qryRegServMasterRepDetPORC_ITBIS: TFloatField
      FieldName = 'PORC_ITBIS'
      Origin = 'DETALLE_SERVICIO.PORC_ITBIS'
    end
    object qryRegServMasterRepDetPORC_DESC: TFloatField
      FieldName = 'PORC_DESC'
      Origin = 'DETALLE_SERVICIO.PORC_DESC'
    end
    object qryRegServMasterRepDetVALOR_ITBIS: TFloatField
      FieldName = 'VALOR_ITBIS'
      Origin = 'DETALLE_SERVICIO.VALOR_ITBIS'
    end
    object qryRegServMasterRepDetVALOR_DESCUENTO: TFloatField
      FieldName = 'VALOR_DESCUENTO'
      Origin = 'DETALLE_SERVICIO.VALOR_DESCUENTO'
    end
    object qryRegServMasterRepDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DETALLE_SERVICIO.DESCRIPCION'
      Size = 60
    end
    object qryRegServMasterRepDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DETALLE_SERVICIO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRegServMasterRepDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DETALLE_SERVICIO.IN_POR'
      Size = 12
    end
    object qryRegServMasterRepDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DETALLE_SERVICIO.FECHA_IN'
    end
    object qryRegServMasterRepDetUPDATE_POR: TIBStringField
      FieldName = 'UPDATE_POR'
      Origin = 'DETALLE_SERVICIO.UPDATE_POR'
      Size = 12
    end
    object qryRegServMasterRepDetFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'DETALLE_SERVICIO.FECHA_UPDATE'
    end
    object qryRegServMasterRepDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'DETALLE_SERVICIO.COD_USUARIO'
    end
    object qryRegServMasterRepDetDESC_SERVICIO: TIBStringField
      FieldName = 'DESC_SERVICIO'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryRegServMasterRepDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'DETALLE_SERVICIO.PRECIO'
    end
    object qryRegServMasterRepDetDESCRIPCIONESPECIAL: TMemoField
      FieldName = 'DESCRIPCIONESPECIAL'
      Origin = 'DETALLE_SERVICIO.DESCRIPCIONESPECIAL'
      BlobType = ftMemo
      Size = 8
    end
  end
  object qryInventarioLavanderia: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select I.* From INVENTARIO_PRODUCTO I, TIPO_INVENTARIO T'
      'Where i.tipo = t.codigo'
      'And upper(t.descripcion) LIKE '#39'%LAVAN%'#39)
    Left = 136
    Top = 312
    object qryInventarioLavanderiaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInventarioLavanderiaCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryInventarioLavanderiaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'INVENTARIO_PRODUCTO.FECHA'
    end
    object qryInventarioLavanderiaCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
    object qryInventarioLavanderiaTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object qryInventarioLavanderiaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryInventarioLavanderiaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryInventarioLavanderiaPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryInventarioLavanderiaPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryInventarioLavanderiaPRECIO_MINIMO: TFloatField
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
  end
  object dsqryInventarioLavanderia: TDataSource
    DataSet = qryInventarioLavanderia
    Left = 56
    Top = 336
  end
  object ibstpProcInsVentaMast: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INS_VENTAS_MAST'
    Left = 240
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO_TRNS'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'FORMA_PAGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTAL_DET'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
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
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO_DOC_PAGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SERIE_NCF_ASIGNADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_BRUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORC_DESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_PAGADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_CAMBIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_TOTAL_ITBIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMBRE_CLIENTE_GENERAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'E_MONTODESCGASTOSADMIN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'E_MONTODESCITBISGASTOSADMIN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'E_MONTODESCTRANSP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'E_MONTODESCDIRTECNICA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'E_MONTODESCITBISDIRTECNICA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'E_MONTODESCIMPREVISTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'E_MONTODESCITBISIMPREVISTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMENTARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COTIZACION_ORIGEN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIACTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_RECARGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPONCFIFISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_EXONERADO_ITBIS'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'NIF_IMPRESO'
        ParamType = ptInput
      end>
  end
  object ibstpProcInsVentaDetalle: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INS_VENTAS_DET'
    Left = 160
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_BARRA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRIPCION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ITBI_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_SERVICIO_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTAL_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUM_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS_DET'
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
      end
      item
        DataType = ftFloat
        Name = 'CANT_REGRESO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANT_PROMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DIETA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_AJUSTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SERIE_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_UNIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ITBIS_EXENTO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_VENTA'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'DESCRIPCIONPRODUCTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DESC_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ITBIS_FISCAL_DET'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTASAITBIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTOIBISRECARGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_TASA'
        ParamType = ptInput
      end>
  end
  object qryInventarioCafeteria: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select I.* From INVENTARIO_PRODUCTO I, TIPO_INVENTARIO T'
      'Where i.tipo = t.codigo'
      'And upper(t.descripcion) LIKE '#39'%CAFETE%'#39)
    Left = 368
    Top = 368
    object qryInventarioCafeteriaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInventarioCafeteriaCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryInventarioCafeteriaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'INVENTARIO_PRODUCTO.FECHA'
    end
    object qryInventarioCafeteriaCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
    object qryInventarioCafeteriaTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object qryInventarioCafeteriaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryInventarioCafeteriaCANTIDAD_REORDEN: TIntegerField
      FieldName = 'CANTIDAD_REORDEN'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD_REORDEN'
    end
    object qryInventarioCafeteriaPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ANT'
    end
    object qryInventarioCafeteriaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryInventarioCafeteriaPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryInventarioCafeteriaBLCE_CANT_ENTRADA: TFloatField
      FieldName = 'BLCE_CANT_ENTRADA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_ENTRADA'
    end
    object qryInventarioCafeteriaBLCE_CANT_SALIDA: TFloatField
      FieldName = 'BLCE_CANT_SALIDA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_SALIDA'
    end
    object qryInventarioCafeteriaFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN'
    end
    object qryInventarioCafeteriaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INVENTARIO_PRODUCTO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryInventarioCafeteriaPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'INVENTARIO_PRODUCTO.PORC_DESCUENTO'
    end
    object qryInventarioCafeteriaFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'INVENTARIO_PRODUCTO.FOTO'
      Size = 8
    end
    object qryInventarioCafeteriaPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
    end
    object qryInventarioCafeteriaCODIGO_PRECIO: TIBStringField
      FieldName = 'CODIGO_PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_PRECIO'
      FixedChar = True
      Size = 6
    end
    object qryInventarioCafeteriaUNIDAD: TFloatField
      FieldName = 'UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.UNIDAD'
    end
    object qryInventarioCafeteriaPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryInventarioCafeteriaPRECIO_MINIMO: TFloatField
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
    object qryInventarioCafeteriaREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object qryInventarioCafeteriaFECHA_VENCIMIENTO: TDateTimeField
      FieldName = 'FECHA_VENCIMIENTO'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_VENCIMIENTO'
    end
    object qryInventarioCafeteriaINVENTARIAR: TSmallintField
      FieldName = 'INVENTARIAR'
      Origin = 'INVENTARIO_PRODUCTO.INVENTARIAR'
    end
    object qryInventarioCafeteriaPRECIO_TIPO_UNIDAD: TFloatField
      FieldName = 'PRECIO_TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_TIPO_UNIDAD'
    end
    object qryInventarioCafeteriaTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.TIPO_UNIDAD'
    end
    object qryInventarioCafeteriaORIGEN: TIntegerField
      FieldName = 'ORIGEN'
      Origin = 'INVENTARIO_PRODUCTO.ORIGEN'
    end
    object qryInventarioCafeteriaUBICACION: TIBStringField
      FieldName = 'UBICACION'
      Origin = 'INVENTARIO_PRODUCTO.UBICACION'
      Size = 50
    end
    object qryInventarioCafeteriaMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'INVENTARIO_PRODUCTO.MARCA'
      Size = 50
    end
    object qryInventarioCafeteriaMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'INVENTARIO_PRODUCTO.MODELO'
      Size = 50
    end
  end
  object qryInventarioCafeteriaIng: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select I.* From INVENTARIO_PRODUCTO I, TIPO_INVENTARIO T'
      'Where i.tipo = t.codigo'
      'And upper(t.descripcion) LIKE '#39'%INGREDIENTE%'#39)
    Left = 376
    Top = 432
    object qryInventarioCafeteriaIngCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInventarioCafeteriaIngCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryInventarioCafeteriaIngFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'INVENTARIO_PRODUCTO.FECHA'
    end
    object qryInventarioCafeteriaIngCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
    object qryInventarioCafeteriaIngTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object qryInventarioCafeteriaIngDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryInventarioCafeteriaIngCANTIDAD_REORDEN: TIntegerField
      FieldName = 'CANTIDAD_REORDEN'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD_REORDEN'
    end
    object qryInventarioCafeteriaIngPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ANT'
    end
    object qryInventarioCafeteriaIngCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryInventarioCafeteriaIngPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryInventarioCafeteriaIngBLCE_CANT_ENTRADA: TFloatField
      FieldName = 'BLCE_CANT_ENTRADA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_ENTRADA'
    end
    object qryInventarioCafeteriaIngBLCE_CANT_SALIDA: TFloatField
      FieldName = 'BLCE_CANT_SALIDA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_SALIDA'
    end
    object qryInventarioCafeteriaIngFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN'
    end
    object qryInventarioCafeteriaIngSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INVENTARIO_PRODUCTO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryInventarioCafeteriaIngPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'INVENTARIO_PRODUCTO.PORC_DESCUENTO'
    end
    object qryInventarioCafeteriaIngFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'INVENTARIO_PRODUCTO.FOTO'
      Size = 8
    end
    object qryInventarioCafeteriaIngPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
    end
    object qryInventarioCafeteriaIngCODIGO_PRECIO: TIBStringField
      FieldName = 'CODIGO_PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_PRECIO'
      FixedChar = True
      Size = 6
    end
    object qryInventarioCafeteriaIngUNIDAD: TFloatField
      FieldName = 'UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.UNIDAD'
    end
    object qryInventarioCafeteriaIngPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryInventarioCafeteriaIngPRECIO_MINIMO: TFloatField
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
    object qryInventarioCafeteriaIngREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object qryInventarioCafeteriaIngFECHA_VENCIMIENTO: TDateTimeField
      FieldName = 'FECHA_VENCIMIENTO'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_VENCIMIENTO'
    end
    object qryInventarioCafeteriaIngINVENTARIAR: TSmallintField
      FieldName = 'INVENTARIAR'
      Origin = 'INVENTARIO_PRODUCTO.INVENTARIAR'
    end
    object qryInventarioCafeteriaIngPRECIO_TIPO_UNIDAD: TFloatField
      FieldName = 'PRECIO_TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_TIPO_UNIDAD'
    end
    object qryInventarioCafeteriaIngTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.TIPO_UNIDAD'
    end
    object qryInventarioCafeteriaIngORIGEN: TIntegerField
      FieldName = 'ORIGEN'
      Origin = 'INVENTARIO_PRODUCTO.ORIGEN'
    end
    object qryInventarioCafeteriaIngUBICACION: TIBStringField
      FieldName = 'UBICACION'
      Origin = 'INVENTARIO_PRODUCTO.UBICACION'
      Size = 50
    end
    object qryInventarioCafeteriaIngREFERENCIA_ALTERNA: TIBStringField
      FieldName = 'REFERENCIA_ALTERNA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA_ALTERNA'
      Size = 50
    end
    object qryInventarioCafeteriaIngMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'INVENTARIO_PRODUCTO.MARCA'
      Size = 50
    end
    object qryInventarioCafeteriaIngMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'INVENTARIO_PRODUCTO.MODELO'
      Size = 50
    end
  end
  object tblTransCafeteria: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TRANS_CAFETERIA'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into TRANS_CAFETERIA'
      
        '  (SERIE, NUMERO, CODIGO_PROD, CANT, COD_USUARIO, FECHA_IN, IN_P' +
        'OR, STATUS)'
      'values'
      
        '  (:SERIE, :NUMERO, :CODIGO_PROD, :CANT, :COD_USUARIO, :FECHA_IN' +
        ', :IN_POR, '
      '   :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  CODIGO_PROD,'
      '  CANT,'
      '  COD_USUARIO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  STATUS'
      'from TRANS_CAFETERIA '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select *  From TRANS_CAFETERIA'
      'Where numero=:numero')
    ModifySQL.Strings = (
      'update TRANS_CAFETERIA'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  CANT = :CANT,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  STATUS = :STATUS'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 440
    Top = 24
    object tblTransCafeteriaSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'TRANS_CAFETERIA.SERIE'
    end
    object tblTransCafeteriaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TRANS_CAFETERIA.NUMERO'
      Required = True
    end
    object tblTransCafeteriaCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'TRANS_CAFETERIA.CODIGO_PROD'
    end
    object tblTransCafeteriaCANT: TFloatField
      FieldName = 'CANT'
      Origin = 'TRANS_CAFETERIA.CANT'
    end
    object tblTransCafeteriaCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'TRANS_CAFETERIA.COD_USUARIO'
    end
    object tblTransCafeteriaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TRANS_CAFETERIA.FECHA_IN'
    end
    object tblTransCafeteriaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TRANS_CAFETERIA.IN_POR'
      Size = 12
    end
    object tblTransCafeteriaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRANS_CAFETERIA.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dstblTransCafeteria: TDataSource
    DataSet = tblTransCafeteria
    Left = 448
    Top = 88
  end
  object qryIngredienteCaf: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select d.*, i.DESCRIPCION '
      'From CAFE_MASTER_DET d, CAFE_MASTER m, INVENTARIO_PRODUCTO i'
      'Where m.NUMERO = d.NUMERO'
      'And i.CODIGO = d.CODIGO_PROD'
      'And m.CODIGO_PROD =:codproducto')
    Left = 464
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codproducto'
        ParamType = ptInput
      end>
    object qryIngredienteCafSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'CAFE_MASTER_DET.SERIE'
      Required = True
    end
    object qryIngredienteCafNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'CAFE_MASTER_DET.NUMERO'
      Required = True
    end
    object qryIngredienteCafCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'CAFE_MASTER_DET.CODIGO_PROD'
      Required = True
    end
    object qryIngredienteCafCANT: TIntegerField
      FieldName = 'CANT'
      Origin = 'CAFE_MASTER_DET.CANT'
    end
    object qryIngredienteCafSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CAFE_MASTER_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryIngredienteCafDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
  end
  object qryInventarioServTaller: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select I.* From INVENTARIO_PRODUCTO I, TIPO_INVENTARIO T'
      'Where i.tipo = t.codigo'
      'And upper(t.descripcion) LIKE '#39'%SERVICIO%'#39)
    Left = 544
    Top = 232
    object qryInventarioServTallerCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInventarioServTallerCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryInventarioServTallerDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryInventarioServTallerDESCRIPCIONADICIONAL: TMemoField
      FieldName = 'DESCRIPCIONADICIONAL'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCIONADICIONAL'
      BlobType = ftMemo
      Size = 8
    end
    object qryInventarioServTallerCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryInventarioServTallerPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryInventarioServTallerPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryInventarioServTallerPRECIO_MINIMO: TFloatField
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
    object qryInventarioServTallerINVENTARIAR: TSmallintField
      FieldName = 'INVENTARIAR'
      Origin = 'INVENTARIO_PRODUCTO.INVENTARIAR'
    end
    object qryInventarioServTallerCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'INVENTARIO_PRODUCTO.COD_MONEDA'
      FixedChar = True
      Size = 1
    end
  end
  object qryEmpleado: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select e.nombre||'#39' '#39'||e.apellido as NombreCompleto, c.nombre des' +
        'c_cargo, e.* '
      'from EMPLEADO e'
      'left outer join CARGO_EMPLEADOS c on c.codigo = e.CARGO'
      'where e.status = '#39'A'#39
      'order by codigo desc')
    Left = 552
    Top = 288
    object qryEmpleadoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMPLEADO.CODIGO'
      Required = True
    end
    object qryEmpleadoCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
      Origin = 'EMPLEADO.CODIGO_CIA'
      Required = True
    end
    object qryEmpleadoNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object qryEmpleadoAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADO.APELLIDO'
      Size = 35
    end
    object qryEmpleadoCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'EMPLEADO.CEDULA'
      Size = 14
    end
    object qryEmpleadoFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'EMPLEADO.FOTO'
      Size = 8
    end
    object qryEmpleadoPASSPORT: TIBStringField
      FieldName = 'PASSPORT'
      Origin = 'EMPLEADO.PASSPORT'
      Size = 14
    end
    object qryEmpleadoCALLE: TIBStringField
      FieldName = 'CALLE'
      Origin = 'EMPLEADO.CALLE'
      Size = 40
    end
    object qryEmpleadoNUM_CASA: TSmallintField
      FieldName = 'NUM_CASA'
      Origin = 'EMPLEADO.NUM_CASA'
    end
    object qryEmpleadoCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'EMPLEADO.CIUDAD'
      Size = 40
    end
    object qryEmpleadoPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'EMPLEADO.PAIS'
      Size = 40
    end
    object qryEmpleadoTELEF_CASA: TIBStringField
      FieldName = 'TELEF_CASA'
      Origin = 'EMPLEADO.TELEF_CASA'
      Size = 12
    end
    object qryEmpleadoTELEF_OFICINA: TIBStringField
      FieldName = 'TELEF_OFICINA'
      Origin = 'EMPLEADO.TELEF_OFICINA'
      Size = 12
    end
    object qryEmpleadoCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'EMPLEADO.CELULAR'
      Size = 12
    end
    object qryEmpleadoEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'EMPLEADO.EMAIL'
      Size = 40
    end
    object qryEmpleadoSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = 'EMPLEADO.SEXO'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadoESTADO_CIVIL: TIBStringField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'EMPLEADO.ESTADO_CIVIL'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadoTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'EMPLEADO.TELEF_REFERENCIA'
      Size = 12
    end
    object qryEmpleadoNOMBRE_REFERENCIA: TIBStringField
      FieldName = 'NOMBRE_REFERENCIA'
      Origin = 'EMPLEADO.NOMBRE_REFERENCIA'
      Size = 40
    end
    object qryEmpleadoFECHA_NAC: TDateTimeField
      FieldName = 'FECHA_NAC'
      Origin = 'EMPLEADO.FECHA_NAC'
    end
    object qryEmpleadoNACIONALIDAD: TIBStringField
      FieldName = 'NACIONALIDAD'
      Origin = 'EMPLEADO.NACIONALIDAD'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadoFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'EMPLEADO.FECHA_ENTRADA'
    end
    object qryEmpleadoFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'EMPLEADO.FECHA_SALIDA'
    end
    object qryEmpleadoSALARIO: TFloatField
      FieldName = 'SALARIO'
      Origin = 'EMPLEADO.SALARIO'
    end
    object qryEmpleadoTIPO_NOMINA: TSmallintField
      FieldName = 'TIPO_NOMINA'
      Origin = 'EMPLEADO.TIPO_NOMINA'
    end
    object qryEmpleadoTIPO_EMPLEADO: TSmallintField
      FieldName = 'TIPO_EMPLEADO'
      Origin = 'EMPLEADO.TIPO_EMPLEADO'
    end
    object qryEmpleadoDEPTO_EMP: TSmallintField
      FieldName = 'DEPTO_EMP'
      Origin = 'EMPLEADO.DEPTO_EMP'
    end
    object qryEmpleadoSECCION: TSmallintField
      FieldName = 'SECCION'
      Origin = 'EMPLEADO.SECCION'
    end
    object qryEmpleadoCARGO: TSmallintField
      FieldName = 'CARGO'
      Origin = 'EMPLEADO.CARGO'
    end
    object qryEmpleadoPAGA_AFP: TSmallintField
      FieldName = 'PAGA_AFP'
      Origin = 'EMPLEADO.PAGA_AFP'
    end
    object qryEmpleadoPAGA_TSS: TSmallintField
      FieldName = 'PAGA_TSS'
      Origin = 'EMPLEADO.PAGA_TSS'
    end
    object qryEmpleadoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'EMPLEADO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadoFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'EMPLEADO.FECHA_IN'
    end
    object qryEmpleadoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'EMPLEADO.IN_POR'
      Size = 12
    end
    object qryEmpleadoFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'EMPLEADO.FECHA_MOD'
    end
    object qryEmpleadoMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'EMPLEADO.MOD_POR'
      Size = 12
    end
    object qryEmpleadoLICENCIA: TIBStringField
      FieldName = 'LICENCIA'
      Origin = 'EMPLEADO.LICENCIA'
      Size = 14
    end
    object qryEmpleadoFECHA_VENCE_LICENCIA: TDateTimeField
      FieldName = 'FECHA_VENCE_LICENCIA'
      Origin = 'EMPLEADO.FECHA_VENCE_LICENCIA'
    end
    object qryEmpleadoNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Size = 71
    end
    object qryEmpleadoDESC_CARGO: TIBStringField
      FieldName = 'DESC_CARGO'
      Origin = 'CARGO_EMPLEADOS.NOMBRE'
      Size = 40
    end
  end
  object dsqryEmpleado: TDataSource
    DataSet = qryEmpleado
    Left = 544
    Top = 336
  end
  object dsqryInventarioServTaller: TDataSource
    DataSet = qryInventarioServTaller
    Left = 552
    Top = 176
  end
  object tblDespachoMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblDespachoMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DESPACHO_MASTER'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into DESPACHO_MASTER'
      
        '  (NUMERO, FECHA, TIPO_TRN, CODIGO_DESPACHADOR, CODIGO_EMP, MONT' +
        'O_TOTAL, '
      
        '   NUM_ORDEN, STATUS, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, CODI' +
        'GO_RUTA, '
      
        '   NUM_CONDUCE, CODIGO_PROV, NCF, RNC_PROVEEDOR, INVENTARIO_ID, ' +
        'SERIE_INV_ID, '
      
        '   INV_ID_ORIGEN, INV_ID_DESTINO, FORMA_PAGO, NUMERO_FACTURA, ST' +
        'ATUS_CNT)'
      'values'
      
        '  (:NUMERO, :FECHA, :TIPO_TRN, :CODIGO_DESPACHADOR, :CODIGO_EMP,' +
        ' :MONTO_TOTAL, '
      
        '   :NUM_ORDEN, :STATUS, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR' +
        ', :CODIGO_RUTA, '
      
        '   :NUM_CONDUCE, :CODIGO_PROV, :NCF, :RNC_PROVEEDOR, :INVENTARIO' +
        '_ID, :SERIE_INV_ID, '
      
        '   :INV_ID_ORIGEN, :INV_ID_DESTINO, :FORMA_PAGO, :NUMERO_FACTURA' +
        ', :STATUS_CNT)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA,'
      '  TIPO_TRN,'
      '  CODIGO_DESPACHADOR,'
      '  CODIGO_EMP,'
      '  MONTO_TOTAL,'
      '  NUM_ORDEN,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  CODIGO_RUTA,'
      '  NUM_CONDUCE,'
      '  CODIGO_PROV,'
      '  NCF,'
      '  RNC_PROVEEDOR,'
      '  INVENTARIO_ID,'
      '  SERIE_INV_ID,'
      '  INV_ID_ORIGEN,'
      '  INV_ID_DESTINO,'
      '  FORMA_PAGO,'
      '  NUMERO_FACTURA,'
      '  STATUS_CNT'
      'from DESPACHO_MASTER '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select * From DESPACHO_MASTER'
      'Where fecha between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update DESPACHO_MASTER'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  TIPO_TRN = :TIPO_TRN,'
      '  CODIGO_DESPACHADOR = :CODIGO_DESPACHADOR,'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  MONTO_TOTAL = :MONTO_TOTAL,'
      '  NUM_ORDEN = :NUM_ORDEN,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  CODIGO_RUTA = :CODIGO_RUTA,'
      '  NUM_CONDUCE = :NUM_CONDUCE,'
      '  CODIGO_PROV = :CODIGO_PROV,'
      '  NCF = :NCF,'
      '  RNC_PROVEEDOR = :RNC_PROVEEDOR,'
      '  INVENTARIO_ID = :INVENTARIO_ID,'
      '  SERIE_INV_ID = :SERIE_INV_ID,'
      '  INV_ID_ORIGEN = :INV_ID_ORIGEN,'
      '  INV_ID_DESTINO = :INV_ID_DESTINO,'
      '  FORMA_PAGO = :FORMA_PAGO,'
      '  NUMERO_FACTURA = :NUMERO_FACTURA,'
      '  STATUS_CNT = :STATUS_CNT'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_NUM_DESPACHOMASTER'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 552
    Top = 24
    object tblDespachoMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DESPACHO_MASTER.NUMERO'
      Required = True
    end
    object tblDespachoMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DESPACHO_MASTER.FECHA'
    end
    object tblDespachoMasterTIPO_TRN: TSmallintField
      FieldName = 'TIPO_TRN'
      Origin = 'DESPACHO_MASTER.TIPO_TRN'
    end
    object tblDespachoMasterCODIGO_DESPACHADOR: TIntegerField
      FieldName = 'CODIGO_DESPACHADOR'
      Origin = 'DESPACHO_MASTER.CODIGO_DESPACHADOR'
    end
    object tblDespachoMasterCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'DESPACHO_MASTER.CODIGO_EMP'
    end
    object tblDespachoMasterMONTO_TOTAL: TFloatField
      FieldName = 'MONTO_TOTAL'
      Origin = 'DESPACHO_MASTER.MONTO_TOTAL'
      DisplayFormat = ',0.00'
    end
    object tblDespachoMasterNUM_ORDEN: TFloatField
      FieldName = 'NUM_ORDEN'
      Origin = 'DESPACHO_MASTER.NUM_ORDEN'
    end
    object tblDespachoMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DESPACHO_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblDespachoMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DESPACHO_MASTER.FECHA_IN'
    end
    object tblDespachoMasterIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DESPACHO_MASTER.IN_POR'
      Size = 12
    end
    object tblDespachoMasterFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DESPACHO_MASTER.FECHA_MOD'
    end
    object tblDespachoMasterMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DESPACHO_MASTER.MOD_POR'
      Size = 12
    end
    object tblDespachoMasterCODIGO_RUTA: TIntegerField
      FieldName = 'CODIGO_RUTA'
      Origin = 'DESPACHO_MASTER.CODIGO_RUTA'
    end
    object tblDespachoMasterNUM_CONDUCE: TIntegerField
      FieldName = 'NUM_CONDUCE'
      Origin = 'DESPACHO_MASTER.NUM_CONDUCE'
    end
    object tblDespachoMasterCODIGO_PROV: TIntegerField
      FieldName = 'CODIGO_PROV'
      Origin = 'DESPACHO_MASTER.CODIGO_PROV'
    end
    object tblDespachoMasterNCF: TIBStringField
      FieldName = 'NCF'
      Origin = 'DESPACHO_MASTER.NCF'
      Size = 21
    end
    object tblDespachoMasterRNC_PROVEEDOR: TIBStringField
      FieldName = 'RNC_PROVEEDOR'
      Origin = 'DESPACHO_MASTER.RNC_PROVEEDOR'
      Size = 15
    end
    object tblDespachoMasterINVENTARIO_ID: TIntegerField
      FieldName = 'INVENTARIO_ID'
      Origin = 'DESPACHO_MASTER.INVENTARIO_ID'
    end
    object tblDespachoMasterSERIE_INV_ID: TIntegerField
      FieldName = 'SERIE_INV_ID'
      Origin = 'DESPACHO_MASTER.SERIE_INV_ID'
    end
    object tblDespachoMasterINV_ID_ORIGEN: TIntegerField
      FieldName = 'INV_ID_ORIGEN'
      Origin = 'DESPACHO_MASTER.INV_ID_ORIGEN'
    end
    object tblDespachoMasterINV_ID_DESTINO: TIntegerField
      FieldName = 'INV_ID_DESTINO'
      Origin = 'DESPACHO_MASTER.INV_ID_DESTINO'
    end
    object tblDespachoMasterFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'DESPACHO_MASTER.FORMA_PAGO'
    end
    object tblDespachoMasterNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'DESPACHO_MASTER.NUMERO_FACTURA'
    end
    object tblDespachoMasterSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'DESPACHO_MASTER.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
  end
  object tblDespachoDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblDespachoDetAfterScroll
    OnCalcFields = tblDespachoDetCalcFields
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DESPACHO'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into DESPACHO'
      
        '  (SERIE, NUMERO, TIPO_TRN, CODIGO_PROD, CANTIDAD, PRECIO, PORC_' +
        'DESC_DET, '
      
        '   ITBI_DET, VALOR_BRUTO, VALOR_TOTAL_DET, NUM_ORDEN, STATUS_DET' +
        ', FECHA_IN, '
      
        '   IN_POR, FECHA_MOD, MOD_POR, DESCRIPCION, RECARGA, CANT_UNIDAD' +
        'ES, UNIDADID, '
      '   STATUS_CNT, CANTOFERTA)'
      'values'
      
        '  (:SERIE, :NUMERO, :TIPO_TRN, :CODIGO_PROD, :CANTIDAD, :PRECIO,' +
        ' :PORC_DESC_DET, '
      
        '   :ITBI_DET, :VALOR_BRUTO, :VALOR_TOTAL_DET, :NUM_ORDEN, :STATU' +
        'S_DET, '
      
        '   :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR, :DESCRIPCION, :RECA' +
        'RGA, :CANT_UNIDADES, '
      '   :UNIDADID, :STATUS_CNT, :CANTOFERTA)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  TIPO_TRN,'
      '  CODIGO_PROD,'
      '  CANTIDAD,'
      '  PRECIO,'
      '  PORC_DESC_DET,'
      '  ITBI_DET,'
      '  VALOR_BRUTO,'
      '  VALOR_TOTAL_DET,'
      '  NUM_ORDEN,'
      '  STATUS_DET,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  DESCRIPCION,'
      '  RECARGA,'
      '  CANT_UNIDADES,'
      '  UNIDADID,'
      '  STATUS_CNT,'
      '  CANTOFERTA'
      'from DESPACHO '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * From DESPACHO'
      'Where numero=:numero')
    ModifySQL.Strings = (
      'update DESPACHO'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  TIPO_TRN = :TIPO_TRN,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO = :PRECIO,'
      '  PORC_DESC_DET = :PORC_DESC_DET,'
      '  ITBI_DET = :ITBI_DET,'
      '  VALOR_BRUTO = :VALOR_BRUTO,'
      '  VALOR_TOTAL_DET = :VALOR_TOTAL_DET,'
      '  NUM_ORDEN = :NUM_ORDEN,'
      '  STATUS_DET = :STATUS_DET,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  RECARGA = :RECARGA,'
      '  CANT_UNIDADES = :CANT_UNIDADES,'
      '  UNIDADID = :UNIDADID,'
      '  STATUS_CNT = :STATUS_CNT,'
      '  CANTOFERTA = :CANTOFERTA'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_DESPACHODET'
    GeneratorField.ApplyEvent = gamOnPost
    OnFilterRecord = tblDespachoDetFilterRecord
    Left = 552
    Top = 88
    object tblDespachoDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DESPACHO.SERIE'
      Required = True
    end
    object tblDespachoDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DESPACHO.NUMERO'
      Required = True
    end
    object tblDespachoDetTIPO_TRN: TSmallintField
      FieldName = 'TIPO_TRN'
      Origin = 'DESPACHO.TIPO_TRN'
    end
    object tblDespachoDetCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'DESPACHO.CODIGO_PROD'
    end
    object tblDespachoDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'DESPACHO.CANTIDAD'
    end
    object tblDespachoDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'DESPACHO.PRECIO'
      DisplayFormat = ',0.00'
    end
    object tblDespachoDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'DESPACHO.PORC_DESC_DET'
      DisplayFormat = ',0.00'
    end
    object tblDespachoDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'DESPACHO.ITBI_DET'
      DisplayFormat = ',0.00'
    end
    object tblDespachoDetVALOR_BRUTO: TFloatField
      FieldName = 'VALOR_BRUTO'
      Origin = 'DESPACHO.VALOR_BRUTO'
      DisplayFormat = ',0.00'
    end
    object tblDespachoDetVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'DESPACHO.VALOR_TOTAL_DET'
      DisplayFormat = ',0.00'
    end
    object tblDespachoDetNUM_ORDEN: TFloatField
      FieldName = 'NUM_ORDEN'
      Origin = 'DESPACHO.NUM_ORDEN'
    end
    object tblDespachoDetSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'DESPACHO.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object tblDespachoDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DESPACHO.FECHA_IN'
    end
    object tblDespachoDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DESPACHO.IN_POR'
      Size = 12
    end
    object tblDespachoDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DESPACHO.FECHA_MOD'
    end
    object tblDespachoDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DESPACHO.MOD_POR'
      Size = 12
    end
    object tblDespachoDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DESPACHO.DESCRIPCION'
      Size = 60
    end
    object tblDespachoDetRECARGA: TFloatField
      FieldName = 'RECARGA'
      Origin = 'DESPACHO.RECARGA'
    end
    object tblDespachoDetCANT_UNIDADES: TFloatField
      FieldName = 'CANT_UNIDADES'
      Origin = 'DESPACHO.CANT_UNIDADES'
    end
    object tblDespachoDetUNIDADID: TIntegerField
      FieldName = 'UNIDADID'
      Origin = 'DESPACHO.UNIDADID'
    end
    object tblDespachoDetSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'DESPACHO.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object tblDespachoDetMontoDescuento: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'MontoDescuento'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object tblDespachoDetCANTOFERTA: TIntegerField
      FieldName = 'CANTOFERTA'
      Origin = 'DESPACHO.CANTOFERTA'
    end
  end
  object QryBuscarITBIGlobal: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * '
      'From ITBI'
      'Where :fecha Between fecha_ini And fecha_fin')
    Left = 256
    Top = 358
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end>
    object QryBuscarITBIGlobalGRUPO: TSmallintField
      FieldName = 'GRUPO'
      Origin = 'ITBI.GRUPO'
      Required = True
    end
    object QryBuscarITBIGlobalFECHA_INI: TDateTimeField
      FieldName = 'FECHA_INI'
      Origin = 'ITBI.FECHA_INI'
      Required = True
    end
    object QryBuscarITBIGlobalFECHA_FIN: TDateTimeField
      FieldName = 'FECHA_FIN'
      Origin = 'ITBI.FECHA_FIN'
      Required = True
    end
    object QryBuscarITBIGlobalPORCIENTO: TFloatField
      FieldName = 'PORCIENTO'
      Origin = 'ITBI.PORCIENTO'
    end
    object QryBuscarITBIGlobalOBSERVACIONES: TIBStringField
      FieldName = 'OBSERVACIONES'
      Origin = 'ITBI.OBSERVACIONES'
      Size = 40
    end
    object QryBuscarITBIGlobalSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ITBI.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryBuscarTasaItbis: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From TASA_ITBIS'
      'Where :fecha Between  FECHAINI And FECHAFIN')
    Left = 472
    Top = 296
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
        Value = '12/06/2014'
      end>
    object qryBuscarTasaItbisIDTASAITBIS: TSmallintField
      FieldName = 'IDTASAITBIS'
      Origin = 'TASA_ITBIS.IDTASAITBIS'
      Required = True
    end
    object qryBuscarTasaItbisFECHAINI: TDateTimeField
      FieldName = 'FECHAINI'
      Origin = 'TASA_ITBIS.FECHAINI'
      Required = True
    end
    object qryBuscarTasaItbisFECHAFIN: TDateTimeField
      FieldName = 'FECHAFIN'
      Origin = 'TASA_ITBIS.FECHAFIN'
      Required = True
    end
    object qryBuscarTasaItbisDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TASA_ITBIS.DESCRIPCION'
    end
    object qryBuscarTasaItbisPORCIENTO: TFloatField
      FieldName = 'PORCIENTO'
      Origin = 'TASA_ITBIS.PORCIENTO'
    end
    object qryBuscarTasaItbisUSER_IN: TIntegerField
      FieldName = 'USER_IN'
      Origin = 'TASA_ITBIS.USER_IN'
    end
    object qryBuscarTasaItbisUSER_MOD: TIntegerField
      FieldName = 'USER_MOD'
      Origin = 'TASA_ITBIS.USER_MOD'
    end
    object qryBuscarTasaItbisIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TASA_ITBIS.IN_POR'
      Size = 12
    end
    object qryBuscarTasaItbisFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TASA_ITBIS.FECHA_IN'
    end
    object qryBuscarTasaItbisMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'TASA_ITBIS.MOD_POR'
      Size = 12
    end
    object qryBuscarTasaItbisSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TASA_ITBIS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryBuscarTasaItbisFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'TASA_ITBIS.FECHA_UPDATE'
    end
    object qryBuscarTasaItbisSIMBOLO_TASA: TIBStringField
      FieldName = 'SIMBOLO_TASA'
      Origin = 'TASA_ITBIS.SIMBOLO_TASA'
      FixedChar = True
      Size = 6
    end
  end
  object qryTasaItbis: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TASA_ITBIS')
    Left = 456
    Top = 408
    object qryTasaItbisIDTASAITBIS: TSmallintField
      FieldName = 'IDTASAITBIS'
      Origin = 'TASA_ITBIS.IDTASAITBIS'
      Required = True
    end
    object qryTasaItbisFECHAINI: TDateTimeField
      FieldName = 'FECHAINI'
      Origin = 'TASA_ITBIS.FECHAINI'
      Required = True
    end
    object qryTasaItbisFECHAFIN: TDateTimeField
      FieldName = 'FECHAFIN'
      Origin = 'TASA_ITBIS.FECHAFIN'
      Required = True
    end
    object qryTasaItbisDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TASA_ITBIS.DESCRIPCION'
    end
    object qryTasaItbisPORCIENTO: TFloatField
      FieldName = 'PORCIENTO'
      Origin = 'TASA_ITBIS.PORCIENTO'
    end
    object qryTasaItbisUSER_IN: TIntegerField
      FieldName = 'USER_IN'
      Origin = 'TASA_ITBIS.USER_IN'
    end
    object qryTasaItbisUSER_MOD: TIntegerField
      FieldName = 'USER_MOD'
      Origin = 'TASA_ITBIS.USER_MOD'
    end
    object qryTasaItbisIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TASA_ITBIS.IN_POR'
      Size = 12
    end
    object qryTasaItbisFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TASA_ITBIS.FECHA_IN'
    end
    object qryTasaItbisMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'TASA_ITBIS.MOD_POR'
      Size = 12
    end
    object qryTasaItbisSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TASA_ITBIS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryTasaItbisFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'TASA_ITBIS.FECHA_UPDATE'
    end
    object qryTasaItbisSIMBOLO_TASA: TIBStringField
      FieldName = 'SIMBOLO_TASA'
      Origin = 'TASA_ITBIS.SIMBOLO_TASA'
      FixedChar = True
      Size = 6
    end
  end
  object qryBuscarMonedaProd: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select COD_MONEDA From  INVENTARIO_PRODUCTO'
      'Where codigo =:codigoProd')
    Left = 456
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoProd'
        ParamType = ptInput
      end>
    object qryBuscarMonedaProdCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'INVENTARIO_PRODUCTO.COD_MONEDA'
      FixedChar = True
      Size = 1
    end
  end
  object tblOrdenTrabajo: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = tblOrdenTrabajoCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ORDEN_TRABAJO'
      'where'
      '  IDORDEN = :OLD_IDORDEN')
    InsertSQL.Strings = (
      'insert into ORDEN_TRABAJO'
      
        '  (IDORDEN, FECHA, COD_MONEDA, CODIGO_CTE, FECHA_ENTREGA, NUM_OR' +
        'DEN, DESC_VEHICULO, '
      
        '   DESC_ORDEN, MONTO_TOTAL, MONTO_ABONO, ASIGNADO_A, CODIGO_USER' +
        ', STATUS, '
      '   IN_POR, FECHA_IN, MOD_POR, FECHA_MOD, NUM_COTIZACION)'
      'values'
      
        '  (:IDORDEN, :FECHA, :COD_MONEDA, :CODIGO_CTE, :FECHA_ENTREGA, :' +
        'NUM_ORDEN, '
      
        '   :DESC_VEHICULO, :DESC_ORDEN, :MONTO_TOTAL, :MONTO_ABONO, :ASI' +
        'GNADO_A, '
      
        '   :CODIGO_USER, :STATUS, :IN_POR, :FECHA_IN, :MOD_POR, :FECHA_M' +
        'OD, :NUM_COTIZACION)')
    RefreshSQL.Strings = (
      'Select '
      '  IDORDEN,'
      '  FECHA,'
      '  COD_MONEDA,'
      '  CODIGO_CTE,'
      '  FECHA_ENTREGA,'
      '  NUM_ORDEN,'
      '  DESC_VEHICULO,'
      '  DESC_ORDEN,'
      '  MONTO_TOTAL,'
      '  MONTO_ABONO,'
      '  ASIGNADO_A,'
      '  CODIGO_USER,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD,'
      '  NUM_COTIZACION'
      'from ORDEN_TRABAJO '
      'where'
      '  IDORDEN = :IDORDEN')
    SelectSQL.Strings = (
      'Select *  From ORDEN_TRABAJO'
      'Where fecha between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update ORDEN_TRABAJO'
      'set'
      '  IDORDEN = :IDORDEN,'
      '  FECHA = :FECHA,'
      '  COD_MONEDA = :COD_MONEDA,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  FECHA_ENTREGA = :FECHA_ENTREGA,'
      '  NUM_ORDEN = :NUM_ORDEN,'
      '  DESC_VEHICULO = :DESC_VEHICULO,'
      '  DESC_ORDEN = :DESC_ORDEN,'
      '  MONTO_TOTAL = :MONTO_TOTAL,'
      '  MONTO_ABONO = :MONTO_ABONO,'
      '  ASIGNADO_A = :ASIGNADO_A,'
      '  CODIGO_USER = :CODIGO_USER,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  NUM_COTIZACION = :NUM_COTIZACION'
      'where'
      '  IDORDEN = :OLD_IDORDEN')
    GeneratorField.Field = 'IDORDEN'
    GeneratorField.Generator = 'GEN_IDORDEN_TRABAJO'
    GeneratorField.ApplyEvent = gamOnPost
    OnFilterRecord = tblOrdenTrabajoFilterRecord
    Left = 608
    Top = 128
    object tblOrdenTrabajoIDORDEN: TIntegerField
      FieldName = 'IDORDEN'
      Origin = 'ORDEN_TRABAJO.IDORDEN'
      Required = True
    end
    object tblOrdenTrabajoFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ORDEN_TRABAJO.FECHA'
      Required = True
    end
    object tblOrdenTrabajoCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'ORDEN_TRABAJO.COD_MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tblOrdenTrabajoCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'ORDEN_TRABAJO.CODIGO_CTE'
      Required = True
    end
    object tblOrdenTrabajoFECHA_ENTREGA: TDateTimeField
      FieldName = 'FECHA_ENTREGA'
      Origin = 'ORDEN_TRABAJO.FECHA_ENTREGA'
    end
    object tblOrdenTrabajoNUM_ORDEN: TIntegerField
      FieldName = 'NUM_ORDEN'
      Origin = 'ORDEN_TRABAJO.NUM_ORDEN'
    end
    object tblOrdenTrabajoDESC_VEHICULO: TIBStringField
      FieldName = 'DESC_VEHICULO'
      Origin = 'ORDEN_TRABAJO.DESC_VEHICULO'
      Size = 70
    end
    object tblOrdenTrabajoDESC_ORDEN: TMemoField
      FieldName = 'DESC_ORDEN'
      Origin = 'ORDEN_TRABAJO.DESC_ORDEN'
      BlobType = ftMemo
      Size = 8
    end
    object tblOrdenTrabajoMONTO_TOTAL: TFloatField
      FieldName = 'MONTO_TOTAL'
      Origin = 'ORDEN_TRABAJO.MONTO_TOTAL'
    end
    object tblOrdenTrabajoMONTO_ABONO: TFloatField
      FieldName = 'MONTO_ABONO'
      Origin = 'ORDEN_TRABAJO.MONTO_ABONO'
    end
    object tblOrdenTrabajoASIGNADO_A: TIntegerField
      FieldName = 'ASIGNADO_A'
      Origin = 'ORDEN_TRABAJO.ASIGNADO_A'
    end
    object tblOrdenTrabajoCODIGO_USER: TIntegerField
      FieldName = 'CODIGO_USER'
      Origin = 'ORDEN_TRABAJO.CODIGO_USER'
    end
    object tblOrdenTrabajoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ORDEN_TRABAJO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblOrdenTrabajoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ORDEN_TRABAJO.IN_POR'
      Size = 12
    end
    object tblOrdenTrabajoFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ORDEN_TRABAJO.FECHA_IN'
    end
    object tblOrdenTrabajoMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'ORDEN_TRABAJO.MOD_POR'
      Size = 12
    end
    object tblOrdenTrabajoFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'ORDEN_TRABAJO.FECHA_MOD'
    end
    object tblOrdenTrabajoMontoRestanteCld: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'MontoRestanteCld'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object tblOrdenTrabajoNUM_COTIZACION: TIntegerField
      FieldName = 'NUM_COTIZACION'
      Origin = 'ORDEN_TRABAJO.NUM_COTIZACION'
    end
  end
  object dstblOrdenTrabajo: TDataSource
    DataSet = tblOrdenTrabajo
    Left = 616
    Top = 192
  end
  object qryPrecioUnidadSurt: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      'r.IDUNIDAD,'
      'u.CANTIDAD, '
      'r.COD_PRODUCTO, '
      'u.descripcion,'
      'r.PORCUTILIDAD1, '
      'r.PORCUTILIDAD2, '
      'r.PORCUTILIDAD3, '
      'r.PORCUTILIDAD4, '
      'r.PRECIOVENTA1, '
      'r.PRECIOVENTA2, '
      'r.PRECIOVENTA3, '
      'r.PRECIOVENTA4'
      'From PRECIO_UNIDADSURTIDORA r, unidades u'
      'Where r.cod_producto=:codproducto'
      'and u.idunidad =r.idunidad')
    Left = 56
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codproducto'
        ParamType = ptInput
      end>
    object qryPrecioUnidadSurtIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'PRECIO_UNIDADSURTIDORA.IDUNIDAD'
      Required = True
    end
    object qryPrecioUnidadSurtCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'PRECIO_UNIDADSURTIDORA.COD_PRODUCTO'
      Required = True
    end
    object qryPrecioUnidadSurtDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
    object qryPrecioUnidadSurtPORCUTILIDAD1: TFloatField
      FieldName = 'PORCUTILIDAD1'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD1'
    end
    object qryPrecioUnidadSurtPORCUTILIDAD2: TFloatField
      FieldName = 'PORCUTILIDAD2'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD2'
    end
    object qryPrecioUnidadSurtPORCUTILIDAD3: TFloatField
      FieldName = 'PORCUTILIDAD3'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD3'
    end
    object qryPrecioUnidadSurtPORCUTILIDAD4: TFloatField
      FieldName = 'PORCUTILIDAD4'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD4'
    end
    object qryPrecioUnidadSurtPRECIOVENTA1: TFloatField
      FieldName = 'PRECIOVENTA1'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA1'
    end
    object qryPrecioUnidadSurtPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA2'
    end
    object qryPrecioUnidadSurtPRECIOVENTA3: TFloatField
      FieldName = 'PRECIOVENTA3'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA3'
    end
    object qryPrecioUnidadSurtPRECIOVENTA4: TFloatField
      FieldName = 'PRECIOVENTA4'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA4'
    end
    object qryPrecioUnidadSurtCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Origin = 'UNIDADES.CANTIDAD'
    end
  end
  object qryUnidadPLSurt: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select Distinct r.idunidad, u.descripcion'
      'From PRECIO_UNIDADSURTIDORA r, UNIDADES u'
      'WHERE u.IDUNIDAD = r.IDUNIDAD')
    Left = 128
    Top = 432
    object qryUnidadPLSurtIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'PRECIO_UNIDADSURTIDORA.IDUNIDAD'
      Required = True
    end
    object qryUnidadPLSurtDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PRECIO_UNIDADSURTIDORA.DESCRIPCION'
      Size = 50
    end
  end
  object tblLineaComentario: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from LCOMENTARIO'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into LCOMENTARIO'
      '  (ID, NUMLIN, NUMERO_TRN, LINEA, TIPO_OPE)'
      'values'
      '  (:ID, :NUMLIN, :NUMERO_TRN, :LINEA, :TIPO_OPE)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NUMLIN,'
      '  NUMERO_TRN,'
      '  LINEA,'
      '  TIPO_OPE'
      'from LCOMENTARIO '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *  From LCOMENTARIO'
      'where numero_trn =:numerotrn')
    ModifySQL.Strings = (
      'update LCOMENTARIO'
      'set'
      '  ID = :ID,'
      '  NUMLIN = :NUMLIN,'
      '  NUMERO_TRN = :NUMERO_TRN,'
      '  LINEA = :LINEA,'
      '  TIPO_OPE = :TIPO_OPE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_LCOMENTARIO_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 296
    Top = 16
    object tblLineaComentarioID: TSmallintField
      FieldName = 'ID'
      Origin = 'LCOMENTARIO.ID'
      Required = True
    end
    object tblLineaComentarioNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'LCOMENTARIO.NUMERO_TRN'
      Required = True
    end
    object tblLineaComentarioNUMLIN: TSmallintField
      FieldName = 'NUMLIN'
      Origin = 'LCOMENTARIO.NUMLIN'
      Required = True
    end
    object tblLineaComentarioLINEA: TIBStringField
      FieldName = 'LINEA'
      Origin = 'LCOMENTARIO.LINEA'
      Size = 40
    end
    object tblLineaComentarioTIPO_OPE: TSmallintField
      FieldName = 'TIPO_OPE'
      Origin = 'LCOMENTARIO.TIPO_OPE'
    end
  end
  object ibsqlInsertConduce: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'insert into VENTAS_DET_CONDUCE'
      'select * from VENTAS_DET'
      'where numero =:numero')
    Transaction = dmConectar.IBTransaction1
    Left = 632
    Top = 288
  end
  object qryVerProdEnConduce: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select iif(i.CANTIDAD is null, 0, i.CANTIDAD) cant_en_inv, Sum(r' +
        '.CANTIDAD) cant_total_conduce'
      'From VENTAS_DET_CONDUCE r'
      'inner join INVENTARIO_PRODUCTO i on i.codigo = r.CODIGO_PROD'
      'Where r.CODIGO_PROD =:codprod'
      'And r.status_det = '#39'A'#39
      'group by  i.CANTIDAD')
    Left = 472
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codprod'
        ParamType = ptInput
      end>
    object qryVerProdEnConduceCANT_EN_INV: TFloatField
      FieldName = 'CANT_EN_INV'
    end
    object qryVerProdEnConduceCANT_TOTAL_CONDUCE: TFloatField
      FieldName = 'CANT_TOTAL_CONDUCE'
    end
  end
  object qryVentaConduce: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  c.* From VENTAS_DET_CONDUCE c'
      'Where c.numero =:numero')
    Left = 616
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryVentaConduceSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET_CONDUCE.SERIE'
      Required = True
    end
    object qryVentaConduceNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_DET_CONDUCE.NUMERO'
      Required = True
    end
    object qryVentaConduceCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET_CONDUCE.CODIGO_PROD'
      Size = 40
    end
    object qryVentaConduceCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VENTAS_DET_CONDUCE.CODIGO_BARRA'
    end
    object qryVentaConduceDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET_CONDUCE.DESCRIPCION'
      Size = 80
    end
    object qryVentaConduceCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET_CONDUCE.CANTIDAD'
    end
    object qryVentaConducePRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET_CONDUCE.PRECIO'
    end
    object qryVentaConducePORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET_CONDUCE.PORC_DESC_DET'
    end
    object qryVentaConduceITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET_CONDUCE.ITBI_DET'
    end
    object qryVentaConduceVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET_CONDUCE.VALOR_SERVICIO_DET'
    end
    object qryVentaConduceVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_DET_CONDUCE.VALOR_TOTAL_DET'
    end
    object qryVentaConduceNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VENTAS_DET_CONDUCE.NUM_FACTURA'
    end
    object qryVentaConduceSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET_CONDUCE.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryVentaConduceFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_DET_CONDUCE.FECHA_IN'
    end
    object qryVentaConduceIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_DET_CONDUCE.IN_POR'
      Size = 12
    end
    object qryVentaConduceFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_DET_CONDUCE.FECHA_MOD'
    end
    object qryVentaConduceMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_DET_CONDUCE.MOD_POR'
      Size = 12
    end
    object qryVentaConduceCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VENTAS_DET_CONDUCE.CANT_REGRESO'
    end
    object qryVentaConduceCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VENTAS_DET_CONDUCE.CANT_PROMO'
    end
    object qryVentaConduceMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VENTAS_DET_CONDUCE.MONTO_DIETA'
    end
    object qryVentaConduceMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VENTAS_DET_CONDUCE.MONTO_AJUSTE'
    end
    object qryVentaConduceSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VENTAS_DET_CONDUCE.SERIE_PROD'
      Size = 50
    end
    object qryVentaConduceSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VENTAS_DET_CONDUCE.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryVentaConduceTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VENTAS_DET_CONDUCE.TIPO_UNIDAD'
    end
    object qryVentaConduceITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VENTAS_DET_CONDUCE.ITBIS_EXENTO'
    end
    object qryVentaConduceTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VENTAS_DET_CONDUCE.TIPO_VENTA'
    end
    object qryVentaConduceDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VENTAS_DET_CONDUCE.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryVentaConduceCOD_EMPLEADO_CONDUCTOR: TFloatField
      FieldName = 'COD_EMPLEADO_CONDUCTOR'
      Origin = 'VENTAS_DET_CONDUCE.COD_EMPLEADO_CONDUCTOR'
    end
    object qryVentaConducePLACA_VEHICULO: TIBStringField
      FieldName = 'PLACA_VEHICULO'
      Origin = 'VENTAS_DET_CONDUCE.PLACA_VEHICULO'
    end
    object qryVentaConduceMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_DET_CONDUCE.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryVentaConduceMONTO_TASA: TFloatField
      FieldName = 'MONTO_TASA'
      Origin = 'VENTAS_DET_CONDUCE.MONTO_TASA'
    end
    object qryVentaConduceCAPACIDAD: TFloatField
      FieldName = 'CAPACIDAD'
      Origin = 'VENTAS_DET_CONDUCE.CAPACIDAD'
    end
    object qryVentaConduceCANT_VIAJES: TFloatField
      FieldName = 'CANT_VIAJES'
      Origin = 'VENTAS_DET_CONDUCE.CANT_VIAJES'
    end
    object qryVentaConduceCANT_METROS_CUBICO: TFloatField
      FieldName = 'CANT_METROS_CUBICO'
      Origin = 'VENTAS_DET_CONDUCE.CANT_METROS_CUBICO'
    end
    object qryVentaConduceFICHA_VEH: TIntegerField
      FieldName = 'FICHA_VEH'
      Origin = 'VENTAS_DET_CONDUCE.FICHA_VEH'
    end
    object qryVentaConduceIDZONA_ORIGEN: TIntegerField
      FieldName = 'IDZONA_ORIGEN'
      Origin = 'VENTAS_DET_CONDUCE.IDZONA_ORIGEN'
    end
    object qryVentaConduceIDZONA_DETALLE: TIntegerField
      FieldName = 'IDZONA_DETALLE'
      Origin = 'VENTAS_DET_CONDUCE.IDZONA_DETALLE'
    end
    object qryVentaConducePRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'VENTAS_DET_CONDUCE.PRECIO_COMPRA'
    end
    object qryVentaConduceCANT_CONDUCE: TFloatField
      FieldName = 'CANT_CONDUCE'
      Origin = 'VENTAS_DET_CONDUCE.CANT_CONDUCE'
    end
    object qryVentaConducePORC_DESC_ITEM: TFloatField
      FieldName = 'PORC_DESC_ITEM'
      Origin = 'VENTAS_DET_CONDUCE.PORC_DESC_ITEM'
    end
    object qryVentaConduceMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VENTAS_DET_CONDUCE.MONTO_DESC_ITEM'
    end
    object qryVentaConduceITBIS_FISCAL_DET: TFloatField
      FieldName = 'ITBIS_FISCAL_DET'
      Origin = 'VENTAS_DET_CONDUCE.ITBIS_FISCAL_DET'
    end
    object qryVentaConduceIDTASAITBIS: TFloatField
      FieldName = 'IDTASAITBIS'
      Origin = 'VENTAS_DET_CONDUCE.IDTASAITBIS'
    end
    object qryVentaConduceMONTOIBISRECARGO: TFloatField
      FieldName = 'MONTOIBISRECARGO'
      Origin = 'VENTAS_DET_CONDUCE.MONTOIBISRECARGO'
    end
    object qryVentaConduceDC_ITBIS_CLD: TFloatField
      FieldName = 'DC_ITBIS_CLD'
      Origin = 'VENTAS_DET_CONDUCE.DC_ITBIS_CLD'
    end
    object qryVentaConduceTC_MONTOITBISRECARGO_GLB: TFloatField
      FieldName = 'TC_MONTOITBISRECARGO_GLB'
      Origin = 'VENTAS_DET_CONDUCE.TC_MONTOITBISRECARGO_GLB'
    end
    object qryVentaConduceTC_MONTOITBISRECARGO_ITM: TFloatField
      FieldName = 'TC_MONTOITBISRECARGO_ITM'
      Origin = 'VENTAS_DET_CONDUCE.TC_MONTOITBISRECARGO_ITM'
    end
  end
  object qryVentaConduceMaster: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryVentaConduceMasterAfterScroll
    BeforeScroll = qryVentaConduceMasterBeforeScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select Distinct   v.numero, v.fecha, cl.NOMBRE_FACTURAR, v.statu' +
        's StatusMaster,'
      'c.status_Det, v.VALOR_TOTAL_DET From VENTAS_DET_CONDUCE c'
      'Inner Join ventas_mast v on v.numero = c.numero'
      'Inner Join clientes cl on cl.CODIGO_CTE = v.CODIGO_CTE'
      'Where v.fecha between :fechaini and :fechafin')
    Left = 696
    Top = 440
    ParamData = <
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
    object qryVentaConduceMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryVentaConduceMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryVentaConduceMasterNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryVentaConduceMasterVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST.VALOR_TOTAL_DET'
    end
    object qryVentaConduceMasterSTATUSMASTER: TIBStringField
      FieldName = 'STATUSMASTER'
      Origin = 'VENTAS_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryVentaConduceMasterSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET_CONDUCE.STATUS_DET'
      FixedChar = True
      Size = 1
    end
  end
  object ibsqlUpdateStVtaConduce: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Update VENTAS_DET_CONDUCE '
      'Set status_det = '#39'R'#39
      'Where status_det = '#39'A'#39
      'And numero =:numero')
    Transaction = dmConectar.IBTransaction1
    Left = 552
    Top = 392
  end
  object ibsqlCancelaStVtaConduce: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'update VENTAS_DET_CONDUCE '
      'set status_det = '#39'C'#39
      'where status_det = '#39'A'#39
      'and numero =:numero')
    Transaction = dmConectar.IBTransaction1
    Left = 256
    Top = 416
  end
  object qryRepOrdenConduce: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepOrdenConduceAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  '
      
        'v.numero,d.DESCRIPCION desc_ciudad, s.DESCRIPCION desc_sector, c' +
        '.direccion_cont,'
      
        'c.NOMBRE_FACTURAR, e.nombre ||" " ||e.apellido NombreVendedor, v' +
        '.fecha, v.Comentario,'
      
        'iif(v.numero_factura > 0,v.numero_factura, v.numero_doc_pago) nu' +
        'm_fact_cld,'
      
        '(select xx.nombre  ||" " ||xx.apellido from EMPLEADO xx where xx' +
        '.codigo = r.DESPACHADO_POR ) DespachadoPor,'
      
        '  (select xxx.nombre  ||" " ||xxx.apellido from EMPLEADO xxx whe' +
        're xxx.codigo = r.cod_chofer ) Chofer, '
      '  r.* '
      'From DATOSCONDUCE r'
      'Inner join VENTAS_MAST v on v.numero = r.num_trn'
      'Left outer join clientes c on c.CODIGO_CTE = r.COD_CLIENTE'
      'Left outer join EMPLEADO e on e.CODIGO = c.COD_VENDEDOR'
      'left outer join SECTORES s on s.CODIGO = c.CODZONA'
      'left outer join CIUDAD d on d.CODIGO = c.COD_CIUDAD'
      'Where r.NUM_TRN=:numtrn')
    Left = 688
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numtrn'
        ParamType = ptInput
      end>
    object qryRepOrdenConduceNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryRepOrdenConduceNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryRepOrdenConduceNOMBREVENDEDOR: TIBStringField
      FieldName = 'NOMBREVENDEDOR'
      Size = 71
    end
    object qryRepOrdenConduceFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryRepOrdenConduceCOMENTARIO: TIBStringField
      FieldName = 'COMENTARIO'
      Origin = 'VENTAS_MAST.COMENTARIO'
      Size = 80
    end
    object qryRepOrdenConduceNUM_FACT_CLD: TIBStringField
      FieldName = 'NUM_FACT_CLD'
    end
    object qryRepOrdenConduceDESPACHADOPOR: TIBStringField
      FieldName = 'DESPACHADOPOR'
      Size = 71
    end
    object qryRepOrdenConduceCHOFER: TIBStringField
      FieldName = 'CHOFER'
      Size = 71
    end
    object qryRepOrdenConduceNUM_TRN: TIntegerField
      FieldName = 'NUM_TRN'
      Origin = 'DATOSCONDUCE.NUM_TRN'
      Required = True
    end
    object qryRepOrdenConduceDESPACHADO_POR: TIntegerField
      FieldName = 'DESPACHADO_POR'
      Origin = 'DATOSCONDUCE.DESPACHADO_POR'
      Required = True
    end
    object qryRepOrdenConduceCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'DATOSCONDUCE.COD_CLIENTE'
      Required = True
    end
    object qryRepOrdenConduceCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'DATOSCONDUCE.COD_VENDEDOR'
    end
    object qryRepOrdenConduceCOD_CHOFER: TIntegerField
      FieldName = 'COD_CHOFER'
      Origin = 'DATOSCONDUCE.COD_CHOFER'
    end
    object qryRepOrdenConduceNUM_CONDUCE: TIntegerField
      FieldName = 'NUM_CONDUCE'
      Origin = 'DATOSCONDUCE.NUM_CONDUCE'
    end
    object qryRepOrdenConduceFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DATOSCONDUCE.FECHA_IN'
    end
    object qryRepOrdenConduceIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DATOSCONDUCE.IN_POR'
      Size = 12
    end
    object qryRepOrdenConduceSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DATOSCONDUCE.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepOrdenConduceDESC_CIUDAD: TIBStringField
      FieldName = 'DESC_CIUDAD'
      Origin = 'CIUDAD.DESCRIPCION'
      Size = 35
    end
    object qryRepOrdenConduceDESC_SECTOR: TIBStringField
      FieldName = 'DESC_SECTOR'
      Origin = 'SECTORES.DESCRIPCION'
      Size = 40
    end
    object qryRepOrdenConduceDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
  end
  object tblDatosConduce: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DATOSCONDUCE'
      'where'
      '  NUM_TRN = :OLD_NUM_TRN')
    InsertSQL.Strings = (
      'insert into DATOSCONDUCE'
      
        '  (NUM_TRN, DESPACHADO_POR, COD_CLIENTE, COD_VENDEDOR, COD_CHOFE' +
        'R, NUM_CONDUCE, '
      '   FECHA_IN, IN_POR, STATUS, NUM_CONDUCE_CTE, FICHA_VEH)'
      'values'
      
        '  (:NUM_TRN, :DESPACHADO_POR, :COD_CLIENTE, :COD_VENDEDOR, :COD_' +
        'CHOFER, '
      
        '   :NUM_CONDUCE, :FECHA_IN, :IN_POR, :STATUS, :NUM_CONDUCE_CTE, ' +
        ':FICHA_VEH)')
    RefreshSQL.Strings = (
      'Select '
      '  NUM_TRN,'
      '  DESPACHADO_POR,'
      '  COD_CLIENTE,'
      '  COD_VENDEDOR,'
      '  COD_CHOFER,'
      '  NUM_CONDUCE,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  STATUS,'
      '  NUM_CONDUCE_CTE,'
      '  FICHA_VEH'
      'from DATOSCONDUCE '
      'where'
      '  NUM_TRN = :NUM_TRN')
    SelectSQL.Strings = (
      'Select * From DATOSCONDUCE'
      'Where Num_trn =:numtrn')
    ModifySQL.Strings = (
      'update DATOSCONDUCE'
      'set'
      '  NUM_TRN = :NUM_TRN,'
      '  DESPACHADO_POR = :DESPACHADO_POR,'
      '  COD_CLIENTE = :COD_CLIENTE,'
      '  COD_VENDEDOR = :COD_VENDEDOR,'
      '  COD_CHOFER = :COD_CHOFER,'
      '  NUM_CONDUCE = :NUM_CONDUCE,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  STATUS = :STATUS,'
      '  NUM_CONDUCE_CTE = :NUM_CONDUCE_CTE,'
      '  FICHA_VEH = :FICHA_VEH'
      'where'
      '  NUM_TRN = :OLD_NUM_TRN')
    Left = 696
    Top = 240
    object tblDatosConduceNUM_TRN: TIntegerField
      FieldName = 'NUM_TRN'
      Origin = 'DATOSCONDUCE.NUM_TRN'
      Required = True
    end
    object tblDatosConduceDESPACHADO_POR: TIntegerField
      FieldName = 'DESPACHADO_POR'
      Origin = 'DATOSCONDUCE.DESPACHADO_POR'
      Required = True
    end
    object tblDatosConduceCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'DATOSCONDUCE.COD_CLIENTE'
      Required = True
    end
    object tblDatosConduceCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'DATOSCONDUCE.COD_VENDEDOR'
    end
    object tblDatosConduceCOD_CHOFER: TIntegerField
      FieldName = 'COD_CHOFER'
      Origin = 'DATOSCONDUCE.COD_CHOFER'
    end
    object tblDatosConduceNUM_CONDUCE: TIntegerField
      FieldName = 'NUM_CONDUCE'
      Origin = 'DATOSCONDUCE.NUM_CONDUCE'
    end
    object tblDatosConduceFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DATOSCONDUCE.FECHA_IN'
    end
    object tblDatosConduceIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DATOSCONDUCE.IN_POR'
      Size = 12
    end
    object tblDatosConduceSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DATOSCONDUCE.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblDatosConduceNUM_CONDUCE_CTE: TIntegerField
      FieldName = 'NUM_CONDUCE_CTE'
      Origin = 'DATOSCONDUCE.NUM_CONDUCE_CTE'
    end
    object tblDatosConduceFICHA_VEH: TIntegerField
      FieldName = 'FICHA_VEH'
      Origin = 'DATOSCONDUCE.FICHA_VEH'
    end
  end
  object qryVentaFacturaDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  i.referencia,'
      '  F.DESCRIPCION AS DESC_TIPO_NCF,'
      '  D.SERIE,'
      '  D.CODIGO_PROD,'
      '  D.CANTIDAD,'
      '  d.cant_conduce,'
      '  Abs(D.PRECIO) Precio,'
      '  D.PORC_DESC_DET,'
      '  Abs(D.ITBI_DET)  ITBI_DET,'
      '  d.porc_desc_item,'
      '  Abs(d.monto_desc_item)  monto_desc_item,'
      '  Abs(D.VALOR_SERVICIO_DET) VALOR_SERVICIO_DET,'
      '  Abs(D.VALOR_TOTAL_DET) VALOR_TOTAL_DET,'
      '  V.NUMERO_FACTURA,'
      '  D.STATUS_DET,'
      '  V.SERIE_NCF_ASIGNADO,'
      '  N.NUMERO_NCF,'
      '  Abs(V.MONTO_DESCUENTO) MONTO_DESCUENTO,'
      '  D.NUMERO,'
      '  D.CODIGO_BARRA,'
      '  D.NUM_FACTURA,'
      '  D.FECHA_IN,'
      '  D.IN_POR,'
      '  D.FECHA_MOD,'
      '  D.MOD_POR,'
      '  D.CANT_REGRESO,'
      '  D.CANT_PROMO,'
      '  D.MONTO_DIETA,'
      '  D.MONTO_AJUSTE,'
      '  D.SERIE_PROD,'
      '  D.STATUS_CNT,'
      '  D.TIPO_UNIDAD,'
      '  D.ITBIS_EXENTO,'
      '  D.TIPO_VENTA,'
      '   D.DESCRIPCION,'
      '  d.precio_compra,d.cant_viajes,'
      '  case  nullif( D.DESCRIPCIONPRODUCTO, '#39#39' ) when '#39#39'  then'
      '    D.DESCRIPCION'
      '  else '
      '   D.DESCRIPCION ||'#39' '#39'|| D.DESCRIPCIONPRODUCTO'
      '   end as DESCRIPCIONPRODUCTO,'
      '   u.descripcion DescUnidadMedida,'
      
        ' SUBSTRING(u.DESCRIPCION from 1 for 1) LTIPO_UNIDAD, u.cantidad ' +
        'cantXunidad '
      'FROM'
      '  VENTAS_MAST V'
      '  INNER JOIN VENTAS_DET D ON (V.NUMERO = D.NUMERO)'
      
        '  LEFT OUTER JOIN NCF_ASIGNADOS N ON (V.SERIE_NCF_ASIGNADO = N.S' +
        'ERIE)'
      '  LEFT OUTER JOIN TIPO_CF F ON (N.TIPO_NCF = F.TIPO_CF)'
      '  Left Outer join UNIDADES u on (d.tipo_unidad = u.idunidad)'
      
        '  left outer join INVENTARIO_PRODUCTO i on i.codigo = d.CODIGO_P' +
        'ROD'
      'Where   D.NUMERO =:numero'
      '')
    Left = 704
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
        Value = '47235'
      end>
    object qryVentaFacturaDetDESC_TIPO_NCF: TIBStringField
      FieldName = 'DESC_TIPO_NCF'
      Origin = 'TIPO_CF.DESCRIPCION'
      Size = 60
    end
    object qryVentaFacturaDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET.SERIE'
      Required = True
    end
    object qryVentaFacturaDetCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryVentaFacturaDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object qryVentaFacturaDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET.CANTIDAD'
    end
    object qryVentaFacturaDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET.PRECIO'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET.PORC_DESC_DET'
    end
    object qryVentaFacturaDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET.ITBI_DET'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaDetVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET.VALOR_SERVICIO_DET'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaDetVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_DET.VALOR_TOTAL_DET'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaDetNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST.NUMERO_FACTURA'
    end
    object qryVentaFacturaDetSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaDetSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
    object qryVentaFacturaDetNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
    object qryVentaFacturaDetMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_MAST.MONTO_DESCUENTO'
    end
    object qryVentaFacturaDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_DET.NUMERO'
      Required = True
    end
    object qryVentaFacturaDetCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VENTAS_DET.CODIGO_BARRA'
    end
    object qryVentaFacturaDetNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VENTAS_DET.NUM_FACTURA'
    end
    object qryVentaFacturaDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_DET.FECHA_IN'
    end
    object qryVentaFacturaDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_DET.IN_POR'
      Size = 12
    end
    object qryVentaFacturaDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_DET.FECHA_MOD'
    end
    object qryVentaFacturaDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_DET.MOD_POR'
      Size = 12
    end
    object qryVentaFacturaDetCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VENTAS_DET.CANT_REGRESO'
    end
    object qryVentaFacturaDetCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VENTAS_DET.CANT_PROMO'
    end
    object qryVentaFacturaDetMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VENTAS_DET.MONTO_DIETA'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaDetMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VENTAS_DET.MONTO_AJUSTE'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaDetSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VENTAS_DET.SERIE_PROD'
      Size = 50
    end
    object qryVentaFacturaDetSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VENTAS_DET.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaDetTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VENTAS_DET.TIPO_UNIDAD'
    end
    object qryVentaFacturaDetITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VENTAS_DET.ITBIS_EXENTO'
    end
    object qryVentaFacturaDetTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VENTAS_DET.TIPO_VENTA'
    end
    object qryVentaFacturaDetDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VENTAS_DET.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryVentaFacturaDetPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'VENTAS_DET.PRECIO_COMPRA'
    end
    object qryVentaFacturaDetCANT_CONDUCE: TFloatField
      FieldName = 'CANT_CONDUCE'
      Origin = 'VENTAS_DET.CANT_CONDUCE'
    end
    object qryVentaFacturaDetPORC_DESC_ITEM: TFloatField
      FieldName = 'PORC_DESC_ITEM'
      Origin = 'VENTAS_DET.PORC_DESC_ITEM'
    end
    object qryVentaFacturaDetMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VENTAS_DET.MONTO_DESC_ITEM'
    end
    object qryVentaFacturaDetCANT_VIAJES: TFloatField
      FieldName = 'CANT_VIAJES'
      Origin = 'VENTAS_DET.CANT_VIAJES'
    end
    object qryVentaFacturaDetDESCUNIDADMEDIDA: TIBStringField
      FieldName = 'DESCUNIDADMEDIDA'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
    object qryVentaFacturaDetLTIPO_UNIDAD: TIBStringField
      FieldName = 'LTIPO_UNIDAD'
      Size = 50
    end
    object qryVentaFacturaDetCANTXUNIDAD: TIntegerField
      FieldName = 'CANTXUNIDAD'
      Origin = 'UNIDADES.CANTIDAD'
    end
    object qryVentaFacturaDetREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
  end
  object ibsqlUpdate: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'update VENTAS_MAST r'
      'set r.cod_usr_caja =:codusrcaja'
      'where r.numero =:numero')
    Transaction = dmConectar.IBTransaction1
    Left = 256
    Top = 464
  end
  object tblVentaVocados: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from VENTAS_VOCADOS'
      'where'
      '  NUMERO_TRN = :OLD_NUMERO_TRN')
    InsertSQL.Strings = (
      'insert into VENTAS_VOCADOS'
      
        '  (NUMERO_TRN, COD_PRODUCTO, DESCRIPCION, PRECIO, COD_SUBCLIENTE' +
        ', PAGA_PORC_ITBIS, '
      '   NOMBRESUBCLIENTE, DIRECCIONSUBCTE)'
      'values'
      
        '  (:NUMERO_TRN, :COD_PRODUCTO, :DESCRIPCION, :PRECIO, :COD_SUBCL' +
        'IENTE, '
      '   :PAGA_PORC_ITBIS, :NOMBRESUBCLIENTE, :DIRECCIONSUBCTE)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_TRN,'
      '  COD_PRODUCTO,'
      '  DESCRIPCION,'
      '  PRECIO,'
      '  COD_SUBCLIENTE,'
      '  PAGA_PORC_ITBIS,'
      '  NOMBRESUBCLIENTE,'
      '  DIRECCIONSUBCTE'
      'from VENTAS_VOCADOS '
      'where'
      '  NUMERO_TRN = :NUMERO_TRN')
    SelectSQL.Strings = (
      'Select * From VENTAS_VOCADOS'
      'Where numero_trn =:numerotrn')
    ModifySQL.Strings = (
      'update VENTAS_VOCADOS'
      'set'
      '  NUMERO_TRN = :NUMERO_TRN,'
      '  COD_PRODUCTO = :COD_PRODUCTO,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  PRECIO = :PRECIO,'
      '  COD_SUBCLIENTE = :COD_SUBCLIENTE,'
      '  PAGA_PORC_ITBIS = :PAGA_PORC_ITBIS,'
      '  NOMBRESUBCLIENTE = :NOMBRESUBCLIENTE,'
      '  DIRECCIONSUBCTE = :DIRECCIONSUBCTE'
      'where'
      '  NUMERO_TRN = :OLD_NUMERO_TRN')
    Left = 696
    Top = 32
    object tblVentaVocadosNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'VENTAS_VOCADOS.NUMERO_TRN'
      Required = True
    end
    object tblVentaVocadosCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'VENTAS_VOCADOS.COD_PRODUCTO'
      Required = True
    end
    object tblVentaVocadosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_VOCADOS.DESCRIPCION'
      Size = 80
    end
    object tblVentaVocadosPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_VOCADOS.PRECIO'
      DisplayFormat = ',0.00'
    end
    object tblVentaVocadosCOD_SUBCLIENTE: TIntegerField
      FieldName = 'COD_SUBCLIENTE'
      Origin = 'VENTAS_VOCADOS.COD_SUBCLIENTE'
      Required = True
    end
    object tblVentaVocadosPAGA_PORC_ITBIS: TFloatField
      FieldName = 'PAGA_PORC_ITBIS'
      Origin = 'VENTAS_VOCADOS.PAGA_PORC_ITBIS'
      DisplayFormat = ',0.00'
    end
    object tblVentaVocadosNOMBRESUBCLIENTE: TIBStringField
      FieldName = 'NOMBRESUBCLIENTE'
      Origin = 'VENTAS_VOCADOS.NOMBRESUBCLIENTE'
      Size = 80
    end
    object tblVentaVocadosDIRECCIONSUBCTE: TIBStringField
      FieldName = 'DIRECCIONSUBCTE'
      Origin = 'VENTAS_VOCADOS.DIRECCIONSUBCTE'
      Size = 80
    end
  end
  object dstblVentaVocados: TDataSource
    DataSet = tblVentaVocados
    Left = 696
    Top = 80
  end
  object qryInv: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from INVENTARIO_PRODUCTO'
      'order by descripcion')
    Left = 720
    Top = 296
  end
  object qryVentaVocados: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select  v.*,  c.direccion_cont,  c.nombre_facturar  From VENTAS_' +
        'VOCADOS v'
      'left outer join clientes c on c.CODIGO_CTE = v.COD_SUBCLIENTE'
      'inner join INVENTARIO_PRODUCTO i on i.CODIGO = v.COD_PRODUCTO'
      'where v.NUMERO_TRN =:numerotrn'
      ' ')
    Left = 704
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerotrn'
        ParamType = ptInput
      end>
    object qryVentaVocadosNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'VENTAS_VOCADOS.NUMERO_TRN'
      Required = True
    end
    object qryVentaVocadosCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'VENTAS_VOCADOS.COD_PRODUCTO'
      Required = True
    end
    object qryVentaVocadosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_VOCADOS.DESCRIPCION'
      Size = 80
    end
    object qryVentaVocadosPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_VOCADOS.PRECIO'
    end
    object qryVentaVocadosCOD_SUBCLIENTE: TIntegerField
      FieldName = 'COD_SUBCLIENTE'
      Origin = 'VENTAS_VOCADOS.COD_SUBCLIENTE'
      Required = True
    end
    object qryVentaVocadosNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryVentaVocadosDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryVentaVocadosPAGA_PORC_ITBIS: TFloatField
      FieldName = 'PAGA_PORC_ITBIS'
      Origin = 'VENTAS_VOCADOS.PAGA_PORC_ITBIS'
    end
    object qryVentaVocadosNOMBRESUBCLIENTE: TIBStringField
      FieldName = 'NOMBRESUBCLIENTE'
      Origin = 'VENTAS_VOCADOS.NOMBRESUBCLIENTE'
      Size = 80
    end
    object qryVentaVocadosDIRECCIONSUBCTE: TIBStringField
      FieldName = 'DIRECCIONSUBCTE'
      Origin = 'VENTAS_VOCADOS.DIRECCIONSUBCTE'
      Size = 80
    end
  end
  object tblVtaMast: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from Ventas_mast'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into Ventas_mast'
      
        '  (NUMERO, FECHA, CIA_KEY, CODIGO_CTE, CODIGO_VENDEDOR, FORMA_PA' +
        'GO, OBSERVACION, '
      
        '   MONEDA, VALOR_TOTAL_DET, STATUS, FECHA_IN, IN_POR, FECHA_MOD,' +
        ' MOD_POR, '
      
        '   NUMERO_FACTURA, NUMERO_DOC_PAGO, SERIE_NCF_ASIGNADO, MONTO_BR' +
        'UTO, PORC_DESCUENTO, '
      
        '   MONTO_DESCUENTO, MONTO_INICIAL, NOMBRE_CLIENTE_GENERAL, MONTO' +
        '_PAGADO, '
      
        '   MONTO_CAMBIO, MONTO_TOTAL_ITBIS, MONTODESCGASTOSADMIN, MONTOD' +
        'ESCITBISGASTOSADMIN, '
      
        '   MONTODESCTRANSP, MONTODESCDIRTECNICA, MONTODESCITBISDIRTECNIC' +
        'A, MONTODESCIMPREVISTO, '
      
        '   MONTODESCITBISIMPREVISTO, DESC_MONTO_COMBUSTIBLE, DESC_MONTO_' +
        'PRESTAMO, '
      
        '   DESC_MONTO_SINDICATO, DESC_IMP_SOBRE_RENTA, DESC_OTROS, PORC_' +
        'DESC_SINDICATO, '
      
        '   PORC_DESC_IMP_SOBRE_RENTA, DESC_RUTA, OTROS_DESCUENTOS_2, OTR' +
        'OS_DESCUENTOS_3, '
      
        '   MONTO_DESC_CHOFER, TIPO_VENTA, COMENTARIO, COTIZACION_ORIGEN,' +
        ' REFERENCIACTE, '
      
        '   MONTO_RECARGO, TIPONCFIFISCAL, MONTO_EXONERADO_ITBIS, NIF_IMP' +
        'RESO, IDRETENCION, '
      
        '   PORCPROPINALEGAL, PROPINA, PROPINALEGAL, TICKET_ID, SUB_TOTAL' +
        'ITBIS, '
      '   COD_USR_CAJA, COD_SUBCLIENTE)'
      'values'
      
        '  (:NUMERO, :FECHA, :CIA_KEY, :CODIGO_CTE, :CODIGO_VENDEDOR, :FO' +
        'RMA_PAGO, '
      
        '   :OBSERVACION, :MONEDA, :VALOR_TOTAL_DET, :STATUS, :FECHA_IN, ' +
        ':IN_POR, '
      
        '   :FECHA_MOD, :MOD_POR, :NUMERO_FACTURA, :NUMERO_DOC_PAGO, :SER' +
        'IE_NCF_ASIGNADO, '
      
        '   :MONTO_BRUTO, :PORC_DESCUENTO, :MONTO_DESCUENTO, :MONTO_INICI' +
        'AL, :NOMBRE_CLIENTE_GENERAL, '
      
        '   :MONTO_PAGADO, :MONTO_CAMBIO, :MONTO_TOTAL_ITBIS, :MONTODESCG' +
        'ASTOSADMIN, '
      
        '   :MONTODESCITBISGASTOSADMIN, :MONTODESCTRANSP, :MONTODESCDIRTE' +
        'CNICA, '
      
        '   :MONTODESCITBISDIRTECNICA, :MONTODESCIMPREVISTO, :MONTODESCIT' +
        'BISIMPREVISTO, '
      
        '   :DESC_MONTO_COMBUSTIBLE, :DESC_MONTO_PRESTAMO, :DESC_MONTO_SI' +
        'NDICATO, '
      
        '   :DESC_IMP_SOBRE_RENTA, :DESC_OTROS, :PORC_DESC_SINDICATO, :PO' +
        'RC_DESC_IMP_SOBRE_RENTA, '
      
        '   :DESC_RUTA, :OTROS_DESCUENTOS_2, :OTROS_DESCUENTOS_3, :MONTO_' +
        'DESC_CHOFER, '
      
        '   :TIPO_VENTA, :COMENTARIO, :COTIZACION_ORIGEN, :REFERENCIACTE,' +
        ' :MONTO_RECARGO, '
      
        '   :TIPONCFIFISCAL, :MONTO_EXONERADO_ITBIS, :NIF_IMPRESO, :IDRET' +
        'ENCION, '
      
        '   :PORCPROPINALEGAL, :PROPINA, :PROPINALEGAL, :TICKET_ID, :SUB_' +
        'TOTALITBIS, '
      '   :COD_USR_CAJA, :COD_SUBCLIENTE)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA,'
      '  CIA_KEY,'
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
      '  NUMERO_DOC_PAGO,'
      '  SERIE_NCF_ASIGNADO,'
      '  MONTO_BRUTO,'
      '  PORC_DESCUENTO,'
      '  MONTO_DESCUENTO,'
      '  MONTO_INICIAL,'
      '  NOMBRE_CLIENTE_GENERAL,'
      '  MONTO_PAGADO,'
      '  MONTO_CAMBIO,'
      '  MONTO_TOTAL_ITBIS,'
      '  MONTODESCGASTOSADMIN,'
      '  MONTODESCITBISGASTOSADMIN,'
      '  MONTODESCTRANSP,'
      '  MONTODESCDIRTECNICA,'
      '  MONTODESCITBISDIRTECNICA,'
      '  MONTODESCIMPREVISTO,'
      '  MONTODESCITBISIMPREVISTO,'
      '  DESC_MONTO_COMBUSTIBLE,'
      '  DESC_MONTO_PRESTAMO,'
      '  DESC_MONTO_SINDICATO,'
      '  DESC_IMP_SOBRE_RENTA,'
      '  DESC_OTROS,'
      '  PORC_DESC_SINDICATO,'
      '  PORC_DESC_IMP_SOBRE_RENTA,'
      '  DESC_RUTA,'
      '  OTROS_DESCUENTOS_2,'
      '  OTROS_DESCUENTOS_3,'
      '  MONTO_DESC_CHOFER,'
      '  TIPO_VENTA,'
      '  COMENTARIO,'
      '  COTIZACION_ORIGEN,'
      '  REFERENCIACTE,'
      '  MONTO_RECARGO,'
      '  TIPONCFIFISCAL,'
      '  MONTO_EXONERADO_ITBIS,'
      '  NIF_IMPRESO,'
      '  IDRETENCION,'
      '  PORCPROPINALEGAL,'
      '  PROPINA,'
      '  PROPINALEGAL,'
      '  TICKET_ID,'
      '  SUB_TOTALITBIS,'
      '  COD_USR_CAJA,'
      '  COD_SUBCLIENTE'
      'from Ventas_mast '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select * from Ventas_mast'
      'where numero =:numero')
    ModifySQL.Strings = (
      'update Ventas_mast'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  CIA_KEY = :CIA_KEY,'
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
      '  NUMERO_DOC_PAGO = :NUMERO_DOC_PAGO,'
      '  SERIE_NCF_ASIGNADO = :SERIE_NCF_ASIGNADO,'
      '  MONTO_BRUTO = :MONTO_BRUTO,'
      '  PORC_DESCUENTO = :PORC_DESCUENTO,'
      '  MONTO_DESCUENTO = :MONTO_DESCUENTO,'
      '  MONTO_INICIAL = :MONTO_INICIAL,'
      '  NOMBRE_CLIENTE_GENERAL = :NOMBRE_CLIENTE_GENERAL,'
      '  MONTO_PAGADO = :MONTO_PAGADO,'
      '  MONTO_CAMBIO = :MONTO_CAMBIO,'
      '  MONTO_TOTAL_ITBIS = :MONTO_TOTAL_ITBIS,'
      '  MONTODESCGASTOSADMIN = :MONTODESCGASTOSADMIN,'
      '  MONTODESCITBISGASTOSADMIN = :MONTODESCITBISGASTOSADMIN,'
      '  MONTODESCTRANSP = :MONTODESCTRANSP,'
      '  MONTODESCDIRTECNICA = :MONTODESCDIRTECNICA,'
      '  MONTODESCITBISDIRTECNICA = :MONTODESCITBISDIRTECNICA,'
      '  MONTODESCIMPREVISTO = :MONTODESCIMPREVISTO,'
      '  MONTODESCITBISIMPREVISTO = :MONTODESCITBISIMPREVISTO,'
      '  DESC_MONTO_COMBUSTIBLE = :DESC_MONTO_COMBUSTIBLE,'
      '  DESC_MONTO_PRESTAMO = :DESC_MONTO_PRESTAMO,'
      '  DESC_MONTO_SINDICATO = :DESC_MONTO_SINDICATO,'
      '  DESC_IMP_SOBRE_RENTA = :DESC_IMP_SOBRE_RENTA,'
      '  DESC_OTROS = :DESC_OTROS,'
      '  PORC_DESC_SINDICATO = :PORC_DESC_SINDICATO,'
      '  PORC_DESC_IMP_SOBRE_RENTA = :PORC_DESC_IMP_SOBRE_RENTA,'
      '  DESC_RUTA = :DESC_RUTA,'
      '  OTROS_DESCUENTOS_2 = :OTROS_DESCUENTOS_2,'
      '  OTROS_DESCUENTOS_3 = :OTROS_DESCUENTOS_3,'
      '  MONTO_DESC_CHOFER = :MONTO_DESC_CHOFER,'
      '  TIPO_VENTA = :TIPO_VENTA,'
      '  COMENTARIO = :COMENTARIO,'
      '  COTIZACION_ORIGEN = :COTIZACION_ORIGEN,'
      '  REFERENCIACTE = :REFERENCIACTE,'
      '  MONTO_RECARGO = :MONTO_RECARGO,'
      '  TIPONCFIFISCAL = :TIPONCFIFISCAL,'
      '  MONTO_EXONERADO_ITBIS = :MONTO_EXONERADO_ITBIS,'
      '  NIF_IMPRESO = :NIF_IMPRESO,'
      '  IDRETENCION = :IDRETENCION,'
      '  PORCPROPINALEGAL = :PORCPROPINALEGAL,'
      '  PROPINA = :PROPINA,'
      '  PROPINALEGAL = :PROPINALEGAL,'
      '  TICKET_ID = :TICKET_ID,'
      '  SUB_TOTALITBIS = :SUB_TOTALITBIS,'
      '  COD_USR_CAJA = :COD_USR_CAJA,'
      '  COD_SUBCLIENTE = :COD_SUBCLIENTE'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 520
    Top = 448
    object tblVtaMastNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object tblVtaMastFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object tblVtaMastCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VENTAS_MAST.CIA_KEY'
    end
    object tblVtaMastCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST.CODIGO_CTE'
    end
    object tblVtaMastCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VENTAS_MAST.CODIGO_VENDEDOR'
    end
    object tblVtaMastFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VENTAS_MAST.FORMA_PAGO'
    end
    object tblVtaMastOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VENTAS_MAST.OBSERVACION'
      Size = 60
    end
    object tblVtaMastMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_MAST.MONEDA'
      FixedChar = True
      Size = 1
    end
    object tblVtaMastVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST.VALOR_TOTAL_DET'
    end
    object tblVtaMastSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENTAS_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblVtaMastFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_MAST.FECHA_IN'
    end
    object tblVtaMastIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_MAST.IN_POR'
      Size = 12
    end
    object tblVtaMastFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_MAST.FECHA_MOD'
    end
    object tblVtaMastMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_MAST.MOD_POR'
      Size = 12
    end
    object tblVtaMastNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST.NUMERO_FACTURA'
    end
    object tblVtaMastNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VENTAS_MAST.NUMERO_DOC_PAGO'
    end
    object tblVtaMastSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
    object tblVtaMastMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'VENTAS_MAST.MONTO_BRUTO'
    end
    object tblVtaMastPORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VENTAS_MAST.PORC_DESCUENTO'
    end
    object tblVtaMastMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_MAST.MONTO_DESCUENTO'
    end
    object tblVtaMastMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'VENTAS_MAST.MONTO_INICIAL'
    end
    object tblVtaMastNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'VENTAS_MAST.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
    object tblVtaMastMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VENTAS_MAST.MONTO_PAGADO'
    end
    object tblVtaMastMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'VENTAS_MAST.MONTO_CAMBIO'
    end
    object tblVtaMastMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'VENTAS_MAST.MONTO_TOTAL_ITBIS'
    end
    object tblVtaMastMONTODESCGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCGASTOSADMIN'
      Origin = 'VENTAS_MAST.MONTODESCGASTOSADMIN'
    end
    object tblVtaMastMONTODESCITBISGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCITBISGASTOSADMIN'
      Origin = 'VENTAS_MAST.MONTODESCITBISGASTOSADMIN'
    end
    object tblVtaMastMONTODESCTRANSP: TFloatField
      FieldName = 'MONTODESCTRANSP'
      Origin = 'VENTAS_MAST.MONTODESCTRANSP'
    end
    object tblVtaMastMONTODESCDIRTECNICA: TFloatField
      FieldName = 'MONTODESCDIRTECNICA'
      Origin = 'VENTAS_MAST.MONTODESCDIRTECNICA'
    end
    object tblVtaMastMONTODESCITBISDIRTECNICA: TFloatField
      FieldName = 'MONTODESCITBISDIRTECNICA'
      Origin = 'VENTAS_MAST.MONTODESCITBISDIRTECNICA'
    end
    object tblVtaMastMONTODESCIMPREVISTO: TFloatField
      FieldName = 'MONTODESCIMPREVISTO'
      Origin = 'VENTAS_MAST.MONTODESCIMPREVISTO'
    end
    object tblVtaMastMONTODESCITBISIMPREVISTO: TFloatField
      FieldName = 'MONTODESCITBISIMPREVISTO'
      Origin = 'VENTAS_MAST.MONTODESCITBISIMPREVISTO'
    end
    object tblVtaMastDESC_MONTO_COMBUSTIBLE: TFloatField
      FieldName = 'DESC_MONTO_COMBUSTIBLE'
      Origin = 'VENTAS_MAST.DESC_MONTO_COMBUSTIBLE'
    end
    object tblVtaMastDESC_MONTO_PRESTAMO: TFloatField
      FieldName = 'DESC_MONTO_PRESTAMO'
      Origin = 'VENTAS_MAST.DESC_MONTO_PRESTAMO'
    end
    object tblVtaMastDESC_MONTO_SINDICATO: TFloatField
      FieldName = 'DESC_MONTO_SINDICATO'
      Origin = 'VENTAS_MAST.DESC_MONTO_SINDICATO'
    end
    object tblVtaMastDESC_IMP_SOBRE_RENTA: TFloatField
      FieldName = 'DESC_IMP_SOBRE_RENTA'
      Origin = 'VENTAS_MAST.DESC_IMP_SOBRE_RENTA'
    end
    object tblVtaMastDESC_OTROS: TFloatField
      FieldName = 'DESC_OTROS'
      Origin = 'VENTAS_MAST.DESC_OTROS'
    end
    object tblVtaMastPORC_DESC_SINDICATO: TIBBCDField
      FieldName = 'PORC_DESC_SINDICATO'
      Origin = 'VENTAS_MAST.PORC_DESC_SINDICATO'
      Precision = 9
      Size = 2
    end
    object tblVtaMastPORC_DESC_IMP_SOBRE_RENTA: TIBBCDField
      FieldName = 'PORC_DESC_IMP_SOBRE_RENTA'
      Origin = 'VENTAS_MAST.PORC_DESC_IMP_SOBRE_RENTA'
      Precision = 9
      Size = 2
    end
    object tblVtaMastDESC_RUTA: TFloatField
      FieldName = 'DESC_RUTA'
      Origin = 'VENTAS_MAST.DESC_RUTA'
    end
    object tblVtaMastOTROS_DESCUENTOS_2: TFloatField
      FieldName = 'OTROS_DESCUENTOS_2'
      Origin = 'VENTAS_MAST.OTROS_DESCUENTOS_2'
    end
    object tblVtaMastOTROS_DESCUENTOS_3: TFloatField
      FieldName = 'OTROS_DESCUENTOS_3'
      Origin = 'VENTAS_MAST.OTROS_DESCUENTOS_3'
    end
    object tblVtaMastMONTO_DESC_CHOFER: TFloatField
      FieldName = 'MONTO_DESC_CHOFER'
      Origin = 'VENTAS_MAST.MONTO_DESC_CHOFER'
    end
    object tblVtaMastTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VENTAS_MAST.TIPO_VENTA'
    end
    object tblVtaMastCOMENTARIO: TIBStringField
      FieldName = 'COMENTARIO'
      Origin = 'VENTAS_MAST.COMENTARIO'
      Size = 80
    end
    object tblVtaMastCOTIZACION_ORIGEN: TIntegerField
      FieldName = 'COTIZACION_ORIGEN'
      Origin = 'VENTAS_MAST.COTIZACION_ORIGEN'
    end
    object tblVtaMastREFERENCIACTE: TIBStringField
      FieldName = 'REFERENCIACTE'
      Origin = 'VENTAS_MAST.REFERENCIACTE'
    end
    object tblVtaMastMONTO_RECARGO: TFloatField
      FieldName = 'MONTO_RECARGO'
      Origin = 'VENTAS_MAST.MONTO_RECARGO'
    end
    object tblVtaMastTIPONCFIFISCAL: TIntegerField
      FieldName = 'TIPONCFIFISCAL'
      Origin = 'VENTAS_MAST.TIPONCFIFISCAL'
    end
    object tblVtaMastMONTO_EXONERADO_ITBIS: TFloatField
      FieldName = 'MONTO_EXONERADO_ITBIS'
      Origin = 'VENTAS_MAST.MONTO_EXONERADO_ITBIS'
    end
    object tblVtaMastNIF_IMPRESO: TSmallintField
      FieldName = 'NIF_IMPRESO'
      Origin = 'VENTAS_MAST.NIF_IMPRESO'
    end
    object tblVtaMastIDRETENCION: TIntegerField
      FieldName = 'IDRETENCION'
      Origin = 'VENTAS_MAST.IDRETENCION'
    end
    object tblVtaMastPORCPROPINALEGAL: TFloatField
      FieldName = 'PORCPROPINALEGAL'
      Origin = 'VENTAS_MAST.PORCPROPINALEGAL'
    end
    object tblVtaMastPROPINA: TFloatField
      FieldName = 'PROPINA'
      Origin = 'VENTAS_MAST.PROPINA'
    end
    object tblVtaMastPROPINALEGAL: TFloatField
      FieldName = 'PROPINALEGAL'
      Origin = 'VENTAS_MAST.PROPINALEGAL'
    end
    object tblVtaMastTICKET_ID: TIntegerField
      FieldName = 'TICKET_ID'
      Origin = 'VENTAS_MAST.TICKET_ID'
    end
    object tblVtaMastSUB_TOTALITBIS: TFloatField
      FieldName = 'SUB_TOTALITBIS'
      Origin = 'VENTAS_MAST.SUB_TOTALITBIS'
    end
    object tblVtaMastCOD_USR_CAJA: TIntegerField
      FieldName = 'COD_USR_CAJA'
      Origin = 'VENTAS_MAST.COD_USR_CAJA'
    end
    object tblVtaMastCOD_SUBCLIENTE: TIntegerField
      FieldName = 'COD_SUBCLIENTE'
      Origin = 'VENTAS_MAST.COD_SUBCLIENTE'
    end
  end
  object tblConduceDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from VENTAS_DET_CONDUCE'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into VENTAS_DET_CONDUCE'
      
        '  (SERIE, NUMERO, CODIGO_PROD, CODIGO_BARRA, DESCRIPCION, CANTID' +
        'AD, PRECIO, '
      
        '   PORC_DESC_DET, ITBI_DET, VALOR_SERVICIO_DET, VALOR_TOTAL_DET,' +
        ' NUM_FACTURA, '
      
        '   STATUS_DET, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, CANT_REGRES' +
        'O, CANT_PROMO, '
      
        '   MONTO_DIETA, MONTO_AJUSTE, SERIE_PROD, STATUS_CNT, TIPO_UNIDA' +
        'D, ITBIS_EXENTO, '
      
        '   TIPO_VENTA, DESCRIPCIONPRODUCTO, COD_EMPLEADO_CONDUCTOR, PLAC' +
        'A_VEHICULO, '
      
        '   MONEDA, MONTO_TASA, CAPACIDAD, CANT_VIAJES, CANT_METROS_CUBIC' +
        'O, FICHA_VEH, '
      
        '   IDZONA_ORIGEN, IDZONA_DETALLE, PRECIO_COMPRA, CANT_CONDUCE, P' +
        'ORC_DESC_ITEM, '
      
        '   MONTO_DESC_ITEM, ITBIS_FISCAL_DET, IDTASAITBIS, MONTOIBISRECA' +
        'RGO, DC_ITBIS_CLD, '
      '   TC_MONTOITBISRECARGO_GLB, TC_MONTOITBISRECARGO_ITM)'
      'values'
      
        '  (:SERIE, :NUMERO, :CODIGO_PROD, :CODIGO_BARRA, :DESCRIPCION, :' +
        'CANTIDAD, '
      
        '   :PRECIO, :PORC_DESC_DET, :ITBI_DET, :VALOR_SERVICIO_DET, :VAL' +
        'OR_TOTAL_DET, '
      
        '   :NUM_FACTURA, :STATUS_DET, :FECHA_IN, :IN_POR, :FECHA_MOD, :M' +
        'OD_POR, '
      
        '   :CANT_REGRESO, :CANT_PROMO, :MONTO_DIETA, :MONTO_AJUSTE, :SER' +
        'IE_PROD, '
      
        '   :STATUS_CNT, :TIPO_UNIDAD, :ITBIS_EXENTO, :TIPO_VENTA, :DESCR' +
        'IPCIONPRODUCTO, '
      
        '   :COD_EMPLEADO_CONDUCTOR, :PLACA_VEHICULO, :MONEDA, :MONTO_TAS' +
        'A, :CAPACIDAD, '
      
        '   :CANT_VIAJES, :CANT_METROS_CUBICO, :FICHA_VEH, :IDZONA_ORIGEN' +
        ', :IDZONA_DETALLE, '
      
        '   :PRECIO_COMPRA, :CANT_CONDUCE, :PORC_DESC_ITEM, :MONTO_DESC_I' +
        'TEM, :ITBIS_FISCAL_DET, '
      
        '   :IDTASAITBIS, :MONTOIBISRECARGO, :DC_ITBIS_CLD, :TC_MONTOITBI' +
        'SRECARGO_GLB, '
      '   :TC_MONTOITBISRECARGO_ITM)')
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
      '  MONTO_AJUSTE,'
      '  SERIE_PROD,'
      '  STATUS_CNT,'
      '  TIPO_UNIDAD,'
      '  ITBIS_EXENTO,'
      '  TIPO_VENTA,'
      '  DESCRIPCIONPRODUCTO,'
      '  COD_EMPLEADO_CONDUCTOR,'
      '  PLACA_VEHICULO,'
      '  MONEDA,'
      '  MONTO_TASA,'
      '  CAPACIDAD,'
      '  CANT_VIAJES,'
      '  CANT_METROS_CUBICO,'
      '  FICHA_VEH,'
      '  IDZONA_ORIGEN,'
      '  IDZONA_DETALLE,'
      '  PRECIO_COMPRA,'
      '  CANT_CONDUCE,'
      '  PORC_DESC_ITEM,'
      '  MONTO_DESC_ITEM,'
      '  ITBIS_FISCAL_DET,'
      '  IDTASAITBIS,'
      '  MONTOIBISRECARGO,'
      '  DC_ITBIS_CLD,'
      '  TC_MONTOITBISRECARGO_GLB,'
      '  TC_MONTOITBISRECARGO_ITM'
      'from VENTAS_DET_CONDUCE '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select * from VENTAS_DET_CONDUCE'
      'where NUMERO=:numero')
    ModifySQL.Strings = (
      'update VENTAS_DET_CONDUCE'
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
      '  MONTO_AJUSTE = :MONTO_AJUSTE,'
      '  SERIE_PROD = :SERIE_PROD,'
      '  STATUS_CNT = :STATUS_CNT,'
      '  TIPO_UNIDAD = :TIPO_UNIDAD,'
      '  ITBIS_EXENTO = :ITBIS_EXENTO,'
      '  TIPO_VENTA = :TIPO_VENTA,'
      '  DESCRIPCIONPRODUCTO = :DESCRIPCIONPRODUCTO,'
      '  COD_EMPLEADO_CONDUCTOR = :COD_EMPLEADO_CONDUCTOR,'
      '  PLACA_VEHICULO = :PLACA_VEHICULO,'
      '  MONEDA = :MONEDA,'
      '  MONTO_TASA = :MONTO_TASA,'
      '  CAPACIDAD = :CAPACIDAD,'
      '  CANT_VIAJES = :CANT_VIAJES,'
      '  CANT_METROS_CUBICO = :CANT_METROS_CUBICO,'
      '  FICHA_VEH = :FICHA_VEH,'
      '  IDZONA_ORIGEN = :IDZONA_ORIGEN,'
      '  IDZONA_DETALLE = :IDZONA_DETALLE,'
      '  PRECIO_COMPRA = :PRECIO_COMPRA,'
      '  CANT_CONDUCE = :CANT_CONDUCE,'
      '  PORC_DESC_ITEM = :PORC_DESC_ITEM,'
      '  MONTO_DESC_ITEM = :MONTO_DESC_ITEM,'
      '  ITBIS_FISCAL_DET = :ITBIS_FISCAL_DET,'
      '  IDTASAITBIS = :IDTASAITBIS,'
      '  MONTOIBISRECARGO = :MONTOIBISRECARGO,'
      '  DC_ITBIS_CLD = :DC_ITBIS_CLD,'
      '  TC_MONTOITBISRECARGO_GLB = :TC_MONTOITBISRECARGO_GLB,'
      '  TC_MONTOITBISRECARGO_ITM = :TC_MONTOITBISRECARGO_ITM'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 736
    Top = 192
    object tblConduceDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET_CONDUCE.SERIE'
      Required = True
    end
    object tblConduceDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_DET_CONDUCE.NUMERO'
      Required = True
    end
    object tblConduceDetCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET_CONDUCE.CODIGO_PROD'
      Size = 40
    end
    object tblConduceDetCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VENTAS_DET_CONDUCE.CODIGO_BARRA'
    end
    object tblConduceDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET_CONDUCE.DESCRIPCION'
      Size = 80
    end
    object tblConduceDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET_CONDUCE.CANTIDAD'
    end
    object tblConduceDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET_CONDUCE.PRECIO'
    end
    object tblConduceDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET_CONDUCE.PORC_DESC_DET'
    end
    object tblConduceDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET_CONDUCE.ITBI_DET'
    end
    object tblConduceDetVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET_CONDUCE.VALOR_SERVICIO_DET'
    end
    object tblConduceDetVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_DET_CONDUCE.VALOR_TOTAL_DET'
    end
    object tblConduceDetNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VENTAS_DET_CONDUCE.NUM_FACTURA'
    end
    object tblConduceDetSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET_CONDUCE.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object tblConduceDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_DET_CONDUCE.FECHA_IN'
    end
    object tblConduceDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_DET_CONDUCE.IN_POR'
      Size = 12
    end
    object tblConduceDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_DET_CONDUCE.FECHA_MOD'
    end
    object tblConduceDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_DET_CONDUCE.MOD_POR'
      Size = 12
    end
    object tblConduceDetCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VENTAS_DET_CONDUCE.CANT_REGRESO'
    end
    object tblConduceDetCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VENTAS_DET_CONDUCE.CANT_PROMO'
    end
    object tblConduceDetMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VENTAS_DET_CONDUCE.MONTO_DIETA'
    end
    object tblConduceDetMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VENTAS_DET_CONDUCE.MONTO_AJUSTE'
    end
    object tblConduceDetSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VENTAS_DET_CONDUCE.SERIE_PROD'
      Size = 50
    end
    object tblConduceDetSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VENTAS_DET_CONDUCE.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object tblConduceDetTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VENTAS_DET_CONDUCE.TIPO_UNIDAD'
    end
    object tblConduceDetITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VENTAS_DET_CONDUCE.ITBIS_EXENTO'
    end
    object tblConduceDetTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VENTAS_DET_CONDUCE.TIPO_VENTA'
    end
    object tblConduceDetDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VENTAS_DET_CONDUCE.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object tblConduceDetCOD_EMPLEADO_CONDUCTOR: TFloatField
      FieldName = 'COD_EMPLEADO_CONDUCTOR'
      Origin = 'VENTAS_DET_CONDUCE.COD_EMPLEADO_CONDUCTOR'
    end
    object tblConduceDetPLACA_VEHICULO: TIBStringField
      FieldName = 'PLACA_VEHICULO'
      Origin = 'VENTAS_DET_CONDUCE.PLACA_VEHICULO'
    end
    object tblConduceDetMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_DET_CONDUCE.MONEDA'
      FixedChar = True
      Size = 1
    end
    object tblConduceDetMONTO_TASA: TFloatField
      FieldName = 'MONTO_TASA'
      Origin = 'VENTAS_DET_CONDUCE.MONTO_TASA'
    end
    object tblConduceDetCAPACIDAD: TFloatField
      FieldName = 'CAPACIDAD'
      Origin = 'VENTAS_DET_CONDUCE.CAPACIDAD'
    end
    object tblConduceDetCANT_VIAJES: TFloatField
      FieldName = 'CANT_VIAJES'
      Origin = 'VENTAS_DET_CONDUCE.CANT_VIAJES'
    end
    object tblConduceDetCANT_METROS_CUBICO: TFloatField
      FieldName = 'CANT_METROS_CUBICO'
      Origin = 'VENTAS_DET_CONDUCE.CANT_METROS_CUBICO'
    end
    object tblConduceDetFICHA_VEH: TIntegerField
      FieldName = 'FICHA_VEH'
      Origin = 'VENTAS_DET_CONDUCE.FICHA_VEH'
    end
    object tblConduceDetIDZONA_ORIGEN: TIntegerField
      FieldName = 'IDZONA_ORIGEN'
      Origin = 'VENTAS_DET_CONDUCE.IDZONA_ORIGEN'
    end
    object tblConduceDetIDZONA_DETALLE: TIntegerField
      FieldName = 'IDZONA_DETALLE'
      Origin = 'VENTAS_DET_CONDUCE.IDZONA_DETALLE'
    end
    object tblConduceDetPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'VENTAS_DET_CONDUCE.PRECIO_COMPRA'
    end
    object tblConduceDetCANT_CONDUCE: TFloatField
      FieldName = 'CANT_CONDUCE'
      Origin = 'VENTAS_DET_CONDUCE.CANT_CONDUCE'
    end
    object tblConduceDetPORC_DESC_ITEM: TFloatField
      FieldName = 'PORC_DESC_ITEM'
      Origin = 'VENTAS_DET_CONDUCE.PORC_DESC_ITEM'
    end
    object tblConduceDetMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VENTAS_DET_CONDUCE.MONTO_DESC_ITEM'
    end
    object tblConduceDetITBIS_FISCAL_DET: TFloatField
      FieldName = 'ITBIS_FISCAL_DET'
      Origin = 'VENTAS_DET_CONDUCE.ITBIS_FISCAL_DET'
    end
    object tblConduceDetIDTASAITBIS: TFloatField
      FieldName = 'IDTASAITBIS'
      Origin = 'VENTAS_DET_CONDUCE.IDTASAITBIS'
    end
    object tblConduceDetMONTOIBISRECARGO: TFloatField
      FieldName = 'MONTOIBISRECARGO'
      Origin = 'VENTAS_DET_CONDUCE.MONTOIBISRECARGO'
    end
    object tblConduceDetDC_ITBIS_CLD: TFloatField
      FieldName = 'DC_ITBIS_CLD'
      Origin = 'VENTAS_DET_CONDUCE.DC_ITBIS_CLD'
    end
    object tblConduceDetTC_MONTOITBISRECARGO_GLB: TFloatField
      FieldName = 'TC_MONTOITBISRECARGO_GLB'
      Origin = 'VENTAS_DET_CONDUCE.TC_MONTOITBISRECARGO_GLB'
    end
    object tblConduceDetTC_MONTOITBISRECARGO_ITM: TFloatField
      FieldName = 'TC_MONTOITBISRECARGO_ITM'
      Origin = 'VENTAS_DET_CONDUCE.TC_MONTOITBISRECARGO_ITM'
    end
  end
  object tblVentasDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
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
      
        '   MONTO_DIETA, MONTO_AJUSTE, SERIE_PROD, STATUS_CNT, TIPO_UNIDA' +
        'D, ITBIS_EXENTO, '
      
        '   TIPO_VENTA, DESCRIPCIONPRODUCTO, COD_EMPLEADO_CONDUCTOR, PLAC' +
        'A_VEHICULO, '
      
        '   MONEDA, MONTO_TASA, CAPACIDAD, CANT_VIAJES, CANT_METROS_CUBIC' +
        'O, FICHA_VEH, '
      
        '   IDZONA_ORIGEN, IDZONA_DETALLE, PRECIO_COMPRA, CANT_CONDUCE, P' +
        'ORC_DESC_ITEM, '
      
        '   MONTO_DESC_ITEM, ITBIS_FISCAL_DET, IDTASAITBIS, MONTOIBISRECA' +
        'RGO, DC_ITBIS_CLD, '
      
        '   TC_MONTOITBISRECARGO_GLB, TC_MONTOITBISRECARGO_ITM, NUM_CONDU' +
        'CE_CTE, '
      '   NUM_IDENT, LOT_NUM, CODIGO_VENDEDOR)'
      'values'
      
        '  (:SERIE, :NUMERO, :CODIGO_PROD, :CODIGO_BARRA, :DESCRIPCION, :' +
        'CANTIDAD, '
      
        '   :PRECIO, :PORC_DESC_DET, :ITBI_DET, :VALOR_SERVICIO_DET, :VAL' +
        'OR_TOTAL_DET, '
      
        '   :NUM_FACTURA, :STATUS_DET, :FECHA_IN, :IN_POR, :FECHA_MOD, :M' +
        'OD_POR, '
      
        '   :CANT_REGRESO, :CANT_PROMO, :MONTO_DIETA, :MONTO_AJUSTE, :SER' +
        'IE_PROD, '
      
        '   :STATUS_CNT, :TIPO_UNIDAD, :ITBIS_EXENTO, :TIPO_VENTA, :DESCR' +
        'IPCIONPRODUCTO, '
      
        '   :COD_EMPLEADO_CONDUCTOR, :PLACA_VEHICULO, :MONEDA, :MONTO_TAS' +
        'A, :CAPACIDAD, '
      
        '   :CANT_VIAJES, :CANT_METROS_CUBICO, :FICHA_VEH, :IDZONA_ORIGEN' +
        ', :IDZONA_DETALLE, '
      
        '   :PRECIO_COMPRA, :CANT_CONDUCE, :PORC_DESC_ITEM, :MONTO_DESC_I' +
        'TEM, :ITBIS_FISCAL_DET, '
      
        '   :IDTASAITBIS, :MONTOIBISRECARGO, :DC_ITBIS_CLD, :TC_MONTOITBI' +
        'SRECARGO_GLB, '
      
        '   :TC_MONTOITBISRECARGO_ITM, :NUM_CONDUCE_CTE, :NUM_IDENT, :LOT' +
        '_NUM, :CODIGO_VENDEDOR)')
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
      '  MONTO_AJUSTE,'
      '  SERIE_PROD,'
      '  STATUS_CNT,'
      '  TIPO_UNIDAD,'
      '  ITBIS_EXENTO,'
      '  TIPO_VENTA,'
      '  DESCRIPCIONPRODUCTO,'
      '  COD_EMPLEADO_CONDUCTOR,'
      '  PLACA_VEHICULO,'
      '  MONEDA,'
      '  MONTO_TASA,'
      '  CAPACIDAD,'
      '  CANT_VIAJES,'
      '  CANT_METROS_CUBICO,'
      '  FICHA_VEH,'
      '  IDZONA_ORIGEN,'
      '  IDZONA_DETALLE,'
      '  PRECIO_COMPRA,'
      '  CANT_CONDUCE,'
      '  PORC_DESC_ITEM,'
      '  MONTO_DESC_ITEM,'
      '  ITBIS_FISCAL_DET,'
      '  IDTASAITBIS,'
      '  MONTOIBISRECARGO,'
      '  DC_ITBIS_CLD,'
      '  TC_MONTOITBISRECARGO_GLB,'
      '  TC_MONTOITBISRECARGO_ITM,'
      '  NUM_CONDUCE_CTE,'
      '  NUM_IDENT,'
      '  LOT_NUM,'
      '  CODIGO_VENDEDOR'
      'from VENTAS_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select * from VENTAS_DET'
      'where numero =:numero')
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
      '  MONTO_AJUSTE = :MONTO_AJUSTE,'
      '  SERIE_PROD = :SERIE_PROD,'
      '  STATUS_CNT = :STATUS_CNT,'
      '  TIPO_UNIDAD = :TIPO_UNIDAD,'
      '  ITBIS_EXENTO = :ITBIS_EXENTO,'
      '  TIPO_VENTA = :TIPO_VENTA,'
      '  DESCRIPCIONPRODUCTO = :DESCRIPCIONPRODUCTO,'
      '  COD_EMPLEADO_CONDUCTOR = :COD_EMPLEADO_CONDUCTOR,'
      '  PLACA_VEHICULO = :PLACA_VEHICULO,'
      '  MONEDA = :MONEDA,'
      '  MONTO_TASA = :MONTO_TASA,'
      '  CAPACIDAD = :CAPACIDAD,'
      '  CANT_VIAJES = :CANT_VIAJES,'
      '  CANT_METROS_CUBICO = :CANT_METROS_CUBICO,'
      '  FICHA_VEH = :FICHA_VEH,'
      '  IDZONA_ORIGEN = :IDZONA_ORIGEN,'
      '  IDZONA_DETALLE = :IDZONA_DETALLE,'
      '  PRECIO_COMPRA = :PRECIO_COMPRA,'
      '  CANT_CONDUCE = :CANT_CONDUCE,'
      '  PORC_DESC_ITEM = :PORC_DESC_ITEM,'
      '  MONTO_DESC_ITEM = :MONTO_DESC_ITEM,'
      '  ITBIS_FISCAL_DET = :ITBIS_FISCAL_DET,'
      '  IDTASAITBIS = :IDTASAITBIS,'
      '  MONTOIBISRECARGO = :MONTOIBISRECARGO,'
      '  DC_ITBIS_CLD = :DC_ITBIS_CLD,'
      '  TC_MONTOITBISRECARGO_GLB = :TC_MONTOITBISRECARGO_GLB,'
      '  TC_MONTOITBISRECARGO_ITM = :TC_MONTOITBISRECARGO_ITM,'
      '  NUM_CONDUCE_CTE = :NUM_CONDUCE_CTE,'
      '  NUM_IDENT = :NUM_IDENT,'
      '  LOT_NUM = :LOT_NUM,'
      '  CODIGO_VENDEDOR = :CODIGO_VENDEDOR'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 592
    Top = 448
    object tblVentasDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET.SERIE'
      Required = True
    end
    object tblVentasDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_DET.NUMERO'
      Required = True
    end
    object tblVentasDetCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object tblVentasDetCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VENTAS_DET.CODIGO_BARRA'
    end
    object tblVentasDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object tblVentasDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET.CANTIDAD'
    end
    object tblVentasDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET.PRECIO'
    end
    object tblVentasDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET.PORC_DESC_DET'
    end
    object tblVentasDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET.ITBI_DET'
    end
    object tblVentasDetVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET.VALOR_SERVICIO_DET'
    end
    object tblVentasDetVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_DET.VALOR_TOTAL_DET'
    end
    object tblVentasDetNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VENTAS_DET.NUM_FACTURA'
    end
    object tblVentasDetSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object tblVentasDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_DET.FECHA_IN'
    end
    object tblVentasDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_DET.IN_POR'
      Size = 12
    end
    object tblVentasDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_DET.FECHA_MOD'
    end
    object tblVentasDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_DET.MOD_POR'
      Size = 12
    end
    object tblVentasDetCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VENTAS_DET.CANT_REGRESO'
    end
    object tblVentasDetCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VENTAS_DET.CANT_PROMO'
    end
    object tblVentasDetMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VENTAS_DET.MONTO_DIETA'
    end
    object tblVentasDetMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VENTAS_DET.MONTO_AJUSTE'
    end
    object tblVentasDetSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VENTAS_DET.SERIE_PROD'
      Size = 50
    end
    object tblVentasDetSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VENTAS_DET.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object tblVentasDetTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VENTAS_DET.TIPO_UNIDAD'
    end
    object tblVentasDetITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VENTAS_DET.ITBIS_EXENTO'
    end
    object tblVentasDetTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VENTAS_DET.TIPO_VENTA'
    end
    object tblVentasDetDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VENTAS_DET.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object tblVentasDetCOD_EMPLEADO_CONDUCTOR: TFloatField
      FieldName = 'COD_EMPLEADO_CONDUCTOR'
      Origin = 'VENTAS_DET.COD_EMPLEADO_CONDUCTOR'
    end
    object tblVentasDetPLACA_VEHICULO: TIBStringField
      FieldName = 'PLACA_VEHICULO'
      Origin = 'VENTAS_DET.PLACA_VEHICULO'
    end
    object tblVentasDetMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_DET.MONEDA'
      FixedChar = True
      Size = 1
    end
    object tblVentasDetMONTO_TASA: TFloatField
      FieldName = 'MONTO_TASA'
      Origin = 'VENTAS_DET.MONTO_TASA'
    end
    object tblVentasDetCAPACIDAD: TFloatField
      FieldName = 'CAPACIDAD'
      Origin = 'VENTAS_DET.CAPACIDAD'
    end
    object tblVentasDetCANT_VIAJES: TFloatField
      FieldName = 'CANT_VIAJES'
      Origin = 'VENTAS_DET.CANT_VIAJES'
    end
    object tblVentasDetCANT_METROS_CUBICO: TFloatField
      FieldName = 'CANT_METROS_CUBICO'
      Origin = 'VENTAS_DET.CANT_METROS_CUBICO'
    end
    object tblVentasDetFICHA_VEH: TIntegerField
      FieldName = 'FICHA_VEH'
      Origin = 'VENTAS_DET.FICHA_VEH'
    end
    object tblVentasDetIDZONA_ORIGEN: TIntegerField
      FieldName = 'IDZONA_ORIGEN'
      Origin = 'VENTAS_DET.IDZONA_ORIGEN'
    end
    object tblVentasDetIDZONA_DETALLE: TIntegerField
      FieldName = 'IDZONA_DETALLE'
      Origin = 'VENTAS_DET.IDZONA_DETALLE'
    end
    object tblVentasDetPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'VENTAS_DET.PRECIO_COMPRA'
    end
    object tblVentasDetCANT_CONDUCE: TFloatField
      FieldName = 'CANT_CONDUCE'
      Origin = 'VENTAS_DET.CANT_CONDUCE'
    end
    object tblVentasDetPORC_DESC_ITEM: TFloatField
      FieldName = 'PORC_DESC_ITEM'
      Origin = 'VENTAS_DET.PORC_DESC_ITEM'
    end
    object tblVentasDetMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VENTAS_DET.MONTO_DESC_ITEM'
    end
    object tblVentasDetITBIS_FISCAL_DET: TFloatField
      FieldName = 'ITBIS_FISCAL_DET'
      Origin = 'VENTAS_DET.ITBIS_FISCAL_DET'
    end
    object tblVentasDetIDTASAITBIS: TFloatField
      FieldName = 'IDTASAITBIS'
      Origin = 'VENTAS_DET.IDTASAITBIS'
    end
    object tblVentasDetMONTOIBISRECARGO: TFloatField
      FieldName = 'MONTOIBISRECARGO'
      Origin = 'VENTAS_DET.MONTOIBISRECARGO'
    end
    object tblVentasDetDC_ITBIS_CLD: TFloatField
      FieldName = 'DC_ITBIS_CLD'
      Origin = 'VENTAS_DET.DC_ITBIS_CLD'
    end
    object tblVentasDetTC_MONTOITBISRECARGO_GLB: TFloatField
      FieldName = 'TC_MONTOITBISRECARGO_GLB'
      Origin = 'VENTAS_DET.TC_MONTOITBISRECARGO_GLB'
    end
    object tblVentasDetTC_MONTOITBISRECARGO_ITM: TFloatField
      FieldName = 'TC_MONTOITBISRECARGO_ITM'
      Origin = 'VENTAS_DET.TC_MONTOITBISRECARGO_ITM'
    end
    object tblVentasDetCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VENTAS_DET.CODIGO_VENDEDOR'
    end
  end
  object qryDetVtaXUsr: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select m.NUMERO, d.SERIE,m.FECHA, m.COD_USR_CAJA,o.NOMBRECOMPLET' +
        'O, d.CODIGO_PROD, d.DESCRIPCION, u.DESCRIPCION desc_unidad, '
      'd.PRECIO_COMPRA costo,'
      
        'p.PRECIOVENTA1 p1_inv, p.PRECIOVENTA2 p2_inv, p.PRECIOVENTA3 p3_' +
        'inv, p.PRECIOVENTA4 p4_inv,'
      
        'd.CANTIDAD, d.PRECIO preciovta, d.VALOR_SERVICIO_DET, d.ITBI_DET' +
        ', m.VALOR_TOTAL_DET monto_total,'
      'd.IN_POR, d.FECHA_IN, d.MOD_POR, d.FECHA_MOD'
      ''
      'From VENTAS_MAST m'
      'Inner join VENTAS_DET d on d.NUMERO = m.NUMERO'
      
        'Left Outer Join PRECIO_UNIDADSURTIDORA p on p.COD_PRODUCTO = d.C' +
        'ODIGO_PROD'
      'Left Outer Join UNIDADES u on u.IDUNIDAD = d.TIPO_UNIDAD'
      'left outer join USUARIO o on o.CODIGO_EMPLEADO = m.COD_USR_CAJA'
      'Where '
      'm.fecha between :fechaini and :fechafin'
      'and'
      'm.COD_USR_CAJA between :coduserini and :coduserfin')
    Left = 48
    Top = 456
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'coduserini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'coduserfin'
        ParamType = ptInput
      end>
    object qryDetVtaXUsrNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryDetVtaXUsrSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET.SERIE'
      Required = True
    end
    object qryDetVtaXUsrFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryDetVtaXUsrCOD_USR_CAJA: TIntegerField
      FieldName = 'COD_USR_CAJA'
      Origin = 'VENTAS_MAST.COD_USR_CAJA'
    end
    object qryDetVtaXUsrNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Origin = 'USUARIO.NOMBRECOMPLETO'
      Size = 40
    end
    object qryDetVtaXUsrCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryDetVtaXUsrDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object qryDetVtaXUsrDESC_UNIDAD: TIBStringField
      FieldName = 'DESC_UNIDAD'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
    object qryDetVtaXUsrCOSTO: TFloatField
      FieldName = 'COSTO'
      Origin = 'VENTAS_DET.PRECIO_COMPRA'
      DisplayFormat = ',0.00'
    end
    object qryDetVtaXUsrP1_INV: TFloatField
      FieldName = 'P1_INV'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA1'
      DisplayFormat = ',0.00'
    end
    object qryDetVtaXUsrP2_INV: TFloatField
      FieldName = 'P2_INV'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA2'
      DisplayFormat = ',0.00'
    end
    object qryDetVtaXUsrP3_INV: TFloatField
      FieldName = 'P3_INV'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA3'
      DisplayFormat = ',0.00'
    end
    object qryDetVtaXUsrP4_INV: TFloatField
      FieldName = 'P4_INV'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA4'
      DisplayFormat = ',0.00'
    end
    object qryDetVtaXUsrCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET.CANTIDAD'
      DisplayFormat = ',0.00'
    end
    object qryDetVtaXUsrPRECIOVTA: TFloatField
      FieldName = 'PRECIOVTA'
      Origin = 'VENTAS_DET.PRECIO'
      DisplayFormat = ',0.00'
    end
    object qryDetVtaXUsrVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET.VALOR_SERVICIO_DET'
      DisplayFormat = ',0.00'
    end
    object qryDetVtaXUsrITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET.ITBI_DET'
      DisplayFormat = ',0.00'
    end
    object qryDetVtaXUsrMONTO_TOTAL: TFloatField
      FieldName = 'MONTO_TOTAL'
      Origin = 'VENTAS_MAST.VALOR_TOTAL_DET'
      DisplayFormat = ',0.00'
    end
    object qryDetVtaXUsrIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_DET.IN_POR'
      Size = 12
    end
    object qryDetVtaXUsrFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_DET.FECHA_IN'
    end
    object qryDetVtaXUsrMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_DET.MOD_POR'
      Size = 12
    end
    object qryDetVtaXUsrFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_DET.FECHA_MOD'
    end
  end
  object tblVentasARS: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from VENTAARS'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into VENTAARS'
      
        '  (NUMERO, NUMERO_TRN, IDARS, NOMBRE_MEDICO, NUM_AUTORIZACION, C' +
        'ONTACTO, '
      
        '   DIRECCION, ESPECIALIDAD, DIAGNOSTICO, MONTO_COBERTURA, EXEQUA' +
        'TUR, STATUS, '
      
        '   FECHA_IN, FECHA_UPDATE, IN_POR, UPDATE_POR, AFILIADO, FECHA, ' +
        'PAGO_AFILIADO, '
      '   MONTO_RECLAMADO, PORC_COBERTURA)'
      'values'
      
        '  (:NUMERO, :NUMERO_TRN, :IDARS, :NOMBRE_MEDICO, :NUM_AUTORIZACI' +
        'ON, :CONTACTO, '
      
        '   :DIRECCION, :ESPECIALIDAD, :DIAGNOSTICO, :MONTO_COBERTURA, :E' +
        'XEQUATUR, '
      
        '   :STATUS, :FECHA_IN, :FECHA_UPDATE, :IN_POR, :UPDATE_POR, :AFI' +
        'LIADO, '
      '   :FECHA, :PAGO_AFILIADO, :MONTO_RECLAMADO, :PORC_COBERTURA)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  NUMERO_TRN,'
      '  IDARS,'
      '  NOMBRE_MEDICO,'
      '  NUM_AUTORIZACION,'
      '  CONTACTO,'
      '  DIRECCION,'
      '  ESPECIALIDAD,'
      '  DIAGNOSTICO,'
      '  MONTO_COBERTURA,'
      '  EXEQUATUR,'
      '  STATUS,'
      '  FECHA_IN,'
      '  FECHA_UPDATE,'
      '  IN_POR,'
      '  UPDATE_POR,'
      '  AFILIADO,'
      '  FECHA,'
      '  PAGO_AFILIADO,'
      '  MONTO_RECLAMADO,'
      '  PORC_COBERTURA'
      'from VENTAARS '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select  * from VENTAARS'
      'Where fecha =:fecha')
    ModifySQL.Strings = (
      'update VENTAARS'
      'set'
      '  NUMERO = :NUMERO,'
      '  NUMERO_TRN = :NUMERO_TRN,'
      '  IDARS = :IDARS,'
      '  NOMBRE_MEDICO = :NOMBRE_MEDICO,'
      '  NUM_AUTORIZACION = :NUM_AUTORIZACION,'
      '  CONTACTO = :CONTACTO,'
      '  DIRECCION = :DIRECCION,'
      '  ESPECIALIDAD = :ESPECIALIDAD,'
      '  DIAGNOSTICO = :DIAGNOSTICO,'
      '  MONTO_COBERTURA = :MONTO_COBERTURA,'
      '  EXEQUATUR = :EXEQUATUR,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  FECHA_UPDATE = :FECHA_UPDATE,'
      '  IN_POR = :IN_POR,'
      '  UPDATE_POR = :UPDATE_POR,'
      '  AFILIADO = :AFILIADO,'
      '  FECHA = :FECHA,'
      '  PAGO_AFILIADO = :PAGO_AFILIADO,'
      '  MONTO_RECLAMADO = :MONTO_RECLAMADO,'
      '  PORC_COBERTURA = :PORC_COBERTURA'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_VENTAARS_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 384
    Top = 496
    object tblVentasARSNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAARS.NUMERO'
      Required = True
    end
    object tblVentasARSNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'VENTAARS.NUMERO_TRN'
    end
    object tblVentasARSIDARS: TIntegerField
      FieldName = 'IDARS'
      Origin = 'VENTAARS.IDARS'
      Required = True
    end
    object tblVentasARSFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAARS.FECHA'
    end
    object tblVentasARSNOMBRE_MEDICO: TIBStringField
      FieldName = 'NOMBRE_MEDICO'
      Origin = 'VENTAARS.NOMBRE_MEDICO'
      Size = 60
    end
    object tblVentasARSNUM_AUTORIZACION: TIBStringField
      FieldName = 'NUM_AUTORIZACION'
      Origin = 'VENTAARS.NUM_AUTORIZACION'
      Size = 40
    end
    object tblVentasARSCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'VENTAARS.CONTACTO'
      Size = 60
    end
    object tblVentasARSDIRECCION: TMemoField
      FieldName = 'DIRECCION'
      Origin = 'VENTAARS.DIRECCION'
      BlobType = ftMemo
      Size = 8
    end
    object tblVentasARSESPECIALIDAD: TIBStringField
      FieldName = 'ESPECIALIDAD'
      Origin = 'VENTAARS.ESPECIALIDAD'
      Size = 40
    end
    object tblVentasARSDIAGNOSTICO: TMemoField
      FieldName = 'DIAGNOSTICO'
      Origin = 'VENTAARS.DIAGNOSTICO'
      BlobType = ftMemo
      Size = 8
    end
    object tblVentasARSMONTO_COBERTURA: TFloatField
      FieldName = 'MONTO_COBERTURA'
      Origin = 'VENTAARS.MONTO_COBERTURA'
    end
    object tblVentasARSEXEQUATUR: TIBStringField
      FieldName = 'EXEQUATUR'
      Origin = 'VENTAARS.EXEQUATUR'
      Size = 12
    end
    object tblVentasARSSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENTAARS.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblVentasARSFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAARS.FECHA_IN'
    end
    object tblVentasARSFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'VENTAARS.FECHA_UPDATE'
    end
    object tblVentasARSIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAARS.IN_POR'
      Size = 12
    end
    object tblVentasARSUPDATE_POR: TIBStringField
      FieldName = 'UPDATE_POR'
      Origin = 'VENTAARS.UPDATE_POR'
      Size = 12
    end
    object tblVentasARSAFILIADO: TIBStringField
      FieldName = 'AFILIADO'
      Origin = 'VENTAARS.AFILIADO'
      FixedChar = True
      Size = 15
    end
    object tblVentasARSPAGO_AFILIADO: TFloatField
      FieldName = 'PAGO_AFILIADO'
      Origin = 'VENTAARS.PAGO_AFILIADO'
    end
    object tblVentasARSMONTO_RECLAMADO: TFloatField
      FieldName = 'MONTO_RECLAMADO'
      Origin = 'VENTAARS.MONTO_RECLAMADO'
    end
    object tblVentasARSPORC_COBERTURA: TFloatField
      FieldName = 'PORC_COBERTURA'
      Origin = 'VENTAARS.PORC_COBERTURA'
    end
  end
  object qryNIFCtrlConT: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from NIF_CTRL'
      'where (status = '#39'T'#39')'
      'and (fecha_in >='#39'Today'#39'-1)')
    Left = 152
    Top = 480
  end
  object qryInvCategoria: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from INVENTARIO_CATEGORIA')
    Left = 456
    Top = 472
    object qryInvCategoriaCODCATEGORIA: TIntegerField
      FieldName = 'CODCATEGORIA'
      Origin = 'INVENTARIO_CATEGORIA.CODCATEGORIA'
      Required = True
    end
    object qryInvCategoriaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_CATEGORIA.DESCRIPCION'
      Size = 40
    end
  end
  object qryDatosVehPolizas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From DatosVehiculo'
      'Where DatosVehiculo.codigo_cte=:codigocte')
    Left = 624
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigocte'
        ParamType = ptInput
      end>
    object qryDatosVehPolizasNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DATOSVEHICULO.NUMERO'
      Required = True
    end
    object qryDatosVehPolizasCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'DATOSVEHICULO.CODIGO_CTE'
      Required = True
    end
    object qryDatosVehPolizasTIPO_AFILIADO: TSmallintField
      FieldName = 'TIPO_AFILIADO'
      Origin = 'DATOSVEHICULO.TIPO_AFILIADO'
      Required = True
    end
    object qryDatosVehPolizasPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'DATOSVEHICULO.PLACA'
      Size = 12
    end
    object qryDatosVehPolizasIDMARCA: TIntegerField
      FieldName = 'IDMARCA'
      Origin = 'DATOSVEHICULO.IDMARCA'
    end
    object qryDatosVehPolizasMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'DATOSVEHICULO.MODELO'
    end
    object qryDatosVehPolizasANO_VEH: TIntegerField
      FieldName = 'ANO_VEH'
      Origin = 'DATOSVEHICULO.ANO_VEH'
    end
    object qryDatosVehPolizasFECHA_VENCE_SEGURO: TDateTimeField
      FieldName = 'FECHA_VENCE_SEGURO'
      Origin = 'DATOSVEHICULO.FECHA_VENCE_SEGURO'
    end
    object qryDatosVehPolizasTIPO_SEGURO: TSmallintField
      FieldName = 'TIPO_SEGURO'
      Origin = 'DATOSVEHICULO.TIPO_SEGURO'
    end
    object qryDatosVehPolizasCIA_SEGURO: TIBStringField
      FieldName = 'CIA_SEGURO'
      Origin = 'DATOSVEHICULO.CIA_SEGURO'
      Size = 50
    end
    object qryDatosVehPolizasEMPRESA_LABORA: TIBStringField
      FieldName = 'EMPRESA_LABORA'
      Origin = 'DATOSVEHICULO.EMPRESA_LABORA'
      Size = 80
    end
    object qryDatosVehPolizasFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DATOSVEHICULO.FECHA_IN'
    end
    object qryDatosVehPolizasIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DATOSVEHICULO.IN_POR'
      Size = 12
    end
    object qryDatosVehPolizasCODIGO_DEALER: TIntegerField
      FieldName = 'CODIGO_DEALER'
      Origin = 'DATOSVEHICULO.CODIGO_DEALER'
    end
    object qryDatosVehPolizasCODIGO_AGENCIA: TIntegerField
      FieldName = 'CODIGO_AGENCIA'
      Origin = 'DATOSVEHICULO.CODIGO_AGENCIA'
    end
    object qryDatosVehPolizasCOLOR: TIBStringField
      FieldName = 'COLOR'
      Origin = 'DATOSVEHICULO.COLOR'
    end
    object qryDatosVehPolizasNUM_CERTIFICADO: TIntegerField
      FieldName = 'NUM_CERTIFICADO'
      Origin = 'DATOSVEHICULO.NUM_CERTIFICADO'
    end
    object qryDatosVehPolizasCHASSIS: TIBStringField
      FieldName = 'CHASSIS'
      Origin = 'DATOSVEHICULO.CHASSIS'
    end
    object qryDatosVehPolizasNUMPOL: TIntegerField
      FieldName = 'NUMPOL'
      Origin = 'DATOSVEHICULO.NUMPOL'
    end
    object qryDatosVehPolizasSTATUSCXC: TIBStringField
      FieldName = 'STATUSCXC'
      Origin = 'DATOSVEHICULO.STATUSCXC'
      FixedChar = True
      Size = 1
    end
  end
  object ibstpProc_InserKardexDet: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'Proc_InserKardexDet'
    Left = 648
    Top = 488
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_OPE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_TRN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_PRODUCTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'COSTO_PRODUCTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO_VENTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_TRN_VTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
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
      end
      item
        DataType = ftString
        Name = 'AREAMOVIMIENTO'
        ParamType = ptInput
      end>
  end
  object qryInventarioProduccion_base: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select I.* From INVENTARIO_PRODUCTO I, TIPO_INVENTARIO T'
      'Where i.tipo = t.codigo'
      'And upper(t.descripcion) LIKE '#39'%PRODUCCION%'#39)
    Left = 320
    Top = 416
  end
  object qryInventarioCafeteria_base: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select I.* From INVENTARIO_PRODUCTO I, TIPO_INVENTARIO T'
      'Where i.tipo = t.codigo'
      'And upper(t.descripcion) LIKE '#39'%CAFETE%'#39)
    Left = 296
    Top = 480
  end
  object qryRevisionVentas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select distinct d.SERIE, d.NUMERO, r.FECHA, r.CODIGO_CTE, iif(r.' +
        'CODIGO_CTE=0,'#39'***Cte Generico***'#39',c.NOMBRE_CTE) NombreCliente,'
      'd.CODIGO_PROD,d.DESCRIPCION,d.CANTIDAD,d.PRECIO,'
      
        'd.VALOR_SERVICIO_DET, d.PORC_DESC_DET, d.ITBI_DET, d.DC_ITBIS_CL' +
        'D,  ((d.VALOR_SERVICIO_DET*t.PORCIENTO)/(1+t.PORCIENTO/100))/100' +
        ' itbiverificado,'
      't.PORCIENTO porctbis from VENTAS_DET d'
      'inner join TASA_ITBIS t on t.IDTASAITBIS = d.IDTASAITBIS'
      'inner join VENTAS_MAST r on r.NUMERO = d.NUMERO'
      'left outer join CLIENTES c on c.CODIGO_CTE = r.CODIGO_CTE'
      'Where r.FECHA =:fecha')
    Left = 768
    Top = 504
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end>
    object qryRevisionVentasSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET.SERIE'
      Required = True
    end
    object qryRevisionVentasNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_DET.NUMERO'
      Required = True
    end
    object qryRevisionVentasFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryRevisionVentasCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST.CODIGO_CTE'
    end
    object qryRevisionVentasNOMBRECLIENTE: TIBStringField
      FieldName = 'NOMBRECLIENTE'
      Size = 60
    end
    object qryRevisionVentasCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryRevisionVentasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object qryRevisionVentasCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET.CANTIDAD'
    end
    object qryRevisionVentasPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET.PRECIO'
      DisplayFormat = ',0.00'
    end
    object qryRevisionVentasVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET.VALOR_SERVICIO_DET'
      DisplayFormat = ',0.00'
    end
    object qryRevisionVentasPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET.PORC_DESC_DET'
      DisplayFormat = ',0.00'
    end
    object qryRevisionVentasITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET.ITBI_DET'
      DisplayFormat = ',0.00'
    end
    object qryRevisionVentasDC_ITBIS_CLD: TFloatField
      FieldName = 'DC_ITBIS_CLD'
      Origin = 'VENTAS_DET.DC_ITBIS_CLD'
      DisplayFormat = ',0.00'
    end
    object qryRevisionVentasITBIVERIFICADO: TFloatField
      FieldName = 'ITBIVERIFICADO'
      DisplayFormat = ',0.00'
    end
    object qryRevisionVentasPORCTBIS: TFloatField
      FieldName = 'PORCTBIS'
      Origin = 'TASA_ITBIS.PORCIENTO'
    end
  end
end
