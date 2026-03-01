object frmInfoParaTicketFiscal: TfrmInfoParaTicketFiscal
  Left = 238
  Top = 53
  Width = 915
  Height = 670
  Caption = 'Info para Ticket fiscal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 8
    Width = 425
    Height = 185
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object RxDBGrid2: TRxDBGrid
    Left = 448
    Top = 8
    Width = 425
    Height = 185
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object RxDBGrid3: TRxDBGrid
    Left = 8
    Top = 208
    Width = 425
    Height = 185
    DataSource = DataSource3
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object RxDBGrid4: TRxDBGrid
    Left = 456
    Top = 208
    Width = 425
    Height = 185
    DataSource = DataSource4
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object RxDBGrid5: TRxDBGrid
    Left = 8
    Top = 408
    Width = 425
    Height = 209
    DataSource = DataSource5
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = dmReportes.qryViewVentasMast
    Left = 112
    Top = 80
  end
  object DataSource2: TDataSource
    DataSet = dmFactura.qryVentaFactura
    Left = 544
    Top = 72
  end
  object DataSource3: TDataSource
    DataSet = dmReportes.qryDatosVentaMaster
    Left = 160
    Top = 256
  end
  object DataSource4: TDataSource
    DataSet = dmFactura.qryGetNcfAsignado
    Left = 600
    Top = 256
  end
  object DataSource5: TDataSource
    DataSet = dmReportes.qryDatosRepTranscxcIFiscal
    Left = 392
    Top = 472
  end
  object DataSource6: TDataSource
    DataSet = dmFactura.ibQryViewNCF
    Left = 664
    Top = 456
  end
end
