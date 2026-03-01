unit UDatModFarmacia;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet;

type
  TdmFarmacia = class(TDataModule)
    IBDataSet1: TIBDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFarmacia: TdmFarmacia;

implementation

uses UDatModConectar;

{$R *.dfm}

end.
