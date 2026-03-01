object dmInventario: TdmInventario
  OldCreateOrder = False
  Left = 376
  Top = 135
  Height = 463
  Width = 627
  object tblInventarioProd: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from INVENTARIO_PRODUCTO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into INVENTARIO_PRODUCTO'
      
        '  (CODIGO, CODIGO_TEXTO, FECHA, CODIGO_BARRA, TIPO, DESCRIPCION,' +
        ' CANTIDAD_REORDEN, '
      
        '   PRECIO_ANT, CANTIDAD, PRECIO, BLCE_CANT_ENTRADA, BLCE_CANT_SA' +
        'LIDA, FECHA_ULTIMA_TRN, '
      
        '   STATUS, PORC_DESCUENTO, FOTO, PAGA_ITBI, CODIGO_PRECIO, UNIDA' +
        'D, PRECIO_COMPRA, '
      '   PRECIO_MINIMO, REFERENCIA, FECHA_VENCIMIENTO, INVENTARIAR)'
      'values'
      
        '  (:CODIGO, :CODIGO_TEXTO, :FECHA, :CODIGO_BARRA, :TIPO, :DESCRI' +
        'PCION, '
      
        '   :CANTIDAD_REORDEN, :PRECIO_ANT, :CANTIDAD, :PRECIO, :BLCE_CAN' +
        'T_ENTRADA, '
      
        '   :BLCE_CANT_SALIDA, :FECHA_ULTIMA_TRN, :STATUS, :PORC_DESCUENT' +
        'O, :FOTO, '
      
        '   :PAGA_ITBI, :CODIGO_PRECIO, :UNIDAD, :PRECIO_COMPRA, :PRECIO_' +
        'MINIMO, '
      '   :REFERENCIA, :FECHA_VENCIMIENTO, :INVENTARIAR)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  CODIGO_TEXTO,'
      '  FECHA,'
      '  CODIGO_BARRA,'
      '  TIPO,'
      '  DESCRIPCION,'
      '  CANTIDAD_REORDEN,'
      '  PRECIO_ANT,'
      '  CANTIDAD,'
      '  PRECIO,'
      '  BLCE_CANT_ENTRADA,'
      '  BLCE_CANT_SALIDA,'
      '  FECHA_ULTIMA_TRN,'
      '  STATUS,'
      '  PORC_DESCUENTO,'
      '  FOTO,'
      '  PAGA_ITBI,'
      '  CODIGO_PRECIO,'
      '  UNIDAD,'
      '  PRECIO_COMPRA,'
      '  PRECIO_MINIMO,'
      '  REFERENCIA,'
      '  FECHA_VENCIMIENTO,'
      '  INVENTARIAR'
      'from INVENTARIO_PRODUCTO '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'SELECT  * from INVENTARIO_PRODUCTO'
      'Order By codigo')
    ModifySQL.Strings = (
      'update INVENTARIO_PRODUCTO'
      'set'
      '  CODIGO = :CODIGO,'
      '  CODIGO_TEXTO = :CODIGO_TEXTO,'
      '  FECHA = :FECHA,'
      '  CODIGO_BARRA = :CODIGO_BARRA,'
      '  TIPO = :TIPO,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  CANTIDAD_REORDEN = :CANTIDAD_REORDEN,'
      '  PRECIO_ANT = :PRECIO_ANT,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO = :PRECIO,'
      '  BLCE_CANT_ENTRADA = :BLCE_CANT_ENTRADA,'
      '  BLCE_CANT_SALIDA = :BLCE_CANT_SALIDA,'
      '  FECHA_ULTIMA_TRN = :FECHA_ULTIMA_TRN,'
      '  STATUS = :STATUS,'
      '  PORC_DESCUENTO = :PORC_DESCUENTO,'
      '  FOTO = :FOTO,'
      '  PAGA_ITBI = :PAGA_ITBI,'
      '  CODIGO_PRECIO = :CODIGO_PRECIO,'
      '  UNIDAD = :UNIDAD,'
      '  PRECIO_COMPRA = :PRECIO_COMPRA,'
      '  PRECIO_MINIMO = :PRECIO_MINIMO,'
      '  REFERENCIA = :REFERENCIA,'
      '  FECHA_VENCIMIENTO = :FECHA_VENCIMIENTO,'
      '  INVENTARIAR = :INVENTARIAR'
      'where'
      '  CODIGO = :OLD_CODIGO')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_NUM_INV_PROD'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 160
    Top = 32
    object tblInventarioProdCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object tblInventarioProdCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object tblInventarioProdFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'INVENTARIO_PRODUCTO.FECHA'
    end
    object tblInventarioProdCODIGO_BARRA: TIBStringField
      DisplayLabel = 'Codigo Barra'
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
    object tblInventarioProdTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object tblInventarioProdDESCRIPCION: TIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object tblInventarioProdCANTIDAD_REORDEN: TIntegerField
      DisplayLabel = 'Cantidad Reorden'
      FieldName = 'CANTIDAD_REORDEN'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD_REORDEN'
    end
    object tblInventarioProdPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ANT'
    end
    object tblInventarioProdCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object tblInventarioProdPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object tblInventarioProdBLCE_CANT_ENTRADA: TFloatField
      FieldName = 'BLCE_CANT_ENTRADA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_ENTRADA'
    end
    object tblInventarioProdBLCE_CANT_SALIDA: TFloatField
      FieldName = 'BLCE_CANT_SALIDA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_SALIDA'
    end
    object tblInventarioProdFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN'
    end
    object tblInventarioProdSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INVENTARIO_PRODUCTO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblInventarioProdPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'INVENTARIO_PRODUCTO.PORC_DESCUENTO'
    end
    object tblInventarioProdFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'INVENTARIO_PRODUCTO.FOTO'
      Size = 8
    end
    object tblInventarioProdPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
    end
    object tblInventarioProdCODIGO_PRECIO: TIBStringField
      FieldName = 'CODIGO_PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_PRECIO'
      FixedChar = True
      Size = 6
    end
    object tblInventarioProdUNIDAD: TFloatField
      FieldName = 'UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.UNIDAD'
    end
    object tblInventarioProdPRECIO_COMPRA: TFloatField
      DisplayLabel = 'Precio Compra'
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object tblInventarioProdPRECIO_MINIMO: TFloatField
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
    object tblInventarioProdREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object tblInventarioProdFECHA_VENCIMIENTO: TDateTimeField
      FieldName = 'FECHA_VENCIMIENTO'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_VENCIMIENTO'
    end
    object tblInventarioProdINVENTARIAR: TSmallintField
      FieldName = 'INVENTARIAR'
      Origin = 'INVENTARIO_PRODUCTO.INVENTARIAR'
    end
  end
  object dsInventarioProd: TDataSource
    DataSet = tblInventarioProd
    Left = 160
    Top = 96
  end
  object dstblTipoInventario: TDataSource
    DataSet = tblTipoInventario
    Left = 40
    Top = 144
  end
  object tblInventarioHistorico: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from INVENTARIO_HISTORICO'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into INVENTARIO_HISTORICO'
      '  (SERIE, CODIGO, PRECIO, FECHA_INICIO, FECHA_FINAL, STATUS)'
      'values'
      
        '  (:SERIE, :CODIGO, :PRECIO, :FECHA_INICIO, :FECHA_FINAL, :STATU' +
        'S)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  CODIGO,'
      '  PRECIO,'
      '  FECHA_INICIO,'
      '  FECHA_FINAL,'
      '  STATUS'
      'from INVENTARIO_HISTORICO '
      'Where SERIE = :OLD_SERIE')
    SelectSQL.Strings = (
      'SELECT  '
      'invh.CODIGO, '
      'invh.FECHA_FINAL, '
      'invh.FECHA_INICIO, '
      'invh.PRECIO, '
      'invh.SERIE, '
      'invh.STATUS, '
      'invp.DESCRIPCION '
      'from INVENTARIO_HISTORICO invh,'
      'inventario_producto invp'
      'Where  invh.codigo = invp.codigo')
    ModifySQL.Strings = (
      'update INVENTARIO_HISTORICO'
      'set'
      '  SERIE = :SERIE,'
      '  CODIGO = :CODIGO,'
      '  PRECIO = :PRECIO,'
      '  FECHA_INICIO = :FECHA_INICIO,'
      '  FECHA_FINAL = :FECHA_FINAL,'
      '  STATUS = :STATUS'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_NUM_INV_HIST'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 312
    Top = 40
    object tblInventarioHistoricoSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'INVENTARIO_HISTORICO.SERIE'
      Required = True
    end
    object tblInventarioHistoricoCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_HISTORICO.CODIGO'
      Required = True
      Size = 12
    end
    object tblInventarioHistoricoPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_HISTORICO.PRECIO'
    end
    object tblInventarioHistoricoFECHA_INICIO: TDateTimeField
      FieldName = 'FECHA_INICIO'
      Origin = 'INVENTARIO_HISTORICO.FECHA_INICIO'
    end
    object tblInventarioHistoricoFECHA_FINAL: TDateTimeField
      FieldName = 'FECHA_FINAL'
      Origin = 'INVENTARIO_HISTORICO.FECHA_FINAL'
    end
    object tblInventarioHistoricoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INVENTARIO_HISTORICO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblInventarioHistoricoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
  end
  object dstblInventarioHistorico: TDataSource
    DataSet = tblInventarioHistorico
    Left = 312
    Top = 96
  end
  object qryConsultaInvActual: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryConsultaInvActualAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select BLCE_CANT_ENTRADA, BLCE_CANT_SALIDA, CANTIDAD, CODIGO, DE' +
        'SCRIPCION, FECHA_ULTIMA_TRN, PRECIO, PRECIO_ANT  from INVENTARIO' +
        '_PRODUCTO')
    Left = 312
    Top = 144
    object qryConsultaInvActualBLCE_CANT_ENTRADA: TFloatField
      FieldName = 'BLCE_CANT_ENTRADA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_ENTRADA'
    end
    object qryConsultaInvActualBLCE_CANT_SALIDA: TFloatField
      FieldName = 'BLCE_CANT_SALIDA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_SALIDA'
    end
    object qryConsultaInvActualCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryConsultaInvActualCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryConsultaInvActualDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryConsultaInvActualFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN'
    end
    object qryConsultaInvActualPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryConsultaInvActualPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ANT'
    end
  end
  object dsqryConsultaInvActual: TDataSource
    DataSet = qryConsultaInvActual
    Left = 312
    Top = 192
  end
  object qryConsultaInvhist: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from INVENTARIO_HISTORICO'
      'where codigo =:codigo')
    Left = 416
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end>
    object qryConsultaInvhistSERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'INVENTARIO_HISTORICO.SERIE'
      Required = True
    end
    object qryConsultaInvhistCODIGO: TIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_HISTORICO.CODIGO'
      Required = True
      Size = 12
    end
    object qryConsultaInvhistPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_HISTORICO.PRECIO'
    end
    object qryConsultaInvhistFECHA_INICIO: TDateTimeField
      DisplayLabel = 'FechaIni'
      FieldName = 'FECHA_INICIO'
      Origin = 'INVENTARIO_HISTORICO.FECHA_INICIO'
    end
    object qryConsultaInvhistFECHA_FINAL: TDateTimeField
      DisplayLabel = 'FechaFin'
      FieldName = 'FECHA_FINAL'
      Origin = 'INVENTARIO_HISTORICO.FECHA_FINAL'
    end
  end
  object dsqryConsultaInvhist: TDataSource
    DataSet = qryConsultaInvhist
    Left = 416
    Top = 200
  end
  object qryValorEnInventario: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      
        'Select count(codigo) CantidadProductos,   sum(cantidad * precio)' +
        '  ValorInventario'
      'From inventario_producto'
      'where Status = '#39'A'#39)
    Transaction = dmConectar.IBTransaction1
    Left = 160
    Top = 144
  end
  object qryValorLetras: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from VALOR_LETRAS')
    Left = 40
    Top = 200
    object qryValorLetrasCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'VALOR_LETRAS.CODIGO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryValorLetrasVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR_LETRAS.VALOR'
    end
  end
  object tblTipoInventario: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select * from TIPO_INVENTARIO'
      'order by descripcion')
    UpdateObject = IBUpdateSQL2
    Left = 40
    Top = 96
    object tblTipoInventarioCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Origin = 'TIPO_INVENTARIO.CODIGO'
      Required = True
    end
    object tblTipoInventarioDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_INVENTARIO.DESCRIPCION'
      Size = 30
    end
  end
  object IBUpdateSQL2: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  DESCRIPCION'
      'from TIPO_INVENTARIO '
      'where'
      '  CODIGO = :CODIGO')
    ModifySQL.Strings = (
      'update TIPO_INVENTARIO'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRIPCION = :DESCRIPCION'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TIPO_INVENTARIO'
      '  (CODIGO, DESCRIPCION)'
      'values'
      '  (:CODIGO, :DESCRIPCION)')
    DeleteSQL.Strings = (
      'delete from TIPO_INVENTARIO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 40
    Top = 32
  end
  object tblPrecioInventario: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PRECIO_INVENTARIO'
      'where'
      '  CODIGO_TEXTO = :OLD_CODIGO_TEXTO and'
      '  FECHA_INICIAL = :OLD_FECHA_INICIAL and'
      '  FECHA_FINAL = :OLD_FECHA_FINAL')
    InsertSQL.Strings = (
      'insert into PRECIO_INVENTARIO'
      
        '  (CODIGO_TEXTO, FECHA_INICIAL, FECHA_FINAL, OBSERVACION, PRECIO' +
        '_DISTRIBUIDOR, '
      
        '   PRECIO_UNITARIO, MARGENES, PRECIOS_EN_GENERAL, STATUS, IN_POR' +
        ', MOD_POR, '
      '   FECHA_IN, FECHA_MOD)'
      'values'
      
        '  (:CODIGO_TEXTO, :FECHA_INICIAL, :FECHA_FINAL, :OBSERVACION, :P' +
        'RECIO_DISTRIBUIDOR, '
      
        '   :PRECIO_UNITARIO, :MARGENES, :PRECIOS_EN_GENERAL, :STATUS, :I' +
        'N_POR, '
      '   :MOD_POR, :FECHA_IN, :FECHA_MOD)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_TEXTO,'
      '  FECHA_INICIAL,'
      '  FECHA_FINAL,'
      '  OBSERVACION,'
      '  PRECIO_DISTRIBUIDOR,'
      '  PRECIO_UNITARIO,'
      '  MARGENES,'
      '  PRECIOS_EN_GENERAL,'
      '  STATUS,'
      '  IN_POR,'
      '  MOD_POR,'
      '  FECHA_IN,'
      '  FECHA_MOD'
      'from PRECIO_INVENTARIO '
      'where'
      '  CODIGO_TEXTO = :CODIGO_TEXTO and'
      '  FECHA_INICIAL = :FECHA_INICIAL and'
      '  FECHA_FINAL = :FECHA_FINAL')
    SelectSQL.Strings = (
      'select * from PRECIO_INVENTARIO')
    ModifySQL.Strings = (
      'update PRECIO_INVENTARIO'
      'set'
      '  CODIGO_TEXTO = :CODIGO_TEXTO,'
      '  FECHA_INICIAL = :FECHA_INICIAL,'
      '  FECHA_FINAL = :FECHA_FINAL,'
      '  OBSERVACION = :OBSERVACION,'
      '  PRECIO_DISTRIBUIDOR = :PRECIO_DISTRIBUIDOR,'
      '  PRECIO_UNITARIO = :PRECIO_UNITARIO,'
      '  MARGENES = :MARGENES,'
      '  PRECIOS_EN_GENERAL = :PRECIOS_EN_GENERAL,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  FECHA_MOD = :FECHA_MOD'
      'where'
      '  CODIGO_TEXTO = :OLD_CODIGO_TEXTO and'
      '  FECHA_INICIAL = :OLD_FECHA_INICIAL and'
      '  FECHA_FINAL = :OLD_FECHA_FINAL')
    Left = 112
    Top = 176
    object tblPrecioInventarioCODIGO_TEXTO: TIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_TEXTO'
      Origin = 'PRECIO_INVENTARIO.CODIGO_TEXTO'
      Required = True
      Size = 12
    end
    object tblPrecioInventarioFECHA_INICIAL: TDateTimeField
      DisplayLabel = 'FechaInicial'
      FieldName = 'FECHA_INICIAL'
      Origin = 'PRECIO_INVENTARIO.FECHA_INICIAL'
      Required = True
    end
    object tblPrecioInventarioFECHA_FINAL: TDateTimeField
      DisplayLabel = 'FechaFinal'
      FieldName = 'FECHA_FINAL'
      Origin = 'PRECIO_INVENTARIO.FECHA_FINAL'
      Required = True
    end
    object tblPrecioInventarioOBSERVACION: TIBStringField
      DisplayLabel = 'Observacion'
      FieldName = 'OBSERVACION'
      Origin = 'PRECIO_INVENTARIO.OBSERVACION'
      Size = 40
    end
    object tblPrecioInventarioPRECIO_DISTRIBUIDOR: TFloatField
      DisplayLabel = 'Precio Distribuidor'
      FieldName = 'PRECIO_DISTRIBUIDOR'
      Origin = 'PRECIO_INVENTARIO.PRECIO_DISTRIBUIDOR'
    end
    object tblPrecioInventarioPRECIO_UNITARIO: TFloatField
      DisplayLabel = 'PrecioUnitario'
      FieldName = 'PRECIO_UNITARIO'
      Origin = 'PRECIO_INVENTARIO.PRECIO_UNITARIO'
    end
    object tblPrecioInventarioMARGENES: TFloatField
      DisplayLabel = 'Margenes'
      FieldName = 'MARGENES'
      Origin = 'PRECIO_INVENTARIO.MARGENES'
    end
    object tblPrecioInventarioPRECIOS_EN_GENERAL: TFloatField
      DisplayLabel = 'PrecioEnGeneral'
      FieldName = 'PRECIOS_EN_GENERAL'
      Origin = 'PRECIO_INVENTARIO.PRECIOS_EN_GENERAL'
    end
    object tblPrecioInventarioSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'PRECIO_INVENTARIO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblPrecioInventarioIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PRECIO_INVENTARIO.IN_POR'
      Size = 12
    end
    object tblPrecioInventarioMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PRECIO_INVENTARIO.MOD_POR'
      Size = 12
    end
    object tblPrecioInventarioFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PRECIO_INVENTARIO.FECHA_IN'
    end
    object tblPrecioInventarioFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PRECIO_INVENTARIO.FECHA_MOD'
    end
  end
  object qryPrecioInventario: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select CODIGO_TEXTO, FECHA_FINAL, FECHA_INICIAL, PRECIO_DISTRIBU' +
        'IDOR from PRECIO_INVENTARIO'
      
        'Where  fecha_final >= :fechainicial  and (fecha_inicial <= :fech' +
        'afinal)')
    Left = 352
    Top = 248
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'fechainicial'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechafinal'
        ParamType = ptInput
      end>
    object qryPrecioInventarioCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'PRECIO_INVENTARIO.CODIGO_TEXTO'
      Required = True
      Size = 40
    end
    object qryPrecioInventarioFECHA_FINAL: TDateTimeField
      FieldName = 'FECHA_FINAL'
      Origin = 'PRECIO_INVENTARIO.FECHA_FINAL'
      Required = True
    end
    object qryPrecioInventarioFECHA_INICIAL: TDateTimeField
      FieldName = 'FECHA_INICIAL'
      Origin = 'PRECIO_INVENTARIO.FECHA_INICIAL'
      Required = True
    end
    object qryPrecioInventarioPRECIO_DISTRIBUIDOR: TFloatField
      FieldName = 'PRECIO_DISTRIBUIDOR'
      Origin = 'PRECIO_INVENTARIO.PRECIO_DISTRIBUIDOR'
    end
  end
  object stpProcInsCostoProd: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INSCOSTO_PRODUCTO'
    Left = 112
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGOPROVEEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_ARTICULO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_ULT_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO_CONDUCE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PRECIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_USUARIO'
        ParamType = ptInput
      end>
  end
  object qryProveedores: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from PROVEEDORES'
      'order by descripcion')
    Left = 288
    Top = 312
    object qryProveedoresCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROVEEDORES.CODIGO_CTE'
      Required = True
    end
    object qryProveedoresTIPO_CLIENTE: TIntegerField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'PROVEEDORES.TIPO_CLIENTE'
    end
    object qryProveedoresDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 40
    end
    object qryProveedoresCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'PROVEEDORES.CONTACTO'
      Size = 35
    end
    object qryProveedoresPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PROVEEDORES.PAIS'
      Size = 30
    end
    object qryProveedoresESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'PROVEEDORES.ESTADO'
      Size = 30
    end
    object qryProveedoresCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROVEEDORES.CIUDAD'
    end
    object qryProveedoresCALYYNUM: TIBStringField
      FieldName = 'CALYYNUM'
      Origin = 'PROVEEDORES.CALYYNUM'
      Size = 35
    end
    object qryProveedoresTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object qryProveedoresFAX: TIBStringField
      FieldName = 'FAX'
      Origin = 'PROVEEDORES.FAX'
      Size = 12
    end
    object qryProveedoresCODIGOPOSTAL: TIBStringField
      FieldName = 'CODIGOPOSTAL'
      Origin = 'PROVEEDORES.CODIGOPOSTAL'
      FixedChar = True
      Size = 6
    end
    object qryProveedoresEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'PROVEEDORES.EMAIL'
      Size = 40
    end
    object qryProveedoresDIRECCIONWEB: TIBStringField
      FieldName = 'DIRECCIONWEB'
      Origin = 'PROVEEDORES.DIRECCIONWEB'
      Size = 40
    end
    object qryProveedoresSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PROVEEDORES.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryProveedoresFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PROVEEDORES.FECHA_IN'
    end
    object qryProveedoresIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PROVEEDORES.IN_POR'
      Size = 12
    end
    object qryProveedoresFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PROVEEDORES.FECHA_MOD'
    end
    object qryProveedoresMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PROVEEDORES.MOD_POR'
      Size = 12
    end
  end
  object dsqryProveedores: TDataSource
    DataSet = qryProveedores
    Left = 336
    Top = 344
  end
  object qryPrecioCompraArti: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    OnCalcFields = qryPrecioCompraArtiCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Xfecha_ult_pedido fecha_ult_pedido, Xprecio precio'
      'FROM PROC_BUSCARCODPROV (:codarticulo,0)')
    Left = 48
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codarticulo'
        ParamType = ptInput
      end>
    object qryPrecioCompraArtiPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'COSTO_PRODUCTO.PRECIO'
    end
    object qryPrecioCompraArtiMargen: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Margen'
      DisplayFormat = '%,0'
      Calculated = True
    end
  end
  object dsqryPrecioCompraArti: TDataSource
    DataSet = qryPrecioCompraArti
    Left = 56
    Top = 368
  end
  object stpProcActBlcProvCxp: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_ACT_BALANCE_PROV_CXP'
    Left = 208
    Top = 295
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO_CTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'XTIPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ORIGEN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'MONTO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHATRN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMEROTRN'
        ParamType = ptInput
      end>
  end
  object tblInventarioSERIE: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from INVENTARIO_SERIE'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into INVENTARIO_SERIE'
      '  (CODIGO, SERIE, STATUS)'
      'values'
      '  (:CODIGO, :SERIE, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  SERIE,'
      '  STATUS'
      'from INVENTARIO_SERIE '
      'where'
      '  CODIGO = :CODIGO and'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'SELECT * FROM INVENTARIO_SERIE'
      'WHERE codigo=:codigo')
    ModifySQL.Strings = (
      'update INVENTARIO_SERIE'
      'set'
      '  CODIGO = :CODIGO,'
      '  SERIE = :SERIE,'
      '  STATUS = :STATUS'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  SERIE = :OLD_SERIE')
    Left = 440
    Top = 32
    object tblInventarioSERIECODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_SERIE.CODIGO'
      Required = True
    end
    object tblInventarioSERIESERIE: TIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'INVENTARIO_SERIE.SERIE'
      Required = True
      Size = 50
    end
    object tblInventarioSERIESTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'INVENTARIO_SERIE.STATUS'
      Size = 1
    end
  end
  object dstblInventarioSERIE: TDataSource
    DataSet = tblInventarioSERIE
    Left = 440
    Top = 80
  end
  object IBDataSet1: TIBDataSet
    BufferChunks = 1000
    CachedUpdates = False
    Left = 392
    Top = 296
  end
  object qryRepInvVencimiento: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *   '
      'From INVENTARIO_PRODUCTO'
      'WHERE FECHA_VENCIMIENTO <= :FECHA')
    Left = 400
    Top = 360
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end>
    object qryRepInvVencimientoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryRepInvVencimientoCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryRepInvVencimientoFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'INVENTARIO_PRODUCTO.FECHA'
    end
    object qryRepInvVencimientoCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
    object qryRepInvVencimientoTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object qryRepInvVencimientoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryRepInvVencimientoCANTIDAD_REORDEN: TIntegerField
      FieldName = 'CANTIDAD_REORDEN'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD_REORDEN'
    end
    object qryRepInvVencimientoPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ANT'
    end
    object qryRepInvVencimientoCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryRepInvVencimientoPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryRepInvVencimientoBLCE_CANT_ENTRADA: TFloatField
      FieldName = 'BLCE_CANT_ENTRADA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_ENTRADA'
    end
    object qryRepInvVencimientoBLCE_CANT_SALIDA: TFloatField
      FieldName = 'BLCE_CANT_SALIDA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_SALIDA'
    end
    object qryRepInvVencimientoFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN'
    end
    object qryRepInvVencimientoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INVENTARIO_PRODUCTO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepInvVencimientoPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'INVENTARIO_PRODUCTO.PORC_DESCUENTO'
    end
    object qryRepInvVencimientoFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'INVENTARIO_PRODUCTO.FOTO'
      Size = 8
    end
    object qryRepInvVencimientoPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
    end
    object qryRepInvVencimientoCODIGO_PRECIO: TIBStringField
      FieldName = 'CODIGO_PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_PRECIO'
      FixedChar = True
      Size = 6
    end
    object qryRepInvVencimientoUNIDAD: TFloatField
      FieldName = 'UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.UNIDAD'
    end
    object qryRepInvVencimientoPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryRepInvVencimientoPRECIO_MINIMO: TFloatField
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
    object qryRepInvVencimientoREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object qryRepInvVencimientoFECHA_VENCIMIENTO: TDateTimeField
      FieldName = 'FECHA_VENCIMIENTO'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_VENCIMIENTO'
    end
  end
  object qryLote: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select FECHA_VENCIMIENTO,'
      '(CANT_IN - CANT_OUT) CANT,'
      'LOTE_NUM'
      'FROM LOTE'
      'WHERE (CANT_IN - CANT_OUT)  > 0'
      'AND CODIGO=:CODIGO'
      'ORDER BY FECHA_VENCIMIENTO')
    Left = 40
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    object qryLoteLOTE_NUM: TIBStringField
      DisplayLabel = 'Lote Num'
      FieldName = 'LOTE_NUM'
      Origin = 'LOTE.LOTE_NUM'
      Required = True
      Size = 25
    end
    object qryLoteFECHA_VENCIMIENTO: TDateTimeField
      DisplayLabel = 'Fecha Vence'
      FieldName = 'FECHA_VENCIMIENTO'
      Origin = 'LOTE.FECHA_VENCIMIENTO'
    end
    object qryLoteCANT: TIntegerField
      DisplayLabel = 'CantDisp'
      FieldName = 'CANT'
    end
  end
  object qryRepProdVence: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT p.*,  i.precio FROM '
      'PROC_DATOS_REP_INV_VENCE P, '
      'INVENTARIO_PRODUCTO i'
      'Where i.CODIGO = P.CODIGO')
    OnFilterRecord = qryRepProdVenceFilterRecord
    Left = 472
    Top = 248
    object qryRepProdVenceCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Origin = 'PROC_DATOS_REP_INV_VENCE.CODIGO'
    end
    object qryRepProdVenceLOTE_NUM: TIBStringField
      DisplayLabel = 'Lote Num'
      FieldName = 'LOTE_NUM'
      Origin = 'PROC_DATOS_REP_INV_VENCE.LOTE_NUM'
      Size = 25
    end
    object qryRepProdVenceCODIGO_PROV: TIntegerField
      DisplayLabel = 'CodProv'
      FieldName = 'CODIGO_PROV'
      Origin = 'PROC_DATOS_REP_INV_VENCE.CODIGO_PROV'
    end
    object qryRepProdVenceCANT_IN: TIntegerField
      DisplayLabel = 'Cant In'
      FieldName = 'CANT_IN'
      Origin = 'PROC_DATOS_REP_INV_VENCE.CANT_IN'
    end
    object qryRepProdVenceCANT_OUT: TIntegerField
      DisplayLabel = 'Cant Out'
      FieldName = 'CANT_OUT'
      Origin = 'PROC_DATOS_REP_INV_VENCE.CANT_OUT'
    end
    object qryRepProdVenceFECHA_VENCIMIENTO: TDateTimeField
      DisplayLabel = 'Fecha Vence'
      FieldName = 'FECHA_VENCIMIENTO'
      Origin = 'PROC_DATOS_REP_INV_VENCE.FECHA_VENCIMIENTO'
    end
    object qryRepProdVenceNOMBRE_PROVEEDOR: TIBStringField
      DisplayLabel = 'Proveedor'
      FieldName = 'NOMBRE_PROVEEDOR'
      Origin = 'PROC_DATOS_REP_INV_VENCE.NOMBRE_PROVEEDOR'
      Size = 40
    end
    object qryRepProdVenceDESCRIPCION_PRODUCTO: TIBStringField
      DisplayLabel = 'Producto'
      FieldName = 'DESCRIPCION_PRODUCTO'
      Origin = 'PROC_DATOS_REP_INV_VENCE.DESCRIPCION_PRODUCTO'
      Size = 40
    end
    object qryRepProdVenceCODIGO_TEXTO: TIBStringField
      DisplayLabel = 'CodigoBarra'
      FieldName = 'CODIGO_TEXTO'
      Origin = 'PROC_DATOS_REP_INV_VENCE.CODIGO_TEXTO'
      Size = 40
    end
    object qryRepProdVenceDIASPORVENCER: TIntegerField
      DisplayLabel = 'Dias x Vencer'
      FieldName = 'DIASPORVENCER'
      Origin = 'PROC_DATOS_REP_INV_VENCE.DIASPORVENCER'
    end
    object qryRepProdVenceDIASVENCIDOS: TIntegerField
      DisplayLabel = 'Dias Vencidos'
      FieldName = 'DIASVENCIDOS'
      Origin = 'PROC_DATOS_REP_INV_VENCE.DIASVENCIDOS'
    end
    object qryRepProdVencePRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
  end
  object qryXVencer: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT p.*,  i.precio FROM '
      'PROC_DATOS_REP_INV_VENCE P, '
      'INVENTARIO_PRODUCTO i'
      'Where i.CODIGO = P.CODIGO'
      'and DIASPORVENCER >=:diasporvencer')
    OnFilterRecord = qryRepProdVenceFilterRecord
    Left = 472
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'diasporvencer'
        ParamType = ptInput
      end>
  end
  object qryVencido: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT p.*,  i.precio FROM '
      'PROC_DATOS_REP_INV_VENCE P, '
      'INVENTARIO_PRODUCTO i'
      'Where i.CODIGO = P.CODIGO'
      'and DIASVENCIDOS >=:DIASVENCIDOS')
    OnFilterRecord = qryRepProdVenceFilterRecord
    Left = 480
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DIASVENCIDOS'
        ParamType = ptUnknown
      end>
  end
  object qryTodo: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT p.*,  i.precio FROM '
      'PROC_DATOS_REP_INV_VENCE P, '
      'INVENTARIO_PRODUCTO i'
      'Where i.CODIGO = P.CODIGO')
    OnFilterRecord = qryRepProdVenceFilterRecord
    Left = 496
    Top = 192
  end
  object tblClasifPrecio: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CLASIF_PRECIO'
      'where'
      '  COD_PRODUCTO = :OLD_COD_PRODUCTO and'
      '  PRECIO_ID = :OLD_PRECIO_ID')
    InsertSQL.Strings = (
      'insert into CLASIF_PRECIO'
      
        '  (COD_PRODUCTO, PRECIO_ID, PRECIO_VENTA, COD_USUARIO, STATUS, I' +
        'N_POR, '
      '   FECHA_IN, MOD_POR, FECHA_MOD)'
      'values'
      
        '  (:COD_PRODUCTO, :PRECIO_ID, :PRECIO_VENTA, :COD_USUARIO, :STAT' +
        'US, :IN_POR, '
      '   :FECHA_IN, :MOD_POR, :FECHA_MOD)')
    RefreshSQL.Strings = (
      'Select '
      '  COD_PRODUCTO,'
      '  PRECIO_ID,'
      '  PRECIO_VENTA,'
      '  COD_USUARIO,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD'
      'from CLASIF_PRECIO '
      'where'
      '  COD_PRODUCTO = :COD_PRODUCTO and'
      '  PRECIO_ID = :PRECIO_ID')
    SelectSQL.Strings = (
      'Select * From CLASIF_PRECIO')
    ModifySQL.Strings = (
      'update CLASIF_PRECIO'
      'set'
      '  COD_PRODUCTO = :COD_PRODUCTO,'
      '  PRECIO_ID = :PRECIO_ID,'
      '  PRECIO_VENTA = :PRECIO_VENTA,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD'
      'where'
      '  COD_PRODUCTO = :OLD_COD_PRODUCTO and'
      '  PRECIO_ID = :OLD_PRECIO_ID')
    Left = 240
    Top = 16
    object tblClasifPrecioCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'CLASIF_PRECIO.COD_PRODUCTO'
      Required = True
    end
    object tblClasifPrecioPRECIO_ID: TIntegerField
      FieldName = 'PRECIO_ID'
      Origin = 'CLASIF_PRECIO.PRECIO_ID'
      Required = True
    end
    object tblClasifPrecioPRECIO_VENTA: TFloatField
      FieldName = 'PRECIO_VENTA'
      Origin = 'CLASIF_PRECIO.PRECIO_VENTA'
    end
    object tblClasifPrecioCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'CLASIF_PRECIO.COD_USUARIO'
    end
    object tblClasifPrecioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CLASIF_PRECIO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblClasifPrecioIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'CLASIF_PRECIO.IN_POR'
      Size = 12
    end
    object tblClasifPrecioFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CLASIF_PRECIO.FECHA_IN'
    end
    object tblClasifPrecioMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'CLASIF_PRECIO.MOD_POR'
      Size = 12
    end
    object tblClasifPrecioFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CLASIF_PRECIO.FECHA_MOD'
    end
  end
  object tblUnidades: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    TableName = 'UNIDADES'
    Left = 232
    Top = 72
    object tblUnidadesIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
    end
    object tblUnidadesCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object tblUnidadesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
  end
  object dstblUnidades: TDataSource
    DataSet = tblUnidades
    Left = 232
    Top = 128
  end
  object tblReparacionesMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblReparacionesMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from REPARACIONES_MASTER'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into REPARACIONES_MASTER'
      '  (NUMERO, TIPO_TRN, COD_PROVEEDOR, FECHA, OBSERVACION, STATUS)'
      'values'
      
        '  (:NUMERO, :TIPO_TRN, :COD_PROVEEDOR, :FECHA, :OBSERVACION, :ST' +
        'ATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  TIPO_TRN,'
      '  COD_PROVEEDOR,'
      '  FECHA,'
      '  OBSERVACION,'
      '  STATUS'
      'from REPARACIONES_MASTER '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select * From REPARACIONES_MASTER'
      'Where numero=:numero')
    ModifySQL.Strings = (
      'update REPARACIONES_MASTER'
      'set'
      '  NUMERO = :NUMERO,'
      '  TIPO_TRN = :TIPO_TRN,'
      '  COD_PROVEEDOR = :COD_PROVEEDOR,'
      '  FECHA = :FECHA,'
      '  OBSERVACION = :OBSERVACION,'
      '  STATUS = :STATUS'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_SERIE_REP_MASTER'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 160
    Top = 200
    object tblReparacionesMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'REPARACIONES_MASTER.NUMERO'
      Required = True
    end
    object tblReparacionesMasterTIPO_TRN: TIntegerField
      FieldName = 'TIPO_TRN'
      Origin = 'REPARACIONES_MASTER.TIPO_TRN'
      Required = True
    end
    object tblReparacionesMasterCOD_PROVEEDOR: TIntegerField
      FieldName = 'COD_PROVEEDOR'
      Origin = 'REPARACIONES_MASTER.COD_PROVEEDOR'
      Required = True
    end
    object tblReparacionesMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'REPARACIONES_MASTER.FECHA'
    end
    object tblReparacionesMasterOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'REPARACIONES_MASTER.OBSERVACION'
      Size = 100
    end
    object tblReparacionesMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'REPARACIONES_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object tblReparacionesDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from REPARACIONES_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into REPARACIONES_DET'
      
        '  (SERIE, NUMERO, COD_PRODUCTO, COD_USUARIO, MONTO_SERVICIO, INS' +
        'ERTADO_POR, '
      '   FECHA_IN, STATUS, DESCRIPCIONPROBLEMA)'
      'values'
      
        '  (:SERIE, :NUMERO, :COD_PRODUCTO, :COD_USUARIO, :MONTO_SERVICIO' +
        ', :INSERTADO_POR, '
      '   :FECHA_IN, :STATUS, :DESCRIPCIONPROBLEMA)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  COD_PRODUCTO,'
      '  COD_USUARIO,'
      '  MONTO_SERVICIO,'
      '  INSERTADO_POR,'
      '  FECHA_IN,'
      '  STATUS,'
      '  DESCRIPCIONPROBLEMA'
      'from REPARACIONES_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * From REPARACIONES_DET'
      'Where numero=:numero')
    ModifySQL.Strings = (
      'update REPARACIONES_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  COD_PRODUCTO = :COD_PRODUCTO,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  MONTO_SERVICIO = :MONTO_SERVICIO,'
      '  INSERTADO_POR = :INSERTADO_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  STATUS = :STATUS,'
      '  DESCRIPCIONPROBLEMA = :DESCRIPCIONPROBLEMA'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_REP_DET'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 192
    Top = 248
    object tblReparacionesDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'REPARACIONES_DET.SERIE'
      Required = True
    end
    object tblReparacionesDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'REPARACIONES_DET.NUMERO'
      Required = True
    end
    object tblReparacionesDetCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'REPARACIONES_DET.COD_PRODUCTO'
      Required = True
    end
    object tblReparacionesDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'REPARACIONES_DET.COD_USUARIO'
    end
    object tblReparacionesDetMONTO_SERVICIO: TFloatField
      FieldName = 'MONTO_SERVICIO'
      Origin = 'REPARACIONES_DET.MONTO_SERVICIO'
    end
    object tblReparacionesDetINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'REPARACIONES_DET.INSERTADO_POR'
      Size = 12
    end
    object tblReparacionesDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'REPARACIONES_DET.FECHA_IN'
    end
    object tblReparacionesDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'REPARACIONES_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblReparacionesDetDESCRIPCIONPROBLEMA: TMemoField
      FieldName = 'DESCRIPCIONPROBLEMA'
      Origin = 'REPARACIONES_DET.DESCRIPCIONPROBLEMA'
      BlobType = ftMemo
      Size = 8
    end
  end
  object dstblReparacionesMaster: TDataSource
    DataSet = tblReparacionesMaster
    Left = 256
    Top = 192
  end
  object dstblReparacionesDet: TDataSource
    AutoEdit = False
    DataSet = tblReparacionesDet
    Left = 248
    Top = 232
  end
  object tblTipoTrn: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_TRN'
    Left = 528
    Top = 88
  end
  object dstblTipoTrn: TDataSource
    DataSet = tblTipoTrn
    Left = 504
    Top = 136
  end
  object qryRepRepMaster: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepRepMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT REPARACIONES_MASTER.NUMERO,'
      '       REPARACIONES_MASTER.TIPO_TRN,'
      '       REPARACIONES_MASTER.COD_PROVEEDOR,'
      '       REPARACIONES_MASTER.FECHA,'
      '       REPARACIONES_MASTER.OBSERVACION,'
      '       REPARACIONES_MASTER.STATUS,'
      '       PROVEEDORES.DESCRIPCION,'
      '       PROVEEDORES.TELEFONO,'
      '       PROVEEDORES.CALYYNUM,'
      '       PROVEEDORES.CIUDAD,'
      '       PROVEEDORES.PAIS,'
      '       PROVEEDORES.CONTACTO,'
      '       TIPO_TRN.DESCRIPCION TIPO_TRNDESC'
      'FROM TIPO_TRN'
      
        '   INNER JOIN REPARACIONES_MASTER ON (TIPO_TRN.CODIGO = REPARACI' +
        'ONES_MASTER.TIPO_TRN)'
      
        '   INNER JOIN PROVEEDORES ON (REPARACIONES_MASTER.COD_PROVEEDOR ' +
        '= PROVEEDORES.CODIGO_CTE)'
      'WHERE REPARACIONES_MASTER.NUMERO =:numero')
    Left = 144
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryRepRepMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'REPARACIONES_MASTER.NUMERO'
      Required = True
    end
    object qryRepRepMasterTIPO_TRN: TIntegerField
      FieldName = 'TIPO_TRN'
      Origin = 'REPARACIONES_MASTER.TIPO_TRN'
      Required = True
    end
    object qryRepRepMasterCOD_PROVEEDOR: TIntegerField
      FieldName = 'COD_PROVEEDOR'
      Origin = 'REPARACIONES_MASTER.COD_PROVEEDOR'
      Required = True
    end
    object qryRepRepMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'REPARACIONES_MASTER.FECHA'
    end
    object qryRepRepMasterOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'REPARACIONES_MASTER.OBSERVACION'
      Size = 100
    end
    object qryRepRepMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'REPARACIONES_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepRepMasterDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 40
    end
    object qryRepRepMasterTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object qryRepRepMasterCALYYNUM: TIBStringField
      FieldName = 'CALYYNUM'
      Origin = 'PROVEEDORES.CALYYNUM'
      Size = 35
    end
    object qryRepRepMasterCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROVEEDORES.CIUDAD'
    end
    object qryRepRepMasterPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PROVEEDORES.PAIS'
      Size = 30
    end
    object qryRepRepMasterCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'PROVEEDORES.CONTACTO'
      Size = 35
    end
    object qryRepRepMasterTIPO_TRNDESC: TIBStringField
      FieldName = 'TIPO_TRNDESC'
      Origin = 'TIPO_TRN.DESCRIPCION'
      Size = 30
    end
  end
  object qryRepRepMasterDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from REPARACIONES_DET'
      'where numero=:numero')
    Left = 240
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryRepRepMasterDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'REPARACIONES_DET.SERIE'
      Required = True
    end
    object qryRepRepMasterDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'REPARACIONES_DET.NUMERO'
      Required = True
    end
    object qryRepRepMasterDetCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'REPARACIONES_DET.COD_PRODUCTO'
      Required = True
    end
    object qryRepRepMasterDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'REPARACIONES_DET.COD_USUARIO'
    end
    object qryRepRepMasterDetMONTO_SERVICIO: TFloatField
      FieldName = 'MONTO_SERVICIO'
      Origin = 'REPARACIONES_DET.MONTO_SERVICIO'
    end
    object qryRepRepMasterDetINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'REPARACIONES_DET.INSERTADO_POR'
      Size = 12
    end
    object qryRepRepMasterDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'REPARACIONES_DET.FECHA_IN'
    end
    object qryRepRepMasterDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'REPARACIONES_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepRepMasterDetDESCRIPCIONPROBLEMA: TMemoField
      FieldName = 'DESCRIPCIONPROBLEMA'
      Origin = 'REPARACIONES_DET.DESCRIPCIONPROBLEMA'
      BlobType = ftMemo
      Size = 8
    end
  end
end
