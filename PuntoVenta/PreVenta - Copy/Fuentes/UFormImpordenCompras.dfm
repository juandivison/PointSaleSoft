object frmImpOrden: TfrmImpOrden
  Left = 213
  Top = 172
  Width = 839
  Height = 309
  Caption = 'Imprimir Orden de Compra'
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
    Left = 7
    Top = 4
    Width = 810
    Height = 193
    DataSource = dsqryDatosOrdenAImp
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
        FieldName = 'NUMERO'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_PROVEE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACION'
        Width = 201
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBREPROVEEDOR'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS_CNT'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_ORDEN'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS_ORD'
        Width = 48
        Visible = True
      end>
  end
  object BitBtn4: TBitBtn
    Tag = 5
    Left = 371
    Top = 215
    Width = 155
    Height = 37
    Caption = '&IMPRIMIR ORDEN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn4Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object BitBtn15: TBitBtn
    Tag = 12
    Left = 204
    Top = 215
    Width = 165
    Height = 35
    Caption = '&GENERA # ORDEN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn15Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
      00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
      00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
      F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
      FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
      0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
      0033333337FFFFFF773333333000000003333333377777777333}
    NumGlyphs = 2
  end
  object BitBtn1: TBitBtn
    Tag = 12
    Left = 532
    Top = 215
    Width = 148
    Height = 35
    Caption = '&Cerrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object qryDatosOrdenAImp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select o.*, p.descripcion NombreProveedor '
      'From ORDEN_COMP_MAST o,  PROVEEDORES p'
      'Where o.status ='#39'A'#39
      'And p.codigo_cte = o.CODIGO_PROVEE'
      'And o.Fecha =:fecha')
    Left = 96
    Top = 88
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end>
    object qryDatosOrdenAImpNUMERO: TIntegerField
      DisplayLabel = 'Num'
      FieldName = 'NUMERO'
      Origin = 'ORDEN_COMP_MAST.NUMERO'
      Required = True
    end
    object qryDatosOrdenAImpFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'ORDEN_COMP_MAST.FECHA'
      Required = True
    end
    object qryDatosOrdenAImpCODIGO_PROVEE: TIntegerField
      DisplayLabel = 'CodProveedor'
      FieldName = 'CODIGO_PROVEE'
      Origin = 'ORDEN_COMP_MAST.CODIGO_PROVEE'
      Required = True
    end
    object qryDatosOrdenAImpOBSERVACION: TIBStringField
      DisplayLabel = 'Observacion'
      FieldName = 'OBSERVACION'
      Origin = 'ORDEN_COMP_MAST.OBSERVACION'
      Size = 40
    end
    object qryDatosOrdenAImpNOMBREPROVEEDOR: TIBStringField
      DisplayLabel = 'Nombre Proveedor'
      FieldName = 'NOMBREPROVEEDOR'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 40
    end
    object qryDatosOrdenAImpMONTO: TFloatField
      DisplayLabel = 'Monto'
      FieldName = 'MONTO'
      Origin = 'ORDEN_COMP_MAST.MONTO'
    end
    object qryDatosOrdenAImpFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'ORDEN_COMP_MAST.FPAGO'
    end
    object qryDatosOrdenAImpCOD_CAJA_CHICA: TIntegerField
      FieldName = 'COD_CAJA_CHICA'
      Origin = 'ORDEN_COMP_MAST.COD_CAJA_CHICA'
    end
    object qryDatosOrdenAImpCODIGO_BANCO: TIntegerField
      FieldName = 'CODIGO_BANCO'
      Origin = 'ORDEN_COMP_MAST.CODIGO_BANCO'
    end
    object qryDatosOrdenAImpCUENTABANCO: TIBStringField
      FieldName = 'CUENTABANCO'
      Origin = 'ORDEN_COMP_MAST.CUENTABANCO'
    end
    object qryDatosOrdenAImpSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'ORDEN_COMP_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosOrdenAImpIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ORDEN_COMP_MAST.IN_POR'
      Size = 12
    end
    object qryDatosOrdenAImpFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ORDEN_COMP_MAST.FECHA_IN'
    end
    object qryDatosOrdenAImpMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'ORDEN_COMP_MAST.MOD_POR'
      Size = 12
    end
    object qryDatosOrdenAImpFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'ORDEN_COMP_MAST.FECHA_MOD'
    end
    object qryDatosOrdenAImpTIPO_INV: TSmallintField
      FieldName = 'TIPO_INV'
      Origin = 'ORDEN_COMP_MAST.TIPO_INV'
    end
    object qryDatosOrdenAImpSTATUS_CNT: TIBStringField
      DisplayLabel = 'St Cnt'
      FieldName = 'STATUS_CNT'
      Origin = 'ORDEN_COMP_MAST.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryDatosOrdenAImpNUM_ORDEN: TIntegerField
      DisplayLabel = '#Orden'
      FieldName = 'NUM_ORDEN'
      Origin = 'ORDEN_COMP_MAST.NUM_ORDEN'
    end
    object qryDatosOrdenAImpSTATUS_ORD: TIBStringField
      DisplayLabel = 'Impresa'
      FieldName = 'STATUS_ORD'
      Origin = 'ORDEN_COMP_MAST.STATUS_ORD'
      FixedChar = True
      Size = 1
    end
    object qryDatosOrdenAImpAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'ORDEN_COMP_MAST.AREA_ORDEN'
    end
  end
  object dsqryDatosOrdenAImp: TDataSource
    DataSet = qryDatosOrdenAImp
    Left = 208
    Top = 104
  end
  object stpGenNumOrden: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_GEN_NUM_ORDEN'
    Left = 352
    Top = 59
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO_SERIE'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_ORDEN'
        ParamType = ptOutput
      end>
  end
  object stpUpdateOrdnStatus: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_UPD_STATUS_ORDEN'
    Left = 352
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'XNUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUSORDEN'
        ParamType = ptInput
      end>
  end
end
