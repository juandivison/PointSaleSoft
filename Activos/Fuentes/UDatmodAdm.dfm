object dtAdm: TdtAdm
  OldCreateOrder = False
  Left = 244
  Top = 164
  Height = 333
  Width = 501
  object tClasif_cuentas: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CLASIFIC_CUENTAS'
    Left = 96
    Top = 24
    object tClasif_cuentasCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tClasif_cuentasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object tClasif_cuentasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object tClasif_cuentasTIPOSERVICIO: TIntegerField
      FieldName = 'TIPOSERVICIO'
    end
  end
  object tTipoClase_Ctas_adm: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPOCLASE_CTAS_ADM'
    Left = 216
    Top = 24
  end
  object tClase_cuentas_adm: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CLASE_CUENTAS_ADM'
    Left = 352
    Top = 24
  end
  object dstClasif_cuentas: TDataSource
    DataSet = tClasif_cuentas
    Left = 96
    Top = 80
  end
  object dstTipoClase_Ctas_adm: TDataSource
    DataSet = tTipoClase_Ctas_adm
    Left = 216
    Top = 80
  end
  object dstClase_cuentas_adm: TDataSource
    DataSet = tClase_cuentas_adm
    Left = 360
    Top = 80
  end
  object tDgIIAnexoB: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DGIIANEXOB'
    Left = 128
    Top = 144
  end
  object dtDgIIAnexoB: TDataSource
    DataSet = tDgIIAnexoB
    Left = 232
    Top = 160
  end
end
