object dmUsuarios: TdmUsuarios
  OldCreateOrder = False
  Left = 708
  Top = 136
  Height = 422
  Width = 509
  object tblUsuarios: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
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
    Left = 80
    Top = 144
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
    AutoEdit = False
    DataSet = tblEmpleados
    Left = 176
    Top = 144
  end
  object dstblSecPermisos: TDataSource
    AutoEdit = False
    DataSet = tblSecPermisos
    Left = 176
    Top = 256
  end
  object dsqryUsuarios: TDataSource
    AutoEdit = False
    DataSet = qryUsuarios
    Left = 176
    Top = 200
  end
  object tblTareas: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TAREAS'
      'where'
      '  TAREAID = :OLD_TAREAID and'
      '  PROCESOID = :OLD_PROCESOID')
    InsertSQL.Strings = (
      'insert into TAREAS'
      '  (TAREAID, PROCESOID, DESCRIPCION, VISIBLE)'
      'values'
      '  (:TAREAID, :PROCESOID, :DESCRIPCION, :VISIBLE)')
    RefreshSQL.Strings = (
      'Select '
      '  TAREAID,'
      '  PROCESOID,'
      '  DESCRIPCION,'
      '  VISIBLE'
      'from TAREAS '
      'where'
      '  TAREAID = :TAREAID and'
      '  PROCESOID = :PROCESOID')
    SelectSQL.Strings = (
      'Select * from TAREAS')
    ModifySQL.Strings = (
      'update TAREAS'
      'set'
      '  TAREAID = :TAREAID,'
      '  PROCESOID = :PROCESOID,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  VISIBLE = :VISIBLE'
      'where'
      '  TAREAID = :OLD_TAREAID and'
      '  PROCESOID = :OLD_PROCESOID')
    GeneratorField.Field = 'TAREAID'
    GeneratorField.Generator = 'GEN_SEC_TAREA'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 352
    Top = 176
    object tblTareasTAREAID: TIntegerField
      FieldName = 'TAREAID'
      Origin = 'TAREAS.TAREAID'
      Required = True
    end
    object tblTareasPROCESOID: TIntegerField
      FieldName = 'PROCESOID'
      Origin = 'TAREAS.PROCESOID'
      Required = True
    end
    object tblTareasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TAREAS.DESCRIPCION'
      Size = 60
    end
    object tblTareasVISIBLE: TSmallintField
      FieldName = 'VISIBLE'
      Origin = 'TAREAS.VISIBLE'
    end
  end
  object dstblTareas: TDataSource
    AutoEdit = False
    DataSet = tblTareas
    Left = 264
    Top = 248
  end
  object tblSecPermisos: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PERMISOS'
      'where'
      '  PERMISOID = :OLD_PERMISOID and'
      '  PROCESOID = :OLD_PROCESOID and'
      '  TAREAID = :OLD_TAREAID and'
      '  USERID = :OLD_USERID and'
      '  ISPERSON = :OLD_ISPERSON')
    InsertSQL.Strings = (
      'insert into PERMISOS'
      '  (PERMISOID, PROCESOID, TAREAID, USERID, ISPERSON, STATUS)'
      'values'
      
        '  (:PERMISOID, :PROCESOID, :TAREAID, :USERID, :ISPERSON, :STATUS' +
        ')')
    RefreshSQL.Strings = (
      'Select '
      '  PERMISOID,'
      '  PROCESOID,'
      '  TAREAID,'
      '  USERID,'
      '  ISPERSON,'
      '  STATUS'
      'from PERMISOS '
      'where'
      '  PERMISOID = :PERMISOID and'
      '  PROCESOID = :PROCESOID and'
      '  TAREAID = :TAREAID and'
      '  USERID = :USERID and'
      '  ISPERSON = :ISPERSON')
    SelectSQL.Strings = (
      'select * from PERMISOS')
    ModifySQL.Strings = (
      'update PERMISOS'
      'set'
      '  PERMISOID = :PERMISOID,'
      '  PROCESOID = :PROCESOID,'
      '  TAREAID = :TAREAID,'
      '  USERID = :USERID,'
      '  ISPERSON = :ISPERSON,'
      '  STATUS = :STATUS'
      'where'
      '  PERMISOID = :OLD_PERMISOID and'
      '  PROCESOID = :OLD_PROCESOID and'
      '  TAREAID = :OLD_TAREAID and'
      '  USERID = :OLD_USERID and'
      '  ISPERSON = :OLD_ISPERSON')
    GeneratorField.Field = 'PERMISOID'
    GeneratorField.Generator = 'GEN_SEC_PERMISO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 272
    Top = 200
    object tblSecPermisosPERMISOID: TIntegerField
      FieldName = 'PERMISOID'
      Origin = 'PERMISOS.PERMISOID'
      Required = True
    end
    object tblSecPermisosPROCESOID: TIntegerField
      FieldName = 'PROCESOID'
      Origin = 'PERMISOS.PROCESOID'
      Required = True
    end
    object tblSecPermisosTAREAID: TIntegerField
      FieldName = 'TAREAID'
      Origin = 'PERMISOS.TAREAID'
      Required = True
    end
    object tblSecPermisosUSERID: TIntegerField
      FieldName = 'USERID'
      Origin = 'PERMISOS.USERID'
      Required = True
    end
    object tblSecPermisosISPERSON: TSmallintField
      FieldName = 'ISPERSON'
      Origin = 'PERMISOS.ISPERSON'
      Required = True
    end
    object tblSecPermisosSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'PERMISOS.STATUS'
    end
  end
  object tblProcesos: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PROCESOS'
      'where'
      '  PROCESOID = :OLD_PROCESOID')
    InsertSQL.Strings = (
      'insert into PROCESOS'
      '  (PROCESOID, DESCRIPCION)'
      'values'
      '  (:PROCESOID, :DESCRIPCION)')
    RefreshSQL.Strings = (
      'Select '
      '  PROCESOID,'
      '  DESCRIPCION'
      'from PROCESOS '
      'where'
      '  PROCESOID = :PROCESOID')
    SelectSQL.Strings = (
      'select *   from PROCESOS')
    ModifySQL.Strings = (
      'update PROCESOS'
      'set'
      '  PROCESOID = :PROCESOID,'
      '  DESCRIPCION = :DESCRIPCION'
      'where'
      '  PROCESOID = :OLD_PROCESOID')
    Left = 352
    Top = 224
    object tblProcesosPROCESOID: TIntegerField
      FieldName = 'PROCESOID'
      Origin = 'PROCESOS.PROCESOID'
      Required = True
    end
    object tblProcesosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROCESOS.DESCRIPCION'
      Size = 60
    end
  end
  object dstblProcesos: TDataSource
    AutoEdit = False
    DataSet = tblProcesos
    Left = 424
    Top = 240
  end
  object tblRoles: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from SEC_ROLES'
      'where'
      '  USERID = :OLD_USERID')
    InsertSQL.Strings = (
      'insert into SEC_ROLES'
      '  (USERID, DESCRIPCION)'
      'values'
      '  (:USERID, :DESCRIPCION)')
    RefreshSQL.Strings = (
      'Select '
      '  USERID,'
      '  DESCRIPCION'
      'from SEC_ROLES '
      'where'
      '  USERID = :USERID')
    SelectSQL.Strings = (
      'select *  from SEC_ROLES')
    ModifySQL.Strings = (
      'update SEC_ROLES'
      'set'
      '  USERID = :USERID,'
      '  DESCRIPCION = :DESCRIPCION'
      'where'
      '  USERID = :OLD_USERID')
    GeneratorField.Field = 'USERID'
    GeneratorField.Generator = 'GEN_SEC_ROLES'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 368
    Top = 120
    object tblRolesUSERID: TIntegerField
      FieldName = 'USERID'
      Origin = 'ROLES.USERID'
      Required = True
    end
    object tblRolesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'ROLES.DESCRIPCION'
      Size = 60
    end
  end
  object qryProcesos: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from PROCESOS')
    Left = 368
    Top = 72
    object qryProcesosPROCESOID: TIntegerField
      FieldName = 'PROCESOID'
      Origin = 'PROCESOS.PROCESOID'
      Required = True
    end
    object qryProcesosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROCESOS.DESCRIPCION'
      Size = 60
    end
  end
  object dstblRoles: TDataSource
    AutoEdit = False
    DataSet = tblRoles
    Left = 256
    Top = 304
  end
  object dsqryProcesos: TDataSource
    DataSet = qryProcesos
    Left = 368
    Top = 32
  end
  object qryRoles: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM SEC_ROLES')
    Left = 72
    Top = 208
    object qryRolesUSERID: TIntegerField
      FieldName = 'USERID'
      Origin = 'ROLES.USERID'
      Required = True
    end
    object qryRolesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'ROLES.DESCRIPCION'
      Size = 60
    end
  end
  object dsqryRoles: TDataSource
    AutoEdit = False
    DataSet = qryRoles
    Left = 72
    Top = 256
  end
  object qryTareas: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM TAREAS'
      'WHERE PROCESOID =:procesoid')
    Left = 176
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'procesoid'
        ParamType = ptInput
      end>
    object qryTareasTAREAID: TIntegerField
      FieldName = 'TAREAID'
      Origin = 'TAREAS.TAREAID'
      Required = True
    end
    object qryTareasPROCESOID: TIntegerField
      FieldName = 'PROCESOID'
      Origin = 'TAREAS.PROCESOID'
      Required = True
    end
    object qryTareasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TAREAS.DESCRIPCION'
      Size = 60
    end
  end
  object dsqryTareas: TDataSource
    AutoEdit = False
    DataSet = qryTareas
    Left = 72
    Top = 312
  end
  object tblRolUsuario: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from roles_usuario'
      'where'
      '  ID_ROL = :OLD_ID_ROL and'
      '  ID_USUARIO = :OLD_ID_USUARIO')
    InsertSQL.Strings = (
      'insert into roles_usuario'
      '  (ID_ROL, ID_USUARIO, CODIGO_USER, FECHA_IN, FECHA_UPDATE)'
      'values'
      '  (:ID_ROL, :ID_USUARIO, :CODIGO_USER, :FECHA_IN, :FECHA_UPDATE)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_ROL,'
      '  ID_USUARIO,'
      '  CODIGO_USER,'
      '  FECHA_IN,'
      '  FECHA_UPDATE'
      'from roles_usuario '
      'where'
      '  ID_ROL = :ID_ROL and'
      '  ID_USUARIO = :ID_USUARIO')
    SelectSQL.Strings = (
      'Select * From  roles_usuario'
      'Order by id_rol, id_usuario')
    ModifySQL.Strings = (
      'update roles_usuario'
      'set'
      '  ID_ROL = :ID_ROL,'
      '  ID_USUARIO = :ID_USUARIO,'
      '  CODIGO_USER = :CODIGO_USER,'
      '  FECHA_IN = :FECHA_IN,'
      '  FECHA_UPDATE = :FECHA_UPDATE'
      'where'
      '  ID_ROL = :OLD_ID_ROL and'
      '  ID_USUARIO = :OLD_ID_USUARIO')
    Left = 352
    Top = 296
    object tblRolUsuarioID_ROL: TIntegerField
      FieldName = 'ID_ROL'
      Origin = 'ROLES_USUARIO.ID_ROL'
      Required = True
    end
    object tblRolUsuarioID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ROLES_USUARIO.ID_USUARIO'
      Required = True
    end
    object tblRolUsuarioCODIGO_USER: TIntegerField
      FieldName = 'CODIGO_USER'
      Origin = 'ROLES_USUARIO.CODIGO_USER'
    end
    object tblRolUsuarioFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ROLES_USUARIO.FECHA_IN'
    end
    object tblRolUsuarioFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'ROLES_USUARIO.FECHA_UPDATE'
    end
    object tblRolUsuarioDescripcion: TStringField
      DisplayLabel = 'Nombre Rol'
      FieldKind = fkLookup
      FieldName = 'Descripcion'
      LookupDataSet = tblRolLookup
      LookupKeyFields = 'USERID'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'ID_ROL'
      Lookup = True
    end
    object tblRolUsuarioNombreUsuario: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreUsuario'
      LookupDataSet = tblUsuarioLookup
      LookupKeyFields = 'CODIGO_EMPLEADO'
      LookupResultField = 'NOMBRECOMPLETO'
      KeyFields = 'ID_USUARIO'
      Lookup = True
    end
  end
  object dstblRolUsuario: TDataSource
    AutoEdit = False
    DataSet = tblRolUsuario
    Left = 424
    Top = 312
  end
  object tblRolLookup: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'SEC_ROLES'
    Left = 432
    Top = 112
    object tblRolLookupUSERID: TIntegerField
      FieldName = 'USERID'
    end
    object tblRolLookupDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object tblUsuarioLookup: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'USUARIO'
    Left = 432
    Top = 160
    object tblUsuarioLookupNUMERO: TSmallintField
      FieldName = 'NUMERO'
    end
    object tblUsuarioLookupCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Size = 8
    end
    object tblUsuarioLookupCODIGO_EMPLEADO: TIntegerField
      FieldName = 'CODIGO_EMPLEADO'
    end
    object tblUsuarioLookupNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Size = 40
    end
  end
end
