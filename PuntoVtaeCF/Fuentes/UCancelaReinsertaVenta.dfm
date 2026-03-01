object frmCancelaVta: TfrmCancelaVta
  Left = 164
  Top = 106
  Width = 1072
  Height = 486
  Caption = 'Cancelar Venta'
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
  object Label1: TLabel
    Left = 432
    Top = 120
    Width = 128
    Height = 13
    Caption = 'D   E   T   A   L   L   E'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 16
    Top = 8
    Width = 1041
    Height = 97
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = RxDBGrid1GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_NCF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_CTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_FACTURAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_PAGADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_TOTAL_ITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 392
    Top = 400
    Width = 107
    Height = 33
    Caption = 'Cancelar &Venta'
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 520
    Top = 400
    Width = 105
    Height = 33
    TabOrder = 2
    Kind = bkClose
  end
  object RxDBGrid2: TRxDBGrid
    Left = 16
    Top = 152
    Width = 1041
    Height = 161
    DataSource = DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = RxDBGrid2GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'SERIE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_PROD'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 183
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
        FieldName = 'PORC_DESC_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITBI_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_SERVICIO_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_FACTURA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE_PROD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS_CNT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_UNIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITBIS_EXENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_VENTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCIONPRODUCTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_EMPLEADO_CONDUCTOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLACA_VEHICULO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_TASA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAPACIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT_VIAJES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT_METROS_CUBICO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FICHA_VEH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDZONA_ORIGEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDZONA_DETALLE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_COMPRA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT_CONDUCE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_DESC_ITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_DESC_ITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITBIS_FISCAL_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDTASAITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOIBISRECARGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_ITBIS_CLD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_MONTOITBISRECARGO_GLB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_MONTOITBISRECARGO_ITM'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = dmCalculos.qryVentas
    Left = 328
    Top = 176
  end
  object DataSource2: TDataSource
    DataSet = dmCalculos.qryVentasDEt
    Left = 448
    Top = 200
  end
end
