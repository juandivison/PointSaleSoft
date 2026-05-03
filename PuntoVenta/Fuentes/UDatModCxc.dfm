object dmCxc: TdmCxc
  OldCreateOrder = False
  Left = 873
  Top = 154
  Height = 617
  Width = 727
  object qryTrancxc: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TRANS_CXC'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  CIA_KEY = :OLD_CIA_KEY and'
      '  TIPO_DOC = :OLD_TIPO_DOC')
    InsertSQL.Strings = (
      'insert into TRANS_CXC'
      
        '  (SERIE, CIA_KEY, TIPO_DOC, MONEDA, FECHA, NUMERO_DOC, CODIGO_C' +
        'LIENTE, '
      
        '   CODIGO_SERV, CONCEPTO, VALOR_DOCUMENTO, TIPO_TRANF, STATUS, T' +
        'IPO_SERV, '
      
        '   CAMPOCODIGOSERVAUXI, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, NU' +
        'MERO_TRN_VENTA, '
      
        '   CODIGO_VENDEDOR, NUMERO_RECIBO, NUM_NCF_AFECTADO, NUMPOL, NOT' +
        'A)'
      'values'
      
        '  (:SERIE, :CIA_KEY, :TIPO_DOC, :MONEDA, :FECHA, :NUMERO_DOC, :C' +
        'ODIGO_CLIENTE, '
      
        '   :CODIGO_SERV, :CONCEPTO, :VALOR_DOCUMENTO, :TIPO_TRANF, :STAT' +
        'US, :TIPO_SERV, '
      
        '   :CAMPOCODIGOSERVAUXI, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_PO' +
        'R, :NUMERO_TRN_VENTA, '
      
        '   :CODIGO_VENDEDOR, :NUMERO_RECIBO, :NUM_NCF_AFECTADO, :NUMPOL,' +
        ' :NOTA)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  CIA_KEY,'
      '  TIPO_DOC,'
      '  MONEDA,'
      '  FECHA,'
      '  NUMERO_DOC,'
      '  CODIGO_CLIENTE,'
      '  CODIGO_SERV,'
      '  CONCEPTO,'
      '  VALOR_DOCUMENTO,'
      '  TIPO_TRANF,'
      '  STATUS,'
      '  TIPO_SERV,'
      '  CAMPOCODIGOSERVAUXI,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  NUMERO_TRN_VENTA,'
      '  CODIGO_VENDEDOR,'
      '  NUMERO_RECIBO,'
      '  NUM_NCF_AFECTADO,'
      '  STATUS_CNT,'
      '  NUMPOL,'
      '  NOTA'
      'from TRANS_CXC '
      'where'
      '  SERIE = :SERIE and'
      '  CIA_KEY = :CIA_KEY and'
      '  TIPO_DOC = :TIPO_DOC')
    SelectSQL.Strings = (
      'SELECT  *'
      'FROM  TRANS_CXC'
      'Where  FECHA BETWEEN :FechaIni And :Fechafin'
      'AND TRANS_CXC.CIA_KEY=:CIAKEY')
    ModifySQL.Strings = (
      'update TRANS_CXC'
      'set'
      '  SERIE = :SERIE,'
      '  CIA_KEY = :CIA_KEY,'
      '  TIPO_DOC = :TIPO_DOC,'
      '  MONEDA = :MONEDA,'
      '  FECHA = :FECHA,'
      '  NUMERO_DOC = :NUMERO_DOC,'
      '  CODIGO_CLIENTE = :CODIGO_CLIENTE,'
      '  CODIGO_SERV = :CODIGO_SERV,'
      '  CONCEPTO = :CONCEPTO,'
      '  VALOR_DOCUMENTO = :VALOR_DOCUMENTO,'
      '  TIPO_TRANF = :TIPO_TRANF,'
      '  STATUS = :STATUS,'
      '  TIPO_SERV = :TIPO_SERV,'
      '  CAMPOCODIGOSERVAUXI = :CAMPOCODIGOSERVAUXI,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  NUMERO_TRN_VENTA = :NUMERO_TRN_VENTA,'
      '  CODIGO_VENDEDOR = :CODIGO_VENDEDOR,'
      '  NUMERO_RECIBO = :NUMERO_RECIBO,'
      '  NUM_NCF_AFECTADO = :NUM_NCF_AFECTADO,'
      '  NUMPOL = :NUMPOL,'
      '  NOTA = :NOTA'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  CIA_KEY = :OLD_CIA_KEY and'
      '  TIPO_DOC = :OLD_TIPO_DOC')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_TRN_CXC'
    GeneratorField.ApplyEvent = gamOnPost
    OnFilterRecord = qryTrancxcFilterRecord
    Left = 104
    Top = 8
    object qryTrancxcSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'TRANS_CXC.SERIE'
      Required = True
    end
    object qryTrancxcTIPO_DOC: TIntegerField
      DisplayLabel = 'Tipo Doc'
      FieldName = 'TIPO_DOC'
      Origin = 'TRANS_CXC.TIPO_DOC'
      Required = True
    end
    object qryTrancxcMONEDA: TIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Origin = 'TRANS_CXC.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryTrancxcFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'TRANS_CXC.FECHA'
    end
    object qryTrancxcNUMERO_DOC: TIntegerField
      DisplayLabel = 'Numero Doc'
      FieldName = 'NUMERO_DOC'
      Origin = 'TRANS_CXC.NUMERO_DOC'
    end
    object qryTrancxcCODIGO_CLIENTE: TIntegerField
      DisplayLabel = 'Codigo Cte'
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'TRANS_CXC.CODIGO_CLIENTE'
    end
    object qryTrancxcCODIGO_SERV: TIntegerField
      DisplayLabel = 'CodServ'
      FieldName = 'CODIGO_SERV'
      Origin = 'TRANS_CXC.CODIGO_SERV'
    end
    object qryTrancxcCONCEPTO: TIBStringField
      DisplayLabel = 'Concepto'
      FieldName = 'CONCEPTO'
      Origin = 'TRANS_CXC.CONCEPTO'
      Size = 60
    end
    object qryTrancxcVALOR_DOCUMENTO: TFloatField
      DisplayLabel = 'Valor Documento'
      FieldName = 'VALOR_DOCUMENTO'
      Origin = 'TRANS_CXC.VALOR_DOCUMENTO'
    end
    object qryTrancxcTIPO_TRANF: TSmallintField
      DisplayLabel = 'Origen'
      FieldName = 'TIPO_TRANF'
      Origin = 'TRANS_CXC.TIPO_TRANF'
    end
    object qryTrancxcSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'TRANS_CXC.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryTrancxcTIPO_SERV: TIntegerField
      DisplayLabel = 'TipoServ'
      FieldName = 'TIPO_SERV'
      Origin = 'TRANS_CXC.TIPO_SERV'
    end
    object qryTrancxcFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TRANS_CXC.FECHA_IN'
    end
    object qryTrancxcIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TRANS_CXC.IN_POR'
      Size = 12
    end
    object qryTrancxcFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'TRANS_CXC.FECHA_MOD'
    end
    object qryTrancxcMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'TRANS_CXC.MOD_POR'
      Size = 12
    end
    object qryTrancxcNUMERO_TRN_VENTA: TIntegerField
      FieldName = 'NUMERO_TRN_VENTA'
      Origin = 'TRANS_CXC.NUMERO_TRN_VENTA'
    end
    object qryTrancxcCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'TRANS_CXC.CODIGO_VENDEDOR'
    end
    object qryTrancxcNUMERO_RECIBO: TIntegerField
      FieldName = 'NUMERO_RECIBO'
      Origin = 'TRANS_CXC.NUMERO_RECIBO'
    end
    object qryTrancxcCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'TRANS_CXC.CIA_KEY'
    end
    object qryTrancxcNUM_NCF_AFECTADO: TIBStringField
      FieldName = 'NUM_NCF_AFECTADO'
      Origin = 'TRANS_CXC.NUM_NCF_AFECTADO'
      Size = 21
    end
    object qryTrancxcNUMPOL: TIntegerField
      FieldName = 'NUMPOL'
      Origin = 'TRANS_CXC.NUMPOL'
    end
  end
  object dstblTransCxc: TDataSource
    DataSet = tblTransCxc
    Left = 112
    Top = 64
  end
  object qryProcServ: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TRANS_CXC'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  TIPO_DOC = :OLD_TIPO_DOC')
    InsertSQL.Strings = (
      'insert into TRANS_CXC'
      
        '  (SERIE, TIPO_DOC, MONEDA, FECHA, NUMERO_DOC, CODIGO_CLIENTE, C' +
        'ODIGO_SERV, '
      
        '   CONCEPTO, VALOR_DOCUMENTO, TIPO_TRANF, STATUS, TIPO_SERV, NUM' +
        'ERO_TRN_VENTA, '
      '   CODIGO_VENDEDOR)'
      'values'
      
        '  (:SERIE, :TIPO_DOC, :MONEDA, :FECHA, :NUMERO_DOC, :CODIGO_CLIE' +
        'NTE, :CODIGO_SERV, '
      
        '   :CONCEPTO, :VALOR_DOCUMENTO, :TIPO_TRANF, :STATUS, :TIPO_SERV' +
        ', :NUMERO_TRN_VENTA, '
      '   :CODIGO_VENDEDOR)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  TIPO_DOC,'
      '  MONEDA,'
      '  FECHA,'
      '  NUMERO_DOC,'
      '  CODIGO_CLIENTE,'
      '  CODIGO_SERV,'
      '  CONCEPTO,'
      '  VALOR_DOCUMENTO,'
      '  TIPO_TRANF,'
      '  STATUS,'
      '  TIPO_SERV,'
      '  CAMPOCODIGOSERVAUXI,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  NUMERO_TRN_VENTA,'
      '  CODIGO_VENDEDOR'
      'from TRANS_CXC '
      'where'
      '  SERIE = :SERIE and'
      '  TIPO_DOC = :TIPO_DOC')
    SelectSQL.Strings = (
      'SELECT '
      'Trans_cxc.SERIE, '
      'Trans_cxc.TIPO_DOC, '
      'Trans_cxc.MONEDA, '
      'Trans_cxc.FECHA, '
      'Trans_cxc.NUMERO_DOC,'
      'Trans_cxc.CODIGO_CLIENTE, '
      'Trans_cxc.CODIGO_SERV, '
      'Trans_cxc.CONCEPTO, '
      'Trans_cxc.VALOR_DOCUMENTO,'
      'Trans_cxc.TIPO_TRANF, '
      'Trans_cxc.STATUS,'
      'Trans_cxc.TIPO_SERV,'
      'Trans_cxc.NUMERO_TRN_VENTA,'
      'Trans_cxc.CODIGO_VENDEDOR,'
      'C.NOMBRE_FACTURAR'
      'FROM TRANS_CXC Trans_cxc'
      '   LEFT OUTER JOIN Clientes c'
      '   ON  (Trans_cxc.CODIGO_CLIENTE = c.CODIGO_CTE)  '
      'WHERE  Trans_cxc.STATUS IN ('#39'A'#39', '#39'R'#39', '#39'F'#39')'
      'AND FECHA BETWEEN :FECHAINI AND :FECHAFIN'
      ''
      'ORDER BY CODIGO_CLIENTE,TIPO_DOC,FECHA')
    ModifySQL.Strings = (
      'update TRANS_CXC'
      'set'
      '  SERIE = :SERIE,'
      '  TIPO_DOC = :TIPO_DOC,'
      '  MONEDA = :MONEDA,'
      '  FECHA = :FECHA,'
      '  NUMERO_DOC = :NUMERO_DOC,'
      '  CODIGO_CLIENTE = :CODIGO_CLIENTE,'
      '  CODIGO_SERV = :CODIGO_SERV,'
      '  CONCEPTO = :CONCEPTO,'
      '  VALOR_DOCUMENTO = :VALOR_DOCUMENTO,'
      '  TIPO_TRANF = :TIPO_TRANF,'
      '  STATUS = :STATUS,'
      '  TIPO_SERV = :TIPO_SERV,'
      '  NUMERO_TRN_VENTA = :NUMERO_TRN_VENTA,'
      '  CODIGO_VENDEDOR = :CODIGO_VENDEDOR'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  TIPO_DOC = :OLD_TIPO_DOC')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_TRN_CXC'
    GeneratorField.ApplyEvent = gamOnPost
    OnFilterRecord = qryProcServFilterRecord
    Left = 32
    Top = 8
    object qryProcServSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'TRANS_CXC.SERIE'
      Required = True
    end
    object qryProcServTIPO_DOC: TIntegerField
      FieldName = 'TIPO_DOC'
      Origin = 'TRANS_CXC.TIPO_DOC'
      Required = True
    end
    object qryProcServMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'TRANS_CXC.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryProcServFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'TRANS_CXC.FECHA'
    end
    object qryProcServNUMERO_DOC: TIntegerField
      FieldName = 'NUMERO_DOC'
      Origin = 'TRANS_CXC.NUMERO_DOC'
    end
    object qryProcServCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'TRANS_CXC.CODIGO_CLIENTE'
    end
    object qryProcServCODIGO_SERV: TIntegerField
      FieldName = 'CODIGO_SERV'
      Origin = 'TRANS_CXC.CODIGO_SERV'
    end
    object qryProcServCONCEPTO: TIBStringField
      FieldName = 'CONCEPTO'
      Origin = 'TRANS_CXC.CONCEPTO'
      Size = 60
    end
    object qryProcServVALOR_DOCUMENTO: TFloatField
      FieldName = 'VALOR_DOCUMENTO'
      Origin = 'TRANS_CXC.VALOR_DOCUMENTO'
    end
    object qryProcServTIPO_TRANF: TSmallintField
      FieldName = 'TIPO_TRANF'
      Origin = 'TRANS_CXC.TIPO_TRANF'
    end
    object qryProcServSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRANS_CXC.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryProcServTIPO_SERV: TIntegerField
      FieldName = 'TIPO_SERV'
      Origin = 'TRANS_CXC.TIPO_SERV'
    end
    object qryProcServBalance_Act: TFloatField
      DisplayLabel = 'Balance Actual'
      FieldKind = fkLookup
      FieldName = 'Balance_Act'
      LookupDataSet = qryBalanceCtes
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'BALANCE_ACT'
      KeyFields = 'CODIGO_CLIENTE'
      DisplayFormat = ',0.00'
      Lookup = True
    end
    object qryProcServNOMBRE_FACTURAR: TIBStringField
      DisplayLabel = 'ClienteDesc'
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
  end
  object dsqryProcServ: TDataSource
    DataSet = qryProcServ
    Left = 32
    Top = 56
  end
  object qryBalanceCtes: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from Balance_cte'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  SERVICIO = :OLD_SERVICIO and'
      '  MONEDA = :OLD_MONEDA')
    InsertSQL.Strings = (
      'insert into Balance_cte'
      
        '  (CODIGO, SERVICIO, MONEDA, CTA1_BCE, CTA2_BCE, CTA3_BCE, BALAN' +
        'CE_ACT, '
      
        '   BALANCE_ANT, DEBITO_MES, CREDITO_MES, DEBITO_ACM, CREDITO_ACM' +
        ', FECHA_BCE, '
      
        '   FECHA_ULT_PAGO, STATUS_BCE, FECHA_IN, IN_POR, FECHA_MOD, MOD_' +
        'POR)'
      'values'
      
        '  (:CODIGO, :SERVICIO, :MONEDA, :CTA1_BCE, :CTA2_BCE, :CTA3_BCE,' +
        ' :BALANCE_ACT, '
      
        '   :BALANCE_ANT, :DEBITO_MES, :CREDITO_MES, :DEBITO_ACM, :CREDIT' +
        'O_ACM, '
      
        '   :FECHA_BCE, :FECHA_ULT_PAGO, :STATUS_BCE, :FECHA_IN, :IN_POR,' +
        ' :FECHA_MOD, '
      '   :MOD_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  SERVICIO,'
      '  MONEDA,'
      '  CTA1_BCE,'
      '  CTA2_BCE,'
      '  CTA3_BCE,'
      '  BALANCE_ACT,'
      '  BALANCE_ANT,'
      '  DEBITO_MES,'
      '  CREDITO_MES,'
      '  DEBITO_ACM,'
      '  CREDITO_ACM,'
      '  FECHA_BCE,'
      '  FECHA_ULT_PAGO,'
      '  STATUS_BCE,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  CODIGOAUXI,'
      '  CODIGOTEMPORAL'
      'from Balance_cte '
      'where'
      '  CODIGO = :CODIGO and'
      '  SERVICIO = :SERVICIO and'
      '  MONEDA = :MONEDA')
    SelectSQL.Strings = (
      'Select '
      '  b.CODIGO,'
      '  b.SERVICIO,'
      '  b.MONEDA,'
      '  b.CTA1_BCE,'
      '  b.CTA2_BCE,'
      '  b.CTA3_BCE,'
      '  b.BALANCE_ACT,'
      '  b.BALANCE_ANT,'
      '  b.DEBITO_MES,'
      '  b.CREDITO_MES,'
      '  b.DEBITO_ACM,'
      '  b.CREDITO_ACM,'
      '  b.FECHA_BCE,'
      '  b.FECHA_ULT_PAGO,'
      '  b.STATUS_BCE,'
      '  b.FECHA_IN,'
      '  b.IN_POR,'
      '  b.FECHA_MOD,'
      '  b.MOD_POR'
      'From Balance_cte b'
      'order by b.codigo')
    ModifySQL.Strings = (
      'update Balance_cte'
      'set'
      '  CODIGO = :CODIGO,'
      '  SERVICIO = :SERVICIO,'
      '  MONEDA = :MONEDA,'
      '  CTA1_BCE = :CTA1_BCE,'
      '  CTA2_BCE = :CTA2_BCE,'
      '  CTA3_BCE = :CTA3_BCE,'
      '  BALANCE_ACT = :BALANCE_ACT,'
      '  BALANCE_ANT = :BALANCE_ANT,'
      '  DEBITO_MES = :DEBITO_MES,'
      '  CREDITO_MES = :CREDITO_MES,'
      '  DEBITO_ACM = :DEBITO_ACM,'
      '  CREDITO_ACM = :CREDITO_ACM,'
      '  FECHA_BCE = :FECHA_BCE,'
      '  FECHA_ULT_PAGO = :FECHA_ULT_PAGO,'
      '  STATUS_BCE = :STATUS_BCE,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  SERVICIO = :OLD_SERVICIO and'
      '  MONEDA = :OLD_MONEDA')
    Left = 32
    Top = 104
    object qryBalanceCtesNombreCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCliente'
      LookupDataSet = tblClientes
      LookupKeyFields = 'CODIGO_CTE'
      LookupResultField = 'NOMBRE_FACTURAR'
      KeyFields = 'CODIGO'
      Lookup = True
    end
    object qryBalanceCtesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'BALANCE_CTE.CODIGO'
      Required = True
    end
    object qryBalanceCtesSERVICIO: TIntegerField
      FieldName = 'SERVICIO'
      Origin = 'BALANCE_CTE.SERVICIO'
      Required = True
    end
    object qryBalanceCtesMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'BALANCE_CTE.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryBalanceCtesCTA1_BCE: TIBStringField
      FieldName = 'CTA1_BCE'
      Origin = 'BALANCE_CTE.CTA1_BCE'
      FixedChar = True
      Size = 3
    end
    object qryBalanceCtesCTA2_BCE: TIBStringField
      FieldName = 'CTA2_BCE'
      Origin = 'BALANCE_CTE.CTA2_BCE'
      FixedChar = True
      Size = 2
    end
    object qryBalanceCtesCTA3_BCE: TIBStringField
      FieldName = 'CTA3_BCE'
      Origin = 'BALANCE_CTE.CTA3_BCE'
      FixedChar = True
      Size = 2
    end
    object qryBalanceCtesBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'BALANCE_CTE.BALANCE_ACT'
    end
    object qryBalanceCtesBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'BALANCE_CTE.BALANCE_ANT'
    end
    object qryBalanceCtesDEBITO_MES: TFloatField
      FieldName = 'DEBITO_MES'
      Origin = 'BALANCE_CTE.DEBITO_MES'
    end
    object qryBalanceCtesCREDITO_MES: TFloatField
      FieldName = 'CREDITO_MES'
      Origin = 'BALANCE_CTE.CREDITO_MES'
    end
    object qryBalanceCtesDEBITO_ACM: TFloatField
      FieldName = 'DEBITO_ACM'
      Origin = 'BALANCE_CTE.DEBITO_ACM'
    end
    object qryBalanceCtesCREDITO_ACM: TFloatField
      FieldName = 'CREDITO_ACM'
      Origin = 'BALANCE_CTE.CREDITO_ACM'
    end
    object qryBalanceCtesFECHA_BCE: TDateTimeField
      FieldName = 'FECHA_BCE'
      Origin = 'BALANCE_CTE.FECHA_BCE'
    end
    object qryBalanceCtesFECHA_ULT_PAGO: TDateTimeField
      FieldName = 'FECHA_ULT_PAGO'
      Origin = 'BALANCE_CTE.FECHA_ULT_PAGO'
    end
    object qryBalanceCtesSTATUS_BCE: TIBStringField
      FieldName = 'STATUS_BCE'
      Origin = 'BALANCE_CTE.STATUS_BCE'
      FixedChar = True
      Size = 1
    end
    object qryBalanceCtesFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'BALANCE_CTE.FECHA_IN'
    end
    object qryBalanceCtesIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'BALANCE_CTE.IN_POR'
      Size = 12
    end
    object qryBalanceCtesFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'BALANCE_CTE.FECHA_MOD'
    end
    object qryBalanceCtesMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'BALANCE_CTE.MOD_POR'
      Size = 12
    end
  end
  object DataSource1: TDataSource
    DataSet = qryBalanceCtes
    Left = 32
    Top = 152
  end
  object tblTipoServ: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPOTRN_SERV'
    Left = 112
    Top = 112
  end
  object tblServicio: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'SERVICIO'
    Left = 112
    Top = 160
  end
  object tblClientes: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_CTE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CIA_KEY'
        DataType = ftInteger
      end
      item
        Name = 'TIPO_CLIENTE'
        DataType = ftSmallint
      end
      item
        Name = 'FOTO'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'NOMBRE_CTE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NOMBRE_ABREV'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MONEDA_FACT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NOMBRE_FACTURAR'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CONTACTO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DIRECCION_CONT'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TELEF_CONTACTO'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FAX_CONTACTO'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FORMA_PAGO'
        DataType = ftSmallint
      end
      item
        Name = 'CODIGO_AGENCIA'
        DataType = ftSmallint
      end
      item
        Name = 'STATUS_CLIENTE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'INSERTADO_POR'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'FECHA_INSERTADO'
        DataType = ftDateTime
      end
      item
        Name = 'FECHA_MOD'
        DataType = ftDateTime
      end
      item
        Name = 'MODI_POR'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'LIMITE_CREDITO'
        DataType = ftFloat
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'WEBSITE'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'PAIS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CIUDAD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CEDULA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RNC'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TELEF_REFERENCIA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OTRO_TELEFONO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CANT_DIAS_CREDITO'
        DataType = ftSmallint
      end
      item
        Name = 'TIPO_NCF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'OBSERVACION'
        DataType = ftMemo
        Size = 8
      end
      item
        Name = 'LUGAR_DE_TRABAJO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'APODO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CODIGO_USUARIO'
        DataType = ftInteger
      end
      item
        Name = 'RNC_NUMERO'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'COMENTARIO'
        DataType = ftMemo
        Size = 8
      end
      item
        Name = 'CONDICION'
        DataType = ftInteger
      end
      item
        Name = 'PRECIO_ID'
        DataType = ftInteger
      end
      item
        Name = 'RUTA_FOTO'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'TIPO_CF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'MOVIL1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MOVIL2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CODIGO_TEXTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'USARLEVELPRECIO'
        DataType = ftSmallint
      end
      item
        Name = 'COD_VENDEDOR'
        DataType = ftInteger
      end
      item
        Name = 'FECHA_NACIMIENTO'
        DataType = ftDateTime
      end
      item
        Name = 'CODZONA'
        DataType = ftInteger
      end
      item
        Name = 'RUTA'
        DataType = ftInteger
      end
      item
        Name = 'COD_CIUDAD'
        DataType = ftInteger
      end
      item
        Name = 'DIA_RUTA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CALLE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'MANZANA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EDIFICIO'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <
      item
        Name = 'CLIENTESINDEX1'
        Fields = 'CODIGO_CTE'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY27'
        Fields = 'CODIGO_CTE'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'CLIENTES'
    Left = 112
    Top = 208
  end
  object qryBlceCteSQL: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      
        'Select count(codigo) CantidadProductos,   sum(cantidad * precio)' +
        '  ValorInventario'
      'From inventario_producto'
      'where Status = '#39'A'#39)
    Transaction = dmConectar.IBTransaction1
    Left = 32
    Top = 208
  end
  object qrybceHistCte: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qrybceHistCteCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   '
      '  CODIGO ,'
      '  SERVICIO  ,  '
      '  FECHA_HISTORICO,'
      '  MONEDA,'
      '  BALANCE_ACT,'
      '  BALANCE_ANT,'
      '  DEBITO_MES,'
      '  CREDITO_MES,'
      '  DEBITO_ACM,'
      '  CREDITO_ACM,'
      '  STATUS'
      'FROM PROC_HISTBCECXC(:ACTUAL)'
      'WHERE FECHA_HISTORICO BETWEEN :FECHAINI AND :FECHAFIN'
      '      AND MONEDA = :MONEDA'
      '      AND CODIGO between :codigoini And :codigofin'
      'ORDER BY SERVICIO,FECHA_HISTORICO, CODIGO ')
    Left = 32
    Top = 264
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'ACTUAL'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAFIN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigoini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigofin'
        ParamType = ptInput
      end>
    object qrybceHistCteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'PROC_HISTBCECXC.CODIGO'
    end
    object qrybceHistCteSERVICIO: TIntegerField
      FieldName = 'SERVICIO'
      Origin = 'PROC_HISTBCECXC.SERVICIO'
    end
    object qrybceHistCteFECHA_HISTORICO: TDateTimeField
      FieldName = 'FECHA_HISTORICO'
      Origin = 'PROC_HISTBCECXC.FECHA_HISTORICO'
    end
    object qrybceHistCteMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'PROC_HISTBCECXC.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qrybceHistCteBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'PROC_HISTBCECXC.BALANCE_ACT'
    end
    object qrybceHistCteBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'PROC_HISTBCECXC.BALANCE_ANT'
    end
    object qrybceHistCteDEBITO_MES: TFloatField
      FieldName = 'DEBITO_MES'
      Origin = 'PROC_HISTBCECXC.DEBITO_MES'
    end
    object qrybceHistCteCREDITO_MES: TFloatField
      FieldName = 'CREDITO_MES'
      Origin = 'PROC_HISTBCECXC.CREDITO_MES'
    end
    object qrybceHistCteDEBITO_ACM: TFloatField
      FieldName = 'DEBITO_ACM'
      Origin = 'PROC_HISTBCECXC.DEBITO_ACM'
    end
    object qrybceHistCteCREDITO_ACM: TFloatField
      FieldName = 'CREDITO_ACM'
      Origin = 'PROC_HISTBCECXC.CREDITO_ACM'
    end
    object qrybceHistCteSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROC_HISTBCECXC.STATUS'
      FixedChar = True
      Size = 1
    end
    object qrybceHistCteNombreCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCliente'
      LookupDataSet = tblClientes
      LookupKeyFields = 'CODIGO_CTE'
      LookupResultField = 'NOMBRE_FACTURAR'
      KeyFields = 'CODIGO'
      Size = 120
      Lookup = True
    end
    object qrybceHistCteMES: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'MES'
      Calculated = True
    end
  end
  object qryRepServ: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qryRepServCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select * From PROC_ESTADO_CTA_CXC (:fechaini,:fechafin,:codigo_c' +
        'te)'
      
        '/*Order By CODIGO_CTE, DEBITO DESC,  CREDITO,FECHA_DET, NUM_FACT' +
        '_DET */'
      'Order By CODIGO_CTE,'
      'FECHA_DET, NUM_FACT_DET,'
      'DEBITO DESC,  CREDITO')
    Left = 32
    Top = 312
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
        Value = '2009-01-01'
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
        Value = '2024-08-01'
      end
      item
        DataType = ftInteger
        Name = 'codigo_cte'
        ParamType = ptInput
        Value = '14'
      end>
    object qryRepServBalance_Ant: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Balance_Ant'
      Calculated = True
    end
    object qryRepServBalance_Actual: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Balance_Actual'
      Calculated = True
    end
    object qryRepServTIPOSERVICIO: TIntegerField
      FieldName = 'TIPOSERVICIO'
      Origin = 'PROC_SERV.TIPOSERVICIO'
    end
    object qryRepServDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROC_SERV.DESCRIPCION'
      Size = 40
    end
    object qryRepServFECHA_DET: TDateTimeField
      FieldName = 'FECHA_DET'
      Origin = 'PROC_SERV.FECHA_DET'
    end
    object qryRepServCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROC_SERV.CODIGO_CTE'
    end
    object qryRepServCANTIDAD_DETA: TIntegerField
      FieldName = 'CANTIDAD_DETA'
      Origin = 'PROC_SERV.CANTIDAD_DETA'
    end
    object qryRepServCANT_ADULTO_DETA: TIntegerField
      FieldName = 'CANT_ADULTO_DETA'
      Origin = 'PROC_SERV.CANT_ADULTO_DETA'
    end
    object qryRepServTARIFA_SERV_DETA: TFloatField
      FieldName = 'TARIFA_SERV_DETA'
      Origin = 'PROC_SERV.TARIFA_SERV_DETA'
    end
    object qryRepServMONEDA_DET: TIBStringField
      FieldName = 'MONEDA_DET'
      Origin = 'PROC_SERV.MONEDA_DET'
      FixedChar = True
      Size = 1
    end
    object qryRepServPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'PROC_SERV.PORC_DESC_DET'
    end
    object qryRepServVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'PROC_SERV.VALOR_SERVICIO_DET'
    end
    object qryRepServVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'PROC_SERV.VALOR_TOTAL_DET'
    end
    object qryRepServNUM_FACT_DET: TIntegerField
      FieldName = 'NUM_FACT_DET'
      Origin = 'PROC_SERV.NUM_FACT_DET'
    end
    object qryRepServNUMERO_RECIBO: TIntegerField
      FieldName = 'NUMERO_RECIBO'
      Origin = 'PROC_SERV.NUMERO_RECIBO'
    end
    object qryRepServIMPUESTO_SERV_DET: TFloatField
      FieldName = 'IMPUESTO_SERV_DET'
      Origin = 'PROC_SERV.IMPUESTO_SERV_DET'
    end
    object qryRepServSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'PROC_SERV.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryRepServCOD_AREA_FACT: TIntegerField
      FieldName = 'COD_AREA_FACT'
      Origin = 'PROC_SERV.COD_AREA_FACT'
    end
    object qryRepServCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'PROC_SERV.CONTACTO'
      Size = 40
    end
    object qryRepServTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'PROC_SERV.TELEF_CONTACTO'
      Size = 14
    end
    object qryRepServEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'PROC_SERV.EMAIL'
      Size = 40
    end
    object qryRepServORIGEN: TIntegerField
      FieldName = 'ORIGEN'
      Origin = 'PROC_SERV.ORIGEN'
    end
    object qryRepServVALOR_INGRESO_RECIBO: TFloatField
      FieldName = 'VALOR_INGRESO_RECIBO'
      Origin = 'PROC_SERV.VALOR_INGRESO_RECIBO'
    end
    object qryRepServFAX_CONTACTO: TIBStringField
      FieldName = 'FAX_CONTACTO'
      Origin = 'PROC_SERV.FAX_CONTACTO'
      Size = 14
    end
    object qryRepServWEBSITE: TIBStringField
      FieldName = 'WEBSITE'
      Origin = 'PROC_SERV.WEBSITE'
      Size = 40
    end
    object qryRepServPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PROC_SERV.PAIS'
      Size = 30
    end
    object qryRepServCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROC_SERV.CIUDAD'
      Size = 30
    end
    object qryRepServTIPO_DOC: TSmallintField
      FieldName = 'TIPO_DOC'
      Origin = 'PROC_SERV.TIPO_DOC'
    end
    object qryRepServDEBITO: TFloatField
      FieldName = 'DEBITO'
      Origin = 'PROC_ESTADO_CTA_CXC.DEBITO'
    end
    object qryRepServCREDITO: TFloatField
      FieldName = 'CREDITO'
      Origin = 'PROC_ESTADO_CTA_CXC.CREDITO'
    end
    object qryRepServAREA: TIBStringField
      FieldName = 'AREA'
      Origin = 'PROC_ESTADO_CTA_CXC.AREA'
      Size = 60
    end
    object qryRepServSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'PROC_ESTADO_CTA_CXC.SERIE'
    end
    object qryRepServNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'PROC_ESTADO_CTA_CXC.NOMBRE_FACTURAR'
      Size = 120
    end
    object qryRepServNOMBRE_CLIENTE_DET: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_DET'
      Origin = 'PROC_ESTADO_CTA_CXC.NOMBRE_CLIENTE_DET'
      Size = 60
    end
    object qryRepServDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'PROC_ESTADO_CTA_CXC.DIRECCION_CONT'
      Size = 60
    end
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <
      item
        Name = 'TipoDoc'
        DataType = ftInteger
      end>
    Left = 112
    Top = 256
    object RxMemoryData1TipoDoc: TIntegerField
      FieldName = 'TipoDoc'
    end
  end
  object tblTipoTrnDoc: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DOC_TRAN_CXT'
    Left = 112
    Top = 312
    object tblTipoTrnDocCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tblTipoTrnDocCODIGO_ABR: TIBStringField
      FieldName = 'CODIGO_ABR'
      Size = 6
    end
    object tblTipoTrnDocDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object qrybceHistCteNuevo: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'SELECT   '
      '  CODIGO ,'
      '  SERVICIO  ,  '
      '  FECHA_HISTORICO,'
      '  MONEDA,'
      '  BALANCE_ACT,'
      '  BALANCE_ANT,'
      '  DEBITO_MES,'
      '  CREDITO_MES,'
      '  DEBITO_ACM,'
      '  CREDITO_ACM,'
      '  STATUS'
      'FROM PROC_HISTBCECXC(:ACTUAL)'
      'WHERE FECHA_HISTORICO BETWEEN :FECHAINI AND :FECHAFIN'
      '      AND MONEDA = :MONEDA'
      '      AND CODIGO between :codigoini And :codigofin'
      'ORDER BY SERVICIO,FECHA_HISTORICO, CODIGO ')
    Transaction = dmConectar.IBTransaction1
    Left = 40
    Top = 376
  end
  object qrySQLBlceAntCxcCte: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM PROC_BALANCE_CXC ('
      '  :CODIGOCTEINI,  :CODIGOCTEFIN,'
      '  :FECHAINI,  :FECHAFIN,  :MONEDA,'
      '  :FECHA_BLC_ANTERIOR )')
    Transaction = dmConectar.IBTransaction1
    Left = 192
    Top = 280
  end
  object qryTipoMvtoCxc: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'SELECT SUM(DISTINCT DEBITO+CREDITO)'
      'FROM PROC_DATOS_VENTA_DIARIA (:FECHAINI,:FECHAFIN,:CIAACTIVA)'
      'WHERE '
      'tipo_tranf=:tipotranf'
      'and moneda between :monedaini and :monedafin'
      '')
    Transaction = dmConectar.IBTransaction1
    Left = 288
    Top = 264
  end
  object StpProcInsRecTrnCxc: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE PROC_INSERTARTRANCXC'
      '('
      '  :TIPO_DOC,'
      '  :MONEDA,'
      '  :FECHA,'
      '  :NUMERO_DOC,'
      '  :CODIGO_CLIENTE,'
      '  :CODIGO_SERV,'
      '  :CONCEPTO,'
      '  :VALOR_DOCUMENTO,'
      '  :TIPO_TRANF,'
      '  :STATUS,'
      '  :TIPO_SERV,'
      '  :NUMERO_TRN_VENTA,'
      '  :CODIGO_VENDEDOR'
      ')')
    Transaction = dmConectar.IBTransaction1
    Left = 224
    Top = 40
  end
  object StpProcNombyBlcCte: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'select * from PROC_BuscaNombCteyBlc(:codigoCte)')
    Transaction = dmConectar.IBTransaction1
    Left = 240
    Top = 104
  end
  object StpProcActBlceCteyTrncxcStatus: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE PROC_ACT_BALANCE_CTE_CXC ('
      '  :CODIGO_CTE,'
      '  :CODIGO_SERVICIO,'
      '  :MONEDA,'
      '  :ORIGEN,'
      '  :MONTO,'
      '  :FECHATRN,'
      '  :NUMEROTRN'
      ')')
    Transaction = dmConectar.IBTransaction1
    Left = 216
    Top = 152
  end
  object tblTransCxc: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TRANS_CXC'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  CIA_KEY = :OLD_CIA_KEY and'
      '  TIPO_DOC = :OLD_TIPO_DOC')
    InsertSQL.Strings = (
      'insert into TRANS_CXC'
      
        '  (SERIE, CIA_KEY, TIPO_DOC, MONEDA, FECHA, NUMERO_DOC, CODIGO_C' +
        'LIENTE, '
      
        '   CODIGO_SERV, CONCEPTO, VALOR_DOCUMENTO, TIPO_TRANF, STATUS, T' +
        'IPO_SERV, '
      
        '   CAMPOCODIGOSERVAUXI, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, NU' +
        'MERO_TRN_VENTA, '
      
        '   CODIGO_VENDEDOR, NUMERO_RECIBO, NUM_NCF_AFECTADO, NUMPOL, NOT' +
        'A)'
      'values'
      
        '  (:SERIE, :CIA_KEY, :TIPO_DOC, :MONEDA, :FECHA, :NUMERO_DOC, :C' +
        'ODIGO_CLIENTE, '
      
        '   :CODIGO_SERV, :CONCEPTO, :VALOR_DOCUMENTO, :TIPO_TRANF, :STAT' +
        'US, :TIPO_SERV, '
      
        '   :CAMPOCODIGOSERVAUXI, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_PO' +
        'R, :NUMERO_TRN_VENTA, '
      
        '   :CODIGO_VENDEDOR, :NUMERO_RECIBO, :NUM_NCF_AFECTADO, :NUMPOL,' +
        ' :NOTA)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  CIA_KEY,'
      '  TIPO_DOC,'
      '  MONEDA,'
      '  FECHA,'
      '  NUMERO_DOC,'
      '  CODIGO_CLIENTE,'
      '  CODIGO_SERV,'
      '  CONCEPTO,'
      '  VALOR_DOCUMENTO,'
      '  TIPO_TRANF,'
      '  STATUS,'
      '  TIPO_SERV,'
      '  CAMPOCODIGOSERVAUXI,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  NUMERO_TRN_VENTA,'
      '  CODIGO_VENDEDOR,'
      '  NUMERO_RECIBO,'
      '  NUM_NCF_AFECTADO,'
      '  STATUS_CNT,'
      '  NUMPOL,'
      '  NOTA'
      'from TRANS_CXC '
      'where'
      '  SERIE = :SERIE and'
      '  CIA_KEY = :CIA_KEY and'
      '  TIPO_DOC = :TIPO_DOC')
    SelectSQL.Strings = (
      'SELECT  *'
      'FROM  TRANS_CXC'
      'Where  FECHA BETWEEN :FechaIni And :Fechafin'
      'and cia_key=:ciakey')
    ModifySQL.Strings = (
      'update TRANS_CXC'
      'set'
      '  SERIE = :SERIE,'
      '  CIA_KEY = :CIA_KEY,'
      '  TIPO_DOC = :TIPO_DOC,'
      '  MONEDA = :MONEDA,'
      '  FECHA = :FECHA,'
      '  NUMERO_DOC = :NUMERO_DOC,'
      '  CODIGO_CLIENTE = :CODIGO_CLIENTE,'
      '  CODIGO_SERV = :CODIGO_SERV,'
      '  CONCEPTO = :CONCEPTO,'
      '  VALOR_DOCUMENTO = :VALOR_DOCUMENTO,'
      '  TIPO_TRANF = :TIPO_TRANF,'
      '  STATUS = :STATUS,'
      '  TIPO_SERV = :TIPO_SERV,'
      '  CAMPOCODIGOSERVAUXI = :CAMPOCODIGOSERVAUXI,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  NUMERO_TRN_VENTA = :NUMERO_TRN_VENTA,'
      '  CODIGO_VENDEDOR = :CODIGO_VENDEDOR,'
      '  NUMERO_RECIBO = :NUMERO_RECIBO,'
      '  NUM_NCF_AFECTADO = :NUM_NCF_AFECTADO,'
      '  NUMPOL = :NUMPOL,'
      '  NOTA = :NOTA'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  CIA_KEY = :OLD_CIA_KEY and'
      '  TIPO_DOC = :OLD_TIPO_DOC')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_TRN_CXC'
    GeneratorField.ApplyEvent = gamOnPost
    OnFilterRecord = qryTrancxcFilterRecord
    Left = 288
    Top = 8
    object tblTransCxcSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'TRANS_CXC.SERIE'
      Required = True
    end
    object tblTransCxcTIPO_DOC: TIntegerField
      FieldName = 'TIPO_DOC'
      Origin = 'TRANS_CXC.TIPO_DOC'
      Required = True
    end
    object tblTransCxcMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'TRANS_CXC.MONEDA'
      FixedChar = True
      Size = 1
    end
    object tblTransCxcFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'TRANS_CXC.FECHA'
    end
    object tblTransCxcNUMERO_DOC: TIntegerField
      FieldName = 'NUMERO_DOC'
      Origin = 'TRANS_CXC.NUMERO_DOC'
    end
    object tblTransCxcCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'TRANS_CXC.CODIGO_CLIENTE'
    end
    object tblTransCxcCODIGO_SERV: TIntegerField
      FieldName = 'CODIGO_SERV'
      Origin = 'TRANS_CXC.CODIGO_SERV'
    end
    object tblTransCxcCONCEPTO: TIBStringField
      FieldName = 'CONCEPTO'
      Origin = 'TRANS_CXC.CONCEPTO'
      Size = 60
    end
    object tblTransCxcVALOR_DOCUMENTO: TFloatField
      FieldName = 'VALOR_DOCUMENTO'
      Origin = 'TRANS_CXC.VALOR_DOCUMENTO'
    end
    object tblTransCxcTIPO_TRANF: TSmallintField
      FieldName = 'TIPO_TRANF'
      Origin = 'TRANS_CXC.TIPO_TRANF'
    end
    object tblTransCxcSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRANS_CXC.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblTransCxcTIPO_SERV: TIntegerField
      FieldName = 'TIPO_SERV'
      Origin = 'TRANS_CXC.TIPO_SERV'
    end
    object tblTransCxcCAMPOCODIGOSERVAUXI: TIntegerField
      FieldName = 'CAMPOCODIGOSERVAUXI'
      Origin = 'TRANS_CXC.CAMPOCODIGOSERVAUXI'
    end
    object tblTransCxcFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TRANS_CXC.FECHA_IN'
    end
    object tblTransCxcIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TRANS_CXC.IN_POR'
      Size = 12
    end
    object tblTransCxcFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'TRANS_CXC.FECHA_MOD'
    end
    object tblTransCxcMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'TRANS_CXC.MOD_POR'
      Size = 12
    end
    object tblTransCxcNUMERO_TRN_VENTA: TIntegerField
      FieldName = 'NUMERO_TRN_VENTA'
      Origin = 'TRANS_CXC.NUMERO_TRN_VENTA'
    end
    object tblTransCxcCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'TRANS_CXC.CODIGO_VENDEDOR'
    end
    object tblTransCxcCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'TRANS_CXC.CIA_KEY'
    end
    object tblTransCxcNUMERO_RECIBO: TIntegerField
      FieldName = 'NUMERO_RECIBO'
      Origin = 'TRANS_CXC.NUMERO_RECIBO'
    end
    object tblTransCxcNUM_NCF_AFECTADO: TIBStringField
      FieldName = 'NUM_NCF_AFECTADO'
      Origin = 'TRANS_CXC.NUM_NCF_AFECTADO'
      Size = 21
    end
    object tblTransCxcNUMPOL: TIntegerField
      FieldName = 'NUMPOL'
      Origin = 'TRANS_CXC.NUMPOL'
    end
  end
  object qryBalanceProv: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    SelectSQL.Strings = (
      'SELECT BALANCE_CXP.CODIGO,'
      '       BALANCE_CXP.TIPO,'
      '       BALANCE_CXP.MONEDA,'
      '       BALANCE_CXP.BALANCE_ACT,'
      '       BALANCE_CXP.BALANCE_ANT,'
      '       BALANCE_CXP.DEBITO_MES,'
      '       BALANCE_CXP.CREDITO_MES,'
      '       BALANCE_CXP.DEBITO_ACM,'
      '       BALANCE_CXP.CREDITO_ACM,'
      '       BALANCE_CXP.FECHA_BCE,'
      '       BALANCE_CXP.FECHA_ULT_PAGO,'
      '       BALANCE_CXP.STATUS_BCE,'
      '       BALANCE_CXP.FECHA_IN,'
      '       BALANCE_CXP.IN_POR,'
      '       BALANCE_CXP.FECHA_MOD,'
      '       BALANCE_CXP.MOD_POR,'
      '       BALANCE_CXP.CODIGO_USUARIO,'
      '       PROVEEDORES.DESCRIPCION,'
      '       PROVEEDORES.TIPO_CLIENTE,'
      '       PROVEEDORES.TELEFONO,'
      '       PROVEEDORES.FAX'
      'FROM PROVEEDORES'
      
        '   INNER JOIN BALANCE_CXP ON (PROVEEDORES.CODIGO_CTE = BALANCE_C' +
        'XP.CODIGO)')
    Left = 336
    Top = 328
    object qryBalanceProvCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'BALANCE_CXP.CODIGO'
      Required = True
    end
    object qryBalanceProvTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'BALANCE_CXP.TIPO'
      Required = True
    end
    object qryBalanceProvMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'BALANCE_CXP.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryBalanceProvBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'BALANCE_CXP.BALANCE_ACT'
    end
    object qryBalanceProvBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'BALANCE_CXP.BALANCE_ANT'
    end
    object qryBalanceProvDEBITO_MES: TFloatField
      FieldName = 'DEBITO_MES'
      Origin = 'BALANCE_CXP.DEBITO_MES'
    end
    object qryBalanceProvCREDITO_MES: TFloatField
      FieldName = 'CREDITO_MES'
      Origin = 'BALANCE_CXP.CREDITO_MES'
    end
    object qryBalanceProvDEBITO_ACM: TFloatField
      FieldName = 'DEBITO_ACM'
      Origin = 'BALANCE_CXP.DEBITO_ACM'
    end
    object qryBalanceProvCREDITO_ACM: TFloatField
      FieldName = 'CREDITO_ACM'
      Origin = 'BALANCE_CXP.CREDITO_ACM'
    end
    object qryBalanceProvFECHA_BCE: TDateTimeField
      FieldName = 'FECHA_BCE'
      Origin = 'BALANCE_CXP.FECHA_BCE'
    end
    object qryBalanceProvFECHA_ULT_PAGO: TDateTimeField
      FieldName = 'FECHA_ULT_PAGO'
      Origin = 'BALANCE_CXP.FECHA_ULT_PAGO'
    end
    object qryBalanceProvSTATUS_BCE: TIBStringField
      FieldName = 'STATUS_BCE'
      Origin = 'BALANCE_CXP.STATUS_BCE'
      FixedChar = True
      Size = 1
    end
    object qryBalanceProvFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'BALANCE_CXP.FECHA_IN'
    end
    object qryBalanceProvIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'BALANCE_CXP.IN_POR'
      Size = 12
    end
    object qryBalanceProvFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'BALANCE_CXP.FECHA_MOD'
    end
    object qryBalanceProvMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'BALANCE_CXP.MOD_POR'
      Size = 12
    end
    object qryBalanceProvCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'BALANCE_CXP.CODIGO_USUARIO'
    end
    object qryBalanceProvDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object qryBalanceProvTIPO_CLIENTE: TIntegerField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'PROVEEDORES.TIPO_CLIENTE'
    end
    object qryBalanceProvTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object qryBalanceProvFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'PROVEEDORES.FAX'
      Size = 12
    end
  end
  object qryClientes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CODIGO_cte, NOMBRE_CTE NOMBRE_EMPRESA, TIPO_CLIENTE'
      'FROM CLIENTES')
    Left = 192
    Top = 216
    object qryClientesCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryClientesNOMBRE_EMPRESA: TIBStringField
      FieldName = 'NOMBRE_EMPRESA'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryClientesTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
  end
  object tMoneda: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'MONEDA'
    Left = 168
    Top = 96
  end
  object dstMoneda: TDataSource
    DataSet = tMoneda
    Left = 384
    Top = 80
  end
  object qryTipoMvtoIngreso: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'SELECT '
      'tipo_documento, Tipo_doc, '
      'ESCXC,'
      't.DESCRIPCION as descpago,'
      'r.moneda,'
      'sum(MONTO_DESC_ITEM) MONTO_DESC_ITEM,'
      'SUM(Monto) monto'
      'FROM PROC_DATOS_INGRESOS_RESUMEN(:fechaini,:fechafin,:CIAKEY) r'
      'inner join TIPO_PAGO t on t.CODIGO = tipo_doc'
      'Where moneda =:moneda'
      
        'Group by r.ESCXC , r.MONEDA, t.DESCRIPCION,tipo_documento, Tipo_' +
        'doc'
      
        'order by r.ESCXC desc, r.MONEDA, t.DESCRIPCION,tipo_documento, T' +
        'ipo_doc')
    Transaction = dmConectar.IBTransaction1
    Left = 40
    Top = 424
  end
  object stpFechaIniBceHist: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_BUSCARFBLCINI '
    Left = 144
    Top = 368
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHA_BLC_INICIAL'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'BALANCE_ACT_OUT'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_INI_TRN'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'DESCRIPCION'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE_IN'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end>
  end
  object transCxcNotaCredito: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TRANS_CXC_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into TRANS_CXC_DET'
      
        '  (SERIE, NUM_DOC, NUMERO_FACT, SERIE_NCF_ASIGNADO, NUMERO_TRN_O' +
        'RIGEN)'
      'values'
      
        '  (:SERIE, :NUM_DOC, :NUMERO_FACT, :SERIE_NCF_ASIGNADO, :NUMERO_' +
        'TRN_ORIGEN)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUM_DOC,'
      '  NUMERO_FACT,'
      '  SERIE_NCF_ASIGNADO,'
      '  NUMERO_TRN_ORIGEN'
      'from TRANS_CXC_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select '
      '*'
      'from TRANS_CXC_DET '
      'where'
      '  SERIE = :SERIE')
    ModifySQL.Strings = (
      'update TRANS_CXC_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NUM_DOC = :NUM_DOC,'
      '  NUMERO_FACT = :NUMERO_FACT,'
      '  SERIE_NCF_ASIGNADO = :SERIE_NCF_ASIGNADO,'
      '  NUMERO_TRN_ORIGEN = :NUMERO_TRN_ORIGEN'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 160
    Top = 416
    object transCxcNotaCreditoSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'TRANS_CXC_DET.SERIE'
      Required = True
    end
    object transCxcNotaCreditoNUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
      Origin = 'TRANS_CXC_DET.NUM_DOC'
      Required = True
    end
    object transCxcNotaCreditoNUMERO_FACT: TIntegerField
      FieldName = 'NUMERO_FACT'
      Origin = 'TRANS_CXC_DET.NUMERO_FACT'
    end
    object transCxcNotaCreditoSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'TRANS_CXC_DET.SERIE_NCF_ASIGNADO'
    end
    object transCxcNotaCreditoNUMERO_TRN_ORIGEN: TIntegerField
      FieldName = 'NUMERO_TRN_ORIGEN'
      Origin = 'TRANS_CXC_DET.NUMERO_TRN_ORIGEN'
    end
  end
  object transCxcNotaDebito: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TRANS_CXC_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into TRANS_CXC_DET'
      '  (SERIE, NUM_DOC, NUMERO_FACT, SERIE_NCF_ASIGNADO)'
      'values'
      '  (:SERIE, :NUM_DOC, :NUMERO_FACT, :SERIE_NCF_ASIGNADO)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUM_DOC,'
      '  NUMERO_FACT,'
      '  SERIE_NCF_ASIGNADO'
      'from TRANS_CXC_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUM_DOC,'
      '  NUMERO_FACT,SERIE_NCF_ASIGNADO'
      'From TRANS_CXC_DET '
      'Where'
      '  SERIE = :SERIE')
    ModifySQL.Strings = (
      'update TRANS_CXC_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NUM_DOC = :NUM_DOC,'
      '  NUMERO_FACT = :NUMERO_FACT,'
      '  SERIE_NCF_ASIGNADO = :SERIE_NCF_ASIGNADO'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.ApplyEvent = gamOnPost
    Left = 216
    Top = 344
    object transCxcNotaDebitoSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'TRANS_CXC_DET.SERIE'
      Required = True
    end
    object transCxcNotaDebitoNUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
      Origin = 'TRANS_CXC_DET.NUM_DOC'
      Required = True
    end
    object transCxcNotaDebitoNUMERO_FACT: TIntegerField
      FieldName = 'NUMERO_FACT'
      Origin = 'TRANS_CXC_DET.NUMERO_FACT'
    end
    object transCxcNotaDebitoSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'TRANS_CXC_DET.SERIE_NCF_ASIGNADO'
    end
  end
  object qryRepTransCxcNDB_NCR: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT TRANS_CXC.SERIE,'
      '       TRANS_CXC_DET.NUM_DOC,'
      '       TRANS_CXC_DET.NUMERO_FACT,'
      '       TRANS_CXC_DET.SERIE_NCF_ASIGNADO,'
      '       TRANS_CXC_DET.numero_trn_origen,'
      '       DOC_TRAN_CXT.DESCRIPCION,'
      '       TRANS_CXC.TIPO_DOC,'
      '       TRANS_CXC.MONEDA,'
      '       TRANS_CXC.FECHA,'
      '       TRANS_CXC.NUMERO_DOC,'
      '       TRANS_CXC.CODIGO_CLIENTE,'
      '       TRANS_CXC.CONCEPTO,'
      '       TRANS_CXC.VALOR_DOCUMENTO,'
      '       TRANS_CXC.TIPO_TRANF,'
      '       TRANS_CXC.STATUS,'
      'TRANS_CXC.NUM_NCF_AFECTADO,'
      '       TRANS_CXC.NUMERO_TRN_VENTA,'
      '       TRANS_CXC.CODIGO_VENDEDOR,'
      '       NCF_ASIGNADOS.NUMERO_NCF,'
      '       CLIENTES.NOMBRE_CTE,'
      '       CLIENTES.DIRECCION_CONT,'
      '       CLIENTES.TELEF_CONTACTO,'
      '       CLIENTES.RNC_NUMERO,'
      '       TIPO_CF.DESCRIPCION DescNCF'
      'FROM TIPO_CF'
      
        '   INNER JOIN NCF_ASIGNADOS ON (TIPO_CF.TIPO_CF = NCF_ASIGNADOS.' +
        'TIPO_NCF)'
      
        '   RIGHT OUTER JOIN TRANS_CXC_DET ON (NCF_ASIGNADOS.SERIE = TRAN' +
        'S_CXC_DET.SERIE_NCF_ASIGNADO)'
      
        '   INNER JOIN TRANS_CXC ON (TRANS_CXC_DET.SERIE = TRANS_CXC.SERI' +
        'E)'
      
        '   LEFT OUTER JOIN CLIENTES ON (TRANS_CXC.CODIGO_CLIENTE = CLIEN' +
        'TES.CODIGO_CTE)'
      
        '   INNER JOIN DOC_TRAN_CXT ON (TRANS_CXC.TIPO_DOC = DOC_TRAN_CXT' +
        '.CODIGO)'
      'Where TRANS_CXC.TIPO_DOC in (3,5)'
      'And TRANS_CXC_DET.SERIE =:serie'
      'And TRANS_CXC.TIPO_DOC =:tiodoc'
      'ORDER BY TRANS_CXC.TIPO_DOC')
    Left = 280
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'serie'
        ParamType = ptInput
        Value = '2'
      end
      item
        DataType = ftInteger
        Name = 'tiodoc'
        ParamType = ptInput
      end>
    object qryRepTransCxcNDB_NCRSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'TRANS_CXC.SERIE'
      Required = True
    end
    object qryRepTransCxcNDB_NCRNUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
      Origin = 'TRANS_CXC_DET.NUM_DOC'
      Required = True
    end
    object qryRepTransCxcNDB_NCRNUMERO_FACT: TIntegerField
      FieldName = 'NUMERO_FACT'
      Origin = 'TRANS_CXC_DET.NUMERO_FACT'
    end
    object qryRepTransCxcNDB_NCRSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'TRANS_CXC_DET.SERIE_NCF_ASIGNADO'
    end
    object qryRepTransCxcNDB_NCRDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DOC_TRAN_CXT.DESCRIPCION'
      Size = 30
    end
    object qryRepTransCxcNDB_NCRTIPO_DOC: TIntegerField
      FieldName = 'TIPO_DOC'
      Origin = 'TRANS_CXC.TIPO_DOC'
      Required = True
    end
    object qryRepTransCxcNDB_NCRMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'TRANS_CXC.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryRepTransCxcNDB_NCRFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'TRANS_CXC.FECHA'
    end
    object qryRepTransCxcNDB_NCRNUMERO_DOC: TIntegerField
      FieldName = 'NUMERO_DOC'
      Origin = 'TRANS_CXC.NUMERO_DOC'
    end
    object qryRepTransCxcNDB_NCRCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'TRANS_CXC.CODIGO_CLIENTE'
    end
    object qryRepTransCxcNDB_NCRCONCEPTO: TIBStringField
      FieldName = 'CONCEPTO'
      Origin = 'TRANS_CXC.CONCEPTO'
      Size = 60
    end
    object qryRepTransCxcNDB_NCRVALOR_DOCUMENTO: TFloatField
      FieldName = 'VALOR_DOCUMENTO'
      Origin = 'TRANS_CXC.VALOR_DOCUMENTO'
    end
    object qryRepTransCxcNDB_NCRTIPO_TRANF: TSmallintField
      FieldName = 'TIPO_TRANF'
      Origin = 'TRANS_CXC.TIPO_TRANF'
    end
    object qryRepTransCxcNDB_NCRSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRANS_CXC.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepTransCxcNDB_NCRNUMERO_TRN_VENTA: TIntegerField
      FieldName = 'NUMERO_TRN_VENTA'
      Origin = 'TRANS_CXC.NUMERO_TRN_VENTA'
    end
    object qryRepTransCxcNDB_NCRCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'TRANS_CXC.CODIGO_VENDEDOR'
    end
    object qryRepTransCxcNDB_NCRNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
    object qryRepTransCxcNDB_NCRNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryRepTransCxcNDB_NCRDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryRepTransCxcNDB_NCRTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryRepTransCxcNDB_NCRRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryRepTransCxcNDB_NCRDESCNCF: TIBStringField
      FieldName = 'DESCNCF'
      Origin = 'TIPO_CF.DESCRIPCION'
      Size = 60
    end
    object qryRepTransCxcNDB_NCRNUM_NCF_AFECTADO: TIBStringField
      FieldName = 'NUM_NCF_AFECTADO'
      Origin = 'TRANS_CXC.NUM_NCF_AFECTADO'
      Size = 21
    end
    object qryRepTransCxcNDB_NCRNUMERO_TRN_ORIGEN: TIntegerField
      FieldName = 'NUMERO_TRN_ORIGEN'
      Origin = 'TRANS_CXC_DET.NUMERO_TRN_ORIGEN'
    end
  end
  object dsqryClientes: TDataSource
    DataSet = qryClientes
    Left = 280
    Top = 208
  end
  object qryFactPendientes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT FACTURAS_PENDIENTES.TIPO,'
      '       FACTURAS_PENDIENTES.MONEDA,'
      '       FACTURAS_PENDIENTES.NUMERO_FACT,'
      '       FACTURAS_PENDIENTES.MONTO_PENDIENTE,'
      '       FACTURAS_PENDIENTES.STATUS,'
      '       FACTURAS_PENDIENTES.IN_POR,'
      '       FACTURAS_PENDIENTES.FECHA_MOD,'
      '       FACTURAS_PENDIENTES.MOD_POR,'
      '       CLIENTES.NOMBRE_CTE,'
      '       CLIENTES.NOMBRE_FACTURAR,'
      '       CLIENTES.DIRECCION_CONT,'
      '       CLIENTES.TELEF_CONTACTO, FACTURAS.CODIGO_CTE,'
      '       FACTURAS.FECHA'
      'FROM FACTURAS_PENDIENTES'
      
        '   INNER JOIN FACTURAS ON (FACTURAS_PENDIENTES.NUMERO_FACT = FAC' +
        'TURAS.NUMERO)'
      
        '   INNER JOIN CLIENTES ON (FACTURAS.CODIGO_CTE = CLIENTES.CODIGO' +
        '_CTE)'
      'Where FACTURAS.FECHA Between :fechaini And :fechafin'
      'And facturas.codigo_cte =:codigocte'
      'order by CLIENTES.CODIGO_CTE')
    Left = 272
    Top = 432
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigocte'
        ParamType = ptInput
      end>
  end
  object qryTipoMvtoIngresoCuadre: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'SELECT'
      '    q.NUMERO_TRN,'
      '    q.tipo_documento,'
      '    q.TIPO_DOCUMENTO_DEV,'
      '    q.Tipo_doc,'
      '    q.EsCxc,'
      '    SUM(DISTINCT q.DEBITO + q.CREDITO) monto,'
      '    SUM(DISTINCT q.monto_recibido) monto_recibido,'
      '    SUM(q.MONTO_DESC_ITEM) MONTO_DESC_ITEM,'
      '    COUNT(DISTINCT q.numero_documento) cantVta,'
      '    SUM(DISTINCT q.montocobertura) montocobertura,'
      '    COUNT(DISTINCT q.VENTAARS) cantVtaARS'
      'FROM'
      '('
      '    SELECT'
      '        p.*,'
      '        CASE'
      '            WHEN p.Tipo_doc = 6 THEN'
      '                COALESCE('
      '                    ('
      
        '                        SELECT FIRST 1 UPPER(TRIM(tp.DESCRIPCION' +
        '))'
      '                        FROM VENTAS_MAST vmDev'
      
        '                        LEFT JOIN DETALLE_PAGOS dp ON dp.SERIE_T' +
        'RN = vmDev.REF_TRN_ORIGEN'
      
        '                        LEFT JOIN TIPO_PAGO tp ON tp.CODIGO = dp' +
        '.TIPO_PAGO'
      '                        WHERE vmDev.NUMERO = p.NUMERO_TRN'
      '                    ),'
      '                    ('
      '                        SELECT'
      '                            CASE'
      
        '                                WHEN vmOrig.FORMA_PAGO = '#39'1'#39' THE' +
        'N '#39'EFECTIVO'#39
      
        '                                WHEN vmOrig.FORMA_PAGO = '#39'2'#39' THE' +
        'N '#39'TARJETA'#39
      
        '                                WHEN vmOrig.FORMA_PAGO IN ('#39'20'#39',' +
        #39'21'#39') THEN '#39'TRANSFERENCIA'#39
      
        '                                ELSE UPPER(TRIM(p.tipo_documento' +
        '))'
      '                            END'
      '                        FROM VENTAS_MAST vmDev'
      
        '                        LEFT JOIN VENTAS_MAST vmOrig ON vmOrig.N' +
        'UMERO = vmDev.REF_TRN_ORIGEN'
      '                        WHERE vmDev.NUMERO = p.NUMERO_TRN'
      '                    ),'
      '                    UPPER(TRIM(p.tipo_documento))'
      '                )'
      '            ELSE'
      '                UPPER(TRIM(p.tipo_documento))'
      '        END AS TIPO_DOCUMENTO_DEV'
      
        '    FROM PROC_DATOS_VENTA_DIARIA_C(:fechaini,:fechafin,:ciakey) ' +
        'p'
      '    WHERE'
      '        p.CODIGO_EMPLEADO =:codempleado'
      '        AND p.moneda BETWEEN :monedaini and :monedafin'
      ') q'
      'GROUP BY'
      '    q.NUMERO_TRN,'
      '    q.tipo_documento,'
      '    q.TIPO_DOCUMENTO_DEV,'
      '    q.Tipo_doc,'
      '    q.EsCxc'
      'ORDER BY'
      '    q.NUMERO_TRN')
    Transaction = dmConectar.IBTransaction1
    Left = 56
    Top = 480
  end
  object rxTranCnt: TRxMemoryData
    FieldDefs = <
      item
        Name = 'rxCuenta1'
        DataType = ftString
        Size = 7
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
      end
      item
        Name = 'cod_concepto_cta'
        DataType = ftInteger
      end
      item
        Name = 'rxCodigo_Prod'
        DataType = ftString
        Size = 40
      end>
    OnCalcFields = rxTranCntCalcFields
    Left = 390
    Top = 8
    object rxTranCntrxCuenta1: TStringField
      FieldName = 'rxCuenta1'
      Size = 7
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
      DisplayFormat = ',0.00'
    end
    object rxTranCntrxCredito: TFloatField
      DisplayLabel = 'Credito'
      FieldName = 'rxCredito'
      DisplayFormat = ',0.00'
    end
    object rxTranCntNombreCuenta: TStringField
      DisplayWidth = 80
      FieldKind = fkCalculated
      FieldName = 'NombreCuenta'
      Size = 80
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
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
    end
    object rxTranCntcod_concepto_cta: TIntegerField
      FieldName = 'cod_concepto_cta'
    end
    object rxTranCntrxCodigo_Prod: TStringField
      FieldName = 'rxCodigo_Prod'
      Size = 40
    end
  end
  object tDocTranCxc: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DOC_TRAN_CXT'
    Left = 168
  end
  object dstDocTranCxc: TDataSource
    DataSet = tDocTranCxc
    Left = 312
    Top = 64
  end
  object tCtaTipocntd: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'CTA_TIPOCNTDINDEX1'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY8'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'CTA_TIPOCNTD'
    Left = 168
    Top = 480
    object tCtaTipocntdCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tCtaTipocntdDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object dtRxTranCnt: TDataSource
    DataSet = rxTranCnt
    Left = 317
    Top = 136
  end
  object qryDistStatusCnt: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From DISTR_STATUS_CNT'
      'Where modulo_cnt=:modulocnt')
    Left = 272
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'modulocnt'
        ParamType = ptUnknown
      end>
    object qryDistStatusCntSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DISTR_STATUS_CNT.SERIE'
      Required = True
    end
    object qryDistStatusCntNOMBRE_CAMPO_ORIGEN: TIBStringField
      FieldName = 'NOMBRE_CAMPO_ORIGEN'
      Origin = 'DISTR_STATUS_CNT.NOMBRE_CAMPO_ORIGEN'
      Size = 40
    end
    object qryDistStatusCntNOMBRE_CAMPO_DESTINO: TIBStringField
      FieldName = 'NOMBRE_CAMPO_DESTINO'
      Origin = 'DISTR_STATUS_CNT.NOMBRE_CAMPO_DESTINO'
      Size = 40
    end
    object qryDistStatusCntNOMBRE_TABLA_DESTINO: TIBStringField
      FieldName = 'NOMBRE_TABLA_DESTINO'
      Origin = 'DISTR_STATUS_CNT.NOMBRE_TABLA_DESTINO'
      Size = 40
    end
    object qryDistStatusCntVALOR_DESTINO: TIBStringField
      FieldName = 'VALOR_DESTINO'
      Origin = 'DISTR_STATUS_CNT.VALOR_DESTINO'
      FixedChar = True
      Size = 1
    end
    object qryDistStatusCntMODULO_CNT: TIntegerField
      FieldName = 'MODULO_CNT'
      Origin = 'DISTR_STATUS_CNT.MODULO_CNT'
      Required = True
    end
  end
  object qryUpdateDistrCnt: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    Transaction = dmConectar.IBTransaction1
    Left = 320
    Top = 192
  end
  object dsrxIngChequeDet: TDataSource
    DataSet = rxIngChequeDet
    Left = 464
    Top = 248
  end
  object rxIngChequeDet: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Numero_Recibo'
        DataType = ftInteger
      end
      item
        Name = 'Numero_Cheque'
        DataType = ftInteger
      end
      item
        Name = 'Codigo_Banco'
        DataType = ftInteger
      end
      item
        Name = 'Monto_Cheque'
        DataType = ftCurrency
      end>
    Left = 464
    Top = 192
    object rxIngChequeDetNumero_Recibo: TIntegerField
      FieldName = 'Numero_Recibo'
    end
    object rxIngChequeDetNumero_Cheque: TIntegerField
      FieldName = 'Numero_Cheque'
    end
    object rxIngChequeDetCodigo_Banco: TIntegerField
      FieldName = 'Codigo_Banco'
    end
    object rxIngChequeDetMonto_Cheque: TCurrencyField
      FieldName = 'Monto_Cheque'
    end
  end
  object tblIngChequesDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from COBROS_EN_CHEQUE'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into COBROS_EN_CHEQUE'
      
        '  (SERIE, NUMERO_RECIBO, NUMERO_CHEQUE, CODIGO_BANCO, MONTO_CHEQ' +
        'UE, COD_USUARIO, '
      '   FECHA_IN, IN_POR, MOD_POR, FECHA_MOD, STATUS)'
      'values'
      
        '  (:SERIE, :NUMERO_RECIBO, :NUMERO_CHEQUE, :CODIGO_BANCO, :MONTO' +
        '_CHEQUE, '
      
        '   :COD_USUARIO, :FECHA_IN, :IN_POR, :MOD_POR, :FECHA_MOD, :STAT' +
        'US)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO_RECIBO,'
      '  NUMERO_CHEQUE,'
      '  CODIGO_BANCO,'
      '  MONTO_CHEQUE,'
      '  COD_USUARIO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  MOD_POR,'
      '  FECHA_MOD,'
      '  STATUS'
      'from COBROS_EN_CHEQUE '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select  * From COBROS_EN_CHEQUE'
      'Where NUMERO_RECIBO=:numerorecibo')
    ModifySQL.Strings = (
      'update COBROS_EN_CHEQUE'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO_RECIBO = :NUMERO_RECIBO,'
      '  NUMERO_CHEQUE = :NUMERO_CHEQUE,'
      '  CODIGO_BANCO = :CODIGO_BANCO,'
      '  MONTO_CHEQUE = :MONTO_CHEQUE,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  STATUS = :STATUS'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 400
    Top = 144
    object tblIngChequesDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'COBROS_EN_CHEQUE.SERIE'
      Required = True
    end
    object tblIngChequesDetNUMERO_RECIBO: TIntegerField
      FieldName = 'NUMERO_RECIBO'
      Origin = 'COBROS_EN_CHEQUE.NUMERO_RECIBO'
      Required = True
    end
    object tblIngChequesDetNUMERO_CHEQUE: TIntegerField
      FieldName = 'NUMERO_CHEQUE'
      Origin = 'COBROS_EN_CHEQUE.NUMERO_CHEQUE'
    end
    object tblIngChequesDetCODIGO_BANCO: TIntegerField
      FieldName = 'CODIGO_BANCO'
      Origin = 'COBROS_EN_CHEQUE.CODIGO_BANCO'
    end
    object tblIngChequesDetMONTO_CHEQUE: TFloatField
      FieldName = 'MONTO_CHEQUE'
      Origin = 'COBROS_EN_CHEQUE.MONTO_CHEQUE'
    end
    object tblIngChequesDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'COBROS_EN_CHEQUE.COD_USUARIO'
    end
    object tblIngChequesDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'COBROS_EN_CHEQUE.FECHA_IN'
    end
    object tblIngChequesDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'COBROS_EN_CHEQUE.IN_POR'
      Size = 12
    end
    object tblIngChequesDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'COBROS_EN_CHEQUE.MOD_POR'
      Size = 12
    end
    object tblIngChequesDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'COBROS_EN_CHEQUE.FECHA_MOD'
    end
    object tblIngChequesDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'COBROS_EN_CHEQUE.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dsTblIngChequesDet: TDataSource
    DataSet = rxIngChequeDet
    Left = 488
    Top = 136
  end
  object dsQryBancos: TDataSource
    DataSet = qryBancos
    Left = 440
    Top = 312
  end
  object qryBancos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from BANCOS'
      'where cia_key =:ciakey')
    Left = 368
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ciakey'
        ParamType = ptInput
      end>
    object qryBancosCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'BANCOS.CODIGO'
      Required = True
    end
    object qryBancosCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'BANCOS.CIA_KEY'
    end
    object qryBancosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'BANCOS.DESCRIPCION'
      Size = 35
    end
    object qryBancosCODIGO_ABR: TIBStringField
      FieldName = 'CODIGO_ABR'
      Origin = 'BANCOS.CODIGO_ABR'
      Size = 12
    end
  end
  object stpProcNumDoc: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_NUMDOC'
    Left = 476
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO_GEN'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'TIPODOC'
        ParamType = ptInput
      end>
  end
  object stp_UpdateCxc: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_UPDATECXC'
    Left = 450
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALOR_PENDIENTE'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_FACT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_PAGADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ACCION'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE_IN'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHATRN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMEROTRN_CXC'
        ParamType = ptInput
      end>
  end
  object rxIngresoEnBonos: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EmitidoPor'
        DataType = ftInteger
      end
      item
        Name = 'Monto'
        DataType = ftCurrency
      end>
    Left = 408
    Top = 376
    object rxIngresoEnBonosNumero: TStringField
      FieldName = 'Numero'
    end
    object rxIngresoEnBonosEmitidoPor: TIntegerField
      FieldName = 'EmitidoPor'
    end
    object rxIngresoEnBonosMonto: TCurrencyField
      FieldName = 'Monto'
    end
  end
  object dsrxIngresoEnBonos: TDataSource
    DataSet = rxIngresoEnBonos
    Left = 408
    Top = 424
  end
  object rxIngresoEnTarjeta: TRxMemoryData
    FieldDefs = <
      item
        Name = 'formaPago'
        DataType = ftSmallint
      end
      item
        Name = 'NumeroDocumento'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NumeroTarjeta'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TipoTarjeta'
        DataType = ftSmallint
      end
      item
        Name = 'ProveedorTarjeta'
        DataType = ftSmallint
      end
      item
        Name = 'NumeroAutorizacion'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Mes'
        DataType = ftSmallint
      end
      item
        Name = 'Anio'
        DataType = ftSmallint
      end
      item
        Name = 'MONTOAUTORIZADO'
        DataType = ftCurrency
      end
      item
        Name = 'MontoEnEfectivo'
        DataType = ftCurrency
      end
      item
        Name = 'MontoEnCheque'
        DataType = ftCurrency
      end
      item
        Name = 'MontoEnBonos'
        DataType = ftCurrency
      end
      item
        Name = 'Diferencia'
        DataType = ftCurrency
      end>
    Left = 368
    Top = 488
    object rxIngresoEnTarjetaformaPago: TSmallintField
      FieldName = 'FormaPago'
    end
    object rxIngresoEnTarjetaNumeroDocumento: TStringField
      FieldName = 'NumeroDocumento'
    end
    object rxIngresoEnTarjetaNumeroTarjeta: TStringField
      FieldName = 'NumeroTarjeta'
    end
    object rxIngresoEnTarjetaTipoTarjeta: TSmallintField
      FieldName = 'TipoTarjeta'
    end
    object rxIngresoEnTarjetaProveedorTarjeta: TSmallintField
      FieldName = 'ProveedorTarjeta'
    end
    object rxIngresoEnTarjetaNumeroAutorizacion: TStringField
      FieldName = 'NumeroAutorizacion'
    end
    object rxIngresoEnTarjetaMes: TSmallintField
      FieldName = 'Mes'
    end
    object rxIngresoEnTarjetaAnio: TSmallintField
      FieldName = 'Anio'
    end
    object rxIngresoEnTarjetaMONTOAUTORIZADO: TCurrencyField
      DisplayLabel = 'Monto Autorizado'
      FieldName = 'MONTOAUTORIZADO'
    end
    object rxIngresoEnTarjetaMontoEnEfectivo: TCurrencyField
      FieldName = 'MontoEnEfectivo'
    end
    object rxIngresoEnTarjetaMontoEnCheque: TCurrencyField
      FieldName = 'MontoEnCheque'
    end
    object rxIngresoEnTarjetaMontoEnBonos: TCurrencyField
      FieldName = 'MontoEnBonos'
    end
    object rxIngresoEnTarjetaDiferencia: TCurrencyField
      FieldName = 'Diferencia'
    end
  end
  object tblDetallePagos: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DETALLE_PAGOS'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into DETALLE_PAGOS'
      
        '  (SERIE, FECHA, TIPO_TARJETA, NUMERO_TARJETA_CRED, ANO_VENCE, M' +
        'ES_VENCE, '
      
        '   MONTO_PAGADO, NUMERO_APROBACION, TIPO, CODIGO_PROVEEDOR, TIPO' +
        '_PAGO, '
      
        '   NUMERO_CHEQUE, COD_BANCO_CHEQUE, SERIE_TRN, AREA_TRANS, NUMER' +
        'O_CUPON, '
      '   PAGO, GLBNUMVTAPOS)'
      'values'
      
        '  (:SERIE, :FECHA, :TIPO_TARJETA, :NUMERO_TARJETA_CRED, :ANO_VEN' +
        'CE, :MES_VENCE, '
      
        '   :MONTO_PAGADO, :NUMERO_APROBACION, :TIPO, :CODIGO_PROVEEDOR, ' +
        ':TIPO_PAGO, '
      
        '   :NUMERO_CHEQUE, :COD_BANCO_CHEQUE, :SERIE_TRN, :AREA_TRANS, :' +
        'NUMERO_CUPON, '
      '   :PAGO, :GLBNUMVTAPOS)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  FECHA,'
      '  TIPO_TARJETA,'
      '  NUMERO_TARJETA_CRED,'
      '  ANO_VENCE,'
      '  MES_VENCE,'
      '  MONTO_PAGADO,'
      '  NUMERO_APROBACION,'
      '  TIPO,'
      '  CODIGO_PROVEEDOR,'
      '  TIPO_PAGO,'
      '  NUMERO_CHEQUE,'
      '  COD_BANCO_CHEQUE,'
      '  SERIE_TRN,'
      '  AREA_TRANS,'
      '  NUMERO_CUPON,'
      '  PAGO,'
      '  GLBNUMVTAPOS'
      'from DETALLE_PAGOS '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select *  From DETALLE_PAGOS'
      'Where  serie_trn =:serietrn'
      'and area_trans=:areatrans'
      'and GlbNumVtaPOS =:GlbNumVtaPOS')
    ModifySQL.Strings = (
      'update DETALLE_PAGOS'
      'set'
      '  SERIE = :SERIE,'
      '  FECHA = :FECHA,'
      '  TIPO_TARJETA = :TIPO_TARJETA,'
      '  NUMERO_TARJETA_CRED = :NUMERO_TARJETA_CRED,'
      '  ANO_VENCE = :ANO_VENCE,'
      '  MES_VENCE = :MES_VENCE,'
      '  MONTO_PAGADO = :MONTO_PAGADO,'
      '  NUMERO_APROBACION = :NUMERO_APROBACION,'
      '  TIPO = :TIPO,'
      '  CODIGO_PROVEEDOR = :CODIGO_PROVEEDOR,'
      '  TIPO_PAGO = :TIPO_PAGO,'
      '  NUMERO_CHEQUE = :NUMERO_CHEQUE,'
      '  COD_BANCO_CHEQUE = :COD_BANCO_CHEQUE,'
      '  SERIE_TRN = :SERIE_TRN,'
      '  AREA_TRANS = :AREA_TRANS,'
      '  NUMERO_CUPON = :NUMERO_CUPON,'
      '  PAGO = :PAGO,'
      '  GLBNUMVTAPOS = :GLBNUMVTAPOS'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_DET_PAGO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 504
    Top = 352
    object tblDetallePagosSERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'DETALLE_PAGOS.SERIE'
      Required = True
    end
    object tblDetallePagosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'DETALLE_PAGOS.FECHA'
    end
    object tblDetallePagosTIPO_TARJETA: TSmallintField
      DisplayLabel = 'TipoTarjeta'
      FieldName = 'TIPO_TARJETA'
      Origin = 'DETALLE_PAGOS.TIPO_TARJETA'
    end
    object tblDetallePagosNUMERO_TARJETA_CRED: TIBStringField
      DisplayLabel = 'Numero Tarjeta'
      FieldName = 'NUMERO_TARJETA_CRED'
      Origin = 'DETALLE_PAGOS.NUMERO_TARJETA_CRED'
    end
    object tblDetallePagosANO_VENCE: TIntegerField
      DisplayLabel = 'A'#241'o Vence'
      FieldName = 'ANO_VENCE'
      Origin = 'DETALLE_PAGOS.ANO_VENCE'
    end
    object tblDetallePagosMES_VENCE: TSmallintField
      DisplayLabel = 'Mes Vence'
      FieldName = 'MES_VENCE'
      Origin = 'DETALLE_PAGOS.MES_VENCE'
    end
    object tblDetallePagosMONTO_PAGADO: TFloatField
      DisplayLabel = 'Monto Pagado'
      FieldName = 'MONTO_PAGADO'
      Origin = 'DETALLE_PAGOS.MONTO_PAGADO'
      DisplayFormat = ',0.00'
    end
    object tblDetallePagosNUMERO_APROBACION: TIBStringField
      DisplayLabel = '#Aprobacion'
      FieldName = 'NUMERO_APROBACION'
      Origin = 'DETALLE_PAGOS.NUMERO_APROBACION'
      FixedChar = True
      Size = 15
    end
    object tblDetallePagosTIPO: TSmallintField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'DETALLE_PAGOS.TIPO'
    end
    object tblDetallePagosCODIGO_PROVEEDOR: TSmallintField
      DisplayLabel = 'CodProveedor'
      FieldName = 'CODIGO_PROVEEDOR'
      Origin = 'DETALLE_PAGOS.CODIGO_PROVEEDOR'
    end
    object tblDetallePagosTIPO_PAGO: TSmallintField
      DisplayLabel = 'TPago'
      FieldName = 'TIPO_PAGO'
      Origin = 'DETALLE_PAGOS.TIPO_PAGO'
    end
    object tblDetallePagosNUMERO_CHEQUE: TIntegerField
      DisplayLabel = '#Cheque'
      FieldName = 'NUMERO_CHEQUE'
      Origin = 'DETALLE_PAGOS.NUMERO_CHEQUE'
    end
    object tblDetallePagosCOD_BANCO_CHEQUE: TIntegerField
      DisplayLabel = 'CodBanco'
      FieldName = 'COD_BANCO_CHEQUE'
      Origin = 'DETALLE_PAGOS.COD_BANCO_CHEQUE'
    end
    object tblDetallePagosSERIE_TRN: TIntegerField
      DisplayLabel = 'Serie Trn'
      FieldName = 'SERIE_TRN'
      Origin = 'DETALLE_PAGOS.SERIE_TRN'
    end
    object tblDetallePagosAREA_TRANS: TSmallintField
      DisplayLabel = 'Area Trans'
      FieldName = 'AREA_TRANS'
      Origin = 'DETALLE_PAGOS.AREA_TRANS'
    end
    object tblDetallePagosNUMERO_CUPON: TIntegerField
      FieldName = 'NUMERO_CUPON'
      Origin = 'DETALLE_PAGOS.NUMERO_CUPON'
    end
    object tblDetallePagosPAGO: TSmallintField
      FieldName = 'PAGO'
      Origin = 'DETALLE_PAGOS.PAGO'
    end
    object tblDetallePagosGLBNUMVTAPOS: TIntegerField
      FieldName = 'GLBNUMVTAPOS'
      Origin = 'DETALLE_PAGOS.GLBNUMVTAPOS'
    end
  end
  object dstblDetallePagos: TDataSource
    DataSet = tblDetallePagos
    Left = 488
    Top = 416
  end
  object qryCobrosConTarjetaCuadre: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '    p.codigo_proveedor,'
      '    COALESCE(v.MONEDA, t.MONEDA) AS MONEDA,'
      '    SUM(COALESCE(p.monto_pagado, 0)) AS monto'
      'FROM '
      '    DETALLE_PAGOS p'
      'LEFT JOIN '
      '    VENTAS_MAST v ON p.SERIE_TRN = v.NUMERO AND p.AREA_TRANS = 1'
      'LEFT JOIN '
      '    TRANS_CXC t ON p.SERIE_TRN = t.SERIE AND p.AREA_TRANS = 2'
      'WHERE '
      '    p.fecha =:fecha'
      '    AND p.NUMERO_TARJETA_CRED IS NOT NULL'
      
        '    AND ((v.MONEDA BETWEEN :monedaini  AND :monedafin AND v.COD_' +
        'USR_CAJA =:codigoVendedor) OR '
      
        '         (t.MONEDA BETWEEN :monedainicxc AND :monedafincxc AND t' +
        '.CODIGO_VENDEDOR =:codigoVendedorcxc))'
      '    AND v.STATUS IN ('#39'A'#39','#39'R'#39','#39'P'#39')'
      'AND V.STATUS IN ('#39'A'#39','#39'R'#39','#39'P'#39')'
      'GROUP BY '
      '    p.codigo_proveedor,'
      '    COALESCE(v.MONEDA, t.MONEDA);')
    Left = 480
    Top = 472
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'monedaini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'monedafin'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigoVendedor'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'monedainicxc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'monedafincxc'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigoVendedorcxc'
        ParamType = ptInput
      end>
    object qryCobrosConTarjetaCuadreMONTO: TFloatField
      FieldName = 'MONTO'
    end
    object qryCobrosConTarjetaCuadreCODIGO_PROVEEDOR: TSmallintField
      FieldName = 'CODIGO_PROVEEDOR'
      Origin = 'DETALLE_PAGOS.CODIGO_PROVEEDOR'
    end
  end
  object qryCobrosConTarjetaCuadreG: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select sum(p.monto_pagado) monto, p.codigo_proveedor,v.MONEDA '
      'From DETALLE_PAGOS p, VENTAS_MAST v'
      'Where p.fecha Between :fechaIni And :fechaFin'
      'And p.NUMERO_TARJETA_CRED Is Not Null'
      'And p.SERIE_TRN = v.NUMERO'
      'And v.MONEDA between :monedaini And :monedafin'
      'Group By p.codigo_proveedor,v.MONEDA')
    Left = 560
    Top = 288
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaIni'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechaFin'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'monedaini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'monedafin'
        ParamType = ptInput
      end>
    object qryCobrosConTarjetaCuadreGMONTO: TFloatField
      FieldName = 'MONTO'
    end
    object qryCobrosConTarjetaCuadreGCODIGO_PROVEEDOR: TSmallintField
      FieldName = 'CODIGO_PROVEEDOR'
      Origin = 'DETALLE_PAGOS.CODIGO_PROVEEDOR'
    end
    object qryCobrosConTarjetaCuadreGMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_MAST.MONEDA'
      FixedChar = True
      Size = 1
    end
  end
  object qryIngPropinaLey: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      
        'Select Distinct NUMERO_TRN, Tipo_doc, tipo_documento , sum(DISTI' +
        'NCT propina) Propina, sum(DISTINCT propinalegal)  propinalegal'
      'FROM PROC_DATOS_VENTA_DIARIA (:fechaini,:fechafin,:ciakey)'
      'Where '
      '(CODIGO_EMPLEADO =:codempleado)'
      'and moneda between :monedaini and :monedafin'
      'Group by NUMERO_TRN, Tipo_doc, tipo_documento ')
    Transaction = dmConectar.IBTransaction1
    Left = 584
    Top = 432
  end
  object qryPrepagos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select sum(monto)  Monto from PRE_PAGO'
      'where fecha =:fecha'
      'and  CODIGO_USR_CAJA=:codusr')
    Left = 560
    Top = 208
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codusr'
        ParamType = ptInput
      end>
    object qryPrepagosMONTO: TFloatField
      FieldName = 'MONTO'
    end
  end
  object qryDatosblccxc: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'WITH data AS ('
      '  SELECT '
      
        '    CAST(F_PADLEFT(EXTRACT(MONTH FROM r.FECHA_DET),'#39'0'#39',2)||'#39'-'#39'||' +
        #39'01'#39'||'#39'-'#39'||EXTRACT(YEAR FROM r.FECHA_DET) AS TIMESTAMP) AS Fecha' +
        ','
      '    r.CODIGO_CTE, '
      '    SUM(r.debito) AS Debito, '
      '    SUM(r.credito) AS Credito, '
      '    SUM(r.debito) - SUM(r.credito) AS Balance '
      'From PROC_ESTADO_CTA_CXC (:fechain,:fechafin,:codigocte) r'
      '  WHERE r.fecha_det IS NOT NULL'
      '  GROUP BY r.FECHA_DET, Fecha, r.CODIGO_CTE '
      ')'
      'SELECT '
      '  Fecha, '
      '  SUM(balance) AS balance, '
      '  SUM(balance) + ('
      '    SELECT COALESCE(SUM(balance), 0) '
      '    FROM data d2 '
      '    WHERE d2.Fecha < d1.Fecha'
      '  ) AS BalanceAct'
      'FROM data d1'
      'GROUP BY Fecha'
      'ORDER BY Fecha')
    Left = 112
    Top = 448
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechain'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigocte'
        ParamType = ptInput
      end>
    object qryDatosblccxcFECHA: TDateTimeField
      FieldName = 'FECHA'
      DisplayFormat = 'MM/YYY'
    end
    object qryDatosblccxcBALANCE: TFloatField
      FieldName = 'BALANCE'
      DisplayFormat = ',0.00'
    end
    object qryDatosblccxcBALANCEACT: TFloatField
      FieldName = 'BALANCEACT'
      DisplayFormat = ',0.00'
    end
  end
end
