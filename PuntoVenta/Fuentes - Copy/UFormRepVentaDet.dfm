object frmReporteVentaDet: TfrmReporteVentaDet
  Left = 374
  Top = 239
  Width = 490
  Height = 259
  Caption = 'Reporte Venta'
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
  object BitBtn1: TBitBtn
    Left = 200
    Top = 160
    Width = 105
    Height = 33
    Caption = '&Imprimir'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 320
    Top = 160
    Width = 105
    Height = 33
    Caption = '&Cerrar'
    TabOrder = 1
    Kind = bkClose
  end
  object FechaIni: TDateTimePicker
    Left = 24
    Top = 39
    Width = 113
    Height = 21
    Date = 38602.755803067130000000
    Time = 38602.755803067130000000
    TabOrder = 2
  end
  object FechaFin: TDateTimePicker
    Left = 160
    Top = 39
    Width = 113
    Height = 21
    Date = 38602.755803067130000000
    Time = 38602.755803067130000000
    TabOrder = 3
  end
end
