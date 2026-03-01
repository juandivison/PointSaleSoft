object dmDGII: TdmDGII
  OldCreateOrder = False
  Left = 710
  Top = 124
  Height = 446
  Width = 247
  object IBDatabase1: TIBDatabase
    DatabaseName = 'C:\Proyectos\Datos\RNC_DGII\DGII_RNC.fdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=sup2005')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    AllowStreamedConnected = False
    BeforeConnect = IBDatabase1BeforeConnect
    Left = 82
    Top = 24
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 85
    Top = 82
  end
  object ibsqlBuscarRazonSocial: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  '
      'RAZONSOCIAL, RNC, STATUS'
      'from RNCCEDULA')
    Left = 88
    Top = 176
    object ibsqlBuscarRazonSocialRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'RNCCEDULA.RNC'
      Required = True
      Size = 11
    end
    object ibsqlBuscarRazonSocialRAZONSOCIAL: TIBStringField
      FieldName = 'RAZONSOCIAL'
      Origin = 'RNCCEDULA.RAZONSOCIAL'
      Required = True
      Size = 80
    end
    object ibsqlBuscarRazonSocialSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'RNCCEDULA.STATUS'
      Required = True
      Size = 80
    end
  end
end
