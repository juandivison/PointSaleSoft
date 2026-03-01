object frmCierreZ: TfrmCierreZ
  Left = 198
  Top = 116
  Width = 1110
  Height = 508
  Caption = 'Libro Venta - Cierre Z'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 7
    Top = 6
    Width = 75
    Height = 16
    Caption = 'Fecha Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 151
    Top = 6
    Width = 70
    Height = 16
    Caption = 'Fecha Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 280
    Top = 8
    Width = 74
    Height = 13
    Caption = '#Cierre Z Inicial'
  end
  object Label2: TLabel
    Left = 368
    Top = 8
    Width = 69
    Height = 13
    Caption = '#Cierre Z Final'
  end
  object RxDBGrid1: TRxDBGrid
    Left = 7
    Top = 56
    Width = 1354
    Height = 473
    DataSource = dsqryDatosVenta
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'DESTTIPOVENTA'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 275
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NIF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_NCF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_ITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPONCFIFISCAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_NCF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_TOTAL_ITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_RECARGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_EXONERADO_ITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_DESCUENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_VENTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCIONPRODUCTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDTASAITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITBIS_FISCAL_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITBI_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_DESC_ITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_DESC_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_DESC_DET1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_AJUSTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_DIETA'
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
        FieldName = 'STATUS_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMA_PAGO'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 455
    Top = 20
    Width = 75
    Height = 25
    Caption = '&Datos'
    TabOrder = 1
    OnClick = Button1Click
  end
  object dbEditFechaInicial: TDateEdit
    Left = 7
    Top = 25
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object dbEditFechaFinal: TDateEdit
    Left = 151
    Top = 25
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
  end
  object edtCierreZIni: TEditN
    Left = 280
    Top = 24
    Width = 81
    Height = 21
    Color = clSilver
    TabOrder = 4
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
    ValueDate = 42055.000000000000000000
    ValueTime = 0.956810509259259300
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object edtCierreZFinal: TEditN
    Left = 368
    Top = 24
    Width = 81
    Height = 21
    Color = clSilver
    TabOrder = 5
    OnExit = edtCierreZFinalExit
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
    ValueDate = 42055.000000000000000000
    ValueTime = 0.956810509259259300
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object BitBtn1: TBitBtn
    Left = 544
    Top = 20
    Width = 75
    Height = 25
    Caption = 'Reporte Det'
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object qryDatosVenta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      'case v.TIPO_VENTA  '
      'when 0 then  '#39'Item venta'#39
      'when 1 then  '#39'Anular '#237'tem'#39
      'when 2 then  '#39'Desc '#237'tem'#39
      'when 3 then  '#39'Recargo '#237'tem'#39
      'when 4 then  '#39#205'tem retorno'#39
      'when 5 then  '#39'Anular '#237'tem Retorno'#39
      'end as DestTipoVenta,'
      ''
      
        'r.NUMERO, r.FECHA, i.DESCRIPCION, e.nif, e.TIPO, e.MONTO_ITBIS, ' +
        ' r.NUMERO_NCF, r.TIPONCFIFISCAL, r.TIPO_NCF,r.MONTO_TOTAL_ITBIS,' +
        ' r.MONTO_RECARGO, r.MONTO_EXONERADO_ITBIS, r.MONTO_DESCUENTO, v.' +
        'TIPO_VENTA, v.DESCRIPCIONPRODUCTO, v.IDTASAITBIS, v.CANTIDAD, '
      
        'v.PRECIO, v.ITBIS_FISCAL_DET, v.ITBI_DET, v.MONTO_DESC_ITEM, v.P' +
        'ORC_DESC_DET, v.PORC_DESC_DET,'
      
        'v.MONTO_AJUSTE, v.MONTO_DIETA, v.VALOR_SERVICIO_DET, v.VALOR_TOT' +
        'AL_DET, v.STATUS_DET,'
      'r.FORMA_PAGO'
      
        'from VIEW_VENTAS_MAST r, ESTADOFISCAL e, NCF_TIPO_IFISCAL i, VIE' +
        'W_VENTAS_DET v'
      'Where r.fecha  between  :fechaIni And :fechaFin'
      'And e.NUMERO = r.NUMERO'
      'And v.NUMERO = r.NUMERO'
      'And i.TIPO_NCF_IFISCAL = r.TIPONCFIFISCAL'
      'Order by r.TIPONCFIFISCAL,  r.NUMERO_NCF, e.tipo, r.numero')
    Left = 760
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fechaIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fechaFin'
        ParamType = ptUnknown
      end>
    object qryDatosVentaDESTTIPOVENTA: TIBStringField
      FieldName = 'DESTTIPOVENTA'
      FixedChar = True
      Size = 19
    end
    object qryDatosVentaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_VENTAS_MAST.NUMERO'
    end
    object qryDatosVentaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VIEW_VENTAS_MAST.FECHA'
    end
    object qryDatosVentaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'NCF_TIPO_IFISCAL.DESCRIPCION'
      Size = 80
    end
    object qryDatosVentaNIF: TIBStringField
      FieldName = 'NIF'
      Origin = 'ESTADOFISCAL.NIF'
      Required = True
      Size = 16
    end
    object qryDatosVentaTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'ESTADOFISCAL.TIPO'
      Required = True
    end
    object qryDatosVentaMONTO_ITBIS: TFloatField
      FieldName = 'MONTO_ITBIS'
      Origin = 'ESTADOFISCAL.MONTO_ITBIS'
    end
    object qryDatosVentaNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'VIEW_VENTAS_MAST.NUMERO_NCF'
      Size = 21
    end
    object qryDatosVentaTIPONCFIFISCAL: TIntegerField
      FieldName = 'TIPONCFIFISCAL'
      Origin = 'VIEW_VENTAS_MAST.TIPONCFIFISCAL'
    end
    object qryDatosVentaTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'VIEW_VENTAS_MAST.TIPO_NCF'
      Size = 2
    end
    object qryDatosVentaMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'VIEW_VENTAS_MAST.MONTO_TOTAL_ITBIS'
    end
    object qryDatosVentaMONTO_RECARGO: TFloatField
      FieldName = 'MONTO_RECARGO'
      Origin = 'VIEW_VENTAS_MAST.MONTO_RECARGO'
    end
    object qryDatosVentaMONTO_EXONERADO_ITBIS: TFloatField
      FieldName = 'MONTO_EXONERADO_ITBIS'
      Origin = 'VIEW_VENTAS_MAST.MONTO_EXONERADO_ITBIS'
    end
    object qryDatosVentaMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VIEW_VENTAS_MAST.MONTO_DESCUENTO'
    end
    object qryDatosVentaTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VIEW_VENTAS_DET.TIPO_VENTA'
    end
    object qryDatosVentaDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VIEW_VENTAS_DET.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryDatosVentaIDTASAITBIS: TFloatField
      FieldName = 'IDTASAITBIS'
      Origin = 'VIEW_VENTAS_DET.IDTASAITBIS'
    end
    object qryDatosVentaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VIEW_VENTAS_DET.CANTIDAD'
    end
    object qryDatosVentaPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VIEW_VENTAS_DET.PRECIO'
    end
    object qryDatosVentaITBIS_FISCAL_DET: TFloatField
      FieldName = 'ITBIS_FISCAL_DET'
      Origin = 'VIEW_VENTAS_DET.ITBIS_FISCAL_DET'
    end
    object qryDatosVentaITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VIEW_VENTAS_DET.ITBI_DET'
    end
    object qryDatosVentaMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VIEW_VENTAS_DET.MONTO_DESC_ITEM'
    end
    object qryDatosVentaPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VIEW_VENTAS_DET.PORC_DESC_DET'
    end
    object qryDatosVentaPORC_DESC_DET1: TFloatField
      FieldName = 'PORC_DESC_DET1'
      Origin = 'VIEW_VENTAS_DET.PORC_DESC_DET'
    end
    object qryDatosVentaMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VIEW_VENTAS_DET.MONTO_AJUSTE'
    end
    object qryDatosVentaMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VIEW_VENTAS_DET.MONTO_DIETA'
    end
    object qryDatosVentaVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VIEW_VENTAS_DET.VALOR_SERVICIO_DET'
    end
    object qryDatosVentaVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VIEW_VENTAS_DET.VALOR_TOTAL_DET'
    end
    object qryDatosVentaSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VIEW_VENTAS_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryDatosVentaFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VIEW_VENTAS_MAST.FORMA_PAGO'
    end
  end
  object dsqryDatosVenta: TDataSource
    DataSet = qryDatosVenta
    Left = 768
    Top = 200
  end
  object rxData: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Seccion'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Monto'
        DataType = ftCurrency
      end
      item
        Name = 'TipoSeccion'
        DataType = ftInteger
      end>
    Left = 552
    Top = 136
  end
end
