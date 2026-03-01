object dmconectar: Tdmconectar
  OldCreateOrder = False
  Left = 856
  Top = 322
  Height = 281
  Width = 192
  object IBDatabase1: TIBDatabase
    DatabaseName = 'C:\Proyectos\PuntoVentas\Datos\EGDBPointSaleSoft.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=sup2005')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
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
    Left = 61
    Top = 68
  end
  object IBDatabaseInfo1: TIBDatabaseInfo
    Database = IBDatabase1
    Left = 63
    Top = 118
  end
  object IBEvents1: TIBEvents
    AutoRegister = True
    Database = IBDatabase1
    Registered = False
    OnEventAlert = IBEvents1EventAlert
    OnError = IBEvents1Error
    Left = 64
    Top = 166
  end
end
