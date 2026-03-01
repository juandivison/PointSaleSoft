object dmPanaderia: TdmPanaderia
  OldCreateOrder = False
  Left = 290
  Top = 66
  Height = 574
  Width = 948
  object tblPanReceta: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblPanRecetaAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from Pan_Receta_mast'
      'where'
      '  ID_RECETA = :OLD_ID_RECETA')
    InsertSQL.Strings = (
      'insert into Pan_Receta_mast'
      
        '  (ID_RECETA, FECHA, DESC_PRODUCTO, STATUS, FECHA_IN, IN_POR, CO' +
        'D_USUARIO)'
      'values'
      
        '  (:ID_RECETA, :FECHA, :DESC_PRODUCTO, :STATUS, :FECHA_IN, :IN_P' +
        'OR, :COD_USUARIO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_RECETA,'
      '  FECHA,'
      '  DESC_PRODUCTO,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  COD_USUARIO'
      'from Pan_Receta_mast '
      'where'
      '  ID_RECETA = :ID_RECETA')
    SelectSQL.Strings = (
      'Select * From Pan_Receta_mast')
    ModifySQL.Strings = (
      'update Pan_Receta_mast'
      'set'
      '  ID_RECETA = :ID_RECETA,'
      '  FECHA = :FECHA,'
      '  DESC_PRODUCTO = :DESC_PRODUCTO,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  COD_USUARIO = :COD_USUARIO'
      'where'
      '  ID_RECETA = :OLD_ID_RECETA')
    Left = 40
    Top = 8
    object tblPanRecetaID_RECETA: TIntegerField
      DisplayLabel = 'IdReceta'
      FieldName = 'ID_RECETA'
      Origin = 'PAN_RECETA_MAST.ID_RECETA'
      Required = True
    end
    object tblPanRecetaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'PAN_RECETA_MAST.FECHA'
    end
    object tblPanRecetaDESC_PRODUCTO: TIBStringField
      DisplayLabel = 'Descripcion Receta'
      FieldName = 'DESC_PRODUCTO'
      Origin = 'PAN_RECETA_MAST.DESC_PRODUCTO'
      Size = 60
    end
    object tblPanRecetaSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'PAN_RECETA_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblPanRecetaFECHA_IN: TDateTimeField
      DisplayLabel = 'FechaInsertado'
      FieldName = 'FECHA_IN'
      Origin = 'PAN_RECETA_MAST.FECHA_IN'
    end
    object tblPanRecetaIN_POR: TIBStringField
      DisplayLabel = 'Insertado Por'
      FieldName = 'IN_POR'
      Origin = 'PAN_RECETA_MAST.IN_POR'
      Size = 12
    end
    object tblPanRecetaCOD_USUARIO: TIntegerField
      DisplayLabel = 'CodUsuario'
      FieldName = 'COD_USUARIO'
      Origin = 'PAN_RECETA_MAST.COD_USUARIO'
    end
  end
  object tblPanRendimiento: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PAN_RENDIMIENTO'
      'where'
      '  ID_RENDIMIENTO = :OLD_ID_RENDIMIENTO')
    InsertSQL.Strings = (
      'insert into PAN_RENDIMIENTO'
      
        '  (ID_RENDIMIENTO, ID_REQUISICION, CANTIDAD, TIPO_UNIDAD, STATUS' +
        ', CODIGO_PROD, '
      '   OBSERVACION)'
      'values'
      
        '  (:ID_RENDIMIENTO, :ID_REQUISICION, :CANTIDAD, :TIPO_UNIDAD, :S' +
        'TATUS, '
      '   :CODIGO_PROD, :OBSERVACION)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_RENDIMIENTO,'
      '  ID_REQUISICION,'
      '  CANTIDAD,'
      '  TIPO_UNIDAD,'
      '  STATUS,'
      '  CODIGO_PROD,'
      '  OBSERVACION'
      'from PAN_RENDIMIENTO '
      'where'
      '  ID_RENDIMIENTO = :ID_RENDIMIENTO')
    SelectSQL.Strings = (
      'Select *  From PAN_RENDIMIENTO'
      'Where ID_REQUISICION=:idrequisicion')
    ModifySQL.Strings = (
      'update PAN_RENDIMIENTO'
      'set'
      '  ID_RENDIMIENTO = :ID_RENDIMIENTO,'
      '  ID_REQUISICION = :ID_REQUISICION,'
      '  CANTIDAD = :CANTIDAD,'
      '  TIPO_UNIDAD = :TIPO_UNIDAD,'
      '  STATUS = :STATUS,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  OBSERVACION = :OBSERVACION'
      'where'
      '  ID_RENDIMIENTO = :OLD_ID_RENDIMIENTO')
    Left = 40
    Top = 104
    object tblPanRendimientoID_RENDIMIENTO: TIntegerField
      DisplayLabel = 'IdRendimiento'
      FieldName = 'ID_RENDIMIENTO'
      Origin = 'PAN_RENDIMIENTO.ID_RENDIMIENTO'
      Required = True
    end
    object tblPanRendimientoID_REQUISICION: TIntegerField
      DisplayLabel = 'IdRequisicion'
      FieldName = 'ID_REQUISICION'
      Origin = 'PAN_RENDIMIENTO.ID_REQUISICION'
      Required = True
    end
    object tblPanRendimientoCODIGO_PROD: TIntegerField
      DisplayLabel = 'CodProd'
      FieldName = 'CODIGO_PROD'
      Origin = 'PAN_RENDIMIENTO.CODIGO_PROD'
    end
    object tblPanRendimientoCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
      Origin = 'PAN_RENDIMIENTO.CANTIDAD'
    end
    object tblPanRendimientoTIPO_UNIDAD: TIntegerField
      DisplayLabel = 'TipoUnidad'
      FieldName = 'TIPO_UNIDAD'
      Origin = 'PAN_RENDIMIENTO.TIPO_UNIDAD'
    end
    object tblPanRendimientoOBSERVACION: TIBStringField
      DisplayLabel = 'Observacion'
      FieldName = 'OBSERVACION'
      Origin = 'PAN_RENDIMIENTO.OBSERVACION'
      Size = 80
    end
    object tblPanRendimientoSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'PAN_RENDIMIENTO.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object tblPanReqMateriaPMast: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblPanReqMateriaPMastAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PAN_REQ_MATERIA_PRIMA_MASTER'
      'where'
      '  ID_REQUISICION = :OLD_ID_REQUISICION')
    InsertSQL.Strings = (
      'insert into PAN_REQ_MATERIA_PRIMA_MASTER'
      
        '  (ID_REQUISICION, FECHA, ID_RECETA, CANTIDAD, COD_OPERADOR, COD' +
        '_USUARIO, '
      '   STATUS, FECHA_IN, IN_POR)'
      'values'
      
        '  (:ID_REQUISICION, :FECHA, :ID_RECETA, :CANTIDAD, :COD_OPERADOR' +
        ', :COD_USUARIO, '
      '   :STATUS, :FECHA_IN, :IN_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_REQUISICION,'
      '  FECHA,'
      '  ID_RECETA,'
      '  CANTIDAD,'
      '  COD_OPERADOR,'
      '  COD_USUARIO,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR'
      'from PAN_REQ_MATERIA_PRIMA_MASTER '
      'where'
      '  ID_REQUISICION = :ID_REQUISICION')
    SelectSQL.Strings = (
      'Select  * From PAN_REQ_MATERIA_PRIMA_MASTER'
      'Where Fecha between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update PAN_REQ_MATERIA_PRIMA_MASTER'
      'set'
      '  ID_REQUISICION = :ID_REQUISICION,'
      '  FECHA = :FECHA,'
      '  ID_RECETA = :ID_RECETA,'
      '  CANTIDAD = :CANTIDAD,'
      '  COD_OPERADOR = :COD_OPERADOR,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR'
      'where'
      '  ID_REQUISICION = :OLD_ID_REQUISICION')
    Left = 280
    Top = 16
    object tblPanReqMateriaPMastID_REQUISICION: TIntegerField
      DisplayLabel = 'IdRequisicion'
      FieldName = 'ID_REQUISICION'
      Origin = 'PAN_REQ_MATERIA_PRIMA_MASTER.ID_REQUISICION'
      Required = True
    end
    object tblPanReqMateriaPMastFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'PAN_REQ_MATERIA_PRIMA_MASTER.FECHA'
    end
    object tblPanReqMateriaPMastID_RECETA: TIntegerField
      DisplayLabel = 'IdReceta'
      FieldName = 'ID_RECETA'
      Origin = 'PAN_REQ_MATERIA_PRIMA_MASTER.ID_RECETA'
    end
    object tblPanReqMateriaPMastCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
      Origin = 'PAN_REQ_MATERIA_PRIMA_MASTER.CANTIDAD'
    end
    object tblPanReqMateriaPMastCOD_OPERADOR: TIntegerField
      DisplayLabel = 'CodOperador'
      FieldName = 'COD_OPERADOR'
      Origin = 'PAN_REQ_MATERIA_PRIMA_MASTER.COD_OPERADOR'
    end
    object tblPanReqMateriaPMastCOD_USUARIO: TIntegerField
      DisplayLabel = 'CodUsuario'
      FieldName = 'COD_USUARIO'
      Origin = 'PAN_REQ_MATERIA_PRIMA_MASTER.COD_USUARIO'
    end
    object tblPanReqMateriaPMastSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'PAN_REQ_MATERIA_PRIMA_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblPanReqMateriaPMastFECHA_IN: TDateTimeField
      DisplayLabel = 'Fecha Insertado'
      FieldName = 'FECHA_IN'
      Origin = 'PAN_REQ_MATERIA_PRIMA_MASTER.FECHA_IN'
    end
    object tblPanReqMateriaPMastIN_POR: TIBStringField
      DisplayLabel = 'Insertado Por'
      FieldName = 'IN_POR'
      Origin = 'PAN_REQ_MATERIA_PRIMA_MASTER.IN_POR'
      Size = 12
    end
  end
  object tblPanReqMateriaPDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PAN_REQ_MATERIA_PRIMA_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into PAN_REQ_MATERIA_PRIMA_DET'
      
        '  (SERIE, ID_REQUISICION, CANTIDAD, PRECIO, VALOR, STATUS, FECHA' +
        '_IN, IN_POR, '
      '   CODIGO_PROD, TIPO_UNIDAD)'
      'values'
      
        '  (:SERIE, :ID_REQUISICION, :CANTIDAD, :PRECIO, :VALOR, :STATUS,' +
        ' :FECHA_IN, '
      '   :IN_POR, :CODIGO_PROD, :TIPO_UNIDAD)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  ID_REQUISICION,'
      '  CANTIDAD,'
      '  PRECIO,'
      '  VALOR,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  CODIGO_PROD,'
      '  TIPO_UNIDAD'
      'from PAN_REQ_MATERIA_PRIMA_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * From PAN_REQ_MATERIA_PRIMA_DET'
      'Where ID_REQUISICION=:idrequisicion')
    ModifySQL.Strings = (
      'update PAN_REQ_MATERIA_PRIMA_DET'
      'set'
      '  SERIE = :SERIE,'
      '  ID_REQUISICION = :ID_REQUISICION,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO = :PRECIO,'
      '  VALOR = :VALOR,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  TIPO_UNIDAD = :TIPO_UNIDAD'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 280
    Top = 72
    object tblPanReqMateriaPDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.SERIE'
      Required = True
    end
    object tblPanReqMateriaPDetID_REQUISICION: TIntegerField
      FieldName = 'ID_REQUISICION'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.ID_REQUISICION'
      Required = True
    end
    object tblPanReqMateriaPDetCODIGO_PROD: TIntegerField
      DisplayLabel = 'CodProd'
      FieldName = 'CODIGO_PROD'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.CODIGO_PROD'
    end
    object tblPanReqMateriaPDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.CANTIDAD'
    end
    object tblPanReqMateriaPDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.PRECIO'
    end
    object tblPanReqMateriaPDetVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.VALOR'
    end
    object tblPanReqMateriaPDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblPanReqMateriaPDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.FECHA_IN'
    end
    object tblPanReqMateriaPDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.IN_POR'
      Size = 12
    end
    object tblPanReqMateriaPDetTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'PAN_REQ_MATERIA_PRIMA_DET.TIPO_UNIDAD'
    end
  end
  object dstblPanReceta: TDataSource
    DataSet = tblPanReceta
    Left = 40
    Top = 56
  end
  object dstblPanReqMateriaPMast: TDataSource
    DataSet = tblPanReqMateriaPMast
    Left = 280
    Top = 136
  end
  object dstblPanRendimiento: TDataSource
    DataSet = tblPanRendimiento
    Left = 48
    Top = 160
  end
  object dstblPanReqMateriaPDet: TDataSource
    DataSet = tblPanReqMateriaPDet
    Left = 152
    Top = 184
  end
  object tblTipoUnidades: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'UNIDADES'
    Left = 136
    Top = 112
    object tblTipoUnidadesIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
    end
    object tblTipoUnidadesCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object tblTipoUnidadesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
  end
  object dstblTipoUnidades: TDataSource
    DataSet = tblTipoUnidades
    Left = 48
    Top = 216
  end
  object qryInventario: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select  * From INVENTARIO_PRODUCTO')
    Left = 48
    Top = 272
    object qryInventarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInventarioCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryInventarioFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'INVENTARIO_PRODUCTO.FECHA'
    end
    object qryInventarioCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
    object qryInventarioTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object qryInventarioDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryInventarioCANTIDAD_REORDEN: TIntegerField
      FieldName = 'CANTIDAD_REORDEN'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD_REORDEN'
    end
    object qryInventarioPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ANT'
    end
    object qryInventarioCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryInventarioPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryInventarioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INVENTARIO_PRODUCTO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryInventarioPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'INVENTARIO_PRODUCTO.PORC_DESCUENTO'
    end
    object qryInventarioPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
    end
    object qryInventarioCODIGO_PRECIO: TIBStringField
      FieldName = 'CODIGO_PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_PRECIO'
      FixedChar = True
      Size = 6
    end
    object qryInventarioUNIDAD: TFloatField
      FieldName = 'UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.UNIDAD'
    end
    object qryInventarioPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryInventarioPRECIO_MINIMO: TFloatField
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
    object qryInventarioREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object qryInventarioFECHA_VENCIMIENTO: TDateTimeField
      FieldName = 'FECHA_VENCIMIENTO'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_VENCIMIENTO'
    end
    object qryInventarioINVENTARIAR: TSmallintField
      FieldName = 'INVENTARIAR'
      Origin = 'INVENTARIO_PRODUCTO.INVENTARIAR'
    end
    object qryInventarioPRECIO_TIPO_UNIDAD: TFloatField
      FieldName = 'PRECIO_TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_TIPO_UNIDAD'
    end
    object qryInventarioTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.TIPO_UNIDAD'
    end
    object qryInventarioORIGEN: TIntegerField
      FieldName = 'ORIGEN'
      Origin = 'INVENTARIO_PRODUCTO.ORIGEN'
    end
    object qryInventarioUBICACION: TIBStringField
      FieldName = 'UBICACION'
      Origin = 'INVENTARIO_PRODUCTO.UBICACION'
      Size = 50
    end
    object qryInventarioREFERENCIA_ALTERNA: TIBStringField
      FieldName = 'REFERENCIA_ALTERNA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA_ALTERNA'
      Size = 50
    end
    object qryInventarioMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'INVENTARIO_PRODUCTO.MARCA'
      Size = 50
    end
    object qryInventarioMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'INVENTARIO_PRODUCTO.MODELO'
      Size = 50
    end
  end
  object dsqryInventario: TDataSource
    DataSet = qryInventario
    Left = 152
    Top = 240
  end
  object tblPanRecetaDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PAN_RECETA_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into PAN_RECETA_DET'
      
        '  (SERIE, ID_RECETA, CODIGO_PROD, PORCENTAJE, TIPO_UNIDAD, STATU' +
        'S, FECHA_IN, '
      '   IN_POR, COD_USUARIO)'
      'values'
      
        '  (:SERIE, :ID_RECETA, :CODIGO_PROD, :PORCENTAJE, :TIPO_UNIDAD, ' +
        ':STATUS, '
      '   :FECHA_IN, :IN_POR, :COD_USUARIO)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  ID_RECETA,'
      '  CODIGO_PROD,'
      '  PORCENTAJE,'
      '  TIPO_UNIDAD,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  COD_USUARIO'
      'from PAN_RECETA_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * From  PAN_RECETA_DET'
      'Where id_receta=:idreceta')
    ModifySQL.Strings = (
      'update PAN_RECETA_DET'
      'set'
      '  SERIE = :SERIE,'
      '  ID_RECETA = :ID_RECETA,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  PORCENTAJE = :PORCENTAJE,'
      '  TIPO_UNIDAD = :TIPO_UNIDAD,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  COD_USUARIO = :COD_USUARIO'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 144
    Top = 16
    object tblPanRecetaDetSERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'PAN_RECETA_DET.SERIE'
      Required = True
    end
    object tblPanRecetaDetID_RECETA: TIntegerField
      DisplayLabel = 'IdReceta'
      FieldName = 'ID_RECETA'
      Origin = 'PAN_RECETA_DET.ID_RECETA'
      Required = True
    end
    object tblPanRecetaDetCODIGO_PROD: TIntegerField
      DisplayLabel = 'CodProd'
      FieldName = 'CODIGO_PROD'
      Origin = 'PAN_RECETA_DET.CODIGO_PROD'
    end
    object tblPanRecetaDetPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
      Origin = 'PAN_RECETA_DET.PORCENTAJE'
    end
    object tblPanRecetaDetTIPO_UNIDAD: TIntegerField
      DisplayLabel = 'TipoUnidad'
      FieldName = 'TIPO_UNIDAD'
      Origin = 'PAN_RECETA_DET.TIPO_UNIDAD'
    end
    object tblPanRecetaDetSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'PAN_RECETA_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblPanRecetaDetFECHA_IN: TDateTimeField
      DisplayLabel = 'FechaIn'
      FieldName = 'FECHA_IN'
      Origin = 'PAN_RECETA_DET.FECHA_IN'
    end
    object tblPanRecetaDetIN_POR: TIBStringField
      DisplayLabel = 'Insertado Por'
      FieldName = 'IN_POR'
      Origin = 'PAN_RECETA_DET.IN_POR'
      Size = 12
    end
    object tblPanRecetaDetCOD_USUARIO: TIntegerField
      DisplayLabel = 'CodUsuario'
      FieldName = 'COD_USUARIO'
      Origin = 'PAN_RECETA_DET.COD_USUARIO'
    end
  end
  object dstblPanRecetaDet: TDataSource
    DataSet = tblPanRecetaDet
    Left = 144
    Top = 64
  end
  object qryDatosCalcReceta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Proc_PanDatosRequisicion(:Cant,:xidReceta)')
    Left = 392
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Cant'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'xidReceta'
        ParamType = ptInput
      end>
    object qryDatosCalcRecetaID_RECETA: TIntegerField
      DisplayLabel = 'IdReceta'
      FieldName = 'ID_RECETA'
      Origin = 'PROC_PANDATOSREQUISICION.ID_RECETA'
    end
    object qryDatosCalcRecetaCODIGO_PROD: TSmallintField
      DisplayLabel = 'CodProd'
      FieldName = 'CODIGO_PROD'
      Origin = 'PROC_PANDATOSREQUISICION.CODIGO_PROD'
    end
    object qryDatosCalcRecetaTIPO_UNIDAD: TSmallintField
      DisplayLabel = 'TipoUnidad'
      FieldName = 'TIPO_UNIDAD'
      Origin = 'PROC_PANDATOSREQUISICION.TIPO_UNIDAD'
    end
    object qryDatosCalcRecetaDESCTIPOUNIDAD: TIBStringField
      DisplayLabel = 'DescUnidad'
      FieldName = 'DESCTIPOUNIDAD'
      Origin = 'PROC_PANDATOSREQUISICION.DESCTIPOUNIDAD'
      Size = 50
    end
    object qryDatosCalcRecetaPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
      Origin = 'PROC_PANDATOSREQUISICION.PORCENTAJE'
    end
    object qryDatosCalcRecetaCANTIDAD: TFloatField
      DisplayLabel = 'Cant'
      FieldName = 'CANTIDAD'
      Origin = 'PROC_PANDATOSREQUISICION.CANTIDAD'
    end
    object qryDatosCalcRecetaPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'PROC_PANDATOSREQUISICION.PRECIO'
    end
    object qryDatosCalcRecetaDESCPRODUCTO: TIBStringField
      DisplayLabel = 'Descripcion Producto'
      FieldName = 'DESCPRODUCTO'
      Origin = 'PROC_PANDATOSREQUISICION.DESCPRODUCTO'
      Size = 40
    end
    object qryDatosCalcRecetaSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'PROC_PANDATOSREQUISICION.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dsqryRecetas: TDataSource
    DataSet = qryRecetas
    Left = 392
    Top = 136
  end
  object qryRecetas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From PAN_RECETA_MAST')
    Left = 392
    Top = 192
    object qryRecetasID_RECETA: TIntegerField
      FieldName = 'ID_RECETA'
      Origin = 'PAN_RECETA_MAST.ID_RECETA'
      Required = True
    end
    object qryRecetasFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PAN_RECETA_MAST.FECHA'
    end
    object qryRecetasDESC_PRODUCTO: TIBStringField
      FieldName = 'DESC_PRODUCTO'
      Origin = 'PAN_RECETA_MAST.DESC_PRODUCTO'
      Size = 60
    end
    object qryRecetasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PAN_RECETA_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRecetasFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PAN_RECETA_MAST.FECHA_IN'
    end
    object qryRecetasIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PAN_RECETA_MAST.IN_POR'
      Size = 12
    end
    object qryRecetasCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'PAN_RECETA_MAST.COD_USUARIO'
    end
  end
  object dsqryDatosCalcReceta: TDataSource
    DataSet = qryDatosCalcReceta
    Left = 400
    Top = 296
  end
  object ibSqlCheckIdReq: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'select  id_requisicion  from PAN_REQ_MATERIA_PRIMA_DET'
      'where id_requisicion  =:idreq')
    Transaction = dmConectar.IBTransaction1
    Left = 48
    Top = 328
  end
  object ibSql: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    Transaction = dmConectar.IBTransaction1
    Left = 152
    Top = 296
  end
  object stpMantInvAlmacen: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_MANT_INVENTARIO_ALMACEN'
    Left = 280
    Top = 185
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INVENTARIO_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODIGO_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_IN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_MOD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MOD_POR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CIAKEY'
        ParamType = ptInput
      end>
  end
  object stpProcActInvPan: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_UPDATE_INV_PAN'
    Left = 264
    Top = 249
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO_PRODUCTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NUEVACANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_UNIDAD'
        ParamType = ptInput
      end>
  end
  object tblPanProduccionMast: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblPanProduccionMastAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PAN_PRODUCCION_MAST'
      'where'
      '  ID_PRODUCCION = :OLD_ID_PRODUCCION')
    InsertSQL.Strings = (
      'insert into PAN_PRODUCCION_MAST'
      
        '  (ID_PRODUCCION, CIA_KEY, TIPO_NOMINA, FECHA_PRODUCCION, COD_EM' +
        'PLEADO, '
      '   STATUS, FECHA_IN, IN_POR)'
      'values'
      
        '  (:ID_PRODUCCION, :CIA_KEY, :TIPO_NOMINA, :FECHA_PRODUCCION, :C' +
        'OD_EMPLEADO, '
      '   :STATUS, :FECHA_IN, :IN_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PRODUCCION,'
      '  CIA_KEY,'
      '  TIPO_NOMINA,'
      '  FECHA_PRODUCCION,'
      '  COD_EMPLEADO,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR'
      'from PAN_PRODUCCION_MAST '
      'where'
      '  ID_PRODUCCION = :ID_PRODUCCION')
    SelectSQL.Strings = (
      'Select * From PAN_PRODUCCION_MAST'
      'Where fecha_produccion '
      'Between :fechaini And :fechafin')
    ModifySQL.Strings = (
      'update PAN_PRODUCCION_MAST'
      'set'
      '  ID_PRODUCCION = :ID_PRODUCCION,'
      '  CIA_KEY = :CIA_KEY,'
      '  TIPO_NOMINA = :TIPO_NOMINA,'
      '  FECHA_PRODUCCION = :FECHA_PRODUCCION,'
      '  COD_EMPLEADO = :COD_EMPLEADO,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR'
      'where'
      '  ID_PRODUCCION = :OLD_ID_PRODUCCION')
    GeneratorField.Field = 'ID_PRODUCCION'
    GeneratorField.Generator = 'GEN_SERIE_PAN_PRODM'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 400
    Top = 16
    object tblPanProduccionMastID_PRODUCCION: TIntegerField
      FieldName = 'ID_PRODUCCION'
      Origin = 'PAN_PRODUCCION_MAST.ID_PRODUCCION'
      Required = True
    end
    object tblPanProduccionMastCIA_KEY: TSmallintField
      FieldName = 'CIA_KEY'
      Origin = 'PAN_PRODUCCION_MAST.CIA_KEY'
      Required = True
    end
    object tblPanProduccionMastTIPO_NOMINA: TSmallintField
      FieldName = 'TIPO_NOMINA'
      Origin = 'PAN_PRODUCCION_MAST.TIPO_NOMINA'
    end
    object tblPanProduccionMastFECHA_PRODUCCION: TDateTimeField
      FieldName = 'FECHA_PRODUCCION'
      Origin = 'PAN_PRODUCCION_MAST.FECHA_PRODUCCION'
      Required = True
    end
    object tblPanProduccionMastCOD_EMPLEADO: TIntegerField
      FieldName = 'COD_EMPLEADO'
      Origin = 'PAN_PRODUCCION_MAST.COD_EMPLEADO'
    end
    object tblPanProduccionMastSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PAN_PRODUCCION_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblPanProduccionMastFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PAN_PRODUCCION_MAST.FECHA_IN'
    end
    object tblPanProduccionMastIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PAN_PRODUCCION_MAST.IN_POR'
      Size = 12
    end
  end
  object tblPanProduccionDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PAN_PRODUCCION_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into PAN_PRODUCCION_DET'
      
        '  (SERIE, ID_PRODUCCION, COD_EMPLEADO, FECHA, CANTIDAD, DESCRIPC' +
        'ION, STATUS, '
      '   FECHA_IN, IN_POR, PRECIO)'
      'values'
      
        '  (:SERIE, :ID_PRODUCCION, :COD_EMPLEADO, :FECHA, :CANTIDAD, :DE' +
        'SCRIPCION, '
      '   :STATUS, :FECHA_IN, :IN_POR, :PRECIO)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  ID_PRODUCCION,'
      '  COD_EMPLEADO,'
      '  FECHA,'
      '  CANTIDAD,'
      '  DESCRIPCION,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  PRECIO'
      'from PAN_PRODUCCION_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * From PAN_PRODUCCION_DET'
      'Where cod_empleado =:codempleado'
      'and fecha between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update PAN_PRODUCCION_DET'
      'set'
      '  SERIE = :SERIE,'
      '  ID_PRODUCCION = :ID_PRODUCCION,'
      '  COD_EMPLEADO = :COD_EMPLEADO,'
      '  FECHA = :FECHA,'
      '  CANTIDAD = :CANTIDAD,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  PRECIO = :PRECIO'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_PAN_PRODD'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 400
    Top = 64
    object tblPanProduccionDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'PAN_PRODUCCION_DET.SERIE'
      Required = True
    end
    object tblPanProduccionDetID_PRODUCCION: TIntegerField
      FieldName = 'ID_PRODUCCION'
      Origin = 'PAN_PRODUCCION_DET.ID_PRODUCCION'
      Required = True
    end
    object tblPanProduccionDetFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PAN_PRODUCCION_DET.FECHA'
    end
    object tblPanProduccionDetCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PAN_PRODUCCION_DET.CANTIDAD'
    end
    object tblPanProduccionDetDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PAN_PRODUCCION_DET.DESCRIPCION'
      Size = 60
    end
    object tblPanProduccionDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PAN_PRODUCCION_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblPanProduccionDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PAN_PRODUCCION_DET.FECHA_IN'
    end
    object tblPanProduccionDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PAN_PRODUCCION_DET.IN_POR'
      Size = 12
    end
    object tblPanProduccionDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'PAN_PRODUCCION_DET.PRECIO'
    end
    object tblPanProduccionDetCOD_EMPLEADO: TIntegerField
      DisplayLabel = 'CodEmpleado'
      FieldName = 'COD_EMPLEADO'
      Origin = 'PAN_PRODUCCION_DET.COD_EMPLEADO'
      Required = True
    end
  end
  object dstblPanProduccionMast: TDataSource
    DataSet = tblPanProduccionMast
    Left = 264
    Top = 296
  end
  object dstblPanProduccionDet: TDataSource
    DataSet = tblPanProduccionDet
    Left = 360
    Top = 352
  end
  object stpProcIntegrarPanProd: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'PROC_INTEGRARPRODPAN'
    Left = 232
    Top = 352
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'COD_EMPLEADO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'MONTOPAGAR'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'FECHANOMINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHANOMFIN'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'CIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'TIPO_NOMINA'
        ParamType = ptInput
      end>
  end
  object QryProcIntegrarPanProd: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from '
      'PROC_INTEGRARPRODPAN ('
      '    :fechaini,'
      '    :fechafin,'
      '    :CIA_KEY,'
      '    :TIPO_NOMINA)')
    Left = 53
    Top = 378
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
      end
      item
        DataType = ftInteger
        Name = 'CIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPO_NOMINA'
        ParamType = ptInput
      end>
    object QryProcIntegrarPanProdCOD_EMPLEADO: TSmallintField
      FieldName = 'COD_EMPLEADO'
      Origin = 'PROC_INTEGRARPRODPAN.COD_EMPLEADO'
    end
    object QryProcIntegrarPanProdMONTOPAGAR: TFloatField
      FieldName = 'MONTOPAGAR'
      Origin = 'PROC_INTEGRARPRODPAN.MONTOPAGAR'
    end
  end
  object qryRepPanProdEmpMaster: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepPanProdEmpMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select m.*, e.NOMBRE||" "|| e.apellido nombre From PAN_PRODUCCIO' +
        'N_MAST m, empleado e'
      'Where fecha_produccion '
      'Between :fechaini And :fechafin'
      'and  m.cod_empleado = e.codigo'
      'order by m.cod_empleado,  m.fecha_produccion')
    Left = 392
    Top = 408
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
  end
  object qryRepPanProdEmpDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  PAN_PRODUCCION_MAST.COD_EMPLEADO,'
      '  PAN_PRODUCCION_DET.SERIE,'
      '  PAN_PRODUCCION_DET.ID_PRODUCCION,'
      '  PAN_PRODUCCION_DET.FECHA,'
      '  PAN_PRODUCCION_DET.CANTIDAD,'
      '  PAN_PRODUCCION_DET.DESCRIPCION,'
      '  PAN_PRODUCCION_DET.STATUS,'
      '  PAN_PRODUCCION_DET.FECHA_IN,'
      '  PAN_PRODUCCION_DET.IN_POR,'
      '  PAN_PRODUCCION_DET.PRECIO'
      'FROM'
      '  PAN_PRODUCCION_MAST'
      
        '  INNER JOIN PAN_PRODUCCION_DET ON (PAN_PRODUCCION_MAST.ID_PRODU' +
        'CCION = PAN_PRODUCCION_DET.ID_PRODUCCION)'
      'Where   PAN_PRODUCCION_MAST.COD_EMPLEADO=:codEmp'
      'and PAN_PRODUCCION_DET.FECHA between :fechaini and :fechafin'
      'order by PAN_PRODUCCION_MAST.COD_EMPLEADO,'
      '  PAN_PRODUCCION_DET.FECHA'
      '')
    Left = 240
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codEmp'
        ParamType = ptInput
      end
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
  end
  object tblCafeteriaMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblCafeteriaMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CAFE_MASTER'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into CAFE_MASTER'
      '  (NUMERO, FECHA, CODIGO_PROD, PORC_DELEY, STATUS)'
      'values'
      '  (:NUMERO, :FECHA, :CODIGO_PROD, :PORC_DELEY, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA,'
      '  CODIGO_PROD,'
      '  PORC_DELEY,'
      '  STATUS'
      'from CAFE_MASTER '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select *  from CAFE_MASTER')
    ModifySQL.Strings = (
      'update CAFE_MASTER'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  PORC_DELEY = :PORC_DELEY,'
      '  STATUS = :STATUS'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 584
    Top = 32
    object tblCafeteriaMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'CAFE_MASTER.NUMERO'
      Required = True
    end
    object tblCafeteriaMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'CAFE_MASTER.FECHA'
    end
    object tblCafeteriaMasterCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'CAFE_MASTER.CODIGO_PROD'
      Required = True
    end
    object tblCafeteriaMasterPORC_DELEY: TFloatField
      FieldName = 'PORC_DELEY'
      Origin = 'CAFE_MASTER.PORC_DELEY'
    end
    object tblCafeteriaMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CAFE_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object tblCafeteriaDetalle: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CAFE_MASTER_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into CAFE_MASTER_DET'
      '  (SERIE, NUMERO, CODIGO_PROD, CANT, STATUS)'
      'values'
      '  (:SERIE, :NUMERO, :CODIGO_PROD, :CANT, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NUMERO,'
      '  CODIGO_PROD,'
      '  CANT,'
      '  STATUS'
      'from CAFE_MASTER_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select *  from CAFE_MASTER_DET'
      'where numero=:numero')
    ModifySQL.Strings = (
      'update CAFE_MASTER_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  CANT = :CANT,'
      '  STATUS = :STATUS'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 584
    Top = 80
    object tblCafeteriaDetalleSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'CAFE_MASTER_DET.SERIE'
      Required = True
    end
    object tblCafeteriaDetalleNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'CAFE_MASTER_DET.NUMERO'
      Required = True
    end
    object tblCafeteriaDetalleCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'CAFE_MASTER_DET.CODIGO_PROD'
      Required = True
    end
    object tblCafeteriaDetalleCANT: TIntegerField
      FieldName = 'CANT'
      Origin = 'CAFE_MASTER_DET.CANT'
    end
    object tblCafeteriaDetalleSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CAFE_MASTER_DET.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dstblCafeteriaMaster: TDataSource
    DataSet = tblCafeteriaMaster
    Left = 584
    Top = 136
  end
  object dstblCafeteriaDetalle: TDataSource
    DataSet = tblCafeteriaDetalle
    Left = 584
    Top = 184
  end
  object qryInvLookup: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select I.* From INVENTARIO_PRODUCTO I, TIPO_INVENTARIO T'
      'Where i.tipo = t.codigo'
      'And upper(t.descripcion) LIKE '#39'%CAFETE%'#39)
    Left = 584
    Top = 240
    object qryInvLookupCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInvLookupCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryInvLookupTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object qryInvLookupDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
  end
  object dsqryInvLookup: TDataSource
    DataSet = qryInvLookup
    Left = 584
    Top = 296
  end
  object qryListIngVtaCafeteria: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  INVENTARIO_PRODUCTO.DESCRIPCION,'
      '  TRANS_CAFETERIA.CODIGO_PROD,'
      '  TRANS_CAFETERIA.SERIE,'
      '  TRANS_CAFETERIA.NUMERO,'
      '  TRANS_CAFETERIA.CANT,'
      '  TRANS_CAFETERIA.STATUS,'
      '  USUARIO.NOMBRECOMPLETO,'
      '  TRANS_CAFETERIA.COD_USUARIO,'
      '  VENTAS_MAST.FECHA'
      'FROM'
      '  TRANS_CAFETERIA'
      
        '  LEFT OUTER JOIN USUARIO ON (TRANS_CAFETERIA.COD_USUARIO = USUA' +
        'RIO.CODIGO_EMPLEADO)'
      
        '  INNER JOIN INVENTARIO_PRODUCTO ON (TRANS_CAFETERIA.CODIGO_PROD' +
        ' = INVENTARIO_PRODUCTO.CODIGO)'
      
        '  INNER JOIN VENTAS_MAST ON (TRANS_CAFETERIA.NUMERO = VENTAS_MAS' +
        'T.NUMERO)'
      'Where   VENTAS_MAST.FECHA between :fechaini and :fechafin'
      'Order by   TRANS_CAFETERIA.COD_USUARIO,'
      '  TRANS_CAFETERIA.CODIGO_PROD')
    Left = 584
    Top = 352
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
    object qryListIngVtaCafeteriaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryListIngVtaCafeteriaCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'TRANS_CAFETERIA.CODIGO_PROD'
    end
    object qryListIngVtaCafeteriaSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'TRANS_CAFETERIA.SERIE'
    end
    object qryListIngVtaCafeteriaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TRANS_CAFETERIA.NUMERO'
      Required = True
    end
    object qryListIngVtaCafeteriaCANT: TFloatField
      FieldName = 'CANT'
      Origin = 'TRANS_CAFETERIA.CANT'
    end
    object qryListIngVtaCafeteriaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRANS_CAFETERIA.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryListIngVtaCafeteriaNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Origin = 'USUARIO.NOMBRECOMPLETO'
      Size = 40
    end
    object qryListIngVtaCafeteriaCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'TRANS_CAFETERIA.COD_USUARIO'
    end
    object qryListIngVtaCafeteriaFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
  end
  object qryInvLookupIngrediente: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select I.*, d.largo, d.ancho, d.desperdicio '
      'From INVENTARIO_PRODUCTO I'
      'Inner join TIPO_INVENTARIO T on t.codigo = i.tipo'
      'Left outer join dimension_prod d on d.codigo_prod = i.codigo'
      'Where upper(t.descripcion) LIKE '#39'%INGREDIENTE%'#39)
    Left = 590
    Top = 404
    object qryInvLookupIngredienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInvLookupIngredienteCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryInvLookupIngredienteDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 40
    end
    object qryInvLookupIngredienteCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryInvLookupIngredientePRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryInvLookupIngredienteLARGO: TFloatField
      FieldName = 'LARGO'
      Origin = 'DIMENSION_PROD.LARGO'
    end
    object qryInvLookupIngredienteANCHO: TFloatField
      FieldName = 'ANCHO'
      Origin = 'DIMENSION_PROD.ANCHO'
    end
    object qryInvLookupIngredienteDESPERDICIO: TFloatField
      FieldName = 'DESPERDICIO'
      Origin = 'DIMENSION_PROD.DESPERDICIO'
    end
    object qryInvLookupIngredienteCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
  end
  object dsqryInvLookupIngrediente: TDataSource
    DataSet = qryInvLookupIngrediente
    Left = 594
    Top = 456
  end
  object qryInvLookup_Cafbase: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select I.* From INVENTARIO_PRODUCTO I, TIPO_INVENTARIO T'
      'Where i.tipo = t.codigo'
      'And upper(t.descripcion) LIKE '#39'%CAFETE%'#39)
    Left = 672
    Top = 184
  end
  object qryInvLookup_Prodbase: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select I.* From INVENTARIO_PRODUCTO I, TIPO_INVENTARIO T'
      'Where i.tipo = t.codigo'
      'And upper(t.descripcion) LIKE '#39'%PRODUCCION%'#39)
    Left = 688
    Top = 256
  end
  object tblPrecioCuadros: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    AfterPost = tblPrecioCuadrosAfterPost
    AfterScroll = tblPrecioCuadrosAfterScroll
    BeforePost = tblPrecioCuadrosBeforePost
    OnCalcFields = tblPrecioCuadrosCalcFields
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PRECIO_CUADROS'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into PRECIO_CUADROS'
      
        '  (NUMERO, NUMERO_MAST, FECHA, CODIGO_CTE, COD_PRODUCTO, ALTO, A' +
        'NCHO, PERDIDA, '
      
        '   PORC_BENEFICIO, PRECIOVENTA, NIVELPRECIO, NOMBRECLIENTE, CELU' +
        'LAR, STATUS, '
      
        '   NUMERO_TRN_VTA, CODIGO_OPERADOR, COMENTARIO, MONTO_ABONADO, F' +
        'ECHAENTREGA, '
      
        '   COD_USR, DOBLEPASTATU, PORC_DESCUENTO, MONTODESCUENTO, DOBLE_' +
        'CANUELA, '
      '   CON_DOBLE_CRISTAL, FORMAPAGO_ABONO, CON_CANVAS, MONTO_BRUTO)'
      'values'
      
        '  (:NUMERO, :NUMERO_MAST, :FECHA, :CODIGO_CTE, :COD_PRODUCTO, :A' +
        'LTO, :ANCHO, '
      
        '   :PERDIDA, :PORC_BENEFICIO, :PRECIOVENTA, :NIVELPRECIO, :NOMBR' +
        'ECLIENTE, '
      
        '   :CELULAR, :STATUS, :NUMERO_TRN_VTA, :CODIGO_OPERADOR, :COMENT' +
        'ARIO, :MONTO_ABONADO, '
      
        '   :FECHAENTREGA, :COD_USR, :DOBLEPASTATU, :PORC_DESCUENTO, :MON' +
        'TODESCUENTO, '
      
        '   :DOBLE_CANUELA, :CON_DOBLE_CRISTAL, :FORMAPAGO_ABONO, :CON_CA' +
        'NVAS, :MONTO_BRUTO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  NUMERO_MAST,'
      '  FECHA,'
      '  CODIGO_CTE,'
      '  COD_PRODUCTO,'
      '  ALTO,'
      '  ANCHO,'
      '  PERDIDA,'
      '  PORC_BENEFICIO,'
      '  PRECIOVENTA,'
      '  NIVELPRECIO,'
      '  NOMBRECLIENTE,'
      '  CELULAR,'
      '  STATUS,'
      '  NUMERO_TRN_VTA,'
      '  CODIGO_OPERADOR,'
      '  COMENTARIO,'
      '  MONTO_ABONADO,'
      '  FECHAENTREGA,'
      '  COD_USR,'
      '  DOBLEPASTATU,'
      '  PORC_DESCUENTO,'
      '  MONTODESCUENTO,'
      '  DOBLE_CANUELA,'
      '  CON_DOBLE_CRISTAL,'
      '  FORMAPAGO_ABONO,'
      '  CON_CANVAS,'
      '  MONTO_BRUTO'
      'from PRECIO_CUADROS '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select p.* From PRECIO_CUADROS p'
      'Where fecha Between :fechaIni And :fechaFin'
      'And p.status in (:status1,:status2)'
      'And p.numero_mast =:numeromast'
      '')
    ModifySQL.Strings = (
      'update PRECIO_CUADROS'
      'set'
      '  NUMERO = :NUMERO,'
      '  NUMERO_MAST = :NUMERO_MAST,'
      '  FECHA = :FECHA,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  COD_PRODUCTO = :COD_PRODUCTO,'
      '  ALTO = :ALTO,'
      '  ANCHO = :ANCHO,'
      '  PERDIDA = :PERDIDA,'
      '  PORC_BENEFICIO = :PORC_BENEFICIO,'
      '  PRECIOVENTA = :PRECIOVENTA,'
      '  NIVELPRECIO = :NIVELPRECIO,'
      '  NOMBRECLIENTE = :NOMBRECLIENTE,'
      '  CELULAR = :CELULAR,'
      '  STATUS = :STATUS,'
      '  NUMERO_TRN_VTA = :NUMERO_TRN_VTA,'
      '  CODIGO_OPERADOR = :CODIGO_OPERADOR,'
      '  COMENTARIO = :COMENTARIO,'
      '  MONTO_ABONADO = :MONTO_ABONADO,'
      '  FECHAENTREGA = :FECHAENTREGA,'
      '  COD_USR = :COD_USR,'
      '  DOBLEPASTATU = :DOBLEPASTATU,'
      '  PORC_DESCUENTO = :PORC_DESCUENTO,'
      '  MONTODESCUENTO = :MONTODESCUENTO,'
      '  DOBLE_CANUELA = :DOBLE_CANUELA,'
      '  CON_DOBLE_CRISTAL = :CON_DOBLE_CRISTAL,'
      '  FORMAPAGO_ABONO = :FORMAPAGO_ABONO,'
      '  CON_CANVAS = :CON_CANVAS,'
      '  MONTO_BRUTO = :MONTO_BRUTO'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 776
    Top = 320
    object tblPrecioCuadrosNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PRECIO_CUADROS.NUMERO'
      Required = True
    end
    object tblPrecioCuadrosFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PRECIO_CUADROS.FECHA'
    end
    object tblPrecioCuadrosCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PRECIO_CUADROS.CODIGO_CTE'
    end
    object tblPrecioCuadrosNOMBRECLIENTE: TIBStringField
      FieldName = 'NOMBRECLIENTE'
      Origin = 'PRECIO_CUADROS.NOMBRECLIENTE'
      Size = 60
    end
    object tblPrecioCuadrosCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'PRECIO_CUADROS.COD_PRODUCTO'
      Required = True
    end
    object tblPrecioCuadrosALTO: TFloatField
      FieldName = 'ALTO'
      Origin = 'PRECIO_CUADROS.ALTO'
    end
    object tblPrecioCuadrosANCHO: TFloatField
      FieldName = 'ANCHO'
      Origin = 'PRECIO_CUADROS.ANCHO'
    end
    object tblPrecioCuadrosPERDIDA: TFloatField
      FieldName = 'PERDIDA'
      Origin = 'PRECIO_CUADROS.PERDIDA'
    end
    object tblPrecioCuadrosPORC_BENEFICIO: TFloatField
      FieldName = 'PORC_BENEFICIO'
      Origin = 'PRECIO_CUADROS.PORC_BENEFICIO'
    end
    object tblPrecioCuadrosPRECIOVENTA: TFloatField
      FieldName = 'PRECIOVENTA'
      Origin = 'PRECIO_CUADROS.PRECIOVENTA'
      DisplayFormat = ',0'
    end
    object tblPrecioCuadrosNIVELPRECIO: TSmallintField
      FieldName = 'NIVELPRECIO'
      Origin = 'PRECIO_CUADROS.NIVELPRECIO'
    end
    object tblPrecioCuadrosCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'PRECIO_CUADROS.CELULAR'
    end
    object tblPrecioCuadrosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PRECIO_CUADROS.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblPrecioCuadrosNUMERO_TRN_VTA: TIntegerField
      FieldName = 'NUMERO_TRN_VTA'
      Origin = 'PRECIO_CUADROS.NUMERO_TRN_VTA'
    end
    object tblPrecioCuadrosCODIGO_OPERADOR: TIntegerField
      FieldName = 'CODIGO_OPERADOR'
      Origin = 'PRECIO_CUADROS.CODIGO_OPERADOR'
    end
    object tblPrecioCuadrosCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'PRECIO_CUADROS.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object tblPrecioCuadrosMONTO_ABONADO: TFloatField
      FieldName = 'MONTO_ABONADO'
      Origin = 'PRECIO_CUADROS.MONTO_ABONADO'
      DisplayFormat = ',0.00'
    end
    object tblPrecioCuadrosMontoRestante: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'MontoRestante'
      Calculated = True
    end
    object tblPrecioCuadrosFECHAENTREGA: TDateTimeField
      FieldName = 'FECHAENTREGA'
      Origin = 'PRECIO_CUADROS.FECHAENTREGA'
    end
    object tblPrecioCuadrosCOD_USR: TIntegerField
      FieldName = 'COD_USR'
      Origin = 'PRECIO_CUADROS.COD_USR'
    end
    object tblPrecioCuadrosDOBLEPASTATU: TSmallintField
      FieldName = 'DOBLEPASTATU'
      Origin = 'PRECIO_CUADROS.DOBLEPASTATU'
    end
    object tblPrecioCuadrosPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'PRECIO_CUADROS.PORC_DESCUENTO'
      DisplayFormat = ',0.00'
    end
    object tblPrecioCuadrosMONTODESCUENTO: TFloatField
      FieldName = 'MONTODESCUENTO'
      Origin = 'PRECIO_CUADROS.MONTODESCUENTO'
      DisplayFormat = ',0.00'
    end
    object tblPrecioCuadrosDOBLE_CANUELA: TSmallintField
      FieldName = 'DOBLE_CANUELA'
      Origin = 'PRECIO_CUADROS.DOBLE_CANUELA'
    end
    object tblPrecioCuadrosCON_DOBLE_CRISTAL: TSmallintField
      FieldName = 'CON_DOBLE_CRISTAL'
      Origin = 'PRECIO_CUADROS.CON_DOBLE_CRISTAL'
    end
    object tblPrecioCuadrosFORMAPAGO_ABONO: TSmallintField
      FieldName = 'FORMAPAGO_ABONO'
      Origin = 'PRECIO_CUADROS.FORMAPAGO_ABONO'
    end
    object tblPrecioCuadrosCON_CANVAS: TSmallintField
      FieldName = 'CON_CANVAS'
      Origin = 'PRECIO_CUADROS.CON_CANVAS'
    end
    object tblPrecioCuadrosNUMERO_MAST: TIntegerField
      FieldName = 'NUMERO_MAST'
      Origin = 'PRECIO_CUADROS.NUMERO_MAST'
    end
    object tblPrecioCuadrosMONTO_BRUTO: TFloatField
      Alignment = taLeftJustify
      FieldName = 'MONTO_BRUTO'
      Origin = 'PRECIO_CUADROS.MONTO_BRUTO'
      DisplayFormat = ',0.00'
    end
  end
  object dstblPrecioCuadros: TDataSource
    AutoEdit = False
    DataSet = tblPrecioCuadros
    Left = 776
    Top = 376
  end
  object tblIngredienteTrabCuadros: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BeforeOpen = tblIngredienteTrabCuadrosBeforeOpen
    BeforePost = tblIngredienteTrabCuadrosBeforePost
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from Precio_Cuadros_det'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into Precio_Cuadros_det'
      
        '  (ID, NUMERO, CODIGO_PROD_BASE, COD_PRODUCTO, PRECIO, ALTO, ANC' +
        'HO, ESCANUELA, '
      '   ESPASTATU, NUM_CANUELA, CANT_MERMA, LEVEL_PRECIO)'
      'values'
      
        '  (:ID, :NUMERO, :CODIGO_PROD_BASE, :COD_PRODUCTO, :PRECIO, :ALT' +
        'O, :ANCHO, '
      
        '   :ESCANUELA, :ESPASTATU, :NUM_CANUELA, :CANT_MERMA, :LEVEL_PRE' +
        'CIO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NUMERO,'
      '  CODIGO_PROD_BASE,'
      '  COD_PRODUCTO,'
      '  PRECIO,'
      '  ALTO,'
      '  ANCHO,'
      '  ESCANUELA,'
      '  ESPASTATU,'
      '  NUM_CANUELA,'
      '  CANT_MERMA,'
      '  LEVEL_PRECIO'
      'from Precio_Cuadros_det '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'Select r.codigo_barra,r.descripcion, d.* '
      'From Precio_Cuadros_det d,'
      'INVENTARIO_PRODUCTO r'
      'Where d.numero=:numero'
      'And r.codigo = d.COD_PRODUCTO')
    ModifySQL.Strings = (
      'update Precio_Cuadros_det'
      'set'
      '  ID = :ID,'
      '  NUMERO = :NUMERO,'
      '  CODIGO_PROD_BASE = :CODIGO_PROD_BASE,'
      '  COD_PRODUCTO = :COD_PRODUCTO,'
      '  PRECIO = :PRECIO,'
      '  ALTO = :ALTO,'
      '  ANCHO = :ANCHO,'
      '  ESCANUELA = :ESCANUELA,'
      '  ESPASTATU = :ESPASTATU,'
      '  NUM_CANUELA = :NUM_CANUELA,'
      '  CANT_MERMA = :CANT_MERMA,'
      '  LEVEL_PRECIO = :LEVEL_PRECIO'
      'where'
      '  ID = :OLD_ID')
    Left = 752
    Top = 456
    object tblIngredienteTrabCuadrosID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRECIO_CUADROS_DET.ID'
      Required = True
    end
    object tblIngredienteTrabCuadrosNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PRECIO_CUADROS_DET.NUMERO'
      Required = True
    end
    object tblIngredienteTrabCuadrosCODIGO_PROD_BASE: TIntegerField
      FieldName = 'CODIGO_PROD_BASE'
      Origin = 'PRECIO_CUADROS_DET.CODIGO_PROD_BASE'
      Required = True
    end
    object tblIngredienteTrabCuadrosCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'PRECIO_CUADROS_DET.COD_PRODUCTO'
      Required = True
    end
    object tblIngredienteTrabCuadrosPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'PRECIO_CUADROS_DET.PRECIO'
      DisplayFormat = ',0.00'
    end
    object tblIngredienteTrabCuadrosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object tblIngredienteTrabCuadrosDescIngrediente: TStringField
      FieldKind = fkLookup
      FieldName = 'DescIngrediente'
      LookupDataSet = qryInvIngrediente
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'COD_PRODUCTO'
      Lookup = True
    end
    object tblIngredienteTrabCuadrosALTO: TFloatField
      FieldName = 'ALTO'
      Origin = 'PRECIO_CUADROS_DET.ALTO'
    end
    object tblIngredienteTrabCuadrosANCHO: TFloatField
      FieldName = 'ANCHO'
      Origin = 'PRECIO_CUADROS_DET.ANCHO'
    end
    object tblIngredienteTrabCuadrosESCANUELA: TSmallintField
      FieldName = 'ESCANUELA'
      Origin = 'PRECIO_CUADROS_DET.ESCANUELA'
    end
    object tblIngredienteTrabCuadrosESPASTATU: TSmallintField
      FieldName = 'ESPASTATU'
      Origin = 'PRECIO_CUADROS_DET.ESPASTATU'
    end
    object tblIngredienteTrabCuadrosNUM_CANUELA: TSmallintField
      FieldName = 'NUM_CANUELA'
      Origin = 'PRECIO_CUADROS_DET.NUM_CANUELA'
    end
    object tblIngredienteTrabCuadrosCANT_MERMA: TFloatField
      FieldName = 'CANT_MERMA'
      Origin = 'PRECIO_CUADROS_DET.CANT_MERMA'
    end
    object tblIngredienteTrabCuadrosCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
    object tblIngredienteTrabCuadrosDescMaterialLookup: TStringField
      FieldKind = fkLookup
      FieldName = 'DescMaterialLookup'
      LookupDataSet = qryInvMatDesc
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'COD_PRODUCTO'
      Lookup = True
    end
    object tblIngredienteTrabCuadrosLEVEL_PRECIO: TSmallintField
      FieldName = 'LEVEL_PRECIO'
      Origin = 'PRECIO_CUADROS_DET.LEVEL_PRECIO'
    end
  end
  object dstblIngredienteTrabCuadros: TDataSource
    AutoEdit = False
    DataSet = tblIngredienteTrabCuadros
    Left = 512
    Top = 512
  end
  object qryInvIngrediente: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select i.codigo, i.descripcion from INVENTARIO_PRODUCTO i'
      'INNER JOIN TIPO_INVENTARIO t on t.CODIGO = i.TIPO'
      'where upper(descripcion) LIKE '#39'%INGREDIENTE%'#39)
    Left = 704
    Top = 344
  end
  object dsqryInvIngrediente: TDataSource
    DataSet = qryInvIngrediente
    Left = 690
    Top = 416
  end
  object qryBuscarProd: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select  codigo, CODIGO_BARRA'
      ', DESCRIPCION'
      ', PRECIO,'
      'cantidad'
      'from INVENTARIO_PRODUCTO')
    Left = 848
    Top = 384
    object qryBuscarProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryBuscarProdCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
    object qryBuscarProdDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryBuscarProdPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryBuscarProdCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
  end
  object qryDimensionProd: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from DIMENSION_PROD'
      'where codigo_prod=:codigoprod')
    Left = 784
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigoprod'
        ParamType = ptUnknown
      end>
    object qryDimensionProdCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'DIMENSION_PROD.CODIGO_PROD'
      Required = True
    end
    object qryDimensionProdLARGO: TFloatField
      FieldName = 'LARGO'
      Origin = 'DIMENSION_PROD.LARGO'
    end
    object qryDimensionProdANCHO: TFloatField
      FieldName = 'ANCHO'
      Origin = 'DIMENSION_PROD.ANCHO'
    end
    object qryDimensionProdDESC_UNIDAD: TIBStringField
      FieldName = 'DESC_UNIDAD'
      Origin = 'DIMENSION_PROD.DESC_UNIDAD'
      Size = 30
    end
    object qryDimensionProdDESPERDICIO: TFloatField
      FieldName = 'DESPERDICIO'
      Origin = 'DIMENSION_PROD.DESPERDICIO'
    end
    object qryDimensionProdDESCUNIABREV: TIBStringField
      FieldName = 'DESCUNIABREV'
      Origin = 'DIMENSION_PROD.DESCUNIABREV'
      Size = 3
    end
  end
  object tblDimensionProd: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DIMENSION_PROD'
      'where'
      '  CODIGO_PROD = :OLD_CODIGO_PROD')
    InsertSQL.Strings = (
      'insert into DIMENSION_PROD'
      
        '  (CODIGO_PROD, LARGO, ANCHO, DESC_UNIDAD, DESPERDICIO, DESCUNIA' +
        'BREV)'
      'values'
      
        '  (:CODIGO_PROD, :LARGO, :ANCHO, :DESC_UNIDAD, :DESPERDICIO, :DE' +
        'SCUNIABREV)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_PROD,'
      '  LARGO,'
      '  ANCHO,'
      '  DESC_UNIDAD,'
      '  DESPERDICIO,'
      '  DESCUNIABREV'
      'from DIMENSION_PROD '
      'where'
      '  CODIGO_PROD = :CODIGO_PROD')
    SelectSQL.Strings = (
      'Select * from DIMENSION_PROD'
      'where codigo_prod=:codigoprod')
    ModifySQL.Strings = (
      'update DIMENSION_PROD'
      'set'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  LARGO = :LARGO,'
      '  ANCHO = :ANCHO,'
      '  DESC_UNIDAD = :DESC_UNIDAD,'
      '  DESPERDICIO = :DESPERDICIO,'
      '  DESCUNIABREV = :DESCUNIABREV'
      'where'
      '  CODIGO_PROD = :OLD_CODIGO_PROD')
    Left = 784
    Top = 152
    object tblDimensionProdCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'DIMENSION_PROD.CODIGO_PROD'
      Required = True
    end
    object tblDimensionProdLARGO: TFloatField
      FieldName = 'LARGO'
      Origin = 'DIMENSION_PROD.LARGO'
      Required = True
    end
    object tblDimensionProdANCHO: TFloatField
      FieldName = 'ANCHO'
      Origin = 'DIMENSION_PROD.ANCHO'
      Required = True
    end
    object tblDimensionProdDESC_UNIDAD: TIBStringField
      FieldName = 'DESC_UNIDAD'
      Origin = 'DIMENSION_PROD.DESC_UNIDAD'
      Required = True
      Size = 30
    end
    object tblDimensionProdDESPERDICIO: TFloatField
      FieldName = 'DESPERDICIO'
      Origin = 'DIMENSION_PROD.DESPERDICIO'
      Required = True
      DisplayFormat = ',0.00'
    end
    object tblDimensionProdDESCUNIABREV: TIBStringField
      FieldName = 'DESCUNIABREV'
      Origin = 'DIMENSION_PROD.DESCUNIABREV'
      Required = True
      Size = 3
    end
  end
  object qryIngredienteTrabCuadros: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select r.descripcion, d.* '
      'From Precio_Cuadros_det d,'
      'INVENTARIO_PRODUCTO r'
      'Where d.CODIGO_PROD_BASE=:codigoprod'
      'And d.numero=:numero'
      'And r.codigo = d.COD_PRODUCTO')
    Left = 848
    Top = 432
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoprod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryIngredienteTrabCuadrosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryIngredienteTrabCuadrosID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRECIO_CUADROS_DET.ID'
      Required = True
    end
    object qryIngredienteTrabCuadrosCODIGO_PROD_BASE: TIntegerField
      FieldName = 'CODIGO_PROD_BASE'
      Origin = 'PRECIO_CUADROS_DET.CODIGO_PROD_BASE'
      Required = True
    end
    object qryIngredienteTrabCuadrosCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'PRECIO_CUADROS_DET.COD_PRODUCTO'
      Required = True
    end
    object qryIngredienteTrabCuadrosPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'PRECIO_CUADROS_DET.PRECIO'
    end
    object qryIngredienteTrabCuadrosALTO: TFloatField
      FieldName = 'ALTO'
      Origin = 'PRECIO_CUADROS_DET.ALTO'
    end
    object qryIngredienteTrabCuadrosANCHO: TFloatField
      FieldName = 'ANCHO'
      Origin = 'PRECIO_CUADROS_DET.ANCHO'
    end
    object qryIngredienteTrabCuadrosESCANUELA: TSmallintField
      FieldName = 'ESCANUELA'
      Origin = 'PRECIO_CUADROS_DET.ESCANUELA'
    end
    object qryIngredienteTrabCuadrosESPASTATU: TSmallintField
      FieldName = 'ESPASTATU'
      Origin = 'PRECIO_CUADROS_DET.ESPASTATU'
    end
    object qryIngredienteTrabCuadrosNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PRECIO_CUADROS_DET.NUMERO'
      Required = True
    end
    object qryIngredienteTrabCuadrosNUM_CANUELA: TSmallintField
      FieldName = 'NUM_CANUELA'
      Origin = 'PRECIO_CUADROS_DET.NUM_CANUELA'
    end
    object qryIngredienteTrabCuadrosCANT_MERMA: TFloatField
      FieldName = 'CANT_MERMA'
      Origin = 'PRECIO_CUADROS_DET.CANT_MERMA'
    end
  end
  object qryRepOrdenTrab: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepOrdenTrabAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select i.DESCRIPCION desc_producto, c.NOMBRE_FACTURAR NombreCteR' +
        'egistrado, p.* '
      ', e.NOMBRE||'#39' '#39'||e.Apellido NombreOperador,'
      'ee.nombrecompleto NombreUsuarioReg, p.COD_USR'
      'From PRECIO_CUADROS p'
      'Inner join INVENTARIO_PRODUCTO i on i.CODIGO = p.COD_PRODUCTO'
      'Left outer join CLIENTES c on c.CODIGO_CTE = p.CODIGO_CTE'
      'left outer join EMPLEADO e on e.CODIGO = p.CODIGO_OPERADOR'
      'left outer join USUARIO ee on ee.codigo_empleado = p.COD_USR'
      'where p.numero =:numero')
    Left = 848
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end>
    object qryRepOrdenTrabDESC_PRODUCTO: TIBStringField
      FieldName = 'DESC_PRODUCTO'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryRepOrdenTrabNOMBRECTEREGISTRADO: TIBStringField
      FieldName = 'NOMBRECTEREGISTRADO'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryRepOrdenTrabNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PRECIO_CUADROS.NUMERO'
      Required = True
    end
    object qryRepOrdenTrabFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PRECIO_CUADROS.FECHA'
    end
    object qryRepOrdenTrabCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PRECIO_CUADROS.CODIGO_CTE'
    end
    object qryRepOrdenTrabCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'PRECIO_CUADROS.COD_PRODUCTO'
      Required = True
    end
    object qryRepOrdenTrabALTO: TFloatField
      FieldName = 'ALTO'
      Origin = 'PRECIO_CUADROS.ALTO'
    end
    object qryRepOrdenTrabANCHO: TFloatField
      FieldName = 'ANCHO'
      Origin = 'PRECIO_CUADROS.ANCHO'
    end
    object qryRepOrdenTrabPERDIDA: TFloatField
      FieldName = 'PERDIDA'
      Origin = 'PRECIO_CUADROS.PERDIDA'
    end
    object qryRepOrdenTrabPORC_BENEFICIO: TFloatField
      FieldName = 'PORC_BENEFICIO'
      Origin = 'PRECIO_CUADROS.PORC_BENEFICIO'
    end
    object qryRepOrdenTrabPRECIOVENTA: TFloatField
      FieldName = 'PRECIOVENTA'
      Origin = 'PRECIO_CUADROS.PRECIOVENTA'
    end
    object qryRepOrdenTrabNIVELPRECIO: TSmallintField
      FieldName = 'NIVELPRECIO'
      Origin = 'PRECIO_CUADROS.NIVELPRECIO'
    end
    object qryRepOrdenTrabNOMBRECLIENTE: TIBStringField
      FieldName = 'NOMBRECLIENTE'
      Origin = 'PRECIO_CUADROS.NOMBRECLIENTE'
      Size = 60
    end
    object qryRepOrdenTrabCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'PRECIO_CUADROS.CELULAR'
    end
    object qryRepOrdenTrabSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PRECIO_CUADROS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepOrdenTrabNUMERO_TRN_VTA: TIntegerField
      FieldName = 'NUMERO_TRN_VTA'
      Origin = 'PRECIO_CUADROS.NUMERO_TRN_VTA'
    end
    object qryRepOrdenTrabCODIGO_OPERADOR: TIntegerField
      FieldName = 'CODIGO_OPERADOR'
      Origin = 'PRECIO_CUADROS.CODIGO_OPERADOR'
    end
    object qryRepOrdenTrabCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'PRECIO_CUADROS.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepOrdenTrabMONTO_ABONADO: TFloatField
      FieldName = 'MONTO_ABONADO'
      Origin = 'PRECIO_CUADROS.MONTO_ABONADO'
    end
    object qryRepOrdenTrabNOMBREOPERADOR: TIBStringField
      FieldName = 'NOMBREOPERADOR'
      Size = 71
    end
    object qryRepOrdenTrabFECHAENTREGA: TDateTimeField
      FieldName = 'FECHAENTREGA'
      Origin = 'PRECIO_CUADROS.FECHAENTREGA'
    end
    object qryRepOrdenTrabCOD_USR: TIntegerField
      FieldName = 'COD_USR'
      Origin = 'PRECIO_CUADROS.COD_USR'
    end
    object qryRepOrdenTrabNOMBREUSUARIOREG: TIBStringField
      FieldName = 'NOMBREUSUARIOREG'
      Size = 71
    end
    object qryRepOrdenTrabDOBLEPASTATU: TSmallintField
      FieldName = 'DOBLEPASTATU'
      Origin = 'PRECIO_CUADROS.DOBLEPASTATU'
    end
    object qryRepOrdenTrabPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'PRECIO_CUADROS.PORC_DESCUENTO'
    end
    object qryRepOrdenTrabMONTODESCUENTO: TFloatField
      FieldName = 'MONTODESCUENTO'
      Origin = 'PRECIO_CUADROS.MONTODESCUENTO'
    end
  end
  object qryRepOrdenTrabDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select p.*, i.DESCRIPCION desc_material, d.*'
      'From PRECIO_CUADROS_DET p'
      'Inner join INVENTARIO_PRODUCTO i on i.CODIGO = p.COD_PRODUCTO'
      
        'left outer join DIMENSION_PROD d on d.CODIGO_PROD = p.COD_PRODUC' +
        'TO'
      'where p.NUMERO =:numero')
    Left = 848
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryRepOrdenTrabDetID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRECIO_CUADROS_DET.ID'
      Required = True
    end
    object qryRepOrdenTrabDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PRECIO_CUADROS_DET.NUMERO'
      Required = True
    end
    object qryRepOrdenTrabDetCODIGO_PROD_BASE: TIntegerField
      FieldName = 'CODIGO_PROD_BASE'
      Origin = 'PRECIO_CUADROS_DET.CODIGO_PROD_BASE'
      Required = True
    end
    object qryRepOrdenTrabDetCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'PRECIO_CUADROS_DET.COD_PRODUCTO'
      Required = True
    end
    object qryRepOrdenTrabDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'PRECIO_CUADROS_DET.PRECIO'
    end
    object qryRepOrdenTrabDetALTO: TFloatField
      FieldName = 'ALTO'
      Origin = 'PRECIO_CUADROS_DET.ALTO'
    end
    object qryRepOrdenTrabDetANCHO: TFloatField
      FieldName = 'ANCHO'
      Origin = 'PRECIO_CUADROS_DET.ANCHO'
    end
    object qryRepOrdenTrabDetESCANUELA: TSmallintField
      FieldName = 'ESCANUELA'
      Origin = 'PRECIO_CUADROS_DET.ESCANUELA'
    end
    object qryRepOrdenTrabDetESPASTATU: TSmallintField
      FieldName = 'ESPASTATU'
      Origin = 'PRECIO_CUADROS_DET.ESPASTATU'
    end
    object qryRepOrdenTrabDetDESC_MATERIAL: TIBStringField
      FieldName = 'DESC_MATERIAL'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryRepOrdenTrabDetDESC_UNIDAD: TIBStringField
      FieldName = 'DESC_UNIDAD'
      Origin = 'DIMENSION_PROD.DESC_UNIDAD'
      Size = 30
    end
    object qryRepOrdenTrabDetDESPERDICIO: TFloatField
      FieldName = 'DESPERDICIO'
      Origin = 'DIMENSION_PROD.DESPERDICIO'
    end
    object qryRepOrdenTrabDetDESCUNIABREV: TIBStringField
      FieldName = 'DESCUNIABREV'
      Origin = 'DIMENSION_PROD.DESCUNIABREV'
      Size = 3
    end
    object qryRepOrdenTrabDetNUM_CANUELA: TSmallintField
      FieldName = 'NUM_CANUELA'
      Origin = 'PRECIO_CUADROS_DET.NUM_CANUELA'
    end
  end
  object rxMaterialUsado: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Canuela'
        DataType = ftCurrency
      end
      item
        Name = 'Paspatu'
        DataType = ftCurrency
      end
      item
        Name = 'Codigo_prod'
        DataType = ftInteger
      end
      item
        Name = 'EsCanuela'
        DataType = ftInteger
      end
      item
        Name = 'EsPaspatu'
        DataType = ftSmallint
      end>
    Left = 232
    Top = 472
    object rxMaterialUsadoCanuela: TCurrencyField
      FieldName = 'Canuela'
    end
    object rxMaterialUsadoPaspatu: TCurrencyField
      FieldName = 'Paspatu'
    end
    object rxMaterialUsadoCodigo_prod: TIntegerField
      FieldName = 'Codigo_prod'
    end
    object rxMaterialUsadoEsCanuela: TIntegerField
      FieldName = 'EsCanuela'
    end
    object rxMaterialUsadoEsPaspatu: TSmallintField
      FieldName = 'EsPaspatu'
    end
  end
  object ibsqlUpdatePrecioCuadro: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'update PRECIO_CUADROS'
      'set perdida =:perdida'
      'Where COD_PRODUCTO=:codigoprod'
      'And numero=:numero')
    Transaction = dmConectar.IBTransaction1
    Left = 728
    Top = 512
  end
  object qryInvMatDesc: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from INVENTARIO_PRODUCTO')
    Left = 864
    Top = 496
    object qryInvMatDescCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInvMatDescFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'INVENTARIO_PRODUCTO.FECHA'
    end
    object qryInvMatDescCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
    object qryInvMatDescDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryInvMatDescCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryInvMatDescPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
  end
  object dstblPrecioCuadrosMast: TDataSource
    DataSet = tblPrecioCuadrosMast
    Left = 56
    Top = 504
  end
  object tblPrecioCuadrosMast: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterInsert = tblPrecioCuadrosMastAfterInsert
    AfterScroll = tblPrecioCuadrosMastAfterScroll
    BeforePost = tblPrecioCuadrosMastBeforePost
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PRECIO_CUADROS_MAST'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into PRECIO_CUADROS_MAST'
      '  (NUMERO, CODIGO_CTE, FECHA, STATUS)'
      'values'
      '  (:NUMERO, :CODIGO_CTE, :FECHA, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  CODIGO_CTE,'
      '  FECHA,'
      '  STATUS'
      'from PRECIO_CUADROS_MAST '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'select * from PRECIO_CUADROS_MAST'
      'where (fecha Between :fechaIni And :fechaFin)'
      'And (status In (:status1,:status2))')
    ModifySQL.Strings = (
      'update PRECIO_CUADROS_MAST'
      'set'
      '  NUMERO = :NUMERO,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  FECHA = :FECHA,'
      '  STATUS = :STATUS'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'numprecc'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 56
    Top = 448
    object tblPrecioCuadrosMastNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PRECIO_CUADROS_MAST.NUMERO'
      Required = True
    end
    object tblPrecioCuadrosMastFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PRECIO_CUADROS_MAST.FECHA'
    end
    object tblPrecioCuadrosMastCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PRECIO_CUADROS_MAST.CODIGO_CTE'
    end
    object tblPrecioCuadrosMastSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PRECIO_CUADROS_MAST.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryTotalPrecioCuadros: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select   '
      '  sum(iif(MONTO_ABONADO > 0,'
      '  (PRECIOVENTA) -'
      '  (MONTO_ABONADO)'
      '  ,  (PRECIOVENTA))) Montototal'
      'from '
      'PRECIO_CUADROS r'
      'where r.NUMERO_MAST=:numeromast')
    Left = 392
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numeromast'
        ParamType = ptUnknown
      end>
    object qryTotalPrecioCuadrosMONTOTOTAL: TFloatField
      FieldName = 'MONTOTOTAL'
      DisplayFormat = ',0.00'
    end
  end
  object dsqryTotalPrecioCuadros: TDataSource
    DataSet = qryTotalPrecioCuadros
    Left = 394
    Top = 528
  end
  object ibsqlUpdateCodCte: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'update  PRECIO_CUADROS'
      'set CODIGO_CTE =:codigocte'
      'where NUMERO_MAST=:nummast')
    Transaction = dmConectar.IBTransaction1
    Left = 784
    Top = 96
  end
end
