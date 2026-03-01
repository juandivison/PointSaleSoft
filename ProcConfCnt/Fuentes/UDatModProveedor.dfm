object dmProveedor: TdmProveedor
  OldCreateOrder = False
  Left = 378
  Top = 107
  Height = 301
  Width = 277
  object dmProveedor: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
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
      'select *  from PROVEEDORES')
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
    Left = 56
    Top = 32
    object dmProveedorCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROVEEDORES.CODIGO_CTE'
      Required = True
    end
    object dmProveedorTIPO_CLIENTE: TIntegerField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'PROVEEDORES.TIPO_CLIENTE'
    end
    object dmProveedorDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 40
    end
    object dmProveedorCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'PROVEEDORES.CONTACTO'
      Size = 35
    end
    object dmProveedorPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PROVEEDORES.PAIS'
      Size = 30
    end
    object dmProveedorESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'PROVEEDORES.ESTADO'
      Size = 30
    end
    object dmProveedorCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROVEEDORES.CIUDAD'
    end
    object dmProveedorCALYYNUM: TIBStringField
      FieldName = 'CALYYNUM'
      Origin = 'PROVEEDORES.CALYYNUM'
      Size = 35
    end
    object dmProveedorTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object dmProveedorFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'PROVEEDORES.FAX'
      Size = 12
    end
    object dmProveedorCODIGOPOSTAL: TIBStringField
      FieldName = 'CODIGOPOSTAL'
      Origin = 'PROVEEDORES.CODIGOPOSTAL'
      FixedChar = True
      Size = 6
    end
    object dmProveedorEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'PROVEEDORES.EMAIL'
      Size = 40
    end
    object dmProveedorDIRECCIONWEB: TIBStringField
      FieldName = 'DIRECCIONWEB'
      Origin = 'PROVEEDORES.DIRECCIONWEB'
      Size = 40
    end
    object dmProveedorSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROVEEDORES.STATUS'
      FixedChar = True
      Size = 1
    end
    object dmProveedorFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PROVEEDORES.FECHA_IN'
    end
    object dmProveedorIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PROVEEDORES.IN_POR'
      Size = 12
    end
    object dmProveedorFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PROVEEDORES.FECHA_MOD'
    end
    object dmProveedorMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PROVEEDORES.MOD_POR'
      Size = 12
    end
  end
  object DataSource1: TDataSource
    Left = 88
    Top = 96
  end
  object qryProveCxp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'proveedores.*, balance_cxp.BALANCE_ACT '
      'FROM balance_cxp'
      'left outer JOIN proveedores'
      'ON balance_cxp.codigo = proveedores.codigo_cte;')
    Left = 144
    Top = 32
    object qryProveCxpCODIGO_CTE: TIntegerField
      DisplayLabel = 'CodCte'
      FieldName = 'CODIGO_CTE'
      Origin = 'PROVEEDORES.CODIGO_CTE'
    end
    object qryProveCxpTIPO_CLIENTE: TIntegerField
      DisplayLabel = 'TipoCte'
      FieldName = 'TIPO_CLIENTE'
      Origin = 'PROVEEDORES.TIPO_CLIENTE'
    end
    object qryProveCxpDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 40
    end
    object qryProveCxpCONTACTO: TIBStringField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
      Origin = 'PROVEEDORES.CONTACTO'
      Size = 35
    end
    object qryProveCxpPAIS: TIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Origin = 'PROVEEDORES.PAIS'
      Size = 30
    end
    object qryProveCxpESTADO: TIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Origin = 'PROVEEDORES.ESTADO'
      Size = 30
    end
    object qryProveCxpCIUDAD: TIBStringField
      DisplayLabel = 'Ciudad'
      FieldName = 'CIUDAD'
      Origin = 'PROVEEDORES.CIUDAD'
    end
    object qryProveCxpCALYYNUM: TIBStringField
      DisplayLabel = 'Calle y Num.'
      FieldName = 'CALYYNUM'
      Origin = 'PROVEEDORES.CALYYNUM'
      Size = 35
    end
    object qryProveCxpTELEFONO: TIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object qryProveCxpFAX: TIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Origin = 'PROVEEDORES.FAX'
      Size = 12
    end
    object qryProveCxpCODIGOPOSTAL: TIBStringField
      DisplayLabel = 'CodigoPostal'
      FieldName = 'CODIGOPOSTAL'
      Origin = 'PROVEEDORES.CODIGOPOSTAL'
      FixedChar = True
      Size = 6
    end
    object qryProveCxpEMAIL: TIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Origin = 'PROVEEDORES.EMAIL'
      Size = 40
    end
    object qryProveCxpDIRECCIONWEB: TIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCIONWEB'
      Origin = 'PROVEEDORES.DIRECCIONWEB'
      Size = 40
    end
    object qryProveCxpSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'PROVEEDORES.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryProveCxpBALANCE_ACT: TFloatField
      DisplayLabel = 'Balance Cte'
      FieldName = 'BALANCE_ACT'
      Origin = 'BALANCE_CXP.BALANCE_ACT'
    end
  end
end
