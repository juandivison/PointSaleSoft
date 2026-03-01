unit UDatModCostos;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet;

type
  TdmCostos = class(TDataModule)
    tblRegOrdenMast: TIBDataSet;
    tblRegOrdenDet: TIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCostos: TdmCostos;

implementation

uses UDatModConectar;

{$R *.dfm}

end.
