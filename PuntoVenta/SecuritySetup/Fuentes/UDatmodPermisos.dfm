object dmpermisos: Tdmpermisos
  OldCreateOrder = False
  Left = 622
  Top = 150
  Height = 295
  Width = 403
  object qryUsuarios: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM PROC_GETUSUARIOYROLES(:TIPO)')
    Left = 168
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Tipo'
        ParamType = ptInput
      end>
  end
  object IBStoredProc1: TIBStoredProc
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    StoredProcName = 'PROC_GETUSUARIOYROLES'
    Left = 152
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'USERID'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'DESCRIPCION'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end>
  end
  object DataSource1: TDataSource
    DataSet = IBStoredProc1
    Left = 152
    Top = 168
  end
end
