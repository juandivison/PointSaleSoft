object frmNOmHistorico: TfrmNOmHistorico
  Left = 210
  Top = 147
  Width = 1018
  Height = 610
  Caption = 'Hist'#243'rico N'#243'mina'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1010
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 2
      Width = 44
      Height = 13
      Caption = 'Fecha Ini'
    end
    object Label2: TLabel
      Left = 100
      Top = 1
      Width = 47
      Height = 13
      Caption = 'Fecha Fin'
    end
    object Label3: TLabel
      Left = 190
      Top = 1
      Width = 40
      Height = 13
      Caption = 'CodEmp'
    end
    object dtpkFechaIni: TDateTimePicker
      Left = 8
      Top = 16
      Width = 86
      Height = 21
      Date = 37186.390795486110000000
      Time = 37186.390795486110000000
      TabOrder = 0
    end
    object dtpkFechaFin: TDateTimePicker
      Left = 98
      Top = 15
      Width = 84
      Height = 21
      Date = 37186.390795486110000000
      Time = 37186.390795486110000000
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 258
      Top = 12
      Width = 92
      Height = 25
      Hint = 'Click para cargar datos'
      Caption = '&Cargar Datos'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
        000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
        99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
        0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
        FFFF3FFFFF7F337F333300000307B70FFFFF77777F73FF733F330EEE033000FF
        0FFF7F337FF777337FF30EEE00033FF000FF7F33777F333777FF0EEE0E033300
        000F7FFF7F7FFF77777F00000E00000000007777737773777777330EEE0E0330
        00FF337FFF7F7F3777F33300000E033000FF337777737F3777F333330EEE0330
        00FF33337FFF7FF77733333300000000033F3333777777777333}
      NumGlyphs = 2
    end
    object EdtCodEmp: TEditN
      Left = 188
      Top = 16
      Width = 57
      Height = 21
      Hint = 'Entre codigo empleado para filtrar'
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
      ValueInteger = 0
      ValueDate = 37186.000000000000000000
      ValueTime = 0.392154629629629600
      TimeSeconds = False
      FirstCharUpper = False
      FirstCharUpList = ' ('
      WidthOnFocus = 0
      TextHint = True
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 1010
    Height = 468
    Align = alClient
    DataSource = DataSource1
    FixedColor = 8454143
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APELLIDO'
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_NOMINA'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALARIO_BRUTO'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTROS_INGRESOS'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDSS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COOPERATIVA'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ISR'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTRAS_DEDUCCIONES'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALARIO_NETO'
        Width = 100
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 509
    Width = 1010
    Height = 70
    Align = alBottom
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 32
      Top = 1
      Width = 793
      Height = 63
      DataSource = DataSource2
      FixedColor = 8454143
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'SBRUTO'
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OING'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDSS'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COOP'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEGMED'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ISR'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ODED'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SNETO'
          Width = 74
          Visible = True
        end>
    end
  end
  object qryHistoNomina: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'Empleados.CODIGO, '
      'Empleados.NOMBRE, '
      'Empleados.APELLIDO, '
      'Nomina.FECHA_NOMINA, '
      'Nomina.SALARIO_BRUTO, '
      'Nomina.IDSS, '
      'Nomina.COOPERATIVA, '
      '0.0 BMI, '
      'Nomina.ISR, '
      'Nomina.OTROS_INGRESOS, '
      'Nomina.OTRAS_DEDUCCIONES, '
      'Nomina.SALARIO_NETO '
      'FROM NOMINA Nomina'
      '   INNER JOIN EMPLEADO Empleados'
      '   ON  (Nomina.CIA_KEY = Empleados.CODIGO_CIA)  '
      '   AND  (Nomina.CODIGO_EMP = Empleados.CODIGO)  '
      'and Nomina.STATUS_NOMINA = '#39'P'#39
      'WHERE Nomina.FECHA_NOMINA BETWEEN :FECHAINI AND :FECHAFIN'
      'order by Nomina.FECHA_NOMINA,Empleados.CODIGO')
    Left = 296
    Top = 112
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAFIN'
        ParamType = ptInput
      end>
    object qryHistoNominaCODIGO: TIntegerField
      DisplayLabel = 'CodEmp'
      FieldName = 'CODIGO'
      Origin = 'EMPLEADOS.CODIGO'
    end
    object qryHistoNominaNOMBRE: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADOS.NOMBRE'
      Size = 30
    end
    object qryHistoNominaAPELLIDO: TStringField
      DisplayLabel = 'Apellido'
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADOS.APELLIDO'
      Size = 30
    end
    object qryHistoNominaFECHA_NOMINA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_NOMINA'
      Origin = 'NOMINA.FECHA_NOMINA'
    end
    object qryHistoNominaSALARIO_BRUTO: TFloatField
      DisplayLabel = 'S.Bruto'
      FieldName = 'SALARIO_BRUTO'
      Origin = 'NOMINA.SALARIO_BRUTO'
      DisplayFormat = ',0.00'
    end
    object qryHistoNominaIDSS: TFloatField
      DisplayLabel = 'Idss'
      FieldName = 'IDSS'
      Origin = 'NOMINA.IDSS'
      DisplayFormat = ',0.00'
    end
    object qryHistoNominaCOOPERATIVA: TFloatField
      DisplayLabel = 'Coop'
      FieldName = 'COOPERATIVA'
      Origin = 'NOMINA.COOPERATIVA'
      DisplayFormat = ',0.00'
    end
    object qryHistoNominaBMI: TFloatField
      DisplayLabel = 'Seg.Med'
      FieldName = 'BMI'
      Origin = 'NOMINA.BMI'
      DisplayFormat = ',0.00'
    end
    object qryHistoNominaISR: TFloatField
      DisplayLabel = 'Isr'
      FieldName = 'ISR'
      Origin = 'NOMINA.ISR'
      DisplayFormat = ',0.00'
    end
    object qryHistoNominaOTROS_INGRESOS: TFloatField
      DisplayLabel = 'O.Ing'
      FieldName = 'OTROS_INGRESOS'
      Origin = 'NOMINA.OTROS_INGRESOS'
      DisplayFormat = ',0.00'
    end
    object qryHistoNominaOTRAS_DEDUCCIONES: TFloatField
      DisplayLabel = 'O.Ded.'
      FieldName = 'OTRAS_DEDUCCIONES'
      Origin = 'NOMINA.OTRAS_DEDUCCIONES'
      DisplayFormat = ',0.00'
    end
    object qryHistoNominaSALARIO_NETO: TFloatField
      DisplayLabel = 'Salario Neto'
      FieldName = 'SALARIO_NETO'
      Origin = 'NOMINA.SALARIO_NETO'
      DisplayFormat = ',0.00'
    end
  end
  object DataSource1: TDataSource
    DataSet = qryHistoNomina
    Left = 432
    Top = 136
  end
  object qryTotalNom: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'sum(Nomina.SALARIO_BRUTO) SBRUTO, '
      'sum(Nomina.IDSS) IDSS, '
      'sum(Nomina.COOPERATIVA) COOP, '
      'SUM(0.0) SEGMED, '
      'sum(Nomina.ISR) ISR, '
      'sum(Nomina.OTROS_INGRESOS) OING, '
      'sum(Nomina.OTRAS_DEDUCCIONES) ODED, '
      'sum(Nomina.SALARIO_NETO) SNETO'
      'FROM NOMINA Nomina'
      '   INNER JOIN EMPLEADO Empleados'
      '   ON  (Nomina.CIA_KEY = Empleados.CODIGO_CIA)  '
      '   AND  (Nomina.CODIGO_EMP = Empleados.CODIGO)  '
      'and Nomina.STATUS_NOMINA = '#39'P'#39
      'WHERE Nomina.FECHA_NOMINA BETWEEN :FECHAINI AND :FECHAFIN'
      'and Empleados.CODIGO between :codigoini and :codigofin '
      '--order by Nomina.FECHA_NOMINA,Empleados.CODIGO')
    Left = 208
    Top = 144
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAFIN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigoini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigofin'
        ParamType = ptInput
      end>
    object qryTotalNomSBRUTO: TFloatField
      FieldName = 'SBRUTO'
      Origin = 'NOMINA.SALARIO_BRUTO'
      DisplayFormat = ',0.00'
    end
    object qryTotalNomIDSS: TFloatField
      FieldName = 'IDSS'
      Origin = 'NOMINA.IDSS'
      DisplayFormat = ',0.00'
    end
    object qryTotalNomCOOP: TFloatField
      FieldName = 'COOP'
      Origin = 'NOMINA.COOPERATIVA'
      DisplayFormat = ',0.00'
    end
    object qryTotalNomSEGMED: TFloatField
      FieldName = 'SEGMED'
      Origin = 'NOMINA.BMI'
      DisplayFormat = ',0.00'
    end
    object qryTotalNomISR: TFloatField
      FieldName = 'ISR'
      Origin = 'NOMINA.ISR'
      DisplayFormat = ',0.00'
    end
    object qryTotalNomOING: TFloatField
      FieldName = 'OING'
      Origin = 'NOMINA.OTROS_INGRESOS'
      DisplayFormat = ',0.00'
    end
    object qryTotalNomODED: TFloatField
      FieldName = 'ODED'
      Origin = 'NOMINA.OTRAS_DEDUCCIONES'
      DisplayFormat = ',0.00'
    end
    object qryTotalNomSNETO: TFloatField
      FieldName = 'SNETO'
      Origin = 'NOMINA.SALARIO_NETO'
      DisplayFormat = ',0.00'
    end
  end
  object DataSource2: TDataSource
    DataSet = qryTotalNom
    Left = 376
    Top = 136
  end
end
