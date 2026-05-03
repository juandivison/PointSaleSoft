object dmClientes: TdmClientes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 651
  Top = 197
  Height = 521
  Width = 884
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
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'CODIGO_ABR'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'TIPO_CLIENTEINDEX1'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY24'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TIPO_CLIENTE'
    Left = 128
    Top = 136
    object tblTipoClienteCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Required = True
    end
    object tblTipoClienteCODIGO_ABR: TIBStringField
      FieldName = 'CODIGO_ABR'
      Size = 12
    end
    object tblTipoClienteDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
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
    Left = 313
    Top = 64
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
    Left = 310
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
    Left = 309
    Top = 168
  end
  object qryCteTiporeferencia: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  * from TIPO_REFERENCIA')
    Left = 67
    Top = 264
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
    Left = 64
    Top = 320
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
    Left = 424
    Top = 268
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
    Top = 320
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
    Top = 266
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
    Left = 307
    Top = 217
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
  object qryTipoContacto: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from Tipo_contacto')
    Left = 408
    Top = 40
    object qryTipoContactoTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO_CONTACTO.TIPO'
      Required = True
    end
    object qryTipoContactoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_CONTACTO.DESCRIPCION'
      Size = 30
    end
  end
  object tblDatosContacto: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from clientes_contactos'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE and'
      '  TIPO = :OLD_TIPO and'
      '  CEDULA = :OLD_CEDULA')
    InsertSQL.Strings = (
      'insert into clientes_contactos'
      
        '  (CODIGO_CTE, TIPO, CEDULA, NOMBRE, DIRECCION, TELEFONO, CELULA' +
        'R, LUGAR_DE_TRABAJO, '
      '   NOMBREJEFEINMEDIATO, RANGO, SUPERIOR)'
      'values'
      
        '  (:CODIGO_CTE, :TIPO, :CEDULA, :NOMBRE, :DIRECCION, :TELEFONO, ' +
        ':CELULAR, '
      '   :LUGAR_DE_TRABAJO, :NOMBREJEFEINMEDIATO, :RANGO, :SUPERIOR)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_CTE,'
      '  TIPO,'
      '  CEDULA,'
      '  NOMBRE,'
      '  DIRECCION,'
      '  TELEFONO,'
      '  CELULAR,'
      '  LUGAR_DE_TRABAJO,'
      '  NOMBREJEFEINMEDIATO,'
      '  RANGO,'
      '  SUPERIOR'
      'from clientes_contactos '
      'where'
      '  CODIGO_CTE = :CODIGO_CTE and'
      '  TIPO = :TIPO and'
      '  CEDULA = :CEDULA')
    SelectSQL.Strings = (
      'Select * From clientes_contactos'
      'Where codigo_cte =:codigoCte')
    ModifySQL.Strings = (
      'update clientes_contactos'
      'set'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  TIPO = :TIPO,'
      '  CEDULA = :CEDULA,'
      '  NOMBRE = :NOMBRE,'
      '  DIRECCION = :DIRECCION,'
      '  TELEFONO = :TELEFONO,'
      '  CELULAR = :CELULAR,'
      '  LUGAR_DE_TRABAJO = :LUGAR_DE_TRABAJO,'
      '  NOMBREJEFEINMEDIATO = :NOMBREJEFEINMEDIATO,'
      '  RANGO = :RANGO,'
      '  SUPERIOR = :SUPERIOR'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE and'
      '  TIPO = :OLD_TIPO and'
      '  CEDULA = :OLD_CEDULA')
    Left = 408
    Top = 96
    object tblDatosContactoCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES_CONTACTOS.CODIGO_CTE'
      Required = True
    end
    object tblDatosContactoTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'CLIENTES_CONTACTOS.TIPO'
    end
    object tblDatosContactoCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES_CONTACTOS.CEDULA'
      Required = True
      Size = 15
    end
    object tblDatosContactoNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'CLIENTES_CONTACTOS.NOMBRE'
      Size = 60
    end
    object tblDatosContactoDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Origin = 'CLIENTES_CONTACTOS.DIRECCION'
      Size = 80
    end
    object tblDatosContactoTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'CLIENTES_CONTACTOS.TELEFONO'
    end
    object tblDatosContactoCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'CLIENTES_CONTACTOS.CELULAR'
    end
    object tblDatosContactoLUGAR_DE_TRABAJO: TIBStringField
      FieldName = 'LUGAR_DE_TRABAJO'
      Origin = 'CLIENTES_CONTACTOS.LUGAR_DE_TRABAJO'
      Size = 30
    end
    object tblDatosContactoNOMBREJEFEINMEDIATO: TIBStringField
      FieldName = 'NOMBREJEFEINMEDIATO'
      Origin = 'CLIENTES_CONTACTOS.NOMBREJEFEINMEDIATO'
      Size = 60
    end
    object tblDatosContactoRANGO: TIBStringField
      FieldName = 'RANGO'
      Origin = 'CLIENTES_CONTACTOS.RANGO'
      Size = 25
    end
    object tblDatosContactoSUPERIOR: TIBStringField
      FieldName = 'SUPERIOR'
      Origin = 'CLIENTES_CONTACTOS.SUPERIOR'
      Size = 25
    end
  end
  object dsqryTipoContacto: TDataSource
    DataSet = qryTipoContacto
    Left = 504
    Top = 16
  end
  object qryTipoContactoRep: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryTipoContactoRepAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from Tipo_contacto')
    Left = 525
    Top = 150
    object qryTipoContactoRepTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO_CONTACTO.TIPO'
      Required = True
    end
    object qryTipoContactoRepDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_CONTACTO.DESCRIPCION'
      Size = 30
    end
  end
  object qryDatosContactoRep: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From clientes_contactos'
      'Where codigo_cte =:codigoCte'
      'and tipo=:tipo')
    Left = 531
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoCte'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo'
        ParamType = ptInput
      end>
  end
  object tblDatosVehiculo: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblDatosVehiculoAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DatosVehiculo'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into DatosVehiculo'
      
        '  (NUMERO, CODIGO_CTE, FECHA_APERTURA, FECHA_VENCE_SEGURO, TIPO_' +
        'AFILIADO, '
      
        '   PLACA, IDMARCA, MODELO, ANO_VEH, TIPO_SEGURO, CIA_SEGURO, EMP' +
        'RESA_LABORA, '
      
        '   FECHA_IN, IN_POR, CODIGO_DEALER, CODIGO_AGENCIA, COLOR, NUM_C' +
        'ERTIFICADO, '
      
        '   CHASSIS, NUMPOL, STATUSCXC, POLIZA_ESPECIAL, RUTA_FILEAUTH, N' +
        'OTIFY_EMAIL, '
      '   CON_CARENCIA)'
      'values'
      
        '  (:NUMERO, :CODIGO_CTE, :FECHA_APERTURA, :FECHA_VENCE_SEGURO, :' +
        'TIPO_AFILIADO, '
      
        '   :PLACA, :IDMARCA, :MODELO, :ANO_VEH, :TIPO_SEGURO, :CIA_SEGUR' +
        'O, :EMPRESA_LABORA, '
      
        '   :FECHA_IN, :IN_POR, :CODIGO_DEALER, :CODIGO_AGENCIA, :COLOR, ' +
        ':NUM_CERTIFICADO, '
      
        '   :CHASSIS, :NUMPOL, :STATUSCXC, :POLIZA_ESPECIAL, :RUTA_FILEAU' +
        'TH, :NOTIFY_EMAIL, '
      '   :CON_CARENCIA)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  CODIGO_CTE,'
      '  FECHA_APERTURA,'
      '  FECHA_VENCE_SEGURO,'
      '  TIPO_AFILIADO,'
      '  PLACA,'
      '  IDMARCA,'
      '  MODELO,'
      '  ANO_VEH,'
      '  TIPO_SEGURO,'
      '  CIA_SEGURO,'
      '  EMPRESA_LABORA,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  CODIGO_DEALER,'
      '  CODIGO_AGENCIA,'
      '  COLOR,'
      '  NUM_CERTIFICADO,'
      '  CHASSIS,'
      '  NUMPOL,'
      '  STATUSCXC,'
      '  POLIZA_ESPECIAL,'
      '  RUTA_FILEAUTH,'
      '  NOTIFY_EMAIL,'
      '  CON_CARENCIA'
      'from DatosVehiculo '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select * From DatosVehiculo'
      'Where DatosVehiculo.codigo_cte=:codigocte')
    ModifySQL.Strings = (
      'update DatosVehiculo'
      'set'
      '  NUMERO = :NUMERO,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  FECHA_APERTURA = :FECHA_APERTURA,'
      '  FECHA_VENCE_SEGURO = :FECHA_VENCE_SEGURO,'
      '  TIPO_AFILIADO = :TIPO_AFILIADO,'
      '  PLACA = :PLACA,'
      '  IDMARCA = :IDMARCA,'
      '  MODELO = :MODELO,'
      '  ANO_VEH = :ANO_VEH,'
      '  TIPO_SEGURO = :TIPO_SEGURO,'
      '  CIA_SEGURO = :CIA_SEGURO,'
      '  EMPRESA_LABORA = :EMPRESA_LABORA,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  CODIGO_DEALER = :CODIGO_DEALER,'
      '  CODIGO_AGENCIA = :CODIGO_AGENCIA,'
      '  COLOR = :COLOR,'
      '  NUM_CERTIFICADO = :NUM_CERTIFICADO,'
      '  CHASSIS = :CHASSIS,'
      '  NUMPOL = :NUMPOL,'
      '  STATUSCXC = :STATUSCXC,'
      '  POLIZA_ESPECIAL = :POLIZA_ESPECIAL,'
      '  RUTA_FILEAUTH = :RUTA_FILEAUTH,'
      '  NOTIFY_EMAIL = :NOTIFY_EMAIL,'
      '  CON_CARENCIA = :CON_CARENCIA'
      'where'
      '  NUMERO = :OLD_NUMERO')
    OnFilterRecord = tblDatosVehiculoFilterRecord
    Left = 40
    Top = 152
    object tblDatosVehiculoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DATOSVEHICULO.NUMERO'
      Required = True
    end
    object tblDatosVehiculoTIPO_AFILIADO: TSmallintField
      FieldName = 'TIPO_AFILIADO'
      Origin = 'DATOSVEHICULO.TIPO_AFILIADO'
      Required = True
    end
    object tblDatosVehiculoCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'DATOSVEHICULO.CODIGO_CTE'
      Required = True
    end
    object tblDatosVehiculoPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'DATOSVEHICULO.PLACA'
      Size = 12
    end
    object tblDatosVehiculoIDMARCA: TIntegerField
      FieldName = 'IDMARCA'
      Origin = 'DATOSVEHICULO.IDMARCA'
    end
    object tblDatosVehiculoMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'DATOSVEHICULO.MODELO'
    end
    object tblDatosVehiculoANO_VEH: TIntegerField
      FieldName = 'ANO_VEH'
      Origin = 'DATOSVEHICULO.ANO_VEH'
    end
    object tblDatosVehiculoFECHA_VENCE_SEGURO: TDateTimeField
      FieldName = 'FECHA_VENCE_SEGURO'
      Origin = 'DATOSVEHICULO.FECHA_VENCE_SEGURO'
    end
    object tblDatosVehiculoTIPO_SEGURO: TSmallintField
      FieldName = 'TIPO_SEGURO'
      Origin = 'DATOSVEHICULO.TIPO_SEGURO'
    end
    object tblDatosVehiculoCIA_SEGURO: TIBStringField
      FieldName = 'CIA_SEGURO'
      Origin = 'DATOSVEHICULO.CIA_SEGURO'
      Size = 50
    end
    object tblDatosVehiculoEMPRESA_LABORA: TIBStringField
      FieldName = 'EMPRESA_LABORA'
      Origin = 'DATOSVEHICULO.EMPRESA_LABORA'
      Size = 80
    end
    object tblDatosVehiculoFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DATOSVEHICULO.FECHA_IN'
    end
    object tblDatosVehiculoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DATOSVEHICULO.IN_POR'
      Size = 12
    end
    object tblDatosVehiculoCODIGO_DEALER: TIntegerField
      FieldName = 'CODIGO_DEALER'
      Origin = 'DATOSVEHICULO.CODIGO_DEALER'
    end
    object tblDatosVehiculoCODIGO_AGENCIA: TIntegerField
      FieldName = 'CODIGO_AGENCIA'
      Origin = 'DATOSVEHICULO.CODIGO_AGENCIA'
    end
    object tblDatosVehiculoCOLOR: TIBStringField
      FieldName = 'COLOR'
      Origin = 'DATOSVEHICULO.COLOR'
    end
    object tblDatosVehiculoNUM_CERTIFICADO: TIntegerField
      FieldName = 'NUM_CERTIFICADO'
      Origin = 'DATOSVEHICULO.NUM_CERTIFICADO'
    end
    object tblDatosVehiculoCHASSIS: TIBStringField
      FieldName = 'CHASSIS'
      Origin = 'DATOSVEHICULO.CHASSIS'
    end
    object tblDatosVehiculoNUMPOL: TIntegerField
      FieldName = 'NUMPOL'
      Origin = 'DATOSVEHICULO.NUMPOL'
    end
    object tblDatosVehiculoSTATUSCXC: TIBStringField
      FieldName = 'STATUSCXC'
      Origin = 'DATOSVEHICULO.STATUSCXC'
      FixedChar = True
      Size = 1
    end
    object tblDatosVehiculoPOLIZA_ESPECIAL: TSmallintField
      FieldName = 'POLIZA_ESPECIAL'
      Origin = 'DATOSVEHICULO.POLIZA_ESPECIAL'
    end
    object tblDatosVehiculoRUTA_FILEAUTH: TIBStringField
      FieldName = 'RUTA_FILEAUTH'
      Origin = 'DATOSVEHICULO.RUTA_FILEAUTH'
      Size = 200
    end
    object tblDatosVehiculoFECHA_APERTURA: TDateTimeField
      FieldName = 'FECHA_APERTURA'
      Origin = 'DATOSVEHICULO.FECHA_APERTURA'
    end
    object tblDatosVehiculoNOTIFY_EMAIL: TSmallintField
      FieldName = 'NOTIFY_EMAIL'
    end
    object tblDatosVehiculoCON_CARENCIA: TSmallintField
      FieldName = 'CON_CARENCIA'
      Origin = 'DATOSVEHICULO.CON_CARENCIA'
    end
  end
  object qryClientes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from clientes')
    Left = 530
    Top = 271
    object qryClientesCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryClientesCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'CLIENTES.CIA_KEY'
    end
    object qryClientesTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
    object qryClientesFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'CLIENTES.FOTO'
      Size = 8
    end
    object qryClientesNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryClientesNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object qryClientesMONEDA_FACT: TIBStringField
      FieldName = 'MONEDA_FACT'
      Origin = 'CLIENTES.MONEDA_FACT'
      FixedChar = True
      Size = 1
    end
    object qryClientesNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryClientesCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'CLIENTES.CONTACTO'
      Size = 30
    end
    object qryClientesDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryClientesTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryClientesFAX_CONTACTO: TIBStringField
      FieldName = 'FAX_CONTACTO'
      Origin = 'CLIENTES.FAX_CONTACTO'
      Size = 14
    end
    object qryClientesFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'CLIENTES.FORMA_PAGO'
    end
    object qryClientesCODIGO_AGENCIA: TSmallintField
      FieldName = 'CODIGO_AGENCIA'
      Origin = 'CLIENTES.CODIGO_AGENCIA'
    end
    object qryClientesSTATUS_CLIENTE: TIBStringField
      FieldName = 'STATUS_CLIENTE'
      Origin = 'CLIENTES.STATUS_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object qryClientesINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'CLIENTES.INSERTADO_POR'
      Size = 12
    end
    object qryClientesFECHA_INSERTADO: TDateTimeField
      FieldName = 'FECHA_INSERTADO'
      Origin = 'CLIENTES.FECHA_INSERTADO'
    end
    object qryClientesFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CLIENTES.FECHA_MOD'
    end
    object qryClientesMODI_POR: TIBStringField
      FieldName = 'MODI_POR'
      Origin = 'CLIENTES.MODI_POR'
      Size = 12
    end
    object qryClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object qryClientesEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object qryClientesWEBSITE: TIBStringField
      FieldName = 'WEBSITE'
      Origin = 'CLIENTES.WEBSITE'
      Size = 40
    end
    object qryClientesPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryClientesCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryClientesCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryClientesRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'CLIENTES.RNC'
      Size = 12
    end
    object qryClientesREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'CLIENTES.REFERENCIA'
      Size = 40
    end
    object qryClientesTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'CLIENTES.TELEF_REFERENCIA'
    end
    object qryClientesOTRO_TELEFONO: TIBStringField
      FieldName = 'OTRO_TELEFONO'
      Origin = 'CLIENTES.OTRO_TELEFONO'
    end
    object qryClientesCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'CLIENTES.CANT_DIAS_CREDITO'
    end
    object qryClientesTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'CLIENTES.TIPO_NCF'
      FixedChar = True
      Size = 2
    end
    object qryClientesOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = 'CLIENTES.OBSERVACION'
      BlobType = ftMemo
      Size = 8
    end
    object qryClientesLUGAR_DE_TRABAJO: TIBStringField
      FieldName = 'LUGAR_DE_TRABAJO'
      Origin = 'CLIENTES.LUGAR_DE_TRABAJO'
      Size = 40
    end
    object qryClientesAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'CLIENTES.APODO'
    end
    object qryClientesCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'CLIENTES.CODIGO_USUARIO'
    end
    object qryClientesRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryClientesCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'CLIENTES.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object qryClientesCONDICION: TIntegerField
      FieldName = 'CONDICION'
      Origin = 'CLIENTES.CONDICION'
    end
    object qryClientesPRECIO_ID: TIntegerField
      FieldName = 'PRECIO_ID'
      Origin = 'CLIENTES.PRECIO_ID'
    end
    object qryClientesTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Origin = 'CLIENTES.TIPO_CF'
      FixedChar = True
      Size = 2
    end
    object qryClientesMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'CLIENTES.MOVIL1'
    end
    object qryClientesMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'CLIENTES.MOVIL2'
    end
    object qryClientesCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'CLIENTES.CODIGO_TEXTO'
    end
    object qryClientesUSARLEVELPRECIO: TSmallintField
      FieldName = 'USARLEVELPRECIO'
      Origin = 'CLIENTES.USARLEVELPRECIO'
    end
    object qryClientesCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'CLIENTES.COD_VENDEDOR'
    end
    object qryClientesRUTA_FOTO: TIBStringField
      FieldName = 'RUTA_FOTO'
      Origin = 'CLIENTES.RUTA_FOTO'
      Size = 120
    end
    object qryClientesFECHA_NACIMIENTO: TDateTimeField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'CLIENTES.FECHA_NACIMIENTO'
    end
    object qryClientesCODZONA: TIntegerField
      FieldName = 'CODZONA'
      Origin = 'CLIENTES.CODZONA'
    end
    object qryClientesID_PROVINCIA: TIntegerField
      FieldName = 'ID_PROVINCIA'
      Origin = 'CLIENTES.ID_PROVINCIA'
    end
    object qryClientesID_MUNICIPIO: TIntegerField
      FieldName = 'ID_MUNICIPIO'
      Origin = 'CLIENTES.ID_MUNICIPIO'
    end
    object qryClientesRNC_CED_ACTIVO: TSmallintField
      FieldName = 'RNC_CED_ACTIVO'
      Origin = 'CLIENTES.RNC_CED_ACTIVO'
    end
  end
  object qryCteExp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      
        'CODIGO_CTE, RNC_NUMERO, NOMBRE_CTE, NOMBRE_FACTURAR, CONTACTO, D' +
        'IRECCION_CONT, TELEF_CONTACTO, FAX_CONTACTO, STATUS_CLIENTE, LIM' +
        'ITE_CREDITO, EMAIL, PAIS, CIUDAD, OTRO_TELEFONO, CANT_DIAS_CREDI' +
        'TO, OBSERVACION'
      'From clientes, SERVICIOS_MASTER'
      'where clientes.CODIGO_CTE = SERVICIOS_MASTER.CODIGO_CTE   ')
    Left = 513
    Top = 328
    object qryCteExpCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryCteExpRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryCteExpNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryCteExpNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryCteExpCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'CLIENTES.CONTACTO'
      Size = 30
    end
    object qryCteExpDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryCteExpTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryCteExpFAX_CONTACTO: TIBStringField
      FieldName = 'FAX_CONTACTO'
      Origin = 'CLIENTES.FAX_CONTACTO'
      Size = 14
    end
    object qryCteExpSTATUS_CLIENTE: TIBStringField
      FieldName = 'STATUS_CLIENTE'
      Origin = 'CLIENTES.STATUS_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object qryCteExpLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object qryCteExpEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object qryCteExpPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryCteExpCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryCteExpOTRO_TELEFONO: TIBStringField
      FieldName = 'OTRO_TELEFONO'
      Origin = 'CLIENTES.OTRO_TELEFONO'
    end
    object qryCteExpCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'CLIENTES.CANT_DIAS_CREDITO'
    end
    object qryCteExpOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = 'CLIENTES.OBSERVACION'
      BlobType = ftMemo
      Size = 8
    end
  end
  object tblRutaVta: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'RUTA_VTA'
    Left = 512
    Top = 96
    object tblRutaVtaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblRutaVtaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
    object tblRutaVtaFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object tblRutaVtaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object tblRutaVtaTIPO_COMISION: TIntegerField
      FieldName = 'TIPO_COMISION'
    end
    object tblRutaVtaMONTO_COMISION: TFloatField
      FieldName = 'MONTO_COMISION'
    end
  end
  object dstblRutaVta: TDataSource
    DataSet = tblRutaVta
    Left = 576
    Top = 24
  end
  object tblCiudades: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblCiudadesAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'STATUS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    StoreDefs = True
    TableName = 'CIUDAD'
    Left = 240
    Top = 24
    object tblCiudadesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblCiudadesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 35
    end
    object tblCiudadesVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object tblCiudadesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object dstblCiudades: TDataSource
    DataSet = tblCiudades
    Left = 232
    Top = 80
  end
  object tblSectores: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'COD_CIUDAD'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'SECTORES'
    Left = 112
    Top = 200
    object tblSectoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblSectoresDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object tblSectoresCOD_CIUDAD: TIntegerField
      FieldName = 'COD_CIUDAD'
    end
  end
  object dsTblSectores: TDataSource
    DataSet = tblSectores
    Left = 192
    Top = 208
  end
  object qryRuta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  * From RUTA_VTA')
    Left = 304
    Top = 392
    object qryRutaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'RUTA_VTA.CODIGO'
      Required = True
    end
    object qryRutaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'RUTA_VTA.DESCRIPCION'
      Required = True
      Size = 30
    end
    object qryRutaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'RUTA_VTA.FECHA'
    end
    object qryRutaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'RUTA_VTA.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRutaTIPO_COMISION: TIntegerField
      FieldName = 'TIPO_COMISION'
      Origin = 'RUTA_VTA.TIPO_COMISION'
    end
    object qryRutaMONTO_COMISION: TFloatField
      FieldName = 'MONTO_COMISION'
      Origin = 'RUTA_VTA.MONTO_COMISION'
    end
  end
  object qrySectores: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select c.descripcion ciudad, s.*  from SECTORES s'
      'left outer join ciudad c on c.codigo = s.cod_ciudad'
      'where s.cod_ciudad=:codciudad')
    Left = 504
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codciudad'
        ParamType = ptInput
      end>
  end
  object qryCteFacturas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From FACTURAS'
      'Where codigo_cte =:codCliente')
    Left = 192
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codCliente'
        ParamType = ptUnknown
      end>
    object qryCteFacturasSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'FACTURAS.SERIE'
      Required = True
    end
    object qryCteFacturasNUMERO: TFloatField
      FieldName = 'NUMERO'
      Origin = 'FACTURAS.NUMERO'
      Required = True
    end
    object qryCteFacturasCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'FACTURAS.CIA_KEY'
      Required = True
    end
    object qryCteFacturasMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'FACTURAS.MONEDA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryCteFacturasTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'FACTURAS.TIPO'
      Required = True
    end
    object qryCteFacturasCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'FACTURAS.CODIGO_CTE'
    end
    object qryCteFacturasFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FACTURAS.FECHA'
    end
    object qryCteFacturasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'FACTURAS.DESCRIPCION'
      Size = 40
    end
    object qryCteFacturasMONTO_FACT: TFloatField
      FieldName = 'MONTO_FACT'
      Origin = 'FACTURAS.MONTO_FACT'
    end
    object qryCteFacturasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FACTURAS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryCteFacturasFECHA_VENCE: TDateTimeField
      FieldName = 'FECHA_VENCE'
      Origin = 'FACTURAS.FECHA_VENCE'
    end
  end
  object qryRepCertificadoSam: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      'd.numero,'
      ''
      'd.CHASSIS, '
      'd.FECHA_APERTURA fechaInicial, d.FECHA_VENCE_SEGURO fechafin,  '
      'iif(m.DESCRIPCION ='#39#39',null,m.DESCRIPCION) marca,'
      'iif(a.DESCRIPCION='#39#39',null, a.DESCRIPCION) agencia, '
      'x.kilometraje, d.tipo_afiliado,'
      'Coalesce(a.DESCRIPCION, dealer.DESCRIPCION) CanalDistribucion,'
      'dealer.DESCRIPCION dealer,D.NUM_CERTIFICADO, D.CODIGO_DEALER, '
      
        'coalesce(d.NUMPOL,coalesce(x.NUMPOL,d.NUM_CERTIFICADO)) numpoliz' +
        'a_cert, '
      'iif(d.COLOR = '#39#39',null,d.COLOR) color, x.NOTIFY_EMAIL,'
      'iif(d.MODELO='#39#39',null,d.MODELO) modelo, '
      
        'iif(d.PLACA='#39#39',null,d.PLACA) placa, d.ANO_VEH, X.SERIALMOTOR, X.' +
        'VEHICULO CLASE,'
      'd.poliza_especial,'
      'r.*'
      'From clientes_view r'
      
        'left outer  join DATOSVEHICULO_VIEW d on d.CODIGO_CTE = r.CODIGO' +
        '_CTE'
      'left outer join  MARCA_VEHICULO m on m.IDMARCA = d.IDMARCA'
      
        'left outer join  agencia a on a.CODIGO_AGENCIA = d.CODIGO_AGENCI' +
        'A'
      
        'left outer join DEALEAR dealer on dealer.CODIGO_DEALER= d.CODIGO' +
        '_DEALER'
      
        'left outer join view_CLIENTES_POLIZASEXT x on x.CHASSIS = d.CHAS' +
        'SIS')
    OnFilterRecord = qryRepCertificadoSamFilterRecord
    Left = 424
    Top = 392
    object qryRepCertificadoSamCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryRepCertificadoSamCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'CLIENTES.CIA_KEY'
    end
    object qryRepCertificadoSamTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
    object qryRepCertificadoSamFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'CLIENTES.FOTO'
      Size = 8
    end
    object qryRepCertificadoSamNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryRepCertificadoSamNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object qryRepCertificadoSamMONEDA_FACT: TIBStringField
      FieldName = 'MONEDA_FACT'
      Origin = 'CLIENTES.MONEDA_FACT'
      FixedChar = True
      Size = 1
    end
    object qryRepCertificadoSamNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryRepCertificadoSamCOLOR: TIBStringField
      FieldName = 'COLOR'
      Origin = 'DATOSVEHICULO.COLOR'
    end
    object qryRepCertificadoSamMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'DATOSVEHICULO.MODELO'
    end
    object qryRepCertificadoSamPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'DATOSVEHICULO.PLACA'
      Size = 12
    end
    object qryRepCertificadoSamANO_VEH: TIntegerField
      FieldName = 'ANO_VEH'
      Origin = 'DATOSVEHICULO.ANO_VEH'
    end
    object qryRepCertificadoSamFECHAINICIAL: TDateTimeField
      FieldName = 'FECHAINICIAL'
      Origin = 'CLIENTES_POLIZASEXT.FECING'
      Required = True
    end
    object qryRepCertificadoSamFECHAFIN: TDateTimeField
      FieldName = 'FECHAFIN'
      Origin = 'CLIENTES_POLIZASEXT.FECFIN'
      Required = True
    end
    object qryRepCertificadoSamNUM_CERTIFICADO: TIntegerField
      FieldName = 'NUM_CERTIFICADO'
      Origin = 'DATOSVEHICULO.NUM_CERTIFICADO'
    end
    object qryRepCertificadoSamNUMPOLIZA_CERT: TIntegerField
      FieldName = 'NUMPOLIZA_CERT'
    end
    object qryRepCertificadoSamKILOMETRAJE: TIBStringField
      FieldName = 'KILOMETRAJE'
      Origin = 'CLIENTES_POLIZASEXT.KILOMETRAJE'
    end
    object qryRepCertificadoSamCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'CLIENTES.CONTACTO'
      Size = 30
    end
    object qryRepCertificadoSamDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryRepCertificadoSamTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryRepCertificadoSamFAX_CONTACTO: TIBStringField
      FieldName = 'FAX_CONTACTO'
      Origin = 'CLIENTES.FAX_CONTACTO'
      Size = 14
    end
    object qryRepCertificadoSamFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'CLIENTES.FORMA_PAGO'
    end
    object qryRepCertificadoSamCODIGO_AGENCIA: TSmallintField
      FieldName = 'CODIGO_AGENCIA'
      Origin = 'CLIENTES.CODIGO_AGENCIA'
    end
    object qryRepCertificadoSamSTATUS_CLIENTE: TIBStringField
      FieldName = 'STATUS_CLIENTE'
      Origin = 'CLIENTES.STATUS_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object qryRepCertificadoSamINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'CLIENTES.INSERTADO_POR'
      Size = 12
    end
    object qryRepCertificadoSamFECHA_INSERTADO: TDateTimeField
      FieldName = 'FECHA_INSERTADO'
      Origin = 'CLIENTES.FECHA_INSERTADO'
    end
    object qryRepCertificadoSamFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CLIENTES.FECHA_MOD'
    end
    object qryRepCertificadoSamMODI_POR: TIBStringField
      FieldName = 'MODI_POR'
      Origin = 'CLIENTES.MODI_POR'
      Size = 12
    end
    object qryRepCertificadoSamLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object qryRepCertificadoSamEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object qryRepCertificadoSamWEBSITE: TIBStringField
      FieldName = 'WEBSITE'
      Origin = 'CLIENTES.WEBSITE'
      Size = 40
    end
    object qryRepCertificadoSamPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryRepCertificadoSamCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryRepCertificadoSamCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryRepCertificadoSamRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'CLIENTES.RNC'
      Size = 12
    end
    object qryRepCertificadoSamREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'CLIENTES.REFERENCIA'
      Size = 40
    end
    object qryRepCertificadoSamTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'CLIENTES.TELEF_REFERENCIA'
    end
    object qryRepCertificadoSamOTRO_TELEFONO: TIBStringField
      FieldName = 'OTRO_TELEFONO'
      Origin = 'CLIENTES.OTRO_TELEFONO'
    end
    object qryRepCertificadoSamCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'CLIENTES.CANT_DIAS_CREDITO'
    end
    object qryRepCertificadoSamTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'CLIENTES.TIPO_NCF'
      FixedChar = True
      Size = 2
    end
    object qryRepCertificadoSamOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = 'CLIENTES.OBSERVACION'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepCertificadoSamLUGAR_DE_TRABAJO: TIBStringField
      FieldName = 'LUGAR_DE_TRABAJO'
      Origin = 'CLIENTES.LUGAR_DE_TRABAJO'
      Size = 40
    end
    object qryRepCertificadoSamAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'CLIENTES.APODO'
    end
    object qryRepCertificadoSamCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'CLIENTES.CODIGO_USUARIO'
    end
    object qryRepCertificadoSamRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryRepCertificadoSamCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'CLIENTES.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepCertificadoSamCONDICION: TIntegerField
      FieldName = 'CONDICION'
      Origin = 'CLIENTES.CONDICION'
    end
    object qryRepCertificadoSamPRECIO_ID: TIntegerField
      FieldName = 'PRECIO_ID'
      Origin = 'CLIENTES.PRECIO_ID'
    end
    object qryRepCertificadoSamRUTA_FOTO: TIBStringField
      FieldName = 'RUTA_FOTO'
      Origin = 'CLIENTES.RUTA_FOTO'
      Size = 120
    end
    object qryRepCertificadoSamTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Origin = 'CLIENTES.TIPO_CF'
      FixedChar = True
      Size = 2
    end
    object qryRepCertificadoSamMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'CLIENTES.MOVIL1'
    end
    object qryRepCertificadoSamMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'CLIENTES.MOVIL2'
    end
    object qryRepCertificadoSamCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'CLIENTES.CODIGO_TEXTO'
    end
    object qryRepCertificadoSamUSARLEVELPRECIO: TSmallintField
      FieldName = 'USARLEVELPRECIO'
      Origin = 'CLIENTES.USARLEVELPRECIO'
    end
    object qryRepCertificadoSamCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'CLIENTES.COD_VENDEDOR'
    end
    object qryRepCertificadoSamFECHA_NACIMIENTO: TDateTimeField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'CLIENTES.FECHA_NACIMIENTO'
    end
    object qryRepCertificadoSamCODZONA: TIntegerField
      FieldName = 'CODZONA'
      Origin = 'CLIENTES.CODZONA'
    end
    object qryRepCertificadoSamRUTA: TIntegerField
      FieldName = 'RUTA'
      Origin = 'CLIENTES.RUTA'
    end
    object qryRepCertificadoSamCOD_CIUDAD: TIntegerField
      FieldName = 'COD_CIUDAD'
      Origin = 'CLIENTES.COD_CIUDAD'
    end
    object qryRepCertificadoSamDIA_RUTA: TIBStringField
      FieldName = 'DIA_RUTA'
      Origin = 'CLIENTES.DIA_RUTA'
    end
    object qryRepCertificadoSamCALLE: TIBStringField
      FieldName = 'CALLE'
      Origin = 'CLIENTES.CALLE'
      Size = 60
    end
    object qryRepCertificadoSamMANZANA: TIBStringField
      FieldName = 'MANZANA'
      Origin = 'CLIENTES.MANZANA'
    end
    object qryRepCertificadoSamEDIFICIO: TIBStringField
      FieldName = 'EDIFICIO'
      Origin = 'CLIENTES.EDIFICIO'
      Size = 40
    end
    object qryRepCertificadoSamNSS: TIBStringField
      FieldName = 'NSS'
      Origin = 'CLIENTES.NSS'
      FixedChar = True
      Size = 15
    end
    object qryRepCertificadoSamCHASSIS: TIBStringField
      FieldName = 'CHASSIS'
      Origin = 'DATOSVEHICULO.CHASSIS'
    end
    object qryRepCertificadoSamMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'MARCA_VEHICULO.DESCRIPCION'
    end
    object qryRepCertificadoSamAGENCIA: TIBStringField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA.DESCRIPCION'
      Size = 80
    end
    object qryRepCertificadoSamDEALER: TIBStringField
      FieldName = 'DEALER'
      Origin = 'DEALEAR.DESCRIPCION'
      Size = 80
    end
    object qryRepCertificadoSamCODIGO_DEALER: TIntegerField
      FieldName = 'CODIGO_DEALER'
      Origin = 'DATOSVEHICULO.CODIGO_DEALER'
    end
    object qryRepCertificadoSamSERIALMOTOR: TIBStringField
      FieldName = 'SERIALMOTOR'
      Origin = 'CLIENTES_POLIZASEXT.SERIALMOTOR'
      Size = 25
    end
    object qryRepCertificadoSamCLASE: TIBStringField
      FieldName = 'CLASE'
      Origin = 'CLIENTES_POLIZASEXT.VEHICULO'
      Size = 60
    end
    object qryRepCertificadoSamPOLIZA_ESPECIAL: TSmallintField
      FieldName = 'POLIZA_ESPECIAL'
      Origin = 'DATOSVEHICULO.POLIZA_ESPECIAL'
    end
    object qryRepCertificadoSamCANALDISTRIBUCION: TIBStringField
      FieldName = 'CANALDISTRIBUCION'
      Size = 80
    end
    object qryRepCertificadoSamNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DATOSVEHICULO.NUMERO'
    end
    object qryRepCertificadoSamTIPO_AFILIADO: TSmallintField
      FieldName = 'TIPO_AFILIADO'
      Origin = 'DATOSVEHICULO.TIPO_AFILIADO'
    end
    object qryRepCertificadoSamNOTIFY_EMAIL: TSmallintField
      FieldName = 'NOTIFY_EMAIL'
      Origin = 'CLIENTES_POLIZASEXT.NOTIFY_EMAIL'
    end
  end
  object qryDearler: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from DEALEAR')
    Left = 592
    Top = 96
  end
  object qryAgencia: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from AGENCIA')
    Left = 600
    Top = 168
  end
  object qryRepCumpleanioCte: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select CODIGO_Cte codigo, FECHA_NACIMIENTO,  Coalesce(NOMBRE_FAC' +
        'TURAR,NOMBRE_CTE) NombreCliente'
      ', DIRECCION_CONT,'
      'EMAIL,TELEF_CONTACTO'
      'From CLIENTES '
      'Where F_Month(Fecha_Nacimiento)  between :mesini And :mesfin'
      'and Fecha_Nacimiento  is not null'
      'ORDER BY Fecha_Nacimiento ')
    Left = 336
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'mesini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'mesfin'
        ParamType = ptInput
      end>
    object qryRepCumpleanioCteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryRepCumpleanioCteFECHA_NACIMIENTO: TDateTimeField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'CLIENTES.FECHA_NACIMIENTO'
    end
    object qryRepCumpleanioCteNOMBRECLIENTE: TIBStringField
      FieldName = 'NOMBRECLIENTE'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryRepCumpleanioCteDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryRepCumpleanioCteEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object qryRepCumpleanioCteTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
  end
  object qryTipoAfiliado: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TIPO_AFILIADO')
    Left = 56
    Top = 368
    object qryTipoAfiliadoIDTIPO: TIntegerField
      FieldName = 'IDTIPO'
      Origin = 'TIPO_AFILIADO.IDTIPO'
      Required = True
    end
    object qryTipoAfiliadoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_AFILIADO.DESCRIPCION'
      Size = 80
    end
    object qryTipoAfiliadoMONTOCOBERTURA: TFloatField
      FieldName = 'MONTOCOBERTURA'
      Origin = 'TIPO_AFILIADO.MONTOCOBERTURA'
    end
    object qryTipoAfiliadoDIASDECARENCIA: TIntegerField
      FieldName = 'DIASDECARENCIA'
      Origin = 'TIPO_AFILIADO.DIASDECARENCIA'
    end
    object qryTipoAfiliadoYEARANTIGUEDAD: TIntegerField
      FieldName = 'YEARANTIGUEDAD'
      Origin = 'TIPO_AFILIADO.YEARANTIGUEDAD'
    end
    object qryTipoAfiliadoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TIPO_AFILIADO.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dsqryTipoAfiliado: TDataSource
    DataSet = qryTipoAfiliado
    Left = 120
    Top = 368
  end
  object qryPlanesWisPro: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From PLANWISPRO')
    Left = 592
    Top = 288
    object qryPlanesWisProID: TIBStringField
      FieldName = 'ID'
      Origin = 'PLANWISPRO.ID'
      Required = True
      Size = 80
    end
    object qryPlanesWisProDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PLANWISPRO.DESCRIPCION'
      Size = 60
    end
  end
  object dsqryPlanesWisPro: TDataSource
    DataSet = qryPlanesWisPro
    Left = 595
    Top = 337
  end
  object stpProcInsertClientWP: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'Proc_InsertClientWisPro'
    Left = 424
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'ID'
        ParamType = ptInput
        Size = 80
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE'
        ParamType = ptInput
      end>
  end
  object tblContractWisPro: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CONTRACTWISPRO'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    InsertSQL.Strings = (
      'insert into CONTRACTWISPRO'
      
        '  (CODIGO_CTE, ID, PUBLICID, PLANID, CLIENTID, SERVERCONFIGURATI' +
        'ONID, STATE, '
      
        '   IP, NETMASK, MACADDRESS, LATITUDE, LONGITUDE, COVERAGEID, DET' +
        'AILS, CREATEDAT, '
      '   UPDATEDAT)'
      'values'
      
        '  (:CODIGO_CTE, :ID, :PUBLICID, :PLANID, :CLIENTID, :SERVERCONFI' +
        'GURATIONID, '
      
        '   :STATE, :IP, :NETMASK, :MACADDRESS, :LATITUDE, :LONGITUDE, :C' +
        'OVERAGEID, '
      '   :DETAILS, :CREATEDAT, :UPDATEDAT)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_CTE,'
      '  ID,'
      '  PUBLICID,'
      '  PLANID,'
      '  CLIENTID,'
      '  SERVERCONFIGURATIONID,'
      '  STATE,'
      '  IP,'
      '  NETMASK,'
      '  MACADDRESS,'
      '  LATITUDE,'
      '  LONGITUDE,'
      '  COVERAGEID,'
      '  DETAILS,'
      '  CREATEDAT,'
      '  UPDATEDAT'
      'from CONTRACTWISPRO '
      'where'
      '  CODIGO_CTE = :CODIGO_CTE')
    SelectSQL.Strings = (
      'Select r.*, c.NOMBRE_FACTURAR NombreCliente  '
      'from CONTRACTWISPRO r'
      'left outer join CLIENTWISPRO w on w.ID = r.CLIENTID'
      'left outer join CLIENTES c on c.CODIGO_CTE = w.CODIGO_CTE')
    ModifySQL.Strings = (
      'update CONTRACTWISPRO'
      'set'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  ID = :ID,'
      '  PUBLICID = :PUBLICID,'
      '  PLANID = :PLANID,'
      '  CLIENTID = :CLIENTID,'
      '  SERVERCONFIGURATIONID = :SERVERCONFIGURATIONID,'
      '  STATE = :STATE,'
      '  IP = :IP,'
      '  NETMASK = :NETMASK,'
      '  MACADDRESS = :MACADDRESS,'
      '  LATITUDE = :LATITUDE,'
      '  LONGITUDE = :LONGITUDE,'
      '  COVERAGEID = :COVERAGEID,'
      '  DETAILS = :DETAILS,'
      '  CREATEDAT = :CREATEDAT,'
      '  UPDATEDAT = :UPDATEDAT'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    Left = 656
    Top = 224
    object tblContractWisProID: TIBStringField
      FieldName = 'ID'
      Origin = 'CONTRACTWISPRO.ID'
      Size = 50
    end
    object tblContractWisProPUBLICID: TIBStringField
      FieldName = 'PUBLICID'
      Origin = 'CONTRACTWISPRO.PUBLICID'
      Size = 50
    end
    object tblContractWisProPLANID: TIBStringField
      FieldName = 'PLANID'
      Origin = 'CONTRACTWISPRO.PLANID'
      Size = 50
    end
    object tblContractWisProCLIENTID: TIBStringField
      FieldName = 'CLIENTID'
      Origin = 'CONTRACTWISPRO.CLIENTID'
      Size = 50
    end
    object tblContractWisProSERVERCONFIGURATIONID: TIBStringField
      FieldName = 'SERVERCONFIGURATIONID'
      Origin = 'CONTRACTWISPRO.SERVERCONFIGURATIONID'
      Required = True
      Size = 50
    end
    object tblContractWisProSTATE: TIBStringField
      FieldName = 'STATE'
      Origin = 'CONTRACTWISPRO.STATE'
      Size = 50
    end
    object tblContractWisProIP: TIBStringField
      FieldName = 'IP'
      Origin = 'CONTRACTWISPRO.IP'
      Size = 50
    end
    object tblContractWisProNETMASK: TIBStringField
      FieldName = 'NETMASK'
      Origin = 'CONTRACTWISPRO.NETMASK'
      Size = 50
    end
    object tblContractWisProMACADDRESS: TIBStringField
      FieldName = 'MACADDRESS'
      Origin = 'CONTRACTWISPRO.MACADDRESS'
      Required = True
      Size = 50
    end
    object tblContractWisProLATITUDE: TFloatField
      FieldName = 'LATITUDE'
      Origin = 'CONTRACTWISPRO.LATITUDE'
    end
    object tblContractWisProLONGITUDE: TFloatField
      FieldName = 'LONGITUDE'
      Origin = 'CONTRACTWISPRO.LONGITUDE'
    end
    object tblContractWisProCOVERAGEID: TIBStringField
      FieldName = 'COVERAGEID'
      Origin = 'CONTRACTWISPRO.COVERAGEID'
      Size = 50
    end
    object tblContractWisProCREATEDAT: TDateTimeField
      FieldName = 'CREATEDAT'
      Origin = 'CONTRACTWISPRO.CREATEDAT'
    end
    object tblContractWisProUPDATEDAT: TDateTimeField
      FieldName = 'UPDATEDAT'
      Origin = 'CONTRACTWISPRO.UPDATEDAT'
    end
    object tblContractWisProNOMBRECLIENTE: TIBStringField
      FieldName = 'NOMBRECLIENTE'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object tblContractWisProCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CONTRACTWISPRO.CODIGO_CTE'
      Required = True
    end
    object tblContractWisProDETAILS: TIBStringField
      FieldName = 'DETAILS'
      Origin = 'CONTRACTWISPRO.DETAILS'
      Size = 50
    end
  end
  object tblClientwisPro: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CLIENTWISPRO'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    InsertSQL.Strings = (
      'insert into CLIENTWISPRO'
      '  (CODIGO_CTE, ID)'
      'values'
      '  (:CODIGO_CTE, :ID)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_CTE,'
      '  ID'
      'from CLIENTWISPRO '
      'where'
      '  CODIGO_CTE = :CODIGO_CTE')
    SelectSQL.Strings = (
      'Select r.*, c.NOMBRE_FACTURAR NombreCliente  '
      'from CLIENTWISPRO r'
      'inner join CLIENTES c on c.CODIGO_CTE = r.CODIGO_CTE')
    ModifySQL.Strings = (
      'update CLIENTWISPRO'
      'set'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  ID = :ID'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    Left = 704
    Top = 344
    object tblClientwisProCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTWISPRO.CODIGO_CTE'
      Required = True
    end
    object tblClientwisProID: TIBStringField
      FieldName = 'ID'
      Origin = 'CLIENTWISPRO.ID'
      Size = 80
    end
    object tblClientwisProNOMBRECLIENTE: TIBStringField
      FieldName = 'NOMBRECLIENTE'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
  end
  object qryClientWisPro: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select r.*, c.nombre_facturar nombrecliente from CLIENTWISPRO r'
      'inner join clientes c on c.codigo_cte = r.codigo_cte'
      'where r.id is not null')
    Left = 696
    Top = 288
    object qryClientWisProCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTWISPRO.CODIGO_CTE'
      Required = True
    end
    object qryClientWisProID: TIBStringField
      FieldName = 'ID'
      Origin = 'CLIENTWISPRO.ID'
      Size = 80
    end
    object qryClientWisProNOMBRECLIENTE: TIBStringField
      FieldName = 'NOMBRECLIENTE'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
  end
  object ibsqlDupCliente: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      
        'INSERT INTO CLIENTES (CODIGO_CTE, CIA_KEY, TIPO_CLIENTE, FOTO, N' +
        'OMBRE_CTE, NOMBRE_ABREV, MONEDA_FACT, NOMBRE_FACTURAR, '
      
        'CONTACTO, DIRECCION_CONT, TELEF_CONTACTO, FAX_CONTACTO, FORMA_PA' +
        'GO, CODIGO_AGENCIA, STATUS_CLIENTE, INSERTADO_POR, '
      
        'FECHA_INSERTADO, FECHA_MOD, MODI_POR, LIMITE_CREDITO, EMAIL, WEB' +
        'SITE, PAIS, CIUDAD, CEDULA, RNC, '
      
        'REFERENCIA, TELEF_REFERENCIA, OTRO_TELEFONO, CANT_DIAS_CREDITO, ' +
        'TIPO_NCF, OBSERVACION, LUGAR_DE_TRABAJO, '
      
        'APODO, CODIGO_USUARIO, RNC_NUMERO, COMENTARIO, CONDICION, PRECIO' +
        '_ID, TIPO_CF, MOVIL1, MOVIL2, CODIGO_TEXTO, '
      
        'USARLEVELPRECIO, COD_VENDEDOR, FECHA_NACIMIENTO, CODZONA, RUTA_F' +
        'OTO, COD_CIUDAD, RUTA, DIA_RUTA, '
      'CALLE, MANZANA, EDIFICIO, NSS, PLAN_ID)'
      'select '
      
        'gen_id(GEN_CODIGO_CTE,1),CIA_KEY, TIPO_CLIENTE, FOTO, NOMBRE_CTE' +
        ', NOMBRE_ABREV, MONEDA_FACT, NOMBRE_FACTURAR, CONTACTO, '
      
        'DIRECCION_CONT, TELEF_CONTACTO, FAX_CONTACTO, FORMA_PAGO, CODIGO' +
        '_AGENCIA, '#39'A'#39', INSERTADO_POR, FECHA_INSERTADO, FECHA_MOD, '
      
        'MODI_POR, 0, EMAIL, WEBSITE, PAIS, CIUDAD, null, null, REFERENCI' +
        'A, TELEF_REFERENCIA, OTRO_TELEFONO, '
      
        'CANT_DIAS_CREDITO, TIPO_NCF, OBSERVACION, LUGAR_DE_TRABAJO, APOD' +
        'O, CODIGO_USUARIO, '#39#39', COMENTARIO, CONDICION, PRECIO_ID, '
      
        'TIPO_CF, MOVIL1, MOVIL2, CODIGO_TEXTO, USARLEVELPRECIO, COD_VEND' +
        'EDOR, FECHA_NACIMIENTO, '
      
        'CODZONA, null, COD_CIUDAD, RUTA, DIA_RUTA, CALLE, MANZANA, EDIFI' +
        'CIO, NSS, PLAN_ID'
      'from clientes where codigo_Cte =:codigocte')
    Transaction = dmConectar.IBTransaction1
    Left = 680
    Top = 136
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
    Left = 712
    Top = 400
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
  object dstblClientesDelivery: TDataSource
    DataSet = tblClientesDelivery
    Left = 603
    Top = 393
  end
  object tblGarantiaMovil: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DATOS_GMOVIL'
      'where'
      '  SERIE_ID = :OLD_SERIE_ID')
    InsertSQL.Strings = (
      'insert into DATOS_GMOVIL'
      
        '  (SERIE_ID, TIPO_AFILIACION, FECHA, CODIGO_CLIENTE, CODIGO_DEAL' +
        'ER, GARANTIANUM, '
      
        '   NOMBRES, APELLIDOS, CEDULA_PASSPORT, EMAIL, TELEFONO, MOVIL, ' +
        'DIRECCION, '
      
        '   PAIS, PROVINCIA, MARCA, MODELO, NO_SERIEEMAI, FECHADEVENTA, P' +
        'RECIOVENTA, '
      
        '   DESCRIPCIONDELPRODUCTO, TIEMPOGVENDEDOR, FECHAINICIO, FECHAVE' +
        'NCE, VALORDELARTICULO, '
      
        '   MONTOAPAGARPORMES, MONTOTOTALAPAGAR, POLIZA_ESPECIAL, STATUSC' +
        'XC, STATUS, '
      '   FECHA_IN, IN_POR, FECHA_UPD, UPD_POR)'
      'values'
      
        '  (:SERIE_ID, :TIPO_AFILIACION, :FECHA, :CODIGO_CLIENTE, :CODIGO' +
        '_DEALER, '
      
        '   :GARANTIANUM, :NOMBRES, :APELLIDOS, :CEDULA_PASSPORT, :EMAIL,' +
        ' :TELEFONO, '
      
        '   :MOVIL, :DIRECCION, :PAIS, :PROVINCIA, :MARCA, :MODELO, :NO_S' +
        'ERIEEMAI, '
      
        '   :FECHADEVENTA, :PRECIOVENTA, :DESCRIPCIONDELPRODUCTO, :TIEMPO' +
        'GVENDEDOR, '
      
        '   :FECHAINICIO, :FECHAVENCE, :VALORDELARTICULO, :MONTOAPAGARPOR' +
        'MES, :MONTOTOTALAPAGAR, '
      
        '   :POLIZA_ESPECIAL, :STATUSCXC, :STATUS, :FECHA_IN, :IN_POR, :F' +
        'ECHA_UPD, '
      '   :UPD_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE_ID,'
      '  TIPO_AFILIACION,'
      '  FECHA,'
      '  CODIGO_CLIENTE,'
      '  CODIGO_DEALER,'
      '  GARANTIANUM,'
      '  NOMBRES,'
      '  APELLIDOS,'
      '  CEDULA_PASSPORT,'
      '  EMAIL,'
      '  TELEFONO,'
      '  MOVIL,'
      '  DIRECCION,'
      '  PAIS,'
      '  PROVINCIA,'
      '  MARCA,'
      '  MODELO,'
      '  NO_SERIEEMAI,'
      '  FECHADEVENTA,'
      '  PRECIOVENTA,'
      '  DESCRIPCIONDELPRODUCTO,'
      '  TIEMPOGVENDEDOR,'
      '  FECHAINICIO,'
      '  FECHAVENCE,'
      '  VALORDELARTICULO,'
      '  MONTOAPAGARPORMES,'
      '  MONTOTOTALAPAGAR,'
      '  POLIZA_ESPECIAL,'
      '  STATUSCXC,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_UPD,'
      '  UPD_POR'
      'from DATOS_GMOVIL '
      'where'
      '  SERIE_ID = :SERIE_ID')
    SelectSQL.Strings = (
      'select DATOS_GMOVIL.*, x.NOTIFY_EMAIL from DATOS_GMOVIL'
      
        'left outer join CLIENTES_GMOVILEXT x on x.GARANTIANUM = DATOS_GM' +
        'OVIL.GARANTIANUM'
      'WHERE DATOS_GMOVIL.codigo_cliente=:codigocliente')
    ModifySQL.Strings = (
      'update DATOS_GMOVIL'
      'set'
      '  SERIE_ID = :SERIE_ID,'
      '  TIPO_AFILIACION = :TIPO_AFILIACION,'
      '  FECHA = :FECHA,'
      '  CODIGO_CLIENTE = :CODIGO_CLIENTE,'
      '  CODIGO_DEALER = :CODIGO_DEALER,'
      '  GARANTIANUM = :GARANTIANUM,'
      '  NOMBRES = :NOMBRES,'
      '  APELLIDOS = :APELLIDOS,'
      '  CEDULA_PASSPORT = :CEDULA_PASSPORT,'
      '  EMAIL = :EMAIL,'
      '  TELEFONO = :TELEFONO,'
      '  MOVIL = :MOVIL,'
      '  DIRECCION = :DIRECCION,'
      '  PAIS = :PAIS,'
      '  PROVINCIA = :PROVINCIA,'
      '  MARCA = :MARCA,'
      '  MODELO = :MODELO,'
      '  NO_SERIEEMAI = :NO_SERIEEMAI,'
      '  FECHADEVENTA = :FECHADEVENTA,'
      '  PRECIOVENTA = :PRECIOVENTA,'
      '  DESCRIPCIONDELPRODUCTO = :DESCRIPCIONDELPRODUCTO,'
      '  TIEMPOGVENDEDOR = :TIEMPOGVENDEDOR,'
      '  FECHAINICIO = :FECHAINICIO,'
      '  FECHAVENCE = :FECHAVENCE,'
      '  VALORDELARTICULO = :VALORDELARTICULO,'
      '  MONTOAPAGARPORMES = :MONTOAPAGARPORMES,'
      '  MONTOTOTALAPAGAR = :MONTOTOTALAPAGAR,'
      '  POLIZA_ESPECIAL = :POLIZA_ESPECIAL,'
      '  STATUSCXC = :STATUSCXC,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_UPD = :FECHA_UPD,'
      '  UPD_POR = :UPD_POR'
      'where'
      '  SERIE_ID = :OLD_SERIE_ID')
    Left = 728
    Top = 192
    object tblGarantiaMovilSERIE_ID: TIntegerField
      DisplayWidth = 12
      FieldName = 'SERIE_ID'
      Origin = 'DATOS_GMOVIL.SERIE_ID'
      Required = True
    end
    object tblGarantiaMovilTIPO_AFILIACION: TIntegerField
      DisplayWidth = 18
      FieldName = 'TIPO_AFILIACION'
      Origin = 'DATOS_GMOVIL.TIPO_AFILIACION'
      Required = True
    end
    object tblGarantiaMovilFECHA: TDateTimeField
      DisplayWidth = 14
      FieldName = 'FECHA'
      Origin = 'DATOS_GMOVIL.FECHA'
    end
    object tblGarantiaMovilCODIGO_CLIENTE: TIntegerField
      DisplayWidth = 19
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'DATOS_GMOVIL.CODIGO_CLIENTE'
    end
    object tblGarantiaMovilCODIGO_DEALER: TIntegerField
      DisplayWidth = 18
      FieldName = 'CODIGO_DEALER'
      Origin = 'DATOS_GMOVIL.CODIGO_DEALER'
    end
    object tblGarantiaMovilGARANTIANUM: TIBStringField
      DisplayWidth = 20
      FieldName = 'GARANTIANUM'
      Origin = 'DATOS_GMOVIL.GARANTIANUM'
    end
    object tblGarantiaMovilNO_SERIEEMAI: TIBStringField
      DisplayWidth = 24
      FieldName = 'NO_SERIEEMAI'
      Origin = 'DATOS_GMOVIL.NO_SERIEEMAI'
      Required = True
    end
    object tblGarantiaMovilNOMBRES: TIBStringField
      DisplayWidth = 20
      FieldName = 'NOMBRES'
      Origin = 'DATOS_GMOVIL.NOMBRES'
      Size = 40
    end
    object tblGarantiaMovilAPELLIDOS: TIBStringField
      DisplayWidth = 20
      FieldName = 'APELLIDOS'
      Origin = 'DATOS_GMOVIL.APELLIDOS'
      Size = 40
    end
    object tblGarantiaMovilCEDULA_PASSPORT: TIBStringField
      DisplayWidth = 24
      FieldName = 'CEDULA_PASSPORT'
      Origin = 'DATOS_GMOVIL.CEDULA_PASSPORT'
    end
    object tblGarantiaMovilEMAIL: TIBStringField
      DisplayWidth = 48
      FieldName = 'EMAIL'
      Origin = 'DATOS_GMOVIL.EMAIL'
      Size = 40
    end
    object tblGarantiaMovilTELEFONO: TIBStringField
      DisplayWidth = 24
      FieldName = 'TELEFONO'
      Origin = 'DATOS_GMOVIL.TELEFONO'
    end
    object tblGarantiaMovilMOVIL: TIBStringField
      DisplayWidth = 24
      FieldName = 'MOVIL'
      Origin = 'DATOS_GMOVIL.MOVIL'
    end
    object tblGarantiaMovilDIRECCION: TIBStringField
      DisplayWidth = 72
      FieldName = 'DIRECCION'
      Origin = 'DATOS_GMOVIL.DIRECCION'
      Size = 60
    end
    object tblGarantiaMovilPAIS: TIBStringField
      DisplayWidth = 36
      FieldName = 'PAIS'
      Origin = 'DATOS_GMOVIL.PAIS'
      Size = 30
    end
    object tblGarantiaMovilPROVINCIA: TIBStringField
      DisplayWidth = 36
      FieldName = 'PROVINCIA'
      Origin = 'DATOS_GMOVIL.PROVINCIA'
      Size = 30
    end
    object tblGarantiaMovilMARCA: TIBStringField
      DisplayWidth = 24
      FieldName = 'MARCA'
      Origin = 'DATOS_GMOVIL.MARCA'
    end
    object tblGarantiaMovilMODELO: TIBStringField
      DisplayWidth = 24
      FieldName = 'MODELO'
      Origin = 'DATOS_GMOVIL.MODELO'
    end
    object tblGarantiaMovilFECHADEVENTA: TDateTimeField
      DisplayWidth = 22
      FieldName = 'FECHADEVENTA'
      Origin = 'DATOS_GMOVIL.FECHADEVENTA'
    end
    object tblGarantiaMovilPRECIOVENTA: TFloatField
      DisplayWidth = 15
      FieldName = 'PRECIOVENTA'
      Origin = 'DATOS_GMOVIL.PRECIOVENTA'
    end
    object tblGarantiaMovilDESCRIPCIONDELPRODUCTO: TMemoField
      DisplayWidth = 31
      FieldName = 'DESCRIPCIONDELPRODUCTO'
      Origin = 'DATOS_GMOVIL.DESCRIPCIONDELPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object tblGarantiaMovilTIEMPOGVENDEDOR: TIntegerField
      DisplayWidth = 22
      FieldName = 'TIEMPOGVENDEDOR'
      Origin = 'DATOS_GMOVIL.TIEMPOGVENDEDOR'
    end
    object tblGarantiaMovilFECHAINICIO: TDateTimeField
      DisplayWidth = 22
      FieldName = 'FECHAINICIO'
      Origin = 'DATOS_GMOVIL.FECHAINICIO'
    end
    object tblGarantiaMovilFECHAVENCE: TDateTimeField
      DisplayWidth = 22
      FieldName = 'FECHAVENCE'
      Origin = 'DATOS_GMOVIL.FECHAVENCE'
    end
    object tblGarantiaMovilVALORDELARTICULO: TFloatField
      DisplayWidth = 22
      FieldName = 'VALORDELARTICULO'
      Origin = 'DATOS_GMOVIL.VALORDELARTICULO'
    end
    object tblGarantiaMovilMONTOAPAGARPORMES: TFloatField
      DisplayWidth = 26
      FieldName = 'MONTOAPAGARPORMES'
      Origin = 'DATOS_GMOVIL.MONTOAPAGARPORMES'
    end
    object tblGarantiaMovilMONTOTOTALAPAGAR: TFloatField
      DisplayWidth = 24
      FieldName = 'MONTOTOTALAPAGAR'
      Origin = 'DATOS_GMOVIL.MONTOTOTALAPAGAR'
    end
    object tblGarantiaMovilPOLIZA_ESPECIAL: TSmallintField
      FieldName = 'POLIZA_ESPECIAL'
      Origin = 'DATOS_GMOVIL.POLIZA_ESPECIAL'
    end
    object tblGarantiaMovilSTATUSCXC: TIBStringField
      FieldName = 'STATUSCXC'
      Origin = 'DATOS_GMOVIL.STATUSCXC'
      FixedChar = True
      Size = 1
    end
    object tblGarantiaMovilSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DATOS_GMOVIL.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblGarantiaMovilNOTIFY_EMAIL: TSmallintField
      FieldName = 'NOTIFY_EMAIL'
      Origin = 'CLIENTES_GMOVILEXT.NOTIFY_EMAIL'
    end
  end
  object qryProc_DatosRepHistRenovPol: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from Proc_DatosRepHistRenovPol(:codigoctei,:codigoctef)'
      
        'order by codigo_cte, chassis, estado,numero, FECHA_VENCE_SEGURO ' +
        'desc')
    Left = 664
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigoctei'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigoctef'
        ParamType = ptUnknown
      end>
  end
  object qryProcDatosRepHistRenoGarantia: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select r.* from PROC_DATOSREPHISTRENOVPOLG(:codigoctei,:codigoct' +
        'ef) r'
      
        'order by r.CODIGO_CLIENTE, r.NO_SERIEEMAI, r.ESTADO, r.ID, r.FEC' +
        'HAVENCE desc')
    Left = 704
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoctei'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigoctef'
        ParamType = ptInput
      end>
  end
  object qryRepCertificadoSamG: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select r.*,D.NO_SERIEEMAI, d.TIPO_AFILIACION,'
      'D.CODIGO_DEALER, d.Poliza_Especial,'
      'dealer.DESCRIPCION CanalDistribucion,'
      'd.DESCRIPCIONDELPRODUCTO,d.TIEMPOGVENDEDOR,'
      
        'd.MONTOAPAGARPORMES, d.MONTOTOTALAPAGAR, d.FECHADEVENTA,d.PRECIO' +
        'VENTA,d.VALORDELARTICULO'
      
        ',coalesce(d.MOVIL,coalesce(d.TELEFONO, r.MOVIL1)) TElefonoGarant' +
        'ia,'
      'coalesce(d.GARANTIANUM,coalesce(x.GARANTIANUM,'#39#39')) GARANTIANUM,'
      'd.MODELO, d.MARCA, x.NOTIFY_EMAIL,'
      
        'x.FECHAINICIO fechaInicial, coalesce(d.FECHAVENCE, x.FECHAVENCE)' +
        ' fechafin  '
      'From  DATOS_GMOVIL d '
      'left outer  join clientes r on d.CODIGO_CLIENTE = r.CODIGO_CTE'
      
        'left outer join DEALEAR dealer on dealer.CODIGO_DEALER= d.CODIGO' +
        '_DEALER'
      
        'left outer join CLIENTES_GMOVILEXT x on x.NO_SERIEEMAI = d.NO_SE' +
        'RIEEMAI')
    OnFilterRecord = qryRepCertificadoSamGFilterRecord
    Left = 800
    Top = 136
    object qryRepCertificadoSamGCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryRepCertificadoSamGCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'CLIENTES.CIA_KEY'
    end
    object qryRepCertificadoSamGTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
    object qryRepCertificadoSamGFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'CLIENTES.FOTO'
      Size = 8
    end
    object qryRepCertificadoSamGNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryRepCertificadoSamGNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object qryRepCertificadoSamGMONEDA_FACT: TIBStringField
      FieldName = 'MONEDA_FACT'
      Origin = 'CLIENTES.MONEDA_FACT'
      FixedChar = True
      Size = 1
    end
    object qryRepCertificadoSamGFECHAINICIAL: TDateTimeField
      FieldName = 'FECHAINICIAL'
      Origin = 'CLIENTES_GMOVILEXT.FECHAINICIO'
    end
    object qryRepCertificadoSamGFECHAFIN: TDateTimeField
      FieldName = 'FECHAFIN'
    end
    object qryRepCertificadoSamGNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryRepCertificadoSamGGARANTIANUM: TIBStringField
      FieldName = 'GARANTIANUM'
    end
    object qryRepCertificadoSamGMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'DATOS_GMOVIL.MODELO'
    end
    object qryRepCertificadoSamGMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'DATOS_GMOVIL.MARCA'
    end
    object qryRepCertificadoSamGCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'CLIENTES.CONTACTO'
      Size = 30
    end
    object qryRepCertificadoSamGDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryRepCertificadoSamGTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryRepCertificadoSamGFAX_CONTACTO: TIBStringField
      FieldName = 'FAX_CONTACTO'
      Origin = 'CLIENTES.FAX_CONTACTO'
      Size = 14
    end
    object qryRepCertificadoSamGFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'CLIENTES.FORMA_PAGO'
    end
    object qryRepCertificadoSamGCODIGO_AGENCIA: TSmallintField
      FieldName = 'CODIGO_AGENCIA'
      Origin = 'CLIENTES.CODIGO_AGENCIA'
    end
    object qryRepCertificadoSamGSTATUS_CLIENTE: TIBStringField
      FieldName = 'STATUS_CLIENTE'
      Origin = 'CLIENTES.STATUS_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object qryRepCertificadoSamGINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'CLIENTES.INSERTADO_POR'
      Size = 12
    end
    object qryRepCertificadoSamGFECHA_INSERTADO: TDateTimeField
      FieldName = 'FECHA_INSERTADO'
      Origin = 'CLIENTES.FECHA_INSERTADO'
    end
    object qryRepCertificadoSamGFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CLIENTES.FECHA_MOD'
    end
    object qryRepCertificadoSamGMODI_POR: TIBStringField
      FieldName = 'MODI_POR'
      Origin = 'CLIENTES.MODI_POR'
      Size = 12
    end
    object qryRepCertificadoSamGLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object qryRepCertificadoSamGEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object qryRepCertificadoSamGWEBSITE: TIBStringField
      FieldName = 'WEBSITE'
      Origin = 'CLIENTES.WEBSITE'
      Size = 40
    end
    object qryRepCertificadoSamGPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryRepCertificadoSamGCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryRepCertificadoSamGCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryRepCertificadoSamGRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'CLIENTES.RNC'
      Size = 12
    end
    object qryRepCertificadoSamGREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'CLIENTES.REFERENCIA'
      Size = 40
    end
    object qryRepCertificadoSamGTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'CLIENTES.TELEF_REFERENCIA'
    end
    object qryRepCertificadoSamGOTRO_TELEFONO: TIBStringField
      FieldName = 'OTRO_TELEFONO'
      Origin = 'CLIENTES.OTRO_TELEFONO'
    end
    object qryRepCertificadoSamGCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'CLIENTES.CANT_DIAS_CREDITO'
    end
    object qryRepCertificadoSamGTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'CLIENTES.TIPO_NCF'
      FixedChar = True
      Size = 2
    end
    object qryRepCertificadoSamGOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = 'CLIENTES.OBSERVACION'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepCertificadoSamGLUGAR_DE_TRABAJO: TIBStringField
      FieldName = 'LUGAR_DE_TRABAJO'
      Origin = 'CLIENTES.LUGAR_DE_TRABAJO'
      Size = 40
    end
    object qryRepCertificadoSamGAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'CLIENTES.APODO'
    end
    object qryRepCertificadoSamGCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'CLIENTES.CODIGO_USUARIO'
    end
    object qryRepCertificadoSamGRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryRepCertificadoSamGCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'CLIENTES.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepCertificadoSamGCONDICION: TIntegerField
      FieldName = 'CONDICION'
      Origin = 'CLIENTES.CONDICION'
    end
    object qryRepCertificadoSamGPRECIO_ID: TIntegerField
      FieldName = 'PRECIO_ID'
      Origin = 'CLIENTES.PRECIO_ID'
    end
    object qryRepCertificadoSamGRUTA_FOTO: TIBStringField
      FieldName = 'RUTA_FOTO'
      Origin = 'CLIENTES.RUTA_FOTO'
      Size = 120
    end
    object qryRepCertificadoSamGTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Origin = 'CLIENTES.TIPO_CF'
      FixedChar = True
      Size = 2
    end
    object qryRepCertificadoSamGMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'CLIENTES.MOVIL1'
    end
    object qryRepCertificadoSamGMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'CLIENTES.MOVIL2'
    end
    object qryRepCertificadoSamGCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'CLIENTES.CODIGO_TEXTO'
    end
    object qryRepCertificadoSamGUSARLEVELPRECIO: TSmallintField
      FieldName = 'USARLEVELPRECIO'
      Origin = 'CLIENTES.USARLEVELPRECIO'
    end
    object qryRepCertificadoSamGCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'CLIENTES.COD_VENDEDOR'
    end
    object qryRepCertificadoSamGFECHA_NACIMIENTO: TDateTimeField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'CLIENTES.FECHA_NACIMIENTO'
    end
    object qryRepCertificadoSamGCODZONA: TIntegerField
      FieldName = 'CODZONA'
      Origin = 'CLIENTES.CODZONA'
    end
    object qryRepCertificadoSamGRUTA: TIntegerField
      FieldName = 'RUTA'
      Origin = 'CLIENTES.RUTA'
    end
    object qryRepCertificadoSamGCOD_CIUDAD: TIntegerField
      FieldName = 'COD_CIUDAD'
      Origin = 'CLIENTES.COD_CIUDAD'
    end
    object qryRepCertificadoSamGDIA_RUTA: TIBStringField
      FieldName = 'DIA_RUTA'
      Origin = 'CLIENTES.DIA_RUTA'
    end
    object qryRepCertificadoSamGCALLE: TIBStringField
      FieldName = 'CALLE'
      Origin = 'CLIENTES.CALLE'
      Size = 60
    end
    object qryRepCertificadoSamGMANZANA: TIBStringField
      FieldName = 'MANZANA'
      Origin = 'CLIENTES.MANZANA'
    end
    object qryRepCertificadoSamGEDIFICIO: TIBStringField
      FieldName = 'EDIFICIO'
      Origin = 'CLIENTES.EDIFICIO'
      Size = 40
    end
    object qryRepCertificadoSamGNSS: TIBStringField
      FieldName = 'NSS'
      Origin = 'CLIENTES.NSS'
      FixedChar = True
      Size = 15
    end
    object qryRepCertificadoSamGPLAN_ID: TIBStringField
      FieldName = 'PLAN_ID'
      Origin = 'CLIENTES.PLAN_ID'
      Size = 80
    end
    object qryRepCertificadoSamGEMAIL_TEMP: TIBStringField
      FieldName = 'EMAIL_TEMP'
      Origin = 'CLIENTES.EMAIL_TEMP'
      Size = 80
    end
    object qryRepCertificadoSamGCODIGO_CTE_RECL: TIntegerField
      FieldName = 'CODIGO_CTE_RECL'
      Origin = 'CLIENTES.CODIGO_CTE_RECL'
    end
    object qryRepCertificadoSamGNO_SERIEEMAI: TIBStringField
      FieldName = 'NO_SERIEEMAI'
      Origin = 'DATOS_GMOVIL.NO_SERIEEMAI'
    end
    object qryRepCertificadoSamGCODIGO_DEALER: TIntegerField
      FieldName = 'CODIGO_DEALER'
      Origin = 'DATOS_GMOVIL.CODIGO_DEALER'
    end
    object qryRepCertificadoSamGPOLIZA_ESPECIAL: TSmallintField
      FieldName = 'POLIZA_ESPECIAL'
      Origin = 'DATOS_GMOVIL.POLIZA_ESPECIAL'
    end
    object qryRepCertificadoSamGCANALDISTRIBUCION: TIBStringField
      FieldName = 'CANALDISTRIBUCION'
      Origin = 'DEALEAR.DESCRIPCION'
      Size = 80
    end
    object qryRepCertificadoSamGDESCRIPCIONDELPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONDELPRODUCTO'
      Origin = 'DATOS_GMOVIL.DESCRIPCIONDELPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepCertificadoSamGMONTOAPAGARPORMES: TFloatField
      FieldName = 'MONTOAPAGARPORMES'
      Origin = 'DATOS_GMOVIL.MONTOAPAGARPORMES'
    end
    object qryRepCertificadoSamGMONTOTOTALAPAGAR: TFloatField
      FieldName = 'MONTOTOTALAPAGAR'
      Origin = 'DATOS_GMOVIL.MONTOTOTALAPAGAR'
    end
    object qryRepCertificadoSamGFECHADEVENTA: TDateTimeField
      FieldName = 'FECHADEVENTA'
      Origin = 'DATOS_GMOVIL.FECHADEVENTA'
    end
    object qryRepCertificadoSamGPRECIOVENTA: TFloatField
      FieldName = 'PRECIOVENTA'
      Origin = 'DATOS_GMOVIL.PRECIOVENTA'
    end
    object qryRepCertificadoSamGVALORDELARTICULO: TFloatField
      FieldName = 'VALORDELARTICULO'
      Origin = 'DATOS_GMOVIL.VALORDELARTICULO'
    end
    object qryRepCertificadoSamGTIEMPOGVENDEDOR: TIntegerField
      FieldName = 'TIEMPOGVENDEDOR'
      Origin = 'DATOS_GMOVIL.TIEMPOGVENDEDOR'
    end
    object qryRepCertificadoSamGTELEFONOGARANTIA: TIBStringField
      FieldName = 'TELEFONOGARANTIA'
    end
    object qryRepCertificadoSamGTIPO_AFILIACION: TIntegerField
      FieldName = 'TIPO_AFILIACION'
      Origin = 'DATOS_GMOVIL.TIPO_AFILIACION'
      Required = True
    end
    object qryRepCertificadoSamGNOTIFY_EMAIL: TSmallintField
      FieldName = 'NOTIFY_EMAIL'
      Origin = 'CLIENTES_GMOVILEXT.NOTIFY_EMAIL'
    end
  end
  object qryRepVehiculos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   '
      '  H.NUM_SERIE NUM_TRNVTA,'
      '  M.FECHA_ASIGNADO FECHA_VENTA,'
      '  INVENTARIO_PRODUCTO.DESCRIPCION DESCRIPCION_PRODUCTO,'
      '  VEHICULO.PLACA,'
      ' VEHICULO.REGISTRO,'
      '  VEHICULO.MARCA,'
      '  VEHICULO.MODELO,'
      '  VEHICULO.chassis,'
      '  VEHICULO.FECHA_INICIO,'
      '  DATOSVEHICULO.CODIGO_CTE,'
      '  C.NOMBRE_FACTURAR NOMBRECLIENTE,'
      '  TRANS_MOTORES_DET.SERIE,'
      '  TRANS_MOTORES_DET.NUMERO,'
      '  TRANS_MOTORES_DET.FICHA,'
      '  TRANS_MOTORES_DET.DESCRIPCION,'
      '  TRANS_MOTORES_DET.CODIGO_USUARIO,'
      '  TRANS_MOTORES_DET.STATUS,'
      '  INVENTARIO_PRODUCTO.PRECIO_COMPRA COSTO,'
      '  H.MONTO_INICIAL MONTO_VENTA'
      '  '
      'FROM VEHICULO'
      
        '  LEFT OUTER JOIN TRANS_MOTORES_DET ON (TRANS_MOTORES_DET.FICHA ' +
        '= VEHICULO.FICHA)'
      
        '  LEFT OUTER JOIN DATOSVEHICULO ON DATOSVEHICULO.CHASSIS = VEHIC' +
        'ULO.CHASSIS'
      
        '  LEFT OUTER JOIN INVENTARIO_PRODUCTO ON INVENTARIO_PRODUCTO.COD' +
        'IGO = VEHICULO.CODIGO_PROD'
      
        '  LEFT OUTER JOIN CLIENTES C ON C.CODIGO_CTE = DATOSVEHICULO.COD' +
        'IGO_CTE'
      
        '  LEFT OUTER JOIN DATOSVENTAVEHICULO H ON H.CHASSIS = DATOSVEHIC' +
        'ULO.CHASSIS'
      
        '  LEFT OUTER JOIN MOTORES M ON M.CHASIS = H.CHASSIS AND M.FECHA_' +
        'ASIGNADO IS NOT NULL')
    OnFilterRecord = qryRepVehiculosFilterRecord
    Left = 360
    Top = 384
    object qryRepVehiculosNUM_TRNVTA: TIntegerField
      FieldName = 'NUM_TRNVTA'
      Origin = 'DATOSVENTAVEHICULO.NUM_SERIE'
    end
    object qryRepVehiculosFECHA_VENTA: TDateTimeField
      FieldName = 'FECHA_VENTA'
      Origin = 'MOTORES.FECHA_ASIGNADO'
    end
    object qryRepVehiculosDESCRIPCION_PRODUCTO: TIBStringField
      FieldName = 'DESCRIPCION_PRODUCTO'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryRepVehiculosPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'VEHICULO.PLACA'
    end
    object qryRepVehiculosMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'VEHICULO.MARCA'
    end
    object qryRepVehiculosMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'VEHICULO.MODELO'
    end
    object qryRepVehiculosCHASSIS: TIBStringField
      FieldName = 'CHASSIS'
      Origin = 'VEHICULO.CHASSIS'
    end
    object qryRepVehiculosFECHA_INICIO: TDateTimeField
      FieldName = 'FECHA_INICIO'
      Origin = 'VEHICULO.FECHA_INICIO'
    end
    object qryRepVehiculosCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'DATOSVEHICULO.CODIGO_CTE'
    end
    object qryRepVehiculosNOMBRECLIENTE: TIBStringField
      FieldName = 'NOMBRECLIENTE'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryRepVehiculosSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'TRANS_MOTORES_DET.SERIE'
    end
    object qryRepVehiculosNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TRANS_MOTORES_DET.NUMERO'
    end
    object qryRepVehiculosFICHA: TIntegerField
      FieldName = 'FICHA'
      Origin = 'TRANS_MOTORES_DET.FICHA'
    end
    object qryRepVehiculosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TRANS_MOTORES_DET.DESCRIPCION'
      Size = 30
    end
    object qryRepVehiculosCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'TRANS_MOTORES_DET.CODIGO_USUARIO'
    end
    object qryRepVehiculosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRANS_MOTORES_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepVehiculosCOSTO: TFloatField
      FieldName = 'COSTO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryRepVehiculosMONTO_VENTA: TFloatField
      FieldName = 'MONTO_VENTA'
      Origin = 'DATOSVENTAVEHICULO.MONTO_INICIAL'
    end
    object qryRepVehiculosREGISTRO: TIBStringField
      FieldName = 'REGISTRO'
      Origin = 'VEHICULO.REGISTRO'
    end
  end
  object qryCheckNumpolExiste: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select coalesce(NUM_CERTIFICADO,NUMPOL) numpol'
      ' from DAToSVEHICULO '
      ' where coalesce(NUM_CERTIFICADO,NUMPOL) =:numero')
    Left = 792
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
  end
  object ibsqlDatosVehEliminado: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'select count(*) Cant  from DATOSVEHICULO_HIST'
      'where codigo_cte=:codigocte')
    Transaction = dmConectar.IBTransaction1
    Left = 128
    Top = 240
  end
  object qryNumPolDup: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'with datos as'
      '('
      
        '    select r.numero, coalesce(r.NUMPOL,r.NUM_CERTIFICADO) cant f' +
        'rom DATOSVEHICULO r'
      ') '
      'select numero,count(cant) cant from datos'
      'group by numero'
      'having count(cant) > 1')
    Left = 24
    Top = 16
    object qryNumPolDupNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DATOSVEHICULO.NUMERO'
      Required = True
    end
    object qryNumPolDupCANT: TIntegerField
      FieldName = 'CANT'
      Required = True
    end
  end
  object tblClientes: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterOpen = tblClientesAfterOpen
    AfterScroll = tblClientesAfterScroll
    BeforePost = tblClientesBeforePost
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
      
        '   COD_CIUDAD, RUTA, DIA_RUTA, CALLE, MANZANA, EDIFICIO, NSS, PL' +
        'AN_ID, '
      
        '   CODIGO_CTE_RECL, PORC_BENEFICIO, ID_PROVINCIA, ID_MUNICIPIO, ' +
        'RNC_CED_ACTIVO, '
      '   SHOWPRECIOCONITBIS)'
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
      
        '   :FECHA_NACIMIENTO, :CODZONA, :COD_CIUDAD, :RUTA, :DIA_RUTA, :' +
        'CALLE, '
      
        '   :MANZANA, :EDIFICIO, :NSS, :PLAN_ID, :CODIGO_CTE_RECL, :PORC_' +
        'BENEFICIO, '
      
        '   :ID_PROVINCIA, :ID_MUNICIPIO, :RNC_CED_ACTIVO, :SHOWPRECIOCON' +
        'ITBIS)')
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
      '  COD_CIUDAD,'
      '  RUTA,'
      '  DIA_RUTA,'
      '  CALLE,'
      '  MANZANA,'
      '  EDIFICIO,'
      '  NSS,'
      '  PLAN_ID,'
      '  CODIGO_CTE_RECL,'
      '  PORC_BENEFICIO,'
      '  EMAIL_TEMP,'
      '  ID_PROVINCIA,'
      '  ID_MUNICIPIO,'
      '  RNC_CED_ACTIVO,'
      '  RUTDA,'
      '  SHOWPRECIOCONITBIS'
      'from CLIENTES '
      'where'
      '  CODIGO_CTE = :CODIGO_CTE')
    SelectSQL.Strings = (
      'Select *'
      'from CLIENTES'
      'order by CODIGO_CTE')
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
      '  COD_CIUDAD = :COD_CIUDAD,'
      '  RUTA = :RUTA,'
      '  DIA_RUTA = :DIA_RUTA,'
      '  CALLE = :CALLE,'
      '  MANZANA = :MANZANA,'
      '  EDIFICIO = :EDIFICIO,'
      '  NSS = :NSS,'
      '  PLAN_ID = :PLAN_ID,'
      '  CODIGO_CTE_RECL = :CODIGO_CTE_RECL,'
      '  PORC_BENEFICIO = :PORC_BENEFICIO,'
      '  ID_PROVINCIA = :ID_PROVINCIA,'
      '  ID_MUNICIPIO = :ID_MUNICIPIO,'
      '  RNC_CED_ACTIVO = :RNC_CED_ACTIVO,'
      '  SHOWPRECIOCONITBIS = :SHOWPRECIOCONITBIS'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    GeneratorField.Field = 'CODIGO_CTE'
    GeneratorField.Generator = 'GEN_CODIGO_CTE'
    GeneratorField.ApplyEvent = gamOnPost
    OnFilterRecord = tblClientesFilterRecord
    Left = 160
    Top = 72
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
    object tblClientesCOD_CIUDAD: TIntegerField
      FieldName = 'COD_CIUDAD'
      Origin = 'CLIENTES.COD_CIUDAD'
    end
    object tblClientesRUTA: TIntegerField
      FieldName = 'RUTA'
      Origin = 'CLIENTES.RUTA'
    end
    object tblClientesDIA_RUTA: TIBStringField
      FieldName = 'DIA_RUTA'
      Origin = 'CLIENTES.DIA_RUTA'
    end
    object tblClientesCALLE: TIBStringField
      FieldName = 'CALLE'
      Origin = 'CLIENTES.CALLE'
      Size = 60
    end
    object tblClientesMANZANA: TIBStringField
      FieldName = 'MANZANA'
      Origin = 'CLIENTES.MANZANA'
    end
    object tblClientesEDIFICIO: TIBStringField
      FieldName = 'EDIFICIO'
      Origin = 'CLIENTES.EDIFICIO'
      Size = 40
    end
    object tblClientesNSS: TIBStringField
      FieldName = 'NSS'
      Origin = 'CLIENTES.NSS'
      FixedChar = True
      Size = 15
    end
    object tblClientesPLAN_ID: TIBStringField
      FieldName = 'PLAN_ID'
      Origin = 'CLIENTES.PLAN_ID'
      Size = 80
    end
    object tblClientesCODIGO_CTE_RECL: TIntegerField
      FieldName = 'CODIGO_CTE_RECL'
      Origin = 'CLIENTES.CODIGO_CTE_RECL'
    end
    object tblClientesPORC_BENEFICIO: TFloatField
      FieldName = 'PORC_BENEFICIO'
      Origin = 'CLIENTES.PORC_BENEFICIO'
    end
    object tblClientesEMAIL_TEMP: TIBStringField
      FieldName = 'EMAIL_TEMP'
      Origin = 'CLIENTES.EMAIL_TEMP'
      Size = 80
    end
    object tblClientesID_PROVINCIA: TIntegerField
      FieldName = 'ID_PROVINCIA'
      Origin = 'CLIENTES.ID_PROVINCIA'
    end
    object tblClientesID_MUNICIPIO: TIntegerField
      FieldName = 'ID_MUNICIPIO'
      Origin = 'CLIENTES.ID_MUNICIPIO'
    end
    object tblClientesSHOWPRECIOCONITBIS: TSmallintField
      FieldName = 'SHOWPRECIOCONITBIS'
      Origin = 'CLIENTES.SHOWPRECIOCONITBIS'
    end
  end
  object tblClienteTerritorio: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
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
      '  COD_CIUDAD,'
      '  RUTA,'
      '  DIA_RUTA,'
      '  CALLE,'
      '  MANZANA,'
      '  EDIFICIO,'
      '  NSS,'
      '  PLAN_ID,'
      '  CODIGO_CTE_RECL,'
      '  PORC_BENEFICIO,'
      '  EMAIL_TEMP,'
      '  ID_PROVINCIA,'
      '  ID_MUNICIPIO'
      'from CLIENTES '
      'where'
      '  CODIGO_CTE = :CODIGO_CTE')
    SelectSQL.Strings = (
      'select i.codigo_cte, i.NOMBRE_FACTURAR,'
      'e.NOMBRE provincia,ee.NOMBRE municipio,'
      'i.ID_MUNICIPIO, i.ID_PROVINCIA'
      'from CLIENTES i'
      'left join ECF_TERRITORIO e on e.CODIGO = i.ID_PROVINCIA'
      'left  join ECF_TERRITORIO ee on ee.CODIGO = i.ID_municipio'
      'where i.CODIGO_CTE =:codcliente')
    ModifySQL.Strings = (
      'update CLIENTES'
      'set'
      '  ID_MUNICIPIO = :ID_MUNICIPIO,'
      '  ID_PROVINCIA = :ID_PROVINCIA'
      'where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    Left = 232
    Top = 152
    object tblClienteTerritorioCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object tblClienteTerritorioNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object tblClienteTerritorioPROVINCIA: TIBStringField
      FieldName = 'PROVINCIA'
      Origin = 'ECF_TERRITORIO.NOMBRE'
      Size = 60
    end
    object tblClienteTerritorioMUNICIPIO: TIBStringField
      FieldName = 'MUNICIPIO'
      Origin = 'ECF_TERRITORIO.NOMBRE'
      Size = 60
    end
    object tblClienteTerritorioID_MUNICIPIO: TIntegerField
      FieldName = 'ID_MUNICIPIO'
      Origin = 'CLIENTES.ID_MUNICIPIO'
    end
    object tblClienteTerritorioID_PROVINCIA: TIntegerField
      FieldName = 'ID_PROVINCIA'
      Origin = 'CLIENTES.ID_PROVINCIA'
    end
  end
end
