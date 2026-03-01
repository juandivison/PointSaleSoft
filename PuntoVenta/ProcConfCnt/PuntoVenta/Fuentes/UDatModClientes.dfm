object dmClientes: TdmClientes
  OldCreateOrder = False
  Left = 294
  Top = 129
  Height = 299
  Width = 361
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
    Left = 264
    Top = 48
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
end
