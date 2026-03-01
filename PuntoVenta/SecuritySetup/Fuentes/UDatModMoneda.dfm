object dmMoneda: TdmMoneda
  OldCreateOrder = False
  Left = 693
  Top = 155
  Height = 180
  Width = 311
  object qryibsqlTasa: TIBSQL
    Database = dmCon.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM VALORMONEDA (:CODIGO,:FECHA_SERVICIO)')
    Transaction = dmCon.IBTransaction1
    Left = 128
    Top = 40
  end
  object tblMoneda: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'MONEDA'
    Left = 40
    Top = 8
    object tblMonedaCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Size = 1
    end
    object tblMonedaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 15
    end
    object tblMonedaSIMBOLO: TIBStringField
      FieldName = 'SIMBOLO'
      Size = 6
    end
  end
end
