object dtmTransOpeDiaria: TdtmTransOpeDiaria
  OldCreateOrder = False
  Left = 242
  Top = 101
  Height = 554
  Width = 788
  object tblOrdenCompraMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblOrdenCompraMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from ORDEN_COMP_MAST'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into ORDEN_COMP_MAST'
      
        '  (NUMERO, CODIGO_PROVEE, FECHA, FPAGO, COD_CAJA_CHICA, CODIGO_B' +
        'ANCO, CUENTABANCO, '
      
        '   OBSERVACION, MONTO, STATUS, IN_POR, FECHA_IN, MOD_POR, FECHA_' +
        'MOD, TIPO_INV, '
      
        '   STATUS_CNT, NUM_ORDEN, STATUS_ORD, AREA_ORDEN, CIA_KEY, NUMER' +
        'O_NCF, '
      
        '   CODIGO_VENDEDOR, SERIE_TIPOTRNCNT, TASA_ITBIS, TASA_ISR, MONT' +
        'O_RETENER_ISR, '
      '   MONTO_RETENER_ITBIS, IDTIPO_COMPRA, FECHA_RECIBIDA)'
      'values'
      
        '  (:NUMERO, :CODIGO_PROVEE, :FECHA, :FPAGO, :COD_CAJA_CHICA, :CO' +
        'DIGO_BANCO, '
      
        '   :CUENTABANCO, :OBSERVACION, :MONTO, :STATUS, :IN_POR, :FECHA_' +
        'IN, :MOD_POR, '
      
        '   :FECHA_MOD, :TIPO_INV, :STATUS_CNT, :NUM_ORDEN, :STATUS_ORD, ' +
        ':AREA_ORDEN, '
      
        '   :CIA_KEY, :NUMERO_NCF, :CODIGO_VENDEDOR, :SERIE_TIPOTRNCNT, :' +
        'TASA_ITBIS, '
      
        '   :TASA_ISR, :MONTO_RETENER_ISR, :MONTO_RETENER_ITBIS, :IDTIPO_' +
        'COMPRA, '
      '   :FECHA_RECIBIDA)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  CODIGO_PROVEE,'
      '  FECHA,'
      '  FPAGO,'
      '  COD_CAJA_CHICA,'
      '  CODIGO_BANCO,'
      '  CUENTABANCO,'
      '  OBSERVACION,'
      '  MONTO,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD,'
      '  TIPO_INV,'
      '  STATUS_CNT,'
      '  NUM_ORDEN,'
      '  STATUS_ORD,'
      '  AREA_ORDEN,'
      '  CIA_KEY,'
      '  NUMERO_NCF,'
      '  CODIGO_VENDEDOR,'
      '  SERIE_TIPOTRNCNT,'
      '  TASA_ITBIS,'
      '  TASA_ISR,'
      '  MONTO_RETENER_ISR,'
      '  MONTO_RETENER_ITBIS,'
      '  IDTIPO_COMPRA,'
      '  FECHA_RECIBIDA'
      'from ORDEN_COMP_MAST '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select * From ORDEN_COMP_MAST'
      'Where fecha between :fechaini and :fechafin'
      ''
      '')
    ModifySQL.Strings = (
      'update ORDEN_COMP_MAST'
      'set'
      '  NUMERO = :NUMERO,'
      '  CODIGO_PROVEE = :CODIGO_PROVEE,'
      '  FECHA = :FECHA,'
      '  FPAGO = :FPAGO,'
      '  COD_CAJA_CHICA = :COD_CAJA_CHICA,'
      '  CODIGO_BANCO = :CODIGO_BANCO,'
      '  CUENTABANCO = :CUENTABANCO,'
      '  OBSERVACION = :OBSERVACION,'
      '  MONTO = :MONTO,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  TIPO_INV = :TIPO_INV,'
      '  STATUS_CNT = :STATUS_CNT,'
      '  NUM_ORDEN = :NUM_ORDEN,'
      '  STATUS_ORD = :STATUS_ORD,'
      '  AREA_ORDEN = :AREA_ORDEN,'
      '  CIA_KEY = :CIA_KEY,'
      '  NUMERO_NCF = :NUMERO_NCF,'
      '  CODIGO_VENDEDOR = :CODIGO_VENDEDOR,'
      '  SERIE_TIPOTRNCNT = :SERIE_TIPOTRNCNT,'
      '  TASA_ITBIS = :TASA_ITBIS,'
      '  TASA_ISR = :TASA_ISR,'
      '  MONTO_RETENER_ISR = :MONTO_RETENER_ISR,'
      '  MONTO_RETENER_ITBIS = :MONTO_RETENER_ITBIS,'
      '  IDTIPO_COMPRA = :IDTIPO_COMPRA,'
      '  FECHA_RECIBIDA = :FECHA_RECIBIDA'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_NUM_ORDEN_MAST'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 88
    Top = 16
    object tblOrdenCompraMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'ORDEN_COMP_MAST.NUMERO'
      Required = True
    end
    object tblOrdenCompraMasterCODIGO_PROVEE: TIntegerField
      FieldName = 'CODIGO_PROVEE'
      Origin = 'ORDEN_COMP_MAST.CODIGO_PROVEE'
      Required = True
    end
    object tblOrdenCompraMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ORDEN_COMP_MAST.FECHA'
      Required = True
    end
    object tblOrdenCompraMasterFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'ORDEN_COMP_MAST.FPAGO'
    end
    object tblOrdenCompraMasterCOD_CAJA_CHICA: TIntegerField
      FieldName = 'COD_CAJA_CHICA'
      Origin = 'ORDEN_COMP_MAST.COD_CAJA_CHICA'
    end
    object tblOrdenCompraMasterCODIGO_BANCO: TIntegerField
      FieldName = 'CODIGO_BANCO'
      Origin = 'ORDEN_COMP_MAST.CODIGO_BANCO'
    end
    object tblOrdenCompraMasterCUENTABANCO: TIBStringField
      FieldName = 'CUENTABANCO'
      Origin = 'ORDEN_COMP_MAST.CUENTABANCO'
    end
    object tblOrdenCompraMasterOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'ORDEN_COMP_MAST.OBSERVACION'
      Size = 40
    end
    object tblOrdenCompraMasterMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'ORDEN_COMP_MAST.MONTO'
      DisplayFormat = ',0.00'
    end
    object tblOrdenCompraMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ORDEN_COMP_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblOrdenCompraMasterIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ORDEN_COMP_MAST.IN_POR'
      Size = 12
    end
    object tblOrdenCompraMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ORDEN_COMP_MAST.FECHA_IN'
    end
    object tblOrdenCompraMasterMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'ORDEN_COMP_MAST.MOD_POR'
      Size = 12
    end
    object tblOrdenCompraMasterFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'ORDEN_COMP_MAST.FECHA_MOD'
    end
    object tblOrdenCompraMasterTIPO_INV: TSmallintField
      FieldName = 'TIPO_INV'
      Origin = 'ORDEN_COMP_MAST.TIPO_INV'
    end
    object tblOrdenCompraMasterSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'ORDEN_COMP_MAST.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object tblOrdenCompraMasterNUM_ORDEN: TIntegerField
      FieldName = 'NUM_ORDEN'
      Origin = 'ORDEN_COMP_MAST.NUM_ORDEN'
    end
    object tblOrdenCompraMasterSTATUS_ORD: TIBStringField
      FieldName = 'STATUS_ORD'
      Origin = 'ORDEN_COMP_MAST.STATUS_ORD'
      FixedChar = True
      Size = 1
    end
    object tblOrdenCompraMasterAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'ORDEN_COMP_MAST.AREA_ORDEN'
    end
    object tblOrdenCompraMasterCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'ORDEN_COMP_MAST.CIA_KEY'
    end
    object tblOrdenCompraMasterNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'ORDEN_COMP_MAST.NUMERO_NCF'
      Size = 21
    end
    object tblOrdenCompraMasterCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'ORDEN_COMP_MAST.CODIGO_VENDEDOR'
    end
    object tblOrdenCompraMasterSERIE_TIPOTRNCNT: TIntegerField
      FieldName = 'SERIE_TIPOTRNCNT'
      Origin = 'ORDEN_COMP_MAST.SERIE_TIPOTRNCNT'
    end
    object tblOrdenCompraMasterTASA_ITBIS: TFloatField
      FieldName = 'TASA_ITBIS'
      Origin = 'ORDEN_COMP_MAST.TASA_ITBIS'
    end
    object tblOrdenCompraMasterTASA_ISR: TFloatField
      FieldName = 'TASA_ISR'
      Origin = 'ORDEN_COMP_MAST.TASA_ISR'
    end
    object tblOrdenCompraMasterMONTO_RETENER_ISR: TFloatField
      FieldName = 'MONTO_RETENER_ISR'
      Origin = 'ORDEN_COMP_MAST.MONTO_RETENER_ISR'
    end
    object tblOrdenCompraMasterMONTO_RETENER_ITBIS: TFloatField
      FieldName = 'MONTO_RETENER_ITBIS'
      Origin = 'ORDEN_COMP_MAST.MONTO_RETENER_ITBIS'
    end
    object tblOrdenCompraMasterIDTIPO_COMPRA: TIntegerField
      FieldName = 'IDTIPO_COMPRA'
      Origin = 'ORDEN_COMP_MAST.IDTIPO_COMPRA'
    end
    object tblOrdenCompraMasterFECHA_RECIBIDA: TDateTimeField
      FieldName = 'FECHA_RECIBIDA'
      Origin = 'ORDEN_COMP_MAST.FECHA_RECIBIDA'
    end
  end
  object dstblRegTransOpeDiariaMast: TDataSource
    AutoEdit = False
    DataSet = tblRegTransOpeDiariaMast
    Left = 224
    Top = 304
  end
  object tblRegTransOpeDiariaDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterPost = tblRegTransOpeDiariaDetAfterPost
    BeforePost = tblRegTransOpeDiariaDetBeforePost
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TRANS_OPERACION_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into TRANS_OPERACION_DET'
      
        '  (SERIE, NUMERO, COD_SERV_PROD, DEPARTAMENTO, OBSERVACION, CANT' +
        'IDAD, PRECIO, '
      
        '   VALOR, NUMERO_DOCUMENTO, NUMERO_FACTURA, COD_CTA_CONCEPTO, CO' +
        'DIGO_USUARIO, '
      
        '   STATUS, IN_POR, FECHA_IN, MOD_POR, FECHA_MOD, MONTO_ITBIS, ID' +
        'TASAITBIS, '
      '   FICHA_VEH)'
      'values'
      
        '  (:SERIE, :NUMERO, :COD_SERV_PROD, :DEPARTAMENTO, :OBSERVACION,' +
        ' :CANTIDAD, '
      
        '   :PRECIO, :VALOR, :NUMERO_DOCUMENTO, :NUMERO_FACTURA, :COD_CTA' +
        '_CONCEPTO, '
      
        '   :CODIGO_USUARIO, :STATUS, :IN_POR, :FECHA_IN, :MOD_POR, :FECH' +
        'A_MOD, '
      '   :MONTO_ITBIS, :IDTASAITBIS, :FICHA_VEH)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  COD_SERV_PROD,'
      '  DEPARTAMENTO,'
      '  OBSERVACION,'
      '  CANTIDAD,'
      '  PRECIO,'
      '  VALOR,'
      '  NUMERO_DOCUMENTO,'
      '  NUMERO_FACTURA,'
      '  COD_CTA_CONCEPTO,'
      '  CODIGO_USUARIO,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD,'
      '  RCXP,'
      '  MONTO_ITBIS,'
      '  IDTASAITBIS,'
      '  FICHA_VEH'
      'from TRANS_OPERACION_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'SELECT * FROM TRANS_OPERACION_DET'
      'WHERE  Numero =:Numero')
    ModifySQL.Strings = (
      'update TRANS_OPERACION_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  COD_SERV_PROD = :COD_SERV_PROD,'
      '  DEPARTAMENTO = :DEPARTAMENTO,'
      '  OBSERVACION = :OBSERVACION,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO = :PRECIO,'
      '  VALOR = :VALOR,'
      '  NUMERO_DOCUMENTO = :NUMERO_DOCUMENTO,'
      '  NUMERO_FACTURA = :NUMERO_FACTURA,'
      '  COD_CTA_CONCEPTO = :COD_CTA_CONCEPTO,'
      '  CODIGO_USUARIO = :CODIGO_USUARIO,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MONTO_ITBIS = :MONTO_ITBIS,'
      '  IDTASAITBIS = :IDTASAITBIS,'
      '  FICHA_VEH = :FICHA_VEH'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_num_ope_det'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 256
    Top = 16
    object tblRegTransOpeDiariaDetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'TRANS_OPERACION_DET.SERIE'
      Required = True
    end
    object tblRegTransOpeDiariaDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TRANS_OPERACION_DET.NUMERO'
      Required = True
    end
    object tblRegTransOpeDiariaDetCOD_SERV_PROD: TIntegerField
      FieldName = 'COD_SERV_PROD'
      Origin = 'TRANS_OPERACION_DET.COD_SERV_PROD'
    end
    object tblRegTransOpeDiariaDetDEPARTAMENTO: TIntegerField
      FieldName = 'DEPARTAMENTO'
      Origin = 'TRANS_OPERACION_DET.DEPARTAMENTO'
    end
    object tblRegTransOpeDiariaDetOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'TRANS_OPERACION_DET.OBSERVACION'
      Size = 40
    end
    object tblRegTransOpeDiariaDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'TRANS_OPERACION_DET.CANTIDAD'
      OnChange = tblRegTransOpeDiariaDetCANTIDADChange
      DisplayFormat = ',0.00'
    end
    object tblRegTransOpeDiariaDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'TRANS_OPERACION_DET.PRECIO'
      OnChange = tblRegTransOpeDiariaDetCANTIDADChange
      DisplayFormat = ',0.00'
    end
    object tblRegTransOpeDiariaDetVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'TRANS_OPERACION_DET.VALOR'
      DisplayFormat = ',0.00'
    end
    object tblRegTransOpeDiariaDetNUMERO_DOCUMENTO: TIntegerField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'TRANS_OPERACION_DET.NUMERO_DOCUMENTO'
    end
    object tblRegTransOpeDiariaDetNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'TRANS_OPERACION_DET.NUMERO_FACTURA'
    end
    object tblRegTransOpeDiariaDetCOD_CTA_CONCEPTO: TIntegerField
      FieldName = 'COD_CTA_CONCEPTO'
      Origin = 'TRANS_OPERACION_DET.COD_CTA_CONCEPTO'
    end
    object tblRegTransOpeDiariaDetCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'TRANS_OPERACION_DET.CODIGO_USUARIO'
    end
    object tblRegTransOpeDiariaDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRANS_OPERACION_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblRegTransOpeDiariaDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TRANS_OPERACION_DET.IN_POR'
      Size = 12
    end
    object tblRegTransOpeDiariaDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TRANS_OPERACION_DET.FECHA_IN'
    end
    object tblRegTransOpeDiariaDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'TRANS_OPERACION_DET.MOD_POR'
      Size = 12
    end
    object tblRegTransOpeDiariaDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'TRANS_OPERACION_DET.FECHA_MOD'
    end
    object tblRegTransOpeDiariaDetMONTO_ITBIS: TFloatField
      FieldName = 'MONTO_ITBIS'
      Origin = 'TRANS_OPERACION_DET.MONTO_ITBIS'
    end
    object tblRegTransOpeDiariaDetIDTASAITBIS: TIntegerField
      FieldName = 'IDTASAITBIS'
      Origin = 'TRANS_OPERACION_DET.IDTASAITBIS'
    end
    object tblRegTransOpeDiariaDetFICHA_VEH: TIntegerField
      FieldName = 'FICHA_VEH'
      Origin = 'TRANS_OPERACION_DET.FICHA_VEH'
    end
  end
  object dstblRegTransOpeDiariaDet: TDataSource
    AutoEdit = False
    DataSet = tblRegTransOpeDiariaDet
    Left = 256
    Top = 64
  end
  object tblCondicion: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CONDICION'
    Left = 104
    Top = 120
    object tblCondicionCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblCondicionDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
    end
  end
  object dstblCondicion: TDataSource
    DataSet = tblCondicion
    Left = 104
    Top = 168
  end
  object tblProveedores: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PROVEEDORES'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    InsertSQL.Strings = (
      'insert into PROVEEDORES'
      
        '  (CODIGO_CTE, TIPO_CLIENTE, NOMBRE_ABR, DESCRIPCION, CONTACTO, ' +
        'PAIS, ESTADO, '
      
        '   CIUDAD, CALYYNUM, TELEFONO, FAX, CODIGOPOSTAL, EMAIL, DIRECCI' +
        'ONWEB, '
      
        '   STATUS, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, RNC_PROVEEDOR, ' +
        'MOVIL1, '
      
        '   MOVIL2, TELEFONO2, TELEFONO3, EXTENSIONES, CIA_KEY, LIMITE_CR' +
        'EDITO, '
      
        '   COD_VENDEDOR, CONDICION, CANT_DIAS_CREDITO, IDTIPO_PROV, TIPO' +
        'DOC, ID_PROVINCIA, '
      '   ID_MUNICIPIO)'
      'values'
      
        '  (:CODIGO_CTE, :TIPO_CLIENTE, :NOMBRE_ABR, :DESCRIPCION, :CONTA' +
        'CTO, :PAIS, '
      
        '   :ESTADO, :CIUDAD, :CALYYNUM, :TELEFONO, :FAX, :CODIGOPOSTAL, ' +
        ':EMAIL, '
      
        '   :DIRECCIONWEB, :STATUS, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_' +
        'POR, :RNC_PROVEEDOR, '
      
        '   :MOVIL1, :MOVIL2, :TELEFONO2, :TELEFONO3, :EXTENSIONES, :CIA_' +
        'KEY, :LIMITE_CREDITO, '
      
        '   :COD_VENDEDOR, :CONDICION, :CANT_DIAS_CREDITO, :IDTIPO_PROV, ' +
        ':TIPODOC, '
      '   :ID_PROVINCIA, :ID_MUNICIPIO)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_CTE,'
      '  TIPO_CLIENTE,'
      '  NOMBRE_ABR,'
      '  DESCRIPCION,'
      '  CONTACTO,'
      '  PAIS,'
      '  ESTADO,'
      '  CIUDAD,'
      '  CALYYNUM,'
      '  TELEFONO,'
      '  FAX,'
      '  CODIGOPOSTAL,'
      '  EMAIL,'
      '  DIRECCIONWEB,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  RNC_PROVEEDOR,'
      '  MOVIL1,'
      '  MOVIL2,'
      '  TELEFONO2,'
      '  TELEFONO3,'
      '  EXTENSIONES,'
      '  CIA_KEY,'
      '  LIMITE_CREDITO,'
      '  COD_VENDEDOR,'
      '  CONDICION,'
      '  CANT_DIAS_CREDITO,'
      '  IDTIPO_PROV,'
      '  TIPODOC,'
      '  ID_PROVINCIA,'
      '  ID_MUNICIPIO'
      'from PROVEEDORES '
      'where'
      '  CODIGO_CTE = :CODIGO_CTE')
    SelectSQL.Strings = (
      'select  * from PROVEEDORES'
      '')
    ModifySQL.Strings = (
      'update PROVEEDORES'
      'set'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  TIPO_CLIENTE = :TIPO_CLIENTE,'
      '  NOMBRE_ABR = :NOMBRE_ABR,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  CONTACTO = :CONTACTO,'
      '  PAIS = :PAIS,'
      '  ESTADO = :ESTADO,'
      '  CIUDAD = :CIUDAD,'
      '  CALYYNUM = :CALYYNUM,'
      '  TELEFONO = :TELEFONO,'
      '  FAX = :FAX,'
      '  CODIGOPOSTAL = :CODIGOPOSTAL,'
      '  EMAIL = :EMAIL,'
      '  DIRECCIONWEB = :DIRECCIONWEB,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  RNC_PROVEEDOR = :RNC_PROVEEDOR,'
      '  MOVIL1 = :MOVIL1,'
      '  MOVIL2 = :MOVIL2,'
      '  TELEFONO2 = :TELEFONO2,'
      '  TELEFONO3 = :TELEFONO3,'
      '  EXTENSIONES = :EXTENSIONES,'
      '  CIA_KEY = :CIA_KEY,'
      '  LIMITE_CREDITO = :LIMITE_CREDITO,'
      '  COD_VENDEDOR = :COD_VENDEDOR,'
      '  CONDICION = :CONDICION,'
      '  CANT_DIAS_CREDITO = :CANT_DIAS_CREDITO,'
      '  IDTIPO_PROV = :IDTIPO_PROV,'
      '  TIPODOC = :TIPODOC,'
      '  ID_PROVINCIA = :ID_PROVINCIA,'
      '  ID_MUNICIPIO = :ID_MUNICIPIO'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    GeneratorField.Field = 'CODIGO_CTE'
    GeneratorField.Generator = 'GEN_COD_PROVEEDOR'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 192
    Top = 120
    object tblProveedoresCODIGO_CTE: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_CTE'
      Origin = 'PROVEEDORES.CODIGO_CTE'
      Required = True
    end
    object tblProveedoresTIPO_CLIENTE: TIntegerField
      DisplayLabel = 'TipoCte'
      FieldName = 'TIPO_CLIENTE'
      Origin = 'PROVEEDORES.TIPO_CLIENTE'
    end
    object tblProveedoresDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 40
    end
    object tblProveedoresCONTACTO: TIBStringField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
      Origin = 'PROVEEDORES.CONTACTO'
      Size = 35
    end
    object tblProveedoresPAIS: TIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Origin = 'PROVEEDORES.PAIS'
      Size = 30
    end
    object tblProveedoresESTADO: TIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Origin = 'PROVEEDORES.ESTADO'
      Size = 30
    end
    object tblProveedoresCIUDAD: TIBStringField
      DisplayLabel = 'Ciudad'
      FieldName = 'CIUDAD'
      Origin = 'PROVEEDORES.CIUDAD'
    end
    object tblProveedoresCALYYNUM: TIBStringField
      DisplayLabel = 'Cally y Numero'
      FieldName = 'CALYYNUM'
      Origin = 'PROVEEDORES.CALYYNUM'
      Size = 35
    end
    object tblProveedoresTELEFONO: TIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object tblProveedoresFAX: TIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Origin = 'PROVEEDORES.FAX'
      Size = 12
    end
    object tblProveedoresCODIGOPOSTAL: TIBStringField
      DisplayLabel = 'Codigo Postal'
      FieldName = 'CODIGOPOSTAL'
      Origin = 'PROVEEDORES.CODIGOPOSTAL'
      FixedChar = True
      Size = 6
    end
    object tblProveedoresEMAIL: TIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Origin = 'PROVEEDORES.EMAIL'
      Size = 40
    end
    object tblProveedoresDIRECCIONWEB: TIBStringField
      DisplayLabel = 'Sitio Web'
      FieldName = 'DIRECCIONWEB'
      Origin = 'PROVEEDORES.DIRECCIONWEB'
      Size = 40
    end
    object tblProveedoresSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'PROVEEDORES.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblProveedoresFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PROVEEDORES.FECHA_IN'
    end
    object tblProveedoresIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PROVEEDORES.IN_POR'
      Size = 12
    end
    object tblProveedoresFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PROVEEDORES.FECHA_MOD'
    end
    object tblProveedoresMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PROVEEDORES.MOD_POR'
      Size = 12
    end
    object tblProveedoresRNC_PROVEEDOR: TIBStringField
      FieldName = 'RNC_PROVEEDOR'
      Origin = 'PROVEEDORES.RNC_PROVEEDOR'
      Size = 15
    end
    object tblProveedoresMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'PROVEEDORES.MOVIL1'
    end
    object tblProveedoresMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'PROVEEDORES.MOVIL2'
    end
    object tblProveedoresTELEFONO2: TIBStringField
      FieldName = 'TELEFONO2'
      Origin = 'PROVEEDORES.TELEFONO2'
    end
    object tblProveedoresTELEFONO3: TIBStringField
      FieldName = 'TELEFONO3'
      Origin = 'PROVEEDORES.TELEFONO3'
    end
    object tblProveedoresEXTENSIONES: TIBStringField
      FieldName = 'EXTENSIONES'
      Origin = 'PROVEEDORES.EXTENSIONES'
      Size = 40
    end
    object tblProveedoresNOMBRE_ABR: TIBStringField
      FieldName = 'NOMBRE_ABR'
      Origin = 'PROVEEDORES.NOMBRE_ABR'
      Size = 40
    end
    object tblProveedoresCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'PROVEEDORES.COD_VENDEDOR'
    end
    object tblProveedoresCONDICION: TIntegerField
      FieldName = 'CONDICION'
      Origin = 'PROVEEDORES.CONDICION'
    end
    object tblProveedoresCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'PROVEEDORES.CANT_DIAS_CREDITO'
    end
    object tblProveedoresLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'PROVEEDORES.LIMITE_CREDITO'
    end
    object tblProveedoresIDTIPO_PROV: TIntegerField
      FieldName = 'IDTIPO_PROV'
      Origin = 'PROVEEDORES.IDTIPO_PROV'
    end
    object tblProveedoresTIPODOC: TSmallintField
      FieldName = 'TIPODOC'
      Origin = 'PROVEEDORES.TIPODOC'
    end
    object tblProveedoresCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'PROVEEDORES.CIA_KEY'
    end
    object tblProveedoresID_PROVINCIA: TIntegerField
      FieldName = 'ID_PROVINCIA'
      Origin = 'PROVEEDORES.ID_PROVINCIA'
    end
    object tblProveedoresID_MUNICIPIO: TIntegerField
      FieldName = 'ID_MUNICIPIO'
      Origin = 'PROVEEDORES.ID_MUNICIPIO'
    end
  end
  object qryProveedor: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from Proveedores')
    Left = 192
    Top = 176
    object qryProveedorCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROVEEDORES.CODIGO_CTE'
      Required = True
    end
    object qryProveedorTIPO_CLIENTE: TIntegerField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'PROVEEDORES.TIPO_CLIENTE'
    end
    object qryProveedorCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'PROVEEDORES.CONTACTO'
      Size = 35
    end
    object qryProveedorPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PROVEEDORES.PAIS'
      Size = 30
    end
    object qryProveedorESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'PROVEEDORES.ESTADO'
      Size = 30
    end
    object qryProveedorCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROVEEDORES.CIUDAD'
    end
    object qryProveedorCALYYNUM: TIBStringField
      FieldName = 'CALYYNUM'
      Origin = 'PROVEEDORES.CALYYNUM'
      Size = 35
    end
    object qryProveedorTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object qryProveedorFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'PROVEEDORES.FAX'
      Size = 12
    end
    object qryProveedorCODIGOPOSTAL: TIBStringField
      FieldName = 'CODIGOPOSTAL'
      Origin = 'PROVEEDORES.CODIGOPOSTAL'
      FixedChar = True
      Size = 6
    end
    object qryProveedorEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'PROVEEDORES.EMAIL'
      Size = 40
    end
    object qryProveedorDIRECCIONWEB: TIBStringField
      FieldName = 'DIRECCIONWEB'
      Origin = 'PROVEEDORES.DIRECCIONWEB'
      Size = 40
    end
    object qryProveedorSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROVEEDORES.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryProveedorFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PROVEEDORES.FECHA_IN'
    end
    object qryProveedorIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PROVEEDORES.IN_POR'
      Size = 12
    end
    object qryProveedorFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PROVEEDORES.FECHA_MOD'
    end
    object qryProveedorMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PROVEEDORES.MOD_POR'
      Size = 12
    end
    object qryProveedorNOMBRE_ABR: TIBStringField
      FieldName = 'NOMBRE_ABR'
      Origin = 'PROVEEDORES.NOMBRE_ABR'
      Size = 60
    end
    object qryProveedorRNC_PROVEEDOR: TIBStringField
      FieldName = 'RNC_PROVEEDOR'
      Origin = 'PROVEEDORES.RNC_PROVEEDOR'
      Size = 15
    end
    object qryProveedorMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'PROVEEDORES.MOVIL1'
    end
    object qryProveedorMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'PROVEEDORES.MOVIL2'
    end
    object qryProveedorTELEFONO2: TIBStringField
      FieldName = 'TELEFONO2'
      Origin = 'PROVEEDORES.TELEFONO2'
    end
    object qryProveedorTELEFONO3: TIBStringField
      FieldName = 'TELEFONO3'
      Origin = 'PROVEEDORES.TELEFONO3'
    end
    object qryProveedorEXTENSIONES: TIBStringField
      FieldName = 'EXTENSIONES'
      Origin = 'PROVEEDORES.EXTENSIONES'
      Size = 40
    end
    object qryProveedorCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'PROVEEDORES.CIA_KEY'
    end
    object qryProveedorDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object qryProveedorLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'PROVEEDORES.LIMITE_CREDITO'
    end
    object qryProveedorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'PROVEEDORES.COD_VENDEDOR'
    end
    object qryProveedorCONDICION: TIntegerField
      FieldName = 'CONDICION'
      Origin = 'PROVEEDORES.CONDICION'
    end
    object qryProveedorCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'PROVEEDORES.CANT_DIAS_CREDITO'
    end
    object qryProveedorIDTIPO_PROV: TIntegerField
      FieldName = 'IDTIPO_PROV'
      Origin = 'PROVEEDORES.IDTIPO_PROV'
    end
    object qryProveedorTIPODOC: TSmallintField
      FieldName = 'TIPODOC'
      Origin = 'PROVEEDORES.TIPODOC'
    end
  end
  object dsqryProveedor: TDataSource
    DataSet = qryProveedor
    Left = 280
    Top = 176
  end
  object qryCentroCostos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  * from CENTRO_COSTO'
      'order by nombre')
    Left = 368
    Top = 120
  end
  object dsqryCentroCostos: TDataSource
    DataSet = qryCentroCostos
    Left = 368
    Top = 173
  end
  object qryDeptos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from DEPTOS')
    Left = 272
    Top = 120
    object qryDeptosCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'DEPTOS.CODIGO'
      Required = True
    end
    object qryDeptosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'DEPTOS.NOMBRE'
      Size = 40
    end
    object qryDeptosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DEPTOS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDeptosFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DEPTOS.FECHA_IN'
    end
    object qryDeptosIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DEPTOS.IN_POR'
      Size = 12
    end
    object qryDeptosFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DEPTOS.FECHA_MOD'
    end
    object qryDeptosMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DEPTOS.MOD_POR'
      Size = 12
    end
  end
  object dsqryDeptos: TDataSource
    DataSet = qryDeptos
    Left = 368
    Top = 72
  end
  object qryProdServicio: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PRODUCTOS'
      'order by descripcion')
    Left = 416
    Top = 225
  end
  object dsqryProdServicio: TDataSource
    DataSet = qryProdServicio
    Left = 456
    Top = 287
  end
  object tblProductosServicios: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PRODUCTOS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into PRODUCTOS'
      '  (CODIGO, DESCRIPCION)'
      'values'
      '  (:CODIGO, :DESCRIPCION)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  DESCRIPCION'
      'from PRODUCTOS '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'select * from PRODUCTOS')
    ModifySQL.Strings = (
      'update PRODUCTOS'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRIPCION = :DESCRIPCION'
      'where'
      '  CODIGO = :OLD_CODIGO')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_CODIGO_PROD'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 96
    Top = 216
    object tblProductosServiciosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'PRODUCTOS.CODIGO'
      Required = True
    end
    object tblProductosServiciosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PRODUCTOS.DESCRIPCION'
      Size = 40
    end
  end
  object dstblProductosServicios: TDataSource
    DataSet = tblProductosServicios
    Left = 72
    Top = 272
  end
  object tblCentroDeCostos: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = tblCentroDeCostosCalcFields
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
        Size = 30
      end
      item
        Name = 'CODDGII'
        DataType = ftInteger
      end
      item
        Name = 'CUENTAXPAGAR'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'CUENTA_GASTO'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'CUENTAITBCXP'
        DataType = ftString
        Size = 9
      end>
    IndexDefs = <
      item
        Name = 'CENTRO_COSTOINDEX1'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY46'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'CENTRO_COSTO'
    Left = 312
    Top = 232
    object tblCentroDeCostosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblCentroDeCostosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 30
    end
    object tblCentroDeCostosCODDGII: TIntegerField
      FieldName = 'CODDGII'
    end
    object tblCentroDeCostosCUENTAXPAGAR: TIBStringField
      FieldName = 'CUENTAXPAGAR'
      Size = 9
    end
    object tblCentroDeCostosCUENTA_GASTO: TIBStringField
      FieldName = 'CUENTA_GASTO'
      Size = 9
    end
    object tblCentroDeCostosNombreCtaXPagar: TIBStringField
      FieldKind = fkCalculated
      FieldName = 'NombreCtaXPagar'
      Size = 80
      Calculated = True
    end
    object tblCentroDeCostosNombreCtaGastos: TIBStringField
      FieldKind = fkCalculated
      FieldName = 'NombreCtaGastos'
      Size = 80
      Calculated = True
    end
    object tblCentroDeCostosCUENTAITBCXP: TIBStringField
      FieldName = 'CUENTAITBCXP'
      Size = 9
    end
    object tblCentroDeCostosNombreCtaItbisXPagar: TStringField
      FieldKind = fkCalculated
      FieldName = 'NombreCtaItbisXPagar'
      Size = 80
      Calculated = True
    end
  end
  object dstblCentroDeCostos: TDataSource
    DataSet = tblCentroDeCostos
    Left = 344
    Top = 288
  end
  object tblCargoEmp: TIBTable
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
        Name = 'NOMBRE'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'STATUS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IN_POR'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'FECHA_IN'
        DataType = ftDateTime
      end
      item
        Name = 'MOD_POR'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'FECHA_MOD'
        DataType = ftDateTime
      end>
    StoreDefs = True
    TableName = 'CARGO_EMPLEADOS'
    Left = 32
    Top = 120
    object tblCargoEmpCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object tblCargoEmpNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 40
    end
    object tblCargoEmpSTATUS: TIBStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object tblCargoEmpIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Size = 12
    end
    object tblCargoEmpFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
    end
    object tblCargoEmpMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Size = 12
    end
    object tblCargoEmpFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
    end
  end
  object dstblCargoEmp: TDataSource
    DataSet = tblCargoEmp
    Left = 32
    Top = 176
  end
  object tblTurno: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TURNO'
    Left = 448
    Top = 72
    object tblTurnoCODIGO_TURNO: TIntegerField
      FieldName = 'CODIGO_TURNO'
    end
    object tblTurnoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
    object tblTurnoHORAINI: TDateTimeField
      FieldName = 'HORAINI'
      DisplayFormat = 'hh:mma/p'
    end
    object tblTurnoHORAFIN: TDateTimeField
      FieldName = 'HORAFIN'
      DisplayFormat = 'hh:mma/p'
    end
    object tblTurnoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object dstblTurno: TDataSource
    DataSet = tblTurno
    Left = 448
    Top = 120
  end
  object qryGetFechaOrden: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select fecha from ORDEN_COMP_MAST'
      'where num_orden=:numorden')
    Left = 56
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numorden'
        ParamType = ptInput
      end>
    object qryGetFechaOrdenFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ORDEN_COMP_MAST.FECHA'
      Required = True
    end
  end
  object tblRegTransOpeDiariaMast: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblRegTransOpeDiariaMastAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TRANS_OPERACION_MASTER'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into TRANS_OPERACION_MASTER'
      
        '  (NUMERO, COD_PROVEEDOR, FECHA, CIA_KEY, FPAGO, OBSERVACION, MO' +
        'NTO, STATUS, '
      
        '   STATUS_CNT, IN_POR, FECHA_IN, MOD_POR, FECHA_MOD, FECHA_VENCE' +
        ', NUMERO_NCF, '
      '   TIPO_CF, RCNT, RCXP, IDTIPO_COMPRA, IDCODIGO_TPAGODGII)'
      'values'
      
        '  (:NUMERO, :COD_PROVEEDOR, :FECHA, :CIA_KEY, :FPAGO, :OBSERVACI' +
        'ON, :MONTO, '
      
        '   :STATUS, :STATUS_CNT, :IN_POR, :FECHA_IN, :MOD_POR, :FECHA_MO' +
        'D, :FECHA_VENCE, '
      
        '   :NUMERO_NCF, :TIPO_CF, :RCNT, :RCXP, :IDTIPO_COMPRA, :IDCODIG' +
        'O_TPAGODGII)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  COD_PROVEEDOR,'
      '  FECHA,'
      '  CIA_KEY,'
      '  FPAGO,'
      '  OBSERVACION,'
      '  MONTO,'
      '  STATUS,'
      '  STATUS_CNT,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD,'
      '  FECHA_VENCE,'
      '  NUMERO_NCF,'
      '  TIPO_CF,'
      '  RCNT,'
      '  RCXP,'
      '  IDTIPO_COMPRA,'
      '  IDCODIGO_TPAGODGII'
      'from TRANS_OPERACION_MASTER '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'select * from TRANS_OPERACION_MASTER'
      'Where fecha between :fechaini and :fechafin'
      'order by cia_key, fecha, numero')
    ModifySQL.Strings = (
      'update TRANS_OPERACION_MASTER'
      'set'
      '  NUMERO = :NUMERO,'
      '  COD_PROVEEDOR = :COD_PROVEEDOR,'
      '  FECHA = :FECHA,'
      '  CIA_KEY = :CIA_KEY,'
      '  FPAGO = :FPAGO,'
      '  OBSERVACION = :OBSERVACION,'
      '  MONTO = :MONTO,'
      '  STATUS = :STATUS,'
      '  STATUS_CNT = :STATUS_CNT,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  FECHA_VENCE = :FECHA_VENCE,'
      '  NUMERO_NCF = :NUMERO_NCF,'
      '  TIPO_CF = :TIPO_CF,'
      '  RCNT = :RCNT,'
      '  RCXP = :RCXP,'
      '  IDTIPO_COMPRA = :IDTIPO_COMPRA,'
      '  IDCODIGO_TPAGODGII = :IDCODIGO_TPAGODGII'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_num_ope_master'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 192
    Top = 248
    object tblRegTransOpeDiariaMastNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TRANS_OPERACION_MASTER.NUMERO'
      Required = True
    end
    object tblRegTransOpeDiariaMastCOD_PROVEEDOR: TIntegerField
      FieldName = 'COD_PROVEEDOR'
      Origin = 'TRANS_OPERACION_MASTER.COD_PROVEEDOR'
      Required = True
    end
    object tblRegTransOpeDiariaMastFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'TRANS_OPERACION_MASTER.FECHA'
      Required = True
    end
    object tblRegTransOpeDiariaMastCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'TRANS_OPERACION_MASTER.CIA_KEY'
    end
    object tblRegTransOpeDiariaMastFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'TRANS_OPERACION_MASTER.FPAGO'
    end
    object tblRegTransOpeDiariaMastOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'TRANS_OPERACION_MASTER.OBSERVACION'
      Size = 40
    end
    object tblRegTransOpeDiariaMastMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'TRANS_OPERACION_MASTER.MONTO'
    end
    object tblRegTransOpeDiariaMastSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRANS_OPERACION_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblRegTransOpeDiariaMastSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'TRANS_OPERACION_MASTER.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object tblRegTransOpeDiariaMastIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TRANS_OPERACION_MASTER.IN_POR'
      Size = 12
    end
    object tblRegTransOpeDiariaMastFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TRANS_OPERACION_MASTER.FECHA_IN'
    end
    object tblRegTransOpeDiariaMastMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'TRANS_OPERACION_MASTER.MOD_POR'
      Size = 12
    end
    object tblRegTransOpeDiariaMastFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'TRANS_OPERACION_MASTER.FECHA_MOD'
    end
    object tblRegTransOpeDiariaMastRCXP: TIBStringField
      FieldName = 'RCXP'
      Origin = 'TRANS_OPERACION_MASTER.RCXP'
      FixedChar = True
      Size = 1
    end
    object tblRegTransOpeDiariaMastTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Origin = 'TRANS_OPERACION_MASTER.TIPO_CF'
      FixedChar = True
      Size = 2
    end
    object tblRegTransOpeDiariaMastRCNT: TIBStringField
      FieldName = 'RCNT'
      Origin = 'TRANS_OPERACION_MASTER.RCNT'
      FixedChar = True
      Size = 2
    end
    object tblRegTransOpeDiariaMastNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'TRANS_OPERACION_MASTER.NUMERO_NCF'
      Size = 21
    end
    object tblRegTransOpeDiariaMastFECHA_VENCE: TDateTimeField
      FieldName = 'FECHA_VENCE'
      Origin = 'TRANS_OPERACION_MASTER.FECHA_VENCE'
    end
    object tblRegTransOpeDiariaMastIDTIPO_COMPRA: TIntegerField
      FieldName = 'IDTIPO_COMPRA'
      Origin = 'TRANS_OPERACION_MASTER.IDTIPO_COMPRA'
    end
    object tblRegTransOpeDiariaMastIDCODIGO_TPAGODGII: TSmallintField
      FieldName = 'IDCODIGO_TPAGODGII'
      Origin = 'TRANS_OPERACION_MASTER.IDCODIGO_TPAGODGII'
    end
  end
  object tblOrdenCompraDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblOrdenCompraDetAfterScroll
    BeforePost = tblOrdenCompraDetBeforePost
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from ORDEN_COMP_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into ORDEN_COMP_DET'
      
        '  (SERIE, NUMERO, COD_SERV_PROD, DEPARTAMENTO, OBSERVACION, CANT' +
        'IDAD, VALOR, '
      
        '   STATUS, IN_POR, FECHA_IN, MOD_POR, FECHA_MOD, NUMERO_DOCUMENT' +
        'O, NUMERO_FACTURA, '
      
        '   COD_CTA_CONCEPTO, TIPOSERVICIO, SUBTIPOSERV, NO_SERIE_RES, CO' +
        'DIGO_CONDUCTOR, '
      
        '   SERIE_CDC, CODIGO_SERVCOSTO, NUMEROOLD, PRECIO, AREA_ORDEN, I' +
        'TBI_DET, '
      
        '   PORC_DESC_DET, MONTO_DESCUENTO, CANT_OFERTA, IDUNIDAD, COD_US' +
        'UARIO_RECIBE, '
      '   COD_USUARIO_CREA)'
      'values'
      
        '  (:SERIE, :NUMERO, :COD_SERV_PROD, :DEPARTAMENTO, :OBSERVACION,' +
        ' :CANTIDAD, '
      
        '   :VALOR, :STATUS, :IN_POR, :FECHA_IN, :MOD_POR, :FECHA_MOD, :N' +
        'UMERO_DOCUMENTO, '
      
        '   :NUMERO_FACTURA, :COD_CTA_CONCEPTO, :TIPOSERVICIO, :SUBTIPOSE' +
        'RV, :NO_SERIE_RES, '
      
        '   :CODIGO_CONDUCTOR, :SERIE_CDC, :CODIGO_SERVCOSTO, :NUMEROOLD,' +
        ' :PRECIO, '
      
        '   :AREA_ORDEN, :ITBI_DET, :PORC_DESC_DET, :MONTO_DESCUENTO, :CA' +
        'NT_OFERTA, '
      '   :IDUNIDAD, :COD_USUARIO_RECIBE, :COD_USUARIO_CREA)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  COD_SERV_PROD,'
      '  DEPARTAMENTO,'
      '  OBSERVACION,'
      '  CANTIDAD,'
      '  VALOR,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD,'
      '  NUMERO_DOCUMENTO,'
      '  NUMERO_FACTURA,'
      '  COD_CTA_CONCEPTO,'
      '  TIPOSERVICIO,'
      '  SUBTIPOSERV,'
      '  NO_SERIE_RES,'
      '  CODIGO_CONDUCTOR,'
      '  SERIE_CDC,'
      '  CODIGO_SERVCOSTO,'
      '  NUMEROOLD,'
      '  PRECIO,'
      '  AREA_ORDEN,'
      '  ITBI_DET,'
      '  PORC_DESC_DET,'
      '  MONTO_DESCUENTO,'
      '  CANT_OFERTA,'
      '  IDUNIDAD,'
      '  COD_USUARIO_RECIBE,'
      '  COD_USUARIO_CREA'
      'from ORDEN_COMP_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'SELECT * FROM ORDEN_COMP_DET'
      'WHERE  Numero =:Numero')
    ModifySQL.Strings = (
      'update ORDEN_COMP_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  COD_SERV_PROD = :COD_SERV_PROD,'
      '  DEPARTAMENTO = :DEPARTAMENTO,'
      '  OBSERVACION = :OBSERVACION,'
      '  CANTIDAD = :CANTIDAD,'
      '  VALOR = :VALOR,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  NUMERO_DOCUMENTO = :NUMERO_DOCUMENTO,'
      '  NUMERO_FACTURA = :NUMERO_FACTURA,'
      '  COD_CTA_CONCEPTO = :COD_CTA_CONCEPTO,'
      '  TIPOSERVICIO = :TIPOSERVICIO,'
      '  SUBTIPOSERV = :SUBTIPOSERV,'
      '  NO_SERIE_RES = :NO_SERIE_RES,'
      '  CODIGO_CONDUCTOR = :CODIGO_CONDUCTOR,'
      '  SERIE_CDC = :SERIE_CDC,'
      '  CODIGO_SERVCOSTO = :CODIGO_SERVCOSTO,'
      '  NUMEROOLD = :NUMEROOLD,'
      '  PRECIO = :PRECIO,'
      '  AREA_ORDEN = :AREA_ORDEN,'
      '  ITBI_DET = :ITBI_DET,'
      '  PORC_DESC_DET = :PORC_DESC_DET,'
      '  MONTO_DESCUENTO = :MONTO_DESCUENTO,'
      '  CANT_OFERTA = :CANT_OFERTA,'
      '  IDUNIDAD = :IDUNIDAD,'
      '  COD_USUARIO_RECIBE = :COD_USUARIO_RECIBE,'
      '  COD_USUARIO_CREA = :COD_USUARIO_CREA'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_NUM_ORDEN_DET'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 424
    Top = 8
    object tblOrdenCompraDetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'ORDEN_COMP_DET.SERIE'
      Required = True
    end
    object tblOrdenCompraDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'ORDEN_COMP_DET.NUMERO'
      Required = True
    end
    object tblOrdenCompraDetCOD_SERV_PROD: TIntegerField
      FieldName = 'COD_SERV_PROD'
      Origin = 'ORDEN_COMP_DET.COD_SERV_PROD'
    end
    object tblOrdenCompraDetDEPARTAMENTO: TIntegerField
      FieldName = 'DEPARTAMENTO'
      Origin = 'ORDEN_COMP_DET.DEPARTAMENTO'
    end
    object tblOrdenCompraDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'ORDEN_COMP_DET.CANTIDAD'
    end
    object tblOrdenCompraDetVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'ORDEN_COMP_DET.VALOR'
      DisplayFormat = ',0.00'
    end
    object tblOrdenCompraDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ORDEN_COMP_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblOrdenCompraDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ORDEN_COMP_DET.IN_POR'
      Size = 12
    end
    object tblOrdenCompraDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ORDEN_COMP_DET.FECHA_IN'
    end
    object tblOrdenCompraDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'ORDEN_COMP_DET.MOD_POR'
      Size = 12
    end
    object tblOrdenCompraDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'ORDEN_COMP_DET.FECHA_MOD'
    end
    object tblOrdenCompraDetNUMERO_DOCUMENTO: TIntegerField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'ORDEN_COMP_DET.NUMERO_DOCUMENTO'
    end
    object tblOrdenCompraDetNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'ORDEN_COMP_DET.NUMERO_FACTURA'
    end
    object tblOrdenCompraDetCOD_CTA_CONCEPTO: TIntegerField
      FieldName = 'COD_CTA_CONCEPTO'
      Origin = 'ORDEN_COMP_DET.COD_CTA_CONCEPTO'
    end
    object tblOrdenCompraDetTIPOSERVICIO: TIntegerField
      FieldName = 'TIPOSERVICIO'
      Origin = 'ORDEN_COMP_DET.TIPOSERVICIO'
    end
    object tblOrdenCompraDetSUBTIPOSERV: TIntegerField
      FieldName = 'SUBTIPOSERV'
      Origin = 'ORDEN_COMP_DET.SUBTIPOSERV'
    end
    object tblOrdenCompraDetNO_SERIE_RES: TIntegerField
      FieldName = 'NO_SERIE_RES'
      Origin = 'ORDEN_COMP_DET.NO_SERIE_RES'
    end
    object tblOrdenCompraDetCODIGO_CONDUCTOR: TIntegerField
      FieldName = 'CODIGO_CONDUCTOR'
      Origin = 'ORDEN_COMP_DET.CODIGO_CONDUCTOR'
    end
    object tblOrdenCompraDetSERIE_CDC: TIntegerField
      FieldName = 'SERIE_CDC'
      Origin = 'ORDEN_COMP_DET.SERIE_CDC'
    end
    object tblOrdenCompraDetCODIGO_SERVCOSTO: TIntegerField
      FieldName = 'CODIGO_SERVCOSTO'
      Origin = 'ORDEN_COMP_DET.CODIGO_SERVCOSTO'
    end
    object tblOrdenCompraDetNUMEROOLD: TIntegerField
      FieldName = 'NUMEROOLD'
      Origin = 'ORDEN_COMP_DET.NUMEROOLD'
    end
    object tblOrdenCompraDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'ORDEN_COMP_DET.PRECIO'
      DisplayFormat = ',0.00'
    end
    object tblOrdenCompraDetAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'ORDEN_COMP_DET.AREA_ORDEN'
    end
    object tblOrdenCompraDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'ORDEN_COMP_DET.ITBI_DET'
    end
    object tblOrdenCompraDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'ORDEN_COMP_DET.PORC_DESC_DET'
      DisplayFormat = ',0.00'
    end
    object tblOrdenCompraDetMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'ORDEN_COMP_DET.MONTO_DESCUENTO'
      DisplayFormat = ',0.00'
    end
    object tblOrdenCompraDetOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'ORDEN_COMP_DET.OBSERVACION'
      Size = 80
    end
    object tblOrdenCompraDetCANT_OFERTA: TIntegerField
      FieldName = 'CANT_OFERTA'
      Origin = 'ORDEN_COMP_DET.CANT_OFERTA'
    end
    object tblOrdenCompraDetIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'ORDEN_COMP_DET.IDUNIDAD'
    end
    object tblOrdenCompraDetCOD_USUARIO_RECIBE: TIntegerField
      FieldName = 'COD_USUARIO_RECIBE'
      Origin = 'ORDEN_COMP_DET.COD_USUARIO_RECIBE'
    end
    object tblOrdenCompraDetCOD_USUARIO_CREA: TIntegerField
      FieldName = 'COD_USUARIO_CREA'
      Origin = 'ORDEN_COMP_DET.COD_USUARIO_CREA'
    end
  end
  object dstblOrdenCompraDet: TDataSource
    DataSet = tblOrdenCompraDet
    Left = 504
    Top = 24
  end
  object dstblOrdenCompraMaster: TDataSource
    DataSet = tblOrdenCompraMaster
    Left = 88
    Top = 64
  end
  object tblVendedorProveedor: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from vendedor_proveedor'
      'where'
      '  IDVENDEDOR = :OLD_IDVENDEDOR and'
      '  CODIGO_PROV = :OLD_CODIGO_PROV')
    InsertSQL.Strings = (
      'insert into vendedor_proveedor'
      
        '  (IDVENDEDOR, CODIGO_PROV, NOMBRE_VENDEDOR, CELULAR, TELEFONO, ' +
        'EXT, EMAIL, '
      '   STATUS)'
      'values'
      
        '  (:IDVENDEDOR, :CODIGO_PROV, :NOMBRE_VENDEDOR, :CELULAR, :TELEF' +
        'ONO, :EXT, '
      '   :EMAIL, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  IDVENDEDOR,'
      '  CODIGO_PROV,'
      '  NOMBRE_VENDEDOR,'
      '  CELULAR,'
      '  TELEFONO,'
      '  EXT,'
      '  EMAIL,'
      '  STATUS'
      'from vendedor_proveedor '
      'where'
      '  IDVENDEDOR = :IDVENDEDOR and'
      '  CODIGO_PROV = :CODIGO_PROV')
    SelectSQL.Strings = (
      'select * from vendedor_proveedor')
    ModifySQL.Strings = (
      'update vendedor_proveedor'
      'set'
      '  IDVENDEDOR = :IDVENDEDOR,'
      '  CODIGO_PROV = :CODIGO_PROV,'
      '  NOMBRE_VENDEDOR = :NOMBRE_VENDEDOR,'
      '  CELULAR = :CELULAR,'
      '  TELEFONO = :TELEFONO,'
      '  EXT = :EXT,'
      '  EMAIL = :EMAIL,'
      '  STATUS = :STATUS'
      'where'
      '  IDVENDEDOR = :OLD_IDVENDEDOR and'
      '  CODIGO_PROV = :OLD_CODIGO_PROV')
    Left = 528
    Top = 176
    object tblVendedorProveedorCODIGO_PROV: TIntegerField
      FieldName = 'CODIGO_PROV'
      Origin = 'VENDEDOR_PROVEEDOR.CODIGO_PROV'
      Required = True
    end
    object tblVendedorProveedorNOMBRE_VENDEDOR: TIBStringField
      FieldName = 'NOMBRE_VENDEDOR'
      Origin = 'VENDEDOR_PROVEEDOR.NOMBRE_VENDEDOR'
      Size = 80
    end
    object tblVendedorProveedorCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'VENDEDOR_PROVEEDOR.CELULAR'
    end
    object tblVendedorProveedorTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'VENDEDOR_PROVEEDOR.TELEFONO'
    end
    object tblVendedorProveedorEXT: TIBStringField
      FieldName = 'EXT'
      Origin = 'VENDEDOR_PROVEEDOR.EXT'
    end
    object tblVendedorProveedorEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'VENDEDOR_PROVEEDOR.EMAIL'
    end
    object tblVendedorProveedorSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENDEDOR_PROVEEDOR.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblVendedorProveedorIDVENDEDOR: TIntegerField
      FieldName = 'IDVENDEDOR'
      Origin = 'VENDEDOR_PROVEEDOR.IDVENDEDOR'
      Required = True
    end
  end
  object dstblVendedorProveedor: TDataSource
    DataSet = tblVendedorProveedor
    Left = 536
    Top = 232
  end
  object tblOrdenCompDetRecibida: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from ORDEN_COMP_DET_original'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into ORDEN_COMP_DET_original'
      
        '  (SERIE, NUMERO, FECHA_RECIBIDA, COD_SERV_PROD, CANT_OFERTA, CA' +
        'NTIDAD, '
      '   PRECIO, STATUS)'
      'values'
      
        '  (:SERIE, :NUMERO, :FECHA_RECIBIDA, :COD_SERV_PROD, :CANT_OFERT' +
        'A, :CANTIDAD, '
      '   :PRECIO, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  FECHA_RECIBIDA,'
      '  COD_SERV_PROD,'
      '  CANT_OFERTA,'
      '  CANTIDAD,'
      '  PRECIO,'
      '  STATUS'
      'from ORDEN_COMP_DET_original '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * From ORDEN_COMP_DET_original'
      'Where serie =:serie')
    ModifySQL.Strings = (
      'update ORDEN_COMP_DET_original'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  FECHA_RECIBIDA = :FECHA_RECIBIDA,'
      '  COD_SERV_PROD = :COD_SERV_PROD,'
      '  CANT_OFERTA = :CANT_OFERTA,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO = :PRECIO,'
      '  STATUS = :STATUS'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 536
    Top = 104
    object tblOrdenCompDetRecibidaSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'ORDEN_COMP_DET_RECIBIDA.SERIE'
      Required = True
    end
    object tblOrdenCompDetRecibidaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'ORDEN_COMP_DET_RECIBIDA.NUMERO'
      Required = True
    end
    object tblOrdenCompDetRecibidaFECHA_RECIBIDA: TDateTimeField
      FieldName = 'FECHA_RECIBIDA'
      Origin = 'ORDEN_COMP_DET_RECIBIDA.FECHA_RECIBIDA'
    end
    object tblOrdenCompDetRecibidaCOD_SERV_PROD: TIntegerField
      FieldName = 'COD_SERV_PROD'
      Origin = 'ORDEN_COMP_DET_RECIBIDA.COD_SERV_PROD'
    end
    object tblOrdenCompDetRecibidaCANT_OFERTA: TFloatField
      FieldName = 'CANT_OFERTA'
      Origin = 'ORDEN_COMP_DET_RECIBIDA.CANT_OFERTA'
    end
    object tblOrdenCompDetRecibidaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'ORDEN_COMP_DET_RECIBIDA.CANTIDAD'
    end
    object tblOrdenCompDetRecibidaPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'ORDEN_COMP_DET_RECIBIDA.PRECIO'
    end
    object tblOrdenCompDetRecibidaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ORDEN_COMP_DET_RECIBIDA.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object tblPersonaJuridica: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PERSONAJURIDICA'
    Left = 544
    Top = 296
    object tblPersonaJuridicaIDTIPO: TIntegerField
      FieldName = 'IDTIPO'
    end
    object tblPersonaJuridicaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object dstblPersonaJuridica: TDataSource
    DataSet = tblPersonaJuridica
    Left = 536
    Top = 343
  end
  object tblTipoCF: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_CF'
    Left = 344
    Top = 336
    object tblTipoCFTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Size = 2
    end
    object tblTipoCFDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object dstblTipoCF: TDataSource
    DataSet = tblTipoCF
    Left = 424
    Top = 335
  end
  object tblTipoCompra: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_COMPRA'
    Left = 528
    Top = 396
    object tblTipoCompraTIPO: TIntegerField
      FieldName = 'TIPO'
    end
    object tblTipoCompraDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 120
    end
  end
  object dstblTipoCompra: TDataSource
    DataSet = tblTipoCompra
    Left = 528
    Top = 448
  end
end
