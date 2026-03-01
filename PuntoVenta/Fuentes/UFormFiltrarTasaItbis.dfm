object frmFiltrarTasaItbis: TfrmFiltrarTasaItbis
  Left = 454
  Top = 170
  Width = 403
  Height = 243
  Caption = 'Filtrar Tasa ITBIS'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 112
    Top = 40
    Width = 54
    Height = 13
    Caption = 'Tasa ITBIS'
  end
  object ComboBox1: TComboBox
    Left = 112
    Top = 56
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object BitBtn1: TBitBtn
    Left = 104
    Top = 120
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 120
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkClose
  end
  object qryTasaItbis: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TASA_ITBIS')
    Left = 264
    Top = 40
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
    object qryTasaItbisSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TASA_ITBIS.STATUS'
      FixedChar = True
      Size = 1
    end
  end
end
