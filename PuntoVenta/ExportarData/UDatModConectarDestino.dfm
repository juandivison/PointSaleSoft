object dmConectarDestino: TdmConectarDestino
  OldCreateOrder = False
  Left = 1131
  Top = 133
  Height = 352
  Width = 193
  object IBDatabase1: TIBDatabase
    DatabaseName = 'F:\Datos\PuntoVenta\Cesar\Fiscal\DBDATOS_DIST.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=sup2005')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    AllowStreamedConnected = False
    OnLogin = IBDatabase1Login
    Left = 66
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
    Left = 64
    Top = 82
  end
  object IBDatabaseInfo1: TIBDatabaseInfo
    Database = IBDatabase1
    Left = 64
    Top = 140
  end
  object IBEvents1: TIBEvents
    AutoRegister = True
    Database = IBDatabase1
    Registered = False
    OnEventAlert = IBEvents1EventAlert
    OnError = IBEvents1Error
    Left = 64
    Top = 198
  end
end
