object frmReversarCobroEst: TfrmReversarCobroEst
  Left = 346
  Top = 141
  Width = 773
  Height = 335
  Caption = 'Reservar Cobro Cuota'
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
    Left = 16
    Top = 16
    Width = 149
    Height = 16
    Caption = 'Entre Numero Recibo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 168
    Top = 13
    Width = 81
    Height = 21
    TabOrder = 0
  end
  object RxDBGrid1: TRxDBGrid
    Left = 16
    Top = 40
    Width = 721
    Height = 193
    DataSource = dmIngresos.dsqryReciboAReversar
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_CTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_PAGO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDANOESCOLAR'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_RECIBO'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBREESTUDIANTE'
        Width = 268
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Width = 64
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 256
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Buscar'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 240
    Top = 248
    Width = 129
    Height = 33
    Caption = 'Cancela Recibo'
    TabOrder = 3
    Kind = bkOK
  end
  object BitBtn3: TBitBtn
    Left = 376
    Top = 248
    Width = 129
    Height = 33
    Caption = '&Cerrar'
    TabOrder = 4
    Kind = bkClose
  end
end
