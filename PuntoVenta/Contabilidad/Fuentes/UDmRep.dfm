object dtmodrep: Tdtmodrep
  OldCreateOrder = False
  Left = 302
  Top = 132
  Height = 457
  Width = 856
  object rxBalance: TRxMemoryData
    FieldDefs = <
      item
        Name = 'CUENTA1_BLC'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CUENTA2_BLC'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CUENTA3_BLC'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'MES_BALANCE'
        DataType = ftDateTime
      end
      item
        Name = 'BALANCE_ACT'
        DataType = ftFloat
      end
      item
        Name = 'BALANCE_CR'
        DataType = ftFloat
      end
      item
        Name = 'BALANCE_ANT'
        DataType = ftFloat
      end
      item
        Name = 'DEBITO'
        DataType = ftFloat
      end
      item
        Name = 'CREDITO'
        DataType = ftFloat
      end
      item
        Name = 'FECHA_IN'
        DataType = ftDateTime
      end>
    OnCalcFields = rxBalanceCalcFields
    Left = 148
    Top = 96
    object rxBalanceCUENTA1_BLC: TStringField
      FieldName = 'CUENTA1_BLC'
      Size = 3
    end
    object rxBalanceCUENTA2_BLC: TStringField
      FieldName = 'CUENTA2_BLC'
      Size = 2
    end
    object rxBalanceCUENTA3_BLC: TStringField
      FieldName = 'CUENTA3_BLC'
      Size = 2
    end
    object rxBalanceMES_BALANCE: TDateTimeField
      FieldName = 'MES_BALANCE'
    end
    object rxBalanceBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      DisplayFormat = ',0.00'
    end
    object rxBalanceBALANCE_CR: TFloatField
      FieldName = 'BALANCE_CR'
      DisplayFormat = ',0.00'
    end
    object rxBalanceBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      DisplayFormat = ',0.00'
    end
    object rxBalanceDEBITO: TFloatField
      FieldName = 'DEBITO'
      DisplayFormat = ',0.00'
    end
    object rxBalanceCREDITO: TFloatField
      FieldName = 'CREDITO'
      DisplayFormat = ',0.00'
    end
    object rxBalanceFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
    end
    object rxBalanceNOMBRE_CTA: TStringField
      DisplayWidth = 40
      FieldKind = fkCalculated
      FieldName = 'NOMBRE_CTA'
      Size = 40
      Calculated = True
    end
  end
  object qryEGyP: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    OnCalcFields = qryEGyPCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT c.fecha_act,CUENTA1, CUENTA2, CUENTA3, '
      '              C.NIVEL_CTA, C.TIPO_CTA,'
      '              C.SIGNO_CTA,'
      '              C.NOMBRE_CTA, '
      '              balance_cnt.credito CREDITO, '
      '              balance_cnt.debito DEBITO,'
      '              balance_cnt.balance_act,'
      '              balance_cnt.balance_ant'
      'FROM balance_cnt,  CATALOGO C'
      'WHERE  '
      '     (balance_cnt.credito                  <>0 or '
      '         balance_cnt.debito                <>0 or '
      '         balance_cnt.balance_act      <>0 or  '
      '         balance_cnt.balance_ant      <>0 )'
      '     and fecha_blc= :fecha_act'
      '      and c.cuenta1 > "399"'
      '      and c.nivel_cta = 5'
      '      AND C.TIPO_CTA = "A"'
      '      AND C.CUENTA1  = CUENTA1_BLC '
      '      AND C.CUENTA2  = CUENTA2_BLC '
      '      AND C.CUENTA3  = CUENTA3_BLC '
      'ORDER  BY c.cuenta1, c.cuenta2, c.cuenta3')
    Left = 144
    Top = 40
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha_act'
        ParamType = ptInput
      end>
    object qryEGyPResultadoDb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ResultadoDb'
      Calculated = True
    end
    object qryEGyPResultadoCR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ResultadoCR'
      Calculated = True
    end
    object qryEGyPFECHA_ACT: TDateTimeField
      FieldName = 'FECHA_ACT'
      Origin = 'CATALOGO.FECHA_ACT'
    end
    object qryEGyPCUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Origin = 'CATALOGO.CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryEGyPCUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Origin = 'CATALOGO.CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryEGyPCUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Origin = 'CATALOGO.CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryEGyPNIVEL_CTA: TSmallintField
      FieldName = 'NIVEL_CTA'
      Origin = 'CATALOGO.NIVEL_CTA'
    end
    object qryEGyPTIPO_CTA: TIBStringField
      FieldName = 'TIPO_CTA'
      Origin = 'CATALOGO.TIPO_CTA'
      FixedChar = True
      Size = 1
    end
    object qryEGyPSIGNO_CTA: TSmallintField
      FieldName = 'SIGNO_CTA'
      Origin = 'CATALOGO.SIGNO_CTA'
    end
    object qryEGyPCREDITO: TFloatField
      FieldName = 'CREDITO'
      Origin = 'BALANCE_CNT.CREDITO'
    end
    object qryEGyPDEBITO: TFloatField
      FieldName = 'DEBITO'
      Origin = 'BALANCE_CNT.DEBITO'
    end
    object qryEGyPBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'BALANCE_CNT.BALANCE_ACT'
    end
    object qryEGyPBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'BALANCE_CNT.BALANCE_ANT'
    end
    object qryEGyPResultado: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Resultado'
      Calculated = True
    end
    object qryEGyPDB_Acum: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'DB_Acum'
      Calculated = True
    end
    object qryEGyPCr_Acm: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Cr_Acm'
      Calculated = True
    end
    object qryEGyPVALORC: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'VALORC'
      Calculated = True
    end
    object qryEGyPVALORD: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'VALORD'
      Calculated = True
    end
    object qryEGyPCUENTA: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CUENTA'
      Calculated = True
    end
    object qryEGyPNOMBRE_CTA: TIBStringField
      FieldName = 'NOMBRE_CTA'
      Origin = 'CATALOGO.NOMBRE_CTA'
      Size = 60
    end
  end
  object qryRepDepositos: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    AfterScroll = qryRepDepositosAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  BANCOS.DESCRIPCION AS DESC_BANCO,'
      '  DEPOSITOS_MASTER.*,'
      '  TIPO_CTA_BANCO.DESCRIPCION desc_tipo_cta'
      'FROM'
      '  DEPOSITOS_MASTER'
      
        '  INNER JOIN BANCOS ON (DEPOSITOS_MASTER.ID_BANCO = BANCOS.CODIG' +
        'O)'
      
        '  LEFT OUTER JOIN TIPO_CTA_BANCO ON (DEPOSITOS_MASTER.TIPO_CTA =' +
        ' TIPO_CTA_BANCO.CODIGO)'
      'Where fecha between :fechaini and :fechafin'
      'ORDER BY '
      '  DEPOSITOS_MASTER.ID_BANCO,'
      '  DEPOSITOS_MASTER.TIPO_CTA,'
      '  DEPOSITOS_MASTER.FECHA')
    Left = 264
    Top = 32
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
      end>
    object qryRepDepositosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'BANCOS.DESCRIPCION'
      Size = 35
    end
    object qryRepDepositosNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DEPOSITOS_MASTER.NUMERO'
      Required = True
    end
    object qryRepDepositosFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DEPOSITOS_MASTER.FECHA'
      Required = True
    end
    object qryRepDepositosID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
      Origin = 'DEPOSITOS_MASTER.ID_BANCO'
      Required = True
    end
    object qryRepDepositosMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'DEPOSITOS_MASTER.MONTO'
    end
    object qryRepDepositosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DEPOSITOS_MASTER.STATUS'
      Size = 1
    end
    object qryRepDepositosCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'DEPOSITOS_MASTER.COD_USUARIO'
    end
    object qryRepDepositosFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DEPOSITOS_MASTER.FECHA_IN'
    end
    object qryRepDepositosIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DEPOSITOS_MASTER.IN_POR'
      Size = 12
    end
    object qryRepDepositosFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'DEPOSITOS_MASTER.FECHA_UPDATE'
    end
    object qryRepDepositosTIPO_CTA: TIntegerField
      FieldName = 'TIPO_CTA'
      Origin = 'DEPOSITOS_MASTER.TIPO_CTA'
    end
    object qryRepDepositosCUENTA_BANCO: TIBStringField
      FieldName = 'CUENTA_BANCO'
      Origin = 'DEPOSITOS_MASTER.CUENTA_BANCO'
    end
    object qryRepDepositosDESC_BANCO: TIBStringField
      FieldName = 'DESC_BANCO'
      Origin = 'BANCOS.DESCRIPCION'
      Size = 35
    end
    object qryRepDepositosDESC_TIPO_CTA: TIBStringField
      FieldName = 'DESC_TIPO_CTA'
      Origin = 'TIPO_CTA_BANCO.DESCRIPCION'
      Size = 30
    end
  end
  object qryRepDepositosDet: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  TIPO_DEPOSITO.DESCRIPCION DESC_TIPO_DEPOSITO,'
      '  DEPOSITOS_DET.*'
      'FROM'
      '  DEPOSITOS_DET'
      
        '  INNER JOIN TIPO_DEPOSITO ON (DEPOSITOS_DET.TIPO_DEPOSITO = TIP' +
        'O_DEPOSITO.ID_DEPOSITO)'
      'Where DEPOSITOS_DET.NUMERO =:numero'
      'ORDER BY DEPOSITOS_DET.TIPO_DEPOSITO')
    Left = 264
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryRepDepositosDetDESC_TIPO_DEPOSITO: TIBStringField
      FieldName = 'DESC_TIPO_DEPOSITO'
      Origin = 'TIPO_DEPOSITO.DESCRIPCION'
      Size = 30
    end
    object qryRepDepositosDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DEPOSITOS_DET.SERIE'
      Required = True
    end
    object qryRepDepositosDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DEPOSITOS_DET.NUMERO'
      Required = True
    end
    object qryRepDepositosDetTIPO_DEPOSITO: TIntegerField
      FieldName = 'TIPO_DEPOSITO'
      Origin = 'DEPOSITOS_DET.TIPO_DEPOSITO'
    end
    object qryRepDepositosDetNUMERO_DOCUMENTO: TIBStringField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'DEPOSITOS_DET.NUMERO_DOCUMENTO'
    end
    object qryRepDepositosDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DEPOSITOS_DET.DESCRIPCION'
      Size = 60
    end
    object qryRepDepositosDetMONTO_DEPOSITO: TIntegerField
      FieldName = 'MONTO_DEPOSITO'
      Origin = 'DEPOSITOS_DET.MONTO_DEPOSITO'
    end
    object qryRepDepositosDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DEPOSITOS_DET.STATUS'
      Size = 1
    end
    object qryRepDepositosDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'DEPOSITOS_DET.COD_USUARIO'
    end
    object qryRepDepositosDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DEPOSITOS_DET.FECHA_IN'
    end
    object qryRepDepositosDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DEPOSITOS_DET.IN_POR'
      Size = 12
    end
    object qryRepDepositosDetFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'DEPOSITOS_DET.FECHA_UPDATE'
    end
  end
  object qryRepMayorGen: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    AfterScroll = qryRepMayorGenAfterScroll
    OnCalcFields = qryRepMayorGenCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'Catalogo.CUENTA1, '
      'Catalogo.CUENTA2, '
      'Catalogo.CUENTA3, '
      'Catalogo.NOMBRE_CTA, '
      'Catalogo.SIGNO_CTA, '
      'Balance_cnt.FECHA_BLC, '
      'Balance_cnt.BALANCE_ACT, '
      'Balance_cnt.BALANCE_ANT'
      'FROM CATALOGO Catalogo'
      '   LEFT OUTER JOIN BALANCE_CNT Balance_cnt'
      '   ON  (Catalogo.CUENTA1 = Balance_cnt.CUENTA1_BLC)  '
      '   AND  (Catalogo.CUENTA2 = Balance_cnt.CUENTA2_BLC)  '
      '   AND  (Catalogo.CUENTA3 = Balance_cnt.CUENTA3_BLC)  '
      'WHERE  Balance_cnt.FECHA_BLC = :fechaBalance'
      'AND  Catalogo.NIVEL_CTA = 5'
      'AND  ((Balance_cnt.BALANCE_ACT <> 0)'
      'OR    (Balance_cnt.BALANCE_ANT <> 0))'
      'ORDER BY Catalogo.CUENTA1, Catalogo.CUENTA2, Catalogo.CUENTA3')
    OnFilterRecord = qryRepMayorGenFilterRecord
    Left = 208
    Top = 152
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaBalance'
        ParamType = ptInput
      end>
    object qryRepMayorGenDEBITO_CLD: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DEBITO_CLD'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object qryRepMayorGenCREDITO_CLD: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CREDITO_CLD'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object qryRepMayorGenBLC_INI_CLD: TFloatField
      FieldKind = fkCalculated
      FieldName = 'BLC_INI_CLD'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object qryRepMayorGenResultadoCldDB: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ResultadoCldDB'
      Calculated = True
    end
    object qryRepMayorGenResultadoCldCR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ResultadoCldCR'
      Calculated = True
    end
    object qryRepMayorGenCUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Origin = 'CATALOGO.CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryRepMayorGenCUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Origin = 'CATALOGO.CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryRepMayorGenCUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Origin = 'CATALOGO.CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryRepMayorGenSIGNO_CTA: TSmallintField
      FieldName = 'SIGNO_CTA'
      Origin = 'CATALOGO.SIGNO_CTA'
    end
    object qryRepMayorGenFECHA_BLC: TDateTimeField
      FieldName = 'FECHA_BLC'
      Origin = 'BALANCE_CNT.FECHA_BLC'
    end
    object qryRepMayorGenBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'BALANCE_CNT.BALANCE_ACT'
    end
    object qryRepMayorGenBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'BALANCE_CNT.BALANCE_ANT'
    end
    object qryRepMayorGenNOMBRE_CTA: TIBStringField
      FieldName = 'NOMBRE_CTA'
      Origin = 'CATALOGO.NOMBRE_CTA'
      Size = 60
    end
  end
  object qryRepMayorGenDet: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    OnCalcFields = qryRepMayorGenDetCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Trncnt_master.TIPO_DOC, Trncnt_detalle.NUM_DOC, '
      
        'Trncnt_master.FECHA, Trncnt_detalle.NUMERO, Trncnt_detalle.SERIE' +
        ', '
      'Trncnt_master.DESCRIPCION, Trncnt_detalle.DESCRIPCION_TRN, '
      'Trncnt_detalle.DEBITO_TRN, Trncnt_detalle.CREDITO_TRN,'
      'Trncnt_detalle.STATUS,'
      'Trncnt_detalle.COD_CTA_CONCEPTO,'
      'Trncnt_detalle.CODIGO_DEPTO,'
      'Departamentos.NOMBRE DESC_DEPTO,'
      'Clase_cuentas_adm.NOMBRE ConceptoDescripcion'
      'FROM TRNCNT_MASTER Trncnt_master'
      '   INNER JOIN TRNCNT_DETALLE Trncnt_detalle'
      '   ON  (Trncnt_master.NUMERO = Trncnt_detalle.NUMERO)  '
      '   LEFT OUTER JOIN DEPARTAMENTOS Departamentos'
      '   ON  (Trncnt_detalle.CODIGO_DEPTO = Departamentos.CODIGO)  '
      '   LEFT OUTER JOIN CLASE_CUENTAS_ADM Clase_cuentas_adm'
      
        '   ON  (Trncnt_detalle.COD_CTA_CONCEPTO = Clase_cuentas_adm.CODI' +
        'GO)  '
      '  '
      'WHERE Trncnt_master.FECHA BETWEEN :fechaini and :fechafin'
      'AND Trncnt_detalle.CUENTA1 = :CUENTA1'
      'AND Trncnt_detalle.CUENTA2 = :CUENTA2'
      'AND Trncnt_detalle.CUENTA3 = :CUENTA3'
      
        'AND ((Trncnt_detalle.DEBITO_TRN <> 0) OR (Trncnt_detalle.CREDITO' +
        '_TRN <> 0))'
      
        'ORDER BY Trncnt_master.FECHA, Trncnt_detalle.COD_CTA_CONCEPTO, T' +
        'rncnt_master.TIPO_DOC, Trncnt_detalle.NUM_DOC ')
    Left = 312
    Top = 136
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
        DataType = ftString
        Name = 'CUENTA1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CUENTA2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CUENTA3'
        ParamType = ptInput
      end>
    object qryRepMayorGenDetBalanceActualDb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'BalanceActualDb'
      Calculated = True
    end
    object qryRepMayorGenDetBalanceActualCR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'BalanceActualCR'
      Calculated = True
    end
    object qryRepMayorGenDetTIPO_DOC: TSmallintField
      FieldName = 'TIPO_DOC'
      Origin = 'TRNCNT_MASTER.TIPO_DOC'
      Required = True
    end
    object qryRepMayorGenDetNUM_DOC: TFloatField
      FieldName = 'NUM_DOC'
      Origin = 'TRNCNT_DETALLE.NUM_DOC'
    end
    object qryRepMayorGenDetFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'TRNCNT_MASTER.FECHA'
      Required = True
    end
    object qryRepMayorGenDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TRNCNT_DETALLE.NUMERO'
      Required = True
    end
    object qryRepMayorGenDetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'TRNCNT_DETALLE.SERIE'
      Required = True
    end
    object qryRepMayorGenDetDESCRIPCION_TRN: TIBStringField
      FieldName = 'DESCRIPCION_TRN'
      Origin = 'TRNCNT_DETALLE.DESCRIPCION_TRN'
      Size = 40
    end
    object qryRepMayorGenDetDEBITO_TRN: TFloatField
      FieldName = 'DEBITO_TRN'
      Origin = 'TRNCNT_DETALLE.DEBITO_TRN'
    end
    object qryRepMayorGenDetCREDITO_TRN: TFloatField
      FieldName = 'CREDITO_TRN'
      Origin = 'TRNCNT_DETALLE.CREDITO_TRN'
    end
    object qryRepMayorGenDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRNCNT_DETALLE.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepMayorGenDetCOD_CTA_CONCEPTO: TIntegerField
      FieldName = 'COD_CTA_CONCEPTO'
      Origin = 'TRNCNT_DETALLE.COD_CTA_CONCEPTO'
    end
    object qryRepMayorGenDetCODIGO_DEPTO: TIntegerField
      FieldName = 'CODIGO_DEPTO'
      Origin = 'TRNCNT_DETALLE.CODIGO_DEPTO'
      Required = True
    end
    object qryRepMayorGenDetDESC_DEPTO: TIBStringField
      FieldName = 'DESC_DEPTO'
      Origin = 'DEPARTAMENTOS.NOMBRE'
      Size = 40
    end
    object qryRepMayorGenDetDB_CLD: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DB_CLD'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object qryRepMayorGenDetCR_CLD: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CR_CLD'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object qryRepMayorGenDetCONCEPTODESCRIPCION: TIBStringField
      FieldName = 'CONCEPTODESCRIPCION'
      Origin = 'CLASE_CUENTAS_ADM.NOMBRE'
      Size = 30
    end
    object qryRepMayorGenDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TRNCNT_MASTER.DESCRIPCION'
      Size = 40
    end
  end
  object dtqryRepMayorGen: TDataSource
    DataSet = qryRepMayorGen
    Left = 288
    Top = 192
  end
  object qryTotalDbcr: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT SUM( Trncnt_Detalle.DEBITO_TRN ) db, '
      'SUM( Trncnt_Detalle.CREDITO_TRN ) cr, '
      'Trncnt_detalle.CUENTA1, '
      'Trncnt_detalle.CUENTA2, '
      'Trncnt_detalle.CUENTA3'
      'FROM TRNCNT_MASTER Trncnt_Master'
      '   INNER JOIN TRNCNT_DETALLE Trncnt_Detalle'
      '   ON  (Trncnt_Master.NUMERO = Trncnt_Detalle.NUMERO)  '
      'WHERE   Trncnt_Master.FECHA Between :Fechaini And :Fechafin '
      'And  Trncnt_Master.STATUS IN ('#39'A'#39') '
      ' AND  Trncnt_Detalle.STATUS IN ('#39'A'#39') '
      'GROUP BY '
      'trncnt_detalle.CUENTA1, '
      'trncnt_detalle.CUENTA2, '
      'trncnt_detalle.CUENTA3')
    Left = 40
    Top = 56
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'Fechafin'
        ParamType = ptInput
      end>
    object qryTotalDbcrDB: TFloatField
      FieldName = 'DB'
    end
    object qryTotalDbcrCR: TFloatField
      FieldName = 'CR'
    end
    object qryTotalDbcrCUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Origin = 'TRNCNT_DETALLE.CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryTotalDbcrCUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Origin = 'TRNCNT_DETALLE.CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryTotalDbcrCUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Origin = 'TRNCNT_DETALLE.CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object sqlScripBlcCompOLD: TSQLScript
    DatabaseName = 'CNTTROPICAL'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT '
      'CUENTA1, '
      'CUENTA2, '
      'CUENTA3, '
      'NOMBRE_CTA, '
      'NIVEL_CTA, '
      'TIPO_CTA, '
      'SIGNO_CTA, '
      'BALANCE_ACT, '
      'BALANCE_ANT,'
      'DEBITO_ACT, '
      'CREDITO_ACT, '
      'FECHA_ACT'
      'FROM CATALOGO Catalogo'
      'WHERE  FECHA_ACT = :FECHAACT'
      'AND BALANCE_ACT <>  0'
      '/'
      'SELECT '
      'Catalogo.CUENTA1, '
      'Catalogo.CUENTA2, '
      'Catalogo.CUENTA3, '
      'Catalogo.NOMBRE_CTA, '
      'Catalogo.NIVEL_CTA, '
      'Catalogo.TIPO_CTA, '
      'Catalogo.SIGNO_CTA, '
      'Balance_cnt.BALANCE_ACT, '
      'Balance_cnt.BALANCE_ANT, '
      'Balance_cnt.DEBITO DEBITO_ACT, '
      'Balance_cnt.CREDITO CREDITO_ACT, '
      'Balance_cnt.FECHA_BLC FECHA_ACT'
      'FROM CATALOGO Catalogo'
      '   INNER JOIN BALANCE_CNT Balance_cnt'
      '   ON  (Catalogo.CUENTA1   = Balance_cnt.CUENTA1_BLC)  '
      '   AND  (Catalogo.CUENTA2 = Balance_cnt.CUENTA2_BLC)  '
      '   AND  (Catalogo.CUENTA3 = Balance_cnt.CUENTA3_BLC)  '
      
        'WHERE  (Balance_cnt.BALANCE_ACT <> 0  OR Balance_cnt.BALANCE_ANT' +
        ' <>0 )'
      'AND Balance_cnt.FECHA_BLC = :FECHAACT'
      'AND Balance_cnt.STATUS_CIEA = :Status_ciea'
      'ORDER BY Catalogo.CUENTA1, Catalogo.CUENTA2, Catalogo.CUENTA3')
    Transaction = False
    Left = 152
    Top = 208
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAACT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Status_ciea'
        ParamType = ptInput
      end>
  end
  object sqlScripMayorGeneralOLD: TSQLScript
    DatabaseName = 'CNTTROPICAL'
    SQL.Strings = (
      'SELECT Trncnt_master.TIPO_DOC, Trncnt_detalle.NUM_DOC, '
      
        'Trncnt_master.FECHA, Trncnt_detalle.NUMERO, Trncnt_detalle.SERIE' +
        ', '
      'Trncnt_master.DESCRIPCION, Trncnt_detalle.DESCRIPCION_TRN, '
      'Trncnt_detalle.DEBITO_TRN, Trncnt_detalle.CREDITO_TRN,'
      'Trncnt_detalle.STATUS,'
      'Trncnt_detalle.COD_CTA_CONCEPTO,'
      'Trncnt_detalle.CODIGO_DEPTO,'
      'Departamentos.NOMBRE DESC_DEPTO,'
      'Clase_cuentas_adm.NOMBRE ConceptoDescripcion'
      'FROM TRNCNT_MASTER Trncnt_master'
      '   INNER JOIN TRNCNT_DETALLE Trncnt_detalle'
      '   ON  (Trncnt_master.NUMERO = Trncnt_detalle.NUMERO)  '
      '   LEFT OUTER JOIN DEPARTAMENTOS Departamentos'
      '   ON  (Trncnt_detalle.CODIGO_DEPTO = Departamentos.CODIGO)  '
      '   LEFT OUTER JOIN CLASE_CUENTAS_ADM Clase_cuentas_adm'
      
        '   ON  (Trncnt_detalle.COD_CTA_CONCEPTO = Clase_cuentas_adm.CODI' +
        'GO)  '
      'WHERE Trncnt_master.FECHA BETWEEN :fechaini and :fechafin'
      'AND Trncnt_detalle.CUENTA1 = :CUENTA1'
      'AND Trncnt_detalle.CUENTA2 = :CUENTA2'
      'AND Trncnt_detalle.CUENTA3 = :CUENTA3'
      
        'AND ((Trncnt_detalle.DEBITO_TRN <> 0) OR (Trncnt_detalle.CREDITO' +
        '_TRN <> 0))'
      'order by '
      'Trncnt_detalle.CUENTA1, '
      'Trncnt_detalle.CUENTA2,'
      'Trncnt_detalle.CUENTA3 ,'
      'Trncnt_master.FECHA,'
      'Trncnt_master.TIPO_DOC, Trncnt_detalle.NUM_DOC '
      '/'
      'SELECT Trncnt_master.TIPO_DOC, Trncnt_detalle.NUM_DOC, '
      
        'Trncnt_master.FECHA, Trncnt_detalle.NUMERO, Trncnt_detalle.SERIE' +
        ', '
      'Trncnt_master.DESCRIPCION, Trncnt_detalle.DESCRIPCION_TRN, '
      'Trncnt_detalle.DEBITO_TRN, Trncnt_detalle.CREDITO_TRN,'
      'Trncnt_detalle.STATUS,'
      'Trncnt_detalle.COD_CTA_CONCEPTO,'
      'Trncnt_detalle.CODIGO_DEPTO,'
      'Departamentos.NOMBRE DESC_DEPTO,'
      'Clase_cuentas_adm.NOMBRE ConceptoDescripcion'
      'FROM TRNCNT_MASTER Trncnt_master'
      '   INNER JOIN TRNCNT_DETALLE Trncnt_detalle'
      '   ON  (Trncnt_master.NUMERO = Trncnt_detalle.NUMERO)  '
      '   LEFT OUTER JOIN DEPARTAMENTOS Departamentos'
      '   ON  (Trncnt_detalle.CODIGO_DEPTO = Departamentos.CODIGO)  '
      '   LEFT OUTER JOIN CLASE_CUENTAS_ADM Clase_cuentas_adm'
      
        '   ON  (Trncnt_detalle.COD_CTA_CONCEPTO = Clase_cuentas_adm.CODI' +
        'GO)  '
      'WHERE Trncnt_master.FECHA BETWEEN :fechaini and :fechafin'
      'AND Trncnt_detalle.CUENTA1 = :CUENTA1'
      'AND Trncnt_detalle.CUENTA2 = :CUENTA2'
      'AND Trncnt_detalle.CUENTA3 = :CUENTA3'
      
        'AND ((Trncnt_detalle.DEBITO_TRN <> 0) OR (Trncnt_detalle.CREDITO' +
        '_TRN <> 0))'
      'ORDER BY '
      'Trncnt_detalle.CUENTA1, '
      'Trncnt_detalle.CUENTA2,'
      'Trncnt_detalle.CUENTA3 ,'
      'Trncnt_master.FECHA,'
      'Trncnt_master.TIPO_DOC, Trncnt_detalle.NUM_DOC '
      ''
      ''
      '')
    Transaction = False
    Left = 72
    Top = 248
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
        DataType = ftString
        Name = 'CUENTA1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CUENTA2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CUENTA3'
        ParamType = ptInput
      end>
  end
  object sqlscripfactOLD: TSQLScript
    DatabaseName = 'CNTTROPICAL'
    SQL.Strings = (
      'SELECT SERIE, FECHA_DET, NUMERO_DET, '
      'CODIGOFACTURAR,CODIGO_CLIENTE_DET, CODIGO_SERV, NO_SERIE_DET,'
      'ORIGEN_DETA, DESTINO_DETA,'
      'CANTIDAD_DETA, CANT_ADULTO_DETA, NUM_DOC_DETA, '
      'NOMBRE_CLIENTE_DET, MONEDA_DET, TARIFA_SERV_DETA, '
      'PORC_DESC_DET, VALOR_SERVICIO_DET, VALOR_TOTAL_DET,'
      'ITBI_DET, PROPINA_DET, COMISION_DET, PORC_18DET, '
      'NUM_FACT_DET, NUMERO_BOLETO_DET, IMPUESTO_SERV_DET,'
      'RUTA1_DET, RUTA2_DET, RUTA3_DET, RUTA4_DET, STATUS_DET,'
      'Servicio_detalle.TIPO_SERVICIO_DET,'
      'Servicio_detalle.TIPO_PAX_DET,'
      'Servicio_detalle.CLASESERV_DET,'
      'Servicio_detalle.SUB_CLIFSERVICIO_DET,'
      'Servicio_detalle.TIPO_SERV_DET,'
      'Servicio_detalle.COD_AREA_FACT'
      ''
      
        'FROM SERVICIO_DETALLE Servicio_detalle, CLIENTES_TIPOF clientes_' +
        'tipof'
      'WHERE FECHA_DET BETWEEN :FECHAINI AND :FECHAFIN'
      'AND TIPO_SERV_DET = :TIPO AND MONEDA_DET = :MONEDA'
      'AND STATUS_DET NOT IN ('#39'C'#39')'
      'and CODIGOFACTURAR = CLIENTES_TIPOF.codigo_cte'
      'AND CLIENTES_TIPOF.MONEDA_FACT = '#39'1'#39
      ''
      ''
      'ORDER BY '
      'CODIGOFACTURAR, '
      'Servicio_detalle.COD_AREA_FACT,'
      'Servicio_detalle.CODIGO_SERV,'
      'Servicio_detalle.TIPO_SERVICIO_DET,'
      'Servicio_detalle.TIPO_PAX_DET,'
      'Servicio_detalle.CLASESERV_DET'
      '/'
      'SELECT SERIE, FECHA_DET, NUMERO_DET, '
      'CODIGOFACTURAR,CODIGO_CLIENTE_DET, CODIGO_SERV, NO_SERIE_DET,'
      'ORIGEN_DETA, DESTINO_DETA,'
      'CANTIDAD_DETA, CANT_ADULTO_DETA, NUM_DOC_DETA, '
      'NOMBRE_CLIENTE_DET, MONEDA_DET, TARIFA_SERV_DETA, '
      'PORC_DESC_DET, VALOR_SERVICIO_DET, VALOR_TOTAL_DET,'
      'ITBI_DET, PROPINA_DET, COMISION_DET, PORC_18DET, '
      'NUM_FACT_DET, NUMERO_BOLETO_DET, IMPUESTO_SERV_DET,'
      'RUTA1_DET, RUTA2_DET, RUTA3_DET, RUTA4_DET, STATUS_DET,'
      'Servicio_detalle.TIPO_SERVICIO_DET,'
      'Servicio_detalle.TIPO_PAX_DET,'
      'Servicio_detalle.CLASESERV_DET,'
      'Servicio_detalle.SUB_CLIFSERVICIO_DET,'
      'Servicio_detalle.TIPO_SERV_DET,'
      'Servicio_detalle.COD_AREA_FACT'
      ''
      
        'FROM SERVICIO_DETALLE Servicio_detalle, CLIENTES_TIPOF clientes_' +
        'tipof'
      'WHERE FECHA_DET BETWEEN :FECHAINI AND :FECHAFIN'
      'AND TIPO_SERV_DET = :TIPO AND MONEDA_DET = :MONEDA'
      'AND STATUS_DET NOT IN ('#39'C'#39')'
      'and CODIGOFACTURAR = CLIENTES_TIPOF.codigo_cte'
      'AND CLIENTES_TIPOF.MONEDA_FACT = '#39'2'#39
      ''
      'ORDER BY '
      'CODIGOFACTURAR, '
      'Servicio_detalle.COD_AREA_FACT,'
      'Servicio_detalle.CODIGO_SERV,'
      'Servicio_detalle.TIPO_SERVICIO_DET,'
      'Servicio_detalle.TIPO_PAX_DET,'
      'Servicio_detalle.CLASESERV_DET'
      ''
      ''
      ''
      '')
    Transaction = False
    Left = 80
    Top = 160
    ParamData = <
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
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end>
  end
  object qryRepOrdCompDeptoSQLScriptOLD: TSQLScript
    DatabaseName = 'CNTTROPICAL'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT '
      'Orden_comp_mast.NUMERO,'
      'Orden_comp_det.SERIE,'
      'Orden_comp_mast.FECHA, '
      'Orden_comp_mast.CODIGO_PROVEE, '
      'Orden_comp_det.CANTIDAD, '
      'Orden_comp_det.VALOR, '
      'Orden_comp_det.STATUS, '
      'Orden_comp_mast.STATUS, '
      'Clase_cuentas_adm.Nombre CentroCosto,'
      'Proveedores.DESCRIPCION, '
      'Departamentos.CODIGO CODIGO_DEPTO_AUX, '
      'Departamentos.NOMBRE NOMB_DEPTO_AUX,'
      'Deptos.CODIGO CODIGO_DEPTO , '
      'Deptos.NOMBRE NOMB_DEPTO, '
      'Orden_comp_det.DEPARTAMENTO,'
      'Orden_comp_det.NUMERO_DOCUMENTO,'
      'Orden_comp_det.OBSERVACION,'
      'Clase_cuentas_adm.CODIGO CodigoCentroCosto'
      'FROM ORDEN_COMP_MAST Orden_comp_mast'
      '   INNER JOIN ORDEN_COMP_DET Orden_comp_det'
      '   ON  (Orden_comp_mast.NUMERO = Orden_comp_det.NUMERO)  '
      '   LEFT OUTER JOIN PROVEEDORES Proveedores'
      '   ON  (Orden_comp_mast.CODIGO_PROVEE = Proveedores.CODIGO)  '
      '   LEFT OUTER JOIN DEPARTAMENTOS Departamentos'
      '   ON  (Orden_comp_det.DEPARTAMENTO = Departamentos.CODIGO)  '
      '   LEFT OUTER JOIN DEPTOS Deptos'
      '   ON  (Departamentos.COD_DEPTO_NOM = Deptos.CODIGO)  '
      '   LEFT OUTER JOIN CLASE_CUENTAS_ADM Clase_cuentas_adm'
      
        '   ON  (Orden_comp_det.COD_CTA_CONCEPTO = Clase_cuentas_adm.CODI' +
        'GO)  '
      'WHERE Orden_comp_mast.FECHA between :fechaini and :fechafin'
      'AND Orden_comp_det.status in ('#39'A'#39','#39'R'#39')'
      'Order by '
      'Deptos.CODIGO, Orden_comp_mast.CODIGO_PROVEE'
      '/'
      'SELECT '
      'Orden_comp_mast.NUMERO,'
      'Orden_comp_det.SERIE,'
      'Orden_comp_mast.FECHA, '
      'Orden_comp_mast.CODIGO_PROVEE, '
      'Orden_comp_det.CANTIDAD, '
      'Orden_comp_det.VALOR, '
      'Orden_comp_det.STATUS, '
      'Orden_comp_mast.STATUS, '
      'Clase_cuentas_adm.Nombre CentroCosto,'
      'Proveedores.DESCRIPCION, '
      'Departamentos.CODIGO CODIGO_DEPTO_AUX, '
      'Departamentos.NOMBRE NOMB_DEPTO_AUX,'
      'Deptos.CODIGO CODIGO_DEPTO , '
      'Deptos.NOMBRE NOMB_DEPTO, '
      'Orden_comp_det.DEPARTAMENTO,'
      'Orden_comp_det.NUMERO_DOCUMENTO,'
      'Orden_comp_det.OBSERVACION,'
      'Clase_cuentas_adm.CODIGO CodigoCentroCosto'
      'FROM ORDEN_COMP_MAST Orden_comp_mast'
      '   INNER JOIN ORDEN_COMP_DET Orden_comp_det'
      '   ON  (Orden_comp_mast.NUMERO = Orden_comp_det.NUMERO)  '
      '   LEFT OUTER JOIN PROVEEDORES Proveedores'
      '   ON  (Orden_comp_mast.CODIGO_PROVEE = Proveedores.CODIGO)  '
      '   LEFT OUTER JOIN DEPARTAMENTOS Departamentos'
      '   ON  (Orden_comp_det.DEPARTAMENTO = Departamentos.CODIGO)  '
      '   LEFT OUTER JOIN DEPTOS Deptos'
      '   ON  (Departamentos.COD_DEPTO_NOM = Deptos.CODIGO)  '
      '   LEFT OUTER JOIN CLASE_CUENTAS_ADM Clase_cuentas_adm'
      
        '   ON  (Orden_comp_det.COD_CTA_CONCEPTO = Clase_cuentas_adm.CODI' +
        'GO)  '
      'WHERE Orden_comp_mast.FECHA between :fechaini and :fechafin'
      'AND Orden_comp_det.status in ('#39'A'#39','#39'R'#39')'
      'Order by  '
      'Deptos.CODIGO,  Clase_cuentas_adm.CODIGO'
      '/'
      'SELECT '
      'Trncnt_master.fecha,'
      'Trncnt_detalle.SERIE, '
      'Trncnt_detalle.NUMERO, '
      'Departamentos.codigo,'
      'Deptos.Nombre NombreDeptoA, '
      'Departamentos.nombre NombreDeptoB,  '
      'Trncnt_detalle.DESCRIPCION_TRN, '
      'Trncnt_detalle.DEBITO_TRN, '
      'Trncnt_detalle.CREDITO_TRN, '
      'Clase_cuentas_adm.NOMBRE, '
      'Trncnt_detalle.STATUS, '
      'Catalogo.NOMBRE_CTA, '
      'Trncnt_detalle.CUENTA1, '
      'Trncnt_detalle.CUENTA2, '
      'Trncnt_detalle.CUENTA3, '
      'Catalogo.signo_cta,'
      'Trncnt_detalle.CODIGO_DEPTO, '
      'Trncnt_detalle.num_doc,'
      'Centro_costos.DESCRIPCION, '
      'Departamentos.COD_DEPTO_NOM,'
      'Trncnt_detalle.COD_CTA_CONCEPTO'
      'FROM TRNCNT_MASTER Trncnt_master'
      '   INNER JOIN TRNCNT_DETALLE Trncnt_Detalle'
      '   ON  (Trncnt_master.NUMERO = Trncnt_Detalle.NUMERO)  '
      '   LEFT OUTER JOIN CLASE_CUENTAS_ADM Clase_Cuentas_Adm'
      
        '   ON  (Trncnt_detalle.COD_CTA_CONCEPTO = Clase_Cuentas_Adm.CODI' +
        'GO)  '
      '   INNER JOIN CATALOGO Catalogo'
      '   ON  (Trncnt_detalle.CUENTA1 = Catalogo.CUENTA1)  '
      '   AND  (Trncnt_detalle.CUENTA2 = Catalogo.CUENTA2)  '
      '   AND  (Trncnt_detalle.CUENTA3 = Catalogo.CUENTA3)  '
      '   LEFT OUTER JOIN CENTRO_COSTOS Centro_costos'
      
        '   ON  (Trncnt_detalle.CODIGO_CENTRO_COSTO = Centro_costos.CODIG' +
        'O)  '
      '   INNER JOIN DEPARTAMENTOS Departamentos'
      '   ON  (Trncnt_detalle.CODIGO_DEPTO = Departamentos.Codigo)  '
      '   LEFT OUTER JOIN DEPTOS Deptos'
      '   ON  (Departamentos.COD_DEPTO_NOM = Deptos.CODIGO)  '
      'Where Fecha Between :Fechaini  And :Fechafin And '
      'Catalogo.Nivel_Cta = 5'
      'And Trncnt_detalle.CUENTA1 Between "500"  And "700"'
      ''
      'Order by '
      'Trncnt_detalle.COD_CTA_CONCEPTO'
      '/'
      'SELECT '
      'Trncnt_master.fecha,'
      'Trncnt_detalle.SERIE, '
      'Trncnt_detalle.NUMERO, '
      'Departamentos.codigo,'
      'Deptos.Nombre NombreDeptoA, '
      'Departamentos.nombre NombreDeptoB,  '
      'Trncnt_detalle.DESCRIPCION_TRN, '
      'Trncnt_detalle.DEBITO_TRN, '
      'Trncnt_detalle.CREDITO_TRN, '
      'Clase_cuentas_adm.NOMBRE, '
      'Trncnt_detalle.STATUS, '
      'Catalogo.NOMBRE_CTA, '
      'Trncnt_detalle.CUENTA1, '
      'Trncnt_detalle.CUENTA2, '
      'Trncnt_detalle.CUENTA3, '
      'Catalogo.signo_cta,'
      'Trncnt_detalle.CODIGO_DEPTO, '
      'Trncnt_detalle.num_doc,'
      'Centro_costos.DESCRIPCION, '
      'Departamentos.COD_DEPTO_NOM,'
      'Trncnt_detalle.COD_CTA_CONCEPTO'
      'FROM TRNCNT_MASTER Trncnt_master'
      '   INNER JOIN TRNCNT_DETALLE Trncnt_Detalle'
      '   ON  (Trncnt_master.NUMERO = Trncnt_Detalle.NUMERO)  '
      '   LEFT OUTER JOIN CLASE_CUENTAS_ADM Clase_Cuentas_Adm'
      
        '   ON  (Trncnt_detalle.COD_CTA_CONCEPTO = Clase_Cuentas_Adm.CODI' +
        'GO)  '
      '   INNER JOIN CATALOGO Catalogo'
      '   ON  (Trncnt_detalle.CUENTA1 = Catalogo.CUENTA1)  '
      '   AND  (Trncnt_detalle.CUENTA2 = Catalogo.CUENTA2)  '
      '   AND  (Trncnt_detalle.CUENTA3 = Catalogo.CUENTA3)  '
      '   LEFT OUTER JOIN CENTRO_COSTOS Centro_costos'
      
        '   ON  (Trncnt_detalle.CODIGO_CENTRO_COSTO = Centro_costos.CODIG' +
        'O)  '
      '   INNER JOIN DEPARTAMENTOS Departamentos'
      '   ON  (Trncnt_detalle.CODIGO_DEPTO = Departamentos.Codigo)  '
      '   LEFT OUTER JOIN DEPTOS Deptos'
      '   ON  (Departamentos.COD_DEPTO_NOM = Deptos.CODIGO)  '
      'Where Fecha Between :Fechaini  And :Fechafin And '
      'Catalogo.Nivel_Cta = 5'
      'And Trncnt_detalle.CUENTA1 Between "500"  And "700"'
      ''
      'Order by '
      'Departamentos.codigo,'
      'Trncnt_detalle.COD_CTA_CONCEPTO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Transaction = False
    Left = 464
    Top = 40
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
      end>
  end
  object qryRepOrdCompDeptoSQLScript_0: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'Orden_comp_mast.NUMERO,'
      'Orden_comp_det.SERIE,'
      'Orden_comp_mast.FECHA, '
      'Orden_comp_mast.CODIGO_PROVEE, '
      'Orden_comp_det.CANTIDAD, '
      'Orden_comp_det.VALOR, '
      'Orden_comp_det.STATUS, '
      'Orden_comp_mast.STATUS, '
      'Clase_cuentas_adm.Nombre CentroCosto,'
      'Proveedores.DESCRIPCION, '
      'Departamentos.CODIGO CODIGO_DEPTO_AUX, '
      'Departamentos.NOMBRE NOMB_DEPTO_AUX,'
      'Deptos.CODIGO CODIGO_DEPTO , '
      'Deptos.NOMBRE NOMB_DEPTO, '
      'Orden_comp_det.DEPARTAMENTO,'
      'Orden_comp_det.NUMERO_DOCUMENTO,'
      'Orden_comp_det.OBSERVACION,'
      'Clase_cuentas_adm.CODIGO CodigoCentroCosto'
      'FROM ORDEN_COMP_MAST Orden_comp_mast'
      '   INNER JOIN ORDEN_COMP_DET Orden_comp_det'
      '   ON  (Orden_comp_mast.NUMERO = Orden_comp_det.NUMERO)  '
      '   LEFT OUTER JOIN PROVEEDORES Proveedores'
      '   ON  (Orden_comp_mast.CODIGO_PROVEE = Proveedores.CODIGO)  '
      '   LEFT OUTER JOIN DEPARTAMENTOS Departamentos'
      '   ON  (Orden_comp_det.DEPARTAMENTO = Departamentos.CODIGO)  '
      '   LEFT OUTER JOIN DEPTOS Deptos'
      '   ON  (Departamentos.COD_DEPTO_NOM = Deptos.CODIGO)  '
      '   LEFT OUTER JOIN CLASE_CUENTAS_ADM Clase_cuentas_adm'
      
        '   ON  (Orden_comp_det.COD_CTA_CONCEPTO = Clase_cuentas_adm.CODI' +
        'GO)  '
      'WHERE Orden_comp_mast.FECHA between :fechaini and :fechafin'
      'AND Orden_comp_det.status in ('#39'A'#39','#39'R'#39')'
      'Order by '
      'Deptos.CODIGO, Orden_comp_mast.CODIGO_PROVEE')
    Left = 616
    Top = 112
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
  end
  object qryRepOrdCompDeptoSQLScript_1: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'Orden_comp_mast.NUMERO,'
      'Orden_comp_det.SERIE,'
      'Orden_comp_mast.FECHA, '
      'Orden_comp_mast.CODIGO_PROVEE, '
      'Orden_comp_det.CANTIDAD, '
      'Orden_comp_det.VALOR, '
      'Orden_comp_det.STATUS, '
      'Orden_comp_mast.STATUS, '
      'Clase_cuentas_adm.Nombre CentroCosto,'
      'Proveedores.DESCRIPCION, '
      'Departamentos.CODIGO CODIGO_DEPTO_AUX, '
      'Departamentos.NOMBRE NOMB_DEPTO_AUX,'
      'Deptos.CODIGO CODIGO_DEPTO , '
      'Deptos.NOMBRE NOMB_DEPTO, '
      'Orden_comp_det.DEPARTAMENTO,'
      'Orden_comp_det.NUMERO_DOCUMENTO,'
      'Orden_comp_det.OBSERVACION,'
      'Clase_cuentas_adm.CODIGO CodigoCentroCosto'
      'FROM ORDEN_COMP_MAST Orden_comp_mast'
      '   INNER JOIN ORDEN_COMP_DET Orden_comp_det'
      '   ON  (Orden_comp_mast.NUMERO = Orden_comp_det.NUMERO)  '
      '   LEFT OUTER JOIN PROVEEDORES Proveedores'
      '   ON  (Orden_comp_mast.CODIGO_PROVEE = Proveedores.CODIGO)  '
      '   LEFT OUTER JOIN DEPARTAMENTOS Departamentos'
      '   ON  (Orden_comp_det.DEPARTAMENTO = Departamentos.CODIGO)  '
      '   LEFT OUTER JOIN DEPTOS Deptos'
      '   ON  (Departamentos.COD_DEPTO_NOM = Deptos.CODIGO)  '
      '   LEFT OUTER JOIN CLASE_CUENTAS_ADM Clase_cuentas_adm'
      
        '   ON  (Orden_comp_det.COD_CTA_CONCEPTO = Clase_cuentas_adm.CODI' +
        'GO)  '
      'WHERE Orden_comp_mast.FECHA between :fechaini and :fechafin'
      'AND Orden_comp_det.status in ('#39'A'#39','#39'R'#39')'
      'Order by  '
      'Deptos.CODIGO,  Clase_cuentas_adm.CODIGO')
    Left = 616
    Top = 160
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
  end
  object qryRepOrdCompDeptoSQLScript_2: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'Trncnt_master.fecha,'
      'Trncnt_detalle.SERIE, '
      'Trncnt_detalle.NUMERO, '
      'Departamentos.codigo,'
      'Deptos.Nombre NombreDeptoA, '
      'Departamentos.nombre NombreDeptoB,  '
      'Trncnt_detalle.DESCRIPCION_TRN, '
      'Trncnt_detalle.DEBITO_TRN, '
      'Trncnt_detalle.CREDITO_TRN, '
      'Clase_cuentas_adm.NOMBRE, '
      'Trncnt_detalle.STATUS, '
      'Catalogo.NOMBRE_CTA, '
      'Trncnt_detalle.CUENTA1, '
      'Trncnt_detalle.CUENTA2, '
      'Trncnt_detalle.CUENTA3, '
      'Catalogo.signo_cta,'
      'Trncnt_detalle.CODIGO_DEPTO, '
      'Trncnt_detalle.num_doc,'
      'Centro_costos.DESCRIPCION, '
      'Departamentos.COD_DEPTO_NOM,'
      'Trncnt_detalle.COD_CTA_CONCEPTO'
      'FROM TRNCNT_MASTER Trncnt_master'
      '   INNER JOIN TRNCNT_DETALLE Trncnt_Detalle'
      '   ON  (Trncnt_master.NUMERO = Trncnt_Detalle.NUMERO)  '
      '   LEFT OUTER JOIN CLASE_CUENTAS_ADM Clase_Cuentas_Adm'
      
        '   ON  (Trncnt_detalle.COD_CTA_CONCEPTO = Clase_Cuentas_Adm.CODI' +
        'GO)  '
      '   INNER JOIN CATALOGO Catalogo'
      '   ON  (Trncnt_detalle.CUENTA1 = Catalogo.CUENTA1)  '
      '   AND  (Trncnt_detalle.CUENTA2 = Catalogo.CUENTA2)  '
      '   AND  (Trncnt_detalle.CUENTA3 = Catalogo.CUENTA3)  '
      '   LEFT OUTER JOIN CENTRO_COSTOS Centro_costos'
      
        '   ON  (Trncnt_detalle.CODIGO_CENTRO_COSTO = Centro_costos.CODIG' +
        'O)  '
      '   INNER JOIN DEPARTAMENTOS Departamentos'
      '   ON  (Trncnt_detalle.CODIGO_DEPTO = Departamentos.Codigo)  '
      '   LEFT OUTER JOIN DEPTOS Deptos'
      '   ON  (Departamentos.COD_DEPTO_NOM = Deptos.CODIGO)  '
      'Where Fecha Between :Fechaini  And :Fechafin And '
      'Catalogo.Nivel_Cta = 5'
      'And Trncnt_detalle.CUENTA1 Between "500"  And "700"'
      ''
      'Order by '
      'Trncnt_detalle.COD_CTA_CONCEPTO')
    Left = 616
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Fechaini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fechafin'
        ParamType = ptUnknown
      end>
  end
  object qryRepOrdCompDeptoSQLScript_3: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'Trncnt_master.fecha,'
      'Trncnt_detalle.SERIE, '
      'Trncnt_detalle.NUMERO, '
      'Departamentos.codigo,'
      'Deptos.Nombre NombreDeptoA, '
      'Departamentos.nombre NombreDeptoB,  '
      'Trncnt_detalle.DESCRIPCION_TRN, '
      'Trncnt_detalle.DEBITO_TRN, '
      'Trncnt_detalle.CREDITO_TRN, '
      'Clase_cuentas_adm.NOMBRE, '
      'Trncnt_detalle.STATUS, '
      'Catalogo.NOMBRE_CTA, '
      'Trncnt_detalle.CUENTA1, '
      'Trncnt_detalle.CUENTA2, '
      'Trncnt_detalle.CUENTA3, '
      'Catalogo.signo_cta,'
      'Trncnt_detalle.CODIGO_DEPTO, '
      'Trncnt_detalle.num_doc,'
      'Centro_costos.DESCRIPCION, '
      'Departamentos.COD_DEPTO_NOM,'
      'Trncnt_detalle.COD_CTA_CONCEPTO'
      'FROM TRNCNT_MASTER Trncnt_master'
      '   INNER JOIN TRNCNT_DETALLE Trncnt_Detalle'
      '   ON  (Trncnt_master.NUMERO = Trncnt_Detalle.NUMERO)  '
      '   LEFT OUTER JOIN CLASE_CUENTAS_ADM Clase_Cuentas_Adm'
      
        '   ON  (Trncnt_detalle.COD_CTA_CONCEPTO = Clase_Cuentas_Adm.CODI' +
        'GO)  '
      '   INNER JOIN CATALOGO Catalogo'
      '   ON  (Trncnt_detalle.CUENTA1 = Catalogo.CUENTA1)  '
      '   AND  (Trncnt_detalle.CUENTA2 = Catalogo.CUENTA2)  '
      '   AND  (Trncnt_detalle.CUENTA3 = Catalogo.CUENTA3)  '
      '   LEFT OUTER JOIN CENTRO_COSTOS Centro_costos'
      
        '   ON  (Trncnt_detalle.CODIGO_CENTRO_COSTO = Centro_costos.CODIG' +
        'O)  '
      '   INNER JOIN DEPARTAMENTOS Departamentos'
      '   ON  (Trncnt_detalle.CODIGO_DEPTO = Departamentos.Codigo)  '
      '   LEFT OUTER JOIN DEPTOS Deptos'
      '   ON  (Departamentos.COD_DEPTO_NOM = Deptos.CODIGO)  '
      'Where Fecha Between :Fechaini  And :Fechafin And '
      'Catalogo.Nivel_Cta = 5'
      'And Trncnt_detalle.CUENTA1 Between "500"  And "700"'
      ''
      'Order by '
      'Departamentos.codigo,'
      'Trncnt_detalle.COD_CTA_CONCEPTO')
    Left = 616
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Fechaini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fechafin'
        ParamType = ptUnknown
      end>
  end
  object sqlScripMayorGeneral_0: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Trncnt_master.TIPO_DOC, Trncnt_detalle.NUM_DOC, '
      
        'Trncnt_master.FECHA, Trncnt_detalle.NUMERO, Trncnt_detalle.SERIE' +
        ', '
      'Trncnt_master.DESCRIPCION, Trncnt_detalle.DESCRIPCION_TRN, '
      'Trncnt_detalle.DEBITO_TRN, Trncnt_detalle.CREDITO_TRN,'
      'Trncnt_detalle.STATUS,'
      'Trncnt_detalle.COD_CTA_CONCEPTO,'
      'Trncnt_detalle.CODIGO_DEPTO,'
      'Departamentos.NOMBRE DESC_DEPTO,'
      'Clase_cuentas_adm.NOMBRE ConceptoDescripcion'
      'FROM TRNCNT_MASTER Trncnt_master'
      '   INNER JOIN TRNCNT_DETALLE Trncnt_detalle'
      '   ON  (Trncnt_master.NUMERO = Trncnt_detalle.NUMERO)  '
      '   LEFT OUTER JOIN DEPARTAMENTOS Departamentos'
      '   ON  (Trncnt_detalle.CODIGO_DEPTO = Departamentos.CODIGO)  '
      '   LEFT OUTER JOIN CLASE_CUENTAS_ADM Clase_cuentas_adm'
      
        '   ON  (Trncnt_detalle.COD_CTA_CONCEPTO = Clase_cuentas_adm.CODI' +
        'GO)  '
      'WHERE Trncnt_master.FECHA BETWEEN :fechaini and :fechafin'
      'AND Trncnt_detalle.CUENTA1 = :CUENTA1'
      'AND Trncnt_detalle.CUENTA2 = :CUENTA2'
      'AND Trncnt_detalle.CUENTA3 = :CUENTA3'
      
        'AND ((Trncnt_detalle.DEBITO_TRN <> 0) OR (Trncnt_detalle.CREDITO' +
        '_TRN <> 0))'
      'order by '
      'Trncnt_detalle.CUENTA1, '
      'Trncnt_detalle.CUENTA2,'
      'Trncnt_detalle.CUENTA3 ,'
      'Trncnt_master.FECHA,'
      'Trncnt_master.TIPO_DOC, Trncnt_detalle.NUM_DOC')
    Left = 192
    Top = 280
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
      end
      item
        DataType = ftUnknown
        Name = 'CUENTA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CUENTA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CUENTA3'
        ParamType = ptUnknown
      end>
  end
  object sqlScripMayorGeneral_1: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Trncnt_master.TIPO_DOC, Trncnt_detalle.NUM_DOC, '
      
        'Trncnt_master.FECHA, Trncnt_detalle.NUMERO, Trncnt_detalle.SERIE' +
        ', '
      'Trncnt_master.DESCRIPCION, Trncnt_detalle.DESCRIPCION_TRN, '
      'Trncnt_detalle.DEBITO_TRN, Trncnt_detalle.CREDITO_TRN,'
      'Trncnt_detalle.STATUS,'
      'Trncnt_detalle.COD_CTA_CONCEPTO,'
      'Trncnt_detalle.CODIGO_DEPTO,'
      'Departamentos.NOMBRE DESC_DEPTO,'
      'Clase_cuentas_adm.NOMBRE ConceptoDescripcion'
      'FROM TRNCNT_MASTER Trncnt_master'
      '   INNER JOIN TRNCNT_DETALLE Trncnt_detalle'
      '   ON  (Trncnt_master.NUMERO = Trncnt_detalle.NUMERO)  '
      '   LEFT OUTER JOIN DEPARTAMENTOS Departamentos'
      '   ON  (Trncnt_detalle.CODIGO_DEPTO = Departamentos.CODIGO)  '
      '   LEFT OUTER JOIN CLASE_CUENTAS_ADM Clase_cuentas_adm'
      
        '   ON  (Trncnt_detalle.COD_CTA_CONCEPTO = Clase_cuentas_adm.CODI' +
        'GO)  '
      'WHERE Trncnt_master.FECHA BETWEEN :fechaini and :fechafin'
      'AND Trncnt_detalle.CUENTA1 = :CUENTA1'
      'AND Trncnt_detalle.CUENTA2 = :CUENTA2'
      'AND Trncnt_detalle.CUENTA3 = :CUENTA3'
      
        'AND ((Trncnt_detalle.DEBITO_TRN <> 0) OR (Trncnt_detalle.CREDITO' +
        '_TRN <> 0))'
      'ORDER BY '
      'Trncnt_detalle.CUENTA1, '
      'Trncnt_detalle.CUENTA2,'
      'Trncnt_detalle.CUENTA3 ,'
      'Trncnt_master.FECHA,'
      'Trncnt_master.TIPO_DOC, Trncnt_detalle.NUM_DOC ')
    Left = 208
    Top = 336
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
        DataType = ftString
        Name = 'CUENTA1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CUENTA2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CUENTA3'
        ParamType = ptInput
      end>
  end
  object tClase_cuentas_adm: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CLASE_CUENTAS_ADM'
    Left = 432
    Top = 104
    object tClase_cuentas_admCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tClase_cuentas_admCUENTA1: TIntegerField
      FieldName = 'CUENTA1'
    end
    object tClase_cuentas_admCUENTA2: TIntegerField
      FieldName = 'CUENTA2'
    end
    object tClase_cuentas_admCUENTA3: TIntegerField
      FieldName = 'CUENTA3'
    end
    object tClase_cuentas_admNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 30
    end
    object tClase_cuentas_admCODDGII: TIntegerField
      FieldName = 'CODDGII'
    end
    object tClase_cuentas_admCODIGO_CLASE: TIntegerField
      FieldName = 'CODIGO_CLASE'
    end
  end
  object qryRepTrnDiariaCnt: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Trncnt_detalle.CUENTA1, Trncnt_detalle.CUENTA2, '
      
        'Trncnt_detalle.CUENTA3, Trncnt_detalle.SERIE, Trncnt_detalle.NUM' +
        'ERO,'
      'Trncnt_detalle.DESCRIPCION_TRN, Trncnt_detalle.DEBITO_TRN, '
      'Trncnt_detalle.CREDITO_TRN, Trncnt_detalle.STATUS_APLICADA, '
      
        'Trncnt_detalle.STATUS, Trncnt_detalle.NUM_DOC, Trncnt_master.TIP' +
        'O_DOC, '
      'Trncnt_master.STATUS, Trncnt_master.FECHA, Catalogo.NOMBRE_CTA, '
      'Doc_tran_cnt.CODIGO_ABR'
      'FROM TRNCNT_MASTER Trncnt_master'
      '   INNER JOIN TRNCNT_DETALLE Trncnt_detalle'
      '   ON  (Trncnt_master.NUMERO = Trncnt_detalle.NUMERO)  '
      '   INNER JOIN DOC_TRAN_CNT Doc_tran_cnt'
      '   ON  (Trncnt_master.TIPO_DOC = Doc_tran_cnt.CODIGO)  '
      '   INNER JOIN CATALOGO Catalogo'
      '   ON  (Trncnt_detalle.CUENTA1 = Catalogo.CUENTA1)  '
      '   AND  (Trncnt_detalle.CUENTA2 = Catalogo.CUENTA2)  '
      '   AND  (Trncnt_detalle.CUENTA3 = Catalogo.CUENTA3)  '
      'WHERE Trncnt_master.FECHA Between :fechaini and :fechafin'
      'AND Trncnt_detalle.STATUS in ('#39'A'#39','#39'R'#39','#39'F'#39')'
      'AND Trncnt_master.STATUS IN ('#39'A'#39','#39'R'#39','#39'F'#39')'
      'ORDER BY '
      'Trncnt_detalle.NUM_DOC,'
      'Trncnt_detalle.NUMERO,'
      'Trncnt_detalle.SERIE ')
    Left = 376
    Top = 216
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
      end>
  end
  object qryRepTrnDiariaCntR: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Trncnt_detalle.CUENTA1, Trncnt_detalle.CUENTA2, '
      
        'Trncnt_detalle.CUENTA3, Trncnt_detalle.SERIE, Trncnt_detalle.NUM' +
        'ERO,'
      'Trncnt_detalle.DESCRIPCION_TRN, Trncnt_detalle.DEBITO_TRN, '
      'Trncnt_detalle.CREDITO_TRN, Trncnt_detalle.STATUS_APLICADA, '
      
        'Trncnt_detalle.STATUS, Trncnt_detalle.NUM_DOC, Trncnt_master.TIP' +
        'O_DOC, '
      'Trncnt_master.STATUS, Trncnt_master.FECHA, Catalogo.NOMBRE_CTA, '
      'Doc_tran_cnt.CODIGO_ABR'
      'FROM TRNCNT_MASTER Trncnt_master'
      '   INNER JOIN TRNCNT_DETALLE Trncnt_detalle'
      '   ON  (Trncnt_master.NUMERO = Trncnt_detalle.NUMERO)  '
      '   INNER JOIN DOC_TRAN_CNT Doc_tran_cnt'
      '   ON  (Trncnt_master.TIPO_DOC = Doc_tran_cnt.CODIGO)  '
      '   INNER JOIN CATALOGO Catalogo'
      '   ON  (Trncnt_detalle.CUENTA1 = Catalogo.CUENTA1)  '
      '   AND  (Trncnt_detalle.CUENTA2 = Catalogo.CUENTA2)  '
      '   AND  (Trncnt_detalle.CUENTA3 = Catalogo.CUENTA3)  '
      'WHERE Trncnt_master.FECHA Between :fechaini and :fechafin'
      'AND Trncnt_detalle.STATUS in ('#39'A'#39','#39'R'#39','#39'F'#39')'
      'AND Trncnt_master.STATUS IN ('#39'A'#39','#39'R'#39','#39'F'#39')'
      'AND Trncnt_master.Cia_key =:codigocia'
      'ORDER BY '
      'Trncnt_detalle.NUM_DOC,'
      'Trncnt_detalle.NUMERO,'
      'Trncnt_detalle.SERIE ')
    Left = 384
    Top = 280
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
      end
      item
        DataType = ftInteger
        Name = 'codigocia'
        ParamType = ptInput
      end>
  end
  object dtqryRepMayorGenDet: TDataSource
    DataSet = qryRepMayorGenDet
    Left = 296
    Top = 248
  end
  object dtqryTotalDbcr: TDataSource
    DataSet = qryTotalDbcr
    Left = 40
    Top = 104
  end
  object qryblcComp: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'CUENTA1, '
      'CUENTA2, '
      'CUENTA3, '
      'NOMBRE_CTA, '
      'NIVEL_CTA, '
      'TIPO_CTA, '
      'SIGNO_CTA, '
      'BALANCE_ACT, '
      'BALANCE_ANT,'
      'DEBITO_ACT, '
      'CREDITO_ACT, '
      'FECHA_ACT'
      'FROM CATALOGO Catalogo'
      'WHERE  FECHA_ACT = :FECHAACT'
      'AND BALANCE_ACT <>  0'
      'and  (cuenta1 <> "313" And cuenta2 <> "01"'
      'And cuenta3 <> "04")'
      'ORDER BY CUENTA1, CUENTA2, CUENTA3')
    OnFilterRecord = qryblcCompFilterRecord
    Left = 80
    Top = 320
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAACT'
        ParamType = ptInput
      end>
    object qryblcCompCUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Origin = 'CATALOGO.CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryblcCompCUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Origin = 'CATALOGO.CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryblcCompCUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Origin = 'CATALOGO.CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryblcCompNIVEL_CTA: TSmallintField
      FieldName = 'NIVEL_CTA'
      Origin = 'CATALOGO.NIVEL_CTA'
    end
    object qryblcCompTIPO_CTA: TIBStringField
      FieldName = 'TIPO_CTA'
      Origin = 'CATALOGO.TIPO_CTA'
      FixedChar = True
      Size = 1
    end
    object qryblcCompSIGNO_CTA: TSmallintField
      FieldName = 'SIGNO_CTA'
      Origin = 'CATALOGO.SIGNO_CTA'
    end
    object qryblcCompBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'CATALOGO.BALANCE_ACT'
    end
    object qryblcCompBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'CATALOGO.BALANCE_ANT'
    end
    object qryblcCompDEBITO_ACT: TFloatField
      FieldName = 'DEBITO_ACT'
      Origin = 'CATALOGO.DEBITO_ACT'
    end
    object qryblcCompCREDITO_ACT: TFloatField
      FieldName = 'CREDITO_ACT'
      Origin = 'CATALOGO.CREDITO_ACT'
    end
    object qryblcCompFECHA_ACT: TDateTimeField
      FieldName = 'FECHA_ACT'
      Origin = 'CATALOGO.FECHA_ACT'
    end
    object qryblcCompNOMBRE_CTA: TIBStringField
      FieldName = 'NOMBRE_CTA'
      Origin = 'CATALOGO.NOMBRE_CTA'
      Size = 60
    end
  end
  object rxBalanceComp: TRxMemoryData
    FieldDefs = <
      item
        Name = 'CUENTA1'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CUENTA2'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CUENTA3'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NIVEL'
        DataType = ftInteger
      end
      item
        Name = 'SIGNO'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DEBITO'
        DataType = ftFloat
      end
      item
        Name = 'CREDITO'
        DataType = ftFloat
      end>
    Left = 424
    Top = 160
    object rxBalanceCompCUENTA1: TStringField
      DisplayLabel = 'C1'
      FieldName = 'CUENTA1'
      Size = 3
    end
    object rxBalanceCompCUENTA2: TStringField
      DisplayLabel = 'C2'
      FieldName = 'CUENTA2'
      Size = 2
    end
    object rxBalanceCompCUENTA3: TStringField
      DisplayLabel = 'C3'
      FieldName = 'CUENTA3'
      Size = 2
    end
    object rxBalanceCompNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object rxBalanceCompSIGNO: TIntegerField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
    end
    object rxBalanceCompNOMBRE: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 30
    end
    object rxBalanceCompDEBITO: TFloatField
      DisplayLabel = 'Debito'
      FieldName = 'DEBITO'
      DisplayFormat = ',0.00'
    end
    object rxBalanceCompCREDITO: TFloatField
      DisplayLabel = 'Credito'
      FieldName = 'CREDITO'
      DisplayFormat = ',0.00'
    end
    object rxBalanceCompTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 2
    end
  end
  object sqlScriptBlcComp_0: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'CUENTA1, '
      'CUENTA2, '
      'CUENTA3, '
      'NOMBRE_CTA, '
      'NIVEL_CTA, '
      'TIPO_CTA, '
      'SIGNO_CTA, '
      'BALANCE_ACT, '
      'BALANCE_ANT,'
      'DEBITO_ACT, '
      'CREDITO_ACT, '
      'FECHA_ACT'
      'FROM CATALOGO Catalogo'
      'WHERE  FECHA_ACT = :FECHAACT'
      'AND BALANCE_ACT <>  0')
    Left = 384
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHAACT'
        ParamType = ptUnknown
      end>
  end
  object sqlScriptBlcComp_1: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'Catalogo.CUENTA1, '
      'Catalogo.CUENTA2, '
      'Catalogo.CUENTA3, '
      'Catalogo.NOMBRE_CTA, '
      'Catalogo.NIVEL_CTA, '
      'Catalogo.TIPO_CTA, '
      'Catalogo.SIGNO_CTA, '
      'Balance_cnt.BALANCE_ACT, '
      'Balance_cnt.BALANCE_ANT, '
      'Balance_cnt.DEBITO DEBITO_ACT, '
      'Balance_cnt.CREDITO CREDITO_ACT, '
      'Balance_cnt.FECHA_BLC FECHA_ACT'
      'FROM CATALOGO Catalogo'
      '   INNER JOIN BALANCE_CNT Balance_cnt'
      '   ON  (Catalogo.CUENTA1   = Balance_cnt.CUENTA1_BLC)  '
      '   AND  (Catalogo.CUENTA2 = Balance_cnt.CUENTA2_BLC)  '
      '   AND  (Catalogo.CUENTA3 = Balance_cnt.CUENTA3_BLC)  '
      
        'WHERE  (Balance_cnt.BALANCE_ACT <> 0  OR Balance_cnt.BALANCE_ANT' +
        ' <>0 )'
      'AND Balance_cnt.FECHA_BLC = :FECHAACT'
      'AND Balance_cnt.STATUS_CIEA = :Status_ciea'
      'ORDER BY Catalogo.CUENTA1, Catalogo.CUENTA2, Catalogo.CUENTA3')
    Left = 504
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHAACT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status_ciea'
        ParamType = ptUnknown
      end>
  end
  object dtrxBalanceComp: TDataSource
    DataSet = rxBalanceComp
    Left = 440
    Top = 160
  end
  object qryBlcLivecomp: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      'CUENTA1, '
      'CUENTA2, '
      'CUENTA3, '
      'NOMBRE_CTA, '
      'NIVEL_CTA, '
      'TIPO_CTA, '
      'SIGNO_CTA, '
      'FECHA_ACT,'
      'BALANCE_ACT, '
      'BALANCE_ANT,'
      'DEBITO_ACT, '
      'CREDITO_ACT,'
      'Sum(DEBITO_TRN) DEBITO_TRN, Sum(CREDITO_TRN) CREDITO_TRN'
      'From '
      'ProcDatosBlcCompLive'
      '('
      ':codigocia, '
      ':fechaini,:fechafin)'
      'Group By '
      'CUENTA1, '
      'CUENTA2, '
      'CUENTA3, '
      'NOMBRE_CTA, '
      'NIVEL_CTA, '
      'TIPO_CTA, '
      'SIGNO_CTA, '
      'FECHA_ACT,'
      'BALANCE_ACT, '
      'BALANCE_ANT,'
      'DEBITO_ACT, '
      'CREDITO_ACT'
      'order by  debito_trn desc, cuenta1, cuenta2, cuenta3')
    Left = 624
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigocia'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryBlcLivecompCUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Origin = 'CATALOGO.CUENTA1'
      FixedChar = True
      Size = 3
    end
    object qryBlcLivecompCUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Origin = 'CATALOGO.CUENTA2'
      FixedChar = True
      Size = 2
    end
    object qryBlcLivecompCUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Origin = 'CATALOGO.CUENTA3'
      FixedChar = True
      Size = 2
    end
    object qryBlcLivecompNOMBRE_CTA: TIBStringField
      FieldName = 'NOMBRE_CTA'
      Origin = 'CATALOGO.NOMBRE_CTA'
      Size = 60
    end
    object qryBlcLivecompNIVEL_CTA: TSmallintField
      FieldName = 'NIVEL_CTA'
      Origin = 'CATALOGO.NIVEL_CTA'
    end
    object qryBlcLivecompTIPO_CTA: TIBStringField
      FieldName = 'TIPO_CTA'
      Origin = 'CATALOGO.TIPO_CTA'
      FixedChar = True
      Size = 1
    end
    object qryBlcLivecompSIGNO_CTA: TSmallintField
      FieldName = 'SIGNO_CTA'
      Origin = 'CATALOGO.SIGNO_CTA'
    end
    object qryBlcLivecompFECHA_ACT: TDateTimeField
      FieldName = 'FECHA_ACT'
      Origin = 'CATALOGO.FECHA_ACT'
    end
    object qryBlcLivecompBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'CATALOGO.BALANCE_ACT'
      DisplayFormat = ',0.00'
    end
    object qryBlcLivecompBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'CATALOGO.BALANCE_ANT'
      DisplayFormat = ',0.00'
    end
    object qryBlcLivecompDEBITO_ACT: TFloatField
      FieldName = 'DEBITO_ACT'
      Origin = 'CATALOGO.DEBITO_ACT'
      DisplayFormat = ',0.00'
    end
    object qryBlcLivecompCREDITO_ACT: TFloatField
      FieldName = 'CREDITO_ACT'
      Origin = 'CATALOGO.CREDITO_ACT'
      DisplayFormat = ',0.00'
    end
    object qryBlcLivecompDEBITO_TRN: TFloatField
      FieldName = 'DEBITO_TRN'
      DisplayFormat = ',0.00'
    end
    object qryBlcLivecompCREDITO_TRN: TFloatField
      FieldName = 'CREDITO_TRN'
      DisplayFormat = ',0.00'
    end
  end
end
