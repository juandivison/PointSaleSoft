unit UMainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Inifiles, ShellApi, Dialogs, StdCtrls;

type
  TfrmMenu = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Label4: TLabel;
    edtSourceFile: TEdit;
    Label5: TLabel;
    edtTargetFile: TEdit;
    Label6: TLabel;
    edtDbSource: TEdit;
    Label7: TLabel;
    edtTargetDbFile: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure VerificarArchivo;
    procedure TestInputParameter;
    function ParseParametroApp(valor : string): string;

    function DelphiSplit(const s: string; SepChr: Char): String;
    procedure DatosConfiguracion;
  public
    { Public declarations }
  end;

  Const dbFileName = 'DBRESIDENCIAL.FDB';
  Const appfileName = 'Residencial.exe';
var
  frmMenu: TfrmMenu;
  Fchkv : String;
  FSourceDBFile : String;
  FSourceAppFile: String;
  FTargetDBFile : String;
  FTargetAppFile: String;

  Salir : Boolean;
  VerificaVersion : Boolean;
    iniName : string;
    FDBStringValue:String;

implementation
 Uses UUtility, CmdLineHelper;
{$R *.dfm}

{ TForm1 }

procedure TfrmMenu.DatosConfiguracion;
var
  Ini: TIniFile;
  NombArchivo : String;
begin
 {
/SourceDBFile="D:\Residencial\Datos\DBRESIDENCIAL.FDB"
/TargetDBFile="D:\Residencial\Datos\bck\DBRESIDENCIAL.FDB"
/SourceAppFile="D:\Residencial\Bin\Residencial.exe"
/TargetAppFile="D:\Residencial\Bin\bck\Residencial.exe"
}
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+iniName;
  Ini := TIniFile.Create(NombArchivo);
  try
    //GLBRecalculaCFija := Ini.ReadInteger('Cobro', 'GLBRecalculaCFija', 0);

    Fchkv:= Ini.ReadString('AppLuncher','chkv','');
    FSourceDBFile := Ini.ReadString('AppLuncher','SourceDBFile','');
    FTargetDBFile := Ini.ReadString('AppLuncher','TargetDBFile','');

    FSourceAppFile := Ini.ReadString('AppLuncher','SourceAppFile','');
    FTargetAppFile := Ini.ReadString('AppLuncher','TargetAppFile','');
    FDBStringValue:=  Ini.ReadString('AppLuncher','DBStringValue','/GLBRUTADB="SamQA"');
  finally
  Ini.Free;
  end;
end;

procedure TfrmMenu.VerificarArchivo;
var
 CDate,MDate,ADate : TDateTime;
 FileFechaUdate : TDateTime;
 flagError : Boolean;
begin
 if GetFileTimes(FTargetDBFile, CDate, MDate, ADate) then
 begin
   FileFechaUdate:= MDate;
   Label1.Caption := 'Creado :'+FormatDateTime('dd/mm/yyyy hh:nn',CDate);
   Label2.Caption := 'Modificado :'+FormatDateTime('dd/mm/yyyy hh:nn',MDate);
   Label3.Caption := 'Accesado: '+FormatDateTime('dd/mm/yyyy hh:nn',ADate);
 end;
  if GetFileTimes(FSourceDBFile, CDate, MDate, ADate) then
 begin
   if (MDate > FileFechaUdate) then
   begin
     //try
     //  if not DeleteFile(FTargetDBFile) then
     //  Raise Exception.Create('DB - Imposible borrar archivo, verifique. '+FSourceDBFile);
     //except
     //flagError :=True;
     //end;
     //if (Not flagError) then
     //if not CopyFile(PChar(FSourceDBFile),PChar(FTargetDbFile),true) then
     //  Raise Exception.Create('DB -Imposible copiar archivo, verifique. '+FSourceDBFile);
   end;
 end;

 flagError := False;
 //Application exe file
 if GetFileTimes(FTargetAppFile, CDate, MDate, ADate) then
 begin
   FileFechaUdate:= MDate;
 end;
  if GetFileTimes(FSourceAppFile, CDate, MDate, ADate) then
 begin
   if (MDate > FileFechaUdate) then
   begin
     try
       if not DeleteFile(FTargetAppFile) then
       Raise Exception.Create('App - Imposible borrar archivo, verifique. '+FSourceDBFile);
     except
     flagError :=True;
     end;
     if (Not flagError) then
     if not CopyFile(PChar(FSourceAppFile),PChar(FTargetAppFile),true) then
       Raise Exception.Create('App -Imposible copiar archivo, verifique. '+FSourceDBFile);
   end;
 end;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
var
  chkv : string;
begin
  Salir := False;
  
  iniName:= 'appLunchConf001.ini';
  DatosConfiguracion;
   VerificaVersion:= (UpperCase(Fchkv) = 'TRUE') or (UpperCase(Fchkv) = 'Y');

  if VerificaVersion then
  begin
     VerificarArchivo;
  end;
  if Not Salir then
  begin
   if (FSourceAppFile <> '') then
   if (FileExists(FTargetAppFile)) then
   ShellExecute(frmMenu.Handle,nil,PChar(FTargetAppFile),PChar(FDBStringValue),'',SW_SHOWNORMAL);
   Halt(0);
  end;
end;

procedure TfrmMenu.Button1Click(Sender: TObject);
begin
  //ttttt   VerificarArchivo;
end;

procedure TfrmMenu.TestInputParameter;
var 
  idx : Integer;
begin
   with Memo1.Lines do
   begin 
    Clear; 

    //Add('CMD Line: ' + CmdLineHelper.GetCommandLine + #13#10) ;
    //Add('Number of params: ' + IntToStr(CmdLineHelper.GetParamCount) + #13#10) ;

     for idx := 1 to CmdLineHelper.GetParamCount do
     begin
       Memo1.Lines.Add(CmdLineHelper.GetParamStr(idx)) ; 
     end; 
   end;
end;

function TfrmMenu.ParseParametroApp(valor : string): string;
begin
  result := DelphiSplit(valor,'=');
end;

function TfrmMenu.DelphiSplit(const s: string; SepChr: Char) : String;
var
  p : Integer;
begin
  p := Pos (SepChr, s);
  if p <> 0 then result := Copy (s, p + 1, Length(s) - p)
  else result := s;
end;

end.
