object frmConcARSRRecord: TfrmConcARSRRecord
  Left = 717
  Top = 142
  Width = 421
  Height = 370
  Caption = 'Record'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 112
    Height = 13
    Caption = 'NUM_AUTORIZACION'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 208
    Top = 16
    Width = 113
    Height = 13
    Caption = 'MONTO_COBERTURA'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 24
    Top = 56
    Width = 48
    Height = 13
    Caption = 'AFILIADO'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 24
    Top = 99
    Width = 22
    Height = 13
    Caption = 'NSS'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 24
    Top = 144
    Width = 42
    Height = 13
    Caption = 'MOTIVO'
    FocusControl = DBMemo1
  end
  object DBEdit1: TDBEdit
    Left = 24
    Top = 32
    Width = 177
    Height = 21
    DataField = 'NUM_AUTORIZACION'
    DataSource = frmConciliacionDeFctSeguro.dstblArsConciliarDet
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 208
    Top = 32
    Width = 177
    Height = 21
    DataField = 'MONTO_COBERTURA'
    DataSource = frmConciliacionDeFctSeguro.dstblArsConciliarDet
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 24
    Top = 72
    Width = 337
    Height = 21
    AutoSize = False
    DataField = 'AFILIADO'
    DataSource = frmConciliacionDeFctSeguro.dstblArsConciliarDet
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 24
    Top = 115
    Width = 160
    Height = 21
    DataField = 'NSS'
    DataSource = frmConciliacionDeFctSeguro.dstblArsConciliarDet
    TabOrder = 3
  end
  object DBMemo1: TDBMemo
    Left = 24
    Top = 160
    Width = 361
    Height = 89
    DataField = 'MOTIVO'
    DataSource = frmConciliacionDeFctSeguro.dstblArsConciliarDet
    TabOrder = 4
  end
  object btnCancelar: TBitBtn
    Tag = 4041
    Left = 235
    Top = 276
    Width = 90
    Height = 37
    Caption = 'Cancelar'
    TabOrder = 5
    Kind = bkCancel
  end
  object btnSalvar: TBitBtn
    Tag = 4033
    Left = 112
    Top = 276
    Width = 90
    Height = 37
    Caption = '&Guardar'
    TabOrder = 6
    Kind = bkOK
  end
  object BitBtn10: TBitBtn
    Left = 240
    Top = 123
    Width = 65
    Height = 25
    TabOrder = 7
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333FF3333333333333003333333333333F77F33333333333009033
      333333333F7737F333333333009990333333333F773337FFFFFF330099999000
      00003F773333377777770099999999999990773FF33333FFFFF7330099999000
      000033773FF33777777733330099903333333333773FF7F33333333333009033
      33333333337737F3333333333333003333333333333377333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object BitBtn11: TBitBtn
    Left = 321
    Top = 123
    Width = 59
    Height = 25
    TabOrder = 8
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333FF3333333333333003333
      3333333333773FF3333333333309003333333333337F773FF333333333099900
      33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
      99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
      33333333337F3F77333333333309003333333333337F77333333333333003333
      3333333333773333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
end
