object frmExpToHTML: TfrmExpToHTML
  Left = 273
  Top = 106
  Width = 1043
  Height = 704
  Caption = 'Exportar to HTML'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 32
    Top = 40
    Width = 617
    Height = 313
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Button1: TButton
    Left = 24
    Top = 632
    Width = 75
    Height = 25
    Caption = 'Procesar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object RxDBGrid1: TRxDBGrid
    Left = 656
    Top = 40
    Width = 320
    Height = 120
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
  end
  object Memo2: TMemo
    Left = 32
    Top = 376
    Width = 617
    Height = 233
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 3
  end
end
