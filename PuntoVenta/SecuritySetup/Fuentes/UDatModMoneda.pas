unit UDatModMoneda;

interface

uses
  SysUtils, Classes, IBSQL, DB, IBCustomDataSet, IBTable;

type
  TdmMoneda = class(TDataModule)
    qryibsqlTasa: TIBSQL;
    tblMoneda: TIBTable;
    tblMonedaCODIGO: TIBStringField;
    tblMonedaDESCRIPCION: TIBStringField;
    tblMonedaSIMBOLO: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMoneda: TdmMoneda;

implementation

uses UDatModCon;

{$R *.dfm}

end.
