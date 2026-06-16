unit UDatModCompania;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery;

type
  TdmCompania = class(TDataModule)
    tblCompania: TIBTable;
    tblCompaniaCODIGO: TSmallintField;
    tblCompaniaNOMBRE: TIBStringField;
    tblCompaniaCALLEYNUMERO: TIBStringField;
    tblCompaniaTELEFONO: TIBStringField;
    tblCompaniaFAX: TIBStringField;
    tblCompaniaEMAIL: TIBStringField;
    tblCompaniaWEBSITE: TIBStringField;
    tblCompaniaCIUDAD: TIBStringField;
    tblCompaniaPAIS: TIBStringField;
    tblCompaniaRNC_NUMERO: TIBStringField;
    tblCompaniaDIRECTORIO: TIBStringField;
    tblCompaniaFECHAI_ACT: TDateTimeField;
    tblCompaniaFECHAF_ACT: TDateTimeField;
    tblCompaniaCTA1_GYP_PERIODO: TIBStringField;
    tblCompaniaCTA2_GYP_PERIODO: TIBStringField;
    tblCompaniaCTA3_GYP_PERIODO: TIBStringField;
    tblCompaniaCTA1_SUPERAVIT_ACM: TIBStringField;
    tblCompaniaCTA2_SUPERAVIT_ACM: TIBStringField;
    tblCompaniaCTA3_SUPERAVIT_ACM: TIBStringField;
    tblCompaniaCTA1_RESUMEN_GYP: TIBStringField;
    tblCompaniaCTA2_RESUMEN_GYP: TIBStringField;
    tblCompaniaCTA3_RESUMEN_GYP: TIBStringField;
    tblCompaniaOBSERVACION: TIBStringField;
    tblCompaniaSTATUS: TIBStringField;
    tblCompaniaNUM_PATENTE: TIBStringField;
    tblCompaniaCTA1_ULT_RETENIDA: TIBStringField;
    tblCompaniaCTA2_ULT_RETENIDA: TIBStringField;
    tblCompaniaCTA3_ULT_RETENIDA: TIBStringField;
    tblCompaniaCTA1_GYP_MES: TIBStringField;
    tblCompaniaCTA2_GYP_MES: TIBStringField;
    tblCompaniaCTA3_GYP_MES: TIBStringField;
    tblCompaniaFECHA_IN: TDateTimeField;
    tblCompaniaIN_POR: TIBStringField;
    tblCompaniaFECHA_MOD: TDateTimeField;
    tblCompaniaMOD_POR: TIBStringField;
    dstblCompania: TDataSource;
    tblCompaniaLOGOCIA: TIBStringField;
    tblCompaniaOFFICE_ID: TIntegerField;
    tblCompaniaNUM_SUCURSAL: TIBStringField;
    tblTrackingEmail: TIBDataSet;
    qryEmailProceso: TIBQuery;
    qryEmailProcesoIDTIPO: TIntegerField;
    qryEmailProcesoSUBJECT: TIBStringField;
    qryEmailProcesoPORT: TIntegerField;
    qryEmailProcesoEMAIL_SERVER: TIBStringField;
    qryEmailProcesoUSER_EMAIL: TIBStringField;
    qryEmailProcesoUSER_PASSWORD: TIBStringField;
    qryEmailProcesoFROMEMAIL: TIBStringField;
    qryEmailProcesoTOEMAIL: TIBStringField;
    qryEmailProcesoCCEMAIL: TIBStringField;
    qryEmailProcesoFECHAIN: TDateTimeField;
    qryEmailProcesoIN_POR: TIBStringField;
    qryEmailProcesoFECHA_UPDATE: TDateTimeField;
    qryEmailProcesoUPD_POR: TIBStringField;
    qryEmailProcesoSTATUS: TIBStringField;
    qryEmailProcesoEXEMAILTOOL: TIBStringField;
    tblEmailProceso: TIBDataSet;
    tblEmailProcesoIDTIPO: TIntegerField;
    tblEmailProcesoSUBJECT: TIBStringField;
    tblEmailProcesoPORT: TIntegerField;
    tblEmailProcesoEMAIL_SERVER: TIBStringField;
    tblEmailProcesoUSER_EMAIL: TIBStringField;
    tblEmailProcesoUSER_PASSWORD: TIBStringField;
    tblEmailProcesoFROMEMAIL: TIBStringField;
    tblEmailProcesoTOEMAIL: TIBStringField;
    tblEmailProcesoCCEMAIL: TIBStringField;
    tblEmailProcesoEXEMAILTOOL: TIBStringField;
    tblEmailProcesoFECHAIN: TDateTimeField;
    tblEmailProcesoIN_POR: TIBStringField;
    tblEmailProcesoFECHA_UPDATE: TDateTimeField;
    tblEmailProcesoUPD_POR: TIBStringField;
    tblEmailProcesoSTATUS: TIBStringField;
    tblTrackingEmailSERIE: TIntegerField;
    tblTrackingEmailIDTIPO: TIntegerField;
    tblTrackingEmailFECHA: TDateTimeField;
    tblTrackingEmailTOEMAIL: TIBStringField;
    tblTrackingEmailFROMEMAIL: TIBStringField;
    tblTrackingEmailSUBJECT: TIBStringField;
    tblTrackingEmailCOD_USER: TIntegerField;
    tblTrackingEmailSTATUS: TIBStringField;
    tblTrackingEmailERRORMESSAGE: TIBStringField;
    tblTrackingEmailFECHAIN: TDateTimeField;
    tblTrackingEmailIN_POR: TIBStringField;
    tblTrackingEmailFECHA_UPDATE: TDateTimeField;
    tblTrackingEmailUPD_POR: TIBStringField;
    tblCompaniaIMAGEN_DESKTOP: TIBStringField;
    tblCompaniaID_PROVINCIA: TIntegerField;
    tblCompaniaID_MUNICIPIO: TIntegerField;
    tblCompaniaTIPO_RIESGO_ARL: TIBStringField;
    tbltipo_riesgo_arl: TIBTable;
    tbltipo_riesgo_arlID: TIntegerField;
    tbltipo_riesgo_arlTIPO: TIBStringField;
    tbltipo_riesgo_arlFECHA_INI: TDateTimeField;
    tbltipo_riesgo_arlFECHA_FIN: TDateTimeField;
    tbltipo_riesgo_arlPORCIENTO: TFloatField;
    procedure tblCompaniaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCompania: TdmCompania;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TdmCompania.tblCompaniaAfterScroll(DataSet: TDataSet);
begin
  GlbNombreCia := UpperCase(dmCompania.tblCompaniaNOMBRE.Value);
end;

end.
