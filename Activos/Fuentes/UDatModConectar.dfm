object dmCon: TdmCon
  OldCreateOrder = False
  Left = 1141
  Top = 148
  Height = 351
  Width = 217
  object IBDatabase1: TIBDatabase
    DatabaseName = 'C:\Proyectos\Datos\PuntoVenta\Mape\DBMAPEDBDATOS.FDB'
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
    OnLogin = IBDatabase1Login
    Left = 64
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
    Left = 64
    Top = 198
  end
end
