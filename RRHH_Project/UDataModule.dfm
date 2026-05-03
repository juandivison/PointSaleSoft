object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 760
  Top = 188
  Height = 150
  Width = 215
  object IBDatabase1: TIBDatabase
    DatabaseName = 
      'C:\Proyectos\Datos\Repositorio\PuntoVenta\Expert_Ingenieria\DBER' +
      'PEXPERT.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=sup2005')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 40
    Top = 24
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 128
    Top = 40
  end
end
