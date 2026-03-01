unit UDatModRegOpeDiaria;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery;

type
  TdtmTransOpeDiaria = class(TDataModule)
    tblRegTransOpeDiariaMast: TIBDataSet;
    dstblRegTransOpeDiariaMast: TDataSource;
    tblRegTransOpeDiariaDet: TIBDataSet;
    dstblRegTransOpeDiariaDet: TDataSource;
    tblRegTransOpeDiariaMastNUMERO: TIntegerField;
    tblRegTransOpeDiariaMastCOD_PROVEEDOR: TIntegerField;
    tblRegTransOpeDiariaMastFECHA: TDateTimeField;
    tblRegTransOpeDiariaMastFPAGO: TSmallintField;
    tblRegTransOpeDiariaMastOBSERVACION: TIBStringField;
    tblRegTransOpeDiariaMastMONTO: TFloatField;
    tblRegTransOpeDiariaMastSTATUS: TIBStringField;
    tblRegTransOpeDiariaMastSTATUS_CNT: TIBStringField;
    tblRegTransOpeDiariaMastIN_POR: TIBStringField;
    tblRegTransOpeDiariaMastFECHA_IN: TDateTimeField;
    tblRegTransOpeDiariaMastMOD_POR: TIBStringField;
    tblRegTransOpeDiariaMastFECHA_MOD: TDateTimeField;
    tblRegTransOpeDiariaDetSERIE: TFloatField;
    tblRegTransOpeDiariaDetNUMERO: TIntegerField;
    tblRegTransOpeDiariaDetCOD_SERV_PROD: TIntegerField;
    tblRegTransOpeDiariaDetDEPARTAMENTO: TIntegerField;
    tblRegTransOpeDiariaDetOBSERVACION: TIBStringField;
    tblRegTransOpeDiariaDetCANTIDAD: TFloatField;
    tblRegTransOpeDiariaDetPRECIO: TFloatField;
    tblRegTransOpeDiariaDetVALOR: TFloatField;
    tblRegTransOpeDiariaDetNUMERO_DOCUMENTO: TIntegerField;
    tblRegTransOpeDiariaDetNUMERO_FACTURA: TIntegerField;
    tblRegTransOpeDiariaDetCOD_CTA_CONCEPTO: TIntegerField;
    tblRegTransOpeDiariaDetCODIGO_USUARIO: TIntegerField;
    tblRegTransOpeDiariaDetSTATUS: TIBStringField;
    tblRegTransOpeDiariaDetIN_POR: TIBStringField;
    tblRegTransOpeDiariaDetFECHA_IN: TDateTimeField;
    tblRegTransOpeDiariaDetMOD_POR: TIBStringField;
    tblRegTransOpeDiariaDetFECHA_MOD: TDateTimeField;
    tblCondicion: TIBTable;
    dstblCondicion: TDataSource;
    tblCondicionCODIGO: TIntegerField;
    tblCondicionDESCRIPCION: TIBStringField;
    tblProveedores: TIBDataSet;
    tblProveedoresCODIGO_CTE: TIntegerField;
    tblProveedoresTIPO_CLIENTE: TIntegerField;
    tblProveedoresDESCRIPCION: TIBStringField;
    tblProveedoresCONTACTO: TIBStringField;
    tblProveedoresPAIS: TIBStringField;
    tblProveedoresESTADO: TIBStringField;
    tblProveedoresCIUDAD: TIBStringField;
    tblProveedoresCALYYNUM: TIBStringField;
    tblProveedoresTELEFONO: TIBStringField;
    tblProveedoresFAX: TIBStringField;
    tblProveedoresCODIGOPOSTAL: TIBStringField;
    tblProveedoresEMAIL: TIBStringField;
    tblProveedoresDIRECCIONWEB: TIBStringField;
    tblProveedoresSTATUS: TIBStringField;
    tblProveedoresFECHA_IN: TDateTimeField;
    tblProveedoresIN_POR: TIBStringField;
    tblProveedoresFECHA_MOD: TDateTimeField;
    tblProveedoresMOD_POR: TIBStringField;
    qryProveedor: TIBQuery;
    qryProveedorCODIGO_CTE: TIntegerField;
    qryProveedorTIPO_CLIENTE: TIntegerField;
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
    dsqryProveedor: TDataSource;
    qryCentroCostos: TIBQuery;
    dsqryCentroCostos: TDataSource;
    qryDeptos: TIBQuery;
    dsqryDeptos: TDataSource;
    qryDeptosCODIGO: TSmallintField;
    qryDeptosNOMBRE: TIBStringField;
    qryDeptosSTATUS: TIBStringField;
    qryDeptosFECHA_IN: TDateTimeField;
    qryDeptosIN_POR: TIBStringField;
    qryDeptosFECHA_MOD: TDateTimeField;
    qryDeptosMOD_POR: TIBStringField;
    qryProdServicio: TIBQuery;
    dsqryProdServicio: TDataSource;
    tblProductosServicios: TIBDataSet;
    dstblProductosServicios: TDataSource;
    tblProductosServiciosCODIGO: TIntegerField;
    tblProductosServiciosDESCRIPCION: TIBStringField;
    tblCentroDeCostos: TIBTable;
    tblCentroDeCostosCODIGO: TIntegerField;
    tblCentroDeCostosNOMBRE: TIBStringField;
    tblCentroDeCostosCODDGII: TIntegerField;
    dstblCentroDeCostos: TDataSource;
    tblCargoEmp: TIBTable;
    tblCargoEmpCODIGO: TIntegerField;
    tblCargoEmpNOMBRE: TIBStringField;
    tblCargoEmpSTATUS: TIBStringField;
    tblCargoEmpIN_POR: TIBStringField;
    tblCargoEmpFECHA_IN: TDateTimeField;
    tblCargoEmpMOD_POR: TIBStringField;
    tblCargoEmpFECHA_MOD: TDateTimeField;
    dstblCargoEmp: TDataSource;
    tblTurno: TIBTable;
    tblTurnoCODIGO_TURNO: TIntegerField;
    tblTurnoDESCRIPCION: TIBStringField;
    tblTurnoHORAINI: TDateTimeField;
    tblTurnoHORAFIN: TDateTimeField;
    tblTurnoSTATUS: TIBStringField;
    dstblTurno: TDataSource;
    tblProveedoresRNC_PROVEEDOR: TIBStringField;
    procedure tblRegTransOpeDiariaMastAfterScroll(DataSet: TDataSet);
    procedure tblRegTransOpeDiariaDetBeforePost(DataSet: TDataSet);
    procedure tblRegTransOpeDiariaDetCANTIDADChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmTransOpeDiaria: TdtmTransOpeDiaria;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdtmTransOpeDiaria.tblRegTransOpeDiariaMastAfterScroll(
  DataSet: TDataSet);
begin
  if tblRegTransOpeDiariaDet.State in [dsInactive,dsBrowse] then
  begin
    tblRegTransOpeDiariaDet.Close;
    tblRegTransOpeDiariaDet.Params[0].Value:= tblRegTransOpeDiariaMastNUMERO.Value;
    tblRegTransOpeDiariaDet.Open;
  end;
end;

procedure TdtmTransOpeDiaria.tblRegTransOpeDiariaDetBeforePost(
  DataSet: TDataSet);
begin
  if dtmTransOpeDiaria.tblRegTransOpeDiariaDetNUMERO.IsNull then
  dtmTransOpeDiaria.tblRegTransOpeDiariaDetNumero.Value:=
  dtmTransOpeDiaria.tblRegTransOpeDiariaMastNUMERO.Value;
end;

procedure TdtmTransOpeDiaria.tblRegTransOpeDiariaDetCANTIDADChange(
  Sender: TField);
begin
  tblRegTransOpeDiariaDetVALOR.Value := tblRegTransOpeDiariaDetCANTIDAD.Value *
                                        tblRegTransOpeDiariaDetPRECIO.Value;
end;

end.
