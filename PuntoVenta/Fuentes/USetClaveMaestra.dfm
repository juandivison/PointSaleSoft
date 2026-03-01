object frmConfClaveMaestra: TfrmConfClaveMaestra
  Left = 829
  Top = 216
  Width = 333
  Height = 238
  Caption = 'Setup Password'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 31
    Width = 116
    Height = 20
    Caption = 'Valor a encriptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 95
    Width = 37
    Height = 20
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 32
    Top = 152
    Width = 30
    Height = 13
    Caption = 'Result'
  end
  object Edit1: TEdit
    Left = 32
    Top = 56
    Width = 249
    Height = 21
    TabOrder = 0
  end
  object Button2: TButton
    Left = 208
    Top = 80
    Width = 75
    Height = 25
    Caption = '&Encriptar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 32
    Top = 120
    Width = 249
    Height = 21
    TabOrder = 2
  end
  object btnDesencriptar: TButton
    Left = 216
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Desencriptar'
    TabOrder = 3
    OnClick = btnDesencriptarClick
  end
  object Edit3: TEdit
    Left = 32
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 4
  end
end
