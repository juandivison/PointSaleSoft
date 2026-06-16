object frmOrders2EcfRunner: TfrmOrders2EcfRunner
  Left = 246
  Top = 64
  Width = 1211
  Height = 864
  Caption = 'Orders2Ecf Runner'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 1203
    Height = 73
    Align = alTop
    TabOrder = 0
    object lblExe: TLabel
      Left = 12
      Top = 14
      Width = 91
      Height = 13
      Caption = 'Orders2Ecf.Cli.exe'
    end
    object lblHint: TLabel
      Left = 12
      Top = 49
      Width = 886
      Height = 13
      AutoSize = False
      Caption = 
        'Normal: emite/flujo normal. Dummy: prueba sin env'#237'o fiscal. Repr' +
        'int: rehace salida desde un NCF existente. Replay: completa solo' +
        ' pipeline legacy usando NCF existente.'
      WordWrap = True
    end
    object edtExePath: TEdit
      Left = 12
      Top = 28
      Width = 781
      Height = 21
      TabOrder = 0
      OnChange = AnyParamControlChange
    end
    object btnBrowseExe: TButton
      Left = 801
      Top = 26
      Width = 95
      Height = 25
      Caption = 'Buscar...'
      TabOrder = 1
      OnClick = btnBrowseExeClick
    end
  end
  object gbFolders: TGroupBox
    Left = 0
    Top = 538
    Width = 505
    Height = 212
    Align = alLeft
    Caption = 'Archivos seleccionados'
    TabOrder = 1
    object lbFolders: TListBox
      Left = 12
      Top = 24
      Width = 485
      Height = 263
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object gbMode: TGroupBox
    Left = 0
    Top = 73
    Width = 1203
    Height = 205
    Align = alTop
    Caption = 'Modo de ejecuci'#243'n'
    TabOrder = 2
    object lblNcf: TLabel
      Left = 16
      Top = 122
      Width = 60
      Height = 13
      Caption = 'NCF / e-NCF'
    end
    object lblModeHelp: TLabel
      Left = 16
      Top = 142
      Width = 521
      Height = 13
      AutoSize = False
      Caption = 'Detalles del modo seleccionado'
      WordWrap = True
    end
    object Label1: TLabel
      Left = 360
      Top = 104
      Width = 96
      Height = 13
      Caption = 'Fecha de Operaci'#243'n'
      Color = 16441811
      ParentColor = False
    end
    object Label2: TLabel
      Left = 544
      Top = 63
      Width = 56
      Height = 18
      Caption = 'Tasa US'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNcrNcfRef: TLabel
      Left = 820
      Top = 106
      Width = 85
      Height = 13
      Caption = 'e-NCF a modificar'
      Visible = False
    end
    object lblNcrReason: TLabel
      Left = 820
      Top = 150
      Width = 56
      Height = 13
      Caption = 'Motivo NCR'
      Visible = False
    end
    object rgProcessType: TRadioGroup
      Left = 820
      Top = 24
      Width = 181
      Height = 73
      Caption = 'Tipo de proceso'
      ItemIndex = 0
      Items.Strings = (
        'Procesar Venta'
        'Procesar NCR')
      TabOrder = 7
      OnClick = rgProcessTypeClick
    end
    object rgMode: TRadioGroup
      Left = 16
      Top = 24
      Width = 465
      Height = 81
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Normal'
        'Dummy'
        'Reprint'
        'Replay'
        'Recover Timbre')
      TabOrder = 0
      OnClick = rgModeClick
    end
    object edtNcf: TEdit
      Left = 120
      Top = 118
      Width = 233
      Height = 21
      TabOrder = 1
      OnChange = AnyParamControlChange
    end
    object dtpkFechaTrnDiaria: TDateTimePicker
      Left = 358
      Top = 118
      Width = 99
      Height = 21
      Date = 46100.560689826390000000
      Time = 46100.560689826390000000
      TabOrder = 2
      OnChange = AnyParamControlChange
      OnExit = dtpkFechaTrnDiariaExit
    end
    object edtTasa: TEdit
      Left = 543
      Top = 85
      Width = 62
      Height = 26
      Color = clOlive
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = '63.50'
    end
    object Button1: TButton
      Left = 538
      Top = 113
      Width = 88
      Height = 25
      Caption = 'Actualizar Tasa'
      TabOrder = 4
      OnClick = Button1Click
    end
    object BitBtn1: TBitBtn
      Left = 632
      Top = 112
      Width = 89
      Height = 25
      Caption = 'Actualizar eNCF'
      TabOrder = 5
      OnClick = BitBtn1Click
    end
    object Button2: TButton
      Left = 728
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Consultas'
      TabOrder = 6
      OnClick = Button2Click
    end
    object edtNcrNcfRef: TEdit
      Left = 820
      Top = 122
      Width = 181
      Height = 21
      TabOrder = 8
      Visible = False
      OnChange = AnyParamControlChange
    end
    object cbNcrReason: TComboBox
      Left = 820
      Top = 166
      Width = 181
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 9
      Visible = False
      OnChange = AnyParamControlChange
    end
    object chkNcrDummy: TCheckBox
      Left = 1016
      Top = 124
      Width = 170
      Height = 17
      Caption = 'NCR Dummy / Vista previa'
      Checked = True
      State = cbChecked
      TabOrder = 10
      Visible = False
      OnClick = AnyParamControlChange
    end
    object chkNcrFinalize: TCheckBox
      Left = 1017
      Top = 168
      Width = 183
      Height = 17
      Caption = 'Finalizar legacy de NCR aceptada'
      TabOrder = 11
      OnClick = chkNcrFinalizeClick
    end
  end
  object gbOptions: TGroupBox
    Left = 0
    Top = 278
    Width = 1203
    Height = 260
    Align = alTop
    Caption = 'Opciones y par'#225'metros'
    TabOrder = 3
    object lblExtraArgs: TLabel
      Left = 16
      Top = 225
      Width = 87
      Height = 13
      Caption = 'Argumentos extra'
    end
    object lblEcfType: TLabel
      Left = 16
      Top = 102
      Width = 46
      Height = 13
      Caption = 'Tipo e-CF'
    end
    object lblOutputCurrency: TLabel
      Left = 288
      Top = 102
      Width = 83
      Height = 13
      Caption = 'Moneda de salida'
    end
    object lblSaleCondition: TLabel
      Left = 448
      Top = 102
      Width = 77
      Height = 13
      Caption = 'Condici'#243'n venta'
    end
    object lblPaymentMethod: TLabel
      Left = 656
      Top = 102
      Width = 72
      Height = 13
      Caption = 'Forma de pago'
    end
    object lblCliPreviewTitle: TLabel
      Left = 16
      Top = 150
      Width = 216
      Height = 13
      Caption = 'Par'#225'metros sugeridos que se enviar'#225'n al exe'
    end
    object memCliPreview: TMemo
      Left = 16
      Top = 166
      Width = 1165
      Height = 50
      Color = clInfoBk
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 10
      WordWrap = False
    end
    object chkLegacyImport: TCheckBox
      Left = 16
      Top = 28
      Width = 185
      Height = 17
      Caption = 'Legacy Import (--legacy-import)'
      TabOrder = 0
      OnClick = AnyParamControlChange
    end
    object chkLegacyReplay: TCheckBox
      Left = 16
      Top = 52
      Width = 196
      Height = 17
      Caption = 'Legacy Replay (--legacy-replay)'
      TabOrder = 1
      OnClick = chkLegacyReplayClick
    end
    object chkLegacyNumbering: TCheckBox
      Left = 16
      Top = 76
      Width = 225
      Height = 17
      Caption = 'Legacy Numbering (--legacy-numbering)'
      TabOrder = 2
      OnClick = AnyParamControlChange
    end
    object chkOpenReport: TCheckBox
      Left = 288
      Top = 28
      Width = 233
      Height = 17
      Caption = 'Abrir reporte Excel al terminar'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object chkOpenOutputFolder: TCheckBox
      Left = 288
      Top = 52
      Width = 233
      Height = 17
      Caption = 'Abrir carpeta del reporte al terminar'
      TabOrder = 4
    end
    object chkShowTotalDop: TCheckBox
      Left = 560
      Top = 28
      Width = 233
      Height = 17
      Caption = 'Mostrar Total RD$ en Excel / PDF'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = AnyParamControlChange
    end
    object cbEcfType: TComboBox
      Left = 16
      Top = 118
      Width = 257
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      OnChange = cbEcfTypeChange
    end
    object cbOutputCurrency: TComboBox
      Left = 288
      Top = 118
      Width = 150
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      OnChange = AnyParamControlChange
    end
    object cbSaleCondition: TComboBox
      Left = 448
      Top = 118
      Width = 193
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
      OnChange = cbSaleConditionChange
    end
    object cbPaymentMethod: TComboBox
      Left = 656
      Top = 118
      Width = 260
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 9
      OnChange = cbPaymentMethodChange
    end
    object edtExtraArgs: TEdit
      Left = 16
      Top = 239
      Width = 620
      Height = 21
      TabOrder = 11
      OnChange = AnyParamControlChange
    end
  end
  object gbLog: TGroupBox
    Left = 505
    Top = 538
    Width = 698
    Height = 212
    Align = alClient
    Caption = 'Log de ejecuci'#243'n'
    TabOrder = 4
    object memLog: TMemo
      Left = 2
      Top = 15
      Width = 694
      Height = 195
      Align = alClient
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 750
    Width = 1203
    Height = 44
    Align = alBottom
    TabOrder = 5
    object btnRun: TButton
      Left = 717
      Top = 9
      Width = 89
      Height = 25
      Caption = 'Ejecutar'
      TabOrder = 0
      OnClick = btnRunClick
    end
    object btnClose: TButton
      Left = 812
      Top = 9
      Width = 89
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 1
      OnClick = btnCloseClick
    end
    object btnCreateNcr: TButton
      Left = 907
      Top = 9
      Width = 145
      Height = 25
      Caption = 'Dise'#241'ar y ejecutar NCR'
      TabOrder = 2
      Visible = False
      OnClick = btnCreateNcrClick
    end
    object btnAddFolder: TButton
      Left = 4
      Top = 11
      Width = 105
      Height = 25
      Caption = 'Seleccionar...'
      TabOrder = 3
      OnClick = btnAddFolderClick
    end
    object btnRemoveFolder: TButton
      Left = 124
      Top = 11
      Width = 105
      Height = 25
      Caption = 'Quitar'
      TabOrder = 4
      OnClick = btnRemoveFolderClick
    end
    object btnClearFolders: TButton
      Left = 236
      Top = 11
      Width = 113
      Height = 25
      Caption = 'Limpiar'
      TabOrder = 5
      OnClick = btnClearFoldersClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 794
    Width = 1203
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object OpenDialogExe: TOpenDialog
    Left = 1040
    Top = 24
  end
  object SkinData1: TSkinData
    Active = False
    DisableTag = 99
    SkinControls = [xcMainMenu, xcPopupMenu, xcToolbar, xcControlbar, xcCombo, xcCheckBox, xcRadioButton, xcProgress, xcScrollbar, xcEdit, xcButton, xcBitBtn, xcSpeedButton, xcPanel, xcGroupBox, xcStatusBar, xcTab, xcSystemMenu]
    Skin3rd.Strings = (
      'TTBDock=Panel'
      'TTBToolbar=Panel'
      'TImageEnMView=scrollbar'
      'TImageEnView=scrollbar'
      'TRzButton=button'
      'TRzCheckGroup=CheckGroup'
      'TRzRadioGroup=Radiogroup'
      'TRzRadioButton=Radiobutton'
      'TRzCheckBox=Checkbox'
      'TRzButtonEdit=Edit'
      'TRzDBRadioGroup=Radiogroup'
      'TRzDBRadioButton=Radiobutton'
      'TRzDBCheckBox=Checkbox'
      'TLMDGroupBox=Groupbox'
      'TDBCheckboxEh=Checkbox'
      'TDBCheckboxEh=Checkbox'
      'TLMDCHECKBOX=Checkbox'
      'TLMDDBCHECKBOX=Checkbox'
      'TLMDRadiobutton=Radiobutton'
      'TLMDCalculator=panel'
      'TLMDGROUPBOX=Panel'
      'TLMDSIMPLEPANEL=Panel'
      'TLMDDBCalendar=Panel'
      'TLMDButtonPanel=Panel'
      'TLMDLMDCalculator=Panel'
      'TLMDHeaderPanel=Panel'
      'TLMDTechnicalLine=Panel'
      'TLMDLMDClock=Panel'
      'TLMDTrackbar=panel'
      'TLMDListCombobox=combobox'
      'TLMDCheckListCombobox=combobox'
      'TLMDHeaderListCombobox=combobox'
      'TLMDImageCombobox=combobox'
      'TLMDColorCombobox=combobox'
      'TLMDFontCombobox=combobox'
      'TLMDFontSizeCombobox=combobox'
      'TLMDFontSizeCombobox=combobox'
      'TLMDPrinterCombobox=combobox'
      'TLMDDriveCombobox=combobox'
      'TLMDCalculatorComboBox=combobox'
      'TLMDTrackBarComboBox=combobox'
      'TLMDCalendarComboBox=combobox'
      'TLMDTreeComboBox=combobox'
      'TLMDRADIOGROUP=radiogroup'
      'TLMDCheckGroup=CheckGroup'
      'TLMDDBRADIOGROUP=radiogroup'
      'TLMDDBCheckGroup=CheckGroup'
      'TLMDCalculatorEdit=edit'
      'TLMDEDIT=Edit'
      'TLMDMASKEDIT=Edit'
      'TLMDBROWSEEDIT=Edit'
      'TLMDEXTSPINEDIT=Edit'
      'TLMDCALENDAREDIT=Edit'
      'TLMDFILEOPENEDIT=Edit'
      'TLMDFILESAVEEDIT=Edit'
      'TLMDCOLOREDIT=Edit'
      'TLMDDBEDIT=Edit'
      'TLMDDBMASKEDIT=Edit'
      'TLMDDBEXTSPINEDIT=Edit'
      'TLMDDBSPINEDIT=Edit'
      'TLMDDBEDITDBLookup=Edit'
      'TLMDEDITDBLookup=Edit'
      'TDBLookupCombobox=Combobox'
      'TWWDBCombobox=Combobox'
      'TWWDBLookupCombo=Combobox'
      'TWWDBCombobox=Combobox'
      'TWWKeyCombo=Combobox'
      'TWWTempKeyCombo=combobox'
      'TWWDBDateTimePicker=Combobox'
      'TWWRADIOGROUP=radiogroup'
      'TWWDBEDIT=Edit'
      'TcxDBCheckBox=checkbox'
      'TcxDBRadioGroup=radiogroup'
      'TcxRadioGroup=radiogroup'
      'TcxCheckBox=checkbox'
      'TOVCPICTUREFIELD=Edit'
      'TOVCDBPICTUREFIELD=Edit'
      'TOVCSLIDEREDIT=Edit'
      'TOVCDBSLIDEREDIT=Edit'
      'TOVCSIMPLEFIELD=Edit'
      'TOVCDBSIMPLEFIELD=Edit'
      'TO32DBFLEXEDIT=Edit'
      'TOVCNUMERICFIELD=Edit'
      'TOVCDBNUMERICFIELD=Edit')
    SkinStore = '(none)'
    SkinFormtype = sfMainform
    Version = '2.65.7.03'
    MenuUpdate = True
    Left = 1088
    Top = 24
    SkinStream = {00000000}
  end
  object MainMenu1: TMainMenu
    Left = 800
    Top = 318
    object Mantenimiento1: TMenuItem
      Caption = 'Mantenimiento'
      object ablas1: TMenuItem
        Caption = 'Tablas'
        OnClick = ablas1Click
      end
    end
  end
end
