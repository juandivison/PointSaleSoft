object frmConsultaPrecio: TfrmConsultaPrecio
  Left = 296
  Top = 200
  Width = 451
  Height = 231
  Caption = 'Consulta de Precio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 8
    Top = 5
    Width = 61
    Height = 24
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 160
    Width = 75
    Height = 25
    Caption = '&Cerrar'
    TabOrder = 0
    Kind = bkClose
  end
  object Panel1: TPanel
    Left = 7
    Top = 56
    Width = 426
    Height = 78
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object Label1: TLabel
      Left = 75
      Top = 29
      Width = 46
      Height = 16
      Caption = 'Precio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 75
      Top = 51
      Width = 76
      Height = 19
      Alignment = taCenter
      DataField = 'PRECIO'
      DataSource = dsqryProductos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 163
      Top = 29
      Width = 79
      Height = 16
      Caption = 'Paga Itbis?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 162
      Top = 51
      Width = 6
      Height = 20
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape
      Left = 2
      Top = 46
      Width = 239
      Height = 2
      Brush.Color = 4259584
      Pen.Style = psClear
    end
    object DBText1: TDBText
      Left = 126
      Top = 6
      Width = 52
      Height = 16
      AutoSize = True
      DataField = 'Descripcion'
      DataSource = dsqryProductos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 2
      Top = 6
      Width = 117
      Height = 17
      Alignment = taRightJustify
      DataField = 'CODIGO_TEXTO'
      DataSource = dsqryProductos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 121
      Top = 4
      Width = 5
      Height = 20
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 3
      Top = 29
      Width = 63
      Height = 16
      Caption = 'Cantidad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText4: TDBText
      Left = 3
      Top = 51
      Width = 60
      Height = 19
      Alignment = taCenter
      DataField = 'CANTIDAD'
      DataSource = dsqryProductos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object edtCodigo: TEditN
    Left = 8
    Top = 29
    Width = 121
    Height = 25
    Hint = 'Entre codigo o nombre de producto a consultar'
    AutoSize = False
    CharCase = ecUpperCase
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnChange = edtCodigoChange
    OnEnter = edtCodigoEnter
    OnExit = edtCodigoExit
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
  object BitBtn2: TBitBtn
    Left = 172
    Top = 28
    Width = 73
    Height = 25
    Hint = 'Visualizar todos los productos'
    Caption = 'Ver todos'
    ParentShowHint = False
    ShowHint = True
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
  object BitBtn3: TBitBtn
    Left = 128
    Top = 160
    Width = 75
    Height = 25
    Caption = '&Aceptar'
    TabOrder = 4
    Kind = bkOK
  end
  object CheckBox1: TCheckBox
    Left = 136
    Top = 8
    Width = 97
    Height = 17
    Caption = 'Desactiva Lector'
    TabOrder = 5
  end
  object BitBtn4: TBitBtn
    Left = 133
    Top = 28
    Width = 33
    Height = 25
    Hint = 'Click para buscar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
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
  object qryProductos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    AfterScroll = qryProductosAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *  From INVENTARIO_PRODUCTO'
      'ORDER BY tipo,descripcion, Referencia, codigo')
    Left = 232
    Top = 23
    object qryProductosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryProductosCODIGO_TEXTO: TIBStringField
      DisplayWidth = 40
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryProductosCANTIDAD: TFloatField
      DisplayLabel = 'Cant'
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
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
      DisplayFormat = ',0.00'
    end
    object qryProductosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
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
  end
  object dsqryProductos: TDataSource
    DataSet = qryProductos
    Left = 288
    Top = 16
  end
end
