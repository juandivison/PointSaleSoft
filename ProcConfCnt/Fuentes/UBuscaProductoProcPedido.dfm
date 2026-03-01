inherited frmBuscarProdProcPed: TfrmBuscarProdProcPed
  Left = 293
  Top = 109
  Caption = 'Procesar Pedido'
  ClientHeight = 595
  ClientWidth = 608
  Color = 10930928
  OldCreateOrder = True
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label1: TLabel
    Left = 95
  end
  inherited Shape1: TShape
    Top = 280
  end
  inherited Shape2: TShape
    Top = 475
  end
  inherited Label18: TLabel
    Left = 15
    Top = 0
    Width = 65
    Height = 16
    Caption = '# Factura'
    Font.Height = -13
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label20: TLabel [4]
    Left = 16
    Top = 40
    Width = 49
    Height = 13
    Caption = 'Proveedor'
  end
  object Label22: TLabel [5]
    Left = 208
    Top = 0
    Width = 137
    Height = 13
    Caption = 'Buscar por Nombre Producto'
  end
  object Label23: TLabel [6]
    Left = 208
    Top = 40
    Width = 106
    Height = 13
    Caption = 'Buscar por Referencia'
  end
  inherited RxDBGrid1: TRxDBGrid
    Top = 80
    Height = 195
    TabOrder = 6
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_TEXTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 191
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
        FieldName = 'REFERENCIA'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TIPOINV'
        Width = 82
        Visible = True
      end>
  end
  inherited BitBtn1: TBitBtn [8]
    Left = 367
    Top = 13
    Width = 68
    TabOrder = 4
  end
  inherited BitBtn2: TBitBtn [9]
    Left = 443
    Top = 13
    Width = 73
    TabOrder = 7
  end
  inherited BitBtn3: TBitBtn [10]
    Left = 523
    Top = 13
    Width = 69
    TabOrder = 8
  end
  inherited Panel1: TPanel [11]
    Top = 287
    Color = clBtnFace
    TabOrder = 9
    inherited Label5: TLabel [0]
      Visible = False
    end
    inherited Label2: TLabel [1]
    end
    inherited Label3: TLabel [2]
      Left = 437
      Top = 41
      Width = 74
      Caption = 'Precio Venta'
    end
    inherited Label4: TLabel [3]
      Left = 170
    end
    inherited Label8: TLabel
      Left = 173
    end
    inherited Label9: TLabel
      Left = 327
    end
    inherited Label11: TLabel
      Left = 229
      Top = 169
    end
    inherited Label17: TLabel
      Left = 5
      Enabled = False
    end
    object labelNumConduce: TLabel [18]
      Left = 522
      Top = 41
      Width = 43
      Height = 13
      Caption = '#Factura'
      FocusControl = DBEdit5
    end
    inherited lablBlcInv: TLabel
      Left = 93
    end
    object Label21: TLabel [20]
      Left = 274
      Top = 42
      Width = 66
      Height = 13
      Caption = 'PrecioCompra'
      FocusControl = DBEdit13
    end
    object Label24: TLabel [21]
      Left = 366
      Top = 41
      Width = 64
      Height = 13
      Caption = '% Margen G. '
      FocusControl = DBEdit1
    end
    inherited DBEdit4: TDBEdit [22]
      Color = clGray
      TabOrder = 7
      Visible = False
    end
    inherited DBEdit1: TDBEdit [23]
      Left = 93
      TabOrder = 13
      OnChange = DBEdit1Change
    end
    inherited DBEdit2: TDBEdit [24]
      Left = 435
      DataField = 'PrecioVenta'
      DataSource = dsrxData
      ReadOnly = True
      TabOrder = 5
      OnExit = DBEdit2Exit
    end
    inherited DBEdit3: TDBEdit [25]
      Left = 173
      Width = 95
    end
    inherited DBEdit5: TDBEdit
      TabOrder = 9
    end
    inherited DBEdit6: TDBEdit
      TabOrder = 10
    end
    inherited DBEdit7: TDBEdit
      Left = 173
      Width = 96
      TabOrder = 11
    end
    inherited BitBtn4: TBitBtn
      TabOrder = 12
    end
    inherited BitBtn5: TBitBtn
      TabOrder = 14
    end
    inherited BitBtn6: TBitBtn
      TabOrder = 15
    end
    inherited RxDBLookupCombo1: TRxDBLookupCombo
      Left = 364
      TabOrder = 6
      Visible = False
    end
    inherited DBEdit8: TDBEdit
      Visible = False
    end
    inherited DBEdit9: TDBEdit
      Left = 327
      Visible = False
    end
    inherited DBEdit10: TDBEdit
      TabOrder = 16
    end
    inherited DBEdit11: TDBEdit
      ReadOnly = True
      TabOrder = 17
    end
    inherited DBEdit12: TDBEdit
      Left = 5
      Width = 78
      Enabled = False
      ReadOnly = True
      TabOrder = 18
    end
    inherited RxDBLookupCombo2: TRxDBLookupCombo
      TabOrder = 19
    end
    object dbEditNumConduce: TDBEdit [39]
      Left = 520
      Top = 59
      Width = 50
      Height = 21
      Hint = 'Numero de conduce'
      DataField = 'NumConduce'
      DataSource = dsrxData
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
    inherited dbEditBlcInventario: TDBEdit
      Left = 93
      TabOrder = 20
    end
    object DBEdit13: TDBEdit
      Left = 274
      Top = 59
      Width = 92
      Height = 21
      Color = 8454143
      DataField = 'PrecioCompra'
      DataSource = dsrxData
      TabOrder = 3
      OnExit = DBEdit13Exit
    end
    object BitBtn8: TBitBtn
      Left = 511
      Top = 16
      Width = 59
      Height = 22
      Caption = 'Editar'
      TabOrder = 21
      OnClick = BitBtn8Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
    object EditN2: TEditN
      Left = 372
      Top = 59
      Width = 58
      Height = 21
      Hint = 'Indique el porcentaje de ganancia, numero entero'
      Color = clSilver
      TabOrder = 4
      OnChange = EditN2Change
      ColorOnFocus = clWhite
      ColorOnNotFocus = clSilver
      FontColorOnFocus = clRed
      FontColorOnNotFocus = clBlack
      FontColorOnOverWrite = clBlue
      EditType = etFloat
      EditKeyByTab = #9
      EditAlign = etAlignNone
      EditLengthAlign = 0
      EditPrecision = 0
      ValueInteger = 0
      ValueDate = 39843.000000000000000000
      ValueTime = 0.985686145833333400
      TimeSeconds = False
      FirstCharUpper = False
      FirstCharUpList = ' ('
      WidthOnFocus = 0
      TextHint = True
    end
  end
  inherited RxDBGrid2: TRxDBGrid [12]
    Top = 484
    TabOrder = 10
  end
  inherited EditN1: TEditN [13]
    Left = 96
    TabOrder = 5
    Visible = False
  end
  inherited Edit1: TEdit [14]
    Left = 95
  end
  object edtNumConduce: TEditN [15]
    Left = 16
    Top = 16
    Width = 73
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
    ValueDate = 38739.000000000000000000
    ValueTime = 0.631012210648148200
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object RxDBLookupCombo3: TRxDBLookupCombo [16]
    Left = 16
    Top = 56
    Width = 185
    Height = 21
    DropDownCount = 8
    DataField = 'Codigo'
    DataSource = dsrxProveedor
    LookupField = 'CODIGO_CTE'
    LookupDisplay = 'DESCRIPCION'
    LookupSource = dmInventario.dsqryProveedores
    TabOrder = 11
    OnExit = RxDBLookupCombo3Exit
  end
  object edtBuscarProducto: TEditN [17]
    Left = 208
    Top = 16
    Width = 153
    Height = 21
    Color = clSilver
    TabOrder = 2
    OnChange = edtBuscarProductoChange
    ColorOnFocus = clWhite
    ColorOnNotFocus = clSilver
    FontColorOnFocus = clRed
    FontColorOnNotFocus = clBlack
    FontColorOnOverWrite = clBlue
    EditType = etString
    EditKeyByTab = #9
    EditAlign = etAlignNone
    EditLengthAlign = 0
    EditPrecision = 0
    ValueInteger = 0
    ValueDate = 39815.000000000000000000
    ValueTime = 0.945076574074074100
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object BitBtn7: TBitBtn [18]
    Left = 524
    Top = 50
    Width = 68
    Height = 25
    Caption = 'Label'
    TabOrder = 12
    OnClick = BitBtn7Click
  end
  object edtReferencia: TEditN [19]
    Left = 208
    Top = 56
    Width = 153
    Height = 21
    Color = clSilver
    TabOrder = 3
    OnChange = edtReferenciaChange
    ColorOnFocus = clWhite
    ColorOnNotFocus = clSilver
    FontColorOnFocus = clRed
    FontColorOnNotFocus = clBlack
    FontColorOnOverWrite = clBlue
    EditType = etString
    EditKeyByTab = #9
    EditAlign = etAlignNone
    EditLengthAlign = 0
    EditPrecision = 0
    ValueInteger = 0
    ValueDate = 39815.000000000000000000
    ValueTime = 0.945076574074074100
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  inherited qryInventario: TIBQuery
    SQL.Strings = (
      'select '
      'INV.CODIGO,'
      'INV.CODIGO_TEXTO, '
      'INV.DESCRIPCION, '
      'INV.PRECIO, '
      'INV.PAGA_ITBI,'
      'INV.CANTIDAD, INV.REFERENCIA,'
      'tipo_inv.Descripcion Desc_tipoInv,'
      'inv.tipo, inv.PRECIO_COMPRA,'
      'porc_descuento'
      'FROM'
      'INVENTARIO_PRODUCTO  inv,'
      'TIPO_INVENTARIO tipo_inv'
      'Where inv.tipo = tipo_inv.codigo'
      'ORDER BY inv.descripcion, inv.tipo')
    object qryInventarioREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object qryInventarioPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
  end
  inherited dsqryInventario: TDataSource
    Top = 527
  end
  inherited rxData: TRxMemoryData
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
      end
      item
        Name = 'NumConduce'
        DataType = ftInteger
      end
      item
        Name = 'CodigoProd'
        DataType = ftInteger
      end
      item
        Name = 'FormaPago'
        DataType = ftInteger
      end
      item
        Name = 'Margen'
        DataType = ftFloat
      end
      item
        Name = 'PrecioVenta'
        DataType = ftFloat
      end>
    Left = 279
    Top = 120
    inherited rxDatafecha: TDateTimeField
      Required = True
    end
    object rxDataNumConduce: TIntegerField
      FieldName = 'NumConduce'
      Required = True
    end
    object rxDataCodigoProd: TIntegerField
      FieldName = 'CodigoProd'
    end
    object rxDataPrecioCompra: TFloatField
      FieldName = 'PrecioCompra'
    end
    object rxDataPrecioVenta: TFloatField
      FieldName = 'PrecioVenta'
    end
    object rxDataMargen: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Margen'
      Calculated = True
    end
  end
  inherited dsrxData: TDataSource
    Left = 409
    Top = 185
  end
  inherited dsqryEmpleados: TDataSource
    Left = 408
    Top = 120
  end
  inherited dstblRuta: TDataSource
    Left = 472
    Top = 184
  end
  inherited qryRuta: TIBQuery
    Left = 208
    Top = 191
  end
  object IBTable1: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 96
    Top = 112
  end
  object IBTable2: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PROVEEDORES'
    Left = 336
    Top = 120
    object IBTable2CODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
    end
    object IBTable2TIPO_CLIENTE: TIntegerField
      FieldName = 'TIPO_CLIENTE'
    end
    object IBTable2DESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object IBTable2ESTADO: TIBStringField
      FieldName = 'ESTADO'
      Size = 30
    end
    object IBTable2CIUDAD: TIBStringField
      FieldName = 'CIUDAD'
    end
    object IBTable2TELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Size = 12
    end
    object IBTable2DIRECCIONWEB: TIBStringField
      FieldName = 'DIRECCIONWEB'
      Size = 40
    end
  end
  object DataSource1: TDataSource
    DataSet = IBTable2
    Left = 530
    Top = 184
  end
  object rxProveedor: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'FormaPago'
        DataType = ftInteger
      end
      item
        Name = 'Tipo'
        DataType = ftInteger
      end>
    Left = 264
    Top = 192
    object rxProveedorCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object rxProveedorFormaPago: TIntegerField
      FieldName = 'FormaPago'
    end
    object rxProveedorTipo: TIntegerField
      FieldName = 'Tipo'
    end
  end
  object dsrxProveedor: TDataSource
    DataSet = rxProveedor
    Left = 335
    Top = 193
  end
  object ibStpActualizaInv: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_ACTUALIZAINVENTARIO '
    Left = 144
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO_PRODUCTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUEVACANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPOTRN'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'PORCODIGO'
        ParamType = ptInput
      end>
  end
  object ibSqlUpdatePrecioInv: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_UPDATEPRECIOINV'
    Left = 440
    Top = 407
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO_PROC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NEWPRECIO'
        ParamType = ptInput
      end>
  end
end
