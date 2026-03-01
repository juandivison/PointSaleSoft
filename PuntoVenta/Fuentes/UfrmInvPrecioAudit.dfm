object frmInvPrecioAudit: TfrmInvPrecioAudit
  Left = 256
  Top = 125
  Width = 746
  Height = 180
  Caption = 'Inventario'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Codigo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 56
    Height = 13
    Caption = 'Descripcion'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 152
    Top = 8
    Width = 84
    Height = 13
    Caption = 'CODIGO_TEXTO'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 286
    Top = 8
    Width = 61
    Height = 13
    Caption = 'Codigo Barra'
    FocusControl = DBEdit4
  end
  object DBStatusLabel2: TDBStatusLabel
    Left = 568
    Top = 104
    Width = 85
    Height = 13
    DatasetName = 'Inventario'
    DataSource = dmInventario.dsInventarioProd
    Style = lsRecordSize
    ShowOptions = doBoth
  end
  object Label5: TLabel
    Left = 451
    Top = 48
    Width = 50
    Height = 13
    Caption = 'Precio Det'
    FocusControl = DBEdit4
  end
  object Label6: TLabel
    Left = 369
    Top = 48
    Width = 27
    Height = 13
    Caption = 'Costo'
    FocusControl = DBEdit4
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 134
    Height = 21
    DataField = 'CODIGO'
    DataSource = dmInventario.dsInventarioProd
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 64
    Width = 353
    Height = 21
    AutoSize = False
    DataField = 'DESCRIPCION'
    DataSource = dmInventario.dsInventarioProd
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 152
    Top = 24
    Width = 129
    Height = 21
    DataField = 'CODIGO_TEXTO'
    DataSource = dmInventario.dsInventarioProd
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 286
    Top = 24
    Width = 200
    Height = 21
    AutoSize = False
    DataField = 'CODIGO_BARRA'
    DataSource = dmInventario.dsInventarioProd
    TabOrder = 3
  end
  object BitBtn29: TBitBtn
    Left = 563
    Top = 59
    Width = 98
    Height = 25
    Caption = 'Precio x &Unidad'
    TabOrder = 4
    OnClick = BitBtn29Click
  end
  object BitBtn35: TBitBtn
    Tag = 4058
    Left = 563
    Top = 21
    Width = 98
    Height = 27
    Caption = '&Consulta'
    TabOrder = 5
    OnClick = BitBtn35Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
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
  object BitBtn1: TBitBtn
    Left = 192
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Anterior'
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 280
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Pr'#243'ximo'
    TabOrder = 7
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 112
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Primero'
    TabOrder = 8
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 368
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Ultimo'
    TabOrder = 9
    OnClick = BitBtn4Click
  end
  object DBEdit5: TDBEdit
    Left = 448
    Top = 64
    Width = 76
    Height = 21
    DataField = 'PRECIO'
    DataSource = dmInventario.dsInventarioProd
    TabOrder = 10
  end
  object DBEdit6: TDBEdit
    Left = 366
    Top = 64
    Width = 76
    Height = 21
    DataField = 'PRECIO_COMPRA'
    DataSource = dmInventario.dsInventarioProd
    TabOrder = 11
  end
end
