object frmCambiarClaveUsuario: TfrmCambiarClaveUsuario
  Left = 263
  Top = 132
  Width = 292
  Height = 273
  Caption = 'Cambio de Clave'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFE
    73FFFFFC21FFFFFC21FFFFFC21FFFFFC21FFFFFC21FFFFFC21FFFFFC21FFFFFC
    21FFFFFC21FFFFFC21FFFFFC01BFFFFC011FFFFC011FFFFC011FFFFC011FFFFC
    011FFFFC011FFFFC011FFFFC001FFFF8001FFFF0001FFFE0003FFFC0007FFF81
    0FFFFF0607FFFE0C03FFFC1C03FFF83C03FFF07C03FFF0FE07FFF1FF0FFF}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 284
    Height = 239
    Align = alClient
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 56
      Width = 76
      Height = 13
      Caption = 'Entre usuario'
    end
    object Label2: TLabel
      Left = 16
      Top = 96
      Width = 81
      Height = 13
      Caption = 'Clave Anterior'
    end
    object Label3: TLabel
      Left = 16
      Top = 136
      Width = 74
      Height = 13
      Caption = 'Clave Nueva'
    end
    object Label4: TLabel
      Left = 16
      Top = 179
      Width = 123
      Height = 13
      Caption = 'Reentre Clave Nueva'
    end
    object Label5: TLabel
      Left = 158
      Top = 72
      Width = 104
      Height = 13
      Caption = 'Usuario Logueado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 282
      Height = 42
      HelpContext = 20
      Align = alTop
      Color = clMoneyGreen
      TabOrder = 0
      object BitBtn5: TBitBtn
        Left = 27
        Top = 8
        Width = 126
        Height = 25
        Caption = '&Cambiar Clave'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn5Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
      object BitBtn8: TBitBtn
        Left = 160
        Top = 8
        Width = 105
        Height = 25
        Caption = '&Salir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Kind = bkClose
      end
    end
    object DBImage1: TDBImage
      Left = 157
      Top = 92
      Width = 105
      Height = 105
      DataField = 'Foto'
      DataSource = dstblCambiarClaveUsuario
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 16
      Top = 72
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object Edit2: TEdit
      Left = 16
      Top = 112
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
    end
    object Edit3: TEdit
      Left = 16
      Top = 152
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 4
    end
    object Edit4: TEdit
      Left = 16
      Top = 195
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 5
    end
  end
  object dstblCambiarClaveUsuario: TDataSource
    DataSet = dmUsuarios.tblUsuarios
    Left = 200
    Top = 96
  end
end
