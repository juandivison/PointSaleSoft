object frmExportarDatosTSS: TfrmExportarDatosTSS
  Left = 339
  Top = 202
  Width = 623
  Height = 506
  Caption = 'Exportar Datos de Nomina para la TSS'
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
    Left = 293
    Top = 11
    Width = 62
    Height = 13
    Caption = 'Mes AutoDet'
  end
  object Label2: TLabel
    Left = 286
    Top = 32
    Width = 75
    Height = 13
    Caption = 'Monto Nomina :'
  end
  object Label3: TLabel
    Left = 360
    Top = 32
    Width = 23
    Height = 13
    Caption = 'valor'
  end
  object rdgTipoEmp: TRadioGroup
    Left = 8
    Top = 16
    Width = 113
    Height = 105
    Caption = 'Tipo Empleado'
    ItemIndex = 0
    Items.Strings = (
      '&Activos'
      '&Inactivos'
      '&Todos')
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 128
    Top = 24
    Width = 75
    Height = 25
    Caption = '&Procesar'
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
      000333FFF3777777777F3000330FFFFFFF033777FF7F3FF3FF7F07B7030F00F0
      0F0377777F7F7737737F0BBB030FFFFFFF0377777F7F3FFFF37F07B7030F0000
      FF037777737F7777337F3000330FFFFFFF033777337F3FF3FF7F3333330F00F0
      00033333337F7737777F3333330FFFF0FF033FFFFF7F3FF7F3730000030F08F0
      F03377777F7F7737F7330999030FFFF0033377777F7FFFF77333099903000000
      333377777F7777773333099903333333333377777F33FFFFFFF3000003300000
      00337777733777777733333333330CCC033333333333777773333333333330C0
      3333333333333777333333333333330333333333333333733333}
    NumGlyphs = 2
  end
  object Memo1: TMemo
    Left = 8
    Top = 128
    Width = 585
    Height = 305
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 2
    Visible = False
    OnChange = Memo1Change
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 440
    Width = 513
    Height = 16
    Step = 1
    TabOrder = 3
  end
  object CheckBox1: TCheckBox
    Left = 128
    Top = 56
    Width = 97
    Height = 17
    Caption = '&Ver Datos'
    TabOrder = 4
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 96
    Width = 75
    Height = 25
    Caption = '&Guardar'
    TabOrder = 5
    OnClick = BitBtn2Click
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
  object BitBtn3: TBitBtn
    Left = 224
    Top = 96
    Width = 105
    Height = 25
    Caption = '&Cargar Nomina'
    TabOrder = 6
    OnClick = BitBtn3Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
      333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
      0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
      07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
      07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
      0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
      B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
      3BB33773333773333773B333333B3333333B7333333733333337}
    NumGlyphs = 2
  end
  object CheckBox2: TCheckBox
    Left = 128
    Top = 3
    Width = 137
    Height = 17
    Caption = 'Archivo Txt para Siren'
    TabOrder = 7
    OnClick = CheckBox2Click
  end
  object Button1: TButton
    Left = 512
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 8
    Visible = False
    OnClick = Button1Click
  end
  object combomeses: TComBoxMeses
    Left = 360
    Top = 3
    Width = 113
    Height = 21
    FechaInicial = 37833.000000000000000000
    FechaFinal = 37803.000000000000000000
    Items.Strings = (
      'Enero'
      'Febrero'
      'Marzo'
      'Abril'
      'Mayo'
      'Junio'
      'Julio'
      'Agosto'
      'Septiembre'
      'Octubre'
      'Noviembre'
      'Diciembre')
    TabOrder = 9
    Text = 'Julio'
    OnChange = combomesesChange
  end
  object RxSpinEdit1: TRxSpinEdit
    Left = 478
    Top = 2
    Width = 65
    Height = 21
    TabOrder = 10
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.txt'
    InitialDir = 'c:\DatosAsc'
    Title = 'Cargar Nomina Empleados'
    Left = 439
    Top = 76
  end
  object qryListEmp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qryListEmpCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '"C" tipodocumento,'
      'CEDULA CEDULA_nueva, '
      'NOMBRE, '
      'APELLIDO, '
      'FECHA_NAC, '
      'Tipo_Empleado, '
      'Null codigoidss,'
      'Sum(Nomina.SALARIO_BRUTO) SALARIO'
      'FROM EMPLEADO Empleados'
      '   INNER JOIN NOMINA Nomina'
      '   ON  (Empleados.CODIGO = Nomina.CODIGO_EMP)  '
      ''
      'Where status between :statusini  and :statusfin'
      'And  Nomina.Fecha_Nomina Between :FechaIni And :FechaFin'
      'And Paga_Afp = 1'
      'Group by CEDULA_NUEVA, '
      'NOMBRE, '
      'APELLIDO, '
      'FECHA_NAC, '
      'Tipo_Empleado'
      'Order By Nombre')
    Left = 368
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'statusini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'statusfin'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FechaIni'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FechaFin'
        ParamType = ptInput
      end>
    object qryListEmpTipoSalario: TStringField
      FieldKind = fkCalculated
      FieldName = 'TipoSalario'
      Calculated = True
    end
    object qryListEmpTIPODOCUMENTO: TIBStringField
      FieldName = 'TIPODOCUMENTO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryListEmpCEDULA_NUEVA: TIBStringField
      FieldName = 'CEDULA_NUEVA'
      Origin = 'EMPLEADOS.CEDULA_NUEVA'
      FixedChar = True
      Size = 15
    end
    object qryListEmpNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADOS.NOMBRE'
      Size = 30
    end
    object qryListEmpAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADOS.APELLIDO'
      Size = 30
    end
    object qryListEmpFECHA_NAC: TDateTimeField
      FieldName = 'FECHA_NAC'
      Origin = 'EMPLEADOS.FECHA_NAC'
    end
    object qryListEmpTIPO_EMPLEADO: TSmallintField
      FieldName = 'TIPO_EMPLEADO'
      Origin = 'EMPLEADOS.TIPO_EMPLEADO'
    end
    object qryListEmpCODIGOIDSS: TIBStringField
      FieldName = 'CODIGOIDSS'
      FixedChar = True
      Size = 1
    end
    object qryListEmpSALARIO: TFloatField
      FieldName = 'SALARIO'
    end
  end
end
