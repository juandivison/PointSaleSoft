object dmControl: TdmControl
  OldCreateOrder = False
  Left = 542
  Top = 107
  Height = 302
  Width = 379
  object qryControl: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryControlAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from control'
      'where'
      '  SISTEMA = :OLD_SISTEMA and'
      '  SUB_SISTEMA = :OLD_SUB_SISTEMA and'
      '  COD_CIA = :OLD_COD_CIA and'
      '  FECHA_ACT = :OLD_FECHA_ACT')
    InsertSQL.Strings = (
      'insert into control'
      
        '  (SISTEMA, SUB_SISTEMA, COD_CIA, FECHA_ACT, DESCRIPCION, STATUS' +
        ', FECHA_IN, '
      '   IN_POR, FECHA_MOD, MOD_POR)'
      'values'
      
        '  (:SISTEMA, :SUB_SISTEMA, :COD_CIA, :FECHA_ACT, :DESCRIPCION, :' +
        'STATUS, '
      '   :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  SISTEMA,'
      '  SUB_SISTEMA,'
      '  COD_CIA,'
      '  FECHA_ACT,'
      '  DESCRIPCION,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from control '
      'where'
      '  SISTEMA = :SISTEMA and'
      '  SUB_SISTEMA = :SUB_SISTEMA and'
      '  COD_CIA = :COD_CIA and'
      '  FECHA_ACT = :FECHA_ACT')
    SelectSQL.Strings = (
      'select * from control')
    ModifySQL.Strings = (
      'update control'
      'set'
      '  SISTEMA = :SISTEMA,'
      '  SUB_SISTEMA = :SUB_SISTEMA,'
      '  COD_CIA = :COD_CIA,'
      '  FECHA_ACT = :FECHA_ACT,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  SISTEMA = :OLD_SISTEMA and'
      '  SUB_SISTEMA = :OLD_SUB_SISTEMA and'
      '  COD_CIA = :OLD_COD_CIA and'
      '  FECHA_ACT = :OLD_FECHA_ACT')
    Left = 40
    Top = 24
    object qryControlSISTEMA: TIntegerField
      FieldName = 'SISTEMA'
      Origin = 'CONTROL.SISTEMA'
      Required = True
    end
    object qryControlSUB_SISTEMA: TIntegerField
      FieldName = 'SUB_SISTEMA'
      Origin = 'CONTROL.SUB_SISTEMA'
      Required = True
    end
    object qryControlCOD_CIA: TIntegerField
      FieldName = 'COD_CIA'
      Origin = 'CONTROL.COD_CIA'
      Required = True
    end
    object qryControlFECHA_ACT: TDateTimeField
      FieldName = 'FECHA_ACT'
      Origin = 'CONTROL.FECHA_ACT'
      Required = True
    end
    object qryControlDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'CONTROL.DESCRIPCION'
      Size = 30
    end
    object qryControlSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CONTROL.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryControlFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CONTROL.FECHA_IN'
    end
    object qryControlIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'CONTROL.IN_POR'
      Size = 12
    end
    object qryControlFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CONTROL.FECHA_MOD'
    end
    object qryControlMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'CONTROL.MOD_POR'
      Size = 12
    end
  end
  object qryControlDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from control_det'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  SISTEMA = :OLD_SISTEMA and'
      '  SUB_SISTEMA = :OLD_SUB_SISTEMA and'
      '  COD_CIA = :OLD_COD_CIA and'
      '  FECHA_ACT = :OLD_FECHA_ACT')
    InsertSQL.Strings = (
      'insert into control_det'
      
        '  (SERIE, SISTEMA, SUB_SISTEMA, COD_CIA, FECHA_ACT, STATUS, FECH' +
        'A_IN, IN_POR, '
      '   FECHA_MOD, MOD_POR)'
      'values'
      
        '  (:SERIE, :SISTEMA, :SUB_SISTEMA, :COD_CIA, :FECHA_ACT, :STATUS' +
        ', :FECHA_IN, '
      '   :IN_POR, :FECHA_MOD, :MOD_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  SISTEMA,'
      '  SUB_SISTEMA,'
      '  COD_CIA,'
      '  FECHA_ACT,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from control_det '
      'where'
      '  SERIE = :SERIE and'
      '  SISTEMA = :SISTEMA and'
      '  SUB_SISTEMA = :SUB_SISTEMA and'
      '  COD_CIA = :COD_CIA and'
      '  FECHA_ACT = :FECHA_ACT')
    SelectSQL.Strings = (
      'select * from control_det'
      'where sistema = :sistema'
      'and sub_sistema = :subsistema'
      'and cod_cia = :codcia'
      'and fecha_act between :fechaini and :fechafin '
      '')
    ModifySQL.Strings = (
      'update control_det'
      'set'
      '  SERIE = :SERIE,'
      '  SISTEMA = :SISTEMA,'
      '  SUB_SISTEMA = :SUB_SISTEMA,'
      '  COD_CIA = :COD_CIA,'
      '  FECHA_ACT = :FECHA_ACT,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  SISTEMA = :OLD_SISTEMA and'
      '  SUB_SISTEMA = :OLD_SUB_SISTEMA and'
      '  COD_CIA = :OLD_COD_CIA and'
      '  FECHA_ACT = :OLD_FECHA_ACT')
    Left = 120
    Top = 24
    object qryControlDetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'CONTROL_DET.SERIE'
      Required = True
    end
    object qryControlDetSISTEMA: TIntegerField
      FieldName = 'SISTEMA'
      Origin = 'CONTROL_DET.SISTEMA'
      Required = True
    end
    object qryControlDetSUB_SISTEMA: TIntegerField
      FieldName = 'SUB_SISTEMA'
      Origin = 'CONTROL_DET.SUB_SISTEMA'
      Required = True
    end
    object qryControlDetCOD_CIA: TIntegerField
      FieldName = 'COD_CIA'
      Origin = 'CONTROL_DET.COD_CIA'
      Required = True
    end
    object qryControlDetFECHA_ACT: TDateTimeField
      FieldName = 'FECHA_ACT'
      Origin = 'CONTROL_DET.FECHA_ACT'
      Required = True
    end
    object qryControlDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CONTROL_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryControlDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CONTROL_DET.FECHA_IN'
    end
    object qryControlDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'CONTROL_DET.IN_POR'
      Size = 12
    end
    object qryControlDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CONTROL_DET.FECHA_MOD'
    end
    object qryControlDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'CONTROL_DET.MOD_POR'
      Size = 12
    end
  end
  object DataSource1: TDataSource
    DataSet = qryControl
    Left = 40
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = qryControlDet
    Left = 120
    Top = 88
  end
end
