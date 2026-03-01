object frmViewCtaCatalogo: TfrmViewCtaCatalogo
  Left = 222
  Top = 131
  Width = 755
  Height = 480
  Caption = 'Catalogo de Cuentas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 346
    Top = 5
    Width = 25
    Height = 13
    Caption = 'Entre'
  end
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 56
    Width = 729
    Height = 337
    DataSource = dsqryViewCtaCtalogo
    FixedColor = 10547677
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NIVEL_CTA'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_CTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_CTA'
        Width = 219
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA1'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIGNO_CTA'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BALANCE_ACT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BALANCE_ANT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITO_ACM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLASIFICACION_CTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITO_ACT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTA_CONS1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTA_CONS2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTA_CONS3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTA_CTRL1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTA_CTRL2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTA_CTRL3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTACIE1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTACIE2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTACIE3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITO_ACM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITO_ACT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_ACT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_APE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_IN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_MOD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_ULT_TR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IN_POR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOD_POR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end>
  end
  object EditN1: TEditN
    Left = 345
    Top = 21
    Width = 121
    Height = 21
    Color = clSilver
    TabOrder = 1
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
    ValueDate = 39361.000000000000000000
    ValueTime = 0.837674768518518500
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 8
    Width = 329
    Height = 33
    Caption = 'Buscar Por'
    Columns = 5
    Items.Strings = (
      'Nombre'
      'Cuenta'
      'Cuenta1'
      'Cuenta2'
      'Cuenta3')
    TabOrder = 2
    OnClick = RadioGroup1Click
  end
  object Button1: TButton
    Left = 472
    Top = 16
    Width = 75
    Height = 25
    Caption = 'B&uscar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 280
    Top = 408
    Width = 75
    Height = 25
    TabOrder = 4
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 376
    Top = 408
    Width = 75
    Height = 25
    TabOrder = 5
    Kind = bkCancel
  end
  object qryViewCtaCtalogo: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from VIEW_ctas_catalogo'
      '')
    Left = 368
    Top = 208
    object qryViewCtaCtalogoBALANCE_ACT: TFloatField
      DisplayLabel = 'Balance Act'
      FieldName = 'BALANCE_ACT'
      Origin = 'VIEW_CTAS_CATALOGO.BALANCE_ACT'
    end
    object qryViewCtaCtalogoBALANCE_ANT: TFloatField
      DisplayLabel = 'Balance Ant'
      FieldName = 'BALANCE_ANT'
      Origin = 'VIEW_CTAS_CATALOGO.BALANCE_ANT'
    end
    object qryViewCtaCtalogoCLASIFICACION_CTA: TIntegerField
      DisplayLabel = 'Clasificacion Cta'
      FieldName = 'CLASIFICACION_CTA'
      Origin = 'VIEW_CTAS_CATALOGO.CLASIFICACION_CTA'
    end
    object qryViewCtaCtalogoCREDITO_ACM: TFloatField
      DisplayLabel = 'Cr Acm'
      FieldName = 'CREDITO_ACM'
      Origin = 'VIEW_CTAS_CATALOGO.CREDITO_ACM'
    end
    object qryViewCtaCtalogoCREDITO_ACT: TFloatField
      FieldName = 'CREDITO_ACT'
      Origin = 'VIEW_CTAS_CATALOGO.CREDITO_ACT'
    end
    object qryViewCtaCtalogoCTA_CONS1: TIBStringField
      FieldName = 'CTA_CONS1'
      Origin = 'VIEW_CTAS_CATALOGO.CTA_CONS1'
      FixedChar = True
      Size = 3
    end
    object qryViewCtaCtalogoCTA_CONS2: TIBStringField
      FieldName = 'CTA_CONS2'
      Origin = 'VIEW_CTAS_CATALOGO.CTA_CONS2'
      FixedChar = True
      Size = 2
    end
    object qryViewCtaCtalogoCTA_CONS3: TIBStringField
      FieldName = 'CTA_CONS3'
      Origin = 'VIEW_CTAS_CATALOGO.CTA_CONS3'
      FixedChar = True
      Size = 2
    end
    object qryViewCtaCtalogoCTA_CTRL1: TIBStringField
      FieldName = 'CTA_CTRL1'
      Origin = 'VIEW_CTAS_CATALOGO.CTA_CTRL1'
      FixedChar = True
      Size = 3
    end
    object qryViewCtaCtalogoCTA_CTRL2: TIBStringField
      FieldName = 'CTA_CTRL2'
      Origin = 'VIEW_CTAS_CATALOGO.CTA_CTRL2'
      FixedChar = True
      Size = 2
    end
    object qryViewCtaCtalogoCTA_CTRL3: TIBStringField
      FieldName = 'CTA_CTRL3'
      Origin = 'VIEW_CTAS_CATALOGO.CTA_CTRL3'
      FixedChar = True
      Size = 2
    end
    object qryViewCtaCtalogoCTACIE1: TIBStringField
      FieldName = 'CTACIE1'
      Origin = 'VIEW_CTAS_CATALOGO.CTACIE1'
      FixedChar = True
      Size = 3
    end
    object qryViewCtaCtalogoCTACIE2: TIBStringField
      FieldName = 'CTACIE2'
      Origin = 'VIEW_CTAS_CATALOGO.CTACIE2'
      FixedChar = True
      Size = 2
    end
    object qryViewCtaCtalogoCTACIE3: TIBStringField
      FieldName = 'CTACIE3'
      Origin = 'VIEW_CTAS_CATALOGO.CTACIE3'
      FixedChar = True
      Size = 2
    end
    object qryViewCtaCtalogoCUENTA1: TIBStringField
      DisplayLabel = 'Cta1'
      FieldName = 'CUENTA1'
      Origin = 'VIEW_CTAS_CATALOGO.CUENTA1'
      FixedChar = True
      Size = 3
    end
    object qryViewCtaCtalogoCUENTA2: TIBStringField
      DisplayLabel = 'Cta2'
      FieldName = 'CUENTA2'
      Origin = 'VIEW_CTAS_CATALOGO.CUENTA2'
      FixedChar = True
      Size = 2
    end
    object qryViewCtaCtalogoCUENTA3: TIBStringField
      DisplayLabel = 'Cta3'
      FieldName = 'CUENTA3'
      Origin = 'VIEW_CTAS_CATALOGO.CUENTA3'
      FixedChar = True
      Size = 2
    end
    object qryViewCtaCtalogoDEBITO_ACM: TFloatField
      DisplayLabel = 'Db Acm'
      FieldName = 'DEBITO_ACM'
      Origin = 'VIEW_CTAS_CATALOGO.DEBITO_ACM'
    end
    object qryViewCtaCtalogoDEBITO_ACT: TFloatField
      DisplayLabel = 'Db Act'
      FieldName = 'DEBITO_ACT'
      Origin = 'VIEW_CTAS_CATALOGO.DEBITO_ACT'
    end
    object qryViewCtaCtalogoFECHA_ACT: TDateTimeField
      DisplayLabel = 'Fecha Act'
      FieldName = 'FECHA_ACT'
      Origin = 'VIEW_CTAS_CATALOGO.FECHA_ACT'
    end
    object qryViewCtaCtalogoFECHA_APE: TDateTimeField
      DisplayLabel = 'Fecha Ape'
      FieldName = 'FECHA_APE'
      Origin = 'VIEW_CTAS_CATALOGO.FECHA_APE'
    end
    object qryViewCtaCtalogoFECHA_ULT_TR: TDateTimeField
      DisplayLabel = 'Fecha Ult Tr'
      FieldName = 'FECHA_ULT_TR'
      Origin = 'VIEW_CTAS_CATALOGO.FECHA_ULT_TR'
    end
    object qryViewCtaCtalogoNIVEL_CTA: TSmallintField
      DisplayLabel = 'NivelCta'
      FieldName = 'NIVEL_CTA'
      Origin = 'VIEW_CTAS_CATALOGO.NIVEL_CTA'
    end
    object qryViewCtaCtalogoNOMBRE_CTA: TIBStringField
      DisplayLabel = 'NombreCta'
      FieldName = 'NOMBRE_CTA'
      Origin = 'VIEW_CTAS_CATALOGO.NOMBRE_CTA'
      Size = 40
    end
    object qryViewCtaCtalogoSIGNO_CTA: TSmallintField
      DisplayLabel = 'Origen'
      FieldName = 'SIGNO_CTA'
      Origin = 'VIEW_CTAS_CATALOGO.SIGNO_CTA'
    end
    object qryViewCtaCtalogoSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'VIEW_CTAS_CATALOGO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryViewCtaCtalogoTIPO: TIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'VIEW_CTAS_CATALOGO.TIPO'
      FixedChar = True
      Size = 1
    end
    object qryViewCtaCtalogoTIPO_CTA: TIBStringField
      DisplayLabel = 'TipoCta'
      FieldName = 'TIPO_CTA'
      Origin = 'VIEW_CTAS_CATALOGO.TIPO_CTA'
      FixedChar = True
      Size = 1
    end
  end
  object dsqryViewCtaCtalogo: TDataSource
    DataSet = qryViewCtaCtalogo
    Left = 368
    Top = 160
  end
end
