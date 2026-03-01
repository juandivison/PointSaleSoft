object dmCompania: TdmCompania
  OldCreateOrder = False
  Left = 233
  Top = 149
  Height = 337
  Width = 419
  object tblCompania: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
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
      Size = 6
    end
  end
  object dstblCompania: TDataSource
    DataSet = tblCompania
    Left = 56
    Top = 72
  end
  object qryEmailProceso: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from EMAILPROCESO')
    Left = 192
    Top = 80
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
      Size = 120
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
    object qryEmailProcesoEXEMAILTOOL: TIBStringField
      FieldName = 'EXEMAILTOOL'
      Origin = 'EMAILPROCESO.EXEMAILTOOL'
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
  end
end
