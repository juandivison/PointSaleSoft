unit UConectar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Registry, RXCtrls, WinSkinData;

type
  TfrmInciaConeccion = class(TForm)
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    edtServidor: TEdit;
    Label2: TLabel;
    edtRuta: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RxLabel5: TRxLabel;
    RxLabel1: TRxLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LabelRuta: TLabel;
    edtNumPC: TEdit;
    Label6: TLabel;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    function GetComputerName : String;
    Procedure RegistrarRuta;
    Procedure LeerRuta;

  public
    { Public declarations }
    MostrarVentana : Boolean;
  end;

const
  SECTION = 'POSGOLDRESP';

var
  frmInciaConeccion: TfrmInciaConeccion;

  FIniFile: TRegIniFile;

implementation

uses UDatModCon, UDatModConectar, UGlobal;


{$R *.dfm}

procedure TfrmInciaConeccion.BitBtn1Click(Sender: TObject);
var
  strRuta : String;
begin
  //StrRuta:=  FIniFile.ReadString(SECTION, 'POSGOLDRESP', '');
  StrRuta:=  FIniFile.ReadString(SECTION, GLBRUTADB, '');

  dmConectar.IBDatabase1.Connected    := False;
  dmConectar.IBDatabase1.DatabaseName := Trim(StrRuta);
  GlbRutaDBActual :=dmConectar.IBDatabase1.DatabaseName;
  if dmConectar.IBDatabase1.TestConnected = False then
  begin
    close;
  end else
  begin
    MessageDlg('La conección a la base de datos falló, verifique', mtInformation, [mbOK], 0);
    Halt;
  end;
end;


procedure TfrmInciaConeccion.FormCreate(Sender: TObject);
var
   Registro: TRegistry;
   Servidor:String;
begin
   Registro := TRegistry.Create;
   FIniFile := TRegIniFile.Create('IDESI S.A.');
   LeerRuta;
   Registro.RootKey := HKEY_CURRENT_USER;
   Registro.OpenKey( 'Volatile Environment', False );
   edtServidor.Text := Registro.ReadString( 'LOGONSERVER' );
   Registro.CloseKey;
   Registro.Destroy;
   Servidor:=edtServidor.Text;
   if Pos('\\', Servidor) > 0 then
   Delete(servidor,1,2);
   edtServidor.Text := Servidor;
   OpenDialog1.InitialDir := Trim(edtRuta.Text);
   label4.caption:=GetComputerName;
end;

procedure TfrmInciaConeccion.BitBtn3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edtRuta.Text := OpenDialog1.FileName;
    RegistrarRuta;
  end;
end;


function TfrmInciaConeccion.GetComputerName: String;
var
   pcComputer : PChar;
   dwCSize    : DWORD;
begin
   dwCSize := MAX_COMPUTERNAME_LENGTH + 1;
   GetMem( pcComputer, dwCSize );
   try
      if Windows.GetComputerName( pcComputer, dwCSize ) then
         Result := pcComputer;
   finally
      FreeMem( pcComputer );
   end;
end;

procedure TfrmInciaConeccion.RegistrarRuta;
begin
  //FIniFile.WriteString(SECTION, 'POSGOLDRESP', Trim(edtServidor.Text) + ':' + Trim(edtRuta.Text));
  FIniFile.WriteString(SECTION, GLBRUTADB, Trim(edtServidor.Text) + ':' + Trim(edtRuta.Text));
  FIniFile.WriteString(SECTION, 'QtyPc', Trim(edtNumPC.Text));
end;

procedure TfrmInciaConeccion.LeerRuta;
var
  strRuta : String;
begin
  //StrRuta := FIniFile.ReadString(SECTION, 'POSGOLDRESP', '');
  StrRuta := FIniFile.ReadString(SECTION, GLBRUTADB, '');

  MostrarVentana := False;
  if (StrRuta = '') then
  begin
    MostrarVentana := True;
    RegistrarRuta;
  //LabelRuta.Caption := FIniFile.ReadString(SECTION, 'POSGOLDRESP', '');
    LabelRuta.Caption := FIniFile.ReadString(SECTION, GLBRUTADB, '');
    edtNumPC.Text := FIniFile.ReadString(SECTION, 'QtyPc', '');
  end else
  LabelRuta.Caption := StrRuta;
end;



end.
