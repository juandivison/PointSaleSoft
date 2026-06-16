object dmConectar: TdmConectar
  OldCreateOrder = False
  Left = 1482
  Top = 162
  Height = 440
  Width = 262
  object IBDatabase1: TIBDatabase
    DatabaseName = 
      'C:\Proyectos\Datos\Repositorio\PuntoVenta\Expert_Ingenieria\DBER' +
      'PEXPERT.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=sup2005')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    AllowStreamedConnected = False
    BeforeConnect = IBDatabase1BeforeConnect
    OnLogin = IBDatabase1Login
    Left = 62
    Top = 24
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 61
    Top = 68
  end
  object IBDatabaseInfo1: TIBDatabaseInfo
    Database = IBDatabase1
    Left = 63
    Top = 118
  end
  object IBEvents1: TIBEvents
    AutoRegister = True
    Database = IBDatabase1
    Registered = False
    OnEventAlert = IBEvents1EventAlert
    OnError = IBEvents1Error
    Left = 64
    Top = 166
  end
  object qryMaxGeneradores: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select 0 ORDEN,'#39'ORDEN_COMP_MAST'#39' tabla, max(r.NUMERO) serie, Gen' +
        '_id(GEN_NUM_ORDEN_MAST,0) generadorsec,'#39'GEN_NUM_ORDEN_MAST'#39' nomb' +
        '_generador, '#39'NUMERO'#39' campo From ORDEN_COMP_MAST r'
      'UNION'
      
        'Select 0 ORDEN,'#39'ORDEN_COMP_DET'#39' tabla, max(r.SERIE) serie, Gen_i' +
        'd(GEN_NUM_ORDEN_DET,0) generadorsec,'#39'GEN_NUM_ORDEN_DET'#39' nomb_gen' +
        'erador, '#39'SERIE'#39' campo  From ORDEN_COMP_DET r'
      'UNION'
      
        'Select 0 ORDEN,'#39'COTIZACION_MAST'#39' tabla, max(r.NUMERO) serie, Gen' +
        '_id(GEN_NUM_COTIZA_MAST,0) generadorsec,'#39'GEN_NUM_COTIZA_MAST'#39' no' +
        'mb_generador, '#39'NUMERO'#39' campo  From COTIZACION_MAST r'
      'UNION'
      
        'Select 0 ORDEN,'#39'COTIZACION_DET'#39' tabla, max(r.SERIE) serie, Gen_i' +
        'd(GEN_NUM_COTIZA_DET,0) generadorsec,'#39'GEN_NUM_COTIZA_DET'#39' nomb_g' +
        'enerador, '#39'SERIE'#39' campo  From COTIZACION_DET r'
      'UNION'
      
        'Select 0 ORDEN,'#39'USUARIO'#39' tabla, max(r.NUMERO) serie, Gen_id(GEN_' +
        'NUMERO_USUARIO,0) generadorsec,'#39'GEN_NUMERO_USUARIO'#39' nomb_generad' +
        'or, '#39'NUMERO'#39' campo  From USUARIO r'
      'UNION'
      
        'Select 0 ORDEN,'#39'PROVEEDORES'#39' tabla, max(r.CODIGO_CTE) serie, Gen' +
        '_id(GEN_COD_PROVEEDOR,0) generadorsec,'#39'GEN_COD_PROVEEDOR'#39' nomb_g' +
        'enerador, '#39'CODIGO_CTE'#39' campo  From PROVEEDORES r'
      'UNION'
      
        'Select 0 ORDEN,'#39'CLIENTES'#39' tabla, max(r.CODIGO_CTE) serie, Gen_id' +
        '(GEN_CODIGO_CTE,0) generadorsec,'#39'GEN_CODIGO_CTE'#39' nomb_generador,' +
        ' '#39'CODIGO_CTE'#39' campo  From CLIENTES r'
      'union'
      
        'Select 0 ORDEN,'#39'VENTAS_MAST'#39' tabla, max(r.numero) serie, Gen_id(' +
        'GEN_NUM_VENTA_MAST,0) generadorsec,'#39'GEN_NUM_VENTA_MAST'#39' nomb_gen' +
        'erador, '#39'NUMERO'#39' campo  From ventas_mast r'
      'Union'
      
        'Select 0 ORDEN,'#39'VENTAS_DET'#39' tabla, max(r.serie) serie, Gen_id(GE' +
        'N_NUM_VENTA_DET,0) generadorsec,'#39'GEN_NUM_VENTA_DET'#39' nomb_generad' +
        'or, '#39'SERIE'#39' campo  From ventas_det r'
      'Union'
      
        'SeLECT 0 ORDEN,'#39'TRANS_CXC'#39' tabla,  MAX(r.SERIE) serie, GEN_ID(GE' +
        'N_SERIE_TRN_CXC,0) generadorsec,'#39'GEN_SERIE_TRN_CXC'#39' nomb_generad' +
        'or, '#39'SERIE'#39' campo  From TRANS_CXC r'
      'Union'
      
        'SeLECT 0 ORDEN,'#39'TRANS_CXP'#39' tabla,  MAX(r.SERIE) serie, GEN_ID(GE' +
        'N_SERIE_TRN_CXP,0) generadorsec,'#39'GEN_SERIE_TRN_CXP'#39' nomb_generad' +
        'or, '#39'SERIE'#39' campo  From TRANS_CXp r'
      'Union'
      
        'SeLECT 0 ORDEN,'#39'FACTURAS'#39' tabla,  MAX(r.SERIE) serie, GEN_ID(GEN' +
        '_SERIE_FACTURA,0) generadorsec,'#39'GEN_SERIE_FACTURA'#39' nomb_generado' +
        'r, '#39'SERIE'#39' campo  From FACTURAS r'
      'Union'
      
        'SeLECT 0 ORDEN,'#39'FACTURAS'#39' tabla,  MAX(r.numero) serie, GEN_ID(GE' +
        'N_NUM_FACTURA,0) generadorsec,'#39'GEN_NUM_FACTURA'#39' nomb_generador, ' +
        #39'NUMERO'#39' campo  From FACTURAS r'
      'Union'
      
        'SeLECT 0 ORDEN,'#39'FACTURAS SinNCF'#39' tabla,  null serie, GEN_ID(GEN_' +
        'NUM_FACTURA_SINNCF,0) generadorsec,'#39'GEN_NUM_FACTURA_SINNCF'#39' nomb' +
        '_generador, '#39'SERIE'#39' campo  From RDB$DATABASE'
      'Union'
      
        'SeLECT 0 ORDEN,'#39'INGRESOS NUMERO'#39' tabla,  MAX(r.NUMERO) serie, GE' +
        'N_ID(GEN_NUM_INGRESO_MAST,0) generadorsec,'#39'GEN_NUM_INGRESO_MAST'#39 +
        ' nomb_generador, '#39'NUMERO'#39' campo  From INGRESOS r'
      'Union'
      
        'SeLECT 0 ORDEN,'#39'INGRESOS_det'#39' tabla,  MAX(r.SERIE) serie, GEN_ID' +
        '(GEN_NUM_INGRESO_DET,0) generadorsec,'#39'GEN_NUM_INGRESO_DET'#39' nomb_' +
        'generador, '#39'SERIE'#39' campo  From INGRESOS_DET r'
      'Union '
      
        'SeLECT 1 ORDEN,'#39'VENTAS_MAST'#39' tabla,  MAX(R.NUMERO_FACTURA) serie' +
        ', GEN_ID(GEN_NUM_FACTURA,0) generadorsec,'#39'GEN_NUM_FACTURA'#39' nomb_' +
        'generador, '#39'NUMERO_FACTURA'#39' campo  From VENTAS_MAST r'
      'UNION'
      
        'Select 1 ORDEN,'#39'SECUENCIA'#39' tabla, max(r.secuencia) serie, NULL g' +
        'eneradorsec, '#39'NO USA GENERADOR'#39' nomb_generador, '#39'SECUENCIA'#39' CAMP' +
        'O  from secuencia r WHERE R.TIPO = 1'
      'UNION'
      
        'SeLECT 1 ORDEN,'#39'VENTAS_MAST'#39' tabla,  MAX(CAST(R.NUMERO_DOC_PAGO ' +
        'AS INTEGER)) serie, 0 generadorsec,'#39'NO USA GENERADOR'#39' nomb_gener' +
        'ador, '#39'NUMERO_DOC_PAGO'#39' campo  From VENTAS_MAST r'
      '')
    Left = 64
    Top = 232
    object qryMaxGeneradoresORDEN: TIntegerField
      FieldName = 'ORDEN'
      Required = True
    end
    object qryMaxGeneradoresTABLA: TIBStringField
      FieldName = 'TABLA'
      Required = True
      FixedChar = True
      Size = 15
    end
    object qryMaxGeneradoresSERIE: TFloatField
      FieldName = 'SERIE'
    end
    object qryMaxGeneradoresGENERADORSEC: TIntegerField
      FieldName = 'GENERADORSEC'
    end
    object qryMaxGeneradoresNOMB_GENERADOR: TIBStringField
      FieldName = 'NOMB_GENERADOR'
      Required = True
      FixedChar = True
      Size = 22
    end
    object qryMaxGeneradoresCAMPO: TIBStringField
      FieldName = 'CAMPO'
      Required = True
      FixedChar = True
      Size = 15
    end
  end
  object IBDatabase2: TIBDatabase
    DatabaseName = 'C:\Proyectos\Datos\Repositorio\PuntoVenta\Tamayo\DBSUPERG_II.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=sup2005')
    LoginPrompt = False
    DefaultTransaction = IBTransaction2
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 168
    Top = 24
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase2
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 173
    Top = 92
  end
end
