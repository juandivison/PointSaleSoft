object dmcotizafiscal: Tdmcotizafiscal
  OldCreateOrder = False
  Left = 502
  Top = 164
  Height = 403
  Width = 567
  object qryDatosReimpDocFiscal: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryDatosReimpDocFiscalAfterScroll
    OnCalcFields = qryDatosReimpDocFiscalCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select m.fecha, m.numero,m.CODIGO_CTE,NULL NIF,NULL NUMERO_NCF ,'
      
        'M.TIPONCFIFISCAL tipo, M.MONTO_BRUTO TOTAL_BRUTO, M.MONTO_TOTAL_' +
        'ITBIS MONTO_ITBIS, m.monto_cambio,'
      'M.VALOR_TOTAL TOTAL_NETO, m.monto_descuento, '
      'm.monto_pagado, m.MONTO_TOTAL_ITBIS, m.*'
      'From COTIZACION_MAST m'
      'Where m.numero =:numerotrn'
      ''
      '')
    Left = 192
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerotrn'
        ParamType = ptInput
      end>
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
      Origin = 'COTIZACION_MAST.FECHA'
    end
    object qryDatosReimpDocFiscalNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'COTIZACION_MAST.NUMERO'
      Required = True
    end
    object qryDatosReimpDocFiscalCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'COTIZACION_MAST.CODIGO_CTE'
    end
    object qryDatosReimpDocFiscalNIF: TIBStringField
      FieldName = 'NIF'
      FixedChar = True
      Size = 1
    end
    object qryDatosReimpDocFiscalNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      FixedChar = True
      Size = 1
    end
    object qryDatosReimpDocFiscalTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'COTIZACION_MAST.TIPONCFIFISCAL'
    end
    object qryDatosReimpDocFiscalTOTAL_BRUTO: TFloatField
      FieldName = 'TOTAL_BRUTO'
      Origin = 'COTIZACION_MAST.MONTO_BRUTO'
    end
    object qryDatosReimpDocFiscalMONTO_ITBIS: TFloatField
      FieldName = 'MONTO_ITBIS'
      Origin = 'COTIZACION_MAST.MONTO_TOTAL_ITBIS'
    end
    object qryDatosReimpDocFiscalMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'COTIZACION_MAST.MONTO_CAMBIO'
    end
    object qryDatosReimpDocFiscalTOTAL_NETO: TFloatField
      FieldName = 'TOTAL_NETO'
      Origin = 'COTIZACION_MAST.VALOR_TOTAL'
    end
    object qryDatosReimpDocFiscalMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'COTIZACION_MAST.MONTO_DESCUENTO'
    end
    object qryDatosReimpDocFiscalMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'COTIZACION_MAST.MONTO_PAGADO'
    end
    object qryDatosReimpDocFiscalMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'COTIZACION_MAST.MONTO_TOTAL_ITBIS'
    end
    object qryDatosReimpDocFiscalNUMERO1: TIntegerField
      FieldName = 'NUMERO1'
      Origin = 'COTIZACION_MAST.NUMERO'
      Required = True
    end
    object qryDatosReimpDocFiscalFECHA1: TDateTimeField
      FieldName = 'FECHA1'
      Origin = 'COTIZACION_MAST.FECHA'
    end
    object qryDatosReimpDocFiscalCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'COTIZACION_MAST.CIA_KEY'
    end
    object qryDatosReimpDocFiscalFECHA_VENCE: TDateTimeField
      FieldName = 'FECHA_VENCE'
      Origin = 'COTIZACION_MAST.FECHA_VENCE'
    end
    object qryDatosReimpDocFiscalCODIGO_CTE1: TIntegerField
      FieldName = 'CODIGO_CTE1'
      Origin = 'COTIZACION_MAST.CODIGO_CTE'
    end
    object qryDatosReimpDocFiscalCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'COTIZACION_MAST.CODIGO_VENDEDOR'
    end
    object qryDatosReimpDocFiscalOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'COTIZACION_MAST.OBSERVACION'
      Size = 60
    end
    object qryDatosReimpDocFiscalMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'COTIZACION_MAST.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryDatosReimpDocFiscalVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'COTIZACION_MAST.VALOR_TOTAL'
    end
    object qryDatosReimpDocFiscalSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'COTIZACION_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosReimpDocFiscalFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'COTIZACION_MAST.FECHA_IN'
    end
    object qryDatosReimpDocFiscalIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'COTIZACION_MAST.IN_POR'
      Size = 12
    end
    object qryDatosReimpDocFiscalFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'COTIZACION_MAST.FECHA_MOD'
    end
    object qryDatosReimpDocFiscalMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'COTIZACION_MAST.MOD_POR'
      Size = 12
    end
    object qryDatosReimpDocFiscalNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'COTIZACION_MAST.NUMERO_FACTURA'
    end
    object qryDatosReimpDocFiscalNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'COTIZACION_MAST.NUMERO_DOC_PAGO'
    end
    object qryDatosReimpDocFiscalSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'COTIZACION_MAST.SERIE_NCF_ASIGNADO'
    end
    object qryDatosReimpDocFiscalMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'COTIZACION_MAST.MONTO_BRUTO'
    end
    object qryDatosReimpDocFiscalPORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'COTIZACION_MAST.PORC_DESCUENTO'
    end
    object qryDatosReimpDocFiscalMONTO_DESCUENTO1: TFloatField
      FieldName = 'MONTO_DESCUENTO1'
      Origin = 'COTIZACION_MAST.MONTO_DESCUENTO'
    end
    object qryDatosReimpDocFiscalMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'COTIZACION_MAST.MONTO_INICIAL'
    end
    object qryDatosReimpDocFiscalNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'COTIZACION_MAST.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
    object qryDatosReimpDocFiscalMONTO_PAGADO1: TFloatField
      FieldName = 'MONTO_PAGADO1'
      Origin = 'COTIZACION_MAST.MONTO_PAGADO'
    end
    object qryDatosReimpDocFiscalMONTO_CAMBIO1: TFloatField
      FieldName = 'MONTO_CAMBIO1'
      Origin = 'COTIZACION_MAST.MONTO_CAMBIO'
    end
    object qryDatosReimpDocFiscalMONTO_TOTAL_ITBIS1: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS1'
      Origin = 'COTIZACION_MAST.MONTO_TOTAL_ITBIS'
    end
    object qryDatosReimpDocFiscalMONTODESCGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCGASTOSADMIN'
      Origin = 'COTIZACION_MAST.MONTODESCGASTOSADMIN'
    end
    object qryDatosReimpDocFiscalMONTODESCITBISGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCITBISGASTOSADMIN'
      Origin = 'COTIZACION_MAST.MONTODESCITBISGASTOSADMIN'
    end
    object qryDatosReimpDocFiscalMONTODESCTRANSP: TFloatField
      FieldName = 'MONTODESCTRANSP'
      Origin = 'COTIZACION_MAST.MONTODESCTRANSP'
    end
    object qryDatosReimpDocFiscalMONTODESCDIRTECNICA: TFloatField
      FieldName = 'MONTODESCDIRTECNICA'
      Origin = 'COTIZACION_MAST.MONTODESCDIRTECNICA'
    end
    object qryDatosReimpDocFiscalMONTODESCITBISDIRTECNICA: TFloatField
      FieldName = 'MONTODESCITBISDIRTECNICA'
      Origin = 'COTIZACION_MAST.MONTODESCITBISDIRTECNICA'
    end
    object qryDatosReimpDocFiscalMONTODESCIMPREVISTO: TFloatField
      FieldName = 'MONTODESCIMPREVISTO'
      Origin = 'COTIZACION_MAST.MONTODESCIMPREVISTO'
    end
    object qryDatosReimpDocFiscalMONTODESCITBISIMPREVISTO: TFloatField
      FieldName = 'MONTODESCITBISIMPREVISTO'
      Origin = 'COTIZACION_MAST.MONTODESCITBISIMPREVISTO'
    end
    object qryDatosReimpDocFiscalTIPO_FACTURA: TSmallintField
      FieldName = 'TIPO_FACTURA'
      Origin = 'COTIZACION_MAST.TIPO_FACTURA'
    end
    object qryDatosReimpDocFiscalAPLICA_TIPODESC: TSmallintField
      FieldName = 'APLICA_TIPODESC'
      Origin = 'COTIZACION_MAST.APLICA_TIPODESC'
    end
    object qryDatosReimpDocFiscalCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'COTIZACION_MAST.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object qryDatosReimpDocFiscalREFERENCIACTE: TIBStringField
      FieldName = 'REFERENCIACTE'
      Origin = 'COTIZACION_MAST.REFERENCIACTE'
    end
    object qryDatosReimpDocFiscalMONTO_RECARGO: TFloatField
      FieldName = 'MONTO_RECARGO'
      Origin = 'COTIZACION_MAST.MONTO_RECARGO'
    end
    object qryDatosReimpDocFiscalTIPONCFIFISCAL: TIntegerField
      FieldName = 'TIPONCFIFISCAL'
      Origin = 'COTIZACION_MAST.TIPONCFIFISCAL'
    end
    object qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS: TFloatField
      FieldName = 'MONTO_EXONERADO_ITBIS'
      Origin = 'COTIZACION_MAST.MONTO_EXONERADO_ITBIS'
    end
  end
  object qryDatosReimpdocFiscalDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From VIEW_COTIZACION_DET'
      'Where numero =:numero'
      'Order By TIPO_VENTA')
    Left = 336
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryDatosReimpdocFiscalDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VIEW_COTIZACION_DET.SERIE'
    end
    object qryDatosReimpdocFiscalDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_COTIZACION_DET.NUMERO'
    end
    object qryDatosReimpdocFiscalDetCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VIEW_COTIZACION_DET.CODIGO_PROD'
      Size = 12
    end
    object qryDatosReimpdocFiscalDetCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VIEW_COTIZACION_DET.CODIGO_BARRA'
    end
    object qryDatosReimpdocFiscalDetDESCRIPCIONESPECIAL: TMemoField
      FieldName = 'DESCRIPCIONESPECIAL'
      Origin = 'VIEW_COTIZACION_DET.DESCRIPCIONESPECIAL'
      BlobType = ftMemo
      Size = 8
    end
    object qryDatosReimpdocFiscalDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VIEW_COTIZACION_DET.DESCRIPCION'
      Size = 80
    end
    object qryDatosReimpdocFiscalDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VIEW_COTIZACION_DET.CANTIDAD'
    end
    object qryDatosReimpdocFiscalDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VIEW_COTIZACION_DET.PRECIO'
    end
    object qryDatosReimpdocFiscalDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VIEW_COTIZACION_DET.PORC_DESC_DET'
    end
    object qryDatosReimpdocFiscalDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VIEW_COTIZACION_DET.ITBI_DET'
    end
    object qryDatosReimpdocFiscalDetVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VIEW_COTIZACION_DET.VALOR_SERVICIO_DET'
    end
    object qryDatosReimpdocFiscalDetVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VIEW_COTIZACION_DET.VALOR_TOTAL_DET'
    end
    object qryDatosReimpdocFiscalDetSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VIEW_COTIZACION_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryDatosReimpdocFiscalDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VIEW_COTIZACION_DET.FECHA_IN'
    end
    object qryDatosReimpdocFiscalDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VIEW_COTIZACION_DET.IN_POR'
      Size = 12
    end
    object qryDatosReimpdocFiscalDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VIEW_COTIZACION_DET.FECHA_MOD'
    end
    object qryDatosReimpdocFiscalDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VIEW_COTIZACION_DET.MOD_POR'
      Size = 12
    end
    object qryDatosReimpdocFiscalDetCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VIEW_COTIZACION_DET.CANT_REGRESO'
    end
    object qryDatosReimpdocFiscalDetCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VIEW_COTIZACION_DET.CANT_PROMO'
    end
    object qryDatosReimpdocFiscalDetMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VIEW_COTIZACION_DET.MONTO_DIETA'
    end
    object qryDatosReimpdocFiscalDetMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VIEW_COTIZACION_DET.MONTO_AJUSTE'
    end
    object qryDatosReimpdocFiscalDetSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VIEW_COTIZACION_DET.SERIE_PROD'
      Size = 50
    end
    object qryDatosReimpdocFiscalDetSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VIEW_COTIZACION_DET.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryDatosReimpdocFiscalDetTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VIEW_COTIZACION_DET.TIPO_UNIDAD'
    end
    object qryDatosReimpdocFiscalDetITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VIEW_COTIZACION_DET.ITBIS_EXENTO'
    end
    object qryDatosReimpdocFiscalDetTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VIEW_COTIZACION_DET.TIPO_VENTA'
    end
    object qryDatosReimpdocFiscalDetDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VIEW_COTIZACION_DET.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryDatosReimpdocFiscalDetPORC_DESC_ITEM: TFloatField
      FieldName = 'PORC_DESC_ITEM'
      Origin = 'VIEW_COTIZACION_DET.PORC_DESC_ITEM'
    end
    object qryDatosReimpdocFiscalDetMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VIEW_COTIZACION_DET.MONTO_DESC_ITEM'
    end
  end
  object qryDatosCotizaMaster: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryDatosCotizaMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  * From VIEW_COTIZACION_MASTER '
      'Where numero =:numero')
    Left = 344
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryDatosCotizaMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_COTIZACION_MASTER.NUMERO'
    end
    object qryDatosCotizaMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VIEW_COTIZACION_MASTER.FECHA'
    end
    object qryDatosCotizaMasterCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VIEW_COTIZACION_MASTER.CIA_KEY'
    end
    object qryDatosCotizaMasterFECHA_VENCE: TDateTimeField
      FieldName = 'FECHA_VENCE'
      Origin = 'VIEW_COTIZACION_MASTER.FECHA_VENCE'
    end
    object qryDatosCotizaMasterCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'VIEW_COTIZACION_MASTER.CODIGO_CTE'
    end
    object qryDatosCotizaMasterCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VIEW_COTIZACION_MASTER.CODIGO_VENDEDOR'
    end
    object qryDatosCotizaMasterOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VIEW_COTIZACION_MASTER.OBSERVACION'
      Size = 60
    end
    object qryDatosCotizaMasterMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VIEW_COTIZACION_MASTER.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryDatosCotizaMasterVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VIEW_COTIZACION_MASTER.VALOR_TOTAL'
    end
    object qryDatosCotizaMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VIEW_COTIZACION_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosCotizaMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VIEW_COTIZACION_MASTER.FECHA_IN'
    end
    object qryDatosCotizaMasterIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VIEW_COTIZACION_MASTER.IN_POR'
      Size = 12
    end
    object qryDatosCotizaMasterFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VIEW_COTIZACION_MASTER.FECHA_MOD'
    end
    object qryDatosCotizaMasterMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VIEW_COTIZACION_MASTER.MOD_POR'
      Size = 12
    end
    object qryDatosCotizaMasterNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VIEW_COTIZACION_MASTER.NUMERO_FACTURA'
    end
    object qryDatosCotizaMasterNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VIEW_COTIZACION_MASTER.NUMERO_DOC_PAGO'
    end
    object qryDatosCotizaMasterSERIE_NCF_ASIGNADO: TIntegerField
      FieldName = 'SERIE_NCF_ASIGNADO'
      Origin = 'VIEW_COTIZACION_MASTER.SERIE_NCF_ASIGNADO'
    end
    object qryDatosCotizaMasterMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      Origin = 'VIEW_COTIZACION_MASTER.MONTO_BRUTO'
    end
    object qryDatosCotizaMasterPORC_DESCUENTO: TIntegerField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VIEW_COTIZACION_MASTER.PORC_DESCUENTO'
    end
    object qryDatosCotizaMasterMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VIEW_COTIZACION_MASTER.MONTO_DESCUENTO'
    end
    object qryDatosCotizaMasterMONTO_INICIAL: TFloatField
      FieldName = 'MONTO_INICIAL'
      Origin = 'VIEW_COTIZACION_MASTER.MONTO_INICIAL'
    end
    object qryDatosCotizaMasterNOMBRE_CLIENTE_GENERAL: TIBStringField
      FieldName = 'NOMBRE_CLIENTE_GENERAL'
      Origin = 'VIEW_COTIZACION_MASTER.NOMBRE_CLIENTE_GENERAL'
      Size = 60
    end
    object qryDatosCotizaMasterMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VIEW_COTIZACION_MASTER.MONTO_PAGADO'
    end
    object qryDatosCotizaMasterMONTO_CAMBIO: TFloatField
      FieldName = 'MONTO_CAMBIO'
      Origin = 'VIEW_COTIZACION_MASTER.MONTO_CAMBIO'
    end
    object qryDatosCotizaMasterMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'VIEW_COTIZACION_MASTER.MONTO_TOTAL_ITBIS'
    end
    object qryDatosCotizaMasterMONTODESCGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCGASTOSADMIN'
      Origin = 'VIEW_COTIZACION_MASTER.MONTODESCGASTOSADMIN'
    end
    object qryDatosCotizaMasterMONTODESCITBISGASTOSADMIN: TFloatField
      FieldName = 'MONTODESCITBISGASTOSADMIN'
      Origin = 'VIEW_COTIZACION_MASTER.MONTODESCITBISGASTOSADMIN'
    end
    object qryDatosCotizaMasterMONTODESCTRANSP: TFloatField
      FieldName = 'MONTODESCTRANSP'
      Origin = 'VIEW_COTIZACION_MASTER.MONTODESCTRANSP'
    end
    object qryDatosCotizaMasterMONTODESCDIRTECNICA: TFloatField
      FieldName = 'MONTODESCDIRTECNICA'
      Origin = 'VIEW_COTIZACION_MASTER.MONTODESCDIRTECNICA'
    end
    object qryDatosCotizaMasterMONTODESCITBISDIRTECNICA: TFloatField
      FieldName = 'MONTODESCITBISDIRTECNICA'
      Origin = 'VIEW_COTIZACION_MASTER.MONTODESCITBISDIRTECNICA'
    end
    object qryDatosCotizaMasterMONTODESCIMPREVISTO: TFloatField
      FieldName = 'MONTODESCIMPREVISTO'
      Origin = 'VIEW_COTIZACION_MASTER.MONTODESCIMPREVISTO'
    end
    object qryDatosCotizaMasterMONTODESCITBISIMPREVISTO: TFloatField
      FieldName = 'MONTODESCITBISIMPREVISTO'
      Origin = 'VIEW_COTIZACION_MASTER.MONTODESCITBISIMPREVISTO'
    end
    object qryDatosCotizaMasterTIPO_FACTURA: TSmallintField
      FieldName = 'TIPO_FACTURA'
      Origin = 'VIEW_COTIZACION_MASTER.TIPO_FACTURA'
    end
    object qryDatosCotizaMasterAPLICA_TIPODESC: TSmallintField
      FieldName = 'APLICA_TIPODESC'
      Origin = 'VIEW_COTIZACION_MASTER.APLICA_TIPODESC'
    end
    object qryDatosCotizaMasterCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'VIEW_COTIZACION_MASTER.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object qryDatosCotizaMasterREFERENCIACTE: TIBStringField
      FieldName = 'REFERENCIACTE'
      Origin = 'VIEW_COTIZACION_MASTER.REFERENCIACTE'
    end
    object qryDatosCotizaMasterMONTO_RECARGO: TFloatField
      FieldName = 'MONTO_RECARGO'
      Origin = 'VIEW_COTIZACION_MASTER.MONTO_RECARGO'
    end
    object qryDatosCotizaMasterTIPONCFIFISCAL: TIntegerField
      FieldName = 'TIPONCFIFISCAL'
      Origin = 'VIEW_COTIZACION_MASTER.TIPONCFIFISCAL'
    end
    object qryDatosCotizaMasterMONTO_EXONERADO_ITBIS: TFloatField
      FieldName = 'MONTO_EXONERADO_ITBIS'
      Origin = 'VIEW_COTIZACION_MASTER.MONTO_EXONERADO_ITBIS'
    end
    object qryDatosCotizaMasterPORCPROPINALEGAL: TFloatField
      FieldName = 'PORCPROPINALEGAL'
      Origin = 'VIEW_COTIZACION_MASTER.PORCPROPINALEGAL'
    end
    object qryDatosCotizaMasterPROPINA: TFloatField
      FieldName = 'PROPINA'
      Origin = 'VIEW_COTIZACION_MASTER.PROPINA'
    end
    object qryDatosCotizaMasterPROPINALEGAL: TFloatField
      FieldName = 'PROPINALEGAL'
      Origin = 'VIEW_COTIZACION_MASTER.PROPINALEGAL'
    end
  end
  object qryDatosCotizaDetalle: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From VIEW_COTIZACION_DET'
      'Where numero =:numero'
      'Order By TIPO_VENTA')
    Left = 344
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryDatosCotizaDetalleSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VIEW_COTIZACION_DET.SERIE'
    end
    object qryDatosCotizaDetalleNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_COTIZACION_DET.NUMERO'
    end
    object qryDatosCotizaDetalleCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VIEW_COTIZACION_DET.CODIGO_PROD'
      Size = 12
    end
    object qryDatosCotizaDetalleCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VIEW_COTIZACION_DET.CODIGO_BARRA'
    end
    object qryDatosCotizaDetalleDESCRIPCIONESPECIAL: TMemoField
      FieldName = 'DESCRIPCIONESPECIAL'
      Origin = 'VIEW_COTIZACION_DET.DESCRIPCIONESPECIAL'
      BlobType = ftMemo
      Size = 8
    end
    object qryDatosCotizaDetalleDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VIEW_COTIZACION_DET.DESCRIPCION'
      Size = 80
    end
    object qryDatosCotizaDetalleCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VIEW_COTIZACION_DET.CANTIDAD'
    end
    object qryDatosCotizaDetallePRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VIEW_COTIZACION_DET.PRECIO'
    end
    object qryDatosCotizaDetallePORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VIEW_COTIZACION_DET.PORC_DESC_DET'
    end
    object qryDatosCotizaDetalleITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VIEW_COTIZACION_DET.ITBI_DET'
    end
    object qryDatosCotizaDetalleVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VIEW_COTIZACION_DET.VALOR_SERVICIO_DET'
    end
    object qryDatosCotizaDetalleVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VIEW_COTIZACION_DET.VALOR_TOTAL_DET'
    end
    object qryDatosCotizaDetalleSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VIEW_COTIZACION_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryDatosCotizaDetalleFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VIEW_COTIZACION_DET.FECHA_IN'
    end
    object qryDatosCotizaDetalleIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VIEW_COTIZACION_DET.IN_POR'
      Size = 12
    end
    object qryDatosCotizaDetalleFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VIEW_COTIZACION_DET.FECHA_MOD'
    end
    object qryDatosCotizaDetalleMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VIEW_COTIZACION_DET.MOD_POR'
      Size = 12
    end
    object qryDatosCotizaDetalleCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VIEW_COTIZACION_DET.CANT_REGRESO'
    end
    object qryDatosCotizaDetalleCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VIEW_COTIZACION_DET.CANT_PROMO'
    end
    object qryDatosCotizaDetalleMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VIEW_COTIZACION_DET.MONTO_DIETA'
    end
    object qryDatosCotizaDetalleMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VIEW_COTIZACION_DET.MONTO_AJUSTE'
    end
    object qryDatosCotizaDetalleSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VIEW_COTIZACION_DET.SERIE_PROD'
      Size = 50
    end
    object qryDatosCotizaDetalleSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VIEW_COTIZACION_DET.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryDatosCotizaDetalleTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VIEW_COTIZACION_DET.TIPO_UNIDAD'
    end
    object qryDatosCotizaDetalleITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VIEW_COTIZACION_DET.ITBIS_EXENTO'
    end
    object qryDatosCotizaDetalleTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VIEW_COTIZACION_DET.TIPO_VENTA'
    end
    object qryDatosCotizaDetalleDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VIEW_COTIZACION_DET.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryDatosCotizaDetallePORC_DESC_ITEM: TFloatField
      FieldName = 'PORC_DESC_ITEM'
      Origin = 'VIEW_COTIZACION_DET.PORC_DESC_ITEM'
    end
    object qryDatosCotizaDetalleMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VIEW_COTIZACION_DET.MONTO_DESC_ITEM'
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
      '       C.CIUDAD,'
      '       C.CODIGO_AGENCIA'
      'FROM CLIENTES C'
      '   LEFT OUTER JOIN TIPO_CLIENTE T ON (C.TIPO_CLIENTE = T.CODIGO)'
      'ORDER BY c.codigo_cte')
    Left = 168
    Top = 182
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
  end
  object qryDescLineas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From LINEA_DESCCOTIZACION'
      'Where idlinea =:idlinea'
      'order by item'
      '')
    Left = 160
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idlinea'
        ParamType = ptUnknown
      end>
    object qryDescLineasIDLINEA: TIntegerField
      FieldName = 'IDLINEA'
      Origin = 'LINEA_DESCCOTIZACION.IDLINEA'
      Required = True
    end
    object qryDescLineasITEM: TIntegerField
      FieldName = 'ITEM'
      Origin = 'LINEA_DESCCOTIZACION.ITEM'
      Required = True
    end
    object qryDescLineasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'LINEA_DESCCOTIZACION.DESCRIPCION'
      Size = 50
    end
    object qryDescLineasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'LINEA_DESCCOTIZACION.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object tblctrlImpCotizaFiscal: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from FISCALSTATUS_COTIZA'
      'where'
      '  NUMERO_TRN = :OLD_NUMERO_TRN')
    InsertSQL.Strings = (
      'insert into FISCALSTATUS_COTIZA'
      '  (NUMERO_TRN, ACTIVO, FECHA, IMPRIMIENDO)'
      'values'
      '  (:NUMERO_TRN, :ACTIVO, :FECHA, :IMPRIMIENDO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_TRN,'
      '  ACTIVO,'
      '  FECHA,'
      '  IMPRIMIENDO'
      'from FISCALSTATUS_COTIZA '
      'where'
      '  NUMERO_TRN = :NUMERO_TRN')
    SelectSQL.Strings = (
      'Select * From FISCALSTATUS_COTIZA'
      'Where numero_trn =:numero')
    ModifySQL.Strings = (
      'update FISCALSTATUS_COTIZA'
      'set'
      '  NUMERO_TRN = :NUMERO_TRN,'
      '  ACTIVO = :ACTIVO,'
      '  FECHA = :FECHA,'
      '  IMPRIMIENDO = :IMPRIMIENDO'
      'where'
      '  NUMERO_TRN = :OLD_NUMERO_TRN')
    Left = 168
    Top = 240
    object tblctrlImpCotizaFiscalNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'FISCALSTATUS_COTIZA.NUMERO_TRN'
      Required = True
    end
    object tblctrlImpCotizaFiscalACTIVO: TSmallintField
      FieldName = 'ACTIVO'
      Origin = 'FISCALSTATUS_COTIZA.ACTIVO'
    end
    object tblctrlImpCotizaFiscalFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FISCALSTATUS_COTIZA.FECHA'
      Required = True
    end
    object tblctrlImpCotizaFiscalIMPRIMIENDO: TSmallintField
      FieldName = 'IMPRIMIENDO'
      Origin = 'FISCALSTATUS_COTIZA.IMPRIMIENDO'
    end
  end
  object tblctrlImpNVtaFiscal: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from FISCALSTATUS_NVta'
      'where'
      '  NUMERO_TRN = :OLD_NUMERO_TRN')
    InsertSQL.Strings = (
      'insert into FISCALSTATUS_NVta'
      '  (NUMERO_TRN, ACTIVO, FECHA, IMPRIMIENDO)'
      'values'
      '  (:NUMERO_TRN, :ACTIVO, :FECHA, :IMPRIMIENDO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_TRN,'
      '  ACTIVO,'
      '  FECHA,'
      '  IMPRIMIENDO'
      'from FISCALSTATUS_NVta '
      'where'
      '  NUMERO_TRN = :NUMERO_TRN')
    SelectSQL.Strings = (
      'Select * From FISCALSTATUS_NVta'
      'Where numero_trn =:numero')
    ModifySQL.Strings = (
      'update FISCALSTATUS_NVta'
      'set'
      '  NUMERO_TRN = :NUMERO_TRN,'
      '  ACTIVO = :ACTIVO,'
      '  FECHA = :FECHA,'
      '  IMPRIMIENDO = :IMPRIMIENDO'
      'where'
      '  NUMERO_TRN = :OLD_NUMERO_TRN')
    Left = 336
    Top = 240
    object tblctrlImpNVtaFiscalNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'FISCALSTATUS_NVTA.NUMERO_TRN'
      Required = True
    end
    object tblctrlImpNVtaFiscalACTIVO: TSmallintField
      FieldName = 'ACTIVO'
      Origin = 'FISCALSTATUS_NVTA.ACTIVO'
    end
    object tblctrlImpNVtaFiscalFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'FISCALSTATUS_NVTA.FECHA'
      Required = True
    end
    object tblctrlImpNVtaFiscalIMPRIMIENDO: TSmallintField
      FieldName = 'IMPRIMIENDO'
      Origin = 'FISCALSTATUS_NVTA.IMPRIMIENDO'
    end
  end
  object qryLComentarioCot: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from LCOMENTARIO_COT'
      'where numero_trn =:num'
      'and tipo_ope=:tipo')
    Left = 424
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'num'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo'
        ParamType = ptInput
      end>
    object qryLComentarioCotID: TSmallintField
      FieldName = 'ID'
      Origin = 'LCOMENTARIO_COT.ID'
      Required = True
    end
    object qryLComentarioCotNUMLIN: TSmallintField
      FieldName = 'NUMLIN'
      Origin = 'LCOMENTARIO_COT.NUMLIN'
      Required = True
    end
    object qryLComentarioCotNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'LCOMENTARIO_COT.NUMERO_TRN'
      Required = True
    end
    object qryLComentarioCotLINEA: TIBStringField
      FieldName = 'LINEA'
      Origin = 'LCOMENTARIO_COT.LINEA'
      Size = 40
    end
    object qryLComentarioCotTIPO_OPE: TSmallintField
      FieldName = 'TIPO_OPE'
      Origin = 'LCOMENTARIO_COT.TIPO_OPE'
    end
  end
  object tblLineaComentario: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from LCOMENTARIO_cot'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into LCOMENTARIO_cot'
      '  (ID, NUMLIN, NUMERO_TRN, LINEA, TIPO_OPE)'
      'values'
      '  (:ID, :NUMLIN, :NUMERO_TRN, :LINEA, :TIPO_OPE)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NUMLIN,'
      '  NUMERO_TRN,'
      '  LINEA,'
      '  TIPO_OPE'
      'from LCOMENTARIO_cot '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *  From LCOMENTARIO_cot'
      'where numero_trn =:numerotrn')
    ModifySQL.Strings = (
      'update LCOMENTARIO_cot'
      'set'
      '  ID = :ID,'
      '  NUMLIN = :NUMLIN,'
      '  NUMERO_TRN = :NUMERO_TRN,'
      '  LINEA = :LINEA,'
      '  TIPO_OPE = :TIPO_OPE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_LCOMENTARIO_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 240
    Top = 24
    object tblLineaComentarioID: TSmallintField
      FieldName = 'ID'
      Origin = 'LCOMENTARIO_COT.ID'
      Required = True
    end
    object tblLineaComentarioNUMLIN: TSmallintField
      FieldName = 'NUMLIN'
      Origin = 'LCOMENTARIO_COT.NUMLIN'
      Required = True
    end
    object tblLineaComentarioNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'LCOMENTARIO_COT.NUMERO_TRN'
      Required = True
    end
    object tblLineaComentarioLINEA: TIBStringField
      FieldName = 'LINEA'
      Origin = 'LCOMENTARIO_COT.LINEA'
      Size = 40
    end
    object tblLineaComentarioTIPO_OPE: TSmallintField
      FieldName = 'TIPO_OPE'
      Origin = 'LCOMENTARIO_COT.TIPO_OPE'
    end
  end
  object ibsqlUpdLcomentarioCoti: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      
        'Insert into LCOMENTARIO_COT(ID, NUMLIN, NUMERO_TRN, LINEA, TIPO_' +
        'OPE)'
      'SELECT a.ID, a.NUMLIN, a.NUMERO_TRN, a.LINEA, 2'
      'FROM LCOMENTARIO a'
      'Where numero_trn =:numerotrn')
    Transaction = dmConectar.IBTransaction1
    Left = 64
    Top = 104
  end
end
