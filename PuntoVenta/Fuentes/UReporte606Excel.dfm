object frmReporte606Excel: TfrmReporte606Excel
  Left = 380
  Top = 240
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Reporte 606 - Compras de Bienes y Servicios'
  ClientHeight = 250
  ClientWidth = 650
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
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 16
      Top = 12
      Width = 265
      Height = 20
      Caption = 'Reporte de apoyo para Formato 606'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubtitulo: TLabel
      Left = 16
      Top = 40
      Width = 509
      Height = 13
      Caption = 'Compras, bienes, servicios, ITBIS y retenciones. Excluye operaciones canceladas.'
    end
  end
  object pnlPeriodo: TPanel
    Left = 0
    Top = 72
    Width = 650
    Height = 178
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object lblDesde: TLabel
      Left = 24
      Top = 24
      Width = 67
      Height = 13
      Caption = 'Fecha desde:'
    end
    object lblHasta: TLabel
      Left = 320
      Top = 24
      Width = 64
      Height = 13
      Caption = 'Fecha hasta:'
    end
    object lblAyuda: TLabel
      Left = 24
      Top = 72
      Width = 594
      Height = 33
      AutoSize = False
      Caption = 
        'El Excel incluye una fila TOTAL GENERAL y una columna Revision Contable para identificar datos que requieren validacion antes de remitir el 606.'
      WordWrap = True
    end
    object dtpDesde: TDateTimePicker
      Left = 104
      Top = 20
      Width = 145
      Height = 21
      Date = 46245.000000000000000000
      Time = 46245.000000000000000000
      TabOrder = 0
    end
    object dtpHasta: TDateTimePicker
      Left = 400
      Top = 20
      Width = 145
      Height = 21
      Date = 46245.000000000000000000
      Time = 46245.000000000000000000
      TabOrder = 1
    end
    object btnGenerar: TBitBtn
      Left = 360
      Top = 124
      Width = 120
      Height = 30
      Caption = 'Generar Excel'
      TabOrder = 2
      OnClick = btnGenerarClick
    end
    object btnCerrar: TBitBtn
      Left = 496
      Top = 124
      Width = 120
      Height = 30
      Caption = 'Cerrar'
      TabOrder = 3
      OnClick = btnCerrarClick
    end
  end
  object qry606: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 24
    Top = 200
  end
end
