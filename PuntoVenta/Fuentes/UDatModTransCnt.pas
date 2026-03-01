unit UDatModTransCnt;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBSQL, RxMemDS, IBTable;

type
  TdmTransCnt = class(TDataModule)
    tblTransCntMaster: TIBDataSet;
    tblTransCntDet: TIBDataSet;
    tblTransCntMasterNUMERO: TIntegerField;
    tblTransCntMasterFECHA: TDateTimeField;
    tblTransCntMasterTIPO_DOC: TSmallintField;
    tblTransCntMasterDESCRIPCION: TIBStringField;
    tblTransCntMasterMONTO: TFloatField;
    tblTransCntMasterSTATUS: TIBStringField;
    tblTransCntMasterIN_POR: TIBStringField;
    tblTransCntMasterFECHA_IN: TDateTimeField;
    tblTransCntMasterMOD_POR: TIBStringField;
    tblTransCntMasterFECHA_MOD: TDateTimeField;
    tblDeptos: TIBQuery;
    tblDeptosCODIGO: TSmallintField;
    tblDeptosNOMBRE: TIBStringField;
    tblCentroDeCosto: TIBQuery;
    tblCentroDeCostoCODIGO: TIntegerField;
    tblCentroDeCostoDESCRIPCION: TIBStringField;
    tblTipodoc: TIBQuery;
    tblTipodocCODIGO: TSmallintField;
    tblTipodocCODIGO_ABR: TIBStringField;
    tblTipodocDESCRIPCION: TIBStringField;
    ibsqlUpdateStatusContrato: TIBSQL;
    tblTransCntDetSERIE: TFloatField;
    tblTransCntDetNUMERO: TIntegerField;
    tblTransCntDetCODIGO_DEPTO: TIntegerField;
    tblTransCntDetDESCRIPCION_TRN: TIBStringField;
    tblTransCntDetDEBITO_TRN: TFloatField;
    tblTransCntDetCREDITO_TRN: TFloatField;
    tblTransCntDetCUENTA1: TIBStringField;
    tblTransCntDetCUENTA2: TIBStringField;
    tblTransCntDetCUENTA3: TIBStringField;
    tblTransCntDetSTATUS_APLICADA: TIBStringField;
    tblTransCntDetSTATUS: TIBStringField;
    tblTransCntDetIN_POR: TIBStringField;
    tblTransCntDetFECHA_IN: TDateTimeField;
    tblTransCntDetMOD_POR: TIBStringField;
    tblTransCntDetFECHA_MOD: TDateTimeField;
    tblTransCntDetNUM_DOC: TFloatField;
    tblTransCntDetCOD_CTA_CONCEPTO: TIntegerField;
    tblTransCntDetCODIGO_CENTRO_COSTO: TIntegerField;
    tblTransCntMasterCIA_KEY: TIntegerField;
    dstblDepositoMaster: TDataSource;
    dstblDepositoDet: TDataSource;
    qryBancos: TIBQuery;
    qryBancosCODIGO: TSmallintField;
    qryBancosDESCRIPCION: TIBStringField;
    qryBancosCODIGO_ABR: TIBStringField;
    dsqrybancos: TDataSource;
    qryTipoCtaBanco: TIBQuery;
    qryTipoCtaBancoTIPOCTA: TIntegerField;
    qryTipoCtaBancoDESCRIPCION_CTA: TIBStringField;
    qryTipoCtaBancoID_BANCO: TSmallintField;
    dsqryTipoCtaBanco: TDataSource;
    ibsqlSumadbcrTrnDet: TIBSQL;
    tblTipoDeposito: TIBTable;
    tblTipoDepositoID_DEPOSITO: TIntegerField;
    tblTipoDepositoDESCRIPCION: TIBStringField;
    dstblTipoDeposito: TDataSource;
    qryBancosCta: TIBQuery;
    qryBancosCtaCODIGO: TSmallintField;
    qryBancosCtaTIPO: TIBStringField;
    qryBancosCtaCUENTA_BANCO: TIBStringField;
    dsqryBancosCta: TDataSource;
    rxTotalTrnasDet: TRxMemoryData;
    rxTotalTrnasDetDebito: TCurrencyField;
    rxTotalTrnasDetCredito: TCurrencyField;
    rxTotalTrnasDetDiferencia: TCurrencyField;
    dsrxTotalTrnasDet: TDataSource;
    tblDepositoMaster: TIBDataSet;
    tblDepositoMasterNUMERO: TIntegerField;
    tblDepositoMasterFECHA: TDateTimeField;
    tblDepositoMasterID_BANCO: TIntegerField;
    tblDepositoMasterTIPO_CTA: TIntegerField;
    tblDepositoMasterCUENTA_BANCO: TIBStringField;
    tblDepositoMasterMONTO: TFloatField;
    tblDepositoMasterDESCRIPCION: TIBStringField;
    tblDepositoMasterSTATUS: TIBStringField;
    tblDepositoMasterCOD_USUARIO: TIntegerField;
    tblDepositoMasterFECHA_IN: TDateTimeField;
    tblDepositoMasterIN_POR: TIBStringField;
    tblDepositoMasterFECHA_UPDATE: TDateTimeField;
    tblDepositoDet: TIBDataSet;
    tblDepositoDetSERIE: TIntegerField;
    tblDepositoDetNUMERO: TIntegerField;
    tblDepositoDetTIPO_DEPOSITO: TIntegerField;
    tblDepositoDetNUMERO_DOCUMENTO: TIBStringField;
    tblDepositoDetDESCRIPCION: TIBStringField;
    tblDepositoDetSTATUS: TIBStringField;
    tblDepositoDetCOD_USUARIO: TIntegerField;
    tblDepositoDetFECHA_IN: TDateTimeField;
    tblDepositoDetIN_POR: TIBStringField;
    tblDepositoDetFECHA_UPDATE: TDateTimeField;
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
    dtrxTotales: TDataSource;
    tblTipoCuentabco: TIBTable;
    tblTipoCuentabcoCODIGO: TIntegerField;
    tblTipoCuentabcoDESCRIPCION: TIBStringField;
    dbtblTipoCuentabco: TDataSource;
    tblDepDistBilletes: TIBDataSet;
    tblDepDistBilletesIDDEPOSITO: TIntegerField;
    tblDepDistBilletesCOD_EMPLEADO: TIntegerField;
    tblDepDistBilletesFECHA: TDateTimeField;
    tblDepDistBilletesMONTO_EN_CHEQUE: TFloatField;
    tblDepDistBilletesM2000: TIntegerField;
    tblDepDistBilletesM1000: TIntegerField;
    tblDepDistBilletesM500: TIntegerField;
    tblDepDistBilletesM200: TIntegerField;
    tblDepDistBilletesM100: TIntegerField;
    tblDepDistBilletesM50: TIntegerField;
    tblDepDistBilletesM25: TIntegerField;
    tblDepDistBilletesM20: TIntegerField;
    tblDepDistBilletesM10: TIntegerField;
    tblDepDistBilletesM5: TIntegerField;
    tblDepDistBilletesMONTO_MONEDAS: TFloatField;
    tblDepDistBilletesCOD_USUARIO: TIntegerField;
    tblDepDistBilletesSTATUS: TIBStringField;
    tblDepDistBilletesFECHA_IN: TDateTimeField;
    tblDepDistBilletesFECHA_UPDATE: TDateTimeField;
    tblDepositoMasterCIA_KEY: TIntegerField;
    tblDepositoDetMONTO_DEPOSITO: TFloatField;
    tblDistCashEnCaja: TIBDataSet;
    tblDistCashEnCajaID: TIntegerField;
    tblDistCashEnCajaCOD_EMPLEADO: TIntegerField;
    tblDistCashEnCajaFECHA: TDateTimeField;
    tblDistCashEnCajaMONTO_EN_CHEQUE: TFloatField;
    tblDistCashEnCajaM2000: TIntegerField;
    tblDistCashEnCajaM1000: TIntegerField;
    tblDistCashEnCajaM500: TIntegerField;
    tblDistCashEnCajaM200: TIntegerField;
    tblDistCashEnCajaM100: TIntegerField;
    tblDistCashEnCajaM50: TIntegerField;
    tblDistCashEnCajaM25: TIntegerField;
    tblDistCashEnCajaM20: TIntegerField;
    tblDistCashEnCajaM10: TIntegerField;
    tblDistCashEnCajaM5: TIntegerField;
    tblDistCashEnCajaMONTO_MONEDAS: TFloatField;
    tblDistCashEnCajaCOD_USUARIO: TIntegerField;
    tblDistCashEnCajaSTATUS: TIBStringField;
    tblDistCashEnCajaFECHA_IN: TDateTimeField;
    tblDistCashEnCajaFECHA_UPDATE: TDateTimeField;
    procedure tblTransCntDetBeforePost(DataSet: TDataSet);
    procedure tblTransCntMasterAfterScroll(DataSet: TDataSet);
    procedure tblDepositoMasterAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    totalDet : Currency;
    procedure ProcSumar;
    //procedure SumaDetTransCnt;
    procedure ProcSumaDetTrnCnt;
  end;

var
  dmTransCnt: TdmTransCnt;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdmTransCnt.ProcSumaDetTrnCnt;
begin
  if tblTransCntDet.State In [dsEdit, dsInsert] then exit;
  if (tblTransCntDetNUMERO.Value = 0) Or (
  tblTransCntDetNUMERO.IsNull) then Exit;
  if ibsqlSumadbcrTrnDet.Open then
  ibsqlSumadbcrTrnDet.Close;
  ibsqlSumadbcrTrnDet.params[0].Value:=tblTransCntDetNUMERO.Value;
  ibsqlSumadbcrTrnDet.ExecQuery;

  if ibsqlSumadbcrTrnDet.RecordCount = 1 then
  begin
    rxTotalTrnasDet.Close;
    rxTotalTrnasDet.Open;
    rxTotalTrnasDet.Insert;
    rxTotalTrnasDetDebito.Value:= ibsqlSumadbcrTrnDet.fieldbyname('debito').AsCurrency;
    rxTotalTrnasDetCredito.Value:=ibsqlSumadbcrTrnDet.fieldbyname('credito').AsCurrency;
    rxTotalTrnasDet.Post;
  end;
end;

procedure TdmTransCnt.ProcSumar;
var
  Bookmark : TBookmark;
begin
  Bookmark := tblDepositoDet.GetBookmark;
  tblDepositoDet.First;
  totalDet := 0;
  While Not tblDepositoDet.Eof Do
  begin
    totalDet := totalDet + tblDepositoDetMONTO_DEPOSITO.Value;
    tblDepositoDet.Next;
  end;
  tblDepositoDet.GotoBookmark(Bookmark);
  tblDepositoDet.FreeBookmark(Bookmark);
end;

procedure TdmTransCnt.tblTransCntDetBeforePost(DataSet: TDataSet);
begin
  tblTransCntDetNUMERO.Value:=tblTransCntMasterNUMERO.Value;
end;

procedure TdmTransCnt.tblTransCntMasterAfterScroll(DataSet: TDataSet);
begin
  tblTransCntDet.Close;
  tblTransCntDet.Params[0].Value:= tblTransCntMasterNUMERO.Value;
  tblTransCntDet.Open;
end;

procedure TdmTransCnt.tblDepositoMasterAfterScroll(DataSet: TDataSet);
begin
  tblDepositoDet.Close;
  tblDepositoDet.params[0].Value:= tblDepositoMasterNUMERO.Value;
  tblDepositoDet.Open;

  qryTipoCtaBanco.Close;
  qryTipoCtaBanco.params[0].Value:= tblDepositoMasterID_BANCO.Value;
  qryTipoCtaBanco.Open;

  qryBancosCta.Close;
  qryBancosCta.params[0].Value:= tblDepositoMasterID_BANCO.Value;
  qryBancosCta.Open;
end;

end.
