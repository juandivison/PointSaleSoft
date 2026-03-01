object dmCon: TdmCon
  OldCreateOrder = False
  Left = 487
  Top = 197
  Height = 280
  Width = 174
  object IBDatabase1: TIBDatabase
    DatabaseName = 'C:\Proyectos\OscarAvila\PuntoVenta\Datos\DBOSC_AVILA.GDB'
    Params.Strings = (
      'user_name=divison'
      'password=sup2005')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 40
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 32
    Top = 72
  end
  object IBDatabaseInfo1: TIBDatabaseInfo
    Database = IBDatabase1
    Left = 32
    Top = 120
  end
end
