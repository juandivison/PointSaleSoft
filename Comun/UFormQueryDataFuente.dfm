object frmqryDatosFuente: TfrmqryDatosFuente
  Left = 306
  Top = 167
  Width = 717
  Height = 373
  Caption = 'Configurar Query Datos Fuentes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 240
    Height = 13
    Caption = 'Entre sentencia sql para los datos a ser exportados'
  end
  object Label2: TLabel
    Left = 272
    Top = 252
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Memo1: TMemo
    Left = 16
    Top = 32
    Width = 673
    Height = 209
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 168
    Top = 288
    Width = 75
    Height = 25
    Caption = '&Cargar'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 260
    Top = 288
    Width = 75
    Height = 25
    Caption = '&Guardar'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 461
    Top = 288
    Width = 75
    Height = 25
    Caption = '&Salir'
    TabOrder = 3
    Kind = bkClose
  end
  object BitBtn4: TBitBtn
    Left = 352
    Top = 288
    Width = 97
    Height = 25
    Caption = 'G&uardar como...'
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 249
    Width = 249
    Height = 17
    Caption = 'Usar este archivo para cargar datos Fuente'
    TabOrder = 5
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Left = 376
    Top = 72
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'txt'
    Left = 224
    Top = 80
  end
end
