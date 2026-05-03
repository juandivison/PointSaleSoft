object frmEcfLegacyAdmin: TfrmEcfLegacyAdmin
  Left = 192
  Top = 114
  Width = 1180
  Height = 720
  Caption = 'Administracion Legacy e-CF / Auditoria Manual'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1164
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblTitle: TLabel
      Left = 12
      Top = 8
      Width = 392
      Height = 16
      Caption = 'Administracion manual de tablas legacy/e-CF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFilter: TLabel
      Left = 12
      Top = 34
      Width = 68
      Height = 13
      Caption = 'Filtro rapido:'
    end
    object edtFilter: TEdit
      Left = 84
      Top = 30
      Width = 337
      Height = 21
      TabOrder = 0
    end
    object btnApplyFilter: TBitBtn
      Left = 430
      Top = 28
      Width = 89
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 1
      OnClick = btnApplyFilterClick
    end
    object btnClearFilter: TBitBtn
      Left = 524
      Top = 28
      Width = 89
      Height = 25
      Caption = 'Limpiar'
      TabOrder = 2
      OnClick = btnClearFilterClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 57
    Width = 1164
    Height = 559
    ActivePage = nil
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 616
    Width = 1164
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnOpen: TBitBtn
      Left = 8
      Top = 9
      Width = 82
      Height = 27
      Caption = 'Abrir'
      TabOrder = 0
      OnClick = btnOpenClick
    end
    object btnRefresh: TBitBtn
      Left = 94
      Top = 9
      Width = 82
      Height = 27
      Caption = 'Refrescar'
      TabOrder = 1
      OnClick = btnRefreshClick
    end
    object btnInsert: TBitBtn
      Left = 186
      Top = 9
      Width = 82
      Height = 27
      Caption = 'Insertar'
      TabOrder = 2
      OnClick = btnInsertClick
    end
    object btnEdit: TBitBtn
      Left = 272
      Top = 9
      Width = 82
      Height = 27
      Caption = 'Editar'
      TabOrder = 3
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 358
      Top = 9
      Width = 82
      Height = 27
      Caption = 'Eliminar'
      TabOrder = 4
      OnClick = btnDeleteClick
    end
    object btnPost: TBitBtn
      Left = 456
      Top = 9
      Width = 82
      Height = 27
      Caption = 'Guardar'
      TabOrder = 5
      OnClick = btnPostClick
    end
    object btnCancel: TBitBtn
      Left = 542
      Top = 9
      Width = 82
      Height = 27
      Caption = 'Cancelar'
      TabOrder = 6
      OnClick = btnCancelClick
    end
    object btnClose: TBitBtn
      Left = 1074
      Top = 9
      Width = 82
      Height = 27
      Caption = 'Cerrar'
      TabOrder = 7
      OnClick = btnCloseClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 660
    Width = 1164
    Height = 22
    Panels = <>
    SimplePanel = True
  end
end
