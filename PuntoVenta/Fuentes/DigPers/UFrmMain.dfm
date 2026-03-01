object Form1: TForm1
  Left = 332
  Top = 247
  Width = 720
  Height = 520
  Caption = 'Test DigitalPersona - Enroll/Verify'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblUser: TLabel
    Left = 16
    Top = 16
    Width = 36
    Height = 13
    Caption = 'Usuario'
  end
  object lblTask: TLabel
    Left = 16
    Top = 72
    Width = 28
    Height = 13
    Caption = 'Tarea'
  end
  object cbUsuario: TComboBox
    Left = 16
    Top = 32
    Width = 260
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object btnReload: TButton
    Left = 296
    Top = 30
    Width = 113
    Height = 25
    Caption = 'Recargar listas'
    TabOrder = 1
    OnClick = btnReloadClick
  end
  object btnEnroll: TButton
    Left = 424
    Top = 30
    Width = 121
    Height = 25
    Caption = 'Enrolar huella'
    TabOrder = 2
    OnClick = btnEnrollClick
  end
  object btnAuthGlobal: TButton
    Left = 560
    Top = 30
    Width = 137
    Height = 25
    Caption = 'Validar huella (global)'
    TabOrder = 3
    OnClick = btnAuthGlobalClick
  end
  object btnDeviceInfo: TButton
    Left = 296
    Top = 58
    Width = 113
    Height = 25
    Caption = 'Info lector'
    TabOrder = 4
    OnClick = btnDeviceInfoClick
  end
  object cbTarea: TComboBox
    Left = 16
    Top = 88
    Width = 529
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
  end
  object btnAuth: TButton
    Left = 560
    Top = 86
    Width = 137
    Height = 25
    Caption = 'Autorizar con huella'
    TabOrder = 6
    OnClick = btnAuthClick
  end
  object memoLog: TMemo
    Left = 16
    Top = 128
    Width = 681
    Height = 329
    ScrollBars = ssVertical
    TabOrder = 7
  end
end
