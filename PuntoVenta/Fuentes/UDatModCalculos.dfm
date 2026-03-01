object dmCalculos: TdmCalculos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 582
  Top = 255
  Height = 473
  Width = 698
  object ibsqlGetPorcDescFctSvr: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      '    SELECT '
      '      c.TIPO,'
      '      c.DESCRIPCION,'
      '      c.PORCIENTO,'
      '      c.FORMULA,'
      '      c.STATUS'
      '    FROM'
      '      CONF_DESC_FACTURAS c'
      'Where c.tipo=:tipo')
    Transaction = dmConectar.IBTransaction1
    Left = 273
    Top = 152
  end
  object rxError: TRxMemoryData
    FieldDefs = <
      item
        Name = 'cont'
        DataType = ftAutoInc
      end
      item
        Name = 'nota'
        DataType = ftString
        Size = 80
      end>
    Left = 72
    Top = 96
    object rxErrorcont: TAutoIncField
      FieldName = 'cont'
    end
    object rxErrornota: TStringField
      FieldName = 'nota'
      Size = 80
    end
  end
  object qryPosExtraDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BeforePost = qryPosExtraDetBeforePost
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from pos_extra_Det'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into pos_extra_Det'
      '  (SERIE, NUMERO, COD_USUARIO, FECHA, D_MONEDA, D_TIPO_VENTA, '
      'D_CODIGO_PROD, '
      '   D_CANT, D_PRECIO, D_TASA_ITBIS, D_PORCDESCITEM, '
      'T_PORCDESADICIONAL, '
      '   T_RECARGO, T_PROPINA, T_MONTOINTERES, T_MONTONCRAPLICADO, '
      'T_DEVOLUCION, '
      
        '   TC_TOTALNETO, TC_ITBIS, D_TIPO_UNIDAD, CODTEXTO, NUMERO_COTIZ' +
        'A, '
      'FECHA_COTIZA, '
      '   D_TRANSPITBIS)'
      'values'
      
        '  (:SERIE, :NUMERO, :COD_USUARIO, :FECHA, :D_MONEDA, :D_TIPO_VEN' +
        'TA, '
      '   :D_CODIGO_PROD, :D_CANT, :D_PRECIO, :D_TASA_ITBIS, '
      ':D_PORCDESCITEM, '
      
        '   :T_PORCDESADICIONAL, :T_RECARGO, :T_PROPINA, :T_MONTOINTERES,' +
        ' '
      ':T_MONTONCRAPLICADO, '
      '   :T_DEVOLUCION, :TC_TOTALNETO, :TC_ITBIS, :D_TIPO_UNIDAD, '
      ':CODTEXTO, '
      '   :NUMERO_COTIZA, :FECHA_COTIZA, :D_TRANSPITBIS)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  SERIE,'
      '  NUMERO,'
      '  COD_USUARIO,'
      '  FECHA,'
      '  D_MONEDA,'
      '  D_TIPO_VENTA,'
      '  D_CODIGO_PROD,'
      '  D_CANT,'
      '  D_PRECIO,'
      '  D_TASA_ITBIS,'
      '  D_PORCDESCITEM,'
      '  T_PORCDESADICIONAL,'
      '  T_RECARGO,'
      '  T_PROPINA,'
      '  T_MONTOINTERES,'
      '  T_MONTONCRAPLICADO,'
      '  T_DEVOLUCION,'
      '  TC_TOTALNETO,'
      '  TC_ITBIS,'
      '  D_TIPO_UNIDAD,'
      '  CODTEXTO,'
      '  NUMERO_COTIZA,'
      '  FECHA_COTIZA,'
      '  D_TRANSPITBIS,'
      '  DC_MONTOBRUTO,'
      '  DC_MONTODESCITEM,'
      '  DC_PORCPROPLEGAL,'
      '  TC_MONTODESCGLOBAL,'
      '  DC_ESDESITEM,'
      '  TC_MONTODESCITEMS,'
      '  TC_FMONTODESCNIVELITEM,'
      '  TC_SUBTOTAL,'
      '  TC_MONTODESCADICIONAL,'
      '  DC_PROPINALEGAL,'
      '  DC_ITBIS_CLD,'
      '  TC_MONTOITBISRECARGO_GLB,'
      '  TC_MONTOITBISRECARGO_ITM'
      'from pos_extra_Det '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'Select id,'
      '  SERIE,'
      '  NUMERO,'
      '  FECHA,'
      '  cod_usuario,'
      '  D_MONEDA ,'
      '  D_TIPO_VENTA,'
      '  D_CODIGO_PROD,'
      '  D_Tipo_unidad,'
      '  CodTexto,'
      '  D_CANT,'
      '  FECHA_COTIZA, NUMERO_COTIZA,'
      '  D_PRECIO,'
      '  D_TASA_ITBIS,'
      '  D_PORCDESCITEM,'
      '  T_PORCDESADICIONAL,'
      '  T_RECARGO,'
      '  T_PROPINA,'
      '  T_MONTOINTERES,'
      '  T_MONTONCRAPLICADO,'
      '  T_DEVOLUCION,'
      '  TC_TOTALNETO,'
      '  tC_ITBIS, D_TRANSPITBIS,'
      '  LEVEL_PRECIO_VENT'
      'From pos_extra_Det'
      'where numero=:numero'
      'order by numero, serie')
    ModifySQL.Strings = (
      'update pos_extra_Det'
      'set'
      '  ID = :ID,'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  FECHA = :FECHA,'
      '  D_MONEDA = :D_MONEDA,'
      '  D_TIPO_VENTA = :D_TIPO_VENTA,'
      '  D_CODIGO_PROD = :D_CODIGO_PROD,'
      '  D_CANT = :D_CANT,'
      '  D_PRECIO = :D_PRECIO,'
      '  D_TASA_ITBIS = :D_TASA_ITBIS,'
      '  D_PORCDESCITEM = :D_PORCDESCITEM,'
      '  T_PORCDESADICIONAL = :T_PORCDESADICIONAL,'
      '  T_RECARGO = :T_RECARGO,'
      '  T_PROPINA = :T_PROPINA,'
      '  T_MONTOINTERES = :T_MONTOINTERES,'
      '  T_MONTONCRAPLICADO = :T_MONTONCRAPLICADO,'
      '  T_DEVOLUCION = :T_DEVOLUCION,'
      '  TC_TOTALNETO = :TC_TOTALNETO,'
      '  TC_ITBIS = :TC_ITBIS,'
      '  D_TIPO_UNIDAD = :D_TIPO_UNIDAD,'
      '  CODTEXTO = :CODTEXTO,'
      '  NUMERO_COTIZA = :NUMERO_COTIZA,'
      '  FECHA_COTIZA = :FECHA_COTIZA,'
      '  D_TRANSPITBIS = :D_TRANSPITBIS'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_POS_EXTRA_DET_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 72
    Top = 216
    object qryPosExtraDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'POS_EXTRA_DET.SERIE'
      Required = True
    end
    object qryPosExtraDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'POS_EXTRA_DET.NUMERO'
      Required = True
    end
    object qryPosExtraDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'POS_EXTRA_DET.COD_USUARIO'
      Required = True
    end
    object qryPosExtraDetFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'POS_EXTRA_DET.FECHA'
    end
    object qryPosExtraDetD_MONEDA: TIBStringField
      FieldName = 'D_MONEDA'
      Origin = 'POS_EXTRA_DET.D_MONEDA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryPosExtraDetD_TIPO_VENTA: TIntegerField
      FieldName = 'D_TIPO_VENTA'
      Origin = 'POS_EXTRA_DET.D_TIPO_VENTA'
    end
    object qryPosExtraDetD_CODIGO_PROD: TIntegerField
      FieldName = 'D_CODIGO_PROD'
      Origin = 'POS_EXTRA_DET.D_CODIGO_PROD'
    end
    object qryPosExtraDetD_PRECIO: TFloatField
      FieldName = 'D_PRECIO'
      Origin = 'POS_EXTRA_DET.D_PRECIO'
    end
    object qryPosExtraDetD_CANT: TFloatField
      FieldName = 'D_CANT'
      Origin = 'POS_EXTRA_DET.D_CANT'
    end
    object qryPosExtraDetD_TASA_ITBIS: TFloatField
      FieldName = 'D_TASA_ITBIS'
      Origin = 'POS_EXTRA_DET.D_TASA_ITBIS'
    end
    object qryPosExtraDetD_PORCDESCITEM: TFloatField
      FieldName = 'D_PORCDESCITEM'
      Origin = 'POS_EXTRA_DET.D_PORCDESCITEM'
    end
    object qryPosExtraDetT_PORCDESADICIONAL: TFloatField
      FieldName = 'T_PORCDESADICIONAL'
      Origin = 'POS_EXTRA_DET.T_PORCDESADICIONAL'
    end
    object qryPosExtraDetT_RECARGO: TFloatField
      FieldName = 'T_RECARGO'
      Origin = 'POS_EXTRA_DET.T_RECARGO'
    end
    object qryPosExtraDetT_PROPINA: TFloatField
      FieldName = 'T_PROPINA'
      Origin = 'POS_EXTRA_DET.T_PROPINA'
    end
    object qryPosExtraDetT_MONTOINTERES: TFloatField
      FieldName = 'T_MONTOINTERES'
      Origin = 'POS_EXTRA_DET.T_MONTOINTERES'
    end
    object qryPosExtraDetT_MONTONCRAPLICADO: TFloatField
      FieldName = 'T_MONTONCRAPLICADO'
      Origin = 'POS_EXTRA_DET.T_MONTONCRAPLICADO'
    end
    object qryPosExtraDetT_DEVOLUCION: TFloatField
      FieldName = 'T_DEVOLUCION'
      Origin = 'POS_EXTRA_DET.T_DEVOLUCION'
    end
    object qryPosExtraDetTC_TOTALNETO: TFloatField
      FieldName = 'TC_TOTALNETO'
      Origin = 'POS_EXTRA_DET.TC_TOTALNETO'
    end
    object qryPosExtraDetTC_ITBIS: TFloatField
      FieldName = 'TC_ITBIS'
      Origin = 'POS_EXTRA_DET.TC_ITBIS'
    end
    object qryPosExtraDetD_TIPO_UNIDAD: TIntegerField
      FieldName = 'D_TIPO_UNIDAD'
      Origin = 'POS_EXTRA_DET.D_TIPO_UNIDAD'
    end
    object qryPosExtraDetCODTEXTO: TIBStringField
      FieldName = 'CODTEXTO'
      Origin = 'POS_EXTRA_DET.CODTEXTO'
      Size = 40
    end
    object qryPosExtraDetFECHA_COTIZA: TDateTimeField
      FieldName = 'FECHA_COTIZA'
      Origin = 'POS_EXTRA_DET.FECHA_COTIZA'
    end
    object qryPosExtraDetNUMERO_COTIZA: TIntegerField
      FieldName = 'NUMERO_COTIZA'
      Origin = 'POS_EXTRA_DET.NUMERO_COTIZA'
    end
    object qryPosExtraDetD_TRANSPITBIS: TSmallintField
      FieldName = 'D_TRANSPITBIS'
      Origin = 'POS_EXTRA_DET.D_TRANSPITBIS'
    end
    object qryPosExtraDetID: TFloatField
      FieldName = 'ID'
      Origin = 'POS_EXTRA_DET.ID'
      Required = True
    end
    object qryPosExtraDetLEVEL_PRECIO_VENT: TSmallintField
      FieldName = 'LEVEL_PRECIO_VENT'
      Origin = 'POS_EXTRA_DET.LEVEL_PRECIO_VENT'
    end
  end
  object qryConsultaPosExtraDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    AfterOpen = qryConsultaPosExtraDetAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * from'
      'proc_posConsExtraDet(:numerostr, :coduser,:numcotiza)')
    UniDirectional = True
    Left = 272
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerostr'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'coduser'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'numcotiza'
        ParamType = ptInput
      end>
    object qryConsultaPosExtraDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'POS_EXTRA_DET.SERIE'
      Required = True
    end
    object qryConsultaPosExtraDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'POS_EXTRA_DET.NUMERO'
      Required = True
    end
    object qryConsultaPosExtraDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'POS_EXTRA_DET.COD_USUARIO'
      Required = True
    end
    object qryConsultaPosExtraDetFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'POS_EXTRA_DET.FECHA'
    end
    object qryConsultaPosExtraDetD_MONEDA: TIBStringField
      FieldName = 'D_MONEDA'
      Origin = 'POS_EXTRA_DET.D_MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryConsultaPosExtraDetD_TIPO_VENTA: TIntegerField
      FieldName = 'D_TIPO_VENTA'
      Origin = 'POS_EXTRA_DET.D_TIPO_VENTA'
    end
    object qryConsultaPosExtraDetD_CODIGO_PROD: TIntegerField
      FieldName = 'D_CODIGO_PROD'
      Origin = 'POS_EXTRA_DET.D_CODIGO_PROD'
    end
    object qryConsultaPosExtraDetD_CANT: TFloatField
      FieldName = 'D_CANT'
      Origin = 'POS_EXTRA_DET.D_CANT'
    end
    object qryConsultaPosExtraDetD_PRECIO: TFloatField
      FieldName = 'D_PRECIO'
      Origin = 'POS_EXTRA_DET.D_PRECIO'
    end
    object qryConsultaPosExtraDetD_TASA_ITBIS: TFloatField
      FieldName = 'D_TASA_ITBIS'
      Origin = 'POS_EXTRA_DET.D_TASA_ITBIS'
    end
    object qryConsultaPosExtraDetD_PORCDESCITEM: TFloatField
      FieldName = 'D_PORCDESCITEM'
      Origin = 'POS_EXTRA_DET.D_PORCDESCITEM'
    end
    object qryConsultaPosExtraDetT_PORCDESADICIONAL: TFloatField
      FieldName = 'T_PORCDESADICIONAL'
      Origin = 'POS_EXTRA_DET.T_PORCDESADICIONAL'
    end
    object qryConsultaPosExtraDetT_RECARGO: TFloatField
      FieldName = 'T_RECARGO'
      Origin = 'POS_EXTRA_DET.T_RECARGO'
    end
    object qryConsultaPosExtraDetT_PROPINA: TFloatField
      FieldName = 'T_PROPINA'
      Origin = 'POS_EXTRA_DET.T_PROPINA'
    end
    object qryConsultaPosExtraDetT_MONTOINTERES: TFloatField
      FieldName = 'T_MONTOINTERES'
      Origin = 'POS_EXTRA_DET.T_MONTOINTERES'
    end
    object qryConsultaPosExtraDetT_MONTONCRAPLICADO: TFloatField
      FieldName = 'T_MONTONCRAPLICADO'
      Origin = 'POS_EXTRA_DET.T_MONTONCRAPLICADO'
    end
    object qryConsultaPosExtraDetT_DEVOLUCION: TFloatField
      FieldName = 'T_DEVOLUCION'
      Origin = 'POS_EXTRA_DET.T_DEVOLUCION'
    end
    object qryConsultaPosExtraDetTC_TOTALNETO: TFloatField
      FieldName = 'TC_TOTALNETO'
      Origin = 'POS_EXTRA_DET.TC_TOTALNETO'
    end
    object qryConsultaPosExtraDetDC_MONTOBRUTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'DC_MONTOBRUTO'
      Origin = 'POS_EXTRA_DET.DC_MONTOBRUTO'
      ReadOnly = True
    end
    object qryConsultaPosExtraDetDC_MONTODESCITEM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'DC_MONTODESCITEM'
      Origin = 'POS_EXTRA_DET.DC_MONTODESCITEM'
      ReadOnly = True
    end
    object qryConsultaPosExtraDetDC_PORCPROPLEGAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'DC_PORCPROPLEGAL'
      Origin = 'POS_EXTRA_DET.DC_PORCPROPLEGAL'
      ReadOnly = True
    end
    object qryConsultaPosExtraDetTC_MONTODESCGLOBAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_MONTODESCGLOBAL'
      Origin = 'POS_EXTRA_DET.TC_MONTODESCGLOBAL'
      ReadOnly = True
    end
    object qryConsultaPosExtraDetDC_PROPINALEGAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'DC_PROPINALEGAL'
      Origin = 'POS_EXTRA_DET.DC_PROPINALEGAL'
      ReadOnly = True
    end
    object qryConsultaPosExtraDetDC_ESDESITEM: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DC_ESDESITEM'
      Origin = 'POS_EXTRA_DET.DC_ESDESITEM'
      ReadOnly = True
    end
    object qryConsultaPosExtraDetTC_SUBTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_SUBTOTAL'
      Origin = 'POS_EXTRA_DET.TC_SUBTOTAL'
      ReadOnly = True
    end
    object qryConsultaPosExtraDetTC_MONTODESCADICIONAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_MONTODESCADICIONAL'
      Origin = 'POS_EXTRA_DET.TC_MONTODESCADICIONAL'
      ReadOnly = True
    end
    object qryConsultaPosExtraDetTC_MONTODESCITEMS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_MONTODESCITEMS'
      Origin = 'POS_EXTRA_DET.TC_MONTODESCITEMS'
      ReadOnly = True
    end
    object qryConsultaPosExtraDetTC_FMONTODESCNIVELITEM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_FMONTODESCNIVELITEM'
      Origin = 'POS_EXTRA_DET.TC_FMONTODESCNIVELITEM'
      ReadOnly = True
    end
    object qryConsultaPosExtraDetTC_MONTOITBISRECARGO_ITM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_MONTOITBISRECARGO_ITM'
      Origin = 'POS_EXTRA_DET.TC_MONTOITBISRECARGO_ITM'
      ReadOnly = True
    end
    object qryConsultaPosExtraDetTC_MONTOITBISRECARGO_GLB: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_MONTOITBISRECARGO_GLB'
      Origin = 'POS_EXTRA_DET.TC_MONTOITBISRECARGO_GLB'
      ReadOnly = True
    end
    object qryConsultaPosExtraDetD_TIPO_UNIDAD: TIntegerField
      FieldName = 'D_TIPO_UNIDAD'
      Origin = 'POS_EXTRA_DET.D_TIPO_UNIDAD'
    end
    object qryConsultaPosExtraDetCODTEXTO: TIBStringField
      FieldName = 'CODTEXTO'
      Origin = 'POS_EXTRA_DET.CODTEXTO'
      Size = 40
    end
    object qryConsultaPosExtraDetTOTAL_ITBIS: TFloatField
      FieldName = 'TOTAL_ITBIS'
    end
    object qryConsultaPosExtraDetFECHA_COTIZA: TDateTimeField
      FieldName = 'FECHA_COTIZA'
      Origin = 'POS_EXTRA_DET.FECHA_COTIZA'
    end
    object qryConsultaPosExtraDetNUMERO_COTIZA: TIntegerField
      FieldName = 'NUMERO_COTIZA'
      Origin = 'POS_EXTRA_DET.NUMERO_COTIZA'
    end
    object qryConsultaPosExtraDetTC_ITBIS2: TFloatField
      FieldName = 'TC_ITBIS'
      Origin = 'PROC_POSCONSEXTRADET.TC_ITBIS'
    end
    object qryConsultaPosExtraDetD_TRANSPITBIS: TSmallintField
      FieldName = 'D_TRANSPITBIS'
      Origin = 'PROC_POSCONSEXTRADET.D_TRANSPITBIS'
    end
    object qryConsultaPosExtraDetDC_ITBIS_CLD: TFloatField
      FieldName = 'DC_ITBIS_CLD'
      Origin = 'PROC_POSCONSEXTRADET.DC_ITBIS_CLD'
    end
    object qryConsultaPosExtraDetDC_ITBIS: TFloatField
      FieldName = 'DC_ITBIS'
      Origin = 'PROC_POSCONSEXTRADET.DC_ITBIS'
    end
    object qryConsultaPosExtraDetLEVEL_PRECIO_VENT: TSmallintField
      FieldName = 'LEVEL_PRECIO_VENT'
      Origin = 'PROC_POSCONSEXTRADET.LEVEL_PRECIO_VENT'
    end
  end
  object ibSqlDeletePosExtraDET: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Delete  from POS_EXTRA_DET Where cod_usuario=:codusuario'
      'And numero=:numero')
    Transaction = dmConectar.IBTransaction1
    Left = 72
    Top = 280
  end
  object ibstpProcPosUpdTExtDet: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'Proc_PosUpdtTExtDet'
    Left = 272
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROTRN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TPORCDESADICIONAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TRECARGO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TPROPINA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TMONTOINTERES'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'TMONTONCRAPLICADO'
        ParamType = ptInput
      end>
  end
  object ibSqlDelCurrrentRPosExtraDET: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Delete  from POS_EXTRA_DET Where cod_usuario=:codusuario'
      'And serie=:serie'
      'And numero=:numero')
    Transaction = dmConectar.IBTransaction1
    Left = 72
    Top = 152
  end
  object qryCheckVtaExtExiste: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select serie From POS_EXTRA_DET'
      'Where numero=:numero'
      'And serie=:serie'
      'And COD_USUARIO=:COD_USUARIO')
    Left = 72
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'serie'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
  end
  object ibstpproc_InseCotiVtaExtraDetDiscontinue: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'proc_InseCotiVtaExtraDet'
    Left = 272
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SERIE'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'CODIGO_PROD'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'DESCRIPCION'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'CANTIDAD'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_DET'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'ITBI_DET'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_SERVICIO_DET'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'VALOR_TOTAL_DET'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'ITBIS_EXENTO'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_VENTA'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'PORC_DESC_ITEM'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_TASA'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'IDTASAITBIS'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_UNIDAD'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTO_DESC_ITEM'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'LPORC_DESADICIONAL'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'LMONTO_RECARGO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'LPROPINALEGAL'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'LPROPINA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_COTIZA'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_COTIZA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'NUMEROTRN'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_TRN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_USUARIO_IN'
        ParamType = ptInput
      end>
  end
  object ibstpproc_InseCotiVtaExtraDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from proc_InseCotiVtaExtraDet(:num,:fecha,:coduser)')
    Left = 272
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'num'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'coduser'
        ParamType = ptInput
      end>
  end
  object qryPosExtRrdDesc: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select r.*  From POS_EXTRA_DET r'
      'Where r.numero =:numero'
      'And  r.D_PORCDESCITEM > 0')
    Left = 168
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryPosExtRrdDescSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'POS_EXTRA_DET.SERIE'
      Required = True
    end
    object qryPosExtRrdDescNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'POS_EXTRA_DET.NUMERO'
      Required = True
    end
    object qryPosExtRrdDescD_PORCDESCITEM: TFloatField
      FieldName = 'D_PORCDESCITEM'
      Origin = 'POS_EXTRA_DET.D_PORCDESCITEM'
    end
  end
  object qryDatosItbPosExtra: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select serie, DC_ITBIS_CLD,'
      'TC_MONTOITBISRECARGO_GLB,'
      'TC_MONTOITBISRECARGO_ITM'
      'from pos_extra_Det'
      'where numero=:numero')
    Left = 400
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryDatosItbPosExtraSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'POS_EXTRA_DET.SERIE'
      Required = True
    end
    object qryDatosItbPosExtraDC_ITBIS_CLD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'DC_ITBIS_CLD'
      Origin = 'POS_EXTRA_DET.DC_ITBIS_CLD'
      ReadOnly = True
    end
    object qryDatosItbPosExtraTC_MONTOITBISRECARGO_GLB: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_MONTOITBISRECARGO_GLB'
      Origin = 'POS_EXTRA_DET.TC_MONTOITBISRECARGO_GLB'
      ReadOnly = True
    end
    object qryDatosItbPosExtraTC_MONTOITBISRECARGO_ITM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_MONTOITBISRECARGO_ITM'
      Origin = 'POS_EXTRA_DET.TC_MONTOITBISRECARGO_ITM'
      ReadOnly = True
    end
  end
  object qryDatosCotiPosExtra: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    AfterOpen = qryConsultaPosExtraDetAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * from'
      'proc_posConsExtraDet(:numerostr, :coduser,:numcotiza)'
      'order by numero, serie ')
    Left = 398
    Top = 215
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numerostr'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'coduser'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'numcotiza'
        ParamType = ptInput
      end>
    object qryDatosCotiPosExtraSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'PROC_POSCONSEXTRADET.SERIE'
    end
    object qryDatosCotiPosExtraNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PROC_POSCONSEXTRADET.NUMERO'
    end
    object qryDatosCotiPosExtraCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'PROC_POSCONSEXTRADET.COD_USUARIO'
    end
    object qryDatosCotiPosExtraFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_POSCONSEXTRADET.FECHA'
    end
    object qryDatosCotiPosExtraTOTAL_ITBIS: TFloatField
      FieldName = 'TOTAL_ITBIS'
      Origin = 'PROC_POSCONSEXTRADET.TOTAL_ITBIS'
    end
    object qryDatosCotiPosExtraD_MONEDA: TIBStringField
      FieldName = 'D_MONEDA'
      Origin = 'PROC_POSCONSEXTRADET.D_MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryDatosCotiPosExtraD_TIPO_VENTA: TSmallintField
      FieldName = 'D_TIPO_VENTA'
      Origin = 'PROC_POSCONSEXTRADET.D_TIPO_VENTA'
    end
    object qryDatosCotiPosExtraD_CODIGO_PROD: TIntegerField
      FieldName = 'D_CODIGO_PROD'
      Origin = 'PROC_POSCONSEXTRADET.D_CODIGO_PROD'
    end
    object qryDatosCotiPosExtraD_CANT: TFloatField
      FieldName = 'D_CANT'
      Origin = 'PROC_POSCONSEXTRADET.D_CANT'
    end
    object qryDatosCotiPosExtraD_PRECIO: TFloatField
      FieldName = 'D_PRECIO'
      Origin = 'PROC_POSCONSEXTRADET.D_PRECIO'
    end
    object qryDatosCotiPosExtraD_TASA_ITBIS: TFloatField
      FieldName = 'D_TASA_ITBIS'
      Origin = 'PROC_POSCONSEXTRADET.D_TASA_ITBIS'
    end
    object qryDatosCotiPosExtraD_PORCDESCITEM: TFloatField
      FieldName = 'D_PORCDESCITEM'
      Origin = 'PROC_POSCONSEXTRADET.D_PORCDESCITEM'
    end
    object qryDatosCotiPosExtraT_PORCDESADICIONAL: TFloatField
      FieldName = 'T_PORCDESADICIONAL'
      Origin = 'PROC_POSCONSEXTRADET.T_PORCDESADICIONAL'
    end
    object qryDatosCotiPosExtraT_RECARGO: TFloatField
      FieldName = 'T_RECARGO'
      Origin = 'PROC_POSCONSEXTRADET.T_RECARGO'
    end
    object qryDatosCotiPosExtraT_PROPINA: TFloatField
      FieldName = 'T_PROPINA'
      Origin = 'PROC_POSCONSEXTRADET.T_PROPINA'
    end
    object qryDatosCotiPosExtraT_MONTOINTERES: TFloatField
      FieldName = 'T_MONTOINTERES'
      Origin = 'PROC_POSCONSEXTRADET.T_MONTOINTERES'
    end
    object qryDatosCotiPosExtraT_MONTONCRAPLICADO: TFloatField
      FieldName = 'T_MONTONCRAPLICADO'
      Origin = 'PROC_POSCONSEXTRADET.T_MONTONCRAPLICADO'
    end
    object qryDatosCotiPosExtraT_DEVOLUCION: TFloatField
      FieldName = 'T_DEVOLUCION'
      Origin = 'PROC_POSCONSEXTRADET.T_DEVOLUCION'
    end
    object qryDatosCotiPosExtraTC_TOTALNETO: TFloatField
      FieldName = 'TC_TOTALNETO'
      Origin = 'PROC_POSCONSEXTRADET.TC_TOTALNETO'
    end
    object qryDatosCotiPosExtraTC_ITBIS: TFloatField
      FieldName = 'TC_ITBIS'
      Origin = 'PROC_POSCONSEXTRADET.TC_ITBIS'
    end
    object qryDatosCotiPosExtraD_TIPO_UNIDAD: TSmallintField
      FieldName = 'D_TIPO_UNIDAD'
      Origin = 'PROC_POSCONSEXTRADET.D_TIPO_UNIDAD'
    end
    object qryDatosCotiPosExtraCODTEXTO: TIBStringField
      FieldName = 'CODTEXTO'
      Origin = 'PROC_POSCONSEXTRADET.CODTEXTO'
      Size = 40
    end
    object qryDatosCotiPosExtraDC_MONTOBRUTO: TFloatField
      FieldName = 'DC_MONTOBRUTO'
      Origin = 'PROC_POSCONSEXTRADET.DC_MONTOBRUTO'
    end
    object qryDatosCotiPosExtraDC_MONTODESCITEM: TFloatField
      FieldName = 'DC_MONTODESCITEM'
      Origin = 'PROC_POSCONSEXTRADET.DC_MONTODESCITEM'
    end
    object qryDatosCotiPosExtraDC_ITBIS_CLD: TFloatField
      FieldName = 'DC_ITBIS_CLD'
      Origin = 'PROC_POSCONSEXTRADET.DC_ITBIS_CLD'
    end
    object qryDatosCotiPosExtraDC_ITBIS: TFloatField
      FieldName = 'DC_ITBIS'
      Origin = 'PROC_POSCONSEXTRADET.DC_ITBIS'
    end
    object qryDatosCotiPosExtraDC_PORCPROPLEGAL: TFloatField
      FieldName = 'DC_PORCPROPLEGAL'
      Origin = 'PROC_POSCONSEXTRADET.DC_PORCPROPLEGAL'
    end
    object qryDatosCotiPosExtraTC_MONTODESCGLOBAL: TFloatField
      FieldName = 'TC_MONTODESCGLOBAL'
      Origin = 'PROC_POSCONSEXTRADET.TC_MONTODESCGLOBAL'
    end
    object qryDatosCotiPosExtraDC_PROPINALEGAL: TFloatField
      FieldName = 'DC_PROPINALEGAL'
      Origin = 'PROC_POSCONSEXTRADET.DC_PROPINALEGAL'
    end
    object qryDatosCotiPosExtraDC_ESDESITEM: TSmallintField
      FieldName = 'DC_ESDESITEM'
      Origin = 'PROC_POSCONSEXTRADET.DC_ESDESITEM'
    end
    object qryDatosCotiPosExtraTC_SUBTOTAL: TFloatField
      FieldName = 'TC_SUBTOTAL'
      Origin = 'PROC_POSCONSEXTRADET.TC_SUBTOTAL'
    end
    object qryDatosCotiPosExtraTC_MONTODESCITEMS: TFloatField
      FieldName = 'TC_MONTODESCITEMS'
      Origin = 'PROC_POSCONSEXTRADET.TC_MONTODESCITEMS'
    end
    object qryDatosCotiPosExtraTC_FMONTODESCNIVELITEM: TFloatField
      FieldName = 'TC_FMONTODESCNIVELITEM'
      Origin = 'PROC_POSCONSEXTRADET.TC_FMONTODESCNIVELITEM'
    end
    object qryDatosCotiPosExtraTC_MONTOITBISRECARGO_ITM: TFloatField
      FieldName = 'TC_MONTOITBISRECARGO_ITM'
      Origin = 'PROC_POSCONSEXTRADET.TC_MONTOITBISRECARGO_ITM'
    end
    object qryDatosCotiPosExtraTC_MONTOITBISRECARGO_GLB: TFloatField
      FieldName = 'TC_MONTOITBISRECARGO_GLB'
      Origin = 'PROC_POSCONSEXTRADET.TC_MONTOITBISRECARGO_GLB'
    end
    object qryDatosCotiPosExtraTC_MONTODESCADICIONAL: TFloatField
      FieldName = 'TC_MONTODESCADICIONAL'
      Origin = 'PROC_POSCONSEXTRADET.TC_MONTODESCADICIONAL'
    end
    object qryDatosCotiPosExtraNUMERO_COTIZA: TIntegerField
      FieldName = 'NUMERO_COTIZA'
      Origin = 'PROC_POSCONSEXTRADET.NUMERO_COTIZA'
    end
    object qryDatosCotiPosExtraFECHA_COTIZA: TDateTimeField
      FieldName = 'FECHA_COTIZA'
      Origin = 'PROC_POSCONSEXTRADET.FECHA_COTIZA'
    end
    object qryDatosCotiPosExtraD_TRANSPITBIS: TSmallintField
      FieldName = 'D_TRANSPITBIS'
      Origin = 'PROC_POSCONSEXTRADET.D_TRANSPITBIS'
    end
    object qryDatosCotiPosExtraDESCRIPCION_ESPECIAL: TMemoField
      FieldName = 'DESCRIPCION_ESPECIAL'
      Origin = 'PROC_POSCONSEXTRADET.DESCRIPCION_ESPECIAL'
      BlobType = ftMemo
      Size = 8
    end
    object qryDatosCotiPosExtraLEVEL_PRECIO_VENT: TSmallintField
      FieldName = 'LEVEL_PRECIO_VENT'
      Origin = 'PROC_POSCONSEXTRADET.LEVEL_PRECIO_VENT'
    end
  end
  object qryCheckGlbNumPos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select serie From POS_EXTRA_DET'
      'Where numero=:numero')
    Left = 160
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
  end
  object qryValorVta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select sum(r.d_cant * r.d_Precio) MontoBruto'
      'From POS_EXTRA_DET r '
      'Where r.numero =:NUMERO    and r.COD_USUARIO = :CODUSER'
      '     ')
    Left = 400
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODUSER'
        ParamType = ptInput
      end>
    object qryValorVtaMONTOBRUTO: TFloatField
      FieldName = 'MONTOBRUTO'
    end
  end
  object qryGetSumVtaExtra: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterOpen = qryGetSumVtaExtraAfterOpen
    BeforeOpen = qryGetSumVtaExtraBeforeOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from Proc_GetSumVtaExtra(:numerotrn)')
    Left = 272
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numerotrn'
        ParamType = ptUnknown
      end>
    object qryGetSumVtaExtraNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PROC_GETSUMVTAEXTRA.NUMERO'
    end
    object qryGetSumVtaExtraDC_MONTOBRUTO: TFloatField
      FieldName = 'DC_MONTOBRUTO'
      Origin = 'PROC_GETSUMVTAEXTRA.DC_MONTOBRUTO'
    end
    object qryGetSumVtaExtraD_TASA_ITBIS: TFloatField
      FieldName = 'D_TASA_ITBIS'
      Origin = 'PROC_GETSUMVTAEXTRA.D_TASA_ITBIS'
    end
    object qryGetSumVtaExtraT_PROPINA: TFloatField
      FieldName = 'T_PROPINA'
      Origin = 'PROC_GETSUMVTAEXTRA.T_PROPINA'
    end
    object qryGetSumVtaExtraT_MONTOINTERES: TFloatField
      FieldName = 'T_MONTOINTERES'
      Origin = 'PROC_GETSUMVTAEXTRA.T_MONTOINTERES'
    end
    object qryGetSumVtaExtraT_MONTONCRAPLICADO: TFloatField
      FieldName = 'T_MONTONCRAPLICADO'
      Origin = 'PROC_GETSUMVTAEXTRA.T_MONTONCRAPLICADO'
    end
    object qryGetSumVtaExtraTC_ITBIS: TFloatField
      FieldName = 'TC_ITBIS'
      Origin = 'PROC_GETSUMVTAEXTRA.TC_ITBIS'
      EditFormat = ',0.00000000'
    end
    object qryGetSumVtaExtraDC_MONTODESCITEM: TFloatField
      FieldName = 'DC_MONTODESCITEM'
      Origin = 'PROC_GETSUMVTAEXTRA.DC_MONTODESCITEM'
    end
    object qryGetSumVtaExtraTC_MONTODESCGLOBAL: TFloatField
      FieldName = 'TC_MONTODESCGLOBAL'
      Origin = 'PROC_GETSUMVTAEXTRA.TC_MONTODESCGLOBAL'
    end
    object qryGetSumVtaExtraTC_MONTODESCITEMS: TFloatField
      FieldName = 'TC_MONTODESCITEMS'
      Origin = 'PROC_GETSUMVTAEXTRA.TC_MONTODESCITEMS'
    end
    object qryGetSumVtaExtraTC_FMONTODESCNIVELITEM: TFloatField
      FieldName = 'TC_FMONTODESCNIVELITEM'
      Origin = 'PROC_GETSUMVTAEXTRA.TC_FMONTODESCNIVELITEM'
    end
    object qryGetSumVtaExtraTC_SUBTOTAL: TFloatField
      FieldName = 'TC_SUBTOTAL'
      Origin = 'PROC_GETSUMVTAEXTRA.TC_SUBTOTAL'
    end
    object qryGetSumVtaExtraTC_MONTODESCADICIONAL: TFloatField
      FieldName = 'TC_MONTODESCADICIONAL'
      Origin = 'PROC_GETSUMVTAEXTRA.TC_MONTODESCADICIONAL'
    end
    object qryGetSumVtaExtraDC_PROPINALEGAL: TFloatField
      FieldName = 'DC_PROPINALEGAL'
      Origin = 'PROC_GETSUMVTAEXTRA.DC_PROPINALEGAL'
    end
    object qryGetSumVtaExtraDC_ITBIS_CLD: TFloatField
      FieldName = 'DC_ITBIS_CLD'
      Origin = 'PROC_GETSUMVTAEXTRA.DC_ITBIS_CLD'
      DisplayFormat = ',0.00000000'
    end
    object qryGetSumVtaExtraTC_MONTOITBISRECARGO_GLB: TFloatField
      FieldName = 'TC_MONTOITBISRECARGO_GLB'
      Origin = 'PROC_GETSUMVTAEXTRA.TC_MONTOITBISRECARGO_GLB'
    end
    object qryGetSumVtaExtraTC_MONTOITBISRECARGO_ITM: TFloatField
      FieldName = 'TC_MONTOITBISRECARGO_ITM'
      Origin = 'PROC_GETSUMVTAEXTRA.TC_MONTOITBISRECARGO_ITM'
    end
    object qryGetSumVtaExtraT_RECARGO: TFloatField
      FieldName = 'T_RECARGO'
      Origin = 'PROC_GETSUMVTAEXTRA.T_RECARGO'
    end
    object qryGetSumVtaExtraTOTAL_ITBIS: TFloatField
      FieldName = 'TOTAL_ITBIS'
      Origin = 'PROC_GETSUMVTAEXTRA.TOTAL_ITBIS'
      EditFormat = '.0.00000000'
    end
  end
  object stpproc_InsUpdVtaSum: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'proc_InsUpdVtaSum'
    Left = 456
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMTRN'
        ParamType = ptInput
      end>
  end
  object ibSQLCancelaVta: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'update VENTAS_MAST'
      'set status = '#39'C'#39
      'where numero =:numero')
    Transaction = dmConectar.IBTransaction1
    Left = 72
    Top = 336
  end
  object qryVentas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryVentasAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select  c.CODIGO_CTE, c.NOMBRE_FACTURAR, f.NUMERO_NCF, v.FECHA, ' +
        'v.NUMERO, v.MONTO_PAGADO, v.VALOR_TOTAL_DET, v.MONTO_TOTAL_ITBIS' +
        ', v.STATUS'
      'from VENTAS_MAST v'
      'inner join CLIENTES c on c.CODIGO_CTE = v.CODIGO_CTE'
      
        'LEFT outer join NCF_ASIGNADOS f on f.SERIE = v.SERIE_NCF_ASIGNAD' +
        'O'
      'Order by v.NUMERO DESC')
    Left = 520
    Top = 216
    object qryVentasNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryVentasFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryVentasNUMERO_NCF: TIBStringField
      FieldName = 'NUMERO_NCF'
      Origin = 'NCF_ASIGNADOS.NUMERO_NCF'
      Size = 21
    end
    object qryVentasCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryVentasNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryVentasMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'VENTAS_MAST.MONTO_PAGADO'
    end
    object qryVentasVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST.VALOR_TOTAL_DET'
    end
    object qryVentasMONTO_TOTAL_ITBIS: TFloatField
      FieldName = 'MONTO_TOTAL_ITBIS'
      Origin = 'VENTAS_MAST.MONTO_TOTAL_ITBIS'
    end
    object qryVentasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENTAS_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryVentasDEt: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  * from ventas_Det'
      'where numero =:numero')
    Left = 520
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryVentasDEtSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'VENTAS_DET.SERIE'
      Required = True
    end
    object qryVentasDEtNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_DET.NUMERO'
      Required = True
    end
    object qryVentasDEtCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryVentasDEtCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VENTAS_DET.CODIGO_BARRA'
    end
    object qryVentasDEtDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object qryVentasDEtCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET.CANTIDAD'
    end
    object qryVentasDEtPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET.PRECIO'
    end
    object qryVentasDEtPORC_DESC_DET: TFloatField
      FieldName = 'PORC_DESC_DET'
      Origin = 'VENTAS_DET.PORC_DESC_DET'
    end
    object qryVentasDEtITBI_DET: TFloatField
      FieldName = 'ITBI_DET'
      Origin = 'VENTAS_DET.ITBI_DET'
    end
    object qryVentasDEtVALOR_SERVICIO_DET: TFloatField
      FieldName = 'VALOR_SERVICIO_DET'
      Origin = 'VENTAS_DET.VALOR_SERVICIO_DET'
    end
    object qryVentasDEtVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_DET.VALOR_TOTAL_DET'
    end
    object qryVentasDEtNUM_FACTURA: TFloatField
      FieldName = 'NUM_FACTURA'
      Origin = 'VENTAS_DET.NUM_FACTURA'
    end
    object qryVentasDEtSTATUS_DET: TIBStringField
      FieldName = 'STATUS_DET'
      Origin = 'VENTAS_DET.STATUS_DET'
      FixedChar = True
      Size = 1
    end
    object qryVentasDEtFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'VENTAS_DET.FECHA_IN'
    end
    object qryVentasDEtIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'VENTAS_DET.IN_POR'
      Size = 12
    end
    object qryVentasDEtFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENTAS_DET.FECHA_MOD'
    end
    object qryVentasDEtMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'VENTAS_DET.MOD_POR'
      Size = 12
    end
    object qryVentasDEtCANT_REGRESO: TFloatField
      FieldName = 'CANT_REGRESO'
      Origin = 'VENTAS_DET.CANT_REGRESO'
    end
    object qryVentasDEtCANT_PROMO: TFloatField
      FieldName = 'CANT_PROMO'
      Origin = 'VENTAS_DET.CANT_PROMO'
    end
    object qryVentasDEtMONTO_DIETA: TFloatField
      FieldName = 'MONTO_DIETA'
      Origin = 'VENTAS_DET.MONTO_DIETA'
    end
    object qryVentasDEtMONTO_AJUSTE: TFloatField
      FieldName = 'MONTO_AJUSTE'
      Origin = 'VENTAS_DET.MONTO_AJUSTE'
    end
    object qryVentasDEtSERIE_PROD: TIBStringField
      FieldName = 'SERIE_PROD'
      Origin = 'VENTAS_DET.SERIE_PROD'
      Size = 50
    end
    object qryVentasDEtSTATUS_CNT: TIBStringField
      FieldName = 'STATUS_CNT'
      Origin = 'VENTAS_DET.STATUS_CNT'
      FixedChar = True
      Size = 1
    end
    object qryVentasDEtTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VENTAS_DET.TIPO_UNIDAD'
    end
    object qryVentasDEtITBIS_EXENTO: TSmallintField
      FieldName = 'ITBIS_EXENTO'
      Origin = 'VENTAS_DET.ITBIS_EXENTO'
    end
    object qryVentasDEtTIPO_VENTA: TSmallintField
      FieldName = 'TIPO_VENTA'
      Origin = 'VENTAS_DET.TIPO_VENTA'
    end
    object qryVentasDEtDESCRIPCIONPRODUCTO: TMemoField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'VENTAS_DET.DESCRIPCIONPRODUCTO'
      BlobType = ftMemo
      Size = 8
    end
    object qryVentasDEtCOD_EMPLEADO_CONDUCTOR: TFloatField
      FieldName = 'COD_EMPLEADO_CONDUCTOR'
      Origin = 'VENTAS_DET.COD_EMPLEADO_CONDUCTOR'
    end
    object qryVentasDEtPLACA_VEHICULO: TIBStringField
      FieldName = 'PLACA_VEHICULO'
      Origin = 'VENTAS_DET.PLACA_VEHICULO'
    end
    object qryVentasDEtMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_DET.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryVentasDEtMONTO_TASA: TFloatField
      FieldName = 'MONTO_TASA'
      Origin = 'VENTAS_DET.MONTO_TASA'
    end
    object qryVentasDEtCAPACIDAD: TFloatField
      FieldName = 'CAPACIDAD'
      Origin = 'VENTAS_DET.CAPACIDAD'
    end
    object qryVentasDEtCANT_VIAJES: TFloatField
      FieldName = 'CANT_VIAJES'
      Origin = 'VENTAS_DET.CANT_VIAJES'
    end
    object qryVentasDEtCANT_METROS_CUBICO: TFloatField
      FieldName = 'CANT_METROS_CUBICO'
      Origin = 'VENTAS_DET.CANT_METROS_CUBICO'
    end
    object qryVentasDEtFICHA_VEH: TIntegerField
      FieldName = 'FICHA_VEH'
      Origin = 'VENTAS_DET.FICHA_VEH'
    end
    object qryVentasDEtIDZONA_ORIGEN: TIntegerField
      FieldName = 'IDZONA_ORIGEN'
      Origin = 'VENTAS_DET.IDZONA_ORIGEN'
    end
    object qryVentasDEtIDZONA_DETALLE: TIntegerField
      FieldName = 'IDZONA_DETALLE'
      Origin = 'VENTAS_DET.IDZONA_DETALLE'
    end
    object qryVentasDEtPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'VENTAS_DET.PRECIO_COMPRA'
    end
    object qryVentasDEtCANT_CONDUCE: TFloatField
      FieldName = 'CANT_CONDUCE'
      Origin = 'VENTAS_DET.CANT_CONDUCE'
    end
    object qryVentasDEtPORC_DESC_ITEM: TFloatField
      FieldName = 'PORC_DESC_ITEM'
      Origin = 'VENTAS_DET.PORC_DESC_ITEM'
    end
    object qryVentasDEtMONTO_DESC_ITEM: TFloatField
      FieldName = 'MONTO_DESC_ITEM'
      Origin = 'VENTAS_DET.MONTO_DESC_ITEM'
    end
    object qryVentasDEtITBIS_FISCAL_DET: TFloatField
      FieldName = 'ITBIS_FISCAL_DET'
      Origin = 'VENTAS_DET.ITBIS_FISCAL_DET'
    end
    object qryVentasDEtIDTASAITBIS: TFloatField
      FieldName = 'IDTASAITBIS'
      Origin = 'VENTAS_DET.IDTASAITBIS'
    end
    object qryVentasDEtMONTOIBISRECARGO: TFloatField
      FieldName = 'MONTOIBISRECARGO'
      Origin = 'VENTAS_DET.MONTOIBISRECARGO'
    end
    object qryVentasDEtDC_ITBIS_CLD: TFloatField
      FieldName = 'DC_ITBIS_CLD'
      Origin = 'VENTAS_DET.DC_ITBIS_CLD'
    end
    object qryVentasDEtTC_MONTOITBISRECARGO_GLB: TFloatField
      FieldName = 'TC_MONTOITBISRECARGO_GLB'
      Origin = 'VENTAS_DET.TC_MONTOITBISRECARGO_GLB'
    end
    object qryVentasDEtTC_MONTOITBISRECARGO_ITM: TFloatField
      FieldName = 'TC_MONTOITBISRECARGO_ITM'
      Origin = 'VENTAS_DET.TC_MONTOITBISRECARGO_ITM'
    end
    object qryVentasDEtLEVEL_PRECIO_VENTA: TSmallintField
      FieldName = 'LEVEL_PRECIO_VENTA'
      Origin = 'VENTAS_DET.LEVEL_PRECIO_VENTA'
    end
  end
  object qryPosExtraSum: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from POS_EXTRA_SUM')
    Left = 536
    Top = 344
    object qryPosExtraSumNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'POS_EXTRA_SUM.NUMERO'
      Required = True
    end
    object qryPosExtraSumDC_MONTOBRUTO: TFloatField
      FieldName = 'DC_MONTOBRUTO'
      Origin = 'POS_EXTRA_SUM.DC_MONTOBRUTO'
    end
    object qryPosExtraSumD_TASA_ITBIS: TFloatField
      FieldName = 'D_TASA_ITBIS'
      Origin = 'POS_EXTRA_SUM.D_TASA_ITBIS'
    end
    object qryPosExtraSumD_PORCDESCITEM: TFloatField
      FieldName = 'D_PORCDESCITEM'
      Origin = 'POS_EXTRA_SUM.D_PORCDESCITEM'
    end
    object qryPosExtraSumT_PORCDESADICIONAL: TFloatField
      FieldName = 'T_PORCDESADICIONAL'
      Origin = 'POS_EXTRA_SUM.T_PORCDESADICIONAL'
    end
    object qryPosExtraSumT_RECARGO: TFloatField
      FieldName = 'T_RECARGO'
      Origin = 'POS_EXTRA_SUM.T_RECARGO'
    end
    object qryPosExtraSumT_PROPINA: TFloatField
      FieldName = 'T_PROPINA'
      Origin = 'POS_EXTRA_SUM.T_PROPINA'
    end
    object qryPosExtraSumT_MONTOINTERES: TFloatField
      FieldName = 'T_MONTOINTERES'
      Origin = 'POS_EXTRA_SUM.T_MONTOINTERES'
    end
    object qryPosExtraSumT_MONTONCRAPLICADO: TFloatField
      FieldName = 'T_MONTONCRAPLICADO'
      Origin = 'POS_EXTRA_SUM.T_MONTONCRAPLICADO'
    end
    object qryPosExtraSumT_DEVOLUCION: TFloatField
      FieldName = 'T_DEVOLUCION'
      Origin = 'POS_EXTRA_SUM.T_DEVOLUCION'
    end
    object qryPosExtraSumTC_TOTALNETO: TFloatField
      FieldName = 'TC_TOTALNETO'
      Origin = 'POS_EXTRA_SUM.TC_TOTALNETO'
    end
    object qryPosExtraSumTC_ITBIS: TFloatField
      FieldName = 'TC_ITBIS'
      Origin = 'POS_EXTRA_SUM.TC_ITBIS'
    end
    object qryPosExtraSumD_TRANSPITBIS: TSmallintField
      FieldName = 'D_TRANSPITBIS'
      Origin = 'POS_EXTRA_SUM.D_TRANSPITBIS'
    end
    object qryPosExtraSumDC_MONTODESCITEM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'DC_MONTODESCITEM'
      Origin = 'POS_EXTRA_SUM.DC_MONTODESCITEM'
      ReadOnly = True
    end
    object qryPosExtraSumDC_PORCPROPLEGAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'DC_PORCPROPLEGAL'
      Origin = 'POS_EXTRA_SUM.DC_PORCPROPLEGAL'
      ReadOnly = True
    end
    object qryPosExtraSumTC_MONTODESCGLOBAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_MONTODESCGLOBAL'
      Origin = 'POS_EXTRA_SUM.TC_MONTODESCGLOBAL'
      ReadOnly = True
    end
    object qryPosExtraSumDC_ESDESITEM: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DC_ESDESITEM'
      Origin = 'POS_EXTRA_SUM.DC_ESDESITEM'
      ReadOnly = True
    end
    object qryPosExtraSumTC_MONTODESCITEMS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_MONTODESCITEMS'
      Origin = 'POS_EXTRA_SUM.TC_MONTODESCITEMS'
      ReadOnly = True
    end
    object qryPosExtraSumTC_FMONTODESCNIVELITEM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_FMONTODESCNIVELITEM'
      Origin = 'POS_EXTRA_SUM.TC_FMONTODESCNIVELITEM'
      ReadOnly = True
    end
    object qryPosExtraSumTC_SUBTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_SUBTOTAL'
      Origin = 'POS_EXTRA_SUM.TC_SUBTOTAL'
      ReadOnly = True
    end
    object qryPosExtraSumTC_MONTODESCADICIONAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_MONTODESCADICIONAL'
      Origin = 'POS_EXTRA_SUM.TC_MONTODESCADICIONAL'
      ReadOnly = True
    end
    object qryPosExtraSumDC_PROPINALEGAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'DC_PROPINALEGAL'
      Origin = 'POS_EXTRA_SUM.DC_PROPINALEGAL'
      ReadOnly = True
    end
    object qryPosExtraSumDC_ITBIS_CLD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'DC_ITBIS_CLD'
      Origin = 'POS_EXTRA_SUM.DC_ITBIS_CLD'
      ReadOnly = True
    end
    object qryPosExtraSumTC_MONTOITBISRECARGO_GLB: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_MONTOITBISRECARGO_GLB'
      Origin = 'POS_EXTRA_SUM.TC_MONTOITBISRECARGO_GLB'
      ReadOnly = True
    end
    object qryPosExtraSumTC_MONTOITBISRECARGO_ITM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TC_MONTOITBISRECARGO_ITM'
      Origin = 'POS_EXTRA_SUM.TC_MONTOITBISRECARGO_ITM'
      ReadOnly = True
    end
  end
  object qryGetTotalItbis: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      'sum(distinct r.T_RECARGO) t_recargo, '
      'sum(r.DC_ITBIS_CLD+r.tc_montoitbisrecargo_itm) subtotalItbis,'
      
        'sum(DC_ITBIS_CLD+TC_MONTOITBISRECARGO_GLB+TC_MONTOITBISRECARGO_I' +
        'TM) itbis_total'
      'From POS_EXTRA_SUM r'
      'Where r.NUMERO =:glbnumeropos')
    Left = 456
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'glbnumeropos'
        ParamType = ptInput
      end>
    object qryGetTotalItbisT_RECARGO: TFloatField
      FieldName = 'T_RECARGO'
      Origin = 'POS_EXTRA_SUM.T_RECARGO'
    end
    object qryGetTotalItbisSUBTOTALITBIS: TFloatField
      FieldName = 'SUBTOTALITBIS'
    end
    object qryGetTotalItbisITBIS_TOTAL: TFloatField
      FieldName = 'ITBIS_TOTAL'
    end
  end
  object ibSqlUpdateVtaMast: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'update ventas_mast'
      'set sub_totalitbis=:montototalitbis'
      'where numero =:numero')
    Transaction = dmConectar.IBTransaction1
    Left = 536
    Top = 40
  end
  object ibSqlUpdateVtaMastCotiza: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'update COTIZACION_MAST'
      'set sub_totalitbis=:montototalitbis'
      'where numero =:numero')
    Transaction = dmConectar.IBTransaction1
    Left = 568
    Top = 96
  end
  object qryAplicaOferta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select r.CANTIDAD, r.TIPO_UNIDADOFTA, u.CANTIDAD cant_tipo_unida' +
        'd'
      'From OFERTAS r'
      'inner join UNIDADES u on u.IDUNIDAD = r.TIPO_UNIDADOFTA'
      'Where r.CODIGO_PROD=:codprod'
      'and r.TIPO_UNIDADVTA =:tipound'
      'and :fecha between r.FECHA_inicial and r.FECHA_final')
    Left = 592
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codprod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipound'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end>
    object qryAplicaOfertaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'OFERTAS.CANTIDAD'
    end
    object qryAplicaOfertaTIPO_UNIDADOFTA: TIntegerField
      FieldName = 'TIPO_UNIDADOFTA'
      Origin = 'OFERTAS.TIPO_UNIDADOFTA'
      Required = True
    end
    object qryAplicaOfertaCANT_TIPO_UNIDAD: TIntegerField
      FieldName = 'CANT_TIPO_UNIDAD'
      Origin = 'UNIDADES.CANTIDAD'
    end
  end
end
