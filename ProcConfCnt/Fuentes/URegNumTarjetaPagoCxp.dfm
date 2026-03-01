object frmRegNumTarjeta: TfrmRegNumTarjeta
  Left = 358
  Top = 272
  Width = 274
  Height = 186
  Caption = 'Registrar Datos Tarjeta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 61
    Height = 13
    Caption = 'Num. Tarjeta'
  end
  object Label2: TLabel
    Left = 8
    Top = 49
    Width = 82
    Height = 13
    Caption = 'Num. Aprobacion'
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 101
    Width = 75
    Height = 25
    TabOrder = 0
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 152
    Top = 101
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 185
    Height = 21
    DataField = 'NumeroTarjeta'
    DataSource = frmPagarCXPFacturas.dsrxFormaPago
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 64
    Width = 185
    Height = 21
    DataField = 'NumeroAutorizacion'
    DataSource = frmPagarCXPFacturas.dsrxFormaPago
    TabOrder = 3
  end
end
