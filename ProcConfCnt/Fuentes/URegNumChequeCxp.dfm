object frmRegNumCheque: TfrmRegNumCheque
  Left = 414
  Top = 139
  Width = 244
  Height = 208
  Caption = 'Reg Datos Cheque'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 65
    Height = 13
    Caption = 'Num. Cheque'
  end
  object Label3: TLabel
    Left = 9
    Top = 53
    Width = 31
    Height = 13
    Caption = 'Banco'
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 120
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 120
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 9
    Top = 70
    Width = 184
    Height = 23
    DropDownCount = 8
    DataField = 'CodBanco'
    DataSource = frmPagarCXPFacturas.dsrxFormaPago
    LookupField = 'CODIGO'
    LookupDisplay = 'DESCRIPCION'
    LookupSource = dmCxp.dstblBanco
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 185
    Height = 21
    DataField = 'NumeroDocumento'
    DataSource = frmPagarCXPFacturas.dsrxFormaPago
    TabOrder = 3
  end
end
