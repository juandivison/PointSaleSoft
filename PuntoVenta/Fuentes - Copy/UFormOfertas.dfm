object frmOfertas: TfrmOfertas
  Left = 368
  Top = 148
  Width = 804
  Height = 390
  Caption = 'frmOfertas'
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
    Width = 36
    Height = 13
    Caption = 'C'#243'digo '
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 103
    Top = 16
    Width = 56
    Height = 13
    Caption = 'Descripci'#243'n'
  end
  object Label3: TLabel
    Left = 432
    Top = 16
    Width = 89
    Height = 13
    Caption = 'Tipo Unidad Venta'
  end
  object Label4: TLabel
    Left = 306
    Top = 64
    Width = 74
    Height = 13
    Caption = 'Cantidad Oferta'
    FocusControl = DBEdit2
  end
  object Label5: TLabel
    Left = 608
    Top = 16
    Width = 90
    Height = 13
    Caption = 'Tipo Unidad Oferta'
  end
  object Label6: TLabel
    Left = 16
    Top = 64
    Width = 60
    Height = 13
    Caption = 'Fecha Inicial'
  end
  object Label7: TLabel
    Left = 147
    Top = 64
    Width = 55
    Height = 13
    Caption = 'Fecha Final'
  end
  object DBStatusLabel1: TDBStatusLabel
    Left = 704
    Top = 272
    Width = 85
    Height = 13
    DataSource = dmInventario.dstblOfertas
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 32
    Width = 81
    Height = 21
    DataField = 'CODIGO_PROD'
    DataSource = dmInventario.dstblOfertas
    TabOrder = 0
  end
  object DBDateEdit1: TDBDateEdit
    Left = 16
    Top = 80
    Width = 121
    Height = 21
    DataField = 'FECHA_INICIAL'
    DataSource = dmInventario.dstblOfertas
    NumGlyphs = 2
    TabOrder = 4
  end
  object DBDateEdit2: TDBDateEdit
    Left = 147
    Top = 80
    Width = 121
    Height = 21
    DataField = 'FECHA_FINAL'
    DataSource = dmInventario.dstblOfertas
    NumGlyphs = 2
    TabOrder = 5
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 103
    Top = 32
    Width = 321
    Height = 21
    DropDownCount = 8
    DataField = 'CODIGO_PROD'
    DataSource = dmInventario.dstblOfertas
    LookupField = 'CODIGO'
    LookupDisplay = 'DESCRIPCION'
    LookupSource = dsqryInvOfertaLookup
    TabOrder = 1
    OnChange = RxDBLookupCombo1Change
  end
  object RxDBLookupCombo2: TRxDBLookupCombo
    Left = 432
    Top = 32
    Width = 169
    Height = 21
    DropDownCount = 8
    DataField = 'TIPO_UNIDADVTA'
    DataSource = dmInventario.dstblOfertas
    LookupField = 'IDUNIDAD'
    LookupDisplay = 'DESC_UNIDAD'
    LookupSource = dsqryTipoUnidadVta
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 306
    Top = 80
    Width = 77
    Height = 21
    DataField = 'CANTIDAD'
    DataSource = dmInventario.dstblOfertas
    TabOrder = 6
  end
  object RxDBLookupCombo3: TRxDBLookupCombo
    Left = 608
    Top = 32
    Width = 167
    Height = 21
    DropDownCount = 8
    DataField = 'TIPO_UNIDADOFTA'
    DataSource = dmInventario.dstblOfertas
    LookupField = 'IDUNIDAD'
    LookupDisplay = 'DESC_UNIDAD'
    LookupSource = dsqryTipoUnidadOferta
    TabOrder = 3
  end
  object RxDBGrid1: TRxDBGrid
    Left = 16
    Top = 112
    Width = 761
    Height = 153
    DataSource = dmInventario.dstblOfertas
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_PROD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_INICIAL'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_FINAL'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_UNIDADVTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_UNIDADOFTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_ULT_TRN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT_ACUM_SALIDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 302
    Width = 796
    Height = 57
    Align = alBottom
    Color = 10547677
    TabOrder = 8
    object btnInsertar: TBitBtn
      Tag = 4012
      Left = 100
      Top = 10
      Width = 88
      Height = 35
      Caption = '&Insertar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnInsertarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
    object btnModificar: TBitBtn
      Tag = 4023
      Left = 195
      Top = 10
      Width = 90
      Height = 35
      Cancel = True
      Caption = '&Modificar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnModificarClick
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        000808888888888888080808080808080808000000000000000880EFEFEFEF08
        888880F0000EF088888880E080EF0088888880F00EF08008888880E0EF088000
        888880FEF08880B7088880EF088880B8088880F08888880B708880088888880B
        008880888888888019088888888888800088}
      NumGlyphs = 2
    end
    object btnSalvar: TBitBtn
      Tag = 4033
      Left = 293
      Top = 10
      Width = 90
      Height = 35
      Caption = '&Guardar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnSalvarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancelar: TBitBtn
      Tag = 4041
      Left = 390
      Top = 10
      Width = 90
      Height = 35
      Caption = '&Cancelar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        300033FFFFFF3333377739999993333333333777777F3333333F399999933333
        3300377777733333337733333333333333003333333333333377333333333333
        3333333333333333333F333333333333330033333F33333333773333C3333333
        330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
        333333377F33333333FF3333C333333330003333733333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object btnCerarAbrirres: TBitBtn
      Tag = 4056
      Left = 486
      Top = 10
      Width = 95
      Height = 35
      Caption = '&Refrescar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnCerarAbrirresClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
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
    object BitBtn2: TBitBtn
      Left = 601
      Top = 10
      Width = 90
      Height = 35
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Kind = bkClose
    end
  end
  object BitBtn1: TBitBtn
    Left = 699
    Top = 83
    Width = 75
    Height = 25
    Caption = '&Buscar'
    TabOrder = 9
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
  object CheckBox1: TCheckBox
    Left = 392
    Top = 88
    Width = 97
    Height = 17
    Caption = 'Mostrar Todo'
    TabOrder = 10
    OnClick = CheckBox1Click
  end
  object dsqryInvOfertaLookup: TDataSource
    DataSet = dmInventario.qryInvOfertaLookup
    Left = 400
    Top = 168
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 300
    Top = 169
  end
  object dsqryTipoUnidadVta: TDataSource
    DataSet = dmInventario.qryTipoUnidadVta
    Left = 624
    Top = 160
  end
  object dsqryTipoUnidadOferta: TDataSource
    DataSet = dmInventario.qryTipoUnidadOferta
    Left = 624
    Top = 216
  end
end
