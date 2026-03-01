object frmVendedores: TfrmVendedores
  Left = 358
  Top = 131
  Width = 954
  Height = 548
  Caption = 'Mantenimiento Vendedores'
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
    Left = 8
    Top = 8
    Width = 42
    Height = 13
    Caption = 'CODIGO'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 144
    Top = 8
    Width = 47
    Height = 13
    Caption = 'NOMBRE'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 59
    Height = 13
    Caption = 'DIRECCION'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 208
    Top = 48
    Width = 57
    Height = 13
    Caption = 'TELEFONO'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 336
    Top = 48
    Width = 49
    Height = 13
    Caption = 'CELULAR'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 448
    Top = 48
    Width = 43
    Height = 13
    Caption = 'STATUS'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 760
    Top = 8
    Width = 32
    Height = 13
    Caption = 'EMAIL'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 8
    Top = 88
    Width = 49
    Height = 13
    Caption = 'WEBSITE'
    FocusControl = DBEdit8
  end
  object Label9: TLabel
    Left = 210
    Top = 88
    Width = 24
    Height = 13
    Caption = 'PAIS'
    FocusControl = DBEdit9
  end
  object Label10: TLabel
    Left = 412
    Top = 88
    Width = 41
    Height = 13
    Caption = 'CIUDAD'
    FocusControl = DBEdit10
  end
  object Label11: TLabel
    Left = 552
    Top = 8
    Width = 43
    Height = 13
    Caption = 'CEDULA'
    FocusControl = DBEdit11
  end
  object Label12: TLabel
    Left = 632
    Top = 88
    Width = 68
    Height = 13
    Caption = 'REFERENCIA'
    FocusControl = DBEdit12
  end
  object Label13: TLabel
    Left = 789
    Top = 88
    Width = 107
    Height = 13
    Caption = 'TELEF_REFERENCIA'
    FocusControl = DBEdit13
  end
  object Label14: TLabel
    Left = 532
    Top = 88
    Width = 94
    Height = 13
    Caption = 'OTRO_TELEFONO'
    FocusControl = DBEdit14
  end
  object Label15: TLabel
    Left = 352
    Top = 8
    Width = 38
    Height = 13
    Caption = 'APODO'
    FocusControl = DBEdit15
  end
  object SpeedButton2: TSpeedButton
    Left = 248
    Top = 440
    Width = 81
    Height = 33
    Caption = '&Insertar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
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
    ParentFont = False
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 333
    Top = 440
    Width = 81
    Height = 33
    Caption = '&Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
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
    ParentFont = False
    OnClick = SpeedButton3Click
  end
  object SpeedButton8: TSpeedButton
    Left = 420
    Top = 440
    Width = 81
    Height = 33
    Caption = '&Eliminar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
      305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
      005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
      B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
      B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
      B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
      B0557777FF577777F7F500000E055550805577777F7555575755500000555555
      05555777775555557F5555000555555505555577755555557555}
    NumGlyphs = 2
    ParentFont = False
    OnClick = SpeedButton8Click
  end
  object SpeedButton7: TSpeedButton
    Left = 506
    Top = 440
    Width = 88
    Height = 33
    Caption = '&Refrescar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      3333333777333777FF33339993707399933333773337F3777FF3399933000339
      9933377333777F3377F3399333707333993337733337333337FF993333333333
      399377F33333F333377F993333303333399377F33337FF333373993333707333
      333377F333777F333333993333101333333377F333777F3FFFFF993333000399
      999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
      99933773FF777F3F777F339993707399999333773F373F77777F333999999999
      3393333777333777337333333999993333333333377777333333}
    NumGlyphs = 2
    ParentFont = False
    OnClick = SpeedButton7Click
  end
  object SpeedButton1: TSpeedButton
    Left = 601
    Top = 440
    Width = 81
    Height = 33
    Caption = '&Guardar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
      00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
      00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
      00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
      0003737FFFFFFFFF7F7330099999999900333777777777777733}
    NumGlyphs = 2
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object DBStatusLabel1: TDBStatusLabel
    Left = 832
    Top = 424
    Width = 85
    Height = 13
    DatasetName = 'Trans'
    DataSource = dmUsuarios.dstblVendedores
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 134
    Height = 21
    DataField = 'CODIGO'
    DataSource = dmUsuarios.dstblVendedores
    Enabled = False
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 144
    Top = 24
    Width = 200
    Height = 21
    DataField = 'NOMBRE'
    DataSource = dmUsuarios.dstblVendedores
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 64
    Width = 200
    Height = 21
    DataField = 'DIRECCION'
    DataSource = dmUsuarios.dstblVendedores
    TabOrder = 5
  end
  object DBEdit4: TDBEdit
    Left = 208
    Top = 64
    Width = 121
    Height = 21
    DataField = 'TELEFONO'
    DataSource = dmUsuarios.dstblVendedores
    TabOrder = 6
  end
  object DBEdit5: TDBEdit
    Left = 336
    Top = 64
    Width = 105
    Height = 21
    DataField = 'CELULAR'
    DataSource = dmUsuarios.dstblVendedores
    TabOrder = 7
  end
  object DBEdit6: TDBEdit
    Left = 448
    Top = 64
    Width = 41
    Height = 21
    DataField = 'STATUS'
    DataSource = dmUsuarios.dstblVendedores
    TabOrder = 8
  end
  object DBEdit7: TDBEdit
    Left = 760
    Top = 24
    Width = 137
    Height = 21
    DataField = 'EMAIL'
    DataSource = dmUsuarios.dstblVendedores
    TabOrder = 4
  end
  object DBEdit8: TDBEdit
    Left = 8
    Top = 104
    Width = 200
    Height = 21
    DataField = 'WEBSITE'
    DataSource = dmUsuarios.dstblVendedores
    TabOrder = 9
  end
  object DBEdit9: TDBEdit
    Left = 210
    Top = 104
    Width = 200
    Height = 21
    DataField = 'PAIS'
    DataSource = dmUsuarios.dstblVendedores
    TabOrder = 10
  end
  object DBEdit10: TDBEdit
    Left = 412
    Top = 104
    Width = 117
    Height = 21
    DataField = 'CIUDAD'
    DataSource = dmUsuarios.dstblVendedores
    TabOrder = 11
  end
  object DBEdit11: TDBEdit
    Left = 552
    Top = 24
    Width = 199
    Height = 21
    DataField = 'CEDULA'
    DataSource = dmUsuarios.dstblVendedores
    TabOrder = 3
  end
  object DBEdit12: TDBEdit
    Left = 632
    Top = 104
    Width = 153
    Height = 21
    DataField = 'REFERENCIA'
    DataSource = dmUsuarios.dstblVendedores
    TabOrder = 13
  end
  object DBEdit13: TDBEdit
    Left = 790
    Top = 104
    Width = 131
    Height = 21
    DataField = 'TELEF_REFERENCIA'
    DataSource = dmUsuarios.dstblVendedores
    TabOrder = 14
  end
  object DBEdit14: TDBEdit
    Left = 532
    Top = 104
    Width = 97
    Height = 21
    DataField = 'OTRO_TELEFONO'
    DataSource = dmUsuarios.dstblVendedores
    TabOrder = 12
  end
  object DBEdit15: TDBEdit
    Left = 352
    Top = 24
    Width = 200
    Height = 21
    DataField = 'APODO'
    DataSource = dmUsuarios.dstblVendedores
    TabOrder = 2
  end
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 136
    Width = 913
    Height = 281
    DataSource = dmUsuarios.dstblVendedores
    TabOrder = 15
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
        FieldName = 'FOTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APODO'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEDULA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRECCION'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CELULAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WEBSITE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIUDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEF_REFERENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTRO_TELEFONO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSERTADO_POR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_INSERTADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_MOD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODI_POR'
        Visible = True
      end>
  end
end
