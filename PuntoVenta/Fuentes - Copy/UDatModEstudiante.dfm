object dmEstudiante: TdmEstudiante
  OldCreateOrder = False
  Left = 501
  Top = 114
  Height = 511
  Width = 661
  object qryEstudianteMast: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryEstudianteMastAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from Estudiantes_master'
      'where'
      '  ID_ESTUDIANTE = :OLD_ID_ESTUDIANTE and'
      '  IDFAMILIA = :OLD_IDFAMILIA')
    InsertSQL.Strings = (
      'insert into Estudiantes_master'
      
        '  (ID_ESTUDIANTE, IDFAMILIA, PRIMERNOMBRE, SEGUNDONOMBRE, PRIMER' +
        'APELLIDO, '
      
        '   SEGUNDOAPELLIDO, FECHANACIMIENTO, TELEFONO, CELULAR, EMAIL, F' +
        'ECHA_IN, '
      '   IN_POR, COD_USUARIO, STATUS)'
      'values'
      
        '  (:ID_ESTUDIANTE, :IDFAMILIA, :PRIMERNOMBRE, :SEGUNDONOMBRE, :P' +
        'RIMERAPELLIDO, '
      
        '   :SEGUNDOAPELLIDO, :FECHANACIMIENTO, :TELEFONO, :CELULAR, :EMA' +
        'IL, :FECHA_IN, '
      '   :IN_POR, :COD_USUARIO, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_ESTUDIANTE,'
      '  IDFAMILIA,'
      '  PRIMERNOMBRE,'
      '  SEGUNDONOMBRE,'
      '  PRIMERAPELLIDO,'
      '  SEGUNDOAPELLIDO,'
      '  FECHANACIMIENTO,'
      '  TELEFONO,'
      '  CELULAR,'
      '  EMAIL,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  COD_USUARIO,'
      '  STATUS'
      'from Estudiantes_master '
      'where'
      '  ID_ESTUDIANTE = :ID_ESTUDIANTE and'
      '  IDFAMILIA = :IDFAMILIA')
    SelectSQL.Strings = (
      'Select * From  Estudiantes_master')
    ModifySQL.Strings = (
      'update Estudiantes_master'
      'set'
      '  ID_ESTUDIANTE = :ID_ESTUDIANTE,'
      '  IDFAMILIA = :IDFAMILIA,'
      '  PRIMERNOMBRE = :PRIMERNOMBRE,'
      '  SEGUNDONOMBRE = :SEGUNDONOMBRE,'
      '  PRIMERAPELLIDO = :PRIMERAPELLIDO,'
      '  SEGUNDOAPELLIDO = :SEGUNDOAPELLIDO,'
      '  FECHANACIMIENTO = :FECHANACIMIENTO,'
      '  TELEFONO = :TELEFONO,'
      '  CELULAR = :CELULAR,'
      '  EMAIL = :EMAIL,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  STATUS = :STATUS'
      'where'
      '  ID_ESTUDIANTE = :OLD_ID_ESTUDIANTE and'
      '  IDFAMILIA = :OLD_IDFAMILIA')
    GeneratorField.Field = 'ID_ESTUDIANTE'
    GeneratorField.Generator = 'GEN_COD_IDESTUDIANTE'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 40
    Top = 40
    object qryEstudianteMastID_ESTUDIANTE: TIntegerField
      DisplayLabel = 'IdEstudiante'
      FieldName = 'ID_ESTUDIANTE'
      Origin = 'ESTUDIANTES_MASTER.ID_ESTUDIANTE'
      Required = True
    end
    object qryEstudianteMastIDFAMILIA: TIntegerField
      DisplayLabel = 'IdFamilia'
      FieldName = 'IDFAMILIA'
      Origin = 'ESTUDIANTES_MASTER.IDFAMILIA'
      Required = True
    end
    object qryEstudianteMastPRIMERNOMBRE: TIBStringField
      DisplayLabel = 'Primer Nombre'
      FieldName = 'PRIMERNOMBRE'
      Origin = 'ESTUDIANTES_MASTER.PRIMERNOMBRE'
      Size = 40
    end
    object qryEstudianteMastSEGUNDONOMBRE: TIBStringField
      DisplayLabel = 'Segundo Nombre'
      FieldName = 'SEGUNDONOMBRE'
      Origin = 'ESTUDIANTES_MASTER.SEGUNDONOMBRE'
      Size = 40
    end
    object qryEstudianteMastPRIMERAPELLIDO: TIBStringField
      DisplayLabel = 'Primer Apellido'
      FieldName = 'PRIMERAPELLIDO'
      Origin = 'ESTUDIANTES_MASTER.PRIMERAPELLIDO'
      Size = 35
    end
    object qryEstudianteMastSEGUNDOAPELLIDO: TIBStringField
      DisplayLabel = 'Segundo Apellido'
      FieldName = 'SEGUNDOAPELLIDO'
      Origin = 'ESTUDIANTES_MASTER.SEGUNDOAPELLIDO'
      Size = 35
    end
    object qryEstudianteMastFECHANACIMIENTO: TDateTimeField
      DisplayLabel = 'Fecha Nacimiento'
      FieldName = 'FECHANACIMIENTO'
      Origin = 'ESTUDIANTES_MASTER.FECHANACIMIENTO'
    end
    object qryEstudianteMastTELEFONO: TIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'TELEFONO'
      Origin = 'ESTUDIANTES_MASTER.TELEFONO'
      Size = 14
    end
    object qryEstudianteMastCELULAR: TIBStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      Origin = 'ESTUDIANTES_MASTER.CELULAR'
      Size = 14
    end
    object qryEstudianteMastEMAIL: TIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Origin = 'ESTUDIANTES_MASTER.EMAIL'
      Size = 60
    end
    object qryEstudianteMastFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ESTUDIANTES_MASTER.FECHA_IN'
    end
    object qryEstudianteMastIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ESTUDIANTES_MASTER.IN_POR'
      Size = 12
    end
    object qryEstudianteMastCOD_USUARIO: TIntegerField
      DisplayLabel = 'CodUsuario'
      FieldName = 'COD_USUARIO'
      Origin = 'ESTUDIANTES_MASTER.COD_USUARIO'
    end
    object qryEstudianteMastSTATUS: TIBStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'ESTUDIANTES_MASTER.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object qryEstudianteDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryEstudianteDetAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from Estudiante_det'
      'where'
      '  IDANOESCOLAR = :OLD_IDANOESCOLAR and'
      '  IDCURSO = :OLD_IDCURSO and'
      '  ID_ESTUDIANTE = :OLD_ID_ESTUDIANTE')
    InsertSQL.Strings = (
      'insert into Estudiante_det'
      
        '  (IDANOESCOLAR, IDCURSO, ID_ESTUDIANTE, IDNIVEL, FECHA_IN, IN_P' +
        'OR, COD_USUARIO, '
      '   STATUS, NUMERO_ESTUDIANTE)'
      'values'
      
        '  (:IDANOESCOLAR, :IDCURSO, :ID_ESTUDIANTE, :IDNIVEL, :FECHA_IN,' +
        ' :IN_POR, '
      '   :COD_USUARIO, :STATUS, :NUMERO_ESTUDIANTE)')
    RefreshSQL.Strings = (
      'Select '
      '  IDANOESCOLAR,'
      '  IDCURSO,'
      '  ID_ESTUDIANTE,'
      '  IDNIVEL,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  COD_USUARIO,'
      '  STATUS,'
      '  NUMERO_ESTUDIANTE'
      'from Estudiante_det '
      'where'
      '  IDANOESCOLAR = :IDANOESCOLAR and'
      '  IDCURSO = :IDCURSO and'
      '  ID_ESTUDIANTE = :ID_ESTUDIANTE')
    SelectSQL.Strings = (
      'Select * From Estudiante_det'
      'Where id_estudiante=:idestudiante')
    ModifySQL.Strings = (
      'update Estudiante_det'
      'set'
      '  IDANOESCOLAR = :IDANOESCOLAR,'
      '  IDCURSO = :IDCURSO,'
      '  ID_ESTUDIANTE = :ID_ESTUDIANTE,'
      '  IDNIVEL = :IDNIVEL,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  STATUS = :STATUS,'
      '  NUMERO_ESTUDIANTE = :NUMERO_ESTUDIANTE'
      'where'
      '  IDANOESCOLAR = :OLD_IDANOESCOLAR and'
      '  IDCURSO = :OLD_IDCURSO and'
      '  ID_ESTUDIANTE = :OLD_ID_ESTUDIANTE')
    GeneratorField.Field = 'ID_ESTUDIANTE'
    GeneratorField.Generator = 'GEN_COD_IDESTUDIANTE'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 40
    Top = 96
    object qryEstudianteDetIDCURSO: TIntegerField
      FieldName = 'IDCURSO'
      Origin = 'ESTUDIANTE_DET.IDCURSO'
      Required = True
    end
    object qryEstudianteDetID_ESTUDIANTE: TIntegerField
      FieldName = 'ID_ESTUDIANTE'
      Origin = 'ESTUDIANTE_DET.ID_ESTUDIANTE'
      Required = True
    end
    object qryEstudianteDetIDNIVEL: TIntegerField
      FieldName = 'IDNIVEL'
      Origin = 'ESTUDIANTE_DET.IDNIVEL'
      Required = True
    end
    object qryEstudianteDetFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ESTUDIANTE_DET.FECHA_IN'
    end
    object qryEstudianteDetIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ESTUDIANTE_DET.IN_POR'
      Size = 12
    end
    object qryEstudianteDetCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'ESTUDIANTE_DET.COD_USUARIO'
    end
    object qryEstudianteDetSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ESTUDIANTE_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryEstudianteDetNUMERO_ESTUDIANTE: TIBStringField
      FieldName = 'NUMERO_ESTUDIANTE'
      Origin = 'ESTUDIANTE_DET.NUMERO_ESTUDIANTE'
      Size = 10
    end
    object qryEstudianteDetIDANOESCOLAR: TIntegerField
      FieldName = 'IDANOESCOLAR'
      Origin = 'ESTUDIANTE_DET.IDANOESCOLAR'
      Required = True
    end
  end
  object dsqryEstudianteMast: TDataSource
    AutoEdit = False
    DataSet = qryEstudianteMast
    Left = 200
    Top = 40
  end
  object dsqryEstudianteDet: TDataSource
    AutoEdit = False
    DataSet = qryEstudianteDet
    Left = 200
    Top = 96
  end
  object tblFamilia: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from Familia'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into Familia'
      
        '  (CODIGO, FECHASALIDA, FECHAENTRADA, CEDULA_PADRE, PRIMERNOMBRE' +
        'PADRE, '
      
        '   SEGUNDONOMBREPADRE, PRIMERAPELLIDOPADRE, SEGUNDOAPELLIDOPADRE' +
        ', CEDULA_MADRE, '
      
        '   PRIMERNOMBREMADRE, SEGUNDONOMBREMADRE, PRIMERAPELLIDOMADRE, S' +
        'EGUNDOAPELLIDOMADRE, '
      '   STATUS)'
      'values'
      
        '  (:CODIGO, :FECHASALIDA, :FECHAENTRADA, :CEDULA_PADRE, :PRIMERN' +
        'OMBREPADRE, '
      
        '   :SEGUNDONOMBREPADRE, :PRIMERAPELLIDOPADRE, :SEGUNDOAPELLIDOPA' +
        'DRE, :CEDULA_MADRE, '
      
        '   :PRIMERNOMBREMADRE, :SEGUNDONOMBREMADRE, :PRIMERAPELLIDOMADRE' +
        ', :SEGUNDOAPELLIDOMADRE, '
      '   :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  FECHASALIDA,'
      '  FECHAENTRADA,'
      '  CEDULA_PADRE,'
      '  PRIMERNOMBREPADRE,'
      '  SEGUNDONOMBREPADRE,'
      '  PRIMERAPELLIDOPADRE,'
      '  SEGUNDOAPELLIDOPADRE,'
      '  CEDULA_MADRE,'
      '  PRIMERNOMBREMADRE,'
      '  SEGUNDONOMBREMADRE,'
      '  PRIMERAPELLIDOMADRE,'
      '  SEGUNDOAPELLIDOMADRE,'
      '  STATUS'
      'from Familia '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'Select * from Familia'
      'where codigo=:codigo')
    ModifySQL.Strings = (
      'update Familia'
      'set'
      '  CODIGO = :CODIGO,'
      '  FECHASALIDA = :FECHASALIDA,'
      '  FECHAENTRADA = :FECHAENTRADA,'
      '  CEDULA_PADRE = :CEDULA_PADRE,'
      '  PRIMERNOMBREPADRE = :PRIMERNOMBREPADRE,'
      '  SEGUNDONOMBREPADRE = :SEGUNDONOMBREPADRE,'
      '  PRIMERAPELLIDOPADRE = :PRIMERAPELLIDOPADRE,'
      '  SEGUNDOAPELLIDOPADRE = :SEGUNDOAPELLIDOPADRE,'
      '  CEDULA_MADRE = :CEDULA_MADRE,'
      '  PRIMERNOMBREMADRE = :PRIMERNOMBREMADRE,'
      '  SEGUNDONOMBREMADRE = :SEGUNDONOMBREMADRE,'
      '  PRIMERAPELLIDOMADRE = :PRIMERAPELLIDOMADRE,'
      '  SEGUNDOAPELLIDOMADRE = :SEGUNDOAPELLIDOMADRE,'
      '  STATUS = :STATUS'
      'where'
      '  CODIGO = :OLD_CODIGO')
    Left = 440
    Top = 27
    object tblFamiliaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'FAMILIA.CODIGO'
      Required = True
    end
    object tblFamiliaPRIMERNOMBREPADRE: TIBStringField
      FieldName = 'PRIMERNOMBREPADRE'
      Origin = 'FAMILIA.PRIMERNOMBREPADRE'
      Size = 60
    end
    object tblFamiliaSEGUNDONOMBREPADRE: TIBStringField
      FieldName = 'SEGUNDONOMBREPADRE'
      Origin = 'FAMILIA.SEGUNDONOMBREPADRE'
      Size = 60
    end
    object tblFamiliaPRIMERAPELLIDOPADRE: TIBStringField
      FieldName = 'PRIMERAPELLIDOPADRE'
      Origin = 'FAMILIA.PRIMERAPELLIDOPADRE'
      Size = 60
    end
    object tblFamiliaSEGUNDOAPELLIDOPADRE: TIBStringField
      FieldName = 'SEGUNDOAPELLIDOPADRE'
      Origin = 'FAMILIA.SEGUNDOAPELLIDOPADRE'
      Size = 60
    end
    object tblFamiliaPRIMERNOMBREMADRE: TIBStringField
      FieldName = 'PRIMERNOMBREMADRE'
      Origin = 'FAMILIA.PRIMERNOMBREMADRE'
      Size = 60
    end
    object tblFamiliaSEGUNDONOMBREMADRE: TIBStringField
      FieldName = 'SEGUNDONOMBREMADRE'
      Origin = 'FAMILIA.SEGUNDONOMBREMADRE'
      Size = 60
    end
    object tblFamiliaPRIMERAPELLIDOMADRE: TIBStringField
      FieldName = 'PRIMERAPELLIDOMADRE'
      Origin = 'FAMILIA.PRIMERAPELLIDOMADRE'
      Size = 60
    end
    object tblFamiliaSEGUNDOAPELLIDOMADRE: TIBStringField
      FieldName = 'SEGUNDOAPELLIDOMADRE'
      Origin = 'FAMILIA.SEGUNDOAPELLIDOMADRE'
      Size = 60
    end
    object tblFamiliaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'FAMILIA.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblFamiliaCEDULA_PADRE: TIBStringField
      FieldName = 'CEDULA_PADRE'
      Origin = 'FAMILIA.CEDULA_PADRE'
      Size = 15
    end
    object tblFamiliaCEDULA_MADRE: TIBStringField
      FieldName = 'CEDULA_MADRE'
      Origin = 'FAMILIA.CEDULA_MADRE'
      Size = 15
    end
  end
  object dstblFamilia: TDataSource
    AutoEdit = False
    DataSet = tblFamilia
    Left = 528
    Top = 27
  end
  object qryClientes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From clientes')
    Left = 440
    Top = 80
  end
  object dsqryClientes: TDataSource
    DataSet = qryClientes
    Left = 528
    Top = 80
  end
  object tblCursos: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from CURSOS'
      'where'
      '  IDCURSO = :OLD_IDCURSO and'
      '  IDNIVEL = :OLD_IDNIVEL')
    InsertSQL.Strings = (
      'insert into CURSOS'
      '  (IDCURSO, IDNIVEL, SECCION, DESCRIPCION, STATUS)'
      'values'
      '  (:IDCURSO, :IDNIVEL, :SECCION, :DESCRIPCION, :STATUS)')
    RefreshSQL.Strings = (
      'Select '
      '  IDCURSO,'
      '  IDNIVEL,'
      '  SECCION,'
      '  DESCRIPCION,'
      '  STATUS'
      'from CURSOS '
      'where'
      '  IDCURSO = :IDCURSO and'
      '  IDNIVEL = :IDNIVEL')
    SelectSQL.Strings = (
      'select *  from CURSOS')
    ModifySQL.Strings = (
      'update CURSOS'
      'set'
      '  IDCURSO = :IDCURSO,'
      '  IDNIVEL = :IDNIVEL,'
      '  SECCION = :SECCION,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  STATUS = :STATUS'
      'where'
      '  IDCURSO = :OLD_IDCURSO and'
      '  IDNIVEL = :OLD_IDNIVEL')
    Left = 200
    Top = 152
    object tblCursosIDCURSO: TIntegerField
      FieldName = 'IDCURSO'
      Origin = 'CURSOS.IDCURSO'
      Required = True
    end
    object tblCursosIDNIVEL: TIntegerField
      FieldName = 'IDNIVEL'
      Origin = 'CURSOS.IDNIVEL'
      Required = True
    end
    object tblCursosSECCION: TIBStringField
      FieldName = 'SECCION'
      Origin = 'CURSOS.SECCION'
      Required = True
      FixedChar = True
      Size = 8
    end
    object tblCursosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'CURSOS.DESCRIPCION'
      Size = 35
    end
    object tblCursosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'CURSOS.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dstblCursos: TDataSource
    DataSet = tblCursos
    Left = 280
    Top = 152
  end
  object qryCursos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *  From CURSOS'
      'where idnivel=:idnivel')
    Left = 440
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idnivel'
        ParamType = ptInput
      end>
  end
  object dsqryCursos: TDataSource
    DataSet = qryCursos
    Left = 528
    Top = 128
  end
  object dstblAnoEscolar: TDataSource
    DataSet = tblAnoEscolar
    Left = 128
    Top = 152
  end
  object qryAnoEscolar: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From ANO_ESCOLAR')
    Left = 440
    Top = 184
    object qryAnoEscolarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ANO_ESCOLAR.CODIGO'
      Required = True
    end
    object qryAnoEscolarIDANO_INICIAL: TIntegerField
      FieldName = 'IDANO_INICIAL'
      Origin = 'ANO_ESCOLAR.IDANO_INICIAL'
      Required = True
    end
    object qryAnoEscolarIDANO_FINAL: TIntegerField
      FieldName = 'IDANO_FINAL'
      Origin = 'ANO_ESCOLAR.IDANO_FINAL'
      Required = True
    end
    object qryAnoEscolarDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'ANO_ESCOLAR.DESCRIPCION'
      Size = 35
    end
    object qryAnoEscolarSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ANO_ESCOLAR.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryAnoEscolarPORC_MORA: TFloatField
      FieldName = 'PORC_MORA'
      Origin = 'ANO_ESCOLAR.PORC_MORA'
    end
  end
  object dsqryAnoEscolar: TDataSource
    DataSet = qryAnoEscolar
    Left = 528
    Top = 184
  end
  object tblAnoEscolar: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ANO_ESCOLAR'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into ANO_ESCOLAR'
      
        '  (CODIGO, IDANO_INICIAL, IDANO_FINAL, DESCRIPCION, MESINICIAMEN' +
        'SUALIDAD, '
      '   MESFINMENSUALIDAD, STATUS, PORC_MORA)'
      'values'
      
        '  (:CODIGO, :IDANO_INICIAL, :IDANO_FINAL, :DESCRIPCION, :MESINIC' +
        'IAMENSUALIDAD, '
      '   :MESFINMENSUALIDAD, :STATUS, :PORC_MORA)')
    RefreshSQL.Strings = (
      'Select '
      '  CODIGO,'
      '  IDANO_INICIAL,'
      '  IDANO_FINAL,'
      '  DESCRIPCION,'
      '  MESINICIAMENSUALIDAD,'
      '  MESFINMENSUALIDAD,'
      '  STATUS,'
      '  PORC_MORA'
      'from ANO_ESCOLAR '
      'where'
      '  CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'Select * From ANO_ESCOLAR')
    ModifySQL.Strings = (
      'update ANO_ESCOLAR'
      'set'
      '  CODIGO = :CODIGO,'
      '  IDANO_INICIAL = :IDANO_INICIAL,'
      '  IDANO_FINAL = :IDANO_FINAL,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  MESINICIAMENSUALIDAD = :MESINICIAMENSUALIDAD,'
      '  MESFINMENSUALIDAD = :MESFINMENSUALIDAD,'
      '  STATUS = :STATUS,'
      '  PORC_MORA = :PORC_MORA'
      'where'
      '  CODIGO = :OLD_CODIGO')
    GeneratorField.Field = 'CODIGO'
    GeneratorField.Generator = 'GEN_IDANOESCOLAR'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 40
    Top = 160
    object tblAnoEscolarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ANO_ESCOLAR.CODIGO'
      Required = True
    end
    object tblAnoEscolarIDANO_INICIAL: TIntegerField
      FieldName = 'IDANO_INICIAL'
      Origin = 'ANO_ESCOLAR.IDANO_INICIAL'
      Required = True
    end
    object tblAnoEscolarIDANO_FINAL: TIntegerField
      FieldName = 'IDANO_FINAL'
      Origin = 'ANO_ESCOLAR.IDANO_FINAL'
      Required = True
    end
    object tblAnoEscolarDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'ANO_ESCOLAR.DESCRIPCION'
      Size = 35
    end
    object tblAnoEscolarSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ANO_ESCOLAR.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblAnoEscolarMESINICIAMENSUALIDAD: TDateTimeField
      FieldName = 'MESINICIAMENSUALIDAD'
      Origin = 'ANO_ESCOLAR.MESINICIAMENSUALIDAD'
    end
    object tblAnoEscolarMESFINMENSUALIDAD: TDateTimeField
      FieldName = 'MESFINMENSUALIDAD'
      Origin = 'ANO_ESCOLAR.MESFINMENSUALIDAD'
    end
    object tblAnoEscolarPORC_MORA: TFloatField
      FieldName = 'PORC_MORA'
      Origin = 'ANO_ESCOLAR.PORC_MORA'
    end
  end
  object tblPrecioXNivelColegio: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PRECIO_NIVEL_COLEGIO'
      'where'
      '  IDANIOESCOLAR = :OLD_IDANIOESCOLAR and'
      '  IDNIVEL = :OLD_IDNIVEL')
    InsertSQL.Strings = (
      'insert into PRECIO_NIVEL_COLEGIO'
      
        '  (IDANIOESCOLAR, IDNIVEL, PRECIO, STATUS, COD_USUARIO, FECHA_IN' +
        ', IN_POR, '
      '   FECHA_UPDATE)'
      'values'
      
        '  (:IDANIOESCOLAR, :IDNIVEL, :PRECIO, :STATUS, :COD_USUARIO, :FE' +
        'CHA_IN, '
      '   :IN_POR, :FECHA_UPDATE)')
    RefreshSQL.Strings = (
      'Select '
      '  IDANIOESCOLAR,'
      '  IDNIVEL,'
      '  PRECIO,'
      '  STATUS,'
      '  COD_USUARIO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_UPDATE'
      'from PRECIO_NIVEL_COLEGIO '
      'where'
      '  IDANIOESCOLAR = :IDANIOESCOLAR and'
      '  IDNIVEL = :IDNIVEL')
    SelectSQL.Strings = (
      'SELECT * FROM PRECIO_NIVEL_COLEGIO'
      'WHERE IDANIOESCOLAR =:IDANIOESCOLAR')
    ModifySQL.Strings = (
      'update PRECIO_NIVEL_COLEGIO'
      'set'
      '  IDANIOESCOLAR = :IDANIOESCOLAR,'
      '  IDNIVEL = :IDNIVEL,'
      '  PRECIO = :PRECIO,'
      '  STATUS = :STATUS,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_UPDATE = :FECHA_UPDATE'
      'where'
      '  IDANIOESCOLAR = :OLD_IDANIOESCOLAR and'
      '  IDNIVEL = :OLD_IDNIVEL')
    Left = 200
    Top = 208
    object tblPrecioXNivelColegioIDANIOESCOLAR: TIntegerField
      FieldName = 'IDANIOESCOLAR'
      Origin = 'PRECIO_NIVEL_COLEGIO.IDANIOESCOLAR'
      Required = True
    end
    object tblPrecioXNivelColegioIDNIVEL: TIntegerField
      FieldName = 'IDNIVEL'
      Origin = 'PRECIO_NIVEL_COLEGIO.IDNIVEL'
      Required = True
    end
    object tblPrecioXNivelColegioPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'PRECIO_NIVEL_COLEGIO.PRECIO'
    end
    object tblPrecioXNivelColegioSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PRECIO_NIVEL_COLEGIO.STATUS'
      Size = 1
    end
    object tblPrecioXNivelColegioCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'PRECIO_NIVEL_COLEGIO.COD_USUARIO'
    end
    object tblPrecioXNivelColegioFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PRECIO_NIVEL_COLEGIO.FECHA_IN'
    end
    object tblPrecioXNivelColegioIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PRECIO_NIVEL_COLEGIO.IN_POR'
      Size = 12
    end
    object tblPrecioXNivelColegioFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'PRECIO_NIVEL_COLEGIO.FECHA_UPDATE'
    end
  end
  object dstblPrecioXNivelColegio: TDataSource
    DataSet = tblPrecioXNivelColegio
    Left = 200
    Top = 264
  end
  object qryNivelModalidad: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM NIVELMODALIDAD'
      'WHERE STATUS = '#39'A'#39)
    Left = 442
    Top = 296
    object qryNivelModalidadCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'NIVELMODALIDAD.CODIGO'
      Required = True
    end
    object qryNivelModalidadDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'NIVELMODALIDAD.DESCRIPCION'
      Size = 80
    end
    object qryNivelModalidadSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'NIVELMODALIDAD.STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dsqryNivelModalidad: TDataSource
    DataSet = qryNivelModalidad
    Left = 552
    Top = 295
  end
  object qryAnoEscolarActivo: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'Select CODIGO, MESFINMENSUALIDAD, MESINICIAMENSUALIDAD, PORC_MOR' +
        'A  '
      'From ANO_ESCOLAR'
      'Where status = '#39'A'#39)
    Left = 440
    Top = 240
    object qryAnoEscolarActivoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ANO_ESCOLAR.CODIGO'
      Required = True
    end
    object qryAnoEscolarActivoMESFINMENSUALIDAD: TDateTimeField
      FieldName = 'MESFINMENSUALIDAD'
      Origin = 'ANO_ESCOLAR.MESFINMENSUALIDAD'
    end
    object qryAnoEscolarActivoMESINICIAMENSUALIDAD: TDateTimeField
      FieldName = 'MESINICIAMENSUALIDAD'
      Origin = 'ANO_ESCOLAR.MESINICIAMENSUALIDAD'
    end
    object qryAnoEscolarActivoPORC_MORA: TFloatField
      FieldName = 'PORC_MORA'
      Origin = 'ANO_ESCOLAR.PORC_MORA'
    end
  end
  object qryCursosLookupEstudiante: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select *  From CURSOS'
      'where idnivel=:idnivel')
    Left = 128
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idnivel'
        ParamType = ptInput
      end>
  end
  object dsqryCursosLookupEstudiante: TDataSource
    DataSet = qryCursosLookupEstudiante
    Left = 296
    Top = 16
  end
  object tblPagosEstudiantes: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from PAGOS_ESTUDIANTES'
      'where'
      '  IDANOESCOLAR = :OLD_IDANOESCOLAR and'
      '  IDESTUDIANTE = :OLD_IDESTUDIANTE and'
      '  FECHA_PAGO = :OLD_FECHA_PAGO')
    InsertSQL.Strings = (
      'insert into PAGOS_ESTUDIANTES'
      
        '  (IDANOESCOLAR, IDESTUDIANTE, FECHA_PAGO, MONTO, STATUS, COD_US' +
        'UARIO, '
      '   FECHA_IN, IN_POR, FECHA_UPDATE)'
      'values'
      
        '  (:IDANOESCOLAR, :IDESTUDIANTE, :FECHA_PAGO, :MONTO, :STATUS, :' +
        'COD_USUARIO, '
      '   :FECHA_IN, :IN_POR, :FECHA_UPDATE)')
    RefreshSQL.Strings = (
      'Select '
      '  IDANOESCOLAR,'
      '  IDESTUDIANTE,'
      '  FECHA_PAGO,'
      '  MONTO,'
      '  STATUS,'
      '  COD_USUARIO,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_UPDATE'
      'from PAGOS_ESTUDIANTES '
      'where'
      '  IDANOESCOLAR = :IDANOESCOLAR and'
      '  IDESTUDIANTE = :IDESTUDIANTE and'
      '  FECHA_PAGO = :FECHA_PAGO')
    SelectSQL.Strings = (
      'Select * From PAGOS_ESTUDIANTES'
      'Where idanoescolar =:idanoescolar'
      'And idEstudiante =:idEstudiante'
      '')
    ModifySQL.Strings = (
      'update PAGOS_ESTUDIANTES'
      'set'
      '  IDANOESCOLAR = :IDANOESCOLAR,'
      '  IDESTUDIANTE = :IDESTUDIANTE,'
      '  FECHA_PAGO = :FECHA_PAGO,'
      '  MONTO = :MONTO,'
      '  STATUS = :STATUS,'
      '  COD_USUARIO = :COD_USUARIO,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_UPDATE = :FECHA_UPDATE'
      'where'
      '  IDANOESCOLAR = :OLD_IDANOESCOLAR and'
      '  IDESTUDIANTE = :OLD_IDESTUDIANTE and'
      '  FECHA_PAGO = :OLD_FECHA_PAGO')
    Left = 56
    Top = 240
    object tblPagosEstudiantesIDANOESCOLAR: TIntegerField
      FieldName = 'IDANOESCOLAR'
      Origin = 'PAGOS_ESTUDIANTES.IDANOESCOLAR'
      Required = True
    end
    object tblPagosEstudiantesIDESTUDIANTE: TIntegerField
      FieldName = 'IDESTUDIANTE'
      Origin = 'PAGOS_ESTUDIANTES.IDESTUDIANTE'
      Required = True
    end
    object tblPagosEstudiantesFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Origin = 'PAGOS_ESTUDIANTES.FECHA_PAGO'
      Required = True
      DisplayFormat = 'dd-mmm-yyyy'
    end
    object tblPagosEstudiantesMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'PAGOS_ESTUDIANTES.MONTO'
    end
    object tblPagosEstudiantesSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PAGOS_ESTUDIANTES.STATUS'
      Size = 1
    end
    object tblPagosEstudiantesCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'PAGOS_ESTUDIANTES.COD_USUARIO'
    end
    object tblPagosEstudiantesFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PAGOS_ESTUDIANTES.FECHA_IN'
    end
    object tblPagosEstudiantesIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PAGOS_ESTUDIANTES.IN_POR'
      Size = 12
    end
    object tblPagosEstudiantesFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'PAGOS_ESTUDIANTES.FECHA_UPDATE'
    end
  end
  object dstblPagosEstudiantes: TDataSource
    DataSet = tblPagosEstudiantes
    Left = 56
    Top = 296
  end
  object qryRepPagosAtrasoEstudiante: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From PAGOS_ESTUDIANTES'
      'Where IDANOESCOLAR=:idanoescolar'
      'And  IDESTUDIANTE =:idestudiante'
      'And FECHA_PAGO <=:fechapago'
      'And Status = '#39'A'#39
      'Order by FECHA_PAGO asc')
    Left = 200
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idanoescolar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idestudiante'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'fechapago'
        ParamType = ptInput
      end>
    object qryRepPagosAtrasoEstudianteIDANOESCOLAR: TIntegerField
      FieldName = 'IDANOESCOLAR'
      Origin = 'PAGOS_ESTUDIANTES.IDANOESCOLAR'
      Required = True
    end
    object qryRepPagosAtrasoEstudianteIDESTUDIANTE: TIntegerField
      FieldName = 'IDESTUDIANTE'
      Origin = 'PAGOS_ESTUDIANTES.IDESTUDIANTE'
      Required = True
    end
    object qryRepPagosAtrasoEstudianteFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Origin = 'PAGOS_ESTUDIANTES.FECHA_PAGO'
      Required = True
    end
    object qryRepPagosAtrasoEstudianteMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'PAGOS_ESTUDIANTES.MONTO'
    end
    object qryRepPagosAtrasoEstudianteSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'PAGOS_ESTUDIANTES.STATUS'
      Size = 1
    end
    object qryRepPagosAtrasoEstudianteCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'PAGOS_ESTUDIANTES.COD_USUARIO'
    end
    object qryRepPagosAtrasoEstudianteFECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'PAGOS_ESTUDIANTES.FECHA_IN'
    end
    object qryRepPagosAtrasoEstudianteIN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'PAGOS_ESTUDIANTES.IN_POR'
      Size = 12
    end
    object qryRepPagosAtrasoEstudianteFECHA_UPDATE: TDateTimeField
      FieldName = 'FECHA_UPDATE'
      Origin = 'PAGOS_ESTUDIANTES.FECHA_UPDATE'
    end
  end
  object qryRepPagosAtrasoEstudianteMaster: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryRepPagosAtrasoEstudianteMasterAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  CLIENTES.CODIGO_CTE,'
      '  CLIENTES.NOMBRE_CTE,'
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.CEDULA,'
      '  ESTUDIANTES_MASTER.ID_ESTUDIANTE,'
      '  ESTUDIANTES_MASTER.PRIMERNOMBRE||'#39' '#39'||'
      '  ESTUDIANTES_MASTER.SEGUNDONOMBRE||'#39' '#39'||'
      '  ESTUDIANTES_MASTER.PRIMERAPELLIDO||'#39' '#39'||'
      '  ESTUDIANTES_MASTER.SEGUNDOAPELLIDO nombreEstudiante,'
      '  CURSOS.SECCION,'
      '  CURSOS.DESCRIPCION,'
      '  ESTUDIANTE_DET.IDANOESCOLAR'
      'FROM'
      '  FAMILIA'
      
        '  RIGHT OUTER JOIN ESTUDIANTES_MASTER ON (FAMILIA.CODIGO = ESTUD' +
        'IANTES_MASTER.IDFAMILIA)'
      
        '  INNER JOIN ESTUDIANTE_DET ON (ESTUDIANTES_MASTER.ID_ESTUDIANTE' +
        ' = ESTUDIANTE_DET.ID_ESTUDIANTE)'
      '  INNER JOIN CURSOS ON (ESTUDIANTE_DET.IDCURSO = CURSOS.IDCURSO)'
      '  AND (ESTUDIANTE_DET.IDNIVEL = CURSOS.IDNIVEL)'
      
        '  INNER JOIN CLIENTES ON (ESTUDIANTES_MASTER.IDFAMILIA = CLIENTE' +
        'S.CODIGO_CTE)'
      'WHERE  ESTUDIANTE_DET.IDANOESCOLAR=:idanoescolar')
    Left = 200
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idanoescolar'
        ParamType = ptInput
      end>
    object qryRepPagosAtrasoEstudianteMasterCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryRepPagosAtrasoEstudianteMasterNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryRepPagosAtrasoEstudianteMasterDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryRepPagosAtrasoEstudianteMasterTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryRepPagosAtrasoEstudianteMasterCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryRepPagosAtrasoEstudianteMasterCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryRepPagosAtrasoEstudianteMasterID_ESTUDIANTE: TIntegerField
      FieldName = 'ID_ESTUDIANTE'
      Origin = 'ESTUDIANTES_MASTER.ID_ESTUDIANTE'
      Required = True
    end
    object qryRepPagosAtrasoEstudianteMasterNOMBREESTUDIANTE: TIBStringField
      FieldName = 'NOMBREESTUDIANTE'
      Size = 153
    end
    object qryRepPagosAtrasoEstudianteMasterSECCION: TIBStringField
      FieldName = 'SECCION'
      Origin = 'CURSOS.SECCION'
      Required = True
      FixedChar = True
      Size = 8
    end
    object qryRepPagosAtrasoEstudianteMasterDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'CURSOS.DESCRIPCION'
      Size = 35
    end
    object qryRepPagosAtrasoEstudianteMasterIDANOESCOLAR: TIntegerField
      FieldName = 'IDANOESCOLAR'
      Origin = 'ESTUDIANTE_DET.IDANOESCOLAR'
      Required = True
    end
  end
  object qryCobroMensEstudiantes: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = qryCobroMensEstudiantesAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  CLIENTES.CODIGO_CTE,'
      '  CLIENTES.NOMBRE_CTE,'
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.CEDULA,'
      '  ESTUDIANTES_MASTER.ID_ESTUDIANTE,'
      
        '  ESTUDIANTES_MASTER.PRIMERNOMBRE||'#39' '#39' || ESTUDIANTES_MASTER.SEG' +
        'UNDONOMBRE||'#39' '#39' || ESTUDIANTES_MASTER.PRIMERAPELLIDO||'#39' '#39' || EST' +
        'UDIANTES_MASTER.SEGUNDOAPELLIDO AS NOMBREESTUDIANTE,'
      '  CURSOS.SECCION,'
      '  CURSOS.DESCRIPCION,'
      '  ESTUDIANTE_DET.IDANOESCOLAR'
      'FROM'
      '  ESTUDIANTES_MASTER'
      
        '  INNER JOIN ESTUDIANTE_DET ON (ESTUDIANTES_MASTER.ID_ESTUDIANTE' +
        ' = ESTUDIANTE_DET.ID_ESTUDIANTE)'
      '  INNER JOIN CURSOS ON (ESTUDIANTE_DET.IDCURSO = CURSOS.IDCURSO)'
      '  AND (ESTUDIANTE_DET.IDNIVEL = CURSOS.IDNIVEL)'
      
        '  INNER JOIN CLIENTES ON (ESTUDIANTES_MASTER.IDFAMILIA = CLIENTE' +
        'S.CODIGO_CTE)'
      'WHERE  ESTUDIANTE_DET.IDANOESCOLAR=:idanoescolar'
      'AND   CLIENTES.CODIGO_CTE =:codigocte')
    Left = 440
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idanoescolar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigocte'
        ParamType = ptInput
      end>
    object qryCobroMensEstudiantesCODIGO_CTE: TIntegerField
      FieldName = 'CODIGO_CTE'
      Origin = 'CLIENTES.CODIGO_CTE'
      Required = True
    end
    object qryCobroMensEstudiantesNOMBRE_CTE: TIBStringField
      FieldName = 'NOMBRE_CTE'
      Origin = 'CLIENTES.NOMBRE_CTE'
      Size = 60
    end
    object qryCobroMensEstudiantesDIRECCION_CONT: TIBStringField
      FieldName = 'DIRECCION_CONT'
      Origin = 'CLIENTES.DIRECCION_CONT'
      Size = 60
    end
    object qryCobroMensEstudiantesTELEF_CONTACTO: TIBStringField
      FieldName = 'TELEF_CONTACTO'
      Origin = 'CLIENTES.TELEF_CONTACTO'
      Size = 14
    end
    object qryCobroMensEstudiantesCIUDAD: TIBStringField
      FieldName = 'CIUDAD'
      Origin = 'CLIENTES.CIUDAD'
      Size = 30
    end
    object qryCobroMensEstudiantesCEDULA: TIBStringField
      FieldName = 'CEDULA'
      Origin = 'CLIENTES.CEDULA'
      FixedChar = True
      Size = 15
    end
    object qryCobroMensEstudiantesID_ESTUDIANTE: TIntegerField
      FieldName = 'ID_ESTUDIANTE'
      Origin = 'ESTUDIANTES_MASTER.ID_ESTUDIANTE'
      Required = True
    end
    object qryCobroMensEstudiantesNOMBREESTUDIANTE: TIBStringField
      FieldName = 'NOMBREESTUDIANTE'
      Size = 153
    end
    object qryCobroMensEstudiantesSECCION: TIBStringField
      FieldName = 'SECCION'
      Origin = 'CURSOS.SECCION'
      Required = True
      FixedChar = True
      Size = 8
    end
    object qryCobroMensEstudiantesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'CURSOS.DESCRIPCION'
      Size = 35
    end
    object qryCobroMensEstudiantesIDANOESCOLAR: TIntegerField
      FieldName = 'IDANOESCOLAR'
      Origin = 'ESTUDIANTE_DET.IDANOESCOLAR'
      Required = True
    end
  end
  object qryCobroMensEstudiantesActivos: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      '  CLIENTES.CODIGO_CTE,'
      '  CLIENTES.NOMBRE_CTE,'
      '  CLIENTES.DIRECCION_CONT,'
      '  CLIENTES.TELEF_CONTACTO,'
      '  CLIENTES.CIUDAD,'
      '  CLIENTES.CEDULA,'
      '  ESTUDIANTES_MASTER.ID_ESTUDIANTE,'
      
        '  ESTUDIANTES_MASTER.PRIMERNOMBRE || coalesce( '#39' '#39' || ESTUDIANTE' +
        'S_MASTER.PRIMERAPELLIDO, '#39#39' )'
      '   || coalesce( '#39' '#39' || ESTUDIANTES_MASTER.SEGUNDONOMBRE, '#39#39' )'
      
        '       || '#39' '#39' || coalesce( '#39' '#39' || ESTUDIANTES_MASTER.SEGUNDOAPEL' +
        'LIDO, '#39#39' ) AS NOMBRECLIENTE,'
      '  CURSOS.SECCION,'
      '  CURSOS.DESCRIPCION,'
      '  ESTUDIANTE_DET.IDANOESCOLAR'
      'FROM'
      '  ESTUDIANTES_MASTER'
      
        '  INNER JOIN ESTUDIANTE_DET ON (ESTUDIANTES_MASTER.ID_ESTUDIANTE' +
        ' = ESTUDIANTE_DET.ID_ESTUDIANTE)'
      '  INNER JOIN CURSOS ON (ESTUDIANTE_DET.IDCURSO = CURSOS.IDCURSO)'
      '  AND (ESTUDIANTE_DET.IDNIVEL = CURSOS.IDNIVEL)'
      
        '  INNER JOIN CLIENTES ON (ESTUDIANTES_MASTER.IDFAMILIA = CLIENTE' +
        'S.CODIGO_CTE)'
      'WHERE  ESTUDIANTE_DET.IDANOESCOLAR=:anoescolar'
      'AND CLIENTES.CODIGO_CTE =:codigofamilia'
      'And ESTUDIANTE_DET.STATUS = '#39'A'#39)
    Left = 440
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'anoescolar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigofamilia'
        ParamType = ptInput
      end>
  end
  object IBQuery1: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Estudiante_det')
    Left = 296
    Top = 72
    object IBQuery1IDANOESCOLAR: TIBStringField
      FieldName = 'IDANOESCOLAR'
      Origin = 'ESTUDIANTE_DET.IDANOESCOLAR'
      Required = True
      Size = 12
    end
    object IBQuery1IDCURSO: TIntegerField
      FieldName = 'IDCURSO'
      Origin = 'ESTUDIANTE_DET.IDCURSO'
      Required = True
    end
    object IBQuery1ID_ESTUDIANTE: TIntegerField
      FieldName = 'ID_ESTUDIANTE'
      Origin = 'ESTUDIANTE_DET.ID_ESTUDIANTE'
      Required = True
    end
    object IBQuery1FECHA_IN: TDateTimeField
      FieldName = 'FECHA_IN'
      Origin = 'ESTUDIANTE_DET.FECHA_IN'
    end
    object IBQuery1IN_POR: TIBStringField
      FieldName = 'IN_POR'
      Origin = 'ESTUDIANTE_DET.IN_POR'
      Size = 12
    end
    object IBQuery1COD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Origin = 'ESTUDIANTE_DET.COD_USUARIO'
    end
    object IBQuery1STATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'ESTUDIANTE_DET.STATUS'
      FixedChar = True
      Size = 1
    end
    object IBQuery1IDNIVEL: TIntegerField
      FieldName = 'IDNIVEL'
      Origin = 'ESTUDIANTE_DET.IDNIVEL'
      Required = True
    end
    object IBQuery1NUMERO_ESTUDIANTE: TIBStringField
      FieldName = 'NUMERO_ESTUDIANTE'
      Origin = 'ESTUDIANTE_DET.NUMERO_ESTUDIANTE'
      Size = 10
    end
  end
end
