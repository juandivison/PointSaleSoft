object frmRelacionFact: TfrmRelacionFact
  Left = 200
  Top = 138
  Width = 642
  Height = 357
  Caption = 'Relacion Facturas Cxc'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 60
    Height = 13
    Caption = 'Fecha Inicial'
  end
  object Label2: TLabel
    Left = 104
    Top = 16
    Width = 55
    Height = 13
    Caption = 'Fecha Final'
  end
  object Label3: TLabel
    Left = 192
    Top = 16
    Width = 35
    Height = 13
    Caption = 'CodCte'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 16
    Top = 32
    Width = 81
    Height = 21
    Date = 40117.833615821760000000
    Time = 40117.833615821760000000
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 104
    Top = 32
    Width = 81
    Height = 21
    Date = 40117.833714571760000000
    Time = 40117.833714571760000000
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 264
    Top = 29
    Width = 75
    Height = 25
    Caption = '&Buscar Cte'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 346
    Top = 29
    Width = 75
    Height = 25
    Caption = 'Reporte'
    TabOrder = 3
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
      00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
      00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
      F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
      FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
      0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
      0033333337FFFFFF773333333000000003333333377777777333}
    NumGlyphs = 2
  end
  object edtCodCte: TEdit
    Left = 192
    Top = 32
    Width = 65
    Height = 21
    Hint = 'Dejelo en blanco para busqueda mas completa'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object RxDBGrid1: TRxDBGrid
    Left = 16
    Top = 64
    Width = 601
    Height = 249
    DataSource = DataSource1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_CTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_CTE'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTMESES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_PENDIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RNC_NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRECCION_CONT'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONO'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIUDAD'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIASENATRASO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = dmReportes.qryRelacionFacturas
    Left = 240
    Top = 104
  end
end
