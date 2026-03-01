object dmDatos: TdmDatos
  OldCreateOrder = False
  Left = 191
  Top = 111
  Height = 217
  Width = 134
  object qryTasa: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM VALORMONEDA (:CODIGO,:FECHA_SERVICIO)')
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_SERVICIO'
        ParamType = ptInput
      end>
    object qryTasaSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VALORMONEDA.SERIE'
    end
    object qryTasaVALORMONEDA: TFloatField
      FieldName = 'VALORMONEDA'
      Origin = 'VALORMONEDA.VALORMONEDA'
    end
    object qryTasaSIMBOLO: TIBStringField
      FieldName = 'SIMBOLO'
      Origin = 'VALORMONEDA.SIMBOLO'
      FixedChar = True
      Size = 6
    end
  end
  object dsqryTasa: TDataSource
    DataSet = qryTasa
    Left = 32
    Top = 72
  end
end
