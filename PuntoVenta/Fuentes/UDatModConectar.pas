unit UDatModConectar;

interface
                           
uses
  IBDatabaseInfo, IBDatabase, Classes,  DB, IBCustomDataSet, IBQuery, IBEvents,
  SysUtils, Dialogs, controls;
   
type
  TdmConectar = class(TDataModule)
    IBDatabase1: TIBDatabase;

    IBTransaction1: TIBTransaction;
    IBDatabaseInfo1: TIBDatabaseInfo;
    IBEvents1: TIBEvents;
    qryMaxGeneradores: TIBQuery;
    qryMaxGeneradoresORDEN: TIntegerField;
    qryMaxGeneradoresTABLA: TIBStringField;
    qryMaxGeneradoresSERIE: TFloatField;
    qryMaxGeneradoresGENERADORSEC: TIntegerField;
    qryMaxGeneradoresNOMB_GENERADOR: TIBStringField;
    qryMaxGeneradoresCAMPO: TIBStringField;
    IBDatabase2: TIBDatabase;                                
    IBTransaction2: TIBTransaction;
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
  if Not dmconectar.IBDatabase1.TestConnected then
  begin
    MessageDlg('Se detectó que no hay conexión con la base de datos. '#13''+
    'La aplicación se cerrará',mtInformation, [mbOK], 0);
    Halt;
  end;
end;

procedure TdmConectar.IBEvents1Error(Sender: TObject; ErrorCode: Integer);
//var xxx : integer;
begin
  try                     
  //xxx:=Errorcode;
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

procedure TdmConectar.IBEvents1EventAlert(Sender: TObject;
  EventName: String; EventCount: Integer; var CancelAlerts: Boolean);
  var
    x : string;
begin
  x:= EventName; 
end;
    
end.
