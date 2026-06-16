unit UFrmOrders2EcfRunner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, FileCtrl, ShellApi, ComCtrls;

type
  TfrmOrders2EcfRunner = class(TForm)
    PanelTop: TPanel;
    lblExe: TLabel;
    edtExePath: TEdit;
    btnBrowseExe: TButton;
    gbFolders: TGroupBox;
    lbFolders: TListBox;
    btnAddFolder: TButton;
    btnRemoveFolder: TButton;
    btnClearFolders: TButton;
    gbMode: TGroupBox;
    rgMode: TRadioGroup;
    lblNcf: TLabel;
    edtNcf: TEdit;
    gbOptions: TGroupBox;
    chkLegacyImport: TCheckBox;
    chkLegacyReplay: TCheckBox;
    chkLegacyNumbering: TCheckBox;
    chkOpenReport: TCheckBox;
    chkOpenOutputFolder: TCheckBox;
    lblExtraArgs: TLabel;
    edtExtraArgs: TEdit;
    PanelBottom: TPanel;
    btnRun: TButton;
    btnClose: TButton;
    gbLog: TGroupBox;
    memLog: TMemo;
    OpenDialogExe: TOpenDialog;
    StatusBar1: TStatusBar;
    lblHint: TLabel;
    lblModeHelp: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnBrowseExeClick(Sender: TObject);
    procedure btnAddFolderClick(Sender: TObject);
    procedure btnRemoveFolderClick(Sender: TObject);
    procedure btnClearFoldersClick(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure rgModeClick(Sender: TObject);
    procedure chkLegacyReplayClick(Sender: TObject);
  private
    function BuildCommandLine: string;
    function GetJoinedFolders: string;
    procedure Log(const S: string);
    procedure SetRunningUI(const ARunning: Boolean);
    function ExecuteAndCapture(const ExePath, Params: string; out ExitCode: Cardinal): Boolean;
    function ExtractReportPath: string;
    function ExtractLastGeneratedXlsxPath: string;
    procedure OpenReportIfAny;
    procedure OpenOutputFolderIfAny;
    procedure ValidateInputs;
    procedure SyncModeControls;
    function IsModeNormal: Boolean;
    function IsModeDummy: Boolean;
    function IsModeReprint: Boolean;
    function IsModeReplay: Boolean;
  public
  end;

var
  frmOrders2EcfRunner: TfrmOrders2EcfRunner;

implementation

{$R *.dfm}

function QuoteArg(const S: string): string;
begin
  Result := '"' + S + '"';
end;

function FileExistsSafe(const AFileName: string): Boolean;
begin
  Result := (Trim(AFileName) <> '') and FileExists(AFileName);
end;

procedure TfrmOrders2EcfRunner.FormCreate(Sender: TObject);
begin
  Caption := 'Orders2Ecf Runner';
  rgMode.ItemIndex := 0; // Normal
  chkOpenReport.Checked := True;
  chkOpenOutputFolder.Checked := False;
  OpenDialogExe.InitialDir:=GlbRutaEcf;
  OpenDialogExe.Filter := 'Orders2Ecf CLI|Orders2Ecf.Cli.exe|Executable (*.exe)|*.exe|Todos (*.*)|*.*';
  OpenDialogExe.Options := [ofFileMustExist, ofPathMustExist, ofEnableSizing];
  memLog.Clear;
  StatusBar1.SimpleText := 'Listo';
  SyncModeControls;
end;

function TfrmOrders2EcfRunner.IsModeNormal: Boolean;
begin
  Result := (rgMode.ItemIndex = 0);
end;

function TfrmOrders2EcfRunner.IsModeDummy: Boolean;
begin
  Result := (rgMode.ItemIndex = 1);
end;

function TfrmOrders2EcfRunner.IsModeReprint: Boolean;
begin
  Result := (rgMode.ItemIndex = 2);
end;

function TfrmOrders2EcfRunner.IsModeReplay: Boolean;
begin
  Result := (rgMode.ItemIndex = 3);
end;

procedure TfrmOrders2EcfRunner.Log(const S: string);
begin
  memLog.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' | ' + S);
  memLog.SelStart := Length(memLog.Text);
  memLog.Perform(EM_SCROLLCARET, 0, 0);
  Application.ProcessMessages;
end;

procedure TfrmOrders2EcfRunner.SetRunningUI(const ARunning: Boolean);
begin
  btnRun.Enabled := not ARunning;
  btnClose.Enabled := not ARunning;
  btnBrowseExe.Enabled := not ARunning;
  btnAddFolder.Enabled := not ARunning;
  btnRemoveFolder.Enabled := not ARunning;
  btnClearFolders.Enabled := not ARunning;
  rgMode.Enabled := not ARunning;
  edtExePath.Enabled := not ARunning;
  chkOpenReport.Enabled := not ARunning;
  chkOpenOutputFolder.Enabled := not ARunning;
  edtExtraArgs.Enabled := not ARunning;

  if not ARunning then
    SyncModeControls
  else
  begin
    edtNcf.Enabled := False;
    chkLegacyImport.Enabled := False;
    chkLegacyReplay.Enabled := False;
    chkLegacyNumbering.Enabled := False;
  end;

  if ARunning then
    StatusBar1.SimpleText := 'Ejecutando Orders2Ecf...'
  else
    StatusBar1.SimpleText := 'Listo';
end;

procedure TfrmOrders2EcfRunner.btnBrowseExeClick(Sender: TObject);
begin
  if OpenDialogExe.Execute then
    edtExePath.Text := OpenDialogExe.FileName;
end;

procedure TfrmOrders2EcfRunner.btnAddFolderClick(Sender: TObject);
var
  Dir: string;
begin
  Dir := '';
  if SelectDirectory('Seleccione la carpeta de Ordenes', '', Dir) then
  begin
    if lbFolders.Items.IndexOf(Dir) < 0 then
      lbFolders.Items.Add(Dir)
    else
      MessageDlg('Esa carpeta ya fue agregada.', mtInformation, [mbOK], 0);
  end;
end;

procedure TfrmOrders2EcfRunner.btnRemoveFolderClick(Sender: TObject);
begin
  if lbFolders.ItemIndex >= 0 then
    lbFolders.Items.Delete(lbFolders.ItemIndex);
end;

procedure TfrmOrders2EcfRunner.btnClearFoldersClick(Sender: TObject);
begin
  lbFolders.Items.Clear;
end;

function TfrmOrders2EcfRunner.GetJoinedFolders: string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to lbFolders.Items.Count - 1 do
  begin
    if Trim(lbFolders.Items[I]) = '' then
      Continue;
    if Result <> '' then
      Result := Result + ';';
    Result := Result + lbFolders.Items[I];
  end;
end;

procedure TfrmOrders2EcfRunner.ValidateInputs;
var
  I: Integer;
  FolderPath: string;
begin
  if not FileExistsSafe(edtExePath.Text) then
    raise Exception.Create('Debe seleccionar Orders2Ecf.Cli.exe.');

  if lbFolders.Items.Count = 0 then
    raise Exception.Create('Debe seleccionar al menos una carpeta de Ordenes.');

  for I := 0 to lbFolders.Items.Count - 1 do
  begin
    FolderPath := Trim(lbFolders.Items[I]);
    if FolderPath = '' then
      raise Exception.CreateFmt('La carpeta #%d está¡ vacía.', [I + 1]);
    if not DirectoryExists(FolderPath) then
      raise Exception.CreateFmt('La carpeta no existe: %s', [FolderPath]);
  end;

  if IsModeReprint then
  begin
    if Trim(edtNcf.Text) = '' then
      raise Exception.Create('En modo Reprint debe indicar el NCF/e-NCF.');
  end;

  if IsModeReplay then
  begin
    if not chkLegacyReplay.Checked then
      raise Exception.Create('En modo Replay debe estar activo Legacy Replay.');
  end;

  if IsModeReprint and chkLegacyReplay.Checked then
    raise Exception.Create('No combine Reprint con Legacy Replay. Reprint solo rehace salida desde un NCF existente.');

  if IsModeDummy and chkLegacyReplay.Checked then
    raise Exception.Create('No combine Dummy con Legacy Replay.');
end;

function TfrmOrders2EcfRunner.BuildCommandLine: string;
var
  Folders, ModeArg, Extra: string;
begin
  Folders := GetJoinedFolders;
  if Trim(Folders) = '' then
    raise Exception.Create('No hay carpetas vÃ¡lidas para ejecutar.');

  Result := QuoteArg(Folders);

  if IsModeDummy then
    ModeArg := '--mode=dummy'
  else if IsModeReprint then
    ModeArg := '--reprint=' + Trim(edtNcf.Text)
  else if IsModeReplay then
    ModeArg := '--mode=replay'
  else
    ModeArg := ''; // Normal

  if Trim(ModeArg) <> '' then
    Result := Result + ' ' + ModeArg;

  if chkLegacyImport.Checked then
    Result := Result + ' --legacy-import';

  if chkLegacyReplay.Checked or IsModeReplay then
    Result := Result + ' --legacy-replay';

  if chkLegacyNumbering.Checked then
    Result := Result + ' --legacy-numbering';

  Extra := Trim(edtExtraArgs.Text);
  if Extra <> '' then
    Result := Result + ' ' + Extra;
end;

function TfrmOrders2EcfRunner.ExecuteAndCapture(const ExePath, Params: string; out ExitCode: Cardinal): Boolean;
var
  SA: TSecurityAttributes;
  ReadPipe, WritePipe: THandle;
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  Buffer: array[0..2047] of AnsiChar;
  BytesRead: DWORD;
  WaitRes: DWORD;
  S: AnsiString;
begin
  Result := False;
  ExitCode := Cardinal(-1);
  ReadPipe := 0;
  WritePipe := 0;

  FillChar(SA, SizeOf(SA), 0);
  SA.nLength := SizeOf(SA);
  SA.bInheritHandle := True;
  SA.lpSecurityDescriptor := nil;

  if not CreatePipe(ReadPipe, WritePipe, @SA, 0) then
    RaiseLastOSError;

  try
    SetHandleInformation(ReadPipe, HANDLE_FLAG_INHERIT, 0);

    FillChar(StartInfo, SizeOf(StartInfo), 0);
    StartInfo.cb := SizeOf(StartInfo);
    StartInfo.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
    StartInfo.wShowWindow := SW_HIDE;
    StartInfo.hStdInput := GetStdHandle(STD_INPUT_HANDLE);
    StartInfo.hStdOutput := WritePipe;
    StartInfo.hStdError := WritePipe;

    FillChar(ProcInfo, SizeOf(ProcInfo), 0);

    if not CreateProcess(
      nil,
      PChar(QuoteArg(ExePath) + ' ' + Params),
      nil,
      nil,
      True,
      CREATE_NO_WINDOW,
      nil,
      PChar(ExtractFilePath(ExePath)),
      StartInfo,
      ProcInfo) then
      RaiseLastOSError;

    try
      CloseHandle(WritePipe);
      WritePipe := 0;

      repeat
        Application.ProcessMessages;

        while PeekNamedPipe(ReadPipe, nil, 0, nil, @BytesRead, nil) and (BytesRead > 0) do
        begin
          FillChar(Buffer, SizeOf(Buffer), 0);
          if not ReadFile(ReadPipe, Buffer, SizeOf(Buffer) - 1, BytesRead, nil) then
            Break;
          if BytesRead > 0 then
          begin
            SetString(S, PAnsiChar(@Buffer[0]), BytesRead);
            memLog.Text := memLog.Text + String(S);
            memLog.SelStart := Length(memLog.Text);
            memLog.Perform(EM_SCROLLCARET, 0, 0);
          end;
        end;

        WaitRes := WaitForSingleObject(ProcInfo.hProcess, 100);
      until WaitRes <> WAIT_TIMEOUT;

      while PeekNamedPipe(ReadPipe, nil, 0, nil, @BytesRead, nil) and (BytesRead > 0) do
      begin
        FillChar(Buffer, SizeOf(Buffer), 0);
        if not ReadFile(ReadPipe, Buffer, SizeOf(Buffer) - 1, BytesRead, nil) then
          Break;
        if BytesRead > 0 then
        begin
          SetString(S, PAnsiChar(@Buffer[0]), BytesRead);
          memLog.Text := memLog.Text + String(S);
          memLog.SelStart := Length(memLog.Text);
          memLog.Perform(EM_SCROLLCARET, 0, 0);
        end;
      end;

      if not GetExitCodeProcess(ProcInfo.hProcess, ExitCode) then
        RaiseLastOSError;

      Result := (ExitCode = 0);
    finally
      CloseHandle(ProcInfo.hThread);
      CloseHandle(ProcInfo.hProcess);
    end;
  finally
    if ReadPipe <> 0 then CloseHandle(ReadPipe);
    if WritePipe <> 0 then CloseHandle(WritePipe);
  end;
end;

function TfrmOrders2EcfRunner.ExtractReportPath: string;
var
  I, P: Integer;
  Line, Tag, Value: string;
begin
  Result := '';
  Tag := '[REPORT] XLSX generado:';
  for I := memLog.Lines.Count - 1 downto 0 do
  begin
    Line := Trim(memLog.Lines[I]);
    P := Pos(Tag, Line);
    if P > 0 then
    begin
      Value := Trim(Copy(Line, P + Length(Tag), MaxInt));
      if Value <> '' then
      begin
        Result := Value;
        Exit;
      end;
    end;
  end;
end;

function TfrmOrders2EcfRunner.ExtractLastGeneratedXlsxPath: string;
var
  I, P: Integer;
  Line, Value: string;
begin
  Result := '';
  for I := memLog.Lines.Count - 1 downto 0 do
  begin
    Line := Trim(memLog.Lines[I]);
    P := Pos('.xlsx', LowerCase(Line));
    if P > 0 then
    begin
      Value := Line;
      if Pos(':', Value) > 0 then
        Value := Trim(Copy(Value, LastDelimiter(':', Value) + 1, MaxInt));
      if FileExistsSafe(Value) then
      begin
        Result := Value;
        Exit;
      end;
    end;
  end;
end;

procedure TfrmOrders2EcfRunner.OpenReportIfAny;
var
  ReportPath: string;
begin
  ReportPath := ExtractReportPath;
  if (ReportPath = '') or not FileExistsSafe(ReportPath) then
    ReportPath := ExtractLastGeneratedXlsxPath;

  if FileExistsSafe(ReportPath) then
  begin
    Log('Abriendo reporte XLSX: ' + ReportPath);
    ShellExecute(Handle, 'open', PChar(ReportPath), nil, nil, SW_SHOWNORMAL);
  end
  else
    Log('No se encontrÃ³ el reporte XLSX para abrir automÃ¡ticamente.');
end;

procedure TfrmOrders2EcfRunner.OpenOutputFolderIfAny;
var
  ReportPath, Dir: string;
begin
  ReportPath := ExtractReportPath;
  if (ReportPath = '') or not FileExistsSafe(ReportPath) then
    ReportPath := ExtractLastGeneratedXlsxPath;

  if FileExistsSafe(ReportPath) then
    Dir := ExtractFilePath(ReportPath)
  else if lbFolders.Items.Count > 0 then
    Dir := lbFolders.Items[0]
  else
    Dir := '';

  if DirectoryExists(Dir) then
  begin
    Log('Abriendo carpeta: ' + Dir);
    ShellExecute(Handle, 'open', PChar(Dir), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TfrmOrders2EcfRunner.btnRunClick(Sender: TObject);
var
  Params: string;
  ExitCode: Cardinal;
  Ok: Boolean;
begin
  try
    ValidateInputs;
    Params := BuildCommandLine;

    memLog.Clear;
    Log('Ejecutable: ' + edtExePath.Text);
    Log('ParÃ¡metros: ' + Params);

    SetRunningUI(True);
    try
      Ok := ExecuteAndCapture(edtExePath.Text, Params, ExitCode);
      if Ok then
      begin
        Log('Proceso completado correctamente. ExitCode=0');
        if chkOpenReport.Checked then
          OpenReportIfAny;
        if chkOpenOutputFolder.Checked then
          OpenOutputFolderIfAny;
      end
      else
        Log('Proceso finalizado con error. ExitCode=' + IntToStr(ExitCode));
    finally
      SetRunningUI(False);
    end;
  except
    on E: Exception do
    begin
      SetRunningUI(False);
      Log('ERROR: ' + E.Message);
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfrmOrders2EcfRunner.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrders2EcfRunner.SyncModeControls;
var
  HelpText: string;
begin
  edtNcf.Enabled := IsModeReprint;
  lblNcf.Enabled := IsModeReprint;
  lblModeHelp.Enabled := True;

  if not IsModeReprint then
    edtNcf.Text := '';

  chkLegacyReplay.Checked := IsModeReplay;
  chkLegacyReplay.Enabled := not (IsModeReplay or IsModeReprint or IsModeDummy);

  chkLegacyImport.Enabled := not IsModeReprint;
  chkLegacyNumbering.Enabled := not IsModeReprint;

  if IsModeReprint then
  begin
    chkLegacyImport.Checked := False;
    chkLegacyNumbering.Checked := False;
    HelpText := 'Reprint: rehace la salida (Excel/PDF/XML) desde un e-NCF existente. Requiere NCF/e-NCF y no usa legacy replay.';
  end
  else if IsModeReplay then
    HelpText := 'Replay: reprocesa el pipeline legacy sobre un NCF existente. Legacy Replay queda activo de forma obligatoria.'
  else if IsModeDummy then
    HelpText := 'Dummy: ejecuta una corrida de prueba sin envío fiscal real. No debe combinarse con Legacy Replay.'
  else
    HelpText := 'Normal: usa el flujo estandar del CLI. Legacy Replay es opcional solo cuando el proceso realmente lo requiera.';

  lblHint.Caption :=
    'Normal: emite/flujo normal. Dummy: prueba sin envío fiscal. Reprint: rehace salida desde un NCF existente. Replay: completa solo pipeline legacy usando NCF existente.';
  lblModeHelp.Caption := HelpText;

  if IsModeReplay then
    StatusBar1.SimpleText := 'Modo Replay: --legacy-replay se agregará automáticamente'
  else if IsModeReprint then
    StatusBar1.SimpleText := 'Modo Reprint: indique el NCF/e-NCF a reconstruir'
  else if IsModeDummy then
    StatusBar1.SimpleText := 'Modo Dummy: ejecución de prueba'
  else
    StatusBar1.SimpleText := 'Listo';
end;

procedure TfrmOrders2EcfRunner.rgModeClick(Sender: TObject);
begin
  SyncModeControls;
end;

procedure TfrmOrders2EcfRunner.chkLegacyReplayClick(Sender: TObject);
begin
  if IsModeReplay then
    chkLegacyReplay.Checked := True;
end;

end.
