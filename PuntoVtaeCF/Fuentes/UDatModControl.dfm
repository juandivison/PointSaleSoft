object dmControl: TdmControl
  OldCreateOrder = False
  Left = 529
  Top = 127
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
      '   IN_POR, FECHA_MOD, MOD_POR, FECHA_ULT_CIERREZ)'
      'values'
      
        '  (:SISTEMA, :SUB_SISTEMA, :COD_CIA, :FECHA_ACT, :DESCRIPCION, :' +
        'STATUS, '
      '   :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR, :FECHA_ULT_CIERREZ)')
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
      '  MOD_POR,'
      '  FECHA_ULT_CIERREZ'
      'from control '
      'where'
      '  SISTEMA = :SISTEMA and'
      '  SUB_SISTEMA = :SUB_SISTEMA and'
      '  COD_CIA = :COD_CIA and'
      '  FECHA_ACT = :FECHA_ACT')
    SelectSQL.Strings = (
      'Select * From control'
      'Order By sistema, sub_sistema')
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
      '  MOD_POR = :MOD_POR,'
      '  FECHA_ULT_CIERREZ = :FECHA_ULT_CIERREZ'
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
    object qryControlFECHA_ULT_CIERREZ: TDateTimeField
      FieldName = 'FECHA_ULT_CIERREZ'
      Origin = 'CONTROL.FECHA_ULT_CIERREZ'
    end
  end
  object qryControlDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterInsert = qryControlDetAfterInsert
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
  object tblControlCierreZ: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CONTROL'
      'where'
      '  SISTEMA = :OLD_SISTEMA and'
      '  SUB_SISTEMA = :OLD_SUB_SISTEMA and'
      '  COD_CIA = :OLD_COD_CIA and'
      '  FECHA_ACT = :OLD_FECHA_ACT')
    InsertSQL.Strings = (
      'insert into CONTROL'
      '  (FECHA_ACT, STATUS, FECHA_ULT_CIERREZ)'
      'values'
      '  (:FECHA_ACT, :STATUS, :FECHA_ULT_CIERREZ)')
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
      '  MOD_POR,'
      '  FECHA_ULT_CIERREZ'
      'from CONTROL '
      'where'
      '  SISTEMA = :SISTEMA and'
      '  SUB_SISTEMA = :SUB_SISTEMA and'
      '  COD_CIA = :COD_CIA and'
      '  FECHA_ACT = :FECHA_ACT')
    SelectSQL.Strings = (
      'Select * From CONTROL'
      'Where Sistema=:sistema'
      'And Sub_sistema=:subsistema'
      'And cod_cia=:codcia'
      '')
    ModifySQL.Strings = (
      'update CONTROL'
      'set'
      '  FECHA_ACT = :FECHA_ACT,'
      '  STATUS = :STATUS,'
      '  FECHA_ULT_CIERREZ = :FECHA_ULT_CIERREZ'
      'where'
      '  SISTEMA = :OLD_SISTEMA and'
      '  SUB_SISTEMA = :OLD_SUB_SISTEMA and'
      '  COD_CIA = :OLD_COD_CIA and'
      '  FECHA_ACT = :OLD_FECHA_ACT')
    Left = 240
    Top = 40
    object tblControlCierreZSISTEMA: TIntegerField
      FieldName = 'SISTEMA'
      Origin = 'CONTROL.SISTEMA'
      Required = True
    end
    object tblControlCierreZSUB_SISTEMA: TIntegerField
      FieldName = 'SUB_SISTEMA'
      Origin = 'CONTROL.SUB_SISTEMA'
      Required = True
    end
    object tblControlCierreZCOD_CIA: TIntegerField
      FieldName = 'COD_CIA'
      Origin = 'CONTROL.COD_CIA'
      Required = True
    end
    object tblControlCierreZFECHA_ACT: TDateTimeField
      FieldName = 'FECHA_ACT'
      Origin = 'CONTROL.FECHA_ACT'
      Required = True
    end
    object tblControlCierreZDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'CONTROL.DESCRIPCION'
      Size = 30
    end
    object tblControlCierreZSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CONTROL.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblControlCierreZFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CONTROL.FECHA_IN'
    end
    object tblControlCierreZIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'CONTROL.IN_POR'
      Size = 12
    end
    object tblControlCierreZFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CONTROL.FECHA_MOD'
    end
    object tblControlCierreZMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'CONTROL.MOD_POR'
      Size = 12
    end
    object tblControlCierreZFECHA_ULT_CIERREZ: TDateTimeField
      FieldName = 'FECHA_ULT_CIERREZ'
      Origin = 'CONTROL.FECHA_ULT_CIERREZ'
    end
  end
  object qryCierreZ: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From CONTROL'
      'Where sistema=:sistema'
      'And sub_sistema=:subsistema'
      'And cod_cia=:codcia'
      '')
    Left = 240
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'sistema'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'subsistema'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codcia'
        ParamType = ptInput
      end>
    object qryCierreZFECHA_ULT_CIERREZ: TDateTimeField
      FieldName = 'FECHA_ULT_CIERREZ'
      Origin = 'CONTROL.FECHA_ULT_CIERREZ'
    end
    object qryCierreZSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CONTROL.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryVerificaCierreZ: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  c.FECHA_ULT_CIERREZ,'
      
        '  DATEDIFF(HOUR FROM c.FECHA_ULT_CIERREZ TO CURRENT_TIMESTAMP) A' +
        'S HORAS_TRANSCURRIDAS'
      'FROM '
      '  CONTROL c'
      'Where c.Sistema=:sistema'
      'And c.Sub_sistema=:subsistema'
      'And c.cod_cia=:codcia')
    Left = 120
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sistema'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subsistema'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codcia'
        ParamType = ptUnknown
      end>
    object qryVerificaCierreZFECHA_ULT_CIERREZ: TDateTimeField
      FieldName = 'FECHA_ULT_CIERREZ'
      Origin = 'CONTROL.FECHA_ULT_CIERREZ'
    end
    object qryVerificaCierreZHORAS_TRANSCURRIDAS: TFloatField
      FieldName = 'HORAS_TRANSCURRIDAS'
    end
  end
end
