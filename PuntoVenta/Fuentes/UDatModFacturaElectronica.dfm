object dmFactElectronica: TdmFactElectronica
  OldCreateOrder = False
  Left = 812
  Top = 195
  Height = 372
  Width = 509
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
    Left = 48
    Top = 64
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
  object tblECF_TIMBRE_LOG: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    SelectSQL.Strings = (
      'select * from ECF_TIMBRE_LOG'
      'order by id desc')
    Left = 152
    Top = 24
    object tblECF_TIMBRE_LOGID: TIntegerField
      FieldName = 'ID'
      Origin = 'ECF_TIMBRE_LOG.ID'
      Required = True
    end
    object tblECF_TIMBRE_LOGTRN: TIntegerField
      FieldName = 'TRN'
      Origin = 'ECF_TIMBRE_LOG.TRN'
      Required = True
    end
    object tblECF_TIMBRE_LOGENCF: TIBStringField
      FieldName = 'ENCF'
      Origin = 'ECF_TIMBRE_LOG.ENCF'
      Size = 13
    end
    object tblECF_TIMBRE_LOGCODIGO_SEGURIDAD: TIBStringField
      FieldName = 'CODIGO_SEGURIDAD'
      Origin = 'ECF_TIMBRE_LOG.CODIGO_SEGURIDAD'
      Size = 64
    end
    object tblECF_TIMBRE_LOGFECHA_EMISION: TDateTimeField
      FieldName = 'FECHA_EMISION'
      Origin = 'ECF_TIMBRE_LOG.FECHA_EMISION'
    end
    object tblECF_TIMBRE_LOGMONTO_TOTAL: TFloatField
      FieldName = 'MONTO_TOTAL'
      Origin = 'ECF_TIMBRE_LOG.MONTO_TOTAL'
    end
    object tblECF_TIMBRE_LOGURL_IMAGE: TIBStringField
      FieldName = 'URL_IMAGE'
      Origin = 'ECF_TIMBRE_LOG.URL_IMAGE'
      Size = 1024
    end
    object tblECF_TIMBRE_LOGRAW_RETURN: TMemoField
      FieldName = 'RAW_RETURN'
      Origin = 'ECF_TIMBRE_LOG.RAW_RETURN'
      BlobType = ftMemo
      Size = 8
    end
    object tblECF_TIMBRE_LOGFECHA_CREACION: TDateTimeField
      FieldName = 'FECHA_CREACION'
      Origin = 'ECF_TIMBRE_LOG.FECHA_CREACION'
    end
  end
  object qryEcfAconciliar: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT  r.NUMERO, r.fecha, n.NUMERO_NCF,'
      'r.SERIE_NCF_ASIGNADO SERIE_ECF_ASIGNADO'
      'FROM VENTAS_MAST r'
      'left join NCF_ASIGNADOS n on n.SERIE = r.SERIE_NCF_ASIGNADO'
      'left join ECF_TIMBRE_LOG l on l.ENCF = n.NUMERO_NCF'
      'Where '
      'r.status Not in ('#39'C'#39') and l.CODIGO_SEGURIDAD Is Null'
      'and n.NUMERO_NCF not in ('#39'<PLACEHOLDER>'#39')'
      'and (n.NUMERO_NCF like '#39'E32%'#39' or n.NUMERO_NCF like '#39'E31%'#39')'
      
        'and (UPPER(n.DGII_STATUS) <> '#39'ACEPTADO'#39' OR N.DGII_STATUS IS NULL' +
        ') order by r.NUMERO')
    Left = 40
    Top = 144
    object qryEcfAconciliarNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryEcfAconciliarFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryEcfAconciliarNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
    object qryEcfAconciliarSERIE_ECF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_ECF_ASIGNADO'
      Origin = 'VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
  end
  object qryListaEcfAVerificar: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select V.NUMERO,v.fecha, V.SERIE_NCF_ASIGNADO SERIE_ECF_ASIGNADO' +
        ', R.NUMERO_NCF, r.NCF_ANTERIOR, R.DGII_STATUS '
      'from NCF_ASIGNADOS r'
      'INNER JOIN VENTAS_MAST V ON V.SERIE_NCF_ASIGNADO = R.SERIE'
      'WHERE UPPER(R.DGII_STATUS) IN (:estado)'
      'AND R.STATUS = '#39'A'#39)
    Left = 176
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'estado'
        ParamType = ptInput
      end>
    object qryListaEcfAVerificarNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryListaEcfAVerificarFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryListaEcfAVerificarSERIE_ECF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_ECF_ASIGNADO'
      Origin = 'VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
    object qryListaEcfAVerificarNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Required = True
      Size = 21
    end
    object qryListaEcfAVerificarNCF_ANTERIOR: TIBStringField
      FieldName = 'NCF_ANTERIOR'
      Origin = 'NCF_ASIGNADOS.NCF_ANTERIOR'
    end
    object qryListaEcfAVerificarDGII_STATUS: TIBStringField
      FieldName = 'DGII_STATUS'
      Origin = 'NCF_ASIGNADOS.DGII_STATUS'
    end
  end
  object tblCambiarNCF: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from NCF_ASIGNADOS'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into NCF_ASIGNADOS'
      
        '  (SERIE, TIPO_NCF, NUMERO_NCF, FECHA, CODIGO_CTE, NOMBRE_COMPLE' +
        'TO, CEDULA, '
      
        '   DIRECCION, CIUDAD, MONTO, STATUS, CODIGO_USUARIO, FECHA_INSER' +
        'T, FECHA_UPDATE, '
      
        '   CODIGO_USUARIO_UPD, ECF, NUMERO_NCF_REFERENCIA, DGII_STATUS, ' +
        'TRACK_ID, '
      
        '   LAST_ERROR, FECHA_INTENTO, FECHA_ESTADO, REINTENTOS, NCF_ANTE' +
        'RIOR, BLOQUEADO, '
      '   HASH_FACTURA)'
      'values'
      
        '  (:SERIE, :TIPO_NCF, :NUMERO_NCF, :FECHA, :CODIGO_CTE, :NOMBRE_' +
        'COMPLETO, '
      
        '   :CEDULA, :DIRECCION, :CIUDAD, :MONTO, :STATUS, :CODIGO_USUARI' +
        'O, :FECHA_INSERT, '
      
        '   :FECHA_UPDATE, :CODIGO_USUARIO_UPD, :ECF, :NUMERO_NCF_REFEREN' +
        'CIA, :DGII_STATUS, '
      
        '   :TRACK_ID, :LAST_ERROR, :FECHA_INTENTO, :FECHA_ESTADO, :REINT' +
        'ENTOS, '
      '   :NCF_ANTERIOR, :BLOQUEADO, :HASH_FACTURA)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  TIPO_NCF,'
      '  NUMERO_NCF,'
      '  FECHA,'
      '  CODIGO_CTE,'
      '  NOMBRE_COMPLETO,'
      '  CEDULA,'
      '  DIRECCION,'
      '  CIUDAD,'
      '  MONTO,'
      '  STATUS,'
      '  CODIGO_USUARIO,'
      '  FECHA_INSERT,'
      '  FECHA_UPDATE,'
      '  CODIGO_USUARIO_UPD,'
      '  ECF,'
      '  NUMERO_NCF_REFERENCIA,'
      '  DGII_STATUS,'
      '  TRACK_ID,'
      '  LAST_ERROR,'
      '  FECHA_INTENTO,'
      '  FECHA_ESTADO,'
      '  REINTENTOS,'
      '  NCF_ANTERIOR,'
      '  BLOQUEADO,'
      '  HASH_FACTURA'
      'from NCF_ASIGNADOS '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select * from NCF_ASIGNADOS'
      'where serie=:serie')
    ModifySQL.Strings = (
      'update NCF_ASIGNADOS'
      'set'
      '  SERIE = :SERIE,'
      '  TIPO_NCF = :TIPO_NCF,'
      '  NUMERO_NCF = :NUMERO_NCF,'
      '  FECHA = :FECHA,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  NOMBRE_COMPLETO = :NOMBRE_COMPLETO,'
      '  CEDULA = :CEDULA,'
      '  DIRECCION = :DIRECCION,'
      '  CIUDAD = :CIUDAD,'
      '  MONTO = :MONTO,'
      '  STATUS = :STATUS,'
      '  CODIGO_USUARIO = :CODIGO_USUARIO,'
      '  FECHA_INSERT = :FECHA_INSERT,'
      '  FECHA_UPDATE = :FECHA_UPDATE,'
      '  CODIGO_USUARIO_UPD = :CODIGO_USUARIO_UPD,'
      '  ECF = :ECF,'
      '  NUMERO_NCF_REFERENCIA = :NUMERO_NCF_REFERENCIA,'
      '  DGII_STATUS = :DGII_STATUS,'
      '  TRACK_ID = :TRACK_ID,'
      '  LAST_ERROR = :LAST_ERROR,'
      '  FECHA_INTENTO = :FECHA_INTENTO,'
      '  FECHA_ESTADO = :FECHA_ESTADO,'
      '  REINTENTOS = :REINTENTOS,'
      '  NCF_ANTERIOR = :NCF_ANTERIOR,'
      '  BLOQUEADO = :BLOQUEADO,'
      '  HASH_FACTURA = :HASH_FACTURA'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 136
    Top = 144
    object tblCambiarNCFSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'NCF_ASIGNADOS.SERIE'
      Required = True
    end
    object tblCambiarNCFTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'NCF_ASIGNADOS.TIPO_NCF'
      Required = True
      Size = 2
    end
    object tblCambiarNCFNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Required = True
      Size = 21
    end
    object tblCambiarNCFFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'NCF_ASIGNADOS.FECHA'
      Required = True
    end
    object tblCambiarNCFCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'NCF_ASIGNADOS.CODIGO_CTE'
    end
    object tblCambiarNCFNOMBRE_COMPLETO: TIBStringField
      FieldName = 'NOMBRE_COMPLETO'
      Origin = 'NCF_ASIGNADOS.NOMBRE_COMPLETO'
      Size = 80
    end
    object tblCambiarNCFCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'NCF_ASIGNADOS.CEDULA'
    end
    object tblCambiarNCFDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Origin = 'NCF_ASIGNADOS.DIRECCION'
      Size = 80
    end
    object tblCambiarNCFCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'NCF_ASIGNADOS.CIUDAD'
      Size = 40
    end
    object tblCambiarNCFMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'NCF_ASIGNADOS.MONTO'
    end
    object tblCambiarNCFSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'NCF_ASIGNADOS.STATUS'
      Size = 1
    end
    object tblCambiarNCFCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'NCF_ASIGNADOS.CODIGO_USUARIO'
    end
    object tblCambiarNCFFECHA_INSERT: TDateTimeField
      FieldName = 'FECHA_INSERT'
      Origin = 'NCF_ASIGNADOS.FECHA_INSERT'
    end
    object tblCambiarNCFFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'NCF_ASIGNADOS.FECHA_UPDATE'
    end
    object tblCambiarNCFCODIGO_USUARIO_UPD: TIntegerField
      FieldName = 'CODIGO_USUARIO_UPD'
      Origin = 'NCF_ASIGNADOS.CODIGO_USUARIO_UPD'
    end
    object tblCambiarNCFECF: TIBStringField
      FieldName = 'ECF'
      Origin = 'NCF_ASIGNADOS.ECF'
      Size = 13
    end
    object tblCambiarNCFNUMERO_NCF_REFERENCIA: TIBStringField
      FieldName = 'NUMERO_NCF_REFERENCIA'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF_REFERENCIA'
    end
    object tblCambiarNCFDGII_STATUS: TIBStringField
      FieldName = 'DGII_STATUS'
      Origin = 'NCF_ASIGNADOS.DGII_STATUS'
    end
    object tblCambiarNCFTRACK_ID: TIBStringField
      FieldName = 'TRACK_ID'
      Origin = 'NCF_ASIGNADOS.TRACK_ID'
      Size = 50
    end
    object tblCambiarNCFLAST_ERROR: TMemoField
      FieldName = 'LAST_ERROR'
      Origin = 'NCF_ASIGNADOS.LAST_ERROR'
      BlobType = ftMemo
      Size = 8
    end
    object tblCambiarNCFFECHA_INTENTO: TDateTimeField
      FieldName = 'FECHA_INTENTO'
      Origin = 'NCF_ASIGNADOS.FECHA_INTENTO'
    end
    object tblCambiarNCFFECHA_ESTADO: TDateTimeField
      FieldName = 'FECHA_ESTADO'
      Origin = 'NCF_ASIGNADOS.FECHA_ESTADO'
    end
    object tblCambiarNCFREINTENTOS: TIntegerField
      FieldName = 'REINTENTOS'
      Origin = 'NCF_ASIGNADOS.REINTENTOS'
    end
    object tblCambiarNCFNCF_ANTERIOR: TIBStringField
      FieldName = 'NCF_ANTERIOR'
      Origin = 'NCF_ASIGNADOS.NCF_ANTERIOR'
    end
    object tblCambiarNCFBLOQUEADO: TSmallintField
      FieldName = 'BLOQUEADO'
      Origin = 'NCF_ASIGNADOS.BLOQUEADO'
    end
    object tblCambiarNCFHASH_FACTURA: TIBStringField
      FieldName = 'HASH_FACTURA'
      Origin = 'NCF_ASIGNADOS.HASH_FACTURA'
      Size = 64
    end
  end
  object qrySecEcf: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select Max(ncf)+1 ecfNum FROM DGII_SERIE_NFC'
      'where serie = '#39'E'#39' and Tipo_cf =:tipoecf')
    Left = 40
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tipoecf'
        ParamType = ptUnknown
      end>
    object qrySecEcfECFNUM: TFloatField
      FieldName = 'ECFNUM'
    end
  end
  object tblUpdateNCF: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  DIV_NEGOCIO,'
      '  PECF,'
      '  AICF,'
      '  TIPO_CF,'
      '  NCF,'
      '  ACTIVO,'
      '  FECHA_IN,'
      '  FECHA_UPD,'
      '  CANT_MIN_AVISO1,'
      '  CANT_MIN_AVISO2,'
      '  FECHA_VENCE'
      'from DGII_SERIE_NFC '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select serie, ncf  FROM DGII_SERIE_NFC'
      'Where serie = '#39'E'#39' and Tipo_cf =:tipoecf')
    ModifySQL.Strings = (
      'update DGII_SERIE_NFC'
      'set'
      '  SERIE = :SERIE,'
      '  NCF = :NCF'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 224
    Top = 144
    object tblUpdateNCFSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'DGII_SERIE_NFC.SERIE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tblUpdateNCFNCF: TFloatField
      FieldName = 'NCF'
      Origin = 'DGII_SERIE_NFC.NCF'
      Required = True
    end
  end
  object qryAsignarECFASerieB: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      'v.NUMERO,'
      'v.VALOR_TOTAL_DET,'
      
        ' r.SERIE, r.TIPO_NCF, r.NUMERO_NCF, r.NCF_ANTERIOR, r.FECHA_UPDA' +
        'TE'
      'from NCF_ASIGNADOS r'
      'inner join VENTAS_MAST v on v.SERIE_NCF_ASIGNADO = r.SERIE'
      'Where r.numero_ncf like '#39'B%'#39
      'and r.fecha=:fecha'
      'order by r.serie')
    Left = 136
    Top = 208
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end>
    object qryAsignarECFASerieBNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryAsignarECFASerieBVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST.VALOR_TOTAL_DET'
    end
    object qryAsignarECFASerieBSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'NCF_ASIGNADOS.SERIE'
      Required = True
    end
    object qryAsignarECFASerieBTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'NCF_ASIGNADOS.TIPO_NCF'
      Required = True
      Size = 2
    end
    object qryAsignarECFASerieBNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Required = True
      Size = 21
    end
    object qryAsignarECFASerieBNCF_ANTERIOR: TIBStringField
      FieldName = 'NCF_ANTERIOR'
      Origin = 'NCF_ASIGNADOS.NCF_ANTERIOR'
    end
    object qryAsignarECFASerieBFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'NCF_ASIGNADOS.FECHA_UPDATE'
    end
  end
  object qryEcfAconciliarQRXML: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT  r.NUMERO, r.fecha, n.NUMERO_NCF,'
      'r.SERIE_NCF_ASIGNADO SERIE_ECF_ASIGNADO'
      'FROM VENTAS_MAST r'
      'left join NCF_ASIGNADOS n on n.SERIE = r.SERIE_NCF_ASIGNADO'
      'left join ECF_TIMBRE_LOG l on l.ENCF = n.NUMERO_NCF'
      'Where '
      'r.status not in ('#39'C'#39') and'
      'l.CODIGO_SEGURIDAD is null'
      'and n.NUMERO_NCF not in ('#39'<PLACEHOLDER>'#39')'
      'and (l.URL_IMAGE is  null or l.URL_IMAGE like '#39'%--%'#39')'
      'and (UPPER(n.DGII_STATUS) = '#39'ACEPTADO'#39' OR N.DGII_STATUS IS NULL)'
      'order by r.NUMERO')
    Left = 328
    Top = 144
    object qryEcfAconciliarQRXMLNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryEcfAconciliarQRXMLFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryEcfAconciliarQRXMLNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
    object qryEcfAconciliarQRXMLSERIE_ECF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_ECF_ASIGNADO'
      Origin = 'VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
  end
end
