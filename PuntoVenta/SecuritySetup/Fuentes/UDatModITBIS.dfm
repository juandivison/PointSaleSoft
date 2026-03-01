object dmItbis: TdmItbis
  OldCreateOrder = False
  Left = 192
  Top = 114
  Height = 150
  Width = 215
  object tblItbis: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
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
