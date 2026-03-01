object frmConsultaNCF: TfrmConsultaNCF
  Left = 309
  Top = 131
  Width = 928
  Height = 480
  Caption = 'Consulta NCF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 16
    Top = 56
    Width = 833
    Height = 345
    DataSource = dsqryNCFNull
    FixedColor = 8454143
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NCF_SERIE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCF_TIPO_NCF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCF_NUMERO_NCF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCF_FECHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCF_MONTO'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCF_STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCF_CODIGOUSUARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCF_FECHA_INSERT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCF_CODIGO_USUARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCF_NOMBREUSUARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_CTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_VENDEDOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMA_PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACION'
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
      end
      item
        Expanded = False
        FieldName = 'NUMERO_FACTURA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_DOC_PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE_NCF_ASIGNADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_PAGADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_CAMBIO'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 41
    Align = alTop
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 144
      Top = 8
      Width = 23
      Height = 22
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 176
      Top = 8
      Width = 23
      Height = 22
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object lblRangoFecha: TLabel
      Left = 424
      Top = 16
      Width = 72
      Height = 13
      Caption = 'lblRangoFecha'
    end
    object DateEdit1: TDateEdit
      Left = 8
      Top = 8
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 208
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Datos'
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333FF3FF3333333333CC30003333333333773777333333333C33
        3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
        33003377333337F33377333333333C333300333F333337F33377339333333C33
        3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
        330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
        330077F377F337F33377993399333C33330077FF773337F33377399993333C33
        33333777733337F333FF333333333C33300033333333373FF7773333333333CC
        3000333333333377377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 296
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Mes Completo'
      TabOrder = 2
      OnClick = BitBtn2Click
    end
  end
  object dsqryNCFNull: TDataSource
    DataSet = dmReportes.qryNCFNull
    Left = 448
    Top = 224
  end
end
