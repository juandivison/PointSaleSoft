object dmDistCnt: TdmDistCnt
  OldCreateOrder = False
  Left = 742
  Top = 127
  Height = 525
  Width = 426
  object qryDistCnt: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    AfterScroll = qryDistCntAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From distribucion_cnt'
      'Where upper(Nombre_tabla) =upper(:Nombretabla)'
      'Order By nombre_tabla')
    Left = 48
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'Nombretabla'
        ParamType = ptInput
      end>
    object qryDistCntSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DISTRIBUCION_CNT.SERIE'
    end
    object qryDistCntMODULO: TIntegerField
      FieldName = 'MODULO'
      Origin = 'DISTRIBUCION_CNT.MODULO'
    end
    object qryDistCntORIGEN: TIntegerField
      FieldName = 'ORIGEN'
      Origin = 'DISTRIBUCION_CNT.ORIGEN'
    end
    object qryDistCntCTA1: TIBStringField
      FieldName = 'CTA1'
      Origin = 'DISTRIBUCION_CNT.CTA1'
      Size = 3
    end
    object qryDistCntCTA2: TIBStringField
      FieldName = 'CTA2'
      Origin = 'DISTRIBUCION_CNT.CTA2'
      Size = 2
    end
    object qryDistCntCTA3: TIBStringField
      FieldName = 'CTA3'
      Origin = 'DISTRIBUCION_CNT.CTA3'
      Size = 2
    end
    object qryDistCntDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DISTRIBUCION_CNT.DESCRIPCION'
      Size = 40
    end
    object qryDistCntNOMBRE_CAMPO: TIBStringField
      FieldName = 'NOMBRE_CAMPO'
      Origin = 'DISTRIBUCION_CNT.NOMBRE_CAMPO'
      Size = 40
    end
    object qryDistCntNOMBRE_TABLA: TIBStringField
      FieldName = 'NOMBRE_TABLA'
      Origin = 'DISTRIBUCION_CNT.NOMBRE_TABLA'
      Size = 40
    end
    object qryDistCntSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DISTRIBUCION_CNT.STATUS'
      Size = 1
    end
    object qryDistCntINSERT_POR: TIBStringField
      FieldName = 'INSERT_POR'
      Origin = 'DISTRIBUCION_CNT.INSERT_POR'
      Size = 12
    end
    object qryDistCntFECHA_INSER: TDateTimeField
      FieldName = 'FECHA_INSER'
      Origin = 'DISTRIBUCION_CNT.FECHA_INSER'
    end
    object qryDistCntUPDATE_POR: TIBStringField
      FieldName = 'UPDATE_POR'
      Origin = 'DISTRIBUCION_CNT.UPDATE_POR'
      Size = 12
    end
    object qryDistCntCNT: TSmallintField
      FieldName = 'CNT'
      Origin = 'DISTRIBUCION_CNT.CNT'
    end
    object qryDistCntIDTIPO_PAGO: TSmallintField
      FieldName = 'IDTIPO_PAGO'
      Origin = 'DISTRIBUCION_CNT.IDTIPO_PAGO'
    end
  end
  object dsqryDistCnt: TDataSource
    DataSet = qryDistCnt
    Left = 48
    Top = 80
  end
  object rxDatosTransCnt: TRxMemoryData
    FieldDefs = <
      item
        Name = 'cta1'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'cta2'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'cta3'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Debito'
        DataType = ftFloat
      end
      item
        Name = 'Credito'
        DataType = ftFloat
      end>
    Left = 184
    Top = 64
    object rxDatosTransCntcta1: TStringField
      FieldName = 'cta1'
      Size = 3
    end
    object rxDatosTransCntcta2: TStringField
      FieldName = 'cta2'
      Size = 2
    end
    object rxDatosTransCntcta3: TStringField
      FieldName = 'cta3'
      Size = 2
    end
    object rxDatosTransCntDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 40
    end
    object rxDatosTransCntDebito: TFloatField
      FieldName = 'Debito'
    end
    object rxDatosTransCntCredito: TFloatField
      FieldName = 'Credito'
    end
  end
  object dsrxDatosTransCnt: TDataSource
    DataSet = rxDatosTransCnt
    Left = 304
    Top = 16
  end
  object qryDatosAContabilizar: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 48
    Top = 144
  end
  object dtqryDatosAContabilizar: TDataSource
    DataSet = qryDatosAContabilizar
    Left = 184
    Top = 144
  end
  object qryDistCntCompuesta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From DISTRIB_CNT_COMPUESTA'
      'Where Numero =:numero')
    Left = 304
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryDistCntCompuestaSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DISTRIB_CNT_COMPUESTA.SERIE'
      Required = True
    end
    object qryDistCntCompuestaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DISTRIB_CNT_COMPUESTA.NUMERO'
      Required = True
    end
    object qryDistCntCompuestaCTA1: TIBStringField
      FieldName = 'CTA1'
      Origin = 'DISTRIB_CNT_COMPUESTA.CTA1'
      Size = 3
    end
    object qryDistCntCompuestaCTA2: TIBStringField
      FieldName = 'CTA2'
      Origin = 'DISTRIB_CNT_COMPUESTA.CTA2'
      Size = 2
    end
    object qryDistCntCompuestaCTA3: TIBStringField
      FieldName = 'CTA3'
      Origin = 'DISTRIB_CNT_COMPUESTA.CTA3'
      Size = 2
    end
    object qryDistCntCompuestaNOMBRE_CAMPO: TIBStringField
      FieldName = 'NOMBRE_CAMPO'
      Origin = 'DISTRIB_CNT_COMPUESTA.NOMBRE_CAMPO'
      Size = 40
    end
    object qryDistCntCompuestaNOMBRE_TABLA: TIBStringField
      FieldName = 'NOMBRE_TABLA'
      Origin = 'DISTRIB_CNT_COMPUESTA.NOMBRE_TABLA'
      Size = 40
    end
    object qryDistCntCompuestaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DISTRIB_CNT_COMPUESTA.STATUS'
      Size = 1
    end
    object qryDistCntCompuestaINSERT_POR: TIBStringField
      FieldName = 'INSERT_POR'
      Origin = 'DISTRIB_CNT_COMPUESTA.INSERT_POR'
      Size = 12
    end
    object qryDistCntCompuestaFECHA_INSER: TDateTimeField
      FieldName = 'FECHA_INSER'
      Origin = 'DISTRIB_CNT_COMPUESTA.FECHA_INSER'
    end
    object qryDistCntCompuestaUPDATE_POR: TIBStringField
      FieldName = 'UPDATE_POR'
      Origin = 'DISTRIB_CNT_COMPUESTA.UPDATE_POR'
      Size = 12
    end
    object qryDistCntCompuestaSIGNO: TIBStringField
      FieldName = 'SIGNO'
      Origin = 'DISTRIB_CNT_COMPUESTA.SIGNO'
      FixedChar = True
      Size = 1
    end
  end
  object qryDatosAContCompuesto: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 56
    Top = 208
  end
  object dsqryDatosAContCompuesto: TDataSource
    DataSet = qryDatosAContCompuesto
    Left = 208
    Top = 216
  end
  object tblModuloCnt: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'MODULO_CNT'
    Left = 304
    Top = 144
    object tblModuloCntID: TIntegerField
      FieldName = 'ID'
    end
    object tblModuloCntDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object dstblModuloCnt: TDataSource
    DataSet = tblModuloCnt
    Left = 304
    Top = 192
  end
  object qryCampoClave: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From DISTRIB_CNT_CCLAVE'
      'Where  NUMERO =:numero')
    Left = 48
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryCampoClaveSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DISTRIB_CNT_CCLAVE.SERIE'
      Required = True
    end
    object qryCampoClaveNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'DISTRIB_CNT_CCLAVE.NUMERO'
      Required = True
    end
    object qryCampoClaveCAMPO_CLAVE: TIBStringField
      FieldName = 'CAMPO_CLAVE'
      Origin = 'DISTRIB_CNT_CCLAVE.CAMPO_CLAVE'
      Size = 60
    end
    object qryCampoClaveNOMBRE_CAMPO: TIBStringField
      FieldName = 'NOMBRE_CAMPO'
      Origin = 'DISTRIB_CNT_CCLAVE.NOMBRE_CAMPO'
      Size = 40
    end
    object qryCampoClaveNOMBRE_TABLA: TIBStringField
      FieldName = 'NOMBRE_TABLA'
      Origin = 'DISTRIB_CNT_CCLAVE.NOMBRE_TABLA'
      Size = 60
    end
    object qryCampoClaveSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DISTRIB_CNT_CCLAVE.STATUS'
      Size = 1
    end
    object qryCampoClaveINSERT_POR: TIBStringField
      FieldName = 'INSERT_POR'
      Origin = 'DISTRIB_CNT_CCLAVE.INSERT_POR'
      Size = 12
    end
    object qryCampoClaveFECHA_INSER: TDateTimeField
      FieldName = 'FECHA_INSER'
      Origin = 'DISTRIB_CNT_CCLAVE.FECHA_INSER'
    end
    object qryCampoClaveUPDATE_POR: TIBStringField
      FieldName = 'UPDATE_POR'
      Origin = 'DISTRIB_CNT_CCLAVE.UPDATE_POR'
      Size = 12
    end
  end
  object qryDatosCampoClave: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 208
    Top = 296
  end
  object tblGrupoCnt: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'GRUPO_CNT'
    Left = 336
    Top = 248
    object tblGrupoCntID_FPAGO: TSmallintField
      FieldName = 'ID_FPAGO'
    end
    object tblGrupoCntMODULO: TIntegerField
      FieldName = 'MODULO'
    end
    object tblGrupoCntDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 75
    end
  end
  object dstblGrupoCnt: TDataSource
    DataSet = tblGrupoCnt
    Left = 320
    Top = 312
  end
  object tblFormaPago: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_PAGO'
    Left = 184
    Top = 16
    object tblFormaPagoCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tblFormaPagoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 15
    end
    object tblFormaPagoORIGEN: TSmallintField
      FieldName = 'ORIGEN'
    end
  end
  object dstblFormaPago: TDataSource
    DataSet = tblFormaPago
    Left = 112
    Top = 120
  end
  object tblDistCntMaster: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblDistCntMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    TableName = 'DISTRIBUCION_CNT_MASTER'
    Left = 136
    Top = 272
    object tblDistCntMasterID: TIntegerField
      FieldName = 'ID'
    end
    object tblDistCntMasterDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object tblDistCntMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
    end
    object tblDistCntMasterUSER_IN: TIBStringField
      FieldName = 'USER_IN'
      Size = 12
    end
  end
  object dstblDistCntMaster: TDataSource
    DataSet = tblDistCntMaster
    Left = 48
    Top = 320
  end
  object dstblDistribucionCnt: TDataSource
    DataSet = tblDistribucionCnt
    Left = 136
    Top = 352
  end
  object tblDistribucionCntold: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'SERIE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MODULO'
        DataType = ftInteger
      end
      item
        Name = 'ORIGEN'
        DataType = ftInteger
      end
      item
        Name = 'CTA1'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CTA2'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CTA3'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NOMBRE_CAMPO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NOMBRE_TABLA'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'INSERT_POR'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'FECHA_INSER'
        DataType = ftDateTime
      end
      item
        Name = 'UPDATE_POR'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'CNT'
        DataType = ftSmallint
      end
      item
        Name = 'IDTIPO_PAGO'
        DataType = ftSmallint
      end
      item
        Name = 'NOMBRE_CAMPO_CNTDET'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NOMBRE_CAMPO_CNTMASTER'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'DISTRIBUCION_CNTINDEX1'
        Fields = 'SERIE'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY107'
        Fields = 'SERIE'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'DISTRIBUCION_CNT'
    Left = 64
    Top = 416
    object tblDistribucionCntoldSERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
    end
    object tblDistribucionCntoldMODULO: TIntegerField
      DisplayLabel = 'Modulo'
      FieldName = 'MODULO'
    end
    object tblDistribucionCntoldORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
    end
    object tblDistribucionCntoldCTA1: TIBStringField
      DisplayLabel = 'Cta1'
      FieldName = 'CTA1'
      Size = 3
    end
    object tblDistribucionCntoldCTA2: TIBStringField
      DisplayLabel = 'Cta2'
      FieldName = 'CTA2'
      Size = 2
    end
    object tblDistribucionCntoldCTA3: TIBStringField
      DisplayLabel = 'Cta3'
      FieldName = 'CTA3'
      Size = 2
    end
    object tblDistribucionCntoldDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object tblDistribucionCntoldNOMBRE_CAMPO: TIBStringField
      DisplayLabel = 'Nombre Campo'
      FieldName = 'NOMBRE_CAMPO'
      Size = 40
    end
    object tblDistribucionCntoldNOMBRE_TABLA: TIBStringField
      DisplayLabel = 'Nombre Tabla'
      FieldName = 'NOMBRE_TABLA'
      Size = 40
    end
    object tblDistribucionCntoldSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 1
    end
    object tblDistribucionCntoldINSERT_POR: TIBStringField
      FieldName = 'INSERT_POR'
      Size = 12
    end
    object tblDistribucionCntoldFECHA_INSER: TDateTimeField
      FieldName = 'FECHA_INSER'
    end
    object tblDistribucionCntoldUPDATE_POR: TIBStringField
      FieldName = 'UPDATE_POR'
      Size = 12
    end
    object tblDistribucionCntoldCNT: TSmallintField
      FieldName = 'CNT'
    end
    object tblDistribucionCntoldIDTIPO_PAGO: TSmallintField
      FieldName = 'IDTIPO_PAGO'
    end
    object tblDistribucionCntoldNOMBRE_CAMPO_CNTDET: TIBStringField
      FieldName = 'NOMBRE_CAMPO_CNTDET'
      Size = 60
    end
    object tblDistribucionCntoldNOMBRE_CAMPO_CNTMASTER: TIBStringField
      FieldName = 'NOMBRE_CAMPO_CNTMASTER'
      Size = 60
    end
  end
  object tblDistribucionCnt: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DISTRIBUCION_CNT'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into DISTRIBUCION_CNT'
      
        '  (SERIE, MODULO, ORIGEN, CTA1, CTA2, CTA3, DESCRIPCION, NOMBRE_' +
        'CAMPO, '
      
        '   NOMBRE_TABLA, STATUS, INSERT_POR, FECHA_INSER, UPDATE_POR, CN' +
        'T, IDTIPO_PAGO, '
      
        '   NOMBRE_CAMPO_CNTDET, NOMBRE_CAMPO_CNTMASTER, NOMBRE_TABLA_CNT' +
        ', SENTENCIA_SQL)'
      'values'
      
        '  (:SERIE, :MODULO, :ORIGEN, :CTA1, :CTA2, :CTA3, :DESCRIPCION, ' +
        ':NOMBRE_CAMPO, '
      
        '   :NOMBRE_TABLA, :STATUS, :INSERT_POR, :FECHA_INSER, :UPDATE_PO' +
        'R, :CNT, '
      
        '   :IDTIPO_PAGO, :NOMBRE_CAMPO_CNTDET, :NOMBRE_CAMPO_CNTMASTER, ' +
        ':NOMBRE_TABLA_CNT, '
      '   :SENTENCIA_SQL)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  MODULO,'
      '  ORIGEN,'
      '  CTA1,'
      '  CTA2,'
      '  CTA3,'
      '  DESCRIPCION,'
      '  NOMBRE_CAMPO,'
      '  NOMBRE_TABLA,'
      '  STATUS,'
      '  INSERT_POR,'
      '  FECHA_INSER,'
      '  UPDATE_POR,'
      '  CNT,'
      '  IDTIPO_PAGO,'
      '  NOMBRE_CAMPO_CNTDET,'
      '  NOMBRE_CAMPO_CNTMASTER,'
      '  NOMBRE_TABLA_CNT,'
      '  SENTENCIA_SQL'
      'from DISTRIBUCION_CNT '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * from DISTRIBUCION_CNT'
      'Where IDTIPO_PAGO =:idtipopago'
      'and NOMBRE_TABLA =:nombretabla'
      'order by IDTIPO_PAGO')
    ModifySQL.Strings = (
      'update DISTRIBUCION_CNT'
      'set'
      '  SERIE = :SERIE,'
      '  MODULO = :MODULO,'
      '  ORIGEN = :ORIGEN,'
      '  CTA1 = :CTA1,'
      '  CTA2 = :CTA2,'
      '  CTA3 = :CTA3,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  NOMBRE_CAMPO = :NOMBRE_CAMPO,'
      '  NOMBRE_TABLA = :NOMBRE_TABLA,'
      '  STATUS = :STATUS,'
      '  INSERT_POR = :INSERT_POR,'
      '  FECHA_INSER = :FECHA_INSER,'
      '  UPDATE_POR = :UPDATE_POR,'
      '  CNT = :CNT,'
      '  IDTIPO_PAGO = :IDTIPO_PAGO,'
      '  NOMBRE_CAMPO_CNTDET = :NOMBRE_CAMPO_CNTDET,'
      '  NOMBRE_CAMPO_CNTMASTER = :NOMBRE_CAMPO_CNTMASTER,'
      '  NOMBRE_TABLA_CNT = :NOMBRE_TABLA_CNT,'
      '  SENTENCIA_SQL = :SENTENCIA_SQL'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 176
    Top = 416
    object tblDistribucionCntSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DISTRIBUCION_CNT.SERIE'
      Required = True
    end
    object tblDistribucionCntMODULO: TIntegerField
      FieldName = 'MODULO'
      Origin = 'DISTRIBUCION_CNT.MODULO'
    end
    object tblDistribucionCntORIGEN: TIntegerField
      FieldName = 'ORIGEN'
      Origin = 'DISTRIBUCION_CNT.ORIGEN'
    end
    object tblDistribucionCntCTA1: TIBStringField
      FieldName = 'CTA1'
      Origin = 'DISTRIBUCION_CNT.CTA1'
      Size = 3
    end
    object tblDistribucionCntCTA2: TIBStringField
      FieldName = 'CTA2'
      Origin = 'DISTRIBUCION_CNT.CTA2'
      Size = 2
    end
    object tblDistribucionCntCTA3: TIBStringField
      FieldName = 'CTA3'
      Origin = 'DISTRIBUCION_CNT.CTA3'
      Size = 2
    end
    object tblDistribucionCntDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DISTRIBUCION_CNT.DESCRIPCION'
      Size = 40
    end
    object tblDistribucionCntNOMBRE_CAMPO: TIBStringField
      FieldName = 'NOMBRE_CAMPO'
      Origin = 'DISTRIBUCION_CNT.NOMBRE_CAMPO'
      Size = 40
    end
    object tblDistribucionCntNOMBRE_TABLA: TIBStringField
      FieldName = 'NOMBRE_TABLA'
      Origin = 'DISTRIBUCION_CNT.NOMBRE_TABLA'
      Size = 40
    end
    object tblDistribucionCntSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'DISTRIBUCION_CNT.STATUS'
      Size = 1
    end
    object tblDistribucionCntINSERT_POR: TIBStringField
      FieldName = 'INSERT_POR'
      Origin = 'DISTRIBUCION_CNT.INSERT_POR'
      Size = 12
    end
    object tblDistribucionCntFECHA_INSER: TDateTimeField
      FieldName = 'FECHA_INSER'
      Origin = 'DISTRIBUCION_CNT.FECHA_INSER'
    end
    object tblDistribucionCntUPDATE_POR: TIBStringField
      FieldName = 'UPDATE_POR'
      Origin = 'DISTRIBUCION_CNT.UPDATE_POR'
      Size = 12
    end
    object tblDistribucionCntCNT: TSmallintField
      FieldName = 'CNT'
      Origin = 'DISTRIBUCION_CNT.CNT'
    end
    object tblDistribucionCntIDTIPO_PAGO: TSmallintField
      FieldName = 'IDTIPO_PAGO'
      Origin = 'DISTRIBUCION_CNT.IDTIPO_PAGO'
    end
    object tblDistribucionCntNOMBRE_CAMPO_CNTDET: TIBStringField
      FieldName = 'NOMBRE_CAMPO_CNTDET'
      Origin = 'DISTRIBUCION_CNT.NOMBRE_CAMPO_CNTDET'
      Size = 60
    end
    object tblDistribucionCntNOMBRE_CAMPO_CNTMASTER: TIBStringField
      FieldName = 'NOMBRE_CAMPO_CNTMASTER'
      Origin = 'DISTRIBUCION_CNT.NOMBRE_CAMPO_CNTMASTER'
      Size = 60
    end
    object tblDistribucionCntNOMBRE_TABLA_CNT: TIBStringField
      FieldName = 'NOMBRE_TABLA_CNT'
      Origin = 'DISTRIBUCION_CNT.NOMBRE_TABLA_CNT'
      Size = 70
    end
    object tblDistribucionCntSENTENCIA_SQL: TIBStringField
      FieldName = 'SENTENCIA_SQL'
      Origin = 'DISTRIBUCION_CNT.SENTENCIA_SQL'
      Size = 200
    end
  end
  object tblGrpTipoPago: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'GRUPO_TIPO_PAGO'
    Left = 304
    Top = 368
    object tblGrpTipoPagoID_FPAGO: TSmallintField
      FieldName = 'ID_FPAGO'
    end
    object tblGrpTipoPagoCODIGO_TIPO_PAGO: TSmallintField
      FieldName = 'CODIGO_TIPO_PAGO'
    end
    object tblGrpTipoPagoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 75
    end
  end
  object dstblGrpTipoPago: TDataSource
    DataSet = tblGrpTipoPago
    Left = 304
    Top = 432
  end
end
