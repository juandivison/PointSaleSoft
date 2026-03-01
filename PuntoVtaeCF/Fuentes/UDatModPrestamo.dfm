object dmPrestamo: TdmPrestamo
  OldCreateOrder = False
  Left = 345
  Top = 177
  Height = 272
  Width = 370
  object tblPrestamo: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PRESTAMO'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into PRESTAMO'
      
        '  (NUMERO, CODIGO_EMP, RUTA, FECHA, TIPO_PRESTAMO, CUOTAS, PORC_' +
        'INTERES, '
      
        '   MONTO_PRESTAMO, MONTO_PAGADO, FECHA_ULTIMO_PAGO, STATUS, IN_P' +
        'OR, FECHA_IN, '
      '   MOD_POR, FECHA_MOD)'
      'values'
      
        '  (:NUMERO, :CODIGO_EMP, :RUTA, :FECHA, :TIPO_PRESTAMO, :CUOTAS,' +
        ' :PORC_INTERES, '
      
        '   :MONTO_PRESTAMO, :MONTO_PAGADO, :FECHA_ULTIMO_PAGO, :STATUS, ' +
        ':IN_POR, '
      '   :FECHA_IN, :MOD_POR, :FECHA_MOD)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  CODIGO_EMP,'
      '  RUTA,'
      '  FECHA,'
      '  TIPO_PRESTAMO,'
      '  CUOTAS,'
      '  PORC_INTERES,'
      '  MONTO_PRESTAMO,'
      '  MONTO_PAGADO,'
      '  FECHA_ULTIMO_PAGO,'
      '  STATUS,'
      '  IN_POR,'
      '  FECHA_IN,'
      '  MOD_POR,'
      '  FECHA_MOD'
      'from PRESTAMO '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'Select * From PRESTAMO'
      'Where status = '#39'A'#39)
    ModifySQL.Strings = (
      'update PRESTAMO'
      'set'
      '  NUMERO = :NUMERO,'
      '  CODIGO_EMP = :CODIGO_EMP,'
      '  RUTA = :RUTA,'
      '  FECHA = :FECHA,'
      '  TIPO_PRESTAMO = :TIPO_PRESTAMO,'
      '  CUOTAS = :CUOTAS,'
      '  PORC_INTERES = :PORC_INTERES,'
      '  MONTO_PRESTAMO = :MONTO_PRESTAMO,'
      '  MONTO_PAGADO = :MONTO_PAGADO,'
      '  FECHA_ULTIMO_PAGO = :FECHA_ULTIMO_PAGO,'
      '  STATUS = :STATUS,'
      '  IN_POR = :IN_POR,'
      '  FECHA_IN = :FECHA_IN,'
      '  MOD_POR = :MOD_POR,'
      '  FECHA_MOD = :FECHA_MOD'
      'where'
      '  NUMERO = :OLD_NUMERO')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_NUM_PRESTAMO'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 32
    Top = 24
    object tblPrestamoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'PRESTAMO.NUMERO'
      Required = True
    end
    object tblPrestamoCODIGO_EMP: TIntegerField
      FieldName = 'CODIGO_EMP'
      Origin = 'PRESTAMO.CODIGO_EMP'
      Required = True
    end
    object tblPrestamoRUTA: TIntegerField
      FieldName = 'RUTA'
      Origin = 'PRESTAMO.RUTA'
      Required = True
    end
    object tblPrestamoFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PRESTAMO.FECHA'
    end
    object tblPrestamoTIPO_PRESTAMO: TSmallintField
      FieldName = 'TIPO_PRESTAMO'
      Origin = 'PRESTAMO.TIPO_PRESTAMO'
    end
    object tblPrestamoCUOTAS: TFloatField
      FieldName = 'CUOTAS'
      Origin = 'PRESTAMO.CUOTAS'
    end
    object tblPrestamoPORC_INTERES: TFloatField
      FieldName = 'PORC_INTERES'
      Origin = 'PRESTAMO.PORC_INTERES'
    end
    object tblPrestamoMONTO_PRESTAMO: TFloatField
      FieldName = 'MONTO_PRESTAMO'
      Origin = 'PRESTAMO.MONTO_PRESTAMO'
    end
    object tblPrestamoMONTO_PAGADO: TFloatField
      FieldName = 'MONTO_PAGADO'
      Origin = 'PRESTAMO.MONTO_PAGADO'
    end
    object tblPrestamoFECHA_ULTIMO_PAGO: TDateTimeField
      FieldName = 'FECHA_ULTIMO_PAGO'
      Origin = 'PRESTAMO.FECHA_ULTIMO_PAGO'
    end
    object tblPrestamoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PRESTAMO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblPrestamoIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PRESTAMO.IN_POR'
      Size = 12
    end
    object tblPrestamoFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PRESTAMO.FECHA_IN'
    end
    object tblPrestamoMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'PRESTAMO.MOD_POR'
      Size = 12
    end
    object tblPrestamoFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'PRESTAMO.FECHA_MOD'
    end
  end
  object qryEmpleado: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From EMPLEADO'
      'Where status in ("A")')
    Left = 112
    Top = 40
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
  end
  object tblTipoPrestamo: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_PRESTAMO'
    Left = 112
    Top = 88
    object tblTipoPrestamoCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object tblTipoPrestamoDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object qryRepAvisoAtraso: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM PROC_REP_AVISO_ATRASO'
      '(:codigocte, :fecha)'
      'Where DIAS_EN_ATRASO > 0 '
      'and codigo_aviso between :codigoini and :codigofin'
      'order by DIAS_EN_ATRASO, codigo_cte')
    Left = 216
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'codigocte'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fecha'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigoini'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigofin'
        ParamType = ptInput
      end>
    object qryRepAvisoAtrasoCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'PROC_REP_AVISO_ATRASO.CODIGO_CTE'
    end
    object qryRepAvisoAtrasoDIAS_EN_ATRASO: TIntegerField
      FieldName = 'DIAS_EN_ATRASO'
      Origin = 'PROC_REP_AVISO_ATRASO.DIAS_EN_ATRASO'
    end
    object qryRepAvisoAtrasoFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'PROC_REP_AVISO_ATRASO.FECHA'
    end
    object qryRepAvisoAtrasoNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'PROC_REP_AVISO_ATRASO.NOMBRE_CTE'
      Size = 60
    end
    object qryRepAvisoAtrasoDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'PROC_REP_AVISO_ATRASO.DIRECCION_CONT'
      Size = 60
    end
    object qryRepAvisoAtrasoTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'PROC_REP_AVISO_ATRASO.TELEF_CONTACTO'
      Size = 14
    end
    object qryRepAvisoAtrasoAPODO: TIBStringField
      FieldName = 'APODO'
      Origin = 'PROC_REP_AVISO_ATRASO.APODO'
    end
    object qryRepAvisoAtrasoSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'PROC_REP_AVISO_ATRASO.SERIE'
    end
    object qryRepAvisoAtrasoCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'PROC_REP_AVISO_ATRASO.CIUDAD'
      Size = 30
    end
    object qryRepAvisoAtrasoFECHA_ULT_PAGO: TDateTimeField
      FieldName = 'FECHA_ULT_PAGO'
      Origin = 'PROC_REP_AVISO_ATRASO.FECHA_ULT_PAGO'
    end
    object qryRepAvisoAtrasoTIPO_FREC_PAGO: TIntegerField
      FieldName = 'TIPO_FREC_PAGO'
      Origin = 'PROC_REP_AVISO_ATRASO.TIPO_FREC_PAGO'
    end
    object qryRepAvisoAtrasoCODIGO_AVISO: TIntegerField
      FieldName = 'CODIGO_AVISO'
      Origin = 'PROC_REP_AVISO_ATRASO.CODIGO_AVISO'
    end
    object qryRepAvisoAtrasoAVISO_DESC: TMemoField
      FieldName = 'AVISO_DESC'
      Origin = 'PROC_REP_AVISO_ATRASO.AVISO_DESC'
      BlobType = ftMemo
      Size = 8
    end
  end
  object tblAvisoAtarso: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AVISO_VENC_FINANC '
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into AVISO_VENC_FINANC '
      '  (CODIGO, DIA_INICIAL, DIA_FINAL, DESCRIPCION, STATUS)'
      'values'
      '  (:CODIGO, :DIA_INICIAL, :DIA_FINAL, :DESCRIPCION, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  DIA_INICIAL,'
      '  DIA_FINAL,'
      '  DESCRIPCION,'
      '  STATUS'
      'from AVISO_VENC_FINANC  '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'select * from AVISO_VENC_FINANC')
    ModifySQL.Strings = (
      'update AVISO_VENC_FINANC '
      'set'
      '  CODIGO = :CODIGO,'
      '  DIA_INICIAL = :DIA_INICIAL,'
      '  DIA_FINAL = :DIA_FINAL,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  STATUS = :STATUS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 216
    Top = 80
    object tblAvisoAtarsoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'AVISO_VENC_FINANC.CODIGO'
      Required = True
    end
    object tblAvisoAtarsoDIA_INICIAL: TIntegerField
      FieldName = 'DIA_INICIAL'
      Origin = 'AVISO_VENC_FINANC.DIA_INICIAL'
      Required = True
    end
    object tblAvisoAtarsoDIA_FINAL: TIntegerField
      FieldName = 'DIA_FINAL'
      Origin = 'AVISO_VENC_FINANC.DIA_FINAL'
      Required = True
    end
    object tblAvisoAtarsoDESCRIPCION: TMemoField
      FieldName = 'DESCRIPCION'
      Origin = 'AVISO_VENC_FINANC.DESCRIPCION'
      BlobType = ftMemo
      Size = 8
    end
    object tblAvisoAtarsoSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'AVISO_VENC_FINANC.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dstblAvisoAtarso: TDataSource
    DataSet = tblAvisoAtarso
    Left = 24
    Top = 96
  end
end
