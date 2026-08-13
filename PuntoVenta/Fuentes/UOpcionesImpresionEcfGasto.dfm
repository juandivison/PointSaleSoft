object frmOpcionesImpresionEcfGasto: TfrmOpcionesImpresionEcfGasto
  Left = 356
  Top = 180
  BorderStyle = bsDialog
  Caption = 'Imprimir e-CF de gastos'
  ClientHeight = 430
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 66
    Align = alTop
    BevelOuter = bvNone
    Color = 16776176
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 18
      Top = 12
      Width = 246
      Height = 19
      Caption = 'Salida del comprobante E41 / E43'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubtitulo: TLabel
      Left = 18
      Top = 38
      Width = 459
      Height = 14
      Caption = 'Seleccione formato y destino. No es necesario adivinar opciones de impresion.'
    end
  end
  object grpFormato: TRadioGroup
    Left = 16
    Top = 78
    Width = 292
    Height = 98
    Caption = 'Formato'
    ItemIndex = 0
    Items.Strings = (
      'Ticket punto de venta - 80 mm'
      'Pagina carta - 8.5 x 11 pulgadas')
    TabOrder = 1
  end
  object grpAccion: TRadioGroup
    Left = 320
    Top = 78
    Width = 314
    Height = 126
    Caption = 'Accion'
    ItemIndex = 0
    Items.Strings = (
      'Vista previa'
      'Imprimir'
      'Exportar a PDF'
      'Enviar por email')
    TabOrder = 2
    OnClick = grpAccionClick
  end
  object grpSalida: TGroupBox
    Left = 16
    Top = 214
    Width = 618
    Height = 150
    Caption = 'Opciones de salida'
    TabOrder = 3
    object lblImpresora: TLabel
      Left = 14
      Top = 28
      Width = 55
      Height = 14
      Caption = 'Impresora'
    end
    object lblCopias: TLabel
      Left = 442
      Top = 28
      Width = 34
      Height = 14
      Caption = 'Copias'
    end
    object lblPdf: TLabel
      Left = 14
      Top = 62
      Width = 58
      Height = 14
      Caption = 'Archivo PDF'
    end
    object lblEmail: TLabel
      Left = 14
      Top = 96
      Width = 32
      Height = 14
      Caption = 'Email'
    end
    object cmbImpresora: TComboBox
      Left = 86
      Top = 24
      Width = 344
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 0
    end
    object edtCopias: TEdit
      Left = 486
      Top = 24
      Width = 46
      Height = 22
      TabOrder = 1
      Text = '1'
    end
    object udCopias: TUpDown
      Left = 532
      Top = 24
      Width = 15
      Height = 22
      Associate = edtCopias
      Min = 1
      Max = 20
      Position = 1
      TabOrder = 2
    end
    object edtPdf: TEdit
      Left = 86
      Top = 58
      Width = 458
      Height = 22
      TabOrder = 3
    end
    object btnPdf: TBitBtn
      Left = 550
      Top = 56
      Width = 52
      Height = 26
      Caption = '...'
      TabOrder = 4
      OnClick = btnPdfClick
    end
    object edtEmail: TEdit
      Left = 86
      Top = 92
      Width = 458
      Height = 22
      TabOrder = 5
    end
    object lblAyuda: TLabel
      Left = 14
      Top = 124
      Width = 582
      Height = 14
      AutoSize = False
      Caption = 'Seleccione el formato y la accion.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object btnAceptar: TBitBtn
    Left = 382
    Top = 382
    Width = 120
    Height = 34
    Caption = 'Continuar'
    Default = True
    TabOrder = 4
    OnClick = btnAceptarClick
  end
  object btnCancelar: TBitBtn
    Left = 514
    Top = 382
    Width = 120
    Height = 34
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 5
  end
  object dlgPdf: TSaveDialog
    DefaultExt = 'pdf'
    Filter = 'Documento PDF (*.pdf)|*.pdf'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 24
    Top = 382
  end
end
