object frmSepararNombre: TfrmSepararNombre
  Left = 192
  Top = 117
  Width = 829
  Height = 362
  Caption = 'Separar Nombre'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Procesar'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object edtValor: TEdit
    Left = 88
    Top = 24
    Width = 705
    Height = 21
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 8
    Top = 48
    Width = 785
    Height = 241
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
end
