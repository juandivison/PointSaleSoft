object frmProcesaPagoFactura: TfrmProcesaPagoFactura
  Left = 309
  Top = 145
  Width = 630
  Height = 451
  Caption = 'Procesar Saldo y/o Abono a Factura'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 70
    Height = 13
    Caption = 'Monto a Pagar'
  end
  object DBText1: TDBText
    Left = 8
    Top = 64
    Width = 161
    Height = 17
    DataField = 'NOMBRECOMPLETO'
    DataSource = dmIngresos.dtIBTableCliente
  end
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 72
    Height = 13
    Caption = 'Nombre Cliente'
  end
  object DBText2: TDBText
    Left = 184
    Top = 64
    Width = 113
    Height = 17
    DataField = 'CONCEPTO'
  end
  object Label2: TLabel
    Left = 112
    Top = 8
    Width = 43
    Height = 13
    Caption = '#Factura'
  end
  object RxCalcEdit1: TRxCalcEdit
    Left = 8
    Top = 24
    Width = 97
    Height = 21
    AutoSize = False
    NumGlyphs = 2
    TabOrder = 0
  end
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 88
    Width = 289
    Height = 313
    FixedColor = 10547677
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'FECHA'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_FACT'
        Width = 78
        Visible = True
      end>
  end
  object RxDBGrid2: TRxDBGrid
    Left = 304
    Top = 88
    Width = 305
    Height = 313
    FixedColor = 56797
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'SERIE'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_FACTURA'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_RECIBO'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_PAGADO'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Width = 23
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_IN'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IN_POR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_MOD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOD_POR'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 192
    Top = 22
    Width = 105
    Height = 25
    Caption = 'Aplicar &Pago'
    TabOrder = 3
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
      333333333333337FF3333333333333903333333333333377FF33333333333399
      03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
      99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
      99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
      03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
      33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
      33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
      3333777777333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object edtNumFactura: TEdit
    Left = 112
    Top = 24
    Width = 73
    Height = 21
    TabOrder = 4
    OnExit = edtNumFacturaExit
  end
end
