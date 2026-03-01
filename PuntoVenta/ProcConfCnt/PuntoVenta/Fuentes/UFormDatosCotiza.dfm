object frmCotizaciones: TfrmCotizaciones
  Left = 197
  Top = 122
  Width = 785
  Height = 480
  Caption = 'Cotizaciones'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 8
    Top = 128
    Width = 746
    Height = 4
    Brush.Color = 10547677
    Pen.Color = 10547677
  end
  object Label1: TLabel
    Left = 256
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 56
    Width = 745
    Height = 65
    DataSource = dsibqryCotizacionMaster
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_VENCE'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_CTE'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_CTE'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_VENDEDOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACION'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEF_CONTACTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRECCION_CONT'
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WEBSITE'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIUDAD'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAIS'
        Visible = True
      end>
  end
  object RxDBGrid2: TRxDBGrid
    Left = 8
    Top = 135
    Width = 745
    Height = 202
    DataSource = dsibqryCotizacionDet
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SERIE'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_PROD'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Width = 53
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
        Width = 46
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
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_IN'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IN_POR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_MOD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOD_POR'
        Visible = True
      end>
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 241
    Height = 41
    Caption = '&Busca Por'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      '#Cotizacion'
      'CodigoCte'
      'Nombre')
    TabOrder = 3
    OnClick = RadioGroup1Click
  end
  object Edit1: TEdit
    Left = 254
    Top = 24
    Width = 179
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 440
    Top = 24
    Width = 31
    Height = 25
    TabOrder = 4
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
    Left = 360
    Top = 384
    Width = 89
    Height = 33
    TabOrder = 5
    Kind = bkOK
  end
  object BitBtn3: TBitBtn
    Left = 472
    Top = 384
    Width = 89
    Height = 33
    TabOrder = 6
    Kind = bkCancel
  end
  object BitBtn4: TBitBtn
    Left = 240
    Top = 384
    Width = 99
    Height = 33
    Caption = '&Refrescar'
    TabOrder = 7
    OnClick = BitBtn4Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
      33333333333F8888883F33330000324334222222443333388F3833333388F333
      000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
      F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
      223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
      3338888300003AAAAAAA33333333333888888833333333330000333333333333
      333333333333333333FFFFFF000033333333333344444433FFFF333333888888
      00003A444333333A22222438888F333338F3333800003A2243333333A2222438
      F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
      22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
      33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object RxSwitch1: TRxSwitch
    Left = 656
    Top = 16
    Width = 97
    Height = 41
    Caption = 'Ampliar'
    TabOrder = 8
    TextPosition = tpLeft
    OnClick = RxSwitch1Click
  end
  object ibqryCotizacionMaster: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = ibqryCotizacionMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT VIEW_COTIZACION_MASTER.NUMERO,'
      '       VIEW_COTIZACION_MASTER.FECHA,'
      '       VIEW_COTIZACION_MASTER.FECHA_VENCE,'
      '       VIEW_COTIZACION_MASTER.CODIGO_CTE,'
      '       VIEW_COTIZACION_MASTER.CODIGO_VENDEDOR,'
      '       VIEW_COTIZACION_MASTER.OBSERVACION,'
      '       VIEW_COTIZACION_MASTER.MONEDA,'
      '       VIEW_COTIZACION_MASTER.VALOR_TOTAL,'
      '       VIEW_COTIZACION_MASTER.STATUS,'
      '       CLIENTES.NOMBRE_CTE,'
      '       CLIENTES.TELEF_CONTACTO,'
      '       CLIENTES.DIRECCION_CONT,'
      '       CLIENTES.EMAIL,'
      '       CLIENTES.WEBSITE,'
      '       CLIENTES.CIUDAD,'
      '       CLIENTES.PAIS'
      'FROM CLIENTES'
      
        '  right outer JOIN VIEW_COTIZACION_MASTER ON (CLIENTES.CODIGO_CT' +
        'E = VIEW_COTIZACION_MASTER.CODIGO_CTE)'
      'WHERE   VIEW_COTIZACION_MASTER.FECHA'
      'BETWEEN :FECHAINI AND :FECHAFIN'
      'ORDER BY VIEW_COTIZACION_MASTER.NUMERO')
    Left = 168
    Top = 176
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAFIN'
        ParamType = ptInput
      end>
    object ibqryCotizacionMasterNUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
      Origin = 'VIEW_COTIZACION_MASTER.NUMERO'
    end
    object ibqryCotizacionMasterFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'VIEW_COTIZACION_MASTER.FECHA'
    end
    object ibqryCotizacionMasterFECHA_VENCE: TDateTimeField
      DisplayLabel = 'Fecha Vence'
      FieldName = 'FECHA_VENCE'
      Origin = 'VIEW_COTIZACION_MASTER.FECHA_VENCE'
    end
    object ibqryCotizacionMasterCODIGO_CTE: TIntegerField
      DisplayLabel = 'CodCte'
      FieldName = 'CODIGO_CTE'
      Origin = 'VIEW_COTIZACION_MASTER.CODIGO_CTE'
    end
    object ibqryCotizacionMasterCODIGO_VENDEDOR: TIntegerField
      DisplayLabel = 'CodVendedor'
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VIEW_COTIZACION_MASTER.CODIGO_VENDEDOR'
    end
    object ibqryCotizacionMasterOBSERVACION: TIBStringField
      DisplayLabel = 'Observacion'
      FieldName = 'OBSERVACION'
      Origin = 'VIEW_COTIZACION_MASTER.OBSERVACION'
      Size = 60
    end
    object ibqryCotizacionMasterMONEDA: TIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Origin = 'VIEW_COTIZACION_MASTER.MONEDA'
      FixedChar = True
      Size = 1
    end
    object ibqryCotizacionMasterVALOR_TOTAL: TFloatField
      DisplayLabel = 'Monto Total'
      FieldName = 'VALOR_TOTAL'
      Origin = 'VIEW_COTIZACION_MASTER.VALOR_TOTAL'
    end
    object ibqryCotizacionMasterSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'VIEW_COTIZACION_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object ibqryCotizacionMasterNOMBRE_CTE: TIBStringField
      DisplayLabel = 'Nombre Cte'
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object ibqryCotizacionMasterTELEF_CONTACTO: TIBStringField
      DisplayLabel = 'Telef.Contacto'
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object ibqryCotizacionMasterDIRECCION_CONT: TIBStringField
      DisplayLabel = 'Direccion Contacto'
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object ibqryCotizacionMasterEMAIL: TIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object ibqryCotizacionMasterWEBSITE: TIBStringField
      DisplayLabel = 'WebSite'
      FieldName = 'WEBSITE'
      Origin = 'CLIENTES.WEBSITE'
      Size = 40
    end
    object ibqryCotizacionMasterCIUDAD: TIBStringField
      DisplayLabel = 'Ciudad'
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object ibqryCotizacionMasterPAIS: TIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
  end
  object dsibqryCotizacionMaster: TDataSource
    DataSet = ibqryCotizacionMaster
    Left = 176
    Top = 232
  end
  object ibqryCotizacionDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM COTIZACION_DET'
      'WHERE NUMERO=:NUMERO')
    Left = 360
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end>
    object ibqryCotizacionDetSERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'COTIZACION_DET.SERIE'
      Required = True
    end
    object ibqryCotizacionDetNUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
      Origin = 'COTIZACION_DET.NUMERO'
      Required = True
    end
    object ibqryCotizacionDetCODIGO_PROD: TIBStringField
      DisplayLabel = 'CodProd'
      FieldName = 'CODIGO_PROD'
      Origin = 'COTIZACION_DET.CODIGO_PROD'
      Size = 12
    end
    object ibqryCotizacionDetCODIGO_BARRA: TIBStringField
      DisplayLabel = 'CodBarra'
      FieldName = 'CODIGO_BARRA'
      Origin = 'COTIZACION_DET.CODIGO_BARRA'
    end
    object ibqryCotizacionDetDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'COTIZACION_DET.DESCRIPCION'
      Size = 60
    end
    object ibqryCotizacionDetCANTIDAD: TFloatField
      DisplayLabel = 'Cant'
      FieldName = 'CANTIDAD'
      Origin = 'COTIZACION_DET.CANTIDAD'
    end
    object ibqryCotizacionDetPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'COTIZACION_DET.PRECIO'
    end
    object ibqryCotizacionDetPORC_DESC_DET: TFloatField
      DisplayLabel = 'PorcDesc'
      FieldName = 'PORC_DESC_DET'
      Origin = 'COTIZACION_DET.PORC_DESC_DET'
    end
    object ibqryCotizacionDetITBI_DET: TFloatField
      DisplayLabel = 'Itbis'
      FieldName = 'ITBI_DET'
      Origin = 'COTIZACION_DET.ITBI_DET'
    end
    object ibqryCotizacionDetVALOR_SERVICIO_DET: TFloatField
      DisplayLabel = 'Monto Bruto'
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'COTIZACION_DET.VALOR_SERVICIO_DET'
    end
    object ibqryCotizacionDetVALOR_TOTAL_DET: TFloatField
      DisplayLabel = 'Monto Neto'
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'COTIZACION_DET.VALOR_TOTAL_DET'
    end
    object ibqryCotizacionDetSTATUS_DET: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_DET'
      Origin = 'COTIZACION_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object ibqryCotizacionDetFECHA_IN: TDateTimeField
      DisplayLabel = 'FechaIn'
      FieldName = 'FECHA_IN'
      Origin = 'COTIZACION_DET.FECHA_IN'
    end
  end
  object dsibqryCotizacionDet: TDataSource
    DataSet = ibqryCotizacionDet
    Left = 368
    Top = 248
  end
  object ibsqlBuscarcotinum: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'select FECHA from COTIZACION_MAST'
      'where NUMERO=:numero')
    Transaction = dmConectar.IBTransaction1
    Left = 552
    Top = 216
  end
end
