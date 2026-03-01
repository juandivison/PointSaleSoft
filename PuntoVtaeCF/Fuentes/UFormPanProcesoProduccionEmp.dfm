object frmProcProdEmpleados: TfrmProcProdEmpleados
  Left = 210
  Top = 117
  Width = 994
  Height = 587
  Caption = 'Proceso Produccion Empleados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    986
    556)
  PixelsPerInch = 96
  TextHeight = 13
  object RxLabel1: TRxLabel
    Left = 7
    Top = 9
    Width = 62
    Height = 13
    Caption = 'Fecha Inicial'
  end
  object RxLabel2: TRxLabel
    Left = 127
    Top = 9
    Width = 57
    Height = 13
    Caption = 'Fecha Final'
  end
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 48
    Width = 953
    Height = 489
    Anchors = [akLeft, akTop, akRight]
    DataSource = dsrxEmpleados
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = RxDBGrid1DrawColumnCell
    OnExit = RxDBGrid1Exit
    OnKeyPress = RxDBGrid1KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 321
    Top = 19
    Width = 75
    Height = 25
    Caption = '&Procesar'
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
      FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
      990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
      990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
      FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
      00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
      00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
      00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
      03FF33337FFF77777333333300000333333F3333777773333333}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 409
    Top = 19
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkClose
  end
  object DateEdit1: TDateEdit
    Left = 8
    Top = 24
    Width = 105
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
  end
  object DateEdit2: TDateEdit
    Left = 128
    Top = 24
    Width = 97
    Height = 21
    NumGlyphs = 2
    TabOrder = 4
  end
  object BitBtn3: TBitBtn
    Left = 232
    Top = 20
    Width = 75
    Height = 25
    Caption = 'Gen Campos'
    TabOrder = 5
    OnClick = BitBtn3Click
  end
  object rxEmpleados: TRxMemoryData
    FieldDefs = <
      item
        Name = 'CodEmp'
        DataType = ftInteger
      end
      item
        Name = 'NombreEmpleado'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Precio'
        DataType = ftCurrency
      end>
    Left = 88
    Top = 128
  end
  object dsrxEmpleados: TDataSource
    DataSet = rxEmpleados
    Left = 88
    Top = 80
  end
  object PopupMenu1: TPopupMenu
    Left = 376
    Top = 192
    object EliminaRecordActual1: TMenuItem
      Caption = 'Elimina Record Actual'
      OnClick = EliminaRecordActual1Click
    end
  end
end
