unit UDatModDistCNT;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, RxMemDS, IBTable;

type
  TdmDistCnt = class(TDataModule)
    qryDistCnt: TIBQuery;
    dsqryDistCnt: TDataSource;
    qryDistCntSERIE: TIntegerField;
    qryDistCntMODULO: TIntegerField;
    qryDistCntORIGEN: TIntegerField;
    qryDistCntCTA1: TIBStringField;
    qryDistCntCTA2: TIBStringField;
    qryDistCntCTA3: TIBStringField;
    qryDistCntDESCRIPCION: TIBStringField;
    qryDistCntNOMBRE_CAMPO: TIBStringField;
    qryDistCntNOMBRE_TABLA: TIBStringField;
    qryDistCntSTATUS: TIBStringField;
    qryDistCntINSERT_POR: TIBStringField;
    qryDistCntFECHA_INSER: TDateTimeField;
    qryDistCntUPDATE_POR: TIBStringField;
    rxDatosTransCnt: TRxMemoryData;
    rxDatosTransCntcta1: TStringField;
    rxDatosTransCntcta2: TStringField;
    rxDatosTransCntcta3: TStringField;
    rxDatosTransCntDescripcion: TStringField;
    rxDatosTransCntDebito: TFloatField;
    rxDatosTransCntCredito: TFloatField;
    dsrxDatosTransCnt: TDataSource;
    qryDatosAContabilizar: TIBQuery;
    dtqryDatosAContabilizar: TDataSource;
    qryDistCntCompuesta: TIBQuery;
    qryDistCntCompuestaSERIE: TIntegerField;
    qryDistCntCompuestaNUMERO: TIntegerField;
    qryDistCntCompuestaCTA1: TIBStringField;
    qryDistCntCompuestaCTA2: TIBStringField;
    qryDistCntCompuestaCTA3: TIBStringField;
    qryDistCntCompuestaNOMBRE_CAMPO: TIBStringField;
    qryDistCntCompuestaNOMBRE_TABLA: TIBStringField;
    qryDistCntCompuestaSTATUS: TIBStringField;
    qryDistCntCompuestaINSERT_POR: TIBStringField;
    qryDistCntCompuestaFECHA_INSER: TDateTimeField;
    qryDistCntCompuestaUPDATE_POR: TIBStringField;
    qryDistCntCompuestaSIGNO: TIBStringField;
    qryDatosAContCompuesto: TIBQuery;
    dsqryDatosAContCompuesto: TDataSource;
    tblModuloCnt: TIBTable;
    tblModuloCntID: TIntegerField;
    tblModuloCntDESCRIPCION: TIBStringField;
    dstblModuloCnt: TDataSource;
    qryCampoClave: TIBQuery;
    qryCampoClaveSERIE: TIntegerField;
    qryCampoClaveNUMERO: TIntegerField;
    qryCampoClaveCAMPO_CLAVE: TIBStringField;
    qryCampoClaveNOMBRE_CAMPO: TIBStringField;
    qryCampoClaveNOMBRE_TABLA: TIBStringField;
    qryCampoClaveSTATUS: TIBStringField;
    qryCampoClaveINSERT_POR: TIBStringField;
    qryCampoClaveFECHA_INSER: TDateTimeField;
    qryCampoClaveUPDATE_POR: TIBStringField;
    qryDatosCampoClave: TIBQuery;
    qryDistCntCNT: TSmallintField;
    qryDistCntIDTIPO_PAGO: TSmallintField;
    tblGrupoCnt: TIBTable;
    dstblGrupoCnt: TDataSource;
    tblGrupoCntID_FPAGO: TSmallintField;
    tblGrupoCntMODULO: TIntegerField;
    tblGrupoCntDESCRIPCION: TIBStringField;
    tblFormaPago: TIBTable;
    tblFormaPagoCODIGO: TSmallintField;
    tblFormaPagoDESCRIPCION: TIBStringField;
    tblFormaPagoORIGEN: TSmallintField;
    dstblFormaPago: TDataSource;
    tblDistCntMaster: TIBTable;
    tblDistCntMasterID: TIntegerField;
    tblDistCntMasterDESCRIPCION: TIBStringField;
    tblDistCntMasterFECHA_IN: TDateTimeField;
    tblDistCntMasterUSER_IN: TIBStringField;
    dstblDistCntMaster: TDataSource;
    dstblDistribucionCnt: TDataSource;
    tblDistribucionCntold: TIBTable;
    tblDistribucionCntoldSERIE: TIntegerField;
    tblDistribucionCntoldMODULO: TIntegerField;
    tblDistribucionCntoldORIGEN: TIntegerField;
    tblDistribucionCntoldCTA1: TIBStringField;
    tblDistribucionCntoldCTA2: TIBStringField;
    tblDistribucionCntoldCTA3: TIBStringField;
    tblDistribucionCntoldDESCRIPCION: TIBStringField;
    tblDistribucionCntoldNOMBRE_CAMPO: TIBStringField;
    tblDistribucionCntoldNOMBRE_TABLA: TIBStringField;
    tblDistribucionCntoldSTATUS: TIBStringField;
    tblDistribucionCntoldINSERT_POR: TIBStringField;
    tblDistribucionCntoldFECHA_INSER: TDateTimeField;
    tblDistribucionCntoldUPDATE_POR: TIBStringField;
    tblDistribucionCntoldCNT: TSmallintField;
    tblDistribucionCntoldIDTIPO_PAGO: TSmallintField;
    tblDistribucionCntoldNOMBRE_CAMPO_CNTDET: TIBStringField;
    tblDistribucionCntoldNOMBRE_CAMPO_CNTMASTER: TIBStringField;
    tblDistribucionCnt: TIBDataSet;
    tblDistribucionCntSERIE: TIntegerField;
    tblDistribucionCntMODULO: TIntegerField;
    tblDistribucionCntORIGEN: TIntegerField;
    tblDistribucionCntCTA1: TIBStringField;
    tblDistribucionCntCTA2: TIBStringField;
    tblDistribucionCntCTA3: TIBStringField;
    tblDistribucionCntNOMBRE_CAMPO: TIBStringField;
    tblDistribucionCntSTATUS: TIBStringField;
    tblDistribucionCntINSERT_POR: TIBStringField;
    tblDistribucionCntFECHA_INSER: TDateTimeField;
    tblDistribucionCntUPDATE_POR: TIBStringField;
    tblDistribucionCntCNT: TSmallintField;
    tblDistribucionCntIDTIPO_PAGO: TSmallintField;
    tblDistribucionCntNOMBRE_CAMPO_CNTDET: TIBStringField;
    tblDistribucionCntNOMBRE_CAMPO_CNTMASTER: TIBStringField;
    tblDistribucionCntNOMBRE_TABLA_CNT: TIBStringField;
    tblDistribucionCntSENTENCIA_SQL: TIBStringField;
    tblGrpTipoPago: TIBTable;
    dstblGrpTipoPago: TDataSource;
    tblGrpTipoPagoID_FPAGO: TSmallintField;
    tblGrpTipoPagoCODIGO_TIPO_PAGO: TSmallintField;
    tblGrpTipoPagoDESCRIPCION: TIBStringField;
    tblDistCntCtaFija: TIBDataSet;
    tblDistCntCtaFijaSERIE: TIntegerField;
    tblDistCntCtaFijaMODULO: TIntegerField;
    tblDistCntCtaFijaORIGEN: TIntegerField;
    tblDistCntCtaFijaCTA1: TIBStringField;
    tblDistCntCtaFijaCTA2: TIBStringField;
    tblDistCntCtaFijaCTA3: TIBStringField;
    tblDistCntCtaFijaDESCRIPCION: TIBStringField;
    tblDistCntCtaFijaNOMBRE_CAMPO: TIBStringField;
    tblDistCntCtaFijaNOMBRE_TABLA: TIBStringField;
    tblDistCntCtaFijaSTATUS: TIBStringField;
    tblDistCntCtaFijaINSERT_POR: TIBStringField;
    tblDistCntCtaFijaFECHA_INSER: TDateTimeField;
    tblDistCntCtaFijaUPDATE_POR: TIBStringField;
    tblDistCntCtaFijaCNT: TSmallintField;
    tblDistCntCtaFijaIDTIPO_PAGO: TSmallintField;
    tblDistCntCtaFijaNOMBRE_CAMPO_CNTDET: TIBStringField;
    tblDistCntCtaFijaNOMBRE_CAMPO_CNTMASTER: TIBStringField;
    tblDistCntCtaFijaNOMBRE_TABLA_CNT: TIBStringField;
    tblDistCntCtaFijaSENTENCIA_SQL: TIBStringField;
    dstblDistCntCtaFija: TDataSource;
    tblDisCtaFijaMaster: TIBDataSet;
    tblDisCtaFijaMasterSERIE: TIntegerField;
    tblDisCtaFijaMasterNOMBRE_TABLA: TIBStringField;
    tblDisCtaFijaMasterMODULO: TIntegerField;
    tblDisCtaFijaMasterIDTIPO_PAGO: TSmallintField;
    tblDisCtaFijaMasterSTATUS: TIBStringField;
    dstblDisCtaFijaMaster: TDataSource;
    tblDistCtaMaster: TIBDataSet;
    dstblDistCtaMaster: TDataSource;
    tblDistCtaMasterID: TIntegerField;
    tblDistCtaMasterDESCRIPCION: TIBStringField;
    tblDistCtaMasterFECHA_IN: TDateTimeField;
    tblDistCtaMasterUSER_IN: TIBStringField;
    tblDistCtaMasterMODULO: TIntegerField;
    tblDistCtaMasterIDTIPO_PAGO: TSmallintField;
    tblDistCtaMasterNOMBRE_TABLA: TIBStringField;
    tblDistribucionCntNOMBRE_TABLA: TIBStringField;
    tblDistribucionCntDESCRIPCION: TIBStringField;
    tblDistribucionCntNombreCuenta: TStringField;
    tblDistCntCtaFijaNombreCuenta: TStringField;
    tblDistribucionEstatusCnt: TIBTable;
    tblDistribucionEstatusCntSERIE: TIntegerField;
    tblDistribucionEstatusCntMODULO_CNT: TIntegerField;
    tblDistribucionEstatusCntNOMBRE_CAMPO_ORIGEN: TIBStringField;
    tblDistribucionEstatusCntNOMBRE_CAMPO_DESTINO: TIBStringField;
    tblDistribucionEstatusCntNOMBRE_TABLA_DESTINO: TIBStringField;
    tblDistribucionEstatusCntVALOR_DESTINO: TIBStringField;
    dstblDistribucionEstatusCnt: TDataSource;
    procedure qryDistCntAfterScroll(DataSet: TDataSet);
    procedure tblDistCntMasterAfterScroll(DataSet: TDataSet);
    procedure tblDisCtaFijaMasterAfterScroll(DataSet: TDataSet);
    procedure tblDistCtaMasterAfterScroll(DataSet: TDataSet);
    procedure tblDistribucionCntCalcFields(DataSet: TDataSet);
    procedure tblDistCntCtaFijaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    lNombretabla : string;
  end;

var
  dmDistCnt: TdmDistCnt;

implementation

uses UDatModConectar, uGlobal;

{$R *.dfm}

procedure TdmDistCnt.qryDistCntAfterScroll(DataSet: TDataSet);
begin
  qryDistCntCompuesta.Close;
  qryDistCntCompuesta.Params[0].Value:= qryDistCntSERIE.Value;
  qryDistCntCompuesta.Open;

  dmDistCnt.qryDatosCampoClave.Close;
  dmDistCnt.qryDatosCampoClave.SQL.Text :=
  'Select precio_compra From inventario_producto '+
  'Where codigo_texto =:codigo';
  dmDistCnt.qryDatosCampoClave.Open;
  
  //qryCampoClave.Close;
  //qryCampoClave.Params[0].Value:= qryDistCntSERIE.Value;
  //qryCampoClave.Open;
end;

procedure TdmDistCnt.tblDistCntMasterAfterScroll(DataSet: TDataSet);
begin
{  tblDistribucionCnt.Close;
  tblDistribucionCnt.Params[0].Value:=tblDistCntMasterID.Value;
  tblDistribucionCnt.Params[1].Value:=Trim(lNombretabla);
  tblDistribucionCnt.Open;}
end;

procedure TdmDistCnt.tblDisCtaFijaMasterAfterScroll(DataSet: TDataSet);
begin
  if tblDistCntCtaFija.State In [dsInactive, dsBrowse] then
  begin
    tblDistCntCtaFija.Close;
    tblDistCntCtaFija.params[0].Value:=tblDisCtaFijaMasterIDTIPO_PAGO.Value;
    tblDistCntCtaFija.params[1].Value:=tblDisCtaFijaMasterMODULO.Value;
    tblDistCntCtaFija.params[2].Value:=Trim(tblDisCtaFijaMasterNOMBRE_TABLA.Value);
    tblDistCntCtaFija.Open;
  end;
end;

procedure TdmDistCnt.tblDistCtaMasterAfterScroll(DataSet: TDataSet);
begin
  if tblDistribucionCnt.State In [dsInactive, dsBrowse] then
  begin
    tblDistribucionCnt.Close;
    tblDistribucionCnt.params[0].Value:= tblDistCtaMasterIDTIPO_PAGO.Value;
    tblDistribucionCnt.params[1].Value:= tblDistCtaMasterMODULO.Value;
    tblDistribucionCnt.params[2].AsString :=Trim(tblDistCtaMasterNOMBRE_TABLA.Value);
    tblDistribucionCnt.Open;
  end;
end;

procedure TdmDistCnt.tblDistribucionCntCalcFields(DataSet: TDataSet);
begin
  if CtaExiste(tblDistribucionCntCTA1.Value,
  tblDistribucionCntCTA2.Value,tblDistribucionCntCTA3.Value,false) then
  tblDistribucionCntNombreCuenta.Value := glbNombreCta
  else
  tblDistribucionCntNombreCuenta.Value := '????Cuenta No Existe?????';
end;

procedure TdmDistCnt.tblDistCntCtaFijaCalcFields(DataSet: TDataSet);
begin
  if CtaExiste(tblDistCntCtaFijaCTA1.Value,
  tblDistCntCtaFijaCTA2.Value, tblDistCntCtaFijaCTA3.Value, False) then
  tblDistCntCtaFijaNombreCuenta.Value := glbNombreCta
  else
  tblDistCntCtaFijaNombreCuenta.Value := '????Cuenta No Existe?????';
end;

end.
