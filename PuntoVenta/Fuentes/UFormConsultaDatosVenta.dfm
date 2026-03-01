object frmConsultaDatosVenta: TfrmConsultaDatosVenta
  Left = 304
  Top = 220
  Anchors = [akLeft]
  BorderStyle = bsSingle
  Caption = 'Datos Ventas'
  ClientHeight = 399
  ClientWidth = 1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    1074
    399)
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 24
    Top = 26
    Width = 1033
    Height = 305
    Anchors = [akLeft, akBottom]
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
        FieldName = 'NUMERO_TRN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NIF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_NCF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_CTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE_NCF_ASIGNADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_BRUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACION'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NIF_IMPRESO'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 456
    Top = 356
    Width = 75
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = '&Aceptar'
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 560
    Top = 356
    Width = 75
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = '&Cerrar'
    TabOrder = 2
    Kind = bkClose
  end
  object DataSource1: TDataSource
    DataSet = dmFactura.qryDatosParaCtrlNIF
    Left = 488
    Top = 152
  end
end
