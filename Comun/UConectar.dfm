object frmInciaConeccion: TfrmInciaConeccion
  Left = 320
  Top = 229
  BorderStyle = bsDialog
  Caption = 'Ruta Base de Datos para coneccion'
  ClientHeight = 193
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 56
    Height = 13
    Caption = 'SERVIDOR'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 30
    Height = 13
    Caption = 'RUTA'
  end
  object RxLabel5: TRxLabel
    Left = 274
    Top = 4
    Width = 50
    Height = 13
    Caption = 'IDESI S.A'
    Color = 33023
    ParentColor = False
    Transparent = True
  end
  object RxLabel1: TRxLabel
    Left = 324
    Top = 10
    Width = 9
    Height = 6
    Caption = 'TM'
    Color = 33023
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -5
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 136
    Top = 16
    Width = 64
    Height = 13
    Caption = 'NOMBRE PC'
  end
  object Label4: TLabel
    Left = 136
    Top = 32
    Width = 32
    Height = 13
    Caption = 'Label4'
  end
  object Label5: TLabel
    Left = 8
    Top = 104
    Width = 65
    Height = 13
    Caption = 'Ruta Actual ::'
  end
  object LabelRuta: TLabel
    Left = 81
    Top = 104
    Width = 49
    Height = 13
    Caption = 'LabelRuta'
  end
  object Label6: TLabel
    Left = 8
    Top = 128
    Width = 41
    Height = 13
    Caption = 'Num. Pc'
  end
  object edtServidor: TEdit
    Left = 8
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'TEACHER'
  end
  object edtRuta: TEdit
    Left = 8
    Top = 72
    Width = 385
    Height = 21
    TabOrder = 1
    Text = 'C:\Proyectos\RentCar\Cnt\Datos\dbchavonrc.gdb'
  end
  object BitBtn1: TBitBtn
    Left = 176
    Top = 144
    Width = 97
    Height = 33
    Caption = 'Conectar'
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000333300
      0000377777F3337777770FFFF099990FFFF07FFFF7FFFF7FFFF7000000999900
      00007777777777777777307703399330770337FF7F37F337FF7F300003399330
      000337777337F337777333333339933333333FFFFFF7F33FFFFF000000399300
      0000777777F7F37777770FFFF099990FFFF07FFFF7F7FF7FFFF7000000999900
      00007777777777777777307703399330770337FF7F37F337FF7F300003399330
      0003377773F7FFF77773333330000003333333333777777F3333333330FFFF03
      3333333337FFFF7F333333333000000333333333377777733333333333077033
      33333333337FF7F3333333333300003333333333337777333333}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 285
    Top = 144
    Width = 92
    Height = 33
    Caption = '&Salir'
    TabOrder = 3
    Kind = bkClose
  end
  object BitBtn3: TBitBtn
    Left = 64
    Top = 144
    Width = 99
    Height = 33
    Caption = 'Cambiar Ruta'
    TabOrder = 4
    OnClick = BitBtn3Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
      333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
      300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
      333337F373F773333333303330033333333337F3377333333333303333333333
      333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
      333337777F337F33333330330BB00333333337F373F773333333303330033333
      333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
      333377777F77377733330BBB0333333333337F337F33333333330BB003333333
      333373F773333333333330033333333333333773333333333333}
    NumGlyphs = 2
  end
  object edtNumPC: TEdit
    Left = 8
    Top = 144
    Width = 49
    Height = 21
    TabOrder = 5
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'Gdb'
    Filter = '*.gdb'
    Options = [ofReadOnly, ofHideReadOnly, ofEnableSizing]
    Title = 'Seleccionar Base de Datos'
    Left = 288
    Top = 24
  end
end
