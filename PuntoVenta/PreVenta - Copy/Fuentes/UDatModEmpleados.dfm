object dmEmpleados: TdmEmpleados
  OldCreateOrder = False
  Left = 419
  Top = 110
  Height = 215
  Width = 262
  object tblEmpleados: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from EMPLEADO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into EMPLEADO'
      
        '  (CODIGO, CODIGO_CIA, NOMBRE, APELLIDO, CEDULA, FOTO, PASSPORT,' +
        ' CALLE, '
      
        '   NUM_CASA, CIUDAD, PAIS, TELEF_CASA, TELEF_OFICINA, CELULAR, E' +
        'MAIL, SEXO, '
      
        '   ESTADO_CIVIL, TELEF_REFERENCIA, NOMBRE_REFERENCIA, FECHA_NAC,' +
        ' NACIONALIDAD, '
      
        '   FECHA_ENTRADA, FECHA_SALIDA, SALARIO, TIPO_NOMINA, TIPO_EMPLE' +
        'ADO, DEPTO_EMP, '
      
        '   SECCION, CARGO, PAGA_AFP, PAGA_TSS, STATUS, FECHA_IN, IN_POR,' +
        ' FECHA_MOD, '
      '   MOD_POR)'
      'values'
      
        '  (:CODIGO, :CODIGO_CIA, :NOMBRE, :APELLIDO, :CEDULA, :FOTO, :PA' +
        'SSPORT, '
      
        '   :CALLE, :NUM_CASA, :CIUDAD, :PAIS, :TELEF_CASA, :TELEF_OFICIN' +
        'A, :CELULAR, '
      
        '   :EMAIL, :SEXO, :ESTADO_CIVIL, :TELEF_REFERENCIA, :NOMBRE_REFE' +
        'RENCIA, '
      
        '   :FECHA_NAC, :NACIONALIDAD, :FECHA_ENTRADA, :FECHA_SALIDA, :SA' +
        'LARIO, '
      
        '   :TIPO_NOMINA, :TIPO_EMPLEADO, :DEPTO_EMP, :SECCION, :CARGO, :' +
        'PAGA_AFP, '
      '   :PAGA_TSS, :STATUS, :FECHA_IN, :IN_POR, :FECHA_MOD, :MOD_POR)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  CODIGO_CIA,'
      '  NOMBRE,'
      '  APELLIDO,'
      '  CEDULA,'
      '  FOTO,'
      '  PASSPORT,'
      '  CALLE,'
      '  NUM_CASA,'
      '  CIUDAD,'
      '  PAIS,'
      '  TELEF_CASA,'
      '  TELEF_OFICINA,'
      '  CELULAR,'
      '  EMAIL,'
      '  SEXO,'
      '  ESTADO_CIVIL,'
      '  TELEF_REFERENCIA,'
      '  NOMBRE_REFERENCIA,'
      '  FECHA_NAC,'
      '  NACIONALIDAD,'
      '  FECHA_ENTRADA,'
      '  FECHA_SALIDA,'
      '  SALARIO,'
      '  TIPO_NOMINA,'
      '  TIPO_EMPLEADO,'
      '  DEPTO_EMP,'
      '  SECCION,'
      '  CARGO,'
      '  PAGA_AFP,'
      '  PAGA_TSS,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR'
      'from EMPLEADO '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'select * from EMPLEADO'
      'order by nombre, codigo')
    ModifySQL.Strings = (
      'update EMPLEADO'
      'set'
      '  CODIGO = :CODIGO,'
      '  CODIGO_CIA = :CODIGO_CIA,'
      '  NOMBRE = :NOMBRE,'
      '  APELLIDO = :APELLIDO,'
      '  CEDULA = :CEDULA,'
      '  FOTO = :FOTO,'
      '  PASSPORT = :PASSPORT,'
      '  CALLE = :CALLE,'
      '  NUM_CASA = :NUM_CASA,'
      '  CIUDAD = :CIUDAD,'
      '  PAIS = :PAIS,'
      '  TELEF_CASA = :TELEF_CASA,'
      '  TELEF_OFICINA = :TELEF_OFICINA,'
      '  CELULAR = :CELULAR,'
      '  EMAIL = :EMAIL,'
      '  SEXO = :SEXO,'
      '  ESTADO_CIVIL = :ESTADO_CIVIL,'
      '  TELEF_REFERENCIA = :TELEF_REFERENCIA,'
      '  NOMBRE_REFERENCIA = :NOMBRE_REFERENCIA,'
      '  FECHA_NAC = :FECHA_NAC,'
      '  NACIONALIDAD = :NACIONALIDAD,'
      '  FECHA_ENTRADA = :FECHA_ENTRADA,'
      '  FECHA_SALIDA = :FECHA_SALIDA,'
      '  SALARIO = :SALARIO,'
      '  TIPO_NOMINA = :TIPO_NOMINA,'
      '  TIPO_EMPLEADO = :TIPO_EMPLEADO,'
      '  DEPTO_EMP = :DEPTO_EMP,'
      '  SECCION = :SECCION,'
      '  CARGO = :CARGO,'
      '  PAGA_AFP = :PAGA_AFP,'
      '  PAGA_TSS = :PAGA_TSS,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR'
      'where'
      '  CODIGO = :OLD_CODIGO')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_CODIGO_EMPLEADOS'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 32
    Top = 16
    object tblEmpleadosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'EMPLEADO.CODIGO'
      Required = True
    end
    object tblEmpleadosCODIGO_CIA: TIntegerField
      FieldName = 'CODIGO_CIA'
      Origin = 'EMPLEADO.CODIGO_CIA'
      Required = True
    end
    object tblEmpleadosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'EMPLEADO.NOMBRE'
      Size = 35
    end
    object tblEmpleadosAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Origin = 'EMPLEADO.APELLIDO'
      Size = 35
    end
    object tblEmpleadosCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'EMPLEADO.CEDULA'
      Size = 14
    end
    object tblEmpleadosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'EMPLEADO.FOTO'
      Size = 8
    end
    object tblEmpleadosPASSPORT: TIBStringField
      FieldName = 'PASSPORT'
      Origin = 'EMPLEADO.PASSPORT'
      Size = 14
    end
    object tblEmpleadosCALLE: TIBStringField
      FieldName = 'CALLE'
      Origin = 'EMPLEADO.CALLE'
      Size = 40
    end
    object tblEmpleadosNUM_CASA: TSmallintField
      FieldName = 'NUM_CASA'
      Origin = 'EMPLEADO.NUM_CASA'
    end
    object tblEmpleadosCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'EMPLEADO.CIUDAD'
      Size = 40
    end
    object tblEmpleadosPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'EMPLEADO.PAIS'
      Size = 40
    end
    object tblEmpleadosTELEF_CASA: TIBStringField
      FieldName = 'TELEF_CASA'
      Origin = 'EMPLEADO.TELEF_CASA'
      Size = 12
    end
    object tblEmpleadosTELEF_OFICINA: TIBStringField
      FieldName = 'TELEF_OFICINA'
      Origin = 'EMPLEADO.TELEF_OFICINA'
      Size = 12
    end
    object tblEmpleadosCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Origin = 'EMPLEADO.CELULAR'
      Size = 12
    end
    object tblEmpleadosEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'EMPLEADO.EMAIL'
      Size = 40
    end
    object tblEmpleadosSEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = 'EMPLEADO.SEXO'
      FixedChar = True
      Size = 1
    end
    object tblEmpleadosESTADO_CIVIL: TIBStringField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'EMPLEADO.ESTADO_CIVIL'
      FixedChar = True
      Size = 1
    end
    object tblEmpleadosTELEF_REFERENCIA: TIBStringField
      FieldName = 'TELEF_REFERENCIA'
      Origin = 'EMPLEADO.TELEF_REFERENCIA'
      Size = 12
    end
    object tblEmpleadosNOMBRE_REFERENCIA: TIBStringField
      FieldName = 'NOMBRE_REFERENCIA'
      Origin = 'EMPLEADO.NOMBRE_REFERENCIA'
      Size = 40
    end
    object tblEmpleadosFECHA_NAC: TDateTimeField
      FieldName = 'FECHA_NAC'
      Origin = 'EMPLEADO.FECHA_NAC'
    end
    object tblEmpleadosNACIONALIDAD: TIBStringField
      FieldName = 'NACIONALIDAD'
      Origin = 'EMPLEADO.NACIONALIDAD'
      FixedChar = True
      Size = 1
    end
    object tblEmpleadosFECHA_ENTRADA: TDateTimeField
      FieldName = 'FECHA_ENTRADA'
      Origin = 'EMPLEADO.FECHA_ENTRADA'
    end
    object tblEmpleadosFECHA_SALIDA: TDateTimeField
      FieldName = 'FECHA_SALIDA'
      Origin = 'EMPLEADO.FECHA_SALIDA'
    end
    object tblEmpleadosSALARIO: TFloatField
      FieldName = 'SALARIO'
      Origin = 'EMPLEADO.SALARIO'
    end
    object tblEmpleadosTIPO_NOMINA: TSmallintField
      FieldName = 'TIPO_NOMINA'
      Origin = 'EMPLEADO.TIPO_NOMINA'
    end
    object tblEmpleadosTIPO_EMPLEADO: TSmallintField
      FieldName = 'TIPO_EMPLEADO'
      Origin = 'EMPLEADO.TIPO_EMPLEADO'
    end
    object tblEmpleadosDEPTO_EMP: TSmallintField
      FieldName = 'DEPTO_EMP'
      Origin = 'EMPLEADO.DEPTO_EMP'
    end
    object tblEmpleadosSECCION: TSmallintField
      FieldName = 'SECCION'
      Origin = 'EMPLEADO.SECCION'
    end
    object tblEmpleadosCARGO: TSmallintField
      FieldName = 'CARGO'
      Origin = 'EMPLEADO.CARGO'
    end
    object tblEmpleadosPAGA_AFP: TSmallintField
      FieldName = 'PAGA_AFP'
      Origin = 'EMPLEADO.PAGA_AFP'
    end
    object tblEmpleadosPAGA_TSS: TSmallintField
      FieldName = 'PAGA_TSS'
      Origin = 'EMPLEADO.PAGA_TSS'
    end
    object tblEmpleadosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'EMPLEADO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblEmpleadosFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'EMPLEADO.FECHA_IN'
    end
    object tblEmpleadosIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'EMPLEADO.IN_POR'
      Size = 12
    end
    object tblEmpleadosFECHA_MOD: TDateTimeField
      FieldName = 'FECHA_MOD'
      Origin = 'EMPLEADO.FECHA_MOD'
    end
    object tblEmpleadosMOD_POR: TIBStringField
      FieldName = 'MOD_POR'
      Origin = 'EMPLEADO.MOD_POR'
      Size = 12
    end
  end
  object tblRuta: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblRutaAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'RUTA'
    Left = 112
    Top = 40
    object tblRutaCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object tblRutaCODIGO_EMP: TIntegerField
      DisplayLabel = 'CodigoEmp'
      FieldName = 'CODIGO_EMP'
    end
    object tblRutaFICHA: TIntegerField
      FieldName = 'FICHA'
    end
    object tblRutaFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object tblRutaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
end
