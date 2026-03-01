object dmDatos: TdmDatos
  OldCreateOrder = False
  Left = 342
  Top = 151
  Height = 299
  Width = 571
  object qryTrnCierreAnio: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'Select * from TrnCnt_Cierre_A'
      'Where fecha = :fechaCierreAnio')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_NUM_TRNCIE'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 216
    Top = 32
    object qryTrnCierreAnioNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TRNCNT_CIERRE_A.NUMERO'
      Required = True
    end
    object qryTrnCierreAnioSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'TRNCNT_CIERRE_A.SERIE'
      Required = True
    end
    object qryTrnCierreAnioFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'TRNCNT_CIERRE_A.FECHA'
      Required = True
    end
    object qryTrnCierreAnioTIPO_DOC: TIntegerField
      FieldName = 'TIPO_DOC'
      Origin = 'TRNCNT_CIERRE_A.TIPO_DOC'
    end
    object qryTrnCierreAnioNUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
      Origin = 'TRNCNT_CIERRE_A.NUM_DOC'
    end
    object qryTrnCierreAnioCUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Origin = 'TRNCNT_CIERRE_A.CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryTrnCierreAnioCUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Origin = 'TRNCNT_CIERRE_A.CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryTrnCierreAnioCUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Origin = 'TRNCNT_CIERRE_A.CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryTrnCierreAnioDESCRIPCION_TRN: TIBStringField
      FieldName = 'DESCRIPCION_TRN'
      Origin = 'TRNCNT_CIERRE_A.DESCRIPCION_TRN'
      Size = 40
    end
    object qryTrnCierreAnioDEBITO_TRN: TFloatField
      FieldName = 'DEBITO_TRN'
      Origin = 'TRNCNT_CIERRE_A.DEBITO_TRN'
    end
    object qryTrnCierreAnioCREDITO_TRN: TFloatField
      FieldName = 'CREDITO_TRN'
      Origin = 'TRNCNT_CIERRE_A.CREDITO_TRN'
    end
    object qryTrnCierreAnioSTATUS_APLICADA: TIBStringField
      FieldName = 'STATUS_APLICADA'
      Origin = 'TRNCNT_CIERRE_A.STATUS_APLICADA'
      FixedChar = True
      Size = 1
    end
    object qryTrnCierreAnioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRNCNT_CIERRE_A.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryTrnCierreAnioIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TRNCNT_CIERRE_A.IN_POR'
      Size = 12
    end
    object qryTrnCierreAnioFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TRNCNT_CIERRE_A.FECHA_IN'
    end
    object qryTrnCierreAnioMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'TRNCNT_CIERRE_A.MOD_POR'
      Size = 12
    end
    object qryTrnCierreAnioFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'TRNCNT_CIERRE_A.FECHA_MOD'
    end
  end
  object dtqryTrnCierreAnio: TDataSource
    AutoEdit = False
    DataSet = qryTrnCierreAnio
    Left = 168
    Top = 128
  end
  object qryViewCuentas: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from Catalogo'
      'where cia_key=:ciakey')
    Left = 272
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ciakey'
        ParamType = ptInput
      end>
  end
  object qryBlcMesCta: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM BALANCE_CNT'
      'WHERE FECHA_BLC BETWEEN :FECHAIN AND :FECHAFIN'
      'And Cia_key =:ciakey')
    OnFilterRecord = qryBlcMesCtaFilterRecord
    Left = 336
    Top = 40
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAIN'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAFIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ciakey'
        ParamType = ptInput
      end>
  end
end
