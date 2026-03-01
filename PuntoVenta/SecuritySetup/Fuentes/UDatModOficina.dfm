object dmOficina: TdmOficina
  OldCreateOrder = False
  Left = 361
  Top = 169
  Height = 301
  Width = 289
  object tblOficina: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'OFICINA'
    Left = 72
    Top = 24
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
  object dstblOficina: TDataSource
    DataSet = tblOficina
    Left = 160
    Top = 24
  end
  object tblCiudades: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CIUDAD'
    Left = 72
    Top = 80
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
    Left = 168
    Top = 80
  end
end
