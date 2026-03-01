object frmcolores: Tfrmcolores
  Left = 571
  Top = 226
  Width = 703
  Height = 383
  Caption = 'frmcolores'
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
  object Gradiente2: TGradiente
    Left = 0
    Top = 41
    Width = 695
    Height = 311
    ColorDesde = clMenuHighlight
    ColorHasta = clMenuHighlight
    Align = alClient
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 695
    Height = 41
    Align = alTop
    TabOrder = 0
    object RxLabel1: TRxLabel
      Left = 8
      Top = 8
      Width = 52
      Height = 20
      Caption = 'Color 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object RxLabel2: TRxLabel
      Left = 248
      Top = 8
      Width = 52
      Height = 20
      Caption = 'Color 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 472
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Guardar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object ColorComboBox1: TColorComboBox
      Left = 72
      Top = 8
      Width = 145
      Height = 22
      TabOrder = 1
      OnChange = ColorComboBox1Change
    end
    object ColorComboBox2: TColorComboBox
      Left = 304
      Top = 8
      Width = 145
      Height = 22
      TabOrder = 2
      OnChange = ColorComboBox2Change
    end
  end
end
