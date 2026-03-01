object frmValidaFactura: TfrmValidaFactura
  Left = 200
  Top = 200
  Width = 800
  Height = 500
  Caption = 'Validar Factura'
  Font.Name = 'Tahoma'
  Font.Size = 9
  OldCreateOrder = False
  OnCreate = FormCreate
  object Panel1: TPanel
    Align = alTop
    Height = 40
    Caption = ''
    TabOrder = 0
    object btnRefrescar: TBitBtn
      Left = 10
      Top = 8
      Width = 120
      Height = 25
      Caption = 'Refrescar'
      TabOrder = 0
      OnClick = btnRefrescarClick
    end
      Left = 520
      Top = 4
      Width = 100
      Height = 13
      Caption = 'Subtotal'
    end
      Left = 520
      Top = 20
      Width = 100
      Height = 17
      DataField = 'SubTotalBase'
      DataSource = dsCalcTotales
    end
      Left = 630
      Top = 4
      Width = 100
      Height = 13
      Caption = 'ITBIS'
    end
      Left = 630
      Top = 20
      Width = 100
      Height = 17
      DataField = 'ITBISTotal'
      DataSource = dsCalcTotales
    end
      Left = 740
      Top = 4
      Width = 100
      Height = 13
      Caption = 'Propina Ley'
    end
      Left = 740
      Top = 20
      Width = 100
      Height = 17
      DataField = 'PropinaLegal'
      DataSource = dsCalcTotales
    end
      Left = 850
      Top = 4
      Width = 100
      Height = 13
      Caption = 'Propina Extra'
    end
      Left = 850
      Top = 20
      Width = 100
      Height = 17
      DataField = 'PropinaAdicional'
      DataSource = dsCalcTotales
    end
      Left = 960
      Top = 4
      Width = 100
      Height = 13
      Caption = 'Desc. Global'
    end
      Left = 960
      Top = 20
      Width = 100
      Height = 17
      DataField = 'MontoDescGlobal'
      DataSource = dsCalcTotales
    end
      Left = 1070
      Top = 4
      Width = 100
      Height = 13
      Caption = 'Total Neto'
    end
      Left = 1070
      Top = 20
      Width = 100
      Height = 17
      DataField = 'TotalNeto'
      DataSource = dsCalcTotales
    end
  end
  object RxDBGrid1: TRxDBGrid
    Align = alClient
    DataSource = dsCalcVenta
    TabOrder = 1
  end
  object rxCalcVenta: TRxMemoryData
    FieldDefs = <
      item Name = 'Serie' DataType = ftInteger end
      item Name = 'Fecha' DataType = ftDateTime end
      item Name = 'IDTasaITBIS' DataType = ftInteger end
      item Name = 'Cant' DataType = ftFloat end
      item Name = 'Precio' DataType = ftCurrency end
      item Name = 'CodArticulo' DataType = ftInteger end
      item Name = 'PorcDescItem' DataType = ftCurrency end
      item Name = 'ItbisExento' DataType = ftSmallint end
      item Name = 'TipoVenta' DataType = ftInteger end>
    Left = 24
    Top = 320
    object rxCalcVentaSerie: TIntegerField FieldName = 'Serie' end
    object rxCalcVentaFecha: TDateTimeField FieldName = 'Fecha' end
    object rxCalcVentaIDTasaITBIS: TIntegerField FieldName = 'IDTasaITBIS' end
    object rxCalcVentaCant: TFloatField FieldName = 'Cant' end
    object rxCalcVentaPrecio: TCurrencyField FieldName = 'Precio' end
    object rxCalcVentaCodArticulo: TIntegerField FieldName = 'CodArticulo' end
    object rxCalcVentaPorcDescItem: TCurrencyField FieldName = 'PorcDescItem' end
    object rxCalcVentaItbisExento: TSmallintField FieldName = 'ItbisExento' end
    object rxCalcVentaTipoVenta: TIntegerField FieldName = 'TipoVenta' end
  end
  object CalcTotales: TRxMemoryData
    FieldDefs = <
      item Name = 'SubTotalBase' DataType = ftCurrency end
      item Name = 'ITBIS8' DataType = ftCurrency end
      item Name = 'ITBIS11' DataType = ftCurrency end
      item Name = 'ITBIS13' DataType = ftCurrency end
      item Name = 'ITBIS16' DataType = ftCurrency end
      item Name = 'ITBIS18' DataType = ftCurrency end
      item Name = 'ITBISTotal' DataType = ftCurrency end
      item Name = 'TotalNeto' DataType = ftCurrency end
      item Name = 'PropinaLegal' DataType = ftCurrency end
      item Name = 'PropinaAdicional' DataType = ftCurrency end
      item Name = 'MontoDescGlobal' DataType = ftCurrency end
      item Name = 'MontoRecargo' DataType = ftCurrency end>
    Left = 160
    Top = 320
    object CalcTotalesSubTotalBase: TCurrencyField FieldName = 'SubTotalBase' end
    object CalcTotalesITBIS8: TCurrencyField FieldName = 'ITBIS8' end
    object CalcTotalesITBIS11: TCurrencyField FieldName = 'ITBIS11' end
    object CalcTotalesITBIS13: TCurrencyField FieldName = 'ITBIS13' end
    object CalcTotalesITBIS16: TCurrencyField FieldName = 'ITBIS16' end
    object CalcTotalesITBIS18: TCurrencyField FieldName = 'ITBIS18' end
    object CalcTotalesITBISTotal: TCurrencyField FieldName = 'ITBISTotal' end
    object CalcTotalesTotalNeto: TCurrencyField FieldName = 'TotalNeto' end
    object CalcTotalesPropinaLegal: TCurrencyField FieldName = 'PropinaLegal' end
    object CalcTotalesPropinaAdicional: TCurrencyField FieldName = 'PropinaAdicional' end
    object CalcTotalesMontoDescGlobal: TCurrencyField FieldName = 'MontoDescGlobal' end
    object CalcTotalesMontoRecargo: TCurrencyField FieldName = 'MontoRecargo' end
  end
  object dsCalcVenta: TDataSource DataSet = rxCalcVenta Left = 24 Top = 380 end
  object dsCalcTotales: TDataSource DataSet = CalcTotales Left = 160 Top = 380 end

    Left = 620
    Top = 60
    Width = 150
    Height = 18
    DataSource = dsCalcTotales
  end
    Left = 620
    Top = 85
    Width = 150
    Height = 18
    DataSource = dsCalcTotales
  end
    Left = 620
    Top = 110
    Width = 150
    Height = 18
    DataSource = dsCalcTotales
  end
    Left = 620
    Top = 135
    Width = 150
    Height = 18
    DataSource = dsCalcTotales
  end
    Left = 620
    Top = 160
    Width = 150
    Height = 18
    DataSource = dsCalcTotales
  end
    Left = 620
    Top = 185
    Width = 150
    Height = 18
    DataSource = dsCalcTotales
  end
end

      Left = 500
      Top = 8
      Width = 100
      Height = 18
      DataField = 'SubTotalBase'
      DataSource = dsCalcTotales
    end
      Left = 610
      Top = 8
      Width = 100
      Height = 18
      DataField = 'ITBISTotal'
      DataSource = dsCalcTotales
    end
      Left = 720
      Top = 8
      Width = 100
      Height = 18
      DataField = 'PropinaLegal'
      DataSource = dsCalcTotales
    end
      Left = 830
      Top = 8
      Width = 100
      Height = 18
      DataField = 'PropinaAdicional'
      DataSource = dsCalcTotales
    end
      Left = 940
      Top = 8
      Width = 100
      Height = 18
      DataField = 'MontoDescGlobal'
      DataSource = dsCalcTotales
    end
      Left = 1050
      Top = 8
      Width = 100
      Height = 18
      DataField = 'TotalNeto'
      DataSource = dsCalcTotales
    end
