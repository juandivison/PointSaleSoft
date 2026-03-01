object qrOrdenLavanderia: TqrOrdenLavanderia
  Left = 200
  Top = 150
  Width = 226
  Height = 787
  Page.Orientation = poPortrait
  Page.PaperSize = Custom
  Page.Values = (
    127.000000000000000000
    2970.000000000000000000
    127.000000000000000000
    2100.000000000000000000
    127.000000000000000000
    127.000000000000000000
    0.000000000000000000)
  Font.Name = 'Arial'
  Font.Size = 8
  object PageHeaderBand1: TQRBand
    BandType = rbPageHeader
    Height = 100
    object QRLabelMembrete1: TQRLabel
      Left = 10
      Top = 5
      Width = 180
      Font.Size = 8
      Alignment = taCenter
      Caption = 'LAVANDERIA Y SASTRERIA PUNTA CANA'
    end
    object QRLabelMembrete2: TQRLabel
      Left = 10
      Top = 20
      Width = 180
      Font.Size = 8
      Alignment = taCenter
      Caption = 'LOS MANANTIALES'
    end
    object QRLabelMembrete3: TQRLabel
      Left = 10
      Top = 35
      Width = 180
      Font.Size = 8
      Alignment = taCenter
      Caption = 'CARR VERON PUNTA CANA'
    end
    object QRLabelMembrete4: TQRLabel
      Left = 10
      Top = 50
      Width = 180
      Font.Size = 8
      Alignment = taCenter
      Caption = 'TELEFONO: +18094539865'
    end
    object QRLabelMembrete5: TQRLabel
      Left = 10
      Top = 65
      Width = 180
      Font.Size = 8
      Alignment = taCenter
      Caption = 'adonismm199800@gmail.com'
    end
    object QRLabelIDOrden: TQRLabel
      Left = 10
      Top = 85
      Width = 180
      Font.Size = 8
      Alignment = taCenter
      Caption = '#lspc000000'
    end
  end

  object DetailBand1: TQRBand
    BandType = rbDetail
    Height = 18
    object QRDBTextProducto: TQRDBText
      Left = 10
      Top = 2
      Width = 100
      Font.Size = 8
      DataField = 'NOMBRE_PRODUCTO'
    end
    object QRDBTextCantidad: TQRDBText
      Left = 115
      Top = 2
      Width = 20
      Font.Size = 8
      Alignment = taRightJustify
      DataField = 'CANTIDAD'
    end
    object QRDBTextTotal: TQRDBText
      Left = 140
      Top = 2
      Width = 50
      Font.Size = 8
      Alignment = taRightJustify
      DataField = 'TOTAL_LINEA'
    end
  end

  object SummaryBand1: TQRBand
    BandType = rbSummary
    Height = 110
    object QRLabelSubtotal: TQRLabel
      Left = 10
      Top = 5
      Font.Size = 8
      Caption = 'SUBTOTAL:'
    end
    object QRExprSubtotal: TQRExpr
      Left = 100
      Top = 5
      Width = 80
      Font.Size = 8
      Expression = 'SUM(MONTO_BASE)'
    end
    object QRLabelTotal: TQRLabel
      Left = 10
      Top = 25
      Font.Size = 8
      Caption = 'TOTAL:'
    end
    object QRExprTotal: TQRExpr
      Left = 100
      Top = 25
      Width = 80
      Font.Size = 8
      Expression = 'SUM(TOTAL_LINEA)'
    end
    object QRLabelCliente: TQRLabel
      Left = 10
      Top = 45
      Width = 180
      Font.Size = 8
      Caption = 'Cliente: '
    end
    object QRLabelContacto: TQRLabel
      Left = 10
      Top = 60
      Width = 180
      Font.Size = 8
      Caption = 'Teléfono: '
    end
    object QRLabelOperador: TQRLabel
      Left = 10
      Top = 75
      Width = 180
      Font.Size = 8
      Caption = 'Operador: '
    end
    object QRLabelFecha: TQRLabel
      Left = 10
      Top = 90
      Width = 90
      Font.Size = 8
      Caption = 'Entrada: '
    end
    object QRLabelEntrega: TQRLabel
      Left = 100
      Top = 90
      Width = 90
      Font.Size = 8
      Caption = 'Entrega: '
    end
    object QRLabelFechaEntrega: TQRLabel
      Left = 100
      Top = 100
      Width = 100
      Font.Size = 8
      Caption = 'dd/mm/yyyy hh:nn'
    end
  end
end
