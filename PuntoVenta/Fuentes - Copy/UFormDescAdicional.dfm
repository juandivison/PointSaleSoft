object frmDescripcionAdicional: TfrmDescripcionAdicional
  Left = 387
  Top = 158
  Width = 505
  Height = 308
  Caption = 'Descripcion Adicional'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBMemo1: TDBMemo
    Left = 8
    Top = 8
    Width = 457
    Height = 209
    DataField = 'DESCRIPCIONADICIONAL'
    DataSource = dmInventario.dsInventarioProd
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 176
    Top = 232
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 232
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end
