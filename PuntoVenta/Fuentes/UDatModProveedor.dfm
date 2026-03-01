object dmProveedor: TdmProveedor
  OldCreateOrder = False
  Left = 704
  Top = 234
  Height = 301
  Width = 374
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
      
        '   FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, RNC_PROVEEDOR, MOVIL1, ' +
        'MOVIL2, '
      '   TELEFONO2, TELEFONO3, EXTENSIONES)'
      'values'
      
        '  (:CODIGO_CTE, :TIPO_CLIENTE, :DESCRIPCION, :CONTACTO, :PAIS, :' +
        'ESTADO, '
      
        '   :CIUDAD, :CALYYNUM, :TELEFONO, :FAX, :CODIGOPOSTAL, :EMAIL, :' +
        'DIRECCIONWEB, '
      
        '   :STATUS, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR, :RNC_PROVE' +
        'EDOR, :MOVIL1, '
      '   :MOVIL2, :TELEFONO2, :TELEFONO3, :EXTENSIONES)')
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
      '  RNC_PROVEEDOR,'
      '  MOVIL1,'
      '  MOVIL2,'
      '  TELEFONO2,'
      '  TELEFONO3,'
      '  EXTENSIONES'
      'from PROVEEDORES '
      'where'
      '  CODIGO_CTE = :CODIGO_CTE')
    SelectSQL.Strings = (
      'select *  from PROVEEDORES'
      'where (:ciakey >=0) ')
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
      '  RNC_PROVEEDOR = :RNC_PROVEEDOR,'
      '  MOVIL1 = :MOVIL1,'
      '  MOVIL2 = :MOVIL2,'
      '  TELEFONO2 = :TELEFONO2,'
      '  TELEFONO3 = :TELEFONO3,'
      '  EXTENSIONES = :EXTENSIONES'
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
      DisplayWidth = 80
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
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
      Size = 80
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
    object dmProveedorRNC_PROVEEDOR: TIBStringField
      FieldName = 'RNC_PROVEEDOR'
      Origin = 'PROVEEDORES.RNC_PROVEEDOR'
      Size = 15
    end
    object dmProveedorMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'PROVEEDORES.MOVIL1'
    end
    object dmProveedorMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'PROVEEDORES.MOVIL2'
    end
    object dmProveedorTELEFONO2: TIBStringField
      FieldName = 'TELEFONO2'
      Origin = 'PROVEEDORES.TELEFONO2'
    end
    object dmProveedorTELEFONO3: TIBStringField
      FieldName = 'TELEFONO3'
      Origin = 'PROVEEDORES.TELEFONO3'
    end
    object dmProveedorEXTENSIONES: TIBStringField
      FieldName = 'EXTENSIONES'
      Origin = 'PROVEEDORES.EXTENSIONES'
      Size = 40
    end
  end
  object DataSource1: TDataSource
    Left = 56
    Top = 96
  end
  object qryProveCxp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'Proveedores.*, balance_cxp.BALANCE_ACT '
      'FROM balance_cxp'
      'right Outer JOIN proveedores'
      'ON balance_cxp.codigo = proveedores.codigo_cte'
      'and proveedores.cia_key =:ciakey'
      '')
    Left = 144
    Top = 34
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ciakey'
        ParamType = ptInput
      end>
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
      Size = 80
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
      Size = 80
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
  object qryProveedores: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From PROVEEDORES'
      'Where Status = "A"'
      'and :ciakey >= 0')
    Left = 144
    Top = 97
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ciakey'
        ParamType = ptInput
      end>
    object qryProveedoresCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROVEEDORES.CODIGO_CTE'
      Required = True
    end
    object qryProveedoresTIPO_CLIENTE: TIntegerField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'PROVEEDORES.TIPO_CLIENTE'
    end
    object qryProveedoresDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object qryProveedoresCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'PROVEEDORES.CONTACTO'
      Size = 35
    end
    object qryProveedoresPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PROVEEDORES.PAIS'
      Size = 30
    end
    object qryProveedoresESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'PROVEEDORES.ESTADO'
      Size = 30
    end
    object qryProveedoresCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROVEEDORES.CIUDAD'
    end
    object qryProveedoresCALYYNUM: TIBStringField
      FieldName = 'CALYYNUM'
      Origin = 'PROVEEDORES.CALYYNUM'
      Size = 80
    end
    object qryProveedoresTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object qryProveedoresFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'PROVEEDORES.FAX'
      Size = 12
    end
    object qryProveedoresCODIGOPOSTAL: TIBStringField
      FieldName = 'CODIGOPOSTAL'
      Origin = 'PROVEEDORES.CODIGOPOSTAL'
      FixedChar = True
      Size = 6
    end
    object qryProveedoresEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'PROVEEDORES.EMAIL'
      Size = 40
    end
    object qryProveedoresDIRECCIONWEB: TIBStringField
      FieldName = 'DIRECCIONWEB'
      Origin = 'PROVEEDORES.DIRECCIONWEB'
      Size = 40
    end
    object qryProveedoresSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROVEEDORES.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryProveedoresFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PROVEEDORES.FECHA_IN'
    end
    object qryProveedoresIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PROVEEDORES.IN_POR'
      Size = 12
    end
    object qryProveedoresFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PROVEEDORES.FECHA_MOD'
    end
    object qryProveedoresMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PROVEEDORES.MOD_POR'
      Size = 12
    end
    object qryProveedoresRNC_PROVEEDOR: TIBStringField
      FieldName = 'RNC_PROVEEDOR'
      Origin = 'PROVEEDORES.RNC_PROVEEDOR'
      Size = 15
    end
    object qryProveedoresMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'PROVEEDORES.MOVIL1'
    end
    object qryProveedoresMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'PROVEEDORES.MOVIL2'
    end
    object qryProveedoresTELEFONO2: TIBStringField
      FieldName = 'TELEFONO2'
      Origin = 'PROVEEDORES.TELEFONO2'
    end
    object qryProveedoresTELEFONO3: TIBStringField
      FieldName = 'TELEFONO3'
      Origin = 'PROVEEDORES.TELEFONO3'
    end
    object qryProveedoresEXTENSIONES: TIBStringField
      FieldName = 'EXTENSIONES'
      Origin = 'PROVEEDORES.EXTENSIONES'
      Size = 40
    end
  end
  object dsqryProveedores: TDataSource
    DataSet = qryProveedores
    Left = 144
    Top = 145
  end
  object qryProveedoresConGastos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select distinct r.CODIGO_CTE codigo, '
      'r.DESCRIPCION, r.CONDICION,'
      'r.TIPODOC, r.RNC_PROVEEDOR, r.TELEFONO, r.MOVIL1'
      'From PROVEEDORES r'
      
        'inner join TRANS_OPERACION_MASTER t on t.COD_PROVEEDOR = r.CODIG' +
        'O_CTE'
      'and r.cia_key = :ciakey'
      'order by r.descripcion')
    Left = 272
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ciakey'
        ParamType = ptInput
      end>
    object qryProveedoresConGastosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'PROVEEDORES.CODIGO_CTE'
      Required = True
    end
    object qryProveedoresConGastosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object qryProveedoresConGastosCONDICION: TIntegerField
      FieldName = 'CONDICION'
      Origin = 'PROVEEDORES.CONDICION'
    end
    object qryProveedoresConGastosTIPODOC: TSmallintField
      FieldName = 'TIPODOC'
      Origin = 'PROVEEDORES.TIPODOC'
    end
    object qryProveedoresConGastosRNC_PROVEEDOR: TIBStringField
      FieldName = 'RNC_PROVEEDOR'
      Origin = 'PROVEEDORES.RNC_PROVEEDOR'
      Size = 15
    end
    object qryProveedoresConGastosTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object qryProveedoresConGastosMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'PROVEEDORES.MOVIL1'
    end
  end
end
