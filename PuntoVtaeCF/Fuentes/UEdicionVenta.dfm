object frmEdicionVenta: TfrmEdicionVenta
  Left = 413
  Top = 187
  Width = 864
  Height = 518
  Caption = 'Edicion Venta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RxLabel1: TRxLabel
    Left = 8
    Top = 168
    Width = 761
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'D e t a l l e'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBStatusLabel1: TDBStatusLabel
    Left = 752
    Top = 416
    Width = 85
    Height = 13
    DatasetName = 'Mast Trans'
    DataSource = dstblDatosVenta
  end
  object DBStatusLabel2: TDBStatusLabel
    Left = 752
    Top = 432
    Width = 85
    Height = 13
    DatasetName = 'Det Trans'
    DataSource = dstblDatosDet
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 60
    Height = 13
    Caption = 'Numero Doc'
  end
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 48
    Width = 825
    Height = 113
    DataSource = dstblDatosVenta
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
    OnGetCellParams = RxDBGrid1GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_DOC_PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_CTE'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRECLIENTE'
        Title.Caption = 'Nombre Cliente'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_VENDEDOR'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMA_PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACION'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_BRUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_DESCUENTO'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_DESCUENTO'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCPROPINALEGAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROPINALEGAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROPINA'
        Visible = True
      end>
  end
  object RxDBGrid2: TRxDBGrid
    Left = 8
    Top = 184
    Width = 825
    Height = 225
    DataSource = dstblDatosDet
    FixedColor = 10547677
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
    OnGetCellParams = RxDBGrid2GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'SERIE'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_PROD'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_DESC_DET'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITBI_DET'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_SERVICIO_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_FACTURA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_IN'
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
      end
      item
        Expanded = False
        FieldName = 'CANT_REGRESO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT_PROMO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_DIETA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_AJUSTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_DESC_ITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_DESC_ITEM'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Tag = 3181
    Left = 200
    Top = 432
    Width = 89
    Height = 33
    Caption = '&Guardar'
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Tag = 3179
    Left = 416
    Top = 432
    Width = 113
    Height = 33
    Cancel = True
    Caption = '&Cancelar Venta'
    TabOrder = 3
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
      305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
      005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
      B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
      B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
      B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
      B0557777FF577777F7F500000E055550805577777F7555575755500000555555
      05555777775555557F5555000555555505555577755555557555}
    NumGlyphs = 2
  end
  object Button1: TButton
    Left = 107
    Top = 21
    Width = 75
    Height = 25
    Caption = '&Datos Venta'
    TabOrder = 4
    OnClick = Button1Click
  end
  object BitBtn3: TBitBtn
    Tag = 3180
    Left = 304
    Top = 432
    Width = 91
    Height = 33
    Caption = '&Modificar'
    Enabled = False
    TabOrder = 5
    Kind = bkOK
  end
  object EditN1: TEditN
    Left = 8
    Top = 24
    Width = 97
    Height = 21
    Hint = 'Entre numero de transaccion venta'
    Color = clSilver
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnExit = BitBtn1Click
    ColorOnFocus = clWhite
    ColorOnNotFocus = clSilver
    FontColorOnFocus = clRed
    FontColorOnNotFocus = clBlack
    FontColorOnOverWrite = clBlue
    EditType = etString
    EditKeyByTab = #9
    EditAlign = etAlignNone
    EditLengthAlign = 0
    EditPrecision = 0
    ValueInteger = 0
    ValueDate = 39823.000000000000000000
    ValueTime = 0.691100069444444400
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object tblDatosVenta: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblDatosVentaAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    InsertSQL.Strings = (
      '')
    SelectSQL.Strings = (
      
        'Select ventas_mast.*, clientes.nombre_cte nombrecliente,clientes' +
        '.codigo_cte, '
      'clientes.direccion_cont,clientes.ciudad,clientes.rnc_numero'
      'From clientes'
      
        'right outer JOIN VENTAS_MAST ON (CLIENTES.CODIGO_CTE = VENTAS_MA' +
        'ST.CODIGO_CTE)'
      'Where ventas_mast.fecha =:fecha'
      ''
      '')
    ModifySQL.Strings = (
      'update VENTAS_MAST'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  CODIGO_VENDEDOR = :CODIGO_VENDEDOR,'
      '  FORMA_PAGO = :FORMA_PAGO,'
      '  OBSERVACION = :OBSERVACION,'
      '  MONEDA = :MONEDA,'
      '  VALOR_TOTAL_DET = :VALOR_TOTAL_DET,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  NUMERO_FACTURA = :NUMERO_FACTURA,'
      '  NUMERO_DOC_PAGO = :NUMERO_DOC_PAGO,'
      '  SERIE_NCF_ASIGNADO = :SERIE_NCF_ASIGNADO,'
      '  MONTO_BRUTO = :MONTO_BRUTO,'
      '  PORC_DESCUENTO = :PORC_DESCUENTO,'
      '  MONTO_DESCUENTO = :MONTO_DESCUENTO'
      'Where'
      '  NUMERO = :OLD_NUMERO')
    Left = 192
    Top = 88
    object tblDatosVentaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object tblDatosVentaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object tblDatosVentaCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VENTAS_MAST.CIA_KEY'
    end
    object tblDatosVentaCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST.CODIGO_CTE'
    end
    object tblDatosVentaCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VENTAS_MAST.CODIGO_VENDEDOR'
    end
    object tblDatosVentaFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VENTAS_MAST.FORMA_PAGO'
    end
    object tblDatosVentaOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VENTAS_MAST.OBSERVACION'
      Size = 60
    end
    object tblDatosVentaMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_MAST.MONEDA'
      FixedChar = True
      Size = 1
    end
    object tblDatosVentaVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST.VALOR_TOTAL_DET'
    end
    object tblDatosVentaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENTAS_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblDatosVentaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_MAST.FECHA_IN'
    end
    object tblDatosVentaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_MAST.IN_POR'
      Size = 12
    end
    object tblDatosVentaFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_MAST.FECHA_MOD'
    end
    object tblDatosVentaMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_MAST.MOD_POR'
      Size = 12
    end
    object tblDatosVentaNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST.NUMERO_FACTURA'
    end
    object tblDatosVentaNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VENTAS_MAST.NUMERO_DOC_PAGO'
    end
    object tblDatosVentaSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
    object tblDatosVentaMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'VENTAS_MAST.MONTO_BRUTO'
    end
    object tblDatosVentaPORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VENTAS_MAST.PORC_DESCUENTO'
    end
    object tblDatosVentaMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_MAST.MONTO_DESCUENTO'
    end
    object tblDatosVentaMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'VENTAS_MAST.MONTO_INICIAL'
    end
    object tblDatosVentaNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'VENTAS_MAST.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
    object tblDatosVentaMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VENTAS_MAST.MONTO_PAGADO'
    end
    object tblDatosVentaMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'VENTAS_MAST.MONTO_CAMBIO'
    end
    object tblDatosVentaMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'VENTAS_MAST.MONTO_TOTAL_ITBIS'
    end
    object tblDatosVentaMONTODESCGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCGASTOSADMIN'
      Origin = 'VENTAS_MAST.MONTODESCGASTOSADMIN'
    end
    object tblDatosVentaMONTODESCITBISGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCITBISGASTOSADMIN'
      Origin = 'VENTAS_MAST.MONTODESCITBISGASTOSADMIN'
    end
    object tblDatosVentaMONTODESCTRANSP: TFloatField
      FieldName = 'MONTODESCTRANSP'
      Origin = 'VENTAS_MAST.MONTODESCTRANSP'
    end
    object tblDatosVentaMONTODESCDIRTECNICA: TFloatField
      FieldName = 'MONTODESCDIRTECNICA'
      Origin = 'VENTAS_MAST.MONTODESCDIRTECNICA'
    end
    object tblDatosVentaMONTODESCITBISDIRTECNICA: TFloatField
      FieldName = 'MONTODESCITBISDIRTECNICA'
      Origin = 'VENTAS_MAST.MONTODESCITBISDIRTECNICA'
    end
    object tblDatosVentaMONTODESCIMPREVISTO: TFloatField
      FieldName = 'MONTODESCIMPREVISTO'
      Origin = 'VENTAS_MAST.MONTODESCIMPREVISTO'
    end
    object tblDatosVentaMONTODESCITBISIMPREVISTO: TFloatField
      FieldName = 'MONTODESCITBISIMPREVISTO'
      Origin = 'VENTAS_MAST.MONTODESCITBISIMPREVISTO'
    end
    object tblDatosVentaCOMENTARIO: TIBStringField
      FieldName = 'COMENTARIO'
      Origin = 'VENTAS_MAST.COMENTARIO'
      Size = 80
    end
    object tblDatosVentaNOMBRECLIENTE: TIBStringField
      FieldName = 'NOMBRECLIENTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object tblDatosVentaCODIGO_CTE1: TIntegerField
      FieldName = 'CODIGO_CTE1'
      Origin = 'CLIENTES.CODIGO_CTE'
    end
    object tblDatosVentaDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object tblDatosVentaCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object tblDatosVentaRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object tblDatosVentaPORCPROPINALEGAL: TFloatField
      FieldName = 'PORCPROPINALEGAL'
      Origin = 'VENTAS_MAST.PORCPROPINALEGAL'
    end
    object tblDatosVentaPROPINA: TFloatField
      FieldName = 'PROPINA'
      Origin = 'VENTAS_MAST.PROPINA'
    end
    object tblDatosVentaPROPINALEGAL: TFloatField
      FieldName = 'PROPINALEGAL'
      Origin = 'VENTAS_MAST.PROPINALEGAL'
    end
  end
  object dstblDatosVenta: TDataSource
    DataSet = tblDatosVenta
    Left = 360
    Top = 96
  end
  object tblDatosDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from VENTAS_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into VENTAS_DET'
      
        '  (SERIE, NUMERO, CODIGO_PROD, CODIGO_BARRA, DESCRIPCION, CANTID' +
        'AD, PRECIO, '
      
        '   PORC_DESC_DET, ITBI_DET, VALOR_SERVICIO_DET, VALOR_TOTAL_DET,' +
        ' NUM_FACTURA, '
      
        '   STATUS_DET, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, CANT_REGRES' +
        'O, CANT_PROMO, '
      
        '   MONTO_DIETA, MONTO_AJUSTE, SERIE_PROD, STATUS_CNT, TIPO_UNIDA' +
        'D, ITBIS_EXENTO, '
      
        '   TIPO_VENTA, DESCRIPCIONPRODUCTO, PRECIO_COMPRA, CANT_CONDUCE,' +
        ' PORC_DESC_ITEM, '
      '   MONTO_DESC_ITEM)'
      'values'
      
        '  (:SERIE, :NUMERO, :CODIGO_PROD, :CODIGO_BARRA, :DESCRIPCION, :' +
        'CANTIDAD, '
      
        '   :PRECIO, :PORC_DESC_DET, :ITBI_DET, :VALOR_SERVICIO_DET, :VAL' +
        'OR_TOTAL_DET, '
      
        '   :NUM_FACTURA, :STATUS_DET, :FECHA_IN, :IN_POR, :FECHA_MOD, :M' +
        'OD_POR, '
      
        '   :CANT_REGRESO, :CANT_PROMO, :MONTO_DIETA, :MONTO_AJUSTE, :SER' +
        'IE_PROD, '
      
        '   :STATUS_CNT, :TIPO_UNIDAD, :ITBIS_EXENTO, :TIPO_VENTA, :DESCR' +
        'IPCIONPRODUCTO, '
      
        '   :PRECIO_COMPRA, :CANT_CONDUCE, :PORC_DESC_ITEM, :MONTO_DESC_I' +
        'TEM)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  CODIGO_PROD,'
      '  CODIGO_BARRA,'
      '  DESCRIPCION,'
      '  CANTIDAD,'
      '  PRECIO,'
      '  PORC_DESC_DET,'
      '  ITBI_DET,'
      '  VALOR_SERVICIO_DET,'
      '  VALOR_TOTAL_DET,'
      '  NUM_FACTURA,'
      '  STATUS_DET,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  CANT_REGRESO,'
      '  CANT_PROMO,'
      '  MONTO_DIETA,'
      '  MONTO_AJUSTE,'
      '  SERIE_PROD,'
      '  STATUS_CNT,'
      '  TIPO_UNIDAD,'
      '  ITBIS_EXENTO,'
      '  TIPO_VENTA,'
      '  DESCRIPCIONPRODUCTO,'
      '  COD_EMPLEADO_CONDUCTOR,'
      '  PLACA_VEHICULO,'
      '  MONEDA,'
      '  MONTO_TASA,'
      '  CAPACIDAD,'
      '  CANT_VIAJES,'
      '  CANT_METROS_CUBICO,'
      '  FICHA_VEH,'
      '  IDZONA_ORIGEN,'
      '  IDZONA_DETALLE,'
      '  PRECIO_COMPRA,'
      '  CANT_CONDUCE,'
      '  PORC_DESC_ITEM,'
      '  MONTO_DESC_ITEM'
      'from VENTAS_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * From VENTAS_DET'
      'Where Numero =:numero')
    ModifySQL.Strings = (
      'update VENTAS_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  CODIGO_BARRA = :CODIGO_BARRA,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO = :PRECIO,'
      '  PORC_DESC_DET = :PORC_DESC_DET,'
      '  ITBI_DET = :ITBI_DET,'
      '  VALOR_SERVICIO_DET = :VALOR_SERVICIO_DET,'
      '  VALOR_TOTAL_DET = :VALOR_TOTAL_DET,'
      '  NUM_FACTURA = :NUM_FACTURA,'
      '  STATUS_DET = :STATUS_DET,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  CANT_REGRESO = :CANT_REGRESO,'
      '  CANT_PROMO = :CANT_PROMO,'
      '  MONTO_DIETA = :MONTO_DIETA,'
      '  MONTO_AJUSTE = :MONTO_AJUSTE,'
      '  SERIE_PROD = :SERIE_PROD,'
      '  STATUS_CNT = :STATUS_CNT,'
      '  TIPO_UNIDAD = :TIPO_UNIDAD,'
      '  ITBIS_EXENTO = :ITBIS_EXENTO,'
      '  TIPO_VENTA = :TIPO_VENTA,'
      '  DESCRIPCIONPRODUCTO = :DESCRIPCIONPRODUCTO,'
      '  PRECIO_COMPRA = :PRECIO_COMPRA,'
      '  CANT_CONDUCE = :CANT_CONDUCE,'
      '  PORC_DESC_ITEM = :PORC_DESC_ITEM,'
      '  MONTO_DESC_ITEM = :MONTO_DESC_ITEM'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 328
    Top = 240
    object tblDatosDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET.SERIE'
      Required = True
    end
    object tblDatosDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_DET.NUMERO'
      Required = True
    end
    object tblDatosDetCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object tblDatosDetCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VENTAS_DET.CODIGO_BARRA'
    end
    object tblDatosDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object tblDatosDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET.CANTIDAD'
    end
    object tblDatosDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET.PRECIO'
    end
    object tblDatosDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET.PORC_DESC_DET'
    end
    object tblDatosDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET.ITBI_DET'
    end
    object tblDatosDetVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET.VALOR_SERVICIO_DET'
    end
    object tblDatosDetVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_DET.VALOR_TOTAL_DET'
    end
    object tblDatosDetNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VENTAS_DET.NUM_FACTURA'
    end
    object tblDatosDetSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object tblDatosDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_DET.FECHA_IN'
    end
    object tblDatosDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_DET.IN_POR'
      Size = 12
    end
    object tblDatosDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_DET.FECHA_MOD'
    end
    object tblDatosDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_DET.MOD_POR'
      Size = 12
    end
    object tblDatosDetCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VENTAS_DET.CANT_REGRESO'
    end
    object tblDatosDetCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VENTAS_DET.CANT_PROMO'
    end
    object tblDatosDetMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VENTAS_DET.MONTO_DIETA'
    end
    object tblDatosDetMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VENTAS_DET.MONTO_AJUSTE'
    end
    object tblDatosDetSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VENTAS_DET.SERIE_PROD'
      Size = 50
    end
    object tblDatosDetSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VENTAS_DET.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object tblDatosDetTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VENTAS_DET.TIPO_UNIDAD'
    end
    object tblDatosDetITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VENTAS_DET.ITBIS_EXENTO'
    end
    object tblDatosDetTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VENTAS_DET.TIPO_VENTA'
    end
    object tblDatosDetDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VENTAS_DET.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object tblDatosDetPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'VENTAS_DET.PRECIO_COMPRA'
    end
    object tblDatosDetMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_DET.MONEDA'
      FixedChar = True
      Size = 1
    end
    object tblDatosDetMONTO_TASA: TFloatField
      FieldName = 'MONTO_TASA'
      Origin = 'VENTAS_DET.MONTO_TASA'
    end
    object tblDatosDetCANT_CONDUCE: TFloatField
      FieldName = 'CANT_CONDUCE'
      Origin = 'VENTAS_DET.CANT_CONDUCE'
    end
    object tblDatosDetPORC_DESC_ITEM: TFloatField
      FieldName = 'PORC_DESC_ITEM'
      Origin = 'VENTAS_DET.PORC_DESC_ITEM'
    end
    object tblDatosDetMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VENTAS_DET.MONTO_DESC_ITEM'
    end
  end
  object dstblDatosDet: TDataSource
    DataSet = tblDatosDet
    Left = 328
    Top = 304
  end
  object qryFechaTrn: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select fecha from VENTAS_MAST'
      'Where  numero_DOC_PAGO =:numero'
      'And Forma_Pago = 1')
    Left = 464
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
  end
  object qryClientes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select Clientes.nombre_cte, direccion_cont, cedula,'
      'rnc_numero, ciudad, telef_contacto, codigo_cte, COD_VENDEDOR'
      'From Clientes'
      'Where Clientes.codigo_cte =:codigo')
    Left = 208
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end>
    object qryClientesNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryClientesDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryClientesCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryClientesRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryClientesCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryClientesTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryClientesCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryClientesCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'CLIENTES.COD_VENDEDOR'
    end
  end
  object qryNCFData: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  N.Numero_Ncf, N.Tipo_ncf, t.descripcion'
      'From NCF_ASIGNADOS n, tipo_cf t'
      'Where n.tipo_ncf = t.tipo_cf'
      'and n.serie =:seriencf')
    Left = 472
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'seriencf'
        ParamType = ptUnknown
      end>
    object qryNCFDataNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Required = True
      Size = 21
    end
    object qryNCFDataTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'NCF_ASIGNADOS.TIPO_NCF'
      Required = True
      Size = 2
    end
    object qryNCFDataDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_CF.DESCRIPCION'
      Size = 60
    end
  end
end
