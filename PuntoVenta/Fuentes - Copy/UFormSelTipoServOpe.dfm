object frmRegServicioTaller: TfrmRegServicioTaller
  Left = 232
  Top = 103
  Width = 966
  Height = 610
  Caption = 'Mantenimiento de Servicios Taller'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 958
    Height = 579
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Record'
      object Label1: TLabel
        Left = 291
        Top = 8
        Width = 108
        Height = 16
        Caption = 'Nombre Cliente'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 806
        Top = 8
        Width = 83
        Height = 16
        Caption = 'Monto Total'
        FocusControl = DBEdit2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 900
        Top = 8
        Width = 44
        Height = 16
        Caption = 'Status'
        FocusControl = DBEdit3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 8
        Width = 102
        Height = 16
        Caption = 'Fecha Entrada'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 122
        Top = 8
        Width = 93
        Height = 16
        Caption = 'Fecha Salida'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 74
        Width = 39
        Height = 20
        Caption = 'Cant'
        FocusControl = DBEdit4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 168
        Top = 74
        Width = 111
        Height = 20
        Caption = 'Valor Servicio'
        FocusControl = DBEdit5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 288
        Top = 74
        Width = 95
        Height = 20
        Caption = 'Descripcion'
        FocusControl = DBEdit6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 592
        Top = 74
        Width = 54
        Height = 20
        Caption = 'Status'
        FocusControl = DBEdit7
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBStatusLabel1: TDBStatusLabel
        Left = 707
        Top = 109
        Width = 85
        Height = 13
        DatasetName = 'Det'
        DataSource = dmVentas.dstblRegServicioDet
        ShadowSize = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBStatusLabel2: TDBStatusLabel
        Left = 707
        Top = 90
        Width = 85
        Height = 13
        DatasetName = 'Master'
        DataSource = dmVentas.dstblRegServicioMaster
        ShadowSize = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 9
        Top = 128
        Width = 136
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Caption = 'SERVICIOS'
        Color = 8454143
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Shape1: TShape
        Left = 8
        Top = 70
        Width = 745
        Height = 2
        Pen.Color = 16744576
      end
      object RxSpeedButton5: TRxSpeedButton
        Left = 8
        Top = 468
        Width = 129
        Height = 25
        Hint = 'Insertar, consultar, modificar'
        DropDownMenu = PopupMenu1
        Caption = '&Opciones'
        Flat = True
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
        Layout = blGlyphLeft
        NumGlyphs = 2
        Transparent = True
      end
      object Label11: TLabel
        Left = 88
        Top = 74
        Width = 51
        Height = 20
        Caption = 'Precio'
        FocusControl = DBEdit4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 377
        Top = 514
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
      end
      object Label15: TLabel
        Left = 423
        Top = 484
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
      object DBText5: TDBText
        Left = 519
        Top = 484
        Width = 100
        Height = 23
        Alignment = taRightJustify
        Color = clBlack
        DataField = 'MONTO_TOTAL'
        DataSource = dmVentas.dstblRegServicioMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label13: TLabel
        Left = 630
        Top = 514
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
      object DBText7: TDBText
        Left = 735
        Top = 514
        Width = 100
        Height = 21
        Alignment = taRightJustify
        Color = clBlack
        DataField = 'MONTO_DEVUELTO'
        DataSource = dmVentas.dstblRegServicioMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label14: TLabel
        Left = 582
        Top = 8
        Width = 145
        Height = 16
        Caption = 'Facilitador / Servicio'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label27: TLabel
        Left = 248
        Top = 384
        Width = 85
        Height = 13
        Caption = 'Observaciones'
        Color = 8454143
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label16: TLabel
        Left = 237
        Top = 11
        Width = 42
        Height = 13
        Caption = 'CodCte'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 527
        Top = 29
        Width = 26
        Height = 29
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
      object DBEdit1: TDBEdit
        Left = 287
        Top = 32
        Width = 237
        Height = 24
        CharCase = ecUpperCase
        DataField = 'NOMBRE_CLIENTE'
        DataSource = dmVentas.dstblRegServicioMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 804
        Top = 32
        Width = 91
        Height = 24
        DataField = 'MONTO_TOTAL'
        DataSource = dmVentas.dstblRegServicioMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit3: TDBEdit
        Left = 900
        Top = 32
        Width = 43
        Height = 24
        CharCase = ecUpperCase
        DataField = 'STATUS'
        DataSource = dmVentas.dstblRegServicioMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object DBDateEdit1: TDBDateEdit
        Left = 8
        Top = 32
        Width = 110
        Height = 28
        DataField = 'FECHA_ENTRADA'
        DataSource = dmVentas.dstblRegServicioMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
      end
      object DBDateEdit2: TDBDateEdit
        Left = 120
        Top = 32
        Width = 112
        Height = 28
        DataField = 'FECHA_SALIDA'
        DataSource = dmVentas.dstblRegServicioMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 8
        Top = 98
        Width = 73
        Height = 24
        DataField = 'CANT'
        DataSource = dmVentas.dstblRegServicioDet
        TabOrder = 6
        OnChange = DBEdit4Change
        OnExit = DBEdit4Change
      end
      object DBEdit5: TDBEdit
        Left = 168
        Top = 98
        Width = 105
        Height = 24
        DataField = 'VALOR_SERVICIO'
        DataSource = dmVentas.dstblRegServicioDet
        ReadOnly = True
        TabOrder = 8
      end
      object DBEdit6: TDBEdit
        Left = 288
        Top = 98
        Width = 297
        Height = 24
        CharCase = ecUpperCase
        DataField = 'DESCRIPCION'
        DataSource = dmVentas.dstblRegServicioDet
        TabOrder = 9
      end
      object DBEdit7: TDBEdit
        Left = 592
        Top = 98
        Width = 49
        Height = 24
        CharCase = ecUpperCase
        DataField = 'STATUS'
        DataSource = dmVentas.dstblRegServicioDet
        TabOrder = 10
      end
      object RxDBGrid1: TRxDBGrid
        Left = 244
        Top = 160
        Width = 557
        Height = 217
        DataSource = dmVentas.dstblRegServicioDet
        FixedColor = 10932991
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = PopupMenu2
        TabOrder = 12
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = bblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMERO'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANT'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIO'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_SERVICIO'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Width = 22
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IN_POR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_IN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UPDATE_POR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_UPDATE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_USUARIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_SERVICIO'
            Visible = True
          end>
      end
      object BitBtn1: TBitBtn
        Left = 803
        Top = 162
        Width = 129
        Height = 38
        Caption = 'Nuevo &Det'
        TabOrder = 13
        OnClick = BitBtn1Click
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
      object BitBtn2: TBitBtn
        Left = 803
        Top = 204
        Width = 129
        Height = 38
        Caption = '&Modificar'
        TabOrder = 14
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
        Left = 803
        Top = 287
        Width = 129
        Height = 38
        Caption = '&Eliminar'
        TabOrder = 15
        OnClick = BitBtn3Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
        Left = 803
        Top = 246
        Width = 129
        Height = 38
        Caption = '&Guardar'
        TabOrder = 16
        OnClick = BitBtn4Click
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
      object BitBtn5: TBitBtn
        Left = 803
        Top = 327
        Width = 129
        Height = 38
        Caption = '&Refrescar'
        TabOrder = 17
        OnClick = BitBtn5Click
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
      object BitBtn6: TBitBtn
        Left = 803
        Top = 457
        Width = 129
        Height = 38
        TabOrder = 18
        Kind = bkClose
      end
      object BitBtn7: TBitBtn
        Left = 803
        Top = 121
        Width = 127
        Height = 38
        Caption = '&Nuevo Master'
        TabOrder = 19
        OnClick = BitBtn7Click
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
      object BitBtn8: TBitBtn
        Left = 803
        Top = 369
        Width = 129
        Height = 38
        Caption = '&Imprimir'
        TabOrder = 20
        OnClick = BitBtn8Click
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
      object BitBtn9: TBitBtn
        Left = 803
        Top = 92
        Width = 31
        Height = 25
        TabOrder = 21
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
        Left = 838
        Top = 93
        Width = 30
        Height = 25
        TabOrder = 22
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
        Left = 871
        Top = 92
        Width = 29
        Height = 25
        TabOrder = 23
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
        Left = 903
        Top = 91
        Width = 30
        Height = 25
        TabOrder = 24
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
      object RxCheckListBox1: TRxCheckListBox
        Left = 8
        Top = 160
        Width = 233
        Height = 300
        Color = 15461355
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 16
        MultiSelect = True
        ParentFont = False
        TabOrder = 11
        OnClick = RxCheckListBox1Click
        InternalVersion = 202
      end
      object BitBtn13: TBitBtn
        Left = 200
        Top = 128
        Width = 41
        Height = 26
        Hint = 'Agregar Servicios'
        Caption = '>>'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 25
        OnClick = BitBtn13Click
      end
      object BitBtn14: TBitBtn
        Left = 152
        Top = 128
        Width = 39
        Height = 25
        Hint = 'Clic para insertar servicios'
        Caption = '>'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 26
        OnClick = BitBtn14Click
      end
      object DBEdit8: TDBEdit
        Left = 88
        Top = 97
        Width = 73
        Height = 24
        DataField = 'PRECIO'
        DataSource = dmVentas.dstblRegServicioDet
        TabOrder = 7
        OnExit = DBEdit8Exit
      end
      object Edit1: TEdit
        Left = 519
        Top = 512
        Width = 100
        Height = 28
        Hint = 'Entre monto dinero entragado,para calcular devolucion'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 27
        OnExit = Edit1Exit
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 580
        Top = 32
        Width = 216
        Height = 27
        Hint = 'Indique persona que ejecut'#243' el servicio'
        DropDownCount = 8
        DataField = 'CODIGO_EMP'
        DataSource = dmVentas.dstblRegServicioMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LookupField = 'CODIGO'
        LookupDisplay = 'NOMBRECOMPLETO'
        LookupSource = dmVentas.dsqryEmpleado
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object BitBtn15: TBitBtn
        Left = 803
        Top = 415
        Width = 129
        Height = 38
        Caption = '&Facturar/Cerrar'
        TabOrder = 28
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
      object DBMemo1: TDBMemo
        Left = 248
        Top = 398
        Width = 545
        Height = 60
        DataField = 'DESCRIPCIONESPECIAL'
        DataSource = dmVentas.dstblRegServicioDet
        ScrollBars = ssVertical
        TabOrder = 29
      end
      object BitBtn16: TBitBtn
        Left = 246
        Top = 128
        Width = 145
        Height = 25
        Caption = 'Nuevo Det Inv Master'
        TabOrder = 30
        OnClick = BitBtn16Click
      end
      object DBEdit9: TDBEdit
        Left = 236
        Top = 32
        Width = 46
        Height = 24
        CharCase = ecUpperCase
        DataField = 'CODIGO_CTE'
        DataSource = dmVentas.dstblRegServicioMaster
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 31
        OnExit = DBEdit9Exit
      end
      object BitBtn17: TBitBtn
        Left = 554
        Top = 32
        Width = 25
        Height = 25
        Hint = 'Crear Cliente'
        Caption = ':'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 32
        OnClick = BitBtn17Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
          555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
          05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
          FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
          FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
          FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
          05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
          555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
          9055575757575757775505050505055505557575757575557555}
        NumGlyphs = 2
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Examinar'
      ImageIndex = 1
      object RxDBGrid2: TRxDBGrid
        Left = 0
        Top = 0
        Width = 950
        Height = 548
        Align = alClient
        DataSource = dmVentas.dstblRegServicioMaster
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMERO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_TRNVENTA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_ENTRADA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_SALIDA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_CTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE_CLIENTE'
            Width = 208
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_EMP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MONTO_TOTAL'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_USUARIO'
            Width = 81
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
  object rxData: TRxMemoryData
    FieldDefs = <
      item
        Name = 'CodServicio'
        DataType = ftInteger
      end
      item
        Name = 'DescProducto'
        DataType = ftString
        Size = 40
      end>
    Left = 372
    Top = 295
    object rxDataCodServicio: TIntegerField
      FieldName = 'CodServicio'
    end
    object rxDataDescProducto: TStringField
      FieldName = 'DescProducto'
      Size = 40
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 188
    Top = 495
    object ReimprimirComprobante1: TMenuItem
      Caption = '&Reimprimir Comprobante'
      Visible = False
    end
    object ConsultarActivos1: TMenuItem
      Caption = 'Consultar Activos'
      OnClick = ConsultarActivos1Click
    end
    object Consultar1: TMenuItem
      Caption = 'Consultar Cerrados'
      OnClick = Consultar1Click
    end
    object Listarservicios1: TMenuItem
      Caption = 'Reporte Servicios'
      OnClick = Listarservicios1Click
    end
    object Salir1: TMenuItem
      Caption = '&Salir'
      OnClick = Salir1Click
    end
  end
  object GetAnyDate1: TGetAnyDate
    Fecha = 41030.000000000000000000
    VFechaF = True
    EligeTipo = False
    TipoRes = 1
    UsaFechaCierre = True
    Left = 516
    Top = 231
  end
  object ibstpProcSecuencia: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_SECUENCIA'
    Left = 400
    Top = 194
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SECUENCIA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
  end
  object PopupMenu2: TPopupMenu
    Left = 612
    Top = 267
    object EliminarRecordDet1: TMenuItem
      Caption = 'Eliminar Record Det'
      OnClick = EliminarRecordDet1Click
    end
  end
end
