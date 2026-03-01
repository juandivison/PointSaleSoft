object frmProcVentaRapida: TfrmProcVentaRapida
  Left = 304
  Top = 121
  Width = 960
  Height = 742
  Caption = 'Procesar Ventas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = RxLabel1Click
  OnClick = FormClick
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnHide = FormHide
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    952
    711)
  PixelsPerInch = 96
  TextHeight = 13
  object Label25Temporalrename: TLabel
    Left = 564
    Top = 527
    Width = 117
    Height = 13
    Caption = 'Label25Temporalrename'
    Visible = False
    OnClick = Label25TemporalrenameClick
  end
  object DBText4: TDBText
    Left = 688
    Top = 363
    Width = 125
    Height = 20
    Hint = 'DBText4'
    Alignment = taRightJustify
    Anchors = [akLeft]
    Color = clBlack
    DataField = 'MontoDescAdicional'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object Label1: TLabel
    Left = 584
    Top = 92
    Width = 38
    Height = 24
    Caption = 'Cant'
    FocusControl = DBEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 638
    Top = 92
    Width = 54
    Height = 24
    Caption = 'Precio'
    FocusControl = DBEdit2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 134
    Top = 95
    Width = 100
    Height = 19
    AutoSize = False
    Caption = 'Descripci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 133
    Top = 124
    Width = 42
    Height = 13
    AutoSize = True
    DataField = 'Descripcion'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8404992
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 593
    Top = 311
    Width = 81
    Height = 24
    Caption = 'Sub-Total'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 788
    Top = 92
    Width = 53
    Height = 24
    Caption = 'Monto'
    FocusControl = DBEdit3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = Label5Click
  end
  object Label6: TLabel
    Left = 9
    Top = 95
    Width = 44
    Height = 16
    Caption = 'C'#243'digo'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label7: TLabel
    Left = 547
    Top = 468
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
  object Label8: TLabel
    Left = 584
    Top = 518
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
  object RxSpeedButton5: TRxSpeedButton
    Left = 12
    Top = 338
    Width = 105
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
  object Label9: TLabel
    Left = 9
    Top = 541
    Width = 77
    Height = 13
    Caption = 'Fecha vigente : '
  end
  object Label10: TLabel
    Left = 129
    Top = 364
    Width = 46
    Height = 13
    Caption = 'Label10'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label11: TLabel
    Left = 11
    Top = 602
    Width = 45
    Height = 13
    Caption = 'Usuario : '
  end
  object Label12: TLabel
    Left = 59
    Top = 602
    Width = 3
    Height = 13
  end
  object Shape4: TShape
    Left = 724
    Top = 211
    Width = 3
    Height = 44
    Brush.Color = 10547677
    Pen.Color = 10547677
  end
  object Label13: TLabel
    Left = 640
    Top = 375
    Width = 32
    Height = 24
    Caption = 'Itbis'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label14: TLabel
    Left = 601
    Top = 334
    Width = 72
    Height = 24
    Caption = 'Recargo'
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
    Left = 594
    Top = 492
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
  object DBText2: TDBText
    Left = 688
    Top = 310
    Width = 125
    Height = 19
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'SubTotalScreen'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText3: TDBText
    Left = 688
    Top = 382
    Width = 125
    Height = 20
    Hint = 'DBText3'
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'itbis'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object DBText5: TDBText
    Left = 688
    Top = 493
    Width = 125
    Height = 23
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'totalneto'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText7: TDBText
    Left = 688
    Top = 517
    Width = 125
    Height = 21
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'devolucion'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label16: TLabel
    Left = 739
    Top = 155
    Width = 124
    Height = 16
    Caption = '% Desc. Adic./Monto'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object DBText6: TDBText
    Left = 687
    Top = 410
    Width = 125
    Height = 21
    Hint = 'DBText6'
    Alignment = taRightJustify
    Anchors = [akLeft]
    Color = clBlack
    DataField = 'MontoInteres'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object Label17: TLabel
    Left = 579
    Top = 405
    Width = 103
    Height = 20
    Caption = 'Monto Interes.'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Label18: TLabel
    Left = 8
    Top = 32
    Width = 103
    Height = 20
    Caption = 'Codigo Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label19: TLabel
    Left = 327
    Top = 37
    Width = 78
    Height = 20
    Caption = 'Referencia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label20: TLabel
    Left = 509
    Top = 39
    Width = 115
    Height = 13
    Caption = 'Nombre cliente generico'
  end
  object lblProcDev: TLabel
    Left = 169
    Top = 533
    Width = 261
    Height = 24
    Caption = 'PROCESANDO DEVOLUCION'
    Color = 16773360
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object RxLabel1: TRxLabel
    Left = 7
    Top = 557
    Width = 47
    Height = 13
    Caption = 'RxLabel1'
    OnClick = RxLabel1Click
  end
  object RxLabel2: TRxLabel
    Left = 8
    Top = 573
    Width = 47
    Height = 13
    Caption = 'RxLabel1'
    OnClick = RxLabel1Click
  end
  object Label21: TLabel
    Left = 702
    Top = 562
    Width = 106
    Height = 13
    Caption = '************  *************'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object Label22: TLabel
    Left = 12
    Top = 364
    Width = 70
    Height = 13
    Caption = 'Inventario : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = Label22Click
  end
  object lblInventario: TLabel
    Left = 296
    Top = 363
    Width = 82
    Height = 13
    Caption = 'No Seleccionado'
  end
  object Label23: TLabel
    Left = 214
    Top = 37
    Width = 69
    Height = 16
    Caption = 'Mayorista'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object rxLabelVence: TRxLabel
    Left = 236
    Top = 83
    Width = 61
    Height = 13
    Caption = 'Vence en '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    OnDblClick = rxLabelVenceDblClick
  end
  object Label24: TLabel
    Left = 379
    Top = 96
    Width = 87
    Height = 16
    Caption = 'Tipo Unidad'
    FocusControl = DBEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RxSpeedButton1: TRxSpeedButton
    Tag = 3162
    Left = 121
    Top = 338
    Width = 91
    Height = 25
    Hint = 'Guardar venta y no imprimre recibo solo venta cash - F11'
    Caption = 'Guardar  Vta'
    Enabled = False
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
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
    Layout = blGlyphLeft
    NumGlyphs = 2
    Transparent = True
    Visible = False
    OnClick = RxSpeedButton1Click
  end
  object Label26: TLabel
    Left = 821
    Top = 337
    Width = 71
    Height = 13
    Caption = 'Ingredientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 288
    Top = 52
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
  end
  object Label28: TLabel
    Left = 736
    Top = 99
    Width = 21
    Height = 13
    Caption = 'Pcio'
  end
  object Shape1: TShape
    Left = 5
    Top = 24
    Width = 690
    Height = 4
    Brush.Color = 10932991
    Pen.Style = psClear
  end
  object DBText8: TDBText
    Left = 687
    Top = 409
    Width = 125
    Height = 22
    Alignment = taRightJustify
    Anchors = [akLeft]
    Color = clBtnFace
    DataField = 'MontoSubTotalIndirectos'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    Visible = False
  end
  object Label29: TLabel
    Left = 540
    Top = 400
    Width = 135
    Height = 20
    Caption = 'Sub-Total Indirecto'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object DBText9: TDBText
    Left = 396
    Top = 152
    Width = 65
    Height = 17
    DataField = 'PRECIOVENTA1'
    DataSource = DSQryPrecios
  end
  object DBText10: TDBText
    Left = 489
    Top = 152
    Width = 65
    Height = 17
    DataField = 'PRECIOVENTA2'
    DataSource = DSQryPrecios
  end
  object DBText11: TDBText
    Left = 575
    Top = 152
    Width = 65
    Height = 17
    DataField = 'PRECIOVENTA3'
    DataSource = DSQryPrecios
  end
  object DBText12: TDBText
    Left = 662
    Top = 152
    Width = 65
    Height = 17
    DataField = 'PRECIOVENTA4'
    DataSource = DSQryPrecios
  end
  object Label30: TLabel
    Left = 378
    Top = 152
    Width = 16
    Height = 13
    Caption = 'P1:'
    Color = 8454016
    ParentColor = False
  end
  object Label31: TLabel
    Left = 468
    Top = 152
    Width = 16
    Height = 13
    Caption = 'P2:'
    Color = 8454016
    ParentColor = False
  end
  object Label32: TLabel
    Left = 556
    Top = 152
    Width = 16
    Height = 13
    Caption = 'P3:'
    Color = 8454016
    ParentColor = False
  end
  object Label33: TLabel
    Left = 643
    Top = 152
    Width = 16
    Height = 13
    Caption = 'P4:'
    Color = 8454016
    ParentColor = False
  end
  object Label36: TLabel
    Left = 6
    Top = 0
    Width = 170
    Height = 20
    Caption = 'Modificando Factura:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label37: TLabel
    Left = 702
    Top = 2
    Width = 134
    Height = 13
    Caption = 'Exportar Factura  Excel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Visible = False
    OnClick = Label37Click
  end
  object Label38: TLabel
    Left = 702
    Top = 17
    Width = 146
    Height = 13
    AutoSize = False
    Caption = 'Exportar Cotizacion Excel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Visible = False
  end
  object Label39: TLabel
    Left = 274
    Top = 601
    Width = 53
    Height = 13
    Caption = 'Comentario'
    FocusControl = DBEdit7
  end
  object DBStatusLabel1: TDBStatusLabel
    Left = 872
    Top = 610
    Width = 57
    Height = 13
    DatasetName = 'Ttal'
    DataSource = dsTotales
    AutoSize = False
  end
  object lblFechaCotizacion: TLabel
    Left = 250
    Top = 103
    Width = 120
    Height = 16
    Caption = 'Fecha Cotizaci'#243'n'
    FocusControl = DBEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label40: TLabel
    Left = 776
    Top = 37
    Width = 58
    Height = 20
    Caption = 'Moneda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblTasa: TLabel
    Left = 776
    Top = 81
    Width = 71
    Height = 13
    AutoSize = False
    Caption = 'lblTasa'
    Visible = False
  end
  object Label41: TLabel
    Left = 584
    Top = 444
    Width = 94
    Height = 16
    Caption = 'Nota de Cr'#233'dito'
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label42: TLabel
    Left = 525
    Top = 551
    Width = 55
    Height = 13
    Caption = 'Referencia '
    FocusControl = DBEdit8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblStatusImpFiscal: TLabel
    Left = 332
    Top = 614
    Width = 185
    Height = 13
    Caption = 'IMPRESORA FISCAL NO RESPONDE'
    Visible = False
  end
  object Label43: TLabel
    Left = 518
    Top = 94
    Width = 51
    Height = 20
    Caption = '%Desc'
    FocusControl = DBEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBText16: TDBText
    Left = 688
    Top = 352
    Width = 125
    Height = 20
    Hint = 'DBText16'
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'MontoDescItems'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label44: TLabel
    Left = 564
    Top = 359
    Width = 110
    Height = 16
    Caption = 'Monto Desc. Items'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label46: TLabel
    Left = 632
    Top = 1
    Width = 36
    Height = 20
    Caption = 'NCF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbTextMontoExoneraITBIS: TDBText
    Left = 688
    Top = 403
    Width = 125
    Height = 22
    Hint = 'dbTextMontoExoneraITBIS'
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'MontoExoneraITBIS'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object Label47: TLabel
    Left = 592
    Top = 296
    Width = 30
    Height = 13
    Caption = 'Porc%'
  end
  object imbBarcode: TImage
    Left = 69
    Top = 95
    Width = 57
    Height = 17
    Hint = 'Entrada solo por codigo de barras'
    ParentShowHint = False
    Picture.Data = {
      07544269746D6170EE110000424DEE1100000000000036000000280000004700
      0000150000000100180000000000B81100000000000000000000000000000000
      0000FBFBFBFFFFFFDFDFDF2020209F9F9FAFAFAF020202000000656565C7C7C7
      303030969696A5A5A5030303000000636363F9F9F9FFFFFFC5C5C40C0B0BD9D9
      D9767676000000000000727272CECECE121212C3C3C366666600000000000052
      5252FEFEFEFFFFFFBCBCBC040404C5C5C55656568B8B8BC1C1C0000000000000
      252525CFCFCF3636368A8988A6A6A5252525C4C4C36665650000000606067C7C
      7CF2F2F1F4F3F2979696333434D5D3D02827279C9C9C9393931E1C1DD4D1CFF2
      F0EEE5E3E1E9E8E6E9E5E2E8E5E2E8E5E2E8E5E2E8E5E2000000FBFBFBFFFFFF
      E0E0E02020209F9F9FAFAFAF020202000000656565C7C7C7303030969696A5A5
      A5030303000000636363F9F9F9FFFFFFC4C4C30C0C0CD9D9D976767600000000
      0000727272CECECE121212C3C3C3666666000000000000525252FCFCFCFFFFFF
      BCBCBC040404C5C5C55656568C8C8CC0C1C1000000000000262626CFCFCF3535
      358B8A89A6A6A4252525C5C4C36666660000000A0A0A828282EFEFEEF6F2EF98
      9795323333D4D1CD2827269C9B9B9292921E1D1DD3D0CEF1F0F0E5E3E1E8E4E1
      E9E6E3E8E5E2E8E5E2E8E5E2E7E4E0000000FBFBFBFFFFFFE0E0E02020209F9F
      9FAFAFAF020202000000656565C7C7C7303030969696A5A5A503030300000063
      6363F9F9F9FFFFFFC4C4C30C0C0CD9D9D9767676000000000000727272CECECE
      121212C3C3C3666666000000000000525252FBFBFBFFFFFFBCBCBC040404C5C5
      C5565656878686C2C0BD000000000000232323CCCCCC3636368A8989A6A6A525
      2525C5C4C366666600000008080880807FF0EFEDF5F1EE989695333434D3D0CC
      2827259C9C9C9393931E1D1CD2D0CEF1EFEDE5E2E0E9E5E2E8E5E2E8E5E2E8E5
      E2E7E4E0E6E3DF000000FBFBFBFFFFFFDFDFDF2020209F9F9FAFAFAF02020200
      0000656565C7C7C7303030969696A5A5A5030303000000636363F9F9F9FFFFFF
      C5C5C40C0B0BD9D9D9767676000000000000727272CECECE121212C3C3C36666
      66000000000000525252FCFCFCFFFFFFBBBBBB030303C5C5C55656568B8B8BC1
      C1C0000000000000222222CBCBCB3737378B8A89A6A6A5252525C5C4C3666565
      0000000606067D7E7DF1F0EEF2F1F09796972F2F2FD3D0CC2827269C9B9B9290
      8D1E1D1DD3D1CEF0EEEBE4E1DEE8E6E3E7E4E1E9E6E3E7E4E0E6E3DFE1DDD800
      0000FBFBFBFFFFFFE0E0E02020209F9F9FAFAFAF020202000000656565C7C7C7
      303030969696A5A5A5030303000000636363F9F9F9FFFFFFC4C2C00C0C0CD9D9
      D9767676000000000000727272CECECE121212C3C3C366666600000000000052
      5252FCFCFCFFFFFFBCBCBC040404C4C4C4565656868685BFBCB8000000000000
      232323CCCCCC3636368B8A89A6A6A5252525C5C4C36666660000000707077E7F
      7EF0EFEEF3F0ED979795333334D3D0CC2827279C9A9A918F8C1E1E1ED3D0CDF1
      EFECE4E2DFE9E6E3E8E5E2E7E4E0E6E3DFE1DDD9DDD8D2000000FBFBFBFFFFFF
      E0E0E02020209F9F9FAFAFAF020202000000656565C7C7C7303030969696A5A5
      A5030303000000636363F9F9F9FFFFFFC3C1BF0C0D0DD9D9D976767600000000
      0000727272CECECE121212C3C3C3666666000000000000525252FBFBFCFFFFFF
      BBBBBB030303C5C5C5565656858584BEBBB7000000000000232323CCCCCC3737
      378B8A89A6A6A5252525C5C4C36666660000000606067F7F7EF1F0EEF3F0EC96
      9694333334D3D0CC2827269C9B9B92908D1E1D1DD3D1CEF0EEEBE5E2DFE8E5E2
      E7E4E0E6E3DFE1DDD9DDD8D2DCD7D2000000FBFBFBFFFFFFDFDFDF2020209F9F
      9FAFAFAF020202000000656565C7C7C7303030969696A5A5A503030300000063
      6363F9F9F9FFFFFFC4C2C00C0C0CD9D9D9767676000000000000727272CECECE
      121212C3C3C3666666000000000000525252FCFCFCFFFFFFB7B7B7030202C6C6
      C6565656868685BFBCB8000000000000232323CCCCCC3737378A8988A5A5A425
      2525C5C4C36666660000000707077E7E7DF0EFEDF4F1ED9392912C2D2DD2CFCB
      2827279C9B9B92908D1D1D1ED2D0CDF0EEEBE5E1DEE6E3E0E6E3DFE1DCD8DDD8
      D2DBD6D2D8D3CE000000FBFBFBFFFFFFE0E0E02020209F9F9FAFAFAF02020200
      0000656565C7C7C7303030969696A5A5A5030303000000636363F9F9F9FFFFFF
      C4C2C00C0D0DD9D9D9767676000000000000727272CDCDCD111111C2C2C26666
      66000000000000525252FDFDFCFFFFFFB6B5B5040303C5C5C5565656858585BE
      BBB7000000000000232323CBCBCB3636368B8A89A6A6A5252525C4C3C2656565
      0000000808087C7C7CEDECECF4F1ED9493922D2E2ED3D0CC2727279B9A9A928F
      8C1E1D1DD3D1CEF2F0EEE5E2DEE7E4E1E3DFDADFDBD5DDD8D4DAD5D0D1CAC300
      0000FBFBFBFFFFFFE0E0E02020209F9F9FAFAFAF020202000000656565C7C7C7
      303030969696A5A5A5030303000000636363F9F9F9FFFFFFC3C1BF0C0D0DD9D9
      D9767676000000000000727171CECECE121212C3C3C366666600000000000051
      5151FCFCFBFFFEFEB7B6B6030303C6C6C6565656868685C0BCB8000000000000
      222222CCCCCC3737378A8886A5A5A4252525C5C3C26666660000000707077D7D
      7DECEBEAF3F0EC9493922D2E2ED1CECA2827279B9A9A92918F212221D3D0CEEB
      E8E4DEDBD5DCD8D3D9D3CDD5CFC9D4CEC8CBC3BBC6BDB3000000FBFBFBFFFFFF
      DFDFDF2020209F9F9FAFAFAF020202000000656565C7C7C7303030969696A5A5
      A5030303000000636363F9F9F9FFFFFFC4C2C00B0D0DD9D9D976767600000000
      0000727272CDCCCB111111C0BFBF666666000000000000525252FDFDFCFFFFFF
      B6B5B5040303C6C5C5565656858585B9B8B6000000000000232323CAC9C93535
      36898682A4A4A3252525C4C3C36363630000000808087C7D7DEDECEBF4F1ED94
      93922D2E2ECDCAC62726269C9C9C938D880F0908B0A9A2CEC5BCC6BEB6C6BEB4
      C5BBB1C2B6ACBDB3A8B8ADA2B2A699000000FBFBFBFFFFFFE0E0E02020209F9F
      9FAFAFAF020202000000656565C7C7C7303030969696A5A5A503030300000063
      6363F9F9F9FFFFFFC2C0BE0C0C0CD8D8D8757575000000000000727373CCCAC7
      10100FBCBBBB666666000000000000515150F9F9F8FFFEFDB7B6B6030302C5C6
      C6565656858585BAB8B6000000000000242424C7C6C63333338A8784A5A5A425
      2525C2C0BE6060600000000808087D7D7DEDECEBF3F0EC9392912D2E2DCECAC7
      292A2B8B837C998D815E5651D6D1CDEAE6E3E9E6E4EAE8E5EBE7E3ECE7E4E9E5
      E2E8E5E1E4E0DD000000FBFBFBFFFFFFE0E0E02020209F9F9FAFAFAF02020200
      0000656565C7C7C7303030969696A5A5A5030303000000636363F9F9F9FFFFFF
      C1BFBD0D0D0DD9D9D9767676000000000000727272CDCBC8111110BDBCBC6666
      6600000000000050504FF6F6F4FFFDFCB8B7B7020303C6C5C2565656868685BF
      BCB8000000000000232323C8C7C7343434898683A5A5A4252525C1BEBB616161
      0000000808087C7C7CECEBEAF4F1ED9493922C2D2ECECAC53029207F766CDCD6
      D1EEEFEDFFFFFFF7F6F5F3F2F1F4F3F1F5F4F3F3F2F1F3F2F0F3F2F0F5F4F200
      0000FBFBFBFFFFFFDFDFDF2020209F9F9FAFAFAF020202000000656565C7C7C7
      303030969696A5A5A5030303000000636363F9F9F9FFFFFFC2C0BE0C0B0BD4D2
      D1737272000000000000727373CDCBC8111110BDBCBC66666600000000000051
      5150F7F7F5FEFEFDB7B6B6030304C7C4C0565555868685BFBCB8000000000000
      242424C8C7C73434348A8784A5A5A4252525C2BFBC6161610000000808077D7D
      7DEEEDECF0EDE992918F2E2E2FC0B9B2594E3FC6C6C4FFFFFFF6F4F3E9E6E3E6
      E3DEE3E0DCE4E1DDE1DDD9DFDBD6DFDBD7E0DCD7DDD8D4000000FBFBFBFFFFFF
      E0E0E01F1F1F9E9E9EAEAEAE020202000000646464C7C7C72F2F2F959595A4A4
      A4020202000000626262F8F8F8FFFFFFC1C1BF0B0A0AD2D0CE72717100000000
      0000717272CCCAC7101010BDBCBB656565000000000000515150F6F7F4FFFEFD
      B8B7B7020203C6C6C5555656858584B7B6B6000000000000232323C7C6C63434
      34898683A4A4A3242424C1BEBB616161000000070708797979EAE9E8F0ECE991
      8F8E2F3031ADA49BCBC4BCFDFFFFF1EFEDE6E3E0E8E4E1E7E4E1E6E3DFE7E4E0
      E2DEDAE0DCD9E2DEDAE0DCD8E6E4E0000000FBFBFBFFFFFFE0E0E02020209F9F
      9FAFAFAF020202000000656565C7C7C7303030969696A5A5A503030300000063
      6363F9F9F9FFFFFFC2C0BE0D0D0ED6D5D5727171000000000000727373CDCBC8
      111110BDBCBC666666000000000000515150F7F6F4FEFDFCB8B7B7040404C3BF
      BD565555858585B5B5B6000000000000242424C8C7C73434348A8784A5A5A426
      2626C2BFBC616161000000080809797979E9E8E7F1EDE99291902D2826B9AFA6
      FFFFFFF6F5F4EEEBE9E7E4E1E9E6E3E6E3E1E6E3DFE7E4E0E3DFDBE1DDD9E0DC
      D8E6E4E0FFFFFF000000FAFAFAFEFEFEE0E0E01B1B1B9C9C9CAEAEAE00000000
      0000626262C6C6C62D2D2D939393A3A3A3000000000000616161F8F8F8FEFEFE
      C0BEBC09090AD6D5D56F6E6E0000000000006F7070CBC9C60D0D0CBCBBBB6363
      630000000000004E4E4DF8F7F6FBFAF9B4B3B2000001C2BEBA535252838383B5
      B5B5000000000000202021C7C6C6313131888582A3A3A2202020C0BDBB5F5F5F
      000000040405767777EAE9E8F1EDE9919191231A0ECFC9C3FFFFFFF1EFEDEFED
      EAE8E5E2E8E5E2E7E4E1E6E3DFE6E3DFE2DEDAE0DCD8E7E5E1FFFFFFBCBCBC00
      0000FBFBFBFFFFFFE2E2E22020209B9A9AAFAEAD0A0A0A060606616161C9C8C8
      30302F919191A1A0A00606060606065F5F5FF7F8F8FFFFFFBEBEBE141413D2D1
      CF78777704040406060673716FC3C2C1191919BDBDBC65656607070706060658
      5756F8F6F5FBFBFAAFAEAE0A0A0AC5C1BE535352828281B9B9B8060606070707
      242425C4C3C33C3C3B848485A2A1A1181819B9B9B96262620505050C0C0C7878
      77EAE9E6F0ECE98E8C8C281F14DFDCD8FEFEFEEFEDEBEFEDEAE8E5E2E9E6E3E6
      E3E1E5E2DEE7E4E0E1DDD9E6E4E0FFFFFFC4C4C42A2A2A000000FCFCFCFEFEFE
      F2F2F2AAAAAADBDBDBDAD8D59A9A99959596BBBBBBE6E5E5A4A3A3D6D5D4D4D4
      D3979797959596B5B5B5F9FAFAFDFDFDE5E4E3A2A3A4E6E6E6CACACA90909094
      9495C5C3C0E2E2E1A6A6A7DCDBDBBDBDBC969695949594BFBDBBF6F4F1F8F8F7
      D3D2D2989999E1DFDDADADADC1C1C0DEDBD7908F909393939D9C9CDDDCDCA9A9
      A8C3C3C3CFCDCD9D9C9CD9D9D7AEACAA8B8B8A929192BFBDBAE8E4E0E8E5E1BD
      B9B68C8279EAE8E6FDFDFCF0EEECEFECEAE8E5E2E9E6E3E7E4E0E6E3DFE5E2DE
      E9E7E3FFFFFFBDBDBD202020000000000000FEFEFEFCFCFCFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFAFAF9F9F9F8FDFDFDFFFFFFFAFAF8FFFFFEFFFFFFFFFFFFFFFFFEFBFBFA
      FFFFFFF8F7F6FFFFFEFFFFFFFFFFFFFDFCFBF3F2F1F3F2F0F8F6F5FFFDFCF4F2
      F0FBFAF8F8F7F6F4F2F1FFFEFCFFFDFCFCFBF9F1EFEDF9F7F5F4F1EFF1F0EEF8
      F6F3F0EEEBF5F3F0F8F6F3F9F6F4F0EDEAE5E3DFE5E3DEE3DFD9CBC2B9F0EEEC
      FBFBFAF1EFEDEFEDEAE8E5E2E8E5E2E8E5E1E5E1DDE7E5E2FBFCFBC9C9C91818
      18000000000000000000FDFDFDFDFDFDFCFCFCF7F7F7FBFBFBF9F9F7F5F5F4F6
      F6F5F8F8F7F9F9F8F7F7F6F9F9F8F9F9F8F6F6F5F6F6F5F7F7F6FAFAF9FBFBFA
      F6F6F5F1EFEEF4F3F2F3F2F1F0EFEEF1F0EFF2F1F0F4F3F2F1F0EFF3F2F1F1F0
      EFF0EFEEEEECEAF0EEECF3F1F0F2F0EEF1EFEDEFEDEBF0EEECECEAE8EEECEAF0
      EDEBECEAE8EBE9E7EDEBE9EAEAEAE8E8E8E7E5E1E6E4E3E4E1DEE6E3E0E5E2DF
      E3E0DDE4E1DDE4E1DEE5E2DEE3E0DCD6D1CCBAAFA4EEECEAFCFCFBF0EEECEFED
      EAE7E4E2E9E6E3E6E3DFE5E2E0FFFFFFBEBEBE2828280101010000003C3C3C00
      0000FCFCFCFEFEFEFAFAFAFCFCFCFEFEFEFBFBFAFAFAF9FBFBFAFBFBFAFBFBFA
      FBFBFAFBFBFAFBFBFAFBFBFAFAFAF9FAFAF9FBFBFAF7F7F6F4F3F2F6F5F4F6F5
      F4F6F5F4F6F5F4F6F5F4F5F4F3F6F5F4F5F4F3F4F3F2F3F2F1F4F2F0F4F3F2F1
      EFEDF3F1EEF3F1EFF1EFEDF1EFEDF1EFEDF0EEECF1EFEDF1EFEDF1EFEDEFEDEC
      F1EFEDECEAE7E8E8E8E9E7E4E7E4E1E9E6E3E8E5E2E8E5E2E8E5E3E7E4E0E6E3
      DFE1DDD9DFD9D5DAD5CFB8ADA1EEECE9FBFCFBF0EEECEFEDEAE8E5E2E6E3E0E6
      E4E0FFFFFFBFBFBF2929280000000000003E3E3ED9D9D8000000}
    ShowHint = True
  end
  object lblRNC: TLabel
    Left = 66
    Top = 83
    Width = 127
    Height = 11
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label48: TLabel
    Left = 440
    Top = 94
    Width = 68
    Height = 20
    Caption = 'CantPax'
    FocusControl = DBEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ProductName: TLabel
    Left = 304
    Top = 8
    Width = 84
    Height = 13
    Caption = 'PointSalesSoft'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    IsControl = True
  end
  object Version: TLabel
    Left = 408
    Top = 8
    Width = 65
    Height = 13
    Caption = 'Version 4.0'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    IsControl = True
  end
  object DBStatusLabel2: TDBStatusLabel
    Left = 818
    Top = 611
    Width = 48
    Height = 12
    DatasetName = 'Det'
    DataSource = DataSource1
    AutoSize = False
  end
  object DBText15: TDBText
    Left = 688
    Top = 438
    Width = 125
    Height = 21
    Hint = 'DBText15'
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'MontoNCRAplicado'
    DataSource = dsTotales
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object lblTotalItem: TLabel
    Left = 820
    Top = 326
    Width = 71
    Height = 13
    Caption = 'Ingredientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label51: TLabel
    Left = 584
    Top = 80
    Width = 11
    Height = 13
    Caption = 'Ini'
    Visible = False
  end
  object Label52: TLabel
    Left = 678
    Top = 78
    Width = 14
    Height = 13
    Caption = 'Fin'
    Visible = False
  end
  object Label53: TLabel
    Left = 734
    Top = 78
    Width = 20
    Height = 13
    Caption = 'total'
    Visible = False
  end
  object Label54: TLabel
    Left = 0
    Top = 122
    Width = 4
    Height = 13
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label55: TLabel
    Left = 332
    Top = 551
    Width = 82
    Height = 13
    Caption = 'Codigo Vendedor'
    FocusControl = DBEdit8
  end
  object lblAvisoCte: TLabel
    Left = 856
    Top = 36
    Width = 83
    Height = 13
    AutoSize = False
    Caption = 'Cte Tiene +VTAS'
    Visible = False
  end
  object Label59: TLabel
    Left = 9
    Top = 290
    Width = 38
    Height = 13
    Caption = 'Label59'
  end
  object Label60: TLabel
    Left = 689
    Top = 545
    Width = 3
    Height = 13
  end
  object Label65: TLabel
    Left = 8
    Top = 514
    Width = 43
    Height = 13
    Caption = 'Cant <=0'
    Color = 12446953
    ParentColor = False
  end
  object Label66: TLabel
    Left = 57
    Top = 514
    Width = 46
    Height = 13
    Caption = 'Cant <= 5'
    Color = clYellow
    ParentColor = False
  end
  object Label67: TLabel
    Left = 109
    Top = 514
    Width = 75
    Height = 13
    Caption = 'Precio < Minimo'
    Color = clRed
    ParentColor = False
  end
  object Label68: TLabel
    Left = 189
    Top = 514
    Width = 39
    Height = 13
    Caption = 'Vencido'
    Color = clPurple
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object rxdbgridTestTipofiscal: TRxDBGrid
    Left = 528
    Top = 183
    Width = 369
    Height = 96
    Color = clBtnFace
    DataSource = dmFactura.dsibQryViewNCF
    TabOrder = 51
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIV_NEGOCIO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PECF'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AICF'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_CF'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCF'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_NCF_IFISCAL'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_NCFNCR'
        Width = 64
        Visible = True
      end>
  end
  object CheckBox2: TCheckBox
    Left = 217
    Top = 342
    Width = 73
    Height = 18
    Hint = 'Aplica % Imprevisto'
    Caption = 'Imprevisto'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 28
    Visible = False
    OnClick = CheckBox2Exit
    OnExit = CheckBox2Exit
  end
  object DBEdit4: TDBEdit
    Left = 855
    Top = 43
    Width = 86
    Height = 21
    Color = clSilver
    DataField = 'MontoDescAdicional'
    DataSource = dsTotales
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    Visible = False
  end
  object DBEdit5: TDBEdit
    Left = 856
    Top = 19
    Width = 85
    Height = 21
    AutoSize = False
    DataField = 'PorcDesAdicional'
    DataSource = dsTotales
    TabOrder = 17
    Visible = False
    OnChange = BitBtn10Click
    OnEnter = DBEdit5Enter
  end
  object RxDBGrid3: TRxDBGrid
    Left = 7
    Top = 179
    Width = 529
    Height = 98
    Hint = 'Doble click para cerrar'
    DataSource = dsqryVence
    ParentShowHint = False
    ShowHint = True
    TabOrder = 26
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnDblClick = RxDBGrid3DblClick
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOTE_NUM'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION_PRODUCTO'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIASVENCIDOS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_PROV'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT_IN'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT_OUT'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_PROVEEDOR'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_VENCIMIENTO'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_TEXTO'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIASPORVENCER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Width = 47
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 641
    Width = 952
    Height = 49
    Align = alBottom
    TabOrder = 9
    object BitBtn1: TBitBtn
      Tag = 3001
      Left = 247
      Top = 7
      Width = 103
      Height = 37
      BiDiMode = bdLeftToRight
      Caption = '&NUEVO F2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
      OnEnter = BitBtn1Enter
      OnExit = BitBtn1Exit
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
    end
    object BitBtn3: TBitBtn
      Tag = 3002
      Left = 354
      Top = 7
      Width = 133
      Height = 37
      Hint = 'Cancelar Venta'
      Caption = '&CANCELAR F4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
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
      Tag = 3005
      Left = 612
      Top = 7
      Width = 144
      Height = 37
      Caption = '&PROCESAR F5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn4Click
      OnExit = BitBtn4Exit
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
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
    object BitBtn5: TBitBtn
      Tag = 3003
      Left = 493
      Top = 7
      Width = 113
      Height = 37
      Caption = '&BORRAR F9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn5Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
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
    object chkImprimeTicket: TCheckBox
      Left = 768
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Imprimir Ticket'
      TabOrder = 4
    end
  end
  object DBEdit1: TDBEdit
    Left = 581
    Top = 117
    Width = 55
    Height = 28
    DataField = 'Cant'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnChange = DBEdit1Change
    OnEnter = DBEdit1Enter
    OnExit = DBEdit1Exit
  end
  object DBEdit2: TDBEdit
    Left = 638
    Top = 117
    Width = 96
    Height = 28
    DataField = 'Precio'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    OnChange = DBEdit2Change
    OnEnter = DBEdit2Enter
    OnExit = DBEdit2Exit
    OnKeyDown = FormKeyDown
  end
  object RxDBGrid1: TRxDBGrid
    Left = 9
    Top = 177
    Width = 928
    Height = 110
    DataSource = DataSource1
    PopupMenu = PopupMenu2
    ReadOnly = True
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = RxDBGrid1Enter
    OnExit = RxDBGrid1Exit
    RowColor2 = 16776176
    OnGetCellParams = RxDBGrid1GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'Serie'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodArticulo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Moneda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cant'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descripcion'
        ReadOnly = False
        Width = 198
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Referencia'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Precio'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoBruto'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PorcDescItem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoDescItem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PorcTasaItbisCld'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Itbi'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoNeto'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TipoUnidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fecha'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MonedaBase'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'porc_desc'
        Title.Caption = '%DescTranspItbis'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoDescuento'
        Title.Caption = 'TranspItbis'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoItbisRecargo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoDesGlobal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDTasaITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'loteNum'
        Title.Caption = 'LotNum'
        Visible = True
      end>
  end
  object DBEdit3: TDBEdit
    Left = 787
    Top = 117
    Width = 121
    Height = 28
    DataField = 'MontoBruto'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 11
    OnExit = DBEdit3Exit
  end
  object Edit1: TEdit
    Left = 688
    Top = 465
    Width = 125
    Height = 24
    Hint = 'Entre monto dinero entragado,para calcular devolucion'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
  end
  object edtCodigoNotEnUso: TEditN
    Left = 8
    Top = 115
    Width = 121
    Height = 32
    CharCase = ecUpperCase
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
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
    ValueDate = 39484.000000000000000000
    ValueTime = 0.974691932870370400
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object CheckBox1: TCheckBox
    Left = 700
    Top = 545
    Width = 115
    Height = 15
    Caption = 'Asi&gnar NCF -F6'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 13
    OnClick = CheckBox1Click
  end
  object BitBtn6: TBitBtn
    Left = 822
    Top = 442
    Width = 112
    Height = 29
    Caption = '&Consultar'
    TabOrder = 14
    OnClick = BitBtn6Click
    OnMouseMove = BitBtn6MouseMove
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF03337F33F333F3337F330FF0FFF0FFF
      F03337F37F337F3337F330FF0FFF0FFFF03337F37FFF7FFF37F330F00000000F
      F03337F77777777337F330FFF0FFF0FFF03337F337F337F337F330FFF0FFF0FF
      F03337F337FFF7FFF7F330FF00000000F03337F37777777737F330FFFF0FFF0F
      F03337F3337F337F37F330FFFF0FFF0FF03337F33373337337F330FFFFFFFFFF
      F03337F33333333FF7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
      F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
      333337FFFFFFFF77333330000000000333333777777777733333}
    NumGlyphs = 2
  end
  object Panel2: TPanel
    Left = 6
    Top = 177
    Width = 929
    Height = 110
    Caption = 'Panel2'
    TabOrder = 15
    Visible = False
    object RxDBGrid2: TRxDBGrid
      Left = 1
      Top = 1
      Width = 927
      Height = 108
      Cursor = crHandPoint
      Hint = 'Doble click asigna codigo'
      Align = alClient
      Color = 16773360
      DataSource = DataSource2
      FixedColor = 10866630
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = RxDBGrid2DblClick
      OnEnter = RxDBGrid2Enter
      OnExit = RxDBGrid2Exit
      OnKeyDown = RxDBGrid2KeyDown
      OnKeyPress = RxDBGrid2KeyPress
      RowColor2 = 16776176
      TitleButtons = True
      OnGetCellParams = RxDBGrid2GetCellParams
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_TEXTO'
          Title.Caption = 'CodigoTexto'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_BARRA'
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_MINIMO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Title.Caption = 'Descripcion'
          Width = 193
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REFERENCIA'
          Title.Caption = 'Referencia'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_VENCIMIENTO'
          Title.Caption = 'Fecha Vence'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOTE_NUM'
          Title.Caption = 'LotNum'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTLOT'
          Title.Caption = 'CantLot'
          Width = 50
          Visible = True
        end>
    end
  end
  object BitBtn10: TBitBtn
    Left = 818
    Top = 390
    Width = 35
    Height = 15
    Hint = 'Aplica descuento adicional'
    Caption = 'Ap&lica'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
    OnClick = BitBtn10Click
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 64
    Top = 55
    Width = 221
    Height = 27
    DropDownCount = 10
    DropDownWidth = 700
    DataField = 'CodigoPropietario'
    DataSource = dstablaPropietario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LookupField = 'CODIGO_CTE'
    LookupDisplay = 'NOMBRECLIENTE'
    LookupSource = dsqryCliente
    ParentFont = False
    TabOrder = 1
    OnChange = RxDBLookupCombo1Change
    OnEnter = RxDBLookupCombo1Enter
    OnExit = RxDBLookupCombo1Exit
  end
  object DBEdit6: TDBEdit
    Left = 8
    Top = 55
    Width = 55
    Height = 28
    DataField = 'CodigoPropietario'
    DataSource = dstablaPropietario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 19
    OnDblClick = DBEdit6DblClick
    OnExit = RxDBLookupCombo1Exit
  end
  object edtReferencia: TEditN
    Left = 325
    Top = 59
    Width = 136
    Height = 21
    Color = clSilver
    TabOrder = 20
    OnChange = edtReferenciaChange
    OnExit = edtReferenciaExit
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
    ValueDate = 39773.000000000000000000
    ValueTime = 0.999322777777777800
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object BitBtn14: TBitBtn
    Tag = 3426
    Left = 696
    Top = 93
    Width = 15
    Height = 20
    Hint = 'Cambiar precio'
    TabOrder = 21
    OnClick = BitBtn14Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
      7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
      777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
      79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
      7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
      777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
      79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
      CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
    NumGlyphs = 2
  end
  object edtObservacion: TEdit
    Left = 510
    Top = 57
    Width = 259
    Height = 21
    TabOrder = 22
    OnDblClick = edtObservacionDblClick
  end
  object chkExento: TCheckBox
    Left = 586
    Top = 409
    Width = 55
    Height = 14
    Caption = 'E&xento'
    Color = 33023
    ParentColor = False
    TabOrder = 23
    Visible = False
    OnClick = chkExentoExit
    OnEnter = chkExentoEnter
    OnExit = chkExentoExit
  end
  object chkDisplay: TCheckBox
    Left = 858
    Top = 388
    Width = 73
    Height = 17
    Caption = 'Display'
    TabOrder = 24
  end
  object SecretPanel1: TSecretPanel
    Left = 9
    Top = 380
    Width = 392
    Height = 125
    Hint = 'Doble click para ver mas detalles'
    Alignment = taLeftJustify
    TextStyle = bvLowered
    BorderStyle = bsSingle
    Color = 10932991
    ParentShowHint = False
    ShowHint = True
    TabOrder = 25
    Visible = False
    OnDblClick = SecretPanel1DblClick
  end
  object cboxTipoUnidad: TComboBox
    Left = 379
    Top = 119
    Width = 126
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 7
    Text = 'UNIDAD'
    OnChange = cboxTipoUnidadChange
    OnEnter = cboxTipoUnidadEnter
    OnExit = cboxTipoUnidadExit
  end
  object BitBtn17: TBitBtn
    Left = 822
    Top = 473
    Width = 112
    Height = 29
    Caption = '&Preventa'
    TabOrder = 27
    Visible = False
    OnClick = BitBtn17Click
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
  object CheckBox3: TCheckBox
    Left = 297
    Top = 342
    Width = 89
    Height = 19
    Caption = 'Gastos Admin'
    TabOrder = 29
    Visible = False
    OnClick = CheckBox3Exit
    OnExit = CheckBox3Exit
  end
  object panelDescripcionServ: TPanel
    Left = 12
    Top = 384
    Width = 385
    Height = 117
    TabOrder = 30
    object Label27: TLabel
      Left = 1
      Top = 1
      Width = 383
      Height = 13
      Align = alTop
      Caption = 'Descripcion Servicio'
      Color = 8454143
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object DBMemo1: TDBMemo
      Left = 1
      Top = 14
      Width = 383
      Height = 102
      Align = alClient
      DataField = 'DescripcionEspecial'
      DataSource = DataSource1
      ScrollBars = ssVertical
      TabOrder = 0
      OnExit = DBMemo1Exit
    end
  end
  object RxSpinEdit1: TRxSpinEdit
    Left = 736
    Top = 118
    Width = 47
    Height = 21
    Hint = 'Indique nivel de precio'
    MaxValue = 4.000000000000000000
    MinValue = 1.000000000000000000
    Value = 1.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 31
    OnChange = RxSpinEdit1Change
    OnExit = RxSpinEdit1Exit
  end
  object pnlPrecioProv: TPanel
    Left = 8
    Top = 144
    Width = 367
    Height = 29
    BevelOuter = bvNone
    TabOrder = 32
    Visible = False
    object DBText13: TDBText
      Left = 104
      Top = 8
      Width = 140
      Height = 13
      DataField = 'NOMBREPROVEEDOR'
      DataSource = dsqryProdPorProveedor
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label34: TLabel
      Left = 40
      Top = 8
      Width = 63
      Height = 13
      Caption = 'Proveedor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label35: TLabel
      Left = 256
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Costo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText14: TDBText
      Left = 296
      Top = 8
      Width = 140
      Height = 13
      DataField = 'PRECIO'
      DataSource = dsqryProdPorProveedor
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BitBtn20: TBitBtn
      Tag = 3157
      Left = 3
      Top = 3
      Width = 33
      Height = 23
      Hint = 'Ver todos los proveedores del producto'
      Caption = 'Ver'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object DBEdit7: TDBEdit
    Left = 331
    Top = 594
    Width = 393
    Height = 21
    DataField = 'Comentario'
    DataSource = dsTotales
    TabOrder = 33
    OnExit = DBEdit7Exit
  end
  object BitBtn21: TBitBtn
    Left = 725
    Top = 592
    Width = 33
    Height = 25
    Caption = 'Add'
    TabOrder = 34
    OnClick = BitBtn21Click
  end
  object dbFechaCotizacion: TDBDateEdit
    Left = 248
    Top = 120
    Width = 121
    Height = 21
    DataField = 'FechaCotizacion'
    DataSource = dsTotales
    NumGlyphs = 2
    TabOrder = 35
    Visible = False
    OnClick = dbFechaCotizacionClick
    OnEnter = dbFechaCotizacionEnter
    OnExit = dbFechaCotizacionExit
  end
  object BitBtn24: TBitBtn
    Tag = 3019
    Left = 896
    Top = 150
    Width = 40
    Height = 25
    Caption = 'Im&g'
    TabOrder = 36
  end
  object RxDBLookupCombo2: TRxDBLookupCombo
    Left = 776
    Top = 56
    Width = 71
    Height = 21
    DropDownCount = 8
    DataField = 'Moneda'
    DataSource = dsTotales
    LookupField = 'CODIGO'
    LookupDisplay = 'DESCRIPCION'
    LookupSource = dstblMoneda
    TabOrder = 10
    OnChange = RxDBLookupCombo2Change
    OnClick = RxDBLookupCombo2Click
    OnEnter = RxDBLookupCombo2Enter
    OnExit = RxDBLookupCombo2Exit
  end
  object CheckBox4: TCheckBox
    Left = 560
    Top = 445
    Width = 19
    Height = 17
    Hint = 'Activa y desctiva monto nota de credito'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 37
    Visible = False
    OnClick = CheckBox4Click
  end
  object BitBtn26: TBitBtn
    Tag = 3017
    Left = 819
    Top = 295
    Width = 70
    Height = 24
    Caption = 'Editar'
    TabOrder = 39
    OnClick = BitBtn26Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
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
  object DBEdit8: TDBEdit
    Left = 524
    Top = 568
    Width = 98
    Height = 21
    DataField = 'ReferenciaCte'
    DataSource = dsTotales
    TabOrder = 40
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 5
    Top = 304
    Width = 572
    Height = 33
    Caption = 'Tipo Operacion'
    Columns = 6
    DataField = 'TipoVenta'
    DataSource = DataSource1
    Items.Strings = (
      #205'tm venta'
      'Anular '#237'tem '
      'Desc '#237'tem'
      'Recargo '#237'tem'
      #205'tem retorno'
      'Anular '#237'tem Retorno')
    TabOrder = 41
    Values.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4'
      '5')
    OnEnter = DBRadioGroup1Enter
    OnExit = DBRadioGroup1Exit
  end
  object Button1: TButton
    Left = 409
    Top = 449
    Width = 89
    Height = 25
    Caption = 'Test Imp Fiscal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 42
    Visible = False
  end
  object DBEdit9: TDBEdit
    Left = 517
    Top = 117
    Width = 55
    Height = 28
    DataField = 'PorcDescItem'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnChange = DBEdit9Change
  end
  object Panel3: TPanel
    Left = 405
    Top = 380
    Width = 89
    Height = 49
    Anchors = [akLeft]
    BevelOuter = bvNone
    TabOrder = 43
    Visible = False
    DesignSize = (
      89
      49)
    object Label45: TLabel
      Left = 43
      Top = 25
      Width = 32
      Height = 13
      Anchors = [akLeft]
      Caption = 'Copias'
    end
    object rxspinImpCantCopias: TRxSpinEdit
      Left = 3
      Top = 20
      Width = 38
      Height = 21
      MaxValue = 2.000000000000000000
      TabOrder = 0
    end
    object chboxSelTipoNCF: TCheckBox
      Left = 3
      Top = 2
      Width = 81
      Height = 17
      Caption = 'Sel TNCF'
      TabOrder = 1
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 690
    Width = 952
    Height = 21
    Anchors = [akLeft, akRight]
    Color = 11004329
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 150
      end
      item
        Width = 150
      end>
    OnClick = StatusBarClick
  end
  object DBEdit10: TDBEdit
    Left = 688
    Top = 332
    Width = 125
    Height = 21
    DataField = 'Recargo'
    DataSource = dsTotales
    TabOrder = 44
    OnChange = DBEdit10Change
    OnEnter = DBEdit10Enter
    OnExit = DBEdit10Exit
  end
  object RxDBLookupCombo3: TRxDBLookupCombo
    Left = 672
    Top = 2
    Width = 268
    Height = 20
    DropDownCount = 8
    DataField = 'TipoNCF'
    DataSource = dsTotales
    LookupField = 'TIPO_CF'
    LookupDisplay = 'DESCRIPCION'
    LookupSource = dmFactura.dsibQryViewNCF
    PopupMenu = PopupMenu3
    TabOrder = 45
    OnChange = RxDBLookupCombo3Change
    OnExit = RxDBLookupCombo3Exit
  end
  object chKDescuentoGlobal: TCheckBox
    Left = 686
    Top = 291
    Width = 109
    Height = 16
    Caption = 'Descuento Global'
    TabOrder = 46
    OnClick = chKDescuentoGlobalClick
  end
  object DBEdit11: TDBEdit
    Left = 627
    Top = 288
    Width = 57
    Height = 21
    DataField = 'PorcDesAdicional'
    DataSource = dsTotales
    TabOrder = 47
    OnChange = DBEdit11Change
    OnEnter = DBEdit11Enter
    OnExit = DBEdit11Exit
  end
  object BitBtn27: TBitBtn
    Tag = 3018
    Left = 890
    Top = 295
    Width = 46
    Height = 24
    Caption = 'C'#225'lculos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 48
    OnClick = BitBtn27Click
  end
  object BitBtn28: TBitBtn
    Tag = 3020
    Left = 896
    Top = 81
    Width = 40
    Height = 23
    Caption = 'Show'
    TabOrder = 49
  end
  object DBEdit12: TDBEdit
    Left = 448
    Top = 117
    Width = 61
    Height = 28
    DataField = 'PorcDescItem'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 52
    OnChange = DBEdit12Change
  end
  object panelFastFood: TPanel
    Left = 688
    Top = 430
    Width = 123
    Height = 28
    BevelOuter = bvNone
    TabOrder = 53
    Visible = False
    object DBText17: TDBText
      Left = 0
      Top = 12
      Width = 63
      Height = 14
      Alignment = taRightJustify
      Color = clBlack
      DataField = 'PropinaLegal'
      DataSource = dsTotales
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label49: TLabel
      Left = 5
      Top = -2
      Width = 28
      Height = 13
      Caption = '% Ley'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label50: TLabel
      Left = 74
      Top = -1
      Width = 36
      Height = 13
      Caption = 'Propina'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DBEdit13: TDBEdit
      Left = 73
      Top = 11
      Width = 46
      Height = 21
      DataField = 'Propina'
      DataSource = dsTotales
      TabOrder = 0
      OnExit = DBEdit11Exit
    end
    object chkNoLeyPropina: TCheckBox
      Left = 36
      Top = -1
      Width = 33
      Height = 12
      Hint = 'No incluye propina legal'
      Caption = 'No'
      Color = clBtnFace
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = chkNoLeyPropinaClick
      OnExit = chkNoLeyPropinaExit
    end
  end
  object rxdblookupTipoUnidad: TRxDBLookupCombo
    Left = 379
    Top = 119
    Width = 126
    Height = 24
    DropDownCount = 8
    DataField = 'TipoUnidad'
    DataSource = DataSource1
    LookupField = 'IDUNIDAD'
    LookupDisplay = 'DESCRIPCION'
    LookupSource = dsqryPrecioUnidadSurt
    TabOrder = 2
    OnChange = rxdblookupTipoUnidadChange
    OnEnter = rxdblookupTipoUnidadEnter
    OnExit = rxdblookupTipoUnidadExit
  end
  object ProgressBar1: TProgressBar
    Left = 141
    Top = 572
    Width = 181
    Height = 17
    Step = 1
    TabOrder = 54
    Visible = False
  end
  object BitBtn30: TBitBtn
    Left = 469
    Top = 54
    Width = 32
    Height = 25
    Hint = 'Consulta General'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 55
    OnClick = ConsultaGeneral1Click
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
  object BitBtn32: TBitBtn
    Left = 207
    Top = 36
    Width = 75
    Height = 17
    Hint = 
      'Indica que hay records de venta que no se estan procesando verif' +
      'ique.  Haga clic aqui.'
    Caption = 'VER VENTA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 56
    Visible = False
    OnClick = BitBtn32Click
  end
  object edtCodigo: TEdit
    Left = 8
    Top = 114
    Width = 121
    Height = 32
    CharCase = ecUpperCase
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = edtCodigoChange
    OnDblClick = edtCodigoDblClick
    OnEnter = edtCodigoEnter
    OnExit = edtCodigoExit
  end
  object RxDBLookupCombo4: TRxDBLookupCombo
    Left = 331
    Top = 567
    Width = 186
    Height = 23
    DropDownCount = 10
    DropDownWidth = 350
    DataField = 'glbcodVendedor'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LookupField = 'CODIGO'
    LookupDisplay = 'NOMBREVENDEDOR'
    LookupSource = dsqryEmpleado
    ParentFont = False
    TabOrder = 38
    OnChange = RxDBLookupCombo1Change
    OnEnter = RxDBLookupCombo1Enter
    OnExit = RxDBLookupCombo1Exit
  end
  object panelDatoConduceCte: TPanel
    Left = 8
    Top = 146
    Width = 363
    Height = 32
    TabOrder = 57
    Visible = False
    object Label56: TLabel
      Left = 2
      Top = -1
      Width = 72
      Height = 13
      Caption = '# Conduce Cte'
    end
    object Label57: TLabel
      Left = 207
      Top = 0
      Width = 27
      Height = 13
      Caption = 'Placa'
    end
    object Label58: TLabel
      Left = 98
      Top = -1
      Width = 63
      Height = 13
      Caption = 'Identificaci'#243'n'
    end
    object DBEdit14: TDBEdit
      Left = 2
      Top = 10
      Width = 91
      Height = 21
      DataField = 'NUM_CONDUCE_CTE'
      DataSource = DataSource1
      TabOrder = 0
    end
    object RxDBLookupCombo5: TRxDBLookupCombo
      Left = 206
      Top = 11
      Width = 156
      Height = 21
      DropDownCount = 8
      DropDownWidth = 300
      DataField = 'FICHA_VEH'
      DataSource = DataSource1
      LookupField = 'FICHA'
      LookupDisplay = 'PLACA'
      LookupSource = dsqryVehiculos
      TabOrder = 2
    end
    object DBEdit15: TDBEdit
      Left = 96
      Top = 10
      Width = 107
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NUM_IDENT'
      DataSource = DataSource1
      TabOrder = 1
    end
  end
  object btnVerSecCertificados: TBitBtn
    Left = 624
    Top = 568
    Width = 54
    Height = 25
    Caption = 'Ver Sec'
    TabOrder = 58
  end
  object panelPoliza: TPanel
    Left = 157
    Top = 145
    Width = 218
    Height = 33
    BevelOuter = bvNone
    TabOrder = 59
    Visible = False
    object Label25: TLabel
      Left = 2
      Top = -1
      Width = 38
      Height = 13
      Caption = '# P'#243'liza'
    end
    object lblFechaInicaPoliza: TLabel
      Left = 96
      Top = -1
      Width = 89
      Height = 13
      Caption = 'Fecha Inicia Poliza'
      Visible = False
    end
    object DBEdit16: TDBEdit
      Left = 2
      Top = 11
      Width = 91
      Height = 21
      DataField = 'NUM_IDENT'
      DataSource = DataSource1
      TabOrder = 0
      OnChange = DBEdit16Change
    end
    object dbFechaIniciaPoliza: TDBDateEdit
      Left = 96
      Top = 11
      Width = 112
      Height = 20
      DataField = 'FechaIniciaPoliza'
      DataSource = dsTotales
      NumGlyphs = 2
      TabOrder = 1
      Visible = False
      OnExit = dbFechaIniciaPolizaExit
    end
  end
  object cboxUseLogo: TComboBox
    Left = 509
    Top = 57
    Width = 264
    Height = 21
    Color = 8454143
    ItemHeight = 13
    TabOrder = 60
    Text = 'cboxUseLogo'
  end
  object Button2: TButton
    Left = 824
    Top = 506
    Width = 109
    Height = 25
    Caption = 'Reimprime Ticket'
    TabOrder = 61
    OnClick = Button2Click
  end
  object btnPresupuesto: TButton
    Left = 822
    Top = 414
    Width = 112
    Height = 25
    Caption = '&Pre-Supuesto'
    TabOrder = 62
    OnClick = btnPresupuestoClick
  end
  object rxVenta: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Serie'
        DataType = ftInteger
      end
      item
        Name = 'Fecha'
        DataType = ftDateTime
      end
      item
        Name = 'Cant'
        DataType = ftFloat
      end
      item
        Name = 'Precio'
        DataType = ftCurrency
      end
      item
        Name = 'MontoBruto'
        DataType = ftCurrency
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Devolucion'
        DataType = ftCurrency
      end
      item
        Name = 'MontoNeto'
        DataType = ftCurrency
      end
      item
        Name = 'CodUsuario'
        DataType = ftInteger
      end
      item
        Name = 'CodArticulo'
        DataType = ftInteger
      end
      item
        Name = 'NumeroRecibo'
        DataType = ftInteger
      end
      item
        Name = 'CodTexto'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NCF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NumeroTrn'
        DataType = ftInteger
      end
      item
        Name = 'porc_desc'
        DataType = ftFloat
      end
      item
        Name = 'Itbi'
        DataType = ftFloat
      end
      item
        Name = 'MontoDescuento'
        DataType = ftFloat
      end
      item
        Name = 'SerieProd'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NumeroFactura'
        DataType = ftInteger
      end
      item
        Name = 'Invetariar'
        DataType = ftSmallint
      end
      item
        Name = 'loteNum'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'MontoItbisenPrecio'
        DataType = ftCurrency
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NumeroDoc'
        DataType = ftInteger
      end
      item
        Name = 'TipoUnidad'
        DataType = ftInteger
      end
      item
        Name = 'DescUnidadMedida'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ItbisExento'
        DataType = ftSmallint
      end
      item
        Name = 'TipoVenta'
        DataType = ftInteger
      end
      item
        Name = 'DescripcionEspecial'
        DataType = ftMemo
      end
      item
        Name = 'MontoDesGastoAdmin'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescItbisGastosAdmin'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescTransp'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescDirTecnica'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescItbisDirTec'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescImprevisto'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescItbisImprevisto'
        DataType = ftCurrency
      end
      item
        Name = 'SerieOriginal'
        DataType = ftInteger
      end
      item
        Name = 'NumeroTrnOriginal'
        DataType = ftInteger
      end
      item
        Name = 'Status'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NumeroCotiza'
        DataType = ftInteger
      end
      item
        Name = 'Moneda'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MonedaBase'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RutaImagen'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'CostoProducto'
        DataType = ftCurrency
      end
      item
        Name = 'glbcodVendedor'
        DataType = ftInteger
      end
      item
        Name = 'PorcDescItem'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescItem'
        DataType = ftCurrency
      end
      item
        Name = 'Recargo'
        DataType = ftCurrency
      end
      item
        Name = 'MontoTranspItbis'
        DataType = ftCurrency
      end
      item
        Name = 'MontoItbisRecargo'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDesGlobal'
        DataType = ftCurrency
      end
      item
        Name = 'IDTasaITBIS'
        DataType = ftInteger
      end
      item
        Name = 'MontoItbRecItmConDesc'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescGlbDist'
        DataType = ftCurrency
      end
      item
        Name = 'monto_tasa'
        DataType = ftCurrency
      end
      item
        Name = 'CantPax'
        DataType = ftInteger
      end
      item
        Name = 'PorcTasaItbisCld'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DC_ITBIS_CLD'
        DataType = ftCurrency
      end
      item
        Name = 'TC_MONTOITBISRECARGO_GLB'
        DataType = ftCurrency
      end
      item
        Name = 'TC_MONTOITBISRECARGO_ITM'
        DataType = ftCurrency
      end
      item
        Name = 'CantExcedeInv'
        DataType = ftInteger
      end
      item
        Name = 'NUM_CONDUCE_CTE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUM_IDENT'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'FICHA_VEH'
        DataType = ftInteger
      end
      item
        Name = 'CodigoVendedor'
        DataType = ftInteger
      end
      item
        Name = 'FechaIniciaPoliza'
        DataType = ftTimeStamp
      end>
    AfterOpen = rxVentaAfterOpen
    AfterClose = rxVentaAfterClose
    BeforeInsert = rxVentaBeforeInsert
    AfterInsert = rxVentaAfterInsert
    BeforeEdit = rxVentaBeforeEdit
    AfterEdit = rxVentaAfterEdit
    BeforePost = rxVentaBeforePost
    AfterPost = rxVentaAfterPost
    BeforeDelete = rxVentaBeforeDelete
    AfterDelete = rxVentaAfterDelete
    AfterScroll = rxVentaAfterScroll
    Left = 297
    Top = 124
    object rxVentaSerie: TIntegerField
      FieldName = 'Serie'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object rxVentaFecha: TDateTimeField
      FieldName = 'Fecha'
    end
    object rxVentaCant: TFloatField
      FieldName = 'Cant'
    end
    object rxVentaPrecio: TCurrencyField
      FieldName = 'Precio'
      DisplayFormat = ',0.00'
    end
    object rxVentaMontoBruto: TCurrencyField
      FieldName = 'MontoBruto'
    end
    object rxVentaDescripcion: TStringField
      FieldName = 'Descripcion'
      Required = True
      Size = 80
    end
    object rxVentaDevolucion: TCurrencyField
      FieldName = 'Devolucion'
      DisplayFormat = ',0.00'
    end
    object rxVentaMontoNeto: TCurrencyField
      FieldName = 'MontoNeto'
      DisplayFormat = ',0.00'
    end
    object rxVentaCodUsuario: TIntegerField
      FieldName = 'CodUsuario'
    end
    object rxVentaCodArticulo: TIntegerField
      FieldName = 'CodArticulo'
    end
    object rxVentaNumeroRecibo: TIntegerField
      FieldName = 'NumeroRecibo'
    end
    object rxVentaCodTexto: TStringField
      DisplayWidth = 40
      FieldName = 'CodTexto'
      Size = 40
    end
    object rxVentaNCF: TStringField
      FieldName = 'NCF'
    end
    object rxVentaNumeroTrn: TIntegerField
      FieldName = 'NumeroTrn'
    end
    object rxVentaporc_desc: TFloatField
      FieldName = 'porc_desc'
      DisplayFormat = ',0.00'
    end
    object rxVentaItbi: TFloatField
      FieldName = 'Itbi'
      DisplayFormat = ',0.00'
    end
    object rxVentaMontoDescuento: TFloatField
      FieldName = 'MontoDescuento'
      DisplayFormat = ',0.00'
    end
    object rxVentaSerieProd: TStringField
      FieldName = 'SerieProd'
      Size = 50
    end
    object rxVentaNumeroFactura: TIntegerField
      FieldName = 'NumeroFactura'
    end
    object rxVentaInvetariar: TSmallintField
      FieldName = 'Invetariar'
    end
    object rxVentaloteNum: TStringField
      FieldName = 'loteNum'
      Size = 25
    end
    object rxVentaMontoItbisenPrecio: TCurrencyField
      FieldName = 'MontoItbisenPrecio'
    end
    object rxVentaReferencia: TStringField
      FieldName = 'Referencia'
      Size = 30
    end
    object rxVentaNumeroDoc: TIntegerField
      FieldName = 'NumeroDoc'
    end
    object rxVentaTipoUnidad: TIntegerField
      FieldName = 'TipoUnidad'
    end
    object rxVentaDescUnidadMedida: TStringField
      FieldName = 'DescUnidadMedida'
      Size = 50
    end
    object rxVentaItbisExento: TSmallintField
      FieldName = 'ItbisExento'
    end
    object rxVentaTipoVenta: TIntegerField
      FieldName = 'TipoVenta'
    end
    object rxVentaDescripcionEspecial: TMemoField
      FieldName = 'DescripcionEspecial'
      BlobType = ftMemo
    end
    object rxVentaSerieOriginal: TIntegerField
      FieldName = 'SerieOriginal'
    end
    object rxVentaNumeroTrnOriginal: TIntegerField
      FieldName = 'NumeroTrnOriginal'
    end
    object rxVentaStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
    object rxVentaNumeroCotiza: TIntegerField
      FieldName = 'NumeroCotiza'
    end
    object rxVentaMoneda: TStringField
      FieldName = 'Moneda'
      Size = 1
    end
    object rxVentaMonedaBase: TStringField
      FieldName = 'MonedaBase'
    end
    object rxVentaRutaImagen: TStringField
      FieldName = 'RutaImagen'
      Size = 80
    end
    object rxVentaCostoProducto: TCurrencyField
      FieldName = 'CostoProducto'
    end
    object rxVentaglbcodVendedor: TIntegerField
      FieldName = 'glbcodVendedor'
    end
    object rxVentaPorcDescItem: TCurrencyField
      FieldName = 'PorcDescItem'
      DisplayFormat = ',0.00'
    end
    object rxVentaMontoDescItem: TCurrencyField
      FieldName = 'MontoDescItem'
    end
    object rxVentaRecargo: TCurrencyField
      FieldName = 'Recargo'
    end
    object rxVentaMontoTranspItbis: TCurrencyField
      FieldName = 'MontoTranspItbis'
    end
    object rxVentaMontoItbisRecargo: TCurrencyField
      FieldName = 'MontoItbisRecargo'
    end
    object rxVentaMontoDesGlobal: TCurrencyField
      FieldName = 'MontoDesGlobal'
    end
    object rxVentaIDTasaITBIS: TIntegerField
      FieldName = 'IDTasaITBIS'
    end
    object rxVentaMontoItbRecItmConDesc: TCurrencyField
      FieldName = 'MontoItbRecItmConDesc'
    end
    object rxVentaMontoDescGlbDist: TCurrencyField
      FieldName = 'MontoDescGlbDist'
    end
    object rxVentamonto_tasa: TCurrencyField
      FieldName = 'monto_tasa'
    end
    object rxVentaCantPax: TIntegerField
      FieldName = 'CantPax'
    end
    object rxVentaDC_ITBIS_CLD: TCurrencyField
      FieldName = 'DC_ITBIS_CLD'
    end
    object rxVentaTC_MONTOITBISRECARGO_GLB: TCurrencyField
      FieldName = 'TC_MONTOITBISRECARGO_GLB'
    end
    object rxVentaTC_MONTOITBISRECARGO_ITM: TCurrencyField
      FieldName = 'TC_MONTOITBISRECARGO_ITM'
    end
    object rxVentaPorcTasaItbisCld: TStringField
      FieldName = 'PorcTasaItbisCld'
    end
    object rxVentaCantExcedeInv: TIntegerField
      FieldName = 'CantExcedeInv'
    end
    object rxVentaFICHA_VEH: TIntegerField
      FieldName = 'FICHA_VEH'
    end
    object rxVentaNUM_CONDUCE_CTE: TStringField
      FieldName = 'NUM_CONDUCE_CTE'
      Size = 60
    end
    object rxVentaNUM_IDENT: TStringField
      FieldName = 'NUM_IDENT'
      Size = 40
    end
  end
  object DataSource1: TDataSource
    DataSet = rxVenta
    OnStateChange = DataSource1StateChange
    Left = 272
    Top = 222
  end
  object qryProductos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    AfterScroll = qryProductosAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *  From  PROC_INV_VENTA(:invid)'
      'ORDER BY descripcion,tipo, Referencia, codigo')
    Left = 73
    Top = 315
    ParamData = <
      item
        DataType = ftInteger
        Name = 'invid'
        ParamType = ptInput
      end>
    object qryProductosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryProductosCANTIDAD: TFloatField
      DisplayLabel = 'Cant'
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryProductosCODIGO_TEXTO: TIBStringField
      DisplayWidth = 40
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryProductosPRECIO_MINIMO: TFloatField
      DisplayLabel = 'Precio Minimo'
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
    object qryProductosPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryProductosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryProductosREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object qryProductosINVENTARIAR: TSmallintField
      FieldName = 'INVENTARIAR'
      Origin = 'INVENTARIO_PRODUCTO.INVENTARIAR'
    end
    object qryProductosPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
    end
    object qryProductosPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'PROC_INV_VENTA.PORC_DESCUENTO'
    end
    object qryProductosUNIDAD: TFloatField
      FieldName = 'UNIDAD'
      Origin = 'PROC_INV_VENTA.UNIDAD'
    end
    object qryProductosPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'PROC_INV_VENTA.PRECIO_COMPRA'
    end
    object qryProductosFECHA_VENCIMIENTO: TDateTimeField
      FieldName = 'FECHA_VENCIMIENTO'
      Origin = 'PROC_INV_VENTA.FECHA_VENCIMIENTO'
    end
    object qryProductosPRECIO_TIPO_UNIDAD: TFloatField
      FieldName = 'PRECIO_TIPO_UNIDAD'
      Origin = 'PROC_INV_VENTA.PRECIO_TIPO_UNIDAD'
    end
    object qryProductosTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'PROC_INV_VENTA.TIPO_UNIDAD'
    end
    object qryProductosPRECIOVENTA1: TFloatField
      FieldName = 'PRECIOVENTA1'
      Origin = 'PROC_INV_VENTA.PRECIOVENTA1'
      DisplayFormat = ',0.00'
    end
    object qryProductosPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'PROC_INV_VENTA.PRECIOVENTA2'
      DisplayFormat = ',0.00'
    end
    object qryProductosPRECIOVENTA3: TFloatField
      FieldName = 'PRECIOVENTA3'
      Origin = 'PROC_INV_VENTA.PRECIOVENTA3'
      DisplayFormat = ',0.00'
    end
    object qryProductosPRECIOVENTA4: TFloatField
      FieldName = 'PRECIOVENTA4'
      Origin = 'PROC_INV_VENTA.PRECIOVENTA4'
      DisplayFormat = ',0.00'
    end
    object qryProductosUSARLEVELPRECIO: TSmallintField
      FieldName = 'USARLEVELPRECIO'
      Origin = 'PROC_INV_VENTA.USARLEVELPRECIO'
    end
    object qryProductosCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'PROC_INV_VENTA.CIA_KEY'
    end
    object qryProductosPORCITBIS: TFloatField
      FieldName = 'PORCITBIS'
      Origin = 'PROC_INV_VENTA.PORCITBIS'
    end
    object qryProductosFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_INV_VENTA.FECHA'
    end
    object qryProductosCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'PROC_INV_VENTA.CODIGO_BARRA'
      Size = 40
    end
    object qryProductosTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'PROC_INV_VENTA.TIPO'
    end
    object qryProductosCANTIDAD_REORDEN: TIntegerField
      FieldName = 'CANTIDAD_REORDEN'
      Origin = 'PROC_INV_VENTA.CANTIDAD_REORDEN'
    end
    object qryProductosPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'PROC_INV_VENTA.PRECIO_ANT'
    end
    object qryProductosBLCE_CANT_ENTRADA: TFloatField
      FieldName = 'BLCE_CANT_ENTRADA'
      Origin = 'PROC_INV_VENTA.BLCE_CANT_ENTRADA'
    end
    object qryProductosBLCE_CANT_SALIDA: TFloatField
      FieldName = 'BLCE_CANT_SALIDA'
      Origin = 'PROC_INV_VENTA.BLCE_CANT_SALIDA'
    end
    object qryProductosFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'PROC_INV_VENTA.FECHA_ULTIMA_TRN'
    end
    object qryProductosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROC_INV_VENTA.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryProductosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'PROC_INV_VENTA.FOTO'
      Size = 8
    end
    object qryProductosCODIGO_PRECIO: TIBStringField
      FieldName = 'CODIGO_PRECIO'
      Origin = 'PROC_INV_VENTA.CODIGO_PRECIO'
      FixedChar = True
      Size = 6
    end
    object qryProductosDESCRIPCIONADICIONAL: TMemoField
      FieldName = 'DESCRIPCIONADICIONAL'
      Origin = 'PROC_INV_VENTA.DESCRIPCIONADICIONAL'
      BlobType = ftMemo
      Size = 8
    end
    object qryProductosCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'PROC_INV_VENTA.COD_MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryProductosIDTASAITBIS: TSmallintField
      FieldName = 'IDTASAITBIS'
      Origin = 'PROC_INV_VENTA.IDTASAITBIS'
    end
    object qryProductosLOTE_NUM: TIBStringField
      FieldName = 'LOTE_NUM'
      Origin = 'PROC_INV_VENTA.LOTE_NUM'
      Size = 25
    end
    object qryProductosCANTLOT: TIntegerField
      FieldName = 'CANTLOT'
      Origin = 'PROC_INV_VENTA.CANTLOT'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 113
    Top = 440
    object MedicamentosControlados1: TMenuItem
      Caption = 'Medicamentos Controlados'
      Visible = False
    end
    object Cobertura1: TMenuItem
      Caption = 'Cobertura'
      Visible = False
    end
    object DetallePosExtra1: TMenuItem
      Caption = 'Detalle Pos Extra'
      Visible = False
      OnClick = DetallePosExtra1Click
    end
    object BuscarRNCDGII1: TMenuItem
      Caption = 'Buscar RNC DGII'
      Visible = False
      OnClick = BuscarRNCDGII1Click
    end
    object Alquiler1: TMenuItem
      Tag = 3427
      Caption = 'Alquiler'
      Visible = False
      OnClick = Alquiler1Click
    end
    object Lavanderia1: TMenuItem
      Tag = 3433
      Caption = 'Lavanderia'
      Visible = False
    end
    object Costura1: TMenuItem
      Tag = 3434
      Caption = 'Costura'
      Visible = False
    end
    object RegistroServicioTaller1: TMenuItem
      Tag = 3111
      Caption = 'Registro Servicio Taller'
      Visible = False
    end
    object RecuperarTransacciones1: TMenuItem
      Tag = 3112
      Caption = 'Recuperar Transacciones'
      Hint = 'Recuperar Transacciones'
      Visible = False
      OnClick = RecuperarTransacciones1Click
    end
    object MaestroCliente1: TMenuItem
      Tag = 3113
      Caption = 'Clientes'
      Hint = 'Recupera transacciones '
      Visible = False
      OnClick = MaestroCliente1Click
    end
    object Cotizar1: TMenuItem
      Tag = 3114
      Caption = 'Cotizar'
      Visible = False
      OnClick = Cotizar1Click
    end
    object ConsultaGeneral1: TMenuItem
      Tag = 3115
      Caption = 'Consulta General'
      Visible = False
      OnClick = ConsultaGeneral1Click
    end
    object Inventario1: TMenuItem
      Tag = 3116
      Caption = 'Inventario'
      Visible = False
      OnClick = Inventario1Click
    end
    object MaestroInventario1: TMenuItem
      Caption = 'Maestro Inventario'
      OnClick = MaestroInventario1Click
    end
    object LectorCodBarra1: TMenuItem
      Tag = 3118
      Caption = 'Lector Cod &Barra F10'
      Visible = False
      OnClick = LectorCodBarra1Click
    end
    object CuadreCaja1: TMenuItem
      Tag = 3119
      Caption = 'Cuadre Caja'
      Visible = False
    end
    object ImprimirRecibo1: TMenuItem
      Tag = 3120
      Caption = 'Imprimir Recibo'
      Visible = False
      OnClick = ImprimirRecibo1Click
    end
    object NotaDebito1: TMenuItem
      Tag = 3121
      Caption = 'Nota Debito'
      Enabled = False
      Visible = False
    end
    object NotaCrdito1: TMenuItem
      Tag = 3122
      Caption = 'Nota Cr'#233'dito'
      Visible = False
    end
    object Devolucin1: TMenuItem
      Tag = 3123
      Caption = 'Modificar Venta'
      Visible = False
    end
    object ModificarFactura1: TMenuItem
      Tag = 3425
      Caption = 'Modificar Factura'
      Visible = False
    end
    object ReImprimeDocFiscal1: TMenuItem
      Tag = 3126
      Caption = 'Re-Imprime &Doc &Fiscal'
      Visible = False
    end
    object ReImprimirRecibo1: TMenuItem
      Tag = 3127
      Caption = 'Re-Imprimir Recibo'
      Visible = False
      OnClick = ReImprimirRecibo1Click
    end
    object ReImprimeFacturaContado1: TMenuItem
      Tag = 3128
      Caption = 'Re-Imprime Factura'
      Visible = False
    end
    object ReImprimeConduce1: TMenuItem
      Caption = 'Re-Imprime Conduce'
      Visible = False
      OnClick = ReImprimeConduce1Click
    end
    object ReImprimeFactRest1: TMenuItem
      Caption = 'Re-Imprime Fact Especial'
      Visible = False
      OnClick = ReImprimeFactRest1Click
    end
    object ReImprimeTicketVta1: TMenuItem
      Caption = 'Re-Imprime Ticket Vta'
      Visible = False
      OnClick = ReImprimeTicketVta1Click
    end
    object ReImprimeDevolucion1: TMenuItem
      Tag = 3129
      Caption = 'Re-Imprime Devolucion (NCR)'
      Visible = False
      OnClick = ReImprimeDevolucion1Click
    end
    object ReImprimeDevolucionsinFact1: TMenuItem
      Tag = 3130
      Caption = 'Re-Imprime Devolucion(NCR) sin Fact'
      Visible = False
      OnClick = ReImprimeDevolucionsinFact1Click
    end
    object ImprimirOrdenEntrega1: TMenuItem
      Caption = 'Imprimir Orden Entrega'
      Visible = False
      OnClick = ImprimirOrdenEntrega1Click
    end
    object ImpFiscal1: TMenuItem
      Tag = 3131
      Caption = 'Imp Fiscal'
      Visible = False
      object Cancelar1: TMenuItem
        Tag = 3132
        Caption = 'Cancelar Ticket'
      end
      object CancelarTicket1: TMenuItem
        Tag = 3133
        Caption = 'Cancelar Ticket En curso'
        OnClick = CancelarTicket1Click
      end
      object Estatus1: TMenuItem
        Tag = 3134
        Caption = 'Estatus'
      end
    end
    object RecuperaTicketfiscal1: TMenuItem
      Tag = 3140
      Caption = 'Recupera Ticket fiscal'
      Visible = False
    end
    object Conduce1: TMenuItem
      Caption = 'Conduce'
      Visible = False
      object ConfirmarConduce2: TMenuItem
        Caption = 'Confirmar Conduce'
      end
      object ActualizaConduce1: TMenuItem
        Caption = 'Actualiza Conduce'
      end
    end
    object CierreX1: TMenuItem
      Tag = 3141
      Caption = 'Cierre X'
      Visible = False
      OnClick = CierreX1Click
    end
    object CirreZ1: TMenuItem
      Tag = 3142
      Caption = 'Cirre Z'
      Visible = False
      OnClick = CirreZ1Click
    end
    object ConciliarNIF1: TMenuItem
      Tag = 3143
      Caption = 'Conciliar NIF'
      Visible = False
    end
    object NCFSinValorFiscal1: TMenuItem
      Tag = 3144
      Caption = 'NCF - Fact. Cons. Final Sin Valor Fiscal 02'
      Visible = False
    end
    object MostrarVistaproductos1: TMenuItem
      Tag = 3150
      Caption = 'Mostrar Vista productos'
      Checked = True
      OnClick = MostrarVistaproductos1Click
    end
    object Seguros1: TMenuItem
      Tag = 3151
      Caption = 'Seguros'
      Visible = False
      object Poliza1: TMenuItem
        Caption = 'Poliza'
        OnClick = Poliza1Click
      end
    end
    object NoGenerarNCF1: TMenuItem
      Tag = 3152
      Caption = 'No Generar NCF-F12'
      Checked = True
      Visible = False
      OnClick = NoGenerarNCF1Click
    end
    object ImprimirLabel1: TMenuItem
      Tag = 3153
      Caption = 'Imprimir Label'
      Visible = False
    end
    object BuscarCliente1: TMenuItem
      Tag = 3154
      Caption = 'Buscar Cliente'
      OnClick = BuscarCliente1Click
    end
    object NoMostrarProdVencidos1: TMenuItem
      Tag = 3155
      Caption = 'Mostrar Prod Vencidos'
      OnClick = NoMostrarProdVencidos1Click
    end
    object Ayuda1: TMenuItem
      Caption = 'Ayuda'
      Visible = False
      OnClick = Ayuda1Click
    end
    object ListarPuertosCom1: TMenuItem
      Caption = 'Listar Puertos (Com)'
      Visible = False
    end
    object Log1: TMenuItem
      Caption = 'Log'
      Visible = False
      OnClick = Log1Click
    end
    object Extras1: TMenuItem
      Caption = 'Extras'
      object DesactivarSkin1: TMenuItem
        Caption = 'Desactivar Skin'
        OnClick = DesactivarSkin1Click
      end
      object InactivaReciboFarmacia1: TMenuItem
        Caption = 'Inactiva Recibo Farmacia'
        OnClick = InactivaReciboFarmacia1Click
      end
    end
    object CerrarPrograma1: TMenuItem
      Caption = 'Cerrar Programa'
      OnClick = CerrarPrograma1Click
    end
  end
  object ipStpInsertVentMast: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INS_VENTAS_MAST_PREVENTA'
    Left = 213
    Top = 417
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO_TRNS'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'FORMA_PAGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTAL_DET'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO_DOC_PAGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SERIE_NCF_ASIGNADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_BRUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORC_DESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMBRE_CLIENTE_GENERAL'
        ParamType = ptInput
      end>
  end
  object ipStpInsertCotizaMast: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INS_COTIZACION_MAST'
    Left = 592
    Top = 183
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO_TRNS'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_VENCE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'NUMERO_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO_DOC_PAGO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'SERIE_NCF_ASIGNADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_BRUTO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'PORC_DESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMBRE_CLIENTE_GENERAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_PAGADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_CAMBIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_TOTAL_ITBIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCGASTOSADMIN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCITBISGASTOSADMIN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCTRANSP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCDIRTECNICA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCITBISDIRTECNICA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCIMPREVISTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCITBISIMPREVISTO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'APLICA_TIPODESC'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'COMENTARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIACTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_RECARGO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TIPONCFIFISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_EXONERADO_ITBIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORCPROPINALEGAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PROPINA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PROPINALEGAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODZON'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'STACOT'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'IMPCOT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MARCOT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MODCOT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CHACOT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'KILCOT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PLACOT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOCOT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COLCOT'
        ParamType = ptInput
      end>
  end
  object dsqryInventario: TDataSource
    DataSet = rxqryInv
    Left = 95
    Top = 198
  end
  object qryInventario: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryInventarioAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '
      'INV.CODIGO_TEXTO, '
      'INV.DESCRIPCION, '
      'INV.PRECIO, '
      'INV.PRECIO_MINIMO,'
      'INV.PAGA_ITBI,'
      'inv.cod_moneda,'
      'INV.CANTIDAD,'
      'INV.descripcionadicional,'
      'inv.porcitbis,'
      'INV.PRECIO_TIPO_UNIDAD,'
      'inv.precioventa1,'
      'inv.precioventa2,'
      'inv.precioventa3,'
      'inv.precioventa4,'
      'inv.rutaimagen,'
      'inv.USARLEVELPRECIO,'
      'inv.inventariar, REFERENCIA,'
      'tipo_inv.Descripcion Desc_tipoInv,'
      'inv.tipo,'
      'porc_descuento,'
      'inv.codigo,'
      'inv.tipo_unidad,'
      'inv.IDTASAITBIS'
      'FROM INVENTARIO_PRODUCTO  inv'
      
        'Left join TIPO_INVENTARIO tipo_inv on inv.tipo = tipo_inv.codigo' +
        ' '
      'Where inv.cia_key =:ciakey'
      'ORDER BY inv.codigo, inv.tipo, inv.descripcion')
    Left = 95
    Top = 193
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ciakey'
        ParamType = ptUnknown
      end>
    object qryInventarioDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      DisplayWidth = 80
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryInventarioPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryInventarioPAGA_ITBI: TSmallintField
      DisplayLabel = 'PagaItbi'
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
    end
    object qryInventarioDESC_TIPOINV: TIBStringField
      DisplayLabel = 'TipoInventario'
      FieldName = 'DESC_TIPOINV'
      Origin = 'TIPO_INVENTARIO.DESCRIPCION'
      Size = 30
    end
    object qryInventarioTIPO: TIntegerField
      DisplayLabel = 'CodTipo'
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object qryInventarioPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'INVENTARIO_PRODUCTO.PORC_DESCUENTO'
    end
    object qryInventarioCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryInventarioCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryInventarioPRECIO_MINIMO: TFloatField
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
    object qryInventarioINVENTARIAR: TSmallintField
      FieldName = 'INVENTARIAR'
      Origin = 'INVENTARIO_PRODUCTO.INVENTARIAR'
    end
    object qryInventarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInventarioREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object qryInventarioPRECIO_TIPO_UNIDAD: TFloatField
      FieldName = 'PRECIO_TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_TIPO_UNIDAD'
    end
    object qryInventarioTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.TIPO_UNIDAD'
    end
    object qryInventarioPRECIOVENTA1: TFloatField
      FieldName = 'PRECIOVENTA1'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA1'
    end
    object qryInventarioPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA2'
    end
    object qryInventarioPRECIOVENTA3: TFloatField
      FieldName = 'PRECIOVENTA3'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA3'
    end
    object qryInventarioPRECIOVENTA4: TFloatField
      FieldName = 'PRECIOVENTA4'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA4'
    end
    object qryInventarioUSARLEVELPRECIO: TSmallintField
      FieldName = 'USARLEVELPRECIO'
      Origin = 'INVENTARIO_PRODUCTO.USARLEVELPRECIO'
    end
    object qryInventarioPORCITBIS: TFloatField
      FieldName = 'PORCITBIS'
      Origin = 'INVENTARIO_PRODUCTO.PORCITBIS'
    end
    object qryInventarioDESCRIPCIONADICIONAL: TMemoField
      FieldName = 'DESCRIPCIONADICIONAL'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCIONADICIONAL'
      BlobType = ftMemo
      Size = 8
    end
    object qryInventarioCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'INVENTARIO_PRODUCTO.COD_MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryInventarioRUTAIMAGEN: TIBStringField
      FieldName = 'RUTAIMAGEN'
      Origin = 'INVENTARIO_PRODUCTO.RUTAIMAGEN'
      Size = 200
    end
    object qryInventarioIDTASAITBIS: TSmallintField
      FieldName = 'IDTASAITBIS'
      Origin = 'INVENTARIO_PRODUCTO.IDTASAITBIS'
    end
  end
  object ibStpActualizaInvProd: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_ACTUALIZAINVENTARIO'
    Left = 160
    Top = 203
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO_PRODUCTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUEVACANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPOTRN'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'PORCODIGO'
        ParamType = ptInput
      end>
  end
  object Totales: TRxMemoryData
    FieldDefs = <
      item
        Name = 'SubTotal'
        DataType = ftCurrency
      end
      item
        Name = 'itbis'
        DataType = ftCurrency
      end
      item
        Name = 'montodesc'
        DataType = ftFloat
      end
      item
        Name = 'totalneto'
        DataType = ftFloat
      end
      item
        Name = 'montorecibido'
        DataType = ftFloat
      end
      item
        Name = 'devolucion'
        DataType = ftFloat
      end
      item
        Name = 'CodCliente'
        DataType = ftInteger
      end
      item
        Name = 'NombreCliente'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Direccion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Telefono'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'PorcDesAdicional'
        DataType = ftFloat
      end
      item
        Name = 'MontoDescAdicional'
        DataType = ftFloat
      end
      item
        Name = 'ncf_numero'
        DataType = ftString
        Size = 19
      end
      item
        Name = 'MontoInteres'
        DataType = ftCurrency
      end
      item
        Name = 'PorcientoInteres'
        DataType = ftFloat
      end
      item
        Name = 'qrLabelNcfDesc'
        DataType = ftString
        Size = 36
      end
      item
        Name = 'Rnc_Numero'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'FechaVence'
        DataType = ftDateTime
      end
      item
        Name = 'MontoDescGastosAdmin'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescItbisGastosAdmin'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescTransp'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescDirtecnica'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescItbisDirTecnica'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescImprevisto'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescItbisImprevisto'
        DataType = ftCurrency
      end
      item
        Name = 'PorcGAdmin'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PorcItbisGAdmin'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PorcTrans'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PorcDirTec'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PorcItbisDirTec'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PorcImprevisto'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PorcItbisImprevisto'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TPorcGAdmin'
        DataType = ftFloat
      end
      item
        Name = 'TPorcItbisGAdmin'
        DataType = ftFloat
      end
      item
        Name = 'TPorcTrans'
        DataType = ftFloat
      end
      item
        Name = 'TPorcDirTec'
        DataType = ftFloat
      end
      item
        Name = 'TPorcItbisDirTec'
        DataType = ftFloat
      end
      item
        Name = 'TPorcImprevisto'
        DataType = ftFloat
      end
      item
        Name = 'TPorcItbisImprevisto'
        DataType = ftCurrency
      end
      item
        Name = 'Comentario'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'FechaCotizacion'
        DataType = ftDateTime
      end
      item
        Name = 'Moneda'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MontoEnTarjeta'
        DataType = ftCurrency
      end
      item
        Name = 'MontoEnEfectivo'
        DataType = ftCurrency
      end
      item
        Name = 'MontoEnCheque'
        DataType = ftCurrency
      end
      item
        Name = 'MontoEnBonos'
        DataType = ftCurrency
      end
      item
        Name = 'Diferencia'
        DataType = ftCurrency
      end
      item
        Name = 'MontoNotaCredito'
        DataType = ftCurrency
      end
      item
        Name = 'MontoNCRAplicado'
        DataType = ftCurrency
      end
      item
        Name = 'ReferenciaCte'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NumeroTrn'
        DataType = ftInteger
      end
      item
        Name = 'MontoDescItems'
        DataType = ftCurrency
      end
      item
        Name = 'Recargo'
        DataType = ftCurrency
      end
      item
        Name = 'TipoNCF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TipoNCFIFiscal'
        DataType = ftInteger
      end
      item
        Name = 'MontoExoneraITBIS'
        DataType = ftCurrency
      end
      item
        Name = 'MontoITBISRecargo'
        DataType = ftCurrency
      end
      item
        Name = 'MontoItbRecItmConDesc'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescGlbItbis'
        DataType = ftCurrency
      end
      item
        Name = 'Propina'
        DataType = ftCurrency
      end
      item
        Name = 'PropinaLegal'
        DataType = ftCurrency
      end
      item
        Name = 'SubTotalScreen'
        DataType = ftCurrency
      end
      item
        Name = 'FechaIniciaPoliza'
        DataType = ftDateTime
      end
      item
        Name = 'TipoAfiliado'
        DataType = ftSmallint
      end
      item
        Name = 'CodigoCteDelivery'
        DataType = ftInteger
      end
      item
        Name = 'idNumeroDVeh'
        DataType = ftInteger
      end
      item
        Name = 'PreAbono'
        DataType = ftCurrency
      end>
    AfterClose = TotalesAfterClose
    BeforePost = TotalesBeforePost
    AfterPost = TotalesAfterPost
    AfterScroll = TotalesAfterScroll
    OnCalcFields = TotalesCalcFields
    Left = 25
    Top = 206
    object Totalesmontodesc: TFloatField
      FieldName = 'montodesc'
      DisplayFormat = ',0.00'
    end
    object Totalestotalneto: TFloatField
      FieldName = 'totalneto'
      DisplayFormat = ',0.00'
      currency = True
    end
    object Totalesmontorecibido: TFloatField
      FieldName = 'montorecibido'
      DisplayFormat = ',0.00'
    end
    object Totalesdevolucion: TFloatField
      FieldName = 'devolucion'
      DisplayFormat = ',0.00'
    end
    object TotalesCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object TotalesNombreCliente: TStringField
      FieldName = 'NombreCliente'
      Size = 60
    end
    object TotalesDireccion: TStringField
      FieldName = 'Direccion'
      Size = 50
    end
    object TotalesTelefono: TStringField
      FieldName = 'Telefono'
      Size = 18
    end
    object TotalesPorcDesAdicional: TFloatField
      FieldName = 'PorcDesAdicional'
      DisplayFormat = ',0'
    end
    object TotalesMontoDescAdicional: TFloatField
      FieldName = 'MontoDescAdicional'
      DisplayFormat = ',0.00'
    end
    object Totalesncf_numero: TStringField
      FieldName = 'ncf_numero'
      Size = 19
    end
    object TotalesMontoInteres: TCurrencyField
      FieldName = 'MontoInteres'
    end
    object TotalesPorcientoInteres: TFloatField
      FieldName = 'PorcientoInteres'
      DisplayFormat = '%0,'
    end
    object TotalesqrLabelNcfDesc: TStringField
      FieldName = 'qrLabelNcfDesc'
      Size = 36
    end
    object TotalesRnc_Numero: TStringField
      FieldName = 'Rnc_Numero'
      Size = 15
    end
    object TotalesFechaVence: TDateTimeField
      FieldName = 'FechaVence'
    end
    object TotalesMontoDescGastosAdmin: TCurrencyField
      FieldName = 'MontoDescGastosAdmin'
    end
    object TotalesMontoDescItbisGastosAdmin: TCurrencyField
      FieldName = 'MontoDescItbisGastosAdmin'
    end
    object TotalesMontoDescTransp: TCurrencyField
      FieldName = 'MontoDescTransp'
    end
    object TotalesMontoDescDirtecnica: TCurrencyField
      FieldName = 'MontoDescDirtecnica'
    end
    object TotalesMontoDescItbisDirTecnica: TCurrencyField
      FieldName = 'MontoDescItbisDirTecnica'
    end
    object TotalesMontoDescImprevisto: TCurrencyField
      FieldName = 'MontoDescImprevisto'
    end
    object TotalesMontoDescItbisImprevisto: TCurrencyField
      FieldName = 'MontoDescItbisImprevisto'
    end
    object TotalesMontoSubTotalIndirectos: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'MontoSubTotalIndirectos'
      Calculated = True
    end
    object TotalesPorcGAdmin: TStringField
      FieldName = 'PorcGAdmin'
    end
    object TotalesPorcItbisGAdmin: TStringField
      FieldName = 'PorcItbisGAdmin'
    end
    object TotalesPorcTrans: TStringField
      FieldName = 'PorcTrans'
    end
    object TotalesPorcDirTec: TStringField
      FieldName = 'PorcDirTec'
    end
    object TotalesPorcItbisDirTec: TStringField
      FieldName = 'PorcItbisDirTec'
    end
    object TotalesPorcImprevisto: TStringField
      FieldName = 'PorcImprevisto'
    end
    object TotalesPorcItbisImprevisto: TStringField
      FieldName = 'PorcItbisImprevisto'
    end
    object TotalesTPorcGAdmin: TFloatField
      FieldName = 'TPorcGAdmin'
    end
    object TotalesTPorcItbisGAdmin: TFloatField
      FieldName = 'TPorcItbisGAdmin'
    end
    object TotalesTPorcTrans: TFloatField
      FieldName = 'TPorcTrans'
    end
    object TotalesTPorcDirTec: TFloatField
      FieldName = 'TPorcDirTec'
    end
    object TotalesTPorcItbisDirTec: TFloatField
      FieldName = 'TPorcItbisDirTec'
    end
    object TotalesTPorcImprevisto: TFloatField
      FieldName = 'TPorcImprevisto'
    end
    object TotalesTPorcItbisImprevisto: TFloatField
      FieldName = 'TPorcItbisImprevisto'
    end
    object TotalesComentario: TStringField
      FieldName = 'Comentario'
      Size = 80
    end
    object TotalesFechaCotizacion: TDateTimeField
      FieldName = 'FechaCotizacion'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object TotalesMoneda: TStringField
      FieldName = 'Moneda'
    end
    object TotalesMontoEnTarjeta: TCurrencyField
      FieldName = 'MontoEnTarjeta'
    end
    object TotalesMontoEnEfectivo: TCurrencyField
      FieldName = 'MontoEnEfectivo'
    end
    object TotalesMontoEnCheque: TCurrencyField
      FieldName = 'MontoEnCheque'
    end
    object TotalesMontoEnBonos: TCurrencyField
      FieldName = 'MontoEnBonos'
    end
    object TotalesDiferencia: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Diferencia'
      Calculated = True
    end
    object TotalesMontoNotaCredito: TCurrencyField
      FieldName = 'MontoNotaCredito'
    end
    object TotalesMontoNCRAplicado: TCurrencyField
      FieldName = 'MontoNCRAplicado'
    end
    object TotalesReferenciaCte: TStringField
      FieldName = 'ReferenciaCte'
    end
    object TotalesNumeroTrn: TIntegerField
      FieldName = 'NumeroTrn'
    end
    object TotalesMontoDescItems: TCurrencyField
      FieldName = 'MontoDescItems'
    end
    object TotalesRecargo: TCurrencyField
      FieldName = 'Recargo'
    end
    object TotalesNCF: TStringField
      FieldName = 'NCF'
      Size = 21
    end
    object TotalesTipoNCF: TStringField
      FieldName = 'TipoNCF'
      Size = 2
    end
    object TotalesTipoNCFIFiscal: TIntegerField
      FieldName = 'TipoNCFIFiscal'
    end
    object TotalesMontoExoneraITBIS: TCurrencyField
      FieldName = 'MontoExoneraITBIS'
    end
    object TotalesSubTotal: TCurrencyField
      FieldName = 'SubTotal'
    end
    object Totalesitbis: TCurrencyField
      FieldName = 'itbis'
    end
    object TotalesMontoITBISRecargo: TCurrencyField
      FieldName = 'MontoITBISRecargo'
    end
    object TotalesMontoItbRecItmConDesc: TCurrencyField
      FieldName = 'MontoItbRecItmConDesc'
    end
    object TotalesMontoDescGlbItbis: TCurrencyField
      FieldName = 'MontoDescGlbItbis'
    end
    object TotalesPropina: TCurrencyField
      FieldName = 'Propina'
      DisplayFormat = ',0.00'
    end
    object TotalesPropinaLegal: TCurrencyField
      FieldName = 'PropinaLegal'
      DisplayFormat = ',0.00'
    end
    object TotalesSubTotalScreen: TCurrencyField
      FieldName = 'SubTotalScreen'
    end
    object TotalesFechaIniciaPoliza: TDateTimeField
      FieldName = 'FechaIniciaPoliza'
    end
    object TotalesTipoAfiliado: TSmallintField
      FieldName = 'TipoAfiliado'
    end
    object TotalesCodigoCteDelivery: TIntegerField
      FieldName = 'CodigoCteDelivery'
    end
    object TotalesidNumeroDVeh: TIntegerField
      FieldName = 'idNumeroDVeh'
    end
    object TotalesPreAbono: TCurrencyField
      FieldName = 'PreAbono'
    end
  end
  object dsTotales: TDataSource
    DataSet = Totales
    Left = 201
    Top = 402
  end
  object DataSource2: TDataSource
    DataSet = qryProductos
    Left = 81
    Top = 377
  end
  object rxSolDatoscte: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Nombre'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Direccion1'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Direccion2'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Telefono'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Cedula'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Celular'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Sector'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Ciudad'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Apodo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OtraPersona'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ncfDescripcion'
        DataType = ftString
        Size = 60
      end>
    Left = 240
    Top = 213
    object rxSolDatoscteNombre: TStringField
      FieldName = 'Nombre'
      Size = 45
    end
    object rxSolDatoscteDireccion1: TStringField
      FieldName = 'Direccion1'
      Size = 50
    end
    object rxSolDatoscteDireccion2: TStringField
      FieldName = 'Direccion2'
      Size = 50
    end
    object rxSolDatoscteCedula: TStringField
      FieldName = 'Cedula'
      Size = 15
    end
    object rxSolDatoscteCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object rxSolDatoscteSector: TStringField
      FieldName = 'Sector'
      Size = 35
    end
    object rxSolDatoscteCiudad: TStringField
      FieldName = 'Ciudad'
      Size = 25
    end
    object rxSolDatoscteApodo: TStringField
      FieldName = 'Apodo'
    end
    object rxSolDatoscteTelefono: TStringField
      FieldName = 'Telefono'
      Size = 12
    end
    object rxSolDatoscteOtraPersona: TStringField
      FieldName = 'OtraPersona'
      Size = 45
    end
    object rxSolDatosctencfDescripcion: TStringField
      FieldName = 'ncfDescripcion'
      Size = 60
    end
  end
  object qryProdSerie: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select r.*'
      ',iif(r.STATUS_EQUIPO = 1, '#39'DISPONIBLE'#39','
      'iif(r.STATUS_EQUIPO = 2, '#39'ASIGNADO'#39','
      'iif(r.STATUS_EQUIPO = 3, '#39'RMA'#39','#39'OTRO'#39'))) DescEstatus '
      'From INVENTARIO_SERIE r'
      'Where r.Codigo=:codigo'
      'And r.status ="A"')
    Left = 712
    Top = 223
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptInput
      end>
    object qryProdSerieCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_SERIE.CODIGO'
      Required = True
    end
    object qryProdSerieSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'INVENTARIO_SERIE.SERIE'
      Required = True
      Size = 50
    end
    object qryProdSerieCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'INVENTARIO_SERIE.CODIGO_CTE'
    end
    object qryProdSerieSTATUS_EQUIPO: TSmallintField
      FieldName = 'STATUS_EQUIPO'
      Origin = 'INVENTARIO_SERIE.STATUS_EQUIPO'
    end
    object qryProdSerieDESCESTATUS: TIBStringField
      FieldName = 'DESCESTATUS'
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryProdSerieSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INVENTARIO_SERIE.STATUS'
      Size = 1
    end
  end
  object qryCliente: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryClienteAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select DISTINCT c.NOMBRE_CTE||'#39' ***'#39'||coalesce(c.DIRECCION_CONT,' +
        'coalesce(c.CIUDAD,'#39#39'))||'#39' CTE-'#39'||C.CODIGO_CTE nombreCliente, c.*' +
        ' '
      'From CLIENTES c'
      'Where c.status_cliente = '#39'A'#39
      'and c.NOMBRE_CTE is not null'
      'Order By c.NOMBRE_FACTURAR')
    Left = 249
    Top = 436
    object qryClienteCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryClienteNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryClienteNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object qryClienteNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryClienteDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryClienteTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryClienteCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryClienteRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'CLIENTES.RNC'
      Size = 12
    end
    object qryClienteRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryClienteCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryClientePRECIO_ID: TIntegerField
      FieldName = 'PRECIO_ID'
      Origin = 'CLIENTES.PRECIO_ID'
    end
    object qryClienteLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object qryClienteCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'CLIENTES.CANT_DIAS_CREDITO'
    end
    object qryClienteCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'CLIENTES.CIA_KEY'
    end
    object qryClienteUSARLEVELPRECIO: TSmallintField
      FieldName = 'USARLEVELPRECIO'
      Origin = 'CLIENTES.USARLEVELPRECIO'
    end
    object qryClienteCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'CLIENTES.COD_VENDEDOR'
    end
    object qryClienteTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Origin = 'CLIENTES.TIPO_CF'
      FixedChar = True
      Size = 2
    end
    object qryClienteNOMBRECLIENTE: TIBStringField
      FieldName = 'NOMBRECLIENTE'
      Size = 124
    end
    object qryClienteNSS: TIBStringField
      FieldName = 'NSS'
      Origin = 'CLIENTES.NSS'
      FixedChar = True
      Size = 15
    end
  end
  object dsqryCliente: TDataSource
    DataSet = qryCliente
    Left = 273
    Top = 393
  end
  object dstablaPropietario: TDataSource
    DataSet = tablaPropietario
    Left = 360
    Top = 51
  end
  object tablaPropietario: TRxMemoryData
    FieldDefs = <
      item
        Name = 'CodigoPropietario'
        DataType = ftInteger
      end>
    AfterOpen = tablaPropietarioAfterOpen
    BeforePost = tablaPropietarioBeforePost
    Left = 168
    Top = 20
    object tablaPropietarioCodigoPropietario: TIntegerField
      FieldName = 'CodigoPropietario'
    end
  end
  object stpProcBuscarUltNum: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_BUSCARULTNUMSEC'
    Left = 304
    Top = 257
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SERIE_VTA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'NUM_FACTURA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'CIAKEY'
        ParamType = ptInput
      end>
  end
  object tblDatosVentaVehiculos: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from DatosVentaVehiculo'
      'where'
      '  NUM_SERIE = :OLD_NUM_SERIE')
    InsertSQL.Strings = (
      'insert into DatosVentaVehiculo'
      '  (NUM_SERIE, MARCA, MODELO, PLACA, MONTO_INICIAL, CHASSIS)'
      'values'
      
        '  (:NUM_SERIE, :MARCA, :MODELO, :PLACA, :MONTO_INICIAL, :CHASSIS' +
        ')')
    RefreshSQL.Strings = (
      'Select '
      '  NUM_SERIE,'
      '  MARCA,'
      '  MODELO,'
      '  PLACA,'
      '  MONTO_INICIAL,'
      '  CHASSIS'
      'from DatosVentaVehiculo '
      'where'
      '  NUM_SERIE = :NUM_SERIE')
    SelectSQL.Strings = (
      'Select * From DatosVentaVehiculo'
      'Where num_serie =:numero')
    ModifySQL.Strings = (
      'update DatosVentaVehiculo'
      'set'
      '  NUM_SERIE = :NUM_SERIE,'
      '  MARCA = :MARCA,'
      '  MODELO = :MODELO,'
      '  PLACA = :PLACA,'
      '  MONTO_INICIAL = :MONTO_INICIAL,'
      '  CHASSIS = :CHASSIS'
      'where'
      '  NUM_SERIE = :OLD_NUM_SERIE')
    Left = 520
    Top = 282
    object tblDatosVentaVehiculosNUM_SERIE: TIntegerField
      FieldName = 'NUM_SERIE'
      Origin = 'DATOSVENTAVEHICULO.NUM_SERIE'
      Required = True
    end
    object tblDatosVentaVehiculosMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'DATOSVENTAVEHICULO.MARCA'
      Size = 40
    end
    object tblDatosVentaVehiculosMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'DATOSVENTAVEHICULO.MODELO'
      Size = 40
    end
    object tblDatosVentaVehiculosPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'DATOSVENTAVEHICULO.PLACA'
      Size = 40
    end
    object tblDatosVentaVehiculosMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'DATOSVENTAVEHICULO.MONTO_INICIAL'
    end
    object tblDatosVentaVehiculosCHASSIS: TIBStringField
      FieldName = 'CHASSIS'
      Origin = 'DATOSVENTAVEHICULO.CHASSIS'
    end
  end
  object tblProductoSerie: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from INVENTARIO_SERIE'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  SERIE = :OLD_SERIE and'
      '  STATUS = :OLD_STATUS')
    InsertSQL.Strings = (
      'insert into INVENTARIO_SERIE'
      '  (CODIGO, SERIE, STATUS, CODIGO_CTE, STATUS_EQUIPO)'
      'values'
      '  (:CODIGO, :SERIE, :STATUS, :CODIGO_CTE, :STATUS_EQUIPO)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  SERIE,'
      '  STATUS,'
      '  CODIGO_CTE,'
      '  STATUS_EQUIPO'
      'from INVENTARIO_SERIE '
      'where'
      '  CODIGO = :CODIGO and'
      '  SERIE = :SERIE and'
      '  STATUS = :STATUS')
    SelectSQL.Strings = (
      'Select * From INVENTARIO_SERIE'
      'Where SERIE=:codigo')
    ModifySQL.Strings = (
      'update INVENTARIO_SERIE'
      'set'
      '  CODIGO = :CODIGO,'
      '  SERIE = :SERIE,'
      '  STATUS = :STATUS,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  STATUS_EQUIPO = :STATUS_EQUIPO'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  SERIE = :OLD_SERIE and'
      '  STATUS = :OLD_STATUS')
    Left = 49
    Top = 444
    object tblProductoSerieCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_SERIE.CODIGO'
      Required = True
    end
    object tblProductoSerieSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'INVENTARIO_SERIE.SERIE'
      Required = True
      Size = 50
    end
    object tblProductoSerieSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INVENTARIO_SERIE.STATUS'
      Size = 1
    end
    object tblProductoSerieCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'INVENTARIO_SERIE.CODIGO_CTE'
    end
    object tblProductoSerieSTATUS_EQUIPO: TSmallintField
      FieldName = 'STATUS_EQUIPO'
      Origin = 'INVENTARIO_SERIE.STATUS_EQUIPO'
    end
  end
  object ibstpUpdateLote: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_UPDATE_LOTE'
    Left = 201
    Top = 348
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOTE_NUM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CANT_OUT'
        ParamType = ptInput
      end>
  end
  object ibstpProcSecuencia: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_SECUENCIA_PREVENTA'
    Left = 352
    Top = 234
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
  object stpMantInvAlmacen: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_MANT_INVENTARIO_ALMACEN'
    Left = 321
    Top = 396
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INVENTARIO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end>
  end
  object qryClasifPrecio: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select COD_PRODUCTO, PRECIO_ID, PRECIO_VENTA From CLASIF_PRECIO'
      'Where Precio_id=:precioid')
    Left = 369
    Top = 388
    ParamData = <
      item
        DataType = ftInteger
        Name = 'precioid'
        ParamType = ptInput
      end>
    object qryClasifPrecioCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'CLASIF_PRECIO.COD_PRODUCTO'
      Required = True
    end
    object qryClasifPrecioPRECIO_ID: TIntegerField
      FieldName = 'PRECIO_ID'
      Origin = 'CLASIF_PRECIO.PRECIO_ID'
      Required = True
    end
    object qryClasifPrecioPRECIO_VENTA: TFloatField
      FieldName = 'PRECIO_VENTA'
      Origin = 'CLASIF_PRECIO.PRECIO_VENTA'
    end
  end
  object ibsqlBceCxcCte: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'select balance_act '
      'from balance_Cte'
      'where codigo = :codigo')
    Transaction = dmConectar.IBTransaction1
    Left = 408
    Top = 241
  end
  object qryVence: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterClose = qryVenceAfterClose
    BeforeClose = qryVenceBeforeClose
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT p.*,  i.precio FROM '
      'PROC_DATOS_REP_INV_VENCE P, '
      'INVENTARIO_PRODUCTO i'
      'Where i.CODIGO = P.CODIGO'
      'AND ((DiasPorVencer  Between 1 and 90) or (DiasVencidos > 0))')
    Left = 312
    Top = 218
    object qryVenceCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Origin = 'PROC_DATOS_REP_INV_VENCE.CODIGO'
    end
    object qryVenceLOTE_NUM: TIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE_NUM'
      Origin = 'PROC_DATOS_REP_INV_VENCE.LOTE_NUM'
      Size = 25
    end
    object qryVenceCODIGO_PROV: TIntegerField
      DisplayLabel = 'CodProd'
      FieldName = 'CODIGO_PROV'
      Origin = 'PROC_DATOS_REP_INV_VENCE.CODIGO_PROV'
    end
    object qryVenceCANT_IN: TIntegerField
      DisplayLabel = 'CantIn'
      FieldName = 'CANT_IN'
      Origin = 'PROC_DATOS_REP_INV_VENCE.CANT_IN'
    end
    object qryVenceCANT_OUT: TIntegerField
      DisplayLabel = 'CantOut'
      FieldName = 'CANT_OUT'
      Origin = 'PROC_DATOS_REP_INV_VENCE.CANT_OUT'
    end
    object qryVenceFECHA_VENCIMIENTO: TDateTimeField
      DisplayLabel = 'Fecha Vence'
      FieldName = 'FECHA_VENCIMIENTO'
      Origin = 'PROC_DATOS_REP_INV_VENCE.FECHA_VENCIMIENTO'
    end
    object qryVenceNOMBRE_PROVEEDOR: TIBStringField
      DisplayLabel = 'Nombre Proveedor'
      FieldName = 'NOMBRE_PROVEEDOR'
      Origin = 'PROC_DATOS_REP_INV_VENCE.NOMBRE_PROVEEDOR'
      Size = 40
    end
    object qryVenceDESCRIPCION_PRODUCTO: TIBStringField
      DisplayLabel = 'Desc Producto'
      FieldName = 'DESCRIPCION_PRODUCTO'
      Origin = 'PROC_DATOS_REP_INV_VENCE.DESCRIPCION_PRODUCTO'
      Size = 40
    end
    object qryVenceCODIGO_TEXTO: TIBStringField
      DisplayLabel = 'CodTexto'
      FieldName = 'CODIGO_TEXTO'
      Origin = 'PROC_DATOS_REP_INV_VENCE.CODIGO_TEXTO'
      Size = 40
    end
    object qryVenceDIASPORVENCER: TIntegerField
      DisplayLabel = 'Dias x Vencer'
      FieldName = 'DIASPORVENCER'
      Origin = 'PROC_DATOS_REP_INV_VENCE.DIASPORVENCER'
    end
    object qryVenceDIASVENCIDOS: TIntegerField
      DisplayLabel = 'Dias Vencidos'
      FieldName = 'DIASVENCIDOS'
      Origin = 'PROC_DATOS_REP_INV_VENCE.DIASVENCIDOS'
    end
    object qryVencePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
  end
  object dsqryVence: TDataSource
    DataSet = qryVence
    Left = 688
    Top = 221
  end
  object rxqryInv: TRxMemoryData
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_TEXTO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'PRECIO'
        DataType = ftCurrency
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PAGA_ITBI'
        DataType = ftSmallint
      end
      item
        Name = 'PRECIO_MINIMO'
        DataType = ftCurrency
      end
      item
        Name = 'CANTIDAD'
        DataType = ftCurrency
      end
      item
        Name = 'INVENTARIAR'
        DataType = ftInteger
      end
      item
        Name = 'PORC_DESCUENTO'
        DataType = ftCurrency
      end
      item
        Name = 'PrecioXTipoUnidad'
        DataType = ftCurrency
      end
      item
        Name = 'TipoUnidad'
        DataType = ftInteger
      end>
    AfterScroll = rxqryInvAfterScroll
    Left = 384
    Top = 209
    object rxqryInvCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object rxqryInvCODIGO_TEXTO: TStringField
      FieldName = 'CODIGO_TEXTO'
      Size = 40
    end
    object rxqryInvDESCRIPCION: TStringField
      DisplayWidth = 80
      FieldName = 'DESCRIPCION'
      Size = 80
    end
    object rxqryInvPRECIO: TCurrencyField
      FieldName = 'PRECIO'
    end
    object rxqryInvREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 50
    end
    object rxqryInvPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
    end
    object rxqryInvPRECIO_MINIMO: TCurrencyField
      FieldName = 'PRECIO_MINIMO'
    end
    object rxqryInvCANTIDAD: TCurrencyField
      FieldName = 'CANTIDAD'
    end
    object rxqryInvINVENTARIAR: TIntegerField
      FieldName = 'INVENTARIAR'
    end
    object rxqryInvPORC_DESCUENTO: TCurrencyField
      FieldName = 'PORC_DESCUENTO'
    end
    object rxqryInvPrecioXTipoUnidad: TCurrencyField
      FieldName = 'PrecioXTipoUnidad'
    end
    object rxqryInvTipoUnidad: TIntegerField
      FieldName = 'TipoUnidad'
    end
  end
  object dsrxqryInv: TDataSource
    DataSet = rxqryInv
    Left = 432
    Top = 241
  end
  object ibsqlVerificaSerie: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Select serie_prod From VENTAS_DET'
      'Where serie_prod =:serieProd')
    Transaction = dmConectar.IBTransaction1
    Left = 712
    Top = 129
  end
  object qryPrecioXTipoUnidad: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from PRECIO_XUNIDAD'
      'where ID_PROD=:idprod')
    Left = 321
    Top = 484
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idprod'
        ParamType = ptInput
      end>
    object qryPrecioXTipoUnidadID_PROD: TIntegerField
      FieldName = 'ID_PROD'
      Origin = 'PRECIO_XUNIDAD.ID_PROD'
      Required = True
    end
    object qryPrecioXTipoUnidadID_UNIDAD: TIntegerField
      FieldName = 'ID_UNIDAD'
      Origin = 'PRECIO_XUNIDAD.ID_UNIDAD'
      Required = True
    end
    object qryPrecioXTipoUnidadPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'PRECIO_XUNIDAD.PRECIO'
    end
  end
  object DataSource3: TDataSource
    DataSet = rxVenta
    Left = 496
    Top = 201
  end
  object rxPreventa: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Serie'
        DataType = ftInteger
      end
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'ticket_id'
        DataType = ftInteger
      end
      item
        Name = 'lot_num'
        DataType = ftString
        Size = 25
      end>
    Left = 536
    Top = 396
    object rxPreventaSerie: TIntegerField
      FieldName = 'Serie'
    end
    object rxPreventaNumero: TIntegerField
      FieldName = 'Numero'
    end
    object rxPreventaticket_id: TIntegerField
      FieldName = 'ticket_id'
    end
    object rxPreventalot_num: TStringField
      FieldName = 'lot_num'
      Size = 25
    end
  end
  object ibsqlDeletePreventaDet: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Delete from VENTAS_DET_PREVENTA'
      'where numero=:numero')
    Transaction = dmConectar.IBTransaction1
    Left = 441
    Top = 228
  end
  object ibsqlDeletePreventaMaster: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Delete from VENTAS_mast_PREVENTA'
      'where numero=:numero')
    Transaction = dmConectar.IBTransaction1
    Left = 305
    Top = 460
  end
  object tblRecovertrans: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from VENTAS_DET_RECOVER'
      'where'
      '  ID = :OLD_ID and'
      '  SERIE = :OLD_SERIE and'
      '  FECHA = :OLD_FECHA')
    InsertSQL.Strings = (
      'insert into VENTAS_DET_RECOVER'
      
        '  (ID, SERIE, FECHA, NUMERO, CODIGO_PROD, CODIGO_BARRA, DESCRIPC' +
        'ION, CANTIDAD, '
      
        '   PRECIO, PORC_DESC_DET, ITBI_DET, VALOR_SERVICIO_DET, VALOR_TO' +
        'TAL_DET, '
      
        '   NUM_FACTURA, STATUS_DET, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR' +
        ', CANT_REGRESO, '
      
        '   CANT_PROMO, MONTO_DIETA, MONTO_AJUSTE, SERIE_PROD, STATUS_CNT' +
        ', TIPO_UNIDAD, '
      
        '   ITBIS_EXENTO, TIPO_VENTA, DESCRIPCIONPRODUCTO, TIPO_OPE, PREC' +
        'IO_LEVEL, '
      '   COD_USUARIO)'
      'values'
      
        '  (:ID, :SERIE, :FECHA, :NUMERO, :CODIGO_PROD, :CODIGO_BARRA, :D' +
        'ESCRIPCION, '
      
        '   :CANTIDAD, :PRECIO, :PORC_DESC_DET, :ITBI_DET, :VALOR_SERVICI' +
        'O_DET, '
      
        '   :VALOR_TOTAL_DET, :NUM_FACTURA, :STATUS_DET, :FECHA_IN, :IN_P' +
        'OR, :FECHA_MOD, '
      
        '   :MOD_POR, :CANT_REGRESO, :CANT_PROMO, :MONTO_DIETA, :MONTO_AJ' +
        'USTE, :SERIE_PROD, '
      
        '   :STATUS_CNT, :TIPO_UNIDAD, :ITBIS_EXENTO, :TIPO_VENTA, :DESCR' +
        'IPCIONPRODUCTO, '
      '   :TIPO_OPE, :PRECIO_LEVEL, :COD_USUARIO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  SERIE,'
      '  FECHA,'
      '  NUMERO,'
      '  CODIGO_PROD,'
      '  CODIGO_BARRA,'
      '  DESCRIPCION,'
      '  CANTIDAD,'
      '  PRECIO,'
      '  PORC_DESC_DET,'
      '  ITBI_DET,'
      '  VALOR_SERVICIO_DET,'
      '  VALOR_TOTAL_DET,'
      '  NUM_FACTURA,'
      '  STATUS_DET,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  CANT_REGRESO,'
      '  CANT_PROMO,'
      '  MONTO_DIETA,'
      '  MONTO_AJUSTE,'
      '  SERIE_PROD,'
      '  STATUS_CNT,'
      '  TIPO_UNIDAD,'
      '  ITBIS_EXENTO,'
      '  TIPO_VENTA,'
      '  DESCRIPCIONPRODUCTO,'
      '  TIPO_OPE,'
      '  PRECIO_LEVEL,'
      '  COD_USUARIO'
      'from VENTAS_DET_RECOVER '
      'where'
      '  ID = :ID and'
      '  SERIE = :SERIE and'
      '  FECHA = :FECHA')
    SelectSQL.Strings = (
      'SELECT * FROM VENTAS_DET_RECOVER'
      'WHERE STATUS_det = '#39'A'#39)
    ModifySQL.Strings = (
      'update VENTAS_DET_RECOVER'
      'set'
      '  ID = :ID,'
      '  SERIE = :SERIE,'
      '  FECHA = :FECHA,'
      '  NUMERO = :NUMERO,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  CODIGO_BARRA = :CODIGO_BARRA,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO = :PRECIO,'
      '  PORC_DESC_DET = :PORC_DESC_DET,'
      '  ITBI_DET = :ITBI_DET,'
      '  VALOR_SERVICIO_DET = :VALOR_SERVICIO_DET,'
      '  VALOR_TOTAL_DET = :VALOR_TOTAL_DET,'
      '  NUM_FACTURA = :NUM_FACTURA,'
      '  STATUS_DET = :STATUS_DET,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  CANT_REGRESO = :CANT_REGRESO,'
      '  CANT_PROMO = :CANT_PROMO,'
      '  MONTO_DIETA = :MONTO_DIETA,'
      '  MONTO_AJUSTE = :MONTO_AJUSTE,'
      '  SERIE_PROD = :SERIE_PROD,'
      '  STATUS_CNT = :STATUS_CNT,'
      '  TIPO_UNIDAD = :TIPO_UNIDAD,'
      '  ITBIS_EXENTO = :ITBIS_EXENTO,'
      '  TIPO_VENTA = :TIPO_VENTA,'
      '  DESCRIPCIONPRODUCTO = :DESCRIPCIONPRODUCTO,'
      '  TIPO_OPE = :TIPO_OPE,'
      '  PRECIO_LEVEL = :PRECIO_LEVEL,'
      '  COD_USUARIO = :COD_USUARIO'
      'where'
      '  ID = :OLD_ID and'
      '  SERIE = :OLD_SERIE and'
      '  FECHA = :OLD_FECHA')
    GeneratorField.Field = 'id'
    GeneratorField.Generator = 'VENTASDET_RECOVERID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 576
    Top = 107
    object tblRecovertransSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET_RECOVER.SERIE'
      Required = True
    end
    object tblRecovertransFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_DET_RECOVER.FECHA'
      Required = True
    end
    object tblRecovertransNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_DET_RECOVER.NUMERO'
      Required = True
    end
    object tblRecovertransCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET_RECOVER.CODIGO_PROD'
      Size = 40
    end
    object tblRecovertransCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VENTAS_DET_RECOVER.CODIGO_BARRA'
    end
    object tblRecovertransDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET_RECOVER.DESCRIPCION'
      Size = 60
    end
    object tblRecovertransCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET_RECOVER.CANTIDAD'
    end
    object tblRecovertransPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET_RECOVER.PRECIO'
    end
    object tblRecovertransPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET_RECOVER.PORC_DESC_DET'
    end
    object tblRecovertransITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET_RECOVER.ITBI_DET'
    end
    object tblRecovertransVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET_RECOVER.VALOR_SERVICIO_DET'
    end
    object tblRecovertransVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_DET_RECOVER.VALOR_TOTAL_DET'
    end
    object tblRecovertransNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VENTAS_DET_RECOVER.NUM_FACTURA'
    end
    object tblRecovertransSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET_RECOVER.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object tblRecovertransFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_DET_RECOVER.FECHA_IN'
    end
    object tblRecovertransIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_DET_RECOVER.IN_POR'
      Size = 12
    end
    object tblRecovertransFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_DET_RECOVER.FECHA_MOD'
    end
    object tblRecovertransMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_DET_RECOVER.MOD_POR'
      Size = 12
    end
    object tblRecovertransCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VENTAS_DET_RECOVER.CANT_REGRESO'
    end
    object tblRecovertransCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VENTAS_DET_RECOVER.CANT_PROMO'
    end
    object tblRecovertransMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VENTAS_DET_RECOVER.MONTO_DIETA'
    end
    object tblRecovertransMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VENTAS_DET_RECOVER.MONTO_AJUSTE'
    end
    object tblRecovertransSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VENTAS_DET_RECOVER.SERIE_PROD'
      Size = 50
    end
    object tblRecovertransSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VENTAS_DET_RECOVER.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object tblRecovertransTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VENTAS_DET_RECOVER.TIPO_UNIDAD'
    end
    object tblRecovertransITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VENTAS_DET_RECOVER.ITBIS_EXENTO'
    end
    object tblRecovertransTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VENTAS_DET_RECOVER.TIPO_VENTA'
    end
    object tblRecovertransDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VENTAS_DET_RECOVER.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object tblRecovertransTIPO_OPE: TSmallintField
      FieldName = 'TIPO_OPE'
      Origin = 'VENTAS_DET_RECOVER.TIPO_OPE'
    end
    object tblRecovertransPRECIO_LEVEL: TSmallintField
      FieldName = 'PRECIO_LEVEL'
      Origin = 'VENTAS_DET_RECOVER.PRECIO_LEVEL'
    end
    object tblRecovertransID: TIntegerField
      FieldName = 'ID'
      Origin = 'VENTAS_DET_RECOVER.ID'
    end
    object tblRecovertransCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'VENTAS_DET_RECOVER.COD_USUARIO'
    end
  end
  object ibsqlGetPorcDescFctSvr: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      '    SELECT '
      '      c.TIPO,'
      '      c.DESCRIPCION,'
      '      c.PORCIENTO,'
      '      c.FORMULA,'
      '      c.STATUS'
      '    FROM'
      '      CONF_DESC_FACTURAS c'
      'Where c.tipo=:tipo')
    Transaction = dmConectar.IBTransaction1
    Left = 433
    Top = 483
  end
  object qryProdPorProveedor: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Proc_getprecioproveedor(:codigoProd,:ciakey)'
      'Order By fecha desc')
    Left = 497
    Top = 339
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoProd'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ciakey'
        ParamType = ptInput
      end>
    object qryProdPorProveedorFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_GETPRECIOPROVEEDOR.FECHA'
    end
    object qryProdPorProveedorCODIGO_PROV: TSmallintField
      FieldName = 'CODIGO_PROV'
      Origin = 'PROC_GETPRECIOPROVEEDOR.CODIGO_PROV'
    end
    object qryProdPorProveedorNOMBREPROVEEDOR: TIBStringField
      DisplayWidth = 80
      FieldName = 'NOMBREPROVEEDOR'
      Origin = 'PROC_GETPRECIOPROVEEDOR.NOMBREPROVEEDOR'
      Size = 80
    end
    object qryProdPorProveedorPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'PROC_GETPRECIOPROVEEDOR.PRECIO'
      DisplayFormat = ',0.00'
    end
    object qryProdPorProveedorTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROC_GETPRECIOPROVEEDOR.TELEFONO'
      Size = 12
    end
    object qryProdPorProveedorEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'PROC_GETPRECIOPROVEEDOR.EMAIL'
      Size = 40
    end
  end
  object dsqryProdPorProveedor: TDataSource
    DataSet = qryProdPorProveedor
    Left = 145
    Top = 499
  end
  object ibStpInsertVentaDet: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INS_VENTAS_DET_PREVENTA'
    Left = 473
    Top = 419
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_BARRA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRIPCION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ITBI_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_SERVICIO_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTAL_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUM_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS_DET'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANT_REGRESO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANT_PROMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DIETA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_AJUSTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SERIE_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_UNIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOTE_NUM'
        ParamType = ptInput
      end>
  end
  object stpUpdateVentaDetU1: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_UPDATEVENTAS_DET_U1'
    Left = 129
    Top = 395
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SERIE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_BARRA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRIPCION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ITBI_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_SERVICIO_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTAL_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUM_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS_DET'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANT_REGRESO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANT_PROMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DIETA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_AJUSTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SERIE_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS_CNT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_UNIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ITBIS_EXENTO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_VENTA'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'DESCRIPCIONPRODUCTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO_COMPRA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DESC_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ITBIS_FISCAL_DET'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTASAITBIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTOIBISRECARGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_TASA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANT_VIAJES'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DC_ITBIS_CLD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TC_MONTOITBISRECARGO_GLB'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TC_MONTOITBISRECARGO_ITM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_VENDEDOR'
        ParamType = ptInput
      end>
  end
  object stpProc_UpdateVENTAS_MAST_U1: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'Proc_UpdateVENTAS_MAST_U1'
    Left = 193
    Top = 467
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'FORMA_PAGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTAL_DET'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO_DOC_PAGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SERIE_NCF_ASIGNADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_BRUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORC_DESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMBRE_CLIENTE_GENERAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_PAGADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_CAMBIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_TOTAL_ITBIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCGASTOSADMIN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCITBISGASTOSADMIN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCTRANSP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCDIRTECNICA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCITBISDIRTECNICA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCIMPREVISTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCITBISIMPREVISTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMENTARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COTIZACION_ORIGEN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_RECARGO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_EXONERADO_ITBIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PROPINA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORCPROPINALEGAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PROPINALEGAL'
        ParamType = ptInput
      end>
  end
  object stpProcUpdateFactU1: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'proc_updateFACTURAS_U1'
    Left = 145
    Top = 243
    ParamData = <
      item
        DataType = ftFloat
        Name = 'SERIE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRIPCION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_FACT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RCXC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'RCNT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_VENCE'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'APLICA_TIPODESC'
        ParamType = ptInput
      end>
  end
  object stpProcUpdateTrnCxcU1: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_TRANS_CXC_U1'
    Left = 176
    Top = 169
    ParamData = <
      item
        DataType = ftFloat
        Name = 'SERIE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_DOC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_DOC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_SERV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CONCEPTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_DOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_TRN_VENTA'
        ParamType = ptInput
      end>
  end
  object stpProcUpdateBlcCteCxc: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'Proc_BALANCE_CTE_U1'
    Left = 457
    Top = 387
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'TIPOACCION'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SERVICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'BALANCE_ACT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'BALANCE_ANT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DEBITO_MES'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DEBITO_ACM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end>
  end
  object stpProcUpdateFActPendu1: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_FACTURAS_PENDIENTES_U1'
    Left = 449
    Top = 455
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_FACT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_PENDIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end>
  end
  object ibstpUpdateCotizaMaster: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_UPDATE_COTIZACION_MAST'
    Left = 552
    Top = 177
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO_TRNS'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_VENCE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'NUMERO_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUMERO_DOC_PAGO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'SERIE_NCF_ASIGNADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_BRUTO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'PORC_DESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMBRE_CLIENTE_GENERAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_PAGADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_CAMBIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_TOTAL_ITBIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCGASTOSADMIN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCITBISGASTOSADMIN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCTRANSP'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCDIRTECNICA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCITBISDIRTECNICA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCIMPREVISTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCITBISIMPREVISTO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'APLICA_TIPODESC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_COTIZA'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'COMENTARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REFERENCIACTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_RECARGO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TIPONCFIFISCAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_EXONERADO_ITBIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORCPROPINALEGAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PROPINA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PROPINALEGAL'
        ParamType = ptInput
      end>
  end
  object stpProcUpdteCotDet: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_UPDTE_COTIZACION_DET'
    Left = 400
    Top = 300
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SERIE_TRNS'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_BARRA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRIPCION'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'DESCRIPCIONESPECIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ITBI_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_SERVICIO_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTAL_DET'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS_DET'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_UNIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ITBIS_EXENTO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_VENTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SERIE_COTIZA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DESC_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_TASA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDTASAITBIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANT_VIAJES'
        ParamType = ptInput
      end>
  end
  object ibsqlDeleteSerieCotizaDet: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Delete From COTIZACION_DET'
      'Where SERIE =:serie'
      'And numero =:numero')
    Transaction = dmConectar.IBTransaction1
    Left = 464
    Top = 520
  end
  object tblMoneda: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblMonedaAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'MONEDA'
    Left = 800
    Top = 212
    object tblMonedaCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Size = 1
    end
    object tblMonedaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 15
    end
    object tblMonedaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
    end
    object tblMonedaFECHA_UPCAMPO_FECHA_HORA: TDateTimeField
      FieldName = 'FECHA_UPCAMPO_FECHA_HORA'
    end
    object tblMonedaMODIFICADO_POR: TIBStringField
      FieldName = 'MODIFICADO_POR'
      Size = 12
    end
    object tblMonedaSIMBOLO: TIBStringField
      FieldName = 'SIMBOLO'
      Size = 6
    end
  end
  object dstblMoneda: TDataSource
    DataSet = tblMoneda
    Left = 648
    Top = 204
  end
  object qryInvRutaImg: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select CODIGO, CODIGO_BARRA, CODIGO_TEXTO,'
      'RUTAIMAGEN'
      'From INVENTARIO_PRODUCTO'
      'Where CIA_KEY =:ciakey'
      'And codigo=:codigo')
    Left = 841
    Top = 123
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ciakey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end>
    object qryInvRutaImgCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInvRutaImgCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
    object qryInvRutaImgCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryInvRutaImgRUTAIMAGEN: TIBStringField
      FieldName = 'RUTAIMAGEN'
      Origin = 'INVENTARIO_PRODUCTO.RUTAIMAGEN'
      Size = 200
    end
  end
  object QryPrecios: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select codigo, PRECIOVENTA1, PRECIOVENTA2, PRECIOVENTA3, PRECIOV' +
        'ENTA4 '
      'FROM INVENTARIO_PRODUCTO i'
      'Where i.codigo =:codigo')
    Left = 880
    Top = 201
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end>
    object QryPreciosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object QryPreciosPRECIOVENTA1: TFloatField
      FieldName = 'PRECIOVENTA1'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA1'
    end
    object QryPreciosPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA2'
    end
    object QryPreciosPRECIOVENTA3: TFloatField
      FieldName = 'PRECIOVENTA3'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA3'
    end
    object QryPreciosPRECIOVENTA4: TFloatField
      FieldName = 'PRECIOVENTA4'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA4'
    end
  end
  object DSQryPrecios: TDataSource
    DataSet = QryPrecios
    Left = 824
    Top = 229
  end
  object rxPagos: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Serie'
        DataType = ftInteger
      end>
    Left = 513
    Top = 457
    object rxPagosSerie: TIntegerField
      FieldName = 'Serie'
    end
  end
  object ibslqlUpdatetrnpagos: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Update detalle_pagos '
      'Set serie_trn =:seriemaster'
      'Where serie =:serie')
    Transaction = dmConectar.IBTransaction1
    Left = 216
    Top = 263
  end
  object stpProcRecDatosReimpfiscal: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_RECTRANSVENTAFISCAL'
    Left = 448
    Top = 274
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROTRN_OUT'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'NUMEROTRN'
        ParamType = ptInput
      end>
  end
  object qryVerificaReciboPdte: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select r.nif_impreso, r.numero, r.forma_pago, r.numero_factura, ' +
        'r.numero_doc_pago'
      'From Ventas_mast  r'
      'Where (r.nif_impreso Is Null OR r.nif_impreso = 0)'
      '--And r.numero >= 899')
    Left = 744
    Top = 242
    object qryVerificaReciboPdteNIF_IMPRESO: TSmallintField
      FieldName = 'NIF_IMPRESO'
      Origin = 'VENTAS_MAST.NIF_IMPRESO'
    end
    object qryVerificaReciboPdteNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryVerificaReciboPdteFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VENTAS_MAST.FORMA_PAGO'
    end
    object qryVerificaReciboPdteNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST.NUMERO_FACTURA'
    end
    object qryVerificaReciboPdteNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VENTAS_MAST.NUMERO_DOC_PAGO'
    end
  end
  object ibStpInsertCotizaDet: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INS_COTIZACION_DET'
    Left = 424
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SERIE_TRNS'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO_BARRA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRIPCION'
        ParamType = ptInput
      end
      item
        DataType = ftBlob
        Name = 'DESCRIPCIONESPECIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ITBI_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_SERVICIO_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTAL_DET'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS_DET'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_UNIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ITBIS_EXENTO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_VENTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DESC_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_TASA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDTASAITBIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANT_VIAJES'
        ParamType = ptInput
      end>
  end
  object tblnif_ctrl: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from NIF_CTRL'
      'where'
      '  NUMERO_TRN = :OLD_NUMERO_TRN and'
      '  NIF = :OLD_NIF')
    InsertSQL.Strings = (
      'insert into NIF_CTRL'
      '  (NUMERO_TRN, NIF, FECHA_IN, FECHA_UPDATE, STATUS)'
      'values'
      '  (:NUMERO_TRN, :NIF, :FECHA_IN, :FECHA_UPDATE, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_TRN,'
      '  NIF,'
      '  FECHA_IN,'
      '  FECHA_UPDATE,'
      '  STATUS'
      'from NIF_CTRL '
      'where'
      '  NUMERO_TRN = :NUMERO_TRN and'
      '  NIF = :NIF')
    SelectSQL.Strings = (
      'Select * From NIF_CTRL'
      'Where numero_trn=:numero')
    ModifySQL.Strings = (
      'update NIF_CTRL'
      'set'
      '  NUMERO_TRN = :NUMERO_TRN,'
      '  NIF = :NIF,'
      '  FECHA_IN = :FECHA_IN,'
      '  FECHA_UPDATE = :FECHA_UPDATE,'
      '  STATUS = :STATUS'
      'where'
      '  NUMERO_TRN = :OLD_NUMERO_TRN and'
      '  NIF = :OLD_NIF')
    Left = 80
    Top = 528
    object tblnif_ctrlNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'NIF_CTRL.NUMERO_TRN'
      Required = True
    end
    object tblnif_ctrlNIF: TIBStringField
      FieldName = 'NIF'
      Origin = 'NIF_CTRL.NIF'
      Size = 16
    end
    object tblnif_ctrlFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'NIF_CTRL.FECHA_IN'
    end
    object tblnif_ctrlFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'NIF_CTRL.FECHA_UPDATE'
    end
    object tblnif_ctrlSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'NIF_CTRL.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 886
    Top = 249
    object VerDetalleVenta1: TMenuItem
      Caption = 'Ver Detalle Venta'
    end
  end
  object IBQuery1: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 440
    Top = 320
  end
  object PopupMenu3: TPopupMenu
    Left = 856
    Top = 128
    object VerTipoComprobantes1: TMenuItem
      Caption = 'Ver Tipo Comprobantes'
      OnClick = VerTipoComprobantes1Click
    end
  end
  object updTipoRetencionVta: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'UPDATE VENTAS_MAST r'
      'Set r. IDRETENCION =:idretencion'
      'Where  r.numero =:numero'
      '')
    Transaction = dmConectar.IBTransaction1
    Left = 377
    Top = 436
  end
  object qryCheckDetVta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select Count(Cantidad) Cant, numero From VENTAS_DET '
      'Where numero=:numero'
      'Group by numero')
    Left = 168
    Top = 552
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
  end
  object dsqryPrecioUnidadSurt: TDataSource
    DataSet = dmVentas.qryPrecioUnidadSurt
    Left = 664
    Top = 432
  end
  object qryValidaVta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From POS_EXTRA_DET'
      'Where numero =:numero;')
    Left = 232
    Top = 536
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
  end
  object rxBckVta: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Serie'
        DataType = ftInteger
      end
      item
        Name = 'Fecha'
        DataType = ftDateTime
      end
      item
        Name = 'Cant'
        DataType = ftFloat
      end
      item
        Name = 'Precio'
        DataType = ftCurrency
      end
      item
        Name = 'CodArticulo'
        DataType = ftInteger
      end
      item
        Name = 'Dup'
        DataType = ftInteger
      end>
    Left = 169
    Top = 100
    object rxBckVtaSerie: TIntegerField
      FieldName = 'Serie'
    end
    object rxBckVtaFecha: TDateTimeField
      FieldName = 'Fecha'
    end
    object rxBckVtaCant: TFloatField
      FieldName = 'Cant'
    end
    object rxBckVtaPrecio: TCurrencyField
      FieldName = 'Precio'
    end
    object rxBckVtaCodArticulo: TIntegerField
      FieldName = 'CodArticulo'
    end
    object rxBckVtaDup: TIntegerField
      FieldName = 'Dup'
    end
  end
  object rxOfertas: TRxMemoryData
    FieldDefs = <
      item
        Name = 'serie'
        DataType = ftInteger
      end
      item
        Name = 'codProd'
        DataType = ftInteger
      end
      item
        Name = 'cant'
        DataType = ftCurrency
      end
      item
        Name = 'tipoUnidadVta'
        DataType = ftInteger
      end
      item
        Name = 'cant_tipound'
        DataType = ftCurrency
      end>
    Left = 232
    Top = 104
    object rxOfertasserie: TIntegerField
      FieldName = 'serie'
    end
    object rxOfertascodProd: TIntegerField
      FieldName = 'codProd'
    end
    object rxOfertascant: TCurrencyField
      FieldName = 'cant'
    end
    object rxOfertastipoUnidadVta: TIntegerField
      FieldName = 'tipoUnidadVta'
    end
    object rxOfertascant_tipound: TCurrencyField
      FieldName = 'cant_tipound'
    end
  end
  object qryEmpleado: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select c.NOMBRE desc_cargo,e.nombre||'#39' '#39'||e.apellido nombrevende' +
        'dor , e.* From EMPLEADO e'
      'inner join CARGO_EMPLEADOS c on c.CODIGO = e.CARGO'
      'where upper(c.NOMBRE) = '#39'VENDEDOR'#39)
    Left = 536
    Top = 568
    object qryEmpleadoNOMBREVENDEDOR: TIBStringField
      FieldName = 'NOMBREVENDEDOR'
      Size = 71
    end
    object qryEmpleadoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMPLEADO.CODIGO'
      Required = True
    end
  end
  object dsqryEmpleado: TDataSource
    DataSet = qryEmpleado
    Left = 616
    Top = 592
  end
  object rxDataAnt: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Serie'
        DataType = ftInteger
      end
      item
        Name = 'Cant'
        DataType = ftCurrency
      end
      item
        Name = 'CodigoProd'
        DataType = ftInteger
      end
      item
        Name = 'CantNueva'
        DataType = ftCurrency
      end
      item
        Name = 'CantFinal'
        DataType = ftCurrency
      end>
    Left = 776
    Top = 584
    object rxDataAntSerie: TIntegerField
      FieldName = 'Serie'
    end
    object rxDataAntCant: TCurrencyField
      FieldName = 'Cant'
    end
    object rxDataAntCodigoProd: TIntegerField
      FieldName = 'CodigoProd'
    end
    object rxDataAntCantNueva: TCurrencyField
      FieldName = 'CantNueva'
    end
    object rxDataAntCantFinal: TCurrencyField
      FieldName = 'CantFinal'
    end
  end
  object dsrxDataAnt: TDataSource
    DataSet = rxDataAnt
    Left = 856
    Top = 352
  end
  object dsqryVehiculos: TDataSource
    DataSet = qryVehiculos
    Left = 328
    Top = 214
  end
  object qryVehiculos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select Ficha, FICHA||'#39'-'#39'||PLACA||'#39'-'#39'||rotulo Placa from VEHICULO')
    Left = 336
    Top = 270
    object qryVehiculosFICHA: TIntegerField
      FieldName = 'FICHA'
      Origin = 'VEHICULO.FICHA'
      Required = True
    end
    object qryVehiculosPLACA: TIBStringField
      FieldName = 'PLACA'
      Size = 32
    end
  end
  object qryCteTieneVta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  VALOR_TOTAL_DET From VENTAS_MAST'
      'where CODIGO_CTE=:codigocte '
      'and fecha=:fecha'
      'and status = '#39'A'#39
      '')
    Left = 232
    Top = 584
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigocte'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end>
    object qryCteTieneVtaVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST.VALOR_TOTAL_DET'
    end
  end
  object qryValidaPosExtra: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select  sum(d.D_CANT * d.D_PRECIO) - Sum(iif(d.DC_MONTODESCITEM ' +
        'is null,0,d.DC_MONTODESCITEM)) valor'
      'From POS_EXTRA_DET d '
      'Where d.NUMERO =:numero')
    Left = 624
    Top = 504
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryValidaPosExtraVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object rxCobertura: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'IDARS'
        DataType = ftInteger
      end
      item
        Name = 'Num_Autorizacion'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Nombre_Medico'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Exequatur'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Especialidad'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Diagnostico'
        DataType = ftMemo
      end
      item
        Name = 'MontoCobertura'
        DataType = ftCurrency
      end
      item
        Name = 'Afiliado'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PorcDescuento'
        DataType = ftCurrency
      end
      item
        Name = 'AplicaDesc'
        DataType = ftFloat
      end
      item
        Name = 'MontoAsegurado'
        DataType = ftCurrency
      end
      item
        Name = 'MontoTotal'
        DataType = ftCurrency
      end
      item
        Name = 'Codigo_Cliente'
        DataType = ftInteger
      end>
    Left = 566
    Top = 241
    object rxCoberturaNumero: TIntegerField
      FieldName = 'Numero'
    end
    object rxCoberturaIDARS: TIntegerField
      FieldName = 'IDARS'
    end
    object rxCoberturaNum_Autorizacion: TStringField
      FieldName = 'Num_Autorizacion'
      Required = True
      Size = 40
    end
    object rxCoberturaNombre_Medico: TStringField
      FieldName = 'Nombre_Medico'
      Size = 60
    end
    object rxCoberturaExequatur: TStringField
      FieldName = 'Exequatur'
      Size = 12
    end
    object rxCoberturaEspecialidad: TStringField
      FieldName = 'Especialidad'
      Size = 40
    end
    object rxCoberturaDiagnostico: TMemoField
      FieldName = 'Diagnostico'
      BlobType = ftMemo
    end
    object rxCoberturaMontoCobertura: TCurrencyField
      FieldName = 'MontoCobertura'
      Required = True
      OnChange = rxCoberturaMontoCoberturaChange
    end
    object rxCoberturaAfiliado: TStringField
      FieldName = 'Afiliado'
      Required = True
    end
    object rxCoberturaPorcDescuento: TCurrencyField
      FieldName = 'PorcDescuento'
    end
    object rxCoberturaMontoAsegurado: TCurrencyField
      FieldName = 'MontoAsegurado'
    end
    object rxCoberturaMontoTotal: TCurrencyField
      FieldName = 'MontoTotal'
    end
    object rxCoberturaCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object rxCoberturaAplicaDesc: TFloatField
      FieldName = 'AplicaDesc'
      DisplayFormat = ',0.00'
    end
  end
  object qryChequeaSec: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '#39'CONTADO'#39', '
      
        'iif((SeLECT MAX(CAST(R.NUMERO_DOC_PAGO AS INTEGER)) From VENTAS_' +
        'MAST r) <= '
      
        '(SELECT r.secuencia  FROM SECUENCIA R where r.tipo = 1),1,0) SEC' +
        '_CACH,'
      
        '(SELECT r.secuencia  FROM SECUENCIA R where r.tipo = 1) secuenci' +
        'a,'
      ''
      
        '(SeLECT MAX(CAST(R.NUMERO_DOC_PAGO AS INTEGER)) From VENTAS_MAST' +
        ' r) ultimo_numCashGenerado,'
      
        ' '#39'FACTURA'#39', iif((SeLECT MAX(CAST(R.NUMERO_FACTURA AS INTEGER)) F' +
        'rom VENTAS_MAST r)<= '
      
        '(SELECT GEN_ID(GEN_NUM_FACTURA,0)  FROM RDB$DATABASE),1,0) SEC_C' +
        'REDITO,'
      ''
      
        '(SELECT GEN_ID(GEN_NUM_FACTURA,0)  FROM RDB$DATABASE) GEN_NUM_FA' +
        'CTURA,'
      ''
      
        '(SeLECT MAX(R.NUMERO_FACTURA) From VENTAS_MAST r) ultimo_numfACT' +
        'URAGenerado'
      ',(SeLECT MAX(R.numero) From VENTAS_MAST r) max_numero_master '
      'from'
      'RDB$DATABASE')
    Left = 512
    Top = 504
    object qryChequeaSecCONSTANT: TIBStringField
      FieldName = 'CONSTANT'
      Required = True
      FixedChar = True
      Size = 7
    end
    object qryChequeaSecSEC_CACH: TIntegerField
      FieldName = 'SEC_CACH'
      Required = True
    end
    object qryChequeaSecSECUENCIA: TIntegerField
      FieldName = 'SECUENCIA'
    end
    object qryChequeaSecULTIMO_NUMCASHGENERADO: TIntegerField
      FieldName = 'ULTIMO_NUMCASHGENERADO'
    end
    object qryChequeaSecCONSTANT1: TIBStringField
      FieldName = 'CONSTANT1'
      Required = True
      FixedChar = True
      Size = 7
    end
    object qryChequeaSecSEC_CREDITO: TIntegerField
      FieldName = 'SEC_CREDITO'
      Required = True
    end
    object qryChequeaSecGEN_NUM_FACTURA: TIntegerField
      FieldName = 'GEN_NUM_FACTURA'
    end
    object qryChequeaSecULTIMO_NUMFACTURAGENERADO: TIntegerField
      FieldName = 'ULTIMO_NUMFACTURAGENERADO'
    end
    object qryChequeaSecMAX_NUMERO_MASTER: TIntegerField
      FieldName = 'MAX_NUMERO_MASTER'
    end
  end
  object rxCertificados: TRxMemoryData
    FieldDefs = <
      item
        Name = 'CodigoCte'
        DataType = ftInteger
      end
      item
        Name = 'NumeroCerf'
        DataType = ftInteger
      end>
    Left = 88
    Top = 584
    object rxCertificadosCodigoCte: TIntegerField
      FieldName = 'CodigoCte'
    end
    object rxCertificadosNumeroCerf: TIntegerField
      FieldName = 'NumeroCerf'
    end
  end
  object tblPolizaCte: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from polizas_clientes'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE and'
      '  NUM_POL = :OLD_NUM_POL')
    InsertSQL.Strings = (
      'insert into polizas_clientes'
      '  (CODIGO_CTE, NUM_POL, STATUSCXC, STATUS)'
      'values'
      '  (:CODIGO_CTE, :NUM_POL, :STATUSCXC, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_CTE,'
      '  NUM_POL,'
      '  STATUSCXC,'
      '  STATUS'
      'from polizas_clientes '
      'where'
      '  CODIGO_CTE = :CODIGO_CTE and'
      '  NUM_POL = :NUM_POL')
    SelectSQL.Strings = (
      'Select * from polizas_clientes')
    ModifySQL.Strings = (
      'update polizas_clientes'
      'set'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  NUM_POL = :NUM_POL,'
      '  STATUSCXC = :STATUSCXC,'
      '  STATUS = :STATUS'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE and'
      '  NUM_POL = :OLD_NUM_POL')
    Left = 584
    Top = 344
    object tblPolizaCteCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'POLIZAS_CLIENTES.CODIGO_CTE'
      Required = True
    end
    object tblPolizaCteNUM_POL: TIntegerField
      FieldName = 'NUM_POL'
      Origin = 'POLIZAS_CLIENTES.NUM_POL'
      Required = True
    end
    object tblPolizaCteSTATUSCXC: TIBStringField
      FieldName = 'STATUSCXC'
      Origin = 'POLIZAS_CLIENTES.STATUSCXC'
      FixedChar = True
      Size = 1
    end
    object tblPolizaCteSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'POLIZAS_CLIENTES.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryLogoTipoAfiliado: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select f.IDTIPO, l.RUTA_LOGO, f.DESCRIPCION from TIPO_AFILIADO f'
      'inner join logo_servicio l on l.TIPO_AFILIADO = f.IDTIPO')
    Left = 49
    Top = 232
    object qryLogoTipoAfiliadoIDTIPO: TIntegerField
      FieldName = 'IDTIPO'
      Origin = 'TIPO_AFILIADO.IDTIPO'
      Required = True
    end
    object qryLogoTipoAfiliadoRUTA_LOGO: TIBStringField
      FieldName = 'RUTA_LOGO'
      Origin = 'LOGO_SERVICIO.RUTA_LOGO'
      Size = 80
    end
    object qryLogoTipoAfiliadoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_AFILIADO.DESCRIPCION'
      Size = 80
    end
  end
  object tblClienteDeliveryTrn: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CLIENTES_DELIVERY_TRN_PREV'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  NUMERO_TRN = :OLD_NUMERO_TRN')
    InsertSQL.Strings = (
      'insert into CLIENTES_DELIVERY_TRN_PREV'
      '  (CODIGO, NUMERO_TRN)'
      'values'
      '  (:CODIGO, :NUMERO_TRN)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  NUMERO_TRN'
      'from CLIENTES_DELIVERY_TRN_PREV '
      'where'
      '  CODIGO = :CODIGO and'
      '  NUMERO_TRN = :NUMERO_TRN')
    SelectSQL.Strings = (
      'Select * from CLIENTES_DELIVERY_TRN_PREV'
      'where codigo=:codigo')
    ModifySQL.Strings = (
      'update CLIENTES_DELIVERY_TRN_PREV'
      'set'
      '  CODIGO = :CODIGO,'
      '  NUMERO_TRN = :NUMERO_TRN'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  NUMERO_TRN = :OLD_NUMERO_TRN')
    Left = 520
    Top = 336
    object tblClienteDeliveryTrnCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CLIENTES_DELIVERY_TRN.CODIGO'
      Required = True
    end
    object tblClienteDeliveryTrnNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'CLIENTES_DELIVERY_TRN.NUMERO_TRN'
    end
  end
  object qryDatosVh: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select m.descripcion marca_vehiculo,  d.* from DATOSVEHICULO d'
      'left outer join MARCA_VEHICULO m on m.idmarca = d.idmarca'
      'where chassis =:chassis')
    Left = 392
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'chassis'
        ParamType = ptUnknown
      end>
    object qryDatosVhNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DATOSVEHICULO.NUMERO'
      Required = True
    end
    object qryDatosVhCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'DATOSVEHICULO.CODIGO_CTE'
      Required = True
    end
    object qryDatosVhFECHA_APERTURA: TDateTimeField
      FieldName = 'FECHA_APERTURA'
      Origin = 'DATOSVEHICULO.FECHA_APERTURA'
    end
    object qryDatosVhFECHA_VENCE_SEGURO: TDateTimeField
      FieldName = 'FECHA_VENCE_SEGURO'
      Origin = 'DATOSVEHICULO.FECHA_VENCE_SEGURO'
    end
    object qryDatosVhTIPO_AFILIADO: TSmallintField
      FieldName = 'TIPO_AFILIADO'
      Origin = 'DATOSVEHICULO.TIPO_AFILIADO'
      Required = True
    end
    object qryDatosVhPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'DATOSVEHICULO.PLACA'
      Size = 12
    end
    object qryDatosVhIDMARCA: TIntegerField
      FieldName = 'IDMARCA'
      Origin = 'DATOSVEHICULO.IDMARCA'
    end
    object qryDatosVhMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'DATOSVEHICULO.MODELO'
    end
    object qryDatosVhANO_VEH: TIntegerField
      FieldName = 'ANO_VEH'
      Origin = 'DATOSVEHICULO.ANO_VEH'
    end
    object qryDatosVhTIPO_SEGURO: TSmallintField
      FieldName = 'TIPO_SEGURO'
      Origin = 'DATOSVEHICULO.TIPO_SEGURO'
    end
    object qryDatosVhCIA_SEGURO: TIBStringField
      FieldName = 'CIA_SEGURO'
      Origin = 'DATOSVEHICULO.CIA_SEGURO'
      Size = 50
    end
    object qryDatosVhEMPRESA_LABORA: TIBStringField
      FieldName = 'EMPRESA_LABORA'
      Origin = 'DATOSVEHICULO.EMPRESA_LABORA'
      Size = 80
    end
    object qryDatosVhFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DATOSVEHICULO.FECHA_IN'
    end
    object qryDatosVhIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DATOSVEHICULO.IN_POR'
      Size = 12
    end
    object qryDatosVhCODIGO_DEALER: TIntegerField
      FieldName = 'CODIGO_DEALER'
      Origin = 'DATOSVEHICULO.CODIGO_DEALER'
    end
    object qryDatosVhCODIGO_AGENCIA: TIntegerField
      FieldName = 'CODIGO_AGENCIA'
      Origin = 'DATOSVEHICULO.CODIGO_AGENCIA'
    end
    object qryDatosVhCOLOR: TIBStringField
      FieldName = 'COLOR'
      Origin = 'DATOSVEHICULO.COLOR'
    end
    object qryDatosVhNUM_CERTIFICADO: TIntegerField
      FieldName = 'NUM_CERTIFICADO'
      Origin = 'DATOSVEHICULO.NUM_CERTIFICADO'
    end
    object qryDatosVhCHASSIS: TIBStringField
      FieldName = 'CHASSIS'
      Origin = 'DATOSVEHICULO.CHASSIS'
    end
    object qryDatosVhNUMPOL: TIntegerField
      FieldName = 'NUMPOL'
      Origin = 'DATOSVEHICULO.NUMPOL'
    end
    object qryDatosVhSTATUSCXC: TIBStringField
      FieldName = 'STATUSCXC'
      Origin = 'DATOSVEHICULO.STATUSCXC'
      FixedChar = True
      Size = 1
    end
    object qryDatosVhPOLIZA_ESPECIAL: TSmallintField
      FieldName = 'POLIZA_ESPECIAL'
      Origin = 'DATOSVEHICULO.POLIZA_ESPECIAL'
    end
    object qryDatosVhRUTA_FILEAUTH: TIBStringField
      FieldName = 'RUTA_FILEAUTH'
      Origin = 'DATOSVEHICULO.RUTA_FILEAUTH'
      Size = 200
    end
    object qryDatosVhMARCA_VEHICULO: TIBStringField
      FieldName = 'MARCA_VEHICULO'
      Origin = 'MARCA_VEHICULO.DESCRIPCION'
    end
  end
  object tblPreventaMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from Ventas_mast_preventa'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into Ventas_mast_preventa'
      
        '  (NUMERO, FECHA, CIA_KEY, CODIGO_CTE, CODIGO_VENDEDOR, FORMA_PA' +
        'GO, OBSERVACION, '
      
        '   MONEDA, VALOR_TOTAL_DET, STATUS, FECHA_IN, IN_POR, FECHA_MOD,' +
        ' MOD_POR, '
      
        '   NUMERO_FACTURA, NUMERO_DOC_PAGO, SERIE_NCF_ASIGNADO, MONTO_BR' +
        'UTO, PORC_DESCUENTO, '
      '   MONTO_DESCUENTO, MONTO_INICIAL, NOMBRE_CLIENTE_GENERAL)'
      'values'
      
        '  (:NUMERO, :FECHA, :CIA_KEY, :CODIGO_CTE, :CODIGO_VENDEDOR, :FO' +
        'RMA_PAGO, '
      
        '   :OBSERVACION, :MONEDA, :VALOR_TOTAL_DET, :STATUS, :FECHA_IN, ' +
        ':IN_POR, '
      
        '   :FECHA_MOD, :MOD_POR, :NUMERO_FACTURA, :NUMERO_DOC_PAGO, :SER' +
        'IE_NCF_ASIGNADO, '
      
        '   :MONTO_BRUTO, :PORC_DESCUENTO, :MONTO_DESCUENTO, :MONTO_INICI' +
        'AL, :NOMBRE_CLIENTE_GENERAL)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA,'
      '  CIA_KEY,'
      '  CODIGO_CTE,'
      '  CODIGO_VENDEDOR,'
      '  FORMA_PAGO,'
      '  OBSERVACION,'
      '  MONEDA,'
      '  VALOR_TOTAL_DET,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  NUMERO_FACTURA,'
      '  NUMERO_DOC_PAGO,'
      '  SERIE_NCF_ASIGNADO,'
      '  MONTO_BRUTO,'
      '  PORC_DESCUENTO,'
      '  MONTO_DESCUENTO,'
      '  MONTO_INICIAL,'
      '  NOMBRE_CLIENTE_GENERAL'
      'from Ventas_mast_preventa '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select * From Ventas_mast_preventa'
      'WHERE NUMERO=:NUMERO')
    ModifySQL.Strings = (
      'update Ventas_mast_preventa'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  CIA_KEY = :CIA_KEY,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  CODIGO_VENDEDOR = :CODIGO_VENDEDOR,'
      '  FORMA_PAGO = :FORMA_PAGO,'
      '  OBSERVACION = :OBSERVACION,'
      '  MONEDA = :MONEDA,'
      '  VALOR_TOTAL_DET = :VALOR_TOTAL_DET,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  NUMERO_FACTURA = :NUMERO_FACTURA,'
      '  NUMERO_DOC_PAGO = :NUMERO_DOC_PAGO,'
      '  SERIE_NCF_ASIGNADO = :SERIE_NCF_ASIGNADO,'
      '  MONTO_BRUTO = :MONTO_BRUTO,'
      '  PORC_DESCUENTO = :PORC_DESCUENTO,'
      '  MONTO_DESCUENTO = :MONTO_DESCUENTO,'
      '  MONTO_INICIAL = :MONTO_INICIAL,'
      '  NOMBRE_CLIENTE_GENERAL = :NOMBRE_CLIENTE_GENERAL'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 176
    Top = 592
    object tblPreventaMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST_PREVENTA.NUMERO'
      Required = True
    end
    object tblPreventaMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST_PREVENTA.FECHA'
    end
    object tblPreventaMasterCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VENTAS_MAST_PREVENTA.CIA_KEY'
    end
    object tblPreventaMasterCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST_PREVENTA.CODIGO_CTE'
    end
    object tblPreventaMasterCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VENTAS_MAST_PREVENTA.CODIGO_VENDEDOR'
    end
    object tblPreventaMasterFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VENTAS_MAST_PREVENTA.FORMA_PAGO'
    end
    object tblPreventaMasterOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VENTAS_MAST_PREVENTA.OBSERVACION'
      Size = 60
    end
    object tblPreventaMasterMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_MAST_PREVENTA.MONEDA'
      FixedChar = True
      Size = 1
    end
    object tblPreventaMasterVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST_PREVENTA.VALOR_TOTAL_DET'
    end
    object tblPreventaMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENTAS_MAST_PREVENTA.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblPreventaMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_MAST_PREVENTA.FECHA_IN'
    end
    object tblPreventaMasterIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_MAST_PREVENTA.IN_POR'
      Size = 12
    end
    object tblPreventaMasterFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_MAST_PREVENTA.FECHA_MOD'
    end
    object tblPreventaMasterMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_MAST_PREVENTA.MOD_POR'
      Size = 12
    end
    object tblPreventaMasterNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST_PREVENTA.NUMERO_FACTURA'
    end
    object tblPreventaMasterNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VENTAS_MAST_PREVENTA.NUMERO_DOC_PAGO'
    end
    object tblPreventaMasterSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VENTAS_MAST_PREVENTA.SERIE_NCF_ASIGNADO'
    end
    object tblPreventaMasterMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'VENTAS_MAST_PREVENTA.MONTO_BRUTO'
    end
    object tblPreventaMasterPORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VENTAS_MAST_PREVENTA.PORC_DESCUENTO'
    end
    object tblPreventaMasterMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_MAST_PREVENTA.MONTO_DESCUENTO'
    end
    object tblPreventaMasterMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'VENTAS_MAST_PREVENTA.MONTO_INICIAL'
    end
    object tblPreventaMasterNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'VENTAS_MAST_PREVENTA.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
  end
  object qryTicketPreventaMast: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryTicketPreventaMastAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from VENTAS_MAST_PREVENTA'
      'where numero=:numero')
    Left = 584
    Top = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryTicketPreventaMastNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST_PREVENTA.NUMERO'
      Required = True
    end
    object qryTicketPreventaMastFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST_PREVENTA.FECHA'
    end
    object qryTicketPreventaMastCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VENTAS_MAST_PREVENTA.CIA_KEY'
    end
    object qryTicketPreventaMastCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST_PREVENTA.CODIGO_CTE'
    end
    object qryTicketPreventaMastCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VENTAS_MAST_PREVENTA.CODIGO_VENDEDOR'
    end
    object qryTicketPreventaMastFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VENTAS_MAST_PREVENTA.FORMA_PAGO'
    end
    object qryTicketPreventaMastOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VENTAS_MAST_PREVENTA.OBSERVACION'
      Size = 60
    end
    object qryTicketPreventaMastMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_MAST_PREVENTA.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryTicketPreventaMastVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST_PREVENTA.VALOR_TOTAL_DET'
    end
    object qryTicketPreventaMastSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENTAS_MAST_PREVENTA.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryTicketPreventaMastFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_MAST_PREVENTA.FECHA_IN'
    end
    object qryTicketPreventaMastIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_MAST_PREVENTA.IN_POR'
      Size = 12
    end
    object qryTicketPreventaMastFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_MAST_PREVENTA.FECHA_MOD'
    end
    object qryTicketPreventaMastMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_MAST_PREVENTA.MOD_POR'
      Size = 12
    end
    object qryTicketPreventaMastNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST_PREVENTA.NUMERO_FACTURA'
    end
    object qryTicketPreventaMastNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VENTAS_MAST_PREVENTA.NUMERO_DOC_PAGO'
    end
    object qryTicketPreventaMastSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VENTAS_MAST_PREVENTA.SERIE_NCF_ASIGNADO'
    end
    object qryTicketPreventaMastMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'VENTAS_MAST_PREVENTA.MONTO_BRUTO'
    end
    object qryTicketPreventaMastPORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VENTAS_MAST_PREVENTA.PORC_DESCUENTO'
    end
    object qryTicketPreventaMastMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_MAST_PREVENTA.MONTO_DESCUENTO'
    end
    object qryTicketPreventaMastMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'VENTAS_MAST_PREVENTA.MONTO_INICIAL'
    end
    object qryTicketPreventaMastNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'VENTAS_MAST_PREVENTA.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
  end
  object qryTicketPreventaDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from VENTAS_DET_PREVENTA'
      'where numero=:numero')
    Left = 864
    Top = 552
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryTicketPreventaDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET_PREVENTA.SERIE'
      Required = True
    end
    object qryTicketPreventaDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_DET_PREVENTA.NUMERO'
      Required = True
    end
    object qryTicketPreventaDetCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET_PREVENTA.CODIGO_PROD'
      Size = 40
    end
    object qryTicketPreventaDetCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VENTAS_DET_PREVENTA.CODIGO_BARRA'
    end
    object qryTicketPreventaDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET_PREVENTA.DESCRIPCION'
      Size = 60
    end
    object qryTicketPreventaDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET_PREVENTA.CANTIDAD'
    end
    object qryTicketPreventaDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET_PREVENTA.PRECIO'
    end
    object qryTicketPreventaDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET_PREVENTA.PORC_DESC_DET'
    end
    object qryTicketPreventaDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET_PREVENTA.ITBI_DET'
    end
    object qryTicketPreventaDetVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET_PREVENTA.VALOR_SERVICIO_DET'
    end
    object qryTicketPreventaDetVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_DET_PREVENTA.VALOR_TOTAL_DET'
    end
    object qryTicketPreventaDetNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VENTAS_DET_PREVENTA.NUM_FACTURA'
    end
    object qryTicketPreventaDetSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET_PREVENTA.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryTicketPreventaDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_DET_PREVENTA.FECHA_IN'
    end
    object qryTicketPreventaDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_DET_PREVENTA.IN_POR'
      Size = 12
    end
    object qryTicketPreventaDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_DET_PREVENTA.FECHA_MOD'
    end
    object qryTicketPreventaDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_DET_PREVENTA.MOD_POR'
      Size = 12
    end
    object qryTicketPreventaDetCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VENTAS_DET_PREVENTA.CANT_REGRESO'
    end
    object qryTicketPreventaDetCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VENTAS_DET_PREVENTA.CANT_PROMO'
    end
    object qryTicketPreventaDetMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VENTAS_DET_PREVENTA.MONTO_DIETA'
    end
    object qryTicketPreventaDetMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VENTAS_DET_PREVENTA.MONTO_AJUSTE'
    end
    object qryTicketPreventaDetSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VENTAS_DET_PREVENTA.SERIE_PROD'
      Size = 50
    end
    object qryTicketPreventaDetSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VENTAS_DET_PREVENTA.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryTicketPreventaDetTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VENTAS_DET_PREVENTA.TIPO_UNIDAD'
    end
  end
  object rxLote: TRxMemoryData
    FieldDefs = <
      item
        Name = 'LotNum'
        DataType = ftString
        Size = 20
      end>
    Left = 544
    Top = 616
    object rxLoteLotNum: TStringField
      FieldName = 'LotNum'
    end
  end
end
