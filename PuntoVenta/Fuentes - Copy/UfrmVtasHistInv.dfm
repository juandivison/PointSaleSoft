object frmVtasHistInv: TfrmVtasHistInv
  Left = 409
  Top = 198
  BorderStyle = bsSingle
  Caption = 'Ventas Det'
  ClientHeight = 385
  ClientWidth = 792
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
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 8
    Width = 769
    Height = 369
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
  end
  object DataSource1: TDataSource
    DataSet = frmHistVentasInv.qryVtas
    Left = 384
    Top = 192
  end
end
