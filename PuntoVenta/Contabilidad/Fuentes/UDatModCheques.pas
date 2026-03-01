unit UDatModCheques;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable;

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
    tblTipoctabanco: TIBTable;
    dstblTipoctabanco: TDataSource;
    tblTipoctabancoCODIGO: TIntegerField;
    tblTipoctabancoDESCRIPCION: TIBStringField;
    procedure qrybancosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmcks: Tdmcks;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure Tdmcks.qrybancosAfterScroll(DataSet: TDataSet);
begin
  if qrybancosdet.state in [dsinactive, dsbrowse] then
  begin
    qrybancosdet.close;
    qrybancosdet.Params[0].value:= qryBancosCodigo.value;
    qrybancosdet.open;
  end;
end;

end.
