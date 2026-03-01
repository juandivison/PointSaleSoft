object frmDespachoInvAlmacen: TfrmDespachoInvAlmacen
  Left = 202
  Top = 125
  Width = 756
  Height = 566
  Caption = 'Procesar Despachos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Inventario: TLabel
    Left = 8
    Top = 8
    Width = 81
    Height = 13
    Caption = 'Inventario Origen'
  end
  object Label1: TLabel
    Left = 200
    Top = 8
    Width = 86
    Height = 13
    Caption = 'Inventario Destino'
  end
  object Label6: TLabel
    Left = 8
    Top = 49
    Width = 61
    Height = 24
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 133
    Top = 77
    Width = 62
    Height = 20
    AutoSize = True
    DataField = 'DESCRIPCION'
    DataSource = dsqryInventario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8404992
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 8
    Top = 325
    Width = 77
    Height = 13
    Caption = 'Fecha vigente : '
  end
  object Label11: TLabel
    Left = 10
    Top = 309
    Width = 45
    Height = 13
    Caption = 'Usuario : '
  end
  object Label10: TLabel
    Left = 88
    Top = 325
    Width = 38
    Height = 13
    Caption = 'Label10'
  end
  object Label4: TLabel
    Left = 535
    Top = 273
    Width = 81
    Height = 24
    Caption = 'Sub-Total'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label7: TLabel
    Left = 489
    Top = 390
    Width = 133
    Height = 24
    Caption = 'Monto Recibido'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Label8: TLabel
    Left = 526
    Top = 444
    Width = 95
    Height = 24
    Caption = 'Devoluci'#243'n'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label13: TLabel
    Left = 588
    Top = 341
    Width = 32
    Height = 24
    Caption = 'Itbis'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label14: TLabel
    Left = 516
    Top = 294
    Width = 106
    Height = 24
    Caption = 'Monto Desc.'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label15: TLabel
    Left = 535
    Top = 416
    Width = 86
    Height = 24
    Caption = 'Total Neto'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText2: TDBText
    Left = 631
    Top = 272
    Width = 100
    Height = 19
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'SubTotal'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText3: TDBText
    Left = 631
    Top = 341
    Width = 100
    Height = 20
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'itbis'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText4: TDBText
    Left = 631
    Top = 296
    Width = 100
    Height = 18
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'montodesc'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText5: TDBText
    Left = 631
    Top = 416
    Width = 100
    Height = 23
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'totalneto'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText7: TDBText
    Left = 631
    Top = 444
    Width = 100
    Height = 21
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'devolucion'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label16: TLabel
    Left = 498
    Top = 320
    Width = 124
    Height = 16
    Caption = '% Desc. Adic./Monto'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText6: TDBText
    Left = 631
    Top = 365
    Width = 100
    Height = 22
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'MontoInteres'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Label17: TLabel
    Left = 520
    Top = 365
    Width = 103
    Height = 20
    Caption = 'Monto Interes.'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 469
    Top = 44
    Width = 38
    Height = 24
    Caption = 'Cant'
    FocusControl = DBEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 530
    Top = 44
    Width = 54
    Height = 24
    Caption = 'Precio'
    FocusControl = DBEdit2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 626
    Top = 44
    Width = 53
    Height = 24
    Caption = 'Monto'
    FocusControl = DBEdit3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 24
    Width = 185
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'ComboBox1'
    OnChange = ComboBox1Change
  end
  object ComboBox2: TComboBox
    Left = 200
    Top = 24
    Width = 185
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'ComboBox2'
    OnChange = ComboBox2Change
    OnExit = ComboBox2Exit
  end
  object edtCodigo: TEditN
    Left = 8
    Top = 74
    Width = 121
    Height = 32
    CharCase = ecUpperCase
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = edtCodigoChange
    OnEnter = edtCodigoEnter
    OnExit = edtCodigoExit
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
    ValueDate = 39484.000000000000000000
    ValueTime = 0.974691932870370400
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object chkMostrarVistaproductos: TCheckBox
    Left = 8
    Top = 264
    Width = 135
    Height = 17
    Caption = 'Mostrar Vista Productos'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object LectorCodBarra1: TCheckBox
    Left = 8
    Top = 280
    Width = 129
    Height = 17
    Caption = 'Lector Codigo Barra'
    TabOrder = 5
  end
  object Edit1: TEdit
    Left = 631
    Top = 388
    Width = 100
    Height = 28
    Hint = 'Entre monto dinero entragado,para calcular devolucion'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
  end
  object DBEdit4: TDBEdit
    Left = 667
    Top = 317
    Width = 65
    Height = 21
    Color = clSilver
    DataField = 'MontoDescAdicional'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object DBEdit5: TDBEdit
    Left = 631
    Top = 317
    Width = 31
    Height = 21
    DataField = 'PorcDesAdicional'
    DataSource = dsTotales
    TabOrder = 8
  end
  object chkExento: TCheckBox
    Left = 528
    Top = 348
    Width = 55
    Height = 14
    Caption = 'E&xento'
    Color = 33023
    ParentColor = False
    TabOrder = 9
    OnClick = chkExentoClick
    OnEnter = chkExentoEnter
  end
  object RxDBGrid1: TRxDBGrid
    Left = 7
    Top = 105
    Width = 722
    Height = 153
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Serie'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fecha'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodArticulo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cant'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descripcion'
        ReadOnly = False
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'porc_desc'
        Title.Caption = '%Desc'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Precio'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoBruto'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoDescuento'
        Title.Caption = 'Descuento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Itbi'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoNeto'
        Width = 61
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 6
    Top = 105
    Width = 723
    Height = 155
    Caption = 'Panel2'
    TabOrder = 3
    Visible = False
    object RxDBGrid2: TRxDBGrid
      Left = 1
      Top = 1
      Width = 721
      Height = 153
      Cursor = crHandPoint
      Hint = 'Doble click asigna codigo'
      Align = alClient
      Color = 16773360
      DataSource = DataSource2
      FixedColor = 10866630
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = RxDBGrid2DblClick
      OnKeyDown = RxDBGrid2KeyDown
      OnKeyPress = RxDBGrid2KeyPress
      TitleButtons = True
      OnGetCellParams = RxDBGrid2GetCellParams
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO_TEXTO'
          Title.Caption = 'CodigoTexto'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_MINIMO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Title.Caption = 'Descripcion'
          Width = 251
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REFERENCIA'
          Title.Caption = 'Referencia'
          Width = 174
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 482
    Width = 748
    Height = 53
    Align = alBottom
    TabOrder = 11
    object BitBtn1: TBitBtn
      Left = 7
      Top = 7
      Width = 103
      Height = 37
      BiDiMode = bdLeftToRight
      Caption = '&NUEVO F2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 116
      Top = 7
      Width = 133
      Height = 37
      Hint = 'Cancelar Venta'
      Caption = '&CANCELAR F4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
    object BitBtn4: TBitBtn
      Left = 373
      Top = 7
      Width = 139
      Height = 37
      Caption = '&PROCESAR F5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn4Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object BitBtn5: TBitBtn
      Left = 254
      Top = 7
      Width = 113
      Height = 37
      Caption = '&BORRAR F9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn5Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
    object BitBtn7: TBitBtn
      Left = 633
      Top = 7
      Width = 108
      Height = 37
      Caption = '&Devoluci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Visible = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 517
      Top = 7
      Width = 110
      Height = 37
      Caption = '(&Re) Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn2Click
    end
  end
  object DBEdit1: TDBEdit
    Left = 468
    Top = 72
    Width = 55
    Height = 28
    DataField = 'Cant'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnEnter = DBEdit1Enter
    OnExit = DBEdit1Exit
  end
  object DBEdit2: TDBEdit
    Left = 528
    Top = 72
    Width = 91
    Height = 28
    DataField = 'Precio'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 13
    OnEnter = DBEdit2Enter
    OnExit = DBEdit2Exit
    OnKeyDown = FormKeyDown
  end
  object DBEdit3: TDBEdit
    Left = 623
    Top = 72
    Width = 110
    Height = 28
    DataField = 'MontoBruto'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 14
  end
  object tblDivInventarioOrigen: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DIVISION_INVENTARIO'
    Left = 72
    Top = 208
    object tblDivInventarioOrigenINVENTARIO_ID: TIntegerField
      FieldName = 'INVENTARIO_ID'
    end
    object tblDivInventarioOrigenDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object tblDivInventarioDestino: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DIVISION_INVENTARIO'
    Left = 176
    Top = 176
    object tblDivInventarioDestinoINVENTARIO_ID: TIntegerField
      FieldName = 'INVENTARIO_ID'
    end
    object tblDivInventarioDestinoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object qryInventario: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From INVENTARIO_PRODUCTO')
    Left = 136
    Top = 120
    object qryInventarioCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInventarioCODIGO_TEXTO: TIBStringField
      DisplayLabel = 'CodigoTexto'
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryInventarioFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'INVENTARIO_PRODUCTO.FECHA'
    end
    object qryInventarioCODIGO_BARRA: TIBStringField
      DisplayLabel = 'CodBarra'
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
    object qryInventarioTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object qryInventarioDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryInventarioCANTIDAD_REORDEN: TIntegerField
      FieldName = 'CANTIDAD_REORDEN'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD_REORDEN'
    end
    object qryInventarioPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ANT'
    end
    object qryInventarioCANTIDAD: TFloatField
      DisplayLabel = 'Cant'
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryInventarioPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryInventarioBLCE_CANT_ENTRADA: TFloatField
      FieldName = 'BLCE_CANT_ENTRADA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_ENTRADA'
    end
    object qryInventarioBLCE_CANT_SALIDA: TFloatField
      FieldName = 'BLCE_CANT_SALIDA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_SALIDA'
    end
    object qryInventarioFECHA_ULTIMA_TRN: TDateTimeField
      DisplayLabel = 'Fecha Ult Trn'
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN'
    end
    object qryInventarioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INVENTARIO_PRODUCTO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryInventarioPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'INVENTARIO_PRODUCTO.PORC_DESCUENTO'
    end
    object qryInventarioFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'INVENTARIO_PRODUCTO.FOTO'
      Size = 8
    end
    object qryInventarioPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
    end
    object qryInventarioCODIGO_PRECIO: TIBStringField
      FieldName = 'CODIGO_PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_PRECIO'
      FixedChar = True
      Size = 6
    end
    object qryInventarioUNIDAD: TFloatField
      FieldName = 'UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.UNIDAD'
    end
    object qryInventarioPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryInventarioPRECIO_MINIMO: TFloatField
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
    object qryInventarioREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object qryInventarioFECHA_VENCIMIENTO: TDateTimeField
      FieldName = 'FECHA_VENCIMIENTO'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_VENCIMIENTO'
    end
    object qryInventarioINVENTARIAR: TSmallintField
      FieldName = 'INVENTARIAR'
      Origin = 'INVENTARIO_PRODUCTO.INVENTARIAR'
    end
  end
  object dsqryInventario: TDataSource
    DataSet = qryInventario
    Left = 240
    Top = 120
  end
  object qryProductos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *  From INVENTARIO_PRODUCTO'
      'ORDER BY tipo,descripcion, Referencia, codigo')
    Left = 320
    Top = 134
    object qryProductosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryProductosCODIGO_TEXTO: TIBStringField
      DisplayWidth = 40
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryProductosCANTIDAD: TFloatField
      DisplayLabel = 'Cant'
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryProductosPRECIO_MINIMO: TFloatField
      DisplayLabel = 'Precio Minimo'
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
    object qryProductosPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryProductosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryProductosREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object qryProductosINVENTARIAR: TSmallintField
      FieldName = 'INVENTARIAR'
      Origin = 'INVENTARIO_PRODUCTO.INVENTARIAR'
    end
    object qryProductosPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
    end
  end
  object rxVenta: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Serie'
        DataType = ftInteger
      end
      item
        Name = 'Fecha'
        DataType = ftDateTime
      end
      item
        Name = 'Cant'
        DataType = ftFloat
      end
      item
        Name = 'Precio'
        DataType = ftCurrency
      end
      item
        Name = 'MontoBruto'
        DataType = ftCurrency
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Devolucion'
        DataType = ftCurrency
      end
      item
        Name = 'MontoNeto'
        DataType = ftCurrency
      end
      item
        Name = 'CodUsuario'
        DataType = ftInteger
      end
      item
        Name = 'CodArticulo'
        DataType = ftInteger
      end
      item
        Name = 'NumeroRecibo'
        DataType = ftInteger
      end
      item
        Name = 'CodTexto'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NCF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NumeroTrn'
        DataType = ftInteger
      end
      item
        Name = 'porc_desc'
        DataType = ftFloat
      end
      item
        Name = 'Itbi'
        DataType = ftFloat
      end
      item
        Name = 'MontoDescuento'
        DataType = ftFloat
      end
      item
        Name = 'SerieProd'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NumeroFactura'
        DataType = ftInteger
      end
      item
        Name = 'Invetariar'
        DataType = ftSmallint
      end
      item
        Name = 'loteNum'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'MontoItbisenPrecio'
        DataType = ftCurrency
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NumeroDoc'
        DataType = ftInteger
      end>
    BeforePost = rxVentaBeforePost
    AfterPost = rxVentaAfterPost
    Left = 369
    Top = 76
    object rxVentaSerie: TIntegerField
      FieldName = 'Serie'
    end
    object rxVentaFecha: TDateTimeField
      FieldName = 'Fecha'
    end
    object rxVentaCant: TFloatField
      FieldName = 'Cant'
    end
    object rxVentaPrecio: TCurrencyField
      FieldName = 'Precio'
      DisplayFormat = ',0.00'
    end
    object rxVentaMontoBruto: TCurrencyField
      FieldName = 'MontoBruto'
    end
    object rxVentaDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 40
    end
    object rxVentaDevolucion: TCurrencyField
      FieldName = 'Devolucion'
      DisplayFormat = ',0.00'
    end
    object rxVentaMontoNeto: TCurrencyField
      FieldName = 'MontoNeto'
      DisplayFormat = ',0.00'
    end
    object rxVentaCodUsuario: TIntegerField
      FieldName = 'CodUsuario'
    end
    object rxVentaCodArticulo: TIntegerField
      FieldName = 'CodArticulo'
    end
    object rxVentaNumeroRecibo: TIntegerField
      FieldName = 'NumeroRecibo'
    end
    object rxVentaCodTexto: TStringField
      DisplayWidth = 40
      FieldName = 'CodTexto'
      Size = 40
    end
    object rxVentaNCF: TStringField
      FieldName = 'NCF'
    end
    object rxVentaNumeroTrn: TIntegerField
      FieldName = 'NumeroTrn'
    end
    object rxVentaporc_desc: TFloatField
      FieldName = 'porc_desc'
    end
    object rxVentaItbi: TFloatField
      FieldName = 'Itbi'
      DisplayFormat = ',0.00'
    end
    object rxVentaMontoDescuento: TFloatField
      FieldName = 'MontoDescuento'
      DisplayFormat = ',0.00'
    end
    object rxVentaSerieProd: TStringField
      FieldName = 'SerieProd'
      Size = 50
    end
    object rxVentaNumeroFactura: TIntegerField
      FieldName = 'NumeroFactura'
    end
    object rxVentaInvetariar: TSmallintField
      FieldName = 'Invetariar'
    end
    object rxVentaloteNum: TStringField
      FieldName = 'loteNum'
      Size = 25
    end
    object rxVentaMontoItbisenPrecio: TCurrencyField
      FieldName = 'MontoItbisenPrecio'
    end
    object rxVentaReferencia: TStringField
      FieldName = 'Referencia'
      Size = 30
    end
    object rxVentaNumeroDoc: TIntegerField
      FieldName = 'NumeroDoc'
    end
  end
  object qryProdSerie: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From INVENTARIO_SERIE'
      'Where Codigo=:codigo')
    Left = 328
    Top = 190
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptInput
      end>
    object qryProdSerieCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_SERIE.CODIGO'
      Required = True
    end
    object qryProdSerieSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'INVENTARIO_SERIE.SERIE'
      Required = True
      Size = 50
    end
    object qryProdSerieSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INVENTARIO_SERIE.STATUS'
      Size = 1
    end
  end
  object Totales: TRxMemoryData
    FieldDefs = <
      item
        Name = 'SubTotal'
        DataType = ftFloat
      end
      item
        Name = 'itbis'
        DataType = ftFloat
      end
      item
        Name = 'montodesc'
        DataType = ftFloat
      end
      item
        Name = 'totalneto'
        DataType = ftFloat
      end
      item
        Name = 'montorecibido'
        DataType = ftFloat
      end
      item
        Name = 'devolucion'
        DataType = ftFloat
      end
      item
        Name = 'CodCliente'
        DataType = ftInteger
      end
      item
        Name = 'NombreCliente'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Direccion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Telefono'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'PorcDesAdicional'
        DataType = ftFloat
      end
      item
        Name = 'MontoDescAdicional'
        DataType = ftFloat
      end
      item
        Name = 'ncf_numero'
        DataType = ftString
        Size = 19
      end
      item
        Name = 'MontoInteres'
        DataType = ftCurrency
      end
      item
        Name = 'PorcientoInteres'
        DataType = ftFloat
      end
      item
        Name = 'qrLabelNcfDesc'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'Rnc_Numero'
        DataType = ftString
        Size = 15
      end>
    Left = 192
    Top = 260
    object TotalesSubTotal: TFloatField
      FieldName = 'SubTotal'
      DisplayFormat = ',0.00'
    end
    object Totalesitbis: TFloatField
      FieldName = 'itbis'
      DisplayFormat = ',0.00'
    end
    object Totalesmontodesc: TFloatField
      FieldName = 'montodesc'
      DisplayFormat = ',0.00'
    end
    object Totalestotalneto: TFloatField
      FieldName = 'totalneto'
      DisplayFormat = ',0.00'
      currency = True
    end
    object Totalesmontorecibido: TFloatField
      FieldName = 'montorecibido'
      DisplayFormat = ',0.00'
    end
    object Totalesdevolucion: TFloatField
      FieldName = 'devolucion'
      DisplayFormat = ',0.00'
    end
    object TotalesCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object TotalesNombreCliente: TStringField
      FieldName = 'NombreCliente'
      Size = 60
    end
    object TotalesDireccion: TStringField
      FieldName = 'Direccion'
      Size = 50
    end
    object TotalesTelefono: TStringField
      FieldName = 'Telefono'
      Size = 18
    end
    object TotalesPorcDesAdicional: TFloatField
      FieldName = 'PorcDesAdicional'
      DisplayFormat = ',0'
    end
    object TotalesMontoDescAdicional: TFloatField
      FieldName = 'MontoDescAdicional'
    end
    object Totalesncf_numero: TStringField
      FieldName = 'ncf_numero'
      Size = 19
    end
    object TotalesMontoInteres: TCurrencyField
      FieldName = 'MontoInteres'
    end
    object TotalesPorcientoInteres: TFloatField
      FieldName = 'PorcientoInteres'
      DisplayFormat = '%0,'
    end
    object TotalesqrLabelNcfDesc: TStringField
      FieldName = 'qrLabelNcfDesc'
      Size = 36
    end
    object TotalesRnc_Numero: TStringField
      FieldName = 'Rnc_Numero'
      Size = 15
    end
  end
  object dsTotales: TDataSource
    AutoEdit = False
    DataSet = Totales
    Left = 192
    Top = 310
  end
  object DataSource2: TDataSource
    DataSet = qryProductos
    Left = 248
    Top = 205
  end
  object stpMantInvAlmacen: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_MANT_INVENTARIO_ALMACEN'
    Left = 504
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INVENTARIO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end>
  end
  object stpProcInsDespachoDet: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INS_DESPACHO_DET'
    Left = 312
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SERIE_TRNS'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_TRN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ITBI_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_BRUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTAL_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUM_ORDEN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS_DET'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRIPCION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'RECARGA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANT_UNIDADES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UNIDADID'
        ParamType = ptInput
      end>
  end
  object DataSource1: TDataSource
    DataSet = rxVenta
    Left = 416
    Top = 148
  end
  object procUpdateDespSerieInvIDAlmacen: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_UPDTESECDESP_ALMCEN '
    Left = 312
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SECUENCIA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'INVTIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
  end
  object stpProcInsDespachoMaster: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INS_DESPACHO_MASTER'
    Left = 88
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SERIE_TRNS'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'NUMORDEN'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_TRN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_DESPACHADOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_EMP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_TOTAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_RUTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_CONDUCE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_PROV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NCF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RNC_PROVEEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INVENTARIO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SERIE_INV_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INV_ID_ORIGEN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INV_ID_DESTINO'
        ParamType = ptInput
      end>
  end
  object ibStpActualizaInvProd: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_ACTUALIZAINVENTARIO'
    Left = 376
    Top = 273
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
end
