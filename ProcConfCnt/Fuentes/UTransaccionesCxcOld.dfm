object frmTransaccionesCxc: TfrmTransaccionesCxc
  Left = 219
  Top = 75
  Width = 679
  Height = 544
  VertScrollBar.Position = 262
  Caption = 'Transacciones Cxc'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = -262
    Width = 654
    Height = 41
    Align = alTop
    Color = 8421440
    TabOrder = 0
    object btnSalvar: TBitBtn
      Left = 148
      Top = 8
      Width = 61
      Height = 25
      Caption = '&Salvar'
      Default = True
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
    object btnCerarAbrirres: TBitBtn
      Left = 296
      Top = 6
      Width = 79
      Height = 25
      Caption = '&Refrescar'
      TabOrder = 3
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
    object btnModificar: TBitBtn
      Left = 79
      Top = 8
      Width = 65
      Height = 25
      Cancel = True
      Caption = '&Modificar'
      TabOrder = 1
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
    object btnCancelar: TBitBtn
      Left = 216
      Top = 7
      Width = 71
      Height = 25
      Caption = '&Cancelar'
      Default = True
      TabOrder = 4
      OnClick = btnCancelarClick
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
    object btnInsertar: TBitBtn
      Left = 8
      Top = 8
      Width = 65
      Height = 25
      Caption = '&Insertar'
      TabOrder = 0
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
    object BitBtn3: TBitBtn
      Left = 546
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cl&ose'
      TabOrder = 5
      Kind = bkClose
    end
    object BitBtn4: TBitBtn
      Left = 386
      Top = 5
      Width = 75
      Height = 25
      Caption = 'R&eporte'
      TabOrder = 6
      OnClick = BitBtn4Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
    object edtCodCteRep: TEditN
      Left = 464
      Top = 7
      Width = 65
      Height = 21
      Hint = 'Indique Codigo de Cliente Para Reporte'
      Color = clSilver
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      ColorOnFocus = clYellow
      ColorOnNotFocus = clWhite
      FontColorOnFocus = clRed
      FontColorOnNotFocus = clBlack
      FontColorOnOverWrite = clBlue
      EditType = etInteger
      EditKeyByTab = #9
      EditAlign = etAlignNone
      EditLengthAlign = 0
      EditPrecision = 0
      ValueInteger = 0
      ValueDate = 37759.000000000000000000
      ValueTime = 0.552690486111111200
      TimeSeconds = False
      FirstCharUpper = False
      FirstCharUpList = ' ('
      WidthOnFocus = 0
      TextHint = True
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = -221
    Width = 654
    Height = 731
    ActivePage = tabRecord
    Align = alClient
    TabOrder = 1
    object tabRecord: TTabSheet
      Caption = 'Record'
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 646
        Height = 703
        Align = alClient
        PopupMenu = PopupMenu1
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 1
          Width = 24
          Height = 13
          Caption = 'Serie'
        end
        object Label2: TLabel
          Left = 145
          Top = 132
          Width = 30
          Height = 13
          Caption = 'Fecha'
        end
        object Label4: TLabel
          Left = 250
          Top = 177
          Width = 30
          Height = 13
          Caption = 'Monto'
        end
        object Label5: TLabel
          Left = 114
          Top = 231
          Width = 30
          Height = 13
          Caption = 'Status'
        end
        object DBStatusLabel1: TDBStatusLabel
          Left = 472
          Top = 274
          Width = 85
          Height = 13
          DatasetName = 'Trans.Cxc'
        end
        object Label16: TLabel
          Left = 9
          Top = 177
          Width = 46
          Height = 13
          Caption = 'Concepto'
        end
        object Label18: TLabel
          Left = 248
          Top = 0
          Width = 39
          Height = 13
          Caption = 'Moneda'
        end
        object Label19: TLabel
          Left = 143
          Top = 1
          Width = 21
          Height = 13
          Caption = 'Tipo'
        end
        object Label24: TLabel
          Left = 8
          Top = 231
          Width = 55
          Height = 13
          Caption = 'Documento'
        end
        object Label13: TLabel
          Left = 249
          Top = 89
          Width = 68
          Height = 13
          Caption = 'Codigo Cliente'
        end
        object Label3: TLabel
          Left = 9
          Top = 49
          Width = 37
          Height = 13
          Caption = 'TipoTnf'
        end
        object Label6: TLabel
          Left = 9
          Top = 89
          Width = 74
          Height = 13
          Caption = 'Codigo Servicio'
        end
        object Label7: TLabel
          Left = 145
          Top = 89
          Width = 38
          Height = 13
          Caption = 'Servicio'
        end
        object Label8: TLabel
          Left = 8
          Top = 134
          Width = 44
          Height = 13
          Caption = 'Tipo Doc'
        end
        object DBText1: TDBText
          Left = 144
          Top = 70
          Width = 42
          Height = 13
          AutoSize = True
          DataField = 'SERVDESCRIPCION'
        end
        object Label9: TLabel
          Left = 249
          Top = 133
          Width = 96
          Height = 13
          Caption = 'Descripcion Clientes'
        end
        object RxLabel1: TRxLabel
          Left = 376
          Top = 88
          Width = 74
          Height = 13
          Caption = 'Balance Actual'
        end
        object DBText2: TDBText
          Left = 376
          Top = 104
          Width = 89
          Height = 17
          Alignment = taRightJustify
          Color = 12058623
          DataField = 'BALANCE_ACT'
          DataSource = dsqryBalanceCtes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object tiempoIni: TLabel
          Left = 112
          Top = 216
          Width = 42
          Height = 13
          Caption = 'tiempoIni'
          Color = clRed
          ParentColor = False
          Visible = False
        end
        object tiempoFin: TLabel
          Left = 248
          Top = 216
          Width = 45
          Height = 13
          Caption = 'tiempoFin'
          Color = clLime
          ParentColor = False
          Visible = False
        end
        object rxdbboxmoneda: TRxDBComboBox
          Left = 248
          Top = 16
          Width = 96
          Height = 21
          Style = csDropDownList
          DataField = 'MONEDA'
          DataSource = dsqryTranCxc
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Pesos'
            'Dolares'
            'Euros')
          TabOrder = 0
          Values.Strings = (
            '1'
            '2'
            '3')
        end
        object RxDBComboBox1: TRxDBComboBox
          Left = 10
          Top = 65
          Width = 98
          Height = 21
          Style = csDropDownList
          DataField = 'TIPO_TRANF'
          DataSource = dsqryTranCxc
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Debito'
            'Credito'
            '')
          TabOrder = 1
          Values.Strings = (
            '1'
            '2')
        end
        object BitBtn1: TBitBtn
          Left = 173
          Top = 244
          Width = 88
          Height = 25
          Caption = '&Factura'
          TabOrder = 2
          OnClick = BitBtn1Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
            FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
            00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
            F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
            00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
            F033777777777337F73309999990FFF0033377777777FFF77333099999000000
            3333777777777777333333399033333333333337773333333333333903333333
            3333333773333333333333303333333333333337333333333333}
          NumGlyphs = 2
        end
        object DBNavigator2: TDBNavigator
          Left = 40
          Top = 295
          Width = 592
          Height = 32
          DataSource = dmCxc.dstblTransCxc
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Flat = True
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 3
        end
        object BitBtn2: TBitBtn
          Left = 272
          Top = 245
          Width = 57
          Height = 25
          Caption = 'Cnt'
          TabOrder = 4
          OnClick = BitBtn2Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            EFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
            DFDFDFDFDFDFDFDFDFDF7F7F7F7F7F7F40404040404040404040404040404040
            4040404040404040404040404040404040404040404040A0A0A0007F0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF00007F00A0A0A0007F0000FF0000DF2060A0A060A0A060A0A060A0A060
            A0A060A0A060808030505000404050909030EF30007F00A0A0A0003F00303030
            002020002020307070009F9F306F6F00202000000090909030AFAF30AFAF6080
            80005F5F305050A0A0A0003F00000000002020303030305050007F7F306F6F00
            0000508F8F30EFEF30909030CFCF60BFBF60DFDF303030A0A0A0003F00000000
            002020303030005F5F007F7F007F7F30303060DFDF60A0A030AFAF30CFCF3090
            9060BFBF606060A0A0A0003F00000000002020303030003F3F306F6F007F7F30
            3030009F9F009F9F60BFBF60DFDF60A0A030AFAF305050A0A0A0007F00000000
            000000303030306F6F306F6F306F6F00202030303000DFDF209F9F00BFBF00DF
            DF909090003F00A0A0A0007F00002020303030002020306F6F007F7F007F7F00
            2020002020306F30005F5F306F6F306F3000FF00007F00A0A0A0007F00000000
            000000002020306F6F306F6F007F7F305050002020007F0000FF0000FF0000FF
            0000FF00007F00A0A0A0007F00000000002020303030007F7F007F7F007F7F00
            3F3F002020007F0000FF0000FF0000FF0000FF00007F00A0A0A0007F0000FF00
            007F00007F00007F00007F00007F00007F00007F0000FF0000FF0000FF0000FF
            0000FF00007F00DFDFDF003F0000BF0000FF0000FF0000FF0000FF0000BF0000
            7F00007F00007F00007F00007F00007F00007F00003F00FFFFFFFFFFFF003F00
            00FF0000FF0000FF0000FF00003F00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        end
        object ProgressBar1: TProgressBar
          Left = 0
          Top = 682
          Width = 642
          Height = 17
          Align = alBottom
          TabOrder = 5
        end
        object BitBtn5: TBitBtn
          Left = 504
          Top = 2
          Width = 113
          Height = 28
          Caption = '&Nuevo Cliente'
          TabOrder = 6
          OnClick = BitBtn5Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
            000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
            99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
            0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
            FFFF3333337F337F333333333307B70FFFFF33333373FF733F333333333000FF
            0FFF3333333777337FF3333333333FF000FF33FFFFF3333777FF300000333300
            000F377777F33377777F30EEE0333000000037F337F33777777730EEE0333330
            00FF37F337F3333777F330EEE033333000FF37FFF7F3333777F3300000333330
            00FF3777773333F77733333333333000033F3333333337777333}
          NumGlyphs = 2
        end
        object BitBtn9: TBitBtn
          Left = 505
          Top = 37
          Width = 113
          Height = 33
          Caption = 'Cr'#233'dit&o Por Aplicar'
          TabOrder = 7
          OnClick = BitBtn9Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555FFFFFFFFFF55555000000000055555577777777775FFFF00B8B8B8B8B0
            0000775F5555555777770B0B8B8B8B8B0FF07F75F555555575F70FB0B8B8B8B8
            B0F07F575FFFFFFFF7F70BFB0000000000F07F557777777777570FBFBF0FFFFF
            FFF07F55557F5FFFFFF70BFBFB0F000000F07F55557F777777570FBFBF0FFFFF
            FFF075F5557F5FFFFFF750FBFB0F000000F0575FFF7F777777575700000FFFFF
            FFF05577777F5FF55FF75555550F00FF00005555557F775577775555550FFFFF
            0F055555557F55557F755555550FFFFF00555555557FFFFF7755555555000000
            0555555555777777755555555555555555555555555555555555}
          NumGlyphs = 2
        end
        object BitBtn10: TBitBtn
          Left = 505
          Top = 79
          Width = 113
          Height = 33
          Caption = '&Ingresos'
          TabOrder = 8
          OnClick = BitBtn10Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555550
            00555555555FFF57775F55555500050BBB0555FFF57775777775500050EEE000
            777057775777777775F709990777777770F0777775FFFFFFF7F7099990000000
            F0F07F5557777777F7F70FFFFFFFFFF0F0F07F5555555557F7F70FFFFFFFFFF0
            F0F07F5555555557F7F70FFFFFFFFFF0F0F07F5FF5FF5F57F7F70F77F77F7FF0
            F0F07F7757757557F7F70FFFFFFFFFF0F0F07F5FF5FFF557F7F70F77F777FFF0
            F0F07F7757775557F7F70FFFFFFFFFF0F0F07FF5F5F5F5F7F7F700F0F0F0F0F0
            F00577F7F7F7F7F7F77F0070707070700005777777777777777F707070707070
            55055757575757575F7555050505050500555575757575757755}
          NumGlyphs = 2
        end
        object BitBtn15: TBitBtn
          Left = 505
          Top = 118
          Width = 113
          Height = 29
          Hint = 'Buscar Balance de un CLIENTE'
          Caption = 'Buscar &Blce. Cte.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          OnClick = BitBtn15Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
        object ScrollBox2: TScrollBox
          Left = 392
          Top = 184
          Width = 225
          Height = 88
          TabOrder = 10
          Visible = False
          object Label21: TLabel
            Left = 0
            Top = 1
            Width = 180
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'BALANCE CLIENTE'
            Color = 13303754
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentColor = False
            ParentFont = False
          end
          object Label22: TLabel
            Left = 3
            Top = 19
            Width = 40
            Height = 13
            Caption = 'Nombre:'
          end
          object Label23: TLabel
            Left = 55
            Top = 31
            Width = 40
            Height = 13
            Caption = 'Nombre:'
          end
          object Label25: TLabel
            Left = 4
            Top = 33
            Width = 47
            Height = 13
            Caption = 'Bce Act. :'
          end
          object Label26: TLabel
            Left = 4
            Top = 47
            Width = 47
            Height = 13
            Caption = 'F.Ult.Pag:'
          end
          object Label27: TLabel
            Left = 54
            Top = 18
            Width = 40
            Height = 13
            Caption = 'Nombre:'
          end
          object Label28: TLabel
            Left = 55
            Top = 47
            Width = 40
            Height = 13
            Caption = 'Nombre:'
          end
          object BitBtn16: TBitBtn
            Left = 130
            Top = 65
            Width = 88
            Height = 18
            Caption = 'Blc Act&ual'
            TabOrder = 0
            OnClick = BitBtn16Click
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
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
        end
        object BitBtn17: TBitBtn
          Left = 505
          Top = 153
          Width = 113
          Height = 29
          Hint = 'Buscar Balance de un CLIENTE'
          Caption = 'Blce. x &Nombre'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          OnClick = BitBtn17Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
        object BitBtn18: TBitBtn
          Left = 175
          Top = 275
          Width = 84
          Height = 25
          Caption = 'Ver Trn x Cte'
          TabOrder = 12
          OnClick = BitBtn18Click
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 16
          Width = 121
          Height = 21
          DataField = 'SERIE'
          DataSource = dsqryTranCxc
          TabOrder = 13
        end
        object DBEdit2: TDBEdit
          Left = 8
          Top = 104
          Width = 97
          Height = 21
          DataField = 'CODIGO_SERV'
          DataSource = dsqryTranCxc
          TabOrder = 14
        end
        object DBEdit3: TDBEdit
          Left = 8
          Top = 192
          Width = 228
          Height = 21
          DataSource = dsqryTranCxc
          TabOrder = 15
        end
        object DBEdit4: TDBEdit
          Left = 8
          Top = 248
          Width = 97
          Height = 21
          DataField = 'NUMERO_DOC'
          DataSource = dsqryTranCxc
          TabOrder = 16
        end
        object DBEdit5: TDBEdit
          Left = 114
          Top = 248
          Width = 33
          Height = 21
          DataField = 'STATUS'
          DataSource = dsqryTranCxc
          TabOrder = 17
        end
        object DBEdit7: TDBEdit
          Left = 248
          Top = 104
          Width = 121
          Height = 21
          DataField = 'CODIGO_CLIENTE'
          DataSource = dsqryTranCxc
          TabOrder = 18
          OnChange = DBEdit7Change
          OnExit = DBEdit7Exit
        end
        object DBEdit8: TDBEdit
          Left = 248
          Top = 192
          Width = 121
          Height = 21
          DataField = 'VALOR_DOCUMENTO'
          DataSource = dsqryTranCxc
          TabOrder = 19
        end
        object RxDBLookupCombo1: TRxDBLookupCombo
          Left = 144
          Top = 16
          Width = 89
          Height = 21
          DropDownCount = 8
          DataField = 'TIPO_SERV'
          DataSource = dsqryTranCxc
          LookupField = 'CODIGO'
          LookupDisplay = 'DESCRIPCION'
          LookupSource = dstblTipoServ
          TabOrder = 20
        end
        object RxDBLookupCombo3: TRxDBLookupCombo
          Left = 248
          Top = 148
          Width = 233
          Height = 21
          DropDownCount = 8
          DataField = 'CODIGO_CLIENTE'
          DataSource = dsqryTranCxc
          LookupField = 'CODIGO_CTE'
          LookupDisplay = 'NOMBRE_FACTURAR'
          LookupSource = dstblClientes
          TabOrder = 21
        end
        object RxDBLookupCombo4: TRxDBLookupCombo
          Left = 8
          Top = 150
          Width = 121
          Height = 21
          DropDownCount = 8
          DataField = 'TIPO_DOC'
          DataSource = dsqryTranCxc
          LookupField = 'CODIGO'
          LookupDisplay = 'DESCRIPCION'
          LookupSource = dstblTipoTrnDoc
          TabOrder = 22
          OnExit = RxDBLookupCombo4Exit
        end
        object DBDateEdit1: TDBDateEdit
          Left = 144
          Top = 149
          Width = 89
          Height = 21
          DataSource = dsqryTranCxc
          NumGlyphs = 2
          TabOrder = 23
        end
        object RxDBLookupCombo2: TRxDBLookupCombo
          Left = 144
          Top = 103
          Width = 97
          Height = 21
          DropDownCount = 8
          DataField = 'CODIGO_SERV'
          DataSource = dsqryTranCxc
          LookupField = 'CODIGO'
          LookupDisplay = 'DESCRIPCION'
          LookupSource = dstblServicio
          TabOrder = 24
        end
      end
    end
    object tabExaminar: TTabSheet
      Caption = 'Examinar'
      ImageIndex = 1
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 646
        Height = 703
        Align = alClient
        DataSource = dsqryTranCxc
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'SERIE'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_SERV'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_DOC'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_CLIENTE'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_SERV'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_DOCUMENTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MONEDA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO_DOC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONCEPTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_TRANF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Visible = True
          end>
      end
    end
  end
  object PanelProcServicios: TPanel
    Left = 0
    Top = 112
    Width = 641
    Height = 398
    Color = 12058623
    TabOrder = 2
    object Label10: TLabel
      Left = 9
      Top = 13
      Width = 65
      Height = 20
      Caption = 'Label10'
      Color = 10796131
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object DBStatusLabel2: TDBStatusLabel
      Left = 8
      Top = 304
      Width = 85
      Height = 13
      DatasetName = 'Trn Cxc'
    end
    object Label11: TLabel
      Left = 8
      Top = 48
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object Label12: TLabel
      Left = 79
      Top = 49
      Width = 61
      Height = 13
      Caption = 'Numero Fact'
    end
    object Label14: TLabel
      Left = 153
      Top = 50
      Width = 30
      Height = 13
      Caption = 'Monto'
    end
    object Label15: TLabel
      Left = 503
      Top = 2
      Width = 90
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Fact.Procesada'
      Color = 13303754
      ParentColor = False
    end
    object Label17: TLabel
      Left = 505
      Top = 33
      Width = 89
      Height = 13
      Caption = 'Ingreso Procesado'
      Color = clTeal
      ParentColor = False
    end
    object Label20: TLabel
      Left = 504
      Top = 17
      Width = 89
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Sin Procesar'
      Color = clWhite
      ParentColor = False
    end
    object LabelFechaTrn: TLabel
      Left = 263
      Top = 4
      Width = 72
      Height = 13
      Caption = 'LabelFechaTrn'
      Color = 16763799
      ParentColor = False
    end
    object RxDBGrid2: TRxDBGrid
      Left = 8
      Top = 92
      Width = 625
      Height = 210
      Hint = 'Click en boton derecho mouse para filtrar datos'
      DataSource = dmCxc.dsqryProcServ
      FixedColor = 16762508
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenu2
      ShowHint = True
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetCellParams = RxDBGrid2GetCellParams
      Columns = <
        item
          Expanded = False
          FieldName = 'NOMBRE_FACTURAR'
          ReadOnly = True
          Title.Caption = 'Nombre Cliente'
          Width = 222
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_CLIENTE'
          Title.Caption = 'Codigo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO_DOC'
          Title.Caption = 'Numero Doc'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_DOCUMENTO'
          Title.Caption = 'Valor Documento'
          Width = 113
          Visible = True
        end
        item
          Color = 10796131
          Expanded = False
          FieldName = 'Balance_Act'
          ReadOnly = True
          Visible = True
        end>
    end
    object BitBtn6: TBitBtn
      Left = 412
      Top = 56
      Width = 85
      Height = 32
      Caption = '&Grabar'
      TabOrder = 3
      OnClick = BitBtn6Click
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
    object BitBtn7: TBitBtn
      Left = 580
      Top = 55
      Width = 54
      Height = 32
      Caption = '&Salir'
      TabOrder = 5
      OnClick = BitBtn7Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
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
    object BitBtn8: TBitBtn
      Left = 502
      Top = 56
      Width = 72
      Height = 32
      Caption = '&Procesar'
      TabOrder = 6
      OnClick = BitBtn8Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
        000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
        99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
        0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
        FFFF3333337F337F333333333307B70FFFFF33333373FF733F333333333000FF
        0FFF3333333777337FF3333333333FF000FF33FFFFF3333777FF300000333300
        000F377777F33377777F30EEE0333000000037F337F33777777730EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F3333777F3300000333330
        00FF3777773333F77733333333333000033F3333333337777333}
      NumGlyphs = 2
    end
    object DBNavigator1: TDBNavigator
      Left = 19
      Top = 345
      Width = 572
      Height = 28
      DataSource = dmCxc.dstblTransCxc
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 7
    end
    object RxDBGrid3: TRxDBGrid
      Left = 360
      Top = 303
      Width = 263
      Height = 22
      DataSource = DataSource1
      FixedColor = 12615680
      Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 8
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Total'
          Visible = True
        end>
    end
    object BitBtn11: TBitBtn
      Left = 331
      Top = 56
      Width = 76
      Height = 32
      Cancel = True
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = BitBtn11Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object EditN1: TEditN
      Left = 8
      Top = 66
      Width = 65
      Height = 21
      Color = clSilver
      TabOrder = 0
      ColorOnFocus = clYellow
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
      ValueDate = 37759.000000000000000000
      ValueTime = 0.552690486111111200
      TimeSeconds = False
      FirstCharUpper = False
      FirstCharUpList = ' ('
      WidthOnFocus = 0
      TextHint = True
    end
    object EditN2: TEditN
      Left = 78
      Top = 66
      Width = 68
      Height = 21
      Color = clSilver
      TabOrder = 1
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
      ValueDate = 37759.000000000000000000
      ValueTime = 0.552690486111111200
      TimeSeconds = False
      FirstCharUpper = False
      FirstCharUpList = ' ('
      WidthOnFocus = 0
      TextHint = True
    end
    object EditN3: TEditN
      Left = 151
      Top = 66
      Width = 106
      Height = 21
      Color = clSilver
      TabOrder = 2
      OnExit = EditN3Exit
      ColorOnFocus = clYellow
      ColorOnNotFocus = clYellow
      FontColorOnFocus = clRed
      FontColorOnNotFocus = clBlack
      FontColorOnOverWrite = clBlue
      EditType = etFloat
      EditKeyByTab = #9
      EditAlign = etAlignNone
      EditLengthAlign = 0
      EditPrecision = 0
      ValueInteger = 0
      ValueDate = 37759.000000000000000000
      ValueTime = 0.552690486111111200
      TimeSeconds = False
      FirstCharUpper = False
      FirstCharUpList = ' ('
      WidthOnFocus = 0
      TextHint = True
    end
    object BitBtn12: TBitBtn
      Left = 263
      Top = 19
      Width = 142
      Height = 33
      Caption = 'BitBtn12'
      TabOrder = 10
      OnClick = BitBtn12Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
        00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
        0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
        03FF3777773337777333333333333333333F3333333333333333}
      NumGlyphs = 2
    end
    object BitBtn13: TBitBtn
      Left = 261
      Top = 57
      Width = 66
      Height = 31
      Cancel = True
      Caption = '&Modificar'
      TabOrder = 11
      OnClick = BitBtn13Click
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
    object DBGrid1: TDBGrid
      Left = 0
      Top = 112
      Width = 320
      Height = 281
      Hint = 'Doble click para ocultar este dbgrid'
      Color = 13565902
      DataSource = tempqrybcehis
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERVICIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BALANCE_ACT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BALANCE_ANT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_HISTORICO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONEDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEBITO_MES'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CREDITO_MES'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEBITO_ACM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CREDITO_ACM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MES'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_CLIENTE'
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 320
      Top = 112
      Width = 320
      Height = 281
      Hint = 'Doble click para ocultar este dbgrid'
      Color = 15269864
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
      OnDblClick = DBGrid2DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPOSERVICIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEBITO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CREDITO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORIGEN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Balance_Ant'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Balance_Actual'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_INGRESO_RECIBO'
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_DET'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_CTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_FACTURAR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_CLIENTE_DET'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD_DETA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANT_ADULTO_DETA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TARIFA_SERV_DETA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONEDA_DET'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORC_DESC_DET'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_FACT_DET'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO_RECIBO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPUESTO_SERV_DET'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_DET'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_AREA_FACT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTACTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEF_CONTACTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AREA'
          Visible = True
        end>
    end
    object BitBtn14: TBitBtn
      Left = 413
      Top = 21
      Width = 84
      Height = 31
      Caption = 'Cerrar Dia'
      TabOrder = 14
      OnClick = BitBtn14Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33F333337F3333373B33333BB33333B337FF33377F33337F3BB3333BB333
        3BB3377FF3377F33377333BB777BB777BB333377FFF77FFF7733330000000000
        B3333377777777777333330FFFFFFFF03333337F3FF3FFF7F333330F00F000F0
        33333F7F77377737FFFFBB0FFF8FFFF0BBB3777F3F33FFF7777F3B0F08700000
        000B377F73F7777777773308880FFFFFF033337F377333333733330807FFFFF8
        033333737FFFFFFF7F33333000000000B3333337777777777FF333BB333BB333
        BB33337733377F3377FF3BB3333BB3333BB3377333377F33377F3B33333BB333
        33B33733333773333373B333333B3333333B7333333733333337}
      NumGlyphs = 2
    end
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Total'
        DataType = ftFloat
      end>
    Left = 405
    Top = 331
    object RxMemoryData1Total: TFloatField
      FieldName = 'Total'
      DisplayFormat = ',0.00'
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 221
    Top = 88
    object BuscarCliente1: TMenuItem
      Caption = 'Buscar Cliente'
      OnClick = BuscarCliente1Click
    end
    object Filtraruncliente1: TMenuItem
      Caption = 'Filtrar un cliente'
      OnClick = Filtraruncliente1Click
    end
    object FiltrarPendientes1: TMenuItem
      Caption = '...Pendientes'
      OnClick = FiltrarPendientes1Click
    end
    object FiltrarProcesados1: TMenuItem
      Caption = '... Procesados'
      OnClick = FiltrarProcesados1Click
    end
    object FiltrarFacturas1: TMenuItem
      Caption = '... Facturas'
      OnClick = FiltrarFacturas1Click
    end
    object FiltrarIngresos1: TMenuItem
      Caption = '... Ingresos'
      OnClick = FiltrarIngresos1Click
    end
    object QuitarFiltro1: TMenuItem
      Caption = 'Quitar Filtro'
      OnClick = QuitarFiltro1Click
    end
  end
  object tempoqryrepserv: TDataSource
    Left = 592
    Top = 342
  end
  object PopupMenu1: TPopupMenu
    Left = 470
    Top = 51
    object Filtrar1: TMenuItem
      Caption = 'Filtrar'
      object PorCliente1: TMenuItem
        Caption = '&Por Cliente'
        OnClick = PorCliente1Click
      end
      object Facturas1: TMenuItem
        Caption = 'Facturas'
        OnClick = Facturas1Click
      end
      object Ingresos1: TMenuItem
        Caption = 'Ingresos'
        OnClick = Ingresos1Click
      end
      object NotaCredito1: TMenuItem
        Caption = 'Nota Credito'
        OnClick = NotaCredito1Click
      end
      object NotaDebito1: TMenuItem
        Caption = 'Nota Debito'
      end
      object Todas1: TMenuItem
        Caption = 'Todas'
        OnClick = Todas1Click
      end
    end
    object VerDebitosCreditosdelDia1: TMenuItem
      Caption = 'Ver Debitos/Creditos del Dia'
      OnClick = VerDebitosCreditosdelDia1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 317
    Top = 465
  end
  object tempqrybcehis: TDataSource
    Left = 80
    Top = 50
  end
  object dsqryBalanceCtes: TDataSource
    DataSet = dmCxc.qryBalanceCtes
    Left = 372
    Top = 73
  end
  object dsqryTranCxc: TDataSource
    DataSet = dmCxc.tblTransCxc
    Left = 308
    Top = 113
  end
  object dstblTipoServ: TDataSource
    DataSet = dmCxc.tblTipoServ
    Left = 372
    Top = 189
  end
  object dstblServicio: TDataSource
    DataSet = dmCxc.tblServicio
    Left = 444
    Top = 89
  end
  object dstblClientes: TDataSource
    DataSet = dmCxc.tblClientes
    Left = 116
    Top = 89
  end
  object dstblTipoTrnDoc: TDataSource
    DataSet = dmCxc.tblTipoTrnDoc
    Left = 120
    Top = 311
  end
end
