object dmDatos: TdmDatos
  OldCreateOrder = False
  Left = 705
  Top = 205
  Height = 507
  Width = 609
  object qryTasa: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM VALORMONEDA (:CODIGO,:FECHA_SERVICIO)')
    Left = 32
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
    Left = 32
    Top = 72
  end
  object tblPlanFunerario: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblPlanFunerarioAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PLAN_FUNERARIO'
      'where'
      '  ID_PLAN = :OLD_ID_PLAN and'
      '  ID_TIPO_PLAN = :OLD_ID_TIPO_PLAN and'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    InsertSQL.Strings = (
      'insert into PLAN_FUNERARIO'
      
        '  (ID_PLAN, ID_TIPO_PLAN, CODIGO_CTE, FECHA_APERTURA, FECHA_CIER' +
        'RE, STATUS, '
      
        '   FECHA_IN, INS_POR, FECHA_UPDATE, UPDATE_POR, COD_UDUARIO, FEC' +
        'HA_PAGO, '
      
        '   NUM_ULTIMA_FACT, CARGAR_ITBIS, TIPO_NCF, FECHA_ULT_FACT, COD_' +
        'SERVICIO, '
      '   COD_VENDEDOR)'
      'values'
      
        '  (:ID_PLAN, :ID_TIPO_PLAN, :CODIGO_CTE, :FECHA_APERTURA, :FECHA' +
        '_CIERRE, '
      
        '   :STATUS, :FECHA_IN, :INS_POR, :FECHA_UPDATE, :UPDATE_POR, :CO' +
        'D_UDUARIO, '
      
        '   :FECHA_PAGO, :NUM_ULTIMA_FACT, :CARGAR_ITBIS, :TIPO_NCF, :FEC' +
        'HA_ULT_FACT, '
      '   :COD_SERVICIO, :COD_VENDEDOR)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PLAN,'
      '  ID_TIPO_PLAN,'
      '  CODIGO_CTE,'
      '  FECHA_APERTURA,'
      '  FECHA_CIERRE,'
      '  STATUS,'
      '  FECHA_IN,'
      '  INS_POR,'
      '  FECHA_UPDATE,'
      '  UPDATE_POR,'
      '  COD_UDUARIO,'
      '  FECHA_PAGO,'
      '  NUM_ULTIMA_FACT,'
      '  CARGAR_ITBIS,'
      '  TIPO_NCF,'
      '  FECHA_ULT_FACT,'
      '  COD_SERVICIO,'
      '  COD_VENDEDOR'
      'from PLAN_FUNERARIO '
      'where'
      '  ID_PLAN = :ID_PLAN and'
      '  ID_TIPO_PLAN = :ID_TIPO_PLAN and'
      '  CODIGO_CTE = :CODIGO_CTE')
    SelectSQL.Strings = (
      'SELECT  * FROM PLAN_FUNERARIO')
    ModifySQL.Strings = (
      'update PLAN_FUNERARIO'
      'set'
      '  ID_PLAN = :ID_PLAN,'
      '  ID_TIPO_PLAN = :ID_TIPO_PLAN,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  FECHA_APERTURA = :FECHA_APERTURA,'
      '  FECHA_CIERRE = :FECHA_CIERRE,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  INS_POR = :INS_POR,'
      '  FECHA_UPDATE = :FECHA_UPDATE,'
      '  UPDATE_POR = :UPDATE_POR,'
      '  COD_UDUARIO = :COD_UDUARIO,'
      '  FECHA_PAGO = :FECHA_PAGO,'
      '  NUM_ULTIMA_FACT = :NUM_ULTIMA_FACT,'
      '  CARGAR_ITBIS = :CARGAR_ITBIS,'
      '  TIPO_NCF = :TIPO_NCF,'
      '  FECHA_ULT_FACT = :FECHA_ULT_FACT,'
      '  COD_SERVICIO = :COD_SERVICIO,'
      '  COD_VENDEDOR = :COD_VENDEDOR'
      'where'
      '  ID_PLAN = :OLD_ID_PLAN and'
      '  ID_TIPO_PLAN = :OLD_ID_TIPO_PLAN and'
      '  CODIGO_CTE = :OLD_CODIGO_CTE')
    GeneratorField.Field = 'ID_PLAN'
    GeneratorField.Generator = 'GEN_ID_PLAN'
    Left = 120
    Top = 24
    object tblPlanFunerarioID_PLAN: TIntegerField
      DisplayLabel = 'IdPlan'
      FieldName = 'ID_PLAN'
      Origin = 'PLAN_FUNERARIO.ID_PLAN'
      Required = True
    end
    object tblPlanFunerarioID_TIPO_PLAN: TSmallintField
      DisplayLabel = 'ITipoPlan'
      FieldName = 'ID_TIPO_PLAN'
      Origin = 'PLAN_FUNERARIO.ID_TIPO_PLAN'
      Required = True
    end
    object tblPlanFunerarioCODIGO_CTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CODIGO_CTE'
      Origin = 'PLAN_FUNERARIO.CODIGO_CTE'
      Required = True
    end
    object tblPlanFunerarioFECHA_APERTURA: TDateTimeField
      DisplayLabel = 'Fecha Apertura'
      FieldName = 'FECHA_APERTURA'
      Origin = 'PLAN_FUNERARIO.FECHA_APERTURA'
      Required = True
    end
    object tblPlanFunerarioFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fecha Cierre'
      FieldName = 'FECHA_CIERRE'
      Origin = 'PLAN_FUNERARIO.FECHA_CIERRE'
    end
    object tblPlanFunerarioSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'PLAN_FUNERARIO.STATUS'
      Size = 1
    end
    object tblPlanFunerarioFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PLAN_FUNERARIO.FECHA_IN'
    end
    object tblPlanFunerarioINS_POR: TIBStringField
      FieldName = 'INS_POR'
      Origin = 'PLAN_FUNERARIO.INS_POR'
      Size = 12
    end
    object tblPlanFunerarioFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'PLAN_FUNERARIO.FECHA_UPDATE'
    end
    object tblPlanFunerarioUPDATE_POR: TIBStringField
      FieldName = 'UPDATE_POR'
      Origin = 'PLAN_FUNERARIO.UPDATE_POR'
      Size = 12
    end
    object tblPlanFunerarioCOD_UDUARIO: TIntegerField
      FieldName = 'COD_UDUARIO'
      Origin = 'PLAN_FUNERARIO.COD_UDUARIO'
    end
    object tblPlanFunerarioFECHA_PAGO: TDateTimeField
      DisplayLabel = 'Fecha Pago'
      FieldName = 'FECHA_PAGO'
      Origin = 'PLAN_FUNERARIO.FECHA_PAGO'
      Required = True
    end
    object tblPlanFunerarioNUM_ULTIMA_FACT: TFloatField
      DisplayLabel = 'NumUltFactura'
      FieldName = 'NUM_ULTIMA_FACT'
      Origin = 'PLAN_FUNERARIO.NUM_ULTIMA_FACT'
    end
    object tblPlanFunerarioCARGAR_ITBIS: TSmallintField
      FieldName = 'CARGAR_ITBIS'
      Origin = 'PLAN_FUNERARIO.CARGAR_ITBIS'
    end
    object tblPlanFunerarioTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'PLAN_FUNERARIO.TIPO_NCF'
      Size = 2
    end
    object tblPlanFunerarioFECHA_ULT_FACT: TDateTimeField
      DisplayLabel = 'FechaUltFactura'
      FieldName = 'FECHA_ULT_FACT'
      Origin = 'PLAN_FUNERARIO.FECHA_ULT_FACT'
    end
    object tblPlanFunerarioCOD_SERVICIO: TIntegerField
      FieldName = 'COD_SERVICIO'
      Origin = 'PLAN_FUNERARIO.COD_SERVICIO'
    end
    object tblPlanFunerarioCOD_VENDEDOR: TIntegerField
      DisplayLabel = 'CodVendedor'
      FieldName = 'COD_VENDEDOR'
      Origin = 'PLAN_FUNERARIO.COD_VENDEDOR'
    end
  end
  object dstblPlanFunerario: TDataSource
    DataSet = tblPlanFunerario
    Left = 208
    Top = 136
  end
  object tblTipoPlan: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    FieldDefs = <
      item
        Name = 'TIPO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CANT_DEP'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'IDX_TIPO_PLAN1'
        Fields = 'TIPO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'TIPO_PLAN'
    Left = 208
    Top = 24
    object tblTipoPlanTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object tblTipoPlanDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object tblTipoPlanCANT_DEP: TIntegerField
      FieldName = 'CANT_DEP'
    end
  end
  object qryClientes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from CLIENTES')
    Left = 288
    Top = 136
    object qryClientesCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryClientesTIPO_CLIENTE: TSmallintField
      FieldName = 'TIPO_CLIENTE'
      Origin = 'CLIENTES.TIPO_CLIENTE'
    end
    object qryClientesFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'CLIENTES.FOTO'
      Size = 8
    end
    object qryClientesNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryClientesNOMBRE_ABREV: TIBStringField
      FieldName = 'NOMBRE_ABREV'
      Origin = 'CLIENTES.NOMBRE_ABREV'
      Size = 30
    end
    object qryClientesMONEDA_FACT: TIBStringField
      FieldName = 'MONEDA_FACT'
      Origin = 'CLIENTES.MONEDA_FACT'
      FixedChar = True
      Size = 1
    end
    object qryClientesNOMBRE_FACTURAR: TIBStringField
      FieldName = 'NOMBRE_FACTURAR'
      Origin = 'CLIENTES.NOMBRE_FACTURAR'
      Size = 40
    end
    object qryClientesCONTACTO: TIBStringField
      FieldName = 'CONTACTO'
      Origin = 'CLIENTES.CONTACTO'
      Size = 30
    end
    object qryClientesDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryClientesTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryClientesFAX_CONTACTO: TIBStringField
      FieldName = 'FAX_CONTACTO'
      Origin = 'CLIENTES.FAX_CONTACTO'
      Size = 14
    end
    object qryClientesFORMA_PAGO: TSmallintField
      FieldName = 'FORMA_PAGO'
      Origin = 'CLIENTES.FORMA_PAGO'
    end
    object qryClientesCODIGO_AGENCIA: TSmallintField
      FieldName = 'CODIGO_AGENCIA'
      Origin = 'CLIENTES.CODIGO_AGENCIA'
    end
    object qryClientesSTATUS_CLIENTE: TIBStringField
      FieldName = 'STATUS_CLIENTE'
      Origin = 'CLIENTES.STATUS_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object qryClientesINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'CLIENTES.INSERTADO_POR'
      Size = 12
    end
    object qryClientesFECHA_INSERTADO: TDateTimeField
      FieldName = 'FECHA_INSERTADO'
      Origin = 'CLIENTES.FECHA_INSERTADO'
    end
    object qryClientesFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'CLIENTES.FECHA_MOD'
    end
    object qryClientesMODI_POR: TIBStringField
      FieldName = 'MODI_POR'
      Origin = 'CLIENTES.MODI_POR'
      Size = 12
    end
    object qryClientesLIMITE_CREDITO: TFloatField
      FieldName = 'LIMITE_CREDITO'
      Origin = 'CLIENTES.LIMITE_CREDITO'
    end
    object qryClientesEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'CLIENTES.EMAIL'
      Size = 40
    end
    object qryClientesWEBSITE: TIBStringField
      FieldName = 'WEBSITE'
      Origin = 'CLIENTES.WEBSITE'
      Size = 40
    end
    object qryClientesPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
      Size = 30
    end
    object qryClientesCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryClientesCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryClientesRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'CLIENTES.RNC'
      Size = 12
    end
    object qryClientesREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'CLIENTES.REFERENCIA'
      Size = 40
    end
    object qryClientesTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'CLIENTES.TELEF_REFERENCIA'
    end
    object qryClientesOTRO_TELEFONO: TIBStringField
      FieldName = 'OTRO_TELEFONO'
      Origin = 'CLIENTES.OTRO_TELEFONO'
    end
    object qryClientesCANT_DIAS_CREDITO: TSmallintField
      FieldName = 'CANT_DIAS_CREDITO'
      Origin = 'CLIENTES.CANT_DIAS_CREDITO'
    end
    object qryClientesTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'CLIENTES.TIPO_NCF'
      FixedChar = True
      Size = 2
    end
    object qryClientesOBSERVACION: TMemoField
      FieldName = 'OBSERVACION'
      Origin = 'CLIENTES.OBSERVACION'
      BlobType = ftMemo
      Size = 8
    end
    object qryClientesLUGAR_DE_TRABAJO: TIBStringField
      FieldName = 'LUGAR_DE_TRABAJO'
      Origin = 'CLIENTES.LUGAR_DE_TRABAJO'
      Size = 40
    end
    object qryClientesAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'CLIENTES.APODO'
    end
    object qryClientesCODIGO_USUARIO: TIntegerField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'CLIENTES.CODIGO_USUARIO'
    end
    object qryClientesRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
    object qryClientesCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      Origin = 'CLIENTES.COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object qryClientesCONDICION: TIntegerField
      FieldName = 'CONDICION'
      Origin = 'CLIENTES.CONDICION'
    end
    object qryClientesPRECIO_ID: TIntegerField
      FieldName = 'PRECIO_ID'
      Origin = 'CLIENTES.PRECIO_ID'
    end
  end
  object dsqryClientes: TDataSource
    DataSet = qryClientes
    Left = 288
    Top = 192
  end
  object dstblTipoPlan: TDataSource
    DataSet = tblTipoPlan
    Left = 208
    Top = 80
  end
  object tblPlanFunerarioDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PLAN_FUNERARIO_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into PLAN_FUNERARIO_DET'
      
        '  (SERIE, ID_PLAN, NIVEL, FECHA_INGRESO, FECHA_NACIMIENTO, FECHA' +
        '_DECESO, '
      
        '   CEDULA, PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUN' +
        'DO_APELLIDO, '
      '   STATUS)'
      'values'
      
        '  (:SERIE, :ID_PLAN, :NIVEL, :FECHA_INGRESO, :FECHA_NACIMIENTO, ' +
        ':FECHA_DECESO, '
      
        '   :CEDULA, :PRIMER_NOMBRE, :SEGUNDO_NOMBRE, :PRIMER_APELLIDO, :' +
        'SEGUNDO_APELLIDO, '
      '   :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  ID_PLAN,'
      '  NIVEL,'
      '  FECHA_INGRESO,'
      '  FECHA_NACIMIENTO,'
      '  FECHA_DECESO,'
      '  CEDULA,'
      '  PRIMER_NOMBRE,'
      '  SEGUNDO_NOMBRE,'
      '  PRIMER_APELLIDO,'
      '  SEGUNDO_APELLIDO,'
      '  STATUS'
      'from PLAN_FUNERARIO_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'select *  from PLAN_FUNERARIO_DET'
      'where id_plan =:idplan')
    ModifySQL.Strings = (
      'update PLAN_FUNERARIO_DET'
      'set'
      '  SERIE = :SERIE,'
      '  ID_PLAN = :ID_PLAN,'
      '  NIVEL = :NIVEL,'
      '  FECHA_INGRESO = :FECHA_INGRESO,'
      '  FECHA_NACIMIENTO = :FECHA_NACIMIENTO,'
      '  FECHA_DECESO = :FECHA_DECESO,'
      '  CEDULA = :CEDULA,'
      '  PRIMER_NOMBRE = :PRIMER_NOMBRE,'
      '  SEGUNDO_NOMBRE = :SEGUNDO_NOMBRE,'
      '  PRIMER_APELLIDO = :PRIMER_APELLIDO,'
      '  SEGUNDO_APELLIDO = :SEGUNDO_APELLIDO,'
      '  STATUS = :STATUS'
      'where'
      '  SERIE = :OLD_SERIE')
    GeneratorField.Field = 'SERIE'
    GeneratorField.Generator = 'GEN_SERIE_PLANF_DET'
    Left = 48
    Top = 136
    object tblPlanFunerarioDetSERIE: TIntegerField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Origin = 'PLAN_FUNERARIO_DET.SERIE'
      Required = True
    end
    object tblPlanFunerarioDetID_PLAN: TIntegerField
      DisplayLabel = 'IdPlan'
      DisplayWidth = 10
      FieldName = 'ID_PLAN'
      Origin = 'PLAN_FUNERARIO_DET.ID_PLAN'
      Required = True
    end
    object tblPlanFunerarioDetNIVEL: TSmallintField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
      Origin = 'PLAN_FUNERARIO_DET.NIVEL'
      Required = True
    end
    object tblPlanFunerarioDetFECHA_INGRESO: TDateTimeField
      DisplayLabel = 'Fecha Ingreso'
      FieldName = 'FECHA_INGRESO'
      Origin = 'PLAN_FUNERARIO_DET.FECHA_INGRESO'
      Required = True
    end
    object tblPlanFunerarioDetFECHA_NACIMIENTO: TDateTimeField
      DisplayLabel = 'Fecha Nacimiento'
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'PLAN_FUNERARIO_DET.FECHA_NACIMIENTO'
      Required = True
    end
    object tblPlanFunerarioDetFECHA_DECESO: TDateTimeField
      DisplayLabel = 'Fecha Deceso'
      FieldName = 'FECHA_DECESO'
      Origin = 'PLAN_FUNERARIO_DET.FECHA_DECESO'
    end
    object tblPlanFunerarioDetCEDULA: TIBStringField
      DisplayLabel = 'Cedula'
      FieldName = 'CEDULA'
      Origin = 'PLAN_FUNERARIO_DET.CEDULA'
      Size = 13
    end
    object tblPlanFunerarioDetPRIMER_NOMBRE: TIBStringField
      DisplayLabel = 'Primer Nombre'
      FieldName = 'PRIMER_NOMBRE'
      Origin = 'PLAN_FUNERARIO_DET.PRIMER_NOMBRE'
      Required = True
      Size = 50
    end
    object tblPlanFunerarioDetSEGUNDO_NOMBRE: TIBStringField
      DisplayLabel = 'Segundo Nombre'
      FieldName = 'SEGUNDO_NOMBRE'
      Origin = 'PLAN_FUNERARIO_DET.SEGUNDO_NOMBRE'
      Size = 50
    end
    object tblPlanFunerarioDetPRIMER_APELLIDO: TIBStringField
      DisplayLabel = 'Primer Apellido'
      FieldName = 'PRIMER_APELLIDO'
      Origin = 'PLAN_FUNERARIO_DET.PRIMER_APELLIDO'
      Required = True
      Size = 50
    end
    object tblPlanFunerarioDetSEGUNDO_APELLIDO: TIBStringField
      DisplayLabel = 'Segundo Apellido'
      FieldName = 'SEGUNDO_APELLIDO'
      Origin = 'PLAN_FUNERARIO_DET.SEGUNDO_APELLIDO'
      Size = 50
    end
    object tblPlanFunerarioDetSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'PLAN_FUNERARIO_DET.STATUS'
      Size = 1
    end
  end
  object dstblPlanFunerarioDet: TDataSource
    DataSet = tblPlanFunerarioDet
    Left = 48
    Top = 192
  end
  object tblRelacion: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'RELACION'
    Left = 120
    Top = 88
    object tblRelacionCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tblRelacionDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 35
    end
  end
  object dstblRelacion: TDataSource
    DataSet = tblRelacion
    Left = 216
    Top = 192
  end
  object qryTipoPlan: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from TIPO_PLAN')
    Left = 32
    Top = 264
  end
  object dsqryTipoPlan: TDataSource
    DataSet = qryTipoPlan
    Left = 32
    Top = 320
  end
  object tblTarifaPlan: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TARIFA_TIPO_PLAN'
      'where'
      '  ID_TIPO = :OLD_ID_TIPO and'
      '  FECHA_INICIAL = :OLD_FECHA_INICIAL and'
      '  FECHA_FINAL = :OLD_FECHA_FINAL')
    InsertSQL.Strings = (
      'insert into TARIFA_TIPO_PLAN'
      
        '  (ID_TIPO, FECHA_INICIAL, FECHA_FINAL, PRECIO, STATUS, FECHA_IN' +
        ', INS_POR, '
      '   FECHA_UPDATE, UPDATE_POR, COD_UDUARIO, PORC_COMISION)'
      'values'
      
        '  (:ID_TIPO, :FECHA_INICIAL, :FECHA_FINAL, :PRECIO, :STATUS, :FE' +
        'CHA_IN, '
      
        '   :INS_POR, :FECHA_UPDATE, :UPDATE_POR, :COD_UDUARIO, :PORC_COM' +
        'ISION)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_TIPO,'
      '  FECHA_INICIAL,'
      '  FECHA_FINAL,'
      '  PRECIO,'
      '  STATUS,'
      '  FECHA_IN,'
      '  INS_POR,'
      '  FECHA_UPDATE,'
      '  UPDATE_POR,'
      '  COD_UDUARIO,'
      '  PORC_COMISION'
      'from TARIFA_TIPO_PLAN '
      'where'
      '  ID_TIPO = :ID_TIPO and'
      '  FECHA_INICIAL = :FECHA_INICIAL and'
      '  FECHA_FINAL = :FECHA_FINAL')
    SelectSQL.Strings = (
      'Select *  From TARIFA_TIPO_PLAN'
      'Where :Fecha Between Fecha_Inicial and Fecha_Final')
    ModifySQL.Strings = (
      'update TARIFA_TIPO_PLAN'
      'set'
      '  ID_TIPO = :ID_TIPO,'
      '  FECHA_INICIAL = :FECHA_INICIAL,'
      '  FECHA_FINAL = :FECHA_FINAL,'
      '  PRECIO = :PRECIO,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  INS_POR = :INS_POR,'
      '  FECHA_UPDATE = :FECHA_UPDATE,'
      '  UPDATE_POR = :UPDATE_POR,'
      '  COD_UDUARIO = :COD_UDUARIO,'
      '  PORC_COMISION = :PORC_COMISION'
      'where'
      '  ID_TIPO = :OLD_ID_TIPO and'
      '  FECHA_INICIAL = :OLD_FECHA_INICIAL and'
      '  FECHA_FINAL = :OLD_FECHA_FINAL')
    Left = 144
    Top = 272
    object tblTarifaPlanID_TIPO: TIntegerField
      DisplayLabel = 'IdTipo'
      FieldName = 'ID_TIPO'
      Origin = 'TARIFA_TIPO_PLAN.ID_TIPO'
      Required = True
    end
    object tblTarifaPlanFECHA_INICIAL: TDateTimeField
      DisplayLabel = 'Fecha Inicial'
      FieldName = 'FECHA_INICIAL'
      Origin = 'TARIFA_TIPO_PLAN.FECHA_INICIAL'
      Required = True
    end
    object tblTarifaPlanFECHA_FINAL: TDateTimeField
      DisplayLabel = 'Fecha Final'
      FieldName = 'FECHA_FINAL'
      Origin = 'TARIFA_TIPO_PLAN.FECHA_FINAL'
      Required = True
    end
    object tblTarifaPlanPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'TARIFA_TIPO_PLAN.PRECIO'
    end
    object tblTarifaPlanSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'TARIFA_TIPO_PLAN.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblTarifaPlanFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'TARIFA_TIPO_PLAN.FECHA_IN'
    end
    object tblTarifaPlanINS_POR: TIBStringField
      FieldName = 'INS_POR'
      Origin = 'TARIFA_TIPO_PLAN.INS_POR'
      Size = 12
    end
    object tblTarifaPlanFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'TARIFA_TIPO_PLAN.FECHA_UPDATE'
    end
    object tblTarifaPlanUPDATE_POR: TIBStringField
      FieldName = 'UPDATE_POR'
      Origin = 'TARIFA_TIPO_PLAN.UPDATE_POR'
      Size = 12
    end
    object tblTarifaPlanCOD_UDUARIO: TIntegerField
      FieldName = 'COD_UDUARIO'
      Origin = 'TARIFA_TIPO_PLAN.COD_UDUARIO'
    end
    object tblTarifaPlanPORC_COMISION: TFloatField
      DisplayLabel = '%Comision'
      FieldName = 'PORC_COMISION'
      Origin = 'TARIFA_TIPO_PLAN.PORC_COMISION'
    end
  end
  object dstblTarifaPlan: TDataSource
    DataSet = tblTarifaPlan
    Left = 144
    Top = 328
  end
  object ibsqlBuscaTarifaPlan: TIBSQL
    Database = dmConectar.IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'Select Precio  From TARIFA_TIPO_PLAN'
      'Where id_tipo=:idtipo'
      'And :fecha between fecha_inicial and fecha_final'
      'And Status = "A"')
    Transaction = dmConectar.IBTransaction1
    Left = 272
    Top = 272
  end
  object qryPrecioTipoPlan: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '      TARIFA_TIPO_PLAN.PRECIO'
      '    FROM'
      '      TARIFA_TIPO_PLAN'
      '    WHERE ID_TIPO=:XID_TIPO_PLAN'
      '    AND :FECHA BETWEEN FECHA_INICIAL AND FECHA_FINAL'
      '')
    Left = 272
    Top = 328
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'XID_TIPO_PLAN'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptInput
      end>
    object qryPrecioTipoPlanPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'TARIFA_TIPO_PLAN.PRECIO'
    end
  end
  object qryInventario: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      'CODIGO, DESCRIPCION'
      'FROM INVENTARIO_PRODUCTO I, TIPO_INVENTARIO T'
      'WHERE I.TIPO = T.CODIGO'
      'AND UPPER(T.DESCRIPCION) LIKE '#39'%FUNE%'#39)
    Left = 136
    Top = 160
  end
  object dsqryInventario: TDataSource
    DataSet = qryInventario
    Left = 144
    Top = 216
  end
  object qryPlanRepMaster: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryPlanRepMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  PLAN_FUNERARIO.ID_PLAN,'
      '  PLAN_FUNERARIO.ID_TIPO_PLAN,'
      '  PLAN_FUNERARIO.CODIGO_CTE,'
      '  PLAN_FUNERARIO.FECHA_APERTURA,'
      '  PLAN_FUNERARIO.FECHA_CIERRE,'
      '  PLAN_FUNERARIO.STATUS,'
      '  PLAN_FUNERARIO.FECHA_IN,'
      '  PLAN_FUNERARIO.INS_POR,'
      '  PLAN_FUNERARIO.FECHA_UPDATE,'
      '  PLAN_FUNERARIO.UPDATE_POR,'
      '  PLAN_FUNERARIO.COD_UDUARIO,'
      '  PLAN_FUNERARIO.FECHA_PAGO,'
      '  PLAN_FUNERARIO.NUM_ULTIMA_FACT,'
      '  PLAN_FUNERARIO.CARGAR_ITBIS,'
      '  PLAN_FUNERARIO.TIPO_NCF,'
      '  PLAN_FUNERARIO.FECHA_ULT_FACT,'
      '  PLAN_FUNERARIO.COD_SERVICIO,'
      '  TIPO_PLAN.DESCRIPCION,'
      '  TIPO_PLAN.CANT_DEP,'
      '  CLIENTES.NOMBRE_CTE,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.CEDULA,'
      '  CLIENTES.RNC_NUMERO'
      'FROM'
      '  PLAN_FUNERARIO'
      
        '  INNER JOIN TIPO_PLAN ON (PLAN_FUNERARIO.ID_TIPO_PLAN = TIPO_PL' +
        'AN.TIPO)'
      
        '  INNER JOIN CLIENTES ON (PLAN_FUNERARIO.CODIGO_CTE = CLIENTES.C' +
        'ODIGO_CTE)')
    Left = 288
    Top = 24
    object qryPlanRepMasterID_PLAN: TIntegerField
      FieldName = 'ID_PLAN'
      Origin = 'PLAN_FUNERARIO.ID_PLAN'
      Required = True
    end
    object qryPlanRepMasterID_TIPO_PLAN: TSmallintField
      FieldName = 'ID_TIPO_PLAN'
      Origin = 'PLAN_FUNERARIO.ID_TIPO_PLAN'
      Required = True
    end
    object qryPlanRepMasterCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PLAN_FUNERARIO.CODIGO_CTE'
      Required = True
    end
    object qryPlanRepMasterFECHA_APERTURA: TDateTimeField
      FieldName = 'FECHA_APERTURA'
      Origin = 'PLAN_FUNERARIO.FECHA_APERTURA'
      Required = True
    end
    object qryPlanRepMasterFECHA_CIERRE: TDateTimeField
      FieldName = 'FECHA_CIERRE'
      Origin = 'PLAN_FUNERARIO.FECHA_CIERRE'
    end
    object qryPlanRepMasterSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PLAN_FUNERARIO.STATUS'
      Size = 1
    end
    object qryPlanRepMasterFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PLAN_FUNERARIO.FECHA_IN'
    end
    object qryPlanRepMasterINS_POR: TIBStringField
      FieldName = 'INS_POR'
      Origin = 'PLAN_FUNERARIO.INS_POR'
      Size = 12
    end
    object qryPlanRepMasterFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'PLAN_FUNERARIO.FECHA_UPDATE'
    end
    object qryPlanRepMasterUPDATE_POR: TIBStringField
      FieldName = 'UPDATE_POR'
      Origin = 'PLAN_FUNERARIO.UPDATE_POR'
      Size = 12
    end
    object qryPlanRepMasterCOD_UDUARIO: TIntegerField
      FieldName = 'COD_UDUARIO'
      Origin = 'PLAN_FUNERARIO.COD_UDUARIO'
    end
    object qryPlanRepMasterFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Origin = 'PLAN_FUNERARIO.FECHA_PAGO'
      Required = True
    end
    object qryPlanRepMasterNUM_ULTIMA_FACT: TFloatField
      FieldName = 'NUM_ULTIMA_FACT'
      Origin = 'PLAN_FUNERARIO.NUM_ULTIMA_FACT'
    end
    object qryPlanRepMasterCARGAR_ITBIS: TSmallintField
      FieldName = 'CARGAR_ITBIS'
      Origin = 'PLAN_FUNERARIO.CARGAR_ITBIS'
    end
    object qryPlanRepMasterTIPO_NCF: TIBStringField
      FieldName = 'TIPO_NCF'
      Origin = 'PLAN_FUNERARIO.TIPO_NCF'
      Size = 2
    end
    object qryPlanRepMasterFECHA_ULT_FACT: TDateTimeField
      FieldName = 'FECHA_ULT_FACT'
      Origin = 'PLAN_FUNERARIO.FECHA_ULT_FACT'
    end
    object qryPlanRepMasterCOD_SERVICIO: TIntegerField
      FieldName = 'COD_SERVICIO'
      Origin = 'PLAN_FUNERARIO.COD_SERVICIO'
    end
    object qryPlanRepMasterDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_PLAN.DESCRIPCION'
      Size = 40
    end
    object qryPlanRepMasterCANT_DEP: TIntegerField
      FieldName = 'CANT_DEP'
      Origin = 'TIPO_PLAN.CANT_DEP'
    end
    object qryPlanRepMasterNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryPlanRepMasterTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryPlanRepMasterDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryPlanRepMasterCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryPlanRepMasterCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryPlanRepMasterRNC_NUMERO: TIBStringField
      FieldName = 'RNC_NUMERO'
      Origin = 'CLIENTES.RNC_NUMERO'
      Size = 14
    end
  end
  object qryPlanRepDet: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  PLAN_FUNERARIO_DET.SERIE,'
      '  PLAN_FUNERARIO_DET.ID_PLAN,'
      '  PLAN_FUNERARIO_DET.NIVEL,'
      '  PLAN_FUNERARIO_DET.FECHA_INGRESO,'
      '  PLAN_FUNERARIO_DET.FECHA_NACIMIENTO,'
      '  PLAN_FUNERARIO_DET.FECHA_DECESO,'
      '  PLAN_FUNERARIO_DET.CEDULA,'
      '  PLAN_FUNERARIO_DET.PRIMER_NOMBRE,'
      '  PLAN_FUNERARIO_DET.SEGUNDO_NOMBRE,'
      '  PLAN_FUNERARIO_DET.PRIMER_APELLIDO,'
      '  PLAN_FUNERARIO_DET.SEGUNDO_APELLIDO,'
      '  PLAN_FUNERARIO_DET.STATUS,'
      '  RELACION.DESCRIPCION RelacionDep'
      'FROM'
      '  PLAN_FUNERARIO_DET'
      
        '  INNER JOIN RELACION ON (PLAN_FUNERARIO_DET.NIVEL = RELACION.CO' +
        'DIGO)'
      'Where   PLAN_FUNERARIO_DET.ID_PLAN=:idPlan')
    Left = 288
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idPlan'
        ParamType = ptUnknown
      end>
    object qryPlanRepDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'PLAN_FUNERARIO_DET.SERIE'
      Required = True
    end
    object qryPlanRepDetID_PLAN: TIntegerField
      FieldName = 'ID_PLAN'
      Origin = 'PLAN_FUNERARIO_DET.ID_PLAN'
      Required = True
    end
    object qryPlanRepDetNIVEL: TSmallintField
      FieldName = 'NIVEL'
      Origin = 'PLAN_FUNERARIO_DET.NIVEL'
      Required = True
    end
    object qryPlanRepDetFECHA_INGRESO: TDateTimeField
      FieldName = 'FECHA_INGRESO'
      Origin = 'PLAN_FUNERARIO_DET.FECHA_INGRESO'
      Required = True
    end
    object qryPlanRepDetFECHA_NACIMIENTO: TDateTimeField
      FieldName = 'FECHA_NACIMIENTO'
      Origin = 'PLAN_FUNERARIO_DET.FECHA_NACIMIENTO'
      Required = True
    end
    object qryPlanRepDetFECHA_DECESO: TDateTimeField
      FieldName = 'FECHA_DECESO'
      Origin = 'PLAN_FUNERARIO_DET.FECHA_DECESO'
    end
    object qryPlanRepDetCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'PLAN_FUNERARIO_DET.CEDULA'
      Size = 13
    end
    object qryPlanRepDetPRIMER_NOMBRE: TIBStringField
      FieldName = 'PRIMER_NOMBRE'
      Origin = 'PLAN_FUNERARIO_DET.PRIMER_NOMBRE'
      Required = True
      Size = 50
    end
    object qryPlanRepDetSEGUNDO_NOMBRE: TIBStringField
      FieldName = 'SEGUNDO_NOMBRE'
      Origin = 'PLAN_FUNERARIO_DET.SEGUNDO_NOMBRE'
      Size = 50
    end
    object qryPlanRepDetPRIMER_APELLIDO: TIBStringField
      FieldName = 'PRIMER_APELLIDO'
      Origin = 'PLAN_FUNERARIO_DET.PRIMER_APELLIDO'
      Required = True
      Size = 50
    end
    object qryPlanRepDetSEGUNDO_APELLIDO: TIBStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Origin = 'PLAN_FUNERARIO_DET.SEGUNDO_APELLIDO'
      Size = 50
    end
    object qryPlanRepDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PLAN_FUNERARIO_DET.STATUS'
      Size = 1
    end
    object qryPlanRepDetRELACIONDEP: TIBStringField
      FieldName = 'RELACIONDEP'
      Origin = 'RELACION.DESCRIPCION'
      Size = 35
    end
  end
  object qryEmpleados: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From VENDEDORES'
      'Where status = '#39'A'#39)
    Left = 56
    Top = 376
    object qryEmpleadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'VENDEDORES.CODIGO'
      Required = True
    end
    object qryEmpleadosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'VENDEDORES.FOTO'
      Size = 8
    end
    object qryEmpleadosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'VENDEDORES.NOMBRE'
      Required = True
      Size = 60
    end
    object qryEmpleadosDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Origin = 'VENDEDORES.DIRECCION'
      Size = 60
    end
    object qryEmpleadosTELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'VENDEDORES.TELEFONO'
      Size = 14
    end
    object qryEmpleadosCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'VENDEDORES.CELULAR'
      Size = 14
    end
    object qryEmpleadosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'VENDEDORES.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryEmpleadosEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'VENDEDORES.EMAIL'
      Size = 40
    end
    object qryEmpleadosWEBSITE: TIBStringField
      FieldName = 'WEBSITE'
      Origin = 'VENDEDORES.WEBSITE'
      Size = 40
    end
    object qryEmpleadosPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'VENDEDORES.PAIS'
      Size = 30
    end
    object qryEmpleadosCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'VENDEDORES.CIUDAD'
      Size = 30
    end
    object qryEmpleadosCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'VENDEDORES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryEmpleadosREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Origin = 'VENDEDORES.REFERENCIA'
      Size = 40
    end
    object qryEmpleadosTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'VENDEDORES.TELEF_REFERENCIA'
    end
    object qryEmpleadosOTRO_TELEFONO: TIBStringField
      FieldName = 'OTRO_TELEFONO'
      Origin = 'VENDEDORES.OTRO_TELEFONO'
    end
    object qryEmpleadosAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'VENDEDORES.APODO'
    end
    object qryEmpleadosINSERTADO_POR: TIBStringField
      FieldName = 'INSERTADO_POR'
      Origin = 'VENDEDORES.INSERTADO_POR'
      Size = 12
    end
    object qryEmpleadosFECHA_INSERTADO: TDateTimeField
      FieldName = 'FECHA_INSERTADO'
      Origin = 'VENDEDORES.FECHA_INSERTADO'
    end
    object qryEmpleadosFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'VENDEDORES.FECHA_MOD'
    end
    object qryEmpleadosMODI_POR: TIBStringField
      FieldName = 'MODI_POR'
      Origin = 'VENDEDORES.MODI_POR'
      Size = 12
    end
  end
  object dsqryEmpleados: TDataSource
    DataSet = qryEmpleados
    Left = 152
    Top = 384
  end
end
