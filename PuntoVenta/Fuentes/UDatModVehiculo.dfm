object dmVehiculo: TdmVehiculo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 921
  Top = 232
  Height = 454
  Width = 447
  object tblVehiculo: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = tblVehiculoCalcFields
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from VEHICULO'
      'where'
      '  FICHA = :OLD_FICHA')
    InsertSQL.Strings = (
      'insert into VEHICULO'
      
        '  (FICHA, DESCRIPCION, PLACA, NUM_POLIZA_SEGURO, MARCA, REGISTRO' +
        ', REFERENCIA, '
      
        '   CODIGO_EMPLEADO, FECHA, STATUS_ACTIVO, FECHA_IN, IN_POR, FECH' +
        'A_UPD, '
      
        '   UPD_POR, COLOR, YEAR_VEH, ULTIMO_KM, FECHA_INICIO, TIPO_COMBU' +
        'STIBLE, '
      
        '   CANT_GALONES, VALOR_TANQUE, NIVEL_TANQUE, COD_PROPIETARIO, RO' +
        'TULO, MODELO, '
      
        '   CHASSIS, CODIGO_PROD, PRECIOVENTA, PRECIOCOMPRA, COD_MONEDA, ' +
        'COD_PROVEEDOR, '
      '   CODIGO_CTE_ANT, CODIGO_CTE_ACT)'
      'values'
      
        '  (:FICHA, :DESCRIPCION, :PLACA, :NUM_POLIZA_SEGURO, :MARCA, :RE' +
        'GISTRO, '
      
        '   :REFERENCIA, :CODIGO_EMPLEADO, :FECHA, :STATUS_ACTIVO, :FECHA' +
        '_IN, :IN_POR, '
      
        '   :FECHA_UPD, :UPD_POR, :COLOR, :YEAR_VEH, :ULTIMO_KM, :FECHA_I' +
        'NICIO, '
      
        '   :TIPO_COMBUSTIBLE, :CANT_GALONES, :VALOR_TANQUE, :NIVEL_TANQU' +
        'E, :COD_PROPIETARIO, '
      
        '   :ROTULO, :MODELO, :CHASSIS, :CODIGO_PROD, :PRECIOVENTA, :PREC' +
        'IOCOMPRA, '
      
        '   :COD_MONEDA, :COD_PROVEEDOR, :CODIGO_CTE_ANT, :CODIGO_CTE_ACT' +
        ')')
    RefreshSQL.Strings = (
      'Select '
      '  FICHA,'
      '  DESCRIPCION,'
      '  PLACA,'
      '  NUM_POLIZA_SEGURO,'
      '  MARCA,'
      '  REGISTRO,'
      '  REFERENCIA,'
      '  CODIGO_EMPLEADO,'
      '  FECHA,'
      '  STATUS_ACTIVO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_UPD,'
      '  UPD_POR,'
      '  COLOR,'
      '  YEAR_VEH,'
      '  ULTIMO_KM,'
      '  FECHA_INICIO,'
      '  TIPO_COMBUSTIBLE,'
      '  CANT_GALONES,'
      '  VALOR_TANQUE,'
      '  NIVEL_TANQUE,'
      '  COD_PROPIETARIO,'
      '  ROTULO,'
      '  MODELO,'
      '  CHASSIS,'
      '  CODIGO_PROD,'
      '  PRECIOVENTA,'
      '  PRECIOCOMPRA,'
      '  COD_MONEDA,'
      '  COD_PROVEEDOR,'
      '  CODIGO_CTE_ANT,'
      '  CODIGO_CTE_ACT'
      'from VEHICULO '
      'where'
      '  FICHA = :FICHA')
    SelectSQL.Strings = (
      'Select *  From VEHICULO'
      'order by cod_propietario, ficha'
      '')
    ModifySQL.Strings = (
      'update VEHICULO'
      'set'
      '  FICHA = :FICHA,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  PLACA = :PLACA,'
      '  NUM_POLIZA_SEGURO = :NUM_POLIZA_SEGURO,'
      '  MARCA = :MARCA,'
      '  REGISTRO = :REGISTRO,'
      '  REFERENCIA = :REFERENCIA,'
      '  CODIGO_EMPLEADO = :CODIGO_EMPLEADO,'
      '  FECHA = :FECHA,'
      '  STATUS_ACTIVO = :STATUS_ACTIVO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_UPD = :FECHA_UPD,'
      '  UPD_POR = :UPD_POR,'
      '  COLOR = :COLOR,'
      '  YEAR_VEH = :YEAR_VEH,'
      '  ULTIMO_KM = :ULTIMO_KM,'
      '  FECHA_INICIO = :FECHA_INICIO,'
      '  TIPO_COMBUSTIBLE = :TIPO_COMBUSTIBLE,'
      '  CANT_GALONES = :CANT_GALONES,'
      '  VALOR_TANQUE = :VALOR_TANQUE,'
      '  NIVEL_TANQUE = :NIVEL_TANQUE,'
      '  COD_PROPIETARIO = :COD_PROPIETARIO,'
      '  ROTULO = :ROTULO,'
      '  MODELO = :MODELO,'
      '  CHASSIS = :CHASSIS,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  PRECIOVENTA = :PRECIOVENTA,'
      '  PRECIOCOMPRA = :PRECIOCOMPRA,'
      '  COD_MONEDA = :COD_MONEDA,'
      '  COD_PROVEEDOR = :COD_PROVEEDOR,'
      '  CODIGO_CTE_ANT = :CODIGO_CTE_ANT,'
      '  CODIGO_CTE_ACT = :CODIGO_CTE_ACT'
      'where'
      '  FICHA = :OLD_FICHA')
    GeneratorField.Field = 'FICHA'
    GeneratorField.Generator = 'GEN_NUMFICHAVEH'
    GeneratorField.ApplyEvent = gamOnPost
    OnFilterRecord = tblVehiculoFilterRecord
    Left = 288
    Top = 128
    object tblVehiculoFICHA: TIntegerField
      FieldName = 'FICHA'
      Origin = 'VEHICULO.FICHA'
      Required = True
    end
    object tblVehiculoCOD_PROPIETARIO: TIntegerField
      FieldName = 'COD_PROPIETARIO'
      Origin = 'VEHICULO.COD_PROPIETARIO'
    end
    object tblVehiculoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VEHICULO.DESCRIPCION'
      Size = 30
    end
    object tblVehiculoPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'VEHICULO.PLACA'
    end
    object tblVehiculoNUM_POLIZA_SEGURO: TIBStringField
      FieldName = 'NUM_POLIZA_SEGURO'
      Origin = 'VEHICULO.NUM_POLIZA_SEGURO'
    end
    object tblVehiculoMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'VEHICULO.MARCA'
    end
    object tblVehiculoREGISTRO: TIBStringField
      FieldName = 'REGISTRO'
      Origin = 'VEHICULO.REGISTRO'
    end
    object tblVehiculoREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'VEHICULO.REFERENCIA'
      Size = 12
    end
    object tblVehiculoCODIGO_EMPLEADO: TIntegerField
      FieldName = 'CODIGO_EMPLEADO'
      Origin = 'VEHICULO.CODIGO_EMPLEADO'
    end
    object tblVehiculoFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VEHICULO.FECHA'
    end
    object tblVehiculoSTATUS_ACTIVO: TIBStringField
      FieldName = 'STATUS_ACTIVO'
      Origin = 'VEHICULO.STATUS_ACTIVO'
      FixedChar = True
      Size = 1
    end
    object tblVehiculoFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VEHICULO.FECHA_IN'
    end
    object tblVehiculoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VEHICULO.IN_POR'
      Size = 12
    end
    object tblVehiculoFECHA_UPD: TDateTimeField
      FieldName = 'FECHA_UPD'
      Origin = 'VEHICULO.FECHA_UPD'
    end
    object tblVehiculoUPD_POR: TIBStringField
      FieldName = 'UPD_POR'
      Origin = 'VEHICULO.UPD_POR'
      Size = 12
    end
    object tblVehiculoCOLOR: TIBStringField
      FieldName = 'COLOR'
      Origin = 'VEHICULO.COLOR'
      Size = 15
    end
    object tblVehiculoYEAR_VEH: TIntegerField
      FieldName = 'YEAR_VEH'
      Origin = 'VEHICULO.YEAR_VEH'
    end
    object tblVehiculoULTIMO_KM: TIBStringField
      FieldName = 'ULTIMO_KM'
      Origin = 'VEHICULO.ULTIMO_KM'
    end
    object tblVehiculoFECHA_INICIO: TDateTimeField
      FieldName = 'FECHA_INICIO'
      Origin = 'VEHICULO.FECHA_INICIO'
    end
    object tblVehiculoTIPO_COMBUSTIBLE: TSmallintField
      FieldName = 'TIPO_COMBUSTIBLE'
      Origin = 'VEHICULO.TIPO_COMBUSTIBLE'
    end
    object tblVehiculoCANT_GALONES: TFloatField
      FieldName = 'CANT_GALONES'
      Origin = 'VEHICULO.CANT_GALONES'
    end
    object tblVehiculoVALOR_TANQUE: TFloatField
      FieldName = 'VALOR_TANQUE'
      Origin = 'VEHICULO.VALOR_TANQUE'
    end
    object tblVehiculoNIVEL_TANQUE: TFloatField
      FieldName = 'NIVEL_TANQUE'
      Origin = 'VEHICULO.NIVEL_TANQUE'
    end
    object tblVehiculoROTULO: TIBStringField
      FieldName = 'ROTULO'
      Origin = 'VEHICULO.ROTULO'
      FixedChar = True
      Size = 8
    end
    object tblVehiculoMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'VEHICULO.MODELO'
    end
    object tblVehiculoCHASSIS: TIBStringField
      FieldName = 'CHASSIS'
      Origin = 'VEHICULO.CHASSIS'
    end
    object tblVehiculoCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'VEHICULO.CODIGO_PROD'
    end
    object tblVehiculoPRECIOVENTA: TFloatField
      FieldName = 'PRECIOVENTA'
      Origin = 'VEHICULO.PRECIOVENTA'
    end
    object tblVehiculoPRECIOCOMPRA: TFloatField
      FieldName = 'PRECIOCOMPRA'
      Origin = 'VEHICULO.PRECIOCOMPRA'
    end
    object tblVehiculoCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'VEHICULO.COD_MONEDA'
      FixedChar = True
      Size = 1
    end
    object tblVehiculoCOD_PROVEEDOR: TIntegerField
      FieldName = 'COD_PROVEEDOR'
      Origin = 'VEHICULO.COD_PROVEEDOR'
    end
    object tblVehiculoPrecioCalculadoRD: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PrecioCalculadoRD'
      Calculated = True
    end
    object tblVehiculoCODIGO_CTE_ANT: TIntegerField
      FieldName = 'CODIGO_CTE_ANT'
      Origin = 'VEHICULO.CODIGO_CTE_ANT'
    end
    object tblVehiculoCODIGO_CTE_ACT: TIntegerField
      FieldName = 'CODIGO_CTE_ACT'
      Origin = 'VEHICULO.CODIGO_CTE_ACT'
    end
  end
  object dstbVehiculo: TDataSource
    AutoEdit = False
    DataSet = tblVehiculo
    Left = 288
    Top = 184
  end
  object qryClientes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From CLIENTES'
      'WHERE STATUS_CLIENTE  IN ('#39'A'#39')')
    Left = 64
    Top = 64
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
  end
  object dsqryClientes: TDataSource
    DataSet = qryClientes
    Left = 64
    Top = 120
  end
  object tblEstatusVeh: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ESTATUS_VEHICULO'
    Left = 288
    Top = 24
    object tblEstatusVehCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblEstatusVehDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object tblTanqueGasolina: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TANQUE_GASOLINA'
    Left = 64
    Top = 16
    object tblTanqueGasolinaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblTanqueGasolinaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 14
    end
  end
  object tblTipoCombustible: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_COMBUSTIBLE'
    Left = 64
    Top = 176
    object tblTipoCombustibleCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tblTipoCombustibleDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
    end
    object tblTipoCombustibleSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object dsTipocombustible: TDataSource
    DataSet = tblTipoCombustible
    Left = 64
    Top = 224
  end
  object dstblEstatusVeh: TDataSource
    DataSet = tblEstatusVeh
    Left = 288
    Top = 72
  end
  object qryVehiculos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  VEHICULO.FICHA,'
      '  VEHICULO.DESCRIPCION,'
      '  VEHICULO.PLACA,'
      '  VEHICULO.NUM_POLIZA_SEGURO,'
      '  VEHICULO.MARCA,'
      '  VEHICULO.REGISTRO,'
      '  VEHICULO.REFERENCIA,'
      '  VEHICULO.CODIGO_EMPLEADO,'
      '  VEHICULO.FECHA,'
      '  VEHICULO.STATUS_ACTIVO,'
      '  VEHICULO.FECHA_IN,'
      '  VEHICULO.IN_POR,'
      '  VEHICULO.FECHA_UPD,'
      '  VEHICULO.UPD_POR,'
      '  VEHICULO.COLOR,'
      '  VEHICULO.YEAR_VEH,'
      '  VEHICULO.ULTIMO_KM,'
      '  VEHICULO.FECHA_INICIO,'
      '  VEHICULO.TIPO_COMBUSTIBLE,'
      '  VEHICULO.CANT_GALONES,'
      '  VEHICULO.VALOR_TANQUE,'
      '  VEHICULO.NIVEL_TANQUE,'
      '  VEHICULO.COD_PROPIETARIO,'
      '  PROVEEDORES.DESCRIPCION AS NOMBRE_CTE,'
      '  PROVEEDORES.CIA_KEY,'
      '  PROVEEDORES.CODIGO_CTE,'
      '  CHOFERES.NOMBRE||" " ||CHOFERES.APELLIDO AS NOMBRE_CHOFER,'
      '  CHOFERES.CEDULA,'
      '  VEHICULO.ROTULO,'
      '  VEHICULO.CTA,'
      '  PROVEEDORES.TIPO_CLIENTE,'
      '  TIPO_PROVEEDOR.DESCRIPCION AS DESCRIPCION_TIPOPROV,'
      '  TIPO_PROVEEDOR.PAGACHOFER,'
      'PROVEEDORES.TIPOCXP'
      'FROM'
      '  PROVEEDORES'
      
        '  RIGHT OUTER JOIN VEHICULO ON (PROVEEDORES.CODIGO_CTE = VEHICUL' +
        'O.COD_PROPIETARIO)'
      
        '  LEFT OUTER JOIN CHOFERES ON (VEHICULO.CODIGO_EMPLEADO = CHOFER' +
        'ES.CODIGO)'
      
        '  LEFT OUTER JOIN TIPO_PROVEEDOR ON (PROVEEDORES.TIPO_CLIENTE = ' +
        'TIPO_PROVEEDOR.CODIGO)'
      'ORDER BY'
      '  PROVEEDORES.TIPOCXP,'
      '  VEHICULO.CTA ,'
      '  PROVEEDORES.TIPO_CLIENTE'
      '')
    Left = 288
    Top = 240
    object qryVehiculosFICHA: TIntegerField
      FieldName = 'FICHA'
      Origin = 'VEHICULO.FICHA'
      Required = True
    end
    object qryVehiculosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VEHICULO.DESCRIPCION'
      Size = 30
    end
    object qryVehiculosPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'VEHICULO.PLACA'
    end
    object qryVehiculosNUM_POLIZA_SEGURO: TIBStringField
      FieldName = 'NUM_POLIZA_SEGURO'
      Origin = 'VEHICULO.NUM_POLIZA_SEGURO'
    end
    object qryVehiculosMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'VEHICULO.MARCA'
    end
    object qryVehiculosREGISTRO: TIBStringField
      FieldName = 'REGISTRO'
      Origin = 'VEHICULO.REGISTRO'
    end
    object qryVehiculosREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'VEHICULO.REFERENCIA'
      Size = 12
    end
    object qryVehiculosCODIGO_EMPLEADO: TIntegerField
      FieldName = 'CODIGO_EMPLEADO'
      Origin = 'VEHICULO.CODIGO_EMPLEADO'
    end
    object qryVehiculosFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VEHICULO.FECHA'
    end
    object qryVehiculosSTATUS_ACTIVO: TIBStringField
      FieldName = 'STATUS_ACTIVO'
      Origin = 'VEHICULO.STATUS_ACTIVO'
      FixedChar = True
      Size = 1
    end
    object qryVehiculosFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VEHICULO.FECHA_IN'
    end
    object qryVehiculosIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VEHICULO.IN_POR'
      Size = 12
    end
    object qryVehiculosFECHA_UPD: TDateTimeField
      FieldName = 'FECHA_UPD'
      Origin = 'VEHICULO.FECHA_UPD'
    end
    object qryVehiculosUPD_POR: TIBStringField
      FieldName = 'UPD_POR'
      Origin = 'VEHICULO.UPD_POR'
      Size = 12
    end
    object qryVehiculosCOLOR: TIBStringField
      FieldName = 'COLOR'
      Origin = 'VEHICULO.COLOR'
      Size = 15
    end
    object qryVehiculosYEAR_VEH: TIntegerField
      FieldName = 'YEAR_VEH'
      Origin = 'VEHICULO.YEAR_VEH'
    end
    object qryVehiculosULTIMO_KM: TIBStringField
      FieldName = 'ULTIMO_KM'
      Origin = 'VEHICULO.ULTIMO_KM'
    end
    object qryVehiculosFECHA_INICIO: TDateTimeField
      FieldName = 'FECHA_INICIO'
      Origin = 'VEHICULO.FECHA_INICIO'
    end
    object qryVehiculosTIPO_COMBUSTIBLE: TSmallintField
      FieldName = 'TIPO_COMBUSTIBLE'
      Origin = 'VEHICULO.TIPO_COMBUSTIBLE'
    end
    object qryVehiculosCANT_GALONES: TFloatField
      FieldName = 'CANT_GALONES'
      Origin = 'VEHICULO.CANT_GALONES'
    end
    object qryVehiculosVALOR_TANQUE: TFloatField
      FieldName = 'VALOR_TANQUE'
      Origin = 'VEHICULO.VALOR_TANQUE'
    end
    object qryVehiculosNIVEL_TANQUE: TFloatField
      FieldName = 'NIVEL_TANQUE'
      Origin = 'VEHICULO.NIVEL_TANQUE'
    end
    object qryVehiculosCOD_PROPIETARIO: TIntegerField
      FieldName = 'COD_PROPIETARIO'
      Origin = 'VEHICULO.COD_PROPIETARIO'
    end
    object qryVehiculosNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object qryVehiculosCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'PROVEEDORES.CIA_KEY'
    end
    object qryVehiculosCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROVEEDORES.CODIGO_CTE'
    end
    object qryVehiculosNOMBRE_CHOFER: TIBStringField
      FieldName = 'NOMBRE_CHOFER'
      Size = 71
    end
    object qryVehiculosCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CHOFERES.CEDULA'
      Size = 14
    end
    object qryVehiculosROTULO: TIBStringField
      FieldName = 'ROTULO'
      Origin = 'VEHICULO.ROTULO'
      FixedChar = True
      Size = 8
    end
    object qryVehiculosCTA: TIBStringField
      FieldName = 'CTA'
      Origin = 'VEHICULO.CTA'
      FixedChar = True
      Size = 8
    end
    object qryVehiculosTIPO_CLIENTE: TIntegerField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'PROVEEDORES.TIPO_CLIENTE'
    end
    object qryVehiculosDESCRIPCION_TIPOPROV: TIBStringField
      FieldName = 'DESCRIPCION_TIPOPROV'
      Origin = 'TIPO_PROVEEDOR.DESCRIPCION'
      Size = 30
    end
    object qryVehiculosPAGACHOFER: TSmallintField
      FieldName = 'PAGACHOFER'
      Origin = 'TIPO_PROVEEDOR.PAGACHOFER'
    end
    object qryVehiculosTIPOCXP: TIntegerField
      FieldName = 'TIPOCXP'
      Origin = 'PROVEEDORES.TIPOCXP'
    end
  end
  object dsqryVehiculos: TDataSource
    DataSet = qryVehiculos
    Left = 288
    Top = 296
  end
  object qryChoferes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  CHOFERES.CODIGO,'
      '  CHOFERES.CODIGO_CIA,'
      '  CHOFERES.NOMBRE,'
      '  CHOFERES.APELLIDO,'
      '  CHOFERES.CEDULA,'
      '  CHOFERES.NOMBRE||" "|| CHOFERES.APELLIDO as nombrecompleto,'
      '  CHOFERES.FOTO,'
      '  CHOFERES.PASSPORT,'
      '  CHOFERES.CALLE,'
      '  CHOFERES.NUM_CASA,'
      '  CHOFERES.CIUDAD,'
      '  CHOFERES.PAIS,'
      '  CHOFERES.TELEF_CASA,'
      '  CHOFERES.TELEF_OFICINA,'
      '  CHOFERES.CELULAR,'
      '  CHOFERES.EMAIL,'
      '  CHOFERES.SEXO,'
      '  CHOFERES.ESTADO_CIVIL,'
      '  CHOFERES.TELEF_REFERENCIA,'
      '  CHOFERES.NOMBRE_REFERENCIA,'
      '  CHOFERES.FECHA_NAC,'
      '  CHOFERES.NACIONALIDAD,'
      '  CHOFERES.FECHA_ENTRADA,'
      '  CHOFERES.FECHA_SALIDA,'
      '  CHOFERES.SALARIO,'
      '  CHOFERES.TIPO_NOMINA,'
      '  CHOFERES.TIPO_EMPLEADO,'
      '  CHOFERES.DEPTO_EMP,'
      '  CHOFERES.SECCION,'
      '  CHOFERES.CARGO,'
      '  CHOFERES.PAGA_AFP,'
      '  CHOFERES.PAGA_TSS,'
      '  CHOFERES.STATUS,'
      '  CHOFERES.FECHA_IN,'
      '  CHOFERES.IN_POR,'
      '  CHOFERES.FECHA_MOD,'
      '  CHOFERES.MOD_POR,'
      '  CHOFERES.LICENCIA,'
      
        '  CHOFERES.FECHA_VENCE_LICENCIA, CHOFERES.CUENTANOMINA, CHOFERES' +
        '.CUENTAXPAGAR'
      'FROM'
      '  CHOFERES'
      'order by codigo')
    Left = 176
    Top = 8
    object qryChoferesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CHOFERES.CODIGO'
      Required = True
    end
    object qryChoferesCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
      Origin = 'CHOFERES.CODIGO_CIA'
      Required = True
    end
    object qryChoferesNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'CHOFERES.NOMBRE'
      Size = 35
    end
    object qryChoferesAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'CHOFERES.APELLIDO'
      Size = 35
    end
    object qryChoferesCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CHOFERES.CEDULA'
      Size = 14
    end
    object qryChoferesFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'CHOFERES.FOTO'
      Size = 8
    end
    object qryChoferesPASSPORT: TIBStringField
      FieldName = 'PASSPORT'
      Origin = 'CHOFERES.PASSPORT'
      Size = 14
    end
    object qryChoferesCALLE: TIBStringField
      FieldName = 'CALLE'
      Origin = 'CHOFERES.CALLE'
      Size = 40
    end
    object qryChoferesNUM_CASA: TSmallintField
      FieldName = 'NUM_CASA'
      Origin = 'CHOFERES.NUM_CASA'
    end
    object qryChoferesCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CHOFERES.CIUDAD'
      Size = 40
    end
    object qryChoferesPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CHOFERES.PAIS'
      Size = 40
    end
    object qryChoferesTELEF_CASA: TIBStringField
      FieldName = 'TELEF_CASA'
      Origin = 'CHOFERES.TELEF_CASA'
      Size = 12
    end
    object qryChoferesTELEF_OFICINA: TIBStringField
      FieldName = 'TELEF_OFICINA'
      Origin = 'CHOFERES.TELEF_OFICINA'
      Size = 12
    end
    object qryChoferesCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'CHOFERES.CELULAR'
      Size = 12
    end
    object qryChoferesEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CHOFERES.EMAIL'
      Size = 40
    end
    object qryChoferesSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = 'CHOFERES.SEXO'
      FixedChar = True
      Size = 1
    end
    object qryChoferesESTADO_CIVIL: TIBStringField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'CHOFERES.ESTADO_CIVIL'
      FixedChar = True
      Size = 1
    end
    object qryChoferesTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'CHOFERES.TELEF_REFERENCIA'
      Size = 12
    end
    object qryChoferesNOMBRE_REFERENCIA: TIBStringField
      FieldName = 'NOMBRE_REFERENCIA'
      Origin = 'CHOFERES.NOMBRE_REFERENCIA'
      Size = 40
    end
    object qryChoferesFECHA_NAC: TDateTimeField
      FieldName = 'FECHA_NAC'
      Origin = 'CHOFERES.FECHA_NAC'
    end
    object qryChoferesNACIONALIDAD: TIBStringField
      FieldName = 'NACIONALIDAD'
      Origin = 'CHOFERES.NACIONALIDAD'
      FixedChar = True
      Size = 1
    end
    object qryChoferesFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'CHOFERES.FECHA_ENTRADA'
    end
    object qryChoferesFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'CHOFERES.FECHA_SALIDA'
    end
    object qryChoferesSALARIO: TFloatField
      FieldName = 'SALARIO'
      Origin = 'CHOFERES.SALARIO'
    end
    object qryChoferesTIPO_NOMINA: TSmallintField
      FieldName = 'TIPO_NOMINA'
      Origin = 'CHOFERES.TIPO_NOMINA'
    end
    object qryChoferesTIPO_EMPLEADO: TSmallintField
      FieldName = 'TIPO_EMPLEADO'
      Origin = 'CHOFERES.TIPO_EMPLEADO'
    end
    object qryChoferesDEPTO_EMP: TSmallintField
      FieldName = 'DEPTO_EMP'
      Origin = 'CHOFERES.DEPTO_EMP'
    end
    object qryChoferesSECCION: TSmallintField
      FieldName = 'SECCION'
      Origin = 'CHOFERES.SECCION'
    end
    object qryChoferesCARGO: TSmallintField
      FieldName = 'CARGO'
      Origin = 'CHOFERES.CARGO'
    end
    object qryChoferesPAGA_AFP: TSmallintField
      FieldName = 'PAGA_AFP'
      Origin = 'CHOFERES.PAGA_AFP'
    end
    object qryChoferesPAGA_TSS: TSmallintField
      FieldName = 'PAGA_TSS'
      Origin = 'CHOFERES.PAGA_TSS'
    end
    object qryChoferesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CHOFERES.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryChoferesFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CHOFERES.FECHA_IN'
    end
    object qryChoferesIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'CHOFERES.IN_POR'
      Size = 12
    end
    object qryChoferesFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CHOFERES.FECHA_MOD'
    end
    object qryChoferesMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'CHOFERES.MOD_POR'
      Size = 12
    end
    object qryChoferesLICENCIA: TIBStringField
      FieldName = 'LICENCIA'
      Origin = 'CHOFERES.LICENCIA'
      Size = 14
    end
    object qryChoferesFECHA_VENCE_LICENCIA: TDateTimeField
      FieldName = 'FECHA_VENCE_LICENCIA'
      Origin = 'CHOFERES.FECHA_VENCE_LICENCIA'
    end
    object qryChoferesNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Size = 71
    end
    object qryChoferesCUENTANOMINA: TIBStringField
      FieldName = 'CUENTANOMINA'
      Origin = 'CHOFERES.CUENTANOMINA'
      Size = 9
    end
    object qryChoferesCUENTAXPAGAR: TIBStringField
      FieldName = 'CUENTAXPAGAR'
      Origin = 'CHOFERES.CUENTAXPAGAR'
      Size = 9
    end
  end
  object dsqryChoferes: TDataSource
    DataSet = qryChoferes
    Left = 184
    Top = 64
  end
  object qryProveedores: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From proveedores'
      'Order By codigo_cte')
    Left = 184
    Top = 120
    object qryProveedoresCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROVEEDORES.CODIGO_CTE'
      Required = True
    end
    object qryProveedoresTIPO_CLIENTE: TIntegerField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'PROVEEDORES.TIPO_CLIENTE'
    end
    object qryProveedoresNOMBRE_ABR: TIBStringField
      FieldName = 'NOMBRE_ABR'
      Origin = 'PROVEEDORES.NOMBRE_ABR'
      Size = 60
    end
    object qryProveedoresDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object qryProveedoresCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'PROVEEDORES.CONTACTO'
      Size = 35
    end
    object qryProveedoresPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PROVEEDORES.PAIS'
      Size = 30
    end
    object qryProveedoresESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'PROVEEDORES.ESTADO'
      Size = 30
    end
    object qryProveedoresCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROVEEDORES.CIUDAD'
    end
    object qryProveedoresCALYYNUM: TIBStringField
      FieldName = 'CALYYNUM'
      Origin = 'PROVEEDORES.CALYYNUM'
      Size = 80
    end
    object qryProveedoresTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object qryProveedoresFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'PROVEEDORES.FAX'
      Size = 12
    end
    object qryProveedoresCODIGOPOSTAL: TIBStringField
      FieldName = 'CODIGOPOSTAL'
      Origin = 'PROVEEDORES.CODIGOPOSTAL'
      FixedChar = True
      Size = 6
    end
    object qryProveedoresEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'PROVEEDORES.EMAIL'
      Size = 40
    end
    object qryProveedoresDIRECCIONWEB: TIBStringField
      FieldName = 'DIRECCIONWEB'
      Origin = 'PROVEEDORES.DIRECCIONWEB'
      Size = 40
    end
    object qryProveedoresSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROVEEDORES.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryProveedoresFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PROVEEDORES.FECHA_IN'
    end
    object qryProveedoresIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PROVEEDORES.IN_POR'
      Size = 12
    end
    object qryProveedoresFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PROVEEDORES.FECHA_MOD'
    end
    object qryProveedoresMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PROVEEDORES.MOD_POR'
      Size = 12
    end
    object qryProveedoresRNC_PROVEEDOR: TIBStringField
      FieldName = 'RNC_PROVEEDOR'
      Origin = 'PROVEEDORES.RNC_PROVEEDOR'
      Size = 15
    end
    object qryProveedoresMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'PROVEEDORES.MOVIL1'
    end
    object qryProveedoresMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'PROVEEDORES.MOVIL2'
    end
    object qryProveedoresTELEFONO2: TIBStringField
      FieldName = 'TELEFONO2'
      Origin = 'PROVEEDORES.TELEFONO2'
    end
    object qryProveedoresTELEFONO3: TIBStringField
      FieldName = 'TELEFONO3'
      Origin = 'PROVEEDORES.TELEFONO3'
    end
    object qryProveedoresEXTENSIONES: TIBStringField
      FieldName = 'EXTENSIONES'
      Origin = 'PROVEEDORES.EXTENSIONES'
      Size = 40
    end
    object qryProveedoresCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'PROVEEDORES.CIA_KEY'
    end
  end
  object DataSource1: TDataSource
    DataSet = qryProveedores
    Left = 184
    Top = 176
  end
  object dsQryProveedores: TDataSource
    DataSet = qryProveedores
    Left = 184
    Top = 176
  end
  object qryEmpleado: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  r.nombre||'#39' '#39'||r.apellido NombreCompleto, r.* '
      'From EMPLEADO r'
      'order by r.nombre')
    Left = 176
    Top = 224
    object qryEmpleadoNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Size = 71
    end
    object qryEmpleadoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMPLEADO.CODIGO'
      Required = True
    end
    object qryEmpleadoCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
      Origin = 'EMPLEADO.CODIGO_CIA'
      Required = True
    end
    object qryEmpleadoNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object qryEmpleadoAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADO.APELLIDO'
      Size = 35
    end
    object qryEmpleadoNOMBRE_REFERENCIA: TIBStringField
      FieldName = 'NOMBRE_REFERENCIA'
      Origin = 'EMPLEADO.NOMBRE_REFERENCIA'
      Size = 40
    end
    object qryEmpleadoMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'EMPLEADO.MOD_POR'
      Size = 12
    end
    object qryEmpleadoLICENCIA: TIBStringField
      FieldName = 'LICENCIA'
      Origin = 'EMPLEADO.LICENCIA'
      Size = 14
    end
    object qryEmpleadoFECHA_VENCE_LICENCIA: TDateTimeField
      FieldName = 'FECHA_VENCE_LICENCIA'
      Origin = 'EMPLEADO.FECHA_VENCE_LICENCIA'
    end
  end
  object dsqryEmpleado: TDataSource
    DataSet = qryEmpleado
    Left = 176
    Top = 280
  end
  object qryVerificaVeh: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT r.FECHA, v.NUM_SERIE'
      'FROM VEHICULO r'
      'inner join DATOSVEHICULO d on d.CHASSIS = r.CHASSIS'
      'inner join DatosVentaVehiculo v on v.CHASSIS = d.CHASSIS'
      'where r.chassis =:chassis')
    Left = 64
    Top = 280
    ParamData = <
      item
        DataType = ftString
        Name = 'chassis'
        ParamType = ptInput
      end>
  end
  object qryVerificaVehTVta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT r.FECHA, v.NUM_SERIE'
      'FROM VEHICULO r'
      'inner join DATOSVEHICULO d on d.CHASSIS = r.CHASSIS'
      'inner join DatosVentaVehiculo v on v.CHASSIS = d.CHASSIS'
      'where d.numpol =:numerovta')
    Left = 64
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerovta'
        ParamType = ptInput
      end>
  end
  object qryEsVeh: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  first 1 codigo_prod  From VEHICULO'
      'where CODIGO_PROD=:codprod')
    Left = 168
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codprod'
        ParamType = ptInput
      end>
    object qryEsVehCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'VEHICULO.CODIGO_PROD'
    end
  end
  object qryEstusVeh: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from ESTATUS_VEHICULO')
    Left = 360
    Top = 176
    object qryEstusVehCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ESTATUS_VEHICULO.CODIGO'
      Required = True
    end
    object qryEstusVehDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'ESTATUS_VEHICULO.DESCRIPCION'
      Size = 30
    end
  end
  object qryProvLook: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From proveedores'
      'Order By codigo_cte')
    Left = 360
    Top = 256
    object qryProvLookCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROVEEDORES.CODIGO_CTE'
      Required = True
    end
    object qryProvLookDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
  end
  object dsqryProvLook: TDataSource
    DataSet = qryProvLook
    Left = 368
    Top = 312
  end
end
