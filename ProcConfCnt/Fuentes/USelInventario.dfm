object frmSelInventario: TfrmSelInventario
  Left = 379
  Top = 180
  Width = 240
  Height = 160
  Caption = 'Seleccionar Inventario'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Inventario: TLabel
    Left = 24
    Top = 8
    Width = 47
    Height = 13
    Caption = 'Inventario'
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 24
    Width = 185
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'ComboBox1'
    OnChange = ComboBox1Change
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object tblDivInventario: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DIVISION_INVENTARIO'
    Left = 96
    Top = 8
    object tblDivInventarioINVENTARIO_ID: TIntegerField
      FieldName = 'INVENTARIO_ID'
    end
    object tblDivInventarioDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
    object tblDivInventarioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
end
