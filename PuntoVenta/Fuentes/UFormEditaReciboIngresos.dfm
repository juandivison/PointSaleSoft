object frmEditaReciboIngresos: TfrmEditaReciboIngresos
  Left = 581
  Top = 149
  Width = 275
  Height = 214
  Caption = 'Modificar Fecha Recibo'
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
    Left = 48
    Top = 16
    Width = 112
    Height = 20
    Caption = 'Fecha Recibo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBDateEdit1: TDBDateEdit
    Left = 48
    Top = 40
    Width = 121
    Height = 21
    DataField = 'FECHA'
    DataSource = dmIngresos.dstblIngresoMaster
    NumGlyphs = 2
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 128
    Width = 89
    Height = 33
    Caption = '&Aceptar'
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 144
    Top = 128
    Width = 81
    Height = 33
    Caption = '&Cancelar'
    TabOrder = 2
    Kind = bkCancel
  end
end
