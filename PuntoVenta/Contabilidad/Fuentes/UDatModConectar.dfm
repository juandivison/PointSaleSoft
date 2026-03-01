object dmCon: TdmCon
  OldCreateOrder = False
  Left = 1168
  Top = 134
  Height = 325
  Width = 178
  object IBDatabase1: TIBDatabase
    DatabaseName = 'C:\Proyectos\Datos\PuntoVenta\Sam\DB\CRM.FDB'
    Params.Strings = (
      'user_name=divison'
      'password=sup2005')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    AllowStreamedConnected = False
    BeforeConnect = IBDatabase1BeforeConnect
    OnLogin = IBDatabase1Login
    Left = 56
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
    Left = 56
    Top = 90
  end
  object IBDatabaseInfo1: TIBDatabaseInfo
    Database = IBDatabase1
    Left = 56
    Top = 148
  end
  object IBEvents1: TIBEvents
    AutoRegister = True
    Database = IBDatabase1
    Registered = False
    OnEventAlert = IBEvents1EventAlert
    OnError = IBEvents1Error
    Left = 56
    Top = 206
  end
end
