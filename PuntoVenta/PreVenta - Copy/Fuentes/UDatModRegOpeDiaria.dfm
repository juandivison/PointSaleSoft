object dtmTransOpeDiaria: TdtmTransOpeDiaria
  OldCreateOrder = False
  Left = 371
  Top = 156
  Height = 436
  Width = 602
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
      '  (NUMERO, COD_PROVEEDOR, FECHA, FPAGO, OBSERVACION, MONTO, '
      'STATUS, STATUS_CNT, '
      '   IN_POR, FECHA_IN, MOD_POR, FECHA_MOD)'
      'values'
      
        '  (:NUMERO, :COD_PROVEEDOR, :FECHA, :FPAGO, :OBSERVACION, :MONTO' +
        ', '
      ':STATUS, '
      '   :STATUS_CNT, :IN_POR, :FECHA_IN, :MOD_POR, :FECHA_MOD)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  COD_PROVEEDOR,'
      '  FECHA,'
      '  FPAGO,'
      '  OBSERVACION,'
      '  MONTO,'
      '  STATUS,'
      '  STATUS_CNT,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD'
      'from TRANS_OPERACION_MASTER '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'select * from TRANS_OPERACION_MASTER'
      'where fecha between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update TRANS_OPERACION_MASTER'
      'set'
      '  NUMERO = :NUMERO,'
      '  COD_PROVEEDOR = :COD_PROVEEDOR,'
      '  FECHA = :FECHA,'
      '  FPAGO = :FPAGO,'
      '  OBSERVACION = :OBSERVACION,'
      '  MONTO = :MONTO,'
      '  STATUS = :STATUS,'
      '  STATUS_CNT = :STATUS_CNT,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_NUM_ORDEN_MAST'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 104
    Top = 16
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
      DisplayFormat = ',0.00'
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
  end
  object dstblRegTransOpeDiariaMast: TDataSource
    DataSet = tblRegTransOpeDiariaMast
    Left = 104
    Top = 64
  end
  object tblRegTransOpeDiariaDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
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
      '   STATUS, IN_POR, FECHA_IN, MOD_POR, FECHA_MOD)'
      'values'
      
        '  (:SERIE, :NUMERO, :COD_SERV_PROD, :DEPARTAMENTO, :OBSERVACION,' +
        ' :CANTIDAD, '
      
        '   :PRECIO, :VALOR, :NUMERO_DOCUMENTO, :NUMERO_FACTURA, :COD_CTA' +
        '_CONCEPTO, '
      
        '   :CODIGO_USUARIO, :STATUS, :IN_POR, :FECHA_IN, :MOD_POR, :FECH' +
        'A_MOD)')
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
      '  FECHA_MOD'
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
      '  FECHA_MOD = :FECHA_MOD'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_NUM_ORDEN_DET'
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
  end
  object dstblRegTransOpeDiariaDet: TDataSource
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
      
        '  (CODIGO_CTE, TIPO_CLIENTE, DESCRIPCION, CONTACTO, PAIS, ESTADO' +
        ', CIUDAD, '
      
        '   CALYYNUM, TELEFONO, FAX, CODIGOPOSTAL, EMAIL, DIRECCIONWEB, S' +
        'TATUS, '
      '   FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, RNC_PROVEEDOR)'
      'values'
      
        '  (:CODIGO_CTE, :TIPO_CLIENTE, :DESCRIPCION, :CONTACTO, :PAIS, :' +
        'ESTADO, '
      
        '   :CIUDAD, :CALYYNUM, :TELEFONO, :FAX, :CODIGOPOSTAL, :EMAIL, :' +
        'DIRECCIONWEB, '
      
        '   :STATUS, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR, :RNC_PROVE' +
        'EDOR)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_CTE,'
      '  TIPO_CLIENTE,'
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
      '  RNC_PROVEEDOR'
      'from PROVEEDORES '
      'where'
      '  CODIGO_CTE = :CODIGO_CTE')
    SelectSQL.Strings = (
      'select  * from PROVEEDORES')
    ModifySQL.Strings = (
      'update PROVEEDORES'
      'set'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  TIPO_CLIENTE = :TIPO_CLIENTE,'
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
      '  RNC_PROVEEDOR = :RNC_PROVEEDOR'
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
    object qryProveedorDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 40
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
    Left = 368
    Top = 233
  end
  object dsqryProdServicio: TDataSource
    DataSet = qryProdServicio
    Left = 368
    Top = 279
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
    Left = 104
    Top = 280
  end
  object tblCentroDeCostos: TIBTable
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
        Size = 30
      end
      item
        Name = 'CODDGII'
        DataType = ftInteger
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
    Left = 272
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
  end
  object dstblCentroDeCostos: TDataSource
    DataSet = tblCentroDeCostos
    Left = 272
    Top = 280
  end
  object tblCargoEmp: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CARGO_EMPLEADOS'
    Left = 32
    Top = 128
    object tblCargoEmpCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblCargoEmpNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 40
    end
    object tblCargoEmpSTATUS: TIBStringField
      FieldName = 'STATUS'
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
end
