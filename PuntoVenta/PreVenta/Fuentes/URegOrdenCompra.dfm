object frmRegOrdenCompra: TfrmRegOrdenCompra
  Left = 272
  Top = 135
  Width = 763
  Height = 579
  Caption = 'Registro de Orden Compra'
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
    Width = 71
    Height = 13
    Caption = 'Cod Proveedor'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 352
    Top = 8
    Width = 60
    Height = 13
    Caption = 'Observacion'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 232
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Fecha'
    FocusControl = DBEdit2
  end
  object Label4: TLabel
    Left = 624
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Status'
    FocusControl = DBEdit3
  end
  object Label5: TLabel
    Left = 8
    Top = 88
    Width = 79
    Height = 13
    Caption = 'Codigo Producto'
  end
  object Label6: TLabel
    Left = 392
    Top = 88
    Width = 55
    Height = 13
    Caption = 'CANTIDAD'
    FocusControl = DBEdit5
  end
  object Label7: TLabel
    Left = 456
    Top = 88
    Width = 40
    Height = 13
    Caption = 'PRECIO'
    FocusControl = DBEdit6
  end
  object Label8: TLabel
    Left = 528
    Top = 88
    Width = 43
    Height = 13
    Caption = 'STATUS'
    FocusControl = DBEdit7
  end
  object Shape1: TShape
    Left = 8
    Top = 48
    Width = 649
    Height = 4
    Pen.Color = 10932991
    Pen.Style = psClear
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 52
    Height = 21
    DataField = 'CODIGO_PROVEE'
    TabOrder = 0
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 62
    Top = 24
    Width = 164
    Height = 21
    DropDownCount = 8
    DropDownWidth = 250
    DataField = 'CODIGO_PROVEE'
    DataSource = dmDatos.dsqryOrdenMaster
    LookupField = 'CODIGO_CTE'
    LookupDisplay = 'DESCRIPCION'
    LookupSource = dmProveedor.dsqryProveedores
    TabOrder = 1
  end
  object DBDateEdit1: TDBDateEdit
    Left = 232
    Top = 24
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 352
    Top = 24
    Width = 273
    Height = 21
    DataField = 'OBSERVACION'
    DataSource = dmDatos.dsqryOrdenMaster
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 626
    Top = 24
    Width = 33
    Height = 21
    DataField = 'STATUS'
    DataSource = dmDatos.dsqryOrdenMaster
    TabOrder = 4
  end
  object RxDBLookupCombo2: TRxDBLookupCombo
    Left = 134
    Top = 104
    Width = 251
    Height = 21
    DropDownCount = 8
    DropDownWidth = 250
    DataField = 'COD_SERV_PROD'
    DataSource = dmDatos.dsqryOrdenDet
    LookupField = 'CODIGO'
    LookupDisplay = 'DESCRIPCION'
    LookupSource = dmDatos.dsrxqryInv
    TabOrder = 5
  end
  object DBEdit5: TDBEdit
    Left = 392
    Top = 104
    Width = 57
    Height = 21
    DataField = 'CANTIDAD'
    DataSource = dmDatos.dsqryOrdenDet
    TabOrder = 6
  end
  object DBEdit6: TDBEdit
    Left = 456
    Top = 104
    Width = 65
    Height = 21
    DataField = 'PRECIO'
    DataSource = dmDatos.dsqryOrdenDet
    TabOrder = 7
  end
  object DBEdit7: TDBEdit
    Left = 528
    Top = 104
    Width = 41
    Height = 21
    DataField = 'STATUS'
    DataSource = dmDatos.dsqryOrdenDet
    TabOrder = 8
  end
  object edtCodigo: TEditN
    Left = 8
    Top = 104
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
    TabOrder = 9
    OnChange = edtCodigoChange
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
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 55
    Width = 289
    Height = 34
    Caption = 'Buscar por'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Codigo'
      'C.Barra'
      'Descripcion')
    TabOrder = 10
  end
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 152
    Width = 657
    Height = 241
    DataSource = dmDatos.dsrxqryInv
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
  end
end
