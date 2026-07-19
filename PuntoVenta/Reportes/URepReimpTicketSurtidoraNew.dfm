object qckRepReciboReimpTicketSurtidoraNew: TqckRepReciboReimpTicketSurtidoraNew
  Left = 0
  Top = 0
  Width = 278
  Height = 932
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  BeforePrint = QuickRepBeforePrint
  DataSet = dmFactura.qryVentaFactura
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE'
    'QRLOOPBAND1')
  Functions.DATA = (
    '0'
    '0'
    #39#39
    '0')
  OnNeedData = QuickRepNeedData
  Options = [FirstPageHeader]
  Page.Columns = 1
  Page.Orientation = poPortrait
  Page.PaperSize = Custom
  Page.Values = (
    38.100000000000000000
    2465.832000000000000000
    25.400000000000000000
    735.541666666666700000
    50.800000000000000000
    25.400000000000000000
    0.000000000000000000)
  PrinterSettings.Copies = 1
  PrinterSettings.OutputBin = Auto
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.ExtendedDuplex = 0
  PrinterSettings.UseStandardprinter = False
  PrinterSettings.UseCustomBinCode = False
  PrinterSettings.CustomBinCode = 0
  PrinterSettings.UseCustomPaperCode = False
  PrinterSettings.CustomPaperCode = 0
  PrinterSettings.PrintMetaFile = False
  PrintIfEmpty = True
  SnapToGrid = True
  Units = Inches
  Zoom = 100
  PrevFormStyle = fsNormal
  PreviewInitialState = wsNormal
  object PageHeaderBand1: TQRBand
    Left = 19
    Top = 10
    Width = 249
    Height = 86
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = PageHeaderBand1BeforePrint
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Default'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      227.541666666666700000
      658.812500000000000000)
    BandType = rbPageHeader
    object QRDBText2: TQRDBText
      Left = 80
      Top = 44
      Width = 89
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        211.666666666666700000
        116.416666666666700000
        235.479166666666700000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = dmCompania.tblCompania
      DataField = 'CALLEYNUMERO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Default'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRDBText3: TQRDBText
      Left = 3
      Top = 63
      Width = 58
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        7.937500000000000000
        166.687500000000000000
        153.458333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = dmCompania.tblCompania
      DataField = 'TELEFONO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText4: TQRDBText
      Left = 91
      Top = 61
      Width = 88
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        240.770833333333300000
        161.395833333333300000
        232.833333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = dmCompania.tblCompania
      DataField = 'RNC_NUMERO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Draft 15cpi'
      Font.Style = []
      OnPrint = QRDBText4Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel1: TQRLabel
      Left = 71
      Top = 62
      Width = 106
      Height = 14
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        187.854166666666700000
        164.041666666666700000
        280.458333333333300000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'Recibo de Ingreso'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = [fsBold]
      OnPrint = QRLabel1Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText22: TQRDBText
      Left = 106
      Top = 4
      Width = 55
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        280.458333333333300000
        10.583333333333330000
        145.520833333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = dmCompania.tblCompania
      DataField = 'NOMBRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText1: TQRDBText
      Left = 85
      Top = 24
      Width = 78
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        224.895833333333300000
        63.500000000000000000
        206.375000000000000000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = dmCompania.tblCompania
      DataField = 'OBSERVACION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Default'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object ColumnHeaderBand1: TQRBand
    Left = 19
    Top = 114
    Width = 249
    Height = 65
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = ColumnHeaderBand1AfterPrint
    AlignToBottom = False
    BeforePrint = ColumnHeaderBand1BeforePrint
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Default'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      171.979166666666700000
      658.812500000000000000)
    BandType = rbColumnHeader
    object QRLabel2: TQRLabel
      Left = 9
      Top = 2
      Width = 40
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        23.812500000000000000
        5.291666666666667000
        105.833333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Factura:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Default'
      Font.Style = []
      OnPrint = QRLabel2Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel5: TQRLabel
      Left = 4
      Top = 49
      Width = 34
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        10.583333333333330000
        129.645833333333300000
        89.958333333333330000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText12: TQRDBText
      Left = 57
      Top = 2
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        150.812500000000000000
        5.291666666666667000
        132.291666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmFactura.qryVentaFactura
      DataField = 'NUMERO_FACTURA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Default'
      Font.Style = []
      OnPrint = QRDBText12Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBText15: TQRDBText
      Left = 41
      Top = 49
      Width = 59
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        108.479166666666700000
        129.645833333333300000
        156.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmFactura.qryVentaFactura
      DataField = 'FECHA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = []
      Mask = 'dd/mm/yyyy'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel20: TQRLabel
      Left = 110
      Top = 33
      Width = 136
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        291.041666666666700000
        87.312500000000000000
        359.833333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'NCF:'
      Color = clWhite
      OnPrint = QRLabel20Print
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText14: TQRDBText
      Left = 111
      Top = 4
      Width = 134
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        293.687500000000000000
        10.583333333333330000
        354.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = dmFactura.qryVentaFactura
      DataField = 'DESCRIPCION_NCF'
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText18: TQRDBText
      Left = 111
      Top = 49
      Width = 135
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        293.687500000000000000
        129.645833333333300000
        357.187500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = dmFactura.qryVentaFactura
      DataField = 'FechaVence'
      Mask = 'dd/mm/yyyy'
      OnPrint = QRDBText18Print
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrLablNCFAfectado: TQRLabel
      Left = 48
      Top = 67
      Width = 198
      Height = 17
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        127.000000000000000000
        177.270833333333300000
        523.875000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'qrLablNCFAfectado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object qckRepComprobante: TQRBand
    Left = 19
    Top = 250
    Width = 249
    Height = 0
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Default'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      0.000000000000000000
      658.812500000000000000)
    BandType = rbDetail
  end
  object PageFooterBand1: TQRBand
    Left = 19
    Top = 305
    Width = 249
    Height = 105
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = PageFooterBand1BeforePrint
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Default'
    Font.Style = []
    ForceNewColumn = False
    ForceNewPage = False
    ParentFont = False
    Size.Values = (
      277.812500000000000000
      658.812500000000000000)
    BandType = rbGroupFooter
    object QRLabel11: TQRLabel
      Left = 88
      Top = 15
      Width = 57
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        232.833333333333300000
        39.687500000000000000
        150.812500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Sub-Total'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel18: TQRLabel
      Left = 3
      Top = 1
      Width = 246
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        7.937500000000000000
        2.645833333333333000
        650.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '=========================================='
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel16: TQRLabel
      Left = 93
      Top = 32
      Width = 53
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        246.062500000000000000
        84.666666666666670000
        140.229166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Descuento'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel17: TQRLabel
      Left = 117
      Top = 48
      Width = 28
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        309.562500000000000000
        127.000000000000000000
        74.083333333333330000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ITBIS'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText17: TQRDBText
      Left = 152
      Top = 48
      Width = 95
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        402.166666666666700000
        127.000000000000000000
        251.354166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmFactura.qryVentaFactura
      DataField = 'MONTO_TOTAL_ITBIS'
      Mask = ',0.00'
      OnPrint = QRDBText17Print
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRExpr5: TQRExpr
      Left = 152
      Top = 14
      Width = 95
      Height = 14
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        402.166666666666700000
        37.041666666666670000
        251.354166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Default'
      Font.Style = [fsBold]
      Color = clWhite
      Master = QRSubDetail1
      OnPrint = QRExpr5Print
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 
        'IF(qryVentaFacturaDet.TRANSP_ITBIS = 1,sum(qryVentaFacturaDet.VA' +
        'LOR_SERVICIO_DET) - sum(qryVentaFacturaDet.ITBI_DET),sum(qryVent' +
        'aFacturaDet.VALOR_SERVICIO_DET))'
      Mask = ',0.00'
      FontSize = 9
    end
    object QRDBText16: TQRDBText
      Left = 152
      Top = 30
      Width = 95
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        402.166666666666700000
        79.375000000000000000
        251.354166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmFactura.qryVentaFactura
      DataField = 'MONTO_DESCUENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Mask = ',0.00'
      OnPrint = QRDBText16Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel3: TQRLabel
      Left = 63
      Top = 70
      Width = 82
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        166.687500000000000000
        185.208333333333300000
        216.958333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ITBIS Exonerado'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText20: TQRDBText
      Left = 152
      Top = 70
      Width = 95
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        402.166666666666700000
        185.208333333333300000
        251.354166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmFactura.qryVentaFactura
      DataField = 'MONTO_TOTAL_ITBIS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = []
      Mask = ',0.00'
      OnPrint = QRDBText20Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRExpr1: TQRExpr
      Left = 153
      Top = 12
      Width = 95
      Height = 14
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        404.812500000000000000
        31.750000000000000000
        251.354166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Default'
      Font.Style = [fsBold]
      Color = clWhite
      Master = QRSubDetail1
      OnPrint = QRExpr5Print
      ParentFont = False
      ResetAfterPrint = False
      Transparent = False
      WordWrap = True
      Expression = 'sum(qryVentaFacturaDet.VALOR_SERVICIO_DET)'
      Mask = ',0.00'
      FontSize = 9
    end
    object QRDBText13: TQRDBText
      Left = 152
      Top = 88
      Width = 95
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        402.166666666666700000
        232.833333333333300000
        251.354166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmFactura.qryVentaFactura
      DataField = 'MONTOPREPAGADO'
      Mask = ',0.00'
      OnPrint = QRDBText17Print
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel12: TQRLabel
      Left = 79
      Top = 88
      Width = 65
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        209.020833333333300000
        232.833333333333300000
        171.979166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Monto Abono'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object ChildBand1: TQRChildBand
    Left = 19
    Top = 179
    Width = 249
    Height = 39
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand1BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      103.187500000000000000
      658.812500000000000000)
    ParentBand = ColumnHeaderBand1
    object QRLabel14: TQRLabel
      Left = 9
      Top = 24
      Width = 218
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        23.812500000000000000
        63.500000000000000000
        576.791666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = '**** Generico ***'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = []
      OnPrint = QRLabel14Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrLabelRNC: TQRLabel
      Left = 8
      Top = 5
      Width = 59
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        21.166666666666670000
        13.229166666666670000
        156.104166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'qrLabelRNC'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object ChildBand8: TQRChildBand
    Left = 19
    Top = 96
    Width = 249
    Height = 18
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand8BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      47.625000000000000000
      658.812500000000000000)
    ParentBand = PageHeaderBand1
    object QRLabel24: TQRLabel
      Left = 106
      Top = 1
      Width = 36
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        280.458333333333300000
        2.645833333333333000
        95.250000000000000000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'Venta'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = []
      OnPrint = QRLabel24Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRSubDetail1: TQRSubDetail
    Left = 19
    Top = 250
    Width = 249
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      52.916666666666670000
      658.812500000000000000)
    Master = Owner
    DataSet = dmFactura.qryVentaFacturaDet
    FooterBand = PageFooterBand1
    PrintBefore = False
    PrintIfEmpty = True
    object QRDBText8: TQRDBText
      Left = 6
      Top = 2
      Width = 250
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        15.875000000000000000
        5.291666666666667000
        661.458333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = dmFactura.qryVentaFacturaDet
      DataField = 'DESCRIPCION'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Draft 10cpi'
      Font.Style = []
      OnPrint = QRDBText8Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
  end
  object ChildBand7: TQRChildBand
    Left = 19
    Top = 270
    Width = 249
    Height = 16
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = ChildBand7AfterPrint
    AlignToBottom = False
    BeforePrint = ChildBand7BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      42.333333333333330000
      658.812500000000000000)
    ParentBand = QRSubDetail1
    object QRDBText5: TQRDBText
      Left = 6
      Top = 1
      Width = 34
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        15.875000000000000000
        2.645833333333333000
        89.958333333333330000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = dmFactura.qryVentaFacturaDet
      DataField = 'CANTIDAD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Default'
      Font.Style = []
      Mask = ',0.00'
      OnPrint = QRDBText5Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBText7: TQRDBText
      Left = 61
      Top = 1
      Width = 62
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333330000
        161.395833333333300000
        2.645833333333333000
        164.041666666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmFactura.qryVentaFacturaDet
      DataField = 'PRECIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = ',0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText19: TQRDBText
      Left = 134
      Top = 1
      Width = 41
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333330000
        354.541666666666700000
        2.645833333333333000
        108.479166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmFactura.qryVentaFacturaDet
      DataField = 'ITBI_DET'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = ',0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText10: TQRDBText
      Left = 187
      Top = 1
      Width = 59
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333330000
        494.770833333333300000
        2.645833333333333000
        156.104166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmFactura.qryVentaFacturaDet
      DataField = 'VALOR_SERVICIO_DET'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      Mask = ',0.00'
      OnPrint = QRDBText10Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRDBText6: TQRDBText
      Left = 44
      Top = 1
      Width = 13
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        116.416666666666700000
        2.645833333333333000
        34.395833333333330000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = dmFactura.qryVentaFacturaDet
      DataField = 'LTIPO_UNIDAD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Default'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
  end
  object ChildBand9: TQRChildBand
    Left = 19
    Top = 218
    Width = 249
    Height = 32
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand9BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      84.666666666666670000
      658.812500000000000000)
    ParentBand = ChildBand1
    object QRLabel7: TQRLabel
      Left = 5
      Top = 11
      Width = 28
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        13.229166666666670000
        29.104166666666670000
        74.083333333333330000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cant'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel9: TQRLabel
      Left = 40
      Top = 12
      Width = 19
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        105.833333333333300000
        31.750000000000000000
        50.270833333333330000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'UN'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel8: TQRLabel
      Left = 87
      Top = 12
      Width = 38
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        230.187500000000000000
        31.750000000000000000
        100.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Precio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel15: TQRLabel
      Left = 142
      Top = 12
      Width = 32
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        375.708333333333300000
        31.750000000000000000
        84.666666666666670000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'ITBIS'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel37: TQRLabel
      Left = 214
      Top = 12
      Width = 29
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        566.208333333333300000
        31.750000000000000000
        76.729166666666670000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel10: TQRLabel
      Left = 4
      Top = -4
      Width = 243
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        10.583333333333330000
        -10.583333333333330000
        642.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = '========================================'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object SummaryBand1: TQRBand
    Left = 19
    Top = 471
    Width = 249
    Height = 22
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = SummaryBand1BeforePrint
    Color = clWindow
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      58.208333333333330000
      658.812500000000000000)
    BandType = rbSummary
    object QRLabel22: TQRLabel
      Left = 97
      Top = 3
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        256.645833333333300000
        7.937500000000000000
        132.291666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cambio'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText21: TQRDBText
      Left = 152
      Top = 3
      Width = 95
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        402.166666666666700000
        7.937500000000000000
        251.354166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmFactura.qryVentaFactura
      DataField = 'MONTO_CAMBIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Mask = ',0.00'
      OnPrint = QRDBText21Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object ChildBand11: TQRChildBand
    Left = 19
    Top = 493
    Width = 249
    Height = 53
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand11BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      140.229166666666700000
      658.812500000000000000)
    ParentBand = SummaryBand1
    object QRLabel6: TQRLabel
      Left = 3
      Top = 0
      Width = 246
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        7.937500000000000000
        0.000000000000000000
        650.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        '----------------------------------------------------------------' +
        '----------------'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel29: TQRLabel
      Left = 5
      Top = 34
      Width = 37
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        13.229166666666670000
        89.958333333333330000
        97.895833333333330000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'bultos'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRSysData1: TQRSysData
      Left = 5
      Top = 15
      Width = 151
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        13.229166666666670000
        39.687500000000000000
        399.520833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      Color = clWhite
      Data = qrsDetailCount
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = []
      OnPrint = QRSysData1Print
      ParentFont = False
      Text = 'Total Items: '
      Transparent = False
      FontSize = 10
    end
    object QRDBText30: TQRDBText
      Left = 6
      Top = 58
      Width = 231
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.041666666666670000
        15.875000000000000000
        153.458333333333300000
        611.187500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      DataSet = dmFactura.qryVentaFactura
      DataField = 'COMENTARIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Default'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
  end
  object ChildBand10: TQRChildBand
    Left = 19
    Top = 546
    Width = 249
    Height = 51
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand10BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      134.937500000000000000
      658.812500000000000000)
    ParentBand = ChildBand11
    object QRLabel27: TQRLabel
      Left = 9
      Top = 1
      Width = 231
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.312500000000000000
        23.812500000000000000
        2.645833333333333000
        611.187500000000000000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = False
      AutoStretch = True
      Caption = 
        'Imprescindible Presentar Factura Para Devoluciones, antes de Dos' +
        ' Dias.'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel33: TQRLabel
      Left = 9
      Top = 35
      Width = 231
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        23.812500000000000000
        92.604166666666670000
        611.187500000000000000)
      Alignment = taCenter
      AlignToBand = True
      AutoSize = False
      AutoStretch = False
      Caption = 
        '----------------------------------------------------------------' +
        '----------------------'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object ChildBand12: TQRChildBand
    Left = 19
    Top = 597
    Width = 249
    Height = 36
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      95.250000000000000000
      658.812500000000000000)
    ParentBand = ChildBand10
    object QRLabel19: TQRLabel
      Left = 34
      Top = 2
      Width = 54
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        89.958333333333330000
        5.291666666666667000
        142.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLabel19'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Draft 12cpi'
      Font.Style = []
      OnPrint = QRLabel19Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel21: TQRLabel
      Left = 7
      Top = 2
      Width = 21
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        18.520833333333330000
        5.291666666666667000
        55.562500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Usr:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Draft 12cpi'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRSysData2: TQRSysData
      Left = 8
      Top = 20
      Width = 56
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        21.166666666666670000
        52.916666666666670000
        148.166666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      Color = clWhite
      Data = qrsDateTime
      Transparent = False
      FontSize = 8
    end
    object QRLabel4: TQRLabel
      Left = 161
      Top = 3
      Width = 89
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        79.375000000000000000
        425.979166666666700000
        7.937500000000000000
        235.479166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'Original: cliente Copia: vendedor'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object ChildBand13: TQRChildBand
    Left = 19
    Top = 633
    Width = 249
    Height = 17
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      44.979166666666670000
      658.812500000000000000)
    ParentBand = ChildBand12
    object QRLabel13: TQRLabel
      Left = 8
      Top = 0
      Width = 38
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        21.166666666666670000
        0.000000000000000000
        100.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'NumTrn'
      Color = clWhite
      OnPrint = QRLabel13Print
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel23: TQRLabel
      Left = 171
      Top = 3
      Width = 78
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.104166666666670000
        452.437500000000000000
        7.937500000000000000
        206.375000000000000000)
      Alignment = taRightJustify
      AlignToBand = True
      AutoSize = True
      AutoStretch = False
      Caption = 'Powered by IDESI SRL'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Draft 12cpi'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
  end
  object QRLoopBand1: TQRLoopBand
    Left = 19
    Top = 451
    Width = 249
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QRLoopBand1AfterPrint
    AlignToBottom = False
    BeforePrint = QRLoopBand1BeforePrint
    Color = clWindow
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = SummaryBand1
    Size.Values = (
      52.916666666666670000
      658.812500000000000000)
    Master = Owner
    PrintCount = 0
    PrintBefore = False
    object QRDBText29: TQRDBText
      Left = 21
      Top = 2
      Width = 124
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        55.562500000000000000
        5.291666666666667000
        328.083333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmReportes.qryFPagoTicket
      DataField = 'DESCRIPCION'
      OnPrint = QRDBText29Print
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText33: TQRDBText
      Left = 155
      Top = 3
      Width = 91
      Height = 15
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        410.104166666666700000
        7.937500000000000000
        240.770833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmReportes.qryFPagoTicket
      DataField = 'MONTOPAGADODET'
      Mask = ',0.00'
      OnPrint = QRDBText33Print
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText11: TQRDBText
      Left = 152
      Top = 3
      Width = 95
      Height = 15
      Enabled = False
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        402.166666666666700000
        7.937500000000000000
        251.354166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmReportes.qryFPagoTicket
      DataField = 'MONTOPAGADODET'
      Mask = ',0.00'
      OnPrint = QRDBText33Print
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object ChildBand2: TQRChildBand
    Left = 19
    Top = 410
    Width = 249
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand2BeforePrint
    Color = clWindow
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      63.500000000000000000
      658.812500000000000000)
    ParentBand = PageFooterBand1
    object QRDBText9: TQRDBText
      Left = 147
      Top = 3
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        388.937500000000000000
        7.937500000000000000
        264.583333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmFactura.qryVentaFactura
      DataField = 'VALOR_TOTAL_DET'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = [fsBold]
      Mask = ',0.00'
      OnPrint = QRDBText9Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape2: TQRShape
      Left = 136
      Top = 20
      Width = 114
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        359.833333333333300000
        52.916666666666670000
        301.625000000000000000)
      Pen.Style = psDot
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRShape1: TQRShape
      Left = 136
      Top = 0
      Width = 112
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        359.833333333333300000
        0.000000000000000000
        296.333333333333300000)
      Pen.Style = psDot
      Shape = qrsHorLine
      VertAdjust = 0
    end
    object QRLabel25: TQRLabel
      Left = 77
      Top = 4
      Width = 66
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        203.729166666666700000
        10.583333333333330000
        174.625000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Total Neto'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object ChildBand3: TQRChildBand
    Left = 19
    Top = 434
    Width = 249
    Height = 17
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      44.979166666666670000
      658.812500000000000000)
    ParentBand = ChildBand2
    object QRLabel26: TQRLabel
      Left = 58
      Top = 0
      Width = 86
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        153.458333333333300000
        0.000000000000000000
        227.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Monto Recibido'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRDBText23: TQRDBText
      Left = 152
      Top = 0
      Width = 95
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        402.166666666666700000
        0.000000000000000000
        251.354166666666700000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmFactura.qryVentaFactura
      DataField = 'MONTO_PAGADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Mask = ',0.00'
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object ChildBand4: TQRChildBand
    Left = 19
    Top = 650
    Width = 249
    Height = 117
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand4BeforePrint
    Color = clWindow
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      309.562500000000000000
      658.812500000000000000)
    ParentBand = ChildBand13
    object QRImage1: TQRImage
      Left = 2
      Top = 2
      Width = 146
      Height = 109
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        288.395833333333300000
        5.291666666666667000
        5.291666666666667000
        386.291666666666700000)
      Picture.Data = {
        0A544A504547496D616765FE4B0100FFD8FFE000104A46494600010101006000
        600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
        0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
        3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
        3232323232323232323232323232323232323232323232323232323232323232
        32323232323232323232323232FFC000110804C404C403012200021101031101
        FFC4001F0000010501010101010100000000000000000102030405060708090A
        0BFFC400B5100002010303020403050504040000017D01020300041105122131
        410613516107227114328191A1082342B1C11552D1F02433627282090A161718
        191A25262728292A3435363738393A434445464748494A535455565758595A63
        6465666768696A737475767778797A838485868788898A92939495969798999A
        A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
        D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
        01010101010101010000000000000102030405060708090A0BFFC400B5110002
        0102040403040705040400010277000102031104052131061241510761711322
        328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
        292A35363738393A434445464748494A535455565758595A636465666768696A
        737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
        A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
        E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2803E00A28A2800A28A28
        00A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800AFA03F665FF99A
        7FEDD3FF006B57CFF5F407ECCBFF00334FFDBA7FED6A00F7FA28A2803E00A28A
        2800A28A2800AFBFEBE00AFBFE800A28A2800A28A2803E00A28A2800A28A2800
        A28A2800AFA03F665FF99A7FEDD3FF006B57CFF5F407ECCBFF00334FFDBA7FED
        6A00F7FA28A2800A28A2800A28A2800A28A2800A28A2800A28A2803E00A28A28
        00A28A2800AFBFEBE00AFBFE800AF00FDA6BFE656FFB7BFF00DA35EFF5E01FB4
        D7FCCADFF6F7FF00B46803E7FA28A2803EFF00A28A2803C03F69AFF995BFEDEF
        FF0068D7CFF5F407ED35FF0032B7FDBDFF00ED1AF9FE800AFBFEBE00AFBFE800
        A28A2800A28A2800A28A2803C03F69AFF995BFEDEFFF0068D7CFF5F407ED35FF
        0032B7FDBDFF00ED1AF9FE800A28A2800A28A2800A28A2803EFF00A28A2800A2
        8A2800AF802BEFFAF802800A28A2800A28A2803EFF00A28A2803C03F69AFF995
        BFEDEFFF0068D7CFF5F407ED35FF0032B7FDBDFF00ED1AF9FE800A28A2800AFA
        03F665FF0099A7FEDD3FF6B57CFF005F407ECCBFF334FF00DBA7FED6A00F7FA2
        8A2803E00A28A2803E80FD997FE669FF00B74FFDAD5EFF005E01FB32FF00CCD3
        FF006E9FFB5ABDFE800AF802BEFF00AF802800AFA03F665FF99A7FEDD3FF006B
        57CFF5F407ECCBFF00334FFDBA7FED6A00F7FA28A2800A28A2800A28A2800AF8
        02BEFF00AF802800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2803E80FD997FE669FFB74FF00DAD5EFF5E01FB32FFCCD3FF6E9
        FF00B5ABDFE800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A2
        8A2800A28A2800A28A2800A28A2803E00A28A2803D03E197C32FF858DFDA9FF1
        37FECFFB0795FF002EDE6EFDFBFF00DB5C6367BF5AF40FF8665FFA9BBFF29BFF
        00DB68FD997FE669FF00B74FFDAD5EFF00401E01FF000CCBFF005377FE537FFB
        6D1FF0CCBFF5377FE537FF00B6D7BFD1401E01FF000CCBFF005377FE537FFB6D
        1FF0CCBFF5377FE537FF00B6D7BFD1401E01FF000CCBFF005377FE537FFB6D1F
        F0CCBFF5377FE537FF00B6D7BFD1401E01FF000CCBFF005377FE537FFB6D1FF0
        CCBFF5377FE537FF00B6D7BFD1401E01FF000CCBFF005377FE537FFB6D1FF0CC
        BFF5377FE537FF00B6D7BFD1401E01FF000CCBFF005377FE537FFB6D7CFF005F
        7FD7C0140057D01FB32FFCCD3FF6E9FF00B5ABE7FAFA03F665FF0099A7FEDD3F
        F6B5007BFD1451401E01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE537
        FF00B6D7BFD1401F207C4DF865FF000AE7FB2FFE26FF00DA1F6FF37FE5DBCAD9
        B367FB6D9CEFF6E95E7F5F407ED35FF32B7FDBDFFED1AF9FE800AFA03FE1A6BF
        EA51FF00CA97FF006AAF9FE8A00FA03FE1A6BFEA51FF00CA97FF006AA3FE1A6B
        FEA51FFCA97FF6AAF9FE8A00FA03FE1A6BFEA51FFCA97FF6AA3FE1A6BFEA51FF
        00CA97FF006AAF9FE8A0028A28A00F40F865F0CBFE1637F6A7FC4DFF00B3FEC1
        E57FCBB79BBF7EFF00F6D718D9EFD6BD03FE1997FEA6EFFCA6FF00F6DA3F665F
        F99A7FEDD3FF006B57BFD007807FC332FF00D4DDFF0094DFFEDB5F3FD7DFF5F0
        050015E81F0CBE26FF00C2B9FED4FF008947F687DBFCAFF979F2B66CDFFEC367
        3BFDBA579FD1401F407FC34D7FD4A3FF00952FFED547FC34D7FD4A3FF952FF00
        ED55F3FD1401F7FD1451401E7FF137E26FFC2B9FECBFF8947F687DBFCDFF0097
        9F2B66CD9FEC3673BFDBA5701FF0D35FF528FF00E54BFF00B551FB4D7FCCADFF
        006F7FFB46BE7FA00FA03FE1A6BFEA51FF00CA97FF006AAF7FAF802BEFFA002B
        CFFE26FC4DFF008573FD97FF00128FED0FB7F9BFF2F3E56CD9B3FD86CE77FB74
        AF40AF00FDA6BFE656FF00B7BFFDA34007FC34D7FD4A3FF952FF00ED547FC34D
        7FD4A3FF00952FFED55F3FD140051451401E81F0CBE197FC2C6FED4FF89BFF00
        67FD83CAFF00976F377EFDFF00EDAE31B3DFAD7A07FC332FFD4DDFF94DFF00ED
        B47ECCBFF334FF00DBA7FED6AF7FA00F00FF008665FF00A9BBFF0029BFFDB68F
        F869AFFA947FF2A5FF00DAABDFEBE00A00FA03FE1A6BFEA51FFCA97FF6AA3FE4
        E33FEA5EFEC2FF00B7BF3FCFFF00BF7B76F93EF9DDDB1CFCFF005F407ECCBFF3
        34FF00DBA7FED6A003FE1997FEA6EFFCA6FF00F6DA3FE1997FEA6EFF00CA6FFF
        006DAF7FA2800A28A2803C03F69AFF00995BFEDEFF00F68D7CFF005F407ED35F
        F32B7FDBDFFED1AF9FE800AFA03FE1A6BFEA51FF00CA97FF006AAF9FE8A00FA0
        3FE1A6BFEA51FF00CA97FF006AA3FE1A6BFEA51FFCA97FF6AAF9FE8A00FA03FE
        1A6BFEA51FFCA97FF6AA3FE1A6BFEA51FF00CA97FF006AAF9FE8A00FBFE8A28A
        00F00FDA6BFE656FFB7BFF00DA35F3FD7D01FB4D7FCCADFF006F7FFB46BE7FA0
        028A28A002BD03E197C32FF858DFDA9FF137FECFFB0795FF002EDE6EFDFBFF00
        DB5C6367BF5AF3FAFA03F665FF0099A7FEDD3FF6B5001FF0CCBFF5377FE537FF
        00B6D1FF000CCBFF005377FE537FFB6D7BFD1400514514005145140057807FC3
        32FF00D4DDFF0094DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00EDB5E7FF
        00137E197FC2B9FECBFF0089BFF687DBFCDFF976F2B66CD9FEDB673BFDBA57D7
        F5E01FB4D7FCCADFF6F7FF00B46803E7FA28A2803EFF00A28A2803CFFE26FC32
        FF00858DFD97FF00137FECFF00B079BFF2EDE6EFDFB3FDB5C6367BF5AE03FE19
        97FEA6EFFCA6FF00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DAF9FEBEF
        FAF802800AFA03F665FF0099A7FEDD3FF6B57CFF005F407ECCBFF334FF00DBA7
        FED6A00F7FA28A2803E00A28A2803D03E197C4DFF8573FDA9FF128FED0FB7F95
        FF002F3E56CD9BFF00D86CE77FB74AF40FF869AFFA947FF2A5FF00DAABE7FA28
        03E80FF869AFFA947FF2A5FF00DAABE7FA28A002BD03E197C4DFF8573FDA9FF1
        28FED0FB7F95FF002F3E56CD9BFF00D86CE77FB74AF3FA2803E80FF869AFFA94
        7FF2A5FF00DAA8FF00869AFF00A947FF002A5FFDAABE7FA2803EFF00A28A2800
        A28A2800AF802BEFFAF802800AF40F865F0CBFE1637F6A7FC4DFFB3FEC1E57FC
        BB79BBF7EFFF006D718D9EFD6BCFEBE80FD997FE669FFB74FF00DAD4007FC332
        FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF45007807FC332FF
        00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF45007807FC332FF00
        D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF45007807FC332FF00D4
        DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF45007807FC332FF00D4DD
        FF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF45007807FC332FF00D4DDFF
        0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF45007C0145145007D01FB32FF
        00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD3FF6B57BFD001451450014
        5145001451450014514500145145001451450014514500145145001451450014
        5145007C0145145007D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F665FF99A7FED
        D3FF006B57BFD0014515F005007DFF00457C0145007DFF00457C0145007DFF00
        457C0145007DFF00457807ECCBFF00334FFDBA7FED6AF7FA002BE00AFBFEBE00
        A002BE80FD997FE669FF00B74FFDAD5F3FD7D01FB32FFCCD3FF6E9FF00B5A803
        DFE8A28A0028AF8028A00FA03F69AFF995BFEDEFFF0068D7CFF45140051457DF
        F401F00515F7FD7807ED35FF0032B7FDBDFF00ED1A00F9FE8A28A0028AFBFE8A
        00F00FD997FE669FFB74FF00DAD5EFF5E01FB4D7FCCADFF6F7FF00B46BE7FA00
        FBFEBE00A2BEFF00A00F8028AFBFE8A00F8028AFBFE8A0028AF8028A00FA03F6
        9AFF00995BFEDEFF00F68D7CFF0045140057DFF5F0051401F7FD7807ED35FF00
        32B7FDBDFF00ED1AF9FEBE80FD997FE669FF00B74FFDAD401F3FD15F7FD1401F
        0051451401F407ECCBFF00334FFDBA7FED6AF7FAF8028A00FBFEBE00A2BEFF00
        A00F802BE80FD997FE669FFB74FF00DAD5EFF4500145145001457C0145007D01
        FB4D7FCCADFF006F7FFB46BE7FA28A0028A2BEFF00A00F8028AFBFEBC03F69AF
        F995BFEDEFFF0068D007CFF45145007DFF00457C0145007D01FB4D7FCCADFF00
        6F7FFB46BE7FA28A0028A28A002BE80FD997FE669FFB74FF00DAD5F3FD7D01FB
        32FF00CCD3FF006E9FFB5A803DFE8A28A0028AF8028A00FBFE8AF8028A00FBFE
        8AF802BEFF00A002BC03F69AFF00995BFEDEFF00F68D7BFD1401F00515F7FD14
        0051451400515E01FB4D7FCCADFF006F7FFB46BE7FA00FBFEBE00A28A002BE80
        FD997FE669FF00B74FFDAD5F3FD7D01FB32FFCCD3FF6E9FF00B5A803DFE8A28A
        00F8028AFBFE8A00F8028AFA03F69AFF00995BFEDEFF00F68D7CFF0040051457
        DFF401F00515F7FD7807ED35FF0032B7FDBDFF00ED1A00F9FE8A28A00FBFE8A2
        8A0028A28A002BE00AFBFEBE00A002BE80FD997FE669FF00B74FFDAD5F3FD7D0
        1FB32FFCCD3FF6E9FF00B5A803DFE8A28A0028AF8028A00FBFE8AF8028A00FBF
        E8AF8028A00FBFE8AF802BE80FD997FE669FFB74FF00DAD401EFF45145007C01
        45145007D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57
        BFD0014514500145145001451450014514500145145001451450014514500145
        1450014514500145145007C0145145007D01FB32FF00CCD3FF006E9FFB5ABDFE
        BC03F665FF0099A7FEDD3FF6B57BFD0015F0057DFF005F005001451450014514
        500145145007D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF00
        6B57BFD0015F0057DFF5F0050015F407ECCBFF00334FFDBA7FED6AF9FEBE80FD
        997FE669FF00B74FFDAD401EFF0045145007C0145145001457A07C32F865FF00
        0B1BFB53FE26FF00D9FF0060F2BFE5DBCDDFBF7FFB6B8C6CF7EB5E81FF000CCB
        FF005377FE537FFB6D007CFF005F7FD7807FC332FF00D4DDFF0094DFFEDB5EFF
        0040057807ED35FF0032B7FDBDFF00ED1AF7FAF00FDA6BFE656FFB7BFF00DA34
        01F3FD1451401F7FD1451401E01FB4D7FCCADFF6F7FF00B46BE7FAFA03F69AFF
        00995BFEDEFF00F68D7CFF0040057DFF005F0057D01FF0D35FF528FF00E54BFF
        00B55007BFD15E01FF000D35FF00528FFE54BFFB5577FF000CBE26FF00C2C6FE
        D4FF008947F67FD83CAFF979F377EFDFFEC2E31B3DFAD007A051451401F00514
        51400515E81F0CBE197FC2C6FED4FF0089BFF67FD83CAFF976F377EFDFFEDAE3
        1B3DFAD7A07FC332FF00D4DDFF0094DFFEDB401F3FD15F407FC332FF00D4DDFF
        0094DFFEDB47FC332FFD4DDFF94DFF00EDB401F3FD7D01FB32FF00CCD3FF006E
        9FFB5A8FF8665FFA9BBFF29BFF00DB6BBFF865F0CBFE15CFF6A7FC4DFF00B43E
        DFE57FCBB795B366FF00F6DB39DFEDD2803D028A28A00F8028AFA03FE1997FEA
        6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DA00F9FE8AF40F89BF0CBFE1
        5CFF0065FF00C4DFFB43EDFE6FFCBB795B366CFF006DB39DFEDD2BCFE800AFBF
        EBE00AFA03FE1A6BFEA51FFCA97FF6AA00F7FA2BC03FE1A6BFEA51FF00CA97FF
        006AAEFF00E197C4DFF858DFDA9FF128FECFFB0795FF002F3E6EFDFBFF00D85C
        6367BF5A00F40A28A2803E00A2BE80FF008665FF00A9BBFF0029BFFDB68FF866
        5FFA9BBFF29BFF00DB6803E7FA2BD03E26FC32FF008573FD97FF00137FED0FB7
        F9BFF2EDE56CD9B3FDB6CE77FB74AF3FA002BEFF00AF802BE80FF869AFFA947F
        F2A5FF00DAA803DFEBC03F69AFF995BFEDEFFF0068D1FF000D35FF00528FFE54
        BFFB551FF2719FF52F7F617FDBDF9FE7FF00DFBDBB7C9F7CEEED8E403E7FA2BE
        80FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29BFF00DB6803E7FA28
        A2800A2BD03E197C32FF00858DFDA9FF00137FECFF00B0795FF2EDE6EFDFBFFD
        B5C6367BF5AF40FF008665FF00A9BBFF0029BFFDB6803E7FA2BE80FF008665FF
        00A9BBFF0029BFFDB68FF8665FFA9BBFF29BFF00DB6803E7FAFA03F665FF0099
        A7FEDD3FF6B51FF0CCBFF5377FE537FF00B6D77FF0CBE197FC2B9FED4FF89BFF
        00687DBFCAFF00976F2B66CDFF00EDB673BFDBA5007A051451401F00515F407F
        C332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB401F3FD15F407FC
        332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094DFFEDB401F3FD7DFF5E01F
        F0CCBFF5377FE537FF00B6D1FF000D35FF00528FFE54BFFB55007BFD15E01FF0
        D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB55007BFD15E01FF0
        D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB55007BFD1451401E
        01FB4D7FCCADFF006F7FFB46BE7FAFAFFE26FC32FF00858DFD97FF00137FECFF
        00B079BFF2EDE6EFDFB3FDB5C6367BF5AE03FE1997FEA6EFFCA6FF00F6DA00F9
        FE8AFA03FE1997FEA6EFFCA6FF00F6DAF9FE800AFA03F665FF0099A7FEDD3FF6
        B57CFF005F407ECCBFF334FF00DBA7FED6A00F7FA28A2800A28A2803C03F69AF
        F995BFEDEFFF0068D7CFF5F5FF00C4DF865FF0B1BFB2FF00E26FFD9FF60F37FE
        5DBCDDFBF67FB6B8C6CF7EB5C07FC332FF00D4DDFF0094DFFEDB401F3FD7DFF5
        E01FF0CCBFF5377FE537FF00B6D1FF000D35FF00528FFE54BFFB55007BFD7807
        ED35FF0032B7FDBDFF00ED1A3FE1A6BFEA51FF00CA97FF006AA3FE4E33FEA5EF
        EC2FFB7BF3FCFF00FBF7B76F93EF9DDDB1C807CFF457D01FF0CCBFF5377FE537
        FF00B6D1FF000CCBFF005377FE537FFB6D007BFD15E01FF0D35FF528FF00E54B
        FF00B551FF000D35FF00528FFE54BFFB55007BFD15E7FF000CBE26FF00C2C6FE
        D4FF008947F67FD83CAFF979F377EFDFFEC2E31B3DFAD7A050015F0057DFF5F0
        050015F407ECCBFF00334FFDBA7FED6AF9FEBE80FD997FE669FF00B74FFDAD40
        1EFF0045145007C014514500145145001451450015F407ECCBFF00334FFDBA7F
        ED6AF9FEBE80FD997FE669FF00B74FFDAD401EFF0045145007C0145145007D01
        FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD3FF6B57BFD001451
        4500145145001451450014514500145145001451450014514500145145001451
        4500145145007C0145145007D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F665FF9
        9A7FEDD3FF006B57BFD0015F0057DFF5F005001451450014514500145145007D
        01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD3FF6B57BFD0015
        F0057DFF005F0050015F407ECCBFF334FF00DBA7FED6AF9FEBE80FD997FE669F
        FB74FF00DAD401EFF45145007C0145145007D01FB32FFCCD3FF6E9FF00B5ABDF
        EBC03F665FF99A7FEDD3FF006B57BFD001451450015E01FB4D7FCCADFF006F7F
        FB46BDFEBC03F69AFF00995BFEDEFF00F68D007CFF0045145007DFF451450078
        07ED35FF0032B7FDBDFF00ED1AF9FEBE80FDA6BFE656FF00B7BFFDA35F3FD001
        451450015F407ECCBFF334FF00DBA7FED6AF9FEBE80FD997FE669FFB74FF00DA
        D401EFF45145007C0145145007D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F665F
        F99A7FEDD3FF006B57BFD00145145001451450014514500145145007807ED35F
        F32B7FDBDFFED1AF9FEBE80FDA6BFE656FFB7BFF00DA35F3FD001451450015F4
        07ECCBFF00334FFDBA7FED6AF9FEBE80FD997FE669FF00B74FFDAD401EFF0045
        14500145145007807ED35FF32B7FDBDFFED1AF9FEBE80FDA6BFE656FFB7BFF00
        DA35F3FD001451450015F407ECCBFF00334FFDBA7FED6AF9FEBE80FD997FE669
        FF00B74FFDAD401EFF0045145007C0145145007D01FB32FF00CCD3FF006E9FFB
        5ABDFEBC03F665FF0099A7FEDD3FF6B57BFD0014514500145145001451450014
        5145001451450015F0057DFF005F0050014514500145145007DFF45145001451
        450015F0057DFF005F0050015F407ECCBFF334FF00DBA7FED6AF9FEBE80FD997
        FE669FFB74FF00DAD401EFF4514500145145001451450015F0057DFF005F0050
        015F407ECCBFF334FF00DBA7FED6AF9FEBE80FD997FE669FFB74FF00DAD401EF
        F45145007C0145145007D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F665FF99A7F
        EDD3FF006B57BFD0015F0057DFF5F0050015F407ECCBFF00334FFDBA7FED6AF9
        FEBE80FD997FE669FF00B74FFDAD401EFF0045145007C0145145001451450014
        51450015F407ECCBFF00334FFDBA7FED6AF9FEBE80FD997FE669FF00B74FFDAD
        401EFF0045145007C0145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F6
        65FF0099A7FEDD3FF6B57BFD0014514500145145001451450014514500145145
        0014514500145145001451450014514500145145007C0145145007D01FB32FFC
        CD3FF6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD0015F0057DFF5F0
        05001451450014514500145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03
        F665FF0099A7FEDD3FF6B57BFD0015F0057DFF005F0050015F407ECCBFF334FF
        00DBA7FED6AF9FEBE80FD997FE669FFB74FF00DAD401EFF45145001451450014
        51450015F0057DFF005F0050015F407ECCBFF334FF00DBA7FED6AF9FEBE80FD9
        97FE669FFB74FF00DAD401EFF451450014514500145145001451450014514500
        145145007C0145145001451450015F7FD7C015F7FD0015E01FB4D7FCCADFF6F7
        FF00B46BDFEBC03F69AFF995BFEDEFFF0068D007CFF451450014514500145145
        0014514500145145001451450014514500145145001451450014514500145145
        00145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD3F
        F6B57BFD0015F0057DFF005F005001451450014514500145145001451450015F
        7FD7C015F7FD0015E01FB4D7FCCADFF6F7FF00B46BDFEBC03F69AFF995BFEDEF
        FF0068D007CFF4514500145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03
        F665FF0099A7FEDD3FF6B57BFD0015F0057DFF005F0050015F407ECCBFF334FF
        00DBA7FED6AF9FEBE80FD997FE669FFB74FF00DAD401EFF45145001451450078
        07ED35FF0032B7FDBDFF00ED1AF9FEBE80FDA6BFE656FF00B7BFFDA35F3FD001
        451450015F407ECCBFF334FF00DBA7FED6AF9FEBE80FD997FE669FFB74FF00DA
        D401EFF4514500145145001451450015F0057DFF005F0050015F407ECCBFF334
        FF00DBA7FED6AF9FEBE80FD997FE669FFB74FF00DAD401EFF45145007C014514
        500145145001451450015F407ECCBFF334FF00DBA7FED6AF9FEBE80FD997FE66
        9FFB74FF00DAD401EFF45145007C0145145007D01FB32FFCCD3FF6E9FF00B5AB
        DFEBC03F665FF99A7FEDD3FF006B57BFD0014514500145145001451450014514
        5001451450014514500145145001451450014514500145145007C0145145007D
        01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD3FF6B57BFD0015
        E01FF0CCBFF5377FE537FF00B6D7BFD1401E01FF000CCBFF005377FE537FFB6D
        1FF0CCBFF5377FE537FF00B6D7BFD1401E01FF000CCBFF005377FE537FFB6D1F
        F0CCBFF5377FE537FF00B6D7BFD1401E01FF000CCBFF005377FE537FFB6D1FF0
        CCBFF5377FE537FF00B6D7BFD1401E7FF0CBE197FC2B9FED4FF89BFF00687DBF
        CAFF00976F2B66CDFF00EDB673BFDBA57A051450015F0057DFF5F0050015F407
        ECCBFF00334FFDBA7FED6AF9FEBE80FD997FE669FF00B74FFDAD401EFF004514
        5007807FC34D7FD4A3FF00952FFED547FC34D7FD4A3FF952FF00ED55F3FD1401
        F5FF00C32F89BFF0B1BFB53FE251FD9FF60F2BFE5E7CDDFBF7FF00B0B8C6CF7E
        B5E815E01FB32FFCCD3FF6E9FF00B5ABDFE800AF802BEFFAF802800AFA03F665
        FF0099A7FEDD3FF6B57CFF005F407ECCBFF334FF00DBA7FED6A00F7FA28A2803
        C03FE1A6BFEA51FF00CA97FF006AA3FE1A6BFEA51FFCA97FF6AAF9FE8A00FAFF
        00E197C4DFF858DFDA9FF128FECFFB0795FF002F3E6EFDFBFF00D85C6367BF5A
        F40AF00FD997FE669FFB74FF00DAD5EFF40057807FC34D7FD4A3FF00952FFED5
        5EFF005F005007D01FF0D35FF528FF00E54BFF00B551FF000D35FF00528FFE54
        BFFB557CFF0045007D01FF000D35FF00528FFE54BFFB551FF0D35FF528FF00E5
        4BFF00B557CFF45007D01FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE
        537FFB6D7BFD1401E01FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE53
        7FFB6D7BFD1401E01FF0CCBFF5377FE537FF00B6D7BFD1450015E01FB4D7FCCA
        DFF6F7FF00B46BDFEBC03F69AFF995BFEDEFFF0068D007CFF45145007D01FF00
        0CCBFF005377FE537FFB6D1FF0CCBFF5377FE537FF00B6D7BFD1401F207C4DF8
        65FF000AE7FB2FFE26FF00DA1F6FF37FE5DBCAD9B367FB6D9CEFF6E95E7F5F40
        7ED35FF32B7FDBDFFED1AF9FE800A28A2800A28A2800A28A2800A28A2803D03E
        197C32FF00858DFDA9FF00137FECFF00B0795FF2EDE6EFDFBFFDB5C6367BF5AF
        40FF008665FF00A9BBFF0029BFFDB68FD997FE669FFB74FF00DAD5EFF401E01F
        F0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE537FFB6D7BFD1401E01FF0
        CCBFF5377FE537FF00B6D1FF000CCBFF005377FE537FFB6D7BFD1401E01FF0CC
        BFF5377FE537FF00B6D1FF000CCBFF005377FE537FFB6D7BFD1401F005145140
        1E81F0CBE26FFC2B9FED4FF8947F687DBFCAFF00979F2B66CDFF00EC3673BFDB
        A57A07FC34D7FD4A3FF952FF00ED55F3FD1401F407FC34D7FD4A3FF952FF00ED
        547FC332FF00D4DDFF0094DFFEDB5F3FD7DFF401E01FF0CCBFF5377FE537FF00
        B6D1FF000CCBFF005377FE537FFB6D7BFD1401E01FF0CCBFF5377FE537FF00B6
        D1FF000CCBFF005377FE537FFB6D7BFD1401F0051451401E81F0CBE197FC2C6F
        ED4FF89BFF0067FD83CAFF00976F377EFDFF00EDAE31B3DFAD7A07FC332FFD4D
        DFF94DFF00EDB47ECCBFF334FF00DBA7FED6AF7FA00F00FF008665FF00A9BBFF
        0029BFFDB6BDFE8A2800AF3FF89BF0CBFE1637F65FFC4DFF00B3FEC1E6FF00CB
        B79BBF7ECFF6D718D9EFD6BD028A00F00FF8665FFA9BBFF29BFF00DB68FF0086
        65FF00A9BBFF0029BFFDB6BDFE8A00F00FF8665FFA9BBFF29BFF00DB68FF0086
        65FF00A9BBFF0029BFFDB6BDFE8A00F3FF00865F0CBFE15CFF006A7FC4DFFB43
        EDFE57FCBB795B366FFF006DB39DFEDD2BD028A2800AF00FF8665FFA9BBFF29B
        FF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB6BBFF00865F0CBFE15C
        FF006A7FC4DFFB43EDFE57FCBB795B366FFF006DB39DFEDD2BD028A0028A28A0
        028A28A00F3FF89BF0CBFE1637F65FFC4DFF00B3FEC1E6FF00CBB79BBF7ECFF6
        D718D9EFD6B80FF8665FFA9BBFF29BFF00DB6BDFE8A00F00FF008665FF00A9BB
        FF0029BFFDB6BE7FAFBFEBE00A002BE80FD997FE669FFB74FF00DAD5F3FD7D01
        FB32FF00CCD3FF006E9FFB5A803DFE8A28A0028A28A0028A28A002BE00AFBFEB
        E00A002BE80FD997FE669FFB74FF00DAD5F3FD7D01FB32FF00CCD3FF006E9FFB
        5A803DFE8A28A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29B
        FF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29B
        FF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29B
        FF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB6BBFF00865F0CBFE15C
        FF006A7FC4DFFB43EDFE57FCBB795B366FFF006DB39DFEDD2BD028A0028A28A0
        0F8028A28A00FA03F665FF0099A7FEDD3FF6B57BFD7807ECCBFF00334FFDBA7F
        ED6AF7FA0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
        0028A28A0028A28A0028A28A00F8028A28A00FA03F665FF99A7FEDD3FF006B57
        BFD7C0145007DFF457C0145007DFF457C0145007DFF457C0145007DFF457C014
        5007DFF457C0145007DFF5F0051450015F407ECCBFF334FF00DBA7FED6AF9FEB
        E80FD997FE669FFB74FF00DAD401EFF45145007C0145145007D01FB32FFCCD3F
        F6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD0015F0057DFF5F00500
        15F407ECCBFF00334FFDBA7FED6AF9FEBE80FD997FE669FF00B74FFDAD401EFF
        0045145007C0145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF00
        99A7FEDD3FF6B57BFD0015F0057DFF005F0050014515F407ECCBFF00334FFDBA
        7FED6A00F9FE8AFBFE8A0028AF8028A00FBFE8AF00FD997FE669FF00B74FFDAD
        5EFF0040051457C01401F7FD7807ED35FF0032B7FDBDFF00ED1AF9FEBE80FD99
        7FE669FF00B74FFDAD401F3FD15F7FD1400515F0051401F407ED35FF0032B7FD
        BDFF00ED1AF9FEBE80FD997FE669FF00B74FFDAD5EFF00401F00515F7FD7C014
        0051457D01FB32FF00CCD3FF006E9FFB5A803E7FA2BEFF00A2803E00A28A2803
        E80FD997FE669FFB74FF00DAD5EFF5E01FB32FFCCD3FF6E9FF00B5ABDFE800A2
        8AF802803EFF00A2BE00AFA03F665FF99A7FEDD3FF006B5007BFD1451401F005
        1451400515F407ECCBFF00334FFDBA7FED6AF7FA00F802BEFF00A2BE00A00FBF
        E8AF802BE80FD997FE669FFB74FF00DAD401EFF45145007C0145145007D01FB3
        2FFCCD3FF6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD0014515F005
        007DFF00457C015F407ECCBFF334FF00DBA7FED6A00F7FA28A2800A2BE00A280
        3EFF00A2BC03F665FF0099A7FEDD3FF6B57BFD0014515F005007DFF457C015F4
        07ECCBFF00334FFDBA7FED6A00F7FA28A2800A2BE00A2803EFFA2BC03F665FF9
        9A7FEDD3FF006B57BFD0015F0057DFF5F0050015F407ECCBFF00334FFDBA7FED
        6AF9FEBE80FD997FE669FF00B74FFDAD401EFF0045145001457C0145007DFF00
        457807ECCBFF00334FFDBA7FED6AF7FA002BE00AFBFEBE00A002BE80FD997FE6
        69FF00B74FFDAD5F3FD1401F7FD15F0051401F7FD15F0051401F7FD15F005140
        1F7FD15F0051401F7FD15F0051401F7FD15F005140051451401F407ECCBFF334
        FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFDAD5EFF004005145140051451
        4005145140051451400514514005145140051451400514514005145140051451
        401F00515F407FC332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB4
        01F3FD15F407FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094DFFEDB40
        1F3FD15F407FC332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB401
        F3FD15F407FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094DFFEDB401F
        3FD15F407FC332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB401F3
        FD15F407FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094DFFEDB401F3F
        D15F407FC332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB401F3FD
        15F407FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094DFFEDB401F3FD7
        D01FB32FFCCD3FF6E9FF00B5A8FF008665FF00A9BBFF0029BFFDB6BBFF00865F
        0CBFE15CFF006A7FC4DFFB43EDFE57FCBB795B366FFF006DB39DFEDD2803D028
        A28A00F8028A28A00FA03F665FF99A7FEDD3FF006B57BFD7C81F0CBE26FF00C2
        B9FED4FF008947F687DBFCAFF979F2B66CDFFEC3673BFDBA57A07FC34D7FD4A3
        FF00952FFED5401EFF005F0057D01FF0D35FF528FF00E54BFF00B557CFF40057
        D01FB32FFCCD3FF6E9FF00B5ABE7FAFA03F665FF0099A7FEDD3FF6B5007BFD14
        51401F0051451401F407ECCBFF00334FFDBA7FED6AF7FAF00FD997FE669FFB74
        FF00DAD5EFF40057C015F7FD7807FC332FFD4DDFF94DFF00EDB401F3FD7D01FB
        32FF00CCD3FF006E9FFB5A8FF8665FFA9BBFF29BFF00DB68FF009373FF00A987
        FB77FEDD3C8F23FEFE6EDDE77B636F7CF001EFF457807FC34D7FD4A3FF00952F
        FED547FC34D7FD4A3FF952FF00ED5401F3FD15F407FC332FFD4DDFF94DFF00ED
        B47FC332FF00D4DDFF0094DFFEDB4007ECCBFF00334FFDBA7FED6AF7FAF3FF00
        865F0CBFE15CFF006A7FC4DFFB43EDFE57FCBB795B366FFF006DB39DFEDD2BD0
        2800AF802BEFFAF802800AFA03F665FF0099A7FEDD3FF6B57CFF005F407ECCBF
        F334FF00DBA7FED6A00F7FA28A2803E00A28A2803E80FD997FE669FF00B74FFD
        AD5EFF005E01FB32FF00CCD3FF006E9FFB5ABDFE800AF802BEFF00AF802800AF
        A03F665FF99A7FEDD3FF006B57CFF5F407ECCBFF00334FFDBA7FED6A00F7FA28
        A2803E00A28A2803E80FD997FE669FFB74FF00DAD5EFF5E01FB32FFCCD3FF6E9
        FF00B5ABDFE800AF802BEFFAF00FF8665FFA9BBFF29BFF00DB6803E7FAFA03F6
        65FF0099A7FEDD3FF6B51FF0CCBFF5377FE537FF00B6D77FF0CBE197FC2B9FED
        4FF89BFF00687DBFCAFF00976F2B66CDFF00EDB673BFDBA5007A051451401F00
        51451401F407ECCBFF00334FFDBA7FED6AF7FAF903E197C4DFF8573FDA9FF128
        FED0FB7F95FF002F3E56CD9BFF00D86CE77FB74AF40FF869AFFA947FF2A5FF00
        DAA803DFEBE00AFA03FE1A6BFEA51FFCA97FF6AA3FE1997FEA6EFF00CA6FFF00
        6DA00F9FEBE80FD997FE669FFB74FF00DAD47FC332FF00D4DDFF0094DFFEDB47
        FC9B9FFD4C3FDBBFF6E9E4791FF7F376EF3BDB1B7BE7800F7FA2BC03FE1A6BFE
        A51FFCA97FF6AA3FE1A6BFEA51FF00CA97FF006AA00F9FE8A28A00FA03F665FF
        0099A7FEDD3FF6B57BFD7C81F0CBE26FFC2B9FED4FF8947F687DBFCAFF00979F
        2B66CDFF00EC3673BFDBA57A07FC34D7FD4A3FF952FF00ED5401EFF5F0057D01
        FF000D35FF00528FFE54BFFB551FF0CCBFF5377FE537FF00B6D007CFF5F407EC
        CBFF00334FFDBA7FED6A3FE1997FEA6EFF00CA6FFF006DAEFF00E197C32FF857
        3FDA9FF137FED0FB7F95FF002EDE56CD9BFF00DB6CE77FB74A00F40A28A2803E
        00A28A2803E80FD997FE669FFB74FF00DAD5EFF5F207C32F89BFF0AE7FB53FE2
        51FDA1F6FF002BFE5E7CAD9B37FF00B0D9CEFF006E95E81FF0D35FF528FF00E5
        4BFF00B55007BFD7C015F407FC34D7FD4A3FF952FF00ED547FC332FF00D4DDFF
        0094DFFEDB401F3FD7D01FB32FFCCD3FF6E9FF00B5A8FF008665FF00A9BBFF00
        29BFFDB68FF9373FFA987FB77FEDD3C8F23FEFE6EDDE77B636F7CF001EFF0045
        7807FC34D7FD4A3FF952FF00ED547FC34D7FD4A3FF00952FFED5401F3FD15F40
        7FC332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB4007ECCBFF334
        FF00DBA7FED6AF7FAF3FF865F0CBFE15CFF6A7FC4DFF00B43EDFE57FCBB795B3
        66FF00F6DB39DFEDD2BD02800AF802BEFF00AF802800AFA03F665FF99A7FEDD3
        FF006B57CFF5E81F0CBE26FF00C2B9FED4FF008947F687DBFCAFF979F2B66CDF
        FEC3673BFDBA5007D7F457807FC34D7FD4A3FF00952FFED547FC34D7FD4A3FF9
        52FF00ED5401F3FD15F407FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF00
        94DFFEDB4007ECCBFF00334FFDBA7FED6AF7FAF3FF00865F0CBFE15CFF006A7F
        C4DFFB43EDFE57FCBB795B366FFF006DB39DFEDD2BD02800AF802BEFFAF00FF8
        665FFA9BBFF29BFF00DB6803E7FA2BE80FF8665FFA9BBFF29BFF00DB68FF0086
        65FF00A9BBFF0029BFFDB6803E7FA2BE80FF008665FF00A9BBFF0029BFFDB68F
        F8665FFA9BBFF29BFF00DB6803E7FA2BE80FF8665FFA9BBFF29BFF00DB68FF00
        8665FF00A9BBFF0029BFFDB6803E7FA2BE80FF008665FF00A9BBFF0029BFFDB6
        8FF8665FFA9BBFF29BFF00DB6803E7FA2BE80FF8665FFA9BBFF29BFF00DB68FF
        008665FF00A9BBFF0029BFFDB6803E7FA2BE80FF008665FF00A9BBFF0029BFFD
        B68FF8665FFA9BBFF29BFF00DB6803E7FA2BE80FF8665FFA9BBFF29BFF00DB68
        FF008665FF00A9BBFF0029BFFDB6803E7FA2BE80FF008665FF00A9BBFF0029BF
        FDB68FF8665FFA9BBFF29BFF00DB6800FD997FE669FF00B74FFDAD5EFF005E7F
        F0CBE197FC2B9FED4FF89BFF00687DBFCAFF00976F2B66CDFF00EDB673BFDBA5
        7A05001451450014514500145145001451450014514500145145001451450014
        5145001451450014514500145145001451450014514500145145001451450014
        514500145145001451450014514500145145007C014514500145145001451450
        015F407ECCBFF334FF00DBA7FED6AF9FEBE80FD997FE669FFB74FF00DAD401EF
        F45145007C0145145007D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F665FF99A7F
        EDD3FF006B57BFD001451450015E01FB4D7FCCADFF006F7FFB46BDFEBC03F69A
        FF00995BFEDEFF00F68D007CFF0045145007DFF45145001451450015F0057DFF
        005F0050015F407ECCBFF334FF00DBA7FED6AF9FEBE80FD997FE669FFB74FF00
        DAD401EFF45145007C0145145007D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F66
        5FF99A7FEDD3FF006B57BFD0015F0057DFF5F0050015F407ECCBFF00334FFDBA
        7FED6AF9FEBE80FD997FE669FF00B74FFDAD401EFF0045145007C0145145007D
        01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD3FF6B57BFD0014
        51450014514500145145007C0145145001451450015F7FD7C015F7FD0015E01F
        B4D7FCCADFF6F7FF00B46BDFEBC03F69AFF995BFEDEFFF0068D007CFF4514500
        145145001451450015F7FD7C015F7FD0014514500145145007C0145145001451
        450015F7FD7C015F7FD0015E01FB4D7FCCADFF006F7FFB46BDFEBC03F69AFF00
        995BFEDEFF00F68D007CFF0045145007DFF45145001451450015F0057DFF005F
        0050014514500145145007DFF451450014514500145145001451450014514500
        1451450014514500145145001451450014514500145145001451450014514500
        1451450014514500145145001451450014514500145145001451450014514500
        14514500145145007807ED35FF0032B7FDBDFF00ED1AF9FEBE80FDA6BFE656FF
        00B7BFFDA35F3FD0015F7FD7C015F7FD0015E01FB4D7FCCADFF6F7FF00B46BDF
        EBC03F69AFF995BFEDEFFF0068D007CFF45145007DFF0045145007807ED35FF3
        2B7FDBDFFED1AF9FEBE80FDA6BFE656FFB7BFF00DA35F3FD0014514500145145
        0014514500145145001451450015F7FD7C015F7FD00145145001451450014514
        5001451450015F0057DFF5F00500145145001451450014514500145145001451
        45001451450014514500145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03
        F665FF0099A7FEDD3FF6B57BFD001451450015E01FB4D7FCCADFF6F7FF00B46B
        DFEBC03F69AFF995BFEDEFFF0068D007CFF45145001451450014514500145145
        00145145001451450014514500145145001451450015F407ECCBFF00334FFDBA
        7FED6AF9FEBE80FD997FE669FF00B74FFDAD401EFF004514500145145007807E
        D35FF32B7FDBDFFED1AF9FEBE80FDA6BFE656FFB7BFF00DA35F3FD0014514500
        15F407ECCBFF00334FFDBA7FED6AF9FEBE80FD997FE669FF00B74FFDAD401EFF
        0045145007C0145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF00
        99A7FEDD3FF6B57BFD0015F0057DFF005F005001451450014514500145145001
        4514500145145001451450014514500145145001451450014514500145145001
        45145007DFF45145007807ED35FF0032B7FDBDFF00ED1AF9FEBE80FDA6BFE656
        FF00B7BFFDA35F3FD001451450015F407ECCBFF334FF00DBA7FED6AF9FEBE80F
        D997FE669FFB74FF00DAD401EFF45145007C0145145007D01FB32FFCCD3FF6E9
        FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD00145145001451450014514
        500145145001451450014514500145145001451450014514500145145007807F
        C34D7FD4A3FF00952FFED547FC34D7FD4A3FF952FF00ED55F3FD1401E81F137E
        26FF00C2C6FECBFF008947F67FD83CDFF979F377EFD9FEC2E31B3DFAD79FD145
        0015F7FD7C015F7FD0015E01FB4D7FCCADFF006F7FFB46BDFEBC03F69AFF0099
        5BFEDEFF00F68D007CFF0045145007DFF451450079FF00C4DF865FF0B1BFB2FF
        00E26FFD9FF60F37FE5DBCDDFBF67FB6B8C6CF7EB5C07FC332FF00D4DDFF0094
        DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094
        DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094
        DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094
        DFFEDB5EFF0045007C0145145001451450015F407FC34D7FD4A3FF00952FFED5
        5F3FD1401F407FC34D7FD4A3FF00952FFED55DFF00C32F89BFF0B1BFB53FE251
        FD9FF60F2BFE5E7CDDFBF7FF00B0B8C6CF7EB5F2057D01FB32FF00CCD3FF006E
        9FFB5A803DFE8A28A0028A28A00F3FF89BF137FE15CFF65FFC4A3FB43EDFE6FF
        00CBCF95B366CFF61B39DFEDD2B80FF869AFFA947FF2A5FF00DAA8FDA6BFE656
        FF00B7BFFDA35F3FD007D01FF0D35FF528FF00E54BFF00B557CFF45140051451
        40051451400514514005145140057D01FF000CCBFF005377FE537FFB6D7CFF00
        5F7FD007807FC332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EF
        F45007807FC332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF4
        5007807FC332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF450
        07807FC9B9FF00D4C3FDBBFF006E9E4791FF007F376EF3BDB1B7BE783FE1A6BF
        EA51FF00CA97FF006AA3F69AFF00995BFEDEFF00F68D7CFF00401F407FC34D7F
        D4A3FF00952FFED547FC34D7FD4A3FF952FF00ED55F3FD1401F407FC34D7FD4A
        3FF952FF00ED547FC9C67FD4BDFD85FF006F7E7F9FFF007EF6EDF27DF3BBB639
        F9FEBE80FD997FE669FF00B74FFDAD4007FC332FFD4DDFF94DFF00EDB47FC332
        FF00D4DDFF0094DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00EDB47FC332
        FF00D4DDFF0094DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00EDB47FC332
        FF00D4DDFF0094DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00EDB47FC332
        FF00D4DDFF0094DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00EDB5E7FF00
        137E197FC2B9FECBFF0089BFF687DBFCDFF976F2B66CD9FEDB673BFDBA57D7F5
        E01FB4D7FCCADFF6F7FF00B46803E7FA28A2803E80FF008665FF00A9BBFF0029
        BFFDB68FF8665FFA9BBFF29BFF00DB6BDFE8A00F903E26FC32FF008573FD97FF
        00137FED0FB7F9BFF2EDE56CD9B3FDB6CE77FB74AF3FAFA03F69AFF995BFEDEF
        FF0068D7CFF40057D01FF0CCBFF5377FE537FF00B6D7CFF5F7FD007807FC332F
        FD4DDFF94DFF00EDB47FC9B9FF00D4C3FDBBFF006E9E4791FF007F376EF3BDB1
        B7BE78F7FAF00FDA6BFE656FFB7BFF00DA34007FC34D7FD4A3FF00952FFED547
        FC34D7FD4A3FF952FF00ED55F3FD1401F7FD1451401E7FF137E197FC2C6FECBF
        F89BFF0067FD83CDFF00976F377EFD9FEDAE31B3DFAD701FF0CCBFF5377FE537
        FF00B6D7BFD1401E01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE537FF
        00B6D7BFD1401E01FF000CCBFF005377FE537FFB6D1FF26E7FF530FF006EFF00
        DBA791E47FDFCDDBBCEF6C6DEF9E3DFEBC03F69AFF00995BFEDEFF00F68D001F
        F0D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB557CFF00450014
        5145007A07C32F89BFF0AE7FB53FE251FDA1F6FF002BFE5E7CAD9B37FF00B0D9
        CEFF006E95E81FF0D35FF528FF00E54BFF00B557CFF45007D01FF0D35FF528FF
        00E54BFF00B551FF000CCBFF005377FE537FFB6D7CFF005F7FD007807FC332FF
        00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF45007807FC332FF00
        D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF45007C0145145007A07
        C32F865FF0B1BFB53FE26FFD9FF60F2BFE5DBCDDFBF7FF00B6B8C6CF7EB5E81F
        F0CCBFF5377FE537FF00B6D1FB32FF00CCD3FF006E9FFB5ABDFE803C03FE1997
        FEA6EFFCA6FF00F6DA3FE1997FEA6EFF00CA6FFF006DAF7FA2803C03FE1997FE
        A6EFFCA6FF00F6DAF3FF0089BF0CBFE15CFF0065FF00C4DFFB43EDFE6FFCBB79
        5B366CFF006DB39DFEDD2BEBFAF00FDA6BFE656FFB7BFF00DA3401F3FD145140
        1F407FC332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF45007
        C81F137E197FC2B9FECBFF0089BFF687DBFCDFF976F2B66CD9FEDB673BFDBA57
        9FD7D01FB4D7FCCADFF6F7FF00B46BE7FA002BE80FF8665FFA9BBFF29BFF00DB
        6BE7FAFBFE803C03FE1997FEA6EFFCA6FF00F6DAF3FF0089BF0CBFE15CFF0065
        FF00C4DFFB43EDFE6FFCBB795B366CFF006DB39DFEDD2BEBFAF00FDA6BFE656F
        FB7BFF00DA3401F3FD1451401F7FD1451401E7FF00137E197FC2C6FECBFF0089
        BFF67FD83CDFF976F377EFD9FEDAE31B3DFAD701FF000CCBFF005377FE537FFB
        6D7BFD1401E01FF0CCBFF5377FE537FF00B6D7CFF5F7FD7C0140057A07C32F89
        BFF0AE7FB53FE251FDA1F6FF002BFE5E7CAD9B37FF00B0D9CEFF006E95E7F450
        07D01FF0D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB557CFF00
        4500145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD
        3FF6B57BFD001451450014514500145145001451450014514500145145001451
        45001451450014514500145145007C01457DFF0045007C01457D01FB4D7FCCAD
        FF006F7FFB46BE7FA002BEFF00AF8028A00FBFEBC03F69AFF995BFEDEFFF0068
        D7CFF5F407ECCBFF00334FFDBA7FED6A00F9FE8AFBFE8A0028AF8028A00FBFE8
        AF8028A00FBFE8AF8028A00FBFE8AF8028A00FBFE8AF8028A0028A28A0028AFA
        03F665FF0099A7FEDD3FF6B57BFD007C01457DFF005F0050015F407ECCBFF334
        FF00DBA7FED6AF9FEBE80FD997FE669FFB74FF00DAD401EFF45145001457C014
        5007D01FB4D7FCCADFF6F7FF00B46BE7FA28A0028A2BEFFA00F8028AFBFEBC03
        F69AFF00995BFEDEFF00F68D007CFF0045145001457DFF0045007C01457D01FB
        4D7FCCADFF006F7FFB46BE7FA002BEFF00AF802BEFFA0028A28A0028A28A0028
        A28A00F00FDA6BFE656FFB7BFF00DA35F3FD7D01FB4D7FCCADFF006F7FFB46BE
        7FA0028A2BEFFA00F802BE80FD997FE669FF00B74FFDAD5EFF005E01FB4D7FCC
        ADFF006F7FFB46803DFE8AF8028A00FBFE8A28A0028AF00FDA6BFE656FFB7BFF
        00DA35F3FD007DFF00457C015F7FD0015E01FB4D7FCCADFF006F7FFB46BDFEBC
        03F69AFF00995BFEDEFF00F68D007CFF0045145007DFF45145007807ED35FF00
        32B7FDBDFF00ED1AF9FEBE80FDA6BFE656FF00B7BFFDA35F3FD0015F7FD7C015
        F7FD0015E01FB4D7FCCADFF6F7FF00B46BDFEBC03F69AFF995BFEDEFFF0068D0
        07CFF45145007DFF00457C0145007DFF00457807ECCBFF00334FFDBA7FED6AF7
        FA0028A2BE00A00FBFEBC03F69AFF995BFEDEFFF0068D7CFF5F407ECCBFF0033
        4FFDBA7FED6A00F9FE8AFBFE8A00F8028A28A0028AFA03F665FF0099A7FEDD3F
        F6B57BFD007C015F7FD1450014515E01FB4D7FCCADFF006F7FFB46803DFE8AF8
        028A0028A28A00FA03F665FF0099A7FEDD3FF6B57BFD7C0145007DFF00457C01
        5F7FD0015E01FB4D7FCCADFF006F7FFB46BDFE8A00F8028AFBFE8A0028A28A00
        F00FDA6BFE656FFB7BFF00DA35F3FD7D01FB4D7FCCADFF006F7FFB46BE7FA002
        BEFF00AF8028A00FBFEBC03F69AFF995BFEDEFFF0068D7CFF5F407ECCBFF0033
        4FFDBA7FED6A00F9FE8AFBFE8A0028AF8028A00FBFE8AF00FD997FE669FF00B7
        4FFDAD5EFF0040057C015F7FD1401F00515F7FD7807ED35FF32B7FDBDFFED1A0
        0F9FE8A28A0028AFBFE8A00F00FD997FE669FF00B74FFDAD5EFF004514005145
        1400514514005145140051451400514514005145140051451400514514005145
        14005145140051451401E01FB4D7FCCADFF6F7FF00B46BE7FAFAFF00E26FC32F
        F858DFD97FF137FECFFB079BFF002EDE6EFDFB3FDB5C6367BF5AE03FE1997FEA
        6EFF00CA6FFF006DA00F9FE8AFA03FE1997FEA6EFF00CA6FFF006DAF9FE800AF
        A03F665FF99A7FEDD3FF006B57CFF5E81F0CBE26FF00C2B9FED4FF008947F687
        DBFCAFF979F2B66CDFFEC3673BFDBA5007D7F457807FC34D7FD4A3FF00952FFE
        D547FC34D7FD4A3FF952FF00ED5401F3FD1451400515E81F0CBE197FC2C6FED4
        FF0089BFF67FD83CAFF976F377EFDFFEDAE31B3DFAD7A07FC332FF00D4DDFF00
        94DFFEDB401F3FD15F407FC332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94D
        FF00EDB401F3FD15F407FC332FFD4DDFF94DFF00EDB5E7FF00137E197FC2B9FE
        CBFF0089BFF687DBFCDFF976F2B66CD9FEDB673BFDBA50079FD1451400514514
        01F407ECCBFF00334FFDBA7FED6AF7FAF903E197C4DFF8573FDA9FF128FED0FB
        7F95FF002F3E56CD9BFF00D86CE77FB74AF40FF869AFFA947FF2A5FF00DAA803
        DFEBE00AFA03FE1A6BFEA51FFCA97FF6AAF9FE800AFA03F665FF0099A7FEDD3F
        F6B57CFF005E81F0CBE26FFC2B9FED4FF8947F687DBFCAFF00979F2B66CDFF00
        EC3673BFDBA5007D7F457807FC34D7FD4A3FF952FF00ED547FC34D7FD4A3FF00
        952FFED5401F3FD15F407FC332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94D
        FF00EDB401F3FD15E81F137E197FC2B9FECBFF0089BFF687DBFCDFF976F2B66C
        D9FEDB673BFDBA579FD0015F7FD7C015F407FC34D7FD4A3FF952FF00ED5401EF
        F5E01FB4D7FCCADFF6F7FF00B468FF00869AFF00A947FF002A5FFDAA8FF938CF
        FA97BFB0BFEDEFCFF3FF00EFDEDDBE4FBE7776C7201F3FD15F407FC332FF00D4
        DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB401EFF45145007807ED35FF00
        32B7FDBDFF00ED1AF9FEBEBFF89BF0CBFE1637F65FFC4DFF00B3FEC1E6FF00CB
        B79BBF7ECFF6D718D9EFD6B80FF8665FFA9BBFF29BFF00DB6803E7FAFBFEBC03
        FE1997FEA6EFFCA6FF00F6DA3FE1A6BFEA51FF00CA97FF006AA00F7FA2BC03FE
        1A6BFEA51FFCA97FF6AA3FE1A6BFEA51FF00CA97FF006AA00F7FA2BC03FE1A6B
        FEA51FFCA97FF6AA3FE1A6BFEA51FF00CA97FF006AA00F7FA28A2803C03F69AF
        F995BFEDEFFF0068D7CFF5F407ED35FF0032B7FDBDFF00ED1AF9FE800AFBFEBE
        00AFBFE800AF00FDA6BFE656FF00B7BFFDA35EFF005E7FF137E197FC2C6FECBF
        F89BFF0067FD83CDFF00976F377EFD9FEDAE31B3DFAD007C81457D01FF000CCB
        FF005377FE537FFB6D1FF0CCBFF5377FE537FF00B6D007BFD1451401E01FB4D7
        FCCADFF6F7FF00B46BE7FAFAFF00E26FC32FF858DFD97FF137FECFFB079BFF00
        2EDE6EFDFB3FDB5C6367BF5AE03FE1997FEA6EFF00CA6FFF006DA00F9FEBEFFA
        F00FF8665FFA9BBFF29BFF00DB6BDFE800AF00FDA6BFE656FF00B7BFFDA35EFF
        005E7FF137E197FC2C6FECBFF89BFF0067FD83CDFF00976F377EFD9FEDAE31B3
        DFAD007C81457D01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE537FF00
        B6D007BFD15E01FF000D35FF00528FFE54BFFB551FF0D35FF528FF00E54BFF00
        B55001FB4D7FCCADFF006F7FFB46BE7FAFA03FE4E33FEA5EFEC2FF00B7BF3FCF
        FF00BF7B76F93EF9DDDB1C9FF0CCBFF5377FE537FF00B6D007CFF5F7FD7807FC
        332FFD4DDFF94DFF00EDB5EFF40057807ED35FF32B7FDBDFFED1AF7FAF3FF89B
        F0CBFE1637F65FFC4DFF00B3FEC1E6FF00CBB79BBF7ECFF6D718D9EFD6803E40
        A2BE80FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29BFF00DB6803E7
        FA2BE80FF8665FFA9BBFF29BFF00DB68FF008665FF00A9BBFF0029BFFDB6800F
        D997FE669FFB74FF00DAD5EFF5E7FF000CBE197FC2B9FED4FF0089BFF687DBFC
        AFF976F2B66CDFFEDB673BFDBA57A050015F0057DFF5E01FF0CCBFF5377FE537
        FF00B6D007CFF5F407ECCBFF00334FFDBA7FED6A3FE1997FEA6EFF00CA6FFF00
        6DAEFF00E197C32FF8573FDA9FF137FED0FB7F95FF002EDE56CD9BFF00DB6CE7
        7FB74A00F40A28A2803E00A28A2803E80FD997FE669FFB74FF00DAD5EFF5E01F
        B32FFCCD3FF6E9FF00B5ABDFE800A28A2800AF00FDA6BFE656FF00B7BFFDA35E
        FF005E7FF137E197FC2C6FECBFF89BFF0067FD83CDFF00976F377EFD9FEDAE31
        B3DFAD007C81457D01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE537FF
        00B6D007CFF457D01FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE537F
        FB6D007CFF00457A07C4DF865FF0AE7FB2FF00E26FFDA1F6FF0037FE5DBCAD9B
        367FB6D9CEFF006E95E7F40057DFF5F0057D01FF000D35FF00528FFE54BFFB55
        007BFD15E01FF0D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB55
        007BFD15E01FF0D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB55
        007BFD15E01FF0D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB55
        001FB4D7FCCADFF6F7FF00B46BE7FAF40F89BF137FE1637F65FF00C4A3FB3FEC
        1E6FFCBCF9BBF7ECFF0061718D9EFD6BCFE800A28A2800AFA03F665FF99A7FED
        D3FF006B57CFF5E81F0CBE26FF00C2B9FED4FF008947F687DBFCAFF979F2B66C
        DFFEC3673BFDBA5007D7F457807FC34D7FD4A3FF00952FFED547FC34D7FD4A3F
        F952FF00ED5401F3FD1451401F407ECCBFF334FF00DBA7FED6AF7FAF00FD997F
        E669FF00B74FFDAD5EFF0040051457807FC34D7FD4A3FF00952FFED5401EFF00
        5E01FB4D7FCCADFF006F7FFB468FF869AFFA947FF2A5FF00DAA8FF00938CFF00
        A97BFB0BFEDEFCFF003FFEFDEDDBE4FBE7776C7201F3FD15F407FC332FFD4DDF
        F94DFF00EDB47FC332FF00D4DDFF0094DFFEDB401EFF00457807FC34D7FD4A3F
        F952FF00ED547FC34D7FD4A3FF00952FFED5401EFF004579FF00C32F89BFF0B1
        BFB53FE251FD9FF60F2BFE5E7CDDFBF7FF00B0B8C6CF7EB5E814005145140051
        4514005145140051451400514514005145140051451400514514005145140051
        451400514514005145140057C015F7FD7C01400514514005145140051451401F
        407ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFDAD5EFF004005
        145140057807ED35FF0032B7FDBDFF00ED1AF7FAF00FDA6BFE656FFB7BFF00DA
        3401F3FD14514005145140051451400514514005145140051451401F7FD14514
        01E01FB4D7FCCADFF6F7FF00B46BE7FAFA03F69AFF00995BFEDEFF00F68D7CFF
        004005145140057D01FB32FF00CCD3FF006E9FFB5ABE7FAFA03F665FF99A7FED
        D3FF006B5007BFD1451400514514005145140057C015F7FD7C01400514514005
        1451401F7FD1451401E01FB4D7FCCADFF6F7FF00B46BE7FAFA03F69AFF00995B
        FEDEFF00F68D7CFF0040057DFF005F0057DFF400514514005145140051451400
        51451400514514005145140051451401F0051451401F407ECCBFF334FF00DBA7
        FED6AF7FAF00FD997FE669FF00B74FFDAD5EFF00400514514005145140051451
        4005145140051451400514514005145140051451401F0051451401F407ECCBFF
        00334FFDBA7FED6AF7FAF00FD997FE669FFB74FF00DAD5EFF400514514005145
        14005145140051451401E01FB4D7FCCADFF6F7FF00B46BE7FAFA03F69AFF0099
        5BFEDEFF00F68D7CFF0040051451400514514005145140051451400514514005
        1451400514514005145140051451401F407ECCBFF334FF00DBA7FED6AF7FAF00
        FD997FE669FF00B74FFDAD5EFF0040057C015F7FD7C0140057D01FB32FFCCD3F
        F6E9FF00B5ABE7FAFA03F665FF0099A7FEDD3FF6B5007BFD1451401F00514514
        01F407ECCBFF00334FFDBA7FED6AF7FAF00FD997FE669FFB74FF00DAD5EFF400
        5145140051451400514514005145140051451400514514005145140051451400
        514514005145140051451400514514005145140057807ED35FF32B7FDBDFFED1
        AF7FAF00FDA6BFE656FF00B7BFFDA3401F3FD145140051451400514514005145
        1400514514005145140051451400514514005145140057D01FB32FFCCD3FF6E9
        FF00B5ABE7FAFA03F665FF0099A7FEDD3FF6B5007BFD1451401F0051451401F4
        07ECCBFF00334FFDBA7FED6AF7FAF00FD997FE669FFB74FF00DAD5EFF40057C0
        15F7FD7C0140057D01FB32FF00CCD3FF006E9FFB5ABE7FAFA03F665FF99A7FED
        D3FF006B5007BFD1451400514514005145140051451400514514005145140051
        4514005145140057C015F7FD7C0140057D01FB32FF00CCD3FF006E9FFB5ABE7F
        AFA03F665FF99A7FEDD3FF006B5007BFD1451401F00514514005145140051451
        4005145140051451401F7FD1451401E01FB4D7FCCADFF6F7FF00B46BE7FAFA03
        F69AFF00995BFEDEFF00F68D7CFF004005145140057D01FB32FF00CCD3FF006E
        9FFB5ABE7FAFA03F665FF99A7FEDD3FF006B5007BFD1451401F0051451401F40
        7ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFDAD5EFF00400514
        5140057807ED35FF0032B7FDBDFF00ED1AF7FAF00FDA6BFE656FFB7BFF00DA34
        01F3FD1451400514514005145140057DFF005F0057DFF40057807ED35FF32B7F
        DBDFFED1AF7FAF00FDA6BFE656FF00B7BFFDA3401F3FD1451400514514005145
        14005145140057D01FB32FFCCD3FF6E9FF00B5ABE7FAFA03F665FF0099A7FEDD
        3FF6B5007BFD145140051451401E01FB4D7FCCADFF006F7FFB46BE7FAFA03F69
        AFF995BFEDEFFF0068D7CFF4005145140057D01FB32FFCCD3FF6E9FF00B5ABE7
        FAFA03F665FF0099A7FEDD3FF6B5007BFD1451401F0051451400514514005145
        140057D01FB32FFCCD3FF6E9FF00B5ABE7FAFA03F665FF0099A7FEDD3FF6B500
        7BFD1451401F0051451401F407ECCBFF00334FFDBA7FED6AF7FAF00FD997FE66
        9FFB74FF00DAD5EFF40051451400514514005145140051451400514514005145
        140051451400514514005145140051451400514514005145140057807FC34D7F
        D4A3FF00952FFED55EFF005F005007D01FF0D35FF528FF00E54BFF00B551FF00
        2719FF0052F7F617FDBDF9FE7FFDFBDBB7C9F7CEEED8E7E7FAFA03F665FF0099
        A7FEDD3FF6B5001FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE537FFB
        6D7BFD1401F00514514005145140057D01FF000CCBFF005377FE537FFB6D7CFF
        005F7FD007807FC332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5
        EFF45007807FC332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EF
        F45007807FC332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF4
        5007C81F137E197FC2B9FECBFF0089BFF687DBFCDFF976F2B66CD9FEDB673BFD
        BA579FD7D01FB4D7FCCADFF6F7FF00B46BE7FA002BE80FF8665FFA9BBFF29BFF
        00DB6BE7FAFBFE803C03FE1997FEA6EFFCA6FF00F6DAEFFE197C32FF008573FD
        A9FF00137FED0FB7F95FF2EDE56CD9BFFDB6CE77FB74AF40A2800A28A2803C03
        FE1997FEA6EFFCA6FF00F6DA3FE1997FEA6EFF00CA6FFF006DAF7FA2803C03FE
        4DCFFEA61FEDDFFB74F23C8FFBF9BB779DED8DBDF3C1FF000D35FF00528FFE54
        BFFB551FB4D7FCCADFF6F7FF00B46BE7FA00FA03FE1A6BFEA51FFCA97FF6AA3F
        E1997FEA6EFF00CA6FFF006DAF9FEBEFFA00F00FF8665FFA9BBFF29BFF00DB68
        FF009373FF00A987FB77FEDD3C8F23FEFE6EDDE77B636F7CF1EFF5E01FB4D7FC
        CADFF6F7FF00B46800FF00869AFF00A947FF002A5FFDAA8FF869AFFA947FF2A5
        FF00DAABE7FA2803EFFA28A2800A28A2800AF00FF869AFFA947FF2A5FF00DAAB
        DFEBE00A00FA03FE1A6BFEA51FFCA97FF6AA3FE1A6BFEA51FF00CA97FF006AAF
        9FE8A00FA03FE1A6BFEA51FF00CA97FF006AA3FE1A6BFEA51FFCA97FF6AAF9FE
        8A00FA03FE1A6BFEA51FFCA97FF6AA3FE1A6BFEA51FF00CA97FF006AAF9FE8A0
        0FAFFE197C4DFF00858DFDA9FF00128FECFF00B0795FF2F3E6EFDFBFFD85C636
        7BF5AF40AF00FD997FE669FF00B74FFDAD5EFF0040057C015F7FD7C0140057D0
        1FB32FFCCD3FF6E9FF00B5ABE7FAFA03F665FF0099A7FEDD3FF6B5007BFD1451
        401F0051451400514514005145140057A07C32F865FF000B1BFB53FE26FF00D9
        FF0060F2BFE5DBCDDFBF7FFB6B8C6CF7EB5E7F5F407ECCBFF334FF00DBA7FED6
        A003FE1997FEA6EFFCA6FF00F6DA3FE1997FEA6EFF00CA6FFF006DAF7FA2800A
        28A2803CFF00E26FC32FF858DFD97FF137FECFFB079BFF002EDE6EFDFB3FDB5C
        6367BF5AE03FE1997FEA6EFF00CA6FFF006DAF7FA2803C03FE1997FEA6EFFCA6
        FF00F6DA3FE1997FEA6EFF00CA6FFF006DAF7FA2803C03FE1997FEA6EFFCA6FF
        00F6DA3FE4DCFF00EA61FEDDFF00B74F23C8FF00BF9BB779DED8DBDF3C7BFD78
        07ED35FF0032B7FDBDFF00ED1A003FE1A6BFEA51FF00CA97FF006AA3FE1A6BFE
        A51FFCA97FF6AAF9FE8A00FA03FE1997FEA6EFFCA6FF00F6DA3FE1997FEA6EFF
        00CA6FFF006DAF7FA2803CFF00E197C32FF8573FDA9FF137FED0FB7F95FF002E
        DE56CD9BFF00DB6CE77FB74AF40A28A002BC03FE1A6BFEA51FFCA97FF6AAF7FA
        F802803E80FF00869AFF00A947FF002A5FFDAABCFF00E26FC4DFF858DFD97FF1
        28FECFFB079BFF002F3E6EFDFB3FD85C6367BF5AF3FA2800A28A2803E80FF866
        5FFA9BBFF29BFF00DB68FF008665FF00A9BBFF0029BFFDB6BDFE8A00F903E26F
        C32FF8573FD97FF137FED0FB7F9BFF002EDE56CD9B3FDB6CE77FB74AF3FAFA03
        F69AFF00995BFEDEFF00F68D7CFF0040057DFF005F0057DFF400579FFC4DF865
        FF000B1BFB2FFE26FF00D9FF0060F37FE5DBCDDFBF67FB6B8C6CF7EB5E814500
        7807FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094DFFEDB5EFF004500
        7C0145145007A07C32F865FF000B1BFB53FE26FF00D9FF0060F2BFE5DBCDDFBF
        7FFB6B8C6CF7EB5E81FF000CCBFF005377FE537FFB6D1FB32FFCCD3FF6E9FF00
        B5ABDFE803C03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DA
        F7FA2803C03FE1997FEA6EFF00CA6FFF006DA3FE4DCFFEA61FEDDFFB74F23C8F
        FBF9BB779DED8DBDF3C7BFD7807ED35FF32B7FDBDFFED1A003FE1A6BFEA51FFC
        A97FF6AA3FE1A6BFEA51FF00CA97FF006AAF9FE8A00FBFE8A28A00F3FF0089BF
        0CBFE1637F65FF00C4DFFB3FEC1E6FFCBB79BBF7ECFF006D718D9EFD6B80FF00
        8665FF00A9BBFF0029BFFDB6BDFE8A00F00FF8665FFA9BBFF29BFF00DB6BE7FA
        FBFEBE00A002BD03E197C4DFF8573FDA9FF128FED0FB7F95FF002F3E56CD9BFF
        00D86CE77FB74AF3FA2803E80FF869AFFA947FF2A5FF00DAA8FF00869AFF00A9
        47FF002A5FFDAABE7FA2803E80FF008665FF00A9BBFF0029BFFDB68FF8665FFA
        9BBFF29BFF00DB6BDFE8A00F903E26FC32FF008573FD97FF00137FED0FB7F9BF
        F2EDE56CD9B3FDB6CE77FB74AF3FAFA03F69AFF995BFEDEFFF0068D7CFF40057
        D01FF0CCBFF5377FE537FF00B6D7CFF5F7FD007807FC332FFD4DDFF94DFF00ED
        B47FC9B9FF00D4C3FDBBFF006E9E4791FF007F376EF3BDB1B7BE78F7FAF00FDA
        6BFE656FFB7BFF00DA34007FC34D7FD4A3FF00952FFED547FC34D7FD4A3FF952
        FF00ED55F3FD1401F407FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094
        DFFEDB5EFF00450079FF00C32F865FF0AE7FB53FE26FFDA1F6FF002BFE5DBCAD
        9B37FF00B6D9CEFF006E95E81451400514514005145140051451400514514005
        14514005145140051451400514514005145140051451400515F0051401F7FD15
        E01FB32FFCCD3FF6E9FF00B5ABDFE800AF802BEFFA2803E00AFA03F665FF0099
        A7FEDD3FF6B57BFD140051451401F00514514005145140057DFF005F0051401F
        7FD15F0051401F7FD15F0051401F7FD15F0051401F407ED35FF32B7FDBDFFED1
        AF9FEBE80FD997FE669FFB74FF00DAD5EFF401F0057DFF004514005145140051
        45140051451401E01FB4D7FCCADFF6F7FF00B46BE7FAFA03F69AFF00995BFEDE
        FF00F68D7CFF0040057DFF005F0051401F7FD7807ED35FF32B7FDBDFFED1AF9F
        E8A0028A28A00FBFE8AF8028A00FBFE8AF00FD997FE669FF00B74FFDAD5EFF00
        40057C015F7FD7C0140051457D01FB32FF00CCD3FF006E9FFB5A803E7FA2BEFF
        00A2803E00A28A2803E80FD997FE669FFB74FF00DAD5EFF5F0051401F7FD7C01
        457DFF00401F0057D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F69AFF995BFEDEF
        FF0068D007BFD15F005140051451400514514005145140057D01FB32FF00CCD3
        FF006E9FFB5ABE7FA2803EFF00A2BE00A2803EFF00A2BE00A2803EFF00A2BE00
        A2803EFF00A2BE00AFBFE800AF00FDA6BFE656FF00B7BFFDA35EFF0045007C01
        457DFF004500145145001457807ED35FF32B7FDBDFFED1AF9FE803EFFAF8028A
        FBFE803E00A2BEFF00A2803E00A2BEFF00A2800A2BE00A2803E80FDA6BFE656F
        FB7BFF00DA35F3FD7D01FB32FF00CCD3FF006E9FFB5ABDFE803E00AFBFE8AF80
        2803EFFA2BE00A2803EFFA2BE00A2800A28A2803E80FD997FE669FFB74FF00DA
        D5EFF5F0051401F7FD15F0057DFF0040057807ED35FF0032B7FDBDFF00ED1AF7
        FAF00FDA6BFE656FFB7BFF00DA3401F3FD1451401F7FD14514005145140057C0
        15F7FD1401F00515F7FD7807ED35FF0032B7FDBDFF00ED1A00F9FE8A28A00FBF
        E8AF8028A00FA03F69AFF995BFEDEFFF0068D7CFF45140057DFF005F0051401F
        7FD7807ED35FF32B7FDBDFFED1AF9FE8A0028A28A00FBFE8AF8028A00FBFE8AF
        00FD997FE669FF00B74FFDAD5EFF004005145140051451400514514005145140
        0514514005145140051451400514514005145140051451401F0051451401F407
        ECCBFF00334FFDBA7FED6AF7FAF00FD997FE669FFB74FF00DAD5EFF400514578
        07FC34D7FD4A3FF952FF00ED5401EFF457807FC34D7FD4A3FF00952FFED55DFF
        00C32F89BFF0B1BFB53FE251FD9FF60F2BFE5E7CDDFBF7FF00B0B8C6CF7EB401
        E8145145007C01457D01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE537
        FF00B6D007CFF457D01FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE53
        7FFB6D007CFF00457D01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE537
        FF00B6D007CFF457D01FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE53
        7FFB6D007CFF00457D01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE537
        FF00B6D007CFF45145007D01FB32FF00CCD3FF006E9FFB5ABDFEBE40F865F137
        FE15CFF6A7FC4A3FB43EDFE57FCBCF95B366FF00F61B39DFEDD2BD03FE1A6BFE
        A51FFCA97FF6AA00F7FA2BC03FE1A6BFEA51FF00CA97FF006AAF7FA0028A28A0
        028A28A0028A28A00F00FDA6BFE656FF00B7BFFDA35F3FD7D7FF00137E197FC2
        C6FECBFF0089BFF67FD83CDFF976F377EFD9FEDAE31B3DFAD701FF000CCBFF00
        5377FE537FFB6D007CFF00457D01FF000CCBFF005377FE537FFB6D7CFF004005
        145140051451400515F407FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF00
        94DFFEDB4007ECCBFF00334FFDBA7FED6AF7FAF3FF00865F0CBFE15CFF006A7F
        C4DFFB43EDFE57FCBB795B366FFF006DB39DFEDD2BD02800AF802BEFFAF00FF8
        665FFA9BBFF29BFF00DB6803E7FAFA03F665FF0099A7FEDD3FF6B51FF0CCBFF5
        377FE537FF00B6D77FF0CBE197FC2B9FED4FF89BFF00687DBFCAFF00976F2B66
        CDFF00EDB673BFDBA5007A051451401F00515F407FC332FF00D4DDFF0094DFFE
        DB47FC332FFD4DDFF94DFF00EDB401F3FD15E81F137E197FC2B9FECBFF0089BF
        F687DBFCDFF976F2B66CD9FEDB673BFDBA579FD0015F7FD7C015F7FD0015E01F
        B4D7FCCADFF6F7FF00B46BDFEBCFFE26FC32FF00858DFD97FF00137FECFF00B0
        79BFF2EDE6EFDFB3FDB5C6367BF5A00F9028AFA03FE1997FEA6EFF00CA6FFF00
        6DA3FE1997FEA6EFFCA6FF00F6DA00F9FE8AFA03FE1997FEA6EFFCA6FF00F6DA
        3FE1997FEA6EFF00CA6FFF006DA00F9FE8AF40F89BF0CBFE15CFF65FFC4DFF00
        B43EDFE6FF00CBB795B366CFF6DB39DFEDD2BCFE800A28A2800A28A2800A28A2
        800A28A2800A2BD03E197C32FF00858DFDA9FF00137FECFF00B0795FF2EDE6EF
        DFBFFDB5C6367BF5AF40FF008665FF00A9BBFF0029BFFDB6803E7FAFBFEBC03F
        E1997FEA6EFF00CA6FFF006DAF7FA0028A2BCFFE26FC4DFF008573FD97FF0012
        8FED0FB7F9BFF2F3E56CD9B3FD86CE77FB74A00F40A2BC03FE1A6BFEA51FFCA9
        7FF6AA3FE1A6BFEA51FF00CA97FF006AA00F7FA28A2803C03F69AFF995BFEDEF
        FF0068D7CFF5F5FF00C4DF865FF0B1BFB2FF00E26FFD9FF60F37FE5DBCDDFBF6
        7FB6B8C6CF7EB5C07FC332FF00D4DDFF0094DFFEDB401F3FD7DFF5E01FF0CCBF
        F5377FE537FF00B6D7BFD0014515E7FF00137E26FF00C2B9FECBFF008947F687
        DBFCDFF979F2B66CD9FEC3673BFDBA5007A0515E01FF000D35FF00528FFE54BF
        FB551FF0D35FF528FF00E54BFF00B55007CFF45145007D01FB32FF00CCD3FF00
        6E9FFB5ABDFEBE40F865F137FE15CFF6A7FC4A3FB43EDFE57FCBCF95B366FF00
        F61B39DFEDD2BD03FE1A6BFEA51FFCA97FF6AA00F7FAF802BE80FF00869AFF00
        A947FF002A5FFDAA8FF8665FFA9BBFF29BFF00DB6803E7FA2BE80FF8665FFA9B
        BFF29BFF00DB6BCFFE26FC32FF008573FD97FF00137FED0FB7F9BFF2EDE56CD9
        B3FDB6CE77FB74A00F3FA28A2800A2BE80FF008665FF00A9BBFF0029BFFDB68F
        F8665FFA9BBFF29BFF00DB6803E7FA2BE80FF8665FFA9BBFF29BFF00DB68FF00
        8665FF00A9BBFF0029BFFDB6803E7FAFBFEBC03FE1997FEA6EFF00CA6FFF006D
        AF7FA002BC03F69AFF00995BFEDEFF00F68D7BFD7807ED35FF0032B7FDBDFF00
        ED1A00F9FE8A28A00FBFE8A28A0028A28A0028A28A002BC03F69AFF995BFEDEF
        FF0068D7BFD79FFC4DF865FF000B1BFB2FFE26FF00D9FF0060F37FE5DBCDDFBF
        67FB6B8C6CF7EB401F20515F407FC332FF00D4DDFF0094DFFEDB47FC332FFD4D
        DFF94DFF00EDB401F3FD14514005145140051457D01FF0CCBFF5377FE537FF00
        B6D007CFF457D01FF0CCBFF5377FE537FF00B6D79FFC4DF865FF000AE7FB2FFE
        26FF00DA1F6FF37FE5DBCAD9B367FB6D9CEFF6E9401E7F4514500145145007D0
        1FB32FFCCD3FF6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD0014514
        5001451450014514500145145001451450014514500145145001451450014514
        500145145007C0145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF
        0099A7FEDD3FF6B57BFD0015F0057DFF005F0050015F407ECCBFF334FF00DBA7
        FED6AF9FEBE80FD997FE669FFB74FF00DAD401EFF45145001451450014514500
        1451450014514500145145007C0145145001451450015F7FD7C015F7FD001451
        450014514500145145001451450015F0057DFF005F0050014514500145145007
        DFF451450014514500145145001451450014514500145145007807ED35FF0032
        B7FDBDFF00ED1AF9FEBE80FDA6BFE656FF00B7BFFDA35F3FD0015F7FD7C015F7
        FD001451450014514500145145007807ED35FF0032B7FDBDFF00ED1AF9FEBE80
        FDA6BFE656FF00B7BFFDA35F3FD00145145001451450014514500145145007D0
        1FB32FFCCD3FF6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD0014514
        50015E01FB4D7FCCADFF006F7FFB46BDFEBC03F69AFF00995BFEDEFF00F68D00
        7CFF0045145007DFF4514500145145001451450015E01FB4D7FCCADFF6F7FF00
        B46BDFEBC03F69AFF995BFEDEFFF0068D007CFF4514500145145001451450015
        F7FD7C015F7FD0015E01FB4D7FCCADFF006F7FFB46BDFEBC03F69AFF00995BFE
        DEFF00F68D007CFF0045145007DFF4514500145145001451450015E01FB4D7FC
        CADFF6F7FF00B46BDFEBC03F69AFF995BFEDEFFF0068D007CFF45145007DFF00
        4514500145145001451450014514500145145007C0145145001451450015F7FD
        7C015F7FD0015E01FB4D7FCCADFF006F7FFB46BDFEBC03F69AFF00995BFEDEFF
        00F68D007CFF004514500145145007D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F
        665FF99A7FEDD3FF006B57BFD001451450014514500145145001451450014514
        5001451450014514500145145001451450014514500145145001451450014514
        50015E01FB4D7FCCADFF006F7FFB46BDFEBC03F69AFF00995BFEDEFF00F68D00
        7CFF00451450014514500145145001451450014514500145145007DFF4514500
        1451450015F0057DFF005F0050015F407ECCBFF334FF00DBA7FED6AF9FEBE80F
        D997FE669FFB74FF00DAD401EFF4514500145145001451450015F0057DFF005F
        0050015F407ECCBFF334FF00DBA7FED6AF9FEBE80FD997FE669FFB74FF00DAD4
        01EFF451450014514500145145001451450014514500145145007C0145145007
        D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD0015F
        0057DFF5F0050015F407ECCBFF00334FFDBA7FED6AF9FEBE80FD997FE669FF00
        B74FFDAD401EFF0045145007C0145145007D01FB32FF00CCD3FF006E9FFB5ABD
        FEBC03F665FF0099A7FEDD3FF6B57BFD001451450015E01FB4D7FCCADFF6F7FF
        00B46BDFEBC03F69AFF995BFEDEFFF0068D007CFF45145001451450014514500
        1451450015F407ECCBFF00334FFDBA7FED6AF9FEBE80FD997FE669FF00B74FFD
        AD401EFF0045145007C0145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03
        F665FF0099A7FEDD3FF6B57BFD001451450015E01FB4D7FCCADFF6F7FF00B46B
        DFEBC03F69AFF995BFEDEFFF0068D007CFF4514500145145007D01FB32FF00CC
        D3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD3FF6B57BFD001451450015E01F
        B4D7FCCADFF6F7FF00B46BDFEBC03F69AFF995BFEDEFFF0068D007CFF4514500
        7DFF0045145007807ED35FF32B7FDBDFFED1AF9FEBE80FDA6BFE656FFB7BFF00
        DA35F3FD001451450015F407ECCBFF00334FFDBA7FED6AF9FEBE80FD997FE669
        FF00B74FFDAD401EFF0045145001451450014514500145145001451450014514
        5007C0145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FE
        DD3FF6B57BFD001451450015E01FB4D7FCCADFF6F7FF00B46BDFEBC03F69AFF9
        95BFEDEFFF0068D007CFF4514500145145007D01FB32FF00CCD3FF006E9FFB5A
        BDFEBC03F665FF0099A7FEDD3FF6B57BFD001451450014514500145145001451
        45001451450014514500145145001451450014514500145145007807FC34D7FD
        4A3FF952FF00ED547FC34D7FD4A3FF00952FFED55F3FD1401F407FC34D7FD4A3
        FF00952FFED547FC34D7FD4A3FF952FF00ED55F3FD1401F407FC34D7FD4A3FF9
        52FF00ED55EFF5F0057DFF00400579FF00C4DF865FF0B1BFB2FF00E26FFD9FF6
        0F37FE5DBCDDFBF67FB6B8C6CF7EB5E8145007807FC332FF00D4DDFF0094DFFE
        DB47FC332FFD4DDFF94DFF00EDB5EFF45007C0145145001451450015F407FC33
        2FFD4DDFF94DFF00EDB5F3FD7DFF00401E01FF000CCBFF005377FE537FFB6D79
        FF00C4DF865FF0AE7FB2FF00E26FFDA1F6FF0037FE5DBCAD9B367FB6D9CEFF00
        6E95F5FD7807ED35FF0032B7FDBDFF00ED1A00F9FE8A28A00FA03FE1A6BFEA51
        FF00CA97FF006AA3FE1A6BFEA51FFCA97FF6AAF9FE8A00FAFF00E197C4DFF858
        DFDA9FF128FECFFB0795FF002F3E6EFDFBFF00D85C6367BF5AF40AF00FD997FE
        669FFB74FF00DAD5EFF40057807FC332FF00D4DDFF0094DFFEDB5EFF00450078
        07FC332FFD4DDFF94DFF00EDB5DFFC32F865FF000AE7FB53FE26FF00DA1F6FF2
        BFE5DBCAD9B37FFB6D9CEFF6E95E81450014514500145145001451450015F005
        7DFF005F0050015E81F0CBE26FFC2B9FED4FF8947F687DBFCAFF00979F2B66CD
        FF00EC3673BFDBA579FD1401F407FC34D7FD4A3FF952FF00ED547FC34D7FD4A3
        FF00952FFED55F3FD1401F7FD1451401E7FF00137E26FF00C2B9FECBFF008947
        F687DBFCDFF979F2B66CD9FEC3673BFDBA5701FF000D35FF00528FFE54BFFB55
        1FB4D7FCCADFF6F7FF00B46BE7FA00FA03FE1A6BFEA51FFCA97FF6AA3FE1A6BF
        EA51FF00CA97FF006AAF9FE8A00FA03FE1A6BFEA51FF00CA97FF006AAEFF00E1
        97C4DFF858DFDA9FF128FECFFB0795FF002F3E6EFDFBFF00D85C6367BF5AF902
        BE80FD997FE669FF00B74FFDAD401EFF0045145007807FC332FF00D4DDFF0094
        DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF450079FFC32F865FF000AE7FB53FE
        26FF00DA1F6FF2BFE5DBCAD9B37FFB6D9CEFF6E95E8145140057C015F7FD7C01
        40057D01FB32FF00CCD3FF006E9FFB5ABE7FAFA03F665FF99A7FEDD3FF006B50
        07BFD1451401E01FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE537FFB
        6D7BFD1401E01FF26E7FF530FF006EFF00DBA791E47FDFCDDBBCEF6C6DEF9E0F
        F869AFFA947FF2A5FF00DAA8FDA6BFE656FF00B7BFFDA35F3FD007D01FF0D35F
        F528FF00E54BFF00B551FF000D35FF00528FFE54BFFB557CFF0045007D01FF00
        0D35FF00528FFE54BFFB5579FF00C4DF89BFF0B1BFB2FF00E251FD9FF60F37FE
        5E7CDDFBF67FB0B8C6CF7EB5E7F4500145145007D01FF0CCBFF5377FE537FF00
        B6D1FF000CCBFF005377FE537FFB6D7BFD1401F207C4DF865FF0AE7FB2FF00E2
        6FFDA1F6FF0037FE5DBCAD9B367FB6D9CEFF006E95E7F5F407ED35FF0032B7FD
        BDFF00ED1AF9FE800AFA03FE1997FEA6EFFCA6FF00F6DAF9FEBEFF00A00F00FF
        008665FF00A9BBFF0029BFFDB68FF9373FFA987FB77FEDD3C8F23FEFE6EDDE77
        B636F7CF1EFF005E01FB4D7FCCADFF006F7FFB46800FF869AFFA947FF2A5FF00
        DAA8FF00869AFF00A947FF002A5FFDAABE7FA2803E80FF008665FF00A9BBFF00
        29BFFDB68FF8665FFA9BBFF29BFF00DB6BDFE8A00F3FF865F0CBFE15CFF6A7FC
        4DFF00B43EDFE57FCBB795B366FF00F6DB39DFEDD2BD028A2800A28A2800AF3F
        F89BF0CBFE1637F65FFC4DFF00B3FEC1E6FF00CBB79BBF7ECFF6D718D9EFD6BD
        028A00F00FF8665FFA9BBFF29BFF00DB68FF008665FF00A9BBFF0029BFFDB6BD
        FE8A00F8028A28A00FA03F665FF99A7FEDD3FF006B57BFD7807ECCBFF334FF00
        DBA7FED6AF7FA002BC03FE1A6BFEA51FFCA97FF6AAF7FAF802803E80FF00869A
        FF00A947FF002A5FFDAABCFF00E26FC4DFF858DFD97FF128FECFFB079BFF002F
        3E6EFDFB3FD85C6367BF5AF3FA2800A28A2803E80FF869AFFA947FF2A5FF00DA
        A8FF00869AFF00A947FF002A5FFDAABE7FA2803D03E26FC4DFF858DFD97FF128
        FECFFB079BFF002F3E6EFDFB3FD85C6367BF5AF3FA28A002BE80FF008665FF00
        A9BBFF0029BFFDB6BE7FAFBFE803C03FE1997FEA6EFF00CA6FFF006DA3FE4DCF
        FEA61FEDDFFB74F23C8FFBF9BB779DED8DBDF3C7BFD7807ED35FF32B7FDBDFFE
        D1A003FE1A6BFEA51FFCA97FF6AA3FE1A6BFEA51FF00CA97FF006AAF9FE8A00F
        A03FE1A6BFEA51FF00CA97FF006AA3FE1A6BFEA51FFCA97FF6AAF9FE8A00FAFF
        00E197C4DFF858DFDA9FF128FECFFB0795FF002F3E6EFDFBFF00D85C6367BF5A
        F40AF00FD997FE669FFB74FF00DAD5EFF40051451400579FFC4DF89BFF000AE7
        FB2FFE251FDA1F6FF37FE5E7CAD9B367FB0D9CEFF6E95E815E01FB4D7FCCADFF
        006F7FFB46800FF869AFFA947FF2A5FF00DAA8FF00869AFF00A947FF002A5FFD
        AABE7FA2803E80FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29BFF00
        DB6BDFE8A00F00FF009373FF00A987FB77FEDD3C8F23FEFE6EDDE77B636F7CF0
        7FC34D7FD4A3FF00952FFED547ED35FF0032B7FDBDFF00ED1AF9FE803E80FF00
        869AFF00A947FF002A5FFDAA8FF869AFFA947FF2A5FF00DAABE7FA2803E80FF8
        69AFFA947FF2A5FF00DAABCFFE26FC4DFF00858DFD97FF00128FECFF00B079BF
        F2F3E6EFDFB3FD85C6367BF5AF3FA2800A28A2800A28A2803E80FD997FE669FF
        00B74FFDAD5EFF005E01FB32FF00CCD3FF006E9FFB5ABDFE800A28A2800A28A2
        800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
        803E00A28A2800A2BE80FD997FE669FF00B74FFDAD5EFF00401F0057DFF45140
        051457807ED35FF32B7FDBDFFED1A00F7FA2BE00A2800A2BEFFA2803E00A2BEF
        FA2803E00AFBFE8AF802803EFF00AF00FDA6BFE656FF00B7BFFDA35F3FD7D01F
        B32FFCCD3FF6E9FF00B5A803E7FA2BEFFA2803E00A28A2803E80FD997FE669FF
        00B74FFDAD5EFF005F0051401F7FD15F0051401F7FD15F0051401F7FD15F0051
        401F7FD1451400515E01FB4D7FCCADFF006F7FFB46BE7FA00FBFEBE00A28A002
        8A2BE80FD997FE669FFB74FF00DAD401F3FD15F7FD1400515F0051401F407ED3
        5FF32B7FDBDFFED1AF9FE8A2800A28AFBFE803E00AFA03F665FF0099A7FEDD3F
        F6B57BFD7807ED35FF0032B7FDBDFF00ED1A00F7FA2BE00A2803EFFA28A2800A
        2BC03F69AFF995BFEDEFFF0068D7CFF401F7FD7C0145140057D01FB32FFCCD3F
        F6E9FF00B5ABE7FAFA03F665FF0099A7FEDD3FF6B5007BFD145140051451401E
        01FB4D7FCCADFF006F7FFB46BE7FAFBFE8A00F8028AFBFEBE00A0028A28A0028
        A28A00FBFE8AF8028A00FA03F69AFF00995BFEDEFF00F68D7CFF005F407ECCBF
        F334FF00DBA7FED6AF7FA00F802BEFFA28A002BC03F69AFF00995BFEDEFF00F6
        8D7BFD7807ED35FF0032B7FDBDFF00ED1A00F9FE8A28A00FBFE8AF8028A00FBF
        E8AF00FD997FE669FF00B74FFDAD5EFF004005145140051457807ED35FF32B7F
        DBDFFED1A00F7FA2BE00A2800A2BEFFA2803C03F665FF99A7FEDD3FF006B57BF
        D1450015F0057DFF0045007C01457DFF005E01FB4D7FCCADFF006F7FFB46803E
        7FA28A2800A28A2800A2BE80FD997FE669FF00B74FFDAD5EFF00401F0057DFF4
        57C01401F7FD7807ED35FF0032B7FDBDFF00ED1AF9FEBE80FD997FE669FF00B7
        4FFDAD401F3FD15F7FD1401F00515F7FD1401E01FB32FF00CCD3FF006E9FFB5A
        BDFEBC03F69AFF00995BFEDEFF00F68D7CFF00401F7FD15F0057DFF40057807E
        D35FF32B7FDBDFFED1AF7FA2803E00A2BEFF00A2800A28A2803C03F69AFF0099
        5BFEDEFF00F68D7CFF005F7FD1401F00515F7FD7C01400514514005145140051
        451401F407ECCBFF00334FFDBA7FED6AF7FAF00FD997FE669FFB74FF00DAD5EF
        F400514514005145140051451400514514005145140051451400514514005145
        14005145140051451401F00515F407FC332FFD4DDFF94DFF00EDB47FC332FF00
        D4DDFF0094DFFEDB4007ECCBFF00334FFDBA7FED6AF7FAF3FF00865F0CBFE15C
        FF006A7FC4DFFB43EDFE57FCBB795B366FFF006DB39DFEDD2BD02800A28AF00F
        F869AFFA947FF2A5FF00DAA803DFEBC03F69AFF995BFEDEFFF0068D1FF000D35
        FF00528FFE54BFFB5579FF00C4DF89BFF0B1BFB2FF00E251FD9FF60F37FE5E7C
        DDFBF67FB0B8C6CF7EB401E7F45145007DFF00457807FC34D7FD4A3FF952FF00
        ED547FC34D7FD4A3FF00952FFED5401EFF00457807FC34D7FD4A3FF952FF00ED
        547FC34D7FD4A3FF00952FFED5401EFF005F0057D01FF0D35FF528FF00E54BFF
        00B551FF000CCBFF005377FE537FFB6D007CFF005F407ECCBFF334FF00DBA7FE
        D6A3FE1997FEA6EFFCA6FF00F6DAEFFE197C32FF008573FDA9FF00137FED0FB7
        F95FF2EDE56CD9BFFDB6CE77FB74A00F40A28A2803E00A2BE80FF8665FFA9BBF
        F29BFF00DB68FF008665FF00A9BBFF0029BFFDB6803E7FA2BD03E26FC32FF857
        3FD97FF137FED0FB7F9BFF002EDE56CD9B3FDB6CE77FB74AF3FA0028A2BE80FF
        008665FF00A9BBFF0029BFFDB6803E7FA2BE80FF008665FF00A9BBFF0029BFFD
        B6BCFF00E26FC32FF8573FD97FF137FED0FB7F9BFF002EDE56CD9B3FDB6CE77F
        B74A00F3FA28A2803EFF00A28A2803C03F69AFF995BFEDEFFF0068D7CFF5F407
        ED35FF0032B7FDBDFF00ED1AF9FE800A28AFA03FE1997FEA6EFF00CA6FFF006D
        A00F9FEBE80FD997FE669FFB74FF00DAD47FC332FF00D4DDFF0094DFFEDB5DFF
        00C32F865FF0AE7FB53FE26FFDA1F6FF002BFE5DBCAD9B37FF00B6D9CEFF006E
        9401E8145145007C0145145001451450015F7FD7C015F7FD0015E01FB4D7FCCA
        DFF6F7FF00B46BDFEBC03F69AFF995BFEDEFFF0068D007CFF45145007DFF0045
        145007807ED35FF32B7FDBDFFED1AF9FEBE80FDA6BFE656FFB7BFF00DA35F3FD
        0014515F407FC332FF00D4DDFF0094DFFEDB401F3FD7D01FB32FFCCD3FF6E9FF
        00B5A8FF008665FF00A9BBFF0029BFFDB68FF9373FFA987FB77FEDD3C8F23FEF
        E6EDDE77B636F7CF001EFF00457807FC34D7FD4A3FF952FF00ED547FC34D7FD4
        A3FF00952FFED5401EFF00451450014579FF00C4DF89BFF0AE7FB2FF00E251FD
        A1F6FF0037FE5E7CAD9B367FB0D9CEFF006E95C07FC34D7FD4A3FF00952FFED5
        401EFF005F0057D01FF0D35FF528FF00E54BFF00B557CFF40051457A07C32F86
        5FF0B1BFB53FE26FFD9FF60F2BFE5DBCDDFBF7FF00B6B8C6CF7EB401E7F457D0
        1FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE537FFB6D007CFF00457D
        01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE537FF00B6D001FB32FF00
        CCD3FF006E9FFB5ABDFEBCFF00E197C32FF8573FDA9FF137FED0FB7F95FF002E
        DE56CD9BFF00DB6CE77FB74AF40A0028A2BC03FE1A6BFEA51FFCA97FF6AA00F7
        FAF00FDA6BFE656FFB7BFF00DA347FC34D7FD4A3FF00952FFED547FC9C67FD4B
        DFD85FF6F7E7F9FF00F7EF6EDF27DF3BBB63900F9FE8AFA03FE1997FEA6EFF00
        CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DA00F9FE8A28A00FA03F665FF99A7F
        EDD3FF006B57BFD7807ECCBFF334FF00DBA7FED6AF7FA0028A2BC03FE1A6BFEA
        51FF00CA97FF006AA00F7FAF00FDA6BFE656FF00B7BFFDA347FC34D7FD4A3FF9
        52FF00ED55E7FF00137E26FF00C2C6FECBFF008947F67FD83CDFF979F377EFD9
        FEC2E31B3DFAD0079FD1451401F7FD15E01FF0D35FF528FF00E54BFF00B551FF
        000D35FF00528FFE54BFFB55007BFD15E7FF000CBE26FF00C2C6FED4FF008947
        F67FD83CAFF979F377EFDFFEC2E31B3DFAD7A050014515E01FF0D35FF528FF00
        E54BFF00B55007BFD7807ED35FF32B7FDBDFFED1A3FE1A6BFEA51FFCA97FF6AA
        F3FF0089BF137FE1637F65FF00C4A3FB3FEC1E6FFCBCF9BBF7ECFF0061718D9E
        FD6803CFE8A28A0028AFA03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFC
        A6FF00F6DA003F665FF99A7FEDD3FF006B57BFD79FFC32F865FF000AE7FB53FE
        26FF00DA1F6FF2BFE5DBCAD9B37FFB6D9CEFF6E95E8140057C015F7FD7807FC3
        32FF00D4DDFF0094DFFEDB401F3FD7D01FB32FFCCD3FF6E9FF00B5A8FF008665
        FF00A9BBFF0029BFFDB68FF9373FFA987FB77FEDD3C8F23FEFE6EDDE77B636F7
        CF001EFF00457807FC34D7FD4A3FF952FF00ED547FC34D7FD4A3FF00952FFED5
        401EFF00457807FC34D7FD4A3FF952FF00ED547FC34D7FD4A3FF00952FFED540
        07ED35FF0032B7FDBDFF00ED1AF9FEBE80FF00938CFF00A97BFB0BFEDEFCFF00
        3FFEFDEDDBE4FBE7776C727FC332FF00D4DDFF0094DFFEDB401F3FD7DFF5E01F
        F0CCBFF5377FE537FF00B6D1FF000D35FF00528FFE54BFFB55007BFD15E01FF0
        D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB55007BFD15E01FF0
        D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB55007BFD15E01FF0
        D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB55007BFD15E7FF00
        0CBE26FF00C2C6FED4FF008947F67FD83CAFF979F377EFDFFEC2E31B3DFAD7A0
        50015F0057DFF5E01FF0CCBFF5377FE537FF00B6D007CFF457D01FF0CCBFF537
        7FE537FF00B6D1FF000CCBFF005377FE537FFB6D007CFF00457D01FF000CCBFF
        005377FE537FFB6D1FF0CCBFF5377FE537FF00B6D007CFF457D01FF0CCBFF537
        7FE537FF00B6D1FF000CCBFF005377FE537FFB6D001FB32FFCCD3FF6E9FF00B5
        ABDFEBCFFE197C32FF008573FDA9FF00137FED0FB7F95FF2EDE56CD9BFFDB6CE
        77FB74AF40A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A002BE00AFBFEBE00A0028
        A28A0028A28A0028A28A0028A28A002BEFFAF802BEFF00A0028A28A0028A28A0
        028A28A00F00FDA6BFE656FF00B7BFFDA35F3FD7D01FB4D7FCCADFF6F7FF00B4
        6BE7FA002BEFFAF802BEFF00A002BC03F69AFF00995BFEDEFF00F68D7BFD7807
        ED35FF0032B7FDBDFF00ED1A00F9FE8A28A00FBFE8A28A00F00FDA6BFE656FFB
        7BFF00DA35F3FD7D01FB4D7FCCADFF006F7FFB46BE7FA002BEFF00AF802BEFFA
        0028A28A0028A28A00F8028A28A0028A28A002BEFF00AF802BEFFA002BC03F69
        AFF995BFEDEFFF0068D7BFD7807ED35FF32B7FDBDFFED1A00F9FE8A28A00FBFE
        8A28A00F00FDA6BFE656FF00B7BFFDA35F3FD7D01FB4D7FCCADFF6F7FF00B46B
        E7FA002BEFFAF802BEFF00A002BC03F69AFF00995BFEDEFF00F68D7BFD7807ED
        35FF0032B7FDBDFF00ED1A00F9FE8A28A00FBFE8A28A00F00FDA6BFE656FFB7B
        FF00DA35F3FD7D01FB4D7FCCADFF006F7FFB46BE7FA0028A28A002BE80FD997F
        E669FF00B74FFDAD5F3FD7D01FB32FFCCD3FF6E9FF00B5A803DFE8A28A0028A2
        8A0028A28A002BE00AFBFEBE00A002BE80FD997FE669FF00B74FFDAD5F3FD7D0
        1FB32FFCCD3FF6E9FF00B5A803DFE8A28A00F8028A28A00FA03F665FF99A7FED
        D3FF006B57BFD7807ECCBFF334FF00DBA7FED6AF7FA002BE00AFBFEBE00A0028
        A28A0028A28A0028A28A00FA03F665FF0099A7FEDD3FF6B57BFD7807ECCBFF00
        334FFDBA7FED6AF7FA002BE00AFBFEBE00A0028A28A0028A28A00FBFE8A28A00
        28A28A0028A28A002BC03F69AFF995BFEDEFFF0068D7BFD7807ED35FF32B7FDB
        DFFED1A00F9FE8A28A0028A28A00FA03F665FF0099A7FEDD3FF6B57BFD7807EC
        CBFF00334FFDBA7FED6AF7FA002BE00AFBFEBE00A0028A28A0028A28A0028A28
        A00FA03F665FF99A7FEDD3FF006B57BFD7807ECCBFF334FF00DBA7FED6AF7FA0
        028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
        028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00F8028A2
        8A00FA03F665FF0099A7FEDD3FF6B57BFD7807ECCBFF00334FFDBA7FED6AF7FA
        0028A28A0028A28A0028A28A0028A28A0028A28A002BE00AFBFEBE00A002BE80
        FD997FE669FF00B74FFDAD5F3FD7D01FB32FFCCD3FF6E9FF00B5A803DFE8A28A
        00F8028A28A00FA03F665FF99A7FEDD3FF006B57BFD7807ECCBFF334FF00DBA7
        FED6AF7FA0028A28A0028A28A0028A28A00F8028A28A0028A28A0028A28A002B
        E80FD997FE669FFB74FF00DAD5F3FD7D01FB32FF00CCD3FF006E9FFB5A803DFE
        8A28A0028A28A00F00FDA6BFE656FF00B7BFFDA35F3FD7D01FB4D7FCCADFF6F7
        FF00B46BE7FA002BEFFAF802BEFF00A002BC03F69AFF00995BFEDEFF00F68D7B
        FD7807ED35FF0032B7FDBDFF00ED1A00F9FE8A28A00FBFE8A28A00F00FDA6BFE
        656FFB7BFF00DA35F3FD7D01FB4D7FCCADFF006F7FFB46BE7FA0028A28A002BE
        80FD997FE669FF00B74FFDAD5F3FD7D01FB32FFCCD3FF6E9FF00B5A803DFE8A2
        8A00F8028A28A00FA03F665FF99A7FEDD3FF006B57BFD7807ECCBFF334FF00DB
        A7FED6AF7FA0028A28A0028A28A0028A28A00F8028A28A0028A28A002BEFFAF8
        02BEFF00A0028A28A0028A28A0028A28A00F00FDA6BFE656FF00B7BFFDA35F3F
        D7D01FB4D7FCCADFF6F7FF00B46BE7FA0028A28A002BE80FD997FE669FFB74FF
        00DAD5F3FD7D01FB32FF00CCD3FF006E9FFB5A803DFE8A28A00F8028A28A00FA
        03F665FF0099A7FEDD3FF6B57BFD7807ECCBFF00334FFDBA7FED6AF7FA0028A2
        8A002BC03F69AFF995BFEDEFFF0068D7BFD7807ED35FF32B7FDBDFFED1A00F9F
        E8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00FA03F665
        FF0099A7FEDD3FF6B57BFD7807ECCBFF00334FFDBA7FED6AF7FA0028A28A0028
        A28A0028A28A00F8028A28A0028A28A0028A28A0028A28A0028A28A00FBFE8A2
        8A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A2
        8A0028A28A0028A28A0028A28A00F8028A28A00FA03F665FF99A7FEDD3FF006B
        57BFD7807ECCBFF334FF00DBA7FED6AF7FA0028A28A002BCFF00E26FC4DFF857
        3FD97FF128FED0FB7F9BFF002F3E56CD9B3FD86CE77FB74AF40AF00FDA6BFE65
        6FFB7BFF00DA34007FC34D7FD4A3FF00952FFED547FC34D7FD4A3FF952FF00ED
        55F3FD1401F407FC34D7FD4A3FF952FF00ED547FC34D7FD4A3FF00952FFED55F
        3FD1401F5FFC32F89BFF000B1BFB53FE251FD9FF0060F2BFE5E7CDDFBF7FFB0B
        8C6CF7EB5E815E01FB32FF00CCD3FF006E9FFB5ABDFE800AF00FF8665FFA9BBF
        F29BFF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB6BBFF00865F0CBF
        E15CFF006A7FC4DFFB43EDFE57FCBB795B366FFF006DB39DFEDD2BD028A0028A
        28A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29BFF00DB6BDF
        E8A00F3FF865F0CBFE15CFF6A7FC4DFF00B43EDFE57FCBB795B366FF00F6DB39
        DFEDD2BD028A2800A28A2800AF3FF89BF137FE15CFF65FFC4A3FB43EDFE6FF00
        CBCF95B366CFF61B39DFEDD2BD02BC03F69AFF00995BFEDEFF00F68D001FF0D3
        5FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB557CFF0045007D01FF
        000CCBFF005377FE537FFB6D1FF0CCBFF5377FE537FF00B6D7BFD1401E01FF00
        0CCBFF005377FE537FFB6D1FF0CCBFF5377FE537FF00B6D7BFD1401E01FF000C
        CBFF005377FE537FFB6D1FF0CCBFF5377FE537FF00B6D7BFD1401E01FF000CCB
        FF005377FE537FFB6D1FF26E7FF530FF006EFF00DBA791E47FDFCDDBBCEF6C6D
        EF9E3DFEBC03F69AFF00995BFEDEFF00F68D001FF0D35FF528FF00E54BFF00B5
        51FF000D35FF00528FFE54BFFB557CFF0045007DFF00451450079FFC4DF865FF
        000B1BFB2FFE26FF00D9FF0060F37FE5DBCDDFBF67FB6B8C6CF7EB5C07FC332F
        FD4DDFF94DFF00EDB5EFF45007807FC332FF00D4DDFF0094DFFEDB47FC34D7FD
        4A3FF952FF00ED55EFF5F005007D01FF000D35FF00528FFE54BFFB5579FF00C4
        DF89BFF0B1BFB2FF00E251FD9FF60F37FE5E7CDDFBF67FB0B8C6CF7EB5E7F450
        0145145007D01FF0D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB
        557CFF0045007A07C4DF89BFF0B1BFB2FF00E251FD9FF60F37FE5E7CDDFBF67F
        B0B8C6CF7EB5E7F4514005145140057A07C32F89BFF0AE7FB53FE251FDA1F6FF
        002BFE5E7CAD9B37FF00B0D9CEFF006E95E7F45007D01FF0D35FF528FF00E54B
        FF00B551FF000D35FF00528FFE54BFFB557CFF0045007D01FF000CCBFF005377
        FE537FFB6D1FF0CCBFF5377FE537FF00B6D7BFD1401E7FF0CBE197FC2B9FED4F
        F89BFF00687DBFCAFF00976F2B66CDFF00EDB673BFDBA57A051450015E01FF00
        0D35FF00528FFE54BFFB557BFD7C01401F407FC34D7FD4A3FF00952FFED547FC
        34D7FD4A3FF952FF00ED55F3FD1401F407FC34D7FD4A3FF952FF00ED547FC34D
        7FD4A3FF00952FFED55F3FD1401F407FC332FF00D4DDFF0094DFFEDB47FC332F
        FD4DDFF94DFF00EDB5EFF45007807FC332FF00D4DDFF0094DFFEDB47FC332FFD
        4DDFF94DFF00EDB5EFF45007807FC332FF00D4DDFF0094DFFEDB47FC34D7FD4A
        3FF952FF00ED55EFF5F005007D01FF000D35FF00528FFE54BFFB551FF0D35FF5
        28FF00E54BFF00B557CFF45007D01FF0D35FF528FF00E54BFF00B551FF000D35
        FF00528FFE54BFFB557CFF0045007D01FF000D35FF00528FFE54BFFB551FF0D3
        5FF528FF00E54BFF00B557CFF45007D01FF2719FF52F7F617FDBDF9FE7FF00DF
        BDBB7C9F7CEEED8E4FF8665FFA9BBFF29BFF00DB68FD997FE669FF00B74FFDAD
        5EFF00401E01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE537FF00B6D7
        BFD1401E01FF000CCBFF005377FE537FFB6D1FF26E7FF530FF006EFF00DBA791
        E47FDFCDDBBCEF6C6DEF9E3DFEBC03F69AFF00995BFEDEFF00F68D001FF0D35F
        F528FF00E54BFF00B551FF000D35FF00528FFE54BFFB557CFF00450014514500
        7D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD3FF6B57BFD00
        1451450015E7FF00137E197FC2C6FECBFF0089BFF67FD83CDFF976F377EFD9FE
        DAE31B3DFAD7A051401E01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE5
        37FF00B6D7BFD1401E01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE537
        FF00B6D7BFD1401F207C4DF865FF000AE7FB2FFE26FF00DA1F6FF37FE5DBCAD9
        B367FB6D9CEFF6E95E7F5F407ED35FF32B7FDBDFFED1AF9FE800AFA03FE1997F
        EA6EFF00CA6FFF006DAF9FEBEFFA00F00FF8665FFA9BBFF29BFF00DB6BCFFE26
        FC32FF008573FD97FF00137FED0FB7F9BFF2EDE56CD9B3FDB6CE77FB74AFAFEB
        C03F69AFF995BFEDEFFF0068D007CFF45145007D01FF000CCBFF005377FE537F
        FB6D1FF0CCBFF5377FE537FF00B6D7BFD1401E01FF0026E7FF00530FF6EFFDBA
        791E47FDFCDDBBCEF6C6DEF9E0FF00869AFF00A947FF002A5FFDAA8FDA6BFE65
        6FFB7BFF00DA35F3FD007D01FF000D35FF00528FFE54BFFB557BFD7C015F7FD0
        015E7FF137E26FFC2B9FECBFF8947F687DBFCDFF00979F2B66CD9FEC3673BFDB
        A57A057807ED35FF0032B7FDBDFF00ED1A003FE1A6BFEA51FF00CA97FF006AA3
        FE1A6BFEA51FFCA97FF6AAF9FE8A0028A28A00F40F865F0CBFE1637F6A7FC4DF
        FB3FEC1E57FCBB79BBF7EFFF006D718D9EFD6BD03FE1997FEA6EFF00CA6FFF00
        6DA3F665FF0099A7FEDD3FF6B57BFD007807FC332FFD4DDFF94DFF00EDB5F3FD
        7DFF005F0050015E81F0CBE197FC2C6FED4FF89BFF0067FD83CAFF00976F377E
        FDFF00EDAE31B3DFAD79FD7D01FB32FF00CCD3FF006E9FFB5A800FF8665FFA9B
        BFF29BFF00DB68FF008665FF00A9BBFF0029BFFDB6BDFE8A00F00FF869AFFA94
        7FF2A5FF00DAA8FF00869AFF00A947FF002A5FFDAABE7FA2803EBFF865F137FE
        1637F6A7FC4A3FB3FEC1E57FCBCF9BBF7EFF00F61718D9EFD6BD02BC03F665FF
        0099A7FEDD3FF6B57BFD00145145001451450014514500145145001451450014
        514500145145001451450014514500145145007C0145145007D01FB32FFCCD3F
        F6E9FF00B5ABDFEBE00A2803EFFA2BE00AFBFE800AF00FDA6BFE656FFB7BFF00
        DA35EFF5E01FB4D7FCCADFF6F7FF00B46803E7FA28A2800A28A2803E80FD997F
        E669FF00B74FFDAD5EFF005F0051401F7FD15F0051401F7FD15F0051401F7FD1
        5F0051401F7FD1451400515E01FB4D7FCCADFF006F7FFB46BE7FA00FBFE8AF80
        2BEFFA002BC03F69AFF995BFEDEFFF0068D7BFD7807ED35FF32B7FDBDFFED1A0
        0F9FE8A28A00FBFE8A28A0028A28A0028A2BE00A00FBFEBC03F69AFF00995BFE
        DEFF00F68D7CFF004500145145007DFF0045145001457807ED35FF0032B7FDBD
        FF00ED1AF9FE803EFF00AF8028A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2803EFF00A28A2800A2BC03F69AFF00995BFEDEFF00F6
        8D7CFF00401F7FD7C01457DFF401F00515F7FD7807ED35FF0032B7FDBDFF00ED
        1A00F9FE8A28A00FBFE8A28A0028A28A002BE00AFBFEBE00A0028A2BE80FD997
        FE669FFB74FF00DAD401F3FD15F7FD1401F0051451401F407ECCBFF334FF00DB
        A7FED6AF7FAF00FD997FE669FF00B74FFDAD5EFF004005145140057807ED35FF
        0032B7FDBDFF00ED1AF7FA2803E00A2BEFFA2803E00A28A2803E80FD997FE669
        FF00B74FFDAD5EFF005F0051401F7FD15F0057DFF40051457807ED35FF0032B7
        FDBDFF00ED1A00F7FA2BE00A2803EFFA2BE00A2803E80FDA6BFE656FFB7BFF00
        DA35F3FD7D01FB32FF00CCD3FF006E9FFB5ABDFE803E00AFBFE8A2800AF00FDA
        6BFE656FFB7BFF00DA35EFF45007C01457DFF45001457C0145007D01FB4D7FCC
        ADFF006F7FFB46BE7FAFA03F665FF99A7FEDD3FF006B57BFD007C015F7FD15F0
        05007DFF005E01FB4D7FCCADFF006F7FFB46BE7FA2800A28A2800A2BEFFA2803
        C03F665FF99A7FEDD3FF006B57BFD1450015F0057DFF005F0050015F407ECCBF
        F334FF00DBA7FED6AF9FE8A00FBFE8AF8028A0028AFBFE8A00F00FD997FE669F
        FB74FF00DAD5EFF4514005145140051451400514514005145140051451400514
        5140051451400514514005145140051451401F0051451400515E81F0CBE197FC
        2C6FED4FF89BFF0067FD83CAFF00976F377EFDFF00EDAE31B3DFAD7A07FC332F
        FD4DDFF94DFF00EDB401F3FD7DFF005E01FF000CCBFF005377FE537FFB6D7BFD
        0015E01FB4D7FCCADFF6F7FF00B46BDFEBCFFE26FC32FF00858DFD97FF00137F
        ECFF00B079BFF2EDE6EFDFB3FDB5C6367BF5A00F9028AFA03FE1997FEA6EFF00
        CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DA00F9FE8AFA03FE1997FEA6EFFCA6
        FF00F6DA3FE1997FEA6EFF00CA6FFF006DA00F9FE8AFA03FE1997FEA6EFF00CA
        6FFF006DA3FE1997FEA6EFFCA6FF00F6DA00F9FE8AFA03FE1997FEA6EFFCA6FF
        00F6DA3FE1997FEA6EFF00CA6FFF006DA00F9FE8AFA03FE1997FEA6EFF00CA6F
        FF006DA3FE1997FEA6EFFCA6FF00F6DA00F9FE8AFA03FE1997FEA6EFFCA6FF00
        F6DA3FE1997FEA6EFF00CA6FFF006DA00F7FA28A2803C03F69AFF995BFEDEFFF
        0068D7CFF5F407ED35FF0032B7FDBDFF00ED1AF9FE800AFBFEBE00AFBFE800AF
        00FDA6BFE656FF00B7BFFDA35EFF005E01FB4D7FCCADFF006F7FFB46803E7FA2
        8A2803EFFA28A2800A2BCFFE26FC4DFF008573FD97FF00128FED0FB7F9BFF2F3
        E56CD9B3FD86CE77FB74AE03FE1A6BFEA51FFCA97FF6AA00F7FAF802BE80FF00
        869AFF00A947FF002A5FFDAABE7FA0028A28A0028A28A00FBFE8A28A00F00FDA
        6BFE656FFB7BFF00DA35F3FD7D7FF137E197FC2C6FECBFF89BFF0067FD83CDFF
        00976F377EFD9FEDAE31B3DFAD701FF0CCBFF5377FE537FF00B6D007CFF457D0
        1FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE537FFB6D007CFF00457D
        01FF000CCBFF005377FE537FFB6D79FF00C4DF865FF0AE7FB2FF00E26FFDA1F6
        FF0037FE5DBCAD9B367FB6D9CEFF006E9401E7F45145001457D01FF0CCBFF537
        7FE537FF00B6D1FF000CCBFF005377FE537FFB6D007CFF00457A07C4DF865FF0
        AE7FB2FF00E26FFDA1F6FF0037FE5DBCAD9B367FB6D9CEFF006E95E7F4005145
        140051457A07C32F865FF0B1BFB53FE26FFD9FF60F2BFE5DBCDDFBF7FF00B6B8
        C6CF7EB401E7F457D01FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE53
        7FFB6D007BFD1451401E01FB4D7FCCADFF006F7FFB46BE7FAFA03F69AFF995BF
        EDEFFF0068D7CFF40057DFF5F0057DFF0040057807ED35FF0032B7FDBDFF00ED
        1AF7FAF00FDA6BFE656FFB7BFF00DA3401F3FD1451401F7FD1451400515E7FF1
        37E26FFC2B9FECBFF8947F687DBFCDFF00979F2B66CD9FEC3673BFDBA5701FF0
        D35FF528FF00E54BFF00B55007BFD7C015F407FC34D7FD4A3FF952FF00ED55F3
        FD0015F407ECCBFF00334FFDBA7FED6AF9FEBD03E197C4DFF8573FDA9FF128FE
        D0FB7F95FF002F3E56CD9BFF00D86CE77FB74A00FAFE8AF00FF869AFFA947FF2
        A5FF00DAA8FF00869AFF00A947FF002A5FFDAA803E7FA2BE80FF008665FF00A9
        BBFF0029BFFDB68FF8665FFA9BBFF29BFF00DB6800FD997FE669FF00B74FFDAD
        5EFF005E01FF0026E7FF00530FF6EFFDBA791E47FDFCDDBBCEF6C6DEF9E0FF00
        869AFF00A947FF002A5FFDAA803DFE8AF00FF869AFFA947FF2A5FF00DAABDFE8
        00A28A2800A28A2803E00A28A2800A2BD03E197C32FF00858DFDA9FF00137FEC
        FF00B0795FF2EDE6EFDFBFFDB5C6367BF5AF40FF008665FF00A9BBFF0029BFFD
        B6803E7FAFBFEBC03FE1997FEA6EFF00CA6FFF006DA3FE1A6BFEA51FFCA97FF6
        AA00F7FAF00FDA6BFE656FFB7BFF00DA347FC34D7FD4A3FF00952FFED55E7FF1
        37E26FFC2C6FECBFF8947F67FD83CDFF00979F377EFD9FEC2E31B3DFAD0079FD
        1451400515F407FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094DFFEDB
        4007ECCBFF00334FFDBA7FED6AF7FAF3FF00865F0CBFE15CFF006A7FC4DFFB43
        EDFE57FCBB795B366FFF006DB39DFEDD2BD02800A28A2800A28AF3FF0089BF13
        7FE15CFF0065FF00C4A3FB43EDFE6FFCBCF95B366CFF0061B39DFEDD2803D028
        AF00FF00869AFF00A947FF002A5FFDAA8FF869AFFA947FF2A5FF00DAA803E7FA
        28A2803E80FD997FE669FF00B74FFDAD5EFF005F207C32F89BFF000AE7FB53FE
        251FDA1F6FF2BFE5E7CAD9B37FFB0D9CEFF6E95E81FF000D35FF00528FFE54BF
        FB55007BFD7C015F407FC34D7FD4A3FF00952FFED547FC332FFD4DDFF94DFF00
        EDB401F3FD15F407FC332FFD4DDFF94DFF00EDB5E7FF00137E197FC2B9FECBFF
        0089BFF687DBFCDFF976F2B66CD9FEDB673BFDBA50079FD1451401F7FD15E01F
        F0D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB55007BFD15E01F
        F0D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB55007BFD7C015F
        407FC34D7FD4A3FF00952FFED55F3FD0014515E81F0CBE197FC2C6FED4FF0089
        BFF67FD83CAFF976F377EFDFFEDAE31B3DFAD0079FD15F407FC332FF00D4DDFF
        0094DFFEDB47FC332FFD4DDFF94DFF00EDB401EFF457807FC34D7FD4A3FF0095
        2FFED547FC34D7FD4A3FF952FF00ED5401EFF4579FFC32F89BFF000B1BFB53FE
        251FD9FF0060F2BFE5E7CDDFBF7FFB0B8C6CF7EB5E8140051451400514514005
        145140051451400514514005145140051451400514514005145140051451401F
        0051451401F407ECCBFF00334FFDBA7FED6AF7FAF00FD997FE669FFB74FF00DA
        D5EFF40051451400514514005145140051451400514514005145140051451400
        5145140051451401E01FB4D7FCCADFF6F7FF00B46BE7FAFA03F69AFF00995BFE
        DEFF00F68D7CFF0040057DFF005F0057DFF40057807ED35FF32B7FDBDFFED1AF
        7FAF00FDA6BFE656FF00B7BFFDA3401F3FD1451401F7FD1451401E01FB4D7FCC
        ADFF006F7FFB46BE7FAFA03F69AFF995BFEDEFFF0068D7CFF400514514005145
        140051451401F7FD1451400514514005145140057807ED35FF0032B7FDBDFF00
        ED1AF7FAF00FDA6BFE656FFB7BFF00DA3401F3FD1451401F7FD1451401E01FB4
        D7FCCADFF6F7FF00B46BE7FAFA03F69AFF00995BFEDEFF00F68D7CFF00400514
        5140057D01FB32FF00CCD3FF006E9FFB5ABE7FAFA03F665FF99A7FEDD3FF006B
        5007BFD145140051451401E01FB4D7FCCADFF6F7FF00B46BE7FAFA03F69AFF00
        995BFEDEFF00F68D7CFF0040057DFF005F0057DFF40057807ED35FF32B7FDBDF
        FED1AF7FAF00FDA6BFE656FF00B7BFFDA3401F3FD1451401F7FD1451401E01FB
        4D7FCCADFF006F7FFB46BE7FAFA03F69AFF995BFEDEFFF0068D7CFF400514514
        005145140051451401F7FD1451401E01FB4D7FCCADFF006F7FFB46BE7FAFA03F
        69AFF995BFEDEFFF0068D7CFF40057DFF5F0057DFF004005145140051451401F
        0051451401F407ECCBFF00334FFDBA7FED6AF7FAF00FD997FE669FFB74FF00DA
        D5EFF40057C015F7FD7C014005145140051451401F7FD1451400514514005145
        140057807ED35FF32B7FDBDFFED1AF7FAF00FDA6BFE656FF00B7BFFDA3401F3F
        D1451400514514005145140057DFF5F0057DFF0040057807ED35FF0032B7FDBD
        FF00ED1AF7FAF00FDA6BFE656FFB7BFF00DA3401F3FD14514005145140051451
        4005145140057D01FB32FF00CCD3FF006E9FFB5ABE7FAFA03F665FF99A7FEDD3
        FF006B5007BFD1451401F0051451401F407ECCBFF334FF00DBA7FED6AF7FAF00
        FD997FE669FF00B74FFDAD5EFF00400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451401E01FB4D7F
        CCADFF006F7FFB46BE7FAFA03F69AFF995BFEDEFFF0068D7CFF40057DFF5F005
        7DFF004005145140051451401F00514514005145140051451400514514005145
        1400514514005145140057DFF5F0057DFF0040057807ED35FF0032B7FDBDFF00
        ED1AF7FAF00FDA6BFE656FFB7BFF00DA3401F3FD145140051451400514514005
        7DFF005F0057DFF40057807ED35FF32B7FDBDFFED1AF7FAF00FDA6BFE656FF00
        B7BFFDA3401F3FD1451401F7FD1451401E01FB4D7FCCADFF006F7FFB46BE7FAF
        A03F69AFF995BFEDEFFF0068D7CFF40057DFF5F0057DFF004005145140051451
        400514514005145140057C015F7FD7C014005145140051451400514514005145
        1400514514005145140051451400514514005145140057DFF5F0057DFF004005
        7807ED35FF0032B7FDBDFF00ED1AF7FAF00FDA6BFE656FFB7BFF00DA3401F3FD
        145140051451401F407ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B7
        4FFDAD5EFF004005145140057807ED35FF0032B7FDBDFF00ED1AF7FAF00FDA6B
        FE656FFB7BFF00DA3401F3FD145140051451401F407ECCBFF334FF00DBA7FED6
        AF7FAF00FD997FE669FF00B74FFDAD5EFF004005145140057807ED35FF0032B7
        FDBDFF00ED1AF7FAF00FDA6BFE656FFB7BFF00DA3401F3FD145140051451401F
        407ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFDAD5EFF004005
        7C015F7FD7C0140057D01FB32FFCCD3FF6E9FF00B5ABE7FAFA03F665FF0099A7
        FEDD3FF6B5007BFD1451401F0051451400514514005145140051451400514514
        00514514005145140057DFF5F0057DFF0040057807ED35FF0032B7FDBDFF00ED
        1AF7FAF00FDA6BFE656FFB7BFF00DA3401F3FD145140051451401F407ECCBFF3
        34FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFDAD5EFF0040051451400514
        5140051451400514514005145140051451400514514005145140051451400514
        5140051451401E01FB4D7FCCADFF006F7FFB46BE7FAFA03F69AFF995BFEDEFFF
        0068D7CFF40057D01FF0D35FF528FF00E54BFF00B557CFF45007D01FF0D35FF5
        28FF00E54BFF00B551FF000D35FF00528FFE54BFFB557CFF0045007D01FF000D
        35FF00528FFE54BFFB551FF0D35FF528FF00E54BFF00B557CFF4500145145007
        A07C32F865FF000B1BFB53FE26FF00D9FF0060F2BFE5DBCDDFBF7FFB6B8C6CF7
        EB5E81FF000CCBFF005377FE537FFB6D1FB32FFCCD3FF6E9FF00B5ABDFE803C0
        3FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DAF7FA2803C03F
        E1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DAF7FA2803C03FE1
        997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DAF7FA2803E00A28A2
        800A28A2800AFBFEBE00AFBFE800AF00FDA6BFE656FF00B7BFFDA35EFF005E01
        FB4D7FCCADFF006F7FFB46803E7FA28A2803E80FF8665FFA9BBFF29BFF00DB68
        FF008665FF00A9BBFF0029BFFDB6BDFE8A00F903E26FC32FF8573FD97FF137FE
        D0FB7F9BFF002EDE56CD9B3FDB6CE77FB74AF3FAFA03F69AFF00995BFEDEFF00
        F68D7CFF0040057DFF005F0057DFF400579FFC4DF865FF000B1BFB2FFE26FF00
        D9FF0060F37FE5DBCDDFBF67FB6B8C6CF7EB5E8145007807FC332FFD4DDFF94D
        FF00EDB47FC332FF00D4DDFF0094DFFEDB5EFF0045007807FC34D7FD4A3FF952
        FF00ED547FC34D7FD4A3FF00952FFED55F3FD1401F407FC9C67FD4BDFD85FF00
        6F7E7F9FFF007EF6EDF27DF3BBB6393FE1997FEA6EFF00CA6FFF006DA3F665FF
        0099A7FEDD3FF6B57BFD007807FC332FFD4DDFF94DFF00EDB5EFF45140051451
        4005145140051451401E7FF137E26FFC2B9FECBFF8947F687DBFCDFF00979F2B
        66CD9FEC3673BFDBA5701FF0D35FF528FF00E54BFF00B551FB4D7FCCADFF006F
        7FFB46BE7FA00FA03FE1A6BFEA51FF00CA97FF006AA3FE1997FEA6EFFCA6FF00
        F6DAF9FEBEFF00A00F00FF008665FF00A9BBFF0029BFFDB6BCFF00E26FC32FF8
        573FD97FF137FED0FB7F9BFF002EDE56CD9B3FDB6CE77FB74AFAFEBC03F69AFF
        00995BFEDEFF00F68D007CFF004514500145145007A07C32F865FF000B1BFB53
        FE26FF00D9FF0060F2BFE5DBCDDFBF7FFB6B8C6CF7EB5E81FF000CCBFF005377
        FE537FFB6D1FB32FFCCD3FF6E9FF00B5ABDFE803C03FE1997FEA6EFF00CA6FFF
        006DA3FE1997FEA6EFFCA6FF00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF00
        6DA3FE1997FEA6EFFCA6FF00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006D
        A3FE1997FEA6EFFCA6FF00F6DAF7FA2803E00A28A2803D03E197C32FF858DFDA
        9FF137FECFFB0795FF002EDE6EFDFBFF00DB5C6367BF5AF40FF8665FFA9BBFF2
        9BFF00DB68FD997FE669FF00B74FFDAD5EFF00401E01FF000CCBFF005377FE53
        7FFB6D7BFD1450015E01FB4D7FCCADFF006F7FFB46BDFEBC03F69AFF00995BFE
        DEFF00F68D007CFF0045145007D01FF0CCBFF5377FE537FF00B6D1FF000CCBFF
        005377FE537FFB6D7BFD1401E7FF000CBE197FC2B9FED4FF0089BFF687DBFCAF
        F976F2B66CDFFEDB673BFDBA57A051450015E01FF0D35FF528FF00E54BFF00B5
        57BFD7C01401F407FC34D7FD4A3FF952FF00ED55E7FF00137E26FF00C2C6FECB
        FF008947F67FD83CDFF979F377EFD9FEC2E31B3DFAD79FD140051451401F407F
        C332FF00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF45007807FC9
        B9FF00D4C3FDBBFF006E9E4791FF007F376EF3BDB1B7BE783FE1A6BFEA51FF00
        CA97FF006AA3F69AFF00995BFEDEFF00F68D7CFF00401F407FC34D7FD4A3FF00
        952FFED55EFF005F0057DFF400579FFC4DF865FF000B1BFB2FFE26FF00D9FF00
        60F37FE5DBCDDFBF67FB6B8C6CF7EB5E8145007807FC332FFD4DDFF94DFF00ED
        B47FC332FF00D4DDFF0094DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00ED
        B47FC332FF00D4DDFF0094DFFEDB5EFF0045007807FC9B9FFD4C3FDBBFF6E9E4
        791FF7F376EF3BDB1B7BE783FE1A6BFEA51FFCA97FF6AA3F69AFF995BFEDEFFF
        0068D7CFF401F407FC34D7FD4A3FF952FF00ED547FC332FF00D4DDFF0094DFFE
        DB5F3FD7DFF401E01FF0CCBFF5377FE537FF00B6D77FF0CBE197FC2B9FED4FF8
        9BFF00687DBFCAFF00976F2B66CDFF00EDB673BFDBA57A05140051451401F005
        1451401E81F0CBE197FC2C6FED4FF89BFF0067FD83CAFF00976F377EFDFF00ED
        AE31B3DFAD7A07FC332FFD4DDFF94DFF00EDB47ECCBFF334FF00DBA7FED6AF7F
        A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29BFF00DB6BDFE8
        A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29BFF00DB6BDFE8
        A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29BFF00DB6BDFE8
        A00F8028A28A0028A28A002BEFFAF802BEFF00A002BCFF00E26FC32FF858DFD9
        7FF137FECFFB079BFF002EDE6EFDFB3FDB5C6367BF5AF40A2803C03FE1997FEA
        6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DAF7FA2803C03FE1997FEA6E
        FF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DAF7FA2803CFFE197C32FF0085
        73FDA9FF00137FED0FB7F95FF2EDE56CD9BFFDB6CE77FB74AF40A28A0028A28A
        0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
        0028A28A0028AF8028A00FA03F69AFF995BFEDEFFF0068D7CFF5F407ECCBFF00
        334FFDBA7FED6AF7FA00F8028AFBFEBE00A0028A2BE80FD997FE669FFB74FF00
        DAD401F3FD15F7FD1401F0051451401F407ECCBFF334FF00DBA7FED6AF7FAF00
        FD997FE669FF00B74FFDAD5EFF0040051457C01401F7FD15F0057D01FB32FF00
        CCD3FF006E9FFB5A803DFE8A28A00F8028A28A0028AFA03F665FF99A7FEDD3FF
        006B57BFD007C015F7FD1450015E01FB4D7FCCADFF006F7FFB46BDFEBC03F69A
        FF00995BFEDEFF00F68D007CFF0045145007DFF457C0145007D01FB4D7FCCADF
        F6F7FF00B46BE7FAFA03F665FF0099A7FEDD3FF6B57BFD007C015F7FD15F0050
        07DFF457C0145007DFF457C014500145145007D01FB32FFCCD3FF6E9FF00B5AB
        DFEBC03F665FF99A7FEDD3FF006B57BFD0014514500145145001451450014514
        5007807ED35FF32B7FDBDFFED1AF9FEBE80FDA6BFE656FFB7BFF00DA35F3FD00
        15F7FD7C0145007DFF005E01FB4D7FCCADFF006F7FFB46BE7FAFA03F665FF99A
        7FEDD3FF006B5007CFF457DFF45007C0145145007D01FB32FF00CCD3FF006E9F
        FB5ABDFEBC03F665FF0099A7FEDD3FF6B57BFD0014515F005007DFF457C015F4
        07ECCBFF00334FFDBA7FED6A00F7FA28A2803E00A28A2803E80FD997FE669FFB
        74FF00DAD5EFF5F0051401F7FD15F0057DFF0040057807ED35FF0032B7FDBDFF
        00ED1AF7FA2803E00A2BEFFA2800A2BE00A2803EFF00A2BC03F665FF0099A7FE
        DD3FF6B57BFD0015F0057DFF0045007C01457DFF0045007C01457DFF00450014
        57C0145007D01FB4D7FCCADFF6F7FF00B46BE7FAFA03F665FF0099A7FEDD3FF6
        B57BFD007C015F7FD15F005007DFF457C015F407ECCBFF00334FFDBA7FED6A00
        F7FA28A2800A2BE00A2803E80FDA6BFE656FFB7BFF00DA35F3FD7D01FB32FF00
        CCD3FF006E9FFB5ABDFE803E00AFBFE8A2800A28AF00FDA6BFE656FF00B7BFFD
        A3401EFF00457C014500145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03
        F665FF0099A7FEDD3FF6B57BFD0014515F005007DFF457C015F407ECCBFF0033
        4FFDBA7FED6A00F7FA28A2803E00A28A2800A28A2800AFBFEBE00AFBFE800A28
        A2800A28A2800A2BE00A2803EFFA2BC03F665FF99A7FEDD3FF006B57BFD00145
        1450014514500145145001451450014514500145145001451450014514500145
        14500145145007C01457D01FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377
        FE537FFB6D001FB32FFCCD3FF6E9FF00B5ABDFEBCFFE197C32FF008573FDA9FF
        00137FED0FB7F95FF2EDE56CD9BFFDB6CE77FB74AF40A002BE00AFBFEBE00A00
        2BE80FD997FE669FFB74FF00DAD5F3FD7A07C32F89BFF0AE7FB53FE251FDA1F6
        FF002BFE5E7CAD9B37FF00B0D9CEFF006E9401F5FD15E01FF0D35FF528FF00E5
        4BFF00B551FF000D35FF00528FFE54BFFB55007CFF0045145007D01FB32FFCCD
        3FF6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD0015F0057DFF5E01F
        F0CCBFF5377FE537FF00B6D007CFF5F407ECCBFF00334FFDBA7FED6A3FE1997F
        EA6EFF00CA6FFF006DAEFF00E197C32FF8573FDA9FF137FED0FB7F95FF002EDE
        56CD9BFF00DB6CE77FB74A00F40A28A2803E00A28A2803E80FD997FE669FFB74
        FF00DAD5EFF5E01FB32FFCCD3FF6E9FF00B5ABDFE800A28AF00FF869AFFA947F
        F2A5FF00DAA803DFEBC03F69AFF995BFEDEFFF0068D1FF000D35FF00528FFE54
        BFFB551FF2719FF52F7F617FDBDF9FE7FF00DFBDBB7C9F7CEEED8E403E7FA2BE
        80FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29BFF00DB6803E7FA2B
        E80FF8665FFA9BBFF29BFF00DB68FF008665FF00A9BBFF0029BFFDB6800FD997
        FE669FFB74FF00DAD5EFF5E7FF000CBE197FC2B9FED4FF0089BFF687DBFCAFF9
        76F2B66CDFFEDB673BFDBA57A050015F0057DFF5E01FF0CCBFF5377FE537FF00
        B6D007CFF457D01FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE537FFB
        6D007CFF00457D01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE537FF00
        B6D007CFF45145007D01FB32FF00CCD3FF006E9FFB5ABDFEBE40F865F137FE15
        CFF6A7FC4A3FB43EDFE57FCBCF95B366FF00F61B39DFEDD2BD03FE1A6BFEA51F
        FCA97FF6AA00F7FA2BC03FE1A6BFEA51FF00CA97FF006AAF7FA0028A28A0028A
        28A0028AF00FF869AFFA947FF2A5FF00DAA8FF00869AFF00A947FF002A5FFDAA
        800FDA6BFE656FFB7BFF00DA35F3FD7D01FF002719FF0052F7F617FDBDF9FE7F
        FDFBDBB7C9F7CEEED8E4FF008665FF00A9BBFF0029BFFDB6803E7FA2BE80FF00
        8665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29BFF00DB6803E7FAFA03F665
        FF0099A7FEDD3FF6B51FF0CCBFF5377FE537FF00B6D77FF0CBE197FC2B9FED4F
        F89BFF00687DBFCAFF00976F2B66CDFF00EDB673BFDBA5007A051451401F0051
        451401F407ECCBFF00334FFDBA7FED6AF7FAF00FD997FE669FFB74FF00DAD5EF
        F40057C015F7FD7807FC332FFD4DDFF94DFF00EDB401F3FD7D01FB32FF00CCD3
        FF006E9FFB5A8FF8665FFA9BBFF29BFF00DB6BBFF865F0CBFE15CFF6A7FC4DFF
        00B43EDFE57FCBB795B366FF00F6DB39DFEDD2803D028A28A00F8028A28A0028
        AF40F865F0CBFE1637F6A7FC4DFF00B3FEC1E57FCBB79BBF7EFF00F6D718D9EF
        D6BD03FE1997FEA6EFFCA6FF00F6DA00F9FEBEFF00AF00FF008665FF00A9BBFF
        0029BFFDB68FF869AFFA947FF2A5FF00DAA803DFE8AF00FF00869AFF00A947FF
        002A5FFDAA8FF869AFFA947FF2A5FF00DAA803DFE8AF00FF00869AFF00A947FF
        002A5FFDAA8FF869AFFA947FF2A5FF00DAA803E7FA2BE80FF8665FFA9BBFF29B
        FF00DB68FF008665FF00A9BBFF0029BFFDB6800FD997FE669FFB74FF00DAD5EF
        F5E01FF26E7FF530FF006EFF00DBA791E47FDFCDDBBCEF6C6DEF9E0FF869AFFA
        947FF2A5FF00DAA803DFE8AF00FF00869AFF00A947FF002A5FFDAABDFE800A28
        AF3FF89BF137FE15CFF65FFC4A3FB43EDFE6FF00CBCF95B366CFF61B39DFEDD2
        803D028AF00FF869AFFA947FF2A5FF00DAA8FF00869AFF00A947FF002A5FFDAA
        803E7FA28A2803E80FD997FE669FFB74FF00DAD5EFF5E01FB32FFCCD3FF6E9FF
        00B5ABDFE800AF802BEFFAF00FF8665FFA9BBFF29BFF00DB6803E7FAFA03F665
        FF0099A7FEDD3FF6B51FF0CCBFF5377FE537FF00B6D1FF0026E7FF00530FF6EF
        FDBA791E47FDFCDDBBCEF6C6DEF9E003DFE8AF00FF00869AFF00A947FF002A5F
        FDAA8FF869AFFA947FF2A5FF00DAA803E7FA28A2803E80FD997FE669FF00B74F
        FDAD5EFF005E01FB32FF00CCD3FF006E9FFB5ABDFE800A28A2800AF00FDA6BFE
        656FFB7BFF00DA35EFF5E01FB4D7FCCADFF6F7FF00B46803E7FA28A2800A28A2
        803E80FD997FE669FF00B74FFDAD5EFF005E01FB32FF00CCD3FF006E9FFB5ABD
        FE800AF802BEFF00AF00FF008665FF00A9BBFF0029BFFDB6803E7FAFA03F665F
        F99A7FEDD3FF006B51FF000CCBFF005377FE537FFB6D77FF000CBE197FC2B9FE
        D4FF0089BFF687DBFCAFF976F2B66CDFFEDB673BFDBA5007A051451401F00514
        51400515E81F0CBE197FC2C6FED4FF0089BFF67FD83CAFF976F377EFDFFEDAE3
        1B3DFAD7A07FC332FF00D4DDFF0094DFFEDB401F3FD7DFF5E01FF0CCBFF5377F
        E537FF00B6D7BFD0014515E7FF00137E26FF00C2B9FECBFF008947F687DBFCDF
        F979F2B66CD9FEC3673BFDBA5007A0515E01FF000D35FF00528FFE54BFFB551F
        F0D35FF528FF00E54BFF00B55007CFF457D01FF0CCBFF5377FE537FF00B6D1FF
        000CCBFF005377FE537FFB6D001FB32FFCCD3FF6E9FF00B5ABDFEBCFFE197C32
        FF008573FDA9FF00137FED0FB7F95FF2EDE56CD9BFFDB6CE77FB74AF40A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A002BE00AFBFEBE00A0028A28A0028A28A0028
        A28A00FA03F665FF0099A7FEDD3FF6B57BFD7807ECCBFF00334FFDBA7FED6AF7
        FA0028A28A0028A28A0028A28A00F8028A28A00FA03F665FF99A7FEDD3FF006B
        57BFD7807ECCBFF334FF00DBA7FED6AF7FA002BE00AFBFEBE00A002BE80FD997
        FE669FFB74FF00DAD5F3FD7D01FB32FF00CCD3FF006E9FFB5A803DFE8A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A00F8028A28A0028A28A002BEFFA
        F802BEFF00A0028A28A0028A28A00F8028A28A00FA03F665FF0099A7FEDD3FF6
        B57BFD7807ECCBFF00334FFDBA7FED6AF7FA0028A28A0028A28A0028A28A00F8
        028A28A00FA03F665FF99A7FEDD3FF006B57BFD7807ECCBFF334FF00DBA7FED6
        AF7FA0028A28A0028A28A0028A28A00F8028A28A00FA03F665FF0099A7FEDD3F
        F6B57BFD7807ECCBFF00334FFDBA7FED6AF7FA002BE00AFBFEBE00A0028A28A0
        028A28A00FBFE8A28A00F00FDA6BFE656FFB7BFF00DA35F3FD7D01FB4D7FCCAD
        FF006F7FFB46BE7FA002BEFF00AF802BEFFA002BC03F69AFF995BFEDEFFF0068
        D7BFD7807ED35FF32B7FDBDFFED1A00F9FE8A28A0028A28A00FA03F665FF0099
        A7FEDD3FF6B57BFD7807ECCBFF00334FFDBA7FED6AF7FA0028A28A002BC03F69
        AFF995BFEDEFFF0068D7BFD7807ED35FF32B7FDBDFFED1A00F9FE8A28A0028A2
        8A00FA03F665FF0099A7FEDD3FF6B57BFD7807ECCBFF00334FFDBA7FED6AF7FA
        0028A28A002BC03F69AFF995BFEDEFFF0068D7BFD7807ED35FF32B7FDBDFFED1
        A00F9FE8A28A0028A28A00FA03F665FF0099A7FEDD3FF6B57BFD7807ECCBFF00
        334FFDBA7FED6AF7FA0028A28A0028A28A0028A28A00F8028A28A00FA03F665F
        F99A7FEDD3FF006B57BFD7807ECCBFF334FF00DBA7FED6AF7FA0028A28A002BC
        03F69AFF00995BFEDEFF00F68D7BFD7807ED35FF0032B7FDBDFF00ED1A00F9FE
        8A28A00FBFE8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
        0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00F00FDA6BFE656F
        FB7BFF00DA35F3FD7D01FB4D7FCCADFF006F7FFB46BE7FA002BEFF00AF802BEF
        FA002BC03F69AFF995BFEDEFFF0068D7BFD7807ED35FF32B7FDBDFFED1A00F9F
        E8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00
        28A28A002BE80FD997FE669FFB74FF00DAD5F3FD7D01FB32FF00CCD3FF006E9F
        FB5A803DFE8A28A00F8028A28A0028A28A002BEFFAF802BEFF00A0028A28A002
        8A28A0028A28A0028A28A0028A28A002BC03F69AFF00995BFEDEFF00F68D7BFD
        7807ED35FF0032B7FDBDFF00ED1A00F9FE8A28A00FBFE8A28A0028A28A002BE0
        0AFBFEBE00A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A002BEFF00AF802BEFFA0028A28A0028A28A0028A28A00
        F00FDA6BFE656FFB7BFF00DA35F3FD7D01FB4D7FCCADFF006F7FFB46BE7FA002
        8A28A0028A28A0028A28A0028A28A00FA03F665FF99A7FEDD3FF006B57BFD780
        7ECCBFF334FF00DBA7FED6AF7FA002BE00AFBFEBE00A0028A28A0028A28A00FB
        FE8A28A0028A28A002BE00AFBFEBE00A0028A28A0028A28A0028A28A0028A28A
        0028A28A0028A28A0028A28A0028A28A00FA03F665FF0099A7FEDD3FF6B57BFD
        7807ECCBFF00334FFDBA7FED6AF7FA0028A28A002BC03F69AFF995BFEDEFFF00
        68D7BFD7807ED35FF32B7FDBDFFED1A00F9FE8A28A0028A28A00FA03F665FF00
        99A7FEDD3FF6B57BFD7807ECCBFF00334FFDBA7FED6AF7FA0028A28A0028A28A
        0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
        00F00FF869AFFA947FF2A5FF00DAA8FF00869AFF00A947FF002A5FFDAABE7FA2
        803E80FF00938CFF00A97BFB0BFEDEFCFF003FFEFDEDDBE4FBE7776C727FC332
        FF00D4DDFF0094DFFEDB47ECCBFF00334FFDBA7FED6AF7FA00F00FF8665FFA9B
        BFF29BFF00DB68FF00869AFF00A947FF002A5FFDAABDFEBE00A00FA03FE1A6BF
        EA51FF00CA97FF006AA3FE4E33FEA5EFEC2FFB7BF3FCFF00FBF7B76F93EF9DDD
        B1CFCFF5F407ECCBFF00334FFDBA7FED6A003FE1997FEA6EFF00CA6FFF006DA3
        FE1997FEA6EFFCA6FF00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DA3FE
        1997FEA6EFFCA6FF00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DA3FE19
        97FEA6EFFCA6FF00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DA3FE1997
        FEA6EFFCA6FF00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DA3FE1997FE
        A6EFFCA6FF00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6
        EFFCA6FF00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EF
        FCA6FF00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFC
        A6FF00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6
        FF00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DA3FE4DCFFEA61FEDDFFB
        74F23C8FFBF9BB779DED8DBDF3C7BFD7807ED35FF32B7FDBDFFED1A003FE1A6B
        FEA51FFCA97FF6AA3FE1A6BFEA51FF00CA97FF006AAF9FE8A0028A28A0028A28
        A002BE80FF00869AFF00A947FF002A5FFDAABE7FA2803E80FF00869AFF00A947
        FF002A5FFDAA8FF869AFFA947FF2A5FF00DAABE7FA2803E80FF869AFFA947FF2
        A5FF00DAA8FF00869AFF00A947FF002A5FFDAABE7FA2803E80FF00869AFF00A9
        47FF002A5FFDAA8FF869AFFA947FF2A5FF00DAABE7FA2803EBFF00865F137FE1
        637F6A7FC4A3FB3FEC1E57FCBCF9BBF7EFFF0061718D9EFD6BD02BC03F665FF9
        9A7FEDD3FF006B57BFD0015E01FF000D35FF00528FFE54BFFB557BFD7C01401F
        407FC34D7FD4A3FF00952FFED547FC9C67FD4BDFD85FF6F7E7F9FF00F7EF6EDF
        27DF3BBB639F9FEBE80FD997FE669FFB74FF00DAD4007FC332FF00D4DDFF0094
        DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF4500145145001451450015E01FF00
        0CCBFF005377FE537FFB6D7BFD1401E01FF0CCBFF5377FE537FF00B6D1FF000C
        CBFF005377FE537FFB6D7BFD1401E01FF0CCBFF5377FE537FF00B6D1FF000CCB
        FF005377FE537FFB6D7BFD1401F0051451401E81F0CBE197FC2C6FED4FF89BFF
        0067FD83CAFF00976F377EFDFF00EDAE31B3DFAD7A07FC332FFD4DDFF94DFF00
        EDB47ECCBFF334FF00DBA7FED6AF7FA00F00FF008665FF00A9BBFF0029BFFDB6
        BE7FAFBFEBE00A0028A28A0028A28A0028A28A0028A28A002BEFFAF802BEFF00
        A002BCFF00E26FC4DFF8573FD97FF128FED0FB7F9BFF002F3E56CD9B3FD86CE7
        7FB74AF40AF00FDA6BFE656FFB7BFF00DA34007FC34D7FD4A3FF00952FFED547
        FC34D7FD4A3FF952FF00ED55F3FD1401F7FD1451401E01FB4D7FCCADFF006F7F
        FB46BE7FAFA03F69AFF995BFEDEFFF0068D7CFF40057D01FF0CCBFF5377FE537
        FF00B6D7CFF5F7FD007807FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF00
        94DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF00
        94DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF00
        94DFFEDB5EFF00450079FF00C32F865FF0AE7FB53FE26FFDA1F6FF002BFE5DBC
        AD9B37FF00B6D9CEFF006E95E8145140057C015F7FD7C0140057A07C32F865FF
        000B1BFB53FE26FF00D9FF0060F2BFE5DBCDDFBF7FFB6B8C6CF7EB5E7F5F407E
        CCBFF334FF00DBA7FED6A003FE1997FEA6EFFCA6FF00F6DA3FE1997FEA6EFF00
        CA6FFF006DAF7FA2803C03FE1A6BFEA51FFCA97FF6AA3FE1A6BFEA51FF00CA97
        FF006AAF9FE8A00FAFFE197C4DFF00858DFDA9FF00128FECFF00B0795FF2F3E6
        EFDFBFFD85C6367BF5AF40AF00FD997FE669FF00B74FFDAD5EFF0040057807FC
        332FFD4DDFF94DFF00EDB5EFF45007807FC332FF00D4DDFF0094DFFEDB47FC33
        2FFD4DDFF94DFF00EDB5EFF45007807FC332FF00D4DDFF0094DFFEDB47FC332F
        FD4DDFF94DFF00EDB5EFF45007807FC332FF00D4DDFF0094DFFEDB47FC332FFD
        4DDFF94DFF00EDB5EFF45007807FC332FF00D4DDFF0094DFFEDB47FC332FFD4D
        DFF94DFF00EDB5EFF45007807FC332FF00D4DDFF0094DFFEDB5F3FD7DFF5F005
        0014514500145145007D01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE5
        37FF00B6D7BFD1401E01FF0026E7FF00530FF6EFFDBA791E47FDFCDDBBCEF6C6
        DEF9E0FF00869AFF00A947FF002A5FFDAA8FDA6BFE656FFB7BFF00DA35F3FD00
        7D01FF000D35FF00528FFE54BFFB557BFD7C015F7FD0015E7FF137E197FC2C6F
        ECBFF89BFF0067FD83CDFF00976F377EFD9FEDAE31B3DFAD7A051401E01FF0CC
        BFF5377FE537FF00B6D1FF000CCBFF005377FE537FFB6D7BFD1401F005145140
        1F407ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFDAD5EFF0040
        0514514005145140051451400514514005145140051451400514514005145140
        05145140051451401F0051451401F407ECCBFF00334FFDBA7FED6AF7FAF8028A
        00FBFEBE00A28A002BE80FD997FE669FFB74FF00DAD5F3FD1401F7FD15F00514
        01F7FD1451400515E01FB4D7FCCADFF6F7FF00B46BE7FA00FBFE8AF8028A00FB
        FE8AF802BE80FD997FE669FF00B74FFDAD401EFF004514500145145001457807
        ED35FF0032B7FDBDFF00ED1AF9FE803EFF00A2BE00AFBFE800AF00FDA6BFE656
        FF00B7BFFDA35EFF005E01FB4D7FCCADFF006F7FFB46803E7FA28A2800A2BEFF
        00A2803E00A2BE80FDA6BFE656FF00B7BFFDA35F3FD001451450014514500145
        145001457DFF0045007807ECCBFF00334FFDBA7FED6AF7FA28A002BE00AFBFE8
        A00F802BE80FD997FE669FFB74FF00DAD5EFF5E01FB4D7FCCADFF6F7FF00B468
        03DFE8AF8028A00FBFE8AF8028A00FBFE8AF8028A00FBFE8AF8028A00FBFE8AF
        802BE80FD997FE669FFB74FF00DAD401EFF45145007C01457DFF0045007807EC
        CBFF00334FFDBA7FED6AF7FAF00FDA6BFE656FFB7BFF00DA35F3FD007DFF005F
        00515F7FD007C01457DFF5E01FB4D7FCCADFF6F7FF00B46803E7FA28A2800A2B
        EFFA2803E00A2BE80FDA6BFE656FFB7BFF00DA35F3FD0015F7FD7C0145007DFF
        005E01FB4D7FCCADFF006F7FFB46BE7FA2800A28A2803EFF00A28A2803C03F69
        AFF995BFEDEFFF0068D7CFF5F407ED35FF0032B7FDBDFF00ED1AF9FE800AFBFE
        BE00AFBFE800A28AF00FDA6BFE656FFB7BFF00DA3401EFF457C0145007DFF457
        C0145007DFF457C0145007DFF5F00515F7FD007C015F407ECCBFF334FF00DBA7
        FED6AF7FA2800A28A2803E00A28A2803E80FD997FE669FFB74FF00DAD5EFF5F0
        051401F7FD15F0057DFF004005145140051451400515F0051401F7FD15F00514
        01F7FD7C0145140051457D01FB32FF00CCD3FF006E9FFB5A803E7FA2BEFF00A2
        800A28A2803C03F69AFF00995BFEDEFF00F68D7CFF005F7FD1401F0057DFF457
        C01401F7FD15F0057D01FB32FF00CCD3FF006E9FFB5A803DFE8A28A00F8028A2
        8A00FA03F665FF0099A7FEDD3FF6B57BFD7807ECCBFF00334FFDBA7FED6AF7FA
        0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
        0028A28A0028A28A00F8028A28A0028AF40F865F0CBFE1637F6A7FC4DFFB3FEC
        1E57FCBB79BBF7EFFF006D718D9EFD6BD03FE1997FEA6EFF00CA6FFF006DA00F
        9FE8AFA03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DA00F9
        FE8AFA03FE1997FEA6EFFCA6FF00F6DAF3FF0089BF0CBFE15CFF0065FF00C4DF
        FB43EDFE6FFCBB795B366CFF006DB39DFEDD2803CFE8A28A00FBFE8AF00FF869
        AFFA947FF2A5FF00DAA8FF00869AFF00A947FF002A5FFDAA800FDA6BFE656FFB
        7BFF00DA35F3FD7D01FF002719FF0052F7F617FDBDF9FE7FFDFBDBB7C9F7CEEE
        D8E4FF008665FF00A9BBFF0029BFFDB6803E7FA2BE80FF008665FF00A9BBFF00
        29BFFDB68FF8665FFA9BBFF29BFF00DB6803E7FAFA03F665FF0099A7FEDD3FF6
        B51FF0CCBFF5377FE537FF00B6D1FF0026E7FF00530FF6EFFDBA791E47FDFCDD
        BBCEF6C6DEF9E003DFE8AF00FF00869AFF00A947FF002A5FFDAA8FF869AFFA94
        7FF2A5FF00DAA803DFE8AF00FF00869AFF00A947FF002A5FFDAA8FF869AFFA94
        7FF2A5FF00DAA800FDA6BFE656FF00B7BFFDA35F3FD7D01FF2719FF52F7F617F
        DBDF9FE7FF00DFBDBB7C9F7CEEED8E4FF8665FFA9BBFF29BFF00DB6803E7FAFB
        FEBC03FE1997FEA6EFFCA6FF00F6DA3FE1A6BFEA51FF00CA97FF006AA00F7FAF
        00FDA6BFE656FF00B7BFFDA347FC34D7FD4A3FF952FF00ED55E7FF00137E26FF
        00C2C6FECBFF008947F67FD83CDFF979F377EFD9FEC2E31B3DFAD0079FD14514
        01F7FD1451401E01FB4D7FCCADFF006F7FFB46BE7FAFA03F69AFF995BFEDEFFF
        0068D7CFF40051457D01FF000CCBFF005377FE537FFB6D007CFF00457D01FF00
        0CCBFF005377FE537FFB6D1FF0CCBFF5377FE537FF00B6D007CFF457D01FF0CC
        BFF5377FE537FF00B6D1FF000CCBFF005377FE537FFB6D007BFD15E01FF0D35F
        F528FF00E54BFF00B551FF000D35FF00528FFE54BFFB55007BFD15E01FF0D35F
        F528FF00E54BFF00B551FF000D35FF00528FFE54BFFB55007BFD15E01FF0D35F
        F528FF00E54BFF00B551FF000D35FF00528FFE54BFFB55007BFD7807ED35FF00
        32B7FDBDFF00ED1A3FE1A6BFEA51FF00CA97FF006AA3FE4E33FEA5EFEC2FFB7B
        F3FCFF00FBF7B76F93EF9DDDB1C807CFF457D01FF0CCBFF5377FE537FF00B6D1
        FF000CCBFF005377FE537FFB6D007CFF004514500145145001451450015F407E
        CCBFF334FF00DBA7FED6AF9FEBD03E197C4DFF008573FDA9FF00128FED0FB7F9
        5FF2F3E56CD9BFFD86CE77FB74A00FAFE8AF00FF00869AFF00A947FF002A5FFD
        AA8FF869AFFA947FF2A5FF00DAA803DFE8A28A00F00FDA6BFE656FFB7BFF00DA
        35F3FD7D7FF137E197FC2C6FECBFF89BFF0067FD83CDFF00976F377EFD9FEDAE
        31B3DFAD701FF0CCBFF5377FE537FF00B6D007CFF5F7FD7807FC332FFD4DDFF9
        4DFF00EDB5EFF40057807ED35FF32B7FDBDFFED1AF7FAF00FDA6BFE656FF00B7
        BFFDA3401F3FD1451401F7FD1451401E01FB4D7FCCADFF006F7FFB46BE7FAFAF
        FE26FC32FF00858DFD97FF00137FECFF00B079BFF2EDE6EFDFB3FDB5C6367BF5
        AE03FE1997FEA6EFFCA6FF00F6DA00F9FE8AFA03FE1997FEA6EFFCA6FF00F6DA
        3FE1997FEA6EFF00CA6FFF006DA00F9FE8AFA03FE1997FEA6EFF00CA6FFF006D
        AF3FF89BF0CBFE15CFF65FFC4DFF00B43EDFE6FF00CBB795B366CFF6DB39DFED
        D2803CFE8A28A00FBFE8A28A00F00FDA6BFE656FFB7BFF00DA35F3FD7D01FB4D
        7FCCADFF006F7FFB46BE7FA002BEFF00AF802BE80FF869AFFA947FF2A5FF00DA
        A803DFEBC03F69AFF995BFEDEFFF0068D1FF000D35FF00528FFE54BFFB551FF2
        719FF52F7F617FDBDF9FE7FF00DFBDBB7C9F7CEEED8E403E7FA2BE80FF008665
        FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29BFF00DB6803E7FA28A2800A2BD0
        3E197C32FF00858DFDA9FF00137FECFF00B0795FF2EDE6EFDFBFFDB5C6367BF5
        AF40FF008665FF00A9BBFF0029BFFDB6803E7FAFBFEBC03FE1997FEA6EFF00CA
        6FFF006DA3FE1A6BFEA51FFCA97FF6AA00F7FA2BC03FE1A6BFEA51FF00CA97FF
        006AAEFF00E197C4DFF858DFDA9FF128FECFFB0795FF002F3E6EFDFBFF00D85C
        6367BF5A00F40A28A2803E00A28A2800A28A2800AFBFEBE00AFA03FE1A6BFEA5
        1FFCA97FF6AA00F7FA2BC03FE1A6BFEA51FF00CA97FF006AA3FE1A6BFEA51FFC
        A97FF6AA00F7FA2BC03FE1A6BFEA51FF00CA97FF006AA3FE1A6BFEA51FFCA97F
        F6AA00F9FE8A28A0028AF40F865F0CBFE1637F6A7FC4DFFB3FEC1E57FCBB79BB
        F7EFFF006D718D9EFD6BD03FE1997FEA6EFF00CA6FFF006DA00F9FE8AFA03FE1
        997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DA00F9FEBE80FD997F
        E669FF00B74FFDAD47FC332FFD4DDFF94DFF00EDB5DFFC32F865FF000AE7FB53
        FE26FF00DA1F6FF2BFE5DBCAD9B37FFB6D9CEFF6E9401E8145145001457807FC
        34D7FD4A3FF952FF00ED547FC34D7FD4A3FF00952FFED5401EFF00457807FC34
        D7FD4A3FF952FF00ED547FC34D7FD4A3FF00952FFED5401EFF005F0057D01FF0
        D35FF528FF00E54BFF00B551FF000CCBFF005377FE537FFB6D007CFF005F407E
        CCBFF334FF00DBA7FED6A3FE1997FEA6EFFCA6FF00F6DA3FE4DCFF00EA61FEDD
        FF00B74F23C8FF00BF9BB779DED8DBDF3C007BFD15E01FF0D35FF528FF00E54B
        FF00B551FF000D35FF00528FFE54BFFB55007CFF0045145007D01FB32FFCCD3F
        F6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD0014514500145145001
        4514500145145001451450014514500145145001451450014514500145145007
        C0145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD3F
        F6B57BFD001451450015E01FB4D7FCCADFF6F7FF00B46BDFEBC03F69AFF995BF
        EDEFFF0068D007CFF4514500145145007D01FB32FF00CCD3FF006E9FFB5ABDFE
        BC03F665FF0099A7FEDD3FF6B57BFD001451450015E01FB4D7FCCADFF6F7FF00
        B46BDFEBC03F69AFF995BFEDEFFF0068D007CFF4514500145145007D01FB32FF
        00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD3FF6B57BFD0015F0057DFF
        005F0050014514500145145007DFF45145007807ED35FF0032B7FDBDFF00ED1A
        F9FEBE80FDA6BFE656FF00B7BFFDA35F3FD0015F7FD7C015F7FD001451450014
        5145007C014514500145145001451450015F407ECCBFF334FF00DBA7FED6AF9F
        EBE80FD997FE669FFB74FF00DAD401EFF45145007C0145145001451450014514
        50014514500145145007DFF4514500145145001451450015E01FB4D7FCCADFF6
        F7FF00B46BDFEBC03F69AFF995BFEDEFFF0068D007CFF45145007DFF00451450
        0145145001451450015E01FB4D7FCCADFF006F7FFB46BDFEBC03F69AFF00995B
        FEDEFF00F68D007CFF0045145007DFF45145007807ED35FF0032B7FDBDFF00ED
        1AF9FEBE80FDA6BFE656FF00B7BFFDA35F3FD001451450015F407ECCBFF334FF
        00DBA7FED6AF9FEBE80FD997FE669FFB74FF00DAD401EFF45145007C01451450
        07D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD001
        5F0057DFF5F0050015F407ECCBFF00334FFDBA7FED6AF9FEBE80FD997FE669FF
        00B74FFDAD401EFF0045145007C0145145001451450014514500145145001451
        4500145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD
        3FF6B57BFD001451450014514500145145007C0145145001451450015F7FD7C0
        15F7FD0015E01FB4D7FCCADFF6F7FF00B46BDFEBC03F69AFF995BFEDEFFF0068
        D007CFF4514500145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF
        0099A7FEDD3FF6B57BFD00145145001451450014514500145145001451450014
        514500145145001451450014514500145145007C0145145007D01FB32FFCCD3F
        F6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD001451450015E01FB4D
        7FCCADFF006F7FFB46BDFEBC03F69AFF00995BFEDEFF00F68D007CFF00451450
        07DFF45145007807ED35FF0032B7FDBDFF00ED1AF9FEBE80FDA6BFE656FF00B7
        BFFDA35F3FD001451450015F407ECCBFF334FF00DBA7FED6AF9FEBE80FD997FE
        669FFB74FF00DAD401EFF45145007C0145145001451450015F7FD7C015F7FD00
        15E01FB4D7FCCADFF6F7FF00B46BDFEBC03F69AFF995BFEDEFFF0068D007CFF4
        514500145145001451450015F7FD7C015F7FD0015E01FB4D7FCCADFF006F7FFB
        46BDFEBC03F69AFF00995BFEDEFF00F68D007CFF0045145007DFF45145007807
        ED35FF0032B7FDBDFF00ED1AF9FEBE80FDA6BFE656FF00B7BFFDA35F3FD0015F
        7FD7C015F7FD0014514500145145007C0145145007D01FB32FFCCD3FF6E9FF00
        B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD0015F0057DFF5F0050015F407EC
        CBFF00334FFDBA7FED6AF9FEBE80FD997FE669FF00B74FFDAD401EFF00451450
        07C014514500145145001451450015F407ECCBFF00334FFDBA7FED6AF9FEBE80
        FD997FE669FF00B74FFDAD401EFF004514500145145001451450015F0057DFF5
        F0050014514500145145007DFF004514500145145001451450015E01FB4D7FCC
        ADFF006F7FFB46BDFEBC03F69AFF00995BFEDEFF00F68D007CFF004514500145
        145001451450015F7FD7C015F7FD0015E01FB4D7FCCADFF6F7FF00B46BDFEBC0
        3F69AFF995BFEDEFFF0068D007CFF4514500145145001451450015F7FD7C015F
        7FD0014514500145145007C0145145007D01FB32FF00CCD3FF006E9FFB5ABDFE
        BC03F665FF0099A7FEDD3FF6B57BFD0015F0057DFF005F0050015F407ECCBFF3
        34FF00DBA7FED6AF9FEBE80FD997FE669FFB74FF00DAD401EFF4514500145145
        007807ED35FF0032B7FDBDFF00ED1AF9FEBE80FDA6BFE656FF00B7BFFDA35F3F
        D001451450015F407ECCBFF334FF00DBA7FED6AF9FEBE80FD997FE669FFB74FF
        00DAD401EFF45145007C0145145007D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F
        665FF99A7FEDD3FF006B57BFD001451450014514500145145001451450014514
        50014514500145145001451450014514500145145007807FC332FF00D4DDFF00
        94DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF45007807FC9B9FF00D4C3FDBBFF
        006E9E4791FF007F376EF3BDB1B7BE783FE1A6BFEA51FF00CA97FF006AA3F69A
        FF00995BFEDEFF00F68D7CFF00401F407FC34D7FD4A3FF00952FFED547FC34D7
        FD4A3FF952FF00ED55F3FD1401F407FC34D7FD4A3FF952FF00ED547FC9C67FD4
        BDFD85FF006F7E7F9FFF007EF6EDF27DF3BBB639F9FEBE80FD997FE669FF00B7
        4FFDAD4007FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094DFFEDB5EFF
        004500145145007807ED35FF0032B7FDBDFF00ED1AF9FEBE80FDA6BFE656FF00
        B7BFFDA35F3FD0015F407FC332FF00D4DDFF0094DFFEDB5F3FD7DFF401E01FF0
        CCBFF5377FE537FF00B6D1FF0026E7FF00530FF6EFFDBA791E47FDFCDDBBCEF6
        C6DEF9E3DFEBC03F69AFF995BFEDEFFF0068D001FF000D35FF00528FFE54BFFB
        551FF0D35FF528FF00E54BFF00B557CFF4500145145001451450015F407FC34D
        7FD4A3FF00952FFED55F3FD1401F407FC34D7FD4A3FF00952FFED55E7FF137E2
        6FFC2C6FECBFF8947F67FD83CDFF00979F377EFD9FEC2E31B3DFAD79FD140051
        451401F407FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094DFFEDB5EFF
        0045007807FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094DFFEDB5EFF
        0045007807FC332FFD4DDFF94DFF00EDB47FC34D7FD4A3FF00952FFED55EFF00
        5F005007D01FF0D35FF528FF00E54BFF00B551FF002719FF0052F7F617FDBDF9
        FE7FFDFBDBB7C9F7CEEED8E7E7FAFA03F665FF0099A7FEDD3FF6B5001FF0CCBF
        F5377FE537FF00B6D1FF000CCBFF005377FE537FFB6D7BFD140051451401E7FF
        00137E197FC2C6FECBFF0089BFF67FD83CDFF976F377EFD9FEDAE31B3DFAD701
        FF000CCBFF005377FE537FFB6D7BFD1401E01FF0CCBFF5377FE537FF00B6D1FF
        000D35FF00528FFE54BFFB557BFD7C01401F407FC34D7FD4A3FF00952FFED547
        FC34D7FD4A3FF952FF00ED55F3FD1401F407FC34D7FD4A3FF952FF00ED547FC3
        4D7FD4A3FF00952FFED55F3FD140051451401E81F0CBE26FFC2B9FED4FF8947F
        687DBFCAFF00979F2B66CDFF00EC3673BFDBA57A07FC34D7FD4A3FF952FF00ED
        55F3FD1401F407FC34D7FD4A3FF952FF00ED547FC332FF00D4DDFF0094DFFEDB
        5F3FD7DFF401E01FF0CCBFF5377FE537FF00B6D77FF0CBE197FC2B9FED4FF89B
        FF00687DBFCAFF00976F2B66CDFF00EDB673BFDBA57A05140051451401F00514
        514005145140057D01FF000CCBFF005377FE537FFB6D7CFF005F7FD007807FC3
        32FF00D4DDFF0094DFFEDB5DFF00C32F865FF0AE7FB53FE26FFDA1F6FF002BFE
        5DBCAD9B37FF00B6D9CEFF006E95E814500145145007807FC34D7FD4A3FF0095
        2FFED547FC34D7FD4A3FF952FF00ED55F3FD1401F407FC34D7FD4A3FF952FF00
        ED547FC34D7FD4A3FF00952FFED55F3FD1401F407FC34D7FD4A3FF00952FFED5
        5F3FD1450015E81F0CBE197FC2C6FED4FF0089BFF67FD83CAFF976F377EFDFFE
        DAE31B3DFAD79FD7D01FB32FFCCD3FF6E9FF00B5A800FF008665FF00A9BBFF00
        29BFFDB68FF8665FFA9BBFF29BFF00DB6BDFE8A00F00FF00869AFF00A947FF00
        2A5FFDAA8FF869AFFA947FF2A5FF00DAABE7FA2803E80FF869AFFA947FF2A5FF
        00DAA8FF00869AFF00A947FF002A5FFDAABE7FA2803E80FF00869AFF00A947FF
        002A5FFDAABDFEBE00AFBFE800AF3FF89BF0CBFE1637F65FFC4DFF00B3FEC1E6
        FF00CBB79BBF7ECFF6D718D9EFD6BD028A00F00FF8665FFA9BBFF29BFF00DB68
        FF008665FF00A9BBFF0029BFFDB6BDFE8A00F00FF8665FFA9BBFF29BFF00DB68
        FF008665FF00A9BBFF0029BFFDB6BDFE8A00F00FF8665FFA9BBFF29BFF00DB68
        FF008665FF00A9BBFF0029BFFDB6BDFE8A00F00FF8665FFA9BBFF29BFF00DB6B
        DFE8A2800AF3FF0089BF0CBFE1637F65FF00C4DFFB3FEC1E6FFCBB79BBF7ECFF
        006D718D9EFD6BD028A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9B
        BFF29BFF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9B
        BFF29BFF00DB6BDFE8A00F903E26FC32FF008573FD97FF00137FED0FB7F9BFF2
        EDE56CD9B3FDB6CE77FB74AF3FAFA03F69AFF995BFEDEFFF0068D7CFF40057DF
        F5F0057DFF00400579FF00C4DF89BFF0AE7FB2FF00E251FDA1F6FF0037FE5E7C
        AD9B367FB0D9CEFF006E95E815E01FB4D7FCCADFF6F7FF00B46800FF00869AFF
        00A947FF002A5FFDAA8FF869AFFA947FF2A5FF00DAABE7FA2800A28A2803E80F
        D997FE669FFB74FF00DAD5EFF5E01FB32FFCCD3FF6E9FF00B5ABDFE800AF802B
        EFFAF802800AFA03F665FF0099A7FEDD3FF6B57CFF005F407ECCBFF334FF00DB
        A7FED6A00F7FA28A2800A28A2803CFFE26FC32FF00858DFD97FF00137FECFF00
        B079BFF2EDE6EFDFB3FDB5C6367BF5AE03FE1997FEA6EFFCA6FF00F6DAF7FA28
        03C03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DAF7FA2803
        C03FE1997FEA6EFF00CA6FFF006DAEFF00E197C32FF8573FDA9FF137FED0FB7F
        95FF002EDE56CD9BFF00DB6CE77FB74AF40A2800A28A2803E00A28A2803E80FD
        997FE669FF00B74FFDAD5EFF005E01FB32FF00CCD3FF006E9FFB5ABDFE800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2803C03F69AFF00995BFEDEFF00F68D7CFF005F7FD1401F
        00515F7FD1401F0057D01FB32FFCCD3FF6E9FF00B5ABDFE8A0028A28A0028AF8
        028A00FA03F69AFF00995BFEDEFF00F68D7CFF005F407ECCBFF334FF00DBA7FE
        D6AF7FA00F802BEFFA2BE00A00FBFEBC03F69AFF00995BFEDEFF00F68D7CFF00
        5F407ECCBFF334FF00DBA7FED6A00F9FE8AFBFE8A00F8028AFBFE8A00F8028AF
        A03F69AFF995BFEDEFFF0068D7CFF40051457DFF00401F00515F7FD1401F0051
        5F7FD1400515F0051401F7FD15E01FB32FFCCD3FF6E9FF00B5ABDFE800AF802B
        EFFAF802800AFA03F665FF0099A7FEDD3FF6B57CFF005F407ECCBFF334FF00DB
        A7FED6A00F7FA28A2800A28A2800A2BC03F69AFF00995BFEDEFF00F68D7CFF00
        401F7FD7C01457DFF401F00515F7FD7807ED35FF0032B7FDBDFF00ED1A00F9FE
        8A28A0028AFBFE8A00F8028AFA03F69AFF00995BFEDEFF00F68D7CFF0040057D
        FF005F0057DFF40051457807ED35FF0032B7FDBDFF00ED1A00F7FA2BE00A2800
        A28A2800A2BE80FD997FE669FF00B74FFDAD5EFF00401F0057DFF45140051457
        807ED35FF32B7FDBDFFED1A00F7FA2BE00A2800A28A2800A2BE80FD997FE669F
        FB74FF00DAD5EFF401F00515F7FD1401F0057D01FB32FF00CCD3FF006E9FFB5A
        BDFE8A0028A28A00F8028AFBFE8A00F8028AFA03F69AFF00995BFEDEFF00F68D
        7CFF0040057DFF005F0051401F7FD15F0051401F7FD15F0051401F7FD15F0051
        401F7FD15F0051401F7FD15F0057DFF400514514005145140051451401E01FB4
        D7FCCADFF6F7FF00B46BE7FAFBFE8A00F802BEFF00A28A002BC03F69AFF995BF
        EDEFFF0068D7BFD7807ED35FF32B7FDBDFFED1A00F9FE8A28A0028A28A00FA03
        F665FF0099A7FEDD3FF6B57BFD7C0145007DFF005F00515F7FD007C015F407EC
        CBFF00334FFDBA7FED6AF7FAF00FDA6BFE656FFB7BFF00DA3401EFF457C01450
        07DFF4514500145145001451450014514500145145007C01457DFF0045007807
        ECCBFF00334FFDBA7FED6AF7FA28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028AF00FF869AFFA94
        7FF2A5FF00DAA8FF00869AFF00A947FF002A5FFDAA803DFE8AF00FF869AFFA94
        7FF2A5FF00DAA8FF00869AFF00A947FF002A5FFDAA803DFE8AF00FF869AFFA94
        7FF2A5FF00DAABDFE800A28A2800A28A2803E00A28A2803E80FD997FE669FF00
        B74FFDAD5EFF005F207C32F89BFF000AE7FB53FE251FDA1F6FF2BFE5E7CAD9B3
        7FFB0D9CEFF6E95E81FF000D35FF00528FFE54BFFB55007BFD7C015F407FC34D
        7FD4A3FF00952FFED547FC332FFD4DDFF94DFF00EDB401F3FD7D01FB32FF00CC
        D3FF006E9FFB5A8FF8665FFA9BBFF29BFF00DB68FF009373FF00A987FB77FEDD
        3C8F23FEFE6EDDE77B636F7CF001EFF457807FC34D7FD4A3FF00952FFED547FC
        34D7FD4A3FF952FF00ED5401EFF45145007807ED35FF0032B7FDBDFF00ED1AF9
        FEBE80FDA6BFE656FF00B7BFFDA35F3FD0015F7FD7C015F407FC34D7FD4A3FF9
        52FF00ED5401EFF457807FC34D7FD4A3FF00952FFED547FC34D7FD4A3FF952FF
        00ED5401EFF457807FC34D7FD4A3FF00952FFED547FC34D7FD4A3FF952FF00ED
        5401F3FD15F407FC332FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094DFFEDB
        4007ECCBFF00334FFDBA7FED6AF7FAF00FF9373FFA987FB77FEDD3C8F23FEFE6
        EDDE77B636F7CF07FC34D7FD4A3FF952FF00ED5401EFF5F0057D01FF000D35FF
        00528FFE54BFFB551FF0CCBFF5377FE537FF00B6D007CFF5F407ECCBFF00334F
        FDBA7FED6A3FE1997FEA6EFF00CA6FFF006DA3FE4DCFFEA61FEDDFFB74F23C8F
        FBF9BB779DED8DBDF3C007BFD15E01FF000D35FF00528FFE54BFFB551FF0D35F
        F528FF00E54BFF00B55007BFD1451401E01FB4D7FCCADFF6F7FF00B46BE7FAFA
        FF00E26FC32FF858DFD97FF137FECFFB079BFF002EDE6EFDFB3FDB5C6367BF5A
        E03FE1997FEA6EFF00CA6FFF006DA00F9FEBEFFAF00FF8665FFA9BBFF29BFF00
        DB68FF00869AFF00A947FF002A5FFDAA803DFEBC03F69AFF00995BFEDEFF00F6
        8D1FF0D35FF528FF00E54BFF00B551FF002719FF0052F7F617FDBDF9FE7FFDFB
        DBB7C9F7CEEED8E403E7FA2BE80FF8665FFA9BBFF29BFF00DB68FF008665FF00
        A9BBFF0029BFFDB6803DFE8A28A00F00FDA6BFE656FF00B7BFFDA35F3FD7D7FF
        00137E197FC2C6FECBFF0089BFF67FD83CDFF976F377EFD9FEDAE31B3DFAD701
        FF000CCBFF005377FE537FFB6D007CFF005F7FD7807FC332FF00D4DDFF0094DF
        FEDB5EFF0040057807ED35FF0032B7FDBDFF00ED1AF7FAF3FF0089BF0CBFE163
        7F65FF00C4DFFB3FEC1E6FFCBB79BBF7ECFF006D718D9EFD6803E40A2BE80FF8
        665FFA9BBFF29BFF00DB68FF008665FF00A9BBFF0029BFFDB6803E7FA2BE80FF
        008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29BFF00DB6800FD997FE669
        FF00B74FFDAD5EFF005E7FF0CBE197FC2B9FED4FF89BFF00687DBFCAFF00976F
        2B66CDFF00EDB673BFDBA57A050014515E01FF000D35FF00528FFE54BFFB5500
        7BFD7807ED35FF0032B7FDBDFF00ED1A3FE1A6BFEA51FF00CA97FF006AAF3FF8
        9BF137FE1637F65FFC4A3FB3FEC1E6FF00CBCF9BBF7ECFF61718D9EFD6803CFE
        8A28A0028A28A00FA03F665FF99A7FEDD3FF006B57BFD7807ECCBFF334FF00DB
        A7FED6AF7FA0028A28A0028A28A0028A28A0028A28A00F00FDA6BFE656FF00B7
        BFFDA35F3FD7D7FF00137E197FC2C6FECBFF0089BFF67FD83CDFF976F377EFD9
        FEDAE31B3DFAD701FF000CCBFF005377FE537FFB6D007CFF00457D01FF000CCB
        FF005377FE537FFB6D1FF0CCBFF5377FE537FF00B6D007CFF457D01FF0CCBFF5
        377FE537FF00B6D79FFC4DF865FF000AE7FB2FFE26FF00DA1F6FF37FE5DBCAD9
        B367FB6D9CEFF6E9401E7F4514500145145001451450015F7FD7C015F407FC34
        D7FD4A3FF952FF00ED5401EFF457807FC34D7FD4A3FF00952FFED55DFF00C32F
        89BFF0B1BFB53FE251FD9FF60F2BFE5E7CDDFBF7FF00B0B8C6CF7EB401E81451
        45001451450014579FFC4DF89BFF000AE7FB2FFE251FDA1F6FF37FE5E7CAD9B3
        67FB0D9CEFF6E95C07FC34D7FD4A3FF952FF00ED5401EFF457807FC34D7FD4A3
        FF00952FFED547FC34D7FD4A3FF952FF00ED5401EFF5E01FB4D7FCCADFF6F7FF
        00B468FF00869AFF00A947FF002A5FFDAA8FF938CFFA97BFB0BFEDEFCFF3FF00
        EFDEDDBE4FBE7776C7201F3FD15F407FC332FF00D4DDFF0094DFFEDB47FC332F
        FD4DDFF94DFF00EDB401F3FD15F407FC332FFD4DDFF94DFF00EDB47FC332FF00
        D4DDFF0094DFFEDB401F3FD15E81F137E197FC2B9FECBFF89BFF00687DBFCDFF
        00976F2B66CD9FEDB673BFDBA579FD0015F7FD7C015F7FD0015E01FB4D7FCCAD
        FF006F7FFB46BDFEBC03F69AFF00995BFEDEFF00F68D007CFF0045145007DFF4
        57807FC34D7FD4A3FF00952FFED547FC34D7FD4A3FF952FF00ED5401EFF4579F
        FC32F89BFF000B1BFB53FE251FD9FF0060F2BFE5E7CDDFBF7FFB0B8C6CF7EB5E
        8140051457807FC34D7FD4A3FF00952FFED5401EFF00457807FC34D7FD4A3FF9
        52FF00ED55DFFC32F89BFF000B1BFB53FE251FD9FF0060F2BFE5E7CDDFBF7FFB
        0B8C6CF7EB401E8145145001457807FC34D7FD4A3FF952FF00ED547FC34D7FD4
        A3FF00952FFED5401EFF004579FF00C32F89BFF0B1BFB53FE251FD9FF60F2BFE
        5E7CDDFBF7FF00B0B8C6CF7EB5E8140051451400514514005145140051451400
        514514005145140051451400514514005145140051451401F005145140051451
        40057DFF005F0057DFF4005145140051451401F00514514005145140057DFF00
        5F0057DFF40057807ED35FF32B7FDBDFFED1AF7FAF00FDA6BFE656FF00B7BFFD
        A3401F3FD1451401F7FD1451401E01FB4D7FCCADFF006F7FFB46BE7FAFA03F69
        AFF995BFEDEFFF0068D7CFF400514514005145140051451401F7FD1451401E01
        FB4D7FCCADFF006F7FFB46BE7FAFA03F69AFF995BFEDEFFF0068D7CFF40057DF
        F5F0057DFF0040057807ED35FF0032B7FDBDFF00ED1AF7FAF00FDA6BFE656FFB
        7BFF00DA3401F3FD1451401F7FD14514005145140057C015F7FD7C0140057D01
        FB32FF00CCD3FF006E9FFB5ABE7FAFA03F665FF99A7FEDD3FF006B5007BFD145
        14005145140051451400514514005145140051451400514514005145140057C0
        15F7FD7C01400514514005145140051451401F407ECCBFF334FF00DBA7FED6AF
        7FAF00FD997FE669FF00B74FFDAD5EFF00400514514005145140051451400514
        51400514514005145140057807ED35FF0032B7FDBDFF00ED1AF7FAF00FDA6BFE
        656FFB7BFF00DA3401F3FD145140051451400514514005145140057D01FB32FF
        00CCD3FF006E9FFB5ABE7FAFA03F665FF99A7FEDD3FF006B5007BFD145140051
        451401E01FB4D7FCCADFF6F7FF00B46BE7FAFA03F69AFF00995BFEDEFF00F68D
        7CFF004005145140057D01FB32FF00CCD3FF006E9FFB5ABE7FAFA03F665FF99A
        7FEDD3FF006B5007BFD145140051451401E01FB4D7FCCADFF6F7FF00B46BE7FA
        FA03F69AFF00995BFEDEFF00F68D7CFF0040057DFF005F0057DFF40057807ED3
        5FF32B7FDBDFFED1AF7FAF00FDA6BFE656FF00B7BFFDA3401F3FD14514005145
        1401F407ECCBFF00334FFDBA7FED6AF7FAF00FD997FE669FFB74FF00DAD5EFF4
        0057C015F7FD7C0140057D01FB32FF00CCD3FF006E9FFB5ABE7FAFA03F665FF9
        9A7FEDD3FF006B5007BFD1451401F0051451401F407ECCBFF334FF00DBA7FED6
        AF7FAF00FD997FE669FF00B74FFDAD5EFF004005145140051451400514514005
        145140051451400514514005145140051451400514514005145140051451401E
        01FB4D7FCCADFF006F7FFB46BE7FAFA03F69AFF995BFEDEFFF0068D7CFF40057
        DFF5F0057DFF0040057807ED35FF0032B7FDBDFF00ED1AF7FAF00FDA6BFE656F
        FB7BFF00DA3401F3FD145140051451401F407ECCBFF334FF00DBA7FED6AF7FAF
        00FD997FE669FF00B74FFDAD5EFF0040057C015F7FD7C0140057D01FB32FFCCD
        3FF6E9FF00B5ABE7FAFA03F665FF0099A7FEDD3FF6B5007BFD14514005145140
        05145140051451400514514005145140051451400514514005145140057807ED
        35FF0032B7FDBDFF00ED1AF7FAF00FDA6BFE656FFB7BFF00DA3401F3FD145140
        1F7FD1451400514514005145140057807ED35FF32B7FDBDFFED1AF7FAF00FDA6
        BFE656FF00B7BFFDA3401F3FD145140051451401F407ECCBFF00334FFDBA7FED
        6AF7FAF00FD997FE669FFB74FF00DAD5EFF40057C015F7FD7C01400514514005
        1451401F7FD14514005145140057C015F7FD7C0140057D01FB32FF00CCD3FF00
        6E9FFB5ABE7FAFA03F665FF99A7FEDD3FF006B5007BFD1451401F0051451401F
        407ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFDAD5EFF004005
        7C015F7FD7C01400514514005145140051451401F407ECCBFF00334FFDBA7FED
        6AF7FAF00FD997FE669FFB74FF00DAD5EFF40057C015F7FD7C0140057D01FB32
        FF00CCD3FF006E9FFB5ABE7FAFA03F665FF99A7FEDD3FF006B5007BFD1451401
        F0051451401F407ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFD
        AD5EFF004005145140057807ED35FF0032B7FDBDFF00ED1AF7FAF00FDA6BFE65
        6FFB7BFF00DA3401F3FD1451400514514005145140057DFF005F0057DFF40051
        45140051451400514514005145140057C015F7FD7C014005145140051451401F
        7FD1451400514514005145140057807ED35FF32B7FDBDFFED1AF7FAF00FDA6BF
        E656FF00B7BFFDA3401F3FD145140051451401F407ECCBFF00334FFDBA7FED6A
        F7FAF00FD997FE669FFB74FF00DAD5EFF4005145140051451400514514005145
        140051451400514514005145140051451400514514005145140051451401E01F
        B4D7FCCADFF6F7FF00B46BE7FAFA03F69AFF00995BFEDEFF00F68D7CFF004005
        7DFF005F0057DFF40057807ED35FF32B7FDBDFFED1AF7FAF00FDA6BFE656FF00
        B7BFFDA3401F3FD1451401F407FC332FFD4DDFF94DFF00EDB47FC332FF00D4DD
        FF0094DFFEDB5EFF00450079FF00C32F865FF0AE7FB53FE26FFDA1F6FF002BFE
        5DBCAD9B37FF00B6D9CEFF006E95E8145140057807FC332FFD4DDFF94DFF00ED
        B5EFF45007807FC332FF00D4DDFF0094DFFEDB47FC9B9FFD4C3FDBBFF6E9E479
        1FF7F376EF3BDB1B7BE78F7FAF00FDA6BFE656FF00B7BFFDA34007FC34D7FD4A
        3FF952FF00ED547FC34D7FD4A3FF00952FFED55F3FD1401F407FC34D7FD4A3FF
        00952FFED547FC34D7FD4A3FF952FF00ED55F3FD1401F407FC34D7FD4A3FF952
        FF00ED547FC34D7FD4A3FF00952FFED55F3FD1401F407FC34D7FD4A3FF00952F
        FED547FC34D7FD4A3FF952FF00ED55F3FD1401F407FC34D7FD4A3FF952FF00ED
        547FC34D7FD4A3FF00952FFED55F3FD1401F407FC34D7FD4A3FF00952FFED547
        FC34D7FD4A3FF952FF00ED55F3FD1401F7FD1451401E7FF137E26FFC2B9FECBF
        F8947F687DBFCDFF00979F2B66CD9FEC3673BFDBA5701FF0D35FF528FF00E54B
        FF00B551FB4D7FCCADFF006F7FFB46BE7FA00FA03FE1A6BFEA51FF00CA97FF00
        6AAF7FAF802BEFFA002BCFFE26FC32FF00858DFD97FF00137FECFF00B079BFF2
        EDE6EFDFB3FDB5C6367BF5AF40A2803C03FE1997FEA6EFFCA6FF00F6DA3FE199
        7FEA6EFF00CA6FFF006DAF7FA2800A28A2803CFF00E26FC4DFF8573FD97FF128
        FED0FB7F9BFF002F3E56CD9B3FD86CE77FB74AE03FE1A6BFEA51FF00CA97FF00
        6AA3F69AFF00995BFEDEFF00F68D7CFF00401F407FC34D7FD4A3FF00952FFED5
        5EFF005F0057DFF40057807ED35FF32B7FDBDFFED1AF7FAF00FDA6BFE656FF00
        B7BFFDA3401F3FD145140051451401E81F0CBE26FF00C2B9FED4FF008947F687
        DBFCAFF979F2B66CDFFEC3673BFDBA57A07FC34D7FD4A3FF00952FFED55F3FD1
        401F407FC34D7FD4A3FF00952FFED547FC332FFD4DDFF94DFF00EDB5F3FD7DFF
        00401E01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE537FF00B6D7BFD1
        401E01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE537FF00B6D7BFD140
        1E01FF000D35FF00528FFE54BFFB551FF0D35FF528FF00E54BFF00B557CFF450
        07D01FF0D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB557CFF00
        45007D01FF000D35FF00528FFE54BFFB551FF0CCBFF5377FE537FF00B6D7CFF5
        F7FD007807FC332FFD4DDFF94DFF00EDB47FC9B9FF00D4C3FDBBFF006E9E4791
        FF007F376EF3BDB1B7BE78F7FAF00FDA6BFE656FFB7BFF00DA34007FC34D7FD4
        A3FF00952FFED547FC34D7FD4A3FF952FF00ED55F3FD1401F407FC332FFD4DDF
        F94DFF00EDB47FC332FF00D4DDFF0094DFFEDB5EFF0045007807FC9B9FFD4C3F
        DBBFF6E9E4791FF7F376EF3BDB1B7BE783FE1A6BFEA51FFCA97FF6AA3F69AFF9
        95BFEDEFFF0068D7CFF401F407FC34D7FD4A3FF952FF00ED547FC332FF00D4DD
        FF0094DFFEDB5F3FD7DFF401E01FF0CCBFF5377FE537FF00B6D79FFC4DF865FF
        000AE7FB2FFE26FF00DA1F6FF37FE5DBCAD9B367FB6D9CEFF6E95F5FD7807ED3
        5FF32B7FDBDFFED1A00F9FE8A28A0028A28A00FA03F665FF0099A7FEDD3FF6B5
        7BFD7807ECCBFF00334FFDBA7FED6AF7FA002BE00AFBFEBE00A002BE80FD997F
        E669FF00B74FFDAD5F3FD7D01FB32FFCCD3FF6E9FF00B5A803DFE8A28A00F00F
        F8665FFA9BBFF29BFF00DB68FF008665FF00A9BBFF0029BFFDB6BDFE8A00F3FF
        00865F0CBFE15CFF006A7FC4DFFB43EDFE57FCBB795B366FFF006DB39DFEDD2B
        D028A2800A28A2800AF3FF0089BF0CBFE1637F65FF00C4DFFB3FEC1E6FFCBB79
        BBF7ECFF006D718D9EFD6BD028A00F00FF008665FF00A9BBFF0029BFFDB68FF8
        665FFA9BBFF29BFF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB68FF8
        665FFA9BBFF29BFF00DB6BDFE8A00F903E26FC32FF008573FD97FF00137FED0F
        B7F9BFF2EDE56CD9B3FDB6CE77FB74AF3FAFA03F69AFF995BFEDEFFF0068D7CF
        F40057DFF5F0057DFF004005145140051451401E01FF000D35FF00528FFE54BF
        FB551FF0D35FF528FF00E54BFF00B557CFF45007D01FF0D35FF528FF00E54BFF
        00B551FF000D35FF00528FFE54BFFB557CFF0045007D01FF000D35FF00528FFE
        54BFFB551FF0CCBFF5377FE537FF00B6D7CFF5F7FD007807FC332FFD4DDFF94D
        FF00EDB47FC332FF00D4DDFF0094DFFEDB5EFF0045007807FC332FFD4DDFF94D
        FF00EDB47FC332FF00D4DDFF0094DFFEDB5EFF0045001451450079FF00C4DF89
        BFF0AE7FB2FF00E251FDA1F6FF0037FE5E7CAD9B367FB0D9CEFF006E95C07FC3
        4D7FD4A3FF00952FFED547ED35FF0032B7FDBDFF00ED1AF9FE803E80FF00869A
        FF00A947FF002A5FFDAA8FF869AFFA947FF2A5FF00DAABE7FA2803E80FF869AF
        FA947FF2A5FF00DAA8FF00938CFF00A97BFB0BFEDEFCFF003FFEFDEDDBE4FBE7
        776C73F3FD7D01FB32FF00CCD3FF006E9FFB5A800FF8665FFA9BBFF29BFF00DB
        68FF008665FF00A9BBFF0029BFFDB6BDFE8A00F00FF8665FFA9BBFF29BFF00DB
        68FF008665FF00A9BBFF0029BFFDB6BDFE8A00F3FF00865F0CBFE15CFF006A7F
        C4DFFB43EDFE57FCBB795B366FFF006DB39DFEDD2BD028A2800A28A2800A28A2
        800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
        800A28A2803C03F69AFF00995BFEDEFF00F68D7CFF005F7FD1401F0057DFF451
        40057807ED35FF0032B7FDBDFF00ED1AF7FAF00FDA6BFE656FFB7BFF00DA3401
        F3FD1451401F7FD14514005145140051457C01401F7FD7807ED35FF32B7FDBDF
        FED1AF9FEBE80FD997FE669FFB74FF00DAD401F3FD15F7FD1401F00514514005
        145140051457DFF401F00515F7FD1401F00515F7FD1400515F0051401F407ED3
        5FF32B7FDBDFFED1AF9FEBE80FD997FE669FFB74FF00DAD5EFF401F0057DFF00
        457C01401F7FD15F0051401F7FD15F0051401F7FD15F0051401F407ED35FF32B
        7FDBDFFED1AF9FE8A2800AFBFEBE00AFBFE800AF00FDA6BFE656FF00B7BFFDA3
        5EFF0045007C01457DFF0045007C0145145001451450015F7FD7C015F7FD0014
        514500145145007C01457DFF0045007C01457D01FB4D7FCCADFF006F7FFB46BE
        7FA002BEFF00AF8028A00FBFEBC03F69AFF995BFEDEFFF0068D7CFF5F407ECCB
        FF00334FFDBA7FED6A00F9FE8AFBFE8A0028AF8028A00FA03F69AFF995BFEDEF
        FF0068D7CFF5F407ECCBFF00334FFDBA7FED6AF7FA00F802BEFF00A2BE00A00F
        BFEBC03F69AFF995BFEDEFFF0068D7CFF450014514500145145007D01FB32FFC
        CD3FF6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD0015F0057DFF450
        07C015F407ECCBFF00334FFDBA7FED6AF7FA2800A28A2800A28A2800A2BC03F6
        9AFF00995BFEDEFF00F68D7CFF00401F7FD15F0051401F7FD15F0051401F7FD1
        5F0051401F7FD1451401E01FB4D7FCCADFF6F7FF00B46BE7FAFA03F69AFF0099
        5BFEDEFF00F68D7CFF0040057DFF005F0057DFF4005145140051451401F00515
        F7FD1401F00515F7FD1401F0057DFF00457C01401F7FD15F0051401F7FD15F00
        51401F7FD15F0051401F407ED35FF32B7FDBDFFED1AF9FE8A2800A28A2800AFA
        03F665FF0099A7FEDD3FF6B57CFF005F407ECCBFF334FF00DBA7FED6A00F7FA2
        8A2800A2BE00A2803EFF00A2BC03F665FF0099A7FEDD3FF6B57BFD0014514500
        1451450014514500145145001451450014514500145145001451450014514500
        145145001457807FC34D7FD4A3FF00952FFED547FC34D7FD4A3FF952FF00ED54
        01EFF4579FFC32F89BFF000B1BFB53FE251FD9FF0060F2BFE5E7CDDFBF7FFB0B
        8C6CF7EB5E8140051457807FC34D7FD4A3FF00952FFED5401EFF005E01FB4D7F
        CCADFF006F7FFB468FF869AFFA947FF2A5FF00DAA8FF00938CFF00A97BFB0BFE
        DEFCFF003FFEFDEDDBE4FBE7776C7201F3FD15F407FC332FFD4DDFF94DFF00ED
        B47FC332FF00D4DDFF0094DFFEDB401EFF00457807FC34D7FD4A3FF952FF00ED
        547FC34D7FD4A3FF00952FFED5401EFF00457807FC34D7FD4A3FF952FF00ED54
        7FC34D7FD4A3FF00952FFED5401EFF005F0057D01FF0D35FF528FF00E54BFF00
        B551FF000CCBFF005377FE537FFB6D007CFF005F407ECCBFF334FF00DBA7FED6
        A3FE1997FEA6EFFCA6FF00F6DAEFFE197C32FF008573FDA9FF00137FED0FB7F9
        5FF2EDE56CD9BFFDB6CE77FB74A00F40A28A2803E00A2BE80FF8665FFA9BBFF2
        9BFF00DB68FF008665FF00A9BBFF0029BFFDB6803E7FA2BD03E26FC32FF8573F
        D97FF137FED0FB7F9BFF002EDE56CD9B3FDB6CE77FB74AF3FA002BEFFAF802BE
        FF00A0028A2BCFFE26FC4DFF008573FD97FF00128FED0FB7F9BFF2F3E56CD9B3
        FD86CE77FB74A00F40A2BC03FE1A6BFEA51FFCA97FF6AA3FE1A6BFEA51FF00CA
        97FF006AA00F9FE8A28A00FA03F665FF0099A7FEDD3FF6B57BFD7807ECCBFF00
        334FFDBA7FED6AF7FA002BE00AFBFEBC03FE1997FEA6EFFCA6FF00F6DA00F9FE
        8AFA03FE1997FEA6EFFCA6FF00F6DAF3FF0089BF0CBFE15CFF0065FF00C4DFFB
        43EDFE6FFCBB795B366CFF006DB39DFEDD2803CFE8A28A0028AFA03FE1997FEA
        6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DA00F9FE8AFA03FE1997FEA6
        EFFCA6FF00F6DA3FE1997FEA6EFF00CA6FFF006DA00F9FEBEFFAF00FF8665FFA
        9BBFF29BFF00DB68FF00869AFF00A947FF002A5FFDAA803DFE8AF00FF869AFFA
        947FF2A5FF00DAABBFF865F137FE1637F6A7FC4A3FB3FEC1E57FCBCF9BBF7EFF
        00F61718D9EFD6803D028A28A00F8028A28A0028A28A002BEFFAF802BE80FF00
        869AFF00A947FF002A5FFDAA803DFE8AF00FF869AFFA947FF2A5FF00DAABBFF8
        65F137FE1637F6A7FC4A3FB3FEC1E57FCBCF9BBF7EFF00F61718D9EFD6803D02
        8A28A0028A28A00F00FDA6BFE656FF00B7BFFDA35F3FD7D01FB4D7FCCADFF6F7
        FF00B46BE7FA0028A28A002BE80FD997FE669FFB74FF00DAD5F3FD7A07C32F89
        BFF0AE7FB53FE251FDA1F6FF002BFE5E7CAD9B37FF00B0D9CEFF006E9401F5FD
        15E01FF0D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB55007CFF
        0045145007D01FB32FFCCD3FF6E9FF00B5ABDFEBE40F865F137FE15CFF006A7F
        C4A3FB43EDFE57FCBCF95B366FFF0061B39DFEDD2BD03FE1A6BFEA51FF00CA97
        FF006AA00F7FAF802BE80FF869AFFA947FF2A5FF00DAA8FF008665FF00A9BBFF
        0029BFFDB6803E7FA2BE80FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBF
        F29BFF00DB6803E7FA2BE80FF8665FFA9BBFF29BFF00DB68FF008665FF00A9BB
        FF0029BFFDB6803E7FA28A2803E80FD997FE669FFB74FF00DAD5EFF5E01FB32F
        FCCD3FF6E9FF00B5ABDFE800A28A2800A28AF3FF0089BF137FE15CFF0065FF00
        C4A3FB43EDFE6FFCBCF95B366CFF0061B39DFEDD2803D028AF00FF00869AFF00
        A947FF002A5FFDAA8FF869AFFA947FF2A5FF00DAA803DFE8AF00FF00869AFF00
        A947FF002A5FFDAA8FF869AFFA947FF2A5FF00DAA800FDA6BFE656FF00B7BFFD
        A35F3FD7D01FF2719FF52F7F617FDBDF9FE7FF00DFBDBB7C9F7CEEED8E4FF866
        5FFA9BBFF29BFF00DB6803E7FA2BE80FF8665FFA9BBFF29BFF00DB6BE7FA0028
        A28A0028A28A00FBFE8AF00FF869AFFA947FF2A5FF00DAA8FF00869AFF00A947
        FF002A5FFDAA800FDA6BFE656FFB7BFF00DA35F3FD7D01FF002719FF0052F7F6
        17FDBDF9FE7FFDFBDBB7C9F7CEEED8E4FF008665FF00A9BBFF0029BFFDB6803E
        7FAFBFEBC03FE1997FEA6EFF00CA6FFF006DAF7FA0028A28A0028A28A0028AF0
        0FF869AFFA947FF2A5FF00DAA8FF00869AFF00A947FF002A5FFDAA803DFE8AF0
        0FF869AFFA947FF2A5FF00DAA8FF00869AFF00A947FF002A5FFDAA803DFEBE00
        AFA03FE1A6BFEA51FF00CA97FF006AAF9FE800A28AF40F865F0CBFE1637F6A7F
        C4DFFB3FEC1E57FCBB79BBF7EFFF006D718D9EFD6803CFE8AFA03FE1997FEA6E
        FF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DA00F9FE8AFA03FE1997FEA6EF
        FCA6FF00F6DA3FE1997FEA6EFF00CA6FFF006DA00F9FE8AFA03FE1997FEA6EFF
        00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DA00F9FE8AFA03FE1997FEA6EFFC
        A6FF00F6DA3FE1997FEA6EFF00CA6FFF006DA00F9FEBE80FD997FE669FFB74FF
        00DAD47FC332FF00D4DDFF0094DFFEDB5DFF00C32F865FF0AE7FB53FE26FFDA1
        F6FF002BFE5DBCAD9B37FF00B6D9CEFF006E9401E8145145007C0145145007D0
        1FB32FFCCD3FF6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD0014514
        5001451450014514500145145001451450014514500145145001451450014514
        500145145007C0145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF
        0099A7FEDD3FF6B57BFD0015F0057DFF005F0050015F407ECCBFF334FF00DBA7
        FED6AF9FEBE80FD997FE669FFB74FF00DAD401EFF45145007C01451450014514
        50015F7FD7C015F7FD001451450014514500145145007807ED35FF0032B7FDBD
        FF00ED1AF9FEBE80FDA6BFE656FF00B7BFFDA35F3FD0015F7FD7C015F7FD0015
        E01FB4D7FCCADFF6F7FF00B46BDFEBC03F69AFF995BFEDEFFF0068D007CFF451
        4500145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD
        3FF6B57BFD001451450015E01FB4D7FCCADFF6F7FF00B46BDFEBC03F69AFF995
        BFEDEFFF0068D007CFF45145007DFF0045145001451450015F0057DFF5F00500
        15F407ECCBFF00334FFDBA7FED6AF9FEBE80FD997FE669FF00B74FFDAD401EFF
        0045145007C014514500145145001451450015F407ECCBFF00334FFDBA7FED6A
        F9FEBE80FD997FE669FF00B74FFDAD401EFF004514500145145007807ED35FF3
        2B7FDBDFFED1AF9FEBE80FDA6BFE656FFB7BFF00DA35F3FD0014514500145145
        0014514500145145001451450015F7FD7C015F7FD0014514500145145007C014
        5145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD3FF6B5
        7BFD001451450015E01FB4D7FCCADFF6F7FF00B46BDFEBC03F69AFF995BFEDEF
        FF0068D007CFF4514500145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03
        F665FF0099A7FEDD3FF6B57BFD0015F0057DFF005F0050014514500145145001
        45145007D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57
        BFD001451450014514500145145007C014514500145145001451450015F407EC
        CBFF00334FFDBA7FED6AF9FEBE80FD997FE669FF00B74FFDAD401EFF00451450
        014514500145145001451450014514500145145007C0145145007D01FB32FF00
        CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD3FF6B57BFD00145145001451
        4500145145001451450014514500145145001451450014514500145145001451
        45007C014514500145145001451450015F407ECCBFF334FF00DBA7FED6AF9FEB
        E80FD997FE669FFB74FF00DAD401EFF45145007C0145145007D01FB32FFCCD3F
        F6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD0015F0057DFF5F00500
        15F407ECCBFF00334FFDBA7FED6AF9FEBE80FD997FE669FF00B74FFDAD401EFF
        004514500145145007807ED35FF32B7FDBDFFED1AF9FEBE80FDA6BFE656FFB7B
        FF00DA35F3FD001451450014514500145145007DFF0045145001451450015F00
        57DFF5F00500145145001451450014514500145145001451450015F407ECCBFF
        00334FFDBA7FED6AF9FEBE80FD997FE669FF00B74FFDAD401EFF004514500145
        14500145145001451450015E01FB4D7FCCADFF006F7FFB46BDFEBC03F69AFF00
        995BFEDEFF00F68D007CFF004514500145145007D01FB32FFCCD3FF6E9FF00B5
        ABDFEBC03F665FF99A7FEDD3FF006B57BFD00145145001451450014514500145
        145007807ED35FF32B7FDBDFFED1AF9FEBE80FDA6BFE656FFB7BFF00DA35F3FD
        0014514500145145001451450014514500145145001451450014514500145145
        00145145007D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD3F
        F6B57BFD0015F0057DFF005F0050015F407ECCBFF334FF00DBA7FED6AF9FEBE8
        0FD997FE669FFB74FF00DAD401EFF4514500145145001451450015F0057DFF00
        5F005001451450014514500145145007D01FB32FFCCD3FF6E9FF00B5ABDFEBC0
        3F665FF99A7FEDD3FF006B57BFD0014514500145145001451450014514500780
        7ED35FF32B7FDBDFFED1AF9FEBE80FDA6BFE656FFB7BFF00DA35F3FD0015F7FD
        7C015F7FD0014514500145145001451450014514500145145001451450014514
        500145145001451450014514500145145001451450014514500145145007C014
        5145007A07C32F865FF0B1BFB53FE26FFD9FF60F2BFE5DBCDDFBF7FF00B6B8C6
        CF7EB5E81FF0CCBFF5377FE537FF00B6D1FB32FF00CCD3FF006E9FFB5ABDFE80
        3C03FE1997FEA6EFFCA6FF00F6DA3FE1997FEA6EFF00CA6FFF006DAF7FA2803C
        03FE1997FEA6EFFCA6FF00F6DA3FE4DCFF00EA61FEDDFF00B74F23C8FF00BF9B
        B779DED8DBDF3C7BFD7807ED35FF0032B7FDBDFF00ED1A003FE1A6BFEA51FF00
        CA97FF006AA3FE1A6BFEA51FFCA97FF6AAF9FE8A0028A28A00FA03F665FF0099
        A7FEDD3FF6B57BFD7807ECCBFF00334FFDBA7FED6AF7FA002BC03FE1997FEA6E
        FF00CA6FFF006DAF7FA2803C03FE1997FEA6EFFCA6FF00F6DAEFFE197C32FF00
        8573FDA9FF00137FED0FB7F95FF2EDE56CD9BFFDB6CE77FB74AF40A2800A28A2
        800A28A2803C03F69AFF00995BFEDEFF00F68D7CFF005F407ED35FF32B7FDBDF
        FED1AF9FE800A28A2800AF40F865F0CBFE1637F6A7FC4DFF00B3FEC1E57FCBB7
        9BBF7EFF00F6D718D9EFD6BCFEBE80FD997FE669FF00B74FFDAD4007FC332FFD
        4DDFF94DFF00EDB47FC332FF00D4DDFF0094DFFEDB5EFF004500145145001451
        450015F0057DFF005F0050014514500145145007D01FF0CCBFF5377FE537FF00
        B6D1FF000CCBFF005377FE537FFB6D7BFD1401F207C4DF865FF0AE7FB2FF00E2
        6FFDA1F6FF0037FE5DBCAD9B367FB6D9CEFF006E95E7F5F407ED35FF0032B7FD
        BDFF00ED1AF9FE800AFA03FE1997FEA6EFFCA6FF00F6DAF9FEBEFF00A00F00FF
        008665FF00A9BBFF0029BFFDB68FF9373FFA987FB77FEDD3C8F23FEFE6EDDE77
        B636F7CF1EFF005E01FB4D7FCCADFF006F7FFB46800FF869AFFA947FF2A5FF00
        DAA8FF00869AFF00A947FF002A5FFDAABE7FA2803E80FF00869AFF00A947FF00
        2A5FFDAA8FF869AFFA947FF2A5FF00DAABE7FA2803EBFF00865F137FE1637F6A
        7FC4A3FB3FEC1E57FCBCF9BBF7EFFF0061718D9EFD6BD02BC03F665FF99A7FED
        D3FF006B57BFD001451450015E7FF137E197FC2C6FECBFF89BFF0067FD83CDFF
        00976F377EFD9FEDAE31B3DFAD7A051401E01FF0CCBFF5377FE537FF00B6D1FF
        000CCBFF005377FE537FFB6D7BFD1401F0051451401E81F0CBE26FFC2B9FED4F
        F8947F687DBFCAFF00979F2B66CDFF00EC3673BFDBA57A07FC34D7FD4A3FF952
        FF00ED55F3FD1401F407FC34D7FD4A3FF952FF00ED547FC34D7FD4A3FF00952F
        FED55F3FD1401F407FC34D7FD4A3FF00952FFED55DFF00C32F89BFF0B1BFB53F
        E251FD9FF60F2BFE5E7CDDFBF7FF00B0B8C6CF7EB5F2057D01FB32FF00CCD3FF
        006E9FFB5A803DFE8A28A0028A28A00F00FDA6BFE656FF00B7BFFDA35F3FD7D0
        1FB4D7FCCADFF6F7FF00B46BE7FA002BE80FF8665FFA9BBFF29BFF00DB6BE7FA
        FBFE803C03FE1997FEA6EFFCA6FF00F6DAF3FF0089BF0CBFE15CFF0065FF00C4
        DFFB43EDFE6FFCBB795B366CFF006DB39DFEDD2BEBFAF00FDA6BFE656FFB7BFF
        00DA3401F3FD145140051451401E81F0CBE197FC2C6FED4FF89BFF0067FD83CA
        FF00976F377EFDFF00EDAE31B3DFAD7A07FC332FFD4DDFF94DFF00EDB47ECCBF
        F334FF00DBA7FED6AF7FA00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA
        9BBFF29BFF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB6BCFF00E26F
        C32FF8573FD97FF137FED0FB7F9BFF002EDE56CD9B3FDB6CE77FB74AFAFEBC03
        F69AFF00995BFEDEFF00F68D007CFF0045145007D01FF0CCBFF5377FE537FF00
        B6D1FF000CCBFF005377FE537FFB6D7BFD1401E7FF000CBE197FC2B9FED4FF00
        89BFF687DBFCAFF976F2B66CDFFEDB673BFDBA57A051450015F0057DFF005F00
        50015F407ECCBFF334FF00DBA7FED6AF9FEBE80FD997FE669FFB74FF00DAD401
        EFF45145007807FC34D7FD4A3FF952FF00ED547FC34D7FD4A3FF00952FFED55F
        3FD1401F407FC34D7FD4A3FF00952FFED547FC34D7FD4A3FF952FF00ED55F3FD
        1401F407FC34D7FD4A3FF952FF00ED547FC332FF00D4DDFF0094DFFEDB5F3FD7
        DFF401E01FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE537FFB6D7BFD
        1401E01FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE537FFB6D7BFD14
        01E01FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE537FFB6D7BFD1401
        E01FF26E7FF530FF006EFF00DBA791E47FDFCDDBBCEF6C6DEF9E0FF869AFFA94
        7FF2A5FF00DAA8FDA6BFE656FF00B7BFFDA35F3FD007D01FF0D35FF528FF00E5
        4BFF00B557BFD7C015F7FD0015E7FF00137E26FF00C2B9FECBFF008947F687DB
        FCDFF979F2B66CD9FEC3673BFDBA57A057807ED35FF32B7FDBDFFED1A003FE1A
        6BFEA51FFCA97FF6AA3FE1A6BFEA51FF00CA97FF006AAF9FE8A00FBFE8A28A00
        F00FDA6BFE656FFB7BFF00DA35F3FD7D01FB4D7FCCADFF006F7FFB46BE7FA002
        BE80FF00869AFF00A947FF002A5FFDAABE7FA2803E80FF00869AFF00A947FF00
        2A5FFDAA8FF869AFFA947FF2A5FF00DAABE7FA2803E80FF869AFFA947FF2A5FF
        00DAA8FF00869AFF00A947FF002A5FFDAABE7FA2803EFF00A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2803E00A28A2803E80FD997FE669FF00B74FFDAD5EFF005F0051
        401F7FD15F0057DFF40057807ED35FF32B7FDBDFFED1AF7FAF00FDA6BFE656FF
        00B7BFFDA3401F3FD145140051451401F407ECCBFF00334FFDBA7FED6AF7FAF8
        028A00FBFE8AF8028A00FBFE8AF8028A00FBFE8AF8028A00FBFE8A28A00F00FD
        A6BFE656FF00B7BFFDA35F3FD7D01FB4D7FCCADFF6F7FF00B46BE7FA0028A2BE
        FF00A00F802BE80FD997FE669FFB74FF00DAD5EFF5E01FB4D7FCCADFF6F7FF00
        B46803DFE8AF8028A00FBFE8A28A0028AF00FDA6BFE656FF00B7BFFDA35F3FD0
        07DFF5F00515F7FD007C01457DFF0045007C01457DFF0045001457C0145007D0
        1FB4D7FCCADFF6F7FF00B46BE7FAFA03F665FF0099A7FEDD3FF6B57BFD007C01
        5F7FD15F005007DFF5E01FB4D7FCCADFF6F7FF00B46BE7FAFA03F665FF0099A7
        FEDD3FF6B5007CFF00457DFF0045007C01457DFF0045007807ECCBFF00334FFD
        BA7FED6AF7FAF00FDA6BFE656FFB7BFF00DA35F3FD007DFF00457C015F7FD001
        4515E01FB4D7FCCADFF6F7FF00B46803DFE8AF8028A0028A28A0028AFA03F665
        FF0099A7FEDD3FF6B57BFD007C01457DFF0045007C015F407ECCBFF334FF00DB
        A7FED6AF7FAF00FDA6BFE656FF00B7BFFDA3401EFF00457C0145007DFF004514
        5007807ED35FF32B7FDBDFFED1AF9FEBE80FDA6BFE656FFB7BFF00DA35F3FD00
        15F7FD7C0145007DFF005E01FB4D7FCCADFF006F7FFB46BE7FAFA03F665FF99A
        7FEDD3FF006B5007CFF457DFF45007C0145145007D01FB32FF00CCD3FF006E9F
        FB5ABDFEBC03F665FF0099A7FEDD3FF6B57BFD001451450015E01FB4D7FCCADF
        F6F7FF00B46BDFEBC03F69AFF995BFEDEFFF0068D007CFF45145007DFF004514
        5001451450015F0057DFF5F0050015F407ECCBFF00334FFDBA7FED6AF9FE8A00
        FBFE8AF8028A0028AFBFE8A00F8028AFBFE8A00F802BEFFA28A0028A2BC03F69
        AFF995BFEDEFFF0068D007BFD15F0051401F7FD1451401E01FB4D7FCCADFF6F7
        FF00B46BE7FAFBFE8A00F802BEFF00A2BE00A00FBFEBC03F69AFF995BFEDEFFF
        0068D7CFF5F407ECCBFF00334FFDBA7FED6A00F9FE8AFBFE8A0028A28A00F00F
        DA6BFE656FFB7BFF00DA35F3FD7DFF0045007C01457DFF0045007C01457DFF00
        5E01FB4D7FCCADFF006F7FFB46803E7FA28A2803EFFA2BE00A2803EFFA2BC03F
        665FF99A7FEDD3FF006B57BFD001451450014514500145145001451450014514
        50014514500145145001451450014514500145145007C01457D01FF0CCBFF537
        7FE537FF00B6D1FF000CCBFF005377FE537FFB6D007CFF00457A07C4DF865FF0
        AE7FB2FF00E26FFDA1F6FF0037FE5DBCAD9B367FB6D9CEFF006E95E7F40057DF
        F5F0057D01FF000D35FF00528FFE54BFFB55007BFD7807ED35FF0032B7FDBDFF
        00ED1A3FE1A6BFEA51FF00CA97FF006AA3FE4E33FEA5EFEC2FFB7BF3FCFF00FB
        F7B76F93EF9DDDB1C807CFF457D01FF0CCBFF5377FE537FF00B6D1FF000CCBFF
        005377FE537FFB6D007CFF00457D01FF000CCBFF005377FE537FFB6D1FF0CCBF
        F5377FE537FF00B6D007CFF457D01FF0CCBFF5377FE537FF00B6D1FF000CCBFF
        005377FE537FFB6D007CFF00457D01FF000CCBFF005377FE537FFB6D1FF0CCBF
        F5377FE537FF00B6D007CFF457D01FF0CCBFF5377FE537FF00B6D79FFC4DF865
        FF000AE7FB2FFE26FF00DA1F6FF37FE5DBCAD9B367FB6D9CEFF6E9401E7F4514
        5007DFF457807FC34D7FD4A3FF00952FFED547FC34D7FD4A3FF952FF00ED5400
        7ED35FF32B7FDBDFFED1AF9FEBD03E26FC4DFF00858DFD97FF00128FECFF00B0
        79BFF2F3E6EFDFB3FD85C6367BF5AF3FA002BEFF00AF802BEFFA002BC03F69AF
        F995BFEDEFFF0068D7BFD79FFC4DF865FF000B1BFB2FFE26FF00D9FF0060F37F
        E5DBCDDFBF67FB6B8C6CF7EB401F20515F407FC332FF00D4DDFF0094DFFEDB47
        FC332FFD4DDFF94DFF00EDB401EFF45145007807ED35FF0032B7FDBDFF00ED1A
        F9FEBE80FDA6BFE656FF00B7BFFDA35F3FD0015F7FD7C015F7FD0014515E7FF1
        37E26FFC2B9FECBFF8947F687DBFCDFF00979F2B66CD9FEC3673BFDBA5007A05
        15E01FF0D35FF528FF00E54BFF00B551FF000D35FF00528FFE54BFFB55007CFF
        0045145007D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF006B
        57BFD0015F0057DFF5F0050015F407ECCBFF00334FFDBA7FED6AF9FEBE80FD99
        7FE669FF00B74FFDAD401EFF004514500145145007807ED35FF32B7FDBDFFED1
        AF9FEBEBFF0089BF0CBFE1637F65FF00C4DFFB3FEC1E6FFCBB79BBF7ECFF006D
        718D9EFD6B80FF008665FF00A9BBFF0029BFFDB6803E7FAFBFEBC03FE1997FEA
        6EFF00CA6FFF006DA3FE1A6BFEA51FFCA97FF6AA00F7FAF00FDA6BFE656FFB7B
        FF00DA347FC34D7FD4A3FF00952FFED547FC9C67FD4BDFD85FF6F7E7F9FF00F7
        EF6EDF27DF3BBB63900F9FE8AFA03FE1997FEA6EFF00CA6FFF006DA3FE1997FE
        A6EFFCA6FF00F6DA00F9FE8A28A00FA03F665FF99A7FEDD3FF006B57BFD7C81F
        0CBE26FF00C2B9FED4FF008947F687DBFCAFF979F2B66CDFFEC3673BFDBA57A0
        7FC34D7FD4A3FF00952FFED5401EFF00457807FC34D7FD4A3FF952FF00ED55EF
        F40057807ED35FF32B7FDBDFFED1AF7FAF00FDA6BFE656FF00B7BFFDA3401F3F
        D1451401F7FD15E01FF0D35FF528FF00E54BFF00B551FF000D35FF00528FFE54
        BFFB55001FB4D7FCCADFF6F7FF00B46BE7FAF40F89BF137FE1637F65FF00C4A3
        FB3FEC1E6FFCBCF9BBF7ECFF0061718D9EFD6BCFE800A28A2800AFA03F665FF9
        9A7FEDD3FF006B57CFF5E81F0CBE26FF00C2B9FED4FF008947F687DBFCAFF979
        F2B66CDFFEC3673BFDBA5007D7F457807FC34D7FD4A3FF00952FFED547FC34D7
        FD4A3FF952FF00ED5401F3FD1451401F407ECCBFF334FF00DBA7FED6AF7FAF90
        3E197C4DFF008573FDA9FF00128FED0FB7F95FF2F3E56CD9BFFD86CE77FB74AF
        40FF00869AFF00A947FF002A5FFDAA803DFE8AF00FF869AFFA947FF2A5FF00DA
        A8FF00869AFF00A947FF002A5FFDAA803DFEBC03F69AFF00995BFEDEFF00F68D
        1FF0D35FF528FF00E54BFF00B551FF002719FF0052F7F617FDBDF9FE7FFDFBDB
        B7C9F7CEEED8E403E7FA2BE80FF8665FFA9BBFF29BFF00DB68FF008665FF00A9
        BBFF0029BFFDB6803DFE8AF00FF869AFFA947FF2A5FF00DAA8FF00869AFF00A9
        47FF002A5FFDAA803DFE8AF00FF869AFFA947FF2A5FF00DAA8FF00869AFF00A9
        47FF002A5FFDAA803DFEBE00AFA03FE1A6BFEA51FF00CA97FF006AAF9FE800A2
        8A2800A28A2803EFFA28A2800A2BCFFE26FC4DFF008573FD97FF00128FED0FB7
        F9BFF2F3E56CD9B3FD86CE77FB74AE03FE1A6BFEA51FFCA97FF6AA00F7FA2BC0
        3FE1A6BFEA51FF00CA97FF006AA3FE1A6BFEA51FFCA97FF6AA00F7FAF00FDA6B
        FE656FFB7BFF00DA347FC34D7FD4A3FF00952FFED55E7FF137E26FFC2C6FECBF
        F8947F67FD83CDFF00979F377EFD9FEC2E31B3DFAD0079FD1451401F7FD15E01
        FF000D35FF00528FFE54BFFB551FF0D35FF528FF00E54BFF00B55007BFD15E7F
        F0CBE26FFC2C6FED4FF8947F67FD83CAFF00979F377EFDFF00EC2E31B3DFAD7A
        050015F0057DFF005E01FF000CCBFF005377FE537FFB6D007CFF005F407ECCBF
        F334FF00DBA7FED6A3FE1997FEA6EFFCA6FF00F6DA3FE4DCFF00EA61FEDDFF00
        B74F23C8FF00BF9BB779DED8DBDF3C007BFD15E01FF0D35FF528FF00E54BFF00
        B551FF000D35FF00528FFE54BFFB55007BFD1451400515E7FF00137E26FF00C2
        B9FECBFF008947F687DBFCDFF979F2B66CD9FEC3673BFDBA5701FF000D35FF00
        528FFE54BFFB55007BFD15E01FF0D35FF528FF00E54BFF00B557BFD0015E01FB
        4D7FCCADFF006F7FFB46BDFEBCFF00E26FC32FF858DFD97FF137FECFFB079BFF
        002EDE6EFDFB3FDB5C6367BF5A00F9028AFA03FE1997FEA6EFFCA6FF00F6DA3F
        E1997FEA6EFF00CA6FFF006DA00F9FE8AFA03FE1997FEA6EFF00CA6FFF006DA3
        FE1997FEA6EFFCA6FF00F6DA003F665FF99A7FEDD3FF006B57BFD79FFC32F865
        FF000AE7FB53FE26FF00DA1F6FF2BFE5DBCAD9B37FFB6D9CEFF6E95E81400514
        5140051451400514514005145140051451400514514005145140051451400514
        514005145140051451401E01FB4D7FCCADFF006F7FFB46BE7FAFA03F69AFF995
        BFEDEFFF0068D7CFF4005145140057D01FB32FFCCD3FF6E9FF00B5ABE7FAFA03
        F665FF0099A7FEDD3FF6B5007BFD145140051451400514514005145140057807
        ED35FF0032B7FDBDFF00ED1AF7FAF00FDA6BFE656FFB7BFF00DA3401F3FD1451
        400514514005145140057DFF005F0057DFF400514514005145140051451401E0
        1FB4D7FCCADFF6F7FF00B46BE7FAFA03F69AFF00995BFEDEFF00F68D7CFF0040
        057DFF005F0057DFF40057807ED35FF32B7FDBDFFED1AF7FAF00FDA6BFE656FF
        00B7BFFDA3401F3FD145140051451401F407ECCBFF00334FFDBA7FED6AF7FAF0
        0FD997FE669FFB74FF00DAD5EFF40057C015F7FD7C0140057D01FB32FF00CCD3
        FF006E9FFB5ABE7FAFA03F665FF99A7FEDD3FF006B5007BFD145140051451400
        5145140057C015F7FD7C0140057D01FB32FF00CCD3FF006E9FFB5ABE7FAFA03F
        665FF99A7FEDD3FF006B5007BFD1451401F00514514005145140057DFF005F00
        57DFF40057807ED35FF32B7FDBDFFED1AF7FAF00FDA6BFE656FF00B7BFFDA340
        1F3FD14514005145140051451400514514005145140051451400514514005145
        14005145140057D01FB32FFCCD3FF6E9FF00B5ABE7FAFA03F665FF0099A7FEDD
        3FF6B5007BFD1451401F005145140051451400514514005145140051451401F7
        FD1451401E01FB4D7FCCADFF006F7FFB46BE7FAFA03F69AFF995BFEDEFFF0068
        D7CFF40051451400514514005145140051451401F407ECCBFF00334FFDBA7FED
        6AF7FAF00FD997FE669FFB74FF00DAD5EFF4005145140057807ED35FF32B7FDB
        DFFED1AF7FAF00FDA6BFE656FF00B7BFFDA3401F3FD1451401F7FD1451401E01
        FB4D7FCCADFF006F7FFB46BE7FAFA03F69AFF995BFEDEFFF0068D7CFF40057DF
        F5F0057DFF004005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140057807ED35FF0032B7FDBDFF00ED1AF7FAF00FDA6B
        FE656FFB7BFF00DA3401F3FD1451401F7FD14514005145140057C015F7FD7C01
        400514514005145140051451401F407ECCBFF334FF00DBA7FED6AF7FAF00FD99
        7FE669FF00B74FFDAD5EFF004005145140057807ED35FF0032B7FDBDFF00ED1A
        F7FAF00FDA6BFE656FFB7BFF00DA3401F3FD1451401F7FD1451401E01FB4D7FC
        CADFF6F7FF00B46BE7FAFA03F69AFF00995BFEDEFF00F68D7CFF004005145140
        057D01FB32FF00CCD3FF006E9FFB5ABE7FAFA03F665FF99A7FEDD3FF006B5007
        BFD1451401F005145140051451400514514005145140051451401F7FD1451401
        E01FB4D7FCCADFF6F7FF00B46BE7FAFA03F69AFF00995BFEDEFF00F68D7CFF00
        4005145140057D01FB32FF00CCD3FF006E9FFB5ABE7FAFA03F665FF99A7FEDD3
        FF006B5007BFD1451401F0051451400514514005145140051451400514514005
        1451401F407ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFDAD5E
        FF0040057C015F7FD7C0140057D01FB32FFCCD3FF6E9FF00B5ABE7FAFA03F665
        FF0099A7FEDD3FF6B5007BFD1451400514514005145140057C015F7FD7C01400
        57D01FB32FFCCD3FF6E9FF00B5ABE7FAFA03F665FF0099A7FEDD3FF6B5007BFD
        1451401F0051451401F407ECCBFF00334FFDBA7FED6AF7FAF00FD997FE669FFB
        74FF00DAD5EFF40057C015F7FD7C01400514514005145140051451401F407ECC
        BFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFDAD5EFF0040057C015F
        7FD7C0140057D01FB32FFCCD3FF6E9FF00B5ABE7FAFA03F665FF0099A7FEDD3F
        F6B5007BFD1451401F0051451400514514005145140051451400514514005145
        1401F407ECCBFF00334FFDBA7FED6AF7FAF00FD997FE669FFB74FF00DAD5EFF4
        0057C015F7FD7C014005145140051451401F7FD1451400514514005145140051
        4514005145140051451400514514005145140051451400514514005145140051
        451400514514005145140051451400579FFC4DF865FF000B1BFB2FFE26FF00D9
        FF0060F37FE5DBCDDFBF67FB6B8C6CF7EB5E8145007807FC332FFD4DDFF94DFF
        00EDB47FC332FF00D4DDFF0094DFFEDB5EFF004500145145001451450015E01F
        F0CCBFF5377FE537FF00B6D7BFD1401E01FF000CCBFF005377FE537FFB6D1FF0
        CCBFF5377FE537FF00B6D7BFD1401E01FF000CCBFF005377FE537FFB6D1FF0CC
        BFF5377FE537FF00B6D7BFD1401F0051451401F407ECCBFF00334FFDBA7FED6A
        F7FAF00FD997FE669FFB74FF00DAD5EFF40051451400579FFC4DF865FF000B1B
        FB2FFE26FF00D9FF0060F37FE5DBCDDFBF67FB6B8C6CF7EB5E8145007807FC33
        2FFD4DDFF94DFF00EDB47FC332FF00D4DDFF0094DFFEDB5EFF0045007807FC34
        D7FD4A3FF952FF00ED547FC34D7FD4A3FF00952FFED55F3FD1401F407FC9C67F
        D4BDFD85FF006F7E7F9FFF007EF6EDF27DF3BBB6393FE1997FEA6EFF00CA6FFF
        006DA3F665FF0099A7FEDD3FF6B57BFD007807FC332FFD4DDFF94DFF00EDB5F3
        FD7DFF005F0050015F407ECCBFF334FF00DBA7FED6AF9FEBE80FD997FE669FFB
        74FF00DAD401EFF45145007807FC332FFD4DDFF94DFF00EDB47FC332FF00D4DD
        FF0094DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00EDB47FC332FF00D4DD
        FF0094DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00EDB47FC332FF00D4DD
        FF0094DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00EDB47FC332FF00D4DD
        FF0094DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00EDB47FC332FF00D4DD
        FF0094DFFEDB5EFF0045007807FC34D7FD4A3FF952FF00ED547FC34D7FD4A3FF
        00952FFED55F3FD1401E81F137E26FFC2C6FECBFF8947F67FD83CDFF00979F37
        7EFD9FEC2E31B3DFAD79FD1450015F407FC332FF00D4DDFF0094DFFEDB5F3FD7
        DFF401E01FF0CCBFF5377FE537FF00B6D1FF0026E7FF00530FF6EFFDBA791E47
        FDFCDDBBCEF6C6DEF9E3DFEBC03F69AFF995BFEDEFFF0068D001FF000D35FF00
        528FFE54BFFB551FF0D35FF528FF00E54BFF00B557CFF4500145145007A07C32
        F865FF000B1BFB53FE26FF00D9FF0060F2BFE5DBCDDFBF7FFB6B8C6CF7EB5E81
        FF000CCBFF005377FE537FFB6D1FB32FFCCD3FF6E9FF00B5ABDFE803C03FE199
        7FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DAF7FA2803C03FE1997F
        EA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DAF7FA2803C03FE1997FEA
        6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DAF7FA2803E00A28A2803E80
        FD997FE669FF00B74FFDAD5EFF005E01FB32FF00CCD3FF006E9FFB5ABDFE800A
        F00FF8665FFA9BBFF29BFF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFD
        B68FF9373FFA987FB77FEDD3C8F23FEFE6EDDE77B636F7CF1EFF005E01FB4D7F
        CCADFF006F7FFB46800FF869AFFA947FF2A5FF00DAA8FF00869AFF00A947FF00
        2A5FFDAABE7FA2803EFF00A28A2803CFFE26FC4DFF008573FD97FF00128FED0F
        B7F9BFF2F3E56CD9B3FD86CE77FB74AE03FE1A6BFEA51FFCA97FF6AA3F69AFF9
        95BFEDEFFF0068D7CFF401F407FC34D7FD4A3FF952FF00ED547FC332FF00D4DD
        FF0094DFFEDB5F3FD7DFF401E01FF0CCBFF5377FE537FF00B6D77FF0CBE197FC
        2B9FED4FF89BFF00687DBFCAFF00976F2B66CDFF00EDB673BFDBA57A05140051
        451401F0051451401F407ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00
        B74FFDAD5EFF0040057807FC332FFD4DDFF94DFF00EDB5EFF45007807FC332FF
        00D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF45007807FC332FF00
        D4DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF45007807FC332FF00D4
        DDFF0094DFFEDB47FC332FFD4DDFF94DFF00EDB5EFF450079FFC32F865FF000A
        E7FB53FE26FF00DA1F6FF2BFE5DBCAD9B37FFB6D9CEFF6E95E8145140057807F
        C332FF00D4DDFF0094DFFEDB5EFF0045007807FC332FFD4DDFF94DFF00EDB47F
        C9B9FF00D4C3FDBBFF006E9E4791FF007F376EF3BDB1B7BE78F7FAF00FDA6BFE
        656FFB7BFF00DA34007FC34D7FD4A3FF00952FFED547FC34D7FD4A3FF952FF00
        ED55F3FD140051451401E81F0CBE197FC2C6FED4FF0089BFF67FD83CAFF976F3
        77EFDFFEDAE31B3DFAD7A07FC332FF00D4DDFF0094DFFEDB47ECCBFF00334FFD
        BA7FED6AF7FA00F00FF8665FFA9BBFF29BFF00DB68FF008665FF00A9BBFF0029
        BFFDB6BDFE8A00F00FF8665FFA9BBFF29BFF00DB68FF008665FF00A9BBFF0029
        BFFDB6BDFE8A00F00FF8665FFA9BBFF29BFF00DB68FF008665FF00A9BBFF0029
        BFFDB6BDFE8A00F8028A28A00F40F865F137FE15CFF6A7FC4A3FB43EDFE57FCB
        CF95B366FF00F61B39DFEDD2BD03FE1A6BFEA51FFCA97FF6AAF9FE8A00FA03FE
        1A6BFEA51FFCA97FF6AA3FE1997FEA6EFF00CA6FFF006DAF9FEBEFFA00F00FF8
        665FFA9BBFF29BFF00DB6BCFFE26FC32FF008573FD97FF00137FED0FB7F9BFF2
        EDE56CD9B3FDB6CE77FB74AFAFEBC03F69AFF995BFEDEFFF0068D007CFF45145
        007D01FF000D35FF00528FFE54BFFB551FF0D35FF528FF00E54BFF00B557CFF4
        5007D7FF000CBE26FF00C2C6FED4FF008947F67FD83CAFF979F377EFDFFEC2E3
        1B3DFAD7A057807ECCBFF334FF00DBA7FED6AF7FA0028A28A0028A28A0028A28
        A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028AF8
        028A00FBFE8AF8028A00FBFE8AF8028A00FBFE8AF8028A00FBFE8AF8028A00FB
        FE8AF8028A00FBFE8AF8028A00FBFE8AF8028A00FBFE8AF802BE80FD997FE669
        FF00B74FFDAD401EFF0045145007C0145145007D01FB32FF00CCD3FF006E9FFB
        5ABDFEBE00A2803EFF00A2BE00AFBFE800A28AF00FDA6BFE656FFB7BFF00DA34
        01EFF457C0145001457DFF0045007807ECCBFF00334FFDBA7FED6AF7FA28A002
        BE00AFBFE8A00F802BE80FD997FE669FFB74FF00DAD5EFF5E01FB4D7FCCADFF6
        F7FF00B46803DFE8AF8028A00FBFE8AF8028A00FBFE8AF8028A00FBFE8AF802B
        EFFA0028A28A0028A28A00F8028A28A0028A28A002BEFF00AF802BEFFA002BC0
        3F69AFF995BFEDEFFF0068D7BFD7807ED35FF32B7FDBDFFED1A00F9FE8A28A00
        28A28A00FA03F665FF0099A7FEDD3FF6B57BFD7807ECCBFF00334FFDBA7FED6A
        F7FA0028A2BE00A00FBFE8AF802BE80FD997FE669FFB74FF00DAD401EFF45145
        007C0145145007D01FB32FFCCD3FF6E9FF00B5ABDFEBE00A2803EFFA2BE00A28
        03EFFAF00FDA6BFE656FFB7BFF00DA35F3FD140051451401F7FD15F0051401F4
        07ED35FF0032B7FDBDFF00ED1AF9FEBE80FD997FE669FF00B74FFDAD5EFF0040
        1F0057DFF4514005145140051451401F0051451401F407ECCBFF00334FFDBA7F
        ED6AF7FAF00FD997FE669FFB74FF00DAD5EFF4005145140051457807ED35FF00
        32B7FDBDFF00ED1A00F7FA2BE00A2803EFFA2BE00A2803EFFA2BE00A2803EFFA
        2BE00AFBFE800AF00FDA6BFE656FFB7BFF00DA35EFF5E01FB4D7FCCADFF6F7FF
        00B46803E7FA28A2800A28A2803E80FD997FE669FF00B74FFDAD5EFF005E01FB
        32FF00CCD3FF006E9FFB5ABDFE800A28AF802803EFFA2BE00AFA03F665FF0099
        A7FEDD3FF6B5007BFD1451401F00514514005145140057DFF5F0051401F7FD78
        07ED35FF0032B7FDBDFF00ED1AF9FEBE80FD997FE669FF00B74FFDAD401F3FD1
        5F7FD1401F00515F7FD1401E01FB32FF00CCD3FF006E9FFB5ABDFE8A2800A28A
        2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A
        2800A28A2803E00A28A2800A2BD03E197C32FF00858DFDA9FF00137FECFF00B0
        795FF2EDE6EFDFBFFDB5C6367BF5AF40FF008665FF00A9BBFF0029BFFDB6803E
        7FA2BE80FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29BFF00DB6803
        E7FA2BE80FF8665FFA9BBFF29BFF00DB68FF008665FF00A9BBFF0029BFFDB680
        3E7FA2BE80FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29BFF00DB68
        03E7FA2BE80FF8665FFA9BBFF29BFF00DB68FF008665FF00A9BBFF0029BFFDB6
        803E7FA2BE80FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29BFF00DB
        6803E7FA2BE80FF8665FFA9BBFF29BFF00DB6BE7FA002BE80FD997FE669FFB74
        FF00DAD5F3FD7D01FB32FF00CCD3FF006E9FFB5A803DFE8A28A00F8028A28A00
        28A28A002BEFFAF802BE80FF00869AFF00A947FF002A5FFDAA803DFEBC03F69A
        FF00995BFEDEFF00F68D1FF0D35FF528FF00E54BFF00B551FF002719FF0052F7
        F617FDBDF9FE7FFDFBDBB7C9F7CEEED8E403E7FA2BE80FF8665FFA9BBFF29BFF
        00DB68FF008665FF00A9BBFF0029BFFDB6803DFE8A28A0028AF3FF0089BF137F
        E15CFF0065FF00C4A3FB43EDFE6FFCBCF95B366CFF0061B39DFEDD2B80FF0086
        9AFF00A947FF002A5FFDAA803DFE8AF00FF869AFFA947FF2A5FF00DAA8FF0086
        9AFF00A947FF002A5FFDAA803DFEBC03F69AFF00995BFEDEFF00F68D1FF0D35F
        F528FF00E54BFF00B5579FFC4DF89BFF000B1BFB2FFE251FD9FF0060F37FE5E7
        CDDFBF67FB0B8C6CF7EB401E7F45145001457D01FF000CCBFF005377FE537FFB
        6D1FF0CCBFF5377FE537FF00B6D007CFF457A07C4DF865FF000AE7FB2FFE26FF
        00DA1F6FF37FE5DBCAD9B367FB6D9CEFF6E95E7F40057DFF005F0057D01FF0D3
        5FF528FF00E54BFF00B55007BFD15E01FF000D35FF00528FFE54BFFB551FF0D3
        5FF528FF00E54BFF00B55007BFD15E01FF000D35FF00528FFE54BFFB551FF0D3
        5FF528FF00E54BFF00B55007CFF45145001451450015F7FD7C015F407FC34D7F
        D4A3FF00952FFED5401EFF005E01FB4D7FCCADFF006F7FFB468FF869AFFA947F
        F2A5FF00DAABCFFE26FC4DFF00858DFD97FF00128FECFF00B079BFF2F3E6EFDF
        B3FD85C6367BF5A00F3FA28A2800A28A2803E80FD997FE669FFB74FF00DAD5EF
        F5E01FB32FFCCD3FF6E9FF00B5ABDFE800AF802BEFFAF00FF8665FFA9BBFF29B
        FF00DB6803E7FAFA03F665FF0099A7FEDD3FF6B51FF0CCBFF5377FE537FF00B6
        D77FF0CBE197FC2B9FED4FF89BFF00687DBFCAFF00976F2B66CDFF00EDB673BF
        DBA5007A051451401F0051451400515E81F0CBE197FC2C6FED4FF89BFF0067FD
        83CAFF00976F377EFDFF00EDAE31B3DFAD7A07FC332FFD4DDFF94DFF00EDB401
        F3FD15F407FC332FFD4DDFF94DFF00EDB5F3FD00145145001451450014514500
        7D01FB32FF00CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD3FF6B57BFD00
        1451450014514500145145007C0145145007D01FB32FFCCD3FF6E9FF00B5ABDF
        EBC03F665FF99A7FEDD3FF006B57BFD001451450015E01FB4D7FCCADFF006F7F
        FB46BDFEBC03F69AFF00995BFEDEFF00F68D007CFF0045145001451450014514
        50015F7FD7C015F407FC34D7FD4A3FF952FF00ED5401EFF5E01FB4D7FCCADFF6
        F7FF00B468FF00869AFF00A947FF002A5FFDAABCFF00E26FC4DFF858DFD97FF1
        28FECFFB079BFF002F3E6EFDFB3FD85C6367BF5A00F3FA28A2800A28A2803E80
        FD997FE669FF00B74FFDAD5EFF005E01FB32FF00CCD3FF006E9FFB5ABDFE800A
        F802BEFF00AF00FF008665FF00A9BBFF0029BFFDB6803E7FAFA03F665FF99A7F
        EDD3FF006B51FF000CCBFF005377FE537FFB6D77FF000CBE197FC2B9FED4FF00
        89BFF687DBFCAFF976F2B66CDFFEDB673BFDBA5007A051451401F00514514005
        14514005145140057D01FB32FF00CCD3FF006E9FFB5ABE7FAFA03F665FF99A7F
        EDD3FF006B5007BFD14514005145140051451400514514005145140051451400
        51451400514514005145140051451400514514005145140051451401F0051451
        401F407ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFDAD5EFF00
        400514514005145140051451400514514005145140057C015F7FD7C0140057D0
        1FB32FFCCD3FF6E9FF00B5ABE7FAFA03F665FF0099A7FEDD3FF6B5007BFD1451
        401F0051451400514514005145140057D01FB32FFCCD3FF6E9FF00B5ABE7FAFA
        03F665FF0099A7FEDD3FF6B5007BFD145140051451401E01FB4D7FCCADFF006F
        7FFB46BE7FAFA03F69AFF995BFEDEFFF0068D7CFF40051451400514514005145
        1401F7FD1451401E01FB4D7FCCADFF006F7FFB46BE7FAFA03F69AFF995BFEDEF
        FF0068D7CFF40051451400514514005145140051451400514514005145140051
        4514005145140051451401F407ECCBFF00334FFDBA7FED6AF7FAF00FD997FE66
        9FFB74FF00DAD5EFF400514514005145140051451401F0051451401F407ECCBF
        F334FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFDAD5EFF0040057C015F7F
        D7C01400514514005145140051451401F407ECCBFF00334FFDBA7FED6AF7FAF0
        0FD997FE669FFB74FF00DAD5EFF400514514005145140051451401F005145140
        1F407ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFDAD5EFF0040
        05145140057807ED35FF0032B7FDBDFF00ED1AF7FAF00FDA6BFE656FFB7BFF00
        DA3401F3FD145140051451400514514005145140051451400514514005145140
        1F407ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFDAD5EFF0040
        0514514005145140051451401F0051451400514514005145140057D01FB32FFC
        CD3FF6E9FF00B5ABE7FAFA03F665FF0099A7FEDD3FF6B5007BFD145140051451
        4005145140051451400514514005145140051451400514514005145140051451
        400514514005145140051451401F0051451401F407ECCBFF00334FFDBA7FED6A
        F7FAF00FD997FE669FFB74FF00DAD5EFF40057C015F7FD7C0140051451400514
        5140051451401F407ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B74F
        FDAD5EFF0040057C015F7FD7C0140057D01FB32FFCCD3FF6E9FF00B5ABE7FAFA
        03F665FF0099A7FEDD3FF6B5007BFD145140051451401E01FB4D7FCCADFF006F
        7FFB46BE7FAFA03F69AFF995BFEDEFFF0068D7CFF40051451400514514005145
        1401F7FD145140051451400514514005145140051451401F0051451401F407EC
        CBFF00334FFDBA7FED6AF7FAF00FD997FE669FFB74FF00DAD5EFF40057C015F7
        FD7C014005145140051451401F7FD1451401E01FB4D7FCCADFF6F7FF00B46BE7
        FAFA03F69AFF00995BFEDEFF00F68D7CFF004005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        145140051451400514514005145140057DFF005F0057DFF40051451400514514
        01F00514514005145140057DFF005F0057DFF4005145140051451401F0051451
        401F407ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFDAD5EFF00
        400514514005145140051451401F005145140051451400514514005145140051
        451400514514005145140057DFF5F0057DFF0040051451400514514005145140
        0514514005145140051451400514514005145140051451400514514005145140
        0514514005145140051451401F0051451401F407ECCBFF00334FFDBA7FED6AF7
        FAF00FD997FE669FFB74FF00DAD5EFF40057C015F7FD7C014005145140051451
        40051451401F407ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B74FFD
        AD5EFF0040057C015F7FD7C0140057D01FB32FFCCD3FF6E9FF00B5ABE7FAFA03
        F665FF0099A7FEDD3FF6B5007BFD1451401E01FF000D35FF00528FFE54BFFB55
        1FF0D35FF528FF00E54BFF00B557CFF45007D01FF2719FF52F7F617FDBDF9FE7
        FF00DFBDBB7C9F7CEEED8E4FF8665FFA9BBFF29BFF00DB68FD997FE669FF00B7
        4FFDAD5EFF00401E01FF000CCBFF005377FE537FFB6D7CFF005F7FD7C0140057
        A07C32F865FF000B1BFB53FE26FF00D9FF0060F2BFE5DBCDDFBF7FFB6B8C6CF7
        EB5E7F5F407ECCBFF334FF00DBA7FED6A003FE1997FEA6EFFCA6FF00F6DA3FE1
        997FEA6EFF00CA6FFF006DAF7FA2800A28A2800A28A2800AF00FF869AFFA947F
        F2A5FF00DAABDFEBE00A00FA03FE1A6BFEA51FFCA97FF6AAEFFE197C4DFF0085
        8DFDA9FF00128FECFF00B0795FF2F3E6EFDFBFFD85C6367BF5AF902BE80FD997
        FE669FFB74FF00DAD401EFF45145007807FC332FFD4DDFF94DFF00EDB47FC332
        FF00D4DDFF0094DFFEDB5EFF0045007807FC9B9FFD4C3FDBBFF6E9E4791FF7F3
        76EF3BDB1B7BE783FE1A6BFEA51FFCA97FF6AA3F69AFF995BFEDEFFF0068D7CF
        F401F407FC34D7FD4A3FF952FF00ED547FC332FF00D4DDFF0094DFFEDB5F3FD7
        DFF401E01FF0CCBFF5377FE537FF00B6D79FFC4DF865FF000AE7FB2FFE26FF00
        DA1F6FF37FE5DBCAD9B367FB6D9CEFF6E95F5FD7807ED35FF32B7FDBDFFED1A0
        0F9FE8A28A00FBFE8A28A00F3FF89BF0CBFE1637F65FFC4DFF00B3FEC1E6FF00
        CBB79BBF7ECFF6D718D9EFD6B80FF8665FFA9BBFF29BFF00DB6BDFE8A00F00FF
        008665FF00A9BBFF0029BFFDB6BE7FAFBFEBE00A0028A28A0028A28A0028A28A
        0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
        0028A28A00FA03FE1997FEA6EFFCA6FF00F6DA3FE1997FEA6EFF00CA6FFF006D
        AF7FA2803C03FE1997FEA6EFFCA6FF00F6DA3FE1997FEA6EFF00CA6FFF006DAF
        7FA2803C03FE1997FEA6EFFCA6FF00F6DA3FE1A6BFEA51FF00CA97FF006AAF7F
        AF802803E80FF869AFFA947FF2A5FF00DAABBFF865F137FE1637F6A7FC4A3FB3
        FEC1E57FCBCF9BBF7EFF00F61718D9EFD6BE40AFA03F665FF99A7FEDD3FF006B
        5007BFD1451401F00514514005145140057DFF005F0057DFF400514514005145
        1401F0051451401F407ECCBFF334FF00DBA7FED6AF7FAF00FD997FE669FF00B7
        4FFDAD5EFF00400514514005145140051451401F005145140051451400514514
        0057A07C32F865FF000B1BFB53FE26FF00D9FF0060F2BFE5DBCDDFBF7FFB6B8C
        6CF7EB5E7F5F407ECCBFF334FF00DBA7FED6A003FE1997FEA6EFFCA6FF00F6DA
        3FE1997FEA6EFF00CA6FFF006DAF7FA2803E00A28A2803D03E197C32FF00858D
        FDA9FF00137FECFF00B0795FF2EDE6EFDFBFFDB5C6367BF5AF40FF008665FF00
        A9BBFF0029BFFDB68FD997FE669FFB74FF00DAD5EFF401E01FF0CCBFF5377FE5
        37FF00B6D7BFD145001451450014514500145145001451450014514500145145
        0014514500145145001451450014514500145145001451450014514500145145
        007C0145145007D01FB32FFCCD3FF6E9FF00B5ABDFEBC03F665FF99A7FEDD3FF
        006B57BFD0015F0057DFF5F005001451450014514500145145007D01FB32FF00
        CCD3FF006E9FFB5ABDFEBC03F665FF0099A7FEDD3FF6B57BFD0015F0057DFF00
        5F0050015F407ECCBFF334FF00DBA7FED6AF9FEBE80FD997FE669FFB74FF00DA
        D401EFF45145007C01457DFF0045007807ECCBFF00334FFDBA7FED6AF7FAF00F
        DA6BFE656FFB7BFF00DA35F3FD007DFF005F0051450015F407ECCBFF00334FFD
        BA7FED6AF9FE8A00FBFE8AF8028A00FBFE8AF8028A00FBFE8AF00FD997FE669F
        FB74FF00DAD5EFF40057C015F7FD7C0140057D01FB32FF00CCD3FF006E9FFB5A
        BE7FA2803EFF00A2BE00A2803EFF00A2BE00A2803E80FDA6BFE656FF00B7BFFD
        A35F3FD7D01FB32FFCCD3FF6E9FF00B5ABDFE803E00AFBFE8AF802803EFF00AF
        00FDA6BFE656FF00B7BFFDA35F3FD140051451401F7FD15F0051401F7FD15E01
        FB32FF00CCD3FF006E9FFB5ABDFE800AF802BEFF00A2803E00A2BEFF00AF00FD
        A6BFE656FF00B7BFFDA3401F3FD1451400514514005145140051457DFF00401F
        00515F7FD1401F00515F7FD1401F00515F7FD1401F00515F407ED35FF32B7FDB
        DFFED1AF9FE800A28AFBFE803E00A2BEFF00AF00FDA6BFE656FF00B7BFFDA340
        1F3FD1451401F7FD14514005145140057C015F7FD1401F0057D01FB32FFCCD3F
        F6E9FF00B5ABDFEBC03F69AFF995BFEDEFFF0068D007BFD15F00514005145140
        0515F407ECCBFF00334FFDBA7FED6AF7FA00F802BEFF00A2BE00A00FBFE8AF80
        2BE80FD997FE669FFB74FF00DAD401EFF45145007C0145145007D01FB32FFCCD
        3FF6E9FF00B5ABDFEBE00A2803EFFA2BE00A2803EFFA2BE00A2803EFFA2BE00A
        2800A2BEFF00A2803E00A2BEFF00A2803E00A2BEFF00AF802800AFA03F665FF9
        9A7FEDD3FF006B57CFF45007DFF457C014500145145007D01FB32FFCCD3FF6E9
        FF00B5ABDFEBC03F665FF99A7FEDD3FF006B57BFD001451450014515E01FB4D7
        FCCADFF6F7FF00B46803DFE8AF8028A00FBFE8AF8028A00FBFE8AF00FD997FE6
        69FF00B74FFDAD5EFF0040051451400514514005145140051451400514514005
        145140051451400514514005145140051451401F0051451401F407ECCBFF0033
        4FFDBA7FED6AF7FAF00FD997FE669FFB74FF00DAD5EFF40057C015F7FD7807FC
        332FFD4DDFF94DFF00EDB401F3FD15F407FC332FFD4DDFF94DFF00EDB47FC332
        FF00D4DDFF0094DFFEDB401F3FD15F407FC332FF00D4DDFF0094DFFEDB47FC33
        2FFD4DDFF94DFF00EDB401F3FD15F407FC332FFD4DDFF94DFF00EDB47FC332FF
        00D4DDFF0094DFFEDB4007ECCBFF00334FFDBA7FED6AF7FAF3FF00865F0CBFE1
        5CFF006A7FC4DFFB43EDFE57FCBB795B366FFF006DB39DFEDD2BD02800AF802B
        EFFAF802800AFA03F665FF0099A7FEDD3FF6B57CFF005F407ECCBFF334FF00DB
        A7FED6A00F7FA28A2800A2BC03FE1A6BFEA51FFCA97FF6AA3FE1A6BFEA51FF00
        CA97FF006AA003F69AFF00995BFEDEFF00F68D7CFF005F407FC9C67FD4BDFD85
        FF006F7E7F9FFF007EF6EDF27DF3BBB6393FE1997FEA6EFF00CA6FFF006DA00F
        9FE8AFA03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DA00F9
        FE8AFA03FE1997FEA6EFFCA6FF00F6DAF3FF0089BF0CBFE15CFF0065FF00C4DF
        FB43EDFE6FFCBB795B366CFF006DB39DFEDD2803CFE8A28A0028A28A00FA03F6
        65FF0099A7FEDD3FF6B57BFD7807ECCBFF00334FFDBA7FED6AF7FA002BE00AFB
        FEBC03FE1997FEA6EFFCA6FF00F6DA00F9FE8AFA03FE1997FEA6EFFCA6FF00F6
        DAF3FF0089BF0CBFE15CFF0065FF00C4DFFB43EDFE6FFCBB795B366CFF006DB3
        9DFEDD2803CFE8A28A0028A28A00FA03F665FF0099A7FEDD3FF6B57BFD7807EC
        CBFF00334FFDBA7FED6AF7FA002BE00AFBFEBE00A0028A28A0028A28A0028AFA
        03FE1997FEA6EFFCA6FF00F6DA3FE1997FEA6EFF00CA6FFF006DA003F665FF00
        99A7FEDD3FF6B57BFD7807FC9B9FFD4C3FDBBFF6E9E4791FF7F376EF3BDB1B7B
        E783FE1A6BFEA51FFCA97FF6AA00F7FA2BC03FE1A6BFEA51FF00CA97FF006AA3
        FE1A6BFEA51FFCA97FF6AA00F7FAF00FDA6BFE656FFB7BFF00DA347FC34D7FD4
        A3FF00952FFED547FC9C67FD4BDFD85FF6F7E7F9FF00F7EF6EDF27DF3BBB6390
        0F9FE8AFA03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DA00
        F9FE8A28A0028A28A002BEFF00AF802BE80FF869AFFA947FF2A5FF00DAA803DF
        E8AF00FF00869AFF00A947FF002A5FFDAABBFF00865F137FE1637F6A7FC4A3FB
        3FEC1E57FCBCF9BBF7EFFF0061718D9EFD6803D028A28A0028AF00FF00869AFF
        00A947FF002A5FFDAA8FF869AFFA947FF2A5FF00DAA800FDA6BFE656FF00B7BF
        FDA35F3FD7D01FF2719FF52F7F617FDBDF9FE7FF00DFBDBB7C9F7CEEED8E4FF8
        665FFA9BBFF29BFF00DB6803E7FAFBFEBC03FE1997FEA6EFFCA6FF00F6DA3FE1
        A6BFEA51FF00CA97FF006AA00F7FAF00FDA6BFE656FF00B7BFFDA347FC34D7FD
        4A3FF952FF00ED55E7FF00137E26FF00C2C6FECBFF008947F67FD83CDFF979F3
        77EFD9FEC2E31B3DFAD0079FD1451401F7FD1451400515E7FF00137E26FF00C2
        B9FECBFF008947F687DBFCDFF979F2B66CD9FEC3673BFDBA5701FF000D35FF00
        528FFE54BFFB55007BFD15E01FF0D35FF528FF00E54BFF00B557BFD0015E01FB
        4D7FCCADFF006F7FFB46BDFEBCFF00E26FC32FF858DFD97FF137FECFFB079BFF
        002EDE6EFDFB3FDB5C6367BF5A00F9028AFA03FE1997FEA6EFFCA6FF00F6DA3F
        E1997FEA6EFF00CA6FFF006DA00F9FE8AFA03FE1997FEA6EFF00CA6FFF006DA3
        FE1997FEA6EFFCA6FF00F6DA003F665FF99A7FEDD3FF006B57BFD7807FC9B9FF
        00D4C3FDBBFF006E9E4791FF007F376EF3BDB1B7BE783FE1A6BFEA51FF00CA97
        FF006AA00F7FAF802BE80FF869AFFA947FF2A5FF00DAABE7FA002BE80FD997FE
        669FFB74FF00DAD5F3FD7A07C32F89BFF0AE7FB53FE251FDA1F6FF002BFE5E7C
        AD9B37FF00B0D9CEFF006E9401F5FD15E01FF0D35FF528FF00E54BFF00B551FF
        000D35FF00528FFE54BFFB55007CFF00457D01FF000CCBFF005377FE537FFB6D
        1FF0CCBFF5377FE537FF00B6D007CFF457D01FF0CCBFF5377FE537FF00B6D1FF
        000CCBFF005377FE537FFB6D007CFF00457D01FF000CCBFF005377FE537FFB6D
        1FF0CCBFF5377FE537FF00B6D007CFF457D01FF0CCBFF5377FE537FF00B6D79F
        FC4DF865FF000AE7FB2FFE26FF00DA1F6FF37FE5DBCAD9B367FB6D9CEFF6E940
        1E7F45145007DFF451450014579FFC4DF89BFF000AE7FB2FFE251FDA1F6FF37F
        E5E7CAD9B367FB0D9CEFF6E95C07FC34D7FD4A3FF952FF00ED5401EFF5F0057D
        01FF000D35FF00528FFE54BFFB551FF0CCBFF5377FE537FF00B6D007CFF457D0
        1FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE537FFB6D007CFF00457D
        01FF000CCBFF005377FE537FFB6D1FF0CCBFF5377FE537FF00B6D007CFF457D0
        1FF0CCBFF5377FE537FF00B6D1FF000CCBFF005377FE537FFB6D001FB32FFCCD
        3FF6E9FF00B5ABDFEBC03FE4DCFF00EA61FEDDFF00B74F23C8FF00BF9BB779DE
        D8DBDF3C1FF0D35FF528FF00E54BFF00B55007BFD15E01FF000D35FF00528FFE
        54BFFB557BFD0015E01FB4D7FCCADFF6F7FF00B46BDFEBC03F69AFF995BFEDEF
        FF0068D007CFF45145001457D01FF0CCBFF5377FE537FF00B6D1FF000CCBFF00
        5377FE537FFB6D001FB32FFCCD3FF6E9FF00B5ABDFEBCFFE197C32FF008573FD
        A9FF00137FED0FB7F95FF2EDE56CD9BFFDB6CE77FB74AF40A0028A28A0028A28
        A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28
        A00F8028A28A00FA03F665FF0099A7FEDD3FF6B57BFD7807ECCBFF00334FFDBA
        7FED6AF7FA0028A28A0028A28A0028A28A0028A28A0028A28A002BE00AFBFEBE
        00A002BE80FD997FE669FF00B74FFDAD5F3FD7D01FB32FFCCD3FF6E9FF00B5A8
        03DFE8A28A00F8028A28A00FA03F665FF99A7FEDD3FF006B57BFD7807ECCBFF3
        34FF00DBA7FED6AF7FA0028A28A002BC03F69AFF00995BFEDEFF00F68D7BFD78
        07ED35FF0032B7FDBDFF00ED1A00F9FE8A28A0028A28A00FA03F665FF99A7FED
        D3FF006B57BFD7807ECCBFF334FF00DBA7FED6AF7FA0028A28A002BC03F69AFF
        00995BFEDEFF00F68D7BFD7807ED35FF0032B7FDBDFF00ED1A00F9FE8A28A002
        8A28A00FA03F665FF99A7FEDD3FF006B57BFD7807ECCBFF334FF00DBA7FED6AF
        7FA002BE00AFBFEBE00A0028A28A0028A28A00FBFE8A28A00F00FDA6BFE656FF
        00B7BFFDA35F3FD7D01FB4D7FCCADFF6F7FF00B46BE7FA0028A28A002BE80FD9
        97FE669FFB74FF00DAD5F3FD7D01FB32FF00CCD3FF006E9FFB5A803DFE8A28A0
        0F8028A28A0028A28A0028A28A002BE80FD997FE669FFB74FF00DAD5F3FD7D01
        FB32FF00CCD3FF006E9FFB5A803DFE8A28A00F8028A28A00FA03F665FF0099A7
        FEDD3FF6B57BFD7807ECCBFF00334FFDBA7FED6AF7FA002BE00AFBFEBE00A002
        8A28A0028A28A00FBFE8A28A00F00FDA6BFE656FFB7BFF00DA35F3FD7D01FB4D
        7FCCADFF006F7FFB46BE7FA002BEFF00AF802BEFFA0028A28A0028A28A0028A2
        8A00F00FDA6BFE656FFB7BFF00DA35F3FD7D01FB4D7FCCADFF006F7FFB46BE7F
        A0028A28A0028A28A0028A28A00FBFE8A28A0028A28A0028A28A002BC03F69AF
        F995BFEDEFFF0068D7BFD7807ED35FF32B7FDBDFFED1A00F9FE8A28A00FBFE8A
        28A00F00FDA6BFE656FF00B7BFFDA35F3FD7D01FB4D7FCCADFF6F7FF00B46BE7
        FA002BEFFAF802BEFF00A0028A28A0028A28A0028A28A00F00FDA6BFE656FF00
        B7BFFDA35F3FD7D01FB4D7FCCADFF6F7FF00B46BE7FA002BEFFAF802BEFF00A0
        02BC03F69AFF00995BFEDEFF00F68D7BFD7807ED35FF0032B7FDBDFF00ED1A00
        F9FE8A28A00FBFE8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
        A28A0028A28A0028A28A0028A28A0028A28A0028A28A00F8028A28A0028A28A0
        028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002BE80FD997FE669
        FF00B74FFDAD5F3FD7D01FB32FFCCD3FF6E9FF00B5A803DFE8A28A0028A28A00
        F00FDA6BFE656FFB7BFF00DA35F3FD7D01FB4D7FCCADFF006F7FFB46BE7FA002
        BEFF00AF802BEFFA002BC03F69AFF995BFEDEFFF0068D7BFD7807ED35FF32B7F
        DBDFFED1A00F9FE8A28A0028A28A00FA03F665FF0099A7FEDD3FF6B57BFD7807
        ECCBFF00334FFDBA7FED6AF7FA0028A28A0028A28A0028A28A0028A28A0028A2
        8A002BE00AFBFEBE00A002BE80FD997FE669FF00B74FFDAD5F3FD7D01FB32FFC
        CD3FF6E9FF00B5A803DFE8A28A00F8028A28A00FA03F665FF99A7FEDD3FF006B
        57BFD7807ECCBFF334FF00DBA7FED6AF7FA0028A28A0028A28A0028A28A0028A
        28A00F00FDA6BFE656FF00B7BFFDA35F3FD7D01FB4D7FCCADFF6F7FF00B46BE7
        FA0028A28A0028A28A0028A28A00FBFE8A28A00F00FDA6BFE656FF00B7BFFDA3
        5F3FD7D01FB4D7FCCADFF6F7FF00B46BE7FA0028A28A002BE80FD997FE669FFB
        74FF00DAD5F3FD7D01FB32FF00CCD3FF006E9FFB5A803DFE8A28A00F8028A28A
        0028A28A0028A28A0028A28A0028A28A0028A28A00FA03F665FF0099A7FEDD3F
        F6B57BFD7807ECCBFF00334FFDBA7FED6AF7FA002BE00AFBFEBE00A0028A28A0
        028A28A00FBFE8A28A0028A28A0028A28A0028A28A0028A28A00F8028A28A00F
        A03F665FF99A7FEDD3FF006B57BFD7807ECCBFF334FF00DBA7FED6AF7FA002BE
        00AFBFEBE00A002BE80FD997FE669FFB74FF00DAD5F3FD7D01FB32FF00CCD3FF
        006E9FFB5A803DFE8A28A00F8028A28A00FA03F665FF0099A7FEDD3FF6B57BFD
        7807ECCBFF00334FFDBA7FED6AF7FA0028A28A002BC03F69AFF995BFEDEFFF00
        68D7BFD7807ED35FF32B7FDBDFFED1A00F9FE8A28A00FBFE8A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29B
        FF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29B
        FF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29B
        FF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29B
        FF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29B
        FF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29B
        FF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29B
        FF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB68FF8665FFA9BBFF29B
        FF00DB6BDFE8A00F00FF008665FF00A9BBFF0029BFFDB6BBFF00865F0CBFE15C
        FF006A7FC4DFFB43EDFE57FCBB795B366FFF006DB39DFEDD2BD028A0028A28A0
        028A28A00F3FF89BF0CBFE1637F65FFC4DFF00B3FEC1E6FF00CBB79BBF7ECFF6
        D718D9EFD6B80FF8665FFA9BBFF29BFF00DB6BDFE8A00F00FF008665FF00A9BB
        FF0029BFFDB6BDFE8A2800AF3FF89BF0CBFE1637F65FFC4DFF00B3FEC1E6FF00
        CBB79BBF7ECFF6D718D9EFD6BD028A00F00FF8665FFA9BBFF29BFF00DB68FF00
        8665FF00A9BBFF0029BFFDB6BDFE8A00F00FF8665FFA9BBFF29BFF00DB68FF00
        8665FF00A9BBFF0029BFFDB6BDFE8A00F3FF00865F0CBFE15CFF006A7FC4DFFB
        43EDFE57FCBB795B366FFF006DB39DFEDD2BD028A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800AF00FF8665FFA9BBFF29BFF00DB6BDFE8A00F00FF00
        8665FF00A9BBFF0029BFFDB6BBFF00865F0CBFE15CFF006A7FC4DFFB43EDFE57
        FCBB795B366FFF006DB39DFEDD2BD028A0028A28A00F00FF008665FF00A9BBFF
        0029BFFDB68FF8665FFA9BBFF29BFF00DB6BDFE8A00F3FF865F0CBFE15CFF6A7
        FC4DFF00B43EDFE57FCBB795B366FF00F6DB39DFEDD2BD028A2800A28A2800A2
        8A2800A28A2800A28A2803CFFE26FC32FF00858DFD97FF00137FECFF00B079BF
        F2EDE6EFDFB3FDB5C6367BF5AE03FE1997FEA6EFFCA6FF00F6DAF7FA2803C03F
        E1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DAF7FA2803C03FE1
        997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DAF7FA2803C03FE199
        7FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DAF7FA2800A28A2803CF
        FE26FC32FF00858DFD97FF00137FECFF00B079BFF2EDE6EFDFB3FDB5C6367BF5
        AE03FE1997FEA6EFFCA6FF00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006D
        A3FE1997FEA6EFFCA6FF00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DAE
        FF00E197C32FF8573FDA9FF137FED0FB7F95FF002EDE56CD9BFF00DB6CE77FB7
        4AF40A2800A28A2803C03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6
        FF00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF
        00F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00
        F6DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6
        DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DA
        F7FA2803C03FE1997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DAF7
        FA2803CFFE197C32FF008573FDA9FF00137FED0FB7F95FF2EDE56CD9BFFDB6CE
        77FB74AF40A28A002BC03FE1997FEA6EFF00CA6FFF006DAF7FA2803C03FE1997
        FEA6EFFCA6FF00F6DA3FE1997FEA6EFF00CA6FFF006DAF7FA2803C03FE1997FE
        A6EFFCA6FF00F6DA3FE1997FEA6EFF00CA6FFF006DAF7FA2800A28A2800A28A2
        800A28A2800A28A2800A28A2803C03FE1997FEA6EFFCA6FF00F6DA3FE1997FEA
        6EFF00CA6FFF006DAF7FA2803CFF00E197C32FF8573FDA9FF137FED0FB7F95FF
        002EDE56CD9BFF00DB6CE77FB74AF40A28A002BC03FE1997FEA6EFFCA6FF00F6
        DAF7FA2803C03FE1997FEA6EFF00CA6FFF006DAEFF00E197C32FF8573FDA9FF1
        37FED0FB7F95FF002EDE56CD9BFF00DB6CE77FB74AF40A2800A28A2803C03FE1
        997FEA6EFF00CA6FFF006DA3FE1997FEA6EFFCA6FF00F6DAF7FA2803CFFE197C
        32FF008573FDA9FF00137FED0FB7F95FF2EDE56CD9BFFDB6CE77FB74AF40A28A
        0028A28A002BCFFE26FC32FF00858DFD97FF00137FECFF00B079BFF2EDE6EFDF
        B3FDB5C6367BF5AF40A2803C03FE1997FEA6EFFCA6FF00F6DA3FE1997FEA6EFF
        00CA6FFF006DAF7FA2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
        A2800A28A2800A28A2803FFFD9}
      Stretch = True
    end
    object QRLabel30: TQRLabel
      Left = 152
      Top = 12
      Width = 104
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        402.166666666666700000
        31.750000000000000000
        275.166666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'C'#243'digo de Seguridad:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Draft 12cpi'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel31: TQRLabel
      Left = 152
      Top = 51
      Width = 94
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        402.166666666666700000
        134.937500000000000000
        248.708333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha Firma Digital:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Draft 12cpi'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrCodigoSegecf: TQRLabel
      Left = 152
      Top = 31
      Width = 101
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        402.166666666666700000
        82.020833333333330000
        267.229166666666700000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrCodigoSegecf'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrFechaFDigital: TQRLabel
      Left = 152
      Top = 69
      Width = 100
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        402.166666666666700000
        182.562500000000000000
        264.583333333333300000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrFechaFDigital'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object ChildBand5: TQRChildBand
    Left = 19
    Top = 286
    Width = 249
    Height = 19
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      50.270833333333330000
      658.812500000000000000)
    ParentBand = ChildBand7
    object QRDBText24: TQRDBText
      Left = 38
      Top = 3
      Width = 192
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        100.541666666666700000
        7.937500000000000000
        508.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmFactura.qryVentaFacturaDet
      DataField = 'SERIE_PROD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Draft 10cpi'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel32: TQRLabel
      Left = 5
      Top = 3
      Width = 30
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        13.229166666666670000
        7.937500000000000000
        79.375000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'S/N :'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object ChildBand6: TQRChildBand
    Left = 19
    Top = 305
    Width = 249
    Height = 0
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand6BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      0.000000000000000000
      658.812500000000000000)
    ParentBand = ChildBand5
    object QRExprMemo1: TQRExprMemo
      Left = 6
      Top = 2
      Width = 234
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        15.875000000000000000
        5.291666666666667000
        619.125000000000000000)
      RemoveBlankLines = False
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Default'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object ChildBand14: TQRChildBand
    Left = 19
    Top = 767
    Width = 249
    Height = 147
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = ChildBand14BeforePrint
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      388.937500000000000000
      658.812500000000000000)
    ParentBand = ChildBand4
    object QRLabel28: TQRLabel
      Left = 4
      Top = 4
      Width = 184
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        10.583333333333330000
        10.583333333333330000
        486.833333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = 'Escanea el Codigo QR para Encuesta.'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object qrEncuesta: TQRImage
      Left = 48
      Top = 18
      Width = 144
      Height = 127
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        336.020833333333300000
        127.000000000000000000
        47.625000000000000000
        381.000000000000000000)
      Picture.Data = {
        0A544A504547496D616765F0240000FFD8FFE000104A46494600010100000100
        010000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
        0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
        3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
        3232323232323232323232323232323232323232323232323232323232323232
        32323232323232323232323232FFC0001108009E009403012200021101031101
        FFC4001F0000010501010101010100000000000000000102030405060708090A
        0BFFC400B5100002010303020403050504040000017D01020300041105122131
        410613516107227114328191A1082342B1C11552D1F02433627282090A161718
        191A25262728292A3435363738393A434445464748494A535455565758595A63
        6465666768696A737475767778797A838485868788898A92939495969798999A
        A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
        D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
        01010101010101010000000000000102030405060708090A0BFFC400B5110002
        0102040403040705040400010277000102031104052131061241510761711322
        328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
        292A35363738393A434445464748494A535455565758595A636465666768696A
        737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
        A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
        E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FE
        94DDE9FDF5FCEB13C68CC9E06D79958AB0B098820E08F90D7CD1F0FF00E1DEBB
        F1034BBABEB5F107D916DE6F24ACACEC49DA0E783EF401F596F4FEFAFE746F4F
        EFAFE75F3DFF00C33EF89FFE86D8BFF22FF8D4573F013C4D6D6B34EDE2C89844
        8CE40F339C0CFAD007D141837420FD296BC23F675BE98E91E269AE25966F29A1
        601DC9E8AE78CD583FB4A68E0FFC8BF7DFF7F52803DB77A7F7D7F3A37A7F7D7F
        3AF833FB4EFF00FE7F6E7FEFEB7F8D7B5DAFC04F135C5B4338F16440488AE01F
        338C8CFAD007D12580EA40FAD26F4FEFAFE75C07C43F006A7E31D0F48B0B0D59
        2CA5B2399246DDFBCF940EDF4AF00F0678335AF19F88B52D1EDF5C6B692C5599
        A491DC86C3EDE306803EBF2C00C9200A5EB5F2C7C47F88CBA8F87ECFC276F0DD
        4177A34C209AEBCDF96631298C918E79233CD7AA7C24F8976BE2AB7B6F0EC763
        7115C69DA6C7E64F2386121408848EFC939A00F520C09C0233E99A5AF00F86B7
        57127ED03E2589E795A355BAC2339207EF53B57A2689F13ECB5BF8837FE118F4
        EB88AE2CDE6569D9C156F2CE0E075E6803B92EA0E0B0FCE8DE9FDF5FCEBE5CD6
        740D53C65F1C35DD0ECF557B36334922B3BB6D014038C035BFFF000CFBE27FFA
        1B62FF00C8BFE3401F426F4FEFAFE74A1D49C0604FD6BE7AFF00867DF13FFD0D
        B17FE45FF1AC4F04E97A8F863E3D59E8179A93DDB5B3B0770EDB5B30EEE84FBD
        007D43451450060F8DFF00E444D7FF00EC1F3FFE806BC7BE0A48F0FC24F184B1
        BB2488666565382A441C106BD87C6FFF002226BFFF0060F9FF00F4035E47F02E
        CE5D43E17F8AACA000CD7124B14609C0DCD08039FA9A00F12FF84B7C47FF0041
        ED4BFF00029FFC6BDCFE06EA9A86A9E10F14B5FDEDC5D3260299E42E54796DD3
        35C1FF00C282F1D7FCFBD8FF00E050AF55F85BE06D6BC11E15F11C1ACC70A3DC
        AEF8FCA943F01181CFE7401CF7ECDEE9168DE279245DC8AD0B30C67202BE6BB4
        F03EB5E05F1F9BEFECAF0CC70FD8F6799F6AB28573BB38C6D2DFDD35C5FECDED
        1A68DE276946630D09718EA36BE6B6747F8B1F0B3C3C66FEC8B596CBCEC799E4
        D915DD8CE33F99A0097E17FC20B8F0A49A9378962D2350170104223065D98CE7
        EFA0C751D2BCFF00E2B7C5683C45269D69E1A9755D39AC5E64B8DC4441F3B42E
        3639C81B5BAE3AD50F17DC7C51F042DAB6B5E21BA41745847E55DEFCEDC673F9
        8AEF7E15FC2592C86A777E31D2EC6F16E96192D4BB0948FBE58FB672B401896F
        F093E285CDB453A78BED82CA81C03A8DC670467FB95E382F753D1353BB5B7BF9
        E0B95768E59209594B90DCF3C1232335F627853C79E1FF00155EDDE9BA33CC64
        B050245788A0519DA31EBD2B99F0FAFC30F18EBB7FA7E9FA05B4B7B6DBA4B832
        DA6D04EEDA4E7BF268039EF84FF0AAFB4FBD6D7FC43FD97A8DA6A366B2468C5A
        570CE55F2C1D00CE339209A86DF4DFF852DE2ED5FC5DADAC53693AACD2DB5A5B
        E9A37491EF93CC5DCAE11400A84704F38FAD6F7C71D5B50F0BF82F4AFEC2BB97
        4FDB74B08FB3B6DC2046C2FD381F955AF06F8A7C29F12F47B0D06FE16D4EFECA
        CA29EE45DC195F3155519813D4E58FE74019FF000E7C0FA9C1E3CBCF1DB4F687
        4BD5E0925B7883B79CA256575DC36ED07039C31FC6B96F007FC9CA788BFEBB5E
        FF00E8757756F047C598F57BB4D0F5436DA489985A4297A11638B3F2A81DB031
        C573FF00076DF50B5F8DD7F6FAAC864D4638EE52E5CB6EDD2061B8E7BF39A00D
        AF0AFF00C9D0EB5F5B8FFD04570FF13FC49AE59FC4BD76DEDB58BF8614B8C247
        1DC32AA8DA3A006BB8F0AFFC9D0EB5F5B8FF00D04553F1E7C1BF177883C73AB6
        AD6105A35ADD4DBE32F70149180391F8500607C1CF116B57DF15746B6BBD5AFA
        781FCFDD1CB3B32B620908C827D40AE947FC9D849FF5D47FE930A7FC33F843E2
        BF0BFC41D3359D4E1B55B3B7F37CC31CE18FCD13A8E3EAC2983FE4EC24FF00AE
        A3FF004985007D0F451450064F8A2C67D4FC29AB58DAA07B8B8B39628D49032C
        CA40193D39AF9EB41F00FC63F0C5B4B6DA2A9B38657F31D23BA80866C633C93D
        857D0BE28BD9F4DF0A6AD7D6AE12E2DECE596362338655241C7D6BE7AD03C73F
        187C516B2DCE8A4DE4313F96EE904236B6338E71D8D006B7F637C7CFF9FD97FF
        0002ADE9B2685F1E6689E292F2464752AC0DD5BF20F5EF44BABFC778627964B3
        915114B31F2A0E00EBDEBADF83BE34F10F8C340D7A7D4EE56E2EAD9956DF6C6A
        B82558F6EBC81400CF83BE05F10784746F10DBEB366904B7813C80B323EEC2B8
        3F749C751D6B83F0DF84B41F009B9FF85A7A6C49F6CDBF60E4CD9DB9DFFEA89C
        7DE5EB50EBBF107E2E786A7B5835893EC92DD67C9578223BF0403D33EA2ABF8A
        3C35F173C65F65FEDBD1A6B8FB36EF2B688531BB19E87D85007A4F83FC0DE22D
        75EEC7C51B44D45220BF61134C8DB09CEFC7967BE17AD733F0F3E2FC5A55FEB9
        6DE30D6E73023A47608602E102970C06C5F4D9D6BE84AF23F137807E13F86E58
        A6D7D3EC6D78CED1979E53BC8C16E99FEF0FCE803CDFE11F8E740F0A789F5FBD
        D62EDE082F06216585DF77CE4F45071C1EF5B3F00678EEBE237892E22398E5B7
        77438C64198115CAFC4DB5F8776F61607C1370B2DC195BED015E4385C71F7BDE
        BBCF80DE0DF10787B5EBEBFD574C96D6D6E6C4086466521C96523A13DB9A00E8
        749F07789F5FF15EAB178F6DD6FF00C3A24924D3E29664214EFF0090808770F9
        09EB5E73E01F11F87FC01F167C54DA8CA6CEC15EE2D6DC246D263138DAB8009E
        8BFA57A778DBC6FA96A717F66FC3ABC4BDD6ED6E08BC812304C71AE54E77803E
        F60715E5BA0F8323B1F10DFEAFF162C5EC6C6F77B47348F80F72CE18802324F4
        DE7D2803BBD33C57E22F0FF886EBC4FE2AD4A55F04DE871A7B615F25C868BE45
        1BC7C81BA8E3BD729F0BB51B6D5BF681D6351B37325ADD1BB9A272A5772B3641
        C1E4706BBBD57C51F09359F0DDAF87EFB59824D36D4A18A21E682BB4155E40CF
        426AAEA5E07B5D03C3B0788FE1758BBEAB384F26512170D038C93890E3A63DE8
        0399F11FC3DF88D17C4BD5FC47E19B710F9F3318675B9881284007863C7E54EF
        EC6F8F9FF3FB2FFE055BD7517BE39D76E7C1D6FA369176B2F8FE2DBF6BB211AE
        E5C1F9FA8D9C0C7435B7A95CF8F57E14DA4D65031F159D9E747B63C8F98EEE0F
        CBD31401E79FD8DF1F3FE7F65FFC0AB7A93C13F0F3C7D6FF00146CBC4DE25B65
        7C331B8B83711331FDD951C29FA0E056CEB9F14AE744F86B35ADE6AD141E3A85
        504B6CD165958CAB9E00D9FEAC93D6BA0F86BF1334CF11687A5596A5AC432F88
        E70FE6C0232A490CC4741B7EE81401E91451450060F8DFFE444D7FFEC1F3FF00
        E806BE5CF871F11F56F07DD41A65ABDA47A7DDDEC6F74F3A64AA92AAC739181B
        457D47E37FF91135FF00FB07CFFF00A01AF8B2CF45D5750B49AEECB4CBDB9B68
        73E6CD0C0CE91E064EE603038E79A00FA3FE20F8FBC433B22780A3B7D6B4C6B7
        75BD9EDA137022639E0B29C2FCBCF35CAFC08F12E95A0E81AFC77BA9DA5ADDCB
        221B78A794299182B63009E79C0AE23C01F11352F0A5ACFA25A5ADB4B06A53AA
        CAF286DCBB86CE307D2AFF00C4FF0001597C3BD73454D2A7B9BA6B8065C4F827
        72B0C01803AE6802AF8EFC41E30D6757D1A5F18E9A74F681CF91BAD9A1DCA597
        71F9BAE302BEAAD1FC45A2EBC24FEC8D52D2FBC9C799F67995F667A671D3A1AF
        10B98C7C4E81E7F8859F0CDD58295D3E193FD18DCEE196C09796C1551F2FF7AB
        93F01EA5E3DF87E6FBFB3BC1DA85C7DB366FF3F4F9F8DB9C63007F7A803ABFF8
        4FFE34FF00D0AB27FE0AE4FF001AF42F881A1F843C4161A3BF8D7525D3E48D1D
        A00D72B06E6609BC7CDD7185FA669DF0D7C5DE29F1449A80F12680FA50802184
        B5BC917999CE7EFF005C6074F5AF09F1BF8A3C4DF142F63B68F429275D265957
        3A7DBC92101C81F36338FF0057C7E34015FE1EE81E0BD5F5CD5A0F146A8B6767
        08FF004590DD2C5BFE623A9EBC62BDC7E1A6BDE31D475ABDB0D734B6B6D1ADA0
        C58CE6D9A31200C02FCC786CAF3C578EFC4FF869A7781B41D1EFAD2E6EE49EF5
        8ACA93E3E42141E3007735EA5F0EBE22EB3707ECDE2ED3E0D0B4D86D105ADD5D
        AB5BACCC30000D21009DB9381400CF15785AFF00E1FDC4DE23F01E9F777DAC6A
        570CB771BC667554625C90AA011F3015E31E38F88FE27F16DB0D1F5F8ADA2FB1
        DC9768E380C6E92282A41C93D3278AFAABFE135F0A7FD0CFA2FF00E07C5FFC55
        7817C66F87FA4685A7AF8AB4EBF9AE64D5F50690E595A3DB207932A40E474C1C
        F4A00BDA07823E11DDF87F4FB8D4BC491C37D2DBA3CF19D4635DAE47230471CF
        6AF4FF0011DE6A7E1BF86BA79F01DB9D4CC2B0C56DB63371BE0DB80DF2F5E00E
        6BC37C5DF0D74CF0FF00C2ED23C516F777525DDE9843C7215D8BBD198E3033D4
        568785BE34F8BADF4CB0D0747D02DEFDACED962458A192491950019214D007A4
        F8034BF0EDC78922F105EDE88FC6D7313B5F69FE70531391F30F2BEF2E063AD7
        31E28F8ABE3BB6F887AA7873C3F656F782DE52B144968D248542824F079EB4D0
        0692E7C79A59FB678DEEFF00E3E7411F3B43BF87FDD2FEF0600079E99AE3AC75
        2F1F587C42B9F1947E0ED41AF67DDBA26D3E7F2C6E5DA71C67B5006DF897C35A
        5F897C3373AADC3CAFF11AE76349A444E049B8380C0418DDC460B7E19AEDBE14
        7C2AD3B4AD3747F125FDB5FDAEBD1890C90CCDB429DCCA3284647CB8353F85FC
        2964753B4F8A1E23B89749D51C33DC5BDC910C31165310077E08E08C64F522BD
        0ACFC53E1ED42E92D6CB5ED2EE6E1FEE450DE46EEDDF800E4D006B514514014B
        58D39358D16FB4D92468D2EE07859D464A8604647E75E0DAF7DB3E0E69B75E15
        D1ECE5D62DB59B77965B89508688B031E005E3A0CF35EEFADEA5FD8FA15FEA7E
        579BF64B779FCBCE376D52719EDD2B9AF86FE3F1F10748BBBF1A71B2FB3CFE4E
        CF37CCDDF2839CE07AD007C97A5697A80D62C49B0BA005C4792616FEF0F6AFA9
        3E24F8174DF145E586A97BAB359CDA746EF14436FEF4821B1CF3D401C7AD7A25
        79CFC4BF8747C617BA7EAE35216BFD951BBF95E4EFF3304375C8C7DDC5007877
        8CFC63ADFC41D63469AEF417B3FB13951E523B6EDCCA4E723FD9AF75F89BF103
        54F032E99FD9BA3AEA1F6AF337E777C9B76E3EE8EF93F954FF000D3E238F8876
        FA8CA34C363F6378D71E7799BF706F618FBB51FC4BF8983E1E7F67674B37DF6C
        F33FE5B797B36EDF639FBD401E75FF000BFF00C51FF427C7FF00917FC2BBFF00
        879E14D1BC14751BE875C49E4D54472491CAE8BE591B8E060FFB67F2A93E1A7C
        4E1F10E4D4506946C7EC610E7CEF3376ECFF00B231D2BC1FE2AFC383E04BAB2B
        83A98BCFED39666DBE4ECF2F6953EA73F7FF004A00EE7FB520F8E37F73A3EB32
        C3A343A43B490CD0B8633124AE0EEE3A0CF149A7DD7FC2E9B893C217E069D6DA
        18F322B9B73BDA5DA7CA1907819073C54369FB3735D59C171FF09305F36357DB
        F63CE3233FDFA83F67BB6FB1F8FBC416BBB7F936AD1EEC633895467F4A00F26D
        63C3D7BA76B77F6315A5D4B1DB5CC90A49E4B7CE158807A77C57AD6877337C54
        D1AC7C1DAF42744B2D1EDA3922BB00832B46A220A77E072189E3D2B6F57FDA25
        74BD6AFB4FFF00846CC9F65B8920DFF6BC6EDAC5738D9C74AEC3C5DE143F163C
        0BA230BBFECDF34457FCC7E6E37447E5EA3FBFD7DA8025D73C0BA4F8ABC0FA77
        84975AC4763E5B2CB094676D8A57919FF6AB86BAF0227C1787FE12DD1E6B8D62
        E94FD9BECB2C785DAFD5BE5E78C5551E123F018FFC25CD79FDB225FF0041FB30
        8FC8C6FF009B76ECB74F2F18C77A77FC34BAFF00D0AE7FF033FF00B0A00423FE
        11F887C56B53F69D72FF00997473D22F3383D3E6E31DC56EFC3EF8C7AA78C3C6
        51E857BA2DBD98689DD995DB729519C60D616DFF008465BFE1731FF481A973FD
        97F77CBF37E5FF0059CE718FEED62FC30D7BFE127F8F936B42DFECFF006C8E69
        3CADDBB6FC80633819E9401EADF1A268AE3E16EB7670C8925D1306214605CE27
        8C9F9473D39AE3BE0F7C2BB782DB44F19CB7D749798918DA3C4028E5D3AF5E9C
        D6878BFC2A7C11E2CBFF008AC6EFED62D9C37F676CD9BBCC5107FACC9E9BF774
        ED8AF47F06F88FFE12DF09586BA2DBECDF6B563E4EFDDB76BB2F5C0CFDDA00DD
        A28A280296B1A8C7A468B7DA8CB19963B581E6645EAC141247E95F30F893C7D6
        BE3AF893E17BCB0B39ECA382E208591D87CC7CE073C7D6BE8DF1BFFC889AFF00
        FD83E7FF00D00D7C53A5DACF7BABD95A5AC822B89E748E2909236B33000E4723
        04F6A00FACFE217C47B3F095F5AE893D84F3CBA9C2424B1B001371D9CE7EB9AE
        134ED47FE140C7269FAC87D5DF552268DAD4ED1184F9483BBD734FD2EEA0F857
        731693E3C88EBDA86A12ACB697110170214CEDC1697695F9B9E2BB8F88DE39F0
        B7846F2C21F10E8926A325C46CD1325BC52EC008047CE463AF6A00E0350B76F8
        FAD1DCE86C3465D2018E55B9F9BCD327208D9E9B0F5F5AA0DFB37EB8F8DFE22B
        26C7AC6E6BD5FE1C78C7C39E2F835093C3DA43E9C96CC8260F04716F2C1B1F70
        9CE307AFAD4FE3BF891A4FC3FF00B0FF0069DADECFF6CDFB3ECCAA71B719CEE6
        1FDE1401E61A5C67F67C32CBAB9FED51ABE163169F2797E5F5CEEF5DE3F2AED7
        E277C3DBBF89765A24B657D0598B6592422652D9F302118C7A6DAF18F877F11F
        4BD0A4BF3E2FB6BDD696509F67122ADC79446777FAC6E3391D3D2A2F1E68DE2F
        F057D82F2EFC4533DBEA66492DE3B6BC9731A8DA7041C01C38E99E9401ED3F0B
        7E18EA3E01D4350B8BDD520BC5BA8963558D586D20E7BD72FAE6A11FC6DB99BC
        35A3C6749B8D2A66B89679F95900263C0DBCF539E69975AE5E7C66D3AD34AF08
        5E5DE9577A52092EA5BB94C425040518319627904F38AF3DF17FC3DF147C34B3
        8754B8D66106EE5F24B58DC4A1C9C16F98955C8E3D6803B7D3FC3EFF0001E77F
        106B32C7ABC37ABF6458AD976B2B1F9B712DDBE5FD6A3F81DAA0D63E2BF89B50
        457486EA09E748D8E76069D580FC01C568597C76F07B787F4ED3F57D1352BE96
        DADE3491A68219159D5402C373F739E7AD79BF86342D57C7BE3BD70F852F9749
        1234D76BBE468710B4A309FBB07A6E5E3A714016DBC1F79E3DF8B7E22D1EDAFA
        3B6649EE27DD302CB85900C607FBD5F4EF86B441A278634BD2A6F2A596CED638
        1E455E18AA8048CFD2BE62F177C35F15FC3DD3BFE121BAD6EDCB4D3881A4B3B8
        97CD62C0B724A8C8F979E7D2B4FC43F17ADF53F863A6F87AC5B568358B748166
        BB2E143945C37CC1F71C9F51401575CF09DD78D7E37EBBA15ADDC76C5A79240D
        202540500E302ADF8DFC596DA2F825BE1B1B491B51D32448DEF90808FB4EE381
        D7A1C57A0D9784AF7C57F063476D1E6B7B4D7678A391F5190B24AC013BB32282
        C734FF00056A9E1F5D6E1F016AFA425F788ACA365BABF96DE392395946E277B7
        CE7820722803175062DFB2702C493E543C9FFAFA5AA1F067E1A6A227D0FC69FD
        A70FD8CF98DF65C36EFE34FA7519ADBF127866FBC1DE2CBCF1AEA7710DC783AD
        9F2DA3C2CCD90EA2350226023E24656EBDB3D6BD3FC21AC69DAFF856C754D26D
        1AD2C67563140D1AA14C3B03C29207209E3D6803728A28A00C1F1BFF00C889AF
        FF00D83E7FFD00D78E7C08D3F443E0CD6B59D534DB6B87B0BA332CAF0ABBA2A4
        61BE527E99FAD7B1F8DFFE444D7FFEC1F3FF00E806BC8BE06DACD7DF0B3C5969
        6E9BE79DE58A35C81B99A0000C9E0726802B78C34FBAF8DBA85A6B1E0D651069
        A9E44AD76DE4B0909DC36E33DBBD64DF7C20F889797105EEBB7D05F436877B79
        F7AD29080E580C8F41D2B95962F881F0CAE61D245C4FA549A81122450CF1B090
        E76824A9207A735EBDE17F16EA3E07B3BCB3F8AFA94D14F7A41B3593FD237460
        10FCC4180E48EB8A00F3BF1DF8F34ABDBDD363F87AF73A3236E5BA5B64FB2895
        895D84EC3CE3E6EBD335D5587FC5BF0E7E2C7FC4E7ED98FECFDFFE99E56DFBFF
        007FEEE77274EB8F6AE13E28EA1E07B8BCD2A4F02A451AC6B21B83141247F365
        76FDF033DFA554B4B1F1F7C57DDE5C936AFF00D9F8CF9D3C69E5EFF4DC4673B7
        F4A00A3E32F879AE78152D1B58FB362E8B08FC9977FDDC673C0F515EF1F0DFC0
        3ACA5ADE49E3A16DABC2F14474F5B993ED3E48C36EC061F2E46CE9D71ED51F82
        3C11E24D65EF07C50B11A824617EC22EA68E5D84E77E36371D17AD6C7C52D3BC
        753DBE911F815A58962128BA114F1C7C61367DF233D1BA500782F83FC39E2AD7
        3C47ACC1E11BE363240E4CBB6E5A1CA6F200F97AD7A3F8B2EC7C5FD22CFC31E1
        D667D5748712DE35E7EED4ED5F2D886E72771AF33F035978F6EB58D4D3C2324C
        B7C83FD30C73C7193F31EA588079CF4AF6BF15F81B5CD2F42B0B9F0069EB67AF
        4ACA3519A099236752B96C97383F3E0F1401CAFC64F0B69DE1DF86BE1E58B4DB
        2B7D41648A1B89A089433B088EECB0193C8CD72FE20F1D6811781B44B4F0924F
        A66BD024297D756F0881A5022C382EA72C0BE0F3D719AF52BDF881F0E751D1AC
        F47F195E25D5FD92AA5D4535A4CFB6E1576BF2AB82776EE41C57927836FBC010
        7C41D7A7F10C70B680E66FB02BC123A8CCA0A6154647C99EB401EBDE27F0CEB3
        E3EF831E1FB3B192396F985BDC48F73291B808D8124F3939615D3786FE1DE836
        3E18D2ED353D034A96FE1B58E3B890DBA3EE90280C7711CF39E6A978C61D7350
        F877A68F870CF1B33C4D0792EB17FA3EC6FF009E98C0FBBC75AF9E751F889F10
        F49D4AE74EBDF115F47756D2B452A798ADB594E08C8E0F3E9401EF5E1EF0878A
        B48F89D757ED76A9E15C48B6D651DC1D918206D023E83073507C67B4B6D17C17
        79AF69704765ABB5C440DF5BA88E6209C1F9C73C8E3AD797FC3AF8B9A9DAF8B6
        397C5BE23BA6D2BC970C244320DF8F9785526AA78A35EF127C4DF1A6A3A17873
        509F51D2E793CDB6B56611215500E7E7DB8C1CF5A00EF75BBCB9D43F6576BABC
        B896E2E248A12F2CAC5998FDA93A93597F067C31E34F3B43D6FF00B4DBFE11A3
        E6116BF6B6C63E75FF0057D3EF73FAD4BE05F01FC418B53D3F45F155A3BF8414
        38B8B392EA178F015993E5562C7F79B4F1DEBD4B4CF14783F46D762F0369D3AD
        B5F404AA5924126D5C8F3386C6DE873D7BD0075D451450051D656C5F44BE5D50
        8160607172492008F07774E7A66BCFFC35E2DF853E11B39AD744D66D2DA19A4F
        31D774AD96C019E41EC2BB0F1BFF00C889AFFF00D83E7FFD00D780FC22F879E1
        9F16F85F54D535FF003D7EC77057CC49B62AA040C49FD6803D1F5FF10FC23F13
        EA16B7DABEAD6971736A310BEF95768CE7A0033CD37C4DAFFC21F17CD6F36B7A
        B5A5CBDBA958CEF953682727EEE3D2B9DFF8427E08FF00D0C50FFE0C855EB6F8
        4FF0C758D2AFAEB44BC96F7ECD1B16682F77856DA48CE3E9401734DF00FC27F1
        1E9D7F3E836D15E7D950EF68EE26F909048EA7D8D70BF01FC5BA0F85CEBBFDB5
        A94565E7F93E57980FCD8DF9E80FA8ADDFD9BD637D1BC4EB29C465A10E738C0D
        B266B94F1C780343B9367FF0ADD27D671BFEDBF6597ED1E574D99C74CFCDF950
        0759F0B7E31BDC49A97FC26DE20851408FECDE64417279DDF757E9D6BB7F8677
        9E36BDBAD69FC5A920B52633A7B3A2286525F38DBEDB3AD715FF00084FC11FFA
        18A1FF00C190ADFF001978EB5836DA6C3F0CE4835910AB2DE8B68FED06250144
        7BB1D3387FAE0D0045E31F086ADE0F48AF7E1969B2C57F792B0BE68C89372751
        C48481C93D2A8FC18F1D78A3C4FE29D574EF105F79EB6B6C58466245DAE1C29F
        BA07BD79FBFC7BF1DC52346F2D8ABA92ACA6D46411F8D43E15B6F89BE19D52EB
        5AD1FC397866BF43BDDEC8BAB2B36EC81F5A00D3F8C76DE018A2793C392C4DAD
        B6A0FF006D55924247DEDD90DC0F9BD2A6F84BF0A65D5B5292E7C55A14C7499A
        C44D6B2349B43B3152A46D39E549EB5D868DF0DFE1E78B666927BB79B5E913ED
        1A8DB4377868A66E64057F870E48C76AEB3C773F897C29E0FD2AD7C0F6325D4D
        6EF1DB797E4F9C56158C804FE2179A00B29F103C07E1D45D17FB72DADBEC23EC
        FE4B6F263DBC6DCE3B62BC43C29A4E85E3AF8E5ADC77918BED32E25BAB888ABB
        2871BF2AC08C1E86AC78BFC21A3EB5A14777A2096FBC6D3CCB2EA561049BDE22
        4132E631F770E547B66B1FE0EDEDAF857E264875E9E3D344104D0CBF6A6D9B1F
        206D39EFC1A00F5AB6F00FC22BBF104BA0C16D149AAC5BBCCB617136E5C75EF8
        AF22BAD3F59F0EFC63D534FF0001DBBA5DDB3BA5BC498721360DDF7FAF5AF66B
        2B9F85BA7F8CEE3C5707896C86A971BB7B35E829F30C1F97F0AF20BFD7B571F1
        B756D5BC14ABA8DD48EE6030C7E7074280310075A00EEFC33E24F899A47882D6
        FBC76D2D9F86A2DFF6C9E68620AB9421325467972838F5A6695A26A5AD7C7A4F
        1969B68F71E1D9E4DD15FA6363010EC3D79FBC08E9DA8D22E3E2278EB5487C39
        E36D12E20F0EDE6EFB5C8B68612362974F9FB7CEA9FCAACF87BC4DA8F86BE2E4
        1F0E34E68C787ED5CA469226E970D179A72FFEF31A00F6FA28A280307C6FFF00
        2226BFFF0060F9FF00F4035E39F067FE49078CFE93FF00E93D7B1F8DFF00E444
        D7FF00EC1F3FFE806BC97E02456B79F0F7C45A75CDCA40B7570F092580203441
        4919FAD007CF15F407ECFF00FF00226F8B3EA3FF0045B55BFF00867BF0B7FD0D
        175F9C55D87853C17A37C3FF000EEB56D63AC1BA1771976333A0208423031F5A
        00E0BF678FF9177C5BF48BFF0040929DFB34FDEF127FDB0FFD9E9BFB3C7FC8BB
        E2DFA45FFA0494DFD9BAE2181BC47E6CD1C79F231BD80CFDFA00DBBFF81DF0F7
        4A08751D6AE2CC499D9F68BC8E3DD8EB8DC066AA6B3A36A1F0792DE4F01585DE
        A8356C8BB32C2D7010478D846C0319F31BAF5C556D3639FE3E1922D7E07D1C69
        38688DAA9FDE799D73BFD368E9EB5DA7C4BF1D6A7F0EECB458B4BD363BF170B2
        2399037CA230807DDF5DC7F2A00F2CF899F0A5346D2F4DD4742B3D52F2F2F646
        6BA8D6332F97950DD15723927AD76FF06BE22EB7E2BD5AEB45D4E0B68A2B0B30
        50471957CAB2AE0E4FA5731FF0D09E29FF00A15ED7F296AE5D40BF09208FC57A
        131D5AFB59F92E2D66E5610C3CC246CE78231CD006878E6C22F83F24BE2DF0F1
        69750D56E9E29D6ECEF401C990ED0318E47AD6E78EBE236B1E1BF869E1CF10D9
        456AD79A8880CCB2212837C25CE067D4571FA5EB93FC7ABA93C3BAD409A5C562
        BF6B592D325CB03B3690D9E3E6357BE3B5B5B699F0C7C3DA45BDCACC2C6E62B7
        04B0DC4242EB92077E28036BC0767E0BB0BF4F1949E21B38F59D4ED8BDD4325F
        44111A421980527230477AE6FE2BFC2ED35B48BBF156822FB51D42FEEC4DB2DC
        F9C8CB212C59428CE3DEA3F0D7C07F0FEBBE1FD3AFDB5FBB59EE6D92678A3F2C
        ED240247AF7AEFFC59E231F0BBE1CD9269860BF92C3C9B3549DF04A818C90BDF
        8A00F16D4FE1DE8F17C38B4BEB096E6E3C56FB3CFD2D1C3CB1E49DD9880DE303
        1D7A5737E1FB8F14FC3DD593C409A25D40D1AB47BEF2D2458FE618E49039FC6B
        D4A75FF846F478FE31C1FBED5352C17B07FF00529E6FCA7047CDC63D6B8FF1AF
        C5FD6BC67E17934BBCD16DEDAD649124F3E3DFD54E47278A00F691E34F105CFC
        168FC556364973AD4888CB6F142CE1B33043851C9F9727F0AABE08F05C5AD5FD
        87C43D662BBB5F115C6E79AD88F2E3523318F908C8F9403D7BD719F073E256A6
        6EB43F08CDA6C11E9A125537ADB81E15DC727E5EA00AFA052449503C6EAEA7A3
        29C83400EA28A280286B7A68D6342BFD30C9E50BBB77877E33B772919C7E35E2
        5FF0CD31FF00D0CAFF00F80A3FF8AAF7CA2803C0FF00E19A63FF00A195FF00F0
        147FF1547FC334C7FF00432BFF00E028FF00E2ABDF28A00E03E1EFC335F01E9D
        AB5A2EA66EFF00B436FCC62D9B30187A9CFDEAE08FECD31939FF008495FF00F0
        147FF155EF945001451450015E7BE05F860BE0BF136A9ACAEA86E8DF2B2F9462
        DBB32FBBAE4E7D2BD0A8A00E03C1FF000CD7C29E33D5FC423533707513213098
        B6ECDF26FEB9E7D2B90D6BF67A8F58D7B51D4CF885A23797525C797F66CEDDEC
        5B19DDCE335EDD45007977C3CF83C9E03F11C9ABAEB0D785EDDA0F2CC1B3192A
        739C9FEED62F883F67E8F5DF11EA5AB1F103426F6E649FCBFB3676EE62719DDC
        F5AF6BA280381D57E1AAEA7F0C6CBC1875231ADB797FE93E564B6D24FDDCFBFA
        D1A8FC345D43E175A782FF00B4CA2DBECFF4AF2B24ED62DF773EFEB5DF51401C
        2CFF000E567F8503C0FF00DA2428445FB5795CFCB2893EEE7DB1D6B77C1DE1C1
        E12F09D86862E4DC8B4561E695DBBB73B374FF008156ED140051451401FFD9}
      Stretch = True
    end
  end
end
