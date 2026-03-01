object frmVacaciones: TfrmVacaciones
  Left = 233
  Top = 124
  Width = 928
  Height = 480
  Caption = 'Vacaciones'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 1
    Top = 40
    Width = 888
    Height = 377
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Record'
      object Label1: TLabel
        Left = 8
        Top = 48
        Width = 92
        Height = 13
        Caption = 'FECHA_EFECTIVA'
      end
      object Label2: TLabel
        Left = 120
        Top = 48
        Width = 37
        Height = 13
        Caption = 'Nombre'
      end
      object Label4: TLabel
        Left = 8
        Top = 8
        Width = 42
        Height = 13
        Caption = 'CODIGO'
        FocusControl = DBEdit2
      end
      object DBText1: TDBText
        Left = 120
        Top = 70
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'NOMBRECOMPLETO'
        DataSource = dmNomina.dsqryEmpleados
      end
      object DBStatusLabel1: TDBStatusLabel
        Left = 784
        Top = 88
        Width = 85
        Height = 13
        DatasetName = 'Trans'
        DataSource = dsQryVaca
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 24
        Width = 64
        Height = 21
        DataField = 'CODIGO'
        DataSource = dsQryVaca
        TabOrder = 0
      end
      object DBDateEdit2: TDBDateEdit
        Left = 8
        Top = 67
        Width = 97
        Height = 21
        Hint = 'Fecha en que se realizar'#225' el servicio'
        DataField = 'FECHA_EFECTIVA'
        DataSource = dsQryVaca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
      end
      object RxDBGrid2: TRxDBGrid
        Left = 0
        Top = 104
        Width = 880
        Height = 245
        Align = alCustom
        DataSource = dsQryVaca
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        MultiSelect = True
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_TRANS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_TIPO_TRANS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_TIPO_NOMINA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TRANS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_ENT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_SAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACIONES'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS_TRANS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_CTA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANT_DIAS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_EFECTIVA'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Examinar'
      ImageIndex = 1
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 880
        Height = 349
        Align = alClient
        DataSource = dsQryVaca
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_TRANS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_TIPO_TRANS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_TIPO_NOMINA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TRANS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_ENT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_SAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACIONES'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS_TRANS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_CTA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANT_DIAS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_EFECTIVA'
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 41
    Align = alTop
    TabOrder = 1
    object RxSpeedButton2: TRxSpeedButton
      Left = 104
      Top = 8
      Width = 85
      Height = 25
      Caption = '&Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      Layout = blGlyphLeft
      NumGlyphs = 2
      ParentFont = False
      Transparent = True
      OnClick = RxSpeedButton2Click
    end
    object BitBtn1: TBitBtn
      Left = 15
      Top = 8
      Width = 88
      Height = 25
      Caption = '&Integrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 278
      Top = 8
      Width = 85
      Height = 25
      Caption = '&Modificar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
    object BitBtn3: TBitBtn
      Left = 364
      Top = 8
      Width = 85
      Height = 25
      Caption = '&Guardar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
    object BitBtn5: TBitBtn
      Left = 450
      Top = 8
      Width = 85
      Height = 25
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn5Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
    end
    object BitBtn6: TBitBtn
      Left = 720
      Top = 8
      Width = 85
      Height = 25
      Caption = '&Salir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Kind = bkClose
    end
    object BitBtn4: TBitBtn
      Left = 190
      Top = 8
      Width = 88
      Height = 25
      Caption = 'I&nsertar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
    end
    object BitBtn7: TBitBtn
      Left = 541
      Top = 8
      Width = 85
      Height = 25
      Caption = '&Eliminar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = BitBtn7Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
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
    object BitBtn8: TBitBtn
      Left = 632
      Top = 8
      Width = 81
      Height = 25
      Caption = '&Refresh'
      TabOrder = 7
      OnClick = BitBtn8Click
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
  end
  object dsQryVaca: TDataSource
    DataSet = dmNomina.QryVaca
    Left = 448
    Top = 224
  end
  object Fecha: TGetAnyDate
    Fecha = 37091.000000000000000000
    VFechaF = True
    EligeTipo = False
    TipoRes = 0
    UsaFechaCierre = False
    Left = 32
    Top = 200
  end
end
