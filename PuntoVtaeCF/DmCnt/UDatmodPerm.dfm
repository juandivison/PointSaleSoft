object dmPerm: TdmPerm
  OldCreateOrder = False
  Left = 882
  Top = 219
  Height = 262
  Width = 467
  object qryLogErrores: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from LOG_ERRORES'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into LOG_ERRORES'
      '  (SERIE, FECHA, USUARIO, MODULO, UNIDAD, DESCRIPCION)'
      'values'
      '  (:SERIE, :FECHA, :USUARIO, :MODULO, :UNIDAD, :DESCRIPCION)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  FECHA,'
      '  USUARIO,'
      '  MODULO,'
      '  UNIDAD,'
      '  DESCRIPCION'
      'from LOG_ERRORES '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * from LOG_ERRORES')
    ModifySQL.Strings = (
      'update LOG_ERRORES'
      'set'
      '  SERIE = :SERIE,'
      '  FECHA = :FECHA,'
      '  USUARIO = :USUARIO,'
      '  MODULO = :MODULO,'
      '  UNIDAD = :UNIDAD,'
      '  DESCRIPCION = :DESCRIPCION'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 88
    Top = 32
    object qryLogErroresSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'LOG_ERRORES.SERIE'
      Required = True
    end
    object qryLogErroresFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'LOG_ERRORES.FECHA'
    end
    object qryLogErroresUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = 'LOG_ERRORES.USUARIO'
      Size = 12
    end
    object qryLogErroresMODULO: TIBStringField
      FieldName = 'MODULO'
      Origin = 'LOG_ERRORES.MODULO'
      Size = 30
    end
    object qryLogErroresUNIDAD: TIBStringField
      FieldName = 'UNIDAD'
      Origin = 'LOG_ERRORES.UNIDAD'
    end
    object qryLogErroresDESCRIPCION: TMemoField
      FieldName = 'DESCRIPCION'
      Origin = 'LOG_ERRORES.DESCRIPCION'
      BlobType = ftMemo
      Size = 8
    end
  end
  object dtqryLogErrores: TDataSource
    DataSet = qryLogErrores
    Left = 88
    Top = 88
  end
end
