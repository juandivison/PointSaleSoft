unit UDmRep;

interface

uses
  SysUtils, Classes, DB, RxMemDS, IBCustomDataSet, IBQuery, variants,
  RxQuery, IBTable;

type
  Tdtmodrep = class(TDataModule)
    rxBalance: TRxMemoryData;
    rxBalanceCUENTA1_BLC: TStringField;
    rxBalanceCUENTA2_BLC: TStringField;
    rxBalanceCUENTA3_BLC: TStringField;
    rxBalanceMES_BALANCE: TDateTimeField;
    rxBalanceBALANCE_ACT: TFloatField;
    rxBalanceBALANCE_CR: TFloatField;
    rxBalanceBALANCE_ANT: TFloatField;
    rxBalanceDEBITO: TFloatField;
    rxBalanceCREDITO: TFloatField;
    rxBalanceFECHA_IN: TDateTimeField;
    rxBalanceNOMBRE_CTA: TStringField;
    qryEGyP: TIBQuery;
    qryEGyPFECHA_ACT: TDateTimeField;
    qryEGyPCUENTA1: TIBStringField;
    qryEGyPCUENTA2: TIBStringField;
    qryEGyPCUENTA3: TIBStringField;
    qryEGyPNIVEL_CTA: TSmallintField;
    qryEGyPTIPO_CTA: TIBStringField;
    qryEGyPSIGNO_CTA: TSmallintField;
    qryEGyPCREDITO: TFloatField;
    qryEGyPDEBITO: TFloatField;
    qryEGyPBALANCE_ACT: TFloatField;
    qryEGyPBALANCE_ANT: TFloatField;
    qryEGyPResultadoDb: TFloatField;
    qryEGyPResultadoCR: TFloatField;
    qryEGyPResultado: TCurrencyField;
    qryEGyPDB_Acum: TCurrencyField;
    qryEGyPCr_Acm: TCurrencyField;
    qryEGyPVALORC: TCurrencyField;
    qryEGyPVALORD: TCurrencyField;
    qryEGyPCUENTA: TIntegerField;
    qryRepDepositos: TIBQuery;
    qryRepDepositosDet: TIBQuery;
    qryRepDepositosDESCRIPCION: TIBStringField;
    qryRepDepositosNUMERO: TIntegerField;
    qryRepDepositosFECHA: TDateTimeField;
    qryRepDepositosID_BANCO: TIntegerField;
    qryRepDepositosMONTO: TFloatField;
    qryRepDepositosSTATUS: TIBStringField;
    qryRepDepositosCOD_USUARIO: TIntegerField;
    qryRepDepositosFECHA_IN: TDateTimeField;
    qryRepDepositosIN_POR: TIBStringField;
    qryRepDepositosFECHA_UPDATE: TDateTimeField;
    qryRepDepositosTIPO_CTA: TIntegerField;
    qryRepDepositosCUENTA_BANCO: TIBStringField;
    qryRepDepositosDESC_BANCO: TIBStringField;
    qryRepDepositosDetDESC_TIPO_DEPOSITO: TIBStringField;
    qryRepDepositosDetSERIE: TIntegerField;
    qryRepDepositosDetNUMERO: TIntegerField;
    qryRepDepositosDetTIPO_DEPOSITO: TIntegerField;
    qryRepDepositosDetNUMERO_DOCUMENTO: TIBStringField;
    qryRepDepositosDetDESCRIPCION: TIBStringField;
    qryRepDepositosDetMONTO_DEPOSITO: TIntegerField;
    qryRepDepositosDetSTATUS: TIBStringField;
    qryRepDepositosDetCOD_USUARIO: TIntegerField;
    qryRepDepositosDetFECHA_IN: TDateTimeField;
    qryRepDepositosDetIN_POR: TIBStringField;
    qryRepDepositosDetFECHA_UPDATE: TDateTimeField;
    qryRepDepositosDESC_TIPO_CTA: TIBStringField;
    qryRepMayorGen: TIBQuery;
    qryRepMayorGenDet: TIBQuery;
    dtqryRepMayorGen: TDataSource;
    qryRepMayorGenCUENTA1: TIBStringField;
    qryRepMayorGenCUENTA2: TIBStringField;
    qryRepMayorGenCUENTA3: TIBStringField;
    qryRepMayorGenSIGNO_CTA: TSmallintField;
    qryRepMayorGenFECHA_BLC: TDateTimeField;
    qryRepMayorGenBALANCE_ACT: TFloatField;
    qryRepMayorGenBALANCE_ANT: TFloatField;
    qryRepMayorGenDEBITO_CLD: TFloatField;
    qryRepMayorGenCREDITO_CLD: TFloatField;
    qryRepMayorGenBLC_INI_CLD: TFloatField;
    qryRepMayorGenResultadoCldDB: TFloatField;
    qryRepMayorGenResultadoCldCR: TFloatField;
    qryTotalDbcr: TIBQuery;
    qryTotalDbcrDB: TFloatField;
    qryTotalDbcrCR: TFloatField;
    qryTotalDbcrCUENTA1: TIBStringField;
    qryTotalDbcrCUENTA2: TIBStringField;
    qryTotalDbcrCUENTA3: TIBStringField;
    sqlScripBlcCompOLD: TSQLScript;
    sqlScripMayorGeneralOLD: TSQLScript;
    sqlscripfactOLD: TSQLScript;
    qryRepOrdCompDeptoSQLScriptOLD: TSQLScript;
    qryRepOrdCompDeptoSQLScript_0: TIBQuery;
    qryRepOrdCompDeptoSQLScript_1: TIBQuery;
    qryRepOrdCompDeptoSQLScript_2: TIBQuery;
    qryRepOrdCompDeptoSQLScript_3: TIBQuery;
    sqlScripMayorGeneral_0: TIBQuery;
    sqlScripMayorGeneral_1: TIBQuery;
    qryRepMayorGenDetTIPO_DOC: TSmallintField;
    qryRepMayorGenDetNUM_DOC: TFloatField;
    qryRepMayorGenDetFECHA: TDateTimeField;
    qryRepMayorGenDetNUMERO: TIntegerField;
    qryRepMayorGenDetSERIE: TFloatField;
    qryRepMayorGenDetDESCRIPCION_TRN: TIBStringField;
    qryRepMayorGenDetDEBITO_TRN: TFloatField;
    qryRepMayorGenDetCREDITO_TRN: TFloatField;
    qryRepMayorGenDetSTATUS: TIBStringField;
    qryRepMayorGenDetCOD_CTA_CONCEPTO: TIntegerField;
    qryRepMayorGenDetCODIGO_DEPTO: TIntegerField;
    qryRepMayorGenDetDESC_DEPTO: TIBStringField;
    qryRepMayorGenDetCONCEPTODESCRIPCION: TIBStringField;
    qryRepMayorGenDetBalanceActualDb: TFloatField;
    qryRepMayorGenDetBalanceActualCR: TFloatField;
    qryRepMayorGenDetDB_CLD: TFloatField;
    qryRepMayorGenDetCR_CLD: TFloatField;
    tClase_cuentas_adm: TIBTable;
    tClase_cuentas_admCODIGO: TIntegerField;
    tClase_cuentas_admCUENTA1: TIntegerField;
    tClase_cuentas_admCUENTA2: TIntegerField;
    tClase_cuentas_admCUENTA3: TIntegerField;
    tClase_cuentas_admNOMBRE: TIBStringField;
    tClase_cuentas_admCODDGII: TIntegerField;
    tClase_cuentas_admCODIGO_CLASE: TIntegerField;
    qryRepTrnDiariaCnt: TIBQuery;
    qryRepTrnDiariaCntR: TIBQuery;
    dtqryRepMayorGenDet: TDataSource;
    dtqryTotalDbcr: TDataSource;
    qryblcComp: TIBQuery;
    rxBalanceComp: TRxMemoryData;
    rxBalanceCompCUENTA1: TStringField;
    rxBalanceCompCUENTA2: TStringField;
    rxBalanceCompCUENTA3: TStringField;
    rxBalanceCompNIVEL: TIntegerField;
    rxBalanceCompSIGNO: TIntegerField;
    rxBalanceCompNOMBRE: TStringField;
    rxBalanceCompDEBITO: TFloatField;
    rxBalanceCompCREDITO: TFloatField;
    rxBalanceCompTIPO: TStringField;
    sqlScriptBlcComp_0: TIBQuery;
    sqlScriptBlcComp_1: TIBQuery;
    qryblcCompCUENTA1: TIBStringField;
    qryblcCompCUENTA2: TIBStringField;
    qryblcCompCUENTA3: TIBStringField;
    qryblcCompNIVEL_CTA: TSmallintField;
    qryblcCompTIPO_CTA: TIBStringField;
    qryblcCompSIGNO_CTA: TSmallintField;
    qryblcCompBALANCE_ACT: TFloatField;
    qryblcCompBALANCE_ANT: TFloatField;
    qryblcCompDEBITO_ACT: TFloatField;
    qryblcCompCREDITO_ACT: TFloatField;
    qryblcCompFECHA_ACT: TDateTimeField;
    dtrxBalanceComp: TDataSource;
    qryEGyPNOMBRE_CTA: TIBStringField;
    qryRepMayorGenDetDESCRIPCION: TIBStringField;
    qryRepMayorGenNOMBRE_CTA: TIBStringField;
    qryblcCompNOMBRE_CTA: TIBStringField;
    qryBlcLivecomp: TIBQuery;
    qryBlcLivecompCUENTA1: TIBStringField;
    qryBlcLivecompCUENTA2: TIBStringField;
    qryBlcLivecompCUENTA3: TIBStringField;
    qryBlcLivecompNOMBRE_CTA: TIBStringField;
    qryBlcLivecompNIVEL_CTA: TSmallintField;
    qryBlcLivecompTIPO_CTA: TIBStringField;
    qryBlcLivecompSIGNO_CTA: TSmallintField;
    qryBlcLivecompFECHA_ACT: TDateTimeField;
    qryBlcLivecompBALANCE_ACT: TFloatField;
    qryBlcLivecompBALANCE_ANT: TFloatField;
    qryBlcLivecompDEBITO_ACT: TFloatField;
    qryBlcLivecompCREDITO_ACT: TFloatField;
    qryBlcLivecompDEBITO_TRN: TFloatField;
    qryBlcLivecompCREDITO_TRN: TFloatField;
    procedure rxBalanceCalcFields(DataSet: TDataSet);
    procedure qryEGyPCalcFields(DataSet: TDataSet);
    procedure qryRepDepositosAfterScroll(DataSet: TDataSet);
    procedure qryRepMayorGenCalcFields(DataSet: TDataSet);
    procedure qryRepMayorGenAfterScroll(DataSet: TDataSet);
    procedure qryRepMayorGenDetCalcFields(DataSet: TDataSet);
    procedure qryRepMayorGenFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryblcCompFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
    procedure AsignaDbCr(ValorCta:Real;CreditoCta:Real;DebitoCta:Real);

  public
    { Public declarations }
    ProcResumen : Boolean;
    cI1 : string;
    cI2 : string;
    cI3 : string;
    FnivelCta : String;
    FTipoCta : String;
  end;

var
  dtmodrep: Tdtmodrep;

implementation
uses uglobal, UDatModConectar;
{$R *.dfm}

procedure Tdtmodrep.rxBalanceCalcFields(DataSet: TDataSet);
begin
  if (Not dtmodrep.rxBalanceCUENTA1_BLC.IsNull) and
     (Not dtmodrep.rxBalanceCUENTA2_BLC.IsNull) and
     (Not dtmodrep.rxBalanceCUENTA3_BLC.IsNull) then
  begin
  if not CtaExiste(dtmodrep.rxBalanceCUENTA1_BLC.value,
                   dtmodrep.rxBalanceCUENTA2_BLC.value,
                   dtmodrep.rxBalanceCUENTA3_BLC.value,true) then
  begin
    rxbalancenombre_cta.Value:='????????';
  end else
  rxbalancenombre_cta.Value:=glbNombreCta;
  end;
end;

procedure Tdtmodrep.qryEGyPCalcFields(DataSet: TDataSet);
begin
  if qryEgyp.Active then  
  Begin
    if Boo_auxiglb then //mensual
    AsignaDbCr(0, qryEgypCREDITO.Value,qryEgypDEBITO.Value)
    else
    AsignaDbCr(qryEGyPBALANCE_ACT.value,0,0);
//  aqui

//  aqui
  if qryEGyPVALORC.Value <> 0 then
  qryegyPRESULTADO.Value:=qryEgypVALORC.Value*-1 else
  qryegyPRESULTADO.Value:= qryegypVALORD.Value;
  end;
  qryEGyPCUENTA.AsString:= qryEGyPCUENTA1.Value+
  qryEGyPCUENTA2.Value+qryEGyPCUENTA3.Value;
  if qryegyPRESULTADO.Value < 0 then
  qryEGyPResultadoCR.Value:= qryegyPRESULTADO.Value
  else qryEGyPResultadoDB.Value:= qryegyPRESULTADO.Value; 
end;

procedure Tdtmodrep.AsignaDbCr(ValorCta, CreditoCta, DebitoCta: Real);
var 
x : Real;
begin
  if ValorCta <> 0 then
  begin
    if qryegypsigno_cta.Value = 1 then //DB
    begin
      if qryEGyPBALANCE_ACT.value > 0 then
         QRYeGYPVALORD.Value := qryEGyPBALANCE_ACT.value
      else
         QRYeGYPVALORC.Value := Abs(qryEGyPBALANCE_ACT.value);
    end else
    if qryegypsigno_cta.Value = 2 then //CR
    begin
      if qryEGyPBALANCE_ACT.value > 0 then
         QRYeGYPVALORC.Value := qryEGyPBALANCE_ACT.value
      else
        QRYeGYPVALORD.Value := Abs(qryEGyPBALANCE_ACT.value);
    end;
  end else
  begin
    if (qryEgypCREDITO.Value <> 0) or (qryEgypDEBITO.Value <> 0) then
    begin
      x:= QRYeGYPdebito.Value - QRYeGYPcredito.value;
      if x > 0 then
      Begin
        QRYeGYPVALORD.Value := x;
        QRYeGYPVALORC.Value := 0;
      end
      else
      begin
        QRYeGYPVALORC.Value := abs(x);
        QRYeGYPVALORD.Value := 0;
      end;
    end;
  end;
end;

procedure Tdtmodrep.qryRepDepositosAfterScroll(DataSet: TDataSet);
begin
  qryRepDepositosDet.Close;
  qryRepDepositosDet.Params[0].Value:= dtmodrep.qryRepDepositosNUMERO.Value;
  qryRepDepositosDet.Open;
end;

procedure Tdtmodrep.qryRepMayorGenCalcFields(DataSet: TDataSet);
begin
  if qryRepMayorGenSIGNO_CTA.value = 1 then // Db
  begin
    if qryRepMayorGenBALANCE_ANT.Value > 0 then
    qryRepMayorGenDEBITO_CLD.value := qryRepMayorGenBALANCE_ANT.Value
    else qryRepMayorGenCREDITO_CLD.value := Abs(qryRepMayorGenBALANCE_ANT.Value);
  end else //cr
  begin
    if qryRepMayorGenBALANCE_ANT.Value > 0 then
    qryRepMayorGenCREDITO_CLD.value := qryRepMayorGenBALANCE_ANT.Value
    else qryRepMayorGenDEBITO_CLD.value := Abs(qryRepMayorGenBALANCE_ANT.Value);
  end;
  qryRepMayorGenBLC_INI_CLD.Value := qryRepMayorGenBALANCE_ANT.Value;
  qryRepMayorGenResultadoCldCR.Value:=0;
  qryRepMayorGenResultadoCldDB.Value:=0;
  if qryTotalDbcr.State = dsbrowse then
  begin
    if qryTotalDbcr.Locate('CUENTA1;CUENTA2;CUENTA3',
                       VarArrayOf([
                       qryRepMayorGenCUENTA1.Value,
                       qryRepMayorGenCUENTA2.Value,
                       qryRepMayorGenCUENTA3.Value]),[]) then
    begin
      if qryRepMayorGenSIGNO_CTA.Value = 1 then
      begin
        qryRepMayorGenResultadoCldDB.Value:=
        qryTotalDbcrDB.Value - qryTotalDbcrCR.Value + qryRepMayorGenBLC_INI_CLD.Value;
        if qryRepMayorGenResultadoCldDB.Value < 0 then
        begin
          qryRepMayorGenResultadoCldCR.Value:=Abs(qryRepMayorGenResultadoCldDB.Value);
          qryRepMayorGenResultadoCldDB.AsVariant:=0;
        end;
      end else
      begin
        qryRepMayorGenResultadoCldCR.Value:=
        qryTotalDbcrCR.Value - qryTotalDbcrDB.Value + qryRepMayorGenBLC_INI_CLD.Value;
        if qryRepMayorGenResultadoCldCR.Value < 0 then
        begin
          qryRepMayorGenResultadoCldDB.Value:=Abs(qryRepMayorGenResultadoCldCR.Value);
          qryRepMayorGenResultadoCldCR.AsVariant:=0;
        end;
      end;
    end else
    begin
      if qryRepMayorGenSIGNO_CTA.Value = 1 then
      begin
        qryRepMayorGenResultadoCldDB.Value:=qryRepMayorGenBLC_INI_CLD.Value;
        if qryRepMayorGenResultadoCldDB.Value < 0 then
        begin
          qryRepMayorGenResultadoCldCR.Value:=Abs(qryRepMayorGenResultadoCldDB.Value);
          qryRepMayorGenResultadoCldDB.Value:=0;
        end;
      end else
      begin                //1
        qryRepMayorGenResultadoCldCR.Value:=qryRepMayorGenBLC_INI_CLD.Value;
        if qryRepMayorGenResultadoCldCR.Value < 0 then
        begin
          qryRepMayorGenResultadoCldDB.Value:=Abs(qryRepMayorGenResultadoCldCR.Value);
          qryRepMayorGenResultadoCldCR.AsVariant:=0;
        end;
      end;
    end;
  end;
end;

procedure Tdtmodrep.qryRepMayorGenAfterScroll(DataSet: TDataSet);
begin
  if GlbMGendet then
  begin
    qryRepMayorGenDet.Close;
    qryRepMayorGenDet.Sql.Clear;
    //sqlScripMayorGeneral.ExecStatement(1);
    qryRepMayorGenDet.Sql.Text := sqlScripMayorGeneral_1.SQL.Text; // sqlScripMayorGeneral.SqlActual;
    if not qryRepMayorGenDet.Prepared then
    qryRepMayorGenDet.Prepare;
  end else
  begin
    qryRepMayorGenDet.Close;
    qryRepMayorGenDet.Sql.Clear;
    //sqlScripMayorGeneral.ExecStatement(0);
    qryRepMayorGenDet.Sql.Text := sqlScripMayorGeneral_0.SQL.Text;//sqlScripMayorGeneral.SqlActual;
    if not qryRepMayorGenDet.Prepared then
    qryRepMayorGenDet.Prepare;
  end;
  qryRepMayorGenDet.Params[0].Value := GlbFechaInicial;
  qryRepMayorGenDet.Params[1].Value := GlbFechaFinal;
  qryRepMayorGenDet.Params[2].Value := qryRepMayorGenCUENTA1.value;
  qryRepMayorGenDet.Params[3].Value := qryRepMayorGenCUENTA2.value;
  qryRepMayorGenDet.Params[4].Value := qryRepMayorGenCUENTA3.value;
  qryRepMayorGenDet.Open;
end;

procedure Tdtmodrep.qryRepMayorGenDetCalcFields(DataSet: TDataSet);
var
  Resultado : Real;
begin
  if qryRepMayorGenDetSTATUS.Value = 'C' then
  begin
    qryRepMayorGenDetDB_CLD.Value := 0;
    qryRepMayorGenDetCR_CLD.Value := 0;
  end else
  begin
    qryRepMayorGenDetDB_CLD.Value := qryRepMayorGenDetDEBITO_TRN.Value;
    qryRepMayorGenDetCR_CLD.Value := qryRepMayorGenDetCREDITO_TRN.Value;
  end;
end;

procedure Tdtmodrep.qryRepMayorGenFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:= (Dataset['Cuenta1'] = cI1) And
  (Dataset['Cuenta2'] = cI2) And
  (Dataset['Cuenta3'] = cI3);
end;

procedure Tdtmodrep.qryblcCompFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if (FnivelCta <> '') and (FTipoCta = '') then
  Accept:= (Dataset['nivel_cta'] = FnivelCta)
  else
  if (FnivelCta = '') and (FTipoCta = '') then
  Accept:=Dataset['tipo_cta'] = Chr(39)+FTipoCta+Chr(39)
  else
  if (FnivelCta <> '') and (FTipoCta <> '') then
    Accept:= (Dataset['nivel_cta'] = FnivelCta) And
  (Dataset['tipo_cta'] = Chr(39)+FTipoCta+Chr(39));

end;

end.
