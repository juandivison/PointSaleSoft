object dmCostos: TdmCostos
  OldCreateOrder = False
  Left = 501
  Top = 237
  Height = 291
  Width = 322
  object tblRegOrdenMast: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from ORDEN_COMP_MAST'
      'where fecha between :fechaini and :fechafin')
    Left = 48
    Top = 24
  end
  object tblRegOrdenDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from ORDEN_COMP_DET'
      'where numero=:numero')
    Left = 48
    Top = 80
  end
end
