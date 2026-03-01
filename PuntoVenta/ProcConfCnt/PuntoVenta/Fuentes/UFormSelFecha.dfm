object frmSelFecha: TfrmSelFecha
  Left = 295
  Top = 153
  BorderStyle = bsDialog
  Caption = 'Seleccionar Fecha'
  ClientHeight = 141
  ClientWidth = 306
  Color = 10547677
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
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
    Left = 24
    Top = 88
    Width = 77
    Height = 33
    Caption = '&Aceptar'
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 111
    Top = 88
    Width = 78
    Height = 33
    Caption = '&Cancelar'
    TabOrder = 3
    Kind = bkCancel
  end
  object BitBtn3: TBitBtn
    Left = 200
    Top = 88
    Width = 75
    Height = 33
    Caption = 'Ay&uda'
    TabOrder = 4
    Kind = bkHelp
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 320
    Top = 296
  end
end
