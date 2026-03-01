object dmCompania: TdmCompania
  OldCreateOrder = False
  Left = 1070
  Top = 192
  Height = 362
  Width = 379
  object tblCompania: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblCompaniaAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftSmallint
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CALLEYNUMERO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TELEFONO'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'FAX'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'WEBSITE'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CIUDAD'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PAIS'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'RNC_NUMERO'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'DIRECTORIO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'FECHAI_ACT'
        DataType = ftDateTime
      end
      item
        Name = 'FECHAF_ACT'
        DataType = ftDateTime
      end
      item
        Name = 'CTA1_GYP_PERIODO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CTA2_GYP_PERIODO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA3_GYP_PERIODO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA1_SUPERAVIT_ACM'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CTA2_SUPERAVIT_ACM'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA3_SUPERAVIT_ACM'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA1_RESUMEN_GYP'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CTA2_RESUMEN_GYP'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA3_RESUMEN_GYP'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'OBSERVACION'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUM_PATENTE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CTA1_ULT_RETENIDA'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CTA2_ULT_RETENIDA'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA3_ULT_RETENIDA'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA1_GYP_MES'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CTA2_GYP_MES'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA3_GYP_MES'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'FECHA_IN'
        DataType = ftDateTime
      end
      item
        Name = 'IN_POR'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'FECHA_MOD'
        DataType = ftDateTime
      end
      item
        Name = 'MOD_POR'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'LOGOCIA'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'OFFICE_ID'
        DataType = ftInteger
      end
      item
        Name = 'NUM_SUCURSAL'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'IMAGEN_DESKTOP'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'ID_PROVINCIA'
        DataType = ftInteger
      end
      item
        Name = 'ID_MUNICIPIO'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'COMPANIAINDEX1'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY28'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'COMPANIA'
    Left = 56
    Top = 16
    object tblCompaniaCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tblCompaniaNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 60
    end
    object tblCompaniaCALLEYNUMERO: TIBStringField
      FieldName = 'CALLEYNUMERO'
      Size = 40
    end
    object tblCompaniaTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Size = 12
    end
    object tblCompaniaFAX: TIBStringField
      FieldName = 'FAX'
      Size = 12
    end
    object tblCompaniaEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 35
    end
    object tblCompaniaWEBSITE: TIBStringField
      FieldName = 'WEBSITE'
      Size = 40
    end
    object tblCompaniaCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Size = 30
    end
    object tblCompaniaPAIS: TIBStringField
      FieldName = 'PAIS'
      Size = 35
    end
    object tblCompaniaRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Size = 14
    end
    object tblCompaniaDIRECTORIO: TIBStringField
      FieldName = 'DIRECTORIO'
      Size = 40
    end
    object tblCompaniaFECHAI_ACT: TDateTimeField
      FieldName = 'FECHAI_ACT'
    end
    object tblCompaniaFECHAF_ACT: TDateTimeField
      FieldName = 'FECHAF_ACT'
    end
    object tblCompaniaCTA1_GYP_PERIODO: TIBStringField
      FieldName = 'CTA1_GYP_PERIODO'
      Size = 3
    end
    object tblCompaniaCTA2_GYP_PERIODO: TIBStringField
      FieldName = 'CTA2_GYP_PERIODO'
      Size = 2
    end
    object tblCompaniaCTA3_GYP_PERIODO: TIBStringField
      FieldName = 'CTA3_GYP_PERIODO'
      Size = 2
    end
    object tblCompaniaCTA1_SUPERAVIT_ACM: TIBStringField
      FieldName = 'CTA1_SUPERAVIT_ACM'
      Size = 3
    end
    object tblCompaniaCTA2_SUPERAVIT_ACM: TIBStringField
      FieldName = 'CTA2_SUPERAVIT_ACM'
      Size = 2
    end
    object tblCompaniaCTA3_SUPERAVIT_ACM: TIBStringField
      FieldName = 'CTA3_SUPERAVIT_ACM'
      Size = 2
    end
    object tblCompaniaCTA1_RESUMEN_GYP: TIBStringField
      FieldName = 'CTA1_RESUMEN_GYP'
      Size = 3
    end
    object tblCompaniaCTA2_RESUMEN_GYP: TIBStringField
      FieldName = 'CTA2_RESUMEN_GYP'
      Size = 2
    end
    object tblCompaniaCTA3_RESUMEN_GYP: TIBStringField
      FieldName = 'CTA3_RESUMEN_GYP'
      Size = 2
    end
    object tblCompaniaOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Size = 40
    end
    object tblCompaniaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object tblCompaniaNUM_PATENTE: TIBStringField
      FieldName = 'NUM_PATENTE'
      Size = 10
    end
    object tblCompaniaCTA1_ULT_RETENIDA: TIBStringField
      FieldName = 'CTA1_ULT_RETENIDA'
      Size = 3
    end
    object tblCompaniaCTA2_ULT_RETENIDA: TIBStringField
      FieldName = 'CTA2_ULT_RETENIDA'
      Size = 2
    end
    object tblCompaniaCTA3_ULT_RETENIDA: TIBStringField
      FieldName = 'CTA3_ULT_RETENIDA'
      Size = 2
    end
    object tblCompaniaCTA1_GYP_MES: TIBStringField
      FieldName = 'CTA1_GYP_MES'
      Size = 3
    end
    object tblCompaniaCTA2_GYP_MES: TIBStringField
      FieldName = 'CTA2_GYP_MES'
      Size = 2
    end
    object tblCompaniaCTA3_GYP_MES: TIBStringField
      FieldName = 'CTA3_GYP_MES'
      Size = 2
    end
    object tblCompaniaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
    end
    object tblCompaniaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Size = 12
    end
    object tblCompaniaFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
    end
    object tblCompaniaMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Size = 12
    end
    object tblCompaniaLOGOCIA: TIBStringField
      FieldName = 'LOGOCIA'
      Size = 80
    end
    object tblCompaniaOFFICE_ID: TIntegerField
      FieldName = 'OFFICE_ID'
    end
    object tblCompaniaNUM_SUCURSAL: TIBStringField
      FieldName = 'NUM_SUCURSAL'
      FixedChar = True
      Size = 6
    end
    object tblCompaniaIMAGEN_DESKTOP: TIBStringField
      FieldName = 'IMAGEN_DESKTOP'
      Size = 80
    end
    object tblCompaniaID_PROVINCIA: TIntegerField
      FieldName = 'ID_PROVINCIA'
    end
    object tblCompaniaID_MUNICIPIO: TIntegerField
      FieldName = 'ID_MUNICIPIO'
    end
  end
  object dstblCompania: TDataSource
    DataSet = tblCompania
    Left = 56
    Top = 72
  end
  object tblTrackingEmail: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from EMAIL_TRACKING'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into EMAIL_TRACKING'
      
        '  (SERIE, IDTIPO, FECHA, TOEMAIL, FROMEMAIL, SUBJECT, COD_USER, ' +
        'STATUS, '
      '   ERRORMESSAGE, FECHAIN, IN_POR, FECHA_UPDATE, UPD_POR)'
      'values'
      
        '  (:SERIE, :IDTIPO, :FECHA, :TOEMAIL, :FROMEMAIL, :SUBJECT, :COD' +
        '_USER, '
      
        '   :STATUS, :ERRORMESSAGE, :FECHAIN, :IN_POR, :FECHA_UPDATE, :UP' +
        'D_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  IDTIPO,'
      '  FECHA,'
      '  TOEMAIL,'
      '  FROMEMAIL,'
      '  SUBJECT,'
      '  COD_USER,'
      '  STATUS,'
      '  ERRORMESSAGE,'
      '  FECHAIN,'
      '  IN_POR,'
      '  FECHA_UPDATE,'
      '  UPD_POR'
      'from EMAIL_TRACKING '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select * from EMAIL_TRACKING')
    ModifySQL.Strings = (
      'update EMAIL_TRACKING'
      'set'
      '  SERIE = :SERIE,'
      '  IDTIPO = :IDTIPO,'
      '  FECHA = :FECHA,'
      '  TOEMAIL = :TOEMAIL,'
      '  FROMEMAIL = :FROMEMAIL,'
      '  SUBJECT = :SUBJECT,'
      '  COD_USER = :COD_USER,'
      '  STATUS = :STATUS,'
      '  ERRORMESSAGE = :ERRORMESSAGE,'
      '  FECHAIN = :FECHAIN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_UPDATE = :FECHA_UPDATE,'
      '  UPD_POR = :UPD_POR'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_emailtrkgserie'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 56
    Top = 136
    object tblTrackingEmailSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'EMAIL_TRACKING.SERIE'
      Required = True
    end
    object tblTrackingEmailIDTIPO: TIntegerField
      FieldName = 'IDTIPO'
      Origin = 'EMAIL_TRACKING.IDTIPO'
      Required = True
    end
    object tblTrackingEmailFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'EMAIL_TRACKING.FECHA'
      Required = True
    end
    object tblTrackingEmailTOEMAIL: TIBStringField
      FieldName = 'TOEMAIL'
      Origin = 'EMAIL_TRACKING.TOEMAIL'
      Size = 200
    end
    object tblTrackingEmailFROMEMAIL: TIBStringField
      FieldName = 'FROMEMAIL'
      Origin = 'EMAIL_TRACKING.FROMEMAIL'
      Size = 200
    end
    object tblTrackingEmailSUBJECT: TIBStringField
      FieldName = 'SUBJECT'
      Origin = 'EMAIL_TRACKING.SUBJECT'
      Size = 200
    end
    object tblTrackingEmailCOD_USER: TIntegerField
      FieldName = 'COD_USER'
      Origin = 'EMAIL_TRACKING.COD_USER'
    end
    object tblTrackingEmailSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'EMAIL_TRACKING.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblTrackingEmailERRORMESSAGE: TIBStringField
      FieldName = 'ERRORMESSAGE'
      Origin = 'EMAIL_TRACKING.ERRORMESSAGE'
      Size = 200
    end
    object tblTrackingEmailFECHAIN: TDateTimeField
      FieldName = 'FECHAIN'
      Origin = 'EMAIL_TRACKING.FECHAIN'
    end
    object tblTrackingEmailIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'EMAIL_TRACKING.IN_POR'
      Size = 12
    end
    object tblTrackingEmailFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'EMAIL_TRACKING.FECHA_UPDATE'
    end
    object tblTrackingEmailUPD_POR: TIBStringField
      FieldName = 'UPD_POR'
      Origin = 'EMAIL_TRACKING.UPD_POR'
      Size = 12
    end
  end
  object qryEmailProceso: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from EMAILPROCESO')
    Left = 54
    Top = 202
    object qryEmailProcesoIDTIPO: TIntegerField
      FieldName = 'IDTIPO'
      Origin = 'EMAILPROCESO.IDTIPO'
      Required = True
    end
    object qryEmailProcesoSUBJECT: TIBStringField
      FieldName = 'SUBJECT'
      Origin = 'EMAILPROCESO.SUBJECT'
      Size = 80
    end
    object qryEmailProcesoPORT: TIntegerField
      FieldName = 'PORT'
      Origin = 'EMAILPROCESO.PORT'
    end
    object qryEmailProcesoEMAIL_SERVER: TIBStringField
      FieldName = 'EMAIL_SERVER'
      Origin = 'EMAILPROCESO.EMAIL_SERVER'
      Size = 40
    end
    object qryEmailProcesoUSER_EMAIL: TIBStringField
      FieldName = 'USER_EMAIL'
      Origin = 'EMAILPROCESO.USER_EMAIL'
      Size = 100
    end
    object qryEmailProcesoUSER_PASSWORD: TIBStringField
      FieldName = 'USER_PASSWORD'
      Origin = 'EMAILPROCESO.USER_PASSWORD'
      Size = 50
    end
    object qryEmailProcesoFROMEMAIL: TIBStringField
      FieldName = 'FROMEMAIL'
      Origin = 'EMAILPROCESO.FROMEMAIL'
      Size = 200
    end
    object qryEmailProcesoTOEMAIL: TIBStringField
      FieldName = 'TOEMAIL'
      Origin = 'EMAILPROCESO.TOEMAIL'
      Size = 200
    end
    object qryEmailProcesoCCEMAIL: TIBStringField
      FieldName = 'CCEMAIL'
      Origin = 'EMAILPROCESO.CCEMAIL'
      Size = 200
    end
    object qryEmailProcesoFECHAIN: TDateTimeField
      FieldName = 'FECHAIN'
      Origin = 'EMAILPROCESO.FECHAIN'
    end
    object qryEmailProcesoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'EMAILPROCESO.IN_POR'
      Size = 12
    end
    object qryEmailProcesoFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'EMAILPROCESO.FECHA_UPDATE'
    end
    object qryEmailProcesoUPD_POR: TIBStringField
      FieldName = 'UPD_POR'
      Origin = 'EMAILPROCESO.UPD_POR'
      Size = 12
    end
    object qryEmailProcesoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'EMAILPROCESO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryEmailProcesoEXEMAILTOOL: TIBStringField
      FieldName = 'EXEMAILTOOL'
      Origin = 'EMAILPROCESO.EXEMAILTOOL'
      Size = 200
    end
  end
  object tblEmailProceso: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from EMAILPROCESO'
      'where'
      '  IDTIPO = :OLD_IDTIPO')
    InsertSQL.Strings = (
      'insert into EMAILPROCESO'
      
        '  (IDTIPO, SUBJECT, PORT, EMAIL_SERVER, USER_EMAIL, USER_PASSWOR' +
        'D, FROMEMAIL, '
      
        '   TOEMAIL, CCEMAIL, EXEMAILTOOL, FECHAIN, IN_POR, FECHA_UPDATE,' +
        ' UPD_POR, '
      '   STATUS)'
      'values'
      
        '  (:IDTIPO, :SUBJECT, :PORT, :EMAIL_SERVER, :USER_EMAIL, :USER_P' +
        'ASSWORD, '
      
        '   :FROMEMAIL, :TOEMAIL, :CCEMAIL, :EXEMAILTOOL, :FECHAIN, :IN_P' +
        'OR, :FECHA_UPDATE, '
      '   :UPD_POR, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  IDTIPO,'
      '  SUBJECT,'
      '  PORT,'
      '  EMAIL_SERVER,'
      '  USER_EMAIL,'
      '  USER_PASSWORD,'
      '  FROMEMAIL,'
      '  TOEMAIL,'
      '  CCEMAIL,'
      '  EXEMAILTOOL,'
      '  FECHAIN,'
      '  IN_POR,'
      '  FECHA_UPDATE,'
      '  UPD_POR,'
      '  STATUS'
      'from EMAILPROCESO '
      'where'
      '  IDTIPO = :IDTIPO')
    SelectSQL.Strings = (
      'select *  from EMAILPROCESO')
    ModifySQL.Strings = (
      'update EMAILPROCESO'
      'set'
      '  IDTIPO = :IDTIPO,'
      '  SUBJECT = :SUBJECT,'
      '  PORT = :PORT,'
      '  EMAIL_SERVER = :EMAIL_SERVER,'
      '  USER_EMAIL = :USER_EMAIL,'
      '  USER_PASSWORD = :USER_PASSWORD,'
      '  FROMEMAIL = :FROMEMAIL,'
      '  TOEMAIL = :TOEMAIL,'
      '  CCEMAIL = :CCEMAIL,'
      '  EXEMAILTOOL = :EXEMAILTOOL,'
      '  FECHAIN = :FECHAIN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_UPDATE = :FECHA_UPDATE,'
      '  UPD_POR = :UPD_POR,'
      '  STATUS = :STATUS'
      'where'
      '  IDTIPO = :OLD_IDTIPO')
    Left = 144
    Top = 24
    object tblEmailProcesoIDTIPO: TIntegerField
      FieldName = 'IDTIPO'
      Origin = 'EMAILPROCESO.IDTIPO'
      Required = True
    end
    object tblEmailProcesoSUBJECT: TIBStringField
      FieldName = 'SUBJECT'
      Origin = 'EMAILPROCESO.SUBJECT'
      Size = 80
    end
    object tblEmailProcesoPORT: TIntegerField
      FieldName = 'PORT'
      Origin = 'EMAILPROCESO.PORT'
    end
    object tblEmailProcesoEMAIL_SERVER: TIBStringField
      FieldName = 'EMAIL_SERVER'
      Origin = 'EMAILPROCESO.EMAIL_SERVER'
      Size = 40
    end
    object tblEmailProcesoUSER_EMAIL: TIBStringField
      FieldName = 'USER_EMAIL'
      Origin = 'EMAILPROCESO.USER_EMAIL'
      Size = 100
    end
    object tblEmailProcesoUSER_PASSWORD: TIBStringField
      FieldName = 'USER_PASSWORD'
      Origin = 'EMAILPROCESO.USER_PASSWORD'
      Size = 50
    end
    object tblEmailProcesoFROMEMAIL: TIBStringField
      FieldName = 'FROMEMAIL'
      Origin = 'EMAILPROCESO.FROMEMAIL'
      Size = 200
    end
    object tblEmailProcesoTOEMAIL: TIBStringField
      FieldName = 'TOEMAIL'
      Origin = 'EMAILPROCESO.TOEMAIL'
      Size = 200
    end
    object tblEmailProcesoCCEMAIL: TIBStringField
      FieldName = 'CCEMAIL'
      Origin = 'EMAILPROCESO.CCEMAIL'
      Size = 200
    end
    object tblEmailProcesoEXEMAILTOOL: TIBStringField
      FieldName = 'EXEMAILTOOL'
      Origin = 'EMAILPROCESO.EXEMAILTOOL'
      Size = 200
    end
    object tblEmailProcesoFECHAIN: TDateTimeField
      FieldName = 'FECHAIN'
      Origin = 'EMAILPROCESO.FECHAIN'
    end
    object tblEmailProcesoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'EMAILPROCESO.IN_POR'
      Size = 12
    end
    object tblEmailProcesoFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'EMAILPROCESO.FECHA_UPDATE'
    end
    object tblEmailProcesoUPD_POR: TIBStringField
      FieldName = 'UPD_POR'
      Origin = 'EMAILPROCESO.UPD_POR'
      Size = 12
    end
    object tblEmailProcesoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'EMAILPROCESO.STATUS'
      FixedChar = True
      Size = 1
    end
  end
end
