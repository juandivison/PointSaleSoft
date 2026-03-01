object qckrReciboPagoLavanderia: TqckrReciboPagoLavanderia
  Left = 0
  Top = 0
  Width = 331
  Height = 482
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = dmLavanderia.tblLAV_PAGO
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE')
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Options = [FirstPageHeader, LastPageFooter]
  Page.Columns = 1
  Page.Orientation = poPortrait
  Page.PaperSize = Custom
  Page.Values = (
    127.000000000000000000
    1275.291666666667000000
    127.000000000000000000
    875.770833333333300000
    127.000000000000000000
    127.000000000000000000
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
    Left = 48
    Top = 48
    Width = 235
    Height = 70
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
      185.208333333333300000
      621.770833333333300000)
    BandType = rbPageHeader
    object QRLabelTitulo: TQRLabel
      Left = 8
      Top = 8
      Width = 208
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        21.166666666666670000
        550.333333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'RECIBO DE PAGO - LAVANDERIA'
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
    object QRLabelFecha: TQRLabel
      Left = 8
      Top = 30
      Width = 38
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        79.375000000000000000
        100.541666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Fecha:'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRShape1: TQRShape
      Left = 0
      Top = 65
      Width = 233
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        21.166666666666670000
        0.000000000000000000
        171.979166666666700000
        616.479166666666700000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
  end
  object DetailBand1: TQRBand
    Left = 48
    Top = 118
    Width = 235
    Height = 180
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
      476.250000000000000000
      621.770833333333300000)
    BandType = rbDetail
    object QRLabelCliente: TQRLabel
      Left = 8
      Top = 4
      Width = 43
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        10.583333333333330000
        113.770833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Cliente:'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBTextCliente: TQRDBText
      Left = 100
      Top = 4
      Width = 111
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        264.583333333333300000
        10.583333333333330000
        293.687500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = dmLavanderia.tblLAV_PAGO
      DataField = 'NOMBRE_CLIENTE'
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabelOrden: TQRLabel
      Left = 8
      Top = 28
      Width = 48
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        74.083333333333330000
        127.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Orden #:'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBTextOrden: TQRDBText
      Left = 100
      Top = 28
      Width = 64
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        264.583333333333300000
        74.083333333333330000
        169.333333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = dmLavanderia.tblLAV_PAGO
      DataField = 'ID_ORDEN'
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabelMetodoPago: TQRLabel
      Left = 8
      Top = 52
      Width = 93
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        137.583333333333300000
        246.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Metodo de Pago:'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBTextMetodoPago: TQRDBText
      Left = 120
      Top = 52
      Width = 92
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        317.500000000000000000
        137.583333333333300000
        243.416666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = dmLavanderia.tblLAV_PAGO
      DataField = 'METODO_PAGO'
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabelMonto: TQRLabel
      Left = 8
      Top = 76
      Width = 83
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        201.083333333333300000
        219.604166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Monto Pagado:'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBTextMonto: TQRDBText
      Left = 120
      Top = 76
      Width = 44
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        317.500000000000000000
        201.083333333333300000
        116.416666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = dmLavanderia.tblLAV_PAGO
      DataField = 'MONTO'
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabelObservacion: TQRLabel
      Left = 8
      Top = 100
      Width = 87
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        264.583333333333300000
        230.187500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Observaciones:'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBTextObs: TQRDBText
      Left = 120
      Top = 100
      Width = 103
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        317.500000000000000000
        264.583333333333300000
        272.520833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = dmLavanderia.tblLAV_PAGO
      DataField = 'OBSERVACIONES'
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBTextFecha: TQRDBText
      Left = 80
      Top = 30
      Width = 81
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        211.666666666666700000
        79.375000000000000000
        214.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = dmLavanderia.tblLAV_PAGO
      DataField = 'FECHA_PAGO'
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabelGracias: TQRLabel
      Left = 8
      Top = 140
      Width = 132
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        370.416666666666700000
        349.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Gracias por su pago.'
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
  object QRBandPie: TQRBand
    Left = 48
    Top = 298
    Width = 235
    Height = 40
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
      105.833333333333300000
      621.770833333333300000)
    BandType = rbPageFooter
    object QRLabelFirma: TQRLabel
      Left = 8
      Top = 4
      Width = 36
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        10.583333333333330000
        95.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Firma:'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRShapeFirma: TQRShape
      Left = 50
      Top = 21
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333333000
        132.291666666666700000
        55.562500000000000000
        171.979166666666700000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
  end
end
