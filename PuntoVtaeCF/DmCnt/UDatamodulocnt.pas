unit UDatamodulocnt;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, RxMemDS, IBTable, IBQuery;

type
  TdmCnt = class(TDataModule)
    qryMastertrncnt: TIBDataSet;
    qryDetTrnCnt: TIBDataSet;
    dtqryDetTrnCnt: TDataSource;
    dtqryMastertrncnt: TDataSource;
    qryDetTrnCntSERIE: TFloatField;
    qryDetTrnCntNUMERO: TIntegerField;
    qryDetTrnCntCODIGO_DEPTO: TIntegerField;
    qryDetTrnCntDESCRIPCION_TRN: TIBStringField;
    qryDetTrnCntDEBITO_TRN: TFloatField;
    qryDetTrnCntCREDITO_TRN: TFloatField;
    qryDetTrnCntCUENTA1: TIBStringField;
    qryDetTrnCntCUENTA2: TIBStringField;
    qryDetTrnCntCUENTA3: TIBStringField;
    qryDetTrnCntSTATUS_APLICADA: TIBStringField;
    qryDetTrnCntSTATUS: TIBStringField;
    qryDetTrnCntIN_POR: TIBStringField;
    qryDetTrnCntFECHA_IN: TDateTimeField;
    qryDetTrnCntMOD_POR: TIBStringField;
    qryDetTrnCntFECHA_MOD: TDateTimeField;
    qryDetTrnCntNUM_DOC: TFloatField;
    qryDetTrnCntCOD_CTA_CONCEPTO: TIntegerField;
    qryDetTrnCntCODIGO_CENTRO_COSTO: TIntegerField;
    qryMastertrncntNUMERO: TIntegerField;
    qryMastertrncntFECHA: TDateTimeField;
    qryMastertrncntTIPO_DOC: TSmallintField;
    qryMastertrncntDESCRIPCION: TIBStringField;
    qryMastertrncntMONTO: TFloatField;
    qryMastertrncntSTATUS: TIBStringField;
    qryMastertrncntIN_POR: TIBStringField;
    qryMastertrncntFECHA_IN: TDateTimeField;
    qryMastertrncntMOD_POR: TIBStringField;
    qryMastertrncntFECHA_MOD: TDateTimeField;
    rxTotales: TRxMemoryData;
    rxTotalesrxBceAnt: TFloatField;
    rxTotalesrxBceAct: TFloatField;
    rxTotalesrxDbmes: TFloatField;
    rxTotalesrxCrmes: TFloatField;
    rxTotalesrxDbAcm: TFloatField;
    rxTotalesrxCrAcm: TFloatField;
    rxTotalesDiferencia: TFloatField;
    rxTotalesCredito: TFloatField;
    rxTotalesDebito: TFloatField;
    tblDistCntCheques: TIBTable;
    tblDistCntChequesMODULO: TIBStringField;
    tblDistCntChequesSIGNO: TSmallintField;
    tblDistCntChequesCUENTA_CNT: TIBStringField;
    tblDistCntChequesSTATUS: TIBStringField;
    tblDist_cntFacturas: TIBTable;
    tblDist_cntFacturasMODULO: TIBStringField;
    tblDist_cntFacturasAREA_CTA: TSmallintField;
    tblDist_cntFacturasCUENTA: TIBStringField;
    tblDist_cntFacturasCODIGO_PROV: TIntegerField;
    tblDist_cntFacturasSTATUS: TIBStringField;
    dstblDist_cntFacturas: TDataSource;
    qryProveedor: TIBQuery;
    qryProveedorCODIGO_CTE: TIntegerField;
    qryProveedorTIPO_CLIENTE: TIntegerField;
    qryProveedorNOMBRE_ABR: TIBStringField;
    qryProveedorDESCRIPCION: TIBStringField;
    qryProveedorCONTACTO: TIBStringField;
    qryProveedorPAIS: TIBStringField;
    qryProveedorESTADO: TIBStringField;
    qryProveedorCIUDAD: TIBStringField;
    qryProveedorCALYYNUM: TIBStringField;
    qryProveedorTELEFONO: TIBStringField;
    qryProveedorFAX: TIBStringField;
    qryProveedorCODIGOPOSTAL: TIBStringField;
    qryProveedorEMAIL: TIBStringField;
    qryProveedorDIRECCIONWEB: TIBStringField;
    qryProveedorSTATUS: TIBStringField;
    qryProveedorFECHA_IN: TDateTimeField;
    qryProveedorIN_POR: TIBStringField;
    qryProveedorFECHA_MOD: TDateTimeField;
    qryProveedorMOD_POR: TIBStringField;
    qryProveedorRNC_PROVEEDOR: TIBStringField;
    qryProveedorMOVIL1: TIBStringField;
    qryProveedorMOVIL2: TIBStringField;
    qryProveedorTELEFONO2: TIBStringField;
    qryProveedorTELEFONO3: TIBStringField;
    qryProveedorEXTENSIONES: TIBStringField;
    qryProveedorCIA_KEY: TIntegerField;
    qryProveedorTIPOCXP: TIntegerField;
    dsqryProveedor: TDataSource;
    rxTotal: TRxMemoryData;
    rxTotalMontoTotal: TCurrencyField;
    rxTotalMontoPosteoaCxp: TCurrencyField;
    dsrxTotal: TDataSource;
    qryMastertrncntCIA_KEY: TIntegerField;
    procedure qryMastertrncntAfterScroll(DataSet: TDataSet);
    procedure rxTotalesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCnt: TdmCnt;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TdmCnt.qryMastertrncntAfterScroll(DataSet: TDataSet);
begin
  qryDetTrnCnt.DisableControls;
  qryDetTrnCnt.close;
  qryDetTrnCnt.Params[0].Value := qrymastertrncntnumero.Value;
  qryDetTrnCnt.open;
  qryDetTrnCnt.EnableControls;
  VerificaValorTrn;
end;

procedure TdmCnt.rxTotalesCalcFields(DataSet: TDataSet);
begin
  rxtotalesdiferencia.Value := abs(rxtotalesdebito.Value - rxtotalescredito.Value);
end;

end.
