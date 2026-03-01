object dmConectar: TdmConectar
  OldCreateOrder = False
  Left = 1345
  Top = 182
  Height = 321
  Width = 202
  object IBDatabase1: TIBDatabase
    DatabaseName = 
      'C:\Proyectos\Datos\Repositorio\PuntoVenta\FarmaciaGor\Prod\CRMFa' +
      'rmaciaGor.FDB'
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
    Left = 69
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
    Left = 72
    Top = 82
  end
  object IBDatabaseInfo1: TIBDatabaseInfo
    Database = IBDatabase1
    Left = 72
    Top = 140
  end
  object IBEvents1: TIBEvents
    AutoRegister = True
    Database = IBDatabase1
    Registered = False
    OnEventAlert = IBEvents1EventAlert
    OnError = IBEvents1Error
    Left = 72
    Top = 198
  end
end
