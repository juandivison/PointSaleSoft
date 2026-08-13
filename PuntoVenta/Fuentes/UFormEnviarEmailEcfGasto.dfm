object frmEnviarEmailEcfGasto: TfrmEnviarEmailEcfGasto
  Left = 480
  Top = 220
  Width = 690
  Height = 510
  Caption = 'Enviar e-CF por Email'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblTema: TLabel
    Left = 12
    Top = 12
    Width = 39
    Height = 20
    Caption = 'Tema'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblDestinatarios: TLabel
    Left = 12
    Top = 66
    Width = 112
    Height = 20
    Caption = 'Destinatarios(s)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblMensaje: TLabel
    Left = 12
    Top = 120
    Width = 59
    Height = 20
    Caption = 'Mensaje'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblArchivo: TLabel
    Left = 12
    Top = 334
    Width = 105
    Height = 16
    Caption = 'Archivo PDF adjunto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblEstado: TLabel
    Left = 12
    Top = 444
    Width = 640
    Height = 18
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtTema: TEdit
    Left = 12
    Top = 36
    Width = 646
    Height = 21
    TabOrder = 0
  end
  object edtDestinatario: TEdit
    Left = 12
    Top = 90
    Width = 646
    Height = 21
    Hint = 'Indique emails separados por ;'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object memMensaje: TMemo
    Left = 12
    Top = 146
    Width = 646
    Height = 174
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object edtArchivo: TEdit
    Left = 12
    Top = 356
    Width = 522
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object btnVerArchivo: TButton
    Left = 542
    Top = 354
    Width = 116
    Height = 25
    Caption = 'Ver archivo adjunto'
    TabOrder = 4
    OnClick = btnVerArchivoClick
  end
  object btnEnviar: TBitBtn
    Left = 412
    Top = 396
    Width = 116
    Height = 36
    Caption = '&Enviar Email'
    Default = True
    TabOrder = 5
    OnClick = btnEnviarClick
  end
  object btnCancelar: TBitBtn
    Left = 542
    Top = 396
    Width = 116
    Height = 36
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 6
  end
end
