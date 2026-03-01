object dmDescuentosNom: TdmDescuentosNom
  OldCreateOrder = False
  Left = 838
  Top = 157
  Height = 363
  Width = 246
  object tblDescNomina: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from DESCUENTO_NOMINA'
      'where'
      '  TIPO_NOMINA = :OLD_TIPO_NOMINA and'
      '  CODIGO_DESCUENTO = :OLD_CODIGO_DESCUENTO and'
      '  FECHA_INICIAL = :OLD_FECHA_INICIAL and'
      '  FECHA_FINAL = :OLD_FECHA_FINAL')
    InsertSQL.Strings = (
      'insert into DESCUENTO_NOMINA'
      
        '  (TIPO_NOMINA, CODIGO_DESCUENTO, FECHA_INICIAL, FECHA_FINAL, PO' +
        'RCIENTO_EMP, '
      '   PORCIENTO_EMPLEADOR, DESCRIPCION, STATUS)'
      'values'
      
        '  (:TIPO_NOMINA, :CODIGO_DESCUENTO, :FECHA_INICIAL, :FECHA_FINAL' +
        ', :PORCIENTO_EMP, '
      '   :PORCIENTO_EMPLEADOR, :DESCRIPCION, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  TIPO_NOMINA,'
      '  CODIGO_DESCUENTO,'
      '  FECHA_INICIAL,'
      '  FECHA_FINAL,'
      '  PORCIENTO_EMP,'
      '  PORCIENTO_EMPLEADOR,'
      '  DESCRIPCION,'
      '  STATUS'
      'from DESCUENTO_NOMINA '
      'where'
      '  TIPO_NOMINA = :TIPO_NOMINA and'
      '  CODIGO_DESCUENTO = :CODIGO_DESCUENTO and'
      '  FECHA_INICIAL = :FECHA_INICIAL and'
      '  FECHA_FINAL = :FECHA_FINAL')
    SelectSQL.Strings = (
      'Select  * from DESCUENTO_NOMINA'
      'Where :fecha between fecha_inicial and fecha_final')
    ModifySQL.Strings = (
      'update DESCUENTO_NOMINA'
      'set'
      '  TIPO_NOMINA = :TIPO_NOMINA,'
      '  CODIGO_DESCUENTO = :CODIGO_DESCUENTO,'
      '  FECHA_INICIAL = :FECHA_INICIAL,'
      '  FECHA_FINAL = :FECHA_FINAL,'
      '  PORCIENTO_EMP = :PORCIENTO_EMP,'
      '  PORCIENTO_EMPLEADOR = :PORCIENTO_EMPLEADOR,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  STATUS = :STATUS'
      'where'
      '  TIPO_NOMINA = :OLD_TIPO_NOMINA and'
      '  CODIGO_DESCUENTO = :OLD_CODIGO_DESCUENTO and'
      '  FECHA_INICIAL = :OLD_FECHA_INICIAL and'
      '  FECHA_FINAL = :OLD_FECHA_FINAL')
    Left = 40
    Top = 32
    object tblDescNominaCODIGO_DESCUENTO: TSmallintField
      DisplayLabel = 'CodDesc'
      FieldName = 'CODIGO_DESCUENTO'
      Origin = 'DESCUENTO_NOMINA.CODIGO_DESCUENTO'
      Required = True
    end
    object tblDescNominaFECHA_INICIAL: TDateTimeField
      DisplayLabel = 'Fecha Inicial'
      FieldName = 'FECHA_INICIAL'
      Origin = 'DESCUENTO_NOMINA.FECHA_INICIAL'
      Required = True
    end
    object tblDescNominaFECHA_FINAL: TDateTimeField
      DisplayLabel = 'Fecha Final'
      FieldName = 'FECHA_FINAL'
      Origin = 'DESCUENTO_NOMINA.FECHA_FINAL'
      Required = True
    end
    object tblDescNominaPORCIENTO_EMP: TFloatField
      DisplayLabel = '%Empleado'
      FieldName = 'PORCIENTO_EMP'
      Origin = 'DESCUENTO_NOMINA.PORCIENTO_EMP'
      DisplayFormat = ',0.00000'
    end
    object tblDescNominaPORCIENTO_EMPLEADOR: TFloatField
      DisplayLabel = '%Empleador'
      FieldName = 'PORCIENTO_EMPLEADOR'
      Origin = 'DESCUENTO_NOMINA.PORCIENTO_EMPLEADOR'
      DisplayFormat = ',0.00000'
    end
    object tblDescNominaDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'DESCUENTO_NOMINA.DESCRIPCION'
      Size = 30
    end
    object tblDescNominaSTATUS: TIBStringField
      DisplayLabel = 'St'
      FieldName = 'STATUS'
      Origin = 'DESCUENTO_NOMINA.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblDescNominaTIPO_NOMINA: TIntegerField
      FieldName = 'TIPO_NOMINA'
      Origin = 'DESCUENTO_NOMINA.TIPO_NOMINA'
      Required = True
    end
  end
  object tblTipoDescuento: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_DESCUENTO'
    Left = 32
    Top = 88
    object tblTipoDescuentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblTipoDescuentoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object dstblTipoDescuento: TDataSource
    DataSet = tblTipoDescuento
    Left = 144
    Top = 88
  end
  object tblTipoNomina: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_NOMINA'
    Left = 32
    Top = 144
    object tblTipoNominaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblTipoNominaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object dsTipoNomina: TDataSource
    DataSet = tblTipoNomina
    Left = 144
    Top = 144
  end
  object qryTipoDescNom: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from DESCUENTO_NOMINA'
      'Where  (fecha_final  >=  :fechaini)'
      ' AND    (fecha_inicial <=  :fechafin)')
    Left = 48
    Top = 208
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryTipoDescNomTIPO_NOMINA: TIntegerField
      DisplayLabel = 'TipoNom'
      FieldName = 'TIPO_NOMINA'
      Origin = 'DESCUENTO_NOMINA.TIPO_NOMINA'
      Required = True
    end
    object qryTipoDescNomCODIGO_DESCUENTO: TSmallintField
      DisplayLabel = 'CodDesc'
      FieldName = 'CODIGO_DESCUENTO'
      Origin = 'DESCUENTO_NOMINA.CODIGO_DESCUENTO'
      Required = True
    end
    object qryTipoDescNomFECHA_INICIAL: TDateTimeField
      DisplayLabel = 'FechaInicial'
      FieldName = 'FECHA_INICIAL'
      Origin = 'DESCUENTO_NOMINA.FECHA_INICIAL'
      Required = True
    end
    object qryTipoDescNomFECHA_FINAL: TDateTimeField
      DisplayLabel = 'FechaFinal'
      FieldName = 'FECHA_FINAL'
      Origin = 'DESCUENTO_NOMINA.FECHA_FINAL'
      Required = True
    end
    object qryTipoDescNomPORCIENTO_EMP: TFloatField
      DisplayLabel = '%Emp'
      FieldName = 'PORCIENTO_EMP'
      Origin = 'DESCUENTO_NOMINA.PORCIENTO_EMP'
    end
    object qryTipoDescNomPORCIENTO_EMPLEADOR: TFloatField
      DisplayLabel = '%Empleador'
      FieldName = 'PORCIENTO_EMPLEADOR'
      Origin = 'DESCUENTO_NOMINA.PORCIENTO_EMPLEADOR'
    end
    object qryTipoDescNomDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DESCUENTO_NOMINA.DESCRIPCION'
      Size = 30
    end
    object qryTipoDescNomSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DESCUENTO_NOMINA.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryFechasTipoDes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select Distinct   fecha_inicial,fecha_final '
      'From DESCUENTO_NOMINA'
      'Order by fecha_inicial')
    Left = 144
    Top = 200
    object qryFechasTipoDesFECHA_INICIAL: TDateTimeField
      FieldName = 'FECHA_INICIAL'
      Origin = 'DESCUENTO_NOMINA.FECHA_INICIAL'
      Required = True
    end
    object qryFechasTipoDesFECHA_FINAL: TDateTimeField
      FieldName = 'FECHA_FINAL'
      Origin = 'DESCUENTO_NOMINA.FECHA_FINAL'
      Required = True
    end
  end
end
