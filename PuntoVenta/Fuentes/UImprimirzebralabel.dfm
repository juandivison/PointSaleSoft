object frmImpZebraLabel: TfrmImpZebraLabel
  Left = 521
  Top = 178
  Width = 520
  Height = 406
  Caption = 'Imprimir Label'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 208
    Top = 24
    Width = 51
    Height = 13
    Caption = 'Impresoras'
  end
  object Label2: TLabel
    Left = 19
    Top = 72
    Width = 54
    Height = 13
    Caption = 'Produccion'
  end
  object Label3: TLabel
    Left = 17
    Top = 208
    Width = 37
    Height = 13
    Caption = 'Backup'
  end
  object Label4: TLabel
    Left = 16
    Top = 344
    Width = 153
    Height = 13
    Caption = 'https://labelary.com/viewer.html'
  end
  object Button1: TButton
    Left = 112
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Imprime Label'
    TabOrder = 0
    OnClick = Button1Click
  end
  object cboxImpresoras: TComboBox
    Left = 208
    Top = 40
    Width = 273
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 16
    Top = 88
    Width = 329
    Height = 113
    Lines.Strings = (
      '^XA'
      '^FO10,10^A0N,16,26^FD[nombrecia]^FS'
      '^FO10,30^A0N,12,20^FD[telefonocia]^FS'
      '^FO10,44^A0N,12,12^FD[descripcionproducto]^FS'
      '^FO10,58^A0N,12,15^FDPRECIO RD [precioprod]^FS'
      '^FO10,72^BY2,3,10^B3N,N,30,Y,N^FD[codigoprod]^FS'
      '^XZ')
    TabOrder = 2
  end
  object Memo2: TMemo
    Left = 16
    Top = 226
    Width = 329
    Height = 113
    Lines.Strings = (
      '^XA'
      '^FO10,10^A0N,16,26^FD[nombrecia]^FS'
      '^FO10,30^A0N,12,20^FD[telefonocia]^FS'
      '^FO10,44^A0N,12,12^FD[descripcionproducto]^FS'
      '^FO10,58^A0N,12,15^FDPRECIO RD [precioprod]^FS'
      '^FO10,72^BY2,3,10^B3N,N,30,Y,N^FD[codigoprod]^FS'
      '^XZ')
    TabOrder = 3
  end
  object btnGuardar: TBitBtn
    Left = 352
    Top = 216
    Width = 80
    Height = 25
    Caption = '&Guardar'
    TabOrder = 4
    OnClick = btnGuardarClick
  end
  object edtNombreFileZPL: TEdit
    Left = 352
    Top = 248
    Width = 143
    Height = 21
    Hint = 'Indique nombre del archivo, incluya extension.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Text = 'LabelZPL001.zpl'
  end
  object btnReset: TBitBtn
    Left = 436
    Top = 216
    Width = 58
    Height = 25
    Caption = 'Reset'
    TabOrder = 6
    OnClick = btnResetClick
  end
end
