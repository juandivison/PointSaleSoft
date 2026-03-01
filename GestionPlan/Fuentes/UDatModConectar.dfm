object dmConectar: TdmConectar
  OldCreateOrder = False
  Left = 864
  Top = 144
  Height = 320
  Width = 243
  object IBDatabase1: TIBDatabase
    DatabaseName = 
      'C:\Documents and Settings\DIVISON\My Documents\My Received Files' +
      '\DBDATOS_DIST.FDB'
    Params.Strings = (
      'user_name=divison'
      'password=sup2005')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    BeforeConnect = IBDatabase1BeforeConnect
    OnLogin = IBDatabase1Login
    Left = 89
    Top = 40
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 88
    Top = 90
  end
  object IBDatabaseInfo1: TIBDatabaseInfo
    Database = IBDatabase1
    Left = 88
    Top = 148
  end
  object IBEvents1: TIBEvents
    AutoRegister = True
    Database = IBDatabase1
    Registered = False
    OnEventAlert = IBEvents1EventAlert
    OnError = IBEvents1Error
    Left = 88
    Top = 206
  end
end
