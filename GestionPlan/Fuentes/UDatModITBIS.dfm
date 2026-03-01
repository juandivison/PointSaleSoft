object dmItbis: TdmItbis
  OldCreateOrder = False
  Left = 510
  Top = 286
  Height = 248
  Width = 315
  object tblItbis: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    FieldDefs = <
      item
        Name = 'GRUPO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'FECHA_INI'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'FECHA_FIN'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'PORCIENTO'
        DataType = ftFloat
      end
      item
        Name = 'OBSERVACIONES'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'STATUS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'ITBIINDEX1'
        Fields = 'FECHA_INI'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY31'
        Fields = 'FECHA_INI'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'ITBI'
    Left = 56
    Top = 8
    object tblItbisGRUPO: TSmallintField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object tblItbisFECHA_INI: TDateTimeField
      DisplayLabel = 'FechaIni'
      FieldName = 'FECHA_INI'
    end
    object tblItbisFECHA_FIN: TDateTimeField
      DisplayLabel = 'FechaFin'
      FieldName = 'FECHA_FIN'
    end
    object tblItbisPORCIENTO: TFloatField
      DisplayLabel = '%Porciento'
      FieldName = 'PORCIENTO'
    end
    object tblItbisOBSERVACIONES: TIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 40
    end
    object tblItbisSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object dstblItbis: TDataSource
    DataSet = tblItbis
    Left = 120
    Top = 16
  end
end
