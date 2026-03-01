object dmFactura: TdmFactura
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 43
  Height = 685
  Width = 1088
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
      '  CIA_KEY = :OLD_CIA_KEY and'
      '  MONEDA = :OLD_MONEDA and'
      '  TIPO = :OLD_TIPO')
    InsertSQL.Strings = (
      'insert into FACTURAS'
      
        '  (SERIE, NUMERO, CIA_KEY, MONEDA, TIPO, CODIGO_CTE, FECHA, DESC' +
        'RIPCION, '
      
        '   MONTO_FACT, RCXC, RCNT, STATUS, FECHA_IN, IN_POR, FECHA_MOD, ' +
        'MOD_POR, '
      
        '   FECHA_VENCE, TIPO_FACTURA, APLICA_TIPODESC, NUMERO_TRN_VTA, P' +
        'ORC_ATRASOCXC)'
      'values'
      
        '  (:SERIE, :NUMERO, :CIA_KEY, :MONEDA, :TIPO, :CODIGO_CTE, :FECH' +
        'A, :DESCRIPCION, '
      
        '   :MONTO_FACT, :RCXC, :RCNT, :STATUS, :FECHA_IN, :IN_POR, :FECH' +
        'A_MOD, '
      
        '   :MOD_POR, :FECHA_VENCE, :TIPO_FACTURA, :APLICA_TIPODESC, :NUM' +
        'ERO_TRN_VTA, '
      '   :PORC_ATRASOCXC)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  CIA_KEY,'
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
      '  FECHA_VENCE,'
      '  TIPO_FACTURA,'
      '  APLICA_TIPODESC,'
      '  NUMERO_TRN_VTA,'
      '  PORC_ATRASOCXC'
      'from FACTURAS '
      'where'
      '  SERIE = :SERIE and'
      '  NUMERO = :NUMERO and'
      '  CIA_KEY = :CIA_KEY and'
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
      '  CIA_KEY = :CIA_KEY,'
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
      '  FECHA_VENCE = :FECHA_VENCE,'
      '  TIPO_FACTURA = :TIPO_FACTURA,'
      '  APLICA_TIPODESC = :APLICA_TIPODESC,'
      '  NUMERO_TRN_VTA = :NUMERO_TRN_VTA,'
      '  PORC_ATRASOCXC = :PORC_ATRASOCXC'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  NUMERO = :OLD_NUMERO and'
      '  CIA_KEY = :OLD_CIA_KEY and'
      '  MONEDA = :OLD_MONEDA and'
      '  TIPO = :OLD_TIPO')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_FACTURA'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 48
    Top = 42
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
    object IBDataSetFacturasTIPO_FACTURA: TSmallintField
      FieldName = 'TIPO_FACTURA'
      Origin = 'FACTURAS.TIPO_FACTURA'
    end
    object IBDataSetFacturasAPLICA_TIPODESC: TSmallintField
      FieldName = 'APLICA_TIPODESC'
      Origin = 'FACTURAS.APLICA_TIPODESC'
    end
    object IBDataSetFacturasCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'FACTURAS.CIA_KEY'
      Required = True
    end
    object IBDataSetFacturasNUMERO_TRN_VTA: TIntegerField
      FieldName = 'NUMERO_TRN_VTA'
      Origin = 'FACTURAS.NUMERO_TRN_VTA'
    end
    object IBDataSetFacturasPORC_ATRASOCXC: TFloatField
      FieldName = 'PORC_ATRASOCXC'
      Origin = 'FACTURAS.PORC_ATRASOCXC'
    end
  end
  object dtIBDataSetFacturas: TDataSource
    DataSet = IBDataSetFacturas
    Left = 48
    Top = 90
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
    Top = 137
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
    Top = 186
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
    Left = 256
    Top = 18
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
    Top = 202
  end
  object ibQryViewNCF: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select v.id,v.IDSEC_2018,v.DESCRIPCION_2018,v.FECHA_VENCE, v.SER' +
        'IE,v.DIV_NEGOCIO,'
      'v.PECF,v.AICF,v.TIPO_CF,v.NCF, n.DESCRIPCION,  '
      'n.TIPO_NCF_IFISCAL, n.tipo_ncfNCR '
      'From View_nfc v '
      'left outer join NCF_TIPO_IFISCAL n on v.TIPO_CF = n.TIPO_NCF')
    OnFilterRecord = ibQryViewNCFFilterRecord
    Left = 296
    Top = 492
    object ibQryViewNCFID: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ID'
      Origin = 'VIEW_NFC.ID'
      ReadOnly = True
      Size = 42
    end
    object ibQryViewNCFSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'VIEW_NFC.SERIE'
      FixedChar = True
      Size = 1
    end
    object ibQryViewNCFDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VIEW_NFC.DESCRIPCION'
      Size = 60
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
    object ibQryViewNCFTIPO_NCF_IFISCAL: TIntegerField
      FieldName = 'TIPO_NCF_IFISCAL'
      Required = True
    end
    object ibQryViewNCFTIPO_NCFNCR: TIntegerField
      FieldName = 'TIPO_NCFNCR'
      Required = True
    end
    object ibQryViewNCFIDSEC_2018: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'IDSEC_2018'
      Origin = 'VIEW_NFC.IDSEC_2018'
      ReadOnly = True
      Size = 13
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
  end
  object dstblDgii_SerieNCF: TDataSource
    DataSet = tblDgii_SerieNCF
    Left = 200
    Top = 304
  end
  object tblDgii_SerieNCF: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblDgii_SerieNCFAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'SERIE'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DIV_NEGOCIO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'PECF'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'AICF'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TIPO_CF'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NCF'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'ACTIVO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'FECHA_IN'
        DataType = ftDateTime
      end
      item
        Name = 'FECHA_UPD'
        DataType = ftDateTime
      end
      item
        Name = 'CANT_MIN_AVISO1'
        DataType = ftSmallint
      end
      item
        Name = 'CANT_MIN_AVISO2'
        DataType = ftSmallint
      end
      item
        Name = 'FECHA_VENCE'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'DGII_SERIE_NFCINDEX1'
        Fields = 'SERIE;DIV_NEGOCIO;PECF;AICF;TIPO_CF;NCF'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'DGII_SERIE_NFC'
    Left = 167
    Top = 261
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
    object tblDgii_SerieNCFCANT_MIN_AVISO1: TSmallintField
      FieldName = 'CANT_MIN_AVISO1'
    end
    object tblDgii_SerieNCFCANT_MIN_AVISO2: TSmallintField
      FieldName = 'CANT_MIN_AVISO2'
    end
    object tblDgii_SerieNCFFECHA_VENCE: TDateTimeField
      FieldName = 'FECHA_VENCE'
    end
  end
  object dsibQryViewNCF: TDataSource
    DataSet = ibQryViewNCF
    Left = 40
    Top = 408
  end
  object dstblTipoCF: TDataSource
    DataSet = tblTipoCF
    Left = 24
    Top = 343
  end
  object tblTipoCF: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_CF'
    Left = 32
    Top = 263
    object tblTipoCFTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Size = 2
    end
    object tblTipoCFDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object tblTipoCFDESCRIPCION_2018: TIBStringField
      FieldName = 'DESCRIPCION_2018'
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
    Left = 152
    Top = 526
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
        'CION, STATUS)'
      'values'
      
        '  (:ID_SERIE, :IDNCF, :INICIO_SECUECIA, :FIN_SECUENCIA, :FECHA_A' +
        'SIGNACION, '
      '   :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_SERIE,'
      '  IDNCF,'
      '  INICIO_SECUECIA,'
      '  FIN_SECUENCIA,'
      '  FECHA_ASIGNACION,'
      '  STATUS'
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
      '  FECHA_ASIGNACION = :FECHA_ASIGNACION,'
      '  STATUS = :STATUS'
      'where'
      '  ID_SERIE = :OLD_ID_SERIE')
    GeneratorField.Field = 'ID_SERIE'
    GeneratorField.Generator = 'GEN_NUM_HIST_NCF'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 152
    Top = 18
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
    object tblQryHistoricoSecNCFSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'CONTROL_SEC_NCF.STATUS'
    end
  end
  object ibStpVerificaSEC_NCF: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_VERIFICA_SECNCF'
    Left = 320
    Top = 138
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
    Left = 344
    Top = 194
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
      'SELECT * FROM proc_rep_tbis(:fefchaini, :fechafin,:codmoneda)'
      'Where (numero_ncf Is not Null)'
      'order by numero_ncf, numero ')
    OnFilterRecord = qryRepItbisFilterRecord
    Left = 460
    Top = 266
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
      end
      item
        DataType = ftString
        Name = 'codmoneda'
        ParamType = ptInput
        Value = '2'
      end>
    object qryRepItbisNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryRepItbisFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryRepItbisCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST.CODIGO_CTE'
    end
    object qryRepItbisTIPO_INV: TSmallintField
      FieldName = 'TIPO_INV'
      Origin = 'PROC_REP_TBIS.TIPO_INV'
    end
    object qryRepItbisDESC_TIPOINVENTARIO: TIBStringField
      FieldName = 'DESC_TIPOINVENTARIO'
      Origin = 'PROC_REP_TBIS.DESC_TIPOINVENTARIO'
      Size = 30
    end
    object qryRepItbisTIPODOC: TIBStringField
      FieldName = 'TIPODOC'
      Origin = 'PROC_REP_TBIS.TIPODOC'
      Size = 12
    end
    object qryRepItbisFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'PROC_REP_TBIS.FORMA_PAGO'
    end
    object qryRepItbisMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_MAST.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryRepItbisNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'PROC_REP_TBIS.NOMBRE_CTE'
      Size = 60
    end
    object qryRepItbisNUMERODOC: TIBStringField
      FieldName = 'NUMERODOC'
      Origin = 'PROC_REP_TBIS.NUMERODOC'
      Size = 12
    end
    object qryRepItbisNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
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
    object qryRepItbisVALOR_TASA: TFloatField
      FieldName = 'VALOR_TASA'
      Origin = 'PROC_REP_TBIS.VALOR_TASA'
    end
    object qryRepItbisVALOR_BASE: TFloatField
      FieldName = 'VALOR_BASE'
      Origin = 'PROC_REP_TBIS.VALOR_BASE'
    end
    object qryRepItbisVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST.VALOR_TOTAL_DET'
    end
    object qryRepItbisITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET.ITBI_DET'
    end
    object qryRepItbisITBI_EXONERADO: TFloatField
      FieldName = 'ITBI_EXONERADO'
      Origin = 'PROC_REP_TBIS.ITBI_EXONERADO'
    end
    object qryRepItbisMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'PROC_REP_TBIS.MONTO_DESCUENTO'
    end
    object qryRepItbisMONTO_RECARGO: TFloatField
      FieldName = 'MONTO_RECARGO'
      Origin = 'PROC_REP_TBIS.MONTO_RECARGO'
    end
    object qryRepItbisSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROC_REP_TBIS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepItbisMONTOIBISRECARGO: TFloatField
      FieldName = 'MONTOIBISRECARGO'
      Origin = 'PROC_REP_TBIS.MONTOIBISRECARGO'
    end
    object qryRepItbisDESC_NCF: TIBStringField
      FieldName = 'DESC_NCF'
      Origin = 'PROC_REP_TBIS.DESC_NCF'
      Size = 62
    end
    object qryRepItbisMONTOBASEEXENTO: TFloatField
      FieldName = 'MONTOBASEEXENTO'
      Origin = 'PROC_REP_TBIS.MONTOBASEEXENTO'
    end
    object qryRepItbisMONTOGRAVADO: TFloatField
      FieldName = 'MONTOGRAVADO'
      Origin = 'PROC_REP_TBIS.MONTOGRAVADO'
    end
    object qryRepItbisTASAITBIS: TFloatField
      FieldName = 'TASAITBIS'
      Origin = 'PROC_REP_TBIS.TASAITBIS'
    end
    object qryRepItbisITBIS_8PORCIENTO: TFloatField
      FieldName = 'ITBIS_8PORCIENTO'
      Origin = 'PROC_REP_TBIS.ITBIS_8PORCIENTO'
    end
    object qryRepItbisITBIS_11PORCIENTO: TFloatField
      FieldName = 'ITBIS_11PORCIENTO'
      Origin = 'PROC_REP_TBIS.ITBIS_11PORCIENTO'
    end
    object qryRepItbisITBIS_13PORCIENTO: TFloatField
      FieldName = 'ITBIS_13PORCIENTO'
      Origin = 'PROC_REP_TBIS.ITBIS_13PORCIENTO'
    end
    object qryRepItbisITBIS_16PORCIENTO: TFloatField
      FieldName = 'ITBIS_16PORCIENTO'
      Origin = 'PROC_REP_TBIS.ITBIS_16PORCIENTO'
    end
    object qryRepItbisITBIS_18PORCIENTO: TFloatField
      FieldName = 'ITBIS_18PORCIENTO'
      Origin = 'PROC_REP_TBIS.ITBIS_18PORCIENTO'
    end
    object qryRepItbisOTROPORCIENTOITBIS: TFloatField
      FieldName = 'OTROPORCIENTOITBIS'
      Origin = 'PROC_REP_TBIS.OTROPORCIENTOITBIS'
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
      'c.pais, c.ciudad, c.direccion_cont, f.Fecha_Vence,'
      'f.moneda'
      'From Facturas f, Clientes c'
      'Where F.Numero =:numero and f.codigo_cte = c.codigo_cte')
    Left = 318
    Top = 234
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
    object qryFactReimpMasterMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'FACTURAS.MONEDA'
      Required = True
      FixedChar = True
      Size = 2
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
      '       V.MONTO_DESCUENTO, u.DESCRIPCION desctipounidad,'
      '       SUBSTRING(u.DESCRIPCION from 1 for 1) LTIPO_UNIDAD,'
      '      D.MONTO_DESC_ITEM, v.PROPINA, v.PROPINALEGAL'
      'FROM TIPO_CF F'
      '   INNER JOIN NCF_ASIGNADOS N ON (F.TIPO_CF = N.TIPO_NCF)'
      
        '   RIGHT OUTER JOIN VENTAS_MAST V ON (N.SERIE = V.SERIE_NCF_ASIG' +
        'NADO)'
      '   INNER JOIN VENTAS_DET D ON (V.NUMERO = D.NUMERO)'
      '   Left Outer Join UNIDADES u ON (d.TIPO_UNIDAD = u.IDUNIDAD)'
      
        'Left outer join INVENTARIO_PRODUCTO i on (d.CODIGO_PROD = i.CODI' +
        'GO)'
      'Where  V.Numero_Factura=:numFactura'
      'Order by  d.numero, d.serie')
    Left = 264
    Top = 290
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numFactura'
        ParamType = ptInput
        Value = '925'
      end>
    object qryFactReimpDetDESC_TIPO_NCF: TIBStringField
      FieldName = 'DESC_TIPO_NCF'
      Origin = 'TIPO_CF.DESCRIPCION'
      Size = 60
    end
    object qryFactReimpDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET.SERIE'
      Required = True
    end
    object qryFactReimpDetCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryFactReimpDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object qryFactReimpDetREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object qryFactReimpDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET.CANTIDAD'
    end
    object qryFactReimpDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET.PRECIO'
    end
    object qryFactReimpDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET.PORC_DESC_DET'
    end
    object qryFactReimpDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET.ITBI_DET'
    end
    object qryFactReimpDetVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET.VALOR_SERVICIO_DET'
    end
    object qryFactReimpDetVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_DET.VALOR_TOTAL_DET'
    end
    object qryFactReimpDetNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST.NUMERO_FACTURA'
    end
    object qryFactReimpDetSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryFactReimpDetSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
    object qryFactReimpDetNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
    object qryFactReimpDetMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_MAST.MONTO_DESCUENTO'
    end
    object qryFactReimpDetDESCTIPOUNIDAD: TIBStringField
      FieldName = 'DESCTIPOUNIDAD'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
    object qryFactReimpDetMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VENTAS_DET.MONTO_DESC_ITEM'
    end
    object qryFactReimpDetPROPINA: TFloatField
      FieldName = 'PROPINA'
      Origin = 'VENTAS_MAST.PROPINA'
    end
    object qryFactReimpDetPROPINALEGAL: TFloatField
      FieldName = 'PROPINALEGAL'
      Origin = 'VENTAS_MAST.PROPINALEGAL'
    end
    object qryFactReimpDetLTIPO_UNIDAD: TIBStringField
      FieldName = 'LTIPO_UNIDAD'
      Size = 50
    end
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
        ', COD_USUARIO_UPDATE, '
      '   FECHA_ULT_FACT, TIPO_NCF)'
      'values'
      
        '  (:NUMERO, :CODIGO_CTE, :FECHA_INI, :FECHA_FIN, :COD_SERVICIO, ' +
        ':MONTO, '
      
        '   :CARGAR_ITBIS, :STATUS, :COD_USUARIO_IN, :FECHA_IN, :INSERTAD' +
        'O_POR, '
      
        '   :FECHA_UPDATE, :COD_USUARIO_UPDATE, :FECHA_ULT_FACT, :TIPO_NC' +
        'F)')
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
      '  COD_USUARIO_UPDATE,'
      '  FECHA_ULT_FACT,'
      '  TIPO_NCF'
      'from PROG_IGUALAS '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'select w.STATE statusContracto, p.* from PROG_IGUALAS p'
      'left outer join CONTRACTWISPRO w on w.CODIGO_CTE = p.CODIGO_CTE')
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
      '  COD_USUARIO_UPDATE = :COD_USUARIO_UPDATE,'
      '  FECHA_ULT_FACT = :FECHA_ULT_FACT,'
      '  TIPO_NCF = :TIPO_NCF'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 400
    Top = 392
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
    object tblProgServIgualaSTATUSCONTRACTO: TIBStringField
      FieldName = 'STATUSCONTRACTO'
      Origin = 'CONTRACTWISPRO.STATE'
      Size = 50
    end
  end
  object tblServProgIgualasTEMP: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftSmallint
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 20
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
    Left = 56
    Top = 491
    object tblServProgIgualasTEMPCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tblServProgIgualasTEMPDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
    end
  end
  object dstblProgServIguala: TDataSource
    DataSet = tblProgServIguala
    Left = 152
    Top = 313
  end
  object dstblServProgIgualas: TDataSource
    DataSet = tblServProgIgualasTEMP
    Left = 88
    Top = 329
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
    Left = 428
    Top = 226
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
      '  d.porc_desc_item,'
      '  d.monto_desc_item,'
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
    Left = 396
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numFactura'
        ParamType = ptInput
        Value = '165'
      end>
    object qryFactServFReimpDetDESC_TIPO_NCF: TIBStringField
      FieldName = 'DESC_TIPO_NCF'
      Origin = 'TIPO_CF.DESCRIPCION'
      Size = 60
    end
    object qryFactServFReimpDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET.SERIE'
      Required = True
    end
    object qryFactServFReimpDetCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryFactServFReimpDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object qryFactServFReimpDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET.CANTIDAD'
    end
    object qryFactServFReimpDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET.PRECIO'
    end
    object qryFactServFReimpDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET.PORC_DESC_DET'
    end
    object qryFactServFReimpDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET.ITBI_DET'
    end
    object qryFactServFReimpDetVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET.VALOR_SERVICIO_DET'
    end
    object qryFactServFReimpDetVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_DET.VALOR_TOTAL_DET'
    end
    object qryFactServFReimpDetNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST.NUMERO_FACTURA'
    end
    object qryFactServFReimpDetPORC_DESC_ITEM: TFloatField
      FieldName = 'PORC_DESC_ITEM'
      Origin = 'VENTAS_DET.PORC_DESC_ITEM'
    end
    object qryFactServFReimpDetMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VENTAS_DET.MONTO_DESC_ITEM'
    end
    object qryFactServFReimpDetSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryFactServFReimpDetSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
    object qryFactServFReimpDetNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
    object qryFactServFReimpDetMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_MAST.MONTO_DESCUENTO'
    end
  end
  object tblServProgIguala: TIBTable
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
        Size = 80
      end
      item
        Name = 'CODIGO_PRODUCTO'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY76'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'SERV_PROG_IGUALASINDEX1'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'SERV_PROG_IGUALAS'
    Left = 400
    Top = 18
    object tblServProgIgualaCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tblServProgIgualaDESCRIPCION: TIBStringField
      DisplayWidth = 80
      FieldName = 'DESCRIPCION'
      Size = 80
    end
    object tblServProgIgualaCODIGO_PRODUCTO: TIntegerField
      FieldName = 'CODIGO_PRODUCTO'
    end
  end
  object qryServProgIguala: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from SERV_PROG_IGUALAS')
    Left = 495
    Top = 90
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
    object qryServProgIgualaCODIGO_PRODUCTO: TIntegerField
      FieldName = 'CODIGO_PRODUCTO'
      Origin = 'SERV_PROG_IGUALAS.CODIGO_PRODUCTO'
    end
  end
  object dsqryServProgIguala: TDataSource
    DataSet = qryServProgIguala
    Left = 568
    Top = 182
  end
  object dstblServProgIguala: TDataSource
    DataSet = tblServProgIguala
    Left = 296
    Top = 42
  end
  object qryRepItbis_Esp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM proc_rep_tbis(:fefchaini, :fechafin,:moneda)'
      'Where (numero_ncf Is Null)'
      'ORDER BY FECHA, CODIGO_CTE, NUMERO_NCF')
    Left = 388
    Top = 452
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
      end
      item
        DataType = ftUnknown
        Name = 'moneda'
        ParamType = ptUnknown
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
    object qryRepItbis_EspTIPODOC: TIBStringField
      FieldName = 'TIPODOC'
      Origin = 'PROC_REP_TBIS.TIPODOC'
      Size = 12
    end
    object qryRepItbis_EspNUMERODOC: TIBStringField
      FieldName = 'NUMERODOC'
      Origin = 'PROC_REP_TBIS.NUMERODOC'
      Size = 12
    end
    object qryRepItbis_EspSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROC_REP_TBIS.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object tblConfDescuentoFactura: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CONF_DESC_FACTURAS'
    Left = 416
    Top = 295
    object tblConfDescuentoFacturaTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object tblConfDescuentoFacturaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object tblConfDescuentoFacturaPORCIENTO: TFloatField
      FieldName = 'PORCIENTO'
    end
    object tblConfDescuentoFacturaFECHAINI: TDateTimeField
      FieldName = 'FECHAINI'
    end
    object tblConfDescuentoFacturaFECHAFIN: TDateTimeField
      FieldName = 'FECHAFIN'
    end
    object tblConfDescuentoFacturaFORMULA: TIBStringField
      FieldName = 'FORMULA'
      Size = 100
    end
    object tblConfDescuentoFacturaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object dstblConfDescuentoFactura: TDataSource
    DataSet = tblConfDescuentoFactura
    Left = 312
    Top = 323
  end
  object tblTemplateMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblTemplateMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TEMPLATE_XLS_MASTER'
      'where'
      '  NUMEROID = :OLD_NUMEROID')
    InsertSQL.Strings = (
      'insert into TEMPLATE_XLS_MASTER'
      '  (NUMEROID, IDDOC, FECHA, NOMBRE_ARCHIVO, STATUS)'
      'values'
      '  (:NUMEROID, :IDDOC, :FECHA, :NOMBRE_ARCHIVO, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMEROID,'
      '  IDDOC,'
      '  FECHA,'
      '  NOMBRE_ARCHIVO,'
      '  STATUS'
      'from TEMPLATE_XLS_MASTER '
      'where'
      '  NUMEROID = :NUMEROID')
    SelectSQL.Strings = (
      'select * from TEMPLATE_XLS_MASTER')
    ModifySQL.Strings = (
      'update TEMPLATE_XLS_MASTER'
      'set'
      '  NUMEROID = :NUMEROID,'
      '  IDDOC = :IDDOC,'
      '  FECHA = :FECHA,'
      '  NOMBRE_ARCHIVO = :NOMBRE_ARCHIVO,'
      '  STATUS = :STATUS'
      'where'
      '  NUMEROID = :OLD_NUMEROID')
    Left = 160
    Top = 82
    object tblTemplateMasterNUMEROID: TIntegerField
      FieldName = 'NUMEROID'
      Origin = 'TEMPLATE_XLS_MASTER.NUMEROID'
      Required = True
    end
    object tblTemplateMasterIDDOC: TSmallintField
      FieldName = 'IDDOC'
      Origin = 'TEMPLATE_XLS_MASTER.IDDOC'
      Required = True
    end
    object tblTemplateMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'TEMPLATE_XLS_MASTER.FECHA'
    end
    object tblTemplateMasterNOMBRE_ARCHIVO: TIBStringField
      FieldName = 'NOMBRE_ARCHIVO'
      Origin = 'TEMPLATE_XLS_MASTER.NOMBRE_ARCHIVO'
      Size = 110
    end
    object tblTemplateMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TEMPLATE_XLS_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object tblTemplateTipoDoc: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    TableName = 'TEMPLATE_XLS_DOC'
    Left = 240
    Top = 66
    object tblTemplateTipoDocIDDOC: TSmallintField
      FieldName = 'IDDOC'
    end
    object tblTemplateTipoDocNOMBRE_TEMPLATE: TIBStringField
      FieldName = 'NOMBRE_TEMPLATE'
      Size = 110
    end
    object tblTemplateTipoDocSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object tblTemplateDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TEMPLATE_XLS'
      'where'
      '  SERIEID = :OLD_SERIEID')
    InsertSQL.Strings = (
      'insert into TEMPLATE_XLS'
      
        '  (SERIEID, NUMEROID, SECCION, NOMBRE_CAMPO, DESCRIPCION_LABEL, ' +
        'COLUMNA_NOMBRE, '
      '   FILE_NUMERO, ISDETAIL, STATUS)'
      'values'
      
        '  (:SERIEID, :NUMEROID, :SECCION, :NOMBRE_CAMPO, :DESCRIPCION_LA' +
        'BEL, :COLUMNA_NOMBRE, '
      '   :FILE_NUMERO, :ISDETAIL, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIEID,'
      '  NUMEROID,'
      '  SECCION,'
      '  NOMBRE_CAMPO,'
      '  DESCRIPCION_LABEL,'
      '  COLUMNA_NOMBRE,'
      '  FILE_NUMERO,'
      '  ISDETAIL,'
      '  STATUS'
      'from TEMPLATE_XLS '
      'where'
      '  SERIEID = :SERIEID')
    SelectSQL.Strings = (
      'Select * From TEMPLATE_XLS'
      'Where NUMEROID=:numeroid')
    ModifySQL.Strings = (
      'update TEMPLATE_XLS'
      'set'
      '  SERIEID = :SERIEID,'
      '  NUMEROID = :NUMEROID,'
      '  SECCION = :SECCION,'
      '  NOMBRE_CAMPO = :NOMBRE_CAMPO,'
      '  DESCRIPCION_LABEL = :DESCRIPCION_LABEL,'
      '  COLUMNA_NOMBRE = :COLUMNA_NOMBRE,'
      '  FILE_NUMERO = :FILE_NUMERO,'
      '  ISDETAIL = :ISDETAIL,'
      '  STATUS = :STATUS'
      'where'
      '  SERIEID = :OLD_SERIEID')
    OnFilterRecord = tblTemplateDetFilterRecord
    Left = 400
    Top = 90
    object tblTemplateDetSERIEID: TIntegerField
      FieldName = 'SERIEID'
      Origin = 'TEMPLATE_XLS.SERIEID'
      Required = True
    end
    object tblTemplateDetNUMEROID: TIntegerField
      FieldName = 'NUMEROID'
      Origin = 'TEMPLATE_XLS.NUMEROID'
      Required = True
    end
    object tblTemplateDetNOMBRE_CAMPO: TIBStringField
      FieldName = 'NOMBRE_CAMPO'
      Origin = 'TEMPLATE_XLS.NOMBRE_CAMPO'
      Size = 70
    end
    object tblTemplateDetDESCRIPCION_LABEL: TIBStringField
      FieldName = 'DESCRIPCION_LABEL'
      Origin = 'TEMPLATE_XLS.DESCRIPCION_LABEL'
      Size = 100
    end
    object tblTemplateDetCOLUMNA_NOMBRE: TIBStringField
      FieldName = 'COLUMNA_NOMBRE'
      Origin = 'TEMPLATE_XLS.COLUMNA_NOMBRE'
      Size = 8
    end
    object tblTemplateDetFILE_NUMERO: TIBStringField
      FieldName = 'FILE_NUMERO'
      Origin = 'TEMPLATE_XLS.FILE_NUMERO'
      Size = 8
    end
    object tblTemplateDetISDETAIL: TSmallintField
      FieldName = 'ISDETAIL'
      Origin = 'TEMPLATE_XLS.ISDETAIL'
    end
    object tblTemplateDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TEMPLATE_XLS.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblTemplateDetSECCION: TIBStringField
      FieldName = 'SECCION'
      Origin = 'TEMPLATE_XLS.SECCION'
      Size = 30
    end
  end
  object dstblTemplateMaster: TDataSource
    DataSet = tblTemplateMaster
    Left = 112
    Top = 130
  end
  object dstblTemplateTipoDoc: TDataSource
    DataSet = tblTemplateTipoDoc
    Left = 232
    Top = 114
  end
  object dstblTemplateDet: TDataSource
    DataSet = tblTemplateDet
    Left = 408
    Top = 146
  end
  object tblTemplateTipoDocLookup: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    TableName = 'TEMPLATE_XLS_DOC'
    Left = 240
    Top = 154
    object tblTemplateTipoDocLookupIDDOC: TSmallintField
      FieldName = 'IDDOC'
    end
    object tblTemplateTipoDocLookupNOMBRE_TEMPLATE: TIBStringField
      FieldName = 'NOMBRE_TEMPLATE'
      Size = 110
    end
    object tblTemplateTipoDocLookupSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object dstblTemplateTipoDocLookup: TDataSource
    DataSet = tblTemplateTipoDocLookup
    Left = 224
    Top = 202
  end
  object qryTemplateFactura: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  TEMPLATE_XLS_MASTER.NOMBRE_ARCHIVO,'
      '  TEMPLATE_XLS_DOC.NOMBRE_TEMPLATE,'
      '  TEMPLATE_XLS.SERIEID,'
      '  TEMPLATE_XLS.NUMEROID,'
      '  TEMPLATE_XLS.NOMBRE_CAMPO,'
      '  TEMPLATE_XLS.DESCRIPCION_LABEL,'
      '  TEMPLATE_XLS.COLUMNA_NOMBRE,'
      '  TEMPLATE_XLS.FILE_NUMERO,'
      '  TEMPLATE_XLS.ISDETAIL,'
      '  TEMPLATE_XLS.STATUS'
      'FROM'
      '  TEMPLATE_XLS_DOC'
      
        '  INNER JOIN TEMPLATE_XLS_MASTER ON (TEMPLATE_XLS_DOC.IDDOC = TE' +
        'MPLATE_XLS_MASTER.IDDOC)'
      
        '  INNER JOIN TEMPLATE_XLS ON (TEMPLATE_XLS_MASTER.NUMEROID = TEM' +
        'PLATE_XLS.NUMEROID)'
      'WHERE TEMPLATE_XLS_MASTER.IDDOC=:IDDOC')
    Left = 496
    Top = 138
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDDOC'
        ParamType = ptInput
      end>
    object qryTemplateFacturaNOMBRE_ARCHIVO: TIBStringField
      FieldName = 'NOMBRE_ARCHIVO'
      Origin = 'TEMPLATE_XLS_MASTER.NOMBRE_ARCHIVO'
      Size = 110
    end
    object qryTemplateFacturaNOMBRE_TEMPLATE: TIBStringField
      FieldName = 'NOMBRE_TEMPLATE'
      Origin = 'TEMPLATE_XLS_DOC.NOMBRE_TEMPLATE'
      Size = 110
    end
    object qryTemplateFacturaSERIEID: TIntegerField
      FieldName = 'SERIEID'
      Origin = 'TEMPLATE_XLS.SERIEID'
      Required = True
    end
    object qryTemplateFacturaNUMEROID: TIntegerField
      FieldName = 'NUMEROID'
      Origin = 'TEMPLATE_XLS.NUMEROID'
      Required = True
    end
    object qryTemplateFacturaNOMBRE_CAMPO: TIBStringField
      FieldName = 'NOMBRE_CAMPO'
      Origin = 'TEMPLATE_XLS.NOMBRE_CAMPO'
      Size = 70
    end
    object qryTemplateFacturaDESCRIPCION_LABEL: TIBStringField
      FieldName = 'DESCRIPCION_LABEL'
      Origin = 'TEMPLATE_XLS.DESCRIPCION_LABEL'
      Size = 100
    end
    object qryTemplateFacturaCOLUMNA_NOMBRE: TIBStringField
      FieldName = 'COLUMNA_NOMBRE'
      Origin = 'TEMPLATE_XLS.COLUMNA_NOMBRE'
      Size = 8
    end
    object qryTemplateFacturaFILE_NUMERO: TIBStringField
      FieldName = 'FILE_NUMERO'
      Origin = 'TEMPLATE_XLS.FILE_NUMERO'
      Size = 8
    end
    object qryTemplateFacturaISDETAIL: TSmallintField
      FieldName = 'ISDETAIL'
      Origin = 'TEMPLATE_XLS.ISDETAIL'
    end
    object qryTemplateFacturaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TEMPLATE_XLS.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryVentaFactura: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryVentaFacturaAfterScroll
    OnCalcFields = qryVentaFacturaCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  VENTAS_MAST.NUMERO,'
      '  VENTAS_MAST.FECHA,'
      '  VENTAS_MAST.FECHAINICIAPOLIZA,'
      '  VENTAS_MAST.CIA_KEY,'
      '  VENTAS_MAST.CODIGO_CTE, '
      '  VENTAS_MAST.CODIGO_VENDEDOR,'
      '  VENTAS_MAST.FORMA_PAGO,'
      '  VENTAS_MAST.OBSERVACION,'
      '  VENTAS_MAST.MONEDA,'
      '  VENTAS_MAST.VALOR_TOTAL_DET,'
      '  VENTAS_MAST.STATUS,'
      '  VENTAS_MAST.FECHA_IN,'
      '  VENTAS_MAST.IN_POR,'
      '  VENTAS_MAST.FECHA_MOD,'
      '  VENTAS_MAST.MOD_POR,'
      '  VENTAS_MAST.NUMERO_FACTURA,'
      '  VENTAS_MAST.NUMERO_DOC_PAGO,'
      '  VENTAS_MAST.SERIE_NCF_ASIGNADO,'
      '  VENTAS_MAST.monto_recargo,'
      '  VENTAS_MAST.MONTO_BRUTO,'
      '  VENTAS_MAST.PORC_DESCUENTO,'
      '  VENTAS_MAST.MONTO_DESCUENTO,'
      '  VENTAS_MAST.MONTO_INICIAL,'
      '  VENTAS_MAST.NOMBRE_CLIENTE_GENERAL,'
      '  VENTAS_MAST.MONTO_PAGADO,'
      '  VENTAS_MAST.MONTO_CAMBIO,'
      '  VENTAS_MAST.MONTO_TOTAL_ITBIS,'
      '  VENTAS_MAST.SERIE_NCF_ASIGNADO,'
      '  VENTAS_MAST.MONTO_EXONERADO_ITBIS,'
      '  CLIENTES.TIPO_CLIENTE,'
      '  CLIENTES.NOMBRE_CTE,'
      '  CLIENTES.NOMBRE_ABREV,'
      '  CLIENTES.NOMBRE_FACTURAR,'
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.FORMA_PAGO,'
      '  CLIENTES.LIMITE_CREDITO,'
      '  CLIENTES.EMAIL,'
      '  CLIENTES.PAIS,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.CEDULA,'
      '  CLIENTES.RNC,'
      '  CLIENTES.CANT_DIAS_CREDITO,'
      '  CLIENTES.RNC_NUMERO,'
      '  CLIENTES.CONDICION,'
      '  CLIENTES.PRECIO_ID,'
      '  FACTURAS.TIPO_FACTURA,'
      '  FACTURAS.APLICA_TIPODESC,'
      '  VENTAS_MAST.MONTODESCGASTOSADMIN,'
      '  VENTAS_MAST.MONTODESCITBISGASTOSADMIN,'
      '  VENTAS_MAST.MONTODESCTRANSP,'
      '  VENTAS_MAST.MONTODESCDIRTECNICA,'
      '  VENTAS_MAST.MONTODESCITBISDIRTECNICA,'
      '  VENTAS_MAST.MONTODESCIMPREVISTO,'
      '  VENTAS_MAST.MONTODESCITBISIMPREVISTO,'
      '  FACTURAS.SERIE AS SERIEFACTURA,'
      '  FACTURAS.NUMERO AS NUMEROFACTURA,'
      '  FACTURAS.MONEDA AS MONEDAFACTURA,'
      '  FACTURAS.TIPO AS TIPOFACTURA,'
      'ventas_mast.IDNUMERODVEH,'
      
        ' COALESCE (CONDICION.DESCRIPCION ,'#39'CONTADO'#39' ) AS   CONDICIONCRED' +
        'ITO,  '
      '  NCF_ASIGNADOS.TIPO_NCF,'
      '  NCF_ASIGNADOS.NUMERO_NCF,'
      'iif(Position('#39'B'#39' in NCF_ASIGNADOS.NUMERO_NCF) > 0,'
      
        '  tipo_cf.descripcion_2018,TIPO_CF.DESCRIPCION) AS DESCRIPCION_N' +
        'CF,'
      
        '(VENTAS_MAST.MontoDescGastosAdmin +  VENTAS_MAST.MontoDescItbisG' +
        'astosAdmin +  VENTAS_MAST.MontoDescTransp +  VENTAS_MAST.MontoDe' +
        'scDirtecnica +  VENTAS_MAST.MontoDescItbisDirTecnica +  VENTAS_M' +
        'AST.MontoDescImprevisto +  VENTAS_MAST.MontoDescItbisImprevisto)' +
        '  AS SubTotalIndirectos,'
      'VENTAS_MAST.Comentario,'
      'VENTAS_MAST.COTIZACION_ORIGEN,'
      'VENTAS_MAST.REFERENCIACTE,'
      'VENTAS_MAST.TIPONCFIFISCAL,'
      'ventas_mast.propina,'
      'ventas_mast.propinalegal,'
      'ventas_mast.porcpropinalegal,'
      'dgii.FECHA_VENCE fechavenceNCF,'
      'sectores.DESCRIPCION desc_sector,'
      'cc.DESCRIPCION desc_ciudad,'
      'PRE_PAGO.MONTO montoPrepagado'
      'FROM'
      '  VENTAS_MAST'
      
        '  INNER JOIN CLIENTES ON (VENTAS_MAST.CODIGO_CTE = CLIENTES.CODI' +
        'GO_CTE)'
      
        '  INNER JOIN FACTURAS ON (VENTAS_MAST.NUMERO_FACTURA = FACTURAS.' +
        'NUMERO)'
      
        '  LEFT OUTER JOIN CONDICION ON (CLIENTES.CONDICION = CONDICION.C' +
        'ODIGO)'
      
        '  LEFT OUTER JOIN NCF_ASIGNADOS ON (VENTAS_MAST.SERIE_NCF_ASIGNA' +
        'DO = NCF_ASIGNADOS.SERIE)'
      
        '  LEFT OUTER JOIN TIPO_CF ON (NCF_ASIGNADOS.TIPO_NCF = TIPO_CF.T' +
        'IPO_CF)'
      
        '  left outer join DGII_SERIE_NFC dgii on dgii.TIPO_CF = tipo_cf.' +
        'TIPO_CF'
      '  left outer join CIUDAD cc on cc.CODIGO = CLIENTES.COD_CIUDAD'
      
        '  left outer join SECTORES  on SECTORES.CODIGO = CLIENTES.CODZON' +
        'A'
      
        '  left outer join PRE_PAGO  on PRE_PAGO.NUM_TRN_VTA = VENTAS_MAS' +
        'T.NUMERO')
    OnFilterRecord = qryVentaFacturaFilterRecord
    Left = 456
    Top = 325
    object qryVentaFacturaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryVentaFacturaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryVentaFacturaCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VENTAS_MAST.CIA_KEY'
    end
    object qryVentaFacturaCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST.CODIGO_CTE'
    end
    object qryVentaFacturaCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VENTAS_MAST.CODIGO_VENDEDOR'
    end
    object qryVentaFacturaFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VENTAS_MAST.FORMA_PAGO'
    end
    object qryVentaFacturaOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VENTAS_MAST.OBSERVACION'
      Size = 60
    end
    object qryVentaFacturaMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_MAST.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST.VALOR_TOTAL_DET'
    end
    object qryVentaFacturaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENTAS_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_MAST.FECHA_IN'
    end
    object qryVentaFacturaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_MAST.IN_POR'
      Size = 12
    end
    object qryVentaFacturaFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_MAST.FECHA_MOD'
    end
    object qryVentaFacturaMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_MAST.MOD_POR'
      Size = 12
    end
    object qryVentaFacturaNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST.NUMERO_FACTURA'
    end
    object qryVentaFacturaNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VENTAS_MAST.NUMERO_DOC_PAGO'
    end
    object qryVentaFacturaSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
    object qryVentaFacturaMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'VENTAS_MAST.MONTO_BRUTO'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaPORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VENTAS_MAST.PORC_DESCUENTO'
    end
    object qryVentaFacturaMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_MAST.MONTO_DESCUENTO'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'VENTAS_MAST.MONTO_INICIAL'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'VENTAS_MAST.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
    object qryVentaFacturaMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VENTAS_MAST.MONTO_PAGADO'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'VENTAS_MAST.MONTO_CAMBIO'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'VENTAS_MAST.MONTO_TOTAL_ITBIS'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
    object qryVentaFacturaNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryVentaFacturaNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object qryVentaFacturaDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryVentaFacturaTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryVentaFacturaFORMA_PAGO1: TSmallintField
      FieldName = 'FORMA_PAGO1'
      Origin = 'CLIENTES.FORMA_PAGO'
    end
    object qryVentaFacturaLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object qryVentaFacturaEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object qryVentaFacturaPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryVentaFacturaCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryVentaFacturaCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryVentaFacturaRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'CLIENTES.RNC'
      Size = 12
    end
    object qryVentaFacturaCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'CLIENTES.CANT_DIAS_CREDITO'
    end
    object qryVentaFacturaRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryVentaFacturaCONDICION: TIntegerField
      FieldName = 'CONDICION'
      Origin = 'CLIENTES.CONDICION'
    end
    object qryVentaFacturaPRECIO_ID: TIntegerField
      FieldName = 'PRECIO_ID'
      Origin = 'CLIENTES.PRECIO_ID'
    end
    object qryVentaFacturaTIPO_FACTURA: TSmallintField
      FieldName = 'TIPO_FACTURA'
      Origin = 'FACTURAS.TIPO_FACTURA'
    end
    object qryVentaFacturaAPLICA_TIPODESC: TSmallintField
      FieldName = 'APLICA_TIPODESC'
      Origin = 'FACTURAS.APLICA_TIPODESC'
    end
    object qryVentaFacturaMONTODESCGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCGASTOSADMIN'
      Origin = 'VENTAS_MAST.MONTODESCGASTOSADMIN'
    end
    object qryVentaFacturaMONTODESCITBISGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCITBISGASTOSADMIN'
      Origin = 'VENTAS_MAST.MONTODESCITBISGASTOSADMIN'
    end
    object qryVentaFacturaMONTODESCTRANSP: TFloatField
      FieldName = 'MONTODESCTRANSP'
      Origin = 'VENTAS_MAST.MONTODESCTRANSP'
    end
    object qryVentaFacturaMONTODESCDIRTECNICA: TFloatField
      FieldName = 'MONTODESCDIRTECNICA'
      Origin = 'VENTAS_MAST.MONTODESCDIRTECNICA'
    end
    object qryVentaFacturaMONTODESCITBISDIRTECNICA: TFloatField
      FieldName = 'MONTODESCITBISDIRTECNICA'
      Origin = 'VENTAS_MAST.MONTODESCITBISDIRTECNICA'
    end
    object qryVentaFacturaMONTODESCIMPREVISTO: TFloatField
      FieldName = 'MONTODESCIMPREVISTO'
      Origin = 'VENTAS_MAST.MONTODESCIMPREVISTO'
    end
    object qryVentaFacturaMONTODESCITBISIMPREVISTO: TFloatField
      FieldName = 'MONTODESCITBISIMPREVISTO'
      Origin = 'VENTAS_MAST.MONTODESCITBISIMPREVISTO'
    end
    object qryVentaFacturaSERIEFACTURA: TFloatField
      FieldName = 'SERIEFACTURA'
      Origin = 'FACTURAS.SERIE'
      Required = True
    end
    object qryVentaFacturaNUMEROFACTURA: TFloatField
      FieldName = 'NUMEROFACTURA'
      Origin = 'FACTURAS.NUMERO'
      Required = True
    end
    object qryVentaFacturaMONEDAFACTURA: TIBStringField
      FieldName = 'MONEDAFACTURA'
      Origin = 'FACTURAS.MONEDA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryVentaFacturaTIPOFACTURA: TSmallintField
      FieldName = 'TIPOFACTURA'
      Origin = 'FACTURAS.TIPO'
      Required = True
    end
    object qryVentaFacturaCONDICIONCREDITO: TIBStringField
      FieldName = 'CONDICIONCREDITO'
      Origin = 'CONDICION.DESCRIPCION'
    end
    object qryVentaFacturaNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
    object qryVentaFacturaDESCRIPCION_NCF: TIBStringField
      FieldName = 'DESCRIPCION_NCF'
      Origin = 'TIPO_CF.DESCRIPCION'
      Size = 60
    end
    object qryVentaFacturaSUBTOTALINDIRECTOS: TFloatField
      FieldName = 'SUBTOTALINDIRECTOS'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaCOMENTARIO: TIBStringField
      FieldName = 'COMENTARIO'
      Origin = 'VENTAS_MAST.COMENTARIO'
      Size = 80
    end
    object qryVentaFacturaFechaVence: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'FechaVence'
      Calculated = True
    end
    object qryVentaFacturaNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryVentaFacturaCOTIZACION_ORIGEN: TIntegerField
      FieldName = 'COTIZACION_ORIGEN'
      Origin = 'VENTAS_MAST.COTIZACION_ORIGEN'
    end
    object qryVentaFacturaREFERENCIACTE: TIBStringField
      FieldName = 'REFERENCIACTE'
      Origin = 'VENTAS_MAST.REFERENCIACTE'
    end
    object qryVentaFacturaMONTO_RECARGO: TFloatField
      FieldName = 'MONTO_RECARGO'
      Origin = 'VENTAS_MAST.MONTO_RECARGO'
    end
    object qryVentaFacturaTIPONCFIFISCAL: TIntegerField
      FieldName = 'TIPONCFIFISCAL'
      Origin = 'VENTAS_MAST.TIPONCFIFISCAL'
    end
    object qryVentaFacturaMONTO_EXONERADO_ITBIS: TFloatField
      FieldName = 'MONTO_EXONERADO_ITBIS'
      Origin = 'VENTAS_MAST.MONTO_EXONERADO_ITBIS'
    end
    object qryVentaFacturaPROPINA: TFloatField
      FieldName = 'PROPINA'
      Origin = 'VENTAS_MAST.PROPINA'
    end
    object qryVentaFacturaPROPINALEGAL: TFloatField
      FieldName = 'PROPINALEGAL'
      Origin = 'VENTAS_MAST.PROPINALEGAL'
    end
    object qryVentaFacturaPORCPROPINALEGAL: TFloatField
      FieldName = 'PORCPROPINALEGAL'
      Origin = 'VENTAS_MAST.PORCPROPINALEGAL'
    end
    object qryVentaFacturaFECHAVENCENCF: TDateTimeField
      FieldName = 'FECHAVENCENCF'
      Origin = 'DGII_SERIE_NFC.FECHA_VENCE'
    end
    object qryVentaFacturaDESC_SECTOR: TIBStringField
      FieldName = 'DESC_SECTOR'
      Origin = 'SECTORES.DESCRIPCION'
      Size = 40
    end
    object qryVentaFacturaDESC_CIUDAD: TIBStringField
      FieldName = 'DESC_CIUDAD'
      Origin = 'CIUDAD.DESCRIPCION'
      Size = 35
    end
    object qryVentaFacturaTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'NCF_ASIGNADOS.TIPO_NCF'
      Size = 2
    end
    object qryVentaFacturaFECHAINICIAPOLIZA: TDateTimeField
      FieldName = 'FECHAINICIAPOLIZA'
      Origin = 'VENTAS_MAST.FECHAINICIAPOLIZA'
    end
    object qryVentaFacturaIDNUMERODVEH: TIntegerField
      FieldName = 'IDNUMERODVEH'
      Origin = 'VENTAS_MAST.IDNUMERODVEH'
    end
    object qryVentaFacturaMONTOPREPAGADO: TFloatField
      FieldName = 'MONTOPREPAGADO'
      Origin = 'PRE_PAGO.MONTO'
    end
  end
  object qryVentaFacturaDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  i.referencia,'
      '  F.DESCRIPCION AS DESC_TIPO_NCF,'
      '  D.SERIE,'
      '  D.CODIGO_PROD,'
      '  D.CANTIDAD,'
      '  d.cant_conduce,'
      '  Abs(D.PRECIO) Precio,'
      '  D.PORC_DESC_DET,'
      '  Abs(D.ITBI_DET)  ITBI_DET,'
      '  d.porc_desc_item,'
      '  Abs(d.monto_desc_item)  monto_desc_item,'
      '  Abs(D.VALOR_SERVICIO_DET) VALOR_SERVICIO_DET,'
      '  Abs(D.VALOR_TOTAL_DET) VALOR_TOTAL_DET,'
      '  V.NUMERO_FACTURA,'
      '  D.STATUS_DET,'
      '  V.SERIE_NCF_ASIGNADO,'
      '  N.NUMERO_NCF,'
      '  Abs(V.MONTO_DESCUENTO) MONTO_DESCUENTO,'
      '  D.NUMERO,'
      '  D.CODIGO_BARRA,'
      '  D.NUM_FACTURA,'
      '  D.FECHA_IN,'
      '  D.IN_POR,'
      '  D.FECHA_MOD,'
      '  D.MOD_POR,'
      '  D.CANT_REGRESO,'
      '  D.CANT_PROMO,'
      '  D.MONTO_DIETA,'
      '  D.MONTO_AJUSTE,'
      '  D.SERIE_PROD,'
      '  D.STATUS_CNT,'
      '  D.TIPO_UNIDAD,'
      '  D.ITBIS_EXENTO,'
      '  D.TIPO_VENTA,'
      '  D.LEVEL_PRECIO_VENTA,'
      '   D.DESCRIPCION, d.NUM_CONDUCE_CTE, d.NUM_IDENT, d.FICHA_VEH,'
      'D.DESCRIPCIONPRODUCTO DescripcionAdicional,'
      '  d.precio_compra,d.cant_viajes,'
      '  case  nullif( D.DESCRIPCIONPRODUCTO, '#39#39' ) when '#39#39'  then'
      '    D.DESCRIPCION'
      '  else '
      '   D.DESCRIPCION ||'#39' '#39'|| D.DESCRIPCIONPRODUCTO'
      '   end as DESCRIPCIONPRODUCTO, D.CODIGO_VENDEDOR,'
      '   u.descripcion DescUnidadMedida, '
      
        ' SUBSTRING(u.DESCRIPCION from 1 for 1) LTIPO_UNIDAD, u.cantidad ' +
        'cantXunidad '
      'FROM'
      '  VENTAS_MAST V'
      '  INNER JOIN VENTAS_DET D ON (V.NUMERO = D.NUMERO)'
      
        '  LEFT OUTER JOIN NCF_ASIGNADOS N ON (V.SERIE_NCF_ASIGNADO = N.S' +
        'ERIE)'
      '  LEFT OUTER JOIN TIPO_CF F ON (N.TIPO_NCF = F.TIPO_CF)'
      '  Left Outer join UNIDADES u on (d.tipo_unidad = u.idunidad)'
      
        '  left outer join INVENTARIO_PRODUCTO i on i.codigo = d.CODIGO_P' +
        'ROD'
      'Where   v.NUMERO =:numero'
      'order by d.numero, d.serie')
    Left = 88
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
        Value = '47235'
      end>
    object qryVentaFacturaDetDESC_TIPO_NCF: TIBStringField
      FieldName = 'DESC_TIPO_NCF'
      Origin = 'TIPO_CF.DESCRIPCION'
      Size = 60
    end
    object qryVentaFacturaDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET.SERIE'
      Required = True
    end
    object qryVentaFacturaDetCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryVentaFacturaDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object qryVentaFacturaDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET.CANTIDAD'
    end
    object qryVentaFacturaDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET.PRECIO'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET.PORC_DESC_DET'
    end
    object qryVentaFacturaDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET.ITBI_DET'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaDetVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET.VALOR_SERVICIO_DET'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaDetVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_DET.VALOR_TOTAL_DET'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaDetNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST.NUMERO_FACTURA'
    end
    object qryVentaFacturaDetSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaDetSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
    object qryVentaFacturaDetNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
    object qryVentaFacturaDetMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_MAST.MONTO_DESCUENTO'
    end
    object qryVentaFacturaDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_DET.NUMERO'
      Required = True
    end
    object qryVentaFacturaDetCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VENTAS_DET.CODIGO_BARRA'
    end
    object qryVentaFacturaDetNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VENTAS_DET.NUM_FACTURA'
    end
    object qryVentaFacturaDetCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VENTAS_DET.CANT_REGRESO'
    end
    object qryVentaFacturaDetCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VENTAS_DET.CANT_PROMO'
    end
    object qryVentaFacturaDetMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VENTAS_DET.MONTO_DIETA'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaDetMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VENTAS_DET.MONTO_AJUSTE'
      DisplayFormat = ',0.00'
    end
    object qryVentaFacturaDetSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VENTAS_DET.SERIE_PROD'
      Size = 50
    end
    object qryVentaFacturaDetSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VENTAS_DET.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaDetTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VENTAS_DET.TIPO_UNIDAD'
    end
    object qryVentaFacturaDetITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VENTAS_DET.ITBIS_EXENTO'
    end
    object qryVentaFacturaDetTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VENTAS_DET.TIPO_VENTA'
    end
    object qryVentaFacturaDetDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VENTAS_DET.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryVentaFacturaDetPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'VENTAS_DET.PRECIO_COMPRA'
    end
    object qryVentaFacturaDetCANT_CONDUCE: TFloatField
      FieldName = 'CANT_CONDUCE'
      Origin = 'VENTAS_DET.CANT_CONDUCE'
    end
    object qryVentaFacturaDetPORC_DESC_ITEM: TFloatField
      FieldName = 'PORC_DESC_ITEM'
      Origin = 'VENTAS_DET.PORC_DESC_ITEM'
    end
    object qryVentaFacturaDetMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VENTAS_DET.MONTO_DESC_ITEM'
    end
    object qryVentaFacturaDetCANT_VIAJES: TFloatField
      FieldName = 'CANT_VIAJES'
      Origin = 'VENTAS_DET.CANT_VIAJES'
    end
    object qryVentaFacturaDetDESCUNIDADMEDIDA: TIBStringField
      FieldName = 'DESCUNIDADMEDIDA'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
    object qryVentaFacturaDetLTIPO_UNIDAD: TIBStringField
      FieldName = 'LTIPO_UNIDAD'
      Size = 50
    end
    object qryVentaFacturaDetCANTXUNIDAD: TIntegerField
      FieldName = 'CANTXUNIDAD'
      Origin = 'UNIDADES.CANTIDAD'
    end
    object qryVentaFacturaDetREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object qryVentaFacturaDetDESCRIPCIONADICIONAL: TMemoField
      FieldName = 'DESCRIPCIONADICIONAL'
      Origin = 'VENTAS_DET.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryVentaFacturaDetNUM_IDENT: TIBStringField
      FieldName = 'NUM_IDENT'
      Origin = 'VENTAS_DET.NUM_IDENT'
      Size = 40
    end
    object qryVentaFacturaDetFICHA_VEH: TIntegerField
      FieldName = 'FICHA_VEH'
      Origin = 'VENTAS_DET.FICHA_VEH'
    end
    object qryVentaFacturaDetNUM_CONDUCE_CTE: TIBStringField
      FieldName = 'NUM_CONDUCE_CTE'
      Origin = 'VENTAS_DET.NUM_CONDUCE_CTE'
      Size = 60
    end
    object qryVentaFacturaDetCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VENTAS_DET.CODIGO_VENDEDOR'
    end
    object qryVentaFacturaDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_DET.MOD_POR'
      Size = 12
    end
    object qryVentaFacturaDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_DET.FECHA_MOD'
    end
    object qryVentaFacturaDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_DET.IN_POR'
      Size = 12
    end
    object qryVentaFacturaDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_DET.FECHA_IN'
    end
    object qryVentaFacturaDetLEVEL_PRECIO_VENTA: TSmallintField
      FieldName = 'LEVEL_PRECIO_VENTA'
      Origin = 'VENTAS_DET.LEVEL_PRECIO_VENTA'
    end
  end
  object dsqryVentaFactura: TDataSource
    DataSet = qryVentaFactura
    Left = 344
    Top = 417
  end
  object dsqryVentaFacturaDet: TDataSource
    DataSet = qryVentaFacturaDet
    Left = 112
    Top = 393
  end
  object qryVentaFactura_0: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryVentaFacturaAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  VENTAS_MAST.NUMERO,'
      '  VENTAS_MAST.FECHA,'
      '  VENTAS_MAST.FECHAINICIAPOLIZA,'
      '  VENTAS_MAST.CIA_KEY,'
      '  VENTAS_MAST.CODIGO_CTE,'
      '  VENTAS_MAST.CODIGO_VENDEDOR,'
      '  VENTAS_MAST.FORMA_PAGO,'
      '  VENTAS_MAST.OBSERVACION,'
      '  VENTAS_MAST.MONEDA,'
      '  VENTAS_MAST.VALOR_TOTAL_DET,'
      '  VENTAS_MAST.STATUS,'
      '  VENTAS_MAST.FECHA_IN,'
      '  VENTAS_MAST.IN_POR,'
      '  VENTAS_MAST.FECHA_MOD,'
      '  VENTAS_MAST.MOD_POR,'
      'VENTAS_MAST.IDNUMERODVEH,'
      'Case'
      
        '   when (VENTAS_MAST.NUMERO_FACTURA is null) then CAST(VENTAS_MA' +
        'ST.NUMERO_DOC_PAGO AS INTEGER)        '
      '   else VENTAS_MAST.NUMERO_FACTURA'
      ' end as NUMERO_FACTURA,  '
      'VENTAS_MAST.NUMERO_DOC_PAGO,'
      '  VENTAS_MAST.SERIE_NCF_ASIGNADO,'
      '  VENTAS_MAST.MONTO_EXONERADO_ITBIS,'
      '  VENTAS_MAST.MONTO_BRUTO,'
      '  VENTAS_MAST.PORC_DESCUENTO,'
      '  VENTAS_MAST.MONTO_DESCUENTO,'
      '  VENTAS_MAST.MONTO_INICIAL,'
      '  VENTAS_MAST.NOMBRE_CLIENTE_GENERAL,'
      '  VENTAS_MAST.MONTO_PAGADO,'
      '  VENTAS_MAST.MONTO_CAMBIO,'
      '  VENTAS_MAST.MONTO_TOTAL_ITBIS,'
      '  CLIENTES.TIPO_CLIENTE,'
      '  CLIENTES.NOMBRE_CTE,'
      '  CLIENTES.NOMBRE_ABREV,'
      '  CLIENTES.NOMBRE_FACTURAR,'
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.FORMA_PAGO,'
      '  CLIENTES.LIMITE_CREDITO,'
      '  CLIENTES.EMAIL,'
      '  CLIENTES.PAIS,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.CEDULA,'
      '  CLIENTES.RNC,'
      '  CLIENTES.CANT_DIAS_CREDITO,'
      '  CLIENTES.RNC_NUMERO,'
      '  CLIENTES.CONDICION,'
      '  CLIENTES.PRECIO_ID,'
      '  FACTURAS.TIPO_FACTURA,'
      '  FACTURAS.APLICA_TIPODESC,'
      '  VENTAS_MAST.MONTODESCGASTOSADMIN,'
      '  VENTAS_MAST.MONTODESCITBISGASTOSADMIN,'
      '  VENTAS_MAST.MONTODESCTRANSP,'
      '  VENTAS_MAST.MONTODESCDIRTECNICA,'
      '  VENTAS_MAST.MONTODESCITBISDIRTECNICA,'
      '  VENTAS_MAST.MONTODESCIMPREVISTO,'
      '  VENTAS_MAST.MONTODESCITBISIMPREVISTO,'
      'VENTAS_MAST.monto_recargo,'
      '  FACTURAS.SERIE AS SERIEFACTURA,'
      '  FACTURAS.NUMERO AS NUMEROFACTURA,'
      '  FACTURAS.MONEDA AS MONEDAFACTURA,'
      '  FACTURAS.TIPO AS TIPOFACTURA,'
      
        ' COALESCE (CONDICION.DESCRIPCION ,'#39'CONTADO'#39' ) AS CONDICIONCREDIT' +
        'O,  '
      'NCF_ASIGNADOS.TIPO_NCF,'
      '  NCF_ASIGNADOS.NUMERO_NCF,'
      'iif(Position('#39'B'#39' in NCF_ASIGNADOS.NUMERO_NCF) > 0,'
      
        '  tipo_cf.descripcion_2018,TIPO_CF.DESCRIPCION) AS DESCRIPCION_N' +
        'CF,'
      
        '(VENTAS_MAST.MontoDescGastosAdmin +  VENTAS_MAST.MontoDescItbisG' +
        'astosAdmin +  VENTAS_MAST.MontoDescTransp +  VENTAS_MAST.MontoDe' +
        'scDirtecnica +  VENTAS_MAST.MontoDescItbisDirTecnica +  VENTAS_M' +
        'AST.MontoDescImprevisto +  VENTAS_MAST.MontoDescItbisImprevisto)' +
        '  AS SubTotalIndirectos,'
      'VENTAS_MAST.Comentario,'
      'VENTAS_MAST.COTIZACION_ORIGEN,'
      'VENTAS_MAST.Monto_recargo,'
      'VENTAS_MAST.REFERENCIACTE,'
      'VENTAS_MAST.TIPONCFIFISCAL,'
      ' VENTAS_MAST.SERIE_NCF_ASIGNADO,'
      'ventas_mast.propina,'
      'ventas_mast.propinalegal,'
      'ventas_mast.porcpropinalegal,'
      'dgii.FECHA_VENCE fechavenceNCF,'
      'sectores.DESCRIPCION desc_sector,'
      'cc.DESCRIPCION desc_ciudad,'
      'PRE_PAGO.MONTO montoPrepagado'
      'FROM'
      'VENTAS_MAST'
      
        'INNER JOIN CLIENTES ON (VENTAS_MAST.CODIGO_CTE = CLIENTES.CODIGO' +
        '_CTE)'
      
        'INNER JOIN FACTURAS ON (VENTAS_MAST.NUMERO_FACTURA = FACTURAS.NU' +
        'MERO)'
      
        'LEFT OUTER JOIN CONDICION ON (CLIENTES.CONDICION = CONDICION.COD' +
        'IGO)'
      
        'LEFT OUTER JOIN NCF_ASIGNADOS ON (VENTAS_MAST.SERIE_NCF_ASIGNADO' +
        ' = NCF_ASIGNADOS.SERIE)'
      
        'LEFT OUTER JOIN TIPO_CF ON (NCF_ASIGNADOS.TIPO_NCF = TIPO_CF.TIP' +
        'O_CF)'
      
        'Left outer join DGII_SERIE_NFC dgii on dgii.TIPO_CF = tipo_cf.TI' +
        'PO_CF '
      'Left outer join CIUDAD cc on cc.CODIGO = CLIENTES.COD_CIUDAD'
      'Left outer join SECTORES  on SECTORES.CODIGO = CLIENTES.CODZONA'
      
        'left outer join PRE_PAGO  on PRE_PAGO.NUM_TRN_VTA = VENTAS_MAST.' +
        'NUMERO')
    Left = 624
    Top = 372
  end
  object qryDatosTrncxc: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From PROC_GETTRANSNOTA_CR_DB(:tipo) '
      'where num_doc =:numdoc'
      '--Select * From PROC_gettrncxc(numerodoc,ciakey)'
      '--1-Venta credito --- 2 -Venta Contado')
    Left = 528
    Top = 298
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'numdoc'
        ParamType = ptInput
      end>
    object qryDatosTrncxcSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.SERIE'
    end
    object qryDatosTrncxcNOMBRE_COMPLETO: TIBStringField
      FieldName = 'NOMBRE_COMPLETO'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.NOMBRE_COMPLETO'
      Size = 80
    end
    object qryDatosTrncxcNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.NUMERO_NCF'
      Size = 21
    end
    object qryDatosTrncxcTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.TIPO_NCF'
      Size = 2
    end
    object qryDatosTrncxcNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.NOMBRE_CTE'
      Size = 60
    end
    object qryDatosTrncxcCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryDatosTrncxcRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.RNC_NUMERO'
      Size = 14
    end
    object qryDatosTrncxcDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.DIRECCION_CONT'
      Size = 60
    end
    object qryDatosTrncxcNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryDatosTrncxcTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.TELEF_CONTACTO'
      Size = 14
    end
    object qryDatosTrncxcNUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.NUM_DOC'
    end
    object qryDatosTrncxcNUMERO_FACT: TSmallintField
      FieldName = 'NUMERO_FACT'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.NUMERO_FACT'
    end
    object qryDatosTrncxcSERIE_NCF_ASIGNADO: TSmallintField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.SERIE_NCF_ASIGNADO'
    end
    object qryDatosTrncxcVALOR_DOCUMENTO: TFloatField
      FieldName = 'VALOR_DOCUMENTO'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.VALOR_DOCUMENTO'
    end
    object qryDatosTrncxcCODIGO_CLIENTE: TSmallintField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.CODIGO_CLIENTE'
    end
    object qryDatosTrncxcNUM_NCF_AFECTADO: TIBStringField
      FieldName = 'NUM_NCF_AFECTADO'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.NUM_NCF_AFECTADO'
      Size = 21
    end
    object qryDatosTrncxcTIPO_TRANF: TSmallintField
      FieldName = 'TIPO_TRANF'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.TIPO_TRANF'
    end
    object qryDatosTrncxcTIPO_DOC: TIntegerField
      FieldName = 'TIPO_DOC'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.TIPO_DOC'
    end
    object qryDatosTrncxcFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.FECHA'
    end
    object qryDatosTrncxcCONCEPTO: TIBStringField
      FieldName = 'CONCEPTO'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.CONCEPTO'
      Size = 60
    end
    object qryDatosTrncxcMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'PROC_GETTRANSNOTA_CR_DB.MONEDA'
      FixedChar = True
      Size = 1
    end
  end
  object qryPorcApplicadoenFactServ: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from Proc_PORC_APLICADO_FCT_SERV_S1(:numerotrn)')
    Left = 528
    Top = 350
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numerotrn'
        ParamType = ptUnknown
      end>
    object qryPorcApplicadoenFactServPORCGADMIN: TFloatField
      FieldName = 'PORCGADMIN'
      Origin = 'PROC_PORC_APLICADO_FCT_SERV_S1.PORCGADMIN'
    end
    object qryPorcApplicadoenFactServPORCITBISGADMIN: TFloatField
      FieldName = 'PORCITBISGADMIN'
      Origin = 'PROC_PORC_APLICADO_FCT_SERV_S1.PORCITBISGADMIN'
    end
    object qryPorcApplicadoenFactServPORCTRANS: TFloatField
      FieldName = 'PORCTRANS'
      Origin = 'PROC_PORC_APLICADO_FCT_SERV_S1.PORCTRANS'
    end
    object qryPorcApplicadoenFactServPORCDIRTEC: TFloatField
      FieldName = 'PORCDIRTEC'
      Origin = 'PROC_PORC_APLICADO_FCT_SERV_S1.PORCDIRTEC'
    end
    object qryPorcApplicadoenFactServPORCITBISDIRTEC: TFloatField
      FieldName = 'PORCITBISDIRTEC'
      Origin = 'PROC_PORC_APLICADO_FCT_SERV_S1.PORCITBISDIRTEC'
    end
    object qryPorcApplicadoenFactServPORCIMPREVISTO: TFloatField
      FieldName = 'PORCIMPREVISTO'
      Origin = 'PROC_PORC_APLICADO_FCT_SERV_S1.PORCIMPREVISTO'
    end
    object qryPorcApplicadoenFactServPORCITBISIMPREVISTO: TFloatField
      FieldName = 'PORCITBISIMPREVISTO'
      Origin = 'PROC_PORC_APLICADO_FCT_SERV_S1.PORCITBISIMPREVISTO'
    end
  end
  object stpPorcOtrosCargosFactServ: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'Proc_PORC_APLICADO_FCT_SERV_S1'
    Left = 488
    Top = 436
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PORCGADMIN'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PORCITBISGADMIN'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PORCTRANS'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PORCDIRTEC'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PORCITBISDIRTEC'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PORCIMPREVISTO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PORCITBISIMPREVISTO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'XNUMERO_TRN'
        ParamType = ptInput
      end>
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
  object ibsqlEliminarSerieVentaDet: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Delete From VENTAS_DET'
      'Where serie =:serie')
    Transaction = dmConectar.IBTransaction1
    Left = 216
    Top = 243
  end
  object qryRepCotizaNew: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepCotizaNewAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From proc_GetDatosCotiza_new(:numerocotiza)')
    Left = 792
    Top = 258
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerocotiza'
        ParamType = ptInput
      end>
    object qryRepCotizaNewTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.TIPO_CLIENTE'
    end
    object qryRepCotizaNewNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.NOMBRE_CTE'
      Size = 60
    end
    object qryRepCotizaNewNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.NOMBRE_ABREV'
      Size = 30
    end
    object qryRepCotizaNewNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryRepCotizaNewDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.DIRECCION_CONT'
      Size = 60
    end
    object qryRepCotizaNewTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.TELEF_CONTACTO'
      Size = 14
    end
    object qryRepCotizaNewFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.FORMA_PAGO'
    end
    object qryRepCotizaNewLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.LIMITE_CREDITO'
    end
    object qryRepCotizaNewEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.EMAIL'
      Size = 40
    end
    object qryRepCotizaNewPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.PAIS'
      Size = 30
    end
    object qryRepCotizaNewCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.CIUDAD'
      Size = 30
    end
    object qryRepCotizaNewCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryRepCotizaNewRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.RNC'
      Size = 12
    end
    object qryRepCotizaNewCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.CANT_DIAS_CREDITO'
    end
    object qryRepCotizaNewRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.RNC_NUMERO'
      Size = 14
    end
    object qryRepCotizaNewCONDICION: TSmallintField
      FieldName = 'CONDICION'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.CONDICION'
    end
    object qryRepCotizaNewPRECIO_ID: TSmallintField
      FieldName = 'PRECIO_ID'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.PRECIO_ID'
    end
    object qryRepCotizaNewNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.NUMERO'
    end
    object qryRepCotizaNewFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.FECHA'
    end
    object qryRepCotizaNewCIA_KEY: TSmallintField
      FieldName = 'CIA_KEY'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.CIA_KEY'
    end
    object qryRepCotizaNewFECHA_VENCE: TDateTimeField
      FieldName = 'FECHA_VENCE'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.FECHA_VENCE'
    end
    object qryRepCotizaNewCODIGO_CTE: TSmallintField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.CODIGO_CTE'
    end
    object qryRepCotizaNewCODIGO_VENDEDOR: TSmallintField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.CODIGO_VENDEDOR'
    end
    object qryRepCotizaNewOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.OBSERVACION'
      Size = 60
    end
    object qryRepCotizaNewMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryRepCotizaNewVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.VALOR_TOTAL'
    end
    object qryRepCotizaNewSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepCotizaNewFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.FECHA_IN'
    end
    object qryRepCotizaNewIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.IN_POR'
      Size = 12
    end
    object qryRepCotizaNewFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.FECHA_MOD'
    end
    object qryRepCotizaNewMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MOD_POR'
      Size = 12
    end
    object qryRepCotizaNewNUMERO_FACTURA: TSmallintField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.NUMERO_FACTURA'
    end
    object qryRepCotizaNewNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.NUMERO_DOC_PAGO'
    end
    object qryRepCotizaNewSERIE_NCF_ASIGNADO: TSmallintField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.SERIE_NCF_ASIGNADO'
    end
    object qryRepCotizaNewMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MONTO_BRUTO'
    end
    object qryRepCotizaNewPORC_DESCUENTO: TSmallintField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.PORC_DESCUENTO'
    end
    object qryRepCotizaNewMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MONTO_DESCUENTO'
    end
    object qryRepCotizaNewMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MONTO_INICIAL'
    end
    object qryRepCotizaNewNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
    object qryRepCotizaNewMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MONTO_PAGADO'
    end
    object qryRepCotizaNewMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MONTO_CAMBIO'
    end
    object qryRepCotizaNewMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MONTO_TOTAL_ITBIS'
    end
    object qryRepCotizaNewMONTODESCGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCGASTOSADMIN'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MONTODESCGASTOSADMIN'
    end
    object qryRepCotizaNewMONTODESCITBISGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCITBISGASTOSADMIN'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MONTODESCITBISGASTOSADMIN'
    end
    object qryRepCotizaNewMONTODESCTRANSP: TFloatField
      FieldName = 'MONTODESCTRANSP'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MONTODESCTRANSP'
    end
    object qryRepCotizaNewMONTODESCDIRTECNICA: TFloatField
      FieldName = 'MONTODESCDIRTECNICA'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MONTODESCDIRTECNICA'
    end
    object qryRepCotizaNewMONTODESCITBISDIRTECNICA: TFloatField
      FieldName = 'MONTODESCITBISDIRTECNICA'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MONTODESCITBISDIRTECNICA'
    end
    object qryRepCotizaNewMONTODESCIMPREVISTO: TFloatField
      FieldName = 'MONTODESCIMPREVISTO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MONTODESCIMPREVISTO'
    end
    object qryRepCotizaNewMONTODESCITBISIMPREVISTO: TFloatField
      FieldName = 'MONTODESCITBISIMPREVISTO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MONTODESCITBISIMPREVISTO'
    end
    object qryRepCotizaNewTIPO_FACTURA: TSmallintField
      FieldName = 'TIPO_FACTURA'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.TIPO_FACTURA'
    end
    object qryRepCotizaNewAPLICA_TIPODESC: TSmallintField
      FieldName = 'APLICA_TIPODESC'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.APLICA_TIPODESC'
    end
    object qryRepCotizaNewMONEDA_FACT: TIBStringField
      FieldName = 'MONEDA_FACT'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MONEDA_FACT'
      FixedChar = True
      Size = 1
    end
    object qryRepCotizaNewCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepCotizaNewCONDICIONCREDITO: TIBStringField
      FieldName = 'CONDICIONCREDITO'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.CONDICIONCREDITO'
    end
    object qryRepCotizaNewREFERENCIACTE: TIBStringField
      FieldName = 'REFERENCIACTE'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.REFERENCIACTE'
    end
    object qryRepCotizaNewCODZON: TIntegerField
      FieldName = 'CODZON'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.CODZON'
    end
    object qryRepCotizaNewSTACOT: TSmallintField
      FieldName = 'STACOT'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.STACOT'
    end
    object qryRepCotizaNewIMPCOT: TSmallintField
      FieldName = 'IMPCOT'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.IMPCOT'
    end
    object qryRepCotizaNewMARCOT: TIBStringField
      FieldName = 'MARCOT'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MARCOT'
    end
    object qryRepCotizaNewMODCOT: TIBStringField
      FieldName = 'MODCOT'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.MODCOT'
    end
    object qryRepCotizaNewCHACOT: TIBStringField
      FieldName = 'CHACOT'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.CHACOT'
    end
    object qryRepCotizaNewKILCOT: TIBStringField
      FieldName = 'KILCOT'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.KILCOT'
    end
    object qryRepCotizaNewPLACOT: TIBStringField
      FieldName = 'PLACOT'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.PLACOT'
    end
    object qryRepCotizaNewANOCOT: TIBStringField
      FieldName = 'ANOCOT'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.ANOCOT'
      Size = 4
    end
    object qryRepCotizaNewCOLCOT: TIBStringField
      FieldName = 'COLCOT'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.COLCOT'
    end
    object qryRepCotizaNewCCMOTORCOT: TIBStringField
      FieldName = 'CCMOTORCOT'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.CCMOTORCOT'
    end
    object qryRepCotizaNewNOMBREVENDEDOR: TIBStringField
      FieldName = 'NOMBREVENDEDOR'
      Origin = 'PROC_GETDATOSCOTIZA_NEW.NOMBREVENDEDOR'
      Size = 40
    end
  end
  object qryRepCotizaDetNew: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      
        'coalesce( r.DESCRIPCIONESPECIAL, '#39#39' ) as testdesc,  Case  Nullif' +
        '( r.DESCRIPCIONESPECIAL, '#39#39' ) WHEN '#39#39'  then'
      'r.DESCRIPCION'
      'Else '
      'r.DESCRIPCION ||'#39' '#39'|| coalesce( r.DESCRIPCIONESPECIAL, '#39#39' )'
      'End AS DESCRIPCIONESPECIAL,'
      'R.PORC_DESC_ITEM,r.DESCRIPCIONESPECIAL DescripcionAdic,'
      'R.MONTO_DESC_ITEM,'
      'r.DESCRIPCION,  r.SERIE, r.NUMERO, '
      
        'r.CODIGO_PROD, r.CODIGO_BARRA,  r.existencia,r.CANTIDAD, r.PRECI' +
        'O, r.PORC_DESC_DET, r.ITBI_DET, '
      
        'r.VALOR_SERVICIO_DET, r.VALOR_TOTAL_DET, r.STATUS_DET, r.FECHA_I' +
        'N, r.IN_POR, '
      
        'r.FECHA_MOD, r.MOD_POR, r.CANT_REGRESO, r.CANT_PROMO, r.MONTO_DI' +
        'ETA, '
      
        'r.MONTO_AJUSTE, r.SERIE_PROD, r.STATUS_CNT, r.TIPO_UNIDAD, r.ITB' +
        'IS_EXENTO, '
      'r.TIPO_VENTA,'
      'r.CANT_VIAJES,'
      'r.referencia'
      'From  VIEW_COTIZACION_DET r'
      'Where r.numero=:numero '
      'order by r.numero, r.serie')
    Left = 808
    Top = 330
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
        Value = 192
      end>
    object qryRepCotizaDetNewTESTDESC: TMemoField
      FieldName = 'TESTDESC'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepCotizaDetNewDESCRIPCIONESPECIAL: TMemoField
      FieldName = 'DESCRIPCIONESPECIAL'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepCotizaDetNewDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VIEW_COTIZACION_DET.DESCRIPCION'
      Size = 80
    end
    object qryRepCotizaDetNewSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VIEW_COTIZACION_DET.SERIE'
    end
    object qryRepCotizaDetNewNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_COTIZACION_DET.NUMERO'
    end
    object qryRepCotizaDetNewCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VIEW_COTIZACION_DET.CODIGO_PROD'
      Size = 12
    end
    object qryRepCotizaDetNewCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VIEW_COTIZACION_DET.CODIGO_BARRA'
    end
    object qryRepCotizaDetNewCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VIEW_COTIZACION_DET.CANTIDAD'
    end
    object qryRepCotizaDetNewPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VIEW_COTIZACION_DET.PRECIO'
    end
    object qryRepCotizaDetNewPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VIEW_COTIZACION_DET.PORC_DESC_DET'
    end
    object qryRepCotizaDetNewITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VIEW_COTIZACION_DET.ITBI_DET'
      DisplayFormat = ',0.00'
    end
    object qryRepCotizaDetNewVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VIEW_COTIZACION_DET.VALOR_SERVICIO_DET'
    end
    object qryRepCotizaDetNewVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VIEW_COTIZACION_DET.VALOR_TOTAL_DET'
    end
    object qryRepCotizaDetNewSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VIEW_COTIZACION_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryRepCotizaDetNewFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VIEW_COTIZACION_DET.FECHA_IN'
    end
    object qryRepCotizaDetNewIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VIEW_COTIZACION_DET.IN_POR'
      Size = 12
    end
    object qryRepCotizaDetNewFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VIEW_COTIZACION_DET.FECHA_MOD'
    end
    object qryRepCotizaDetNewMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VIEW_COTIZACION_DET.MOD_POR'
      Size = 12
    end
    object qryRepCotizaDetNewCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VIEW_COTIZACION_DET.CANT_REGRESO'
    end
    object qryRepCotizaDetNewCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VIEW_COTIZACION_DET.CANT_PROMO'
    end
    object qryRepCotizaDetNewMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VIEW_COTIZACION_DET.MONTO_DIETA'
    end
    object qryRepCotizaDetNewMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VIEW_COTIZACION_DET.MONTO_AJUSTE'
    end
    object qryRepCotizaDetNewSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VIEW_COTIZACION_DET.SERIE_PROD'
      Size = 50
    end
    object qryRepCotizaDetNewSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VIEW_COTIZACION_DET.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryRepCotizaDetNewTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VIEW_COTIZACION_DET.TIPO_UNIDAD'
    end
    object qryRepCotizaDetNewITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VIEW_COTIZACION_DET.ITBIS_EXENTO'
    end
    object qryRepCotizaDetNewTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VIEW_COTIZACION_DET.TIPO_VENTA'
    end
    object qryRepCotizaDetNewPORC_DESC_ITEM: TFloatField
      FieldName = 'PORC_DESC_ITEM'
      Origin = 'VIEW_COTIZACION_DET.PORC_DESC_ITEM'
    end
    object qryRepCotizaDetNewMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VIEW_COTIZACION_DET.MONTO_DESC_ITEM'
    end
    object qryRepCotizaDetNewCANT_VIAJES: TFloatField
      FieldName = 'CANT_VIAJES'
      Origin = 'VIEW_COTIZACION_DET.CANT_VIAJES'
    end
    object qryRepCotizaDetNewEXISTENCIA: TFloatField
      FieldName = 'EXISTENCIA'
      Origin = 'VIEW_COTIZACION_DET.EXISTENCIA'
    end
    object qryRepCotizaDetNewREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'VIEW_COTIZACION_DET.REFERENCIA'
      Size = 50
    end
    object qryRepCotizaDetNewDESCRIPCIONADIC: TMemoField
      FieldName = 'DESCRIPCIONADIC'
      Origin = 'VIEW_COTIZACION_DET.DESCRIPCIONESPECIAL'
      BlobType = ftMemo
      Size = 8
    end
  end
  object ibstpInsertarPorcOtrosCargosCotiza: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_PORC_APL_COTIZA_SERV_I'
    Left = 120
    Top = 441
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
  object qryVentaFacturaConsigna: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryVentaFacturaConsignaAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  VENTAS_MAST_CONSIGNA.NUMERO,'
      '  VENTAS_MAST_CONSIGNA.FECHA,'
      '  VENTAS_MAST_CONSIGNA.CIA_KEY,'
      '  VENTAS_MAST_CONSIGNA.CODIGO_CTE,'
      '  VENTAS_MAST_CONSIGNA.CODIGO_VENDEDOR,'
      '  VENTAS_MAST_CONSIGNA.FORMA_PAGO,'
      '  VENTAS_MAST_CONSIGNA.OBSERVACION,'
      '  VENTAS_MAST_CONSIGNA.MONEDA,'
      '  VENTAS_MAST_CONSIGNA.VALOR_TOTAL_DET,'
      '  VENTAS_MAST_CONSIGNA.STATUS,'
      '  VENTAS_MAST_CONSIGNA.FECHA_IN,'
      '  VENTAS_MAST_CONSIGNA.IN_POR,'
      '  VENTAS_MAST_CONSIGNA.FECHA_MOD,'
      '  VENTAS_MAST_CONSIGNA.MOD_POR,'
      '  VENTAS_MAST_CONSIGNA.NUMERO_FACTURA,'
      '  VENTAS_MAST_CONSIGNA.NUMERO_DOC_PAGO,'
      '  VENTAS_MAST_CONSIGNA.SERIE_NCF_ASIGNADO,'
      '  VENTAS_MAST_CONSIGNA.MONTO_BRUTO,'
      '  VENTAS_MAST_CONSIGNA.PORC_DESCUENTO,'
      '  VENTAS_MAST_CONSIGNA.MONTO_DESCUENTO,'
      '  VENTAS_MAST_CONSIGNA.MONTO_INICIAL,'
      '  VENTAS_MAST_CONSIGNA.NOMBRE_CLIENTE_GENERAL,'
      '  VENTAS_MAST_CONSIGNA.MONTO_PAGADO,'
      '  VENTAS_MAST_CONSIGNA.MONTO_CAMBIO,'
      '  VENTAS_MAST_CONSIGNA.MONTO_TOTAL_ITBIS,'
      '  CLIENTES.TIPO_CLIENTE,'
      '  CLIENTES.NOMBRE_CTE,'
      '  CLIENTES.NOMBRE_ABREV,'
      '  CLIENTES.NOMBRE_FACTURAR,'
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.FORMA_PAGO,'
      '  CLIENTES.LIMITE_CREDITO,'
      '  CLIENTES.EMAIL,'
      '  CLIENTES.PAIS,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.CEDULA,'
      '  CLIENTES.RNC,'
      '  CLIENTES.CANT_DIAS_CREDITO,'
      '  CLIENTES.RNC_NUMERO,'
      '  CLIENTES.CONDICION,'
      '  CLIENTES.PRECIO_ID,'
      '  NULL AS TIPO_FACTURA,'
      '  NULL AS APLICA_TIPODESC,'
      '  VENTAS_MAST_CONSIGNA.MONTODESCGASTOSADMIN,'
      '  VENTAS_MAST_CONSIGNA.MONTODESCITBISGASTOSADMIN,'
      '  VENTAS_MAST_CONSIGNA.MONTODESCTRANSP,'
      '  VENTAS_MAST_CONSIGNA.MONTODESCDIRTECNICA,'
      '  VENTAS_MAST_CONSIGNA.MONTODESCITBISDIRTECNICA,'
      '  VENTAS_MAST_CONSIGNA.MONTODESCIMPREVISTO,'
      '  VENTAS_MAST_CONSIGNA.MONTODESCITBISIMPREVISTO,'
      '  NULL AS  SERIEFACTURA,'
      '  VENTAS_MAST_CONSIGNA.NUMERO_FACTURA as NUMEROFACTURA,'
      '  VENTAS_MAST_CONSIGNA.MONEDA AS MONEDAFACTURA,'
      '  NULL  AS TIPOFACTURA,'
      '  CONDICION.DESCRIPCION AS CONDICIONCREDITO,'
      'NCF_ASIGNADOS.TIPO_NCF,  '
      'NCF_ASIGNADOS.NUMERO_NCF,'
      'iif(substring(NCF_ASIGNADOS.NUMERO_NCF from 1 for 1)='#39'B'#39','
      
        '  tipo_cf.descripcion_2018,TIPO_CF.DESCRIPCION) AS DESCRIPCION_N' +
        'CF,'
      
        '  (VENTAS_MAST_CONSIGNA.MONTODESCGASTOSADMIN + VENTAS_MAST_CONSI' +
        'GNA.MONTODESCITBISGASTOSADMIN + VENTAS_MAST_CONSIGNA.MONTODESCTR' +
        'ANSP + VENTAS_MAST_CONSIGNA.MONTODESCDIRTECNICA + VENTAS_MAST_CO' +
        'NSIGNA.MONTODESCITBISDIRTECNICA + VENTAS_MAST_CONSIGNA.MONTODESC' +
        'IMPREVISTO + VENTAS_MAST_CONSIGNA.MONTODESCITBISIMPREVISTO) AS S' +
        'UBTOTALINDIRECTOS,'
      '  VENTAS_MAST_CONSIGNA.COMENTARIO,'
      'dgii.FECHA_VENCE fechavenceNCF'
      'FROM'
      '  VENTAS_MAST_CONSIGNA'
      
        '  INNER JOIN CLIENTES ON (VENTAS_MAST_CONSIGNA.CODIGO_CTE = CLIE' +
        'NTES.CODIGO_CTE)'
      
        '  LEFT OUTER JOIN CONDICION ON (CLIENTES.CONDICION = CONDICION.C' +
        'ODIGO)'
      
        '  LEFT OUTER JOIN NCF_ASIGNADOS ON (VENTAS_MAST_CONSIGNA.SERIE_N' +
        'CF_ASIGNADO = NCF_ASIGNADOS.SERIE)'
      
        '  LEFT OUTER JOIN TIPO_CF ON (NCF_ASIGNADOS.TIPO_NCF = TIPO_CF.T' +
        'IPO_CF)'
      
        'left outer join DGII_SERIE_NFC dgii on dgii.TIPO_CF = tipo_cf.TI' +
        'PO_CF')
    Left = 672
    Top = 158
    object qryVentaFacturaConsignaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST_CONSIGNA.NUMERO'
      Required = True
    end
    object qryVentaFacturaConsignaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST_CONSIGNA.FECHA'
    end
    object qryVentaFacturaConsignaCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VENTAS_MAST_CONSIGNA.CIA_KEY'
    end
    object qryVentaFacturaConsignaCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST_CONSIGNA.CODIGO_CTE'
    end
    object qryVentaFacturaConsignaCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VENTAS_MAST_CONSIGNA.CODIGO_VENDEDOR'
    end
    object qryVentaFacturaConsignaFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VENTAS_MAST_CONSIGNA.FORMA_PAGO'
    end
    object qryVentaFacturaConsignaOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VENTAS_MAST_CONSIGNA.OBSERVACION'
      Size = 60
    end
    object qryVentaFacturaConsignaMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_MAST_CONSIGNA.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaConsignaVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST_CONSIGNA.VALOR_TOTAL_DET'
    end
    object qryVentaFacturaConsignaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENTAS_MAST_CONSIGNA.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaConsignaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_MAST_CONSIGNA.FECHA_IN'
    end
    object qryVentaFacturaConsignaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_MAST_CONSIGNA.IN_POR'
      Size = 12
    end
    object qryVentaFacturaConsignaFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_MAST_CONSIGNA.FECHA_MOD'
    end
    object qryVentaFacturaConsignaMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_MAST_CONSIGNA.MOD_POR'
      Size = 12
    end
    object qryVentaFacturaConsignaNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VENTAS_MAST_CONSIGNA.NUMERO_DOC_PAGO'
    end
    object qryVentaFacturaConsignaSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VENTAS_MAST_CONSIGNA.SERIE_NCF_ASIGNADO'
    end
    object qryVentaFacturaConsignaMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'VENTAS_MAST_CONSIGNA.MONTO_BRUTO'
    end
    object qryVentaFacturaConsignaPORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VENTAS_MAST_CONSIGNA.PORC_DESCUENTO'
    end
    object qryVentaFacturaConsignaMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_MAST_CONSIGNA.MONTO_DESCUENTO'
    end
    object qryVentaFacturaConsignaMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'VENTAS_MAST_CONSIGNA.MONTO_INICIAL'
    end
    object qryVentaFacturaConsignaNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'VENTAS_MAST_CONSIGNA.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
    object qryVentaFacturaConsignaMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VENTAS_MAST_CONSIGNA.MONTO_PAGADO'
    end
    object qryVentaFacturaConsignaMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'VENTAS_MAST_CONSIGNA.MONTO_CAMBIO'
    end
    object qryVentaFacturaConsignaMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'VENTAS_MAST_CONSIGNA.MONTO_TOTAL_ITBIS'
    end
    object qryVentaFacturaConsignaTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
    object qryVentaFacturaConsignaNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryVentaFacturaConsignaNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object qryVentaFacturaConsignaNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryVentaFacturaConsignaDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryVentaFacturaConsignaTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryVentaFacturaConsignaFORMA_PAGO1: TSmallintField
      FieldName = 'FORMA_PAGO1'
      Origin = 'CLIENTES.FORMA_PAGO'
    end
    object qryVentaFacturaConsignaLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object qryVentaFacturaConsignaEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object qryVentaFacturaConsignaPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryVentaFacturaConsignaCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryVentaFacturaConsignaCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryVentaFacturaConsignaRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'CLIENTES.RNC'
      Size = 12
    end
    object qryVentaFacturaConsignaCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'CLIENTES.CANT_DIAS_CREDITO'
    end
    object qryVentaFacturaConsignaRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryVentaFacturaConsignaCONDICION: TIntegerField
      FieldName = 'CONDICION'
      Origin = 'CLIENTES.CONDICION'
    end
    object qryVentaFacturaConsignaPRECIO_ID: TIntegerField
      FieldName = 'PRECIO_ID'
      Origin = 'CLIENTES.PRECIO_ID'
    end
    object qryVentaFacturaConsignaTIPO_FACTURA: TIBStringField
      FieldName = 'TIPO_FACTURA'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaConsignaAPLICA_TIPODESC: TIBStringField
      FieldName = 'APLICA_TIPODESC'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaConsignaMONTODESCGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCGASTOSADMIN'
      Origin = 'VENTAS_MAST_CONSIGNA.MONTODESCGASTOSADMIN'
    end
    object qryVentaFacturaConsignaMONTODESCITBISGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCITBISGASTOSADMIN'
      Origin = 'VENTAS_MAST_CONSIGNA.MONTODESCITBISGASTOSADMIN'
    end
    object qryVentaFacturaConsignaMONTODESCTRANSP: TFloatField
      FieldName = 'MONTODESCTRANSP'
      Origin = 'VENTAS_MAST_CONSIGNA.MONTODESCTRANSP'
    end
    object qryVentaFacturaConsignaMONTODESCDIRTECNICA: TFloatField
      FieldName = 'MONTODESCDIRTECNICA'
      Origin = 'VENTAS_MAST_CONSIGNA.MONTODESCDIRTECNICA'
    end
    object qryVentaFacturaConsignaMONTODESCITBISDIRTECNICA: TFloatField
      FieldName = 'MONTODESCITBISDIRTECNICA'
      Origin = 'VENTAS_MAST_CONSIGNA.MONTODESCITBISDIRTECNICA'
    end
    object qryVentaFacturaConsignaMONTODESCIMPREVISTO: TFloatField
      FieldName = 'MONTODESCIMPREVISTO'
      Origin = 'VENTAS_MAST_CONSIGNA.MONTODESCIMPREVISTO'
    end
    object qryVentaFacturaConsignaMONTODESCITBISIMPREVISTO: TFloatField
      FieldName = 'MONTODESCITBISIMPREVISTO'
      Origin = 'VENTAS_MAST_CONSIGNA.MONTODESCITBISIMPREVISTO'
    end
    object qryVentaFacturaConsignaSERIEFACTURA: TIBStringField
      FieldName = 'SERIEFACTURA'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaConsignaMONEDAFACTURA: TIBStringField
      FieldName = 'MONEDAFACTURA'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaConsignaTIPOFACTURA: TIBStringField
      FieldName = 'TIPOFACTURA'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaConsignaCONDICIONCREDITO: TIBStringField
      FieldName = 'CONDICIONCREDITO'
      Origin = 'CONDICION.DESCRIPCION'
    end
    object qryVentaFacturaConsignaNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
    object qryVentaFacturaConsignaDESCRIPCION_NCF: TIBStringField
      FieldName = 'DESCRIPCION_NCF'
      Origin = 'TIPO_CF.DESCRIPCION'
      Size = 60
    end
    object qryVentaFacturaConsignaSUBTOTALINDIRECTOS: TFloatField
      FieldName = 'SUBTOTALINDIRECTOS'
    end
    object qryVentaFacturaConsignaCOMENTARIO: TIBStringField
      FieldName = 'COMENTARIO'
      Origin = 'VENTAS_MAST_CONSIGNA.COMENTARIO'
      Size = 80
    end
    object qryVentaFacturaConsignaNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST_CONSIGNA.NUMERO_FACTURA'
    end
    object qryVentaFacturaConsignaNUMEROFACTURA: TIntegerField
      FieldName = 'NUMEROFACTURA'
      Origin = 'VENTAS_MAST_CONSIGNA.NUMERO_FACTURA'
    end
    object qryVentaFacturaConsignaTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'NCF_ASIGNADOS.TIPO_NCF'
      Size = 2
    end
  end
  object qryVentaFactura_csg0: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryVentaFacturaAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  VENTAS_MAST_CONSIGNA.NUMERO,'
      '  VENTAS_MAST_CONSIGNA.FECHA,'
      '  VENTAS_MAST_CONSIGNA.CIA_KEY,'
      '  VENTAS_MAST_CONSIGNA.CODIGO_CTE,'
      '  VENTAS_MAST_CONSIGNA.CODIGO_VENDEDOR,'
      '  VENTAS_MAST_CONSIGNA.FORMA_PAGO,'
      '  VENTAS_MAST_CONSIGNA.OBSERVACION,'
      '  VENTAS_MAST_CONSIGNA.MONEDA,'
      '  VENTAS_MAST_CONSIGNA.VALOR_TOTAL_DET,'
      '  VENTAS_MAST_CONSIGNA.STATUS,'
      '  VENTAS_MAST_CONSIGNA.FECHA_IN,'
      '  VENTAS_MAST_CONSIGNA.IN_POR,'
      '  VENTAS_MAST_CONSIGNA.FECHA_MOD,'
      '  VENTAS_MAST_CONSIGNA.MOD_POR,'
      '  VENTAS_MAST_CONSIGNA.NUMERO_FACTURA,'
      '  VENTAS_MAST_CONSIGNA.NUMERO_DOC_PAGO,'
      '  VENTAS_MAST_CONSIGNA.SERIE_NCF_ASIGNADO,'
      '  VENTAS_MAST_CONSIGNA.MONTO_BRUTO,'
      '  VENTAS_MAST_CONSIGNA.PORC_DESCUENTO,'
      '  VENTAS_MAST_CONSIGNA.MONTO_DESCUENTO,'
      '  VENTAS_MAST_CONSIGNA.MONTO_INICIAL,'
      '  VENTAS_MAST_CONSIGNA.NOMBRE_CLIENTE_GENERAL,'
      '  VENTAS_MAST_CONSIGNA.MONTO_PAGADO,'
      '  VENTAS_MAST_CONSIGNA.MONTO_CAMBIO,'
      '  VENTAS_MAST_CONSIGNA.MONTO_TOTAL_ITBIS,'
      '  CLIENTES.TIPO_CLIENTE,'
      '  CLIENTES.NOMBRE_CTE,'
      '  CLIENTES.NOMBRE_ABREV,'
      '  CLIENTES.NOMBRE_FACTURAR,'
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.FORMA_PAGO,'
      '  CLIENTES.LIMITE_CREDITO,'
      '  CLIENTES.EMAIL,'
      '  CLIENTES.PAIS,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.CEDULA,'
      '  CLIENTES.RNC,'
      '  CLIENTES.CANT_DIAS_CREDITO,'
      '  CLIENTES.RNC_NUMERO,'
      '  CLIENTES.CONDICION,'
      '  CLIENTES.PRECIO_ID,'
      '  NULL AS TIPO_FACTURA,'
      '  NULL AS APLICA_TIPODESC,'
      '  VENTAS_MAST_CONSIGNA.MONTODESCGASTOSADMIN,'
      '  VENTAS_MAST_CONSIGNA.MONTODESCITBISGASTOSADMIN,'
      '  VENTAS_MAST_CONSIGNA.MONTODESCTRANSP,'
      '  VENTAS_MAST_CONSIGNA.MONTODESCDIRTECNICA,'
      '  VENTAS_MAST_CONSIGNA.MONTODESCITBISDIRTECNICA,'
      '  VENTAS_MAST_CONSIGNA.MONTODESCIMPREVISTO,'
      '  VENTAS_MAST_CONSIGNA.MONTODESCITBISIMPREVISTO,'
      '  NULL  AS SERIEFACTURA,'
      '  VENTAS_MAST_CONSIGNA.NUMERO_FACTURA AS NUMEROFACTURA,'
      '  VENTAS_MAST_CONSIGNA.MONEDA AS MONEDAFACTURA,'
      '  NULL AS TIPOFACTURA,'
      '  CONDICION.DESCRIPCION AS CONDICIONCREDITO,'
      'NCF_ASIGNADOS.TIPO_NCF,'
      '  NCF_ASIGNADOS.NUMERO_NCF,'
      'iif(Position('#39'B'#39' in NCF_ASIGNADOS.NUMERO_NCF) > 0,'
      
        '  tipo_cf.descripcion_2018,TIPO_CF.DESCRIPCION) AS DESCRIPCION_N' +
        'CF,'
      
        '(VENTAS_MAST_CONSIGNA.MontoDescGastosAdmin +  VENTAS_MAST_CONSIG' +
        'NA.MontoDescItbisGastosAdmin +  VENTAS_MAST_CONSIGNA.MontoDescTr' +
        'ansp +  VENTAS_MAST_CONSIGNA.MontoDescDirtecnica +  VENTAS_MAST_' +
        'CONSIGNA.MontoDescItbisDirTecnica +  VENTAS_MAST_CONSIGNA.MontoD' +
        'escImprevisto +  VENTAS_MAST_CONSIGNA.MontoDescItbisImprevisto) ' +
        ' AS SubTotalIndirectos,'
      'VENTAS_MAST_CONSIGNA.Comentario,'
      'VENTAS_MAST_CONSIGNA.COTIZACION_ORIGEN,'
      'VENTAS_MAST_CONSIGNA.REFERENCIACTE,'
      'dgii.FECHA_VENCE fechavenceNCF,'
      'sectores.DESCRIPCION desc_sector,'
      'cc.DESCRIPCION desc_ciudad,'
      'PRE_PAGO.MONTO montoPrepagado'
      'FROM'
      '  VENTAS_MAST_CONSIGNA'
      
        '  INNER JOIN CLIENTES ON (VENTAS_MAST_CONSIGNA.CODIGO_CTE = CLIE' +
        'NTES.CODIGO_CTE)  '
      
        '  LEFT OUTER JOIN CONDICION ON (CLIENTES.CONDICION = CONDICION.C' +
        'ODIGO)'
      
        '  LEFT OUTER JOIN NCF_ASIGNADOS ON (VENTAS_MAST_CONSIGNA.SERIE_N' +
        'CF_ASIGNADO = NCF_ASIGNADOS.SERIE)'
      
        'LEFT OUTER JOIN TIPO_CF ON (NCF_ASIGNADOS.TIPO_NCF = TIPO_CF.TIP' +
        'O_CF)'
      
        'Left outer join DGII_SERIE_NFC dgii on dgii.TIPO_CF = tipo_cf.TI' +
        'PO_CF'
      'Left outer join CIUDAD cc on cc.CODIGO = CLIENTES.COD_CIUDAD'
      'Left outer join SECTORES  on SECTORES.CODIGO = CLIENTES.CODZONA'
      
        'Left outer join PRE_PAGO  on PRE_PAGO.NUM_TRN_VTA = VENTAS_MAST.' +
        'NUMERO')
    Left = 680
    Top = 222
  end
  object qryVentaFacturaDetConsigna: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  NULL as DESC_TIPO_NCF,'
      '  D.SERIE,'
      '  D.CODIGO_PROD,'
      '  D.CANTIDAD,'
      '  D.PRECIO,'
      '  D.PORC_DESC_DET,'
      '  D.ITBI_DET,'
      '  D.VALOR_SERVICIO_DET,'
      '  D.VALOR_TOTAL_DET,'
      '  V.NUMERO_FACTURA,'
      '  D.STATUS_DET,'
      '  V.SERIE_NCF_ASIGNADO,'
      '  NULL AS NUMERO_NCF,'
      '  V.MONTO_DESCUENTO,'
      '  D.NUMERO,'
      '  D.CODIGO_BARRA,'
      '  D.NUM_FACTURA,'
      '  D.FECHA_IN,'
      '  D.IN_POR,'
      '  D.FECHA_MOD,'
      '  D.MOD_POR,'
      '  D.CANT_REGRESO,'
      '  D.CANT_PROMO,'
      '  D.MONTO_DIETA,'
      '  D.MONTO_AJUSTE,'
      '  D.SERIE_PROD,'
      '  D.STATUS_CNT,'
      '  D.TIPO_UNIDAD,'
      '  D.ITBIS_EXENTO,'
      '  D.TIPO_VENTA,'
      '  D.DESCRIPCION,'
      '  case  nullif( D.DESCRIPCIONPRODUCTO, '#39#39' ) when '#39#39'  then'
      '    D.DESCRIPCION'
      '  else '
      '   D.DESCRIPCION ||'#39'. '#39'|| D.DESCRIPCIONPRODUCTO'
      '   end as DESCRIPCIONPRODUCTO'
      'FROM'
      '  VENTAS_MAST_CONSIGNA V'
      '  INNER JOIN VENTAS_DET_CONSIGNA D ON (V.NUMERO = D.NUMERO)  '
      'Where   D.NUMERO =:numero')
    Left = 672
    Top = 98
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryVentaFacturaDetConsignaDESC_TIPO_NCF: TIBStringField
      FieldName = 'DESC_TIPO_NCF'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaDetConsignaSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET_CONSIGNA.SERIE'
      Required = True
    end
    object qryVentaFacturaDetConsignaCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET_CONSIGNA.CODIGO_PROD'
      Size = 40
    end
    object qryVentaFacturaDetConsignaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET_CONSIGNA.CANTIDAD'
    end
    object qryVentaFacturaDetConsignaPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET_CONSIGNA.PRECIO'
    end
    object qryVentaFacturaDetConsignaPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET_CONSIGNA.PORC_DESC_DET'
    end
    object qryVentaFacturaDetConsignaITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET_CONSIGNA.ITBI_DET'
    end
    object qryVentaFacturaDetConsignaVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET_CONSIGNA.VALOR_SERVICIO_DET'
    end
    object qryVentaFacturaDetConsignaVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_DET_CONSIGNA.VALOR_TOTAL_DET'
    end
    object qryVentaFacturaDetConsignaNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST_CONSIGNA.NUMERO_FACTURA'
    end
    object qryVentaFacturaDetConsignaSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET_CONSIGNA.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaDetConsignaSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VENTAS_MAST_CONSIGNA.SERIE_NCF_ASIGNADO'
    end
    object qryVentaFacturaDetConsignaNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaDetConsignaMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_MAST_CONSIGNA.MONTO_DESCUENTO'
    end
    object qryVentaFacturaDetConsignaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_DET_CONSIGNA.NUMERO'
      Required = True
    end
    object qryVentaFacturaDetConsignaCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VENTAS_DET_CONSIGNA.CODIGO_BARRA'
    end
    object qryVentaFacturaDetConsignaNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VENTAS_DET_CONSIGNA.NUM_FACTURA'
    end
    object qryVentaFacturaDetConsignaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_DET_CONSIGNA.FECHA_IN'
    end
    object qryVentaFacturaDetConsignaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_DET_CONSIGNA.IN_POR'
      Size = 12
    end
    object qryVentaFacturaDetConsignaFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_DET_CONSIGNA.FECHA_MOD'
    end
    object qryVentaFacturaDetConsignaMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_DET_CONSIGNA.MOD_POR'
      Size = 12
    end
    object qryVentaFacturaDetConsignaCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VENTAS_DET_CONSIGNA.CANT_REGRESO'
    end
    object qryVentaFacturaDetConsignaCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VENTAS_DET_CONSIGNA.CANT_PROMO'
    end
    object qryVentaFacturaDetConsignaMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VENTAS_DET_CONSIGNA.MONTO_DIETA'
    end
    object qryVentaFacturaDetConsignaMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VENTAS_DET_CONSIGNA.MONTO_AJUSTE'
    end
    object qryVentaFacturaDetConsignaSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VENTAS_DET_CONSIGNA.SERIE_PROD'
      Size = 50
    end
    object qryVentaFacturaDetConsignaSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VENTAS_DET_CONSIGNA.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryVentaFacturaDetConsignaTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VENTAS_DET_CONSIGNA.TIPO_UNIDAD'
    end
    object qryVentaFacturaDetConsignaITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VENTAS_DET_CONSIGNA.ITBIS_EXENTO'
    end
    object qryVentaFacturaDetConsignaTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VENTAS_DET_CONSIGNA.TIPO_VENTA'
    end
    object qryVentaFacturaDetConsignaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET_CONSIGNA.DESCRIPCION'
      Size = 80
    end
    object qryVentaFacturaDetConsignaDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
  end
  object dsqryVentaFacturaConsigna: TDataSource
    DataSet = qryVentaFacturaConsigna
    Left = 672
    Top = 274
  end
  object dsqryVentaFacturaDetConsigna: TDataSource
    DataSet = qryVentaFacturaDetConsigna
    Left = 672
    Top = 330
  end
  object ibsqlEliminarSerieVentaDet_csg: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Delete From VENTAS_DET_consigna'
      'Where serie =:serie')
    Transaction = dmConectar.IBTransaction1
    Left = 272
    Top = 362
  end
  object qryVentacontado_0: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryVentaFacturaAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'Case'
      
        '   when (VENTAS_MAST.NUMERO_FACTURA is null) then CAST(VENTAS_MA' +
        'ST.NUMERO_DOC_PAGO AS INTEGER)        '
      '   else VENTAS_MAST.NUMERO_FACTURA'
      ' end as NUMERO_FACTURA,  '
      '  VENTAS_MAST.NUMERO_DOC_PAGO,       '
      '  VENTAS_MAST.NUMERO,'
      '  VENTAS_MAST.FECHA,'
      '  VENTAS_MAST.FECHAINICIAPOLIZA,'
      '  VENTAS_MAST.CIA_KEY,'
      'ventas_mast.IDNUMERODVEH,'
      '  VENTAS_MAST.CODIGO_CTE,'
      '  VENTAS_MAST.CODIGO_VENDEDOR,'
      '  VENTAS_MAST.FORMA_PAGO,'
      '  VENTAS_MAST.OBSERVACION,'
      '  VENTAS_MAST.MONEDA,'
      '  VENTAS_MAST.VALOR_TOTAL_DET,'
      '  VENTAS_MAST.STATUS,'
      '  VENTAS_MAST.FECHA_IN,'
      '  VENTAS_MAST.IN_POR,'
      '  VENTAS_MAST.FECHA_MOD,'
      '  VENTAS_MAST.MOD_POR,    '
      '  VENTAS_MAST.SERIE_NCF_ASIGNADO,'
      '  VENTAS_MAST.MONTO_BRUTO,'
      '  VENTAS_MAST.PORC_DESCUENTO,'
      '  VENTAS_MAST.MONTO_DESCUENTO,'
      '  VENTAS_MAST.MONTO_INICIAL,'
      '  VENTAS_MAST. MONTO_EXONERADO_ITBIS,'
      '  VENTAS_MAST.NOMBRE_CLIENTE_GENERAL,'
      '  VENTAS_MAST.MONTO_PAGADO,'
      '  VENTAS_MAST.MONTO_CAMBIO,'
      '  VENTAS_MAST.MONTO_TOTAL_ITBIS,'
      '  CLIENTES.TIPO_CLIENTE,'
      '  CLIENTES.NOMBRE_CTE,'
      '  CLIENTES.NOMBRE_ABREV,'
      '  CLIENTES.NOMBRE_FACTURAR,'
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.FORMA_PAGO,'
      '  CLIENTES.LIMITE_CREDITO,'
      '  CLIENTES.EMAIL,'
      '  CLIENTES.PAIS,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.CEDULA,'
      '  CLIENTES.RNC,'
      '  CLIENTES.CANT_DIAS_CREDITO,'
      '  CLIENTES.RNC_NUMERO,'
      '  CLIENTES.CONDICION,'
      '  CLIENTES.PRECIO_ID,'
      '  FACTURAS.TIPO_FACTURA,'
      '  FACTURAS.APLICA_TIPODESC,'
      '  VENTAS_MAST.MONTODESCGASTOSADMIN,'
      '  VENTAS_MAST.MONTODESCITBISGASTOSADMIN,'
      '  VENTAS_MAST.MONTODESCTRANSP,'
      '  VENTAS_MAST.MONTODESCDIRTECNICA,'
      '  VENTAS_MAST.MONTODESCITBISDIRTECNICA,'
      '  VENTAS_MAST.MONTODESCIMPREVISTO,'
      '  VENTAS_MAST.MONTODESCITBISIMPREVISTO,'
      '  FACTURAS.SERIE AS SERIEFACTURA,'
      '  FACTURAS.NUMERO AS NUMEROFACTURA,'
      '  FACTURAS.MONEDA AS MONEDAFACTURA,'
      '  FACTURAS.TIPO AS TIPOFACTURA,'
      '  CONDICION.DESCRIPCION AS CONDICIONCREDITO,'
      '  NCF_ASIGNADOS.TIPO_NCF,   '
      '  NCF_ASIGNADOS.NUMERO_NCF,'
      '  iif(Position('#39'B'#39' in NCF_ASIGNADOS.NUMERO_NCF) > 0,'
      
        '  tipo_cf.descripcion_2018,TIPO_CF.DESCRIPCION) AS DESCRIPCION_N' +
        'CF,'
      
        '  (VENTAS_MAST.MONTODESCGASTOSADMIN + VENTAS_MAST.MONTODESCITBIS' +
        'GASTOSADMIN + VENTAS_MAST.MONTODESCTRANSP + VENTAS_MAST.MONTODES' +
        'CDIRTECNICA + VENTAS_MAST.MONTODESCITBISDIRTECNICA + VENTAS_MAST' +
        '.MONTODESCIMPREVISTO + VENTAS_MAST.MONTODESCITBISIMPREVISTO) AS ' +
        'SUBTOTALINDIRECTOS,'
      'VENTAS_MAST.COMENTARIO,'
      'VENTAS_MAST.COTIZACION_ORIGEN,'
      'VENTAS_MAST.REFERENCIACTE,'
      'VENTAS_MAST.monto_recargo,'
      'ventas_mast.tiponcfifiscal,'
      'VENTAS_MAST.propina,'
      'VENTAS_MAST.propinalegal,'
      'VENTAS_MAST.porcpropinalegal,'
      'dgii.FECHA_VENCE fechavenceNCF,'
      'sectores.DESCRIPCION desc_sector,'
      'cc.DESCRIPCION desc_ciudad,'
      'PRE_PAGO.MONTO montoPrepagado'
      'FROM'
      '  VENTAS_MAST'
      
        '  LEFT OUTER JOIN CLIENTES ON (VENTAS_MAST.CODIGO_CTE = CLIENTES' +
        '.CODIGO_CTE)'
      
        '  LEFT OUTER JOIN FACTURAS ON (VENTAS_MAST.NUMERO_FACTURA = FACT' +
        'URAS.NUMERO)'
      
        '  LEFT OUTER JOIN CONDICION ON (CLIENTES.CONDICION = CONDICION.C' +
        'ODIGO)'
      
        '  LEFT OUTER JOIN NCF_ASIGNADOS ON (VENTAS_MAST.SERIE_NCF_ASIGNA' +
        'DO = NCF_ASIGNADOS.SERIE)'
      
        '  LEFT OUTER JOIN TIPO_CF ON (NCF_ASIGNADOS.TIPO_NCF = TIPO_CF.T' +
        'IPO_CF)'
      '  left outer join CIUDAD cc on cc.CODIGO = CLIENTES.COD_CIUDAD'
      
        '  left outer join SECTORES  on SECTORES.CODIGO = CLIENTES.CODZON' +
        'A'
      
        '  left outer join DGII_SERIE_NFC dgii on dgii.TIPO_CF = tipo_cf.' +
        'TIPO_CF'
      
        '  left outer join PRE_PAGO  on PRE_PAGO.NUM_TRN_VTA = VENTAS_MAS' +
        'T.NUMERO')
    Left = 648
    Top = 295
  end
  object stpProcDevolucion: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnPostError = stpProcDevolucionPostError
    StoredProcName = 'PROC_PROCESA_DEVOLUCION'
    Left = 648
    Top = 34
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SERIE_NCFASIGNADO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'XNCF'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'SERIE'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'DIV_NEGOCIO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'PECF'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'AICF'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'TIPO_CF'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'ERROR_DESC'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'XSERIE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'XDIV_NEGOCIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'XPECF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'XAICF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'XTIPO_CF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOMBRE_COMPLETO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CEDULA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DIRECCION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CIUDAD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_INSERT'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_UPDATE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_USUARIO_UPD'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPODOC'
        ParamType = ptInput
      end>
  end
  object qryFactTieneDevolucion: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM TRANS_CXC_DET'
      'Where numero_fact =:numerofact'
      'And serie_ncf_asignado=:seriencfasignado')
    Left = 752
    Top = 372
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerofact'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'seriencfasignado'
        ParamType = ptInput
      end>
  end
  object qryVentaServicio: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from VENTAS_SERVICIO'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into VENTAS_SERVICIO'
      
        '  (SERIE, FECHA, CODIGO_CTE, NUMERO_TRN, CODIGO_OPERARIO, CODIGO' +
        '_SERVICIO, '
      
        '   DESCRIPCION, MONTO_SERVICIO, MONTO_COMISION, PORC_COMISION, M' +
        'ONTO_DESCUENTO, '
      
        '   PORC_DESCUENTO, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, COMENTA' +
        'RIO, STATUS, '
      '   COD_USUARIO)'
      'values'
      
        '  (:SERIE, :FECHA, :CODIGO_CTE, :NUMERO_TRN, :CODIGO_OPERARIO, :' +
        'CODIGO_SERVICIO, '
      
        '   :DESCRIPCION, :MONTO_SERVICIO, :MONTO_COMISION, :PORC_COMISIO' +
        'N, :MONTO_DESCUENTO, '
      
        '   :PORC_DESCUENTO, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR, :C' +
        'OMENTARIO, '
      '   :STATUS, :COD_USUARIO)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  FECHA,'
      '  CODIGO_CTE,'
      '  NUMERO_TRN,'
      '  CODIGO_OPERARIO,'
      '  CODIGO_SERVICIO,'
      '  DESCRIPCION,'
      '  MONTO_SERVICIO,'
      '  MONTO_COMISION,'
      '  PORC_COMISION,'
      '  MONTO_DESCUENTO,'
      '  PORC_DESCUENTO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  COMENTARIO,'
      '  STATUS,'
      '  COD_USUARIO'
      'from VENTAS_SERVICIO '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * From VENTAS_SERVICIO'
      'Where Fecha =:fecha')
    ModifySQL.Strings = (
      'update VENTAS_SERVICIO'
      'set'
      '  SERIE = :SERIE,'
      '  FECHA = :FECHA,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  NUMERO_TRN = :NUMERO_TRN,'
      '  CODIGO_OPERARIO = :CODIGO_OPERARIO,'
      '  CODIGO_SERVICIO = :CODIGO_SERVICIO,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  MONTO_SERVICIO = :MONTO_SERVICIO,'
      '  MONTO_COMISION = :MONTO_COMISION,'
      '  PORC_COMISION = :PORC_COMISION,'
      '  MONTO_DESCUENTO = :MONTO_DESCUENTO,'
      '  PORC_DESCUENTO = :PORC_DESCUENTO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  COMENTARIO = :COMENTARIO,'
      '  STATUS = :STATUS,'
      '  COD_USUARIO = :COD_USUARIO'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'Serie'
    GeneratorField.Generator = 'gen_serie_vta_servicio'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 528
    Top = 492
    object qryVentaServicioSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_SERVICIO.SERIE'
      Required = True
    end
    object qryVentaServicioCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_SERVICIO.CODIGO_CTE'
      Required = True
    end
    object qryVentaServicioFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_SERVICIO.FECHA'
      Required = True
    end
    object qryVentaServicioNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'VENTAS_SERVICIO.NUMERO_TRN'
    end
    object qryVentaServicioCODIGO_OPERARIO: TIntegerField
      FieldName = 'CODIGO_OPERARIO'
      Origin = 'VENTAS_SERVICIO.CODIGO_OPERARIO'
      Required = True
    end
    object qryVentaServicioCODIGO_SERVICIO: TIntegerField
      FieldName = 'CODIGO_SERVICIO'
      Origin = 'VENTAS_SERVICIO.CODIGO_SERVICIO'
      Required = True
    end
    object qryVentaServicioDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_SERVICIO.DESCRIPCION'
      Size = 80
    end
    object qryVentaServicioMONTO_SERVICIO: TFloatField
      FieldName = 'MONTO_SERVICIO'
      Origin = 'VENTAS_SERVICIO.MONTO_SERVICIO'
    end
    object qryVentaServicioMONTO_COMISION: TFloatField
      FieldName = 'MONTO_COMISION'
      Origin = 'VENTAS_SERVICIO.MONTO_COMISION'
    end
    object qryVentaServicioPORC_COMISION: TFloatField
      FieldName = 'PORC_COMISION'
      Origin = 'VENTAS_SERVICIO.PORC_COMISION'
    end
    object qryVentaServicioMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_SERVICIO.MONTO_DESCUENTO'
    end
    object qryVentaServicioPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VENTAS_SERVICIO.PORC_DESCUENTO'
    end
    object qryVentaServicioFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_SERVICIO.FECHA_IN'
    end
    object qryVentaServicioIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_SERVICIO.IN_POR'
      Size = 12
    end
    object qryVentaServicioFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_SERVICIO.FECHA_MOD'
    end
    object qryVentaServicioMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_SERVICIO.MOD_POR'
      Size = 12
    end
    object qryVentaServicioCOMENTARIO: TIBStringField
      FieldName = 'COMENTARIO'
      Origin = 'VENTAS_SERVICIO.COMENTARIO'
      Size = 80
    end
    object qryVentaServicioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENTAS_SERVICIO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryVentaServicioCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'VENTAS_SERVICIO.COD_USUARIO'
    end
  end
  object dsqryVentaServicio: TDataSource
    DataSet = qryVentaServicio
    Left = 392
    Top = 500
  end
  object stpProcDevolPendiente: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'Proc_Devolucion_IUD'
    Left = 520
    Top = 26
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO_DEVOLUCION'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_PENDIENTE'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_TRN_VTA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'SERIE_TRNXCX'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'INUMERO_DEVOLUCION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IMONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ICODIGO_CTE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IMONTO_PENDIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ISTATUS'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'IFECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IIN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'IFECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IMOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INUMERO_TRN_VTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ISERIE_TRNXCX'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ACCION'
        ParamType = ptInput
      end>
  end
  object qryFactReimpMasterDevol: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select Cast(v.numero as float) numero, v.codigo_cte, v.fecha,'
      'v.valor_total_det monto_fact, c.Nombre_Cte,'
      'c.Rnc_numero, c.telef_contacto,'
      'c.pais, c.ciudad, c.direccion_cont, v.Fecha+30 fecha_vence,'
      'v.moneda,'
      'PRE_PAGO.MONTO montoPrepagado'
      'From ventas_mast v'
      'Left Outer Join  Clientes c on  v.CODIGO_CTE = c.codigo_cte'
      'Left Outer Join PRE_PAGO  on PRE_PAGO.NUM_TRN_VTA = v.NUMERO'
      'Where v.NUMERO_DOC_PAGO =:numero '
      'And v.FORMA_PAGO =:fpago'
      'And v.NUMERO_DOC_PAGO Is Not Null'
      
        'Order By  v.fecha desc , Cast(v.NUMERO_DOC_PAGO as integer)  des' +
        'c')
    Left = 448
    Top = 170
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'fpago'
        ParamType = ptInput
      end>
  end
  object qryFactReimpDetDevol: TIBQuery
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
      '       V.MONTO_DESCUENTO, u.DESCRIPCION desctipounidad,'
      '       SUBSTRING(u.DESCRIPCION from 1 for 1) LTIPO_UNIDAD,'
      '      D.MONTO_DESC_ITEM, v.PROPINA, v.PROPINALEGAL'
      'FROM TIPO_CF F'
      '   INNER JOIN NCF_ASIGNADOS N ON (F.TIPO_CF = N.TIPO_NCF)'
      
        '   RIGHT OUTER JOIN VENTAS_MAST V ON (N.SERIE = V.SERIE_NCF_ASIG' +
        'NADO)'
      '   INNER JOIN VENTAS_DET D ON (V.NUMERO = D.NUMERO)'
      '   left outer join UNIDADES u ON (d.TIPO_UNIDAD = u.IDUNIDAD)'
      
        'left outer join INVENTARIO_PRODUCTO i on (d.CODIGO_PROD = i.CODI' +
        'GO)'
      'Where  V.numero =:numero'
      'Order by  D.DESCRIPCION, D.SERIE')
    Left = 352
    Top = 282
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryFactReimpDetDevolDESC_TIPO_NCF: TIBStringField
      FieldName = 'DESC_TIPO_NCF'
      Origin = 'TIPO_CF.DESCRIPCION'
      Size = 60
    end
    object qryFactReimpDetDevolSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET.SERIE'
      Required = True
    end
    object qryFactReimpDetDevolCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryFactReimpDetDevolDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object qryFactReimpDetDevolREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object qryFactReimpDetDevolCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET.CANTIDAD'
    end
    object qryFactReimpDetDevolPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET.PRECIO'
    end
    object qryFactReimpDetDevolPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET.PORC_DESC_DET'
    end
    object qryFactReimpDetDevolITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET.ITBI_DET'
    end
    object qryFactReimpDetDevolVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET.VALOR_SERVICIO_DET'
    end
    object qryFactReimpDetDevolVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_DET.VALOR_TOTAL_DET'
    end
    object qryFactReimpDetDevolNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST.NUMERO_FACTURA'
    end
    object qryFactReimpDetDevolSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryFactReimpDetDevolSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
    object qryFactReimpDetDevolNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
    object qryFactReimpDetDevolMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_MAST.MONTO_DESCUENTO'
    end
    object qryFactReimpDetDevolDESCTIPOUNIDAD: TIBStringField
      FieldName = 'DESCTIPOUNIDAD'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
    object qryFactReimpDetDevolMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VENTAS_DET.MONTO_DESC_ITEM'
    end
    object qryFactReimpDetDevolPROPINA: TFloatField
      FieldName = 'PROPINA'
      Origin = 'VENTAS_MAST.PROPINA'
    end
    object qryFactReimpDetDevolPROPINALEGAL: TFloatField
      FieldName = 'PROPINALEGAL'
      Origin = 'VENTAS_MAST.PROPINALEGAL'
    end
  end
  object qryVentaFactDevolucion_base: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  VENTAS_MAST.NUMERO,'
      '  VENTAS_MAST.FECHA,'
      '  VENTAS_MAST.CIA_KEY,'
      '  VENTAS_MAST.CODIGO_CTE,'
      '  VENTAS_MAST.CODIGO_VENDEDOR,'
      '  VENTAS_MAST.FORMA_PAGO,'
      '  VENTAS_MAST.OBSERVACION,'
      '  VENTAS_MAST.MONEDA,'
      'ventas_mast.IDNUMERODVEH,'
      '  VENTAS_MAST.VALOR_TOTAL_DET,'
      '  VENTAS_MAST.STATUS,'
      '  VENTAS_MAST.FECHA_IN,'
      '  VENTAS_MAST.IN_POR,'
      '  VENTAS_MAST.FECHA_MOD,'
      '  VENTAS_MAST.MOD_POR,'
      'Case'
      
        '   when (VENTAS_MAST.NUMERO_FACTURA is null) then CAST(VENTAS_MA' +
        'ST.NUMERO_DOC_PAGO AS INTEGER)        '
      '   else VENTAS_MAST.NUMERO_FACTURA'
      ' end as NUMERO_FACTURA,  '
      'VENTAS_MAST.NUMERO_DOC_PAGO,'
      '  VENTAS_MAST.SERIE_NCF_ASIGNADO,'
      '  VENTAS_MAST.monto_recargo,'
      '  VENTAS_MAST.MONTO_BRUTO,'
      '  VENTAS_MAST.PORC_DESCUENTO,'
      '  VENTAS_MAST.MONTO_DESCUENTO,'
      '  VENTAS_MAST.MONTO_INICIAL,'
      '  VENTAS_MAST.NOMBRE_CLIENTE_GENERAL,'
      '  VENTAS_MAST.MONTO_PAGADO,'
      '  VENTAS_MAST.MONTO_CAMBIO,'
      '  VENTAS_MAST.MONTO_TOTAL_ITBIS,'
      '  VENTAS_MAST.MONTO_EXONERADO_ITBIS,'
      '  CLIENTES.TIPO_CLIENTE,'
      '  CLIENTES.NOMBRE_CTE,'
      '  CLIENTES.NOMBRE_ABREV,'
      '  CLIENTES.NOMBRE_FACTURAR,'
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.FORMA_PAGO,'
      '  CLIENTES.LIMITE_CREDITO,'
      '  CLIENTES.EMAIL,'
      '  CLIENTES.PAIS,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.CEDULA,'
      '  CLIENTES.RNC,'
      '  CLIENTES.CANT_DIAS_CREDITO,'
      '  CLIENTES.RNC_NUMERO,'
      '  CLIENTES.CONDICION,'
      '  CLIENTES.PRECIO_ID,'
      '  6 as TIPO_FACTURA,'
      '  0 as APLICA_TIPODESC,'
      '  VENTAS_MAST.MONTODESCGASTOSADMIN,'
      '  VENTAS_MAST.MONTODESCITBISGASTOSADMIN,'
      '  VENTAS_MAST.MONTODESCTRANSP,'
      '  VENTAS_MAST.MONTODESCDIRTECNICA,'
      '  VENTAS_MAST.MONTODESCITBISDIRTECNICA,'
      '  VENTAS_MAST.MONTODESCIMPREVISTO,'
      '  VENTAS_MAST.MONTODESCITBISIMPREVISTO,'
      '   0.00  AS SERIEFACTURA,'
      
        '  cast(DEVOLUCIONES_PENDIENTE.NUMERO_DEVOLUCION AS float ) as NU' +
        'MEROFACTURA,'
      '  DEVOLUCIONES_PENDIENTE.MONEDA AS MONEDAFACTURA,'
      '  6 AS TIPOFACTURA,'
      
        ' COALESCE (CONDICION.DESCRIPCION ,'#39'CONTADO'#39' ) AS CONDICIONCREDIT' +
        'O,  '
      'NCF_ASIGNADOS.TIPO_NCF,'
      '  NCF_ASIGNADOS.NUMERO_NCF,'
      'iif(Position('#39'B'#39' in NCF_ASIGNADOS.NUMERO_NCF) > 0,'
      
        '  tipo_cf.descripcion_2018,TIPO_CF.DESCRIPCION) AS DESCRIPCION_N' +
        'CF,'
      
        '(VENTAS_MAST.MontoDescGastosAdmin +  VENTAS_MAST.MontoDescItbisG' +
        'astosAdmin +  VENTAS_MAST.MontoDescTransp +  '
      
        'VENTAS_MAST.MontoDescDirtecnica +  VENTAS_MAST.MontoDescItbisDir' +
        'Tecnica +  VENTAS_MAST.MontoDescImprevisto +  '
      'VENTAS_MAST.MontoDescItbisImprevisto)  AS SubTotalIndirectos,'
      'VENTAS_MAST.Comentario,'
      'VENTAS_MAST.COTIZACION_ORIGEN,'
      'VENTAS_MAST.REFERENCIACTE, VENTAS_MAST.TIPONCFIFISCAL,'
      'VENTAS_MAST.monto_recargo,'
      'VENTAS_MAST.propina,'
      'VENTAS_MAST.propinalegal,'
      'VENTAS_MAST.porcpropinalegal,'
      'VENTAS_MAST.FECHAINICIAPOLIZA,'
      'dgii.FECHA_VENCE fechavenceNCF,'
      'sectores.DESCRIPCION desc_sector,'
      'cc.DESCRIPCION desc_ciudad,'
      'PRE_PAGO.MONTO montoPrepagado'
      'FROM'
      '  VENTAS_MAST'
      
        '  LEFT OUTER JOIN  CLIENTES ON (VENTAS_MAST.CODIGO_CTE = CLIENTE' +
        'S.CODIGO_CTE)'
      
        '  LEFT OUTER JOIN DEVOLUCIONES_PENDIENTE ON (VENTAS_MAST.NUMERO_' +
        'DOC_PAGO = DEVOLUCIONES_PENDIENTE.NUMERO_DEVOLUCION)'
      
        '  LEFT OUTER JOIN CONDICION ON (CLIENTES.CONDICION = CONDICION.C' +
        'ODIGO)'
      
        '  LEFT OUTER JOIN NCF_ASIGNADOS ON (VENTAS_MAST.SERIE_NCF_ASIGNA' +
        'DO = NCF_ASIGNADOS.SERIE)'
      
        '  LEFT OUTER JOIN TIPO_CF ON (NCF_ASIGNADOS.TIPO_NCF = TIPO_CF.T' +
        'IPO_CF)'
      
        'left outer join DGII_SERIE_NFC dgii on dgii.TIPO_CF = tipo_cf.TI' +
        'PO_CF'
      '  left outer join CIUDAD cc on cc.CODIGO = CLIENTES.COD_CIUDAD'
      
        '  left outer join SECTORES  on SECTORES.CODIGO = CLIENTES.CODZON' +
        'A'
      
        'left outer join PRE_PAGO  on PRE_PAGO.NUM_TRN_VTA = VENTAS_MAST.' +
        'NUMERO')
    Left = 576
    Top = 315
  end
  object qryUpdateVentasMast: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from ventas_mast'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into ventas_mast'
      
        '  (NUMERO, FECHA, CIA_KEY, CODIGO_CTE, CODIGO_VENDEDOR, FORMA_PA' +
        'GO, OBSERVACION, '
      
        '   MONEDA, VALOR_TOTAL_DET, STATUS, FECHA_IN, IN_POR, FECHA_MOD,' +
        ' MOD_POR, '
      
        '   NUMERO_FACTURA, NUMERO_DOC_PAGO, SERIE_NCF_ASIGNADO, MONTO_BR' +
        'UTO, PORC_DESCUENTO, '
      
        '   MONTO_DESCUENTO, MONTO_INICIAL, NOMBRE_CLIENTE_GENERAL, MONTO' +
        '_PAGADO, '
      
        '   MONTO_CAMBIO, MONTO_TOTAL_ITBIS, MONTODESCGASTOSADMIN, MONTOD' +
        'ESCITBISGASTOSADMIN, '
      
        '   MONTODESCTRANSP, MONTODESCDIRTECNICA, MONTODESCITBISDIRTECNIC' +
        'A, MONTODESCIMPREVISTO, '
      '   MONTODESCITBISIMPREVISTO, COMENTARIO)'
      'values'
      
        '  (:NUMERO, :FECHA, :CIA_KEY, :CODIGO_CTE, :CODIGO_VENDEDOR, :FO' +
        'RMA_PAGO, '
      
        '   :OBSERVACION, :MONEDA, :VALOR_TOTAL_DET, :STATUS, :FECHA_IN, ' +
        ':IN_POR, '
      
        '   :FECHA_MOD, :MOD_POR, :NUMERO_FACTURA, :NUMERO_DOC_PAGO, :SER' +
        'IE_NCF_ASIGNADO, '
      
        '   :MONTO_BRUTO, :PORC_DESCUENTO, :MONTO_DESCUENTO, :MONTO_INICI' +
        'AL, :NOMBRE_CLIENTE_GENERAL, '
      
        '   :MONTO_PAGADO, :MONTO_CAMBIO, :MONTO_TOTAL_ITBIS, :MONTODESCG' +
        'ASTOSADMIN, '
      
        '   :MONTODESCITBISGASTOSADMIN, :MONTODESCTRANSP, :MONTODESCDIRTE' +
        'CNICA, '
      
        '   :MONTODESCITBISDIRTECNICA, :MONTODESCIMPREVISTO, :MONTODESCIT' +
        'BISIMPREVISTO, '
      '   :COMENTARIO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA,'
      '  CIA_KEY,'
      '  CODIGO_CTE,'
      '  CODIGO_VENDEDOR,'
      '  FORMA_PAGO,'
      '  OBSERVACION,'
      '  MONEDA,'
      '  VALOR_TOTAL_DET,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  NUMERO_FACTURA,'
      '  NUMERO_DOC_PAGO,'
      '  SERIE_NCF_ASIGNADO,'
      '  MONTO_BRUTO,'
      '  PORC_DESCUENTO,'
      '  MONTO_DESCUENTO,'
      '  MONTO_INICIAL,'
      '  NOMBRE_CLIENTE_GENERAL,'
      '  MONTO_PAGADO,'
      '  MONTO_CAMBIO,'
      '  MONTO_TOTAL_ITBIS,'
      '  MONTODESCGASTOSADMIN,'
      '  MONTODESCITBISGASTOSADMIN,'
      '  MONTODESCTRANSP,'
      '  MONTODESCDIRTECNICA,'
      '  MONTODESCITBISDIRTECNICA,'
      '  MONTODESCIMPREVISTO,'
      '  MONTODESCITBISIMPREVISTO,'
      '  COMENTARIO'
      'from ventas_mast '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select *'
      'from ventas_mast'
      'Where'
      '  CODIGO_CTE = :OLD_CODIGO_CTE And'
      '  MONEDA = :OLD_MONEDA And'
      '  NUMERO_FACTURA = :OLD_NUMERO_FACTURA and '
      '  numero=:numero')
    ModifySQL.Strings = (
      'update ventas_mast'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  CIA_KEY = :CIA_KEY,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  CODIGO_VENDEDOR = :CODIGO_VENDEDOR,'
      '  FORMA_PAGO = :FORMA_PAGO,'
      '  OBSERVACION = :OBSERVACION,'
      '  MONEDA = :MONEDA,'
      '  VALOR_TOTAL_DET = :VALOR_TOTAL_DET,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  NUMERO_FACTURA = :NUMERO_FACTURA,'
      '  NUMERO_DOC_PAGO = :NUMERO_DOC_PAGO,'
      '  SERIE_NCF_ASIGNADO = :SERIE_NCF_ASIGNADO,'
      '  MONTO_BRUTO = :MONTO_BRUTO,'
      '  PORC_DESCUENTO = :PORC_DESCUENTO,'
      '  MONTO_DESCUENTO = :MONTO_DESCUENTO,'
      '  MONTO_INICIAL = :MONTO_INICIAL,'
      '  NOMBRE_CLIENTE_GENERAL = :NOMBRE_CLIENTE_GENERAL,'
      '  MONTO_PAGADO = :MONTO_PAGADO,'
      '  MONTO_CAMBIO = :MONTO_CAMBIO,'
      '  MONTO_TOTAL_ITBIS = :MONTO_TOTAL_ITBIS,'
      '  MONTODESCGASTOSADMIN = :MONTODESCGASTOSADMIN,'
      '  MONTODESCITBISGASTOSADMIN = :MONTODESCITBISGASTOSADMIN,'
      '  MONTODESCTRANSP = :MONTODESCTRANSP,'
      '  MONTODESCDIRTECNICA = :MONTODESCDIRTECNICA,'
      '  MONTODESCITBISDIRTECNICA = :MONTODESCITBISDIRTECNICA,'
      '  MONTODESCIMPREVISTO = :MONTODESCIMPREVISTO,'
      '  MONTODESCITBISIMPREVISTO = :MONTODESCITBISIMPREVISTO,'
      '  COMENTARIO = :COMENTARIO'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 568
    Top = 234
    object qryUpdateVentasMastNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryUpdateVentasMastCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST.CODIGO_CTE'
    end
    object qryUpdateVentasMastFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_MAST.FECHA_MOD'
    end
    object qryUpdateVentasMastMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_MAST.MOD_POR'
      Size = 12
    end
  end
  object qryCotizacionConduce: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryCotizacionConduceAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  COTIZACION_MAST.NUMERO,'
      '  COTIZACION_MAST.FECHA,'
      '  COTIZACION_MAST.CIA_KEY,'
      '  COTIZACION_MAST.CODIGO_CTE,'
      '  COTIZACION_MAST.CODIGO_VENDEDOR,'
      '  --COTIZACION_MAST.FORMA_PAGO,'
      '  COTIZACION_MAST.OBSERVACION,'
      '  COTIZACION_MAST.MONEDA,'
      '  COTIZACION_MAST.VALOR_TOTAL  VALOR_TOTAL_DET,'
      '  COTIZACION_MAST.STATUS,'
      '  COTIZACION_MAST.FECHA_IN,'
      '  COTIZACION_MAST.IN_POR,'
      '  COTIZACION_MAST.FECHA_MOD,'
      '  COTIZACION_MAST.MOD_POR,'
      '  COTIZACION_MAST.NUMERO_FACTURA,'
      '  COTIZACION_MAST.NUMERO_DOC_PAGO,'
      '  COTIZACION_MAST.SERIE_NCF_ASIGNADO,'
      '  COTIZACION_MAST.MONTO_BRUTO,'
      '  COTIZACION_MAST.PORC_DESCUENTO,'
      '  COTIZACION_MAST.MONTO_DESCUENTO,'
      '  COTIZACION_MAST.MONTO_INICIAL,'
      '  COTIZACION_MAST.NOMBRE_CLIENTE_GENERAL,'
      '  COTIZACION_MAST.MONTO_PAGADO,'
      '  COTIZACION_MAST.MONTO_CAMBIO,'
      '  COTIZACION_MAST.MONTO_TOTAL_ITBIS,'
      '  CLIENTES.TIPO_CLIENTE,'
      '  CLIENTES.NOMBRE_CTE,'
      '  CLIENTES.NOMBRE_ABREV,'
      '  CLIENTES.NOMBRE_FACTURAR,'
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.FORMA_PAGO,'
      '  CLIENTES.LIMITE_CREDITO,'
      '  CLIENTES.EMAIL,'
      '  CLIENTES.PAIS,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.CEDULA,'
      '  CLIENTES.RNC,'
      '  CLIENTES.CANT_DIAS_CREDITO,'
      '  CLIENTES.RNC_NUMERO,'
      '  CLIENTES.CONDICION,'
      '  CLIENTES.PRECIO_ID,'
      '  --FACTURAS.TIPO_FACTURA,'
      '  --FACTURAS.APLICA_TIPODESC,'
      '  COTIZACION_MAST.MONTODESCGASTOSADMIN,'
      '  COTIZACION_MAST.MONTODESCITBISGASTOSADMIN,'
      '  COTIZACION_MAST.MONTODESCTRANSP,'
      '  COTIZACION_MAST.MONTODESCDIRTECNICA,'
      '  COTIZACION_MAST.MONTODESCITBISDIRTECNICA,'
      '  COTIZACION_MAST.MONTODESCIMPREVISTO,'
      '  COTIZACION_MAST.MONTODESCITBISIMPREVISTO,'
      '  --FACTURAS.SERIE AS SERIEFACTURA,'
      '  --FACTURAS.NUMERO AS NUMEROFACTURA,'
      '  --FACTURAS.MONEDA AS MONEDAFACTURA,'
      '  --FACTURAS.TIPO AS TIPOFACTURA,'
      
        ' COALESCE (CONDICION.DESCRIPCION ,'#39'CONTADO'#39' ) AS CONDICIONCREDIT' +
        'O,  '
      '  NCF_ASIGNADOS.NUMERO_NCF,'
      '  TIPO_CF.DESCRIPCION AS DESCRIPCION_NCF,'
      
        '(COTIZACION_MAST.MontoDescGastosAdmin +  COTIZACION_MAST.MontoDe' +
        'scItbisGastosAdmin +  COTIZACION_MAST.MontoDescTransp +  COTIZAC' +
        'ION_MAST.MontoDescDirtecnica +  COTIZACION_MAST.MontoDescItbisDi' +
        'rTecnica +  COTIZACION_MAST.MontoDescImprevisto +  COTIZACION_MA' +
        'ST.MontoDescItbisImprevisto)  AS SubTotalIndirectos,'
      'COTIZACION_MAST.Comentario,'
      ' '#39#39' AS COTIZACION_ORIGEN,'
      '--COTIZACION_MAST.COTIZACION_ORIGEN,'
      'COTIZACION_MAST.REFERENCIACTE'
      'FROM'
      '  COTIZACION_MAST'
      
        '  INNER JOIN CLIENTES ON (COTIZACION_MAST.CODIGO_CTE = CLIENTES.' +
        'CODIGO_CTE)'
      
        '  --INNER JOIN FACTURAS ON (COTIZACION_MAST.NUMERO_FACTURA = FAC' +
        'TURAS.NUMERO)'
      
        '  LEFT OUTER JOIN CONDICION ON (CLIENTES.CONDICION = CONDICION.C' +
        'ODIGO)'
      
        '  LEFT OUTER JOIN NCF_ASIGNADOS ON (COTIZACION_MAST.SERIE_NCF_AS' +
        'IGNADO = NCF_ASIGNADOS.SERIE)'
      
        '  LEFT OUTER JOIN TIPO_CF ON (NCF_ASIGNADOS.TIPO_NCF = TIPO_CF.T' +
        'IPO_CF)'
      'Where cotizacion_mast.numero =:numero')
    Left = 528
    Top = 275
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryCotizacionConduceNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'COTIZACION_MAST.NUMERO'
      Required = True
    end
    object qryCotizacionConduceFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'COTIZACION_MAST.FECHA'
    end
    object qryCotizacionConduceCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'COTIZACION_MAST.CIA_KEY'
    end
    object qryCotizacionConduceCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'COTIZACION_MAST.CODIGO_CTE'
    end
    object qryCotizacionConduceCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'COTIZACION_MAST.CODIGO_VENDEDOR'
    end
    object qryCotizacionConduceOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'COTIZACION_MAST.OBSERVACION'
      Size = 60
    end
    object qryCotizacionConduceMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'COTIZACION_MAST.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryCotizacionConduceVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'COTIZACION_MAST.VALOR_TOTAL'
    end
    object qryCotizacionConduceSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'COTIZACION_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryCotizacionConduceFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'COTIZACION_MAST.FECHA_IN'
    end
    object qryCotizacionConduceIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'COTIZACION_MAST.IN_POR'
      Size = 12
    end
    object qryCotizacionConduceFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'COTIZACION_MAST.FECHA_MOD'
    end
    object qryCotizacionConduceMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'COTIZACION_MAST.MOD_POR'
      Size = 12
    end
    object qryCotizacionConduceNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'COTIZACION_MAST.NUMERO_FACTURA'
    end
    object qryCotizacionConduceNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'COTIZACION_MAST.NUMERO_DOC_PAGO'
    end
    object qryCotizacionConduceSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'COTIZACION_MAST.SERIE_NCF_ASIGNADO'
    end
    object qryCotizacionConduceMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'COTIZACION_MAST.MONTO_BRUTO'
    end
    object qryCotizacionConducePORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'COTIZACION_MAST.PORC_DESCUENTO'
    end
    object qryCotizacionConduceMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'COTIZACION_MAST.MONTO_DESCUENTO'
    end
    object qryCotizacionConduceMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'COTIZACION_MAST.MONTO_INICIAL'
    end
    object qryCotizacionConduceNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'COTIZACION_MAST.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
    object qryCotizacionConduceMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'COTIZACION_MAST.MONTO_PAGADO'
    end
    object qryCotizacionConduceMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'COTIZACION_MAST.MONTO_CAMBIO'
    end
    object qryCotizacionConduceMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'COTIZACION_MAST.MONTO_TOTAL_ITBIS'
    end
    object qryCotizacionConduceTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
    object qryCotizacionConduceNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryCotizacionConduceNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object qryCotizacionConduceNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryCotizacionConduceDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryCotizacionConduceTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryCotizacionConduceFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'CLIENTES.FORMA_PAGO'
    end
    object qryCotizacionConduceLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object qryCotizacionConduceEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object qryCotizacionConducePAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryCotizacionConduceCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryCotizacionConduceCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryCotizacionConduceRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'CLIENTES.RNC'
      Size = 12
    end
    object qryCotizacionConduceCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'CLIENTES.CANT_DIAS_CREDITO'
    end
    object qryCotizacionConduceRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryCotizacionConduceCONDICION: TIntegerField
      FieldName = 'CONDICION'
      Origin = 'CLIENTES.CONDICION'
    end
    object qryCotizacionConducePRECIO_ID: TIntegerField
      FieldName = 'PRECIO_ID'
      Origin = 'CLIENTES.PRECIO_ID'
    end
    object qryCotizacionConduceMONTODESCGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCGASTOSADMIN'
      Origin = 'COTIZACION_MAST.MONTODESCGASTOSADMIN'
    end
    object qryCotizacionConduceMONTODESCITBISGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCITBISGASTOSADMIN'
      Origin = 'COTIZACION_MAST.MONTODESCITBISGASTOSADMIN'
    end
    object qryCotizacionConduceMONTODESCTRANSP: TFloatField
      FieldName = 'MONTODESCTRANSP'
      Origin = 'COTIZACION_MAST.MONTODESCTRANSP'
    end
    object qryCotizacionConduceMONTODESCDIRTECNICA: TFloatField
      FieldName = 'MONTODESCDIRTECNICA'
      Origin = 'COTIZACION_MAST.MONTODESCDIRTECNICA'
    end
    object qryCotizacionConduceMONTODESCITBISDIRTECNICA: TFloatField
      FieldName = 'MONTODESCITBISDIRTECNICA'
      Origin = 'COTIZACION_MAST.MONTODESCITBISDIRTECNICA'
    end
    object qryCotizacionConduceMONTODESCIMPREVISTO: TFloatField
      FieldName = 'MONTODESCIMPREVISTO'
      Origin = 'COTIZACION_MAST.MONTODESCIMPREVISTO'
    end
    object qryCotizacionConduceMONTODESCITBISIMPREVISTO: TFloatField
      FieldName = 'MONTODESCITBISIMPREVISTO'
      Origin = 'COTIZACION_MAST.MONTODESCITBISIMPREVISTO'
    end
    object qryCotizacionConduceCONDICIONCREDITO: TIBStringField
      FieldName = 'CONDICIONCREDITO'
    end
    object qryCotizacionConduceNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
    object qryCotizacionConduceDESCRIPCION_NCF: TIBStringField
      FieldName = 'DESCRIPCION_NCF'
      Origin = 'TIPO_CF.DESCRIPCION'
      Size = 60
    end
    object qryCotizacionConduceSUBTOTALINDIRECTOS: TFloatField
      FieldName = 'SUBTOTALINDIRECTOS'
    end
    object qryCotizacionConduceCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'COTIZACION_MAST.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object qryCotizacionConduceCOTIZACION_ORIGEN: TIBStringField
      FieldName = 'COTIZACION_ORIGEN'
      Required = True
      FixedChar = True
      Size = 0
    end
    object qryCotizacionConduceREFERENCIACTE: TIBStringField
      FieldName = 'REFERENCIACTE'
      Origin = 'COTIZACION_MAST.REFERENCIACTE'
    end
  end
  object qryCotizacionConduceDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  F.DESCRIPCION AS DESC_TIPO_NCF,'
      '  D.SERIE,'
      '  D.CODIGO_PROD,'
      '  D.CANTIDAD,'
      '  D.CANT_CONDUCE,'
      '  D.PRECIO,'
      '  D.PORC_DESC_DET,'
      '  D.ITBI_DET,'
      '  D.VALOR_SERVICIO_DET,'
      '  D.VALOR_TOTAL_DET,'
      '  V.NUMERO_FACTURA,'
      '  D.STATUS_DET,'
      '  V.SERIE_NCF_ASIGNADO,'
      '  N.NUMERO_NCF,'
      '  V.MONTO_DESCUENTO,'
      '  D.NUMERO,'
      '  D.CODIGO_BARRA,'
      '  D.NUMERO NUM_FACTURA,'
      '  D.FECHA_IN,'
      '  D.IN_POR,'
      '  D.FECHA_MOD,'
      '  D.MOD_POR,'
      '  D.CANT_REGRESO,'
      '  D.CANT_PROMO,'
      '  D.MONTO_DIETA,'
      '  D.MONTO_AJUSTE,'
      '  D.SERIE_PROD,'
      '  D.STATUS_CNT,'
      '  D.TIPO_UNIDAD,'
      '  D.ITBIS_EXENTO,'
      '  D.TIPO_VENTA,'
      '   D.DESCRIPCION,'
      '  0 precio_compra,'
      '  case  nullif( D.DESCRIPCIONPRODUCTO, '#39#39' ) when '#39#39'  then'
      '    D.DESCRIPCION'
      '  else '
      '   D.DESCRIPCION ||'#39' '#39'|| D.DESCRIPCIONPRODUCTO'
      '   end as DESCRIPCIONPRODUCTO'
      'FROM'
      '  COTIZACION_MAST V'
      '  INNER JOIN COTIZACION_DET D ON (V.NUMERO = D.NUMERO)'
      
        '  LEFT OUTER JOIN NCF_ASIGNADOS N ON (V.SERIE_NCF_ASIGNADO = N.S' +
        'ERIE)'
      '  LEFT OUTER JOIN TIPO_CF F ON (N.TIPO_NCF = F.TIPO_CF)'
      'Where   v.NUMERO =:numero'
      'and   D.CANT_CONDUCE > 0')
    Left = 176
    Top = 379
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
        Value = '1594'
      end>
    object qryCotizacionConduceDetDESC_TIPO_NCF: TIBStringField
      FieldName = 'DESC_TIPO_NCF'
      Origin = 'TIPO_CF.DESCRIPCION'
      Size = 60
    end
    object qryCotizacionConduceDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'COTIZACION_DET.SERIE'
      Required = True
    end
    object qryCotizacionConduceDetCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'COTIZACION_DET.CODIGO_PROD'
      Size = 12
    end
    object qryCotizacionConduceDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'COTIZACION_DET.CANTIDAD'
    end
    object qryCotizacionConduceDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'COTIZACION_DET.PRECIO'
    end
    object qryCotizacionConduceDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'COTIZACION_DET.PORC_DESC_DET'
    end
    object qryCotizacionConduceDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'COTIZACION_DET.ITBI_DET'
    end
    object qryCotizacionConduceDetVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'COTIZACION_DET.VALOR_SERVICIO_DET'
    end
    object qryCotizacionConduceDetVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'COTIZACION_DET.VALOR_TOTAL_DET'
    end
    object qryCotizacionConduceDetNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'COTIZACION_MAST.NUMERO_FACTURA'
    end
    object qryCotizacionConduceDetSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'COTIZACION_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryCotizacionConduceDetSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'COTIZACION_MAST.SERIE_NCF_ASIGNADO'
    end
    object qryCotizacionConduceDetNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
    object qryCotizacionConduceDetMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'COTIZACION_MAST.MONTO_DESCUENTO'
    end
    object qryCotizacionConduceDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'COTIZACION_DET.NUMERO'
      Required = True
    end
    object qryCotizacionConduceDetCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'COTIZACION_DET.CODIGO_BARRA'
    end
    object qryCotizacionConduceDetNUM_FACTURA: TIntegerField
      FieldName = 'NUM_FACTURA'
      Origin = 'COTIZACION_DET.NUMERO'
      Required = True
    end
    object qryCotizacionConduceDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'COTIZACION_DET.FECHA_IN'
    end
    object qryCotizacionConduceDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'COTIZACION_DET.IN_POR'
      Size = 12
    end
    object qryCotizacionConduceDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'COTIZACION_DET.FECHA_MOD'
    end
    object qryCotizacionConduceDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'COTIZACION_DET.MOD_POR'
      Size = 12
    end
    object qryCotizacionConduceDetCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'COTIZACION_DET.CANT_REGRESO'
    end
    object qryCotizacionConduceDetCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'COTIZACION_DET.CANT_PROMO'
    end
    object qryCotizacionConduceDetMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'COTIZACION_DET.MONTO_DIETA'
    end
    object qryCotizacionConduceDetMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'COTIZACION_DET.MONTO_AJUSTE'
    end
    object qryCotizacionConduceDetSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'COTIZACION_DET.SERIE_PROD'
      Size = 50
    end
    object qryCotizacionConduceDetSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'COTIZACION_DET.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryCotizacionConduceDetTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'COTIZACION_DET.TIPO_UNIDAD'
    end
    object qryCotizacionConduceDetITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'COTIZACION_DET.ITBIS_EXENTO'
    end
    object qryCotizacionConduceDetTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'COTIZACION_DET.TIPO_VENTA'
    end
    object qryCotizacionConduceDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'COTIZACION_DET.DESCRIPCION'
      Size = 80
    end
    object qryCotizacionConduceDetPRECIO_COMPRA: TIntegerField
      FieldName = 'PRECIO_COMPRA'
      Required = True
    end
    object qryCotizacionConduceDetDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryCotizacionConduceDetCANT_CONDUCE: TFloatField
      FieldName = 'CANT_CONDUCE'
      Origin = 'COTIZACION_DET.CANT_CONDUCE'
    end
  end
  object qryVerificaFact: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  * From TRANS_CXC r'
      'Where r.TIPO_TRANF <> 1'
      'And r.NUMERO_DOC =:numerofactura'
      'And r.codigo_cliente =:codcliente')
    Left = 680
    Top = 467
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerofactura'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codcliente'
        ParamType = ptInput
      end>
  end
  object ibStpCancelaFactura: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_CANCELA_FACTURA'
    Left = 728
    Top = 307
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROFACT'
        ParamType = ptInput
      end>
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
    Left = 256
    Top = 401
  end
  object qryGetNcfAsignado: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT r.NUMERO_FACT, r.NUM_DOC, r.SERIE_NCF_ASIGNADO, r.NUMERO_' +
        'TRN_ORIGEN, n.NUMERO_NCF numero_ncf_afectado, n.tipo_ncf, v.TIPO' +
        'NCFIFISCAL'
      'FROM TRANS_CXC_DET r, VENTAS_MAST v, NCF_ASIGNADOS n'
      'Where r.NUMERO_TRN_ORIGEN = v.NUMERO'
      'And n.SERIE = v.SERIE_NCF_ASIGNADO'
      'And r.NUMERO_TRN_ORIGEN=:numerotrn')
    Left = 800
    Top = 467
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerotrn'
        ParamType = ptInput
      end>
    object qryGetNcfAsignadoNUMERO_FACT: TIntegerField
      FieldName = 'NUMERO_FACT'
      Origin = 'TRANS_CXC_DET.NUMERO_FACT'
    end
    object qryGetNcfAsignadoNUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
      Origin = 'TRANS_CXC_DET.NUM_DOC'
      Required = True
    end
    object qryGetNcfAsignadoSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'TRANS_CXC_DET.SERIE_NCF_ASIGNADO'
    end
    object qryGetNcfAsignadoNUMERO_TRN_ORIGEN: TIntegerField
      FieldName = 'NUMERO_TRN_ORIGEN'
      Origin = 'TRANS_CXC_DET.NUMERO_TRN_ORIGEN'
    end
    object qryGetNcfAsignadoNUMERO_NCF_AFECTADO: TIBStringField
      FieldName = 'NUMERO_NCF_AFECTADO'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Required = True
      Size = 21
    end
    object qryGetNcfAsignadoTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'NCF_ASIGNADOS.TIPO_NCF'
      Required = True
      Size = 2
    end
    object qryGetNcfAsignadoTIPONCFIFISCAL: TIntegerField
      FieldName = 'TIPONCFIFISCAL'
      Origin = 'VENTAS_MAST.TIPONCFIFISCAL'
    end
  end
  object qryGeNcfAsignado_1: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT distinct  0 SERIE,  0 NUMERO_FACT, 0  NUM_DOC, v.SERIE_NC' +
        'F_ASIGNADO, v.NUMERO NUMERO_TRN_ORIGEN, n.NUMERO_NCF numero_ncf_' +
        'afectado, n.tipo_ncf, v.TIPONCFIFISCAL'
      'FROM VENTAS_MAST v, NCF_ASIGNADOS n'
      'Where v.NUMERO = v.NUMERO'
      'And v.SERIE_NCF_ASIGNADO = n.SERIE'
      'And v.NUMERO =:numerotrn')
    Left = 912
    Top = 356
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerotrn'
        ParamType = ptInput
      end>
  end
  object qryGetNcfAsignado_0: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT r.NUMERO_FACT, r.NUM_DOC, r.SERIE_NCF_ASIGNADO, r.NUMERO_' +
        'TRN_ORIGEN, n.NUMERO_NCF numero_ncf_afectado, n.tipo_ncf, v.TIPO' +
        'NCFIFISCAL'
      'FROM TRANS_CXC_DET r, VENTAS_MAST v, NCF_ASIGNADOS n'
      'Where r.NUMERO_TRN_ORIGEN = v.NUMERO'
      'And n.SERIE = v.SERIE_NCF_ASIGNADO'
      'And r.NUMERO_TRN_ORIGEN=:numerotrn')
    Left = 928
    Top = 428
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerotrn'
        ParamType = ptInput
      end>
  end
  object qryCheckNCFSec: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM Proc_CheckSecNCF'
      'Where Status is not null')
    Left = 816
    Top = 162
    object qryCheckNCFSecTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Origin = 'PROC_CHECKSECNCF.TIPO_CF'
      FixedChar = True
      Size = 2
    end
    object qryCheckNCFSecNCF_MAX: TIntegerField
      FieldName = 'NCF_MAX'
      Origin = 'PROC_CHECKSECNCF.NCF_MAX'
    end
    object qryCheckNCFSecNCF: TFloatField
      FieldName = 'NCF'
      Origin = 'PROC_CHECKSECNCF.NCF'
    end
    object qryCheckNCFSecCANT_MIN_AVISO1: TSmallintField
      FieldName = 'CANT_MIN_AVISO1'
      Origin = 'PROC_CHECKSECNCF.CANT_MIN_AVISO1'
    end
    object qryCheckNCFSecCANT_MIN_AVISO2: TSmallintField
      FieldName = 'CANT_MIN_AVISO2'
      Origin = 'PROC_CHECKSECNCF.CANT_MIN_AVISO2'
    end
    object qryCheckNCFSecDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROC_CHECKSECNCF.DESCRIPCION'
      Size = 60
    end
    object qryCheckNCFSecAVISO: TIBStringField
      FieldName = 'AVISO'
      Origin = 'PROC_CHECKSECNCF.AVISO'
      Size = 80
    end
    object qryCheckNCFSecSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'PROC_CHECKSECNCF.STATUS'
    end
  end
  object qryDatosParaCtrlNIF: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select r.numero_trn, r.NIF, n.NUMERO_NCF, r.FECHA_IN fecha,'
      'r.STATUS, m.CODIGO_CTE, m.SERIE_NCF_ASIGNADO, m.MONTO_BRUTO,'
      'm.OBSERVACION, m.NIF_IMPRESO '
      'From NIF_CTRL r, VENTAS_MAST m, NCF_ASIGNADOS n'
      'Where m.NUMERO = r.NUMERO_TRN'
      'And m.SERIE_NCF_ASIGNADO = n.SERIE'
      'And m.CODIGO_VENDEDOR=:codigovendedor'
      'Order By r.NUMERO_TRN desc')
    Left = 816
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigovendedor'
        ParamType = ptInput
      end>
    object qryDatosParaCtrlNIFNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'NIF_CTRL.NUMERO_TRN'
      Required = True
    end
    object qryDatosParaCtrlNIFNIF: TIBStringField
      FieldName = 'NIF'
      Origin = 'NIF_CTRL.NIF'
      Size = 16
    end
    object qryDatosParaCtrlNIFNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Required = True
      Size = 21
    end
    object qryDatosParaCtrlNIFFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'NIF_CTRL.FECHA_IN'
    end
    object qryDatosParaCtrlNIFSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'NIF_CTRL.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosParaCtrlNIFCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST.CODIGO_CTE'
    end
    object qryDatosParaCtrlNIFSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
    object qryDatosParaCtrlNIFMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'VENTAS_MAST.MONTO_BRUTO'
    end
    object qryDatosParaCtrlNIFOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VENTAS_MAST.OBSERVACION'
      Size = 60
    end
    object qryDatosParaCtrlNIFNIF_IMPRESO: TSmallintField
      FieldName = 'NIF_IMPRESO'
      Origin = 'VENTAS_MAST.NIF_IMPRESO'
    end
  end
  object ibtpProcInsVtaCancelar: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INSVTACANCELADA'
    Left = 832
    Top = 114
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end>
  end
  object ibQryviewNCFOld: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select v.*, -1 As TIPO_NCF_IFISCAL, 1000 As tipo_ncfNCR  From vi' +
        'ew_nfc v')
    OnFilterRecord = ibQryViewNCFFilterRecord
    Left = 616
    Top = 484
    object IBStringField9: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ID'
      Origin = 'VIEW_NFC.ID'
      ReadOnly = True
      Size = 42
    end
    object IBStringField10: TIBStringField
      FieldName = 'SERIE'
      Origin = 'VIEW_NFC.SERIE'
      FixedChar = True
      Size = 1
    end
    object IBStringField11: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VIEW_NFC.DESCRIPCION'
      Size = 60
    end
    object IBStringField12: TIBStringField
      FieldName = 'DIV_NEGOCIO'
      Origin = 'VIEW_NFC.DIV_NEGOCIO'
      FixedChar = True
      Size = 2
    end
    object IBStringField13: TIBStringField
      FieldName = 'PECF'
      Origin = 'VIEW_NFC.PECF'
      FixedChar = True
      Size = 3
    end
    object IBStringField14: TIBStringField
      FieldName = 'AICF'
      Origin = 'VIEW_NFC.AICF'
      FixedChar = True
      Size = 3
    end
    object IBStringField15: TIBStringField
      FieldName = 'TIPO_CF'
      Origin = 'VIEW_NFC.TIPO_CF'
      FixedChar = True
      Size = 2
    end
    object FloatField4: TFloatField
      FieldName = 'NCF'
      Origin = 'VIEW_NFC.NCF'
    end
    object IntegerField3: TIntegerField
      FieldName = 'TIPO_NCF_IFISCAL'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'TIPO_NCFNCR'
      Required = True
    end
  end
  object ibstpInsertDevolMaster: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'Proc_Ins_DevolucionMaster'
    Left = 864
    Top = 283
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'CIA_KEY'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'CODIGO_CTE'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'CODIGO_VENDEDOR'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'FORMA_PAGO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTAL_DET'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'NUMERO_FACTURA'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'NUMERO_DOC_PAGO'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'SERIE_NCF_ASIGNADO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_BRUTO'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'PORC_DESCUENTO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DESCUENTO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_INICIAL'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'NOMBRE_CLIENTE_GENERAL'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_PAGADO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_CAMBIO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_TOTAL_ITBIS'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCGASTOSADMIN'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCITBISGASTOSADMIN'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCTRANSP'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCDIRTECNICA'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCITBISDIRTECNICA'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCIMPREVISTO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTODESCITBISIMPREVISTO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'DESC_MONTO_COMBUSTIBLE'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'DESC_MONTO_PRESTAMO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'DESC_MONTO_SINDICATO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'DESC_IMP_SOBRE_RENTA'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'DESC_OTROS'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_SINDICATO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_IMP_SOBRE_RENTA'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'DESC_RUTA'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'OTROS_DESCUENTOS_2'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'OTROS_DESCUENTOS_3'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DESC_CHOFER'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_VENTA'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'COMENTARIO'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'COTIZACION_ORIGEN'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'REFERENCIACTE'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_RECARGO'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'TIPONCFIFISCAL'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_EXONERADO_ITBIS'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'NIF_IMPRESO'
        ParamType = ptOutput
      end>
  end
  object ibQryViewNCFGastos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select v.id, v.SERIE,v.DIV_NEGOCIO,v.PECF,v.AICF,'
      'v.IDSEC_2018,v.DESCRIPCION_2018,v.FECHA_VENCE,'
      
        'v.TIPO_CF,v.NCF, v.DESCRIPCION, -1 TIPO_NCF_IFISCAL,-1 tipo_ncfN' +
        'CR '
      'From View_nfc v Where v.TIPO_CF in ('#39'11'#39')')
    Left = 232
    Top = 480
    object ibQryViewNCFGastosID: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ID'
      Origin = 'VIEW_NFC.ID'
      ReadOnly = True
      Size = 41
    end
    object ibQryViewNCFGastosSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'VIEW_NFC.SERIE'
      FixedChar = True
      Size = 1
    end
    object ibQryViewNCFGastosDIV_NEGOCIO: TIBStringField
      FieldName = 'DIV_NEGOCIO'
      Origin = 'VIEW_NFC.DIV_NEGOCIO'
      FixedChar = True
      Size = 2
    end
    object ibQryViewNCFGastosPECF: TIBStringField
      FieldName = 'PECF'
      Origin = 'VIEW_NFC.PECF'
      FixedChar = True
      Size = 3
    end
    object ibQryViewNCFGastosAICF: TIBStringField
      FieldName = 'AICF'
      Origin = 'VIEW_NFC.AICF'
      FixedChar = True
      Size = 3
    end
    object ibQryViewNCFGastosTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Origin = 'VIEW_NFC.TIPO_CF'
      FixedChar = True
      Size = 2
    end
    object ibQryViewNCFGastosNCF: TFloatField
      FieldName = 'NCF'
      Origin = 'VIEW_NFC.NCF'
    end
    object ibQryViewNCFGastosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VIEW_NFC.DESCRIPCION'
      Size = 60
    end
    object ibQryViewNCFGastosTIPO_NCF_IFISCAL: TIntegerField
      FieldName = 'TIPO_NCF_IFISCAL'
      Required = True
    end
    object ibQryViewNCFGastosTIPO_NCFNCR: TIntegerField
      FieldName = 'TIPO_NCFNCR'
      Required = True
    end
    object ibQryViewNCFGastosIDSEC_2018: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'IDSEC_2018'
      Origin = 'VIEW_NFC.IDSEC_2018'
      ReadOnly = True
      Size = 13
    end
    object ibQryViewNCFGastosDESCRIPCION_2018: TIBStringField
      FieldName = 'DESCRIPCION_2018'
      Origin = 'VIEW_NFC.DESCRIPCION_2018'
      Size = 60
    end
    object ibQryViewNCFGastosFECHA_VENCE: TDateTimeField
      FieldName = 'FECHA_VENCE'
      Origin = 'VIEW_NFC.FECHA_VENCE'
    end
  end
  object dsibQryViewNCFGastos: TDataSource
    DataSet = ibQryViewNCFGastos
    Left = 184
    Top = 431
  end
  object qrySumCantXTUnidad: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      
        'SUBSTRING(U.DESCRIPCION FROM 1 FOR 1) BULTOS, SUM(R.CANTIDAD) CA' +
        'NT'
      'FROM VENTAS_DET R'
      'inner join  UNIDADES U on u.IDUNIDAD = r.TIPO_UNIDAD'
      'WHERE R.NUMERO =:numero'
      'And r.STATUS_DET in ('#39'A'#39','#39'R'#39')'
      'GROUP BY R.NUMERO, SUBSTRING(U.DESCRIPCION FROM 1 FOR 1)')
    Left = 872
    Top = 480
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end>
    object qrySumCantXTUnidadBULTOS: TIBStringField
      FieldName = 'BULTOS'
      Size = 50
    end
    object qrySumCantXTUnidadCANT: TFloatField
      FieldName = 'CANT'
    end
  end
  object qryDatosDevolucionNCR_0: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'FACTURAS.TIPO_FACTURA,   '
      'FACTURAS.APLICA_TIPODESC,   '
      'FACTURAS.SERIE AS SERIEFACTURA, '
      'FACTURAS.NUMERO AS NUMEROFACTURA,   '
      'FACTURAS.MONEDA AS MONEDAFACTURA,   '
      'FACTURAS.TIPO AS TIPOFACTURA,'
      'VENTAS_MAST.NUMERO,   VENTAS_MAST.FECHA,   '
      '  VENTAS_MAST.FECHAINICIAPOLIZA,'
      'VENTAS_MAST.CIA_KEY,   '
      'ventas_mast.IDNUMERODVEH,'
      'VENTAS_MAST.CODIGO_CTE,   VENTAS_MAST.CODIGO_VENDEDOR,   '
      'VENTAS_MAST.FORMA_PAGO,   VENTAS_MAST.OBSERVACION,   '
      
        'VENTAS_MAST.MONEDA,   VENTAS_MAST.VALOR_TOTAL_DET,   VENTAS_MAST' +
        '.STATUS,   '
      'VENTAS_MAST.FECHA_IN,   VENTAS_MAST.IN_POR, '
      'VENTAS_MAST.FECHA_MOD,   VENTAS_MAST.MOD_POR,   '
      'Case'
      
        '   when (VENTAS_MAST.NUMERO_FACTURA is null) then CAST(VENTAS_MA' +
        'ST.NUMERO_DOC_PAGO AS INTEGER)        '
      '   else VENTAS_MAST.NUMERO_FACTURA'
      ' end as NUMERO_FACTURA,  '
      'VENTAS_MAST.NUMERO_DOC_PAGO,'
      'VENTAS_MAST.SERIE_NCF_ASIGNADO,   VENTAS_MAST. '
      
        'MONTO_EXONERADO_ITBIS,   VENTAS_MAST.MONTO_BRUTO,  VENTAS_MAST.P' +
        'ORC_DESCUENTO,   '
      'VENTAS_MAST.MONTO_DESCUENTO,   VENTAS_MAST.MONTO_INICIAL,  '
      
        'VENTAS_MAST.NOMBRE_CLIENTE_GENERAL,   VENTAS_MAST.MONTO_PAGADO, ' +
        '  '
      'VENTAS_MAST.MONTO_CAMBIO, '
      'VENTAS_MAST.MONTO_TOTAL_ITBIS,   CLIENTES.TIPO_CLIENTE,   '
      'CLIENTES.NOMBRE_CTE,   CLIENTES.NOMBRE_ABREV, '
      
        'CLIENTES.NOMBRE_FACTURAR,   CLIENTES.DIRECCION_CONT,   CLIENTES.' +
        'TELEF_CONTACTO,  '
      
        'CLIENTES.FORMA_PAGO,   CLIENTES.LIMITE_CREDITO,   CLIENTES.EMAIL' +
        ',   '
      'CLIENTES.PAIS,   CLIENTES.CIUDAD,   '
      
        'CLIENTES.CEDULA,   CLIENTES.RNC,   CLIENTES.CANT_DIAS_CREDITO,  ' +
        ' CLIENTES.RNC_NUMERO,   '
      'CLIENTES.CONDICION,  '
      'CLIENTES.PRECIO_ID,   '
      'VENTAS_MAST.MONTODESCGASTOSADMIN,'
      'VENTAS_MAST.MONTODESCITBISGASTOSADMIN,   '
      'VENTAS_MAST.MONTODESCTRANSP,   '
      'VENTAS_MAST.MONTODESCDIRTECNICA, '
      'VENTAS_MAST.MONTODESCITBISDIRTECNICA,   '
      'VENTAS_MAST.MONTODESCIMPREVISTO,  '
      'VENTAS_MAST.MONTODESCITBISIMPREVISTO, '
      'VENTAS_MAST.monto_recargo,   '
      
        'COALESCE (CONDICION.DESCRIPCION ,'#39'CONTADO'#39' ) AS CONDICIONCREDITO' +
        ',    '
      'NCF_ASIGNADOS.TIPO_NCF,'
      'NCF_ASIGNADOS.NUMERO_NCF,  '
      'iif(Position('#39'B'#39' in NCF_ASIGNADOS.NUMERO_NCF) > 0,'
      
        '  tipo_cf.descripcion_2018,TIPO_CF.DESCRIPCION) AS DESCRIPCION_N' +
        'CF,'
      
        '(VENTAS_MAST.MontoDescGastosAdmin +  VENTAS_MAST.MontoDescItbisG' +
        'astosAdmin + '
      
        'VENTAS_MAST.MontoDescTransp +  VENTAS_MAST.MontoDescDirtecnica +' +
        ' '
      
        'VENTAS_MAST.MontoDescItbisDirTecnica +  VENTAS_MAST.MontoDescImp' +
        'revisto + '
      'VENTAS_MAST.MontoDescItbisImprevisto)  AS SubTotalIndirectos, '
      
        'VENTAS_MAST.Comentario, VENTAS_MAST.COTIZACION_ORIGEN, VENTAS_MA' +
        'ST.Monto_recargo, VENTAS_MAST.REFERENCIACTE, '
      
        'VENTAS_MAST.TIPONCFIFISCAL, ventas_mast.propina, ventas_mast.pro' +
        'pinalegal, ventas_mast.porcpropinalegal,'
      'VENTAS_MAST.COMENTARIO,'
      'dgii.FECHA_VENCE fechavenceNCF,'
      'sectores.DESCRIPCION desc_sector,'
      'cc.DESCRIPCION desc_ciudad,'
      'PRE_PAGO.MONTO montoPrepagado'
      ''
      
        'FROM   VENTAS_MAST   INNER JOIN CLIENTES ON (VENTAS_MAST.CODIGO_' +
        'CTE = CLIENTES.CODIGO_CTE)   '
      
        'Left Outer JOIN FACTURAS ON (VENTAS_MAST.NUMERO_FACTURA = FACTUR' +
        'AS.NUMERO)   '
      
        'LEFT OUTER JOIN CONDICION ON (CLIENTES.CONDICION = CONDICION.COD' +
        'IGO)   '
      
        'LEFT OUTER JOIN NCF_ASIGNADOS ON (VENTAS_MAST.SERIE_NCF_ASIGNADO' +
        ' = NCF_ASIGNADOS.SERIE)   '
      
        'LEFT OUTER JOIN TIPO_CF ON (NCF_ASIGNADOS.TIPO_NCF = TIPO_CF.TIP' +
        'O_CF)'
      
        'left outer join DGII_SERIE_NFC dgii on dgii.TIPO_CF = tipo_cf.TI' +
        'PO_CF'
      'left outer join CIUDAD cc on cc.CODIGO = CLIENTES.COD_CIUDAD'
      'left outer join SECTORES  on SECTORES.CODIGO = CLIENTES.CODZONA'
      
        'left outer join PRE_PAGO  on PRE_PAGO.NUM_TRN_VTA = VENTAS_MAST.' +
        'NUMERO')
    Left = 864
    Top = 208
  end
  object tblFiscalStatusTicket: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from FISCALSTATUS_TICKET'
      'where'
      '  NUMERO_TRN = :OLD_NUMERO_TRN')
    InsertSQL.Strings = (
      'insert into FISCALSTATUS_TICKET'
      '  (NUMERO_TRN, ACTIVO, FECHA, NIF, IMPRIMIENDO)'
      'values'
      '  (:NUMERO_TRN, :ACTIVO, :FECHA, :NIF, :IMPRIMIENDO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_TRN,'
      '  ACTIVO,'
      '  FECHA,'
      '  NIF,'
      '  IMPRIMIENDO'
      'from FISCALSTATUS_TICKET '
      'where'
      '  NUMERO_TRN = :NUMERO_TRN')
    SelectSQL.Strings = (
      'Select * From FISCALSTATUS_TICKET'
      'Where  numero_trn =:numerotrn')
    ModifySQL.Strings = (
      'update FISCALSTATUS_TICKET'
      'set'
      '  NUMERO_TRN = :NUMERO_TRN,'
      '  ACTIVO = :ACTIVO,'
      '  FECHA = :FECHA,'
      '  NIF = :NIF,'
      '  IMPRIMIENDO = :IMPRIMIENDO'
      'where'
      '  NUMERO_TRN = :OLD_NUMERO_TRN')
    Left = 736
    Top = 16
    object tblFiscalStatusTicketNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'FISCALSTATUS_TICKET.NUMERO_TRN'
      Required = True
    end
    object tblFiscalStatusTicketACTIVO: TSmallintField
      FieldName = 'ACTIVO'
      Origin = 'FISCALSTATUS_TICKET.ACTIVO'
    end
    object tblFiscalStatusTicketFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FISCALSTATUS_TICKET.FECHA'
      Required = True
    end
    object tblFiscalStatusTicketNIF: TIBStringField
      FieldName = 'NIF'
      Origin = 'FISCALSTATUS_TICKET.NIF'
      Size = 30
    end
    object tblFiscalStatusTicketIMPRIMIENDO: TSmallintField
      FieldName = 'IMPRIMIENDO'
      Origin = 'FISCALSTATUS_TICKET.IMPRIMIENDO'
    end
  end
  object qryRepItbisbase: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM proc_rep_tbis(:fefchaini, :fechafin,:codmoneda)'
      'Where (numero_ncf Is not Null)'
      '')
    OnFilterRecord = qryRepItbisFilterRecord
    Left = 572
    Top = 114
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
      end
      item
        DataType = ftString
        Name = 'codmoneda'
        ParamType = ptInput
        Value = '2'
      end>
    object IBStringField16: TIBStringField
      FieldName = 'TIPODOC'
      Origin = 'PROC_REP_TBIS.TIPODOC'
      Size = 12
    end
    object IntegerField5: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST.CODIGO_CTE'
    end
    object FloatField5: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET.ITBI_DET'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object IBStringField17: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_MAST.MONEDA'
      FixedChar = True
      Size = 1
    end
    object IntegerField6: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object IBStringField18: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object IBStringField19: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object FloatField6: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST.VALOR_TOTAL_DET'
    end
    object IBStringField20: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
    object IBStringField21: TIBStringField
      FieldName = 'NUMERODOC'
      Origin = 'PROC_REP_TBIS.NUMERODOC'
      Size = 12
    end
    object IBStringField22: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'PROC_REP_TBIS.NOMBRE_CTE'
      Size = 60
    end
    object IBStringField23: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROC_REP_TBIS.STATUS'
      FixedChar = True
      Size = 1
    end
    object FloatField7: TFloatField
      FieldName = 'VALOR_TASA'
      Origin = 'PROC_REP_TBIS.VALOR_TASA'
    end
    object SmallintField2: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'PROC_REP_TBIS.FORMA_PAGO'
    end
    object FloatField8: TFloatField
      FieldName = 'ITBI_EXONERADO'
      Origin = 'PROC_REP_TBIS.ITBI_EXONERADO'
    end
    object FloatField9: TFloatField
      FieldName = 'VALOR_BASE'
      Origin = 'PROC_REP_TBIS.VALOR_BASE'
    end
    object FloatField10: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'PROC_REP_TBIS.MONTO_DESCUENTO'
    end
    object FloatField11: TFloatField
      FieldName = 'MONTO_RECARGO'
      Origin = 'PROC_REP_TBIS.MONTO_RECARGO'
    end
  end
  object qryRepItbisSum: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      
        '    TIPODOC,  CODIGO_CTE,NUMERODOC,NOMBRE_CTE,  STATUS,  FORMA_P' +
        'AGO,  FECHA,  MONEDA,'
      
        '   DESC_NCF, NUMERO_NCF,  NUMERO,  RNC_NUMERO,  CEDULA,valor_tas' +
        'a,'
      'sum(VALOR_BASE) VALOR_BASE, '
      'sum(MONTO_DESCUENTO) MONTO_DESCUENTO, '
      'sum(ITBI_EXONERADO) ITBI_EXONERADO, '
      'sum(ITBI_DET) ITBI_DET, '
      'sum(VALOR_TOTAL_DET) VALOR_TOTAL_DET,'
      'sum(monto_recargo) monto_recargo'
      ''
      'FROM proc_rep_tbis(:fefchaini, :fechafin,:codmoneda) '
      'Where (numero_ncf Is not Null)    ')
    OnFilterRecord = qryRepItbisFilterRecord
    Left = 612
    Top = 202
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
      end
      item
        DataType = ftString
        Name = 'codmoneda'
        ParamType = ptInput
        Value = '2'
      end>
    object qryRepItbisSumTIPODOC: TIBStringField
      FieldName = 'TIPODOC'
      Origin = 'PROC_REP_TBIS.TIPODOC'
      Size = 12
    end
    object qryRepItbisSumCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROC_REP_TBIS.CODIGO_CTE'
    end
    object qryRepItbisSumNUMERODOC: TIBStringField
      FieldName = 'NUMERODOC'
      Origin = 'PROC_REP_TBIS.NUMERODOC'
      Size = 12
    end
    object qryRepItbisSumNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'PROC_REP_TBIS.NOMBRE_CTE'
      Size = 60
    end
    object qryRepItbisSumSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROC_REP_TBIS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepItbisSumFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'PROC_REP_TBIS.FORMA_PAGO'
    end
    object qryRepItbisSumFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_REP_TBIS.FECHA'
    end
    object qryRepItbisSumMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'PROC_REP_TBIS.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryRepItbisSumDESC_NCF: TIBStringField
      FieldName = 'DESC_NCF'
      Origin = 'PROC_REP_TBIS.DESC_NCF'
      Size = 62
    end
    object qryRepItbisSumNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'PROC_REP_TBIS.NUMERO_NCF'
      Size = 21
    end
    object qryRepItbisSumNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PROC_REP_TBIS.NUMERO'
    end
    object qryRepItbisSumRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'PROC_REP_TBIS.RNC_NUMERO'
      Size = 14
    end
    object qryRepItbisSumCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'PROC_REP_TBIS.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryRepItbisSumVALOR_TASA: TFloatField
      FieldName = 'VALOR_TASA'
      Origin = 'PROC_REP_TBIS.VALOR_TASA'
    end
    object qryRepItbisSumVALOR_BASE: TFloatField
      FieldName = 'VALOR_BASE'
    end
    object qryRepItbisSumMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
    end
    object qryRepItbisSumITBI_EXONERADO: TFloatField
      FieldName = 'ITBI_EXONERADO'
    end
    object qryRepItbisSumITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
    end
    object qryRepItbisSumVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
    end
    object qryRepItbisSumMONTO_RECARGO: TFloatField
      FieldName = 'MONTO_RECARGO'
    end
  end
  object qryRepNCFSum: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      
        '    TIPODOC,  CODIGO_CTE,NUMERODOC,NOMBRE_CTE,  STATUS,  FORMA_P' +
        'AGO,  FECHA,  MONEDA,'
      
        '   DESC_NCF, NUMERO_NCF,  NUMERO,  RNC_NUMERO,  CEDULA,valor_tas' +
        'a,'
      'sum(VALOR_BASE) VALOR_BASE, '
      'sum(MONTO_DESCUENTO) MONTO_DESCUENTO, '
      'sum(ITBI_EXONERADO) ITBI_EXONERADO, '
      'sum(ITBI_DET) ITBI_DET, '
      'sum(VALOR_TOTAL_DET) VALOR_TOTAL_DET,'
      'sum(monto_recargo) monto_recargo'
      ''
      'FROM proc_rep_tbis(:fefchaini, :fechafin,:codmoneda) '
      'Where (numero_ncf Is not Null)    '
      'And (tipodoc = '#39'FACTURA'#39' OR tipodoc = '#39'CONTADO'#39') '
      'group by  '
      
        'TIPODOC,  DESC_NCF,CODIGO_CTE,NUMERODOC,NOMBRE_CTE,  STATUS,  FO' +
        'RMA_PAGO,  FECHA,  MONEDA,'
      'NUMERO_NCF,  NUMERO,  RNC_NUMERO,  CEDULA,valor_tasa'
      ' ORDER BY DESC_NCF, NUMERO_NCF, FECHA, CODIGO_CTE')
    Left = 744
    Top = 80
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
      end
      item
        DataType = ftInteger
        Name = 'codmoneda'
        ParamType = ptInput
      end>
  end
  object qryVentaFacturaDet_food_0: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  D.NUMERO,'
      '  d.serie, '
      '  i.referencia,'
      '  F.DESCRIPCION AS DESC_TIPO_NCF,'
      '  D.CODIGO_PROD,'
      '  V.NUMERO_FACTURA,'
      '  D.STATUS_DET,'
      '  V.SERIE_NCF_ASIGNADO,'
      '  N.NUMERO_NCF,'
      '  D.CODIGO_BARRA,'
      '  D.NUM_FACTURA, D.CODIGO_VENDEDOR,'
      
        '  v.fecha  FECHA_IN, d.NUM_CONDUCE_CTE, d.NUM_IDENT, d.FICHA_VEH' +
        ','
      '  D.IN_POR,'
      '  v.fecha FECHA_MOD,'
      '  D.MOD_POR,'
      '  D.SERIE_PROD,'
      '  D.STATUS_CNT,'
      '  D.TIPO_UNIDAD,'
      '  D.ITBIS_EXENTO,'
      '  D.TIPO_VENTA,  D.LEVEL_PRECIO_VENTA,'
      '  D.DESCRIPCION,'
      '  D.DESCRIPCIONPRODUCTO DescripcionAdicional,'
      '  d.precio_compra,'
      '  case  nullif( D.DESCRIPCIONPRODUCTO, '#39#39' ) when '#39#39'  then'
      '    D.DESCRIPCION'
      '  else '
      '   D.DESCRIPCION ||'#39' '#39'|| D.DESCRIPCIONPRODUCTO'
      '  end as DESCRIPCIONPRODUCTO,'
      '  u.descripcion DescUnidadMedida,'
      '  SUBSTRING(u.DESCRIPCION from 1 for 1) LTIPO_UNIDAD,'
      '  Abs(D.PRECIO) Precio,'
      '  u.cantidad cantXunidad,'
      '  D.PORC_DESC_DET,'
      '  d.porc_desc_item,'
      '  sum(d.cant_viajes) cant_viajes,'
      '  sum(D.CANT_REGRESO) CANT_REGRESO,'
      '  sum(D.CANT_PROMO) CANT_PROMO,'
      '  sum(D.MONTO_DIETA) MONTO_DIETA,'
      '  sum(D.MONTO_AJUSTE) MONTO_AJUSTE,'
      '  sum(D.CANTIDAD) cantidad,'
      '  sum(d.cant_conduce) cant_conduce, '
      '  sum(Abs(D.ITBI_DET))  ITBI_DET,  '
      '  sum(Abs(d.monto_desc_item))  monto_desc_item,'
      '  sum(Abs(V.MONTO_DESCUENTO)) MONTO_DESCUENTO,'
      '  sum(Abs(D.VALOR_SERVICIO_DET)) VALOR_SERVICIO_DET,'
      '  sum(Abs(D.VALOR_TOTAL_DET)) VALOR_TOTAL_DET'
      ' '
      'FROM'
      '  VENTAS_MAST V'
      '  INNER JOIN VENTAS_DET D ON (V.NUMERO = D.NUMERO)'
      
        '  LEFT OUTER JOIN NCF_ASIGNADOS N ON (V.SERIE_NCF_ASIGNADO = N.S' +
        'ERIE)'
      '  LEFT OUTER JOIN TIPO_CF F ON (N.TIPO_NCF = F.TIPO_CF)'
      '  Left Outer join UNIDADES u on (d.tipo_unidad = u.idunidad)'
      
        '  left outer join INVENTARIO_PRODUCTO i on i.codigo = d.CODIGO_P' +
        'ROD'
      'Where   v.NUMERO =:numero'
      'GROUP BY '
      '  D.NUMERO,'
      '  D.SERIE,'
      '  I.REFERENCIA,'
      '  F.DESCRIPCION,'
      '  D.CODIGO_PROD,'
      '  V.NUMERO_FACTURA,'
      '  D.STATUS_DET,'
      '  V.SERIE_NCF_ASIGNADO,'
      '  N.NUMERO_NCF,'
      '  D.CODIGO_BARRA,'
      '  D.NUM_FACTURA,'
      '  V.FECHA,'
      '  D.IN_POR, '
      '  D.MOD_POR,'
      '  D.PRECIO,'
      '  D.SERIE_PROD,'
      '  D.STATUS_CNT,'
      '  D.TIPO_UNIDAD,'
      '  D.ITBIS_EXENTO,'
      '  D.TIPO_VENTA,'
      '  D.NUM_CONDUCE_CTE,'
      '  D.NUM_IDENT,'
      '  D.FICHA_VEH,'
      '  D.DESCRIPCION,'
      '  D.CODIGO_VENDEDOR,'
      '  D.DESCRIPCIONPRODUCTO,'
      '  D.PRECIO_COMPRA,'
      '  U.DESCRIPCION,'
      '  SUBSTRING(U.DESCRIPCION FROM 1 FOR 1),'
      '  U.CANTIDAD,'
      '  D.PORC_DESC_DET,'
      '  D.PORC_DESC_ITEM'
      'ORDER BY D.NUMERO;')
    Left = 112
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
  end
  object qryVentaFacturaDet_Base: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  i.referencia,'
      '  F.DESCRIPCION AS DESC_TIPO_NCF,'
      '  D.SERIE,'
      '  D.CODIGO_PROD,'
      '  D.CANTIDAD,'
      '  d.cant_conduce,'
      '  Abs(D.PRECIO) Precio,'
      '  D.PORC_DESC_DET,'
      '  Abs(D.ITBI_DET)  ITBI_DET,'
      '  d.porc_desc_item,'
      '  Abs(d.monto_desc_item)  monto_desc_item,'
      '  Abs(D.VALOR_SERVICIO_DET) VALOR_SERVICIO_DET,'
      '  Abs(D.VALOR_TOTAL_DET) VALOR_TOTAL_DET,'
      '  V.NUMERO_FACTURA,'
      '  D.STATUS_DET,'
      '  V.SERIE_NCF_ASIGNADO,'
      '  N.NUMERO_NCF,'
      '  Abs(V.MONTO_DESCUENTO) MONTO_DESCUENTO,'
      '  D.NUMERO,'
      '  D.CODIGO_BARRA,'
      '  D.NUM_FACTURA,'
      '  D.FECHA_IN,'
      '  D.IN_POR, d.NUM_CONDUCE_CTE, d.NUM_IDENT, d.FICHA_VEH,'
      '  D.FECHA_MOD,'
      '  D.MOD_POR,'
      '  D.CANT_REGRESO,'
      '  D.CANT_PROMO,'
      '  D.MONTO_DIETA,'
      '  D.MONTO_AJUSTE,'
      '  D.SERIE_PROD,'
      '  D.STATUS_CNT,'
      '  D.TIPO_UNIDAD,'
      '  D.ITBIS_EXENTO,'
      '  D.TIPO_VENTA, D.LEVEL_PRECIO_VENTA,'
      '   D.DESCRIPCION,'
      'D.DESCRIPCIONPRODUCTO DescripcionAdicional,'
      '  d.precio_compra,d.cant_viajes,'
      '  case  nullif( D.DESCRIPCIONPRODUCTO, '#39#39' ) when '#39#39'  then'
      '    D.DESCRIPCION'
      '  else '
      '   D.DESCRIPCION ||'#39' '#39'|| D.DESCRIPCIONPRODUCTO'
      '   end as DESCRIPCIONPRODUCTO,'
      '   u.descripcion DescUnidadMedida, D.CODIGO_VENDEDOR,'
      
        ' SUBSTRING(u.DESCRIPCION from 1 for 1) LTIPO_UNIDAD, u.cantidad ' +
        'cantXunidad '
      'FROM'
      '  VENTAS_MAST V'
      '  INNER JOIN VENTAS_DET D ON (V.NUMERO = D.NUMERO)'
      
        '  LEFT OUTER JOIN NCF_ASIGNADOS N ON (V.SERIE_NCF_ASIGNADO = N.S' +
        'ERIE)'
      '  LEFT OUTER JOIN TIPO_CF F ON (N.TIPO_NCF = F.TIPO_CF)'
      '  Left Outer join UNIDADES u on (d.tipo_unidad = u.idunidad)'
      
        '  left outer join INVENTARIO_PRODUCTO i on i.codigo = d.CODIGO_P' +
        'ROD'
      'Where   v.NUMERO =:numero'
      'order by d.numero, d.serie')
    Left = 112
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
  end
  object qryClientesVendedor: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select v.numero, c.COD_VENDEDOR codvendedorCte , c.CODIGO_CTE, d' +
        '.COD_VENDEDOR codvendedorDC'
      'From CLIENTES c'
      'Left outer join ventas_mast v On v.CODIGO_CTE = c.CODIGO_CTE'
      'left outer join DATOSCONDUCE d on d.NUM_TRN = v.NUMERO'
      'where d.STATUS = '#39'A'#39
      'order by v.NUMERO desc')
    Left = 896
    Top = 24
    object qryClientesVendedorNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
    end
    object qryClientesVendedorCODVENDEDORCTE: TIntegerField
      FieldName = 'CODVENDEDORCTE'
      Origin = 'CLIENTES.COD_VENDEDOR'
    end
    object qryClientesVendedorCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryClientesVendedorCODVENDEDORDC: TIntegerField
      FieldName = 'CODVENDEDORDC'
      Origin = 'DATOSCONDUCE.COD_VENDEDOR'
    end
  end
  object qryDatosVtaARS: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select a.nombre, v.*, c.RNC_NUMERO cedula, c.Nombre_facturar, c.' +
        'telef_contacto,a.NOMBRE_DEPENDIENTE,'
      'm.VALOR_TOTAL_DET - v.monto_cobertura MontoAsegurado'
      'From VENTAARS v'
      'inner join ARS a on a.idars = v.idars '
      'inner join ventas_mast m on m.numero = v.numero_trn'
      'inner join clientes  c on c.codigo_cte = m.codigo_cte'
      'Where v.numero_trn=:numerotrn'
      'and m.ventaars = 1'
      ''
      '')
    Left = 904
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerotrn'
        ParamType = ptInput
      end>
    object qryDatosVtaARSNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'ARS.NOMBRE'
      Size = 60
    end
    object qryDatosVtaARSNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAARS.NUMERO'
      Required = True
    end
    object qryDatosVtaARSNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'VENTAARS.NUMERO_TRN'
    end
    object qryDatosVtaARSIDARS: TIntegerField
      FieldName = 'IDARS'
      Origin = 'VENTAARS.IDARS'
      Required = True
    end
    object qryDatosVtaARSNOMBRE_MEDICO: TIBStringField
      FieldName = 'NOMBRE_MEDICO'
      Origin = 'VENTAARS.NOMBRE_MEDICO'
      Size = 60
    end
    object qryDatosVtaARSNUM_AUTORIZACION: TIBStringField
      FieldName = 'NUM_AUTORIZACION'
      Origin = 'VENTAARS.NUM_AUTORIZACION'
      Size = 40
    end
    object qryDatosVtaARSCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'VENTAARS.CONTACTO'
      Size = 60
    end
    object qryDatosVtaARSDIRECCION: TMemoField
      FieldName = 'DIRECCION'
      Origin = 'VENTAARS.DIRECCION'
      BlobType = ftMemo
      Size = 8
    end
    object qryDatosVtaARSESPECIALIDAD: TIBStringField
      FieldName = 'ESPECIALIDAD'
      Origin = 'VENTAARS.ESPECIALIDAD'
      Size = 40
    end
    object qryDatosVtaARSDIAGNOSTICO: TMemoField
      FieldName = 'DIAGNOSTICO'
      Origin = 'VENTAARS.DIAGNOSTICO'
      BlobType = ftMemo
      Size = 8
    end
    object qryDatosVtaARSMONTO_COBERTURA: TFloatField
      FieldName = 'MONTO_COBERTURA'
      Origin = 'VENTAARS.MONTO_COBERTURA'
    end
    object qryDatosVtaARSEXEQUATUR: TIBStringField
      FieldName = 'EXEQUATUR'
      Origin = 'VENTAARS.EXEQUATUR'
      Size = 12
    end
    object qryDatosVtaARSSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENTAARS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosVtaARSFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAARS.FECHA_IN'
    end
    object qryDatosVtaARSFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'VENTAARS.FECHA_UPDATE'
    end
    object qryDatosVtaARSIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAARS.IN_POR'
      Size = 12
    end
    object qryDatosVtaARSUPDATE_POR: TIBStringField
      FieldName = 'UPDATE_POR'
      Origin = 'VENTAARS.UPDATE_POR'
      Size = 12
    end
    object qryDatosVtaARSAFILIADO: TIBStringField
      FieldName = 'AFILIADO'
      Origin = 'VENTAARS.AFILIADO'
      FixedChar = True
      Size = 15
    end
    object qryDatosVtaARSFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAARS.FECHA'
    end
    object qryDatosVtaARSCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryDatosVtaARSNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryDatosVtaARSTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryDatosVtaARSMONTOASEGURADO: TFloatField
      FieldName = 'MONTOASEGURADO'
    end
    object qryDatosVtaARSNOMBRE_DEPENDIENTE: TIBStringField
      FieldName = 'NOMBRE_DEPENDIENTE'
      Origin = 'ARS.NOMBRE_DEPENDIENTE'
      Size = 60
    end
  end
  object tblFactRecurrentes: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from FRECURRENTE'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into FRECURRENTE'
      
        '  (SERIE, FECHA_GENERADA, CODIGO_CTE, NUMERO_FACT, NUMERO_TRN, R' +
        'UTA, STATUS, '
      '   NUMERO_PROG)'
      'values'
      
        '  (:SERIE, :FECHA_GENERADA, :CODIGO_CTE, :NUMERO_FACT, :NUMERO_T' +
        'RN, :RUTA, '
      '   :STATUS, :NUMERO_PROG)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  FECHA_GENERADA,'
      '  CODIGO_CTE,'
      '  NUMERO_FACT,'
      '  NUMERO_TRN,'
      '  RUTA,'
      '  STATUS,'
      '  NUMERO_PROG'
      'from FRECURRENTE '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * from FRECURRENTE'
      'Where fecha_generada between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update FRECURRENTE'
      'set'
      '  SERIE = :SERIE,'
      '  FECHA_GENERADA = :FECHA_GENERADA,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  NUMERO_FACT = :NUMERO_FACT,'
      '  NUMERO_TRN = :NUMERO_TRN,'
      '  RUTA = :RUTA,'
      '  STATUS = :STATUS,'
      '  NUMERO_PROG = :NUMERO_PROG'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'gen_serie_factrec'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 747
    Top = 423
    object tblFactRecurrentesSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'FRECURRENTE.SERIE'
      Required = True
    end
    object tblFactRecurrentesFECHA_GENERADA: TDateTimeField
      FieldName = 'FECHA_GENERADA'
      Origin = 'FRECURRENTE.FECHA_GENERADA'
      Required = True
    end
    object tblFactRecurrentesCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'FRECURRENTE.CODIGO_CTE'
    end
    object tblFactRecurrentesNUMERO_FACT: TIntegerField
      FieldName = 'NUMERO_FACT'
      Origin = 'FRECURRENTE.NUMERO_FACT'
    end
    object tblFactRecurrentesNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'FRECURRENTE.NUMERO_TRN'
    end
    object tblFactRecurrentesNUMERO_PROG: TIntegerField
      FieldName = 'NUMERO_PROG'
      Origin = 'FRECURRENTE.NUMERO_PROG'
    end
    object tblFactRecurrentesRUTA: TIBStringField
      FieldName = 'RUTA'
      Origin = 'FRECURRENTE.RUTA'
      Size = 200
    end
    object tblFactRecurrentesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FRECURRENTE.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryFechaUltMaxFRec: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select max(PROG_IGUALAS.FECHA_ULT_FACT) FechaMax  '
      'from PROG_IGUALAS')
    Left = 736
    Top = 480
    object qryFechaUltMaxFRecFECHAMAX: TDateTimeField
      FieldName = 'FECHAMAX'
    end
  end
  object qryCantProgServ: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select Count(*) CantServVigentes,'
      
        '(Select Count(*) From PROG_IGUALAS where PROG_IGUALAS.FECHA_FIN ' +
        '< '#39'today'#39' and status ='#39'A'#39') CantServInactivos,'
      
        '(Select Count(*) From PROG_IGUALAS where status ='#39'C'#39') CantServCa' +
        'ncelados,'
      '(Select Count(*) From PROG_IGUALAS) Total'
      'From PROG_IGUALAS'
      'Where status = '#39'A'#39
      'and PROG_IGUALAS.FECHA_FIN > '#39'today'#39)
    Left = 792
    Top = 408
    object qryCantProgServCANTSERVVIGENTES: TIntegerField
      FieldName = 'CANTSERVVIGENTES'
      Required = True
    end
    object qryCantProgServCANTSERVINACTIVOS: TIntegerField
      FieldName = 'CANTSERVINACTIVOS'
    end
    object qryCantProgServCANTSERVCANCELADOS: TIntegerField
      FieldName = 'CANTSERVCANCELADOS'
    end
    object qryCantProgServTOTAL: TIntegerField
      FieldName = 'TOTAL'
    end
  end
  object qryVtaConDeliveryTrn: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select d.*, r.NUMERO_TRN '
      'From CLIENTES_DELIVERY_TRN r'
      'inner join CLIENTES_DELIVERY d on d.CODIGO = r.CODIGO'
      'where r.numero_trn=:numerotrn')
    Left = 768
    Top = 208
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
  object tblPrepagoCte: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PRE_PAGO'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into PRE_PAGO'
      
        '  (NUMERO, CODIGO_CTE, FECHA, MONTO, NUMERO_TRN, CODIGO_PROD, NO' +
        'TA, STATUS, '
      '   CODIGO_USR_CAJA, FPAGO, NUM_TRN_VTA)'
      'values'
      
        '  (:NUMERO, :CODIGO_CTE, :FECHA, :MONTO, :NUMERO_TRN, :CODIGO_PR' +
        'OD, :NOTA, '
      '   :STATUS, :CODIGO_USR_CAJA, :FPAGO, :NUM_TRN_VTA)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  CODIGO_CTE,'
      '  FECHA,'
      '  MONTO,'
      '  NUMERO_TRN,'
      '  CODIGO_PROD,'
      '  NOTA,'
      '  STATUS,'
      '  CODIGO_USR_CAJA,'
      '  FPAGO,'
      '  NUM_TRN_VTA'
      'from PRE_PAGO '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'select * from PRE_PAGO'
      'where codigo_cte =:codigocte')
    ModifySQL.Strings = (
      'update PRE_PAGO'
      'set'
      '  NUMERO = :NUMERO,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  FECHA = :FECHA,'
      '  MONTO = :MONTO,'
      '  NUMERO_TRN = :NUMERO_TRN,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  NOTA = :NOTA,'
      '  STATUS = :STATUS,'
      '  CODIGO_USR_CAJA = :CODIGO_USR_CAJA,'
      '  FPAGO = :FPAGO,'
      '  NUM_TRN_VTA = :NUM_TRN_VTA'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 528
    Top = 544
    object tblPrepagoCteCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PRE_PAGO.CODIGO_CTE'
      Required = True
    end
    object tblPrepagoCteFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PRE_PAGO.FECHA'
    end
    object tblPrepagoCteMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'PRE_PAGO.MONTO'
    end
    object tblPrepagoCteNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'PRE_PAGO.NUMERO_TRN'
    end
    object tblPrepagoCteCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'PRE_PAGO.CODIGO_PROD'
    end
    object tblPrepagoCteNOTA: TMemoField
      FieldName = 'NOTA'
      Origin = 'PRE_PAGO.NOTA'
      BlobType = ftMemo
      Size = 8
    end
    object tblPrepagoCteSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PRE_PAGO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblPrepagoCteNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PRE_PAGO.NUMERO'
      Required = True
    end
    object tblPrepagoCteCODIGO_USR_CAJA: TIntegerField
      FieldName = 'CODIGO_USR_CAJA'
      Origin = 'PRE_PAGO.CODIGO_USR_CAJA'
    end
    object tblPrepagoCteFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'PRE_PAGO.FPAGO'
    end
    object tblPrepagoCteNUM_TRN_VTA: TIntegerField
      FieldName = 'NUM_TRN_VTA'
      Origin = 'PRE_PAGO.NUM_TRN_VTA'
    end
  end
  object qryAbonoPrepago: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select Coalesce(p.CELULAR, c.movil1) movil1, r.*,f.DESCRIPCION f' +
        'ormadepago,  c.nombre_facturar nombrecliente,'
      
        'c.RNC_NUMERO, i.descripcion descripcionprod, u.NOMBRECOMPLETO no' +
        'mbreusuario'
      'From PRE_PAGO r'
      'Inner join  CLIENTES c on c.codigo_cte = r.codigo_cte'
      'left join tipo_pago f on f.CODIGO = r.FPAGO'
      'left outer join PRECIO_CUADROS p on p.NUMERO = r.NUMERO_TRN'
      
        'left outer join INVENTARIO_PRODUCTO i on i.codigo = r.codigo_pro' +
        'd'
      
        'left outer join USUARIO u on u.CODIGO_EMPLEADO = r.CODIGO_USR_CA' +
        'JA'
      'Where r.numero=:numero')
    Left = 624
    Top = 536
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryAbonoPrepagoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PRE_PAGO.NUMERO'
      Required = True
    end
    object qryAbonoPrepagoCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PRE_PAGO.CODIGO_CTE'
      Required = True
    end
    object qryAbonoPrepagoFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PRE_PAGO.FECHA'
    end
    object qryAbonoPrepagoMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'PRE_PAGO.MONTO'
    end
    object qryAbonoPrepagoNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'PRE_PAGO.NUMERO_TRN'
    end
    object qryAbonoPrepagoCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'PRE_PAGO.CODIGO_PROD'
    end
    object qryAbonoPrepagoNOTA: TMemoField
      FieldName = 'NOTA'
      Origin = 'PRE_PAGO.NOTA'
      BlobType = ftMemo
      Size = 8
    end
    object qryAbonoPrepagoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PRE_PAGO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryAbonoPrepagoNOMBRECLIENTE: TIBStringField
      FieldName = 'NOMBRECLIENTE'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryAbonoPrepagoRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryAbonoPrepagoDESCRIPCIONPROD: TIBStringField
      FieldName = 'DESCRIPCIONPROD'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryAbonoPrepagoMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'CLIENTES.MOVIL1'
    end
    object qryAbonoPrepagoCODIGO_USR_CAJA: TIntegerField
      FieldName = 'CODIGO_USR_CAJA'
      Origin = 'PRE_PAGO.CODIGO_USR_CAJA'
    end
    object qryAbonoPrepagoFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'PRE_PAGO.FPAGO'
    end
    object qryAbonoPrepagoFORMADEPAGO: TIBStringField
      FieldName = 'FORMADEPAGO'
      Origin = 'FORMAPAGO.DESCRIPCION'
    end
    object qryAbonoPrepagoNOMBREUSUARIO: TIBStringField
      FieldName = 'NOMBREUSUARIO'
      Origin = 'USUARIO.NOMBRECOMPLETO'
      Size = 40
    end
  end
  object tblUpdateVenta: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from ventas_mast'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into ventas_mast'
      
        '  (NUMERO, FECHA, CIA_KEY, CODIGO_CTE, CODIGO_VENDEDOR, FORMA_PA' +
        'GO, OBSERVACION, '
      
        '   MONEDA, VALOR_TOTAL_DET, STATUS, FECHA_IN, IN_POR, FECHA_MOD,' +
        ' MOD_POR, '
      
        '   NUMERO_FACTURA, NUMERO_DOC_PAGO, SERIE_NCF_ASIGNADO, MONTO_BR' +
        'UTO, PORC_DESCUENTO, '
      
        '   MONTO_DESCUENTO, MONTO_INICIAL, NOMBRE_CLIENTE_GENERAL, MONTO' +
        '_PAGADO, '
      '   MONTO_CAMBIO, MONTO_TOTAL_ITBIS)'
      'values'
      
        '  (:NUMERO, :FECHA, :CIA_KEY, :CODIGO_CTE, :CODIGO_VENDEDOR, :FO' +
        'RMA_PAGO, '
      
        '   :OBSERVACION, :MONEDA, :VALOR_TOTAL_DET, :STATUS, :FECHA_IN, ' +
        ':IN_POR, '
      
        '   :FECHA_MOD, :MOD_POR, :NUMERO_FACTURA, :NUMERO_DOC_PAGO, :SER' +
        'IE_NCF_ASIGNADO, '
      
        '   :MONTO_BRUTO, :PORC_DESCUENTO, :MONTO_DESCUENTO, :MONTO_INICI' +
        'AL, :NOMBRE_CLIENTE_GENERAL, '
      '   :MONTO_PAGADO, :MONTO_CAMBIO, :MONTO_TOTAL_ITBIS)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA,'
      '  CIA_KEY,'
      '  CODIGO_CTE,'
      '  CODIGO_VENDEDOR,'
      '  FORMA_PAGO,'
      '  OBSERVACION,'
      '  MONEDA,'
      '  VALOR_TOTAL_DET,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  NUMERO_FACTURA,'
      '  NUMERO_DOC_PAGO,'
      '  SERIE_NCF_ASIGNADO,'
      '  MONTO_BRUTO,'
      '  PORC_DESCUENTO,'
      '  MONTO_DESCUENTO,'
      '  MONTO_INICIAL,'
      '  NOMBRE_CLIENTE_GENERAL,'
      '  MONTO_PAGADO,'
      '  MONTO_CAMBIO,'
      '  MONTO_TOTAL_ITBIS'
      'from ventas_mast '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select *'
      'from ventas_mast'
      'Where'
      '  numero=:numero')
    ModifySQL.Strings = (
      'update ventas_mast'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  CIA_KEY = :CIA_KEY,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  CODIGO_VENDEDOR = :CODIGO_VENDEDOR,'
      '  FORMA_PAGO = :FORMA_PAGO,'
      '  OBSERVACION = :OBSERVACION,'
      '  MONEDA = :MONEDA,'
      '  VALOR_TOTAL_DET = :VALOR_TOTAL_DET,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  NUMERO_FACTURA = :NUMERO_FACTURA,'
      '  NUMERO_DOC_PAGO = :NUMERO_DOC_PAGO,'
      '  SERIE_NCF_ASIGNADO = :SERIE_NCF_ASIGNADO,'
      '  MONTO_BRUTO = :MONTO_BRUTO,'
      '  PORC_DESCUENTO = :PORC_DESCUENTO,'
      '  MONTO_DESCUENTO = :MONTO_DESCUENTO,'
      '  MONTO_INICIAL = :MONTO_INICIAL,'
      '  NOMBRE_CLIENTE_GENERAL = :NOMBRE_CLIENTE_GENERAL,'
      '  MONTO_PAGADO = :MONTO_PAGADO,'
      '  MONTO_CAMBIO = :MONTO_CAMBIO,'
      '  MONTO_TOTAL_ITBIS = :MONTO_TOTAL_ITBIS'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 728
    Top = 536
    object tblUpdateVentaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object tblUpdateVentaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object tblUpdateVentaCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VENTAS_MAST.CIA_KEY'
    end
    object tblUpdateVentaCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VENTAS_MAST.CODIGO_CTE'
    end
    object tblUpdateVentaCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VENTAS_MAST.CODIGO_VENDEDOR'
    end
    object tblUpdateVentaFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VENTAS_MAST.FORMA_PAGO'
    end
    object tblUpdateVentaOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VENTAS_MAST.OBSERVACION'
      Size = 60
    end
    object tblUpdateVentaMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_MAST.MONEDA'
      FixedChar = True
      Size = 1
    end
    object tblUpdateVentaVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST.VALOR_TOTAL_DET'
    end
    object tblUpdateVentaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENTAS_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblUpdateVentaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_MAST.FECHA_IN'
    end
    object tblUpdateVentaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_MAST.IN_POR'
      Size = 12
    end
    object tblUpdateVentaFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_MAST.FECHA_MOD'
    end
    object tblUpdateVentaMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_MAST.MOD_POR'
      Size = 12
    end
    object tblUpdateVentaNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST.NUMERO_FACTURA'
    end
    object tblUpdateVentaNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VENTAS_MAST.NUMERO_DOC_PAGO'
    end
    object tblUpdateVentaSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VENTAS_MAST.SERIE_NCF_ASIGNADO'
    end
    object tblUpdateVentaMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'VENTAS_MAST.MONTO_BRUTO'
    end
    object tblUpdateVentaPORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VENTAS_MAST.PORC_DESCUENTO'
    end
    object tblUpdateVentaMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VENTAS_MAST.MONTO_DESCUENTO'
    end
    object tblUpdateVentaMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'VENTAS_MAST.MONTO_INICIAL'
    end
    object tblUpdateVentaNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'VENTAS_MAST.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
    object tblUpdateVentaMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VENTAS_MAST.MONTO_PAGADO'
    end
    object tblUpdateVentaMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'VENTAS_MAST.MONTO_CAMBIO'
    end
    object tblUpdateVentaMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'VENTAS_MAST.MONTO_TOTAL_ITBIS'
    end
  end
  object qryDetPagos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from DETALLE_PAGOS'
      'where serie_trn=:numerotrn')
    Left = 400
    Top = 552
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numerotrn'
        ParamType = ptUnknown
      end>
  end
end
