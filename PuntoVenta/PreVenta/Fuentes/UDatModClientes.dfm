object dmClientes: TdmClientes
  OldCreateOrder = False
  Left = 213
  Top = 123
  Height = 452
  Width = 519
  object tblClientes: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CLIENTES'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    InsertSQL.Strings = (
      'insert into CLIENTES'
      
        '  (CIUDAD, CODIGO_AGENCIA, CODIGO_CTE, RNC_NUMERO, CONTACTO, DIR' +
        'ECCION_CONT, '
      
        '   EMAIL, FAX_CONTACTO, FECHA_INSERTADO, FECHA_MOD, FORMA_PAGO, ' +
        'FOTO, INSERTADO_POR, '
      
        '   LIMITE_CREDITO, MODI_POR, MONEDA_FACT, NOMBRE_ABREV, NOMBRE_C' +
        'TE, NOMBRE_FACTURAR, '
      
        '   PAIS, STATUS_CLIENTE, TELEF_CONTACTO, TIPO_CLIENTE, WEBSITE, ' +
        'CONDICION, '
      '   CANT_DIAS_CREDITO, PRECIO_ID)'
      'values'
      
        '  (:CIUDAD, :CODIGO_AGENCIA, :CODIGO_CTE, :RNC_NUMERO, :CONTACTO' +
        ', :DIRECCION_CONT, '
      
        '   :EMAIL, :FAX_CONTACTO, :FECHA_INSERTADO, :FECHA_MOD, :FORMA_P' +
        'AGO, :FOTO, '
      
        '   :INSERTADO_POR, :LIMITE_CREDITO, :MODI_POR, :MONEDA_FACT, :NO' +
        'MBRE_ABREV, '
      
        '   :NOMBRE_CTE, :NOMBRE_FACTURAR, :PAIS, :STATUS_CLIENTE, :TELEF' +
        '_CONTACTO, '
      
        '   :TIPO_CLIENTE, :WEBSITE, :CONDICION, :CANT_DIAS_CREDITO, :PRE' +
        'CIO_ID)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_CTE,'
      '  TIPO_CLIENTE,'
      '  FOTO,'
      '  NOMBRE_CTE,'
      '  NOMBRE_ABREV,'
      '  MONEDA_FACT,'
      '  NOMBRE_FACTURAR,'
      '  CONTACTO,'
      '  DIRECCION_CONT,'
      '  TELEF_CONTACTO,'
      '  FAX_CONTACTO,'
      '  FORMA_PAGO,'
      '  CODIGO_AGENCIA,'
      '  STATUS_CLIENTE,'
      '  INSERTADO_POR,'
      '  FECHA_INSERTADO,'
      '  FECHA_MOD,'
      '  MODI_POR,'
      '  LIMITE_CREDITO,'
      '  EMAIL,'
      '  WEBSITE,'
      '  PAIS,'
      '  CIUDAD,'
      '  CEDULA,'
      '  RNC,'
      '  REFERENCIA,'
      '  TELEF_REFERENCIA,'
      '  OTRO_TELEFONO,'
      '  CANT_DIAS_CREDITO,'
      '  TIPO_NCF,'
      '  OBSERVACION,'
      '  LUGAR_DE_TRABAJO,'
      '  APODO,'
      '  CODIGO_USUARIO,'
      '  RNC_NUMERO,'
      '  COMENTARIO,'
      '  CONDICION,'
      '  PRECIO_ID'
      'from CLIENTES '
      'where'
      '  CODIGO_CTE = :CODIGO_CTE')
    SelectSQL.Strings = (
      'select CIUDAD, '
      'CODIGO_AGENCIA, '
      'CODIGO_CTE, '
      'RNC_NUMERO, '
      'CONTACTO, '
      'DIRECCION_CONT, '
      'EMAIL, '
      'FAX_CONTACTO, '
      'FECHA_INSERTADO, '
      'FECHA_MOD, '
      'FORMA_PAGO, '
      'FOTO, '
      'INSERTADO_POR, '
      'LIMITE_CREDITO, '
      'MODI_POR, '
      'MONEDA_FACT, '
      'NOMBRE_ABREV, '
      'NOMBRE_CTE, '
      'NOMBRE_FACTURAR, '
      'PAIS, '
      'STATUS_CLIENTE, '
      'TELEF_CONTACTO, '
      'TIPO_CLIENTE, '
      'WEBSITE, '
      'condicion , CANT_DIAS_CREDITO, precio_id '
      'from CLIENTES'
      'order by CODIGO_CTE')
    ModifySQL.Strings = (
      'update CLIENTES'
      'set'
      '  CIUDAD = :CIUDAD,'
      '  CODIGO_AGENCIA = :CODIGO_AGENCIA,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  RNC_NUMERO = :RNC_NUMERO,'
      '  CONTACTO = :CONTACTO,'
      '  DIRECCION_CONT = :DIRECCION_CONT,'
      '  EMAIL = :EMAIL,'
      '  FAX_CONTACTO = :FAX_CONTACTO,'
      '  FECHA_INSERTADO = :FECHA_INSERTADO,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  FORMA_PAGO = :FORMA_PAGO,'
      '  FOTO = :FOTO,'
      '  INSERTADO_POR = :INSERTADO_POR,'
      '  LIMITE_CREDITO = :LIMITE_CREDITO,'
      '  MODI_POR = :MODI_POR,'
      '  MONEDA_FACT = :MONEDA_FACT,'
      '  NOMBRE_ABREV = :NOMBRE_ABREV,'
      '  NOMBRE_CTE = :NOMBRE_CTE,'
      '  NOMBRE_FACTURAR = :NOMBRE_FACTURAR,'
      '  PAIS = :PAIS,'
      '  STATUS_CLIENTE = :STATUS_CLIENTE,'
      '  TELEF_CONTACTO = :TELEF_CONTACTO,'
      '  TIPO_CLIENTE = :TIPO_CLIENTE,'
      '  WEBSITE = :WEBSITE,'
      '  CONDICION = :CONDICION,'
      '  CANT_DIAS_CREDITO = :CANT_DIAS_CREDITO,'
      '  PRECIO_ID = :PRECIO_ID'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    GeneratorField.Field = 'CODIGO_CTE'
    GeneratorField.Generator = 'GEN_CODIGO_CTE'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 161
    Top = 80
    object tblClientesCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object tblClientesTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
    object tblClientesFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'CLIENTES.FOTO'
      Size = 8
    end
    object tblClientesNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object tblClientesNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object tblClientesMONEDA_FACT: TIBStringField
      FieldName = 'MONEDA_FACT'
      Origin = 'CLIENTES.MONEDA_FACT'
      FixedChar = True
      Size = 1
    end
    object tblClientesNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object tblClientesCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'CLIENTES.CONTACTO'
      Size = 30
    end
    object tblClientesDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object tblClientesTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object tblClientesFAX_CONTACTO: TIBStringField
      FieldName = 'FAX_CONTACTO'
      Origin = 'CLIENTES.FAX_CONTACTO'
      Size = 14
    end
    object tblClientesFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'CLIENTES.FORMA_PAGO'
    end
    object tblClientesCODIGO_AGENCIA: TSmallintField
      FieldName = 'CODIGO_AGENCIA'
      Origin = 'CLIENTES.CODIGO_AGENCIA'
    end
    object tblClientesSTATUS_CLIENTE: TIBStringField
      FieldName = 'STATUS_CLIENTE'
      Origin = 'CLIENTES.STATUS_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object tblClientesINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'CLIENTES.INSERTADO_POR'
      Size = 12
    end
    object tblClientesFECHA_INSERTADO: TDateTimeField
      FieldName = 'FECHA_INSERTADO'
      Origin = 'CLIENTES.FECHA_INSERTADO'
    end
    object tblClientesFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CLIENTES.FECHA_MOD'
    end
    object tblClientesMODI_POR: TIBStringField
      FieldName = 'MODI_POR'
      Origin = 'CLIENTES.MODI_POR'
      Size = 12
    end
    object tblClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object tblClientesEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object tblClientesWEBSITE: TIBStringField
      FieldName = 'WEBSITE'
      Origin = 'CLIENTES.WEBSITE'
      Size = 40
    end
    object tblClientesPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object tblClientesCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object tblClientesRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object tblClientesCONDICION: TIntegerField
      FieldName = 'CONDICION'
      Origin = 'CLIENTES.CONDICION'
    end
    object tblClientesCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'CLIENTES.CANT_DIAS_CREDITO'
    end
    object tblClientesPRECIO_ID: TIntegerField
      FieldName = 'PRECIO_ID'
      Origin = 'CLIENTES.PRECIO_ID'
    end
  end
  object dstblClientes: TDataSource
    DataSet = tblClientes
    Left = 84
    Top = 72
  end
  object tblTipoCliente: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_CLIENTE'
    Left = 112
    Top = 144
  end
  object tblMoneda: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'MONEDA'
    Left = 192
    Top = 144
  end
  object dstblTipoNCF: TDataSource
    DataSet = tblTipoNCF
    Left = 160
    Top = 8
  end
  object tblTipoNCF: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_CF'
    Left = 88
    Top = 8
    object tblTipoNCFTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Size = 2
    end
    object tblTipoNCFDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object tblCondicionVenta: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    StoreDefs = True
    TableName = 'CONDICION'
    Left = 320
    Top = 88
    object tblCondicionVentaCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Required = True
    end
    object tblCondicionVentaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
    end
  end
  object tblTipoPrecio: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_PRECIO'
    Left = 256
    Top = 112
    object tblTipoPrecioPRECIO_ID: TIntegerField
      FieldName = 'PRECIO_ID'
    end
    object tblTipoPrecioDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object dstblTipoPrecio: TDataSource
    DataSet = tblTipoPrecio
    Left = 272
    Top = 168
  end
  object qryCteTiporeferencia: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  * from TIPO_REFERENCIA')
    Left = 80
    Top = 248
    object qryCteTiporeferenciaTIPO_REFERENCIA: TIntegerField
      FieldName = 'TIPO_REFERENCIA'
      Origin = 'TIPO_REFERENCIA.TIPO_REFERENCIA'
    end
    object qryCteTiporeferenciaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_REFERENCIA.DESCRIPCION'
      Size = 30
    end
  end
  object tblCteTipoReferencia: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    FieldDefs = <
      item
        Name = 'TIPO_REFERENCIA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'PK_TIPO_REFERENCIA1'
        Fields = 'TIPO_REFERENCIA'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_TIPO_REFERENCIA1'
        Fields = 'TIPO_REFERENCIA'
      end>
    StoreDefs = True
    TableName = 'TIPO_REFERENCIA'
    Left = 192
    Top = 264
    object tblCteTipoReferenciaTIPO_REFERENCIA: TIntegerField
      DisplayLabel = 'Tipo Referencia'
      FieldName = 'TIPO_REFERENCIA'
    end
    object tblCteTipoReferenciaDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object dstblCteTipoReferencia: TDataSource
    DataSet = tblCteTipoReferencia
    Left = 192
    Top = 320
  end
  object dsqryCteTiporeferencia: TDataSource
    DataSet = qryCteTiporeferencia
    Left = 80
    Top = 304
  end
  object tblCteReferenciaDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CTE_REFERENCIA_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into CTE_REFERENCIA_DET'
      
        '  (SERIE, CODIGO_CTE, TIPO_REFERENCIA, NOMBREEMPRESA, CEDULA_RNC' +
        ', PRIMERNOMBRE, '
      
        '   SEGUNDONOMBRE, PRIMERAPELLIDO, SEGUNDOAPELLIDO, TELEFONO, CEL' +
        'ULAR, TELEFONO_TRABAJO, '
      
        '   EMAIL, CALLE, CASANUM, APTONUM, SECTOR, PROVINCIA, CIUDAD, PA' +
        'IS)'
      'values'
      
        '  (:SERIE, :CODIGO_CTE, :TIPO_REFERENCIA, :NOMBREEMPRESA, :CEDUL' +
        'A_RNC, '
      
        '   :PRIMERNOMBRE, :SEGUNDONOMBRE, :PRIMERAPELLIDO, :SEGUNDOAPELL' +
        'IDO, :TELEFONO, '
      
        '   :CELULAR, :TELEFONO_TRABAJO, :EMAIL, :CALLE, :CASANUM, :APTON' +
        'UM, :SECTOR, '
      '   :PROVINCIA, :CIUDAD, :PAIS)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  CODIGO_CTE,'
      '  TIPO_REFERENCIA,'
      '  NOMBREEMPRESA,'
      '  CEDULA_RNC,'
      '  PRIMERNOMBRE,'
      '  SEGUNDONOMBRE,'
      '  PRIMERAPELLIDO,'
      '  SEGUNDOAPELLIDO,'
      '  TELEFONO,'
      '  CELULAR,'
      '  TELEFONO_TRABAJO,'
      '  EMAIL,'
      '  CALLE,'
      '  CASANUM,'
      '  APTONUM,'
      '  SECTOR,'
      '  PROVINCIA,'
      '  CIUDAD,'
      '  PAIS'
      'from CTE_REFERENCIA_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * From CTE_REFERENCIA_DET'
      'Where Tipo_referencia=:tiporeferencia'
      'And Codigo_cte =:codigocte')
    ModifySQL.Strings = (
      'update CTE_REFERENCIA_DET'
      'set'
      '  SERIE = :SERIE,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  TIPO_REFERENCIA = :TIPO_REFERENCIA,'
      '  NOMBREEMPRESA = :NOMBREEMPRESA,'
      '  CEDULA_RNC = :CEDULA_RNC,'
      '  PRIMERNOMBRE = :PRIMERNOMBRE,'
      '  SEGUNDONOMBRE = :SEGUNDONOMBRE,'
      '  PRIMERAPELLIDO = :PRIMERAPELLIDO,'
      '  SEGUNDOAPELLIDO = :SEGUNDOAPELLIDO,'
      '  TELEFONO = :TELEFONO,'
      '  CELULAR = :CELULAR,'
      '  TELEFONO_TRABAJO = :TELEFONO_TRABAJO,'
      '  EMAIL = :EMAIL,'
      '  CALLE = :CALLE,'
      '  CASANUM = :CASANUM,'
      '  APTONUM = :APTONUM,'
      '  SECTOR = :SECTOR,'
      '  PROVINCIA = :PROVINCIA,'
      '  CIUDAD = :CIUDAD,'
      '  PAIS = :PAIS'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 432
    Top = 272
    object tblCteReferenciaDetSERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'CTE_REFERENCIA_DET.SERIE'
      Required = True
    end
    object tblCteReferenciaDetCODIGO_CTE: TIntegerField
      DisplayLabel = 'CodigoCte'
      FieldName = 'CODIGO_CTE'
      Origin = 'CTE_REFERENCIA_DET.CODIGO_CTE'
      Required = True
    end
    object tblCteReferenciaDetTIPO_REFERENCIA: TIntegerField
      DisplayLabel = 'TipoReferencia'
      FieldName = 'TIPO_REFERENCIA'
      Origin = 'CTE_REFERENCIA_DET.TIPO_REFERENCIA'
      Required = True
    end
    object tblCteReferenciaDetNOMBREEMPRESA: TIBStringField
      DisplayLabel = 'Nombre Empresa'
      FieldName = 'NOMBREEMPRESA'
      Origin = 'CTE_REFERENCIA_DET.NOMBREEMPRESA'
      Size = 60
    end
    object tblCteReferenciaDetCEDULA_RNC: TIBStringField
      DisplayLabel = 'Cedula/RNC'
      FieldName = 'CEDULA_RNC'
      Origin = 'CTE_REFERENCIA_DET.CEDULA_RNC'
      Size = 13
    end
    object tblCteReferenciaDetPRIMERNOMBRE: TIBStringField
      DisplayLabel = 'Primer Nombre'
      FieldName = 'PRIMERNOMBRE'
      Origin = 'CTE_REFERENCIA_DET.PRIMERNOMBRE'
      Size = 60
    end
    object tblCteReferenciaDetSEGUNDONOMBRE: TIBStringField
      DisplayLabel = 'Segundo Nombre'
      FieldName = 'SEGUNDONOMBRE'
      Origin = 'CTE_REFERENCIA_DET.SEGUNDONOMBRE'
      Size = 60
    end
    object tblCteReferenciaDetPRIMERAPELLIDO: TIBStringField
      DisplayLabel = 'Primer Apellido'
      FieldName = 'PRIMERAPELLIDO'
      Origin = 'CTE_REFERENCIA_DET.PRIMERAPELLIDO'
      Size = 60
    end
    object tblCteReferenciaDetSEGUNDOAPELLIDO: TIBStringField
      DisplayLabel = 'Segundo Apellido'
      FieldName = 'SEGUNDOAPELLIDO'
      Origin = 'CTE_REFERENCIA_DET.SEGUNDOAPELLIDO'
      Size = 60
    end
    object tblCteReferenciaDetTELEFONO: TIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'TELEFONO'
      Origin = 'CTE_REFERENCIA_DET.TELEFONO'
      Size = 25
    end
    object tblCteReferenciaDetCELULAR: TIBStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      Origin = 'CTE_REFERENCIA_DET.CELULAR'
      Size = 25
    end
    object tblCteReferenciaDetTELEFONO_TRABAJO: TIBStringField
      DisplayLabel = 'Telefono del Trabajo'
      FieldName = 'TELEFONO_TRABAJO'
      Origin = 'CTE_REFERENCIA_DET.TELEFONO_TRABAJO'
      Size = 25
    end
    object tblCteReferenciaDetEMAIL: TIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Origin = 'CTE_REFERENCIA_DET.EMAIL'
      Size = 80
    end
    object tblCteReferenciaDetCALLE: TIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Origin = 'CTE_REFERENCIA_DET.CALLE'
      Size = 50
    end
    object tblCteReferenciaDetCASANUM: TIBStringField
      DisplayLabel = '#Casa/Suite'
      FieldName = 'CASANUM'
      Origin = 'CTE_REFERENCIA_DET.CASANUM'
      Size = 8
    end
    object tblCteReferenciaDetAPTONUM: TIBStringField
      DisplayLabel = '#Edificio'
      FieldName = 'APTONUM'
      Origin = 'CTE_REFERENCIA_DET.APTONUM'
      Size = 8
    end
    object tblCteReferenciaDetSECTOR: TIBStringField
      DisplayLabel = 'Sector'
      FieldName = 'SECTOR'
      Origin = 'CTE_REFERENCIA_DET.SECTOR'
      Size = 45
    end
    object tblCteReferenciaDetPROVINCIA: TIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Origin = 'CTE_REFERENCIA_DET.PROVINCIA'
      Size = 45
    end
    object tblCteReferenciaDetCIUDAD: TIBStringField
      DisplayLabel = 'Ciudad'
      FieldName = 'CIUDAD'
      Origin = 'CTE_REFERENCIA_DET.CIUDAD'
      Size = 50
    end
    object tblCteReferenciaDetPAIS: TIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Origin = 'CTE_REFERENCIA_DET.PAIS'
      Size = 50
    end
  end
  object dstblCteReferenciaDet: TDataSource
    AutoEdit = False
    DataSet = tblCteReferenciaDet
    Left = 424
    Top = 328
  end
  object tblCteReferenciaMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblCteReferenciaMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CTE_REFERENCIA_MASTER'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    InsertSQL.Strings = (
      'insert into CTE_REFERENCIA_MASTER'
      '  (CODIGO_CTE, TIPO_REFERENCIA)'
      'values'
      '  (:CODIGO_CTE, :TIPO_REFERENCIA)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_CTE,'
      '  TIPO_REFERENCIA'
      'from CTE_REFERENCIA_MASTER '
      'where'
      '  CODIGO_CTE = :CODIGO_CTE')
    SelectSQL.Strings = (
      'Select *  From CTE_REFERENCIA_MASTER'
      'Where codigo_cte =:codigocte')
    ModifySQL.Strings = (
      'update CTE_REFERENCIA_MASTER'
      'set'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  TIPO_REFERENCIA = :TIPO_REFERENCIA'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    Left = 304
    Top = 272
    object tblCteReferenciaMasterCODIGO_CTE: TIntegerField
      DisplayLabel = 'Codigo Cte'
      FieldName = 'CODIGO_CTE'
      Origin = 'CTE_REFERENCIA_MASTER.CODIGO_CTE'
    end
    object tblCteReferenciaMasterTIPO_REFERENCIA: TIntegerField
      DisplayLabel = 'Tipo Ref'
      FieldName = 'TIPO_REFERENCIA'
      Origin = 'CTE_REFERENCIA_MASTER.TIPO_REFERENCIA'
    end
    object tblCteReferenciaMasterRefDescripcion: TStringField
      DisplayLabel = 'Descripcion Referencia'
      FieldKind = fkLookup
      FieldName = 'RefDescripcion'
      LookupDataSet = tblCteTipoReferencia
      LookupKeyFields = 'TIPO_REFERENCIA'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'TIPO_REFERENCIA'
      Lookup = True
    end
  end
  object dstblCteReferenciaMaster: TDataSource
    DataSet = tblCteReferenciaMaster
    Left = 304
    Top = 336
  end
  object dsqryReferenciacliente: TDataSource
    DataSet = qryReferenciacliente
    Left = 360
    Top = 216
  end
  object qryReferenciacliente: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT '
      '  CLIENTES.nombre_cte,'
      '  CLIENTES.NOMBRE_facturar,'
      '  TIPO_REFERENCIA.DESCRIPCION,'
      '  CTE_REFERENCIA_DET.NOMBREEMPRESA,'
      '  CTE_REFERENCIA_DET.CEDULA_RNC,'
      '  CTE_REFERENCIA_DET.PRIMERNOMBRE,'
      '  CTE_REFERENCIA_DET.SEGUNDONOMBRE,'
      '  CTE_REFERENCIA_DET.PRIMERAPELLIDO,'
      '  CTE_REFERENCIA_DET.SEGUNDOAPELLIDO,'
      '  CTE_REFERENCIA_DET.TELEFONO,'
      '  CTE_REFERENCIA_DET.CELULAR,'
      '  CTE_REFERENCIA_DET.TELEFONO_TRABAJO,'
      '  CTE_REFERENCIA_DET.EMAIL,'
      '  CTE_REFERENCIA_DET.CALLE,'
      '  CTE_REFERENCIA_DET.CASANUM,'
      '  CTE_REFERENCIA_DET.APTONUM,'
      '  CTE_REFERENCIA_DET.SECTOR,'
      '  CTE_REFERENCIA_DET.PROVINCIA,'
      '  CTE_REFERENCIA_DET.CIUDAD,'
      '  CTE_REFERENCIA_DET.PAIS,'
      '  CTE_REFERENCIA_MASTER.CODIGO_CTE'
      'FROM'
      '  CTE_REFERENCIA_MASTER'
      
        '  INNER JOIN CLIENTES ON (CTE_REFERENCIA_MASTER.CODIGO_CTE = CLI' +
        'ENTES.CODIGO_cte)'
      
        '  INNER JOIN CTE_REFERENCIA_DET ON (CLIENTES.CODIGO_cte = CTE_RE' +
        'FERENCIA_DET.CODIGO_CTE)'
      
        '  INNER JOIN TIPO_REFERENCIA ON (CTE_REFERENCIA_DET.TIPO_REFEREN' +
        'CIA = TIPO_REFERENCIA.TIPO_REFERENCIA)'
      'Where CTE_REFERENCIA_MASTER.CODIGO_CTE=:codigocte')
    Left = 408
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigocte'
        ParamType = ptInput
      end>
    object qryReferenciaclienteNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryReferenciaclienteNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryReferenciaclienteDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_REFERENCIA.DESCRIPCION'
      Size = 30
    end
    object qryReferenciaclienteNOMBREEMPRESA: TIBStringField
      FieldName = 'NOMBREEMPRESA'
      Origin = 'CTE_REFERENCIA_DET.NOMBREEMPRESA'
      Size = 60
    end
    object qryReferenciaclienteCEDULA_RNC: TIBStringField
      FieldName = 'CEDULA_RNC'
      Origin = 'CTE_REFERENCIA_DET.CEDULA_RNC'
      Size = 13
    end
    object qryReferenciaclientePRIMERNOMBRE: TIBStringField
      FieldName = 'PRIMERNOMBRE'
      Origin = 'CTE_REFERENCIA_DET.PRIMERNOMBRE'
      Size = 60
    end
    object qryReferenciaclienteSEGUNDONOMBRE: TIBStringField
      FieldName = 'SEGUNDONOMBRE'
      Origin = 'CTE_REFERENCIA_DET.SEGUNDONOMBRE'
      Size = 60
    end
    object qryReferenciaclientePRIMERAPELLIDO: TIBStringField
      FieldName = 'PRIMERAPELLIDO'
      Origin = 'CTE_REFERENCIA_DET.PRIMERAPELLIDO'
      Size = 60
    end
    object qryReferenciaclienteSEGUNDOAPELLIDO: TIBStringField
      FieldName = 'SEGUNDOAPELLIDO'
      Origin = 'CTE_REFERENCIA_DET.SEGUNDOAPELLIDO'
      Size = 60
    end
    object qryReferenciaclienteTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'CTE_REFERENCIA_DET.TELEFONO'
      Size = 25
    end
    object qryReferenciaclienteCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'CTE_REFERENCIA_DET.CELULAR'
      Size = 25
    end
    object qryReferenciaclienteTELEFONO_TRABAJO: TIBStringField
      FieldName = 'TELEFONO_TRABAJO'
      Origin = 'CTE_REFERENCIA_DET.TELEFONO_TRABAJO'
      Size = 25
    end
    object qryReferenciaclienteEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CTE_REFERENCIA_DET.EMAIL'
      Size = 80
    end
    object qryReferenciaclienteCALLE: TIBStringField
      FieldName = 'CALLE'
      Origin = 'CTE_REFERENCIA_DET.CALLE'
      Size = 50
    end
    object qryReferenciaclienteCASANUM: TIBStringField
      FieldName = 'CASANUM'
      Origin = 'CTE_REFERENCIA_DET.CASANUM'
      Size = 8
    end
    object qryReferenciaclienteAPTONUM: TIBStringField
      FieldName = 'APTONUM'
      Origin = 'CTE_REFERENCIA_DET.APTONUM'
      Size = 8
    end
    object qryReferenciaclienteSECTOR: TIBStringField
      FieldName = 'SECTOR'
      Origin = 'CTE_REFERENCIA_DET.SECTOR'
      Size = 45
    end
    object qryReferenciaclientePROVINCIA: TIBStringField
      FieldName = 'PROVINCIA'
      Origin = 'CTE_REFERENCIA_DET.PROVINCIA'
      Size = 45
    end
    object qryReferenciaclienteCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CTE_REFERENCIA_DET.CIUDAD'
      Size = 50
    end
    object qryReferenciaclientePAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CTE_REFERENCIA_DET.PAIS'
      Size = 50
    end
    object qryReferenciaclienteCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CTE_REFERENCIA_MASTER.CODIGO_CTE'
      Required = True
    end
  end
  object dstblClientesDelivery: TDataSource
    DataSet = tblClientesDelivery
    Left = 259
    Top = 17
  end
  object tblClientesDelivery: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CLIENTES_DELIVERY'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into CLIENTES_DELIVERY'
      '  (CODIGO, NOMBRE, TELEFONO, DIRECCION, FECHA_IN, INSERT_POR)'
      'values'
      
        '  (:CODIGO, :NOMBRE, :TELEFONO, :DIRECCION, :FECHA_IN, :INSERT_P' +
        'OR)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  NOMBRE,'
      '  TELEFONO,'
      '  DIRECCION,'
      '  FECHA_IN,'
      '  INSERT_POR'
      'from CLIENTES_DELIVERY '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'Select * from CLIENTES_DELIVERY'
      'Where telefono =:telefono')
    ModifySQL.Strings = (
      'update CLIENTES_DELIVERY'
      'set'
      '  CODIGO = :CODIGO,'
      '  NOMBRE = :NOMBRE,'
      '  TELEFONO = :TELEFONO,'
      '  DIRECCION = :DIRECCION,'
      '  FECHA_IN = :FECHA_IN,'
      '  INSERT_POR = :INSERT_POR'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 336
    Top = 8
    object tblClientesDeliveryCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CLIENTES_DELIVERY.CODIGO'
      Required = True
    end
    object tblClientesDeliveryNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'CLIENTES_DELIVERY.NOMBRE'
      Size = 80
    end
    object tblClientesDeliveryTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'CLIENTES_DELIVERY.TELEFONO'
    end
    object tblClientesDeliveryDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Origin = 'CLIENTES_DELIVERY.DIRECCION'
      Size = 80
    end
    object tblClientesDeliveryFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CLIENTES_DELIVERY.FECHA_IN'
    end
    object tblClientesDeliveryINSERT_POR: TIBStringField
      FieldName = 'INSERT_POR'
      Origin = 'CLIENTES_DELIVERY.INSERT_POR'
      Size = 12
    end
  end
end
