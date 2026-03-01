unit UFormEnviarEmailTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, StdCtrls, ExtDlgs, ComCtrls, ImgList, FileCtrl, Buttons,
  ShellApi, VCLUnZip, VCLZip, Gradiente, LinkDoc, WinSkinData;

type
  TfrmEnviarEmailTest = class(TForm)
    edtruta: TEdit;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    edtMensaje: TEdit;
    SkinData1: TSkinData;
    Gradiente1: TGradiente;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    Function ProcZipFileLVenta(_path : String;var targetFile:string) : Boolean;
    Function ProcCompilarFileLVenta(_path : String;var targetFile:string) : Boolean;
    Procedure EnviaEmail(_archivoZip :string);

  public
    { Public declarations }

  end;

var
  frmEnviarEmailTest: TfrmEnviarEmailTest;

implementation
uses UGlobal, UDatmodDatosGenerales, UDatModCompania;
{$R *.dfm}

procedure TfrmEnviarEmailTest.FormCreate(Sender: TObject);
begin
  edtruta.Text:= GlbRutaLibroVentas;
  DirectoryListBox1.Directory := GlbRutaLibroVentas
end;

procedure TfrmEnviarEmailTest.Button1Click(Sender: TObject);
var
 options : TSelectDirOpts;
  chosenDirectory : string;
begin
  chosenDirectory := edtruta.Text;
  if Selectdirectory(chosenDirectory, options, 0) then
  edtruta.Text := chosenDirectory;
  DirectoryListBox1.Directory := edtruta.Text;
end;

procedure TfrmEnviarEmailTest.BitBtn1Click(Sender: TObject);
var
  _targetFile : String;
begin
  if FileListBox1.SelCount = 0 then
  begin
    MessageDlg('Favor seleccionar el/los archivos a enviar.',mtInformation,[mbok],0);
    exit;
  end;
  GlbEnviaEmail := False;
  if ProcZipFileLVenta(DirectoryListBox1.Directory, _targetFile) then
  begin
    GlbEnviaEmail := True;
    EnviaEmail(_targetFile);
  end;
end;

function TfrmEnviarEmailTest.ProcCompilarFileLVenta(_path: String;
  var targetFile: string): Boolean;
var
  flag : boolean;
  VCLZip1 : TVCLZip;
  targetFilneName: string;
  sCmd : string;
  x : Integer;
begin
  flag:= True;
  try
    targetFile := ExtractFilePath(_path)+ExtractFileName(_path); //+'.zip';
    targetFile:=StringReplace(targetFile,ExtractFileDrive(targetFile),'',[rfReplaceAll]);
    targetFilneName:=StringReplace(targetFile,'\','',[rfReplaceAll]);
    targetFile := _path+'\'+targetFilneName+'.zip';
    if not DirectoryExists(_path+'\temp') then
    if Not CreateDir(_path+'\temp') then
    begin
      WriteToLog('Directorio '+'"'+_path+'\temp '+'"'+'no fue creado');
    end;

    For x:=0 to FileListBox1.SelCount -1 do
    begin
      CopyFile(PAnsichar(_path+'\'+FileListBox1.Items[x]),PAnsichar(_path+'\temp\'+FileListBox1.Items[x]),true);
    end;

    //sCmd := 'PreparaZFiles.bat ' +' '+_path+'\temp\*.* '+_path+'\LVentasDiariosMes.txt';
    //ShellExecute(application.handle, 'open', 'cmd', PChar(sCmd), nil, SW_NORMAL);
    //t ShellExecute(0, 'open', PChar('cmd PreparaZFiles.bat'), PAnsichar(_path+'\temp\*.* '+_path+'\LVentasDiariosMes.txt'),nil, SW_SHOWDEFAULT);
    //if ShellExecute(0, 'open', 'PreparaZFiles.bat',PAnsichar(_path+'\temp\*.* '+_path+'\LVentasDiariosMes.txt'), nil, SW_SHOWNORMAL) <= 32 then
    //Application.MessageBox('No se pudo ejecutar el proceso por lotes','Error', MB_ICONEXCLAMATION);

    sCmd:='C:\Proyectos\PointSaleSoftResp\PuntoVenta\Bin\PreparaZFiles.bat - Shortcut.lnk'; // if.bat - Shortcut';
    if ShellExecute(0, 'Open', PChar(sCmd), PChar(_path+'\temp\*.* '+_path+'\LVentasDiariosMes.txt'), PChar(''), SW_SHOWNORMAL) <= 32 then
    Application.MessageBox('No se pudo ejecutar el proceso por lotes','Error', MB_ICONEXCLAMATION);

    GlbRemoveDirectory(_path+'\temp');
  except
  end;
end;

function TfrmEnviarEmailTest.ProcZipFileLVenta(_path: String;
  var targetFile: string): Boolean;
var
  flag : boolean;
  VCLZip1 : TVCLZip;
  targetFilneName: string;
  sCmd : string;
  x : Integer;
  tmp : string;
begin
  flag:= True;
  try
    targetFile := ExtractFilePath(_path)+ExtractFileName(_path); //+'.zip';
    targetFile:=StringReplace(targetFile,ExtractFileDrive(targetFile),'',[rfReplaceAll]);
    targetFilneName:=StringReplace(targetFile,'\','',[rfReplaceAll]);
    targetFile := _path+'\'+targetFilneName+'.zip';
    
    VCLZip1:= TVCLZip.Create(Nil);
    VCLZip1.ZipName := targetFile;//'C:\Proyectos\LoanProcessCE\Bin\CobrosTestVcZip.zip';
    For x:=0 to FileListBox1.Count -1 do
    //For x:=0 to FileListBox1.SelCount -1 do
    begin
      if FileListBox1.Selected[x] then
      begin
        tmp:=FileListBox1.Items[x];
        VCLZip1.FilesList.Add(_path+'\'+FileListBox1.Items[x]);
      end;
    end;
    VCLZip1.Zip;
  except
  flag:=False;
  end;
  result:=flag;
end;

procedure TfrmEnviarEmailTest.EnviaEmail(_archivoZip: string);
begin
  GlbIDTipoEmail := 99; //test
  Application.ProcessMessages;
  dmdatos.qryEmailProceso.Close;
  dmdatos.qryEmailProceso.Params[0].Value := GlbIDTipoEmail;
  dmdatos.qryEmailProceso.Open;
  dmdatos.qryEmailProceso.First;
  if dmdatos.qryEmailProceso.RecordCount = 1 then
  begin
    if (dmdatos.qryEmailProcesoSTATUS.Value = 'A') then
    begin
      if (GlbEnviaEmail) then
      begin
        //if ProcZipFile(aFileName, targetFile) then
        if FileExists(_archivoZip) then
        begin
          if dmCompania.tblCompania.State = dsInactive then
          dmCompania.tblCompania.open;
          dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
          //1=smtp.idesisa.com.netsolmail.net
          ProcLogTrackingEmail(glbidtipoemail,dmdatos.qryEmailProcesoEMAIL_SERVER.Value,
          dmdatos.qryEmailProcesoPORT.AsString,dmdatos.qryEmailProcesoUSER_EMAIL.Value,
          Desencriptar(dmdatos.qryEmailProcesoUSER_PASSWORD.Value,2005),
          now,dmdatos.qryEmailProcesoTOEMAIL.Value,dmdatos.qryEmailProcesoFROMEMAIL.Value,
          dmdatos.qryEmailProcesoSUBJECT.Value+'-'+
          TRIM(dmCompania.tblCompaniaNOMBRE.Value)+
          '-'+Trim(dmCompania.tblCompaniaNUM_SUCURSAL.AsString)+' '+FormatDateTime('dd/mm/yy HH:MM',now),
          edtMensaje.Text,
          VarUsuarioGlb,'A','',now,strusername,FormatDateTime('dd/mm/yyyy hh:mm a/p', Now),
          strusername,_archivoZip,
          dmCompania.tblCompaniaEMAIL.Value,
          dmCompania.tblCompaniaNOMBRE.Value);
        end;
        GlbEnviaEmail:=False;
      end;
    end;
  end;
end;

procedure TfrmEnviarEmailTest.BitBtn2Click(Sender: TObject);
var
  _targetFile : String;
begin
  if ProcCompilarFileLVenta(DirectoryListBox1.Directory, _targetFile) then
  begin
    //Archivo creado y folder temporal eliminado
  end;
end;

end.
