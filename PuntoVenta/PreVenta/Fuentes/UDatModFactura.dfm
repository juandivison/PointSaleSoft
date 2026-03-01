object dmFactura: TdmFactura
  OldCreateOrder = False
  Left = 265
  Top = 99
  Height = 629
  Width = 1032
  object IBDataSetFacturas: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from FACTURAS'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  NUMERO = :OLD_NUMERO and'
      '  MONEDA = :OLD_MONEDA and'
      '  TIPO = :OLD_TIPO')
    InsertSQL.Strings = (
      'insert into FACTURAS'
      
        '  (SERIE, NUMERO, MONEDA, TIPO, CODIGO_CTE, FECHA, DESCRIPCION, ' +
        'MONTO_FACT, '
      
        '   RCXC, RCNT, STATUS, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, FEC' +
        'HA_VENCE)'
      'values'
      
        '  (:SERIE, :NUMERO, :MONEDA, :TIPO, :CODIGO_CTE, :FECHA, :DESCRI' +
        'PCION, '
      
        '   :MONTO_FACT, :RCXC, :RCNT, :STATUS, :FECHA_IN, :IN_POR, :FECH' +
        'A_MOD, '
      '   :MOD_POR, :FECHA_VENCE)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  MONEDA,'
      '  TIPO,'
      '  CODIGO_CTE,'
      '  FECHA,'
      '  DESCRIPCION,'
      '  MONTO_FACT,'
      '  RCXC,'
      '  RCNT,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  FECHA_VENCE'
      'from FACTURAS '
      'where'
      '  SERIE = :SERIE and'
      '  NUMERO = :NUMERO and'
      '  MONEDA = :MONEDA and'
      '  TIPO = :TIPO')
    SelectSQL.Strings = (
      'select  * from FACTURAS'
      'Where fecha between :fechaIni And :fechaFin')
    ModifySQL.Strings = (
      'update FACTURAS'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  MONEDA = :MONEDA,'
      '  TIPO = :TIPO,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  FECHA = :FECHA,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  MONTO_FACT = :MONTO_FACT,'
      '  RCXC = :RCXC,'
      '  RCNT = :RCNT,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_VENCE = :FECHA_VENCE'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  NUMERO = :OLD_NUMERO and'
      '  MONEDA = :OLD_MONEDA and'
      '  TIPO = :OLD_TIPO')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_FACTURA'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 48
    Top = 32
    object IBDataSetFacturasSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'FACTURAS.SERIE'
      Required = True
    end
    object IBDataSetFacturasNUMERO: TFloatField
      FieldName = 'NUMERO'
      Origin = 'FACTURAS.NUMERO'
      Required = True
    end
    object IBDataSetFacturasMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'FACTURAS.MONEDA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IBDataSetFacturasTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'FACTURAS.TIPO'
      Required = True
    end
    object IBDataSetFacturasCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'FACTURAS.CODIGO_CTE'
    end
    object IBDataSetFacturasFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FACTURAS.FECHA'
    end
    object IBDataSetFacturasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'FACTURAS.DESCRIPCION'
      Size = 40
    end
    object IBDataSetFacturasMONTO_FACT: TFloatField
      FieldName = 'MONTO_FACT'
      Origin = 'FACTURAS.MONTO_FACT'
    end
    object IBDataSetFacturasRCXC: TIBStringField
      FieldName = 'RCXC'
      Origin = 'FACTURAS.RCXC'
      FixedChar = True
      Size = 1
    end
    object IBDataSetFacturasRCNT: TIBStringField
      FieldName = 'RCNT'
      Origin = 'FACTURAS.RCNT'
      FixedChar = True
      Size = 1
    end
    object IBDataSetFacturasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FACTURAS.STATUS'
      FixedChar = True
      Size = 1
    end
    object IBDataSetFacturasFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'FACTURAS.FECHA_IN'
    end
    object IBDataSetFacturasIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'FACTURAS.IN_POR'
      Size = 12
    end
    object IBDataSetFacturasFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'FACTURAS.FECHA_MOD'
    end
    object IBDataSetFacturasMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'FACTURAS.MOD_POR'
      Size = 12
    end
    object IBDataSetFacturasFECHA_VENCE: TDateTimeField
      FieldName = 'FECHA_VENCE'
      Origin = 'FACTURAS.FECHA_VENCE'
    end
  end
  object dtIBDataSetFacturas: TDataSource
    DataSet = IBDataSetFacturas
    Left = 48
    Top = 80
  end
  object IBDatosFctPago: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from FACTURA'
      'where'
      '  NUMERO = :OLD_NUMERO and'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  MONEDA,'
      '  TIPO,'
      '  CODIGO_CTE,'
      '  FECHA,'
      '  DESCRIPCION,'
      '  MONTO_FACT,'
      '  RCXC,'
      '  RCNT,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from FACTURA '
      'where'
      '  NUMERO = :NUMERO and'
      '  CODIGO_CTE = :CODIGO_CTE')
    SelectSQL.Strings = (
      'SELECT Fecha, Numero, Monto_Fact FROM  FACTURA'
      'WHERE CODIGO_CTE = :CODIGO')
    ModifySQL.Strings = (
      'update FACTURA'
      'set'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  MONTO_FACT = :MONTO_FACT'
      'where'
      '  NUMERO = :OLD_NUMERO and'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    Left = 48
    Top = 143
    object IBDatosFctPagoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'FACTURA.FECHA'
    end
    object IBDatosFctPagoNUMERO: TIntegerField
      DisplayLabel = 'Numero Factura'
      FieldName = 'NUMERO'
      Origin = 'FACTURA.NUMERO'
      Required = True
    end
    object IBDatosFctPagoMONTO_FACT: TFloatField
      DisplayLabel = 'Monto'
      FieldName = 'MONTO_FACT'
      Origin = 'FACTURA.MONTO_FACT'
    end
  end
  object dtIBDatosFctPago: TDataSource
    DataSet = IBDatosFctPago
    Left = 48
    Top = 192
  end
  object IBDataSetPagoFct: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PagoFactura'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into PagoFactura'
      
        '  (SERIE, NUMERO_FACTURA, NUMERO_RECIBO, MONTO_PAGADO, STATUS, F' +
        'ECHA_IN, '
      '   IN_POR, FECHA_MOD, MOD_POR)'
      'values'
      
        '  (:SERIE, :NUMERO_FACTURA, :NUMERO_RECIBO, :MONTO_PAGADO, :STAT' +
        'US, :FECHA_IN, '
      '   :IN_POR, :FECHA_MOD, :MOD_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO_FACTURA,'
      '  NUMERO_RECIBO,'
      '  MONTO_PAGADO,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from PagoFactura '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * from PagoFactura')
    ModifySQL.Strings = (
      'update PagoFactura'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO_FACTURA = :NUMERO_FACTURA,'
      '  NUMERO_RECIBO = :NUMERO_RECIBO,'
      '  MONTO_PAGADO = :MONTO_PAGADO,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 168
    Top = 144
    object IBDataSetPagoFctSERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'PAGOFACTURA.SERIE'
      Required = True
    end
    object IBDataSetPagoFctNUMERO_FACTURA: TIntegerField
      DisplayLabel = '#Factura'
      FieldName = 'NUMERO_FACTURA'
      Origin = 'PAGOFACTURA.NUMERO_FACTURA'
    end
    object IBDataSetPagoFctNUMERO_RECIBO: TIntegerField
      DisplayLabel = '#Recibo'
      FieldName = 'NUMERO_RECIBO'
      Origin = 'PAGOFACTURA.NUMERO_RECIBO'
    end
    object IBDataSetPagoFctMONTO_PAGADO: TFloatField
      DisplayLabel = 'Monto'
      FieldName = 'MONTO_PAGADO'
      Origin = 'PAGOFACTURA.MONTO_PAGADO'
    end
    object IBDataSetPagoFctSTATUS: TIBStringField
      DisplayLabel = 'St'
      FieldName = 'STATUS'
      Origin = 'PAGOFACTURA.STATUS'
      FixedChar = True
      Size = 1
    end
    object IBDataSetPagoFctFECHA_IN: TDateTimeField
      DisplayLabel = 'FechaIn'
      FieldName = 'FECHA_IN'
      Origin = 'PAGOFACTURA.FECHA_IN'
    end
    object IBDataSetPagoFctIN_POR: TIBStringField
      DisplayLabel = 'InPor'
      FieldName = 'IN_POR'
      Origin = 'PAGOFACTURA.IN_POR'
      Size = 12
    end
    object IBDataSetPagoFctFECHA_MOD: TDateTimeField
      DisplayLabel = 'FechaMod'
      FieldName = 'FECHA_MOD'
      Origin = 'PAGOFACTURA.FECHA_MOD'
    end
    object IBDataSetPagoFctMOD_POR: TIBStringField
      DisplayLabel = 'ModPor'
      FieldName = 'MOD_POR'
      Origin = 'PAGOFACTURA.MOD_POR'
      Size = 12
    end
  end
  object dtIBDataSetPagoFct: TDataSource
    DataSet = IBDataSetPagoFct
    Left = 168
    Top = 192
  end
  object ibQryViewNCF: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select v.id, v.SERIE,'
      'v.IDSEC_2018,v.DESCRIPCION_2018,v.FECHA_VENCE,'
      
        'v.DIV_NEGOCIO,v.PECF,v.AICF,v.TIPO_CF,v.NCF, n.DESCRIPCION, n.TI' +
        'PO_NCF_IFISCAL, n.tipo_ncfNCR From View_nfc v, NCF_TIPO_IFISCAL ' +
        'n '
      'Where v.TIPO_CF = n.TIPO_NCF'
      'order by n.tipo_ncfNCR desc')
    OnFilterRecord = ibQryViewNCFFilterRecord
    Left = 168
    Top = 360
    object ibQryViewNCFID: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ID'
      Origin = 'VIEW_NFC.ID'
      ReadOnly = True
      Size = 42
    end
    object ibQryViewNCFDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VIEW_NFC.DESCRIPCION'
      Size = 60
    end
    object ibQryViewNCFSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'VIEW_NFC.SERIE'
      FixedChar = True
      Size = 1
    end
    object ibQryViewNCFDIV_NEGOCIO: TIBStringField
      FieldName = 'DIV_NEGOCIO'
      Origin = 'VIEW_NFC.DIV_NEGOCIO'
      FixedChar = True
      Size = 2
    end
    object ibQryViewNCFPECF: TIBStringField
      FieldName = 'PECF'
      Origin = 'VIEW_NFC.PECF'
      FixedChar = True
      Size = 3
    end
    object ibQryViewNCFAICF: TIBStringField
      FieldName = 'AICF'
      Origin = 'VIEW_NFC.AICF'
      FixedChar = True
      Size = 3
    end
    object ibQryViewNCFTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Origin = 'VIEW_NFC.TIPO_CF'
      FixedChar = True
      Size = 2
    end
    object ibQryViewNCFNCF: TFloatField
      FieldName = 'NCF'
      Origin = 'VIEW_NFC.NCF'
    end
    object ibQryViewNCFIDSEC_2018: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'IDSEC_2018'
      Origin = 'VIEW_NFC.IDSEC_2018'
      ReadOnly = True
      Size = 11
    end
    object ibQryViewNCFDESCRIPCION_2018: TIBStringField
      FieldName = 'DESCRIPCION_2018'
      Origin = 'VIEW_NFC.DESCRIPCION_2018'
      Size = 60
    end
    object ibQryViewNCFFECHA_VENCE: TDateTimeField
      FieldName = 'FECHA_VENCE'
      Origin = 'VIEW_NFC.FECHA_VENCE'
    end
    object ibQryViewNCFTIPO_NCF_IFISCAL: TIntegerField
      FieldName = 'TIPO_NCF_IFISCAL'
      Origin = 'NCF_TIPO_IFISCAL.TIPO_NCF_IFISCAL'
      Required = True
    end
    object ibQryViewNCFTIPO_NCFNCR: TSmallintField
      FieldName = 'TIPO_NCFNCR'
      Origin = 'NCF_TIPO_IFISCAL.TIPO_NCFNCR'
    end
  end
  object dstblDgii_SerieNCF: TDataSource
    DataSet = tblDgii_SerieNCF
    Left = 168
    Top = 304
  end
  object tblDgii_SerieNCF: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblDgii_SerieNCFAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DGII_SERIE_NFC'
    Left = 167
    Top = 251
    object tblDgii_SerieNCFNCF: TFloatField
      FieldName = 'NCF'
    end
    object tblDgii_SerieNCFFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
    end
    object tblDgii_SerieNCFFECHA_UPD: TDateTimeField
      FieldName = 'FECHA_UPD'
    end
    object tblDgii_SerieNCFACTIVO: TSmallintField
      FieldName = 'ACTIVO'
    end
    object tblDgii_SerieNCFSERIE: TIBStringField
      FieldName = 'SERIE'
      Size = 1
    end
    object tblDgii_SerieNCFDIV_NEGOCIO: TIBStringField
      FieldName = 'DIV_NEGOCIO'
      Size = 2
    end
    object tblDgii_SerieNCFPECF: TIBStringField
      FieldName = 'PECF'
      Size = 3
    end
    object tblDgii_SerieNCFAICF: TIBStringField
      FieldName = 'AICF'
      Size = 3
    end
    object tblDgii_SerieNCFTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Size = 2
    end
  end
  object dsibQryViewNCF: TDataSource
    DataSet = ibQryViewNCF
    Left = 48
    Top = 360
  end
  object dstblTipoCF: TDataSource
    DataSet = tblTipoCF
    Left = 48
    Top = 311
  end
  object tblTipoCF: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_CF'
    Left = 48
    Top = 253
    object tblTipoCFTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Size = 2
    end
    object tblTipoCFDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object QryHistSecNCF: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  *  From CONTROL_SEC_NCF'
      'WHERE IDNCF=:IDNCF'
      'ORDER BY IDNCF, INICIO_SECUECIA')
    Left = 120
    Top = 424
    ParamData = <
      item
        DataType = ftString
        Name = 'IDNCF'
        ParamType = ptInput
      end>
    object QryHistSecNCFID_SERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'ID_SERIE'
      Origin = 'CONTROL_SEC_NCF.ID_SERIE'
      Required = True
    end
    object QryHistSecNCFIDNCF: TIBStringField
      DisplayLabel = 'Ncf'
      FieldName = 'IDNCF'
      Origin = 'CONTROL_SEC_NCF.IDNCF'
      Required = True
      Size = 2
    end
    object QryHistSecNCFINICIO_SECUECIA: TIntegerField
      DisplayLabel = 'Ncf Inicial'
      FieldName = 'INICIO_SECUECIA'
      Origin = 'CONTROL_SEC_NCF.INICIO_SECUECIA'
    end
    object QryHistSecNCFFIN_SECUENCIA: TIntegerField
      DisplayLabel = 'Ncf Final'
      FieldName = 'FIN_SECUENCIA'
      Origin = 'CONTROL_SEC_NCF.FIN_SECUENCIA'
    end
    object QryHistSecNCFFECHA_ASIGNACION: TDateTimeField
      DisplayLabel = 'Fecha Asignado'
      FieldName = 'FECHA_ASIGNACION'
      Origin = 'CONTROL_SEC_NCF.FECHA_ASIGNACION'
    end
  end
  object tblQryHistoricoSecNCF: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CONTROL_SEC_NCF'
      'where'
      '  ID_SERIE = :OLD_ID_SERIE')
    InsertSQL.Strings = (
      'insert into CONTROL_SEC_NCF'
      
        '  (ID_SERIE, IDNCF, INICIO_SECUECIA, FIN_SECUENCIA, FECHA_ASIGNA' +
        'CION)'
      'values'
      
        '  (:ID_SERIE, :IDNCF, :INICIO_SECUECIA, :FIN_SECUENCIA, :FECHA_A' +
        'SIGNACION)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_SERIE,'
      '  IDNCF,'
      '  INICIO_SECUECIA,'
      '  FIN_SECUENCIA,'
      '  FECHA_ASIGNACION'
      'from CONTROL_SEC_NCF '
      'where'
      '  ID_SERIE = :ID_SERIE')
    SelectSQL.Strings = (
      'Select * From CONTROL_SEC_NCF')
    ModifySQL.Strings = (
      'update CONTROL_SEC_NCF'
      'set'
      '  ID_SERIE = :ID_SERIE,'
      '  IDNCF = :IDNCF,'
      '  INICIO_SECUECIA = :INICIO_SECUECIA,'
      '  FIN_SECUENCIA = :FIN_SECUENCIA,'
      '  FECHA_ASIGNACION = :FECHA_ASIGNACION'
      'where'
      '  ID_SERIE = :OLD_ID_SERIE')
    GeneratorField.Field = 'ID_SERIE'
    GeneratorField.Generator = 'GEN_NUM_HIST_NCF'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 184
    Top = 40
    object tblQryHistoricoSecNCFID_SERIE: TIntegerField
      FieldName = 'ID_SERIE'
      Origin = 'CONTROL_SEC_NCF.ID_SERIE'
      Required = True
    end
    object tblQryHistoricoSecNCFIDNCF: TIBStringField
      FieldName = 'IDNCF'
      Origin = 'CONTROL_SEC_NCF.IDNCF'
      Required = True
      Size = 2
    end
    object tblQryHistoricoSecNCFINICIO_SECUECIA: TIntegerField
      FieldName = 'INICIO_SECUECIA'
      Origin = 'CONTROL_SEC_NCF.INICIO_SECUECIA'
    end
    object tblQryHistoricoSecNCFFIN_SECUENCIA: TIntegerField
      FieldName = 'FIN_SECUENCIA'
      Origin = 'CONTROL_SEC_NCF.FIN_SECUENCIA'
    end
    object tblQryHistoricoSecNCFFECHA_ASIGNACION: TDateTimeField
      FieldName = 'FECHA_ASIGNACION'
      Origin = 'CONTROL_SEC_NCF.FECHA_ASIGNACION'
      DisplayFormat = 'dd-mmm-yyyy'
    end
  end
  object ibStpVerificaSEC_NCF: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_VERIFICA_SECNCF'
    Left = 272
    Top = 104
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'ES_VALIDO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'SEC_NCF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDNCF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end>
  end
  object stpProcInsFactPendiente: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_RFACTURAS'
    Left = 288
    Top = 184
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
      end
      item
        DataType = ftString
        Name = 'MONEDAI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDAF'
        ParamType = ptInput
      end>
  end
  object qryRepItbis: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM proc_rep_tbis(:fefchaini, :fechafin)'
      'Where (numero_ncf Is not Null)'
      'ORDER BY FECHA, CODIGO_CTE, NUMERO_NCF')
    Left = 384
    Top = 264
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fefchaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryRepItbisCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST.CODIGO_CTE'
    end
    object qryRepItbisITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET.ITBI_DET'
    end
    object qryRepItbisNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryRepItbisFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryRepItbisMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_MAST.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryRepItbisNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryRepItbisRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryRepItbisCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryRepItbisVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST.VALOR_TOTAL_DET'
    end
    object qryRepItbisNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
  end
  object qryFactReimpMaster: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryFactReimpMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select f.numero, f.codigo_cte, f.fecha,'
      'f.monto_fact, c.Nombre_Cte,'
      'c.Rnc_numero, c.telef_contacto,'
      'c.pais, c.ciudad, c.direccion_cont, f.Fecha_Vence'
      'From Facturas f, Clientes c'
      'Where F.Numero =:numero and f.codigo_cte = c.codigo_cte')
    Left = 272
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
        Value = '215'
      end>
    object qryFactReimpMasterNUMERO: TFloatField
      FieldName = 'NUMERO'
      Origin = 'FACTURAS.NUMERO'
      Required = True
    end
    object qryFactReimpMasterCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'FACTURAS.CODIGO_CTE'
    end
    object qryFactReimpMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FACTURAS.FECHA'
    end
    object qryFactReimpMasterMONTO_FACT: TFloatField
      FieldName = 'MONTO_FACT'
      Origin = 'FACTURAS.MONTO_FACT'
    end
    object qryFactReimpMasterNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryFactReimpMasterRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryFactReimpMasterTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryFactReimpMasterPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryFactReimpMasterCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryFactReimpMasterDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryFactReimpMasterFECHA_VENCE: TDateTimeField
      FieldName = 'FECHA_VENCE'
      Origin = 'FACTURAS.FECHA_VENCE'
    end
  end
  object qryFactReimpDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      'F.DESCRIPCION AS DESC_TIPO_NCF,'
      '       D.SERIE,'
      '       D.CODIGO_PROD,'
      '       D.DESCRIPCION,'
      '       i.referencia,'
      '       D.CANTIDAD,'
      '       D.PRECIO,'
      '       D.PORC_DESC_DET,'
      '       D.ITBI_DET,'
      '       D.VALOR_SERVICIO_DET,'
      '       D.VALOR_TOTAL_DET,'
      '       V.NUMERO_FACTURA,'
      '       D.STATUS_DET,'
      '       V.SERIE_NCF_ASIGNADO,'
      '       N.NUMERO_NCF,'
      '       V.MONTO_DESCUENTO, u.DESCRIPCION desctipounidad'
      'FROM TIPO_CF F'
      '   INNER JOIN NCF_ASIGNADOS N ON (F.TIPO_CF = N.TIPO_NCF)'
      
        '   RIGHT OUTER JOIN VENTAS_MAST V ON (N.SERIE = V.SERIE_NCF_ASIG' +
        'NADO)'
      '   INNER JOIN VENTAS_DET D ON (V.NUMERO = D.NUMERO)'
      '   left outer join UNIDADES u ON (d.TIPO_UNIDAD = u.IDUNIDAD)'
      
        'left outer join INVENTARIO_PRODUCTO i on (d.CODIGO_PROD = i.CODI' +
        'GO)'
      'Where  V.Numero_Factura=:numFactura'
      'Order by  D.DESCRIPCION, D.SERIE')
    Left = 272
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numFactura'
        ParamType = ptInput
        Value = '925'
      end>
  end
  object tblProgServIguala: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PROG_IGUALAS'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into PROG_IGUALAS'
      
        '  (NUMERO, CODIGO_CTE, FECHA_INI, FECHA_FIN, COD_SERVICIO, MONTO' +
        ', CARGAR_ITBIS, '
      
        '   STATUS, COD_USUARIO_IN, FECHA_IN, INSERTADO_POR, FECHA_UPDATE' +
        ', COD_USUARIO_UPDATE)'
      'values'
      
        '  (:NUMERO, :CODIGO_CTE, :FECHA_INI, :FECHA_FIN, :COD_SERVICIO, ' +
        ':MONTO, '
      
        '   :CARGAR_ITBIS, :STATUS, :COD_USUARIO_IN, :FECHA_IN, :INSERTAD' +
        'O_POR, '
      '   :FECHA_UPDATE, :COD_USUARIO_UPDATE)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  CODIGO_CTE,'
      '  FECHA_INI,'
      '  FECHA_FIN,'
      '  COD_SERVICIO,'
      '  MONTO,'
      '  CARGAR_ITBIS,'
      '  STATUS,'
      '  COD_USUARIO_IN,'
      '  FECHA_IN,'
      '  INSERTADO_POR,'
      '  FECHA_UPDATE,'
      '  COD_USUARIO_UPDATE'
      'from PROG_IGUALAS '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'select *  from PROG_IGUALAS')
    ModifySQL.Strings = (
      'update PROG_IGUALAS'
      'set'
      '  NUMERO = :NUMERO,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  FECHA_INI = :FECHA_INI,'
      '  FECHA_FIN = :FECHA_FIN,'
      '  COD_SERVICIO = :COD_SERVICIO,'
      '  MONTO = :MONTO,'
      '  CARGAR_ITBIS = :CARGAR_ITBIS,'
      '  STATUS = :STATUS,'
      '  COD_USUARIO_IN = :COD_USUARIO_IN,'
      '  FECHA_IN = :FECHA_IN,'
      '  INSERTADO_POR = :INSERTADO_POR,'
      '  FECHA_UPDATE = :FECHA_UPDATE,'
      '  COD_USUARIO_UPDATE = :COD_USUARIO_UPDATE'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 216
    Top = 424
    object tblProgServIgualaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PROG_IGUALAS.NUMERO'
      Required = True
    end
    object tblProgServIgualaCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROG_IGUALAS.CODIGO_CTE'
      Required = True
    end
    object tblProgServIgualaFECHA_INI: TDateTimeField
      FieldName = 'FECHA_INI'
      Origin = 'PROG_IGUALAS.FECHA_INI'
      Required = True
    end
    object tblProgServIgualaFECHA_FIN: TDateTimeField
      FieldName = 'FECHA_FIN'
      Origin = 'PROG_IGUALAS.FECHA_FIN'
      Required = True
    end
    object tblProgServIgualaFECHA_ULT_FACT: TDateTimeField
      FieldName = 'FECHA_ULT_FACT'
      Origin = 'PROG_IGUALAS.FECHA_ULT_FACT'
    end
    object tblProgServIgualaCOD_SERVICIO: TIntegerField
      FieldName = 'COD_SERVICIO'
      Origin = 'PROG_IGUALAS.COD_SERVICIO'
    end
    object tblProgServIgualaMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'PROG_IGUALAS.MONTO'
    end
    object tblProgServIgualaCARGAR_ITBIS: TSmallintField
      FieldName = 'CARGAR_ITBIS'
      Origin = 'PROG_IGUALAS.CARGAR_ITBIS'
    end
    object tblProgServIgualaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROG_IGUALAS.STATUS'
      Size = 1
    end
    object tblProgServIgualaCOD_USUARIO_IN: TIntegerField
      FieldName = 'COD_USUARIO_IN'
      Origin = 'PROG_IGUALAS.COD_USUARIO_IN'
    end
    object tblProgServIgualaINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'PROG_IGUALAS.INSERTADO_POR'
      Size = 12
    end
    object tblProgServIgualaFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'PROG_IGUALAS.FECHA_UPDATE'
    end
    object tblProgServIgualaCOD_USUARIO_UPDATE: TIntegerField
      FieldName = 'COD_USUARIO_UPDATE'
      Origin = 'PROG_IGUALAS.COD_USUARIO_UPDATE'
    end
    object tblProgServIgualaTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'PROG_IGUALAS.TIPO_NCF'
      Size = 2
    end
    object tblProgServIgualaDescripcionServicio: TStringField
      DisplayWidth = 200
      FieldKind = fkLookup
      FieldName = 'DescripcionServicio'
      LookupDataSet = qryServProgIguala
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'COD_SERVICIO'
      Size = 200
      Lookup = True
    end
    object tblProgServIgualaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PROG_IGUALAS.FECHA_IN'
    end
  end
  object tblServProgIgualas: TIBTable
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
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <
      item
        Name = 'SERV_PROG_IGUALASINDEX1'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY78'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'SERV_PROG_IGUALAS'
    Left = 40
    Top = 448
    object tblServProgIgualasCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tblServProgIgualasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 200
    end
  end
  object dstblProgServIguala: TDataSource
    DataSet = tblProgServIguala
    Left = 240
    Top = 488
  end
  object dstblServProgIgualas: TDataSource
    DataSet = tblServProgIgualas
    Left = 120
    Top = 480
  end
  object qryFactServFReimpMaster: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryFactServFReimpMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select f.numero, f.codigo_cte, f.fecha,'
      'f.monto_fact, c.Nombre_Cte,'
      'c.Rnc_numero, c.telef_contacto,'
      'c.pais, c.ciudad, c.direccion_cont'
      'From Facturas f, Clientes c'
      
        'Where F.Numero between :numeroini and :numerofin and f.codigo_ct' +
        'e = c.codigo_cte')
    Left = 384
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numeroini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'numerofin'
        ParamType = ptInput
      end>
    object qryFactServFReimpMasterNUMERO: TFloatField
      FieldName = 'NUMERO'
      Origin = 'FACTURAS.NUMERO'
      Required = True
    end
    object qryFactServFReimpMasterCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'FACTURAS.CODIGO_CTE'
    end
    object qryFactServFReimpMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FACTURAS.FECHA'
    end
    object qryFactServFReimpMasterMONTO_FACT: TFloatField
      FieldName = 'MONTO_FACT'
      Origin = 'FACTURAS.MONTO_FACT'
    end
    object qryFactServFReimpMasterNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryFactServFReimpMasterRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryFactServFReimpMasterTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryFactServFReimpMasterPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryFactServFReimpMasterCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryFactServFReimpMasterDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
  end
  object qryFactServFReimpDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT F.DESCRIPCION AS DESC_TIPO_NCF,'
      '       D.SERIE,'
      '       D.CODIGO_PROD,'
      '       D.DESCRIPCION,'
      '       D.CANTIDAD,'
      '       D.PRECIO,'
      '       D.PORC_DESC_DET,'
      '       D.ITBI_DET,'
      '       D.VALOR_SERVICIO_DET,'
      '       D.VALOR_TOTAL_DET,'
      '       V.NUMERO_FACTURA,'
      '       D.STATUS_DET,'
      '       V.SERIE_NCF_ASIGNADO,'
      '       N.NUMERO_NCF,'
      '       V.MONTO_DESCUENTO'
      'FROM VENTAS_MAST V'
      '   INNER JOIN VENTAS_DET D ON (V.NUMERO = D.NUMERO)'
      
        '   LEFT OUTER JOIN NCF_ASIGNADOS N ON (V.SERIE_NCF_ASIGNADO = N.' +
        'SERIE)'
      '   LEFT OUTER JOIN TIPO_CF F ON (N.TIPO_NCF = F.TIPO_CF)'
      'WHERE '
      '   ('
      '      (V.NUMERO_FACTURA =:numFactura)'
      '   and '
      '      (V.NUMERO = D.NUMERO)'
      '   )')
    Left = 384
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numFactura'
        ParamType = ptInput
        Value = '165'
      end>
  end
  object tblServProgIguala: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'SERV_PROG_IGUALAS'
    Left = 384
    Top = 48
    object tblServProgIgualaCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tblServProgIgualaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 200
    end
  end
  object qryServProgIguala: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select CODIGO, DESCRIPCION from SERV_PROG_IGUALAS')
    Left = 384
    Top = 104
    object qryServProgIgualaCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'SERV_PROG_IGUALAS.CODIGO'
      Required = True
    end
    object qryServProgIgualaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'SERV_PROG_IGUALAS.DESCRIPCION'
      Size = 200
    end
  end
  object dsqryServProgIguala: TDataSource
    DataSet = qryServProgIguala
    Left = 384
    Top = 160
  end
  object dstblServProgIguala: TDataSource
    DataSet = tblServProgIguala
    Left = 296
    Top = 24
  end
  object qryRepItbis_Esp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM proc_rep_tbis(:fefchaini, :fechafin)'
      'Where (numero_ncf Is Null)'
      'ORDER BY FECHA, CODIGO_CTE, NUMERO_NCF')
    Left = 384
    Top = 376
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fefchaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryRepItbis_EspCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROC_REP_TBIS.CODIGO_CTE'
    end
    object qryRepItbis_EspITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'PROC_REP_TBIS.ITBI_DET'
    end
    object qryRepItbis_EspNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'PROC_REP_TBIS.NOMBRE_CTE'
      Size = 60
    end
    object qryRepItbis_EspFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_REP_TBIS.FECHA'
    end
    object qryRepItbis_EspMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'PROC_REP_TBIS.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryRepItbis_EspVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'PROC_REP_TBIS.VALOR_TOTAL_DET'
    end
    object qryRepItbis_EspNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PROC_REP_TBIS.NUMERO'
    end
    object qryRepItbis_EspRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'PROC_REP_TBIS.RNC_NUMERO'
      Size = 14
    end
    object qryRepItbis_EspCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'PROC_REP_TBIS.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryRepItbis_EspNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'PROC_REP_TBIS.NUMERO_NCF'
      Size = 21
    end
  end
  object stpInsertPorcOtrosCargosFServ: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_PORC_APLICADO_FCT_SERV_I1'
    Left = 512
    Top = 389
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO_TRN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORCGADMIN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORCITBISGADMIN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORCTRANS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORCDIRTEC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORCITBISDIRTEC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORCIMPREVISTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORCITBISIMPREVISTO'
        ParamType = ptInput
      end>
  end
  object qryPorcOtrosCargosCotiza: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from PORC_APLICADO_COTIZA_SERV'
      'where numero_trn=:numero')
    Left = 624
    Top = 432
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryPorcOtrosCargosCotizaNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'PORC_APLICADO_COTIZA_SERV.NUMERO_TRN'
      Required = True
    end
    object qryPorcOtrosCargosCotizaPORCGADMIN: TFloatField
      FieldName = 'PORCGADMIN'
      Origin = 'PORC_APLICADO_COTIZA_SERV.PORCGADMIN'
    end
    object qryPorcOtrosCargosCotizaPORCITBISGADMIN: TFloatField
      FieldName = 'PORCITBISGADMIN'
      Origin = 'PORC_APLICADO_COTIZA_SERV.PORCITBISGADMIN'
    end
    object qryPorcOtrosCargosCotizaPORCTRANS: TFloatField
      FieldName = 'PORCTRANS'
      Origin = 'PORC_APLICADO_COTIZA_SERV.PORCTRANS'
    end
    object qryPorcOtrosCargosCotizaPORCDIRTEC: TFloatField
      FieldName = 'PORCDIRTEC'
      Origin = 'PORC_APLICADO_COTIZA_SERV.PORCDIRTEC'
    end
    object qryPorcOtrosCargosCotizaPORCITBISDIRTEC: TFloatField
      FieldName = 'PORCITBISDIRTEC'
      Origin = 'PORC_APLICADO_COTIZA_SERV.PORCITBISDIRTEC'
    end
    object qryPorcOtrosCargosCotizaPORCIMPREVISTO: TFloatField
      FieldName = 'PORCIMPREVISTO'
      Origin = 'PORC_APLICADO_COTIZA_SERV.PORCIMPREVISTO'
    end
    object qryPorcOtrosCargosCotizaPORCITBISIMPREVISTO: TFloatField
      FieldName = 'PORCITBISIMPREVISTO'
      Origin = 'PORC_APLICADO_COTIZA_SERV.PORCITBISIMPREVISTO'
    end
  end
  object ibQryViewNCF_0: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select v.id, v.SERIE,'
      'v.IDSEC_2018,v.DESCRIPCION_2018,v.FECHA_VENCE,'
      
        'v.DIV_NEGOCIO,v.PECF,v.AICF,v.TIPO_CF,v.NCF, n.DESCRIPCION, n.TI' +
        'PO_NCF_IFISCAL, n.tipo_ncfNCR From View_nfc v, NCF_TIPO_IFISCAL ' +
        'n '
      'Where v.TIPO_CF = n.TIPO_NCF'
      'order by n.tipo_ncfNCR desc')
    Left = 560
    Top = 217
  end
  object qryVtaConDeliveryTrn: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select d.*, r.NUMERO_TRN '
      'From CLIENTES_DELIVERY_TRN_PREV r'
      'inner join CLIENTES_DELIVERY d on d.CODIGO = r.CODIGO'
      'where r.numero_trn=:numerotrn')
    Left = 504
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerotrn'
        ParamType = ptInput
      end>
    object qryVtaConDeliveryTrnCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CLIENTES_DELIVERY_TRN.CODIGO'
      Required = True
    end
    object qryVtaConDeliveryTrnNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'CLIENTES_DELIVERY_TRN.NUMERO_TRN'
    end
    object qryVtaConDeliveryTrnNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'CLIENTES_DELIVERY.NOMBRE'
      Size = 80
    end
    object qryVtaConDeliveryTrnTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'CLIENTES_DELIVERY.TELEFONO'
    end
    object qryVtaConDeliveryTrnDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Origin = 'CLIENTES_DELIVERY.DIRECCION'
      Size = 80
    end
    object qryVtaConDeliveryTrnFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CLIENTES_DELIVERY.FECHA_IN'
    end
    object qryVtaConDeliveryTrnINSERT_POR: TIBStringField
      FieldName = 'INSERT_POR'
      Origin = 'CLIENTES_DELIVERY.INSERT_POR'
      Size = 12
    end
  end
end
