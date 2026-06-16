object dmDatos: TdmDatos
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 390
  Top = 142
  Height = 769
  Width = 1023
  object qryTasa: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM VALORMONEDA (:CODIGO,:FECHA_SERVICIO)')
    Left = 48
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_SERVICIO'
        ParamType = ptInput
      end>
    object qryTasaSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VALORMONEDA.SERIE'
    end
    object qryTasaVALORMONEDA: TFloatField
      FieldName = 'VALORMONEDA'
      Origin = 'VALORMONEDA.VALORMONEDA'
      DisplayFormat = ',0.00'
    end
    object qryTasaSIMBOLO: TIBStringField
      FieldName = 'SIMBOLO'
      Origin = 'VALORMONEDA.SIMBOLO'
      FixedChar = True
      Size = 6
    end
  end
  object dsqryTasa: TDataSource
    DataSet = qryTasa
    Left = 48
    Top = 72
  end
  object qryOrdenMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryOrdenMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ORDEN_COMP_MAST'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into ORDEN_COMP_MAST'
      
        '  (NUMERO, CODIGO_PROVEE, FECHA, FPAGO, COD_CAJA_CHICA, CODIGO_B' +
        'ANCO, CUENTABANCO, '
      
        '   OBSERVACION, MONTO, STATUS, IN_POR, FECHA_IN, MOD_POR, FECHA_' +
        'MOD, TIPO_INV, '
      
        '   STATUS_CNT, NUM_ORDEN, STATUS_ORD, AREA_ORDEN, CIA_KEY, NUMER' +
        'O_NCF, '
      
        '   CODIGO_VENDEDOR, SERIE_TIPOTRNCNT, TASA_ITBIS, TASA_ISR, MONT' +
        'O_RETENER_ISR, '
      
        '   MONTO_RETENER_ITBIS, IDTIPO_COMPRA, FECHA_RECIBIDA, FECHA_DEB' +
        'ERECIBIR)'
      'values'
      
        '  (:NUMERO, :CODIGO_PROVEE, :FECHA, :FPAGO, :COD_CAJA_CHICA, :CO' +
        'DIGO_BANCO, '
      
        '   :CUENTABANCO, :OBSERVACION, :MONTO, :STATUS, :IN_POR, :FECHA_' +
        'IN, :MOD_POR, '
      
        '   :FECHA_MOD, :TIPO_INV, :STATUS_CNT, :NUM_ORDEN, :STATUS_ORD, ' +
        ':AREA_ORDEN, '
      
        '   :CIA_KEY, :NUMERO_NCF, :CODIGO_VENDEDOR, :SERIE_TIPOTRNCNT, :' +
        'TASA_ITBIS, '
      
        '   :TASA_ISR, :MONTO_RETENER_ISR, :MONTO_RETENER_ITBIS, :IDTIPO_' +
        'COMPRA, '
      '   :FECHA_RECIBIDA, :FECHA_DEBERECIBIR)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  CODIGO_PROVEE,'
      '  FECHA,'
      '  FPAGO,'
      '  COD_CAJA_CHICA,'
      '  CODIGO_BANCO,'
      '  CUENTABANCO,'
      '  OBSERVACION,'
      '  MONTO,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD,'
      '  TIPO_INV,'
      '  STATUS_CNT,'
      '  NUM_ORDEN,'
      '  STATUS_ORD,'
      '  AREA_ORDEN,'
      '  CIA_KEY,'
      '  NUMERO_NCF,'
      '  CODIGO_VENDEDOR,'
      '  SERIE_TIPOTRNCNT,'
      '  TASA_ITBIS,'
      '  TASA_ISR,'
      '  MONTO_RETENER_ISR,'
      '  MONTO_RETENER_ITBIS,'
      '  IDTIPO_COMPRA,'
      '  FECHA_RECIBIDA,'
      '  FECHA_DEBERECIBIR'
      'from ORDEN_COMP_MAST '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select * From ORDEN_COMP_MAST'
      'Where Fecha between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update ORDEN_COMP_MAST'
      'set'
      '  NUMERO = :NUMERO,'
      '  CODIGO_PROVEE = :CODIGO_PROVEE,'
      '  FECHA = :FECHA,'
      '  FPAGO = :FPAGO,'
      '  COD_CAJA_CHICA = :COD_CAJA_CHICA,'
      '  CODIGO_BANCO = :CODIGO_BANCO,'
      '  CUENTABANCO = :CUENTABANCO,'
      '  OBSERVACION = :OBSERVACION,'
      '  MONTO = :MONTO,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  TIPO_INV = :TIPO_INV,'
      '  STATUS_CNT = :STATUS_CNT,'
      '  NUM_ORDEN = :NUM_ORDEN,'
      '  STATUS_ORD = :STATUS_ORD,'
      '  AREA_ORDEN = :AREA_ORDEN,'
      '  CIA_KEY = :CIA_KEY,'
      '  NUMERO_NCF = :NUMERO_NCF,'
      '  CODIGO_VENDEDOR = :CODIGO_VENDEDOR,'
      '  SERIE_TIPOTRNCNT = :SERIE_TIPOTRNCNT,'
      '  TASA_ITBIS = :TASA_ITBIS,'
      '  TASA_ISR = :TASA_ISR,'
      '  MONTO_RETENER_ISR = :MONTO_RETENER_ISR,'
      '  MONTO_RETENER_ITBIS = :MONTO_RETENER_ITBIS,'
      '  IDTIPO_COMPRA = :IDTIPO_COMPRA,'
      '  FECHA_RECIBIDA = :FECHA_RECIBIDA,'
      '  FECHA_DEBERECIBIR = :FECHA_DEBERECIBIR'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 144
    Top = 24
    object qryOrdenMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'ORDEN_COMP_MAST.NUMERO'
      Required = True
    end
    object qryOrdenMasterCODIGO_PROVEE: TIntegerField
      FieldName = 'CODIGO_PROVEE'
      Origin = 'ORDEN_COMP_MAST.CODIGO_PROVEE'
      Required = True
    end
    object qryOrdenMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ORDEN_COMP_MAST.FECHA'
      Required = True
    end
    object qryOrdenMasterFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'ORDEN_COMP_MAST.FPAGO'
    end
    object qryOrdenMasterCOD_CAJA_CHICA: TIntegerField
      FieldName = 'COD_CAJA_CHICA'
      Origin = 'ORDEN_COMP_MAST.COD_CAJA_CHICA'
    end
    object qryOrdenMasterCODIGO_BANCO: TIntegerField
      FieldName = 'CODIGO_BANCO'
      Origin = 'ORDEN_COMP_MAST.CODIGO_BANCO'
    end
    object qryOrdenMasterCUENTABANCO: TIBStringField
      FieldName = 'CUENTABANCO'
      Origin = 'ORDEN_COMP_MAST.CUENTABANCO'
    end
    object qryOrdenMasterOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'ORDEN_COMP_MAST.OBSERVACION'
      Size = 40
    end
    object qryOrdenMasterMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'ORDEN_COMP_MAST.MONTO'
    end
    object qryOrdenMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ORDEN_COMP_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryOrdenMasterIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ORDEN_COMP_MAST.IN_POR'
      Size = 12
    end
    object qryOrdenMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ORDEN_COMP_MAST.FECHA_IN'
    end
    object qryOrdenMasterMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'ORDEN_COMP_MAST.MOD_POR'
      Size = 12
    end
    object qryOrdenMasterFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'ORDEN_COMP_MAST.FECHA_MOD'
    end
    object qryOrdenMasterTIPO_INV: TSmallintField
      FieldName = 'TIPO_INV'
      Origin = 'ORDEN_COMP_MAST.TIPO_INV'
    end
    object qryOrdenMasterSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'ORDEN_COMP_MAST.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryOrdenMasterNUM_ORDEN: TIntegerField
      FieldName = 'NUM_ORDEN'
      Origin = 'ORDEN_COMP_MAST.NUM_ORDEN'
    end
    object qryOrdenMasterSTATUS_ORD: TIBStringField
      FieldName = 'STATUS_ORD'
      Origin = 'ORDEN_COMP_MAST.STATUS_ORD'
      FixedChar = True
      Size = 1
    end
    object qryOrdenMasterAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'ORDEN_COMP_MAST.AREA_ORDEN'
    end
    object qryOrdenMasterCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'ORDEN_COMP_MAST.CIA_KEY'
    end
    object qryOrdenMasterNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'ORDEN_COMP_MAST.NUMERO_NCF'
      Size = 21
    end
    object qryOrdenMasterCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'ORDEN_COMP_MAST.CODIGO_VENDEDOR'
    end
    object qryOrdenMasterSERIE_TIPOTRNCNT: TIntegerField
      FieldName = 'SERIE_TIPOTRNCNT'
      Origin = 'ORDEN_COMP_MAST.SERIE_TIPOTRNCNT'
    end
    object qryOrdenMasterTASA_ITBIS: TFloatField
      FieldName = 'TASA_ITBIS'
      Origin = 'ORDEN_COMP_MAST.TASA_ITBIS'
    end
    object qryOrdenMasterTASA_ISR: TFloatField
      FieldName = 'TASA_ISR'
      Origin = 'ORDEN_COMP_MAST.TASA_ISR'
    end
    object qryOrdenMasterMONTO_RETENER_ISR: TFloatField
      FieldName = 'MONTO_RETENER_ISR'
      Origin = 'ORDEN_COMP_MAST.MONTO_RETENER_ISR'
    end
    object qryOrdenMasterMONTO_RETENER_ITBIS: TFloatField
      FieldName = 'MONTO_RETENER_ITBIS'
      Origin = 'ORDEN_COMP_MAST.MONTO_RETENER_ITBIS'
    end
    object qryOrdenMasterIDTIPO_COMPRA: TIntegerField
      FieldName = 'IDTIPO_COMPRA'
      Origin = 'ORDEN_COMP_MAST.IDTIPO_COMPRA'
    end
    object qryOrdenMasterFECHA_RECIBIDA: TDateTimeField
      FieldName = 'FECHA_RECIBIDA'
      Origin = 'ORDEN_COMP_MAST.FECHA_RECIBIDA'
    end
    object qryOrdenMasterFECHA_DEBERECIBIR: TDateTimeField
      FieldName = 'FECHA_DEBERECIBIR'
      Origin = 'ORDEN_COMP_MAST.FECHA_DEBERECIBIR'
      Required = True
    end
  end
  object qryOrdenDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ORDEN_COMP_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into ORDEN_COMP_DET'
      
        '  (SERIE, NUMERO, COD_SERV_PROD, DEPARTAMENTO, OBSERVACION, CANT' +
        'IDAD, VALOR, '
      
        '   STATUS, IN_POR, FECHA_IN, MOD_POR, FECHA_MOD, NUMERO_DOCUMENT' +
        'O, NUMERO_FACTURA, '
      
        '   COD_CTA_CONCEPTO, TIPOSERVICIO, SUBTIPOSERV, NO_SERIE_RES, CO' +
        'DIGO_CONDUCTOR, '
      
        '   SERIE_CDC, CODIGO_SERVCOSTO, NUMEROOLD, PRECIO, AREA_ORDEN, I' +
        'TBI_DET, '
      
        '   PORC_DESC_DET, MONTO_DESCUENTO, IDUNIDAD, COD_USUARIO_RECIBE,' +
        ' COD_USUARIO_CREA)'
      'values'
      
        '  (:SERIE, :NUMERO, :COD_SERV_PROD, :DEPARTAMENTO, :OBSERVACION,' +
        ' :CANTIDAD, '
      
        '   :VALOR, :STATUS, :IN_POR, :FECHA_IN, :MOD_POR, :FECHA_MOD, :N' +
        'UMERO_DOCUMENTO, '
      
        '   :NUMERO_FACTURA, :COD_CTA_CONCEPTO, :TIPOSERVICIO, :SUBTIPOSE' +
        'RV, :NO_SERIE_RES, '
      
        '   :CODIGO_CONDUCTOR, :SERIE_CDC, :CODIGO_SERVCOSTO, :NUMEROOLD,' +
        ' :PRECIO, '
      
        '   :AREA_ORDEN, :ITBI_DET, :PORC_DESC_DET, :MONTO_DESCUENTO, :ID' +
        'UNIDAD, '
      '   :COD_USUARIO_RECIBE, :COD_USUARIO_CREA)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  COD_SERV_PROD,'
      '  DEPARTAMENTO,'
      '  OBSERVACION,'
      '  CANTIDAD,'
      '  VALOR,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD,'
      '  NUMERO_DOCUMENTO,'
      '  NUMERO_FACTURA,'
      '  COD_CTA_CONCEPTO,'
      '  TIPOSERVICIO,'
      '  SUBTIPOSERV,'
      '  NO_SERIE_RES,'
      '  CODIGO_CONDUCTOR,'
      '  SERIE_CDC,'
      '  CODIGO_SERVCOSTO,'
      '  NUMEROOLD,'
      '  PRECIO,'
      '  AREA_ORDEN,'
      '  ITBI_DET,'
      '  PORC_DESC_DET,'
      '  MONTO_DESCUENTO,'
      '  CANT_OFERTA,'
      '  IDUNIDAD,'
      '  COD_USUARIO_RECIBE,'
      '  COD_USUARIO_CREA'
      'from ORDEN_COMP_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select  * From ORDEN_COMP_DET'
      'Where numero=:numero')
    ModifySQL.Strings = (
      'update ORDEN_COMP_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  COD_SERV_PROD = :COD_SERV_PROD,'
      '  DEPARTAMENTO = :DEPARTAMENTO,'
      '  OBSERVACION = :OBSERVACION,'
      '  CANTIDAD = :CANTIDAD,'
      '  VALOR = :VALOR,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  NUMERO_DOCUMENTO = :NUMERO_DOCUMENTO,'
      '  NUMERO_FACTURA = :NUMERO_FACTURA,'
      '  COD_CTA_CONCEPTO = :COD_CTA_CONCEPTO,'
      '  TIPOSERVICIO = :TIPOSERVICIO,'
      '  SUBTIPOSERV = :SUBTIPOSERV,'
      '  NO_SERIE_RES = :NO_SERIE_RES,'
      '  CODIGO_CONDUCTOR = :CODIGO_CONDUCTOR,'
      '  SERIE_CDC = :SERIE_CDC,'
      '  CODIGO_SERVCOSTO = :CODIGO_SERVCOSTO,'
      '  NUMEROOLD = :NUMEROOLD,'
      '  PRECIO = :PRECIO,'
      '  AREA_ORDEN = :AREA_ORDEN,'
      '  ITBI_DET = :ITBI_DET,'
      '  PORC_DESC_DET = :PORC_DESC_DET,'
      '  MONTO_DESCUENTO = :MONTO_DESCUENTO,'
      '  IDUNIDAD = :IDUNIDAD,'
      '  COD_USUARIO_RECIBE = :COD_USUARIO_RECIBE,'
      '  COD_USUARIO_CREA = :COD_USUARIO_CREA'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 144
    Top = 80
    object qryOrdenDetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'ORDEN_COMP_DET.SERIE'
      Required = True
    end
    object qryOrdenDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'ORDEN_COMP_DET.NUMERO'
      Required = True
    end
    object qryOrdenDetCOD_SERV_PROD: TIntegerField
      FieldName = 'COD_SERV_PROD'
      Origin = 'ORDEN_COMP_DET.COD_SERV_PROD'
    end
    object qryOrdenDetDEPARTAMENTO: TIntegerField
      FieldName = 'DEPARTAMENTO'
      Origin = 'ORDEN_COMP_DET.DEPARTAMENTO'
    end
    object qryOrdenDetOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'ORDEN_COMP_DET.OBSERVACION'
      Size = 80
    end
    object qryOrdenDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'ORDEN_COMP_DET.CANTIDAD'
    end
    object qryOrdenDetVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'ORDEN_COMP_DET.VALOR'
    end
    object qryOrdenDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ORDEN_COMP_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryOrdenDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ORDEN_COMP_DET.IN_POR'
      Size = 12
    end
    object qryOrdenDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ORDEN_COMP_DET.FECHA_IN'
    end
    object qryOrdenDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'ORDEN_COMP_DET.MOD_POR'
      Size = 12
    end
    object qryOrdenDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'ORDEN_COMP_DET.FECHA_MOD'
    end
    object qryOrdenDetNUMERO_DOCUMENTO: TIntegerField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'ORDEN_COMP_DET.NUMERO_DOCUMENTO'
    end
    object qryOrdenDetNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'ORDEN_COMP_DET.NUMERO_FACTURA'
    end
    object qryOrdenDetCOD_CTA_CONCEPTO: TIntegerField
      FieldName = 'COD_CTA_CONCEPTO'
      Origin = 'ORDEN_COMP_DET.COD_CTA_CONCEPTO'
    end
    object qryOrdenDetTIPOSERVICIO: TIntegerField
      FieldName = 'TIPOSERVICIO'
      Origin = 'ORDEN_COMP_DET.TIPOSERVICIO'
    end
    object qryOrdenDetSUBTIPOSERV: TIntegerField
      FieldName = 'SUBTIPOSERV'
      Origin = 'ORDEN_COMP_DET.SUBTIPOSERV'
    end
    object qryOrdenDetNO_SERIE_RES: TIntegerField
      FieldName = 'NO_SERIE_RES'
      Origin = 'ORDEN_COMP_DET.NO_SERIE_RES'
    end
    object qryOrdenDetCODIGO_CONDUCTOR: TIntegerField
      FieldName = 'CODIGO_CONDUCTOR'
      Origin = 'ORDEN_COMP_DET.CODIGO_CONDUCTOR'
    end
    object qryOrdenDetSERIE_CDC: TIntegerField
      FieldName = 'SERIE_CDC'
      Origin = 'ORDEN_COMP_DET.SERIE_CDC'
    end
    object qryOrdenDetCODIGO_SERVCOSTO: TIntegerField
      FieldName = 'CODIGO_SERVCOSTO'
      Origin = 'ORDEN_COMP_DET.CODIGO_SERVCOSTO'
    end
    object qryOrdenDetNUMEROOLD: TIntegerField
      FieldName = 'NUMEROOLD'
      Origin = 'ORDEN_COMP_DET.NUMEROOLD'
    end
    object qryOrdenDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'ORDEN_COMP_DET.PRECIO'
    end
    object qryOrdenDetAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'ORDEN_COMP_DET.AREA_ORDEN'
    end
    object qryOrdenDetMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'ORDEN_COMP_DET.MONTO_DESCUENTO'
    end
    object qryOrdenDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'ORDEN_COMP_DET.ITBI_DET'
    end
    object qryOrdenDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'ORDEN_COMP_DET.PORC_DESC_DET'
    end
    object qryOrdenDetCANT_OFERTA: TIntegerField
      FieldName = 'CANT_OFERTA'
      Origin = 'ORDEN_COMP_DET.CANT_OFERTA'
    end
    object qryOrdenDetIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'ORDEN_COMP_DET.IDUNIDAD'
    end
    object qryOrdenDetCOD_USUARIO_RECIBE: TIntegerField
      FieldName = 'COD_USUARIO_RECIBE'
      Origin = 'ORDEN_COMP_DET.COD_USUARIO_RECIBE'
    end
    object qryOrdenDetCOD_USUARIO_CREA: TIntegerField
      FieldName = 'COD_USUARIO_CREA'
      Origin = 'ORDEN_COMP_DET.COD_USUARIO_CREA'
    end
  end
  object dsqryOrdenMaster: TDataSource
    AutoEdit = False
    DataSet = qryOrdenMaster
    Left = 280
    Top = 24
  end
  object dsqryOrdenDet: TDataSource
    AutoEdit = False
    DataSet = qryOrdenDet
    Left = 256
    Top = 80
  end
  object qryInv: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterOpen = qryInvAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select CODIGO, CODIGO_TEXTO, DESCRIPCION, PRECIO,  CANTIDAD, PRE' +
        'CIO_COMPRA, REFERENCIA, PAGA_ITBI, TIPO_UNIDAD '
      'FROM INVENTARIO_PRODUCTO'
      'order by codigo')
    Left = 144
    Top = 136
    object qryInvCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInvCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryInvREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object qryInvPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryInvPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
    end
    object qryInvTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.TIPO_UNIDAD'
    end
    object qryInvPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryInvCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryInvDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
  end
  object rxqryInv: TRxMemoryData
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_TEXTO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'PRECIO_COMPRA'
        DataType = ftCurrency
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PAGA_ITBI'
        DataType = ftSmallint
      end>
    Left = 208
    Top = 128
    object rxqryInvCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object rxqryInvCODIGO_TEXTO: TStringField
      FieldName = 'CODIGO_TEXTO'
      Size = 40
    end
    object rxqryInvDESCRIPCION: TStringField
      DisplayWidth = 80
      FieldName = 'DESCRIPCION'
      Size = 80
    end
    object rxqryInvPRECIO_COMPRA: TCurrencyField
      FieldName = 'PRECIO_COMPRA'
    end
    object rxqryInvREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 50
    end
    object rxqryInvPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
    end
  end
  object dsrxqryInv: TDataSource
    DataSet = rxqryInv
    Left = 256
    Top = 192
  end
  object qryDatosOrdenImp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryDatosOrdenImpAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  ORDEN_COMP_MAST.NUMERO,'
      '  ORDEN_COMP_MAST.CODIGO_PROVEE,'
      '  ORDEN_COMP_MAST.FECHA,'
      '  ORDEN_COMP_MAST.FECHA_DEBERECIBIR,'
      '  ORDEN_COMP_MAST.FPAGO,'
      '  ORDEN_COMP_MAST.COD_CAJA_CHICA,'
      '  ORDEN_COMP_MAST.CODIGO_BANCO,'
      '  ORDEN_COMP_MAST.CUENTABANCO,'
      '  ORDEN_COMP_MAST.OBSERVACION,'
      '  ORDEN_COMP_MAST.MONTO,'
      '  ORDEN_COMP_MAST.STATUS,'
      '  ORDEN_COMP_MAST.IN_POR,'
      '  ORDEN_COMP_MAST.FECHA_IN,'
      '  ORDEN_COMP_MAST.MOD_POR,'
      '  ORDEN_COMP_MAST.FECHA_MOD,'
      '  ORDEN_COMP_MAST.TIPO_INV,'
      '  ORDEN_COMP_MAST.STATUS_CNT,'
      '  ORDEN_COMP_MAST.NUM_ORDEN,'
      '  ORDEN_COMP_MAST.STATUS_ORD,'
      '  ORDEN_COMP_MAST.AREA_ORDEN,'
      '  ORDEN_COMP_MAST.CIA_KEY,'
      '  ORDEN_COMP_MAST.NUMERO_NCF,'
      '  PROVEEDORES.DESCRIPCION,'
      '  PROVEEDORES.CIUDAD,'
      '  PROVEEDORES.CALYYNUM,'
      '  PROVEEDORES.TELEFONO,'
      '  PROVEEDORES.FAX,'
      '  PROVEEDORES.EMAIL,'
      '  PROVEEDORES.MOVIL1,'
      '  PROVEEDORES.MOVIL2,'
      '  PROVEEDORES.TELEFONO2,'
      '  PROVEEDORES.TELEFONO3,'
      '  PROVEEDORES.EXTENSIONES,'
      '  PROVEEDORES.CIA_KEY,'
      '  PROVEEDORES.NOMBRE_ABR,'
      '  PROVEEDORES.CONTACTO,'
      '  PROVEEDORES.PAIS,'
      '  PROVEEDORES.RNC_PROVEEDOR,'
      '  proveedores.condicion,'
      
        '  COALESCE (CONDICION.DESCRIPCION ,'#39'CONTADO'#39' ) AS CONDICIONCREDI' +
        'TO,   '
      '  proveedores.limite_credito,'
      
        'iif(proveedores.CANT_DIAS_CREDITO > 0,ORDEN_COMP_MAST.FECHA + pr' +
        'oveedores.CANT_DIAS_CREDITO,ORDEN_COMP_MAST.FECHA) fecha_vence'
      ''
      'FROM'
      '  ORDEN_COMP_MAST'
      
        '  INNER JOIN PROVEEDORES ON (ORDEN_COMP_MAST.CODIGO_PROVEE = PRO' +
        'VEEDORES.CODIGO_CTE)'
      
        '  LEFT OUTER JOIN CONDICION ON (PROVEEDORES.CONDICION = CONDICIO' +
        'N.CODIGO)'
      'WHERE'
      'ORDEN_COMP_MAST.STATUS = '#39'A'#39
      'And Num_Orden =:numorden')
    Left = 48
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numorden'
        ParamType = ptInput
        Value = '6'
      end>
    object qryDatosOrdenImpNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'ORDEN_COMP_MAST.NUMERO'
      Required = True
    end
    object qryDatosOrdenImpCODIGO_PROVEE: TIntegerField
      FieldName = 'CODIGO_PROVEE'
      Origin = 'ORDEN_COMP_MAST.CODIGO_PROVEE'
      Required = True
    end
    object qryDatosOrdenImpFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ORDEN_COMP_MAST.FECHA'
      Required = True
    end
    object qryDatosOrdenImpFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'ORDEN_COMP_MAST.FPAGO'
    end
    object qryDatosOrdenImpCOD_CAJA_CHICA: TIntegerField
      FieldName = 'COD_CAJA_CHICA'
      Origin = 'ORDEN_COMP_MAST.COD_CAJA_CHICA'
    end
    object qryDatosOrdenImpCODIGO_BANCO: TIntegerField
      FieldName = 'CODIGO_BANCO'
      Origin = 'ORDEN_COMP_MAST.CODIGO_BANCO'
    end
    object qryDatosOrdenImpCUENTABANCO: TIBStringField
      FieldName = 'CUENTABANCO'
      Origin = 'ORDEN_COMP_MAST.CUENTABANCO'
    end
    object qryDatosOrdenImpOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'ORDEN_COMP_MAST.OBSERVACION'
      Size = 40
    end
    object qryDatosOrdenImpMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'ORDEN_COMP_MAST.MONTO'
    end
    object qryDatosOrdenImpSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ORDEN_COMP_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosOrdenImpIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ORDEN_COMP_MAST.IN_POR'
      Size = 12
    end
    object qryDatosOrdenImpFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ORDEN_COMP_MAST.FECHA_IN'
    end
    object qryDatosOrdenImpMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'ORDEN_COMP_MAST.MOD_POR'
      Size = 12
    end
    object qryDatosOrdenImpFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'ORDEN_COMP_MAST.FECHA_MOD'
    end
    object qryDatosOrdenImpTIPO_INV: TSmallintField
      FieldName = 'TIPO_INV'
      Origin = 'ORDEN_COMP_MAST.TIPO_INV'
    end
    object qryDatosOrdenImpSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'ORDEN_COMP_MAST.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryDatosOrdenImpNUM_ORDEN: TIntegerField
      FieldName = 'NUM_ORDEN'
      Origin = 'ORDEN_COMP_MAST.NUM_ORDEN'
    end
    object qryDatosOrdenImpSTATUS_ORD: TIBStringField
      FieldName = 'STATUS_ORD'
      Origin = 'ORDEN_COMP_MAST.STATUS_ORD'
      FixedChar = True
      Size = 1
    end
    object qryDatosOrdenImpAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'ORDEN_COMP_MAST.AREA_ORDEN'
    end
    object qryDatosOrdenImpCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'ORDEN_COMP_MAST.CIA_KEY'
    end
    object qryDatosOrdenImpNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'ORDEN_COMP_MAST.NUMERO_NCF'
      Size = 21
    end
    object qryDatosOrdenImpDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object qryDatosOrdenImpCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROVEEDORES.CIUDAD'
    end
    object qryDatosOrdenImpCALYYNUM: TIBStringField
      FieldName = 'CALYYNUM'
      Origin = 'PROVEEDORES.CALYYNUM'
      Size = 80
    end
    object qryDatosOrdenImpTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object qryDatosOrdenImpFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'PROVEEDORES.FAX'
      Size = 12
    end
    object qryDatosOrdenImpEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'PROVEEDORES.EMAIL'
      Size = 40
    end
    object qryDatosOrdenImpMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'PROVEEDORES.MOVIL1'
    end
    object qryDatosOrdenImpMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'PROVEEDORES.MOVIL2'
    end
    object qryDatosOrdenImpTELEFONO2: TIBStringField
      FieldName = 'TELEFONO2'
      Origin = 'PROVEEDORES.TELEFONO2'
    end
    object qryDatosOrdenImpTELEFONO3: TIBStringField
      FieldName = 'TELEFONO3'
      Origin = 'PROVEEDORES.TELEFONO3'
    end
    object qryDatosOrdenImpEXTENSIONES: TIBStringField
      FieldName = 'EXTENSIONES'
      Origin = 'PROVEEDORES.EXTENSIONES'
      Size = 40
    end
    object qryDatosOrdenImpCIA_KEY1: TIntegerField
      FieldName = 'CIA_KEY1'
      Origin = 'PROVEEDORES.CIA_KEY'
    end
    object qryDatosOrdenImpNOMBRE_ABR: TIBStringField
      FieldName = 'NOMBRE_ABR'
      Origin = 'PROVEEDORES.NOMBRE_ABR'
      Size = 60
    end
    object qryDatosOrdenImpCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'PROVEEDORES.CONTACTO'
      Size = 35
    end
    object qryDatosOrdenImpPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PROVEEDORES.PAIS'
      Size = 30
    end
    object qryDatosOrdenImpRNC_PROVEEDOR: TIBStringField
      FieldName = 'RNC_PROVEEDOR'
      Origin = 'PROVEEDORES.RNC_PROVEEDOR'
      Size = 15
    end
    object qryDatosOrdenImpCONDICION: TIntegerField
      FieldName = 'CONDICION'
      Origin = 'PROVEEDORES.CONDICION'
    end
    object qryDatosOrdenImpLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'PROVEEDORES.LIMITE_CREDITO'
    end
    object qryDatosOrdenImpFECHA_VENCE: TDateTimeField
      FieldName = 'FECHA_VENCE'
    end
    object qryDatosOrdenImpCONDICIONCREDITO: TIBStringField
      FieldName = 'CONDICIONCREDITO'
    end
    object qryDatosOrdenImpFECHA_DEBERECIBIR: TDateTimeField
      FieldName = 'FECHA_DEBERECIBIR'
      Origin = 'ORDEN_COMP_MAST.FECHA_DEBERECIBIR'
    end
  end
  object qryDatosOrdenImpDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      'dto.CANTIDAD CantOrden,'
      'r.* From ORDEN_COMP_DET r'
      
        'left outer join ORDEN_COMP_DET_ORIGINAL dto on dto.serie = r.ser' +
        'ie'
      'Where r.numero=:numero')
    Left = 48
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryDatosOrdenImpDetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'ORDEN_COMP_DET.SERIE'
      Required = True
    end
    object qryDatosOrdenImpDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'ORDEN_COMP_DET.NUMERO'
      Required = True
    end
    object qryDatosOrdenImpDetCOD_SERV_PROD: TIntegerField
      FieldName = 'COD_SERV_PROD'
      Origin = 'ORDEN_COMP_DET.COD_SERV_PROD'
    end
    object qryDatosOrdenImpDetDEPARTAMENTO: TIntegerField
      FieldName = 'DEPARTAMENTO'
      Origin = 'ORDEN_COMP_DET.DEPARTAMENTO'
    end
    object qryDatosOrdenImpDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'ORDEN_COMP_DET.CANTIDAD'
    end
    object qryDatosOrdenImpDetVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'ORDEN_COMP_DET.VALOR'
    end
    object qryDatosOrdenImpDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ORDEN_COMP_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosOrdenImpDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ORDEN_COMP_DET.IN_POR'
      Size = 12
    end
    object qryDatosOrdenImpDetOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'ORDEN_COMP_DET.OBSERVACION'
      Size = 80
    end
    object qryDatosOrdenImpDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ORDEN_COMP_DET.FECHA_IN'
    end
    object qryDatosOrdenImpDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'ORDEN_COMP_DET.MOD_POR'
      Size = 12
    end
    object qryDatosOrdenImpDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'ORDEN_COMP_DET.FECHA_MOD'
    end
    object qryDatosOrdenImpDetNUMERO_DOCUMENTO: TIntegerField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'ORDEN_COMP_DET.NUMERO_DOCUMENTO'
    end
    object qryDatosOrdenImpDetNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'ORDEN_COMP_DET.NUMERO_FACTURA'
    end
    object qryDatosOrdenImpDetCOD_CTA_CONCEPTO: TIntegerField
      FieldName = 'COD_CTA_CONCEPTO'
      Origin = 'ORDEN_COMP_DET.COD_CTA_CONCEPTO'
    end
    object qryDatosOrdenImpDetTIPOSERVICIO: TIntegerField
      FieldName = 'TIPOSERVICIO'
      Origin = 'ORDEN_COMP_DET.TIPOSERVICIO'
    end
    object qryDatosOrdenImpDetSUBTIPOSERV: TIntegerField
      FieldName = 'SUBTIPOSERV'
      Origin = 'ORDEN_COMP_DET.SUBTIPOSERV'
    end
    object qryDatosOrdenImpDetNO_SERIE_RES: TIntegerField
      FieldName = 'NO_SERIE_RES'
      Origin = 'ORDEN_COMP_DET.NO_SERIE_RES'
    end
    object qryDatosOrdenImpDetCODIGO_CONDUCTOR: TIntegerField
      FieldName = 'CODIGO_CONDUCTOR'
      Origin = 'ORDEN_COMP_DET.CODIGO_CONDUCTOR'
    end
    object qryDatosOrdenImpDetSERIE_CDC: TIntegerField
      FieldName = 'SERIE_CDC'
      Origin = 'ORDEN_COMP_DET.SERIE_CDC'
    end
    object qryDatosOrdenImpDetCODIGO_SERVCOSTO: TIntegerField
      FieldName = 'CODIGO_SERVCOSTO'
      Origin = 'ORDEN_COMP_DET.CODIGO_SERVCOSTO'
    end
    object qryDatosOrdenImpDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'ORDEN_COMP_DET.PRECIO'
    end
    object qryDatosOrdenImpDetAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'ORDEN_COMP_DET.AREA_ORDEN'
    end
    object qryDatosOrdenImpDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'ORDEN_COMP_DET.ITBI_DET'
    end
    object qryDatosOrdenImpDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'ORDEN_COMP_DET.PORC_DESC_DET'
    end
    object qryDatosOrdenImpDetMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'ORDEN_COMP_DET.MONTO_DESCUENTO'
    end
    object qryDatosOrdenImpDetIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'ORDEN_COMP_DET.IDUNIDAD'
    end
    object qryDatosOrdenImpDetCANT_OFERTA: TIntegerField
      FieldName = 'CANT_OFERTA'
      Origin = 'ORDEN_COMP_DET.CANT_OFERTA'
    end
    object qryDatosOrdenImpDetCOD_USUARIO_RECIBE: TIntegerField
      FieldName = 'COD_USUARIO_RECIBE'
      Origin = 'ORDEN_COMP_DET.COD_USUARIO_RECIBE'
    end
    object qryDatosOrdenImpDetCOD_USUARIO_CREA: TIntegerField
      FieldName = 'COD_USUARIO_CREA'
      Origin = 'ORDEN_COMP_DET.COD_USUARIO_CREA'
    end
    object qryDatosOrdenImpDetCANTORDEN: TFloatField
      FieldName = 'CANTORDEN'
      Origin = 'ORDEN_COMP_DET_ORIGINAL.CANTIDAD'
    end
  end
  object stpInsOrdenMast: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INS_ORDEN_COMP_MAST'
    Left = 32
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_PROVEE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'FPAGO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'COD_CAJA_CHICA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'CODIGO_BANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CUENTABANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
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
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_INV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS_CNT'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'NUM_ORDEN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS_ORD'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'AREA_ORDEN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_VENDEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SERIE_TIPOTRNCNT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TASA_ITBIS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TASA_ISR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_RETENER_ISR'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_RETENER_ITBIS'
        ParamType = ptInput
      end>
  end
  object qryPrecioXUnidad: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PRECIO_XUNIDAD'
      'where'
      '  ID_PROD = :OLD_ID_PROD and'
      '  ID_UNIDAD = :OLD_ID_UNIDAD')
    InsertSQL.Strings = (
      'insert into PRECIO_XUNIDAD'
      
        '  (ID_PROD, ID_UNIDAD, PRECIO, COD_USUARIO, FECHA_IN, FECHA_UPDA' +
        'TE)'
      'values'
      
        '  (:ID_PROD, :ID_UNIDAD, :PRECIO, :COD_USUARIO, :FECHA_IN, :FECH' +
        'A_UPDATE)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PROD,'
      '  ID_UNIDAD,'
      '  PRECIO,'
      '  COD_USUARIO,'
      '  FECHA_IN,'
      '  FECHA_UPDATE'
      'from PRECIO_XUNIDAD '
      'where'
      '  ID_PROD = :ID_PROD and'
      '  ID_UNIDAD = :ID_UNIDAD')
    SelectSQL.Strings = (
      'Select * from PRECIO_XUNIDAD'
      'where ID_PROD=:idprod')
    ModifySQL.Strings = (
      'update PRECIO_XUNIDAD'
      'set'
      '  ID_PROD = :ID_PROD,'
      '  ID_UNIDAD = :ID_UNIDAD,'
      '  PRECIO = :PRECIO,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  FECHA_IN = :FECHA_IN,'
      '  FECHA_UPDATE = :FECHA_UPDATE'
      'where'
      '  ID_PROD = :OLD_ID_PROD and'
      '  ID_UNIDAD = :OLD_ID_UNIDAD')
    Left = 288
    Top = 240
    object qryPrecioXUnidadID_PROD: TIntegerField
      DisplayLabel = 'IdProd'
      FieldName = 'ID_PROD'
      Origin = 'PRECIO_XUNIDAD.ID_PROD'
      Required = True
    end
    object qryPrecioXUnidadID_UNIDAD: TIntegerField
      DisplayLabel = 'IdUnidad'
      FieldName = 'ID_UNIDAD'
      Origin = 'PRECIO_XUNIDAD.ID_UNIDAD'
      Required = True
    end
    object qryPrecioXUnidadPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'PRECIO_XUNIDAD.PRECIO'
    end
    object qryPrecioXUnidadCOD_USUARIO: TIntegerField
      DisplayLabel = 'CodUsuario'
      FieldName = 'COD_USUARIO'
      Origin = 'PRECIO_XUNIDAD.COD_USUARIO'
    end
    object qryPrecioXUnidadFECHA_IN: TDateTimeField
      DisplayLabel = 'Fecha In'
      FieldName = 'FECHA_IN'
      Origin = 'PRECIO_XUNIDAD.FECHA_IN'
    end
    object qryPrecioXUnidadFECHA_UPDATE: TDateTimeField
      DisplayLabel = 'Fecha Update'
      FieldName = 'FECHA_UPDATE'
      Origin = 'PRECIO_XUNIDAD.FECHA_UPDATE'
    end
  end
  object dsqryPrecioXUnidad: TDataSource
    DataSet = qryPrecioXUnidad
    Left = 296
    Top = 304
  end
  object tblTipoUnidad: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'UNIDADES'
    Left = 144
    Top = 184
  end
  object dstblTipoUnidad: TDataSource
    DataSet = tblTipoUnidad
    Left = 144
    Top = 232
  end
  object stpInsOrdenDet: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INS_ORDEN_COMP_DET'
    Left = 48
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_SERV_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DEPARTAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_DOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_CTA_CONCEPTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOSERVICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SUBTIPOSERV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NO_SERIE_RES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CONDUCTOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_SERVCOSTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AREA_ORDEN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ITBI_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DESCUENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDUNIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_USUARIO_RECIBE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_USUARIO_CREA'
        ParamType = ptInput
      end>
  end
  object stpInsSolOrdenMast: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INS_SOLORDEN_COMP_MAST'
    Left = 144
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_PROVEE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'FPAGO'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'COD_CAJA_CHICA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'CODIGO_BANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CUENTABANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
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
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_INV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS_CNT'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'NUM_ORDEN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS_ORD'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'AREA_ORDEN'
        ParamType = ptInput
      end>
  end
  object stpInsSolOrdenDet: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INS_SOLORDEN_COMP_DET'
    Left = 144
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_SERV_PROD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DEPARTAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBSERVACION'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_DOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_CTA_CONCEPTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOSERVICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SUBTIPOSERV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NO_SERIE_RES'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_CONDUCTOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_SERVCOSTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AREA_ORDEN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ITBI_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_DET'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DESCUENTO'
        ParamType = ptInput
      end>
  end
  object qryDatosSolOrdenImpDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From sol_ORDEN_COMP_DET'
      'Where numero=:numero')
    Left = 400
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryDatosSolOrdenImpDetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'SOL_ORDEN_COMP_DET.SERIE'
      Required = True
    end
    object qryDatosSolOrdenImpDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'SOL_ORDEN_COMP_DET.NUMERO'
      Required = True
    end
    object qryDatosSolOrdenImpDetCOD_SERV_PROD: TIntegerField
      FieldName = 'COD_SERV_PROD'
      Origin = 'SOL_ORDEN_COMP_DET.COD_SERV_PROD'
    end
    object qryDatosSolOrdenImpDetDEPARTAMENTO: TIntegerField
      FieldName = 'DEPARTAMENTO'
      Origin = 'SOL_ORDEN_COMP_DET.DEPARTAMENTO'
    end
    object qryDatosSolOrdenImpDetOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'SOL_ORDEN_COMP_DET.OBSERVACION'
      Size = 80
    end
    object qryDatosSolOrdenImpDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'SOL_ORDEN_COMP_DET.CANTIDAD'
    end
    object qryDatosSolOrdenImpDetVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'SOL_ORDEN_COMP_DET.VALOR'
    end
    object qryDatosSolOrdenImpDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'SOL_ORDEN_COMP_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosSolOrdenImpDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'SOL_ORDEN_COMP_DET.IN_POR'
      Size = 12
    end
    object qryDatosSolOrdenImpDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'SOL_ORDEN_COMP_DET.FECHA_IN'
    end
    object qryDatosSolOrdenImpDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'SOL_ORDEN_COMP_DET.MOD_POR'
      Size = 12
    end
    object qryDatosSolOrdenImpDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'SOL_ORDEN_COMP_DET.FECHA_MOD'
    end
    object qryDatosSolOrdenImpDetNUMERO_DOCUMENTO: TIntegerField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'SOL_ORDEN_COMP_DET.NUMERO_DOCUMENTO'
    end
    object qryDatosSolOrdenImpDetNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'SOL_ORDEN_COMP_DET.NUMERO_FACTURA'
    end
    object qryDatosSolOrdenImpDetCOD_CTA_CONCEPTO: TIntegerField
      FieldName = 'COD_CTA_CONCEPTO'
      Origin = 'SOL_ORDEN_COMP_DET.COD_CTA_CONCEPTO'
    end
    object qryDatosSolOrdenImpDetTIPOSERVICIO: TIntegerField
      FieldName = 'TIPOSERVICIO'
      Origin = 'SOL_ORDEN_COMP_DET.TIPOSERVICIO'
    end
    object qryDatosSolOrdenImpDetSUBTIPOSERV: TIntegerField
      FieldName = 'SUBTIPOSERV'
      Origin = 'SOL_ORDEN_COMP_DET.SUBTIPOSERV'
    end
    object qryDatosSolOrdenImpDetNO_SERIE_RES: TIntegerField
      FieldName = 'NO_SERIE_RES'
      Origin = 'SOL_ORDEN_COMP_DET.NO_SERIE_RES'
    end
    object qryDatosSolOrdenImpDetCODIGO_CONDUCTOR: TIntegerField
      FieldName = 'CODIGO_CONDUCTOR'
      Origin = 'SOL_ORDEN_COMP_DET.CODIGO_CONDUCTOR'
    end
    object qryDatosSolOrdenImpDetSERIE_CDC: TIntegerField
      FieldName = 'SERIE_CDC'
      Origin = 'SOL_ORDEN_COMP_DET.SERIE_CDC'
    end
    object qryDatosSolOrdenImpDetCODIGO_SERVCOSTO: TIntegerField
      FieldName = 'CODIGO_SERVCOSTO'
      Origin = 'SOL_ORDEN_COMP_DET.CODIGO_SERVCOSTO'
    end
    object qryDatosSolOrdenImpDetNUMEROOLD: TIntegerField
      FieldName = 'NUMEROOLD'
      Origin = 'SOL_ORDEN_COMP_DET.NUMEROOLD'
    end
    object qryDatosSolOrdenImpDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'SOL_ORDEN_COMP_DET.PRECIO'
    end
    object qryDatosSolOrdenImpDetAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'SOL_ORDEN_COMP_DET.AREA_ORDEN'
    end
    object qryDatosSolOrdenImpDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'SOL_ORDEN_COMP_DET.ITBI_DET'
    end
    object qryDatosSolOrdenImpDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'SOL_ORDEN_COMP_DET.PORC_DESC_DET'
    end
    object qryDatosSolOrdenImpDetMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'SOL_ORDEN_COMP_DET.MONTO_DESCUENTO'
    end
  end
  object qryDatosSolOrdenImp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryDatosSolOrdenImpAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  ORDEN_COMP_MAST.NUMERO,'
      '  ORDEN_COMP_MAST.CODIGO_PROVEE,'
      '  ORDEN_COMP_MAST.FECHA,'
      '  ORDEN_COMP_MAST.FPAGO,'
      '  ORDEN_COMP_MAST.COD_CAJA_CHICA,'
      '  ORDEN_COMP_MAST.CODIGO_BANCO,'
      '  ORDEN_COMP_MAST.CUENTABANCO,'
      '  ORDEN_COMP_MAST.OBSERVACION,'
      '  ORDEN_COMP_MAST.MONTO,'
      '  ORDEN_COMP_MAST.STATUS,'
      '  ORDEN_COMP_MAST.IN_POR,'
      '  ORDEN_COMP_MAST.FECHA_IN,'
      '  ORDEN_COMP_MAST.MOD_POR,'
      '  ORDEN_COMP_MAST.FECHA_MOD,'
      '  ORDEN_COMP_MAST.TIPO_INV,'
      '  ORDEN_COMP_MAST.STATUS_CNT,'
      '  ORDEN_COMP_MAST.NUM_ORDEN,'
      '  ORDEN_COMP_MAST.STATUS_ORD,'
      '  ORDEN_COMP_MAST.AREA_ORDEN,'
      '  ORDEN_COMP_MAST.CIA_KEY,'
      '  ORDEN_COMP_MAST.NUMERO_NCF,'
      '  PROVEEDORES.DESCRIPCION,'
      '  PROVEEDORES.CIUDAD,'
      '  PROVEEDORES.CALYYNUM,'
      '  PROVEEDORES.TELEFONO,'
      '  PROVEEDORES.FAX,'
      '  PROVEEDORES.EMAIL,'
      '  PROVEEDORES.MOVIL1,'
      '  PROVEEDORES.MOVIL2,'
      '  PROVEEDORES.TELEFONO2,'
      '  PROVEEDORES.TELEFONO3,'
      '  PROVEEDORES.EXTENSIONES,'
      '  PROVEEDORES.CIA_KEY,'
      '  PROVEEDORES.NOMBRE_ABR,'
      '  PROVEEDORES.CONTACTO,'
      '  PROVEEDORES.PAIS,'
      '  PROVEEDORES.RNC_PROVEEDOR'
      'FROM'
      '  SOL_ORDEN_COMP_MAST ORDEN_COMP_MAST'
      
        '  INNER JOIN PROVEEDORES ON (ORDEN_COMP_MAST.CODIGO_PROVEE = PRO' +
        'VEEDORES.CODIGO_CTE)'
      'WHERE'
      'ORDEN_COMP_MAST.STATUS = '#39'A'#39
      'And Num_Orden =:numorden')
    Left = 376
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numorden'
        ParamType = ptInput
      end>
    object qryDatosSolOrdenImpNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'SOL_ORDEN_COMP_MAST.NUMERO'
      Required = True
    end
    object qryDatosSolOrdenImpCODIGO_PROVEE: TIntegerField
      FieldName = 'CODIGO_PROVEE'
      Origin = 'SOL_ORDEN_COMP_MAST.CODIGO_PROVEE'
      Required = True
    end
    object qryDatosSolOrdenImpFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'SOL_ORDEN_COMP_MAST.FECHA'
      Required = True
    end
    object qryDatosSolOrdenImpFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'SOL_ORDEN_COMP_MAST.FPAGO'
    end
    object qryDatosSolOrdenImpCOD_CAJA_CHICA: TIntegerField
      FieldName = 'COD_CAJA_CHICA'
      Origin = 'SOL_ORDEN_COMP_MAST.COD_CAJA_CHICA'
    end
    object qryDatosSolOrdenImpCODIGO_BANCO: TIntegerField
      FieldName = 'CODIGO_BANCO'
      Origin = 'SOL_ORDEN_COMP_MAST.CODIGO_BANCO'
    end
    object qryDatosSolOrdenImpCUENTABANCO: TIBStringField
      FieldName = 'CUENTABANCO'
      Origin = 'SOL_ORDEN_COMP_MAST.CUENTABANCO'
    end
    object qryDatosSolOrdenImpOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'SOL_ORDEN_COMP_MAST.OBSERVACION'
      Size = 40
    end
    object qryDatosSolOrdenImpMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'SOL_ORDEN_COMP_MAST.MONTO'
    end
    object qryDatosSolOrdenImpSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'SOL_ORDEN_COMP_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosSolOrdenImpIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'SOL_ORDEN_COMP_MAST.IN_POR'
      Size = 12
    end
    object qryDatosSolOrdenImpFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'SOL_ORDEN_COMP_MAST.FECHA_IN'
    end
    object qryDatosSolOrdenImpMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'SOL_ORDEN_COMP_MAST.MOD_POR'
      Size = 12
    end
    object qryDatosSolOrdenImpFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'SOL_ORDEN_COMP_MAST.FECHA_MOD'
    end
    object qryDatosSolOrdenImpTIPO_INV: TSmallintField
      FieldName = 'TIPO_INV'
      Origin = 'SOL_ORDEN_COMP_MAST.TIPO_INV'
    end
    object qryDatosSolOrdenImpSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'SOL_ORDEN_COMP_MAST.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryDatosSolOrdenImpNUM_ORDEN: TIntegerField
      FieldName = 'NUM_ORDEN'
      Origin = 'SOL_ORDEN_COMP_MAST.NUM_ORDEN'
    end
    object qryDatosSolOrdenImpSTATUS_ORD: TIBStringField
      FieldName = 'STATUS_ORD'
      Origin = 'SOL_ORDEN_COMP_MAST.STATUS_ORD'
      FixedChar = True
      Size = 1
    end
    object qryDatosSolOrdenImpAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'SOL_ORDEN_COMP_MAST.AREA_ORDEN'
    end
    object qryDatosSolOrdenImpCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'SOL_ORDEN_COMP_MAST.CIA_KEY'
    end
    object qryDatosSolOrdenImpNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'SOL_ORDEN_COMP_MAST.NUMERO_NCF'
      Size = 21
    end
    object qryDatosSolOrdenImpDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object qryDatosSolOrdenImpCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROVEEDORES.CIUDAD'
    end
    object qryDatosSolOrdenImpCALYYNUM: TIBStringField
      FieldName = 'CALYYNUM'
      Origin = 'PROVEEDORES.CALYYNUM'
      Size = 80
    end
    object qryDatosSolOrdenImpTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object qryDatosSolOrdenImpFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'PROVEEDORES.FAX'
      Size = 12
    end
    object qryDatosSolOrdenImpEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'PROVEEDORES.EMAIL'
      Size = 40
    end
    object qryDatosSolOrdenImpMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'PROVEEDORES.MOVIL1'
    end
    object qryDatosSolOrdenImpMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'PROVEEDORES.MOVIL2'
    end
    object qryDatosSolOrdenImpTELEFONO2: TIBStringField
      FieldName = 'TELEFONO2'
      Origin = 'PROVEEDORES.TELEFONO2'
    end
    object qryDatosSolOrdenImpTELEFONO3: TIBStringField
      FieldName = 'TELEFONO3'
      Origin = 'PROVEEDORES.TELEFONO3'
    end
    object qryDatosSolOrdenImpEXTENSIONES: TIBStringField
      FieldName = 'EXTENSIONES'
      Origin = 'PROVEEDORES.EXTENSIONES'
      Size = 40
    end
    object qryDatosSolOrdenImpCIA_KEY1: TIntegerField
      FieldName = 'CIA_KEY1'
      Origin = 'PROVEEDORES.CIA_KEY'
    end
    object qryDatosSolOrdenImpNOMBRE_ABR: TIBStringField
      FieldName = 'NOMBRE_ABR'
      Origin = 'PROVEEDORES.NOMBRE_ABR'
      Size = 60
    end
    object qryDatosSolOrdenImpCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'PROVEEDORES.CONTACTO'
      Size = 35
    end
    object qryDatosSolOrdenImpPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PROVEEDORES.PAIS'
      Size = 30
    end
    object qryDatosSolOrdenImpRNC_PROVEEDOR: TIBStringField
      FieldName = 'RNC_PROVEEDOR'
      Origin = 'PROVEEDORES.RNC_PROVEEDOR'
      Size = 15
    end
  end
  object qrySolOrdenMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from SOL_ORDEN_COMP_MAST'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into SOL_ORDEN_COMP_MAST'
      
        '  (NUMERO, CODIGO_PROVEE, FECHA, FPAGO, COD_CAJA_CHICA, CODIGO_B' +
        'ANCO, CUENTABANCO, '
      
        '   OBSERVACION, MONTO, STATUS, IN_POR, FECHA_IN, MOD_POR, FECHA_' +
        'MOD, TIPO_INV, '
      
        '   STATUS_CNT, NUM_ORDEN, STATUS_ORD, AREA_ORDEN, CIA_KEY, NUMER' +
        'O_NCF)'
      'values'
      
        '  (:NUMERO, :CODIGO_PROVEE, :FECHA, :FPAGO, :COD_CAJA_CHICA, :CO' +
        'DIGO_BANCO, '
      
        '   :CUENTABANCO, :OBSERVACION, :MONTO, :STATUS, :IN_POR, :FECHA_' +
        'IN, :MOD_POR, '
      
        '   :FECHA_MOD, :TIPO_INV, :STATUS_CNT, :NUM_ORDEN, :STATUS_ORD, ' +
        ':AREA_ORDEN, '
      '   :CIA_KEY, :NUMERO_NCF)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  CODIGO_PROVEE,'
      '  FECHA,'
      '  FPAGO,'
      '  COD_CAJA_CHICA,'
      '  CODIGO_BANCO,'
      '  CUENTABANCO,'
      '  OBSERVACION,'
      '  MONTO,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD,'
      '  TIPO_INV,'
      '  STATUS_CNT,'
      '  NUM_ORDEN,'
      '  STATUS_ORD,'
      '  AREA_ORDEN,'
      '  CIA_KEY,'
      '  NUMERO_NCF'
      'from SOL_ORDEN_COMP_MAST '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select * From SOL_ORDEN_COMP_MAST'
      'Where Fecha between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update SOL_ORDEN_COMP_MAST'
      'set'
      '  NUMERO = :NUMERO,'
      '  CODIGO_PROVEE = :CODIGO_PROVEE,'
      '  FECHA = :FECHA,'
      '  FPAGO = :FPAGO,'
      '  COD_CAJA_CHICA = :COD_CAJA_CHICA,'
      '  CODIGO_BANCO = :CODIGO_BANCO,'
      '  CUENTABANCO = :CUENTABANCO,'
      '  OBSERVACION = :OBSERVACION,'
      '  MONTO = :MONTO,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  TIPO_INV = :TIPO_INV,'
      '  STATUS_CNT = :STATUS_CNT,'
      '  NUM_ORDEN = :NUM_ORDEN,'
      '  STATUS_ORD = :STATUS_ORD,'
      '  AREA_ORDEN = :AREA_ORDEN,'
      '  CIA_KEY = :CIA_KEY,'
      '  NUMERO_NCF = :NUMERO_NCF'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 360
    Top = 32
    object qrySolOrdenMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'SOL_ORDEN_COMP_MAST.NUMERO'
      Required = True
    end
    object qrySolOrdenMasterCODIGO_PROVEE: TIntegerField
      FieldName = 'CODIGO_PROVEE'
      Origin = 'SOL_ORDEN_COMP_MAST.CODIGO_PROVEE'
      Required = True
    end
    object qrySolOrdenMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'SOL_ORDEN_COMP_MAST.FECHA'
      Required = True
    end
    object qrySolOrdenMasterFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'SOL_ORDEN_COMP_MAST.FPAGO'
    end
    object qrySolOrdenMasterCOD_CAJA_CHICA: TIntegerField
      FieldName = 'COD_CAJA_CHICA'
      Origin = 'SOL_ORDEN_COMP_MAST.COD_CAJA_CHICA'
    end
    object qrySolOrdenMasterCODIGO_BANCO: TIntegerField
      FieldName = 'CODIGO_BANCO'
      Origin = 'SOL_ORDEN_COMP_MAST.CODIGO_BANCO'
    end
    object qrySolOrdenMasterCUENTABANCO: TIBStringField
      FieldName = 'CUENTABANCO'
      Origin = 'SOL_ORDEN_COMP_MAST.CUENTABANCO'
    end
    object qrySolOrdenMasterOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'SOL_ORDEN_COMP_MAST.OBSERVACION'
      Size = 40
    end
    object qrySolOrdenMasterMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'SOL_ORDEN_COMP_MAST.MONTO'
    end
    object qrySolOrdenMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'SOL_ORDEN_COMP_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object qrySolOrdenMasterIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'SOL_ORDEN_COMP_MAST.IN_POR'
      Size = 12
    end
    object qrySolOrdenMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'SOL_ORDEN_COMP_MAST.FECHA_IN'
    end
    object qrySolOrdenMasterMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'SOL_ORDEN_COMP_MAST.MOD_POR'
      Size = 12
    end
    object qrySolOrdenMasterFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'SOL_ORDEN_COMP_MAST.FECHA_MOD'
    end
    object qrySolOrdenMasterTIPO_INV: TSmallintField
      FieldName = 'TIPO_INV'
      Origin = 'SOL_ORDEN_COMP_MAST.TIPO_INV'
    end
    object qrySolOrdenMasterSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'SOL_ORDEN_COMP_MAST.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qrySolOrdenMasterNUM_ORDEN: TIntegerField
      FieldName = 'NUM_ORDEN'
      Origin = 'SOL_ORDEN_COMP_MAST.NUM_ORDEN'
    end
    object qrySolOrdenMasterSTATUS_ORD: TIBStringField
      FieldName = 'STATUS_ORD'
      Origin = 'SOL_ORDEN_COMP_MAST.STATUS_ORD'
      FixedChar = True
      Size = 1
    end
    object qrySolOrdenMasterAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'SOL_ORDEN_COMP_MAST.AREA_ORDEN'
    end
    object qrySolOrdenMasterCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'SOL_ORDEN_COMP_MAST.CIA_KEY'
    end
    object qrySolOrdenMasterNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'SOL_ORDEN_COMP_MAST.NUMERO_NCF'
      Size = 21
    end
  end
  object QrySolOrdenDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from SOL_ORDEN_COMP_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into SOL_ORDEN_COMP_DET'
      
        '  (SERIE, NUMERO, COD_SERV_PROD, DEPARTAMENTO, OBSERVACION, CANT' +
        'IDAD, VALOR, '
      
        '   STATUS, IN_POR, FECHA_IN, MOD_POR, FECHA_MOD, NUMERO_DOCUMENT' +
        'O, NUMERO_FACTURA, '
      
        '   COD_CTA_CONCEPTO, TIPOSERVICIO, SUBTIPOSERV, NO_SERIE_RES, CO' +
        'DIGO_CONDUCTOR, '
      
        '   SERIE_CDC, CODIGO_SERVCOSTO, NUMEROOLD, PRECIO, AREA_ORDEN, I' +
        'TBI_DET, '
      '   PORC_DESC_DET, MONTO_DESCUENTO)'
      'values'
      
        '  (:SERIE, :NUMERO, :COD_SERV_PROD, :DEPARTAMENTO, :OBSERVACION,' +
        ' :CANTIDAD, '
      
        '   :VALOR, :STATUS, :IN_POR, :FECHA_IN, :MOD_POR, :FECHA_MOD, :N' +
        'UMERO_DOCUMENTO, '
      
        '   :NUMERO_FACTURA, :COD_CTA_CONCEPTO, :TIPOSERVICIO, :SUBTIPOSE' +
        'RV, :NO_SERIE_RES, '
      
        '   :CODIGO_CONDUCTOR, :SERIE_CDC, :CODIGO_SERVCOSTO, :NUMEROOLD,' +
        ' :PRECIO, '
      '   :AREA_ORDEN, :ITBI_DET, :PORC_DESC_DET, :MONTO_DESCUENTO)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  COD_SERV_PROD,'
      '  DEPARTAMENTO,'
      '  OBSERVACION,'
      '  CANTIDAD,'
      '  VALOR,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD,'
      '  NUMERO_DOCUMENTO,'
      '  NUMERO_FACTURA,'
      '  COD_CTA_CONCEPTO,'
      '  TIPOSERVICIO,'
      '  SUBTIPOSERV,'
      '  NO_SERIE_RES,'
      '  CODIGO_CONDUCTOR,'
      '  SERIE_CDC,'
      '  CODIGO_SERVCOSTO,'
      '  NUMEROOLD,'
      '  PRECIO,'
      '  AREA_ORDEN,'
      '  ITBI_DET,'
      '  PORC_DESC_DET,'
      '  MONTO_DESCUENTO'
      'from SOL_ORDEN_COMP_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select  * From SOL_ORDEN_COMP_DET'
      'Where SERIE =:serie')
    ModifySQL.Strings = (
      'update SOL_ORDEN_COMP_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  COD_SERV_PROD = :COD_SERV_PROD,'
      '  DEPARTAMENTO = :DEPARTAMENTO,'
      '  OBSERVACION = :OBSERVACION,'
      '  CANTIDAD = :CANTIDAD,'
      '  VALOR = :VALOR,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  NUMERO_DOCUMENTO = :NUMERO_DOCUMENTO,'
      '  NUMERO_FACTURA = :NUMERO_FACTURA,'
      '  COD_CTA_CONCEPTO = :COD_CTA_CONCEPTO,'
      '  TIPOSERVICIO = :TIPOSERVICIO,'
      '  SUBTIPOSERV = :SUBTIPOSERV,'
      '  NO_SERIE_RES = :NO_SERIE_RES,'
      '  CODIGO_CONDUCTOR = :CODIGO_CONDUCTOR,'
      '  SERIE_CDC = :SERIE_CDC,'
      '  CODIGO_SERVCOSTO = :CODIGO_SERVCOSTO,'
      '  NUMEROOLD = :NUMEROOLD,'
      '  PRECIO = :PRECIO,'
      '  AREA_ORDEN = :AREA_ORDEN,'
      '  ITBI_DET = :ITBI_DET,'
      '  PORC_DESC_DET = :PORC_DESC_DET,'
      '  MONTO_DESCUENTO = :MONTO_DESCUENTO'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 384
    Top = 88
    object QrySolOrdenDetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'SOL_ORDEN_COMP_DET.SERIE'
      Required = True
    end
    object QrySolOrdenDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'SOL_ORDEN_COMP_DET.NUMERO'
      Required = True
    end
    object QrySolOrdenDetCOD_SERV_PROD: TIntegerField
      FieldName = 'COD_SERV_PROD'
      Origin = 'SOL_ORDEN_COMP_DET.COD_SERV_PROD'
    end
    object QrySolOrdenDetDEPARTAMENTO: TIntegerField
      FieldName = 'DEPARTAMENTO'
      Origin = 'SOL_ORDEN_COMP_DET.DEPARTAMENTO'
    end
    object QrySolOrdenDetOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'SOL_ORDEN_COMP_DET.OBSERVACION'
      Size = 80
    end
    object QrySolOrdenDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'SOL_ORDEN_COMP_DET.CANTIDAD'
    end
    object QrySolOrdenDetVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'SOL_ORDEN_COMP_DET.VALOR'
    end
    object QrySolOrdenDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'SOL_ORDEN_COMP_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object QrySolOrdenDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'SOL_ORDEN_COMP_DET.IN_POR'
      Size = 12
    end
    object QrySolOrdenDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'SOL_ORDEN_COMP_DET.FECHA_IN'
    end
    object QrySolOrdenDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'SOL_ORDEN_COMP_DET.MOD_POR'
      Size = 12
    end
    object QrySolOrdenDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'SOL_ORDEN_COMP_DET.FECHA_MOD'
    end
    object QrySolOrdenDetNUMERO_DOCUMENTO: TIntegerField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'SOL_ORDEN_COMP_DET.NUMERO_DOCUMENTO'
    end
    object QrySolOrdenDetNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'SOL_ORDEN_COMP_DET.NUMERO_FACTURA'
    end
    object QrySolOrdenDetCOD_CTA_CONCEPTO: TIntegerField
      FieldName = 'COD_CTA_CONCEPTO'
      Origin = 'SOL_ORDEN_COMP_DET.COD_CTA_CONCEPTO'
    end
    object QrySolOrdenDetTIPOSERVICIO: TIntegerField
      FieldName = 'TIPOSERVICIO'
      Origin = 'SOL_ORDEN_COMP_DET.TIPOSERVICIO'
    end
    object QrySolOrdenDetSUBTIPOSERV: TIntegerField
      FieldName = 'SUBTIPOSERV'
      Origin = 'SOL_ORDEN_COMP_DET.SUBTIPOSERV'
    end
    object QrySolOrdenDetNO_SERIE_RES: TIntegerField
      FieldName = 'NO_SERIE_RES'
      Origin = 'SOL_ORDEN_COMP_DET.NO_SERIE_RES'
    end
    object QrySolOrdenDetCODIGO_CONDUCTOR: TIntegerField
      FieldName = 'CODIGO_CONDUCTOR'
      Origin = 'SOL_ORDEN_COMP_DET.CODIGO_CONDUCTOR'
    end
    object QrySolOrdenDetSERIE_CDC: TIntegerField
      FieldName = 'SERIE_CDC'
      Origin = 'SOL_ORDEN_COMP_DET.SERIE_CDC'
    end
    object QrySolOrdenDetCODIGO_SERVCOSTO: TIntegerField
      FieldName = 'CODIGO_SERVCOSTO'
      Origin = 'SOL_ORDEN_COMP_DET.CODIGO_SERVCOSTO'
    end
    object QrySolOrdenDetNUMEROOLD: TIntegerField
      FieldName = 'NUMEROOLD'
      Origin = 'SOL_ORDEN_COMP_DET.NUMEROOLD'
    end
    object QrySolOrdenDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'SOL_ORDEN_COMP_DET.PRECIO'
    end
    object QrySolOrdenDetAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'SOL_ORDEN_COMP_DET.AREA_ORDEN'
    end
    object QrySolOrdenDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'SOL_ORDEN_COMP_DET.ITBI_DET'
    end
    object QrySolOrdenDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'SOL_ORDEN_COMP_DET.PORC_DESC_DET'
    end
    object QrySolOrdenDetMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'SOL_ORDEN_COMP_DET.MONTO_DESCUENTO'
    end
  end
  object tblMarcaVehiculo: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDMARCA'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'MARCA_VEHICULO'
    Left = 368
    Top = 256
    object tblMarcaVehiculoIDMARCA: TSmallintField
      FieldName = 'IDMARCA'
    end
    object tblMarcaVehiculoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
    end
  end
  object dstblMarcaVehiculo: TDataSource
    DataSet = tblMarcaVehiculo
    Left = 368
    Top = 328
  end
  object dstblTipoVehiculo: TDataSource
    DataSet = tblTipoVehiculo
    Left = 440
    Top = 296
  end
  object tblTipoVehiculo: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDTIPOVEH'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 20
      end>
    StoreDefs = True
    TableName = 'TIPO_VEHICULO'
    Left = 440
    Top = 240
    object tblTipoVehiculoIDTIPOVEH: TSmallintField
      FieldName = 'IDTIPOVEH'
    end
    object tblTipoVehiculoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
    end
  end
  object tblPolizaMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblPolizaMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from POLIZASEGUROS_MASTER'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into POLIZASEGUROS_MASTER'
      
        '  (NUMERO, COD_PROVEEDOR, POLIZA, FECHA, STATUS, COD_USUARIO, FE' +
        'CHA_IN, '
      '   IN_POR, FECHA_MOD, MOD_POR, CODIGO_CTE)'
      'values'
      
        '  (:NUMERO, :COD_PROVEEDOR, :POLIZA, :FECHA, :STATUS, :COD_USUAR' +
        'IO, :FECHA_IN, '
      '   :IN_POR, :FECHA_MOD, :MOD_POR, :CODIGO_CTE)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  COD_PROVEEDOR,'
      '  POLIZA,'
      '  FECHA,'
      '  STATUS,'
      '  COD_USUARIO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  CODIGO_CTE'
      'from POLIZASEGUROS_MASTER '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'select * from POLIZASEGUROS_MASTER'
      'Where fecha between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update POLIZASEGUROS_MASTER'
      'set'
      '  NUMERO = :NUMERO,'
      '  COD_PROVEEDOR = :COD_PROVEEDOR,'
      '  POLIZA = :POLIZA,'
      '  FECHA = :FECHA,'
      '  STATUS = :STATUS,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  CODIGO_CTE = :CODIGO_CTE'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_NUM_POLIZAMASTER'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 136
    Top = 392
    object tblPolizaMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'POLIZASEGUROS_MASTER.NUMERO'
      Required = True
    end
    object tblPolizaMasterCOD_PROVEEDOR: TIntegerField
      FieldName = 'COD_PROVEEDOR'
      Origin = 'POLIZASEGUROS_MASTER.COD_PROVEEDOR'
      Required = True
    end
    object tblPolizaMasterPOLIZA: TIBStringField
      FieldName = 'POLIZA'
      Origin = 'POLIZASEGUROS_MASTER.POLIZA'
      Required = True
    end
    object tblPolizaMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'POLIZASEGUROS_MASTER.FECHA'
      Required = True
    end
    object tblPolizaMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'POLIZASEGUROS_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblPolizaMasterCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'POLIZASEGUROS_MASTER.COD_USUARIO'
    end
    object tblPolizaMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'POLIZASEGUROS_MASTER.FECHA_IN'
    end
    object tblPolizaMasterIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'POLIZASEGUROS_MASTER.IN_POR'
      Size = 12
    end
    object tblPolizaMasterFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'POLIZASEGUROS_MASTER.FECHA_MOD'
    end
    object tblPolizaMasterMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'POLIZASEGUROS_MASTER.MOD_POR'
      Size = 12
    end
    object tblPolizaMasterCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'POLIZASEGUROS_MASTER.CODIGO_CTE'
    end
  end
  object tblPolizaDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from POLIZASEGUROS_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into POLIZASEGUROS_DET'
      
        '  (SERIE, NUMERO, INICIOVIGENCIA, FINVIGENCIA, IDMARCA, IDTIPOVE' +
        'H, NOMBREASEGURADO, '
      
        '   APELLIDOASEGURADO, REGISTRO, CHASSIS, FIANZAJUDICIAL, ANO_VEH' +
        'ICULO, '
      
        '   STATUS, COD_USUARIO, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, NO' +
        '_VEHICULO, '
      '   COLOR, CASACONDUCTOR, AUTOASISTENCIA)'
      'values'
      
        '  (:SERIE, :NUMERO, :INICIOVIGENCIA, :FINVIGENCIA, :IDMARCA, :ID' +
        'TIPOVEH, '
      
        '   :NOMBREASEGURADO, :APELLIDOASEGURADO, :REGISTRO, :CHASSIS, :F' +
        'IANZAJUDICIAL, '
      
        '   :ANO_VEHICULO, :STATUS, :COD_USUARIO, :FECHA_IN, :IN_POR, :FE' +
        'CHA_MOD, '
      
        '   :MOD_POR, :NO_VEHICULO, :COLOR, :CASACONDUCTOR, :AUTOASISTENC' +
        'IA)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  INICIOVIGENCIA,'
      '  FINVIGENCIA,'
      '  IDMARCA,'
      '  IDTIPOVEH,'
      '  NOMBREASEGURADO,'
      '  APELLIDOASEGURADO,'
      '  REGISTRO,'
      '  CHASSIS,'
      '  FIANZAJUDICIAL,'
      '  ANO_VEHICULO,'
      '  STATUS,'
      '  COD_USUARIO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  NO_VEHICULO,'
      '  COLOR,'
      '  CASACONDUCTOR,'
      '  AUTOASISTENCIA'
      'from POLIZASEGUROS_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select * from POLIZASEGUROS_DET'
      'Where numero =:numero')
    ModifySQL.Strings = (
      'update POLIZASEGUROS_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  INICIOVIGENCIA = :INICIOVIGENCIA,'
      '  FINVIGENCIA = :FINVIGENCIA,'
      '  IDMARCA = :IDMARCA,'
      '  IDTIPOVEH = :IDTIPOVEH,'
      '  NOMBREASEGURADO = :NOMBREASEGURADO,'
      '  APELLIDOASEGURADO = :APELLIDOASEGURADO,'
      '  REGISTRO = :REGISTRO,'
      '  CHASSIS = :CHASSIS,'
      '  FIANZAJUDICIAL = :FIANZAJUDICIAL,'
      '  ANO_VEHICULO = :ANO_VEHICULO,'
      '  STATUS = :STATUS,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  NO_VEHICULO = :NO_VEHICULO,'
      '  COLOR = :COLOR,'
      '  CASACONDUCTOR = :CASACONDUCTOR,'
      '  AUTOASISTENCIA = :AUTOASISTENCIA'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'gen_num_polizadet'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 296
    Top = 416
    object tblPolizaDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'POLIZASEGUROS_DET.SERIE'
      Required = True
    end
    object tblPolizaDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'POLIZASEGUROS_DET.NUMERO'
      Required = True
    end
    object tblPolizaDetINICIOVIGENCIA: TDateTimeField
      FieldName = 'INICIOVIGENCIA'
      Origin = 'POLIZASEGUROS_DET.INICIOVIGENCIA'
      Required = True
    end
    object tblPolizaDetFINVIGENCIA: TDateTimeField
      FieldName = 'FINVIGENCIA'
      Origin = 'POLIZASEGUROS_DET.FINVIGENCIA'
      Required = True
    end
    object tblPolizaDetIDMARCA: TSmallintField
      FieldName = 'IDMARCA'
      Origin = 'POLIZASEGUROS_DET.IDMARCA'
      Required = True
    end
    object tblPolizaDetIDTIPOVEH: TSmallintField
      FieldName = 'IDTIPOVEH'
      Origin = 'POLIZASEGUROS_DET.IDTIPOVEH'
      Required = True
    end
    object tblPolizaDetNOMBREASEGURADO: TIBStringField
      FieldName = 'NOMBREASEGURADO'
      Origin = 'POLIZASEGUROS_DET.NOMBREASEGURADO'
      Size = 40
    end
    object tblPolizaDetAPELLIDOASEGURADO: TIBStringField
      FieldName = 'APELLIDOASEGURADO'
      Origin = 'POLIZASEGUROS_DET.APELLIDOASEGURADO'
      Size = 40
    end
    object tblPolizaDetREGISTRO: TIBStringField
      FieldName = 'REGISTRO'
      Origin = 'POLIZASEGUROS_DET.REGISTRO'
      FixedChar = True
      Size = 15
    end
    object tblPolizaDetCHASSIS: TIBStringField
      FieldName = 'CHASSIS'
      Origin = 'POLIZASEGUROS_DET.CHASSIS'
      Size = 30
    end
    object tblPolizaDetFIANZAJUDICIAL: TFloatField
      FieldName = 'FIANZAJUDICIAL'
      Origin = 'POLIZASEGUROS_DET.FIANZAJUDICIAL'
    end
    object tblPolizaDetANO_VEHICULO: TIntegerField
      FieldName = 'ANO_VEHICULO'
      Origin = 'POLIZASEGUROS_DET.ANO_VEHICULO'
    end
    object tblPolizaDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'POLIZASEGUROS_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblPolizaDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'POLIZASEGUROS_DET.COD_USUARIO'
    end
    object tblPolizaDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'POLIZASEGUROS_DET.FECHA_IN'
    end
    object tblPolizaDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'POLIZASEGUROS_DET.IN_POR'
      Size = 12
    end
    object tblPolizaDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'POLIZASEGUROS_DET.FECHA_MOD'
    end
    object tblPolizaDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'POLIZASEGUROS_DET.MOD_POR'
      Size = 12
    end
    object tblPolizaDetNO_VEHICULO: TIntegerField
      FieldName = 'NO_VEHICULO'
      Origin = 'POLIZASEGUROS_DET.NO_VEHICULO'
    end
    object tblPolizaDetCOLOR: TIBStringField
      FieldName = 'COLOR'
      Origin = 'POLIZASEGUROS_DET.COLOR'
      Size = 12
    end
    object tblPolizaDetCASACONDUCTOR: TSmallintField
      FieldName = 'CASACONDUCTOR'
      Origin = 'POLIZASEGUROS_DET.CASACONDUCTOR'
    end
    object tblPolizaDetAUTOASISTENCIA: TSmallintField
      FieldName = 'AUTOASISTENCIA'
      Origin = 'POLIZASEGUROS_DET.AUTOASISTENCIA'
    end
  end
  object dstblPolizaMaster: TDataSource
    AutoEdit = False
    DataSet = tblPolizaMaster
    Left = 56
    Top = 408
  end
  object dstblPolizaDet: TDataSource
    AutoEdit = False
    DataSet = tblPolizaDet
    Left = 192
    Top = 448
  end
  object qryRepPoliza: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepPolizaAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select m.*,  p.descripcion nombreproveedor from POLIZASEGUROS_MA' +
        'STER m, proveedores p'
      'Where P.CODIGO_CTE = M.COD_PROVEEDOR'
      'AND m.poliza =:poliza')
    Left = 472
    Top = 360
    ParamData = <
      item
        DataType = ftString
        Name = 'poliza'
        ParamType = ptInput
      end>
    object qryRepPolizaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'POLIZASEGUROS_MASTER.NUMERO'
      Required = True
    end
    object qryRepPolizaCOD_PROVEEDOR: TIntegerField
      FieldName = 'COD_PROVEEDOR'
      Origin = 'POLIZASEGUROS_MASTER.COD_PROVEEDOR'
      Required = True
    end
    object qryRepPolizaPOLIZA: TIBStringField
      FieldName = 'POLIZA'
      Origin = 'POLIZASEGUROS_MASTER.POLIZA'
      Required = True
    end
    object qryRepPolizaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'POLIZASEGUROS_MASTER.FECHA'
      Required = True
    end
    object qryRepPolizaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'POLIZASEGUROS_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepPolizaCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'POLIZASEGUROS_MASTER.COD_USUARIO'
    end
    object qryRepPolizaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'POLIZASEGUROS_MASTER.FECHA_IN'
    end
    object qryRepPolizaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'POLIZASEGUROS_MASTER.IN_POR'
      Size = 12
    end
    object qryRepPolizaFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'POLIZASEGUROS_MASTER.FECHA_MOD'
    end
    object qryRepPolizaMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'POLIZASEGUROS_MASTER.MOD_POR'
      Size = 12
    end
    object qryRepPolizaNOMBREPROVEEDOR: TIBStringField
      FieldName = 'NOMBREPROVEEDOR'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object qryRepPolizaCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'POLIZASEGUROS_MASTER.CODIGO_CTE'
    end
  end
  object qryRepPolizaDEt: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select d.*, t.descripcion tipovehDesc, m.descripcion marca,'
      'iif(d.apellidoasegurado is null,'#39#39',d.apellidoasegurado) ||'#39' '#39'||'
      
        'iif(d.nombreasegurado is null,'#39#39',d.apellidoasegurado) Nombreaseg' +
        'uradoCte'
      ''
      'from POLIZASEGUROS_DET d, tipo_vehiculo t, marca_vehiculo m'
      'Where numero =:numero'
      'And t.idtipoveh = d.idtipoveh'
      'And m.idmarca = d.idmarca')
    Left = 472
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryRepPolizaDEtSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'POLIZASEGUROS_DET.SERIE'
      Required = True
    end
    object qryRepPolizaDEtNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'POLIZASEGUROS_DET.NUMERO'
      Required = True
    end
    object qryRepPolizaDEtINICIOVIGENCIA: TDateTimeField
      FieldName = 'INICIOVIGENCIA'
      Origin = 'POLIZASEGUROS_DET.INICIOVIGENCIA'
      Required = True
    end
    object qryRepPolizaDEtFINVIGENCIA: TDateTimeField
      FieldName = 'FINVIGENCIA'
      Origin = 'POLIZASEGUROS_DET.FINVIGENCIA'
      Required = True
    end
    object qryRepPolizaDEtIDMARCA: TSmallintField
      FieldName = 'IDMARCA'
      Origin = 'POLIZASEGUROS_DET.IDMARCA'
      Required = True
    end
    object qryRepPolizaDEtIDTIPOVEH: TSmallintField
      FieldName = 'IDTIPOVEH'
      Origin = 'POLIZASEGUROS_DET.IDTIPOVEH'
      Required = True
    end
    object qryRepPolizaDEtNOMBREASEGURADO: TIBStringField
      FieldName = 'NOMBREASEGURADO'
      Origin = 'POLIZASEGUROS_DET.NOMBREASEGURADO'
      Size = 40
    end
    object qryRepPolizaDEtAPELLIDOASEGURADO: TIBStringField
      FieldName = 'APELLIDOASEGURADO'
      Origin = 'POLIZASEGUROS_DET.APELLIDOASEGURADO'
      Size = 40
    end
    object qryRepPolizaDEtREGISTRO: TIBStringField
      FieldName = 'REGISTRO'
      Origin = 'POLIZASEGUROS_DET.REGISTRO'
      FixedChar = True
      Size = 15
    end
    object qryRepPolizaDEtCHASSIS: TIBStringField
      FieldName = 'CHASSIS'
      Origin = 'POLIZASEGUROS_DET.CHASSIS'
      Size = 30
    end
    object qryRepPolizaDEtFIANZAJUDICIAL: TFloatField
      FieldName = 'FIANZAJUDICIAL'
      Origin = 'POLIZASEGUROS_DET.FIANZAJUDICIAL'
    end
    object qryRepPolizaDEtANO_VEHICULO: TIntegerField
      FieldName = 'ANO_VEHICULO'
      Origin = 'POLIZASEGUROS_DET.ANO_VEHICULO'
    end
    object qryRepPolizaDEtSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'POLIZASEGUROS_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepPolizaDEtCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'POLIZASEGUROS_DET.COD_USUARIO'
    end
    object qryRepPolizaDEtFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'POLIZASEGUROS_DET.FECHA_IN'
    end
    object qryRepPolizaDEtIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'POLIZASEGUROS_DET.IN_POR'
      Size = 12
    end
    object qryRepPolizaDEtFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'POLIZASEGUROS_DET.FECHA_MOD'
    end
    object qryRepPolizaDEtMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'POLIZASEGUROS_DET.MOD_POR'
      Size = 12
    end
    object qryRepPolizaDEtNO_VEHICULO: TIntegerField
      FieldName = 'NO_VEHICULO'
      Origin = 'POLIZASEGUROS_DET.NO_VEHICULO'
    end
    object qryRepPolizaDEtTIPOVEHDESC: TIBStringField
      FieldName = 'TIPOVEHDESC'
      Origin = 'TIPO_VEHICULO.DESCRIPCION'
    end
    object qryRepPolizaDEtMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'MARCA_VEHICULO.DESCRIPCION'
    end
    object qryRepPolizaDEtCOLOR: TIBStringField
      FieldName = 'COLOR'
      Origin = 'POLIZASEGUROS_DET.COLOR'
      Size = 12
    end
    object qryRepPolizaDEtCASACONDUCTOR: TSmallintField
      FieldName = 'CASACONDUCTOR'
      Origin = 'POLIZASEGUROS_DET.CASACONDUCTOR'
    end
    object qryRepPolizaDEtAUTOASISTENCIA: TSmallintField
      FieldName = 'AUTOASISTENCIA'
      Origin = 'POLIZASEGUROS_DET.AUTOASISTENCIA'
    end
    object qryRepPolizaDEtNOMBREASEGURADOCTE: TIBStringField
      FieldName = 'NOMBREASEGURADOCTE'
      Size = 81
    end
  end
  object qryViewOrdenCompMast: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryViewOrdenCompMastAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From VIEW_ORDEN_COMPMASTER')
    Left = 480
    Top = 56
    object qryViewOrdenCompMastNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_ORDEN_COMPMASTER.NUMERO'
    end
    object qryViewOrdenCompMastCODIGO_PROVEE: TIntegerField
      FieldName = 'CODIGO_PROVEE'
      Origin = 'VIEW_ORDEN_COMPMASTER.CODIGO_PROVEE'
    end
    object qryViewOrdenCompMastFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VIEW_ORDEN_COMPMASTER.FECHA'
    end
    object qryViewOrdenCompMastFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'VIEW_ORDEN_COMPMASTER.FPAGO'
    end
    object qryViewOrdenCompMastCOD_CAJA_CHICA: TIntegerField
      FieldName = 'COD_CAJA_CHICA'
      Origin = 'VIEW_ORDEN_COMPMASTER.COD_CAJA_CHICA'
    end
    object qryViewOrdenCompMastCODIGO_BANCO: TIntegerField
      FieldName = 'CODIGO_BANCO'
      Origin = 'VIEW_ORDEN_COMPMASTER.CODIGO_BANCO'
    end
    object qryViewOrdenCompMastCUENTABANCO: TIBStringField
      FieldName = 'CUENTABANCO'
      Origin = 'VIEW_ORDEN_COMPMASTER.CUENTABANCO'
    end
    object qryViewOrdenCompMastOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VIEW_ORDEN_COMPMASTER.OBSERVACION'
      Size = 40
    end
    object qryViewOrdenCompMastMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'VIEW_ORDEN_COMPMASTER.MONTO'
    end
    object qryViewOrdenCompMastSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VIEW_ORDEN_COMPMASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryViewOrdenCompMastTIPO_INV: TSmallintField
      FieldName = 'TIPO_INV'
      Origin = 'VIEW_ORDEN_COMPMASTER.TIPO_INV'
    end
    object qryViewOrdenCompMastSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VIEW_ORDEN_COMPMASTER.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryViewOrdenCompMastNUM_ORDEN: TIntegerField
      FieldName = 'NUM_ORDEN'
      Origin = 'VIEW_ORDEN_COMPMASTER.NUM_ORDEN'
    end
    object qryViewOrdenCompMastSTATUS_ORD: TIBStringField
      FieldName = 'STATUS_ORD'
      Origin = 'VIEW_ORDEN_COMPMASTER.STATUS_ORD'
      FixedChar = True
      Size = 1
    end
    object qryViewOrdenCompMastAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'VIEW_ORDEN_COMPMASTER.AREA_ORDEN'
    end
    object qryViewOrdenCompMastCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VIEW_ORDEN_COMPMASTER.CIA_KEY'
    end
    object qryViewOrdenCompMastNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'VIEW_ORDEN_COMPMASTER.NUMERO_NCF'
      Size = 21
    end
    object qryViewOrdenCompMastNOMBREPROVEEDOR: TIBStringField
      FieldName = 'NOMBREPROVEEDOR'
      Origin = 'VIEW_ORDEN_COMPMASTER.NOMBREPROVEEDOR'
      Size = 80
    end
  end
  object qryViewOrdenCompDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From  VIEW_ORDEN_COMPDET'
      'where numero=:numero'
      '')
    Left = 663
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryViewOrdenCompDetSERIE: TFloatField
      FieldName = 'SERIE'
      Origin = 'VIEW_ORDEN_COMPDET.SERIE'
    end
    object qryViewOrdenCompDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_ORDEN_COMPDET.NUMERO'
    end
    object qryViewOrdenCompDetCOD_SERV_PROD: TIntegerField
      FieldName = 'COD_SERV_PROD'
      Origin = 'VIEW_ORDEN_COMPDET.COD_SERV_PROD'
    end
    object qryViewOrdenCompDetDEPARTAMENTO: TIntegerField
      FieldName = 'DEPARTAMENTO'
      Origin = 'VIEW_ORDEN_COMPDET.DEPARTAMENTO'
    end
    object qryViewOrdenCompDetOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VIEW_ORDEN_COMPDET.OBSERVACION'
      Size = 80
    end
    object qryViewOrdenCompDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VIEW_ORDEN_COMPDET.CANTIDAD'
    end
    object qryViewOrdenCompDetVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VIEW_ORDEN_COMPDET.VALOR'
    end
    object qryViewOrdenCompDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VIEW_ORDEN_COMPDET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryViewOrdenCompDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VIEW_ORDEN_COMPDET.IN_POR'
      Size = 12
    end
    object qryViewOrdenCompDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VIEW_ORDEN_COMPDET.FECHA_IN'
    end
    object qryViewOrdenCompDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VIEW_ORDEN_COMPDET.MOD_POR'
      Size = 12
    end
    object qryViewOrdenCompDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VIEW_ORDEN_COMPDET.FECHA_MOD'
    end
    object qryViewOrdenCompDetNUMERO_DOCUMENTO: TIntegerField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'VIEW_ORDEN_COMPDET.NUMERO_DOCUMENTO'
    end
    object qryViewOrdenCompDetNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VIEW_ORDEN_COMPDET.NUMERO_FACTURA'
    end
    object qryViewOrdenCompDetCOD_CTA_CONCEPTO: TIntegerField
      FieldName = 'COD_CTA_CONCEPTO'
      Origin = 'VIEW_ORDEN_COMPDET.COD_CTA_CONCEPTO'
    end
    object qryViewOrdenCompDetTIPOSERVICIO: TIntegerField
      FieldName = 'TIPOSERVICIO'
      Origin = 'VIEW_ORDEN_COMPDET.TIPOSERVICIO'
    end
    object qryViewOrdenCompDetSUBTIPOSERV: TIntegerField
      FieldName = 'SUBTIPOSERV'
      Origin = 'VIEW_ORDEN_COMPDET.SUBTIPOSERV'
    end
    object qryViewOrdenCompDetNO_SERIE_RES: TIntegerField
      FieldName = 'NO_SERIE_RES'
      Origin = 'VIEW_ORDEN_COMPDET.NO_SERIE_RES'
    end
    object qryViewOrdenCompDetCODIGO_CONDUCTOR: TIntegerField
      FieldName = 'CODIGO_CONDUCTOR'
      Origin = 'VIEW_ORDEN_COMPDET.CODIGO_CONDUCTOR'
    end
    object qryViewOrdenCompDetSERIE_CDC: TIntegerField
      FieldName = 'SERIE_CDC'
      Origin = 'VIEW_ORDEN_COMPDET.SERIE_CDC'
    end
    object qryViewOrdenCompDetCODIGO_SERVCOSTO: TIntegerField
      FieldName = 'CODIGO_SERVCOSTO'
      Origin = 'VIEW_ORDEN_COMPDET.CODIGO_SERVCOSTO'
    end
    object qryViewOrdenCompDetNUMEROOLD: TIntegerField
      FieldName = 'NUMEROOLD'
      Origin = 'VIEW_ORDEN_COMPDET.NUMEROOLD'
    end
    object qryViewOrdenCompDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VIEW_ORDEN_COMPDET.PRECIO'
    end
    object qryViewOrdenCompDetAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'VIEW_ORDEN_COMPDET.AREA_ORDEN'
    end
    object qryViewOrdenCompDetITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VIEW_ORDEN_COMPDET.ITBI_DET'
    end
    object qryViewOrdenCompDetPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VIEW_ORDEN_COMPDET.PORC_DESC_DET'
    end
    object qryViewOrdenCompDetMONTO_DESCUENTO: TFloatField
      FieldName = 'MONTO_DESCUENTO'
      Origin = 'VIEW_ORDEN_COMPDET.MONTO_DESCUENTO'
    end
  end
  object qryViewOrdenCompMastBase: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From VIEW_ORDEN_COMPMASTER')
    Left = 480
    Top = 8
    object qryViewOrdenCompMastBaseNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VIEW_ORDEN_COMPMASTER.NUMERO'
    end
    object qryViewOrdenCompMastBaseCODIGO_PROVEE: TIntegerField
      FieldName = 'CODIGO_PROVEE'
      Origin = 'VIEW_ORDEN_COMPMASTER.CODIGO_PROVEE'
    end
    object qryViewOrdenCompMastBaseFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VIEW_ORDEN_COMPMASTER.FECHA'
    end
    object qryViewOrdenCompMastBaseFPAGO: TSmallintField
      FieldName = 'FPAGO'
      Origin = 'VIEW_ORDEN_COMPMASTER.FPAGO'
    end
    object qryViewOrdenCompMastBaseCOD_CAJA_CHICA: TIntegerField
      FieldName = 'COD_CAJA_CHICA'
      Origin = 'VIEW_ORDEN_COMPMASTER.COD_CAJA_CHICA'
    end
    object qryViewOrdenCompMastBaseCODIGO_BANCO: TIntegerField
      FieldName = 'CODIGO_BANCO'
      Origin = 'VIEW_ORDEN_COMPMASTER.CODIGO_BANCO'
    end
    object qryViewOrdenCompMastBaseCUENTABANCO: TIBStringField
      FieldName = 'CUENTABANCO'
      Origin = 'VIEW_ORDEN_COMPMASTER.CUENTABANCO'
    end
    object qryViewOrdenCompMastBaseOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'VIEW_ORDEN_COMPMASTER.OBSERVACION'
      Size = 40
    end
    object qryViewOrdenCompMastBaseMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'VIEW_ORDEN_COMPMASTER.MONTO'
    end
    object qryViewOrdenCompMastBaseSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VIEW_ORDEN_COMPMASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryViewOrdenCompMastBaseTIPO_INV: TSmallintField
      FieldName = 'TIPO_INV'
      Origin = 'VIEW_ORDEN_COMPMASTER.TIPO_INV'
    end
    object qryViewOrdenCompMastBaseSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VIEW_ORDEN_COMPMASTER.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryViewOrdenCompMastBaseNUM_ORDEN: TIntegerField
      FieldName = 'NUM_ORDEN'
      Origin = 'VIEW_ORDEN_COMPMASTER.NUM_ORDEN'
    end
    object qryViewOrdenCompMastBaseSTATUS_ORD: TIBStringField
      FieldName = 'STATUS_ORD'
      Origin = 'VIEW_ORDEN_COMPMASTER.STATUS_ORD'
      FixedChar = True
      Size = 1
    end
    object qryViewOrdenCompMastBaseAREA_ORDEN: TIntegerField
      FieldName = 'AREA_ORDEN'
      Origin = 'VIEW_ORDEN_COMPMASTER.AREA_ORDEN'
    end
    object qryViewOrdenCompMastBaseCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VIEW_ORDEN_COMPMASTER.CIA_KEY'
    end
    object qryViewOrdenCompMastBaseNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'VIEW_ORDEN_COMPMASTER.NUMERO_NCF'
      Size = 21
    end
  end
  object dsqryViewOrdenCompMast: TDataSource
    AutoEdit = False
    DataSet = qryViewOrdenCompMast
    Left = 528
    Top = 168
  end
  object dsqryViewOrdenCompDet: TDataSource
    AutoEdit = False
    DataSet = qryViewOrdenCompDet
    Left = 568
    Top = 264
  end
  object tblDevolucionAbierta: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO_DEVOLUCION,'
      '  MONEDA,'
      '  CODIGO_CTE,'
      '  MONTO_PENDIENTE,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  NUMERO_TRN_VTA,'
      '  SERIE_TRNXCX'
      'from DEVOLUCIONES_PENDIENTE '
      'where'
      '  NUMERO_DEVOLUCION = :NUMERO_DEVOLUCION')
    SelectSQL.Strings = (
      ' SELECT '
      '      DEVOLUCIONES_PENDIENTE.NUMERO_DEVOLUCION,'
      '      DEVOLUCIONES_PENDIENTE.MONEDA,'
      '      DEVOLUCIONES_PENDIENTE.CODIGO_CTE,'
      '      DEVOLUCIONES_PENDIENTE.MONTO_PENDIENTE,'
      '      DEVOLUCIONES_PENDIENTE.STATUS,'
      '      DEVOLUCIONES_PENDIENTE.FECHA_IN,'
      '      DEVOLUCIONES_PENDIENTE.IN_POR,'
      '      DEVOLUCIONES_PENDIENTE.FECHA_MOD,'
      '      DEVOLUCIONES_PENDIENTE.MOD_POR,'
      '      DEVOLUCIONES_PENDIENTE.NUMERO_TRN_VTA,'
      '      DEVOLUCIONES_PENDIENTE.SERIE_TRNXCX'
      '    FROM'
      '      DEVOLUCIONES_PENDIENTE'
      '    WHERE'
      '    DEVOLUCIONES_PENDIENTE.MONEDA=:moneda'
      '    And DEVOLUCIONES_PENDIENTE.CODIGO_CTE =:codcte'
      '    And DEVOLUCIONES_PENDIENTE.STATUS = '#39'A'#39)
    ModifySQL.Strings = (
      'update DEVOLUCIONES_PENDIENTE'
      'set'
      '  NUMERO_DEVOLUCION = :NUMERO_DEVOLUCION,'
      '  MONEDA = :MONEDA,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  MONTO_PENDIENTE = :MONTO_PENDIENTE,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  NUMERO_TRN_VTA = :NUMERO_TRN_VTA,'
      '  SERIE_TRNXCX = :SERIE_TRNXCX'
      'where'
      '  NUMERO_DEVOLUCION = :OLD_NUMERO_DEVOLUCION')
    Left = 648
    Top = 368
    object tblDevolucionAbiertaNUMERO_DEVOLUCION: TIntegerField
      FieldName = 'NUMERO_DEVOLUCION'
      Origin = 'DEVOLUCIONES_PENDIENTE.NUMERO_DEVOLUCION'
      Required = True
    end
    object tblDevolucionAbiertaMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'DEVOLUCIONES_PENDIENTE.MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object tblDevolucionAbiertaCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'DEVOLUCIONES_PENDIENTE.CODIGO_CTE'
      Required = True
    end
    object tblDevolucionAbiertaMONTO_PENDIENTE: TFloatField
      FieldName = 'MONTO_PENDIENTE'
      Origin = 'DEVOLUCIONES_PENDIENTE.MONTO_PENDIENTE'
    end
    object tblDevolucionAbiertaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DEVOLUCIONES_PENDIENTE.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblDevolucionAbiertaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'DEVOLUCIONES_PENDIENTE.FECHA_IN'
    end
    object tblDevolucionAbiertaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'DEVOLUCIONES_PENDIENTE.IN_POR'
      Size = 12
    end
    object tblDevolucionAbiertaFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'DEVOLUCIONES_PENDIENTE.FECHA_MOD'
    end
    object tblDevolucionAbiertaMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'DEVOLUCIONES_PENDIENTE.MOD_POR'
      Size = 12
    end
    object tblDevolucionAbiertaNUMERO_TRN_VTA: TIntegerField
      FieldName = 'NUMERO_TRN_VTA'
      Origin = 'DEVOLUCIONES_PENDIENTE.NUMERO_TRN_VTA'
    end
    object tblDevolucionAbiertaSERIE_TRNXCX: TIntegerField
      FieldName = 'SERIE_TRNXCX'
      Origin = 'DEVOLUCIONES_PENDIENTE.SERIE_TRNXCX'
    end
  end
  object qryConfCajaXusuario: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CONFCAJAXUSUARIO'
      'where'
      '  COD_EMPLEADO = :OLD_COD_EMPLEADO and'
      '  COD_CAJA = :OLD_COD_CAJA and'
      '  ID_FISCALPRINTER = :OLD_ID_FISCALPRINTER')
    InsertSQL.Strings = (
      'insert into CONFCAJAXUSUARIO'
      
        '  (COD_EMPLEADO, FECHAOPEN, FECHACLOSE, COD_CAJA, STATUS, ID_FIS' +
        'CALPRINTER, '
      '   RUTA_TICKET)'
      'values'
      
        '  (:COD_EMPLEADO, :FECHAOPEN, :FECHACLOSE, :COD_CAJA, :STATUS, :' +
        'ID_FISCALPRINTER, '
      '   :RUTA_TICKET)')
    RefreshSQL.Strings = (
      'Select '
      '  COD_EMPLEADO,'
      '  FECHAOPEN,'
      '  FECHACLOSE,'
      '  COD_CAJA,'
      '  STATUS,'
      '  ID_FISCALPRINTER,'
      '  RUTA_TICKET'
      'from CONFCAJAXUSUARIO '
      'where'
      '  COD_EMPLEADO = :COD_EMPLEADO and'
      '  COD_CAJA = :COD_CAJA and'
      '  ID_FISCALPRINTER = :ID_FISCALPRINTER')
    SelectSQL.Strings = (
      'SELECT * '
      'FROM CONFCAJAXUSUARIO')
    ModifySQL.Strings = (
      'update CONFCAJAXUSUARIO'
      'set'
      '  COD_EMPLEADO = :COD_EMPLEADO,'
      '  FECHAOPEN = :FECHAOPEN,'
      '  FECHACLOSE = :FECHACLOSE,'
      '  COD_CAJA = :COD_CAJA,'
      '  STATUS = :STATUS,'
      '  ID_FISCALPRINTER = :ID_FISCALPRINTER,'
      '  RUTA_TICKET = :RUTA_TICKET'
      'where'
      '  COD_EMPLEADO = :OLD_COD_EMPLEADO and'
      '  COD_CAJA = :OLD_COD_CAJA and'
      '  ID_FISCALPRINTER = :OLD_ID_FISCALPRINTER')
    Left = 232
    Top = 344
    object qryConfCajaXusuarioCOD_EMPLEADO: TIntegerField
      FieldName = 'COD_EMPLEADO'
      Origin = 'CONFCAJAXUSUARIO.COD_EMPLEADO'
      Required = True
    end
    object qryConfCajaXusuarioFECHAOPEN: TDateTimeField
      FieldName = 'FECHAOPEN'
      Origin = 'CONFCAJAXUSUARIO.FECHAOPEN'
      Required = True
    end
    object qryConfCajaXusuarioFECHACLOSE: TDateTimeField
      FieldName = 'FECHACLOSE'
      Origin = 'CONFCAJAXUSUARIO.FECHACLOSE'
    end
    object qryConfCajaXusuarioCOD_CAJA: TIntegerField
      FieldName = 'COD_CAJA'
      Origin = 'CONFCAJAXUSUARIO.COD_CAJA'
    end
    object qryConfCajaXusuarioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CONFCAJAXUSUARIO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryConfCajaXusuarioID_FISCALPRINTER: TIntegerField
      FieldName = 'ID_FISCALPRINTER'
      Origin = 'CONFCAJAXUSUARIO.ID_FISCALPRINTER'
    end
    object qryConfCajaXusuarioRUTA_TICKET: TIBStringField
      FieldName = 'RUTA_TICKET'
      Origin = 'CONFCAJAXUSUARIO.RUTA_TICKET'
      Size = 80
    end
  end
  object dsqryConfCajaXusuario: TDataSource
    DataSet = qryConfCajaXusuario
    Left = 232
    Top = 392
  end
  object tblImpresoraFiscal: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    FieldDefs = <
      item
        Name = 'ID_FISCALPRINTER'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'FECHA_ENTRADA'
        DataType = ftDateTime
      end
      item
        Name = 'SERIE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'MARCA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'MODELO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'VERSIONAPI'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'STATUS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FECHA_SALIDA'
        DataType = ftDateTime
      end
      item
        Name = 'NUM_LOGO'
        DataType = ftInteger
      end
      item
        Name = 'PUERTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'BAUDRATE'
        DataType = ftInteger
      end
      item
        Name = 'RUTA_EXELIBROVENTA'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'RUTALIBROVENTAS'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ENCABEZADO'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <
      item
        Name = 'PK_IMPRESORAFISCAL1'
        Fields = 'ID_FISCALPRINTER'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_IMPRESORAFISCAL1'
        Fields = 'ID_FISCALPRINTER'
      end>
    StoreDefs = True
    TableName = 'IMPRESORAFISCAL'
    Left = 376
    Top = 376
    object tblImpresoraFiscalID_FISCALPRINTER: TIntegerField
      DisplayLabel = 'Id Impresora'
      FieldName = 'ID_FISCALPRINTER'
    end
    object tblImpresoraFiscalFECHA_ENTRADA: TDateTimeField
      DisplayLabel = 'Fecha Entrada'
      FieldName = 'FECHA_ENTRADA'
    end
    object tblImpresoraFiscalSERIE: TIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 30
    end
    object tblImpresoraFiscalMARCA: TIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Size = 50
    end
    object tblImpresoraFiscalMODELO: TIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 50
    end
    object tblImpresoraFiscalVERSIONAPI: TIBStringField
      DisplayLabel = 'Version Api'
      FieldName = 'VERSIONAPI'
      Size = 15
    end
    object tblImpresoraFiscalSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 1
    end
    object tblImpresoraFiscalFECHA_SALIDA: TDateTimeField
      DisplayLabel = 'Fecha Salida'
      FieldName = 'FECHA_SALIDA'
    end
    object tblImpresoraFiscalNUM_LOGO: TIntegerField
      DisplayLabel = 'Num Logo'
      FieldName = 'NUM_LOGO'
    end
    object tblImpresoraFiscalPUERTO: TIBStringField
      FieldName = 'PUERTO'
      FixedChar = True
      Size = 1
    end
    object tblImpresoraFiscalBAUDRATE: TIntegerField
      FieldName = 'BAUDRATE'
    end
    object tblImpresoraFiscalRUTA_EXELIBROVENTA: TIBStringField
      FieldName = 'RUTA_EXELIBROVENTA'
      Size = 120
    end
    object tblImpresoraFiscalRUTALIBROVENTAS: TIBStringField
      FieldName = 'RUTALIBROVENTAS'
      Size = 200
    end
    object tblImpresoraFiscalENCABEZADO: TIBStringField
      FieldName = 'ENCABEZADO'
      Size = 40
    end
  end
  object dstblImpresoraFiscal: TDataSource
    DataSet = tblImpresoraFiscal
    Left = 402
    Top = 426
  end
  object tblTipoDocFiscal_L: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'TIPO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 62
      end>
    IndexDefs = <
      item
        Name = 'TIPODOCFISCALPRKEY_414'
        Fields = 'TIPO'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_TIPODOCFISCAL1'
        Fields = 'TIPO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'TipoDocFiscal'
    Left = 448
    Top = 102
    object IntegerField1: TIntegerField
      FieldName = 'TIPO'
    end
    object IBStringField1: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 62
    end
  end
  object dstblTipoDocFiscal_L: TDataSource
    DataSet = tblTipoDocFiscal_L
    Left = 352
    Top = 472
  end
  object tblTipoDocFiscal: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'TIPO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 62
      end>
    IndexDefs = <
      item
        Name = 'TIPODOCFISCALPRKEY_414'
        Fields = 'TIPO'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_TIPODOCFISCAL1'
        Fields = 'TIPO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'TipoDocFiscal'
    Left = 664
    Top = 184
    object tblTipoDocFiscalTIPO: TIntegerField
      FieldName = 'TIPO'
    end
    object tblTipoDocFiscalDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 62
    end
  end
  object dstblTipoDocFiscal: TDataSource
    DataSet = tblTipoDocFiscal
    Left = 528
    Top = 216
  end
  object qryImpresoraFiscalActiva: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from impresorafiscal'
      'Where status = "A"')
    Left = 663
    Top = 128
    object qryImpresoraFiscalActivaMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'IMPRESORAFISCAL.MODELO'
      Size = 50
    end
  end
  object tblTipoCF: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'TIPO_CF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DESCRIPCION_2018'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'TIPO_CFINDEX1'
        Fields = 'TIPO_CF'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'TIPO_CF'
    Left = 600
    Top = 24
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
    Left = 528
    Top = 120
  end
  object tblCaja: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    TableName = 'CAJA'
    Left = 208
    Top = 200
    object tblCajaCOD_CAJA: TIntegerField
      FieldName = 'COD_CAJA'
    end
    object tblCajaFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object tblCajaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
    object tblCajaBALANCE_ANT: TFloatField
      FieldName = 'BALANCE_ANT'
    end
    object tblCajaBALANCE_ACTUAL: TFloatField
      FieldName = 'BALANCE_ACTUAL'
    end
    object tblCajaMONTO_ENTRADA_ACUM: TFloatField
      FieldName = 'MONTO_ENTRADA_ACUM'
    end
    object tblCajaMONTO_RETIRADO_ACUM: TFloatField
      FieldName = 'MONTO_RETIRADO_ACUM'
    end
    object tblCajaCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
    end
    object tblCajaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object dstblCaja: TDataSource
    DataSet = tblCaja
    Left = 216
    Top = 256
  end
  object tblLineaDescDocF: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblLineaDescDocFAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from LINEA_DESCDOCFISCAL'
      'where'
      '  IDLINEA = :OLD_IDLINEA and'
      '  ITEM = :OLD_ITEM')
    InsertSQL.Strings = (
      'insert into LINEA_DESCDOCFISCAL'
      '  (IDLINEA, ITEM, DESCRIPCION, STATUS)'
      'values'
      '  (:IDLINEA, :ITEM, :DESCRIPCION, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  IDLINEA,'
      '  ITEM,'
      '  DESCRIPCION,'
      '  STATUS'
      'from LINEA_DESCDOCFISCAL '
      'where'
      '  IDLINEA = :IDLINEA and'
      '  ITEM = :ITEM')
    SelectSQL.Strings = (
      'Select * From LINEA_DESCDOCFISCAL'
      'Where idlinea =:idlinea')
    ModifySQL.Strings = (
      'update LINEA_DESCDOCFISCAL'
      'set'
      '  IDLINEA = :IDLINEA,'
      '  ITEM = :ITEM,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  STATUS = :STATUS'
      'where'
      '  IDLINEA = :OLD_IDLINEA and'
      '  ITEM = :OLD_ITEM')
    Left = 672
    Top = 240
    object tblLineaDescDocFIDLINEA: TIntegerField
      FieldName = 'IDLINEA'
      Origin = 'LINEA_DESCDOCFISCAL.IDLINEA'
      Required = True
    end
    object tblLineaDescDocFITEM: TIntegerField
      FieldName = 'ITEM'
      Origin = 'LINEA_DESCDOCFISCAL.ITEM'
      Required = True
    end
    object tblLineaDescDocFDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'LINEA_DESCDOCFISCAL.DESCRIPCION'
      Size = 50
    end
    object tblLineaDescDocFSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'LINEA_DESCDOCFISCAL.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dstblLineaDescDocF: TDataSource
    DataSet = tblLineaDescDocF
    Left = 640
    Top = 312
  end
  object sqlLineaDescDocFGenMax: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Select Max(item) maxitem from LINEA_DESCDOCFISCAL'
      'Where  IDLINEA =:idlinea')
    Transaction = dmConectar.IBTransaction1
    Left = 640
    Top = 416
  end
  object tblNcftipoIFiscal: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'TIPO_NCF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TIPO_NCF_IFISCAL'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'TIPO_NCFNCR'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'PK_NCF_TIPO_IFISCAL1'
        Fields = 'TIPO_NCF;TIPO_NCF_IFISCAL'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_NCF_TIPO_IFISCAL1'
        Fields = 'TIPO_NCF;TIPO_NCF_IFISCAL'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_NCF_TIPO_IFISCAL2'
        Fields = 'TIPO_NCF'
      end
      item
        Name = 'IDX_NCF_TIPO_IFISCAL3'
        Fields = 'TIPO_NCF_IFISCAL'
      end>
    StoreDefs = True
    TableName = 'NCF_TIPO_IFISCAL'
    Left = 536
    Top = 376
    object tblNcftipoIFiscalTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Size = 2
    end
    object tblNcftipoIFiscalTIPO_NCF_IFISCAL: TIntegerField
      FieldName = 'TIPO_NCF_IFISCAL'
    end
    object tblNcftipoIFiscalDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 80
    end
    object tblNcftipoIFiscalDescDocIFiscal: TStringField
      DisplayWidth = 80
      FieldKind = fkLookup
      FieldName = 'DescDocIFiscal'
      LookupDataSet = tblTipoDocFiscal
      LookupKeyFields = 'TIPO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'TIPO_NCF_IFISCAL'
      Size = 80
      Lookup = True
    end
    object tblNcftipoIFiscalDescDocFiscal: TStringField
      FieldKind = fkLookup
      FieldName = 'DescDocFiscal'
      LookupDataSet = tblTipoCF
      LookupKeyFields = 'TIPO_CF'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'TIPO_NCF'
      Size = 80
      Lookup = True
    end
    object tblNcftipoIFiscalTIPO_NCFNCR: TSmallintField
      FieldName = 'TIPO_NCFNCR'
    end
  end
  object dstblNcftipoIFiscal: TDataSource
    DataSet = tblNcftipoIFiscal
    Left = 528
    Top = 312
  end
  object tblEmpleados: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'EMPLEADO'
    Left = 280
    Top = 136
    object tblEmpleadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblEmpleadosCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
    end
    object tblEmpleadosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 35
    end
    object tblEmpleadosAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Size = 35
    end
    object tblEmpleadosCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Size = 14
    end
    object tblEmpleadosFOTO: TBlobField
      FieldName = 'FOTO'
    end
    object tblEmpleadosPASSPORT: TIBStringField
      FieldName = 'PASSPORT'
      Size = 14
    end
    object tblEmpleadosCALLE: TIBStringField
      FieldName = 'CALLE'
      Size = 40
    end
    object tblEmpleadosNUM_CASA: TSmallintField
      FieldName = 'NUM_CASA'
    end
    object tblEmpleadosCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Size = 40
    end
    object tblEmpleadosPAIS: TIBStringField
      FieldName = 'PAIS'
      Size = 40
    end
    object tblEmpleadosTELEF_CASA: TIBStringField
      FieldName = 'TELEF_CASA'
      Size = 12
    end
    object tblEmpleadosTELEF_OFICINA: TIBStringField
      FieldName = 'TELEF_OFICINA'
      Size = 12
    end
    object tblEmpleadosCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Size = 12
    end
    object tblEmpleadosEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 40
    end
    object tblEmpleadosSEXO: TIBStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object tblEmpleadosESTADO_CIVIL: TIBStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 1
    end
    object tblEmpleadosTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Size = 12
    end
    object tblEmpleadosNOMBRE_REFERENCIA: TIBStringField
      FieldName = 'NOMBRE_REFERENCIA'
      Size = 40
    end
    object tblEmpleadosFECHA_NAC: TDateTimeField
      FieldName = 'FECHA_NAC'
    end
    object tblEmpleadosNACIONALIDAD: TIBStringField
      FieldName = 'NACIONALIDAD'
      Size = 1
    end
    object tblEmpleadosFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
    end
    object tblEmpleadosFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
    end
    object tblEmpleadosSALARIO: TFloatField
      FieldName = 'SALARIO'
    end
    object tblEmpleadosTIPO_NOMINA: TSmallintField
      FieldName = 'TIPO_NOMINA'
    end
    object tblEmpleadosTIPO_EMPLEADO: TSmallintField
      FieldName = 'TIPO_EMPLEADO'
    end
    object tblEmpleadosDEPTO_EMP: TSmallintField
      FieldName = 'DEPTO_EMP'
    end
    object tblEmpleadosSECCION: TSmallintField
      FieldName = 'SECCION'
    end
    object tblEmpleadosCARGO: TSmallintField
      FieldName = 'CARGO'
    end
    object tblEmpleadosPAGA_AFP: TSmallintField
      FieldName = 'PAGA_AFP'
    end
    object tblEmpleadosPAGA_TSS: TSmallintField
      FieldName = 'PAGA_TSS'
    end
    object tblEmpleadosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object tblEmpleadosFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
    end
    object tblEmpleadosIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Size = 12
    end
    object tblEmpleadosFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
    end
    object tblEmpleadosMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Size = 12
    end
    object tblEmpleadosLICENCIA: TIBStringField
      FieldName = 'LICENCIA'
      Size = 14
    end
    object tblEmpleadosFECHA_VENCE_LICENCIA: TDateTimeField
      FieldName = 'FECHA_VENCE_LICENCIA'
    end
  end
  object dstblEmpleados: TDataSource
    DataSet = tblEmpleados
    Left = 336
    Top = 184
  end
  object qryImpresoraFiscal: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from IMPRESORAFISCAL'
      'Where status = '#39'A'#39)
    Left = 544
    Top = 440
    object qryImpresoraFiscalID_FISCALPRINTER: TIntegerField
      FieldName = 'ID_FISCALPRINTER'
      Origin = 'IMPRESORAFISCAL.ID_FISCALPRINTER'
      Required = True
    end
    object qryImpresoraFiscalFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'IMPRESORAFISCAL.FECHA_ENTRADA'
    end
    object qryImpresoraFiscalSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = 'IMPRESORAFISCAL.SERIE'
      Size = 30
    end
    object qryImpresoraFiscalMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'IMPRESORAFISCAL.MARCA'
      Size = 50
    end
    object qryImpresoraFiscalMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'IMPRESORAFISCAL.MODELO'
      Size = 50
    end
    object qryImpresoraFiscalVERSIONAPI: TIBStringField
      FieldName = 'VERSIONAPI'
      Origin = 'IMPRESORAFISCAL.VERSIONAPI'
      Size = 15
    end
    object qryImpresoraFiscalSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'IMPRESORAFISCAL.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryImpresoraFiscalFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'IMPRESORAFISCAL.FECHA_SALIDA'
    end
    object qryImpresoraFiscalNUM_LOGO: TIntegerField
      FieldName = 'NUM_LOGO'
      Origin = 'IMPRESORAFISCAL.NUM_LOGO'
    end
    object qryImpresoraFiscalPUERTO: TIBStringField
      FieldName = 'PUERTO'
      Origin = 'IMPRESORAFISCAL.PUERTO'
      FixedChar = True
      Size = 1
    end
    object qryImpresoraFiscalBAUDRATE: TIntegerField
      FieldName = 'BAUDRATE'
      Origin = 'IMPRESORAFISCAL.BAUDRATE'
    end
    object qryImpresoraFiscalRUTA_EXELIBROVENTA: TIBStringField
      FieldName = 'RUTA_EXELIBROVENTA'
      Origin = 'IMPRESORAFISCAL.RUTA_EXELIBROVENTA'
      Size = 120
    end
    object qryImpresoraFiscalRUTALIBROVENTAS: TIBStringField
      FieldName = 'RUTALIBROVENTAS'
      Origin = 'IMPRESORAFISCAL.RUTALIBROVENTAS'
      Size = 200
    end
    object qryImpresoraFiscalENCABEZADO: TIBStringField
      FieldName = 'ENCABEZADO'
      Origin = 'IMPRESORAFISCAL.ENCABEZADO'
      Size = 40
    end
  end
  object tblDescCotizacion: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from LINEA_DESCCOTIZACION'
      'where'
      '  IDLINEA = :OLD_IDLINEA')
    InsertSQL.Strings = (
      'insert into LINEA_DESCCOTIZACION'
      '  (IDLINEA, ITEM, DESCRIPCION)'
      'values'
      '  (:IDLINEA, :ITEM, :DESCRIPCION)')
    RefreshSQL.Strings = (
      'Select '
      '  IDLINEA,'
      '  ITEM,'
      '  DESCRIPCION'
      'from LINEA_DESCCOTIZACION '
      'where'
      '  IDLINEA = :IDLINEA')
    SelectSQL.Strings = (
      'Select * From LINEA_DESCCOTIZACION'
      'Where idlinea =:idlinea')
    ModifySQL.Strings = (
      'update LINEA_DESCCOTIZACION'
      'set'
      '  IDLINEA = :IDLINEA,'
      '  ITEM = :ITEM,'
      '  DESCRIPCION = :DESCRIPCION'
      'where'
      '  IDLINEA = :OLD_IDLINEA')
    Left = 648
    Top = 464
    object tblDescCotizacionIDLINEA: TIntegerField
      FieldName = 'IDLINEA'
      Origin = 'LINEA_DESCCOTIZACION.IDLINEA'
      Required = True
    end
    object tblDescCotizacionITEM: TIntegerField
      FieldName = 'ITEM'
      Origin = 'LINEA_DESCCOTIZACION.ITEM'
      Required = True
    end
    object tblDescCotizacionDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'LINEA_DESCCOTIZACION.DESCRIPCION'
      Size = 50
    end
  end
  object dstblDescCotizacion: TDataSource
    DataSet = tblDescCotizacion
    Left = 456
    Top = 480
  end
  object tblTipoTrnCnt: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TIPOTRNCNT'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into TIPOTRNCNT'
      
        '  (SERIE, TIPO_PERS, TIPO_DOC, IDCRITERIO, FECHA_INICIAL, FECHA_' +
        'FINAL, '
      
        '   DESCRIPCION, EJEMPLO, RETENCION_ISR, RETENCION_ITBIS, TASA_IT' +
        'BIS, TASA_ISR)'
      'values'
      
        '  (:SERIE, :TIPO_PERS, :TIPO_DOC, :IDCRITERIO, :FECHA_INICIAL, :' +
        'FECHA_FINAL, '
      
        '   :DESCRIPCION, :EJEMPLO, :RETENCION_ISR, :RETENCION_ITBIS, :TA' +
        'SA_ITBIS, '
      '   :TASA_ISR)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  TIPO_PERS,'
      '  TIPO_DOC,'
      '  IDCRITERIO,'
      '  FECHA_INICIAL,'
      '  FECHA_FINAL,'
      '  DESCRIPCION,'
      '  EJEMPLO,'
      '  RETENCION_ISR,'
      '  RETENCION_ITBIS,'
      '  TASA_ITBIS,'
      '  TASA_ISR'
      'from TIPOTRNCNT '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * From TIPOTRNCNT')
    ModifySQL.Strings = (
      'update TIPOTRNCNT'
      'set'
      '  SERIE = :SERIE,'
      '  TIPO_PERS = :TIPO_PERS,'
      '  TIPO_DOC = :TIPO_DOC,'
      '  IDCRITERIO = :IDCRITERIO,'
      '  FECHA_INICIAL = :FECHA_INICIAL,'
      '  FECHA_FINAL = :FECHA_FINAL,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  EJEMPLO = :EJEMPLO,'
      '  RETENCION_ISR = :RETENCION_ISR,'
      '  RETENCION_ITBIS = :RETENCION_ITBIS,'
      '  TASA_ITBIS = :TASA_ITBIS,'
      '  TASA_ISR = :TASA_ISR'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 48
    Top = 464
    object tblTipoTrnCntSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'TIPOTRNCNT.SERIE'
      Required = True
    end
    object tblTipoTrnCntTIPO_PERS: TSmallintField
      FieldName = 'TIPO_PERS'
      Origin = 'TIPOTRNCNT.TIPO_PERS'
      Required = True
    end
    object tblTipoTrnCntTIPO_DOC: TSmallintField
      FieldName = 'TIPO_DOC'
      Origin = 'TIPOTRNCNT.TIPO_DOC'
      Required = True
    end
    object tblTipoTrnCntIDCRITERIO: TSmallintField
      FieldName = 'IDCRITERIO'
      Origin = 'TIPOTRNCNT.IDCRITERIO'
    end
    object tblTipoTrnCntFECHA_INICIAL: TDateTimeField
      FieldName = 'FECHA_INICIAL'
      Origin = 'TIPOTRNCNT.FECHA_INICIAL'
      Required = True
    end
    object tblTipoTrnCntFECHA_FINAL: TDateTimeField
      FieldName = 'FECHA_FINAL'
      Origin = 'TIPOTRNCNT.FECHA_FINAL'
      Required = True
    end
    object tblTipoTrnCntDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPOTRNCNT.DESCRIPCION'
      Size = 60
    end
    object tblTipoTrnCntEJEMPLO: TIBStringField
      FieldName = 'EJEMPLO'
      Origin = 'TIPOTRNCNT.EJEMPLO'
      Size = 80
    end
    object tblTipoTrnCntRETENCION_ISR: TSmallintField
      FieldName = 'RETENCION_ISR'
      Origin = 'TIPOTRNCNT.RETENCION_ISR'
    end
    object tblTipoTrnCntRETENCION_ITBIS: TSmallintField
      FieldName = 'RETENCION_ITBIS'
      Origin = 'TIPOTRNCNT.RETENCION_ITBIS'
    end
    object tblTipoTrnCntTASA_ITBIS: TFloatField
      FieldName = 'TASA_ITBIS'
      Origin = 'TIPOTRNCNT.TASA_ITBIS'
    end
    object tblTipoTrnCntTASA_ISR: TFloatField
      FieldName = 'TASA_ISR'
      Origin = 'TIPOTRNCNT.TASA_ISR'
    end
  end
  object dstblTipoTrnCnt: TDataSource
    DataSet = tblTipoTrnCnt
    Left = 128
    Top = 472
  end
  object tblCriterioTipodoc: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CRITERIO_TIPODOC'
    Left = 264
    Top = 488
    object tblCriterioTipodocIDCRITERIO: TSmallintField
      FieldName = 'IDCRITERIO'
    end
    object tblCriterioTipodocDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object dstblCriterioTipodoc: TDataSource
    AutoEdit = False
    DataSet = tblCriterioTipodoc
    Left = 248
    Top = 448
  end
  object tblEmail: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from EMAILPROCESO'
      'where'
      '  IDTIPO = :OLD_IDTIPO')
    InsertSQL.Strings = (
      'insert into EMAILPROCESO'
      
        '  (IDTIPO, SUBJECT, PORT, EMAIL_SERVER, USER_EMAIL, USER_PASSWOR' +
        'D, FROMEMAIL, '
      
        '   TOEMAIL, CCEMAIL, EXEMAILTOOL, FECHAIN, IN_POR, FECHA_UPDATE,' +
        ' UPD_POR, '
      '   STATUS)'
      'values'
      
        '  (:IDTIPO, :SUBJECT, :PORT, :EMAIL_SERVER, :USER_EMAIL, :USER_P' +
        'ASSWORD, '
      
        '   :FROMEMAIL, :TOEMAIL, :CCEMAIL, :EXEMAILTOOL, :FECHAIN, :IN_P' +
        'OR, :FECHA_UPDATE, '
      '   :UPD_POR, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  IDTIPO,'
      '  SUBJECT,'
      '  PORT,'
      '  EMAIL_SERVER,'
      '  USER_EMAIL,'
      '  USER_PASSWORD,'
      '  FROMEMAIL,'
      '  TOEMAIL,'
      '  CCEMAIL,'
      '  EXEMAILTOOL,'
      '  FECHAIN,'
      '  IN_POR,'
      '  FECHA_UPDATE,'
      '  UPD_POR,'
      '  STATUS'
      'from EMAILPROCESO '
      'where'
      '  IDTIPO = :IDTIPO')
    SelectSQL.Strings = (
      'select *  from EMAILPROCESO')
    ModifySQL.Strings = (
      'update EMAILPROCESO'
      'set'
      '  IDTIPO = :IDTIPO,'
      '  SUBJECT = :SUBJECT,'
      '  PORT = :PORT,'
      '  EMAIL_SERVER = :EMAIL_SERVER,'
      '  USER_EMAIL = :USER_EMAIL,'
      '  USER_PASSWORD = :USER_PASSWORD,'
      '  FROMEMAIL = :FROMEMAIL,'
      '  TOEMAIL = :TOEMAIL,'
      '  CCEMAIL = :CCEMAIL,'
      '  EXEMAILTOOL = :EXEMAILTOOL,'
      '  FECHAIN = :FECHAIN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_UPDATE = :FECHA_UPDATE,'
      '  UPD_POR = :UPD_POR,'
      '  STATUS = :STATUS'
      'where'
      '  IDTIPO = :OLD_IDTIPO')
    Left = 761
    Top = 72
    object tblEmailIDTIPO: TIntegerField
      FieldName = 'IDTIPO'
      Origin = 'EMAILPROCESO.IDTIPO'
      Required = True
    end
    object tblEmailSUBJECT: TIBStringField
      FieldName = 'SUBJECT'
      Origin = 'EMAILPROCESO.SUBJECT'
      Size = 80
    end
    object tblEmailPORT: TIntegerField
      FieldName = 'PORT'
      Origin = 'EMAILPROCESO.PORT'
    end
    object tblEmailEMAIL_SERVER: TIBStringField
      FieldName = 'EMAIL_SERVER'
      Origin = 'EMAILPROCESO.EMAIL_SERVER'
      Size = 120
    end
    object tblEmailUSER_EMAIL: TIBStringField
      FieldName = 'USER_EMAIL'
      Origin = 'EMAILPROCESO.USER_EMAIL'
      Size = 100
    end
    object tblEmailUSER_PASSWORD: TIBStringField
      FieldName = 'USER_PASSWORD'
      Origin = 'EMAILPROCESO.USER_PASSWORD'
      Size = 50
    end
    object tblEmailFROMEMAIL: TIBStringField
      FieldName = 'FROMEMAIL'
      Origin = 'EMAILPROCESO.FROMEMAIL'
      Size = 200
    end
    object tblEmailTOEMAIL: TIBStringField
      FieldName = 'TOEMAIL'
      Origin = 'EMAILPROCESO.TOEMAIL'
      Size = 200
    end
    object tblEmailCCEMAIL: TIBStringField
      FieldName = 'CCEMAIL'
      Origin = 'EMAILPROCESO.CCEMAIL'
      Size = 200
    end
    object tblEmailSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'EMAILPROCESO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblEmailFECHAIN: TDateTimeField
      FieldName = 'FECHAIN'
      Origin = 'EMAILPROCESO.FECHAIN'
    end
    object tblEmailIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'EMAILPROCESO.IN_POR'
      Size = 12
    end
    object tblEmailFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'EMAILPROCESO.FECHA_UPDATE'
    end
    object tblEmailUPD_POR: TIBStringField
      FieldName = 'UPD_POR'
      Origin = 'EMAILPROCESO.UPD_POR'
      Size = 12
    end
    object tblEmailEXEMAILTOOL: TIBStringField
      FieldName = 'EXEMAILTOOL'
      Origin = 'EMAILPROCESO.EXEMAILTOOL'
      Size = 200
    end
  end
  object dstblEmail: TDataSource
    AutoEdit = False
    DataSet = tblEmail
    Left = 768
    Top = 129
  end
  object stpInsEmailTracking: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'SP_INSEMAIL_TRACKING'
    Left = 768
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SERIE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TOEMAIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FROMEMAIL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SUBJECT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_USER'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ERRORMESSAGE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHAIN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_UPDATE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'UPD_POR'
        ParamType = ptInput
      end>
  end
  object qryEmailProceso: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  *  from EMAILPROCESO'
      'where idtipo=:idtipo')
    Left = 753
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idtipo'
        ParamType = ptInput
      end>
    object qryEmailProcesoIDTIPO: TIntegerField
      FieldName = 'IDTIPO'
      Origin = 'EMAILPROCESO.IDTIPO'
      Required = True
    end
    object qryEmailProcesoSUBJECT: TIBStringField
      FieldName = 'SUBJECT'
      Origin = 'EMAILPROCESO.SUBJECT'
      Size = 80
    end
    object qryEmailProcesoPORT: TIntegerField
      FieldName = 'PORT'
      Origin = 'EMAILPROCESO.PORT'
    end
    object qryEmailProcesoEMAIL_SERVER: TIBStringField
      FieldName = 'EMAIL_SERVER'
      Origin = 'EMAILPROCESO.EMAIL_SERVER'
      Size = 120
    end
    object qryEmailProcesoUSER_EMAIL: TIBStringField
      FieldName = 'USER_EMAIL'
      Origin = 'EMAILPROCESO.USER_EMAIL'
      Size = 100
    end
    object qryEmailProcesoUSER_PASSWORD: TIBStringField
      FieldName = 'USER_PASSWORD'
      Origin = 'EMAILPROCESO.USER_PASSWORD'
      Size = 50
    end
    object qryEmailProcesoFROMEMAIL: TIBStringField
      FieldName = 'FROMEMAIL'
      Origin = 'EMAILPROCESO.FROMEMAIL'
      Size = 200
    end
    object qryEmailProcesoTOEMAIL: TIBStringField
      FieldName = 'TOEMAIL'
      Origin = 'EMAILPROCESO.TOEMAIL'
      Size = 200
    end
    object qryEmailProcesoCCEMAIL: TIBStringField
      FieldName = 'CCEMAIL'
      Origin = 'EMAILPROCESO.CCEMAIL'
      Size = 200
    end
    object qryEmailProcesoFECHAIN: TDateTimeField
      FieldName = 'FECHAIN'
      Origin = 'EMAILPROCESO.FECHAIN'
    end
    object qryEmailProcesoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'EMAILPROCESO.IN_POR'
      Size = 12
    end
    object qryEmailProcesoFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'EMAILPROCESO.FECHA_UPDATE'
    end
    object qryEmailProcesoUPD_POR: TIBStringField
      FieldName = 'UPD_POR'
      Origin = 'EMAILPROCESO.UPD_POR'
      Size = 12
    end
    object qryEmailProcesoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'EMAILPROCESO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryEmailProcesoEXEMAILTOOL: TIBStringField
      FieldName = 'EXEMAILTOOL'
      Origin = 'EMAILPROCESO.EXEMAILTOOL'
      Size = 200
    end
  end
  object qryMembrete: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  * From MEMBRETE_CIA'
      'where codigo_cia =:codigocia')
    Left = 772
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigocia'
        ParamType = ptInput
        Value = '1'
      end>
    object qryMembreteCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
      Origin = 'MEMBRETE_CIA.CODIGO_CIA'
      Required = True
    end
    object qryMembreteLINE_NO: TIntegerField
      FieldName = 'LINE_NO'
      Origin = 'MEMBRETE_CIA.LINE_NO'
      Required = True
    end
    object qryMembreteLINEA1: TIBStringField
      FieldName = 'LINEA1'
      Origin = 'MEMBRETE_CIA.LINEA1'
      Size = 60
    end
    object qryMembreteLINEA2: TIBStringField
      FieldName = 'LINEA2'
      Origin = 'MEMBRETE_CIA.LINEA2'
      Size = 30
    end
    object qryMembreteLINEA3: TIBStringField
      FieldName = 'LINEA3'
      Origin = 'MEMBRETE_CIA.LINEA3'
      Size = 40
    end
    object qryMembreteLINEA4: TIBStringField
      FieldName = 'LINEA4'
      Origin = 'MEMBRETE_CIA.LINEA4'
      Size = 60
    end
    object qryMembreteLINEA5: TIBStringField
      FieldName = 'LINEA5'
      Origin = 'MEMBRETE_CIA.LINEA5'
      Size = 40
    end
  end
  object tblLineaDescDocFDetNotInUse: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from LINEA_DESCDOCFISCAL_DET'
      'where'
      '  IDSERIE = :OLD_IDSERIE')
    InsertSQL.Strings = (
      'insert into LINEA_DESCDOCFISCAL_DET'
      '  (IDSERIE, IDLINEA, ITEM, DESCRIPCION)'
      'values'
      '  (:IDSERIE, :IDLINEA, :ITEM, :DESCRIPCION)')
    RefreshSQL.Strings = (
      'Select '
      '  IDSERIE,'
      '  IDLINEA,'
      '  ITEM,'
      '  DESCRIPCION'
      'from LINEA_DESCDOCFISCAL_DET '
      'where'
      '  IDSERIE = :IDSERIE')
    SelectSQL.Strings = (
      '--Select  * From LINEA_DESCDOCFISCAL_DET'
      '--Where idLinea =:idlinea')
    ModifySQL.Strings = (
      'update LINEA_DESCDOCFISCAL_DET'
      'set'
      '  IDSERIE = :IDSERIE,'
      '  IDLINEA = :IDLINEA,'
      '  ITEM = :ITEM,'
      '  DESCRIPCION = :DESCRIPCION'
      'where'
      '  IDSERIE = :OLD_IDSERIE')
    Left = 744
    Top = 392
  end
  object qryImpresoras: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from IMPRESORAS')
    Left = 768
    Top = 448
    object qryImpresorasIDMODULO: TSmallintField
      FieldName = 'IDMODULO'
      Origin = 'IMPRESORAS.IDMODULO'
      Required = True
    end
    object qryImpresorasIDREPORTE: TIntegerField
      FieldName = 'IDREPORTE'
      Origin = 'IMPRESORAS.IDREPORTE'
      Required = True
    end
    object qryImpresorasNOMBRE_IMPRESORA: TIBStringField
      FieldName = 'NOMBRE_IMPRESORA'
      Origin = 'IMPRESORAS.NOMBRE_IMPRESORA'
      Size = 256
    end
    object qryImpresorasIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'IMPRESORAS.IN_POR'
      Size = 12
    end
    object qryImpresorasFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'IMPRESORAS.FECHA_IN'
    end
  end
  object tblImpresora: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from IMPRESORAS'
      'where'
      '  IDMODULO = :OLD_IDMODULO and'
      '  IDREPORTE = :OLD_IDREPORTE')
    InsertSQL.Strings = (
      'insert into IMPRESORAS'
      '  (IDMODULO, IDREPORTE, NOMBRE_IMPRESORA, IN_POR, FECHA_IN)'
      'values'
      '  (:IDMODULO, :IDREPORTE, :NOMBRE_IMPRESORA, :IN_POR, :FECHA_IN)')
    RefreshSQL.Strings = (
      'Select '
      '  IDMODULO,'
      '  IDREPORTE,'
      '  NOMBRE_IMPRESORA,'
      '  IN_POR,'
      '  FECHA_IN'
      'from IMPRESORAS '
      'where'
      '  IDMODULO = :IDMODULO and'
      '  IDREPORTE = :IDREPORTE')
    SelectSQL.Strings = (
      'Select * From IMPRESORAS')
    ModifySQL.Strings = (
      'update IMPRESORAS'
      'set'
      '  IDMODULO = :IDMODULO,'
      '  IDREPORTE = :IDREPORTE,'
      '  NOMBRE_IMPRESORA = :NOMBRE_IMPRESORA,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN'
      'where'
      '  IDMODULO = :OLD_IDMODULO and'
      '  IDREPORTE = :OLD_IDREPORTE')
    Left = 720
    Top = 480
    object tblImpresoraIDMODULO: TSmallintField
      FieldName = 'IDMODULO'
      Origin = 'IMPRESORAS.IDMODULO'
      Required = True
    end
    object tblImpresoraIDREPORTE: TIntegerField
      FieldName = 'IDREPORTE'
      Origin = 'IMPRESORAS.IDREPORTE'
      Required = True
    end
    object tblImpresoraNOMBRE_IMPRESORA: TIBStringField
      FieldName = 'NOMBRE_IMPRESORA'
      Origin = 'IMPRESORAS.NOMBRE_IMPRESORA'
      Size = 256
    end
    object tblImpresoraIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'IMPRESORAS.IN_POR'
      Size = 12
    end
    object tblImpresoraFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'IMPRESORAS.FECHA_IN'
    end
  end
  object dstblImpresora: TDataSource
    DataSet = tblImpresora
    Left = 792
    Top = 488
  end
  object tblDealer: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DEALEAR'
      'where'
      '  CODIGO_DEALER = :OLD_CODIGO_DEALER')
    InsertSQL.Strings = (
      'insert into DEALEAR'
      '  (CODIGO_DEALER, DESCRIPCION)'
      'values'
      '  (:CODIGO_DEALER, :DESCRIPCION)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_DEALER,'
      '  DESCRIPCION'
      'from DEALEAR '
      'where'
      '  CODIGO_DEALER = :CODIGO_DEALER')
    SelectSQL.Strings = (
      'select * from DEALEAR')
    ModifySQL.Strings = (
      'update DEALEAR'
      'set'
      '  CODIGO_DEALER = :CODIGO_DEALER,'
      '  DESCRIPCION = :DESCRIPCION'
      'where'
      '  CODIGO_DEALER = :OLD_CODIGO_DEALER')
    Left = 704
    Top = 296
    object tblDealerCODIGO_DEALER: TIntegerField
      FieldName = 'CODIGO_DEALER'
      Origin = 'DEALEAR.CODIGO_DEALER'
      Required = True
    end
    object tblDealerDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DEALEAR.DESCRIPCION'
      Size = 80
    end
  end
  object dstblDealer: TDataSource
    DataSet = tblDealer
    Left = 720
    Top = 360
  end
  object dstblAgencia: TDataSource
    DataSet = tblAgencia
    Left = 800
    Top = 352
  end
  object tblAgencia: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from AGENCIA'
      'where'
      '  CODIGO_AGENCIA = :OLD_CODIGO_AGENCIA')
    InsertSQL.Strings = (
      'insert into AGENCIA'
      '  (CODIGO_AGENCIA, DESCRIPCION)'
      'values'
      '  (:CODIGO_AGENCIA, :DESCRIPCION)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_AGENCIA,'
      '  DESCRIPCION'
      'from AGENCIA '
      'where'
      '  CODIGO_AGENCIA = :CODIGO_AGENCIA')
    SelectSQL.Strings = (
      'select  *  from AGENCIA')
    ModifySQL.Strings = (
      'update AGENCIA'
      'set'
      '  CODIGO_AGENCIA = :CODIGO_AGENCIA,'
      '  DESCRIPCION = :DESCRIPCION'
      'where'
      '  CODIGO_AGENCIA = :OLD_CODIGO_AGENCIA')
    Left = 776
    Top = 272
    object tblAgenciaCODIGO_AGENCIA: TIntegerField
      FieldName = 'CODIGO_AGENCIA'
      Origin = 'AGENCIA.CODIGO_AGENCIA'
      Required = True
    end
    object tblAgenciaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'AGENCIA.DESCRIPCION'
      Size = 80
    end
  end
  object tblConfComEmp: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from conf_comision_emp'
      'where'
      '  IDCATEGORIA = :OLD_IDCATEGORIA and'
      '  CODIGO_EMP = :OLD_CODIGO_EMP and'
      '  CODIGO_COMISION = :OLD_CODIGO_COMISION')
    InsertSQL.Strings = (
      'insert into conf_comision_emp'
      '  (IDCATEGORIA, CODIGO_EMP, CODIGO_COMISION)'
      'values'
      '  (:IDCATEGORIA, :CODIGO_EMP, :CODIGO_COMISION)')
    RefreshSQL.Strings = (
      'Select '
      '  IDCATEGORIA,'
      '  CODIGO_EMP,'
      '  CODIGO_COMISION'
      'from conf_comision_emp '
      'where'
      '  IDCATEGORIA = :IDCATEGORIA and'
      '  CODIGO_EMP = :CODIGO_EMP and'
      '  CODIGO_COMISION = :CODIGO_COMISION')
    SelectSQL.Strings = (
      
        'Select r.*, e.NOMBRE||'#39' '#39'||e.apellido nombreEmpleado  From conf_' +
        'comision_emp r'
      'inner join EMPLEADO e on e.CODIGO = r.CODIGO_EMP')
    ModifySQL.Strings = (
      'update conf_comision_emp'
      'set'
      '  IDCATEGORIA = :IDCATEGORIA,'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  CODIGO_COMISION = :CODIGO_COMISION'
      'where'
      '  IDCATEGORIA = :OLD_IDCATEGORIA and'
      '  CODIGO_EMP = :OLD_CODIGO_EMP and'
      '  CODIGO_COMISION = :OLD_CODIGO_COMISION')
    OnFilterRecord = tblConfComEmpFilterRecord
    Left = 664
    Top = 8
    object tblConfComEmpIDCATEGORIA: TIntegerField
      FieldName = 'IDCATEGORIA'
      Origin = 'CONF_COMISION_EMP.IDCATEGORIA'
      Required = True
    end
    object tblConfComEmpCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'CONF_COMISION_EMP.CODIGO_EMP'
      Required = True
    end
    object tblConfComEmpCODIGO_COMISION: TIntegerField
      FieldName = 'CODIGO_COMISION'
      Origin = 'CONF_COMISION_EMP.CODIGO_COMISION'
      Required = True
    end
    object tblConfComEmpNOMBREEMPLEADO: TIBStringField
      FieldName = 'NOMBREEMPLEADO'
      Size = 71
    end
  end
  object dstblConfComEmp: TDataSource
    AutoEdit = False
    DataSet = tblConfComEmp
    Left = 760
    Top = 17
  end
  object qryCantCambiosStatus: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '  SELECT COUNT(R.ACCION) cant_accion  '
      '  FROM CONTRACTWISPRO_HIST R'
      '  Where r.ACCION = '#39'STATUS'#39
      '  AND R.FECHA_HIST = '#39'TODAY'#39)
    Left = 320
    Top = 88
    object qryCantCambiosStatusCANT_ACCION: TIntegerField
      FieldName = 'CANT_ACCION'
      Required = True
    end
  end
  object tblDatosNotifyGEmail: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  CODIGO_CTE,'
      '  FECHA_APERTURA,'
      '  FECHA_VENCE_SEGURO,'
      '  TIPO_AFILIADO,'
      '  PLACA,'
      '  IDMARCA,'
      '  MODELO,'
      '  ANO_VEH,'
      '  TIPO_SEGURO,'
      '  CIA_SEGURO,'
      '  EMPRESA_LABORA,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  CODIGO_DEALER,'
      '  CODIGO_AGENCIA,'
      '  COLOR,'
      '  NUM_CERTIFICADO,'
      '  CHASSIS,'
      '  NUMPOL,'
      '  STATUSCXC,'
      '  POLIZA_ESPECIAL,'
      '  RUTA_FILEAUTH,'
      '  NOTIFY_EMAIL'
      'from DATOSVEHICULO '
      'where'
      '  CHASSIS = :CHASSIS and'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select '
      'CHASSIS'
      ', CODIGO_CTE'
      ', NUMERO, NUM_CERTIFICADO'
      ', NUMPOL'
      ',NOTIFY_EMAIL  from DATOSVEHICULO'
      'where chassis =:chassis and numero=:numero')
    ModifySQL.Strings = (
      'update DATOSVEHICULO'
      'set'
      '  NOTIFY_EMAIL = :NOTIFY_EMAIL'
      'where'
      '  CHASSIS = :OLD_CHASSIS and'
      '  NUMERO = :OLD_NUMERO')
    Left = 560
    Top = 496
    object tblDatosNotifyGEmailCHASSIS: TIBStringField
      FieldName = 'CHASSIS'
      Origin = 'DATOSVEHICULO.CHASSIS'
    end
    object tblDatosNotifyGEmailCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'DATOSVEHICULO.CODIGO_CTE'
      Required = True
    end
    object tblDatosNotifyGEmailNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DATOSVEHICULO.NUMERO'
      Required = True
    end
    object tblDatosNotifyGEmailNUM_CERTIFICADO: TIntegerField
      FieldName = 'NUM_CERTIFICADO'
      Origin = 'DATOSVEHICULO.NUM_CERTIFICADO'
    end
    object tblDatosNotifyGEmailNUMPOL: TIntegerField
      FieldName = 'NUMPOL'
      Origin = 'DATOSVEHICULO.NUMPOL'
    end
    object tblDatosNotifyGEmailNOTIFY_EMAIL: TSmallintField
      FieldName = 'NOTIFY_EMAIL'
      Origin = 'DATOSVEHICULO.NOTIFY_EMAIL'
    end
  end
  object qryEmailTemplate: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From EMAIL_TEMPLATE'
      'where cia_key=:ciakey'
      'and idtipo=:idtipo'
      'and account_id=:tipoafiliado')
    Left = 40
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ciakey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idtipo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'tipoafiliado'
        ParamType = ptUnknown
      end>
    object qryEmailTemplateID: TIntegerField
      FieldName = 'ID'
      Origin = 'EMAIL_TEMPLATE.ID'
      Required = True
    end
    object qryEmailTemplateCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'EMAIL_TEMPLATE.CIA_KEY'
      Required = True
    end
    object qryEmailTemplateIDTIPO: TIntegerField
      FieldName = 'IDTIPO'
      Origin = 'EMAIL_TEMPLATE.IDTIPO'
      Required = True
    end
    object qryEmailTemplateACCOUNT_ID: TIntegerField
      FieldName = 'ACCOUNT_ID'
      Origin = 'EMAIL_TEMPLATE.ACCOUNT_ID'
      Required = True
    end
    object qryEmailTemplateBODY: TMemoField
      FieldName = 'BODY'
      Origin = 'EMAIL_TEMPLATE.BODY'
      BlobType = ftMemo
      Size = 8
    end
    object qryEmailTemplateSUBJECT: TIBStringField
      FieldName = 'SUBJECT'
      Origin = 'EMAIL_TEMPLATE.SUBJECT'
      Size = 60
    end
  end
  object tblTipoAfiliado: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDTIPO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'MONTOCOBERTURA'
        DataType = ftFloat
      end
      item
        Name = 'DIASDECARENCIA'
        DataType = ftInteger
      end
      item
        Name = 'YEARANTIGUEDAD'
        DataType = ftInteger
      end
      item
        Name = 'STATUS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RUTACARTABIENVENIDA'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <
      item
        Name = 'PK_TIPO_AFILIADO_0'
        Fields = 'IDTIPO'
        Options = [ixUnique]
      end
      item
        Name = 'IDX_TIPO_AFILIADO1'
        Fields = 'YEARANTIGUEDAD'
      end>
    StoreDefs = True
    TableName = 'TIPO_AFILIADO'
    Left = 192
    Top = 64
    object tblTipoAfiliadoIDTIPO: TIntegerField
      FieldName = 'IDTIPO'
    end
    object tblTipoAfiliadoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 80
    end
    object tblTipoAfiliadoRUTACARTABIENVENIDA: TIBStringField
      FieldName = 'RUTACARTABIENVENIDA'
      Size = 200
    end
  end
  object tblEmailTemplate: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from EMAIL_TEMPLATE'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into EMAIL_TEMPLATE'
      '  (ID, CIA_KEY, IDTIPO, ACCOUNT_ID, BODY, SUBJECT)'
      'values'
      '  (:ID, :CIA_KEY, :IDTIPO, :ACCOUNT_ID, :BODY, :SUBJECT)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  CIA_KEY,'
      '  IDTIPO,'
      '  ACCOUNT_ID,'
      '  BODY,'
      '  SUBJECT'
      'from EMAIL_TEMPLATE '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select e.subject tipoemail, t.* from EMAIL_TEMPLATE t'
      'inner join emailproceso e on e.idtipo = t.idtipo'
      '')
    ModifySQL.Strings = (
      'update EMAIL_TEMPLATE'
      'set'
      '  ID = :ID,'
      '  CIA_KEY = :CIA_KEY,'
      '  IDTIPO = :IDTIPO,'
      '  ACCOUNT_ID = :ACCOUNT_ID,'
      '  BODY = :BODY,'
      '  SUBJECT = :SUBJECT'
      'where'
      '  ID = :OLD_ID')
    Left = 88
    Top = 88
    object tblEmailTemplateID: TIntegerField
      FieldName = 'ID'
      Origin = 'EMAIL_TEMPLATE.ID'
      Required = True
    end
    object tblEmailTemplateCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'EMAIL_TEMPLATE.CIA_KEY'
      Required = True
    end
    object tblEmailTemplateIDTIPO: TIntegerField
      FieldName = 'IDTIPO'
      Origin = 'EMAIL_TEMPLATE.IDTIPO'
      Required = True
    end
    object tblEmailTemplateACCOUNT_ID: TIntegerField
      FieldName = 'ACCOUNT_ID'
      Origin = 'EMAIL_TEMPLATE.ACCOUNT_ID'
      Required = True
    end
    object tblEmailTemplateBODY: TMemoField
      FieldName = 'BODY'
      Origin = 'EMAIL_TEMPLATE.BODY'
      BlobType = ftMemo
      Size = 8
    end
    object tblEmailTemplateTIPOEMAIL: TIBStringField
      FieldName = 'TIPOEMAIL'
      Origin = 'EMAILPROCESO.SUBJECT'
      Size = 80
    end
    object tblEmailTemplateSUBJECT: TIBStringField
      FieldName = 'SUBJECT'
      Origin = 'EMAIL_TEMPLATE.SUBJECT'
      Size = 60
    end
  end
  object qryBuscarEmailTemplate: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select id From EMAIL_TEMPLATE'
      'where cia_key=:ciakey'
      'and idtipo=:idtipo'
      'and account_id=:tipoafiliado')
    Left = 216
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ciakey'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idtipo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipoafiliado'
        ParamType = ptInput
      end>
  end
  object qryEmailProcesoLookup: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  *  from EMAILPROCESO')
    Left = 64
    Top = 224
    object qryEmailProcesoLookupIDTIPO: TIntegerField
      FieldName = 'IDTIPO'
      Origin = 'EMAILPROCESO.IDTIPO'
      Required = True
    end
    object qryEmailProcesoLookupSUBJECT: TIBStringField
      FieldName = 'SUBJECT'
      Origin = 'EMAILPROCESO.SUBJECT'
      Size = 80
    end
  end
  object tblEcfCiudades: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ECF_TERRITORIO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into ECF_TERRITORIO'
      '  (CODIGO, NOMBRE)'
      'values'
      '  (:CODIGO, :NOMBRE)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  NOMBRE'
      'from ECF_TERRITORIO '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'select *  from ECF_TERRITORIO')
    ModifySQL.Strings = (
      'update ECF_TERRITORIO'
      'set'
      '  CODIGO = :CODIGO,'
      '  NOMBRE = :NOMBRE'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 656
    Top = 536
    object tblEcfCiudadesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ECF_TERRITORIO.CODIGO'
      Required = True
    end
    object tblEcfCiudadesNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'ECF_TERRITORIO.NOMBRE'
      Required = True
      Size = 60
    end
  end
  object dstblEcfCiudades: TDataSource
    DataSet = tblEcfCiudades
    Left = 736
    Top = 552
  end
  object qryProvinciaseCF: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CODIGO, NOMBRE'
      'FROM ECF_TERRITORIO'
      'WHERE (CHAR_LENGTH(CODIGO) <=6'
      'AND SUBSTRING(CODIGO FROM 3 FOR 4) = '#39'0000'#39')'
      'OR (NOMBRE LIKE '#39'PROVINCIA%'#39') OR (CODIGO = '#39'10000'#39')')
    Left = 840
    Top = 32
    object qryProvinciaseCFCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ECF_TERRITORIO.CODIGO'
      Required = True
    end
    object qryProvinciaseCFNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'ECF_TERRITORIO.NOMBRE'
      Required = True
      Size = 60
    end
  end
  object qryMunicipioseCF: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CODIGO, NOMBRE'
      'FROM ECF_TERRITORIO'
      'WHERE CODIGO LIKE SUBSTRING(:codsel1 FROM 1 FOR 2) || '#39'%'#39' '
      'AND CODIGO <> :codsel2; ')
    Left = 840
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codsel1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codsel2'
        ParamType = ptUnknown
      end>
    object qryMunicipioseCFCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ECF_TERRITORIO.CODIGO'
      Required = True
    end
    object qryMunicipioseCFNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'ECF_TERRITORIO.NOMBRE'
      Required = True
      Size = 60
    end
  end
  object qryEscalaISR: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'SELECT * FROM RETENCION_ISR'
      'Where  :Fecha between fecha_ini And fecha_fin')
    Left = 152
    Top = 191
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Fecha'
        ParamType = ptInput
        Value = '01/01/2026'
      end>
    object qryEscalaISRCODIGO_RETENCION: TIntegerField
      DisplayWidth = 22
      FieldName = 'CODIGO_RETENCION'
      Origin = 'RETENCION_ISR.CODIGO_RETENCION'
      Required = True
    end
    object qryEscalaISRCODIGO_ESCALA: TIntegerField
      DisplayLabel = 'CodEscala'
      DisplayWidth = 13
      FieldName = 'CODIGO_ESCALA'
      Origin = 'RETENCION_ISR.CODIGO_ESCALA'
    end
    object qryEscalaISRESCALA_RETENCION: TFloatField
      DisplayLabel = 'EscalaRet'
      DisplayWidth = 16
      FieldName = 'ESCALA_RETENCION'
      Origin = 'RETENCION_ISR.ESCALA_RETENCION'
      DisplayFormat = ',0.00'
    end
    object qryEscalaISRTASA_EXENTO: TFloatField
      DisplayLabel = 'Exento'
      DisplayWidth = 9
      FieldName = 'TASA_EXENTO'
      Origin = 'RETENCION_ISR.TASA_EXENTO'
      DisplayFormat = ',0.00'
    end
    object qryEscalaISREXCEDENTE: TFloatField
      DisplayLabel = 'Excedente'
      DisplayWidth = 15
      FieldName = 'EXCEDENTE'
      Origin = 'RETENCION_ISR.EXCEDENTE'
      DisplayFormat = ',0.00'
    end
    object qryEscalaISROBSERVACIONES: TIBStringField
      DisplayWidth = 24
      FieldName = 'OBSERVACIONES'
      Origin = 'RETENCION_ISR.OBSERVACIONES'
      Size = 40
    end
    object qryEscalaISRSTATUS_RETEN: TIBStringField
      DisplayWidth = 17
      FieldName = 'STATUS_RETEN'
      Origin = 'RETENCION_ISR.STATUS_RETEN'
      FixedChar = True
      Size = 1
    end
    object qryEscalaISRFECHA_INI: TDateTimeField
      DisplayWidth = 13
      FieldName = 'FECHA_INI'
      Origin = 'RETENCION_ISR.FECHA_INI'
    end
    object qryEscalaISRFECHA_FIN: TDateTimeField
      DisplayWidth = 13
      FieldName = 'FECHA_FIN'
      Origin = 'RETENCION_ISR.FECHA_FIN'
    end
  end
  object qryRegAdicional: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'Select * From Adicional_Regalia'
      'where anio_regalia = :anioregalia')
    UpdateObject = updqryRegAdicional
    Left = 264
    Top = 536
    ParamData = <
      item
        DataType = ftInteger
        Name = 'anioregalia'
        ParamType = ptInput
      end>
    object qryRegAdicionalANIO_REGALIA: TIntegerField
      FieldName = 'ANIO_REGALIA'
      Origin = 'ADICIONAL_REGALIA.ANIO_REGALIA'
      Required = True
    end
    object qryRegAdicionalCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
      Origin = 'ADICIONAL_REGALIA.CODIGO_CIA'
      Required = True
    end
    object qryRegAdicionalCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'ADICIONAL_REGALIA.CODIGO_EMP'
      Required = True
    end
    object qryRegAdicionalMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'ADICIONAL_REGALIA.MONTO'
    end
    object qryRegAdicionalSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ADICIONAL_REGALIA.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRegAdicionalINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'ADICIONAL_REGALIA.INSERTADO_POR'
      Size = 12
    end
    object qryRegAdicionalFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ADICIONAL_REGALIA.FECHA_IN'
    end
    object qryRegAdicionalMODIFICADO_POR: TIBStringField
      FieldName = 'MODIFICADO_POR'
      Origin = 'ADICIONAL_REGALIA.MODIFICADO_POR'
      Size = 12
    end
    object qryRegAdicionalFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'ADICIONAL_REGALIA.FECHA_MOD'
    end
  end
  object updqryRegAdicional: TIBUpdateSQL
    ModifySQL.Strings = (
      'update Adicional_Regalia'
      'set'
      '  ANIO_REGALIA = :ANIO_REGALIA,'
      '  CODIGO_CIA = :CODIGO_CIA,'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  MONTO = :MONTO,'
      '  STATUS = :STATUS,'
      '  INSERTADO_POR = :INSERTADO_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MODIFICADO_POR = :MODIFICADO_POR,'
      '  FECHA_MOD = :FECHA_MOD'
      'where'
      '  ANIO_REGALIA = :OLD_ANIO_REGALIA and'
      '  CODIGO_CIA = :OLD_CODIGO_CIA and'
      '  CODIGO_EMP = :OLD_CODIGO_EMP')
    InsertSQL.Strings = (
      'insert into Adicional_Regalia'
      
        '  (ANIO_REGALIA, CODIGO_CIA, CODIGO_EMP, MONTO, STATUS, INSERTAD' +
        'O_POR, '
      '   FECHA_IN, MODIFICADO_POR, FECHA_MOD)'
      'values'
      
        '  (:ANIO_REGALIA, :CODIGO_CIA, :CODIGO_EMP, :MONTO, :STATUS, :IN' +
        'SERTADO_POR, '
      '   :FECHA_IN, :MODIFICADO_POR, :FECHA_MOD)')
    DeleteSQL.Strings = (
      'delete from Adicional_Regalia'
      'where'
      '  ANIO_REGALIA = :OLD_ANIO_REGALIA and'
      '  CODIGO_CIA = :OLD_CODIGO_CIA and'
      '  CODIGO_EMP = :OLD_CODIGO_EMP')
    Left = 157
    Top = 600
  end
  object dtqryRegAdicional: TDataSource
    DataSet = qryRegAdicional
    Left = 256
    Top = 592
  end
  object QryProyRegalia: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = QryProyRegaliaCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from Proc_ProyRegalia('
      ':FechaIni,:FechaFin)'
      'order by SALARIOMENSUAL DESC'
      ',CODIGO ')
    OnFilterRecord = QryProyRegaliaFilterRecord
    Left = 835
    Top = 205
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FechaIni'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FechaFin'
        ParamType = ptInput
      end>
    object QryProyRegaliaCIA_KEY: TSmallintField
      FieldName = 'CIA_KEY'
      Origin = 'PROC_PROYREGALIA.CIA_KEY'
    end
    object QryProyRegaliaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'PROC_PROYREGALIA.CODIGO'
    end
    object QryProyRegaliaNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'PROC_PROYREGALIA.NOMBRE'
      Size = 30
    end
    object QryProyRegaliaAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'PROC_PROYREGALIA.APELLIDO'
      Size = 30
    end
    object QryProyRegaliaSALARIOMENSUAL: TFloatField
      FieldName = 'SALARIOMENSUAL'
      Origin = 'PROC_PROYREGALIA.SALARIOMENSUAL'
    end
    object QryProyRegaliaSTATUS_EMP: TIBStringField
      FieldName = 'STATUS_EMP'
      Origin = 'PROC_PROYREGALIA.STATUS_EMP'
      FixedChar = True
      Size = 1
    end
    object QryProyRegaliaSALARIOACUMULADO: TFloatField
      FieldName = 'SALARIOACUMULADO'
      Origin = 'PROC_PROYREGALIA.SALARIOACUMULADO'
    end
    object QryProyRegaliaTIPOSERVICIO: TIntegerField
      FieldName = 'TIPOSERVICIO'
      Origin = 'PROC_PROYREGALIA.TIPOSERVICIO'
    end
    object QryProyRegaliaSUBTIPOSERV: TIntegerField
      FieldName = 'SUBTIPOSERV'
      Origin = 'PROC_PROYREGALIA.SUBTIPOSERV'
    end
    object QryProyRegaliaSTATUS_REGALIA: TIBStringField
      FieldName = 'STATUS_REGALIA'
      Origin = 'PROC_PROYREGALIA.STATUS_REGALIA'
      FixedChar = True
      Size = 1
    end
    object QryProyRegaliaSALARIOPROY: TFloatField
      DisplayLabel = 'Salario Proyectado'
      FieldKind = fkCalculated
      FieldName = 'SALARIOPROY'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object QryProyRegaliaTOTALACUM: TFloatField
      DisplayLabel = 'TSalario Acum'
      FieldKind = fkCalculated
      FieldName = 'TOTALACUM'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object QryProyRegaliaREG_PROY: TFloatField
      DisplayLabel = 'ProyRegalia'
      FieldKind = fkCalculated
      FieldName = 'REG_PROY'
      DisplayFormat = ',0.00'
      Calculated = True
    end
  end
  object dtQryProyRegalia: TDataSource
    DataSet = QryProyRegalia
    Left = 837
    Top = 253
  end
  object updqryFirmCredCoop: TIBUpdateSQL
    ModifySQL.Strings = (
      'update coop_apr_creditos'
      'set'
      '  CODIGO = :CODIGO,'
      '  NOMBRE = :NOMBRE,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into coop_apr_creditos'
      '  (CODIGO, NOMBRE, STATUS, FECHA_IN, IN_POR, FECHA_MOD, MOD_POR)'
      'values'
      
        '  (:CODIGO, :NOMBRE, :STATUS, :FECHA_IN, :IN_POR, :FECHA_MOD, :M' +
        'OD_POR)')
    DeleteSQL.Strings = (
      'delete from coop_apr_creditos'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 368
    Top = 648
  end
  object qryFirmCredCoop: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select * from coop_apr_creditos')
    UpdateObject = updqryFirmCredCoop
    Left = 368
    Top = 592
    object qryFirmCredCoopCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'COOP_APR_CREDITOS.CODIGO'
    end
    object qryFirmCredCoopNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COOP_APR_CREDITOS.NOMBRE'
      Size = 40
    end
    object qryFirmCredCoopFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'COOP_APR_CREDITOS.FECHA_IN'
    end
    object qryFirmCredCoopFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'COOP_APR_CREDITOS.FECHA_MOD'
    end
    object qryFirmCredCoopSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'COOP_APR_CREDITOS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryFirmCredCoopMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'COOP_APR_CREDITOS.MOD_POR'
      Size = 12
    end
    object qryFirmCredCoopIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'COOP_APR_CREDITOS.IN_POR'
      Size = 12
    end
  end
  object qryBoni: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      '  CIA_KEY,'
      '  CODIGO,'
      '  FECHA,'
      '  MONTO_BONIFIACION,'
      '  ISR,'
      '  STATUS '
      'From PAGO_BONIFICACION '
      'Where fecha =:fechaboni')
    Left = 928
    Top = 176
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaboni'
        ParamType = ptInput
      end>
    object qryBoniCIA_KEY: TSmallintField
      FieldName = 'CIA_KEY'
      Origin = 'PAGO_BONIFICACION.CIA_KEY'
      Required = True
    end
    object qryBoniCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'PAGO_BONIFICACION.CODIGO'
      Required = True
    end
    object qryBoniFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PAGO_BONIFICACION.FECHA'
      Required = True
    end
    object qryBoniMONTO_BONIFIACION: TFloatField
      FieldName = 'MONTO_BONIFIACION'
      Origin = 'PAGO_BONIFICACION.MONTO_BONIFIACION'
    end
    object qryBoniISR: TFloatField
      FieldName = 'ISR'
      Origin = 'PAGO_BONIFICACION.ISR'
    end
    object qryBoniSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PAGO_BONIFICACION.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryStatusRegalia: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   '
      '  CODIGO'
      '  CIA_KEY,'
      '  ANO_REGALIA,'
      '  STATUS'
      'FROM STATUS_REGALIA '
      'WHERE F_YEAR(ANO_REGALIA) = F_YEAR(:FECHAREGALIA)'
      '')
    Left = 347
    Top = 532
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHAREGALIA'
        ParamType = ptInput
      end>
    object qryStatusRegaliaCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'STATUS_REGALIA.CODIGO'
      Required = True
    end
    object qryStatusRegaliaANO_REGALIA: TDateTimeField
      FieldName = 'ANO_REGALIA'
      Origin = 'STATUS_REGALIA.ANO_REGALIA'
    end
    object qryStatusRegaliaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'STATUS_REGALIA.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryDatosBoni: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'PAGO_BONIFICACION.CIA_KEY, '
      'PAGO_BONIFICACION.CODIGO, '
      'PAGO_BONIFICACION.FECHA, '
      'PAGO_BONIFICACION.MONTO_BONIFIACION, '
      'PAGO_BONIFICACION.ISR, '
      '(PAGO_BONIFICACION.MONTO_BONIFIACION - '
      'PAGO_BONIFICACION.ISR) BonoNeto,'
      'PAGO_BONIFICACION.NUMERO_CKS, '
      'PAGO_BONIFICACION.STATUS, '
      'Empleados.DEPTO_EMP, Empleados.SECCION_EMP'
      'FROM PAGO_BONIFICACION'
      '   INNER JOIN EMPLEADOS Empleados'
      '   ON  (PAGO_BONIFICACION.CODIGO = Empleados.CODIGO)  '
      '   AND  (PAGO_BONIFICACION.CIA_KEY = Empleados.CIA_KEY)  '
      'Where Fecha = :fechaboni'
      'and PAGO_BONIFICACION.NUMERO_CKS is null'
      
        'ORDER BY Empleados.DEPTO_EMP, Empleados.SECCION_EMP, PAGO_BONIFI' +
        'CACION.CODIGO')
    Left = 936
    Top = 69
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaboni'
        ParamType = ptInput
      end>
    object qryDatosBoniCIA_KEY: TSmallintField
      FieldName = 'CIA_KEY'
      Origin = 'PAGO_BONIFICACION.CIA_KEY'
      Required = True
    end
    object qryDatosBoniCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'PAGO_BONIFICACION.CODIGO'
      Required = True
    end
    object qryDatosBoniFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PAGO_BONIFICACION.FECHA'
      Required = True
    end
    object qryDatosBoniMONTO_BONIFIACION: TFloatField
      FieldName = 'MONTO_BONIFIACION'
      Origin = 'PAGO_BONIFICACION.MONTO_BONIFIACION'
    end
    object qryDatosBoniISR: TFloatField
      FieldName = 'ISR'
      Origin = 'PAGO_BONIFICACION.ISR'
    end
    object qryDatosBoniBONONETO: TFloatField
      FieldName = 'BONONETO'
    end
    object qryDatosBoniNUMERO_CKS: TIntegerField
      FieldName = 'NUMERO_CKS'
      Origin = 'PAGO_BONIFICACION.NUMERO_CKS'
    end
    object qryDatosBoniSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PAGO_BONIFICACION.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryDatosBoniDEPTO_EMP: TIntegerField
      FieldName = 'DEPTO_EMP'
      Origin = 'EMPLEADOS.DEPTO_EMP'
    end
    object qryDatosBoniSECCION_EMP: TIntegerField
      FieldName = 'SECCION_EMP'
      Origin = 'EMPLEADOS.SECCION_EMP'
    end
  end
  object dtTipoOrdenEmpCoop: TDataSource
    DataSet = tTipoOrdenEmpCoop
    Left = 536
    Top = 568
  end
  object dtqryEmpRegalia: TDataSource
    Left = 440
    Top = 536
  end
  object dtqryBoni: TDataSource
    DataSet = qryBoni
    Left = 936
    Top = 120
  end
  object qryChequesPTipo: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'Cheques_ptipo.DESCRIPCION, '
      'Cheques_ptipocta.TIPO_CKS, '
      'Cheques_ptipocta.TIPOSERVICIO, '
      'Cheques_ptipocta.CUENTA1_CAT, '
      'Cheques_ptipocta.CUENTA2_CAT,'
      'Cheques_ptipocta.CUENTA3_CAT,'
      'Cheques_ptipocta.CTA_CONCEPTO,'
      'Cheques_ptipocta.COD_SUBTIPO'
      'FROM CHEQUES_PTIPO Cheques_ptipo'
      '   INNER JOIN CHEQUES_PTIPOCTA Cheques_ptipocta'
      '   ON  (Cheques_ptipo.TIPO_CKS = Cheques_ptipocta.TIPO_CKS)  '
      'Where Cheques_ptipocta.TIPO_CKS = 4'
      'And Cheques_ptipocta.TIPOSERVICIO = :TIPOSERVICIO'
      'And Cheques_ptipocta.COD_SUBTIPO = :CODSUBTIPO')
    Left = 912
    Top = 380
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPOSERVICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODSUBTIPO'
        ParamType = ptInput
      end>
    object qryChequesPTipoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'CHEQUES_PTIPO.DESCRIPCION'
      Size = 30
    end
    object qryChequesPTipoTIPO_CKS: TSmallintField
      FieldName = 'TIPO_CKS'
      Origin = 'CHEQUES_PTIPOCTA.TIPO_CKS'
      Required = True
    end
    object qryChequesPTipoTIPOSERVICIO: TIntegerField
      FieldName = 'TIPOSERVICIO'
      Origin = 'CHEQUES_PTIPOCTA.TIPOSERVICIO'
      Required = True
    end
    object qryChequesPTipoCUENTA1_CAT: TIBStringField
      FieldName = 'CUENTA1_CAT'
      Origin = 'CHEQUES_PTIPOCTA.CUENTA1_CAT'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryChequesPTipoCUENTA2_CAT: TIBStringField
      FieldName = 'CUENTA2_CAT'
      Origin = 'CHEQUES_PTIPOCTA.CUENTA2_CAT'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryChequesPTipoCUENTA3_CAT: TIBStringField
      FieldName = 'CUENTA3_CAT'
      Origin = 'CHEQUES_PTIPOCTA.CUENTA3_CAT'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryChequesPTipoCTA_CONCEPTO: TIntegerField
      FieldName = 'CTA_CONCEPTO'
      Origin = 'CHEQUES_PTIPOCTA.CTA_CONCEPTO'
      Required = True
    end
    object qryChequesPTipoCOD_SUBTIPO: TSmallintField
      FieldName = 'COD_SUBTIPO'
      Origin = 'CHEQUES_PTIPOCTA.COD_SUBTIPO'
    end
  end
  object dtqryChequesPTipo: TDataSource
    DataSet = qryChequesPTipo
    Left = 912
    Top = 448
  end
  object qryOrdenEmp: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BeforeOpen = qryOrdenEmpBeforeOpen
    OnCalcFields = qryOrdenEmpCalcFields
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'Select * from orden_empleados'
      'Where fecha between :fechaini and :fechafin'
      'order by COD_PROVEEDOR,Numero, codigo, fecha')
    UpdateObject = updqryOrdenEmp
    Left = 928
    Top = 232
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechaini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafin'
        ParamType = ptInput
      end>
    object qryOrdenEmpTipoOrdenDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'TipoOrdenDesc'
      LookupDataSet = tTipoOrdenEmpCoop
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'TIPO_ORDEN'
      Lookup = True
    end
    object qryOrdenEmpNombreCompleto: TStringField
      FieldKind = fkCalculated
      FieldName = 'NombreCompleto'
      Size = 50
      Calculated = True
    end
    object qryOrdenEmpNOMBREPROVEE: TStringField
      FieldKind = fkLookup
      FieldName = 'NOMBREPROVEE'
      LookupDataSet = tProveedores
      LookupKeyFields = 'CODIGO_CTE'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'COD_PROVEEDOR'
      Size = 30
      Lookup = True
    end
    object qryOrdenEmpAPELLIDO: TStringField
      FieldKind = fkLookup
      FieldName = 'APELLIDO'
      LookupDataSet = dmNomina.QryPersonal
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'APELLIDO'
      KeyFields = 'CODIGO'
      Size = 30
      Lookup = True
    end
    object qryOrdenEmpNOMB_EMPLEADO: TStringField
      FieldKind = fkLookup
      FieldName = 'NOMB_EMPLEADO'
      LookupDataSet = dmNomina.QryPersonal
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOMBRE'
      KeyFields = 'CODIGO'
      Size = 30
      Lookup = True
    end
    object qryOrdenEmpCEDULA: TStringField
      FieldKind = fkLookup
      FieldName = 'CEDULA'
      LookupDataSet = dmNomina.QryPersonal
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CEDULA'
      KeyFields = 'CODIGO'
      Lookup = True
    end
    object qryOrdenEmpCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ORDEN_EMPLEADOS.CODIGO'
      Required = True
    end
    object qryOrdenEmpFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ORDEN_EMPLEADOS.FECHA'
      Required = True
    end
    object qryOrdenEmpNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'ORDEN_EMPLEADOS.NUMERO'
    end
    object qryOrdenEmpCOD_PROVEEDOR: TIntegerField
      FieldName = 'COD_PROVEEDOR'
      Origin = 'ORDEN_EMPLEADOS.COD_PROVEEDOR'
    end
    object qryOrdenEmpMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'ORDEN_EMPLEADOS.MONTO'
    end
    object qryOrdenEmpSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ORDEN_EMPLEADOS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryOrdenEmpIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ORDEN_EMPLEADOS.IN_POR'
      Size = 12
    end
    object qryOrdenEmpFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ORDEN_EMPLEADOS.FECHA_IN'
    end
    object qryOrdenEmpMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'ORDEN_EMPLEADOS.MOD_POR'
      Size = 12
    end
    object qryOrdenEmpFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'ORDEN_EMPLEADOS.FECHA_MOD'
    end
    object qryOrdenEmpFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'ORDEN_EMPLEADOS.FORMA_PAGO'
    end
    object qryOrdenEmpTIPO_ORDEN: TIntegerField
      FieldName = 'TIPO_ORDEN'
      Origin = 'ORDEN_EMPLEADOS.TIPO_ORDEN'
    end
  end
  object qryRepOrdCFirm: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select nombre '
      'from coop_apr_creditos'
      'where status = '#39'A'#39
      '')
    Left = 904
    Top = 512
    object qryRepOrdCFirmNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'COOP_APR_CREDITOS.NOMBRE'
      Size = 40
    end
  end
  object tTipoOrdenEmpCoop: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TIPO_ORDEN_EMP'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TIPO_ORDEN_EMP'
      '  (CODIGO, DESCRIPCION)'
      'values'
      '  (:CODIGO, :DESCRIPCION)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  DESCRIPCION'
      'from TIPO_ORDEN_EMP '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'Select * from TIPO_ORDEN_EMP')
    ModifySQL.Strings = (
      'update TIPO_ORDEN_EMP'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRIPCION = :DESCRIPCION'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 680
    Top = 628
    object tTipoOrdenEmpCoopCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TIPO_ORDEN_EMP.CODIGO'
      Required = True
    end
    object tTipoOrdenEmpCoopDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_ORDEN_EMP.DESCRIPCION'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = tTipoOrdenEmpCoop
    Left = 800
    Top = 608
  end
  object tProveedores: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'Select * from proveedores')
    Left = 48
    Top = 536
    object tProveedoresCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROVEEDORES.CODIGO_CTE'
      Required = True
    end
    object tProveedoresTIPO_CLIENTE: TIntegerField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'PROVEEDORES.TIPO_CLIENTE'
    end
    object tProveedoresNOMBRE_ABR: TIBStringField
      FieldName = 'NOMBRE_ABR'
      Origin = 'PROVEEDORES.NOMBRE_ABR'
      Size = 60
    end
    object tProveedoresDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object tProveedoresCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'PROVEEDORES.CONTACTO'
      Size = 35
    end
    object tProveedoresPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PROVEEDORES.PAIS'
      Size = 30
    end
    object tProveedoresESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'PROVEEDORES.ESTADO'
      Size = 30
    end
    object tProveedoresCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROVEEDORES.CIUDAD'
    end
    object tProveedoresCALYYNUM: TIBStringField
      FieldName = 'CALYYNUM'
      Origin = 'PROVEEDORES.CALYYNUM'
      Size = 80
    end
    object tProveedoresTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object tProveedoresFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'PROVEEDORES.FAX'
      Size = 12
    end
    object tProveedoresCODIGOPOSTAL: TIBStringField
      FieldName = 'CODIGOPOSTAL'
      Origin = 'PROVEEDORES.CODIGOPOSTAL'
      FixedChar = True
      Size = 6
    end
    object tProveedoresEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'PROVEEDORES.EMAIL'
      Size = 40
    end
    object tProveedoresDIRECCIONWEB: TIBStringField
      FieldName = 'DIRECCIONWEB'
      Origin = 'PROVEEDORES.DIRECCIONWEB'
      Size = 40
    end
    object tProveedoresSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROVEEDORES.STATUS'
      FixedChar = True
      Size = 1
    end
    object tProveedoresFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PROVEEDORES.FECHA_IN'
    end
    object tProveedoresIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PROVEEDORES.IN_POR'
      Size = 12
    end
    object tProveedoresFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PROVEEDORES.FECHA_MOD'
    end
    object tProveedoresMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PROVEEDORES.MOD_POR'
      Size = 12
    end
    object tProveedoresRNC_PROVEEDOR: TIBStringField
      FieldName = 'RNC_PROVEEDOR'
      Origin = 'PROVEEDORES.RNC_PROVEEDOR'
      Size = 15
    end
    object tProveedoresMOVIL1: TIBStringField
      FieldName = 'MOVIL1'
      Origin = 'PROVEEDORES.MOVIL1'
    end
    object tProveedoresMOVIL2: TIBStringField
      FieldName = 'MOVIL2'
      Origin = 'PROVEEDORES.MOVIL2'
    end
    object tProveedoresTELEFONO2: TIBStringField
      FieldName = 'TELEFONO2'
      Origin = 'PROVEEDORES.TELEFONO2'
    end
    object tProveedoresTELEFONO3: TIBStringField
      FieldName = 'TELEFONO3'
      Origin = 'PROVEEDORES.TELEFONO3'
    end
    object tProveedoresEXTENSIONES: TIBStringField
      FieldName = 'EXTENSIONES'
      Origin = 'PROVEEDORES.EXTENSIONES'
      Size = 40
    end
    object tProveedoresCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'PROVEEDORES.CIA_KEY'
    end
    object tProveedoresLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'PROVEEDORES.LIMITE_CREDITO'
    end
    object tProveedoresCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'PROVEEDORES.COD_VENDEDOR'
    end
    object tProveedoresCONDICION: TIntegerField
      FieldName = 'CONDICION'
      Origin = 'PROVEEDORES.CONDICION'
    end
    object tProveedoresCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'PROVEEDORES.CANT_DIAS_CREDITO'
    end
    object tProveedoresIDTIPO_PROV: TIntegerField
      FieldName = 'IDTIPO_PROV'
      Origin = 'PROVEEDORES.IDTIPO_PROV'
    end
    object tProveedoresTIPODOC: TSmallintField
      FieldName = 'TIPODOC'
      Origin = 'PROVEEDORES.TIPODOC'
    end
    object tProveedoresID_PROVINCIA: TIntegerField
      FieldName = 'ID_PROVINCIA'
      Origin = 'PROVEEDORES.ID_PROVINCIA'
    end
    object tProveedoresID_MUNICIPIO: TIntegerField
      FieldName = 'ID_MUNICIPIO'
      Origin = 'PROVEEDORES.ID_MUNICIPIO'
    end
  end
  object dtqryOrdenEmp: TDataSource
    DataSet = qryOrdenEmp
    Left = 412
    Top = 64
  end
  object dtqryFirmCredCoop: TDataSource
    DataSet = qryFirmCredCoop
    Left = 600
    Top = 216
  end
  object updqryOrdenEmp: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  FECHA,'
      '  NUMERO,'
      '  COD_PROVEEDOR,'
      '  MONTO,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD,'
      '  FORMA_PAGO,'
      '  TIPO_ORDEN'
      'from orden_empleados '
      'where'
      '  CODIGO = :CODIGO and'
      '  FECHA = :FECHA')
    ModifySQL.Strings = (
      'update orden_empleados'
      'set'
      '  CODIGO = :CODIGO,'
      '  FECHA = :FECHA,'
      '  NUMERO = :NUMERO,'
      '  COD_PROVEEDOR = :COD_PROVEEDOR,'
      '  MONTO = :MONTO,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  FORMA_PAGO = :FORMA_PAGO,'
      '  TIPO_ORDEN = :TIPO_ORDEN'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  FECHA = :OLD_FECHA')
    InsertSQL.Strings = (
      'insert into orden_empleados'
      
        '  (CODIGO, FECHA, NUMERO, COD_PROVEEDOR, MONTO, STATUS, IN_POR, ' +
        'FECHA_IN, '
      '   MOD_POR, FECHA_MOD, FORMA_PAGO, TIPO_ORDEN)'
      'values'
      
        '  (:CODIGO, :FECHA, :NUMERO, :COD_PROVEEDOR, :MONTO, :STATUS, :I' +
        'N_POR, '
      '   :FECHA_IN, :MOD_POR, :FECHA_MOD, :FORMA_PAGO, :TIPO_ORDEN)')
    DeleteSQL.Strings = (
      'delete from orden_empleados'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  FECHA = :OLD_FECHA')
    Left = 936
    Top = 280
  end
  object qryRepIR13: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qryRepIR13CalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Empleados.CODIGO, '
      'Empleados.NOMBRE, '
      'Empleados.APELLIDO, '
      'Empleados.CEDULA, '
      'Empleados.STATUS,'
      'Empleados.DEPTO_EMP,'
      'SUM(Nomina.SALARIO_BRUTO) SALARIO_BRUTO, '
      'SUM(Nomina.OTROS_INGRESOS) OTROS_INGRESOS, '
      'SUM(Nomina.ISR) ISR_RETENIDO,'
      'SUM(Nomina.Monto_afp) afp'
      ''
      'FROM NOMINA Nomina'
      '   INNER JOIN EMPLEADO Empleados'
      '   ON  (Nomina.CODIGO_EMP = Empleados.CODIGO)  '
      'WHERE FECHA_NOMINA BETWEEN :Fechaini And :Fechafin'
      'AND STATUS_NOMINA IN ('#39'A'#39','#39'P'#39')'
      'GROUP BY '
      'Empleados.CODIGO,'
      'Empleados.NOMBRE,'
      'Empleados.APELLIDO,'
      'Empleados.CEDULA,'
      'Empleados.STATUS,'
      'Empleados.DEPTO_EMP'
      ''
      'ORDER BY  Empleados.DEPTO_EMP,Empleados.CODIGO')
    Left = 928
    Top = 576
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Fechaini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fechafin'
        ParamType = ptUnknown
      end>
    object qryRepIR13CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMPLEADO.CODIGO'
      Required = True
    end
    object qryRepIR13NOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object qryRepIR13APELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADO.APELLIDO'
      Size = 35
    end
    object qryRepIR13CEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'EMPLEADO.CEDULA'
      Size = 14
    end
    object qryRepIR13STATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'EMPLEADO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepIR13DEPTO_EMP: TSmallintField
      FieldName = 'DEPTO_EMP'
      Origin = 'EMPLEADO.DEPTO_EMP'
    end
    object qryRepIR13SALARIO_BRUTO: TFloatField
      FieldName = 'SALARIO_BRUTO'
    end
    object qryRepIR13OTROS_INGRESOS: TFloatField
      FieldName = 'OTROS_INGRESOS'
    end
    object qryRepIR13ISR_RETENIDO: TFloatField
      FieldName = 'ISR_RETENIDO'
    end
    object qryRepIR13AFP: TFloatField
      FieldName = 'AFP'
    end
    object qryRepIR13MontoBoni: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MontoBoni'
      Calculated = True
    end
    object qryRepIR13SalarioExcAfp: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SalarioExcAfp'
      Calculated = True
    end
    object qryRepIR13MONTO_VAC: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MONTO_VAC'
      Calculated = True
    end
    object qryRepIR13MONTO_REGALIA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MONTO_REGALIA'
      Calculated = True
    end
    object qryRepIR13ISR_CALCULADO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ISR_CALCULADO'
      Calculated = True
    end
    object qryRepIR13SalarioProy: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SalarioProy'
      Calculated = True
    end
  end
  object QryVaca: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from VACACIONES'
      'where'
      '  CODIGO_TRANS = :OLD_CODIGO_TRANS')
    InsertSQL.Strings = (
      'insert into VACACIONES'
      
        '  (CODIGO_TRANS, CODIGO_TIPO_TRANS, CODIGO_TIPO_NOMINA, CODIGO, ' +
        'VALOR_TRANS, '
      
        '   FECHA_ENT, FECHA_SAL, OBSERVACIONES, STATUS_TRANS, TIPO_CTA, ' +
        'CANT_DIAS, '
      '   FECHA_EFECTIVA)'
      'values'
      
        '  (:CODIGO_TRANS, :CODIGO_TIPO_TRANS, :CODIGO_TIPO_NOMINA, :CODI' +
        'GO, :VALOR_TRANS, '
      
        '   :FECHA_ENT, :FECHA_SAL, :OBSERVACIONES, :STATUS_TRANS, :TIPO_' +
        'CTA, :CANT_DIAS, '
      '   :FECHA_EFECTIVA)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_TRANS,'
      '  CODIGO_TIPO_TRANS,'
      '  CODIGO_TIPO_NOMINA,'
      '  CODIGO,'
      '  VALOR_TRANS,'
      '  FECHA_ENT,'
      '  FECHA_SAL,'
      '  OBSERVACIONES,'
      '  STATUS_TRANS,'
      '  TIPO_CTA,'
      '  CANT_DIAS,'
      '  FECHA_EFECTIVA'
      'from VACACIONES '
      'where'
      '  CODIGO_TRANS = :CODIGO_TRANS')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VACACIONES Vacaciones'
      'Where Fecha_Ent >=:Fecha_ini '
      'and Fecha_Sal <=:Fecha_Fin'
      'Order By Codigo')
    ModifySQL.Strings = (
      'update VACACIONES'
      'set'
      '  CODIGO_TRANS = :CODIGO_TRANS,'
      '  CODIGO_TIPO_TRANS = :CODIGO_TIPO_TRANS,'
      '  CODIGO_TIPO_NOMINA = :CODIGO_TIPO_NOMINA,'
      '  CODIGO = :CODIGO,'
      '  VALOR_TRANS = :VALOR_TRANS,'
      '  FECHA_ENT = :FECHA_ENT,'
      '  FECHA_SAL = :FECHA_SAL,'
      '  OBSERVACIONES = :OBSERVACIONES,'
      '  STATUS_TRANS = :STATUS_TRANS,'
      '  TIPO_CTA = :TIPO_CTA,'
      '  CANT_DIAS = :CANT_DIAS,'
      '  FECHA_EFECTIVA = :FECHA_EFECTIVA'
      'where'
      '  CODIGO_TRANS = :OLD_CODIGO_TRANS')
    Left = 920
    Top = 624
    object QryVacaCODIGO_TRANS: TIntegerField
      FieldName = 'CODIGO_TRANS'
      Origin = 'VACACIONES.CODIGO_TRANS'
      Required = True
    end
    object QryVacaCODIGO_TIPO_TRANS: TSmallintField
      FieldName = 'CODIGO_TIPO_TRANS'
      Origin = 'VACACIONES.CODIGO_TIPO_TRANS'
    end
    object QryVacaCODIGO_TIPO_NOMINA: TSmallintField
      FieldName = 'CODIGO_TIPO_NOMINA'
      Origin = 'VACACIONES.CODIGO_TIPO_NOMINA'
    end
    object QryVacaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'VACACIONES.CODIGO'
    end
    object QryVacaVALOR_TRANS: TFloatField
      FieldName = 'VALOR_TRANS'
      Origin = 'VACACIONES.VALOR_TRANS'
    end
    object QryVacaFECHA_ENT: TDateTimeField
      FieldName = 'FECHA_ENT'
      Origin = 'VACACIONES.FECHA_ENT'
    end
    object QryVacaFECHA_SAL: TDateTimeField
      FieldName = 'FECHA_SAL'
      Origin = 'VACACIONES.FECHA_SAL'
    end
    object QryVacaOBSERVACIONES: TIBStringField
      FieldName = 'OBSERVACIONES'
      Origin = 'VACACIONES.OBSERVACIONES'
      Size = 40
    end
    object QryVacaSTATUS_TRANS: TIBStringField
      FieldName = 'STATUS_TRANS'
      Origin = 'VACACIONES.STATUS_TRANS'
      FixedChar = True
      Size = 1
    end
    object QryVacaTIPO_CTA: TSmallintField
      FieldName = 'TIPO_CTA'
      Origin = 'VACACIONES.TIPO_CTA'
    end
    object QryVacaCANT_DIAS: TIntegerField
      FieldName = 'CANT_DIAS'
      Origin = 'VACACIONES.CANT_DIAS'
    end
    object QryVacaFECHA_EFECTIVA: TDateTimeField
      FieldName = 'FECHA_EFECTIVA'
      Origin = 'VACACIONES.FECHA_EFECTIVA'
    end
  end
  object qryTotalNom: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'sum(Nomina.SALARIO_BRUTO) SBRUTO, '
      'sum(Nomina.IDSS) IDSS, '
      'sum(Nomina.COOPERATIVA) COOP, '
      'sum(0.0) SEGMED, '
      'sum(Nomina.ISR) ISR, '
      'sum(Nomina.OTROS_INGRESOS) OING, '
      'sum(Nomina.OTRAS_DEDUCCIONES) ODED, '
      'sum(Nomina.SALARIO_NETO) SNETO'
      'FROM NOMINA Nomina'
      '   INNER JOIN EMPLEADO Empleados'
      '   ON  (Nomina.CIA_KEY = Empleados.CODIGO_CIA)  '
      '   AND  (Nomina.CODIGO_EMP = Empleados.CODIGO)  '
      'and Nomina.STATUS_NOMINA = '#39'P'#39
      'WHERE Nomina.FECHA_NOMINA BETWEEN :FECHAINI AND :FECHAFIN'
      'and Empleados.CODIGO between :codigoini and :codigofin ')
    Left = 864
    Top = 560
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FECHAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHAFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigoini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'codigofin'
        ParamType = ptUnknown
      end>
    object qryTotalNomSBRUTO: TFloatField
      FieldName = 'SBRUTO'
    end
    object qryTotalNomIDSS: TFloatField
      FieldName = 'IDSS'
    end
    object qryTotalNomCOOP: TFloatField
      FieldName = 'COOP'
    end
    object qryTotalNomSEGMED: TFloatField
      FieldName = 'SEGMED'
    end
    object qryTotalNomISR: TFloatField
      FieldName = 'ISR'
    end
    object qryTotalNomOING: TFloatField
      FieldName = 'OING'
    end
    object qryTotalNomODED: TFloatField
      FieldName = 'ODED'
    end
    object qryTotalNomSNETO: TFloatField
      FieldName = 'SNETO'
    end
  end
  object qryLey8701: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From PROC_Ley87 ( :tipo,  :fechanom)')
    Left = 858
    Top = 616
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechanom'
        ParamType = ptInput
      end>
    object qryLey8701PORC_EMPLEADO: TFloatField
      FieldName = 'PORC_EMPLEADO'
    end
    object qryLey8701PORC_PATRONO: TFloatField
      FieldName = 'PORC_PATRONO'
    end
  end
  object tTablaRetIsr: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'RETENCION_ISR'
    Left = 544
    Top = 624
  end
  object qryEmpRegalia: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from EMP_DESAUCIADOS'
      'where'
      '  CIA_KEY = :OLD_CIA_KEY and'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into EMP_DESAUCIADOS'
      '  (CIA_KEY, CODIGO, STATUS)'
      'values'
      '  (:CIA_KEY, :CODIGO, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  CIA_KEY,'
      '  CODIGO,'
      '  STATUS'
      'from EMP_DESAUCIADOS '
      'where'
      '  CIA_KEY = :CIA_KEY and'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'SELECT '
      '  CIA_KEY,  CODIGO,  STATUS'
      'FROM EMP_DESAUCIADOS')
    ModifySQL.Strings = (
      'update EMP_DESAUCIADOS'
      'set'
      '  CIA_KEY = :CIA_KEY,'
      '  CODIGO = :CODIGO,'
      '  STATUS = :STATUS'
      'where'
      '  CIA_KEY = :OLD_CIA_KEY and'
      '  CODIGO = :OLD_CODIGO')
    Left = 848
    Top = 152
    object qryEmpRegaliaCIA_KEY: TSmallintField
      FieldName = 'CIA_KEY'
      Origin = 'EMP_DESAUCIADOS.CIA_KEY'
      Required = True
    end
    object qryEmpRegaliaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMP_DESAUCIADOS.CODIGO'
      Required = True
    end
    object qryEmpRegaliaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'EMP_DESAUCIADOS.STATUS'
      FixedChar = True
      Size = 1
    end
  end
end
