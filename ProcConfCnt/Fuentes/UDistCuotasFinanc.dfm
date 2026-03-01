object frmDistCuotas: TfrmDistCuotas
  Left = 210
  Top = 109
  Width = 784
  Height = 480
  Caption = 'Distribucion de Cuotas'
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
  object Label1: TLabel
    Left = 104
    Top = 384
    Width = 32
    Height = 13
    Caption = 'Capital'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 272
    Top = 376
    Width = 32
    Height = 13
    Caption = 'Interes'
    FocusControl = DBEdit2
  end
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 16
    Width = 753
    Height = 353
    DataSource = dsrxCuotas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FECHA_PAGO_CUOTA'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_CUOTA'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FRECUENCIA_DIAS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PorcInteres'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoCapitalInicial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_CAPITAL_APAGAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoInteres'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoCuota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TotalCuota'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 672
    Top = 392
    Width = 91
    Height = 33
    Caption = '&Reporte'
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object DBEdit1: TDBEdit
    Left = 104
    Top = 400
    Width = 134
    Height = 21
    DataField = 'Capital'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 272
    Top = 392
    Width = 134
    Height = 21
    DataField = 'Interes'
    DataSource = DataSource1
    TabOrder = 3
  end
  object rxtotales: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Capital'
        DataType = ftFloat
      end
      item
        Name = 'Interes'
        DataType = ftFloat
      end
      item
        Name = 'CapitalExtra'
        DataType = ftFloat
      end
      item
        Name = 'Mora'
        DataType = ftFloat
      end>
    Left = 344
    Top = 144
    object rxtotalesCapital: TFloatField
      Alignment = taLeftJustify
      FieldName = 'Capital'
      DisplayFormat = ',0.00'
    end
    object rxtotalesInteres: TFloatField
      Alignment = taLeftJustify
      FieldName = 'Interes'
      DisplayFormat = ',0.00'
    end
    object rxtotalesCapitalExtra: TFloatField
      Alignment = taLeftJustify
      FieldName = 'CapitalExtra'
      DisplayFormat = ',0.00'
    end
    object rxtotalesMora: TFloatField
      Alignment = taLeftJustify
      FieldName = 'Mora'
      DisplayFormat = ',0.00'
    end
  end
  object DataSource1: TDataSource
    DataSet = rxtotales
    Left = 408
    Top = 144
  end
  object rxCuotas: TRxMemoryData
    FieldDefs = <
      item
        Name = 'MontoCapitalInicial'
        DataType = ftCurrency
      end
      item
        Name = 'MontoCuota'
        DataType = ftCurrency
      end
      item
        Name = 'MontoInteres'
        DataType = ftCurrency
      end
      item
        Name = 'PorcInteres'
        DataType = ftFloat
      end
      item
        Name = 'NUM_CUOTA'
        DataType = ftInteger
      end
      item
        Name = 'FRECUENCIA_DIAS'
        DataType = ftInteger
      end
      item
        Name = 'FECHA_PAGO_CUOTA'
        DataType = ftDateTime
      end
      item
        Name = 'MONTO_CAPITAL_APAGAR'
        DataType = ftCurrency
      end>
    OnCalcFields = rxCuotasCalcFields
    Left = 344
    Top = 80
    object rxCuotasMontoCapitalInicial: TCurrencyField
      DisplayLabel = 'Monto Inicial'
      FieldName = 'MontoCapitalInicial'
      DisplayFormat = ',0.00'
    end
    object rxCuotasMontoCuota: TCurrencyField
      DisplayLabel = 'Monto Cuota'
      FieldName = 'MontoCuota'
      DisplayFormat = ',0.00'
    end
    object rxCuotasMontoInteres: TCurrencyField
      DisplayLabel = 'Monto Interes'
      FieldName = 'MontoInteres'
      DisplayFormat = ',0.00'
    end
    object rxCuotasPorcInteres: TFloatField
      DisplayLabel = '% Interes'
      FieldName = 'PorcInteres'
      DisplayFormat = ',0.00'
    end
    object rxCuotasTotalCuota: TCurrencyField
      DisplayLabel = 'Monto Total Cuota'
      FieldKind = fkCalculated
      FieldName = 'TotalCuota'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object rxCuotasNUM_CUOTA: TIntegerField
      DisplayLabel = '# Cuota'
      FieldName = 'NUM_CUOTA'
    end
    object rxCuotasFRECUENCIA_DIAS: TIntegerField
      DisplayLabel = 'FrecDias'
      FieldName = 'FRECUENCIA_DIAS'
    end
    object rxCuotasFECHA_PAGO_CUOTA: TDateTimeField
      DisplayLabel = 'Fecha Pago Cuoa'
      FieldName = 'FECHA_PAGO_CUOTA'
    end
    object rxCuotasMONTO_CAPITAL_APAGAR: TCurrencyField
      DisplayLabel = 'MontoCapital a Pagar'
      FieldName = 'MONTO_CAPITAL_APAGAR'
      DisplayFormat = ',0.00'
    end
  end
  object dsrxCuotas: TDataSource
    DataSet = rxCuotas
    Left = 408
    Top = 80
  end
end
