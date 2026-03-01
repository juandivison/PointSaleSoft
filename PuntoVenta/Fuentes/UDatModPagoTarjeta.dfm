object dmPagosTarjeta: TdmPagosTarjeta
  OldCreateOrder = False
  Left = 1072
  Top = 485
  Height = 375
  Width = 528
  object tblDetallePagoConTarjeta: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BeforePost = tblDetallePagoConTarjetaBeforePost
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DETALLE_PAGO_TARJETA'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into DETALLE_PAGO_TARJETA'
      
        '  (SERIE, NUMERO_CONTRADO, FECHA, TIPO_TARJETA, NUMERO_TARJETA_C' +
        'RED, ANO_VENCE, '
      
        '   MES_VENCE, MONTOAUTORIZADO, NUMERO_APROBACION, TIPO, CODIGO_P' +
        'ROVEEDOR, '
      '   TIPO_PAGO)'
      'values'
      
        '  (:SERIE, :NUMERO_CONTRADO, :FECHA, :TIPO_TARJETA, :NUMERO_TARJ' +
        'ETA_CRED, '
      
        '   :ANO_VENCE, :MES_VENCE, :MONTOAUTORIZADO, :NUMERO_APROBACION,' +
        ' :TIPO, '
      '   :CODIGO_PROVEEDOR, :TIPO_PAGO)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO_CONTRADO,'
      '  FECHA,'
      '  TIPO_TARJETA,'
      '  NUMERO_TARJETA_CRED,'
      '  ANO_VENCE,'
      '  MES_VENCE,'
      '  MONTOAUTORIZADO,'
      '  NUMERO_APROBACION,'
      '  TIPO,'
      '  CODIGO_PROVEEDOR,'
      '  TIPO_PAGO'
      'from DETALLE_PAGO_TARJETA '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select *  from DETALLE_PAGO_TARJETA'
      'Where numero_contrado = :numerocontrato')
    ModifySQL.Strings = (
      'update DETALLE_PAGO_TARJETA'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO_CONTRADO = :NUMERO_CONTRADO,'
      '  FECHA = :FECHA,'
      '  TIPO_TARJETA = :TIPO_TARJETA,'
      '  NUMERO_TARJETA_CRED = :NUMERO_TARJETA_CRED,'
      '  ANO_VENCE = :ANO_VENCE,'
      '  MES_VENCE = :MES_VENCE,'
      '  MONTOAUTORIZADO = :MONTOAUTORIZADO,'
      '  NUMERO_APROBACION = :NUMERO_APROBACION,'
      '  TIPO = :TIPO,'
      '  CODIGO_PROVEEDOR = :CODIGO_PROVEEDOR,'
      '  TIPO_PAGO = :TIPO_PAGO'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 168
    Top = 18
    object tblDetallePagoConTarjetaSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DETALLE_PAGO_TARJETA.SERIE'
      Required = True
    end
    object tblDetallePagoConTarjetaNUMERO_CONTRADO: TIntegerField
      DisplayLabel = '#Contrato'
      FieldName = 'NUMERO_CONTRADO'
      Origin = 'DETALLE_PAGO_TARJETA.NUMERO_CONTRADO'
      Required = True
    end
    object tblDetallePagoConTarjetaTIPO_TARJETA: TSmallintField
      DisplayLabel = 'TipoTarjeta'
      FieldName = 'TIPO_TARJETA'
      Origin = 'DETALLE_PAGO_TARJETA.TIPO_TARJETA'
    end
    object tblDetallePagoConTarjetaNUMERO_TARJETA_CRED: TIBStringField
      DisplayLabel = 'Numero Tarjeta'
      FieldName = 'NUMERO_TARJETA_CRED'
      Origin = 'DETALLE_PAGO_TARJETA.NUMERO_TARJETA_CRED'
      EditMask = '0000-0000-0000-00009;0;_'
    end
    object tblDetallePagoConTarjetaANO_VENCE: TIntegerField
      DisplayLabel = 'A'#241'o Vencimiento'
      FieldName = 'ANO_VENCE'
      Origin = 'DETALLE_PAGO_TARJETA.ANO_VENCE'
    end
    object tblDetallePagoConTarjetaMES_VENCE: TSmallintField
      DisplayLabel = 'Mes Vencimiento'
      FieldName = 'MES_VENCE'
      Origin = 'DETALLE_PAGO_TARJETA.MES_VENCE'
    end
    object tblDetallePagoConTarjetaMONTOAUTORIZADO: TFloatField
      DisplayLabel = 'Monto Autorizado'
      FieldName = 'MONTOAUTORIZADO'
      Origin = 'DETALLE_PAGO_TARJETA.MONTOAUTORIZADO'
      DisplayFormat = ',0.00'
    end
    object tblDetallePagoConTarjetaNUMERO_APROBACION: TIBStringField
      DisplayLabel = 'Numero Aprobacion'
      FieldName = 'NUMERO_APROBACION'
      Origin = 'DETALLE_PAGO_TARJETA.NUMERO_APROBACION'
      FixedChar = True
      Size = 15
    end
    object tblDetallePagoConTarjetaTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'DETALLE_PAGO_TARJETA.TIPO'
    end
    object tblDetallePagoConTarjetaCODIGO_PROVEEDOR: TSmallintField
      FieldName = 'CODIGO_PROVEEDOR'
      Origin = 'DETALLE_PAGO_TARJETA.CODIGO_PROVEEDOR'
    end
    object tblDetallePagoConTarjetaTIPO_PAGO: TSmallintField
      FieldName = 'TIPO_PAGO'
      Origin = 'DETALLE_PAGO_TARJETA.TIPO_PAGO'
    end
    object tblDetallePagoConTarjetaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DETALLE_PAGO_TARJETA.FECHA'
    end
  end
  object tblTipoTarjeta: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'LOGO'
        DataType = ftBlob
      end>
    StoreDefs = True
    TableName = 'TARJETA'
    Left = 164
    Top = 69
    object tblTipoTarjetaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblTipoTarjetaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
    object tblTipoTarjetaLOGO: TBlobField
      FieldName = 'LOGO'
      Size = 8
    end
  end
  object dstbltipotarjeta: TDataSource
    DataSet = tblTipoTarjeta
    Left = 168
    Top = 136
  end
  object tblProvCobroTarjeta: TIBTable
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
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CUENTA_BANCO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CODIGO_BANCO'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'PROVEEDOR_COBRO_TARJETA'
    Left = 40
    Top = 136
    object tblProvCobroTarjetaCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Required = True
    end
    object tblProvCobroTarjetaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
    object tblProvCobroTarjetaCUENTA_BANCO: TIBStringField
      FieldName = 'CUENTA_BANCO'
      Size = 30
    end
    object tblProvCobroTarjetaCODIGO_BANCO: TIntegerField
      FieldName = 'CODIGO_BANCO'
    end
  end
  object dstblProvCobroTarjeta: TDataSource
    DataSet = tblProvCobroTarjeta
    Left = 40
    Top = 200
  end
  object tblTipoPagoContrato: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_PAGO_CONTRATO'
    Left = 336
    Top = 32
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO'
    end
    object IBStringField1: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
    object BlobField1: TBlobField
      FieldName = 'LOGO'
    end
  end
  object dstblTipoPagoContrato: TDataSource
    DataSet = tblTipoPagoContrato
    Left = 336
    Top = 88
  end
  object qryTipoPago: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from tipo_pago'
      'Where ifiscal_tpago is not null')
    Left = 336
    Top = 144
    object qryTipoPagoCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'TIPO_PAGO.CODIGO'
      Required = True
    end
    object qryTipoPagoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_PAGO.DESCRIPCION'
      FixedChar = True
      Size = 15
    end
    object qryTipoPagoORIGEN: TSmallintField
      FieldName = 'ORIGEN'
      Origin = 'TIPO_PAGO.ORIGEN'
    end
    object qryTipoPagoIFISCAL_TPAGO: TSmallintField
      FieldName = 'IFISCAL_TPAGO'
      Origin = 'TIPO_PAGO.IFISCAL_TPAGO'
    end
  end
  object dsqryTipoPago: TDataSource
    DataSet = qryTipoPago
    Left = 344
    Top = 208
  end
  object tblDetallePagos: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DETALLE_PAGOS'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into DETALLE_PAGOS'
      
        '  (SERIE, FECHA, TIPO_TARJETA, NUMERO_TARJETA_CRED, ANO_VENCE, M' +
        'ES_VENCE, '
      
        '   MONTO_PAGADO, NUMERO_APROBACION, TIPO, CODIGO_PROVEEDOR, TIPO' +
        '_PAGO, '
      
        '   NUMERO_CHEQUE, COD_BANCO_CHEQUE, SERIE_TRN, AREA_TRANS, NUMER' +
        'O_CUPON, '
      '   PAGO, GLBNUMVTAPOS)'
      'values'
      
        '  (:SERIE, :FECHA, :TIPO_TARJETA, :NUMERO_TARJETA_CRED, :ANO_VEN' +
        'CE, :MES_VENCE, '
      
        '   :MONTO_PAGADO, :NUMERO_APROBACION, :TIPO, :CODIGO_PROVEEDOR, ' +
        ':TIPO_PAGO, '
      
        '   :NUMERO_CHEQUE, :COD_BANCO_CHEQUE, :SERIE_TRN, :AREA_TRANS, :' +
        'NUMERO_CUPON, '
      '   :PAGO, :GLBNUMVTAPOS)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  FECHA,'
      '  TIPO_TARJETA,'
      '  NUMERO_TARJETA_CRED,'
      '  ANO_VENCE,'
      '  MES_VENCE,'
      '  MONTO_PAGADO,'
      '  NUMERO_APROBACION,'
      '  TIPO,'
      '  CODIGO_PROVEEDOR,'
      '  TIPO_PAGO,'
      '  NUMERO_CHEQUE,'
      '  COD_BANCO_CHEQUE,'
      '  SERIE_TRN,'
      '  AREA_TRANS,'
      '  NUMERO_CUPON,'
      '  PAGO,'
      '  GLBNUMVTAPOS'
      'from DETALLE_PAGOS '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select *  From DETALLE_PAGOS'
      'Where  serie_trn =:serietrn'
      'and area_trans=:areatrans')
    ModifySQL.Strings = (
      'update DETALLE_PAGOS'
      'set'
      '  SERIE = :SERIE,'
      '  FECHA = :FECHA,'
      '  TIPO_TARJETA = :TIPO_TARJETA,'
      '  NUMERO_TARJETA_CRED = :NUMERO_TARJETA_CRED,'
      '  ANO_VENCE = :ANO_VENCE,'
      '  MES_VENCE = :MES_VENCE,'
      '  MONTO_PAGADO = :MONTO_PAGADO,'
      '  NUMERO_APROBACION = :NUMERO_APROBACION,'
      '  TIPO = :TIPO,'
      '  CODIGO_PROVEEDOR = :CODIGO_PROVEEDOR,'
      '  TIPO_PAGO = :TIPO_PAGO,'
      '  NUMERO_CHEQUE = :NUMERO_CHEQUE,'
      '  COD_BANCO_CHEQUE = :COD_BANCO_CHEQUE,'
      '  SERIE_TRN = :SERIE_TRN,'
      '  AREA_TRANS = :AREA_TRANS,'
      '  NUMERO_CUPON = :NUMERO_CUPON,'
      '  PAGO = :PAGO,'
      '  GLBNUMVTAPOS = :GLBNUMVTAPOS'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_DET_PAGO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 40
    Top = 16
    object tblDetallePagosSERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'DETALLE_PAGOS.SERIE'
      Required = True
    end
    object tblDetallePagosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'DETALLE_PAGOS.FECHA'
    end
    object tblDetallePagosTIPO_TARJETA: TSmallintField
      DisplayLabel = 'TipoTarjeta'
      FieldName = 'TIPO_TARJETA'
      Origin = 'DETALLE_PAGOS.TIPO_TARJETA'
    end
    object tblDetallePagosNUMERO_TARJETA_CRED: TIBStringField
      DisplayLabel = 'Numero Tarjeta'
      FieldName = 'NUMERO_TARJETA_CRED'
      Origin = 'DETALLE_PAGOS.NUMERO_TARJETA_CRED'
    end
    object tblDetallePagosANO_VENCE: TIntegerField
      DisplayLabel = 'A'#241'o Vence'
      FieldName = 'ANO_VENCE'
      Origin = 'DETALLE_PAGOS.ANO_VENCE'
    end
    object tblDetallePagosMES_VENCE: TSmallintField
      DisplayLabel = 'Mes Vence'
      FieldName = 'MES_VENCE'
      Origin = 'DETALLE_PAGOS.MES_VENCE'
    end
    object tblDetallePagosMONTO_PAGADO: TFloatField
      DisplayLabel = 'Monto Pagado'
      FieldName = 'MONTO_PAGADO'
      Origin = 'DETALLE_PAGOS.MONTO_PAGADO'
      DisplayFormat = ',0.00'
    end
    object tblDetallePagosNUMERO_APROBACION: TIBStringField
      DisplayLabel = '#Aprobacion'
      FieldName = 'NUMERO_APROBACION'
      Origin = 'DETALLE_PAGOS.NUMERO_APROBACION'
      FixedChar = True
      Size = 15
    end
    object tblDetallePagosTIPO: TSmallintField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'DETALLE_PAGOS.TIPO'
    end
    object tblDetallePagosCODIGO_PROVEEDOR: TSmallintField
      DisplayLabel = 'CodProveedor'
      FieldName = 'CODIGO_PROVEEDOR'
      Origin = 'DETALLE_PAGOS.CODIGO_PROVEEDOR'
    end
    object tblDetallePagosTIPO_PAGO: TSmallintField
      DisplayLabel = 'TPago'
      FieldName = 'TIPO_PAGO'
      Origin = 'DETALLE_PAGOS.TIPO_PAGO'
    end
    object tblDetallePagosNUMERO_CHEQUE: TIntegerField
      DisplayLabel = '#Cheque'
      FieldName = 'NUMERO_CHEQUE'
      Origin = 'DETALLE_PAGOS.NUMERO_CHEQUE'
    end
    object tblDetallePagosCOD_BANCO_CHEQUE: TIntegerField
      DisplayLabel = 'CodBanco'
      FieldName = 'COD_BANCO_CHEQUE'
      Origin = 'DETALLE_PAGOS.COD_BANCO_CHEQUE'
    end
    object tblDetallePagosSERIE_TRN: TIntegerField
      DisplayLabel = 'Serie Trn'
      FieldName = 'SERIE_TRN'
      Origin = 'DETALLE_PAGOS.SERIE_TRN'
    end
    object tblDetallePagosAREA_TRANS: TSmallintField
      DisplayLabel = 'Area Trans'
      FieldName = 'AREA_TRANS'
      Origin = 'DETALLE_PAGOS.AREA_TRANS'
    end
    object tblDetallePagosNUMERO_CUPON: TIntegerField
      FieldName = 'NUMERO_CUPON'
      Origin = 'DETALLE_PAGOS.NUMERO_CUPON'
    end
    object tblDetallePagosPAGO: TSmallintField
      FieldName = 'PAGO'
      Origin = 'DETALLE_PAGOS.PAGO'
    end
    object tblDetallePagosGLBNUMVTAPOS: TIntegerField
      FieldName = 'GLBNUMVTAPOS'
      Origin = 'DETALLE_PAGOS.GLBNUMVTAPOS'
    end
  end
  object dstblDetallePagos: TDataSource
    AutoEdit = False
    DataSet = tblDetallePagos
    Left = 40
    Top = 72
  end
  object tblDetPagosRevisar: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DETALLE_PAGOS'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into DETALLE_PAGOS'
      
        '  (SERIE, FECHA, TIPO_TARJETA, NUMERO_TARJETA_CRED, ANO_VENCE, M' +
        'ES_VENCE, '
      
        '   MONTO_PAGADO, NUMERO_APROBACION, TIPO, CODIGO_PROVEEDOR, TIPO' +
        '_PAGO, '
      
        '   NUMERO_CHEQUE, COD_BANCO_CHEQUE, SERIE_TRN, AREA_TRANS, NUMER' +
        'O_CUPON, '
      '   PAGO)'
      'values'
      
        '  (:SERIE, :FECHA, :TIPO_TARJETA, :NUMERO_TARJETA_CRED, :ANO_VEN' +
        'CE, :MES_VENCE, '
      
        '   :MONTO_PAGADO, :NUMERO_APROBACION, :TIPO, :CODIGO_PROVEEDOR, ' +
        ':TIPO_PAGO, '
      
        '   :NUMERO_CHEQUE, :COD_BANCO_CHEQUE, :SERIE_TRN, :AREA_TRANS, :' +
        'NUMERO_CUPON, '
      '   :PAGO)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  FECHA,'
      '  TIPO_TARJETA,'
      '  NUMERO_TARJETA_CRED,'
      '  ANO_VENCE,'
      '  MES_VENCE,'
      '  MONTO_PAGADO,'
      '  NUMERO_APROBACION,'
      '  TIPO,'
      '  CODIGO_PROVEEDOR,'
      '  TIPO_PAGO,'
      '  NUMERO_CHEQUE,'
      '  COD_BANCO_CHEQUE,'
      '  SERIE_TRN,'
      '  AREA_TRANS,'
      '  NUMERO_CUPON,'
      '  PAGO'
      'from DETALLE_PAGOS '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select *  From DETALLE_PAGOS'
      'where fecha=:fecha')
    ModifySQL.Strings = (
      'update DETALLE_PAGOS'
      'set'
      '  SERIE = :SERIE,'
      '  FECHA = :FECHA,'
      '  TIPO_TARJETA = :TIPO_TARJETA,'
      '  NUMERO_TARJETA_CRED = :NUMERO_TARJETA_CRED,'
      '  ANO_VENCE = :ANO_VENCE,'
      '  MES_VENCE = :MES_VENCE,'
      '  MONTO_PAGADO = :MONTO_PAGADO,'
      '  NUMERO_APROBACION = :NUMERO_APROBACION,'
      '  TIPO = :TIPO,'
      '  CODIGO_PROVEEDOR = :CODIGO_PROVEEDOR,'
      '  TIPO_PAGO = :TIPO_PAGO,'
      '  NUMERO_CHEQUE = :NUMERO_CHEQUE,'
      '  COD_BANCO_CHEQUE = :COD_BANCO_CHEQUE,'
      '  SERIE_TRN = :SERIE_TRN,'
      '  AREA_TRANS = :AREA_TRANS,'
      '  NUMERO_CUPON = :NUMERO_CUPON,'
      '  PAGO = :PAGO'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 40
    Top = 256
  end
end
