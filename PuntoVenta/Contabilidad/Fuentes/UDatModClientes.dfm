object dmClientes: TdmClientes
  OldCreateOrder = False
  Left = 376
  Top = 122
  Height = 336
  Width = 503
  object tblClientes: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CLIENTES'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into CLIENTES'
      
        '  (CODIGO, TIPO_CLIENTE, FOTO, NOMBRE, APELLIDO, NOMBRE_EMPRESA,' +
        ' CEDULA, '
      
        '   PASAPORTE, FECHA_VENCE_PASAPORTE, RNC, LICENCIA, FECHA_VENCE_' +
        'LICENCIA, '
      
        '   TELEFONO_LOCAL, TELEF_CONTACTO, REFERENCIA, TELEF_REFERENCIA,' +
        ' OTRO_TELEFONO, '
      
        '   FAX_CONTACTO, CONDICION, LIMITE_CREDITO, EMAIL, WEBSITE, PAIS' +
        ', ESTADO, '
      
        '   CIUDAD, DIRECCION_REAL, DIRECCION_LOCAL, STATUS_CLIENTE, INSE' +
        'RTADO_POR, '
      
        '   FECHA_INSERTADO, FECHA_MOD, MODI_POR, CANT_DIAS_CREDITO, TIPO' +
        '_NCF, OBSERVACION, '
      '   LUGAR_DE_TRABAJO, FECHA_NACIMIENTO, RUTA_FOTO)'
      'values'
      
        '  (:CODIGO, :TIPO_CLIENTE, :FOTO, :NOMBRE, :APELLIDO, :NOMBRE_EM' +
        'PRESA, '
      
        '   :CEDULA, :PASAPORTE, :FECHA_VENCE_PASAPORTE, :RNC, :LICENCIA,' +
        ' :FECHA_VENCE_LICENCIA, '
      
        '   :TELEFONO_LOCAL, :TELEF_CONTACTO, :REFERENCIA, :TELEF_REFEREN' +
        'CIA, :OTRO_TELEFONO, '
      
        '   :FAX_CONTACTO, :CONDICION, :LIMITE_CREDITO, :EMAIL, :WEBSITE,' +
        ' :PAIS, '
      
        '   :ESTADO, :CIUDAD, :DIRECCION_REAL, :DIRECCION_LOCAL, :STATUS_' +
        'CLIENTE, '
      
        '   :INSERTADO_POR, :FECHA_INSERTADO, :FECHA_MOD, :MODI_POR, :CAN' +
        'T_DIAS_CREDITO, '
      
        '   :TIPO_NCF, :OBSERVACION, :LUGAR_DE_TRABAJO, :FECHA_NACIMIENTO' +
        ', :RUTA_FOTO)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  TIPO_CLIENTE,'
      '  FOTO,'
      '  NOMBRE,'
      '  APELLIDO,'
      '  NOMBRE_EMPRESA,'
      '  CEDULA,'
      '  PASAPORTE,'
      '  FECHA_VENCE_PASAPORTE,'
      '  RNC,'
      '  LICENCIA,'
      '  FECHA_VENCE_LICENCIA,'
      '  TELEFONO_LOCAL,'
      '  TELEF_CONTACTO,'
      '  REFERENCIA,'
      '  TELEF_REFERENCIA,'
      '  OTRO_TELEFONO,'
      '  FAX_CONTACTO,'
      '  CONDICION,'
      '  LIMITE_CREDITO,'
      '  EMAIL,'
      '  WEBSITE,'
      '  PAIS,'
      '  ESTADO,'
      '  CIUDAD,'
      '  DIRECCION_REAL,'
      '  DIRECCION_LOCAL,'
      '  STATUS_CLIENTE,'
      '  INSERTADO_POR,'
      '  FECHA_INSERTADO,'
      '  FECHA_MOD,'
      '  MODI_POR,'
      '  CANT_DIAS_CREDITO,'
      '  TIPO_NCF,'
      '  OBSERVACION,'
      '  LUGAR_DE_TRABAJO,'
      '  FECHA_NACIMIENTO,'
      '  RUTA_FOTO'
      'from CLIENTES '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'select * from CLIENTES'
      'ORDER BY codigo,TIPO_CLIENTE')
    ModifySQL.Strings = (
      'update CLIENTES'
      'set'
      '  CODIGO = :CODIGO,'
      '  TIPO_CLIENTE = :TIPO_CLIENTE,'
      '  FOTO = :FOTO,'
      '  NOMBRE = :NOMBRE,'
      '  APELLIDO = :APELLIDO,'
      '  NOMBRE_EMPRESA = :NOMBRE_EMPRESA,'
      '  CEDULA = :CEDULA,'
      '  PASAPORTE = :PASAPORTE,'
      '  FECHA_VENCE_PASAPORTE = :FECHA_VENCE_PASAPORTE,'
      '  RNC = :RNC,'
      '  LICENCIA = :LICENCIA,'
      '  FECHA_VENCE_LICENCIA = :FECHA_VENCE_LICENCIA,'
      '  TELEFONO_LOCAL = :TELEFONO_LOCAL,'
      '  TELEF_CONTACTO = :TELEF_CONTACTO,'
      '  REFERENCIA = :REFERENCIA,'
      '  TELEF_REFERENCIA = :TELEF_REFERENCIA,'
      '  OTRO_TELEFONO = :OTRO_TELEFONO,'
      '  FAX_CONTACTO = :FAX_CONTACTO,'
      '  CONDICION = :CONDICION,'
      '  LIMITE_CREDITO = :LIMITE_CREDITO,'
      '  EMAIL = :EMAIL,'
      '  WEBSITE = :WEBSITE,'
      '  PAIS = :PAIS,'
      '  ESTADO = :ESTADO,'
      '  CIUDAD = :CIUDAD,'
      '  DIRECCION_REAL = :DIRECCION_REAL,'
      '  DIRECCION_LOCAL = :DIRECCION_LOCAL,'
      '  STATUS_CLIENTE = :STATUS_CLIENTE,'
      '  INSERTADO_POR = :INSERTADO_POR,'
      '  FECHA_INSERTADO = :FECHA_INSERTADO,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MODI_POR = :MODI_POR,'
      '  CANT_DIAS_CREDITO = :CANT_DIAS_CREDITO,'
      '  TIPO_NCF = :TIPO_NCF,'
      '  OBSERVACION = :OBSERVACION,'
      '  LUGAR_DE_TRABAJO = :LUGAR_DE_TRABAJO,'
      '  FECHA_NACIMIENTO = :FECHA_NACIMIENTO,'
      '  RUTA_FOTO = :RUTA_FOTO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_CODIGO_CTE'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 56
    Top = 16
    object tblClientesCODIGO: TIntegerField
      DisplayWidth = 10
      FieldName = 'CODIGO'
      Origin = 'CLIENTES.CODIGO'
      Required = True
    end
    object tblClientesTIPO_CLIENTE: TSmallintField
      DisplayWidth = 15
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
      Required = True
    end
    object tblClientesFOTO: TBlobField
      DisplayWidth = 12
      FieldName = 'FOTO'
      Origin = 'CLIENTES.FOTO'
      Size = 8
    end
    object tblClientesNOMBRE: TIBStringField
      DisplayWidth = 72
      FieldName = 'NOMBRE'
      Origin = 'CLIENTES.NOMBRE'
      Size = 60
    end
    object tblClientesAPELLIDO: TIBStringField
      DisplayWidth = 72
      FieldName = 'APELLIDO'
      Origin = 'CLIENTES.APELLIDO'
      Size = 60
    end
    object tblClientesNOMBRE_EMPRESA: TIBStringField
      DisplayWidth = 48
      FieldName = 'NOMBRE_EMPRESA'
      Origin = 'CLIENTES.NOMBRE_EMPRESA'
      Size = 40
    end
    object tblClientesCEDULA: TIBStringField
      DisplayWidth = 18
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      EditMask = '000-0000000-0;0;_'
      FixedChar = True
      Size = 15
    end
    object tblClientesRNC: TIBStringField
      DisplayWidth = 15
      FieldName = 'RNC'
      Origin = 'CLIENTES.RNC'
      EditMask = '0-00-00000-0;0;_'
      Size = 12
    end
    object tblClientesLICENCIA: TIBStringField
      FieldName = 'LICENCIA'
      Origin = 'CLIENTES.LICENCIA'
      EditMask = '000-0000000-0;0;_'
      Size = 30
    end
    object tblClientesFECHA_VENCE_LICENCIA: TDateTimeField
      DisplayWidth = 26
      FieldName = 'FECHA_VENCE_LICENCIA'
      Origin = 'CLIENTES.FECHA_VENCE_LICENCIA'
    end
    object tblClientesPASAPORTE: TIBStringField
      FieldName = 'PASAPORTE'
      Origin = 'CLIENTES.PASAPORTE'
      Size = 30
    end
    object tblClientesREFERENCIA: TIBStringField
      DisplayWidth = 48
      FieldName = 'REFERENCIA'
      Origin = 'CLIENTES.REFERENCIA'
      Size = 40
    end
    object tblClientesFECHA_VENCE_PASAPORTE: TDateTimeField
      DisplayWidth = 30
      FieldName = 'FECHA_VENCE_PASAPORTE'
      Origin = 'CLIENTES.FECHA_VENCE_PASAPORTE'
    end
    object tblClientesCONDICION: TSmallintField
      DisplayWidth = 12
      FieldName = 'CONDICION'
      Origin = 'CLIENTES.CONDICION'
      Required = True
    end
    object tblClientesCANT_DIAS_CREDITO: TSmallintField
      DisplayLabel = 'C. Dias de Cr'#233'dito'
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'CLIENTES.CANT_DIAS_CREDITO'
    end
    object tblClientesLIMITE_CREDITO: TFloatField
      DisplayWidth = 18
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object tblClientesEMAIL: TIBStringField
      DisplayWidth = 48
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object tblClientesWEBSITE: TIBStringField
      DisplayWidth = 48
      FieldName = 'WEBSITE'
      Origin = 'CLIENTES.WEBSITE'
      Size = 40
    end
    object tblClientesPAIS: TIBStringField
      DisplayWidth = 36
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object tblClientesESTADO: TIBStringField
      DisplayWidth = 36
      FieldName = 'ESTADO'
      Origin = 'CLIENTES.ESTADO'
      Size = 30
    end
    object tblClientesCIUDAD: TIBStringField
      DisplayWidth = 36
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object tblClientesDIRECCION_REAL: TIBStringField
      DisplayWidth = 72
      FieldName = 'DIRECCION_REAL'
      Origin = 'CLIENTES.DIRECCION_REAL'
      Size = 60
    end
    object tblClientesDIRECCION_LOCAL: TIBStringField
      DisplayWidth = 72
      FieldName = 'DIRECCION_LOCAL'
      Origin = 'CLIENTES.DIRECCION_LOCAL'
      Size = 60
    end
    object tblClientesSTATUS_CLIENTE: TIBStringField
      DisplayWidth = 19
      FieldName = 'STATUS_CLIENTE'
      Origin = 'CLIENTES.STATUS_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object tblClientesINSERTADO_POR: TIBStringField
      DisplayWidth = 19
      FieldName = 'INSERTADO_POR'
      Origin = 'CLIENTES.INSERTADO_POR'
      Size = 12
    end
    object tblClientesFECHA_INSERTADO: TDateTimeField
      DisplayWidth = 22
      FieldName = 'FECHA_INSERTADO'
      Origin = 'CLIENTES.FECHA_INSERTADO'
    end
    object tblClientesFECHA_MOD: TDateTimeField
      DisplayWidth = 22
      FieldName = 'FECHA_MOD'
      Origin = 'CLIENTES.FECHA_MOD'
    end
    object tblClientesMODI_POR: TIBStringField
      DisplayWidth = 15
      FieldName = 'MODI_POR'
      Origin = 'CLIENTES.MODI_POR'
      Size = 12
    end
    object tblClientesTELEFONO_LOCAL: TIBStringField
      FieldName = 'TELEFONO_LOCAL'
      Origin = 'CLIENTES.TELEFONO_LOCAL'
    end
    object tblClientesTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
    end
    object tblClientesTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'CLIENTES.TELEF_REFERENCIA'
    end
    object tblClientesOTRO_TELEFONO: TIBStringField
      FieldName = 'OTRO_TELEFONO'
      Origin = 'CLIENTES.OTRO_TELEFONO'
    end
    object tblClientesFAX_CONTACTO: TIBStringField
      FieldName = 'FAX_CONTACTO'
      Origin = 'CLIENTES.FAX_CONTACTO'
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
    object tblClientesFECHA_NACIMIENTO: TDateTimeField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'CLIENTES.FECHA_NACIMIENTO'
    end
    object tblClientesRUTA_FOTO: TIBStringField
      FieldName = 'RUTA_FOTO'
      Origin = 'CLIENTES.RUTA_FOTO'
      Size = 120
    end
  end
  object tblTipoCliente: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_CLIENTE'
    Left = 56
    Top = 64
  end
  object tblMoneda: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'MONEDA'
    Left = 56
    Top = 184
  end
  object tblCondicionVenta: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CONDICION_VENTA'
    Left = 144
    Top = 184
    object tblCondicionVentaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
    end
    object tblCondicionVentaCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
  end
  object ibsqlCodMaxCte: TIBSQL
    Database = dmCon.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'select max(codigo) codigomax from clientes')
    Transaction = dmCon.IBTransaction1
    Left = 144
    Top = 16
  end
  object ibsqlBuscarCte: TIBSQL
    Database = dmCon.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'select codigo'
      'from clientes'
      'Where '
      'RNC =:rnc or'
      'LICENCIA =:licencia or'
      'PASAPORTE =:pasaporte')
    Transaction = dmCon.IBTransaction1
    Left = 144
    Top = 64
  end
  object tblTipoNCF: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_CF'
    Left = 56
    Top = 128
    object tblTipoNCFTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Size = 2
    end
    object tblTipoNCFDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object dstblTipoNCF: TDataSource
    DataSet = tblTipoNCF
    Left = 144
    Top = 128
  end
  object qryClientes: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   '
      'C.CODIGO,  '
      'C.NOMBRE_EMPRESA, '
      'C.LIMITE_CREDITO,'
      'C.NOMBRE, '
      'C.LICENCIA, '
      'C.CEDULA, '
      'C.status_cliente, '
      'C.FECHA_VENCE_LICENCIA,'
      'C.PASAPORTE, '
      'C.FECHA_VENCE_PASAPORTE,'
      'C.TIPO_CLIENTE, '
      'T.DESCRIPCION DESC_TIPOCLIENTE, '
      'RNC, '
      'APELLIDO, '
      'CIUDAD,'
      'TELEFONO_LOCAL, '
      'DIRECCION_REAL, '
      'OTRO_TELEFONO, '
      'DIRECCION_LOCAL, '
      'REFERENCIA, '
      'TELEF_REFERENCIA,'
      'C.NOMBRE||" "||C.APELLIDO NOMBRECOMPLETO,'
      'C.observacion'
      'From CLIENTES C, TIPO_CLIENTE T'
      'WHERE C.TIPO_CLIENTE = T.CODIGO '
      '')
    OnFilterRecord = qryClientesFilterRecord
    Left = 232
    Top = 127
    object qryClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CLIENTES.CODIGO'
      Required = True
    end
    object qryClientesNOMBRE_EMPRESA: TIBStringField
      FieldName = 'NOMBRE_EMPRESA'
      Origin = 'CLIENTES.NOMBRE_EMPRESA'
      Size = 40
    end
    object qryClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object qryClientesNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'CLIENTES.NOMBRE'
      Size = 60
    end
    object qryClientesLICENCIA: TIBStringField
      FieldName = 'LICENCIA'
      Origin = 'CLIENTES.LICENCIA'
      Size = 30
    end
    object qryClientesCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryClientesSTATUS_CLIENTE: TIBStringField
      FieldName = 'STATUS_CLIENTE'
      Origin = 'CLIENTES.STATUS_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object qryClientesFECHA_VENCE_LICENCIA: TDateTimeField
      FieldName = 'FECHA_VENCE_LICENCIA'
      Origin = 'CLIENTES.FECHA_VENCE_LICENCIA'
    end
    object qryClientesPASAPORTE: TIBStringField
      FieldName = 'PASAPORTE'
      Origin = 'CLIENTES.PASAPORTE'
      Size = 30
    end
    object qryClientesFECHA_VENCE_PASAPORTE: TDateTimeField
      FieldName = 'FECHA_VENCE_PASAPORTE'
      Origin = 'CLIENTES.FECHA_VENCE_PASAPORTE'
    end
    object qryClientesTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
    object qryClientesDESC_TIPOCLIENTE: TIBStringField
      FieldName = 'DESC_TIPOCLIENTE'
      Origin = 'TIPO_CLIENTE.DESCRIPCION'
      Size = 30
    end
    object qryClientesRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'CLIENTES.RNC'
      Size = 12
    end
    object qryClientesAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'CLIENTES.APELLIDO'
      Size = 60
    end
    object qryClientesCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryClientesTELEFONO_LOCAL: TIBStringField
      FieldName = 'TELEFONO_LOCAL'
      Origin = 'CLIENTES.TELEFONO_LOCAL'
    end
    object qryClientesDIRECCION_REAL: TIBStringField
      FieldName = 'DIRECCION_REAL'
      Origin = 'CLIENTES.DIRECCION_REAL'
      Size = 60
    end
    object qryClientesOTRO_TELEFONO: TIBStringField
      FieldName = 'OTRO_TELEFONO'
      Origin = 'CLIENTES.OTRO_TELEFONO'
    end
    object qryClientesDIRECCION_LOCAL: TIBStringField
      FieldName = 'DIRECCION_LOCAL'
      Origin = 'CLIENTES.DIRECCION_LOCAL'
      Size = 60
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
    object qryClientesNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Size = 121
    end
    object qryClientesOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = 'CLIENTES.OBSERVACION'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSQryClientes: TDataSource
    DataSet = qryClientes
    Left = 320
    Top = 80
  end
  object qryRepCumpleanioCte: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select CODIGO, FECHA_NACIMIENTO, APELLIDO, DIRECCION_LOCAL, EMAI' +
        'L, FECHA_NACIMIENTO, NOMBRE, TELEFONO_LOCAL from CLIENTES'
      'Where F_Month(Fecha_Nacimiento) = :mes'
      'ORDER BY Fecha_Nacimiento ')
    Left = 320
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'mes'
        ParamType = ptInput
      end>
  end
  object qryDatosCteAtraso: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select  Numero NumPrest, CantMesAtraso, count(num_cuota), sum(mo' +
        'nto_capital_apagar) Capital, Sum(monto_interes_apagar) Interes, ' +
        'sum(monto_apagar_pormora) Mora'
      'From ProcBuscarCuotas(:fechapgocuota,:codcte)'
      'Where CantMesAtraso > 0'
      'Group By Numero, CantMesAtraso'
      'Order by Numero, CantMesAtraso,  NUM_CUOTA')
    Left = 368
    Top = 152
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechapgocuota'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codcte'
        ParamType = ptInput
      end>
    object qryDatosCteAtrasoNUMPREST: TIntegerField
      DisplayLabel = '#Prestamo'
      FieldName = 'NUMPREST'
    end
    object qryDatosCteAtrasoCANTMESATRASO: TIntegerField
      DisplayLabel = 'CantMesAtraso'
      FieldName = 'CANTMESATRASO'
    end
    object qryDatosCteAtrasoCOUNT: TIntegerField
      DisplayLabel = 'CantCuotas'
      FieldName = 'COUNT'
      Required = True
    end
    object qryDatosCteAtrasoCAPITAL: TFloatField
      DisplayLabel = 'Monto Capital'
      FieldName = 'CAPITAL'
      DisplayFormat = ',0.00'
    end
    object qryDatosCteAtrasoINTERES: TFloatField
      DisplayLabel = 'Monto Interes'
      FieldName = 'INTERES'
      DisplayFormat = ',0.00'
    end
    object qryDatosCteAtrasoMORA: TFloatField
      DisplayLabel = 'Mora'
      FieldName = 'MORA'
      DisplayFormat = ',0.00'
    end
  end
end
