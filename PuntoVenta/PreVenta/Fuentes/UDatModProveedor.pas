unit UDatModProveedor;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TdmProveedor = class(TDataModule)
    dmProveedor: TIBDataSet;
    DataSource1: TDataSource;
    dmProveedorCODIGO_CTE: TIntegerField;
    dmProveedorTIPO_CLIENTE: TIntegerField;
    dmProveedorDESCRIPCION: TIBStringField;
    dmProveedorCONTACTO: TIBStringField;
    dmProveedorPAIS: TIBStringField;
    dmProveedorESTADO: TIBStringField;
    dmProveedorCIUDAD: TIBStringField;
    dmProveedorCALYYNUM: TIBStringField;
    dmProveedorTELEFONO: TIBStringField;
    dmProveedorFAX: TIBStringField;
    dmProveedorCODIGOPOSTAL: TIBStringField;
    dmProveedorEMAIL: TIBStringField;
    dmProveedorDIRECCIONWEB: TIBStringField;
    dmProveedorSTATUS: TIBStringField;
    dmProveedorFECHA_IN: TDateTimeField;
    dmProveedorIN_POR: TIBStringField;
    dmProveedorFECHA_MOD: TDateTimeField;
    dmProveedorMOD_POR: TIBStringField;
    qryProveCxp: TIBQuery;
    qryProveCxpCODIGO_CTE: TIntegerField;
    qryProveCxpTIPO_CLIENTE: TIntegerField;
    qryProveCxpDESCRIPCION: TIBStringField;
    qryProveCxpCONTACTO: TIBStringField;
    qryProveCxpPAIS: TIBStringField;
    qryProveCxpESTADO: TIBStringField;
    qryProveCxpCIUDAD: TIBStringField;
    qryProveCxpCALYYNUM: TIBStringField;
    qryProveCxpTELEFONO: TIBStringField;
    qryProveCxpFAX: TIBStringField;
    qryProveCxpCODIGOPOSTAL: TIBStringField;
    qryProveCxpEMAIL: TIBStringField;
    qryProveCxpDIRECCIONWEB: TIBStringField;
    qryProveCxpSTATUS: TIBStringField;
    qryProveCxpBALANCE_ACT: TFloatField;
    qryProveedores: TIBQuery;
    dsqryProveedores: TDataSource;
    qryProveedoresCODIGO_CTE: TIntegerField;
    qryProveedoresTIPO_CLIENTE: TIntegerField;
    qryProveedoresDESCRIPCION: TIBStringField;
    qryProveedoresCONTACTO: TIBStringField;
    qryProveedoresPAIS: TIBStringField;
    qryProveedoresESTADO: TIBStringField;
    qryProveedoresCIUDAD: TIBStringField;
    qryProveedoresCALYYNUM: TIBStringField;
    qryProveedoresTELEFONO: TIBStringField;
    qryProveedoresFAX: TIBStringField;
    qryProveedoresCODIGOPOSTAL: TIBStringField;
    qryProveedoresEMAIL: TIBStringField;
    qryProveedoresDIRECCIONWEB: TIBStringField;
    qryProveedoresSTATUS: TIBStringField;
    qryProveedoresFECHA_IN: TDateTimeField;
    qryProveedoresIN_POR: TIBStringField;
    qryProveedoresFECHA_MOD: TDateTimeField;
    qryProveedoresMOD_POR: TIBStringField;
    qryProveedoresRNC_PROVEEDOR: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmProveedor: TdmProveedor;

implementation

uses UDatModConectar;



{$R *.dfm}

end.
