unit CargarTablaRNCDGII;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBEvents, IBDatabaseInfo, IBDatabase, DB, IBSQL, StdCtrls,
  Buttons, IniFiles, Registry, IBCustomDataSet, IBQuery, Grids, DBGrids,
  RXDBCtrl, ComCtrls, WinSkinData, EditNew, ExtCtrls, RXClock, RXCtrls,
  RxMemDS;

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
    qryConsulta: TIBQuery;
    ibsqlUpdate: TIBSQL;
    rxData: TRxMemoryData;
    rxDataInsertado: TIntegerField;
    rxDataActualizado: TIntegerField;
    RxDBGrid2: TRxDBGrid;
    dsrxData: TDataSource;
    Edit1: TEdit;
    Label6: TLabel;
    Button1: TButton;
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
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Function Split(Delimiter: Char;enumeracion : string): TStringList;
    procedure CreateLogfile;
    procedure WriteToLog(aLogMessage:String);
    function ExisteRNC(_rnc:string):boolean;
    procedure InsertaEstadistica;
    procedure UpdateEstadistica;
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
  if qryDatosRNCDGII.RecordCount = 0 then
  ProgressBar1.Max:=785300
  else
  ProgressBar1.Max:=qryDatosRNCDGII.RecordCount;
  
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
        lineaactual:=StringReplace(lineaactual,'''',''''+chr(39),[rfReplaceAll]);
        OutPutList:=Split('|', lineaactual);

        //for i := 0 to OutPutList.Count-1 do
        begin
          try
          if Not ExisteRNC(OutPutList[0]) then
          begin
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
            InsertaEstadistica;
          end else //actualizar
          begin
            {ibsqlUpdate.params[0].value := OutPutList[0];  //:RNC,
            ibsqlUpdate.params[1].value:= OutPutList[1];  //:RAZONSOCIAL,
            ibsqlUpdate.params[2].value:= OutPutList[2];  //:NOMBRE_CIA,
            ibsqlUpdate.params[3].value:= OutPutList[3];  //:ACTIVIDAD,
            ibsqlUpdate.params[4].value:= OutPutList[4];  //:DIR_CALLE,
            ibsqlUpdate.params[5].value:= OutPutList[5];  //:DIR_NUMERO,
            ibsqlUpdate.params[6].value:= OutPutList[6];  //:SECTOR,
            ibsqlUpdate.params[7].value:= OutPutList[7];  //:T ELEFONO,
            ibsqlUpdate.params[8].value:= OutPutList[8];  //:FECHA_INI_OPE,
            ibsqlUpdate.params[9].value:= OutPutList[9];  //:STATUS,
            ibsqlUpdate.params[10].value:= OutPutList[10];  //:CONDICION
            }
            ibsqlUpdate.SQL.Text:=' update '+
            '  RNCCEDULA '+
            'set  '+
            '  RAZONSOCIAL='+chr(39)+StringReplace(OutPutList[1],'  ','',[rfReplaceAll])+chr(39)+','+
            '  NOMBRE_CIA='+chr(39)+StringReplace(OutPutList[2],'  ','',[rfReplaceAll])+chr(39)+','+
            '  ACTIVIDAD='+chr(39)+StringReplace(OutPutList[3],'  ','',[rfReplaceAll])+chr(39)+','+
            '  DIR_CALLE='+chr(39)+StringReplace(OutPutList[4],'  ','',[rfReplaceAll])+chr(39)+',' +
            '  DIR_NUMERO='+chr(39)+StringReplace(OutPutList[5],'  ','',[rfReplaceAll])+chr(39)+','+
            '  SECTOR='+chr(39)+StringReplace(OutPutList[6],'  ','',[rfReplaceAll])+chr(39)+',' +
            '  TELEFONO='+chr(39)+StringReplace(OutPutList[7],'  ','',[rfReplaceAll])+chr(39)+','+
            '  FECHA_INI_OPE ='+chr(39)+StringReplace(OutPutList[8],'  ','',[rfReplaceAll])+chr(39)+','+
            '  STATUS        ='+chr(39)+StringReplace(OutPutList[9],'  ','',[rfReplaceAll])+chr(39)+','+
            '  CONDICION     ='+chr(39)+StringReplace(OutPutList[10],'  ','',[rfReplaceAll])+chr(39)+
            'where '+
            '  RNC ='+chr(39)+OutPutList[0]+chr(39);
            ibsqlUpdate.ExecQuery;
            UpdateEstadistica;
          end;
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
  if not ibsqlInsertDatos.Transaction.InTransaction then
  ibsqlInsertDatos.Transaction.StartTransaction;
  try
    ibsqlInsertDatos.Transaction.CommitRetaining;
  except
  ibsqlInsertDatos.Transaction.RollbackRetaining;
  end;

  if not ibsqlUpdate.Transaction.InTransaction then
  ibsqlUpdate.Transaction.StartTransaction;
  try
    ibsqlUpdate.Transaction.CommitRetaining;
  except
  ibsqlUpdate.Transaction.RollbackRetaining;
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
  rxData.Close;
  rxData.Open;
  vkPararProceso:=False;
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'repconf_cr.ini');
  try
    GLBRUTADBDGII:= Ini.ReadString('DBDGII', 'Ruta', 'C:\Proyectos\Datos\RNC_DGII\DGII_RNC.FDB');
    GLBRUTABDGIITXT:= Ini.ReadString('DBDGII', 'GLBRUTABDGIITXT', '');
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

function TfrmMain.ExisteRNC(_rnc: string): boolean;
begin
  if (trim(_rnc) = '') then
  result:=False
  else
  begin
    qryConsulta.Close;
    qryConsulta.params[0].Value:=_rnc;
    qryConsulta.Open;
    qryConsulta.first;
    if qryConsulta.recordcount >= 1 then
    result:=True;
  end;
end;

procedure TfrmMain.InsertaEstadistica;
begin
  if rxData.RecordCount = 0 then
  begin
    rxData.Append;
    rxDataInsertado.Value  := 1;
  end else
  begin
    rxData.Edit;
    rxDataInsertado.Value  := rxDataActualizado.Value + 1;
  end;
  rxData.Post;
end;

procedure TfrmMain.UpdateEstadistica;
begin
  if rxData.RecordCount = 0 then
  begin
    rxData.Append;
    rxDataActualizado.Value  := 1;
  end else
  begin
    rxData.Edit;
    rxDataActualizado.Value  := rxDataActualizado.Value + 1;
  end;
  rxData.Post;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  qryDatosRNCDGII.LocateNext('RNC',Edit1.Text,[loPartialKey]);
end;

end.
