object frmMostrarTodo: TfrmMostrarTodo
  Left = 291
  Top = 80
  Width = 696
  Height = 480
  Caption = 'Inventario'
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
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 16
    Width = 673
    Height = 377
    DataSource = frmConsultaPrecio.dsqryProductos
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = RxDBGrid1CellClick
    OnColEnter = RxDBGrid1ColEnter
    OnDblClick = RxDBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_TEXTO'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGA_ITBI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_MINIMO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVENTARIAR'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 312
    Top = 408
    Width = 75
    Height = 25
    Caption = '&Cerrar'
    TabOrder = 1
    Kind = bkClose
  end
end
