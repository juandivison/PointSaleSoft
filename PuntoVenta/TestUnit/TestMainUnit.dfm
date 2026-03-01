object TestForm: TTestForm
  Left = 773
  Top = 412
  Width = 480
  Height = 320
  Caption = 'Test Factura Automatica'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MemoLog: TMemo
    Left = 8
    Top = 8
    Width = 456
    Height = 145
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object btnRunTest: TButton
    Left = 8
    Top = 260
    Width = 120
    Height = 25
    Caption = 'Run Test'
    TabOrder = 1
    OnClick = btnRunTestClick
  end
  object MemoLogError: TMemo
    Left = 8
    Top = 160
    Width = 449
    Height = 89
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object rxVenta: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Serie'
        DataType = ftInteger
      end
      item
        Name = 'IDTasaITBIS'
        DataType = ftInteger
      end
      item
        Name = 'Cant'
        DataType = ftFloat
      end
      item
        Name = 'Precio'
        DataType = ftCurrency
      end
      item
        Name = 'PorcDescItem'
        DataType = ftCurrency
      end
      item
        Name = 'ItbisExento'
        DataType = ftSmallint
      end
      item
        Name = 'TipoVenta'
        DataType = ftInteger
      end>
    Left = 152
    Top = 8
  end
  object Totales: TRxMemoryData
    FieldDefs = <
      item
        Name = 'TotalesPorcDesAdicional'
        DataType = ftFloat
      end
      item
        Name = 'TotalesRecargo'
        DataType = ftCurrency
      end
      item
        Name = 'TotalNeto'
        DataType = ftFloat
      end
      item
        Name = 'Itbis'
        DataType = ftFloat
      end
      item
        Name = 'MontoDescItems'
        DataType = ftFloat
      end
      item
        Name = 'MontoDescAdicional'
        DataType = ftFloat
      end>
    Left = 320
    Top = 8
  end
  object IBStoredProc1: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INS_VENTAS_MAST'
    Left = 304
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO_TRNS'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'FORMA_PAGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTAL_DET'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO_DOC_PAGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SERIE_NCF_ASIGNADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_BRUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORC_DESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_PAGADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_CAMBIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_TOTAL_ITBIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMBRE_CLIENTE_GENERAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'E_MONTODESCGASTOSADMIN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'E_MONTODESCITBISGASTOSADMIN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'E_MONTODESCTRANSP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'E_MONTODESCDIRTECNICA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'E_MONTODESCITBISDIRTECNICA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'E_MONTODESCIMPREVISTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'E_MONTODESCITBISIMPREVISTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMENTARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COTIZACION_ORIGEN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIACTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_RECARGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPONCFIFISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_EXONERADO_ITBIS'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'NIF_IMPRESO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PROPINA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORCPROPINALEGAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PROPINALEGAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TICKET_ID'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'VENTAARS'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAINICIAPOLIZA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_AFILIADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDNUMERODVEH'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_INGRESO'
        ParamType = ptInput
      end>
  end
end
