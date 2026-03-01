object dmFactura: TdmFactura
  OldCreateOrder = False
  Left = 628
  Top = 231
  Height = 507
  Width = 392
  object tblFacturas: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
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
      
        '   RCXC, RCNT, STATUS, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, ABO' +
        'NO, MONTO_COMBUSTIBLE, '
      '   AJUSTE, NUM_COMP_FISCAL, NCF_DGII, MONTO_OFERTA)'
      'values'
      
        '  (:SERIE, :NUMERO, :MONEDA, :TIPO, :CODIGO_CTE, :FECHA, :DESCRI' +
        'PCION, '
      
        '   :MONTO_FACT, :RCXC, :RCNT, :STATUS, :FECHA_IN, :IN_POR, :FECH' +
        'A_MOD, '
      
        '   :MOD_POR, :ABONO, :MONTO_COMBUSTIBLE, :AJUSTE, :NUM_COMP_FISC' +
        'AL, :NCF_DGII, '
      '   :MONTO_OFERTA)')
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
      '  ABONO,'
      '  MONTO_COMBUSTIBLE,'
      '  AJUSTE,'
      '  NUM_COMP_FISCAL,'
      '  NCF_DGII,'
      '  MONTO_OFERTA'
      'from FACTURAS '
      'where'
      '  SERIE = :SERIE and'
      '  NUMERO = :NUMERO and'
      '  MONEDA = :MONEDA and'
      '  TIPO = :TIPO')
    SelectSQL.Strings = (
      'SELECT   * FROM  FACTURAS'
      'WHERE fecha BETWEEN  :fechaIni AND  :fechaFin')
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
      '  ABONO = :ABONO,'
      '  MONTO_COMBUSTIBLE = :MONTO_COMBUSTIBLE,'
      '  AJUSTE = :AJUSTE,'
      '  NUM_COMP_FISCAL = :NUM_COMP_FISCAL,'
      '  NCF_DGII = :NCF_DGII,'
      '  MONTO_OFERTA = :MONTO_OFERTA'
      'where'
      '  SERIE = :OLD_SERIE and'
      '  NUMERO = :OLD_NUMERO and'
      '  MONEDA = :OLD_MONEDA and'
      '  TIPO = :OLD_TIPO')
    Left = 48
    Top = 32
    object tblFacturasSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'FACTURAS.SERIE'
      Required = True
    end
    object tblFacturasNUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
      Origin = 'FACTURAS.NUMERO'
      Required = True
    end
    object tblFacturasMONEDA: TIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Origin = 'FACTURAS.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tblFacturasTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'FACTURAS.TIPO'
      Required = True
    end
    object tblFacturasCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'FACTURAS.CODIGO_CTE'
    end
    object tblFacturasFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FACTURAS.FECHA'
    end
    object tblFacturasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'FACTURAS.DESCRIPCION'
      Size = 40
    end
    object tblFacturasMONTO_FACT: TFloatField
      FieldName = 'MONTO_FACT'
      Origin = 'FACTURAS.MONTO_FACT'
    end
    object tblFacturasRCXC: TIBStringField
      FieldName = 'RCXC'
      Origin = 'FACTURAS.RCXC'
      FixedChar = True
      Size = 1
    end
    object tblFacturasRCNT: TIBStringField
      FieldName = 'RCNT'
      Origin = 'FACTURAS.RCNT'
      FixedChar = True
      Size = 1
    end
    object tblFacturasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FACTURAS.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblFacturasFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'FACTURAS.FECHA_IN'
    end
    object tblFacturasIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'FACTURAS.IN_POR'
      Size = 12
    end
    object tblFacturasFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'FACTURAS.FECHA_MOD'
    end
    object tblFacturasMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'FACTURAS.MOD_POR'
      Size = 12
    end
  end
  object dstblFacturas: TDataSource
    DataSet = tblFacturas
    Left = 48
    Top = 80
  end
  object IBDatosFctPago: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
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
    Top = 144
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
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
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
    Left = 152
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
    Left = 152
    Top = 192
  end
  object qryClientes: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    OnCalcFields = qryClientesCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT  * FROM CLIENTES, tipo_cliente'
      'where tipo_cliente.codigo = clientes.tipo_cliente'
      'ORDER BY NOMBRE, APELLIDO, NOMBRE_EMPRESA')
    Left = 152
    Top = 256
    object qryClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CLIENTES.CODIGO'
      Required = True
    end
    object qryClientesNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'CLIENTES.NOMBRE'
      Size = 60
    end
    object qryClientesAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'CLIENTES.APELLIDO'
      Size = 60
    end
    object qryClientesNOMBRE_EMPRESA: TIBStringField
      FieldName = 'NOMBRE_EMPRESA'
      Origin = 'CLIENTES.NOMBRE_EMPRESA'
      Size = 40
    end
    object qryClientesNOMBRE_CLIENTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOMBRE_CLIENTE'
      Size = 40
      Calculated = True
    end
    object qryClientesTELEFONO_LOCAL: TIBStringField
      FieldName = 'TELEFONO_LOCAL'
      Origin = 'CLIENTES.TELEFONO_LOCAL'
      Size = 14
    end
    object qryClientesDIRECCION_LOCAL: TIBStringField
      FieldName = 'DIRECCION_LOCAL'
      Origin = 'CLIENTES.DIRECCION_LOCAL'
      Size = 60
    end
    object qryClientesDESCRIPCION: TIBStringField
      DisplayLabel = 'DescTipoCliente'
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_CLIENTE.DESCRIPCION'
      Size = 30
    end
  end
  object dsqryClientes: TDataSource
    DataSet = qryClientes
    Left = 152
    Top = 312
  end
  object tblBalanceCliente: TIBDataSet
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from BALANCE_CTE'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  SERVICIO = :OLD_SERVICIO and'
      '  MONEDA = :OLD_MONEDA')
    InsertSQL.Strings = (
      'insert into BALANCE_CTE'
      
        '  (CODIGO, SERVICIO, MONEDA, CTA1_BCE, CTA2_BCE, CTA3_BCE, BALAN' +
        'CE_ACT, '
      
        '   BALANCE_ANT, DEBITO_MES, CREDITO_MES, DEBITO_ACM, CREDITO_ACM' +
        ', FECHA_BCE, '
      
        '   FECHA_ULT_PAGO, STATUS_BCE, FECHA_IN, IN_POR, FECHA_MOD, MOD_' +
        'POR, COMENTARIO)'
      'values'
      
        '  (:CODIGO, :SERVICIO, :MONEDA, :CTA1_BCE, :CTA2_BCE, :CTA3_BCE,' +
        ' :BALANCE_ACT, '
      
        '   :BALANCE_ANT, :DEBITO_MES, :CREDITO_MES, :DEBITO_ACM, :CREDIT' +
        'O_ACM, '
      
        '   :FECHA_BCE, :FECHA_ULT_PAGO, :STATUS_BCE, :FECHA_IN, :IN_POR,' +
        ' :FECHA_MOD, '
      '   :MOD_POR, :COMENTARIO)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  SERVICIO,'
      '  MONEDA,'
      '  CTA1_BCE,'
      '  CTA2_BCE,'
      '  CTA3_BCE,'
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
      '  MOD_POR,'
      '  COMENTARIO'
      'from BALANCE_CTE '
      'where'
      '  CODIGO = :CODIGO and'
      '  SERVICIO = :SERVICIO and'
      '  MONEDA = :MONEDA')
    SelectSQL.Strings = (
      'Select *  from BALANCE_CTE'
      '')
    ModifySQL.Strings = (
      'update BALANCE_CTE'
      'set'
      '  CODIGO = :CODIGO,'
      '  SERVICIO = :SERVICIO,'
      '  MONEDA = :MONEDA,'
      '  CTA1_BCE = :CTA1_BCE,'
      '  CTA2_BCE = :CTA2_BCE,'
      '  CTA3_BCE = :CTA3_BCE,'
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
      '  MOD_POR = :MOD_POR,'
      '  COMENTARIO = :COMENTARIO'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  SERVICIO = :OLD_SERVICIO and'
      '  MONEDA = :OLD_MONEDA')
    Left = 48
    Top = 256
    object tblBalanceClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'BALANCE_CTE.CODIGO'
      Required = True
    end
    object tblBalanceClienteSERVICIO: TIntegerField
      FieldName = 'SERVICIO'
      Origin = 'BALANCE_CTE.SERVICIO'
      Required = True
    end
    object tblBalanceClienteMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'BALANCE_CTE.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tblBalanceClienteCTA1_BCE: TIBStringField
      FieldName = 'CTA1_BCE'
      Origin = 'BALANCE_CTE.CTA1_BCE'
      FixedChar = True
      Size = 3
    end
    object tblBalanceClienteCTA2_BCE: TIBStringField
      FieldName = 'CTA2_BCE'
      Origin = 'BALANCE_CTE.CTA2_BCE'
      FixedChar = True
      Size = 2
    end
    object tblBalanceClienteCTA3_BCE: TIBStringField
      FieldName = 'CTA3_BCE'
      Origin = 'BALANCE_CTE.CTA3_BCE'
      FixedChar = True
      Size = 2
    end
    object tblBalanceClienteBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'BALANCE_CTE.BALANCE_ACT'
    end
    object tblBalanceClienteBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'BALANCE_CTE.BALANCE_ANT'
    end
    object tblBalanceClienteDEBITO_MES: TFloatField
      FieldName = 'DEBITO_MES'
      Origin = 'BALANCE_CTE.DEBITO_MES'
    end
    object tblBalanceClienteCREDITO_MES: TFloatField
      FieldName = 'CREDITO_MES'
      Origin = 'BALANCE_CTE.CREDITO_MES'
    end
    object tblBalanceClienteDEBITO_ACM: TFloatField
      FieldName = 'DEBITO_ACM'
      Origin = 'BALANCE_CTE.DEBITO_ACM'
    end
    object tblBalanceClienteCREDITO_ACM: TFloatField
      FieldName = 'CREDITO_ACM'
      Origin = 'BALANCE_CTE.CREDITO_ACM'
    end
    object tblBalanceClienteFECHA_BCE: TDateTimeField
      FieldName = 'FECHA_BCE'
      Origin = 'BALANCE_CTE.FECHA_BCE'
    end
    object tblBalanceClienteFECHA_ULT_PAGO: TDateTimeField
      FieldName = 'FECHA_ULT_PAGO'
      Origin = 'BALANCE_CTE.FECHA_ULT_PAGO'
    end
    object tblBalanceClienteSTATUS_BCE: TIBStringField
      FieldName = 'STATUS_BCE'
      Origin = 'BALANCE_CTE.STATUS_BCE'
      FixedChar = True
      Size = 1
    end
    object tblBalanceClienteCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'BALANCE_CTE.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object tblBalanceClienteFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'BALANCE_CTE.FECHA_IN'
    end
    object tblBalanceClienteIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'BALANCE_CTE.IN_POR'
      Size = 12
    end
    object tblBalanceClienteFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'BALANCE_CTE.FECHA_MOD'
    end
    object tblBalanceClienteMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'BALANCE_CTE.MOD_POR'
      Size = 12
    end
  end
  object dstblBalanceCliente: TDataSource
    DataSet = tblBalanceCliente
    Left = 48
    Top = 312
  end
  object stpFactPagoInc: TIBStoredProc
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    StoredProcName = 'PROCFACT_PAGO_ING'
    Left = 152
    Top = 32
  end
  object stpFactPendiente: TIBStoredProc
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    StoredProcName = 'PROCFACT_PENDIENTE'
    Left = 152
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALOR_PENDIENTE'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_FACT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_PENDIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ACCION'
        ParamType = ptInput
      end>
  end
  object qryFacturasCte: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT FACTURAS.NUMERO,'
      '       FACTURAS.MONEDA,'
      '       FACTURAS.TIPO,'
      '       FACTURAS.CODIGO_CTE,'
      '       FACTURAS.FECHA,'
      '       FACTURAS.DESCRIPCION,'
      '       FACTURAS.MONTO_FACT,'
      '       FACTURAS.RCXC,'
      '       FACTURAS.RCNT,'
      '       FACTURAS.STATUS,'
      '       FACTURAS_PENDIENTES.NUMERO_FACT,'
      '       FACTURAS_PENDIENTES.MONTO_PENDIENTE'
      'FROM FACTURAS_PENDIENTES'
      
        '   INNER JOIN FACTURAS ON (FACTURAS_PENDIENTES.NUMERO_FACT = FAC' +
        'TURAS.NUMERO)'
      'WHERE FACTURAS.CODIGO_CTE =:CODIGOCLIENTE')
    Left = 248
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGOCLIENTE'
        ParamType = ptInput
      end>
    object qryFacturasCteNUMERO: TIntegerField
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
      Origin = 'FACTURAS.NUMERO'
      Required = True
    end
    object qryFacturasCteMONEDA: TIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Origin = 'FACTURAS.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryFacturasCteTIPO: TSmallintField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'FACTURAS.TIPO'
      Required = True
    end
    object qryFacturasCteCODIGO_CTE: TIntegerField
      DisplayLabel = 'CodigoCte'
      FieldName = 'CODIGO_CTE'
      Origin = 'FACTURAS.CODIGO_CTE'
    end
    object qryFacturasCteFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'FACTURAS.FECHA'
    end
    object qryFacturasCteDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'FACTURAS.DESCRIPCION'
      Size = 40
    end
    object qryFacturasCteMONTO_FACT: TFloatField
      DisplayLabel = 'Monto Factura'
      FieldName = 'MONTO_FACT'
      Origin = 'FACTURAS.MONTO_FACT'
      DisplayFormat = ',0.00'
    end
    object qryFacturasCteMONTO_PENDIENTE: TFloatField
      DisplayLabel = 'Monto Pendiente'
      FieldName = 'MONTO_PENDIENTE'
      Origin = 'FACTURAS_PENDIENTES.MONTO_PENDIENTE'
      DisplayFormat = ',0.00'
    end
    object qryFacturasCteRCXC: TIBStringField
      DisplayLabel = 'Rcxc'
      FieldName = 'RCXC'
      Origin = 'FACTURAS.RCXC'
      FixedChar = True
      Size = 1
    end
    object qryFacturasCteRCNT: TIBStringField
      DisplayLabel = 'Rcnt'
      FieldName = 'RCNT'
      Origin = 'FACTURAS.RCNT'
      FixedChar = True
      Size = 1
    end
    object qryFacturasCteSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'FACTURAS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryFacturasCteNUMERO_FACT: TIntegerField
      DisplayLabel = 'Num. Factura'
      FieldName = 'NUMERO_FACT'
      Origin = 'FACTURAS_PENDIENTES.NUMERO_FACT'
      Required = True
    end
  end
  object dsqryFacturasCte: TDataSource
    DataSet = qryFacturasCte
    Left = 248
    Top = 80
  end
  object qryFacturaMaster: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    AfterScroll = qryFacturaMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '       CLIENTES.TIPO_CLIENTE TIPO_CONTRATO,'
      '       CLIENTES.NOMBRE_EMPRESA,'
      '       FACTURAS.CODIGO_CTE,'
      '       CLIENTES.TIPO_CLIENTE,'
      '       CLIENTES.NOMBRE,'
      '       CLIENTES.APELLIDO,'
      '       CLIENTES.TELEF_CONTACTO,'
      '       CONDICION_VENTA.DESCRIPCION,'
      '       CLIENTES.DIRECCION_REAL,'
      '       CLIENTES.DIRECCION_LOCAL,'
      '       CLIENTES.CONDICION,'
      '       CLIENTES.TELEF_REFERENCIA,'
      '       CLIENTES.OTRO_TELEFONO,'
      '       CLIENTES.TELEFONO_LOCAL,'
      '       CLIENTES.CIUDAD,'
      '       CLIENTES.PAIS,'
      '       CLIENTES.CANT_DIAS_CREDITO,'
      '       CLIENTES.RNC RNC_CTE,'
      '       CLIENTES.CEDULA CEDULA_CTE,'
      '       FACTURAS.MONTO_FACT,'
      '       FACTURAS.FECHA,'
      '       FACTURAS.MONEDA,'
      '       FACTURAS.RCXC,'
      '       FACTURAS.STATUS,'
      '       FACTURAS.RCNT,'
      '       FACTURAS.NUMERO numero_factura,'
      '       facturas.abono, facturas.ajuste,'
      '       facturas.monto_combustible, facturas.NUM_COMP_FISCAL,'
      '       facturas.ncf_dgii, facturas.monto_oferta'
      'FROM CONTRATO_CIERRE'
      
        '   INNER JOIN FACTURAS ON (CONTRATO_CIERRE.NUMERO_FACTURA = FACT' +
        'URAS.NUMERO)'
      
        '   INNER JOIN CLIENTES ON (FACTURAS.CODIGO_CTE = CLIENTES.CODIGO' +
        ')'
      
        '   INNER JOIN CONDICION_VENTA ON (CLIENTES.CONDICION = CONDICION' +
        '_VENTA.CODIGO)'
      'Where Contrato_cierre.numero_factura = :numerofactura')
    Left = 248
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numerofactura'
        ParamType = ptUnknown
      end>
    object qryFacturaMasterNOMBRE_EMPRESA: TIBStringField
      FieldName = 'NOMBRE_EMPRESA'
      Origin = 'CLIENTES.NOMBRE_EMPRESA'
      Size = 40
    end
    object qryFacturaMasterCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'FACTURAS.CODIGO_CTE'
    end
    object qryFacturaMasterTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
    object qryFacturaMasterNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'CLIENTES.NOMBRE'
      Size = 60
    end
    object qryFacturaMasterAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'CLIENTES.APELLIDO'
      Size = 60
    end
    object qryFacturaMasterTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
    end
    object qryFacturaMasterDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'CONDICION_VENTA.DESCRIPCION'
    end
    object qryFacturaMasterDIRECCION_REAL: TIBStringField
      FieldName = 'DIRECCION_REAL'
      Origin = 'CLIENTES.DIRECCION_REAL'
      Size = 60
    end
    object qryFacturaMasterDIRECCION_LOCAL: TIBStringField
      FieldName = 'DIRECCION_LOCAL'
      Origin = 'CLIENTES.DIRECCION_LOCAL'
      Size = 60
    end
    object qryFacturaMasterCONDICION: TSmallintField
      FieldName = 'CONDICION'
      Origin = 'CLIENTES.CONDICION'
    end
    object qryFacturaMasterTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'CLIENTES.TELEF_REFERENCIA'
    end
    object qryFacturaMasterOTRO_TELEFONO: TIBStringField
      FieldName = 'OTRO_TELEFONO'
      Origin = 'CLIENTES.OTRO_TELEFONO'
    end
    object qryFacturaMasterCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryFacturaMasterPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryFacturaMasterMONTO_FACT: TFloatField
      FieldName = 'MONTO_FACT'
      Origin = 'FACTURAS.MONTO_FACT'
    end
    object qryFacturaMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FACTURAS.FECHA'
    end
    object qryFacturaMasterMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'FACTURAS.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryFacturaMasterRCXC: TIBStringField
      FieldName = 'RCXC'
      Origin = 'FACTURAS.RCXC'
      FixedChar = True
      Size = 1
    end
    object qryFacturaMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FACTURAS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryFacturaMasterRCNT: TIBStringField
      FieldName = 'RCNT'
      Origin = 'FACTURAS.RCNT'
      FixedChar = True
      Size = 1
    end
    object qryFacturaMasterNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'FACTURAS.NUMERO'
      Required = True
    end
    object qryFacturaMasterTELEFONO_LOCAL: TIBStringField
      FieldName = 'TELEFONO_LOCAL'
      Origin = 'CLIENTES.TELEFONO_LOCAL'
    end
    object qryFacturaMasterTIPO_CONTRATO: TSmallintField
      FieldName = 'TIPO_CONTRATO'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
    object qryFacturaMasterCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'CLIENTES.CANT_DIAS_CREDITO'
    end
    object qryFacturaMasterABONO: TFloatField
      FieldName = 'ABONO'
      Origin = 'FACTURAS.ABONO'
    end
    object qryFacturaMasterAJUSTE: TFloatField
      FieldName = 'AJUSTE'
      Origin = 'FACTURAS.AJUSTE'
    end
    object qryFacturaMasterMONTO_COMBUSTIBLE: TFloatField
      FieldName = 'MONTO_COMBUSTIBLE'
      Origin = 'FACTURAS.MONTO_COMBUSTIBLE'
    end
    object qryFacturaMasterNUM_COMP_FISCAL: TFloatField
      FieldName = 'NUM_COMP_FISCAL'
      Origin = 'FACTURAS.NUM_COMP_FISCAL'
    end
    object qryFacturaMasterNCF_DGII: TIBStringField
      FieldName = 'NCF_DGII'
      Origin = 'FACTURAS.NCF_DGII'
    end
    object qryFacturaMasterMONTO_OFERTA: TFloatField
      FieldName = 'MONTO_OFERTA'
      Origin = 'FACTURAS.MONTO_OFERTA'
    end
    object qryFacturaMasterRNC_CTE: TIBStringField
      FieldName = 'RNC_CTE'
      Origin = 'CLIENTES.RNC'
      Size = 12
    end
    object qryFacturaMasterCEDULA_CTE: TIBStringField
      FieldName = 'CEDULA_CTE'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
  end
  object qryFacturaDet: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT FACTURAS.CODIGO_CTE,'
      '       FACTURAS.MONTO_FACT,'
      '       FACTURAS.FECHA FECHA_FACTURA,'
      '       FACTURAS.MONEDA,'
      '       FACTURAS.RCXC,'
      '       FACTURAS.STATUS,'
      '       FACTURAS.RCNT,'
      '       FACTURAS.NUMERO Numero_factura,'
      '       CONTRATO.FICHA_VEH,'
      '       CONTRATO.NUMERO numero_contrato,'
      '       CONTRATO.FECHA_SALIDA,'
      '       CONTRATO_CIERRE.FECHA FECHA_ENTRADA,'
      '       CONTRATO_CIERRE.CANTIDAD_DIAS,'
      '       CONTRATO.TARIFABASE,'
      '       CONTRATO_CIERRE.MONTO_ITBIS, TOTAL_CONSUMO,'
      
        '       (TOTAL_CONSUMO -  CONTRATO_CIERRE.MONTO_ITBIS) MONTO_SIN_' +
        'TBIS,'
      '       (TOTAL_CONSUMO - FACTURAS.MONTO_FACT) MONTO_ABONADO'
      'FROM CONTRATO_CIERRE'
      
        '   INNER JOIN FACTURAS ON (CONTRATO_CIERRE.NUMERO_FACTURA = FACT' +
        'URAS.NUMERO)'
      
        '   INNER JOIN CONTRATO ON (CONTRATO_CIERRE.NUMERO = CONTRATO.NUM' +
        'ERO)'
      'Where Facturas.Numero = :numero_factura')
    Left = 248
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero_factura'
        ParamType = ptInput
        Value = '6'
      end>
    object qryFacturaDetCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'FACTURAS.CODIGO_CTE'
    end
    object qryFacturaDetMONTO_FACT: TFloatField
      FieldName = 'MONTO_FACT'
      Origin = 'FACTURAS.MONTO_FACT'
    end
    object qryFacturaDetMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'FACTURAS.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryFacturaDetRCXC: TIBStringField
      FieldName = 'RCXC'
      Origin = 'FACTURAS.RCXC'
      FixedChar = True
      Size = 1
    end
    object qryFacturaDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FACTURAS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryFacturaDetRCNT: TIBStringField
      FieldName = 'RCNT'
      Origin = 'FACTURAS.RCNT'
      FixedChar = True
      Size = 1
    end
    object qryFacturaDetNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'FACTURAS.NUMERO'
      Required = True
    end
    object qryFacturaDetFICHA_VEH: TIntegerField
      FieldName = 'FICHA_VEH'
      Origin = 'CONTRATO.FICHA_VEH'
      Required = True
    end
    object qryFacturaDetNUMERO_CONTRATO: TIntegerField
      FieldName = 'NUMERO_CONTRATO'
      Origin = 'CONTRATO.NUMERO'
      Required = True
    end
    object qryFacturaDetFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'CONTRATO.FECHA_SALIDA'
    end
    object qryFacturaDetCANTIDAD_DIAS: TFloatField
      FieldName = 'CANTIDAD_DIAS'
      Origin = 'CONTRATO_CIERRE.CANTIDAD_DIAS'
    end
    object qryFacturaDetTARIFABASE: TFloatField
      FieldName = 'TARIFABASE'
      Origin = 'CONTRATO.TARIFABASE'
    end
    object qryFacturaDetMONTO_ITBIS: TFloatField
      FieldName = 'MONTO_ITBIS'
      Origin = 'CONTRATO_CIERRE.MONTO_ITBIS'
    end
    object qryFacturaDetFECHA_FACTURA: TDateTimeField
      FieldName = 'FECHA_FACTURA'
      Origin = 'FACTURAS.FECHA'
    end
    object qryFacturaDetFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'CONTRATO_CIERRE.FECHA'
      Required = True
    end
    object qryFacturaDetTOTAL_CONSUMO: TFloatField
      FieldName = 'TOTAL_CONSUMO'
      Origin = 'CONTRATO_CIERRE.TOTAL_CONSUMO'
    end
    object qryFacturaDetMONTO_SIN_TBIS: TFloatField
      FieldName = 'MONTO_SIN_TBIS'
    end
    object qryFacturaDetMONTO_ABONADO: TFloatField
      FieldName = 'MONTO_ABONADO'
    end
  end
  object qryFacturaDetNew: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT FACTURA_DET.SERIE,'
      '       FACTURA_DET.NUMERO_FACTURA,'
      '       FACTURA_DET.COD_CONCEPTO,'
      '       FACTURA_DET.TIPO_TARIFA,'
      '       FACTURA_DET.CANTIDAD,'
      '       FACTURA_DET.TARIFA,'
      '       FACTURA_DET.PORC_DESCUENTO,'
      '       FACTURA_DET.MONTO,'
      '       FACTURA_DET.ITBIS,'
      '       FACTURA_DET.STATUS,'
      '       FACTURA_DET.COD_USUARIO,'
      '       FACTURA_DET.FECHA_IN,'
      '       FACTURA_DET.INSERTADO_POR,'
      '       CONCEPTO_DETFACT.DESCRIPCION'
      'FROM CONCEPTO_DETFACT'
      
        '   INNER JOIN FACTURA_DET ON (CONCEPTO_DETFACT.COD_CONCEPTO = FA' +
        'CTURA_DET.COD_CONCEPTO)'
      'Where   FACTURA_DET.NUMERO_FACTURA = :numerofact')
    Left = 248
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerofact'
        ParamType = ptInput
      end>
  end
  object tblDgii_SerieNCF: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DGII_SERIE_NFC'
    Left = 248
    Top = 312
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
  object dstblDgii_SerieNCF: TDataSource
    DataSet = tblDgii_SerieNCF
    Left = 248
    Top = 360
  end
  object tblTipoCF: TIBTable
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_CF'
    Left = 48
    Top = 360
    object tblTipoCFTIPO_CF: TIBStringField
      FieldName = 'TIPO_CF'
      Size = 2
    end
    object tblTipoCFDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object dstblTipoCF: TDataSource
    DataSet = tblTipoCF
    Left = 104
    Top = 384
  end
  object ibQryViewNCF: TIBQuery
    Database = dmCon.IBDatabase1
    Transaction = dmCon.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from view_nfc')
    OnFilterRecord = ibQryViewNCFFilterRecord
    Left = 248
    Top = 408
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
  end
  object dsibQryViewNCF: TDataSource
    DataSet = ibQryViewNCF
    Left = 168
    Top = 408
  end
end
