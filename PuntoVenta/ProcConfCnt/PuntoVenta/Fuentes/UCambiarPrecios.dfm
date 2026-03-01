object frmCambiarPrecio: TfrmCambiarPrecio
  Left = 227
  Top = 131
  Width = 792
  Height = 574
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
  object Label2: TLabel
    Left = 8
    Top = 95
    Width = 49
    Height = 13
    Caption = 'Precio Ant'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 152
    Top = 95
    Width = 30
    Height = 13
    Caption = 'Precio'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 55
    Width = 56
    Height = 13
    Caption = 'Descripcion'
    FocusControl = DBEdit1
  end
  object Label1: TLabel
    Left = 104
    Top = 7
    Width = 78
    Height = 13
    Caption = 'Nuevo Precio'
    FocusControl = DBEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 7
    Width = 67
    Height = 13
    Caption = 'Aumentar %'
    FocusControl = DBEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 144
    Width = 172
    Height = 13
    Caption = 'CONSULTA INVENTARIO ACTUAL'
    Color = 13434879
    ParentColor = False
  end
  object Label7: TLabel
    Left = 496
    Top = 144
    Width = 189
    Height = 13
    Caption = 'CONSULTA INVENTARIO HISTORICO'
    Color = 13434879
    ParentColor = False
  end
  object Label8: TLabel
    Left = 349
    Top = 3
    Width = 109
    Height = 20
    Caption = 'INVENTARIO'
    Color = 64
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 111
    Width = 134
    Height = 21
    DataField = 'PRECIO_ANT'
    DataSource = dmInventario.dsInventarioProd
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 152
    Top = 111
    Width = 97
    Height = 21
    DataField = 'PRECIO'
    DataSource = dmInventario.dsInventarioProd
    TabOrder = 1
    OnChange = DBEdit3Change
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 71
    Width = 241
    Height = 21
    DataField = 'DESCRIPCION'
    DataSource = dmInventario.dsInventarioProd
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 255
    Top = 69
    Width = 87
    Height = 30
    Caption = '&Procesar'
    TabOrder = 3
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
      0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
      00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
      00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
      F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
      F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
      FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
      0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
      00337777FFFF77FF7733EEEE0000000003337777777777777333}
    NumGlyphs = 2
  end
  object RadioGroup1: TRadioGroup
    Left = 192
    Top = 8
    Width = 151
    Height = 57
    Hint = 'Aplica cambio de precio a todos los productos'
    Caption = 'Apli&car Cambio Precio a'
    Items.Strings = (
      'Pr&oducto actual'
      'Todos los p&roductos')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object RxCalcEdit1: TRxCalcEdit
    Left = 8
    Top = 24
    Width = 73
    Height = 21
    AutoSize = False
    NumGlyphs = 2
    TabOrder = 5
  end
  object RxCalcEdit2: TRxCalcEdit
    Left = 104
    Top = 24
    Width = 81
    Height = 21
    AutoSize = False
    NumGlyphs = 2
    TabOrder = 6
  end
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 160
    Width = 481
    Height = 294
    Color = clWhite
    DataSource = dmInventario.dsqryConsultaInvActual
    FixedColor = 10547677
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_ULTIMA_TRN'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_ANT'
        Width = 51
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
        FieldName = 'BLCE_CANT_ENTRADA'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BLCE_CANT_SALIDA'
        Width = 55
        Visible = True
      end>
  end
  object RxDBGrid2: TRxDBGrid
    Left = 496
    Top = 160
    Width = 273
    Height = 294
    Color = clWhite
    DataSource = dmInventario.dsqryConsultaInvhist
    FixedColor = 11004329
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SERIE'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_INICIO'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_FINAL'
        Width = 70
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 253
    Top = 112
    Width = 87
    Height = 33
    Caption = 'Re&frescar'
    TabOrder = 9
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
      FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
      C8807FF7777777777FF700000000000000007777777777777777333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object RxDBGrid3: TRxDBGrid
    Left = 348
    Top = 24
    Width = 421
    Height = 115
    Color = clWhite
    DataSource = dmInventario.dsInventarioProd
    FixedColor = 10547677
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 143
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
        FieldName = 'PRECIO'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_ANT'
        Width = 58
        Visible = True
      end>
  end
  object BitBtn3: TBitBtn
    Left = 544
    Top = 0
    Width = 33
    Height = 25
    TabOrder = 11
    OnClick = BitBtn3Click
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
  object BitBtn4: TBitBtn
    Left = 509
    Top = 0
    Width = 33
    Height = 25
    TabOrder = 12
    OnClick = BitBtn4Click
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
  object BitBtn5: TBitBtn
    Left = 579
    Top = 0
    Width = 33
    Height = 25
    TabOrder = 13
    OnClick = BitBtn5Click
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
  object BitBtn6: TBitBtn
    Left = 474
    Top = 0
    Width = 33
    Height = 25
    TabOrder = 14
    OnClick = BitBtn6Click
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
  object RxGradientCaption1: TRxGradientCaption
    Captions = <
      item
        Caption = 'Cambiar Precio(s)'
        InactiveColor = clActiveCaption
      end>
    DefaultFont = False
    FontInactiveColor = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    StartColor = 16776176
    Left = 416
    Top = 216
  end
end
