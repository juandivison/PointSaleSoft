object frmElijeBcoCksReg: TfrmElijeBcoCksReg
  Left = 192
  Top = 117
  Width = 372
  Height = 238
  Caption = 'Imprimir Cheque(s)'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 36
    Top = 9
    Width = 37
    Height = 13
    Caption = 'Banco'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 148
    Top = 9
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label3: TLabel
    Left = 39
    Top = 55
    Width = 47
    Height = 13
    Caption = 'Compa'#241'ia'
  end
  object Label2: TLabel
    Left = 148
    Top = 57
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label7: TLabel
    Left = 39
    Top = 97
    Width = 66
    Height = 13
    Caption = 'Tipo Cheques'
  end
  object Label4: TLabel
    Left = 39
    Top = 145
    Width = 73
    Height = 13
    Caption = 'Cuenta x Pagar'
  end
  object dboxBancos: TComboBox
    Left = 38
    Top = 25
    Width = 105
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'dboxBancos'
  end
  object edtCodBco: TEditN
    Left = 148
    Top = 25
    Width = 42
    Height = 21
    Color = clSilver
    TabOrder = 1
    Text = '3'
    ColorOnFocus = clWhite
    ColorOnNotFocus = clSilver
    FontColorOnFocus = clRed
    FontColorOnNotFocus = clBlack
    FontColorOnOverWrite = clBlue
    EditType = etInteger
    EditKeyByTab = #9
    EditAlign = etAlignNone
    EditLengthAlign = 0
    EditPrecision = 0
    ValueFloat = 3.000000000000000000
    ValueInteger = 3
    ValueDate = 36904.000000000000000000
    ValueTime = 0.405339930555556000
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object dboxCompania: TComboBox
    Left = 39
    Top = 70
    Width = 105
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = 'dboxCompania'
  end
  object edtcodcia: TEditN
    Left = 148
    Top = 71
    Width = 42
    Height = 21
    Color = clSilver
    TabOrder = 3
    Text = '2'
    ColorOnFocus = clWhite
    ColorOnNotFocus = clSilver
    FontColorOnFocus = clRed
    FontColorOnNotFocus = clBlack
    FontColorOnOverWrite = clBlue
    EditType = etInteger
    EditKeyByTab = #9
    EditAlign = etAlignNone
    EditLengthAlign = 0
    EditPrecision = 0
    ValueFloat = 2.000000000000000000
    ValueInteger = 2
    ValueDate = 36904.000000000000000000
    ValueTime = 0.405339930555556000
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object cboxTipocks: TComboBox
    Left = 39
    Top = 114
    Width = 97
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'cboxTipocks'
    Items.Strings = (
      'Proveedores'
      'N'#243'mina'
      'N'#243'mina Otros')
  end
  object edtTipoCks: TEditN
    Left = 148
    Top = 113
    Width = 42
    Height = 21
    Color = clSilver
    TabOrder = 5
    Text = '2'
    ColorOnFocus = clWhite
    ColorOnNotFocus = clSilver
    FontColorOnFocus = clRed
    FontColorOnNotFocus = clBlack
    FontColorOnOverWrite = clBlue
    EditType = etInteger
    EditKeyByTab = #9
    EditAlign = etAlignNone
    EditLengthAlign = 0
    EditPrecision = 0
    ValueFloat = 2.000000000000000000
    ValueInteger = 2
    ValueDate = 36904.000000000000000000
    ValueTime = 0.405339930555556000
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object BitBtn1: TBitBtn
    Left = 214
    Top = 22
    Width = 113
    Height = 25
    Caption = '&Procesar'
    TabOrder = 6
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
    Left = 215
    Top = 103
    Width = 113
    Height = 26
    TabOrder = 7
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 215
    Top = 60
    Width = 113
    Height = 27
    Caption = 'Inserta Cks Det'
    TabOrder = 8
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
      C8807FF7777777777FF700000000000000007777777777777777333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object edtCtaxP: TEditN
    Left = 39
    Top = 161
    Width = 49
    Height = 21
    Color = clSilver
    TabOrder = 9
    Text = '2120801'
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
    ValueFloat = 2120801.000000000000000000
    ValueInteger = 2120801
    ValueDate = 36904.000000000000000000
    ValueTime = 0.405339930555556000
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object qryDatosCksReg: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Cheques_nomina.NUM_TRANS, '
      'Cheques_nomina.BENEFICIARIO, '
      'Cheques_nomina.MONTO, '
      'Cheques_nomina.TIPO_CKS, '
      'Cheques_nomina.COD_BANCO, '
      'Cheques_nomina.TIPO_NOMINA, '
      'Cheques_nomina.SUBTIPO, '
      'Cheques_nomina.STATUS, '
      'Empleados.TIPOSERVICIO, '
      'Empleados.SUBTIPOSERV'
      'FROM CHEQUES_NOMINA Cheques_nomina'
      '   INNER JOIN EMPLEADOS Empleados'
      '   ON  (Cheques_nomina.CODIGO_EMPLEADO = Empleados.CODIGO)  '
      'WHERE   (Cheques_nomina.fecha_emision = :fechaemision)  '
      '   AND  (Cheques_nomina.SUBTIPO = 4)  ')
    Left = 273
    Top = 42
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaemision'
        ParamType = ptInput
      end>
    object qryDatosCksRegNUM_TRANS: TFloatField
      FieldName = 'NUM_TRANS'
      Origin = 'CHEQUES_NOMINA.NUM_TRANS'
    end
    object qryDatosCksRegBENEFICIARIO: TStringField
      FieldName = 'BENEFICIARIO'
      Origin = 'CHEQUES_NOMINA.BENEFICIARIO'
      Size = 40
    end
    object qryDatosCksRegMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'CHEQUES_NOMINA.MONTO'
    end
    object qryDatosCksRegTIPO_CKS: TSmallintField
      FieldName = 'TIPO_CKS'
      Origin = 'CHEQUES_NOMINA.TIPO_CKS'
    end
    object qryDatosCksRegCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Origin = 'CHEQUES_NOMINA.COD_BANCO'
    end
    object qryDatosCksRegTIPO_NOMINA: TSmallintField
      FieldName = 'TIPO_NOMINA'
      Origin = 'CHEQUES_NOMINA.TIPO_NOMINA'
    end
    object qryDatosCksRegSUBTIPO: TSmallintField
      FieldName = 'SUBTIPO'
      Origin = 'CHEQUES_NOMINA.SUBTIPO'
    end
    object qryDatosCksRegSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'CHEQUES_NOMINA.STATUS'
      Size = 1
    end
    object qryDatosCksRegTIPOSERVICIO: TIntegerField
      FieldName = 'TIPOSERVICIO'
      Origin = 'EMPLEADOS.TIPOSERVICIO'
    end
    object qryDatosCksRegSUBTIPOSERV: TIntegerField
      FieldName = 'SUBTIPOSERV'
      Origin = 'EMPLEADOS.SUBTIPOSERV'
    end
  end
  object fechacks: TGetAnyDate
    Fecha = 37607.000000000000000000
    VFechaF = False
    EligeTipo = False
    TipoRes = 1
    UsaFechaCierre = False
    Left = 199
    Top = 78
  end
end
