object frmMantVarios: TfrmMantVarios
  Left = 344
  Top = 147
  Width = 767
  Height = 318
  Caption = 'Mantenimientos Varios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 78
    Height = 13
    Caption = 'Ciudades Origen'
  end
  object Label2: TLabel
    Left = 232
    Top = 8
    Width = 111
    Height = 13
    Caption = 'Asignr Nueva Ciudades'
  end
  object cboxCiudad: TComboBox
    Left = 9
    Top = 24
    Width = 213
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = cboxCiudadChange
  end
  object cboxCiudadNuevo: TComboBox
    Left = 233
    Top = 24
    Width = 213
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = cboxCiudadNuevoChange
  end
  object BitBtn1: TBitBtn
    Left = 456
    Top = 21
    Width = 75
    Height = 25
    Caption = 'Actualizar'
    TabOrder = 2
  end
  object qryCiudades: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ciudad')
    Left = 320
    Top = 80
    object qryCiudadesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CIUDAD.CODIGO'
      Required = True
    end
    object qryCiudadesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'CIUDAD.DESCRIPCION'
      Size = 35
    end
    object qryCiudadesVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'CIUDAD.VALOR'
    end
    object qryCiudadesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CIUDAD.STATUS'
      FixedChar = True
      Size = 1
    end
  end
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
      
        '  (CODIGO_CTE, CIA_KEY, TIPO_CLIENTE, FOTO, NOMBRE_CTE, NOMBRE_A' +
        'BREV, MONEDA_FACT, '
      
        '   NOMBRE_FACTURAR, CONTACTO, DIRECCION_CONT, TELEF_CONTACTO, FA' +
        'X_CONTACTO, '
      
        '   FORMA_PAGO, CODIGO_AGENCIA, STATUS_CLIENTE, INSERTADO_POR, FE' +
        'CHA_INSERTADO, '
      
        '   FECHA_MOD, MODI_POR, LIMITE_CREDITO, EMAIL, WEBSITE, PAIS, CI' +
        'UDAD, CEDULA, '
      
        '   RNC, REFERENCIA, TELEF_REFERENCIA, OTRO_TELEFONO, CANT_DIAS_C' +
        'REDITO, '
      
        '   TIPO_NCF, OBSERVACION, LUGAR_DE_TRABAJO, APODO, CODIGO_USUARI' +
        'O, RNC_NUMERO, '
      
        '   COMENTARIO, CONDICION, PRECIO_ID, RUTA_FOTO, TIPO_CF, MOVIL1,' +
        ' MOVIL2, '
      
        '   CODIGO_TEXTO, USARLEVELPRECIO, COD_VENDEDOR, FECHA_NACIMIENTO' +
        ', CODZONA, '
      '   RUTA, COD_CIUDAD, DIA_RUTA)'
      'values'
      
        '  (:CODIGO_CTE, :CIA_KEY, :TIPO_CLIENTE, :FOTO, :NOMBRE_CTE, :NO' +
        'MBRE_ABREV, '
      
        '   :MONEDA_FACT, :NOMBRE_FACTURAR, :CONTACTO, :DIRECCION_CONT, :' +
        'TELEF_CONTACTO, '
      
        '   :FAX_CONTACTO, :FORMA_PAGO, :CODIGO_AGENCIA, :STATUS_CLIENTE,' +
        ' :INSERTADO_POR, '
      
        '   :FECHA_INSERTADO, :FECHA_MOD, :MODI_POR, :LIMITE_CREDITO, :EM' +
        'AIL, :WEBSITE, '
      
        '   :PAIS, :CIUDAD, :CEDULA, :RNC, :REFERENCIA, :TELEF_REFERENCIA' +
        ', :OTRO_TELEFONO, '
      
        '   :CANT_DIAS_CREDITO, :TIPO_NCF, :OBSERVACION, :LUGAR_DE_TRABAJ' +
        'O, :APODO, '
      
        '   :CODIGO_USUARIO, :RNC_NUMERO, :COMENTARIO, :CONDICION, :PRECI' +
        'O_ID, :RUTA_FOTO, '
      
        '   :TIPO_CF, :MOVIL1, :MOVIL2, :CODIGO_TEXTO, :USARLEVELPRECIO, ' +
        ':COD_VENDEDOR, '
      '   :FECHA_NACIMIENTO, :CODZONA, :RUTA, :COD_CIUDAD, :DIA_RUTA)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_CTE,'
      '  CIA_KEY,'
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
      '  PRECIO_ID,'
      '  RUTA_FOTO,'
      '  TIPO_CF,'
      '  MOVIL1,'
      '  MOVIL2,'
      '  CODIGO_TEXTO,'
      '  USARLEVELPRECIO,'
      '  COD_VENDEDOR,'
      '  FECHA_NACIMIENTO,'
      '  CODZONA,'
      '  RUTA,'
      '  COD_CIUDAD,'
      '  DIA_RUTA'
      'from CLIENTES '
      'where'
      '  CODIGO_CTE = :CODIGO_CTE')
    SelectSQL.Strings = (
      'select * from CLIENTES')
    ModifySQL.Strings = (
      'update CLIENTES'
      'set'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  CIA_KEY = :CIA_KEY,'
      '  TIPO_CLIENTE = :TIPO_CLIENTE,'
      '  FOTO = :FOTO,'
      '  NOMBRE_CTE = :NOMBRE_CTE,'
      '  NOMBRE_ABREV = :NOMBRE_ABREV,'
      '  MONEDA_FACT = :MONEDA_FACT,'
      '  NOMBRE_FACTURAR = :NOMBRE_FACTURAR,'
      '  CONTACTO = :CONTACTO,'
      '  DIRECCION_CONT = :DIRECCION_CONT,'
      '  TELEF_CONTACTO = :TELEF_CONTACTO,'
      '  FAX_CONTACTO = :FAX_CONTACTO,'
      '  FORMA_PAGO = :FORMA_PAGO,'
      '  CODIGO_AGENCIA = :CODIGO_AGENCIA,'
      '  STATUS_CLIENTE = :STATUS_CLIENTE,'
      '  INSERTADO_POR = :INSERTADO_POR,'
      '  FECHA_INSERTADO = :FECHA_INSERTADO,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MODI_POR = :MODI_POR,'
      '  LIMITE_CREDITO = :LIMITE_CREDITO,'
      '  EMAIL = :EMAIL,'
      '  WEBSITE = :WEBSITE,'
      '  PAIS = :PAIS,'
      '  CIUDAD = :CIUDAD,'
      '  CEDULA = :CEDULA,'
      '  RNC = :RNC,'
      '  REFERENCIA = :REFERENCIA,'
      '  TELEF_REFERENCIA = :TELEF_REFERENCIA,'
      '  OTRO_TELEFONO = :OTRO_TELEFONO,'
      '  CANT_DIAS_CREDITO = :CANT_DIAS_CREDITO,'
      '  TIPO_NCF = :TIPO_NCF,'
      '  OBSERVACION = :OBSERVACION,'
      '  LUGAR_DE_TRABAJO = :LUGAR_DE_TRABAJO,'
      '  APODO = :APODO,'
      '  CODIGO_USUARIO = :CODIGO_USUARIO,'
      '  RNC_NUMERO = :RNC_NUMERO,'
      '  COMENTARIO = :COMENTARIO,'
      '  CONDICION = :CONDICION,'
      '  PRECIO_ID = :PRECIO_ID,'
      '  RUTA_FOTO = :RUTA_FOTO,'
      '  TIPO_CF = :TIPO_CF,'
      '  MOVIL1 = :MOVIL1,'
      '  MOVIL2 = :MOVIL2,'
      '  CODIGO_TEXTO = :CODIGO_TEXTO,'
      '  USARLEVELPRECIO = :USARLEVELPRECIO,'
      '  COD_VENDEDOR = :COD_VENDEDOR,'
      '  FECHA_NACIMIENTO = :FECHA_NACIMIENTO,'
      '  CODZONA = :CODZONA,'
      '  RUTA = :RUTA,'
      '  COD_CIUDAD = :COD_CIUDAD,'
      '  DIA_RUTA = :DIA_RUTA'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    Left = 504
    Top = 88
    object tblClientesCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object tblClientesCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'CLIENTES.CIA_KEY'
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
    object tblClientesCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object tblClientesRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'CLIENTES.RNC'
      Size = 12
    end
    object tblClientesREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'CLIENTES.REFERENCIA'
      Size = 40
    end
    object tblClientesTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'CLIENTES.TELEF_REFERENCIA'
    end
    object tblClientesOTRO_TELEFONO: TIBStringField
      FieldName = 'OTRO_TELEFONO'
      Origin = 'CLIENTES.OTRO_TELEFONO'
    end
    object tblClientesCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'CLIENTES.CANT_DIAS_CREDITO'
    end
    object tblClientesTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'CLIENTES.TIPO_NCF'
      FixedChar = True
      Size = 2
    end
    object tblClientesOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = 'CLIENTES.OBSERVACION'
      BlobType = ftMemo
      Size = 8
    end
    object tblClientesLUGAR_DE_TRABAJO: TIBStringField
      FieldName = 'LUGAR_DE_TRABAJO'
      Origin = 'CLIENTES.LUGAR_DE_TRABAJO'
      Size = 40
    end
    object tblClientesAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'CLIENTES.APODO'
    end
    object tblClientesCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'CLIENTES.CODIGO_USUARIO'
    end
    object tblClientesRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object tblClientesCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'CLIENTES.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object tblClientesCONDICION: TIntegerField
      FieldName = 'CONDICION'
      Origin = 'CLIENTES.CONDICION'
    end
    object tblClientesPRECIO_ID: TIntegerField
      FieldName = 'PRECIO_ID'
      Origin = 'CLIENTES.PRECIO_ID'
    end
    object tblClientesRUTA_FOTO: TIBStringField
      FieldName = 'RUTA_FOTO'
      Origin = 'CLIENTES.RUTA_FOTO'
      Size = 120
    end
    object tblClientesTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Origin = 'CLIENTES.TIPO_CF'
      FixedChar = True
      Size = 2
    end
    object tblClientesMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'CLIENTES.MOVIL1'
    end
    object tblClientesMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'CLIENTES.MOVIL2'
    end
    object tblClientesCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'CLIENTES.CODIGO_TEXTO'
    end
    object tblClientesUSARLEVELPRECIO: TSmallintField
      FieldName = 'USARLEVELPRECIO'
      Origin = 'CLIENTES.USARLEVELPRECIO'
    end
    object tblClientesCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'CLIENTES.COD_VENDEDOR'
    end
    object tblClientesFECHA_NACIMIENTO: TDateTimeField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'CLIENTES.FECHA_NACIMIENTO'
    end
    object tblClientesCODZONA: TIntegerField
      FieldName = 'CODZONA'
      Origin = 'CLIENTES.CODZONA'
    end
    object tblClientesRUTA: TIntegerField
      FieldName = 'RUTA'
      Origin = 'CLIENTES.RUTA'
    end
    object tblClientesCOD_CIUDAD: TIntegerField
      FieldName = 'COD_CIUDAD'
      Origin = 'CLIENTES.COD_CIUDAD'
    end
    object tblClientesDIA_RUTA: TIBStringField
      FieldName = 'DIA_RUTA'
      Origin = 'CLIENTES.DIA_RUTA'
    end
  end
end
