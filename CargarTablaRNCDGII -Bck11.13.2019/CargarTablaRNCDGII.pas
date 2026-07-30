unit CargarTablaRNCDGII;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBEvents, IBDatabaseInfo, IBDatabase, DB, IBSQL, StdCtrls,
  Buttons, IniFiles, Registry, IBCustomDataSet, IBQuery, Grids, DBGrids,
  RXDBCtrl, ComCtrls, WinSkinData, EditNew, ExtCtrls, RXClock, RXCtrls;

type
  TfrmMain = class(TForm)
    BitBtn1: TBitBtn;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBDatabaseInfo1: TIBDatabaseInfo;
    IBEvents1: TIBEvents;
    ibsqlInsertDatos: TIBSQL;
    qryDatosRNCDGII: TIBQuery;
    RxDBGrid1: TRxDBGrid;
    dsqryDatosRNCDGII: TDataSource;
    ProgressBar1: TProgressBar;
    edtRecordProc: TEditN;
    Label1: TLabel;
    edtnRecErr: TEditN;
    Label2: TLabel;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    RxClock1: TRxClock;
    ibsqlDeleteAll: TIBSQL;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    Label5: TLabel;
    qryDatosRNCDGIIRNC: TIBStringField;
    qryDatosRNCDGIIRAZONSOCIAL: TIBStringField;
    qryDatosRNCDGIINOMBRE_CIA: TIBStringField;
    qryDatosRNCDGIIACTIVIDAD: TIBStringField;
    qryDatosRNCDGIIDIR_CALLE: TIBStringField;
    qryDatosRNCDGIIDIR_NUMERO: TIBStringField;
    qryDatosRNCDGIISECTOR: TIBStringField;
    qryDatosRNCDGIITELEFONO: TIBStringField;
    qryDatosRNCDGIIFECHA_INI_OPE: TIBStringField;
    qryDatosRNCDGIISTATUS: TIBStringField;
    qryDatosRNCDGIICONDICION: TIBStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure IBDatabase1BeforeConnect(Sender: TObject);
    procedure IBDatabase1AfterConnect(Sender: TObject);
    procedure IBEvents1Error(Sender: TObject; ErrorCode: Integer);
  private
    { Private declarations }
    Function Split(Delimiter: Char;enumeracion : string): TStringList;
    procedure CreateLogfile;
    procedure WriteToLog(aLogMessage:String);

  public
    { Public declarations }
  end;

  const
      BreakingLine = '//----------------------------------------------------------------------------//';
var
  frmMain: TfrmMain;
  vkPararProceso : Boolean;
  GLBRUTABDGIITXT : String;
  GLBRUTADBDGII : String;
implementation

{$R *.dfm}

procedure TfrmMain.BitBtn1Click(Sender: TObject);
var f : TextFile;
     lineaactual : string;
     OutPutList: TStringList;
     recProc : integer;
     recErr : integer;
begin
  Label3.Caption:='Iniciado:' + TimeToStr(now);
  Label4.Caption:='Finalizado:';
  recProc:=0;
  recErr:=0;
  ProgressBar1.Position:=0;
  ProgressBar1.Max:=2100000;
  AssignFile(f,GLBRUTABDGIITXT);
  
  WriteToLog('Cargar RNC DGII');
  WriteToLog('UFormLoadDatosDGII');
  try
    reset(f);
    while not Eof(f) do
    begin
      if vkPararProceso then
      begin
        if MessageDlg('¿Detener proceso?',mtInformation,[mbyes,mbno],0) = mryes then
        break else vkPararProceso:=False;

      end;
      ProgressBar1.StepIt;
      Readln(f, lineaactual);  //creo que es así, busca en la ayuda de Delphi para asegurarte

      OutPutList := TStringList.Create;

      //if not ibsqlInsertDatos.Open then
      //ibsqlInsertDatos.CheckOpen;

      try
        OutPutList:=Split('|', lineaactual);
        //for i := 0 to OutPutList.Count-1 do
        begin
          try
          ibsqlInsertDatos.params[0].value := OutPutList[0];  //:RNC,
          ibsqlInsertDatos.params[1].value:= OutPutList[1];  //:RAZONSOCIAL,
          ibsqlInsertDatos.params[2].value:= '';//OutPutList[2];  //:NOMBRE_CIA,
          ibsqlInsertDatos.params[3].value:= '';//OutPutList[3];  //:ACTIVIDAD,
          ibsqlInsertDatos.params[4].value:= '';//OutPutList[4];  //:DIR_CALLE,
          ibsqlInsertDatos.params[5].value:= '';//OutPutList[5];  //:DIR_NUMERO,
          ibsqlInsertDatos.params[6].value:= '';//OutPutList[6];  //:SECTOR,
          ibsqlInsertDatos.params[7].value:= '';//OutPutList[7];  //:T ELEFONO,
          ibsqlInsertDatos.params[8].value:= '';//OutPutList[8];  //:FECHA_INI_OPE,
          ibsqlInsertDatos.params[9].value:= OutPutList[9];  //:STATUS,
          ibsqlInsertDatos.params[10].value:= OutPutList[10];  //:CONDICION

          ibsqlInsertDatos.ExecQuery;
          Inc(recProc);
          edtRecordProc.SetInteger(recProc);
          except
          Inc(recErr);
          edtnRecErr.SetInteger(recErr);
          WriteToLog('Record Error:');
          WriteToLog(lineaactual);
          end;
          Application.ProcessMessages;
        end;
      finally
      OutPutList.Free;
      end;
    end;
  finally
    Closefile(f);
    Label4.Caption:='Finalizado:' + TimeToStr(now);
  end;
  if ibsqlInsertDatos.Transaction.InTransaction then
  ibsqlInsertDatos.Transaction.StartTransaction;
  try
    ibsqlInsertDatos.Transaction.CommitRetaining;
  except
  ibsqlInsertDatos.Transaction.RollbackRetaining;
  end;
  
  qryDatosRNCDGII.Close;
  qryDatosRNCDGII.Open;
end;

procedure TfrmMain.WriteToLog(aLogMessage:String);
var
  T:TextFile;
FN:String;
begin
  //Exit;//Configurar aqui para usar Parametro

  // Getting the filename for the logfile (In this case the Filename is 'application-exename.log'
  FN := ChangeFileExt(Application.Exename, '.log');

  //Checking for file
  if (not FileExists(FN)) then
  begin
    // if file is not available then create a new file
    CreateLogFile;
  end;

  // Assigns Filename to variable F
  AssignFile(T, FN);
  // start appending text
  Append(T);
  WriteLn(T, DateTimeToStr(Now) + ': ' + aLogMessage);
  //Write a new line with current date and message to the file
  CloseFile(T)
  // Close file
end;

procedure TfrmMain.CreateLogfile;
var
  F:TextFile;
FN:String;
begin
  //Exit;//Configurar aqui para usar Parametro
  // Getting the filename for the logfile (In this case the Filename is 'application-exename.log'
  FN := ChangeFileExt(Application.Exename, '.log');
  // Assigns Filename to variable F

  AssignFile(F, FN);

  if FileExists(FN) then   // Open file for appending
  Append(f)
  else
  Rewrite(F);
  // Write text to Textfile F
  WriteLn(F, BreakingLine);
  WriteLn(F, 'This Logfile was created on ' + DateTimeToStr(Now));
  WriteLn(F, BreakingLine);
  WriteLn(F, '');
  // finally close the file
  CloseFile(F);

end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  Ini : TIniFile;
begin
  vkPararProceso:=False;
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'repconf_cr.ini');
  try
    GLBRUTADBDGII:= Ini.ReadString('DataBase', 'GLBRUTADBDGII', '');
    GLBRUTABDGIITXT:= Ini.ReadString('DataBase', 'GLBRUTABDGIITXT', '');
  finally
  Ini.Free;
  end;

  qryDatosRNCDGII.close;
  qryDatosRNCDGII.open;
  end;

function TfrmMain.Split(Delimiter: Char; enumeracion: string): TStringList;
var
        Aux : String;
        i : integer;
        Lista :TStringList;
begin
        enumeracion := trim(enumeracion);
        Lista := TStringList.Create;
        Aux := '';
        i:=1;
        while i <= length(Enumeracion) do begin
                if enumeracion[i] <> Delimiter then begin
                        Aux := Aux + enumeracion[i];
                end;
                if enumeracion[i] = Delimiter then begin
                        Lista.Add(trim(Aux));
                        Aux := '';
                end;
                inc(i);
        end;
        if Aux <> '' then begin
              Lista.Add(trim(Aux));
        end;
        result := lista;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
  vkPararProceso:= true;
end;

procedure TfrmMain.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Eliminar todos los records?',mtwarning,[mbyes,mbno],0) = mryes then Exit;

  ibsqlDeleteAll.ExecQuery;
  if ibsqlDeleteAll.Transaction.InTransaction then
  ibsqlDeleteAll.Transaction.StartTransaction;
  try
    ibsqlDeleteAll.Transaction.CommitRetaining;
  except
  ibsqlDeleteAll.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmMain.BitBtn4Click(Sender: TObject);
begin
  MessageDlg('En desarrollo',mtwarning,[mbok],0);
end;

procedure TfrmMain.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
  vkPararProceso:= true;
end;

procedure TfrmMain.btnCerarAbrirresClick(Sender: TObject);
begin
  qryDatosRNCDGII.close;
  qryDatosRNCDGII.open;
end;

procedure TfrmMain.IBDatabase1BeforeConnect(Sender: TObject);
begin
  IBDatabase1.Connected    := False;
  IBDatabase1.DatabaseName := Trim(GLBRUTADBDGII);
  if IBDatabase1.TestConnected = False then
  begin
    close;
  end else
  begin
    MessageDlg('La conección a la base de datos RNC DGII falló, verifique', mtInformation, [mbOK], 0);
    Halt;
  end;
end;

procedure TfrmMain.IBDatabase1AfterConnect(Sender: TObject);
begin
  Label5.Caption:='DB Connected';
end;

procedure TfrmMain.IBEvents1Error(Sender: TObject; ErrorCode: Integer);
begin
  Label5.Caption:='DB Error '+IntToStr(ErrorCode);
end;

end.
