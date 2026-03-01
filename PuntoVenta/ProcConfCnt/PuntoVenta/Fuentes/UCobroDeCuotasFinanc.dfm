object frmCobroCuotasXFinanc: TfrmCobroCuotasXFinanc
  Left = 21
  Top = 109
  Width = 991
  Height = 317
  Caption = 'Cobro de Cuotas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    983
    283)
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 344
    Top = 181
    Width = 112
    Height = 16
    Caption = 'Abono a Capital'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8404992
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RxLabel1: TRxLabel
    Left = 472
    Top = 178
    Width = 58
    Height = 16
    Caption = 'MONTO'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 584
    Top = 202
    Width = 43
    Height = 13
    Caption = 'NETO :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 136
    Top = 183
    Width = 151
    Height = 13
    Caption = 'Blc . Despu'#233's de Pgar.Cta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Visible = False
  end
  object RxLabel3: TRxLabel
    Left = 137
    Top = 198
    Width = 7
    Height = 16
    Color = 5669374
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
    OnClick = RxLabel3Click
  end
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 8
    Width = 961
    Height = 110
    DataSource = dsqryDatosCuota
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = RxDBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'SERIE'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_TRN'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_CTE'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_FREC_PAGO'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOINICIAL'
        Title.Caption = 'Monto Inicial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCIENTO'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_MORA'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT_CUOTAS'
        Title.Caption = '#Cuotas'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUOTASPEND'
        Title.Caption = 'Ctas_Pend'
        Width = 40
        Visible = True
      end
      item
        Color = 56797
        Expanded = False
        FieldName = 'BALANCE_ACT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_ULT_PAGO'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_APAGAR_PORMORA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_INTERES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_CUOTA'
        Visible = True
      end
      item
        Color = 56797
        Expanded = False
        FieldName = 'MONTO_CUOTA_TOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIASTRANS'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTPERIODOSATRASO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Width = 66
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 344
    Top = 233
    Width = 99
    Height = 35
    Anchors = [akLeft]
    Caption = '&Procesar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
      000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
      99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
      0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
      FFFF3333337F337F333333333307B70FFFFF33333373FF733F333333333000FF
      0FFF3333333777337FF3333333333FF000FF33FFFFF3333777FF300000333300
      000F377777F33377777F30EEE0333000000037F337F33777777730EEE0333330
      00FF37F337F3333777F330EEE033333000FF37FFF7F3333777F3300000333330
      00FF3777773333F77733333333333000033F3333333337777333}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 464
    Top = 234
    Width = 97
    Height = 36
    Anchors = [akLeft]
    Caption = '&Buscar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333FF3FF3333333333CC30003333333333773777333333333C33
      3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
      33003377333337F33377333333333C333300333F333337F33377339333333C33
      3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
      330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
      330077F377F337F33377993399333C33330077FF773337F33377399993333C33
      33333777733337F333FF333333333C33300033333333373FF7773333333333CC
      3000333333333377377733333333333333333333333333333333}
    NumGlyphs = 2
  end
  object BitBtn3: TBitBtn
    Left = 582
    Top = 233
    Width = 97
    Height = 35
    Anchors = [akLeft]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Kind = bkClose
  end
  object RxDBGrid2: TRxDBGrid
    Left = 336
    Top = 127
    Width = 400
    Height = 49
    BorderStyle = bsNone
    DataSource = DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Cuota'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoCapital'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoInteres'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoxMora'
        Width = 75
        Visible = True
      end
      item
        Color = 56797
        Expanded = False
        FieldName = 'TotalAPagar'
        Width = 82
        Visible = True
      end>
  end
  object edtAbonoACapital: TEditN
    Left = 344
    Top = 199
    Width = 121
    Height = 21
    Color = clSilver
    TabOrder = 5
    OnExit = edtAbonoACapitalExit
    ColorOnFocus = clWhite
    ColorOnNotFocus = clSilver
    FontColorOnFocus = clRed
    FontColorOnNotFocus = clBlack
    FontColorOnOverWrite = clBlue
    EditType = etFloat
    EditKeyByTab = #9
    EditAlign = etAlignNone
    EditLengthAlign = 0
    EditPrecision = 0
    ValueInteger = 0
    ValueDate = 39359.000000000000000000
    ValueTime = 0.999582546296296300
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object rxMontoPagado: TRxCalcEdit
    Left = 471
    Top = 197
    Width = 105
    Height = 21
    Hint = 'Entre monto a procesar'
    AutoSize = False
    NumGlyphs = 2
    TabOrder = 6
    OnChange = rxMontoPagadoChange
  end
  object RxCalcEditNeto: TRxCalcEdit
    Left = 623
    Top = 197
    Width = 111
    Height = 21
    Hint = 'Entre monto a procesar'
    AutoSize = False
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    Visible = False
  end
  object tblCobroDeCuotasFinanc: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from FINANCIAMIENTO'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into FINANCIAMIENTO'
      
        '  (SERIE, NUMERO_TRN, FECHA, CODIGO_CTE, TIPO_FREC_PAGO, PORCIEN' +
        'TO, PORC_MORA, '
      
        '   CANT_CUOTAS, MONTOINICIAL, DEBITO_ACUM, CREDITO_ACUM, MONTO_M' +
        'ORA_ACUM, '
      
        '   MONTO_DESC_PRONTOPAGO, BALANCE_ACT, FECHA_ULT_PAGO, STATUS, I' +
        'D_USUARIO_IN, '
      
        '   FECHA_IN, NOMBREPC, FECHA_UPDATE, ID_USUARIO_UPDATE, CUOTASPE' +
        'ND)'
      'values'
      
        '  (:SERIE, :NUMERO_TRN, :FECHA, :CODIGO_CTE, :TIPO_FREC_PAGO, :P' +
        'ORCIENTO, '
      
        '   :PORC_MORA, :CANT_CUOTAS, :MONTOINICIAL, :DEBITO_ACUM, :CREDI' +
        'TO_ACUM, '
      
        '   :MONTO_MORA_ACUM, :MONTO_DESC_PRONTOPAGO, :BALANCE_ACT, :FECH' +
        'A_ULT_PAGO, '
      
        '   :STATUS, :ID_USUARIO_IN, :FECHA_IN, :NOMBREPC, :FECHA_UPDATE,' +
        ' :ID_USUARIO_UPDATE, '
      '   :CUOTASPEND)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO_TRN,'
      '  FECHA,'
      '  CODIGO_CTE,'
      '  TIPO_FREC_PAGO,'
      '  PORCIENTO,'
      '  PORC_MORA,'
      '  CANT_CUOTAS,'
      '  MONTOINICIAL,'
      '  DEBITO_ACUM,'
      '  CREDITO_ACUM,'
      '  MONTO_MORA_ACUM,'
      '  MONTO_DESC_PRONTOPAGO,'
      '  BALANCE_ACT,'
      '  FECHA_ULT_PAGO,'
      '  STATUS,'
      '  ID_USUARIO_IN,'
      '  FECHA_IN,'
      '  NOMBREPC,'
      '  FECHA_UPDATE,'
      '  ID_USUARIO_UPDATE,'
      '  CUOTASPEND'
      'from FINANCIAMIENTO '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select   * from FINANCIAMIENTO'
      'Where CODIGO_CTE =:codigo'
      'and serie =:serie')
    ModifySQL.Strings = (
      'update FINANCIAMIENTO'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO_TRN = :NUMERO_TRN,'
      '  FECHA = :FECHA,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  TIPO_FREC_PAGO = :TIPO_FREC_PAGO,'
      '  PORCIENTO = :PORCIENTO,'
      '  PORC_MORA = :PORC_MORA,'
      '  CANT_CUOTAS = :CANT_CUOTAS,'
      '  MONTOINICIAL = :MONTOINICIAL,'
      '  DEBITO_ACUM = :DEBITO_ACUM,'
      '  CREDITO_ACUM = :CREDITO_ACUM,'
      '  MONTO_MORA_ACUM = :MONTO_MORA_ACUM,'
      '  MONTO_DESC_PRONTOPAGO = :MONTO_DESC_PRONTOPAGO,'
      '  BALANCE_ACT = :BALANCE_ACT,'
      '  FECHA_ULT_PAGO = :FECHA_ULT_PAGO,'
      '  STATUS = :STATUS,'
      '  ID_USUARIO_IN = :ID_USUARIO_IN,'
      '  FECHA_IN = :FECHA_IN,'
      '  NOMBREPC = :NOMBREPC,'
      '  FECHA_UPDATE = :FECHA_UPDATE,'
      '  ID_USUARIO_UPDATE = :ID_USUARIO_UPDATE,'
      '  CUOTASPEND = :CUOTASPEND'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 502
    Top = 41
    object tblCobroDeCuotasFinancSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'FINANCIAMIENTO.SERIE'
      Required = True
    end
    object tblCobroDeCuotasFinancNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'FINANCIAMIENTO.NUMERO_TRN'
      Required = True
    end
    object tblCobroDeCuotasFinancFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FINANCIAMIENTO.FECHA'
      Required = True
    end
    object tblCobroDeCuotasFinancCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'FINANCIAMIENTO.CODIGO_CTE'
      Required = True
    end
    object tblCobroDeCuotasFinancTIPO_FREC_PAGO: TIntegerField
      FieldName = 'TIPO_FREC_PAGO'
      Origin = 'FINANCIAMIENTO.TIPO_FREC_PAGO'
      Required = True
    end
    object tblCobroDeCuotasFinancPORCIENTO: TFloatField
      FieldName = 'PORCIENTO'
      Origin = 'FINANCIAMIENTO.PORCIENTO'
    end
    object tblCobroDeCuotasFinancPORC_MORA: TFloatField
      FieldName = 'PORC_MORA'
      Origin = 'FINANCIAMIENTO.PORC_MORA'
    end
    object tblCobroDeCuotasFinancCANT_CUOTAS: TIntegerField
      FieldName = 'CANT_CUOTAS'
      Origin = 'FINANCIAMIENTO.CANT_CUOTAS'
    end
    object tblCobroDeCuotasFinancMONTOINICIAL: TFloatField
      FieldName = 'MONTOINICIAL'
      Origin = 'FINANCIAMIENTO.MONTOINICIAL'
    end
    object tblCobroDeCuotasFinancDEBITO_ACUM: TFloatField
      FieldName = 'DEBITO_ACUM'
      Origin = 'FINANCIAMIENTO.DEBITO_ACUM'
    end
    object tblCobroDeCuotasFinancCREDITO_ACUM: TFloatField
      FieldName = 'CREDITO_ACUM'
      Origin = 'FINANCIAMIENTO.CREDITO_ACUM'
    end
    object tblCobroDeCuotasFinancMONTO_MORA_ACUM: TFloatField
      FieldName = 'MONTO_MORA_ACUM'
      Origin = 'FINANCIAMIENTO.MONTO_MORA_ACUM'
    end
    object tblCobroDeCuotasFinancMONTO_DESC_PRONTOPAGO: TFloatField
      FieldName = 'MONTO_DESC_PRONTOPAGO'
      Origin = 'FINANCIAMIENTO.MONTO_DESC_PRONTOPAGO'
    end
    object tblCobroDeCuotasFinancBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'FINANCIAMIENTO.BALANCE_ACT'
    end
    object tblCobroDeCuotasFinancFECHA_ULT_PAGO: TDateTimeField
      FieldName = 'FECHA_ULT_PAGO'
      Origin = 'FINANCIAMIENTO.FECHA_ULT_PAGO'
    end
    object tblCobroDeCuotasFinancSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FINANCIAMIENTO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblCobroDeCuotasFinancID_USUARIO_IN: TIntegerField
      FieldName = 'ID_USUARIO_IN'
      Origin = 'FINANCIAMIENTO.ID_USUARIO_IN'
    end
    object tblCobroDeCuotasFinancFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'FINANCIAMIENTO.FECHA_IN'
    end
    object tblCobroDeCuotasFinancNOMBREPC: TIBStringField
      FieldName = 'NOMBREPC'
      Origin = 'FINANCIAMIENTO.NOMBREPC'
      Size = 12
    end
    object tblCobroDeCuotasFinancFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'FINANCIAMIENTO.FECHA_UPDATE'
    end
    object tblCobroDeCuotasFinancID_USUARIO_UPDATE: TIntegerField
      FieldName = 'ID_USUARIO_UPDATE'
      Origin = 'FINANCIAMIENTO.ID_USUARIO_UPDATE'
    end
    object tblCobroDeCuotasFinancCUOTASPEND: TIntegerField
      FieldName = 'CUOTASPEND'
      Origin = 'FINANCIAMIENTO.CUOTASPEND'
    end
  end
  object dstblCobroDeCuotasFinanc: TDataSource
    DataSet = tblCobroDeCuotasFinanc
    Left = 368
    Top = 40
  end
  object qryDatosCuota: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM PROC_BUSCAR_CUOTAFINANC (:codigocte, :fecha)'
      'WHERE Serie =:Serie')
    Left = 716
    Top = 43
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigocte'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'serie'
        ParamType = ptInput
      end>
    object qryDatosCuotaSERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.SERIE'
    end
    object qryDatosCuotaNUMERO_TRN: TIntegerField
      DisplayLabel = 'NumTrn'
      FieldName = 'NUMERO_TRN'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.NUMERO_TRN'
    end
    object qryDatosCuotaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.FECHA'
    end
    object qryDatosCuotaCODIGO_CTE: TIntegerField
      DisplayLabel = 'CodigoCte'
      FieldName = 'CODIGO_CTE'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.CODIGO_CTE'
    end
    object qryDatosCuotaTIPO_FREC_PAGO: TIntegerField
      DisplayLabel = 'FrecPago'
      FieldName = 'TIPO_FREC_PAGO'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.TIPO_FREC_PAGO'
    end
    object qryDatosCuotaPORCIENTO: TFloatField
      DisplayLabel = '%Interes'
      FieldName = 'PORCIENTO'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.PORCIENTO'
    end
    object qryDatosCuotaPORC_MORA: TFloatField
      DisplayLabel = '%Mora'
      FieldName = 'PORC_MORA'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.PORC_MORA'
    end
    object qryDatosCuotaCANT_CUOTAS: TIntegerField
      DisplayLabel = 'Cant.Cuotas'
      FieldName = 'CANT_CUOTAS'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.CANT_CUOTAS'
    end
    object qryDatosCuotaBALANCE_ACT: TFloatField
      DisplayLabel = 'Balance Act'
      FieldName = 'BALANCE_ACT'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.BALANCE_ACT'
    end
    object qryDatosCuotaFECHA_ULT_PAGO: TDateTimeField
      DisplayLabel = 'FechaUltPago'
      FieldName = 'FECHA_ULT_PAGO'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.FECHA_ULT_PAGO'
    end
    object qryDatosCuotaMONTO_APAGAR_PORMORA: TFloatField
      DisplayLabel = 'Monto Mora'
      FieldName = 'MONTO_APAGAR_PORMORA'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.MONTO_APAGAR_PORMORA'
    end
    object qryDatosCuotaMONTO_INTERES: TFloatField
      DisplayLabel = 'Monto Interes'
      FieldName = 'MONTO_INTERES'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.MONTO_INTERES'
    end
    object qryDatosCuotaMONTO_CUOTA: TFloatField
      DisplayLabel = 'MontoCuota'
      FieldName = 'MONTO_CUOTA'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.MONTO_CUOTA'
    end
    object qryDatosCuotaMONTO_CUOTA_TOTAL: TFloatField
      DisplayLabel = 'Monto Total'
      FieldName = 'MONTO_CUOTA_TOTAL'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.MONTO_CUOTA_TOTAL'
    end
    object qryDatosCuotaDIASTRANS: TIntegerField
      DisplayLabel = 'DiasTransc'
      FieldName = 'DIASTRANS'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.DIASTRANS'
    end
    object qryDatosCuotaCANTPERIODOSATRASO: TIntegerField
      DisplayLabel = 'Periodos en Atraso'
      FieldName = 'CANTPERIODOSATRASO'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.CANTPERIODOSATRASO'
    end
    object qryDatosCuotaCANTMESATRASO: TIntegerField
      FieldName = 'CANTMESATRASO'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.CANTMESATRASO'
    end
    object qryDatosCuotaNUM_FACTURA: TIntegerField
      FieldName = 'NUM_FACTURA'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.NUM_FACTURA'
    end
    object qryDatosCuotaCUOTASPEND: TIntegerField
      FieldName = 'CUOTASPEND'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.CUOTASPEND'
    end
    object qryDatosCuotaMONTOINICIAL: TFloatField
      FieldName = 'MONTOINICIAL'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.MONTOINICIAL'
    end
    object qryDatosCuotaMONTO_CAP_INICIAL: TFloatField
      FieldName = 'MONTO_CAP_INICIAL'
      Origin = 'PROC_BUSCAR_CUOTAFINANC.MONTO_CAP_INICIAL'
    end
  end
  object dsqryDatosCuota: TDataSource
    DataSet = qryDatosCuota
    Left = 614
    Top = 43
  end
  object rxDatos: TRxMemoryData
    FieldDefs = <
      item
        Name = 'MontoTotalCuota'
        DataType = ftCurrency
      end
      item
        Name = 'MontoPagado'
        DataType = ftCurrency
      end
      item
        Name = 'DescuentoProntoPago'
        DataType = ftCurrency
      end
      item
        Name = 'MontoCuota'
        DataType = ftFloat
      end>
    Left = 224
    Top = 48
    object rxDatosMontoTotalCuota: TCurrencyField
      FieldName = 'MontoTotalCuota'
      DisplayFormat = ',0.00'
    end
    object rxDatosMontoPagado: TCurrencyField
      FieldName = 'MontoPagado'
      DisplayFormat = ',0.00'
    end
    object rxDatosDescuentoProntoPago: TCurrencyField
      FieldName = 'DescuentoProntoPago'
      DisplayFormat = ',0.00'
    end
    object rxDatosMontoCuota: TFloatField
      FieldName = 'MontoCuota'
    end
  end
  object DataSource1: TDataSource
    DataSet = rxDatos
    Left = 144
    Top = 48
  end
  object DataSource2: TDataSource
    DataSet = rxTotales
    Left = 64
    Top = 180
  end
  object rxTotales: TRxMemoryData
    FieldDefs = <
      item
        Name = 'MontoInteresAPagar'
        DataType = ftFloat
      end
      item
        Name = 'Cuota'
        DataType = ftFloat
      end
      item
        Name = 'MontoxMora'
        DataType = ftFloat
      end
      item
        Name = 'TotalAPagar'
        DataType = ftFloat
      end
      item
        Name = 'MontoCapital'
        DataType = ftCurrency
      end
      item
        Name = 'MontoInteres'
        DataType = ftFloat
      end>
    Left = 64
    Top = 132
    object rxTotalesMontoInteresAPagar: TFloatField
      FieldName = 'MontoInteresAPagar'
      DisplayFormat = ',0.00'
    end
    object rxTotalesCuota: TFloatField
      FieldName = 'Cuota'
      DisplayFormat = ',0.00'
    end
    object rxTotalesMontoxMora: TFloatField
      FieldName = 'MontoxMora'
      DisplayFormat = ',0.00'
    end
    object rxTotalesTotalAPagar: TFloatField
      DisplayLabel = 'Total a Pagar'
      FieldName = 'TotalAPagar'
      DisplayFormat = ',0.00'
    end
    object rxTotalesMontoCapital: TCurrencyField
      FieldName = 'MontoCapital'
    end
    object rxTotalesMontoInteres: TFloatField
      FieldName = 'MontoInteres'
      DisplayFormat = ',0.00'
    end
  end
end
