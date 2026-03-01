object dmCatalogo: TdmCatalogo
  OldCreateOrder = False
  Left = 583
  Top = 122
  Height = 364
  Width = 475
  object tblqryCatalogo: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblqryCatalogoAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CATALOGO'
      'where'
      '  CIA_KEY = :OLD_CIA_KEY and'
      '  CUENTA1 = :OLD_CUENTA1 and'
      '  CUENTA2 = :OLD_CUENTA2 and'
      '  CUENTA3 = :OLD_CUENTA3')
    InsertSQL.Strings = (
      'insert into CATALOGO'
      
        '  (CIA_KEY, CUENTA1, CUENTA2, CUENTA3, NOMBRE_CTA, NIVEL_CTA, TI' +
        'PO_CTA, '
      
        '   CTA_CTRL1, CTA_CTRL2, CTA_CTRL3, CTACIE1, CTACIE2, CTACIE3, S' +
        'IGNO_CTA, '
      
        '   BALANCE_ACT, BALANCE_ANT, CREDITO_ACT, DEBITO_ACT, CREDITO_AC' +
        'M, DEBITO_ACM, '
      
        '   FECHA_APE, FECHA_ACT, FECHA_ULT_TR, TIPO, CTA_CONS1, CTA_CONS' +
        '2, CTA_CONS3, '
      
        '   CLASIFICACION_CTA, STATUS, FECHA_IN, IN_POR, FECHA_MOD, MOD_P' +
        'OR, CTA_AFECTA)'
      'values'
      
        '  (:CIA_KEY, :CUENTA1, :CUENTA2, :CUENTA3, :NOMBRE_CTA, :NIVEL_C' +
        'TA, :TIPO_CTA, '
      
        '   :CTA_CTRL1, :CTA_CTRL2, :CTA_CTRL3, :CTACIE1, :CTACIE2, :CTAC' +
        'IE3, :SIGNO_CTA, '
      
        '   :BALANCE_ACT, :BALANCE_ANT, :CREDITO_ACT, :DEBITO_ACT, :CREDI' +
        'TO_ACM, '
      
        '   :DEBITO_ACM, :FECHA_APE, :FECHA_ACT, :FECHA_ULT_TR, :TIPO, :C' +
        'TA_CONS1, '
      
        '   :CTA_CONS2, :CTA_CONS3, :CLASIFICACION_CTA, :STATUS, :FECHA_I' +
        'N, :IN_POR, '
      '   :FECHA_MOD, :MOD_POR, :CTA_AFECTA)')
    RefreshSQL.Strings = (
      'Select '
      '  CIA_KEY,'
      '  CUENTA1,'
      '  CUENTA2,'
      '  CUENTA3,'
      '  NOMBRE_CTA,'
      '  NIVEL_CTA,'
      '  TIPO_CTA,'
      '  CTA_CTRL1,'
      '  CTA_CTRL2,'
      '  CTA_CTRL3,'
      '  CTACIE1,'
      '  CTACIE2,'
      '  CTACIE3,'
      '  SIGNO_CTA,'
      '  BALANCE_ACT,'
      '  BALANCE_ANT,'
      '  CREDITO_ACT,'
      '  DEBITO_ACT,'
      '  CREDITO_ACM,'
      '  DEBITO_ACM,'
      '  FECHA_APE,'
      '  FECHA_ACT,'
      '  FECHA_ULT_TR,'
      '  TIPO,'
      '  CTA_CONS1,'
      '  CTA_CONS2,'
      '  CTA_CONS3,'
      '  CLASIFICACION_CTA,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  CTA_AFECTA'
      'from CATALOGO '
      'where'
      '  CIA_KEY = :CIA_KEY and'
      '  CUENTA1 = :CUENTA1 and'
      '  CUENTA2 = :CUENTA2 and'
      '  CUENTA3 = :CUENTA3')
    SelectSQL.Strings = (
      'select * from CATALOGO'
      'where cia_key =:ciakey'
      'order by cuenta1, cuenta2,cuenta3')
    ModifySQL.Strings = (
      'update CATALOGO'
      'set'
      '  CIA_KEY = :CIA_KEY,'
      '  CUENTA1 = :CUENTA1,'
      '  CUENTA2 = :CUENTA2,'
      '  CUENTA3 = :CUENTA3,'
      '  NOMBRE_CTA = :NOMBRE_CTA,'
      '  NIVEL_CTA = :NIVEL_CTA,'
      '  TIPO_CTA = :TIPO_CTA,'
      '  CTA_CTRL1 = :CTA_CTRL1,'
      '  CTA_CTRL2 = :CTA_CTRL2,'
      '  CTA_CTRL3 = :CTA_CTRL3,'
      '  CTACIE1 = :CTACIE1,'
      '  CTACIE2 = :CTACIE2,'
      '  CTACIE3 = :CTACIE3,'
      '  SIGNO_CTA = :SIGNO_CTA,'
      '  BALANCE_ACT = :BALANCE_ACT,'
      '  BALANCE_ANT = :BALANCE_ANT,'
      '  CREDITO_ACT = :CREDITO_ACT,'
      '  DEBITO_ACT = :DEBITO_ACT,'
      '  CREDITO_ACM = :CREDITO_ACM,'
      '  DEBITO_ACM = :DEBITO_ACM,'
      '  FECHA_APE = :FECHA_APE,'
      '  FECHA_ACT = :FECHA_ACT,'
      '  FECHA_ULT_TR = :FECHA_ULT_TR,'
      '  TIPO = :TIPO,'
      '  CTA_CONS1 = :CTA_CONS1,'
      '  CTA_CONS2 = :CTA_CONS2,'
      '  CTA_CONS3 = :CTA_CONS3,'
      '  CLASIFICACION_CTA = :CLASIFICACION_CTA,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  CTA_AFECTA = :CTA_AFECTA'
      'where'
      '  CIA_KEY = :OLD_CIA_KEY and'
      '  CUENTA1 = :OLD_CUENTA1 and'
      '  CUENTA2 = :OLD_CUENTA2 and'
      '  CUENTA3 = :OLD_CUENTA3')
    Left = 88
    Top = 16
    object tblqryCatalogoCUENTA1: TIBStringField
      DisplayLabel = 'Cta1'
      FieldName = 'CUENTA1'
      Origin = 'CATALOGO.CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object tblqryCatalogoCUENTA2: TIBStringField
      DisplayLabel = 'Cta2'
      FieldName = 'CUENTA2'
      Origin = 'CATALOGO.CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object tblqryCatalogoCUENTA3: TIBStringField
      DisplayLabel = 'Cta3'
      FieldName = 'CUENTA3'
      Origin = 'CATALOGO.CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
    object tblqryCatalogoNIVEL_CTA: TSmallintField
      DisplayLabel = 'NivelCta'
      FieldName = 'NIVEL_CTA'
      Origin = 'CATALOGO.NIVEL_CTA'
    end
    object tblqryCatalogoTIPO_CTA: TIBStringField
      DisplayLabel = 'TipoCta'
      FieldName = 'TIPO_CTA'
      Origin = 'CATALOGO.TIPO_CTA'
      FixedChar = True
      Size = 1
    end
    object tblqryCatalogoCTA_CTRL1: TIBStringField
      DisplayLabel = 'CtaCtrl1'
      FieldName = 'CTA_CTRL1'
      Origin = 'CATALOGO.CTA_CTRL1'
      FixedChar = True
      Size = 3
    end
    object tblqryCatalogoCTA_CTRL2: TIBStringField
      DisplayLabel = 'CtaCtrl2'
      FieldName = 'CTA_CTRL2'
      Origin = 'CATALOGO.CTA_CTRL2'
      FixedChar = True
      Size = 2
    end
    object tblqryCatalogoCTA_CTRL3: TIBStringField
      DisplayLabel = 'CtaCtrl3'
      FieldName = 'CTA_CTRL3'
      Origin = 'CATALOGO.CTA_CTRL3'
      FixedChar = True
      Size = 2
    end
    object tblqryCatalogoCTACIE1: TIBStringField
      DisplayLabel = 'CtaCie1'
      FieldName = 'CTACIE1'
      Origin = 'CATALOGO.CTACIE1'
      FixedChar = True
      Size = 3
    end
    object tblqryCatalogoCTACIE2: TIBStringField
      DisplayLabel = 'CtaCie1'
      FieldName = 'CTACIE2'
      Origin = 'CATALOGO.CTACIE2'
      FixedChar = True
      Size = 2
    end
    object tblqryCatalogoCTACIE3: TIBStringField
      DisplayLabel = 'CtaCie3'
      FieldName = 'CTACIE3'
      Origin = 'CATALOGO.CTACIE3'
      FixedChar = True
      Size = 2
    end
    object tblqryCatalogoSIGNO_CTA: TSmallintField
      DisplayLabel = 'Origen'
      FieldName = 'SIGNO_CTA'
      Origin = 'CATALOGO.SIGNO_CTA'
    end
    object tblqryCatalogoBALANCE_ACT: TFloatField
      DisplayLabel = 'BalanceAct'
      FieldName = 'BALANCE_ACT'
      Origin = 'CATALOGO.BALANCE_ACT'
    end
    object tblqryCatalogoBALANCE_ANT: TFloatField
      DisplayLabel = 'BalanceAnt'
      FieldName = 'BALANCE_ANT'
      Origin = 'CATALOGO.BALANCE_ANT'
    end
    object tblqryCatalogoCREDITO_ACT: TFloatField
      DisplayLabel = 'CreditoAct'
      FieldName = 'CREDITO_ACT'
      Origin = 'CATALOGO.CREDITO_ACT'
    end
    object tblqryCatalogoDEBITO_ACT: TFloatField
      DisplayLabel = 'DebitoAct'
      FieldName = 'DEBITO_ACT'
      Origin = 'CATALOGO.DEBITO_ACT'
    end
    object tblqryCatalogoCREDITO_ACM: TFloatField
      FieldName = 'CREDITO_ACM'
      Origin = 'CATALOGO.CREDITO_ACM'
    end
    object tblqryCatalogoDEBITO_ACM: TFloatField
      FieldName = 'DEBITO_ACM'
      Origin = 'CATALOGO.DEBITO_ACM'
    end
    object tblqryCatalogoFECHA_APE: TDateTimeField
      FieldName = 'FECHA_APE'
      Origin = 'CATALOGO.FECHA_APE'
    end
    object tblqryCatalogoFECHA_ACT: TDateTimeField
      FieldName = 'FECHA_ACT'
      Origin = 'CATALOGO.FECHA_ACT'
    end
    object tblqryCatalogoFECHA_ULT_TR: TDateTimeField
      FieldName = 'FECHA_ULT_TR'
      Origin = 'CATALOGO.FECHA_ULT_TR'
    end
    object tblqryCatalogoTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'CATALOGO.TIPO'
      FixedChar = True
      Size = 1
    end
    object tblqryCatalogoCTA_CONS1: TIBStringField
      FieldName = 'CTA_CONS1'
      Origin = 'CATALOGO.CTA_CONS1'
      FixedChar = True
      Size = 3
    end
    object tblqryCatalogoCTA_CONS2: TIBStringField
      FieldName = 'CTA_CONS2'
      Origin = 'CATALOGO.CTA_CONS2'
      FixedChar = True
      Size = 2
    end
    object tblqryCatalogoCTA_CONS3: TIBStringField
      FieldName = 'CTA_CONS3'
      Origin = 'CATALOGO.CTA_CONS3'
      FixedChar = True
      Size = 2
    end
    object tblqryCatalogoCLASIFICACION_CTA: TIntegerField
      FieldName = 'CLASIFICACION_CTA'
      Origin = 'CATALOGO.CLASIFICACION_CTA'
    end
    object tblqryCatalogoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CATALOGO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblqryCatalogoFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CATALOGO.FECHA_IN'
    end
    object tblqryCatalogoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'CATALOGO.IN_POR'
      Size = 12
    end
    object tblqryCatalogoFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CATALOGO.FECHA_MOD'
    end
    object tblqryCatalogoMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'CATALOGO.MOD_POR'
      Size = 12
    end
    object tblqryCatalogoCTA_AFECTA: TSmallintField
      FieldName = 'CTA_AFECTA'
      Origin = 'CATALOGO.CTA_AFECTA'
    end
    object tblqryCatalogoCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'CATALOGO.CIA_KEY'
    end
    object tblqryCatalogoNoExiste: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'NoExiste'
      Calculated = True
    end
    object tblqryCatalogoNOMBRE_CTA: TIBStringField
      FieldName = 'NOMBRE_CTA'
      Origin = 'CATALOGO.NOMBRE_CTA'
      Size = 80
    end
  end
  object tblTipocuenta: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPOCUENTA'
    Left = 88
    Top = 64
    object tblTipocuentaCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tblTipocuentaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object dstblTipocuenta: TDataSource
    DataSet = tblTipocuenta
    Left = 88
    Top = 120
  end
  object qrycatalogo: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'SELECT *'
      'FROM CATALOGO Catalogo'
      'where cia_key =:codigocia'
      'order by cuenta1, cuenta2,cuenta3')
    UpdateObject = updsqlQryCatalogo
    OnFilterRecord = qrycatalogoFilterRecord
    Left = 208
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigocia'
        ParamType = ptInput
      end>
    object qrycatalogoCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'CATALOGO.CIA_KEY'
    end
    object qrycatalogoCUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Origin = 'CATALOGO.CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qrycatalogoCUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Origin = 'CATALOGO.CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qrycatalogoCUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Origin = 'CATALOGO.CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qrycatalogoNIVEL_CTA: TSmallintField
      FieldName = 'NIVEL_CTA'
      Origin = 'CATALOGO.NIVEL_CTA'
    end
    object qrycatalogoTIPO_CTA: TIBStringField
      FieldName = 'TIPO_CTA'
      Origin = 'CATALOGO.TIPO_CTA'
      FixedChar = True
      Size = 1
    end
    object qrycatalogoCTA_CTRL1: TIBStringField
      FieldName = 'CTA_CTRL1'
      Origin = 'CATALOGO.CTA_CTRL1'
      FixedChar = True
      Size = 3
    end
    object qrycatalogoCTA_CTRL2: TIBStringField
      FieldName = 'CTA_CTRL2'
      Origin = 'CATALOGO.CTA_CTRL2'
      FixedChar = True
      Size = 2
    end
    object qrycatalogoCTA_CTRL3: TIBStringField
      FieldName = 'CTA_CTRL3'
      Origin = 'CATALOGO.CTA_CTRL3'
      FixedChar = True
      Size = 2
    end
    object qrycatalogoCTACIE1: TIBStringField
      FieldName = 'CTACIE1'
      Origin = 'CATALOGO.CTACIE1'
      FixedChar = True
      Size = 3
    end
    object qrycatalogoCTACIE2: TIBStringField
      FieldName = 'CTACIE2'
      Origin = 'CATALOGO.CTACIE2'
      FixedChar = True
      Size = 2
    end
    object qrycatalogoCTACIE3: TIBStringField
      FieldName = 'CTACIE3'
      Origin = 'CATALOGO.CTACIE3'
      FixedChar = True
      Size = 2
    end
    object qrycatalogoSIGNO_CTA: TSmallintField
      FieldName = 'SIGNO_CTA'
      Origin = 'CATALOGO.SIGNO_CTA'
    end
    object qrycatalogoBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'CATALOGO.BALANCE_ACT'
    end
    object qrycatalogoBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'CATALOGO.BALANCE_ANT'
    end
    object qrycatalogoCREDITO_ACT: TFloatField
      FieldName = 'CREDITO_ACT'
      Origin = 'CATALOGO.CREDITO_ACT'
    end
    object qrycatalogoDEBITO_ACT: TFloatField
      FieldName = 'DEBITO_ACT'
      Origin = 'CATALOGO.DEBITO_ACT'
    end
    object qrycatalogoCREDITO_ACM: TFloatField
      FieldName = 'CREDITO_ACM'
      Origin = 'CATALOGO.CREDITO_ACM'
    end
    object qrycatalogoDEBITO_ACM: TFloatField
      FieldName = 'DEBITO_ACM'
      Origin = 'CATALOGO.DEBITO_ACM'
    end
    object qrycatalogoFECHA_APE: TDateTimeField
      FieldName = 'FECHA_APE'
      Origin = 'CATALOGO.FECHA_APE'
    end
    object qrycatalogoFECHA_ACT: TDateTimeField
      FieldName = 'FECHA_ACT'
      Origin = 'CATALOGO.FECHA_ACT'
    end
    object qrycatalogoFECHA_ULT_TR: TDateTimeField
      FieldName = 'FECHA_ULT_TR'
      Origin = 'CATALOGO.FECHA_ULT_TR'
    end
    object qrycatalogoTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'CATALOGO.TIPO'
      FixedChar = True
      Size = 1
    end
    object qrycatalogoCTA_CONS1: TIBStringField
      FieldName = 'CTA_CONS1'
      Origin = 'CATALOGO.CTA_CONS1'
      FixedChar = True
      Size = 3
    end
    object qrycatalogoCTA_CONS2: TIBStringField
      FieldName = 'CTA_CONS2'
      Origin = 'CATALOGO.CTA_CONS2'
      FixedChar = True
      Size = 2
    end
    object qrycatalogoCTA_CONS3: TIBStringField
      FieldName = 'CTA_CONS3'
      Origin = 'CATALOGO.CTA_CONS3'
      FixedChar = True
      Size = 2
    end
    object qrycatalogoCLASIFICACION_CTA: TIntegerField
      FieldName = 'CLASIFICACION_CTA'
      Origin = 'CATALOGO.CLASIFICACION_CTA'
    end
    object qrycatalogoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CATALOGO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qrycatalogoFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CATALOGO.FECHA_IN'
    end
    object qrycatalogoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'CATALOGO.IN_POR'
      Size = 12
    end
    object qrycatalogoFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CATALOGO.FECHA_MOD'
    end
    object qrycatalogoMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'CATALOGO.MOD_POR'
      Size = 12
    end
    object qrycatalogoCTA_AFECTA: TSmallintField
      FieldName = 'CTA_AFECTA'
      Origin = 'CATALOGO.CTA_AFECTA'
    end
    object qrycatalogoNOMBRE_CTA: TIBStringField
      FieldName = 'NOMBRE_CTA'
      Origin = 'CATALOGO.NOMBRE_CTA'
      Size = 80
    end
  end
  object qryBceCtames: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from balance_cnt'
      'where'
      '  CUENTA1_BLC = :OLD_CUENTA1_BLC and'
      '  CUENTA2_BLC = :OLD_CUENTA2_BLC and'
      '  CUENTA3_BLC = :OLD_CUENTA3_BLC and'
      '  FECHA_BLC = :OLD_FECHA_BLC and'
      '  STATUS_CIEA = :OLD_STATUS_CIEA')
    InsertSQL.Strings = (
      'insert into balance_cnt'
      
        '  (CUENTA1_BLC, CUENTA2_BLC, CUENTA3_BLC, FECHA_BLC, STATUS_CIEA' +
        ', TIPO_CTA, '
      
        '   SIGNO_CTA, NIVEL_CTA, BALANCE_ACT, BALANCE_ANT, DEBITO, CREDI' +
        'TO, FECHA_IN, '
      '   IN_POR, FECHA_MOD, MOD_POR)'
      'values'
      
        '  (:CUENTA1_BLC, :CUENTA2_BLC, :CUENTA3_BLC, :FECHA_BLC, :STATUS' +
        '_CIEA, '
      
        '   :TIPO_CTA, :SIGNO_CTA, :NIVEL_CTA, :BALANCE_ACT, :BALANCE_ANT' +
        ', :DEBITO, '
      '   :CREDITO, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  CUENTA1_BLC,'
      '  CUENTA2_BLC,'
      '  CUENTA3_BLC,'
      '  FECHA_BLC,'
      '  STATUS_CIEA,'
      '  TIPO_CTA,'
      '  SIGNO_CTA,'
      '  NIVEL_CTA,'
      '  BALANCE_ACT,'
      '  BALANCE_ANT,'
      '  DEBITO,'
      '  CREDITO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from balance_cnt '
      'where'
      '  CUENTA1_BLC = :CUENTA1_BLC and'
      '  CUENTA2_BLC = :CUENTA2_BLC and'
      '  CUENTA3_BLC = :CUENTA3_BLC and'
      '  FECHA_BLC = :FECHA_BLC and'
      '  STATUS_CIEA = :STATUS_CIEA')
    SelectSQL.Strings = (
      'select * from balance_cnt'
      'Where  fecha_blc between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update balance_cnt'
      'set'
      '  CUENTA1_BLC = :CUENTA1_BLC,'
      '  CUENTA2_BLC = :CUENTA2_BLC,'
      '  CUENTA3_BLC = :CUENTA3_BLC,'
      '  FECHA_BLC = :FECHA_BLC,'
      '  STATUS_CIEA = :STATUS_CIEA,'
      '  TIPO_CTA = :TIPO_CTA,'
      '  SIGNO_CTA = :SIGNO_CTA,'
      '  NIVEL_CTA = :NIVEL_CTA,'
      '  BALANCE_ACT = :BALANCE_ACT,'
      '  BALANCE_ANT = :BALANCE_ANT,'
      '  DEBITO = :DEBITO,'
      '  CREDITO = :CREDITO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  CUENTA1_BLC = :OLD_CUENTA1_BLC and'
      '  CUENTA2_BLC = :OLD_CUENTA2_BLC and'
      '  CUENTA3_BLC = :OLD_CUENTA3_BLC and'
      '  FECHA_BLC = :OLD_FECHA_BLC and'
      '  STATUS_CIEA = :OLD_STATUS_CIEA')
    Left = 208
    Top = 120
    object qryBceCtamesCUENTA1_BLC: TIBStringField
      FieldName = 'CUENTA1_BLC'
      Origin = 'BALANCE_CNT.CUENTA1_BLC'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryBceCtamesCUENTA2_BLC: TIBStringField
      FieldName = 'CUENTA2_BLC'
      Origin = 'BALANCE_CNT.CUENTA2_BLC'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryBceCtamesCUENTA3_BLC: TIBStringField
      FieldName = 'CUENTA3_BLC'
      Origin = 'BALANCE_CNT.CUENTA3_BLC'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryBceCtamesFECHA_BLC: TDateTimeField
      FieldName = 'FECHA_BLC'
      Origin = 'BALANCE_CNT.FECHA_BLC'
      Required = True
    end
    object qryBceCtamesSTATUS_CIEA: TIBStringField
      FieldName = 'STATUS_CIEA'
      Origin = 'BALANCE_CNT.STATUS_CIEA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryBceCtamesTIPO_CTA: TIBStringField
      FieldName = 'TIPO_CTA'
      Origin = 'BALANCE_CNT.TIPO_CTA'
      FixedChar = True
      Size = 1
    end
    object qryBceCtamesSIGNO_CTA: TIBStringField
      FieldName = 'SIGNO_CTA'
      Origin = 'BALANCE_CNT.SIGNO_CTA'
      FixedChar = True
      Size = 1
    end
    object qryBceCtamesNIVEL_CTA: TSmallintField
      FieldName = 'NIVEL_CTA'
      Origin = 'BALANCE_CNT.NIVEL_CTA'
    end
    object qryBceCtamesBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'BALANCE_CNT.BALANCE_ACT'
    end
    object qryBceCtamesBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'BALANCE_CNT.BALANCE_ANT'
    end
    object qryBceCtamesDEBITO: TFloatField
      FieldName = 'DEBITO'
      Origin = 'BALANCE_CNT.DEBITO'
    end
    object qryBceCtamesCREDITO: TFloatField
      FieldName = 'CREDITO'
      Origin = 'BALANCE_CNT.CREDITO'
    end
    object qryBceCtamesFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'BALANCE_CNT.FECHA_IN'
    end
    object qryBceCtamesIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'BALANCE_CNT.IN_POR'
      Size = 12
    end
    object qryBceCtamesFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'BALANCE_CNT.FECHA_MOD'
    end
    object qryBceCtamesMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'BALANCE_CNT.MOD_POR'
      Size = 12
    end
  end
  object qryBlcMesCta: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM BALANCE_CNT'
      'WHERE FECHA_BLC BETWEEN :FECHAIN AND :FECHAFIN')
    Left = 88
    Top = 176
    object qryBlcMesCtaCUENTA1_BLC: TIBStringField
      FieldName = 'CUENTA1_BLC'
      Origin = 'BALANCE_CNT.CUENTA1_BLC'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryBlcMesCtaCUENTA2_BLC: TIBStringField
      FieldName = 'CUENTA2_BLC'
      Origin = 'BALANCE_CNT.CUENTA2_BLC'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryBlcMesCtaCUENTA3_BLC: TIBStringField
      FieldName = 'CUENTA3_BLC'
      Origin = 'BALANCE_CNT.CUENTA3_BLC'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryBlcMesCtaFECHA_BLC: TDateTimeField
      FieldName = 'FECHA_BLC'
      Origin = 'BALANCE_CNT.FECHA_BLC'
      Required = True
    end
    object qryBlcMesCtaSTATUS_CIEA: TIBStringField
      FieldName = 'STATUS_CIEA'
      Origin = 'BALANCE_CNT.STATUS_CIEA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryBlcMesCtaTIPO_CTA: TIBStringField
      FieldName = 'TIPO_CTA'
      Origin = 'BALANCE_CNT.TIPO_CTA'
      FixedChar = True
      Size = 1
    end
    object qryBlcMesCtaSIGNO_CTA: TIBStringField
      FieldName = 'SIGNO_CTA'
      Origin = 'BALANCE_CNT.SIGNO_CTA'
      FixedChar = True
      Size = 1
    end
    object qryBlcMesCtaNIVEL_CTA: TSmallintField
      FieldName = 'NIVEL_CTA'
      Origin = 'BALANCE_CNT.NIVEL_CTA'
    end
    object qryBlcMesCtaBALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'BALANCE_CNT.BALANCE_ACT'
    end
    object qryBlcMesCtaBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'BALANCE_CNT.BALANCE_ANT'
    end
    object qryBlcMesCtaDEBITO: TFloatField
      FieldName = 'DEBITO'
      Origin = 'BALANCE_CNT.DEBITO'
    end
    object qryBlcMesCtaCREDITO: TFloatField
      FieldName = 'CREDITO'
      Origin = 'BALANCE_CNT.CREDITO'
    end
    object qryBlcMesCtaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'BALANCE_CNT.FECHA_IN'
    end
    object qryBlcMesCtaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'BALANCE_CNT.IN_POR'
      Size = 12
    end
    object qryBlcMesCtaFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'BALANCE_CNT.FECHA_MOD'
    end
    object qryBlcMesCtaMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'BALANCE_CNT.MOD_POR'
      Size = 12
    end
  end
  object dtqryBlcMesCta: TDataSource
    DataSet = qryBlcMesCta
    Left = 208
    Top = 176
  end
  object qryCuentas400_700: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Catalogo'
      'Where'
      'cuenta1 > '#39'399'#39'  AND '
      'cuenta1 < '#39'700'#39'  AND TIPO_CTA = '#39'A'#39)
    Left = 208
    Top = 232
    object qryCuentas400_700CUENTA1: TIBStringField
      FieldName = 'CUENTA1'
      Origin = 'CATALOGO.CUENTA1'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryCuentas400_700CUENTA2: TIBStringField
      FieldName = 'CUENTA2'
      Origin = 'CATALOGO.CUENTA2'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryCuentas400_700CUENTA3: TIBStringField
      FieldName = 'CUENTA3'
      Origin = 'CATALOGO.CUENTA3'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryCuentas400_700NIVEL_CTA: TSmallintField
      FieldName = 'NIVEL_CTA'
      Origin = 'CATALOGO.NIVEL_CTA'
    end
    object qryCuentas400_700TIPO_CTA: TIBStringField
      FieldName = 'TIPO_CTA'
      Origin = 'CATALOGO.TIPO_CTA'
      FixedChar = True
      Size = 1
    end
    object qryCuentas400_700CTA_CTRL1: TIBStringField
      FieldName = 'CTA_CTRL1'
      Origin = 'CATALOGO.CTA_CTRL1'
      FixedChar = True
      Size = 3
    end
    object qryCuentas400_700CTA_CTRL2: TIBStringField
      FieldName = 'CTA_CTRL2'
      Origin = 'CATALOGO.CTA_CTRL2'
      FixedChar = True
      Size = 2
    end
    object qryCuentas400_700CTA_CTRL3: TIBStringField
      FieldName = 'CTA_CTRL3'
      Origin = 'CATALOGO.CTA_CTRL3'
      FixedChar = True
      Size = 2
    end
    object qryCuentas400_700CTACIE1: TIBStringField
      FieldName = 'CTACIE1'
      Origin = 'CATALOGO.CTACIE1'
      FixedChar = True
      Size = 3
    end
    object qryCuentas400_700CTACIE2: TIBStringField
      FieldName = 'CTACIE2'
      Origin = 'CATALOGO.CTACIE2'
      FixedChar = True
      Size = 2
    end
    object qryCuentas400_700CTACIE3: TIBStringField
      FieldName = 'CTACIE3'
      Origin = 'CATALOGO.CTACIE3'
      FixedChar = True
      Size = 2
    end
    object qryCuentas400_700SIGNO_CTA: TSmallintField
      FieldName = 'SIGNO_CTA'
      Origin = 'CATALOGO.SIGNO_CTA'
    end
    object qryCuentas400_700BALANCE_ACT: TFloatField
      FieldName = 'BALANCE_ACT'
      Origin = 'CATALOGO.BALANCE_ACT'
    end
    object qryCuentas400_700BALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
      Origin = 'CATALOGO.BALANCE_ANT'
    end
    object qryCuentas400_700CREDITO_ACT: TFloatField
      FieldName = 'CREDITO_ACT'
      Origin = 'CATALOGO.CREDITO_ACT'
    end
    object qryCuentas400_700DEBITO_ACT: TFloatField
      FieldName = 'DEBITO_ACT'
      Origin = 'CATALOGO.DEBITO_ACT'
    end
    object qryCuentas400_700CREDITO_ACM: TFloatField
      FieldName = 'CREDITO_ACM'
      Origin = 'CATALOGO.CREDITO_ACM'
    end
    object qryCuentas400_700DEBITO_ACM: TFloatField
      FieldName = 'DEBITO_ACM'
      Origin = 'CATALOGO.DEBITO_ACM'
    end
    object qryCuentas400_700FECHA_APE: TDateTimeField
      FieldName = 'FECHA_APE'
      Origin = 'CATALOGO.FECHA_APE'
    end
    object qryCuentas400_700FECHA_ACT: TDateTimeField
      FieldName = 'FECHA_ACT'
      Origin = 'CATALOGO.FECHA_ACT'
    end
    object qryCuentas400_700FECHA_ULT_TR: TDateTimeField
      FieldName = 'FECHA_ULT_TR'
      Origin = 'CATALOGO.FECHA_ULT_TR'
    end
    object qryCuentas400_700TIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'CATALOGO.TIPO'
      FixedChar = True
      Size = 1
    end
    object qryCuentas400_700CTA_CONS1: TIBStringField
      FieldName = 'CTA_CONS1'
      Origin = 'CATALOGO.CTA_CONS1'
      FixedChar = True
      Size = 3
    end
    object qryCuentas400_700CTA_CONS2: TIBStringField
      FieldName = 'CTA_CONS2'
      Origin = 'CATALOGO.CTA_CONS2'
      FixedChar = True
      Size = 2
    end
    object qryCuentas400_700CTA_CONS3: TIBStringField
      FieldName = 'CTA_CONS3'
      Origin = 'CATALOGO.CTA_CONS3'
      FixedChar = True
      Size = 2
    end
    object qryCuentas400_700CLASIFICACION_CTA: TIntegerField
      FieldName = 'CLASIFICACION_CTA'
      Origin = 'CATALOGO.CLASIFICACION_CTA'
    end
    object qryCuentas400_700STATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CATALOGO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryCuentas400_700FECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CATALOGO.FECHA_IN'
    end
    object qryCuentas400_700IN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'CATALOGO.IN_POR'
      Size = 12
    end
    object qryCuentas400_700FECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CATALOGO.FECHA_MOD'
    end
    object qryCuentas400_700MOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'CATALOGO.MOD_POR'
      Size = 12
    end
    object qryCuentas400_700CIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'CATALOGO.CIA_KEY'
    end
    object qryCuentas400_700NOMBRE_CTA: TIBStringField
      FieldName = 'NOMBRE_CTA'
      Origin = 'CATALOGO.NOMBRE_CTA'
      Size = 60
    end
    object qryCuentas400_700CTA_AFECTA: TSmallintField
      FieldName = 'CTA_AFECTA'
      Origin = 'CATALOGO.CTA_AFECTA'
    end
  end
  object updsqlQryCatalogo: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CUENTA1,'
      '  CUENTA2,'
      '  CUENTA3,'
      '  NOMBRE_CTA,'
      '  NIVEL_CTA,'
      '  TIPO_CTA,'
      '  CTA_CTRL1,'
      '  CTA_CTRL2,'
      '  CTA_CTRL3,'
      '  CTACIE1,'
      '  CTACIE2,'
      '  CTACIE3,'
      '  SIGNO_CTA,'
      '  BALANCE_ACT,'
      '  BALANCE_ANT,'
      '  CREDITO_ACT,'
      '  DEBITO_ACT,'
      '  CREDITO_ACM,'
      '  DEBITO_ACM,'
      '  FECHA_APE,'
      '  FECHA_ACT,'
      '  FECHA_ULT_TR,'
      '  TIPO,'
      '  CTA_CONS1,'
      '  CTA_CONS2,'
      '  CTA_CONS3,'
      '  CLASIFICACION_CTA,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from CATALOGO '
      'where'
      '  CUENTA1 = :CUENTA1 and'
      '  CUENTA2 = :CUENTA2 and'
      '  CUENTA3 = :CUENTA3')
    ModifySQL.Strings = (
      'update CATALOGO'
      'set'
      '  CUENTA1 = :CUENTA1,'
      '  CUENTA2 = :CUENTA2,'
      '  CUENTA3 = :CUENTA3,'
      '  NOMBRE_CTA = :NOMBRE_CTA,'
      '  NIVEL_CTA = :NIVEL_CTA,'
      '  TIPO_CTA = :TIPO_CTA,'
      '  CTA_CTRL1 = :CTA_CTRL1,'
      '  CTA_CTRL2 = :CTA_CTRL2,'
      '  CTA_CTRL3 = :CTA_CTRL3,'
      '  CTACIE1 = :CTACIE1,'
      '  CTACIE2 = :CTACIE2,'
      '  CTACIE3 = :CTACIE3,'
      '  SIGNO_CTA = :SIGNO_CTA,'
      '  BALANCE_ACT = :BALANCE_ACT,'
      '  BALANCE_ANT = :BALANCE_ANT,'
      '  CREDITO_ACT = :CREDITO_ACT,'
      '  DEBITO_ACT = :DEBITO_ACT,'
      '  CREDITO_ACM = :CREDITO_ACM,'
      '  DEBITO_ACM = :DEBITO_ACM,'
      '  FECHA_APE = :FECHA_APE,'
      '  FECHA_ACT = :FECHA_ACT,'
      '  FECHA_ULT_TR = :FECHA_ULT_TR,'
      '  TIPO = :TIPO,'
      '  CTA_CONS1 = :CTA_CONS1,'
      '  CTA_CONS2 = :CTA_CONS2,'
      '  CTA_CONS3 = :CTA_CONS3,'
      '  CLASIFICACION_CTA = :CLASIFICACION_CTA,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  CUENTA1 = :OLD_CUENTA1 and'
      '  CUENTA2 = :OLD_CUENTA2 and'
      '  CUENTA3 = :OLD_CUENTA3')
    InsertSQL.Strings = (
      'insert into CATALOGO'
      
        '  (CUENTA1, CUENTA2, CUENTA3, NOMBRE_CTA, NIVEL_CTA, TIPO_CTA, C' +
        'TA_CTRL1, '
      
        '   CTA_CTRL2, CTA_CTRL3, CTACIE1, CTACIE2, CTACIE3, SIGNO_CTA, B' +
        'ALANCE_ACT, '
      
        '   BALANCE_ANT, CREDITO_ACT, DEBITO_ACT, CREDITO_ACM, DEBITO_ACM' +
        ', FECHA_APE, '
      
        '   FECHA_ACT, FECHA_ULT_TR, TIPO, CTA_CONS1, CTA_CONS2, CTA_CONS' +
        '3, CLASIFICACION_CTA, '
      '   STATUS, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR)'
      'values'
      
        '  (:CUENTA1, :CUENTA2, :CUENTA3, :NOMBRE_CTA, :NIVEL_CTA, :TIPO_' +
        'CTA, :CTA_CTRL1, '
      
        '   :CTA_CTRL2, :CTA_CTRL3, :CTACIE1, :CTACIE2, :CTACIE3, :SIGNO_' +
        'CTA, :BALANCE_ACT, '
      
        '   :BALANCE_ANT, :CREDITO_ACT, :DEBITO_ACT, :CREDITO_ACM, :DEBIT' +
        'O_ACM, '
      
        '   :FECHA_APE, :FECHA_ACT, :FECHA_ULT_TR, :TIPO, :CTA_CONS1, :CT' +
        'A_CONS2, '
      
        '   :CTA_CONS3, :CLASIFICACION_CTA, :STATUS, :FECHA_IN, :IN_POR, ' +
        ':FECHA_MOD, '
      '   :MOD_POR)')
    DeleteSQL.Strings = (
      'delete from CATALOGO'
      'where'
      '  CUENTA1 = :OLD_CUENTA1 and'
      '  CUENTA2 = :OLD_CUENTA2 and'
      '  CUENTA3 = :OLD_CUENTA3')
    Left = 208
    Top = 64
  end
  object qryAfectaCta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from AFECTA_CUENTA')
    Left = 304
    Top = 120
    object qryAfectaCtaCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'AFECTA_CUENTA.CODIGO'
      Required = True
    end
    object qryAfectaCtaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'AFECTA_CUENTA.DESCRIPCION'
    end
  end
  object dsqryAfectaCta: TDataSource
    DataSet = qryAfectaCta
    Left = 88
    Top = 232
  end
end
