object dmCiudades: TdmCiudades
  OldCreateOrder = False
  Left = 257
  Top = 115
  Height = 150
  Width = 215
  object tblCiudades: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CIUDAD'
    Left = 88
    Top = 8
    object tblCiudadesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblCiudadesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 35
    end
    object tblCiudadesVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object tblCiudadesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object dstblCiudades: TDataSource
    DataSet = tblCiudades
    Left = 88
    Top = 64
  end
end
