object frmPosExtraDet: TfrmPosExtraDet
  Left = 360
  Top = 224
  Width = 1082
  Height = 518
  Caption = 'Detalles Venta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 16
    Top = 48
    Width = 617
    Height = 425
    DataSource = DataSource1
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
        FieldName = 'COD_USUARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_MONEDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_TIPO_VENTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_CODIGO_PROD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_PRECIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_CANT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_TASA_ITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_PORCDESCITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_PORCDESADICIONAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_RECARGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_PROPINA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_MONTOINTERES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_MONTONCRAPLICADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_DEVOLUCION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_TOTALNETO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_ITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_TIPO_UNIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODTEXTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_COTIZA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_COTIZA'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Refrescar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Todo'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 192
    Top = 16
    Width = 97
    Height = 25
    Caption = 'Borrar Record'
    TabOrder = 3
    OnClick = Button3Click
  end
  object BitBtn1: TBitBtn
    Left = 416
    Top = 16
    Width = 105
    Height = 25
    Caption = 'Cargar a Ventas'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object CheckBox1: TCheckBox
    Left = 538
    Top = 24
    Width = 97
    Height = 17
    Caption = 'Muestra Todo'
    TabOrder = 5
    OnClick = CheckBox1Click
  end
  object RxDBGrid2: TRxDBGrid
    Left = 16
    Top = 52
    Width = 617
    Height = 205
    DataSource = DataSource2
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnCellClick = RxDBGrid2CellClick
    RowColor2 = 16776176
  end
  object BitBtn2: TBitBtn
    Left = 296
    Top = 16
    Width = 97
    Height = 25
    Caption = 'Borrar Todo'
    TabOrder = 7
    OnClick = BitBtn2Click
  end
  object RxDBGrid3: TRxDBGrid
    Left = 640
    Top = 40
    Width = 425
    Height = 217
    DataSource = dsqryPosExtraSum
    FixedColor = 4227200
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_MONTOBRUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_TASA_ITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_PORCDESCITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_PORCDESADICIONAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_RECARGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_PROPINA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_MONTOINTERES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_MONTONCRAPLICADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_DEVOLUCION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_TOTALNETO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_ITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_TRANSPITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_MONTODESCITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_PORCPROPLEGAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_MONTODESCGLOBAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_ESDESITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_MONTODESCITEMS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_FMONTODESCNIVELITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_SUBTOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_MONTODESCADICIONAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_PROPINALEGAL'
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
  object Button4: TButton
    Left = 992
    Top = 384
    Width = 75
    Height = 25
    Caption = 'ReFresh'
    TabOrder = 9
    OnClick = Button4Click
  end
  object RxDBGrid4: TRxDBGrid
    Left = 640
    Top = 280
    Width = 425
    Height = 89
    DataSource = dsqryGetSumVtaExtra
    FixedColor = 4227200
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_MONTOBRUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_TASA_ITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_PROPINA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_MONTOINTERES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_MONTONCRAPLICADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_ITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_MONTODESCITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_MONTODESCGLOBAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_MONTODESCITEMS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_FMONTODESCNIVELITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_SUBTOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TC_MONTODESCADICIONAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DC_PROPINALEGAL'
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
      end
      item
        Expanded = False
        FieldName = 'T_RECARGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_ITBIS'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = dmCalculos.qryPosExtraDet
    Left = 440
    Top = 224
  end
  object DataSource2: TDataSource
    AutoEdit = False
    DataSet = dmCalculos.qryDatosCotiPosExtra
    Left = 568
    Top = 152
  end
  object dsqryPosExtraSum: TDataSource
    AutoEdit = False
    DataSet = dmCalculos.qryPosExtraSum
    Left = 792
    Top = 168
  end
  object dsqryGetSumVtaExtra: TDataSource
    AutoEdit = False
    DataSet = dmCalculos.qryGetSumVtaExtra
    Left = 792
    Top = 256
  end
end
