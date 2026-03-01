object frmBalanceCxcCtes: TfrmBalanceCxcCtes
  Left = 216
  Top = 185
  Width = 724
  Height = 480
  Caption = 'Balance Cxc Clientes'
  Color = 12578223
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 34
    Width = 68
    Height = 13
    Caption = 'Codigo Cliente'
  end
  object Label2: TLabel
    Left = 88
    Top = 34
    Width = 72
    Height = 13
    Caption = 'Nombre Cliente'
  end
  object RxLabel1: TRxLabel
    Left = 448
    Top = 8
    Width = 156
    Height = 13
    Caption = 'BALANCE ACTUAL CLIENTE :>'
  end
  object RxLabel2: TRxLabel
    Left = 448
    Top = 32
    Width = 154
    Height = 13
    Caption = 'TOTAL CUENTA X COBRAR :>'
  end
  object Label3: TLabel
    Left = 608
    Top = 8
    Width = 82
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8404992
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 608
    Top = 32
    Width = 82
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8404992
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 7
    Top = 88
    Width = 690
    Height = 345
    DataSource = dsqryBalanceCte
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = RxDBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_FACTURAR'
        Width = 206
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEF_CONTACTO'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTACTO'
        Width = 102
        Visible = True
      end
      item
        Color = 12578223
        Expanded = False
        FieldName = 'BALANCE_ACT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERVICIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BALANCE_ANT'
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
        FieldName = 'FECHA_BCE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_ULT_PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS_BCE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_IN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IN_POR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_MOD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOD_POR'
        Visible = True
      end>
  end
  object EditN1: TEditN
    Left = 8
    Top = 50
    Width = 73
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
    ValueDate = 38711.000000000000000000
    ValueTime = 0.545593969907407400
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object BitBtn1: TBitBtn
    Left = 245
    Top = 48
    Width = 75
    Height = 25
    Caption = '&Buscar'
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
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
  object BitBtn2: TBitBtn
    Left = 341
    Top = 48
    Width = 75
    Height = 25
    Caption = '&Fact Pend'
    TabOrder = 3
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00370777033333
      3330337F3F7F33333F3787070003333707303F737773333373F7007703333330
      700077337F3333373777887007333337007733F773F333337733700070333333
      077037773733333F7F37703707333300080737F373333377737F003333333307
      78087733FFF3337FFF7F33300033330008073F3777F33F777F73073070370733
      078073F7F7FF73F37FF7700070007037007837773777F73377FF007777700730
      70007733FFF77F37377707700077033707307F37773F7FFF7337080777070003
      3330737F3F7F777F333778080707770333333F7F737F3F7F3333080787070003
      33337F73FF737773333307800077033333337337773373333333}
    NumGlyphs = 2
  end
  object EditN2: TEditN
    Left = 88
    Top = 50
    Width = 145
    Height = 21
    Color = clSilver
    TabOrder = 4
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
    ValueDate = 38711.000000000000000000
    ValueTime = 0.545593969907407400
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object BitBtn6: TBitBtn
    Left = 450
    Top = 48
    Width = 33
    Height = 25
    TabOrder = 5
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
  object BitBtn4: TBitBtn
    Left = 485
    Top = 48
    Width = 33
    Height = 25
    TabOrder = 6
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
  object BitBtn3: TBitBtn
    Left = 520
    Top = 48
    Width = 33
    Height = 25
    TabOrder = 7
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
  object BitBtn5: TBitBtn
    Left = 555
    Top = 48
    Width = 33
    Height = 25
    TabOrder = 8
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
  object BitBtn7: TBitBtn
    Left = 244
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Ord. X Nomb'
    TabOrder = 9
    OnClick = BitBtn7Click
  end
  object BitBtn8: TBitBtn
    Left = 340
    Top = 16
    Width = 76
    Height = 25
    Caption = 'Ord. x Codigo'
    TabOrder = 10
    OnClick = BitBtn8Click
  end
  object dsqryBalanceCte: TDataSource
    AutoEdit = False
    DataSet = dmBalanceCxc.qryBalanceCte
    OnDataChange = dsqryBalanceCteDataChange
    Left = 256
    Top = 192
  end
end
