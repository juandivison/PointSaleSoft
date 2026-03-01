unit UDatModConectarOrigen;
//C:\Proyectos\PointSaleSoftResp\PuntoVenta\Datos\Cesar\DBDATOS_DIST.GDB
//C:\Documents and Settings\DIVISON\My Documents\My Received Files\DBDATOS_DIST.GDB anterior
//C:\Proyectos\PointSaleSoftVH\PuntoVenta\Datos\Prod\DBDATOS.GDB actual

interface

uses
  SysUtils, Classes, IBDatabaseInfo, IBDatabase, DB, dialogs, controls,
  IBEvents;

type
  TdmConectarOrigen = class(TDataModule)
    IBDatabase1: TIBDatabase;
    
    IBTransaction1: TIBTransaction;
    IBDatabaseInfo1: TIBDatabaseInfo;
    IBEvents1: TIBEvents;
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
  dmConectarOrigen: TdmConectarOrigen;

implementation


{$R *.dfm}

procedure TdmConectarOrigen.IBDatabase1Login(Database: TIBDatabase;
  LoginParams: TStrings);
begin
  if Not dmconectarOrigen.IBDatabase1.TestConnected then
  begin
    MessageDlg('Se detectó que no hay conexión con la base de datos. '#13''+
    'La aplicación se cerrará',mtInformation, [mbOK], 0);
    Halt;
  end;
end;

procedure TdmConectarOrigen.IBEvents1Error(Sender: TObject; ErrorCode: Integer);
var xxx : integer;
begin
 xxx:=Errorcode;
 if not dmconectarOrigen.IBDatabase1.Connected then
 if not dmconectarOrigen.IBDatabase1.TestConnected then
  begin
    MessageDlg('Se detectó que no hay conexión con la base de datos. '#13''+
    'La aplicación se cerrará',mtInformation, [mbOK], 0);
    Halt;
  end;
end;

procedure TdmConectarOrigen.IBEvents1EventAlert(Sender: TObject;
  EventName: String; EventCount: Integer; var CancelAlerts: Boolean);
  var
    x : string;
begin
  x:= EventName;
end;

end.
