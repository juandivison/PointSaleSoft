unit UFormBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ShellApi, IniFiles, Dialogs, StdCtrls, Buttons, WinSkinData;

type
  TfrmBackup = class(TForm)
    edtNombreDB: TEdit;
    Label1: TLabel;
    edtOrigenDB: TEdit;
    Label2: TLabel;
    edtDestinoDB: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    edtRutaFolderBin: TEdit;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CrearBatchfile(origen:String; destino:String);
    procedure CargaDatosIni;
    procedure GuardarDatosIni;
  public
    { Public declarations }
    isBackup : Integer;
  end;

var
  frmBackup: TfrmBackup;

implementation

{$R *.dfm}

procedure TfrmBackup.BitBtn1Click(Sender: TObject);
var
  archivo : String;
  target:string;
  fechaArchivo : String;
begin
  GuardarDatosIni;
  target:= ExtractFileName(edtDestinoDB.Text);
  if Not DirectoryExists(ExtractFilePath(edtDestinoDB.Text)) then
  begin
     if Not CreateDir(ExtractFilePath(edtDestinoDB.Text)) then
     MessageDlg('Imposible crear archivo, verifique', mtError, [mbok], 0);
     exit;
  end;
  fechaArchivo:='%date:~10,4%-%date:~4,2%-%date:~7,2%-%RANDOM%';
  //SET incremento=%RANDOM%
  //ECHO %fecha%-%INCREMENTO%.bck
  target:='"' + ExtractFilePath(edtDestinoDB.Text) + StringReplace(target,ExtractFileExt(target),'',[])+fechaArchivo+'.bck'+'"';
  CrearBatchfile('"'+edtOrigenDB.Text+'" ', target);

  //Temporal
  //exit;
  archivo:=ExtractFilePath(application.ExeName)+'\hacerBackup.bat - Shortcut.lnk'; // if.bat - Shortcut';
  ShellExecute(0, 'Open', PChar(archivo), PChar(''), PChar(''), SW_SHOWNORMAL);
end;

procedure TfrmBackup.CargaDatosIni;
var
  Ini: TIniFile;
  xruta, NombArchivo : String;
  x: integer;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );
  try
    xruta := Ini.ReadString('Backup','RutaBinRDB','');
    if (xruta <> '') then
    edtRutaFolderBin.Text := xruta
    else
    edtRutaFolderBin.Text:='INDICAR RUTA COMANDOS PARA BACKUP';
  finally
  Ini.Free;
  end;
end;

procedure TfrmBackup.CrearBatchfile(origen:String; destino:String);
var
   txtFile : TextFile;
   str : String;
 begin
   AssignFile(txtFile, 'hacerBackup.bat') ;
   Rewrite(txtFile) ;
   str := '"'+edtRutaFolderBin.Text +  '\gbak" -v -t -user SYSDBA -password sup2005 ';
   Write(txtFile,str);
   Write(txtFile,origen+' ');
   Writeln(txtFile,destino);
   Writeln(txtFile,'Pause');
   //gbak -v -t -user SYSDBA -password sup2005
   //F:\Datos\SuperGarcia\Prod\Julio\DBLOANPROC.FDB
   //F:\Datos\SuperGarcia\Prod\Julio\Backup\dbloanproc.fbk
   //SET fecha=%date:~10,4%-%date:~4,2%-%date:~7,2%
   //SET incremento=%RANDOM%
   //ECHO %fecha%-%INCREMENTO%.bck
   CloseFile(txtFile);
end;

procedure TfrmBackup.FormCreate(Sender: TObject);
begin
  CargaDatosIni;
end;

procedure TfrmBackup.GuardarDatosIni;
var
  Ini: TIniFile;
  NombArchivo : String;
  x: integer;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+'repconf_cr.ini';
  Ini := TIniFile.Create(NombArchivo );
  try
    if (edtRutaFolderBin.Text <> '') then
    Ini.WriteString('Backup', 'RutaBinRDB', edtRutaFolderBin.Text);
  finally
  Ini.Free;
  end;
end;

end.
