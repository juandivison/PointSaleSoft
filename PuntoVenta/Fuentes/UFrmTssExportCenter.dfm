object frmTssExportCenter: TfrmTssExportCenter
  Left = 365
  Top = 162
  Width = 1060
  Height = 700
  Caption = 'Centro de Exportacion TSS / SUIR Plus'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 1052
    Height = 104
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    TabOrder = 0
    object lblTitle: TLabel
      Left = 16
      Top = 10
      Width = 373
      Height = 23
      Caption = 'Centro de Exportacion TSS / SUIR Plus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubTitle: TLabel
      Left = 18
      Top = 36
      Width = 281
      Height = 13
      Caption = 'Centro para generar TXT TSS desde Firebird / nomina real.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCompania: TLabel
      Left = 18
      Top = 66
      Width = 51
      Height = 13
      Caption = 'Compania:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblRnc: TLabel
      Left = 280
      Top = 66
      Width = 25
      Height = 13
      Caption = 'RNC:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPeriodo: TLabel
      Left = 440
      Top = 66
      Width = 87
      Height = 13
      Caption = 'Periodo MMAAAA:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSalida: TLabel
      Left = 635
      Top = 66
      Width = 73
      Height = 13
      Caption = 'Carpeta salida:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblQuincenaPension: TLabel
      Left = 18
      Top = 86
      Width = 82
      Height = 13
      Caption = 'Pension aliment.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblClaveNomina: TLabel
      Left = 250
      Top = 86
      Width = 69
      Height = 13
      Caption = 'Clave Nomina:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lkpCompania: TRxDBLookupCombo
      Left = 78
      Top = 62
      Width = 190
      Height = 21
      DropDownCount = 8
      LookupField = 'CODIGO'
      LookupDisplay = 'NOMBRE_CIA'
      LookupSource = dsCompaniaLookup
      TabOrder = 0
      OnChange = lkpCompaniaChange
    end
    object edtRnc: TEdit
      Left = 310
      Top = 62
      Width = 118
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object cbQuincenaPension: TComboBox
      Left = 112
      Top = 82
      Width = 118
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
    end
    object edtClaveNomina: TEdit
      Left = 330
      Top = 82
      Width = 50
      Height = 21
      MaxLength = 3
      TabOrder = 6
      Text = '001'
    end
    object edtPeriodo: TEdit
      Left = 535
      Top = 62
      Width = 80
      Height = 21
      TabOrder = 2
    end
    object edtOutputFolder: TEdit
      Left = 720
      Top = 62
      Width = 220
      Height = 21
      TabOrder = 3
    end
    object btnBuscarCarpeta: TBitBtn
      Left = 946
      Top = 60
      Width = 90
      Height = 25
      Caption = 'Buscar...'
      TabOrder = 4
      OnClick = btnBuscarCarpetaClick
    end
  end
  object pcMain: TPageControl
    Left = 0
    Top = 104
    Width = 1052
    Height = 81
    ActivePage = tsAutodeterminacion
    Align = alTop
    TabOrder = 1
    OnChange = pcMainChange
    object tsAutodeterminacion: TTabSheet
      Caption = 'Autodeterminacion'
    end
    object tsNovedades: TTabSheet
      Caption = 'Novedades NV'
    end
    object tsBonificacion: TTabSheet
      Caption = 'Bonificacion INFOTEP'
    end
    object tsDependientes: TTabSheet
      Caption = 'Dependientes Adicionales'
    end
    object tsRectificativa: TTabSheet
      Caption = 'Rectificativa IR-3'
    end
    object tsLog: TTabSheet
      Caption = 'Validaciones / Log'
    end
  end
  object pnlClient: TPanel
    Left = 0
    Top = 185
    Width = 1052
    Height = 368
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object grdPreview: TDBGrid
      Left = 0
      Top = 0
      Width = 1052
      Height = 368
      Align = alClient
      DataSource = dsPreview
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object memLog: TMemo
    Left = 0
    Top = 553
    Width = 1052
    Height = 86
    Align = alBottom
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 639
    Width = 1052
    Height = 30
    Align = alBottom
    TabOrder = 4
    object btnCargarDb: TBitBtn
      Left = 10
      Top = 3
      Width = 110
      Height = 24
      Caption = 'Cargar DB'
      TabOrder = 0
      OnClick = btnCargarDbClick
    end
    object btnValidar: TBitBtn
      Left = 128
      Top = 3
      Width = 90
      Height = 24
      Caption = 'Validar'
      TabOrder = 1
      OnClick = btnValidarClick
    end
    object btnGenerarTxt: TBitBtn
      Left = 226
      Top = 3
      Width = 110
      Height = 24
      Caption = 'Generar TXT'
      TabOrder = 2
      OnClick = btnGenerarTxtClick
    end
    object btnAbrirCarpeta: TBitBtn
      Left = 344
      Top = 3
      Width = 110
      Height = 24
      Caption = 'Abrir Carpeta'
      TabOrder = 3
      OnClick = btnAbrirCarpetaClick
    end
    object btnCerrar: TBitBtn
      Left = 942
      Top = 3
      Width = 90
      Height = 24
      Caption = 'Cerrar'
      TabOrder = 4
      OnClick = btnCerrarClick
    end
  end
  object dsPreview: TDataSource
    DataSet = cdsPreview
    Left = 776
    Top = 216
  end
  object cdsPreview: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 800
    Top = 312
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Archivo TXT (*.txt)|*.txt|Todos los archivos (*.*)|*.*'
    Left = 912
    Top = 216
  end
  object IBQuery1: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 400
    Top = 305
  end
  object dsCompaniaLookup: TDataSource
    DataSet = qryCompaniaLookup
    Left = 680
    Top = 216
  end
  object qryCompaniaLookup: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 680
    Top = 312
  end
end
