object frmTipoNomina: TfrmTipoNomina
  Left = 535
  Top = 274
  Width = 265
  Height = 174
  Caption = 'Tipo Nomina'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 16
    Width = 60
    Height = 13
    Caption = 'Tipo Nomina'
  end
  object ComboBox1: TComboBox
    Left = 40
    Top = 32
    Width = 169
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'ComboBox1'
    OnChange = ComboBox1Change
    OnExit = ComboBox1Exit
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 80
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 133
    Top = 80
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end
