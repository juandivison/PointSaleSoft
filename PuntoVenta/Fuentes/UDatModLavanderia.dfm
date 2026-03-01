object dmLavanderia: TdmLavanderia
  OldCreateOrder = False
  Left = 707
  Top = 245
  Height = 468
  Width = 629
  object tblLAV_ORDEN: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblLAV_ORDENAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from LAV_ORDEN'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into LAV_ORDEN'
      
        '  (ID, ID_CLIENTE, FECHA_ENTRADA, FECHA_ENTREGA, ESTADO, APLICA_' +
        'ITBIS, '
      '   ID_OPERADOR, NOTAS, TOTAL, HORA_ENTRADA, HORA_ENTREGA)'
      'values'
      
        '  (:ID, :ID_CLIENTE, :FECHA_ENTRADA, :FECHA_ENTREGA, :ESTADO, :A' +
        'PLICA_ITBIS, '
      '   :ID_OPERADOR, :NOTAS, :TOTAL, :HORA_ENTRADA, :HORA_ENTREGA)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_CLIENTE,'
      '  FECHA_ENTRADA,'
      '  FECHA_ENTREGA,'
      '  ESTADO,'
      '  APLICA_ITBIS,'
      '  ID_OPERADOR,'
      '  NOTAS,'
      '  TOTAL,'
      '  HORA_ENTRADA,'
      '  HORA_ENTREGA'
      'from LAV_ORDEN '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'Select * From LAV_ORDEN'
      'where fecha_entrada between :fechaini and :fechafin')
    ModifySQL.Strings = (
      'update LAV_ORDEN'
      'set'
      '  ID = :ID,'
      '  ID_CLIENTE = :ID_CLIENTE,'
      '  FECHA_ENTRADA = :FECHA_ENTRADA,'
      '  FECHA_ENTREGA = :FECHA_ENTREGA,'
      '  ESTADO = :ESTADO,'
      '  APLICA_ITBIS = :APLICA_ITBIS,'
      '  ID_OPERADOR = :ID_OPERADOR,'
      '  NOTAS = :NOTAS,'
      '  TOTAL = :TOTAL,'
      '  HORA_ENTRADA = :HORA_ENTRADA,'
      '  HORA_ENTREGA = :HORA_ENTREGA'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_LAV_ORDEN_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 168
    Top = 24
    object tblLAV_ORDENID: TIntegerField
      FieldName = 'ID'
      Origin = 'LAV_ORDEN.ID'
      Required = True
    end
    object tblLAV_ORDENID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'LAV_ORDEN.ID_CLIENTE'
      Required = True
    end
    object tblLAV_ORDENFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'LAV_ORDEN.FECHA_ENTRADA'
      Required = True
    end
    object tblLAV_ORDENHORA_ENTRADA: TDateTimeField
      FieldName = 'HORA_ENTRADA'
      Origin = 'LAV_ORDEN.HORA_ENTRADA'
      DisplayFormat = 'hh:mm'
      EditMask = '!90:00;1;_'
    end
    object tblLAV_ORDENFECHA_ENTREGA: TDateTimeField
      FieldName = 'FECHA_ENTREGA'
      Origin = 'LAV_ORDEN.FECHA_ENTREGA'
    end
    object tblLAV_ORDENHORA_ENTREGA: TDateTimeField
      FieldName = 'HORA_ENTREGA'
      Origin = 'LAV_ORDEN.HORA_ENTREGA'
      DisplayFormat = 'hh:mm'
      EditMask = '!90:00;1;_'
    end
    object tblLAV_ORDENESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'LAV_ORDEN.ESTADO'
    end
    object tblLAV_ORDENAPLICA_ITBIS: TSmallintField
      FieldName = 'APLICA_ITBIS'
      Origin = 'LAV_ORDEN.APLICA_ITBIS'
    end
    object tblLAV_ORDENID_OPERADOR: TSmallintField
      FieldName = 'ID_OPERADOR'
      Origin = 'LAV_ORDEN.ID_OPERADOR'
    end
    object tblLAV_ORDENNOTAS: TIBStringField
      FieldName = 'NOTAS'
      Origin = 'LAV_ORDEN.NOTAS'
      Size = 255
    end
    object tblLAV_ORDENTOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = 'LAV_ORDEN.TOTAL'
    end
  end
  object tblLAV_PRENDA: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblLAV_PRENDAAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from LAV_PRENDA'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into LAV_PRENDA'
      
        '  (ID, ID_ORDEN, CODIGO_PRODUCTO, CANTIDAD, PRECIO_UNITARIO, MON' +
        'TO_BASE, '
      '   MONTO_ITBIS, TOTAL_LINEA, ETAPA_ACTUAL, CODIGO_BARRA)'
      'values'
      
        '  (:ID, :ID_ORDEN, :CODIGO_PRODUCTO, :CANTIDAD, :PRECIO_UNITARIO' +
        ', :MONTO_BASE, '
      '   :MONTO_ITBIS, :TOTAL_LINEA, :ETAPA_ACTUAL, :CODIGO_BARRA)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_ORDEN,'
      '  CODIGO_PRODUCTO,'
      '  CANTIDAD,'
      '  PRECIO_UNITARIO,'
      '  MONTO_BASE,'
      '  MONTO_ITBIS,'
      '  TOTAL_LINEA,'
      '  ETAPA_ACTUAL,'
      '  CODIGO_BARRA'
      'from LAV_PRENDA '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'Select * from LAV_PRENDA'
      'where id_orden=:idorden')
    ModifySQL.Strings = (
      'update LAV_PRENDA'
      'set'
      '  ID = :ID,'
      '  ID_ORDEN = :ID_ORDEN,'
      '  CODIGO_PRODUCTO = :CODIGO_PRODUCTO,'
      '  CANTIDAD = :CANTIDAD,'
      '  PRECIO_UNITARIO = :PRECIO_UNITARIO,'
      '  MONTO_BASE = :MONTO_BASE,'
      '  MONTO_ITBIS = :MONTO_ITBIS,'
      '  TOTAL_LINEA = :TOTAL_LINEA,'
      '  ETAPA_ACTUAL = :ETAPA_ACTUAL,'
      '  CODIGO_BARRA = :CODIGO_BARRA'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_LAV_PRENDA_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 168
    Top = 104
    object tblLAV_PRENDAID: TIntegerField
      FieldName = 'ID'
      Origin = 'LAV_PRENDA.ID'
      Required = True
    end
    object tblLAV_PRENDAID_ORDEN: TIntegerField
      FieldName = 'ID_ORDEN'
      Origin = 'LAV_PRENDA.ID_ORDEN'
      Required = True
    end
    object tblLAV_PRENDACODIGO_PRODUCTO: TIntegerField
      FieldName = 'CODIGO_PRODUCTO'
      Origin = 'LAV_PRENDA.CODIGO_PRODUCTO'
      Required = True
    end
    object tblLAV_PRENDACANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Origin = 'LAV_PRENDA.CANTIDAD'
    end
    object tblLAV_PRENDAPRECIO_UNITARIO: TFloatField
      FieldName = 'PRECIO_UNITARIO'
      Origin = 'LAV_PRENDA.PRECIO_UNITARIO'
    end
    object tblLAV_PRENDAMONTO_BASE: TFloatField
      FieldName = 'MONTO_BASE'
      Origin = 'LAV_PRENDA.MONTO_BASE'
    end
    object tblLAV_PRENDAMONTO_ITBIS: TFloatField
      FieldName = 'MONTO_ITBIS'
      Origin = 'LAV_PRENDA.MONTO_ITBIS'
    end
    object tblLAV_PRENDATOTAL_LINEA: TFloatField
      FieldName = 'TOTAL_LINEA'
      Origin = 'LAV_PRENDA.TOTAL_LINEA'
    end
    object tblLAV_PRENDAETAPA_ACTUAL: TIBStringField
      FieldName = 'ETAPA_ACTUAL'
      Origin = 'LAV_PRENDA.ETAPA_ACTUAL'
    end
    object tblLAV_PRENDACODIGO_BARRA: TIBStringField
      FieldName = 'CODIGO_BARRA'
      Origin = 'LAV_PRENDA.CODIGO_BARRA'
      Size = 40
    end
    object tblLAV_PRENDAPRENDA_SERVICIO: TStringField
      FieldKind = fkLookup
      FieldName = 'PRENDA_SERVICIO'
      LookupDataSet = qryInvLookup
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'CODIGO_PRODUCTO'
      Lookup = True
    end
  end
  object tblLAV_HISTORIAL: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from LAV_HISTORIAL'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into LAV_HISTORIAL'
      '  (ID, ID_PRENDA, ETAPA, FECHA_HORA, USUARIO_ID)'
      'values'
      '  (:ID, :ID_PRENDA, :ETAPA, :FECHA_HORA, :USUARIO_ID)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_PRENDA,'
      '  ETAPA,'
      '  FECHA_HORA,'
      '  USUARIO_ID'
      'from LAV_HISTORIAL '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'Select * from LAV_HISTORIAL')
    ModifySQL.Strings = (
      'update LAV_HISTORIAL'
      'set'
      '  ID = :ID,'
      '  ID_PRENDA = :ID_PRENDA,'
      '  ETAPA = :ETAPA,'
      '  FECHA_HORA = :FECHA_HORA,'
      '  USUARIO_ID = :USUARIO_ID'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_LAV_HISTORIAL_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 312
    Top = 32
    object tblLAV_HISTORIALID: TIntegerField
      FieldName = 'ID'
      Origin = 'LAV_HISTORIAL.ID'
      Required = True
    end
    object tblLAV_HISTORIALID_PRENDA: TIntegerField
      FieldName = 'ID_PRENDA'
      Origin = 'LAV_HISTORIAL.ID_PRENDA'
      Required = True
    end
    object tblLAV_HISTORIALETAPA: TIBStringField
      FieldName = 'ETAPA'
      Origin = 'LAV_HISTORIAL.ETAPA'
    end
    object tblLAV_HISTORIALFECHA_HORA: TDateTimeField
      FieldName = 'FECHA_HORA'
      Origin = 'LAV_HISTORIAL.FECHA_HORA'
    end
    object tblLAV_HISTORIALUSUARIO_ID: TSmallintField
      FieldName = 'USUARIO_ID'
      Origin = 'LAV_HISTORIAL.USUARIO_ID'
    end
  end
  object tbltasa_itbis: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TASA_ITBIS'
    Left = 408
    Top = 104
    object tbltasa_itbisIDTASAITBIS: TSmallintField
      FieldName = 'IDTASAITBIS'
    end
    object tbltasa_itbisDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
    end
    object tbltasa_itbisPORCIENTO: TFloatField
      FieldName = 'PORCIENTO'
    end
    object tbltasa_itbisSIMBOLO_TASA: TIBStringField
      FieldName = 'SIMBOLO_TASA'
      Size = 6
    end
  end
  object dstbltasa_itbis: TDataSource
    DataSet = tbltasa_itbis
    Left = 408
    Top = 160
  end
  object dstblLAV_ORDEN: TDataSource
    DataSet = tblLAV_ORDEN
    Left = 80
    Top = 48
  end
  object dstblLAV_HISTORIAL: TDataSource
    DataSet = tblLAV_HISTORIAL
    Left = 304
    Top = 80
  end
  object dstblLAV_PRENDA: TDataSource
    DataSet = tblLAV_PRENDA
    Left = 168
    Top = 160
  end
  object qryLavServicios: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from LAV_SERVICIO')
    Left = 400
    Top = 216
    object qryLavServiciosID: TIntegerField
      FieldName = 'ID'
      Origin = 'LAV_SERVICIO.ID'
      Required = True
    end
    object qryLavServiciosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'LAV_SERVICIO.DESCRIPCION'
      Size = 30
    end
  end
  object dsqryLavServicios: TDataSource
    DataSet = qryLavServicios
    Left = 400
    Top = 272
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
      'PRECIO_ANT '
      'From INVENTARIO_PRODUCTO')
    Left = 304
    Top = 160
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
    object qryInvLookupPRECIO_ANT: TFloatField
      FieldName = 'PRECIO_ANT'
      Origin = 'INVENTARIO_PRODUCTO.PRECIO_ANT'
    end
  end
  object dsqryInvLookup: TDataSource
    DataSet = qryInvLookup
    Left = 304
    Top = 216
  end
  object tblLAV_PRENDA_SERVICIO: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from LAV_PRENDA_SERVICIO'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into LAV_PRENDA_SERVICIO'
      '  (ID, ID_PRENDA, ID_SERVICIO)'
      'values'
      '  (:ID, :ID_PRENDA, :ID_SERVICIO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_PRENDA,'
      '  ID_SERVICIO'
      'from LAV_PRENDA_SERVICIO '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'Select r.*, lvs.descripcion descservicio'
      'From LAV_PRENDA_SERVICIO r'
      'inner join lav_servicio lvs on lvs.id = r.id_servicio'
      'Where id_prenda=:idprenda')
    ModifySQL.Strings = (
      'update LAV_PRENDA_SERVICIO'
      'set'
      '  ID = :ID,'
      '  ID_PRENDA = :ID_PRENDA,'
      '  ID_SERVICIO = :ID_SERVICIO'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_LAV_PRENDA_SERVICIO_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 168
    Top = 216
    object tblLAV_PRENDA_SERVICIOID: TIntegerField
      FieldName = 'ID'
      Origin = 'LAV_PRENDA_SERVICIO.ID'
      Required = True
    end
    object tblLAV_PRENDA_SERVICIOID_PRENDA: TIntegerField
      FieldName = 'ID_PRENDA'
      Origin = 'LAV_PRENDA_SERVICIO.ID_PRENDA'
      Required = True
    end
    object tblLAV_PRENDA_SERVICIOID_SERVICIO: TIntegerField
      FieldName = 'ID_SERVICIO'
      Origin = 'LAV_PRENDA_SERVICIO.ID_SERVICIO'
      Required = True
    end
    object tblLAV_PRENDA_SERVICIODESCSERVICIO: TIBStringField
      FieldName = 'DESCSERVICIO'
      Origin = 'LAV_SERVICIO.DESCRIPCION'
      Size = 30
    end
  end
  object dslbllav_prendaserv: TDataSource
    DataSet = tblLAV_PRENDA_SERVICIO
    Left = 168
    Top = 264
  end
  object qryreportOrdenLavanderia: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryreportOrdenLavanderiaAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '  o.ID AS ID_ORDEN,'
      '  o.FECHA_ENTRADA,'
      '  o.HORA_ENTRADA,'
      '  o.FECHA_ENTREGA,'
      '  o.HORA_ENTREGA,'
      '  o.TOTAL,'
      '  o.APLICA_ITBIS,'
      '  o.ESTADO,'
      '  o.NOTAS,'
      
        '(SELECT Sum(x.CANTIDAD) FROM LAV_PRENDA x where p.ID_ORDEN = x.I' +
        'D_ORDEN) CantPiezas,'
      '  c.NOMBRE_FACTURAR AS NOMBRE_CLIENTE,'
      '  c.TELEF_CONTACTO,'
      '  c.DIRECCION_CONT,'
      ''
      '  u.NOMBRECOMPLETO AS NOMBRE_OPERADOR,'
      ''
      '  p.ID AS ID_PRENDA,'
      '  p.CODIGO_PRODUCTO,'
      '  ip.DESCRIPCION AS NOMBRE_PRODUCTO,'
      '  p.CANTIDAD,'
      '  p.PRECIO_UNITARIO,'
      '  p.MONTO_BASE,'
      '  p.MONTO_ITBIS,'
      '  p.TOTAL_LINEA'
      ''
      'FROM'
      '  LAV_ORDEN o'
      'JOIN CLIENTEs c ON c.CODIGO_CTE = o.ID_CLIENTE'
      'JOIN USUARIO u ON u.CODIGO_EMPLEADO = o.ID_OPERADOR'
      'JOIN LAV_PRENDA p ON p.ID_ORDEN = o.ID'
      'JOIN INVENTARIO_PRODUCTO ip ON ip.CODIGO = p.CODIGO_PRODUCTO'
      ''
      'WHERE'
      '  o.ID = :ID_ORDEN  '
      'ORDER BY p.ID')
    Left = 296
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_ORDEN'
        ParamType = ptInput
      end>
    object qryreportOrdenLavanderiaID_ORDEN: TIntegerField
      FieldName = 'ID_ORDEN'
      Origin = 'LAV_ORDEN.ID'
      Required = True
    end
    object qryreportOrdenLavanderiaFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'LAV_ORDEN.FECHA_ENTRADA'
      Required = True
    end
    object qryreportOrdenLavanderiaFECHA_ENTREGA: TDateTimeField
      FieldName = 'FECHA_ENTREGA'
      Origin = 'LAV_ORDEN.FECHA_ENTREGA'
    end
    object qryreportOrdenLavanderiaTOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = 'LAV_ORDEN.TOTAL'
    end
    object qryreportOrdenLavanderiaAPLICA_ITBIS: TSmallintField
      FieldName = 'APLICA_ITBIS'
      Origin = 'LAV_ORDEN.APLICA_ITBIS'
    end
    object qryreportOrdenLavanderiaESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'LAV_ORDEN.ESTADO'
    end
    object qryreportOrdenLavanderiaNOTAS: TIBStringField
      FieldName = 'NOTAS'
      Origin = 'LAV_ORDEN.NOTAS'
      Size = 255
    end
    object qryreportOrdenLavanderiaNOMBRE_CLIENTE: TIBStringField
      FieldName = 'NOMBRE_CLIENTE'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryreportOrdenLavanderiaTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryreportOrdenLavanderiaDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryreportOrdenLavanderiaNOMBRE_OPERADOR: TIBStringField
      FieldName = 'NOMBRE_OPERADOR'
      Origin = 'USUARIO.NOMBRECOMPLETO'
      Size = 40
    end
    object qryreportOrdenLavanderiaID_PRENDA: TIntegerField
      FieldName = 'ID_PRENDA'
      Origin = 'LAV_PRENDA.ID'
      Required = True
    end
    object qryreportOrdenLavanderiaCODIGO_PRODUCTO: TIntegerField
      FieldName = 'CODIGO_PRODUCTO'
      Origin = 'LAV_PRENDA.CODIGO_PRODUCTO'
      Required = True
    end
    object qryreportOrdenLavanderiaNOMBRE_PRODUCTO: TIBStringField
      FieldName = 'NOMBRE_PRODUCTO'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryreportOrdenLavanderiaCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Origin = 'LAV_PRENDA.CANTIDAD'
    end
    object qryreportOrdenLavanderiaPRECIO_UNITARIO: TFloatField
      FieldName = 'PRECIO_UNITARIO'
      Origin = 'LAV_PRENDA.PRECIO_UNITARIO'
    end
    object qryreportOrdenLavanderiaMONTO_BASE: TFloatField
      FieldName = 'MONTO_BASE'
      Origin = 'LAV_PRENDA.MONTO_BASE'
    end
    object qryreportOrdenLavanderiaMONTO_ITBIS: TFloatField
      FieldName = 'MONTO_ITBIS'
      Origin = 'LAV_PRENDA.MONTO_ITBIS'
    end
    object qryreportOrdenLavanderiaTOTAL_LINEA: TFloatField
      FieldName = 'TOTAL_LINEA'
      Origin = 'LAV_PRENDA.TOTAL_LINEA'
    end
    object qryreportOrdenLavanderiaHORA_ENTRADA: TDateTimeField
      FieldName = 'HORA_ENTRADA'
      Origin = 'LAV_ORDEN.HORA_ENTRADA'
    end
    object qryreportOrdenLavanderiaHORA_ENTREGA: TDateTimeField
      FieldName = 'HORA_ENTREGA'
      Origin = 'LAV_ORDEN.HORA_ENTREGA'
    end
    object qryreportOrdenLavanderiaCANTPIEZAS: TIntegerField
      FieldName = 'CANTPIEZAS'
    end
  end
  object qryMembrete: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from MEMBRETE_CIA'
      'where CODIGO_CIA =:CODIGO_CIA')
    Left = 312
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO_CIA'
        ParamType = ptInput
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
  object qryServOrdenPrenda: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select lvs.descripcion descservicio'
      'From LAV_PRENDA_SERVICIO r'
      'Inner join lav_servicio lvs on lvs.id = r.id_servicio'
      'Where r.ID_PRENDA =:idordenprenda')
    Left = 416
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idordenprenda'
        ParamType = ptInput
      end>
    object qryServOrdenPrendaDESCSERVICIO: TIBStringField
      FieldName = 'DESCSERVICIO'
      Origin = 'LAV_SERVICIO.DESCRIPCION'
      Size = 30
    end
  end
  object qryrepstickersprendas: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT   '
      '  p.ID_ORDEN,'
      
        '  (SELECT Sum(x.CANTIDAD) FROM LAV_PRENDA x WHERE p.ID_ORDEN = x' +
        '.ID_ORDEN) CantPiezas,'
      '  p.ID idserieorden,'
      '  o.FECHA_ENTREGA,'
      '  o.HORA_ENTREGA,'
      '  '
      '  u.NOMBRECOMPLETO AS NOMBRE_OPERADOR,'
      '  p.CODIGO_PRODUCTO,'
      '  ip.DESCRIPCION AS NOMBRE_PRODUCTO,'
      '  1 AS CANTIDAD_REPETIDA -- Cada fila representa 1 unidad'
      ''
      'FROM'
      '  LAV_ORDEN o'
      'JOIN CLIENTES c ON c.CODIGO_CTE = o.ID_CLIENTE'
      'JOIN USUARIO u ON u.CODIGO_EMPLEADO = o.ID_OPERADOR'
      'JOIN LAV_PRENDA p ON p.ID_ORDEN = o.ID'
      'JOIN INVENTARIO_PRODUCTO ip ON ip.CODIGO = p.CODIGO_PRODUCTO'
      'JOIN AUX_NUMEROS n ON n.N <= p.CANTIDAD'
      ''
      'WHERE'
      '  p.ID_ORDEN = :ID_ORDEN'
      'ORDER BY p.ID, n.N')
    Left = 208
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_ORDEN'
        ParamType = ptInput
      end>
    object qryrepstickersprendasID_ORDEN: TIntegerField
      FieldName = 'ID_ORDEN'
      Origin = 'LAV_PRENDA.ID_ORDEN'
      Required = True
    end
    object qryrepstickersprendasCANTPIEZAS: TIntegerField
      FieldName = 'CANTPIEZAS'
    end
    object qryrepstickersprendasIDSERIEORDEN: TIntegerField
      FieldName = 'IDSERIEORDEN'
      Origin = 'LAV_PRENDA.ID'
      Required = True
    end
    object qryrepstickersprendasFECHA_ENTREGA: TDateTimeField
      FieldName = 'FECHA_ENTREGA'
      Origin = 'LAV_ORDEN.FECHA_ENTREGA'
    end
    object qryrepstickersprendasHORA_ENTREGA: TDateTimeField
      FieldName = 'HORA_ENTREGA'
      Origin = 'LAV_ORDEN.HORA_ENTREGA'
    end
    object qryrepstickersprendasNOMBRE_OPERADOR: TIBStringField
      FieldName = 'NOMBRE_OPERADOR'
      Origin = 'USUARIO.NOMBRECOMPLETO'
      Size = 40
    end
    object qryrepstickersprendasCODIGO_PRODUCTO: TIntegerField
      FieldName = 'CODIGO_PRODUCTO'
      Origin = 'LAV_PRENDA.CODIGO_PRODUCTO'
      Required = True
    end
    object qryrepstickersprendasNOMBRE_PRODUCTO: TIBStringField
      FieldName = 'NOMBRE_PRODUCTO'
      Origin = 'INVENTARIO_PRODUCTO.DESCRIPCION'
      Size = 80
    end
    object qryrepstickersprendasCANTIDAD_REPETIDA: TIntegerField
      FieldName = 'CANTIDAD_REPETIDA'
      Required = True
    end
  end
  object tblLAV_PAGO: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from LAV_PAGO'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into LAV_PAGO'
      
        '  (ID, ID_ORDEN, FECHA_PAGO, MONTO, METODO_PAGO, OBSERVACIONES, ' +
        'USUARIO_ID)'
      'values'
      
        '  (:ID, :ID_ORDEN, :FECHA_PAGO, :MONTO, :METODO_PAGO, :OBSERVACI' +
        'ONES, :USUARIO_ID)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_ORDEN,'
      '  FECHA_PAGO,'
      '  MONTO,'
      '  METODO_PAGO,'
      '  OBSERVACIONES,'
      '  USUARIO_ID'
      'from LAV_PAGO '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'SELECT '
      '  ID,'
      '  ID_ORDEN,'
      '  FECHA_PAGO,'
      '  MONTO,'
      '  METODO_PAGO,'
      '  OBSERVACIONES,'
      '  USUARIO_ID'
      'FROM '
      '  LAV_PAGO'
      'WHERE '
      '  ID_ORDEN = :ID_ORDEN'
      'ORDER BY '
      '  FECHA_PAGO')
    ModifySQL.Strings = (
      'update LAV_PAGO'
      'set'
      '  ID = :ID,'
      '  ID_ORDEN = :ID_ORDEN,'
      '  FECHA_PAGO = :FECHA_PAGO,'
      '  MONTO = :MONTO,'
      '  METODO_PAGO = :METODO_PAGO,'
      '  OBSERVACIONES = :OBSERVACIONES,'
      '  USUARIO_ID = :USUARIO_ID'
      'where'
      '  ID = :OLD_ID')
    Left = 32
    Top = 128
    object tblLAV_PAGOID: TIntegerField
      FieldName = 'ID'
      Origin = 'LAV_PAGO.ID'
      Required = True
    end
    object tblLAV_PAGOID_ORDEN: TIntegerField
      FieldName = 'ID_ORDEN'
      Origin = 'LAV_PAGO.ID_ORDEN'
      Required = True
    end
    object tblLAV_PAGOFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Origin = 'LAV_PAGO.FECHA_PAGO'
      Required = True
    end
    object tblLAV_PAGOMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'LAV_PAGO.MONTO'
      Required = True
    end
    object tblLAV_PAGOMETODO_PAGO: TIBStringField
      FieldName = 'METODO_PAGO'
      Origin = 'LAV_PAGO.METODO_PAGO'
    end
    object tblLAV_PAGOOBSERVACIONES: TIBStringField
      FieldName = 'OBSERVACIONES'
      Origin = 'LAV_PAGO.OBSERVACIONES'
      Size = 255
    end
    object tblLAV_PAGOUSUARIO_ID: TSmallintField
      FieldName = 'USUARIO_ID'
      Origin = 'LAV_PAGO.USUARIO_ID'
    end
  end
  object qryPrendasEntrega: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  p.ID,'
      '  p.ID_ORDEN,'
      '  p.CODIGO_PRODUCTO,'
      '  ip.DESCRIPCION AS NOMBRE_PRODUCTO,'
      '  p.CANTIDAD,'
      '  p.CANTIDAD_ENTREGADA,'
      '  p.FECHA_ENTREGA'
      'FROM '
      '  LAV_PRENDA p'
      'JOIN INVENTARIO_PRODUCTO ip ON ip.CODIGO = p.CODIGO_PRODUCTO'
      'WHERE '
      '  p.ID_ORDEN = :ID_ORDEN'
      'ORDER BY '
      '  p.ID')
    Left = 16
    Top = 204
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_ORDEN'
        ParamType = ptInput
      end>
  end
  object qryOrdenEntrega: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  o.ID AS ID_ORDEN,'
      '  o.ID_CLIENTE,'
      '  o.FECHA_ENTRADA,'
      '  o.FECHA_ENTREGA,'
      '  o.hora_entrada,'
      '  o.hora_entrega,'
      '  o.ESTADO,'
      '  o.TOTAL,'
      '  o.SALDO,'
      '  c.NOMBRE_FACTURAR AS NOMBRE_CLIENTE'
      'FROM '
      '  LAV_ORDEN o'
      'JOIN CLIENTES c ON c.CODIGO_CTE = o.ID_CLIENTE'
      'WHERE '
      '  o.ID = :ID_ORDEN')
    Left = 32
    Top = 268
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_ORDEN'
        ParamType = ptInput
      end>
    object qryOrdenEntregaID_ORDEN: TIntegerField
      FieldName = 'ID_ORDEN'
      Origin = 'LAV_ORDEN.ID'
      Required = True
    end
    object qryOrdenEntregaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'LAV_ORDEN.ID_CLIENTE'
      Required = True
    end
    object qryOrdenEntregaFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'LAV_ORDEN.FECHA_ENTRADA'
      Required = True
    end
    object qryOrdenEntregaFECHA_ENTREGA: TDateTimeField
      FieldName = 'FECHA_ENTREGA'
      Origin = 'LAV_ORDEN.FECHA_ENTREGA'
    end
    object qryOrdenEntregaHORA_ENTRADA: TDateTimeField
      FieldName = 'HORA_ENTRADA'
      Origin = 'LAV_ORDEN.HORA_ENTRADA'
    end
    object qryOrdenEntregaHORA_ENTREGA: TDateTimeField
      FieldName = 'HORA_ENTREGA'
      Origin = 'LAV_ORDEN.HORA_ENTREGA'
    end
    object qryOrdenEntregaESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'LAV_ORDEN.ESTADO'
    end
    object qryOrdenEntregaTOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = 'LAV_ORDEN.TOTAL'
    end
    object qryOrdenEntregaSALDO: TFloatField
      FieldName = 'SALDO'
      Origin = 'LAV_ORDEN.SALDO'
    end
    object qryOrdenEntregaNOMBRE_CLIENTE: TIBStringField
      FieldName = 'NOMBRE_CLIENTE'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
  end
end
