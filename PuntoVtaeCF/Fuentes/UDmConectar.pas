unit UDmConectar;

interface

uses
  SysUtils, Dialogs, Classes, IBEvents, IBDatabaseInfo, IBDatabase, DB;

type
  TdmConectar = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBDatabaseInfo1: TIBDatabaseInfo;
    IBEvents1: TIBEvents;
    procedure IBDatabase1BeforeConnect(Sender: TObject);
    procedure IBDatabase1Login(Database: TIBDatabase;
      LoginParams: TStrings);
    //procedure IBEvents1Error(Sender: TObject; ErrorCode: Integer);
    procedure IBEvents1Error(Sender: TObject; ErrorCode: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConectar: TdmConectar;

implementation

uses UConectar;

{$R *.dfm}

procedure TdmConectar.IBDatabase1BeforeConnect(Sender: TObject);
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

procedure TdmConectar.IBDatabase1Login(Database: TIBDatabase;
  LoginParams: TStrings);
begin
 if not dmConectar.IBDatabase1.TestConnected then
  begin
    MessageDlg('Se detectó que no hay conexión con la base de datos. '#13''+
    'La aplicación se cerrará',mtInformation, [mbOK], 0);
    Halt;
  end;
end;

procedure TdmConectar.IBEvents1Error(Sender: TObject; ErrorCode: Integer);
begin
 if not dmConectar.IBDatabase1.Connected then
 if not dmConectar.IBDatabase1.TestConnected then
  begin
    MessageDlg('Se detectó que no hay conexión con la base de datos. '#13''+
    'La aplicación se cerrará', mtInformation, [mbOK], 0);
    Halt;
  end;
end;

end.
