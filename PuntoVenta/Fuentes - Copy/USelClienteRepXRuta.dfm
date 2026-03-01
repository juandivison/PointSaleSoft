object frmSelRepXRuta: TfrmSelRepXRuta
  Left = 625
  Top = 252
  Width = 341
  Height = 213
  Caption = 'Reporte por Ruta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 10
    Width = 35
    Height = 16
    Caption = 'Rutas'
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
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 96
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Pantalla'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 184
    Top = 104
    Width = 75
    Height = 25
    Caption = '&Salir'
    TabOrder = 3
    Kind = bkClose
  end
end
