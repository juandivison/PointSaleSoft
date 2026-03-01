object dmBanco: TdmBanco
  OldCreateOrder = False
  Left = 207
  Top = 112
  Height = 232
  Width = 265
  object tblBancoMaster: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    AfterScroll = tblBancoMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
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
    Left = 48
    Top = 24
    object tblBancoMasterCODIGO: TSmallintField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Origin = 'BANCOS.CODIGO'
      Required = True
    end
    object tblBancoMasterDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'BANCOS.DESCRIPCION'
      Size = 35
    end
    object tblBancoMasterCODIGO_ABR: TIBStringField
      DisplayLabel = 'CodAbreviado'
      FieldName = 'CODIGO_ABR'
      Origin = 'BANCOS.CODIGO_ABR'
      Size = 12
    end
  end
  object tblBancoDetalle: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
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
      'Select * From BANCOS_DET'
      'Where Codigo =:codigo')
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
    Left = 48
    Top = 104
    object tblBancoDetalleSERIE: TFloatField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'BANCOS_DET.SERIE'
      Required = True
    end
    object tblBancoDetalleCODIGO: TSmallintField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Origin = 'BANCOS_DET.CODIGO'
      Required = True
    end
    object tblBancoDetalleTIPO: TIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'BANCOS_DET.TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tblBancoDetalleCUENTA_BANCO: TIBStringField
      DisplayLabel = 'Cta. Banco'
      FieldName = 'CUENTA_BANCO'
      Origin = 'BANCOS_DET.CUENTA_BANCO'
    end
    object tblBancoDetalleMONEDA: TIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Origin = 'BANCOS_DET.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tblBancoDetalleCUENTA1: TIBStringField
      DisplayLabel = 'Cta1'
      FieldName = 'CUENTA1'
      Origin = 'BANCOS_DET.CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object tblBancoDetalleCUENTA2: TIBStringField
      DisplayLabel = 'Cta2'
      FieldName = 'CUENTA2'
      Origin = 'BANCOS_DET.CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object tblBancoDetalleCUENTA3: TIBStringField
      DisplayLabel = 'Cta3'
      FieldName = 'CUENTA3'
      Origin = 'BANCOS_DET.CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
    object tblBancoDetalleSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'BANCOS_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblBancoDetalleFECHA_APERTURA: TDateTimeField
      DisplayLabel = 'Fecha Apertura'
      FieldName = 'FECHA_APERTURA'
      Origin = 'BANCOS_DET.FECHA_APERTURA'
    end
    object tblBancoDetalleFECHA_CANCELADA: TDateTimeField
      DisplayLabel = 'Fecha Cancelda'
      FieldName = 'FECHA_CANCELADA'
      Origin = 'BANCOS_DET.FECHA_CANCELADA'
    end
    object tblBancoDetalleCKS_CLASIFICACION: TSmallintField
      DisplayLabel = 'Clasificacion Ck'
      FieldName = 'CKS_CLASIFICACION'
      Origin = 'BANCOS_DET.CKS_CLASIFICACION'
    end
  end
  object tblTipoCtaBanco: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_CTA_BANCO'
    Left = 144
    Top = 32
    object tblTipoCtaBancoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblTipoCtaBancoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object tblMoneda: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'MONEDA'
    Left = 152
    Top = 104
    object tblMonedaCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Size = 1
    end
    object tblMonedaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 15
    end
    object tblMonedaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
    end
    object tblMonedaFECHA_UPCAMPO_FECHA_HORA: TDateTimeField
      FieldName = 'FECHA_UPCAMPO_FECHA_HORA'
    end
    object tblMonedaMODIFICADO_POR: TIBStringField
      FieldName = 'MODIFICADO_POR'
      Size = 12
    end
    object tblMonedaSIMBOLO: TIBStringField
      FieldName = 'SIMBOLO'
      Size = 6
    end
  end
end
