object frmExportarExcel: TfrmExportarExcel
  Left = 305
  Top = 179
  Width = 921
  Height = 375
  Caption = 'Exportar a Excel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 312
    Top = 272
    Width = 105
    Height = 41
    TabOrder = 0
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 448
    Top = 272
    Width = 105
    Height = 41
    TabOrder = 1
    Kind = bkClose
  end
  object Memo1: TMemo
    Left = 40
    Top = 24
    Width = 753
    Height = 217
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Excel: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 448
    Top = 176
  end
end
