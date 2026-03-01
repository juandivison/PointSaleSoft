object frmSelSerie: TfrmSelSerie
  Left = 422
  Top = 131
  Width = 472
  Height = 344
  Caption = 'Seleccionar Serie'
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
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 8
    Width = 433
    Height = 225
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE'
        Width = 296
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 136
    Top = 256
    Width = 89
    Height = 33
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 256
    Top = 256
    Width = 89
    Height = 33
    TabOrder = 2
    Kind = bkCancel
  end
  object DataSource1: TDataSource
    DataSet = frmProcVentaRapida.qryProdSerie
    Left = 208
    Top = 152
  end
end
