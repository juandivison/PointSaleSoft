object dmComision: TdmComision
  OldCreateOrder = False
  Left = 192
  Top = 111
  Height = 288
  Width = 280
  object tblComisiones: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from COMISION'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  TIPO = :OLD_TIPO')
    InsertSQL.Strings = (
      'insert into COMISION'
      
        '  (CODIGO, TIPO, FECHA_INICIAL, FECHA_FINAL, MONTO_COMISION, STA' +
        'TUS)'
      'values'
      
        '  (:CODIGO, :TIPO, :FECHA_INICIAL, :FECHA_FINAL, :MONTO_COMISION' +
        ', :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  TIPO,'
      '  FECHA_INICIAL,'
      '  FECHA_FINAL,'
      '  MONTO_COMISION,'
      '  STATUS'
      'from COMISION '
      'where'
      '  CODIGO = :CODIGO and'
      '  TIPO = :TIPO')
    SelectSQL.Strings = (
      'Select  * from COMISION'
      'where :fecha between fecha_inicial and fecha_final'
      'order by codigo, tipo')
    ModifySQL.Strings = (
      'update COMISION'
      'set'
      '  CODIGO = :CODIGO,'
      '  TIPO = :TIPO,'
      '  FECHA_INICIAL = :FECHA_INICIAL,'
      '  FECHA_FINAL = :FECHA_FINAL,'
      '  MONTO_COMISION = :MONTO_COMISION,'
      '  STATUS = :STATUS'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  TIPO = :OLD_TIPO')
    Left = 88
    Top = 40
    object tblComisionesCODIGO: TIBStringField
      DisplayLabel = 'Codigo'
      DisplayWidth = 8
      FieldName = 'CODIGO'
      Origin = 'COMISION.CODIGO'
      Required = True
      Size = 12
    end
    object tblComisionesTIPO: TSmallintField
      DisplayLabel = 'Tipo'
      DisplayWidth = 7
      FieldName = 'TIPO'
      Origin = 'COMISION.TIPO'
    end
    object tblComisionesFECHA_INICIAL: TDateTimeField
      DisplayLabel = 'Fecha Inicial'
      DisplayWidth = 18
      FieldName = 'FECHA_INICIAL'
      Origin = 'COMISION.FECHA_INICIAL'
    end
    object tblComisionesFECHA_FINAL: TDateTimeField
      DisplayLabel = 'Fecha Final'
      DisplayWidth = 15
      FieldName = 'FECHA_FINAL'
      Origin = 'COMISION.FECHA_FINAL'
    end
    object tblComisionesMONTO_COMISION: TFloatField
      DisplayLabel = 'Monto Comision'
      DisplayWidth = 15
      FieldName = 'MONTO_COMISION'
      Origin = 'COMISION.MONTO_COMISION'
    end
    object tblComisionesSTATUS: TIBStringField
      DisplayLabel = 'Status'
      DisplayWidth = 6
      FieldName = 'STATUS'
      Origin = 'COMISION.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object tblTipoComision: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_COMISION'
    Left = 88
    Top = 96
  end
  object tblInventarioProd: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    OnCalcFields = tblInventarioProdCalcFields
    BufferChunks = 1000
    CachedUpdates = True
    TableName = 'INVENTARIO_PRODUCTO'
    Left = 192
    Top = 48
    object tblInventarioProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblInventarioProdCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Size = 40
    end
    object tblInventarioProdDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object tblInventarioProdCodigoMasDesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'CodigoMasDesc'
      Size = 45
      Calculated = True
    end
  end
  object dstblInventarioProd: TDataSource
    DataSet = tblInventarioProd
    Left = 200
    Top = 96
  end
end
