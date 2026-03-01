unit UDatmodDatosGenerales;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBTable, IBSQL;

type
  TdmDatos = class(TDataModule)
    qryTasa: TIBQuery;
    dsqryTasa: TDataSource;
    qryTasaSERIE: TIntegerField;
    qryTasaVALORMONEDA: TFloatField;
    qryTasaSIMBOLO: TIBStringField;
    tblPlanFunerario: TIBDataSet;
    dstblPlanFunerario: TDataSource;
    tblTipoPlan: TIBTable;
    qryClientes: TIBQuery;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesTIPO_CLIENTE: TSmallintField;
    qryClientesFOTO: TBlobField;
    qryClientesNOMBRE_CTE: TIBStringField;
    qryClientesNOMBRE_ABREV: TIBStringField;
    qryClientesMONEDA_FACT: TIBStringField;
    qryClientesNOMBRE_FACTURAR: TIBStringField;
    qryClientesCONTACTO: TIBStringField;
    qryClientesDIRECCION_CONT: TIBStringField;
    qryClientesTELEF_CONTACTO: TIBStringField;
    qryClientesFAX_CONTACTO: TIBStringField;
    qryClientesFORMA_PAGO: TSmallintField;
    qryClientesCODIGO_AGENCIA: TSmallintField;
    qryClientesSTATUS_CLIENTE: TIBStringField;
    qryClientesINSERTADO_POR: TIBStringField;
    qryClientesFECHA_INSERTADO: TDateTimeField;
    qryClientesFECHA_MOD: TDateTimeField;
    qryClientesMODI_POR: TIBStringField;
    qryClientesLIMITE_CREDITO: TFloatField;
    qryClientesEMAIL: TIBStringField;
    qryClientesWEBSITE: TIBStringField;
    qryClientesPAIS: TIBStringField;
    qryClientesCIUDAD: TIBStringField;
    qryClientesCEDULA: TIBStringField;
    qryClientesRNC: TIBStringField;
    qryClientesREFERENCIA: TIBStringField;
    qryClientesTELEF_REFERENCIA: TIBStringField;
    qryClientesOTRO_TELEFONO: TIBStringField;
    qryClientesCANT_DIAS_CREDITO: TSmallintField;
    qryClientesTIPO_NCF: TIBStringField;
    qryClientesOBSERVACION: TMemoField;
    qryClientesLUGAR_DE_TRABAJO: TIBStringField;
    qryClientesAPODO: TIBStringField;
    qryClientesCODIGO_USUARIO: TIntegerField;
    qryClientesRNC_NUMERO: TIBStringField;
    qryClientesCOMENTARIO: TMemoField;
    qryClientesCONDICION: TIntegerField;
    qryClientesPRECIO_ID: TIntegerField;
    dsqryClientes: TDataSource;
    tblTipoPlanTIPO: TSmallintField;
    tblTipoPlanDESCRIPCION: TIBStringField;
    dstblTipoPlan: TDataSource;
    tblPlanFunerarioDet: TIBDataSet;
    dstblPlanFunerarioDet: TDataSource;
    tblPlanFunerarioID_PLAN: TIntegerField;
    tblPlanFunerarioID_TIPO_PLAN: TSmallintField;
    tblPlanFunerarioCODIGO_CTE: TIntegerField;
    tblPlanFunerarioFECHA_APERTURA: TDateTimeField;
    tblPlanFunerarioFECHA_CIERRE: TDateTimeField;
    tblPlanFunerarioSTATUS: TIBStringField;
    tblPlanFunerarioFECHA_IN: TDateTimeField;
    tblPlanFunerarioINS_POR: TIBStringField;
    tblPlanFunerarioFECHA_UPDATE: TDateTimeField;
    tblPlanFunerarioUPDATE_POR: TIBStringField;
    tblPlanFunerarioCOD_UDUARIO: TIntegerField;
    tblPlanFunerarioDetSERIE: TIntegerField;
    tblPlanFunerarioDetID_PLAN: TIntegerField;
    tblPlanFunerarioDetNIVEL: TSmallintField;
    tblPlanFunerarioDetFECHA_INGRESO: TDateTimeField;
    tblPlanFunerarioDetFECHA_NACIMIENTO: TDateTimeField;
    tblPlanFunerarioDetFECHA_DECESO: TDateTimeField;
    tblPlanFunerarioDetCEDULA: TIBStringField;
    tblPlanFunerarioDetPRIMER_NOMBRE: TIBStringField;
    tblPlanFunerarioDetSEGUNDO_NOMBRE: TIBStringField;
    tblPlanFunerarioDetPRIMER_APELLIDO: TIBStringField;
    tblPlanFunerarioDetSEGUNDO_APELLIDO: TIBStringField;
    tblPlanFunerarioDetSTATUS: TIBStringField;
    tblRelacion: TIBTable;
    tblRelacionCODIGO: TIntegerField;
    tblRelacionDESCRIPCION: TIBStringField;
    dstblRelacion: TDataSource;
    tblPlanFunerarioFECHA_PAGO: TDateTimeField;
    tblPlanFunerarioNUM_ULTIMA_FACT: TFloatField;
    qryTipoPlan: TIBQuery;
    dsqryTipoPlan: TDataSource;
    tblTarifaPlan: TIBDataSet;
    tblTarifaPlanID_TIPO: TIntegerField;
    tblTarifaPlanFECHA_INICIAL: TDateTimeField;
    tblTarifaPlanFECHA_FINAL: TDateTimeField;
    tblTarifaPlanPRECIO: TFloatField;
    tblTarifaPlanSTATUS: TIBStringField;
    tblTarifaPlanFECHA_IN: TDateTimeField;
    tblTarifaPlanINS_POR: TIBStringField;
    tblTarifaPlanFECHA_UPDATE: TDateTimeField;
    tblTarifaPlanUPDATE_POR: TIBStringField;
    tblTarifaPlanCOD_UDUARIO: TIntegerField;
    dstblTarifaPlan: TDataSource;
    tblTipoPlanCANT_DEP: TIntegerField;
    ibsqlBuscaTarifaPlan: TIBSQL;
    qryPrecioTipoPlan: TIBQuery;
    qryPrecioTipoPlanPRECIO: TFloatField;
    tblPlanFunerarioCARGAR_ITBIS: TSmallintField;
    tblPlanFunerarioTIPO_NCF: TIBStringField;
    tblPlanFunerarioFECHA_ULT_FACT: TDateTimeField;
    tblPlanFunerarioCOD_SERVICIO: TIntegerField;
    qryInventario: TIBQuery;
    dsqryInventario: TDataSource;
    qryPlanRepMaster: TIBQuery;
    qryPlanRepDet: TIBQuery;
    qryPlanRepMasterID_PLAN: TIntegerField;
    qryPlanRepMasterID_TIPO_PLAN: TSmallintField;
    qryPlanRepMasterCODIGO_CTE: TIntegerField;
    qryPlanRepMasterFECHA_APERTURA: TDateTimeField;
    qryPlanRepMasterFECHA_CIERRE: TDateTimeField;
    qryPlanRepMasterSTATUS: TIBStringField;
    qryPlanRepMasterFECHA_IN: TDateTimeField;
    qryPlanRepMasterINS_POR: TIBStringField;
    qryPlanRepMasterFECHA_UPDATE: TDateTimeField;
    qryPlanRepMasterUPDATE_POR: TIBStringField;
    qryPlanRepMasterCOD_UDUARIO: TIntegerField;
    qryPlanRepMasterFECHA_PAGO: TDateTimeField;
    qryPlanRepMasterNUM_ULTIMA_FACT: TFloatField;
    qryPlanRepMasterCARGAR_ITBIS: TSmallintField;
    qryPlanRepMasterTIPO_NCF: TIBStringField;
    qryPlanRepMasterFECHA_ULT_FACT: TDateTimeField;
    qryPlanRepMasterCOD_SERVICIO: TIntegerField;
    qryPlanRepMasterDESCRIPCION: TIBStringField;
    qryPlanRepMasterCANT_DEP: TIntegerField;
    qryPlanRepMasterNOMBRE_CTE: TIBStringField;
    qryPlanRepMasterTELEF_CONTACTO: TIBStringField;
    qryPlanRepMasterDIRECCION_CONT: TIBStringField;
    qryPlanRepMasterCIUDAD: TIBStringField;
    qryPlanRepMasterCEDULA: TIBStringField;
    qryPlanRepMasterRNC_NUMERO: TIBStringField;
    qryPlanRepDetSERIE: TIntegerField;
    qryPlanRepDetID_PLAN: TIntegerField;
    qryPlanRepDetNIVEL: TSmallintField;
    qryPlanRepDetFECHA_INGRESO: TDateTimeField;
    qryPlanRepDetFECHA_NACIMIENTO: TDateTimeField;
    qryPlanRepDetFECHA_DECESO: TDateTimeField;
    qryPlanRepDetCEDULA: TIBStringField;
    qryPlanRepDetPRIMER_NOMBRE: TIBStringField;
    qryPlanRepDetSEGUNDO_NOMBRE: TIBStringField;
    qryPlanRepDetPRIMER_APELLIDO: TIBStringField;
    qryPlanRepDetSEGUNDO_APELLIDO: TIBStringField;
    qryPlanRepDetSTATUS: TIBStringField;
    qryPlanRepDetRELACIONDEP: TIBStringField;
    tblPlanFunerarioCOD_VENDEDOR: TIntegerField;
    tblTarifaPlanPORC_COMISION: TFloatField;
    qryEmpleados: TIBQuery;
    dsqryEmpleados: TDataSource;
    qryEmpleadosCODIGO: TIntegerField;
    qryEmpleadosFOTO: TBlobField;
    qryEmpleadosNOMBRE: TIBStringField;
    qryEmpleadosDIRECCION: TIBStringField;
    qryEmpleadosTELEFONO: TIBStringField;
    qryEmpleadosCELULAR: TIBStringField;
    qryEmpleadosSTATUS: TIBStringField;
    qryEmpleadosEMAIL: TIBStringField;
    qryEmpleadosWEBSITE: TIBStringField;
    qryEmpleadosPAIS: TIBStringField;
    qryEmpleadosCIUDAD: TIBStringField;
    qryEmpleadosCEDULA: TIBStringField;
    qryEmpleadosREFERENCIA: TIBStringField;
    qryEmpleadosTELEF_REFERENCIA: TIBStringField;
    qryEmpleadosOTRO_TELEFONO: TIBStringField;
    qryEmpleadosAPODO: TIBStringField;
    qryEmpleadosINSERTADO_POR: TIBStringField;
    qryEmpleadosFECHA_INSERTADO: TDateTimeField;
    qryEmpleadosFECHA_MOD: TDateTimeField;
    qryEmpleadosMODI_POR: TIBStringField;
    procedure tblPlanFunerarioAfterScroll(DataSet: TDataSet);
    procedure qryPlanRepMasterAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDatos: TdmDatos;

implementation

uses UDatModConectar;//UDatModCon;

{$R *.dfm}

procedure TdmDatos.tblPlanFunerarioAfterScroll(DataSet: TDataSet);
begin
  tblPlanFunerarioDet.close;
  tblPlanFunerarioDet.Params[0].Value := tblPlanFunerarioID_PLAN.Value;
  tblPlanFunerarioDet.Open;
end;

procedure TdmDatos.qryPlanRepMasterAfterScroll(DataSet: TDataSet);
begin
  qryPlanRepDet.Close;
  qryPlanRepDet.Params[0].Value:= qryPlanRepMasterID_PLAN.Value;
  qryPlanRepDet.Open;
end;

end.
