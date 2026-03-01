object frmModoConsumoToCredito: TfrmModoConsumoToCredito
  Left = 542
  Top = 221
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Conversi'#243'n de Consumo (E32) a Cr'#233'dito Fiscal (E31)'
  ClientHeight = 383
  ClientWidth = 559
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitulo: TLabel
    Left = 16
    Top = 12
    Width = 320
    Height = 13
    Caption = 
      'Configure la conversi'#243'n de esta factura de consumo a cr'#233'dito fis' +
      'cal.'
  end
  object grpFactura: TGroupBox
    Left = 16
    Top = 32
    Width = 528
    Height = 96
    Caption = ' Factura de consumo seleccionada '
    TabOrder = 0
    object lblTrnCaption: TLabel
      Left = 16
      Top = 24
      Width = 26
      Height = 13
      Caption = 'TRN:'
    end
    object lblTrnValue: TLabel
      Left = 80
      Top = 24
      Width = 36
      Height = 13
      Caption = '000000'
    end
    object lblTipoCaption: TLabel
      Left = 200
      Top = 24
      Width = 49
      Height = 13
      Caption = 'Tipo e-CF:'
    end
    object lblTipoValue: TLabel
      Left = 272
      Top = 24
      Width = 19
      Height = 13
      Caption = 'E32'
    end
    object lblNcfCaption: TLabel
      Left = 16
      Top = 44
      Width = 24
      Height = 13
      Caption = 'NCF:'
    end
    object lblNcfValue: TLabel
      Left = 80
      Top = 44
      Width = 79
      Height = 13
      Caption = 'E320000000000'
    end
    object lblFechaCaption: TLabel
      Left = 200
      Top = 44
      Width = 33
      Height = 13
      Caption = 'Fecha:'
    end
    object lblFechaValue: TLabel
      Left = 272
      Top = 44
      Width = 58
      Height = 13
      Caption = '01/01/2026'
    end
    object lblMontoCaption: TLabel
      Left = 16
      Top = 64
      Width = 56
      Height = 13
      Caption = 'Monto total:'
    end
    object lblMontoValue: TLabel
      Left = 80
      Top = 64
      Width = 21
      Height = 13
      Caption = '0.00'
    end
  end
  object grpModo: TGroupBox
    Left = 16
    Top = 136
    Width = 528
    Height = 88
    Caption = ' Modo de conversi'#243'n '
    TabOrder = 1
    object rgModo: TRadioGroup
      Left = 8
      Top = 16
      Width = 512
      Height = 64
      Items.Strings = (
        
          'Modo 0: Convertir la misma factura E32 en E31 (sin crear nueva v' +
          'enta)'
        
          'Modo 1: Crear nueva factura E31 y Nota de Cr'#233'dito E34 que anula ' +
          'la E32')
      TabOrder = 0
    end
  end
  object grpComprador: TGroupBox
    Left = 16
    Top = 232
    Width = 528
    Height = 88
    Caption = ' Datos del comprador para la factura de cr'#233'dito fiscal (E31) '
    TabOrder = 2
    object lblRncCaption: TLabel
      Left = 16
      Top = 24
      Width = 96
      Height = 13
      Caption = 'RNC del comprador:'
    end
    object lblNombreCaption: TLabel
      Left = 16
      Top = 48
      Width = 114
      Height = 13
      Caption = 'Nombre / Raz'#243'n Social:'
    end
    object lblHint: TLabel
      Left = 16
      Top = 68
      Width = 384
      Height = 13
      Caption = 
        'Nota: El modo de conversi'#243'n es determinado por la configuraci'#243'n ' +
        'global del ERP.'
    end
    object edtRNC: TEdit
      Left = 136
      Top = 20
      Width = 168
      Height = 21
      TabOrder = 0
    end
    object edtNombre: TEdit
      Left = 136
      Top = 44
      Width = 368
      Height = 21
      TabOrder = 1
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 351
    Width = 559
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object btnOK: TButton
      Left = 376
      Top = 4
      Width = 80
      Height = 25
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 464
      Top = 4
      Width = 80
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
end
