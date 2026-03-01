//C:\Proyectos\Datos\Repositorio\PuntoVenta\Electronica\prod\live\EGDBPointSaleSoft.FDB
//C:\Proyectos\PuntoVentas\Datos\EGDBPointSaleSoft.FDB
unit UDMdb;

interface

uses
  SysUtils, Classes, Dialogs,IBEvents, IBDatabaseInfo, IBDatabase, DB;

type
  Tdmconectar = class(TDataModule)
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
  dmconectar: Tdmconectar;

implementation

{$R *.dfm}

procedure Tdmconectar.IBDatabase1Login(Database: TIBDatabase;
  LoginParams: TStrings);
begin
  if Not dmconectar.IBDatabase1.TestConnected then
  begin
    MessageDlg('Se detectó que no hay conexión con la base de datos. '#13''+
    'La aplicación se cerrará',mtInformation, [mbOK], 0);
    Halt;
  end;
end;

procedure Tdmconectar.IBEvents1Error(Sender: TObject; ErrorCode: Integer);
var xxx : integer;
begin
  try
  xxx:=Errorcode;
  if Not dmconectar.IBDatabase1.Connected then
  if Not dmconectar.IBDatabase1.TestConnected then
  begin
    try
      dmconectar.IBDatabase1.Close;
    except
    end;
    if Not dmconectar.IBDatabase1.Connected then
    if Not dmconectar.IBDatabase1.TestConnected then
    MessageDlg('Se detectó que no hay conexión con la base de datos. '#13''+
    'La aplicación se cerrará.', mtInformation, [mbOK], 0);
    Halt;
  end;
  except
    MessageDlg('Se detectó que no hay conexión con la base de datos. '#13''+
    'La aplicación se cerrará.', mtInformation, [mbOK], 0);
    Halt;  
  end;
end;

procedure Tdmconectar.IBEvents1EventAlert(Sender: TObject; EventName: String;
  EventCount: Integer; var CancelAlerts: Boolean);
  var
    x : string;
begin
  x:= EventName;
end;

end.
