object frmContabilizaCheques: TfrmContabilizaCheques
  Left = 196
  Top = 113
  Width = 941
  Height = 509
  Caption = 'Contabilizar Cheques'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 933
    Height = 35
    Align = alTop
    TabOrder = 0
    object RxSpeedButton1: TRxSpeedButton
      Left = 373
      Top = 3
      Width = 93
      Height = 25
      DropDownMenu = PopupMenu1
      Caption = '&Reportes'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
        00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
        00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
        F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
        FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
        0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
        0033333337FFFFFF773333333000000003333333377777777333}
      Layout = blGlyphLeft
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 112
      Top = 4
      Width = 71
      Height = 25
      Caption = '&Datos'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object btnContabilizar: TBitBtn
      Left = 193
      Top = 4
      Width = 79
      Height = 25
      Cancel = True
      Caption = '&Contabiliza'
      TabOrder = 1
      OnClick = btnContabilizarClick
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        000808888888888888080808080808080808000000000000000880EFEFEFEF08
        888880F0000EF088888880E080EF0088888880F00EF08008888880E0EF088000
        888880FEF08880B7088880EF088880B8088880F08888880B708880088888880B
        008880888888888019088888888888800088}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 285
      Top = 3
      Width = 75
      Height = 25
      TabOrder = 2
      Kind = bkClose
    end
    object dtpkFecha: TDateTimePicker
      Left = 9
      Top = 6
      Width = 95
      Height = 21
      Date = 36897.067017361110000000
      Time = 36897.067017361110000000
      TabOrder = 3
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 35
    Width = 933
    Height = 443
    ActivePage = tabDatos
    Align = alClient
    TabOrder = 1
    object tabDatos: TTabSheet
      Caption = 'Cheques'
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 925
        Height = 399
        Align = alClient
        Color = 10460943
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMERO_CKS'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_TRANS'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_CIA'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_PAGO'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BENEFICIARIO'
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MONTO'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUENTA1'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUENTA2'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUENTA3'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITO'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITO'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Width = 47
            Visible = True
          end>
      end
      object ProgressBar1: TProgressBar
        Left = 0
        Top = 399
        Width = 925
        Height = 16
        Align = alBottom
        Step = 1
        TabOrder = 1
      end
    end
    object tabTranprev: TTabSheet
      Caption = 'Datos a Cnt'
      ImageIndex = 1
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 925
        Height = 415
        Align = alClient
        Color = 9824991
        DataSource = dmCxc.dtRxTranCnt
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
            FieldName = 'rxCuenta1'
            Width = 23
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rxCuenta2'
            Width = 18
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rxCuenta3'
            Width = 22
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rxFecha'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rxDescripcion'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rxDebito'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rxCredito'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NombreCuenta'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rxCuenta'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rxCodCte'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rxNumFact'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescCliente'
            Visible = True
          end>
      end
    end
    object tabTrancnt: TTabSheet
      Caption = 'Transacciones cnt'
      ImageIndex = 2
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 925
        Height = 415
        Align = alClient
        Color = 8767917
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object qrycks: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Cheques.NUM_TRANS, Cheques.CODIGO_CIA, '
      'Cheques.NUMERO_CKS,'
      'Cheques.FECHA_PAGO, Cheques.BENEFICIARIO, Cheques.MONTO, '
      'Cheques_det.CUENTA1, Cheques_det.CUENTA2, Cheques_det.CUENTA3, '
      'Cheques_det.CREDITO, Cheques_det.DEBITO, Cheques_det.STATUS,'
      'Cheques.FECHA_EMISION, Cheques.COD_BANCO'
      'FROM CHEQUES Cheques'
      '   INNER JOIN CHEQUES_DET Cheques_det'
      '   ON  (Cheques.NUM_TRANS = Cheques_det.NUM_TRANS)  '
      'WHERE Cheques.FECHA_EMISION between :fechaini and :fechafin'
      'and cheques.status in ('#39'N'#39','#39'P'#39')'
      'ORDER BY Cheques.FECHA_PAGO,Cheques.NUMERO_CKS'
      '')
    Left = 396
    Top = 147
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fechaini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fechafin'
        ParamType = ptUnknown
      end>
    object qrycksNUM_TRANS: TFloatField
      FieldName = 'NUM_TRANS'
      Origin = 'CHEQUES.NUM_TRANS'
      Required = True
    end
    object qrycksCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
      Origin = 'CHEQUES.CODIGO_CIA'
      Required = True
    end
    object qrycksNUMERO_CKS: TIntegerField
      FieldName = 'NUMERO_CKS'
      Origin = 'CHEQUES.NUMERO_CKS'
    end
    object qrycksFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Origin = 'CHEQUES.FECHA_PAGO'
    end
    object qrycksBENEFICIARIO: TIBStringField
      FieldName = 'BENEFICIARIO'
      Origin = 'CHEQUES.BENEFICIARIO'
      Size = 60
    end
    object qrycksMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'CHEQUES.MONTO'
    end
    object qrycksCUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Origin = 'CHEQUES_DET.CUENTA1'
      FixedChar = True
      Size = 3
    end
    object qrycksCUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Origin = 'CHEQUES_DET.CUENTA2'
      FixedChar = True
      Size = 2
    end
    object qrycksCUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Origin = 'CHEQUES_DET.CUENTA3'
      FixedChar = True
      Size = 2
    end
    object qrycksCREDITO: TFloatField
      FieldName = 'CREDITO'
      Origin = 'CHEQUES_DET.CREDITO'
    end
    object qrycksDEBITO: TFloatField
      FieldName = 'DEBITO'
      Origin = 'CHEQUES_DET.DEBITO'
    end
    object qrycksSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CHEQUES_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qrycksFECHA_EMISION: TDateTimeField
      FieldName = 'FECHA_EMISION'
      Origin = 'CHEQUES.FECHA_EMISION'
    end
    object qrycksCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Origin = 'CHEQUES.COD_BANCO'
      Required = True
    end
  end
  object dtqrycks: TDataSource
    DataSet = qrycks
    Left = 140
    Top = 155
  end
  object PopupMenu1: TPopupMenu
    Left = 236
    Top = 178
    object EntradaCnt1: TMenuItem
      Caption = '&Entrada Cnt'
      OnClick = EntradaCnt1Click
    end
    object MvtosCtas1: TMenuItem
      Caption = '&Mvtos Ctas  Det'
      OnClick = MvtosCtas1Click
    end
  end
end
