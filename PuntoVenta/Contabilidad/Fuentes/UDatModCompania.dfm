object dmCompania: TdmCompania
  OldCreateOrder = False
  Left = 646
  Top = 156
  Height = 150
  Width = 215
  object tblCompania: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
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
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CTA2_GYP_PERIODO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA3_GYP_PERIODO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA1_SUPERAVIT_ACM'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CTA2_SUPERAVIT_ACM'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA3_SUPERAVIT_ACM'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA1_RESUMEN_GYP'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CTA2_RESUMEN_GYP'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA3_RESUMEN_GYP'
        Attributes = [faFixed]
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
        Attributes = [faFixed]
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
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CTA2_ULT_RETENIDA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA3_ULT_RETENIDA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA1_GYP_MES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CTA2_GYP_MES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA3_GYP_MES'
        Attributes = [faFixed]
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
    Top = 32
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
  end
end
