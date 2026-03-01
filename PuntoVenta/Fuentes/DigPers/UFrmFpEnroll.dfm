object FrmFpEnroll: TFrmFpEnroll
  Left = 551
  Top = 302
  BorderStyle = bsDialog
  Caption = 'Enrolamiento de huella'
  ClientHeight = 365
  ClientWidth = 614
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
    Width = 247
    Height = 13
    Caption = 'Coloque el dedo en el lector para registrar la huella...'
  end
  object btnClose: TButton
    Left = 304
    Top = 8
    Width = 89
    Height = 25
    Caption = 'Cerrar'
    TabOrder = 0
    OnClick = btnCloseClick
  end
end
