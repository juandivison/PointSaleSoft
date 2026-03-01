object frmSelDatosIntegrarNom: TfrmSelDatosIntegrarNom
  Left = 337
  Top = 166
  BorderStyle = bsDialog
  Caption = 'Integrar N'#243'mina'
  ClientHeight = 158
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 11
    Top = 87
    Width = 33
    Height = 13
    Caption = 'Fecha '
  end
  object Label3: TLabel
    Left = 11
    Top = 10
    Width = 83
    Height = 13
    Caption = 'Codigo Compa'#241'ia'
  end
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 60
    Height = 13
    Caption = 'Tipo Nomina'
  end
  object dtpkFechaNom: TDateTimePicker
    Left = 11
    Top = 101
    Width = 150
    Height = 21
    Date = 38741.470527164350000000
    Time = 38741.470527164350000000
    TabOrder = 2
    OnExit = dtpkFechaNomExit
  end
  object ComboBox2: TComboBox
    Left = 11
    Top = 26
    Width = 152
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox2Change
  end
  object BitBtn1: TBitBtn
    Left = 188
    Top = 16
    Width = 105
    Height = 33
    Caption = '&Aceptar'
    Default = True
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 187
    Top = 80
    Width = 105
    Height = 33
    Caption = '&Cancelar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Kind = bkCancel
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 64
    Width = 153
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBox1Change
    OnExit = ComboBox1Exit
  end
end
