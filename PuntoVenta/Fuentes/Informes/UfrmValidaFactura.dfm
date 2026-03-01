object frmValidaFactura: TfrmValidaFactura
  Left = 516
  Top = 172
  Width = 741
  Height = 525
  Caption = 'Validaci'#195#179'n de Factura'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 733
    Height = 300
    Align = alTop
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
  end
  object Panel1: TPanel
    Left = 0
    Top = 314
    Width = 733
    Height = 180
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object LabelSubtotal: TLabel
      Left = 130
      Top = 10
      Width = 69
      Height = 13
      Caption = 'Subtotal Base:'
    end
    object LabelITBIS: TLabel
      Left = 130
      Top = 30
      Width = 57
      Height = 13
      Caption = 'ITBIS Total:'
    end
    object LabelPropina: TLabel
      Left = 130
      Top = 50
      Width = 39
      Height = 13
      Caption = 'Propina:'
    end
    object LabelTotal: TLabel
      Left = 130
      Top = 70
      Width = 67
      Height = 13
      Caption = 'Total a Pagar:'
    end
    object LabelITBIS0: TLabel
      Left = 400
      Top = 10
      Width = 47
      Height = 13
      Caption = 'ITBIS 0%:'
    end
    object LabelITBIS8: TLabel
      Left = 400
      Top = 30
      Width = 47
      Height = 13
      Caption = 'ITBIS 8%:'
    end
    object LabelITBIS11: TLabel
      Left = 400
      Top = 50
      Width = 53
      Height = 13
      Caption = 'ITBIS 11%:'
    end
    object LabelITBIS13: TLabel
      Left = 400
      Top = 70
      Width = 53
      Height = 13
      Caption = 'ITBIS 13%:'
    end
    object LabelITBIS16: TLabel
      Left = 550
      Top = 10
      Width = 53
      Height = 13
      Caption = 'ITBIS 16%:'
    end
    object LabelITBIS18: TLabel
      Left = 550
      Top = 30
      Width = 53
      Height = 13
      Caption = 'ITBIS 18%:'
    end
    object btnRefrescar: TButton
      Left = 10
      Top = 10
      Width = 100
      Height = 30
      Caption = 'Calcular'
      TabOrder = 0
      OnClick = btnRefrescarClick
    end
  end
end
