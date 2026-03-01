object dmReportes: TdmReportes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 384
  Top = 125
  Height = 640
  Width = 1024
  object qryDatosRepClientes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'iif((Select DATEDIFF( day, max(vv.FECHA), current_timestamp  ) '
      
        'from VENTAS_MAST vv where vv.CODIGO_CTE = c.codigo_cte and vv.ST' +
        'ATUS in ('#39'A'#39','#39'R'#39')) > 0,'
      '(Select DATEDIFF( day, max(vv.FECHA), current_timestamp  ) '
      
        'from VENTAS_MAST vv where vv.CODIGO_CTE = c.codigo_cte and vv.ST' +
        'ATUS in ('#39'A'#39','#39'R'#39')),'
      '0) CantDiasSinVta,'
      'c.CODZONA, s.descripcion sector,'
      '       C.CODIGO_CTE,'
      '       C.NOMBRE_FACTURAR,'
      '       T.DESCRIPCION AS DESCRIPCION_TIPOCTE,'
      '       C.NOMBRE_ABREV,'
      '       C.NOMBRE_CTE,'
      '       C.CONTACTO,'
      '       C.DIRECCION_CONT,'
      '       C.EMAIL,'
      '       C.FAX_CONTACTO,'
      '       C.FECHA_INSERTADO,'
      '       C.FECHA_MOD,'
      '       C.FORMA_PAGO,'
      '       C.FOTO,'
      '       C.LIMITE_CREDITO,'
      '       C.MONEDA_FACT,'
      '       C.PAIS,'
      '       C.STATUS_CLIENTE,'
      '       C.TELEF_CONTACTO,'
      '       C.TIPO_CLIENTE,'
      '       C.WEBSITE,       '
      '       C.CIUDAD,'
      '       C.CODIGO_AGENCIA,'
      '       C.COD_VENDEDOR,'
      '       c.DIA_RUTA,'
      '       c.CALLE,'
      '       c.MANZANA,'
      '       c.EDIFICIO,'
      '       e.NOMBRE||'#39' '#39'||e.apellido nombrevendedor,'
      
        'c.FECHA_NACIMIENTO, c.COD_CIUDAD, c.RUTA, d.DESCRIPCION DescCiud' +
        'ad, r.DESCRIPCION desc_rutavta'
      'FROM CLIENTES C'
      '   LEFT OUTER JOIN TIPO_CLIENTE T ON (C.TIPO_CLIENTE = T.CODIGO)'
      '   Left outer join CIUDAD d On d.CODIGO =c.COD_CIUDAD'
      '   left outer join RUTA_VTA r on r.CODIGO = c.RUTA '
      '   left outer JOIN EMPLEADO e on e.CODIGO = c.COD_VENDEDOR'
      '   left outer join sectores s on s.codigo = c.codzona'
      '   and s.cod_ciudad = c.cod_ciudad'
      ''
      'WHERE '
      '   ('
      '      (C.TIPO_CLIENTE = T.CODIGO)'
      '   )'
      '')
    OnFilterRecord = qryDatosRepClientesFilterRecord
    Left = 40
    Top = 29
    object qryDatosRepClientesCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryDatosRepClientesCODIGO_AGENCIA: TSmallintField
      FieldName = 'CODIGO_AGENCIA'
      Origin = 'CLIENTES.CODIGO_AGENCIA'
    end
    object qryDatosRepClientesCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryDatosRepClientesCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'CLIENTES.CONTACTO'
      Size = 30
    end
    object qryDatosRepClientesDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryDatosRepClientesEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object qryDatosRepClientesFAX_CONTACTO: TIBStringField
      FieldName = 'FAX_CONTACTO'
      Origin = 'CLIENTES.FAX_CONTACTO'
      Size = 14
    end
    object qryDatosRepClientesFECHA_INSERTADO: TDateTimeField
      FieldName = 'FECHA_INSERTADO'
      Origin = 'CLIENTES.FECHA_INSERTADO'
    end
    object qryDatosRepClientesFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CLIENTES.FECHA_MOD'
    end
    object qryDatosRepClientesFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'CLIENTES.FORMA_PAGO'
    end
    object qryDatosRepClientesFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'CLIENTES.FOTO'
      Size = 8
    end
    object qryDatosRepClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object qryDatosRepClientesMONEDA_FACT: TIBStringField
      FieldName = 'MONEDA_FACT'
      Origin = 'CLIENTES.MONEDA_FACT'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepClientesNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object qryDatosRepClientesNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryDatosRepClientesNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryDatosRepClientesPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryDatosRepClientesSTATUS_CLIENTE: TIBStringField
      FieldName = 'STATUS_CLIENTE'
      Origin = 'CLIENTES.STATUS_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepClientesTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryDatosRepClientesTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
    object qryDatosRepClientesWEBSITE: TIBStringField
      FieldName = 'WEBSITE'
      Origin = 'CLIENTES.WEBSITE'
      Size = 40
    end
    object qryDatosRepClientesDESCRIPCION_TIPOCTE: TIBStringField
      FieldName = 'DESCRIPCION_TIPOCTE'
      Origin = 'TIPO_CLIENTE.DESCRIPCION'
      Size = 30
    end
    object qryDatosRepClientesCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'CLIENTES.COD_VENDEDOR'
    end
    object qryDatosRepClientesFECHA_NACIMIENTO: TDateTimeField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'CLIENTES.FECHA_NACIMIENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDatosRepClientesCOD_CIUDAD: TIntegerField
      FieldName = 'COD_CIUDAD'
      Origin = 'CLIENTES.COD_CIUDAD'
    end
    object qryDatosRepClientesRUTA: TIntegerField
      FieldName = 'RUTA'
      Origin = 'CLIENTES.RUTA'
    end
    object qryDatosRepClientesDESCCIUDAD: TIBStringField
      FieldName = 'DESCCIUDAD'
      Origin = 'CIUDAD.DESCRIPCION'
      Size = 35
    end
    object qryDatosRepClientesDESC_RUTAVTA: TIBStringField
      FieldName = 'DESC_RUTAVTA'
      Origin = 'RUTA_VTA.DESCRIPCION'
      Size = 30
    end
    object qryDatosRepClientesDIA_RUTA: TIBStringField
      FieldName = 'DIA_RUTA'
      Origin = 'CLIENTES.DIA_RUTA'
    end
    object qryDatosRepClientesNOMBREVENDEDOR: TIBStringField
      FieldName = 'NOMBREVENDEDOR'
      Size = 71
    end
    object qryDatosRepClientesCODZONA: TIntegerField
      FieldName = 'CODZONA'
      Origin = 'CLIENTES.CODZONA'
    end
    object qryDatosRepClientesSECTOR: TIBStringField
      FieldName = 'SECTOR'
      Origin = 'SECTORES.DESCRIPCION'
      Size = 40
    end
    object qryDatosRepClientesCANTDIASSINVTA: TFloatField
      FieldName = 'CANTDIASSINVTA'
    end
    object qryDatosRepClientesCALLE: TIBStringField
      FieldName = 'CALLE'
      Origin = 'CLIENTES.CALLE'
      Size = 60
    end
    object qryDatosRepClientesMANZANA: TIBStringField
      FieldName = 'MANZANA'
      Origin = 'CLIENTES.MANZANA'
    end
    object qryDatosRepClientesEDIFICIO: TIBStringField
      FieldName = 'EDIFICIO'
      Origin = 'CLIENTES.EDIFICIO'
      Size = 40
    end
  end
  object qryResumenVentas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT FECHA, MONEDA, SUM(debito+credito) venta '
      'FROM Proc_datos_venta_diaria(:FECHAINI, :FECHAFIN)'
      'Group By MONEDA, FECHA'
      '')
    Left = 40
    Top = 80
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAFIN'
        ParamType = ptInput
      end>
  end
  object qryDatosRepVentaDiaria: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   *'
      'FROM Proc_datos_venta_diaria(:Fechaini, :Fechafin)'
      'Where moneda between :monedaini and :monedafin'
      
        'ORDER BY TIPO_DOCUMENTO, moneda, CODIGO_EMPLEADO, moneda, tipo_d' +
        'oc, tipo_tranf, FECHA, '
      'NUMERO_DOCUMENTO, CODIGO_CLIENTE')
    OnFilterRecord = qryDatosRepVentaDiariaFilterRecord
    Left = 64
    Top = 120
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Fechaini'
        ParamType = ptInput
        Value = '01/03/2012'
      end
      item
        DataType = ftDateTime
        Name = 'Fechafin'
        ParamType = ptInput
        Value = '01/04/2012'
      end
      item
        DataType = ftString
        Name = 'monedaini'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'monedafin'
        ParamType = ptInput
      end>
    object qryDatosRepVentaDiariaCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'PROC_DATOS_VENTA.CODIGO_CLIENTE'
    end
    object qryDatosRepVentaDiariaNUMERO_DOCUMENTO: TIntegerField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'PROC_DATOS_VENTA.NUMERO_DOCUMENTO'
    end
    object qryDatosRepVentaDiariaTIPO_DOCUMENTO: TIBStringField
      FieldName = 'TIPO_DOCUMENTO'
      Origin = 'PROC_DATOS_VENTA.TIPO_DOCUMENTO'
      Size = 30
    end
    object qryDatosRepVentaDiariaDEBITO: TFloatField
      FieldName = 'DEBITO'
      Origin = 'PROC_DATOS_VENTA.DEBITO'
    end
    object qryDatosRepVentaDiariaCREDITO: TFloatField
      FieldName = 'CREDITO'
      Origin = 'PROC_DATOS_VENTA.CREDITO'
    end
    object qryDatosRepVentaDiariaVALOR_DOCUMENTO: TFloatField
      FieldName = 'VALOR_DOCUMENTO'
      Origin = 'PROC_DATOS_VENTA.VALOR_DOCUMENTO'
    end
    object qryDatosRepVentaDiariaTIPO_TRANF: TSmallintField
      FieldName = 'TIPO_TRANF'
      Origin = 'PROC_DATOS_VENTA.TIPO_TRANF'
    end
    object qryDatosRepVentaDiariaMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'PROC_DATOS_VENTA.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepVentaDiariaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_DATOS_VENTA.FECHA'
    end
    object qryDatosRepVentaDiariaTIPO_DOC: TIntegerField
      FieldName = 'TIPO_DOC'
      Origin = 'PROC_DATOS_VENTA.TIPO_DOC'
    end
    object qryDatosRepVentaDiariaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROC_DATOS_VENTA.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepVentaDiariaCODIGO_EMPLEADO: TIntegerField
      FieldName = 'CODIGO_EMPLEADO'
      Origin = 'PROC_DATOS_VENTA_DIARIA.CODIGO_EMPLEADO'
    end
    object qryDatosRepVentaDiariaPRECIO_PRODUCTO: TIntegerField
      FieldName = 'PRECIO_PRODUCTO'
      Origin = 'PROC_DATOS_VENTA_DIARIA.PRECIO_PRODUCTO'
    end
    object qryDatosRepVentaDiariaDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
      Origin = 'PROC_DATOS_VENTA_DIARIA.DESCUENTO'
    end
    object qryDatosRepVentaDiariaDESCRIPCION_PRODUCTO: TIBStringField
      DisplayWidth = 80
      FieldName = 'DESCRIPCION_PRODUCTO'
      Origin = 'PROC_DATOS_VENTA_DIARIA.DESCRIPCION_PRODUCTO'
      Size = 80
    end
    object qryDatosRepVentaDiariaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PROC_DATOS_VENTA_DIARIA.CANTIDAD'
    end
    object qryDatosRepVentaDiariaDESC_PRODUCTO: TIBStringField
      FieldName = 'DESC_PRODUCTO'
      Origin = 'PROC_DATOS_VENTA_DIARIA.DESC_PRODUCTO'
      Size = 80
    end
    object qryDatosRepVentaDiariaDESC_TIPO_INVENTARIO: TIBStringField
      FieldName = 'DESC_TIPO_INVENTARIO'
      Origin = 'PROC_DATOS_VENTA_DIARIA.DESC_TIPO_INVENTARIO'
      Size = 30
    end
    object qryDatosRepVentaDiariaXTIPO_INVENTARIO: TIntegerField
      FieldName = 'XTIPO_INVENTARIO'
      Origin = 'PROC_DATOS_VENTA_DIARIA.XTIPO_INVENTARIO'
    end
    object qryDatosRepVentaDiariaNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'PROC_DATOS_VENTA_DIARIA.NUMERO_TRN'
    end
    object qryDatosRepVentaDiariaCODIGO_PRODUCTO: TIBStringField
      FieldName = 'CODIGO_PRODUCTO'
      Origin = 'PROC_DATOS_VENTA_DIARIA.CODIGO_PRODUCTO'
      Size = 40
    end
    object qryDatosRepVentaDiariaSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'PROC_DATOS_VENTA_DIARIA.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepVentaDiariaMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'PROC_DATOS_VENTA_DIARIA.MONTO_INICIAL'
    end
    object qryDatosRepVentaDiariaNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'PROC_DATOS_VENTA_DIARIA.NOMBRE_FACTURAR'
      Size = 80
    end
    object qryDatosRepVentaDiariaNOMBRE_VENDEDOR: TIBStringField
      FieldName = 'NOMBRE_VENDEDOR'
      Origin = 'PROC_DATOS_VENTA_DIARIA.NOMBRE_VENDEDOR'
      Size = 35
    end
    object qryDatosRepVentaDiariaNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'PROC_DATOS_VENTA_DIARIA.NUMERO_FACTURA'
    end
    object qryDatosRepVentaDiariaMONTO_RECIBIDO: TFloatField
      FieldName = 'MONTO_RECIBIDO'
      Origin = 'PROC_DATOS_VENTA_DIARIA.MONTO_RECIBIDO'
    end
    object qryDatosRepVentaDiariaESCXC: TSmallintField
      FieldName = 'ESCXC'
      Origin = 'PROC_DATOS_VENTA_DIARIA.ESCXC'
    end
    object qryDatosRepVentaDiariaNUM_TRANSFERENCIA: TIntegerField
      FieldName = 'NUM_TRANSFERENCIA'
      Origin = 'PROC_DATOS_VENTA_DIARIA.NUM_TRANSFERENCIA'
    end
  end
  object qryDatosRepVentaMesxDia: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM PROC_DATOS_VENTA_DIA_MES (:FECHAINI,:FECHAFIN)')
    Left = 176
    Top = 48
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAFIN'
        ParamType = ptInput
      end>
    object qryDatosRepVentaMesxDiaMES: TSmallintField
      FieldName = 'MES'
      Origin = 'PROC_DATOS_VENTA_DIA_MES.MES'
    end
    object qryDatosRepVentaMesxDiaDIA: TSmallintField
      FieldName = 'DIA'
      Origin = 'PROC_DATOS_VENTA_DIA_MES.DIA'
    end
    object qryDatosRepVentaMesxDiaMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'PROC_DATOS_VENTA_DIA_MES.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepVentaMesxDiaMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'PROC_DATOS_VENTA_DIA_MES.MONTO'
    end
  end
  object rxDatosOrganizadosDiaxMes: TRxMemoryData
    FieldDefs = <
      item
        Name = 'rxDatosOrganizadosDiaxMesField1'
        DataType = ftFloat
      end>
    Left = 192
    Top = 96
  end
  object qryVigenciaCxc: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  * from '
      'VIEW_ANTIGUEDAD_CXC'
      'order by MORAENDIAS desc')
    Left = 168
    Top = 144
    object qryVigenciaCxcCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'VIEW_ANTIGUEDAD_CXC.CODIGO'
    end
    object qryVigenciaCxcNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'VIEW_ANTIGUEDAD_CXC.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryVigenciaCxcFECHA_BCE: TDateTimeField
      FieldName = 'FECHA_BCE'
      Origin = 'VIEW_ANTIGUEDAD_CXC.FECHA_BCE'
    end
    object qryVigenciaCxcFECHA_ULT_PAGO: TDateTimeField
      FieldName = 'FECHA_ULT_PAGO'
      Origin = 'VIEW_ANTIGUEDAD_CXC.FECHA_ULT_PAGO'
    end
    object qryVigenciaCxcMORAENDIAS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'MORAENDIAS'
      Origin = 'VIEW_ANTIGUEDAD_CXC.MORAENDIAS'
      ReadOnly = True
    end
    object qryVigenciaCxcMORAENMESES: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'MORAENMESES'
      Origin = 'VIEW_ANTIGUEDAD_CXC.MORAENMESES'
      ReadOnly = True
    end
    object qryVigenciaCxcBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'VIEW_ANTIGUEDAD_CXC.BALANCE_ACT'
    end
    object qryVigenciaCxcNOMBRE_FACTURAR1: TIBStringField
      FieldName = 'NOMBRE_FACTURAR1'
      Origin = 'VIEW_ANTIGUEDAD_CXC.NOMBRE_FACTURAR1'
      Size = 40
    end
    object qryVigenciaCxcFECHA_BCE1: TDateTimeField
      FieldName = 'FECHA_BCE1'
      Origin = 'VIEW_ANTIGUEDAD_CXC.FECHA_BCE1'
    end
  end
  object qryResumenDespacho: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *'
      'FROM PROC_DATOS_DESPACHO_DIARIO(:FECHAINI, :FECHAFIN)'
      'ORDER BY CODIGO_CLIENTE,  FECHA'
      '')
    Left = 48
    Top = 200
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAFIN'
        ParamType = ptInput
      end>
  end
  object qryDatosRepInventario: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from INVENTARIO_PRODUCTO'
      'order by CODIGO')
    Left = 64
    Top = 232
    object qryDatosRepInventarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryDatosRepInventarioCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryDatosRepInventarioFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'INVENTARIO_PRODUCTO.FECHA'
    end
    object qryDatosRepInventarioCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
    object qryDatosRepInventarioTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object qryDatosRepInventarioDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryDatosRepInventarioCANTIDAD_REORDEN: TIntegerField
      FieldName = 'CANTIDAD_REORDEN'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD_REORDEN'
    end
    object qryDatosRepInventarioPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ANT'
    end
    object qryDatosRepInventarioCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryDatosRepInventarioPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryDatosRepInventarioBLCE_CANT_ENTRADA: TFloatField
      FieldName = 'BLCE_CANT_ENTRADA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_ENTRADA'
    end
    object qryDatosRepInventarioBLCE_CANT_SALIDA: TFloatField
      FieldName = 'BLCE_CANT_SALIDA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_SALIDA'
    end
    object qryDatosRepInventarioFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN'
    end
    object qryDatosRepInventarioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INVENTARIO_PRODUCTO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepInventarioPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'INVENTARIO_PRODUCTO.PORC_DESCUENTO'
    end
    object qryDatosRepInventarioFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'INVENTARIO_PRODUCTO.FOTO'
      Size = 8
    end
    object qryDatosRepInventarioPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
    end
    object qryDatosRepInventarioCODIGO_PRECIO: TIBStringField
      FieldName = 'CODIGO_PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_PRECIO'
      FixedChar = True
      Size = 6
    end
    object qryDatosRepInventarioUNIDAD: TFloatField
      FieldName = 'UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.UNIDAD'
    end
    object qryDatosRepInventarioPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryDatosRepInventarioPRECIO_MINIMO: TFloatField
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
    object qryDatosRepInventarioREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object qryDatosRepInventarioFECHA_VENCIMIENTO: TDateTimeField
      FieldName = 'FECHA_VENCIMIENTO'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_VENCIMIENTO'
    end
    object qryDatosRepInventarioINVENTARIAR: TSmallintField
      FieldName = 'INVENTARIAR'
      Origin = 'INVENTARIO_PRODUCTO.INVENTARIAR'
    end
    object qryDatosRepInventarioPRECIO_TIPO_UNIDAD: TFloatField
      FieldName = 'PRECIO_TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_TIPO_UNIDAD'
    end
    object qryDatosRepInventarioTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.TIPO_UNIDAD'
    end
    object qryDatosRepInventarioORIGEN: TIntegerField
      FieldName = 'ORIGEN'
      Origin = 'INVENTARIO_PRODUCTO.ORIGEN'
    end
    object qryDatosRepInventarioUBICACION: TIBStringField
      FieldName = 'UBICACION'
      Origin = 'INVENTARIO_PRODUCTO.UBICACION'
      Size = 50
    end
    object qryDatosRepInventarioREFERENCIA_ALTERNA: TIBStringField
      FieldName = 'REFERENCIA_ALTERNA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA_ALTERNA'
      Size = 50
    end
    object qryDatosRepInventarioMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'INVENTARIO_PRODUCTO.MARCA'
      Size = 50
    end
    object qryDatosRepInventarioMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'INVENTARIO_PRODUCTO.MODELO'
      Size = 50
    end
    object qryDatosRepInventarioPRECIOVENTA1: TFloatField
      FieldName = 'PRECIOVENTA1'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA1'
    end
    object qryDatosRepInventarioPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA2'
    end
    object qryDatosRepInventarioPRECIOVENTA3: TFloatField
      FieldName = 'PRECIOVENTA3'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA3'
    end
    object qryDatosRepInventarioPRECIOVENTA4: TFloatField
      FieldName = 'PRECIOVENTA4'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA4'
    end
    object qryDatosRepInventarioPORCUTILIDAD1: TFloatField
      FieldName = 'PORCUTILIDAD1'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD1'
    end
    object qryDatosRepInventarioPORCUTILIDAD2: TFloatField
      FieldName = 'PORCUTILIDAD2'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD2'
    end
    object qryDatosRepInventarioPORCUTILIDAD3: TFloatField
      FieldName = 'PORCUTILIDAD3'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD3'
    end
    object qryDatosRepInventarioPORCUTILIDAD4: TFloatField
      FieldName = 'PORCUTILIDAD4'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD4'
    end
    object qryDatosRepInventarioUSARLEVELPRECIO: TSmallintField
      FieldName = 'USARLEVELPRECIO'
      Origin = 'INVENTARIO_PRODUCTO.USARLEVELPRECIO'
    end
    object qryDatosRepInventarioCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'INVENTARIO_PRODUCTO.CIA_KEY'
    end
    object qryDatosRepInventarioSITUACIONPROD: TSmallintField
      FieldName = 'SITUACIONPROD'
      Origin = 'INVENTARIO_PRODUCTO.SITUACIONPROD'
    end
    object qryDatosRepInventarioAPLICAIMPTOCOMPRA: TSmallintField
      FieldName = 'APLICAIMPTOCOMPRA'
      Origin = 'INVENTARIO_PRODUCTO.APLICAIMPTOCOMPRA'
    end
    object qryDatosRepInventarioCODFABRICANTE: TIntegerField
      FieldName = 'CODFABRICANTE'
      Origin = 'INVENTARIO_PRODUCTO.CODFABRICANTE'
    end
    object qryDatosRepInventarioCTAINVENTARIO: TIBStringField
      FieldName = 'CTAINVENTARIO'
      Origin = 'INVENTARIO_PRODUCTO.CTAINVENTARIO'
      Size = 7
    end
    object qryDatosRepInventarioCTAVENTA: TIBStringField
      FieldName = 'CTAVENTA'
      Origin = 'INVENTARIO_PRODUCTO.CTAVENTA'
      Size = 7
    end
    object qryDatosRepInventarioCTACOMPRA: TIBStringField
      FieldName = 'CTACOMPRA'
      Origin = 'INVENTARIO_PRODUCTO.CTACOMPRA'
      Size = 7
    end
    object qryDatosRepInventarioCODSUBCATEGORIA: TIntegerField
      FieldName = 'CODSUBCATEGORIA'
      Origin = 'INVENTARIO_PRODUCTO.CODSUBCATEGORIA'
    end
    object qryDatosRepInventarioCODCATEGORIA: TIntegerField
      FieldName = 'CODCATEGORIA'
      Origin = 'INVENTARIO_PRODUCTO.CODCATEGORIA'
    end
    object qryDatosRepInventarioPORCITBIS: TFloatField
      FieldName = 'PORCITBIS'
      Origin = 'INVENTARIO_PRODUCTO.PORCITBIS'
    end
    object qryDatosRepInventarioCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'INVENTARIO_PRODUCTO.COD_MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepInventarioKILOMETROS: TFloatField
      FieldName = 'KILOMETROS'
      Origin = 'INVENTARIO_PRODUCTO.KILOMETROS'
    end
  end
  object qryDatosResumenBeneficioBruto: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Inventario_producto.CODIGO_TEXTO, '
      'Inventario_producto.CODIGO,'
      'Inventario_producto.DESCRIPCION, '
      'Ventas_det.PRECIO,'
      'Precio_inventario.PRECIO_DISTRIBUIDOR,'
      'SUM(Ventas_det.CANTIDAD) CANT, '
      'SUM(Ventas_det.VALOR_TOTAL_DET) MONTO,'
      'SUM(Ventas_det.VALOR_TOTAL_DET) -'
      
        'sum(Precio_inventario.PRECIO_DISTRIBUIDOR * Ventas_det.CANTIDAD)' +
        ' Beneficio'
      ''
      'FROM VENTAS_MAST Ventas_mast'
      '   INNER JOIN VENTAS_DET Ventas_det'
      '   ON  (Ventas_mast.NUMERO = Ventas_det.NUMERO)  '
      '   INNER JOIN INVENTARIO_PRODUCTO Inventario_producto'
      
        '   ON  (Ventas_det.CODIGO_PROD = Inventario_producto.CODIGO_TEXT' +
        'O)  '
      '   INNER JOIN PRECIO_INVENTARIO Precio_inventario'
      
        '   ON  (Inventario_producto.CODIGO_TEXTO = Precio_inventario.COD' +
        'IGO_TEXTO)  '
      'Where Ventas_mast.FECHA Between :fechaini and :fechafin'
      'GROUP BY '
      'Inventario_producto.CODIGO_TEXTO, '
      'Inventario_producto.CODIGO,'
      'Inventario_producto.DESCRIPCION, '
      'Ventas_det.PRECIO,'
      'Precio_inventario.PRECIO_DISTRIBUIDOR')
    Left = 176
    Top = 208
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryDatosResumenBeneficioBrutoCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Size = 40
    end
    object qryDatosResumenBeneficioBrutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object qryDatosResumenBeneficioBrutoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object qryDatosResumenBeneficioBrutoPRECIO: TFloatField
      FieldName = 'PRECIO'
    end
    object qryDatosResumenBeneficioBrutoPRECIO_DISTRIBUIDOR: TFloatField
      FieldName = 'PRECIO_DISTRIBUIDOR'
    end
    object qryDatosResumenBeneficioBrutoCANT: TFloatField
      FieldName = 'CANT'
    end
    object qryDatosResumenBeneficioBrutoMONTO: TFloatField
      FieldName = 'MONTO'
    end
    object qryDatosResumenBeneficioBrutoBENEFICIO: TFloatField
      FieldName = 'BENEFICIO'
    end
  end
  object qryPrecioInventario: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT PRECIO_INVENTARIO.CODIGO_TEXTO,'
      '       PRECIO_INVENTARIO.FECHA_INICIAL,'
      '       PRECIO_INVENTARIO.FECHA_FINAL,'
      '       INVENTARIO_PRODUCTO.DESCRIPCION,'
      '       PRECIO_INVENTARIO.PRECIO_DISTRIBUIDOR,'
      '       PRECIO_INVENTARIO.PRECIO_UNITARIO,'
      '       PRECIO_INVENTARIO.MARGENES,'
      '       PRECIO_INVENTARIO.PRECIOS_EN_GENERAL,'
      '       INVENTARIO_PRODUCTO.CANTIDAD,'
      '       INVENTARIO_PRODUCTO.UNIDAD,'
      '       INVENTARIO_PRODUCTO.CODIGO'
      'FROM INVENTARIO_PRODUCTO'
      
        '   INNER JOIN PRECIO_INVENTARIO ON (INVENTARIO_PRODUCTO.CODIGO_T' +
        'EXTO = PRECIO_INVENTARIO.CODIGO_TEXTO)'
      'ORDER BY INVENTARIO_PRODUCTO.CODIGO')
    Left = 168
    Top = 264
    object qryPrecioInventarioCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'PRECIO_INVENTARIO.CODIGO_TEXTO'
      Required = True
      Size = 40
    end
    object qryPrecioInventarioFECHA_INICIAL: TDateTimeField
      FieldName = 'FECHA_INICIAL'
      Origin = 'PRECIO_INVENTARIO.FECHA_INICIAL'
      Required = True
    end
    object qryPrecioInventarioFECHA_FINAL: TDateTimeField
      FieldName = 'FECHA_FINAL'
      Origin = 'PRECIO_INVENTARIO.FECHA_FINAL'
      Required = True
    end
    object qryPrecioInventarioDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryPrecioInventarioPRECIO_DISTRIBUIDOR: TFloatField
      FieldName = 'PRECIO_DISTRIBUIDOR'
      Origin = 'PRECIO_INVENTARIO.PRECIO_DISTRIBUIDOR'
    end
    object qryPrecioInventarioPRECIO_UNITARIO: TFloatField
      FieldName = 'PRECIO_UNITARIO'
      Origin = 'PRECIO_INVENTARIO.PRECIO_UNITARIO'
    end
    object qryPrecioInventarioMARGENES: TFloatField
      FieldName = 'MARGENES'
      Origin = 'PRECIO_INVENTARIO.MARGENES'
    end
    object qryPrecioInventarioPRECIOS_EN_GENERAL: TFloatField
      FieldName = 'PRECIOS_EN_GENERAL'
      Origin = 'PRECIO_INVENTARIO.PRECIOS_EN_GENERAL'
    end
    object qryPrecioInventarioCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryPrecioInventarioUNIDAD: TFloatField
      FieldName = 'UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.UNIDAD'
    end
    object qryPrecioInventarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
  end
  object qryRepInventarioProdMasBclRuta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepInventarioProdMasBclRutaAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From  proc_datos_rep_inventario')
    Left = 232
    Top = 304
    object qryRepInventarioProdMasBclRutaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PROC_DATOS_REP_INVENTARIO.CANTIDAD'
    end
    object qryRepInventarioProdMasBclRutaUNIDAD: TFloatField
      FieldName = 'UNIDAD'
      Origin = 'PROC_DATOS_REP_INVENTARIO.UNIDAD'
    end
    object qryRepInventarioProdMasBclRutaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'PROC_DATOS_REP_INVENTARIO.CODIGO'
    end
    object qryRepInventarioProdMasBclRutaPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'PROC_DATOS_REP_INVENTARIO.PRECIO'
    end
    object qryRepInventarioProdMasBclRutaFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'PROC_DATOS_REP_INVENTARIO.FECHA_ULTIMA_TRN'
    end
    object qryRepInventarioProdMasBclRutaCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'PROC_DATOS_REP_INVENTARIO.CODIGO_TEXTO'
      Size = 40
    end
    object qryRepInventarioProdMasBclRutaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_DATOS_REP_INVENTARIO.FECHA'
    end
    object qryRepInventarioProdMasBclRutaCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'PROC_DATOS_REP_INVENTARIO.CODIGO_BARRA'
      Size = 40
    end
    object qryRepInventarioProdMasBclRutaTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'PROC_DATOS_REP_INVENTARIO.TIPO'
    end
    object qryRepInventarioProdMasBclRutaCANTIDAD_REORDEN: TIntegerField
      FieldName = 'CANTIDAD_REORDEN'
      Origin = 'PROC_DATOS_REP_INVENTARIO.CANTIDAD_REORDEN'
    end
    object qryRepInventarioProdMasBclRutaPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'PROC_DATOS_REP_INVENTARIO.PRECIO_ANT'
    end
    object qryRepInventarioProdMasBclRutaBLCE_CANT_ENTRADA: TFloatField
      FieldName = 'BLCE_CANT_ENTRADA'
      Origin = 'PROC_DATOS_REP_INVENTARIO.BLCE_CANT_ENTRADA'
    end
    object qryRepInventarioProdMasBclRutaBLCE_CANT_SALIDA: TFloatField
      FieldName = 'BLCE_CANT_SALIDA'
      Origin = 'PROC_DATOS_REP_INVENTARIO.BLCE_CANT_SALIDA'
    end
    object qryRepInventarioProdMasBclRutaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROC_DATOS_REP_INVENTARIO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepInventarioProdMasBclRutaPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'PROC_DATOS_REP_INVENTARIO.PORC_DESCUENTO'
    end
    object qryRepInventarioProdMasBclRutaFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'PROC_DATOS_REP_INVENTARIO.FOTO'
      Size = 8
    end
    object qryRepInventarioProdMasBclRutaPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'PROC_DATOS_REP_INVENTARIO.PAGA_ITBI'
    end
    object qryRepInventarioProdMasBclRutaCODIGO_PRECIO: TIBStringField
      FieldName = 'CODIGO_PRECIO'
      Origin = 'PROC_DATOS_REP_INVENTARIO.CODIGO_PRECIO'
      FixedChar = True
      Size = 6
    end
    object qryRepInventarioProdMasBclRutaBALANCE_EN_RUTA: TFloatField
      FieldName = 'BALANCE_EN_RUTA'
      Origin = 'PROC_DATOS_REP_INVENTARIO.BALANCE_EN_RUTA'
    end
    object qryRepInventarioProdMasBclRutaPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'PROC_DATOS_REP_INVENTARIO.PRECIO_COMPRA'
    end
    object qryRepInventarioProdMasBclRutaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROC_DATOS_REP_INVENTARIO.DESCRIPCION'
      Size = 80
    end
    object qryRepInventarioProdMasBclRutaCODFABRICANTE: TIntegerField
      FieldName = 'CODFABRICANTE'
      Origin = 'PROC_DATOS_REP_INVENTARIO.CODFABRICANTE'
    end
    object qryRepInventarioProdMasBclRutaDescProveedor: TStringField
      FieldKind = fkLookup
      FieldName = 'DescProveedor'
      LookupDataSet = qryProvInvLook
      LookupKeyFields = 'CODIGO_CTE'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'CODFABRICANTE'
      Size = 80
      Lookup = True
    end
    object qryRepInventarioProdMasBclRutaGRUPO_TIPO: TIBStringField
      FieldName = 'GRUPO_TIPO'
      Origin = 'PROC_DATOS_REP_INVENTARIO.GRUPO_TIPO'
      Size = 30
    end
  end
  object qryDatosRepVxCajas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qryDatosRepVxCajasCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  RUTA,'
      '  FECHA,'
      '  CODIGO_EMP ,'
      '  CODIGO_PROD,'
      '  CANTIDAD,'
      '  NOMBRE,'
      '  APELLIDO,'
      '  nombre||" "||apellido nombrecompleto,'
      '  DESCRIPCION,'
      '  PRECIO'
      ''
      ' FROM PROC_DATOS_VENTA_CXRUTA ('
      '  :FECHAINI,  :FECHAFIN)'
      'ORDER BY FECHA, RUTA, CODIGO_EMP, CODIGO_PROD_INV')
    Left = 64
    Top = 296
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAFIN'
        ParamType = ptInput
      end>
    object qryDatosRepVxCajasRUTA: TIntegerField
      FieldName = 'RUTA'
      Origin = 'PROC_DATOS_VENTA_CXRUTA.RUTA'
    end
    object qryDatosRepVxCajasFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_DATOS_VENTA_CXRUTA.FECHA'
    end
    object qryDatosRepVxCajasCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'PROC_DATOS_VENTA_CXRUTA.CODIGO_EMP'
    end
    object qryDatosRepVxCajasCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'PROC_DATOS_VENTA_CXRUTA.CODIGO_PROD'
      Size = 12
    end
    object qryDatosRepVxCajasCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PROC_DATOS_VENTA_CXRUTA.CANTIDAD'
    end
    object qryDatosRepVxCajasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROC_DATOS_VENTA_CXRUTA.DESCRIPCION'
      Size = 40
    end
    object qryDatosRepVxCajasPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'PROC_DATOS_VENTA_CXRUTA.PRECIO'
    end
    object qryDatosRepVxCajasMonto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Monto'
      Calculated = True
    end
    object qryDatosRepVxCajasNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'PROC_DATOS_VENTA_CXRUTA.NOMBRE'
      Size = 35
    end
    object qryDatosRepVxCajasAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'PROC_DATOS_VENTA_CXRUTA.APELLIDO'
      Size = 35
    end
    object qryDatosRepVxCajasNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Size = 71
    end
  end
  object qryDatosRepVxCajasResumen: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qryDatosRepVxCajasResumenCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  RUTA,'
      '  CODIGO_EMP ,'
      '  CODIGO_PROD,'
      '  SUM(CANTIDAD) CANTIDAD,'
      '  NOMBRE,'
      '  APELLIDO,'
      '  nombre||" "||apellido nombrecompleto,'
      '  DESCRIPCION,'
      '  PRECIO'
      ''
      ' FROM PROC_DATOS_VENTA_CXRUTA ('
      '  :FECHAINI,  :FECHAFIN)'
      ''
      'GROUP BY'
      '  RUTA,'
      '  CODIGO_EMP ,'
      '  CODIGO_PROD,'
      '  '
      '  NOMBRE,'
      '  APELLIDO,'
      '  Nombre, '
      '  Apellido,'
      '  DESCRIPCION,'
      '  PRECIO'
      'ORDER BY RUTA, FECHA, CODIGO_EMP, CODIGO_PROD_INV')
    Left = 64
    Top = 352
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAINI'
        ParamType = ptInput
        Value = '31-03-2006'
      end
      item
        DataType = ftDateTime
        Name = 'FECHAFIN'
        ParamType = ptInput
        Value = '01-01-2006'
      end>
    object qryDatosRepVxCajasResumenCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Size = 40
    end
    object qryDatosRepVxCajasResumenRUTA: TIntegerField
      FieldName = 'RUTA'
    end
    object qryDatosRepVxCajasResumenCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
    end
    object qryDatosRepVxCajasResumenCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
    end
    object qryDatosRepVxCajasResumenNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 35
    end
    object qryDatosRepVxCajasResumenAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Size = 35
    end
    object qryDatosRepVxCajasResumenNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Size = 71
    end
    object qryDatosRepVxCajasResumenDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object qryDatosRepVxCajasResumenPRECIO: TFloatField
      FieldName = 'PRECIO'
    end
    object qryDatosRepVxCajasResumenMonto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Monto'
      Calculated = True
    end
  end
  object qryRepTransOpeDiaria: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT TRANS_OPERACION_MASTER.NUMERO,'
      '       TRANS_OPERACION_MASTER.COD_PROVEEDOR,'
      '       PROVEEDORES.RNC_PROVEEDOR,'
      '       TRANS_OPERACION_MASTER.FECHA,'
      '       TRANS_OPERACION_MASTER.FPAGO,'
      '       TRANS_OPERACION_MASTER.OBSERVACION,'
      '       TRANS_OPERACION_MASTER.MONTO,'
      '       TRANS_OPERACION_MASTER.STATUS,'
      '       TRANS_OPERACION_MASTER.STATUS_CNT,'
      '       TRANS_OPERACION_MASTER.IN_POR,'
      '       TRANS_OPERACION_MASTER.FECHA_IN,'
      '       TRANS_OPERACION_MASTER.MOD_POR,'
      '       TRANS_OPERACION_MASTER.FECHA_MOD,'
      '       TRANS_OPERACION_DET.SERIE,'
      '       TRANS_OPERACION_DET.COD_SERV_PROD,'
      '       TRANS_OPERACION_DET.DEPARTAMENTO,'
      '       TRANS_OPERACION_DET.OBSERVACION,'
      'TRANS_OPERACION_MASTER.IDCODIGO_TPAGODGII,'
      '       TRANS_OPERACION_DET.CANTIDAD,'
      '       TRANS_OPERACION_DET.PRECIO,'
      '       TRANS_OPERACION_DET.VALOR,'
      '       TRANS_OPERACION_DET.monto_itbis,'
      '       TRANS_OPERACION_DET.NUMERO_DOCUMENTO,'
      '       TRANS_OPERACION_DET.NUMERO_FACTURA,'
      '       TRANS_OPERACION_DET.COD_CTA_CONCEPTO,'
      '       TRANS_OPERACION_DET.CODIGO_USUARIO,'
      '       TRANS_OPERACION_DET.STATUS,'
      '       TRANS_OPERACION_DET.IDTASAITBIS,'
      '       TASA_ITBIS.DESCRIPCION DESC_TASAITBIS,'
      '       PROVEEDORES.DESCRIPCION nombreproveedor,'
      '       CENTRO_COSTO.NOMBRE nombre_centro_costo,'
      '       DEPTOS.NOMBRE nombre_departamento,'
      '       EMPLEADO.NOMBRE||" "||  EMPLEADO.APELLIDO nombreusuario,'
      
        '       TRANS_OPERACION_DET.FICHA_VEH,tcd.descripcion descfpagoDg' +
        'ii,'
      
        '       v.ROTULO, v.PLACA, TRANS_OPERACION_MASTER.NUMERO_NCF, TRA' +
        'NS_OPERACION_MASTER.IDTIPO_COMPRA, TIPO_COMPRA.DESCRIPCION DescT' +
        'ipoCompra'
      'FROM EMPLEADO'
      
        '   RIGHT OUTER JOIN TRANS_OPERACION_DET ON (EMPLEADO.CODIGO = TR' +
        'ANS_OPERACION_DET.CODIGO_USUARIO)'
      
        '   INNER JOIN TRANS_OPERACION_MASTER ON (TRANS_OPERACION_DET.NUM' +
        'ERO = TRANS_OPERACION_MASTER.NUMERO)'
      
        '   LEFT OUTER JOIN PROVEEDORES ON (TRANS_OPERACION_MASTER.COD_PR' +
        'OVEEDOR = PROVEEDORES.CODIGO_CTE)'
      
        '   LEFT OUTER JOIN CENTRO_COSTO ON (TRANS_OPERACION_DET.COD_CTA_' +
        'CONCEPTO = CENTRO_COSTO.CODIGO)'
      
        '   LEFT OUTER JOIN TASA_ITBIS ON (TRANS_OPERACION_DET.IDTASAITBI' +
        'S = TASA_ITBIS.IDTASAITBIS)'
      
        '   INNER JOIN DEPTOS ON (TRANS_OPERACION_DET.DEPARTAMENTO = DEPT' +
        'OS.CODIGO)'
      
        '   left outer join VEHICULO v on v.FICHA = TRANS_OPERACION_DET.F' +
        'ICHA_VEH'
      
        '   left outer join TIPO_COMPRA on TIPO_COMPRA.TIPO = TRANS_OPERA' +
        'CION_MASTER.IDTIPO_COMPRA'
      
        '   left outer join TIPO_CXP_DGII tcd on tcd.codigo =  TRANS_OPER' +
        'ACION_MASTER.IDCODIGO_TPAGODGII'
      
        'Where TRANS_OPERACION_MASTER.fecha between :fechaini and :fechaf' +
        'in'
      'Order By  TRANS_OPERACION_DET.CODIGO_USUARIO ,'
      'TRANS_OPERACION_DET.IDTASAITBIS,'
      'TRANS_OPERACION_MASTER.FECHA,'
      'TRANS_OPERACION_MASTER.NUMERO'
      ''
      ''
      '')
    OnFilterRecord = qryRepTransOpeDiariaFilterRecord
    Left = 189
    Top = 376
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryRepTransOpeDiariaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TRANS_OPERACION_MASTER.NUMERO'
      Required = True
    end
    object qryRepTransOpeDiariaCOD_PROVEEDOR: TIntegerField
      FieldName = 'COD_PROVEEDOR'
      Origin = 'TRANS_OPERACION_MASTER.COD_PROVEEDOR'
      Required = True
    end
    object qryRepTransOpeDiariaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'TRANS_OPERACION_MASTER.FECHA'
      Required = True
    end
    object qryRepTransOpeDiariaFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'TRANS_OPERACION_MASTER.FPAGO'
    end
    object qryRepTransOpeDiariaOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'TRANS_OPERACION_MASTER.OBSERVACION'
      Size = 40
    end
    object qryRepTransOpeDiariaMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'TRANS_OPERACION_MASTER.MONTO'
    end
    object qryRepTransOpeDiariaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRANS_OPERACION_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepTransOpeDiariaSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'TRANS_OPERACION_MASTER.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryRepTransOpeDiariaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TRANS_OPERACION_MASTER.IN_POR'
      Size = 12
    end
    object qryRepTransOpeDiariaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TRANS_OPERACION_MASTER.FECHA_IN'
    end
    object qryRepTransOpeDiariaMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'TRANS_OPERACION_MASTER.MOD_POR'
      Size = 12
    end
    object qryRepTransOpeDiariaFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'TRANS_OPERACION_MASTER.FECHA_MOD'
    end
    object qryRepTransOpeDiariaSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'TRANS_OPERACION_DET.SERIE'
      Required = True
    end
    object qryRepTransOpeDiariaCOD_SERV_PROD: TIntegerField
      FieldName = 'COD_SERV_PROD'
      Origin = 'TRANS_OPERACION_DET.COD_SERV_PROD'
    end
    object qryRepTransOpeDiariaDEPARTAMENTO: TIntegerField
      FieldName = 'DEPARTAMENTO'
      Origin = 'TRANS_OPERACION_DET.DEPARTAMENTO'
    end
    object qryRepTransOpeDiariaOBSERVACION1: TIBStringField
      FieldName = 'OBSERVACION1'
      Origin = 'TRANS_OPERACION_DET.OBSERVACION'
      Size = 40
    end
    object qryRepTransOpeDiariaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'TRANS_OPERACION_DET.CANTIDAD'
    end
    object qryRepTransOpeDiariaPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'TRANS_OPERACION_DET.PRECIO'
    end
    object qryRepTransOpeDiariaVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'TRANS_OPERACION_DET.VALOR'
    end
    object qryRepTransOpeDiariaNUMERO_DOCUMENTO: TIntegerField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'TRANS_OPERACION_DET.NUMERO_DOCUMENTO'
    end
    object qryRepTransOpeDiariaNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'TRANS_OPERACION_DET.NUMERO_FACTURA'
    end
    object qryRepTransOpeDiariaCOD_CTA_CONCEPTO: TIntegerField
      FieldName = 'COD_CTA_CONCEPTO'
      Origin = 'TRANS_OPERACION_DET.COD_CTA_CONCEPTO'
    end
    object qryRepTransOpeDiariaCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'TRANS_OPERACION_DET.CODIGO_USUARIO'
    end
    object qryRepTransOpeDiariaSTATUS1: TIBStringField
      FieldName = 'STATUS1'
      Origin = 'TRANS_OPERACION_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepTransOpeDiariaNOMBREPROVEEDOR: TIBStringField
      FieldName = 'NOMBREPROVEEDOR'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 40
    end
    object qryRepTransOpeDiariaNOMBRE_CENTRO_COSTO: TIBStringField
      FieldName = 'NOMBRE_CENTRO_COSTO'
      Origin = 'CENTRO_COSTO.NOMBRE'
      Size = 30
    end
    object qryRepTransOpeDiariaNOMBRE_DEPARTAMENTO: TIBStringField
      FieldName = 'NOMBRE_DEPARTAMENTO'
      Origin = 'DEPTOS.NOMBRE'
      Size = 40
    end
    object qryRepTransOpeDiariaNOMBREUSUARIO: TIBStringField
      FieldName = 'NOMBREUSUARIO'
      Size = 71
    end
    object qryRepTransOpeDiariaMONTO_ITBIS: TFloatField
      FieldName = 'MONTO_ITBIS'
      Origin = 'TRANS_OPERACION_DET.MONTO_ITBIS'
    end
    object qryRepTransOpeDiariaIDTASAITBIS: TIntegerField
      FieldName = 'IDTASAITBIS'
      Origin = 'TRANS_OPERACION_DET.IDTASAITBIS'
    end
    object qryRepTransOpeDiariaDESC_TASAITBIS: TIBStringField
      FieldName = 'DESC_TASAITBIS'
      Origin = 'TASA_ITBIS.DESCRIPCION'
    end
    object qryRepTransOpeDiariaFICHA_VEH: TIntegerField
      FieldName = 'FICHA_VEH'
      Origin = 'TRANS_OPERACION_DET.FICHA_VEH'
    end
    object qryRepTransOpeDiariaROTULO: TIBStringField
      FieldName = 'ROTULO'
      Origin = 'VEHICULO.ROTULO'
    end
    object qryRepTransOpeDiariaPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'VEHICULO.PLACA'
    end
    object qryRepTransOpeDiariaNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'TRANS_OPERACION_MASTER.NUMERO_NCF'
      Size = 21
    end
    object qryRepTransOpeDiariaIDTIPO_COMPRA: TIntegerField
      FieldName = 'IDTIPO_COMPRA'
      Origin = 'TRANS_OPERACION_MASTER.IDTIPO_COMPRA'
    end
    object qryRepTransOpeDiariaDESCTIPOCOMPRA: TIBStringField
      FieldName = 'DESCTIPOCOMPRA'
      Origin = 'TIPO_COMPRA.DESCRIPCION'
      Size = 120
    end
    object qryRepTransOpeDiariaDESCFPAGODGII: TIBStringField
      FieldName = 'DESCFPAGODGII'
      Origin = 'TIPO_CXP_DGII.DESCRIPCION'
      Size = 60
    end
    object qryRepTransOpeDiariaIDCODIGO_TPAGODGII: TSmallintField
      FieldName = 'IDCODIGO_TPAGODGII'
      Origin = 'TRANS_OPERACION_MASTER.IDCODIGO_TPAGODGII'
    end
    object qryRepTransOpeDiariaRNC_PROVEEDOR: TIBStringField
      FieldName = 'RNC_PROVEEDOR'
      Origin = 'PROVEEDORES.RNC_PROVEEDOR'
      Size = 15
    end
  end
  object qryDatosRepDifVendedores: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qryDatosRepDifVendedoresCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PROC_REPORTEDIFERENCIACUADRE ('
      '  :fechaini,   :fechafin)'
      'Where ruta between :rutaini and :rutafin'
      'Order by Ruta, fecha')
    Left = 191
    Top = 432
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'rutaini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'rutafin'
        ParamType = ptInput
      end>
    object qryDatosRepDifVendedoresFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.FECHA'
    end
    object qryDatosRepDifVendedoresRUTA: TIntegerField
      FieldName = 'RUTA'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.RUTA'
    end
    object qryDatosRepDifVendedoresCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.CODIGO_EMP'
    end
    object qryDatosRepDifVendedoresNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.NOMBRE'
      Size = 35
    end
    object qryDatosRepDifVendedoresAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.APELLIDO'
      Size = 35
    end
    object qryDatosRepDifVendedoresEFECTIVO: TFloatField
      FieldName = 'EFECTIVO'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.EFECTIVO'
    end
    object qryDatosRepDifVendedoresCHEQUE: TFloatField
      FieldName = 'CHEQUE'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.CHEQUE'
    end
    object qryDatosRepDifVendedoresCREDITO_DIRECTO: TFloatField
      FieldName = 'CREDITO_DIRECTO'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.CREDITO_DIRECTO'
    end
    object qryDatosRepDifVendedoresCREDITO_NORMAL: TFloatField
      FieldName = 'CREDITO_NORMAL'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.CREDITO_NORMAL'
    end
    object qryDatosRepDifVendedoresPROMOCION: TFloatField
      FieldName = 'PROMOCION'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.PROMOCION'
    end
    object qryDatosRepDifVendedoresMONTO_VENTA: TFloatField
      FieldName = 'MONTO_VENTA'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.MONTO_VENTA'
    end
    object qryDatosRepDifVendedoresMontoReportado: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MontoReportado'
      Calculated = True
    end
    object qryDatosRepDifVendedoresDiferencia: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Diferencia'
      Calculated = True
    end
    object qryDatosRepDifVendedoresAJUSTE: TFloatField
      FieldName = 'AJUSTE'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.AJUSTE'
    end
    object qryDatosRepDifVendedoresCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
  end
  object QryDatosComsionxVenta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT'
      '  FECHA_VENTA, '
      '  CODIGO_EMP,'
      '  CODIGO_RUTA ,'
      '  TIPO_COMISION,'
      '  CODIGO_PROD,'
      '  MONTO_COMISION,'
      '  CANT_CAJAS_VENDIDAS,'
      '  COMISION_NETA, '
      '  inventario_producto.descripcion DESC_PRODUCTO,'
      '  Nombre||" "||+Apellido nombre_empleado'
      'FROM '
      
        'PROC_COMISION_A_PAGAR_DET(:codigoEmpIni,:codigoEmpFin,:FechaIni,' +
        ':FechaFin),'
      'INVENTARIO_PRODUCTO, empleado '
      'WHERE CODIGO_PROD = CODIGO_TEXTO'
      'and empleado.codigo = codigo_emp'
      ''
      'ORDER BY CODIGO_EMP, FECHA_VENTA, CODIGO ')
    Left = 344
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoEmpIni'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'codigoEmpFin'
        ParamType = ptInput
        Value = '500'
      end
      item
        DataType = ftDateTime
        Name = 'Fechaini'
        ParamType = ptInput
        Value = '2006-02-01'
      end
      item
        DataType = ftDateTime
        Name = 'Fechafin'
        ParamType = ptInput
        Value = '2006-02-15'
      end>
    object QryDatosComsionxVentaFECHA_VENTA: TDateTimeField
      FieldName = 'FECHA_VENTA'
      Origin = 'PROC_COMISION_A_PAGAR_DET.FECHA_VENTA'
    end
    object QryDatosComsionxVentaCODIGO_EMP: TIntegerField
      DisplayLabel = 'CodigoEmp'
      FieldName = 'CODIGO_EMP'
      Origin = 'PROC_COMISION_A_PAGAR.CODIGO_EMP'
    end
    object QryDatosComsionxVentaCODIGO_RUTA: TIntegerField
      DisplayLabel = 'CodigoRuta'
      FieldName = 'CODIGO_RUTA'
      Origin = 'PROC_COMISION_A_PAGAR.CODIGO_RUTA'
    end
    object QryDatosComsionxVentaTIPO_COMISION: TIntegerField
      DisplayLabel = 'Tipo Comision'
      FieldName = 'TIPO_COMISION'
      Origin = 'PROC_COMISION_A_PAGAR.TIPO_COMISION'
    end
    object QryDatosComsionxVentaCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'PROC_COMISION_A_PAGAR_DET.CODIGO_PROD'
      Size = 40
    end
    object QryDatosComsionxVentaMONTO_COMISION: TFloatField
      DisplayLabel = 'Monto Comision'
      FieldName = 'MONTO_COMISION'
      Origin = 'PROC_COMISION_A_PAGAR.MONTO_COMISION'
      DisplayFormat = ',0.00'
    end
    object QryDatosComsionxVentaCANT_CAJAS_VENDIDAS: TFloatField
      DisplayLabel = 'Cant Cajas Vendida'
      FieldName = 'CANT_CAJAS_VENDIDAS'
      Origin = 'PROC_COMISION_A_PAGAR.CANT_CAJAS_VENDIDAS'
    end
    object QryDatosComsionxVentaCOMISION_NETA: TFloatField
      DisplayLabel = 'Comision Neta'
      FieldName = 'COMISION_NETA'
      Origin = 'PROC_COMISION_A_PAGAR.COMISION_NETA'
      DisplayFormat = ',0.00'
    end
    object QryDatosComsionxVentaDESC_PRODUCTO: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_PRODUCTO'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object QryDatosComsionxVentaNOMBRE_EMPLEADO: TIBStringField
      FieldName = 'NOMBRE_EMPLEADO'
      Size = 71
    end
  end
  object qryRepComResXEmp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT'
      '  CODIGO_EMP,'
      '  CODIGO_PROD,'
      '  inventario_producto.descripcion DESC_PRODUCTO,'
      '  Nombre||" "||+Apellido nombre_empleado,'
      '  MONTO_COMISION,'
      '  SUM(CANT_CAJAS_VENDIDAS) CANT_CAJAS_VENDIDAS,'
      '  SUM(COMISION_NETA)   COMISION_NETA'
      'FROM '
      
        'PROC_COMISION_A_PAGAR_DET(:codigoEmpIni,:codigoEmpFin,:FechaIni,' +
        ':FechaFin),'
      'INVENTARIO_PRODUCTO, empleado '
      'WHERE CODIGO_PROD = CODIGO_TEXTO'
      'and empleado.codigo = codigo_emp'
      'GROUP BY '
      '  CODIGO_EMP,'
      '  CODIGO_PROD,'
      '  inventario_producto.descripcion,'
      '  NOMBRE, APELLIDO, '
      '  MONTO_COMISION'
      'ORDER BY CODIGO_EMP')
    Left = 344
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoEmpIni'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'codigoEmpFin'
        ParamType = ptInput
        Value = '500'
      end
      item
        DataType = ftDateTime
        Name = 'Fechaini'
        ParamType = ptInput
        Value = '2006-02-01'
      end
      item
        DataType = ftDateTime
        Name = 'Fechafin'
        ParamType = ptInput
        Value = '2006-02-15'
      end>
    object qryRepComResXEmpCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Size = 40
    end
    object qryRepComResXEmpCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
    end
    object qryRepComResXEmpDESC_PRODUCTO: TIBStringField
      FieldName = 'DESC_PRODUCTO'
      Size = 40
    end
    object qryRepComResXEmpNOMBRE_EMPLEADO: TIBStringField
      FieldName = 'NOMBRE_EMPLEADO'
      Size = 71
    end
    object qryRepComResXEmpMONTO_COMISION: TFloatField
      FieldName = 'MONTO_COMISION'
    end
    object qryRepComResXEmpCANT_CAJAS_VENDIDAS: TFloatField
      FieldName = 'CANT_CAJAS_VENDIDAS'
    end
    object qryRepComResXEmpCOMISION_NETA: TFloatField
      FieldName = 'COMISION_NETA'
    end
  end
  object qryPrecioComisiones: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '      TIPO_COMISION.DESCRIPCION desc_tipo_comision,'
      '       COMISION.CODIGO codproducto,'
      '       INVENTARIO_PRODUCTO.DESCRIPCION descproducto,'
      '       COMISION.TIPO,'
      '       COMISION.FECHA_INICIAL,'
      '       COMISION.FECHA_FINAL,'
      '       COMISION.MONTO_COMISION,'
      '       COMISION.STATUS,'
      '       INVENTARIO_PRODUCTO.CODIGO'
      'FROM TIPO_COMISION'
      '   INNER JOIN COMISION ON (TIPO_COMISION.CODIGO = COMISION.TIPO)'
      
        '   INNER JOIN INVENTARIO_PRODUCTO ON (COMISION.CODIGO = INVENTAR' +
        'IO_PRODUCTO.CODIGO_TEXTO)'
      'WHERE '
      '   ('
      
        '      (:fecha BETWEEN COMISION.FECHA_INICIAL and COMISION.FECHA_' +
        'FINAL)'
      '   )'
      'ORDER BY COMISION.TIPO, COMISION.CODIGO')
    Left = 344
    Top = 208
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
        Value = '2006-08-01'
      end>
  end
  object qryRepPromociones: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT PROMOCIONES.RUTA,'
      '       PROMOCIONES.FECHA,'
      '       PROMOCIONES.CODIGO_PROD,'
      '       PROMOCIONES.CODIGO_CTE,'
      '       PROMOCIONES.CANTIDAD,'
      '       PROMOCIONES.CODIGO_USUARIO,'
      '       PROMOCIONES.FECHA_IN,'
      '       PROMOCIONES.STATUS,'
      '       EMPLEADO.NOMBRE,'
      '       EMPLEADO.APELLIDO,'
      '       INVENTARIO_PRODUCTO.DESCRIPCION AS DESC_PRODUCTO,'
      '       INVENTARIO_PRODUCTO.CODIGO,'
      '       RUTA.CODIGO_EMP,'
      '       INVENTARIO_PRODUCTO.PRECIO,'
      '       PRECIO_INVENTARIO.PRECIO_DISTRIBUIDOR'
      'FROM PRECIO_INVENTARIO'
      
        '   INNER JOIN INVENTARIO_PRODUCTO ON (PRECIO_INVENTARIO.CODIGO_T' +
        'EXTO = INVENTARIO_PRODUCTO.CODIGO_TEXTO)'
      
        '   INNER JOIN PROMOCIONES ON (INVENTARIO_PRODUCTO.CODIGO_TEXTO =' +
        ' PROMOCIONES.CODIGO_PROD)'
      '   INNER JOIN RUTA ON (PROMOCIONES.RUTA = RUTA.CODIGO)'
      '   INNER JOIN EMPLEADO ON (RUTA.CODIGO_EMP = EMPLEADO.CODIGO)'
      ''
      'Where   '
      '   ('
      '       (PROMOCIONES.FECHA Between :FechaIni And :FechaFin)'
      '       AND  (RUTA.TIPO_COMISION = 1)'
      '   )'
      'ORDER BY RUTA.CODIGO_EMP, INVENTARIO_PRODUCTO.CODIGO')
    Left = 344
    Top = 264
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FechaIni'
        ParamType = ptInput
        Value = '2006-01-01'
      end
      item
        DataType = ftDateTime
        Name = 'FechaFin'
        ParamType = ptInput
        Value = '2007-12-31'
      end>
    object qryRepPromocionesRUTA: TIntegerField
      FieldName = 'RUTA'
      Origin = 'PROMOCIONES.RUTA'
      Required = True
    end
    object qryRepPromocionesFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROMOCIONES.FECHA'
      Required = True
    end
    object qryRepPromocionesCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'PROMOCIONES.CODIGO_PROD'
      Required = True
      Size = 12
    end
    object qryRepPromocionesCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROMOCIONES.CODIGO_CTE'
      Required = True
    end
    object qryRepPromocionesCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PROMOCIONES.CANTIDAD'
    end
    object qryRepPromocionesCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'PROMOCIONES.CODIGO_USUARIO'
    end
    object qryRepPromocionesFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PROMOCIONES.FECHA_IN'
    end
    object qryRepPromocionesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROMOCIONES.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepPromocionesNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object qryRepPromocionesAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADO.APELLIDO'
      Size = 35
    end
    object qryRepPromocionesDESC_PRODUCTO: TIBStringField
      FieldName = 'DESC_PRODUCTO'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryRepPromocionesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryRepPromocionesCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'RUTA.CODIGO_EMP'
      Required = True
    end
    object qryRepPromocionesPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryRepPromocionesPRECIO_DISTRIBUIDOR: TFloatField
      FieldName = 'PRECIO_DISTRIBUIDOR'
      Origin = 'PRECIO_INVENTARIO.PRECIO_DISTRIBUIDOR'
    end
  end
  object qryDatosFaltante: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qryDatosFaltanteCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT  * FROM PROC_REPORTEDIFERENCIACUADRE ('
      '  :FechaIni,   :FechaFin)'
      'Where Codigo_Emp Between :Rutaini And :Rutafin'
      'Order by Ruta, fecha')
    Left = 344
    Top = 320
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'rutaini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'rutafin'
        ParamType = ptInput
      end>
    object qryDatosFaltanteFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.FECHA'
    end
    object qryDatosFaltanteRUTA: TIntegerField
      FieldName = 'RUTA'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.RUTA'
    end
    object qryDatosFaltanteCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.CODIGO_EMP'
    end
    object qryDatosFaltanteNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.NOMBRE'
      Size = 35
    end
    object qryDatosFaltanteAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.APELLIDO'
      Size = 35
    end
    object qryDatosFaltanteEFECTIVO: TFloatField
      FieldName = 'EFECTIVO'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.EFECTIVO'
    end
    object qryDatosFaltanteCHEQUE: TFloatField
      FieldName = 'CHEQUE'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.CHEQUE'
    end
    object qryDatosFaltanteCREDITO_DIRECTO: TFloatField
      FieldName = 'CREDITO_DIRECTO'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.CREDITO_DIRECTO'
    end
    object qryDatosFaltanteCREDITO_NORMAL: TFloatField
      FieldName = 'CREDITO_NORMAL'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.CREDITO_NORMAL'
    end
    object qryDatosFaltantePROMOCION: TFloatField
      FieldName = 'PROMOCION'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.PROMOCION'
    end
    object qryDatosFaltanteMONTO_VENTA: TFloatField
      FieldName = 'MONTO_VENTA'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.MONTO_VENTA'
    end
    object qryDatosFaltanteAJUSTE: TFloatField
      FieldName = 'AJUSTE'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.AJUSTE'
    end
    object qryDatosFaltanteCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'PROC_REPORTEDIFERENCIACUADRE.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object qryDatosFaltanteMontoReportado: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MontoReportado'
      Calculated = True
    end
    object qryDatosFaltanteDiferencia: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Diferencia'
      Calculated = True
    end
  end
  object qryRepFinancDistcuota: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT FINANCIAMIENTO.CODIGO_CTE,'
      '       CLIENTES.NOMBRE_CTE,'
      '       CLIENTES.CEDULA,'
      '       CLIENTES.CIUDAD,'
      '       CLIENTES.PAIS,'
      '       CLIENTES.DIRECCION_CONT,'
      '       CLIENTES.TELEF_CONTACTO,'
      '       FINANCIAMIENTO.CANT_CUOTAS,'
      '       FINANCIAMIENTO.MONTOINICIAL,'
      '       FINANCIAMIENTO.PORCIENTO,'
      '       FINANCIAMIENTO.FECHA,'
      '       FINANCIAMIENTO.MONTO_CAP_INICIAL'
      'FROM FINANCIAMIENTO'
      
        '   INNER JOIN CLIENTES ON (FINANCIAMIENTO.CODIGO_CTE = CLIENTES.' +
        'CODIGO_CTE)'
      'Where FINANCIAMIENTO.CODIGO_CTE =:codigoCte'
      'and        FINANCIAMIENTO.NUM_FACTURA =:numfactura')
    Left = 344
    Top = 376
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoCte'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'numfactura'
        ParamType = ptInput
      end>
    object qryRepFinancDistcuotaCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'FINANCIAMIENTO.CODIGO_CTE'
      Required = True
    end
    object qryRepFinancDistcuotaNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryRepFinancDistcuotaCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryRepFinancDistcuotaCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryRepFinancDistcuotaPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryRepFinancDistcuotaDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryRepFinancDistcuotaTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryRepFinancDistcuotaCANT_CUOTAS: TIntegerField
      FieldName = 'CANT_CUOTAS'
      Origin = 'FINANCIAMIENTO.CANT_CUOTAS'
    end
    object qryRepFinancDistcuotaMONTOINICIAL: TFloatField
      FieldName = 'MONTOINICIAL'
      Origin = 'FINANCIAMIENTO.MONTOINICIAL'
    end
    object qryRepFinancDistcuotaPORCIENTO: TFloatField
      FieldName = 'PORCIENTO'
      Origin = 'FINANCIAMIENTO.PORCIENTO'
    end
    object qryRepFinancDistcuotaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FINANCIAMIENTO.FECHA'
      Required = True
    end
    object qryRepFinancDistcuotaMONTO_CAP_INICIAL: TFloatField
      FieldName = 'MONTO_CAP_INICIAL'
      Origin = 'FINANCIAMIENTO.MONTO_CAP_INICIAL'
    end
  end
  object qryRepIngresos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM PROC_REPORTE_INGRESOS'
      'WHERE FECHA BETWEEN :FECHAINI AND :FECHAFIN')
    Left = 48
    Top = 408
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAFIN'
        ParamType = ptInput
      end>
  end
  object qryDatosSaldoAntiguedadCxc: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterOpen = qryDatosSaldoAntiguedadCxcAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '    F_AGEINDAYS(FACTURAS.FECHA, "Today") AS diasEnAtraso,'
      '    F_AGEINDAYS(FACTURAS.FECHA, "Today")/30 AS CantMeses,'
      '    FACTURAS.NUMERO,'
      '    FACTURAS.FECHA,'
      '    FACTURAS.CODIGO_CTE,'
      '    FACTURAS_PENDIENTES.MONTO_PENDIENTE,'
      '    FACTURAS.STATUS,'
      '    CLIENTES.NOMBRE_CTE, CLIENTES.RNC_NUMERO, '
      '    FACTURAS.DESCRIPCION'
      'FROM CLIENTES'
      
        '   INNER JOIN FACTURAS ON (CLIENTES.CODIGO_CTE = FACTURAS.CODIGO' +
        '_CTE)'
      
        '   INNER JOIN FACTURAS_PENDIENTES ON (FACTURAS.NUMERO = FACTURAS' +
        '_PENDIENTES.NUMERO_FACT)'
      'WHERE '
      '   ('
      '      (FACTURAS_PENDIENTES.MONTO_PENDIENTE > 0)  AND '
      '      (FACTURAS.STATUS Not In ('#39'C'#39','#39'S'#39'))'
      '   )'
      'ORDER BY FACTURAS.CODIGO_CTE')
    OnFilterRecord = qryDatosSaldoAntiguedadCxcFilterRecord
    Left = 346
    Top = 432
    object qryDatosSaldoAntiguedadCxcDIASENATRASO: TIntegerField
      FieldName = 'DIASENATRASO'
      Required = True
    end
    object qryDatosSaldoAntiguedadCxcCANTMESES: TFloatField
      FieldName = 'CANTMESES'
      Required = True
    end
    object qryDatosSaldoAntiguedadCxcNUMERO: TFloatField
      FieldName = 'NUMERO'
      Origin = 'FACTURAS.NUMERO'
      Required = True
    end
    object qryDatosSaldoAntiguedadCxcFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FACTURAS.FECHA'
    end
    object qryDatosSaldoAntiguedadCxcCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'FACTURAS.CODIGO_CTE'
    end
    object qryDatosSaldoAntiguedadCxcMONTO_PENDIENTE: TFloatField
      FieldName = 'MONTO_PENDIENTE'
      Origin = 'FACTURAS_PENDIENTES.MONTO_PENDIENTE'
    end
    object qryDatosSaldoAntiguedadCxcSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FACTURAS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosSaldoAntiguedadCxcNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryDatosSaldoAntiguedadCxcRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryDatosSaldoAntiguedadCxcDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'FACTURAS.DESCRIPCION'
      Size = 40
    end
  end
  object rxSaldoAntCxc: TRxMemoryData
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'Fecha'
        DataType = ftDateTime
      end
      item
        Name = 'NombreCliente'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'd30'
        DataType = ftCurrency
      end
      item
        Name = 'd60'
        DataType = ftCurrency
      end
      item
        Name = 'd90'
        DataType = ftCurrency
      end
      item
        Name = 'd120'
        DataType = ftCurrency
      end
      item
        Name = 'NumFact'
        DataType = ftInteger
      end
      item
        Name = 'rnc'
        DataType = ftString
        Size = 14
      end>
    OnFilterRecord = rxSaldoAntCxcFilterRecord
    Left = 347
    Top = 480
    object rxSaldoAntCxccodigo: TIntegerField
      FieldName = 'codigo'
    end
    object rxSaldoAntCxcNombreCliente: TStringField
      FieldName = 'NombreCliente'
      Size = 80
    end
    object rxSaldoAntCxcNumFact: TIntegerField
      FieldName = 'NumFact'
    end
    object rxSaldoAntCxcrnc: TStringField
      FieldName = 'rnc'
      Size = 14
    end
    object rxSaldoAntCxcd30: TCurrencyField
      FieldName = 'd30'
    end
    object rxSaldoAntCxcd60: TCurrencyField
      FieldName = 'd60'
    end
    object rxSaldoAntCxcd90: TCurrencyField
      FieldName = 'd90'
    end
    object rxSaldoAntCxcd120: TCurrencyField
      FieldName = 'd120'
    end
    object rxSaldoAntCxcFecha: TDateTimeField
      FieldName = 'Fecha'
    end
  end
  object dsrxSaldoAntCxc: TDataSource
    AutoEdit = False
    DataSet = rxSaldoAntCxc
    Left = 189
    Top = 480
  end
  object qryRelacionFacturas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRelacionFacturasAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '    CLIENTES.TELEF_CONTACTO TELEFONO,'
      '   Facturas.moneda,'
      '    CLIENTES.DIRECCION_CONT,'
      '    CLIENTES.CIUDAD,'
      '    F_AGEINDAYS(FACTURAS.FECHA, "Today") AS diasEnAtraso,'
      '    F_AGEINDAYS(FACTURAS.FECHA, "Today")/30 AS CantMeses,'
      '    FACTURAS.NUMERO,'
      '    FACTURAS.FECHA,'
      '    FACTURAS.CODIGO_CTE,'
      
        '       IIF(FACTURAS.STATUS IN ('#39'A'#39','#39'P'#39','#39'F'#39'),FACTURAS_PENDIENTES.' +
        'MONTO_PENDIENTE,0) MONTO_PENDIENTE,'
      '    FACTURAS.STATUS,'
      '    FACTURAS.DESCRIPCION,'
      '    CLIENTES.NOMBRE_CTE, CLIENTES.RNC_NUMERO'
      ''
      'FROM CLIENTES'
      
        '   INNER JOIN FACTURAS ON (CLIENTES.CODIGO_CTE = FACTURAS.CODIGO' +
        '_CTE)'
      
        '   INNER JOIN FACTURAS_PENDIENTES ON (FACTURAS.NUMERO = FACTURAS' +
        '_PENDIENTES.NUMERO_FACT)'
      'WHERE '
      '   ('
      '      (FACTURAS_PENDIENTES.MONTO_PENDIENTE > 1)'
      '       And codigo_cte Between :codCteIni and :codCteFin'
      '       And FACTURAS.FECHA Between :fechaini And :fechafin'
      '   )'
      'ORDER BY  FACTURAS.Moneda,'
      'FACTURAS.CODIGO_CTE,  FACTURAS.FECHA, '
      '    FACTURAS.NUMERO')
    Left = 368
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codCteIni'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codCteFin'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryRelacionFacturasTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryRelacionFacturasCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryRelacionFacturasDIASENATRASO: TIntegerField
      FieldName = 'DIASENATRASO'
      DisplayFormat = ',0.00'
    end
    object qryRelacionFacturasCANTMESES: TFloatField
      FieldName = 'CANTMESES'
      DisplayFormat = ',0.00'
    end
    object qryRelacionFacturasNUMERO: TFloatField
      FieldName = 'NUMERO'
      Origin = 'FACTURAS.NUMERO'
      Required = True
    end
    object qryRelacionFacturasFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FACTURAS.FECHA'
    end
    object qryRelacionFacturasCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'FACTURAS.CODIGO_CTE'
    end
    object qryRelacionFacturasMONTO_PENDIENTE: TFloatField
      FieldName = 'MONTO_PENDIENTE'
      Origin = 'FACTURAS_PENDIENTES.MONTO_PENDIENTE'
      DisplayFormat = ',0.00'
    end
    object qryRelacionFacturasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FACTURAS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRelacionFacturasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'FACTURAS.DESCRIPCION'
      Size = 40
    end
    object qryRelacionFacturasNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryRelacionFacturasRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryRelacionFacturasDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryRelacionFacturasMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'FACTURAS.MONEDA'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object qryRepInventarioProdMasBclDiv: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From PROC_DATOS_REP_INV_id(:divisioninv)'
      'Where cantidad > 0')
    Left = 72
    Top = 464
    ParamData = <
      item
        DataType = ftInteger
        Name = 'divisioninv'
        ParamType = ptInput
      end>
    object qryRepInventarioProdMasBclDivDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROC_DATOS_REP_INV_ID.DESCRIPCION'
      Size = 80
    end
    object qryRepInventarioProdMasBclDivCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PROC_DATOS_REP_INV_ID.CANTIDAD'
    end
    object qryRepInventarioProdMasBclDivUNIDAD: TFloatField
      FieldName = 'UNIDAD'
      Origin = 'PROC_DATOS_REP_INV_ID.UNIDAD'
    end
    object qryRepInventarioProdMasBclDivCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'PROC_DATOS_REP_INV_ID.CODIGO'
    end
    object qryRepInventarioProdMasBclDivPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'PROC_DATOS_REP_INV_ID.PRECIO'
    end
    object qryRepInventarioProdMasBclDivFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'PROC_DATOS_REP_INV_ID.FECHA_ULTIMA_TRN'
    end
    object qryRepInventarioProdMasBclDivCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'PROC_DATOS_REP_INV_ID.CODIGO_TEXTO'
      Size = 40
    end
    object qryRepInventarioProdMasBclDivFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_DATOS_REP_INV_ID.FECHA'
    end
    object qryRepInventarioProdMasBclDivCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'PROC_DATOS_REP_INV_ID.CODIGO_BARRA'
      Size = 40
    end
    object qryRepInventarioProdMasBclDivTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'PROC_DATOS_REP_INV_ID.TIPO'
    end
    object qryRepInventarioProdMasBclDivCANTIDAD_REORDEN: TIntegerField
      FieldName = 'CANTIDAD_REORDEN'
      Origin = 'PROC_DATOS_REP_INV_ID.CANTIDAD_REORDEN'
    end
    object qryRepInventarioProdMasBclDivPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'PROC_DATOS_REP_INV_ID.PRECIO_ANT'
    end
    object qryRepInventarioProdMasBclDivBLCE_CANT_ENTRADA: TFloatField
      FieldName = 'BLCE_CANT_ENTRADA'
      Origin = 'PROC_DATOS_REP_INV_ID.BLCE_CANT_ENTRADA'
    end
    object qryRepInventarioProdMasBclDivBLCE_CANT_SALIDA: TFloatField
      FieldName = 'BLCE_CANT_SALIDA'
      Origin = 'PROC_DATOS_REP_INV_ID.BLCE_CANT_SALIDA'
    end
    object qryRepInventarioProdMasBclDivSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROC_DATOS_REP_INV_ID.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepInventarioProdMasBclDivPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'PROC_DATOS_REP_INV_ID.PORC_DESCUENTO'
    end
    object qryRepInventarioProdMasBclDivFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'PROC_DATOS_REP_INV_ID.FOTO'
      Size = 8
    end
    object qryRepInventarioProdMasBclDivPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'PROC_DATOS_REP_INV_ID.PAGA_ITBI'
    end
    object qryRepInventarioProdMasBclDivCODIGO_PRECIO: TIBStringField
      FieldName = 'CODIGO_PRECIO'
      Origin = 'PROC_DATOS_REP_INV_ID.CODIGO_PRECIO'
      FixedChar = True
      Size = 6
    end
    object qryRepInventarioProdMasBclDivBALANCE_EN_RUTA: TFloatField
      FieldName = 'BALANCE_EN_RUTA'
      Origin = 'PROC_DATOS_REP_INV_ID.BALANCE_EN_RUTA'
    end
    object qryRepInventarioProdMasBclDivPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'PROC_DATOS_REP_INV_ID.PRECIO_COMPRA'
    end
  end
  object qryDivInventario: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * '
      'FROM DIVISION_INVENTARIO')
    Left = 288
    Top = 16
    object qryDivInventarioINVENTARIO_ID: TIntegerField
      FieldName = 'INVENTARIO_ID'
      Origin = 'DIVISION_INVENTARIO.INVENTARIO_ID'
      Required = True
    end
    object qryDivInventarioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DIVISION_INVENTARIO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDivInventarioDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DIVISION_INVENTARIO.DESCRIPCION'
      Size = 30
    end
  end
  object qryRepComisionVPlan: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepComisionVPlanAfterScroll
    OnCalcFields = qryRepComisionVPlanCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  VENDEDORES.NOMBRE,  '
      ' VENDEDORES.CODIGO,'
      '  PLAN_FUNERARIO.ID_TIPO_PLAN,'
      '  CLIENTES.NOMBRE_CTE,'
      '  PLAN_FUNERARIO.FECHA_APERTURA,'
      '  PLAN_FUNERARIO.CODIGO_CTE,'
      '  PLAN_FUNERARIO.ID_PLAN,'
      '  TIPO_PLAN.DESCRIPCION'
      'FROM'
      '  PLAN_FUNERARIO'
      
        '  INNER JOIN VENDEDORES ON (PLAN_FUNERARIO.COD_VENDEDOR = VENDED' +
        'ORES.CODIGO)'
      
        '  INNER JOIN CLIENTES ON (PLAN_FUNERARIO.CODIGO_CTE = CLIENTES.C' +
        'ODIGO_CTE)'
      
        '  INNER JOIN TIPO_PLAN ON (PLAN_FUNERARIO.ID_TIPO_PLAN = TIPO_PL' +
        'AN.TIPO)'
      'ORDER BY  VENDEDORES.CODIGO')
    Left = 264
    Top = 128
    object qryRepComisionVPlanNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object qryRepComisionVPlanID_TIPO_PLAN: TSmallintField
      FieldName = 'ID_TIPO_PLAN'
      Origin = 'PLAN_FUNERARIO.ID_TIPO_PLAN'
      Required = True
    end
    object qryRepComisionVPlanNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryRepComisionVPlanFECHA_APERTURA: TDateTimeField
      FieldName = 'FECHA_APERTURA'
      Origin = 'PLAN_FUNERARIO.FECHA_APERTURA'
      Required = True
    end
    object qryRepComisionVPlanCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PLAN_FUNERARIO.CODIGO_CTE'
      Required = True
    end
    object qryRepComisionVPlanID_PLAN: TIntegerField
      FieldName = 'ID_PLAN'
      Origin = 'PLAN_FUNERARIO.ID_PLAN'
      Required = True
    end
    object qryRepComisionVPlanDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_PLAN.DESCRIPCION'
      Size = 40
    end
    object qryRepComisionVPlanPorcCom: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PorcCom'
      Calculated = True
    end
    object qryRepComisionVPlanPrecioTarifa: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PrecioTarifa'
      Calculated = True
    end
    object qryRepComisionVPlanCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'VENDEDORES.CODIGO'
      Required = True
    end
  end
  object dsqryRepComisionVPlan: TDataSource
    DataSet = qryRepComisionVPlan
    Left = 272
    Top = 240
  end
  object qryComisionVPlan: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select precio, porc_comision from tarifa_tipo_plan'
      'Where id_tipo = :ID_TIPO_PLAN'
      'And :FECHA Between fecha_inicial and fecha_final')
    Left = 256
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_TIPO_PLAN'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end>
    object qryComisionVPlanPORC_COMISION: TFloatField
      FieldName = 'PORC_COMISION'
      Origin = 'TARIFA_TIPO_PLAN.PORC_COMISION'
    end
    object qryComisionVPlanPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'TARIFA_TIPO_PLAN.PRECIO'
    end
  end
  object qryInventarioSerie: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '  INVENTARIO_SERIE'
      'Where codigo=:codigo')
    Left = 176
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end>
    object qryInventarioSerieCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_SERIE.CODIGO'
      Required = True
    end
    object qryInventarioSerieSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'INVENTARIO_SERIE.SERIE'
      Required = True
      Size = 50
    end
    object qryInventarioSerieSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INVENTARIO_SERIE.STATUS'
      Size = 1
    end
  end
  object qryMargenGanInvent: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  INVENTARIO_PRODUCTO.CODIGO,'
      '  INVENTARIO_PRODUCTO.TIPO,'
      '  tipo_inventario.DESCRIPCION desc_tipo_inventario,'
      '  INVENTARIO_PRODUCTO.DESCRIPCION,'
      '  INVENTARIO_PRODUCTO.PRECIO_COMPRA,'
      '  INVENTARIO_PRODUCTO.PRECIO,'
      '  CASE '
      
        '    When  (INVENTARIO_PRODUCTO.PRECIO_COMPRA > 0.001 ) then (INV' +
        'ENTARIO_PRODUCTO.precio - INVENTARIO_PRODUCTO.PRECIO_COMPRA)    ' +
        '     '
      '    Else 0.0'
      '  END MARGEN'
      'FROM'
      '  INVENTARIO_PRODUCTO'
      
        '  LEFT OUTER JOIN TIPO_INVENTARIO ON (INVENTARIO_PRODUCTO.TIPO =' +
        ' TIPO_INVENTARIO.CODIGO)'
      'WHERE'
      '  (INVENTARIO_PRODUCTO.TIPO = TIPO_INVENTARIO.CODIGO)'
      
        'order by INVENTARIO_PRODUCTO.TIPO, INVENTARIO_PRODUCTO.Descripci' +
        'on, INVENTARIO_PRODUCTO.precio_compra desc')
    Left = 280
    Top = 56
    object qryMargenGanInventCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryMargenGanInventTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object qryMargenGanInventDESC_TIPO_INVENTARIO: TIBStringField
      FieldName = 'DESC_TIPO_INVENTARIO'
      Origin = 'TIPO_INVENTARIO.DESCRIPCION'
      Size = 30
    end
    object qryMargenGanInventPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryMargenGanInventPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryMargenGanInventMARGEN: TFloatField
      FieldName = 'MARGEN'
    end
    object qryMargenGanInventDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
  end
  object qryMargenBruto: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qryMargenBrutoCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  INVENTARIO_PRODUCTO.CODIGO_TEXTO,'
      '  INVENTARIO_PRODUCTO.CODIGO,'
      '  INVENTARIO_PRODUCTO.TIPO,'
      '  INVENTARIO_PRODUCTO.DESCRIPCION,'
      '  TIPO_INVENTARIO.DESCRIPCION AS DESCTIPOINV,'
      '  INVENTARIO_PRODUCTO.PRECIO_COMPRA,'
      '  INVENTARIO_PRODUCTO.PRECIO,'
      
        '  SUM(VENTAS_DET.CANTIDAD)  * INVENTARIO_PRODUCTO.PRECIO_COMPRA ' +
        'CostoNeto,'
      '  SUM(VENTAS_DET.CANTIDAD) AS CANT,'
      '  SUM(VENTAS_DET.VALOR_TOTAL_DET)  - '
      '  SUM(VENTAS_DET.ITBI_DET)'
      'AS MONTO_Venta_Neto'
      'FROM'
      '  VENTAS_MAST'
      
        '  INNER JOIN VENTAS_DET ON (VENTAS_MAST.NUMERO = VENTAS_DET.NUME' +
        'RO)'
      
        '  INNER JOIN INVENTARIO_PRODUCTO ON (VENTAS_DET.CODIGO_PROD = IN' +
        'VENTARIO_PRODUCTO.CODIGO)'
      
        '  INNER JOIN TIPO_INVENTARIO ON (INVENTARIO_PRODUCTO.TIPO = TIPO' +
        '_INVENTARIO.CODIGO)'
      'WHERE'
      '  (VENTAS_MAST.FECHA BETWEEN :FECHAINI AND :FECHAFIN)'
      'GROUP BY'
      '  INVENTARIO_PRODUCTO.CODIGO_TEXTO,'
      '  INVENTARIO_PRODUCTO.CODIGO,'
      '  INVENTARIO_PRODUCTO.DESCRIPCION,'
      '  TIPO_INVENTARIO.DESCRIPCION,'
      '  INVENTARIO_PRODUCTO.PRECIO_COMPRA,'
      ' INVENTARIO_PRODUCTO.PRECIO, '
      ' INVENTARIO_PRODUCTO.TIPO'
      'ORDER BY  INVENTARIO_PRODUCTO.TIPO,'
      '  INVENTARIO_PRODUCTO.DESCRIPCION ')
    OnFilterRecord = qryMargenBrutoFilterRecord
    Left = 479
    Top = 94
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAINI'
        ParamType = ptInput
        Value = '07/01/2019'
      end
      item
        DataType = ftDateTime
        Name = 'FECHAFIN'
        ParamType = ptInput
        Value = '07/31/2019'
      end>
    object qryMargenBrutoCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryMargenBrutoTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object qryMargenBrutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryMargenBrutoDESCTIPOINV: TIBStringField
      FieldName = 'DESCTIPOINV'
      Size = 30
    end
    object qryMargenBrutoPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryMargenBrutoPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryMargenBrutoCOSTONETO: TFloatField
      FieldName = 'COSTONETO'
    end
    object qryMargenBrutoCANT: TFloatField
      FieldName = 'CANT'
    end
    object qryMargenBrutoMONTO_VENTA_NETO: TFloatField
      FieldName = 'MONTO_VENTA_NETO'
    end
    object qryMargenBrutoBENEFICIO: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'BENEFICIO'
      Calculated = True
    end
    object qryMargenBrutoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
  end
  object qryRepFinanciamientos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  FINANCIAMIENTO.SERIE,'
      '  FINANCIAMIENTO.NUMERO_TRN,'
      '  FINANCIAMIENTO.FECHA,'
      '  FINANCIAMIENTO.CODIGO_CTE,'
      '  FINANCIAMIENTO.TIPO_FREC_PAGO,'
      '  FINANCIAMIENTO.PORCIENTO,'
      '  FINANCIAMIENTO.PORC_MORA,'
      '  FINANCIAMIENTO.CANT_CUOTAS,'
      '  FINANCIAMIENTO.MONTOINICIAL,'
      '  FINANCIAMIENTO.DEBITO_ACUM,'
      '  FINANCIAMIENTO.CREDITO_ACUM,'
      '  FINANCIAMIENTO.MONTO_MORA_ACUM,'
      '  FINANCIAMIENTO.MONTO_DESC_PRONTOPAGO,'
      '  FINANCIAMIENTO.BALANCE_ACT,'
      '  FINANCIAMIENTO.FECHA_ULT_PAGO,'
      '  FINANCIAMIENTO.STATUS,'
      '  FINANCIAMIENTO.ID_USUARIO_IN,'
      '  FINANCIAMIENTO.FECHA_IN,'
      '  FINANCIAMIENTO.NOMBREPC,'
      '  FINANCIAMIENTO.FECHA_UPDATE,'
      '  FINANCIAMIENTO.ID_USUARIO_UPDATE,'
      '  FINANCIAMIENTO.CUOTASPEND,'
      '  FINANCIAMIENTO.NUM_FACTURA,'
      '  FINANCIAMIENTO.MONTO_CAP_INICIAL,'
      '  CLIENTES.NOMBRE_CTE,'
      '  CLIENTES.TELEF_CONTACTO'
      'FROM'
      '  FINANCIAMIENTO'
      
        '  INNER JOIN CLIENTES ON (FINANCIAMIENTO.CODIGO_CTE = CLIENTES.C' +
        'ODIGO_CTE)'
      'where   FINANCIAMIENTO.FECHA between :fechaini and :fechafin')
    Left = 455
    Top = 151
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryRepFinanciamientosSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'FINANCIAMIENTO.SERIE'
      Required = True
    end
    object qryRepFinanciamientosNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'FINANCIAMIENTO.NUMERO_TRN'
      Required = True
    end
    object qryRepFinanciamientosFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FINANCIAMIENTO.FECHA'
      Required = True
    end
    object qryRepFinanciamientosCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'FINANCIAMIENTO.CODIGO_CTE'
      Required = True
    end
    object qryRepFinanciamientosTIPO_FREC_PAGO: TIntegerField
      FieldName = 'TIPO_FREC_PAGO'
      Origin = 'FINANCIAMIENTO.TIPO_FREC_PAGO'
      Required = True
    end
    object qryRepFinanciamientosPORCIENTO: TFloatField
      FieldName = 'PORCIENTO'
      Origin = 'FINANCIAMIENTO.PORCIENTO'
    end
    object qryRepFinanciamientosPORC_MORA: TFloatField
      FieldName = 'PORC_MORA'
      Origin = 'FINANCIAMIENTO.PORC_MORA'
    end
    object qryRepFinanciamientosCANT_CUOTAS: TIntegerField
      FieldName = 'CANT_CUOTAS'
      Origin = 'FINANCIAMIENTO.CANT_CUOTAS'
    end
    object qryRepFinanciamientosMONTOINICIAL: TFloatField
      FieldName = 'MONTOINICIAL'
      Origin = 'FINANCIAMIENTO.MONTOINICIAL'
    end
    object qryRepFinanciamientosDEBITO_ACUM: TFloatField
      FieldName = 'DEBITO_ACUM'
      Origin = 'FINANCIAMIENTO.DEBITO_ACUM'
    end
    object qryRepFinanciamientosCREDITO_ACUM: TFloatField
      FieldName = 'CREDITO_ACUM'
      Origin = 'FINANCIAMIENTO.CREDITO_ACUM'
    end
    object qryRepFinanciamientosMONTO_MORA_ACUM: TFloatField
      FieldName = 'MONTO_MORA_ACUM'
      Origin = 'FINANCIAMIENTO.MONTO_MORA_ACUM'
    end
    object qryRepFinanciamientosMONTO_DESC_PRONTOPAGO: TFloatField
      FieldName = 'MONTO_DESC_PRONTOPAGO'
      Origin = 'FINANCIAMIENTO.MONTO_DESC_PRONTOPAGO'
    end
    object qryRepFinanciamientosBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'FINANCIAMIENTO.BALANCE_ACT'
    end
    object qryRepFinanciamientosFECHA_ULT_PAGO: TDateTimeField
      FieldName = 'FECHA_ULT_PAGO'
      Origin = 'FINANCIAMIENTO.FECHA_ULT_PAGO'
    end
    object qryRepFinanciamientosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FINANCIAMIENTO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepFinanciamientosID_USUARIO_IN: TIntegerField
      FieldName = 'ID_USUARIO_IN'
      Origin = 'FINANCIAMIENTO.ID_USUARIO_IN'
    end
    object qryRepFinanciamientosFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'FINANCIAMIENTO.FECHA_IN'
    end
    object qryRepFinanciamientosNOMBREPC: TIBStringField
      FieldName = 'NOMBREPC'
      Origin = 'FINANCIAMIENTO.NOMBREPC'
      Size = 12
    end
    object qryRepFinanciamientosFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'FINANCIAMIENTO.FECHA_UPDATE'
    end
    object qryRepFinanciamientosID_USUARIO_UPDATE: TIntegerField
      FieldName = 'ID_USUARIO_UPDATE'
      Origin = 'FINANCIAMIENTO.ID_USUARIO_UPDATE'
    end
    object qryRepFinanciamientosCUOTASPEND: TIntegerField
      FieldName = 'CUOTASPEND'
      Origin = 'FINANCIAMIENTO.CUOTASPEND'
    end
    object qryRepFinanciamientosNUM_FACTURA: TIntegerField
      FieldName = 'NUM_FACTURA'
      Origin = 'FINANCIAMIENTO.NUM_FACTURA'
    end
    object qryRepFinanciamientosMONTO_CAP_INICIAL: TFloatField
      FieldName = 'MONTO_CAP_INICIAL'
      Origin = 'FINANCIAMIENTO.MONTO_CAP_INICIAL'
    end
    object qryRepFinanciamientosNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryRepFinanciamientosTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
  end
  object qryRepRequisicion: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  UNIDADES.DESCRIPCION desc_tipo_unidad,'
      '  PAN_REQ_MATERIA_PRIMA_DET.CODIGO_PROD,'
      '  PAN_REQ_MATERIA_PRIMA_DET.TIPO_UNIDAD,'
      '  INVENTARIO_PRODUCTO.DESCRIPCION desc_producto,'
      '  PAN_REQ_MATERIA_PRIMA_DET.ID_REQUISICION,'
      '  PAN_REQ_MATERIA_PRIMA_DET.CANTIDAD,'
      '  PAN_REQ_MATERIA_PRIMA_DET.PRECIO,'
      '  PAN_REQ_MATERIA_PRIMA_DET.VALOR,'
      '  PAN_REQ_MATERIA_PRIMA_DET.SERIE,'
      '  PAN_REQ_MATERIA_PRIMA_MASTER.FECHA,'
      '  PAN_REQ_MATERIA_PRIMA_MASTER.ID_RECETA,'
      '  PAN_RECETA_MAST.DESC_PRODUCTO desc_receta'
      'FROM'
      '  PAN_REQ_MATERIA_PRIMA_DET'
      
        '  INNER JOIN INVENTARIO_PRODUCTO ON (PAN_REQ_MATERIA_PRIMA_DET.C' +
        'ODIGO_PROD = INVENTARIO_PRODUCTO.CODIGO)'
      
        '  INNER JOIN UNIDADES ON (PAN_REQ_MATERIA_PRIMA_DET.TIPO_UNIDAD ' +
        '= UNIDADES.IDUNIDAD)'
      
        '  INNER JOIN PAN_REQ_MATERIA_PRIMA_MASTER ON (PAN_REQ_MATERIA_PR' +
        'IMA_DET.ID_REQUISICION = PAN_REQ_MATERIA_PRIMA_MASTER.ID_REQUISI' +
        'CION)'
      
        '  INNER JOIN PAN_RECETA_MAST ON (PAN_REQ_MATERIA_PRIMA_MASTER.ID' +
        '_RECETA = PAN_RECETA_MAST.ID_RECETA)'
      'Where PAN_REQ_MATERIA_PRIMA_MASTER.ID_REQUISICION'
      'Between :reqIni and :reqFin'
      'order by PAN_REQ_MATERIA_PRIMA_MASTER.ID_REQUISICION,'
      'PAN_REQ_MATERIA_PRIMA_MASTER.ID_RECETA,'
      'PAN_REQ_MATERIA_PRIMA_DET.CODIGO_PROD ')
    Left = 463
    Top = 205
    ParamData = <
      item
        DataType = ftInteger
        Name = 'reqIni'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'reqFin'
        ParamType = ptInput
      end>
    object qryRepRequisicionDESC_TIPO_UNIDAD: TIBStringField
      FieldName = 'DESC_TIPO_UNIDAD'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
    object qryRepRequisicionCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.CODIGO_PROD'
    end
    object qryRepRequisicionTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.TIPO_UNIDAD'
    end
    object qryRepRequisicionDESC_PRODUCTO: TIBStringField
      FieldName = 'DESC_PRODUCTO'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryRepRequisicionID_REQUISICION: TIntegerField
      FieldName = 'ID_REQUISICION'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.ID_REQUISICION'
      Required = True
    end
    object qryRepRequisicionCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.CANTIDAD'
    end
    object qryRepRequisicionPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.PRECIO'
    end
    object qryRepRequisicionVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.VALOR'
    end
    object qryRepRequisicionSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.SERIE'
      Required = True
    end
    object qryRepRequisicionFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PAN_REQ_MATERIA_PRIMA_MASTER.FECHA'
    end
    object qryRepRequisicionID_RECETA: TIntegerField
      FieldName = 'ID_RECETA'
      Origin = 'PAN_REQ_MATERIA_PRIMA_MASTER.ID_RECETA'
    end
    object qryRepRequisicionDESC_RECETA: TIBStringField
      FieldName = 'DESC_RECETA'
      Origin = 'PAN_RECETA_MAST.DESC_PRODUCTO'
      Size = 60
    end
  end
  object qryRepRequisicionXfecha: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  UNIDADES.DESCRIPCION desc_tipo_unidad,'
      '  PAN_REQ_MATERIA_PRIMA_DET.CODIGO_PROD,'
      '  PAN_REQ_MATERIA_PRIMA_DET.TIPO_UNIDAD,'
      '  INVENTARIO_PRODUCTO.DESCRIPCION desc_producto,'
      '  PAN_REQ_MATERIA_PRIMA_DET.ID_REQUISICION,'
      '  PAN_REQ_MATERIA_PRIMA_DET.CANTIDAD,'
      '  PAN_REQ_MATERIA_PRIMA_DET.PRECIO,'
      '  PAN_REQ_MATERIA_PRIMA_DET.VALOR,'
      '  PAN_REQ_MATERIA_PRIMA_DET.SERIE,'
      '  PAN_REQ_MATERIA_PRIMA_MASTER.FECHA,'
      '  PAN_REQ_MATERIA_PRIMA_MASTER.ID_RECETA,'
      '  PAN_RECETA_MAST.DESC_PRODUCTO desc_receta'
      'FROM'
      '  PAN_REQ_MATERIA_PRIMA_DET'
      
        '  INNER JOIN INVENTARIO_PRODUCTO ON (PAN_REQ_MATERIA_PRIMA_DET.C' +
        'ODIGO_PROD = INVENTARIO_PRODUCTO.CODIGO)'
      
        '  INNER JOIN UNIDADES ON (PAN_REQ_MATERIA_PRIMA_DET.TIPO_UNIDAD ' +
        '= UNIDADES.IDUNIDAD)'
      
        '  INNER JOIN PAN_REQ_MATERIA_PRIMA_MASTER ON (PAN_REQ_MATERIA_PR' +
        'IMA_DET.ID_REQUISICION = PAN_REQ_MATERIA_PRIMA_MASTER.ID_REQUISI' +
        'CION)'
      
        '  INNER JOIN PAN_RECETA_MAST ON (PAN_REQ_MATERIA_PRIMA_MASTER.ID' +
        '_RECETA = PAN_RECETA_MAST.ID_RECETA)'
      'Where   PAN_REQ_MATERIA_PRIMA_MASTER.FECHA'
      'Between :reqIni and :reqFin'
      'order by PAN_REQ_MATERIA_PRIMA_MASTER.ID_REQUISICION,'
      'PAN_REQ_MATERIA_PRIMA_MASTER.ID_RECETA,'
      'PAN_REQ_MATERIA_PRIMA_DET.CODIGO_PROD ')
    Left = 463
    Top = 254
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'reqIni'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'reqFin'
        ParamType = ptInput
      end>
    object qryRepRequisicionXfechaDESC_TIPO_UNIDAD: TIBStringField
      FieldName = 'DESC_TIPO_UNIDAD'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
    object qryRepRequisicionXfechaCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.CODIGO_PROD'
    end
    object qryRepRequisicionXfechaTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.TIPO_UNIDAD'
    end
    object qryRepRequisicionXfechaDESC_PRODUCTO: TIBStringField
      FieldName = 'DESC_PRODUCTO'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryRepRequisicionXfechaID_REQUISICION: TIntegerField
      FieldName = 'ID_REQUISICION'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.ID_REQUISICION'
      Required = True
    end
    object qryRepRequisicionXfechaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.CANTIDAD'
    end
    object qryRepRequisicionXfechaPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.PRECIO'
    end
    object qryRepRequisicionXfechaVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.VALOR'
    end
    object qryRepRequisicionXfechaSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.SERIE'
      Required = True
    end
    object qryRepRequisicionXfechaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PAN_REQ_MATERIA_PRIMA_MASTER.FECHA'
    end
    object qryRepRequisicionXfechaID_RECETA: TIntegerField
      FieldName = 'ID_RECETA'
      Origin = 'PAN_REQ_MATERIA_PRIMA_MASTER.ID_RECETA'
    end
    object qryRepRequisicionXfechaDESC_RECETA: TIBStringField
      FieldName = 'DESC_RECETA'
      Origin = 'PAN_RECETA_MAST.DESC_PRODUCTO'
      Size = 60
    end
  end
  object qryViewVentasMast: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryViewVentasMastAfterScroll
    OnCalcFields = qryViewVentasMastCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From VIEW_VENTAS_MAST'
      'Where numero =:numero')
    Left = 431
    Top = 305
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryViewVentasMastNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_VENTAS_MAST.NUMERO'
    end
    object qryViewVentasMastFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VIEW_VENTAS_MAST.FECHA'
    end
    object qryViewVentasMastCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VIEW_VENTAS_MAST.CODIGO_CTE'
    end
    object qryViewVentasMastCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VIEW_VENTAS_MAST.CODIGO_VENDEDOR'
    end
    object qryViewVentasMastFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VIEW_VENTAS_MAST.FORMA_PAGO'
    end
    object qryViewVentasMastOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VIEW_VENTAS_MAST.OBSERVACION'
      Size = 60
    end
    object qryViewVentasMastMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VIEW_VENTAS_MAST.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryViewVentasMastVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VIEW_VENTAS_MAST.VALOR_TOTAL_DET'
    end
    object qryViewVentasMastSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VIEW_VENTAS_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryViewVentasMastNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VIEW_VENTAS_MAST.NUMERO_FACTURA'
    end
    object qryViewVentasMastNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VIEW_VENTAS_MAST.NUMERO_DOC_PAGO'
    end
    object qryViewVentasMastSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VIEW_VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
    object qryViewVentasMastMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'VIEW_VENTAS_MAST.MONTO_BRUTO'
    end
    object qryViewVentasMastPORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VIEW_VENTAS_MAST.PORC_DESCUENTO'
    end
    object qryViewVentasMastMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VIEW_VENTAS_MAST.MONTO_DESCUENTO'
    end
    object qryViewVentasMastMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VIEW_VENTAS_MAST.MONTO_PAGADO'
    end
    object qryViewVentasMastMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'VIEW_VENTAS_MAST.MONTO_CAMBIO'
    end
    object qryViewVentasMastNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'VIEW_VENTAS_MAST.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
    object qryViewVentasMastNOMBRE_COMPLETO: TIBStringField
      FieldName = 'NOMBRE_COMPLETO'
      Origin = 'VIEW_VENTAS_MAST.NOMBRE_COMPLETO'
      Size = 60
    end
    object qryViewVentasMastNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'VIEW_VENTAS_MAST.NUMERO_NCF'
      Size = 21
    end
    object qryViewVentasMastTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'VIEW_VENTAS_MAST.TIPO_NCF'
      Size = 2
    end
    object qryViewVentasMastNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'VIEW_VENTAS_MAST.NOMBRE_CTE'
      Size = 60
    end
    object qryViewVentasMastCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'VIEW_VENTAS_MAST.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryViewVentasMastRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'VIEW_VENTAS_MAST.RNC'
      Size = 14
    end
    object qryViewVentasMastDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'VIEW_VENTAS_MAST.DIRECCION_CONT'
      Size = 60
    end
    object qryViewVentasMastTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'VIEW_VENTAS_MAST.TELEF_CONTACTO'
      Size = 14
    end
    object qryViewVentasMastDESC_TIPOPAGO: TIBStringField
      FieldName = 'DESC_TIPOPAGO'
      Origin = 'VIEW_VENTAS_MAST.DESC_TIPOPAGO'
      FixedChar = True
      Size = 15
    end
    object qryViewVentasMastORIGEN: TSmallintField
      FieldName = 'ORIGEN'
      Origin = 'VIEW_VENTAS_MAST.ORIGEN'
    end
    object qryViewVentasMastMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'VIEW_VENTAS_MAST.MONTO_INICIAL'
    end
    object qryViewVentasMastDESC_TIPONCF: TIBStringField
      FieldName = 'DESC_TIPONCF'
      Origin = 'VIEW_VENTAS_MAST.DESC_TIPONCF'
      Size = 60
    end
    object qryViewVentasMastNumeroDocCldo: TStringField
      FieldKind = fkCalculated
      FieldName = 'NumeroDocCldo'
      Calculated = True
    end
    object qryViewVentasMastNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'VIEW_VENTAS_MAST.NOMBRE_ABREV'
      Size = 30
    end
    object qryViewVentasMastNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'VIEW_VENTAS_MAST.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryViewVentasMastCOMENTARIO: TIBStringField
      FieldName = 'COMENTARIO'
      Origin = 'VIEW_VENTAS_MAST.COMENTARIO'
      Size = 80
    end
    object qryViewVentasMastMONTO_RECARGO: TFloatField
      FieldName = 'MONTO_RECARGO'
      Origin = 'VIEW_VENTAS_MAST.MONTO_RECARGO'
    end
    object qryViewVentasMastTIPONCFIFISCAL: TIntegerField
      FieldName = 'TIPONCFIFISCAL'
      Origin = 'VIEW_VENTAS_MAST.TIPONCFIFISCAL'
    end
    object qryViewVentasMastMontoRetencion: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'MontoRetencion'
      Calculated = True
    end
    object qryViewVentasMastIDRETENCION: TIntegerField
      FieldName = 'IDRETENCION'
      Origin = 'VIEW_VENTAS_MAST.IDRETENCION'
    end
    object qryViewVentasMastCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VIEW_VENTAS_MAST.CIA_KEY'
    end
    object qryViewVentasMastFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VIEW_VENTAS_MAST.FECHA_IN'
    end
    object qryViewVentasMastIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VIEW_VENTAS_MAST.IN_POR'
      Size = 12
    end
    object qryViewVentasMastFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VIEW_VENTAS_MAST.FECHA_MOD'
    end
    object qryViewVentasMastMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VIEW_VENTAS_MAST.MOD_POR'
      Size = 12
    end
    object qryViewVentasMastMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'VIEW_VENTAS_MAST.MONTO_TOTAL_ITBIS'
    end
    object qryViewVentasMastMONTODESCGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCGASTOSADMIN'
      Origin = 'VIEW_VENTAS_MAST.MONTODESCGASTOSADMIN'
    end
    object qryViewVentasMastMONTODESCITBISGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCITBISGASTOSADMIN'
      Origin = 'VIEW_VENTAS_MAST.MONTODESCITBISGASTOSADMIN'
    end
    object qryViewVentasMastMONTODESCTRANSP: TFloatField
      FieldName = 'MONTODESCTRANSP'
      Origin = 'VIEW_VENTAS_MAST.MONTODESCTRANSP'
    end
    object qryViewVentasMastMONTODESCDIRTECNICA: TFloatField
      FieldName = 'MONTODESCDIRTECNICA'
      Origin = 'VIEW_VENTAS_MAST.MONTODESCDIRTECNICA'
    end
    object qryViewVentasMastMONTODESCITBISDIRTECNICA: TFloatField
      FieldName = 'MONTODESCITBISDIRTECNICA'
      Origin = 'VIEW_VENTAS_MAST.MONTODESCITBISDIRTECNICA'
    end
    object qryViewVentasMastMONTODESCIMPREVISTO: TFloatField
      FieldName = 'MONTODESCIMPREVISTO'
      Origin = 'VIEW_VENTAS_MAST.MONTODESCIMPREVISTO'
    end
    object qryViewVentasMastMONTODESCITBISIMPREVISTO: TFloatField
      FieldName = 'MONTODESCITBISIMPREVISTO'
      Origin = 'VIEW_VENTAS_MAST.MONTODESCITBISIMPREVISTO'
    end
    object qryViewVentasMastMONTO_EXONERADO_ITBIS: TFloatField
      FieldName = 'MONTO_EXONERADO_ITBIS'
      Origin = 'VIEW_VENTAS_MAST.MONTO_EXONERADO_ITBIS'
    end
    object qryViewVentasMastPROPINA: TFloatField
      FieldName = 'PROPINA'
      Origin = 'VIEW_VENTAS_MAST.PROPINA'
    end
    object qryViewVentasMastPORCPROPINALEGAL: TFloatField
      FieldName = 'PORCPROPINALEGAL'
      Origin = 'VIEW_VENTAS_MAST.PORCPROPINALEGAL'
    end
    object qryViewVentasMastPROPINALEGAL: TFloatField
      FieldName = 'PROPINALEGAL'
      Origin = 'VIEW_VENTAS_MAST.PROPINALEGAL'
    end
    object qryViewVentasMastCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'VIEW_VENTAS_MAST.CIUDAD'
      Size = 30
    end
    object qryViewVentasMastFECHA_VENCE: TDateTimeField
      FieldName = 'FECHA_VENCE'
      Origin = 'VIEW_VENTAS_MAST.FECHA_VENCE'
    end
    object qryViewVentasMastDESC_SECTOR: TIBStringField
      FieldName = 'DESC_SECTOR'
      Origin = 'VIEW_VENTAS_MAST.DESC_SECTOR'
      Size = 40
    end
    object qryViewVentasMastDESC_CIUDAD: TIBStringField
      FieldName = 'DESC_CIUDAD'
      Origin = 'VIEW_VENTAS_MAST.DESC_CIUDAD'
      Size = 35
    end
    object qryViewVentasMastCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'VIEW_VENTAS_MAST.CANT_DIAS_CREDITO'
    end
    object qryViewVentasMastEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'VIEW_VENTAS_MAST.EMAIL'
      Size = 40
    end
    object qryViewVentasMastREFERENCIACTE: TIBStringField
      FieldName = 'REFERENCIACTE'
      Origin = 'VIEW_VENTAS_MAST.REFERENCIACTE'
    end
    object qryViewVentasMastNOMBRE_VENDEDOR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOMBRE_VENDEDOR'
      Origin = 'VIEW_VENTAS_MAST.NOMBRE_VENDEDOR'
      ReadOnly = True
      Size = 71
    end
    object qryViewVentasMastFECHAINICIAPOLIZA: TDateTimeField
      FieldName = 'FECHAINICIAPOLIZA'
      Origin = 'VIEW_VENTAS_MAST.FECHAINICIAPOLIZA'
    end
    object qryViewVentasMastTIPO_AFILIADO: TSmallintField
      FieldName = 'TIPO_AFILIADO'
      Origin = 'VIEW_VENTAS_MAST.TIPO_AFILIADO'
    end
    object qryViewVentasMastDESCTIPOAFILIADO: TIBStringField
      FieldName = 'DESCTIPOAFILIADO'
      Origin = 'VIEW_VENTAS_MAST.DESCTIPOAFILIADO'
      Size = 80
    end
    object qryViewVentasMastDESC_FORMAPAGO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'DESC_FORMAPAGO'
      Origin = 'VIEW_VENTAS_MAST.DESC_FORMAPAGO'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object qryViewVentasMastFECHA_VENCEFCT: TDateTimeField
      FieldName = 'FECHA_VENCEFCT'
      Origin = 'VIEW_VENTAS_MAST.FECHA_VENCEFCT'
    end
    object qryViewVentasMastIDNUMERODVEH: TIntegerField
      FieldName = 'IDNUMERODVEH'
      Origin = 'VIEW_VENTAS_MAST.IDNUMERODVEH'
    end
  end
  object qryViewVentasDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From VIEW_VENTAS_DET'
      'Where numero =:numero')
    Left = 503
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryViewVentasDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VIEW_VENTAS_DET.SERIE'
    end
    object qryViewVentasDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_VENTAS_DET.NUMERO'
    end
    object qryViewVentasDetCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VIEW_VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryViewVentasDetCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VIEW_VENTAS_DET.CODIGO_BARRA'
    end
    object qryViewVentasDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VIEW_VENTAS_DET.CANTIDAD'
    end
    object qryViewVentasDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VIEW_VENTAS_DET.PRECIO'
    end
    object qryViewVentasDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VIEW_VENTAS_DET.PORC_DESC_DET'
    end
    object qryViewVentasDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VIEW_VENTAS_DET.ITBI_DET'
    end
    object qryViewVentasDetVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VIEW_VENTAS_DET.VALOR_SERVICIO_DET'
    end
    object qryViewVentasDetVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VIEW_VENTAS_DET.VALOR_TOTAL_DET'
    end
    object qryViewVentasDetNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VIEW_VENTAS_DET.NUM_FACTURA'
    end
    object qryViewVentasDetSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VIEW_VENTAS_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryViewVentasDetCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VIEW_VENTAS_DET.CANT_REGRESO'
    end
    object qryViewVentasDetCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VIEW_VENTAS_DET.CANT_PROMO'
    end
    object qryViewVentasDetMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VIEW_VENTAS_DET.MONTO_DIETA'
    end
    object qryViewVentasDetMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VIEW_VENTAS_DET.MONTO_AJUSTE'
    end
    object qryViewVentasDetSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VIEW_VENTAS_DET.SERIE_PROD'
      Size = 50
    end
    object qryViewVentasDetSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VIEW_VENTAS_DET.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryViewVentasDetTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VIEW_VENTAS_DET.TIPO_VENTA'
    end
    object qryViewVentasDetDESC_TIPOUNIDAD: TIBStringField
      FieldName = 'DESC_TIPOUNIDAD'
      Origin = 'VIEW_VENTAS_DET.DESC_TIPOUNIDAD'
      Size = 50
    end
    object qryViewVentasDetCX_TIPOUNIDAD: TIntegerField
      FieldName = 'CX_TIPOUNIDAD'
      Origin = 'VIEW_VENTAS_DET.CX_TIPOUNIDAD'
    end
    object qryViewVentasDetIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'VIEW_VENTAS_DET.IDUNIDAD'
    end
    object qryViewVentasDetDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VIEW_VENTAS_DET.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryViewVentasDetMontototal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Montototal'
      Calculated = True
    end
    object qryViewVentasDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VIEW_VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object qryViewVentasDetPORC_DESC_ITEM: TFloatField
      FieldName = 'PORC_DESC_ITEM'
      Origin = 'VIEW_VENTAS_DET.PORC_DESC_ITEM'
    end
    object qryViewVentasDetMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VIEW_VENTAS_DET.MONTO_DESC_ITEM'
    end
    object qryViewVentasDetFICHA_VEH: TIntegerField
      FieldName = 'FICHA_VEH'
      Origin = 'VIEW_VENTAS_DET.FICHA_VEH'
    end
    object qryViewVentasDetNUM_IDENT: TIBStringField
      FieldName = 'NUM_IDENT'
      Origin = 'VIEW_VENTAS_DET.NUM_IDENT'
      Size = 40
    end
    object qryViewVentasDetITBIS_FISCAL_DET: TFloatField
      FieldName = 'ITBIS_FISCAL_DET'
      Origin = 'VIEW_VENTAS_DET.ITBIS_FISCAL_DET'
    end
    object qryViewVentasDetIDTASAITBIS: TFloatField
      FieldName = 'IDTASAITBIS'
      Origin = 'VIEW_VENTAS_DET.IDTASAITBIS'
    end
    object qryViewVentasDetMONTOIBISRECARGO: TFloatField
      FieldName = 'MONTOIBISRECARGO'
      Origin = 'VIEW_VENTAS_DET.MONTOIBISRECARGO'
    end
    object qryViewVentasDetMONTO_TASA: TFloatField
      FieldName = 'MONTO_TASA'
      Origin = 'VIEW_VENTAS_DET.MONTO_TASA'
    end
    object qryViewVentasDetMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VIEW_VENTAS_DET.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryViewVentasDetNUM_CONDUCE_CTE: TIBStringField
      FieldName = 'NUM_CONDUCE_CTE'
      Origin = 'VIEW_VENTAS_DET.NUM_CONDUCE_CTE'
      Size = 60
    end
    object qryViewVentasDetCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VIEW_VENTAS_DET.CODIGO_VENDEDOR'
    end
  end
  object qryRepInvFisicoPan: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  T.*,'
      '  I.DESCRIPCION,'
      '  E.NOMBRE || " " || E.APELLIDO AS NOMBREEMPLEADO'
      'FROM'
      '  TRAN_INVENTARIO_PAN T'
      '  INNER JOIN INVENTARIO_PRODUCTO I ON (T.CODIGO_PROD = I.CODIGO)'
      '  LEFT OUTER JOIN EMPLEADO E ON (T.COD_EMPLEADO = E.CODIGO)'
      'WHERE'
      '  (T.CODIGO_PROD = I.CODIGO) AND '
      '  (E.CODIGO = T.COD_EMPLEADO)'
      'And (t.fecha between :fechaini and :fechafin)')
    Left = 495
    Top = 432
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryRepInvFisicoPanID_TRAN: TIntegerField
      FieldName = 'ID_TRAN'
      Origin = 'TRAN_INVENTARIO_PAN.ID_TRAN'
      Required = True
    end
    object qryRepInvFisicoPanFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'TRAN_INVENTARIO_PAN.FECHA'
    end
    object qryRepInvFisicoPanCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'TRAN_INVENTARIO_PAN.CODIGO_PROD'
    end
    object qryRepInvFisicoPanCANT: TFloatField
      FieldName = 'CANT'
      Origin = 'TRAN_INVENTARIO_PAN.CANT'
    end
    object qryRepInvFisicoPanPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'TRAN_INVENTARIO_PAN.PRECIO_COMPRA'
    end
    object qryRepInvFisicoPanPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'TRAN_INVENTARIO_PAN.PRECIO'
    end
    object qryRepInvFisicoPanCOD_EMPLEADO: TIntegerField
      FieldName = 'COD_EMPLEADO'
      Origin = 'TRAN_INVENTARIO_PAN.COD_EMPLEADO'
    end
    object qryRepInvFisicoPanIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TRAN_INVENTARIO_PAN.IN_POR'
      Size = 12
    end
    object qryRepInvFisicoPanFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TRAN_INVENTARIO_PAN.FECHA_IN'
    end
    object qryRepInvFisicoPanSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRAN_INVENTARIO_PAN.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepInvFisicoPanDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryRepInvFisicoPanNOMBREEMPLEADO: TIBStringField
      FieldName = 'NOMBREEMPLEADO'
      Size = 71
    end
  end
  object qryRelacionFacturasDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select v.FECHA, d.CODIGO_PROD, d.DESCRIPCION, d.CANTIDAD '
      'From VENTAS_MAST v, ventas_det d'
      'Where v.NUMERO_FACTURA =:numero'
      'And d.NUMERO = v.NUMERO')
    Left = 568
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryRelacionFacturasDetFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryRelacionFacturasDetCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryRelacionFacturasDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET.CANTIDAD'
    end
    object qryRelacionFacturasDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
  end
  object qryRepEstudianteRep: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select m.IDFAMILIA, m.ID_ESTUDIANTE,'
      'm.PRIMERNOMBRE ||'#39' '#39'||  coalesce(m.SEGUNDONOMBRE,'#39#39') ||'#39' '#39'|| '
      
        'm.PRIMERAPELLIDO ||'#39' '#39'||  coalesce(m.SEGUNDOAPELLIDO,'#39#39') nombre_' +
        'estudiante, m.FECHANACIMIENTO, m.STATUS'
      'From ESTUDIANTES_MASTER m'
      'Where idfamilia =:idfamilia')
    Left = 560
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idfamilia'
        ParamType = ptInput
      end>
  end
  object qryRepEstudianteRepMast: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepEstudianteRepMastAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  CLIENTES.CODIGO_CTE,'
      '  CLIENTES.NOMBRE_CTE nombre_tutor,'
      '  FAMILIA.CEDULA_PADRE,'
      
        '  FAMILIA.PRIMERNOMBREPADRE ||'#39' '#39'|| coalesce(FAMILIA.SEGUNDONOMB' +
        'REPADRE,'#39#39') ||'#39' '#39'||  '
      
        '  FAMILIA.PRIMERAPELLIDOPADRE  ||'#39' '#39'|| coalesce(FAMILIA.SEGUNDOA' +
        'PELLIDOPADRE,'#39#39') nombrepadre,'
      '  FAMILIA.CEDULA_MADRE,'
      
        '  FAMILIA.PRIMERNOMBREMADRE ||'#39' '#39'|| coalesce(FAMILIA.SEGUNDONOMB' +
        'REMADRE,'#39#39') ||'#39' '#39'|| '
      
        '  FAMILIA.PRIMERAPELLIDOMADRE ||'#39' '#39'|| coalesce(FAMILIA.SEGUNDOAP' +
        'ELLIDOMADRE,'#39#39') nombremadre,'
      '  ESTUDIANTES_MASTER.STATUS,'
      '  FAMILIA.FECHASALIDA,'
      '  FAMILIA.FECHAENTRADA,'
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.CEDULA cedula_tutor'
      'FROM'
      '  CLIENTES'
      
        '  LEFT OUTER JOIN FAMILIA ON (CLIENTES.CODIGO_CTE = FAMILIA.CODI' +
        'GO)'
      
        '  INNER JOIN ESTUDIANTES_MASTER ON (CLIENTES.CODIGO_CTE = ESTUDI' +
        'ANTES_MASTER.IDFAMILIA)'
      'WHERE'
      '  (ESTUDIANTES_MASTER.STATUS = '#39'A'#39')')
    Left = 560
    Top = 120
    object qryRepEstudianteRepMastCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryRepEstudianteRepMastNOMBRE_TUTOR: TIBStringField
      FieldName = 'NOMBRE_TUTOR'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryRepEstudianteRepMastCEDULA_PADRE: TIBStringField
      FieldName = 'CEDULA_PADRE'
      Origin = 'FAMILIA.CEDULA_PADRE'
      Size = 15
    end
    object qryRepEstudianteRepMastNOMBREPADRE: TIBStringField
      FieldName = 'NOMBREPADRE'
      Size = 243
    end
    object qryRepEstudianteRepMastCEDULA_MADRE: TIBStringField
      FieldName = 'CEDULA_MADRE'
      Origin = 'FAMILIA.CEDULA_MADRE'
      Size = 15
    end
    object qryRepEstudianteRepMastNOMBREMADRE: TIBStringField
      FieldName = 'NOMBREMADRE'
      Size = 243
    end
    object qryRepEstudianteRepMastSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FAMILIA.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepEstudianteRepMastFECHASALIDA: TDateTimeField
      FieldName = 'FECHASALIDA'
      Origin = 'FAMILIA.FECHASALIDA'
    end
    object qryRepEstudianteRepMastFECHAENTRADA: TDateTimeField
      FieldName = 'FECHAENTRADA'
      Origin = 'FAMILIA.FECHAENTRADA'
    end
    object qryRepEstudianteRepMastDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryRepEstudianteRepMastTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryRepEstudianteRepMastCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryRepEstudianteRepMastCEDULA_TUTOR: TIBStringField
      FieldName = 'CEDULA_TUTOR'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
  end
  object qryRepEstudiantesActivos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'L.ID_ESTUDIANTE, L.IDFAMILIA, L.STATUS, '
      'L.PRIMERNOMBRE ||'#39' '#39'||  coalesce(L.SEGUNDONOMBRE,'#39#39') ||'#39' '#39'|| '
      
        'L.PRIMERAPELLIDO ||'#39' '#39'||  coalesce(L.SEGUNDOAPELLIDO,'#39#39') nombre_' +
        'estudiante,l.desc_seccion,'
      
        'L.FECHANACIMIENTO,L.DESCRIPCION_CURSOS, L.NUMERO_ESTUDIANTE, L.I' +
        'DCURSO'
      ' FROM proc_listadoEstudiante L'
      'WHERE l.STATUS = '#39'A'#39
      'ORDER BY L.IDCURSO, L.ID_ESTUDIANTE')
    Left = 576
    Top = 205
    object qryRepEstudiantesActivosID_ESTUDIANTE: TIntegerField
      FieldName = 'ID_ESTUDIANTE'
      Origin = 'PROC_LISTADOESTUDIANTE.ID_ESTUDIANTE'
    end
    object qryRepEstudiantesActivosIDFAMILIA: TIntegerField
      FieldName = 'IDFAMILIA'
      Origin = 'PROC_LISTADOESTUDIANTE.IDFAMILIA'
    end
    object qryRepEstudiantesActivosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROC_LISTADOESTUDIANTE.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepEstudiantesActivosNOMBRE_ESTUDIANTE: TIBStringField
      FieldName = 'NOMBRE_ESTUDIANTE'
      Size = 153
    end
    object qryRepEstudiantesActivosFECHANACIMIENTO: TDateTimeField
      FieldName = 'FECHANACIMIENTO'
      Origin = 'PROC_LISTADOESTUDIANTE.FECHANACIMIENTO'
    end
    object qryRepEstudiantesActivosDESCRIPCION_CURSOS: TIBStringField
      FieldName = 'DESCRIPCION_CURSOS'
      Origin = 'PROC_LISTADOESTUDIANTE.DESCRIPCION_CURSOS'
      Size = 35
    end
    object qryRepEstudiantesActivosNUMERO_ESTUDIANTE: TIBStringField
      FieldName = 'NUMERO_ESTUDIANTE'
      Origin = 'PROC_LISTADOESTUDIANTE.NUMERO_ESTUDIANTE'
      Size = 10
    end
    object qryRepEstudiantesActivosIDCURSO: TIntegerField
      FieldName = 'IDCURSO'
      Origin = 'PROC_LISTADOESTUDIANTE.IDCURSO'
    end
    object qryRepEstudiantesActivosDESC_SECCION: TIBStringField
      FieldName = 'DESC_SECCION'
      Origin = 'PROC_LISTADOESTUDIANTE.DESC_SECCION'
      FixedChar = True
      Size = 8
    end
  end
  object qryGetDatosTemplateXLS: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from ProcGetTemplateXLS')
    Left = 496
    Top = 480
    object qryGetDatosTemplateXLSNOMBRE_TEMPLATE: TIBStringField
      FieldName = 'NOMBRE_TEMPLATE'
      Origin = 'PROCGETTEMPLATEXLS.NOMBRE_TEMPLATE'
      Size = 110
    end
    object qryGetDatosTemplateXLSNOMBRE_ARCHIVO: TIBStringField
      FieldName = 'NOMBRE_ARCHIVO'
      Origin = 'PROCGETTEMPLATEXLS.NOMBRE_ARCHIVO'
      Size = 110
    end
    object qryGetDatosTemplateXLSSERIEID: TIntegerField
      FieldName = 'SERIEID'
      Origin = 'PROCGETTEMPLATEXLS.SERIEID'
    end
    object qryGetDatosTemplateXLSNUMEROID: TIntegerField
      FieldName = 'NUMEROID'
      Origin = 'PROCGETTEMPLATEXLS.NUMEROID'
    end
    object qryGetDatosTemplateXLSSECCION: TIBStringField
      FieldName = 'SECCION'
      Origin = 'PROCGETTEMPLATEXLS.SECCION'
      Size = 30
    end
    object qryGetDatosTemplateXLSNOMBRE_CAMPO: TIBStringField
      FieldName = 'NOMBRE_CAMPO'
      Origin = 'PROCGETTEMPLATEXLS.NOMBRE_CAMPO'
      Size = 70
    end
    object qryGetDatosTemplateXLSDESCRIPCION_LABEL: TIBStringField
      FieldName = 'DESCRIPCION_LABEL'
      Origin = 'PROCGETTEMPLATEXLS.DESCRIPCION_LABEL'
      Size = 100
    end
    object qryGetDatosTemplateXLSCOLUMNA_NOMBRE: TIBStringField
      FieldName = 'COLUMNA_NOMBRE'
      Origin = 'PROCGETTEMPLATEXLS.COLUMNA_NOMBRE'
      Size = 8
    end
    object qryGetDatosTemplateXLSFILE_NUMERO: TIBStringField
      FieldName = 'FILE_NUMERO'
      Origin = 'PROCGETTEMPLATEXLS.FILE_NUMERO'
      Size = 8
    end
    object qryGetDatosTemplateXLSISDETAIL: TSmallintField
      FieldName = 'ISDETAIL'
      Origin = 'PROCGETTEMPLATEXLS.ISDETAIL'
    end
    object qryGetDatosTemplateXLSSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROCGETTEMPLATEXLS.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object QryServiciosTaller: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM view_servicios_taller'
      'WHERE FECHA BETWEEN :FECHAINI AND :FECHAFIN'
      'ORDER BY CODIGO_EMP, FECHA, COD_SERVICIO')
    Left = 576
    Top = 253
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAFIN'
        ParamType = ptInput
      end>
    object QryServiciosTallerDESCTIPOINVENTARIO: TIBStringField
      FieldName = 'DESCTIPOINVENTARIO'
      Origin = 'VIEW_SERVICIOS_TALLER.DESCTIPOINVENTARIO'
      Size = 30
    end
    object QryServiciosTallerDESCRIPCION_SERVICIO: TIBStringField
      FieldName = 'DESCRIPCION_SERVICIO'
      Origin = 'VIEW_SERVICIOS_TALLER.DESCRIPCION_SERVICIO'
      Size = 80
    end
    object QryServiciosTallerDESCRIPCIONADICIONAL: TMemoField
      FieldName = 'DESCRIPCIONADICIONAL'
      Origin = 'VIEW_SERVICIOS_TALLER.DESCRIPCIONADICIONAL'
      BlobType = ftMemo
      Size = 8
    end
    object QryServiciosTallerCOD_SERVICIO: TIntegerField
      FieldName = 'COD_SERVICIO'
      Origin = 'VIEW_SERVICIOS_TALLER.COD_SERVICIO'
    end
    object QryServiciosTallerSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VIEW_SERVICIOS_TALLER.SERIE'
    end
    object QryServiciosTallerNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_SERVICIOS_TALLER.NUMERO'
    end
    object QryServiciosTallerFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VIEW_SERVICIOS_TALLER.FECHA'
    end
    object QryServiciosTallerCANT: TFloatField
      FieldName = 'CANT'
      Origin = 'VIEW_SERVICIOS_TALLER.CANT'
    end
    object QryServiciosTallerVALOR_SERVICIO: TFloatField
      FieldName = 'VALOR_SERVICIO'
      Origin = 'VIEW_SERVICIOS_TALLER.VALOR_SERVICIO'
    end
    object QryServiciosTallerPORC_ITBIS: TFloatField
      FieldName = 'PORC_ITBIS'
      Origin = 'VIEW_SERVICIOS_TALLER.PORC_ITBIS'
    end
    object QryServiciosTallerPORC_DESC: TFloatField
      FieldName = 'PORC_DESC'
      Origin = 'VIEW_SERVICIOS_TALLER.PORC_DESC'
    end
    object QryServiciosTallerVALOR_ITBIS: TFloatField
      FieldName = 'VALOR_ITBIS'
      Origin = 'VIEW_SERVICIOS_TALLER.VALOR_ITBIS'
    end
    object QryServiciosTallerVALOR_DESCUENTO: TFloatField
      FieldName = 'VALOR_DESCUENTO'
      Origin = 'VIEW_SERVICIOS_TALLER.VALOR_DESCUENTO'
    end
    object QryServiciosTallerDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VIEW_SERVICIOS_TALLER.DESCRIPCION'
      Size = 60
    end
    object QryServiciosTallerSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VIEW_SERVICIOS_TALLER.STATUS'
      FixedChar = True
      Size = 1
    end
    object QryServiciosTallerCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'VIEW_SERVICIOS_TALLER.COD_USUARIO'
    end
    object QryServiciosTallerPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VIEW_SERVICIOS_TALLER.PRECIO'
    end
    object QryServiciosTallerFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'VIEW_SERVICIOS_TALLER.FECHA_ENTRADA'
    end
    object QryServiciosTallerFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'VIEW_SERVICIOS_TALLER.FECHA_SALIDA'
    end
    object QryServiciosTallerLAVADO: TSmallintField
      FieldName = 'LAVADO'
      Origin = 'VIEW_SERVICIOS_TALLER.LAVADO'
    end
    object QryServiciosTallerPLANCHADO: TSmallintField
      FieldName = 'PLANCHADO'
      Origin = 'VIEW_SERVICIOS_TALLER.PLANCHADO'
    end
    object QryServiciosTallerNOMBRE_CLIENTE: TIBStringField
      FieldName = 'NOMBRE_CLIENTE'
      Origin = 'VIEW_SERVICIOS_TALLER.NOMBRE_CLIENTE'
      Size = 60
    end
    object QryServiciosTallerMONTO_TOTAL: TFloatField
      FieldName = 'MONTO_TOTAL'
      Origin = 'VIEW_SERVICIOS_TALLER.MONTO_TOTAL'
    end
    object QryServiciosTallerSTATUSDET: TIBStringField
      FieldName = 'STATUSDET'
      Origin = 'VIEW_SERVICIOS_TALLER.STATUSDET'
      FixedChar = True
      Size = 1
    end
    object QryServiciosTallerMONTO_RECIBIDO: TFloatField
      FieldName = 'MONTO_RECIBIDO'
      Origin = 'VIEW_SERVICIOS_TALLER.MONTO_RECIBIDO'
    end
    object QryServiciosTallerMONTO_DEVUELTO: TFloatField
      FieldName = 'MONTO_DEVUELTO'
      Origin = 'VIEW_SERVICIOS_TALLER.MONTO_DEVUELTO'
    end
    object QryServiciosTallerCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'VIEW_SERVICIOS_TALLER.CODIGO_EMP'
    end
    object QryServiciosTallerNOMBREEMPLEADO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOMBREEMPLEADO'
      Origin = 'VIEW_SERVICIOS_TALLER.NOMBREEMPLEADO'
      ReadOnly = True
      Size = 71
    end
    object QryServiciosTallerCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
      Origin = 'VIEW_SERVICIOS_TALLER.CODIGO_CIA'
    end
    object QryServiciosTallerCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'VIEW_SERVICIOS_TALLER.CEDULA'
      Size = 14
    end
  end
  object qryViewVentasHist: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM VIEW_HIST_VENTA')
    Left = 582
    Top = 320
    object qryViewVentasHistNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'VIEW_HIST_VENTA.NOMBRE_ABREV'
      Size = 30
    end
    object qryViewVentasHistNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_HIST_VENTA.NUMERO'
    end
    object qryViewVentasHistFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VIEW_HIST_VENTA.FECHA'
    end
    object qryViewVentasHistCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VIEW_HIST_VENTA.CIA_KEY'
    end
    object qryViewVentasHistCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VIEW_HIST_VENTA.CODIGO_CTE'
    end
    object qryViewVentasHistCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VIEW_HIST_VENTA.CODIGO_VENDEDOR'
    end
    object qryViewVentasHistFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VIEW_HIST_VENTA.FORMA_PAGO'
    end
    object qryViewVentasHistOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VIEW_HIST_VENTA.OBSERVACION'
      Size = 60
    end
    object qryViewVentasHistMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VIEW_HIST_VENTA.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryViewVentasHistSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VIEW_HIST_VENTA.SERIE'
    end
    object qryViewVentasHistVALOR_TOTAL_DET_MAST: TFloatField
      FieldName = 'VALOR_TOTAL_DET_MAST'
      Origin = 'VIEW_HIST_VENTA.VALOR_TOTAL_DET_MAST'
    end
    object qryViewVentasHistSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VIEW_HIST_VENTA.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryViewVentasHistNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VIEW_HIST_VENTA.NUMERO_FACTURA'
    end
    object qryViewVentasHistCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VIEW_HIST_VENTA.CODIGO_PROD'
      Size = 40
    end
    object qryViewVentasHistDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VIEW_HIST_VENTA.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryViewVentasHistDESC_PRODUCTO_INVENTARIO: TIBStringField
      FieldName = 'DESC_PRODUCTO_INVENTARIO'
      Origin = 'VIEW_HIST_VENTA.DESC_PRODUCTO_INVENTARIO'
      Size = 80
    end
    object qryViewVentasHistNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VIEW_HIST_VENTA.NUMERO_DOC_PAGO'
    end
    object qryViewVentasHistNOMBREPROVEEDOR: TIBStringField
      FieldName = 'NOMBREPROVEEDOR'
      Origin = 'VIEW_HIST_VENTA.NOMBREPROVEEDOR'
      Size = 80
    end
    object qryViewVentasHistNOMBRE_VENDEDOR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOMBRE_VENDEDOR'
      Origin = 'VIEW_HIST_VENTA.NOMBRE_VENDEDOR'
      ReadOnly = True
      Size = 71
    end
    object qryViewVentasHistNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'VIEW_HIST_VENTA.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryViewVentasHistNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'VIEW_HIST_VENTA.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
    object qryViewVentasHistSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VIEW_HIST_VENTA.SERIE_NCF_ASIGNADO'
    end
    object qryViewVentasHistMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'VIEW_HIST_VENTA.MONTO_BRUTO'
    end
    object qryViewVentasHistPORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VIEW_HIST_VENTA.PORC_DESCUENTO'
    end
    object qryViewVentasHistMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VIEW_HIST_VENTA.MONTO_DESCUENTO'
    end
    object qryViewVentasHistMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'VIEW_HIST_VENTA.MONTO_INICIAL'
    end
    object qryViewVentasHistMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VIEW_HIST_VENTA.MONTO_PAGADO'
    end
    object qryViewVentasHistMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'VIEW_HIST_VENTA.MONTO_CAMBIO'
    end
    object qryViewVentasHistMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'VIEW_HIST_VENTA.MONTO_TOTAL_ITBIS'
    end
    object qryViewVentasHistMONTODESCGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCGASTOSADMIN'
      Origin = 'VIEW_HIST_VENTA.MONTODESCGASTOSADMIN'
    end
    object qryViewVentasHistMONTODESCITBISGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCITBISGASTOSADMIN'
      Origin = 'VIEW_HIST_VENTA.MONTODESCITBISGASTOSADMIN'
    end
    object qryViewVentasHistMONTODESCTRANSP: TFloatField
      FieldName = 'MONTODESCTRANSP'
      Origin = 'VIEW_HIST_VENTA.MONTODESCTRANSP'
    end
    object qryViewVentasHistMONTODESCDIRTECNICA: TFloatField
      FieldName = 'MONTODESCDIRTECNICA'
      Origin = 'VIEW_HIST_VENTA.MONTODESCDIRTECNICA'
    end
    object qryViewVentasHistMONTODESCITBISDIRTECNICA: TFloatField
      FieldName = 'MONTODESCITBISDIRTECNICA'
      Origin = 'VIEW_HIST_VENTA.MONTODESCITBISDIRTECNICA'
    end
    object qryViewVentasHistMONTODESCIMPREVISTO: TFloatField
      FieldName = 'MONTODESCIMPREVISTO'
      Origin = 'VIEW_HIST_VENTA.MONTODESCIMPREVISTO'
    end
    object qryViewVentasHistMONTODESCITBISIMPREVISTO: TFloatField
      FieldName = 'MONTODESCITBISIMPREVISTO'
      Origin = 'VIEW_HIST_VENTA.MONTODESCITBISIMPREVISTO'
    end
    object qryViewVentasHistCOMENTARIO: TIBStringField
      FieldName = 'COMENTARIO'
      Origin = 'VIEW_HIST_VENTA.COMENTARIO'
      Size = 80
    end
    object qryViewVentasHistDESCRIPCION_DET: TIBStringField
      FieldName = 'DESCRIPCION_DET'
      Origin = 'VIEW_HIST_VENTA.DESCRIPCION_DET'
      Size = 80
    end
    object qryViewVentasHistCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VIEW_HIST_VENTA.CANTIDAD'
    end
    object qryViewVentasHistPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VIEW_HIST_VENTA.PRECIO'
    end
    object qryViewVentasHistPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VIEW_HIST_VENTA.PORC_DESC_DET'
    end
    object qryViewVentasHistITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VIEW_HIST_VENTA.ITBI_DET'
    end
    object qryViewVentasHistVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VIEW_HIST_VENTA.VALOR_SERVICIO_DET'
    end
    object qryViewVentasHistVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VIEW_HIST_VENTA.VALOR_TOTAL_DET'
    end
    object qryViewVentasHistNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VIEW_HIST_VENTA.NUM_FACTURA'
    end
    object qryViewVentasHistSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VIEW_HIST_VENTA.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryViewVentasHistSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VIEW_HIST_VENTA.SERIE_PROD'
      Size = 50
    end
    object qryViewVentasHistSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VIEW_HIST_VENTA.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryViewVentasHistTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VIEW_HIST_VENTA.TIPO_UNIDAD'
    end
    object qryViewVentasHistITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VIEW_HIST_VENTA.ITBIS_EXENTO'
    end
    object qryViewVentasHistTIPO_VENTA_DET: TSmallintField
      FieldName = 'TIPO_VENTA_DET'
      Origin = 'VIEW_HIST_VENTA.TIPO_VENTA_DET'
    end
    object qryViewVentasHistPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'VIEW_HIST_VENTA.PRECIO_COMPRA'
    end
    object qryViewVentasHistDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'VIEW_HIST_VENTA.DIRECCION_CONT'
      Size = 60
    end
    object qryViewVentasHistTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'VIEW_HIST_VENTA.TELEF_CONTACTO'
      Size = 14
    end
    object qryViewVentasHistCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'VIEW_HIST_VENTA.CIUDAD'
      Size = 30
    end
    object qryViewVentasHistPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'VIEW_HIST_VENTA.PAIS'
      Size = 30
    end
    object qryViewVentasHistCODIGO_PROVEEDOR: TIntegerField
      FieldName = 'CODIGO_PROVEEDOR'
      Origin = 'VIEW_HIST_VENTA.CODIGO_PROVEEDOR'
    end
    object qryViewVentasHistCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'VIEW_HIST_VENTA.CODIGO_TEXTO'
      Size = 40
    end
    object qryViewVentasHistRUTA: TIntegerField
      FieldName = 'RUTA'
      Origin = 'VIEW_HIST_VENTA.RUTA'
    end
    object qryViewVentasHistDESC_RUTA: TIBStringField
      FieldName = 'DESC_RUTA'
      Origin = 'VIEW_HIST_VENTA.DESC_RUTA'
      Size = 30
    end
  end
  object qryViewVentasHist_base: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM VIEW_HIST_VENTA')
    Left = 614
    Top = 376
    object qryViewVentasHist_baseDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'VIEW_HIST_VENTA.DIRECCION_CONT'
      Size = 60
    end
    object qryViewVentasHist_baseTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'VIEW_HIST_VENTA.TELEF_CONTACTO'
      Size = 14
    end
    object qryViewVentasHist_baseCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'VIEW_HIST_VENTA.CIUDAD'
      Size = 30
    end
    object qryViewVentasHist_basePAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'VIEW_HIST_VENTA.PAIS'
      Size = 30
    end
    object qryViewVentasHist_baseNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'VIEW_HIST_VENTA.NOMBRE_ABREV'
      Size = 30
    end
    object qryViewVentasHist_baseNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_HIST_VENTA.NUMERO'
    end
    object qryViewVentasHist_baseFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VIEW_HIST_VENTA.FECHA'
    end
    object qryViewVentasHist_baseCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VIEW_HIST_VENTA.CIA_KEY'
    end
    object qryViewVentasHist_baseCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VIEW_HIST_VENTA.CODIGO_CTE'
    end
    object qryViewVentasHist_baseCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VIEW_HIST_VENTA.CODIGO_VENDEDOR'
    end
    object qryViewVentasHist_baseFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VIEW_HIST_VENTA.FORMA_PAGO'
    end
    object qryViewVentasHist_baseOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VIEW_HIST_VENTA.OBSERVACION'
      Size = 60
    end
    object qryViewVentasHist_baseMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VIEW_HIST_VENTA.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryViewVentasHist_baseVALOR_TOTAL_DET_MAST: TFloatField
      FieldName = 'VALOR_TOTAL_DET_MAST'
      Origin = 'VIEW_HIST_VENTA.VALOR_TOTAL_DET_MAST'
    end
    object qryViewVentasHist_baseSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VIEW_HIST_VENTA.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryViewVentasHist_baseNUMERO_FACTURA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VIEW_HIST_VENTA.NUMERO_FACTURA'
      ReadOnly = True
    end
    object qryViewVentasHist_baseNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VIEW_HIST_VENTA.NUMERO_DOC_PAGO'
    end
    object qryViewVentasHist_baseSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VIEW_HIST_VENTA.SERIE_NCF_ASIGNADO'
    end
    object qryViewVentasHist_baseMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'VIEW_HIST_VENTA.MONTO_BRUTO'
    end
    object qryViewVentasHist_basePORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VIEW_HIST_VENTA.PORC_DESCUENTO'
    end
    object qryViewVentasHist_baseMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VIEW_HIST_VENTA.MONTO_DESCUENTO'
    end
    object qryViewVentasHist_baseMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'VIEW_HIST_VENTA.MONTO_INICIAL'
    end
    object qryViewVentasHist_baseNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'VIEW_HIST_VENTA.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
    object qryViewVentasHist_baseMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VIEW_HIST_VENTA.MONTO_PAGADO'
    end
    object qryViewVentasHist_baseMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'VIEW_HIST_VENTA.MONTO_CAMBIO'
    end
    object qryViewVentasHist_baseMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'VIEW_HIST_VENTA.MONTO_TOTAL_ITBIS'
    end
    object qryViewVentasHist_baseMONTODESCGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCGASTOSADMIN'
      Origin = 'VIEW_HIST_VENTA.MONTODESCGASTOSADMIN'
    end
    object qryViewVentasHist_baseMONTODESCITBISGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCITBISGASTOSADMIN'
      Origin = 'VIEW_HIST_VENTA.MONTODESCITBISGASTOSADMIN'
    end
    object qryViewVentasHist_baseMONTODESCTRANSP: TFloatField
      FieldName = 'MONTODESCTRANSP'
      Origin = 'VIEW_HIST_VENTA.MONTODESCTRANSP'
    end
    object qryViewVentasHist_baseMONTODESCDIRTECNICA: TFloatField
      FieldName = 'MONTODESCDIRTECNICA'
      Origin = 'VIEW_HIST_VENTA.MONTODESCDIRTECNICA'
    end
    object qryViewVentasHist_baseMONTODESCITBISDIRTECNICA: TFloatField
      FieldName = 'MONTODESCITBISDIRTECNICA'
      Origin = 'VIEW_HIST_VENTA.MONTODESCITBISDIRTECNICA'
    end
    object qryViewVentasHist_baseMONTODESCIMPREVISTO: TFloatField
      FieldName = 'MONTODESCIMPREVISTO'
      Origin = 'VIEW_HIST_VENTA.MONTODESCIMPREVISTO'
    end
    object qryViewVentasHist_baseMONTODESCITBISIMPREVISTO: TFloatField
      FieldName = 'MONTODESCITBISIMPREVISTO'
      Origin = 'VIEW_HIST_VENTA.MONTODESCITBISIMPREVISTO'
    end
    object qryViewVentasHist_baseCOMENTARIO: TIBStringField
      FieldName = 'COMENTARIO'
      Origin = 'VIEW_HIST_VENTA.COMENTARIO'
      Size = 80
    end
    object qryViewVentasHist_baseNOMBRE_FACTURAR: TFloatField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'VIEW_HIST_VENTA.NOMBRE_FACTURAR'
    end
    object qryViewVentasHist_baseCOD_VENDEDOR: TFloatField
      FieldName = 'COD_VENDEDOR'
      Origin = 'VIEW_HIST_VENTA.COD_VENDEDOR'
    end
    object qryViewVentasHist_baseSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'VIEW_HIST_VENTA.SERIE'
      Size = 40
    end
    object qryViewVentasHist_baseDESCRIPCION_DET: TIntegerField
      FieldName = 'DESCRIPCION_DET'
      Origin = 'VIEW_HIST_VENTA.DESCRIPCION_DET'
    end
    object qryViewVentasHist_baseCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'VIEW_HIST_VENTA.CODIGO_PROD'
    end
    object qryViewVentasHist_baseCANTIDAD: TIBStringField
      FieldName = 'CANTIDAD'
      Origin = 'VIEW_HIST_VENTA.CANTIDAD'
      Size = 80
    end
    object qryViewVentasHist_basePRECIO: TIBStringField
      FieldName = 'PRECIO'
      Origin = 'VIEW_HIST_VENTA.PRECIO'
      Size = 40
    end
    object qryViewVentasHist_basePORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VIEW_HIST_VENTA.PORC_DESC_DET'
    end
    object qryViewVentasHist_baseITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VIEW_HIST_VENTA.ITBI_DET'
    end
    object qryViewVentasHist_baseVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VIEW_HIST_VENTA.VALOR_SERVICIO_DET'
    end
    object qryViewVentasHist_baseVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VIEW_HIST_VENTA.VALOR_TOTAL_DET'
    end
    object qryViewVentasHist_baseNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VIEW_HIST_VENTA.NUM_FACTURA'
    end
    object qryViewVentasHist_baseSTATUS_DET: TFloatField
      FieldName = 'STATUS_DET'
      Origin = 'VIEW_HIST_VENTA.STATUS_DET'
    end
    object qryViewVentasHist_baseSERIE_PROD: TFloatField
      FieldName = 'SERIE_PROD'
      Origin = 'VIEW_HIST_VENTA.SERIE_PROD'
    end
    object qryViewVentasHist_baseSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VIEW_HIST_VENTA.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryViewVentasHist_baseTIPO_UNIDAD: TIBStringField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VIEW_HIST_VENTA.TIPO_UNIDAD'
      Size = 50
    end
    object qryViewVentasHist_baseITBIS_EXENTO: TIBStringField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VIEW_HIST_VENTA.ITBIS_EXENTO'
      FixedChar = True
      Size = 1
    end
    object qryViewVentasHist_baseTIPO_VENTA_DET: TIntegerField
      FieldName = 'TIPO_VENTA_DET'
      Origin = 'VIEW_HIST_VENTA.TIPO_VENTA_DET'
    end
    object qryViewVentasHist_baseDESCRIPCIONPRODUCTO: TSmallintField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VIEW_HIST_VENTA.DESCRIPCIONPRODUCTO'
    end
    object qryViewVentasHist_baseDESC_PRODUCTO_INVENTARIO: TSmallintField
      FieldName = 'DESC_PRODUCTO_INVENTARIO'
      Origin = 'VIEW_HIST_VENTA.DESC_PRODUCTO_INVENTARIO'
    end
    object qryViewVentasHist_baseNOMBRE_VENDEDOR: TMemoField
      FieldName = 'NOMBRE_VENDEDOR'
      Origin = 'VIEW_HIST_VENTA.NOMBRE_VENDEDOR'
      BlobType = ftMemo
      Size = 8
    end
    object qryViewVentasHist_basePRECIO_COMPRA: TIBStringField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'VIEW_HIST_VENTA.PRECIO_COMPRA'
      Size = 80
    end
    object qryViewVentasHist_baseNOMBREPROVEEDOR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOMBREPROVEEDOR'
      Origin = 'VIEW_HIST_VENTA.NOMBREPROVEEDOR'
      ReadOnly = True
      Size = 71
    end
    object qryViewVentasHist_baseCODIGO_PROVEEDOR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'CODIGO_PROVEEDOR'
      Origin = 'VIEW_HIST_VENTA.CODIGO_PROVEEDOR'
      ReadOnly = True
    end
    object qryViewVentasHist_baseCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'VIEW_HIST_VENTA.CODIGO_TEXTO'
      Size = 80
    end
    object qryViewVentasHist_basePROPINA: TIntegerField
      FieldName = 'PROPINA'
      Origin = 'VIEW_HIST_VENTA.PROPINA'
    end
    object qryViewVentasHist_basePORCPROPINALEGAL: TIBStringField
      FieldName = 'PORCPROPINALEGAL'
      Origin = 'VIEW_HIST_VENTA.PORCPROPINALEGAL'
      Size = 40
    end
  end
  object qryClientes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '       C.CODIGO_CTE,'
      '       C.NOMBRE_FACTURAR,'
      '       T.DESCRIPCION AS DESCRIPCION_TIPOCTE,'
      '       C.NOMBRE_ABREV,'
      '       C.NOMBRE_CTE,'
      '       C.CONTACTO,'
      '       C.DIRECCION_CONT,'
      '       C.EMAIL,'
      '       C.FAX_CONTACTO,'
      '       C.FECHA_INSERTADO,'
      '       C.FECHA_MOD,'
      '       C.FORMA_PAGO,'
      '       C.FOTO,'
      '       C.LIMITE_CREDITO,'
      '       c.RNC_NUMERO,'
      '       C.MONEDA_FACT,'
      '       C.PAIS,'
      '       C.STATUS_CLIENTE,'
      '       C.TELEF_CONTACTO,'
      '       C.TIPO_CLIENTE,'
      '       C.WEBSITE,       '
      '       C.CIUDAD,c.ruta_foto,c.codzona,'
      '       C.CODIGO_AGENCIA, c.movil1, c.movil2, otro_telefono'
      'FROM CLIENTES C'
      '   LEFT OUTER JOIN TIPO_CLIENTE T ON (C.TIPO_CLIENTE = T.CODIGO)'
      'ORDER BY c.codigo_cte')
    Left = 632
    Top = 424
    object qryClientesCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryClientesNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryClientesDESCRIPCION_TIPOCTE: TIBStringField
      FieldName = 'DESCRIPCION_TIPOCTE'
      Origin = 'TIPO_CLIENTE.DESCRIPCION'
      Size = 30
    end
    object qryClientesNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object qryClientesNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
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
    object qryClientesEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object qryClientesFAX_CONTACTO: TIBStringField
      FieldName = 'FAX_CONTACTO'
      Origin = 'CLIENTES.FAX_CONTACTO'
      Size = 14
    end
    object qryClientesFECHA_INSERTADO: TDateTimeField
      FieldName = 'FECHA_INSERTADO'
      Origin = 'CLIENTES.FECHA_INSERTADO'
    end
    object qryClientesFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CLIENTES.FECHA_MOD'
    end
    object qryClientesFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'CLIENTES.FORMA_PAGO'
    end
    object qryClientesFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'CLIENTES.FOTO'
      Size = 8
    end
    object qryClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object qryClientesMONEDA_FACT: TIBStringField
      FieldName = 'MONEDA_FACT'
      Origin = 'CLIENTES.MONEDA_FACT'
      FixedChar = True
      Size = 1
    end
    object qryClientesPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryClientesSTATUS_CLIENTE: TIBStringField
      FieldName = 'STATUS_CLIENTE'
      Origin = 'CLIENTES.STATUS_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object qryClientesTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryClientesTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
    object qryClientesWEBSITE: TIBStringField
      FieldName = 'WEBSITE'
      Origin = 'CLIENTES.WEBSITE'
      Size = 40
    end
    object qryClientesCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryClientesCODIGO_AGENCIA: TSmallintField
      FieldName = 'CODIGO_AGENCIA'
      Origin = 'CLIENTES.CODIGO_AGENCIA'
    end
    object qryClientesRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryClientesMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'CLIENTES.MOVIL1'
    end
    object qryClientesMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'CLIENTES.MOVIL2'
    end
    object qryClientesOTRO_TELEFONO: TIBStringField
      FieldName = 'OTRO_TELEFONO'
      Origin = 'CLIENTES.OTRO_TELEFONO'
    end
    object qryClientesRUTA_FOTO: TIBStringField
      FieldName = 'RUTA_FOTO'
      Origin = 'CLIENTES.RUTA_FOTO'
      Size = 120
    end
    object qryClientesCODZONA: TIntegerField
      FieldName = 'CODZONA'
      Origin = 'CLIENTES.CODZONA'
    end
  end
  object qryRepVentaServicio: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.PAIS,'
      '  CLIENTES.NOMBRE_ABREV,'
      '  CLIENTES.NOMBRE_FACTURAR,'
      '  CLIENTES.COD_VENDEDOR,'
      '  INVENTARIO_PRODUCTO.DESCRIPCION,'
      '  EMPLEADO.NOMBRE||" " ||Empleado.APELLIDO AS nombreempleado,'
      '  INVENTARIO_PRODUCTO.PRECIO_COMPRA,'
      '  VENTAS_SERVICIO.CODIGO_CTE,'
      '  VENTAS_SERVICIO.CODIGO_OPERARIO,'
      '  VENTAS_SERVICIO.SERIE,'
      '  VENTAS_SERVICIO.FECHA,'
      '  VENTAS_SERVICIO.NUMERO_TRN,'
      '  VENTAS_SERVICIO.CODIGO_SERVICIO,'
      '  VENTAS_SERVICIO.DESCRIPCION,'
      '  VENTAS_SERVICIO.MONTO_SERVICIO,'
      '  VENTAS_SERVICIO.MONTO_COMISION,'
      '  VENTAS_SERVICIO.PORC_COMISION,'
      '  VENTAS_SERVICIO.MONTO_DESCUENTO,'
      '  VENTAS_SERVICIO.PORC_DESCUENTO,'
      '  VENTAS_SERVICIO.FECHA_IN,'
      '  VENTAS_SERVICIO.IN_POR,'
      '  VENTAS_SERVICIO.FECHA_MOD,'
      '  VENTAS_SERVICIO.MOD_POR,'
      '  VENTAS_SERVICIO.COMENTARIO,'
      '  VENTAS_SERVICIO.STATUS,'
      '  VENTAS_SERVICIO.COD_USUARIO,'
      '  CLIENTES.RNC'
      'FROM'
      '  CLIENTES'
      
        '  INNER JOIN VENTAS_SERVICIO ON (CLIENTES.CODIGO_CTE = VENTAS_SE' +
        'RVICIO.CODIGO_CTE)'
      
        '  INNER JOIN EMPLEADO ON (VENTAS_SERVICIO.CODIGO_OPERARIO = EMPL' +
        'EADO.CODIGO)'
      
        '  LEFT OUTER JOIN INVENTARIO_PRODUCTO ON (VENTAS_SERVICIO.CODIGO' +
        '_SERVICIO = INVENTARIO_PRODUCTO.CODIGO)'
      'Where  VENTAS_SERVICIO.FECHA between :fechaini and :fechafin'
      'and  VENTAS_SERVICIO.STATUS in ('#39'A'#39','#39'R'#39')'
      'Order by   VENTAS_SERVICIO.CODIGO_OPERARIO,'
      '  VENTAS_SERVICIO.FECHA')
    Left = 528
    Top = 184
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryRepVentaServicioDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryRepVentaServicioTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryRepVentaServicioCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryRepVentaServicioPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryRepVentaServicioNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object qryRepVentaServicioNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryRepVentaServicioCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'CLIENTES.COD_VENDEDOR'
    end
    object qryRepVentaServicioDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryRepVentaServicioNOMBREEMPLEADO: TIBStringField
      FieldName = 'NOMBREEMPLEADO'
      Size = 71
    end
    object qryRepVentaServicioPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryRepVentaServicioCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_SERVICIO.CODIGO_CTE'
      Required = True
    end
    object qryRepVentaServicioCODIGO_OPERARIO: TIntegerField
      FieldName = 'CODIGO_OPERARIO'
      Origin = 'VENTAS_SERVICIO.CODIGO_OPERARIO'
      Required = True
    end
    object qryRepVentaServicioSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_SERVICIO.SERIE'
      Required = True
    end
    object qryRepVentaServicioFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_SERVICIO.FECHA'
      Required = True
    end
    object qryRepVentaServicioNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'VENTAS_SERVICIO.NUMERO_TRN'
    end
    object qryRepVentaServicioCODIGO_SERVICIO: TIntegerField
      FieldName = 'CODIGO_SERVICIO'
      Origin = 'VENTAS_SERVICIO.CODIGO_SERVICIO'
      Required = True
    end
    object qryRepVentaServicioDESCRIPCION1: TIBStringField
      FieldName = 'DESCRIPCION1'
      Origin = 'VENTAS_SERVICIO.DESCRIPCION'
      Size = 80
    end
    object qryRepVentaServicioMONTO_SERVICIO: TFloatField
      FieldName = 'MONTO_SERVICIO'
      Origin = 'VENTAS_SERVICIO.MONTO_SERVICIO'
    end
    object qryRepVentaServicioMONTO_COMISION: TFloatField
      FieldName = 'MONTO_COMISION'
      Origin = 'VENTAS_SERVICIO.MONTO_COMISION'
    end
    object qryRepVentaServicioPORC_COMISION: TFloatField
      FieldName = 'PORC_COMISION'
      Origin = 'VENTAS_SERVICIO.PORC_COMISION'
    end
    object qryRepVentaServicioMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_SERVICIO.MONTO_DESCUENTO'
    end
    object qryRepVentaServicioPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VENTAS_SERVICIO.PORC_DESCUENTO'
    end
    object qryRepVentaServicioFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_SERVICIO.FECHA_IN'
    end
    object qryRepVentaServicioIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_SERVICIO.IN_POR'
      Size = 12
    end
    object qryRepVentaServicioFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_SERVICIO.FECHA_MOD'
    end
    object qryRepVentaServicioMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_SERVICIO.MOD_POR'
      Size = 12
    end
    object qryRepVentaServicioCOMENTARIO: TIBStringField
      FieldName = 'COMENTARIO'
      Origin = 'VENTAS_SERVICIO.COMENTARIO'
      Size = 80
    end
    object qryRepVentaServicioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENTAS_SERVICIO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepVentaServicioCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'VENTAS_SERVICIO.COD_USUARIO'
    end
    object qryRepVentaServicioRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'CLIENTES.RNC'
      Size = 12
    end
  end
  object qryRepCotizaciones: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.PAIS,'
      '  VIEW_COTIZACION_MASTER.NUMERO,'
      '  VIEW_COTIZACION_MASTER.FECHA,'
      '  VIEW_COTIZACION_MASTER.CIA_KEY,'
      '  VIEW_COTIZACION_MASTER.FECHA_VENCE,'
      '  VIEW_COTIZACION_MASTER.CODIGO_CTE,'
      '  VIEW_COTIZACION_MASTER.CODIGO_VENDEDOR,'
      '  VIEW_COTIZACION_MASTER.OBSERVACION,'
      '  VIEW_COTIZACION_MASTER.MONEDA,'
      '  VIEW_COTIZACION_MASTER.VALOR_TOTAL,'
      '  VIEW_COTIZACION_MASTER.STATUS,'
      '  VIEW_COTIZACION_MASTER.FECHA_IN,'
      '  VIEW_COTIZACION_MASTER.IN_POR,'
      '  VIEW_COTIZACION_MASTER.FECHA_MOD,'
      '  VIEW_COTIZACION_MASTER.MOD_POR,'
      '  VIEW_COTIZACION_MASTER.NUMERO_FACTURA,'
      '  VIEW_COTIZACION_MASTER.NUMERO_DOC_PAGO,'
      '  VIEW_COTIZACION_MASTER.SERIE_NCF_ASIGNADO,'
      '  VIEW_COTIZACION_MASTER.MONTO_BRUTO,'
      '  VIEW_COTIZACION_MASTER.PORC_DESCUENTO,'
      '  VIEW_COTIZACION_MASTER.MONTO_DESCUENTO,'
      '  VIEW_COTIZACION_MASTER.MONTO_INICIAL,'
      '  VIEW_COTIZACION_MASTER.NOMBRE_CLIENTE_GENERAL,'
      '  VIEW_COTIZACION_MASTER.MONTO_PAGADO,'
      '  VIEW_COTIZACION_MASTER.MONTO_CAMBIO,'
      '  VIEW_COTIZACION_MASTER.MONTO_TOTAL_ITBIS,'
      '  VIEW_COTIZACION_MASTER.MONTODESCGASTOSADMIN,'
      '  VIEW_COTIZACION_MASTER.MONTODESCITBISGASTOSADMIN,'
      '  VIEW_COTIZACION_MASTER.MONTODESCTRANSP,'
      '  VIEW_COTIZACION_MASTER.MONTODESCDIRTECNICA,'
      '  VIEW_COTIZACION_MASTER.MONTODESCITBISDIRTECNICA,'
      '  VIEW_COTIZACION_MASTER.MONTODESCIMPREVISTO,'
      '  VIEW_COTIZACION_MASTER.MONTODESCITBISIMPREVISTO,'
      '  VIEW_COTIZACION_MASTER.TIPO_FACTURA,'
      '  VIEW_COTIZACION_MASTER.APLICA_TIPODESC,'
      '  VIEW_COTIZACION_MASTER.COMENTARIO,'
      '  VIEW_COTIZACION_DET.SERIE,'
      '  VIEW_COTIZACION_DET.NUMERO,'
      '  VIEW_COTIZACION_DET.CODIGO_PROD,'
      '  VIEW_COTIZACION_DET.CODIGO_BARRA,'
      '  VIEW_COTIZACION_DET.DESCRIPCIONESPECIAL,'
      '  VIEW_COTIZACION_DET.DESCRIPCION,'
      '  VIEW_COTIZACION_DET.CANTIDAD,'
      '  VIEW_COTIZACION_DET.PRECIO,'
      '  VIEW_COTIZACION_DET.PORC_DESC_DET,'
      '  VIEW_COTIZACION_DET.ITBI_DET,'
      '  VIEW_COTIZACION_DET.VALOR_SERVICIO_DET,'
      '  VIEW_COTIZACION_DET.VALOR_TOTAL_DET,'
      '  VIEW_COTIZACION_DET.STATUS_DET,'
      '  VIEW_COTIZACION_DET.FECHA_IN,'
      '  VIEW_COTIZACION_DET.IN_POR,'
      '  VIEW_COTIZACION_DET.FECHA_MOD,'
      '  VIEW_COTIZACION_DET.MOD_POR,'
      '  VIEW_COTIZACION_DET.CANT_REGRESO,'
      '  VIEW_COTIZACION_DET.CANT_PROMO,'
      '  VIEW_COTIZACION_DET.MONTO_DIETA,'
      '  VIEW_COTIZACION_DET.MONTO_AJUSTE,'
      '  VIEW_COTIZACION_DET.SERIE_PROD,'
      '  VIEW_COTIZACION_DET.STATUS_CNT,'
      '  VIEW_COTIZACION_DET.TIPO_UNIDAD,'
      '  VIEW_COTIZACION_DET.ITBIS_EXENTO,'
      '  VIEW_COTIZACION_DET.TIPO_VENTA,'
      '  VIEW_COTIZACION_DET.DESCRIPCIONPRODUCTO,'
      '  PROVEEDORES.DESCRIPCION nombreproveedor,'
      '  INVENTARIO_PRODUCTO.CODIGO_TEXTO,'
      '  INVENTARIO_PRODUCTO.PRECIO_COMPRA,'
      '  CLIENTES.NOMBRE_FACTURAR,'
      '  CLIENTES.NOMBRE_ABREV,'
      '  EMPLEADO.NOMBRE||'#39' '#39'|| EMPLEADO.APELLIDO nombrevendedor,'
      '  EMPLEADO.CEDULA'
      'FROM'
      '  VIEW_COTIZACION_MASTER'
      
        '  INNER JOIN VIEW_COTIZACION_DET ON (VIEW_COTIZACION_MASTER.NUME' +
        'RO = VIEW_COTIZACION_DET.NUMERO)'
      
        '  INNER JOIN INVENTARIO_PRODUCTO ON (VIEW_COTIZACION_DET.CODIGO_' +
        'PROD = INVENTARIO_PRODUCTO.CODIGO)'
      
        '  LEFT OUTER JOIN PROVEEDORES ON (INVENTARIO_PRODUCTO.CODFABRICA' +
        'NTE = PROVEEDORES.CODIGO_CTE)'
      
        '  INNER JOIN CLIENTES ON (VIEW_COTIZACION_MASTER.CODIGO_CTE = CL' +
        'IENTES.CODIGO_CTE)'
      
        '  LEFT OUTER JOIN EMPLEADO ON (VIEW_COTIZACION_MASTER.CODIGO_VEN' +
        'DEDOR = EMPLEADO.CODIGO)'
      '')
    Left = 640
    Top = 128
    object qryRepCotizacionesNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_COTIZACION_MASTER.NUMERO'
    end
    object qryRepCotizacionesFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VIEW_COTIZACION_MASTER.FECHA'
    end
    object qryRepCotizacionesCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VIEW_COTIZACION_MASTER.CIA_KEY'
    end
    object qryRepCotizacionesFECHA_VENCE: TDateTimeField
      FieldName = 'FECHA_VENCE'
      Origin = 'VIEW_COTIZACION_MASTER.FECHA_VENCE'
    end
    object qryRepCotizacionesCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VIEW_COTIZACION_MASTER.CODIGO_CTE'
    end
    object qryRepCotizacionesCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VIEW_COTIZACION_MASTER.CODIGO_VENDEDOR'
    end
    object qryRepCotizacionesOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VIEW_COTIZACION_MASTER.OBSERVACION'
      Size = 60
    end
    object qryRepCotizacionesMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VIEW_COTIZACION_MASTER.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryRepCotizacionesVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VIEW_COTIZACION_MASTER.VALOR_TOTAL'
    end
    object qryRepCotizacionesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VIEW_COTIZACION_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepCotizacionesFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VIEW_COTIZACION_MASTER.FECHA_IN'
    end
    object qryRepCotizacionesIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VIEW_COTIZACION_MASTER.IN_POR'
      Size = 12
    end
    object qryRepCotizacionesFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VIEW_COTIZACION_MASTER.FECHA_MOD'
    end
    object qryRepCotizacionesMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VIEW_COTIZACION_MASTER.MOD_POR'
      Size = 12
    end
    object qryRepCotizacionesNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VIEW_COTIZACION_MASTER.NUMERO_FACTURA'
    end
    object qryRepCotizacionesNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VIEW_COTIZACION_MASTER.NUMERO_DOC_PAGO'
    end
    object qryRepCotizacionesSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VIEW_COTIZACION_MASTER.SERIE_NCF_ASIGNADO'
    end
    object qryRepCotizacionesMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'VIEW_COTIZACION_MASTER.MONTO_BRUTO'
    end
    object qryRepCotizacionesPORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VIEW_COTIZACION_MASTER.PORC_DESCUENTO'
    end
    object qryRepCotizacionesMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VIEW_COTIZACION_MASTER.MONTO_DESCUENTO'
    end
    object qryRepCotizacionesMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'VIEW_COTIZACION_MASTER.MONTO_INICIAL'
    end
    object qryRepCotizacionesNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'VIEW_COTIZACION_MASTER.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
    object qryRepCotizacionesMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VIEW_COTIZACION_MASTER.MONTO_PAGADO'
    end
    object qryRepCotizacionesMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'VIEW_COTIZACION_MASTER.MONTO_CAMBIO'
    end
    object qryRepCotizacionesMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'VIEW_COTIZACION_MASTER.MONTO_TOTAL_ITBIS'
    end
    object qryRepCotizacionesMONTODESCGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCGASTOSADMIN'
      Origin = 'VIEW_COTIZACION_MASTER.MONTODESCGASTOSADMIN'
    end
    object qryRepCotizacionesMONTODESCITBISGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCITBISGASTOSADMIN'
      Origin = 'VIEW_COTIZACION_MASTER.MONTODESCITBISGASTOSADMIN'
    end
    object qryRepCotizacionesMONTODESCTRANSP: TFloatField
      FieldName = 'MONTODESCTRANSP'
      Origin = 'VIEW_COTIZACION_MASTER.MONTODESCTRANSP'
    end
    object qryRepCotizacionesMONTODESCDIRTECNICA: TFloatField
      FieldName = 'MONTODESCDIRTECNICA'
      Origin = 'VIEW_COTIZACION_MASTER.MONTODESCDIRTECNICA'
    end
    object qryRepCotizacionesMONTODESCITBISDIRTECNICA: TFloatField
      FieldName = 'MONTODESCITBISDIRTECNICA'
      Origin = 'VIEW_COTIZACION_MASTER.MONTODESCITBISDIRTECNICA'
    end
    object qryRepCotizacionesMONTODESCIMPREVISTO: TFloatField
      FieldName = 'MONTODESCIMPREVISTO'
      Origin = 'VIEW_COTIZACION_MASTER.MONTODESCIMPREVISTO'
    end
    object qryRepCotizacionesMONTODESCITBISIMPREVISTO: TFloatField
      FieldName = 'MONTODESCITBISIMPREVISTO'
      Origin = 'VIEW_COTIZACION_MASTER.MONTODESCITBISIMPREVISTO'
    end
    object qryRepCotizacionesTIPO_FACTURA: TSmallintField
      FieldName = 'TIPO_FACTURA'
      Origin = 'VIEW_COTIZACION_MASTER.TIPO_FACTURA'
    end
    object qryRepCotizacionesAPLICA_TIPODESC: TSmallintField
      FieldName = 'APLICA_TIPODESC'
      Origin = 'VIEW_COTIZACION_MASTER.APLICA_TIPODESC'
    end
    object qryRepCotizacionesCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'VIEW_COTIZACION_MASTER.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepCotizacionesSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VIEW_COTIZACION_DET.SERIE'
    end
    object qryRepCotizacionesNUMERO1: TIntegerField
      FieldName = 'NUMERO1'
      Origin = 'VIEW_COTIZACION_DET.NUMERO'
    end
    object qryRepCotizacionesCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VIEW_COTIZACION_DET.CODIGO_PROD'
      Size = 12
    end
    object qryRepCotizacionesCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VIEW_COTIZACION_DET.CODIGO_BARRA'
    end
    object qryRepCotizacionesDESCRIPCIONESPECIAL: TMemoField
      FieldName = 'DESCRIPCIONESPECIAL'
      Origin = 'VIEW_COTIZACION_DET.DESCRIPCIONESPECIAL'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepCotizacionesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VIEW_COTIZACION_DET.DESCRIPCION'
      Size = 80
    end
    object qryRepCotizacionesCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VIEW_COTIZACION_DET.CANTIDAD'
    end
    object qryRepCotizacionesPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VIEW_COTIZACION_DET.PRECIO'
    end
    object qryRepCotizacionesPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VIEW_COTIZACION_DET.PORC_DESC_DET'
    end
    object qryRepCotizacionesITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VIEW_COTIZACION_DET.ITBI_DET'
    end
    object qryRepCotizacionesVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VIEW_COTIZACION_DET.VALOR_SERVICIO_DET'
    end
    object qryRepCotizacionesVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VIEW_COTIZACION_DET.VALOR_TOTAL_DET'
    end
    object qryRepCotizacionesSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VIEW_COTIZACION_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryRepCotizacionesFECHA_IN1: TDateTimeField
      FieldName = 'FECHA_IN1'
      Origin = 'VIEW_COTIZACION_DET.FECHA_IN'
    end
    object qryRepCotizacionesIN_POR1: TIBStringField
      FieldName = 'IN_POR1'
      Origin = 'VIEW_COTIZACION_DET.IN_POR'
      Size = 12
    end
    object qryRepCotizacionesFECHA_MOD1: TDateTimeField
      FieldName = 'FECHA_MOD1'
      Origin = 'VIEW_COTIZACION_DET.FECHA_MOD'
    end
    object qryRepCotizacionesMOD_POR1: TIBStringField
      FieldName = 'MOD_POR1'
      Origin = 'VIEW_COTIZACION_DET.MOD_POR'
      Size = 12
    end
    object qryRepCotizacionesCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VIEW_COTIZACION_DET.CANT_REGRESO'
    end
    object qryRepCotizacionesCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VIEW_COTIZACION_DET.CANT_PROMO'
    end
    object qryRepCotizacionesMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VIEW_COTIZACION_DET.MONTO_DIETA'
    end
    object qryRepCotizacionesMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VIEW_COTIZACION_DET.MONTO_AJUSTE'
    end
    object qryRepCotizacionesSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VIEW_COTIZACION_DET.SERIE_PROD'
      Size = 50
    end
    object qryRepCotizacionesSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VIEW_COTIZACION_DET.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryRepCotizacionesTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VIEW_COTIZACION_DET.TIPO_UNIDAD'
    end
    object qryRepCotizacionesITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VIEW_COTIZACION_DET.ITBIS_EXENTO'
    end
    object qryRepCotizacionesTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VIEW_COTIZACION_DET.TIPO_VENTA'
    end
    object qryRepCotizacionesDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VIEW_COTIZACION_DET.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepCotizacionesNOMBREPROVEEDOR: TIBStringField
      FieldName = 'NOMBREPROVEEDOR'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object qryRepCotizacionesCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryRepCotizacionesPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryRepCotizacionesNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryRepCotizacionesNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object qryRepCotizacionesNOMBREVENDEDOR: TIBStringField
      FieldName = 'NOMBREVENDEDOR'
      Size = 71
    end
    object qryRepCotizacionesCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'EMPLEADO.CEDULA'
      Size = 14
    end
    object qryRepCotizacionesDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryRepCotizacionesTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryRepCotizacionesCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryRepCotizacionesPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
  end
  object qryRepCotizacionesBase: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.PAIS,'
      '  VIEW_COTIZACION_MASTER.NUMERO,'
      '  VIEW_COTIZACION_MASTER.FECHA,'
      '  VIEW_COTIZACION_MASTER.CIA_KEY,'
      '  VIEW_COTIZACION_MASTER.FECHA_VENCE,'
      '  VIEW_COTIZACION_MASTER.CODIGO_CTE,'
      '  VIEW_COTIZACION_MASTER.CODIGO_VENDEDOR,'
      '  VIEW_COTIZACION_MASTER.OBSERVACION,'
      '  VIEW_COTIZACION_MASTER.MONEDA,'
      '  VIEW_COTIZACION_MASTER.VALOR_TOTAL,'
      '  VIEW_COTIZACION_MASTER.STATUS,'
      '  VIEW_COTIZACION_MASTER.FECHA_IN,'
      '  VIEW_COTIZACION_MASTER.IN_POR,'
      '  VIEW_COTIZACION_MASTER.FECHA_MOD,'
      '  VIEW_COTIZACION_MASTER.MOD_POR,'
      '  VIEW_COTIZACION_MASTER.NUMERO_FACTURA,'
      '  VIEW_COTIZACION_MASTER.NUMERO_DOC_PAGO,'
      '  VIEW_COTIZACION_MASTER.SERIE_NCF_ASIGNADO,'
      '  VIEW_COTIZACION_MASTER.MONTO_BRUTO,'
      '  VIEW_COTIZACION_MASTER.PORC_DESCUENTO,'
      '  VIEW_COTIZACION_MASTER.MONTO_DESCUENTO,'
      '  VIEW_COTIZACION_MASTER.MONTO_INICIAL,'
      '  VIEW_COTIZACION_MASTER.NOMBRE_CLIENTE_GENERAL,'
      '  VIEW_COTIZACION_MASTER.MONTO_PAGADO,'
      '  VIEW_COTIZACION_MASTER.MONTO_CAMBIO,'
      '  VIEW_COTIZACION_MASTER.MONTO_TOTAL_ITBIS,'
      '  VIEW_COTIZACION_MASTER.MONTODESCGASTOSADMIN,'
      '  VIEW_COTIZACION_MASTER.MONTODESCITBISGASTOSADMIN,'
      '  VIEW_COTIZACION_MASTER.MONTODESCTRANSP,'
      '  VIEW_COTIZACION_MASTER.MONTODESCDIRTECNICA,'
      '  VIEW_COTIZACION_MASTER.MONTODESCITBISDIRTECNICA,'
      '  VIEW_COTIZACION_MASTER.MONTODESCIMPREVISTO,'
      '  VIEW_COTIZACION_MASTER.MONTODESCITBISIMPREVISTO,'
      '  VIEW_COTIZACION_MASTER.TIPO_FACTURA,'
      '  VIEW_COTIZACION_MASTER.APLICA_TIPODESC,'
      '  VIEW_COTIZACION_MASTER.COMENTARIO,'
      '  VIEW_COTIZACION_DET.SERIE,'
      '  VIEW_COTIZACION_DET.NUMERO,'
      '  VIEW_COTIZACION_DET.CODIGO_PROD,'
      '  VIEW_COTIZACION_DET.CODIGO_BARRA,'
      '  VIEW_COTIZACION_DET.DESCRIPCIONESPECIAL,'
      '  VIEW_COTIZACION_DET.DESCRIPCION,'
      '  VIEW_COTIZACION_DET.CANTIDAD,'
      '  VIEW_COTIZACION_DET.PRECIO,'
      '  VIEW_COTIZACION_DET.PORC_DESC_DET,'
      '  VIEW_COTIZACION_DET.ITBI_DET,'
      '  VIEW_COTIZACION_DET.VALOR_SERVICIO_DET,'
      '  VIEW_COTIZACION_DET.VALOR_TOTAL_DET,'
      '  VIEW_COTIZACION_DET.STATUS_DET,'
      '  VIEW_COTIZACION_DET.FECHA_IN,'
      '  VIEW_COTIZACION_DET.IN_POR,'
      '  VIEW_COTIZACION_DET.FECHA_MOD,'
      '  VIEW_COTIZACION_DET.MOD_POR,'
      '  VIEW_COTIZACION_DET.CANT_REGRESO,'
      '  VIEW_COTIZACION_DET.CANT_PROMO,'
      '  VIEW_COTIZACION_DET.MONTO_DIETA,'
      '  VIEW_COTIZACION_DET.MONTO_AJUSTE,'
      '  VIEW_COTIZACION_DET.SERIE_PROD,'
      '  VIEW_COTIZACION_DET.STATUS_CNT,'
      '  VIEW_COTIZACION_DET.TIPO_UNIDAD,'
      '  VIEW_COTIZACION_DET.ITBIS_EXENTO,'
      '  VIEW_COTIZACION_DET.TIPO_VENTA,'
      '  VIEW_COTIZACION_DET.DESCRIPCIONPRODUCTO,'
      '  PROVEEDORES.DESCRIPCION nombreproveedor,'
      '  INVENTARIO_PRODUCTO.CODIGO_TEXTO,'
      '  INVENTARIO_PRODUCTO.PRECIO_COMPRA,'
      '  CLIENTES.NOMBRE_FACTURAR,'
      '  CLIENTES.NOMBRE_ABREV,'
      '  EMPLEADO.NOMBRE||'#39' '#39'|| EMPLEADO.APELLIDO nombrevendedor,'
      '  EMPLEADO.CEDULA'
      'FROM'
      '  VIEW_COTIZACION_MASTER'
      
        '  INNER JOIN VIEW_COTIZACION_DET ON (VIEW_COTIZACION_MASTER.NUME' +
        'RO = VIEW_COTIZACION_DET.NUMERO)'
      
        '  INNER JOIN INVENTARIO_PRODUCTO ON (VIEW_COTIZACION_DET.CODIGO_' +
        'PROD = INVENTARIO_PRODUCTO.CODIGO)'
      
        '  LEFT OUTER JOIN PROVEEDORES ON (INVENTARIO_PRODUCTO.CODFABRICA' +
        'NTE = PROVEEDORES.CODIGO_CTE)'
      
        '  INNER JOIN CLIENTES ON (VIEW_COTIZACION_MASTER.CODIGO_CTE = CL' +
        'IENTES.CODIGO_CTE)'
      
        '  LEFT OUTER JOIN EMPLEADO ON (VIEW_COTIZACION_MASTER.CODIGO_VEN' +
        'DEDOR = EMPLEADO.CODIGO)'
      '')
    Left = 640
    Top = 176
  end
  object qryProvInvLook: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  codigo_cte, descripcion  from PROVEEDORES')
    Left = 656
    Top = 288
    object qryProvInvLookCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROVEEDORES.CODIGO_CTE'
      Required = True
    end
    object qryProvInvLookDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
  end
  object qryRepDatosCteVeh: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qryRepDatosCteVehCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  D.*, c.*, T.DESCRIPCION DESCTIPO_CLIENTE'
      'FROM CLIENTES C'
      'LEFT OUTER JOIN TIPO_CLIENTE T ON (C.TIPO_CLIENTE = T.CODIGO)'
      'Join  DATOSVEHICULO D On d.codigo_cte = c.codigo_cte'
      'And F_MONTH(D.FECHA_VENCE_SEGURO)  Between :mesini And :mesfin'
      'Order By c.tipo_cliente, FECHA_VENCE_SEGURO')
    Left = 616
    Top = 488
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
    object qryRepDatosCteVehNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DATOSVEHICULO.NUMERO'
      Required = True
    end
    object qryRepDatosCteVehCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'DATOSVEHICULO.CODIGO_CTE'
      Required = True
    end
    object qryRepDatosCteVehPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'DATOSVEHICULO.PLACA'
      Size = 12
    end
    object qryRepDatosCteVehIDMARCA: TIntegerField
      FieldName = 'IDMARCA'
      Origin = 'DATOSVEHICULO.IDMARCA'
    end
    object qryRepDatosCteVehMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'DATOSVEHICULO.MODELO'
    end
    object qryRepDatosCteVehANO_VEH: TIntegerField
      FieldName = 'ANO_VEH'
      Origin = 'DATOSVEHICULO.ANO_VEH'
    end
    object qryRepDatosCteVehFECHA_VENCE_SEGURO: TDateTimeField
      FieldName = 'FECHA_VENCE_SEGURO'
      Origin = 'DATOSVEHICULO.FECHA_VENCE_SEGURO'
    end
    object qryRepDatosCteVehTIPO_SEGURO: TSmallintField
      FieldName = 'TIPO_SEGURO'
      Origin = 'DATOSVEHICULO.TIPO_SEGURO'
    end
    object qryRepDatosCteVehCIA_SEGURO: TIBStringField
      FieldName = 'CIA_SEGURO'
      Origin = 'DATOSVEHICULO.CIA_SEGURO'
      Size = 50
    end
    object qryRepDatosCteVehEMPRESA_LABORA: TIBStringField
      FieldName = 'EMPRESA_LABORA'
      Origin = 'DATOSVEHICULO.EMPRESA_LABORA'
      Size = 80
    end
    object qryRepDatosCteVehFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DATOSVEHICULO.FECHA_IN'
    end
    object qryRepDatosCteVehIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DATOSVEHICULO.IN_POR'
      Size = 12
    end
    object qryRepDatosCteVehCODIGO_CTE1: TIntegerField
      FieldName = 'CODIGO_CTE1'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryRepDatosCteVehCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'CLIENTES.CIA_KEY'
    end
    object qryRepDatosCteVehTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
    object qryRepDatosCteVehFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'CLIENTES.FOTO'
      Size = 8
    end
    object qryRepDatosCteVehNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryRepDatosCteVehNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object qryRepDatosCteVehMONEDA_FACT: TIBStringField
      FieldName = 'MONEDA_FACT'
      Origin = 'CLIENTES.MONEDA_FACT'
      FixedChar = True
      Size = 1
    end
    object qryRepDatosCteVehNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryRepDatosCteVehCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'CLIENTES.CONTACTO'
      Size = 30
    end
    object qryRepDatosCteVehDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryRepDatosCteVehTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryRepDatosCteVehFAX_CONTACTO: TIBStringField
      FieldName = 'FAX_CONTACTO'
      Origin = 'CLIENTES.FAX_CONTACTO'
      Size = 14
    end
    object qryRepDatosCteVehFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'CLIENTES.FORMA_PAGO'
    end
    object qryRepDatosCteVehCODIGO_AGENCIA: TSmallintField
      FieldName = 'CODIGO_AGENCIA'
      Origin = 'CLIENTES.CODIGO_AGENCIA'
    end
    object qryRepDatosCteVehSTATUS_CLIENTE: TIBStringField
      FieldName = 'STATUS_CLIENTE'
      Origin = 'CLIENTES.STATUS_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object qryRepDatosCteVehINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'CLIENTES.INSERTADO_POR'
      Size = 12
    end
    object qryRepDatosCteVehFECHA_INSERTADO: TDateTimeField
      FieldName = 'FECHA_INSERTADO'
      Origin = 'CLIENTES.FECHA_INSERTADO'
    end
    object qryRepDatosCteVehFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CLIENTES.FECHA_MOD'
    end
    object qryRepDatosCteVehMODI_POR: TIBStringField
      FieldName = 'MODI_POR'
      Origin = 'CLIENTES.MODI_POR'
      Size = 12
    end
    object qryRepDatosCteVehLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object qryRepDatosCteVehEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object qryRepDatosCteVehWEBSITE: TIBStringField
      FieldName = 'WEBSITE'
      Origin = 'CLIENTES.WEBSITE'
      Size = 40
    end
    object qryRepDatosCteVehPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryRepDatosCteVehCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryRepDatosCteVehCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryRepDatosCteVehRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'CLIENTES.RNC'
      Size = 12
    end
    object qryRepDatosCteVehREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'CLIENTES.REFERENCIA'
      Size = 40
    end
    object qryRepDatosCteVehTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'CLIENTES.TELEF_REFERENCIA'
    end
    object qryRepDatosCteVehOTRO_TELEFONO: TIBStringField
      FieldName = 'OTRO_TELEFONO'
      Origin = 'CLIENTES.OTRO_TELEFONO'
    end
    object qryRepDatosCteVehCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'CLIENTES.CANT_DIAS_CREDITO'
    end
    object qryRepDatosCteVehTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'CLIENTES.TIPO_NCF'
      FixedChar = True
      Size = 2
    end
    object qryRepDatosCteVehOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = 'CLIENTES.OBSERVACION'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepDatosCteVehLUGAR_DE_TRABAJO: TIBStringField
      FieldName = 'LUGAR_DE_TRABAJO'
      Origin = 'CLIENTES.LUGAR_DE_TRABAJO'
      Size = 40
    end
    object qryRepDatosCteVehAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'CLIENTES.APODO'
    end
    object qryRepDatosCteVehCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'CLIENTES.CODIGO_USUARIO'
    end
    object qryRepDatosCteVehRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryRepDatosCteVehCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'CLIENTES.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepDatosCteVehCONDICION: TIntegerField
      FieldName = 'CONDICION'
      Origin = 'CLIENTES.CONDICION'
    end
    object qryRepDatosCteVehPRECIO_ID: TIntegerField
      FieldName = 'PRECIO_ID'
      Origin = 'CLIENTES.PRECIO_ID'
    end
    object qryRepDatosCteVehTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Origin = 'CLIENTES.TIPO_CF'
      FixedChar = True
      Size = 2
    end
    object qryRepDatosCteVehMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'CLIENTES.MOVIL1'
    end
    object qryRepDatosCteVehMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'CLIENTES.MOVIL2'
    end
    object qryRepDatosCteVehCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'CLIENTES.CODIGO_TEXTO'
    end
    object qryRepDatosCteVehUSARLEVELPRECIO: TSmallintField
      FieldName = 'USARLEVELPRECIO'
      Origin = 'CLIENTES.USARLEVELPRECIO'
    end
    object qryRepDatosCteVehCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'CLIENTES.COD_VENDEDOR'
    end
    object qryRepDatosCteVehDescTipoSEguro: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescTipoSEguro'
      Size = 30
      Calculated = True
    end
    object qryRepDatosCteVehDESCTIPO_CLIENTE: TIBStringField
      FieldName = 'DESCTIPO_CLIENTE'
      Origin = 'TIPO_CLIENTE.DESCRIPCION'
      Size = 30
    end
  end
  object qryDatosVentaDetalle: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From VIEW_VENTAS_DET'
      'Where numero =:numero'
      'Order By TIPO_VENTA')
    Left = 696
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryDatosVentaDetalleSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VIEW_VENTAS_DET.SERIE'
    end
    object qryDatosVentaDetalleNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_VENTAS_DET.NUMERO'
    end
    object qryDatosVentaDetalleCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VIEW_VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryDatosVentaDetalleCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VIEW_VENTAS_DET.CODIGO_BARRA'
    end
    object qryDatosVentaDetalleCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VIEW_VENTAS_DET.CANTIDAD'
    end
    object qryDatosVentaDetallePRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VIEW_VENTAS_DET.PRECIO'
    end
    object qryDatosVentaDetallePORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VIEW_VENTAS_DET.PORC_DESC_DET'
    end
    object qryDatosVentaDetalleITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VIEW_VENTAS_DET.ITBI_DET'
    end
    object qryDatosVentaDetalleVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VIEW_VENTAS_DET.VALOR_SERVICIO_DET'
    end
    object qryDatosVentaDetalleVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VIEW_VENTAS_DET.VALOR_TOTAL_DET'
    end
    object qryDatosVentaDetalleNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VIEW_VENTAS_DET.NUM_FACTURA'
    end
    object qryDatosVentaDetalleSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VIEW_VENTAS_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryDatosVentaDetalleCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VIEW_VENTAS_DET.CANT_REGRESO'
    end
    object qryDatosVentaDetalleCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VIEW_VENTAS_DET.CANT_PROMO'
    end
    object qryDatosVentaDetalleMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VIEW_VENTAS_DET.MONTO_DIETA'
    end
    object qryDatosVentaDetalleMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VIEW_VENTAS_DET.MONTO_AJUSTE'
    end
    object qryDatosVentaDetalleSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VIEW_VENTAS_DET.SERIE_PROD'
      Size = 50
    end
    object qryDatosVentaDetalleSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VIEW_VENTAS_DET.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryDatosVentaDetalleDESC_TIPOUNIDAD: TIBStringField
      FieldName = 'DESC_TIPOUNIDAD'
      Origin = 'VIEW_VENTAS_DET.DESC_TIPOUNIDAD'
      Size = 50
    end
    object qryDatosVentaDetalleCX_TIPOUNIDAD: TIntegerField
      FieldName = 'CX_TIPOUNIDAD'
      Origin = 'VIEW_VENTAS_DET.CX_TIPOUNIDAD'
    end
    object qryDatosVentaDetalleIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'VIEW_VENTAS_DET.IDUNIDAD'
    end
    object qryDatosVentaDetalleTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VIEW_VENTAS_DET.TIPO_VENTA'
    end
    object qryDatosVentaDetalleDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VIEW_VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object qryDatosVentaDetalleDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VIEW_VENTAS_DET.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryDatosVentaDetallePORC_DESC_ITEM: TFloatField
      FieldName = 'PORC_DESC_ITEM'
      Origin = 'VIEW_VENTAS_DET.PORC_DESC_ITEM'
    end
    object qryDatosVentaDetalleMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VIEW_VENTAS_DET.MONTO_DESC_ITEM'
    end
    object qryDatosVentaDetalleITBIS_FISCAL_DET: TFloatField
      FieldName = 'ITBIS_FISCAL_DET'
      Origin = 'VIEW_VENTAS_DET.ITBIS_FISCAL_DET'
    end
    object qryDatosVentaDetalleIDTASAITBIS: TFloatField
      FieldName = 'IDTASAITBIS'
      Origin = 'VIEW_VENTAS_DET.IDTASAITBIS'
    end
    object qryDatosVentaDetalleMONTOIBISRECARGO: TFloatField
      FieldName = 'MONTOIBISRECARGO'
      Origin = 'VIEW_VENTAS_DET.MONTOIBISRECARGO'
    end
    object qryDatosVentaDetalleMONTO_TASA: TFloatField
      FieldName = 'MONTO_TASA'
      Origin = 'VIEW_VENTAS_DET.MONTO_TASA'
    end
    object qryDatosVentaDetalleMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VIEW_VENTAS_DET.MONEDA'
      FixedChar = True
      Size = 1
    end
  end
  object qryDatosVentaMaster: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryDatosVentaMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From VIEW_VENTAS_MAST'
      'Where numero =:numero')
    Left = 664
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryDatosVentaMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_VENTAS_MAST.NUMERO'
    end
    object qryDatosVentaMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VIEW_VENTAS_MAST.FECHA'
    end
    object qryDatosVentaMasterCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VIEW_VENTAS_MAST.CODIGO_CTE'
    end
    object qryDatosVentaMasterCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VIEW_VENTAS_MAST.CODIGO_VENDEDOR'
    end
    object qryDatosVentaMasterFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VIEW_VENTAS_MAST.FORMA_PAGO'
    end
    object qryDatosVentaMasterMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VIEW_VENTAS_MAST.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryDatosVentaMasterVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VIEW_VENTAS_MAST.VALOR_TOTAL_DET'
    end
    object qryDatosVentaMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VIEW_VENTAS_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosVentaMasterNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VIEW_VENTAS_MAST.NUMERO_FACTURA'
    end
    object qryDatosVentaMasterNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VIEW_VENTAS_MAST.NUMERO_DOC_PAGO'
    end
    object qryDatosVentaMasterSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VIEW_VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
    object qryDatosVentaMasterMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'VIEW_VENTAS_MAST.MONTO_BRUTO'
    end
    object qryDatosVentaMasterPORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VIEW_VENTAS_MAST.PORC_DESCUENTO'
    end
    object qryDatosVentaMasterMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VIEW_VENTAS_MAST.MONTO_DESCUENTO'
    end
    object qryDatosVentaMasterNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'VIEW_VENTAS_MAST.NUMERO_NCF'
      Size = 21
    end
    object qryDatosVentaMasterCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'VIEW_VENTAS_MAST.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryDatosVentaMasterRNC: TIBStringField
      DisplayWidth = 16
      FieldName = 'RNC'
      Origin = 'VIEW_VENTAS_MAST.RNC'
      Size = 16
    end
    object qryDatosVentaMasterDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'VIEW_VENTAS_MAST.DIRECCION_CONT'
      Size = 60
    end
    object qryDatosVentaMasterTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'VIEW_VENTAS_MAST.TELEF_CONTACTO'
      Size = 14
    end
    object qryDatosVentaMasterDESC_TIPOPAGO: TIBStringField
      FieldName = 'DESC_TIPOPAGO'
      Origin = 'VIEW_VENTAS_MAST.DESC_TIPOPAGO'
      FixedChar = True
      Size = 15
    end
    object qryDatosVentaMasterORIGEN: TSmallintField
      FieldName = 'ORIGEN'
      Origin = 'VIEW_VENTAS_MAST.ORIGEN'
    end
    object qryDatosVentaMasterNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'VIEW_VENTAS_MAST.NOMBRE_CTE'
      Size = 60
    end
    object qryDatosVentaMasterMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VIEW_VENTAS_MAST.MONTO_PAGADO'
    end
    object qryDatosVentaMasterTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'VIEW_VENTAS_MAST.TIPO_NCF'
      Size = 2
    end
    object qryDatosVentaMasterMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'VIEW_VENTAS_MAST.MONTO_CAMBIO'
    end
    object qryDatosVentaMasterNOMBRE_COMPLETO: TIBStringField
      FieldName = 'NOMBRE_COMPLETO'
      Origin = 'VIEW_VENTAS_MAST.NOMBRE_COMPLETO'
      Size = 80
    end
    object qryDatosVentaMasterNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'VIEW_VENTAS_MAST.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryDatosVentaMasterCOMENTARIO: TIBStringField
      FieldName = 'COMENTARIO'
      Origin = 'VIEW_VENTAS_MAST.COMENTARIO'
      Size = 80
    end
    object qryDatosVentaMasterOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VIEW_VENTAS_MAST.OBSERVACION'
      Size = 60
    end
    object qryDatosVentaMasterCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VIEW_VENTAS_MAST.CIA_KEY'
    end
    object qryDatosVentaMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VIEW_VENTAS_MAST.FECHA_IN'
    end
    object qryDatosVentaMasterIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VIEW_VENTAS_MAST.IN_POR'
      Size = 12
    end
    object qryDatosVentaMasterFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VIEW_VENTAS_MAST.FECHA_MOD'
    end
    object qryDatosVentaMasterMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VIEW_VENTAS_MAST.MOD_POR'
      Size = 12
    end
    object qryDatosVentaMasterMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'VIEW_VENTAS_MAST.MONTO_INICIAL'
    end
    object qryDatosVentaMasterNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'VIEW_VENTAS_MAST.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
    object qryDatosVentaMasterMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'VIEW_VENTAS_MAST.MONTO_TOTAL_ITBIS'
    end
    object qryDatosVentaMasterMONTODESCGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCGASTOSADMIN'
      Origin = 'VIEW_VENTAS_MAST.MONTODESCGASTOSADMIN'
    end
    object qryDatosVentaMasterMONTODESCITBISGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCITBISGASTOSADMIN'
      Origin = 'VIEW_VENTAS_MAST.MONTODESCITBISGASTOSADMIN'
    end
    object qryDatosVentaMasterMONTODESCTRANSP: TFloatField
      FieldName = 'MONTODESCTRANSP'
      Origin = 'VIEW_VENTAS_MAST.MONTODESCTRANSP'
    end
    object qryDatosVentaMasterMONTODESCDIRTECNICA: TFloatField
      FieldName = 'MONTODESCDIRTECNICA'
      Origin = 'VIEW_VENTAS_MAST.MONTODESCDIRTECNICA'
    end
    object qryDatosVentaMasterMONTODESCITBISDIRTECNICA: TFloatField
      FieldName = 'MONTODESCITBISDIRTECNICA'
      Origin = 'VIEW_VENTAS_MAST.MONTODESCITBISDIRTECNICA'
    end
    object qryDatosVentaMasterMONTODESCIMPREVISTO: TFloatField
      FieldName = 'MONTODESCIMPREVISTO'
      Origin = 'VIEW_VENTAS_MAST.MONTODESCIMPREVISTO'
    end
    object qryDatosVentaMasterMONTODESCITBISIMPREVISTO: TFloatField
      FieldName = 'MONTODESCITBISIMPREVISTO'
      Origin = 'VIEW_VENTAS_MAST.MONTODESCITBISIMPREVISTO'
    end
    object qryDatosVentaMasterDESC_TIPONCF: TIBStringField
      FieldName = 'DESC_TIPONCF'
      Origin = 'VIEW_VENTAS_MAST.DESC_TIPONCF'
      Size = 60
    end
    object qryDatosVentaMasterNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'VIEW_VENTAS_MAST.NOMBRE_ABREV'
      Size = 30
    end
    object qryDatosVentaMasterMONTO_RECARGO: TFloatField
      FieldName = 'MONTO_RECARGO'
      Origin = 'VIEW_VENTAS_MAST.MONTO_RECARGO'
    end
    object qryDatosVentaMasterTIPONCFIFISCAL: TIntegerField
      FieldName = 'TIPONCFIFISCAL'
      Origin = 'VIEW_VENTAS_MAST.TIPONCFIFISCAL'
    end
    object qryDatosVentaMasterMONTO_EXONERADO_ITBIS: TFloatField
      FieldName = 'MONTO_EXONERADO_ITBIS'
      Origin = 'VIEW_VENTAS_MAST.MONTO_EXONERADO_ITBIS'
    end
    object qryDatosVentaMasterIDRETENCION: TIntegerField
      FieldName = 'IDRETENCION'
      Origin = 'VIEW_VENTAS_MAST.IDRETENCION'
    end
    object qryDatosVentaMasterPROPINA: TFloatField
      FieldName = 'PROPINA'
      Origin = 'VIEW_VENTAS_MAST.PROPINA'
    end
    object qryDatosVentaMasterPORCPROPINALEGAL: TFloatField
      FieldName = 'PORCPROPINALEGAL'
      Origin = 'VIEW_VENTAS_MAST.PORCPROPINALEGAL'
    end
    object qryDatosVentaMasterPROPINALEGAL: TFloatField
      FieldName = 'PROPINALEGAL'
      Origin = 'VIEW_VENTAS_MAST.PROPINALEGAL'
    end
    object qryDatosVentaMasterNOMBRE_VENDEDOR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'NOMBRE_VENDEDOR'
      Origin = 'VIEW_VENTAS_MAST.NOMBRE_VENDEDOR'
      ReadOnly = True
      Size = 71
    end
    object qryDatosVentaMasterCOD_USR_CAJA: TIntegerField
      FieldName = 'COD_USR_CAJA'
      Origin = 'VIEW_VENTAS_MAST.COD_USR_CAJA'
    end
    object qryDatosVentaMasterTIPO_AFILIADO: TSmallintField
      FieldName = 'TIPO_AFILIADO'
      Origin = 'VIEW_VENTAS_MAST.TIPO_AFILIADO'
    end
    object qryDatosVentaMasterFECHAINICIAPOLIZA: TDateTimeField
      FieldName = 'FECHAINICIAPOLIZA'
      Origin = 'VIEW_VENTAS_MAST.FECHAINICIAPOLIZA'
    end
    object qryDatosVentaMasterDESCTIPOAFILIADO: TIBStringField
      FieldName = 'DESCTIPOAFILIADO'
      Origin = 'VIEW_VENTAS_MAST.DESCTIPOAFILIADO'
      Size = 80
    end
  end
  object qryDescLineasDocF: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From LINEA_DESCDOCFISCAL'
      'Where idlinea =:idlinea'
      'order by item')
    Left = 832
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idlinea'
        ParamType = ptInput
      end>
    object qryDescLineasDocFIDLINEA: TIntegerField
      FieldName = 'IDLINEA'
      Origin = 'LINEA_DESCDOCFISCAL.IDLINEA'
      Required = True
    end
    object qryDescLineasDocFITEM: TIntegerField
      FieldName = 'ITEM'
      Origin = 'LINEA_DESCDOCFISCAL.ITEM'
      Required = True
    end
    object qryDescLineasDocFDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'LINEA_DESCDOCFISCAL.DESCRIPCION'
      Size = 50
    end
    object qryDescLineasDocFSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'LINEA_DESCDOCFISCAL.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryDatosReimpdocFiscalDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From VIEW_VENTAS_DET'
      'Where numero =:numero'
      'Order By TIPO_VENTA')
    Left = 784
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryDatosReimpdocFiscalDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VIEW_VENTAS_DET.SERIE'
    end
    object qryDatosReimpdocFiscalDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_VENTAS_DET.NUMERO'
    end
    object qryDatosReimpdocFiscalDetCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VIEW_VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryDatosReimpdocFiscalDetCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VIEW_VENTAS_DET.CODIGO_BARRA'
    end
    object qryDatosReimpdocFiscalDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VIEW_VENTAS_DET.CANTIDAD'
    end
    object qryDatosReimpdocFiscalDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VIEW_VENTAS_DET.PRECIO'
    end
    object qryDatosReimpdocFiscalDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VIEW_VENTAS_DET.PORC_DESC_DET'
    end
    object qryDatosReimpdocFiscalDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VIEW_VENTAS_DET.ITBI_DET'
    end
    object qryDatosReimpdocFiscalDetVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VIEW_VENTAS_DET.VALOR_SERVICIO_DET'
    end
    object qryDatosReimpdocFiscalDetVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VIEW_VENTAS_DET.VALOR_TOTAL_DET'
    end
    object qryDatosReimpdocFiscalDetNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VIEW_VENTAS_DET.NUM_FACTURA'
    end
    object qryDatosReimpdocFiscalDetSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VIEW_VENTAS_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryDatosReimpdocFiscalDetCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VIEW_VENTAS_DET.CANT_REGRESO'
    end
    object qryDatosReimpdocFiscalDetCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VIEW_VENTAS_DET.CANT_PROMO'
    end
    object qryDatosReimpdocFiscalDetMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VIEW_VENTAS_DET.MONTO_DIETA'
    end
    object qryDatosReimpdocFiscalDetMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VIEW_VENTAS_DET.MONTO_AJUSTE'
    end
    object qryDatosReimpdocFiscalDetSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VIEW_VENTAS_DET.SERIE_PROD'
      Size = 50
    end
    object qryDatosReimpdocFiscalDetSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VIEW_VENTAS_DET.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryDatosReimpdocFiscalDetDESC_TIPOUNIDAD: TIBStringField
      FieldName = 'DESC_TIPOUNIDAD'
      Origin = 'VIEW_VENTAS_DET.DESC_TIPOUNIDAD'
      Size = 50
    end
    object qryDatosReimpdocFiscalDetCX_TIPOUNIDAD: TIntegerField
      FieldName = 'CX_TIPOUNIDAD'
      Origin = 'VIEW_VENTAS_DET.CX_TIPOUNIDAD'
    end
    object qryDatosReimpdocFiscalDetIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'VIEW_VENTAS_DET.IDUNIDAD'
    end
    object qryDatosReimpdocFiscalDetTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VIEW_VENTAS_DET.TIPO_VENTA'
    end
    object qryDatosReimpdocFiscalDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VIEW_VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object qryDatosReimpdocFiscalDetDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VIEW_VENTAS_DET.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryDatosReimpdocFiscalDetPORC_DESC_ITEM: TFloatField
      FieldName = 'PORC_DESC_ITEM'
      Origin = 'VIEW_VENTAS_DET.PORC_DESC_ITEM'
    end
    object qryDatosReimpdocFiscalDetMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VIEW_VENTAS_DET.MONTO_DESC_ITEM'
    end
    object qryDatosReimpdocFiscalDetITBIS_FISCAL_DET: TFloatField
      FieldName = 'ITBIS_FISCAL_DET'
      Origin = 'VIEW_VENTAS_DET.ITBIS_FISCAL_DET'
    end
  end
  object qryDatosRepTranscxcIFiscal: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryDatosRepTranscxcIFiscalAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From view_transnota_cr_db'
      'Where serie =:serie')
    Left = 720
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'serie'
        ParamType = ptInput
      end>
    object qryDatosRepTranscxcIFiscalSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VIEW_TRANSNOTA_CR_DB.SERIE'
    end
    object qryDatosRepTranscxcIFiscalNOMBRE_COMPLETO: TIBStringField
      FieldName = 'NOMBRE_COMPLETO'
      Origin = 'VIEW_TRANSNOTA_CR_DB.NOMBRE_COMPLETO'
      Size = 60
    end
    object qryDatosRepTranscxcIFiscalNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'VIEW_TRANSNOTA_CR_DB.NUMERO_NCF'
      Size = 21
    end
    object qryDatosRepTranscxcIFiscalTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'VIEW_TRANSNOTA_CR_DB.TIPO_NCF'
      Size = 2
    end
    object qryDatosRepTranscxcIFiscalCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'VIEW_TRANSNOTA_CR_DB.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryDatosRepTranscxcIFiscalRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'VIEW_TRANSNOTA_CR_DB.RNC_NUMERO'
      Size = 14
    end
    object qryDatosRepTranscxcIFiscalDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'VIEW_TRANSNOTA_CR_DB.DIRECCION_CONT'
      Size = 60
    end
    object qryDatosRepTranscxcIFiscalNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'VIEW_TRANSNOTA_CR_DB.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryDatosRepTranscxcIFiscalTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'VIEW_TRANSNOTA_CR_DB.TELEF_CONTACTO'
      Size = 14
    end
    object qryDatosRepTranscxcIFiscalNUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
      Origin = 'VIEW_TRANSNOTA_CR_DB.NUM_DOC'
    end
    object qryDatosRepTranscxcIFiscalNUMERO_FACT: TIntegerField
      FieldName = 'NUMERO_FACT'
      Origin = 'VIEW_TRANSNOTA_CR_DB.NUMERO_FACT'
    end
    object qryDatosRepTranscxcIFiscalSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VIEW_TRANSNOTA_CR_DB.SERIE_NCF_ASIGNADO'
    end
    object qryDatosRepTranscxcIFiscalVALOR_DOCUMENTO: TFloatField
      FieldName = 'VALOR_DOCUMENTO'
      Origin = 'VIEW_TRANSNOTA_CR_DB.VALOR_DOCUMENTO'
    end
    object qryDatosRepTranscxcIFiscalCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'VIEW_TRANSNOTA_CR_DB.CODIGO_CLIENTE'
    end
    object qryDatosRepTranscxcIFiscalNUM_NCF_AFECTADO: TIBStringField
      FieldName = 'NUM_NCF_AFECTADO'
      Origin = 'VIEW_TRANSNOTA_CR_DB.NUM_NCF_AFECTADO'
      Size = 21
    end
    object qryDatosRepTranscxcIFiscalTIPO_TRANF: TSmallintField
      FieldName = 'TIPO_TRANF'
      Origin = 'VIEW_TRANSNOTA_CR_DB.TIPO_TRANF'
    end
    object qryDatosRepTranscxcIFiscalTIPO_DOC: TIntegerField
      FieldName = 'TIPO_DOC'
      Origin = 'VIEW_TRANSNOTA_CR_DB.TIPO_DOC'
    end
    object qryDatosRepTranscxcIFiscalFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VIEW_TRANSNOTA_CR_DB.FECHA'
    end
    object qryDatosRepTranscxcIFiscalCONCEPTO: TIBStringField
      FieldName = 'CONCEPTO'
      Origin = 'VIEW_TRANSNOTA_CR_DB.CONCEPTO'
      Size = 60
    end
    object qryDatosRepTranscxcIFiscalNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'VIEW_TRANSNOTA_CR_DB.NOMBRE_CTE'
      Size = 60
    end
  end
  object qryDatosCajaImpUser: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT distinct'
      '  CONFCAJAXUSUARIO.COD_EMPLEADO,'
      '  CONFCAJAXUSUARIO.COD_CAJA,'
      '  CONFCAJAXUSUARIO.ID_FISCALPRINTER,'
      '  USUARIO.NOMBRECOMPLETO,   CONFCAJAXUSUARIO.ruta_ticket'
      'FROM'
      '  USUARIO'
      
        '  INNER JOIN EMPLEADO ON (USUARIO.CODIGO_EMPLEADO = EMPLEADO.COD' +
        'IGO)'
      
        '  INNER JOIN CONFCAJAXUSUARIO ON (EMPLEADO.CODIGO = CONFCAJAXUSU' +
        'ARIO.COD_EMPLEADO)'
      'Where   CONFCAJAXUSUARIO.COD_EMPLEADO=:codempleado')
    Left = 760
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codempleado'
        ParamType = ptInput
      end>
    object qryDatosCajaImpUserCOD_EMPLEADO: TIntegerField
      FieldName = 'COD_EMPLEADO'
      Origin = 'CONFCAJAXUSUARIO.COD_EMPLEADO'
      Required = True
    end
    object qryDatosCajaImpUserCOD_CAJA: TIntegerField
      FieldName = 'COD_CAJA'
      Origin = 'CONFCAJAXUSUARIO.COD_CAJA'
    end
    object qryDatosCajaImpUserID_FISCALPRINTER: TIntegerField
      FieldName = 'ID_FISCALPRINTER'
      Origin = 'CONFCAJAXUSUARIO.ID_FISCALPRINTER'
    end
    object qryDatosCajaImpUserNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Origin = 'USUARIO.NOMBRECOMPLETO'
      Size = 40
    end
    object qryDatosCajaImpUserRUTA_TICKET: TIBStringField
      FieldName = 'RUTA_TICKET'
      Origin = 'CONFCAJAXUSUARIO.RUTA_TICKET'
      Size = 80
    end
  end
  object qryTipoIFiscal: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From NCF_TIPO_IFISCAL'
      'Where TIPO_NCF =:tiponcf'
      'And Tipo_ncf_ifiscal=:tiponcfifiscal')
    Left = 720
    Top = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'tiponcf'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tiponcfifiscal'
        ParamType = ptInput
      end>
    object qryTipoIFiscalTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'NCF_TIPO_IFISCAL.TIPO_NCF'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryTipoIFiscalTIPO_NCF_IFISCAL: TIntegerField
      FieldName = 'TIPO_NCF_IFISCAL'
      Origin = 'NCF_TIPO_IFISCAL.TIPO_NCF_IFISCAL'
      Required = True
    end
    object qryTipoIFiscalDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'NCF_TIPO_IFISCAL.DESCRIPCION'
      Size = 80
    end
  end
  object qryStatusImpresora: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT r.ID_ERROR, r.ID_USUARIO, r.ID_FISCALPRINTE, r.DESCRIPCIO' +
        'N'
      'FROM STATUSIMPRESORA r'
      'Where r.descripcion like :descripcion')
    Left = 720
    Top = 376
    ParamData = <
      item
        DataType = ftString
        Name = 'descripcion'
        ParamType = ptInput
      end>
    object qryStatusImpresoraID_ERROR: TIntegerField
      FieldName = 'ID_ERROR'
      Origin = 'STATUSIMPRESORA.ID_ERROR'
      Required = True
    end
    object qryStatusImpresoraID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'STATUSIMPRESORA.ID_USUARIO'
    end
    object qryStatusImpresoraID_FISCALPRINTE: TIntegerField
      FieldName = 'ID_FISCALPRINTE'
      Origin = 'STATUSIMPRESORA.ID_FISCALPRINTE'
    end
    object qryStatusImpresoraDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'STATUSIMPRESORA.DESCRIPCION'
      Size = 80
    end
  end
  object qryBuscarNIF: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From ESTADOFISCAL'
      'Where numero = :numero')
    Left = 720
    Top = 424
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryBuscarNIFNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'ESTADOFISCAL.NUMERO'
      Required = True
    end
    object qryBuscarNIFNIF: TIBStringField
      FieldName = 'NIF'
      Origin = 'ESTADOFISCAL.NIF'
      Required = True
      Size = 16
    end
    object qryBuscarNIFTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'ESTADOFISCAL.TIPO'
      Required = True
    end
    object qryBuscarNIFTOTAL_BRUTO: TFloatField
      FieldName = 'TOTAL_BRUTO'
      Origin = 'ESTADOFISCAL.TOTAL_BRUTO'
    end
    object qryBuscarNIFMONTO_ITBIS: TFloatField
      FieldName = 'MONTO_ITBIS'
      Origin = 'ESTADOFISCAL.MONTO_ITBIS'
    end
    object qryBuscarNIFTOTAL_NETO: TFloatField
      FieldName = 'TOTAL_NETO'
      Origin = 'ESTADOFISCAL.TOTAL_NETO'
    end
    object qryBuscarNIFSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ESTADOFISCAL.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryDatosReimpDocFiscalOKI: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryDatosReimpDocFiscalOKIAfterScroll
    OnCalcFields = qryDatosReimpDocFiscalOKICalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  M.FECHA,'
      '  M.NUMERO,'
      '  M.CODIGO_CTE,'
      '  E.NIF,'
      '  N.NUMERO_NCF,'
      '  E.TIPO,'
      '  E.TOTAL_BRUTO,'
      '  E.MONTO_ITBIS,'
      '  M.MONTO_CAMBIO,'
      '  E.TOTAL_NETO,'
      '  M.MONTO_DESCUENTO,'
      '  M.MONTO_PAGADO,'
      '---TIPO_CF.TIPO_IFISCAL,'
      '  N.TIPO_NCF,'
      '  TIPO_CF.DESCRIPCION descdocumentofiscal'
      'FROM'
      '  VENTAS_MAST M'
      
        '  LEFT OUTER JOIN NCF_ASIGNADOS N ON (M.SERIE_NCF_ASIGNADO = N.S' +
        'ERIE)'
      '  LEFT OUTER JOIN ESTADOFISCAL E ON (M.NUMERO = E.NUMERO)'
      '  INNER JOIN TIPO_CF ON (N.TIPO_NCF = TIPO_CF.TIPO_CF)'
      'WHERE'
      '  (M.NUMERO =:numerotrn)')
    Left = 808
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerotrn'
        ParamType = ptInput
      end>
    object qryDatosReimpDocFiscalOKINombrecliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'Nombrecliente'
      Size = 80
      Calculated = True
    end
    object qryDatosReimpDocFiscalOKIRNC: TStringField
      FieldKind = fkCalculated
      FieldName = 'RNC'
      Size = 12
      Calculated = True
    end
    object qryDatosReimpDocFiscalOKIFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryDatosReimpDocFiscalOKINUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryDatosReimpDocFiscalOKICODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST.CODIGO_CTE'
    end
    object qryDatosReimpDocFiscalOKINIF: TIBStringField
      FieldName = 'NIF'
      Origin = 'ESTADOFISCAL.NIF'
      Size = 16
    end
    object qryDatosReimpDocFiscalOKINUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
    object qryDatosReimpDocFiscalOKITIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'ESTADOFISCAL.TIPO'
    end
    object qryDatosReimpDocFiscalOKITOTAL_BRUTO: TFloatField
      FieldName = 'TOTAL_BRUTO'
      Origin = 'ESTADOFISCAL.TOTAL_BRUTO'
    end
    object qryDatosReimpDocFiscalOKIMONTO_ITBIS: TFloatField
      FieldName = 'MONTO_ITBIS'
      Origin = 'ESTADOFISCAL.MONTO_ITBIS'
    end
    object qryDatosReimpDocFiscalOKIMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'VENTAS_MAST.MONTO_CAMBIO'
    end
    object qryDatosReimpDocFiscalOKITOTAL_NETO: TFloatField
      FieldName = 'TOTAL_NETO'
      Origin = 'ESTADOFISCAL.TOTAL_NETO'
    end
    object qryDatosReimpDocFiscalOKIMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_MAST.MONTO_DESCUENTO'
    end
    object qryDatosReimpDocFiscalOKIMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VENTAS_MAST.MONTO_PAGADO'
    end
    object qryDatosReimpDocFiscalOKITIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'NCF_ASIGNADOS.TIPO_NCF'
      Size = 2
    end
    object qryDatosReimpDocFiscalOKIDESCDOCUMENTOFISCAL: TIBStringField
      FieldName = 'DESCDOCUMENTOFISCAL'
      Origin = 'TIPO_CF.DESCRIPCION'
      Size = 60
    end
  end
  object qryDatosReimpDocFiscal: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryDatosReimpDocFiscalAfterScroll
    OnCalcFields = qryDatosReimpDocFiscalCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select c.NOMBRE_CTE, c.RNC_NUMERO,'
      'm.NOMBRE_CLIENTE_GENERAL,'
      'm.fecha, m.numero,m.CODIGO_CTE,e.NIF, n.NUMERO_NCF,'
      'e.tipo,e.TOTAL_BRUTO,e.MONTO_ITBIS, m.monto_cambio, e.fechahora,'
      
        'e.TOTAL_NETO, m.monto_descuento, m.monto_pagado, m.MONTO_TOTAL_I' +
        'TBIS, m.*'
      'From VENTAS_MAST m '
      
        'left outer join NCF_ASIGNADOS n on n.SERIE = m.SERIE_NCF_ASIGNAD' +
        'O '
      
        'left outer join ESTADOFISCAL e on e.NUMERO = m.NUMERO AND E.TOTA' +
        'L_BRUTO > 0'
      'left outer join CLIENTES c on c.CODIGO_CTE = m.CODIGO_CTE'
      'Where m.numero =:numerotrn')
    Left = 472
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerotrn'
        ParamType = ptInput
      end>
    object qryDatosReimpDocFiscalNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryDatosReimpDocFiscalCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST.CODIGO_CTE'
    end
    object qryDatosReimpDocFiscalNIF: TIBStringField
      FieldName = 'NIF'
      Origin = 'ESTADOFISCAL.NIF'
      Required = True
      Size = 16
    end
    object qryDatosReimpDocFiscalNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Required = True
      Size = 21
    end
    object qryDatosReimpDocFiscalTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'ESTADOFISCAL.TIPO'
      Required = True
    end
    object qryDatosReimpDocFiscalTOTAL_BRUTO: TFloatField
      FieldName = 'TOTAL_BRUTO'
      Origin = 'ESTADOFISCAL.TOTAL_BRUTO'
    end
    object qryDatosReimpDocFiscalMONTO_ITBIS: TFloatField
      FieldName = 'MONTO_ITBIS'
      Origin = 'ESTADOFISCAL.MONTO_ITBIS'
    end
    object qryDatosReimpDocFiscalTOTAL_NETO: TFloatField
      FieldName = 'TOTAL_NETO'
      Origin = 'ESTADOFISCAL.TOTAL_NETO'
    end
    object qryDatosReimpDocFiscalNombrecliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'Nombrecliente'
      Size = 80
      Calculated = True
    end
    object qryDatosReimpDocFiscalRNC: TStringField
      FieldKind = fkCalculated
      FieldName = 'RNC'
      Size = 12
      Calculated = True
    end
    object qryDatosReimpDocFiscalFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryDatosReimpDocFiscalMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_MAST.MONTO_DESCUENTO'
    end
    object qryDatosReimpDocFiscalMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VENTAS_MAST.MONTO_PAGADO'
    end
    object qryDatosReimpDocFiscalMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'ESTADOFISCAL.MONTO_CAMBIO'
    end
    object qryDatosReimpDocFiscalMONTO_RECARGO: TFloatField
      FieldName = 'MONTO_RECARGO'
      Origin = 'VENTAS_MAST.MONTO_RECARGO'
    end
    object qryDatosReimpDocFiscalTIPONCFIFISCAL: TIntegerField
      FieldName = 'TIPONCFIFISCAL'
      Origin = 'VENTAS_MAST.TIPONCFIFISCAL'
    end
    object qryDatosReimpDocFiscalMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'VENTAS_MAST.MONTO_TOTAL_ITBIS'
    end
    object qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS: TFloatField
      FieldName = 'MONTO_EXONERADO_ITBIS'
      Origin = 'VENTAS_MAST.MONTO_EXONERADO_ITBIS'
    end
    object qryDatosReimpDocFiscalMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
    end
    object qryDatosReimpDocFiscalPORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VENTAS_MAST.PORC_DESCUENTO'
    end
    object qryDatosReimpDocFiscalPORCPROPINALEGAL: TFloatField
      FieldName = 'PORCPROPINALEGAL'
      Origin = 'VENTAS_MAST.PORCPROPINALEGAL'
    end
    object qryDatosReimpDocFiscalPROPINA: TFloatField
      FieldName = 'PROPINA'
      Origin = 'VENTAS_MAST.PROPINA'
    end
    object qryDatosReimpDocFiscalPROPINALEGAL: TFloatField
      FieldName = 'PROPINALEGAL'
      Origin = 'VENTAS_MAST.PROPINALEGAL'
    end
    object qryDatosReimpDocFiscalFECHAHORA: TDateTimeField
      FieldName = 'FECHAHORA'
      Origin = 'ESTADOFISCAL.FECHAHORA'
    end
    object qryDatosReimpDocFiscalNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'VENTAS_MAST.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
    object qryDatosReimpDocFiscalNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryDatosReimpDocFiscalRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryDatosReimpDocFiscalSUB_TOTALITBIS: TFloatField
      FieldName = 'SUB_TOTALITBIS'
      Origin = 'VENTAS_MAST.SUB_TOTALITBIS'
    end
  end
  object tblCtrlTransusuario: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CTRLTRANSXCAJERO'
      'where'
      '  ID_USUARIO = :OLD_ID_USUARIO and'
      '  NUMERO_TRANS = :OLD_NUMERO_TRANS')
    InsertSQL.Strings = (
      'insert into CTRLTRANSXCAJERO'
      '  (ID_USUARIO, NUMERO_TRANS, INSERTADO_POR, FECHA_IN, STATUS)'
      'values'
      
        '  (:ID_USUARIO, :NUMERO_TRANS, :INSERTADO_POR, :FECHA_IN, :STATU' +
        'S)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_USUARIO,'
      '  NUMERO_TRANS,'
      '  INSERTADO_POR,'
      '  FECHA_IN,'
      '  STATUS'
      'from CTRLTRANSXCAJERO '
      'where'
      '  ID_USUARIO = :ID_USUARIO and'
      '  NUMERO_TRANS = :NUMERO_TRANS')
    SelectSQL.Strings = (
      'Select * From CTRLTRANSXCAJERO'
      'Where id_usuario =:idusuario'
      'And numero_trans =:numero')
    ModifySQL.Strings = (
      'update CTRLTRANSXCAJERO'
      'set'
      '  ID_USUARIO = :ID_USUARIO,'
      '  NUMERO_TRANS = :NUMERO_TRANS,'
      '  INSERTADO_POR = :INSERTADO_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  STATUS = :STATUS'
      'where'
      '  ID_USUARIO = :OLD_ID_USUARIO and'
      '  NUMERO_TRANS = :OLD_NUMERO_TRANS')
    Left = 520
    Top = 296
    object tblCtrlTransusuarioID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'CTRLTRANSXCAJERO.ID_USUARIO'
      Required = True
    end
    object tblCtrlTransusuarioNUMERO_TRANS: TIntegerField
      FieldName = 'NUMERO_TRANS'
      Origin = 'CTRLTRANSXCAJERO.NUMERO_TRANS'
      Required = True
    end
    object tblCtrlTransusuarioINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'CTRLTRANSXCAJERO.INSERTADO_POR'
      Size = 12
    end
    object tblCtrlTransusuarioFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CTRLTRANSXCAJERO.FECHA_IN'
    end
    object tblCtrlTransusuarioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CTRLTRANSXCAJERO.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryDetallePagos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select t.IFISCAL_TPAGO, t.DESCRIPCION, d.MONTO_PAGADO, d.Pago'
      'From DETALLE_PAGOS d, TIPO_PAGO t'
      'Where t.CODIGO = d.TIPO_PAGO And SERIE_TRN=:serietrn')
    Left = 824
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'serietrn'
        ParamType = ptInput
      end>
    object qryDetallePagosIFISCAL_TPAGO: TSmallintField
      FieldName = 'IFISCAL_TPAGO'
      Origin = 'TIPO_PAGO.IFISCAL_TPAGO'
    end
    object qryDetallePagosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_PAGO.DESCRIPCION'
      FixedChar = True
      Size = 15
    end
    object qryDetallePagosMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'DETALLE_PAGOS.MONTO_PAGADO'
    end
    object qryDetallePagosPAGO: TSmallintField
      FieldName = 'PAGO'
      Origin = 'DETALLE_PAGOS.PAGO'
    end
  end
  object dsqryDetallePagos: TDataSource
    DataSet = qryDetallePagos
    Left = 808
    Top = 312
  end
  object qryDatosRepClientesCumple: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '       C.CODIGO_CTE,'
      '       C.NOMBRE_FACTURAR,'
      '       T.DESCRIPCION AS DESCRIPCION_TIPOCTE,'
      '       C.NOMBRE_ABREV,'
      '       C.NOMBRE_CTE,'
      '       C.CONTACTO,'
      '       C.DIRECCION_CONT,'
      '       C.EMAIL,'
      '       C.FAX_CONTACTO,'
      '       C.FECHA_INSERTADO,'
      '       C.FECHA_MOD,'
      '       C.FORMA_PAGO,'
      '       C.FOTO,'
      '       C.LIMITE_CREDITO,'
      '       C.MONEDA_FACT,'
      '       C.PAIS,'
      '       C.STATUS_CLIENTE,'
      '       C.TELEF_CONTACTO,'
      '       C.TIPO_CLIENTE,'
      '       C.WEBSITE,       '
      '       C.CIUDAD,'
      '       C.CODIGO_AGENCIA,'
      '       C.COD_VENDEDOR,'
      'c.FECHA_NACIMIENTO'
      'FROM CLIENTES C'
      '   LEFT OUTER JOIN TIPO_CLIENTE T ON (C.TIPO_CLIENTE = T.CODIGO)'
      'WHERE '
      '   ('
      '      (C.TIPO_CLIENTE = T.CODIGO)'
      '   )'
      'ORDER BY c.tipo_cliente, C.NOMBRE_FACTURAR, c.codigo_cte')
    OnFilterRecord = qryDatosRepClientesCumpleFilterRecord
    Left = 840
    Top = 32
    object qryDatosRepClientesCumpleCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryDatosRepClientesCumpleNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryDatosRepClientesCumpleDESCRIPCION_TIPOCTE: TIBStringField
      FieldName = 'DESCRIPCION_TIPOCTE'
      Origin = 'TIPO_CLIENTE.DESCRIPCION'
      Size = 30
    end
    object qryDatosRepClientesCumpleNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object qryDatosRepClientesCumpleNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryDatosRepClientesCumpleCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'CLIENTES.CONTACTO'
      Size = 30
    end
    object qryDatosRepClientesCumpleDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryDatosRepClientesCumpleEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object qryDatosRepClientesCumpleFAX_CONTACTO: TIBStringField
      FieldName = 'FAX_CONTACTO'
      Origin = 'CLIENTES.FAX_CONTACTO'
      Size = 14
    end
    object qryDatosRepClientesCumpleFECHA_INSERTADO: TDateTimeField
      FieldName = 'FECHA_INSERTADO'
      Origin = 'CLIENTES.FECHA_INSERTADO'
    end
    object qryDatosRepClientesCumpleFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CLIENTES.FECHA_MOD'
    end
    object qryDatosRepClientesCumpleFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'CLIENTES.FORMA_PAGO'
    end
    object qryDatosRepClientesCumpleFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'CLIENTES.FOTO'
      Size = 8
    end
    object qryDatosRepClientesCumpleLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object qryDatosRepClientesCumpleMONEDA_FACT: TIBStringField
      FieldName = 'MONEDA_FACT'
      Origin = 'CLIENTES.MONEDA_FACT'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepClientesCumplePAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryDatosRepClientesCumpleSTATUS_CLIENTE: TIBStringField
      FieldName = 'STATUS_CLIENTE'
      Origin = 'CLIENTES.STATUS_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepClientesCumpleTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryDatosRepClientesCumpleTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
    object qryDatosRepClientesCumpleWEBSITE: TIBStringField
      FieldName = 'WEBSITE'
      Origin = 'CLIENTES.WEBSITE'
      Size = 40
    end
    object qryDatosRepClientesCumpleCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryDatosRepClientesCumpleCODIGO_AGENCIA: TSmallintField
      FieldName = 'CODIGO_AGENCIA'
      Origin = 'CLIENTES.CODIGO_AGENCIA'
    end
    object qryDatosRepClientesCumpleCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'CLIENTES.COD_VENDEDOR'
    end
    object qryDatosRepClientesCumpleFECHA_NACIMIENTO: TDateTimeField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'CLIENTES.FECHA_NACIMIENTO'
    end
  end
  object qryDatosRepOrdenComp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Proc_DatosRepOrdenComp')
    Left = 792
    Top = 416
    object qryDatosRepOrdenCompNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PROC_DATOSREPORDENCOMP.NUMERO'
    end
    object qryDatosRepOrdenCompCODIGO_PROVEE: TIntegerField
      FieldName = 'CODIGO_PROVEE'
      Origin = 'PROC_DATOSREPORDENCOMP.CODIGO_PROVEE'
    end
    object qryDatosRepOrdenCompFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_DATOSREPORDENCOMP.FECHA'
    end
    object qryDatosRepOrdenCompFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'PROC_DATOSREPORDENCOMP.FPAGO'
    end
    object qryDatosRepOrdenCompCOD_CAJA_CHICA: TIntegerField
      FieldName = 'COD_CAJA_CHICA'
      Origin = 'PROC_DATOSREPORDENCOMP.COD_CAJA_CHICA'
    end
    object qryDatosRepOrdenCompCODIGO_BANCO: TSmallintField
      FieldName = 'CODIGO_BANCO'
      Origin = 'PROC_DATOSREPORDENCOMP.CODIGO_BANCO'
    end
    object qryDatosRepOrdenCompOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'PROC_DATOSREPORDENCOMP.OBSERVACION'
      Size = 40
    end
    object qryDatosRepOrdenCompMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'PROC_DATOSREPORDENCOMP.MONTO'
    end
    object qryDatosRepOrdenCompSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROC_DATOSREPORDENCOMP.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepOrdenCompTIPO_INV: TSmallintField
      FieldName = 'TIPO_INV'
      Origin = 'PROC_DATOSREPORDENCOMP.TIPO_INV'
    end
    object qryDatosRepOrdenCompNUM_ORDEN: TIntegerField
      FieldName = 'NUM_ORDEN'
      Origin = 'PROC_DATOSREPORDENCOMP.NUM_ORDEN'
    end
    object qryDatosRepOrdenCompSTATUS_ORD: TIBStringField
      FieldName = 'STATUS_ORD'
      Origin = 'PROC_DATOSREPORDENCOMP.STATUS_ORD'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepOrdenCompAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'PROC_DATOSREPORDENCOMP.AREA_ORDEN'
    end
    object qryDatosRepOrdenCompCIA_KEY: TSmallintField
      FieldName = 'CIA_KEY'
      Origin = 'PROC_DATOSREPORDENCOMP.CIA_KEY'
    end
    object qryDatosRepOrdenCompNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'PROC_DATOSREPORDENCOMP.NUMERO_NCF'
      Size = 21
    end
    object qryDatosRepOrdenCompCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'PROC_DATOSREPORDENCOMP.CODIGO_VENDEDOR'
    end
    object qryDatosRepOrdenCompDESCRIPCION_PROVEEDOR: TIBStringField
      FieldName = 'DESCRIPCION_PROVEEDOR'
      Origin = 'PROC_DATOSREPORDENCOMP.DESCRIPCION_PROVEEDOR'
      Size = 80
    end
    object qryDatosRepOrdenCompSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'PROC_DATOSREPORDENCOMP.SERIE'
    end
    object qryDatosRepOrdenCompCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PROC_DATOSREPORDENCOMP.CANTIDAD'
    end
    object qryDatosRepOrdenCompVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'PROC_DATOSREPORDENCOMP.VALOR'
    end
    object qryDatosRepOrdenCompSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'PROC_DATOSREPORDENCOMP.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepOrdenCompNUMERO_DOCUMENTO: TIntegerField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'PROC_DATOSREPORDENCOMP.NUMERO_DOCUMENTO'
    end
    object qryDatosRepOrdenCompNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'PROC_DATOSREPORDENCOMP.NUMERO_FACTURA'
    end
    object qryDatosRepOrdenCompCOD_CTA_CONCEPTO: TIntegerField
      FieldName = 'COD_CTA_CONCEPTO'
      Origin = 'PROC_DATOSREPORDENCOMP.COD_CTA_CONCEPTO'
    end
    object qryDatosRepOrdenCompPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'PROC_DATOSREPORDENCOMP.PRECIO'
    end
    object qryDatosRepOrdenCompITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'PROC_DATOSREPORDENCOMP.ITBI_DET'
    end
    object qryDatosRepOrdenCompPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'PROC_DATOSREPORDENCOMP.PORC_DESC_DET'
    end
    object qryDatosRepOrdenCompMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'PROC_DATOSREPORDENCOMP.MONTO_DESCUENTO'
    end
    object qryDatosRepOrdenCompFORMA_DEPAGO: TIBStringField
      FieldName = 'FORMA_DEPAGO'
      Origin = 'PROC_DATOSREPORDENCOMP.FORMA_DEPAGO'
      FixedChar = True
      Size = 15
    end
    object qryDatosRepOrdenCompDESC_PRODUCTO: TIBStringField
      FieldName = 'DESC_PRODUCTO'
      Origin = 'PROC_DATOSREPORDENCOMP.DESC_PRODUCTO'
      Size = 80
    end
    object qryDatosRepOrdenCompDESC_TIPOUNIDAD: TIBStringField
      FieldName = 'DESC_TIPOUNIDAD'
      Origin = 'PROC_DATOSREPORDENCOMP.DESC_TIPOUNIDAD'
      Size = 50
    end
    object qryDatosRepOrdenCompCOD_SERV_PROD: TIntegerField
      FieldName = 'COD_SERV_PROD'
      Origin = 'PROC_DATOSREPORDENCOMP.COD_SERV_PROD'
    end
    object qryDatosRepOrdenCompNOMBRE_ABR: TIBStringField
      FieldName = 'NOMBRE_ABR'
      Origin = 'PROC_DATOSREPORDENCOMP.NOMBRE_ABR'
      Size = 60
    end
    object qryDatosRepOrdenCompCANT_OFERTA: TIntegerField
      FieldName = 'CANT_OFERTA'
      Origin = 'PROC_DATOSREPORDENCOMP.CANT_OFERTA'
    end
    object qryDatosRepOrdenCompCANTIDAD_ORIGINAL: TIntegerField
      FieldName = 'CANTIDAD_ORIGINAL'
      Origin = 'PROC_DATOSREPORDENCOMP.CANTIDAD_ORIGINAL'
    end
  end
  object qryDatosRepOrdenComp_Base: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Proc_DatosRepOrdenComp')
    Left = 800
    Top = 456
    object qryDatosRepOrdenComp_BaseNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PROC_DATOSREPORDENCOMP.NUMERO'
    end
    object qryDatosRepOrdenComp_BaseCODIGO_PROVEE: TIntegerField
      FieldName = 'CODIGO_PROVEE'
      Origin = 'PROC_DATOSREPORDENCOMP.CODIGO_PROVEE'
    end
    object qryDatosRepOrdenComp_BaseFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_DATOSREPORDENCOMP.FECHA'
    end
    object qryDatosRepOrdenComp_BaseFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'PROC_DATOSREPORDENCOMP.FPAGO'
    end
    object qryDatosRepOrdenComp_BaseCOD_CAJA_CHICA: TIntegerField
      FieldName = 'COD_CAJA_CHICA'
      Origin = 'PROC_DATOSREPORDENCOMP.COD_CAJA_CHICA'
    end
    object qryDatosRepOrdenComp_BaseCODIGO_BANCO: TSmallintField
      FieldName = 'CODIGO_BANCO'
      Origin = 'PROC_DATOSREPORDENCOMP.CODIGO_BANCO'
    end
    object qryDatosRepOrdenComp_BaseOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'PROC_DATOSREPORDENCOMP.OBSERVACION'
      Size = 40
    end
    object qryDatosRepOrdenComp_BaseMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'PROC_DATOSREPORDENCOMP.MONTO'
    end
    object qryDatosRepOrdenComp_BaseSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROC_DATOSREPORDENCOMP.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepOrdenComp_BaseTIPO_INV: TSmallintField
      FieldName = 'TIPO_INV'
      Origin = 'PROC_DATOSREPORDENCOMP.TIPO_INV'
    end
    object qryDatosRepOrdenComp_BaseNUM_ORDEN: TIntegerField
      FieldName = 'NUM_ORDEN'
      Origin = 'PROC_DATOSREPORDENCOMP.NUM_ORDEN'
    end
    object qryDatosRepOrdenComp_BaseSTATUS_ORD: TIBStringField
      FieldName = 'STATUS_ORD'
      Origin = 'PROC_DATOSREPORDENCOMP.STATUS_ORD'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepOrdenComp_BaseAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'PROC_DATOSREPORDENCOMP.AREA_ORDEN'
    end
    object qryDatosRepOrdenComp_BaseCIA_KEY: TSmallintField
      FieldName = 'CIA_KEY'
      Origin = 'PROC_DATOSREPORDENCOMP.CIA_KEY'
    end
    object qryDatosRepOrdenComp_BaseNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'PROC_DATOSREPORDENCOMP.NUMERO_NCF'
      Size = 21
    end
    object qryDatosRepOrdenComp_BaseCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'PROC_DATOSREPORDENCOMP.CODIGO_VENDEDOR'
    end
    object qryDatosRepOrdenComp_BaseDESCRIPCION_PROVEEDOR: TIBStringField
      FieldName = 'DESCRIPCION_PROVEEDOR'
      Origin = 'PROC_DATOSREPORDENCOMP.DESCRIPCION_PROVEEDOR'
      Size = 80
    end
    object qryDatosRepOrdenComp_BaseSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'PROC_DATOSREPORDENCOMP.SERIE'
    end
    object qryDatosRepOrdenComp_BaseCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PROC_DATOSREPORDENCOMP.CANTIDAD'
    end
    object qryDatosRepOrdenComp_BaseVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'PROC_DATOSREPORDENCOMP.VALOR'
    end
    object qryDatosRepOrdenComp_BaseSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'PROC_DATOSREPORDENCOMP.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepOrdenComp_BaseNUMERO_DOCUMENTO: TIntegerField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'PROC_DATOSREPORDENCOMP.NUMERO_DOCUMENTO'
    end
    object qryDatosRepOrdenComp_BaseNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'PROC_DATOSREPORDENCOMP.NUMERO_FACTURA'
    end
    object qryDatosRepOrdenComp_BaseCOD_CTA_CONCEPTO: TIntegerField
      FieldName = 'COD_CTA_CONCEPTO'
      Origin = 'PROC_DATOSREPORDENCOMP.COD_CTA_CONCEPTO'
    end
    object qryDatosRepOrdenComp_BasePRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'PROC_DATOSREPORDENCOMP.PRECIO'
    end
    object qryDatosRepOrdenComp_BaseITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'PROC_DATOSREPORDENCOMP.ITBI_DET'
    end
    object qryDatosRepOrdenComp_BasePORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'PROC_DATOSREPORDENCOMP.PORC_DESC_DET'
    end
    object qryDatosRepOrdenComp_BaseMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'PROC_DATOSREPORDENCOMP.MONTO_DESCUENTO'
    end
    object qryDatosRepOrdenComp_BaseFORMA_DEPAGO: TIBStringField
      FieldName = 'FORMA_DEPAGO'
      Origin = 'PROC_DATOSREPORDENCOMP.FORMA_DEPAGO'
      FixedChar = True
      Size = 15
    end
    object qryDatosRepOrdenComp_BaseDESC_PRODUCTO: TIBStringField
      FieldName = 'DESC_PRODUCTO'
      Origin = 'PROC_DATOSREPORDENCOMP.DESC_PRODUCTO'
      Size = 80
    end
    object qryDatosRepOrdenComp_BaseDESC_TIPOUNIDAD: TIBStringField
      FieldName = 'DESC_TIPOUNIDAD'
      Origin = 'PROC_DATOSREPORDENCOMP.DESC_TIPOUNIDAD'
      Size = 50
    end
    object qryDatosRepOrdenComp_BaseCOD_SERV_PROD: TIntegerField
      FieldName = 'COD_SERV_PROD'
      Origin = 'PROC_DATOSREPORDENCOMP.COD_SERV_PROD'
    end
    object qryDatosRepOrdenComp_BaseCANT_OFERTA: TIntegerField
      FieldName = 'CANT_OFERTA'
      Origin = 'PROC_DATOSREPORDENCOMP.CANT_OFERTA'
    end
    object qryDatosRepOrdenComp_BaseNOMBRE_ABR: TIBStringField
      FieldName = 'NOMBRE_ABR'
      Origin = 'PROC_DATOSREPORDENCOMP.NOMBRE_ABR'
      Size = 60
    end
    object qryDatosRepOrdenComp_BaseCANTIDAD_ORIGINAL: TIntegerField
      FieldName = 'CANTIDAD_ORIGINAL'
      Origin = 'PROC_DATOSREPORDENCOMP.CANTIDAD_ORIGINAL'
    end
  end
  object qryDatosRepVentaDiaria_0: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   *'
      'FROM Proc_datos_venta_diaria(:Fechaini, :Fechafin)'
      'Where moneda between :monedaini and :monedafin'
      
        'ORDER BY tipo_documento, moneda, CODIGO_EMPLEADO, moneda, tipo_d' +
        'oc, tipo_tranf, FECHA, '
      'NUMERO_DOCUMENTO, CODIGO_CLIENTE')
    Left = 80
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Fechaini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fechafin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'monedaini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'monedafin'
        ParamType = ptUnknown
      end>
  end
  object qryProcGetDatosNCNB: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From PROC_GETTRANSNOTA_CR_DB(:tipo)')
    Left = 840
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tipo'
        ParamType = ptInput
      end>
    object qryProcGetDatosNCNBSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.SERIE'
    end
    object qryProcGetDatosNCNBNOMBRE_COMPLETO: TIBStringField
      FieldName = 'NOMBRE_COMPLETO'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.NOMBRE_COMPLETO'
      Size = 80
    end
    object qryProcGetDatosNCNBNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.NUMERO_NCF'
      Size = 21
    end
    object qryProcGetDatosNCNBTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.TIPO_NCF'
      Size = 2
    end
    object qryProcGetDatosNCNBNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.NOMBRE_CTE'
      Size = 60
    end
    object qryProcGetDatosNCNBCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryProcGetDatosNCNBRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.RNC_NUMERO'
      Size = 14
    end
    object qryProcGetDatosNCNBDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.DIRECCION_CONT'
      Size = 60
    end
    object qryProcGetDatosNCNBNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryProcGetDatosNCNBTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.TELEF_CONTACTO'
      Size = 14
    end
    object qryProcGetDatosNCNBNUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.NUM_DOC'
    end
    object qryProcGetDatosNCNBNUMERO_FACT: TSmallintField
      FieldName = 'NUMERO_FACT'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.NUMERO_FACT'
    end
    object qryProcGetDatosNCNBSERIE_NCF_ASIGNADO: TSmallintField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.SERIE_NCF_ASIGNADO'
    end
    object qryProcGetDatosNCNBVALOR_DOCUMENTO: TFloatField
      FieldName = 'VALOR_DOCUMENTO'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.VALOR_DOCUMENTO'
    end
    object qryProcGetDatosNCNBCODIGO_CLIENTE: TSmallintField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.CODIGO_CLIENTE'
    end
    object qryProcGetDatosNCNBNUM_NCF_AFECTADO: TIBStringField
      FieldName = 'NUM_NCF_AFECTADO'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.NUM_NCF_AFECTADO'
      Size = 21
    end
    object qryProcGetDatosNCNBTIPO_TRANF: TSmallintField
      FieldName = 'TIPO_TRANF'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.TIPO_TRANF'
    end
    object qryProcGetDatosNCNBTIPO_DOC: TIntegerField
      FieldName = 'TIPO_DOC'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.TIPO_DOC'
    end
    object qryProcGetDatosNCNBFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.FECHA'
    end
    object qryProcGetDatosNCNBCONCEPTO: TIBStringField
      FieldName = 'CONCEPTO'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.CONCEPTO'
      Size = 60
    end
  end
  object qryRepLibroVentaDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select Distinct r.*'
      
        'From Proc_GetRepFiscaldet(:fechaini, :fechafin,:cierreZini,:cier' +
        'reZfin) r'
      'order by r.tipo')
    Left = 872
    Top = 288
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'cierreZini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'cierreZfin'
        ParamType = ptInput
      end>
  end
  object qryDatosRepVentaDiariaRes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT  r.FECHA, r.NUMERO_TRN, r.NUMERO_DOCUMENTO, R.MONEDA, r.c' +
        'odigo_empleado, u.nombrecompleto nombre_vendedor, r.fecha,  r.ti' +
        'po_documento, r.Tipo_doc, SUM(r.DEBITO+r.CREDITO) valor_document' +
        'o,'
      
        'Sum(Distinct r.monto_recibido)  monto_recibido, Count(Distinct r' +
        '.numero_documento) cantVta'
      'FROM Proc_datos_venta_diaria(:Fechaini, :Fechafin) r'
      'Left Join usuario u on r.CODIGO_EMPLEADO = u.CODIGO_EMPLEADO'
      'Where moneda Between :monedaini And :monedafin'
      
        'Group By r.FECHA, r.NUMERO_TRN, r.NUMERO_DOCUMENTO, R.MONEDA, r.' +
        'fecha, u.NOMBRECOMPLETO, r.codigo_empleado, r.tipo_documento, r.' +
        'Tipo_doc'
      'Order By  R.MONEDA, r.codigo_empleado, r.tipo_documento, r.fecha'
      '')
    Left = 40
    Top = 272
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'Fechafin'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'monedaini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'monedafin'
        ParamType = ptInput
      end>
    object qryDatosRepVentaDiariaResFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_DATOS_VENTA_DIARIA.FECHA'
    end
    object qryDatosRepVentaDiariaResNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'PROC_DATOS_VENTA_DIARIA.NUMERO_TRN'
    end
    object qryDatosRepVentaDiariaResNUMERO_DOCUMENTO: TIntegerField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'PROC_DATOS_VENTA_DIARIA.NUMERO_DOCUMENTO'
    end
    object qryDatosRepVentaDiariaResMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'PROC_DATOS_VENTA_DIARIA.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryDatosRepVentaDiariaResCODIGO_EMPLEADO: TIntegerField
      FieldName = 'CODIGO_EMPLEADO'
      Origin = 'PROC_DATOS_VENTA_DIARIA.CODIGO_EMPLEADO'
    end
    object qryDatosRepVentaDiariaResNOMBRE_VENDEDOR: TIBStringField
      FieldName = 'NOMBRE_VENDEDOR'
      Size = 40
    end
    object qryDatosRepVentaDiariaResFECHA1: TDateTimeField
      FieldName = 'FECHA1'
      Origin = 'PROC_DATOS_VENTA_DIARIA.FECHA'
    end
    object qryDatosRepVentaDiariaResTIPO_DOCUMENTO: TIBStringField
      FieldName = 'TIPO_DOCUMENTO'
      Origin = 'PROC_DATOS_VENTA_DIARIA.TIPO_DOCUMENTO'
      Size = 30
    end
    object qryDatosRepVentaDiariaResTIPO_DOC: TIntegerField
      FieldName = 'TIPO_DOC'
      Origin = 'PROC_DATOS_VENTA_DIARIA.TIPO_DOC'
    end
    object qryDatosRepVentaDiariaResVALOR_DOCUMENTO: TFloatField
      FieldName = 'VALOR_DOCUMENTO'
    end
    object qryDatosRepVentaDiariaResMONTO_RECIBIDO: TFloatField
      FieldName = 'MONTO_RECIBIDO'
    end
    object qryDatosRepVentaDiariaResCANTVTA: TIntegerField
      FieldName = 'CANTVTA'
      Required = True
    end
  end
  object dstblConfReportes: TDataSource
    DataSet = tblConfReportes
    Left = 920
    Top = 216
  end
  object tblConfReportes: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CONF_REPORTES'
      'where'
      '  IDREPORTE = :OLD_IDREPORTE')
    InsertSQL.Strings = (
      'insert into CONF_REPORTES'
      
        '  (IDREPORTE, SIZE_REP, DESCRIPCION, ENVIAR_EMAIL, TO_EMAIL, CC_' +
        'EMAIL, '
      
        '   COD_USUARIO, FECHA_IN, IN_POR, FECHA_UPD, UPD_POR, STATUS, IM' +
        'PRECIBOSINPREG, '
      
        '   NOTA_PIE_PAGINA, HEADER_LINE1, CODIGO_PROD, NOTAPIEPAGINAFACT' +
        'CREDITO)'
      'values'
      
        '  (:IDREPORTE, :SIZE_REP, :DESCRIPCION, :ENVIAR_EMAIL, :TO_EMAIL' +
        ', :CC_EMAIL, '
      
        '   :COD_USUARIO, :FECHA_IN, :IN_POR, :FECHA_UPD, :UPD_POR, :STAT' +
        'US, :IMPRECIBOSINPREG, '
      
        '   :NOTA_PIE_PAGINA, :HEADER_LINE1, :CODIGO_PROD, :NOTAPIEPAGINA' +
        'FACTCREDITO)')
    RefreshSQL.Strings = (
      'Select '
      '  IDREPORTE,'
      '  SIZE_REP,'
      '  DESCRIPCION,'
      '  ENVIAR_EMAIL,'
      '  TO_EMAIL,'
      '  CC_EMAIL,'
      '  COD_USUARIO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_UPD,'
      '  UPD_POR,'
      '  STATUS,'
      '  IMPRECIBOSINPREG,'
      '  NOTA_PIE_PAGINA,'
      '  HEADER_LINE1,'
      '  CODIGO_PROD,'
      '  NOTAPIEPAGINAFACTCREDITO'
      'from CONF_REPORTES '
      'where'
      '  IDREPORTE = :IDREPORTE')
    SelectSQL.Strings = (
      'select * from CONF_REPORTES')
    ModifySQL.Strings = (
      'update CONF_REPORTES'
      'set'
      '  IDREPORTE = :IDREPORTE,'
      '  SIZE_REP = :SIZE_REP,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  ENVIAR_EMAIL = :ENVIAR_EMAIL,'
      '  TO_EMAIL = :TO_EMAIL,'
      '  CC_EMAIL = :CC_EMAIL,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_UPD = :FECHA_UPD,'
      '  UPD_POR = :UPD_POR,'
      '  STATUS = :STATUS,'
      '  IMPRECIBOSINPREG = :IMPRECIBOSINPREG,'
      '  NOTA_PIE_PAGINA = :NOTA_PIE_PAGINA,'
      '  HEADER_LINE1 = :HEADER_LINE1,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  NOTAPIEPAGINAFACTCREDITO = :NOTAPIEPAGINAFACTCREDITO'
      'where'
      '  IDREPORTE = :OLD_IDREPORTE')
    GeneratorField.Field = 'IDREPORTE'
    GeneratorField.Generator = 'GEN_IDREPORTE'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 920
    Top = 160
    object tblConfReportesIDREPORTE: TIntegerField
      FieldName = 'IDREPORTE'
      Origin = 'CONF_REPORTES.IDREPORTE'
      Required = True
    end
    object tblConfReportesSIZE_REP: TSmallintField
      FieldName = 'SIZE_REP'
      Origin = 'CONF_REPORTES.SIZE_REP'
      Required = True
    end
    object tblConfReportesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'CONF_REPORTES.DESCRIPCION'
      Size = 50
    end
    object tblConfReportesENVIAR_EMAIL: TSmallintField
      FieldName = 'ENVIAR_EMAIL'
      Origin = 'CONF_REPORTES.ENVIAR_EMAIL'
    end
    object tblConfReportesTO_EMAIL: TIBStringField
      FieldName = 'TO_EMAIL'
      Origin = 'CONF_REPORTES.TO_EMAIL'
      Size = 180
    end
    object tblConfReportesCC_EMAIL: TIBStringField
      FieldName = 'CC_EMAIL'
      Origin = 'CONF_REPORTES.CC_EMAIL'
      Size = 180
    end
    object tblConfReportesCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'CONF_REPORTES.COD_USUARIO'
    end
    object tblConfReportesFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CONF_REPORTES.FECHA_IN'
    end
    object tblConfReportesIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'CONF_REPORTES.IN_POR'
      Size = 12
    end
    object tblConfReportesFECHA_UPD: TDateTimeField
      FieldName = 'FECHA_UPD'
      Origin = 'CONF_REPORTES.FECHA_UPD'
    end
    object tblConfReportesUPD_POR: TIBStringField
      FieldName = 'UPD_POR'
      Origin = 'CONF_REPORTES.UPD_POR'
      Size = 12
    end
    object tblConfReportesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CONF_REPORTES.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblConfReportesIMPRECIBOSINPREG: TSmallintField
      FieldName = 'IMPRECIBOSINPREG'
      Origin = 'CONF_REPORTES.IMPRECIBOSINPREG'
    end
    object tblConfReportesNOTA_PIE_PAGINA: TIBStringField
      FieldName = 'NOTA_PIE_PAGINA'
      Origin = 'CONF_REPORTES.NOTA_PIE_PAGINA'
      Size = 30
    end
    object tblConfReportesHEADER_LINE1: TMemoField
      FieldName = 'HEADER_LINE1'
      Origin = 'CONF_REPORTES.HEADER_LINE1'
      BlobType = ftMemo
      Size = 8
    end
    object tblConfReportesCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'CONF_REPORTES.CODIGO_PROD'
    end
    object tblConfReportesNOTAPIEPAGINAFACTCREDITO: TMemoField
      FieldName = 'NOTAPIEPAGINAFACTCREDITO'
      Origin = 'CONF_REPORTES.NOTAPIEPAGINAFACTCREDITO'
      BlobType = ftMemo
      Size = 8
    end
  end
  object qryConfReportes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *  From CONF_REPORTES'
      'Where  Status = '#39'A'#39
      'And idreporte=:idReporte')
    Left = 928
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idReporte'
        ParamType = ptInput
      end>
    object qryConfReportesIDREPORTE: TIntegerField
      FieldName = 'IDREPORTE'
      Origin = 'CONF_REPORTES.IDREPORTE'
      Required = True
    end
    object qryConfReportesSIZE_REP: TSmallintField
      FieldName = 'SIZE_REP'
      Origin = 'CONF_REPORTES.SIZE_REP'
      Required = True
    end
    object qryConfReportesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'CONF_REPORTES.DESCRIPCION'
      Size = 50
    end
    object qryConfReportesENVIAR_EMAIL: TSmallintField
      FieldName = 'ENVIAR_EMAIL'
      Origin = 'CONF_REPORTES.ENVIAR_EMAIL'
    end
    object qryConfReportesTO_EMAIL: TIBStringField
      FieldName = 'TO_EMAIL'
      Origin = 'CONF_REPORTES.TO_EMAIL'
      Size = 180
    end
    object qryConfReportesCC_EMAIL: TIBStringField
      FieldName = 'CC_EMAIL'
      Origin = 'CONF_REPORTES.CC_EMAIL'
      Size = 180
    end
    object qryConfReportesCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'CONF_REPORTES.COD_USUARIO'
    end
    object qryConfReportesFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CONF_REPORTES.FECHA_IN'
    end
    object qryConfReportesIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'CONF_REPORTES.IN_POR'
      Size = 12
    end
    object qryConfReportesFECHA_UPD: TDateTimeField
      FieldName = 'FECHA_UPD'
      Origin = 'CONF_REPORTES.FECHA_UPD'
    end
    object qryConfReportesUPD_POR: TIBStringField
      FieldName = 'UPD_POR'
      Origin = 'CONF_REPORTES.UPD_POR'
      Size = 12
    end
    object qryConfReportesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CONF_REPORTES.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryConfReportesIMPRECIBOSINPREG: TSmallintField
      FieldName = 'IMPRECIBOSINPREG'
      Origin = 'CONF_REPORTES.IMPRECIBOSINPREG'
    end
    object qryConfReportesNOTA_PIE_PAGINA: TIBStringField
      FieldName = 'NOTA_PIE_PAGINA'
      Origin = 'CONF_REPORTES.NOTA_PIE_PAGINA'
      Size = 30
    end
    object qryConfReportesHEADER_LINE1: TMemoField
      FieldName = 'HEADER_LINE1'
      Origin = 'CONF_REPORTES.HEADER_LINE1'
      BlobType = ftMemo
      Size = 8
    end
    object qryConfReportesCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'CONF_REPORTES.CODIGO_PROD'
    end
    object qryConfReportesNOTAPIEPAGINAFACTCREDITO: TMemoField
      FieldName = 'NOTAPIEPAGINAFACTCREDITO'
      Origin = 'CONF_REPORTES.NOTAPIEPAGINAFACTCREDITO'
      BlobType = ftMemo
      Size = 8
    end
  end
  object qryRepRepMasterDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from REPARACIONES_DET'
      'Where numero=:numero')
    Left = 272
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
  end
  object qryRepRepMaster: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT REPARACIONES_MASTER.NUMERO,'
      '       REPARACIONES_MASTER.TIPO_TRN,'
      '       REPARACIONES_MASTER.COD_PROVEEDOR,'
      '       REPARACIONES_MASTER.FECHA,'
      '       REPARACIONES_MASTER.OBSERVACION,'
      '       REPARACIONES_MASTER.STATUS,'
      '       PROVEEDORES.DESCRIPCION,'
      '       PROVEEDORES.TELEFONO,'
      '       PROVEEDORES.CALYYNUM,'
      '       PROVEEDORES.CIUDAD,'
      '       PROVEEDORES.PAIS,'
      '       PROVEEDORES.CONTACTO,'
      '       TIPO_TRN.DESCRIPCION TIPO_TRNDESC'
      'FROM TIPO_TRN'
      
        '   INNER JOIN REPARACIONES_MASTER ON (TIPO_TRN.CODIGO = REPARACI' +
        'ONES_MASTER.TIPO_TRN)'
      
        '   INNER JOIN PROVEEDORES ON (REPARACIONES_MASTER.COD_PROVEEDOR ' +
        '= PROVEEDORES.CODIGO_CTE)'
      'WHERE REPARACIONES_MASTER.NUMERO =:numero')
    Left = 264
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryRepRepMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'REPARACIONES_MASTER.NUMERO'
      Required = True
    end
    object qryRepRepMasterTIPO_TRN: TIntegerField
      FieldName = 'TIPO_TRN'
      Origin = 'REPARACIONES_MASTER.TIPO_TRN'
      Required = True
    end
    object qryRepRepMasterCOD_PROVEEDOR: TIntegerField
      FieldName = 'COD_PROVEEDOR'
      Origin = 'REPARACIONES_MASTER.COD_PROVEEDOR'
      Required = True
    end
    object qryRepRepMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'REPARACIONES_MASTER.FECHA'
    end
    object qryRepRepMasterOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'REPARACIONES_MASTER.OBSERVACION'
      Size = 100
    end
    object qryRepRepMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'REPARACIONES_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepRepMasterDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object qryRepRepMasterTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object qryRepRepMasterCALYYNUM: TIBStringField
      FieldName = 'CALYYNUM'
      Origin = 'PROVEEDORES.CALYYNUM'
      Size = 80
    end
    object qryRepRepMasterCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROVEEDORES.CIUDAD'
    end
    object qryRepRepMasterPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PROVEEDORES.PAIS'
      Size = 30
    end
    object qryRepRepMasterCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'PROVEEDORES.CONTACTO'
      Size = 35
    end
    object qryRepRepMasterTIPO_TRNDESC: TIBStringField
      FieldName = 'TIPO_TRNDESC'
      Origin = 'TIPO_TRN.DESCRIPCION'
      Size = 30
    end
  end
  object qryRepServTallerM_base: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Distinct   '
      '  SERVICIOS_MASTER.CODIGO_EMP,'
      '  EMPLEADO.NOMBRE||" " ||Empleado.APELLIDO   NOMBRE_EMPLEADO,'
      '  EMPLEADO.NOMBRE,'
      '  EMPLEADO.APELLIDO'
      'FROM'
      '  SERVICIOS_MASTER'
      
        '  LEFT OUTER JOIN CLIENTES ON (SERVICIOS_MASTER.CODIGO_CTE = CLI' +
        'ENTES.CODIGO_CTE)'
      
        '  LEFT OUTER JOIN EMPLEADO ON (SERVICIOS_MASTER.CODIGO_EMP = EMP' +
        'LEADO.CODIGO)')
    Left = 920
    Top = 392
    object qryRepServTallerM_baseCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'SERVICIOS_MASTER.CODIGO_EMP'
    end
    object qryRepServTallerM_baseNOMBRE_EMPLEADO: TIBStringField
      FieldName = 'NOMBRE_EMPLEADO'
      Size = 71
    end
    object qryRepServTallerM_baseNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object qryRepServTallerM_baseAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADO.APELLIDO'
      Size = 35
    end
  end
  object qryRepServTallerDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  DETALLE_SERVICIO.SERIE,'
      '  DETALLE_SERVICIO.NUMERO,'
      '  DETALLE_SERVICIO.FECHA,'
      '  DETALLE_SERVICIO.COD_SERVICIO,'
      '  DETALLE_SERVICIO.CANT,'
      '  DETALLE_SERVICIO.VALOR_SERVICIO,'
      '  DETALLE_SERVICIO.PORC_ITBIS,'
      '  DETALLE_SERVICIO.PORC_DESC,'
      '  DETALLE_SERVICIO.VALOR_ITBIS,'
      '  DETALLE_SERVICIO.VALOR_DESCUENTO,'
      '  DETALLE_SERVICIO.DESCRIPCION,'
      '  DETALLE_SERVICIO.STATUS,'
      '  DETALLE_SERVICIO.IN_POR,'
      '  DETALLE_SERVICIO.FECHA_IN,'
      '  DETALLE_SERVICIO.UPDATE_POR,'
      '  DETALLE_SERVICIO.FECHA_UPDATE,'
      '  DETALLE_SERVICIO.COD_USUARIO,'
      '  DETALLE_SERVICIO.PRECIO,'
      '  DETALLE_SERVICIO.DESCRIPCIONESPECIAL,'
      '  INVENTARIO_PRODUCTO.DESCRIPCION,'
      '  INVENTARIO_PRODUCTO.PRECIO_COMPRA,'
      '  SERVICIOS_MASTER.FECHA_ENTRADA,'
      '  INVENTARIO_PRODUCTO.PRECIO_COMPRA *'
      'DETALLE_SERVICIO.CANT costo_producto,'
      'SERVICIOS_MASTER.FECHA_ESTIMADA_ENTREGA'
      'FROM'
      '  DETALLE_SERVICIO'
      
        '  LEFT OUTER JOIN INVENTARIO_PRODUCTO ON (DETALLE_SERVICIO.COD_S' +
        'ERVICIO = INVENTARIO_PRODUCTO.CODIGO)'
      
        '  INNER JOIN SERVICIOS_MASTER ON (DETALLE_SERVICIO.NUMERO = SERV' +
        'ICIOS_MASTER.NUMERO)'
      'Where DETALLE_SERVICIO.FECHA Between :fechaini and :fechafin'
      'And SERVICIOS_MASTER.codigo_emp =:codigoemp')
    Left = 928
    Top = 448
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigoemp'
        ParamType = ptInput
      end>
    object qryRepServTallerDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DETALLE_SERVICIO.SERIE'
      Required = True
    end
    object qryRepServTallerDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DETALLE_SERVICIO.NUMERO'
      Required = True
    end
    object qryRepServTallerDetFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DETALLE_SERVICIO.FECHA'
    end
    object qryRepServTallerDetCOD_SERVICIO: TIntegerField
      FieldName = 'COD_SERVICIO'
      Origin = 'DETALLE_SERVICIO.COD_SERVICIO'
    end
    object qryRepServTallerDetCANT: TFloatField
      FieldName = 'CANT'
      Origin = 'DETALLE_SERVICIO.CANT'
    end
    object qryRepServTallerDetVALOR_SERVICIO: TFloatField
      FieldName = 'VALOR_SERVICIO'
      Origin = 'DETALLE_SERVICIO.VALOR_SERVICIO'
    end
    object qryRepServTallerDetPORC_ITBIS: TFloatField
      FieldName = 'PORC_ITBIS'
      Origin = 'DETALLE_SERVICIO.PORC_ITBIS'
    end
    object qryRepServTallerDetPORC_DESC: TFloatField
      FieldName = 'PORC_DESC'
      Origin = 'DETALLE_SERVICIO.PORC_DESC'
    end
    object qryRepServTallerDetVALOR_ITBIS: TFloatField
      FieldName = 'VALOR_ITBIS'
      Origin = 'DETALLE_SERVICIO.VALOR_ITBIS'
    end
    object qryRepServTallerDetVALOR_DESCUENTO: TFloatField
      FieldName = 'VALOR_DESCUENTO'
      Origin = 'DETALLE_SERVICIO.VALOR_DESCUENTO'
    end
    object qryRepServTallerDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DETALLE_SERVICIO.DESCRIPCION'
      Size = 60
    end
    object qryRepServTallerDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DETALLE_SERVICIO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepServTallerDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DETALLE_SERVICIO.IN_POR'
      Size = 12
    end
    object qryRepServTallerDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DETALLE_SERVICIO.FECHA_IN'
    end
    object qryRepServTallerDetUPDATE_POR: TIBStringField
      FieldName = 'UPDATE_POR'
      Origin = 'DETALLE_SERVICIO.UPDATE_POR'
      Size = 12
    end
    object qryRepServTallerDetFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'DETALLE_SERVICIO.FECHA_UPDATE'
    end
    object qryRepServTallerDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'DETALLE_SERVICIO.COD_USUARIO'
    end
    object qryRepServTallerDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'DETALLE_SERVICIO.PRECIO'
    end
    object qryRepServTallerDetDESCRIPCIONESPECIAL: TMemoField
      FieldName = 'DESCRIPCIONESPECIAL'
      Origin = 'DETALLE_SERVICIO.DESCRIPCIONESPECIAL'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepServTallerDetDESCRIPCION1: TIBStringField
      FieldName = 'DESCRIPCION1'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryRepServTallerDetPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryRepServTallerDetCOSTO_PRODUCTO: TFloatField
      FieldName = 'COSTO_PRODUCTO'
    end
    object qryRepServTallerDetFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'SERVICIOS_MASTER.FECHA_ENTRADA'
      Required = True
    end
    object qryRepServTallerDetFECHA_ESTIMADA_ENTREGA: TDateTimeField
      FieldName = 'FECHA_ESTIMADA_ENTREGA'
      Origin = 'SERVICIOS_MASTER.FECHA_ESTIMADA_ENTREGA'
    end
  end
  object qryRepServTallerM: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepServTallerMAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT  Distinct'
      '  SERVICIOS_MASTER.NUMERO,'
      '  SERVICIOS_MASTER.FECHA_ENTRADA,'
      '  SERVICIOS_MASTER.FECHA_SALIDA,'
      '  SERVICIOS_MASTER.LAVADO,'
      '  SERVICIOS_MASTER.PLANCHADO,'
      '  SERVICIOS_MASTER.NOMBRE_CLIENTE,'
      '  SERVICIOS_MASTER.MONTO_TOTAL,'
      '  SERVICIOS_MASTER.COD_USUARIO,'
      '  SERVICIOS_MASTER.STATUS,'
      '  SERVICIOS_MASTER.MONTO_RECIBIDO,'
      '  SERVICIOS_MASTER.MONTO_DEVUELTO,'
      '  SERVICIOS_MASTER.CODIGO_EMP,'
      '  SERVICIOS_MASTER.CODIGO_CTE,'
      '  CLIENTES.CONTACTO,'
      '  CLIENTES.NOMBRE_CTE,'
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  EMPLEADO.NOMBRE||" " ||Empleado.APELLIDO NOMBRE_EMPLEADO,'
      '  EMPLEADO.NOMBRE,'
      '  EMPLEADO.APELLIDO'
      'FROM'
      '  SERVICIOS_MASTER'
      
        '  LEFT OUTER JOIN CLIENTES ON (SERVICIOS_MASTER.CODIGO_CTE = CLI' +
        'ENTES.CODIGO_CTE)'
      
        '  LEFT OUTER JOIN EMPLEADO ON (SERVICIOS_MASTER.CODIGO_EMP = EMP' +
        'LEADO.CODIGO)')
    Left = 888
    Top = 336
    object qryRepServTallerMCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'SERVICIOS_MASTER.CODIGO_EMP'
    end
    object qryRepServTallerMNOMBRE_EMPLEADO: TIBStringField
      FieldName = 'NOMBRE_EMPLEADO'
      Size = 71
    end
    object qryRepServTallerMNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object qryRepServTallerMAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADO.APELLIDO'
      Size = 35
    end
  end
  object qryRepServTallerM_baseCopia: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Distinct '
      '  SERVICIOS_MASTER.NUMERO,'
      '  SERVICIOS_MASTER.FECHA_ENTRADA,'
      '  SERVICIOS_MASTER.FECHA_SALIDA,'
      '  SERVICIOS_MASTER.LAVADO,'
      '  SERVICIOS_MASTER.PLANCHADO,'
      '  SERVICIOS_MASTER.NOMBRE_CLIENTE,'
      '  SERVICIOS_MASTER.MONTO_TOTAL,'
      '  SERVICIOS_MASTER.COD_USUARIO,'
      '  SERVICIOS_MASTER.STATUS,'
      '  SERVICIOS_MASTER.MONTO_RECIBIDO,'
      '  SERVICIOS_MASTER.MONTO_DEVUELTO,'
      '  SERVICIOS_MASTER.CODIGO_EMP,'
      '  SERVICIOS_MASTER.CODIGO_CTE,'
      '  CLIENTES.CONTACTO,'
      '  CLIENTES.NOMBRE_CTE,'
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  EMPLEADO.NOMBRE||" " ||Empleado.APELLIDO NOMBRE_EMPLEADO,'
      '  EMPLEADO.NOMBRE,'
      '  EMPLEADO.APELLIDO'
      'FROM'
      '  SERVICIOS_MASTER'
      
        '  LEFT OUTER JOIN CLIENTES ON (SERVICIOS_MASTER.CODIGO_CTE = CLI' +
        'ENTES.CODIGO_CTE)'
      
        '  LEFT OUTER JOIN EMPLEADO ON (SERVICIOS_MASTER.CODIGO_EMP = EMP' +
        'LEADO.CODIGO)')
    Left = 720
    Top = 472
  end
  object qryRepServXTipoDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  ALQUILER_DET.*,'
      '  INVENTARIO_PRODUCTO.DESCRIPCION,'
      '  INVENTARIO_PRODUCTO.PRECIO_COMPRA,'
      '  ALQUILER_MASTER.FECHA,'
      '  ALQUILER_MASTER.FECHA_ENTRADA,'
      '  ALQUILER_MASTER.FECHA_ENT_ESTIMADA'
      'FROM'
      '  ALQUILER_DET'
      
        '  LEFT OUTER JOIN INVENTARIO_PRODUCTO ON (ALQUILER_DET.COD_PRODU' +
        'CTO = INVENTARIO_PRODUCTO.CODIGO)'
      
        '  INNER JOIN ALQUILER_MASTER ON (ALQUILER_DET.IDSERIE = ALQUILER' +
        '_MASTER.IDSERIE)'
      'Where ALQUILER_DET.IDSERIE=:idserie')
    Left = 744
    Top = 512
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idserie'
        ParamType = ptUnknown
      end>
    object qryRepServXTipoDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'ALQUILER_DET.SERIE'
      Required = True
    end
    object qryRepServXTipoDetIDSERIE: TIntegerField
      FieldName = 'IDSERIE'
      Origin = 'ALQUILER_DET.IDSERIE'
      Required = True
    end
    object qryRepServXTipoDetCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'ALQUILER_DET.COD_PRODUCTO'
    end
    object qryRepServXTipoDetSERIE_TRN: TIntegerField
      FieldName = 'SERIE_TRN'
      Origin = 'ALQUILER_DET.SERIE_TRN'
    end
    object qryRepServXTipoDetCANT_DIAS: TFloatField
      FieldName = 'CANT_DIAS'
      Origin = 'ALQUILER_DET.CANT_DIAS'
    end
    object qryRepServXTipoDetPRECIO_XDIA: TFloatField
      FieldName = 'PRECIO_XDIA'
      Origin = 'ALQUILER_DET.PRECIO_XDIA'
    end
    object qryRepServXTipoDetMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'ALQUILER_DET.MONTO'
    end
    object qryRepServXTipoDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ALQUILER_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepServXTipoDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ALQUILER_DET.FECHA_IN'
    end
    object qryRepServXTipoDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ALQUILER_DET.IN_POR'
      Size = 12
    end
    object qryRepServXTipoDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'ALQUILER_DET.FECHA_MOD'
    end
    object qryRepServXTipoDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'ALQUILER_DET.MOD_POR'
      Size = 12
    end
    object qryRepServXTipoDetCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'ALQUILER_DET.CODIGO_USUARIO'
    end
    object qryRepServXTipoDetDESCRIPCIONSERVICIO: TMemoField
      FieldName = 'DESCRIPCIONSERVICIO'
      Origin = 'ALQUILER_DET.DESCRIPCIONSERVICIO'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepServXTipoDetPORC_SEGURO: TFloatField
      FieldName = 'PORC_SEGURO'
      Origin = 'ALQUILER_DET.PORC_SEGURO'
    end
    object qryRepServXTipoDetMONTO_SEGURO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'MONTO_SEGURO'
      Origin = 'ALQUILER_DET.MONTO_SEGURO'
      ReadOnly = True
    end
    object qryRepServXTipoDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryRepServXTipoDetPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryRepServXTipoDetFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ALQUILER_MASTER.FECHA'
      Required = True
    end
    object qryRepServXTipoDetFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'ALQUILER_MASTER.FECHA_ENTRADA'
    end
    object qryRepServXTipoDetFECHA_ENT_ESTIMADA: TDateTimeField
      FieldName = 'FECHA_ENT_ESTIMADA'
      Origin = 'ALQUILER_MASTER.FECHA_ENT_ESTIMADA'
    end
  end
  object qryRepServXTipoMaster: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepServXTipoMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Distinct   '
      '  ALQUILER_MASTER.CODIGO_USUARIO,'
      '  EMPLEADO.NOMBRE||" " ||Empleado.APELLIDO   NOMBRE_EMPLEADO,'
      '  EMPLEADO.NOMBRE,'
      '  EMPLEADO.APELLIDO'
      'FROM'
      '  ALQUILER_MASTER'
      
        '  LEFT OUTER JOIN CLIENTES ON (ALQUILER_MASTER.CODIGO_USUARIO = ' +
        'CLIENTES.CODIGO_CTE)'
      
        '  LEFT OUTER JOIN EMPLEADO ON (ALQUILER_MASTER.CODIGO_USUARIO = ' +
        'EMPLEADO.CODIGO)')
    Left = 888
    Top = 448
    object qryRepServXTipoMasterCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'ALQUILER_MASTER.CODIGO_USUARIO'
    end
    object qryRepServXTipoMasterNOMBRE_EMPLEADO: TIBStringField
      FieldName = 'NOMBRE_EMPLEADO'
      Size = 71
    end
    object qryRepServXTipoMasterNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object qryRepServXTipoMasterAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADO.APELLIDO'
      Size = 35
    end
  end
  object qryRepServXTipoMaster_Base: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Distinct   '
      '  ALQUILER_MASTER.CODIGO_USUARIO,'
      '  EMPLEADO.NOMBRE||" " ||Empleado.APELLIDO   NOMBRE_EMPLEADO,'
      '  EMPLEADO.NOMBRE,'
      '  EMPLEADO.APELLIDO'
      'FROM'
      '  ALQUILER_MASTER'
      
        '  LEFT OUTER JOIN CLIENTES ON (ALQUILER_MASTER.CODIGO_USUARIO = ' +
        'CLIENTES.CODIGO_CTE)'
      
        '  LEFT OUTER JOIN EMPLEADO ON (ALQUILER_MASTER.CODIGO_USUARIO = ' +
        'EMPLEADO.CODIGO)')
    Left = 888
    Top = 505
  end
  object qryPorcRetencion: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from retenciones_dgii'
      'Where :fecha between FECHAINI and FECHAFINAL'
      'And idretencion =:idretencion')
    Left = 576
    Top = 440
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idretencion'
        ParamType = ptInput
      end>
    object qryPorcRetencionIDRETENCION: TIntegerField
      FieldName = 'IDRETENCION'
      Origin = 'RETENCIONES_DGII.IDRETENCION'
      Required = True
    end
    object qryPorcRetencionFECHAINI: TDateTimeField
      FieldName = 'FECHAINI'
      Origin = 'RETENCIONES_DGII.FECHAINI'
    end
    object qryPorcRetencionFECHAFINAL: TDateTimeField
      FieldName = 'FECHAFINAL'
      Origin = 'RETENCIONES_DGII.FECHAFINAL'
    end
    object qryPorcRetencionPORCIENTO: TFloatField
      FieldName = 'PORCIENTO'
      Origin = 'RETENCIONES_DGII.PORCIENTO'
    end
    object qryPorcRetencionDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'RETENCIONES_DGII.DESCRIPCION'
      Size = 80
    end
    object qryPorcRetencionSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'RETENCIONES_DGII.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryEstadoCxcBB: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Proc_DatosEstadoCxc'
      'Where codigo_cte=:codigocte'
      '--And Monto_pendiente > 0'
      'order by numero')
    Left = 272
    Top = 488
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigocte'
        ParamType = ptInput
      end>
    object qryEstadoCxcBBCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
    end
    object qryEstadoCxcBBNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Size = 60
    end
    object qryEstadoCxcBBRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Size = 14
    end
    object qryEstadoCxcBBTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'PROC_DATOSESTADOCXC.TELEF_CONTACTO'
      Size = 14
    end
    object qryEstadoCxcBBMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'PROC_DATOSESTADOCXC.MOVIL1'
    end
    object qryEstadoCxcBBNUMERO: TFloatField
      FieldName = 'NUMERO'
      Origin = 'PROC_DATOSESTADOCXC.NUMERO'
    end
    object qryEstadoCxcBBFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_DATOSESTADOCXC.FECHA'
    end
    object qryEstadoCxcBBFECHA_VENCE: TDateTimeField
      FieldName = 'FECHA_VENCE'
      Origin = 'PROC_DATOSESTADOCXC.FECHA_VENCE'
    end
    object qryEstadoCxcBBMONTO_FACT: TFloatField
      FieldName = 'MONTO_FACT'
      Origin = 'PROC_DATOSESTADOCXC.MONTO_FACT'
    end
    object qryEstadoCxcBBMONTO_VENCIDO: TFloatField
      FieldName = 'MONTO_VENCIDO'
      Origin = 'PROC_DATOSESTADOCXC.MONTO_VENCIDO'
    end
    object qryEstadoCxcBBMONTO_PENDIENTE: TFloatField
      FieldName = 'MONTO_PENDIENTE'
      Origin = 'PROC_DATOSESTADOCXC.MONTO_PENDIENTE'
    end
    object qryEstadoCxcBBMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'PROC_DATOSESTADOCXC.MONEDA'
      FixedChar = True
      Size = 2
    end
    object qryEstadoCxcBBSTATUS_FACTURA: TIBStringField
      FieldName = 'STATUS_FACTURA'
      Origin = 'PROC_DATOSESTADOCXC.STATUS_FACTURA'
      Size = 7
    end
  end
  object qryRepOrdenTrabajo: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  ORDEN_TRABAJO.IDORDEN,'
      '  ORDEN_TRABAJO.FECHA,'
      '  ORDEN_TRABAJO.COD_MONEDA,'
      '  ORDEN_TRABAJO.CODIGO_CTE,'
      '  ORDEN_TRABAJO.FECHA_ENTREGA,'
      '  ORDEN_TRABAJO.NUM_ORDEN,'
      '  ORDEN_TRABAJO.DESC_VEHICULO,'
      '  ORDEN_TRABAJO.DESC_ORDEN,'
      '  ORDEN_TRABAJO.MONTO_TOTAL,'
      '  ORDEN_TRABAJO.MONTO_ABONO,'
      '  ORDEN_TRABAJO.MONTO_TOTAL - ORDEN_TRABAJO.MONTO_ABONO Resta,'
      '  ORDEN_TRABAJO.ASIGNADO_A,'
      '  ORDEN_TRABAJO.CODIGO_USER,'
      '  ORDEN_TRABAJO.STATUS,'
      
        'DATEDIFF(DAY,ORDEN_TRABAJO.FECHA,ORDEN_TRABAJO.FECHA_ENTREGA) di' +
        'as,'
      '  MONEDA.DESCRIPCION Desc_moneda,'
      '  MONEDA.SIMBOLO simbolo_moneda,'
      '  CLIENTES.NOMBRE_CTE,'
      '  EMPLEADO.nombre||'#39' '#39'||EMPLEADO.apellido as NombreCompleto'
      'FROM'
      '  ORDEN_TRABAJO'
      
        '  INNER JOIN CLIENTES ON (ORDEN_TRABAJO.CODIGO_CTE = CLIENTES.CO' +
        'DIGO_CTE)'
      
        '  INNER JOIN MONEDA ON (ORDEN_TRABAJO.COD_MONEDA = MONEDA.CODIGO' +
        ')'
      
        '  INNER JOIN EMPLEADO ON (ORDEN_TRABAJO.ASIGNADO_A = EMPLEADO.CO' +
        'DIGO)'
      'Where  ORDEN_TRABAJO.FECHA Between :fechaini And :fechafin')
    OnFilterRecord = qryRepOrdenTrabajoFilterRecord
    Left = 416
    Top = 456
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryRepOrdenTrabajoIDORDEN: TIntegerField
      FieldName = 'IDORDEN'
      Origin = 'ORDEN_TRABAJO.IDORDEN'
      Required = True
    end
    object qryRepOrdenTrabajoFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ORDEN_TRABAJO.FECHA'
      Required = True
    end
    object qryRepOrdenTrabajoCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'ORDEN_TRABAJO.COD_MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryRepOrdenTrabajoCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'ORDEN_TRABAJO.CODIGO_CTE'
      Required = True
    end
    object qryRepOrdenTrabajoFECHA_ENTREGA: TDateTimeField
      FieldName = 'FECHA_ENTREGA'
      Origin = 'ORDEN_TRABAJO.FECHA_ENTREGA'
    end
    object qryRepOrdenTrabajoNUM_ORDEN: TIntegerField
      FieldName = 'NUM_ORDEN'
      Origin = 'ORDEN_TRABAJO.NUM_ORDEN'
      Required = True
    end
    object qryRepOrdenTrabajoDESC_VEHICULO: TIBStringField
      FieldName = 'DESC_VEHICULO'
      Origin = 'ORDEN_TRABAJO.DESC_VEHICULO'
      Size = 70
    end
    object qryRepOrdenTrabajoDESC_ORDEN: TMemoField
      FieldName = 'DESC_ORDEN'
      Origin = 'ORDEN_TRABAJO.DESC_ORDEN'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepOrdenTrabajoMONTO_TOTAL: TFloatField
      FieldName = 'MONTO_TOTAL'
      Origin = 'ORDEN_TRABAJO.MONTO_TOTAL'
    end
    object qryRepOrdenTrabajoMONTO_ABONO: TFloatField
      FieldName = 'MONTO_ABONO'
      Origin = 'ORDEN_TRABAJO.MONTO_ABONO'
    end
    object qryRepOrdenTrabajoASIGNADO_A: TIntegerField
      FieldName = 'ASIGNADO_A'
      Origin = 'ORDEN_TRABAJO.ASIGNADO_A'
    end
    object qryRepOrdenTrabajoCODIGO_USER: TIntegerField
      FieldName = 'CODIGO_USER'
      Origin = 'ORDEN_TRABAJO.CODIGO_USER'
    end
    object qryRepOrdenTrabajoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ORDEN_TRABAJO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepOrdenTrabajoDESC_MONEDA: TIBStringField
      FieldName = 'DESC_MONEDA'
      Origin = 'MONEDA.DESCRIPCION'
      FixedChar = True
      Size = 15
    end
    object qryRepOrdenTrabajoSIMBOLO_MONEDA: TIBStringField
      FieldName = 'SIMBOLO_MONEDA'
      Origin = 'MONEDA.SIMBOLO'
      FixedChar = True
      Size = 6
    end
    object qryRepOrdenTrabajoNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryRepOrdenTrabajoNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Size = 71
    end
    object qryRepOrdenTrabajoRESTA: TFloatField
      FieldName = 'RESTA'
    end
    object qryRepOrdenTrabajoDIAS: TFloatField
      FieldName = 'DIAS'
    end
  end
  object qryReporteOrdenes_base: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  ORDEN_TRABAJO.IDORDEN,'
      '  ORDEN_TRABAJO.FECHA,'
      '  ORDEN_TRABAJO.COD_MONEDA,'
      '  ORDEN_TRABAJO.CODIGO_CTE,'
      '  ORDEN_TRABAJO.FECHA_ENTREGA,'
      '  ORDEN_TRABAJO.NUM_ORDEN,'
      '  ORDEN_TRABAJO.DESC_VEHICULO,'
      '  ORDEN_TRABAJO.DESC_ORDEN,'
      '  ORDEN_TRABAJO.MONTO_TOTAL,'
      '  ORDEN_TRABAJO.MONTO_ABONO,'
      '  ORDEN_TRABAJO.MONTO_TOTAL - ORDEN_TRABAJO.MONTO_ABONO Resta,'
      '  ORDEN_TRABAJO.ASIGNADO_A,'
      '  ORDEN_TRABAJO.CODIGO_USER,'
      '  ORDEN_TRABAJO.STATUS,'
      '  MONEDA.DESCRIPCION Desc_moneda,'
      '  MONEDA.SIMBOLO simbolo_moneda,'
      '  CLIENTES.NOMBRE_CTE,'
      '  EMPLEADO.nombre||'#39' '#39'||EMPLEADO.apellido as NombreCompleto'
      'FROM'
      '  ORDEN_TRABAJO'
      
        '  INNER JOIN CLIENTES ON (ORDEN_TRABAJO.CODIGO_CTE = CLIENTES.CO' +
        'DIGO_CTE)'
      
        '  INNER JOIN MONEDA ON (ORDEN_TRABAJO.COD_MONEDA = MONEDA.CODIGO' +
        ')'
      
        '  INNER JOIN EMPLEADO ON (ORDEN_TRABAJO.ASIGNADO_A = EMPLEADO.CO' +
        'DIGO)'
      '')
    OnFilterRecord = qryRepOrdenTrabajoFilterRecord
    Left = 416
    Top = 360
    object IntegerField11: TIntegerField
      FieldName = 'IDORDEN'
      Origin = 'ORDEN_TRABAJO.IDORDEN'
      Required = True
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ORDEN_TRABAJO.FECHA'
      Required = True
    end
    object IBStringField20: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'ORDEN_TRABAJO.COD_MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IntegerField12: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'ORDEN_TRABAJO.CODIGO_CTE'
      Required = True
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'FECHA_ENTREGA'
      Origin = 'ORDEN_TRABAJO.FECHA_ENTREGA'
    end
    object IntegerField13: TIntegerField
      FieldName = 'NUM_ORDEN'
      Origin = 'ORDEN_TRABAJO.NUM_ORDEN'
      Required = True
    end
    object IBStringField21: TIBStringField
      FieldName = 'DESC_VEHICULO'
      Origin = 'ORDEN_TRABAJO.DESC_VEHICULO'
      Size = 70
    end
    object MemoField2: TMemoField
      FieldName = 'DESC_ORDEN'
      Origin = 'ORDEN_TRABAJO.DESC_ORDEN'
      BlobType = ftMemo
      Size = 8
    end
    object FloatField23: TFloatField
      FieldName = 'MONTO_TOTAL'
      Origin = 'ORDEN_TRABAJO.MONTO_TOTAL'
    end
    object FloatField24: TFloatField
      FieldName = 'MONTO_ABONO'
      Origin = 'ORDEN_TRABAJO.MONTO_ABONO'
    end
    object IntegerField14: TIntegerField
      FieldName = 'ASIGNADO_A'
      Origin = 'ORDEN_TRABAJO.ASIGNADO_A'
    end
    object IntegerField15: TIntegerField
      FieldName = 'CODIGO_USER'
      Origin = 'ORDEN_TRABAJO.CODIGO_USER'
    end
    object IBStringField22: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ORDEN_TRABAJO.STATUS'
      FixedChar = True
      Size = 1
    end
    object IBStringField23: TIBStringField
      FieldName = 'DESC_MONEDA'
      Origin = 'MONEDA.DESCRIPCION'
      FixedChar = True
      Size = 15
    end
    object IBStringField24: TIBStringField
      FieldName = 'SIMBOLO_MONEDA'
      Origin = 'MONEDA.SIMBOLO'
      FixedChar = True
      Size = 6
    end
    object IBStringField25: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object IBStringField26: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Size = 71
    end
    object FloatField25: TFloatField
      FieldName = 'RESTA'
    end
  end
  object qryReporteOrdenes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  ORDEN_TRABAJO.IDORDEN,'
      '  ORDEN_TRABAJO.FECHA,'
      '  ORDEN_TRABAJO.COD_MONEDA,'
      '  ORDEN_TRABAJO.CODIGO_CTE,'
      '  ORDEN_TRABAJO.FECHA_ENTREGA,'
      '  ORDEN_TRABAJO.NUM_ORDEN,'
      '  ORDEN_TRABAJO.DESC_VEHICULO,'
      '  ORDEN_TRABAJO.DESC_ORDEN,'
      '  ORDEN_TRABAJO.MONTO_TOTAL,'
      '  ORDEN_TRABAJO.MONTO_ABONO,'
      '  ORDEN_TRABAJO.MONTO_TOTAL - ORDEN_TRABAJO.MONTO_ABONO Resta,'
      '  ORDEN_TRABAJO.ASIGNADO_A,'
      '  ORDEN_TRABAJO.CODIGO_USER,'
      '  ORDEN_TRABAJO.STATUS,'
      '  MONEDA.DESCRIPCION Desc_moneda,'
      '  MONEDA.SIMBOLO simbolo_moneda,'
      '  CLIENTES.NOMBRE_CTE,'
      '  EMPLEADO.nombre||'#39' '#39'||EMPLEADO.apellido as NombreCompleto'
      'FROM'
      '  ORDEN_TRABAJO'
      
        '  INNER JOIN CLIENTES ON (ORDEN_TRABAJO.CODIGO_CTE = CLIENTES.CO' +
        'DIGO_CTE)'
      
        '  INNER JOIN MONEDA ON (ORDEN_TRABAJO.COD_MONEDA = MONEDA.CODIGO' +
        ')'
      
        '  INNER JOIN EMPLEADO ON (ORDEN_TRABAJO.ASIGNADO_A = EMPLEADO.CO' +
        'DIGO)'
      'Where  ORDEN_TRABAJO.FECHA Between :fechaini And :fechafin')
    OnFilterRecord = qryRepOrdenTrabajoFilterRecord
    Left = 424
    Top = 408
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryReporteOrdenesIDORDEN: TIntegerField
      FieldName = 'IDORDEN'
      Origin = 'ORDEN_TRABAJO.IDORDEN'
      Required = True
    end
    object qryReporteOrdenesFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ORDEN_TRABAJO.FECHA'
      Required = True
    end
    object qryReporteOrdenesCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'ORDEN_TRABAJO.COD_MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryReporteOrdenesCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'ORDEN_TRABAJO.CODIGO_CTE'
      Required = True
    end
    object qryReporteOrdenesFECHA_ENTREGA: TDateTimeField
      FieldName = 'FECHA_ENTREGA'
      Origin = 'ORDEN_TRABAJO.FECHA_ENTREGA'
    end
    object qryReporteOrdenesNUM_ORDEN: TIntegerField
      FieldName = 'NUM_ORDEN'
      Origin = 'ORDEN_TRABAJO.NUM_ORDEN'
      Required = True
    end
    object qryReporteOrdenesDESC_VEHICULO: TIBStringField
      FieldName = 'DESC_VEHICULO'
      Origin = 'ORDEN_TRABAJO.DESC_VEHICULO'
      Size = 70
    end
    object qryReporteOrdenesDESC_ORDEN: TMemoField
      FieldName = 'DESC_ORDEN'
      Origin = 'ORDEN_TRABAJO.DESC_ORDEN'
      BlobType = ftMemo
      Size = 8
    end
    object qryReporteOrdenesMONTO_TOTAL: TFloatField
      FieldName = 'MONTO_TOTAL'
      Origin = 'ORDEN_TRABAJO.MONTO_TOTAL'
    end
    object qryReporteOrdenesMONTO_ABONO: TFloatField
      FieldName = 'MONTO_ABONO'
      Origin = 'ORDEN_TRABAJO.MONTO_ABONO'
    end
    object qryReporteOrdenesRESTA: TFloatField
      FieldName = 'RESTA'
    end
    object qryReporteOrdenesASIGNADO_A: TIntegerField
      FieldName = 'ASIGNADO_A'
      Origin = 'ORDEN_TRABAJO.ASIGNADO_A'
    end
    object qryReporteOrdenesCODIGO_USER: TIntegerField
      FieldName = 'CODIGO_USER'
      Origin = 'ORDEN_TRABAJO.CODIGO_USER'
    end
    object qryReporteOrdenesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ORDEN_TRABAJO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryReporteOrdenesDESC_MONEDA: TIBStringField
      FieldName = 'DESC_MONEDA'
      Origin = 'MONEDA.DESCRIPCION'
      FixedChar = True
      Size = 15
    end
    object qryReporteOrdenesSIMBOLO_MONEDA: TIBStringField
      FieldName = 'SIMBOLO_MONEDA'
      Origin = 'MONEDA.SIMBOLO'
      FixedChar = True
      Size = 6
    end
    object qryReporteOrdenesNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryReporteOrdenesNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Size = 71
    end
  end
  object qryUsuarios: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  *  From Usuario')
    Left = 72
    Top = 496
    object qryUsuariosNUMERO: TSmallintField
      FieldName = 'NUMERO'
      Origin = 'USUARIO.NUMERO'
      Required = True
    end
    object qryUsuariosCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'USUARIO.CODIGO'
      FixedChar = True
      Size = 8
    end
    object qryUsuariosCLAVE: TIBStringField
      FieldName = 'CLAVE'
      Origin = 'USUARIO.CLAVE'
      FixedChar = True
      Size = 8
    end
    object qryUsuariosCODIGO_EMPLEADO: TIntegerField
      FieldName = 'CODIGO_EMPLEADO'
      Origin = 'USUARIO.CODIGO_EMPLEADO'
    end
    object qryUsuariosNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Origin = 'USUARIO.NOMBRECOMPLETO'
      Size = 40
    end
    object qryUsuariosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'USUARIO.FOTO'
      Size = 8
    end
    object qryUsuariosTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'USUARIO.TIPO'
    end
    object qryUsuariosFECHA_VENCE_CLAVE: TDateTimeField
      FieldName = 'FECHA_VENCE_CLAVE'
      Origin = 'USUARIO.FECHA_VENCE_CLAVE'
    end
    object qryUsuariosFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'USUARIO.FECHA_ENTRADA'
    end
    object qryUsuariosFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'USUARIO.FECHA_SALIDA'
    end
    object qryUsuariosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'USUARIO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosARCHIVOCONFGWIN: TIBStringField
      FieldName = 'ARCHIVOCONFGWIN'
      Origin = 'USUARIO.ARCHIVOCONFGWIN'
      Size = 60
    end
  end
  object qryNCFNull: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  NCF_ASIGNADOS.SERIE ncf_serie,'
      '  NCF_ASIGNADOS.TIPO_NCF as ncf_tipo_ncf,'
      '  NCF_ASIGNADOS.NUMERO_NCF as ncf_numero_ncf,'
      '  NCF_ASIGNADOS.FECHA as ncf_fecha,'
      '  NCF_ASIGNADOS.MONTO AS ncf_MONTO,'
      '  NCF_ASIGNADOS.STATUS as ncf_status,'
      '  NCF_ASIGNADOS.CODIGO_USUARIO as ncf_codigousuario,'
      '  NCF_ASIGNADOS.FECHA_INSERT as ncf_fecha_insert,'
      '  NCF_ASIGNADOS.CODIGO_USUARIO as ncf_codigo_usuario,'
      '  USUARIO.NOMBRECOMPLETO as ncf_NombreUsuario,'
      '  VENTAS_MAST.NUMERO,'
      '  VENTAS_MAST.CODIGO_CTE,'
      '  VENTAS_MAST.CODIGO_VENDEDOR,'
      '  VENTAS_MAST.FORMA_PAGO,'
      '  VENTAS_MAST.OBSERVACION,'
      '  VENTAS_MAST.VALOR_TOTAL_DET,'
      '  VENTAS_MAST.MONTO_TOTAL_ITBIS,'
      '  VENTAS_MAST.STATUS,'
      '  VENTAS_MAST.NUMERO_FACTURA,'
      '  VENTAS_MAST.NUMERO_DOC_PAGO,'
      '  VENTAS_MAST.SERIE_NCF_ASIGNADO,  '
      '  VENTAS_MAST.MONTO_PAGADO,'
      '  VENTAS_MAST.MONTO_CAMBIO '
      'FROM'
      '  VENTAS_MAST'
      
        '  RIGHT OUTER JOIN NCF_ASIGNADOS ON (VENTAS_MAST.SERIE_NCF_ASIGN' +
        'ADO = NCF_ASIGNADOS.SERIE)'
      
        '  LEFT OUTER JOIN USUARIO ON (NCF_ASIGNADOS.CODIGO_USUARIO = USU' +
        'ARIO.CODIGO_EMPLEADO)'
      
        '  LEFT OUTER JOIN CLIENTES ON (VENTAS_MAST.CODIGO_CTE = clientes' +
        '.CODIGO_CTE)'
      'WHERE'
      '  (NCF_ASIGNADOS.FECHA BETWEEN :fechaini And :fechafin)'
      '  And Ventas_mast.NUMERO Is Null'
      'ORDER BY'
      '  ncf_fecha, NCF_ASIGNADOS.NUMERO_NCF,ncf_serie')
    Left = 952
    Top = 312
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryNCFNullNCF_SERIE: TIntegerField
      FieldName = 'NCF_SERIE'
      Origin = 'NCF_ASIGNADOS.SERIE'
      Required = True
    end
    object qryNCFNullNCF_TIPO_NCF: TIBStringField
      FieldName = 'NCF_TIPO_NCF'
      Origin = 'NCF_ASIGNADOS.TIPO_NCF'
      Required = True
      Size = 2
    end
    object qryNCFNullNCF_NUMERO_NCF: TIBStringField
      FieldName = 'NCF_NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Required = True
      Size = 21
    end
    object qryNCFNullNCF_FECHA: TDateTimeField
      FieldName = 'NCF_FECHA'
      Origin = 'NCF_ASIGNADOS.FECHA'
      Required = True
    end
    object qryNCFNullNCF_MONTO: TFloatField
      FieldName = 'NCF_MONTO'
      Origin = 'NCF_ASIGNADOS.MONTO'
    end
    object qryNCFNullNCF_STATUS: TIBStringField
      FieldName = 'NCF_STATUS'
      Origin = 'NCF_ASIGNADOS.STATUS'
      Size = 1
    end
    object qryNCFNullNCF_CODIGOUSUARIO: TIntegerField
      FieldName = 'NCF_CODIGOUSUARIO'
      Origin = 'NCF_ASIGNADOS.CODIGO_USUARIO'
    end
    object qryNCFNullNCF_FECHA_INSERT: TDateTimeField
      FieldName = 'NCF_FECHA_INSERT'
      Origin = 'NCF_ASIGNADOS.FECHA_INSERT'
    end
    object qryNCFNullNCF_CODIGO_USUARIO: TIntegerField
      FieldName = 'NCF_CODIGO_USUARIO'
      Origin = 'NCF_ASIGNADOS.CODIGO_USUARIO'
    end
    object qryNCFNullNCF_NOMBREUSUARIO: TIBStringField
      FieldName = 'NCF_NOMBREUSUARIO'
      Origin = 'USUARIO.NOMBRECOMPLETO'
      Size = 40
    end
    object qryNCFNullNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
    end
    object qryNCFNullCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST.CODIGO_CTE'
    end
    object qryNCFNullCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VENTAS_MAST.CODIGO_VENDEDOR'
    end
    object qryNCFNullFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VENTAS_MAST.FORMA_PAGO'
    end
    object qryNCFNullOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VENTAS_MAST.OBSERVACION'
      Size = 60
    end
    object qryNCFNullVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST.VALOR_TOTAL_DET'
    end
    object qryNCFNullMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'VENTAS_MAST.MONTO_TOTAL_ITBIS'
    end
    object qryNCFNullSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENTAS_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryNCFNullNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST.NUMERO_FACTURA'
    end
    object qryNCFNullNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VENTAS_MAST.NUMERO_DOC_PAGO'
    end
    object qryNCFNullSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
    object qryNCFNullMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VENTAS_MAST.MONTO_PAGADO'
    end
    object qryNCFNullMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'VENTAS_MAST.MONTO_CAMBIO'
    end
  end
  object qryProdMasVendido: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select v.CODIGO_PROD, count(v.CODIGO_PROD) CantVentas, sum(v.CAN' +
        'TIDAD) cant, v.DESCRIPCION '
      'From ventas_Det v'
      'Where v.STATUS_DET in ('#39'A'#39','#39'R'#39')'
      'group by v.CODIGO_PROD,v.DESCRIPCION '
      'having count(v.CODIGO_PROD) between :rango1 and :rango2'
      'order by count(v.CODIGO_PROD) desc')
    Left = 648
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rango1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'rango2'
        ParamType = ptInput
      end>
    object qryProdMasVendidoCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryProdMasVendidoCANTVENTAS: TIntegerField
      FieldName = 'CANTVENTAS'
      Required = True
    end
    object qryProdMasVendidoCANT: TFloatField
      FieldName = 'CANT'
    end
    object qryProdMasVendidoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
  end
  object qryFechaUltVtaProd: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From proc_repStatisticsProd'
      'Where cantdiasnovta BETWEEN :rango1 And :rango2'
      'Order By cantdiasnovta desc')
    Left = 744
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rango1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'rango2'
        ParamType = ptInput
      end>
    object qryFechaUltVtaProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'PROC_REPSTATISTICSPROD.CODIGO'
    end
    object qryFechaUltVtaProdDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROC_REPSTATISTICSPROD.DESCRIPCION'
      Size = 80
    end
    object qryFechaUltVtaProdULTIMAFECHAVENTA: TDateTimeField
      FieldName = 'ULTIMAFECHAVENTA'
      Origin = 'PROC_REPSTATISTICSPROD.ULTIMAFECHAVENTA'
    end
    object qryFechaUltVtaProdCANTDIASNOVTA: TIntegerField
      FieldName = 'CANTDIASNOVTA'
      Origin = 'PROC_REPSTATISTICSPROD.CANTDIASNOVTA'
    end
    object qryFechaUltVtaProdCANTVECESVENDIDO: TIntegerField
      FieldName = 'CANTVECESVENDIDO'
      Origin = 'PROC_REPSTATISTICSPROD.CANTVECESVENDIDO'
    end
    object qryFechaUltVtaProdCANT_ACTUAL: TIntegerField
      FieldName = 'CANT_ACTUAL'
      Origin = 'PROC_REPSTATISTICSPROD.CANT_ACTUAL'
    end
  end
  object qryFechaUltVtaProd_0: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From proc_repStatisticsProd'
      'Where cantdiasnovta is null'
      'order by DESCRIPCION')
    Left = 920
    Top = 8
    object qryFechaUltVtaProd_0CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'PROC_REPSTATISTICSPROD.CODIGO'
    end
    object qryFechaUltVtaProd_0DESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROC_REPSTATISTICSPROD.DESCRIPCION'
      Size = 80
    end
    object qryFechaUltVtaProd_0ULTIMAFECHAVENTA: TDateTimeField
      FieldName = 'ULTIMAFECHAVENTA'
      Origin = 'PROC_REPSTATISTICSPROD.ULTIMAFECHAVENTA'
    end
    object qryFechaUltVtaProd_0CANTDIASNOVTA: TIntegerField
      FieldName = 'CANTDIASNOVTA'
      Origin = 'PROC_REPSTATISTICSPROD.CANTDIASNOVTA'
    end
    object qryFechaUltVtaProd_0CANTVECESVENDIDO: TIntegerField
      FieldName = 'CANTVECESVENDIDO'
      Origin = 'PROC_REPSTATISTICSPROD.CANTVECESVENDIDO'
    end
    object qryFechaUltVtaProd_0CANT_ACTUAL: TIntegerField
      FieldName = 'CANT_ACTUAL'
      Origin = 'PROC_REPSTATISTICSPROD.CANT_ACTUAL'
    end
  end
  object qryFechaUltVtaProd_1: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from proc_repStatisticsProd'
      'where cantdiasnovta between :rango1 and :rango2'
      'order by cantdiasnovta desc')
    Left = 920
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rango1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rango2'
        ParamType = ptUnknown
      end>
    object qryFechaUltVtaProd_1CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'PROC_REPSTATISTICSPROD.CODIGO'
    end
    object qryFechaUltVtaProd_1DESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROC_REPSTATISTICSPROD.DESCRIPCION'
      Size = 80
    end
    object qryFechaUltVtaProd_1ULTIMAFECHAVENTA: TDateTimeField
      FieldName = 'ULTIMAFECHAVENTA'
      Origin = 'PROC_REPSTATISTICSPROD.ULTIMAFECHAVENTA'
    end
    object qryFechaUltVtaProd_1CANTDIASNOVTA: TIntegerField
      FieldName = 'CANTDIASNOVTA'
      Origin = 'PROC_REPSTATISTICSPROD.CANTDIASNOVTA'
    end
    object qryFechaUltVtaProd_1CANTVECESVENDIDO: TIntegerField
      FieldName = 'CANTVECESVENDIDO'
      Origin = 'PROC_REPSTATISTICSPROD.CANTVECESVENDIDO'
    end
    object qryFechaUltVtaProd_1CANT_ACTUAL: TIntegerField
      FieldName = 'CANT_ACTUAL'
      Origin = 'PROC_REPSTATISTICSPROD.CANT_ACTUAL'
    end
  end
  object qryDetItbisFastFood: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT d.numero, d.porc_itbis,'
      'Sum(d.monto_itbis) monto_itbis, '
      'Sum(d.monto_itbisfood) monto_itbisfood'
      'From proc_getDatosItbiFfood(:numerotrn) d'
      'Inner Join TASA_ITBIS t on t.IDTASAITBIS = d.IDTASAITBIS'
      'Group by d.numero, d.porc_itbis'
      'Order by d.PORC_ITBIS desc')
    Left = 736
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerotrn'
        ParamType = ptInput
      end>
    object qryDetItbisFastFoodNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_DET.NUMERO'
      Required = True
    end
    object qryDetItbisFastFoodMONTO_ITBIS: TFloatField
      FieldName = 'MONTO_ITBIS'
    end
    object qryDetItbisFastFoodPORC_ITBIS: TFloatField
      FieldName = 'PORC_ITBIS'
    end
    object qryDetItbisFastFoodMONTO_ITBISFOOD: TFloatField
      FieldName = 'MONTO_ITBISFOOD'
    end
  end
  object qryNCFAfectado: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select n.NUMERO_NCF From NCF_ASIGNADOS n'
      'Where n.SERIE = ('
      'Select r.SERIE_NCF_ASIGNADO'
      'From VENTAS_MAST r'
      
        'INNER join TRANS_CXC_DET t on t.SERIE_NCF_ASIGNADO =:seriefcnasi' +
        'gnado'
      'And t.NUMERO_TRN_ORIGEN = r.NUMERO) ')
    Left = 400
    Top = 497
    ParamData = <
      item
        DataType = ftInteger
        Name = 'seriefcnasignado'
        ParamType = ptInput
      end>
    object qryNCFAfectadoNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Required = True
      Size = 21
    end
  end
  object tblTicket_params: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from Ticket_params'
      'where'
      '  FPAGO = :OLD_FPAGO and'
      '  NUMERO_TRN = :OLD_NUMERO_TRN')
    InsertSQL.Strings = (
      'insert into Ticket_params'
      '  (FPAGO, NUMERO_TRN, ORIGEN, PARAMETROS, STATUS, ARCHIVO)'
      'values'
      '  (:FPAGO, :NUMERO_TRN, :ORIGEN, :PARAMETROS, :STATUS, :ARCHIVO)')
    RefreshSQL.Strings = (
      'Select '
      '  FPAGO,'
      '  NUMERO_TRN,'
      '  ORIGEN,'
      '  PARAMETROS,'
      '  STATUS,'
      '  ARCHIVO'
      'from Ticket_params '
      'where'
      '  FPAGO = :FPAGO and'
      '  NUMERO_TRN = :NUMERO_TRN')
    SelectSQL.Strings = (
      'Select * from Ticket_params')
    ModifySQL.Strings = (
      'update Ticket_params'
      'set'
      '  FPAGO = :FPAGO,'
      '  NUMERO_TRN = :NUMERO_TRN,'
      '  ORIGEN = :ORIGEN,'
      '  PARAMETROS = :PARAMETROS,'
      '  STATUS = :STATUS,'
      '  ARCHIVO = :ARCHIVO'
      'where'
      '  FPAGO = :OLD_FPAGO and'
      '  NUMERO_TRN = :OLD_NUMERO_TRN')
    Left = 536
    Top = 392
    object tblTicket_paramsFPAGO: TIntegerField
      FieldName = 'FPAGO'
      Origin = 'TICKET_PARAMS.FPAGO'
      Required = True
    end
    object tblTicket_paramsNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'TICKET_PARAMS.NUMERO_TRN'
      Required = True
    end
    object tblTicket_paramsORIGEN: TIBStringField
      FieldName = 'ORIGEN'
      Origin = 'TICKET_PARAMS.ORIGEN'
      Required = True
      Size = 25
    end
    object tblTicket_paramsSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TICKET_PARAMS.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblTicket_paramsPARAMETROS: TIBStringField
      FieldName = 'PARAMETROS'
      Origin = 'TICKET_PARAMS.PARAMETROS'
      Required = True
      Size = 500
    end
    object tblTicket_paramsARCHIVO: TIBStringField
      FieldName = 'ARCHIVO'
      Origin = 'TICKET_PARAMS.ARCHIVO'
      Size = 200
    end
  end
  object QryTicket_params: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select t.* From TICKET_PARAMS t'
      'inner join VENTAS_MAST v on v.NUMERO = t.NUMERO_TRN'
      'and v.NIF_IMPRESO = 0'
      'Where t.status ='#39'A'#39
      '')
    Left = 648
    Top = 336
    object QryTicket_paramsFPAGO: TIntegerField
      FieldName = 'FPAGO'
      Origin = 'TICKET_PARAMS.FPAGO'
      Required = True
    end
    object QryTicket_paramsNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'TICKET_PARAMS.NUMERO_TRN'
      Required = True
    end
    object QryTicket_paramsSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TICKET_PARAMS.STATUS'
      FixedChar = True
      Size = 1
    end
    object QryTicket_paramsPARAMETROS: TIBStringField
      FieldName = 'PARAMETROS'
      Origin = 'TICKET_PARAMS.PARAMETROS'
      Required = True
      Size = 500
    end
    object QryTicket_paramsARCHIVO: TIBStringField
      FieldName = 'ARCHIVO'
      Origin = 'TICKET_PARAMS.ARCHIVO'
      Size = 200
    end
    object QryTicket_paramsORIGEN: TIBStringField
      FieldName = 'ORIGEN'
      Origin = 'TICKET_PARAMS.ORIGEN'
      Required = True
      Size = 25
    end
  end
  object qryLComentario: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from lcomentario'
      'where NUMERO_TRN=:numtrn'
      'and tipo_ope=:tipoope')
    Left = 416
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numtrn'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipoope'
        ParamType = ptUnknown
      end>
    object qryLComentarioID: TSmallintField
      FieldName = 'ID'
      Origin = 'LCOMENTARIO.ID'
      Required = True
    end
    object qryLComentarioNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'LCOMENTARIO.NUMERO_TRN'
      Required = True
    end
    object qryLComentarioNUMLIN: TSmallintField
      FieldName = 'NUMLIN'
      Origin = 'LCOMENTARIO.NUMLIN'
      Required = True
    end
    object qryLComentarioLINEA: TIBStringField
      FieldName = 'LINEA'
      Origin = 'LCOMENTARIO.LINEA'
      Size = 40
    end
    object qryLComentarioTIPO_OPE: TSmallintField
      FieldName = 'TIPO_OPE'
      Origin = 'LCOMENTARIO.TIPO_OPE'
    end
  end
  object qryDatos607: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Proc_repDatosNCF_Rtipo(:fechaini, :fechafin, 1)'
      'WHERE tipodoc in ('#39'FACTURA'#39','#39'CONTADO'#39')'
      'Order by  numero_trn, serie, TIPO_NCF, FECHA')
    Left = 360
    Top = 8
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryDatos607TIPODOC: TIBStringField
      FieldName = 'TIPODOC'
      Origin = 'PROC_REPDATOSNCF_RTIPO.TIPODOC'
      Size = 30
    end
    object qryDatos607CANT_COMPROBANTE: TIntegerField
      FieldName = 'CANT_COMPROBANTE'
      Origin = 'PROC_REPDATOSNCF_RTIPO.CANT_COMPROBANTE'
    end
    object qryDatos607NUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'PROC_REPDATOSNCF_RTIPO.NUMERO_TRN'
    end
    object qryDatos607FECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_REPDATOSNCF_RTIPO.FECHA'
    end
    object qryDatos607SERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'PROC_REPDATOSNCF_RTIPO.SERIE'
    end
    object qryDatos607DESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROC_REPDATOSNCF_RTIPO.DESCRIPCION'
      Size = 80
    end
    object qryDatos607IDTASAITBIS: TSmallintField
      FieldName = 'IDTASAITBIS'
      Origin = 'PROC_REPDATOSNCF_RTIPO.IDTASAITBIS'
    end
    object qryDatos607TIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'PROC_REPDATOSNCF_RTIPO.TIPO_NCF'
      Size = 2
    end
    object qryDatos607NUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'PROC_REPDATOSNCF_RTIPO.NUMERO_NCF'
      Size = 19
    end
    object qryDatos607DESCRIPCION_2018: TIBStringField
      FieldName = 'DESCRIPCION_2018'
      Origin = 'PROC_REPDATOSNCF_RTIPO.DESCRIPCION_2018'
      Size = 60
    end
    object qryDatos607NOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'PROC_REPDATOSNCF_RTIPO.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryDatos607RNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'PROC_REPDATOSNCF_RTIPO.RNC_NUMERO'
      Size = 14
    end
    object qryDatos607MONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'PROC_REPDATOSNCF_RTIPO.MONTO_BRUTO'
    end
    object qryDatos607MONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'PROC_REPDATOSNCF_RTIPO.MONTO_DESCUENTO'
    end
    object qryDatos607MONTO_EXONERADO_ITBIS: TFloatField
      FieldName = 'MONTO_EXONERADO_ITBIS'
      Origin = 'PROC_REPDATOSNCF_RTIPO.MONTO_EXONERADO_ITBIS'
    end
    object qryDatos607MONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'PROC_REPDATOSNCF_RTIPO.MONTO_TOTAL_ITBIS'
    end
    object qryDatos607ITBIS_FISCAL_DET: TFloatField
      FieldName = 'ITBIS_FISCAL_DET'
      Origin = 'PROC_REPDATOSNCF_RTIPO.ITBIS_FISCAL_DET'
    end
    object qryDatos607ITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'PROC_REPDATOSNCF_RTIPO.ITBI_DET'
    end
    object qryDatos607ITBI_18: TFloatField
      FieldName = 'ITBI_18'
      Origin = 'PROC_REPDATOSNCF_RTIPO.ITBI_18'
    end
    object qryDatos607ITBI_16: TFloatField
      FieldName = 'ITBI_16'
      Origin = 'PROC_REPDATOSNCF_RTIPO.ITBI_16'
    end
    object qryDatos607ITBI_13: TFloatField
      FieldName = 'ITBI_13'
      Origin = 'PROC_REPDATOSNCF_RTIPO.ITBI_13'
    end
    object qryDatos607ITBI_11: TFloatField
      FieldName = 'ITBI_11'
      Origin = 'PROC_REPDATOSNCF_RTIPO.ITBI_11'
    end
    object qryDatos607ITBI_8: TFloatField
      FieldName = 'ITBI_8'
      Origin = 'PROC_REPDATOSNCF_RTIPO.ITBI_8'
    end
    object qryDatos607ITBI_EXONERADO: TFloatField
      FieldName = 'ITBI_EXONERADO'
      Origin = 'PROC_REPDATOSNCF_RTIPO.ITBI_EXONERADO'
    end
    object qryDatos607VALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'PROC_REPDATOSNCF_RTIPO.VALOR_TOTAL_DET'
    end
    object qryDatos607TIPO_IDENT: TSmallintField
      FieldName = 'TIPO_IDENT'
      Origin = 'PROC_REPDATOSNCF_RTIPO.TIPO_IDENT'
    end
    object qryDatos607TIPODEINGRESO: TSmallintField
      FieldName = 'TIPODEINGRESO'
      Origin = 'PROC_REPDATOSNCF_RTIPO.TIPODEINGRESO'
    end
    object qryDatos607MONTO_PROPINA_LEGAL: TFloatField
      FieldName = 'MONTO_PROPINA_LEGAL'
      Origin = 'PROC_REPDATOSNCF_RTIPO.MONTO_PROPINA_LEGAL'
    end
    object qryDatos607MONTO_RECARGO: TFloatField
      FieldName = 'MONTO_RECARGO'
      Origin = 'PROC_REPDATOSNCF_RTIPO.MONTO_RECARGO'
    end
    object qryDatos607FORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'PROC_REPDATOSNCF_RTIPO.FORMA_PAGO'
    end
  end
  object qryTipoInv: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TIPO_INVENTARIO')
    Left = 136
    Top = 352
    object qryTipoInvCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'TIPO_INVENTARIO.CODIGO'
      Required = True
    end
    object qryTipoInvDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_INVENTARIO.DESCRIPCION'
      Size = 30
    end
  end
  object qryFPagoTicket: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select distinct d.TIPO_PAGO, r.MONTO_PAGADO, r.MONTO_CAMBIO, d.M' +
        'ONTO_PAGADO MontoPagadoDet,'
      'r.NUMERO, t.FPAGO, t.FPAGODGII, r.FORMA_PAGO, '
      'p.DESCRIPCION, t.DESCRIPCIONDGII'
      'from ventas_mast r'
      'left outer join DETALLE_PAGOS d on d.SERIE_TRN = r.NUMERO'
      'left outer join tipo_pago_Dgii t on t.fpago = d.TIPO_PAGO'
      'left outer join tipo_pago p on p.CODIGO = d.TIPO_PAGO '
      'Where r.NUMERO =:numerotrn')
    Left = 128
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerotrn'
        ParamType = ptInput
      end>
    object qryFPagoTicketTIPO_PAGO: TSmallintField
      FieldName = 'TIPO_PAGO'
      Origin = 'DETALLE_PAGOS.TIPO_PAGO'
    end
    object qryFPagoTicketMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VENTAS_MAST.MONTO_PAGADO'
    end
    object qryFPagoTicketMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'VENTAS_MAST.MONTO_CAMBIO'
    end
    object qryFPagoTicketNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryFPagoTicketFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'TIPO_PAGO_DGII.FPAGO'
    end
    object qryFPagoTicketFPAGODGII: TSmallintField
      FieldName = 'FPAGODGII'
      Origin = 'TIPO_PAGO_DGII.FPAGODGII'
    end
    object qryFPagoTicketFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VENTAS_MAST.FORMA_PAGO'
    end
    object qryFPagoTicketDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_PAGO.DESCRIPCION'
      FixedChar = True
      Size = 15
    end
    object qryFPagoTicketDESCRIPCIONDGII: TIBStringField
      FieldName = 'DESCRIPCIONDGII'
      Origin = 'TIPO_PAGO_DGII.DESCRIPCIONDGII'
      Size = 40
    end
    object qryFPagoTicketMONTOPAGADODET: TFloatField
      FieldName = 'MONTOPAGADODET'
      Origin = 'DETALLE_PAGOS.MONTO_PAGADO'
    end
  end
  object qryRepDepositos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepDepositosAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  BANCOS.DESCRIPCION AS DESC_BANCO,'
      '  DEPOSITOS_MASTER.*,'
      '  TIPO_CTA_BANCO.DESCRIPCION desc_tipo_cta'
      'FROM'
      '  DEPOSITOS_MASTER'
      
        '  INNER JOIN BANCOS ON (DEPOSITOS_MASTER.ID_BANCO = BANCOS.CODIG' +
        'O)'
      
        '  LEFT OUTER JOIN TIPO_CTA_BANCO ON (DEPOSITOS_MASTER.TIPO_CTA =' +
        ' TIPO_CTA_BANCO.CODIGO)'
      'Where fecha between :fechaini and :fechafin'
      'ORDER BY '
      '  DEPOSITOS_MASTER.ID_BANCO,'
      '  DEPOSITOS_MASTER.TIPO_CTA,'
      '  DEPOSITOS_MASTER.FECHA')
    Left = 232
    Top = 8
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryRepDepositosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'BANCOS.DESCRIPCION'
      Size = 35
    end
    object qryRepDepositosNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DEPOSITOS_MASTER.NUMERO'
      Required = True
    end
    object qryRepDepositosFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DEPOSITOS_MASTER.FECHA'
      Required = True
    end
    object qryRepDepositosID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
      Origin = 'DEPOSITOS_MASTER.ID_BANCO'
      Required = True
    end
    object qryRepDepositosMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'DEPOSITOS_MASTER.MONTO'
    end
    object qryRepDepositosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DEPOSITOS_MASTER.STATUS'
      Size = 1
    end
    object qryRepDepositosCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'DEPOSITOS_MASTER.COD_USUARIO'
    end
    object qryRepDepositosFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DEPOSITOS_MASTER.FECHA_IN'
    end
    object qryRepDepositosIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DEPOSITOS_MASTER.IN_POR'
      Size = 12
    end
    object qryRepDepositosFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'DEPOSITOS_MASTER.FECHA_UPDATE'
    end
    object qryRepDepositosTIPO_CTA: TIntegerField
      FieldName = 'TIPO_CTA'
      Origin = 'DEPOSITOS_MASTER.TIPO_CTA'
    end
    object qryRepDepositosCUENTA_BANCO: TIBStringField
      FieldName = 'CUENTA_BANCO'
      Origin = 'DEPOSITOS_MASTER.CUENTA_BANCO'
    end
    object qryRepDepositosDESC_BANCO: TIBStringField
      FieldName = 'DESC_BANCO'
      Origin = 'BANCOS.DESCRIPCION'
      Size = 35
    end
    object qryRepDepositosDESC_TIPO_CTA: TIBStringField
      FieldName = 'DESC_TIPO_CTA'
      Origin = 'TIPO_CTA_BANCO.DESCRIPCION'
      Size = 30
    end
  end
  object qryRepDepositosDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  TIPO_DEPOSITO.DESCRIPCION DESC_TIPO_DEPOSITO,'
      '  DEPOSITOS_DET.*'
      'FROM'
      '  DEPOSITOS_DET'
      
        '  INNER JOIN TIPO_DEPOSITO ON (DEPOSITOS_DET.TIPO_DEPOSITO = TIP' +
        'O_DEPOSITO.ID_DEPOSITO)'
      'Where DEPOSITOS_DET.NUMERO =:numero'
      'ORDER BY DEPOSITOS_DET.TIPO_DEPOSITO')
    Left = 232
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryRepDepositosDetDESC_TIPO_DEPOSITO: TIBStringField
      FieldName = 'DESC_TIPO_DEPOSITO'
      Origin = 'TIPO_DEPOSITO.DESCRIPCION'
      Size = 30
    end
    object qryRepDepositosDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DEPOSITOS_DET.SERIE'
      Required = True
    end
    object qryRepDepositosDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DEPOSITOS_DET.NUMERO'
      Required = True
    end
    object qryRepDepositosDetTIPO_DEPOSITO: TIntegerField
      FieldName = 'TIPO_DEPOSITO'
      Origin = 'DEPOSITOS_DET.TIPO_DEPOSITO'
    end
    object qryRepDepositosDetNUMERO_DOCUMENTO: TIBStringField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'DEPOSITOS_DET.NUMERO_DOCUMENTO'
    end
    object qryRepDepositosDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DEPOSITOS_DET.DESCRIPCION'
      Size = 60
    end
    object qryRepDepositosDetMONTO_DEPOSITO: TIntegerField
      FieldName = 'MONTO_DEPOSITO'
      Origin = 'DEPOSITOS_DET.MONTO_DEPOSITO'
    end
    object qryRepDepositosDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DEPOSITOS_DET.STATUS'
      Size = 1
    end
    object qryRepDepositosDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'DEPOSITOS_DET.COD_USUARIO'
    end
    object qryRepDepositosDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DEPOSITOS_DET.FECHA_IN'
    end
    object qryRepDepositosDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DEPOSITOS_DET.IN_POR'
      Size = 12
    end
    object qryRepDepositosDetFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'DEPOSITOS_DET.FECHA_UPDATE'
    end
  end
  object qryRepGastosVtas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT TRANS_OPERACION_MASTER.NUMERO,'
      '       TRANS_OPERACION_MASTER.COD_PROVEEDOR,'
      '       TRANS_OPERACION_MASTER.FECHA,'
      '       TRANS_OPERACION_MASTER.FPAGO,'
      '       TRANS_OPERACION_MASTER.OBSERVACION,'
      '       TRANS_OPERACION_MASTER.MONTO,'
      '       TRANS_OPERACION_MASTER.STATUS,'
      '       TRANS_OPERACION_MASTER.STATUS_CNT,'
      '       TRANS_OPERACION_MASTER.IN_POR,'
      '       TRANS_OPERACION_MASTER.FECHA_IN,'
      '       TRANS_OPERACION_MASTER.MOD_POR,'
      '       TRANS_OPERACION_MASTER.FECHA_MOD,'
      '       TRANS_OPERACION_DET.SERIE,'
      '       TRANS_OPERACION_DET.COD_SERV_PROD,'
      '       TRANS_OPERACION_DET.DEPARTAMENTO,'
      '       TRANS_OPERACION_DET.OBSERVACION,'
      '       TRANS_OPERACION_DET.CANTIDAD,'
      '       TRANS_OPERACION_DET.PRECIO,'
      '       TRANS_OPERACION_DET.VALOR,'
      '       TRANS_OPERACION_DET.monto_itbis,'
      '       TRANS_OPERACION_DET.NUMERO_DOCUMENTO,'
      '       TRANS_OPERACION_DET.NUMERO_FACTURA,'
      '       TRANS_OPERACION_DET.COD_CTA_CONCEPTO,'
      '       TRANS_OPERACION_DET.CODIGO_USUARIO,'
      '       TRANS_OPERACION_DET.STATUS,'
      '       TRANS_OPERACION_DET.IDTASAITBIS,'
      '       TASA_ITBIS.DESCRIPCION DESC_TASAITBIS,'
      '       PROVEEDORES.DESCRIPCION nombreproveedor,'
      '       CENTRO_COSTO.NOMBRE nombre_centro_costo,'
      '       DEPTOS.NOMBRE nombre_departamento,'
      '       EMPLEADO.NOMBRE||" "||  EMPLEADO.APELLIDO nombreusuario,'
      '       TRANS_OPERACION_DET.FICHA_VEH, v.ROTULO, v.PLACA'
      'FROM EMPLEADO'
      
        '   RIGHT OUTER JOIN TRANS_OPERACION_DET ON (EMPLEADO.CODIGO = TR' +
        'ANS_OPERACION_DET.CODIGO_USUARIO)'
      
        '   INNER JOIN TRANS_OPERACION_MASTER ON (TRANS_OPERACION_DET.NUM' +
        'ERO = TRANS_OPERACION_MASTER.NUMERO)'
      
        '   LEFT OUTER JOIN PROVEEDORES ON (TRANS_OPERACION_MASTER.COD_PR' +
        'OVEEDOR = PROVEEDORES.CODIGO_CTE)'
      
        '   LEFT OUTER JOIN CENTRO_COSTO ON (TRANS_OPERACION_DET.COD_CTA_' +
        'CONCEPTO = CENTRO_COSTO.CODIGO)'
      
        '   LEFT OUTER JOIN TASA_ITBIS ON (TRANS_OPERACION_DET.IDTASAITBI' +
        'S = TASA_ITBIS.IDTASAITBIS)'
      
        '   INNER JOIN DEPTOS ON (TRANS_OPERACION_DET.DEPARTAMENTO = DEPT' +
        'OS.CODIGO)'
      
        '   left outer join VEHICULO v on v.FICHA = TRANS_OPERACION_DET.F' +
        'ICHA_VEH'
      ''
      ''
      ''
      ''
      '')
    Left = 128
    Top = 512
  end
  object qryRepGastosVtas_Base: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT TRANS_OPERACION_MASTER.NUMERO,'
      '       TRANS_OPERACION_MASTER.COD_PROVEEDOR,'
      '       TRANS_OPERACION_MASTER.FECHA,'
      '       TRANS_OPERACION_MASTER.FPAGO,'
      '       TRANS_OPERACION_MASTER.OBSERVACION,'
      '       TRANS_OPERACION_MASTER.MONTO,'
      '       TRANS_OPERACION_MASTER.STATUS,'
      '       TRANS_OPERACION_MASTER.STATUS_CNT,'
      '       TRANS_OPERACION_MASTER.IN_POR,'
      '       TRANS_OPERACION_MASTER.FECHA_IN,'
      '       TRANS_OPERACION_MASTER.MOD_POR,'
      '       TRANS_OPERACION_MASTER.FECHA_MOD,'
      '       TRANS_OPERACION_DET.SERIE,'
      '       TRANS_OPERACION_DET.COD_SERV_PROD,'
      '       TRANS_OPERACION_DET.DEPARTAMENTO,'
      '       TRANS_OPERACION_DET.OBSERVACION,'
      '       TRANS_OPERACION_DET.CANTIDAD,'
      '       TRANS_OPERACION_DET.PRECIO,'
      '       TRANS_OPERACION_DET.VALOR,'
      '       TRANS_OPERACION_DET.monto_itbis,'
      '       TRANS_OPERACION_DET.NUMERO_DOCUMENTO,'
      '       TRANS_OPERACION_DET.NUMERO_FACTURA,'
      '       TRANS_OPERACION_DET.COD_CTA_CONCEPTO,'
      '       TRANS_OPERACION_DET.CODIGO_USUARIO,'
      '       TRANS_OPERACION_DET.STATUS,'
      '       TRANS_OPERACION_DET.IDTASAITBIS,'
      '       TASA_ITBIS.DESCRIPCION DESC_TASAITBIS,'
      '       PROVEEDORES.DESCRIPCION nombreproveedor,'
      '       CENTRO_COSTO.NOMBRE nombre_centro_costo,'
      '       DEPTOS.NOMBRE nombre_departamento,'
      '       EMPLEADO.NOMBRE||" "||  EMPLEADO.APELLIDO nombreusuario,'
      '       TRANS_OPERACION_DET.FICHA_VEH, v.ROTULO, v.PLACA'
      'FROM EMPLEADO'
      
        '   RIGHT OUTER JOIN TRANS_OPERACION_DET ON (EMPLEADO.CODIGO = TR' +
        'ANS_OPERACION_DET.CODIGO_USUARIO)'
      
        '   INNER JOIN TRANS_OPERACION_MASTER ON (TRANS_OPERACION_DET.NUM' +
        'ERO = TRANS_OPERACION_MASTER.NUMERO)'
      
        '   LEFT OUTER JOIN PROVEEDORES ON (TRANS_OPERACION_MASTER.COD_PR' +
        'OVEEDOR = PROVEEDORES.CODIGO_CTE)'
      
        '   LEFT OUTER JOIN CENTRO_COSTO ON (TRANS_OPERACION_DET.COD_CTA_' +
        'CONCEPTO = CENTRO_COSTO.CODIGO)'
      
        '   LEFT OUTER JOIN TASA_ITBIS ON (TRANS_OPERACION_DET.IDTASAITBI' +
        'S = TASA_ITBIS.IDTASAITBIS)'
      
        '   INNER JOIN DEPTOS ON (TRANS_OPERACION_DET.DEPARTAMENTO = DEPT' +
        'OS.CODIGO)'
      
        '   left outer join VEHICULO v on v.FICHA = TRANS_OPERACION_DET.F' +
        'ICHA_VEH'
      ''
      ''
      ''
      ''
      '')
    Left = 216
    Top = 485
  end
  object qckRepDatos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select i.CODIGO, trim(i.DESCRIPCION) DESCRIPCION, IIF(substring(' +
        'u.DESCRIPCION from 1 for 1) = '#39'U'#39','#39'U'#39', substring(u.DESCRIPCION f' +
        'rom 1 for 1) ||'#39#39'||coalesce( F_TRUNCATE(p.CANTIDAD),'#39#39')) unidad,' +
        '  '
      
        'iif(p.PRECIOVENTA1 is null, i.PRECIO,p.PRECIOVENTA1) PrecioActua' +
        'l, iif(abs(i.CANTIDAD) > 0, i.CANTIDAD / p.CANTIDAD,0) Existenci' +
        'a'
      'From INVENTARIO_PRODUCTO i'
      
        'left outer JOIN PRECIO_UNIDADSURTIDORA p ON p.COD_PRODUCTO = i.C' +
        'ODIGO'
      'left outer join UNIDADES u on u.IDUNIDAD = p.IDUNIDAD'
      'WHERE I.DESCRIPCION IS NOT NULL'
      'Order by trim(i.DESCRIPCION)'
      ' ')
    Left = 312
    Top = 224
    object qckRepDatosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qckRepDatosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 80
    end
    object qckRepDatosUNIDAD: TIBStringField
      FieldName = 'UNIDAD'
      Size = 50
    end
    object qckRepDatosPRECIOACTUAL: TFloatField
      FieldName = 'PRECIOACTUAL'
    end
    object qckRepDatosEXISTENCIA: TFloatField
      FieldName = 'EXISTENCIA'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
  end
  object qryRepAnalisisPrecio: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select DISTINCT r.CODIGO, r.DESCRIPCION, u.DESCRIPCION tipoUnida' +
        'dInv,'
      
        '(Select UNIDADES.DESCRIPCION tunidadPrecioVta from UNIDADES wher' +
        'e UNIDADES.IDUNIDAD = p.IDUNIDAD),'
      
        '(Select distinct '#39'SI'#39' as tieneVta from VENTAS_DET v where v.CODI' +
        'GO_PROD = r.CODIGO),'
      'r.PRECIO_COMPRA costo, r.PRECIO_MINIMO, r.PRECIO,'
      
        'p.CANTIDAD cant_unidad, p.PRECIOVENTA1, p.PRECIOVENTA2, p.PRECIO' +
        'VENTA3,'
      'p.PRECIOVENTA4, '
      
        'IIF(p.PRECIOVENTA1 <= R.PRECIO_COMPRA, '#39'P1 <= COSTO'#39','#39#39') VTA_VS_' +
        'COSTOP_1,'
      
        'IIF(p.PRECIOVENTA2 <= R.PRECIO_COMPRA, '#39'P2 <= COSTO'#39','#39#39') VTA_VS_' +
        'COSTOP_2,'
      
        'IIF(p.PRECIOVENTA3 <= R.PRECIO_COMPRA, '#39'P3 <= COSTO'#39','#39#39') VTA_VS_' +
        'COSTOP_3,'
      
        'IIF(p.PRECIOVENTA4 <= R.PRECIO_COMPRA, '#39'P4 <= COSTO'#39','#39#39') VTA_VS_' +
        'COSTOP_4,'
      'IIF(p.PRECIOVENTA1 < R.PRECIO, '#39'P1 < PMINIMO'#39','#39#39') EVALP_1,'
      'IIF(p.PRECIOVENTA2 < R.PRECIO, '#39'P2 < PMINIMO'#39','#39#39') EVALP_2,'
      'IIF(p.PRECIOVENTA3 < R.PRECIO, '#39'P3 < PMINIMO'#39','#39#39') EVALP_3,'
      'IIF(p.PRECIOVENTA4 < R.PRECIO, '#39'P4 < PMINIMO'#39','#39#39') EVALP_4'
      ''
      'from INVENTARIO_PRODUCTO r'
      
        'left outer join PRECIO_UNIDADSURTIDORA p on p.COD_PRODUCTO = r.C' +
        'ODIGO'
      'left outer join UNIDADES u on u.IDUNIDAD = r.TIPO_UNIDAD')
    Left = 760
    Top = 200
    object qryRepAnalisisPrecioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryRepAnalisisPrecioDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryRepAnalisisPrecioTIPOUNIDADINV: TIBStringField
      FieldName = 'TIPOUNIDADINV'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
    object qryRepAnalisisPrecioTUNIDADPRECIOVTA: TIBStringField
      FieldName = 'TUNIDADPRECIOVTA'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
    object qryRepAnalisisPrecioTIENEVTA: TIBStringField
      FieldName = 'TIENEVTA'
      FixedChar = True
      Size = 2
    end
    object qryRepAnalisisPrecioCOSTO: TFloatField
      FieldName = 'COSTO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryRepAnalisisPrecioPRECIO_MINIMO: TFloatField
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
    object qryRepAnalisisPrecioPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryRepAnalisisPrecioCANT_UNIDAD: TFloatField
      FieldName = 'CANT_UNIDAD'
      Origin = 'PRECIO_UNIDADSURTIDORA.CANTIDAD'
    end
    object qryRepAnalisisPrecioPRECIOVENTA1: TFloatField
      FieldName = 'PRECIOVENTA1'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA1'
    end
    object qryRepAnalisisPrecioPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA2'
    end
    object qryRepAnalisisPrecioPRECIOVENTA3: TFloatField
      FieldName = 'PRECIOVENTA3'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA3'
    end
    object qryRepAnalisisPrecioPRECIOVENTA4: TFloatField
      FieldName = 'PRECIOVENTA4'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA4'
    end
    object qryRepAnalisisPrecioVTA_VS_COSTOP_1: TIBStringField
      FieldName = 'VTA_VS_COSTOP_1'
      Required = True
      FixedChar = True
      Size = 11
    end
    object qryRepAnalisisPrecioVTA_VS_COSTOP_2: TIBStringField
      FieldName = 'VTA_VS_COSTOP_2'
      Required = True
      FixedChar = True
      Size = 11
    end
    object qryRepAnalisisPrecioVTA_VS_COSTOP_3: TIBStringField
      FieldName = 'VTA_VS_COSTOP_3'
      Required = True
      FixedChar = True
      Size = 11
    end
    object qryRepAnalisisPrecioVTA_VS_COSTOP_4: TIBStringField
      FieldName = 'VTA_VS_COSTOP_4'
      Required = True
      FixedChar = True
      Size = 11
    end
    object qryRepAnalisisPrecioEVALP_1: TIBStringField
      FieldName = 'EVALP_1'
      Required = True
      FixedChar = True
      Size = 12
    end
    object qryRepAnalisisPrecioEVALP_2: TIBStringField
      FieldName = 'EVALP_2'
      Required = True
      FixedChar = True
      Size = 12
    end
    object qryRepAnalisisPrecioEVALP_3: TIBStringField
      FieldName = 'EVALP_3'
      Required = True
      FixedChar = True
      Size = 12
    end
    object qryRepAnalisisPrecioEVALP_4: TIBStringField
      FieldName = 'EVALP_4'
      Required = True
      FixedChar = True
      Size = 12
    end
  end
  object qryRepListaPrecioIncons: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select DISTINCT r.CODIGO, r.DESCRIPCION, u.DESCRIPCION tipoUnida' +
        'dInv,'
      
        '(Select UNIDADES.DESCRIPCION tunidadPrecioVta from UNIDADES wher' +
        'e UNIDADES.IDUNIDAD = p.IDUNIDAD),'
      
        '(Select distinct '#39'SI'#39' as tieneVta from VENTAS_DET v where v.CODI' +
        'GO_PROD = r.CODIGO),'
      'r.PRECIO_COMPRA costo, r.PRECIO_MINIMO, r.PRECIO,'
      
        'p.CANTIDAD cant_unidad, p.PRECIOVENTA1, p.PRECIOVENTA2, p.PRECIO' +
        'VENTA3,'
      'p.PRECIOVENTA4, '
      
        'IIF(p.PRECIOVENTA1 <= R.PRECIO_COMPRA, '#39'P1 <= COSTO'#39','#39#39') VTA_VS_' +
        'COSTOP_1,'
      
        'IIF(p.PRECIOVENTA2 <= R.PRECIO_COMPRA, '#39'P2 <= COSTO'#39','#39#39') VTA_VS_' +
        'COSTOP_2,'
      
        'IIF(p.PRECIOVENTA3 <= R.PRECIO_COMPRA, '#39'P3 <= COSTO'#39','#39#39') VTA_VS_' +
        'COSTOP_3,'
      
        'IIF(p.PRECIOVENTA4 <= R.PRECIO_COMPRA, '#39'P4 <= COSTO'#39','#39#39') VTA_VS_' +
        'COSTOP_4,'
      'IIF(p.PRECIOVENTA1 < R.PRECIO, '#39'P1 < PMINIMO'#39','#39#39') EVALP_1,'
      'IIF(p.PRECIOVENTA2 < R.PRECIO, '#39'P2 < PMINIMO'#39','#39#39') EVALP_2,'
      'IIF(p.PRECIOVENTA3 < R.PRECIO, '#39'P3 < PMINIMO'#39','#39#39') EVALP_3,'
      'IIF(p.PRECIOVENTA4 < R.PRECIO, '#39'P4 < PMINIMO'#39','#39#39') EVALP_4'
      ''
      'From INVENTARIO_PRODUCTO r'
      
        'Left outer join PRECIO_UNIDADSURTIDORA p on p.COD_PRODUCTO = r.C' +
        'ODIGO'
      'Left outer join UNIDADES u on u.IDUNIDAD = r.TIPO_UNIDAD'
      'Where '
      ' (p.PRECIOVENTA1 <= R.PRECIO_COMPRA) '
      'or (p.PRECIOVENTA2 <= R.PRECIO_COMPRA) '
      'or (p.PRECIOVENTA3 <= R.PRECIO_COMPRA) '
      'or (p.PRECIOVENTA4 <= R.PRECIO_COMPRA) '
      'or (p.PRECIOVENTA1 < R.PRECIO) '
      'or (p.PRECIOVENTA2 < R.PRECIO) '
      'or (p.PRECIOVENTA3 < R.PRECIO) '
      'or (p.PRECIOVENTA4 < R.PRECIO)')
    Left = 408
    Top = 136
    object qryRepListaPrecioInconsCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryRepListaPrecioInconsDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryRepListaPrecioInconsTIPOUNIDADINV: TIBStringField
      FieldName = 'TIPOUNIDADINV'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
    object qryRepListaPrecioInconsTUNIDADPRECIOVTA: TIBStringField
      FieldName = 'TUNIDADPRECIOVTA'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
    object qryRepListaPrecioInconsTIENEVTA: TIBStringField
      FieldName = 'TIENEVTA'
      FixedChar = True
      Size = 2
    end
    object qryRepListaPrecioInconsCOSTO: TFloatField
      FieldName = 'COSTO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryRepListaPrecioInconsPRECIO_MINIMO: TFloatField
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
    object qryRepListaPrecioInconsPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryRepListaPrecioInconsCANT_UNIDAD: TFloatField
      FieldName = 'CANT_UNIDAD'
      Origin = 'PRECIO_UNIDADSURTIDORA.CANTIDAD'
    end
    object qryRepListaPrecioInconsPRECIOVENTA1: TFloatField
      FieldName = 'PRECIOVENTA1'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA1'
    end
    object qryRepListaPrecioInconsPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA2'
    end
    object qryRepListaPrecioInconsPRECIOVENTA3: TFloatField
      FieldName = 'PRECIOVENTA3'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA3'
    end
    object qryRepListaPrecioInconsPRECIOVENTA4: TFloatField
      FieldName = 'PRECIOVENTA4'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA4'
    end
    object qryRepListaPrecioInconsVTA_VS_COSTOP_1: TIBStringField
      FieldName = 'VTA_VS_COSTOP_1'
      Required = True
      FixedChar = True
      Size = 11
    end
    object qryRepListaPrecioInconsVTA_VS_COSTOP_2: TIBStringField
      FieldName = 'VTA_VS_COSTOP_2'
      Required = True
      FixedChar = True
      Size = 11
    end
    object qryRepListaPrecioInconsVTA_VS_COSTOP_3: TIBStringField
      FieldName = 'VTA_VS_COSTOP_3'
      Required = True
      FixedChar = True
      Size = 11
    end
    object qryRepListaPrecioInconsVTA_VS_COSTOP_4: TIBStringField
      FieldName = 'VTA_VS_COSTOP_4'
      Required = True
      FixedChar = True
      Size = 11
    end
    object qryRepListaPrecioInconsEVALP_1: TIBStringField
      FieldName = 'EVALP_1'
      Required = True
      FixedChar = True
      Size = 12
    end
    object qryRepListaPrecioInconsEVALP_2: TIBStringField
      FieldName = 'EVALP_2'
      Required = True
      FixedChar = True
      Size = 12
    end
    object qryRepListaPrecioInconsEVALP_3: TIBStringField
      FieldName = 'EVALP_3'
      Required = True
      FixedChar = True
      Size = 12
    end
    object qryRepListaPrecioInconsEVALP_4: TIBStringField
      FieldName = 'EVALP_4'
      Required = True
      FixedChar = True
      Size = 12
    end
  end
  object qryDatosRepClientesBase: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'iif((Select DATEDIFF( day, max(vv.FECHA), current_timestamp  ) '
      
        'from VENTAS_MAST vv where vv.CODIGO_CTE = c.codigo_cte and vv.ST' +
        'ATUS in ('#39'A'#39','#39'R'#39')) > 0,'
      '(Select DATEDIFF( day, max(vv.FECHA), current_timestamp  ) '
      
        'from VENTAS_MAST vv where vv.CODIGO_CTE = c.codigo_cte and vv.ST' +
        'ATUS in ('#39'A'#39','#39'R'#39')),'
      '0) CantDiasSinVta,'
      'c.CODZONA, s.descripcion sector,'
      '       C.CODIGO_CTE,'
      '       C.NOMBRE_FACTURAR,'
      '       T.DESCRIPCION AS DESCRIPCION_TIPOCTE,'
      '       C.NOMBRE_ABREV,'
      '       C.NOMBRE_CTE,'
      '       C.CONTACTO,'
      '       c.CALLE,'
      '       c.MANZANA,'
      '       c.EDIFICIO,'
      '       C.DIRECCION_CONT,'
      '       C.EMAIL,'
      '       C.FAX_CONTACTO,'
      '       C.FECHA_INSERTADO,'
      '       C.FECHA_MOD,'
      '       C.FORMA_PAGO,'
      '       C.FOTO,'
      '       C.LIMITE_CREDITO,'
      '       C.MONEDA_FACT,'
      '       C.PAIS,'
      '       C.STATUS_CLIENTE,'
      '       C.TELEF_CONTACTO,'
      '       C.TIPO_CLIENTE,'
      '       C.WEBSITE,       '
      '       C.CIUDAD,'
      '       C.CODIGO_AGENCIA,'
      '       C.COD_VENDEDOR,'
      '       c.DIA_RUTA,'
      '       e.NOMBRE||'#39' '#39'||e.apellido nombrevendedor,'
      
        'c.FECHA_NACIMIENTO, c.COD_CIUDAD, c.RUTA, d.DESCRIPCION DescCiud' +
        'ad, r.DESCRIPCION desc_rutavta'
      'FROM CLIENTES C'
      '   LEFT OUTER JOIN TIPO_CLIENTE T ON (C.TIPO_CLIENTE = T.CODIGO)'
      '   Left outer join CIUDAD d On d.CODIGO =c.COD_CIUDAD'
      '   left outer join RUTA_VTA r on r.CODIGO = c.RUTA '
      '   left outer JOIN EMPLEADO e on e.CODIGO = c.COD_VENDEDOR'
      '   left outer join sectores s on s.codigo = c.codzona'
      '   and s.cod_ciudad = c.cod_ciudad'
      ''
      'WHERE '
      '   ('
      '      (C.TIPO_CLIENTE = T.CODIGO) '
      '   )'
      '')
    Left = 136
    Top = 16
  end
  object qryCantVendedoresSam: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select Count(Distinct CODIGO_VENDEDOR)  CantVendedores'
      'From VENTAS_DET'
      'Where Numero=:numero')
    Left = 408
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryCantVendedoresSamCANTVENDEDORES: TIntegerField
      FieldName = 'CANTVENDEDORES'
      Required = True
    end
  end
  object qryRepComisionSAM: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select distinct r.* from PROC_COMISION_SAM_V2 (:fechaini, :fecha' +
        'fin) r')
    Left = 496
    Top = 528
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryRepComisionSAMCODCATEGORIA: TIntegerField
      FieldName = 'CODCATEGORIA'
      Origin = 'PROC_COMISION_SAM_V2.CODCATEGORIA'
    end
    object qryRepComisionSAMDESC_CATEGORIA: TIBStringField
      FieldName = 'DESC_CATEGORIA'
      Origin = 'PROC_COMISION_SAM_V2.DESC_CATEGORIA'
      Size = 40
    end
    object qryRepComisionSAMSECCION: TIBStringField
      FieldName = 'SECCION'
      Origin = 'PROC_COMISION_SAM_V2.SECCION'
      Size = 12
    end
    object qryRepComisionSAMCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'PROC_COMISION_SAM_V2.CODIGO_VENDEDOR'
    end
    object qryRepComisionSAMNOMBRE_VENDEDOR: TIBStringField
      FieldName = 'NOMBRE_VENDEDOR'
      Origin = 'PROC_COMISION_SAM_V2.NOMBRE_VENDEDOR'
      Size = 71
    end
    object qryRepComisionSAMCANTVTA: TIntegerField
      FieldName = 'CANTVTA'
      Origin = 'PROC_COMISION_SAM_V2.CANTVTA'
    end
    object qryRepComisionSAMMETACUMPLIDA: TSmallintField
      FieldName = 'METACUMPLIDA'
      Origin = 'PROC_COMISION_SAM_V2.METACUMPLIDA'
    end
    object qryRepComisionSAMCANTMETA: TIntegerField
      FieldName = 'CANTMETA'
      Origin = 'PROC_COMISION_SAM_V2.CANTMETA'
    end
    object qryRepComisionSAMPORC_COMISION: TFloatField
      FieldName = 'PORC_COMISION'
      Origin = 'PROC_COMISION_SAM_V2.PORC_COMISION'
    end
    object qryRepComisionSAMPORC_COM_EXTRA: TFloatField
      FieldName = 'PORC_COM_EXTRA'
      Origin = 'PROC_COMISION_SAM_V2.PORC_COM_EXTRA'
    end
    object qryRepComisionSAMMONTO_VENTA: TFloatField
      FieldName = 'MONTO_VENTA'
      Origin = 'PROC_COMISION_SAM_V2.MONTO_VENTA'
    end
    object qryRepComisionSAMMONTO_COMISION: TFloatField
      FieldName = 'MONTO_COMISION'
      Origin = 'PROC_COMISION_SAM_V2.MONTO_COMISION'
    end
  end
  object qryRepComisionSAM_Base: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select distinct r.* from PROC_COMISION_SAM_V2 (:fechaini, :fecha' +
        'fin) r')
    Left = 336
    Top = 544
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'fechaini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fechafin'
        ParamType = ptUnknown
      end>
  end
  object qryRepDatosPoliza: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  m.DESCRIPCION DescMarcaVeh, d.* '
      'From DatosVehiculo d'
      'inner join MARCA_VEHICULO m on m.IDMARCA = d.IDMARCA'
      'where d.codigo_cte=:codigocte'
      'and d.numpol=:numpol')
    Left = 600
    Top = 536
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigocte'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'numpol'
        ParamType = ptInput
      end>
    object qryRepDatosPolizaDESCMARCAVEH: TIBStringField
      FieldName = 'DESCMARCAVEH'
      Origin = 'MARCA_VEHICULO.DESCRIPCION'
    end
    object qryRepDatosPolizaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DATOSVEHICULO.NUMERO'
      Required = True
    end
    object qryRepDatosPolizaCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'DATOSVEHICULO.CODIGO_CTE'
      Required = True
    end
    object qryRepDatosPolizaTIPO_AFILIADO: TSmallintField
      FieldName = 'TIPO_AFILIADO'
      Origin = 'DATOSVEHICULO.TIPO_AFILIADO'
      Required = True
    end
    object qryRepDatosPolizaPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'DATOSVEHICULO.PLACA'
      Size = 12
    end
    object qryRepDatosPolizaIDMARCA: TIntegerField
      FieldName = 'IDMARCA'
      Origin = 'DATOSVEHICULO.IDMARCA'
    end
    object qryRepDatosPolizaMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'DATOSVEHICULO.MODELO'
    end
    object qryRepDatosPolizaANO_VEH: TIntegerField
      FieldName = 'ANO_VEH'
      Origin = 'DATOSVEHICULO.ANO_VEH'
    end
    object qryRepDatosPolizaFECHA_VENCE_SEGURO: TDateTimeField
      FieldName = 'FECHA_VENCE_SEGURO'
      Origin = 'DATOSVEHICULO.FECHA_VENCE_SEGURO'
    end
    object qryRepDatosPolizaTIPO_SEGURO: TSmallintField
      FieldName = 'TIPO_SEGURO'
      Origin = 'DATOSVEHICULO.TIPO_SEGURO'
    end
    object qryRepDatosPolizaCIA_SEGURO: TIBStringField
      FieldName = 'CIA_SEGURO'
      Origin = 'DATOSVEHICULO.CIA_SEGURO'
      Size = 50
    end
    object qryRepDatosPolizaEMPRESA_LABORA: TIBStringField
      FieldName = 'EMPRESA_LABORA'
      Origin = 'DATOSVEHICULO.EMPRESA_LABORA'
      Size = 80
    end
    object qryRepDatosPolizaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DATOSVEHICULO.FECHA_IN'
    end
    object qryRepDatosPolizaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DATOSVEHICULO.IN_POR'
      Size = 12
    end
    object qryRepDatosPolizaCODIGO_DEALER: TIntegerField
      FieldName = 'CODIGO_DEALER'
      Origin = 'DATOSVEHICULO.CODIGO_DEALER'
    end
    object qryRepDatosPolizaCODIGO_AGENCIA: TIntegerField
      FieldName = 'CODIGO_AGENCIA'
      Origin = 'DATOSVEHICULO.CODIGO_AGENCIA'
    end
    object qryRepDatosPolizaCOLOR: TIBStringField
      FieldName = 'COLOR'
      Origin = 'DATOSVEHICULO.COLOR'
    end
    object qryRepDatosPolizaNUM_CERTIFICADO: TIntegerField
      FieldName = 'NUM_CERTIFICADO'
      Origin = 'DATOSVEHICULO.NUM_CERTIFICADO'
    end
    object qryRepDatosPolizaCHASSIS: TIBStringField
      FieldName = 'CHASSIS'
      Origin = 'DATOSVEHICULO.CHASSIS'
    end
    object qryRepDatosPolizaNUMPOL: TIntegerField
      FieldName = 'NUMPOL'
      Origin = 'DATOSVEHICULO.NUMPOL'
    end
    object qryRepDatosPolizaSTATUSCXC: TIBStringField
      FieldName = 'STATUSCXC'
      Origin = 'DATOSVEHICULO.STATUSCXC'
      FixedChar = True
      Size = 1
    end
  end
  object qryRepEquipos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select distinct  r.numero, i.CODIGO codigo_prod, i.DESCRIPCION, ' +
        'i.cantidad,'
      's.STATUS_EQUIPO,r.codigo_tecnico,'
      'e.nombre||'#39' '#39'||e.apellido nombreTecnico, '
      'iif(s.STATUS_EQUIPO = 1, '#39'DISPONIBLE'#39','
      'iif(s.STATUS_EQUIPO = 2, '#39'ASIGNADO'#39','
      'iif(s.STATUS_EQUIPO = 3, '#39'RMA'#39','#39'OTRO'#39'))) DescEstatus'
      ',i.FECHA Fecha_entrada, '
      
        'i.FECHA_ULTIMA_TRN, s.SERIE serie_equipo, c.CODIGO_CTE, c.NOMBRE' +
        '_FACTURAR nombrecliente, c.TELEF_CONTACTO, c.DIRECCION_CONT'
      
        ',r.FECHA fechasalidarma, r.FECHA_ENTRADA fechaentradarma, r.FECH' +
        'A_ENT_ESTIMADA fechaestimadarma'
      'From INVENTARIO_PRODUCTO i'
      'left outer join EQUIPO_DET d on d.COD_PRODUCTO = i.CODIGO'
      'left outer join EQUIPO_MASTER r on r.NUMERO = d.NUMERO'
      'inner join INVENTARIO_SERIE s on s.CODIGO = i.CODIGO'
      'left outer join CLIENTES c on c.CODIGO_CTE = s.CODIGO_CTE'
      'left outer join empleado e on e.codigo = r.codigo_tecnico')
    Left = 672
    Top = 544
    object qryRepEquiposNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'EQUIPO_MASTER.NUMERO'
    end
    object qryRepEquiposCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryRepEquiposDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryRepEquiposCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryRepEquiposSTATUS_EQUIPO: TSmallintField
      FieldName = 'STATUS_EQUIPO'
      Origin = 'INVENTARIO_SERIE.STATUS_EQUIPO'
    end
    object qryRepEquiposDESCESTATUS: TIBStringField
      FieldName = 'DESCESTATUS'
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryRepEquiposFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'INVENTARIO_PRODUCTO.FECHA'
    end
    object qryRepEquiposFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN'
    end
    object qryRepEquiposSERIE_EQUIPO: TIBStringField
      FieldName = 'SERIE_EQUIPO'
      Origin = 'INVENTARIO_SERIE.SERIE'
      Required = True
      Size = 50
    end
    object qryRepEquiposCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
    end
    object qryRepEquiposNOMBRECLIENTE: TIBStringField
      FieldName = 'NOMBRECLIENTE'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryRepEquiposTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryRepEquiposDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryRepEquiposFECHASALIDARMA: TDateTimeField
      FieldName = 'FECHASALIDARMA'
      Origin = 'EQUIPO_MASTER.FECHA'
    end
    object qryRepEquiposFECHAENTRADARMA: TDateTimeField
      FieldName = 'FECHAENTRADARMA'
      Origin = 'EQUIPO_MASTER.FECHA_ENTRADA'
    end
    object qryRepEquiposFECHAESTIMADARMA: TDateTimeField
      FieldName = 'FECHAESTIMADARMA'
      Origin = 'EQUIPO_MASTER.FECHA_ENT_ESTIMADA'
    end
    object qryRepEquiposCODIGO_TECNICO: TIntegerField
      FieldName = 'CODIGO_TECNICO'
      Origin = 'EQUIPO_MASTER.CODIGO_TECNICO'
    end
    object qryRepEquiposNOMBRETECNICO: TIBStringField
      FieldName = 'NOMBRETECNICO'
      Size = 71
    end
  end
  object qryReporteOrdenesComp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '
      'dto.CANTIDAD CantOrden,'
      'coalesce(l.codigo,0) codigo_empleado,'
      '(Select  ee.Nombre||'#39' '#39'||ee.Apellido '
      
        'From  EMPLEADO ee Where ee.CODIGO = o.COD_USUARIO_RECIBE) OrdenR' +
        'ecibidaPor,'
      '(Select  ee.Nombre||'#39' '#39'||ee.Apellido '
      
        'From  EMPLEADO ee Where ee.CODIGO = o.cod_usuario_crea) OrdenCre' +
        'adaPor,'
      ''
      'u.DESCRIPCION desctipounidad,'
      
        't.DESCRIPCION formadepago,  p.DESCRIPCION descproveedor, p.email' +
        ', p.telefono, p.movil1, m.*, o.*'
      ''
      'from ORDEN_COMP_MAST m '
      'inner join ORDEN_COMP_DET o on m.NUMERO = o.NUMERO'
      'left outer join PROVEEDORES p on p.CODIGO_CTE = m.CODIGO_PROVEE'
      'left outer join TIPO_PAGO t on t.CODIGO = m.FPAGO'
      'left outer join UNIDADES u on u.IDUNIDAD = o.IDUNIDAD'
      
        'left outer join EMPLEADO l on (l.codigo = o.cod_usuario_crea) or' +
        ' (l.codigo = cod_usuario_recibe)'
      
        'left outer join ORDEN_COMP_DET_ORIGINAL dto on dto.serie = o.ser' +
        'ie')
    Left = 208
    Top = 536
    object qryReporteOrdenesCompORDENRECIBIDAPOR: TIBStringField
      FieldName = 'ORDENRECIBIDAPOR'
      Size = 71
    end
    object qryReporteOrdenesCompORDENCREADAPOR: TIBStringField
      FieldName = 'ORDENCREADAPOR'
      Size = 71
    end
    object qryReporteOrdenesCompDESCTIPOUNIDAD: TIBStringField
      FieldName = 'DESCTIPOUNIDAD'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
    object qryReporteOrdenesCompFORMADEPAGO: TIBStringField
      FieldName = 'FORMADEPAGO'
      Origin = 'TIPO_PAGO.DESCRIPCION'
      FixedChar = True
      Size = 15
    end
    object qryReporteOrdenesCompDESCPROVEEDOR: TIBStringField
      FieldName = 'DESCPROVEEDOR'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object qryReporteOrdenesCompEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'PROVEEDORES.EMAIL'
      Size = 40
    end
    object qryReporteOrdenesCompTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object qryReporteOrdenesCompMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'PROVEEDORES.MOVIL1'
    end
    object qryReporteOrdenesCompNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'ORDEN_COMP_MAST.NUMERO'
      Required = True
    end
    object qryReporteOrdenesCompCODIGO_PROVEE: TIntegerField
      FieldName = 'CODIGO_PROVEE'
      Origin = 'ORDEN_COMP_MAST.CODIGO_PROVEE'
      Required = True
    end
    object qryReporteOrdenesCompFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ORDEN_COMP_MAST.FECHA'
      Required = True
    end
    object qryReporteOrdenesCompFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'ORDEN_COMP_MAST.FPAGO'
    end
    object qryReporteOrdenesCompCOD_CAJA_CHICA: TIntegerField
      FieldName = 'COD_CAJA_CHICA'
      Origin = 'ORDEN_COMP_MAST.COD_CAJA_CHICA'
    end
    object qryReporteOrdenesCompCODIGO_BANCO: TIntegerField
      FieldName = 'CODIGO_BANCO'
      Origin = 'ORDEN_COMP_MAST.CODIGO_BANCO'
    end
    object qryReporteOrdenesCompCUENTABANCO: TIBStringField
      FieldName = 'CUENTABANCO'
      Origin = 'ORDEN_COMP_MAST.CUENTABANCO'
    end
    object qryReporteOrdenesCompOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'ORDEN_COMP_MAST.OBSERVACION'
      Size = 40
    end
    object qryReporteOrdenesCompMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'ORDEN_COMP_MAST.MONTO'
    end
    object qryReporteOrdenesCompSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ORDEN_COMP_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryReporteOrdenesCompIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ORDEN_COMP_MAST.IN_POR'
      Size = 12
    end
    object qryReporteOrdenesCompFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ORDEN_COMP_MAST.FECHA_IN'
    end
    object qryReporteOrdenesCompMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'ORDEN_COMP_MAST.MOD_POR'
      Size = 12
    end
    object qryReporteOrdenesCompFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'ORDEN_COMP_MAST.FECHA_MOD'
    end
    object qryReporteOrdenesCompTIPO_INV: TSmallintField
      FieldName = 'TIPO_INV'
      Origin = 'ORDEN_COMP_MAST.TIPO_INV'
    end
    object qryReporteOrdenesCompSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'ORDEN_COMP_MAST.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryReporteOrdenesCompNUM_ORDEN: TIntegerField
      FieldName = 'NUM_ORDEN'
      Origin = 'ORDEN_COMP_MAST.NUM_ORDEN'
    end
    object qryReporteOrdenesCompSTATUS_ORD: TIBStringField
      FieldName = 'STATUS_ORD'
      Origin = 'ORDEN_COMP_MAST.STATUS_ORD'
      FixedChar = True
      Size = 1
    end
    object qryReporteOrdenesCompAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'ORDEN_COMP_MAST.AREA_ORDEN'
    end
    object qryReporteOrdenesCompCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'ORDEN_COMP_MAST.CIA_KEY'
    end
    object qryReporteOrdenesCompNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'ORDEN_COMP_MAST.NUMERO_NCF'
      Size = 21
    end
    object qryReporteOrdenesCompCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'ORDEN_COMP_MAST.CODIGO_VENDEDOR'
    end
    object qryReporteOrdenesCompSERIE_TIPOTRNCNT: TIntegerField
      FieldName = 'SERIE_TIPOTRNCNT'
      Origin = 'ORDEN_COMP_MAST.SERIE_TIPOTRNCNT'
    end
    object qryReporteOrdenesCompTASA_ITBIS: TFloatField
      FieldName = 'TASA_ITBIS'
      Origin = 'ORDEN_COMP_MAST.TASA_ITBIS'
    end
    object qryReporteOrdenesCompTASA_ISR: TFloatField
      FieldName = 'TASA_ISR'
      Origin = 'ORDEN_COMP_MAST.TASA_ISR'
    end
    object qryReporteOrdenesCompMONTO_RETENER_ISR: TFloatField
      FieldName = 'MONTO_RETENER_ISR'
      Origin = 'ORDEN_COMP_MAST.MONTO_RETENER_ISR'
    end
    object qryReporteOrdenesCompMONTO_RETENER_ITBIS: TFloatField
      FieldName = 'MONTO_RETENER_ITBIS'
      Origin = 'ORDEN_COMP_MAST.MONTO_RETENER_ITBIS'
    end
    object qryReporteOrdenesCompIDTIPO_COMPRA: TIntegerField
      FieldName = 'IDTIPO_COMPRA'
      Origin = 'ORDEN_COMP_MAST.IDTIPO_COMPRA'
    end
    object qryReporteOrdenesCompSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'ORDEN_COMP_DET.SERIE'
      Required = True
    end
    object qryReporteOrdenesCompCOD_SERV_PROD: TIntegerField
      FieldName = 'COD_SERV_PROD'
      Origin = 'ORDEN_COMP_DET.COD_SERV_PROD'
    end
    object qryReporteOrdenesCompDEPARTAMENTO: TIntegerField
      FieldName = 'DEPARTAMENTO'
      Origin = 'ORDEN_COMP_DET.DEPARTAMENTO'
    end
    object qryReporteOrdenesCompOBSERVACION1: TIBStringField
      FieldName = 'OBSERVACION1'
      Origin = 'ORDEN_COMP_DET.OBSERVACION'
      Size = 80
    end
    object qryReporteOrdenesCompCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'ORDEN_COMP_DET.CANTIDAD'
    end
    object qryReporteOrdenesCompVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'ORDEN_COMP_DET.VALOR'
    end
    object qryReporteOrdenesCompNUMERO_DOCUMENTO: TIntegerField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'ORDEN_COMP_DET.NUMERO_DOCUMENTO'
    end
    object qryReporteOrdenesCompNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'ORDEN_COMP_DET.NUMERO_FACTURA'
    end
    object qryReporteOrdenesCompCOD_CTA_CONCEPTO: TIntegerField
      FieldName = 'COD_CTA_CONCEPTO'
      Origin = 'ORDEN_COMP_DET.COD_CTA_CONCEPTO'
    end
    object qryReporteOrdenesCompTIPOSERVICIO: TIntegerField
      FieldName = 'TIPOSERVICIO'
      Origin = 'ORDEN_COMP_DET.TIPOSERVICIO'
    end
    object qryReporteOrdenesCompSUBTIPOSERV: TIntegerField
      FieldName = 'SUBTIPOSERV'
      Origin = 'ORDEN_COMP_DET.SUBTIPOSERV'
    end
    object qryReporteOrdenesCompNO_SERIE_RES: TIntegerField
      FieldName = 'NO_SERIE_RES'
      Origin = 'ORDEN_COMP_DET.NO_SERIE_RES'
    end
    object qryReporteOrdenesCompCODIGO_CONDUCTOR: TIntegerField
      FieldName = 'CODIGO_CONDUCTOR'
      Origin = 'ORDEN_COMP_DET.CODIGO_CONDUCTOR'
    end
    object qryReporteOrdenesCompSERIE_CDC: TIntegerField
      FieldName = 'SERIE_CDC'
      Origin = 'ORDEN_COMP_DET.SERIE_CDC'
    end
    object qryReporteOrdenesCompCODIGO_SERVCOSTO: TIntegerField
      FieldName = 'CODIGO_SERVCOSTO'
      Origin = 'ORDEN_COMP_DET.CODIGO_SERVCOSTO'
    end
    object qryReporteOrdenesCompNUMEROOLD: TIntegerField
      FieldName = 'NUMEROOLD'
      Origin = 'ORDEN_COMP_DET.NUMEROOLD'
    end
    object qryReporteOrdenesCompPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'ORDEN_COMP_DET.PRECIO'
    end
    object qryReporteOrdenesCompITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'ORDEN_COMP_DET.ITBI_DET'
    end
    object qryReporteOrdenesCompPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'ORDEN_COMP_DET.PORC_DESC_DET'
    end
    object qryReporteOrdenesCompMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'ORDEN_COMP_DET.MONTO_DESCUENTO'
    end
    object qryReporteOrdenesCompCANT_OFERTA: TIntegerField
      FieldName = 'CANT_OFERTA'
      Origin = 'ORDEN_COMP_DET.CANT_OFERTA'
    end
    object qryReporteOrdenesCompIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'ORDEN_COMP_DET.IDUNIDAD'
    end
    object qryReporteOrdenesCompCOD_USUARIO_RECIBE: TIntegerField
      FieldName = 'COD_USUARIO_RECIBE'
      Origin = 'ORDEN_COMP_DET.COD_USUARIO_RECIBE'
    end
    object qryReporteOrdenesCompCOD_USUARIO_CREA: TIntegerField
      FieldName = 'COD_USUARIO_CREA'
      Origin = 'ORDEN_COMP_DET.COD_USUARIO_CREA'
    end
    object qryReporteOrdenesCompCODIGO_EMPLEADO: TIntegerField
      FieldName = 'CODIGO_EMPLEADO'
      Origin = 'EMPLEADO.CODIGO'
    end
    object qryReporteOrdenesCompFECHA_RECIBIDA: TDateTimeField
      FieldName = 'FECHA_RECIBIDA'
      Origin = 'ORDEN_COMP_MAST.FECHA_RECIBIDA'
    end
    object qryReporteOrdenesCompCANTORDEN: TFloatField
      FieldName = 'CANTORDEN'
      Origin = 'ORDEN_COMP_DET_ORIGINAL.CANTIDAD'
    end
  end
  object qryReporteOrdenesComp_base: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '
      'dto.CANTIDAD CantOrden,'
      'coalesce(l.codigo,0) codigo_empleado,'
      '(Select  ee.Nombre||'#39' '#39'||ee.Apellido '
      
        'From  EMPLEADO ee Where ee.CODIGO = o.COD_USUARIO_RECIBE) OrdenR' +
        'ecibidaPor,'
      '(Select  ee.Nombre||'#39' '#39'||ee.Apellido '
      
        'From  EMPLEADO ee Where ee.CODIGO = o.cod_usuario_crea) OrdenCre' +
        'adaPor,'
      ''
      'u.DESCRIPCION desctipounidad,'
      
        't.DESCRIPCION formadepago,  p.DESCRIPCION descproveedor, p.email' +
        ', p.telefono, p.movil1, m.*, o.*'
      ''
      'from ORDEN_COMP_MAST m '
      'inner join ORDEN_COMP_DET o on m.NUMERO = o.NUMERO'
      'left outer join PROVEEDORES p on p.CODIGO_CTE = m.CODIGO_PROVEE'
      'left outer join TIPO_PAGO t on t.CODIGO = m.FPAGO'
      'left outer join UNIDADES u on u.IDUNIDAD = o.IDUNIDAD'
      
        'left outer join EMPLEADO l on (l.codigo = o.cod_usuario_crea) or' +
        ' (l.codigo = cod_usuario_recibe)'
      
        'left outer join ORDEN_COMP_DET_ORIGINAL dto on dto.serie = o.ser' +
        'ie')
    Left = 64
    Top = 544
  end
end
