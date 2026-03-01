object frmTemporalForm: TfrmTemporalForm
  Left = 86
  Top = 100
  Width = 1171
  Height = 572
  Caption = 'TemporalForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 897
    Top = 290
    Width = 81
    Height = 24
    Caption = 'Sub-Total'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label7: TLabel
    Left = 851
    Top = 431
    Width = 133
    Height = 24
    Caption = 'Monto Recibido'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label8: TLabel
    Left = 888
    Top = 485
    Width = 95
    Height = 24
    Caption = 'Devoluci'#243'n'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label13: TLabel
    Left = 952
    Top = 358
    Width = 32
    Height = 24
    Caption = 'Itbis'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label14: TLabel
    Left = 905
    Top = 311
    Width = 72
    Height = 24
    Caption = 'Recargo'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label15: TLabel
    Left = 898
    Top = 457
    Width = 86
    Height = 24
    Caption = 'Total Neto'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label17: TLabel
    Left = 881
    Top = 382
    Width = 103
    Height = 20
    Caption = 'Monto Interes.'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Label29: TLabel
    Left = 844
    Top = 384
    Width = 135
    Height = 20
    Caption = 'Sub-Total Indirecto'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Label41: TLabel
    Left = 888
    Top = 409
    Width = 94
    Height = 16
    Caption = 'Nota de Cr'#233'dito'
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label44: TLabel
    Left = 867
    Top = 335
    Width = 110
    Height = 16
    Caption = 'Monto Desc. Items'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText2: TDBText
    Left = 1000
    Top = 289
    Width = 125
    Height = 19
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'SubTotal'
    DataSource = dsTotal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText16: TDBText
    Left = 1000
    Top = 333
    Width = 125
    Height = 20
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'MontoDescItems'
    DataSource = dsTotal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText3: TDBText
    Left = 1000
    Top = 358
    Width = 125
    Height = 20
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'itbis'
    DataSource = dsTotal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object dbTextMontoExoneraITBIS: TDBText
    Left = 1000
    Top = 381
    Width = 125
    Height = 22
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'MontoExoneraITBIS'
    DataSource = dsTotal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText15: TDBText
    Left = 1000
    Top = 406
    Width = 125
    Height = 22
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'MontoNCRAplicado'
    DataSource = dsTotal
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText5: TDBText
    Left = 1000
    Top = 457
    Width = 125
    Height = 23
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'totalneto'
    DataSource = dsTotal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object DBText7: TDBText
    Left = 1000
    Top = 485
    Width = 125
    Height = 21
    Alignment = taRightJustify
    Color = clBlack
    DataField = 'devolucion'
    DataSource = dsTotal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 24
    Top = 8
    Width = 985
    Height = 217
    DataSource = DataSource2
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Serie'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fecha'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CantPax'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cant'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Precio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoBruto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Devolucion'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoNeto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'porc_desc'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Itbi'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PorcDescItem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoDescItem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Recargo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoTranspItbis'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoItbisRecargo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoDescGlbDist'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoDesGlobal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDTasaITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoDescuento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descripcion'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoItbisenPrecio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodUsuario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodArticulo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumeroRecibo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodTexto'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumeroTrn'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TipoUnidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ItbisExento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TipoVenta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumeroCotiza'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Moneda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MonedaBase'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RutaImagen'
        Visible = True
      end>
  end
  object RxDBGrid2: TRxDBGrid
    Left = 8
    Top = 240
    Width = 841
    Height = 120
    DataSource = dsTotal
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'montodesc'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'totalneto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoITBISRecargo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoExoneraITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoItbRecItmConDesc'
        Visible = True
      end
      item
        Color = 11595432
        Expanded = False
        FieldName = 'MontoDescGlbItbis'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoNotaCredito'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoNCRAplicado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PorcDesAdicional'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoDescAdicional'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ReferenciaCte'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoDescItems'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Recargo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TipoNCF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TipoNCFIFiscal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SubTotal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'itbis'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'montorecibido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'devolucion'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ncf_numero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoInteres'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PorcientoInteres'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PorcTrans'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Moneda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoEnTarjeta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoEnEfectivo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoEnCheque'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoEnBonos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Diferencia'
        Visible = True
      end>
  end
  object chkExento: TCheckBox
    Left = 890
    Top = 365
    Width = 55
    Height = 14
    Caption = 'E&xento'
    Color = 33023
    ParentColor = False
    TabOrder = 2
    Visible = False
  end
  object DBEdit10: TDBEdit
    Left = 1000
    Top = 309
    Width = 125
    Height = 21
    DataField = 'Recargo'
    DataSource = dsTotal
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 1000
    Top = 429
    Width = 125
    Height = 28
    Hint = 'Entre monto dinero entragado,para calcular devolucion'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 1016
    Top = 160
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object RxDBGrid3: TRxDBGrid
    Left = 16
    Top = 368
    Width = 801
    Height = 120
    DataSource = dsrxError
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dsTotal: TDataSource
    Left = 448
    Top = 160
  end
  object DataSource2: TDataSource
    Left = 536
    Top = 200
  end
  object dsrxError: TDataSource
    DataSet = dmCalculos.rxError
    Left = 592
    Top = 400
  end
end
