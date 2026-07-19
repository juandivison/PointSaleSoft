object frmVerDet: TfrmVerDet
  Left = 254
  Top = 141
  Width = 1149
  Height = 675
  Caption = 'Detalle de Ventas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    1141
    644)
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 1
    Width = 1118
    Height = 592
    Anchors = [akLeft, akTop, akRight]
    DataSource = frmProcVentaRapida.DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'Serie'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodArticulo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Moneda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descripcion'
        ReadOnly = False
        Width = 353
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoNeto'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cant'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Precio'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoBruto'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDTasaITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PorcDescItem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoDescItem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Itbi'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fecha'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TipoUnidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MonedaBase'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'porc_desc'
        Title.Caption = '%DescTranspItbis'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoDescuento'
        Title.Caption = 'TranspItbis'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoItbisRecargo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoDesGlobal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'glbcodVendedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LevelPrecio'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 520
    Top = 600
    Width = 75
    Height = 25
    Caption = '&Cerrar'
    TabOrder = 1
    Kind = bkClose
  end
end
