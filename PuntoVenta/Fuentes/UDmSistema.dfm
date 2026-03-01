object dmSistema: TdmSistema
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 479
  Top = 269
  Height = 342
  Width = 488
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=idesi_s' +
      'qllogin_1;Initial Catalog=idesidbpos;Data Source=209.17.116.13;U' +
      'se Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;' +
      'Initial File Name="";Use Encryption for Data=False;Tag with colu' +
      'mn collation when possible=False;MARS Connection=False;DataTypeC' +
      'ompatibility=0;Trust Server Certificate=False;Server SPN="";Appl' +
      'ication Intent=READWRITE'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'SQLNCLI11.1'
    BeforeConnect = ADOConnection1BeforeConnect
    OnLogin = ADOConnection1Login
    Left = 96
    Top = 32
  end
  object tblADOSistema: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'Select * from  Sistemas'
    Parameters = <>
    Left = 96
    Top = 88
    object tblADOSistemaid: TAutoIncField
      DisplayWidth = 10
      FieldName = 'id'
      ReadOnly = True
    end
    object tblADOSistemaidsistema: TIntegerField
      DisplayWidth = 12
      FieldName = 'idsistema'
    end
    object tblADOSistemaidcliente: TIntegerField
      DisplayWidth = 12
      FieldName = 'idcliente'
    end
    object tblADOSistemanombrecliente: TStringField
      DisplayWidth = 36
      FieldName = 'nombrecliente'
      Size = 80
    end
    object tblADOSistemacont_aviso: TSmallintField
      DisplayWidth = 13
      FieldName = 'cont_aviso'
    end
    object tblADOSistemaFecha_Suspencion: TDateField
      DisplayWidth = 19
      FieldName = 'Fecha_Suspencion'
    end
    object tblADOSistemaFecha_activado: TDateField
      DisplayWidth = 16
      FieldName = 'Fecha_activado'
    end
    object tblADOSistemaestado: TStringField
      DisplayWidth = 7
      FieldName = 'estado'
      FixedChar = True
      Size = 1
    end
  end
end
