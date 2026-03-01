object frmConsultaTimbreEcf: TfrmConsultaTimbreEcf
  Left = 456
  Top = 107
  Width = 1021
  Height = 569
  Caption = 'Relaci'#243'n Timpre e-CF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 40
    Width = 985
    Height = 489
    DataSource = dstblECF_TIMBRE_LOG
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENCF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_SEGURIDAD'
        Width = 164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_CREACION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_EMISION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_TOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'URL_IMAGE'
        Width = 278
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAW_RETURN'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 11
    Width = 75
    Height = 25
    Caption = '&DATOS'
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333FF3FF3333333333CC30003333333333773777333333333C33
      3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
      33003377333337F33377333333333C333300333F333337F33377339333333C33
      3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
      330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
      330077F377F337F33377993399333C33330077FF773337F33377399993333C33
      33333777733337F333FF333333333C33300033333333373FF7773333333333CC
      3000333333333377377733333333333333333333333333333333}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 96
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Ver ECF DGII'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object dstblECF_TIMBRE_LOG: TDataSource
    DataSet = dmFactElectronica.tblECF_TIMBRE_LOG
    Left = 304
    Top = 168
  end
end
