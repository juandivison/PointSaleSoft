object frmGetNumFactExpExcel: TfrmGetNumFactExpExcel
  Left = 578
  Top = 155
  BorderStyle = bsDialog
  Caption = 'Exportar Factura a Excel'
  ClientHeight = 128
  ClientWidth = 254
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
    Top = 16
    Width = 76
    Height = 13
    Caption = 'N'#250'mero Factura'
  end
  object edtNumFactura: TEditN
    Left = 32
    Top = 32
    Width = 81
    Height = 21
    Color = clSilver
    TabOrder = 0
    ColorOnFocus = clWhite
    ColorOnNotFocus = clSilver
    FontColorOnFocus = clRed
    FontColorOnNotFocus = clBlack
    FontColorOnOverWrite = clBlue
    EditType = etInteger
    EditKeyByTab = #9
    EditAlign = etAlignNone
    EditLengthAlign = 0
    EditPrecision = 0
    ValueInteger = 0
    ValueDate = 41476.000000000000000000
    ValueTime = 0.547034953703703700
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 80
    Width = 83
    Height = 25
    Caption = '&Exportar'
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 29
    Width = 87
    Height = 25
    Caption = '&Buscar Factura'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 128
    Top = 80
    Width = 89
    Height = 25
    Caption = '&Cerrar'
    TabOrder = 3
    Kind = bkClose
  end
end
