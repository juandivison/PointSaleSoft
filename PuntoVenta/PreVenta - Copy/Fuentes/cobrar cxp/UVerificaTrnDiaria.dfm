object frmVTrnDiaria: TfrmVTrnDiaria
  Left = 594
  Top = 205
  Width = 412
  Height = 439
  Caption = 'frmVTrnDiaria'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object dtqryBceHistorico: TDataSource
    DataSet = qryBceHistorico
    Left = 184
    Top = 168
  end
  object qryBceHistorico: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from BLCE_CTE_HISTORICO'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  SERVICIO = :OLD_SERVICIO and'
      '  MONEDA = :OLD_MONEDA and'
      '  FECHA_HISTORICO = :OLD_FECHA_HISTORICO')
    InsertSQL.Strings = (
      'insert into BLCE_CTE_HISTORICO'
      '  ('
      'CODIGO, '
      'SERVICIO, '
      'MONEDA, '
      'FECHA_HISTORICO, '
      'BALANCE_ACT, '
      'BALANCE_ANT,   '
      'DEBITO_MES, '
      'CREDITO_MES, '
      'DEBITO_ACM, '
      'CREDITO_ACM, '
      'STATUS, '
      'FECHA_IN, '
      'IN_POR, '
      'FECHA_MOD, '
      'MOD_POR)'
      'values'
      
        '  (:CODIGO, :SERVICIO, :MONEDA, :FECHA_HISTORICO, :BALANCE_ACT, ' +
        ':BALANCE_ANT, '
      
        '   :DEBITO_MES, :CREDITO_MES, :DEBITO_ACM, :CREDITO_ACM, :STATUS' +
        ', :FECHA_IN, '
      '   :IN_POR, :FECHA_MOD, :MOD_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  SERVICIO,'
      '  MONEDA,'
      '  FECHA_HISTORICO,'
      '  BALANCE_ACT,'
      '  BALANCE_ANT,'
      '  DEBITO_MES,'
      '  CREDITO_MES,'
      '  DEBITO_ACM,'
      '  CREDITO_ACM,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  CAMPOCODIGOSERVAUXI,'
      '  CAMPOCODSERVOLD'
      'from BLCE_CTE_HISTORICO '
      'where'
      '  CODIGO = :CODIGO and'
      '  SERVICIO = :SERVICIO and'
      '  MONEDA = :MONEDA and'
      '  FECHA_HISTORICO = :FECHA_HISTORICO')
    SelectSQL.Strings = (
      
        'SELECT CODIGO, SERVICIO, MONEDA, FECHA_HISTORICO, BALANCE_ACT, B' +
        'ALANCE_ANT, DEBITO_MES, CREDITO_MES, DEBITO_ACM, CREDITO_ACM, ST' +
        'ATUS, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR'
      'FROM BLCE_CTE_HISTORICO Blce_cte_historico'
      'where fecha_historico = :fecha'
      'ORDER BY FECHA_HISTORICO, CODIGO, SERVICIO')
    ModifySQL.Strings = (
      'update BLCE_CTE_HISTORICO'
      'set'
      '  CODIGO = :CODIGO,'
      '  SERVICIO = :SERVICIO,'
      '  MONEDA = :MONEDA,'
      '  FECHA_HISTORICO = :FECHA_HISTORICO,'
      '  BALANCE_ACT = :BALANCE_ACT,'
      '  BALANCE_ANT = :BALANCE_ANT,'
      '  DEBITO_MES = :DEBITO_MES,'
      '  CREDITO_MES = :CREDITO_MES,'
      '  DEBITO_ACM = :DEBITO_ACM,'
      '  CREDITO_ACM = :CREDITO_ACM,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  SERVICIO = :OLD_SERVICIO and'
      '  MONEDA = :OLD_MONEDA and'
      '  FECHA_HISTORICO = :OLD_FECHA_HISTORICO')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_TRN_CXC'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 176
    Top = 80
    object qryBceHistoricoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'BLCE_CTE_HISTORICO.CODIGO'
      Required = True
    end
    object qryBceHistoricoSERVICIO: TIntegerField
      FieldName = 'SERVICIO'
      Origin = 'BLCE_CTE_HISTORICO.SERVICIO'
      Required = True
    end
    object qryBceHistoricoMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'BLCE_CTE_HISTORICO.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryBceHistoricoBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'BLCE_CTE_HISTORICO.BALANCE_ACT'
    end
    object qryBceHistoricoBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'BLCE_CTE_HISTORICO.BALANCE_ANT'
    end
    object qryBceHistoricoDEBITO_MES: TFloatField
      FieldName = 'DEBITO_MES'
      Origin = 'BLCE_CTE_HISTORICO.DEBITO_MES'
    end
    object qryBceHistoricoCREDITO_MES: TFloatField
      FieldName = 'CREDITO_MES'
      Origin = 'BLCE_CTE_HISTORICO.CREDITO_MES'
    end
    object qryBceHistoricoDEBITO_ACM: TFloatField
      FieldName = 'DEBITO_ACM'
      Origin = 'BLCE_CTE_HISTORICO.DEBITO_ACM'
    end
    object qryBceHistoricoCREDITO_ACM: TFloatField
      FieldName = 'CREDITO_ACM'
      Origin = 'BLCE_CTE_HISTORICO.CREDITO_ACM'
    end
    object qryBceHistoricoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'BLCE_CTE_HISTORICO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryBceHistoricoFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'BLCE_CTE_HISTORICO.FECHA_IN'
    end
    object qryBceHistoricoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'BLCE_CTE_HISTORICO.IN_POR'
      Size = 12
    end
    object qryBceHistoricoFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'BLCE_CTE_HISTORICO.FECHA_MOD'
    end
    object qryBceHistoricoMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'BLCE_CTE_HISTORICO.MOD_POR'
      Size = 12
    end
  end
  object qryBceHistoricocxp: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from BALANCE_CXP_HISTORICO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into BALANCE_CXP_HISTORICO'
      
        '  (CODIGO, TIPO, MONEDA, FECHA_BCE, BALANCE_ACT, BALANCE_ANT, DE' +
        'BITO_MES, '
      
        '   CREDITO_MES, DEBITO_ACM, CREDITO_ACM, STATUS_BCE, FECHA_IN, I' +
        'N_POR, '
      '   FECHA_MOD, MOD_POR)'
      'values'
      
        '  (:CODIGO, :TIPO, :MONEDA, :FECHA_BCE, :BALANCE_ACT, :BALANCE_A' +
        'NT, :DEBITO_MES, '
      
        '   :CREDITO_MES, :DEBITO_ACM, :CREDITO_ACM, :STATUS_BCE, :FECHA_' +
        'IN, :IN_POR, '
      '   :FECHA_MOD, :MOD_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  CODIGO,'
      '  TIPO,'
      '  MONEDA,'
      '  BALANCE_ACT,'
      '  BALANCE_ANT,'
      '  DEBITO_MES,'
      '  CREDITO_MES,'
      '  DEBITO_ACM,'
      '  CREDITO_ACM,'
      '  FECHA_BCE,'
      '  FECHA_ULT_PAGO,'
      '  STATUS_BCE,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  CODIGO_USUARIO'
      'from BALANCE_CXP_HISTORICO '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      
        'SELECT CODIGO, TIPO, MONEDA, FECHA_BCE, BALANCE_ACT, BALANCE_ANT' +
        ', DEBITO_MES, CREDITO_MES, DEBITO_ACM, CREDITO_ACM, STATUS_BCE, ' +
        'FECHA_IN, IN_POR, FECHA_MOD, MOD_POR'
      'FROM BALANCE_CXP_HISTORICO '
      'where FECHA_BCE= :fecha'
      'ORDER BY FECHA_BCE, CODIGO, TIPO')
    ModifySQL.Strings = (
      'update BALANCE_CXP_HISTORICO'
      'set'
      '  CODIGO = :CODIGO,'
      '  TIPO = :TIPO,'
      '  MONEDA = :MONEDA,'
      '  FECHA_BCE = :FECHA_BCE,'
      '  BALANCE_ACT = :BALANCE_ACT,'
      '  BALANCE_ANT = :BALANCE_ANT,'
      '  DEBITO_MES = :DEBITO_MES,'
      '  CREDITO_MES = :CREDITO_MES,'
      '  DEBITO_ACM = :DEBITO_ACM,'
      '  CREDITO_ACM = :CREDITO_ACM,'
      '  STATUS_BCE = :STATUS_BCE,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  CODIGO = :OLD_CODIGO')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_TRN_CXC'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 56
    Top = 80
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'BLCE_CTE_HISTORICO.CODIGO'
      Required = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'BLCE_CTE_HISTORICO.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FloatField1: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'BLCE_CTE_HISTORICO.BALANCE_ACT'
    end
    object FloatField2: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'BLCE_CTE_HISTORICO.BALANCE_ANT'
    end
    object FloatField3: TFloatField
      FieldName = 'DEBITO_MES'
      Origin = 'BLCE_CTE_HISTORICO.DEBITO_MES'
    end
    object FloatField4: TFloatField
      FieldName = 'CREDITO_MES'
      Origin = 'BLCE_CTE_HISTORICO.CREDITO_MES'
    end
    object FloatField5: TFloatField
      FieldName = 'DEBITO_ACM'
      Origin = 'BLCE_CTE_HISTORICO.DEBITO_ACM'
    end
    object FloatField6: TFloatField
      FieldName = 'CREDITO_ACM'
      Origin = 'BLCE_CTE_HISTORICO.CREDITO_ACM'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'BLCE_CTE_HISTORICO.FECHA_IN'
    end
    object IBStringField3: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'BLCE_CTE_HISTORICO.IN_POR'
      Size = 12
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'BLCE_CTE_HISTORICO.FECHA_MOD'
    end
    object IBStringField4: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'BLCE_CTE_HISTORICO.MOD_POR'
      Size = 12
    end
    object qryBceHistoricocxpTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'BALANCE_CXP_HISTORICO.TIPO'
      Required = True
    end
    object qryBceHistoricocxpFECHA_BCE: TDateTimeField
      FieldName = 'FECHA_BCE'
      Origin = 'BALANCE_CXP_HISTORICO.FECHA_BCE'
    end
    object qryBceHistoricocxpSTATUS_BCE: TIBStringField
      FieldName = 'STATUS_BCE'
      Origin = 'BALANCE_CXP_HISTORICO.STATUS_BCE'
      FixedChar = True
      Size = 1
    end
  end
  object dsqryBceHistoricocxp: TDataSource
    DataSet = qryBceHistoricocxp
    Left = 64
    Top = 168
  end
end
