object dmFinanzas: TdmFinanzas
  OldCreateOrder = False
  Left = 671
  Top = 340
  Height = 260
  Width = 340
  object qryRep607: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select GRUPONCF, TIPO_IDENT, TIPODEINGRESO, TIPODOC, CODIGO_CTE,' +
        ' NOMBRE_CTE, '
      'FECHA, MONEDA,  RNC_NUMERO, CEDULA, '
      'DESC_NCF, FORMA_PAGO, '
      'sum(VALOR_TOTAL_DET) VALOR_TOTAL_DET, '
      '    sum(ITBI_DET)ITBI_DET , '
      '    sum(distinct ITBI_EXONERADO) ITBI_EXONERADO, '
      '    sum(VALOR_BASE) VALOR_BASE, '
      '    sum(distinct MONTO_DESCUENTO) MONTO_DESCUENTO, '
      '    sum(distinct MONTO_RECARGO) MONTO_RECARGO, '
      '    sum(MONTOIBISRECARGO) MONTOIBISRECARGO, '
      '    sum(MONTOBASEEXENTO) MONTOBASEEXENTO, '
      '    sum(MONTOGRAVADO) MONTOGRAVADO,     '
      '    sum(ITBIS_8PORCIENTO) ITBIS_8PORCIENTO, '
      '    sum(ITBIS_11PORCIENTO) ITBIS_11PORCIENTO, '
      '    sum(ITBIS_13PORCIENTO) ITBIS_13PORCIENTO, '
      '    sum(ITBIS_16PORCIENTO) ITBIS_16PORCIENTO, '
      '    sum(ITBIS_18PORCIENTO) ITBIS_18PORCIENTO, '
      '    sum(OTROPORCIENTOITBIS) OTROPORCIENTOITBIS, '
      '    sum(DISTINCT MONTO_PROPINA_LEGAL) MONTO_PROPINA_LEGAL'
      'From PROC_REP_TBIS_grp ('
      '    :fechaini,'
      '    :fechafin,'
      '    :moneda)'
      'group by '
      
        'GRUPONCF, TIPO_IDENT, TIPODEINGRESO, TIPODOC, CODIGO_CTE, NOMBRE' +
        '_CTE, FECHA, MONEDA,  RNC_NUMERO, CEDULA, '
      'DESC_NCF, FORMA_PAGO    '
      '    '
      ''
      '    '
      '    '
      ''
      ''
      ''
      '')
    Left = 120
    Top = 32
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
      end
      item
        DataType = ftUnknown
        Name = 'moneda'
        ParamType = ptUnknown
      end>
    object qryRep607GRUPONCF: TIBStringField
      FieldName = 'GRUPONCF'
      Origin = 'PROC_REP_TBIS_GRP.GRUPONCF'
      Size = 30
    end
    object qryRep607TIPO_IDENT: TSmallintField
      FieldName = 'TIPO_IDENT'
      Origin = 'PROC_REP_TBIS_GRP.TIPO_IDENT'
    end
    object qryRep607TIPODEINGRESO: TSmallintField
      FieldName = 'TIPODEINGRESO'
      Origin = 'PROC_REP_TBIS_GRP.TIPODEINGRESO'
    end
    object qryRep607TIPODOC: TIBStringField
      FieldName = 'TIPODOC'
      Origin = 'PROC_REP_TBIS_GRP.TIPODOC'
    end
    object qryRep607CODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROC_REP_TBIS_GRP.CODIGO_CTE'
    end
    object qryRep607NOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'PROC_REP_TBIS_GRP.NOMBRE_CTE'
      Size = 80
    end
    object qryRep607FECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_REP_TBIS_GRP.FECHA'
    end
    object qryRep607MONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'PROC_REP_TBIS_GRP.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryRep607RNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'PROC_REP_TBIS_GRP.RNC_NUMERO'
    end
    object qryRep607CEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'PROC_REP_TBIS_GRP.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryRep607DESC_NCF: TIBStringField
      FieldName = 'DESC_NCF'
      Origin = 'PROC_REP_TBIS_GRP.DESC_NCF'
      Size = 80
    end
    object qryRep607FORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'PROC_REP_TBIS_GRP.FORMA_PAGO'
    end
    object qryRep607VALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
    end
    object qryRep607ITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
    end
    object qryRep607ITBI_EXONERADO: TFloatField
      FieldName = 'ITBI_EXONERADO'
    end
    object qryRep607VALOR_BASE: TFloatField
      FieldName = 'VALOR_BASE'
    end
    object qryRep607MONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
    end
    object qryRep607MONTO_RECARGO: TFloatField
      FieldName = 'MONTO_RECARGO'
    end
    object qryRep607MONTOIBISRECARGO: TFloatField
      FieldName = 'MONTOIBISRECARGO'
    end
    object qryRep607MONTOBASEEXENTO: TFloatField
      FieldName = 'MONTOBASEEXENTO'
    end
    object qryRep607MONTOGRAVADO: TFloatField
      FieldName = 'MONTOGRAVADO'
    end
    object qryRep607ITBIS_8PORCIENTO: TFloatField
      FieldName = 'ITBIS_8PORCIENTO'
    end
    object qryRep607ITBIS_11PORCIENTO: TFloatField
      FieldName = 'ITBIS_11PORCIENTO'
    end
    object qryRep607ITBIS_13PORCIENTO: TFloatField
      FieldName = 'ITBIS_13PORCIENTO'
    end
    object qryRep607ITBIS_16PORCIENTO: TFloatField
      FieldName = 'ITBIS_16PORCIENTO'
    end
    object qryRep607ITBIS_18PORCIENTO: TFloatField
      FieldName = 'ITBIS_18PORCIENTO'
    end
    object qryRep607OTROPORCIENTOITBIS: TFloatField
      FieldName = 'OTROPORCIENTOITBIS'
    end
    object qryRep607MONTO_PROPINA_LEGAL: TFloatField
      FieldName = 'MONTO_PROPINA_LEGAL'
    end
  end
end
