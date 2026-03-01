object dmFactElectronica: TdmFactElectronica
  OldCreateOrder = False
  Left = 429
  Top = 254
  Height = 480
  Width = 719
  object tblEndPointseCF: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from ECF_ENDPOINTS'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into ECF_ENDPOINTS'
      
        '  (ID, ENV, NAME, URL, HTTP_METHOD, DESCRIPTION, CREATED_AT, UPD' +
        'ATED_AT)'
      'values'
      
        '  (:ID, :ENV, :NAME, :URL, :HTTP_METHOD, :DESCRIPTION, :CREATED_' +
        'AT, :UPDATED_AT)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ENV,'
      '  NAME,'
      '  URL,'
      '  HTTP_METHOD,'
      '  DESCRIPTION,'
      '  CREATED_AT,'
      '  UPDATED_AT'
      'from ECF_ENDPOINTS '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'Select * from ECF_ENDPOINTS'
      'where env =:ENV')
    ModifySQL.Strings = (
      'update ECF_ENDPOINTS'
      'set'
      '  ID = :ID,'
      '  ENV = :ENV,'
      '  NAME = :NAME,'
      '  URL = :URL,'
      '  HTTP_METHOD = :HTTP_METHOD,'
      '  DESCRIPTION = :DESCRIPTION,'
      '  CREATED_AT = :CREATED_AT,'
      '  UPDATED_AT = :UPDATED_AT'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_ECF_ENDPOINTS_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 288
    Top = 88
    object tblEndPointseCFID: TIntegerField
      FieldName = 'ID'
      Origin = 'ECF_ENDPOINTS.ID'
      Required = True
    end
    object tblEndPointseCFENV: TSmallintField
      FieldName = 'ENV'
      Origin = 'ECF_ENDPOINTS.ENV'
      Required = True
    end
    object tblEndPointseCFNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'ECF_ENDPOINTS.NAME'
      Required = True
      Size = 100
    end
    object tblEndPointseCFURL: TIBStringField
      FieldName = 'URL'
      Origin = 'ECF_ENDPOINTS.URL'
      Required = True
      Size = 500
    end
    object tblEndPointseCFHTTP_METHOD: TIBStringField
      FieldName = 'HTTP_METHOD'
      Origin = 'ECF_ENDPOINTS.HTTP_METHOD'
      Size = 10
    end
    object tblEndPointseCFDESCRIPTION: TIBStringField
      FieldName = 'DESCRIPTION'
      Origin = 'ECF_ENDPOINTS.DESCRIPTION'
      Size = 255
    end
    object tblEndPointseCFCREATED_AT: TDateTimeField
      FieldName = 'CREATED_AT'
      Origin = 'ECF_ENDPOINTS.CREATED_AT'
    end
    object tblEndPointseCFUPDATED_AT: TDateTimeField
      FieldName = 'UPDATED_AT'
      Origin = 'ECF_ENDPOINTS.UPDATED_AT'
    end
  end
end
