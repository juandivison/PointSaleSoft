object frmProcPagoCxc: TfrmProcPagoCxc
  Left = 833
  Top = 169
  Width = 538
  Height = 458
  Caption = 'Procesar Pagos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object stpactfctingresos: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_ACT_FCTINGRESOS'
    Left = 44
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SERIE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_FACT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_FACT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_SERVICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_DOC'
        ParamType = ptInput
      end>
  end
  object stp_UpdateCxc: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_UPDATECXC'
    Left = 48
    Top = 98
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
        Name = 'MONTO_PAGADO'
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
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE_IN'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHATRN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMEROTRN_CXC'
        ParamType = ptInput
      end>
  end
  object ibstpProcInsCxcHist: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'Proc_hist_blc_cxc_recibo'
    Left = 166
    Top = 170
    ParamData = <
      item
        DataType = ftFloat
        Name = 'BALANCE_ACTUAL'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_RECIBO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODMONEDA'
        ParamType = ptInput
      end>
  end
  object rxFormaPago: TRxMemoryData
    FieldDefs = <
      item
        Name = 'formaPago'
        DataType = ftSmallint
      end
      item
        Name = 'NumeroDocumento'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NumeroTarjeta'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TipoTarjeta'
        DataType = ftSmallint
      end
      item
        Name = 'ProveedorTarjeta'
        DataType = ftSmallint
      end
      item
        Name = 'NumeroAutorizacion'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Mes'
        DataType = ftSmallint
      end
      item
        Name = 'Anio'
        DataType = ftSmallint
      end
      item
        Name = 'MONTOAUTORIZADO'
        DataType = ftFloat
      end>
    Left = 168
    Top = 106
    object rxFormaPagoformaPago: TSmallintField
      FieldName = 'FormaPago'
    end
    object rxFormaPagoNumeroDocumento: TStringField
      FieldName = 'NumeroDocumento'
    end
    object rxFormaPagoNumeroTarjeta: TStringField
      FieldName = 'NumeroTarjeta'
    end
    object rxFormaPagoTipoTarjeta: TSmallintField
      FieldName = 'TipoTarjeta'
    end
    object rxFormaPagoProveedorTarjeta: TSmallintField
      FieldName = 'ProveedorTarjeta'
    end
    object rxFormaPagoNumeroAutorizacion: TStringField
      FieldName = 'NumeroAutorizacion'
    end
    object rxFormaPagoMes: TSmallintField
      FieldName = 'Mes'
    end
    object rxFormaPagoAnio: TSmallintField
      FieldName = 'Anio'
    end
    object rxFormaPagoMONTOAUTORIZADO: TFloatField
      FieldName = 'MONTOAUTORIZADO'
      DisplayFormat = ',0.00'
    end
  end
  object ibsqlLastNum: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'select max(numero) numeromax from ingresos')
    Transaction = dmConectar.IBTransaction1
    Left = 40
    Top = 162
  end
  object rxFacturaACobrar: TRxMemoryData
    FieldDefs = <
      item
        Name = 'CodCte'
        DataType = ftInteger
      end
      item
        Name = 'NumFactura'
        DataType = ftInteger
      end
      item
        Name = 'MontoAbonado'
        DataType = ftFloat
      end
      item
        Name = 'TipoCobro'
        DataType = ftSmallint
      end
      item
        Name = 'TipoFactPend'
        DataType = ftInteger
      end
      item
        Name = 'formaPago'
        DataType = ftInteger
      end
      item
        Name = 'Concepto'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'NombreCliente'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'MontoNCRAplicado'
        DataType = ftCurrency
      end
      item
        Name = 'MontoFactura'
        DataType = ftCurrency
      end
      item
        Name = 'ConceptoCxc'
        DataType = ftString
        Size = 60
      end>
    Left = 168
    Top = 42
    object rxFacturaACobrarCodCte: TIntegerField
      FieldName = 'CodCte'
    end
    object rxFacturaACobrarNumFactura: TIntegerField
      FieldName = 'NumFactura'
    end
    object rxFacturaACobrarMontoAbonado: TFloatField
      FieldName = 'MontoAbonado'
      DisplayFormat = ',0.00'
    end
    object rxFacturaACobrarTipoCobro: TSmallintField
      FieldName = 'TipoCobro'
    end
    object rxFacturaACobrarTipoFactPend: TIntegerField
      FieldName = 'TipoFactPend'
    end
    object rxFacturaACobrarformaPago: TIntegerField
      FieldName = 'formaPago'
    end
    object rxFacturaACobrarConcepto: TStringField
      DisplayWidth = 80
      FieldName = 'Concepto'
      Size = 80
    end
    object rxFacturaACobrarNombreCliente: TStringField
      FieldName = 'NombreCliente'
      Size = 40
    end
    object rxFacturaACobrarMontoNCRAplicado: TCurrencyField
      FieldName = 'MontoNCRAplicado'
    end
    object rxFacturaACobrarMontoFactura: TCurrencyField
      FieldName = 'MontoFactura'
    end
    object rxFacturaACobrarConceptoCxc: TStringField
      FieldName = 'ConceptoCxc'
      Size = 60
    end
  end
  object dsrxFacturaACobrar: TDataSource
    DataSet = rxFacturaACobrar
    Left = 43
    Top = 233
  end
  object qryFactPendiente: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select distinct '
      
        't.NUMPOL, c.codigo_cte, m.fecha, c.nombre_cte, nombre_facturar ,' +
        'f.*, '
      
        'iif(m.FECHA_VENCE < '#39'today'#39', iif(m.PORC_ATRASOCXC > 0,(f.MONTO_P' +
        'ENDIENTE * m.PORC_ATRASOCXC /100),0),0) MontoPenalidadCxc,'
      't.CONCEPTO  '
      'From FACTURAS_PENDIENTES f'
      'inner join facturas m on m.NUMERO = f.NUMERO_FACT'
      'inner join  clientes c on c.CODIGO_CTE = m.CODIGO_CTE'
      'left join TRANS_CXC t on t.NUMERO_DOC = f.NUMERO_FACT'
      'Where '
      'f.Status in ('#39'A'#39')'
      'And t.TIPO_TRANF = 1 '
      'And m.codigo_cte =:codigocte'
      'And f.NUMERO_FACT=:numfct'
      'And (MONTO_PENDIENTE > 0.50)'
      'Order By c.codigo_cte, f.NUMERO_FACT')
    Left = 168
    Top = 234
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigocte'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'numfct'
        ParamType = ptInput
      end>
    object qryFactPendienteCODIGO_CTE: TIntegerField
      DisplayLabel = 'CodCte'
      DisplayWidth = 10
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryFactPendienteFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      DisplayWidth = 14
      FieldName = 'FECHA'
      Origin = 'FACTURAS.FECHA'
    end
    object qryFactPendienteNUMPOL: TIntegerField
      FieldName = 'NUMPOL'
      Origin = 'TRANS_CXC.NUMPOL'
    end
    object qryFactPendienteNOMBRE_CTE: TIBStringField
      DisplayLabel = 'Nombre Cte'
      DisplayWidth = 35
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryFactPendienteNOMBRE_FACTURAR: TIBStringField
      DisplayLabel = 'Nombre Facturar'
      DisplayWidth = 30
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryFactPendienteTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      DisplayWidth = 6
      FieldName = 'TIPO'
      Origin = 'FACTURAS_PENDIENTES.TIPO'
      Required = True
    end
    object qryFactPendienteMONEDA: TIBStringField
      DisplayLabel = 'Moneda'
      DisplayWidth = 10
      FieldName = 'MONEDA'
      Origin = 'FACTURAS_PENDIENTES.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryFactPendienteNUMERO_FACT: TIntegerField
      DisplayLabel = '# Factura'
      DisplayWidth = 11
      FieldName = 'NUMERO_FACT'
      Origin = 'FACTURAS_PENDIENTES.NUMERO_FACT'
      Required = True
    end
    object qryFactPendienteMONTO_PENDIENTE: TFloatField
      DisplayLabel = 'Monto Pendiente'
      DisplayWidth = 21
      FieldName = 'MONTO_PENDIENTE'
      Origin = 'FACTURAS_PENDIENTES.MONTO_PENDIENTE'
      DisplayFormat = ',0.00'
    end
    object qryFactPendienteSTATUS: TIBStringField
      DisplayLabel = 'Status'
      DisplayWidth = 7
      FieldName = 'STATUS'
      Origin = 'FACTURAS_PENDIENTES.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryFactPendienteCONCEPTO: TIBStringField
      FieldName = 'CONCEPTO'
      Origin = 'TRANS_CXC.CONCEPTO'
      Size = 60
    end
    object qryFactPendienteNUMERO_TRN_VTA: TIntegerField
      FieldName = 'NUMERO_TRN_VTA'
      Origin = 'FACTURAS_PENDIENTES.NUMERO_TRN_VTA'
    end
    object qryFactPendienteMONTOPENALIDADCXC: TFloatField
      FieldName = 'MONTOPENALIDADCXC'
      DisplayFormat = ',0.00'
    end
  end
end
