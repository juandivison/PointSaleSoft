object dmFarmacia: TdmFarmacia
  OldCreateOrder = False
  Left = 768
  Top = 162
  Height = 395
  Width = 566
  object IBDataSet1: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 184
    Top = 32
  end
end
