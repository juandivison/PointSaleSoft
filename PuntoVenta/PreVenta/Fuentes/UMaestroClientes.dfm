object frmClientes: TfrmClientes
  Left = 315
  Top = 132
  Width = 694
  Height = 490
  Caption = 'Maestro Clientes'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 678
    Height = 34
    Align = alTop
    Color = 10547677
    TabOrder = 0
    object RxSpeedButton1: TRxSpeedButton
      Tag = 7
      Left = 509
      Top = 4
      Width = 74
      Height = 25
      Caption = 'Reportes'
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
      Layout = blGlyphLeft
      NumGlyphs = 2
      OnClick = RxSpeedButton1Click
    end
    object btnInsertar: TBitBtn
      Tag = 1
      Left = 9
      Top = 4
      Width = 74
      Height = 25
      Caption = '&Insertar'
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
      Tag = 2
      Left = 88
      Top = 4
      Width = 71
      Height = 25
      Cancel = True
      Caption = '&Modificar'
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
      Tag = 3
      Left = 164
      Top = 4
      Width = 79
      Height = 25
      Caption = '&Guardar'
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
    object btnCancelar: TBitBtn
      Tag = 4
      Left = 251
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      Default = True
      TabOrder = 3
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
    object btnCerarAbrirres: TBitBtn
      Tag = 6
      Left = 424
      Top = 4
      Width = 82
      Height = 25
      Caption = '&Refrescar'
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
      Left = 593
      Top = 4
      Width = 75
      Height = 25
      TabOrder = 5
      Kind = bkClose
    end
    object BitBtn7: TBitBtn
      Tag = 5
      Left = 333
      Top = 5
      Width = 84
      Height = 25
      Hint = 'Clic aqui para buscar cliente'
      Caption = 'Buscar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = BitBtn7Click
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
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 34
    Width = 678
    Height = 418
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object tabClientes: TTabSheet
      Caption = 'Record'
      PopupMenu = PopupMenu1
      object Label1: TLabel
        Left = 8
        Top = 3
        Width = 33
        Height = 13
        Caption = 'Codigo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 8
        Top = 46
        Width = 37
        Height = 13
        Caption = 'Nombre'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 8
        Top = 88
        Width = 47
        Height = 13
        Caption = 'Nomb.Abr'
        FocusControl = DBEdit3
      end
      object Label5: TLabel
        Left = 456
        Top = 256
        Width = 30
        Height = 13
        Caption = 'Status'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 208
        Top = 165
        Width = 55
        Height = 13
        Caption = 'Tipo cliente'
      end
      object Label7: TLabel
        Left = 205
        Top = 4
        Width = 45
        Height = 13
        Caption = 'Direccion'
      end
      object Label8: TLabel
        Left = 208
        Top = 213
        Width = 42
        Height = 13
        Caption = 'Telefono'
      end
      object Label9: TLabel
        Left = 8
        Top = 213
        Width = 49
        Height = 13
        Caption = 'Conctacto'
      end
      object Label10: TLabel
        Left = 8
        Top = 253
        Width = 17
        Height = 13
        Caption = 'Fax'
      end
      object Label11: TLabel
        Left = 208
        Top = 87
        Width = 29
        Height = 13
        Caption = 'E-Mail'
      end
      object Label12: TLabel
        Left = 208
        Top = 128
        Width = 44
        Height = 13
        Caption = 'Web Site'
      end
      object DBStatusLabel2: TDBStatusLabel
        Left = 496
        Top = 274
        Width = 85
        Height = 13
        DatasetName = 'Clientes'
        DataSource = dtSource
      end
      object Label13: TLabel
        Left = 208
        Top = 46
        Width = 20
        Height = 13
        Caption = 'Pais'
      end
      object Label14: TLabel
        Left = 455
        Top = 3
        Width = 33
        Height = 13
        Caption = 'Ciudad'
      end
      object Label15: TLabel
        Left = 8
        Top = 128
        Width = 79
        Height = 13
        Caption = 'Nombre Facturar'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 208
        Top = 253
        Width = 78
        Height = 13
        Caption = 'Moneda Factura'
      end
      object Label20: TLabel
        Left = 456
        Top = 46
        Width = 21
        Height = 13
        Caption = 'Foto'
      end
      object Label21: TLabel
        Left = 8
        Top = 165
        Width = 77
        Height = 13
        Caption = 'RNC / CEDULA'
        Color = 10547677
        ParentColor = False
      end
      object Label27: TLabel
        Left = 208
        Top = 293
        Width = 47
        Height = 13
        Caption = 'Condicion'
        Transparent = True
      end
      object labelCantDias: TLabel
        Left = 456
        Top = 295
        Width = 49
        Height = 13
        Caption = 'Cant. Dias'
      end
      object Label28: TLabel
        Left = 8
        Top = 293
        Width = 78
        Height = 13
        Caption = 'Limite de Credito'
        FocusControl = DBEdit6
        Transparent = True
      end
      object Label22: TLabel
        Left = 208
        Top = 336
        Width = 40
        Height = 13
        Hint = 'Clasificacion Precio'
        Caption = 'T.Precio'
        ParentShowHint = False
        ShowHint = True
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 19
        Width = 64
        Height = 21
        DataField = 'CODIGO_CTE'
        DataSource = dtSource
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 62
        Width = 189
        Height = 21
        DataField = 'NOMBRE_CTE'
        DataSource = dtSource
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 8
        Top = 103
        Width = 189
        Height = 21
        DataField = 'NOMBRE_ABREV'
        DataSource = dtSource
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 456
        Top = 271
        Width = 33
        Height = 21
        DataField = 'STATUS_CLIENTE'
        DataSource = dtSource
        TabOrder = 19
      end
      object DBEdit7: TDBEdit
        Left = 206
        Top = 18
        Width = 241
        Height = 21
        DataField = 'DIRECCION_CONT'
        DataSource = dtSource
        TabOrder = 7
      end
      object DBEdit8: TDBEdit
        Left = 208
        Top = 229
        Width = 186
        Height = 21
        DataField = 'TELEF_CONTACTO'
        DataSource = dtSource
        TabOrder = 12
      end
      object DBEdit9: TDBEdit
        Left = 8
        Top = 267
        Width = 186
        Height = 21
        DataField = 'FAX_CONTACTO'
        DataSource = dtSource
        TabOrder = 6
      end
      object DBEdit10: TDBEdit
        Left = 8
        Top = 229
        Width = 186
        Height = 21
        DataField = 'CONTACTO'
        DataSource = dtSource
        TabOrder = 5
      end
      object DBEdit11: TDBEdit
        Left = 208
        Top = 103
        Width = 241
        Height = 21
        DataField = 'EMAIL'
        DataSource = dtSource
        TabOrder = 9
      end
      object DBEdit12: TDBEdit
        Left = 208
        Top = 143
        Width = 241
        Height = 21
        DataField = 'WEBSITE'
        DataSource = dtSource
        TabOrder = 10
      end
      object DBEdit13: TDBEdit
        Left = 207
        Top = 62
        Width = 242
        Height = 21
        DataField = 'PAIS'
        DataSource = dtSource
        TabOrder = 8
      end
      object DBEdit14: TDBEdit
        Left = 455
        Top = 19
        Width = 170
        Height = 21
        DataField = 'CIUDAD'
        DataSource = dtSource
        TabOrder = 13
      end
      object DBEdit15: TDBEdit
        Left = 8
        Top = 143
        Width = 189
        Height = 21
        DataField = 'NOMBRE_FACTURAR'
        DataSource = dtSource
        TabOrder = 3
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 208
        Top = 180
        Width = 241
        Height = 21
        DataField = 'TIPO_CLIENTE'
        DataSource = dtSource
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = dstblTipoCliente
        TabOrder = 11
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 208
        Top = 267
        Width = 241
        Height = 21
        DataField = 'MONEDA_FACT'
        DataSource = dtSource
        KeyField = 'CODIGO'
        ListField = 'DESCRIPCION'
        ListSource = dstblMoneda
        TabOrder = 14
      end
      object DBImage1: TDBImage
        Left = 456
        Top = 61
        Width = 105
        Height = 105
        DataField = 'FOTO'
        DataSource = dtSource
        TabOrder = 21
      end
      object BitBtn1: TBitBtn
        Left = 456
        Top = 169
        Width = 105
        Height = 19
        Caption = 'Guardar &Foto'
        TabOrder = 20
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
          BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
          BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
          BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
          BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
          EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
          EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
          EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
          EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
        NumGlyphs = 2
      end
      object BitBtn9: TBitBtn
        Left = 456
        Top = 197
        Width = 26
        Height = 25
        Action = DataSetFirst1
        TabOrder = 22
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
        Left = 485
        Top = 197
        Width = 23
        Height = 25
        Action = DataSetPrior1
        TabOrder = 23
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
        Left = 511
        Top = 197
        Width = 23
        Height = 25
        Action = DataSetNext1
        TabOrder = 24
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
        Left = 538
        Top = 197
        Width = 23
        Height = 25
        Action = DataSetLast1
        TabOrder = 25
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
      object DBEdit4: TDBEdit
        Left = 8
        Top = 181
        Width = 186
        Height = 21
        Hint = 'Si el cliente no tiene RNC entonces indicar numero de cedula'
        DataField = 'RNC_NUMERO'
        DataSource = dtSource
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 208
        Top = 311
        Width = 242
        Height = 21
        DropDownCount = 8
        DataField = 'CONDICION'
        DataSource = dtSource
        LookupField = 'CODIGO'
        LookupDisplay = 'DESCRIPCION'
        LookupSource = dstblCondicionVenta
        TabOrder = 16
      end
      object DBComboBox1: TDBComboBox
        Left = 456
        Top = 311
        Width = 65
        Height = 21
        Style = csDropDownList
        DataField = 'CANT_DIAS_CREDITO'
        DataSource = dtSource
        ItemHeight = 13
        Items.Strings = (
          '0'
          '15'
          '30'
          '45'
          '60'
          '90')
        TabOrder = 17
      end
      object DBEdit6: TDBEdit
        Tag = 8
        Left = 10
        Top = 313
        Width = 183
        Height = 21
        DataField = 'LIMITE_CREDITO'
        DataSource = dtSource
        TabOrder = 15
      end
      object RxDBLookupCombo2: TRxDBLookupCombo
        Tag = 9
        Left = 208
        Top = 353
        Width = 241
        Height = 21
        DropDownCount = 8
        DataField = 'PRECIO_ID'
        DataSource = dtSource
        LookupField = 'PRECIO_ID'
        LookupDisplay = 'DESCRIPCION'
        LookupSource = dmClientes.dstblTipoPrecio
        TabOrder = 18
      end
    end
    object tabExaminar: TTabSheet
      Caption = 'Examinar'
      ImageIndex = 1
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 670
        Height = 390
        Align = alClient
        DataSource = dtSource
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_CTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_CLIENTE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RNC_NUMERO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE_CTE'
            Width = 178
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE_FACTURAR'
            Width = 135
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE_ABREV'
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LIMITE_CREDITO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MONEDA_FACT'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTACTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIRECCION_CONT'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEF_CONTACTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAX_CONTACTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FORMA_PAGO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_AGENCIA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS_CLIENTE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSERTADO_POR'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_INSERTADO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_MOD'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MODI_POR'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WEBSITE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAIS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIUDAD'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANT_DIAS_CREDITO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONDICION'
            Visible = True
          end>
      end
    end
    object tabClasifiCte: TTabSheet
      Caption = 'Clasificacion Clientes'
      ImageIndex = 2
      object Label16: TLabel
        Left = 8
        Top = 16
        Width = 42
        Height = 13
        Caption = 'CODIGO'
        FocusControl = DBEdit16
      end
      object Label17: TLabel
        Left = 8
        Top = 64
        Width = 73
        Height = 13
        Caption = 'DESCRIPCION'
        FocusControl = DBEdit17
      end
      object DBStatusLabel3: TDBStatusLabel
        Left = 224
        Top = 16
        Width = 85
        Height = 13
        DatasetName = 'Clasificacion Clientes'
        DataSource = dstblTipoCliente
      end
      object Label18: TLabel
        Left = 88
        Top = 16
        Width = 70
        Height = 13
        Caption = 'CODIGO_ABR'
        FocusControl = DBEdit18
      end
      object DBEdit16: TDBEdit
        Left = 8
        Top = 32
        Width = 64
        Height = 21
        DataField = 'CODIGO'
        DataSource = dstblTipoCliente
        TabOrder = 0
      end
      object DBEdit17: TDBEdit
        Left = 8
        Top = 80
        Width = 193
        Height = 21
        DataField = 'DESCRIPCION'
        DataSource = dstblTipoCliente
        TabOrder = 1
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 112
        Width = 425
        Height = 120
        DataSource = dstblTipoCliente
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_ABR'
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Width = 227
            Visible = True
          end>
      end
      object DBNavigator2: TDBNavigator
        Left = 206
        Top = 77
        Width = 224
        Height = 25
        DataSource = dstblTipoCliente
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 3
      end
      object BitBtn3: TBitBtn
        Left = 437
        Top = 76
        Width = 77
        Height = 25
        Caption = '&Insertar'
        TabOrder = 4
        OnClick = BitBtn3Click
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
      object BitBtn4: TBitBtn
        Left = 437
        Top = 113
        Width = 77
        Height = 25
        Cancel = True
        Caption = '&Modificar'
        TabOrder = 5
        OnClick = BitBtn4Click
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
      object BitBtn5: TBitBtn
        Left = 437
        Top = 149
        Width = 77
        Height = 25
        Caption = '&Salvar'
        Default = True
        TabOrder = 6
        OnClick = BitBtn5Click
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
      object BitBtn6: TBitBtn
        Left = 437
        Top = 186
        Width = 77
        Height = 25
        Caption = '&Refrescar'
        TabOrder = 7
        OnClick = BitBtn6Click
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
      object DBEdit18: TDBEdit
        Left = 88
        Top = 32
        Width = 76
        Height = 21
        DataField = 'CODIGO_ABR'
        DataSource = dstblTipoCliente
        TabOrder = 8
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Referencias'
      ImageIndex = 3
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 670
        Height = 37
        Align = alTop
        TabOrder = 0
        object BitBtn8: TBitBtn
          Left = 271
          Top = 5
          Width = 75
          Height = 25
          Caption = 'Actualizar'
          TabOrder = 0
          OnClick = BitBtn8Click
        end
      end
      object RxDBGrid2: TRxDBGrid
        Left = 0
        Top = 37
        Width = 670
        Height = 353
        Align = alClient
        DataSource = dmClientes.dsqryReferenciacliente
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_CTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Width = 139
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBREEMPRESA'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEDULA_RNC'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONO'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CELULAR'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONO_TRABAJO'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIMERNOMBRE'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRIMERAPELLIDO'
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SEGUNDONOMBRE'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SEGUNDOAPELLIDO'
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'APELLIDO'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE_EMPRESA'
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CALLE'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CASANUM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'APTONUM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SECTOR'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROVINCIA'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIUDAD'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAIS'
            Width = 77
            Visible = True
          end>
      end
    end
  end
  object dtSource: TDataSource
    DataSet = dmClientes.tblClientes
    Left = 324
    Top = 138
  end
  object PopupMenu1: TPopupMenu
    Left = 148
    Top = 98
    object SoloPesos1: TMenuItem
      Caption = 'Filtrar Solo Pesos'
    end
    object SoloDolares1: TMenuItem
      Caption = 'FiltrarSolo Dolares'
    end
    object FiltrartipoAgencia1: TMenuItem
      Caption = 'Filtrar tipo Agencia'
    end
    object Todos1: TMenuItem
      Caption = 'Mostrar Todos'
    end
  end
  object dstblTipoCliente: TDataSource
    DataSet = dmClientes.tblTipoCliente
    Left = 404
    Top = 186
  end
  object dstblMoneda: TDataSource
    DataSet = dmClientes.tblMoneda
    Left = 404
    Top = 130
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 320
    Top = 88
  end
  object ActionList1: TActionList
    Left = 368
    Top = 328
    object DataSetFirst1: TDataSetFirst
      Category = 'Dataset'
      DataSource = dtSource
    end
    object DataSetPrior1: TDataSetPrior
      Category = 'Dataset'
      DataSource = dtSource
    end
    object DataSetNext1: TDataSetNext
      Category = 'Dataset'
      DataSource = dtSource
    end
    object DataSetLast1: TDataSetLast
      Category = 'Dataset'
      DataSource = dtSource
    end
  end
  object SkinData1: TSkinData
    Active = True
    DisableTag = 99
    SkinControls = [xcMainMenu, xcPopupMenu, xcToolbar, xcControlbar, xcCombo, xcCheckBox, xcRadioButton, xcProgress, xcScrollbar, xcEdit, xcButton, xcBitBtn, xcSpeedButton, xcPanel, xcGroupBox, xcStatusBar, xcTab, xcSystemMenu]
    Skin3rd.Strings = (
      'TPngBitBtn=pngbitbtn'
      'TVirtualStringTree=scrollbar'
      'TVirtualDrawTree=scrollbar'
      'TTBXDockablePanel=Panel'
      'TAdvPanelGroup=scrollbar'
      'TComboboxex=combobox'
      'TRxSpeedButton=speedbutton'
      'THTMLViewer=scrollbar'
      'TDBCtrlGrid=scrollbar'
      'TfrSpeedButton=speedbutton'
      'TfrTBButton=speedbutton'
      'TControlBar=Panel'
      'TPageControl=PageControl'
      'TTBDock=Panel'
      'TTBToolbar=Panel'
      'TImageEnMView=scrollbar'
      'TImageEnView=scrollbar'
      'TAdvMemo=scrollbar'
      'TDBAdvMemo=scrollbar'
      'TcxDBLookupComboBox=combobox'
      'TcxDBComboBox=combobox'
      'TcxDBDateEdit=combobox'
      'TcxDBImageComboBox=combobox'
      'TcxDBCalcEdit=combobox'
      'TcxDBBlobEdit=combobox'
      'TcxDBPopupEdit=combobox'
      'TcxDBFontNameComboBox=combobox'
      'TcxDBShellComboBox=combobox'
      'TRxLookupEdit=combobox'
      'TRxDBLookupCombo=combobox'
      'TRzGroup=panel'
      'TRzButton=button'
      'TRzBitbtn=bitbtn'
      'TRzMenuButton=menubtn'
      'TRzCheckGroup=CheckGroup'
      'TRzRadioGroup=Radiogroup'
      'TRzButtonEdit=Edit'
      'TRzDBRadioGroup=Radiogroup'
      'TRzDBRadioButton=Radiobutton'
      'TRzDateTimeEdit=combobox'
      'TRzColorEdit=combobox'
      'TRzDateTimePicker=combobox'
      'TRzDBDateTimeEdit=combobox'
      'TRzDbColorEdit=combobox'
      'TRzDBDateTimePicker=combobox'
      'TLMDButton=bitbtn'
      'TLMDGroupBox=Groupbox'
      'TDBCheckboxEh=Checkbox'
      'TDBCheckboxEh=Checkbox'
      'TLMDCHECKBOX=Checkbox'
      'TLMDDBCHECKBOX=Checkbox'
      'TLMDRadiobutton=Radiobutton'
      'TLMDCalculator=panel'
      'TLMDGROUPBOX=Panel'
      'TLMDSIMPLEPANEL=Panel'
      'TLMDDBCalendar=Panel'
      'TLMDButtonPanel=Panel'
      'TLMDLMDCalculator=Panel'
      'TLMDHeaderPanel=Panel'
      'TLMDTechnicalLine=Panel'
      'TLMDLMDClock=Panel'
      'TLMDTrackbar=panel'
      'TLMDListCombobox=combobox'
      'TLMDCheckListCombobox=combobox'
      'TLMDHeaderListCombobox=combobox'
      'TLMDImageCombobox=combobox'
      'TLMDColorCombobox=combobox'
      'TLMDFontCombobox=combobox'
      'TLMDFontSizeCombobox=combobox'
      'TLMDFontSizeCombobox=combobox'
      'TLMDPrinterCombobox=combobox'
      'TLMDDriveCombobox=combobox'
      'TLMDCalculatorComboBox=combobox'
      'TLMDTrackBarComboBox=combobox'
      'TLMDCalendarComboBox=combobox'
      'TLMDTreeComboBox=combobox'
      'TLMDRADIOGROUP=radiogroup'
      'TLMDCheckGroup=CheckGroup'
      'TLMDDBRADIOGROUP=radiogroup'
      'TLMDDBCheckGroup=CheckGroup'
      'TLMDCalculatorEdit=edit'
      'TLMDEDIT=Edit'
      'TLMDMASKEDIT=Edit'
      'TLMDBROWSEEDIT=Edit'
      'TLMDEXTSPINEDIT=Edit'
      'TLMDCALENDAREDIT=Edit'
      'TLMDFILEOPENEDIT=Edit'
      'TLMDFILESAVEEDIT=Edit'
      'TLMDCOLOREDIT=Edit'
      'TLMDDBEDIT=Edit'
      'TLMDDBMASKEDIT=Edit'
      'TLMDDBEXTSPINEDIT=Edit'
      'TLMDDBSPINEDIT=Edit'
      'TLMDDBEDITDBLookup=Edit'
      'TLMDEDITDBLookup=Edit'
      'TDBLookupCombobox=Combobox'
      'TWWDBCombobox=Combobox'
      'TWWDBLookupCombo=Combobox'
      'TWWDBCombobox=Combobox'
      'TWWKeyCombo=Combobox'
      'TWWTempKeyCombo=combobox'
      'TWWDBDateTimePicker=Combobox'
      'TWWRADIOGROUP=radiogroup'
      'TWWDBEDIT=Edit'
      'TcxButton=bitbtn'
      'TcxDBRadioGroup=radiogroup'
      'TcxRadioGroup=radiogroup'
      'TcxGroupbox=groupbox'
      'TOVCPICTUREFIELD=Edit'
      'TOVCDBPICTUREFIELD=Edit'
      'TOVCSLIDEREDIT=Edit'
      'TOVCDBSLIDEREDIT=Edit'
      'TOVCSIMPLEFIELD=Edit'
      'TOVCDBSIMPLEFIELD=Edit'
      'TO32DBFLEXEDIT=Edit'
      'TOVCNUMERICFIELD=Edit'
      'TOVCDBNUMERICFIELD=Edit')
    SkinStore = '(Good)'
    SkinFormtype = sfOnlyThisForm
    Version = '2.65.7.03'
    MenuUpdate = True
    Left = 152
    Top = 184
    SkinStream = {
      178F000064750500D676B1987FDC760C04AC9D5B8B63007F2DC807EFF9BAF77E
      6D733968E05594882ECEDADE8519806C803A8827FFEFF5FD6FA83D77371F8F8C
      9AD5C23C082EDC30FF517CFE93219AF06461E4DD080E1CA3F844F6CF55979205
      BD93BA27DFBA05FBE5A037D1C662962159311D1F219B8879FB07DDC087488550
      F2ABD451F497229AE075406149E9B475846F17455093A7ABDC03095DB0C1C0CF
      0A9643F7BC09F1A7591DC915347426841FB783610A82C3F503380213FD52D9A1
      3458C6F15BC22762356748E1175247B504BFE790BD257FFA86B04CA8624FE791
      8C42C4468D5F83620BFCBF0516822523C681E29E72BDF81A1F15B3C01A6D5D99
      906A2D19DBCEBAE23F6EE45A13E32CEAAB4D7AEE3FF273A07644BEB895D06FFC
      03234E5A2D80F20D302BE94A240D6204F3060C4F7F3EAD4CA02C8920E19FC300
      CF47CDFBFE98FBF7C5581F980F69FBFD14C73A563478B5CF0FBC6410C9ADFF06
      0E7033DF38347F77A8C32FA06D582FEC49B08736C431E20BC82C44BC3CDD4066
      6993E6A4BE8B71FE905AEBC5994B32550577D565E0271C061B708F76E28D0301
      7EF01FD416819648BE072D245A3A5E0021A20389B944567E00BB0A60040BF84E
      932053F800EF00110B0005E8012800CE002F003F005D0068002C006C00F00240
      068C00A27DA00B40190033002800A003000C003800E0044011005CC014659802
      600B002C00C003000C0032003002001000800840051BD400A005002801800C00
      6003001C00E007004002F8015BEC0020010009005002801400A005002C01600B
      0026004EA6C01600B006000000000800800800800800801C0026FB2002002002
      0020020040040040040040040088009B4D001001001001001001001001801801
      801802A8026018018018018018018018018018018018018005004FF6C00C0100
      10010010010010010010010010005001FF1800800800A00A00A00A00A00E00E0
      0E00E003400F3DF0070070070070070070070070070070070026007D1B803803
      8038038000000000000000000000C00238000000000000000000000000000000
      000060011C300000000000000000000000000000000038008B14000000000000
      000000000000000000001E0043F0000000000000000000000000000000001C80
      2326000000000000000000000000100200401C80367B40080100200400801002
      0040080100200EC01B77400801002004008010020040080100200EC01B652004
      008010020040080100200400801007A00D895002004008020040080100200400
      801003D006AAD002004008010020040080100200400801F80356A80100200400
      80100200400801002004000002C03C008010020040080100300600C01801C1C0
      3A3980300600C0180300600C0180300600C002004B9F00600C0180300600C018
      0300600C01800400961EF105C0580B01602C0580B01602C0580B01602538052A
      375E8602C0580B01602C0580B01602C0580B010C8052647D50CC0580B01602C0
      580B01602C0580B01602AF80A5FA4B532C0580B01602C0580B01602C0580B016
      022D014C349F4A602C0580B01602C0580B01602C0580B015180A5324E1F4C058
      0B01602C0580B01602C0580B01602B6014A5A657F301602C0580B01602C0580B
      01602C05808400A5F2544EF01602C0580B01602C0580B01602C05808880A59F0
      616301602C0580B01602C0580B01602C0580A180A612B49EE02C0580B01602C0
      580B01602C0580B0146014C1EA81E301602C0580B01602C0580B01602C0580A9
      00A4D96A37E02C0580B01602C0580B01602C0580B0157014A50694EF01602C05
      80B01602C0580B01602C0580800149C26A23602C0580B01602C0580B01602C05
      80B0104029440C96B602C0580B01602C0401004010040100598053A06D7B6804
      01004010040100401004010040167014EDAF81BF402008020080200802008020
      080200BF00A6AF56D0C02008020080200802008020080200BF00A6A9DC748010
      040100401004010040100401005FC053B75934A0080200802008020080200802
      00802800535ADF7BF002008020080200802008020080200A2014F01E4F648040
      100401004010040100401004014402AD9F7B6AE0100401004010040100401004
      01005200A6938E6ED008020080200802008020080200802A00532CC876480401
      00401004010040100401004015A02ADAD2CF8C02008020080200802008020080
      200AD0156BFB09C0040100401004010040100401004015A02AE438F9A79ABF40
      0E3BD6D54D2403F81E34E0B9C0FF2ADDD1617EDF99D54B388BC03C6DF155A05E
      41DAF809C078854D6550CACFFDB9C544213C5560AF9B957AB70D03576F15E62A
      FBE6CF2B92FFEB6B007681FFCFF6A116AD1B700F6A541ED96D567DE2DAB506F8
      F3AAB3F66D8D5E9EF5CF570DD9BA57E1F801C0313523BCB6FDA03DB15F4DDF6C
      D76324FB01FDEAEBF977855C7E97DD5FD50BB17CFFCF17B21A8A901FE3FD6F4B
      F5D0BD9E76E6CD9F7BABAE007100FFD6CDE8CACBB0FEC7B3C00FDAD9CA27C7EC
      DA88B6F801CFADF5275C53B2E8A99B662834AB6B9D4A57BC6F871B78F3D9FB7C
      F8C6A1EF126BF9ECA9EADADBC2965B5980ED5BE0F4FAFD9A49F2E501A15C0CBF
      2EBC4AE596E12BF5F2A325950223555A00DA35C55118C9E8D1902C6300D08D77
      518403A8E9040308A7E8F4C18ED1F93C864CF8C038A6849FE892A197418201CB
      A31297733CCF6A88201D45A3E61FB6D1807478A61029132D9E51C19732489CB9
      4BC9130B88C4C5C64389A51B5D44664A4790D990A39B830642A44C7E67558A31
      111E986486A5663C8EB20397E6045B1D4D2E205DBADA41300BB497100EAE9B8A
      DC2E3566C80DD440357494BF8A92C0AC59BFA5F4D95A4403102C1BEC572201A4
      6BE680806912F6523D0BDED66688068D35779CFD3698B2B0E03381E61EE228E5
      E459271964F3A8860E07922A693A9C065F8313C1BE41AB657428820B82498A22
      382E2089139C392CA12869FC5349C064DBDC109D0EA81D19810E0773CC6705CE
      E9C8A8C01BA011A028E1D453CDC1C26EC06F7A26549C2AE30E0048C9FF6DB006
      F2A6D5D4C09B49DE26C2BC00C0BD355F9FE6A3016DC22A7DE55A3F0E84913302
      6597AB0061FA42167ADAA44CD1B791FCADA5B006FF51EBFE782AE5D478A3D944
      388295C883EE4F5ABA1EE7D8B75DF5A4D3AE1B8CD9E6D105BBAAE33F0B3CA403
      38B4D1019DE9C2E53C5521D96C55A9D2FA10C37E175409A5F75680339D50CD8F
      E2A2B9A634120F19D5C7001C6D3E98842F605434796D276035CF78482C008010
      0200600C0180300600C0180300600C0180300600C0180300600C0180300600C0
      180300600C0180300600C0180300600C0180300600C0180300600C0180300600
      C0180300600C0180300600C0180300600C0180300600C0180300600C01803006
      00C0180300600C0180300600C0180300600C0180300600C0180300600C018030
      0600C0180300600C0180300600C0180300600C0180300600C0180300600C0180
      300600C0180300600C0180300600C0072400DBB05803006007B6C046B4B4DD49
      B4B001AC00414BCF671803006006E810ACEB5EE6960CE0030801052E71C01803
      0049A2C85191A59B5BB003190041D7BD380300600778C1D58AF4991CF0033C00
      41D7B370060035800B29A216317A1D176C00558020A5EFD80300154003559538
      AB82D33E323802A600414B8AE00C01528001D828DEBE5A696D9D8009E00EDDF0
      0600800272D14D236B7249970044C01052EEB803001380075BED512D9B29F81C
      014D00414BDAF803003F40122166E7BE1EAA138C0006008297BFB00600A58027
      AE46F0D09EBD2A6C003E0082979B600C0008009B41C9A6AC81A9AE7C00DC0092
      9798E00C003800B2C351EDDAE6831E5C00F4009297BB600C00D8008FC3AB0E28
      C1E1D676009900494BD370060075005BA8AA1CD6F63F85E009F004A51ED58030
      046802090847EAA1B49C276D3C005880256EF03C018027800F4694403EC5CF33
      8CF87F00562009669E8B803005B001B4CD4FD64B2CC42A2561E00148025BD76C
      C01802E000D34B50F9E61C7D940B4BC00DD0047C077A600C0024017F74A3CB0A
      A96960769B3600958023F1BC270060012009593B13E0ECFD9EEAD77C01680072
      8F8030044712A3800DFD300E3BBAA3A86000B00457B5538030030001CCAB1A6A
      646733AD16D7A6003F00454BD1700600C0159745615584E1D9B9234EEBE0B006
      00C010E7B7353CDC52F005500234BF80300600C0058C014098034E84825B620D
      818DC4B8DCD2B0B3F9455C87C311FA07EA6C27006E10A353F0A2146EC6FA8C45
      99814EEA97C42405319D163BB867A1C676BE6A62A74CA89E7E7AA1CA9CA09415
      7818D0FE8107C40CE0182D15430EF17F52E00C018002800278FD8E600C018030
      00A5004F42B1FC01803006003D6009ECB479FA2D803006007F0013E22D0EB380
      300600C004EC00CEF2F00600C0180084DBBE00C018030000813A9600C0180300
      5CE009E23EC380300600C005D004F11F1720E00C01803005CC004F11F7DBFE00
      C018030016E00EA6300600C00413D8D350BEC68AEE1F634F2C11CB2CFF426F28
      4635888B216C014214F87CA88A8616D99980300600C0180300600C0180300600
      C0180300600C0180300600C0180300600C0180300600C018030060041812A460
      0C01803003F001352F4BC018030060094801C7D134CC0180300600588026A5EE
      40180300600C00DF00753180300600B81EB8A438F59A6095FCA7AE2F7D6D5E4D
      59221754625829AFD33D71A60D5CE5166F600A5461004C2900AEE0C5D85A90C4
      61DEE98053118F2A4CB31192D7D0ECC00988EF9C12CB930597AC1D7B6CA4E02A
      08ECBE4726233B9128A687C01411DD6F8D8151352D79D8E2A49A56ECB1282A23
      8024317D44D78A31BD73C5BA72A2F8188D1D6339766DBE919288D931EA65E488
      6D4B4878DC9AE025B613A939E6C4874130E3324895B0C4F36A23A1A490801D15
      D11D0D2AECD2472222371385B4E3B294E3E23AF7A8880B975407F11E23C4788F
      11E23C4766C2314730623D1B8D5591840D98D44747AF75C236E1243EDD1EA9AD
      D446CA175846D886CE711E23C4788F11E23C4788F11E23C4788ECB8472366A5D
      EC1B4D94B37E59C474BBDAAAC843388F11E23C4788F11E2318234545112D2C4C
      41D50E86A1A008EF41731311E23C473F04777CF18E8F634E909A4C2EF7A70471
      DA211E23C4788F11E23C4788EF10475A5411D534539342BDC4672603EF11E23C
      4788EE7C475961C20B28C6E4230A0C927E23AC5F8C711E23C4788F11E23C4682
      2363111032E826C5EBF5F464DE2345A6DED88F11E23C475EC23A927A71DDEF2F
      2B2A11CFEE1729E730623C4788F11E23C4788F11E23C4788F11E23C4788F11E2
      3C4788F11E23C4788F11E23C4788F11E23C4788F11E23C4788F11E23C4788F11
      E23C4788F11E23C4788F11E23C4788F11E23C4788F11E23C4788F11E23C4788F
      11E23C4788F11E23C4788F11E23C4788F11E23C4788F11E23C4788F11BF11CAA
      BC320328BA6F825F6EED3B27980AE6CAB5F404D47165C0099388667AA8AF9195
      69C1AC9D2B2643BF11D2574A3CB0AC791D51AED3CAA9E91C4755B8692AF9B659
      9759246BF3811A0150F0908CB28771E2350119D68D525015AAF4311C063D6CB8
      91A12888CEAAEBB4C58EF37111AC1D11C6C36E2AEA23B5BA698EE76A08A0AA7C
      AD88E316624645C5BFA3B656E388A2368960898B6AAB4B47C9EB388E4423CA1F
      63A89A2447140512238A006EB0C9A548C84CC0ADD8754C0545863D4A3693CD58
      750CFA600A88E3E47A2DCA809624A0C7AE02A08DA5AE10A89067D13BAE00A08C
      E222B8E6B68A631DC90A1405511B820B48A8812A8800A88C952618AC6D1A041C
      8FC50150474210083CD237460055CE291B801CE6B032352C2C5015447569B510
      49D9001511CFE88CB45A41CAA1F420280AA235EB16048A683FDC0D600965A618
      321149A5066D0B9820058098DF1F9B0F79ADC4004F800B88E07E14F81B08C79B
      502CB017C47F295A2F8D8AE3E803F0AC0FDCC0EC5C839CEF77B0B017C46CF7A6
      E1FFAB043BD7007C46807A198404B234FD3189602F88CC0F177F1CC9F6C01F11
      EE77815A93F28CA186961A02F88F69EE2426335B7C7B001790FBF7F1D9E8101B
      62B8680BE23F9E1A9AFE401EC00F95656C65DB5D7950C7CFE63004055FD878BB
      E71BABF74380008B9EFEA82B2467042B6F33004079EC3C832CCEAF0045280004
      EDDC4DB2F2291A39CD7C54010276133C2E509E5A38000B9DA6C9C81B6BBE2592
      A7626024D73FF4589804CA8001859AA052134F90D477FFC54040C2C4A2758252
      8B902A554000DDFFED4DA2975EA9682162A8085A98BDDC46777A4E24001736E6
      486E11E990645D41D9A010B9B18D42450899A000BE37D78C9C49D939D0FC1E16
      C042F8CD69669ED7B3FDE812003080FFC30AA919DF93DF716C04243B7421F621
      C4F351BA80170AF94B2EED0D8084CFF17E481398DA8564B600C153FAC5698220
      E84803237CFBA6C207E7880C9420BFC6E283C2FF33CF75779CD80C1F1151D05F
      B1F4F7C4065DDFBB051DBD90B51EE79280668ED9FD187DFD0A38880C03827E61
      1C97103AEC1FE0ECE1B2F01FCFBEBB61EE6824100FE41BEC28222B98CCBE9CCB
      B1D4F675780F15880D27DAFF836799C40335435370308060A636D900C13C6082
      C806A8E6619E7B9F7AD7E0373100D27C043AAFEDA7BB69CC5C91E76C33081DAB
      5E01A2480614E6EB102DD91CB6DE403F17643080D118C0680ED6904FD040BFFE
      305B0B480C3F97A403C5EC9EBB47947BEF3900FCD9375900D9EEFF101C67481F
      DBA406C9ED33000D11DE575AA7B42407F26A03AB05BB047F4D72FBD504F970BC
      04F8ED88C7BBD387F9080ED4F7E3C00F3BC00FF373F880FA0F007C2F801B4F87
      3E80F4378F68E077C201A5FB3E7B59F2C96CD9B9FAB4341D95E541AEDCCF1FF7
      969CD189201E6FCBE7C01E7BE00C2DD9CFA0365C401AF7C741007F33DBDA16E5
      96F7BC57F0F6D6FC665CB044695C28BE330ECC31F5A793ED25B3BE53AB1FC2CF
      49AC2D8F3FF8599A182F2FF67DC265922682D6BEC658DF33D802F7077E40BE2D
      E41476E1109133E905B15F0A05C0B625058C7C8BEAF8B9A0BDFE639AE5102E05
      C0B8169301695EA789C605C0B53A0BC3589CFCF40BD6E0BF9CDAAE1E81702D64
      82F068FD68366E605ABC05E77E2386F205C0BD760B7DFB472CE40BF700B7AFC1
      B081702E05C0B81702E05C0B81702E05C0B81702E05C0B81702E05C0B81702E0
      5C0B81702E05C0B816BC016F93482D7CD91266CC37EC3E0BC87B9F6D5BBFFB1F
      DE9355BF6CF0BFCF2B9253999CC2E625BE1F4FBE7F05AEEF7E72921708167CF9
      F47F8AB4817984F8EF69AA0D273FD405B9979C9EA5EE02C9B6CF67DE8F77C906
      291EFBF7FDF45F2E7D851B2F000017BF573D5F2C7D15DCE66E7C0424A1111A57
      488492BE1FE8C2ADF7F08891264C91BCFB869C2AD199F39A2EA9C30FE6EEFA7E
      08111B6FCEAA697AF5462351FE7C423CA4CCE37D679722EEACE2DA216EC05FDC
      F882849A23BF4FBEFA6C7B8C61FBF990BA78154428DFCF4F8F44A2FF3D40E7E7
      4CFE5DF39AE92CFFCB80452FFCFB5C049C8C7800083FBBFD8E0024B28003FBB6
      A96388B808FB8AB1F6498C808F026001F8112FC332F12008D3F90773E8ABF3DF
      1D5C2D645BCC7C73C0232E3B543C535BE1737DBDCF67F9CCE9CA008CF3FB7FA7
      2FEE350132D08F0CC9FD5112A390133008C0288F4ABCB619F07AB990E04E725F
      714CE945794C4600CAB92FBF5E95711890ED088F92527571B172D11F0B8FE7C8
      CAB84708E11C2384708E11FD88F1F21F9F1F439E09DE584787C6F17C388C02B9
      8E30AF1DD7CA67C988D4555B611C2384708E11C2384708E11C2384708D1F88FE
      BC3C87705E23FFA1AFB3D823EFF0F7E4FBD22C2384708E11C2384708DC84607D
      FC568FC280427FCB3EA88F95DDF6C2384708CDA119C49487FF8CD9335A205CFC
      C2351516A84708E11C2384708E119AE11F899C465864E2E61B623EFFAC7211C2
      384708FA688FFE3BC0EA98607D89EE3ED5119416A442384708E11C2384708F8A
      23797B06DBB830CB129258CC42366666E84708E11C2333A2376C34758A7B3BA7
      BC461F739ED30C984708E11C2384708E11C2384708E11C2384708E11C2384708
      E11C2384708E11C2384708E11C2384708E11C2384708E11C2384708E11C23847
      08E11C2384708E11C2384708E11C2384708E11C2384708E11C2384708E11C238
      4708E11C2384708E11C2384708E11C2384708E11C2384708E1199108FF92EEC4
      E8D291A31A867679FD511B7BEE00F1521BD1FD992329425C46704628A002377B
      99B345E72E23363300125819D356D99733FE70100E0A00001C32FB3D0FC82E9C
      0633936662DCC5C47E3F389B8DE7B47DECFA898643E2119B188C7F51EED0B8F9
      25F1190129F9D1F222F88F9DF46DB41E83F7711BC1E9AE7DEB7A0DC67AD29F7F
      F5889EC9F829B7633FA5E3FF7BBFDA108CECFDE4469F5742F0BC85A022B54460
      20DBF33C40456B08C03AB80B904601D5C01CA231410435C05FFE8ECBF8AAD700
      8C0C95C00F3D5720EAB278008DF91B7AE00BA6C4B441E5334023057AE001F5A5
      E337BBE8808FFDCDEF38024F2A79963C0B3011B00680015171FB9F7011AE68A7
      DC01708F39DDD2469828A250D000F9B9F01F20232F6677DC012569371C55CC1F
      8B48280044C245088FA2064CE008D99487D2807E167DD13200E1F63DE245088F
      9745D97005DAE6061D4BE14447206400226122BDC16052B600ABB8AB3A663F52
      1193FBBC0121294FF40330282D738BE8DE028DEB1ECEAA6BC423A53800F8820F
      DA6EFC2287510A7EABC05BB5DA2E2F91D108CA385E002962BE39E99D61D5E02A
      AA535E0FC0EC847F33800CACBDC234BD90FFFA9CC05BDD5F5E78333211948766
      00FFFF1D5B8F95EE498CE8B60114AFD648EE115652B3B000A57EAF17248F3C5F
      4E6EC02F5008608E9E7C8F321F6C00E8F2F32593EE7FAA835B00BD319D69295C
      2127637080069071FA0DC738961D3C879760153D1F8C1C186C961906B6001151
      A9D4F2C985D3D369B601489B436EE5A6C997F9210028A9707018AD613539FA7D
      6F002FD6C4CA0E8A004DDC89FE001E6FA8B147937362FCA967002C0E5823E09E
      069BBF30D70003210E2D9BE3C4FC7838010E6C6304509040DF1D662803B7DFFB
      4D68186321FF9E1A3E005C90D55A5897B3A921E273EC27101FE753938014F43F
      8BF7CC13377E591401A5A7BB030D3201E9FEEC1A98505D70C0096180FD82BB46
      03C96F2EF79613D060C1F01B3E8078A8002A1F8B740286B14CF98082F447474A
      9F74029CF3138F313FC921BE23A679647D3E2E33F3A4C0C5A60899A7C1BAD741
      1F84A3DD9BD9D2CC4DAC11989B87A585DE05D480011E829559E70BE18AE88EB0
      032FF28522344688D11A2344688D11F6211EF023D3E3226E034FD911EDC279A7
      0AFC73704C2511A2344688D11A2344688D11A2344688D11988EF80C19A0F6C52
      F669B30622344688D11A2344688D1192047D613D944CA32A07D3897F088D11A2
      34462B97F41574A66079B32D222344688D11A2344688F0608C5E5C479EBA6C36
      744688D11A23F1023F797F8F4221AF26E8F43B8A2344688D11A2344688C7C23D
      892010C00EB83B8E7D0644688D11A23447F0211EE78A60239392E8911A234468
      8D11A2344688D11A2344688D11A2344688D11A2344688D11A2344688D11A2344
      688D11A2344688D11A2344688D11A2344688D11A2344688D11A2344688D11A23
      44688D11A2344688D11A2344688D11A2344688D11A2344708E11C2384708E11C
      2384708E11C2384708E11C23847FEC11E73A99F353C320BCCA33BC3449F0608F
      D9FF542016D3587F315200E5C233D0039AB8C2E077C76F5E653395DBB9211C23
      7411F5BCDE564525D779911F2FDE3AF5766C3EF04668F2D17FD70277EDF3246F
      0464207A7C69844574C47D8A858017E84709D6E5380104E9F8BDD4CFFC7B88C9
      4CF002088434C6BE63E76827029A7CC70022545E9C548E46B9359681B5C0086B
      AD60F9336373B888C2B0E837202DBE95EC45E99240188F6CD7477C808CC2590E
      E99DE91888C63D1A0BE405D00459FE019B4C5C46080FF45C80A2DE070BC0EDE3
      3641181FC98E7202B1FABEBC605ED58B11C0F4E8EF20231040D62F69EB1E6611
      E085B90142FAEBCCF87743C3E11CFB1DC80A5A0084C24FF46F7733F431FF0058
      2D90CAC12DE286790FBC0162ACFB3F196112917CE5A1D47A020275DB51D2B061
      340B0C1FE5ED0F4059EBFE24D2D789D830BD7E5B3DE80BC985EB396D0BB93C37
      7BDDF3D0165AF59412E32FDC377FAAC87D3D016DF57EE89E57C9E280FC0F0FCB
      E80A372EC5FC386646C90FACE7ACDE407F32F33CF7FD3FA02CD71EEB7DD0DC1E
      53F47DA4E433D04F004071E211B61038A106B553C2A710DE5FC14B1FFBD01C53
      E86BBFAEA3669E07E390659DE200401BF800DCF2004008010020040080100200
      4008010020040080100200400801002004008010020040080100200400801002
      0040080100200400801002004008010020040080100200E07085F035003E3BA0
      0400801002004008020040080100200400801002004008010020040080100200
      4008010020040080100200400801002004008010020040080100200400801002
      00400800EDE3BB1BD5CDE3FA09EC900D88823C51F403EB1004E8959437D019D0
      89B514D08B480100200400801002004008010020040080100200400801002004
      0080100200400801002004008010020040080100200400801002004008010020
      0400801002004008010020040080100200400801002004008010020040080100
      2004008010020040080100200400801002004008010020040080100200400801
      0020040080100200400801002004008010020040080100200400801002004008
      010020040080100200400801002004008010020040080100200400EA0001AF1B
      F94DF4121AD8556A203FFDF055FB1040257B0DA1762DC2AB48A7A03FD831A80F
      8056C6744036DC8783ADC5AFAA0C3476DEAD98C9F1ACBE6480ADF411712D976A
      370D9411EFE64FF9B72633FC9F9593BF9179635FE9F4C9E1C7D900FE76D50B9F
      6CEF907DB2A6298E31FEA7EE67D03F91B737D06E6DB67722DD64D7C33E551558
      0FAEEEC07AEBCC9F95FB635CCFAB29F4829BB8FD0F33CF2E1B67A6B8E4403DC9
      9F3988861E100D2BC08864BFC7EDBEE42529BEE2018AEE7F336E67201AE6D195
      DDFF0DF8E3EC325A17E9B61418DFBEAA6A7C60D7CE7D589090EB18807AB083C2
      383C98EF1CF53AE203DE900F36EB19FD46403CE3E529EDCBF71C989BFD79C061
      00F6A73B82775D2CC5F03AB77C9A403D9BB690BACFB9E7CBEE8B16F30FB4DE56
      97DA7EAFFCFB1D6DFF1F6938E86FAF036FABE4272A88807B27C975303EA34F9E
      4036C7DEA480BF4C2BA0FBB1AC21F73693A4FF1913D27C848DA2BFC98D784032
      15FDD408060AFFD4001900FF2E2E0EC0744DB735D1E6A3AE7E89217DD91E8DE4
      62F5F63DF0E2DF64BE2DD5FEA937A67134B86EBE8EF13DC2848FE3DE0BF3A17D
      D869BB86C6E95ECBD4D6F2D29ECB98F58FB19DBCFB3AA2CFBDA9B545FB4FCFAE
      0BF5D9BA612E7DFF23A5B2376A11C9ED39E6466696580DBE9AE4FDBAF4E53341
      43863D8F43351B4DB4CB3C1B9B97C18ABF966875B1C39BDCEE1CF396BC828695
      2CB348AA75917AA4EB37077CC7841F9565E1D7D232F0017F5100FE86409FA5B0
      067B66A8F2E7A64391F65397CF60E49CBE5F8864CD469E50EF0F21EEBB5977AE
      DAEC65E31B5A333EB9EEF95978E76DCCCBC50DFE3B2F05425CDC93ACE8B9346B
      AEECBB7BA17673C59DCBA3874E744CD201C839750F81D8039F393E4B88E33C0C
      CBA81A4E56B7DA7DB67B4662DCF872372472E4C4B903A587216F0673282A6B33
      8C3D182D1AFE71CC0045DCB401DFF5EBEAF35E1D35C911477802EA115F3200BA
      000A8356A12039AA9F934832F7B6FCFFED46F98D3EFB7EFF1122BFF228B265A6
      FAFF86803CC01688C4E13554827222B3EF25FE404810074008CACDB4FC94CABB
      66F35401D003E1C7F7A0752B7736DDEA401D002B3D9D45ACD66119BDD31007A0
      0257B120DBFF500130006F68972A40F77ABBE64657C23AEDA4B83D5DF3432A11
      9DA34C6ADA95DF565F105EF34507AC40163006D483EB3BC4B9B324010A002345
      68737786C1A80098020724848A4017B18E49F629D576F763015EF9BA521A547F
      9BB52020F2475A00E801E11DB2636AF79F2002A0087CBD891560E5A00FF00091
      4AF7E497BD7D486991F05DA906DB4E919007200BF7A5CD9715EEB3BAF0072BDE
      D6800B0015EFEB637DA5486C91FBE715EFB5F7CAF0FF1A5AFB072BDD20EEC01C
      C6FECA00300057B86EBDFA6A437A8F8371483766FB8E8039001FF86AF7DDAF7B
      4D0018002BDE195EF5D521D65EFF9E29046616E7401D000D70BD2F759DEB803A
      5EF62A003C0057BD88BDE64A43C08FC0F6480D796360401D00291D4BA5EEB3BE
      00076BDC15001F002BDF535EE54521E647CAF9A41E37BE3D401D80351FAF6BDD
      677D200F97BCE10040002BDFA85EF68521FC47E4B9A41E1FBF6E401F000A279F
      97BACEFF001F2F789200800057B8517BFB2A422D1FD73A2416BDD366401F0039
      697FE5EEB3B1800F97B9AA80230015EE585EF38521268FD1BD241DE8597C9814
      008B8B3F97BACEC9803F5EFCF4011800AF73EAF7F19484AA3F32F4904E75ED0A
      00FC01A74BFFC6F59D9DFCC8AF757BD7A5EF335212BFA26AFE920E80AF738BDC
      96FD7BA419D00097BCE50049002BDE44BDC975213A8FF8DE920D815EE797BF24
      AF7ED57BC2417B99A00920002295EFFA2F7D3948622F7E6BEA403B57BC45EE49
      C90611ABDFA72F78481155240134000452BDC5995723C1AA90C75EFDBFD480A6
      57BC75EF1A646F39034F243A009A00A9133B2E51B78319BF401F8025FCD0D107
      74A2BBABB658CB5072F8BC739D59006D0000A4160F33212000803C3B96B44BC0
      136A0F2CAEF1434ECEB071D41042C83889063C6948E6A2FDE029C74D5F13467A
      0EF55870925270354013401510520EDC5F4140010058BED4C917049DB52DC710
      004011572922FE914502288CCADF59EAC80078035A6D089AAA415A11586E1A93
      CE6C5C01DADFC00F90062626A8856788AACF9383C8A89401DA801326AD1A4040
      2A6EB391590BAA29BC61338397C0703F03ECFE07BA06C5B3926C17841E1F3B6B
      DC584EAE80AB3C05E184BFF78049449B69B680936CD66D96FA96CFD9F33F4BA9
      C8D2ED66B53BE3E0E178C9D8BA4BB18A694D82349F7E0D949E88004484253119
      3CCC4FA37755BB996C090A78606AF7E091FCD388703AFC17639547020108ED9C
      480DB5E55F83F1C6C320E2BCC1E5CEB8472FEAF2BD2273A803D78EE0F843779B
      825E927728C11B745745C480846DFCD882A81B19851D9540949BE6D26D846DD6
      581DF4CCB67A1D6332AA2CA74BEF73936D36D56FE5436F82665BB788D5826DE5
      81B78586F04DB95976EE5A37B831B6136352AEA9CDB1B73FC1A84D8175496DF1
      D8CD7051C71A97AD5936D36D56FB26A7020B447C01AB04DBAD3822911BC136F4
      66C187CDE0E51B915278084AE86D3EFFABAD097696ABD5D4D436E97A8C0F0836
      F27DE3D3404D17C5ECBF6CF909F237E05F82F86EF01650FDD01C2D36F74B18E0
      DBF7EBCB47638906A4EB69C9AFE1B1D0BA48122666AB759A1EE036FD653AF80E
      B317F36EB11D92D1662A1B02C5478E13C0EDAADFE919940288CDBE65C21E3538
      8B7FE2E80D58861A0DA4B546AC156FE562645F6ADD96A619AD9FAFBE3241066A
      D1636E32BAF79B7479913F89A22842D40646C66AC39AD9D353A92AE0736E055A
      0D8A356D68DBE04F38CEC1AB0295B8BB5316AB70EED4F5D3C60D876AC336EB76
      BC1CE3561AB7C1CAA2BFB56276A63A4C0C5A9C56169B1F5758648E1DAB449B7C
      5EC33D2CAE8DC6DD633C7A42D0510E648D1B561DC267642CDF36CCE1E29116AC
      6D4DB1B56972B72F6A74956F4EDA9E7E2323D635619B703F774784D586D4F6E2
      584FDAB1A3532608CD96A7F21FED5888D41CD6CD9B7C9830AFB56859AD209879
      C4C131E088C6A7A89AD2656EBAD4E4A6B68CDB2DD71AE61AB4D06DF01AB6915B
      CC353DF2B7041A9CE6A673D46AC436C0BC80000D5892179EDDE95F6AD44D4C99
      FA865A9D3357E73F988FA2F805C2529B7D3DB7AD95DC2120B0CEE3CECEE19F4D
      4C9949AC6ADFD997FA13D16A7CD5C25F1B7E52725E8356B436FCAD5BDCADEEDA
      9892B7331A98AE9B6E00D58A6D9278FC822D58A26E311BDEFB56BD6A65DE8DFA
      D4F9FD2F1155D16BA3272B796FBF20DB2E56F40DBEAE0A2E8FBF0C123635A0D5
      B0F67D2E2A7C08B531CF2FFC4D4CA6DC5BC332226AC4E6DEEBB7F11FB568356F
      94D4E355BCB8D4C4C1C3C69AB16AE21F61B8216AC5CBB59B3FD2FF6AD9CD4CBD
      A8D11A9F16FF90F4DAB17C442636FED5B68DB329AB8EFDAB617ADFC1179D7B4D
      5B03ECE53B1D9F3F6A7C5373C46DCB00FCB26D5A74DB08F13D160D5AE15BE7B5
      3BB56E066A67CD5A41B702D58BCF7382F88231BC6A4C367E8DDA837AFF3ED4C5
      8D58FE7026DC2B79E71FA1375840A2E5CC1FFFEB74DB4DB55BEC1B676A7A76AD
      DC6DEBCDE39B7D1F3D01C59BDB615BF095D26DC86ADA417807FEB725B1936D36
      D56F20B53405AD805B14758A024A24DB4DB4049B7DC6D9866BDDA8A2000433E0
      322F81F94F81EFBF01985059185F8788387FC40125CC75CCC9F623FAEDDF37C2
      6AC5D077C0BF05FC238AEFD136609BB63DC6B41E1834C09BFAA2B1BE05F82FE1
      14B444DE34DBD25AE5067CEEAB9784D924E343F371667EF167C22F59034F847E
      17CC1349B19CE9A5E3223F9CD2F1B81C8C1C123E4A1379BC229F7B3023030124
      3CCC50DF4E2BB86911A360C2335DEF65F168E104E157CE7F817E0BF847E17D23
      6FD97FC11D08E1096DEAEC194DB4DBF54DBF93233ECDD90F0C23E5FB2EA5219B
      0D97881D7A64B4C2DFE26B1F09DF5D4F67BEDFB2CE0E329175A5B747E3E03EC2
      619F5890BAE0F226E3F9BE2DD80EE7A289B1348059144C237E607DEF6DD89766
      B510DEF92D720BE71B3ABBE31B06FD96DE9B69B7CD9B7F8B7F67605D2BFFAFEC
      998AEBE1DFC58309A07D8DF7AFEC9986F03134AF99A1FE0D7DBA8DBB4651DD59
      C53BBF7E51EAC825DC2995D1C8DFC817DEBF4F09BF0EFE450E6DF7B05DE3EAA3
      615D26DA6DFC47F9E98492787B3F16CF57412280230A37D619683C9F16CF3782
      450E26C06312C0D5449FE3E67F6D15839FC17EEF0135674AE7ABA49B0423519A
      24CF75D5BA490252DA121071CE13F4199B674F1EDE705151D828F2D56EFC6320
      D72F575C86DC27CFF3FA28C9F659B693FDDAE71D7AB3CE636F0FF26CB9F55D6F
      576ECCCE71BAC7FF5DE060C6DFF945ADAB6909E5ED40A015017F66DA58C39F0F
      29B9FB43D5D2575A5A1200A1D7F2DBDFB43D5D2527BC4DE1E155137C7D9F2457
      3D5A3D5D235949B04A4FE658E2E31F5A72A56E949E972082999E3E01FF1569B5
      18633C3ECF897BD9E7991A0EA4DF4AF7EA95D7F836FEE7DB76789915D4E4DBEF
      285FC8DB0BD7497736D15A7FA3AD60024575FA6DA614DCDC5E37FECC848BA609
      930EE826C57C2FB8FECC82BA4B8A809B5566BC4DF33B76CFB20ADD2451693D6E
      2948A5C9EDAFF6AAE3154DBF7CE7F11FB336894C524734C97F6DD9D7DE5CDEFF
      3719B05C137F4DB7AFA9A2B626CF7B5A3C29B7ADF7646F3AF19BCA1B6AFA6DAB
      757EBFA6DABEFF1FE5FB9BE308ABA5CB0C5A9B3D7739DBE7C455D2E316226EF6
      0302F487BDDE4C7FAADD693D6E29718BB3BEFDB747331EDED0B921FEE87EBD95
      A4D6F45CF672CD845A9AE58534DBCF6DFF8B82666FB2C99F36DBFA9E1B826DDD
      6FB7B336FBCFBD6B7D291DFC6FFF6B5574BA9C8D21DC3A9F7FADF19A9BCBA00F
      1135D9B57ECFFBDDBE084F8F867E4B5D6B714B8C55D007235BF8FC57B71F3E3A
      E86D1AABA57EAB360B5D71C132EA7184DBDBFAFE8AAE95FAE7B55873575F90DB
      D4D4B516574CFD5A6C1ABAFE46DF96B7E388CACFFC576ABA6D4E7D62334FD7C8
      F7FB2EDA00FA13551C54E86F335969146A4F6B8A6C62B6803FEE53F6CE4A4EFF
      8CDB5381B61B74E8036BF3E5ED79DC0AE9B538DBD747AFCE37AF92E0379B400D
      B3B4626CC61CED50DE4DF6936801B6769CEEFF3DCF3D3D0AE9B538DBD70DB0DB
      5BEB634D83575B6099B2C2FA9CFB75B1E451E93DEE29F18AFA00CF1135F5777D
      27DB2ADF2C2FA9C3C2F736DE6C1EBADF04CF9617D4E06D86DB079967BB8098FA
      7C1306DD0FC54CAADD5E51C01AF701A0B81F20E07AEB80D1A6EC9617E4DC3EDD
      ABA00FAD4154FB9F121E52EAD6DCACE69C626B0A9E7380FC39F5F13DFCAB16D0
      C9FE16B35701E172A7E9C0CD4E77CD306E03F67BD06781CEECCBE2EE556CEDF2
      9EB6AD4F3BF3E14C395059B2F5592FE07CAEDB31DA9C2E6C5E9F4C358BEABCCB
      EA91B6B711A86789620013900237ADDE04DDCD0DEDD29B8007B800A71E09BDB0
      1BB1D8E0E33960011400E4D04DFB40DD5D426999443A2EBC756E26FAAA800F40
      07F30387BB340FF8BE47BDF95801EC00FE6070F78261F52791EEBB6B0020007F
      50387BFC51783DC3DC0038E34BE87BA5770023A8A01FD40E1EFA883F94F45DF9
      6408014403FF01C3DFC4997CEC58015003FF81C3DFCEB07B54A801A403A10387
      BF550FF7C5DE2EF001E89EF669A0040007420773DC3E107CF3F1A4FACF3AC001
      454601D2607BD629C9C0008344594D1026D5C0DD89634A003DC009B084DB7A00
      A9E51D234487ABC26EB90DA8666FF03882693FCF3550FF80367E6AE99C3ECFCD
      5BAFFF9AB4CBE766725BFC24F339D93954E62B4D1E87E65B1457A765F9E8CF5E
      C9DE9A4B64CB3DA23B912DF9E800EAA005569313900061E1B68C470F51C77000
      DAF003631428D3B82B3690A30A300014614614614600028C28C28C28C0005185
      18518518000A30A30A30A300014614614614600028C28C28C28C000518518518
      518000A30A30A30A300014614614614600028C28C28C28C00051851851851800
      0A30A30A30A300014614614614600028C28C28C28C000518518518518000A30A
      30A30A300014614614614600028C28C28C28C000518518518518000A30A30A30
      A300014614614614600028C28C28C28C000518518518518000A30A30A30A3000
      14614614614600028C28C28C28C000518518518518000A30A30A30A300014614
      614614600028C28C28C28C000518518518518004C51800A13007F2A5A3D0EDC4
      15DF701FE5C07BF504CAADC2121589B80BA5276AADBA9101A2500DA131D9A543
      4367AA1FF2BBA95EC61ABE9625FA9CE4BC35E99AF2522F03454D1F6F1D63787F
      9A65E76054DFF966ACACB2FAB5F66CAB0F65BD56C7E4B6D5FCCFDA9B59E62ACB
      C1A4A6EF9B357F6035AB756C68AF2DCBBD528DFA16B2C5040D79ACAE856A9BAF
      354A54FDF656A8E034EE2DD7AF3993DD6B72E5F96AF8D4AEF6B979C4A74A5A6B
      55AF6D8FE52AC1AAD92903F6F37499B17C3522ADDBB52EE29A95606F01E26257
      9E000000000000014C00AA9200080034000351BB0BA0000014E00AAF330A0030
      F9AF7EC059770B2EC030E061840840A050EEB2ED4002F586165CF59618176618
      40840A050EEB2F420034DBA165CF5961817861840840A150EEB2F2A00331A516
      5CF5961818461840840A450EEB2F3400349BC165CF5961818461840840A550EE
      B2FB8003B9EE165DC5961819461840840AC50EEB2E72002776F165DC59618196
      61840840AC50EEB2E400024B3A165DD596181A261840840B050EEB2F0C00327A
      1165DD596181A261840840B050EEB2F3400341B6165DF596181B461840840B65
      0EEB2F39E9CF800165E0596187B861840840B650EEB2F12003299E165E059618
      1C261840840C050EEB2F9A001DB7C82CBC0B2C30388C30810818AA1C5962CB16
      58A242053E59715081FFF302CBC6B2C30FA4C308108190A1EAB1987FDDE4824C
      F53277117EA68C007663F70186186187B861D53593D61BF30EDCAF1BF7D61B8D
      83168367AF76EBE0C30C30C3E030EAB12519C4967F8033EB0C7CCCDBD5EA9200
      024FA0E40861861861F3E61D52E685918F8122A7701A0381F97703EF761435F3
      C456DA7B2003580F60CA7830040080158E02C3C3CAEEBEAB2EE8AF82604BC8DE
      602BC2CFCE8B7AFDC06BD7EAF979EFADA962405846BA00AB73866F50B7F77C05
      84E1DEF16757AF0B6FBDB62F11013899C5901AC0F0D1D9EF75901411A0AB73B5
      3DCE1746B2156EA4D5FC4C9E6405050991177451D8179E008A34156E8BB8D7D3
      3F3E88014542055BA2FE7A29146845C45C45C45C45C45C45C45C45C45C45DCE1
      846A975700B8117F2AD3335805CA8BAD15622FD5517EF217364402E545E419BD
      7360108B855C517E2537EEB080BA51743E14C45C2AE28BCFD02751760108B88B
      C4ABD1D63DFC000845C2AF222F23E50065F25C9B80A208C80E117E945E6893EE
      F1C02F145DBB76E4FAA0178A2FC0FC17F7DF8DF02E029AB74BC9C05104680738
      75C05E88BB2157145FAA39B5345EEB615D37602F545FA067CCEF1E442701743E
      7837014411A01CE1D7017D22ED05588B88B88B88BAC1179FCFEE5C7017DA2F03
      65FDF34048117822AC45FD08D55917696BB2F7C048117852AFD0F45DA24A018B
      BE77134045E652E595FC5B3BCA0271340F5FDAE2ADFD7FC783874B2F7521D9F4
      25681FCFE786CD2FE4B89D7300A008D460EE57935495B45AB4FD87E5BC6AFFC3
      F2F4B6EF9E3C15710B16BCAB8305DD3F2F004008014140554BBAD5A6DD73002F
      6E0347703B540D57D0E0B91AD7F685EDCE1FB6F2C4078488AAB48E9DEBFB8340
      000000000000000000CE00254007F86000B20B20001640002C8000590000B200
      01640002C8000590000B20001640002C8000590590000B20001640002C800059
      0000B20001640002C8000590000B20001640002C82C8000590000B2000164000
      2C8000590000B20001640002C8000590000B20001641640002C8000590000B20
      001640012C9002592004B24009648012C9002592004B24B24009648012C90025
      92004B24009648012C9002592004B24009648012C9002592592004B240096480
      12C9002592004B24009648012C9002592004B24009648012C92C9002592004B2
      4009648012C900259200F1164801002004008010020020C003FB7C98B9104ED4
      6040C303F46607D4180E76B6D111187EDBE1101CE7DC6BC0E0F26AEBBCC0F5A0
      601EB72FF758B4008010020040080000600B02107FF8D946180107E7D88EB5D5
      8481B9CE404762BAF921D7A1F08477B7243B9F6908470924849C0FCDD3764121
      AC592090D86EC82431207FDD2CB41211155A0908A59782433D87E5230CF28DF2
      26251619EC9BF2D62480100200400801007EC00768A43C6C6471F768BB59E666
      65E168BF3F0B31DA187C45A288B7BFFF370480901202E5005E4C0FCAFBEC7BF4
      66397AD0D65D7DC7EBBD08BD6F70C93C61BE07187729E80840A817FC6052FC4F
      A7B1C3E9B1663DDB3C57BACC4279EFAD068E980870460101202405DF00BBF041
      0E80901202F7804C2B40A8161E1597CEDF1012024041A0179F7DC3F69CC53DFE
      6C181E76180F323C17AE0FADA81160037CB7C81502CA402948785C2CBC677ADC
      3488841D68E435B4DF508CDA3F4BC1D1404809010DC0473243FFBF5CC8E005BA
      EEC6B480B02D53C5920E4048090116FC5C660023A73615A0540B1F0AFE6ED8B4
      809012022A0088FB777B59DC5E70891888A76321B943C446653A3DB17FFFEA80
      90158F0175A525C03CB107ED3DC023695B590627031393954C27FE1220240480
      A2C02F5A7340480901120B01BA9044E9C0C0BBA9CD856809017E2215E17E2E51
      0120240543017748010007C014900606005133EA651F020240480AC80269CD01
      2021C34E70D73AF8D0030AE9215B3968090158901717CDB557E2005A3B4E6809
      01202A169CF53086FC80901202F50151F56D7C6801856D39A02404809A73400B
      47400D39A02404809A7340480BF6539C3D5B5F1A00615B4E68090120269CD002
      D1D0034E68090120269CD01202A705BEADA00615B0AD9D1404809A7340080165
      ED39A02404809A73404809013AE7400C2B615B3A28090134E6801002CBDA7340
      48090134E6809012028539BAE7400C2B69CD01202404D39A005A3A0069CD0120
      2404D39A02404D39B4E6801856D39A02404809A73400B47400D39A02404809A7
      3404809A7369CD0030ADA734048090134E680168E801A734048090134E680901
      34E6D39A00615B4E68090120269CD002D1D0034E68090120269CD01202F69539
      8CFAA191809A73400C2B69CD01202404D39A005A3A0069CD01202404D39A0240
      4EB9DA73400C2B69CD01202404D39A005A3A0069CD01202404D39A02404D39B4
      E6801856D39A02404809A73400B47400D39A02404809A73404809A7369CD0030
      ADA734048090134E680168E801A734048090134E680901126D39923BD1FB4E68
      01856D39A0240480A27012BFD002D1DA734048090157D39A0240480BB80275CE
      801856C2B672D0120269CD00200597B4E680901202F16B9D01202405D6017EE3
      B3700134E6801856D39A02404809A73400B47400D39A0240480BF29CD0120240
      5FD01750846900134E68018575DC2B1DDE6823D3E2001E30188181C43A299DA1
      82ED6769E2178AD7CCDAFAE003CFC055348C03D8C8E526F24DA7F708A0040080
      100200401F400D9A004006E711EA00DA5DA0040080100200400BEB400BEB400B
      EB40080100200400BEB400BEB400BEB401FA010B6400800C009EF0027D70027D
      70027D7002004008010027D70027D70027D7002004008010027D70027D70027D
      700200400801002004FAE004FAE004FAE00400801002004FAE004FAE004FAE00
      400801002004FAE004FAE004FAE00400801002004009F5C009F5C009F5C00801
      002004009F5C009F5C009F5C00801002004009F5C009F5C009F5C00801002004
      008013EB8013EB8013EB801002004008013EB8013EB8013EB801002004008013
      EB8013EB8013EB801002004008010027D70027D7001897643BC7DEA48500FE30
      18A181FBDFB01BBAEE921830FBAFD52031306FB7A4D7AB26CDA5DF00310317E8
      01003C80117F0022FE0045FC008BF80117F0022FE0045FC008BF8010022FE004
      5FC008BF80117F0022FE0045FC008BF8010022FE0045FC008BF80117F0022FE0
      045FC008BF80117F0020045FC008BF80117F0022FE0045FC008BF80117F00200
      45FC008BF80117F0022FE0045FC008BF80117F0022FE004008BF80117F0022FE
      0045FC008BF80117F0022FE004008BF80117F0022FE0045FC008BF80117F0022
      FE0045FC0080117F0022FE0045FC008BF80117F0022FE0045FC0080117F0022F
      E0045FC008BF80117F0022FE0045FC008BF8010022FE0045FC008BF80117F002
      2FE0045FC008BF8010022FE0045FC008BF80117F0022FE0045FC008BF80117F0
      020045FC008BF80117F0022FE0045FC008BF80117F0020045FC008BF80117F00
      22FE0045FC008BF80117F0022FE004008BF80117F0022FE0045FC008BF80117F
      0022FE004008BF80117F0022FE0045FC008BF80117F0022FE0045FC0080117F0
      022FE0045FC008BF80117F0022FE0045FC0080117F0022FE0045FC008BF80117
      F0037B17F002007F800A797A80DD2091B980C58C23FC3529BB305BF2FBF4095D
      BFA901891AE31C115F39AABBF4DE2CCF8C04F8110BF49DA61858B3C42F24210D
      9009188C885E793E105151BCC424CE9FBFD93F0D8E668F0FFD80B7C4A545A3C3
      DBD71DD138FA4EF8CCFF084F999F1FEF03FFB87E7946C763FE3FE5FF1FF1FF1F
      F1FFF67FB54F96282F4BE37757A808514B10A1189FDB95B1803ABFD0D6C18084
      5AA97CC05FABA9FFEA759ACC05D7042402CB6A6B284C0B090E31298B0CA23040
      4B50492F5CA2617F33976CC04014D1291460F630101F1FB21914D9AB95DA49B7
      70833CA427CD517A1DA25C6808CD2616404BA5C610FC8046263162135F87B9D7
      F80121993A76BD4842C1C01D7252E371E632690CF42FF8FF8FF8FF8FF8FF8FF8
      FF8FF8FF0B3FF2FABCDCF009B27CB3013593F527D49EF9527A087EF02D27F999
      82E0249FE9718E46BE972465E8CC704126C3E6197F30C2C059C0A085808C3461
      DE83A3EA4C65D2CDD460C8B558AC6C04CB3F8FF7CCFFF93F061A6D98FF8FF97F
      C7FC7FC7FC7FFD1FE7331AC016655B995066D27EA4FA93DE9A9F02F7F37F0DCE
      D651BF58178AB8F72D6630FC3C317CC382D79F61EF7621D181808C10C0118533
      BF904BB9E07C1EC68B68DC96C9C22C50A27C7F8F9FFE93F0E30C7FC7FE24FF3B
      0C33F068482BE5011E71D7B02340823E107193E3F1FF1FF1FF1FE7AFF2C54DA8
      0B64CDF85809C49F22A4F532EEAE4A93FBF57108C05E549E42E2D27AF27FDA93
      CE94BEA0BEBE17FB0DBF6EE6B8FF89F1B3E938F0F111266E48AA27993F9344FF
      63F004FFFF3F3C47F99F2EB13FF8FCA63F6898F398C76B05A7A004882AEF6345
      E92708AA4F97FE957F8D9FE8C0BAA7FFB97FA67BBC202DF33DBC04A40A025839
      CA009E09F1DD4FEE32E163E0206D4FFF0BC4293C549F05E779600BD4E3D602D2
      5C7B005CB38F600B44C91444FD513EB1A80B413ED42FFA89FFE7E7ECFF033F00
      1FFA8F91C98F573F001FE0A619AB02087F875E0561161989F31A5260BFC1F052
      C2500AC992498F4BC9442D8BFD04624FF1479B76052FFF4AFFD47FB005A9DE27
      0898020D3FF56BFD33E2E4049300140BAC0499F1720250E8602EE106013EEB53
      E330663DE778D17936A7D309F2AA4F61448C0B6587BBDB8EEA4CF01BE99C7FC2
      E3D91498E492DC7E21615F700B7D263F0A2009FE77D7F8682102EAAB0FC113F0
      5860144F6C3A84204E27F8E5ECE882BED278EBC32411FAB9C2D2A71AF6620ACE
      117199824BFCA2F67F4145AFFE5499B4AFFE56D814BFD87FE2D2672C47B39C42
      4EFF209F28EFF47EF27E60242C7767436702E3118E579A8E6021617F410278E9
      844FDA9FB53F89A9F4F383F4DCF26521E305B0FF5A1AECB005D221F408F4012A
      B8F0FEB78C71E9F813004D7259D31EBD617D5A02E910FA047B00B1D27A93B54A
      10C1ED7ABDB12B3FF3E9486E27AD3B57210BCFFCCBF3807FE6A52153FD3D8E1D
      13554802EEBF1BEDAE6E11224687FFB4755FF9D7E47FC7FC7FF14FFA93EA4FE6
      D27DA9FB53FC6D27A5293005B663C45AA1A40177983683B4C04B0E3C6693D3C0
      E471E0BF8FE7D0E3D1C936631B49E8ECF438FE39584B40177706D076880B4D27
      8B3C3650E5AA4F20CEFF93FD004D3E76A27919FFC202E243859FFCB9DF5E5FFC
      EE77F49FE3F3BE487FF2E77D417FB2778CCBFFA8DAFB5DFB2779AE949C3BF70E
      F07AFFE6C5090A1F1DEDB5FE404A3C49CF901188BFCE7110478A4FDA9F4D515A
      9FFCEA7CFA99DA7FFBCA37C98333A0F05F53E9E0BB6633661893CEC680929553
      CF86CC7FEBB7E2F74BC09CE340581C5B0408E20040AA4F7BA0F7A847F8EA7DA7
      FB7244916367852D3F3E527BE3FC09423559FEA6C0948FCDFB17FF3302E79FED
      71817187FBF76C18AFF6062F728D48D4E01741E1200B7045011AEDDFAF043E30
      273BCFA829E77F85DB615FF90308C3E8092293D361CCC7D012E705405FC64ECA
      8093359EE0EB805944FDA9FB53F95A9FEB01389FFD49EEF6B1D56404C4EE0A38
      BD0353EA738002067CB705372101989E770D8A1405D74A413950A93F95E0F6E7
      C97E13FD8902653FDE502EF3FCF4C7F60FF4440918FFEF08B01FFEA11495FEEC
      F5EF5F9DD3FDEF8FE80FF4002F677EBE05F0013847D10F863EA3FF8D297C4FF6
      0E9FD49F52780527DA9FB53F9FA9F5F3B3FAC0F9E349ECEC8DB5C40414C7F10B
      F271FCB802BBA40BAE5C82E1B8F56F4F4C9E75ACC1796199250D3804E71E0C74
      742B4C7B09F8C87FA23F319FFF3618BE7A887E0913D11FE0F61FF2752301372F
      F4A02785FEAC0BC63FDAA63F429FFF9F3FE3C804263A63FF873FFFAEC53817A5
      F53A6D965C57448B391D00AED10881D5012847589F62D4F9D9F72AD4FB66A7FA
      13FE9D27AD2974F3BD1E5BE3FE012D267C90A0A5C7EF4DF4A0404B31E0828238
      F7860B227EF3FE04B1B0F0AE4BB6A947BF37E6A0250EAFE1DC367B5D54F83828
      4BF791EFF13F98C7E77E7FE33F319FE21F8EEBAF63F17AF0DA7FB7E77DA69DA2
      B8FF4E026E5FFF73FDF293E3FE3FE3FF252784809D49E06016B13E1353EED6F2
      FC72FDE9B32809EFCEF52B9DB144D680ED16F3DF2809F3CEF7D27C2BE77894B7
      EEE3FEE2F3C598FF605F1F0C042B8F5FBF357A36D4B324EC328DCBB19CC2D293
      9C7E475FCFCC744F8FF0147FE19F8344F8FF8FF3C97FC7FC7FC7FC7FA7D4FACD
      CFE004BE2C8000B6C9FA93D756EEA4F5DF3549F527AFB0592FDFC435C62899CE
      3FCE76862AA7144CEC4630388E6D70A6ADDD7935A9110A57F0EF701C2CE012F2
      99404B9DC59AD5C5B2070B86A4F8E8CF775BE3FCDA7FE21F9FF1F9CA3FE3FE5F
      F1FF1FF1FF1FE9CFF425867AA0CFC14FFBA4F549F527D49FDA9495AE6BBDC338
      B32359CEEA9CB0C058F4BB2D458BBEF578BE38087462D902E73D50B1C656AEC1
      D38BE913EA67C7FC7FC7FF127FFED8F071FF1FF1FF1FF1FE9A3FF85E64583809
      66482804CB4B1C99549F527D49FDB53E441BBDDC92CBA40007501FE140E21281
      F60A03692E73830A0F4BF33C07FA0FC0400801002006648000F0020040080100
      20040080100200400801002007B50004E0040080100022003B38010020040080
      1002004008001B803B88010020040037600F4E00400801001A98000900200400
      801A7C01BC80100200400E5E004640080100200038006140080100200086000F
      4008010020040080100200400370019B801002004004A0004425C17336CBA400
      12501FF140FB9281D99406D65D17863683FCEF01FE83D4B37B1659DC5AFF5C11
      2E51574D0BB8B7F2B9BCF417DE4C263F4B0BE17C2F85F0BE17C2F85F0BE17C2F
      85F0BE17C2F85F0BE17C2F85F0BE17C2F85F0BE17C2F85F0BE17C2F85F0BE17C
      2F85F0BE17C2F85F0BE17C2F85F0BE17C2F85F0BE17C2F85F0BE17C2F85FBE2F
      E9F6DD686E7B6F8E6F6CF62113DB707E9B19BAF77E32DCE75402EA0041835D56
      2E980BCA7B4DD201718011A050F593BFE02E80402F280264EE5F3009EBE4E7EE
      A6507C511CAE5EEE017960262D3383ED2BD817A3A4A2805F0809E5BB2FF93B93
      B62EA5F3009EBE58BD468D1857C40E0100404C5A3270F6E8C6040014001EDE9A
      5DE4EE4EDEDDE2F62F597CBCBD571A348043F0108DDF6B065EEA20169F405AD1
      9B2F011BBC828309D8CDDE21E5F2F7EA03947AC023C44E73C10303BFC01771AE
      18086288226EFE62C60124E02C0FE809E0B70776EF27664A765CF7C5ECBE5E5E
      FC42CAA011F805DDBB99776658049001776EF20A7BA765B7788797CBCBDE67C4
      C1E02C8FD15E0161808B297C3776E6CAD9CFCD6013F9CA58394809488CAC71E0
      84F0DDE4ED7E4ECB6EF17B2F98BD8BD9BBCDDE6EF00A6EF00B1DBBBBF45F341F
      6794C026041A0278460162013CA86297CB774EEE10D8045FF31D3C10BC026106
      211AA0A64908C2CF4DDE4EDDD4ECD6EF17B2F9797BBE44A470279DC300981068
      09E118058A02F4DDFFCB9E65E017AC646289B3C718C81F6DDE4EF564ECE6EF17
      B2F98BD8053779BBCDDE014DDE0168377CCC81B0804A7017B6EEDF469879CD0F
      02800163FAA150835071948DF8DDE417784ECE6EF10F2F98BD805F1BBE666B00
      8AC05377805377804ECDDD1FD58780595301141BBFD8FBE90096E02F8DDE4179
      74ECE6EF10F2F9DBE26843E0DA604007580039FF3DBBFA90D0E41529013169E9
      9DF93B48277E9DCF8BD97CFCCA86D7F86A634BC2F4A760162004B556A69F9976
      5FF00BB5011A4CB06C9DB2FF805E6809B4C72F9804F5F22247C1E05547B00045
      601FE980FC0301FB6C035AEC02BC00AFE8C00FF01E034A9E1DF93A5749D0796A
      80B802BEA9E7C21F889AFD627D4DED72B13616313EE958AC4FEE99ED1CB6F920
      F442C27C1013099F532CEB3D9D95B60809E296357084FBE7F42CCF3B04B8CF56
      3BC0DFD1ED3F4BAC0267A6099282CF7093F40A765458FC6C71639BD8F35961BD
      4C6574CAF4E5C445230C3C123876ED975C2047E40CCC9FF98B50319EACFF52F8
      399E502336012B3FF1A11C6E80F3FD7CFCF5300BE1FFFD9C33527DD8FFC933DD
      D7F9E2F3743EC3C1FE7AFF427DCE82CFF7E27F2D7FE519FA297E8BBF56BFF23B
      FD75FE46EFF44CF8FF8FF8FF8FF8FF8FF8FF8FF8FF8FF3C5FAD37F1FEAC9F3A3
      FF726FC1A7FEE59FC7FC7FC7FC7F800FFB17F47FA3F9166FF1CB460147FC7FC7
      FE26FFC63FF3D1FF1FEDAA2E42AD48C02D9DDFC7FED13F9377EFC67C7FC7FC7F
      C7FC7FC7FC7FC7FC7FE44FFCFD6F3AE9FDDFF30DFFF074FD1FCBF027BFEF33A7
      FBCBF4C77E4A7F80CBFF6A807F77E733FF34CF6902C9847EF10BB6C00C26C62F
      FF49C94A82F61363FBFC913F8FEFCBCCF6F7AFF77F2938FF6757C01753B46EFE
      08B05184CDC61617B1AA9601605EC6AA98058179999E2247C6322E8F6800A4C0
      3FFB01FE0C0775300D687BF80C303D67D7801FC83CAA9B0C180F08B4D10F76E7
      50B89804A5766004FC722DDD2FD753EB0026073BD848FBDEC2C8590B21642C85
      90B2161F42C2D930BC6E700F4A03F777CB81FDCC0260576809FC9CD08025C0D7
      002362E4F0342ABC9A5733A5FC5F161642C8590B21642C8590B0E16395D0F80C
      908B5BA5501663346FCCE5DD7E002D730099DD6B75FAC526CF64F9D6EF7002CA
      257CE5BABD9631A1642C8590B21642C8590B0E1677F43A66A3742EF97BB47BA7
      9A96D21E8D7E8FA7F6600492D2D3AC26D86F362C0261A9A6507FD40013DBFEC3
      30B2163F16358C06AB7266A5D6BA1642CD00B30906EB50BC648DAFD9816CA118
      A862BA1642CCA1633C829A7171BBE2FB19F6312CFAD064F759A08190BDA4EB98
      F59B30E3E37593CDEE3C30FCCF530DB8969F57C2C858FC59B6E0AE7D7C8FCB11
      AC26C00B7EF33602EF79F0B2162A0B1946B9779C45F7B8BB2EBEC807F49984F3
      59A5679C19870EB3E6C178590B158B19CDB51BF0177D3675BBBEB6B52EBBE8C1
      5E2CB4A625BA660178CEB374FC30A59E170B999E9E5B19F9DE419D150B2163F1
      6145C9B6A9CDA9BEE6FFE055F8FE78494990488975E7F6E9E61015349642C858
      FC2CF2481C49C37083F8C8974D25D8E86C5EBCE602B02CB7E027348A42C85998
      2C6736D4A4D494D191B9C5A6A6B480BA8CD5BC805C36013038B9FC53DEF17A9C
      6EDBC22C4599058634CC3B8ABE230FCF309BB4DAD02ACD5F97593C43116750D8
      1A23FCACA622C459B22CBA8D9FF6F8FF7DAF11BB6BBE9E89C0CF94059F9B3CFF
      0FDB6B49622C4592C597D379CC52EC5EA73AB5574D1F65A0A2C459EDA0C1399C
      ACB735C5717698A5284290070FCC6FF034C5352DDF596FA8F68B1167322CA482
      B26F578167DB85E191AE26EFBDFD7A62BC30BEA7CB73CF96A351622CBB9BAE72
      D5FB1DB68BBB6A9D4C3FA3F170169DCDFAFFF5E9169E8965B468B11663164CE2
      DD1CD77FE390BAC77DBA1B360733B672DA4719E077BEDE04E7449BC1E1D1179B
      404588B08D165FC08283490D759FCC771F06BB2385CA5016817578775328B116
      63166AA919E59ABCECE0E1715EEC52F7ED32629768E6197F3166B7648B116631
      656CD7079FEAD7AE041CBF1B613DE1D67C680581C54EE74EEB69C4F36288B116
      658B2946D6D43C7108794BFFEFB81E8EA6E3052B18F4F6A817E3957AF77908B1
      167F816623335CD3C4D315E7F06B83F5D0AFCB41B79627DAEAD4C64588B258B2
      FC0BB1372B091888349E32A02B4838BF5623BF78D1622CC316593513003A5E7C
      2D7E86DFF6D78203E1F8ACD151D6B3DB7008B1166516570A761DA66FF8169158
      0AD8D699E3F6E06D78637AE2CF1C42D8B20D0C9322C4598C2CB48C8BA39FBFC5
      347FBFE0A7E3A5B0F701579E28B116618B39847F7EF3A7FAAA8DBEB911E6AE44
      6F88E3128D4588B345ADDD6F25F43F069F84B137C58C699E0A80AC9FB30AE7B6
      E70B19F0E596489166743AE936FB948B116638B2E416C057EEB56F6EB4EC8B11
      649858A8D459C662CB920E0E62E99F437E574E285E405F979006E7BF60FD16C7
      F1ACDC5291622C4588B11622C4588B0782CA6000DEC7E25F0FB0013EC07F4B01
      9F6C0671603900E6543160B90F05407EC0F380710153C049569568092AD01255
      A024AB4049569568092AD01255A024AB4049569568092AD01255A024AB404956
      9568092AD01255A024AB4049569568092AD01255A02F92AF4F30F35D7E34E61F
      12F98F2A30DCC324DDFED016500AFE49EB4D55FF381818BEC87080BE40443A27
      6A00E3B3D0DBF6D36E627FF6F07C41023923DD40BA02F90142C1086FA902D64D
      A4FC713EA771C0222EE7E3FFE92E901B1273F8A23E4DE62D01580BA3D0E70175
      FBD0BB73F98D9389B72617CF93F78825BB6446DDD2284EFA02A80BD5F6022896
      878CC61C9F381FB27127E5C9F53B9D0BE7780581B8D80D1D2B77D9E594A02EE0
      2E20971B93B3C072C7A32C9C4DB9E0B92E4FA745D7F8EA0BE306B8447B8EC4A5
      80AC16220154811DE493F6E4677AC5C7F64E24FD213EA774817BB4B35FC9A640
      8257F3D92FE6F6842C056081100BABE5A8086783E725B767A49C4DE864357636
      41EBF06FF95C8B017E7AB5016C87002A90FD2F27FF983063D3F79362DE127F28
      9F53B2656BE673F75099B32944042200BF5D50F9F7EBBC4DE268D7FB3C0F6F8F
      A5D74059180BA9BAF60D7E343A5DE24FD393EA76B5F404B5F5AFA025AFA4FA9D
      D05AFF9A6E03DC2BA6E7D010B82CBBEA5AF98A6BFBDFF6FEC05A582A021A0089
      38DD4EAF448AF9BF86BE93F984FA9DAD7D012D7D6BE8096BE93EA77456BFFA9C
      80BDB12D356BE8096BE49AFFF07896BE404FA9DAD7D012D7D6BE8096BE93EA77
      52DAFFD458C169B357D2881192AFC9DAD7EB2D7C462BD0B016FB8FF5405DC057
      B2FE7F84BEFCC2C35F49FCD27D4ED6BE8096BEB5F404B5F49F53BA635F141B3D
      D89F4DDF9A280BEC057E8E75B6DEA5AFE5DAFD24BBD3602C305404500AD978BF
      A3B7E7EC0261AFA4FE793EA76B5F404B5F5AFA025AFA4FA9DAD7D012D7CB65AF
      FAFA3602185B0240442015ED34680B6E03DE0CE66BE93E4293EA76B5F404B5F5
      AFA025AFA4FA9DAD7D012D7EA6D7E7E01DDB0162D15011402BBA22E0ADE041D7
      335F49FD027D4ED6BE8096BEB5F404B5F49F53BA6CF47F5B5FA1BF3450101015
      FA38B5F26B35FE28FD80B168A808A015DB79C0906889E43F3B5F49F3989F53B5
      AFA025AFAD7D012D7D27D4EEBD73FBD1C301C09A2BB514040405E61686E22D7D
      6BE8096BEB5F404B5F5AFAD7D6BE8096BEB5F405ABB5FD6D7CEAD88DDAA202EC
      02BB9CE58E89AD7F44D7F52333BA5836B60480BB00ADB10774BA62BEF18C35F4
      9FD827D4ED6BE8096BEB5F404B5F49F53BAE5B5F9B27BF3447227CB168088701
      42928780F0D6BE4173F0955B01095DA120295808AF0FE416F7838A78B5F49FDA
      27D4ED6BE8096BEB5F404B5F49F53BEE6DAFC9507B84C5AEE7EED510176015DC
      E087BE456BE17DAF9C86F580B992080BB00AD97F37DA2BD7E872B99AFA4FC6E4
      FA9DAD7D012D7D6BE8096BE93EA77986BF8F472FCCEB62880BB80ADAE75A20A9
      6BEB5F404B5F5AFA025AFAD7D6BEB5F404B5F5AFA02CE6BF77397E68DB11EA16
      2022B40420146DE28EE72D7F55E8FEB68D75F7014350177016A6F7D5F0000B81
      7B23EDE8FA4FED13EA76B5F404B5F5AFA025AFA4FA9DECDAFFBDCE6B62880BB8
      0ADAE7B434D56BFB96BFC3D952A8FB1B016A1017701632FD81184918CF86CD7D
      27F6C9F53B5AFA025AFAD7E014D7E27E4EC8EE7C3BA79B17466D81BA02AE7C6C
      D7F86E4B1C180B749E69C0259C05CBDCEE37EA010E6BF13FB64FC9DB385C6EC5
      E49AA2025FE046E22756DA35B6B911E404400868D8F309C4DBA80BD0C28271FD
      653C8CCA81DA51BA480BDC0466ADD78E1A14613893F584FA9DDC05E10DFA73D9
      B5DF20B3D629450880BAC047F60296819EB52DEDE9962C9C4DBB90109F6E4A60
      9284D4CC34C7A61440404052BF61EE12D84E24FDE13EA777817340C181F9EB80
      1DCD3F2D2D010101650B635CEF8F0F26DDF8FF1F1238253598B7D5680BC00B25
      671ACE1FE93FA64FFFE09ABE20D7F020018600FB380792300E6BC01C47F7F60C
      602E23A1601F583F8B876FE13C7942BD2B39534010D7B7E602D811DAC05835C1
      DD87DDAB54D9DC8091F103E0AEFF0BABF43BA3744FE8B3501683D073016C0813
      805835C1DD87D7F366DE1740247C40F812FBC5913AF30A6DD80ACBFACAE69B71
      31B683301C76637407C12FF4F0018088044FC1781DD423853782FB2FEB0FB996
      B9D0D001587D65F061445B0E880ACBFACAE7ADD69C3EA216850C0F3A1B118B14
      2EA8016A0E860D60A705F65FD61F7FF15E47A602B2FEF7B0BE3F49AFD3DD93EF
      EE29AA0C8005629B17E17F5AB983D1CE518CFB005F8F60F140581658D71106D7
      C50213534DA1353573CC0BF19E92537005B0525AD6E17F617C7ED968FA8B20D4
      C595CEBF00AC5362FC2FEB5846B129FEAF14DEC05F3C938D1016059635C441B5
      F1CB75BBCE8BF9289AC26DE80865E6EE00AC5362FC2FE0ABEED7C5ACB2DB4BF8
      07F097CB4405829B0CACBEFACE01C90960E09AAD0389B583CA9543E79BC49D58
      54334C5E02C08EC0BE0776BB05382FC1AD97DE2F8C017DD04CB7F3FC6466CD18
      4F805829B0CAEBEF1646C5F76FD17EAB4D234805829B8CAEBEF7E4499DD67909
      A4E550EFBFA121BF39CB5839CFC41FBF4405817C0EE08F05382FC1ADD7DEC5F1
      F5FCB17ADADA1AF6DDD3DAB7805B17F051975AFBE659DB6BF5F5E6AB3049C60E
      25E00A82BDE0A6CCA2CBEE6CACC79B2BF1E52699113AEC9E9EAB28B342E02C0E
      E08F05382FC1ADD7DEC59DC9085810B0B969358E6B00B05382FC60975F7759D6
      EA50C449AEA98000262B301608F053765175F729E1FF45BC8D057B6309912A7D
      A03B2B55B80B03B823C14E0BF06B75F78B3B44A329F475176CD0F1D58D60160A
      705F8C1062BEF005F72243F2AA8F8C941001808A0022035829BC805D7D87A1D2
      BA685A5E9F8D9B5C77B7116D5B54005CA1AFF368A705F835217DE00B17C1DD6F
      ECF2945A6EED301121AC5FD7900257DE00A202C354682B2BB8FB0114C054B0D1
      0E057900BAFB2A69CCEA9F9FA4CFEB0529F401AE7162DAA602E90D7544705382
      FC1A92BEF0058BE37436E9AE23C045301121AC5FD7900E8BEF9B8377703C7C68
      5B5175ABD9B374694A2BA00890BE08F05382F257DEBE529C14960C055A2CE181
      479A2C7D811EA022C7D823C14E07706A5AFB8C760FA83C33FBF51F05F7009D80
      5D87D829C17FA5F66813C64572832181CF89CB2F7DCD27FBF00458FB047829C1
      796BEC1D5A8CC3E7E0341A582099CAE9058FB023F00461AB823C14E07706A6AF
      BB6B6030F01EFF93E0FB7C8D93FC017C1F60A705E4A5F640CCB09802F9CEA331
      280CFA35CE40F505001B3EB808D5F181DC0A60A6E32BAFBDF7D5D2C89C9D5B5B
      EF91F653E14C57CB5B66AFEC075C04727581DDA11009EB05F835BAFB91B7E2B8
      02D508513E7EA465F47D80EB80BE8FB029829B8CAEBEF165E00BF20241F55D86
      0D183D48C7280C075C0472F8C0EE0530537195D7DEFE2BED2B95EB424027C792
      B3FC47BCED50E57F80EB80AAE7E78776C0760A705F835BAFBF26485380211454
      360329F1BE8FB01D7017E1F605305371973AFB9F6919AC5C1F87EA5D7017F5FD
      814FEBE0E11E301C1ADD7DEB7AEB3533CFF016391F15539AB5D8BD5D9FF57F80
      EFEAE701D823DA29F93D7835BAFB1F958A31706BFBBEFEE02FE3EC0A7F1F4023
      C603835BAFBDE388FD62E0AEAD2E55C0402FEC0A02BE2011E301C1ADD7DC6C79
      638D52ACA799FFA63D47B3CAEA5EE095FE038257380EC11ED14D4F43835BAFBB
      686524C5C03A866FEE02087D814087D008F180E0D4B2BEFE8FDAA02B69010C64
      606D1B721CC0104BFA05F170D608F05382F817DEFB53C7F8AFDE8FC782E97F40
      DBE3F8FE2D1600828FB02B9B86B047829C17E0D615F7B481D43498C3682D76BB
      0045C7D70D607705382F097DF13C9FA371ADD8F7BC2DDF86E73680855FD0AF8B
      86B047829C17C4BEE5B3BE16FAC1A6ABEE02907C30042C7D895CDC3571360BF0
      6B12FBC05CBAC568C61B3C13FFF8022E3EB86B03B829C179B57DE2C80E136379
      FA80345010B4F980BF60EE0BF17F44BEFC0D3B75E693213FA03F5E95FDDE6010
      B47B90CA20BE08F68A705FCABEEE3EFDBE59B5BFE5379E336B2E02F61F4417C0
      D60A621F62FBC591B2701308143E8A30086A7CC05FC87705F8BFA35F64EF0C0E
      9FB2FA6C294EAE6B63FB5C04351EE2B98C2F823C14E0BE45F771F5907087D18F
      B1DE66816DD87D0FA40BED014426520FB957D99C1A082C0C091002FB6F7F61DC
      17C8BEFC61C71BB3F73DE994942C007D205F688FD2DCC90E24936D1FF29C6FE1
      A2423066C6E02005ECA17C0160A65936BAFB25E414EFFC51512004047C043B82
      F957DDE1C167D3E64B4264515CB47B5F0EFD1E2961C5824DABB43014BFE74D8F
      6EAE020E3E982F802C14CD26DF6BEF29AB55D9C1092682F9C044471B52808188
      305F94F93AFBDB7606DC8BEBE1A47FE863CE25E57CE46572DEBFB9FF86D0EE08
      CF9A04F7613E0BB62488D9FF7602B7008C8FA70EE00A7C1762FBCA6A138FAB7C
      9799409C044471D4E9EE1C20C17E53E4EBEF2EC316768F6BEC35CE0DBB004465
      7285FD70D608F05345D85182E134A29913DF80ADE02323EA03B802A305DFCBEC
      7E4A153ED8C36D226E5EC879E086EDBCA42F8C0712BFB01D802C14E0BF06B75F
      77D540B7E38280090B20FC84A9A96C0712BFB41DA23D14D1AA8A764D978ECC29
      8CE4BA02259BE844ABFBB8834534EC9B57DED27FC5FBD8F0B3FD386FA022D560
      A5F1A0E297F683B405A29D17ED3CDD7DDF551ABFA49C4C06808AC8EE844B5FD7
      106E4A6AD5455B26B6563DF6E85C3B4046B37D089B7F771068A6AD937F2FBB7C
      6BDD988D6AF881D029CBE33853FC0472FEA853A35BAFBBF6806D23101C473B11
      BC0FC73A6417011D779A23D14D5DA0ABC1E2F7FF7D26D5F1DFE10D36BFBBC537
      F07B57DD115B16215994962D20996814E5F19C28100472FEA853A35BAFBBF680
      C27AB76B013B81F67CD3197011F7799F83D03C255DA0ABC1EAF85EFA1EBE2AF0
      84F5FD50A6FE0F075F79E141F198E30835000606BBB0CA97C7B7F17720015797
      AD11E8A745FA35AD7D87F47FD62861456B5F17EC15602AF2F5A23D14D9F4C59F
      8B7D35297FCC6F1EBE0238297000AC1F682F45367E2DABEE5B9DE124A76ED9E6
      783F8075F1962F8A90F635000ACCBD688F453A2FD1AD8BEEFE8F9FD8D626C5F1
      78B3600ACCBD688EEBE2D5F77FC5AA9E684EFE336AF8B367361800568FB417A2
      9B7F1616BECA1260CFF5FC772A62C794D9E411EFA7BAB9A2936F64FBFA1A9657
      8120045C35A23D14E8BF46B6AFB0D477FAF8A0AF0D17D8906AF5D0154DD5F5CD
      015C35A23D14E8BED5F613C1CC19E1E64FE8D32BB9FE8CD357C6275E9D8BD567
      47E85460045C35A23D14E8BF46B75F74EED63B39B0C78B923CED56B99ADF4F75
      731CBA74EF73A8F99DFB350841170D688F453A2FD1ADABEC2831A77B913D2BA2
      6FAD6AF5D011F299879A02B86B447A29CE2FEF5F74BEBFF8A7DDB27A0E13B4E2
      139B8FABD982029748CCCB8634841170D688F453A2FD1AF7AFB3F483E83DC444
      328A8FCBC55FC960A9E4C129CFDC4BD7058C62BBF3411A1DD11E8A745FA35BFD
      AF623CD1B0A26991972D150FE7403A5CADE9A07C3F356C61F6CD010A0BFAB447
      A29D17E8D6EBEE2BEDA3318951C2D568E07354B07F2A51589D28E562596DFC79
      A782343BA23D14E8BF46B75F72B94E3B1334EEE0B11F8925A01ADD95FBF731C7
      FE4EACEE4B23413C11A1DD11E8A745FA35BFDAFE6C71C184D3F31B5A1EB9A891
      6A3344606643D1E3A317C0CF01685F43BA23D14E8BF46B75F7F03FC275B4137A
      1E6C8B2A0421E50B85F97B7DBE50685F6DA81A782343BA23D14E8BF46BE2BEFA
      9412AC8AD5EDD0153254635A02B8B346B78EFD6725FA6AFE23F6E26BC02D5F1A
      35BAFBB7572A68FB405FAF57CAC0571668D6EBEE8187CA9A0C918D014B4062AB
      40571668D6F1DC9EAF671ABF8D0045AD002D5F1A35BAFB8B7FE2B47DA02EED08
      E5700AE2CD1A8A5F745A0CBF57F60C6DA605F9CC32A3B8DCBFC2EA7B1C2805EC
      811A1DD11E8A745FA35D1DE8FAEBFA9405B26160FAA59CA7D230A9FF22AB6A5E
      E6119855D17DC7D4FA6CBB57F5630D0C01EA17A13E252F2A128E58BA1DD11E8A
      745FA35D1DF00AEBFA94059A9B7C47DE00F8726992E35FD895A97BC23E14F0BE
      E3ED6B2C6C1349A97B0751ED300B86BC3BE015D7F5380B97C5C7DC5ECA47D72F
      643BC78587A7FA7D106A805C35E1DF00AEBFAC005CBE2E3EE21E563EC17BAE00
      6F69449156603EB417E01ECB82270E038AF80633AB4E031C0B19BBE007E20F1E
      CDE1595FAD5A894250D580A2D6D843005C0222805C35E1DF00AF514207A51816
      D580A514F91DC0170088D0170D703EB8D164B25940456202E1AF175399DD18B2
      683BC2A2C002C18609802E0111E00E1AF0EF8000D0F0D8828E002DCB9728C017
      008920070D703EF0FD3FDFDC1B00386BC5D6B585F1EF5D6F0B301617F72C2C84
      D4747AA668BFBF80990070BF0BFB0BE3F5BB8AAD005B2BF85AF8B09340185FDC
      B0A090C8B9A9CC07CCFCE17E17F617C480BE00C2FED6B0BE32A1C2BDC00B0BFB
      96172C89C79F277002C2FEC2F8CAD96C17402C2FEC2F8FB1C40185FDCB0B9647
      A20A00C2FEC2F8FF4680185FC2D7DF976160B9D1AEB7602E1AE17DF2C8F90A7E
      EF805CBFB0BECEA345154DBC6EF805C35C2FBDF783CD659000386B85F7CB23CB
      300072FEC2FBF2793D5E49E80386BE2BEF7196BD805C76FC02B0971C0A42A903
      4E1AE17D8B8645F47A9BD3B6053C2FE1AE17DCD08EB38C0E015817B814F0B386
      B85F774BD68AF63001627E6053C2CE1AE17DFD7EBFCE8F53CA76C0A785BC35C2
      FB121216E3038016C5EE053C2CE1AF8AFBB482156B3D76DE0177E94449F8CF32
      02C0A7859C35AD7D9E1F85700ADC7D914F0B2B5F67B080A4DB22EE015C0FB229
      E1670D72BEFD7F3FCE7860038BDB74D1006453C2CE1AD6BECDC8002E07D914F0
      B2B5F6505A61482200BC1F6853C2CE1AF8AFB36AB00F8F654BE01695E6817340
      5FA1DE1AD6BEE77E51FE016841A05CD017E876B5F6145BE28C0B06E01687DA05
      CD01010EF0D74BEF77BFF0D6FE791FADED8200030EF0D6B5F7E12600D08340B9
      C00081DAD7DC2C545F47AE00687DA05CF00070EF0D7C97D9BF9F67BDA518F00B
      49EE8173C04203BC35B17D9B9286F00B420D02E78085076C5F7FD9BF18FFC817
      805A639A05D0010A0EF0D74BEE5F339E071300693DD02E8800707786B62FBF41
      5006841A05D100100ED8BEFAA1664CEB86BE4BEE0447CDF8F7EE7805A579A05D
      101110EF0D75AE78982A03FDF02F00B616E9605D301120EF0D74BEFC6151DE38
      23CE01696EE8175004503BC35D2FBF078BD20C5801A579A05D400150EF0D75AE
      724282CF89700696EE8175000543BC35DAFB808087E207801B918D82EA000A87
      786BEABECFCF830B44BD3C02DA9ED82ED014087FB8C077611E1AED7D8FC6FD40
      7EE27C02F563998175404643BC35DAFBD70BCEF9C3E3B805B5BBB05D5011C0EF
      0D76BEEC967BBF2FEE006DFCEC176803A780E877611E1AED7D8205874D19D70D
      76BEC84849C28C0036B7760BAA003C1DE1AFC2FB22861096F508F00B42D4CC02
      EA808F07786BB5F65FF607BEFD349C02DC9B6C176004783BC35DAFB22270DF09
      4C4700B6B7760BB0023C1DE1AED7DD0D2538F1B006D7DEC176801083BC35DAFB
      E8D00A6C01B936D82ED002107786BB5F7F8FE01869D006D6EEC1768010C3BC35
      F95F6152FF03FA7FF700B6B7760BB602861DE1AED7D90047A493FBA8E016D7DE
      C176C05F503A17EFDAFB94057F823D031C02DADDD82ED80A287786BB5F670727
      3D0EF801B9F5D82EE002287786BB5F7DB269CAFBED936D7DF78365E7401B5BBB
      05DD00460EF0D7F17D87C1D493417EF805B47E0F9C19B1DA7453C2CE1AED7D8C
      FF2DDFC1DCFF00AF07DB14F00B86BB5F778252818FB80700AF4BDD8A7859C35D
      AFBEB6233849065E99C24EBB0DAFB2F3438D51D005F0FB629E0070D76BEC244C
      6F7EB6E517B67B35C35FC5F63F110FFC3DFFF00B93DBE8E97DC500B97DEC53C2
      CE1AED7DEB7237817FC507805983ED8A7805C35D35F649F7DFDD39C5ED9F8B70
      D76BEFB4D3D1EB801C5E94E95007642FC29E16769A7CBEEAB5FB559E0F570FAC
      F07B86BE5F64A565F62FBAE2F6C5F7C3591C77E5FD053B95DD57A7BC26E16700
      AC8EFB51F5E3576F8F700B397DF853C02E1AD91DF97F700B457DF85394052B8E
      FDF3444C4E6C085A27BC26F7D3764778F49E647B3E00D25F7E14F00386B6477E
      5FDC00D45F7E14F002671DE1CAC4F78185DE01587D3168A786BE5F792A5C8653
      41BDF80567F8B5A29E1AFA9CE0DB2DF57A586FC02D9D8C92CCBDF0A7805C35F4
      7796979AEFA6FC00BBFA62D14F0D7CBEE8144A5D67F00179F8B5A29E1AFA9CF5
      FB0DA6E8F80261349EDF97BE14F00386B5E5F6780F05FCBB0170D7CBEFF9B01D
      B6FBEA85D80B86BE5F771DE1ACCEF70DBE0170D7CBEE020212274BB1400E1AF9
      7D8A8604623CD001C35F2FBFD01035FA7C00E1AFE5F7ED847EDF43005BE0170D
      7CBEE71A50DC54D370CC0170D7D7DF2195C96007AFBFAD13EF4900769A7CBEE7
      540A45FE9E00E1AFAFBF653F2DE31C009D28A8873005C35F7DAFBD9DA929CBF3
      3D00170D74F8C7B185A31F9C35F65AE2E3E46DB47A780386BEFB5FAFFBA22680
      03B069EE3198199AD1CFCE1A9F8EF60CC21BE58468083DB5AFD8A689BF0A785F
      C35E1DDEA1875F2FEB7503AA02F2F8E1DD6E519EF43E172A82DA1F7C2FE1AF0E
      EAD58AE72C2EF4AEE70DF3F3853DEBFF0D78763C1E94BCBFADD40EA803CBE387
      723954C79617BD3AACAF8EAF1E1AF0EEF7380704BCBFB4805CBE3877C3EF2FED
      30172F8F0FBCBFB5005CBE38BDD169351E5FDAA00E5F1C3BE1F797F6B00397C7
      87DE5FDAE00E669C5D63801A09A0F02D940F8C7E7C03CCF044C9C0706F00C331
      4FF0638161360F00FFC1E6B991EF41F5AA16C32579F803C05F0223D99F0D7877
      C028CCCE455192BF017E0892667F1F5FE8F13A6333E1AF17544A3528E70A8B96
      C30F5018E7C0BF0448333E1AF0EF8011999E659F69FF02FC1124CCFE3E150EDA
      355667C35E2EB18FAF8765C758D8017D7F7537ED4D2757AAAF6D35FFAABB57C3
      E2E4ABD801682FE7EBE3A3E6C803EBFBA9BE13158FF555F869B2DAABFAF89855
      401F5FCFF347CBE34508646D00BEBFBF82495EDF35BE02B7347CBE2F970AB6F8
      0BEBFBEBE36558007EB87F824DF57C016E68F97C796E000FAFE7EBEF7DA4AAE4
      A8793F00170D7EBEF96478F341F0172FEFAFB88A23D52BD71BF00170D7EBEFD6
      849771BC00386BF5F7CB23D99A0F80397F7D7DF9FD481BACA00386BEEBEFC1A8
      CCABD7F5BC0290965C81DA4C6BE23D0015263BC35FAFB525199ED8FC953B7C3B
      1405C35FAFB9F67D5F181C02902F7E1D8A02E1AFD7DE733DA4CCC1004A1F9F0E
      C60070D7EBEFBF1BEA7395A76F8763003BF51FAFB5B5B5FE3038012C5EFC3B18
      01C35F75F77F5A7BDB29DDF805C74E50F6C463809632DB4BE1D8E02E1ADABEE0
      6255B805303EF876480AD5F7031ABAF3BC7DE014E0FBE1D9202E1AFD7DFAFDBF
      9D34100774D1A50880306C6B2F40EC90070D6D5F6FD0C013E3E40ECA005ABEDE
      9EDFA910C01423E40ECB0070D7DD7DC254FC7BFD254B805469EA076580B86B6A
      FB9F53A2700A8D5E2076600B05F6BAF7E3975750E01538F903B3405C3545F7BE
      F1FB307F3F89EFE3F9E1AE0BEFE9100150AF103B380182FBEF76FA3D7002A47C
      81D9E00EF847ED7DBFF9B5DE9A440700B9BDF465B00240ECF0170D705F706CCA
      FC02A91F2076780B05F7EF9EFAAFAB2F700AB87C81DA002E1AA2FBA2D3AA2B71
      001C3EE8CB600081DA000E1AE0BEFCF14015E3E40ED00060BEFAA470675FE3EF
      F675DB29FB5F710CDF65AF4EC7C805C354D73C0C253437A95BC805C3545F7B05
      D97DE42C2F980B86A8BEFE5F95464CD00386A9AE7747779F5E6C01C3545F7070
      90BC40FA00386BFABEDEE1995F59BF164028A5CFE2908F0D517DB246FC58BE6C
      5EE02E1AA2FBF0A84FF8FE539F002E1AA2FBC7E5B35CBFACC01D3C0A423C3545
      F6C6DAE159675C3545F6CCD8DFFFD180386BFABED92298277F6D9F202E1AFD7D
      C02C2AE8923488805C35FAFB747760D73AC3A40170D7EBEE9A9EA1B34C00E1AF
      D7DF47459D680386BF5F7ECF77C9835C00E1AA45F69F3C9CF958BE9805C35FAF
      B6D5E4F734BD2787004BCA9F5F743F47B96BCCD4A005C35FAFB838488E876A40
      1C35FAFBED935657DF6C9BEBEFBC1B6ADD00386BF8BEFE6FF5AD51EAAB005C35
      FAFB6EF1E39158B52B005C35FAFBB43A3C212420AE0170D7EBEFADB93F01A280
      1D761F5F6FF0307A7DE00386BF5F6B6B6CF64F66B86A997DB644C878E1961700
      B86BF5F7BBCEE599D6286C805C35D05F6BCA16BFC5B86BF5F7DA33E8F4CC01DA
      6945F759B0DB3FFC008E0070D517DBABC3DE317DF0D6591DF97F3FD048F01500
      5C0B6005442E80EC23BEEA3F8AD559620CC05C35C23BF2FE58C014C23BF6ECA3
      63A4F0F9D3816C002885D3EA7C23BCD66F3C7578401C35C63BF2FE66009C4778
      C7873DEA93CB70170D517DE7E6F3188D2B32E005C354A73816E7D96DA5BF700B
      7B64644046780B86A94E73F4149DF4DB90070D517DD46B162AB78C01C354A73F
      178BD5B58400A6D5AB6808D00070D69EBEE2BF501E47202E1AA2FB66D8DF3BAF
      0DA5D80B86A8BEED5EF6B8FE5A0CEC05C3545F70D131994D34F0D517DAD97EDB
      97FAC01C3545F6AEB0BD98F700386BFD7DFB964F87CDE3E8EC05C3545F743CD7
      F9026BD95D80B86A97DFDF676F20025F7F5B77C7E400EBA445F73DA352741F70
      070D52FBF683F31E31C62DDE195A5E80B86A9F6BF828AE26B32CCDF00B86B9FC
      63D7C165CFCE1AA6B9E2E2E3F356E3C354FB5FAFFBA223E00760D138C6F0F4F7
      9D3F386B063BD5B368579613D2D36EFF039397A6FC29E17F0D7877827744117F
      79B5568BE3877809B6F1D0F9B1CDEFD07DF0BF86BC3BAED76EDCB0BBD2BCB2BE
      9F9C29EF62F86BC3B65B4DCE8BFBDBAAB45F1C3B994CA6FCB0BBD2BF82F8EAF1
      E1AF0EED6877373E8BF9F00BD7C78EFC7C8BF9F00BD7C20F917F3F017AF8F2F7
      55ACDAA2FE8000F5F1E3BF1F22FE8000F5F083E45FD0801ECD3CBAB78032D2F5
      073D840F6B713E03C9F84595E07E67C07CAB51D031E0BE5571006A41F089A3E3
      57C1A9AEC3271BE71080540459333F1AF8EFC054199C229A9708054044733351
      F69E9CF8D4B33F1AF97547A3D4227289826C32291B97A81541164CCFC6BE3BF0
      050667B3EDDBCA8154111CCCD47CE878BF354CCFC6BE5D5ACABE27367E4E1809
      57F7D37F3AC8757EAAFAD35F8D55AAF89EDA51D0C059CBFA02F8F8F91000ABFB
      E9BE2124977D55F7E9B31AAB55F13EEF80157F40CD1FAF8D5D21211404ABF970
      490FDFE6A300B1CD1FAF8C164EA71C04ABF957C6C91000B5C2B824E2250031CD
      1FAF8E3B100157F415F7CDD4D435130D0480178D557DFAC845CD0280BD7F2AFB
      8CA9C1D3916212805E3555F690C2CD94670078D557DFAC849CD02803D7F2AFBE
      EA021EF5AC01E3540BED1777A14AB46E3080A934FCE045501500D536A7E3555F
      7D342A3FD8FCA0178D557DCFB8EEFCC09602F1AAAFBD46C76DA6720078D557DF
      FE37F4E72C01FFA8AAFB44454EF3025803C6A817DE75861B9ED997F015E570A8
      76800BC6B8AFB828F4CF015E5902876800B15F70722DF05D289F016017AA1DA0
      02F1AAAFBEBF7BBFB38200C33F143B4401E35C57DC541006497AA1DA400C57DC
      242C4CF6180324BD50ED20078D502FB92A77079BADAB780BFDA7EAE6B62D4012
      876900BC6B8AFB9F6BAC780B287CA1DA602C57DB4C2F42853513C05963E50ED3
      0178D557DF7BBC82AF33CFCD024000773F9F1AE2BED221803307CA1DA600C57D
      FFBB7F1EBC01983E50ED3007FC22857DC67437891408D2025578A0BD008E21A2
      35C57DC832A790128F9417A211C4358AFB199F4A4E6E6F20251F282F48238868
      8D557DDC6EF846286005578A0BD308E41A235C97D88C40028F9417AE11C83592
      FB355E8B3A458FD408E41B3B2942BEE49BD2DC8600880953D505A211CA60110D
      11AAEB9E0226BE4D159080B417DC605A411A64DFCEC3446AABEF5AD346011D28
      404A55A82D208D339333B0D11AAAFB4E656C718C005554A0B4823955DA61A235
      5D73BD3D3E8E47002AAA505A611C87CC0688D557DC2C2C592048014AB505A811
      CAAED40D11AA15F6F528ED10E082404AAF1416A8472A4C60D4AA7A590E91AB2F
      B4C8B1C771D5320244CEB002D608E43E683446AABEC404E88443E8C809458A0B
      5823917AB0688D557DE8F49AC2BF880155E302D608E5498C1A33E443646ACBED
      DDE5EEE99D351EAE1A23565F6B4B4E8392000C2C605AE11C8BD5C3446A917DA7
      4BA852A6BC101557CED8ABC16E29034C2660111AB2FB8A5B44DA216A480B5C7D
      906984CC0223565F6EEF4B3B1768F202D92F730D309980446ACBEEBEBEE5D648
      02B3E762F4B0DCC34C2660011AB2FB31354A4803647D986984CC0023565F6262
      836B32801B65EE61A61330008D52AFB1EA54B7CBB7320267C38AB8F145C0457D
      E61A61330088D597DBAAA2A3AA36AC80B6C7D986984DA002585765F77D041448
      1572202DD2F730D309980446ACBEE324250C3B20067C28A12400681F30D30998
      0046ACBECEC9975F7507C2D7D9D9332FB3E0DA44B006E97B986984CC002354CB
      EC3DF6FD5A6D4D8042F55043BA3908502620223565F6F007921E54DAB00866AA
      087596BE62622923565F771777A0D4B186010D2F487597DE62620223565F66D1
      F3E030DD54370FD8119F090DD832FB8B8B8FD729000ED5410EB2D7CC4C45246A
      CBED253D474F668797A7D8865F6BFB3446AA57DB947CE01462AAE0243D282C11
      71191AB2FB06CEE65C5C28CB80B7C7CB8988D7357DA32856FBC8017AB8988D59
      7D9D1998F4E001117A58238233A6965F775BE622B77E800F9CF09C8D597DBBBD
      C057FBC8097AE2FB2359EC772BF9EE8A708158046DEABCFDB4FF111E826D23BE
      F6B77CD7DEA14E00828F9D1311AE91DCAFE740414BD8844D438EE7765253537A
      7CE84BDB93F6D3FC447A09B48EF40A1515608000030F9D1311AE91DCAFE74001
      8BD784D488EF18EEEFBF417E780423D25784C46ACBEF5534A0C169399780427D
      A3784C46AD4E704D78BE32FB044041176476040A2F584CC022356A73ABABAD3F
      4DBC0017E92BE2623565F77CC2E2A968C8005FB46F8988D5A9CC4C505B553001
      86C4E3181030BD61330008D6ACBEE5865EC0638088D597DBBEECECDF03E36380
      88D597DDE871221D9386480111AB2FB8E8E967F485170011AB2FB57AC5C97151
      0011AB2FB50565ACA2B8008D54DF7ECD7C5D05DC5E50088D597DD6714807224A
      F3280446AD7DE8AF772000D7DE71CA34B200392065F743A353F3EBC002356BEF
      D7CFCD38C7369F964E5796022356FB5C028B02F120C8E60088D7538C7B181CF9
      F846ADAE78B8B8DB76E392002356FB5CDFF188930007068DC63777B81D59F846
      B2A3BD332278CAC27B567409C7642329B91491791A91DE1D6B1D65FD6F556F40
      265F047790A08A8C3E715FBF920A01F645E46A47771B9DECAC23E95E5544CFC2
      293EB211A91DAB578E765FD77556F40065F0477319E4FCAC26F56280BE0D7891
      A91DD6A3A831ACBFA6808AF823B23E65FD380457C30F997F4E0115F04BD0A0A1
      065FD380057C11D91F32FE9E002BE187CCBFA7800B3425D548014E0A1E28DF7C
      09DB5AB6F9BE39395E3414A4C271CCC830BED1808824804D3AD5B19DF5074711
      A0974FB44360262C3AAE4DB7672BB4DB2A088AAC2FA108AD58957DC8B26E97AA
      D542BA01720886CA273165AEA9CE5820A3EF0E89B1C7BD4439AAC20D8C13E101
      08B07B71BF01FBCBBF0B25A1D690FF5D603222B45D9269E68E85DD6FF66EDF34
      250C59A791D4DD7081C022B234A947A16CCB255041EC19923622A12DE03B0B31
      37E8A483093C213DDE482182895CCE420E0B6656594666230A360F87B4DB72D8
      EEB131A0325185A069886D03846A405B76F92CAF60792A3501E2CDB0A49788BB
      3888A51789DB289379D4286E023C7C52998804502462E2582B18CBBA8958BF5B
      66A93C1CEF1806DE5C17CBBB883A614F760F3124F0831CB55FAFF0EE4CB45A51
      B27444322F84A61A2C48F18A6BEC3626CDC26741F7267492063E7202398ABCB7
      A8966A8F0FBE1B855CD8D83E79639D71626C78F75C6EB3502CCC012C97A9221A
      D0F60110CE6025994C793F9556C6B6B47CE59A2174D1D2F99F4C007D516108E2
      F68F25117AD388C700A2605B55AAE494CA54AF6B35DF4343B149D07BEB21240A
      CABF03F1D341F382C5498C4145B33A12C2342923C12C237212C267918246B030
      288A1382888138558C72BF938320B7819979AC22505ADDAB2595C389DA17AB08
      B068637B9BA175590A3749E9B213B9D1CA4CB9B47BD987589ADEC853147795DF
      63C6D85A847CDB0BB36ADC17B480EE06711C4572D10D5A5A7BE49A46ADDFAEE7
      E87382E38903DB7B79503AE7D482636E9462C10B3B337B598371C8AA80C8086E
      A81C685592D819A3ED25B2C37B836C2650E524F80CD352096D833584204CFC0C
      81E46B8C8C8494C2BF729ACE15C9636711D130E0435B306DC313C854701571CA
      E2B7D7AB81399FDDA5CA9E93F7ADA7620C42F31C09986DDF481622017786A518
      62FAF20E18338005B45A956FA8B8C60F3F0F744CC2A03494D6591BA6CDEC2902
      EA0D845297C820949B2C961B17D1681A8B168165B1CF4A4D71874A4C7B009303
      4337E25E41F834BD551B69CAC1A4A9992F1248CDED97843E56C37407A1D6935D
      06B9B8237505B86C585B45D6D99F74DCA2141FAE0691AD37098708698DE6BCF2
      410D31D71D2B084E1BBAF48B0BDAAA7B4ED0846FDE22619CBC86513528A60B79
      8B64701231998EA71FA2AB0E9497598671D74E740F6CF5BF4E4750904461D646
      1867B4708357CCC89D7431AD648A58CB586E05E048AAFF306E1ABAB6523CEF5E
      AAA8625224945FAA034D695CB01A3ABAB6D589A3A4FB2CF72735DFAB0D48D0D6
      DB06EE70161B833831AF9F564CD62932CA86D3AF8DADAE7B8E1F20418BB237B0
      4DB0218CCD5CF1F1A1C47BD2B740A73615ABA70051EDB34432D444D4E9064392
      A0CD78B088947A2C45679EACE607662976CCADCB55D4541844896A298BF306DA
      474D23D5A59CBCB81B7ECDF58E0B5D9A5259062FC8342193ADB184EBCAE6AB8D
      430C0736A8F720FDBADC2F6478B106AB833EA638F7AFA03A45ABA5CB2A7B9ADD
      65BF194CDD477934B8A53AA3BBA0392F73D5CE029D4B6A71EAA2A82037109988
      71F385C8EEAB1D6B68255080F7E45124D65D0D5E13DD6E487BA036C704201171
      3199433BF2E84DB671B1298804171E8BC1EC227C2374AD6A7A82962B6081012F
      CD72484680E3A883708EDB7100A657721926FEE20F28CE090594CAF00F78D803
      8C79E426FC1EC5C428C03CC28F996D66C8FEF1FE2F93C7AE54A035E176AD2259
      EDE559EEE2033BD997ACD7382D8FC7CAF617BE4C85D6DB25A1627B07DC8000DC
      140ECE6162FA634E3FD39E17B6FEE97BDE01830DA5C30D25327854814101965E
      18E570C518F8BEC714833663ACE64E47962CB245BB4C7A2B39394115C0CF8854
      F5BD5203F0B95E68F78D729CC832861B3EF394F0E4A2F4900FB40BBACD300420
      60DB396FDBF0492ED88E4A878507BB8675BA077D98675AAD3C0DBEBB00C7B1BB
      3341411632E39840D8A781A45A756CC281514F74080D2EDBD79D1EAB48A1EA6E
      F2B4FE2792FB45853D3D8B034907725529E02E7914D4CFDAC885EBE344D00D66
      70C47C7B84E68201873053ABFB2605189B679901CFC0608078761C206F633068
      95228D7B908FA5CBFE38DFF74AEB5005DBC7A60C1C1E0DCBF80BBE2AD965B1B1
      1BACB2F965710180351908E04252D54DAFF8D286115E9E05135A86C840ABA564
      A7B6FD42187F3DEE2592B03008C56BDC6D636C55C007412A6083F094F98718A5
      821BCCA3861FC36F37A4626E0C66BE86C004D3BC60032C0FE134CCC48CA1E125
      D53BF40983D480550E1F15F178D289CE67219C608A1E579C281D621401788523
      31F81C1F388EF598584150C41D6E8A821DD0603BE3182212C3A26B848182C868
      54B310658E98159348E188341A594C34B5CEAFC31A1F4B48D031DA61A6318098
      C168BE22F2152A15A34A1AB5E0B4BE2FF7FA8D8981399C7E348C195606FE5ED7
      C2ABA72AE975E2D6BE3F5BB2982D13C2F2860EDB4CEDD76AAAC9E532EDB03B1C
      BBEEB67948A187B1DA6FE486FEDDAF7CFC403E0C98187E3D4F061F9694818A39
      D673D7516233FAC9B1EB737725B1C2A0F91D7DE373E4A7E33C7C8EB6B349F32A
      73E669F2CCA2F75935D4AE572196E194B284FC00E0F9FEAED7507A069A34C43A
      B63E0A92D81EA8F15ED41E7F09A0D7C671E9F8F2D32D589A2581981477D3A29B
      7459737B5F9E6754CB7EF71983BD967877EAC2E3786325F7D60DFA9CE740027C
      AE295D654331C2BCAAB194833054655E04F5C6D328FA45BC2B8ECE15CBC8521D
      2770CE7C26B957CA40B9AE450FF9AA84CCAB356352556E31AAB631D1FC5A698C
      06B3EBC51477DFA354222FF0F99AA8CFF64955BA01B845559C0B014065173550
      D4D95E2C8C0DD4699DCA95CDE49B2372B18D523B58A735551BB7CC8146401DAD
      7471AB9AEB76C240BD372F18FEBF99B8391C716FB35EBACBDE50C673EBB03700
      739CCB4BDD3A944A19213646601E1C64CA79A4C9EFD9E7A39D1C791A5774F136
      AB9376B24AFAD54A2FF5ABB8CB553DE1E596ACF7CF47BA3D0DB5771514F41497
      CF443DC5F3D01B574B7D82EFF37B1CBE720F64B5569D874F8C0EF2EA2AEEFE48
      DCBEF36A2986E09FC9E6E0DA7E1BC6EA165B6F6D71D1C1A4F321620CDCDDAEDB
      1E156976098693F0BB40432EE5A69A5DC1B7615075F311E3B744C753AA195ADE
      35816C8867D988FDCB403EDD5C9E8EDB3C2453060EA264BA5EEC756C8229A0A5
      3C56450F5C04B2D04703A5ED6C73694DF778EB8EFD061BC1D589BF6180561446
      9D915267AEFBD03D5E875A22E4EDAD8C9E4375EFAF012A8BDB0A2BAF3892F2F3
      82BD02535DB03D9820D8A7EEC15D4F1696B1BB6BAEA8316D5DF38C24709D9400
      1C241BD75655A1A06BAB2CB3EE72DABA80BE7CCD05BA90840108320438888A22
      77248E13A0E539FAB62964C004F71BAD4E5E1FFBBD5EC7E254D84D18A09A7784
      D18C88D41420A91DF6F94DBBFF1E1DBE3C613FB7DB03C78514C389F3BCA43E64
      4F49D4709AD0D6F946006912FFABA2583305F071A19C941175CA87C8796036BF
      39515BCA4D1D83B056A7B40CC54FC4F95E422FBA020885972932DDEA0078151E
      CEB617254B02CA44430044695BB448A30EF6096E5C50324E57540ECC2E296ED2
      E243F6EA8A7C854E7F756339084122E382383F5A0C44398CC2CA57F307635112
      BAB215B280028D8478F402DF4A195773EDCB4D86CC16DA72A1E592762BB6068C
      DAE7255730AD6AA3C0056C16CC5CE76ED623ABF8789F53004F18A3342CBC7495
      902D40482BB2385D03C5B0F90F1E201DC5475A7B5683599EC0022C80EB640E24
      40F53101E5E70AD81713BB583EF0013A0A0A0A0212429E02515A9DF80882ED20
      13F11C705D70112110009F8760DDDD404ACF9555C054F5497910049AED2A0157
      28430F63080A17188DD0BE85F42FA17D0BE85C442E1955E9C4050AF83C8004FB
      93467B0158248A458085C66B8095C702C809D05D7014000EE880978301330130
      4510087F7554601742FA17D0BE85F42FA17110B8C8D50D2405623E6D0BAE3F98
      B082C049766CD146D92028184437404D39CB48419059202894C1D60158071016
      1F094F4E9D4F42FA17D0BE85F42FA17150BD809CA6D010B300979FE016014BC8
      80A48816010041A63D80B4CBABB6F00AA08086D80550B009F046B205F805450F
      20C021C8288202859080CC054D1EB00A44230364C02B76E207D0BE85F42FA17D
      0BE85E590BD26C366405BB5152202605EBC6DF00AC02F680979D010E38818001
      0DA122ECA01531016E4AA24BA02754C72CC05BD8750741CF804F15B260265680
      49386433A17D0BE85F42FA17D0BD0217BBD7ECB301066975C405BC940250706A
      0A3660254CB0B01206602D994EE5A7D6135A14E02B4D980952F66D6DCE024AA7
      7F0121D3B634028DDA02DA0B1684D67A17D0BE85F42FA17D0BD22160FBE00BF8
      04240EEA418A00B34743E252248BED016B9E9EC80B7D23D8866B4809523505B4
      0ED8256F809B635571B980958ECAA39D0BE85F42FA17D0BE85B0EA16C8020C08
      04EA4C8914A59591394D048BE691E88BB72AC526BCD1D765596570CAB3E422CD
      056C63BD0BE85F42FA17D0BE85E4742F10C8CD7B0407501626FB4A0B448BD052
      315C9405251D739475BC07AA17A21D499389E85D27A17D0BE85F42FA17D0B7A0
      2168C05820A0F080267181AA501148278084377BD2020929B935DEEC947A3CC4
      2020BDA025BBD6EF037D9B00B4BAEB4025C3A6550017A17D0BE85F42FA17D0BD
      621795C8E45D0120E2320191DDD0960FA05A013A8BBC02791DA37926F006404C
      C90A02545CA34F24D4A147E107804A85E15082FA17D0BE85F42FA17D0BD6216E
      0222E30242C8A1C1EA02153E62D1011058B6CB72C02034547DD602565B202DE2
      4A6D5009F7E9ABFEA69C7F476FF4AAB0138880A6D016C510097F4145FA3BF1FC
      B32F010A3AD7E8026BE85F42FA17D0BE85F42E86A85BA01026E2B2B2BA727540
      4D0EAEEEF5F62405671F31084053137A00A720E13570158586802A06669A6809
      F9FF40159647276A868719075A02B6CD2490135A60B4C01458D8C3C02441A0B8
      BD5804E64281C0C404A0B50161EB23DD0BE85F42FA17D0BE85EBD0BA48CA4421
      313429AD09404061C2519000002040798020DC2E19405AE50152AA5A00B1D82C
      2A80AB191C9462024D300B1AA05C05840D10C238396C40163540599C6E59E013
      2F314C50110B911E3DA822A0212C857C277A07D0BE85F42FA17D0BE85C442F02
      36CCA1955DD2AF42BC18043DABBAD46AAC32F88A4EF80B809F80227213AB43DB
      755A580A11D0BE02E02E85F017014442F396149EAD2DA001D901D5481E8A207C
      CC80F2727E6D0BEE5F07DE002461115E012D50604B011882015CD01B9028C416
      0E79C6120F4E8AA270DDD43C2108440E0AB66E10630307E7C142E8B71E39DC81
      00545316CA2982078E7240C2632E08627331BE43BB848CEA6CA270BAF5641C26
      E1C18541013931962197E19194EB96A519D44A2DEEDD8E84DD55DB107F5F0851
      26106873A9C990B9DFCC719490389E4334EA539325BA55A44188DE6389A7529C
      83C099906406AB106639C7529C987D12DC4A202ACBBE9C753E8814E774E4202D
      F3C0C583A9D39144160EAD0E4202DF6F03376922564EA74E4528AD992B62032B
      7AEA5EAF578DD2B50763A390E95F43AB1A59D65A054E6B8882F7BFA5651CCF0E
      4D04056ADB3AB1B100867DCAD63494D59BBD939D40AE9D577D4DB49457A5EC2B
      0ECECC2E14456A81B17065289BC40D5018822041A3E09D0C30DA5A5194B0153A
      AAFBF67201AC61644102B2384261072E01A188800ADE6F9B7EBB733837727528
      0956AA28B27BEB1B7D42F0284A241C66C298A205E95685289C4404E76002E6BA
      61A80BC21D2D090E4C08106A20C6EF7492757873A9D4CEDDCC67704A273E2894
      A2F0E73D12E4F27964E426F114DCA0A39013A73BF0809CFCBBE8E727538F3FA2
      F1CF8A2C73E39F1CF8E7C73E39F1CF8E7C73E39F1CF8E7C73E28B1CF8E7C73E3
      9F9CFCE7E73F39DC8E77CCFB1EF1A60E5786AEE439E5D0052CE2E53ACD1EA65C
      1664EEECDD511FEE6D064F2673CBE00BDA91FB144006857EC73A77F5711E3237
      728106AE00BF426A7389E00BFF65A77C00EA02944E4206967D39DC35C2413AC2
      FF275374137EA8093B02BC7EF18E169A65D0FFFDC258441CFF57FD0CF5E884EA
      7B1CC1B940542F1DE4ED59AC1FC29AA10882D751636FB895ABC8DC4C877D2162
      002F5A5FE2A7F60BBE0B0E128BACF4DC7F21A68EA62276E404F2885C393A5526
      49BC882944F420273CAA07D874E1C727515AB45F7766A0206636513A8EFB3936
      40E91054BF1CA27515AA9FC0FA2A026CBBB0B2751DF61100D4033A2CE3E93A93
      5C6E98645C8089EC4EA3D36EDD73F44A284946727515AA3292E405FE1CBB13A9
      3FB7F254A27F102F1FC90E5322C75D011D721DC7AF17A50404EA2B54EA41D011
      DA39DF93D88182101E3FF13EFE9498B112EF1D011DC19E48AFB652A202BA8B95
      3BF8B4023CB27B9030A205EAEBDD1520AEAE544FAAF7B37E8B6576F805D9B405
      66C49635EAEB5EA656F5B196BE92476D280A9B208165C6F2045A101EAE972A62
      0553DFC9913CFABD80AF42DEF830BF817ABA5BA183E652BECC93FB3004107922
      D8BFE4CBD5D87102F576C24490E7FF7B829948FF159276600AB5FE71768B589D
      4BCFA7D2D72A05FEE319A020588AB395DC3DF57565AE96283D4E0216A1B0BA37
      22752F57565ACD0B00804E2F8052E65BF6C278EFABB2220B36EBD6656592B754
      A2086F5771458E7E9381DC73E2131CF8E7C73E39F1CF8E7C73E39F1CF8A2C73E
      39F1CF884C73E39F1CF8E7C73E39F1CF8E7C73E28B1CF8E7C73E2131CF8E7C73
      E39F1CF8E7B3EFEE28BCF7F60E0801BD2B4946533F74F49C9FA80979227A79BD
      FDDEFE8BFEFEDD74C9D5F4D4329E2A3F050138256527A787BCFBDFDDEFEEF7F7
      7BFB8A29BEFEC5FD2F57DFD6BBCBFD87FBFBFDC40FBBEFE97D98018018018018
      01801DB1AE9FF7588EF0DC11B7B011101131A0142BBF05E3F770A640444C4583
      43A81540000882426A02FBCD044A01298D504C931B1E130784C1D450B202784E
      4FEB73BA1F13C1573CE9BD686D12FBFDE419DF40444044C458A9627F9AF91002
      527C9ED60E2E4F4D8D8C7E2F37E7A9E120220894025102933526312731E14078
      7F9D45050A1D1F710F0F124D4D2C08AEAF91E1DAE72A4E4069822805D8994F3A
      092053E492662615C22A8285D80817CBEAB2022B908514F66529761A8E012981
      8F0A23C3FCEA717695D4D7FCFEFCCF0F24B9EAEA2FB5CE572277379FD809C5E6
      A872B08CB9F1E164F0FF3A9630F7154A2FC62E7AA621E8F017C13D8DBC15C887
      F3FAA809C5E1E21C573911F87B025D39C9009D5CF8F002B9C09D45739A3A5011
      8A4B850701E0EAE70DBB7E9501008B9CE3E3C5C811751A347573FADEEC27804E
      AE7C784CAE7B4BAADD1EBAB9EB8F07973D1E158355CE706ADDFE005014BA3159
      92373EF51B84343DCF809F5CF8F00AB9C29D56F2265DFFD8F07D73FACEAB9C28
      0A5DCFA02D8007A901A9A62103BEB9CE680AE73B0550157AE7977E3F74202857
      3E3C029E01CEAB7A7E2EFFEE7842B9FA7F1F8D100AE2E7BE76033F29493F080B
      E9EC0496435E2E73BB353E7C8AB334DE7521169BC6DEEFDD8C0418B9F1E020F0
      127579C975C8844B9EC0F08973D1BB7DBA4015C5CFFC6A14FB0BD550404E2E2C
      8086AB486A25CFF8EE7A080A35D570046E7CC73FD6B271E14A78093ABC5D4BD5
      DA12E7BD2A91F173F339DC1A6015D5CE1F53EFA8017998B2B0FA5F9FC9F856A1
      739DEA0C6B9F1E028F0167547D4ECB9EC85F1AE7AE4014AC0147C8EF75FB801D
      EDF695D431D51D4827CB9F1E030F01C7579A815EA5C7907FD44FAF8383A53D08
      83C5CED76313D1A5716B404441E615BFD4DAC15D4B155690EF00888C85D499B5
      319573E3C2B8F01E752DDBAAEA8D73C6CF0534894AE9A2F05F4EFF7FEBDAED73
      3B9015308508688809DA4590BEF61294CD8088989EDEDB059C9C2BC7F5D889D4
      0A301298D6A4C931B1E14C78579D479464047C113FBA176DFD3C2DE5F7003003
      003003002CAB139D58E5D887FA0009480E84407FD103D45203E63DD3E82E2159
      287E4000C78D9005DB77D07DE08CFA8346BC2345FF024E11F2038BE23BE665F3
      3C9517CCF2665F33D44787768664867A951219EA664867F823C3E9CC0B11BE1E
      1884C69653F283333BFCEFED4CCD2BFA57F8139D0AEC3FCEF9A896326897FA0D
      A25FF5D87E9344A71A297FBFF2A118BFC122A840443A446B9584ABF5FE6F0404
      46BA18385F9394D3BEE738925CEFB18D3F877F0C6C00C00C003B4A5B1BFA8246
      AEA20110EF9CD66592A7ECBD24013290657474D87C0E6FE78EA7272E7F3EE76D
      A55018DE1339CDD339B3CA3B205051B16166011D42780B217202815A5B287769
      CDB7D871A3EA290052F9DECB92DB9B8CBA9785CE464B910329005C3C17CE6EED
      CDD6C2429E519391BF86F25DC153139B80277FC575771CDB95CEE8F4972E7A15
      CF9CDDE39B3130ADEF2B95BF95957695D47ACDCB9E764B0809005973B95CE0D7
      7109805973C00F32B9CAE43FC378026FE3E58AA447973E5CF973E3CF1E688F33
      7265721FE19804CBA8AE73474C02314888FB27361777169805973B95CFEF81AD
      4E02CB9E18799C7C78B93C5D468EA5A3DE0B9C11CDDE614F2E774B9C4D7E1D38
      0B39B8A9E609C8BEF39BF79D577C301225CE89FA4003966B5540B973FA5CF38F
      F8128016737A27D144F09737EEFE00A9014F5CF78F70A80A5A77EC0202205217
      99739D9032E1F1D09980F365ED85CE0B9C7DFF89FC002CE6E359CDF7D7386B9B
      B87C7E2AC053D7381B8210421DA52804E6EA40A42FC17385FCBE640489753728
      3BD5CFC6B5239CDD539BF6AE712737D6EC729580A7AE70BA6F72C014CB9C9BDD
      701063EB0CCB9DB922C02CB9F39BBD736BF2B9F8D4F3A4FE6E6C83DAA4092C01
      4CB9CEC47EFC7E48C7D3EC57579157C3F1B92FC30A62879E736B5CDE5CF49307
      730F117C2A21D9973AEDD45F6AE7CD5A0221DF173988C1573BE15D4D1566A436
      D97F05CF4E6367372D737973D544F2A661B44E33E7ECF67D7B5DBE4D3C054821
      121721D2B6D85919EF553F635600888D973FE6FFC82B55B8FEDB113E5C9011D9
      D9011E549FB00B02F0C6A9267C31B39BAC736EF7AF2C7378018018019CDD839B
      17E45CE1CDF56CDCF2BAFEE0014101D1481E86207F6E407C97C07B85C76B860F
      CC00F6BDB8F98043DE83C05D2E4000853C05A50202B0088A7C05A2149106012E
      01786F78784C6F4C5D7A6F7A782E14FA4CCF2B91A11E91B6229E072713038921
      31C97C29C49DF31DC9DCF14E64766C8F00AFD8EE8E7A39E0160100}
  end
  object dstblCondicionVenta: TDataSource
    DataSet = dmClientes.tblCondicionVenta
    Left = 360
    Top = 243
  end
end
