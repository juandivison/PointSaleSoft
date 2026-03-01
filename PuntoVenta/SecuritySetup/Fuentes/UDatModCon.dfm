object dmCon: TdmCon
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 1076
  Top = 154
  Height = 280
  Width = 224
  object IBDatabase1: TIBDatabase
    DatabaseName = 
      'C:\Proyectos\Datos\Repositorio\PuntoVenta\FramaciaYani\Issue\CRM' +
      '.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=sup2005')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    BeforeConnect = IBDatabase1BeforeConnect
    OnLogin = IBDatabase1Login
    Left = 72
    Top = 32
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 72
    Top = 80
  end
  object IBDatabaseInfo1: TIBDatabaseInfo
    Database = IBDatabase1
    Left = 32
    Top = 136
  end
  object IBEvents1: TIBEvents
    AutoRegister = True
    Database = IBDatabase1
    Registered = False
    OnEventAlert = IBEvents1EventAlert
    OnError = IBEvents1Error
    Left = 104
    Top = 136
  end
end
