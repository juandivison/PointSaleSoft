object dmcks: Tdmcks
  OldCreateOrder = False
  Left = 500
  Top = 147
  Height = 506
  Width = 659
  object qrybancos: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qrybancosAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from BANCOS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into BANCOS'
      '  (CODIGO, CIA_KEY, DESCRIPCION, CODIGO_ABR)'
      'values'
      '  (:CODIGO, :CIA_KEY, :DESCRIPCION, :CODIGO_ABR)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  CIA_KEY,'
      '  DESCRIPCION,'
      '  CODIGO_ABR'
      'from BANCOS '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'select * from BANCOS')
    ModifySQL.Strings = (
      'update BANCOS'
      'set'
      '  CODIGO = :CODIGO,'
      '  CIA_KEY = :CIA_KEY,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  CODIGO_ABR = :CODIGO_ABR'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 96
    Top = 8
    object qrybancosCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'BANCOS.CODIGO'
      Required = True
    end
    object qrybancosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'BANCOS.DESCRIPCION'
      Size = 35
    end
    object qrybancosCODIGO_ABR: TIBStringField
      FieldName = 'CODIGO_ABR'
      Origin = 'BANCOS.CODIGO_ABR'
      Size = 12
    end
    object qrybancosCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'BANCOS.CIA_KEY'
    end
  end
  object qrybancosdet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from BANCOS_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into BANCOS_DET'
      
        '  (SERIE, CIA_KEY, CODIGO, TIPO, CUENTA_BANCO, MONEDA, CUENTA1, ' +
        'CUENTA2, '
      
        '   CUENTA3, STATUS, FECHA_APERTURA, FECHA_CANCELADA, CKS_CLASIFI' +
        'CACION)'
      'values'
      
        '  (:SERIE, :CIA_KEY, :CODIGO, :TIPO, :CUENTA_BANCO, :MONEDA, :CU' +
        'ENTA1, '
      
        '   :CUENTA2, :CUENTA3, :STATUS, :FECHA_APERTURA, :FECHA_CANCELAD' +
        'A, :CKS_CLASIFICACION)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  CIA_KEY,'
      '  CODIGO,'
      '  TIPO,'
      '  CUENTA_BANCO,'
      '  MONEDA,'
      '  CUENTA1,'
      '  CUENTA2,'
      '  CUENTA3,'
      '  STATUS,'
      '  FECHA_APERTURA,'
      '  FECHA_CANCELADA,'
      '  CKS_CLASIFICACION'
      'from BANCOS_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select * from BANCOS_DET'
      'where codigo=:copdigo')
    ModifySQL.Strings = (
      'update BANCOS_DET'
      'set'
      '  SERIE = :SERIE,'
      '  CIA_KEY = :CIA_KEY,'
      '  CODIGO = :CODIGO,'
      '  TIPO = :TIPO,'
      '  CUENTA_BANCO = :CUENTA_BANCO,'
      '  MONEDA = :MONEDA,'
      '  CUENTA1 = :CUENTA1,'
      '  CUENTA2 = :CUENTA2,'
      '  CUENTA3 = :CUENTA3,'
      '  STATUS = :STATUS,'
      '  FECHA_APERTURA = :FECHA_APERTURA,'
      '  FECHA_CANCELADA = :FECHA_CANCELADA,'
      '  CKS_CLASIFICACION = :CKS_CLASIFICACION'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_BANCODET'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 264
    Top = 24
    object qrybancosdetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'BANCOS_DET.SERIE'
      Required = True
    end
    object qrybancosdetCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'BANCOS_DET.CODIGO'
      Required = True
    end
    object qrybancosdetTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'BANCOS_DET.TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qrybancosdetCUENTA_BANCO: TIBStringField
      FieldName = 'CUENTA_BANCO'
      Origin = 'BANCOS_DET.CUENTA_BANCO'
    end
    object qrybancosdetMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'BANCOS_DET.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qrybancosdetCUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Origin = 'BANCOS_DET.CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qrybancosdetCUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Origin = 'BANCOS_DET.CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qrybancosdetCUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Origin = 'BANCOS_DET.CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qrybancosdetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'BANCOS_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qrybancosdetFECHA_APERTURA: TDateTimeField
      FieldName = 'FECHA_APERTURA'
      Origin = 'BANCOS_DET.FECHA_APERTURA'
    end
    object qrybancosdetFECHA_CANCELADA: TDateTimeField
      FieldName = 'FECHA_CANCELADA'
      Origin = 'BANCOS_DET.FECHA_CANCELADA'
    end
    object qrybancosdetCKS_CLASIFICACION: TSmallintField
      FieldName = 'CKS_CLASIFICACION'
      Origin = 'BANCOS_DET.CKS_CLASIFICACION'
    end
    object qrybancosdetCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'BANCOS_DET.CIA_KEY'
    end
  end
  object dsqrybancos: TDataSource
    DataSet = qrybancos
    Left = 168
    Top = 16
  end
  object dsqrybancosdet: TDataSource
    DataSet = qrybancosdet
    Left = 240
    Top = 120
  end
  object qryChequesM: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryChequesMAfterScroll
    OnCalcFields = qryChequesMCalcFields
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from cheques'
      'where'
      '  NUM_TRANS = :OLD_NUM_TRANS')
    InsertSQL.Strings = (
      'insert into cheques'
      
        '  (NUM_TRANS, CODIGO_CIA, SOL_EXPNO, COD_BENEFICIARIO, FECHA_EMI' +
        'SION, BENEFICIARIO, '
      
        '   MONTO, CONCEPTO, NUMERO_CKS, FECHA_PAGO, TIPO_CKS, COD_BANCO,' +
        ' STATUS, '
      '   FECHA_IN, IN_POR, FECHA_MOD, MOD_POR)'
      'values'
      
        '  (:NUM_TRANS, :CODIGO_CIA, :SOL_EXPNO, :COD_BENEFICIARIO, :FECH' +
        'A_EMISION, '
      
        '   :BENEFICIARIO, :MONTO, :CONCEPTO, :NUMERO_CKS, :FECHA_PAGO, :' +
        'TIPO_CKS, '
      
        '   :COD_BANCO, :STATUS, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR' +
        ')')
    RefreshSQL.Strings = (
      'Select '
      '  NUM_TRANS,'
      '  CODIGO_CIA,'
      '  SOL_EXPNO,'
      '  COD_BENEFICIARIO,'
      '  FECHA_EMISION,'
      '  BENEFICIARIO,'
      '  MONTO,'
      '  CONCEPTO,'
      '  NUMERO_CKS,'
      '  FECHA_PAGO,'
      '  TIPO_CKS,'
      '  COD_BANCO,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from cheques '
      'where'
      '  NUM_TRANS = :NUM_TRANS')
    SelectSQL.Strings = (
      'select * from cheques'
      'where fecha_emision between :fechaini and :fechafin'
      'order by fecha_emision')
    ModifySQL.Strings = (
      'update cheques'
      'set'
      '  NUM_TRANS = :NUM_TRANS,'
      '  CODIGO_CIA = :CODIGO_CIA,'
      '  SOL_EXPNO = :SOL_EXPNO,'
      '  COD_BENEFICIARIO = :COD_BENEFICIARIO,'
      '  FECHA_EMISION = :FECHA_EMISION,'
      '  BENEFICIARIO = :BENEFICIARIO,'
      '  MONTO = :MONTO,'
      '  CONCEPTO = :CONCEPTO,'
      '  NUMERO_CKS = :NUMERO_CKS,'
      '  FECHA_PAGO = :FECHA_PAGO,'
      '  TIPO_CKS = :TIPO_CKS,'
      '  COD_BANCO = :COD_BANCO,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  NUM_TRANS = :OLD_NUM_TRANS')
    GeneratorField.Field = 'NUM_TRANS'
    GeneratorField.Generator = 'GEN_NUM_CKS'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 40
    Top = 56
    object qryChequesMNUM_TRANS: TFloatField
      FieldName = 'NUM_TRANS'
      Origin = 'CHEQUES.NUM_TRANS'
      Required = True
    end
    object qryChequesMCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
      Origin = 'CHEQUES.CODIGO_CIA'
      Required = True
    end
    object qryChequesMSOL_EXPNO: TIntegerField
      FieldName = 'SOL_EXPNO'
      Origin = 'CHEQUES.SOL_EXPNO'
      Required = True
    end
    object qryChequesMCOD_BENEFICIARIO: TIntegerField
      FieldName = 'COD_BENEFICIARIO'
      Origin = 'CHEQUES.COD_BENEFICIARIO'
    end
    object qryChequesMFECHA_EMISION: TDateTimeField
      FieldName = 'FECHA_EMISION'
      Origin = 'CHEQUES.FECHA_EMISION'
    end
    object qryChequesMBENEFICIARIO: TIBStringField
      FieldName = 'BENEFICIARIO'
      Origin = 'CHEQUES.BENEFICIARIO'
      Size = 60
    end
    object qryChequesMMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'CHEQUES.MONTO'
    end
    object qryChequesMCONCEPTO: TMemoField
      FieldName = 'CONCEPTO'
      Origin = 'CHEQUES.CONCEPTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryChequesMNUMERO_CKS: TIntegerField
      FieldName = 'NUMERO_CKS'
      Origin = 'CHEQUES.NUMERO_CKS'
    end
    object qryChequesMFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Origin = 'CHEQUES.FECHA_PAGO'
    end
    object qryChequesMTIPO_CKS: TSmallintField
      FieldName = 'TIPO_CKS'
      Origin = 'CHEQUES.TIPO_CKS'
    end
    object qryChequesMCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Origin = 'CHEQUES.COD_BANCO'
      Required = True
    end
    object qryChequesMSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CHEQUES.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryChequesMFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CHEQUES.FECHA_IN'
    end
    object qryChequesMIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'CHEQUES.IN_POR'
      Size = 12
    end
    object qryChequesMFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CHEQUES.FECHA_MOD'
    end
    object qryChequesMMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'CHEQUES.MOD_POR'
      Size = 12
    end
    object qryChequesMmonto_cld: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'monto_cld'
      Calculated = True
    end
  end
  object qryChequesDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qryChequesDetCalcFields
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from cheques_det'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into cheques_det'
      
        '  (SERIE, NUM_TRANS, CUENTA1, CUENTA2, CUENTA3, CREDITO, DEBITO,' +
        ' STATUS, '
      
        '   COD_DIST_CTA, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, CENTRO_CO' +
        'STO)'
      'values'
      
        '  (:SERIE, :NUM_TRANS, :CUENTA1, :CUENTA2, :CUENTA3, :CREDITO, :' +
        'DEBITO, '
      
        '   :STATUS, :COD_DIST_CTA, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_' +
        'POR, :CENTRO_COSTO)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUM_TRANS,'
      '  CUENTA1,'
      '  CUENTA2,'
      '  CUENTA3,'
      '  CREDITO,'
      '  DEBITO,'
      '  STATUS,'
      '  COD_DIST_CTA,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  CENTRO_COSTO'
      'from cheques_det '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * From cheques_det'
      'Where num_trans = :numtrans')
    ModifySQL.Strings = (
      'update cheques_det'
      'set'
      '  SERIE = :SERIE,'
      '  NUM_TRANS = :NUM_TRANS,'
      '  CUENTA1 = :CUENTA1,'
      '  CUENTA2 = :CUENTA2,'
      '  CUENTA3 = :CUENTA3,'
      '  CREDITO = :CREDITO,'
      '  DEBITO = :DEBITO,'
      '  STATUS = :STATUS,'
      '  COD_DIST_CTA = :COD_DIST_CTA,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  CENTRO_COSTO = :CENTRO_COSTO'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_NUM_CKS_SERIE'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 40
    Top = 104
    object qryChequesDetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'CHEQUES_DET.SERIE'
      Required = True
    end
    object qryChequesDetNUM_TRANS: TFloatField
      FieldName = 'NUM_TRANS'
      Origin = 'CHEQUES_DET.NUM_TRANS'
      Required = True
    end
    object qryChequesDetCUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Origin = 'CHEQUES_DET.CUENTA1'
      FixedChar = True
      Size = 3
    end
    object qryChequesDetCUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Origin = 'CHEQUES_DET.CUENTA2'
      FixedChar = True
      Size = 2
    end
    object qryChequesDetCUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Origin = 'CHEQUES_DET.CUENTA3'
      FixedChar = True
      Size = 2
    end
    object qryChequesDetCREDITO: TFloatField
      FieldName = 'CREDITO'
      Origin = 'CHEQUES_DET.CREDITO'
    end
    object qryChequesDetDEBITO: TFloatField
      FieldName = 'DEBITO'
      Origin = 'CHEQUES_DET.DEBITO'
    end
    object qryChequesDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CHEQUES_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryChequesDetCOD_DIST_CTA: TIntegerField
      FieldName = 'COD_DIST_CTA'
      Origin = 'CHEQUES_DET.COD_DIST_CTA'
    end
    object qryChequesDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CHEQUES_DET.FECHA_IN'
    end
    object qryChequesDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'CHEQUES_DET.IN_POR'
      Size = 12
    end
    object qryChequesDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CHEQUES_DET.FECHA_MOD'
    end
    object qryChequesDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'CHEQUES_DET.MOD_POR'
      Size = 12
    end
    object qryChequesDetCENTRO_COSTO: TIntegerField
      FieldName = 'CENTRO_COSTO'
      Origin = 'CHEQUES_DET.CENTRO_COSTO'
    end
    object qryChequesDetDBCR: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkCalculated
      FieldName = 'DBCR'
      Calculated = True
    end
    object qryChequesDetSIGNOCTA: TIntegerField
      DisplayLabel = 'Signo'
      FieldKind = fkCalculated
      FieldName = 'SIGNOCTA'
      Calculated = True
    end
    object qryChequesDetNOMBRECTA: TStringField
      DisplayLabel = 'NombreCta'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'NOMBRECTA'
      Size = 30
      Calculated = True
    end
  end
  object dtChequesM: TDataSource
    AutoEdit = False
    DataSet = qryChequesM
    Left = 120
    Top = 64
  end
  object dtChequesDet: TDataSource
    AutoEdit = False
    DataSet = qryChequesDet
    Left = 168
    Top = 120
  end
  object QryProveedores: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  * From PROVEEDORES')
    Left = 48
    Top = 160
    object QryProveedoresCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROVEEDORES.CODIGO_CTE'
      Required = True
    end
    object QryProveedoresTIPO_CLIENTE: TIntegerField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'PROVEEDORES.TIPO_CLIENTE'
    end
    object QryProveedoresNOMBRE_ABR: TIBStringField
      FieldName = 'NOMBRE_ABR'
      Origin = 'PROVEEDORES.NOMBRE_ABR'
      Size = 60
    end
    object QryProveedoresDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object QryProveedoresCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'PROVEEDORES.CONTACTO'
      Size = 35
    end
    object QryProveedoresPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PROVEEDORES.PAIS'
      Size = 30
    end
    object QryProveedoresESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'PROVEEDORES.ESTADO'
      Size = 30
    end
    object QryProveedoresCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROVEEDORES.CIUDAD'
    end
    object QryProveedoresCALYYNUM: TIBStringField
      FieldName = 'CALYYNUM'
      Origin = 'PROVEEDORES.CALYYNUM'
      Size = 80
    end
    object QryProveedoresTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object QryProveedoresFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'PROVEEDORES.FAX'
      Size = 12
    end
    object QryProveedoresCODIGOPOSTAL: TIBStringField
      FieldName = 'CODIGOPOSTAL'
      Origin = 'PROVEEDORES.CODIGOPOSTAL'
      FixedChar = True
      Size = 6
    end
    object QryProveedoresEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'PROVEEDORES.EMAIL'
      Size = 40
    end
    object QryProveedoresDIRECCIONWEB: TIBStringField
      FieldName = 'DIRECCIONWEB'
      Origin = 'PROVEEDORES.DIRECCIONWEB'
      Size = 40
    end
    object QryProveedoresSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROVEEDORES.STATUS'
      FixedChar = True
      Size = 1
    end
    object QryProveedoresFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PROVEEDORES.FECHA_IN'
    end
    object QryProveedoresIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PROVEEDORES.IN_POR'
      Size = 12
    end
    object QryProveedoresFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PROVEEDORES.FECHA_MOD'
    end
    object QryProveedoresMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PROVEEDORES.MOD_POR'
      Size = 12
    end
    object QryProveedoresRNC_PROVEEDOR: TIBStringField
      FieldName = 'RNC_PROVEEDOR'
      Origin = 'PROVEEDORES.RNC_PROVEEDOR'
      Size = 15
    end
    object QryProveedoresMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'PROVEEDORES.MOVIL1'
    end
    object QryProveedoresMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'PROVEEDORES.MOVIL2'
    end
    object QryProveedoresTELEFONO2: TIBStringField
      FieldName = 'TELEFONO2'
      Origin = 'PROVEEDORES.TELEFONO2'
    end
    object QryProveedoresTELEFONO3: TIBStringField
      FieldName = 'TELEFONO3'
      Origin = 'PROVEEDORES.TELEFONO3'
    end
    object QryProveedoresEXTENSIONES: TIBStringField
      FieldName = 'EXTENSIONES'
      Origin = 'PROVEEDORES.EXTENSIONES'
      Size = 40
    end
    object QryProveedoresCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'PROVEEDORES.CIA_KEY'
    end
    object QryProveedoresTIPOCXP: TIntegerField
      FieldName = 'TIPOCXP'
      Origin = 'PROVEEDORES.TIPOCXP'
    end
  end
  object dsQryProveedores: TDataSource
    DataSet = QryProveedores
    Left = 160
    Top = 184
  end
  object tChequesptipo: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_CKS'
    Left = 248
    Top = 176
    object tChequesptipoCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tChequesptipoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 12
    end
  end
  object dttChequesptipo: TDataSource
    DataSet = tChequesptipo
    Left = 256
    Top = 232
  end
  object tCentroCostos: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CODDGII'
        DataType = ftInteger
      end
      item
        Name = 'CUENTA_GASTO'
        DataType = ftString
        Size = 9
      end>
    StoreDefs = True
    TableName = 'CENTRO_COSTO'
    Left = 48
    Top = 208
    object tCentroCostosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tCentroCostosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 60
    end
    object tCentroCostosCODDGII: TIntegerField
      FieldName = 'CODDGII'
    end
    object tCentroCostosCUENTA_GASTO: TIBStringField
      FieldName = 'CUENTA_GASTO'
      Size = 9
    end
  end
  object dstCentroCostos: TDataSource
    DataSet = tCentroCostos
    Left = 96
    Top = 256
  end
  object qryChequesIsr: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from cheques_Isr'
      'where'
      '  NUMERO_SERIE = :OLD_NUMERO_SERIE')
    InsertSQL.Strings = (
      'insert into cheques_Isr'
      
        '  (NUMERO_SERIE, PORC_DESC, INSERTADO_POR, FECHA_IN, MODIFICADO_' +
        'POR, FECHA_MOD, '
      '   STATUS)'
      'values'
      
        '  (:NUMERO_SERIE, :PORC_DESC, :INSERTADO_POR, :FECHA_IN, :MODIFI' +
        'CADO_POR, '
      '   :FECHA_MOD, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_SERIE,'
      '  PORC_DESC,'
      '  INSERTADO_POR,'
      '  FECHA_IN,'
      '  MODIFICADO_POR,'
      '  FECHA_MOD,'
      '  STATUS'
      'from cheques_Isr '
      'where'
      '  NUMERO_SERIE = :NUMERO_SERIE')
    SelectSQL.Strings = (
      'Select * From cheques_Isr'
      'Where numero_SERIE = :numeroSERIE')
    ModifySQL.Strings = (
      'update cheques_Isr'
      'set'
      '  NUMERO_SERIE = :NUMERO_SERIE,'
      '  PORC_DESC = :PORC_DESC,'
      '  INSERTADO_POR = :INSERTADO_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MODIFICADO_POR = :MODIFICADO_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  STATUS = :STATUS'
      'where'
      '  NUMERO_SERIE = :OLD_NUMERO_SERIE')
    Left = 176
    Top = 232
    object qryChequesIsrNUMERO_SERIE: TFloatField
      FieldName = 'NUMERO_SERIE'
      Origin = 'CHEQUES_ISR.NUMERO_SERIE'
      Required = True
    end
    object qryChequesIsrPORC_DESC: TFloatField
      FieldName = 'PORC_DESC'
      Origin = 'CHEQUES_ISR.PORC_DESC'
    end
    object qryChequesIsrINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'CHEQUES_ISR.INSERTADO_POR'
      Size = 12
    end
    object qryChequesIsrFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CHEQUES_ISR.FECHA_IN'
    end
    object qryChequesIsrMODIFICADO_POR: TIBStringField
      FieldName = 'MODIFICADO_POR'
      Origin = 'CHEQUES_ISR.MODIFICADO_POR'
      Size = 12
    end
    object qryChequesIsrFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CHEQUES_ISR.FECHA_MOD'
    end
    object qryChequesIsrSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CHEQUES_ISR.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryrepcks: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qryrepcksCalcFields
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select * from cheques'
      'where fecha_emision between :fechaini and :fechafin'
      'order by  fecha_emision,NUM_TRANS')
    UpdateObject = updNumcks
    Left = 24
    Top = 256
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
    object qryrepcksNUM_TRANS: TFloatField
      FieldName = 'NUM_TRANS'
      Origin = 'CHEQUES.NUM_TRANS'
      Required = True
    end
    object qryrepcksCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
      Origin = 'CHEQUES.CODIGO_CIA'
      Required = True
    end
    object qryrepcksSOL_EXPNO: TIntegerField
      FieldName = 'SOL_EXPNO'
      Origin = 'CHEQUES.SOL_EXPNO'
      Required = True
    end
    object qryrepcksCOD_BENEFICIARIO: TIntegerField
      FieldName = 'COD_BENEFICIARIO'
      Origin = 'CHEQUES.COD_BENEFICIARIO'
    end
    object qryrepcksFECHA_EMISION: TDateTimeField
      FieldName = 'FECHA_EMISION'
      Origin = 'CHEQUES.FECHA_EMISION'
    end
    object qryrepcksBENEFICIARIO: TIBStringField
      FieldName = 'BENEFICIARIO'
      Origin = 'CHEQUES.BENEFICIARIO'
      Size = 60
    end
    object qryrepcksMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'CHEQUES.MONTO'
    end
    object qryrepcksCONCEPTO: TMemoField
      FieldName = 'CONCEPTO'
      Origin = 'CHEQUES.CONCEPTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryrepcksNUMERO_CKS: TIntegerField
      FieldName = 'NUMERO_CKS'
      Origin = 'CHEQUES.NUMERO_CKS'
    end
    object qryrepcksFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Origin = 'CHEQUES.FECHA_PAGO'
    end
    object qryrepcksTIPO_CKS: TSmallintField
      FieldName = 'TIPO_CKS'
      Origin = 'CHEQUES.TIPO_CKS'
    end
    object qryrepcksCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Origin = 'CHEQUES.COD_BANCO'
      Required = True
    end
    object qryrepcksSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CHEQUES.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryrepcksFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CHEQUES.FECHA_IN'
    end
    object qryrepcksIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'CHEQUES.IN_POR'
      Size = 12
    end
    object qryrepcksFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CHEQUES.FECHA_MOD'
    end
    object qryrepcksMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'CHEQUES.MOD_POR'
      Size = 12
    end
    object qryrepcksPORC_DESCUENTO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PORC_DESCUENTO'
      Calculated = True
    end
    object qryrepcksVALOR_NETO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'VALOR_NETO'
      Calculated = True
    end
  end
  object updNumcks: TIBUpdateSQL
    ModifySQL.Strings = (
      'update cheques'
      'set'
      '  NUM_TRANS = :NUM_TRANS,'
      '  NUMERO_CKS = :NUMERO_CKS,'
      '  FECHA_PAGO = :FECHA_PAGO,'
      '  STATUS = :STATUS'
      'where'
      '  NUM_TRANS = :OLD_NUM_TRANS')
    Left = 24
    Top = 304
  end
  object qryRepCksPIsr: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from cheques_Isr'
      'where numero_SERIE = :numeroSERIE')
    Left = 184
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numeroSERIE'
        ParamType = ptInput
      end>
    object qryRepCksPIsrNUMERO_SERIE: TFloatField
      FieldName = 'NUMERO_SERIE'
      Origin = 'CHEQUES_ISR.NUMERO_SERIE'
      Required = True
    end
    object qryRepCksPIsrPORC_DESC: TFloatField
      FieldName = 'PORC_DESC'
      Origin = 'CHEQUES_ISR.PORC_DESC'
    end
    object qryRepCksPIsrINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'CHEQUES_ISR.INSERTADO_POR'
      Size = 12
    end
    object qryRepCksPIsrFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CHEQUES_ISR.FECHA_IN'
    end
    object qryRepCksPIsrMODIFICADO_POR: TIBStringField
      FieldName = 'MODIFICADO_POR'
      Origin = 'CHEQUES_ISR.MODIFICADO_POR'
      Size = 12
    end
    object qryRepCksPIsrFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CHEQUES_ISR.FECHA_MOD'
    end
    object qryRepCksPIsrSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CHEQUES_ISR.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object stpCksDanados: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_ACT_CKSDANADO'
    Left = 248
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'SERIE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUM_TRANS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_CKS'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SOL_EXPNO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_BENEFICIARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_EMISION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BENEFICIARIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_PAGO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_CKS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_BANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end>
  end
  object stpSeriecksDet: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_ACT_CKSPDET'
    Left = 104
    Top = 304
  end
  object stpNumcks: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_NUM_CKS'
    Left = 256
    Top = 360
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ACTNO_SERIE'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TABLA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMCKS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODBANCO'
        ParamType = ptInput
      end>
  end
  object tblSecNumCks: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'SEC_NUM_CKS'
    Left = 56
    Top = 360
    object tblSecNumCksTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object tblSecNumCksSERIE: TFloatField
      FieldName = 'SERIE'
    end
    object tblSecNumCksCODBANCO: TIntegerField
      FieldName = 'CODBANCO'
    end
    object tblSecNumCksFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
  end
  object dstblSecNumCks: TDataSource
    DataSet = tblSecNumCks
    Left = 152
    Top = 360
  end
  object qryConciliacion: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qryConciliacionCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'Transac_bancaria.CODIGO_BCO, '
      'Transac_bancaria.CUENTA_BCO, '
      'Transac_bancaria.TIPO_TRN, '
      'Bancos_det.TIPO, '
      'Bancos.DESCRIPCION, '
      'Bancos_det.CUENTA1, '
      'Bancos_det.CUENTA2, '
      'Bancos_det.CUENTA3, '
      'Balance_Cnt.BALANCE_ANT,'
      'Balance_Cnt.BALANCE_ACT,'
      'SUM( Transac_bancaria.MONTO_TRN ) MONTO'
      'FROM TRANSAC_BANCARIA Transac_bancaria'
      '   INNER JOIN BANCOS_DET Bancos_det'
      '   ON  (Transac_bancaria.CUENTA_BCO = Bancos_det.CUENTA_BANCO)  '
      '   INNER JOIN BANCOS Bancos'
      '   ON  (Transac_bancaria.CODIGO_BCO = Bancos.CODIGO)  '
      '   INNER JOIN BALANCE_CNT Balance_cnt'
      '    ON  (Bancos_det.CUENTA1 = Balance_cnt.CUENTA1_blc)  '
      '   AND  (Bancos_det.CUENTA2 = Balance_cnt.CUENTA2_blc)  '
      '   AND  (Bancos_det.CUENTA3 = Balance_cnt.CUENTA3_blc)  '
      'WHERE (Transac_bancaria.STATUS_CKS IS NULL '
      '      OR   Transac_bancaria.STATUS_CKS IN ('#39'R'#39','#39'T'#39') )'
      
        '    AND   (Transac_bancaria.FECHA_TRN BETWEEN :Fechaini and :Fec' +
        'hafin)'
      '    AND   Transac_bancaria.CODIGO_BCO = :codigobco'
      '    AND   Transac_bancaria.CUENTA_BCO = :cuentabco'
      
        '    AND   (Balance_cnt.FECHA_blc BETWEEN :FechainiB and :Fechafi' +
        'nB)'
      ''
      'GROUP By '
      '          Transac_bancaria.CODIGO_BCO, '
      '          Transac_bancaria.CUENTA_BCO, '
      '          Transac_bancaria.TIPO_TRN, '
      '          Bancos_det.TIPO, '
      '          Bancos.DESCRIPCION, '
      '          Bancos_det.CUENTA1, '
      '          Bancos_det.CUENTA2, '
      '          Bancos_det.CUENTA3, '
      '          Balance_cnt.BALANCE_ACT,'
      '          Balance_cnt.BALANCE_ANT')
    Left = 168
    Top = 288
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
      end
      item
        DataType = ftInteger
        Name = 'codigobco'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cuentabco'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FechainiB'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FechafinB'
        ParamType = ptInput
      end>
    object qryConciliacionCODIGO_BCO: TIntegerField
      FieldName = 'CODIGO_BCO'
      Required = True
    end
    object qryConciliacionCUENTA_BCO: TIBStringField
      FieldName = 'CUENTA_BCO'
      Required = True
    end
    object qryConciliacionTIPO_TRN: TIntegerField
      FieldName = 'TIPO_TRN'
      Required = True
    end
    object qryConciliacionTIPO: TIBStringField
      FieldName = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryConciliacionDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'BANCOS.DESCRIPCION'
      Size = 35
    end
    object qryConciliacionCUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryConciliacionCUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryConciliacionCUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryConciliacionBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
    end
    object qryConciliacionBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
    end
    object qryConciliacionMONTO: TFloatField
      FieldName = 'MONTO'
    end
    object qryConciliacionBCE_SEGUN_LIBRO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'BCE_SEGUN_LIBRO'
      Calculated = True
    end
  end
  object dtRXConciliacion: TDataSource
    DataSet = RXConciliacion
    Left = 320
    Top = 192
  end
  object RXConciliacion: TRxMemoryData
    FieldDefs = <
      item
        Name = 'BceSegBanco'
        DataType = ftFloat
      end
      item
        Name = 'BceCksTransito'
        DataType = ftFloat
      end
      item
        Name = 'BceDepEnTransito'
        DataType = ftFloat
      end
      item
        Name = 'BceBceEnLibro'
        DataType = ftFloat
      end
      item
        Name = 'Intereses'
        DataType = ftFloat
      end
      item
        Name = 'Comisiones'
        DataType = ftFloat
      end
      item
        Name = 'NotaDebito'
        DataType = ftFloat
      end
      item
        Name = 'Otros'
        DataType = ftFloat
      end
      item
        Name = 'Otro1'
        DataType = ftFloat
      end
      item
        Name = 'NotaCredito'
        DataType = ftFloat
      end>
    Left = 320
    Top = 144
    object RXConciliacionBceSegBanco: TFloatField
      FieldName = 'BceSegBanco'
      DisplayFormat = ',0.00'
    end
    object RXConciliacionBceCksTransito: TFloatField
      FieldName = 'BceCksTransito'
      DisplayFormat = ',0.00'
    end
    object RXConciliacionBceDepEnTransito: TFloatField
      FieldName = 'BceDepEnTransito'
      DisplayFormat = ',0.00'
    end
    object RXConciliacionBceBceEnLibro: TFloatField
      FieldName = 'BceBceEnLibro'
      DisplayFormat = ',0.00'
    end
    object RXConciliacionIntereses: TFloatField
      FieldName = 'Intereses'
      DisplayFormat = ',0.00'
    end
    object RXConciliacionComisiones: TFloatField
      FieldName = 'Comisiones'
      DisplayFormat = ',0.00'
    end
    object RXConciliacionNotaDebito: TFloatField
      FieldName = 'NotaDebito'
      DisplayFormat = ',0.00'
    end
    object RXConciliacionNotaCredito: TFloatField
      FieldName = 'NotaCredito'
    end
    object RXConciliacionOtros: TFloatField
      FieldName = 'Otros'
      DisplayFormat = ',0.00'
    end
    object RXConciliacionBalanceUno: TFloatField
      FieldKind = fkCalculated
      FieldName = 'BalanceUno'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object RXConciliacionBalanceDos: TFloatField
      FieldKind = fkCalculated
      FieldName = 'BalanceDos'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object RXConciliacionOtro1: TFloatField
      FieldName = 'Otro1'
    end
  end
  object dtqryConciliacion: TDataSource
    AutoEdit = False
    DataSet = qryConciliacion
    Left = 360
    Top = 360
  end
  object qryBceSegunBco: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from BALANCE_SEGUN_BCO'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  CUENTA_BANCO = :OLD_CUENTA_BANCO and'
      '  FECHA = :OLD_FECHA')
    InsertSQL.Strings = (
      'insert into BALANCE_SEGUN_BCO'
      
        '  (CODIGO, CUENTA_BANCO, FECHA, BALANCE, OTRO, STATUS, FECHA_IN,' +
        ' IN_POR, '
      '   FECHA_MOD, MOD_POR, COMENTARIO)'
      'values'
      
        '  (:CODIGO, :CUENTA_BANCO, :FECHA, :BALANCE, :OTRO, :STATUS, :FE' +
        'CHA_IN, '
      '   :IN_POR, :FECHA_MOD, :MOD_POR, :COMENTARIO)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  CUENTA_BANCO,'
      '  FECHA,'
      '  BALANCE,'
      '  OTRO,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  COMENTARIO'
      'from BALANCE_SEGUN_BCO '
      'where'
      '  CODIGO = :CODIGO and'
      '  CUENTA_BANCO = :CUENTA_BANCO and'
      '  FECHA = :FECHA')
    SelectSQL.Strings = (
      'Select * from BALANCE_SEGUN_BCO'
      'Where codigo = :codigo'
      'And fecha = :fecha'
      'And cuenta_banco = :cuenta'
      'order by codigo')
    ModifySQL.Strings = (
      'update BALANCE_SEGUN_BCO'
      'set'
      '  CODIGO = :CODIGO,'
      '  CUENTA_BANCO = :CUENTA_BANCO,'
      '  FECHA = :FECHA,'
      '  BALANCE = :BALANCE,'
      '  OTRO = :OTRO,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  COMENTARIO = :COMENTARIO'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  CUENTA_BANCO = :OLD_CUENTA_BANCO and'
      '  FECHA = :OLD_FECHA')
    Left = 320
    Top = 48
    object qryBceSegunBcoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'BALANCE_SEGUN_BCO.CODIGO'
      Required = True
    end
    object qryBceSegunBcoCUENTA_BANCO: TIBStringField
      FieldName = 'CUENTA_BANCO'
      Origin = 'BALANCE_SEGUN_BCO.CUENTA_BANCO'
      Required = True
    end
    object qryBceSegunBcoFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'BALANCE_SEGUN_BCO.FECHA'
      Required = True
    end
    object qryBceSegunBcoBALANCE: TFloatField
      FieldName = 'BALANCE'
      Origin = 'BALANCE_SEGUN_BCO.BALANCE'
    end
    object qryBceSegunBcoOTRO: TFloatField
      FieldName = 'OTRO'
      Origin = 'BALANCE_SEGUN_BCO.OTRO'
    end
    object qryBceSegunBcoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'BALANCE_SEGUN_BCO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryBceSegunBcoFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'BALANCE_SEGUN_BCO.FECHA_IN'
    end
    object qryBceSegunBcoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'BALANCE_SEGUN_BCO.IN_POR'
      Size = 12
    end
    object qryBceSegunBcoFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'BALANCE_SEGUN_BCO.FECHA_MOD'
    end
    object qryBceSegunBcoMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'BALANCE_SEGUN_BCO.MOD_POR'
      Size = 12
    end
    object qryBceSegunBcoCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'BALANCE_SEGUN_BCO.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
  end
  object dtqryBceSegunBco: TDataSource
    DataSet = qryBceSegunBco
    Left = 320
    Top = 96
  end
  object qryRepCksEnTransito: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '     Transac_bancaria.TIPO_TRN, '
      '     Transac_bancaria.NUMERO_DOC, '
      '     Transac_bancaria.FECHA_TRN, '
      '     Transac_bancaria.DESCRIPCION_TRN, '
      '     Transac_bancaria.MONTO_TRN, '
      '     Transac_bancaria.STATUS_CKS, '
      '     Bancos.DESCRIPCION'
      'FROM TRANSAC_BANCARIA Transac_bancaria'
      '   INNER JOIN BANCOS Bancos'
      '   ON  (Transac_bancaria.CODIGO_BCO = Bancos.CODIGO)  '
      'WHERE   (Transac_bancaria.TIPO_TRN = 4)  '
      '  And fecha_trn between :fechaini and :fechafin'
      '  AND Transac_bancaria.STATUS  = '#39'P'#39' '
      '  AND Transac_bancaria.CUENTA_BCO = :CUENTABCO'
      'order by '
      '     Transac_bancaria.NUMERO_DOC')
    OnFilterRecord = qryRepCksEnTransitoFilterRecord
    Left = 360
    Top = 256
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
        Name = 'CUENTABCO'
        ParamType = ptInput
      end>
    object qryRepCksEnTransitoTIPO_TRN: TIntegerField
      FieldName = 'TIPO_TRN'
      Origin = 'TRANSAC_BANCARIA.TIPO_TRN'
      Required = True
    end
    object qryRepCksEnTransitoNUMERO_DOC: TIntegerField
      FieldName = 'NUMERO_DOC'
      Origin = 'TRANSAC_BANCARIA.NUMERO_DOC'
      Required = True
    end
    object qryRepCksEnTransitoFECHA_TRN: TDateTimeField
      FieldName = 'FECHA_TRN'
      Origin = 'TRANSAC_BANCARIA.FECHA_TRN'
      Required = True
    end
    object qryRepCksEnTransitoDESCRIPCION_TRN: TIBStringField
      FieldName = 'DESCRIPCION_TRN'
      Origin = 'TRANSAC_BANCARIA.DESCRIPCION_TRN'
      Size = 60
    end
    object qryRepCksEnTransitoMONTO_TRN: TFloatField
      FieldName = 'MONTO_TRN'
      Origin = 'TRANSAC_BANCARIA.MONTO_TRN'
    end
    object qryRepCksEnTransitoSTATUS_CKS: TIBStringField
      FieldName = 'STATUS_CKS'
      Origin = 'TRANSAC_BANCARIA.STATUS_CKS'
      FixedChar = True
      Size = 1
    end
    object qryRepCksEnTransitoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'BANCOS.DESCRIPCION'
      Size = 35
    end
  end
  object tblTipoCheque: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_CKS'
    Left = 432
    Top = 40
    object tblTipoChequeCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tblTipoChequeDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 12
    end
  end
  object dtTipocheque: TDataSource
    DataSet = tblTipoCheque
    Left = 432
    Top = 104
  end
  object tblTipoctabanco: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    TableName = 'TIPO_CTA_BANCO'
    Left = 432
    Top = 192
    object tblTipoctabancoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblTipoctabancoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object dstblTipoctabanco: TDataSource
    DataSet = tblTipoctabanco
    Left = 448
    Top = 296
  end
  object qrylistadecheques: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qrylistadechequesCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT Cheques.FECHA_EMISION, '
      'Cheques.COD_BENEFICIARIO, '
      'Cheques.NUM_TRANS, '
      'Cheques.NUMERO_CKS, '
      'Cheques.BENEFICIARIO, '
      'Cheques.MONTO, '
      'Cheques.STATUS, '
      'Cheques.COD_BANCO, '
      'Cheques.FECHA_PAGO, '
      'Cheques.TIPO_CKS, '
      'Cheques.CONCEPTO, '
      'Cheques.CODIGO_CIA, '
      'Cheques.SOL_EXPNO, '
      'Compania.CODIGO, '
      'Compania.NOMBRE, '
      'Bancos.DESCRIPCION'
      'FROM CHEQUES Cheques'
      '   INNER JOIN CHEQUES_DET Cheques_det'
      '   ON  (Cheques.NUM_TRANS = Cheques_det.NUM_TRANS)  '
      '   INNER JOIN COMPANIA Compania'
      '   ON  (Compania.CODIGO = Cheques.CODIGO_CIA)  '
      '   LEFT OUTER JOIN BANCOS Bancos'
      '   ON  (Cheques.COD_BANCO = Bancos.CODIGO)  '
      'WHERE Cheques.Fecha_emision Between :Fechaini And :Fechafin'
      'ORDER BY '
      'Cheques.COD_BANCO, '
      'Cheques.FECHA_EMISION, '
      'Cheques.NUMERO_CKS')
    Left = 520
    Top = 152
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Fechaini'
        ParamType = ptInput
        Value = '01/01/2013'
      end
      item
        DataType = ftDateTime
        Name = 'Fechafin'
        ParamType = ptInput
        Value = '12/12/2014'
      end>
    object qrylistadechequesFECHA_EMISION: TDateTimeField
      FieldName = 'FECHA_EMISION'
      Origin = 'CHEQUES.FECHA_EMISION'
    end
    object qrylistadechequesCOD_BENEFICIARIO: TIntegerField
      FieldName = 'COD_BENEFICIARIO'
      Origin = 'CHEQUES.COD_BENEFICIARIO'
    end
    object qrylistadechequesNUM_TRANS: TFloatField
      FieldName = 'NUM_TRANS'
      Origin = 'CHEQUES.NUM_TRANS'
      Required = True
    end
    object qrylistadechequesNUMERO_CKS: TIntegerField
      FieldName = 'NUMERO_CKS'
      Origin = 'CHEQUES.NUMERO_CKS'
    end
    object qrylistadechequesBENEFICIARIO: TIBStringField
      FieldName = 'BENEFICIARIO'
      Origin = 'CHEQUES.BENEFICIARIO'
      Size = 60
    end
    object qrylistadechequesMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'CHEQUES.MONTO'
    end
    object qrylistadechequesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CHEQUES.STATUS'
      FixedChar = True
      Size = 1
    end
    object qrylistadechequesCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Origin = 'CHEQUES.COD_BANCO'
      Required = True
    end
    object qrylistadechequesFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Origin = 'CHEQUES.FECHA_PAGO'
    end
    object qrylistadechequesTIPO_CKS: TSmallintField
      FieldName = 'TIPO_CKS'
      Origin = 'CHEQUES.TIPO_CKS'
    end
    object qrylistadechequesCONCEPTO: TMemoField
      FieldName = 'CONCEPTO'
      Origin = 'CHEQUES.CONCEPTO'
      BlobType = ftMemo
      Size = 8
    end
    object qrylistadechequesCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
      Origin = 'CHEQUES.CODIGO_CIA'
      Required = True
    end
    object qrylistadechequesSOL_EXPNO: TIntegerField
      FieldName = 'SOL_EXPNO'
      Origin = 'CHEQUES.SOL_EXPNO'
      Required = True
    end
    object qrylistadechequesCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'COMPANIA.CODIGO'
      Required = True
    end
    object qrylistadechequesNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COMPANIA.NOMBRE'
      Size = 60
    end
    object qrylistadechequesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'BANCOS.DESCRIPCION'
      Size = 35
    end
    object qrylistadechequesMONTO_CLD: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'MONTO_CLD'
      Calculated = True
    end
  end
  object qryRepCksIsrDesc: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT Cheques.FECHA_EMISION, Cheques.BENEFICIARIO, Cheques.MONT' +
        'O, Cheques.CONCEPTO, Cheques.NUMERO_CKS, Cheques_isr.PORC_DESC, ' +
        'Cheques.STATUS'
      'FROM CHEQUES_ISR Cheques_isr'
      '   INNER JOIN CHEQUES Cheques'
      '   ON  (Cheques_isr.NUMERO_SERIE = Cheques.NUM_TRANS)  '
      'WHERE  Cheques.FECHA_EMISION BETWEEN :FECHAINI AND :FECHAFIN'
      'ORDER BY Cheques.BENEFICIARIO, Cheques.FECHA_EMISION')
    Left = 528
    Top = 208
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
      end>
  end
  object QryDatosDistcheque: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = QryDatosDistchequeAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From DISTPAGOSXTRANSPORTISTA'
      'Where NUM_TRANS_CKS =:numtrnCks')
    Left = 536
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numtrnCks'
        ParamType = ptInput
      end>
    object QryDatosDistchequeNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DISTPAGOSXTRANSPORTISTA.NUMERO'
      Required = True
    end
    object QryDatosDistchequeFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DISTPAGOSXTRANSPORTISTA.FECHA'
      Required = True
    end
    object QryDatosDistchequeNUM_TRANS_CKS: TFloatField
      FieldName = 'NUM_TRANS_CKS'
      Origin = 'DISTPAGOSXTRANSPORTISTA.NUM_TRANS_CKS'
      Required = True
    end
    object QryDatosDistchequeCOD_FPAGO: TSmallintField
      FieldName = 'COD_FPAGO'
      Origin = 'DISTPAGOSXTRANSPORTISTA.COD_FPAGO'
      Required = True
    end
    object QryDatosDistchequeSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DISTPAGOSXTRANSPORTISTA.STATUS'
      FixedChar = True
      Size = 1
    end
    object QryDatosDistchequeFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DISTPAGOSXTRANSPORTISTA.FECHA_IN'
    end
    object QryDatosDistchequeIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DISTPAGOSXTRANSPORTISTA.IN_POR'
      Size = 12
    end
    object QryDatosDistchequeFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DISTPAGOSXTRANSPORTISTA.FECHA_MOD'
    end
    object QryDatosDistchequeMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DISTPAGOSXTRANSPORTISTA.MOD_POR'
      Size = 12
    end
    object QryDatosDistchequeTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'DISTPAGOSXTRANSPORTISTA.TIPO_NCF'
      Size = 2
    end
    object QryDatosDistchequeNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'DISTPAGOSXTRANSPORTISTA.NUMERO_NCF'
      Size = 21
    end
    object QryDatosDistchequeMONTO_ITBIS: TFloatField
      FieldName = 'MONTO_ITBIS'
      Origin = 'DISTPAGOSXTRANSPORTISTA.MONTO_ITBIS'
    end
    object QryDatosDistchequeMONTO_OTROS_IMP: TFloatField
      FieldName = 'MONTO_OTROS_IMP'
      Origin = 'DISTPAGOSXTRANSPORTISTA.MONTO_OTROS_IMP'
    end
    object QryDatosDistchequeMONTO_TOTAL: TFloatField
      FieldName = 'MONTO_TOTAL'
      Origin = 'DISTPAGOSXTRANSPORTISTA.MONTO_TOTAL'
    end
  end
  object QryDatosDistchequeDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From DISTPAGOSXTRANSPORTISTA_DET'
      'Where numero=:numero')
    Left = 624
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object QryDatosDistchequeDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DISTPAGOSXTRANSPORTISTA_DET.SERIE'
      Required = True
    end
    object QryDatosDistchequeDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DISTPAGOSXTRANSPORTISTA_DET.NUMERO'
      Required = True
    end
    object QryDatosDistchequeDetCODIGO_PROV: TIntegerField
      FieldName = 'CODIGO_PROV'
      Origin = 'DISTPAGOSXTRANSPORTISTA_DET.CODIGO_PROV'
      Required = True
    end
    object QryDatosDistchequeDetCOD_COSTO: TIntegerField
      FieldName = 'COD_COSTO'
      Origin = 'DISTPAGOSXTRANSPORTISTA_DET.COD_COSTO'
      Required = True
    end
    object QryDatosDistchequeDetCOD_DEPTO: TSmallintField
      FieldName = 'COD_DEPTO'
      Origin = 'DISTPAGOSXTRANSPORTISTA_DET.COD_DEPTO'
    end
    object QryDatosDistchequeDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DISTPAGOSXTRANSPORTISTA_DET.DESCRIPCION'
      Size = 80
    end
    object QryDatosDistchequeDetNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'DISTPAGOSXTRANSPORTISTA_DET.NUMERO_FACTURA'
    end
    object QryDatosDistchequeDetCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Origin = 'DISTPAGOSXTRANSPORTISTA_DET.CANTIDAD'
    end
    object QryDatosDistchequeDetMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'DISTPAGOSXTRANSPORTISTA_DET.MONTO'
    end
    object QryDatosDistchequeDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'DISTPAGOSXTRANSPORTISTA_DET.COD_USUARIO'
    end
    object QryDatosDistchequeDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DISTPAGOSXTRANSPORTISTA_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object QryDatosDistchequeDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DISTPAGOSXTRANSPORTISTA_DET.FECHA_IN'
    end
    object QryDatosDistchequeDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DISTPAGOSXTRANSPORTISTA_DET.IN_POR'
      Size = 12
    end
    object QryDatosDistchequeDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DISTPAGOSXTRANSPORTISTA_DET.FECHA_MOD'
    end
    object QryDatosDistchequeDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DISTPAGOSXTRANSPORTISTA_DET.MOD_POR'
      Size = 12
    end
  end
  object qryCheckSecCKS: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from PROC_CHECKSeccks(:xtipocks,:xcodbanco)')
    Left = 640
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'xtipocks'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'xcodbanco'
        ParamType = ptInput
      end>
    object qryCheckSecCKSACCION: TSmallintField
      FieldName = 'ACCION'
      Origin = 'PROC_CHECKSECCKS.ACCION'
    end
    object qryCheckSecCKSMSG: TIBStringField
      FieldName = 'MSG'
      Origin = 'PROC_CHECKSECCKS.MSG'
      Size = 80
    end
    object qryCheckSecCKSNUM_CHEQUEACTUAL: TIntegerField
      FieldName = 'NUM_CHEQUEACTUAL'
      Origin = 'PROC_CHECKSECCKS.NUM_CHEQUEACTUAL'
    end
    object qryCheckSecCKSNUMCHEQ_GENERADOR: TIntegerField
      FieldName = 'NUMCHEQ_GENERADOR'
      Origin = 'PROC_CHECKSECCKS.NUMCHEQ_GENERADOR'
    end
  end
  object qryTipoCtaBanco: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from TIPO_CTA_BANCO')
    Left = 640
    Top = 272
    object qryTipoCtaBancoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TIPO_CTA_BANCO.CODIGO'
      Required = True
    end
    object qryTipoCtaBancoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_CTA_BANCO.DESCRIPCION'
      Size = 30
    end
  end
  object ibUpdateGenNumCks: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      
        'Execute procedure PROC_GENIDNumCheque (:NUMchequeGENERADOR,:xtip' +
        'ocks,:xcodbanco)')
    Transaction = dmConectar.IBTransaction1
    Left = 640
    Top = 344
  end
end
