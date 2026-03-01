object dmConectar: TdmConectar
  OldCreateOrder = False
  Left = 1138
  Top = 152
  Height = 327
  Width = 185
  object IBDatabase1: TIBDatabase
    DatabaseName = 
      'C:\Proyectos\ResidencialCDM\Datos\Prod\CiudadReal\DBRESIDENCIAL.' +
      'FDB'
    Params.Strings = (
      'user_name=DIVISON'
      'password=sup2005')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = [tfError]
    BeforeConnect = IBDatabase1BeforeConnect
    OnLogin = IBDatabase1Login
    Left = 62
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
    Left = 62
    Top = 80
  end
  object IBDatabaseInfo1: TIBDatabaseInfo
    Database = IBDatabase1
    Left = 62
    Top = 136
  end
  object IBEvents1: TIBEvents
    AutoRegister = True
    Database = IBDatabase1
    Registered = False
    OnError = IBEvents1Error
    Left = 64
    Top = 200
  end
end
