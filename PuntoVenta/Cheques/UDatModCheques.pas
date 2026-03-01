unit UDatModCheques;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBTable, RxMemDS,
  IBUpdateSQL, IBStoredProc, IBSQL;

type
  Tdmcks = class(TDataModule)
    qrybancos: TIBDataSet;
    qrybancosdet: TIBDataSet;
    dsqrybancos: TDataSource;
    dsqrybancosdet: TDataSource;
    qrybancosCODIGO: TSmallintField;
    qrybancosDESCRIPCION: TIBStringField;
    qrybancosCODIGO_ABR: TIBStringField;
    qrybancosdetSERIE: TFloatField;
    qrybancosdetCODIGO: TSmallintField;
    qrybancosdetTIPO: TIBStringField;
    qrybancosdetCUENTA_BANCO: TIBStringField;
    qrybancosdetMONEDA: TIBStringField;
    qrybancosdetCUENTA1: TIBStringField;
    qrybancosdetCUENTA2: TIBStringField;
    qrybancosdetCUENTA3: TIBStringField;
    qrybancosdetSTATUS: TIBStringField;
    qrybancosdetFECHA_APERTURA: TDateTimeField;
    qrybancosdetFECHA_CANCELADA: TDateTimeField;
    qrybancosdetCKS_CLASIFICACION: TSmallintField;
    qryChequesM: TIBDataSet;
    qryChequesDet: TIBDataSet;
    qryChequesMNUM_TRANS: TFloatField;
    qryChequesMCODIGO_CIA: TIntegerField;
    qryChequesMSOL_EXPNO: TIntegerField;
    qryChequesMCOD_BENEFICIARIO: TIntegerField;
    qryChequesMFECHA_EMISION: TDateTimeField;
    qryChequesMBENEFICIARIO: TIBStringField;
    qryChequesMMONTO: TFloatField;
    qryChequesMCONCEPTO: TMemoField;
    qryChequesMNUMERO_CKS: TIntegerField;
    qryChequesMFECHA_PAGO: TDateTimeField;
    qryChequesMTIPO_CKS: TSmallintField;
    qryChequesMCOD_BANCO: TIntegerField;
    qryChequesMSTATUS: TIBStringField;
    qryChequesMFECHA_IN: TDateTimeField;
    qryChequesMIN_POR: TIBStringField;
    qryChequesMFECHA_MOD: TDateTimeField;
    qryChequesMMOD_POR: TIBStringField;
    qryChequesMmonto_cld: TCurrencyField;
    qryChequesDetSERIE: TFloatField;
    qryChequesDetNUM_TRANS: TFloatField;
    qryChequesDetCUENTA1: TIBStringField;
    qryChequesDetCUENTA2: TIBStringField;
    qryChequesDetCUENTA3: TIBStringField;
    qryChequesDetCREDITO: TFloatField;
    qryChequesDetDEBITO: TFloatField;
    qryChequesDetSTATUS: TIBStringField;
    qryChequesDetCOD_DIST_CTA: TIntegerField;
    qryChequesDetFECHA_IN: TDateTimeField;
    qryChequesDetIN_POR: TIBStringField;
    qryChequesDetFECHA_MOD: TDateTimeField;
    qryChequesDetMOD_POR: TIBStringField;
    qryChequesDetCENTRO_COSTO: TIntegerField;
    qryChequesDetNOMBRECTA: TStringField;
    qryChequesDetSIGNOCTA: TIntegerField;
    qryChequesDetDBCR: TStringField;
    dtChequesM: TDataSource;
    dtChequesDet: TDataSource;
    QryProveedores: TIBQuery;
    dsQryProveedores: TDataSource;
    tChequesptipo: TIBTable;
    dttChequesptipo: TDataSource;
    tCentroCostos: TIBTable;
    dstCentroCostos: TDataSource;
    qryChequesIsr: TIBDataSet;
    qryChequesIsrNUMERO_SERIE: TFloatField;
    qryChequesIsrPORC_DESC: TFloatField;
    qryChequesIsrINSERTADO_POR: TIBStringField;
    qryChequesIsrFECHA_IN: TDateTimeField;
    qryChequesIsrMODIFICADO_POR: TIBStringField;
    qryChequesIsrFECHA_MOD: TDateTimeField;
    qryChequesIsrSTATUS: TIBStringField;
    qryrepcks: TIBQuery;
    updNumcks: TIBUpdateSQL;
    qryRepCksPIsr: TIBQuery;
    qryRepCksPIsrNUMERO_SERIE: TFloatField;
    qryRepCksPIsrPORC_DESC: TFloatField;
    qryRepCksPIsrINSERTADO_POR: TIBStringField;
    qryRepCksPIsrFECHA_IN: TDateTimeField;
    qryRepCksPIsrMODIFICADO_POR: TIBStringField;
    qryRepCksPIsrFECHA_MOD: TDateTimeField;
    qryRepCksPIsrSTATUS: TIBStringField;
    stpCksDanados: TIBStoredProc;
    stpSeriecksDet: TIBStoredProc;
    stpNumcks: TIBStoredProc;
    tChequesptipoCODIGO: TSmallintField;
    tChequesptipoDESCRIPCION: TIBStringField;
    tblSecNumCks: TIBTable;
    tblSecNumCksTIPO: TSmallintField;
    tblSecNumCksSERIE: TFloatField;
    tblSecNumCksCODBANCO: TIntegerField;
    tblSecNumCksFECHA: TDateTimeField;
    dstblSecNumCks: TDataSource;
    qryConciliacion: TIBQuery;
    qryConciliacionCODIGO_BCO: TIntegerField;
    qryConciliacionCUENTA_BCO: TIBStringField;
    qryConciliacionTIPO_TRN: TIntegerField;
    qryConciliacionTIPO: TIBStringField;
    qryConciliacionCUENTA1: TIBStringField;
    qryConciliacionCUENTA2: TIBStringField;
    qryConciliacionCUENTA3: TIBStringField;
    qryConciliacionBALANCE_ANT: TFloatField;
    qryConciliacionBALANCE_ACT: TFloatField;
    qryConciliacionMONTO: TFloatField;
    qryConciliacionBCE_SEGUN_LIBRO: TCurrencyField;
    dtRXConciliacion: TDataSource;
    RXConciliacion: TRxMemoryData;
    RXConciliacionBceSegBanco: TFloatField;
    RXConciliacionBceCksTransito: TFloatField;
    RXConciliacionBceDepEnTransito: TFloatField;
    RXConciliacionBceBceEnLibro: TFloatField;
    RXConciliacionIntereses: TFloatField;
    RXConciliacionComisiones: TFloatField;
    RXConciliacionNotaDebito: TFloatField;
    RXConciliacionNotaCredito: TFloatField;
    RXConciliacionOtros: TFloatField;
    RXConciliacionBalanceUno: TFloatField;
    RXConciliacionBalanceDos: TFloatField;
    RXConciliacionOtro1: TFloatField;
    dtqryConciliacion: TDataSource;
    qryBceSegunBco: TIBDataSet;
    qryBceSegunBcoCODIGO: TIntegerField;
    qryBceSegunBcoCUENTA_BANCO: TIBStringField;
    qryBceSegunBcoFECHA: TDateTimeField;
    qryBceSegunBcoBALANCE: TFloatField;
    qryBceSegunBcoOTRO: TFloatField;
    qryBceSegunBcoSTATUS: TIBStringField;
    qryBceSegunBcoFECHA_IN: TDateTimeField;
    qryBceSegunBcoIN_POR: TIBStringField;
    qryBceSegunBcoFECHA_MOD: TDateTimeField;
    qryBceSegunBcoMOD_POR: TIBStringField;
    qryBceSegunBcoCOMENTARIO: TMemoField;
    dtqryBceSegunBco: TDataSource;
    qryRepCksEnTransito: TIBQuery;
    qryRepCksEnTransitoTIPO_TRN: TIntegerField;
    qryRepCksEnTransitoNUMERO_DOC: TIntegerField;
    qryRepCksEnTransitoFECHA_TRN: TDateTimeField;
    qryRepCksEnTransitoDESCRIPCION_TRN: TIBStringField;
    qryRepCksEnTransitoMONTO_TRN: TFloatField;
    qryRepCksEnTransitoSTATUS_CKS: TIBStringField;
    qryRepCksEnTransitoDESCRIPCION: TIBStringField;
    tblTipoCheque: TIBTable;
    tblTipoChequeCODIGO: TSmallintField;
    tblTipoChequeDESCRIPCION: TIBStringField;
    dtTipocheque: TDataSource;
    tblTipoctabanco: TIBTable;
    tblTipoctabancoCODIGO: TIntegerField;
    tblTipoctabancoDESCRIPCION: TIBStringField;
    dstblTipoctabanco: TDataSource;
    qrybancosCIA_KEY: TIntegerField;
    qrybancosdetCIA_KEY: TIntegerField;
    QryProveedoresCODIGO_CTE: TIntegerField;
    QryProveedoresTIPO_CLIENTE: TIntegerField;
    QryProveedoresNOMBRE_ABR: TIBStringField;
    QryProveedoresDESCRIPCION: TIBStringField;
    QryProveedoresCONTACTO: TIBStringField;
    QryProveedoresPAIS: TIBStringField;
    QryProveedoresESTADO: TIBStringField;
    QryProveedoresCIUDAD: TIBStringField;
    QryProveedoresCALYYNUM: TIBStringField;
    QryProveedoresTELEFONO: TIBStringField;
    QryProveedoresFAX: TIBStringField;
    QryProveedoresCODIGOPOSTAL: TIBStringField;
    QryProveedoresEMAIL: TIBStringField;
    QryProveedoresDIRECCIONWEB: TIBStringField;
    QryProveedoresSTATUS: TIBStringField;
    QryProveedoresFECHA_IN: TDateTimeField;
    QryProveedoresIN_POR: TIBStringField;
    QryProveedoresFECHA_MOD: TDateTimeField;
    QryProveedoresMOD_POR: TIBStringField;
    QryProveedoresRNC_PROVEEDOR: TIBStringField;
    QryProveedoresMOVIL1: TIBStringField;
    QryProveedoresMOVIL2: TIBStringField;
    QryProveedoresTELEFONO2: TIBStringField;
    QryProveedoresTELEFONO3: TIBStringField;
    QryProveedoresEXTENSIONES: TIBStringField;
    QryProveedoresCIA_KEY: TIntegerField;
    QryProveedoresTIPOCXP: TIntegerField;
    qryrepcksNUM_TRANS: TFloatField;
    qryrepcksCODIGO_CIA: TIntegerField;
    qryrepcksSOL_EXPNO: TIntegerField;
    qryrepcksCOD_BENEFICIARIO: TIntegerField;
    qryrepcksFECHA_EMISION: TDateTimeField;
    qryrepcksBENEFICIARIO: TIBStringField;
    qryrepcksMONTO: TFloatField;
    qryrepcksCONCEPTO: TMemoField;
    qryrepcksNUMERO_CKS: TIntegerField;
    qryrepcksFECHA_PAGO: TDateTimeField;
    qryrepcksTIPO_CKS: TSmallintField;
    qryrepcksCOD_BANCO: TIntegerField;
    qryrepcksSTATUS: TIBStringField;
    qryrepcksFECHA_IN: TDateTimeField;
    qryrepcksIN_POR: TIBStringField;
    qryrepcksFECHA_MOD: TDateTimeField;
    qryrepcksMOD_POR: TIBStringField;
    qryConciliacionDESCRIPCION: TIBStringField;
    qryrepcksPORC_DESCUENTO: TCurrencyField;
    qryrepcksVALOR_NETO: TCurrencyField;
    tCentroCostosCODIGO: TIntegerField;
    tCentroCostosNOMBRE: TIBStringField;
    tCentroCostosCODDGII: TIntegerField;
    tCentroCostosCUENTA_GASTO: TIBStringField;
    qrylistadecheques: TIBQuery;
    qryRepCksIsrDesc: TIBQuery;
    QryDatosDistcheque: TIBQuery;
    QryDatosDistchequeNUMERO: TIntegerField;
    QryDatosDistchequeFECHA: TDateTimeField;
    QryDatosDistchequeNUM_TRANS_CKS: TFloatField;
    QryDatosDistchequeCOD_FPAGO: TSmallintField;
    QryDatosDistchequeSTATUS: TIBStringField;
    QryDatosDistchequeFECHA_IN: TDateTimeField;
    QryDatosDistchequeIN_POR: TIBStringField;
    QryDatosDistchequeFECHA_MOD: TDateTimeField;
    QryDatosDistchequeMOD_POR: TIBStringField;
    QryDatosDistchequeTIPO_NCF: TIBStringField;
    QryDatosDistchequeNUMERO_NCF: TIBStringField;
    QryDatosDistchequeMONTO_ITBIS: TFloatField;
    QryDatosDistchequeMONTO_OTROS_IMP: TFloatField;
    QryDatosDistchequeMONTO_TOTAL: TFloatField;
    QryDatosDistchequeDet: TIBQuery;
    QryDatosDistchequeDetSERIE: TIntegerField;
    QryDatosDistchequeDetNUMERO: TIntegerField;
    QryDatosDistchequeDetCODIGO_PROV: TIntegerField;
    QryDatosDistchequeDetCOD_COSTO: TIntegerField;
    QryDatosDistchequeDetCOD_DEPTO: TSmallintField;
    QryDatosDistchequeDetDESCRIPCION: TIBStringField;
    QryDatosDistchequeDetNUMERO_FACTURA: TIntegerField;
    QryDatosDistchequeDetCANTIDAD: TIntegerField;
    QryDatosDistchequeDetMONTO: TFloatField;
    QryDatosDistchequeDetCOD_USUARIO: TIntegerField;
    QryDatosDistchequeDetSTATUS: TIBStringField;
    QryDatosDistchequeDetFECHA_IN: TDateTimeField;
    QryDatosDistchequeDetIN_POR: TIBStringField;
    QryDatosDistchequeDetFECHA_MOD: TDateTimeField;
    QryDatosDistchequeDetMOD_POR: TIBStringField;
    qrylistadechequesFECHA_EMISION: TDateTimeField;
    qrylistadechequesCOD_BENEFICIARIO: TIntegerField;
    qrylistadechequesNUM_TRANS: TFloatField;
    qrylistadechequesNUMERO_CKS: TIntegerField;
    qrylistadechequesBENEFICIARIO: TIBStringField;
    qrylistadechequesMONTO: TFloatField;
    qrylistadechequesSTATUS: TIBStringField;
    qrylistadechequesCOD_BANCO: TIntegerField;
    qrylistadechequesFECHA_PAGO: TDateTimeField;
    qrylistadechequesTIPO_CKS: TSmallintField;
    qrylistadechequesCONCEPTO: TMemoField;
    qrylistadechequesCODIGO_CIA: TIntegerField;
    qrylistadechequesSOL_EXPNO: TIntegerField;
    qrylistadechequesCODIGO: TSmallintField;
    qrylistadechequesNOMBRE: TIBStringField;
    qrylistadechequesDESCRIPCION: TIBStringField;
    qrylistadechequesMONTO_CLD: TCurrencyField;
    qryCheckSecCKS: TIBQuery;
    qryCheckSecCKSACCION: TSmallintField;
    qryCheckSecCKSMSG: TIBStringField;
    qryCheckSecCKSNUM_CHEQUEACTUAL: TIntegerField;
    qryCheckSecCKSNUMCHEQ_GENERADOR: TIntegerField;
    qryTipoCtaBanco: TIBQuery;
    qryTipoCtaBancoCODIGO: TIntegerField;
    qryTipoCtaBancoDESCRIPCION: TIBStringField;
    ibUpdateGenNumCks: TIBSQL;
    procedure qrybancosAfterScroll(DataSet: TDataSet);
    procedure qryChequesMAfterScroll(DataSet: TDataSet);
    procedure qryChequesMCalcFields(DataSet: TDataSet);
    procedure qryChequesDetCalcFields(DataSet: TDataSet);
    procedure qryrepcksCalcFields(DataSet: TDataSet);
    procedure qryConciliacionCalcFields(DataSet: TDataSet);
    procedure qryRepCksEnTransitoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure QryDatosDistchequeAfterScroll(DataSet: TDataSet);
    procedure qrylistadechequesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }

  public
    { Public declarations }
    FStatuscks : string;
    
  end;

var
  dmcks: Tdmcks;

implementation

uses UDatModConectar, UGlobal, UDatmodDatosGenerales;//UDatmodDatos;

{$R *.dfm}

procedure Tdmcks.qrybancosAfterScroll(DataSet: TDataSet);
begin
  if qrybancosdet.State in [dsInactive, dsBrowse] then
  begin
    qrybancosdet.Close;
    qrybancosdet.Params[0].value:= qryBancosCodigo.Value;
    qrybancosdet.Open;
  end;
end;

procedure Tdmcks.qryChequesMAfterScroll(DataSet: TDataSet);
begin
  if qryChequesDet.State in [dsedit, dsinsert] then exit;
  with qryChequesM do
  begin
    qryChequesDet.DisableControls;
    qryChequesDet.close;
    qryChequesDet.params[0].value := qryChequesmnum_trans.value;
    qryChequesDet.open;
    qryChequesDet.EnableControls;

    qryChequesIsr.DisableControls;
    qryChequesIsr.close;
    qryChequesIsr.params[0].value := qryChequesMnum_trans.value;
    qryChequesIsr.open;
    qryChequesIsr.EnableControls;
  end;
end;

procedure Tdmcks.qryChequesMCalcFields(DataSet: TDataSet);
begin
  if (qryChequesMSTATUS.Value = 'C') Or (qryChequesMSTATUS.Value = 'N') then
  qrychequesMmonto_cld.Value := 0 else
  qrychequesMmonto_cld.Value := qrychequesMmonto.Value;
end;

procedure Tdmcks.qryChequesDetCalcFields(DataSet: TDataSet);
begin
  if not CtaExiste(qrychequesdetcuenta1.Value, qrychequesdetcuenta2.Value,
                   qrychequesdetcuenta3.Value, False) then
  begin
    qryChequesDetNOMBRECTA.Value := '????????';
  end else
    qryChequesDetNOMBRECTA.Value := glbNombreCta;
    qryChequesDetSIGNOCTA.Value  :=
    FCtaTipo(qrychequesdetcuenta1.value,
             qrychequesdetcuenta2.value,
             qrychequesdetcuenta3.value, False);
    if qryChequesDetSIGNOCTA.Value = 1 then
    qryChequesDetDBCR.Value := 'Db' else
    qryChequesDetDBCR.Value := 'Cr'
end;

procedure Tdmcks.qryrepcksCalcFields(DataSet: TDataSet);
begin
  dmcks.qryRepCksPIsr.close;
  dmcks.qryRepCksPIsr.params[0].value := dmcks.qryrepcksnum_trans.Value;
  dmcks.qryRepCksPIsr.open;
  if dmcks.qryRepCksPIsr.Recordcount > 0  then
  begin
    qryRepcksPORC_DESCUENTO.Value:= dmcks.qryRepCksPIsrPORC_DESC.Value;
  end;
  dmcks.qryRepcksVALOR_NETO.Value := dmcks.qryRepcksMONTO.Value -
  (dmcks.qryRepcksMONTO.Value * qryRepcksPORC_DESCUENTO.Value/100);
end;

procedure Tdmcks.qryConciliacionCalcFields(DataSet: TDataSet);
begin
  qryConciliacionBCE_SEGUN_LIBRO.Value:= qryConciliacionBALANCE_ACT.Value;
end;

procedure Tdmcks.qryRepCksEnTransitoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  //  Accept := DataSet[glbCampoFilterCte]=glbValueFilterCte+'*';
  //'(Status_cks = '+chr(39)+'T'+chr(39)+') Or (Status_cks is null)';
  if (FStatuscks = 'T') then
  Accept := (DataSet['Status_cks'] = 'T') or (DataSet['Status_cks'] = 'null')
  else
  Accept := DataSet['Status_cks'] = FStatuscks;
end;

procedure Tdmcks.QryDatosDistchequeAfterScroll(DataSet: TDataSet);
begin
  QryDatosDistchequeDet.Close;
  QryDatosDistchequeDet.Params[0].Value:=QryDatosDistchequeNUMERO.Value;
  QryDatosDistchequeDet.Open;
end;

procedure Tdmcks.qrylistadechequesCalcFields(DataSet: TDataSet);
begin
  if (qryListadeChequesSTATUS.value = 'N') or
     (qryListadeChequesSTATUS.value = 'C') then
      qryListadeChequesMONTO_CLD.value := 0
  else qryListadeChequesMONTO_CLD.value := qryListadeChequesMONTO.value;
end;

end.
