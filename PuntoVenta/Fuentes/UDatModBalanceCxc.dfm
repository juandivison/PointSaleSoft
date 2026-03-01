object dmBalanceCxc: TdmBalanceCxc
  OldCreateOrder = False
  Left = 788
  Top = 323
  Height = 281
  Width = 261
  object qryBalanceCte: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
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
      
        '  (CODIGO, SERVICIO, MONEDA, BALANCE_ACT, BALANCE_ANT, DEBITO_ME' +
        'S, CREDITO_MES, '
      
        '   DEBITO_ACM, CREDITO_ACM, FECHA_BCE, FECHA_ULT_PAGO, STATUS_BC' +
        'E, FECHA_IN, '
      '   IN_POR, FECHA_MOD, MOD_POR)'
      'values'
      
        '  (:CODIGO, :SERVICIO, :MONEDA, :BALANCE_ACT, :BALANCE_ANT, :DEB' +
        'ITO_MES, '
      
        '   :CREDITO_MES, :DEBITO_ACM, :CREDITO_ACM, :FECHA_BCE, :FECHA_U' +
        'LT_PAGO, '
      '   :STATUS_BCE, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR)')
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
      '  CODIGOAUXI,'
      '  CODIGOTEMPORAL'
      'from BALANCE_CTE '
      'where'
      '  CODIGO = :CODIGO and'
      '  SERVICIO = :SERVICIO and'
      '  MONEDA = :MONEDA')
    SelectSQL.Strings = (
      'SELECT '
      'b.BALANCE_ACT, '
      'b.BALANCE_ANT, '
      'b.CODIGO, '
      'b.CREDITO_ACM, '
      'b.CREDITO_MES, '
      'b.DEBITO_ACM, '
      'b.DEBITO_MES, '
      'b.FECHA_BCE, '
      'b.FECHA_IN, '
      'b.FECHA_MOD, '
      'b.FECHA_ULT_PAGO, '
      'b.IN_POR, '
      'b.MOD_POR, '
      'b.MONEDA, '
      'b.SERVICIO, '
      'b.STATUS_BCE,'
      'c.nombre_facturar,'
      'c.telef_contacto,'
      'c.contacto,'
      'c.foto'
      'FROM BALANCE_CTE b, CLIENTES c'
      'Where b.codigo = c.codigo_cte'
      'ORDER BY c.codigo_cte')
    ModifySQL.Strings = (
      'update BALANCE_CTE'
      'set'
      '  CODIGO = :CODIGO,'
      '  SERVICIO = :SERVICIO,'
      '  MONEDA = :MONEDA,'
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
      '  CODIGO = :OLD_CODIGO and'
      '  SERVICIO = :OLD_SERVICIO and'
      '  MONEDA = :OLD_MONEDA')
    Left = 64
    Top = 32
    object qryBalanceCteCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Origin = 'BALANCE_CTE.CODIGO'
      Required = True
    end
    object qryBalanceCteNOMBRE_FACTURAR: TIBStringField
      DisplayLabel = 'Nombre Cliente'
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryBalanceCteTELEF_CONTACTO: TIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryBalanceCteCONTACTO: TIBStringField
      DisplayLabel = 'Persona Contacto'
      FieldName = 'CONTACTO'
      Origin = 'CLIENTES.CONTACTO'
      Size = 30
    end
    object qryBalanceCteSERVICIO: TIntegerField
      DisplayLabel = 'CodServicio'
      FieldName = 'SERVICIO'
      Origin = 'BALANCE_CTE.SERVICIO'
      Required = True
    end
    object qryBalanceCteMONEDA: TIBStringField
      DisplayLabel = 'CodMoneda'
      FieldName = 'MONEDA'
      Origin = 'BALANCE_CTE.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryBalanceCteBALANCE_ACT: TFloatField
      DisplayLabel = 'Balance Actual'
      FieldName = 'BALANCE_ACT'
      Origin = 'BALANCE_CTE.BALANCE_ACT'
    end
    object qryBalanceCteBALANCE_ANT: TFloatField
      DisplayLabel = 'Balance Anterior'
      FieldName = 'BALANCE_ANT'
      Origin = 'BALANCE_CTE.BALANCE_ANT'
    end
    object qryBalanceCteDEBITO_MES: TFloatField
      DisplayLabel = 'Debito Mes'
      FieldName = 'DEBITO_MES'
      Origin = 'BALANCE_CTE.DEBITO_MES'
    end
    object qryBalanceCteCREDITO_MES: TFloatField
      DisplayLabel = 'Credito Mes'
      FieldName = 'CREDITO_MES'
      Origin = 'BALANCE_CTE.CREDITO_MES'
    end
    object qryBalanceCteDEBITO_ACM: TFloatField
      DisplayLabel = 'Debito Acum'
      FieldName = 'DEBITO_ACM'
      Origin = 'BALANCE_CTE.DEBITO_ACM'
    end
    object qryBalanceCteCREDITO_ACM: TFloatField
      DisplayLabel = 'Credito Acum'
      FieldName = 'CREDITO_ACM'
      Origin = 'BALANCE_CTE.CREDITO_ACM'
    end
    object qryBalanceCteFECHA_BCE: TDateTimeField
      DisplayLabel = 'Fecha Bce'
      FieldName = 'FECHA_BCE'
      Origin = 'BALANCE_CTE.FECHA_BCE'
    end
    object qryBalanceCteFECHA_ULT_PAGO: TDateTimeField
      DisplayLabel = 'Fecha Ult. Pago'
      FieldName = 'FECHA_ULT_PAGO'
      Origin = 'BALANCE_CTE.FECHA_ULT_PAGO'
    end
    object qryBalanceCteSTATUS_BCE: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_BCE'
      Origin = 'BALANCE_CTE.STATUS_BCE'
      FixedChar = True
      Size = 1
    end
    object qryBalanceCteFECHA_IN: TDateTimeField
      DisplayLabel = 'Fecha In'
      FieldName = 'FECHA_IN'
      Origin = 'BALANCE_CTE.FECHA_IN'
    end
    object qryBalanceCteIN_POR: TIBStringField
      DisplayLabel = 'Insertado Por'
      FieldName = 'IN_POR'
      Origin = 'BALANCE_CTE.IN_POR'
      Size = 12
    end
    object qryBalanceCteFECHA_MOD: TDateTimeField
      DisplayLabel = 'Fecha Modificado'
      FieldName = 'FECHA_MOD'
      Origin = 'BALANCE_CTE.FECHA_MOD'
    end
    object qryBalanceCteMOD_POR: TIBStringField
      DisplayLabel = 'Modificado Por'
      FieldName = 'MOD_POR'
      Origin = 'BALANCE_CTE.MOD_POR'
      Size = 12
    end
    object qryBalanceCteFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'CLIENTES.FOTO'
      Size = 8
    end
  end
  object qryTotalCxc: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Select sum(balance_act) totalcxc'
      'From  BALANCE_CTE'
      ''
      '')
    Transaction = dmConectar.IBTransaction1
    Left = 64
    Top = 88
  end
  object qryTotalCxP: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Select sum(balance_act) totalcxp'
      'From  BALANCE_CXP'
      ''
      '')
    Transaction = dmConectar.IBTransaction1
    Left = 64
    Top = 136
  end
end
