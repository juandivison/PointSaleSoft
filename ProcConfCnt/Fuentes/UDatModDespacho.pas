unit UDatModDespacho;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBStoredProc, IBTable, IBQuery,
  IBSQL;

type
  TdmDespacho = class(TDataModule)
    tblDespachoMaster: TIBDataSet;
    dstblDespachoMaster: TDataSource;
    dstbldespachoDet: TDataSource;
    tblDespachoDet: TIBDataSet;
    tblDespachoMasterNUMERO: TIntegerField;
    tblDespachoMasterFECHA: TDateTimeField;
    tblDespachoMasterTIPO_TRN: TSmallintField;
    tblDespachoMasterCODIGO_EMP: TIntegerField;
    tblDespachoMasterMONTO_TOTAL: TFloatField;
    tblDespachoMasterNUM_ORDEN: TFloatField;
    tblDespachoMasterFECHA_IN: TDateTimeField;
    tblDespachoMasterIN_POR: TIBStringField;
    tblDespachoMasterFECHA_MOD: TDateTimeField;
    tblDespachoMasterMOD_POR: TIBStringField;
    tblDespachoDetSERIE: TIntegerField;
    tblDespachoDetNUMERO: TIntegerField;
    tblDespachoDetTIPO_TRN: TSmallintField;
    tblDespachoDetCANTIDAD: TFloatField;
    tblDespachoDetPRECIO: TFloatField;
    tblDespachoDetPORC_DESC_DET: TFloatField;
    tblDespachoDetITBI_DET: TFloatField;
    tblDespachoDetVALOR_BRUTO: TFloatField;
    tblDespachoDetVALOR_TOTAL_DET: TFloatField;
    tblDespachoDetSTATUS_DET: TIBStringField;
    tblDespachoDetFECHA_IN: TDateTimeField;
    tblDespachoDetIN_POR: TIBStringField;
    tblDespachoDetFECHA_MOD: TDateTimeField;
    tblDespachoDetMOD_POR: TIBStringField;
    IBStoredProc1: TIBStoredProc;
    qryBalanceDespacho: TIBDataSet;
    tblTipoDespacho: TIBTable;
    dstblTipoDespacho: TDataSource;
    tblDespachoMasterSTATUS: TIBStringField;
    tblDespachoMasterCODIGO_DESPACHADOR: TIntegerField;
    qryBalanceDespachoCODIGO_PRODUCTO: TIntegerField;
    qryBalanceDespachoBALANCE_ACT: TFloatField;
    qryBalanceDespachoBALANCE_ANT: TFloatField;
    qryBalanceDespachoDEBITO_MES: TFloatField;
    qryBalanceDespachoCREDITO_MES: TFloatField;
    qryBalanceDespachoDEBITO_ACM: TFloatField;
    qryBalanceDespachoCREDITO_ACM: TFloatField;
    qryBalanceDespachoFECHA_BCE: TDateTimeField;
    qryBalanceDespachoFECHA_ULT_PAGO: TDateTimeField;
    qryBalanceDespachoSTATUS_BCE: TIBStringField;
    qryBalanceDespachoFECHA_IN: TDateTimeField;
    qryBalanceDespachoIN_POR: TIBStringField;
    qryBalanceDespachoFECHA_MOD: TDateTimeField;
    qryBalanceDespachoMOD_POR: TIBStringField;
    qryEmpleados: TIBQuery;
    tblDespachoDetNUM_ORDEN: TFloatField;
    tblDespachoDetDESCRIPCION: TIBStringField;
    GenNumFactura: TIBSQL;
    tblDespachoMasterCODIGO_RUTA: TIntegerField;
    qryBalanceDespachoCODIGO_EMP: TIntegerField;
    qryBalanceDespachoCODIGO_RUTA: TIntegerField;
    tblDespachoDetRECARGA: TFloatField;
    qryEmpleadosNOMBRE: TIBStringField;
    qryEmpleadosCODIGO: TIntegerField;
    qryEmpleadosRUTA: TIntegerField;
    tblDespachoMasterNUM_CONDUCE: TIntegerField;
    tblDespachoDetCODIGO_PROD: TIntegerField;
    tblDespachoMasterRep: TIBQuery;
    tblDespachoMasterRepNUMERO: TIntegerField;
    tblDespachoMasterRepFECHA: TDateTimeField;
    tblDespachoMasterRepTIPO_TRN: TSmallintField;
    tblDespachoMasterRepCODIGO_DESPACHADOR: TIntegerField;
    tblDespachoMasterRepCODIGO_EMP: TIntegerField;
    tblDespachoMasterRepMONTO_TOTAL: TFloatField;
    tblDespachoMasterRepNUM_ORDEN: TFloatField;
    tblDespachoMasterRepSTATUS: TIBStringField;
    tblDespachoMasterRepFECHA_IN: TDateTimeField;
    tblDespachoMasterRepIN_POR: TIBStringField;
    tblDespachoMasterRepFECHA_MOD: TDateTimeField;
    tblDespachoMasterRepMOD_POR: TIBStringField;
    tblDespachoMasterRepCODIGO_RUTA: TIntegerField;
    tblDespachoMasterRepNUM_CONDUCE: TIntegerField;
    QryRepDespachoDet: TIBQuery;
    QryRepDespachoDetSERIE: TIntegerField;
    QryRepDespachoDetNUMERO: TIntegerField;
    QryRepDespachoDetTIPO_TRN: TSmallintField;
    QryRepDespachoDetCODIGO_PROD: TIntegerField;
    QryRepDespachoDetCANTIDAD: TFloatField;
    QryRepDespachoDetPRECIO: TFloatField;
    QryRepDespachoDetPORC_DESC_DET: TFloatField;
    QryRepDespachoDetITBI_DET: TFloatField;
    QryRepDespachoDetVALOR_BRUTO: TFloatField;
    QryRepDespachoDetVALOR_TOTAL_DET: TFloatField;
    QryRepDespachoDetNUM_ORDEN: TFloatField;
    QryRepDespachoDetSTATUS_DET: TIBStringField;
    QryRepDespachoDetFECHA_IN: TDateTimeField;
    QryRepDespachoDetIN_POR: TIBStringField;
    QryRepDespachoDetFECHA_MOD: TDateTimeField;
    QryRepDespachoDetMOD_POR: TIBStringField;
    QryRepDespachoDetDESCRIPCION: TIBStringField;
    QryRepDespachoDetRECARGA: TFloatField;
    tblDespachoMasterRepCODIGO_PROV: TIntegerField;
    tblDespachoMasterCODIGO_PROV: TIntegerField;
    tblDespachoMasterRepA: TIBQuery;
    tblDespachoMasterRepANUMERO: TIntegerField;
    tblDespachoMasterRepAFECHA: TDateTimeField;
    tblDespachoMasterRepATIPO_TRN: TSmallintField;
    tblDespachoMasterRepACODIGO_DESPACHADOR: TIntegerField;
    tblDespachoMasterRepACODIGO_EMP: TIntegerField;
    tblDespachoMasterRepAMONTO_TOTAL: TFloatField;
    tblDespachoMasterRepANUM_ORDEN: TFloatField;
    tblDespachoMasterRepASTATUS: TIBStringField;
    tblDespachoMasterRepAFECHA_IN: TDateTimeField;
    tblDespachoMasterRepAIN_POR: TIBStringField;
    tblDespachoMasterRepAFECHA_MOD: TDateTimeField;
    tblDespachoMasterRepAMOD_POR: TIBStringField;
    tblDespachoMasterRepACODIGO_RUTA: TIntegerField;
    tblDespachoMasterRepANUM_CONDUCE: TIntegerField;
    tblDespachoMasterRepACODIGO_PROV: TIntegerField;
    tblDespachoMasterRepANCF: TIBStringField;
    tblDespachoMasterRepARNC_PROVEEDOR: TIBStringField;
    tblDespachoMasterRepAINVENTARIO_ID: TIntegerField;
    tblDespachoMasterRepASERIE_INV_ID: TIntegerField;
    tblDespachoMasterRepAINV_ID_ORIGEN: TIntegerField;
    tblDespachoMasterRepAINV_ID_DESTINO: TIntegerField;
    procedure tblDespachoMasterAfterScroll(DataSet: TDataSet);
    procedure tblDespachoMasterAfterInsert(DataSet: TDataSet);
    procedure tblDespachoDetBeforePost(DataSet: TDataSet);
    procedure tblDespachoMasterRepAfterScroll(DataSet: TDataSet);
    procedure tblDespachoMasterRepAAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    function GeneraNumFactura:integer;
  public
    { Public declarations }
  end;

var
  dmDespacho: TdmDespacho;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdmDespacho.tblDespachoMasterAfterScroll(DataSet: TDataSet);
begin
  if dmDespacho.tblDespachoDet.State in [dsInactive, dsBrowse] then
  begin
    dmDespacho.tblDespachoDet.Close;
    dmDespacho.tblDespachoDet.Params[0].Value:= dmDespacho.tblDespachoMasterNUMERO.Value;
    dmDespacho.tblDespachoDet.Open;
  end;
end;

procedure TdmDespacho.tblDespachoMasterAfterInsert(DataSet: TDataSet);
begin
  tblDespachoMasterNUM_ORDEN.Value :=GeneraNumFactura;//funcion
end;

function TdmDespacho.GeneraNumFactura: integer;
begin
  dmDespacho.GenNumFactura.ExecQuery;
  if dmDespacho.GenNumFactura.Open then
  try
    Result:=dmDespacho.GenNumFactura.Fields[0].AsInteger;
  finally
  dmDespacho.GenNumFactura.Close;
  end;
end;

procedure TdmDespacho.tblDespachoDetBeforePost(DataSet: TDataSet);
begin
  if dmDespacho.tblDespachoDet.State in [dsInsert] then
  dmDespacho.tblDespachoDetNUMERO.Value:= dmDespacho.tblDespachoMasterNUMERO.Value;
end;

procedure TdmDespacho.tblDespachoMasterRepAfterScroll(DataSet: TDataSet);
begin
  if dmDespacho.tblDespachoDet.State In [dsInactive, dsBrowse] then
  begin
    QryRepDespachoDet.Close;
    QryRepDespachoDet.Params[0].Value:= dmDespacho.tblDespachoMasterRepNUMERO.Value;
    QryRepDespachoDet.Open;
    QryRepDespachoDet.RecordCount;
  end;
end;

procedure TdmDespacho.tblDespachoMasterRepAAfterScroll(DataSet: TDataSet);
begin
  if dmDespacho.tblDespachoDet.State In [dsInactive, dsBrowse] then
  begin
    QryRepDespachoDet.Close;
    QryRepDespachoDet.Params[0].Value:= dmDespacho.tblDespachoMasterRepANUMERO.Value;
    QryRepDespachoDet.Open;
  end;
end;

end.
