object frmSolDatos: TfrmSolDatos
  Left = 392
  Top = 45
  Width = 380
  Height = 480
  Caption = 'Datos Cliente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Cedula'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 37
    Height = 13
    Caption = 'Nombre'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 128
    Width = 51
    Height = 13
    Caption = 'Direccion1'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 176
    Width = 51
    Height = 13
    Caption = 'Direccion2'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 8
    Top = 216
    Width = 42
    Height = 13
    Caption = 'Telefono'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 8
    Top = 256
    Width = 32
    Height = 13
    Caption = 'Celular'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 8
    Top = 304
    Width = 31
    Height = 13
    Caption = 'Sector'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 8
    Top = 344
    Width = 33
    Height = 13
    Caption = 'Ciudad'
    FocusControl = DBEdit8
  end
  object Label9: TLabel
    Left = 8
    Top = 88
    Width = 31
    Height = 13
    Caption = 'Apodo'
    FocusControl = DBEdit9
  end
  object DBStatusLabel1: TDBStatusLabel
    Left = 8
    Top = 400
    Width = 85
    Height = 13
    DatasetName = 'Datos'
    DataSource = DataSource1
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 199
    Height = 21
    DataField = 'Cedula'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 64
    Width = 201
    Height = 21
    DataField = 'Nombre'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 144
    Width = 201
    Height = 21
    DataField = 'Direccion1'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 8
    Top = 192
    Width = 209
    Height = 21
    DataField = 'Direccion2'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 8
    Top = 232
    Width = 97
    Height = 21
    DataField = 'Telefono'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 8
    Top = 272
    Width = 97
    Height = 21
    DataField = 'Celular'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit7: TDBEdit
    Left = 8
    Top = 320
    Width = 209
    Height = 21
    DataField = 'Sector'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBEdit8: TDBEdit
    Left = 8
    Top = 360
    Width = 209
    Height = 21
    DataField = 'Ciudad'
    DataSource = DataSource1
    TabOrder = 8
  end
  object DBEdit9: TDBEdit
    Left = 8
    Top = 104
    Width = 129
    Height = 21
    DataField = 'Apodo'
    DataSource = DataSource1
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 256
    Top = 320
    Width = 75
    Height = 25
    Caption = '&Guardar'
    Default = True
    ModalResult = 1
    TabOrder = 9
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
  object BitBtn2: TBitBtn
    Left = 256
    Top = 360
    Width = 75
    Height = 25
    Caption = '&Salir'
    TabOrder = 10
    Kind = bkClose
  end
  object DataSource1: TDataSource
    DataSet = frmProcVentaRapida.rxSolDatoscte
    Left = 320
    Top = 184
  end
end
