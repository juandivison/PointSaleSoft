object frmOrders2EcfRunner: TfrmOrders2EcfRunner
  Left = 239
  Top = 112
  Width = 920
  Height = 690
  Caption = 'Orders2Ecf Runner'
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
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 912
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
    Top = 402
    Width = 361
    Height = 194
    Align = alLeft
    Caption = 'Carpetas de Ordenes'
    TabOrder = 1
    object lbFolders: TListBox
      Left = 12
      Top = 24
      Width = 337
      Height = 417
      ItemHeight = 13
      TabOrder = 0
    end
    object btnAddFolder: TButton
      Left = 12
      Top = 450
      Width = 105
      Height = 25
      Caption = 'Agregar...'
      TabOrder = 1
      OnClick = btnAddFolderClick
    end
    object btnRemoveFolder: TButton
      Left = 124
      Top = 450
      Width = 105
      Height = 25
      Caption = 'Quitar'
      TabOrder = 2
      OnClick = btnRemoveFolderClick
    end
    object btnClearFolders: TButton
      Left = 236
      Top = 450
      Width = 113
      Height = 25
      Caption = 'Limpiar todo'
      TabOrder = 3
      OnClick = btnClearFoldersClick
    end
  end
  object gbMode: TGroupBox
    Left = 0
    Top = 73
    Width = 912
    Height = 161
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
    object rgMode: TRadioGroup
      Left = 16
      Top = 24
      Width = 521
      Height = 81
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Normal'
        'Dummy'
        'Reprint'
        'Replay')
      TabOrder = 0
      OnClick = rgModeClick
    end
    object edtNcf: TEdit
      Left = 120
      Top = 118
      Width = 233
      Height = 21
      TabOrder = 1
    end
  end
  object gbOptions: TGroupBox
    Left = 0
    Top = 234
    Width = 912
    Height = 168
    Align = alTop
    Caption = 'Opciones y par'#225'metros'
    TabOrder = 3
    object lblExtraArgs: TLabel
      Left = 16
      Top = 110
      Width = 87
      Height = 13
      Caption = 'Argumentos extra'
    end
    object chkLegacyImport: TCheckBox
      Left = 16
      Top = 28
      Width = 185
      Height = 17
      Caption = 'Legacy Import (--legacy-import)'
      TabOrder = 0
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
    object edtExtraArgs: TEdit
      Left = 16
      Top = 126
      Width = 521
      Height = 21
      TabOrder = 5
    end
  end
  object gbLog: TGroupBox
    Left = 361
    Top = 402
    Width = 551
    Height = 194
    Align = alClient
    Caption = 'Log de ejecuci'#243'n'
    TabOrder = 4
    object memLog: TMemo
      Left = 2
      Top = 15
      Width = 547
      Height = 177
      Align = alClient
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 596
    Width = 912
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
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 640
    Width = 912
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object OpenDialogExe: TOpenDialog
    Left = 808
    Top = 88
  end
end
