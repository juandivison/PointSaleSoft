object frmCambiarCteFact: TfrmCambiarCteFact
  Left = 479
  Top = 184
  Width = 437
  Height = 223
  Caption = 'Cambiar Cliente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object edtNombreCte: TLabel
    Left = 19
    Top = 106
    Width = 3
    Height = 13
  end
  object Label1: TLabel
    Left = 16
    Top = 64
    Width = 105
    Height = 13
    Caption = 'Indique Nuevo Cliente'
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 76
    Height = 13
    Caption = 'Numero Factura'
  end
  object labelNumFactura: TLabel
    Left = 136
    Top = 8
    Width = 3
    Height = 13
  end
  object Label4: TLabel
    Left = 16
    Top = 23
    Width = 105
    Height = 13
    Caption = 'Nombre Cliente Actual'
  end
  object labelNombreActual: TLabel
    Left = 136
    Top = 24
    Width = 3
    Height = 13
  end
  object edtCodCte: TEditN
    Left = 16
    Top = 80
    Width = 65
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
    ValueDate = 41722.000000000000000000
    ValueTime = 0.027541296296296300
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object BitBtn1: TBitBtn
    Left = 88
    Top = 78
    Width = 75
    Height = 25
    Caption = 'BuscarCte'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 152
    Top = 128
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn3: TBitBtn
    Left = 240
    Top = 128
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end
