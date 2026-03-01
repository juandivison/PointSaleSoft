object frmProdTranscxc: TfrmProdTranscxc
  Left = 437
  Top = 146
  Width = 435
  Height = 288
  Caption = 'Indicar productos para devolucion'
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
    Left = 16
    Top = 24
    Width = 393
    Height = 161
    DataSource = frmTransCxcNCdbDev.dstblVentas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    MultiSelect = True
    Columns = <
      item
        Expanded = False
        FieldName = 'SERIE'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_PROD'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescripcionProducto'
        Width = 179
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 128
    Top = 200
    Width = 81
    Height = 33
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 232
    Top = 200
    Width = 81
    Height = 33
    TabOrder = 2
    Kind = bkCancel
  end
end
