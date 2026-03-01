object dmReportes: TdmReportes
  OldCreateOrder = False
  Left = 519
  Top = 111
  Height = 570
  Width = 451
  object qryDatosRepClientes: TIBQuery
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
      '       C.CODIGO_AGENCIA'
      'FROM CLIENTES C'
      '   LEFT OUTER JOIN TIPO_CLIENTE T ON (C.TIPO_CLIENTE = T.CODIGO)'
      'WHERE '
      '   ('
      '      (C.TIPO_CLIENTE = T.CODIGO)'
      '   )'
      'ORDER BY c.tipo_cliente, C.NOMBRE_FACTURAR, c.codigo_cte')
    Left = 64
    Top = 8
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
    Left = 64
    Top = 64
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
      'From Proc_datos_venta_diaria(:Fechaini, :Fechafin)'
      
        'ORDER BY CODIGO_EMPLEADO, tipo_doc, tipo_tranf, FECHA, NUMERO_DO' +
        'CUMENTO, CODIGO_CLIENTE')
    OnFilterRecord = qryDatosRepVentaDiariaFilterRecord
    Left = 64
    Top = 120
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Fechaini'
        ParamType = ptInput
        Value = '2008-02-19'
      end
      item
        DataType = ftDateTime
        Name = 'Fechafin'
        ParamType = ptInput
        Value = '2008-02-19'
      end>
    object qryDatosRepVentaDiariaCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'PROC_DATOS_VENTA.CODIGO_CLIENTE'
    end
    object qryDatosRepVentaDiariaNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'PROC_DATOS_VENTA.NOMBRE_FACTURAR'
      Size = 40
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
    object qryDatosRepVentaDiariaNOMBRE_VENDEDOR: TIBStringField
      FieldName = 'NOMBRE_VENDEDOR'
      Origin = 'PROC_DATOS_VENTA.NOMBRE_VENDEDOR'
      Size = 35
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
      FieldName = 'DESCRIPCION_PRODUCTO'
      Origin = 'PROC_DATOS_VENTA_DIARIA.DESCRIPCION_PRODUCTO'
      Size = 60
    end
    object qryDatosRepVentaDiariaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PROC_DATOS_VENTA_DIARIA.CANTIDAD'
    end
    object qryDatosRepVentaDiariaDESC_PRODUCTO: TIBStringField
      FieldName = 'DESC_PRODUCTO'
      Origin = 'PROC_DATOS_VENTA_DIARIA.DESC_PRODUCTO'
      Size = 40
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
  end
  object qryDatosRepVentaMesxDia: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM PROC_DATOS_VENTA_DIA_MES (:FECHAINI,:FECHAFIN)')
    Left = 184
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
    Left = 192
    Top = 152
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
    Left = 64
    Top = 176
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
    Left = 192
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
    Left = 192
    Top = 264
  end
  object qryRepInventarioProdMasBclRuta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from proc_datos_rep_inventario')
    Left = 192
    Top = 320
    object qryRepInventarioProdMasBclRutaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROC_DATOS_REP_INVENTARIO.DESCRIPCION'
      Size = 40
    end
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
      '       TRANS_OPERACION_DET.NUMERO_DOCUMENTO,'
      '       TRANS_OPERACION_DET.NUMERO_FACTURA,'
      '       TRANS_OPERACION_DET.COD_CTA_CONCEPTO,'
      '       TRANS_OPERACION_DET.CODIGO_USUARIO,'
      '       TRANS_OPERACION_DET.STATUS,'
      '       PROVEEDORES.DESCRIPCION nombreproveedor,'
      '       CENTRO_COSTO.NOMBRE nombre_centro_costo,'
      '       DEPTOS.NOMBRE nombre_departamento,'
      '       EMPLEADO.NOMBRE||" "||  EMPLEADO.APELLIDO nombreusuario'
      'FROM EMPLEADO'
      
        '   RIGHT OUTER JOIN TRANS_OPERACION_DET ON (EMPLEADO.CODIGO = TR' +
        'ANS_OPERACION_DET.CODIGO_USUARIO)'
      
        '   INNER JOIN TRANS_OPERACION_MASTER ON (TRANS_OPERACION_DET.NUM' +
        'ERO = TRANS_OPERACION_MASTER.NUMERO)'
      
        '   LEFT OUTER JOIN PROVEEDORES ON (TRANS_OPERACION_MASTER.COD_PR' +
        'OVEEDOR = PROVEEDORES.CODIGO_CTE)'
      
        '   LEFT OUTER JOIN CENTRO_COSTO ON (TRANS_OPERACION_DET.COD_CTA_' +
        'CONCEPTO = CENTRO_COSTO.CODIGO)'
      
        '   INNER JOIN DEPTOS ON (TRANS_OPERACION_DET.DEPARTAMENTO = DEPT' +
        'OS.CODIGO)'
      
        'where TRANS_OPERACION_MASTER.fecha between :fechaini and :fechaf' +
        'in'
      'order by         '
      'TRANS_OPERACION_DET.CODIGO_USUARIO ,'
      'TRANS_OPERACION_MASTER.FECHA'
      ''
      ''
      '')
    Left = 189
    Top = 376
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
      '       FINANCIAMIENTO.FECHA'
      'FROM FINANCIAMIENTO'
      
        '   INNER JOIN CLIENTES ON (FINANCIAMIENTO.CODIGO_CTE = CLIENTES.' +
        'CODIGO_CTE)'
      'Where FINANCIAMIENTO.CODIGO_CTE =:codigoCte'
      'and        FINANCIAMIENTO.NUM_FACTURA =:numfactura')
    Left = 344
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigoCte'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numfactura'
        ParamType = ptUnknown
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
  end
  object qryRepIngresos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM PROC_REPORTE_INGRESOS'
      'WHERE FECHA BETWEEN :FECHAINI AND :FECHAFIN')
    Left = 64
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
      '    CLIENTES.NOMBRE_CTE, CLIENTES.RNC_NUMERO'
      ''
      'FROM CLIENTES'
      
        '   INNER JOIN FACTURAS ON (CLIENTES.CODIGO_CTE = FACTURAS.CODIGO' +
        '_CTE)'
      
        '   INNER JOIN FACTURAS_PENDIENTES ON (FACTURAS.NUMERO = FACTURAS' +
        '_PENDIENTES.NUMERO_FACT)'
      'WHERE '
      '   ('
      '      (FACTURAS_PENDIENTES.MONTO_PENDIENTE > 0)'
      '   )'
      'ORDER BY FACTURAS.CODIGO_CTE')
    Left = 344
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
  end
  object rxSaldoAntCxc: TRxMemoryData
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftInteger
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
    Left = 344
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
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '    CLIENTES.TELEF_CONTACTO TELEFONO,'
      '    CLIENTES.DIRECCION_CONT,'
      '    CLIENTES.CIUDAD,'
      '    F_AGEINDAYS(FACTURAS.FECHA, "Today") AS diasEnAtraso,'
      '    F_AGEINDAYS(FACTURAS.FECHA, "Today")/30 AS CantMeses,'
      '    FACTURAS.NUMERO,'
      '    FACTURAS.FECHA,'
      '    FACTURAS.CODIGO_CTE,'
      '    FACTURAS_PENDIENTES.MONTO_PENDIENTE,'
      '    FACTURAS.STATUS,'
      '    CLIENTES.NOMBRE_CTE, CLIENTES.RNC_NUMERO'
      ''
      'FROM CLIENTES'
      
        '   INNER JOIN FACTURAS ON (CLIENTES.CODIGO_CTE = FACTURAS.CODIGO' +
        '_CTE)'
      
        '   INNER JOIN FACTURAS_PENDIENTES ON (FACTURAS.NUMERO = FACTURAS' +
        '_PENDIENTES.NUMERO_FACT)'
      'WHERE '
      '   ('
      '      (FACTURAS_PENDIENTES.MONTO_PENDIENTE > 0)'
      '       And codigo_cte =:CODIGOCTE'
      '       And FACTURAS.FECHA between :fechaini and :fechafin'
      '   )'
      'ORDER BY FACTURAS.FECHA, '
      '    FACTURAS.NUMERO')
    Left = 344
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGOCTE'
        ParamType = ptUnknown
      end
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
    object qryRelacionFacturasTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryRelacionFacturasDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryRelacionFacturasCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryRelacionFacturasDIASENATRASO: TIntegerField
      FieldName = 'DIASENATRASO'
      Required = True
    end
    object qryRelacionFacturasCANTMESES: TFloatField
      FieldName = 'CANTMESES'
      Required = True
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
    end
    object qryRelacionFacturasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FACTURAS.STATUS'
      FixedChar = True
      Size = 1
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
  end
  object qryRepInventarioProdMasBclDiv: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From PROC_DATOS_REP_INV_id(:divisioninv)')
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
      Size = 40
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
    Left = 272
    Top = 16
    object qryDivInventarioINVENTARIO_ID: TIntegerField
      FieldName = 'INVENTARIO_ID'
      Origin = 'DIVISION_INVENTARIO.INVENTARIO_ID'
      Required = True
    end
    object qryDivInventarioDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DIVISION_INVENTARIO.DESCRIPCION'
      Size = 30
    end
    object qryDivInventarioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DIVISION_INVENTARIO.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object IBQuery1: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 264
    Top = 376
  end
end
