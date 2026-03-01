unit UDatModBanco;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TdmBancos = class(TDataModule)
    qryBancos: TIBQuery;
    qryBancosDet: TIBQuery;
    qryBancosDetSERIE: TFloatField;
    qryBancosDetCODIGO: TSmallintField;
    qryBancosDetTIPO: TIBStringField;
    qryBancosDetCUENTA_BANCO: TIBStringField;
    qryBancosDetMONEDA: TIBStringField;
    qryBancosDetCUENTA1: TIBStringField;
    qryBancosDetCUENTA2: TIBStringField;
    qryBancosDetCUENTA3: TIBStringField;
    qryBancosDetSTATUS: TIBStringField;
    qryBancosDetBALANCEACT: TFloatField;
    qryBancosDetFECHA_ULT_TRN: TDateTimeField;
    qryBancosCODIGO: TSmallintField;
    qryBancosCIA_KEY: TIntegerField;
    qryBancosDESCRIPCION: TIBStringField;
    qryBancosCODIGO_ABR: TIBStringField;
    qryBancosCHEQUES_BANCO_INI: TIBStringField;
    procedure qryBancosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBancos: TdmBancos;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdmBancos.qryBancosAfterScroll(DataSet: TDataSet);
begin
  dmBancos.qryBancosDet.Close;
  dmBancos.qryBancosDet.Params[0].Value:= dmBancos.qryBancosCODIGO.Value;
  dmBancos.qryBancosDet.Open;
end;

end.
