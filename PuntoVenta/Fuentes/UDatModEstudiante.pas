unit UDatModEstudiante;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBTable;

type
  TdmEstudiante = class(TDataModule)
    qryEstudianteMast: TIBDataSet;
    qryEstudianteDet: TIBDataSet;
    dsqryEstudianteMast: TDataSource;
    dsqryEstudianteDet: TDataSource;
    qryEstudianteMastID_ESTUDIANTE: TIntegerField;
    qryEstudianteMastIDFAMILIA: TIntegerField;
    qryEstudianteMastPRIMERNOMBRE: TIBStringField;
    qryEstudianteMastSEGUNDONOMBRE: TIBStringField;
    qryEstudianteMastPRIMERAPELLIDO: TIBStringField;
    qryEstudianteMastSEGUNDOAPELLIDO: TIBStringField;
    qryEstudianteMastFECHANACIMIENTO: TDateTimeField;
    qryEstudianteMastTELEFONO: TIBStringField;
    qryEstudianteMastCELULAR: TIBStringField;
    qryEstudianteMastEMAIL: TIBStringField;
    qryEstudianteMastFECHA_IN: TDateTimeField;
    qryEstudianteMastIN_POR: TIBStringField;
    qryEstudianteMastCOD_USUARIO: TIntegerField;
    qryEstudianteMastSTATUS: TIBStringField;
    tblFamilia: TIBDataSet;
    tblFamiliaCODIGO: TIntegerField;
    tblFamiliaPRIMERNOMBREPADRE: TIBStringField;
    tblFamiliaSEGUNDONOMBREPADRE: TIBStringField;
    tblFamiliaPRIMERAPELLIDOPADRE: TIBStringField;
    tblFamiliaSEGUNDOAPELLIDOPADRE: TIBStringField;
    tblFamiliaPRIMERNOMBREMADRE: TIBStringField;
    tblFamiliaSEGUNDONOMBREMADRE: TIBStringField;
    tblFamiliaPRIMERAPELLIDOMADRE: TIBStringField;
    tblFamiliaSEGUNDOAPELLIDOMADRE: TIBStringField;
    tblFamiliaSTATUS: TIBStringField;
    dstblFamilia: TDataSource;
    tblFamiliaCEDULA_PADRE: TIBStringField;
    tblFamiliaCEDULA_MADRE: TIBStringField;
    qryClientes: TIBQuery;
    dsqryClientes: TDataSource;
    tblCursos: TIBDataSet;
    tblCursosIDCURSO: TIntegerField;
    tblCursosDESCRIPCION: TIBStringField;
    tblCursosSTATUS: TIBStringField;
    dstblCursos: TDataSource;
    qryCursos: TIBQuery;
    dsqryCursos: TDataSource;
    dstblAnoEscolar: TDataSource;
    qryAnoEscolar: TIBQuery;
    qryAnoEscolarIDANO_INICIAL: TIntegerField;
    qryAnoEscolarIDANO_FINAL: TIntegerField;
    qryAnoEscolarDESCRIPCION: TIBStringField;
    qryAnoEscolarSTATUS: TIBStringField;
    dsqryAnoEscolar: TDataSource;
    qryAnoEscolarCODIGO: TIntegerField;
    tblAnoEscolar: TIBDataSet;
    tblAnoEscolarCODIGO: TIntegerField;
    tblAnoEscolarIDANO_INICIAL: TIntegerField;
    tblAnoEscolarIDANO_FINAL: TIntegerField;
    tblAnoEscolarDESCRIPCION: TIBStringField;
    tblAnoEscolarSTATUS: TIBStringField;
    tblPrecioXNivelColegio: TIBDataSet;
    tblPrecioXNivelColegioIDANIOESCOLAR: TIntegerField;
    tblPrecioXNivelColegioIDNIVEL: TIntegerField;
    tblPrecioXNivelColegioPRECIO: TFloatField;
    tblPrecioXNivelColegioSTATUS: TIBStringField;
    tblPrecioXNivelColegioCOD_USUARIO: TIntegerField;
    tblPrecioXNivelColegioFECHA_IN: TDateTimeField;
    tblPrecioXNivelColegioIN_POR: TIBStringField;
    tblPrecioXNivelColegioFECHA_UPDATE: TDateTimeField;
    dstblPrecioXNivelColegio: TDataSource;
    qryNivelModalidad: TIBQuery;
    dsqryNivelModalidad: TDataSource;
    qryAnoEscolarActivo: TIBQuery;
    qryAnoEscolarActivoCODIGO: TIntegerField;
    qryNivelModalidadCODIGO: TIntegerField;
    qryNivelModalidadDESCRIPCION: TIBStringField;
    qryNivelModalidadSTATUS: TIBStringField;
    tblCursosIDNIVEL: TIntegerField;
    tblCursosSECCION: TIBStringField;
    qryCursosLookupEstudiante: TIBQuery;
    dsqryCursosLookupEstudiante: TDataSource;
    tblPagosEstudiantes: TIBDataSet;
    tblPagosEstudiantesIDANOESCOLAR: TIntegerField;
    tblPagosEstudiantesIDESTUDIANTE: TIntegerField;
    tblPagosEstudiantesFECHA_PAGO: TDateTimeField;
    tblPagosEstudiantesMONTO: TFloatField;
    tblPagosEstudiantesSTATUS: TIBStringField;
    tblPagosEstudiantesCOD_USUARIO: TIntegerField;
    tblPagosEstudiantesFECHA_IN: TDateTimeField;
    tblPagosEstudiantesIN_POR: TIBStringField;
    tblPagosEstudiantesFECHA_UPDATE: TDateTimeField;
    dstblPagosEstudiantes: TDataSource;
    tblAnoEscolarMESINICIAMENSUALIDAD: TDateTimeField;
    tblAnoEscolarMESFINMENSUALIDAD: TDateTimeField;
    qryAnoEscolarActivoMESFINMENSUALIDAD: TDateTimeField;
    qryAnoEscolarActivoMESINICIAMENSUALIDAD: TDateTimeField;
    qryRepPagosAtrasoEstudiante: TIBQuery;
    qryRepPagosAtrasoEstudianteIDANOESCOLAR: TIntegerField;
    qryRepPagosAtrasoEstudianteIDESTUDIANTE: TIntegerField;
    qryRepPagosAtrasoEstudianteFECHA_PAGO: TDateTimeField;
    qryRepPagosAtrasoEstudianteMONTO: TFloatField;
    qryRepPagosAtrasoEstudianteSTATUS: TIBStringField;
    qryRepPagosAtrasoEstudianteCOD_USUARIO: TIntegerField;
    qryRepPagosAtrasoEstudianteFECHA_IN: TDateTimeField;
    qryRepPagosAtrasoEstudianteIN_POR: TIBStringField;
    qryRepPagosAtrasoEstudianteFECHA_UPDATE: TDateTimeField;
    qryRepPagosAtrasoEstudianteMaster: TIBQuery;
    qryRepPagosAtrasoEstudianteMasterCODIGO_CTE: TIntegerField;
    qryRepPagosAtrasoEstudianteMasterNOMBRE_CTE: TIBStringField;
    qryRepPagosAtrasoEstudianteMasterDIRECCION_CONT: TIBStringField;
    qryRepPagosAtrasoEstudianteMasterTELEF_CONTACTO: TIBStringField;
    qryRepPagosAtrasoEstudianteMasterCIUDAD: TIBStringField;
    qryRepPagosAtrasoEstudianteMasterCEDULA: TIBStringField;
    qryRepPagosAtrasoEstudianteMasterID_ESTUDIANTE: TIntegerField;
    qryRepPagosAtrasoEstudianteMasterNOMBREESTUDIANTE: TIBStringField;
    qryRepPagosAtrasoEstudianteMasterSECCION: TIBStringField;
    qryRepPagosAtrasoEstudianteMasterDESCRIPCION: TIBStringField;
    qryRepPagosAtrasoEstudianteMasterIDANOESCOLAR: TIntegerField;
    qryCobroMensEstudiantes: TIBQuery;
    qryCobroMensEstudiantesCODIGO_CTE: TIntegerField;
    qryCobroMensEstudiantesNOMBRE_CTE: TIBStringField;
    qryCobroMensEstudiantesDIRECCION_CONT: TIBStringField;
    qryCobroMensEstudiantesTELEF_CONTACTO: TIBStringField;
    qryCobroMensEstudiantesCIUDAD: TIBStringField;
    qryCobroMensEstudiantesCEDULA: TIBStringField;
    qryCobroMensEstudiantesID_ESTUDIANTE: TIntegerField;
    qryCobroMensEstudiantesNOMBREESTUDIANTE: TIBStringField;
    qryCobroMensEstudiantesSECCION: TIBStringField;
    qryCobroMensEstudiantesDESCRIPCION: TIBStringField;
    qryCobroMensEstudiantesIDANOESCOLAR: TIntegerField;
    qryCobroMensEstudiantesActivos: TIBQuery;
    qryEstudianteDetIDCURSO: TIntegerField;
    qryEstudianteDetID_ESTUDIANTE: TIntegerField;
    qryEstudianteDetIDNIVEL: TIntegerField;
    qryEstudianteDetFECHA_IN: TDateTimeField;
    qryEstudianteDetIN_POR: TIBStringField;
    qryEstudianteDetCOD_USUARIO: TIntegerField;
    qryEstudianteDetSTATUS: TIBStringField;
    qryEstudianteDetNUMERO_ESTUDIANTE: TIBStringField;
    tblAnoEscolarPORC_MORA: TFloatField;
    qryAnoEscolarPORC_MORA: TFloatField;
    qryAnoEscolarActivoPORC_MORA: TFloatField;
    IBQuery1: TIBQuery;
    IBQuery1IDANOESCOLAR: TIBStringField;
    IBQuery1IDCURSO: TIntegerField;
    IBQuery1ID_ESTUDIANTE: TIntegerField;
    IBQuery1FECHA_IN: TDateTimeField;
    IBQuery1IN_POR: TIBStringField;
    IBQuery1COD_USUARIO: TIntegerField;
    IBQuery1STATUS: TIBStringField;
    IBQuery1IDNIVEL: TIntegerField;
    IBQuery1NUMERO_ESTUDIANTE: TIBStringField;
    qryEstudianteDetIDANOESCOLAR: TIntegerField;
    procedure qryEstudianteMastAfterScroll(DataSet: TDataSet);
    procedure qryEstudianteDetAfterScroll(DataSet: TDataSet);
    procedure qryRepPagosAtrasoEstudianteMasterAfterScroll(
      DataSet: TDataSet);
    procedure qryCobroMensEstudiantesAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEstudiante: TdmEstudiante;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TdmEstudiante.qryEstudianteMastAfterScroll(DataSet: TDataSet);
begin
  qryEstudianteDet.Close;
  if qryEstudianteMastID_ESTUDIANTE.Value > 0 then
  qryEstudianteDet.Params[0].AsInteger:= qryEstudianteMastID_ESTUDIANTE.Value;
  qryEstudianteDet.Open;
end;

procedure TdmEstudiante.qryEstudianteDetAfterScroll(DataSet: TDataSet);
begin
  qryCursosLookupEstudiante.Close;
  qryCursosLookupEstudiante.Params[0].Value := qryEstudianteDetIDNIVEL.Value;
  qryCursosLookupEstudiante.Open;
end;

procedure TdmEstudiante.qryRepPagosAtrasoEstudianteMasterAfterScroll(
  DataSet: TDataSet);
begin
  qryRepPagosAtrasoEstudiante.Close;
  qryRepPagosAtrasoEstudiante.Params[0].Value:= qryRepPagosAtrasoEstudianteMasterIDANOESCOLAR.Value;
  qryRepPagosAtrasoEstudiante.Params[1].Value:= qryRepPagosAtrasoEstudianteMasterID_ESTUDIANTE.Value;
  qryRepPagosAtrasoEstudiante.Params[2].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  qryRepPagosAtrasoEstudiante.Open;
end;

procedure TdmEstudiante.qryCobroMensEstudiantesAfterScroll(
  DataSet: TDataSet);
begin
  qryRepPagosAtrasoEstudiante.Close;
  qryRepPagosAtrasoEstudiante.Params[0].Value:= qryCobroMensEstudiantesIDANOESCOLAR.Value;
  qryRepPagosAtrasoEstudiante.Params[1].Value:= qryCobroMensEstudiantesID_ESTUDIANTE.Value;
  qryRepPagosAtrasoEstudiante.Params[2].Value:= ExtraerFecha(GlbFechaTrnDiaria)+365;
  qryRepPagosAtrasoEstudiante.Open;
end;

end.
