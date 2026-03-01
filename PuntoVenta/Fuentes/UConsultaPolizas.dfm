object frmConsultaPolizas: TfrmConsultaPolizas
  Left = 125
  Top = 114
  Width = 1102
  Height = 581
  Caption = 'P'#243'lizas'
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
    Top = 16
    Width = 1073
    Height = 473
    DataSource = dsqryRepCertificadoSam
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
        FieldName = 'CODIGO_CTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_FACTURAR'
        Title.Caption = 'NOMBRE CLIENTE'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAINICIAL'
        Title.Caption = 'Fecha Inicia'
        Width = 83
        Visible = True
      end
      item
        Color = 9240575
        Expanded = False
        FieldName = 'FECHAFIN'
        Title.Caption = 'Fecha Vence'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_CERTIFICADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMPOLIZA_CERT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHASSIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARCA'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOVIL1'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOVIL2'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AGENCIA'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEALER'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COLOR'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODELO'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLACA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANO_VEH'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_DEALER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RNC_NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTACTO'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRECCION_CONT'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEF_CONTACTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAX_CONTACTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMA_PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_AGENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS_CLIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSERTADO_POR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_INSERTADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_MOD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODI_POR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIMITE_CREDITO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WEBSITE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIA_KEY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_CLIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOTO'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIUDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEDULA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RNC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEF_REFERENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTRO_TELEFONO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT_DIAS_CREDITO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_NCF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LUGAR_DE_TRABAJO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APODO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_USUARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMENTARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONDICION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RUTA_FOTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_CF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_TEXTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USARLEVELPRECIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_VENDEDOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_NACIMIENTO'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 488
    Top = 504
    Width = 113
    Height = 33
    Caption = '&Cerrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Kind = bkClose
  end
  object dsqryRepCertificadoSam: TDataSource
    DataSet = dmClientes.qryRepCertificadoSam
    Left = 368
    Top = 128
  end
end
