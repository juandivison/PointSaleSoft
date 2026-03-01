object frmRepCteXCiudad: TfrmRepCteXCiudad
  Left = 221
  Top = 251
  Width = 399
  Height = 214
  Caption = 'Ciudades'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 10
    Width = 43
    Height = 16
    Caption = 'Ciudad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ComboBox2: TComboBox
    Left = 12
    Top = 30
    Width = 213
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox2Change
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 144
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Pantalla'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 232
    Top = 112
    Width = 75
    Height = 25
    Caption = '&Salir'
    TabOrder = 3
    Kind = bkClose
  end
end
