object frmHistVentasInv: TfrmHistVentasInv
  Left = 192
  Top = 117
  Width = 1305
  Height = 783
  Caption = 'Historico Ventas'
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
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 60
    Height = 13
    Caption = 'Fecha Inicial'
  end
  object Label2: TLabel
    Left = 120
    Top = 16
    Width = 55
    Height = 13
    Caption = 'Fecha Final'
  end
  object Label3: TLabel
    Left = 8
    Top = 456
    Width = 123
    Height = 13
    Caption = 'Entre Nueva Cantidad Inv'
  end
  object Label4: TLabel
    Left = 323
    Top = 16
    Width = 61
    Height = 13
    Caption = 'Codigo Barra'
  end
  object SpeedButton1: TSpeedButton
    Left = 448
    Top = 32
    Width = 23
    Height = 22
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
    OnClick = SpeedButton1Click
  end
  object Label59: TLabel
    Left = 485
    Top = 18
    Width = 30
    Height = 13
    Caption = 'Fecha'
  end
  object Label5: TLabel
    Left = 226
    Top = 454
    Width = 102
    Height = 13
    Caption = 'Filtrar por Descripcion'
  end
  object SpeedButton2: TSpeedButton
    Left = 478
    Top = 471
    Width = 23
    Height = 22
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
    OnClick = SpeedButton2Click
  end
  object Label6: TLabel
    Left = 754
    Top = 14
    Width = 110
    Height = 13
    Caption = 'Buscar por Descripcion'
  end
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 184
    Width = 1265
    Height = 265
    DataSource = DataSource1
    FixedColor = 12382694
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
        FieldName = 'NUMERO'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMA_PAGO'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_BARRA'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_PROD'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTUNIDAD'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTDEVOLUCION'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTVENTA'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL_DET'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOT_NUM'
        Visible = True
      end>
  end
  object DateTimePicker1: TDateTimePicker
    Left = 16
    Top = 32
    Width = 97
    Height = 21
    Date = 45211.940704236110000000
    Time = 45211.940704236110000000
    TabOrder = 1
  end
  object DateTimePicker2: TDateTimePicker
    Left = 120
    Top = 32
    Width = 97
    Height = 21
    Date = 45211.940704236110000000
    Time = 45211.940704236110000000
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 232
    Top = 27
    Width = 75
    Height = 25
    Caption = '&Datos'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object edtNuevaCant: TEdit
    Left = 8
    Top = 472
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object BitBtn2: TBitBtn
    Left = 139
    Top = 469
    Width = 75
    Height = 25
    Caption = 'Actualizar'
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object RxDBGrid2: TRxDBGrid
    Left = 8
    Top = 496
    Width = 1257
    Height = 209
    DataSource = DataSource2
    FixedColor = 16441811
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid2DblClick
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_TEXTO'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_ULTIMA_TRN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_BARRA'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 227
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BLCE_CANT_ENTRADA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD_REORDEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BLCE_CANT_SALIDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_DESCUENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGA_ITBI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_PRECIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_COMPRA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_MINIMO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_VENCIMIENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_ANT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVENTARIAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_TIPO_UNIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_UNIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIGEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UBICACION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA_ALTERNA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARCA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODELO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIOVENTA1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIOVENTA2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIOVENTA3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIOVENTA4'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCUTILIDAD1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCUTILIDAD2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCUTILIDAD3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCUTILIDAD4'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USARLEVELPRECIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIA_KEY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SITUACIONPROD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APLICAIMPTOCOMPRA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODFABRICANTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTAINVENTARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTAVENTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTACOMPRA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODSUBCATEGORIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCATEGORIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_MONEDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KILOMETROS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RUTAIMAGEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDTASAITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_ALQUILER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGACOMISION'
        Visible = True
      end>
  end
  object edtCodBarra: TEdit
    Left = 320
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object dtpkFechaConVentas: TDateTimePicker
    Left = 484
    Top = 32
    Width = 97
    Height = 21
    Date = 42294.883064618060000000
    Time = 42294.883064618060000000
    TabOrder = 8
  end
  object Button1: TButton
    Left = 589
    Top = 30
    Width = 25
    Height = 25
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 618
    Top = 30
    Width = 25
    Height = 25
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = Button2Click
  end
  object RxDBGrid3: TRxDBGrid
    Left = 16
    Top = 56
    Width = 1121
    Height = 120
    DataSource = DataSource4
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = RxDBGrid3CellClick
    OnDblClick = RxDBGrid3DblClick
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'FORMA_PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOT_NUM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_PROD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTUNIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Visible = True
      end>
  end
  object BitBtn35: TBitBtn
    Tag = 4058
    Left = 652
    Top = 27
    Width = 98
    Height = 27
    Caption = '&Consulta'
    Enabled = False
    TabOrder = 12
    OnClick = BitBtn35Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
  end
  object edtDesc: TEdit
    Left = 224
    Top = 472
    Width = 249
    Height = 21
    TabOrder = 13
    OnChange = edtDescChange
  end
  object edtBuscarDescVta: TEdit
    Left = 752
    Top = 32
    Width = 249
    Height = 21
    TabOrder = 14
    OnChange = edtBuscarDescVtaChange
  end
  object chkInvFiltrado: TCheckBox
    Left = 509
    Top = 474
    Width = 60
    Height = 15
    Caption = 'Filtrado'
    TabOrder = 15
    OnClick = chkInvFiltradoClick
  end
  object RadioButton1: TRadioButton
    Left = 580
    Top = 475
    Width = 97
    Height = 17
    Caption = 'Contiene Desc'
    TabOrder = 16
  end
  object RadioButton2: TRadioButton
    Left = 686
    Top = 475
    Width = 97
    Height = 17
    Caption = 'Inicia con Desc'
    Checked = True
    TabOrder = 17
    TabStop = True
  end
  object CheckBox1: TCheckBox
    Left = 1013
    Top = 34
    Width = 60
    Height = 15
    Caption = 'Filtrado'
    TabOrder = 18
    OnClick = CheckBox1Click
  end
  object BitBtn9: TBitBtn
    Left = 1138
    Top = 55
    Width = 33
    Height = 25
    TabOrder = 19
    OnClick = BitBtn9Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
      70E337F33333333337F3E0F33333333370E337F3333F3FF337F3E0F333030033
      70E337F3337F77F337F3E0F33003003370E337F3377F77F337F3E0F300030033
      70E337F3777F77F337F3E0F33003003370E337F3377F77F337F3E0F333030033
      70E337F33373773337F3E0F33333333370E337F33333333337F3E0F333333333
      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
    NumGlyphs = 2
  end
  object BitBtn10: TBitBtn
    Left = 1139
    Top = 86
    Width = 33
    Height = 25
    TabOrder = 20
    OnClick = BitBtn10Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333FF3333333333333003333333333333F77F33333333333009033
      333333333F7737F333333333009990333333333F773337FFFFFF330099999000
      00003F773333377777770099999999999990773FF33333FFFFF7330099999000
      000033773FF33777777733330099903333333333773FF7F33333333333009033
      33333333337737F3333333333333003333333333333377333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object BitBtn11: TBitBtn
    Left = 1141
    Top = 119
    Width = 33
    Height = 25
    TabOrder = 21
    OnClick = BitBtn11Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333FF3333333333333003333
      3333333333773FF3333333333309003333333333337F773FF333333333099900
      33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
      99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
      33333333337F3F77333333333309003333333333337F77333333333333003333
      3333333333773333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object BitBtn12: TBitBtn
    Left = 1141
    Top = 148
    Width = 33
    Height = 25
    TabOrder = 22
    OnClick = BitBtn12Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
      70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
      70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
      70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
      70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
    NumGlyphs = 2
  end
  object qryHistVentaDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      'VENTAS_DET.NUMERO, VENTAS_DET.SERIE,'
      'VENTAS_MAST.FORMA_PAGO,'
      'VENTAS_MAST.FECHA,'
      'i.CODIGO_BARRA,'
      'VENTAS_DET.CODIGO_PROD,'
      'VENTAS_DET.DESCRIPCION,'
      'UNIDADES.DESCRIPCION unidad,'
      'UNIDADES.CANTIDAD CantUnidad,'
      'VENTAS_DET.CANTIDAD,'
      
        'iif(VENTAS_MAST.FORMA_PAGO = '#39'6'#39',VENTAS_DET.CANTIDAD,0) CantDevo' +
        'lucion,'
      
        'iif(VENTAS_MAST.FORMA_PAGO != '#39'6'#39',-VENTAS_DET.CANTIDAD,0) CantVe' +
        'nta,'
      'VENTAS_DET.PRECIO,'
      'VENTAS_DET.VALOR_TOTAL_DET,'
      'VENTAS_DET.LOT_NUM'
      'FROM  '
      '  VENTAS_MAST'
      
        '  INNER JOIN VENTAS_DET ON (VENTAS_MAST.NUMERO = VENTAS_DET.NUME' +
        'RO)'
      
        '  inner join INVENTARIO_PRODUCTO i on i.CODIGO = ventas_Det.CODI' +
        'GO_PROD'
      
        '  LEFT OUTER JOIN UNIDADES ON (VENTAS_DET.TIPO_UNIDAD = UNIDADES' +
        '.IDUNIDAD)')
    Left = 344
    Top = 176
    object qryHistVentaDetNUMERO: TIntegerField
      DisplayWidth = 10
      FieldName = 'NUMERO'
      Origin = 'VENTAS_DET.NUMERO'
      Required = True
    end
    object qryHistVentaDetSERIE: TIntegerField
      DisplayWidth = 7
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET.SERIE'
      Required = True
    end
    object qryHistVentaDetFORMA_PAGO: TSmallintField
      DisplayWidth = 15
      FieldName = 'FORMA_PAGO'
      Origin = 'VENTAS_MAST.FORMA_PAGO'
    end
    object qryHistVentaDetFECHA: TDateTimeField
      DisplayWidth = 12
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryHistVentaDetCODIGO_BARRA: TIBStringField
      DisplayWidth = 19
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
    object qryHistVentaDetCODIGO_PROD: TIBStringField
      DisplayWidth = 16
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryHistVentaDetDESCRIPCION: TIBStringField
      DisplayWidth = 50
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object qryHistVentaDetUNIDAD: TIBStringField
      DisplayWidth = 10
      FieldName = 'UNIDAD'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
    object qryHistVentaDetCANTUNIDAD: TIntegerField
      DisplayWidth = 14
      FieldName = 'CANTUNIDAD'
      Origin = 'UNIDADES.CANTIDAD'
    end
    object qryHistVentaDetCANTIDAD: TFloatField
      DisplayWidth = 12
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET.CANTIDAD'
    end
    object qryHistVentaDetCANTDEVOLUCION: TFloatField
      DisplayWidth = 20
      FieldName = 'CANTDEVOLUCION'
    end
    object qryHistVentaDetCANTVENTA: TFloatField
      DisplayWidth = 13
      FieldName = 'CANTVENTA'
    end
    object qryHistVentaDetPRECIO: TFloatField
      DisplayWidth = 12
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET.PRECIO'
      DisplayFormat = ',0.00'
    end
    object qryHistVentaDetVALOR_TOTAL_DET: TFloatField
      DisplayWidth = 21
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'Monto Venta'
      DisplayFormat = ',0.00'
    end
    object qryHistVentaDetLOT_NUM: TIntegerField
      DisplayWidth = 12
      FieldName = 'LOT_NUM'
      Origin = 'VENTAS_DET.LOT_NUM'
    end
  end
  object DataSource1: TDataSource
    DataSet = qryHistVentaDet
    Left = 512
    Top = 304
  end
  object qryHistVentaDetBase: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      'VENTAS_DET.NUMERO, VENTAS_DET.SERIE,'
      'VENTAS_MAST.FORMA_PAGO,'
      'VENTAS_MAST.FECHA,'
      'i.CODIGO_BARRA,'
      'VENTAS_DET.CODIGO_PROD,'
      'VENTAS_DET.DESCRIPCION,'
      'UNIDADES.DESCRIPCION unidad,'
      'UNIDADES.CANTIDAD CantUnidad,'
      'VENTAS_DET.CANTIDAD,'
      
        'iif(VENTAS_MAST.FORMA_PAGO = '#39'6'#39',VENTAS_DET.CANTIDAD,0) CantDevo' +
        'lucion,'
      
        'iif(VENTAS_MAST.FORMA_PAGO != '#39'6'#39',-VENTAS_DET.CANTIDAD,0) CantVe' +
        'nta,'
      'VENTAS_DET.PRECIO,'
      'VENTAS_DET.VALOR_TOTAL_DET,'
      'VENTAS_DET.LOT_NUM'
      'FROM  '
      '  VENTAS_MAST'
      
        '  INNER JOIN VENTAS_DET ON (VENTAS_MAST.NUMERO = VENTAS_DET.NUME' +
        'RO)'
      
        '  inner join INVENTARIO_PRODUCTO i on i.CODIGO = ventas_Det.CODI' +
        'GO_PROD'
      
        '  LEFT OUTER JOIN UNIDADES ON (VENTAS_DET.TIPO_UNIDAD = UNIDADES' +
        '.IDUNIDAD)')
    Left = 552
    Top = 176
  end
  object tblInv: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from INVENTARIO_PRODUCTO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into INVENTARIO_PRODUCTO'
      
        '  (CODIGO, CODIGO_TEXTO, FECHA, CODIGO_BARRA, TIPO, DESCRIPCION,' +
        ' DESCRIPCIONADICIONAL, '
      
        '   CANTIDAD_REORDEN, PRECIO_ANT, CANTIDAD, PRECIO, BLCE_CANT_ENT' +
        'RADA, BLCE_CANT_SALIDA, '
      
        '   FECHA_ULTIMA_TRN, STATUS, PORC_DESCUENTO, FOTO, PAGA_ITBI, CO' +
        'DIGO_PRECIO, '
      
        '   UNIDAD, PRECIO_COMPRA, PRECIO_MINIMO, REFERENCIA, FECHA_VENCI' +
        'MIENTO, '
      
        '   INVENTARIAR, PRECIO_TIPO_UNIDAD, TIPO_UNIDAD, ORIGEN, UBICACI' +
        'ON, REFERENCIA_ALTERNA, '
      
        '   MARCA, MODELO, PRECIOVENTA1, PRECIOVENTA2, PRECIOVENTA3, PREC' +
        'IOVENTA4, '
      
        '   PORCUTILIDAD1, PORCUTILIDAD2, PORCUTILIDAD3, PORCUTILIDAD4, U' +
        'SARLEVELPRECIO, '
      
        '   CIA_KEY, SITUACIONPROD, APLICAIMPTOCOMPRA, CODFABRICANTE, CTA' +
        'INVENTARIO, '
      
        '   CTAVENTA, CTACOMPRA, CODSUBCATEGORIA, CODCATEGORIA, PORCITBIS' +
        ', COD_MONEDA, '
      
        '   KILOMETROS, RUTAIMAGEN, IDTASAITBIS, PRECIO_ALQUILER, PAGACOM' +
        'ISION)'
      'values'
      
        '  (:CODIGO, :CODIGO_TEXTO, :FECHA, :CODIGO_BARRA, :TIPO, :DESCRI' +
        'PCION, '
      
        '   :DESCRIPCIONADICIONAL, :CANTIDAD_REORDEN, :PRECIO_ANT, :CANTI' +
        'DAD, :PRECIO, '
      
        '   :BLCE_CANT_ENTRADA, :BLCE_CANT_SALIDA, :FECHA_ULTIMA_TRN, :ST' +
        'ATUS, :PORC_DESCUENTO, '
      
        '   :FOTO, :PAGA_ITBI, :CODIGO_PRECIO, :UNIDAD, :PRECIO_COMPRA, :' +
        'PRECIO_MINIMO, '
      
        '   :REFERENCIA, :FECHA_VENCIMIENTO, :INVENTARIAR, :PRECIO_TIPO_U' +
        'NIDAD, '
      
        '   :TIPO_UNIDAD, :ORIGEN, :UBICACION, :REFERENCIA_ALTERNA, :MARC' +
        'A, :MODELO, '
      
        '   :PRECIOVENTA1, :PRECIOVENTA2, :PRECIOVENTA3, :PRECIOVENTA4, :' +
        'PORCUTILIDAD1, '
      
        '   :PORCUTILIDAD2, :PORCUTILIDAD3, :PORCUTILIDAD4, :USARLEVELPRE' +
        'CIO, :CIA_KEY, '
      
        '   :SITUACIONPROD, :APLICAIMPTOCOMPRA, :CODFABRICANTE, :CTAINVEN' +
        'TARIO, '
      
        '   :CTAVENTA, :CTACOMPRA, :CODSUBCATEGORIA, :CODCATEGORIA, :PORC' +
        'ITBIS, '
      
        '   :COD_MONEDA, :KILOMETROS, :RUTAIMAGEN, :IDTASAITBIS, :PRECIO_' +
        'ALQUILER, '
      '   :PAGACOMISION)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  CODIGO_TEXTO,'
      '  FECHA,'
      '  CODIGO_BARRA,'
      '  TIPO,'
      '  DESCRIPCION,'
      '  DESCRIPCIONADICIONAL,'
      '  CANTIDAD_REORDEN,'
      '  PRECIO_ANT,'
      '  CANTIDAD,'
      '  PRECIO,'
      '  BLCE_CANT_ENTRADA,'
      '  BLCE_CANT_SALIDA,'
      '  FECHA_ULTIMA_TRN,'
      '  STATUS,'
      '  PORC_DESCUENTO,'
      '  FOTO,'
      '  PAGA_ITBI,'
      '  CODIGO_PRECIO,'
      '  UNIDAD,'
      '  PRECIO_COMPRA,'
      '  PRECIO_MINIMO,'
      '  REFERENCIA,'
      '  FECHA_VENCIMIENTO,'
      '  INVENTARIAR,'
      '  PRECIO_TIPO_UNIDAD,'
      '  TIPO_UNIDAD,'
      '  ORIGEN,'
      '  UBICACION,'
      '  REFERENCIA_ALTERNA,'
      '  MARCA,'
      '  MODELO,'
      '  PRECIOVENTA1,'
      '  PRECIOVENTA2,'
      '  PRECIOVENTA3,'
      '  PRECIOVENTA4,'
      '  PORCUTILIDAD1,'
      '  PORCUTILIDAD2,'
      '  PORCUTILIDAD3,'
      '  PORCUTILIDAD4,'
      '  USARLEVELPRECIO,'
      '  CIA_KEY,'
      '  SITUACIONPROD,'
      '  APLICAIMPTOCOMPRA,'
      '  CODFABRICANTE,'
      '  CTAINVENTARIO,'
      '  CTAVENTA,'
      '  CTACOMPRA,'
      '  CODSUBCATEGORIA,'
      '  CODCATEGORIA,'
      '  PORCITBIS,'
      '  COD_MONEDA,'
      '  KILOMETROS,'
      '  RUTAIMAGEN,'
      '  IDTASAITBIS,'
      '  PRECIO_ALQUILER,'
      '  PAGACOMISION'
      'from INVENTARIO_PRODUCTO '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'Select i.* From INVENTARIO_PRODUCTO i'
      '')
    ModifySQL.Strings = (
      'update INVENTARIO_PRODUCTO'
      'set'
      '  CODIGO = :CODIGO,'
      '  CODIGO_TEXTO = :CODIGO_TEXTO,'
      '  FECHA = :FECHA,'
      '  CODIGO_BARRA = :CODIGO_BARRA,'
      '  TIPO = :TIPO,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  DESCRIPCIONADICIONAL = :DESCRIPCIONADICIONAL,'
      '  CANTIDAD_REORDEN = :CANTIDAD_REORDEN,'
      '  PRECIO_ANT = :PRECIO_ANT,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO = :PRECIO,'
      '  BLCE_CANT_ENTRADA = :BLCE_CANT_ENTRADA,'
      '  BLCE_CANT_SALIDA = :BLCE_CANT_SALIDA,'
      '  FECHA_ULTIMA_TRN = :FECHA_ULTIMA_TRN,'
      '  STATUS = :STATUS,'
      '  PORC_DESCUENTO = :PORC_DESCUENTO,'
      '  FOTO = :FOTO,'
      '  PAGA_ITBI = :PAGA_ITBI,'
      '  CODIGO_PRECIO = :CODIGO_PRECIO,'
      '  UNIDAD = :UNIDAD,'
      '  PRECIO_COMPRA = :PRECIO_COMPRA,'
      '  PRECIO_MINIMO = :PRECIO_MINIMO,'
      '  REFERENCIA = :REFERENCIA,'
      '  FECHA_VENCIMIENTO = :FECHA_VENCIMIENTO,'
      '  INVENTARIAR = :INVENTARIAR,'
      '  PRECIO_TIPO_UNIDAD = :PRECIO_TIPO_UNIDAD,'
      '  TIPO_UNIDAD = :TIPO_UNIDAD,'
      '  ORIGEN = :ORIGEN,'
      '  UBICACION = :UBICACION,'
      '  REFERENCIA_ALTERNA = :REFERENCIA_ALTERNA,'
      '  MARCA = :MARCA,'
      '  MODELO = :MODELO,'
      '  PRECIOVENTA1 = :PRECIOVENTA1,'
      '  PRECIOVENTA2 = :PRECIOVENTA2,'
      '  PRECIOVENTA3 = :PRECIOVENTA3,'
      '  PRECIOVENTA4 = :PRECIOVENTA4,'
      '  PORCUTILIDAD1 = :PORCUTILIDAD1,'
      '  PORCUTILIDAD2 = :PORCUTILIDAD2,'
      '  PORCUTILIDAD3 = :PORCUTILIDAD3,'
      '  PORCUTILIDAD4 = :PORCUTILIDAD4,'
      '  USARLEVELPRECIO = :USARLEVELPRECIO,'
      '  CIA_KEY = :CIA_KEY,'
      '  SITUACIONPROD = :SITUACIONPROD,'
      '  APLICAIMPTOCOMPRA = :APLICAIMPTOCOMPRA,'
      '  CODFABRICANTE = :CODFABRICANTE,'
      '  CTAINVENTARIO = :CTAINVENTARIO,'
      '  CTAVENTA = :CTAVENTA,'
      '  CTACOMPRA = :CTACOMPRA,'
      '  CODSUBCATEGORIA = :CODSUBCATEGORIA,'
      '  CODCATEGORIA = :CODCATEGORIA,'
      '  PORCITBIS = :PORCITBIS,'
      '  COD_MONEDA = :COD_MONEDA,'
      '  KILOMETROS = :KILOMETROS,'
      '  RUTAIMAGEN = :RUTAIMAGEN,'
      '  IDTASAITBIS = :IDTASAITBIS,'
      '  PRECIO_ALQUILER = :PRECIO_ALQUILER,'
      '  PAGACOMISION = :PAGACOMISION'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 192
    Top = 552
    object tblInvCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object tblInvCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object tblInvFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'INVENTARIO_PRODUCTO.FECHA'
    end
    object tblInvCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
    object tblInvTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object tblInvDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object tblInvDESCRIPCIONADICIONAL: TMemoField
      FieldName = 'DESCRIPCIONADICIONAL'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCIONADICIONAL'
      BlobType = ftMemo
      Size = 8
    end
    object tblInvCANTIDAD_REORDEN: TIntegerField
      FieldName = 'CANTIDAD_REORDEN'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD_REORDEN'
    end
    object tblInvPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ANT'
    end
    object tblInvCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object tblInvPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object tblInvBLCE_CANT_ENTRADA: TFloatField
      FieldName = 'BLCE_CANT_ENTRADA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_ENTRADA'
    end
    object tblInvBLCE_CANT_SALIDA: TFloatField
      FieldName = 'BLCE_CANT_SALIDA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_SALIDA'
    end
    object tblInvFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN'
    end
    object tblInvSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INVENTARIO_PRODUCTO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblInvPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'INVENTARIO_PRODUCTO.PORC_DESCUENTO'
    end
    object tblInvFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'INVENTARIO_PRODUCTO.FOTO'
      Size = 8
    end
    object tblInvPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
    end
    object tblInvCODIGO_PRECIO: TIBStringField
      FieldName = 'CODIGO_PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_PRECIO'
      FixedChar = True
      Size = 6
    end
    object tblInvUNIDAD: TFloatField
      FieldName = 'UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.UNIDAD'
    end
    object tblInvPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object tblInvPRECIO_MINIMO: TFloatField
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
    object tblInvREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object tblInvFECHA_VENCIMIENTO: TDateTimeField
      FieldName = 'FECHA_VENCIMIENTO'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_VENCIMIENTO'
    end
    object tblInvINVENTARIAR: TSmallintField
      FieldName = 'INVENTARIAR'
      Origin = 'INVENTARIO_PRODUCTO.INVENTARIAR'
    end
    object tblInvPRECIO_TIPO_UNIDAD: TFloatField
      FieldName = 'PRECIO_TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_TIPO_UNIDAD'
    end
    object tblInvTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.TIPO_UNIDAD'
    end
    object tblInvORIGEN: TIntegerField
      FieldName = 'ORIGEN'
      Origin = 'INVENTARIO_PRODUCTO.ORIGEN'
    end
    object tblInvUBICACION: TIBStringField
      FieldName = 'UBICACION'
      Origin = 'INVENTARIO_PRODUCTO.UBICACION'
      Size = 50
    end
    object tblInvREFERENCIA_ALTERNA: TIBStringField
      FieldName = 'REFERENCIA_ALTERNA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA_ALTERNA'
      Size = 50
    end
    object tblInvMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'INVENTARIO_PRODUCTO.MARCA'
      Size = 50
    end
    object tblInvMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'INVENTARIO_PRODUCTO.MODELO'
      Size = 50
    end
    object tblInvPRECIOVENTA1: TFloatField
      FieldName = 'PRECIOVENTA1'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA1'
    end
    object tblInvPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA2'
    end
    object tblInvPRECIOVENTA3: TFloatField
      FieldName = 'PRECIOVENTA3'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA3'
    end
    object tblInvPRECIOVENTA4: TFloatField
      FieldName = 'PRECIOVENTA4'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA4'
    end
    object tblInvPORCUTILIDAD1: TFloatField
      FieldName = 'PORCUTILIDAD1'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD1'
    end
    object tblInvPORCUTILIDAD2: TFloatField
      FieldName = 'PORCUTILIDAD2'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD2'
    end
    object tblInvPORCUTILIDAD3: TFloatField
      FieldName = 'PORCUTILIDAD3'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD3'
    end
    object tblInvPORCUTILIDAD4: TFloatField
      FieldName = 'PORCUTILIDAD4'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD4'
    end
    object tblInvUSARLEVELPRECIO: TSmallintField
      FieldName = 'USARLEVELPRECIO'
      Origin = 'INVENTARIO_PRODUCTO.USARLEVELPRECIO'
    end
    object tblInvCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'INVENTARIO_PRODUCTO.CIA_KEY'
    end
    object tblInvSITUACIONPROD: TSmallintField
      FieldName = 'SITUACIONPROD'
      Origin = 'INVENTARIO_PRODUCTO.SITUACIONPROD'
    end
    object tblInvAPLICAIMPTOCOMPRA: TSmallintField
      FieldName = 'APLICAIMPTOCOMPRA'
      Origin = 'INVENTARIO_PRODUCTO.APLICAIMPTOCOMPRA'
    end
    object tblInvCODFABRICANTE: TIntegerField
      FieldName = 'CODFABRICANTE'
      Origin = 'INVENTARIO_PRODUCTO.CODFABRICANTE'
    end
    object tblInvCTAINVENTARIO: TIBStringField
      FieldName = 'CTAINVENTARIO'
      Origin = 'INVENTARIO_PRODUCTO.CTAINVENTARIO'
      Size = 7
    end
    object tblInvCTAVENTA: TIBStringField
      FieldName = 'CTAVENTA'
      Origin = 'INVENTARIO_PRODUCTO.CTAVENTA'
      Size = 7
    end
    object tblInvCTACOMPRA: TIBStringField
      FieldName = 'CTACOMPRA'
      Origin = 'INVENTARIO_PRODUCTO.CTACOMPRA'
      Size = 7
    end
    object tblInvCODSUBCATEGORIA: TIntegerField
      FieldName = 'CODSUBCATEGORIA'
      Origin = 'INVENTARIO_PRODUCTO.CODSUBCATEGORIA'
    end
    object tblInvCODCATEGORIA: TIntegerField
      FieldName = 'CODCATEGORIA'
      Origin = 'INVENTARIO_PRODUCTO.CODCATEGORIA'
    end
    object tblInvPORCITBIS: TFloatField
      FieldName = 'PORCITBIS'
      Origin = 'INVENTARIO_PRODUCTO.PORCITBIS'
    end
    object tblInvCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'INVENTARIO_PRODUCTO.COD_MONEDA'
      FixedChar = True
      Size = 1
    end
    object tblInvKILOMETROS: TFloatField
      FieldName = 'KILOMETROS'
      Origin = 'INVENTARIO_PRODUCTO.KILOMETROS'
    end
    object tblInvRUTAIMAGEN: TIBStringField
      FieldName = 'RUTAIMAGEN'
      Origin = 'INVENTARIO_PRODUCTO.RUTAIMAGEN'
      Size = 200
    end
    object tblInvIDTASAITBIS: TSmallintField
      FieldName = 'IDTASAITBIS'
      Origin = 'INVENTARIO_PRODUCTO.IDTASAITBIS'
    end
    object tblInvPRECIO_ALQUILER: TFloatField
      FieldName = 'PRECIO_ALQUILER'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ALQUILER'
    end
    object tblInvPAGACOMISION: TSmallintField
      FieldName = 'PAGACOMISION'
      Origin = 'INVENTARIO_PRODUCTO.PAGACOMISION'
    end
  end
  object DataSource2: TDataSource
    DataSet = tblInv
    Left = 544
    Top = 376
  end
  object qryDiasConVentas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select distinct fecha from ventas_mast'
      'order by fecha desc')
    Left = 736
    Top = 160
    object qryDiasConVentasFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
      DisplayFormat = 'mm/dd/yyyy'
    end
  end
  object DataSource3: TDataSource
    DataSet = qryDiasConVentas
    Left = 632
    Top = 296
  end
  object qryVtaResBase: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      'VENTAS_MAST.FORMA_PAGO,'
      'VENTAS_DET.LOT_NUM,'
      'VENTAS_DET.CODIGO_PROD,'
      'VENTAS_DET.DESCRIPCION,'
      'UNIDADES.DESCRIPCION unidad,'
      'UNIDADES.CANTIDAD CantUnidad,'
      'sum(VENTAS_DET.CANTIDAD) Cantidad'
      'FROM  '
      '  VENTAS_MAST'
      
        '  INNER JOIN VENTAS_DET ON (VENTAS_MAST.NUMERO = VENTAS_DET.NUME' +
        'RO)'
      
        '  inner join INVENTARIO_PRODUCTO i on i.CODIGO = ventas_Det.CODI' +
        'GO_PROD'
      
        '  LEFT OUTER JOIN UNIDADES ON (VENTAS_DET.TIPO_UNIDAD = UNIDADES' +
        '.IDUNIDAD)')
    Left = 840
    Top = 64
  end
  object qryVtaRes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryVtaResAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      'VENTAS_MAST.FORMA_PAGO,'
      'VENTAS_DET.LOT_NUM,'
      'VENTAS_DET.CODIGO_PROD,'
      'VENTAS_DET.DESCRIPCION,'
      'UNIDADES.DESCRIPCION unidad,'
      'UNIDADES.CANTIDAD CantUnidad,'
      'sum(VENTAS_DET.CANTIDAD) Cantidad'
      'FROM  '
      '  VENTAS_MAST'
      
        '  INNER JOIN VENTAS_DET ON (VENTAS_MAST.NUMERO = VENTAS_DET.NUME' +
        'RO)'
      
        '  inner join INVENTARIO_PRODUCTO i on i.CODIGO = ventas_Det.CODI' +
        'GO_PROD'
      
        '  LEFT OUTER JOIN UNIDADES ON (VENTAS_DET.TIPO_UNIDAD = UNIDADES' +
        '.IDUNIDAD)'
      'group by '
      'VENTAS_MAST.FORMA_PAGO,'
      'VENTAS_DET.LOT_NUM,'
      'VENTAS_DET.CODIGO_PROD,'
      'VENTAS_DET.DESCRIPCION,'
      'UNIDADES.DESCRIPCION,'
      'UNIDADES.CANTIDAD'
      'order by VENTAS_DET.DESCRIPCION')
    Left = 1024
    Top = 96
    object qryVtaResFORMA_PAGO: TSmallintField
      DisplayWidth = 15
      FieldName = 'FORMA_PAGO'
      Origin = 'VENTAS_MAST.FORMA_PAGO'
    end
    object qryVtaResLOT_NUM: TIntegerField
      DisplayWidth = 12
      FieldName = 'LOT_NUM'
      Origin = 'VENTAS_DET.LOT_NUM'
    end
    object qryVtaResCODIGO_PROD: TIBStringField
      DisplayWidth = 20
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryVtaResDESCRIPCION: TIBStringField
      DisplayWidth = 28
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object qryVtaResUNIDAD: TIBStringField
      DisplayWidth = 21
      FieldName = 'UNIDAD'
      Size = 50
    end
    object qryVtaResCANTUNIDAD: TIntegerField
      DisplayWidth = 14
      FieldName = 'CANTUNIDAD'
    end
    object qryVtaResCANTIDAD: TFloatField
      DisplayWidth = 12
      FieldName = 'CANTIDAD'
    end
  end
  object DataSource4: TDataSource
    DataSet = qryVtaRes
    Left = 704
    Top = 376
  end
  object qryVtas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select VENTAS_DET.*'
      'FROM  '
      '  VENTAS_MAST'
      
        '  INNER JOIN VENTAS_DET ON (VENTAS_MAST.NUMERO = VENTAS_DET.NUME' +
        'RO)  '
      'where VENTAS_DET.CODIGO_PROD =:codigoprod')
    Left = 864
    Top = 552
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoprod'
        ParamType = ptInput
      end>
    object qryVtasSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET.SERIE'
      Required = True
    end
    object qryVtasNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_DET.NUMERO'
      Required = True
    end
    object qryVtasCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryVtasCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VENTAS_DET.CODIGO_BARRA'
    end
    object qryVtasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object qryVtasCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET.CANTIDAD'
    end
    object qryVtasPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET.PRECIO'
    end
    object qryVtasPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET.PORC_DESC_DET'
    end
    object qryVtasITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET.ITBI_DET'
    end
    object qryVtasVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET.VALOR_SERVICIO_DET'
    end
    object qryVtasVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_DET.VALOR_TOTAL_DET'
    end
    object qryVtasNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VENTAS_DET.NUM_FACTURA'
    end
    object qryVtasSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryVtasFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_DET.FECHA_IN'
    end
    object qryVtasIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_DET.IN_POR'
      Size = 12
    end
    object qryVtasFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_DET.FECHA_MOD'
    end
    object qryVtasMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_DET.MOD_POR'
      Size = 12
    end
    object qryVtasCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VENTAS_DET.CANT_REGRESO'
    end
    object qryVtasCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VENTAS_DET.CANT_PROMO'
    end
    object qryVtasMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VENTAS_DET.MONTO_DIETA'
    end
    object qryVtasMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VENTAS_DET.MONTO_AJUSTE'
    end
    object qryVtasSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VENTAS_DET.SERIE_PROD'
      Size = 50
    end
    object qryVtasSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VENTAS_DET.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryVtasTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VENTAS_DET.TIPO_UNIDAD'
    end
    object qryVtasITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VENTAS_DET.ITBIS_EXENTO'
    end
    object qryVtasTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VENTAS_DET.TIPO_VENTA'
    end
    object qryVtasDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VENTAS_DET.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryVtasCOD_EMPLEADO_CONDUCTOR: TFloatField
      FieldName = 'COD_EMPLEADO_CONDUCTOR'
      Origin = 'VENTAS_DET.COD_EMPLEADO_CONDUCTOR'
    end
    object qryVtasPLACA_VEHICULO: TIBStringField
      FieldName = 'PLACA_VEHICULO'
      Origin = 'VENTAS_DET.PLACA_VEHICULO'
    end
    object qryVtasMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_DET.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryVtasMONTO_TASA: TFloatField
      FieldName = 'MONTO_TASA'
      Origin = 'VENTAS_DET.MONTO_TASA'
    end
    object qryVtasCAPACIDAD: TFloatField
      FieldName = 'CAPACIDAD'
      Origin = 'VENTAS_DET.CAPACIDAD'
    end
    object qryVtasCANT_VIAJES: TFloatField
      FieldName = 'CANT_VIAJES'
      Origin = 'VENTAS_DET.CANT_VIAJES'
    end
    object qryVtasCANT_METROS_CUBICO: TFloatField
      FieldName = 'CANT_METROS_CUBICO'
      Origin = 'VENTAS_DET.CANT_METROS_CUBICO'
    end
    object qryVtasFICHA_VEH: TIntegerField
      FieldName = 'FICHA_VEH'
      Origin = 'VENTAS_DET.FICHA_VEH'
    end
    object qryVtasIDZONA_ORIGEN: TIntegerField
      FieldName = 'IDZONA_ORIGEN'
      Origin = 'VENTAS_DET.IDZONA_ORIGEN'
    end
    object qryVtasIDZONA_DETALLE: TIntegerField
      FieldName = 'IDZONA_DETALLE'
      Origin = 'VENTAS_DET.IDZONA_DETALLE'
    end
    object qryVtasPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'VENTAS_DET.PRECIO_COMPRA'
    end
    object qryVtasCANT_CONDUCE: TFloatField
      FieldName = 'CANT_CONDUCE'
      Origin = 'VENTAS_DET.CANT_CONDUCE'
    end
    object qryVtasPORC_DESC_ITEM: TFloatField
      FieldName = 'PORC_DESC_ITEM'
      Origin = 'VENTAS_DET.PORC_DESC_ITEM'
    end
    object qryVtasMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VENTAS_DET.MONTO_DESC_ITEM'
    end
    object qryVtasITBIS_FISCAL_DET: TFloatField
      FieldName = 'ITBIS_FISCAL_DET'
      Origin = 'VENTAS_DET.ITBIS_FISCAL_DET'
    end
    object qryVtasIDTASAITBIS: TFloatField
      FieldName = 'IDTASAITBIS'
      Origin = 'VENTAS_DET.IDTASAITBIS'
    end
    object qryVtasMONTOIBISRECARGO: TFloatField
      FieldName = 'MONTOIBISRECARGO'
      Origin = 'VENTAS_DET.MONTOIBISRECARGO'
    end
    object qryVtasDC_ITBIS_CLD: TFloatField
      FieldName = 'DC_ITBIS_CLD'
      Origin = 'VENTAS_DET.DC_ITBIS_CLD'
    end
    object qryVtasTC_MONTOITBISRECARGO_GLB: TFloatField
      FieldName = 'TC_MONTOITBISRECARGO_GLB'
      Origin = 'VENTAS_DET.TC_MONTOITBISRECARGO_GLB'
    end
    object qryVtasTC_MONTOITBISRECARGO_ITM: TFloatField
      FieldName = 'TC_MONTOITBISRECARGO_ITM'
      Origin = 'VENTAS_DET.TC_MONTOITBISRECARGO_ITM'
    end
    object qryVtasNUM_CONDUCE_CTE: TIBStringField
      FieldName = 'NUM_CONDUCE_CTE'
      Origin = 'VENTAS_DET.NUM_CONDUCE_CTE'
      Size = 60
    end
    object qryVtasNUM_IDENT: TIBStringField
      FieldName = 'NUM_IDENT'
      Origin = 'VENTAS_DET.NUM_IDENT'
      Size = 40
    end
    object qryVtasLOT_NUM: TIntegerField
      FieldName = 'LOT_NUM'
      Origin = 'VENTAS_DET.LOT_NUM'
    end
    object qryVtasCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VENTAS_DET.CODIGO_VENDEDOR'
    end
    object qryVtasLEVEL_PRECIO_VENTA: TSmallintField
      FieldName = 'LEVEL_PRECIO_VENTA'
      Origin = 'VENTAS_DET.LEVEL_PRECIO_VENTA'
    end
  end
end
