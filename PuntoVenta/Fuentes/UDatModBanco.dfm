object dmBancos: TdmBancos
  OldCreateOrder = False
  Left = 971
  Top = 314
  Height = 299
  Width = 598
  object qryBancos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryBancosAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from BANCOS'
      'where cia_key=:ciakey')
    Left = 88
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ciakey'
        ParamType = ptUnknown
      end>
    object qryBancosCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'BANCOS.CODIGO'
      Required = True
    end
    object qryBancosCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'BANCOS.CIA_KEY'
    end
    object qryBancosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'BANCOS.DESCRIPCION'
      Size = 35
    end
    object qryBancosCODIGO_ABR: TIBStringField
      FieldName = 'CODIGO_ABR'
      Origin = 'BANCOS.CODIGO_ABR'
      Size = 12
    end
    object qryBancosCHEQUES_BANCO_INI: TIBStringField
      FieldName = 'CHEQUES_BANCO_INI'
      Origin = 'BANCOS.CHEQUES_BANCO_INI'
      Size = 30
    end
  end
  object qryBancosDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from BANCOS_DET'
      'where codigo =:codigo'
      '')
    Left = 184
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryBancosDetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'BANCOS_DET.SERIE'
      Required = True
    end
    object qryBancosDetCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'BANCOS_DET.CODIGO'
      Required = True
    end
    object qryBancosDetTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'BANCOS_DET.TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryBancosDetCUENTA_BANCO: TIBStringField
      FieldName = 'CUENTA_BANCO'
      Origin = 'BANCOS_DET.CUENTA_BANCO'
    end
    object qryBancosDetMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'BANCOS_DET.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryBancosDetCUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Origin = 'BANCOS_DET.CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryBancosDetCUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Origin = 'BANCOS_DET.CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryBancosDetCUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Origin = 'BANCOS_DET.CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryBancosDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'BANCOS_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryBancosDetBALANCEACT: TFloatField
      FieldName = 'BALANCEACT'
      Origin = 'BANCOS_DET.BALANCEACT'
    end
    object qryBancosDetFECHA_ULT_TRN: TDateTimeField
      FieldName = 'FECHA_ULT_TRN'
      Origin = 'BANCOS_DET.FECHA_ULT_TRN'
    end
  end
end
