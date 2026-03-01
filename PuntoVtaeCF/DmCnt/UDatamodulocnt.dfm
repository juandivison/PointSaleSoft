object dmCnt: TdmCnt
  OldCreateOrder = False
  Left = 462
  Top = 148
  Height = 423
  Width = 626
  object qryMastertrncnt: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryMastertrncntAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TRNCNT_MASTER'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into TRNCNT_MASTER'
      
        '  (NUMERO, FECHA, CIA_KEY, TIPO_DOC, DESCRIPCION, MONTO, STATUS,' +
        ' IN_POR, '
      '   FECHA_IN, MOD_POR, FECHA_MOD)'
      'values'
      
        '  (:NUMERO, :FECHA, :CIA_KEY, :TIPO_DOC, :DESCRIPCION, :MONTO, :' +
        'STATUS, '
      '   :IN_POR, :FECHA_IN, :MOD_POR, :FECHA_MOD)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA,'
      '  CIA_KEY,'
      '  TIPO_DOC,'
      '  DESCRIPCION,'
      '  MONTO,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD'
      'from TRNCNT_MASTER '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM TRNCNT_MASTER Trncnt_master'
      'WHERE FECHA between :fechaini and :fechafin'
      'order by  NUMERO, fecha')
    ModifySQL.Strings = (
      'update TRNCNT_MASTER'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  CIA_KEY = :CIA_KEY,'
      '  TIPO_DOC = :TIPO_DOC,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  MONTO = :MONTO,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_NUMERO_TRNCNT_MASTER'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 96
    Top = 32
    object qryMastertrncntNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TRNCNT_MASTER.NUMERO'
      Required = True
    end
    object qryMastertrncntFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'TRNCNT_MASTER.FECHA'
      Required = True
    end
    object qryMastertrncntTIPO_DOC: TSmallintField
      FieldName = 'TIPO_DOC'
      Origin = 'TRNCNT_MASTER.TIPO_DOC'
      Required = True
    end
    object qryMastertrncntDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TRNCNT_MASTER.DESCRIPCION'
      Size = 40
    end
    object qryMastertrncntMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'TRNCNT_MASTER.MONTO'
    end
    object qryMastertrncntSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRNCNT_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryMastertrncntIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TRNCNT_MASTER.IN_POR'
      Size = 12
    end
    object qryMastertrncntFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TRNCNT_MASTER.FECHA_IN'
    end
    object qryMastertrncntMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'TRNCNT_MASTER.MOD_POR'
      Size = 12
    end
    object qryMastertrncntFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'TRNCNT_MASTER.FECHA_MOD'
    end
    object qryMastertrncntCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'TRNCNT_MASTER.CIA_KEY'
    end
  end
  object qryDetTrnCnt: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TRNCNT_DETALLE'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into TRNCNT_DETALLE'
      
        '  (SERIE, NUMERO, CODIGO_DEPTO, DESCRIPCION_TRN, DEBITO_TRN, CRE' +
        'DITO_TRN, '
      
        '   CUENTA1, CUENTA2, CUENTA3, STATUS_APLICADA, STATUS, IN_POR, F' +
        'ECHA_IN, '
      
        '   MOD_POR, FECHA_MOD, NUM_DOC, COD_CTA_CONCEPTO, CODIGO_CENTRO_' +
        'COSTO)'
      'values'
      
        '  (:SERIE, :NUMERO, :CODIGO_DEPTO, :DESCRIPCION_TRN, :DEBITO_TRN' +
        ', :CREDITO_TRN, '
      
        '   :CUENTA1, :CUENTA2, :CUENTA3, :STATUS_APLICADA, :STATUS, :IN_' +
        'POR, :FECHA_IN, '
      
        '   :MOD_POR, :FECHA_MOD, :NUM_DOC, :COD_CTA_CONCEPTO, :CODIGO_CE' +
        'NTRO_COSTO)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  CODIGO_DEPTO,'
      '  DESCRIPCION_TRN,'
      '  DEBITO_TRN,'
      '  CREDITO_TRN,'
      '  CUENTA1,'
      '  CUENTA2,'
      '  CUENTA3,'
      '  STATUS_APLICADA,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD,'
      '  NUM_DOC,'
      '  COD_CTA_CONCEPTO,'
      '  CODIGO_CENTRO_COSTO'
      'from TRNCNT_DETALLE '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM TRNCNT_DETALLE Trncnt_detalle'
      'WHERE NUMERO = :NUMERO'
      'order by serie')
    ModifySQL.Strings = (
      'update TRNCNT_DETALLE'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  CODIGO_DEPTO = :CODIGO_DEPTO,'
      '  DESCRIPCION_TRN = :DESCRIPCION_TRN,'
      '  DEBITO_TRN = :DEBITO_TRN,'
      '  CREDITO_TRN = :CREDITO_TRN,'
      '  CUENTA1 = :CUENTA1,'
      '  CUENTA2 = :CUENTA2,'
      '  CUENTA3 = :CUENTA3,'
      '  STATUS_APLICADA = :STATUS_APLICADA,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  NUM_DOC = :NUM_DOC,'
      '  COD_CTA_CONCEPTO = :COD_CTA_CONCEPTO,'
      '  CODIGO_CENTRO_COSTO = :CODIGO_CENTRO_COSTO'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_NUMERO_TRNCNT_DETALLE'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 192
    Top = 32
    object qryDetTrnCntSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'TRNCNT_DETALLE.SERIE'
      Required = True
    end
    object qryDetTrnCntNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TRNCNT_DETALLE.NUMERO'
      Required = True
    end
    object qryDetTrnCntCODIGO_DEPTO: TIntegerField
      FieldName = 'CODIGO_DEPTO'
      Origin = 'TRNCNT_DETALLE.CODIGO_DEPTO'
      Required = True
    end
    object qryDetTrnCntDESCRIPCION_TRN: TIBStringField
      FieldName = 'DESCRIPCION_TRN'
      Origin = 'TRNCNT_DETALLE.DESCRIPCION_TRN'
      Size = 40
    end
    object qryDetTrnCntCREDITO_TRN: TFloatField
      FieldName = 'CREDITO_TRN'
      Origin = 'TRNCNT_DETALLE.CREDITO_TRN'
    end
    object qryDetTrnCntDEBITO_TRN: TFloatField
      FieldName = 'DEBITO_TRN'
      Origin = 'TRNCNT_DETALLE.DEBITO_TRN'
    end
    object qryDetTrnCntCUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Origin = 'TRNCNT_DETALLE.CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryDetTrnCntCUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Origin = 'TRNCNT_DETALLE.CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryDetTrnCntCUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Origin = 'TRNCNT_DETALLE.CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryDetTrnCntSTATUS_APLICADA: TIBStringField
      FieldName = 'STATUS_APLICADA'
      Origin = 'TRNCNT_DETALLE.STATUS_APLICADA'
      FixedChar = True
      Size = 1
    end
    object qryDetTrnCntSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRNCNT_DETALLE.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDetTrnCntIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TRNCNT_DETALLE.IN_POR'
      Size = 12
    end
    object qryDetTrnCntFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TRNCNT_DETALLE.FECHA_IN'
    end
    object qryDetTrnCntMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'TRNCNT_DETALLE.MOD_POR'
      Size = 12
    end
    object qryDetTrnCntFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'TRNCNT_DETALLE.FECHA_MOD'
    end
    object qryDetTrnCntNUM_DOC: TFloatField
      FieldName = 'NUM_DOC'
      Origin = 'TRNCNT_DETALLE.NUM_DOC'
    end
    object qryDetTrnCntCOD_CTA_CONCEPTO: TIntegerField
      FieldName = 'COD_CTA_CONCEPTO'
      Origin = 'TRNCNT_DETALLE.COD_CTA_CONCEPTO'
    end
    object qryDetTrnCntCODIGO_CENTRO_COSTO: TIntegerField
      FieldName = 'CODIGO_CENTRO_COSTO'
      Origin = 'TRNCNT_DETALLE.CODIGO_CENTRO_COSTO'
    end
  end
  object dtqryDetTrnCnt: TDataSource
    DataSet = qryDetTrnCnt
    Left = 192
    Top = 80
  end
  object dtqryMastertrncnt: TDataSource
    DataSet = qryMastertrncnt
    Left = 80
    Top = 80
  end
  object rxTotales: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Credito'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'Debito'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'rxBceAnt'
        DataType = ftFloat
      end
      item
        Name = 'rxBceAct'
        DataType = ftFloat
      end
      item
        Name = 'rxDbmes'
        DataType = ftFloat
      end
      item
        Name = 'rxCrmes'
        DataType = ftFloat
      end
      item
        Name = 'rxDbAcm'
        DataType = ftFloat
      end
      item
        Name = 'rxCrAcm'
        DataType = ftFloat
      end>
    OnCalcFields = rxTotalesCalcFields
    Left = 39
    Top = 147
    object rxTotalesrxBceAnt: TFloatField
      DisplayLabel = 'Bce Ant'
      FieldName = 'rxBceAnt'
      DisplayFormat = ',0.00'
    end
    object rxTotalesrxBceAct: TFloatField
      DisplayLabel = 'Bce Act'
      FieldName = 'rxBceAct'
      DisplayFormat = ',0.00'
    end
    object rxTotalesrxDbmes: TFloatField
      DisplayLabel = 'Db Mes'
      FieldName = 'rxDbmes'
      DisplayFormat = ',0.00'
    end
    object rxTotalesrxCrmes: TFloatField
      DisplayLabel = 'CR Mes'
      FieldName = 'rxCrmes'
      DisplayFormat = ',0.00'
    end
    object rxTotalesrxDbAcm: TFloatField
      DisplayLabel = 'Db Acum.'
      FieldName = 'rxDbAcm'
      DisplayFormat = ',0.00'
    end
    object rxTotalesrxCrAcm: TFloatField
      DisplayLabel = 'CR Acm.'
      FieldName = 'rxCrAcm'
      DisplayFormat = ',0.00'
    end
    object rxTotalesDiferencia: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Diferencia'
      Calculated = True
    end
    object rxTotalesCredito: TFloatField
      FieldName = 'Credito'
    end
    object rxTotalesDebito: TFloatField
      FieldName = 'Debito'
    end
  end
  object tblDistCntCheques: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    TableName = ' DIST_CTASCHEQUES'
    Left = 294
    Top = 20
    object tblDistCntChequesMODULO: TIBStringField
      FieldName = 'MODULO'
      Size = 35
    end
    object tblDistCntChequesSIGNO: TSmallintField
      FieldName = 'SIGNO'
    end
    object tblDistCntChequesCUENTA_CNT: TIBStringField
      FieldName = 'CUENTA_CNT'
      Size = 9
    end
    object tblDistCntChequesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object tblDist_cntFacturas: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DIST_CNTFACTURAS'
    Left = 296
    Top = 80
    object tblDist_cntFacturasMODULO: TIBStringField
      FieldName = 'MODULO'
      Size = 35
    end
    object tblDist_cntFacturasAREA_CTA: TSmallintField
      FieldName = 'AREA_CTA'
    end
    object tblDist_cntFacturasCUENTA: TIBStringField
      FieldName = 'CUENTA'
      Size = 9
    end
    object tblDist_cntFacturasCODIGO_PROV: TIntegerField
      FieldName = 'CODIGO_PROV'
    end
    object tblDist_cntFacturasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object dstblDist_cntFacturas: TDataSource
    DataSet = tblDist_cntFacturas
    Left = 296
    Top = 136
  end
  object qryProveedor: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from Proveedores'
      'ORDER BY TIPOCXP, CODIGO_CTE')
    Left = 104
    Top = 168
    object qryProveedorCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROVEEDORES.CODIGO_CTE'
      Required = True
    end
    object qryProveedorTIPO_CLIENTE: TIntegerField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'PROVEEDORES.TIPO_CLIENTE'
    end
    object qryProveedorNOMBRE_ABR: TIBStringField
      FieldName = 'NOMBRE_ABR'
      Origin = 'PROVEEDORES.NOMBRE_ABR'
      Size = 60
    end
    object qryProveedorDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object qryProveedorCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'PROVEEDORES.CONTACTO'
      Size = 35
    end
    object qryProveedorPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PROVEEDORES.PAIS'
      Size = 30
    end
    object qryProveedorESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'PROVEEDORES.ESTADO'
      Size = 30
    end
    object qryProveedorCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROVEEDORES.CIUDAD'
    end
    object qryProveedorCALYYNUM: TIBStringField
      FieldName = 'CALYYNUM'
      Origin = 'PROVEEDORES.CALYYNUM'
      Size = 80
    end
    object qryProveedorTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object qryProveedorFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'PROVEEDORES.FAX'
      Size = 12
    end
    object qryProveedorCODIGOPOSTAL: TIBStringField
      FieldName = 'CODIGOPOSTAL'
      Origin = 'PROVEEDORES.CODIGOPOSTAL'
      FixedChar = True
      Size = 6
    end
    object qryProveedorEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'PROVEEDORES.EMAIL'
      Size = 40
    end
    object qryProveedorDIRECCIONWEB: TIBStringField
      FieldName = 'DIRECCIONWEB'
      Origin = 'PROVEEDORES.DIRECCIONWEB'
      Size = 40
    end
    object qryProveedorSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROVEEDORES.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryProveedorFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PROVEEDORES.FECHA_IN'
    end
    object qryProveedorIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PROVEEDORES.IN_POR'
      Size = 12
    end
    object qryProveedorFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PROVEEDORES.FECHA_MOD'
    end
    object qryProveedorMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PROVEEDORES.MOD_POR'
      Size = 12
    end
    object qryProveedorRNC_PROVEEDOR: TIBStringField
      FieldName = 'RNC_PROVEEDOR'
      Origin = 'PROVEEDORES.RNC_PROVEEDOR'
      Size = 15
    end
    object qryProveedorMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'PROVEEDORES.MOVIL1'
    end
    object qryProveedorMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'PROVEEDORES.MOVIL2'
    end
    object qryProveedorTELEFONO2: TIBStringField
      FieldName = 'TELEFONO2'
      Origin = 'PROVEEDORES.TELEFONO2'
    end
    object qryProveedorTELEFONO3: TIBStringField
      FieldName = 'TELEFONO3'
      Origin = 'PROVEEDORES.TELEFONO3'
    end
    object qryProveedorEXTENSIONES: TIBStringField
      FieldName = 'EXTENSIONES'
      Origin = 'PROVEEDORES.EXTENSIONES'
      Size = 40
    end
    object qryProveedorCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'PROVEEDORES.CIA_KEY'
    end
    object qryProveedorTIPOCXP: TIntegerField
      FieldName = 'TIPOCXP'
      Origin = 'PROVEEDORES.TIPOCXP'
    end
  end
  object dsqryProveedor: TDataSource
    DataSet = qryProveedor
    Left = 112
    Top = 232
  end
  object rxTotal: TRxMemoryData
    FieldDefs = <
      item
        Name = 'MontoTotal'
        DataType = ftCurrency
      end
      item
        Name = 'MontoPosteoaCxp'
        DataType = ftCurrency
      end>
    Left = 252
    Top = 248
    object rxTotalMontoTotal: TCurrencyField
      FieldName = 'MontoTotal'
      DisplayFormat = ',0.00'
    end
    object rxTotalMontoPosteoaCxp: TCurrencyField
      FieldName = 'MontoPosteoaCxp'
    end
  end
  object dsrxTotal: TDataSource
    DataSet = rxTotal
    Left = 184
    Top = 264
  end
end
