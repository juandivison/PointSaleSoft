object Form1: TForm1
  Left = 241
  Top = 112
  Width = 736
  Height = 552
  Caption = 'Configuraci'#243'n Cuentas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 69
    Height = 20
    Caption = 'TABLAS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 57
    Width = 75
    Height = 20
    Caption = 'CAMPOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 196
    Top = 59
    Width = 5
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 355
    Top = 17
    Width = 22
    Height = 13
    Caption = 'Cta1'
    FocusControl = DBEdit1
  end
  object Label5: TLabel
    Left = 403
    Top = 17
    Width = 22
    Height = 13
    Caption = 'Cta2'
    FocusControl = DBEdit2
  end
  object Label6: TLabel
    Left = 440
    Top = 17
    Width = 22
    Height = 13
    Caption = 'Cta3'
    FocusControl = DBEdit3
  end
  object Label7: TLabel
    Left = 195
    Top = 18
    Width = 35
    Height = 13
    Caption = 'Modulo'
    FocusControl = DBEdit1
  end
  object Label12: TLabel
    Left = 356
    Top = 59
    Width = 3
    Height = 13
    Color = 65408
    ParentColor = False
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 33
    Width = 185
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object ListBoxCampos: TListBox
    Left = 8
    Top = 81
    Width = 183
    Height = 416
    ItemHeight = 13
    TabOrder = 1
  end
  object DBEdit1: TDBEdit
    Left = 355
    Top = 33
    Width = 43
    Height = 21
    DataField = 'CTA1'
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 403
    Top = 33
    Width = 30
    Height = 21
    DataField = 'CTA2'
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 439
    Top = 33
    Width = 30
    Height = 21
    DataField = 'CTA3'
    TabOrder = 4
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 507
    Top = 17
    Width = 121
    Height = 41
    Caption = '&Origen'
    Columns = 2
    DataField = 'ORIGEN'
    Items.Strings = (
      'Cr'#233'dito'
      'Debito')
    TabOrder = 5
    Values.Strings = (
      '2'
      '1')
  end
  object BitBtn8: TBitBtn
    Left = 472
    Top = 32
    Width = 28
    Height = 21
    Hint = 'Ver cuentas catalogo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333FFF333333333333000333333333
      3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
      3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
      0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
      BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
      33337777773FF733333333333300033333333333337773333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 195
    Top = 33
    Width = 145
    Height = 21
    DropDownCount = 8
    DataField = 'MODULO'
    LookupField = 'ID'
    LookupDisplay = 'DESCRIPCION'
    LookupSource = dmDistCnt.dstblModuloCnt
    TabOrder = 7
  end
end
