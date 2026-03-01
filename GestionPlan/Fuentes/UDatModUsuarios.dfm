object dmUsuarios: TdmUsuarios
  OldCreateOrder = False
  Left = 765
  Top = 108
  Height = 288
  Width = 310
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
      'SELECT codigo, NOMBRE||" "|| apellido nombre From EMPLEADO')
    Left = 160
    Top = 32
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
end
