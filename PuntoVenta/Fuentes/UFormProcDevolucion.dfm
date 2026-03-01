inherited frmProcVentaRapidaEdicion: TfrmProcVentaRapidaEdicion
  Width = 867
  Caption = 'Edicion Venta al contado'
  Color = 10866630
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited rxdbgridTestTipofiscal: TRxDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIV_NEGOCIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PECF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AICF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_CF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCF'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_NCF_IFISCAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_NCFNCR'
        Visible = True
      end>
  end
  inherited Panel1: TPanel
    Width = 940
    inherited BitBtn1: TBitBtn
      Left = 16
      Width = 111
    end
    inherited BitBtn2: TBitBtn
      Left = 410
      Width = 117
    end
    inherited BitBtn3: TBitBtn
      Left = 138
    end
    inherited BitBtn4: TBitBtn
      Left = 539
      Width = 109
    end
    inherited BitBtn5: TBitBtn
      Left = 283
    end
    inherited BitBtn7: TBitBtn
      Left = 661
      Width = 100
    end
    inherited BitBtn16: TBitBtn
      Left = 772
    end
  end
  inherited RxDBGrid1: TRxDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'Serie'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodArticulo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Moneda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cant'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descripcion'
        ReadOnly = False
        Width = 198
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Referencia'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Precio'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoBruto'
        Width = 72
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
        FieldName = 'PorcTasaItbisCld'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Itbi'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoNeto'
        ReadOnly = False
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TipoUnidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fecha'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MonedaBase'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'porc_desc'
        Title.Caption = '%DescTranspItbis'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoDescuento'
        ReadOnly = False
        Title.Caption = 'TranspItbis'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MontoItbisRecargo'
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
        FieldName = 'loteNum'
        Visible = True
      end>
  end
  inherited BitBtn6: TBitBtn
    Left = 728
    Top = 497
  end
  inherited BitBtn8: TBitBtn
    Left = 728
    Top = 530
  end
  inherited BitBtn9: TBitBtn
    Left = 728
    Top = 559
  end
  inherited Panel2: TPanel
    Width = 769
    inherited RxDBGrid2: TRxDBGrid
      Width = 767
    end
  end
  inherited BitBtn10: TBitBtn
    Left = 722
    Top = 381
  end
  inherited BitBtn11: TBitBtn
    Top = 405
  end
  inherited BitBtn12: TBitBtn
    Left = 728
    Top = 466
  end
  inherited edtReferencia: TEditN
    Height = 25
  end
  inherited BitBtn15: TBitBtn
    Top = 434
  end
  inherited chkDisplay: TCheckBox
    Left = 762
    Top = 378
  end
  inherited BitBtn17: TBitBtn
    Left = 729
    Top = 345
  end
  inherited BitBtn19: TBitBtn
    Top = 497
  end
  inherited StatusBar: TStatusBar
    Width = 940
  end
  inherited bitBtnEditarFact: TBitBtn
    Top = 496
  end
  inherited dsqryProdPorProveedor: TDataSource
    Left = 560
    Top = 512
  end
  object ibsqlSerie_ncf: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Select NUMERO_NCF'
      ' From VENTAS_MAST v,NCF_ASIGNADOS n'
      'Where n.SERIE = v.SERIE_NCF_ASIGNADO'
      'AND N.SERIE=:SERIE')
    Transaction = dmConectar.IBTransaction1
    Left = 384
    Top = 288
  end
end
