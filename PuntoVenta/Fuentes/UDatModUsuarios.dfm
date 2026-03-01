object dmUsuarios: TdmUsuarios
  OldCreateOrder = False
  Left = 465
  Top = 235
  Height = 406
  Width = 515
  object tblUsuarios: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
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
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
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
      
        'select ARCHIVOCONFGWIN, trim(clave) clave, CODIGO, CODIGO_EMPLEA' +
        'DO, FECHA_ENTRADA, FECHA_SALIDA, FECHA_VENCE_CLAVE, FOTO, NOMBRE' +
        'COMPLETO, NUMERO, STATUS, TIPO '
      'from USUARIO')
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
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
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
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT E.codigo, E.NOMBRE||" "|| E.apellido nombre, c.nombre des' +
        'c_cargo '
      'From EMPLEADO E'
      'LEFT OUTER JOIN CARGO_EMPLEADOS C ON C.CODIGO = E.CARGO')
    Left = 160
    Top = 32
    object qryEmpleadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMPLEADO.CODIGO'
      Required = True
    end
    object qryEmpleadosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 71
    end
    object qryEmpleadosDESC_CARGO: TIBStringField
      FieldName = 'DESC_CARGO'
      Origin = 'CARGO_EMPLEADOS.NOMBRE'
      Size = 40
    end
  end
  object procMantRegDet: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_MANT_REGISTRO_DET'
    Left = 176
    Top = 96
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'PERMITIDO'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'LOGUEADO'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'ACCION'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMBRE_PC'
        ParamType = ptInput
      end>
  end
  object stpBuscarPermisosOLD: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_BUSCARPERMISOS'
    Left = 176
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PROCESOID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'TAREAID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'STATUS'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'IDUSUARIO'
        ParamType = ptInput
      end>
  end
  object stpBuscarPermisos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Distinct'
      
        '  p.userid, p.isPerson, p.PROCESOID, p.TAREAID, p.STATUS, t.visi' +
        'ble'
      'FROM'
      '   PERMISOS p, tareas t'
      'WHERE p.tareaid = t.tareaid'
      'AND p.IsPerson =:ISPERSON'
      'AND p.userid =:USERID')
    Left = 168
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ISPERSON'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'USERID'
        ParamType = ptInput
      end>
    object stpBuscarPermisosPROCESOID: TIntegerField
      FieldName = 'PROCESOID'
      Origin = 'PROC_BUSCARPERMISOS.PROCESOID'
    end
    object stpBuscarPermisosTAREAID: TIntegerField
      FieldName = 'TAREAID'
      Origin = 'PROC_BUSCARPERMISOS.TAREAID'
    end
    object stpBuscarPermisosSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'PROC_BUSCARPERMISOS.STATUS'
    end
    object stpBuscarPermisosVISIBLE: TSmallintField
      FieldName = 'VISIBLE'
      Origin = 'PROC_BUSCARPERMISOS.VISIBLE'
    end
    object stpBuscarPermisosISPERSON: TIntegerField
      FieldName = 'ISPERSON'
      Origin = 'PROC_BUSCARPERMISOS.ISPERSON'
    end
    object stpBuscarPermisosUSERID: TIntegerField
      FieldName = 'USERID'
      Origin = 'PROC_BUSCARPERMISOS.USERID'
    end
  end
  object qryRoles: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select id_rol, id_usuario '
      'From ROLES_USUARIO'
      'Where id_usuario=:idusuario')
    Left = 56
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idusuario'
        ParamType = ptInput
      end>
    object qryRolesID_ROL: TIntegerField
      FieldName = 'ID_ROL'
      Origin = 'ROLES_USUARIO.ID_ROL'
      Required = True
    end
    object qryRolesID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ROLES_USUARIO.ID_USUARIO'
      Required = True
    end
  end
  object tblVendedores: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from VENDEDORES'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into VENDEDORES'
      
        '  (CODIGO, FOTO, NOMBRE, DIRECCION, TELEFONO, CELULAR, STATUS, E' +
        'MAIL, WEBSITE, '
      
        '   PAIS, CIUDAD, CEDULA, REFERENCIA, TELEF_REFERENCIA, OTRO_TELE' +
        'FONO, APODO, '
      '   INSERTADO_POR, FECHA_INSERTADO, FECHA_MOD, MODI_POR)'
      'values'
      
        '  (:CODIGO, :FOTO, :NOMBRE, :DIRECCION, :TELEFONO, :CELULAR, :ST' +
        'ATUS, :EMAIL, '
      
        '   :WEBSITE, :PAIS, :CIUDAD, :CEDULA, :REFERENCIA, :TELEF_REFERE' +
        'NCIA, :OTRO_TELEFONO, '
      
        '   :APODO, :INSERTADO_POR, :FECHA_INSERTADO, :FECHA_MOD, :MODI_P' +
        'OR)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  FOTO,'
      '  NOMBRE,'
      '  DIRECCION,'
      '  TELEFONO,'
      '  CELULAR,'
      '  STATUS,'
      '  EMAIL,'
      '  WEBSITE,'
      '  PAIS,'
      '  CIUDAD,'
      '  CEDULA,'
      '  REFERENCIA,'
      '  TELEF_REFERENCIA,'
      '  OTRO_TELEFONO,'
      '  APODO,'
      '  INSERTADO_POR,'
      '  FECHA_INSERTADO,'
      '  FECHA_MOD,'
      '  MODI_POR'
      'from VENDEDORES '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'select *  from VENDEDORES')
    ModifySQL.Strings = (
      'update VENDEDORES'
      'set'
      '  CODIGO = :CODIGO,'
      '  FOTO = :FOTO,'
      '  NOMBRE = :NOMBRE,'
      '  DIRECCION = :DIRECCION,'
      '  TELEFONO = :TELEFONO,'
      '  CELULAR = :CELULAR,'
      '  STATUS = :STATUS,'
      '  EMAIL = :EMAIL,'
      '  WEBSITE = :WEBSITE,'
      '  PAIS = :PAIS,'
      '  CIUDAD = :CIUDAD,'
      '  CEDULA = :CEDULA,'
      '  REFERENCIA = :REFERENCIA,'
      '  TELEF_REFERENCIA = :TELEF_REFERENCIA,'
      '  OTRO_TELEFONO = :OTRO_TELEFONO,'
      '  APODO = :APODO,'
      '  INSERTADO_POR = :INSERTADO_POR,'
      '  FECHA_INSERTADO = :FECHA_INSERTADO,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MODI_POR = :MODI_POR'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 248
    Top = 32
    object tblVendedoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'VENDEDORES.CODIGO'
      Required = True
    end
    object tblVendedoresFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'VENDEDORES.FOTO'
      Size = 8
    end
    object tblVendedoresNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'VENDEDORES.NOMBRE'
      Required = True
      Size = 60
    end
    object tblVendedoresDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Origin = 'VENDEDORES.DIRECCION'
      Size = 60
    end
    object tblVendedoresTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'VENDEDORES.TELEFONO'
      Size = 14
    end
    object tblVendedoresCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'VENDEDORES.CELULAR'
      Size = 14
    end
    object tblVendedoresSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENDEDORES.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblVendedoresEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'VENDEDORES.EMAIL'
      Size = 40
    end
    object tblVendedoresWEBSITE: TIBStringField
      FieldName = 'WEBSITE'
      Origin = 'VENDEDORES.WEBSITE'
      Size = 40
    end
    object tblVendedoresPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'VENDEDORES.PAIS'
      Size = 30
    end
    object tblVendedoresCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'VENDEDORES.CIUDAD'
      Size = 30
    end
    object tblVendedoresCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'VENDEDORES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object tblVendedoresREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'VENDEDORES.REFERENCIA'
      Size = 40
    end
    object tblVendedoresTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'VENDEDORES.TELEF_REFERENCIA'
    end
    object tblVendedoresOTRO_TELEFONO: TIBStringField
      FieldName = 'OTRO_TELEFONO'
      Origin = 'VENDEDORES.OTRO_TELEFONO'
    end
    object tblVendedoresAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'VENDEDORES.APODO'
    end
    object tblVendedoresINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'VENDEDORES.INSERTADO_POR'
      Size = 12
    end
    object tblVendedoresFECHA_INSERTADO: TDateTimeField
      FieldName = 'FECHA_INSERTADO'
      Origin = 'VENDEDORES.FECHA_INSERTADO'
    end
    object tblVendedoresFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENDEDORES.FECHA_MOD'
    end
    object tblVendedoresMODI_POR: TIBStringField
      FieldName = 'MODI_POR'
      Origin = 'VENDEDORES.MODI_POR'
      Size = 12
    end
  end
  object dstblVendedores: TDataSource
    DataSet = tblVendedores
    Left = 256
    Top = 80
  end
  object tblOficina: TIBTable
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
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'CODIGO_CIUDDAD'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY90'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'OFICINAINDEX1'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'OFICINA'
    Left = 280
    Top = 144
    object tblOficinaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object tblOficinaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 35
    end
    object tblOficinaCODIGO_CIUDDAD: TIntegerField
      FieldName = 'CODIGO_CIUDDAD'
    end
  end
  object dstblEmpleados: TDataSource
    DataSet = qryEmpleados
    Left = 280
    Top = 200
  end
  object dstblOficina: TDataSource
    DataSet = tblOficina
    Left = 400
    Top = 160
  end
  object IBTable1: TIBTable
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
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'CODIGO_CIUDDAD'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'OFICINAINDEX1'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY85'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'OFICINA'
    Left = 400
    Top = 96
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO'
    end
    object IBStringField1: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 35
    end
    object IntegerField2: TIntegerField
      FieldName = 'CODIGO_CIUDDAD'
    end
  end
  object qryProcesos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Distinct p.PROCESOID'
      'FROM'
      '   PERMISOS p, tareas t'
      'WHERE p.tareaid = t.tareaid'
      'AND p.IsPerson =:isperson'
      'AND p.userid =:userid')
    Left = 392
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'isperson'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'userid'
        ParamType = ptInput
      end>
    object qryProcesosPROCESOID: TIntegerField
      FieldName = 'PROCESOID'
      Origin = 'PERMISOS.PROCESOID'
      Required = True
    end
  end
  object tblCiudad: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CIUDAD'
    Left = 64
    Top = 280
    object tblCiudadCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblCiudadDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 35
    end
    object tblCiudadVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object tblCiudadSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object dstblCiudad: TDataSource
    DataSet = tblCiudad
    Left = 152
    Top = 296
  end
  object qryEmpVentas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT E.codigo, E.NOMBRE||" "|| E.apellido nombre, c.nombre des' +
        'c_cargo '
      'From EMPLEADO E'
      'INNER JOIN CARGO_EMPLEADOS C ON C.CODIGO = E.CARGO'
      'Where UPPER(c.nombre) = '#39'VENDEDOR'#39)
    Left = 392
    Top = 272
    object qryEmpVentasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMPLEADO.CODIGO'
      Required = True
    end
    object qryEmpVentasNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 71
    end
    object qryEmpVentasDESC_CARGO: TIBStringField
      FieldName = 'DESC_CARGO'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
  end
  object qryAlmacenesInv: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from DIVISION_INVENTARIO')
    Left = 384
    Top = 32
    object qryAlmacenesInvINVENTARIO_ID: TIntegerField
      FieldName = 'INVENTARIO_ID'
      Origin = 'DIVISION_INVENTARIO.INVENTARIO_ID'
      Required = True
    end
    object qryAlmacenesInvDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DIVISION_INVENTARIO.DESCRIPCION'
      Size = 30
    end
    object qryAlmacenesInvSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DIVISION_INVENTARIO.STATUS'
      FixedChar = True
      Size = 1
    end
  end
end
