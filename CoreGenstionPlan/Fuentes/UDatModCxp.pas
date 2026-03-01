unit UDatModCxp;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBStoredProc, IBQuery, IBSQL,
  IBTable;

type
  TdmCxp = class(TDataModule)
    tblTransCxp: TIBDataSet;
    tblTransCxpSERIE: TFloatField;
    tblTransCxpTIPO_DOC: TIntegerField;
    tblTransCxpMONEDA: TIBStringField;
    tblTransCxpFECHA: TDateTimeField;
    tblTransCxpNUMERO_DOC: TIntegerField;
    tblTransCxpCODIGO_CLIENTE: TIntegerField;
    tblTransCxpCODIGO_SERV: TIntegerField;
    tblTransCxpCONCEPTO: TIBStringField;
    tblTransCxpVALOR_DOCUMENTO: TFloatField;
    tblTransCxpTIPO_TRANF: TSmallintField;
    tblTransCxpSTATUS: TIBStringField;
    tblTransCxpTIPO_SERV: TIntegerField;
    tblTransCxpFECHA_IN: TDateTimeField;
    tblTransCxpIN_POR: TIBStringField;
    tblTransCxpFECHA_MOD: TDateTimeField;
    tblTransCxpMOD_POR: TIBStringField;
    stpInsFactPendiente: TIBStoredProc;
    qryBceProvee: TIBQuery;
    qryRepblcCtesHist: TIBQuery;
    qryTrnCxp: TIBQuery;
    qryProvCxp: TIBQuery;
    qrySQLBlceAntCxPCte: TIBSQL;
    qryRepServ: TIBQuery;
    qryRepServBalance_Ant: TFloatField;
    qryRepServBalance_Actual: TFloatField;
    qryRepServTIPOSERVICIO: TIntegerField;
    qryRepServDESCRIPCION: TIBStringField;
    qryRepServFECHA_DET: TDateTimeField;
    qryRepServCODIGO_CTE: TIntegerField;
    qryRepServNOMBRE_FACTURAR: TIBStringField;
    qryRepServNOMBRE_CLIENTE_DET: TIBStringField;
    qryRepServCANTIDAD_DETA: TIntegerField;
    qryRepServCANT_ADULTO_DETA: TIntegerField;
    qryRepServTARIFA_SERV_DETA: TFloatField;
    qryRepServMONEDA_DET: TIBStringField;
    qryRepServPORC_DESC_DET: TFloatField;
    qryRepServVALOR_SERVICIO_DET: TFloatField;
    qryRepServVALOR_TOTAL_DET: TFloatField;
    qryRepServNUM_FACT_DET: TIntegerField;
    qryRepServNUMERO_RECIBO: TIntegerField;
    qryRepServIMPUESTO_SERV_DET: TFloatField;
    qryRepServSTATUS_DET: TIBStringField;
    qryRepServCOD_AREA_FACT: TIntegerField;
    qryRepServCONTACTO: TIBStringField;
    qryRepServTELEF_CONTACTO: TIBStringField;
    qryRepServEMAIL: TIBStringField;
    qryRepServAREA: TIBStringField;
    qryRepServORIGEN: TIntegerField;
    qryRepServVALOR_INGRESO_RECIBO: TFloatField;
    qryRepServDIRECCION_CONT: TIBStringField;
    qryRepServFAX_CONTACTO: TIBStringField;
    qryRepServWEBSITE: TIBStringField;
    qryRepServPAIS: TIBStringField;
    qryRepServCIUDAD: TIBStringField;
    qryRepServTIPO_DOC: TSmallintField;
    qryRepServDEBITO: TFloatField;
    qryRepServCREDITO: TFloatField;
    qryBceHistoricocxp: TIBQuery;
    qryPagosCxp: TIBDataSet;
    qryPagoCxpDet: TIBDataSet;
    qryPagosCxpSERIE: TFloatField;
    qryPagosCxpTIPO: TSmallintField;
    qryPagosCxpNUMERO: TFloatField;
    qryPagosCxpMONEDA: TIBStringField;
    qryPagosCxpFECHA: TDateTimeField;
    qryPagosCxpVALOR_ING: TFloatField;
    qryPagosCxpTIPO_ING: TSmallintField;
    qryPagosCxpNOMBRE_CTE: TIBStringField;
    qryPagosCxpCODIGO_CTE: TIntegerField;
    qryPagosCxpCOD_SERVICIO: TIntegerField;
    qryPagosCxpFORMA_PAGO: TSmallintField;
    qryPagosCxpDOCUMENTO: TIBStringField;
    qryPagosCxpTIPO_TARGETA: TSmallintField;
    qryPagosCxpSTATUS_TARGETA: TIBStringField;
    qryPagosCxpCONCEPTO: TIBStringField;
    qryPagosCxpSTATUS: TIBStringField;
    qryPagosCxpOBSERVACION: TIBStringField;
    qryPagosCxpCOD_LINEA: TIBStringField;
    qryPagosCxpFECHA_IN: TDateTimeField;
    qryPagosCxpIN_POR: TIBStringField;
    qryPagosCxpFECHA_MOD: TDateTimeField;
    qryPagosCxpMOD_POR: TIBStringField;
    qryPagoCxpDetSERIE: TFloatField;
    qryPagoCxpDetSERIE_MASTER: TIntegerField;
    qryPagoCxpDetNUMERO_ING: TIntegerField;
    qryPagoCxpDetCOD_SERVICIO: TIntegerField;
    qryPagoCxpDetCOD_DEPARTAMENTO: TIBStringField;
    qryPagoCxpDetDETALLE: TIBStringField;
    qryPagoCxpDetVALOR_DET: TFloatField;
    qryPagoCxpDetSTATUS: TIBStringField;
    qryPagoCxpDetVALOR_IMPUESTO: TFloatField;
    qryPagoCxpDetPORC_DESCUENTO: TFloatField;
    qryPagoCxpDetFECHA_IN: TDateTimeField;
    qryPagoCxpDetIN_POR: TIBStringField;
    qryPagoCxpDetFECHA_MOD: TDateTimeField;
    qryPagoCxpDetMOD_POR: TIBStringField;
    qryPagoCxpDetTIPO_TARJETA: TSmallintField;
    qryPagoCxpDetNUMERO_TARJETA_CRED: TIBStringField;
    qryPagoCxpDetANO_VENCE: TIntegerField;
    qryPagoCxpDetMES_VENCE: TSmallintField;
    qryPagoCxpDetMONTOAUTORIZADO: TFloatField;
    qryPagoCxpDetNUMERO_APROBACION: TIBStringField;
    qryPagoCxpDetTIPO: TSmallintField;
    qryPagoCxpDetCODIGO_PROVEEDOR: TSmallintField;
    qryPagoCxpDetFCTING_SERIE: TIntegerField;
    qryRepPgoDetalle: TIBQuery;
    qryRepPgoDetalleNUMERO_ING: TIntegerField;
    qryRepPgoDetalleDETALLE: TIBStringField;
    qryRepPgoDetalleVALOR_IMPUESTO: TFloatField;
    qryRepPgoDetallePORC_DESCUENTO: TFloatField;
    qryRepPgoDetalleTIPO_TARJETA: TSmallintField;
    qryRepPgoDetalleNUMERO_TARJETA_CRED: TIBStringField;
    qryRepPgoDetalleANO_VENCE: TIntegerField;
    qryRepPgoDetalleMES_VENCE: TSmallintField;
    qryRepPgoDetalleMONTOAUTORIZADO: TFloatField;
    qryRepPgoDetalleNUMERO_APROBACION: TIBStringField;
    qryRepPgoDetalleDESCTIPOPAGOTARJETA: TSmallintField;
    qryRepPgoDetalleCODIGO_PROVEEDOR: TSmallintField;
    qryRepPgoDetalleDESCTARJETA: TIBStringField;
    qryRepPgoDetalleDESCPROVEEDORTARJETA: TIBStringField;
    qryRepPgoDetalleMontoCldo: TFloatField;
    qryRepPgoDetalleNUMERO: TFloatField;
    qryRepPgoDetalleNUMERO_FACT: TFloatField;
    qryRepPgoDetalleMONTO_FACT: TFloatField;
    qryRepPgoMaster: TIBQuery;
    qryRepPgoMasterNUMERO: TFloatField;
    qryRepPgoMasterNOMBRE_CTE: TIBStringField;
    qryRepPgoMasterCODIGO_CTE: TIntegerField;
    qryRepPgoMasterDESC_MONEDA: TIBStringField;
    qryRepPgoMasterFORMA_DE_PAGO: TIBStringField;
    qryRepPgoMasterFORMA_PAGO: TSmallintField;
    qryRepPgoMasterNOMBRE_EMPRESA: TIBStringField;
    qryRepPgoMasterFECHA: TDateTimeField;
    qryRepPgoMasterSIMBOLO_MONEDA: TIBStringField;
    qryRepPgoMasterNOMBRECLIENTECLD: TIBStringField;
    qryRepPgoMasterDIRECCION_LOCAL: TIBStringField;
    qryRepPgoMasterTELEFONO_LOCAL: TIBStringField;
    qryRepPgoMasterTELEF_CONTACTO: TIBStringField;
    qryBalanceProveedor: TIBDataSet;
    qryBalanceProveedorNombreCliente: TStringField;
    dsqryBalanceProveedor: TDataSource;
    qryBalanceProveedorCODIGO: TIntegerField;
    qryBalanceProveedorTIPO: TIntegerField;
    qryBalanceProveedorMONEDA: TIBStringField;
    qryBalanceProveedorBALANCE_ACT: TFloatField;
    qryBalanceProveedorBALANCE_ANT: TFloatField;
    qryBalanceProveedorDEBITO_MES: TFloatField;
    qryBalanceProveedorCREDITO_MES: TFloatField;
    qryBalanceProveedorDEBITO_ACM: TFloatField;
    qryBalanceProveedorCREDITO_ACM: TFloatField;
    qryBalanceProveedorFECHA_BCE: TDateTimeField;
    qryBalanceProveedorFECHA_ULT_PAGO: TDateTimeField;
    qryBalanceProveedorSTATUS_BCE: TIBStringField;
    qryBalanceProveedorFECHA_IN: TDateTimeField;
    qryBalanceProveedorIN_POR: TIBStringField;
    qryBalanceProveedorFECHA_MOD: TDateTimeField;
    qryBalanceProveedorMOD_POR: TIBStringField;
    qryproveedor: TIBQuery;
    qryproveedorCODIGO_CTE: TIntegerField;
    qryproveedorNOMBRE_EMPRESA: TIBStringField;
    qryproveedorTIPO_CLIENTE: TSmallintField;
    qryPagosCxpNUM_CHEQ_COMP: TIBStringField;
    qryPagosCxpCOD_BANCO: TIntegerField;
    tblBanco: TIBTable;
    dstblBanco: TDataSource;
    tblBancoCODIGO: TSmallintField;
    tblBancoDESCRIPCION: TIBStringField;
    tblBancoCODIGO_ABR: TIBStringField;
    qryRepPgoMasterCOD_BANCO: TIntegerField;
    qryRepPgoMasterNUM_CHEQ_COMP: TIBStringField;
    qryRepPgoMasterDESC_BANCO: TIBStringField;
    qryFactPendCxp: TIBQuery;
    dsqryFactPendCxp: TDataSource;
    qryFactPendCxpCODIGO_PROV: TIntegerField;
    qryFactPendCxpFECHA: TDateTimeField;
    qryFactPendCxpTIPO: TIntegerField;
    qryFactPendCxpNUMERO_FACT: TIntegerField;
    qryFactPendCxpMONEDA: TIBStringField;
    qryFactPendCxpMONTO_PENDIENTE: TFloatField;
    qryFactPendCxpSTATUS: TIBStringField;
    qryFactPendCxpDESCRIPCION: TIBStringField;
    qryFactPendCxpTELEFONO: TIBStringField;
    procedure qryRepPgoMasterAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCxp: TdmCxp;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdmCxp.qryRepPgoMasterAfterScroll(DataSet: TDataSet);
begin
  qryRepPgoDetalle.Close;
  qryRepPgoDetalle.Params[0].Value := qryRepPgoMasterNUMERO.Value;
  qryRepPgoDetalle.Open
end;

end.
