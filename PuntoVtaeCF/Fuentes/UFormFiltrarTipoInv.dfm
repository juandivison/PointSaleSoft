object frmFiltrarInv: TfrmFiltrarInv
  Left = 495
  Top = 219
  Width = 264
  Height = 209
  Caption = 'Filtrar Tipo Inventario'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 120
    Height = 20
    Caption = 'Tipo Inventario'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 120
    Width = 75
    Height = 25
    TabOrder = 0
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 120
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object ComboBox1: TComboBox
    Left = 16
    Top = 40
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = 'ComboBox1'
    OnChange = ComboBox1Change
  end
  object qryTipoInv: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from TIPO_INVENTARIO')
    Left = 72
    Top = 48
    object qryTipoInvCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'TIPO_INVENTARIO.CODIGO'
      Required = True
    end
    object qryTipoInvDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_INVENTARIO.DESCRIPCION'
      Size = 30
    end
  end
  object dsqryTipoInv: TDataSource
    DataSet = qryTipoInv
    Left = 208
    Top = 72
  end
end
