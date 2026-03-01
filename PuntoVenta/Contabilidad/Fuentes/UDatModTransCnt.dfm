object dmTransCnt: TdmTransCnt
  OldCreateOrder = False
  Left = 807
  Top = 157
  Height = 556
  Width = 455
  object tblTransCntMaster: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    AfterScroll = tblTransCntMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TRNCNT_MASTER'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into TRNCNT_MASTER'
      
        '  (NUMERO, FECHA, CIA_KEY, TIPO_DOC, DESCRIPCION, MONTO, STATUS,' +
        ' IN_POR, '
      '   FECHA_IN, MOD_POR, FECHA_MOD)'
      'values'
      
        '  (:NUMERO, :FECHA, :CIA_KEY, :TIPO_DOC, :DESCRIPCION, :MONTO, :' +
        'STATUS, '
      '   :IN_POR, :FECHA_IN, :MOD_POR, :FECHA_MOD)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA,'
      '  CIA_KEY,'
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
      'select  * from TRNCNT_MASTER'
      'where fecha between :fechaini and :fechafin'
      'order by numero')
    ModifySQL.Strings = (
      'update TRNCNT_MASTER'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  CIA_KEY = :CIA_KEY,'
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
    Left = 80
    Top = 16
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
    object tblTransCntMasterCIA_KEY: TIntegerField
      DisplayLabel = 'CiaKey'
      FieldName = 'CIA_KEY'
      Origin = 'TRNCNT_MASTER.CIA_KEY'
    end
    object tblTransCntMasterTIPO_DOC: TSmallintField
      FieldName = 'TIPO_DOC'
      Origin = 'TRNCNT_MASTER.TIPO_DOC'
      Required = True
    end
    object tblTransCntMasterDESCRIPCION: TIBStringField
      DisplayWidth = 40
      FieldName = 'DESCRIPCION'
      Origin = 'TRNCNT_MASTER.DESCRIPCION'
      Size = 40
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
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    AfterPost = tblTransCntDetAfterPost
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
    Left = 80
    Top = 72
    object tblTransCntDetSERIE: TFloatField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'TRNCNT_DETALLE.SERIE'
      Required = True
    end
    object tblTransCntDetNUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
      Origin = 'TRNCNT_DETALLE.NUMERO'
      Required = True
    end
    object tblTransCntDetDESCRIPCION_TRN: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_TRN'
      Origin = 'TRNCNT_DETALLE.DESCRIPCION_TRN'
      Size = 40
    end
    object tblTransCntDetDEBITO_TRN: TFloatField
      DisplayLabel = 'Debito'
      FieldName = 'DEBITO_TRN'
      Origin = 'TRNCNT_DETALLE.DEBITO_TRN'
    end
    object tblTransCntDetCREDITO_TRN: TFloatField
      DisplayLabel = 'Credito'
      FieldName = 'CREDITO_TRN'
      Origin = 'TRNCNT_DETALLE.CREDITO_TRN'
    end
    object tblTransCntDetCUENTA1: TIBStringField
      DisplayLabel = 'Cta1'
      FieldName = 'CUENTA1'
      Origin = 'TRNCNT_DETALLE.CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object tblTransCntDetCUENTA2: TIBStringField
      DisplayLabel = 'Cta2'
      FieldName = 'CUENTA2'
      Origin = 'TRNCNT_DETALLE.CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object tblTransCntDetCUENTA3: TIBStringField
      DisplayLabel = 'Cta3'
      FieldName = 'CUENTA3'
      Origin = 'TRNCNT_DETALLE.CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
    object tblTransCntDetSTATUS_APLICADA: TIBStringField
      DisplayLabel = 'Post'
      FieldName = 'STATUS_APLICADA'
      Origin = 'TRNCNT_DETALLE.STATUS_APLICADA'
      FixedChar = True
      Size = 1
    end
    object tblTransCntDetSTATUS: TIBStringField
      DisplayLabel = 'Status'
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
      DisplayLabel = 'CodConcepto'
      FieldName = 'COD_CTA_CONCEPTO'
      Origin = 'TRNCNT_DETALLE.COD_CTA_CONCEPTO'
    end
    object tblTransCntDetCODIGO_CENTRO_COSTO: TIntegerField
      DisplayLabel = 'CodCentroCosto'
      FieldName = 'CODIGO_CENTRO_COSTO'
      Origin = 'TRNCNT_DETALLE.CODIGO_CENTRO_COSTO'
    end
    object tblTransCntDetCODIGO_DEPTO: TIntegerField
      FieldName = 'CODIGO_DEPTO'
      Origin = 'TRNCNT_DETALLE.CODIGO_DEPTO'
      Required = True
    end
  end
  object tblDeptos: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM DEPTOS'
      'ORDER BY NOMBRE')
    Left = 80
    Top = 120
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
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CENTRO_COSTO'
      'ORDER BY codigo')
    Left = 80
    Top = 168
    object tblCentroDeCostoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CENTRO_DE_COSTO.CODIGO'
      Required = True
    end
    object tblCentroDeCostoNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'CENTRO_COSTO.NOMBRE'
      Size = 60
    end
    object tblCentroDeCostoCODDGII: TIntegerField
      FieldName = 'CODDGII'
      Origin = 'CENTRO_COSTO.CODDGII'
    end
    object tblCentroDeCostoCUENTA_GASTO: TIBStringField
      FieldName = 'CUENTA_GASTO'
      Origin = 'CENTRO_COSTO.CUENTA_GASTO'
      Size = 9
    end
  end
  object tblTipodoc: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  * from DOC_TRAN_CNT'
      'order by descripcion')
    Left = 80
    Top = 216
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
  object tblDepositoMaster: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    AfterScroll = tblDepositoMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DEPOSITOS_MASTER'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into DEPOSITOS_MASTER'
      
        '  (NUMERO, FECHA, ID_BANCO, TIPO_CTA, CUENTA_BANCO, MONTO, DESCR' +
        'IPCION, '
      '   STATUS, COD_USUARIO, FECHA_IN, IN_POR, FECHA_UPDATE)'
      'values'
      
        '  (:NUMERO, :FECHA, :ID_BANCO, :TIPO_CTA, :CUENTA_BANCO, :MONTO,' +
        ' :DESCRIPCION, '
      '   :STATUS, :COD_USUARIO, :FECHA_IN, :IN_POR, :FECHA_UPDATE)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA,'
      '  ID_BANCO,'
      '  TIPO_CTA,'
      '  CUENTA_BANCO,'
      '  MONTO,'
      '  DESCRIPCION,'
      '  STATUS,'
      '  COD_USUARIO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_UPDATE'
      'from DEPOSITOS_MASTER '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'select *   from DEPOSITOS_MASTER'
      'where fecha =:fechatrn')
    ModifySQL.Strings = (
      'update DEPOSITOS_MASTER'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  ID_BANCO = :ID_BANCO,'
      '  TIPO_CTA = :TIPO_CTA,'
      '  CUENTA_BANCO = :CUENTA_BANCO,'
      '  MONTO = :MONTO,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  STATUS = :STATUS,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_UPDATE = :FECHA_UPDATE'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_DEPOSITO_NUMERO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 224
    Top = 32
    object tblDepositoMasterNUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
      Origin = 'DEPOSITOS_MASTER.NUMERO'
      Required = True
    end
    object tblDepositoMasterFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'DEPOSITOS_MASTER.FECHA'
      Required = True
    end
    object tblDepositoMasterID_BANCO: TIntegerField
      DisplayLabel = 'IdBanco'
      FieldName = 'ID_BANCO'
      Origin = 'DEPOSITOS_MASTER.ID_BANCO'
      Required = True
    end
    object tblDepositoMasterTIPO_CTA: TIntegerField
      DisplayLabel = 'TipoCta'
      FieldName = 'TIPO_CTA'
      Origin = 'DEPOSITOS_MASTER.TIPO_CTA'
    end
    object tblDepositoMasterCUENTA_BANCO: TIBStringField
      DisplayLabel = 'Numero Cuenta'
      FieldName = 'CUENTA_BANCO'
      Origin = 'DEPOSITOS_MASTER.CUENTA_BANCO'
    end
    object tblDepositoMasterMONTO: TFloatField
      DisplayLabel = 'Monto'
      FieldName = 'MONTO'
      Origin = 'DEPOSITOS_MASTER.MONTO'
    end
    object tblDepositoMasterDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'DEPOSITOS_MASTER.DESCRIPCION'
      Size = 60
    end
    object tblDepositoMasterSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'DEPOSITOS_MASTER.STATUS'
      Size = 1
    end
    object tblDepositoMasterCOD_USUARIO: TIntegerField
      DisplayLabel = 'CodUsuario'
      FieldName = 'COD_USUARIO'
      Origin = 'DEPOSITOS_MASTER.COD_USUARIO'
    end
    object tblDepositoMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DEPOSITOS_MASTER.FECHA_IN'
    end
    object tblDepositoMasterIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DEPOSITOS_MASTER.IN_POR'
      Size = 12
    end
    object tblDepositoMasterFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'DEPOSITOS_MASTER.FECHA_UPDATE'
    end
  end
  object tblDepositoDet: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DEPOSITOS_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into DEPOSITOS_DET'
      
        '  (SERIE, NUMERO, TIPO_DEPOSITO, NUMERO_DOCUMENTO, DESCRIPCION, ' +
        'MONTO_DEPOSITO, '
      '   STATUS, COD_USUARIO, FECHA_IN, IN_POR, FECHA_UPDATE)'
      'values'
      
        '  (:SERIE, :NUMERO, :TIPO_DEPOSITO, :NUMERO_DOCUMENTO, :DESCRIPC' +
        'ION, :MONTO_DEPOSITO, '
      '   :STATUS, :COD_USUARIO, :FECHA_IN, :IN_POR, :FECHA_UPDATE)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  TIPO_DEPOSITO,'
      '  NUMERO_DOCUMENTO,'
      '  DESCRIPCION,'
      '  MONTO_DEPOSITO,'
      '  STATUS,'
      '  COD_USUARIO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_UPDATE'
      'from DEPOSITOS_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select * from DEPOSITOS_DET'
      'where numero=:numero')
    ModifySQL.Strings = (
      'update DEPOSITOS_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  TIPO_DEPOSITO = :TIPO_DEPOSITO,'
      '  NUMERO_DOCUMENTO = :NUMERO_DOCUMENTO,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  MONTO_DEPOSITO = :MONTO_DEPOSITO,'
      '  STATUS = :STATUS,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_UPDATE = :FECHA_UPDATE'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_DEPOSITO_SERIEDET'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 224
    Top = 80
    object tblDepositoDetSERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'DEPOSITOS_DET.SERIE'
      Required = True
    end
    object tblDepositoDetNUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
      Origin = 'DEPOSITOS_DET.NUMERO'
      Required = True
    end
    object tblDepositoDetTIPO_DEPOSITO: TIntegerField
      DisplayLabel = 'TipoDeposito'
      FieldName = 'TIPO_DEPOSITO'
      Origin = 'DEPOSITOS_DET.TIPO_DEPOSITO'
    end
    object tblDepositoDetNUMERO_DOCUMENTO: TIBStringField
      DisplayLabel = 'NumeroDoc'
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'DEPOSITOS_DET.NUMERO_DOCUMENTO'
    end
    object tblDepositoDetDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'DEPOSITOS_DET.DESCRIPCION'
      Size = 60
    end
    object tblDepositoDetMONTO_DEPOSITO: TIntegerField
      DisplayLabel = 'Monto Deposito'
      FieldName = 'MONTO_DEPOSITO'
      Origin = 'DEPOSITOS_DET.MONTO_DEPOSITO'
    end
    object tblDepositoDetSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'DEPOSITOS_DET.STATUS'
      Size = 1
    end
    object tblDepositoDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'DEPOSITOS_DET.COD_USUARIO'
    end
    object tblDepositoDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DEPOSITOS_DET.FECHA_IN'
    end
    object tblDepositoDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DEPOSITOS_DET.IN_POR'
      Size = 12
    end
    object tblDepositoDetFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'DEPOSITOS_DET.FECHA_UPDATE'
    end
  end
  object tblTipoDeposito: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_DEPOSITO'
    Left = 192
    Top = 152
    object tblTipoDepositoID_DEPOSITO: TIntegerField
      FieldName = 'ID_DEPOSITO'
    end
    object tblTipoDepositoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object dstblTipoDeposito: TDataSource
    DataSet = tblTipoDeposito
    Left = 192
    Top = 220
  end
  object dstblDepositoMaster: TDataSource
    AutoEdit = False
    DataSet = tblDepositoMaster
    Left = 328
    Top = 32
  end
  object dstblDepositoDet: TDataSource
    AutoEdit = False
    DataSet = tblDepositoDet
    Left = 328
    Top = 80
  end
  object qryBancos: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    AfterScroll = qryBancosAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from BANCOS')
    Left = 312
    Top = 144
    object qryBancosCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Required = True
    end
    object qryBancosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 35
    end
    object qryBancosCODIGO_ABR: TIBStringField
      FieldName = 'CODIGO_ABR'
      Size = 12
    end
  end
  object dsqrybancos: TDataSource
    DataSet = qryBancos
    Left = 312
    Top = 211
  end
  object qryBancosCta: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    AfterScroll = qryBancosCtaAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From BANCOS_DET'
      'Where codigo =:codigo ')
    Left = 192
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end>
    object qryBancosCtaCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'BANCOS_DET.CODIGO'
      Required = True
    end
    object qryBancosCtaTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'BANCOS_DET.TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryBancosCtaCUENTA_BANCO: TIBStringField
      FieldName = 'CUENTA_BANCO'
      Origin = 'BANCOS_DET.CUENTA_BANCO'
    end
  end
  object qryTipoCtaBanco: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  TIPO_CTA_BANCO.CODIGO TIPOCTA,'
      '  TIPO_CTA_BANCO.DESCRIPCION DESCRIPCION_CTA,'
      '  BANCOS_DET.CODIGO ID_BANCO'
      'FROM'
      '  BANCOS_DET,'
      '  TIPO_CTA_BANCO'
      'WHERE'
      '  (BANCOS_DET.TIPO = TIPO_CTA_BANCO.CODIGO)'
      'AND (BANCOS_DET.CODIGO =:codigo)'
      '')
    Left = 312
    Top = 262
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end>
    object qryTipoCtaBancoTIPOCTA: TIntegerField
      FieldName = 'TIPOCTA'
      Origin = 'TIPO_CTA_BANCO.CODIGO'
      Required = True
    end
    object qryTipoCtaBancoDESCRIPCION_CTA: TIBStringField
      FieldName = 'DESCRIPCION_CTA'
      Origin = 'TIPO_CTA_BANCO.DESCRIPCION'
      Size = 30
    end
    object qryTipoCtaBancoID_BANCO: TSmallintField
      FieldName = 'ID_BANCO'
      Origin = 'BANCOS_DET.CODIGO'
      Required = True
    end
  end
  object dsqryBancosCta: TDataSource
    DataSet = qryBancosCta
    Left = 192
    Top = 328
  end
  object dsqryTipoCtaBanco: TDataSource
    DataSet = qryTipoCtaBanco
    Left = 312
    Top = 319
  end
  object tblTipoCuentabco: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    TableName = 'TIPO_CTA_BANCO'
    Left = 80
    Top = 272
    object tblTipoCuentabcoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblTipoCuentabcoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object dbtblTipoCuentabco: TDataSource
    DataSet = tblTipoCuentabco
    Left = 80
    Top = 320
  end
  object tblDepDistBilletes: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from DEPOSITOS_DIST_BILLETES'
      'where'
      '  IDDEPOSITO = :OLD_IDDEPOSITO')
    InsertSQL.Strings = (
      'insert into DEPOSITOS_DIST_BILLETES'
      
        '  (IDDEPOSITO, COD_EMPLEADO, FECHA, MONTO_EN_CHEQUE, M2000, M100' +
        '0, M500, '
      
        '   M200, M100, M50, M25, M20, M10, M5, MONTO_MONEDAS, COD_USUARI' +
        'O, STATUS, '
      '   FECHA_IN, FECHA_UPDATE)'
      'values'
      
        '  (:IDDEPOSITO, :COD_EMPLEADO, :FECHA, :MONTO_EN_CHEQUE, :M2000,' +
        ' :M1000, '
      
        '   :M500, :M200, :M100, :M50, :M25, :M20, :M10, :M5, :MONTO_MONE' +
        'DAS, :COD_USUARIO, '
      '   :STATUS, :FECHA_IN, :FECHA_UPDATE)')
    RefreshSQL.Strings = (
      'Select '
      '  IDDEPOSITO,'
      '  COD_EMPLEADO,'
      '  FECHA,'
      '  MONTO_EN_CHEQUE,'
      '  M2000,'
      '  M1000,'
      '  M500,'
      '  M200,'
      '  M100,'
      '  M50,'
      '  M25,'
      '  M20,'
      '  M10,'
      '  M5,'
      '  MONTO_MONEDAS,'
      '  COD_USUARIO,'
      '  STATUS,'
      '  FECHA_IN,'
      '  FECHA_UPDATE'
      'from DEPOSITOS_DIST_BILLETES '
      'where'
      '  IDDEPOSITO = :IDDEPOSITO')
    SelectSQL.Strings = (
      'Select * From DEPOSITOS_DIST_BILLETES'
      'Where IDDEPOSITO=:iddeposito')
    ModifySQL.Strings = (
      'update DEPOSITOS_DIST_BILLETES'
      'set'
      '  IDDEPOSITO = :IDDEPOSITO,'
      '  COD_EMPLEADO = :COD_EMPLEADO,'
      '  FECHA = :FECHA,'
      '  MONTO_EN_CHEQUE = :MONTO_EN_CHEQUE,'
      '  M2000 = :M2000,'
      '  M1000 = :M1000,'
      '  M500 = :M500,'
      '  M200 = :M200,'
      '  M100 = :M100,'
      '  M50 = :M50,'
      '  M25 = :M25,'
      '  M20 = :M20,'
      '  M10 = :M10,'
      '  M5 = :M5,'
      '  MONTO_MONEDAS = :MONTO_MONEDAS,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  FECHA_UPDATE = :FECHA_UPDATE'
      'where'
      '  IDDEPOSITO = :OLD_IDDEPOSITO')
    Left = 152
    Top = 96
    object tblDepDistBilletesIDDEPOSITO: TIntegerField
      FieldName = 'IDDEPOSITO'
      Origin = 'DEPOSITOS_DIST_BILLETES.IDDEPOSITO'
      Required = True
    end
    object tblDepDistBilletesCOD_EMPLEADO: TIntegerField
      FieldName = 'COD_EMPLEADO'
      Origin = 'DEPOSITOS_DIST_BILLETES.COD_EMPLEADO'
      Required = True
    end
    object tblDepDistBilletesFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DEPOSITOS_DIST_BILLETES.FECHA'
      Required = True
    end
    object tblDepDistBilletesMONTO_EN_CHEQUE: TFloatField
      FieldName = 'MONTO_EN_CHEQUE'
      Origin = 'DEPOSITOS_DIST_BILLETES.MONTO_EN_CHEQUE'
    end
    object tblDepDistBilletesM2000: TIntegerField
      FieldName = 'M2000'
      Origin = 'DEPOSITOS_DIST_BILLETES.M2000'
    end
    object tblDepDistBilletesM1000: TIntegerField
      FieldName = 'M1000'
      Origin = 'DEPOSITOS_DIST_BILLETES.M1000'
    end
    object tblDepDistBilletesM500: TIntegerField
      FieldName = 'M500'
      Origin = 'DEPOSITOS_DIST_BILLETES.M500'
    end
    object tblDepDistBilletesM200: TIntegerField
      FieldName = 'M200'
      Origin = 'DEPOSITOS_DIST_BILLETES.M200'
    end
    object tblDepDistBilletesM100: TIntegerField
      FieldName = 'M100'
      Origin = 'DEPOSITOS_DIST_BILLETES.M100'
    end
    object tblDepDistBilletesM50: TIntegerField
      FieldName = 'M50'
      Origin = 'DEPOSITOS_DIST_BILLETES.M50'
    end
    object tblDepDistBilletesM25: TIntegerField
      FieldName = 'M25'
      Origin = 'DEPOSITOS_DIST_BILLETES.M25'
    end
    object tblDepDistBilletesM20: TIntegerField
      FieldName = 'M20'
      Origin = 'DEPOSITOS_DIST_BILLETES.M20'
    end
    object tblDepDistBilletesM10: TIntegerField
      FieldName = 'M10'
      Origin = 'DEPOSITOS_DIST_BILLETES.M10'
    end
    object tblDepDistBilletesM5: TIntegerField
      FieldName = 'M5'
      Origin = 'DEPOSITOS_DIST_BILLETES.M5'
    end
    object tblDepDistBilletesMONTO_MONEDAS: TFloatField
      FieldName = 'MONTO_MONEDAS'
      Origin = 'DEPOSITOS_DIST_BILLETES.MONTO_MONEDAS'
    end
    object tblDepDistBilletesCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'DEPOSITOS_DIST_BILLETES.COD_USUARIO'
    end
    object tblDepDistBilletesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DEPOSITOS_DIST_BILLETES.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblDepDistBilletesFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DEPOSITOS_DIST_BILLETES.FECHA_IN'
    end
    object tblDepDistBilletesFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'DEPOSITOS_DIST_BILLETES.FECHA_UPDATE'
    end
  end
  object rxTotales: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Credito'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'Debito'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'rxBceAnt'
        DataType = ftFloat
      end
      item
        Name = 'rxBceAct'
        DataType = ftFloat
      end
      item
        Name = 'rxDbmes'
        DataType = ftFloat
      end
      item
        Name = 'rxCrmes'
        DataType = ftFloat
      end
      item
        Name = 'rxDbAcm'
        DataType = ftFloat
      end
      item
        Name = 'rxCrAcm'
        DataType = ftFloat
      end>
    OnCalcFields = rxTotalesCalcFields
    Left = 79
    Top = 371
    object rxTotalesrxBceAnt: TFloatField
      DisplayLabel = 'Bce Ant'
      FieldName = 'rxBceAnt'
      DisplayFormat = ',0.00'
    end
    object rxTotalesrxBceAct: TFloatField
      DisplayLabel = 'Bce Act'
      FieldName = 'rxBceAct'
      DisplayFormat = ',0.00'
    end
    object rxTotalesrxDbmes: TFloatField
      DisplayLabel = 'Db Mes'
      FieldName = 'rxDbmes'
      DisplayFormat = ',0.00'
    end
    object rxTotalesrxCrmes: TFloatField
      DisplayLabel = 'CR Mes'
      FieldName = 'rxCrmes'
      DisplayFormat = ',0.00'
    end
    object rxTotalesrxDbAcm: TFloatField
      DisplayLabel = 'Db Acum.'
      FieldName = 'rxDbAcm'
      DisplayFormat = ',0.00'
    end
    object rxTotalesrxCrAcm: TFloatField
      DisplayLabel = 'CR Acm.'
      FieldName = 'rxCrAcm'
      DisplayFormat = ',0.00'
    end
    object rxTotalesDiferencia: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Diferencia'
      Calculated = True
    end
    object rxTotalesCredito: TFloatField
      FieldName = 'Credito'
      DisplayFormat = ',0.00'
    end
    object rxTotalesDebito: TFloatField
      FieldName = 'Debito'
      DisplayFormat = ',0.00'
    end
  end
  object dtrxTotales: TDataSource
    DataSet = rxTotales
    Left = 79
    Top = 424
  end
  object rxTotalTrnasDet: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Debito'
        DataType = ftCurrency
      end
      item
        Name = 'Credito'
        DataType = ftCurrency
      end>
    OnCalcFields = rxTotalTrnasDetCalcFields
    Left = 200
    Top = 392
    object rxTotalTrnasDetDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object rxTotalTrnasDetCredito: TCurrencyField
      FieldName = 'Credito'
    end
    object rxTotalTrnasDetDiferencia: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Diferencia'
      Calculated = True
    end
  end
  object dsrxTotalTrnasDet: TDataSource
    DataSet = rxTotalTrnasDet
    Left = 200
    Top = 443
  end
  object ibsqlSumadbcrTrnDet: TIBSQL
    Database = dmCon.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Select  '
      'Sum(debito_trn) debito,'
      'Sum(credito_trn)  credito'
      'From TRNCNT_DETALLE'
      'where numero =:numero')
    Transaction = dmCon.IBTransaction1
    Left = 312
    Top = 376
  end
end
