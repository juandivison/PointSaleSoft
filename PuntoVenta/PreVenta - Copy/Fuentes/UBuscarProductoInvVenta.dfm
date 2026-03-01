object frmBuscarProdInv: TfrmBuscarProdInv
  Left = 268
  Top = 144
  ActiveControl = Edit1
  BorderStyle = bsSingle
  Caption = 'Inventario'
  ClientHeight = 572
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 15
    Top = 0
    Width = 104
    Height = 13
    Caption = 'Entre codigo a buscar'
  end
  object Shape2: TShape
    Left = 16
    Top = 447
    Width = 665
    Height = 5
    Pen.Color = clGreen
  end
  object RxDBGrid1: TRxDBGrid
    Left = 15
    Top = 42
    Width = 666
    Height = 231
    DataSource = dsqryInventario
    FixedColor = 13434879
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = RxDBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_TEXTO'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 272
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGA_ITBI'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TIPOINV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 15
    Top = 16
    Width = 169
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnExit = BitBtn1Click
  end
  object BitBtn1: TBitBtn
    Left = 198
    Top = 16
    Width = 75
    Height = 25
    Caption = '&Buscar'
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 287
    Top = 14
    Width = 89
    Height = 25
    Hint = 'Procesar Venta'
    Caption = '&Procesar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
      C8807FF7777777777FF700000000000000007777777777777777333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object BitBtn3: TBitBtn
    Left = 383
    Top = 15
    Width = 73
    Height = 25
    TabOrder = 4
    Kind = bkClose
  end
  object Panel1: TPanel
    Left = 16
    Top = 278
    Width = 665
    Height = 163
    Color = 11004329
    TabOrder = 5
    Visible = False
    object Label2: TLabel
      Left = 7
      Top = 1
      Width = 84
      Height = 16
      Caption = 'Descripcion'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 42
      Width = 46
      Height = 16
      Caption = 'Precio'
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 253
      Top = 43
      Width = 63
      Height = 16
      Caption = 'Cantidad'
      FocusControl = DBEdit3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 344
      Top = 41
      Width = 74
      Height = 16
      Caption = 'porc_desc'
      FocusControl = DBEdit4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 6
      Top = 83
      Width = 22
      Height = 16
      Caption = 'Itbi'
      FocusControl = DBEdit5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 87
      Top = 82
      Width = 38
      Height = 16
      Caption = 'Valor'
      FocusControl = DBEdit6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 181
      Top = 83
      Width = 75
      Height = 16
      Caption = 'Total_neto'
      FocusControl = DBEdit7
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBStatusLabel1: TDBStatusLabel
      Left = 568
      Top = 144
      Width = 85
      Height = 13
      DatasetName = 'rxData'
      DataSource = dsrxData
    end
    object Label9: TLabel
      Left = 253
      Top = 1
      Width = 103
      Height = 16
      Caption = 'Codigo Cliente'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 320
      Top = 143
      Width = 119
      Height = 16
      Caption = 'MONTO VENTA :'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label11: TLabel
      Left = 446
      Top = 140
      Width = 56
      Height = 16
      Alignment = taRightJustify
      Caption = 'Label11'
      Color = 65408
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label12: TLabel
      Left = 320
      Top = 117
      Width = 288
      Height = 13
      Caption = 'ESC-Cancelar venta   F4- Otro  art'#237'culo   F9-Procesar Venta  '
      Color = 10547677
      ParentColor = False
    end
    object DBText1: TDBText
      Left = 154
      Top = 52
      Width = 41
      Height = 15
      DataField = 'CANTIDAD'
      DataSource = dsqryInventario
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 88
      Top = 51
      Width = 53
      Height = 16
      Caption = 'Cant. Inv.'
      Color = 10547677
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 5
      Top = 17
      Width = 242
      Height = 24
      DataField = 'DESCRIPCION'
      DataSource = dsqryInventario
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object DBEdit2: TDBEdit
      Left = 6
      Top = 58
      Width = 78
      Height = 24
      DataField = 'PRECIO'
      DataSource = dsqryInventario
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object DBEdit3: TDBEdit
      Left = 256
      Top = 62
      Width = 86
      Height = 24
      Hint = 'Entre Cantidad'
      DataField = 'Cantidad'
      DataSource = dsrxData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnExit = BitBtn4Click
    end
    object DBEdit4: TDBEdit
      Left = 344
      Top = 59
      Width = 60
      Height = 24
      DataField = 'porc_desc'
      DataSource = dsrxData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 5
      Top = 102
      Width = 76
      Height = 24
      DataField = 'itbi'
      DataSource = dsrxData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 86
      Top = 102
      Width = 88
      Height = 24
      DataField = 'valor'
      DataSource = dsrxData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 181
      Top = 100
      Width = 134
      Height = 24
      DataField = 'total_neto'
      DataSource = dsrxData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object BitBtn4: TBitBtn
      Left = 7
      Top = 132
      Width = 75
      Height = 25
      Caption = 'Ac&eptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10485760
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 85
      Top = 132
      Width = 113
      Height = 25
      Caption = 'C&ancelar Este Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10485760
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 202
      Top = 132
      Width = 114
      Height = 25
      Caption = 'Cancelar &Venta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10485760
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = BitBtn6Click
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 342
      Top = 17
      Width = 178
      Height = 20
      DropDownCount = 8
      DataField = 'CodigoCliente'
      DataSource = dsrxData
      LookupField = 'CODIGO_CTE'
      LookupDisplay = 'NOMBRE_CTE'
      LookupSource = dmVentas.dsqryClientes
      TabOrder = 1
    end
    object DBEdit8: TDBEdit
      Left = 253
      Top = 16
      Width = 60
      Height = 24
      DataField = 'CodigoCliente'
      DataSource = dsrxData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object RxDBGrid2: TRxDBGrid
    Left = 15
    Top = 456
    Width = 666
    Height = 105
    Color = clWhite
    DataSource = dsrxData
    FixedColor = 10547677
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    MultiSelect = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CodigoCliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigo'
        ReadOnly = True
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Precio'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cantidad'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'porc_desc'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'itbi'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_neto'
        Visible = True
      end>
  end
  object BitBtn7: TBitBtn
    Left = 466
    Top = 15
    Width = 79
    Height = 25
    Hint = 'Imprimir Cotizacion'
    Caption = 'Cotizacion'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Visible = False
    OnClick = BitBtn7Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
      000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
      99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
      0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
      FFFF3FFFFF7F337F333300000307B70FFFFF77777F73FF733F330EEE033000FF
      0FFF7F337FF777337FF30EEE00033FF000FF7F33777F333777FF0EEE0E033300
      000F7FFF7F7FFF77777F00000E00000000007777737773777777330EEE0E0330
      00FF337FFF7F7F3777F33300000E033000FF337777737F3777F333330EEE0330
      00FF33337FFF7FF77733333300000000033F3333777777777333}
    NumGlyphs = 2
  end
  object qryInventario: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '
      'INV.CODIGO_TEXTO, '
      'INV.DESCRIPCION, '
      'INV.PRECIO, '
      'INV.PAGA_ITBI,'
      'INV.CANTIDAD,'
      'tipo_inv.Descripcion Desc_tipoInv,'
      'inv.tipo,'
      'porc_descuento,'
      'inv.codigo'
      'FROM'
      'INVENTARIO_PRODUCTO  inv,'
      'TIPO_INVENTARIO tipo_inv'
      'Where inv.tipo = tipo_inv.codigo'
      'ORDER BY inv.codigo, inv.tipo, inv.descripcion')
    Left = 375
    Top = 192
    object qryInventarioDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryInventarioPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryInventarioPAGA_ITBI: TSmallintField
      DisplayLabel = 'PagaItbi'
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
    end
    object qryInventarioDESC_TIPOINV: TIBStringField
      DisplayLabel = 'TipoInventario'
      FieldName = 'DESC_TIPOINV'
      Origin = 'TIPO_INVENTARIO.DESCRIPCION'
      Size = 30
    end
    object qryInventarioTIPO: TIntegerField
      DisplayLabel = 'CodTipo'
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object qryInventarioPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'INVENTARIO_PRODUCTO.PORC_DESCUENTO'
    end
    object qryInventarioCODIGO_TEXTO: TIBStringField
      DisplayWidth = 40
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryInventarioCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
  end
  object dsqryInventario: TDataSource
    DataSet = qryInventario
    Left = 159
    Top = 168
  end
  object rxData: TRxMemoryData
    FieldDefs = <
      item
        Name = 'fecha'
        DataType = ftDateTime
      end
      item
        Name = 'codigo'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Cantidad'
        DataType = ftFloat
      end
      item
        Name = 'porc_desc'
        DataType = ftFloat
      end
      item
        Name = 'itbi'
        DataType = ftCurrency
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'total_neto'
        DataType = ftCurrency
      end
      item
        Name = 'Precio'
        DataType = ftCurrency
      end
      item
        Name = 'CodigoCliente'
        DataType = ftInteger
      end>
    AfterPost = rxDataAfterPost
    Left = 271
    Top = 184
    object rxDatacodigo: TStringField
      FieldName = 'codigo'
      Size = 12
    end
    object rxDataPrecio: TCurrencyField
      FieldName = 'Precio'
    end
    object rxDataCantidad: TFloatField
      FieldName = 'Cantidad'
    end
    object rxDataporc_desc: TFloatField
      FieldName = 'porc_desc'
    end
    object rxDataitbi: TCurrencyField
      FieldName = 'itbi'
    end
    object rxDatavalor: TCurrencyField
      FieldName = 'valor'
    end
    object rxDatatotal_neto: TCurrencyField
      FieldName = 'total_neto'
    end
    object rxDatafecha: TDateTimeField
      FieldName = 'fecha'
    end
    object rxDataCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
  end
  object dsrxData: TDataSource
    DataSet = rxData
    Left = 303
    Top = 144
  end
  object ibProcBuscarDatos: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROCBUSCAITBI'
    Left = 440
    Top = 128
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'GRUPO'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_INI'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_FIN'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PORCIENTO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'OBSERVACIONES'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end>
  end
end
