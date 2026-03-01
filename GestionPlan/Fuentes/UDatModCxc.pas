unit UDatModCxc;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBSQL, IBQuery, RxMemDS, dialogs,
  IBStoredProc;

type
  TdmCxc = class(TDataModule)
    qryTrancxc: TIBDataSet;
    dstblTransCxc: TDataSource;
    qryTrancxcSERIE: TFloatField;
    qryTrancxcTIPO_DOC: TIntegerField;
    qryTrancxcMONEDA: TIBStringField;
    qryTrancxcFECHA: TDateTimeField;
    qryTrancxcNUMERO_DOC: TIntegerField;
    qryTrancxcCODIGO_CLIENTE: TIntegerField;
    qryTrancxcCODIGO_SERV: TIntegerField;
    qryTrancxcCONCEPTO: TIBStringField;
    qryTrancxcVALOR_DOCUMENTO: TFloatField;
    qryTrancxcTIPO_TRANF: TSmallintField;
    qryTrancxcSTATUS: TIBStringField;
    qryTrancxcTIPO_SERV: TIntegerField;
    qryTrancxcFECHA_IN: TDateTimeField;
    qryTrancxcIN_POR: TIBStringField;
    qryTrancxcFECHA_MOD: TDateTimeField;
    qryTrancxcMOD_POR: TIBStringField;
    qryProcServ: TIBDataSet;
    dsqryProcServ: TDataSource;
    qryBalanceCtes: TIBDataSet;
    DataSource1: TDataSource;
    qryProcServSERIE: TFloatField;
    qryProcServTIPO_DOC: TIntegerField;
    qryProcServMONEDA: TIBStringField;
    qryProcServFECHA: TDateTimeField;
    qryProcServNUMERO_DOC: TIntegerField;
    qryProcServCODIGO_CLIENTE: TIntegerField;
    qryProcServCODIGO_SERV: TIntegerField;
    qryProcServCONCEPTO: TIBStringField;
    qryProcServVALOR_DOCUMENTO: TFloatField;
    qryProcServTIPO_TRANF: TSmallintField;
    qryProcServSTATUS: TIBStringField;
    qryProcServTIPO_SERV: TIntegerField;
    qryBalanceCtesCODIGO: TIntegerField;
    qryBalanceCtesSERVICIO: TIntegerField;
    qryBalanceCtesMONEDA: TIBStringField;
    qryBalanceCtesCTA1_BCE: TIBStringField;
    qryBalanceCtesCTA2_BCE: TIBStringField;
    qryBalanceCtesCTA3_BCE: TIBStringField;
    qryBalanceCtesBALANCE_ACT: TFloatField;
    qryBalanceCtesBALANCE_ANT: TFloatField;
    qryBalanceCtesDEBITO_MES: TFloatField;
    qryBalanceCtesCREDITO_MES: TFloatField;
    qryBalanceCtesDEBITO_ACM: TFloatField;
    qryBalanceCtesCREDITO_ACM: TFloatField;
    qryBalanceCtesFECHA_BCE: TDateTimeField;
    qryBalanceCtesFECHA_ULT_PAGO: TDateTimeField;
    qryBalanceCtesSTATUS_BCE: TIBStringField;
    qryBalanceCtesFECHA_IN: TDateTimeField;
    qryBalanceCtesIN_POR: TIBStringField;
    qryBalanceCtesFECHA_MOD: TDateTimeField;
    qryBalanceCtesMOD_POR: TIBStringField;
    tblTipoServ: TIBTable;
    tblServicio: TIBTable;
    tblClientes: TIBTable;
    qryBlceCteSQL: TIBSQL;
    qrybceHistCte: TIBQuery;
    qryRepServ: TIBQuery;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1TipoDoc: TIntegerField;
    qrybceHistCteCODIGO: TIntegerField;
    qrybceHistCteSERVICIO: TIntegerField;
    qrybceHistCteFECHA_HISTORICO: TDateTimeField;
    qrybceHistCteMONEDA: TIBStringField;
    qrybceHistCteBALANCE_ACT: TFloatField;
    qrybceHistCteBALANCE_ANT: TFloatField;
    qrybceHistCteDEBITO_MES: TFloatField;
    qrybceHistCteCREDITO_MES: TFloatField;
    qrybceHistCteDEBITO_ACM: TFloatField;
    qrybceHistCteCREDITO_ACM: TFloatField;
    qrybceHistCteSTATUS: TIBStringField;
    qryProcServBalance_Act: TFloatField;
    qrybceHistCteMES: TIntegerField;
    qrybceHistCteNombreCliente: TStringField;
    qryBalanceCtesNombreCliente: TStringField;
    tblTipoTrnDoc: TIBTable;
    tblTipoTrnDocCODIGO: TSmallintField;
    tblTipoTrnDocCODIGO_ABR: TIBStringField;
    tblTipoTrnDocDESCRIPCION: TIBStringField;
    qryProcServNOMBRE_FACTURAR: TIBStringField;
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
    qryRepServORIGEN: TIntegerField;
    qryRepServVALOR_INGRESO_RECIBO: TFloatField;
    qryRepServDIRECCION_CONT: TIBStringField;
    qryRepServFAX_CONTACTO: TIBStringField;
    qryRepServWEBSITE: TIBStringField;
    qryRepServPAIS: TIBStringField;
    qryRepServCIUDAD: TIBStringField;
    qryRepServTIPO_DOC: TSmallintField;
    qrybceHistCteNuevo: TIBSQL;
    qryRepServDEBITO: TFloatField;
    qryRepServCREDITO: TFloatField;
    qrySQLBlceAntCxcCte: TIBSQL;
    qryTipoMvtoCxc: TIBSQL;
    qryTrancxcNUMERO_TRN_VENTA: TIntegerField;
    StpProcInsRecTrnCxc: TIBSQL;
    StpProcNombyBlcCte: TIBSQL;
    StpProcActBlceCteyTrncxcStatus: TIBSQL;
    qryTrancxcCODIGO_VENDEDOR: TIntegerField;
    tblTransCxc: TIBDataSet;
    tblTransCxcSERIE: TFloatField;
    tblTransCxcTIPO_DOC: TIntegerField;
    tblTransCxcMONEDA: TIBStringField;
    tblTransCxcFECHA: TDateTimeField;
    tblTransCxcNUMERO_DOC: TIntegerField;
    tblTransCxcCODIGO_CLIENTE: TIntegerField;
    tblTransCxcCODIGO_SERV: TIntegerField;
    tblTransCxcCONCEPTO: TIBStringField;
    tblTransCxcVALOR_DOCUMENTO: TFloatField;
    tblTransCxcTIPO_TRANF: TSmallintField;
    tblTransCxcSTATUS: TIBStringField;
    tblTransCxcTIPO_SERV: TIntegerField;
    tblTransCxcCAMPOCODIGOSERVAUXI: TIntegerField;
    tblTransCxcFECHA_IN: TDateTimeField;
    tblTransCxcIN_POR: TIBStringField;
    tblTransCxcFECHA_MOD: TDateTimeField;
    tblTransCxcMOD_POR: TIBStringField;
    tblTransCxcNUMERO_TRN_VENTA: TIntegerField;
    tblTransCxcCODIGO_VENDEDOR: TIntegerField;
    qryBalanceProv: TIBDataSet;
    qryBalanceProvCODIGO: TIntegerField;
    qryBalanceProvTIPO: TIntegerField;
    qryBalanceProvMONEDA: TIBStringField;
    qryBalanceProvBALANCE_ACT: TFloatField;
    qryBalanceProvBALANCE_ANT: TFloatField;
    qryBalanceProvDEBITO_MES: TFloatField;
    qryBalanceProvCREDITO_MES: TFloatField;
    qryBalanceProvDEBITO_ACM: TFloatField;
    qryBalanceProvCREDITO_ACM: TFloatField;
    qryBalanceProvFECHA_BCE: TDateTimeField;
    qryBalanceProvFECHA_ULT_PAGO: TDateTimeField;
    qryBalanceProvSTATUS_BCE: TIBStringField;
    qryBalanceProvFECHA_IN: TDateTimeField;
    qryBalanceProvIN_POR: TIBStringField;
    qryBalanceProvFECHA_MOD: TDateTimeField;
    qryBalanceProvMOD_POR: TIBStringField;
    qryBalanceProvCODIGO_USUARIO: TIntegerField;
    qryBalanceProvDESCRIPCION: TIBStringField;
    qryBalanceProvTIPO_CLIENTE: TIntegerField;
    qryBalanceProvTELEFONO: TIBStringField;
    qryBalanceProvFAX: TIBStringField;
    qryClientes: TIBQuery;
    tMoneda: TIBTable;
    dstMoneda: TDataSource;
    qryTipoMvtoIngreso: TIBSQL;
    stpFechaIniBceHist: TIBStoredProc;
    qryRepServAREA: TIBStringField;
    transCxcNotaCredito: TIBDataSet;
    transCxcNotaDebito: TIBDataSet;
    transCxcNotaCreditoSERIE: TIntegerField;
    transCxcNotaCreditoNUM_DOC: TIntegerField;
    transCxcNotaCreditoNUMERO_FACT: TIntegerField;
    transCxcNotaDebitoSERIE: TIntegerField;
    transCxcNotaDebitoNUM_DOC: TIntegerField;
    transCxcNotaDebitoNUMERO_FACT: TIntegerField;
    qryRepTransCxcNDB_NCR: TIBQuery;
    qryRepTransCxcNDB_NCRSERIE: TFloatField;
    qryRepTransCxcNDB_NCRNUM_DOC: TIntegerField;
    qryRepTransCxcNDB_NCRNUMERO_FACT: TIntegerField;
    qryRepTransCxcNDB_NCRSERIE_NCF_ASIGNADO: TIntegerField;
    qryRepTransCxcNDB_NCRDESCRIPCION: TIBStringField;
    qryRepTransCxcNDB_NCRTIPO_DOC: TIntegerField;
    qryRepTransCxcNDB_NCRMONEDA: TIBStringField;
    qryRepTransCxcNDB_NCRFECHA: TDateTimeField;
    qryRepTransCxcNDB_NCRNUMERO_DOC: TIntegerField;
    qryRepTransCxcNDB_NCRCODIGO_CLIENTE: TIntegerField;
    qryRepTransCxcNDB_NCRCONCEPTO: TIBStringField;
    qryRepTransCxcNDB_NCRVALOR_DOCUMENTO: TFloatField;
    qryRepTransCxcNDB_NCRTIPO_TRANF: TSmallintField;
    qryRepTransCxcNDB_NCRSTATUS: TIBStringField;
    qryRepTransCxcNDB_NCRNUMERO_TRN_VENTA: TIntegerField;
    qryRepTransCxcNDB_NCRCODIGO_VENDEDOR: TIntegerField;
    qryRepTransCxcNDB_NCRNUMERO_NCF: TIBStringField;
    qryRepTransCxcNDB_NCRNOMBRE_CTE: TIBStringField;
    qryRepTransCxcNDB_NCRDIRECCION_CONT: TIBStringField;
    qryRepTransCxcNDB_NCRTELEF_CONTACTO: TIBStringField;
    qryRepTransCxcNDB_NCRRNC_NUMERO: TIBStringField;
    transCxcNotaCreditoSERIE_NCF_ASIGNADO: TIntegerField;
    transCxcNotaDebitoSERIE_NCF_ASIGNADO: TIntegerField;
    qryRepTransCxcNDB_NCRDESCNCF: TIBStringField;
    qryTrancxcNUMERO_RECIBO: TIntegerField;
    dsqryClientes: TDataSource;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesNOMBRE_EMPRESA: TIBStringField;
    qryClientesTIPO_CLIENTE: TSmallintField;
    qryFactPendientes: TIBQuery;
    qryTipoMvtoIngresoCuadre: TIBSQL;
    rxTranCnt: TRxMemoryData;
    rxTranCntrxCuenta1: TStringField;
    rxTranCntrxCuenta2: TStringField;
    rxTranCntrxCuenta3: TStringField;
    rxTranCntrxCodDepto: TStringField;
    rxTranCntrxFecha: TDateField;
    rxTranCntrxDescripcion: TStringField;
    rxTranCntrxDebito: TFloatField;
    rxTranCntrxCredito: TFloatField;
    rxTranCntNombreCuenta: TStringField;
    rxTranCntrxCuenta: TStringField;
    rxTranCntrxCodCte: TIntegerField;
    rxTranCntrxNumFact: TIntegerField;
    rxTranCntrxDepartamento: TIntegerField;
    rxTranCntDESCSERV: TStringField;
    rxTranCntCUENTA123: TStringField;
    rxTranCntCentroCosto: TIntegerField;
    tDocTranCxc: TIBTable;
    dstDocTranCxc: TDataSource;
    tCtaTipocntd: TIBTable;
    tCtaTipocntdCODIGO: TIntegerField;
    tCtaTipocntdDESCRIPCION: TIBStringField;
    dtRxTranCnt: TDataSource;
    rxTranCntSerieCampoClave: TIntegerField;
    qryDistStatusCnt: TIBQuery;
    qryDistStatusCntSERIE: TIntegerField;
    qryDistStatusCntNOMBRE_CAMPO_ORIGEN: TIBStringField;
    qryDistStatusCntNOMBRE_CAMPO_DESTINO: TIBStringField;
    qryDistStatusCntNOMBRE_TABLA_DESTINO: TIBStringField;
    qryDistStatusCntVALOR_DESTINO: TIBStringField;
    qryDistStatusCntMODULO_CNT: TIntegerField;
    rxTranCntSERIE: TStringField;
    qryUpdateDistrCnt: TIBSQL;
    qryFactPendientesTIPO: TIntegerField;
    qryFactPendientesMONEDA: TIBStringField;
    qryFactPendientesNUMERO_FACT: TIntegerField;
    qryFactPendientesMONTO_PENDIENTE: TFloatField;
    qryFactPendientesSTATUS: TIBStringField;
    qryFactPendientesIN_POR: TIBStringField;
    qryFactPendientesFECHA_MOD: TDateTimeField;
    qryFactPendientesMOD_POR: TIBStringField;
    qryFactPendientesNOMBRE_CTE: TIBStringField;
    qryFactPendientesNOMBRE_FACTURAR: TIBStringField;
    qryFactPendientesDIRECCION_CONT: TIBStringField;
    qryFactPendientesTELEF_CONTACTO: TIBStringField;
    qryFactPendientesCODIGO_CTE: TIntegerField;
    qryFactPendientesFECHA: TDateTimeField;
    qryFactPendientesDESCRIPCION: TIBStringField;
    procedure qryRepServCalcFields(DataSet: TDataSet);
    procedure qrybceHistCteCalcFields(DataSet: TDataSet);
    procedure qryTrancxcFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryProcServFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure rxTranCntCalcFields(DataSet: TDataSet);
    procedure qryFactPendientesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    fDesc : String;
  end;

var
  dmCxc: TdmCxc;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TdmCxc.qryRepServCalcFields(DataSet: TDataSet);
begin
  qryRepServBalance_Ant.Value :=GlbBalanceAnt
end;

procedure TdmCxc.qrybceHistCteCalcFields(DataSet: TDataSet);
begin
  qrybceHistCteMES.Value:= StrToInt(FormatDateTime('mm',qrybceHistCteFECHA_HISTORICO.Value));
end;

procedure TdmCxc.qryTrancxcFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Dataset.FieldByName('status').FieldName = GlbNombreCampo then
  begin
    Accept := (DataSet[GlbNombreCampo] = GlbCampoStr);
  end else
  Accept := (DataSet[GlbNombreCampo] = GlbCampoInt);
end;

procedure TdmCxc.qryProcServFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Dataset.FieldByName('status').FieldName = GlbNombreCampo then
  begin
    Accept := (DataSet[GlbNombreCampo] = GlbCampoStr);
  end else
  Accept := (DataSet[GlbNombreCampo] = GlbCampoInt);
end;
procedure TdmCxc.rxTranCntCalcFields(DataSet: TDataSet);
begin
  if CtaExiste(rxTrancntrxCUENTA1.Value,
               rxTrancntrxCUENTA2.Value,
               rxTrancntrxCUENTA3.Value,false) then
  dmcxc.rxTranCntNombreCuenta.Value := glbNombreCta;
  dmcxc.rxTranCntrxCuenta.Value:=
  dmcxc.rxTranCntrxCuenta1.Value+dmcxc.rxTranCntrxCuenta2.Value+
  dmcxc.rxTranCntrxCuenta3.Value;
end;

procedure TdmCxc.qryFactPendientesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := DataSet['Descripcion']= fDesc;
end;

end.
