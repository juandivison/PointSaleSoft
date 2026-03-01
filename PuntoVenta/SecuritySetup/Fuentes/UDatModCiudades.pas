unit UDatModCiudades;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable;

type
  TdmCiudades = class(TDataModule)
    tblCiudades: TIBTable;
    dstblCiudades: TDataSource;
    tblCiudadesCODIGO: TIntegerField;
    tblCiudadesDESCRIPCION: TIBStringField;
    tblCiudadesVALOR: TFloatField;
    tblCiudadesSTATUS: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCiudades: TdmCiudades;

implementation

uses UDatModCon;

{$R *.dfm}

end.
