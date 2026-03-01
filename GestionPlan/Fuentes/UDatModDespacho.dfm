object dmDespacho: TdmDespacho
  OldCreateOrder = False
  Left = 848
  Top = 109
  Height = 426
  Width = 305
  object tblDespachoMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterInsert = tblDespachoMasterAfterInsert
    AfterScroll = tblDespachoMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DESPACHO_MASTER'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into DESPACHO_MASTER'
      
        '  (NUMERO, FECHA, TIPO_TRN, CODIGO_DESPACHADOR, CODIGO_EMP, MONT' +
        'O_TOTAL, '
      
        '   NUM_ORDEN, STATUS, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, CODI' +
        'GO_RUTA, '
      
        '   NUM_CONDUCE, CODIGO_PROV, NCF, RNC_PROVEEDOR, INVENTARIO_ID, ' +
        'SERIE_INV_ID, '
      '   INV_ID_ORIGEN, INV_ID_DESTINO)'
      'values'
      
        '  (:NUMERO, :FECHA, :TIPO_TRN, :CODIGO_DESPACHADOR, :CODIGO_EMP,' +
        ' :MONTO_TOTAL, '
      
        '   :NUM_ORDEN, :STATUS, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR' +
        ', :CODIGO_RUTA, '
      
        '   :NUM_CONDUCE, :CODIGO_PROV, :NCF, :RNC_PROVEEDOR, :INVENTARIO' +
        '_ID, :SERIE_INV_ID, '
      '   :INV_ID_ORIGEN, :INV_ID_DESTINO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA,'
      '  TIPO_TRN,'
      '  CODIGO_DESPACHADOR,'
      '  CODIGO_EMP,'
      '  MONTO_TOTAL,'
      '  NUM_ORDEN,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  CODIGO_RUTA,'
      '  NUM_CONDUCE,'
      '  CODIGO_PROV,'
      '  NCF,'
      '  RNC_PROVEEDOR,'
      '  INVENTARIO_ID,'
      '  SERIE_INV_ID,'
      '  INV_ID_ORIGEN,'
      '  INV_ID_DESTINO'
      'from DESPACHO_MASTER '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'select * from DESPACHO_MASTER'
      'where FECHA BETWEEN :FECHAINI AND :FECHAFIN')
    ModifySQL.Strings = (
      'update DESPACHO_MASTER'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  TIPO_TRN = :TIPO_TRN,'
      '  CODIGO_DESPACHADOR = :CODIGO_DESPACHADOR,'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  MONTO_TOTAL = :MONTO_TOTAL,'
      '  NUM_ORDEN = :NUM_ORDEN,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  CODIGO_RUTA = :CODIGO_RUTA,'
      '  NUM_CONDUCE = :NUM_CONDUCE,'
      '  CODIGO_PROV = :CODIGO_PROV,'
      '  NCF = :NCF,'
      '  RNC_PROVEEDOR = :RNC_PROVEEDOR,'
      '  INVENTARIO_ID = :INVENTARIO_ID,'
      '  SERIE_INV_ID = :SERIE_INV_ID,'
      '  INV_ID_ORIGEN = :INV_ID_ORIGEN,'
      '  INV_ID_DESTINO = :INV_ID_DESTINO'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_NUM_DESPACHOMASTER'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 48
    Top = 24
    object tblDespachoMasterNUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
      Origin = 'DESPACHO_MASTER.NUMERO'
      Required = True
    end
    object tblDespachoMasterFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'DESPACHO_MASTER.FECHA'
      Required = True
    end
    object tblDespachoMasterTIPO_TRN: TSmallintField
      DisplayLabel = 'TipoTrn'
      FieldName = 'TIPO_TRN'
      Origin = 'DESPACHO_MASTER.TIPO_TRN'
    end
    object tblDespachoMasterCODIGO_EMP: TIntegerField
      DisplayLabel = 'CodEmp'
      FieldName = 'CODIGO_EMP'
      Origin = 'DESPACHO_MASTER.CODIGO_EMP'
    end
    object tblDespachoMasterMONTO_TOTAL: TFloatField
      DisplayLabel = 'Monto Total'
      FieldName = 'MONTO_TOTAL'
      Origin = 'DESPACHO_MASTER.MONTO_TOTAL'
    end
    object tblDespachoMasterNUM_ORDEN: TFloatField
      DisplayLabel = 'NumOrden'
      FieldName = 'NUM_ORDEN'
      Origin = 'DESPACHO_MASTER.NUM_ORDEN'
    end
    object tblDespachoMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DESPACHO_MASTER.FECHA_IN'
    end
    object tblDespachoMasterIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DESPACHO_MASTER.IN_POR'
      Size = 12
    end
    object tblDespachoMasterFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DESPACHO_MASTER.FECHA_MOD'
    end
    object tblDespachoMasterMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DESPACHO_MASTER.MOD_POR'
      Size = 12
    end
    object tblDespachoMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DESPACHO_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblDespachoMasterCODIGO_DESPACHADOR: TIntegerField
      DisplayLabel = 'CodDespachador'
      FieldName = 'CODIGO_DESPACHADOR'
      Origin = 'DESPACHO_MASTER.CODIGO_DESPACHADOR'
    end
    object tblDespachoMasterCODIGO_RUTA: TIntegerField
      FieldName = 'CODIGO_RUTA'
      Origin = 'DESPACHO_MASTER.CODIGO_RUTA'
    end
    object tblDespachoMasterNUM_CONDUCE: TIntegerField
      FieldName = 'NUM_CONDUCE'
      Origin = 'DESPACHO_MASTER.NUM_CONDUCE'
    end
    object tblDespachoMasterCODIGO_PROV: TIntegerField
      FieldName = 'CODIGO_PROV'
      Origin = 'DESPACHO_MASTER.CODIGO_PROV'
    end
  end
  object dstblDespachoMaster: TDataSource
    DataSet = tblDespachoMaster
    Left = 48
    Top = 80
  end
  object dstbldespachoDet: TDataSource
    DataSet = tblDespachoDet
    Left = 40
    Top = 184
  end
  object tblDespachoDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BeforePost = tblDespachoDetBeforePost
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DESPACHO'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into DESPACHO'
      
        '  (SERIE, NUMERO, TIPO_TRN, CODIGO_PROD, CANTIDAD, PRECIO, PORC_' +
        'DESC_DET, '
      
        '   ITBI_DET, VALOR_BRUTO, VALOR_TOTAL_DET, NUM_ORDEN, STATUS_DET' +
        ', FECHA_IN, '
      
        '   IN_POR, FECHA_MOD, MOD_POR, DESCRIPCION, RECARGA, CANT_UNIDAD' +
        'ES, UNIDADID)'
      'values'
      
        '  (:SERIE, :NUMERO, :TIPO_TRN, :CODIGO_PROD, :CANTIDAD, :PRECIO,' +
        ' :PORC_DESC_DET, '
      
        '   :ITBI_DET, :VALOR_BRUTO, :VALOR_TOTAL_DET, :NUM_ORDEN, :STATU' +
        'S_DET, '
      
        '   :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR, :DESCRIPCION, :RECA' +
        'RGA, :CANT_UNIDADES, '
      '   :UNIDADID)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  TIPO_TRN,'
      '  CODIGO_PROD,'
      '  CANTIDAD,'
      '  PRECIO,'
      '  PORC_DESC_DET,'
      '  ITBI_DET,'
      '  VALOR_BRUTO,'
      '  VALOR_TOTAL_DET,'
      '  NUM_ORDEN,'
      '  STATUS_DET,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  DESCRIPCION,'
      '  RECARGA,'
      '  CANT_UNIDADES,'
      '  UNIDADID'
      'from DESPACHO '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select * from DESPACHO'
      'where NUMERO =:numero')
    ModifySQL.Strings = (
      'update DESPACHO'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  TIPO_TRN = :TIPO_TRN,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO = :PRECIO,'
      '  PORC_DESC_DET = :PORC_DESC_DET,'
      '  ITBI_DET = :ITBI_DET,'
      '  VALOR_BRUTO = :VALOR_BRUTO,'
      '  VALOR_TOTAL_DET = :VALOR_TOTAL_DET,'
      '  NUM_ORDEN = :NUM_ORDEN,'
      '  STATUS_DET = :STATUS_DET,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  RECARGA = :RECARGA,'
      '  CANT_UNIDADES = :CANT_UNIDADES,'
      '  UNIDADID = :UNIDADID'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_DESPACHODET'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 96
    Top = 136
    object tblDespachoDetSERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'DESPACHO.SERIE'
      Required = True
    end
    object tblDespachoDetNUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
      Origin = 'DESPACHO.NUMERO'
      Required = True
    end
    object tblDespachoDetNUM_ORDEN: TFloatField
      FieldName = 'NUM_ORDEN'
      Origin = 'DESPACHO.NUM_ORDEN'
    end
    object tblDespachoDetTIPO_TRN: TSmallintField
      DisplayLabel = 'TipoTrn'
      FieldName = 'TIPO_TRN'
      Origin = 'DESPACHO.TIPO_TRN'
    end
    object tblDespachoDetCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
      Origin = 'DESPACHO.CANTIDAD'
    end
    object tblDespachoDetPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'DESPACHO.PRECIO'
    end
    object tblDespachoDetPORC_DESC_DET: TFloatField
      DisplayLabel = '%Desc.'
      FieldName = 'PORC_DESC_DET'
      Origin = 'DESPACHO.PORC_DESC_DET'
    end
    object tblDespachoDetITBI_DET: TFloatField
      DisplayLabel = 'Itbi'
      FieldName = 'ITBI_DET'
      Origin = 'DESPACHO.ITBI_DET'
    end
    object tblDespachoDetVALOR_BRUTO: TFloatField
      DisplayLabel = 'Valor Bruto'
      FieldName = 'VALOR_BRUTO'
      Origin = 'DESPACHO.VALOR_BRUTO'
    end
    object tblDespachoDetVALOR_TOTAL_DET: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'DESPACHO.VALOR_TOTAL_DET'
    end
    object tblDespachoDetSTATUS_DET: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_DET'
      Origin = 'DESPACHO.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object tblDespachoDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DESPACHO.FECHA_IN'
    end
    object tblDespachoDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DESPACHO.IN_POR'
      Size = 12
    end
    object tblDespachoDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DESPACHO.FECHA_MOD'
    end
    object tblDespachoDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DESPACHO.MOD_POR'
      Size = 12
    end
    object tblDespachoDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DESPACHO.DESCRIPCION'
      Size = 60
    end
    object tblDespachoDetRECARGA: TFloatField
      FieldName = 'RECARGA'
      Origin = 'DESPACHO.RECARGA'
    end
    object tblDespachoDetCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'DESPACHO.CODIGO_PROD'
    end
  end
  object IBStoredProc1: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_ACTUALIZAINVENTARIO'
    Left = 48
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO_PRODUCTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUEVACANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPOTRN'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'PORCODIGO'
        ParamType = ptInput
      end>
  end
  object qryBalanceDespacho: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from Balance_despacho'
      'where'
      '  CODIGO_EMP = :OLD_CODIGO_EMP and'
      '  CODIGO_RUTA = :OLD_CODIGO_RUTA and'
      '  CODIGO_PRODUCTO = :OLD_CODIGO_PRODUCTO')
    InsertSQL.Strings = (
      'insert into Balance_despacho'
      
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
      'from Balance_despacho '
      'where'
      '  CODIGO_EMP = :CODIGO_EMP and'
      '  CODIGO_RUTA = :CODIGO_RUTA and'
      '  CODIGO_PRODUCTO = :CODIGO_PRODUCTO')
    SelectSQL.Strings = (
      'Select  *'
      '  From Balance_despacho '
      'order by codigo_emp, codigo_ruta, codigo_producto')
    ModifySQL.Strings = (
      'update Balance_despacho'
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
    Left = 216
    Top = 152
    object qryBalanceDespachoCODIGO_EMP: TIntegerField
      DisplayLabel = 'CodEmp'
      FieldName = 'CODIGO_EMP'
      Origin = 'BALANCE_DESPACHO.CODIGO_EMP'
      Required = True
    end
    object qryBalanceDespachoCODIGO_RUTA: TIntegerField
      DisplayLabel = 'CodRuta'
      FieldName = 'CODIGO_RUTA'
      Origin = 'BALANCE_DESPACHO.CODIGO_RUTA'
      Required = True
    end
    object qryBalanceDespachoCODIGO_PRODUCTO: TIntegerField
      DisplayLabel = 'CodProducto'
      FieldName = 'CODIGO_PRODUCTO'
      Origin = 'BALANCE_DESPACHO.CODIGO_PRODUCTO'
      Required = True
    end
    object qryBalanceDespachoBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'BALANCE_DESPACHO.BALANCE_ACT'
    end
    object qryBalanceDespachoBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'BALANCE_DESPACHO.BALANCE_ANT'
    end
    object qryBalanceDespachoDEBITO_MES: TFloatField
      FieldName = 'DEBITO_MES'
      Origin = 'BALANCE_DESPACHO.DEBITO_MES'
    end
    object qryBalanceDespachoCREDITO_MES: TFloatField
      FieldName = 'CREDITO_MES'
      Origin = 'BALANCE_DESPACHO.CREDITO_MES'
    end
    object qryBalanceDespachoDEBITO_ACM: TFloatField
      FieldName = 'DEBITO_ACM'
      Origin = 'BALANCE_DESPACHO.DEBITO_ACM'
    end
    object qryBalanceDespachoCREDITO_ACM: TFloatField
      FieldName = 'CREDITO_ACM'
      Origin = 'BALANCE_DESPACHO.CREDITO_ACM'
    end
    object qryBalanceDespachoFECHA_BCE: TDateTimeField
      FieldName = 'FECHA_BCE'
      Origin = 'BALANCE_DESPACHO.FECHA_BCE'
    end
    object qryBalanceDespachoFECHA_ULT_PAGO: TDateTimeField
      FieldName = 'FECHA_ULT_PAGO'
      Origin = 'BALANCE_DESPACHO.FECHA_ULT_PAGO'
    end
    object qryBalanceDespachoSTATUS_BCE: TIBStringField
      FieldName = 'STATUS_BCE'
      Origin = 'BALANCE_DESPACHO.STATUS_BCE'
      FixedChar = True
      Size = 1
    end
    object qryBalanceDespachoFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'BALANCE_DESPACHO.FECHA_IN'
    end
    object qryBalanceDespachoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'BALANCE_DESPACHO.IN_POR'
      Size = 12
    end
    object qryBalanceDespachoFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'BALANCE_DESPACHO.FECHA_MOD'
    end
    object qryBalanceDespachoMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'BALANCE_DESPACHO.MOD_POR'
      Size = 12
    end
  end
  object tblTipoDespacho: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_DESPACHO'
    Left = 216
    Top = 200
  end
  object dstblTipoDespacho: TDataSource
    DataSet = tblTipoDespacho
    Left = 120
    Top = 216
  end
  object qryEmpleados: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT e.NOMBRE||" "|| e.APELLIDO NOMBRE, '
      'e.CODIGO, r.codigo ruta'
      'FROM EMPLEADO e, ruta r'
      'WHERE e.STATUS = "A"'
      'And  e.codigo = r.codigo_emp')
    Left = 136
    Top = 56
    object qryEmpleadosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 71
    end
    object qryEmpleadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMPLEADO.CODIGO'
      Required = True
    end
    object qryEmpleadosRUTA: TIntegerField
      FieldName = 'RUTA'
      Origin = 'RUTA.CODIGO'
      Required = True
    end
  end
  object GenNumFactura: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'SELECT PROXIMO_NUM '
      'FROM VIEW_GEN_NUM_FACT')
    Transaction = dmConectar.IBTransaction1
    Left = 216
    Top = 248
  end
  object tblDespachoMasterRep: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblDespachoMasterRepAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From DESPACHO_MASTER'
      'Where num_conduce =:numero'
      'And codigo_prov =:codprov')
    Left = 216
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codprov'
        ParamType = ptInput
      end>
    object tblDespachoMasterRepNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DESPACHO_MASTER.NUMERO'
      Required = True
    end
    object tblDespachoMasterRepFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DESPACHO_MASTER.FECHA'
    end
    object tblDespachoMasterRepTIPO_TRN: TSmallintField
      FieldName = 'TIPO_TRN'
      Origin = 'DESPACHO_MASTER.TIPO_TRN'
    end
    object tblDespachoMasterRepCODIGO_DESPACHADOR: TIntegerField
      FieldName = 'CODIGO_DESPACHADOR'
      Origin = 'DESPACHO_MASTER.CODIGO_DESPACHADOR'
    end
    object tblDespachoMasterRepCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'DESPACHO_MASTER.CODIGO_EMP'
    end
    object tblDespachoMasterRepMONTO_TOTAL: TFloatField
      FieldName = 'MONTO_TOTAL'
      Origin = 'DESPACHO_MASTER.MONTO_TOTAL'
    end
    object tblDespachoMasterRepNUM_ORDEN: TFloatField
      FieldName = 'NUM_ORDEN'
      Origin = 'DESPACHO_MASTER.NUM_ORDEN'
    end
    object tblDespachoMasterRepSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DESPACHO_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblDespachoMasterRepFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DESPACHO_MASTER.FECHA_IN'
    end
    object tblDespachoMasterRepIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DESPACHO_MASTER.IN_POR'
      Size = 12
    end
    object tblDespachoMasterRepFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DESPACHO_MASTER.FECHA_MOD'
    end
    object tblDespachoMasterRepMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DESPACHO_MASTER.MOD_POR'
      Size = 12
    end
    object tblDespachoMasterRepCODIGO_RUTA: TIntegerField
      FieldName = 'CODIGO_RUTA'
      Origin = 'DESPACHO_MASTER.CODIGO_RUTA'
    end
    object tblDespachoMasterRepNUM_CONDUCE: TIntegerField
      FieldName = 'NUM_CONDUCE'
      Origin = 'DESPACHO_MASTER.NUM_CONDUCE'
    end
    object tblDespachoMasterRepCODIGO_PROV: TIntegerField
      FieldName = 'CODIGO_PROV'
      Origin = 'DESPACHO_MASTER.CODIGO_PROV'
    end
  end
  object QryRepDespachoDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from DESPACHO'
      'where NUMERO =:numero')
    Left = 80
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object QryRepDespachoDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DESPACHO.SERIE'
      Required = True
    end
    object QryRepDespachoDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DESPACHO.NUMERO'
      Required = True
    end
    object QryRepDespachoDetTIPO_TRN: TSmallintField
      FieldName = 'TIPO_TRN'
      Origin = 'DESPACHO.TIPO_TRN'
    end
    object QryRepDespachoDetCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'DESPACHO.CODIGO_PROD'
    end
    object QryRepDespachoDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'DESPACHO.CANTIDAD'
    end
    object QryRepDespachoDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'DESPACHO.PRECIO'
    end
    object QryRepDespachoDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'DESPACHO.PORC_DESC_DET'
    end
    object QryRepDespachoDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'DESPACHO.ITBI_DET'
    end
    object QryRepDespachoDetVALOR_BRUTO: TFloatField
      FieldName = 'VALOR_BRUTO'
      Origin = 'DESPACHO.VALOR_BRUTO'
    end
    object QryRepDespachoDetVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'DESPACHO.VALOR_TOTAL_DET'
    end
    object QryRepDespachoDetNUM_ORDEN: TFloatField
      FieldName = 'NUM_ORDEN'
      Origin = 'DESPACHO.NUM_ORDEN'
    end
    object QryRepDespachoDetSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'DESPACHO.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object QryRepDespachoDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DESPACHO.FECHA_IN'
    end
    object QryRepDespachoDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DESPACHO.IN_POR'
      Size = 12
    end
    object QryRepDespachoDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DESPACHO.FECHA_MOD'
    end
    object QryRepDespachoDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DESPACHO.MOD_POR'
      Size = 12
    end
    object QryRepDespachoDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DESPACHO.DESCRIPCION'
      Size = 60
    end
    object QryRepDespachoDetRECARGA: TFloatField
      FieldName = 'RECARGA'
      Origin = 'DESPACHO.RECARGA'
    end
  end
  object tblDespachoMasterRepA: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblDespachoMasterRepAAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From DESPACHO_MASTER'
      'Where SERIE_INV_ID  =:serieInvID'
      'And INV_ID_ORIGEN   =:INVIDORIGEN'
      'And INV_ID_DESTINO =:INVIDestino')
    Left = 200
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'serieInvID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INVIDORIGEN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INVIDestino'
        ParamType = ptInput
      end>
    object tblDespachoMasterRepANUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DESPACHO_MASTER.NUMERO'
      Required = True
    end
    object tblDespachoMasterRepAFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DESPACHO_MASTER.FECHA'
    end
    object tblDespachoMasterRepATIPO_TRN: TSmallintField
      FieldName = 'TIPO_TRN'
      Origin = 'DESPACHO_MASTER.TIPO_TRN'
    end
    object tblDespachoMasterRepACODIGO_DESPACHADOR: TIntegerField
      FieldName = 'CODIGO_DESPACHADOR'
      Origin = 'DESPACHO_MASTER.CODIGO_DESPACHADOR'
    end
    object tblDespachoMasterRepACODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'DESPACHO_MASTER.CODIGO_EMP'
    end
    object tblDespachoMasterRepAMONTO_TOTAL: TFloatField
      FieldName = 'MONTO_TOTAL'
      Origin = 'DESPACHO_MASTER.MONTO_TOTAL'
    end
    object tblDespachoMasterRepANUM_ORDEN: TFloatField
      FieldName = 'NUM_ORDEN'
      Origin = 'DESPACHO_MASTER.NUM_ORDEN'
    end
    object tblDespachoMasterRepASTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DESPACHO_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblDespachoMasterRepAFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DESPACHO_MASTER.FECHA_IN'
    end
    object tblDespachoMasterRepAIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DESPACHO_MASTER.IN_POR'
      Size = 12
    end
    object tblDespachoMasterRepAFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DESPACHO_MASTER.FECHA_MOD'
    end
    object tblDespachoMasterRepAMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DESPACHO_MASTER.MOD_POR'
      Size = 12
    end
    object tblDespachoMasterRepACODIGO_RUTA: TIntegerField
      FieldName = 'CODIGO_RUTA'
      Origin = 'DESPACHO_MASTER.CODIGO_RUTA'
    end
    object tblDespachoMasterRepANUM_CONDUCE: TIntegerField
      FieldName = 'NUM_CONDUCE'
      Origin = 'DESPACHO_MASTER.NUM_CONDUCE'
    end
    object tblDespachoMasterRepACODIGO_PROV: TIntegerField
      FieldName = 'CODIGO_PROV'
      Origin = 'DESPACHO_MASTER.CODIGO_PROV'
    end
    object tblDespachoMasterRepANCF: TIBStringField
      FieldName = 'NCF'
      Origin = 'DESPACHO_MASTER.NCF'
      Size = 21
    end
    object tblDespachoMasterRepARNC_PROVEEDOR: TIBStringField
      FieldName = 'RNC_PROVEEDOR'
      Origin = 'DESPACHO_MASTER.RNC_PROVEEDOR'
      Size = 15
    end
    object tblDespachoMasterRepAINVENTARIO_ID: TIntegerField
      FieldName = 'INVENTARIO_ID'
      Origin = 'DESPACHO_MASTER.INVENTARIO_ID'
    end
    object tblDespachoMasterRepASERIE_INV_ID: TIntegerField
      FieldName = 'SERIE_INV_ID'
      Origin = 'DESPACHO_MASTER.SERIE_INV_ID'
    end
    object tblDespachoMasterRepAINV_ID_ORIGEN: TIntegerField
      FieldName = 'INV_ID_ORIGEN'
      Origin = 'DESPACHO_MASTER.INV_ID_ORIGEN'
    end
    object tblDespachoMasterRepAINV_ID_DESTINO: TIntegerField
      FieldName = 'INV_ID_DESTINO'
      Origin = 'DESPACHO_MASTER.INV_ID_DESTINO'
    end
  end
end
