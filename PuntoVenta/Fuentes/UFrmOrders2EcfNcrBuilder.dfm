object frmOrders2EcfNcrBuilder: TfrmOrders2EcfNcrBuilder
  Left = 343
  Top = 154
  Width = 1040
  Height = 760
  Caption = 'Dise'#241'ador NCR para Orders2Ecf.Cli'
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
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1032
    Height = 121
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 12
      Width = 82
      Height = 13
      Caption = 'e-NCF referencia'
    end
    object Label2: TLabel
      Left = 258
      Top = 12
      Width = 56
      Height = 13
      Caption = 'Motivo NCR'
    end
    object Label3: TLabel
      Left = 12
      Top = 58
      Width = 37
      Height = 13
      Caption = 'Alcance'
    end
    object Label4: TLabel
      Left = 258
      Top = 58
      Width = 62
      Height = 13
      Caption = 'Fecha origen'
    end
    object Label5: TLabel
      Left = 420
      Top = 58
      Width = 53
      Height = 13
      Caption = 'Fecha NCR'
    end
    object Label6: TLabel
      Left = 588
      Top = 58
      Width = 86
      Height = 13
      Caption = 'D'#237'as transcurridos'
    end
    object lblThirtyRule: TLabel
      Left = 748
      Top = 77
      Width = 242
      Height = 13
      Caption = 'Regla > 30 d'#237'as activa: ITBIS = 0 en la NCR.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object edtRefNcf: TEdit
      Left = 12
      Top = 28
      Width = 229
      Height = 21
      TabOrder = 0
    end
    object cbReason: TComboBox
      Left = 258
      Top = 28
      Width = 269
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = cbReasonChange
    end
    object rgScope: TRadioGroup
      Left = 12
      Top = 72
      Width = 229
      Height = 41
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Total'
        'Parcial')
      TabOrder = 2
      OnClick = rgScopeClick
    end
    object dtpSourceDate: TDateTimePicker
      Left = 258
      Top = 74
      Width = 145
      Height = 21
      Date = 46100.000000000000000000
      Time = 46100.000000000000000000
      TabOrder = 3
      OnChange = dtpSourceDateChange
    end
    object dtpIssueDate: TDateTimePicker
      Left = 420
      Top = 74
      Width = 145
      Height = 21
      Date = 46100.000000000000000000
      Time = 46100.000000000000000000
      TabOrder = 4
      OnChange = dtpIssueDateChange
    end
    object chkApplyItbis: TCheckBox
      Left = 748
      Top = 28
      Width = 145
      Height = 17
      Caption = 'Aplicar ITBIS en NCR'
      TabOrder = 5
    end
    object edtDays: TEdit
      Left = 588
      Top = 74
      Width = 129
      Height = 21
      TabOrder = 6
    end
  end
  object pnlLineEditor: TPanel
    Left = 0
    Top = 121
    Width = 1032
    Height = 120
    Align = alTop
    TabOrder = 1
    object Label7: TLabel
      Left = 12
      Top = 12
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label8: TLabel
      Left = 160
      Top = 12
      Width = 54
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label9: TLabel
      Left = 522
      Top = 12
      Width = 52
      Height = 13
      Caption = 'Cant. orig.'
    end
    object Label10: TLabel
      Left = 614
      Top = 12
      Width = 51
      Height = 13
      Caption = 'Cant. NCR'
    end
    object Label11: TLabel
      Left = 706
      Top = 12
      Width = 29
      Height = 13
      Caption = 'Precio'
    end
    object Label12: TLabel
      Left = 799
      Top = 12
      Width = 40
      Height = 13
      Caption = 'ITBIS %'
    end
    object Label17: TLabel
      Left = 12
      Top = 60
      Width = 70
      Height = 13
      Caption = 'Notas / detalle'
    end
    object edtCode: TEdit
      Left = 12
      Top = 28
      Width = 132
      Height = 21
      TabOrder = 0
    end
    object edtDescription: TEdit
      Left = 160
      Top = 28
      Width = 344
      Height = 21
      TabOrder = 1
    end
    object edtQtyOrig: TEdit
      Left = 522
      Top = 28
      Width = 74
      Height = 21
      TabOrder = 2
      Text = '1'
    end
    object edtQtyNcr: TEdit
      Left = 614
      Top = 28
      Width = 74
      Height = 21
      TabOrder = 3
      Text = '1'
    end
    object edtPrice: TEdit
      Left = 706
      Top = 28
      Width = 74
      Height = 21
      TabOrder = 4
      Text = '0'
    end
    object edtItbis: TEdit
      Left = 799
      Top = 28
      Width = 58
      Height = 21
      TabOrder = 5
      Text = '18'
    end
    object chkInclude: TCheckBox
      Left = 876
      Top = 14
      Width = 129
      Height = 17
      Caption = 'Incluir en NCR'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object chkReturnStock: TCheckBox
      Left = 876
      Top = 34
      Width = 129
      Height = 17
      Caption = 'Devuelve mercanc'#237'a'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object btnAddLine: TButton
      Left = 876
      Top = 56
      Width = 60
      Height = 25
      Caption = 'Agregar'
      TabOrder = 8
      OnClick = btnAddLineClick
    end
    object btnUpdateLine: TButton
      Left = 942
      Top = 56
      Width = 60
      Height = 25
      Caption = 'Actualizar'
      TabOrder = 9
      OnClick = btnUpdateLineClick
    end
    object btnDeleteLine: TButton
      Left = 876
      Top = 86
      Width = 60
      Height = 25
      Caption = 'Eliminar'
      TabOrder = 10
      OnClick = btnDeleteLineClick
    end
    object btnClearEditor: TButton
      Left = 942
      Top = 86
      Width = 60
      Height = 25
      Caption = 'Limpiar'
      TabOrder = 11
      OnClick = btnClearEditorClick
    end
    object memNotes: TMemo
      Left = 12
      Top = 76
      Width = 845
      Height = 35
      TabOrder = 12
    end
  end
  object lvItems: TListView
    Left = 0
    Top = 241
    Width = 1032
    Height = 363
    Align = alClient
    Columns = <
      item
        Caption = 'Incl.'
        Width = 40
      end
      item
        Caption = 'C'#195#179'digo'
        Width = 100
      end
      item
        Caption = 'Descripci'#195#179'n'
        Width = 260
      end
      item
        Caption = 'Cant. Orig.'
        Width = 80
      end
      item
        Caption = 'Cant. NCR'
        Width = 80
      end
      item
        Caption = 'Precio'
        Width = 80
      end
      item
        Caption = 'ITBIS %'
        Width = 70
      end
      item
        Caption = 'Dev. Inv.'
        Width = 70
      end
      item
        Caption = 'Total L'#195#173'nea'
        Width = 90
      end>
    TabOrder = 2
    OnClick = lvItemsClick
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 604
    Width = 1032
    Height = 125
    Align = alBottom
    TabOrder = 3
    object btnOk: TButton
      Left = 828
      Top = 83
      Width = 93
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 927
      Top = 83
      Width = 93
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object btnSelectAll: TButton
      Left = 12
      Top = 83
      Width = 109
      Height = 25
      Caption = 'Marcar todo'
      TabOrder = 2
      OnClick = btnSelectAllClick
    end
    object btnUnselectAll: TButton
      Left = 127
      Top = 83
      Width = 109
      Height = 25
      Caption = 'Desmarcar'
      TabOrder = 3
      OnClick = btnUnselectAllClick
    end
    object gbTotals: TGroupBox
      Left = 12
      Top = 8
      Width = 1008
      Height = 61
      Caption = 'Totales NCR'
      TabOrder = 4
      object Label13: TLabel
        Left = 16
        Top = 28
        Width = 40
        Height = 13
        Caption = 'Subtotal'
      end
      object Label14: TLabel
        Left = 264
        Top = 28
        Width = 26
        Height = 13
        Caption = 'ITBIS'
      end
      object Label15: TLabel
        Left = 512
        Top = 28
        Width = 24
        Height = 13
        Caption = 'Total'
      end
      object Label16: TLabel
        Left = 760
        Top = 28
        Width = 70
        Height = 13
        Caption = 'I'#141'tems incluidos'
      end
      object edtSubtotal: TEdit
        Left = 64
        Top = 24
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edtItbisTotal: TEdit
        Left = 304
        Top = 24
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object edtGrandTotal: TEdit
        Left = 552
        Top = 24
        Width = 145
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object edtItemsCount: TEdit
        Left = 856
        Top = 24
        Width = 81
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
end
