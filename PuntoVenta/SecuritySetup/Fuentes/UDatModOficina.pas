unit UDatModOficina;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable;

type
  TdmOficina = class(TDataModule)
    tblOficina: TIBTable;
    dstblOficina: TDataSource;
    tblOficinaCODIGO: TIntegerField;
    tblOficinaDESCRIPCION: TIBStringField;
    tblOficinaCODIGO_CIUDDAD: TIntegerField;
    tblCiudades: TIBTable;
    tblCiudadesCODIGO: TIntegerField;
    tblCiudadesDESCRIPCION: TIBStringField;
    tblCiudadesVALOR: TFloatField;
    tblCiudadesSTATUS: TIBStringField;
    dstblCiudades: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmOficina: TdmOficina;

implementation

uses UDatModCon;

{$R *.dfm}

end.
