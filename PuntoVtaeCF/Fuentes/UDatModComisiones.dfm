object dmComision: TdmComision
  OldCreateOrder = False
  Left = 1113
  Top = 133
  Height = 510
  Width = 588
  object tblComisiones: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from COMISION'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  TIPO = :OLD_TIPO')
    InsertSQL.Strings = (
      'insert into COMISION'
      
        '  (CODIGO, TIPO, FECHA_INICIAL, FECHA_FINAL, MONTO_COMISION, STA' +
        'TUS)'
      'values'
      
        '  (:CODIGO, :TIPO, :FECHA_INICIAL, :FECHA_FINAL, :MONTO_COMISION' +
        ', :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  TIPO,'
      '  FECHA_INICIAL,'
      '  FECHA_FINAL,'
      '  MONTO_COMISION,'
      '  STATUS'
      'from COMISION '
      'where'
      '  CODIGO = :CODIGO and'
      '  TIPO = :TIPO')
    SelectSQL.Strings = (
      'Select  * from COMISION'
      'where :fecha between fecha_inicial and fecha_final'
      'order by codigo, tipo')
    ModifySQL.Strings = (
      'update COMISION'
      'set'
      '  CODIGO = :CODIGO,'
      '  TIPO = :TIPO,'
      '  FECHA_INICIAL = :FECHA_INICIAL,'
      '  FECHA_FINAL = :FECHA_FINAL,'
      '  MONTO_COMISION = :MONTO_COMISION,'
      '  STATUS = :STATUS'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  TIPO = :OLD_TIPO')
    Left = 88
    Top = 40
    object tblComisionesCODIGO: TIBStringField
      DisplayLabel = 'Codigo'
      DisplayWidth = 8
      FieldName = 'CODIGO'
      Origin = 'COMISION.CODIGO'
      Required = True
      Size = 12
    end
    object tblComisionesTIPO: TSmallintField
      DisplayLabel = 'Tipo'
      DisplayWidth = 7
      FieldName = 'TIPO'
      Origin = 'COMISION.TIPO'
    end
    object tblComisionesFECHA_INICIAL: TDateTimeField
      DisplayLabel = 'Fecha Inicial'
      DisplayWidth = 18
      FieldName = 'FECHA_INICIAL'
      Origin = 'COMISION.FECHA_INICIAL'
    end
    object tblComisionesFECHA_FINAL: TDateTimeField
      DisplayLabel = 'Fecha Final'
      DisplayWidth = 15
      FieldName = 'FECHA_FINAL'
      Origin = 'COMISION.FECHA_FINAL'
    end
    object tblComisionesMONTO_COMISION: TFloatField
      DisplayLabel = 'Monto Comision'
      DisplayWidth = 15
      FieldName = 'MONTO_COMISION'
      Origin = 'COMISION.MONTO_COMISION'
    end
    object tblComisionesSTATUS: TIBStringField
      DisplayLabel = 'Status'
      DisplayWidth = 6
      FieldName = 'STATUS'
      Origin = 'COMISION.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object tblTipoComision: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'TIPO_COMISIONINDEX1'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY66'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'TIPO_COMISION'
    Left = 88
    Top = 96
  end
  object tblInventarioProd: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    OnCalcFields = tblInventarioProdCalcFields
    BufferChunks = 1000
    CachedUpdates = True
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_TEXTO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'FECHA'
        DataType = ftDateTime
      end
      item
        Name = 'CODIGO_BARRA'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TIPO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'DESCRIPCIONADICIONAL'
        DataType = ftMemo
        Size = 8
      end
      item
        Name = 'CANTIDAD_REORDEN'
        DataType = ftInteger
      end
      item
        Name = 'PRECIO_ANT'
        DataType = ftFloat
      end
      item
        Name = 'CANTIDAD'
        DataType = ftFloat
      end
      item
        Name = 'PRECIO'
        DataType = ftFloat
      end
      item
        Name = 'BLCE_CANT_ENTRADA'
        DataType = ftFloat
      end
      item
        Name = 'BLCE_CANT_SALIDA'
        DataType = ftFloat
      end
      item
        Name = 'FECHA_ULTIMA_TRN'
        DataType = ftDateTime
      end
      item
        Name = 'STATUS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PORC_DESCUENTO'
        DataType = ftFloat
      end
      item
        Name = 'FOTO'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'PAGA_ITBI'
        DataType = ftSmallint
      end
      item
        Name = 'CODIGO_PRECIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'UNIDAD'
        DataType = ftFloat
      end
      item
        Name = 'PRECIO_COMPRA'
        DataType = ftFloat
      end
      item
        Name = 'PRECIO_MINIMO'
        DataType = ftFloat
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'FECHA_VENCIMIENTO'
        DataType = ftDateTime
      end
      item
        Name = 'INVENTARIAR'
        DataType = ftSmallint
      end
      item
        Name = 'PRECIO_TIPO_UNIDAD'
        DataType = ftFloat
      end
      item
        Name = 'TIPO_UNIDAD'
        DataType = ftInteger
      end
      item
        Name = 'ORIGEN'
        DataType = ftInteger
      end
      item
        Name = 'UBICACION'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'REFERENCIA_ALTERNA'
        DataType = ftString
        Size = 50
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
        Name = 'PRECIOVENTA1'
        DataType = ftFloat
      end
      item
        Name = 'PRECIOVENTA2'
        DataType = ftFloat
      end
      item
        Name = 'PRECIOVENTA3'
        DataType = ftFloat
      end
      item
        Name = 'PRECIOVENTA4'
        DataType = ftFloat
      end
      item
        Name = 'PORCUTILIDAD1'
        DataType = ftFloat
      end
      item
        Name = 'PORCUTILIDAD2'
        DataType = ftFloat
      end
      item
        Name = 'PORCUTILIDAD3'
        DataType = ftFloat
      end
      item
        Name = 'PORCUTILIDAD4'
        DataType = ftFloat
      end
      item
        Name = 'USARLEVELPRECIO'
        DataType = ftSmallint
      end
      item
        Name = 'CIA_KEY'
        DataType = ftInteger
      end
      item
        Name = 'SITUACIONPROD'
        DataType = ftSmallint
      end
      item
        Name = 'APLICAIMPTOCOMPRA'
        DataType = ftSmallint
      end
      item
        Name = 'CODFABRICANTE'
        DataType = ftInteger
      end
      item
        Name = 'CTAINVENTARIO'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'CTAVENTA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'CTACOMPRA'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'CODSUBCATEGORIA'
        DataType = ftInteger
      end
      item
        Name = 'CODCATEGORIA'
        DataType = ftInteger
      end
      item
        Name = 'PORCITBIS'
        DataType = ftFloat
      end
      item
        Name = 'COD_MONEDA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'KILOMETROS'
        DataType = ftFloat
      end
      item
        Name = 'RUTAIMAGEN'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'IDTASAITBIS'
        DataType = ftSmallint
      end
      item
        Name = 'PRECIO_ALQUILER'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'INVENTARIO_PRODUCTOINDEX1'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY47'
        Fields = 'CODIGO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'INVENTARIO_PRODUCTOINDEX2'
        Fields = 'CODIGO_TEXTO'
      end
      item
        Name = 'INVENTARIO_PRODUCTOINDEX3'
        Fields = 'DESCRIPCION'
      end
      item
        Name = 'IDX_INVENTARIO_PRODUCTO1'
        Fields = 'CODIGO_BARRA'
      end
      item
        Name = 'IDX_INVENTARIO_PRODUCTO2'
        Fields = 'FECHA_VENCIMIENTO'
      end
      item
        Name = 'IDX_INVENTARIO_PRODUCTO3'
        Fields = 'TIPO'
      end
      item
        Name = 'IDX_INVENTARIO_PRODUCTO4'
        Fields = 'REFERENCIA'
      end
      item
        Name = 'IDX_INVENTARIO_PRODUCTO5'
        Fields = 'TIPO_UNIDAD'
      end
      item
        Name = 'IDX_INVENTARIO_PRODUCTO6'
        Fields = 'PAGA_ITBI'
      end>
    StoreDefs = True
    TableName = 'INVENTARIO_PRODUCTO'
    Left = 192
    Top = 48
    object tblInventarioProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblInventarioProdCODIGO_TEXTO: TIBStringField
      FieldName = 'CODIGO_TEXTO'
      Size = 40
    end
    object tblInventarioProdDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object tblInventarioProdCodigoMasDesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'CodigoMasDesc'
      Size = 45
      Calculated = True
    end
  end
  object dstblInventarioProd: TDataSource
    DataSet = tblInventarioProd
    Left = 200
    Top = 96
  end
  object tblComisionTrab: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblComisionTrabAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from COMISION_TRABAJOS'
      'where'
      '  NUMEROID = :OLD_NUMEROID')
    InsertSQL.Strings = (
      'insert into COMISION_TRABAJOS'
      
        '  (NUMEROID, FECHA, FECHA_FACTURA, NUMERO_FACT, TIPO_PAGO, TIPO_' +
        'SERVICIO, '
      
        '   CODIGO_OPERADOR, MONTO_FACTURA, MONTO_COMISIONABLE, PORC_COMI' +
        'SION, COD_USUARIO, '
      
        '   FECHA_IN, IN_POR, FECHA_MOD, MOD_POR, STATUS, TIPO_COMISION, ' +
        'NUMERO_TRN)'
      'values'
      
        '  (:NUMEROID, :FECHA, :FECHA_FACTURA, :NUMERO_FACT, :TIPO_PAGO, ' +
        ':TIPO_SERVICIO, '
      
        '   :CODIGO_OPERADOR, :MONTO_FACTURA, :MONTO_COMISIONABLE, :PORC_' +
        'COMISION, '
      
        '   :COD_USUARIO, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR, :STAT' +
        'US, :TIPO_COMISION, '
      '   :NUMERO_TRN)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMEROID,'
      '  FECHA,'
      '  FECHA_FACTURA,'
      '  NUMERO_FACT,'
      '  TIPO_PAGO,'
      '  TIPO_SERVICIO,'
      '  CODIGO_OPERADOR,'
      '  MONTO_FACTURA,'
      '  MONTO_COMISIONABLE,'
      '  PORC_COMISION,'
      '  COD_USUARIO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  STATUS,'
      '  TIPO_COMISION,'
      '  NUMERO_TRN,'
      '  MONTO_COMISIONPAGAR'
      'from COMISION_TRABAJOS '
      'where'
      '  NUMEROID = :NUMEROID')
    SelectSQL.Strings = (
      'Select * from COMISION_TRABAJOS'
      'Where fecha between :fechaini and :fechafin'
      'and status in ('#39'A'#39','#39'R'#39')')
    ModifySQL.Strings = (
      'update COMISION_TRABAJOS'
      'set'
      '  NUMEROID = :NUMEROID,'
      '  FECHA = :FECHA,'
      '  FECHA_FACTURA = :FECHA_FACTURA,'
      '  NUMERO_FACT = :NUMERO_FACT,'
      '  TIPO_PAGO = :TIPO_PAGO,'
      '  TIPO_SERVICIO = :TIPO_SERVICIO,'
      '  CODIGO_OPERADOR = :CODIGO_OPERADOR,'
      '  MONTO_FACTURA = :MONTO_FACTURA,'
      '  MONTO_COMISIONABLE = :MONTO_COMISIONABLE,'
      '  PORC_COMISION = :PORC_COMISION,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  STATUS = :STATUS,'
      '  TIPO_COMISION = :TIPO_COMISION,'
      '  NUMERO_TRN = :NUMERO_TRN'
      'where'
      '  NUMEROID = :OLD_NUMEROID')
    GeneratorField.Field = 'NUMEROID'
    GeneratorField.Generator = 'gen_num_comtrab'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 88
    Top = 152
    object tblComisionTrabNUMEROID: TIntegerField
      FieldName = 'NUMEROID'
      Origin = 'COMISION_TRABAJOS.NUMEROID'
      Required = True
    end
    object tblComisionTrabFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'COMISION_TRABAJOS.FECHA'
      Required = True
    end
    object tblComisionTrabFECHA_FACTURA: TDateTimeField
      FieldName = 'FECHA_FACTURA'
      Origin = 'COMISION_TRABAJOS.FECHA_FACTURA'
      Required = True
    end
    object tblComisionTrabNUMERO_FACT: TIntegerField
      FieldName = 'NUMERO_FACT'
      Origin = 'COMISION_TRABAJOS.NUMERO_FACT'
      Required = True
    end
    object tblComisionTrabTIPO_PAGO: TSmallintField
      FieldName = 'TIPO_PAGO'
      Origin = 'COMISION_TRABAJOS.TIPO_PAGO'
      Required = True
    end
    object tblComisionTrabTIPO_SERVICIO: TIntegerField
      FieldName = 'TIPO_SERVICIO'
      Origin = 'COMISION_TRABAJOS.TIPO_SERVICIO'
    end
    object tblComisionTrabCODIGO_OPERADOR: TIntegerField
      FieldName = 'CODIGO_OPERADOR'
      Origin = 'COMISION_TRABAJOS.CODIGO_OPERADOR'
      Required = True
    end
    object tblComisionTrabMONTO_FACTURA: TFloatField
      FieldName = 'MONTO_FACTURA'
      Origin = 'COMISION_TRABAJOS.MONTO_FACTURA'
      DisplayFormat = ',0.00'
    end
    object tblComisionTrabMONTO_COMISIONABLE: TFloatField
      FieldName = 'MONTO_COMISIONABLE'
      Origin = 'COMISION_TRABAJOS.MONTO_COMISIONABLE'
      DisplayFormat = ',0.00'
    end
    object tblComisionTrabPORC_COMISION: TFloatField
      FieldName = 'PORC_COMISION'
      Origin = 'COMISION_TRABAJOS.PORC_COMISION'
    end
    object tblComisionTrabCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'COMISION_TRABAJOS.COD_USUARIO'
    end
    object tblComisionTrabFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'COMISION_TRABAJOS.FECHA_IN'
    end
    object tblComisionTrabIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'COMISION_TRABAJOS.IN_POR'
      Size = 12
    end
    object tblComisionTrabFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'COMISION_TRABAJOS.FECHA_MOD'
    end
    object tblComisionTrabMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'COMISION_TRABAJOS.MOD_POR'
      Size = 12
    end
    object tblComisionTrabSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'COMISION_TRABAJOS.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblComisionTrabMONTO_COMISIONPAGAR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'MONTO_COMISIONPAGAR'
      Origin = 'COMISION_TRABAJOS.MONTO_COMISIONPAGAR'
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object tblComisionTrabTIPO_COMISION: TSmallintField
      FieldName = 'TIPO_COMISION'
      Origin = 'COMISION_TRABAJOS.TIPO_COMISION'
    end
    object tblComisionTrabNUMERO_TRN: TIntegerField
      FieldName = 'NUMERO_TRN'
      Origin = 'COMISION_TRABAJOS.NUMERO_TRN'
    end
  end
  object dstblComisionTrab: TDataSource
    AutoEdit = False
    DataSet = tblComisionTrab
    Left = 192
    Top = 160
  end
  object tblTipoInventario: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    SQL.Strings = (
      'select * from TIPO_INVENTARIO'
      'order by descripcion')
    Left = 328
    Top = 112
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
  object dstblTipoInventario: TDataSource
    DataSet = tblTipoInventario
    Left = 336
    Top = 168
  end
  object qryEmpleados: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select iif(r.nombre is null,'#39#39',r.nombre)||'#39' '#39'|| iif(r.apellido i' +
        's null,'#39#39',r.apellido) nombreOperador,'
      '  r.*  '
      'From EMPLEADO  r')
    Left = 328
    Top = 216
    object qryEmpleadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMPLEADO.CODIGO'
      Required = True
    end
    object qryEmpleadosCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
      Origin = 'EMPLEADO.CODIGO_CIA'
      Required = True
    end
    object qryEmpleadosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object qryEmpleadosAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADO.APELLIDO'
      Size = 35
    end
    object qryEmpleadosCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'EMPLEADO.CEDULA'
      Size = 14
    end
    object qryEmpleadosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'EMPLEADO.FOTO'
      Size = 8
    end
    object qryEmpleadosPASSPORT: TIBStringField
      FieldName = 'PASSPORT'
      Origin = 'EMPLEADO.PASSPORT'
      Size = 14
    end
    object qryEmpleadosCALLE: TIBStringField
      FieldName = 'CALLE'
      Origin = 'EMPLEADO.CALLE'
      Size = 40
    end
    object qryEmpleadosNUM_CASA: TSmallintField
      FieldName = 'NUM_CASA'
      Origin = 'EMPLEADO.NUM_CASA'
    end
    object qryEmpleadosCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'EMPLEADO.CIUDAD'
      Size = 40
    end
    object qryEmpleadosPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'EMPLEADO.PAIS'
      Size = 40
    end
    object qryEmpleadosTELEF_CASA: TIBStringField
      FieldName = 'TELEF_CASA'
      Origin = 'EMPLEADO.TELEF_CASA'
      Size = 12
    end
    object qryEmpleadosTELEF_OFICINA: TIBStringField
      FieldName = 'TELEF_OFICINA'
      Origin = 'EMPLEADO.TELEF_OFICINA'
      Size = 12
    end
    object qryEmpleadosCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'EMPLEADO.CELULAR'
      Size = 12
    end
    object qryEmpleadosEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'EMPLEADO.EMAIL'
      Size = 40
    end
    object qryEmpleadosSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = 'EMPLEADO.SEXO'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadosESTADO_CIVIL: TIBStringField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'EMPLEADO.ESTADO_CIVIL'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadosTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'EMPLEADO.TELEF_REFERENCIA'
      Size = 12
    end
    object qryEmpleadosNOMBRE_REFERENCIA: TIBStringField
      FieldName = 'NOMBRE_REFERENCIA'
      Origin = 'EMPLEADO.NOMBRE_REFERENCIA'
      Size = 40
    end
    object qryEmpleadosFECHA_NAC: TDateTimeField
      FieldName = 'FECHA_NAC'
      Origin = 'EMPLEADO.FECHA_NAC'
    end
    object qryEmpleadosNACIONALIDAD: TIBStringField
      FieldName = 'NACIONALIDAD'
      Origin = 'EMPLEADO.NACIONALIDAD'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadosFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'EMPLEADO.FECHA_ENTRADA'
    end
    object qryEmpleadosFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'EMPLEADO.FECHA_SALIDA'
    end
    object qryEmpleadosSALARIO: TFloatField
      FieldName = 'SALARIO'
      Origin = 'EMPLEADO.SALARIO'
    end
    object qryEmpleadosTIPO_NOMINA: TSmallintField
      FieldName = 'TIPO_NOMINA'
      Origin = 'EMPLEADO.TIPO_NOMINA'
    end
    object qryEmpleadosTIPO_EMPLEADO: TSmallintField
      FieldName = 'TIPO_EMPLEADO'
      Origin = 'EMPLEADO.TIPO_EMPLEADO'
    end
    object qryEmpleadosDEPTO_EMP: TSmallintField
      FieldName = 'DEPTO_EMP'
      Origin = 'EMPLEADO.DEPTO_EMP'
    end
    object qryEmpleadosSECCION: TSmallintField
      FieldName = 'SECCION'
      Origin = 'EMPLEADO.SECCION'
    end
    object qryEmpleadosCARGO: TSmallintField
      FieldName = 'CARGO'
      Origin = 'EMPLEADO.CARGO'
    end
    object qryEmpleadosPAGA_AFP: TSmallintField
      FieldName = 'PAGA_AFP'
      Origin = 'EMPLEADO.PAGA_AFP'
    end
    object qryEmpleadosPAGA_TSS: TSmallintField
      FieldName = 'PAGA_TSS'
      Origin = 'EMPLEADO.PAGA_TSS'
    end
    object qryEmpleadosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'EMPLEADO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadosFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'EMPLEADO.FECHA_IN'
    end
    object qryEmpleadosIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'EMPLEADO.IN_POR'
      Size = 12
    end
    object qryEmpleadosFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'EMPLEADO.FECHA_MOD'
    end
    object qryEmpleadosMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'EMPLEADO.MOD_POR'
      Size = 12
    end
    object qryEmpleadosLICENCIA: TIBStringField
      FieldName = 'LICENCIA'
      Origin = 'EMPLEADO.LICENCIA'
      Size = 14
    end
    object qryEmpleadosFECHA_VENCE_LICENCIA: TDateTimeField
      FieldName = 'FECHA_VENCE_LICENCIA'
      Origin = 'EMPLEADO.FECHA_VENCE_LICENCIA'
    end
    object qryEmpleadosFECHAVACACIONES: TDateTimeField
      FieldName = 'FECHAVACACIONES'
      Origin = 'EMPLEADO.FECHAVACACIONES'
    end
    object qryEmpleadosNOMBREOPERADOR: TIBStringField
      FieldName = 'NOMBREOPERADOR'
      Size = 71
    end
  end
  object dsqryEmpleados: TDataSource
    DataSet = qryEmpleados
    Left = 328
    Top = 264
  end
  object qryVentas_base_credito: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  VENTAS_MAST.NUMERO,'
      '  VENTAS_MAST.FECHA,'
      '  VENTAS_MAST.CIA_KEY,'
      '  VENTAS_MAST.FORMA_PAGO,'
      '  VENTAS_MAST.MONEDA,'
      '  VENTAS_MAST.VALOR_TOTAL_DET,'
      '  VENTAS_MAST.NUMERO_FACTURA,'
      '  VENTAS_MAST.NUMERO_DOC_PAGO'
      'FROM  VENTAS_MAST'
      'Where  VENTAS_MAST.NUMERO_FACTURA =:numfactura'
      'And VENTAS_MAST.FORMA_PAGO  not in (1)'
      'ORDER BY VENTAS_MAST.NUMERO desc')
    Left = 200
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numfactura'
        ParamType = ptUnknown
      end>
  end
  object qryVentas_base_contado: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  VENTAS_MAST.NUMERO,'
      '  VENTAS_MAST.FECHA,'
      '  VENTAS_MAST.CIA_KEY,'
      '  VENTAS_MAST.FORMA_PAGO,'
      '  VENTAS_MAST.MONEDA,'
      '  VENTAS_MAST.VALOR_TOTAL_DET,'
      '  VENTAS_MAST.NUMERO_FACTURA,'
      '  VENTAS_MAST.NUMERO_DOC_PAGO'
      'FROM  VENTAS_MAST'
      'Where  VENTAS_MAST.NUMERO_DOC_PAGO=:numdocumento'
      'And VENTAS_MAST.FORMA_PAGO = 1'
      'ORDER BY VENTAS_MAST.NUMERO desc')
    Left = 200
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numdocumento'
        ParamType = ptUnknown
      end>
  end
  object qryVentas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  VENTAS_MAST.NUMERO,'
      '  VENTAS_MAST.FECHA,'
      '  VENTAS_MAST.CIA_KEY,'
      '  VENTAS_MAST.FORMA_PAGO,'
      '  VENTAS_MAST.MONEDA,'
      '  VENTAS_MAST.VALOR_TOTAL_DET,'
      '  VENTAS_MAST.NUMERO_FACTURA,'
      '  VENTAS_MAST.NUMERO_DOC_PAGO'
      'FROM  VENTAS_MAST'
      'Where  VENTAS_MAST.NUMERO_FACTURA =:numfactura'
      'And VENTAS_MAST.NUMERO_DOC_PAGO=:numdocumento'
      'And VENTAS_MAST.FORMA_PAGO = 1'
      'ORDER BY VENTAS_MAST.NUMERO desc')
    Left = 96
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numfactura'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numdocumento'
        ParamType = ptUnknown
      end>
    object qryVentasNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryVentasFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryVentasCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VENTAS_MAST.CIA_KEY'
    end
    object qryVentasFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VENTAS_MAST.FORMA_PAGO'
    end
    object qryVentasMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_MAST.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryVentasVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      Origin = 'VENTAS_MAST.VALOR_TOTAL_DET'
    end
    object qryVentasNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST.NUMERO_FACTURA'
    end
    object qryVentasNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VENTAS_MAST.NUMERO_DOC_PAGO'
    end
  end
  object qryListadoPagoComisiones: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   '
      '  COMISION_TRABAJOS.NUMEROID,'
      
        '  COMISION_TRABAJOS.FECHA,  COMISION_TRABAJOS.FECHA_FACTURA,  CO' +
        'MISION_TRABAJOS.NUMERO_FACT,'
      
        '(select sum(v.CANTIDAD) from ventas_Det v where v.NUMERO = COMIS' +
        'ION_TRABAJOS.NUMERO_TRN) cant,'
      '  COMISION_TRABAJOS.TIPO_PAGO,  '
      
        '  EMPLEADO.NOMBRE||'#39' '#39'||IIF(EMPLEADO.APELLIDO IS NULL,'#39#39',EMPLEAD' +
        'O.APELLIDO) NOMBREEMPLEADO,  '
      
        '  iif(COMISION_TRABAJOS.TIPO_PAGO = 1,'#39'CONTADO'#39','#39'CREDITO'#39') DESCF' +
        'PAGO,'
      
        '  COMISION_TRABAJOS.TIPO_SERVICIO,  COMISION_TRABAJOS.CODIGO_OPE' +
        'RADOR,'
      
        '  COMISION_TRABAJOS.MONTO_FACTURA,  COMISION_TRABAJOS.MONTO_COMI' +
        'SIONABLE,'
      
        '  COMISION_TRABAJOS.PORC_COMISION,  COMISION_TRABAJOS.COD_USUARI' +
        'O,'
      '  COMISION_TRABAJOS.FECHA_IN,'
      '  COMISION_TRABAJOS.IN_POR,'
      '  COMISION_TRABAJOS.FECHA_MOD,'
      '  COMISION_TRABAJOS.MOD_POR,'
      '  COMISION_TRABAJOS.STATUS,'
      '  COMISION_TRABAJOS.MONTO_COMISIONPAGAR,'
      '  TIPO_INVENTARIO.DESCRIPCION desc_tipoinv'
      'FROM'
      '  COMISION_TRABAJOS'
      
        '  LEFT OUTER JOIN TIPO_INVENTARIO ON (COMISION_TRABAJOS.TIPO_SER' +
        'VICIO = TIPO_INVENTARIO.CODIGO)'
      
        '  LEFT OUTER JOIN EMPLEADO ON (COMISION_TRABAJOS.CODIGO_OPERADOR' +
        ' = EMPLEADO.CODIGO)'
      'WHERE   COMISION_TRABAJOS.FECHA_FACTURA BETWEEN'
      ':FECHAINI AND :FECHAFIN'
      'AND   COMISION_TRABAJOS.STATUS IN ('#39'A'#39','#39'R'#39')')
    Left = 328
    Top = 64
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
      end>
    object qryListadoPagoComisionesNUMEROID: TIntegerField
      FieldName = 'NUMEROID'
      Origin = 'COMISION_TRABAJOS.NUMEROID'
      Required = True
    end
    object qryListadoPagoComisionesFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'COMISION_TRABAJOS.FECHA'
      Required = True
    end
    object qryListadoPagoComisionesFECHA_FACTURA: TDateTimeField
      FieldName = 'FECHA_FACTURA'
      Origin = 'COMISION_TRABAJOS.FECHA_FACTURA'
      Required = True
    end
    object qryListadoPagoComisionesNUMERO_FACT: TIntegerField
      FieldName = 'NUMERO_FACT'
      Origin = 'COMISION_TRABAJOS.NUMERO_FACT'
      Required = True
    end
    object qryListadoPagoComisionesTIPO_PAGO: TSmallintField
      FieldName = 'TIPO_PAGO'
      Origin = 'COMISION_TRABAJOS.TIPO_PAGO'
      Required = True
    end
    object qryListadoPagoComisionesNOMBREEMPLEADO: TIBStringField
      FieldName = 'NOMBREEMPLEADO'
      Size = 71
    end
    object qryListadoPagoComisionesDESCFPAGO: TIBStringField
      FieldName = 'DESCFPAGO'
      Required = True
      FixedChar = True
      Size = 7
    end
    object qryListadoPagoComisionesTIPO_SERVICIO: TIntegerField
      FieldName = 'TIPO_SERVICIO'
      Origin = 'COMISION_TRABAJOS.TIPO_SERVICIO'
    end
    object qryListadoPagoComisionesCODIGO_OPERADOR: TIntegerField
      FieldName = 'CODIGO_OPERADOR'
      Origin = 'COMISION_TRABAJOS.CODIGO_OPERADOR'
      Required = True
    end
    object qryListadoPagoComisionesMONTO_FACTURA: TFloatField
      FieldName = 'MONTO_FACTURA'
      Origin = 'COMISION_TRABAJOS.MONTO_FACTURA'
    end
    object qryListadoPagoComisionesMONTO_COMISIONABLE: TFloatField
      FieldName = 'MONTO_COMISIONABLE'
      Origin = 'COMISION_TRABAJOS.MONTO_COMISIONABLE'
    end
    object qryListadoPagoComisionesPORC_COMISION: TFloatField
      FieldName = 'PORC_COMISION'
      Origin = 'COMISION_TRABAJOS.PORC_COMISION'
    end
    object qryListadoPagoComisionesCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'COMISION_TRABAJOS.COD_USUARIO'
    end
    object qryListadoPagoComisionesFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'COMISION_TRABAJOS.FECHA_IN'
    end
    object qryListadoPagoComisionesIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'COMISION_TRABAJOS.IN_POR'
      Size = 12
    end
    object qryListadoPagoComisionesFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'COMISION_TRABAJOS.FECHA_MOD'
    end
    object qryListadoPagoComisionesMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'COMISION_TRABAJOS.MOD_POR'
      Size = 12
    end
    object qryListadoPagoComisionesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'COMISION_TRABAJOS.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryListadoPagoComisionesMONTO_COMISIONPAGAR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'MONTO_COMISIONPAGAR'
      Origin = 'COMISION_TRABAJOS.MONTO_COMISIONPAGAR'
      ReadOnly = True
    end
    object qryListadoPagoComisionesDESC_TIPOINV: TIBStringField
      FieldName = 'DESC_TIPOINV'
      Origin = 'TIPO_INVENTARIO.DESCRIPCION'
      Size = 30
    end
    object qryListadoPagoComisionesCANT: TFloatField
      FieldName = 'CANT'
    end
  end
  object qryListadoPagoComisionesBase: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   '
      '  COMISION_TRABAJOS.NUMEROID,'
      
        '  COMISION_TRABAJOS.FECHA,  COMISION_TRABAJOS.FECHA_FACTURA,  CO' +
        'MISION_TRABAJOS.NUMERO_FACT,'
      '  COMISION_TRABAJOS.TIPO_PAGO,  '
      
        '(select sum(v.CANTIDAD) from ventas_Det v where v.NUMERO = COMIS' +
        'ION_TRABAJOS.NUMERO_TRN) cant,'
      
        '  EMPLEADO.NOMBRE||'#39' '#39'||IIF(EMPLEADO.APELLIDO IS NULL,'#39#39',EMPLEAD' +
        'O.APELLIDO) NOMBREEMPLEADO,  '
      
        '  iif(COMISION_TRABAJOS.TIPO_PAGO = 1,'#39'CONTADO'#39','#39'CREDITO'#39') DESCF' +
        'PAGO,'
      
        '  COMISION_TRABAJOS.TIPO_SERVICIO,  COMISION_TRABAJOS.CODIGO_OPE' +
        'RADOR,'
      
        '  COMISION_TRABAJOS.MONTO_FACTURA,  COMISION_TRABAJOS.MONTO_COMI' +
        'SIONABLE,'
      
        '  COMISION_TRABAJOS.PORC_COMISION,  COMISION_TRABAJOS.COD_USUARI' +
        'O,'
      '  COMISION_TRABAJOS.FECHA_IN,'
      '  COMISION_TRABAJOS.IN_POR,'
      '  COMISION_TRABAJOS.FECHA_MOD,'
      '  COMISION_TRABAJOS.MOD_POR,'
      '  COMISION_TRABAJOS.STATUS,'
      '  COMISION_TRABAJOS.MONTO_COMISIONPAGAR,'
      '  TIPO_INVENTARIO.DESCRIPCION desc_tipoinv'
      'FROM'
      '  COMISION_TRABAJOS'
      
        '  LEFT OUTER JOIN TIPO_INVENTARIO ON (COMISION_TRABAJOS.TIPO_SER' +
        'VICIO = TIPO_INVENTARIO.CODIGO)'
      
        '  LEFT OUTER  JOIN EMPLEADO ON (COMISION_TRABAJOS.CODIGO_OPERADO' +
        'R = EMPLEADO.CODIGO)')
    Left = 448
    Top = 32
  end
  object qryEmpleado: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select e.nombre||'#39' '#39'||e.apellido as NombreCompleto, c.nombre des' +
        'c_cargo, e.* '
      'from EMPLEADO e'
      'left outer join CARGO_EMPLEADOS c on c.codigo = e.CARGO'
      'where e.status = '#39'A'#39
      'order by codigo desc')
    Left = 448
    Top = 136
    object qryEmpleadoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMPLEADO.CODIGO'
      Required = True
    end
    object qryEmpleadoCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
      Origin = 'EMPLEADO.CODIGO_CIA'
      Required = True
    end
    object qryEmpleadoNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object qryEmpleadoAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADO.APELLIDO'
      Size = 35
    end
    object qryEmpleadoCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'EMPLEADO.CEDULA'
      Size = 14
    end
    object qryEmpleadoFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'EMPLEADO.FOTO'
      Size = 8
    end
    object qryEmpleadoPASSPORT: TIBStringField
      FieldName = 'PASSPORT'
      Origin = 'EMPLEADO.PASSPORT'
      Size = 14
    end
    object qryEmpleadoCALLE: TIBStringField
      FieldName = 'CALLE'
      Origin = 'EMPLEADO.CALLE'
      Size = 40
    end
    object qryEmpleadoNUM_CASA: TSmallintField
      FieldName = 'NUM_CASA'
      Origin = 'EMPLEADO.NUM_CASA'
    end
    object qryEmpleadoCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'EMPLEADO.CIUDAD'
      Size = 40
    end
    object qryEmpleadoPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'EMPLEADO.PAIS'
      Size = 40
    end
    object qryEmpleadoTELEF_CASA: TIBStringField
      FieldName = 'TELEF_CASA'
      Origin = 'EMPLEADO.TELEF_CASA'
      Size = 12
    end
    object qryEmpleadoTELEF_OFICINA: TIBStringField
      FieldName = 'TELEF_OFICINA'
      Origin = 'EMPLEADO.TELEF_OFICINA'
      Size = 12
    end
    object qryEmpleadoCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'EMPLEADO.CELULAR'
      Size = 12
    end
    object qryEmpleadoEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'EMPLEADO.EMAIL'
      Size = 40
    end
    object qryEmpleadoSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = 'EMPLEADO.SEXO'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadoESTADO_CIVIL: TIBStringField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'EMPLEADO.ESTADO_CIVIL'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadoTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'EMPLEADO.TELEF_REFERENCIA'
      Size = 12
    end
    object qryEmpleadoNOMBRE_REFERENCIA: TIBStringField
      FieldName = 'NOMBRE_REFERENCIA'
      Origin = 'EMPLEADO.NOMBRE_REFERENCIA'
      Size = 40
    end
    object qryEmpleadoFECHA_NAC: TDateTimeField
      FieldName = 'FECHA_NAC'
      Origin = 'EMPLEADO.FECHA_NAC'
    end
    object qryEmpleadoNACIONALIDAD: TIBStringField
      FieldName = 'NACIONALIDAD'
      Origin = 'EMPLEADO.NACIONALIDAD'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadoFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'EMPLEADO.FECHA_ENTRADA'
    end
    object qryEmpleadoFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'EMPLEADO.FECHA_SALIDA'
    end
    object qryEmpleadoSALARIO: TFloatField
      FieldName = 'SALARIO'
      Origin = 'EMPLEADO.SALARIO'
    end
    object qryEmpleadoTIPO_NOMINA: TSmallintField
      FieldName = 'TIPO_NOMINA'
      Origin = 'EMPLEADO.TIPO_NOMINA'
    end
    object qryEmpleadoTIPO_EMPLEADO: TSmallintField
      FieldName = 'TIPO_EMPLEADO'
      Origin = 'EMPLEADO.TIPO_EMPLEADO'
    end
    object qryEmpleadoDEPTO_EMP: TSmallintField
      FieldName = 'DEPTO_EMP'
      Origin = 'EMPLEADO.DEPTO_EMP'
    end
    object qryEmpleadoSECCION: TSmallintField
      FieldName = 'SECCION'
      Origin = 'EMPLEADO.SECCION'
    end
    object qryEmpleadoCARGO: TSmallintField
      FieldName = 'CARGO'
      Origin = 'EMPLEADO.CARGO'
    end
    object qryEmpleadoPAGA_AFP: TSmallintField
      FieldName = 'PAGA_AFP'
      Origin = 'EMPLEADO.PAGA_AFP'
    end
    object qryEmpleadoPAGA_TSS: TSmallintField
      FieldName = 'PAGA_TSS'
      Origin = 'EMPLEADO.PAGA_TSS'
    end
    object qryEmpleadoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'EMPLEADO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadoFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'EMPLEADO.FECHA_IN'
    end
    object qryEmpleadoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'EMPLEADO.IN_POR'
      Size = 12
    end
    object qryEmpleadoFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'EMPLEADO.FECHA_MOD'
    end
    object qryEmpleadoMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'EMPLEADO.MOD_POR'
      Size = 12
    end
    object qryEmpleadoLICENCIA: TIBStringField
      FieldName = 'LICENCIA'
      Origin = 'EMPLEADO.LICENCIA'
      Size = 14
    end
    object qryEmpleadoFECHA_VENCE_LICENCIA: TDateTimeField
      FieldName = 'FECHA_VENCE_LICENCIA'
      Origin = 'EMPLEADO.FECHA_VENCE_LICENCIA'
    end
    object qryEmpleadoFECHAVACACIONES: TDateTimeField
      FieldName = 'FECHAVACACIONES'
      Origin = 'EMPLEADO.FECHAVACACIONES'
    end
    object qryEmpleadoNOMBRECOMPLETO: TIBStringField
      FieldName = 'NOMBRECOMPLETO'
      Size = 71
    end
    object qryEmpleadoDESC_CARGO: TIBStringField
      FieldName = 'DESC_CARGO'
      Origin = 'CARGO_EMPLEADOS.NOMBRE'
      Size = 40
    end
  end
  object tblMetasPorVendedor: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from METAS_PORVENDEDOR'
      'where'
      '  COD_VENDEDOR = :OLD_COD_VENDEDOR')
    InsertSQL.Strings = (
      'insert into METAS_PORVENDEDOR'
      '  (COD_VENDEDOR, FECHAINI, FECHAFIN, MONTO_BASE, STATUS)'
      'values'
      '  (:COD_VENDEDOR, :FECHAINI, :FECHAFIN, :MONTO_BASE, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  COD_VENDEDOR,'
      '  FECHAINI,'
      '  FECHAFIN,'
      '  MONTO_BASE,'
      '  STATUS'
      'from METAS_PORVENDEDOR '
      'where'
      '  COD_VENDEDOR = :COD_VENDEDOR')
    SelectSQL.Strings = (
      'Select * From METAS_PORVENDEDOR'
      'Where :fecha Between fechaini And fechafin')
    ModifySQL.Strings = (
      'update METAS_PORVENDEDOR'
      'set'
      '  COD_VENDEDOR = :COD_VENDEDOR,'
      '  FECHAINI = :FECHAINI,'
      '  FECHAFIN = :FECHAFIN,'
      '  MONTO_BASE = :MONTO_BASE,'
      '  STATUS = :STATUS'
      'where'
      '  COD_VENDEDOR = :OLD_COD_VENDEDOR')
    Left = 448
    Top = 192
    object tblMetasPorVendedorCOD_VENDEDOR: TIntegerField
      FieldName = 'COD_VENDEDOR'
      Origin = 'METAS_PORVENDEDOR.COD_VENDEDOR'
      Required = True
    end
    object tblMetasPorVendedorFECHAINI: TDateTimeField
      FieldName = 'FECHAINI'
      Origin = 'METAS_PORVENDEDOR.FECHAINI'
      Required = True
    end
    object tblMetasPorVendedorFECHAFIN: TDateTimeField
      FieldName = 'FECHAFIN'
      Origin = 'METAS_PORVENDEDOR.FECHAFIN'
      Required = True
    end
    object tblMetasPorVendedorMONTO_BASE: TFloatField
      FieldName = 'MONTO_BASE'
      Origin = 'METAS_PORVENDEDOR.MONTO_BASE'
    end
    object tblMetasPorVendedorSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'METAS_PORVENDEDOR.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dstblMetasPorVendedor: TDataSource
    AutoEdit = False
    DataSet = tblMetasPorVendedor
    Left = 448
    Top = 248
  end
  object tblComisionXVta: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from COMISION_XVTA'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into COMISION_XVTA'
      
        '  (ID, TIPO, FECHA_PAGO, FECHA_INICIO, FECHA_FINAL, CODIGO_EMPLE' +
        'ADO, '
      'MONTO_BASE, '
      '   PORC_COMISION, MONTO_COMISION, FECHA_IN, IN_POR, STATUS)'
      'values'
      '  (:ID, :TIPO, :FECHA_PAGO, :FECHA_INICIO, :FECHA_FINAL, '
      ':CODIGO_EMPLEADO, '
      
        '   :MONTO_BASE, :PORC_COMISION, :MONTO_COMISION, :FECHA_IN, :IN_' +
        'POR, '
      ':STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  TIPO,'
      '  FECHA_PAGO,'
      '  FECHA_INICIO,'
      '  FECHA_FINAL,'
      '  CODIGO_EMPLEADO,'
      '  MONTO_BASE,'
      '  PORC_COMISION,'
      '  MONTO_COMISION,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  STATUS'
      'from COMISION_XVTA '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'Select *  from COMISION_XVTA'
      'Where fecha_pago between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update COMISION_XVTA'
      'set'
      '  ID = :ID,'
      '  TIPO = :TIPO,'
      '  FECHA_PAGO = :FECHA_PAGO,'
      '  FECHA_INICIO = :FECHA_INICIO,'
      '  FECHA_FINAL = :FECHA_FINAL,'
      '  CODIGO_EMPLEADO = :CODIGO_EMPLEADO,'
      '  MONTO_BASE = :MONTO_BASE,'
      '  PORC_COMISION = :PORC_COMISION,'
      '  MONTO_COMISION = :MONTO_COMISION,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  STATUS = :STATUS'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_COMISION_XVTA_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 56
    Top = 376
    object tblComisionXVtaID: TIntegerField
      FieldName = 'ID'
      Origin = 'COMISION_XVTA.ID'
      Required = True
    end
    object tblComisionXVtaTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'COMISION_XVTA.TIPO'
      Required = True
    end
    object tblComisionXVtaFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Origin = 'COMISION_XVTA.FECHA_PAGO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblComisionXVtaFECHA_INICIO: TDateTimeField
      FieldName = 'FECHA_INICIO'
      Origin = 'COMISION_XVTA.FECHA_INICIO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblComisionXVtaFECHA_FINAL: TDateTimeField
      FieldName = 'FECHA_FINAL'
      Origin = 'COMISION_XVTA.FECHA_FINAL'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tblComisionXVtaCODIGO_EMPLEADO: TIntegerField
      FieldName = 'CODIGO_EMPLEADO'
      Origin = 'COMISION_XVTA.CODIGO_EMPLEADO'
      Required = True
    end
    object tblComisionXVtaMONTO_BASE: TFloatField
      FieldName = 'MONTO_BASE'
      Origin = 'COMISION_XVTA.MONTO_BASE'
    end
    object tblComisionXVtaPORC_COMISION: TFloatField
      FieldName = 'PORC_COMISION'
      Origin = 'COMISION_XVTA.PORC_COMISION'
    end
    object tblComisionXVtaMONTO_COMISION: TFloatField
      FieldName = 'MONTO_COMISION'
      Origin = 'COMISION_XVTA.MONTO_COMISION'
    end
    object tblComisionXVtaFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'COMISION_XVTA.FECHA_IN'
    end
    object tblComisionXVtaIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'COMISION_XVTA.IN_POR'
      Size = 12
    end
    object tblComisionXVtaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'COMISION_XVTA.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryVentasComisionable: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterOpen = qryVentasComisionableAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  r.NUMERO,'
      '  r.FECHA,'
      '  Coalesce(c.CODIGO_CTE,0) CODIGO_CTE,'
      '  Coalesce(c.NOMBRE_FACTURAR,'#39'***GENERICO***'#39') Nombrecliente,'
      '  r.CIA_KEY,'
      '  r.FORMA_PAGO,'
      '  r.MONEDA,'
      '  d.CODIGO_VENDEDOR,'
      '  r.COD_USR_CAJA,'
      
        'coalesce(e.NOMBRE,'#39'***'#39') ||'#39' '#39'||coalesce(e.apellido,'#39'***'#39') Nombr' +
        'eEmpleado,  '
      'D.CODIGO_PROD, D.DESCRIPCION,'
      '  D.CANTIDAD,'
      '  D.PRECIO, '
      '  d.CANTIDAD * d.PRECIO MONTO_BRUTO,'
      '  D.MONTO_DESC_ITEM*-1 Descuento,  '
      
        '  sum(D.VALOR_SERVICIO_DET + D.MONTO_DESC_ITEM*-1) VALOR_TOTAL_D' +
        'ET,  '
      '  r.NUMERO_FACTURA,'
      '  r.NUMERO_DOC_PAGO'
      'FROM  VENTAS_MAST r'
      'INNER JOIN VENTAS_DET D ON D.NUMERO = R.NUMERO'
      'left outer join EMPLEADO e on e.CODIGO = d.CODIGO_VENDEDOR'
      'left outer join CLIENTES c on c.CODIGO_CTE = r.CODIGO_CTE'
      'Where  r.FECHA between :fechaini and :fechafin'
      'And r.FORMA_PAGO = 1'
      'And R.STATUS NOT IN ('#39'C'#39')'
      'And d.STATUS_DET not in  ('#39'C'#39')'
      'GROUP BY '
      '  r.NUMERO,'
      '  r.FECHA,'
      '  Coalesce(c.CODIGO_CTE,0) ,'
      '  Coalesce(c.NOMBRE_FACTURAR,'#39'***GENERICO***'#39') ,'
      '  r.CIA_KEY,'
      '  r.FORMA_PAGO,'
      '  r.MONEDA,'
      '  d.CODIGO_VENDEDOR,'
      '  r.COD_USR_CAJA,'
      
        '  coalesce(e.NOMBRE,'#39'***'#39') ||'#39' '#39'||coalesce(e.apellido,'#39'***'#39') ,  ' +
        '  '
      '  D.CANTIDAD, D.PRECIO, '
      '  D.CODIGO_PROD, D.DESCRIPCION,  '
      '  D.MONTO_DESC_ITEM,'
      '  r.NUMERO_FACTURA,'
      '  r.NUMERO_DOC_PAGO'
      'ORDER BY r.NUMERO desc')
    OnFilterRecord = qryVentasComisionableFilterRecord
    Left = 160
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
    object qryVentasComisionableNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'VENTAS_MAST.NUMERO'
      Required = True
    end
    object qryVentasComisionableFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'VENTAS_MAST.FECHA'
    end
    object qryVentasComisionableCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
    end
    object qryVentasComisionableNOMBRECLIENTE: TIBStringField
      FieldName = 'NOMBRECLIENTE'
      Size = 40
    end
    object qryVentasComisionableCIA_KEY: TIntegerField
      FieldName = 'CIA_KEY'
      Origin = 'VENTAS_MAST.CIA_KEY'
    end
    object qryVentasComisionableFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'VENTAS_MAST.FORMA_PAGO'
    end
    object qryVentasComisionableMONEDA: TIBStringField
      FieldName = 'MONEDA'
      Origin = 'VENTAS_MAST.MONEDA'
      FixedChar = True
      Size = 1
    end
    object qryVentasComisionableCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VENTAS_DET.CODIGO_VENDEDOR'
    end
    object qryVentasComisionableCOD_USR_CAJA: TIntegerField
      FieldName = 'COD_USR_CAJA'
      Origin = 'VENTAS_MAST.COD_USR_CAJA'
    end
    object qryVentasComisionableNOMBREEMPLEADO: TIBStringField
      FieldName = 'NOMBREEMPLEADO'
      Size = 71
    end
    object qryVentasComisionableCODIGO_PROD: TIBStringField
      FieldName = 'CODIGO_PROD'
      Origin = 'VENTAS_DET.CODIGO_PROD'
      Size = 40
    end
    object qryVentasComisionableDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'VENTAS_DET.DESCRIPCION'
      Size = 80
    end
    object qryVentasComisionableCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'VENTAS_DET.CANTIDAD'
    end
    object qryVentasComisionablePRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'VENTAS_DET.PRECIO'
    end
    object qryVentasComisionableMONTO_BRUTO: TFloatField
      FieldName = 'MONTO_BRUTO'
      DisplayFormat = ',0.00'
    end
    object qryVentasComisionableDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
    end
    object qryVentasComisionableVALOR_TOTAL_DET: TFloatField
      FieldName = 'VALOR_TOTAL_DET'
      DisplayFormat = ',0.00'
    end
    object qryVentasComisionableNUMERO_FACTURA: TIntegerField
      FieldName = 'NUMERO_FACTURA'
      Origin = 'VENTAS_MAST.NUMERO_FACTURA'
    end
    object qryVentasComisionableNUMERO_DOC_PAGO: TIBStringField
      FieldName = 'NUMERO_DOC_PAGO'
      Origin = 'VENTAS_MAST.NUMERO_DOC_PAGO'
    end
  end
  object qryVentasComisionableSum: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   '
      '  d.CODIGO_VENDEDOR CODIGO_VENDEDOR,  '
      
        '  coalesce(e.NOMBRE,'#39'***'#39') ||'#39' '#39'||coalesce(e.apellido,'#39'***'#39') Nom' +
        'breEmpleado,'
      
        '  sum(D.VALOR_SERVICIO_DET + D.MONTO_DESC_ITEM*-1) ValorTotalVen' +
        'ta  '
      'FROM  VENTAS_MAST r'
      'INNER JOIN VENTAS_DET D ON D.NUMERO = R.NUMERO'
      'left outer join EMPLEADO e on e.CODIGO = d.CODIGO_VENDEDOR'
      'left outer join CLIENTES c on c.CODIGO_CTE = r.CODIGO_CTE'
      'Where  r.FECHA between :fechaini and :fechafin'
      'And r.FORMA_PAGO = 1'
      'And R.STATUS NOT IN ('#39'C'#39')'
      'And d.STATUS_DET not in  ('#39'C'#39')'
      'And e.NOMBRE is not null'
      'GROUP BY '
      '  d.CODIGO_VENDEDOR,  '
      '  coalesce(e.NOMBRE,'#39'***'#39') ||'#39' '#39'||coalesce(e.apellido,'#39'***'#39')    ')
    Left = 160
    Top = 400
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
    object qryVentasComisionableSumCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'VENTAS_MAST.CODIGO_VENDEDOR'
    end
    object qryVentasComisionableSumNOMBREEMPLEADO: TIBStringField
      FieldName = 'NOMBREEMPLEADO'
      Size = 71
    end
    object qryVentasComisionableSumVALORTOTALVENTA: TFloatField
      FieldName = 'VALORTOTALVENTA'
    end
  end
  object qryVendedores: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select c.NOMBRE desc_cargo,e.nombre||'#39' '#39'||e.apellido nombrevende' +
        'dor , e.* From EMPLEADO e'
      'inner join CARGO_EMPLEADOS c on c.CODIGO = e.CARGO'
      'where upper(c.NOMBRE) = '#39'VENDEDOR'#39)
    Left = 456
    Top = 312
    object qryVendedoresDESC_CARGO: TIBStringField
      FieldName = 'DESC_CARGO'
      Origin = 'CARGO_EMPLEADOS.NOMBRE'
      Size = 40
    end
    object qryVendedoresNOMBREVENDEDOR: TIBStringField
      FieldName = 'NOMBREVENDEDOR'
      Size = 71
    end
    object qryVendedoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMPLEADO.CODIGO'
      Required = True
    end
    object qryVendedoresNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object qryVendedoresAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADO.APELLIDO'
      Size = 35
    end
    object qryVendedoresDEPTO_EMP: TSmallintField
      FieldName = 'DEPTO_EMP'
      Origin = 'EMPLEADO.DEPTO_EMP'
    end
    object qryVendedoresSECCION: TSmallintField
      FieldName = 'SECCION'
      Origin = 'EMPLEADO.SECCION'
    end
    object qryVendedoresCARGO: TSmallintField
      FieldName = 'CARGO'
      Origin = 'EMPLEADO.CARGO'
    end
  end
end
