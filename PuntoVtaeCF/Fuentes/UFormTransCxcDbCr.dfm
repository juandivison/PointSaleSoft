object frmTransCxcProc: TfrmTransCxcProc
  Left = 198
  Top = 186
  Width = 915
  Height = 540
  Caption = 'Mantenimiento Transaccion Cxc'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 897
    Height = 369
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Facturas'
      ImageIndex = 1
    end
    object TabSheet2: TTabSheet
      Caption = 'Trans Cxc'
      ImageIndex = 1
      object Label18: TLabel
        Left = 120
        Top = 16
        Width = 39
        Height = 13
        Caption = 'Moneda'
      end
      object Label3: TLabel
        Left = 193
        Top = 16
        Width = 37
        Height = 13
        Caption = 'TipoTnf'
      end
      object Label8: TLabel
        Left = 8
        Top = 16
        Width = 44
        Height = 13
        Caption = 'Tipo Doc'
      end
      object Label2: TLabel
        Left = 281
        Top = 16
        Width = 30
        Height = 13
        Caption = 'Fecha'
      end
      object Label16: TLabel
        Left = 390
        Top = 16
        Width = 46
        Height = 13
        Caption = 'Concepto'
      end
      object Label4: TLabel
        Left = 544
        Top = 16
        Width = 30
        Height = 13
        Caption = 'Monto'
      end
      object rxdbboxmoneda: TRxDBComboBox
        Left = 120
        Top = 30
        Width = 73
        Height = 21
        Style = csDropDownList
        DataField = 'MONEDA'
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
        Left = 194
        Top = 30
        Width = 79
        Height = 21
        Style = csDropDownList
        DataField = 'TIPO_TRANF'
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'D'#233'bito'
          'Cr'#233'dito'
          '')
        TabOrder = 1
        Values.Strings = (
          '1'
          '2')
      end
      object RxDBLookupCombo4: TRxDBLookupCombo
        Left = 8
        Top = 30
        Width = 113
        Height = 21
        DropDownCount = 8
        DataField = 'TIPO_DOC'
        LookupField = 'CODIGO'
        LookupDisplay = 'DESCRIPCION'
        TabOrder = 2
      end
      object DBDateEdit1: TDBDateEdit
        Left = 280
        Top = 30
        Width = 105
        Height = 21
        NumGlyphs = 2
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 390
        Top = 30
        Width = 145
        Height = 21
        TabOrder = 4
      end
      object DBEdit8: TDBEdit
        Left = 542
        Top = 30
        Width = 121
        Height = 21
        DataField = 'VALOR_DOCUMENTO'
        TabOrder = 5
      end
      object RxDBGrid2: TRxDBGrid
        Left = 8
        Top = 64
        Width = 657
        Height = 201
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object BitBtn13: TBitBtn
        Left = 232
        Top = 289
        Width = 97
        Height = 31
        Cancel = True
        Caption = '&Modificar'
        TabOrder = 7
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
      object BitBtn11: TBitBtn
        Left = 336
        Top = 288
        Width = 97
        Height = 32
        Cancel = True
        Caption = '&Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
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
      object BitBtn6: TBitBtn
        Left = 440
        Top = 288
        Width = 97
        Height = 32
        Caption = '&Grabar'
        TabOrder = 9
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
        Left = 544
        Top = 287
        Width = 97
        Height = 32
        Caption = '&Salir'
        TabOrder = 10
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
      object btnInsertar: TBitBtn
        Left = 128
        Top = 288
        Width = 97
        Height = 33
        Caption = '&Insertar'
        TabOrder = 11
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
    end
  end
end
