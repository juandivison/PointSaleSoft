object frmSelFecha: TfrmSelFecha
  Left = 467
  Top = 231
  BorderStyle = bsDialog
  Caption = 'Seleccionar Fecha'
  ClientHeight = 133
  ClientWidth = 397
  Color = 10547677
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 89
    Height = 20
    Caption = 'Fecha Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 160
    Top = 16
    Width = 83
    Height = 20
    Caption = 'Fecha Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 280
    Top = 16
    Width = 58
    Height = 20
    Caption = 'Moneda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 2
    Top = 112
    Width = 42
    Height = 13
    Caption = 'Det TInv'
    Visible = False
  end
  object FechaIni: TDateTimePicker
    Left = 24
    Top = 39
    Width = 113
    Height = 21
    Date = 38602.755803067130000000
    Time = 38602.755803067130000000
    TabOrder = 0
  end
  object FechaFin: TDateTimePicker
    Left = 160
    Top = 39
    Width = 113
    Height = 21
    Date = 38602.755803067130000000
    Time = 38602.755803067130000000
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 72
    Top = 88
    Width = 77
    Height = 33
    Caption = '&Aceptar'
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 159
    Top = 88
    Width = 78
    Height = 33
    Caption = '&Cancelar'
    TabOrder = 3
    Kind = bkCancel
  end
  object BitBtn3: TBitBtn
    Left = 248
    Top = 88
    Width = 75
    Height = 33
    Caption = 'Ay&uda'
    TabOrder = 4
    Kind = bkHelp
  end
  object ComboBox1: TComboBox
    Left = 280
    Top = 40
    Width = 97
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'Pesos'
    Items.Strings = (
      'Pesos          '
      'Dollar         '
      'Euro           ')
  end
  object CheckBox1: TCheckBox
    Left = 280
    Top = 65
    Width = 105
    Height = 17
    Caption = 'Exp Excel/PDF'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object chkEnviaEmail: TCheckBox
    Left = 168
    Top = 64
    Width = 86
    Height = 17
    Caption = 'Enviar Email'
    TabOrder = 7
    Visible = False
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 128
    Top = 24
  end
end
