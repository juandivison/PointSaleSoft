unit UDatmodPermisos;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBStoredProc;

type
  Tdmpermisos = class(TDataModule)
    qryUsuarios: TIBQuery;
    IBStoredProc1: TIBStoredProc;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmpermisos: Tdmpermisos;

implementation

uses UDatModCon;

{$R *.dfm}

end.
