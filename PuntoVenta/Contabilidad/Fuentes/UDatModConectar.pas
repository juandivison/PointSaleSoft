unit UDatModConectar;
//C:\Proyectos\PointSaleSoftResp\PuntoVenta\Datos\Cesar\DBDATOS_DIST.GDB
//C:\Documents and Settings\DIVISON\My Documents\My Received Files\DBDATOS_DIST.GDB anterior
//C:\Proyectos\PointSaleSoftVH\PuntoVenta\Datos\Prod\DBDATOS.GDB actual

interface

uses
  SysUtils, Classes, IBDatabaseInfo, IBDatabase, DB, dialogs, controls,
  IBEvents;

type
  TdmCon = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBDatabaseInfo1: TIBDatabaseInfo;
    IBEvents1: TIBEvents;
    procedure IBDatabase1BeforeConnect(Sender: TObject);
    procedure IBDatabase1Login(Database: TIBDatabase;
      LoginParams: TStrings);
    procedure IBEvents1Error(Sender: TObject; ErrorCode: Integer);
    procedure IBEvents1EventAlert(Sender: TObject; EventName: String;
      EventCount: Integer; var CancelAlerts: Boolean);
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

procedure TdmCon.IBEvents1Error(Sender: TObject; ErrorCode: Integer);
var xxx : integer;
begin
  xxx := Errorcode;
  if Not dmCon.IBDatabase1.Connected Then
  if Not dmCon.IBDatabase1.TestConnected Then
  begin
    MessageDlg('Se detectó que no hay coneccion con la base de datos. '#13'' +
    'La aplicación se cerrará', mtInformation, [mbOK], 0);
    Halt;
  end;
end;

procedure TdmCon.IBEvents1EventAlert(Sender: TObject;
  EventName: String; EventCount: Integer; var CancelAlerts: Boolean);
  var
    x : string;
begin
  x:=EventName;
end;

end.
