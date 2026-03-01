object FrmFpVerify: TFrmFpVerify
  Left = 347
  Top = 215
  BorderStyle = bsDialog
  Caption = 'Autorizacion por huella'
  ClientHeight = 209
  ClientWidth = 353
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
  object lblInfo: TLabel
    Left = 16
    Top = 16
    Width = 269
    Height = 13
    Caption = 'Coloque el dedo en el lector para autorizar la operacion...'
  end
  object btnCancel: TButton
    Left = 152
    Top = 136
    Width = 89
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 0
    OnClick = btnCancelClick
  end
end
