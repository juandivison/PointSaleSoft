unit UDatModCon;

interface

uses
  SysUtils, Classes, IBDatabaseInfo, IBDatabase, DB;

type
  TdmCon = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBDatabaseInfo1: TIBDatabaseInfo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCon: TdmCon;

implementation

{$R *.dfm}

end.
