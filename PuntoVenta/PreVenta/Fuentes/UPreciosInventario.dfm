object frmPreciosInventario: TfrmPreciosInventario
  Left = 252
  Top = 114
  Width = 687
  Height = 464
  Caption = 'Precios Inventario'
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 679
    Height = 433
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Record'
      object DBStatusLabel4: TDBStatusLabel
        Left = 549
        Top = 341
        Width = 85
        Height = 13
        DatasetName = 'Inventario'
        DataSource = dmInventario.dsInventarioProd
      end
      object DBStatusLabel1: TDBStatusLabel
        Left = 565
        Top = 373
        Width = 85
        Height = 13
        DatasetName = 'Precio Inv.'
        DataSource = DataSource1
      end
      object Label1: TLabel
        Left = 3
        Top = 16
        Width = 33
        Height = 13
        Caption = 'Codigo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 192
        Top = 16
        Width = 57
        Height = 13
        Caption = 'FechaInicial'
      end
      object Label3: TLabel
        Left = 288
        Top = 16
        Width = 52
        Height = 13
        Caption = 'FechaFinal'
      end
      object Label4: TLabel
        Left = 383
        Top = 15
        Width = 60
        Height = 13
        Caption = 'Observacion'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 3
        Top = 56
        Width = 85
        Height = 13
        Caption = 'Precio Distribuidor'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 96
        Top = 56
        Width = 66
        Height = 13
        Caption = 'PrecioUnitario'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 192
        Top = 56
        Width = 47
        Height = 13
        Caption = 'Margenes'
        FocusControl = DBEdit7
      end
      object Label8: TLabel
        Left = 288
        Top = 56
        Width = 80
        Height = 13
        Caption = 'PrecioEnGeneral'
        FocusControl = DBEdit8
      end
      object Label9: TLabel
        Left = 384
        Top = 56
        Width = 30
        Height = 13
        Caption = 'Status'
        FocusControl = DBEdit9
      end
      object Label10: TLabel
        Left = 83
        Top = 16
        Width = 3
        Height = 13
        FocusControl = DBEdit1
      end
      object DBText1: TDBText
        Left = 49
        Top = 10
        Width = 139
        Height = 17
        Color = 16759413
        DataField = 'DESCRIPCION'
        DataSource = dmInventario.dsInventarioProd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object BitBtn1: TBitBtn
        Left = 549
        Top = 105
        Width = 105
        Height = 33
        Caption = '&Nuevo'
        TabOrder = 11
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
        Left = 549
        Top = 149
        Width = 105
        Height = 36
        Caption = '&Modificar'
        TabOrder = 12
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
        Left = 549
        Top = 196
        Width = 105
        Height = 33
        Caption = '&Cancelar '
        TabOrder = 13
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
        Left = 549
        Top = 239
        Width = 105
        Height = 33
        Caption = '&Guardar'
        TabOrder = 10
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
        Left = 549
        Top = 283
        Width = 105
        Height = 33
        Caption = '&Refrescar'
        TabOrder = 14
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
        Left = 549
        Top = 321
        Width = 105
        Height = 33
        Caption = 'Cl&ose'
        TabOrder = 15
        Kind = bkClose
      end
      object BitBtn8: TBitBtn
        Left = 551
        Top = 66
        Width = 101
        Height = 33
        Caption = 'Cambiar Precio'
        TabOrder = 16
        OnClick = BitBtn8Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
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
      object DBEdit1: TDBEdit
        Left = 3
        Top = 32
        Width = 62
        Height = 21
        DataField = 'CODIGO_TEXTO'
        DataSource = DataSource1
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 383
        Top = 31
        Width = 266
        Height = 21
        DataField = 'OBSERVACION'
        DataSource = DataSource1
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 3
        Top = 72
        Width = 73
        Height = 21
        DataField = 'PRECIO_DISTRIBUIDOR'
        DataSource = DataSource1
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 96
        Top = 72
        Width = 89
        Height = 21
        DataField = 'PRECIO_UNITARIO'
        DataSource = DataSource1
        TabOrder = 6
      end
      object DBEdit7: TDBEdit
        Left = 192
        Top = 72
        Width = 89
        Height = 21
        DataField = 'MARGENES'
        DataSource = DataSource1
        TabOrder = 7
      end
      object DBEdit8: TDBEdit
        Left = 288
        Top = 72
        Width = 89
        Height = 21
        DataField = 'PRECIOS_EN_GENERAL'
        DataSource = DataSource1
        TabOrder = 8
      end
      object DBEdit9: TDBEdit
        Left = 384
        Top = 72
        Width = 33
        Height = 21
        DataField = 'STATUS'
        DataSource = DataSource1
        TabOrder = 9
      end
      object DBDateEdit1: TDBDateEdit
        Left = 288
        Top = 32
        Width = 89
        Height = 21
        DataField = 'FECHA_INICIAL'
        DataSource = DataSource1
        NumGlyphs = 2
        TabOrder = 3
      end
      object DBDateEdit2: TDBDateEdit
        Left = 192
        Top = 32
        Width = 89
        Height = 21
        DataField = 'FECHA_INICIAL'
        DataSource = DataSource1
        NumGlyphs = 2
        TabOrder = 2
      end
      object DBGrid1: TDBGrid
        Left = 3
        Top = 98
        Width = 528
        Height = 289
        Color = 10547677
        DataSource = DataSource1
        FixedColor = 12578223
        TabOrder = 17
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_TEXTO'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_INICIAL'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_FINAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIO_DISTRIBUIDOR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIO_UNITARIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MARGENES'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIOS_EN_GENERAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACION'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IN_POR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOD_POR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_IN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_MOD'
            Visible = True
          end>
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 72
        Top = 32
        Width = 113
        Height = 21
        DataField = 'CODIGO_TEXTO'
        DataSource = DataSource1
        DropDownRows = 15
        DropDownWidth = 200
        KeyField = 'CODIGO_TEXTO'
        ListField = 'DESCRIPCION'
        ListSource = dmInventario.dsInventarioProd
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Examinar'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 671
        Height = 402
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_TEXTO'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_INICIAL'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_FINAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIO_DISTRIBUIDOR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIO_UNITARIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MARGENES'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIOS_EN_GENERAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACION'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IN_POR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOD_POR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_IN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_MOD'
            Visible = True
          end>
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = dmInventario.tblPrecioInventario
    Left = 376
    Top = 224
  end
end
