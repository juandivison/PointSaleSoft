object dmCobertura: TdmCobertura
  OldCreateOrder = False
  Left = 875
  Top = 326
  Height = 424
  Width = 697
  object tblTipoAfiliacion: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from TIPO_AFILIADO'
      'where'
      '  IDTIPO = :OLD_IDTIPO')
    InsertSQL.Strings = (
      'insert into TIPO_AFILIADO'
      
        '  (IDTIPO, DESCRIPCION, MONTOCOBERTURA, DIASDECARENCIA, YEARANTI' +
        'GUEDAD, '
      '   STATUS, RUTACARTABIENVENIDA)'
      'values'
      
        '  (:IDTIPO, :DESCRIPCION, :MONTOCOBERTURA, :DIASDECARENCIA, :YEA' +
        'RANTIGUEDAD, '
      '   :STATUS, :RUTACARTABIENVENIDA)')
    RefreshSQL.Strings = (
      'Select '
      '  IDTIPO,'
      '  DESCRIPCION,'
      '  MONTOCOBERTURA,'
      '  DIASDECARENCIA,'
      '  YEARANTIGUEDAD,'
      '  STATUS,'
      '  RUTACARTABIENVENIDA'
      'from TIPO_AFILIADO '
      'where'
      '  IDTIPO = :IDTIPO')
    SelectSQL.Strings = (
      'select *  from TIPO_AFILIADO')
    ModifySQL.Strings = (
      'update TIPO_AFILIADO'
      'set'
      '  IDTIPO = :IDTIPO,'
      '  DESCRIPCION = :DESCRIPCION,'
      '  MONTOCOBERTURA = :MONTOCOBERTURA,'
      '  DIASDECARENCIA = :DIASDECARENCIA,'
      '  YEARANTIGUEDAD = :YEARANTIGUEDAD,'
      '  STATUS = :STATUS,'
      '  RUTACARTABIENVENIDA = :RUTACARTABIENVENIDA'
      'where'
      '  IDTIPO = :OLD_IDTIPO')
    Left = 104
    Top = 120
    object tblTipoAfiliacionIDTIPO: TIntegerField
      FieldName = 'IDTIPO'
      Origin = 'TIPO_AFILIADO.IDTIPO'
      Required = True
    end
    object tblTipoAfiliacionDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'TIPO_AFILIADO.DESCRIPCION'
      Size = 80
    end
    object tblTipoAfiliacionMONTOCOBERTURA: TFloatField
      FieldName = 'MONTOCOBERTURA'
      Origin = 'TIPO_AFILIADO.MONTOCOBERTURA'
    end
    object tblTipoAfiliacionDIASDECARENCIA: TIntegerField
      FieldName = 'DIASDECARENCIA'
      Origin = 'TIPO_AFILIADO.DIASDECARENCIA'
    end
    object tblTipoAfiliacionYEARANTIGUEDAD: TIntegerField
      FieldName = 'YEARANTIGUEDAD'
      Origin = 'TIPO_AFILIADO.YEARANTIGUEDAD'
    end
    object tblTipoAfiliacionSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TIPO_AFILIADO.STATUS'
      FixedChar = True
      Size = 1
    end
    object tblTipoAfiliacionRUTACARTABIENVENIDA: TIBStringField
      FieldName = 'RUTACARTABIENVENIDA'
      Origin = 'TIPO_AFILIADO.RUTACARTABIENVENIDA'
      Size = 200
    end
  end
  object dstblTipoAfiliacion: TDataSource
    DataSet = tblTipoAfiliacion
    Left = 96
    Top = 176
  end
  object tblCobertura: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    AfterScroll = tblCoberturaAfterScroll
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from COBERTURA'
      'where'
      '  IDCOBERTURA = :OLD_IDCOBERTURA')
    InsertSQL.Strings = (
      'insert into COBERTURA'
      '  (IDCOBERTURA, IDTIPO, FECHA_INI, FECHA_FIN)'
      'values'
      '  (:IDCOBERTURA, :IDTIPO, :FECHA_INI, :FECHA_FIN)')
    RefreshSQL.Strings = (
      'Select '
      '  IDCOBERTURA,'
      '  IDTIPO,'
      '  FECHA_INI,'
      '  FECHA_FIN'
      'from COBERTURA '
      'where'
      '  IDCOBERTURA = :IDCOBERTURA')
    SelectSQL.Strings = (
      'select * from COBERTURA')
    ModifySQL.Strings = (
      'update COBERTURA'
      'set'
      '  IDCOBERTURA = :IDCOBERTURA,'
      '  IDTIPO = :IDTIPO,'
      '  FECHA_INI = :FECHA_INI,'
      '  FECHA_FIN = :FECHA_FIN'
      'where'
      '  IDCOBERTURA = :OLD_IDCOBERTURA')
    GeneratorField.Field = 'IDCOBERTURA'
    GeneratorField.Generator = 'gen_numcobertura'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 296
    Top = 88
    object tblCoberturaIDCOBERTURA: TIntegerField
      FieldName = 'IDCOBERTURA'
      Origin = 'COBERTURA.IDCOBERTURA'
      Required = True
    end
    object tblCoberturaIDTIPO: TIntegerField
      FieldName = 'IDTIPO'
      Origin = 'COBERTURA.IDTIPO'
      Required = True
    end
    object tblCoberturaFECHA_INI: TDateTimeField
      FieldName = 'FECHA_INI'
      Origin = 'COBERTURA.FECHA_INI'
      Required = True
    end
    object tblCoberturaFECHA_FIN: TDateTimeField
      FieldName = 'FECHA_FIN'
      Origin = 'COBERTURA.FECHA_FIN'
      Required = True
    end
  end
  object dstblCobertura: TDataSource
    DataSet = tblCobertura
    Left = 296
    Top = 160
  end
  object tblTipoAfiliadoLookup: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_AFILIADO'
    Left = 288
    Top = 216
  end
  object dstblTipoAfiliadoLookup: TDataSource
    DataSet = tblTipoAfiliadoLookup
    Left = 296
    Top = 272
  end
  object tblCoberturaDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from COBERTURA_DET'
      'where'
      '  IDCOBERTURA = :OLD_IDCOBERTURA and'
      '  YEAR_INI = :OLD_YEAR_INI and'
      '  YEAR_FIN = :OLD_YEAR_FIN and'
      '  KM_INI = :OLD_KM_INI and'
      '  KM_FIN = :OLD_KM_FIN')
    InsertSQL.Strings = (
      'insert into COBERTURA_DET'
      
        '  (IDCOBERTURA, YEAR_INI, YEAR_FIN, KM_INI, KM_FIN, PORC_INDEMNI' +
        'ZACION)'
      'values'
      
        '  (:IDCOBERTURA, :YEAR_INI, :YEAR_FIN, :KM_INI, :KM_FIN, :PORC_I' +
        'NDEMNIZACION)')
    RefreshSQL.Strings = (
      'Select '
      '  IDCOBERTURA,'
      '  YEAR_INI,'
      '  YEAR_FIN,'
      '  KM_INI,'
      '  KM_FIN,'
      '  PORC_INDEMNIZACION'
      'from COBERTURA_DET '
      'where'
      '  IDCOBERTURA = :IDCOBERTURA and'
      '  YEAR_INI = :YEAR_INI and'
      '  YEAR_FIN = :YEAR_FIN and'
      '  KM_INI = :KM_INI and'
      '  KM_FIN = :KM_FIN')
    SelectSQL.Strings = (
      'Select *  From COBERTURA_DET'
      'where idcobertura=:idcobertura')
    ModifySQL.Strings = (
      'update COBERTURA_DET'
      'set'
      '  IDCOBERTURA = :IDCOBERTURA,'
      '  YEAR_INI = :YEAR_INI,'
      '  YEAR_FIN = :YEAR_FIN,'
      '  KM_INI = :KM_INI,'
      '  KM_FIN = :KM_FIN,'
      '  PORC_INDEMNIZACION = :PORC_INDEMNIZACION'
      'where'
      '  IDCOBERTURA = :OLD_IDCOBERTURA and'
      '  YEAR_INI = :OLD_YEAR_INI and'
      '  YEAR_FIN = :OLD_YEAR_FIN and'
      '  KM_INI = :OLD_KM_INI and'
      '  KM_FIN = :OLD_KM_FIN')
    Left = 392
    Top = 88
    object tblCoberturaDetIDCOBERTURA: TIntegerField
      FieldName = 'IDCOBERTURA'
      Origin = 'COBERTURA_DET.IDCOBERTURA'
      Required = True
    end
    object tblCoberturaDetYEAR_INI: TIntegerField
      FieldName = 'YEAR_INI'
      Origin = 'COBERTURA_DET.YEAR_INI'
      Required = True
    end
    object tblCoberturaDetYEAR_FIN: TIntegerField
      FieldName = 'YEAR_FIN'
      Origin = 'COBERTURA_DET.YEAR_FIN'
      Required = True
    end
    object tblCoberturaDetKM_INI: TIntegerField
      FieldName = 'KM_INI'
      Origin = 'COBERTURA_DET.KM_INI'
    end
    object tblCoberturaDetKM_FIN: TIntegerField
      FieldName = 'KM_FIN'
      Origin = 'COBERTURA_DET.KM_FIN'
    end
    object tblCoberturaDetPORC_INDEMNIZACION: TFloatField
      FieldName = 'PORC_INDEMNIZACION'
      Origin = 'COBERTURA_DET.PORC_INDEMNIZACION'
    end
  end
  object dstblCoberturaDet: TDataSource
    DataSet = tblCoberturaDet
    Left = 400
    Top = 160
  end
  object ipstpProc_ConvierteCteEnProv: TIBStoredProc
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    StoredProcName = 'Proc_ConvierteCteEnProv'
    Left = 400
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO_PROV'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'XCODIGOCTE'
        ParamType = ptInput
      end>
  end
end
