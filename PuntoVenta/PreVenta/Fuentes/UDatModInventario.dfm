object dmInventario: TdmInventario
  OldCreateOrder = False
  Left = 762
  Top = 110
  Height = 627
  Width = 865
  object tblInventarioProd: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BeforePost = tblInventarioProdBeforePost
    OnCalcFields = tblInventarioProdCalcFields
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from INVENTARIO_PRODUCTO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into INVENTARIO_PRODUCTO'
      
        '  (CODIGO, CODIGO_TEXTO, FECHA, CODIGO_BARRA, TIPO, DESCRIPCION,' +
        ' DESCRIPCIONADICIONAL, '
      
        '   CANTIDAD_REORDEN, PRECIO_ANT, CANTIDAD, PRECIO, BLCE_CANT_ENT' +
        'RADA, BLCE_CANT_SALIDA, '
      
        '   FECHA_ULTIMA_TRN, STATUS, PORC_DESCUENTO, FOTO, PAGA_ITBI, CO' +
        'DIGO_PRECIO, '
      
        '   UNIDAD, PRECIO_COMPRA, PRECIO_MINIMO, REFERENCIA, FECHA_VENCI' +
        'MIENTO, '
      
        '   INVENTARIAR, PRECIO_TIPO_UNIDAD, TIPO_UNIDAD, ORIGEN, UBICACI' +
        'ON, REFERENCIA_ALTERNA, '
      
        '   MARCA, MODELO, PRECIOVENTA1, PRECIOVENTA2, PRECIOVENTA3, PREC' +
        'IOVENTA4, '
      
        '   PORCUTILIDAD1, PORCUTILIDAD2, PORCUTILIDAD3, PORCUTILIDAD4, U' +
        'SARLEVELPRECIO, '
      
        '   CIA_KEY, SITUACIONPROD, APLICAIMPTOCOMPRA, CODFABRICANTE, CTA' +
        'INVENTARIO, '
      
        '   CTAVENTA, CTACOMPRA, CODSUBCATEGORIA, CODCATEGORIA, PORCITBIS' +
        ', COD_MONEDA, '
      
        '   KILOMETROS, RUTAIMAGEN, IDTASAITBIS, PRECIO_ALQUILER, PAGACOM' +
        'ISION)'
      'values'
      
        '  (:CODIGO, :CODIGO_TEXTO, :FECHA, :CODIGO_BARRA, :TIPO, :DESCRI' +
        'PCION, '
      
        '   :DESCRIPCIONADICIONAL, :CANTIDAD_REORDEN, :PRECIO_ANT, :CANTI' +
        'DAD, :PRECIO, '
      
        '   :BLCE_CANT_ENTRADA, :BLCE_CANT_SALIDA, :FECHA_ULTIMA_TRN, :ST' +
        'ATUS, :PORC_DESCUENTO, '
      
        '   :FOTO, :PAGA_ITBI, :CODIGO_PRECIO, :UNIDAD, :PRECIO_COMPRA, :' +
        'PRECIO_MINIMO, '
      
        '   :REFERENCIA, :FECHA_VENCIMIENTO, :INVENTARIAR, :PRECIO_TIPO_U' +
        'NIDAD, '
      
        '   :TIPO_UNIDAD, :ORIGEN, :UBICACION, :REFERENCIA_ALTERNA, :MARC' +
        'A, :MODELO, '
      
        '   :PRECIOVENTA1, :PRECIOVENTA2, :PRECIOVENTA3, :PRECIOVENTA4, :' +
        'PORCUTILIDAD1, '
      
        '   :PORCUTILIDAD2, :PORCUTILIDAD3, :PORCUTILIDAD4, :USARLEVELPRE' +
        'CIO, :CIA_KEY, '
      
        '   :SITUACIONPROD, :APLICAIMPTOCOMPRA, :CODFABRICANTE, :CTAINVEN' +
        'TARIO, '
      
        '   :CTAVENTA, :CTACOMPRA, :CODSUBCATEGORIA, :CODCATEGORIA, :PORC' +
        'ITBIS, '
      
        '   :COD_MONEDA, :KILOMETROS, :RUTAIMAGEN, :IDTASAITBIS, :PRECIO_' +
        'ALQUILER, '
      '   :PAGACOMISION)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  CODIGO_TEXTO,'
      '  FECHA,'
      '  CODIGO_BARRA,'
      '  TIPO,'
      '  DESCRIPCION,'
      '  DESCRIPCIONADICIONAL,'
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
      '  INVENTARIAR,'
      '  PRECIO_TIPO_UNIDAD,'
      '  TIPO_UNIDAD,'
      '  ORIGEN,'
      '  UBICACION,'
      '  REFERENCIA_ALTERNA,'
      '  MARCA,'
      '  MODELO,'
      '  PRECIOVENTA1,'
      '  PRECIOVENTA2,'
      '  PRECIOVENTA3,'
      '  PRECIOVENTA4,'
      '  PORCUTILIDAD1,'
      '  PORCUTILIDAD2,'
      '  PORCUTILIDAD3,'
      '  PORCUTILIDAD4,'
      '  USARLEVELPRECIO,'
      '  CIA_KEY,'
      '  SITUACIONPROD,'
      '  APLICAIMPTOCOMPRA,'
      '  CODFABRICANTE,'
      '  CTAINVENTARIO,'
      '  CTAVENTA,'
      '  CTACOMPRA,'
      '  CODSUBCATEGORIA,'
      '  CODCATEGORIA,'
      '  PORCITBIS,'
      '  COD_MONEDA,'
      '  KILOMETROS,'
      '  RUTAIMAGEN,'
      '  IDTASAITBIS,'
      '  PRECIO_ALQUILER,'
      '  PAGACOMISION'
      'from INVENTARIO_PRODUCTO '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'SELECT'
      '  INVENTARIO_PRODUCTO.* From INVENTARIO_PRODUCTO'
      'Where  CIA_KEY=:ciakey')
    ModifySQL.Strings = (
      'update INVENTARIO_PRODUCTO'
      'set'
      '  CODIGO = :CODIGO,'
      '  CODIGO_TEXTO = :CODIGO_TEXTO,'
      '  FECHA = :FECHA,'
      '  CODIGO_BARRA = :CODIGO_BARRA,'
      '  TIPO = :TIPO,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  DESCRIPCIONADICIONAL = :DESCRIPCIONADICIONAL,'
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
      '  INVENTARIAR = :INVENTARIAR,'
      '  PRECIO_TIPO_UNIDAD = :PRECIO_TIPO_UNIDAD,'
      '  TIPO_UNIDAD = :TIPO_UNIDAD,'
      '  ORIGEN = :ORIGEN,'
      '  UBICACION = :UBICACION,'
      '  REFERENCIA_ALTERNA = :REFERENCIA_ALTERNA,'
      '  MARCA = :MARCA,'
      '  MODELO = :MODELO,'
      '  PRECIOVENTA1 = :PRECIOVENTA1,'
      '  PRECIOVENTA2 = :PRECIOVENTA2,'
      '  PRECIOVENTA3 = :PRECIOVENTA3,'
      '  PRECIOVENTA4 = :PRECIOVENTA4,'
      '  PORCUTILIDAD1 = :PORCUTILIDAD1,'
      '  PORCUTILIDAD2 = :PORCUTILIDAD2,'
      '  PORCUTILIDAD3 = :PORCUTILIDAD3,'
      '  PORCUTILIDAD4 = :PORCUTILIDAD4,'
      '  USARLEVELPRECIO = :USARLEVELPRECIO,'
      '  CIA_KEY = :CIA_KEY,'
      '  SITUACIONPROD = :SITUACIONPROD,'
      '  APLICAIMPTOCOMPRA = :APLICAIMPTOCOMPRA,'
      '  CODFABRICANTE = :CODFABRICANTE,'
      '  CTAINVENTARIO = :CTAINVENTARIO,'
      '  CTAVENTA = :CTAVENTA,'
      '  CTACOMPRA = :CTACOMPRA,'
      '  CODSUBCATEGORIA = :CODSUBCATEGORIA,'
      '  CODCATEGORIA = :CODCATEGORIA,'
      '  PORCITBIS = :PORCITBIS,'
      '  COD_MONEDA = :COD_MONEDA,'
      '  KILOMETROS = :KILOMETROS,'
      '  RUTAIMAGEN = :RUTAIMAGEN,'
      '  IDTASAITBIS = :IDTASAITBIS,'
      '  PRECIO_ALQUILER = :PRECIO_ALQUILER,'
      '  PAGACOMISION = :PAGACOMISION'
      'where'
      '  CODIGO = :OLD_CODIGO')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_NUM_INV_PROD'
    GeneratorField.ApplyEvent = gamOnPost
    OnFilterRecord = tblInventarioProdFilterRecord
    Left = 112
    Top = 16
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
      DisplayWidth = 80
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
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
      OnValidate = tblInventarioProdPRECIO_COMPRAValidate
      DisplayFormat = ',0.000'
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
    object tblInventarioProdPRECIO_TIPO_UNIDAD: TFloatField
      DisplayLabel = 'PrecioTipoUnidad'
      FieldName = 'PRECIO_TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_TIPO_UNIDAD'
    end
    object tblInventarioProdTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.TIPO_UNIDAD'
    end
    object tblInventarioProdORIGEN: TIntegerField
      FieldName = 'ORIGEN'
      Origin = 'INVENTARIO_PRODUCTO.ORIGEN'
    end
    object tblInventarioProdUBICACION: TIBStringField
      FieldName = 'UBICACION'
      Origin = 'INVENTARIO_PRODUCTO.UBICACION'
      Size = 50
    end
    object tblInventarioProdREFERENCIA_ALTERNA: TIBStringField
      FieldName = 'REFERENCIA_ALTERNA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA_ALTERNA'
      Size = 50
    end
    object tblInventarioProdMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'INVENTARIO_PRODUCTO.MARCA'
      Size = 50
    end
    object tblInventarioProdMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'INVENTARIO_PRODUCTO.MODELO'
      Size = 50
    end
    object tblInventarioProdPRECIOVENTA1: TFloatField
      FieldName = 'PRECIOVENTA1'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA1'
      DisplayFormat = ',0.00'
    end
    object tblInventarioProdPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA2'
      DisplayFormat = ',0.00'
    end
    object tblInventarioProdPRECIOVENTA3: TFloatField
      FieldName = 'PRECIOVENTA3'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA3'
      DisplayFormat = ',0.00'
    end
    object tblInventarioProdPRECIOVENTA4: TFloatField
      FieldName = 'PRECIOVENTA4'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA4'
      DisplayFormat = ',0.00'
    end
    object tblInventarioProdPORCUTILIDAD1: TFloatField
      FieldName = 'PORCUTILIDAD1'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD1'
    end
    object tblInventarioProdPORCUTILIDAD2: TFloatField
      FieldName = 'PORCUTILIDAD2'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD2'
    end
    object tblInventarioProdPORCUTILIDAD3: TFloatField
      FieldName = 'PORCUTILIDAD3'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD3'
    end
    object tblInventarioProdPORCUTILIDAD4: TFloatField
      FieldName = 'PORCUTILIDAD4'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD4'
    end
    object tblInventarioProdUSARLEVELPRECIO: TSmallintField
      FieldName = 'USARLEVELPRECIO'
      Origin = 'INVENTARIO_PRODUCTO.USARLEVELPRECIO'
    end
    object tblInventarioProdCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'INVENTARIO_PRODUCTO.CIA_KEY'
    end
    object tblInventarioProdSITUACIONPROD: TSmallintField
      FieldName = 'SITUACIONPROD'
      Origin = 'INVENTARIO_PRODUCTO.SITUACIONPROD'
    end
    object tblInventarioProdAPLICAIMPTOCOMPRA: TSmallintField
      FieldName = 'APLICAIMPTOCOMPRA'
      Origin = 'INVENTARIO_PRODUCTO.APLICAIMPTOCOMPRA'
    end
    object tblInventarioProdCODFABRICANTE: TIntegerField
      FieldName = 'CODFABRICANTE'
      Origin = 'INVENTARIO_PRODUCTO.CODFABRICANTE'
    end
    object tblInventarioProdCTAINVENTARIO: TIBStringField
      FieldName = 'CTAINVENTARIO'
      Origin = 'INVENTARIO_PRODUCTO.CTAINVENTARIO'
      Size = 7
    end
    object tblInventarioProdCTAVENTA: TIBStringField
      FieldName = 'CTAVENTA'
      Origin = 'INVENTARIO_PRODUCTO.CTAVENTA'
      Size = 7
    end
    object tblInventarioProdCTACOMPRA: TIBStringField
      FieldName = 'CTACOMPRA'
      Origin = 'INVENTARIO_PRODUCTO.CTACOMPRA'
      Size = 7
    end
    object tblInventarioProdCODSUBCATEGORIA: TIntegerField
      FieldName = 'CODSUBCATEGORIA'
      Origin = 'INVENTARIO_PRODUCTO.CODSUBCATEGORIA'
    end
    object tblInventarioProdCODCATEGORIA: TIntegerField
      FieldName = 'CODCATEGORIA'
      Origin = 'INVENTARIO_PRODUCTO.CODCATEGORIA'
    end
    object tblInventarioProdPORCITBIS: TFloatField
      FieldName = 'PORCITBIS'
      Origin = 'INVENTARIO_PRODUCTO.PORCITBIS'
    end
    object tblInventarioProdCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'INVENTARIO_PRODUCTO.COD_MONEDA'
      FixedChar = True
      Size = 1
    end
    object tblInventarioProdKILOMETROS: TFloatField
      FieldName = 'KILOMETROS'
      Origin = 'INVENTARIO_PRODUCTO.KILOMETROS'
    end
    object tblInventarioProdDESCRIPCIONADICIONAL: TMemoField
      FieldName = 'DESCRIPCIONADICIONAL'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCIONADICIONAL'
      BlobType = ftMemo
      Size = 8
    end
    object tblInventarioProdRUTAIMAGEN: TIBStringField
      FieldName = 'RUTAIMAGEN'
      Origin = 'INVENTARIO_PRODUCTO.RUTAIMAGEN'
      Size = 200
    end
    object tblInventarioProdIDTASAITBIS: TSmallintField
      FieldName = 'IDTASAITBIS'
      Origin = 'INVENTARIO_PRODUCTO.IDTASAITBIS'
    end
    object tblInventarioProdPRECIO_ALQUILER: TFloatField
      FieldName = 'PRECIO_ALQUILER'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ALQUILER'
    end
    object tblInventarioProdPAGACOMISION: TSmallintField
      FieldName = 'PAGACOMISION'
      Origin = 'INVENTARIO_PRODUCTO.PAGACOMISION'
    end
    object tblInventarioProdMargen: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Margen'
      DisplayFormat = '%,0.00'
      Calculated = True
    end
  end
  object dsInventarioProd: TDataSource
    AutoEdit = False
    DataSet = tblInventarioProd
    Left = 136
    Top = 88
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
      Size = 80
    end
  end
  object dstblInventarioHistorico: TDataSource
    DataSet = tblInventarioHistorico
    Left = 328
    Top = 96
  end
  object qryConsultaInvActual: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryConsultaInvActualAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      
        'Select BLCE_CANT_ENTRADA, BLCE_CANT_SALIDA, CANTIDAD, CODIGO, DE' +
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
    Left = 336
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
    Left = 432
    Top = 200
  end
  object qryValorEnInventario: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Select '
      'count(codigo) CantidadProductos,  '
      
        'sum(iif(cantidad>0,cantidad,0) * iif(precio>0,precio_compra,0)) ' +
        ' ValorInventario'
      'From inventario_producto'
      'Where cia_key =:ciakey'
      'and  Status = '#39'A'#39)
    Transaction = dmConectar.IBTransaction1
    Left = 176
    Top = 136
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
    Left = 120
    Top = 184
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
    Left = 128
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
    OnFilterRecord = qryProveedoresFilterRecord
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
    object qryProveedoresRNC_PROVEEDOR: TIBStringField
      FieldName = 'RNC_PROVEEDOR'
      Origin = 'PROVEEDORES.RNC_PROVEEDOR'
      Size = 15
    end
    object qryProveedoresCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'PROVEEDORES.CIA_KEY'
    end
  end
  object dsqryProveedores: TDataSource
    DataSet = qryProveedores
    Left = 344
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
    Left = 48
    Top = 360
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
      '  (CODIGO, SERIE, STATUS, STATUS_EQUIPO, CODIGO_CTE)'
      'values'
      '  (:CODIGO, :SERIE, :STATUS, :STATUS_EQUIPO, :CODIGO_CTE)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  SERIE,'
      '  STATUS,'
      '  STATUS_EQUIPO,'
      '  CODIGO_CTE'
      'from INVENTARIO_SERIE '
      'where'
      '  CODIGO = :CODIGO and'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'SELECT r.*, c.NOMBRE_FACTURAR NombreCliente '
      'FROM INVENTARIO_SERIE r'
      'Left Outer Join clientes c  on c.codigo_cte = r.codigo_cte'
      'WHERE r.codigo=:codigo')
    ModifySQL.Strings = (
      'update INVENTARIO_SERIE'
      'set'
      '  CODIGO = :CODIGO,'
      '  SERIE = :SERIE,'
      '  STATUS = :STATUS,'
      '  STATUS_EQUIPO = :STATUS_EQUIPO,'
      '  CODIGO_CTE = :CODIGO_CTE'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  SERIE = :OLD_SERIE')
    Left = 496
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
    object tblInventarioSERIECODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'INVENTARIO_SERIE.CODIGO_CTE'
    end
    object tblInventarioSERIESTATUS_EQUIPO: TSmallintField
      FieldName = 'STATUS_EQUIPO'
      Origin = 'INVENTARIO_SERIE.STATUS_EQUIPO'
    end
    object tblInventarioSERIENOMBRECLIENTE: TIBStringField
      FieldName = 'NOMBRECLIENTE'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
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
    Left = 400
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
      'WHERE FECHA_VENCIMIENTO <= :FECHA'
      'and Cia_key =:ciakey')
    Left = 408
    Top = 368
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ciakey'
        ParamType = ptUnknown
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
    object qryRepInvVencimientoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
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
      'Where i.CODIGO = P.CODIGO'
      'order by DIASVENCIDOS')
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
      Size = 80
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
      'And DIASPORVENCER >=:diasporvencer'
      'and CODIGO_PROV between :codprovini and :codprovfin'
      'ORDER BY P.FECHA_VENCIMIENTO ')
    OnFilterRecord = qryRepProdVenceFilterRecord
    Left = 472
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'diasporvencer'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codprovini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codprovfin'
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
      'and DIASVENCIDOS between :DIASVENCIDOSINI and :diavencidofin'
      'and CODIGO_PROV between :codprovini and :codprovfin'
      'ORDER BY P.FECHA_VENCIMIENTO ')
    OnFilterRecord = qryRepProdVenceFilterRecord
    Left = 480
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DIASVENCIDOSINI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'diavencidofin'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codprovini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codprovfin'
        ParamType = ptInput
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
      'Where i.CODIGO = P.CODIGO'
      'and CODIGO_PROV between :codprovini and :codprovfin'
      'ORDER BY P.FECHA_VENCIMIENTO ')
    OnFilterRecord = qryRepProdVenceFilterRecord
    Left = 496
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codprovini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codprovfin'
        ParamType = ptInput
      end>
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
    Left = 248
    Top = 56
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
    FieldDefs = <
      item
        Name = 'IDUNIDAD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CANTIDAD'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'MONTO_COMISION'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 'UNIDADES'
    Left = 232
    Top = 104
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
    object tblUnidadesMONTO_COMISION: TFloatField
      FieldName = 'MONTO_COMISION'
    end
  end
  object dstblUnidades: TDataSource
    DataSet = tblUnidades
    Left = 232
    Top = 168
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
      
        '  (NUMERO, TIPO_TRN, COD_PROVEEDOR, FECHA, OBSERVACION, STATUS, ' +
        'TIPO_OPE, '
      '   INV_UPD, FECHA_ENTRADA)'
      'values'
      
        '  (:NUMERO, :TIPO_TRN, :COD_PROVEEDOR, :FECHA, :OBSERVACION, :ST' +
        'ATUS, :TIPO_OPE, '
      '   :INV_UPD, :FECHA_ENTRADA)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  TIPO_TRN,'
      '  COD_PROVEEDOR,'
      '  FECHA,'
      '  OBSERVACION,'
      '  STATUS,'
      '  TIPO_OPE,'
      '  INV_UPD,'
      '  FECHA_ENTRADA'
      'from REPARACIONES_MASTER '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select * From REPARACIONES_MASTER'
      'Where fecha between :fechaini and :fechafin'
      'and tipo_ope between :tipoopeini and :tipoopefin')
    ModifySQL.Strings = (
      'update REPARACIONES_MASTER'
      'set'
      '  NUMERO = :NUMERO,'
      '  TIPO_TRN = :TIPO_TRN,'
      '  COD_PROVEEDOR = :COD_PROVEEDOR,'
      '  FECHA = :FECHA,'
      '  OBSERVACION = :OBSERVACION,'
      '  STATUS = :STATUS,'
      '  TIPO_OPE = :TIPO_OPE,'
      '  INV_UPD = :INV_UPD,'
      '  FECHA_ENTRADA = :FECHA_ENTRADA'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_SERIE_REP_MASTER'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 576
    Top = 216
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
    object tblReparacionesMasterTIPO_OPE: TSmallintField
      FieldName = 'TIPO_OPE'
      Origin = 'REPARACIONES_MASTER.TIPO_OPE'
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
    object tblReparacionesMasterINV_UPD: TIBStringField
      FieldName = 'INV_UPD'
      Origin = 'REPARACIONES_MASTER.INV_UPD'
      FixedChar = True
      Size = 1
    end
    object tblReparacionesMasterFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'REPARACIONES_MASTER.FECHA_ENTRADA'
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
      '   FECHA_IN, STATUS, DESCRIPCIONPROBLEMA, CANTIDAD, PRECIO)'
      'values'
      
        '  (:SERIE, :NUMERO, :COD_PRODUCTO, :COD_USUARIO, :MONTO_SERVICIO' +
        ', :INSERTADO_POR, '
      '   :FECHA_IN, :STATUS, :DESCRIPCIONPROBLEMA, :CANTIDAD, :PRECIO)')
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
      '  DESCRIPCIONPROBLEMA,'
      '  CANTIDAD,'
      '  PRECIO'
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
      '  DESCRIPCIONPROBLEMA = :DESCRIPCIONPROBLEMA,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO = :PRECIO'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_REP_DET'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 608
    Top = 264
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
    object tblReparacionesDetCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Origin = 'REPARACIONES_DET.CANTIDAD'
    end
    object tblReparacionesDetPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'REPARACIONES_DET.PRECIO'
    end
  end
  object dstblReparacionesMaster: TDataSource
    DataSet = tblReparacionesMaster
    Left = 272
    Top = 216
  end
  object dstblReparacionesDet: TDataSource
    AutoEdit = False
    DataSet = tblReparacionesDet
    Left = 272
    Top = 264
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
      '       REPARACIONES_MASTER.TIPO_OPE,             '
      '      IIF(REPARACIONES_MASTER.tipo_ope = 1,'#39'Alquiler'#39','
      '      IIF(REPARACIONES_MASTER.tipo_ope = 2,'#39'Lavanderia'#39','
      '      IIF(REPARACIONES_MASTER.tipo_ope = 3,'#39'Costura/Reparar'#39','
      '      IIF(REPARACIONES_MASTER.tipo_ope = 4,'#39'Accesorios'#39','
      '      IIF(REPARACIONES_MASTER.tipo_ope = 6,'#39'Productos'#39','
      '      IIF(REPARACIONES_MASTER.tipo_ope = 7,'#39'Otros'#39','
      
        '      IIF(REPARACIONES_MASTER.tipo_ope = 5,'#39'RMA'#39','#39'UNKNOWN'#39'))))))' +
        ') DescTipopOpe,'
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
    Left = 136
    Top = 336
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
      Size = 80
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
    object qryRepRepMasterTIPO_OPE: TSmallintField
      FieldName = 'TIPO_OPE'
      Origin = 'REPARACIONES_MASTER.TIPO_OPE'
    end
    object qryRepRepMasterDESCTIPOPOPE: TIBStringField
      FieldName = 'DESCTIPOPOPE'
      Required = True
      FixedChar = True
      Size = 15
    end
  end
  object qryRepRepMasterDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select r.*, i.DESCRIPCION desc_producto '
      'From REPARACIONES_DET r'
      'left join inventario_producto i on i.codigo = r.COD_PRODUCTO'
      'where r.numero=:numero')
    Left = 260
    Top = 383
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
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
    object qryRepRepMasterDetCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Origin = 'REPARACIONES_DET.CANTIDAD'
    end
    object qryRepRepMasterDetDESC_PRODUCTO: TIBStringField
      FieldName = 'DESC_PRODUCTO'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
  end
  object qryTipoUnidad: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Proc_GetUnidades(:accion)')
    OnFilterRecord = qryTipoUnidadFilterRecord
    Left = 376
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'accion'
        ParamType = ptInput
      end>
    object qryTipoUnidadIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'PROC_GETUNIDADES.IDUNIDAD'
    end
    object qryTipoUnidadCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'PROC_GETUNIDADES.COD_PRODUCTO'
    end
    object qryTipoUnidadCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PROC_GETUNIDADES.CANTIDAD'
    end
    object qryTipoUnidadDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROC_GETUNIDADES.DESCRIPCION'
      Size = 50
    end
  end
  object dsqryTipoUnidad: TDataSource
    DataSet = qryTipoUnidad
    Left = 584
    Top = 32
  end
  object tblTranInvFisicoPan: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TRAN_INVENTARIO_PAN'
      'where'
      '  ID_TRAN = :OLD_ID_TRAN')
    InsertSQL.Strings = (
      'insert into TRAN_INVENTARIO_PAN'
      
        '  (ID_TRAN, FECHA, CODIGO_PROD, CANT, PRECIO_COMPRA, PRECIO, COD' +
        '_EMPLEADO, '
      '   IN_POR, FECHA_IN, STATUS)'
      'values'
      
        '  (:ID_TRAN, :FECHA, :CODIGO_PROD, :CANT, :PRECIO_COMPRA, :PRECI' +
        'O, :COD_EMPLEADO, '
      '   :IN_POR, :FECHA_IN, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_TRAN,'
      '  FECHA,'
      '  CODIGO_PROD,'
      '  CANT,'
      '  PRECIO_COMPRA,'
      '  PRECIO,'
      '  COD_EMPLEADO,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  STATUS'
      'from TRAN_INVENTARIO_PAN '
      'where'
      '  ID_TRAN = :ID_TRAN')
    SelectSQL.Strings = (
      'Select * from TRAN_INVENTARIO_PAN'
      'Where fecha between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update TRAN_INVENTARIO_PAN'
      'set'
      '  ID_TRAN = :ID_TRAN,'
      '  FECHA = :FECHA,'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  CANT = :CANT,'
      '  PRECIO_COMPRA = :PRECIO_COMPRA,'
      '  PRECIO = :PRECIO,'
      '  COD_EMPLEADO = :COD_EMPLEADO,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  STATUS = :STATUS'
      'where'
      '  ID_TRAN = :OLD_ID_TRAN')
    GeneratorField.Field = 'ID_TRAN'
    GeneratorField.Generator = 'GEN_ID_TRNINVPANFISICO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 200
    object tblTranInvFisicoPanID_TRAN: TIntegerField
      FieldName = 'ID_TRAN'
      Origin = 'TRAN_INVENTARIO_PAN.ID_TRAN'
      Required = True
    end
    object tblTranInvFisicoPanFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'TRAN_INVENTARIO_PAN.FECHA'
    end
    object tblTranInvFisicoPanCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'TRAN_INVENTARIO_PAN.CODIGO_PROD'
    end
    object tblTranInvFisicoPanCANT: TFloatField
      FieldName = 'CANT'
      Origin = 'TRAN_INVENTARIO_PAN.CANT'
    end
    object tblTranInvFisicoPanPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'TRAN_INVENTARIO_PAN.PRECIO_COMPRA'
    end
    object tblTranInvFisicoPanPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'TRAN_INVENTARIO_PAN.PRECIO'
    end
    object tblTranInvFisicoPanCOD_EMPLEADO: TIntegerField
      FieldName = 'COD_EMPLEADO'
      Origin = 'TRAN_INVENTARIO_PAN.COD_EMPLEADO'
    end
    object tblTranInvFisicoPanIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TRAN_INVENTARIO_PAN.IN_POR'
      Size = 12
    end
    object tblTranInvFisicoPanFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TRAN_INVENTARIO_PAN.FECHA_IN'
    end
    object tblTranInvFisicoPanSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TRAN_INVENTARIO_PAN.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dstblTranInvFisicoPan: TDataSource
    DataSet = tblTranInvFisicoPan
    Left = 304
    Top = 8
  end
  object qryInvLookup: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select BLCE_CANT_ENTRADA, BLCE_CANT_SALIDA, CANTIDAD, CODIGO, DE' +
        'SCRIPCION, FECHA_ULTIMA_TRN, PRECIO, '
      'cod_moneda, PRECIO_COMPRA,'
      'PRECIO_ANT  from INVENTARIO_PRODUCTO')
    Left = 376
    Top = 64
    object qryInvLookupBLCE_CANT_ENTRADA: TFloatField
      FieldName = 'BLCE_CANT_ENTRADA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_ENTRADA'
    end
    object qryInvLookupBLCE_CANT_SALIDA: TFloatField
      FieldName = 'BLCE_CANT_SALIDA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_SALIDA'
    end
    object qryInvLookupCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryInvLookupCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInvLookupDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryInvLookupFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN'
    end
    object qryInvLookupPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryInvLookupPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ANT'
    end
    object qryInvLookupCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'INVENTARIO_PRODUCTO.COD_MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryInvLookupPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
  end
  object dsqryInvLookup: TDataSource
    DataSet = qryInvLookup
    Left = 392
    Top = 128
  end
  object tblInvCategoria: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'INVENTARIO_CATEGORIA'
    Left = 608
    Top = 96
    object tblInvCategoriaCODCATEGORIA: TIntegerField
      FieldName = 'CODCATEGORIA'
    end
    object tblInvCategoriaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object tblInvSubCategoria: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'INVENTARIO_SUBCATEGORIA'
    Left = 608
    Top = 144
    object tblInvSubCategoriaCODSUBCATEGORIA: TIntegerField
      FieldName = 'CODSUBCATEGORIA'
    end
    object tblInvSubCategoriaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object dstblInvCategoria: TDataSource
    DataSet = tblInvCategoria
    Left = 680
    Top = 80
  end
  object dstblInvSubCategoria: TDataSource
    DataSet = tblInvSubCategoria
    Left = 680
    Top = 128
  end
  object tblConsignacion_Det: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CONSIGNACION_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into CONSIGNACION_DET'
      
        '  (SERIE, NUMERO, COD_PRODUCTO, COD_USUARIO, MONTO_SERVICIO, INS' +
        'ERTADO_POR, '
      '   FECHA_IN, STATUS, OBSERVACION)'
      'values'
      
        '  (:SERIE, :NUMERO, :COD_PRODUCTO, :COD_USUARIO, :MONTO_SERVICIO' +
        ', :INSERTADO_POR, '
      '   :FECHA_IN, :STATUS, :OBSERVACION)')
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
      '  OBSERVACION'
      'from CONSIGNACION_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * From CONSIGNACION_DET'
      'Where numero=:numero')
    ModifySQL.Strings = (
      'update CONSIGNACION_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  COD_PRODUCTO = :COD_PRODUCTO,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  MONTO_SERVICIO = :MONTO_SERVICIO,'
      '  INSERTADO_POR = :INSERTADO_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  STATUS = :STATUS,'
      '  OBSERVACION = :OBSERVACION'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'gen_serie_cons_det'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 568
    Top = 328
    object tblConsignacion_DetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'CONSIGNACION_DET.SERIE'
      Required = True
    end
    object tblConsignacion_DetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'CONSIGNACION_DET.NUMERO'
      Required = True
    end
    object tblConsignacion_DetCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'CONSIGNACION_DET.COD_PRODUCTO'
      Required = True
    end
    object tblConsignacion_DetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'CONSIGNACION_DET.COD_USUARIO'
    end
    object tblConsignacion_DetMONTO_SERVICIO: TFloatField
      FieldName = 'MONTO_SERVICIO'
      Origin = 'CONSIGNACION_DET.MONTO_SERVICIO'
    end
    object tblConsignacion_DetINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'CONSIGNACION_DET.INSERTADO_POR'
      Size = 12
    end
    object tblConsignacion_DetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'CONSIGNACION_DET.FECHA_IN'
    end
    object tblConsignacion_DetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CONSIGNACION_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblConsignacion_DetOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = 'CONSIGNACION_DET.OBSERVACION'
      BlobType = ftMemo
      Size = 8
    end
  end
  object tblConsignacion_Mast: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblReparacionesMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CONSIGNACION_MASTER'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into CONSIGNACION_MASTER'
      '  (NUMERO, TIPO_TRN, COD_CLIENTE, FECHA, OBSERVACION, STATUS)'
      'values'
      
        '  (:NUMERO, :TIPO_TRN, :COD_CLIENTE, :FECHA, :OBSERVACION, :STAT' +
        'US)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  TIPO_TRN,'
      '  COD_CLIENTE,'
      '  FECHA,'
      '  OBSERVACION,'
      '  STATUS'
      'from CONSIGNACION_MASTER '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select * From CONSIGNACION_MASTER'
      'Where numero=:numero')
    ModifySQL.Strings = (
      'update CONSIGNACION_MASTER'
      'set'
      '  NUMERO = :NUMERO,'
      '  TIPO_TRN = :TIPO_TRN,'
      '  COD_CLIENTE = :COD_CLIENTE,'
      '  FECHA = :FECHA,'
      '  OBSERVACION = :OBSERVACION,'
      '  STATUS = :STATUS'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'gen_numero_cons_master'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 536
    Top = 280
    object tblConsignacion_MastNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'CONSIGNACION_MASTER.NUMERO'
      Required = True
    end
    object tblConsignacion_MastTIPO_TRN: TIntegerField
      FieldName = 'TIPO_TRN'
      Origin = 'CONSIGNACION_MASTER.TIPO_TRN'
      Required = True
    end
    object tblConsignacion_MastCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'CONSIGNACION_MASTER.COD_CLIENTE'
      Required = True
    end
    object tblConsignacion_MastFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'CONSIGNACION_MASTER.FECHA'
    end
    object tblConsignacion_MastOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'CONSIGNACION_MASTER.OBSERVACION'
      Size = 100
    end
    object tblConsignacion_MastSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CONSIGNACION_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryTasa: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *  From MONEDA_DET'
      'Where codigo=:codigo'
      'And :fecha Between fecha_inicial And fecha_final')
    Left = 424
    Top = 32
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end>
    object qryTasaSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'MONEDA_DET.SERIE'
      Required = True
    end
    object qryTasaCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = 'MONEDA_DET.CODIGO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryTasaFECHA_INICIAL: TDateTimeField
      FieldName = 'FECHA_INICIAL'
      Origin = 'MONEDA_DET.FECHA_INICIAL'
      Required = True
    end
    object qryTasaFECHA_FINAL: TDateTimeField
      FieldName = 'FECHA_FINAL'
      Origin = 'MONEDA_DET.FECHA_FINAL'
      Required = True
    end
    object qryTasaVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'MONEDA_DET.VALOR'
    end
  end
  object tblTasaITBIS: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TASA_ITBIS'
      'where'
      '  IDTASAITBIS = :OLD_IDTASAITBIS')
    InsertSQL.Strings = (
      'insert into TASA_ITBIS'
      
        '  (IDTASAITBIS, FECHAINI, FECHAFIN, DESCRIPCION, PORCIENTO, USER' +
        '_IN, USER_MOD, '
      
        '   IN_POR, FECHA_IN, MOD_POR, STATUS, FECHA_UPDATE, SIMBOLO_TASA' +
        ')'
      'values'
      
        '  (:IDTASAITBIS, :FECHAINI, :FECHAFIN, :DESCRIPCION, :PORCIENTO,' +
        ' :USER_IN, '
      
        '   :USER_MOD, :IN_POR, :FECHA_IN, :MOD_POR, :STATUS, :FECHA_UPDA' +
        'TE, :SIMBOLO_TASA)')
    RefreshSQL.Strings = (
      'Select '
      '  IDTASAITBIS,'
      '  FECHAINI,'
      '  FECHAFIN,'
      '  DESCRIPCION,'
      '  PORCIENTO,'
      '  USER_IN,'
      '  USER_MOD,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  STATUS,'
      '  FECHA_UPDATE,'
      '  SIMBOLO_TASA'
      'from TASA_ITBIS '
      'where'
      '  IDTASAITBIS = :IDTASAITBIS')
    SelectSQL.Strings = (
      'select *  from TASA_ITBIS')
    ModifySQL.Strings = (
      'update TASA_ITBIS'
      'set'
      '  IDTASAITBIS = :IDTASAITBIS,'
      '  FECHAINI = :FECHAINI,'
      '  FECHAFIN = :FECHAFIN,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  PORCIENTO = :PORCIENTO,'
      '  USER_IN = :USER_IN,'
      '  USER_MOD = :USER_MOD,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  STATUS = :STATUS,'
      '  FECHA_UPDATE = :FECHA_UPDATE,'
      '  SIMBOLO_TASA = :SIMBOLO_TASA'
      'where'
      '  IDTASAITBIS = :OLD_IDTASAITBIS')
    Left = 664
    Top = 200
    object tblTasaITBISIDTASAITBIS: TSmallintField
      DisplayLabel = 'IDTasa'
      FieldName = 'IDTASAITBIS'
      Origin = 'TASA_ITBIS.IDTASAITBIS'
      Required = True
    end
    object tblTasaITBISFECHAINI: TDateTimeField
      FieldName = 'FECHAINI'
      Origin = 'TASA_ITBIS.FECHAINI'
      Required = True
    end
    object tblTasaITBISFECHAFIN: TDateTimeField
      FieldName = 'FECHAFIN'
      Origin = 'TASA_ITBIS.FECHAFIN'
      Required = True
    end
    object tblTasaITBISPORCIENTO: TFloatField
      FieldName = 'PORCIENTO'
      Origin = 'TASA_ITBIS.PORCIENTO'
    end
    object tblTasaITBISUSER_IN: TIntegerField
      FieldName = 'USER_IN'
      Origin = 'TASA_ITBIS.USER_IN'
    end
    object tblTasaITBISUSER_MOD: TIntegerField
      FieldName = 'USER_MOD'
      Origin = 'TASA_ITBIS.USER_MOD'
    end
    object tblTasaITBISIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'TASA_ITBIS.IN_POR'
      Size = 12
    end
    object tblTasaITBISFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TASA_ITBIS.FECHA_IN'
    end
    object tblTasaITBISMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'TASA_ITBIS.MOD_POR'
      Size = 12
    end
    object tblTasaITBISSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TASA_ITBIS.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblTasaITBISFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'TASA_ITBIS.FECHA_UPDATE'
    end
    object tblTasaITBISDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TASA_ITBIS.DESCRIPCION'
    end
    object tblTasaITBISSIMBOLO_TASA: TIBStringField
      FieldName = 'SIMBOLO_TASA'
      Origin = 'TASA_ITBIS.SIMBOLO_TASA'
      FixedChar = True
      Size = 6
    end
  end
  object tblTasaItbisLookup: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TASA_ITBIS'
    Left = 680
    Top = 288
    object tblTasaItbisLookupIDTASAITBIS: TSmallintField
      FieldName = 'IDTASAITBIS'
    end
    object tblTasaItbisLookupFECHAINI: TDateTimeField
      FieldName = 'FECHAINI'
    end
    object tblTasaItbisLookupFECHAFIN: TDateTimeField
      FieldName = 'FECHAFIN'
    end
    object tblTasaItbisLookupPORCIENTO: TFloatField
      FieldName = 'PORCIENTO'
    end
    object tblTasaItbisLookupUSER_IN: TIntegerField
      FieldName = 'USER_IN'
    end
    object tblTasaItbisLookupUSER_MOD: TIntegerField
      FieldName = 'USER_MOD'
    end
    object tblTasaItbisLookupIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Size = 12
    end
    object tblTasaItbisLookupFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
    end
    object tblTasaItbisLookupMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Size = 12
    end
    object tblTasaItbisLookupSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object tblTasaItbisLookupFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
    end
    object tblTasaItbisLookupDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
    end
  end
  object tblAlquilerMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblAlquilerMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from ALQUILER_MASTER'
      'where'
      '  IDSERIE = :OLD_IDSERIE')
    InsertSQL.Strings = (
      'insert into ALQUILER_MASTER'
      
        '  (IDSERIE, TIPOTRN, FECHA, FECHA_ENTRADA, FECHA_ENT_ESTIMADA, C' +
        'OD_CLIENTE, '
      
        '   NUMERO_FACTURA, OBSERVACION, STATUS, FECHA_IN, IN_POR, FECHA_' +
        'MOD, MOD_POR, '
      
        '   CODIGO_USUARIO, NUM_TRNVENTA, TIPO_OPE, INV_UPD, COD_PROD_ALQ' +
        ', MONEDA)'
      'values'
      
        '  (:IDSERIE, :TIPOTRN, :FECHA, :FECHA_ENTRADA, :FECHA_ENT_ESTIMA' +
        'DA, :COD_CLIENTE, '
      
        '   :NUMERO_FACTURA, :OBSERVACION, :STATUS, :FECHA_IN, :IN_POR, :' +
        'FECHA_MOD, '
      
        '   :MOD_POR, :CODIGO_USUARIO, :NUM_TRNVENTA, :TIPO_OPE, :INV_UPD' +
        ', :COD_PROD_ALQ, '
      '   :MONEDA)')
    RefreshSQL.Strings = (
      'Select '
      '  IDSERIE,'
      '  TIPOTRN,'
      '  FECHA,'
      '  FECHA_ENTRADA,'
      '  FECHA_ENT_ESTIMADA,'
      '  COD_CLIENTE,'
      '  NUMERO_FACTURA,'
      '  MONTO_TOTAL,'
      '  OBSERVACION,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  CODIGO_USUARIO,'
      '  NUM_TRNVENTA,'
      '  TIPO_OPE,'
      '  INV_UPD,'
      '  COD_PROD_ALQ,'
      '  MONEDA'
      'from ALQUILER_MASTER '
      'where'
      '  IDSERIE = :IDSERIE')
    SelectSQL.Strings = (
      'Select *  from ALQUILER_MASTER'
      'Where Fecha between :fechaini and :fechafin'
      'and tipotrn between :tipotrnini and :tipotrnfin')
    ModifySQL.Strings = (
      'update ALQUILER_MASTER'
      'set'
      '  IDSERIE = :IDSERIE,'
      '  TIPOTRN = :TIPOTRN,'
      '  FECHA = :FECHA,'
      '  FECHA_ENTRADA = :FECHA_ENTRADA,'
      '  FECHA_ENT_ESTIMADA = :FECHA_ENT_ESTIMADA,'
      '  COD_CLIENTE = :COD_CLIENTE,'
      '  NUMERO_FACTURA = :NUMERO_FACTURA,'
      '  OBSERVACION = :OBSERVACION,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  CODIGO_USUARIO = :CODIGO_USUARIO,'
      '  NUM_TRNVENTA = :NUM_TRNVENTA,'
      '  TIPO_OPE = :TIPO_OPE,'
      '  INV_UPD = :INV_UPD,'
      '  COD_PROD_ALQ = :COD_PROD_ALQ,'
      '  MONEDA = :MONEDA'
      'where'
      '  IDSERIE = :OLD_IDSERIE')
    GeneratorField.Field = 'IDSERIE'
    GeneratorField.Generator = 'GEN_SERIEALQMASTER'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 584
    Top = 384
    object tblAlquilerMasterIDSERIE: TIntegerField
      FieldName = 'IDSERIE'
      Origin = 'ALQUILER_MASTER.IDSERIE'
      Required = True
    end
    object tblAlquilerMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ALQUILER_MASTER.FECHA'
      Required = True
    end
    object tblAlquilerMasterTIPO_OPE: TSmallintField
      FieldName = 'TIPO_OPE'
      Origin = 'ALQUILER_MASTER.TIPO_OPE'
    end
    object tblAlquilerMasterTIPOTRN: TSmallintField
      FieldName = 'TIPOTRN'
      Origin = 'ALQUILER_MASTER.TIPOTRN'
      Required = True
    end
    object tblAlquilerMasterFECHA_ENT_ESTIMADA: TDateTimeField
      FieldName = 'FECHA_ENT_ESTIMADA'
      Origin = 'ALQUILER_MASTER.FECHA_ENT_ESTIMADA'
    end
    object tblAlquilerMasterFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'ALQUILER_MASTER.FECHA_ENTRADA'
    end
    object tblAlquilerMasterCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'ALQUILER_MASTER.COD_CLIENTE'
      Required = True
    end
    object tblAlquilerMasterNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'ALQUILER_MASTER.NUMERO_FACTURA'
    end
    object tblAlquilerMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ALQUILER_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblAlquilerMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ALQUILER_MASTER.FECHA_IN'
    end
    object tblAlquilerMasterIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ALQUILER_MASTER.IN_POR'
      Size = 12
    end
    object tblAlquilerMasterFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'ALQUILER_MASTER.FECHA_MOD'
    end
    object tblAlquilerMasterMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'ALQUILER_MASTER.MOD_POR'
      Size = 12
    end
    object tblAlquilerMasterCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'ALQUILER_MASTER.CODIGO_USUARIO'
    end
    object tblAlquilerMasterOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = 'ALQUILER_MASTER.OBSERVACION'
      BlobType = ftMemo
      Size = 8
    end
    object tblAlquilerMasterMONTO_TOTAL: TFloatField
      FieldName = 'MONTO_TOTAL'
      Origin = 'ALQUILER_MASTER.MONTO_TOTAL'
      DisplayFormat = ',0.00'
    end
    object tblAlquilerMasterNUM_TRNVENTA: TIntegerField
      FieldName = 'NUM_TRNVENTA'
      Origin = 'ALQUILER_MASTER.NUM_TRNVENTA'
    end
    object tblAlquilerMasterINV_UPD: TIBStringField
      FieldName = 'INV_UPD'
      Origin = 'ALQUILER_MASTER.INV_UPD'
      FixedChar = True
      Size = 1
    end
    object tblAlquilerMasterCOD_PROD_ALQ: TIntegerField
      FieldName = 'COD_PROD_ALQ'
      Origin = 'ALQUILER_MASTER.COD_PROD_ALQ'
    end
    object tblAlquilerMasterMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'ALQUILER_MASTER.MONEDA'
      FixedChar = True
      Size = 1
    end
  end
  object tblAlquilerDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BeforePost = tblAlquilerDetBeforePost
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from ALQUILER_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into ALQUILER_DET'
      
        '  (SERIE, IDSERIE, COD_PRODUCTO, SERIE_TRN, STATUS, FECHA_IN, IN' +
        '_POR, FECHA_MOD, '
      
        '   MOD_POR, CODIGO_USUARIO, CANT_DIAS, PRECIO_XDIA, MONTO, DESCR' +
        'IPCIONSERVICIO, '
      '   PORC_SEGURO, CANTIDAD, VALOR_TASA, MONEDA, MONTO_DEPOSITO)'
      'values'
      
        '  (:SERIE, :IDSERIE, :COD_PRODUCTO, :SERIE_TRN, :STATUS, :FECHA_' +
        'IN, :IN_POR, '
      
        '   :FECHA_MOD, :MOD_POR, :CODIGO_USUARIO, :CANT_DIAS, :PRECIO_XD' +
        'IA, :MONTO, '
      
        '   :DESCRIPCIONSERVICIO, :PORC_SEGURO, :CANTIDAD, :VALOR_TASA, :' +
        'MONEDA, '
      '   :MONTO_DEPOSITO)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  IDSERIE,'
      '  COD_PRODUCTO,'
      '  SERIE_TRN,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  CODIGO_USUARIO,'
      '  CANT_DIAS,'
      '  PRECIO_XDIA,'
      '  MONTO,'
      '  DESCRIPCIONSERVICIO,'
      '  PORC_SEGURO,'
      '  MONTO_SEGURO,'
      '  CANTIDAD,'
      '  VALOR_TASA,'
      '  MONEDA,'
      '  MONTO_DEPOSITO'
      'from ALQUILER_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select *  from ALQUILER_DET'
      'where idserie =:idserie')
    ModifySQL.Strings = (
      'update ALQUILER_DET'
      'set'
      '  SERIE = :SERIE,'
      '  IDSERIE = :IDSERIE,'
      '  COD_PRODUCTO = :COD_PRODUCTO,'
      '  SERIE_TRN = :SERIE_TRN,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  CODIGO_USUARIO = :CODIGO_USUARIO,'
      '  CANT_DIAS = :CANT_DIAS,'
      '  PRECIO_XDIA = :PRECIO_XDIA,'
      '  MONTO = :MONTO,'
      '  DESCRIPCIONSERVICIO = :DESCRIPCIONSERVICIO,'
      '  PORC_SEGURO = :PORC_SEGURO,'
      '  CANTIDAD = :CANTIDAD,'
      '  VALOR_TASA = :VALOR_TASA,'
      '  MONEDA = :MONEDA,'
      '  MONTO_DEPOSITO = :MONTO_DEPOSITO'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_ALQ_DET'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 672
    Top = 344
    object tblAlquilerDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'ALQUILER_DET.SERIE'
      Required = True
    end
    object tblAlquilerDetIDSERIE: TIntegerField
      FieldName = 'IDSERIE'
      Origin = 'ALQUILER_DET.IDSERIE'
      Required = True
    end
    object tblAlquilerDetCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'ALQUILER_DET.COD_PRODUCTO'
    end
    object tblAlquilerDetSERIE_TRN: TIntegerField
      FieldName = 'SERIE_TRN'
      Origin = 'ALQUILER_DET.SERIE_TRN'
    end
    object tblAlquilerDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ALQUILER_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblAlquilerDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ALQUILER_DET.FECHA_IN'
    end
    object tblAlquilerDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ALQUILER_DET.IN_POR'
      Size = 12
    end
    object tblAlquilerDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'ALQUILER_DET.FECHA_MOD'
    end
    object tblAlquilerDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'ALQUILER_DET.MOD_POR'
      Size = 12
    end
    object tblAlquilerDetCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'ALQUILER_DET.CODIGO_USUARIO'
    end
    object tblAlquilerDetCANT_DIAS: TFloatField
      FieldName = 'CANT_DIAS'
      Origin = 'ALQUILER_DET.CANT_DIAS'
    end
    object tblAlquilerDetMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'ALQUILER_DET.MONTO'
    end
    object tblAlquilerDetDESCRIPCIONSERVICIO: TMemoField
      FieldName = 'DESCRIPCIONSERVICIO'
      Origin = 'ALQUILER_DET.DESCRIPCIONSERVICIO'
      BlobType = ftMemo
      Size = 8
    end
    object tblAlquilerDetPRECIO_XDIA: TFloatField
      FieldName = 'PRECIO_XDIA'
      Origin = 'ALQUILER_DET.PRECIO_XDIA'
      EditFormat = ',0.00'
    end
    object tblAlquilerDetPORC_SEGURO: TFloatField
      FieldName = 'PORC_SEGURO'
      Origin = 'ALQUILER_DET.PORC_SEGURO'
      EditFormat = ',0.00'
    end
    object tblAlquilerDetMONTO_SEGURO: TFloatField
      FieldName = 'MONTO_SEGURO'
      Origin = 'ALQUILER_DET.MONTO_SEGURO'
    end
    object tblAlquilerDetCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Origin = 'ALQUILER_DET.CANTIDAD'
    end
    object tblAlquilerDetVALOR_TASA: TFloatField
      FieldName = 'VALOR_TASA'
      Origin = 'ALQUILER_DET.VALOR_TASA'
    end
    object tblAlquilerDetMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'ALQUILER_DET.MONEDA'
      FixedChar = True
      Size = 1
    end
    object tblAlquilerDetMONTO_DEPOSITO: TFloatField
      FieldName = 'MONTO_DEPOSITO'
      Origin = 'ALQUILER_DET.MONTO_DEPOSITO'
    end
  end
  object dstblAlquilerDet: TDataSource
    DataSet = tblAlquilerDet
    Left = 664
    Top = 408
  end
  object dstblAlquilerMaster: TDataSource
    DataSet = tblAlquilerMaster
    Left = 488
    Top = 400
  end
  object qryRepAlquilerMaster: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepAlquilerMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  CLIENTES.NOMBRE_CTE DESCRIPCION,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.PAIS,'
      '  CLIENTES.CONTACTO,'
      '  TIPO_TRN.DESCRIPCION TIPO_TRNDESC,'
      '  ALQUILER_MASTER.IDSERIE,'
      '  ALQUILER_MASTER.FECHA,'
      '  ALQUILER_MASTER.TIPOTRN,'
      '  ALQUILER_MASTER.COD_CLIENTE,'
      '  ALQUILER_MASTER.NUMERO_FACTURA,'
      '  ALQUILER_MASTER.STATUS,'
      '  ALQUILER_MASTER.CODIGO_USUARIO,'
      '  ALQUILER_MASTER.MONTO_TOTAL'
      'FROM'
      '  ALQUILER_MASTER'
      
        '  INNER JOIN CLIENTES ON (ALQUILER_MASTER.COD_CLIENTE = CLIENTES' +
        '.CODIGO_CTE)'
      
        '  INNER JOIN TIPO_TRN ON (ALQUILER_MASTER.TIPOTRN = TIPO_TRN.COD' +
        'IGO)'
      'WHERE   ALQUILER_MASTER.IDSERIE =:idserie')
    Left = 576
    Top = 440
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idserie'
        ParamType = ptInput
      end>
    object qryRepAlquilerMasterTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryRepAlquilerMasterDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryRepAlquilerMasterCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryRepAlquilerMasterPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryRepAlquilerMasterCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'CLIENTES.CONTACTO'
      Size = 30
    end
    object qryRepAlquilerMasterTIPO_TRNDESC: TIBStringField
      FieldName = 'TIPO_TRNDESC'
      Origin = 'TIPO_TRN.DESCRIPCION'
      Size = 30
    end
    object qryRepAlquilerMasterIDSERIE: TIntegerField
      FieldName = 'IDSERIE'
      Origin = 'ALQUILER_MASTER.IDSERIE'
      Required = True
    end
    object qryRepAlquilerMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ALQUILER_MASTER.FECHA'
      Required = True
    end
    object qryRepAlquilerMasterTIPOTRN: TSmallintField
      FieldName = 'TIPOTRN'
      Origin = 'ALQUILER_MASTER.TIPOTRN'
      Required = True
    end
    object qryRepAlquilerMasterCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'ALQUILER_MASTER.COD_CLIENTE'
      Required = True
    end
    object qryRepAlquilerMasterNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'ALQUILER_MASTER.NUMERO_FACTURA'
    end
    object qryRepAlquilerMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ALQUILER_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepAlquilerMasterCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'ALQUILER_MASTER.CODIGO_USUARIO'
    end
    object qryRepAlquilerMasterMONTO_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'MONTO_TOTAL'
      Origin = 'ALQUILER_MASTER.MONTO_TOTAL'
      ReadOnly = True
    end
    object qryRepAlquilerMasterDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
  end
  object qryRepAlquilerDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select i.DESCRIPCION desc_producto, d.*'
      'From  ALQUILER_DET d, INVENTARIO_PRODUCTO i'
      'Where i.CODIGO = d.COD_PRODUCTO'
      'and idserie =:idserie')
    Left = 656
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idserie'
        ParamType = ptUnknown
      end>
    object qryRepAlquilerDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'ALQUILER_DET.SERIE'
      Required = True
    end
    object qryRepAlquilerDetIDSERIE: TIntegerField
      FieldName = 'IDSERIE'
      Origin = 'ALQUILER_DET.IDSERIE'
      Required = True
    end
    object qryRepAlquilerDetCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'ALQUILER_DET.COD_PRODUCTO'
    end
    object qryRepAlquilerDetSERIE_TRN: TIntegerField
      FieldName = 'SERIE_TRN'
      Origin = 'ALQUILER_DET.SERIE_TRN'
      Required = True
    end
    object qryRepAlquilerDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ALQUILER_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRepAlquilerDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ALQUILER_DET.FECHA_IN'
    end
    object qryRepAlquilerDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ALQUILER_DET.IN_POR'
      Size = 12
    end
    object qryRepAlquilerDetFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'ALQUILER_DET.FECHA_MOD'
    end
    object qryRepAlquilerDetMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'ALQUILER_DET.MOD_POR'
      Size = 12
    end
    object qryRepAlquilerDetCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'ALQUILER_DET.CODIGO_USUARIO'
    end
    object qryRepAlquilerDetCANT_DIAS: TFloatField
      FieldName = 'CANT_DIAS'
      Origin = 'ALQUILER_DET.CANT_DIAS'
    end
    object qryRepAlquilerDetMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'ALQUILER_DET.MONTO'
    end
    object qryRepAlquilerDetMONTO_SEGURO: TFloatField
      FieldName = 'MONTO_SEGURO'
      Origin = 'ALQUILER_DET.MONTO_SEGURO'
    end
    object qryRepAlquilerDetDESCRIPCIONSERVICIO: TMemoField
      FieldName = 'DESCRIPCIONSERVICIO'
      Origin = 'ALQUILER_DET.DESCRIPCIONSERVICIO'
      BlobType = ftMemo
      Size = 8
    end
    object qryRepAlquilerDetPRECIO_XDIA: TFloatField
      FieldName = 'PRECIO_XDIA'
      Origin = 'ALQUILER_DET.PRECIO_XDIA'
    end
    object qryRepAlquilerDetPORC_SEGURO: TFloatField
      FieldName = 'PORC_SEGURO'
      Origin = 'ALQUILER_DET.PORC_SEGURO'
    end
    object qryRepAlquilerDetDESC_PRODUCTO: TIBStringField
      FieldName = 'DESC_PRODUCTO'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryRepAlquilerDetCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Origin = 'ALQUILER_DET.CANTIDAD'
    end
    object qryRepAlquilerDetVALOR_TASA: TFloatField
      FieldName = 'VALOR_TASA'
      Origin = 'ALQUILER_DET.VALOR_TASA'
    end
    object qryRepAlquilerDetMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'ALQUILER_DET.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryRepAlquilerDetMONTO_DEPOSITO: TFloatField
      FieldName = 'MONTO_DEPOSITO'
      Origin = 'ALQUILER_DET.MONTO_DEPOSITO'
    end
  end
  object qryInventario: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From INVENTARIO_PRODUCTO')
    Left = 232
    Top = 432
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
      Size = 80
    end
    object qryInventarioDESCRIPCIONADICIONAL: TMemoField
      FieldName = 'DESCRIPCIONADICIONAL'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCIONADICIONAL'
      BlobType = ftMemo
      Size = 8
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
    object qryInventarioBLCE_CANT_ENTRADA: TFloatField
      FieldName = 'BLCE_CANT_ENTRADA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_ENTRADA'
    end
    object qryInventarioBLCE_CANT_SALIDA: TFloatField
      FieldName = 'BLCE_CANT_SALIDA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_SALIDA'
    end
    object qryInventarioFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN'
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
    object qryInventarioFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'INVENTARIO_PRODUCTO.FOTO'
      Size = 8
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
    object qryInventarioPRECIOVENTA1: TFloatField
      FieldName = 'PRECIOVENTA1'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA1'
    end
    object qryInventarioPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA2'
    end
    object qryInventarioPRECIOVENTA3: TFloatField
      FieldName = 'PRECIOVENTA3'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA3'
    end
    object qryInventarioPRECIOVENTA4: TFloatField
      FieldName = 'PRECIOVENTA4'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA4'
    end
    object qryInventarioPORCUTILIDAD1: TFloatField
      FieldName = 'PORCUTILIDAD1'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD1'
    end
    object qryInventarioPORCUTILIDAD2: TFloatField
      FieldName = 'PORCUTILIDAD2'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD2'
    end
    object qryInventarioPORCUTILIDAD3: TFloatField
      FieldName = 'PORCUTILIDAD3'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD3'
    end
    object qryInventarioPORCUTILIDAD4: TFloatField
      FieldName = 'PORCUTILIDAD4'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD4'
    end
    object qryInventarioUSARLEVELPRECIO: TSmallintField
      FieldName = 'USARLEVELPRECIO'
      Origin = 'INVENTARIO_PRODUCTO.USARLEVELPRECIO'
    end
    object qryInventarioCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'INVENTARIO_PRODUCTO.CIA_KEY'
    end
    object qryInventarioSITUACIONPROD: TSmallintField
      FieldName = 'SITUACIONPROD'
      Origin = 'INVENTARIO_PRODUCTO.SITUACIONPROD'
    end
    object qryInventarioAPLICAIMPTOCOMPRA: TSmallintField
      FieldName = 'APLICAIMPTOCOMPRA'
      Origin = 'INVENTARIO_PRODUCTO.APLICAIMPTOCOMPRA'
    end
    object qryInventarioCODFABRICANTE: TIntegerField
      FieldName = 'CODFABRICANTE'
      Origin = 'INVENTARIO_PRODUCTO.CODFABRICANTE'
    end
    object qryInventarioCTAINVENTARIO: TIBStringField
      FieldName = 'CTAINVENTARIO'
      Origin = 'INVENTARIO_PRODUCTO.CTAINVENTARIO'
      Size = 7
    end
    object qryInventarioCTAVENTA: TIBStringField
      FieldName = 'CTAVENTA'
      Origin = 'INVENTARIO_PRODUCTO.CTAVENTA'
      Size = 7
    end
    object qryInventarioCTACOMPRA: TIBStringField
      FieldName = 'CTACOMPRA'
      Origin = 'INVENTARIO_PRODUCTO.CTACOMPRA'
      Size = 7
    end
    object qryInventarioCODSUBCATEGORIA: TIntegerField
      FieldName = 'CODSUBCATEGORIA'
      Origin = 'INVENTARIO_PRODUCTO.CODSUBCATEGORIA'
    end
    object qryInventarioCODCATEGORIA: TIntegerField
      FieldName = 'CODCATEGORIA'
      Origin = 'INVENTARIO_PRODUCTO.CODCATEGORIA'
    end
    object qryInventarioPORCITBIS: TFloatField
      FieldName = 'PORCITBIS'
      Origin = 'INVENTARIO_PRODUCTO.PORCITBIS'
    end
    object qryInventarioCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'INVENTARIO_PRODUCTO.COD_MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryInventarioKILOMETROS: TFloatField
      FieldName = 'KILOMETROS'
      Origin = 'INVENTARIO_PRODUCTO.KILOMETROS'
    end
    object qryInventarioRUTAIMAGEN: TIBStringField
      FieldName = 'RUTAIMAGEN'
      Origin = 'INVENTARIO_PRODUCTO.RUTAIMAGEN'
      Size = 200
    end
    object qryInventarioIDTASAITBIS: TSmallintField
      FieldName = 'IDTASAITBIS'
      Origin = 'INVENTARIO_PRODUCTO.IDTASAITBIS'
    end
    object qryInventarioPRECIO_ALQUILER: TFloatField
      FieldName = 'PRECIO_ALQUILER'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ALQUILER'
    end
  end
  object qryInvAlquiler: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From INVENTARIO_PRODUCTO'
      'Where PRECIO_ALQUILER >0')
    Left = 56
    Top = 400
    object qryInvAlquilerCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInvAlquilerCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_TEXTO'
      Size = 40
    end
    object qryInvAlquilerFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'INVENTARIO_PRODUCTO.FECHA'
    end
    object qryInvAlquilerCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_BARRA'
      Size = 40
    end
    object qryInvAlquilerTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object qryInvAlquilerDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryInvAlquilerDESCRIPCIONADICIONAL: TMemoField
      FieldName = 'DESCRIPCIONADICIONAL'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCIONADICIONAL'
      BlobType = ftMemo
      Size = 8
    end
    object qryInvAlquilerCANTIDAD_REORDEN: TIntegerField
      FieldName = 'CANTIDAD_REORDEN'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD_REORDEN'
    end
    object qryInvAlquilerPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ANT'
    end
    object qryInvAlquilerCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryInvAlquilerPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryInvAlquilerBLCE_CANT_ENTRADA: TFloatField
      FieldName = 'BLCE_CANT_ENTRADA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_ENTRADA'
    end
    object qryInvAlquilerBLCE_CANT_SALIDA: TFloatField
      FieldName = 'BLCE_CANT_SALIDA'
      Origin = 'INVENTARIO_PRODUCTO.BLCE_CANT_SALIDA'
    end
    object qryInvAlquilerFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN'
    end
    object qryInvAlquilerSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'INVENTARIO_PRODUCTO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryInvAlquilerPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'INVENTARIO_PRODUCTO.PORC_DESCUENTO'
    end
    object qryInvAlquilerFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'INVENTARIO_PRODUCTO.FOTO'
      Size = 8
    end
    object qryInvAlquilerPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'INVENTARIO_PRODUCTO.PAGA_ITBI'
    end
    object qryInvAlquilerCODIGO_PRECIO: TIBStringField
      FieldName = 'CODIGO_PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO_PRECIO'
      FixedChar = True
      Size = 6
    end
    object qryInvAlquilerUNIDAD: TFloatField
      FieldName = 'UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.UNIDAD'
    end
    object qryInvAlquilerPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
    object qryInvAlquilerPRECIO_MINIMO: TFloatField
      FieldName = 'PRECIO_MINIMO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_MINIMO'
    end
    object qryInvAlquilerREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA'
      Size = 50
    end
    object qryInvAlquilerFECHA_VENCIMIENTO: TDateTimeField
      FieldName = 'FECHA_VENCIMIENTO'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_VENCIMIENTO'
    end
    object qryInvAlquilerINVENTARIAR: TSmallintField
      FieldName = 'INVENTARIAR'
      Origin = 'INVENTARIO_PRODUCTO.INVENTARIAR'
    end
    object qryInvAlquilerPRECIO_TIPO_UNIDAD: TFloatField
      FieldName = 'PRECIO_TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_TIPO_UNIDAD'
    end
    object qryInvAlquilerTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'INVENTARIO_PRODUCTO.TIPO_UNIDAD'
    end
    object qryInvAlquilerORIGEN: TIntegerField
      FieldName = 'ORIGEN'
      Origin = 'INVENTARIO_PRODUCTO.ORIGEN'
    end
    object qryInvAlquilerUBICACION: TIBStringField
      FieldName = 'UBICACION'
      Origin = 'INVENTARIO_PRODUCTO.UBICACION'
      Size = 50
    end
    object qryInvAlquilerREFERENCIA_ALTERNA: TIBStringField
      FieldName = 'REFERENCIA_ALTERNA'
      Origin = 'INVENTARIO_PRODUCTO.REFERENCIA_ALTERNA'
      Size = 50
    end
    object qryInvAlquilerMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'INVENTARIO_PRODUCTO.MARCA'
      Size = 50
    end
    object qryInvAlquilerMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'INVENTARIO_PRODUCTO.MODELO'
      Size = 50
    end
    object qryInvAlquilerPRECIOVENTA1: TFloatField
      FieldName = 'PRECIOVENTA1'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA1'
    end
    object qryInvAlquilerPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA2'
    end
    object qryInvAlquilerPRECIOVENTA3: TFloatField
      FieldName = 'PRECIOVENTA3'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA3'
    end
    object qryInvAlquilerPRECIOVENTA4: TFloatField
      FieldName = 'PRECIOVENTA4'
      Origin = 'INVENTARIO_PRODUCTO.PRECIOVENTA4'
    end
    object qryInvAlquilerPORCUTILIDAD1: TFloatField
      FieldName = 'PORCUTILIDAD1'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD1'
    end
    object qryInvAlquilerPORCUTILIDAD2: TFloatField
      FieldName = 'PORCUTILIDAD2'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD2'
    end
    object qryInvAlquilerPORCUTILIDAD3: TFloatField
      FieldName = 'PORCUTILIDAD3'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD3'
    end
    object qryInvAlquilerPORCUTILIDAD4: TFloatField
      FieldName = 'PORCUTILIDAD4'
      Origin = 'INVENTARIO_PRODUCTO.PORCUTILIDAD4'
    end
    object qryInvAlquilerUSARLEVELPRECIO: TSmallintField
      FieldName = 'USARLEVELPRECIO'
      Origin = 'INVENTARIO_PRODUCTO.USARLEVELPRECIO'
    end
    object qryInvAlquilerCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'INVENTARIO_PRODUCTO.CIA_KEY'
    end
    object qryInvAlquilerSITUACIONPROD: TSmallintField
      FieldName = 'SITUACIONPROD'
      Origin = 'INVENTARIO_PRODUCTO.SITUACIONPROD'
    end
    object qryInvAlquilerAPLICAIMPTOCOMPRA: TSmallintField
      FieldName = 'APLICAIMPTOCOMPRA'
      Origin = 'INVENTARIO_PRODUCTO.APLICAIMPTOCOMPRA'
    end
    object qryInvAlquilerCODFABRICANTE: TIntegerField
      FieldName = 'CODFABRICANTE'
      Origin = 'INVENTARIO_PRODUCTO.CODFABRICANTE'
    end
    object qryInvAlquilerCTAINVENTARIO: TIBStringField
      FieldName = 'CTAINVENTARIO'
      Origin = 'INVENTARIO_PRODUCTO.CTAINVENTARIO'
      Size = 7
    end
    object qryInvAlquilerCTAVENTA: TIBStringField
      FieldName = 'CTAVENTA'
      Origin = 'INVENTARIO_PRODUCTO.CTAVENTA'
      Size = 7
    end
    object qryInvAlquilerCTACOMPRA: TIBStringField
      FieldName = 'CTACOMPRA'
      Origin = 'INVENTARIO_PRODUCTO.CTACOMPRA'
      Size = 7
    end
    object qryInvAlquilerCODSUBCATEGORIA: TIntegerField
      FieldName = 'CODSUBCATEGORIA'
      Origin = 'INVENTARIO_PRODUCTO.CODSUBCATEGORIA'
    end
    object qryInvAlquilerCODCATEGORIA: TIntegerField
      FieldName = 'CODCATEGORIA'
      Origin = 'INVENTARIO_PRODUCTO.CODCATEGORIA'
    end
    object qryInvAlquilerPORCITBIS: TFloatField
      FieldName = 'PORCITBIS'
      Origin = 'INVENTARIO_PRODUCTO.PORCITBIS'
    end
    object qryInvAlquilerCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'INVENTARIO_PRODUCTO.COD_MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryInvAlquilerKILOMETROS: TFloatField
      FieldName = 'KILOMETROS'
      Origin = 'INVENTARIO_PRODUCTO.KILOMETROS'
    end
    object qryInvAlquilerRUTAIMAGEN: TIBStringField
      FieldName = 'RUTAIMAGEN'
      Origin = 'INVENTARIO_PRODUCTO.RUTAIMAGEN'
      Size = 200
    end
    object qryInvAlquilerIDTASAITBIS: TSmallintField
      FieldName = 'IDTASAITBIS'
      Origin = 'INVENTARIO_PRODUCTO.IDTASAITBIS'
    end
    object qryInvAlquilerPRECIO_ALQUILER: TFloatField
      FieldName = 'PRECIO_ALQUILER'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ALQUILER'
    end
  end
  object dsqryInvAlquiler: TDataSource
    DataSet = qryInvAlquiler
    Left = 144
    Top = 400
  end
  object tblPrecioUnidadXNivel: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PRECIO_UNIDADSURTIDORA'
      'where'
      '  IDUNIDAD = :OLD_IDUNIDAD and'
      '  COD_PRODUCTO = :OLD_COD_PRODUCTO')
    InsertSQL.Strings = (
      'insert into PRECIO_UNIDADSURTIDORA'
      
        '  (IDUNIDAD, DESCRIPCION, COD_PRODUCTO, CANTIDAD, PRECIOVENTA1, ' +
        'PRECIOVENTA2, '
      
        '   PRECIOVENTA3, PRECIOVENTA4, PORCUTILIDAD1, PORCUTILIDAD2, POR' +
        'CUTILIDAD3, '
      
        '   PORCUTILIDAD4, COD_USUARIO_IN, COD_USUARIO_UPD, FECHA_IN, IN_' +
        'POR, FECHA_MOD, '
      '   MOD_POR)'
      'values'
      
        '  (:IDUNIDAD, :DESCRIPCION, :COD_PRODUCTO, :CANTIDAD, :PRECIOVEN' +
        'TA1, :PRECIOVENTA2, '
      
        '   :PRECIOVENTA3, :PRECIOVENTA4, :PORCUTILIDAD1, :PORCUTILIDAD2,' +
        ' :PORCUTILIDAD3, '
      
        '   :PORCUTILIDAD4, :COD_USUARIO_IN, :COD_USUARIO_UPD, :FECHA_IN,' +
        ' :IN_POR, '
      '   :FECHA_MOD, :MOD_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  IDUNIDAD,'
      '  DESCRIPCION,'
      '  COD_PRODUCTO,'
      '  CANTIDAD,'
      '  PRECIOVENTA1,'
      '  PRECIOVENTA2,'
      '  PRECIOVENTA3,'
      '  PRECIOVENTA4,'
      '  PORCUTILIDAD1,'
      '  PORCUTILIDAD2,'
      '  PORCUTILIDAD3,'
      '  PORCUTILIDAD4,'
      '  COD_USUARIO_IN,'
      '  COD_USUARIO_UPD,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from PRECIO_UNIDADSURTIDORA '
      'where'
      '  IDUNIDAD = :IDUNIDAD and'
      '  COD_PRODUCTO = :COD_PRODUCTO')
    SelectSQL.Strings = (
      
        'Select  PRECIO_UNIDADSURTIDORA.*, unidades.descripcion desc_unid' +
        'ad  From PRECIO_UNIDADSURTIDORA'
      
        'left outer join UNIDADES on unidades.idunidad = PRECIO_UNIDADSUR' +
        'TIDORA.idunidad'
      'Where PRECIO_UNIDADSURTIDORA.cod_producto=:codigoprod')
    ModifySQL.Strings = (
      'update PRECIO_UNIDADSURTIDORA'
      'set'
      '  IDUNIDAD = :IDUNIDAD,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  COD_PRODUCTO = :COD_PRODUCTO,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIOVENTA1 = :PRECIOVENTA1,'
      '  PRECIOVENTA2 = :PRECIOVENTA2,'
      '  PRECIOVENTA3 = :PRECIOVENTA3,'
      '  PRECIOVENTA4 = :PRECIOVENTA4,'
      '  PORCUTILIDAD1 = :PORCUTILIDAD1,'
      '  PORCUTILIDAD2 = :PORCUTILIDAD2,'
      '  PORCUTILIDAD3 = :PORCUTILIDAD3,'
      '  PORCUTILIDAD4 = :PORCUTILIDAD4,'
      '  COD_USUARIO_IN = :COD_USUARIO_IN,'
      '  COD_USUARIO_UPD = :COD_USUARIO_UPD,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  IDUNIDAD = :OLD_IDUNIDAD and'
      '  COD_PRODUCTO = :OLD_COD_PRODUCTO')
    Left = 336
    Top = 416
    object tblPrecioUnidadXNivelIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'PRECIO_UNIDADSURTIDORA.IDUNIDAD'
      Required = True
    end
    object tblPrecioUnidadXNivelDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PRECIO_UNIDADSURTIDORA.DESCRIPCION'
      Size = 50
    end
    object tblPrecioUnidadXNivelCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'PRECIO_UNIDADSURTIDORA.COD_PRODUCTO'
      Required = True
    end
    object tblPrecioUnidadXNivelCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PRECIO_UNIDADSURTIDORA.CANTIDAD'
    end
    object tblPrecioUnidadXNivelPRECIOVENTA1: TFloatField
      FieldName = 'PRECIOVENTA1'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA1'
      DisplayFormat = ',0.0000'
    end
    object tblPrecioUnidadXNivelPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA2'
      DisplayFormat = ',0.0000'
    end
    object tblPrecioUnidadXNivelPRECIOVENTA3: TFloatField
      FieldName = 'PRECIOVENTA3'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA3'
      DisplayFormat = ',0.0000'
    end
    object tblPrecioUnidadXNivelPRECIOVENTA4: TFloatField
      FieldName = 'PRECIOVENTA4'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA4'
      DisplayFormat = ',0.0000'
    end
    object tblPrecioUnidadXNivelPORCUTILIDAD1: TFloatField
      FieldName = 'PORCUTILIDAD1'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD1'
      DisplayFormat = ',0.0000'
      MaxValue = 1000.000000000000000000
      MinValue = 0.050000000000000000
    end
    object tblPrecioUnidadXNivelPORCUTILIDAD2: TFloatField
      FieldName = 'PORCUTILIDAD2'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD2'
      DisplayFormat = ',0.0000'
      MaxValue = 1000.000000000000000000
      MinValue = 0.050000000000000000
    end
    object tblPrecioUnidadXNivelPORCUTILIDAD3: TFloatField
      FieldName = 'PORCUTILIDAD3'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD3'
      DisplayFormat = ',0.0000'
      MaxValue = 1000.000000000000000000
      MinValue = 0.050000000000000000
    end
    object tblPrecioUnidadXNivelPORCUTILIDAD4: TFloatField
      FieldName = 'PORCUTILIDAD4'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD4'
      DisplayFormat = ',0.0000'
      MaxValue = 1000.000000000000000000
      MinValue = 0.050000000000000000
    end
    object tblPrecioUnidadXNivelCOD_USUARIO_IN: TIntegerField
      FieldName = 'COD_USUARIO_IN'
      Origin = 'PRECIO_UNIDADSURTIDORA.COD_USUARIO_IN'
    end
    object tblPrecioUnidadXNivelCOD_USUARIO_UPD: TIntegerField
      FieldName = 'COD_USUARIO_UPD'
      Origin = 'PRECIO_UNIDADSURTIDORA.COD_USUARIO_UPD'
    end
    object tblPrecioUnidadXNivelFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PRECIO_UNIDADSURTIDORA.FECHA_IN'
    end
    object tblPrecioUnidadXNivelIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PRECIO_UNIDADSURTIDORA.IN_POR'
      Size = 12
    end
    object tblPrecioUnidadXNivelFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PRECIO_UNIDADSURTIDORA.FECHA_MOD'
    end
    object tblPrecioUnidadXNivelMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PRECIO_UNIDADSURTIDORA.MOD_POR'
      Size = 12
    end
    object tblPrecioUnidadXNivelDESC_UNIDAD: TIBStringField
      FieldName = 'DESC_UNIDAD'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
  end
  object dstblPrecioUnidadXNivel: TDataSource
    DataSet = tblPrecioUnidadXNivel
    Left = 336
    Top = 464
  end
  object tblLookupUnidad: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'UNIDADES'
    Left = 440
    Top = 456
    object tblLookupUnidadIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
    end
    object tblLookupUnidadCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object tblLookupUnidadDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
  end
  object dstblLookupUnidad: TDataSource
    DataSet = tblLookupUnidad
    Left = 520
    Top = 472
  end
  object qryLookupUnidad: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From UNIDADES')
    Left = 232
    Top = 480
    object qryLookupUnidadIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'UNIDADES.IDUNIDAD'
      Required = True
    end
    object qryLookupUnidadCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Origin = 'UNIDADES.CANTIDAD'
    end
    object qryLookupUnidadDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
  end
  object QryViewInvSinPrecXUni: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From view_inv_sinPrecXUni')
    Left = 688
    Top = 32
    object QryViewInvSinPrecXUniCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'VIEW_INV_SINPRECXUNI.CODIGO'
    end
    object QryViewInvSinPrecXUniCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Origin = 'VIEW_INV_SINPRECXUNI.CODIGO_TEXTO'
      Size = 40
    end
    object QryViewInvSinPrecXUniFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VIEW_INV_SINPRECXUNI.FECHA'
    end
    object QryViewInvSinPrecXUniCODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'VIEW_INV_SINPRECXUNI.CODIGO_BARRA'
      Size = 40
    end
    object QryViewInvSinPrecXUniTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'VIEW_INV_SINPRECXUNI.TIPO'
    end
    object QryViewInvSinPrecXUniDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VIEW_INV_SINPRECXUNI.DESCRIPCION'
      Size = 80
    end
    object QryViewInvSinPrecXUniDESCRIPCIONADICIONAL: TMemoField
      FieldName = 'DESCRIPCIONADICIONAL'
      Origin = 'VIEW_INV_SINPRECXUNI.DESCRIPCIONADICIONAL'
      BlobType = ftMemo
      Size = 8
    end
    object QryViewInvSinPrecXUniCANTIDAD_REORDEN: TIntegerField
      FieldName = 'CANTIDAD_REORDEN'
      Origin = 'VIEW_INV_SINPRECXUNI.CANTIDAD_REORDEN'
    end
    object QryViewInvSinPrecXUniPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'VIEW_INV_SINPRECXUNI.PRECIO_ANT'
    end
    object QryViewInvSinPrecXUniCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VIEW_INV_SINPRECXUNI.CANTIDAD'
    end
    object QryViewInvSinPrecXUniPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VIEW_INV_SINPRECXUNI.PRECIO'
    end
    object QryViewInvSinPrecXUniBLCE_CANT_ENTRADA: TFloatField
      FieldName = 'BLCE_CANT_ENTRADA'
      Origin = 'VIEW_INV_SINPRECXUNI.BLCE_CANT_ENTRADA'
    end
    object QryViewInvSinPrecXUniBLCE_CANT_SALIDA: TFloatField
      FieldName = 'BLCE_CANT_SALIDA'
      Origin = 'VIEW_INV_SINPRECXUNI.BLCE_CANT_SALIDA'
    end
    object QryViewInvSinPrecXUniFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'VIEW_INV_SINPRECXUNI.FECHA_ULTIMA_TRN'
    end
    object QryViewInvSinPrecXUniSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VIEW_INV_SINPRECXUNI.STATUS'
      FixedChar = True
      Size = 1
    end
    object QryViewInvSinPrecXUniPORC_DESCUENTO: TFloatField
      FieldName = 'PORC_DESCUENTO'
      Origin = 'VIEW_INV_SINPRECXUNI.PORC_DESCUENTO'
    end
    object QryViewInvSinPrecXUniFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'VIEW_INV_SINPRECXUNI.FOTO'
      Size = 8
    end
    object QryViewInvSinPrecXUniPAGA_ITBI: TSmallintField
      FieldName = 'PAGA_ITBI'
      Origin = 'VIEW_INV_SINPRECXUNI.PAGA_ITBI'
    end
    object QryViewInvSinPrecXUniCODIGO_PRECIO: TIBStringField
      FieldName = 'CODIGO_PRECIO'
      Origin = 'VIEW_INV_SINPRECXUNI.CODIGO_PRECIO'
      FixedChar = True
      Size = 6
    end
    object QryViewInvSinPrecXUniUNIDAD: TFloatField
      FieldName = 'UNIDAD'
      Origin = 'VIEW_INV_SINPRECXUNI.UNIDAD'
    end
    object QryViewInvSinPrecXUniPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'VIEW_INV_SINPRECXUNI.PRECIO_COMPRA'
    end
    object QryViewInvSinPrecXUniPRECIO_MINIMO: TFloatField
      FieldName = 'PRECIO_MINIMO'
      Origin = 'VIEW_INV_SINPRECXUNI.PRECIO_MINIMO'
    end
    object QryViewInvSinPrecXUniREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'VIEW_INV_SINPRECXUNI.REFERENCIA'
      Size = 50
    end
    object QryViewInvSinPrecXUniFECHA_VENCIMIENTO: TDateTimeField
      FieldName = 'FECHA_VENCIMIENTO'
      Origin = 'VIEW_INV_SINPRECXUNI.FECHA_VENCIMIENTO'
    end
    object QryViewInvSinPrecXUniINVENTARIAR: TSmallintField
      FieldName = 'INVENTARIAR'
      Origin = 'VIEW_INV_SINPRECXUNI.INVENTARIAR'
    end
    object QryViewInvSinPrecXUniPRECIO_TIPO_UNIDAD: TFloatField
      FieldName = 'PRECIO_TIPO_UNIDAD'
      Origin = 'VIEW_INV_SINPRECXUNI.PRECIO_TIPO_UNIDAD'
    end
    object QryViewInvSinPrecXUniTIPO_UNIDAD: TIntegerField
      FieldName = 'TIPO_UNIDAD'
      Origin = 'VIEW_INV_SINPRECXUNI.TIPO_UNIDAD'
    end
    object QryViewInvSinPrecXUniORIGEN: TIntegerField
      FieldName = 'ORIGEN'
      Origin = 'VIEW_INV_SINPRECXUNI.ORIGEN'
    end
    object QryViewInvSinPrecXUniUBICACION: TIBStringField
      FieldName = 'UBICACION'
      Origin = 'VIEW_INV_SINPRECXUNI.UBICACION'
      Size = 50
    end
    object QryViewInvSinPrecXUniREFERENCIA_ALTERNA: TIBStringField
      FieldName = 'REFERENCIA_ALTERNA'
      Origin = 'VIEW_INV_SINPRECXUNI.REFERENCIA_ALTERNA'
      Size = 50
    end
    object QryViewInvSinPrecXUniMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'VIEW_INV_SINPRECXUNI.MARCA'
      Size = 50
    end
    object QryViewInvSinPrecXUniMODELO: TIBStringField
      FieldName = 'MODELO'
      Origin = 'VIEW_INV_SINPRECXUNI.MODELO'
      Size = 50
    end
    object QryViewInvSinPrecXUniPRECIOVENTA1: TFloatField
      FieldName = 'PRECIOVENTA1'
      Origin = 'VIEW_INV_SINPRECXUNI.PRECIOVENTA1'
    end
    object QryViewInvSinPrecXUniPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'VIEW_INV_SINPRECXUNI.PRECIOVENTA2'
    end
    object QryViewInvSinPrecXUniPRECIOVENTA3: TFloatField
      FieldName = 'PRECIOVENTA3'
      Origin = 'VIEW_INV_SINPRECXUNI.PRECIOVENTA3'
    end
    object QryViewInvSinPrecXUniPRECIOVENTA4: TFloatField
      FieldName = 'PRECIOVENTA4'
      Origin = 'VIEW_INV_SINPRECXUNI.PRECIOVENTA4'
    end
    object QryViewInvSinPrecXUniPORCUTILIDAD1: TFloatField
      FieldName = 'PORCUTILIDAD1'
      Origin = 'VIEW_INV_SINPRECXUNI.PORCUTILIDAD1'
    end
    object QryViewInvSinPrecXUniPORCUTILIDAD2: TFloatField
      FieldName = 'PORCUTILIDAD2'
      Origin = 'VIEW_INV_SINPRECXUNI.PORCUTILIDAD2'
    end
    object QryViewInvSinPrecXUniPORCUTILIDAD3: TFloatField
      FieldName = 'PORCUTILIDAD3'
      Origin = 'VIEW_INV_SINPRECXUNI.PORCUTILIDAD3'
    end
    object QryViewInvSinPrecXUniPORCUTILIDAD4: TFloatField
      FieldName = 'PORCUTILIDAD4'
      Origin = 'VIEW_INV_SINPRECXUNI.PORCUTILIDAD4'
    end
    object QryViewInvSinPrecXUniUSARLEVELPRECIO: TSmallintField
      FieldName = 'USARLEVELPRECIO'
      Origin = 'VIEW_INV_SINPRECXUNI.USARLEVELPRECIO'
    end
    object QryViewInvSinPrecXUniCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VIEW_INV_SINPRECXUNI.CIA_KEY'
    end
    object QryViewInvSinPrecXUniSITUACIONPROD: TSmallintField
      FieldName = 'SITUACIONPROD'
      Origin = 'VIEW_INV_SINPRECXUNI.SITUACIONPROD'
    end
    object QryViewInvSinPrecXUniAPLICAIMPTOCOMPRA: TSmallintField
      FieldName = 'APLICAIMPTOCOMPRA'
      Origin = 'VIEW_INV_SINPRECXUNI.APLICAIMPTOCOMPRA'
    end
    object QryViewInvSinPrecXUniCODFABRICANTE: TIntegerField
      FieldName = 'CODFABRICANTE'
      Origin = 'VIEW_INV_SINPRECXUNI.CODFABRICANTE'
    end
    object QryViewInvSinPrecXUniCTAINVENTARIO: TIBStringField
      FieldName = 'CTAINVENTARIO'
      Origin = 'VIEW_INV_SINPRECXUNI.CTAINVENTARIO'
      Size = 7
    end
    object QryViewInvSinPrecXUniCTAVENTA: TIBStringField
      FieldName = 'CTAVENTA'
      Origin = 'VIEW_INV_SINPRECXUNI.CTAVENTA'
      Size = 7
    end
    object QryViewInvSinPrecXUniCTACOMPRA: TIBStringField
      FieldName = 'CTACOMPRA'
      Origin = 'VIEW_INV_SINPRECXUNI.CTACOMPRA'
      Size = 7
    end
    object QryViewInvSinPrecXUniCODSUBCATEGORIA: TIntegerField
      FieldName = 'CODSUBCATEGORIA'
      Origin = 'VIEW_INV_SINPRECXUNI.CODSUBCATEGORIA'
    end
    object QryViewInvSinPrecXUniCODCATEGORIA: TIntegerField
      FieldName = 'CODCATEGORIA'
      Origin = 'VIEW_INV_SINPRECXUNI.CODCATEGORIA'
    end
    object QryViewInvSinPrecXUniPORCITBIS: TFloatField
      FieldName = 'PORCITBIS'
      Origin = 'VIEW_INV_SINPRECXUNI.PORCITBIS'
    end
    object QryViewInvSinPrecXUniCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'VIEW_INV_SINPRECXUNI.COD_MONEDA'
      FixedChar = True
      Size = 1
    end
    object QryViewInvSinPrecXUniKILOMETROS: TFloatField
      FieldName = 'KILOMETROS'
      Origin = 'VIEW_INV_SINPRECXUNI.KILOMETROS'
    end
    object QryViewInvSinPrecXUniRUTAIMAGEN: TIBStringField
      FieldName = 'RUTAIMAGEN'
      Origin = 'VIEW_INV_SINPRECXUNI.RUTAIMAGEN'
      Size = 200
    end
    object QryViewInvSinPrecXUniIDTASAITBIS: TSmallintField
      FieldName = 'IDTASAITBIS'
      Origin = 'VIEW_INV_SINPRECXUNI.IDTASAITBIS'
    end
    object QryViewInvSinPrecXUniPRECIO_ALQUILER: TFloatField
      FieldName = 'PRECIO_ALQUILER'
      Origin = 'VIEW_INV_SINPRECXUNI.PRECIO_ALQUILER'
    end
  end
  object tblOfertas: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from Ofertas'
      'where'
      '  CODIGO_PROD = :OLD_CODIGO_PROD and'
      '  FECHA_INICIAL = :OLD_FECHA_INICIAL and'
      '  FECHA_FINAL = :OLD_FECHA_FINAL and'
      '  TIPO_UNIDADVTA = :OLD_TIPO_UNIDADVTA and'
      '  TIPO_UNIDADOFTA = :OLD_TIPO_UNIDADOFTA')
    InsertSQL.Strings = (
      'insert into Ofertas'
      
        '  (CODIGO_PROD, FECHA_INICIAL, FECHA_FINAL, TIPO_UNIDADVTA, TIPO' +
        '_UNIDADOFTA, '
      '   CANTIDAD, FECHA_ULT_TRN, CANT_ACUM_SALIDA, STATUS)'
      'values'
      
        '  (:CODIGO_PROD, :FECHA_INICIAL, :FECHA_FINAL, :TIPO_UNIDADVTA, ' +
        ':TIPO_UNIDADOFTA, '
      '   :CANTIDAD, :FECHA_ULT_TRN, :CANT_ACUM_SALIDA, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO_PROD,'
      '  FECHA_INICIAL,'
      '  FECHA_FINAL,'
      '  TIPO_UNIDADVTA,'
      '  TIPO_UNIDADOFTA,'
      '  CANTIDAD,'
      '  FECHA_ULT_TRN,'
      '  CANT_ACUM_SALIDA,'
      '  STATUS'
      'from Ofertas '
      'where'
      '  CODIGO_PROD = :CODIGO_PROD and'
      '  FECHA_INICIAL = :FECHA_INICIAL and'
      '  FECHA_FINAL = :FECHA_FINAL and'
      '  TIPO_UNIDADVTA = :TIPO_UNIDADVTA and'
      '  TIPO_UNIDADOFTA = :TIPO_UNIDADOFTA')
    SelectSQL.Strings = (
      'Select * From Ofertas'
      'Where codigo_prod =:codigo_prod'
      'And :fecha between fecha_inicial and fecha_final'
      '')
    ModifySQL.Strings = (
      'update Ofertas'
      'set'
      '  CODIGO_PROD = :CODIGO_PROD,'
      '  FECHA_INICIAL = :FECHA_INICIAL,'
      '  FECHA_FINAL = :FECHA_FINAL,'
      '  TIPO_UNIDADVTA = :TIPO_UNIDADVTA,'
      '  TIPO_UNIDADOFTA = :TIPO_UNIDADOFTA,'
      '  CANTIDAD = :CANTIDAD,'
      '  FECHA_ULT_TRN = :FECHA_ULT_TRN,'
      '  CANT_ACUM_SALIDA = :CANT_ACUM_SALIDA,'
      '  STATUS = :STATUS'
      'where'
      '  CODIGO_PROD = :OLD_CODIGO_PROD and'
      '  FECHA_INICIAL = :OLD_FECHA_INICIAL and'
      '  FECHA_FINAL = :OLD_FECHA_FINAL and'
      '  TIPO_UNIDADVTA = :OLD_TIPO_UNIDADVTA and'
      '  TIPO_UNIDADOFTA = :OLD_TIPO_UNIDADOFTA')
    Left = 744
    Top = 256
    object tblOfertasCODIGO_PROD: TIntegerField
      FieldName = 'CODIGO_PROD'
      Origin = 'OFERTAS.CODIGO_PROD'
      Required = True
    end
    object tblOfertasFECHA_INICIAL: TDateTimeField
      FieldName = 'FECHA_INICIAL'
      Origin = 'OFERTAS.FECHA_INICIAL'
      Required = True
    end
    object tblOfertasFECHA_FINAL: TDateTimeField
      FieldName = 'FECHA_FINAL'
      Origin = 'OFERTAS.FECHA_FINAL'
      Required = True
    end
    object tblOfertasTIPO_UNIDADVTA: TIntegerField
      FieldName = 'TIPO_UNIDADVTA'
      Origin = 'OFERTAS.TIPO_UNIDADVTA'
      Required = True
    end
    object tblOfertasTIPO_UNIDADOFTA: TIntegerField
      FieldName = 'TIPO_UNIDADOFTA'
      Origin = 'OFERTAS.TIPO_UNIDADOFTA'
      Required = True
    end
    object tblOfertasCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'OFERTAS.CANTIDAD'
    end
    object tblOfertasFECHA_ULT_TRN: TDateTimeField
      FieldName = 'FECHA_ULT_TRN'
      Origin = 'OFERTAS.FECHA_ULT_TRN'
    end
    object tblOfertasCANT_ACUM_SALIDA: TFloatField
      FieldName = 'CANT_ACUM_SALIDA'
      Origin = 'OFERTAS.CANT_ACUM_SALIDA'
    end
    object tblOfertasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'OFERTAS.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dstblOfertas: TDataSource
    DataSet = tblOfertas
    Left = 768
    Top = 304
  end
  object qryInvOfertaLookup: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select CANTIDAD, CODIGO, DESCRIPCION, FECHA_ULTIMA_TRN, PRECIO, '
      'cod_moneda, PRECIO_COMPRA'
      'From INVENTARIO_PRODUCTO'
      'Order By Tipo, Descripcion')
    Left = 728
    Top = 440
    object qryInvOfertaLookupCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'INVENTARIO_PRODUCTO.CANTIDAD'
    end
    object qryInvOfertaLookupCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryInvOfertaLookupDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryInvOfertaLookupFECHA_ULTIMA_TRN: TDateTimeField
      FieldName = 'FECHA_ULTIMA_TRN'
      Origin = 'INVENTARIO_PRODUCTO.FECHA_ULTIMA_TRN'
    end
    object qryInvOfertaLookupPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO'
    end
    object qryInvOfertaLookupCOD_MONEDA: TIBStringField
      FieldName = 'COD_MONEDA'
      Origin = 'INVENTARIO_PRODUCTO.COD_MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryInvOfertaLookupPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
  end
  object qryTipoUnidadOferta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select  PRECIO_UNIDADSURTIDORA.*, unidades.descripcion desc_unid' +
        'ad  From PRECIO_UNIDADSURTIDORA'
      
        'left outer join UNIDADES on unidades.idunidad = PRECIO_UNIDADSUR' +
        'TIDORA.idunidad'
      'Where PRECIO_UNIDADSURTIDORA.cod_producto=:codigoprod')
    Left = 712
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoprod'
        ParamType = ptInput
      end>
    object qryTipoUnidadOfertaIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'PRECIO_UNIDADSURTIDORA.IDUNIDAD'
      Required = True
    end
    object qryTipoUnidadOfertaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PRECIO_UNIDADSURTIDORA.DESCRIPCION'
      Size = 50
    end
    object qryTipoUnidadOfertaCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'PRECIO_UNIDADSURTIDORA.COD_PRODUCTO'
      Required = True
    end
    object qryTipoUnidadOfertaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PRECIO_UNIDADSURTIDORA.CANTIDAD'
    end
    object qryTipoUnidadOfertaPRECIOVENTA1: TFloatField
      FieldName = 'PRECIOVENTA1'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA1'
    end
    object qryTipoUnidadOfertaPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA2'
    end
    object qryTipoUnidadOfertaPRECIOVENTA3: TFloatField
      FieldName = 'PRECIOVENTA3'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA3'
    end
    object qryTipoUnidadOfertaPRECIOVENTA4: TFloatField
      FieldName = 'PRECIOVENTA4'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA4'
    end
    object qryTipoUnidadOfertaPORCUTILIDAD1: TFloatField
      FieldName = 'PORCUTILIDAD1'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD1'
    end
    object qryTipoUnidadOfertaPORCUTILIDAD2: TFloatField
      FieldName = 'PORCUTILIDAD2'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD2'
    end
    object qryTipoUnidadOfertaPORCUTILIDAD3: TFloatField
      FieldName = 'PORCUTILIDAD3'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD3'
    end
    object qryTipoUnidadOfertaPORCUTILIDAD4: TFloatField
      FieldName = 'PORCUTILIDAD4'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD4'
    end
    object qryTipoUnidadOfertaCOD_USUARIO_IN: TIntegerField
      FieldName = 'COD_USUARIO_IN'
      Origin = 'PRECIO_UNIDADSURTIDORA.COD_USUARIO_IN'
    end
    object qryTipoUnidadOfertaCOD_USUARIO_UPD: TIntegerField
      FieldName = 'COD_USUARIO_UPD'
      Origin = 'PRECIO_UNIDADSURTIDORA.COD_USUARIO_UPD'
    end
    object qryTipoUnidadOfertaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PRECIO_UNIDADSURTIDORA.FECHA_IN'
    end
    object qryTipoUnidadOfertaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PRECIO_UNIDADSURTIDORA.IN_POR'
      Size = 12
    end
    object qryTipoUnidadOfertaFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PRECIO_UNIDADSURTIDORA.FECHA_MOD'
    end
    object qryTipoUnidadOfertaMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PRECIO_UNIDADSURTIDORA.MOD_POR'
      Size = 12
    end
    object qryTipoUnidadOfertaDESC_UNIDAD: TIBStringField
      FieldName = 'DESC_UNIDAD'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
  end
  object qryTipoUnidadVta: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select  PRECIO_UNIDADSURTIDORA.*, unidades.descripcion desc_unid' +
        'ad  From PRECIO_UNIDADSURTIDORA'
      
        'left outer join UNIDADES on unidades.idunidad = PRECIO_UNIDADSUR' +
        'TIDORA.idunidad'
      'Where PRECIO_UNIDADSURTIDORA.cod_producto=:codigoprod')
    Left = 728
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigoprod'
        ParamType = ptInput
      end>
    object qryTipoUnidadVtaIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'PRECIO_UNIDADSURTIDORA.IDUNIDAD'
      Required = True
    end
    object qryTipoUnidadVtaDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PRECIO_UNIDADSURTIDORA.DESCRIPCION'
      Size = 50
    end
    object qryTipoUnidadVtaCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'PRECIO_UNIDADSURTIDORA.COD_PRODUCTO'
      Required = True
    end
    object qryTipoUnidadVtaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'PRECIO_UNIDADSURTIDORA.CANTIDAD'
    end
    object qryTipoUnidadVtaPRECIOVENTA1: TFloatField
      FieldName = 'PRECIOVENTA1'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA1'
    end
    object qryTipoUnidadVtaPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA2'
    end
    object qryTipoUnidadVtaPRECIOVENTA3: TFloatField
      FieldName = 'PRECIOVENTA3'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA3'
    end
    object qryTipoUnidadVtaPRECIOVENTA4: TFloatField
      FieldName = 'PRECIOVENTA4'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA4'
    end
    object qryTipoUnidadVtaPORCUTILIDAD1: TFloatField
      FieldName = 'PORCUTILIDAD1'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD1'
    end
    object qryTipoUnidadVtaPORCUTILIDAD2: TFloatField
      FieldName = 'PORCUTILIDAD2'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD2'
    end
    object qryTipoUnidadVtaPORCUTILIDAD3: TFloatField
      FieldName = 'PORCUTILIDAD3'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD3'
    end
    object qryTipoUnidadVtaPORCUTILIDAD4: TFloatField
      FieldName = 'PORCUTILIDAD4'
      Origin = 'PRECIO_UNIDADSURTIDORA.PORCUTILIDAD4'
    end
    object qryTipoUnidadVtaCOD_USUARIO_IN: TIntegerField
      FieldName = 'COD_USUARIO_IN'
      Origin = 'PRECIO_UNIDADSURTIDORA.COD_USUARIO_IN'
    end
    object qryTipoUnidadVtaCOD_USUARIO_UPD: TIntegerField
      FieldName = 'COD_USUARIO_UPD'
      Origin = 'PRECIO_UNIDADSURTIDORA.COD_USUARIO_UPD'
    end
    object qryTipoUnidadVtaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PRECIO_UNIDADSURTIDORA.FECHA_IN'
    end
    object qryTipoUnidadVtaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PRECIO_UNIDADSURTIDORA.IN_POR'
      Size = 12
    end
    object qryTipoUnidadVtaFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PRECIO_UNIDADSURTIDORA.FECHA_MOD'
    end
    object qryTipoUnidadVtaMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PRECIO_UNIDADSURTIDORA.MOD_POR'
      Size = 12
    end
    object qryTipoUnidadVtaDESC_UNIDAD: TIBStringField
      FieldName = 'DESC_UNIDAD'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
  end
  object qryoferta_base: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Ofertas'
      'Where codigo_prod =:codigo_prod'
      'And :fecha between fecha_inicial and fecha_final')
    Left = 664
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codigo_prod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha'
        ParamType = ptUnknown
      end>
  end
  object qryPrecioXUnidadLevel: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT p.IDUNIDAD,r.UBICACION, r.TIPO tipo_inventario, n.DESCRIP' +
        'CION Tipo, u.DESCRIPCION desc_unidad, r.codigo COD_PRODUCTO,c.DE' +
        'SCRIPCION categoria, s.DESCRIPCION subcategoria, r.PRECIO_COMPRA' +
        ', '
      'r.DESCRIPCION producto, t.DESCRIPCION tasaitbis,'
      'p.CANTIDAD cant, '
      '(Select sum(rr.CANTIDAD * u.CANTIDAD) '
      ' From VENTAS_DET_CONDUCE rr'
      ' inner join UNIDADES uu on uu.IDUNIDAD = rr.TIPO_UNIDAD '
      
        ' where rr.CODIGO_PROD = r.CODIGO and rr.STATUS_DET = '#39'A'#39') CantEn' +
        'Ruta,'
      
        'p.PRECIOVENTA1 precio1, p.PRECIOVENTA2 precio2, p.PRECIOVENTA3 p' +
        'recio3, p.PRECIOVENTA4 precio4'
      'FROM INVENTARIO_PRODUCTO r'
      
        'left outer join PRECIO_UNIDADSURTIDORA p on p.COD_PRODUCTO = r.C' +
        'ODIGO'
      'left outer join UNIDADES u on u.IDUNIDAD = p.IDUNIDAD'
      
        'left outer join INVENTARIO_CATEGORIA c on c.CODCATEGORIA = r.COD' +
        'CATEGORIA'
      
        'left outer join INVENTARIO_SUBCATEGORIA s on s.CODSUBCATEGORIA =' +
        ' r.CODSUBCATEGORIA'
      'left outer join TASA_ITBIS t on t.IDTASAITBIS = r.IDTASAITBIS'
      'left outer join TIPO_INVENTARIO n on n.CODIGO = r.TIPO'
      '')
    Left = 48
    Top = 472
    object qryPrecioXUnidadLevelIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'PRECIO_UNIDADSURTIDORA.IDUNIDAD'
    end
    object qryPrecioXUnidadLevelTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'TIPO_INVENTARIO.DESCRIPCION'
      Size = 30
    end
    object qryPrecioXUnidadLevelDESC_UNIDAD: TIBStringField
      FieldName = 'DESC_UNIDAD'
      Origin = 'UNIDADES.DESCRIPCION'
      Size = 50
    end
    object qryPrecioXUnidadLevelCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'INVENTARIO_PRODUCTO.CODIGO'
      Required = True
    end
    object qryPrecioXUnidadLevelCATEGORIA: TIBStringField
      FieldName = 'CATEGORIA'
      Origin = 'INVENTARIO_CATEGORIA.DESCRIPCION'
      Size = 40
    end
    object qryPrecioXUnidadLevelSUBCATEGORIA: TIBStringField
      FieldName = 'SUBCATEGORIA'
      Origin = 'INVENTARIO_SUBCATEGORIA.DESCRIPCION'
      Size = 40
    end
    object qryPrecioXUnidadLevelPRODUCTO: TIBStringField
      FieldName = 'PRODUCTO'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryPrecioXUnidadLevelTASAITBIS: TIBStringField
      FieldName = 'TASAITBIS'
      Origin = 'TASA_ITBIS.DESCRIPCION'
    end
    object qryPrecioXUnidadLevelCANT: TFloatField
      FieldName = 'CANT'
      Origin = 'PRECIO_UNIDADSURTIDORA.CANTIDAD'
    end
    object qryPrecioXUnidadLevelPRECIO1: TFloatField
      FieldName = 'PRECIO1'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA1'
    end
    object qryPrecioXUnidadLevelPRECIO2: TFloatField
      FieldName = 'PRECIO2'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA2'
    end
    object qryPrecioXUnidadLevelPRECIO3: TFloatField
      FieldName = 'PRECIO3'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA3'
    end
    object qryPrecioXUnidadLevelPRECIO4: TFloatField
      FieldName = 'PRECIO4'
      Origin = 'PRECIO_UNIDADSURTIDORA.PRECIOVENTA4'
    end
    object qryPrecioXUnidadLevelTIPO_INVENTARIO: TIntegerField
      FieldName = 'TIPO_INVENTARIO'
      Origin = 'INVENTARIO_PRODUCTO.TIPO'
    end
    object qryPrecioXUnidadLevelUBICACION: TIBStringField
      FieldName = 'UBICACION'
      Origin = 'INVENTARIO_PRODUCTO.UBICACION'
      Size = 50
    end
    object qryPrecioXUnidadLevelCANTENRUTA: TFloatField
      FieldName = 'CANTENRUTA'
    end
    object qryPrecioXUnidadLevelPRECIO_COMPRA: TFloatField
      FieldName = 'PRECIO_COMPRA'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_COMPRA'
    end
  end
  object qryInvProd_Base: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select '
      ' INVENTARIO_PRODUCTO.* From INVENTARIO_PRODUCTO'
      'Where  CIA_KEY=:ciakey')
    Left = 176
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ciakey'
        ParamType = ptUnknown
      end>
  end
  object qryPrecioXUnidadLevel_Base0: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT p.IDUNIDAD,r.UBICACION, r.TIPO tipo_inventario, n.DESCRIP' +
        'CION Tipo, u.DESCRIPCION desc_unidad, r.codigo COD_PRODUCTO,c.DE' +
        'SCRIPCION categoria, s.DESCRIPCION subcategoria, r.PRECIO_COMPRA' +
        ', '
      'r.DESCRIPCION producto, t.DESCRIPCION tasaitbis,'
      'p.CANTIDAD cant, '
      '(Select sum(rr.CANTIDAD * u.CANTIDAD) '
      ' From VENTAS_DET_CONDUCE rr'
      ' inner join UNIDADES uu on uu.IDUNIDAD = rr.TIPO_UNIDAD '
      
        ' where rr.CODIGO_PROD = r.CODIGO and rr.STATUS_DET = '#39'A'#39') CantEn' +
        'Ruta,'
      
        'p.PRECIOVENTA1 precio1, p.PRECIOVENTA2 precio2, p.PRECIOVENTA3 p' +
        'recio3, p.PRECIOVENTA4 precio4'
      'FROM INVENTARIO_PRODUCTO r'
      
        'left outer join PRECIO_UNIDADSURTIDORA p on p.COD_PRODUCTO = r.C' +
        'ODIGO'
      'left outer join UNIDADES u on u.IDUNIDAD = p.IDUNIDAD'
      
        'left outer join INVENTARIO_CATEGORIA c on c.CODCATEGORIA = r.COD' +
        'CATEGORIA'
      
        'left outer join INVENTARIO_SUBCATEGORIA s on s.CODSUBCATEGORIA =' +
        ' r.CODSUBCATEGORIA'
      'left outer join TASA_ITBIS t on t.IDTASAITBIS = r.IDTASAITBIS'
      'left outer join TIPO_INVENTARIO n on n.CODIGO = r.TIPO')
    Left = 136
    Top = 448
  end
  object dstblEquipoMaster: TDataSource
    AutoEdit = False
    DataSet = tblEquipoMaster
    Left = 760
    Top = 144
  end
  object dstblEquipoDet: TDataSource
    AutoEdit = False
    DataSet = tblEquipoDet
    Left = 760
    Top = 200
  end
  object tblEquipoMaster: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblEquipoMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from EQUIPO_MASTER'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into EQUIPO_MASTER'
      
        '  (NUMERO, TIPO_TRN, COD_PROVEEDOR, FECHA, OBSERVACION, STATUS, ' +
        'TIPO_OPE, '
      '   INV_UPD, FECHA_ENTRADA, FECHA_ENT_ESTIMADA, CODIGO_TECNICO)'
      'values'
      
        '  (:NUMERO, :TIPO_TRN, :COD_PROVEEDOR, :FECHA, :OBSERVACION, :ST' +
        'ATUS, :TIPO_OPE, '
      
        '   :INV_UPD, :FECHA_ENTRADA, :FECHA_ENT_ESTIMADA, :CODIGO_TECNIC' +
        'O)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  TIPO_TRN,'
      '  COD_PROVEEDOR,'
      '  FECHA,'
      '  OBSERVACION,'
      '  STATUS,'
      '  TIPO_OPE,'
      '  INV_UPD,'
      '  FECHA_ENTRADA,'
      '  FECHA_ENT_ESTIMADA,'
      '  CODIGO_TECNICO'
      'from EQUIPO_MASTER '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select * From EQUIPO_MASTER'
      'Where fecha between :fechaini and :fechafin'
      'and tipo_ope between :tipoopeini and :tipoopefin')
    ModifySQL.Strings = (
      'update EQUIPO_MASTER'
      'set'
      '  NUMERO = :NUMERO,'
      '  TIPO_TRN = :TIPO_TRN,'
      '  COD_PROVEEDOR = :COD_PROVEEDOR,'
      '  FECHA = :FECHA,'
      '  OBSERVACION = :OBSERVACION,'
      '  STATUS = :STATUS,'
      '  TIPO_OPE = :TIPO_OPE,'
      '  INV_UPD = :INV_UPD,'
      '  FECHA_ENTRADA = :FECHA_ENTRADA,'
      '  FECHA_ENT_ESTIMADA = :FECHA_ENT_ESTIMADA,'
      '  CODIGO_TECNICO = :CODIGO_TECNICO'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_SERIEEQUIPOMAST'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 760
    Top = 16
    object tblEquipoMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'EQUIPO_MASTER.NUMERO'
      Required = True
    end
    object tblEquipoMasterTIPO_TRN: TIntegerField
      FieldName = 'TIPO_TRN'
      Origin = 'EQUIPO_MASTER.TIPO_TRN'
      Required = True
    end
    object tblEquipoMasterCOD_PROVEEDOR: TIntegerField
      FieldName = 'COD_PROVEEDOR'
      Origin = 'EQUIPO_MASTER.COD_PROVEEDOR'
      Required = True
    end
    object tblEquipoMasterFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'EQUIPO_MASTER.FECHA'
    end
    object tblEquipoMasterOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'EQUIPO_MASTER.OBSERVACION'
      Size = 100
    end
    object tblEquipoMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'EQUIPO_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblEquipoMasterTIPO_OPE: TSmallintField
      FieldName = 'TIPO_OPE'
      Origin = 'EQUIPO_MASTER.TIPO_OPE'
    end
    object tblEquipoMasterINV_UPD: TIBStringField
      FieldName = 'INV_UPD'
      Origin = 'EQUIPO_MASTER.INV_UPD'
      FixedChar = True
      Size = 1
    end
    object tblEquipoMasterFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'EQUIPO_MASTER.FECHA_ENTRADA'
    end
    object tblEquipoMasterFECHA_ENT_ESTIMADA: TDateTimeField
      FieldName = 'FECHA_ENT_ESTIMADA'
      Origin = 'EQUIPO_MASTER.FECHA_ENT_ESTIMADA'
    end
    object tblEquipoMasterCODIGO_TECNICO: TIntegerField
      FieldName = 'CODIGO_TECNICO'
      Origin = 'EQUIPO_MASTER.CODIGO_TECNICO'
    end
  end
  object tblEquipoDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from EQUIPO_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into EQUIPO_DET'
      
        '  (SERIE, NUMERO, COD_PRODUCTO, COD_USUARIO, MONTO_SERVICIO, INS' +
        'ERTADO_POR, '
      
        '   FECHA_IN, STATUS, DESCRIPCIONPROBLEMA, CANTIDAD, SERIE_EQUIPO' +
        ')'
      'values'
      
        '  (:SERIE, :NUMERO, :COD_PRODUCTO, :COD_USUARIO, :MONTO_SERVICIO' +
        ', :INSERTADO_POR, '
      
        '   :FECHA_IN, :STATUS, :DESCRIPCIONPROBLEMA, :CANTIDAD, :SERIE_E' +
        'QUIPO)')
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
      '  DESCRIPCIONPROBLEMA,'
      '  CANTIDAD,'
      '  SERIE_EQUIPO'
      'from EQUIPO_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select *  from EQUIPO_DET'
      'where NUMERO =:NUMERO')
    ModifySQL.Strings = (
      'update EQUIPO_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NUMERO = :NUMERO,'
      '  COD_PRODUCTO = :COD_PRODUCTO,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  MONTO_SERVICIO = :MONTO_SERVICIO,'
      '  INSERTADO_POR = :INSERTADO_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  STATUS = :STATUS,'
      '  DESCRIPCIONPROBLEMA = :DESCRIPCIONPROBLEMA,'
      '  CANTIDAD = :CANTIDAD,'
      '  SERIE_EQUIPO = :SERIE_EQUIPO'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_eq_DET'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 760
    Top = 80
    object tblEquipoDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'EQUIPO_DET.SERIE'
      Required = True
    end
    object tblEquipoDetNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'EQUIPO_DET.NUMERO'
      Required = True
    end
    object tblEquipoDetCOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'EQUIPO_DET.COD_PRODUCTO'
      Required = True
    end
    object tblEquipoDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'EQUIPO_DET.COD_USUARIO'
    end
    object tblEquipoDetMONTO_SERVICIO: TFloatField
      FieldName = 'MONTO_SERVICIO'
      Origin = 'EQUIPO_DET.MONTO_SERVICIO'
    end
    object tblEquipoDetINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'EQUIPO_DET.INSERTADO_POR'
      Size = 12
    end
    object tblEquipoDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'EQUIPO_DET.FECHA_IN'
    end
    object tblEquipoDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'EQUIPO_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblEquipoDetDESCRIPCIONPROBLEMA: TMemoField
      FieldName = 'DESCRIPCIONPROBLEMA'
      Origin = 'EQUIPO_DET.DESCRIPCIONPROBLEMA'
      BlobType = ftMemo
      Size = 8
    end
    object tblEquipoDetCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Origin = 'EQUIPO_DET.CANTIDAD'
    end
    object tblEquipoDetSERIE_EQUIPO: TIBStringField
      FieldName = 'SERIE_EQUIPO'
      Origin = 'EQUIPO_DET.SERIE_EQUIPO'
      Size = 50
    end
  end
  object qryEquiposEnRMA: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepRepMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT EQUIPO_MASTER.NUMERO,'
      '       EQUIPO_MASTER.TIPO_TRN,'
      '       EQUIPO_MASTER.TIPO_OPE,             '
      '      IIF(EQUIPO_MASTER.tipo_ope = 1,'#39'Alquiler'#39','
      '      IIF(EQUIPO_MASTER.tipo_ope = 2,'#39'Lavanderia'#39','
      '      IIF(EQUIPO_MASTER.tipo_ope = 3,'#39'Costura/Reparar'#39','
      '      IIF(EQUIPO_MASTER.tipo_ope = 4,'#39'Accesorios'#39','
      '      IIF(EQUIPO_MASTER.tipo_ope = 6,'#39'Productos'#39','
      '      IIF(EQUIPO_MASTER.tipo_ope = 7,'#39'Otros'#39','
      
        '      IIF(EQUIPO_MASTER.tipo_ope = 5,'#39'RMA'#39','#39'UNKNOWN'#39'))))) DescTi' +
        'popOpe,'
      '       EQUIPO_MASTER.COD_PROVEEDOR,'
      '       EQUIPO_MASTER.FECHA,'
      '       EQUIPO_MASTER.OBSERVACION,'
      '       EQUIPO_MASTER.STATUS,'
      '       PROVEEDORES.DESCRIPCION,'
      '       PROVEEDORES.TELEFONO,'
      '       PROVEEDORES.CALYYNUM,'
      '       PROVEEDORES.CIUDAD,'
      '       PROVEEDORES.PAIS,'
      '       PROVEEDORES.CONTACTO,'
      '       TIPO_TRN.DESCRIPCION TIPO_TRNDESC,'
      '       d.COD_PRODUCTO,'
      '       d.DESCRIPCIONPROBLEMA,'
      '       d.MONTO_SERVICIO,'
      
        '       d.CANTIDAD, i.DESCRIPCION descripcionproducto, d.serie_eq' +
        'uipo seriequipo,'
      
        '       EQUIPO_MASTER.CODIGO_TECNICO, e.NOMBRE||'#39' '#39'||e.apellido n' +
        'ombretecnico'
      'FROM TIPO_TRN'
      
        '   INNER JOIN EQUIPO_MASTER ON (TIPO_TRN.CODIGO = EQUIPO_MASTER.' +
        'TIPO_TRN)'
      
        '   INNER JOIN PROVEEDORES ON (EQUIPO_MASTER.COD_PROVEEDOR = PROV' +
        'EEDORES.CODIGO_CTE)'
      '   inner join EQUIPO_DET d on d.NUMERO = EQUIPO_MASTER.NUMERO'
      '   inner join INVENTARIO_PRODUCTO i on i.codigo = d.COD_PRODUCTO'
      
        '   left outer join INVENTARIO_SERIE s on s.CODIGO = i.CODIGO and' +
        ' s.serie = d.serie_equipo'
      
        '   left outer join empleado e on e.codigo = EQUIPO_MASTER.codigo' +
        '_tecnico'
      'WHERE EQUIPO_MASTER.NUMERO =:numero')
    Left = 216
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
      end>
    object qryEquiposEnRMANUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'EQUIPO_MASTER.NUMERO'
      Required = True
    end
    object qryEquiposEnRMATIPO_TRN: TIntegerField
      FieldName = 'TIPO_TRN'
      Origin = 'EQUIPO_MASTER.TIPO_TRN'
      Required = True
    end
    object qryEquiposEnRMATIPO_OPE: TSmallintField
      FieldName = 'TIPO_OPE'
      Origin = 'EQUIPO_MASTER.TIPO_OPE'
    end
    object qryEquiposEnRMADESCTIPOPOPE: TIBStringField
      FieldName = 'DESCTIPOPOPE'
      Required = True
      FixedChar = True
      Size = 15
    end
    object qryEquiposEnRMACOD_PROVEEDOR: TIntegerField
      FieldName = 'COD_PROVEEDOR'
      Origin = 'EQUIPO_MASTER.COD_PROVEEDOR'
      Required = True
    end
    object qryEquiposEnRMAFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'EQUIPO_MASTER.FECHA'
    end
    object qryEquiposEnRMAOBSERVACION: TIBStringField
      FieldName = 'OBSERVACION'
      Origin = 'EQUIPO_MASTER.OBSERVACION'
      Size = 100
    end
    object qryEquiposEnRMASTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'EQUIPO_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryEquiposEnRMADESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'PROVEEDORES.DESCRIPCION'
      Size = 80
    end
    object qryEquiposEnRMATELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'PROVEEDORES.TELEFONO'
      Size = 12
    end
    object qryEquiposEnRMACALYYNUM: TIBStringField
      FieldName = 'CALYYNUM'
      Origin = 'PROVEEDORES.CALYYNUM'
      Size = 80
    end
    object qryEquiposEnRMACIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROVEEDORES.CIUDAD'
    end
    object qryEquiposEnRMAPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PROVEEDORES.PAIS'
      Size = 30
    end
    object qryEquiposEnRMACONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'PROVEEDORES.CONTACTO'
      Size = 35
    end
    object qryEquiposEnRMATIPO_TRNDESC: TIBStringField
      FieldName = 'TIPO_TRNDESC'
      Origin = 'TIPO_TRN.DESCRIPCION'
      Size = 30
    end
    object qryEquiposEnRMACOD_PRODUCTO: TIntegerField
      FieldName = 'COD_PRODUCTO'
      Origin = 'EQUIPO_DET.COD_PRODUCTO'
      Required = True
    end
    object qryEquiposEnRMADESCRIPCIONPROBLEMA: TMemoField
      FieldName = 'DESCRIPCIONPROBLEMA'
      Origin = 'EQUIPO_DET.DESCRIPCIONPROBLEMA'
      BlobType = ftMemo
      Size = 8
    end
    object qryEquiposEnRMAMONTO_SERVICIO: TFloatField
      FieldName = 'MONTO_SERVICIO'
      Origin = 'EQUIPO_DET.MONTO_SERVICIO'
    end
    object qryEquiposEnRMACANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Origin = 'EQUIPO_DET.CANTIDAD'
    end
    object qryEquiposEnRMADESCRIPCIONPRODUCTO: TIBStringField
      FieldName = 'DESCRIPCIONPRODUCTO'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryEquiposEnRMASERIEQUIPO: TIBStringField
      FieldName = 'SERIEQUIPO'
      Origin = 'INVENTARIO_SERIE.SERIE'
      Size = 50
    end
    object qryEquiposEnRMACODIGO_TECNICO: TIntegerField
      FieldName = 'CODIGO_TECNICO'
      Origin = 'EQUIPO_MASTER.CODIGO_TECNICO'
    end
    object qryEquiposEnRMANOMBRETECNICO: TIBStringField
      FieldName = 'NOMBRETECNICO'
      Size = 71
    end
  end
  object ibstpProcInsertKardexBlc: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'Proc_insertKardexBlc'
    Left = 736
    Top = 496
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO_PRODUCTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_BALANCE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_POR'
        ParamType = ptInput
      end>
  end
  object qryVenceEn: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT p.*,  i.precio FROM '
      'PROC_DATOS_REP_INV_VENCE P, '
      'INVENTARIO_PRODUCTO i'
      'Where i.CODIGO = P.CODIGO'
      
        'And DIASPORVENCER between :diasporvencerIni And :diasporvencerfi' +
        'n'
      'And CODIGO_PROV between :codprovini And :codprovfin'
      'ORDER BY P.FECHA_VENCIMIENTO ')
    Left = 472
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'diasporvencerIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'diasporvencerfin'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'codprovini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codprovfin'
        ParamType = ptInput
      end>
  end
  object qryMaxMinProv: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select Max(CODIGO_CTE) CodMax'
      ', Min(CODIGO_CTE) CodMin'
      'from proveedores')
    Left = 592
    Top = 528
    object qryMaxMinProvCODMAX: TIntegerField
      FieldName = 'CODMAX'
    end
    object qryMaxMinProvCODMIN: TIntegerField
      FieldName = 'CODMIN'
    end
  end
  object qryInvProd_AuditarPrecioBase: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  ip.* '
      'FROM INVENTARIO_PRODUCTO ip'
      'WHERE '
      '  NOT EXISTS ('
      '    SELECT 1 '
      '    FROM PRECIO_UNIDADSURTIDORA s '
      '    WHERE ip.CODIGO = s.COD_PRODUCTO'
      '  )'
      '  AND ip.DESCRIPCION IS NOT NULL'
      '  AND ip.PRECIO_COMPRA > 0'
      '  AND ip.CIA_KEY =:ciakey'
      '')
    Left = 184
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ciakey'
        ParamType = ptUnknown
      end>
  end
end
