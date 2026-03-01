object FrmFpDeviceInfo: TFrmFpDeviceInfo
  Left = 350
  Top = 220
  Width = 820
  Height = 560
  Caption = 'Info del lector de huellas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblSdk: TLabel
    Left = 16
    Top = 12
    Width = 151
    Height = 13
    Caption = 'Lectores (DigitalPersona / SDK)'
  end
  object lblWmi: TLabel
    Left = 16
    Top = 184
    Width = 166
    Height = 13
    Caption = 'Dispositivos (Windows / WMI PnP)'
  end
  object lbSdkReaders: TListBox
    Left = 16
    Top = 28
    Width = 377
    Height = 145
    ItemHeight = 13
    TabOrder = 0
    OnClick = lbSdkReadersClick
  end
  object lbWmiDevices: TListBox
    Left = 16
    Top = 200
    Width = 377
    Height = 145
    ItemHeight = 13
    TabOrder = 1
    OnClick = lbWmiDevicesClick
  end
  object memoInfo: TMemo
    Left = 408
    Top = 28
    Width = 385
    Height = 401
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object btnRefresh: TButton
    Left = 16
    Top = 368
    Width = 113
    Height = 25
    Caption = 'Refrescar'
    TabOrder = 3
    OnClick = btnRefreshClick
  end
  object btnClose: TButton
    Left = 144
    Top = 368
    Width = 113
    Height = 25
    Caption = 'Cerrar'
    TabOrder = 4
    OnClick = btnCloseClick
  end
end
