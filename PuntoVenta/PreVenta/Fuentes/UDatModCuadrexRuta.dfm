object dmCuadrexRuta: TdmCuadrexRuta
  OldCreateOrder = False
  Left = 425
  Top = 170
  Height = 411
  Width = 552
  object tblBalanceDespacho: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from BALANCE_DESPACHO'
      'where'
      '  CODIGO_EMP = :OLD_CODIGO_EMP and'
      '  CODIGO_RUTA = :OLD_CODIGO_RUTA and'
      '  CODIGO_PRODUCTO = :OLD_CODIGO_PRODUCTO')
    InsertSQL.Strings = (
      'insert into BALANCE_DESPACHO'
      
        '  (CODIGO_EMP, CODIGO_RUTA, CODIGO_PRODUCTO, BALANCE_ACT, BALANC' +
        'E_ANT, '
      
        '   DEBITO_MES, CREDITO_MES, DEBITO_ACM, CREDITO_ACM, FECHA_BCE, ' +
        'FECHA_ULT_PAGO, '
      '   STATUS_BCE, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR)'
      'values'
      
        '  (:CODIGO_EMP, :CODIGO_RUTA, :CODIGO_PRODUCTO, :BALANCE_ACT, :B' +
        'ALANCE_ANT, '
      
        '   :DEBITO_MES, :CREDITO_MES, :DEBITO_ACM, :CREDITO_ACM, :FECHA_' +
        'BCE, :FECHA_ULT_PAGO, '
      '   :STATUS_BCE, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_EMP,'
      '  CODIGO_RUTA,'
      '  CODIGO_PRODUCTO,'
      '  BALANCE_ACT,'
      '  BALANCE_ANT,'
      '  DEBITO_MES,'
      '  CREDITO_MES,'
      '  DEBITO_ACM,'
      '  CREDITO_ACM,'
      '  FECHA_BCE,'
      '  FECHA_ULT_PAGO,'
      '  STATUS_BCE,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from BALANCE_DESPACHO '
      'where'
      '  CODIGO_EMP = :CODIGO_EMP and'
      '  CODIGO_RUTA = :CODIGO_RUTA and'
      '  CODIGO_PRODUCTO = :CODIGO_PRODUCTO')
    SelectSQL.Strings = (
      'SELECT '
      'b.CODIGO_EMP, '
      'b.CODIGO_PRODUCTO, '
      'b.CODIGO_RUTA, '
      'i.codigo_texto,'
      'i.descripcion,'
      'i.precio,'
      'b.BALANCE_ANT, '
      'b.BALANCE_ACT, '
      'b.DEBITO_ACM, '
      'b.DEBITO_MES, '
      'b.CREDITO_ACM, '
      'b.CREDITO_MES, '
      'b.FECHA_BCE, '
      'b.FECHA_IN, '
      'b.FECHA_MOD, '
      'b.FECHA_ULT_PAGO, '
      'b.IN_POR, '
      'b.MOD_POR, '
      'b.STATUS_BCE'
      'from BALANCE_DESPACHO b,'
      'inventario_producto i'
      'WHERE b.codigo_producto = i.codigo'
      'ORDER  by b.codigo_ruta, i.codigo')
    ModifySQL.Strings = (
      'update BALANCE_DESPACHO'
      'set'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  CODIGO_RUTA = :CODIGO_RUTA,'
      '  CODIGO_PRODUCTO = :CODIGO_PRODUCTO,'
      '  BALANCE_ACT = :BALANCE_ACT,'
      '  BALANCE_ANT = :BALANCE_ANT,'
      '  DEBITO_MES = :DEBITO_MES,'
      '  CREDITO_MES = :CREDITO_MES,'
      '  DEBITO_ACM = :DEBITO_ACM,'
      '  CREDITO_ACM = :CREDITO_ACM,'
      '  FECHA_BCE = :FECHA_BCE,'
      '  FECHA_ULT_PAGO = :FECHA_ULT_PAGO,'
      '  STATUS_BCE = :STATUS_BCE,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  CODIGO_EMP = :OLD_CODIGO_EMP and'
      '  CODIGO_RUTA = :OLD_CODIGO_RUTA and'
      '  CODIGO_PRODUCTO = :OLD_CODIGO_PRODUCTO')
    Left = 48
    Top = 24
    object tblBalanceDespachoCODIGO_EMP: TIntegerField
      DisplayLabel = 'CodigoEmp'
      FieldName = 'CODIGO_EMP'
      Origin = 'BALANCE_DESPACHO.CODIGO_EMP'
      Required = True
    end
    object tblBalanceDespachoCODIGO_RUTA: TIntegerField
      DisplayLabel = 'CodRuta'
      FieldName = 'CODIGO_RUTA'
      Origin = 'BALANCE_DESPACHO.CODIGO_RUTA'
      Required = True
    end
    object tblBalanceDespachoCODIGO_TEXTO: TIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 12
    end
    object tblBalanceDespachoDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object tblBalanceDespachoBALANCE_ACT: TFloatField
      DisplayLabel = 'Balance Act'
      FieldName = 'BALANCE_ACT'
      Origin = 'BALANCE_DESPACHO.BALANCE_ACT'
    end
    object tblBalanceDespachoBALANCE_ANT: TFloatField
      DisplayLabel = 'Balance Ant'
      FieldName = 'BALANCE_ANT'
      Origin = 'BALANCE_DESPACHO.BALANCE_ANT'
    end
    object tblBalanceDespachoDEBITO_MES: TFloatField
      DisplayLabel = 'Debito Mes'
      FieldName = 'DEBITO_MES'
      Origin = 'BALANCE_DESPACHO.DEBITO_MES'
    end
    object tblBalanceDespachoCREDITO_MES: TFloatField
      DisplayLabel = 'Credito Mes'
      FieldName = 'CREDITO_MES'
      Origin = 'BALANCE_DESPACHO.CREDITO_MES'
    end
    object tblBalanceDespachoDEBITO_ACM: TFloatField
      DisplayLabel = 'Debito Acum'
      FieldName = 'DEBITO_ACM'
      Origin = 'BALANCE_DESPACHO.DEBITO_ACM'
    end
    object tblBalanceDespachoCREDITO_ACM: TFloatField
      DisplayLabel = 'Credito Acum'
      FieldName = 'CREDITO_ACM'
      Origin = 'BALANCE_DESPACHO.CREDITO_ACM'
    end
    object tblBalanceDespachoFECHA_BCE: TDateTimeField
      DisplayLabel = 'Fecha Blce'
      FieldName = 'FECHA_BCE'
      Origin = 'BALANCE_DESPACHO.FECHA_BCE'
    end
    object tblBalanceDespachoFECHA_ULT_PAGO: TDateTimeField
      DisplayLabel = 'Fecha Ult.Pago'
      FieldName = 'FECHA_ULT_PAGO'
      Origin = 'BALANCE_DESPACHO.FECHA_ULT_PAGO'
    end
    object tblBalanceDespachoSTATUS_BCE: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_BCE'
      Origin = 'BALANCE_DESPACHO.STATUS_BCE'
      FixedChar = True
      Size = 1
    end
    object tblBalanceDespachoFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'BALANCE_DESPACHO.FECHA_IN'
    end
    object tblBalanceDespachoCODIGO_PRODUCTO: TIntegerField
      DisplayLabel = 'CodProd'
      FieldName = 'CODIGO_PRODUCTO'
      Origin = 'BALANCE_DESPACHO.CODIGO_PRODUCTO'
      Required = True
    end
    object tblBalanceDespachoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'BALANCE_DESPACHO.IN_POR'
      Size = 12
    end
    object tblBalanceDespachoFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'BALANCE_DESPACHO.FECHA_MOD'
    end
    object tblBalanceDespachoMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'BALANCE_DESPACHO.MOD_POR'
      Size = 12
    end
    object tblBalanceDespachoPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
  end
  object qryDatosEmpleado: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select   b.codigo_emp,'
      'b.codigo_producto, b.codigo_ruta,'
      'e.nombre||" "||e.apellido nombrecompleto'
      'from '
      'BALANCE_DESPACHO b, EMPLEADO e'
      'Where b.codigo_emp = e.codigo')
    Left = 176
    Top = 24
    object qryDatosEmpleadoCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'BALANCE_DESPACHO.CODIGO_EMP'
      Required = True
    end
    object qryDatosEmpleadoCODIGO_PRODUCTO: TIntegerField
      FieldName = 'CODIGO_PRODUCTO'
      Origin = 'BALANCE_DESPACHO.CODIGO_PRODUCTO'
      Required = True
    end
    object qryDatosEmpleadoCODIGO_RUTA: TIntegerField
      FieldName = 'CODIGO_RUTA'
      Origin = 'BALANCE_DESPACHO.CODIGO_RUTA'
      Required = True
    end
    object qryDatosEmpleadoNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Size = 71
    end
  end
  object qryBlcRuta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  '
      'i.codigo_texto,'
      'b.balance_act, '
      'i.descripcion, '
      'i.precio,'
      'B.BALANCE_ACT * I.PRECIO VALOR'
      'from BALANCE_DESPACHO b,'
      'inventario_producto i'
      'Where b.codigo_emp =:codigoemp'
      'AND B.CODIGO_PRODUCTO = I.CODIGO'
      'ORDER BY i.descripcion, B.CODIGO_PRODUCTO')
    Left = 176
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoemp'
        ParamType = ptInput
      end>
    object qryBlcRutaCODIGO_TEXTO: TIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 12
    end
    object qryBlcRutaBALANCE_ACT: TFloatField
      DisplayLabel = 'Bce Actual'
      FieldName = 'BALANCE_ACT'
      Origin = 'BALANCE_DESPACHO.BALANCE_ACT'
    end
    object qryBlcRutaDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryBlcRutaPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryBlcRutaVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
  end
  object tblCuadreruta: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    AfterScroll = tblCuadrerutaAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CUADRE_RUTA'
      'where'
      '  RUTA = :OLD_RUTA and'
      '  FECHA = :OLD_FECHA')
    InsertSQL.Strings = (
      'insert into CUADRE_RUTA'
      
        '  (RUTA, FECHA, CODIGO_EMP, CODIGO_PROD, FORMAPAGO, NOMBRE_VENDE' +
        'DOR, CANTSALIDA, '
      
        '   CANTREGRESO, RECARGA, CANTIDAD, PRECIO, MONTO, DESCUENTO, ITB' +
        'I, NUMERODOC, '
      
        '   DESCRIPCION, VALORTOTAL, CODIGOCLIENTE, ORIGEN, DEVOLUCION_PO' +
        'R_VENCIMIENTO)'
      'values'
      
        '  (:RUTA, :FECHA, :CODIGO_EMP, :CODIGO_PROD, :FORMAPAGO, :NOMBRE' +
        '_VENDEDOR, '
      
        '   :CANTSALIDA, :CANTREGRESO, :RECARGA, :CANTIDAD, :PRECIO, :MON' +
        'TO, :DESCUENTO, '
      
        '   :ITBI, :NUMERODOC, :DESCRIPCION, :VALORTOTAL, :CODIGOCLIENTE,' +
        ' :ORIGEN, '
      '   :DEVOLUCION_POR_VENCIMIENTO)')
    RefreshSQL.Strings = (
      'Select '
      '  RUTA,'
      '  FECHA,'
      '  CODIGO_EMP,'
      '  CODIGO_PROD,'
      '  FORMAPAGO,'
      '  NOMBRE_VENDEDOR,'
      '  CANTSALIDA,'
      '  CANTREGRESO,'
      '  RECARGA,'
      '  CANTIDAD,'
      '  PRECIO,'
      '  MONTO,'
      '  DESCUENTO,'
      '  ITBI,'
      '  NUMERODOC,'
      '  DESCRIPCION,'
      '  VALORTOTAL,'
      '  CODIGOCLIENTE,'
      '  ORIGEN,'
      '  DEVOLUCION_POR_VENCIMIENTO'
      'from CUADRE_RUTA '
      'where'
      '  RUTA = :RUTA and'
      '  FECHA = :FECHA')
    SelectSQL.Strings = (
      'Select '
      'i.codigo,'
      'i.codigo_texto,'
      'c.CANTIDAD, '
      'c.CANTREGRESO, '
      'c.CANTSALIDA, '
      'c.CODIGO_EMP, '
      'c.CODIGO_PROD, '
      'c.CODIGOCLIENTE, '
      'c.DESCRIPCION, '
      'c.DESCUENTO, '
      'c.DEVOLUCION_POR_VENCIMIENTO, '
      'c.FECHA, '
      'c.FORMAPAGO, '
      'c.ITBI, '
      'c.MONTO, '
      'EMP.NOMBRE||" "||EMP.APELLIDO NOMBRE_VENDEDOR, '
      'c.NUMERODOC, '
      'c.ORIGEN, '
      'c.PRECIO, '
      'c.RECARGA, '
      'c.RUTA, '
      'c.VALORTOTAL  '
      'From CUADRE_RUTA c, inventario_producto I, empleado emp'
      'Where c.fecha =:fecha'
      'AND c.RUTA =:RUTA'
      'AND I.CODIGO_TEXTO = C.CODIGO_PROD'
      'AND EMP.CODIGO = C.CODIGO_EMP'
      'ORDER BY i.codigo')
    ModifySQL.Strings = (
      'update CUADRE_RUTA'
      'set'
      '  RUTA = :RUTA,'
      '  FECHA = :FECHA,'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  FORMAPAGO = :FORMAPAGO,'
      '  NOMBRE_VENDEDOR = :NOMBRE_VENDEDOR,'
      '  CANTSALIDA = :CANTSALIDA,'
      '  CANTREGRESO = :CANTREGRESO,'
      '  RECARGA = :RECARGA,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO = :PRECIO,'
      '  MONTO = :MONTO,'
      '  DESCUENTO = :DESCUENTO,'
      '  ITBI = :ITBI,'
      '  NUMERODOC = :NUMERODOC,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  VALORTOTAL = :VALORTOTAL,'
      '  CODIGOCLIENTE = :CODIGOCLIENTE,'
      '  ORIGEN = :ORIGEN,'
      '  DEVOLUCION_POR_VENCIMIENTO = :DEVOLUCION_POR_VENCIMIENTO'
      'where'
      '  RUTA = :OLD_RUTA and'
      '  FECHA = :OLD_FECHA')
    Left = 48
    Top = 72
    object tblCuadrerutaRUTA: TIntegerField
      FieldName = 'RUTA'
      Origin = 'CUADRE_RUTA.RUTA'
      Required = True
    end
    object tblCuadrerutaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'CUADRE_RUTA.FECHA'
      Required = True
    end
    object tblCuadrerutaCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'CUADRE_RUTA.CODIGO_EMP'
      Required = True
    end
    object tblCuadrerutaCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'CUADRE_RUTA.CODIGO_PROD'
      Required = True
      Size = 12
    end
    object tblCuadrerutaFORMAPAGO: TSmallintField
      FieldName = 'FORMAPAGO'
      Origin = 'CUADRE_RUTA.FORMAPAGO'
      Required = True
    end
    object tblCuadrerutaNOMBRE_VENDEDOR: TIBStringField
      FieldName = 'NOMBRE_VENDEDOR'
      Origin = 'CUADRE_RUTA.NOMBRE_VENDEDOR'
      Size = 40
    end
    object tblCuadrerutaCANTSALIDA: TFloatField
      FieldName = 'CANTSALIDA'
      Origin = 'CUADRE_RUTA.CANTSALIDA'
    end
    object tblCuadrerutaCANTREGRESO: TFloatField
      FieldName = 'CANTREGRESO'
      Origin = 'CUADRE_RUTA.CANTREGRESO'
    end
    object tblCuadrerutaRECARGA: TFloatField
      FieldName = 'RECARGA'
      Origin = 'CUADRE_RUTA.RECARGA'
    end
    object tblCuadrerutaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'CUADRE_RUTA.CANTIDAD'
    end
    object tblCuadrerutaPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'CUADRE_RUTA.PRECIO'
    end
    object tblCuadrerutaMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'CUADRE_RUTA.MONTO'
    end
    object tblCuadrerutaDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
      Origin = 'CUADRE_RUTA.DESCUENTO'
    end
    object tblCuadrerutaITBI: TFloatField
      FieldName = 'ITBI'
      Origin = 'CUADRE_RUTA.ITBI'
    end
    object tblCuadrerutaNUMERODOC: TIBStringField
      FieldName = 'NUMERODOC'
      Origin = 'CUADRE_RUTA.NUMERODOC'
    end
    object tblCuadrerutaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'CUADRE_RUTA.DESCRIPCION'
      Size = 60
    end
    object tblCuadrerutaVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      Origin = 'CUADRE_RUTA.VALORTOTAL'
    end
    object tblCuadrerutaCODIGOCLIENTE: TIntegerField
      FieldName = 'CODIGOCLIENTE'
      Origin = 'CUADRE_RUTA.CODIGOCLIENTE'
    end
    object tblCuadrerutaORIGEN: TSmallintField
      FieldName = 'ORIGEN'
      Origin = 'CUADRE_RUTA.ORIGEN'
    end
    object tblCuadrerutaDEVOLUCION_POR_VENCIMIENTO: TFloatField
      FieldName = 'DEVOLUCION_POR_VENCIMIENTO'
      Origin = 'CUADRE_RUTA.DEVOLUCION_POR_VENCIMIENTO'
    end
  end
  object qryTotalCajas: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Select sum(B.balance_act * I.PRECIO) totalcxc'
      'From  BALANCE_DESPACHO B, INVENTARIO_PRODUCTO I'
      'WHERE b.codigo_producto = i.codigo'
      '')
    Transaction = dmConectar.IBTransaction1
    Left = 176
    Top = 128
  end
  object qryDetalleCuadreRuta: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qryDetalleCuadreRutaCalcFields
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CUADRE_RUTA_DET'
      'where'
      '  RUTA = :OLD_RUTA and'
      '  FECHA = :OLD_FECHA and'
      '  CODIGO_EMP = :OLD_CODIGO_EMP')
    InsertSQL.Strings = (
      'insert into CUADRE_RUTA_DET'
      
        '  (RUTA, FECHA, CODIGO_EMP, EFECTIVO, CHEQUE, CREDITO_DIRECTO, C' +
        'REDITO_NORMAL, '
      
        '   PROMOCION, DEVOLUCION_POR_VENCIMIENTO, MONTO_VENTA, AJUSTE, C' +
        'OMENTARIO, '
      '   DIETA, COMBUSTIBLE, REP_CAMION)'
      'values'
      
        '  (:RUTA, :FECHA, :CODIGO_EMP, :EFECTIVO, :CHEQUE, :CREDITO_DIRE' +
        'CTO, :CREDITO_NORMAL, '
      
        '   :PROMOCION, :DEVOLUCION_POR_VENCIMIENTO, :MONTO_VENTA, :AJUST' +
        'E, :COMENTARIO, '
      '   :DIETA, :COMBUSTIBLE, :REP_CAMION)')
    RefreshSQL.Strings = (
      'Select '
      '  RUTA,'
      '  FECHA,'
      '  CODIGO_EMP,'
      '  EFECTIVO,'
      '  CHEQUE,'
      '  CREDITO_DIRECTO,'
      '  CREDITO_NORMAL,'
      '  PROMOCION,'
      '  DEVOLUCION_POR_VENCIMIENTO,'
      '  MONTO_VENTA,'
      '  AJUSTE,'
      '  COMENTARIO,'
      '  DIETA,'
      '  COMBUSTIBLE,'
      '  REP_CAMION'
      'from CUADRE_RUTA_DET '
      'where'
      '  RUTA = :RUTA and'
      '  FECHA = :FECHA and'
      '  CODIGO_EMP = :CODIGO_EMP')
    SelectSQL.Strings = (
      'select * from CUADRE_RUTA_DET'
      'Where ruta=:ruta'
      'and fecha=:fecha'
      'and codigo_emp=:codigo_emp')
    ModifySQL.Strings = (
      'update CUADRE_RUTA_DET'
      'set'
      '  RUTA = :RUTA,'
      '  FECHA = :FECHA,'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  EFECTIVO = :EFECTIVO,'
      '  CHEQUE = :CHEQUE,'
      '  CREDITO_DIRECTO = :CREDITO_DIRECTO,'
      '  CREDITO_NORMAL = :CREDITO_NORMAL,'
      '  PROMOCION = :PROMOCION,'
      '  DEVOLUCION_POR_VENCIMIENTO = :DEVOLUCION_POR_VENCIMIENTO,'
      '  MONTO_VENTA = :MONTO_VENTA,'
      '  AJUSTE = :AJUSTE,'
      '  COMENTARIO = :COMENTARIO,'
      '  DIETA = :DIETA,'
      '  COMBUSTIBLE = :COMBUSTIBLE,'
      '  REP_CAMION = :REP_CAMION'
      'where'
      '  RUTA = :OLD_RUTA and'
      '  FECHA = :OLD_FECHA and'
      '  CODIGO_EMP = :OLD_CODIGO_EMP')
    Left = 48
    Top = 128
    object qryDetalleCuadreRutaRUTA: TIntegerField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
      Origin = 'CUADRE_RUTA_DET.RUTA'
      Required = True
    end
    object qryDetalleCuadreRutaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'CUADRE_RUTA_DET.FECHA'
      Required = True
    end
    object qryDetalleCuadreRutaCODIGO_EMP: TIntegerField
      DisplayLabel = 'CodEmp'
      FieldName = 'CODIGO_EMP'
      Origin = 'CUADRE_RUTA_DET.CODIGO_EMP'
      Required = True
    end
    object qryDetalleCuadreRutaEFECTIVO: TFloatField
      DisplayLabel = 'Efectivo'
      FieldName = 'EFECTIVO'
      Origin = 'CUADRE_RUTA_DET.EFECTIVO'
      DisplayFormat = ',0.00'
    end
    object qryDetalleCuadreRutaCHEQUE: TFloatField
      DisplayLabel = 'Cheque'
      FieldName = 'CHEQUE'
      Origin = 'CUADRE_RUTA_DET.CHEQUE'
      DisplayFormat = ',0.00'
    end
    object qryDetalleCuadreRutaCREDITO_DIRECTO: TFloatField
      DisplayLabel = 'Credito Directo'
      FieldName = 'CREDITO_DIRECTO'
      Origin = 'CUADRE_RUTA_DET.CREDITO_DIRECTO'
      DisplayFormat = ',0.00'
    end
    object qryDetalleCuadreRutaCREDITO_NORMAL: TFloatField
      DisplayLabel = 'Credito Normal'
      FieldName = 'CREDITO_NORMAL'
      Origin = 'CUADRE_RUTA_DET.CREDITO_NORMAL'
      DisplayFormat = ',0.00'
    end
    object qryDetalleCuadreRutaPROMOCION: TFloatField
      DisplayLabel = 'Promocion'
      FieldName = 'PROMOCION'
      Origin = 'CUADRE_RUTA_DET.PROMOCION'
      DisplayFormat = ',0.00'
    end
    object qryDetalleCuadreRutaDEVOLUCION_POR_VENCIMIENTO: TFloatField
      DisplayLabel = 'Dev. por Vencimiento'
      FieldName = 'DEVOLUCION_POR_VENCIMIENTO'
      Origin = 'CUADRE_RUTA_DET.DEVOLUCION_POR_VENCIMIENTO'
      DisplayFormat = ',0.00'
    end
    object qryDetalleCuadreRutaTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object qryDetalleCuadreRutaMONTO_VENTA: TFloatField
      DisplayLabel = 'Monto Venta'
      FieldName = 'MONTO_VENTA'
      Origin = 'CUADRE_RUTA_DET.MONTO_VENTA'
    end
    object qryDetalleCuadreRutaAJUSTE: TFloatField
      DisplayLabel = 'Ajuste'
      FieldName = 'AJUSTE'
      Origin = 'CUADRE_RUTA_DET.AJUSTE'
    end
    object qryDetalleCuadreRutaCOMENTARIO: TMemoField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Origin = 'CUADRE_RUTA_DET.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object qryDetalleCuadreRutaDIETA: TFloatField
      DisplayLabel = 'Dieta'
      FieldName = 'DIETA'
      Origin = 'CUADRE_RUTA_DET.DIETA'
    end
    object qryDetalleCuadreRutaCOMBUSTIBLE: TFloatField
      DisplayLabel = 'Combustible'
      FieldName = 'COMBUSTIBLE'
      Origin = 'CUADRE_RUTA_DET.COMBUSTIBLE'
    end
    object qryDetalleCuadreRutaREP_CAMION: TFloatField
      DisplayLabel = 'Reparacion Camion'
      FieldName = 'REP_CAMION'
      Origin = 'CUADRE_RUTA_DET.REP_CAMION'
    end
  end
  object IBDataSet1: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT '
      'Balance_despacho.BALANCE_ACT, '
      'Inventario_producto.DESCRIPCION, '
      'Cuadre_ruta.CODIGO_EMP, '
      'Cuadre_ruta.RUTA, '
      'Cuadre_ruta.FECHA, '
      'Cuadre_ruta.CODIGO_PROD, '
      'Cuadre_ruta.FORMAPAGO, '
      'Cuadre_ruta.NOMBRE_VENDEDOR, '
      'Cuadre_ruta.CANTSALIDA, '
      'Cuadre_ruta.CANTREGRESO, '
      'Cuadre_ruta.RECARGA, '
      'Cuadre_ruta.CANTIDAD, '
      'Cuadre_ruta.PRECIO, '
      'Cuadre_ruta.MONTO, '
      'Cuadre_ruta.DESCUENTO, '
      'Cuadre_ruta.ITBI, '
      'Cuadre_ruta.NUMERODOC, '
      'Cuadre_ruta.DESCRIPCION, '
      'Cuadre_ruta.VALORTOTAL, '
      'Cuadre_ruta.CODIGOCLIENTE, '
      'Cuadre_ruta.ORIGEN, '
      'Cuadre_ruta.DEVOLUCION_POR_VENCIMIENTO'
      ''
      'FROM BALANCE_DESPACHO Balance_despacho'
      '   LEFT OUTER JOIN CUADRE_RUTA Cuadre_ruta'
      '   ON  (Balance_despacho.CODIGO_EMP = Cuadre_ruta.CODIGO_EMP)  '
      '   AND  (Balance_despacho.CODIGO_RUTA = Cuadre_ruta.RUTA)  '
      '   LEFT OUTER JOIN INVENTARIO_PRODUCTO Inventario_producto'
      
        '   ON  (Balance_despacho.CODIGO_PRODUCTO = Inventario_producto.C' +
        'ODIGO)  '
      'Where Balance_Despacho.codigo_ruta =:codigoruta')
    Left = 48
    Top = 176
  end
  object qryCargarDatosCuadreRuta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT DISTINCT '
      '  Balance_despacho.BALANCE_ACT, '
      '  Inventario_producto.codigo codigo_prod_inv,'
      '  Inventario_producto.DESCRIPCION, '
      '  Inventario_producto.CODIGO_TEXTO, '
      '  Balance_despacho.CODIGO_EMP,'
      '  Inventario_producto.PRECIO, '
      '  Empleado.NOMBRE||" "|| Empleado.APELLIDO nombreempleado'
      'FROM Balance_despacho Balance_despacho'
      '   LEFT OUTER JOIN INVENTARIO_PRODUCTO Inventario_producto'
      
        '   ON  (Balance_despacho.CODIGO_PRODUCTO = Inventario_producto.C' +
        'ODIGO)  '
      '   LEFT OUTER JOIN EMPLEADO Empleado'
      '   ON  (Balance_despacho.CODIGO_EMP = Empleado.CODIGO)  '
      'Where Balance_Despacho.codigo_ruta =:codigoruta'
      'and codigo_texto is not null'
      'ORDER by Inventario_producto.Codigo')
    Left = 176
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoruta'
        ParamType = ptInput
      end>
    object qryCargarDatosCuadreRutaBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'BALANCE_DESPACHO.BALANCE_ACT'
    end
    object qryCargarDatosCuadreRutaCODIGO_PROD_INV: TIntegerField
      FieldName = 'CODIGO_PROD_INV'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
    end
    object qryCargarDatosCuadreRutaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryCargarDatosCuadreRutaCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'BALANCE_DESPACHO.CODIGO_EMP'
      Required = True
    end
    object qryCargarDatosCuadreRutaPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryCargarDatosCuadreRutaNOMBREEMPLEADO: TIBStringField
      FieldName = 'NOMBREEMPLEADO'
      Size = 71
    end
    object qryCargarDatosCuadreRutaCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
  end
  object qryDatosRepBlcDespacho: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '
      'b.CODIGO_EMP, '
      'b.CODIGO_PRODUCTO, '
      'b.CODIGO_RUTA, '
      'i.codigo_texto,'
      'i.descripcion,'
      'i.precio,'
      'b.BALANCE_ANT, '
      'b.BALANCE_ACT, '
      'b.DEBITO_ACM, '
      'b.DEBITO_MES, '
      'b.CREDITO_ACM, '
      'b.CREDITO_MES, '
      'b.FECHA_BCE, '
      'b.FECHA_IN, '
      'b.FECHA_MOD, '
      'b.FECHA_ULT_PAGO, '
      'b.IN_POR, '
      'b.MOD_POR, '
      'b.STATUS_BCE'
      'from BALANCE_DESPACHO b,'
      'inventario_producto i'
      'Where b.codigo_producto = i.codigo'
      'And b.CODIGO_RUTA=:codigoruta'
      'order by b.codigo_ruta, i.codigo')
    Left = 176
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoruta'
        ParamType = ptInput
      end>
  end
  object tblPromociones: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = tblPromocionesCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PROMOCIONES'
      'where'
      '  RUTA = :OLD_RUTA and'
      '  FECHA = :OLD_FECHA and'
      '  CODIGO_PROD = :OLD_CODIGO_PROD')
    InsertSQL.Strings = (
      'insert into PROMOCIONES'
      
        '  (RUTA, FECHA, CODIGO_PROD, CODIGO_CTE, CANTIDAD, CODIGO_USUARI' +
        'O, FECHA_IN, '
      '   STATUS)'
      'values'
      
        '  (:RUTA, :FECHA, :CODIGO_PROD, :CODIGO_CTE, :CANTIDAD, :CODIGO_' +
        'USUARIO, '
      '   :FECHA_IN, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  RUTA,'
      '  FECHA,'
      '  CODIGO_PROD,'
      '  CODIGO_CTE,'
      '  CANTIDAD,'
      '  CODIGO_USUARIO,'
      '  FECHA_IN,'
      '  STATUS'
      'from PROMOCIONES '
      'where'
      '  RUTA = :RUTA and'
      '  FECHA = :FECHA and'
      '  CODIGO_PROD = :CODIGO_PROD')
    SelectSQL.Strings = (
      'Select * From PROMOCIONES'
      'Where ruta =:ruta'
      'And fecha Between :Fechaini And :Fechafin')
    ModifySQL.Strings = (
      'update PROMOCIONES'
      'set'
      '  RUTA = :RUTA,'
      '  FECHA = :FECHA,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  CANTIDAD = :CANTIDAD,'
      '  CODIGO_USUARIO = :CODIGO_USUARIO,'
      '  FECHA_IN = :FECHA_IN,'
      '  STATUS = :STATUS'
      'where'
      '  RUTA = :OLD_RUTA and'
      '  FECHA = :OLD_FECHA and'
      '  CODIGO_PROD = :OLD_CODIGO_PROD')
    Left = 272
    Top = 24
    object tblPromocionesRUTA: TIntegerField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
      Origin = 'PROMOCIONES.RUTA'
      Required = True
    end
    object tblPromocionesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'PROMOCIONES.FECHA'
      Required = True
    end
    object tblPromocionesCODIGO_PROD: TIBStringField
      DisplayLabel = 'CodProd'
      FieldName = 'CODIGO_PROD'
      Origin = 'PROMOCIONES.CODIGO_PROD'
      Required = True
      Size = 12
    end
    object tblPromocionesPrecio: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Precio'
      Calculated = True
    end
    object tblPromocionesCANTIDAD: TFloatField
      DisplayLabel = 'Cant.'
      FieldName = 'CANTIDAD'
      Origin = 'PROMOCIONES.CANTIDAD'
      DisplayFormat = ',0.00'
    end
    object tblPromocionesMonto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Monto'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object tblPromocionesCODIGO_CTE: TIntegerField
      DisplayLabel = 'Codigo Cte'
      FieldName = 'CODIGO_CTE'
      Origin = 'PROMOCIONES.CODIGO_CTE'
    end
    object tblPromocionesCODIGO_USUARIO: TIntegerField
      DisplayLabel = 'CodUsuario'
      FieldName = 'CODIGO_USUARIO'
      Origin = 'PROMOCIONES.CODIGO_USUARIO'
    end
    object tblPromocionesSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'PROMOCIONES.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblPromocionesFECHA_IN: TDateTimeField
      DisplayLabel = 'FechaIn'
      FieldName = 'FECHA_IN'
      Origin = 'PROMOCIONES.FECHA_IN'
    end
  end
  object qryInventario: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '
      'INV.CODIGO,'
      'INV.CODIGO_TEXTO, '
      'INV.DESCRIPCION, '
      'INV.PRECIO, '
      'INV.PAGA_ITBI,'
      'tipo_inv.Descripcion Desc_tipoInv,'
      'inv.tipo,'
      'porc_descuento'
      'FROM'
      'INVENTARIO_PRODUCTO  inv,'
      'TIPO_INVENTARIO tipo_inv'
      'Where inv.tipo = tipo_inv.codigo'
      'ORDER BY inv.tipo, inv.descripcion')
    Left = 351
    Top = 24
    object qryInventarioDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryInventarioPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryInventarioPAGA_ITBI: TSmallintField
      DisplayLabel = 'PagaItbi'
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
    end
    object qryInventarioDESC_TIPOINV: TIBStringField
      DisplayLabel = 'TipoInventario'
      FieldName = 'DESC_TIPOINV'
      Origin = 'TIPO_INVENTARIO.DESCRIPCION'
      Size = 30
    end
    object qryInventarioTIPO: TIntegerField
      DisplayLabel = 'CodTipo'
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object qryInventarioPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'INVENTARIO_PRODUCTO.PORC_DESCUENTO'
    end
    object qryInventarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInventarioCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
  end
  object tblCliente: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CLIENTES'
    Left = 352
    Top = 72
    object tblClienteCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
    end
    object tblClienteNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Size = 60
    end
    object tblClienteNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Size = 30
    end
    object tblClienteNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Size = 40
    end
  end
  object trnCajaTrn: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CAJA_TRN'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into CAJA_TRN'
      
        '  (SERIE, COD_CAJA, CODIGO_EMP, TIPO_TRN, FECHA, DESCRIPCION, MO' +
        'NTO, COD_USUARIO, '
      '   STATUS)'
      'values'
      
        '  (:SERIE, :COD_CAJA, :CODIGO_EMP, :TIPO_TRN, :FECHA, :DESCRIPCI' +
        'ON, :MONTO, '
      '   :COD_USUARIO, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  COD_CAJA,'
      '  CODIGO_EMP,'
      '  TIPO_TRN,'
      '  FECHA,'
      '  DESCRIPCION,'
      '  MONTO,'
      '  COD_USUARIO,'
      '  STATUS'
      'from CAJA_TRN '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select * from CAJA_TRN'
      'where fecha between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update CAJA_TRN'
      'set'
      '  SERIE = :SERIE,'
      '  COD_CAJA = :COD_CAJA,'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  TIPO_TRN = :TIPO_TRN,'
      '  FECHA = :FECHA,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  MONTO = :MONTO,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  STATUS = :STATUS'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_CAJA_TRN_SERIE'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 352
    Top = 128
    object trnCajaTrnSERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'CAJA_TRN.SERIE'
      Required = True
    end
    object trnCajaTrnCOD_CAJA: TIntegerField
      DisplayLabel = 'CodCaja'
      FieldName = 'COD_CAJA'
      Origin = 'CAJA_TRN.COD_CAJA'
      Required = True
    end
    object trnCajaTrnCODIGO_EMP: TIntegerField
      DisplayLabel = 'CodEmp'
      FieldName = 'CODIGO_EMP'
      Origin = 'CAJA_TRN.CODIGO_EMP'
      Required = True
    end
    object trnCajaTrnTIPO_TRN: TSmallintField
      DisplayLabel = 'TipoTrn'
      FieldName = 'TIPO_TRN'
      Origin = 'CAJA_TRN.TIPO_TRN'
      Required = True
    end
    object trnCajaTrnFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'CAJA_TRN.FECHA'
      Required = True
    end
    object trnCajaTrnDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'CAJA_TRN.DESCRIPCION'
      Size = 60
    end
    object trnCajaTrnMONTO: TFloatField
      DisplayLabel = 'Monto'
      FieldName = 'MONTO'
      Origin = 'CAJA_TRN.MONTO'
      DisplayFormat = ',0.00'
    end
    object trnCajaTrnCOD_USUARIO: TIntegerField
      DisplayLabel = 'CodUsuario'
      FieldName = 'COD_USUARIO'
      Origin = 'CAJA_TRN.COD_USUARIO'
    end
    object trnCajaTrnSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'CAJA_TRN.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object trnCaja: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from caja'
      'where'
      '  COD_CAJA = :OLD_COD_CAJA')
    InsertSQL.Strings = (
      'insert into caja'
      
        '  (COD_CAJA, FECHA, DESCRIPCION, BALANCE_ANT, BALANCE_ACTUAL, MO' +
        'NTO_ENTRADA_ACUM, '
      '   MONTO_RETIRADO_ACUM, COD_USUARIO, STATUS)'
      'values'
      
        '  (:COD_CAJA, :FECHA, :DESCRIPCION, :BALANCE_ANT, :BALANCE_ACTUA' +
        'L, :MONTO_ENTRADA_ACUM, '
      '   :MONTO_RETIRADO_ACUM, :COD_USUARIO, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  COD_CAJA,'
      '  FECHA,'
      '  DESCRIPCION,'
      '  BALANCE_ANT,'
      '  BALANCE_ACTUAL,'
      '  MONTO_ENTRADA_ACUM,'
      '  MONTO_RETIRADO_ACUM,'
      '  COD_USUARIO,'
      '  STATUS'
      'from caja '
      'where'
      '  COD_CAJA = :COD_CAJA')
    SelectSQL.Strings = (
      'Select * from caja')
    ModifySQL.Strings = (
      'update caja'
      'set'
      '  COD_CAJA = :COD_CAJA,'
      '  FECHA = :FECHA,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  BALANCE_ANT = :BALANCE_ANT,'
      '  BALANCE_ACTUAL = :BALANCE_ACTUAL,'
      '  MONTO_ENTRADA_ACUM = :MONTO_ENTRADA_ACUM,'
      '  MONTO_RETIRADO_ACUM = :MONTO_RETIRADO_ACUM,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  STATUS = :STATUS'
      'where'
      '  COD_CAJA = :OLD_COD_CAJA')
    GeneratorField.Field = 'COD_CAJA'
    GeneratorField.Generator = 'GEN_CAJA_COD'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 352
    Top = 184
    object trnCajaCOD_CAJA: TIntegerField
      DisplayLabel = 'CodCaja'
      FieldName = 'COD_CAJA'
      Origin = 'CAJA.COD_CAJA'
      Required = True
    end
    object trnCajaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'CAJA.FECHA'
      Required = True
    end
    object trnCajaDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'CAJA.DESCRIPCION'
      Size = 50
    end
    object trnCajaBALANCE_ANT: TFloatField
      DisplayLabel = 'Balance Ant'
      FieldName = 'BALANCE_ANT'
      Origin = 'CAJA.BALANCE_ANT'
      DisplayFormat = ',0.00'
    end
    object trnCajaBALANCE_ACTUAL: TFloatField
      DisplayLabel = 'Balance Actual'
      FieldName = 'BALANCE_ACTUAL'
      Origin = 'CAJA.BALANCE_ACTUAL'
      DisplayFormat = ',0.00'
    end
    object trnCajaMONTO_ENTRADA_ACUM: TFloatField
      DisplayLabel = 'Monto entrada Acum'
      FieldName = 'MONTO_ENTRADA_ACUM'
      Origin = 'CAJA.MONTO_ENTRADA_ACUM'
      DisplayFormat = ',0.00'
    end
    object trnCajaMONTO_RETIRADO_ACUM: TFloatField
      DisplayLabel = 'Monto Retirado Acum'
      FieldName = 'MONTO_RETIRADO_ACUM'
      Origin = 'CAJA.MONTO_RETIRADO_ACUM'
      DisplayFormat = ',0.00'
    end
    object trnCajaCOD_USUARIO: TIntegerField
      DisplayLabel = 'codUsuario'
      FieldName = 'COD_USUARIO'
      Origin = 'CAJA.COD_USUARIO'
    end
    object trnCajaSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'CAJA.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object trnCuadreDistVenta: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CUADRE_DIST_VENTA'
      'where'
      '  COD_CAJA = :OLD_COD_CAJA and'
      '  TURNO = :OLD_TURNO and'
      '  FECHA = :OLD_FECHA')
    InsertSQL.Strings = (
      'insert into CUADRE_DIST_VENTA'
      
        '  (COD_CAJA, TURNO, FECHA, MONTO_VENTA_TOTAL, MONTO_VENTA_CREDIT' +
        'O, INGRESO_CXC, '
      
        '   MONTO_DEVOLUCIONES, M2000, M1000, M500, M200, M100, M50, M25,' +
        ' M20, M10, '
      
        '   M5, MONTO_EN_CHEQUE, MONEDAS, AJUSTE, DIETA, RETIRO, COMBUSTI' +
        'BLE, REP_CAMION, '
      '   COD_USUARIO, STATUS)'
      'values'
      
        '  (:COD_CAJA, :TURNO, :FECHA, :MONTO_VENTA_TOTAL, :MONTO_VENTA_C' +
        'REDITO, '
      
        '   :INGRESO_CXC, :MONTO_DEVOLUCIONES, :M2000, :M1000, :M500, :M2' +
        '00, :M100, '
      
        '   :M50, :M25, :M20, :M10, :M5, :MONTO_EN_CHEQUE, :MONEDAS, :AJU' +
        'STE, :DIETA, '
      '   :RETIRO, :COMBUSTIBLE, :REP_CAMION, :COD_USUARIO, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  COD_CAJA,'
      '  TURNO,'
      '  FECHA,'
      '  MONTO_VENTA_TOTAL,'
      '  MONTO_VENTA_CREDITO,'
      '  INGRESO_CXC,'
      '  MONTO_DEVOLUCIONES,'
      '  M2000,'
      '  M1000,'
      '  M500,'
      '  M200,'
      '  M100,'
      '  M50,'
      '  M25,'
      '  M20,'
      '  M10,'
      '  M5,'
      '  MONTO_EN_CHEQUE,'
      '  MONEDAS,'
      '  AJUSTE,'
      '  DIETA,'
      '  RETIRO,'
      '  COMBUSTIBLE,'
      '  REP_CAMION,'
      '  COD_USUARIO,'
      '  STATUS'
      'from CUADRE_DIST_VENTA '
      'where'
      '  COD_CAJA = :COD_CAJA and'
      '  TURNO = :TURNO and'
      '  FECHA = :FECHA')
    SelectSQL.Strings = (
      'Select *  From CUADRE_DIST_VENTA'
      'Where fecha between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update CUADRE_DIST_VENTA'
      'set'
      '  COD_CAJA = :COD_CAJA,'
      '  TURNO = :TURNO,'
      '  FECHA = :FECHA,'
      '  MONTO_VENTA_TOTAL = :MONTO_VENTA_TOTAL,'
      '  MONTO_VENTA_CREDITO = :MONTO_VENTA_CREDITO,'
      '  INGRESO_CXC = :INGRESO_CXC,'
      '  MONTO_DEVOLUCIONES = :MONTO_DEVOLUCIONES,'
      '  M2000 = :M2000,'
      '  M1000 = :M1000,'
      '  M500 = :M500,'
      '  M200 = :M200,'
      '  M100 = :M100,'
      '  M50 = :M50,'
      '  M25 = :M25,'
      '  M20 = :M20,'
      '  M10 = :M10,'
      '  M5 = :M5,'
      '  MONTO_EN_CHEQUE = :MONTO_EN_CHEQUE,'
      '  MONEDAS = :MONEDAS,'
      '  AJUSTE = :AJUSTE,'
      '  DIETA = :DIETA,'
      '  RETIRO = :RETIRO,'
      '  COMBUSTIBLE = :COMBUSTIBLE,'
      '  REP_CAMION = :REP_CAMION,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  STATUS = :STATUS'
      'where'
      '  COD_CAJA = :OLD_COD_CAJA and'
      '  TURNO = :OLD_TURNO and'
      '  FECHA = :OLD_FECHA')
    Left = 352
    Top = 240
    object trnCuadreDistVentaCOD_CAJA: TIntegerField
      FieldName = 'COD_CAJA'
      Origin = 'CUADRE_DIST_VENTA.COD_CAJA'
      Required = True
    end
    object trnCuadreDistVentaTURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'CUADRE_DIST_VENTA.TURNO'
      Required = True
    end
    object trnCuadreDistVentaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'CUADRE_DIST_VENTA.FECHA'
      Required = True
    end
    object trnCuadreDistVentaMONTO_VENTA_TOTAL: TFloatField
      FieldName = 'MONTO_VENTA_TOTAL'
      Origin = 'CUADRE_DIST_VENTA.MONTO_VENTA_TOTAL'
    end
    object trnCuadreDistVentaMONTO_VENTA_CREDITO: TFloatField
      FieldName = 'MONTO_VENTA_CREDITO'
      Origin = 'CUADRE_DIST_VENTA.MONTO_VENTA_CREDITO'
    end
    object trnCuadreDistVentaINGRESO_CXC: TFloatField
      FieldName = 'INGRESO_CXC'
      Origin = 'CUADRE_DIST_VENTA.INGRESO_CXC'
    end
    object trnCuadreDistVentaMONTO_DEVOLUCIONES: TFloatField
      FieldName = 'MONTO_DEVOLUCIONES'
      Origin = 'CUADRE_DIST_VENTA.MONTO_DEVOLUCIONES'
    end
    object trnCuadreDistVentaM2000: TIntegerField
      FieldName = 'M2000'
      Origin = 'CUADRE_DIST_VENTA.M2000'
    end
    object trnCuadreDistVentaM1000: TIntegerField
      FieldName = 'M1000'
      Origin = 'CUADRE_DIST_VENTA.M1000'
    end
    object trnCuadreDistVentaM500: TIntegerField
      FieldName = 'M500'
      Origin = 'CUADRE_DIST_VENTA.M500'
    end
    object trnCuadreDistVentaM200: TIntegerField
      FieldName = 'M200'
      Origin = 'CUADRE_DIST_VENTA.M200'
    end
    object trnCuadreDistVentaM100: TIntegerField
      FieldName = 'M100'
      Origin = 'CUADRE_DIST_VENTA.M100'
    end
    object trnCuadreDistVentaM50: TIntegerField
      FieldName = 'M50'
      Origin = 'CUADRE_DIST_VENTA.M50'
    end
    object trnCuadreDistVentaM25: TIntegerField
      FieldName = 'M25'
      Origin = 'CUADRE_DIST_VENTA.M25'
    end
    object trnCuadreDistVentaM20: TIntegerField
      FieldName = 'M20'
      Origin = 'CUADRE_DIST_VENTA.M20'
    end
    object trnCuadreDistVentaM10: TIntegerField
      FieldName = 'M10'
      Origin = 'CUADRE_DIST_VENTA.M10'
    end
    object trnCuadreDistVentaM5: TIntegerField
      FieldName = 'M5'
      Origin = 'CUADRE_DIST_VENTA.M5'
    end
    object trnCuadreDistVentaMONTO_EN_CHEQUE: TFloatField
      FieldName = 'MONTO_EN_CHEQUE'
      Origin = 'CUADRE_DIST_VENTA.MONTO_EN_CHEQUE'
    end
    object trnCuadreDistVentaMONEDAS: TFloatField
      FieldName = 'MONEDAS'
      Origin = 'CUADRE_DIST_VENTA.MONEDAS'
    end
    object trnCuadreDistVentaAJUSTE: TFloatField
      FieldName = 'AJUSTE'
      Origin = 'CUADRE_DIST_VENTA.AJUSTE'
    end
    object trnCuadreDistVentaDIETA: TFloatField
      FieldName = 'DIETA'
      Origin = 'CUADRE_DIST_VENTA.DIETA'
    end
    object trnCuadreDistVentaRETIRO: TFloatField
      FieldName = 'RETIRO'
      Origin = 'CUADRE_DIST_VENTA.RETIRO'
    end
    object trnCuadreDistVentaCOMBUSTIBLE: TFloatField
      FieldName = 'COMBUSTIBLE'
      Origin = 'CUADRE_DIST_VENTA.COMBUSTIBLE'
    end
    object trnCuadreDistVentaREP_CAMION: TFloatField
      FieldName = 'REP_CAMION'
      Origin = 'CUADRE_DIST_VENTA.REP_CAMION'
    end
    object trnCuadreDistVentaCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'CUADRE_DIST_VENTA.COD_USUARIO'
    end
    object trnCuadreDistVentaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CUADRE_DIST_VENTA.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryCaja: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CAJA'
    Left = 466
    Top = 72
    object qryCajaCOD_CAJA: TIntegerField
      FieldName = 'COD_CAJA'
    end
    object qryCajaFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object qryCajaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
    object qryCajaBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
    end
    object qryCajaBALANCE_ACTUAL: TFloatField
      FieldName = 'BALANCE_ACTUAL'
    end
    object qryCajaMONTO_ENTRADA_ACUM: TFloatField
      FieldName = 'MONTO_ENTRADA_ACUM'
    end
    object qryCajaMONTO_RETIRADO_ACUM: TFloatField
      FieldName = 'MONTO_RETIRADO_ACUM'
    end
    object qryCajaCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object qryCajaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object qryEmpleados: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  e.nombre||" "||e.apellido nombrecompleto, e.*'
      'from  EMPLEADO e'
      '')
    Left = 468
    Top = 128
  end
  object ibProcUpdateCaja: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_BALANCE_CAJA'
    Left = 464
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'MONTO_BALANCE_ACTUAL'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'COD_CAJA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ACCION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO'
        ParamType = ptInput
      end>
  end
  object tblRuta: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TURNO'
    Left = 464
    Top = 240
    object tblRutaCODIGO_TURNO: TIntegerField
      FieldName = 'CODIGO_TURNO'
    end
    object tblRutaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
    object tblRutaHORAINI: TDateTimeField
      FieldName = 'HORAINI'
    end
    object tblRutaHORAFIN: TDateTimeField
      FieldName = 'HORAFIN'
    end
    object tblRutaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object sp_InsertCuadreCaja: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INS_CUADRE_DIST_VENTA'
    Left = 184
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_EMPLEADO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INGRESO_CXC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VENTA_A_CREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VENTA_AL_CONTADO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DEVOLUCION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_EN_CHEQUE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'M2000'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'M1000'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'M500'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'M200'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'M100'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'M50'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'M25'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'M20'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'M10'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'M5'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_MONEDAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_AJUSTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DIETA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_RETIRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_UPDATE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_EN_FONDO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'INICIAL_FINANCIAMIENTO'
        ParamType = ptInput
      end>
  end
  object qryDatosCuadreCaja: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From CUADRE_DIST_VENTA'
      'Where (cod_empleado =:codEmp)'
      'And Fecha = :FechaFin')
    Left = 464
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codEmp'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FechaFin'
        ParamType = ptInput
      end>
    object qryDatosCuadreCajaCOD_EMPLEADO: TIntegerField
      FieldName = 'COD_EMPLEADO'
      Origin = 'CUADRE_DIST_VENTA.COD_EMPLEADO'
      Required = True
    end
    object qryDatosCuadreCajaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'CUADRE_DIST_VENTA.FECHA'
      Required = True
    end
    object qryDatosCuadreCajaINGRESO_CXC: TFloatField
      FieldName = 'INGRESO_CXC'
      Origin = 'CUADRE_DIST_VENTA.INGRESO_CXC'
    end
    object qryDatosCuadreCajaVENTA_A_CREDITO: TFloatField
      FieldName = 'VENTA_A_CREDITO'
      Origin = 'CUADRE_DIST_VENTA.VENTA_A_CREDITO'
    end
    object qryDatosCuadreCajaVENTA_AL_CONTADO: TFloatField
      FieldName = 'VENTA_AL_CONTADO'
      Origin = 'CUADRE_DIST_VENTA.VENTA_AL_CONTADO'
    end
    object qryDatosCuadreCajaMONTO_DEVOLUCION: TFloatField
      FieldName = 'MONTO_DEVOLUCION'
      Origin = 'CUADRE_DIST_VENTA.MONTO_DEVOLUCION'
    end
    object qryDatosCuadreCajaMONTO_EN_CHEQUE: TFloatField
      FieldName = 'MONTO_EN_CHEQUE'
      Origin = 'CUADRE_DIST_VENTA.MONTO_EN_CHEQUE'
    end
    object qryDatosCuadreCajaM2000: TIntegerField
      FieldName = 'M2000'
      Origin = 'CUADRE_DIST_VENTA.M2000'
    end
    object qryDatosCuadreCajaM1000: TIntegerField
      FieldName = 'M1000'
      Origin = 'CUADRE_DIST_VENTA.M1000'
    end
    object qryDatosCuadreCajaM500: TIntegerField
      FieldName = 'M500'
      Origin = 'CUADRE_DIST_VENTA.M500'
    end
    object qryDatosCuadreCajaM200: TIntegerField
      FieldName = 'M200'
      Origin = 'CUADRE_DIST_VENTA.M200'
    end
    object qryDatosCuadreCajaM100: TIntegerField
      FieldName = 'M100'
      Origin = 'CUADRE_DIST_VENTA.M100'
    end
    object qryDatosCuadreCajaM50: TIntegerField
      FieldName = 'M50'
      Origin = 'CUADRE_DIST_VENTA.M50'
    end
    object qryDatosCuadreCajaM25: TIntegerField
      FieldName = 'M25'
      Origin = 'CUADRE_DIST_VENTA.M25'
    end
    object qryDatosCuadreCajaM20: TIntegerField
      FieldName = 'M20'
      Origin = 'CUADRE_DIST_VENTA.M20'
    end
    object qryDatosCuadreCajaM10: TIntegerField
      FieldName = 'M10'
      Origin = 'CUADRE_DIST_VENTA.M10'
    end
    object qryDatosCuadreCajaM5: TIntegerField
      FieldName = 'M5'
      Origin = 'CUADRE_DIST_VENTA.M5'
    end
    object qryDatosCuadreCajaMONTO_MONEDAS: TFloatField
      FieldName = 'MONTO_MONEDAS'
      Origin = 'CUADRE_DIST_VENTA.MONTO_MONEDAS'
    end
    object qryDatosCuadreCajaMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'CUADRE_DIST_VENTA.MONTO_AJUSTE'
    end
    object qryDatosCuadreCajaMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'CUADRE_DIST_VENTA.MONTO_DIETA'
    end
    object qryDatosCuadreCajaMONTO_RETIRO: TFloatField
      FieldName = 'MONTO_RETIRO'
      Origin = 'CUADRE_DIST_VENTA.MONTO_RETIRO'
    end
    object qryDatosCuadreCajaCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'CUADRE_DIST_VENTA.COD_USUARIO'
    end
    object qryDatosCuadreCajaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CUADRE_DIST_VENTA.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosCuadreCajaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CUADRE_DIST_VENTA.FECHA_IN'
    end
    object qryDatosCuadreCajaFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'CUADRE_DIST_VENTA.FECHA_UPDATE'
    end
    object qryDatosCuadreCajaMONTO_EN_FONDO: TFloatField
      FieldName = 'MONTO_EN_FONDO'
      Origin = 'CUADRE_DIST_VENTA.MONTO_EN_FONDO'
    end
  end
end
