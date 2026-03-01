object dmcks: Tdmcks
  OldCreateOrder = False
  Left = 364
  Top = 144
  Height = 291
  Width = 381
  object qrybancos: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    AfterScroll = qrybancosAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from BANCOS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into BANCOS'
      '  (CODIGO, DESCRIPCION, CODIGO_ABR)'
      'values'
      '  (:CODIGO, :DESCRIPCION, :CODIGO_ABR)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  DESCRIPCION,'
      '  CODIGO_ABR'
      'from BANCOS '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'select * from BANCOS')
    ModifySQL.Strings = (
      'update BANCOS'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  CODIGO_ABR = :CODIGO_ABR'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 96
    Top = 8
    object qrybancosCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'BANCOS.CODIGO'
      Required = True
    end
    object qrybancosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'BANCOS.DESCRIPCION'
      Size = 35
    end
    object qrybancosCODIGO_ABR: TIBStringField
      FieldName = 'CODIGO_ABR'
      Origin = 'BANCOS.CODIGO_ABR'
      Size = 12
    end
  end
  object qrybancosdet: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from BANCOS_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into BANCOS_DET'
      
        '  (SERIE, CODIGO, TIPO, CUENTA_BANCO, MONEDA, CUENTA1, CUENTA2, ' +
        'CUENTA3, '
      '   STATUS, FECHA_APERTURA, FECHA_CANCELADA, CKS_CLASIFICACION)'
      'values'
      
        '  (:SERIE, :CODIGO, :TIPO, :CUENTA_BANCO, :MONEDA, :CUENTA1, :CU' +
        'ENTA2, '
      
        '   :CUENTA3, :STATUS, :FECHA_APERTURA, :FECHA_CANCELADA, :CKS_CL' +
        'ASIFICACION)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  CODIGO,'
      '  TIPO,'
      '  CUENTA_BANCO,'
      '  MONEDA,'
      '  CUENTA1,'
      '  CUENTA2,'
      '  CUENTA3,'
      '  STATUS,'
      '  FECHA_APERTURA,'
      '  FECHA_CANCELADA,'
      '  CKS_CLASIFICACION'
      'from BANCOS_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select * from BANCOS_DET'
      'where codigo=:copdigo')
    ModifySQL.Strings = (
      'update BANCOS_DET'
      'set'
      '  SERIE = :SERIE,'
      '  CODIGO = :CODIGO,'
      '  TIPO = :TIPO,'
      '  CUENTA_BANCO = :CUENTA_BANCO,'
      '  MONEDA = :MONEDA,'
      '  CUENTA1 = :CUENTA1,'
      '  CUENTA2 = :CUENTA2,'
      '  CUENTA3 = :CUENTA3,'
      '  STATUS = :STATUS,'
      '  FECHA_APERTURA = :FECHA_APERTURA,'
      '  FECHA_CANCELADA = :FECHA_CANCELADA,'
      '  CKS_CLASIFICACION = :CKS_CLASIFICACION'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 120
    Top = 88
    object qrybancosdetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'BANCOS_DET.SERIE'
      Required = True
    end
    object qrybancosdetCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'BANCOS_DET.CODIGO'
      Required = True
    end
    object qrybancosdetTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'BANCOS_DET.TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qrybancosdetCUENTA_BANCO: TIBStringField
      FieldName = 'CUENTA_BANCO'
      Origin = 'BANCOS_DET.CUENTA_BANCO'
    end
    object qrybancosdetMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'BANCOS_DET.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qrybancosdetCUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Origin = 'BANCOS_DET.CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qrybancosdetCUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Origin = 'BANCOS_DET.CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qrybancosdetCUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Origin = 'BANCOS_DET.CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qrybancosdetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'BANCOS_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qrybancosdetFECHA_APERTURA: TDateTimeField
      FieldName = 'FECHA_APERTURA'
      Origin = 'BANCOS_DET.FECHA_APERTURA'
    end
    object qrybancosdetFECHA_CANCELADA: TDateTimeField
      FieldName = 'FECHA_CANCELADA'
      Origin = 'BANCOS_DET.FECHA_CANCELADA'
    end
    object qrybancosdetCKS_CLASIFICACION: TSmallintField
      FieldName = 'CKS_CLASIFICACION'
      Origin = 'BANCOS_DET.CKS_CLASIFICACION'
    end
  end
  object dsqrybancos: TDataSource
    AutoEdit = False
    DataSet = qrybancos
    Left = 168
    Top = 16
  end
  object dsqrybancosdet: TDataSource
    AutoEdit = False
    DataSet = qrybancosdet
    Left = 104
    Top = 160
  end
  object tblTipoctabanco: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    TableName = 'TIPO_CTA_BANCO'
    Left = 280
    Top = 40
    object tblTipoctabancoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblTipoctabancoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object dstblTipoctabanco: TDataSource
    DataSet = tblTipoctabanco
    Left = 280
    Top = 88
  end
end
