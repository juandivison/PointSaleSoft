object frmPrepararDatosCnt: TfrmPrepararDatosCnt
  Left = 297
  Top = 128
  Width = 872
  Height = 538
  Caption = 'Preparar Datos Cnt'
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
  object DBGrid1: TDBGrid
    Left = 16
    Top = 56
    Width = 833
    Height = 137
    DataSource = dsqryDistribucionCnt
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SERIE'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODULO'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIGEN'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTA1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTA2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTA3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_CAMPO'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_TABLA'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_CAMPO_CNTDET'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_CAMPO_CNTMASTER'
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_TABLA_CNT'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SENTENCIA_SQL'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSERT_POR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_INSER'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UPDATE_POR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDTIPO_PAGO'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 165
    Top = 309
    Width = 72
    Height = 25
    Caption = 'DistCnt'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object DBGrid2: TDBGrid
    Left = 16
    Top = 208
    Width = 833
    Height = 97
    DataSource = dsqryviewDatosParaCnt
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACION'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMA_PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_FACTURA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_DOC_PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_BRUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_DESCUENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_DESCUENTO_MASTER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_PROD'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_DESC_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITBI_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_SERVICIO_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_DIETA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_AJUSTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO_COMPRA'
        Visible = True
      end>
  end
  object RadioButton1: TRadioButton
    Left = 96
    Top = 28
    Width = 57
    Height = 17
    Caption = 'Debito'
    TabOrder = 3
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 160
    Top = 28
    Width = 57
    Height = 17
    Caption = 'Credito'
    TabOrder = 4
    OnClick = RadioButton2Click
  end
  object RadioButton3: TRadioButton
    Left = 223
    Top = 27
    Width = 58
    Height = 17
    Caption = 'None'
    Checked = True
    TabOrder = 5
    TabStop = True
    OnClick = RadioButton3Click
  end
  object ComboBox1: TComboBox
    Left = 296
    Top = 24
    Width = 193
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Text = 'ComboBox1'
    OnClick = ComboBox1Click
  end
  object DBGrid3: TDBGrid
    Left = 648
    Top = 304
    Width = 201
    Height = 57
    DataSource = dsqryVentaxFPMonto
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FORMA_PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 496
    Top = 20
    Width = 75
    Height = 25
    Caption = 'Procesar'
    TabOrder = 8
  end
  object BitBtn2: TBitBtn
    Left = 163
    Top = 340
    Width = 75
    Height = 25
    Caption = 'ProcDatos'
    TabOrder = 9
    OnClick = BitBtn2Click
  end
  object RxDBGrid1: TRxDBGrid
    Left = 16
    Top = 368
    Width = 825
    Height = 120
    DataSource = dsrxTranCnt
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'SerieCampoClave'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rxCuenta1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rxCuenta2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rxCuenta3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rxCodDepto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rxFecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rxDescripcion'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rxDebito'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rxCredito'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NombreCuenta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rxCuenta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rxCodCte'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rxNumFact'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rxDepartamento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCSERV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA123'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CentroCosto'
        Visible = True
      end>
  end
  object RxDBGrid2: TRxDBGrid
    Left = 241
    Top = 306
    Width = 409
    Height = 57
    DataSource = dsqryDistribucionCntDet
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'SERIE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_CAMPO'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_CAMPODET'
        Width = 214
        Visible = True
      end>
  end
  object DateEdit1: TDateEdit
    Left = 576
    Top = 22
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 12
  end
  object ProgressBar1: TProgressBar
    Left = 13
    Top = 309
    Width = 151
    Height = 17
    Step = 1
    TabOrder = 13
  end
  object ProgressBar2: TProgressBar
    Left = 13
    Top = 328
    Width = 148
    Height = 17
    Step = 1
    TabOrder = 14
  end
  object ProgressBar3: TProgressBar
    Left = 13
    Top = 347
    Width = 148
    Height = 17
    Step = 1
    TabOrder = 15
  end
  object qryDistribucionCnt: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM Distribucion_cnt'
      'WHERE NOMBRE_TABLA_CNT =:nombretabla'
      'AND modulo=:modulo'
      'and IDTIPO_PAGO=:IDTIPO_PAGO')
    Left = 664
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'nombretabla'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'modulo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPO_PAGO'
        ParamType = ptInput
      end>
    object qryDistribucionCntSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DISTRIBUCION_CNT.SERIE'
      Required = True
    end
    object qryDistribucionCntMODULO: TIntegerField
      FieldName = 'MODULO'
      Origin = 'DISTRIBUCION_CNT.MODULO'
    end
    object qryDistribucionCntORIGEN: TIntegerField
      FieldName = 'ORIGEN'
      Origin = 'DISTRIBUCION_CNT.ORIGEN'
    end
    object qryDistribucionCntCTA1: TIBStringField
      FieldName = 'CTA1'
      Origin = 'DISTRIBUCION_CNT.CTA1'
      Size = 3
    end
    object qryDistribucionCntCTA2: TIBStringField
      FieldName = 'CTA2'
      Origin = 'DISTRIBUCION_CNT.CTA2'
      Size = 2
    end
    object qryDistribucionCntCTA3: TIBStringField
      FieldName = 'CTA3'
      Origin = 'DISTRIBUCION_CNT.CTA3'
      Size = 2
    end
    object qryDistribucionCntDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DISTRIBUCION_CNT.DESCRIPCION'
      Size = 40
    end
    object qryDistribucionCntNOMBRE_CAMPO: TIBStringField
      FieldName = 'NOMBRE_CAMPO'
      Origin = 'DISTRIBUCION_CNT.NOMBRE_CAMPO'
      Size = 40
    end
    object qryDistribucionCntNOMBRE_TABLA: TIBStringField
      FieldName = 'NOMBRE_TABLA'
      Origin = 'DISTRIBUCION_CNT.NOMBRE_TABLA'
      Size = 40
    end
    object qryDistribucionCntSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DISTRIBUCION_CNT.STATUS'
      Size = 1
    end
    object qryDistribucionCntINSERT_POR: TIBStringField
      FieldName = 'INSERT_POR'
      Origin = 'DISTRIBUCION_CNT.INSERT_POR'
      Size = 12
    end
    object qryDistribucionCntFECHA_INSER: TDateTimeField
      FieldName = 'FECHA_INSER'
      Origin = 'DISTRIBUCION_CNT.FECHA_INSER'
    end
    object qryDistribucionCntUPDATE_POR: TIBStringField
      FieldName = 'UPDATE_POR'
      Origin = 'DISTRIBUCION_CNT.UPDATE_POR'
      Size = 12
    end
    object qryDistribucionCntCNT: TSmallintField
      FieldName = 'CNT'
      Origin = 'DISTRIBUCION_CNT.CNT'
    end
    object qryDistribucionCntIDTIPO_PAGO: TSmallintField
      FieldName = 'IDTIPO_PAGO'
      Origin = 'DISTRIBUCION_CNT.IDTIPO_PAGO'
    end
    object qryDistribucionCntNOMBRE_CAMPO_CNTDET: TIBStringField
      FieldName = 'NOMBRE_CAMPO_CNTDET'
      Origin = 'DISTRIBUCION_CNT.NOMBRE_CAMPO_CNTDET'
      Size = 60
    end
    object qryDistribucionCntNOMBRE_CAMPO_CNTMASTER: TIBStringField
      FieldName = 'NOMBRE_CAMPO_CNTMASTER'
      Origin = 'DISTRIBUCION_CNT.NOMBRE_CAMPO_CNTMASTER'
      Size = 60
    end
    object qryDistribucionCntNOMBRE_TABLA_CNT: TIBStringField
      FieldName = 'NOMBRE_TABLA_CNT'
      Origin = 'DISTRIBUCION_CNT.NOMBRE_TABLA_CNT'
      Size = 70
    end
    object qryDistribucionCntSENTENCIA_SQL: TIBStringField
      FieldName = 'SENTENCIA_SQL'
      Origin = 'DISTRIBUCION_CNT.SENTENCIA_SQL'
      Size = 200
    end
  end
  object dsqryDistribucionCnt: TDataSource
    DataSet = qryDistribucionCnt
    Left = 456
    Top = 96
  end
  object qryviewDatosParaCnt: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryviewDatosParaCntAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      ' NUMERO,'
      '  SERIE,'
      '  FECHA,'
      '  OBSERVACION,'
      '  FORMA_PAGO,'
      '  NUMERO_FACTURA,'
      '  NUMERO_DOC_PAGO,'
      '  MONTO_BRUTO,'
      '  MONTO_DESCUENTO,'
      '  PORC_DESCUENTO_MASTER,'
      '  DESCRIPCION,'
      '  CANTIDAD,'
      '  CODIGO_PROD,'
      '  PRECIO,'
      '  PORC_DESC_DET,'
      '  ITBI_DET,'
      '  VALOR_SERVICIO_DET,'
      '  VALOR_TOTAL_DET,'
      '  MONTO_DIETA,'
      '  MONTO_AJUSTE,'
      '  PRECIO_COMPRA,'
      '  CANTIDAD * PRECIO_COMPRA COSTO_PRODUCTO'
      ' FROM View_Ventas_acnt'
      'Where Fecha =:fecha'
      'And forma_pago=:fpago')
    Left = 128
    Top = 104
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'fpago'
        ParamType = ptInput
      end>
    object qryviewDatosParaCntNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_VENTAS_ACNT.NUMERO'
    end
    object qryviewDatosParaCntSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VIEW_VENTAS_ACNT.SERIE'
    end
    object qryviewDatosParaCntFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VIEW_VENTAS_ACNT.FECHA'
    end
    object qryviewDatosParaCntOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VIEW_VENTAS_ACNT.OBSERVACION'
      Size = 60
    end
    object qryviewDatosParaCntFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VIEW_VENTAS_ACNT.FORMA_PAGO'
    end
    object qryviewDatosParaCntNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VIEW_VENTAS_ACNT.NUMERO_FACTURA'
    end
    object qryviewDatosParaCntNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VIEW_VENTAS_ACNT.NUMERO_DOC_PAGO'
    end
    object qryviewDatosParaCntMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'VIEW_VENTAS_ACNT.MONTO_BRUTO'
    end
    object qryviewDatosParaCntMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VIEW_VENTAS_ACNT.MONTO_DESCUENTO'
    end
    object qryviewDatosParaCntPORC_DESCUENTO_MASTER: TIntegerField
      FieldName = 'PORC_DESCUENTO_MASTER'
      Origin = 'VIEW_VENTAS_ACNT.PORC_DESCUENTO_MASTER'
    end
    object qryviewDatosParaCntDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VIEW_VENTAS_ACNT.DESCRIPCION'
      Size = 60
    end
    object qryviewDatosParaCntCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VIEW_VENTAS_ACNT.CANTIDAD'
    end
    object qryviewDatosParaCntCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VIEW_VENTAS_ACNT.CODIGO_PROD'
      Size = 40
    end
    object qryviewDatosParaCntPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VIEW_VENTAS_ACNT.PRECIO'
    end
    object qryviewDatosParaCntPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VIEW_VENTAS_ACNT.PORC_DESC_DET'
    end
    object qryviewDatosParaCntITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VIEW_VENTAS_ACNT.ITBI_DET'
    end
    object qryviewDatosParaCntVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VIEW_VENTAS_ACNT.VALOR_SERVICIO_DET'
    end
    object qryviewDatosParaCntVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VIEW_VENTAS_ACNT.VALOR_TOTAL_DET'
    end
    object qryviewDatosParaCntMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VIEW_VENTAS_ACNT.MONTO_DIETA'
    end
    object qryviewDatosParaCntMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VIEW_VENTAS_ACNT.MONTO_AJUSTE'
    end
    object qryviewDatosParaCntPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'VIEW_VENTAS_ACNT.PRECIO_COMPRA'
    end
    object qryviewDatosParaCntCOSTO_PRODUCTO: TFloatField
      FieldName = 'COSTO_PRODUCTO'
    end
  end
  object dsqryviewDatosParaCnt: TDataSource
    DataSet = qryviewDatosParaCnt
    Left = 456
    Top = 144
  end
  object tablasCnt: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT distinct nombre_tabla_cnt FROM Distribucion_cnt'
      'order by nombre_tabla_cnt desc')
    Left = 568
    Top = 96
    object tablasCntNOMBRE_TABLA_CNT: TIBStringField
      FieldName = 'NOMBRE_TABLA_CNT'
      Origin = 'DISTRIBUCION_CNT.NOMBRE_TABLA_CNT'
      Size = 70
    end
  end
  object qryVentaxFPMonto: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Forma_pago, Sum(valor_total_det)  monto'
      'From view_ventas_acnt'
      'Where fecha =:fecha'
      'And Forma_pago=:fpago'
      'Group by Forma_pago')
    Left = 736
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'fpago'
        ParamType = ptInput
      end>
    object qryVentaxFPMontoFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
    end
    object qryVentaxFPMontoMONTO: TFloatField
      FieldName = 'MONTO'
    end
  end
  object dsqryVentaxFPMonto: TDataSource
    DataSet = qryVentaxFPMonto
    Left = 704
    Top = 168
  end
  object dsrxTranCnt: TDataSource
    DataSet = rxTranCnt
    Left = 336
    Top = 344
  end
  object qryDistribucionCntDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * '
      'From DISTRIBUCION_CNT_DET '
      '')
    Left = 512
    Top = 248
    object qryDistribucionCntDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DISTRIBUCION_CNT_DET.SERIE'
      Required = True
    end
    object qryDistribucionCntDetNOMBRE_CAMPO: TIBStringField
      FieldName = 'NOMBRE_CAMPO'
      Origin = 'DISTRIBUCION_CNT_DET.NOMBRE_CAMPO'
      Size = 40
    end
    object qryDistribucionCntDetNOMBRE_CAMPODET: TIBStringField
      FieldName = 'NOMBRE_CAMPODET'
      Origin = 'DISTRIBUCION_CNT_DET.NOMBRE_CAMPODET'
      Size = 40
    end
  end
  object dsqryDistribucionCntDet: TDataSource
    DataSet = qryDistribucionCntDet
    Left = 480
    Top = 312
  end
  object rxTranCnt: TRxMemoryData
    FieldDefs = <
      item
        Name = 'rxCuenta1'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'rxCuenta2'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'rxCuenta3'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'rxCodDepto'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'rxFecha'
        DataType = ftDate
      end
      item
        Name = 'rxDescripcion'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'rxDebito'
        DataType = ftFloat
      end
      item
        Name = 'rxCredito'
        DataType = ftFloat
      end
      item
        Name = 'rxCodCte'
        DataType = ftInteger
      end
      item
        Name = 'rxNumFact'
        DataType = ftInteger
      end
      item
        Name = 'rxDepartamento'
        DataType = ftInteger
      end
      item
        Name = 'DESCSERV'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CUENTA123'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'CentroCosto'
        DataType = ftInteger
      end
      item
        Name = 'SerieCampoClave'
        DataType = ftInteger
      end
      item
        Name = 'SERIE'
        DataType = ftString
        Size = 20
      end>
    OnCalcFields = rxTranCntCalcFields
    Left = 334
    Top = 240
    object rxTranCntrxCuenta1: TStringField
      FieldName = 'rxCuenta1'
      Size = 3
    end
    object rxTranCntrxCuenta2: TStringField
      FieldName = 'rxCuenta2'
      Size = 2
    end
    object rxTranCntrxCuenta3: TStringField
      FieldName = 'rxCuenta3'
      Size = 2
    end
    object rxTranCntrxCodDepto: TStringField
      FieldName = 'rxCodDepto'
      Size = 12
    end
    object rxTranCntrxFecha: TDateField
      DisplayLabel = 'Fecha'
      FieldName = 'rxFecha'
    end
    object rxTranCntrxDescripcion: TStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'rxDescripcion'
      Size = 40
    end
    object rxTranCntrxDebito: TFloatField
      DisplayLabel = 'Debito'
      FieldName = 'rxDebito'
      DisplayFormat = ',0.0000'
    end
    object rxTranCntrxCredito: TFloatField
      DisplayLabel = 'Credito'
      FieldName = 'rxCredito'
      DisplayFormat = ',0.0000'
    end
    object rxTranCntNombreCuenta: TStringField
      FieldKind = fkCalculated
      FieldName = 'NombreCuenta'
      Calculated = True
    end
    object rxTranCntrxCuenta: TStringField
      DisplayLabel = 'Cuenta'
      FieldKind = fkCalculated
      FieldName = 'rxCuenta'
      Calculated = True
    end
    object rxTranCntrxCodCte: TIntegerField
      FieldName = 'rxCodCte'
    end
    object rxTranCntrxNumFact: TIntegerField
      FieldName = 'rxNumFact'
    end
    object rxTranCntrxDepartamento: TIntegerField
      FieldName = 'rxDepartamento'
    end
    object rxTranCntDESCSERV: TStringField
      FieldName = 'DESCSERV'
      Size = 30
    end
    object rxTranCntCUENTA123: TStringField
      DisplayLabel = 'Cta Ord'
      FieldName = 'CUENTA123'
      Size = 7
    end
    object rxTranCntCentroCosto: TIntegerField
      FieldName = 'CentroCosto'
    end
    object rxTranCntSerieCampoClave: TIntegerField
      FieldName = 'SerieCampoClave'
    end
    object rxTranCntSERIE: TStringField
      FieldName = 'SERIE'
    end
  end
  object qryConfCtas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  MODULO_CNT.DESCRIPCION,'
      '  GRUPO_CNT.ID_FPAGO,'
      '  GRUPO_CNT.MODULO,'
      '  GRUPO_CNT.DESCRIPCION,'
      '  GRUPO_TIPO_PAGO.CODIGO_TIPO_PAGO,'
      '  GRUPO_TIPO_PAGO.DESCRIPCION'
      'FROM'
      '  MODULO_CNT'
      '  INNER JOIN GRUPO_CNT ON (MODULO_CNT.ID = GRUPO_CNT.MODULO)'
      
        '  INNER JOIN GRUPO_TIPO_PAGO ON (GRUPO_CNT.ID_FPAGO = GRUPO_TIPO' +
        '_PAGO.ID_FPAGO)')
    Left = 280
    Top = 112
    object qryConfCtasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'MODULO_CNT.DESCRIPCION'
      Size = 60
    end
    object qryConfCtasID_FPAGO: TSmallintField
      FieldName = 'ID_FPAGO'
      Origin = 'GRUPO_CNT.ID_FPAGO'
      Required = True
    end
    object qryConfCtasMODULO: TIntegerField
      FieldName = 'MODULO'
      Origin = 'GRUPO_CNT.MODULO'
      Required = True
    end
    object qryConfCtasDESCRIPCION1: TIBStringField
      FieldName = 'DESCRIPCION1'
      Origin = 'GRUPO_CNT.DESCRIPCION'
      Size = 75
    end
    object qryConfCtasCODIGO_TIPO_PAGO: TSmallintField
      FieldName = 'CODIGO_TIPO_PAGO'
      Origin = 'GRUPO_TIPO_PAGO.CODIGO_TIPO_PAGO'
      Required = True
    end
    object qryConfCtasDESCRIPCION2: TIBStringField
      FieldName = 'DESCRIPCION2'
      Origin = 'GRUPO_TIPO_PAGO.DESCRIPCION'
      Size = 75
    end
  end
end
