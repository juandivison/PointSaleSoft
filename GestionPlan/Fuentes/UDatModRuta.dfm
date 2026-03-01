object dmRutas: TdmRutas
  OldCreateOrder = False
  Left = 518
  Top = 225
  Height = 227
  Width = 278
  object tblRutas: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from RUTA'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  CODIGO_EMP = :OLD_CODIGO_EMP')
    InsertSQL.Strings = (
      'insert into RUTA'
      '  (CODIGO, CODIGO_EMP, FICHA, FECHA, STATUS, TIPO_COMISION)'
      'values'
      
        '  (:CODIGO, :CODIGO_EMP, :FICHA, :FECHA, :STATUS, :TIPO_COMISION' +
        ')')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  CODIGO_EMP,'
      '  FICHA,'
      '  FECHA,'
      '  STATUS,'
      '  TIPO_COMISION'
      'from RUTA '
      'where'
      '  CODIGO = :CODIGO and'
      '  CODIGO_EMP = :CODIGO_EMP')
    SelectSQL.Strings = (
      'select * from RUTA')
    ModifySQL.Strings = (
      'update RUTA'
      'set'
      '  CODIGO = :CODIGO,'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  FICHA = :FICHA,'
      '  FECHA = :FECHA,'
      '  STATUS = :STATUS,'
      '  TIPO_COMISION = :TIPO_COMISION'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  CODIGO_EMP = :OLD_CODIGO_EMP')
    Left = 56
    Top = 40
    object tblRutasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'RUTA.CODIGO'
      Required = True
    end
    object tblRutasCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'RUTA.CODIGO_EMP'
      Required = True
    end
    object tblRutasFICHA: TIntegerField
      FieldName = 'FICHA'
      Origin = 'RUTA.FICHA'
    end
    object tblRutasFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'RUTA.FECHA'
    end
    object tblRutasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'RUTA.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblRutasTIPO_COMISION: TIntegerField
      FieldName = 'TIPO_COMISION'
      Origin = 'RUTA.TIPO_COMISION'
    end
  end
  object qryEmpleados: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select APELLIDO, NOMBRE, CODIGO,'
      'apellido||" "||nombre nombre_empleado  from EMPLEADO'
      'where STATUS in ('#39'A'#39')')
    Left = 192
    Top = 40
    object qryEmpleadosAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADO.APELLIDO'
      Size = 35
    end
    object qryEmpleadosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object qryEmpleadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMPLEADO.CODIGO'
      Required = True
    end
    object qryEmpleadosNOMBRE_EMPLEADO: TIBStringField
      FieldName = 'NOMBRE_EMPLEADO'
      Size = 71
    end
  end
  object tblTipoComision: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_COMISION'
    Left = 136
    Top = 104
  end
end
