object dmCxp: TdmCxp
  OldCreateOrder = False
  Left = 547
  Top = 123
  Height = 482
  Width = 396
  object tblTransCxp: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TRANS_CXP'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  TIPO_DOC = :OLD_TIPO_DOC')
    InsertSQL.Strings = (
      'insert into TRANS_CXP'
      
        '  (SERIE, TIPO_DOC, MONEDA, FECHA, NUMERO_DOC, CODIGO_CLIENTE, C' +
        'ODIGO_SERV, '
      
        '   CONCEPTO, VALOR_DOCUMENTO, TIPO_TRANF, STATUS, TIPO_SERV, FEC' +
        'HA_IN, '
      '   IN_POR, FECHA_MOD, MOD_POR)'
      'values'
      
        '  (:SERIE, :TIPO_DOC, :MONEDA, :FECHA, :NUMERO_DOC, :CODIGO_CLIE' +
        'NTE, :CODIGO_SERV, '
      
        '   :CONCEPTO, :VALOR_DOCUMENTO, :TIPO_TRANF, :STATUS, :TIPO_SERV' +
        ', :FECHA_IN, '
      '   :IN_POR, :FECHA_MOD, :MOD_POR)')
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
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from TRANS_CXP '
      'where'
      '  SERIE = :SERIE and'
      '  TIPO_DOC = :TIPO_DOC')
    SelectSQL.Strings = (
      'Select *  From TRANS_CXP'
      'Where fecha between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update TRANS_CXP'
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
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  TIPO_DOC = :OLD_TIPO_DOC')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_TRN_CXP'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 128
    Top = 19
    object tblTransCxpSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'TRANS_CXP.SERIE'
      Required = True
    end
    object tblTransCxpTIPO_DOC: TIntegerField
      FieldName = 'TIPO_DOC'
      Origin = 'TRANS_CXP.TIPO_DOC'
      Required = True
    end
    object tblTransCxpMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'TRANS_CXP.MONEDA'
      FixedChar = True
      Size = 1
    end
    object tblTransCxpFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'TRANS_CXP.FECHA'
    end
    object tblTransCxpNUMERO_DOC: TIntegerField
      FieldName = 'NUMERO_DOC'
      Origin = 'TRANS_CXP.NUMERO_DOC'
    end
    object tblTransCxpCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'TRANS_CXP.CODIGO_CLIENTE'
    end
    object tblTransCxpCODIGO_SERV: TIntegerField
      FieldName = 'CODIGO_SERV'
      Origin = 'TRANS_CXP.CODIGO_SERV'
    end
    object tblTransCxpCONCEPTO: TIBStringField
      FieldName = 'CONCEPTO'
      Origin = 'TRANS_CXP.CONCEPTO'
      Size = 60
    end
    object tblTransCxpVALOR_DOCUMENTO: TFloatField
      FieldName = 'VALOR_DOCUMENTO'
      Origin = 'TRANS_CXP.VALOR_DOCUMENTO'
    end
    object tblTransCxpTIPO_TRANF: TSmallintField
      FieldName = 'TIPO_TRANF'
      Origin = 'TRANS_CXP.TIPO_TRANF'
    end
    object tblTransCxpSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRANS_CXP.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblTransCxpTIPO_SERV: TIntegerField
      FieldName = 'TIPO_SERV'
      Origin = 'TRANS_CXP.TIPO_SERV'
    end
    object tblTransCxpFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TRANS_CXP.FECHA_IN'
    end
    object tblTransCxpIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TRANS_CXP.IN_POR'
      Size = 12
    end
    object tblTransCxpFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'TRANS_CXP.FECHA_MOD'
    end
    object tblTransCxpMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'TRANS_CXP.MOD_POR'
      Size = 12
    end
  end
  object stpInsFactPendiente: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INSFACTURAS_PEND'
    Left = 44
    Top = 73
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO_PROV'
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
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_FACT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_PENDIENTE'
        ParamType = ptInput
      end>
  end
  object qryBceProvee: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From BALANCE_PROVEEDORES'
      'ORDER BY CODIGO_TIPOCXP, CODIGO')
    Left = 133
    Top = 72
  end
  object qryRepblcCtesHist: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'CODIGO, '
      'CODIGO_TIPOCXP,'
      'MONEDA,'
      'fecha_historico, '
      'BALANCE_ANT, '
      'DEBITO_MES, '
      'CREDITO_MES,'
      'BALANCE_ACT '
      ''
      'FROM BLCE_PROV_HISTORICO'
      'WHERE FECHA_historico between  :FECHAini and :fechafin'
      'and (BALANCE_ANT <> 0 '
      'or  DEBITO_MES <> 0'
      'or CREDITO_MES <> 0'
      'or BALANCE_ACT <> 0 )'
      'ORDER BY CODIGO_TIPOCXP,CODIGO')
    Left = 128
    Top = 128
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
  end
  object qryTrnCxp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TRANS_CXP'
      'where fecha between :fechaini and :fechafin')
    Left = 44
    Top = 127
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
  object qryProvCxp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT '
      'Trans_cxp.MONEDA, '
      'Trans_cxp.FECHA, '
      'Trans_cxp.CODIGO_CLIENTE, '
      'Trans_cxp.TIPO_TRANF, '
      'Trans_cxp.TIPO_DOC, '
      'Doc_tran_cxt.DESCRIPCION DESC_DOC, '
      'Proveedores.DESCRIPCION NOMBRECLTE, '
      'Sum(Trans_cxp.VALOR_DOCUMENTO) Valor_documento, '
      'Trans_cxp.NUMERO_DOC'
      'FROM TRANS_CXP Trans_cxp'
      '   INNER JOIN Doc_tran_cxt Doc_tran_cxt'
      '   ON  (Trans_cxp.TIPO_DOC = Doc_tran_cxt.CODIGO)  '
      '   INNER JOIN PROVEEDORES Proveedores'
      '   ON  (Trans_cxp.CODIGO_CLIENTE = Proveedores.CODIGO_cte)  '
      'WHERE   Trans_cxp.STATUS NOT IN ('#39'C'#39') '
      '   AND  Trans_cxp.FECHA between :fechaini and :fechafin'
      'GROUP BY Trans_cxp.MONEDA, '
      'Trans_cxp.FECHA, '
      'Trans_cxp.CODIGO_CLIENTE, '
      'Trans_cxp.TIPO_TRANF, '
      'Trans_cxp.TIPO_DOC, '
      'Doc_tran_cxt.DESCRIPCION, '
      'Proveedores.DESCRIPCION, '
      'Trans_cxp.VALOR_DOCUMENTO,'
      'Trans_cxp.NUMERO_DOC')
    Left = 43
    Top = 19
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
  object qrySQLBlceAntCxPCte: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM PROC_BALANCE_CXP ('
      '  :CODIGOCTEINI,  :CODIGOCTEFIN,'
      '  :FECHAINI,  :FECHAFIN,  :MONEDA,'
      '  :FECHA_BLC_ANTERIOR )')
    Transaction = dmConectar.IBTransaction1
    Left = 48
    Top = 233
  end
  object qryRepServ: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select * From PROC_ESTADO_CTA_CXP (:fechaini,:fechafin,:codigo_c' +
        'te)'
      'Order By CODIGO_CTE, FECHA_DET, NUM_FACT_DET')
    Left = 47
    Top = 186
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
        Value = '2005-12-15'
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
        Value = '2009-12-18'
      end
      item
        DataType = ftInteger
        Name = 'codigo_cte'
        ParamType = ptInput
        Value = '66'
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
    object qryRepServNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'PROC_SERV.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryRepServNOMBRE_CLIENTE_DET: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_DET'
      Origin = 'PROC_SERV.NOMBRE_CLIENTE_DET'
      Size = 40
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
    object qryRepServAREA: TIBStringField
      FieldName = 'AREA'
      Origin = 'PROC_SERV.AREA'
    end
    object qryRepServORIGEN: TIntegerField
      FieldName = 'ORIGEN'
      Origin = 'PROC_SERV.ORIGEN'
    end
    object qryRepServVALOR_INGRESO_RECIBO: TFloatField
      FieldName = 'VALOR_INGRESO_RECIBO'
      Origin = 'PROC_SERV.VALOR_INGRESO_RECIBO'
    end
    object qryRepServDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'PROC_SERV.DIRECCION_CONT'
      Size = 60
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
  end
  object qryBceHistoricocxp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   '
      '  CODIGO ,'
      '  TIPO  ,  '
      '  FECHA_HISTORICO,'
      '  MONEDA,'
      '  BALANCE_ACT,'
      '  BALANCE_ANT,'
      '  DEBITO_MES,'
      '  CREDITO_MES,'
      '  DEBITO_ACM,'
      '  CREDITO_ACM,'
      '  STATUS'
      'FROM PROC_HISTBCECXP(:ACTUAL)'
      'WHERE FECHA_HISTORICO BETWEEN :FECHAINI AND :FECHAFIN'
      '      AND MONEDA = :MONEDA'
      '      AND CODIGO between :codigoini And :codigofin'
      'ORDER BY TIPO,FECHA_HISTORICO, CODIGO ')
    Left = 133
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
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
  end
  object qryPagosCxp: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PAGOS_CXP_MASTER'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into PAGOS_CXP_MASTER'
      
        '  (SERIE, TIPO, NUMERO, MONEDA, FECHA, VALOR_ING, TIPO_ING, NOMB' +
        'RE_CTE, '
      
        '   CODIGO_CTE, COD_SERVICIO, FORMA_PAGO, DOCUMENTO, TIPO_TARGETA' +
        ', STATUS_TARGETA, '
      
        '   CONCEPTO, STATUS, OBSERVACION, COD_LINEA, FECHA_IN, IN_POR, F' +
        'ECHA_MOD, '
      '   MOD_POR, NUM_CHEQ_COMP, COD_BANCO)'
      'values'
      
        '  (:SERIE, :TIPO, :NUMERO, :MONEDA, :FECHA, :VALOR_ING, :TIPO_IN' +
        'G, :NOMBRE_CTE, '
      
        '   :CODIGO_CTE, :COD_SERVICIO, :FORMA_PAGO, :DOCUMENTO, :TIPO_TA' +
        'RGETA, '
      
        '   :STATUS_TARGETA, :CONCEPTO, :STATUS, :OBSERVACION, :COD_LINEA' +
        ', :FECHA_IN, '
      '   :IN_POR, :FECHA_MOD, :MOD_POR, :NUM_CHEQ_COMP, :COD_BANCO)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  TIPO,'
      '  NUMERO,'
      '  MONEDA,'
      '  FECHA,'
      '  VALOR_ING,'
      '  TIPO_ING,'
      '  NOMBRE_CTE,'
      '  CODIGO_CTE,'
      '  COD_SERVICIO,'
      '  FORMA_PAGO,'
      '  DOCUMENTO,'
      '  TIPO_TARGETA,'
      '  STATUS_TARGETA,'
      '  CONCEPTO,'
      '  STATUS,'
      '  OBSERVACION,'
      '  COD_LINEA,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  NUM_CHEQ_COMP,'
      '  COD_BANCO'
      'from PAGOS_CXP_MASTER '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * From PAGOS_CXP_MASTER'
      'Where fecha Between :fechaini And :fechafin')
    ModifySQL.Strings = (
      'update PAGOS_CXP_MASTER'
      'set'
      '  SERIE = :SERIE,'
      '  TIPO = :TIPO,'
      '  NUMERO = :NUMERO,'
      '  MONEDA = :MONEDA,'
      '  FECHA = :FECHA,'
      '  VALOR_ING = :VALOR_ING,'
      '  TIPO_ING = :TIPO_ING,'
      '  NOMBRE_CTE = :NOMBRE_CTE,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  COD_SERVICIO = :COD_SERVICIO,'
      '  FORMA_PAGO = :FORMA_PAGO,'
      '  DOCUMENTO = :DOCUMENTO,'
      '  TIPO_TARGETA = :TIPO_TARGETA,'
      '  STATUS_TARGETA = :STATUS_TARGETA,'
      '  CONCEPTO = :CONCEPTO,'
      '  STATUS = :STATUS,'
      '  OBSERVACION = :OBSERVACION,'
      '  COD_LINEA = :COD_LINEA,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  NUM_CHEQ_COMP = :NUM_CHEQ_COMP,'
      '  COD_BANCO = :COD_BANCO'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 218
    Top = 19
    object qryPagosCxpSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'PAGOS_CXP_MASTER.SERIE'
      Required = True
    end
    object qryPagosCxpTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'PAGOS_CXP_MASTER.TIPO'
      Required = True
    end
    object qryPagosCxpNUMERO: TFloatField
      FieldName = 'NUMERO'
      Origin = 'PAGOS_CXP_MASTER.NUMERO'
      Required = True
    end
    object qryPagosCxpMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'PAGOS_CXP_MASTER.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryPagosCxpFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PAGOS_CXP_MASTER.FECHA'
    end
    object qryPagosCxpVALOR_ING: TFloatField
      FieldName = 'VALOR_ING'
      Origin = 'PAGOS_CXP_MASTER.VALOR_ING'
    end
    object qryPagosCxpTIPO_ING: TSmallintField
      FieldName = 'TIPO_ING'
      Origin = 'PAGOS_CXP_MASTER.TIPO_ING'
    end
    object qryPagosCxpNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'PAGOS_CXP_MASTER.NOMBRE_CTE'
      Size = 40
    end
    object qryPagosCxpCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PAGOS_CXP_MASTER.CODIGO_CTE'
    end
    object qryPagosCxpCOD_SERVICIO: TIntegerField
      FieldName = 'COD_SERVICIO'
      Origin = 'PAGOS_CXP_MASTER.COD_SERVICIO'
    end
    object qryPagosCxpFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'PAGOS_CXP_MASTER.FORMA_PAGO'
    end
    object qryPagosCxpDOCUMENTO: TIBStringField
      FieldName = 'DOCUMENTO'
      Origin = 'PAGOS_CXP_MASTER.DOCUMENTO'
    end
    object qryPagosCxpTIPO_TARGETA: TSmallintField
      FieldName = 'TIPO_TARGETA'
      Origin = 'PAGOS_CXP_MASTER.TIPO_TARGETA'
    end
    object qryPagosCxpSTATUS_TARGETA: TIBStringField
      FieldName = 'STATUS_TARGETA'
      Origin = 'PAGOS_CXP_MASTER.STATUS_TARGETA'
      FixedChar = True
      Size = 1
    end
    object qryPagosCxpCONCEPTO: TIBStringField
      FieldName = 'CONCEPTO'
      Origin = 'PAGOS_CXP_MASTER.CONCEPTO'
      Size = 40
    end
    object qryPagosCxpSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PAGOS_CXP_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryPagosCxpOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'PAGOS_CXP_MASTER.OBSERVACION'
      Size = 40
    end
    object qryPagosCxpCOD_LINEA: TIBStringField
      FieldName = 'COD_LINEA'
      Origin = 'PAGOS_CXP_MASTER.COD_LINEA'
      FixedChar = True
      Size = 6
    end
    object qryPagosCxpFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PAGOS_CXP_MASTER.FECHA_IN'
    end
    object qryPagosCxpIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PAGOS_CXP_MASTER.IN_POR'
      Size = 12
    end
    object qryPagosCxpFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PAGOS_CXP_MASTER.FECHA_MOD'
    end
    object qryPagosCxpMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PAGOS_CXP_MASTER.MOD_POR'
      Size = 12
    end
    object qryPagosCxpNUM_CHEQ_COMP: TIBStringField
      FieldName = 'NUM_CHEQ_COMP'
      Origin = 'PAGOS_CXP_MASTER.NUM_CHEQ_COMP'
    end
    object qryPagosCxpCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Origin = 'PAGOS_CXP_MASTER.COD_BANCO'
    end
  end
  object qryPagoCxpDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PAGOS_CXP_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into PAGOS_CXP_DET'
      
        '  (SERIE, SERIE_MASTER, NUMERO_ING, COD_SERVICIO, COD_DEPARTAMEN' +
        'TO, DETALLE, '
      
        '   VALOR_DET, STATUS, VALOR_IMPUESTO, PORC_DESCUENTO, FECHA_IN, ' +
        'IN_POR, '
      
        '   FECHA_MOD, MOD_POR, TIPO_TARJETA, NUMERO_TARJETA_CRED, ANO_VE' +
        'NCE, MES_VENCE, '
      
        '   MONTOAUTORIZADO, NUMERO_APROBACION, TIPO, CODIGO_PROVEEDOR, F' +
        'CTING_SERIE)'
      'values'
      
        '  (:SERIE, :SERIE_MASTER, :NUMERO_ING, :COD_SERVICIO, :COD_DEPAR' +
        'TAMENTO, '
      
        '   :DETALLE, :VALOR_DET, :STATUS, :VALOR_IMPUESTO, :PORC_DESCUEN' +
        'TO, :FECHA_IN, '
      
        '   :IN_POR, :FECHA_MOD, :MOD_POR, :TIPO_TARJETA, :NUMERO_TARJETA' +
        '_CRED, '
      
        '   :ANO_VENCE, :MES_VENCE, :MONTOAUTORIZADO, :NUMERO_APROBACION,' +
        ' :TIPO, '
      '   :CODIGO_PROVEEDOR, :FCTING_SERIE)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  SERIE_MASTER,'
      '  NUMERO_ING,'
      '  COD_SERVICIO,'
      '  COD_DEPARTAMENTO,'
      '  DETALLE,'
      '  VALOR_DET,'
      '  STATUS,'
      '  VALOR_IMPUESTO,'
      '  PORC_DESCUENTO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  TIPO_TARJETA,'
      '  NUMERO_TARJETA_CRED,'
      '  ANO_VENCE,'
      '  MES_VENCE,'
      '  MONTOAUTORIZADO,'
      '  NUMERO_APROBACION,'
      '  TIPO,'
      '  CODIGO_PROVEEDOR,'
      '  FCTING_SERIE'
      'from PAGOS_CXP_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select  * From PAGOS_CXP_DET'
      'Where  serie_master =:seriemaster')
    ModifySQL.Strings = (
      'update PAGOS_CXP_DET'
      'set'
      '  SERIE = :SERIE,'
      '  SERIE_MASTER = :SERIE_MASTER,'
      '  NUMERO_ING = :NUMERO_ING,'
      '  COD_SERVICIO = :COD_SERVICIO,'
      '  COD_DEPARTAMENTO = :COD_DEPARTAMENTO,'
      '  DETALLE = :DETALLE,'
      '  VALOR_DET = :VALOR_DET,'
      '  STATUS = :STATUS,'
      '  VALOR_IMPUESTO = :VALOR_IMPUESTO,'
      '  PORC_DESCUENTO = :PORC_DESCUENTO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  TIPO_TARJETA = :TIPO_TARJETA,'
      '  NUMERO_TARJETA_CRED = :NUMERO_TARJETA_CRED,'
      '  ANO_VENCE = :ANO_VENCE,'
      '  MES_VENCE = :MES_VENCE,'
      '  MONTOAUTORIZADO = :MONTOAUTORIZADO,'
      '  NUMERO_APROBACION = :NUMERO_APROBACION,'
      '  TIPO = :TIPO,'
      '  CODIGO_PROVEEDOR = :CODIGO_PROVEEDOR,'
      '  FCTING_SERIE = :FCTING_SERIE'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 219
    Top = 72
    object qryPagoCxpDetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'PAGOS_CXP_DET.SERIE'
      Required = True
    end
    object qryPagoCxpDetSERIE_MASTER: TIntegerField
      FieldName = 'SERIE_MASTER'
      Origin = 'PAGOS_CXP_DET.SERIE_MASTER'
      Required = True
    end
    object qryPagoCxpDetNUMERO_ING: TIntegerField
      FieldName = 'NUMERO_ING'
      Origin = 'PAGOS_CXP_DET.NUMERO_ING'
      Required = True
    end
    object qryPagoCxpDetCOD_SERVICIO: TIntegerField
      FieldName = 'COD_SERVICIO'
      Origin = 'PAGOS_CXP_DET.COD_SERVICIO'
    end
    object qryPagoCxpDetCOD_DEPARTAMENTO: TIBStringField
      FieldName = 'COD_DEPARTAMENTO'
      Origin = 'PAGOS_CXP_DET.COD_DEPARTAMENTO'
      Size = 12
    end
    object qryPagoCxpDetDETALLE: TIBStringField
      FieldName = 'DETALLE'
      Origin = 'PAGOS_CXP_DET.DETALLE'
      Size = 40
    end
    object qryPagoCxpDetVALOR_DET: TFloatField
      FieldName = 'VALOR_DET'
      Origin = 'PAGOS_CXP_DET.VALOR_DET'
    end
    object qryPagoCxpDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PAGOS_CXP_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryPagoCxpDetVALOR_IMPUESTO: TFloatField
      FieldName = 'VALOR_IMPUESTO'
      Origin = 'PAGOS_CXP_DET.VALOR_IMPUESTO'
    end
    object qryPagoCxpDetPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'PAGOS_CXP_DET.PORC_DESCUENTO'
    end
    object qryPagoCxpDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PAGOS_CXP_DET.FECHA_IN'
    end
    object qryPagoCxpDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PAGOS_CXP_DET.IN_POR'
      Size = 12
    end
    object qryPagoCxpDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PAGOS_CXP_DET.FECHA_MOD'
    end
    object qryPagoCxpDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PAGOS_CXP_DET.MOD_POR'
      Size = 12
    end
    object qryPagoCxpDetTIPO_TARJETA: TSmallintField
      FieldName = 'TIPO_TARJETA'
      Origin = 'PAGOS_CXP_DET.TIPO_TARJETA'
    end
    object qryPagoCxpDetNUMERO_TARJETA_CRED: TIBStringField
      FieldName = 'NUMERO_TARJETA_CRED'
      Origin = 'PAGOS_CXP_DET.NUMERO_TARJETA_CRED'
      Size = 14
    end
    object qryPagoCxpDetANO_VENCE: TIntegerField
      FieldName = 'ANO_VENCE'
      Origin = 'PAGOS_CXP_DET.ANO_VENCE'
    end
    object qryPagoCxpDetMES_VENCE: TSmallintField
      FieldName = 'MES_VENCE'
      Origin = 'PAGOS_CXP_DET.MES_VENCE'
    end
    object qryPagoCxpDetMONTOAUTORIZADO: TFloatField
      FieldName = 'MONTOAUTORIZADO'
      Origin = 'PAGOS_CXP_DET.MONTOAUTORIZADO'
    end
    object qryPagoCxpDetNUMERO_APROBACION: TIBStringField
      FieldName = 'NUMERO_APROBACION'
      Origin = 'PAGOS_CXP_DET.NUMERO_APROBACION'
      FixedChar = True
      Size = 15
    end
    object qryPagoCxpDetTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'PAGOS_CXP_DET.TIPO'
    end
    object qryPagoCxpDetCODIGO_PROVEEDOR: TSmallintField
      FieldName = 'CODIGO_PROVEEDOR'
      Origin = 'PAGOS_CXP_DET.CODIGO_PROVEEDOR'
    end
    object qryPagoCxpDetFCTING_SERIE: TIntegerField
      FieldName = 'FCTING_SERIE'
      Origin = 'PAGOS_CXP_DET.FCTING_SERIE'
    end
  end
  object qryRepPgoDetalle: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT PAGOS_CXP_DET.NUMERO_ING,'
      '                PAGOS_CXP_DET.DETALLE,'
      '                PAGOS_CXP_DET.VALOR_IMPUESTO,'
      '                PAGOS_CXP_DET.PORC_DESCUENTO,'
      '                PAGOS_CXP_DET.TIPO_TARJETA,'
      '                PAGOS_CXP_DET.NUMERO_TARJETA_CRED,'
      '                PAGOS_CXP_DET.ANO_VENCE,'
      '                PAGOS_CXP_DET.MES_VENCE,'
      '                PAGOS_CXP_DET.MONTOAUTORIZADO,'
      '                PAGOS_CXP_DET.NUMERO_APROBACION,'
      '                PAGOS_CXP_DET.TIPO AS DESCTIPOPAGOTARJETA,'
      '                PAGOS_CXP_DET.CODIGO_PROVEEDOR,'
      '                NULL DESCTARJETA,'
      '                NULL DESCPROVEEDORTARJETA,'
      '                FCTPAGOSCXCP.NUMERO,'
      '                FCTPAGOSCXCP.NUMERO_FACT,'
      '                FCTPAGOSCXCP.MONTO_FACT'
      'FROM FCTPAGOSCXCP'
      
        '   RIGHT OUTER JOIN PAGOS_CXP_DET ON (FCTPAGOSCXCP.SERIE = PAGOS' +
        '_CXP_DET.FCTING_SERIE)'
      'Where PAGOS_CXP_DET.NUMERO_ING =:NUMERO')
    Left = 208
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end>
    object qryRepPgoDetalleNUMERO_ING: TIntegerField
      FieldName = 'NUMERO_ING'
      Origin = 'INGRESOS_DET.NUMERO_ING'
      Required = True
    end
    object qryRepPgoDetalleDETALLE: TIBStringField
      FieldName = 'DETALLE'
      Origin = 'INGRESOS_DET.DETALLE'
      Size = 40
    end
    object qryRepPgoDetalleVALOR_IMPUESTO: TFloatField
      FieldName = 'VALOR_IMPUESTO'
      Origin = 'INGRESOS_DET.VALOR_IMPUESTO'
    end
    object qryRepPgoDetallePORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'INGRESOS_DET.PORC_DESCUENTO'
    end
    object qryRepPgoDetalleTIPO_TARJETA: TSmallintField
      FieldName = 'TIPO_TARJETA'
      Origin = 'INGRESOS_DET.TIPO_TARJETA'
    end
    object qryRepPgoDetalleNUMERO_TARJETA_CRED: TIBStringField
      FieldName = 'NUMERO_TARJETA_CRED'
      Origin = 'INGRESOS_DET.NUMERO_TARJETA_CRED'
      Size = 14
    end
    object qryRepPgoDetalleANO_VENCE: TIntegerField
      FieldName = 'ANO_VENCE'
      Origin = 'INGRESOS_DET.ANO_VENCE'
    end
    object qryRepPgoDetalleMES_VENCE: TSmallintField
      FieldName = 'MES_VENCE'
      Origin = 'INGRESOS_DET.MES_VENCE'
    end
    object qryRepPgoDetalleMONTOAUTORIZADO: TFloatField
      FieldName = 'MONTOAUTORIZADO'
      Origin = 'INGRESOS_DET.MONTOAUTORIZADO'
    end
    object qryRepPgoDetalleNUMERO_APROBACION: TIBStringField
      FieldName = 'NUMERO_APROBACION'
      Origin = 'INGRESOS_DET.NUMERO_APROBACION'
      FixedChar = True
      Size = 15
    end
    object qryRepPgoDetalleDESCTIPOPAGOTARJETA: TSmallintField
      FieldName = 'DESCTIPOPAGOTARJETA'
      Origin = 'INGRESOS_DET.TIPO'
    end
    object qryRepPgoDetalleCODIGO_PROVEEDOR: TSmallintField
      FieldName = 'CODIGO_PROVEEDOR'
      Origin = 'INGRESOS_DET.CODIGO_PROVEEDOR'
    end
    object qryRepPgoDetalleDESCTARJETA: TIBStringField
      FieldName = 'DESCTARJETA'
      Origin = 'TARJETA.DESCRIPCION'
      Size = 30
    end
    object qryRepPgoDetalleDESCPROVEEDORTARJETA: TIBStringField
      FieldName = 'DESCPROVEEDORTARJETA'
      Origin = 'PROVEEDOR_COBRO_TARJETA.DESCRIPCION'
      Size = 30
    end
    object qryRepPgoDetalleMontoCldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MontoCldo'
      Calculated = True
    end
    object qryRepPgoDetalleNUMERO: TFloatField
      FieldName = 'NUMERO'
      Origin = 'FCTINGRESOS.NUMERO'
    end
    object qryRepPgoDetalleNUMERO_FACT: TFloatField
      FieldName = 'NUMERO_FACT'
      Origin = 'FCTINGRESOS.NUMERO_FACT'
    end
    object qryRepPgoDetalleMONTO_FACT: TFloatField
      FieldName = 'MONTO_FACT'
      Origin = 'FCTINGRESOS.MONTO_FACT'
    end
  end
  object qryRepPgoMaster: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepPgoMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT PAGOS_CXP_MASTER.NUMERO,'
      '       PAGOS_CXP_MASTER.CODIGO_CTE,'
      '       MONEDA.DESCRIPCION AS DESC_MONEDA,'
      '       TIPO_PAGO.DESCRIPCION AS FORMA_DE_PAGO,'
      '       PAGOS_CXP_MASTER.FORMA_PAGO,'
      '       PAGOS_CXP_MASTER.COD_BANCO,'
      '       PAGOS_CXP_MASTER.NUM_CHEQ_COMP,'
      '       PROVEEDORES.DESCRIPCION AS NOMBRE_CTE,'
      '       PROVEEDORES.DESCRIPCION AS NOMBRE_EMPRESA,'
      '       PAGOS_CXP_MASTER.FECHA,'
      '       MONEDA.SIMBOLO AS SIMBOLO_MONEDA,'
      '       PROVEEDORES.CALYYNUM AS DIRECCION_LOCAL,'
      '       PROVEEDORES.TELEFONO AS TELEFONO_LOCAL,'
      '       NULL AS TELEF_CONTACTO,'
      '       BANCOS.CODIGO_ABR DESC_BANCO'
      ''
      'FROM TIPO_PAGO'
      
        '   RIGHT OUTER JOIN PAGOS_CXP_MASTER ON (TIPO_PAGO.CODIGO = PAGO' +
        'S_CXP_MASTER.FORMA_PAGO)'
      
        '   LEFT OUTER JOIN BANCOS ON (PAGOS_CXP_MASTER.COD_BANCO = BANCO' +
        'S.CODIGO)'
      
        '   INNER JOIN MONEDA ON (PAGOS_CXP_MASTER.MONEDA = MONEDA.CODIGO' +
        ')'
      
        '   INNER JOIN PROVEEDORES ON (PAGOS_CXP_MASTER.CODIGO_CTE = PROV' +
        'EEDORES.CODIGO_CTE)'
      ''
      'Where PAGOS_CXP_MASTER.Numero =:NUMERO')
    Left = 220
    Top = 127
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Numero'
        ParamType = ptInput
        Value = '11'
      end>
    object qryRepPgoMasterNUMERO: TFloatField
      FieldName = 'NUMERO'
      Origin = 'INGRESOS.NUMERO'
      Required = True
    end
    object qryRepPgoMasterNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'INGRESOS.NOMBRE_CTE'
      Size = 40
    end
    object qryRepPgoMasterCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'INGRESOS.CODIGO_CTE'
    end
    object qryRepPgoMasterDESC_MONEDA: TIBStringField
      FieldName = 'DESC_MONEDA'
      Origin = 'MONEDA.DESCRIPCION'
      FixedChar = True
      Size = 15
    end
    object qryRepPgoMasterFORMA_DE_PAGO: TIBStringField
      FieldName = 'FORMA_DE_PAGO'
      Origin = 'TIPO_PAGO.DESCRIPCION'
      FixedChar = True
      Size = 15
    end
    object qryRepPgoMasterFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'INGRESOS.FORMA_PAGO'
    end
    object qryRepPgoMasterNOMBRE_EMPRESA: TIBStringField
      FieldName = 'NOMBRE_EMPRESA'
      Origin = 'CLIENTES.NOMBRE_EMPRESA'
      Size = 40
    end
    object qryRepPgoMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'INGRESOS.FECHA'
    end
    object qryRepPgoMasterSIMBOLO_MONEDA: TIBStringField
      FieldName = 'SIMBOLO_MONEDA'
      Origin = 'MONEDA.SIMBOLO'
      FixedChar = True
      Size = 6
    end
    object qryRepPgoMasterNOMBRECLIENTECLD: TIBStringField
      FieldKind = fkCalculated
      FieldName = 'NOMBRECLIENTECLD'
      Calculated = True
    end
    object qryRepPgoMasterDIRECCION_LOCAL: TIBStringField
      FieldName = 'DIRECCION_LOCAL'
      Origin = 'CLIENTES.DIRECCION_LOCAL'
      Size = 60
    end
    object qryRepPgoMasterTELEFONO_LOCAL: TIBStringField
      FieldName = 'TELEFONO_LOCAL'
      Origin = 'CLIENTES.TELEFONO_LOCAL'
    end
    object qryRepPgoMasterTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
    end
    object qryRepPgoMasterCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Origin = 'PAGOS_CXP_MASTER.COD_BANCO'
    end
    object qryRepPgoMasterNUM_CHEQ_COMP: TIBStringField
      FieldName = 'NUM_CHEQ_COMP'
      Origin = 'PAGOS_CXP_MASTER.NUM_CHEQ_COMP'
    end
    object qryRepPgoMasterDESC_BANCO: TIBStringField
      FieldName = 'DESC_BANCO'
      Origin = 'BANCOS.CODIGO_ABR'
      Size = 12
    end
  end
  object qryBalanceProveedor: TIBDataSet
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
      '  b.tipo,'
      '  b.MONEDA,'
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
      'From Balance_cxp b'
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
    Left = 49
    Top = 285
    object qryBalanceProveedorNombreCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCliente'
      LookupDataSet = qryproveedor
      LookupKeyFields = 'CODIGO_CTE'
      LookupResultField = 'NOMBRE_EMPRESA'
      KeyFields = 'CODIGO'
      Lookup = True
    end
    object qryBalanceProveedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'BALANCE_CXP.CODIGO'
      Required = True
    end
    object qryBalanceProveedorTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'BALANCE_CXP.TIPO'
      Required = True
    end
    object qryBalanceProveedorMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'BALANCE_CXP.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryBalanceProveedorBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'BALANCE_CXP.BALANCE_ACT'
    end
    object qryBalanceProveedorBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'BALANCE_CXP.BALANCE_ANT'
    end
    object qryBalanceProveedorDEBITO_MES: TFloatField
      FieldName = 'DEBITO_MES'
      Origin = 'BALANCE_CXP.DEBITO_MES'
    end
    object qryBalanceProveedorCREDITO_MES: TFloatField
      FieldName = 'CREDITO_MES'
      Origin = 'BALANCE_CXP.CREDITO_MES'
    end
    object qryBalanceProveedorDEBITO_ACM: TFloatField
      FieldName = 'DEBITO_ACM'
      Origin = 'BALANCE_CXP.DEBITO_ACM'
    end
    object qryBalanceProveedorCREDITO_ACM: TFloatField
      FieldName = 'CREDITO_ACM'
      Origin = 'BALANCE_CXP.CREDITO_ACM'
    end
    object qryBalanceProveedorFECHA_BCE: TDateTimeField
      FieldName = 'FECHA_BCE'
      Origin = 'BALANCE_CXP.FECHA_BCE'
    end
    object qryBalanceProveedorFECHA_ULT_PAGO: TDateTimeField
      FieldName = 'FECHA_ULT_PAGO'
      Origin = 'BALANCE_CXP.FECHA_ULT_PAGO'
    end
    object qryBalanceProveedorSTATUS_BCE: TIBStringField
      FieldName = 'STATUS_BCE'
      Origin = 'BALANCE_CXP.STATUS_BCE'
      FixedChar = True
      Size = 1
    end
    object qryBalanceProveedorFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'BALANCE_CXP.FECHA_IN'
    end
    object qryBalanceProveedorIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'BALANCE_CXP.IN_POR'
      Size = 12
    end
    object qryBalanceProveedorFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'BALANCE_CXP.FECHA_MOD'
    end
    object qryBalanceProveedorMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'BALANCE_CXP.MOD_POR'
      Size = 12
    end
  end
  object dsqryBalanceProveedor: TDataSource
    DataSet = qryBalanceProveedor
    Left = 50
    Top = 335
  end
  object qryproveedor: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT P.CODIGO_cte, P.DESCRIPCION NOMBRE_CTE, P.DESCRIPCION NOM' +
        'BRE_EMPRESA, P.TIPO_CLIENTE'
      'FROM PROVEEDORES P')
    Left = 200
    Top = 304
    object qryproveedorCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryproveedorNOMBRE_EMPRESA: TIBStringField
      FieldName = 'NOMBRE_EMPRESA'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryproveedorTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
  end
  object tblBanco: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'BANCOS'
    Left = 136
    Top = 264
    object tblBancoCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tblBancoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 35
    end
    object tblBancoCODIGO_ABR: TIBStringField
      FieldName = 'CODIGO_ABR'
      Size = 12
    end
  end
  object dstblBanco: TDataSource
    DataSet = tblBanco
    Left = 138
    Top = 319
  end
  object qryFactPendCxp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT FACTURAS_CXP_PENDIENTES.CODIGO_PROV,'
      '       FACTURAS_CXP_PENDIENTES.FECHA,'
      '       FACTURAS_CXP_PENDIENTES.TIPO,'
      '       FACTURAS_CXP_PENDIENTES.NUMERO_FACT,'
      '       FACTURAS_CXP_PENDIENTES.MONEDA,'
      '       FACTURAS_CXP_PENDIENTES.MONTO_PENDIENTE,'
      '       FACTURAS_CXP_PENDIENTES.STATUS,'
      '       PROVEEDORES.DESCRIPCION, PROVEEDORES.TELEFONO'
      'FROM PROVEEDORES'
      '   INNER JOIN FACTURAS_CXP_PENDIENTES ON'
      
        '   (PROVEEDORES.CODIGO_CTE = FACTURAS_CXP_PENDIENTES.CODIGO_PROV' +
        ')'
      'Where FACTURAS_CXP_PENDIENTES.FECHA Between '
      ':fechaini and :fechafin'
      'and FACTURAS_CXP_PENDIENTES.CODIGO_PROV=:codProveedor'
      'order by FACTURAS_CXP_PENDIENTES.CODIGO_PROV')
    Left = 200
    Top = 352
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
        Name = 'codProveedor'
        ParamType = ptInput
      end>
    object qryFactPendCxpFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'FACTURAS_CXP_PENDIENTES.FECHA'
    end
    object qryFactPendCxpCODIGO_PROV: TIntegerField
      DisplayLabel = 'CodProv'
      FieldName = 'CODIGO_PROV'
      Origin = 'FACTURAS_CXP_PENDIENTES.CODIGO_PROV'
      Required = True
    end
    object qryFactPendCxpDESCRIPCION: TIBStringField
      DisplayLabel = 'Nombre Proveedor'
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 40
    end
    object qryFactPendCxpTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'FACTURAS_CXP_PENDIENTES.TIPO'
      Required = True
    end
    object qryFactPendCxpNUMERO_FACT: TIntegerField
      DisplayLabel = 'NumFact'
      FieldName = 'NUMERO_FACT'
      Origin = 'FACTURAS_CXP_PENDIENTES.NUMERO_FACT'
      Required = True
    end
    object qryFactPendCxpMONEDA: TIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Origin = 'FACTURAS_CXP_PENDIENTES.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryFactPendCxpMONTO_PENDIENTE: TFloatField
      DisplayLabel = 'MontoPendiente'
      FieldName = 'MONTO_PENDIENTE'
      Origin = 'FACTURAS_CXP_PENDIENTES.MONTO_PENDIENTE'
    end
    object qryFactPendCxpSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'FACTURAS_CXP_PENDIENTES.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryFactPendCxpTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
  end
  object dsqryFactPendCxp: TDataSource
    DataSet = qryFactPendCxp
    Left = 144
    Top = 384
  end
end
