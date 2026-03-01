object dmRutas: TdmRutas
  OldCreateOrder = False
  Left = 384
  Top = 259
  Height = 264
  Width = 349
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
      
        '  (CODIGO, CODIGO_EMP, FICHA, FECHA, STATUS, TIPO_COMISION, MONT' +
        'O_COMISION)'
      'values'
      
        '  (:CODIGO, :CODIGO_EMP, :FICHA, :FECHA, :STATUS, :TIPO_COMISION' +
        ', :MONTO_COMISION)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  CODIGO_EMP,'
      '  FICHA,'
      '  FECHA,'
      '  STATUS,'
      '  TIPO_COMISION,'
      '  MONTO_COMISION'
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
      '  TIPO_COMISION = :TIPO_COMISION,'
      '  MONTO_COMISION = :MONTO_COMISION'
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
    object tblRutasMONTO_COMISION: TFloatField
      FieldName = 'MONTO_COMISION'
      Origin = 'RUTA.MONTO_COMISION'
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
  object tblRutasVta: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from RUTA_VTA'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into RUTA_VTA'
      
        '  (CODIGO, DESCRIPCION, FECHA, STATUS, TIPO_COMISION, MONTO_COMI' +
        'SION)'
      'values'
      
        '  (:CODIGO, :DESCRIPCION, :FECHA, :STATUS, :TIPO_COMISION, :MONT' +
        'O_COMISION)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  DESCRIPCION,'
      '  FECHA,'
      '  STATUS,'
      '  TIPO_COMISION,'
      '  MONTO_COMISION'
      'from RUTA_VTA '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'select * from RUTA_VTA')
    ModifySQL.Strings = (
      'update RUTA_VTA'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  FECHA = :FECHA,'
      '  STATUS = :STATUS,'
      '  TIPO_COMISION = :TIPO_COMISION,'
      '  MONTO_COMISION = :MONTO_COMISION'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 256
    Top = 112
    object tblRutasVtaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'RUTA_VTA.CODIGO'
      Required = True
    end
    object tblRutasVtaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'RUTA_VTA.DESCRIPCION'
      Required = True
      Size = 30
    end
    object tblRutasVtaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'RUTA_VTA.FECHA'
    end
    object tblRutasVtaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'RUTA_VTA.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblRutasVtaTIPO_COMISION: TIntegerField
      FieldName = 'TIPO_COMISION'
      Origin = 'RUTA_VTA.TIPO_COMISION'
    end
    object tblRutasVtaMONTO_COMISION: TFloatField
      FieldName = 'MONTO_COMISION'
      Origin = 'RUTA_VTA.MONTO_COMISION'
    end
  end
  object dstblRutasVta: TDataSource
    DataSet = tblRutasVta
    Left = 256
    Top = 160
  end
end
