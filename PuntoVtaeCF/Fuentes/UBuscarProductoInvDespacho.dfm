object frmBuscarInvDespachoVendedores: TfrmBuscarInvDespachoVendedores
  Left = 684
  Top = 249
  BorderStyle = bsSingle
  Caption = 'Procesar Despacho Ruta'
  ClientHeight = 531
  ClientWidth = 602
  Color = 10547677
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 87
    Top = 1
    Width = 104
    Height = 13
    Caption = 'Entre codigo a buscar'
  end
  object Shape1: TShape
    Left = 15
    Top = 213
    Width = 577
    Height = 3
    Pen.Color = 5669374
  end
  object Shape2: TShape
    Left = 16
    Top = 407
    Width = 576
    Height = 5
    Pen.Color = clGreen
  end
  object Label18: TLabel
    Left = 18
    Top = 1
    Width = 23
    Height = 13
    Caption = 'Ruta'
  end
  object RxDBGrid1: TRxDBGrid
    Left = 15
    Top = 48
    Width = 577
    Height = 161
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
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_TEXTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 125
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
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 87
    Top = 16
    Width = 106
    Height = 21
    TabOrder = 1
    OnExit = Edit1Exit
  end
  object BitBtn1: TBitBtn
    Left = 310
    Top = 16
    Width = 75
    Height = 25
    Caption = '&Buscar'
    TabOrder = 3
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
    Left = 407
    Top = 16
    Width = 91
    Height = 25
    Hint = 'Procesar Venta'
    Caption = '&Procesar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
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
    Left = 517
    Top = 16
    Width = 73
    Height = 25
    TabOrder = 5
    Kind = bkClose
  end
  object Panel1: TPanel
    Left = 16
    Top = 219
    Width = 576
    Height = 185
    Color = 11004329
    TabOrder = 6
    Visible = False
    object Label2: TLabel
      Left = 93
      Top = 3
      Width = 68
      Height = 13
      Caption = 'Descripcion'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 5
      Top = 43
      Width = 37
      Height = 13
      Caption = 'Precio'
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 274
      Top = 43
      Width = 51
      Height = 13
      Caption = 'Cantidad'
      FocusControl = DBEdit3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 370
      Top = 43
      Width = 60
      Height = 13
      Caption = 'porc_desc'
      FocusControl = DBEdit4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 5
      Top = 83
      Width = 19
      Height = 13
      Caption = 'Itbi'
      FocusControl = DBEdit5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 93
      Top = 83
      Width = 30
      Height = 13
      Caption = 'Valor'
      FocusControl = DBEdit6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 181
      Top = 83
      Width = 62
      Height = 13
      Caption = 'Total_neto'
      FocusControl = DBEdit7
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBStatusLabel1: TDBStatusLabel
      Left = 8
      Top = 160
      Width = 85
      Height = 13
      DatasetName = 'rxData'
      DataSource = dsrxData
    end
    object Label9: TLabel
      Left = 337
      Top = 3
      Width = 28
      Height = 13
      Caption = 'Ruta'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 160
      Top = 168
      Width = 68
      Height = 16
      Caption = 'MONTO : '
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
      Left = 224
      Top = 168
      Width = 94
      Height = 13
      AutoSize = False
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
      Left = 274
      Top = 3
      Width = 47
      Height = 13
      Caption = 'CodEmp'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 274
      Top = 83
      Width = 60
      Height = 13
      Caption = 'Nueva Cant.'
      FocusControl = DBEdit10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 376
      Top = 83
      Width = 65
      Height = 13
      Caption = 'Nuevo Monto'
      FocusControl = DBEdit11
    end
    object Label15: TLabel
      Left = 336
      Top = 168
      Width = 125
      Height = 16
      Caption = 'NUEVO MONTO : '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label16: TLabel
      Left = 468
      Top = 167
      Width = 56
      Height = 16
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
    object Label17: TLabel
      Left = 93
      Top = 43
      Width = 78
      Height = 13
      Caption = 'Balance Ruta'
      FocusControl = DBEdit3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 5
      Top = 3
      Width = 68
      Height = 13
      Caption = 'Descripcion'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lablBlcInv: TLabel
      Left = 184
      Top = 43
      Width = 73
      Height = 13
      Caption = 'Balance Inv.'
      FocusControl = DBEdit3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 94
      Top = 19
      Width = 176
      Height = 21
      DataField = 'DESCRIPCION'
      DataSource = dsqryInventario
      TabOrder = 9
    end
    object DBEdit2: TDBEdit
      Left = 5
      Top = 59
      Width = 78
      Height = 21
      DataField = 'PRECIO'
      DataSource = dsqryInventario
      TabOrder = 10
    end
    object DBEdit3: TDBEdit
      Left = 274
      Top = 59
      Width = 86
      Height = 21
      Hint = 'Entre Cantidad'
      Color = 8454143
      DataField = 'Cantidad'
      DataSource = dsrxData
      TabOrder = 2
      OnExit = BitBtn4Click
    end
    object DBEdit4: TDBEdit
      Left = 370
      Top = 59
      Width = 92
      Height = 21
      DataField = 'porc_desc'
      DataSource = dsrxData
      TabOrder = 4
    end
    object DBEdit5: TDBEdit
      Left = 5
      Top = 99
      Width = 78
      Height = 21
      DataField = 'itbi'
      DataSource = dsrxData
      TabOrder = 5
    end
    object DBEdit6: TDBEdit
      Left = 93
      Top = 99
      Width = 68
      Height = 21
      DataField = 'valor'
      DataSource = dsrxData
      TabOrder = 6
    end
    object DBEdit7: TDBEdit
      Left = 181
      Top = 99
      Width = 86
      Height = 21
      DataField = 'total_neto'
      DataSource = dsrxData
      TabOrder = 7
    end
    object BitBtn4: TBitBtn
      Left = 7
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Ac&eptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10485760
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 85
      Top = 128
      Width = 113
      Height = 25
      Caption = 'C&ancelar Este Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10485760
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 202
      Top = 128
      Width = 114
      Height = 25
      Caption = 'Cancelar &Venta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10485760
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      OnClick = BitBtn6Click
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 377
      Top = 19
      Width = 144
      Height = 21
      DropDownCount = 8
      DataField = 'CodigoRuta'
      DataSource = dsrxData
      LookupField = 'RUTA'
      LookupDisplay = 'NOMBRE'
      LookupSource = dsqryEmpleados
      TabOrder = 3
    end
    object DBEdit8: TDBEdit
      Left = 274
      Top = 19
      Width = 46
      Height = 21
      Color = 8454143
      DataField = 'CodEmp'
      DataSource = dsrxData
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit9: TDBEdit
      Left = 337
      Top = 19
      Width = 36
      Height = 21
      DataField = 'CodigoRuta'
      DataSource = dsrxData
      TabOrder = 1
      OnEnter = DBEdit9Enter
      OnExit = DBEdit9Exit
    end
    object DBEdit10: TDBEdit
      Left = 274
      Top = 99
      Width = 92
      Height = 21
      Color = 10547677
      DataField = 'NuevoBalance'
      DataSource = dsrxData
      ReadOnly = True
      TabOrder = 13
    end
    object DBEdit11: TDBEdit
      Left = 376
      Top = 99
      Width = 134
      Height = 21
      DataField = 'NuevoMonto'
      DataSource = dsrxData
      TabOrder = 14
    end
    object DBEdit12: TDBEdit
      Left = 93
      Top = 59
      Width = 68
      Height = 21
      Hint = 'Entre Cantidad'
      DataField = 'BalanceAct'
      DataSource = dsrxData
      TabOrder = 15
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 5
      Top = 19
      Width = 79
      Height = 21
      DropDownCount = 8
      DataField = 'TIPO_TRN'
      DataSource = dsrxData
      LookupField = 'CODIGO'
      LookupDisplay = 'DESCRIPCION'
      LookupSource = dmDespacho.dstblTipoDespacho
      TabOrder = 16
    end
    object dbEditBlcInventario: TDBEdit
      Left = 184
      Top = 59
      Width = 68
      Height = 21
      Hint = 'Entre Cantidad'
      DataField = 'CANTIDAD'
      DataSource = dsqryInventario
      ReadOnly = True
      TabOrder = 17
    end
  end
  object RxDBGrid2: TRxDBGrid
    Left = 15
    Top = 416
    Width = 577
    Height = 99
    Color = clWhite
    DataSource = dsrxData
    FixedColor = 10547677
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    MultiSelect = True
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        ReadOnly = True
        Width = 38
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
        FieldName = 'BalanceAct'
        Title.Caption = 'Blc.Ant'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cantidad'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NuevoBalance'
        Title.Caption = 'TSalida'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'porc_desc'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_neto'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodigoRuta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodEmp'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NuevoMonto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'itbi'
        Width = 34
        Visible = True
      end>
  end
  object EditN1: TEditN
    Left = 16
    Top = 16
    Width = 57
    Height = 21
    Color = clSilver
    TabOrder = 0
    ColorOnFocus = clWhite
    ColorOnNotFocus = clSilver
    FontColorOnFocus = clRed
    FontColorOnNotFocus = clBlack
    FontColorOnOverWrite = clBlue
    EditType = etInteger
    EditKeyByTab = #9
    EditAlign = etAlignNone
    EditLengthAlign = 0
    EditPrecision = 0
    ValueInteger = 0
    ValueDate = 38738.000000000000000000
    ValueTime = 0.555211655092592600
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object qryInventario: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '    INV.CODIGO,'
      '    INV.CODIGO_TEXTO, '
      '    INV.DESCRIPCION, '
      '    INV.PRECIO, '
      '    INV.PAGA_ITBI,'
      '    INV.CANTIDAD,'
      '    Tipo_inv.Descripcion Desc_tipoInv,'
      '    INV.tipo, Porc_descuento'
      'FROM'
      'INVENTARIO_PRODUCTO  inv,'
      'TIPO_INVENTARIO tipo_inv'
      'Where inv.tipo = tipo_inv.codigo'
      'ORDER BY inv.tipo, inv.descripcion')
    Left = 199
    Top = 112
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
      DisplayLabel = 'CodigoTexto'
      DisplayWidth = 40
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryInventarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInventarioCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
  end
  object dsqryInventario: TDataSource
    DataSet = qryInventario
    Left = 372
    Top = 483
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
        Name = 'CodigoRuta'
        DataType = ftInteger
      end
      item
        Name = 'CodEmp'
        DataType = ftInteger
      end
      item
        Name = 'NuevoBalance'
        DataType = ftFloat
      end
      item
        Name = 'BalanceAct'
        DataType = ftFloat
      end
      item
        Name = 'TIPO_TRN'
        DataType = ftInteger
      end>
    AfterPost = rxDataAfterPost
    OnCalcFields = rxDataCalcFields
    Left = 303
    Top = 136
    object rxDataTIPO_TRN: TIntegerField
      DisplayLabel = 'TipoTrn'
      FieldName = 'TIPO_TRN'
    end
    object rxDatacodigo: TStringField
      FieldName = 'codigo'
      Required = True
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
      DisplayFormat = ',0.00'
    end
    object rxDatatotal_neto: TCurrencyField
      FieldName = 'total_neto'
      DisplayFormat = ',0.00'
    end
    object rxDatafecha: TDateTimeField
      FieldName = 'fecha'
    end
    object rxDataCodigoRuta: TIntegerField
      FieldName = 'CodigoRuta'
    end
    object rxDataCodEmp: TIntegerField
      FieldName = 'CodEmp'
    end
    object rxDataNuevoBalance: TFloatField
      FieldName = 'NuevoBalance'
    end
    object rxDataNuevoMonto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'NuevoMonto'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object rxDataBalanceAct: TFloatField
      FieldName = 'BalanceAct'
    end
  end
  object dsrxData: TDataSource
    DataSet = rxData
    Left = 519
    Top = 164
  end
  object dsqryEmpleados: TDataSource
    DataSet = dmDespacho.qryEmpleados
    Left = 424
    Top = 136
  end
  object dstblRuta: TDataSource
    Left = 448
    Top = 187
  end
  object qryRuta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from RUTA'
      'where codigo = :codigo')
    Left = 512
    Top = 283
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end>
    object qryRutaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'RUTA.CODIGO'
      Required = True
    end
    object qryRutaCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'RUTA.CODIGO_EMP'
      Required = True
    end
  end
end
