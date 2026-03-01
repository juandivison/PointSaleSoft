object frmMostrarProductos: TfrmMostrarProductos
  Left = 450
  Top = 11
  BorderStyle = bsNone
  Caption = 'frmMostrarProductos'
  ClientHeight = 194
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 520
    Height = 194
    Cursor = crHandPoint
    Align = alCustom
    Color = 16773360
    DataSource = DataSource1
    Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_TEXTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = frmProcVentaRapida.qryProductos
    Left = 128
    Top = 80
  end
end
