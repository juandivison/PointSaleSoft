unit UDatModConectar;

interface

uses
  SysUtils, dialogs, IBEvents, IBDatabaseInfo, IBDatabase, Classes,
  DB;

type
  TdmCon = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBDatabaseInfo1: TIBDatabaseInfo;
    IBEvents1: TIBEvents;
    procedure IBDatabase1BeforeConnect(Sender: TObject);
    procedure IBDatabase1Login(Database: TIBDatabase;
      LoginParams: TStrings);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCon: TdmCon;

implementation

uses UConectar;

{$R *.dfm}

procedure TdmCon.IBDatabase1BeforeConnect(Sender: TObject);
begin
  frmInciaConeccion:=TfrmInciaConeccion.Create(Nil);
  try
    if frmInciaConeccion.MostrarVentana then
    frmInciaConeccion.Showmodal else
    frmInciaConeccion.BitBtn1Click(Self);
  finally
  frmInciaConeccion.Free;
  frmInciaConeccion := Nil;
  end;
end;

procedure TdmCon.IBDatabase1Login(Database: TIBDatabase;
  LoginParams: TStrings);
begin
  if Not dmCon.IBDatabase1.TestConnected then
  begin
    MessageDlg('Se detectó que no hay coneccion con la base de datos. '#13''+
    'La aplicación se cerrará',mtInformation, [mbOK], 0);
    Halt;
  end;
end;

end.
