object dmUsuarios: TdmUsuarios
  OldCreateOrder = False
  Left = 473
  Top = 187
  Height = 275
  Width = 385
  object tblUsuarios: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from USUARIO'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into USUARIO'
      
        '  (NUMERO, CODIGO, CLAVE, CODIGO_EMPLEADO, NOMBRECOMPLETO, FOTO,' +
        ' TIPO, '
      
        '   FECHA_VENCE_CLAVE, FECHA_ENTRADA, FECHA_SALIDA, STATUS, ARCHI' +
        'VOCONFGWIN)'
      'values'
      
        '  (:NUMERO, :CODIGO, :CLAVE, :CODIGO_EMPLEADO, :NOMBRECOMPLETO, ' +
        ':FOTO, '
      
        '   :TIPO, :FECHA_VENCE_CLAVE, :FECHA_ENTRADA, :FECHA_SALIDA, :ST' +
        'ATUS, :ARCHIVOCONFGWIN)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  CODIGO,'
      '  CLAVE,'
      '  CODIGO_EMPLEADO,'
      '  NOMBRECOMPLETO,'
      '  FOTO,'
      '  TIPO,'
      '  FECHA_VENCE_CLAVE,'
      '  FECHA_ENTRADA,'
      '  FECHA_SALIDA,'
      '  STATUS,'
      '  ARCHIVOCONFGWIN'
      'from USUARIO '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'select * from USUARIO')
    ModifySQL.Strings = (
      'update USUARIO'
      'set'
      '  NUMERO = :NUMERO,'
      '  CODIGO = :CODIGO,'
      '  CLAVE = :CLAVE,'
      '  CODIGO_EMPLEADO = :CODIGO_EMPLEADO,'
      '  NOMBRECOMPLETO = :NOMBRECOMPLETO,'
      '  FOTO = :FOTO,'
      '  TIPO = :TIPO,'
      '  FECHA_VENCE_CLAVE = :FECHA_VENCE_CLAVE,'
      '  FECHA_ENTRADA = :FECHA_ENTRADA,'
      '  FECHA_SALIDA = :FECHA_SALIDA,'
      '  STATUS = :STATUS,'
      '  ARCHIVOCONFGWIN = :ARCHIVOCONFGWIN'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_NUMERO_USUARIO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 80
    Top = 32
    object tblUsuariosNUMERO: TSmallintField
      FieldName = 'NUMERO'
      Origin = 'USUARIO.NUMERO'
      Required = True
    end
    object tblUsuariosCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'USUARIO.CODIGO'
      FixedChar = True
      Size = 8
    end
    object tblUsuariosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'USUARIO.FOTO'
      Size = 8
    end
    object tblUsuariosTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'USUARIO.TIPO'
    end
    object tblUsuariosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'USUARIO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblUsuariosCLAVE: TIBStringField
      FieldName = 'CLAVE'
      Origin = 'USUARIO.CLAVE'
      FixedChar = True
      Size = 8
    end
    object tblUsuariosFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'USUARIO.FECHA_ENTRADA'
    end
    object tblUsuariosFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'USUARIO.FECHA_SALIDA'
    end
    object tblUsuariosFECHA_VENCE_CLAVE: TDateTimeField
      FieldName = 'FECHA_VENCE_CLAVE'
      Origin = 'USUARIO.FECHA_VENCE_CLAVE'
    end
    object tblUsuariosNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Origin = 'USUARIO.NOMBRECOMPLETO'
      Size = 40
    end
    object tblUsuariosCODIGO_EMPLEADO: TIntegerField
      FieldName = 'CODIGO_EMPLEADO'
      Origin = 'USUARIO.CODIGO_EMPLEADO'
    end
    object tblUsuariosARCHIVOCONFGWIN: TIBStringField
      FieldName = 'ARCHIVOCONFGWIN'
      Origin = 'USUARIO.ARCHIVOCONFGWIN'
      Size = 60
    end
  end
  object qryUsuarios: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from USUARIO'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into USUARIO'
      '  (FECHA_ENTRADA, FECHA_SALIDA, ARCHIVOCONFGWIN)'
      'values'
      '  (:FECHA_ENTRADA, :FECHA_SALIDA, :ARCHIVOCONFGWIN)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  CODIGO,'
      '  CLAVE,'
      '  CODIGO_EMPLEADO,'
      '  NOMBRECOMPLETO,'
      '  FOTO,'
      '  TIPO,'
      '  FECHA_VENCE_CLAVE,'
      '  FECHA_ENTRADA,'
      '  FECHA_SALIDA,'
      '  STATUS,'
      '  ARCHIVOCONFGWIN'
      'from USUARIO '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'select * from USUARIO')
    ModifySQL.Strings = (
      'update USUARIO'
      'set'
      '  FECHA_ENTRADA = :FECHA_ENTRADA,'
      '  FECHA_SALIDA = :FECHA_SALIDA,'
      '  ARCHIVOCONFGWIN = :ARCHIVOCONFGWIN'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 80
    Top = 88
    object qryUsuariosCLAVE: TIBStringField
      FieldName = 'CLAVE'
      Origin = 'USUARIO.CLAVE'
      FixedChar = True
      Size = 8
    end
    object qryUsuariosCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'USUARIO.CODIGO'
      FixedChar = True
      Size = 8
    end
    object qryUsuariosFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'USUARIO.FECHA_ENTRADA'
    end
    object qryUsuariosFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'USUARIO.FECHA_SALIDA'
    end
    object qryUsuariosFECHA_VENCE_CLAVE: TDateTimeField
      FieldName = 'FECHA_VENCE_CLAVE'
      Origin = 'USUARIO.FECHA_VENCE_CLAVE'
    end
    object qryUsuariosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'USUARIO.FOTO'
      Size = 8
    end
    object qryUsuariosNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Origin = 'USUARIO.NOMBRECOMPLETO'
      Size = 30
    end
    object qryUsuariosNUMERO: TSmallintField
      FieldName = 'NUMERO'
      Origin = 'USUARIO.NUMERO'
      Required = True
    end
    object qryUsuariosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'USUARIO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'USUARIO.TIPO'
    end
    object qryUsuariosCODIGO_EMPLEADO: TIntegerField
      FieldName = 'CODIGO_EMPLEADO'
      Origin = 'USUARIO.CODIGO_EMPLEADO'
    end
    object qryUsuariosARCHIVOCONFGWIN: TIBStringField
      FieldName = 'ARCHIVOCONFGWIN'
      Origin = 'USUARIO.ARCHIVOCONFGWIN'
      Size = 60
    end
  end
  object tblTipoUsuario: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_USUARIO'
    Left = 88
    Top = 136
    object tblTipoUsuarioTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object tblTipoUsuarioDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object qryEmpleados: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT codigo, NOMBRE||" "|| apellido nombre From EMPLEADO')
    Left = 160
    Top = 32
  end
  object tblOficina: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'OFICINA'
    Left = 160
    Top = 88
    object tblOficinaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblOficinaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 35
    end
    object tblOficinaCODIGO_CIUDDAD: TIntegerField
      FieldName = 'CODIGO_CIUDDAD'
    end
  end
  object ibsqlUpdRegCantCorrida: TIBSQL
    Database = dmCon.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'update registro'
      'set cantcorrida =:xcant')
    Transaction = dmCon.IBTransaction1
    Left = 256
    Top = 72
  end
  object tblEmpleados: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_CIA'
        DataType = ftInteger
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'APELLIDO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'CEDULA'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FOTO'
        DataType = ftBlob
      end
      item
        Name = 'PASSPORT'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'CALLE'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NUM_CASA'
        DataType = ftSmallint
      end
      item
        Name = 'CIUDAD'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'PAIS'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TELEF_CASA'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'TELEF_OFICINA'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'CELULAR'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'SEXO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ESTADO_CIVIL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TELEF_REFERENCIA'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'NOMBRE_REFERENCIA'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'FECHA_NAC'
        DataType = ftDateTime
      end
      item
        Name = 'NACIONALIDAD'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FECHA_ENTRADA'
        DataType = ftDateTime
      end
      item
        Name = 'FECHA_SALIDA'
        DataType = ftDateTime
      end
      item
        Name = 'SALARIO'
        DataType = ftFloat
      end
      item
        Name = 'TIPO_NOMINA'
        DataType = ftSmallint
      end
      item
        Name = 'TIPO_EMPLEADO'
        DataType = ftSmallint
      end
      item
        Name = 'DEPTO_EMP'
        DataType = ftSmallint
      end
      item
        Name = 'SECCION'
        DataType = ftSmallint
      end
      item
        Name = 'CARGO'
        DataType = ftSmallint
      end
      item
        Name = 'PAGA_AFP'
        DataType = ftSmallint
      end
      item
        Name = 'PAGA_TSS'
        DataType = ftSmallint
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FECHA_IN'
        DataType = ftDateTime
      end
      item
        Name = 'IN_POR'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'FECHA_MOD'
        DataType = ftDateTime
      end
      item
        Name = 'MOD_POR'
        DataType = ftString
        Size = 12
      end>
    IndexDefs = <
      item
        Name = 'USUARIOINDEX1'
        Fields = 'NUMERO'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY55'
        Fields = 'NUMERO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'EMPLEADO'
    Left = 272
    Top = 144
    object tblEmpleadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblEmpleadosCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
    end
    object tblEmpleadosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 35
    end
    object tblEmpleadosAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Size = 35
    end
    object tblEmpleadosCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Size = 14
    end
    object tblEmpleadosFOTO: TBlobField
      FieldName = 'FOTO'
    end
    object tblEmpleadosPASSPORT: TIBStringField
      FieldName = 'PASSPORT'
      Size = 14
    end
    object tblEmpleadosCALLE: TIBStringField
      FieldName = 'CALLE'
      Size = 40
    end
    object tblEmpleadosNUM_CASA: TSmallintField
      FieldName = 'NUM_CASA'
    end
    object tblEmpleadosCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Size = 40
    end
    object tblEmpleadosPAIS: TIBStringField
      FieldName = 'PAIS'
      Size = 40
    end
    object tblEmpleadosTELEF_CASA: TIBStringField
      FieldName = 'TELEF_CASA'
      Size = 12
    end
    object tblEmpleadosTELEF_OFICINA: TIBStringField
      FieldName = 'TELEF_OFICINA'
      Size = 12
    end
    object tblEmpleadosCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Size = 12
    end
    object tblEmpleadosEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object tblEmpleadosSEXO: TIBStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object tblEmpleadosESTADO_CIVIL: TIBStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 1
    end
    object tblEmpleadosTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Size = 12
    end
    object tblEmpleadosNOMBRE_REFERENCIA: TIBStringField
      FieldName = 'NOMBRE_REFERENCIA'
      Size = 40
    end
    object tblEmpleadosFECHA_NAC: TDateTimeField
      FieldName = 'FECHA_NAC'
    end
    object tblEmpleadosNACIONALIDAD: TIBStringField
      FieldName = 'NACIONALIDAD'
      Size = 1
    end
    object tblEmpleadosFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
    end
    object tblEmpleadosFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
    end
    object tblEmpleadosSALARIO: TFloatField
      FieldName = 'SALARIO'
    end
    object tblEmpleadosTIPO_NOMINA: TSmallintField
      FieldName = 'TIPO_NOMINA'
    end
    object tblEmpleadosTIPO_EMPLEADO: TSmallintField
      FieldName = 'TIPO_EMPLEADO'
    end
    object tblEmpleadosDEPTO_EMP: TSmallintField
      FieldName = 'DEPTO_EMP'
    end
    object tblEmpleadosSECCION: TSmallintField
      FieldName = 'SECCION'
    end
    object tblEmpleadosCARGO: TSmallintField
      FieldName = 'CARGO'
    end
    object tblEmpleadosPAGA_AFP: TSmallintField
      FieldName = 'PAGA_AFP'
    end
    object tblEmpleadosPAGA_TSS: TSmallintField
      FieldName = 'PAGA_TSS'
    end
    object tblEmpleadosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object tblEmpleadosFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
    end
    object tblEmpleadosIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Size = 12
    end
    object tblEmpleadosFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
    end
    object tblEmpleadosMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Size = 12
    end
  end
  object dstblEmpleados: TDataSource
    DataSet = tblEmpleados
    Left = 176
    Top = 144
  end
end
