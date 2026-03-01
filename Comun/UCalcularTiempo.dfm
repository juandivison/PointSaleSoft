object frmCalcularTiempoRenta: TfrmCalcularTiempoRenta
  Left = 328
  Top = 37
  Width = 696
  Height = 490
  Caption = 'Calcular Tiempo Renta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 44
    Height = 13
    Caption = 'Fecha Ini'
  end
  object Label2: TLabel
    Left = 128
    Top = 32
    Width = 37
    Height = 13
    Caption = 'Hora Ini'
  end
  object Label3: TLabel
    Left = 240
    Top = 32
    Width = 44
    Height = 13
    Caption = 'Fecha Ini'
  end
  object Label4: TLabel
    Left = 328
    Top = 32
    Width = 37
    Height = 13
    Caption = 'Hora fin'
  end
  object LabelDia: TLabel
    Left = 40
    Top = 184
    Width = 42
    Height = 13
    Caption = 'LabelDia'
  end
  object LabelMes: TLabel
    Left = 40
    Top = 160
    Width = 46
    Height = 13
    Caption = 'LabelMes'
  end
  object LabelAnio: TLabel
    Left = 40
    Top = 136
    Width = 47
    Height = 13
    Caption = 'LabelAnio'
  end
  object Label5: TLabel
    Left = 112
    Top = 184
    Width = 16
    Height = 13
    Caption = 'Dia'
  end
  object Label6: TLabel
    Left = 112
    Top = 160
    Width = 20
    Height = 13
    Caption = 'Mes'
  end
  object Label7: TLabel
    Left = 112
    Top = 136
    Width = 19
    Height = 13
    Caption = 'A'#241'o'
  end
  object Label8: TLabel
    Left = 152
    Top = 376
    Width = 32
    Height = 13
    Caption = 'Label8'
  end
  object Label9: TLabel
    Left = 152
    Top = 352
    Width = 32
    Height = 13
    Caption = 'Label9'
  end
  object Label10: TLabel
    Left = 152
    Top = 328
    Width = 38
    Height = 13
    Caption = 'Label10'
  end
  object Label11: TLabel
    Left = 152
    Top = 304
    Width = 38
    Height = 13
    Caption = 'Label11'
  end
  object Label12: TLabel
    Left = 152
    Top = 285
    Width = 38
    Height = 13
    Caption = 'Label12'
  end
  object Label13: TLabel
    Left = 73
    Top = 285
    Width = 60
    Height = 13
    Caption = 'Todo En Dia'
  end
  object Label14: TLabel
    Left = 87
    Top = 376
    Width = 48
    Height = 13
    Caption = 'Total Dias'
  end
  object Label15: TLabel
    Left = 62
    Top = 328
    Width = 73
    Height = 13
    Caption = 'Total Quincena'
  end
  object Label16: TLabel
    Left = 69
    Top = 352
    Width = 66
    Height = 13
    Caption = 'Total Semana'
  end
  object Label17: TLabel
    Left = 77
    Top = 304
    Width = 58
    Height = 13
    Caption = 'Total Meses'
  end
  object Label20: TLabel
    Left = 53
    Top = 264
    Width = 81
    Height = 13
    Caption = 'Todo En Minutos'
  end
  object Label21: TLabel
    Left = 152
    Top = 264
    Width = 38
    Height = 13
    Caption = 'Label12'
  end
  object Label22: TLabel
    Left = 42
    Top = 224
    Width = 92
    Height = 13
    Caption = 'Todo En Segundos'
  end
  object Label23: TLabel
    Left = 152
    Top = 224
    Width = 38
    Height = 13
    Caption = 'Label12'
  end
  object Label24: TLabel
    Left = 66
    Top = 243
    Width = 67
    Height = 13
    Caption = 'Todo En Hora'
  end
  object Label25: TLabel
    Left = 152
    Top = 243
    Width = 38
    Height = 13
    Caption = 'Label12'
  end
  object Label18: TLabel
    Left = 152
    Top = 405
    Width = 32
    Height = 13
    Caption = 'Label8'
  end
  object Label19: TLabel
    Left = 87
    Top = 405
    Width = 47
    Height = 13
    Caption = 'Resto Dia'
  end
  object Label26: TLabel
    Left = 88
    Top = 429
    Width = 38
    Height = 13
    Caption = 'Label26'
  end
  object Label27: TLabel
    Left = 136
    Top = 80
    Width = 38
    Height = 13
    Caption = 'Label27'
  end
  object Label28: TLabel
    Left = 136
    Top = 96
    Width = 38
    Height = 13
    Caption = 'Label28'
  end
  object Label29: TLabel
    Left = 232
    Top = 248
    Width = 81
    Height = 13
    Caption = 'Tope Renta hora'
  end
  object Label30: TLabel
    Left = 512
    Top = 416
    Width = 38
    Height = 13
    Caption = 'Label30'
  end
  object Button1: TButton
    Left = 40
    Top = 80
    Width = 81
    Height = 25
    Caption = 'Procesar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object dtpkFechaIni: TDateTimePicker
    Left = 40
    Top = 48
    Width = 81
    Height = 21
    Date = 38816.436027835650000000
    Time = 38816.436027835650000000
    TabOrder = 1
  end
  object dtpkHoraIni: TDateTimePicker
    Left = 128
    Top = 48
    Width = 89
    Height = 21
    Date = 38816.640972222220000000
    Time = 38816.640972222220000000
    Kind = dtkTime
    TabOrder = 2
  end
  object dtpkHoraFin: TDateTimePicker
    Left = 328
    Top = 48
    Width = 86
    Height = 21
    Date = 38817.408333333330000000
    Time = 38817.408333333330000000
    Kind = dtkTime
    TabOrder = 3
  end
  object dtpkFechaFin: TDateTimePicker
    Left = 240
    Top = 48
    Width = 84
    Height = 21
    Date = 38817.436027835650000000
    Time = 38817.436027835650000000
    TabOrder = 4
  end
  object Memo1: TMemo
    Left = 480
    Top = 48
    Width = 185
    Height = 241
    Lines.Strings = (
      'Memo1')
    TabOrder = 5
  end
  object Button2: TButton
    Left = 432
    Top = 48
    Width = 41
    Height = 25
    Caption = 'Seg'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 432
    Top = 80
    Width = 41
    Height = 25
    Caption = 'Min'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 432
    Top = 112
    Width = 41
    Height = 25
    Caption = 'Hora'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 432
    Top = 144
    Width = 41
    Height = 25
    Caption = 'Dias'
    TabOrder = 9
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 432
    Top = 176
    Width = 41
    Height = 25
    Caption = 'Sem'
    TabOrder = 10
    OnClick = Button6Click
  end
  object RadioGroup1: TRadioGroup
    Left = 328
    Top = 80
    Width = 89
    Height = 122
    Caption = 'Tipo Tarifa'
    Items.Strings = (
      '&Hora'
      '&Diaria'
      '&Semana'
      '&Quincenal'
      '&Mensual')
    TabOrder = 11
    OnClick = RadioGroup1Click
  end
  object DBGrid1: TDBGrid
    Left = 232
    Top = 304
    Width = 433
    Height = 89
    DataSource = dsrxTiempo
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CantHoraExtra'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hora'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dia'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'semana'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quincena'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mensual'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TopeRentaxHora'
        Visible = True
      end>
  end
  object edtTopeRentHora: TEditN
    Left = 232
    Top = 272
    Width = 89
    Height = 21
    Color = clSilver
    TabOrder = 13
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
    ValueDate = 38825.000000000000000000
    ValueTime = 0.850705254629629600
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object rxTiempo: TRxMemoryData
    FieldDefs = <
      item
        Name = 'hora'
        DataType = ftInteger
      end
      item
        Name = 'dia'
        DataType = ftInteger
      end
      item
        Name = 'semana'
        DataType = ftInteger
      end
      item
        Name = 'quincena'
        DataType = ftInteger
      end
      item
        Name = 'mensual'
        DataType = ftInteger
      end
      item
        Name = 'TopeRentaxHora'
        DataType = ftInteger
      end
      item
        Name = 'CantHoraExtra'
        DataType = ftFloat
      end>
    Left = 280
    Top = 176
    object rxTiempohora: TIntegerField
      FieldName = 'hora'
    end
    object rxTiempodia: TIntegerField
      FieldName = 'dia'
    end
    object rxTiemposemana: TIntegerField
      FieldName = 'semana'
    end
    object rxTiempoquincena: TIntegerField
      FieldName = 'quincena'
    end
    object rxTiempomensual: TIntegerField
      FieldName = 'mensual'
    end
    object rxTiempoTopeRentaxHora: TIntegerField
      FieldName = 'TopeRentaxHora'
    end
    object rxTiempoCantHoraExtra: TFloatField
      FieldName = 'CantHoraExtra'
    end
  end
  object dsrxTiempo: TDataSource
    DataSet = rxTiempo
    Left = 352
    Top = 232
  end
end
