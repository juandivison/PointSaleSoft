object Form1: TForm1
  Left = 82
  Top = 67
  Width = 861
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 704
    Top = 64
    Width = 75
    Height = 13
    Caption = 'MontoDepositar'
  end
  object Label2: TLabel
    Left = 704
    Top = 128
    Width = 52
    Height = 13
    Caption = 'Consumido'
  end
  object Label3: TLabel
    Left = 704
    Top = 192
    Width = 65
    Height = 13
    Caption = 'Dep. Efectivo'
  end
  object Label4: TLabel
    Left = 704
    Top = 248
    Width = 59
    Height = 13
    Caption = 'Dep. Tarjeta'
  end
  object Label5: TLabel
    Left = 704
    Top = 296
    Width = 65
    Height = 13
    Caption = 'Dev. Efectivo'
  end
  object Label6: TLabel
    Left = 704
    Top = 336
    Width = 59
    Height = 13
    Caption = 'Dev. Tarjeta'
  end
  object Label7: TLabel
    Left = 704
    Top = 384
    Width = 48
    Height = 13
    Caption = 'Diferencia'
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 32
    Width = 657
    Height = 321
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MontoADepositar'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ConsumoReal'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DepositoEfectivo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DepositoTarjeta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DevolucionEfectivo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DevolucionTarjeta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Diferencia'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 120
    Top = 368
    Width = 129
    Height = 49
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 560
    Top = 368
    Width = 129
    Height = 49
    Caption = 'Calcular'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 32
    Top = 368
    Width = 75
    Height = 49
    Caption = 'Edit'
    TabOrder = 3
    OnClick = Button3Click
  end
  object edtDeTj: TEdit
    Left = 704
    Top = 264
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object edtDevEfe: TEdit
    Left = 704
    Top = 312
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object edtDevTj: TEdit
    Left = 704
    Top = 352
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object edtMD: TEdit
    Left = 704
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object edtCons: TEdit
    Left = 704
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object edtDEf: TEdit
    Left = 704
    Top = 208
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object Edit7: TEdit
    Left = 704
    Top = 400
    Width = 121
    Height = 21
    TabOrder = 10
  end
  object Cal: TRxMemoryData
    FieldDefs = <
      item
        Name = 'MontoADepositar'
        DataType = ftFloat
      end
      item
        Name = 'ConsumoReal'
        DataType = ftFloat
      end
      item
        Name = 'DepositoEfectivo'
        DataType = ftFloat
      end
      item
        Name = 'DepositoTarjeta'
        DataType = ftFloat
      end>
    OnCalcFields = CalCalcFields
    Left = 264
    Top = 92
    object CalMontoADepositar: TFloatField
      FieldName = 'MontoADepositar'
    end
    object CalConsumoReal: TFloatField
      FieldName = 'ConsumoReal'
    end
    object CalDepositoEfectivo: TFloatField
      FieldName = 'DepositoEfectivo'
    end
    object CalDepositoTarjeta: TFloatField
      FieldName = 'DepositoTarjeta'
    end
    object CalDevolucionEfectivo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DevolucionEfectivo'
      Calculated = True
    end
    object CalDevolucionTarjeta: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DevolucionTarjeta'
      Calculated = True
    end
    object CalDiferencia: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Diferencia'
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = Cal
    Left = 336
    Top = 72
  end
end
