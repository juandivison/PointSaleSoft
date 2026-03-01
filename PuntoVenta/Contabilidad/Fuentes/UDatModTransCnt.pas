unit UDatModTransCnt;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBTable, RxMemDS, IBSQL;

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
    tblTransCntDetSERIE: TFloatField;
    tblTransCntDetNUMERO: TIntegerField;
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
    tblDeptos: TIBQuery;
    tblDeptosCODIGO: TSmallintField;
    tblDeptosNOMBRE: TIBStringField;
    tblCentroDeCosto: TIBQuery;
    tblCentroDeCostoCODIGO: TIntegerField;
    tblTipodoc: TIBQuery;
    tblTipodocCODIGO: TSmallintField;
    tblTipodocCODIGO_ABR: TIBStringField;
    tblTipodocDESCRIPCION: TIBStringField;
    tblTransCntDetCODIGO_DEPTO: TIntegerField;
    tblDepositoMaster: TIBDataSet;
    tblDepositoDet: TIBDataSet;
    tblDepositoMasterNUMERO: TIntegerField;
    tblDepositoMasterFECHA: TDateTimeField;
    tblDepositoMasterID_BANCO: TIntegerField;
    tblDepositoMasterMONTO: TFloatField;
    tblDepositoMasterDESCRIPCION: TIBStringField;
    tblDepositoMasterSTATUS: TIBStringField;
    tblDepositoMasterCOD_USUARIO: TIntegerField;
    tblDepositoMasterFECHA_IN: TDateTimeField;
    tblDepositoMasterIN_POR: TIBStringField;
    tblDepositoMasterFECHA_UPDATE: TDateTimeField;
    tblDepositoDetSERIE: TIntegerField;
    tblDepositoDetNUMERO: TIntegerField;
    tblDepositoDetTIPO_DEPOSITO: TIntegerField;
    tblDepositoDetNUMERO_DOCUMENTO: TIBStringField;
    tblDepositoDetDESCRIPCION: TIBStringField;
    tblDepositoDetMONTO_DEPOSITO: TIntegerField;
    tblDepositoDetSTATUS: TIBStringField;
    tblDepositoDetCOD_USUARIO: TIntegerField;
    tblDepositoDetFECHA_IN: TDateTimeField;
    tblDepositoDetIN_POR: TIBStringField;
    tblDepositoDetFECHA_UPDATE: TDateTimeField;
    tblTipoDeposito: TIBTable;
    tblTipoDepositoID_DEPOSITO: TIntegerField;
    tblTipoDepositoDESCRIPCION: TIBStringField;
    dstblTipoDeposito: TDataSource;
    dstblDepositoMaster: TDataSource;
    dstblDepositoDet: TDataSource;
    qryBancos: TIBQuery;
    dsqrybancos: TDataSource;
    qryBancosCta: TIBQuery;
    qryTipoCtaBanco: TIBQuery;
    dsqryBancosCta: TDataSource;
    dsqryTipoCtaBanco: TDataSource;
    qryBancosCODIGO: TSmallintField;
    qryBancosDESCRIPCION: TIBStringField;
    qryBancosCODIGO_ABR: TIBStringField;
    qryBancosCtaCODIGO: TSmallintField;
    qryBancosCtaTIPO: TIBStringField;
    qryBancosCtaCUENTA_BANCO: TIBStringField;
    tblDepositoMasterTIPO_CTA: TIntegerField;
    tblDepositoMasterCUENTA_BANCO: TIBStringField;
    qryTipoCtaBancoTIPOCTA: TIntegerField;
    qryTipoCtaBancoDESCRIPCION_CTA: TIBStringField;
    qryTipoCtaBancoID_BANCO: TSmallintField;
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
    tblTransCntMasterCIA_KEY: TIntegerField;
    tblCentroDeCostoNOMBRE: TIBStringField;
    tblCentroDeCostoCODDGII: TIntegerField;
    tblCentroDeCostoCUENTA_GASTO: TIBStringField;
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
    rxTotalTrnasDet: TRxMemoryData;
    rxTotalTrnasDetDebito: TCurrencyField;
    rxTotalTrnasDetCredito: TCurrencyField;
    rxTotalTrnasDetDiferencia: TCurrencyField;
    dsrxTotalTrnasDet: TDataSource;
    ibsqlSumadbcrTrnDet: TIBSQL;
    procedure tblTransCntDetBeforePost(DataSet: TDataSet);
    procedure tblTransCntMasterAfterScroll(DataSet: TDataSet);
    procedure tblDepositoMasterAfterScroll(DataSet: TDataSet);
    procedure qryBancosAfterScroll(DataSet: TDataSet);
    procedure qryBancosCtaAfterScroll(DataSet: TDataSet);
    procedure rxTotalesCalcFields(DataSet: TDataSet);
    procedure tblTransCntDetAfterPost(DataSet: TDataSet);
    procedure rxTotalTrnasDetCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    totalDet : Currency;
    procedure ProcSumar;
    //procedure SumaDetTransCnt;
    procedure ProcSumaDetTrnCnt;
  end;

var
  dmTransCnt: TdmTransCnt;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TdmTransCnt.tblTransCntDetBeforePost(DataSet: TDataSet);
begin
  tblTransCntDetNUMERO.Value:=tblTransCntMasterNUMERO.Value;
end;

procedure TdmTransCnt.tblTransCntMasterAfterScroll(DataSet: TDataSet);
begin
  if (tblTransCntDet.State in [dsInactive, dsBrowse]) then
  begin
    tblTransCntDet.Close;
    tblTransCntDet.Params[0].Value:= tblTransCntMasterNUMERO.Value;
    tblTransCntDet.Open;
  end;
  dmTransCnt.ProcSumaDetTrnCnt;
end;

procedure TdmTransCnt.tblDepositoMasterAfterScroll(DataSet: TDataSet);
begin
  if tblDepositoDet.State in [dsEdit, dsInsert] then exit; 
  tblDepositoDet.Close;
  tblDepositoDet.Params[0].Value:=tblDepositoMasterNUMERO.Value;
  tblDepositoDet.Open;
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

procedure TdmTransCnt.qryBancosAfterScroll(DataSet: TDataSet);
begin
  qryBancosCta.Close;
  qryBancosCta.Params[0].Value:=qryBancosCODIGO.Value;
  qryBancosCta.Open;
end;

procedure TdmTransCnt.qryBancosCtaAfterScroll(DataSet: TDataSet);
begin
  qryTipoCtaBanco.Close;
  qryTipoCtaBanco.Params[0].Value:= qryBancosCtaCODIGO.Value;
  qryTipoCtaBanco.Open;
end;

procedure TdmTransCnt.rxTotalesCalcFields(DataSet: TDataSet);
begin
  rxtotalesdiferencia.value := abs(rxtotalesdebito.value - rxtotalescredito.value);
end;

procedure TdmTransCnt.tblTransCntDetAfterPost(DataSet: TDataSet);
begin
  //SumaDetTransCnt;
end;
{
procedure TdmTransCnt.SumaDetTransCnt;
var
  Bookmark : TBookmark;
  _Debito, _Credito : Currency;
begin
  Bookmark := tblTransCntDet.GetBookmark;
  tblTransCntDet.First;
  _Debito:=0;
  _Credito:=0;
  While Not tblTransCntDet.Eof Do
  begin
    _debito := _debito + tblTransCntDetDEBITO_TRN.Value;
    _Credito:= _Credito+ tblTransCntDetCREDITO_TRN.Value;
    tblTransCntDet.Next;
  end;
  tblTransCntDet.GotoBookmark(Bookmark);
  tblTransCntDet.FreeBookmark(Bookmark);
  rxTotales.EmptyTable;
  rxTotales.Open;
  rxTotales.Insert;
  rxTotalesCredito.Value:=_Credito;
  rxTotalesDebito.Value:=_Debito;
  rxTotales.Post;
end; }

procedure TdmTransCnt.rxTotalTrnasDetCalcFields(DataSet: TDataSet);
begin
  rxTotalTrnasDetDiferencia.Value:=
  ABS(rxTotalTrnasDetDebito.Value - rxTotalTrnasDetCredito.Value);
  if (rxTotalTrnasDetDiferencia.Value > 0.009) then
  GlbTrnNoCuadra:=True else GlbTrnNoCuadra:=False;
end;

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

end.
