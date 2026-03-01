object dmTransCnt: TdmTransCnt
  OldCreateOrder = False
  Left = 697
  Top = 135
  Height = 340
  Width = 299
  object tblTransCntMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblTransCntMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TRNCNT_MASTER'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into TRNCNT_MASTER'
      
        '  (NUMERO, FECHA, TIPO_DOC, DESCRIPCION, MONTO, STATUS, IN_POR, ' +
        'FECHA_IN, '
      '   MOD_POR, FECHA_MOD)'
      'values'
      
        '  (:NUMERO, :FECHA, :TIPO_DOC, :DESCRIPCION, :MONTO, :STATUS, :I' +
        'N_POR, '
      '   :FECHA_IN, :MOD_POR, :FECHA_MOD)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA,'
      '  TIPO_DOC,'
      '  DESCRIPCION,'
      '  MONTO,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD'
      'from TRNCNT_MASTER '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select  * From TRNCNT_MASTER'
      'Where Fecha Between :fechaini and :fechafin'
      'order by numero')
    ModifySQL.Strings = (
      'update TRNCNT_MASTER'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  TIPO_DOC = :TIPO_DOC,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  MONTO = :MONTO,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_NUMERO_TRNCNT_MASTER'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 104
    Top = 32
    object tblTransCntMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TRNCNT_MASTER.NUMERO'
      Required = True
    end
    object tblTransCntMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'TRNCNT_MASTER.FECHA'
      Required = True
    end
    object tblTransCntMasterTIPO_DOC: TSmallintField
      FieldName = 'TIPO_DOC'
      Origin = 'TRNCNT_MASTER.TIPO_DOC'
      Required = True
    end
    object tblTransCntMasterDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TRNCNT_MASTER.DESCRIPCION'
      Size = 30
    end
    object tblTransCntMasterMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'TRNCNT_MASTER.MONTO'
    end
    object tblTransCntMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRNCNT_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblTransCntMasterIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TRNCNT_MASTER.IN_POR'
      Size = 12
    end
    object tblTransCntMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TRNCNT_MASTER.FECHA_IN'
    end
    object tblTransCntMasterMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'TRNCNT_MASTER.MOD_POR'
      Size = 12
    end
    object tblTransCntMasterFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'TRNCNT_MASTER.FECHA_MOD'
    end
  end
  object tblTransCntDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BeforePost = tblTransCntDetBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TRNCNT_DETALLE'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into TRNCNT_DETALLE'
      
        '  (SERIE, NUMERO, CODIGO_DEPTO, DESCRIPCION_TRN, DEBITO_TRN, CRE' +
        'DITO_TRN, '
      
        '   CUENTA1, CUENTA2, CUENTA3, STATUS_APLICADA, STATUS, IN_POR, F' +
        'ECHA_IN, '
      
        '   MOD_POR, FECHA_MOD, NUM_DOC, COD_CTA_CONCEPTO, CODIGO_CENTRO_' +
        'COSTO)'
      'values'
      
        '  (:SERIE, :NUMERO, :CODIGO_DEPTO, :DESCRIPCION_TRN, :DEBITO_TRN' +
        ', :CREDITO_TRN, '
      
        '   :CUENTA1, :CUENTA2, :CUENTA3, :STATUS_APLICADA, :STATUS, :IN_' +
        'POR, :FECHA_IN, '
      
        '   :MOD_POR, :FECHA_MOD, :NUM_DOC, :COD_CTA_CONCEPTO, :CODIGO_CE' +
        'NTRO_COSTO)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  CODIGO_DEPTO,'
      '  DESCRIPCION_TRN,'
      '  DEBITO_TRN,'
      '  CREDITO_TRN,'
      '  CUENTA1,'
      '  CUENTA2,'
      '  CUENTA3,'
      '  STATUS_APLICADA,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD,'
      '  NUM_DOC,'
      '  COD_CTA_CONCEPTO,'
      '  CODIGO_CENTRO_COSTO'
      'from TRNCNT_DETALLE '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select * from TRNCNT_DETALLE'
      'Where numero=:numero'
      'ORDER BY SERIE, NUMERO')
    ModifySQL.Strings = (
      'update TRNCNT_DETALLE'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  CODIGO_DEPTO = :CODIGO_DEPTO,'
      '  DESCRIPCION_TRN = :DESCRIPCION_TRN,'
      '  DEBITO_TRN = :DEBITO_TRN,'
      '  CREDITO_TRN = :CREDITO_TRN,'
      '  CUENTA1 = :CUENTA1,'
      '  CUENTA2 = :CUENTA2,'
      '  CUENTA3 = :CUENTA3,'
      '  STATUS_APLICADA = :STATUS_APLICADA,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  NUM_DOC = :NUM_DOC,'
      '  COD_CTA_CONCEPTO = :COD_CTA_CONCEPTO,'
      '  CODIGO_CENTRO_COSTO = :CODIGO_CENTRO_COSTO'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_NUMERO_TRNCNT_DETALLE'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 104
    Top = 88
    object tblTransCntDetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'TRNCNT_DETALLE.SERIE'
      Required = True
    end
    object tblTransCntDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TRNCNT_DETALLE.NUMERO'
      Required = True
    end
    object tblTransCntDetCODIGO_DEPTO: TIntegerField
      FieldName = 'CODIGO_DEPTO'
      Origin = 'TRNCNT_DETALLE.CODIGO_DEPTO'
      Required = True
    end
    object tblTransCntDetDESCRIPCION_TRN: TIBStringField
      FieldName = 'DESCRIPCION_TRN'
      Origin = 'TRNCNT_DETALLE.DESCRIPCION_TRN'
      Size = 40
    end
    object tblTransCntDetDEBITO_TRN: TFloatField
      FieldName = 'DEBITO_TRN'
      Origin = 'TRNCNT_DETALLE.DEBITO_TRN'
    end
    object tblTransCntDetCREDITO_TRN: TFloatField
      FieldName = 'CREDITO_TRN'
      Origin = 'TRNCNT_DETALLE.CREDITO_TRN'
    end
    object tblTransCntDetCUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Origin = 'TRNCNT_DETALLE.CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object tblTransCntDetCUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Origin = 'TRNCNT_DETALLE.CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object tblTransCntDetCUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Origin = 'TRNCNT_DETALLE.CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
    object tblTransCntDetSTATUS_APLICADA: TIBStringField
      FieldName = 'STATUS_APLICADA'
      Origin = 'TRNCNT_DETALLE.STATUS_APLICADA'
      FixedChar = True
      Size = 1
    end
    object tblTransCntDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRNCNT_DETALLE.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblTransCntDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TRNCNT_DETALLE.IN_POR'
      Size = 12
    end
    object tblTransCntDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TRNCNT_DETALLE.FECHA_IN'
    end
    object tblTransCntDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'TRNCNT_DETALLE.MOD_POR'
      Size = 12
    end
    object tblTransCntDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'TRNCNT_DETALLE.FECHA_MOD'
    end
    object tblTransCntDetNUM_DOC: TFloatField
      FieldName = 'NUM_DOC'
      Origin = 'TRNCNT_DETALLE.NUM_DOC'
    end
    object tblTransCntDetCOD_CTA_CONCEPTO: TIntegerField
      FieldName = 'COD_CTA_CONCEPTO'
      Origin = 'TRNCNT_DETALLE.COD_CTA_CONCEPTO'
    end
    object tblTransCntDetCODIGO_CENTRO_COSTO: TIntegerField
      FieldName = 'CODIGO_CENTRO_COSTO'
      Origin = 'TRNCNT_DETALLE.CODIGO_CENTRO_COSTO'
    end
  end
  object tblDeptos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM DEPTOS'
      'ORDER BY NOMBRE')
    Left = 104
    Top = 136
    object tblDeptosCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'DEPTOS.CODIGO'
      Required = True
    end
    object tblDeptosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'DEPTOS.NOMBRE'
      Size = 40
    end
  end
  object tblCentroDeCosto: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CENTRO_DE_COSTO'
      'ORDER BY DESCRIPCION')
    Left = 104
    Top = 184
    object tblCentroDeCostoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CENTRO_DE_COSTO.CODIGO'
      Required = True
    end
    object tblCentroDeCostoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'CENTRO_DE_COSTO.DESCRIPCION'
      Size = 30
    end
  end
  object tblTipodoc: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  * from DOC_TRAN_CXT'
      'order by descripcion')
    Left = 104
    Top = 232
    object tblTipodocCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'DOC_TRAN_CXT.CODIGO'
      Required = True
    end
    object tblTipodocCODIGO_ABR: TIBStringField
      FieldName = 'CODIGO_ABR'
      Origin = 'DOC_TRAN_CXT.CODIGO_ABR'
      FixedChar = True
      Size = 6
    end
    object tblTipodocDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DOC_TRAN_CXT.DESCRIPCION'
      Size = 30
    end
  end
  object ibsqlUpdateStatusContrato: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'update :nombretabla'
      'set status_cnt = "R"'
      'where numero = :numero')
    Transaction = dmConectar.IBTransaction1
    Left = 200
    Top = 152
  end
end
