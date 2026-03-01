object dmPagosTarjeta: TdmPagosTarjeta
  OldCreateOrder = False
  Left = 324
  Top = 140
  Height = 353
  Width = 364
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
    Left = 88
    Top = 40
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
    StoreDefs = True
    TableName = 'TARJETA'
    Left = 248
    Top = 80
    object tblTipoTarjetaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblTipoTarjetaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
    object tblTipoTarjetaLOGO: TBlobField
      FieldName = 'LOGO'
    end
  end
  object dstbltipotarjeta: TDataSource
    DataSet = tblTipoTarjeta
    Left = 248
    Top = 136
  end
  object tblTipoPagoContrato: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_PAGO_CONTRATO'
    Left = 120
    Top = 120
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
    Left = 120
    Top = 176
  end
  object tblProvCobroTarjeta: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PROVEEDOR_COBRO_TARJETA'
    Left = 248
    Top = 192
  end
  object dstblProvCobroTarjeta: TDataSource
    DataSet = tblProvCobroTarjeta
    Left = 248
    Top = 248
  end
end
