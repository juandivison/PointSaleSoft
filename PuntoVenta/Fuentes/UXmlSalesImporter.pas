unit UXmlSalesImporter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Spin, FileCtrl, DateUtils, IBDatabase,
  WinSkinData;

type
  TfrmXmlSalesImporter = class(TForm)
    pnlCommon: TPanel;
    lblImporterExe: TLabel;
    edtImporterExe: TEdit;
    btnBrowseImporter: TButton;
    lblConnectionString: TLabel;
    edtConnectionString: TEdit;
    lblXmlFolder: TLabel;
    edtXmlFolder: TEdit;
    btnBrowseXmlFolder: TButton;
    pgcModes: TPageControl;
    tabImport: TTabSheet;
    tabReport: TTabSheet;
    lblCompanyKey: TLabel;
    seCompanyKey: TSpinEdit;
    lblCreditCustomerCode: TLabel;
    seCreditCustomerCode: TSpinEdit;
    lblUserCode: TLabel;
    seUserCode: TSpinEdit;
    lblCurrency: TLabel;
    edtCurrency: TEdit;
    lblExpectedRnc: TLabel;
    edtExpectedRnc: TEdit;
    lblStartSequence: TLabel;
    seStartSequence: TSpinEdit;
    lblEndSequence: TLabel;
    seEndSequence: TSpinEdit;
    lblExpectedCount: TLabel;
    seExpectedCount: TSpinEdit;
    chkRequireCompleteSequence: TCheckBox;
    chkRequireProductInInventory: TCheckBox;
    chkValidatePersistedSale: TCheckBox;
    chkStopOnError: TCheckBox;
    lblPriceTolerance: TLabel;
    edtPriceTolerance: TEdit;
    lblTotalTolerance: TLabel;
    edtTotalTolerance: TEdit;
    rbDryRun: TRadioButton;
    rbCommit: TRadioButton;
    btnExecuteImport: TButton;
    lblImportWarning: TLabel;
    lblReportFrom: TLabel;
    dtReportFrom: TDateTimePicker;
    lblReportTo: TLabel;
    dtReportTo: TDateTimePicker;
    lblReportOutputFolder: TLabel;
    edtReportOutputFolder: TEdit;
    btnBrowseReportFolder: TButton;
    lblReportOutputPath: TLabel;
    edtReportOutputPath: TEdit;
    btnBrowseReportFile: TButton;
    chkReportSearchSubdirectories: TCheckBox;
    btnExecuteReport: TButton;
    lblReportInfo: TLabel;
    pnlBottom: TPanel;
    lblOutput: TLabel;
    memOutput: TMemo;
    lblStatus: TLabel;
    btnCancelProcess: TButton;
    btnClose: TButton;
    dlgOpenImporter: TOpenDialog;
    dlgSaveReport: TSaveDialog;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnBrowseImporterClick(Sender: TObject);
    procedure btnBrowseXmlFolderClick(Sender: TObject);
    procedure btnBrowseReportFolderClick(Sender: TObject);
    procedure btnBrowseReportFileClick(Sender: TObject);
    procedure btnExecuteImportClick(Sender: TObject);
    procedure btnExecuteReportClick(Sender: TObject);
    procedure btnCancelProcessClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure SequenceChanged(Sender: TObject);
    procedure chkRequireCompleteSequenceClick(Sender: TObject);
    procedure ReportDateChanged(Sender: TObject);
  private
    FRunning: Boolean;
    FCancelRequested: Boolean;
    FProcessHandle: THandle;
    procedure SetRunning(const AValue: Boolean; const AStatus: string);
    procedure ValidateCommon;
    procedure ValidateImport;
    procedure ValidateReport;
    function BuildConfigJson(const ADryRun: Boolean): string;
    function CreateTemporaryConfig(const AJson: string): string;
    function ExecuteTool(const AArguments: string; out AExitCode: Cardinal;
      out AOutput: string): Boolean;
    function BuildReportOutputArgument: string;
    procedure UpdateExpectedCount;
    procedure UpdateDefaultReportFile;
    procedure AppendOutput(const AText: string);
    class function JsonEscape(const AValue: string): string;
    class function QuoteCommandLineArg(const AValue: string): string;
    class function ReadProcessOutput(AStream: TMemoryStream): string;
    class procedure DrainPipe(AReadPipe: THandle; AStream: TMemoryStream);
  public
    class procedure Execute(AOwner: TComponent; const AImporterExe,
      AConnectionString, AXmlFolder: string);
    class function BuildConnectionString(ADatabase: TIBDatabase): string;
  end;

implementation

{$R *.dfm}

const
  CCancelledExitCode = 1223;

class procedure TfrmXmlSalesImporter.Execute(AOwner: TComponent;
  const AImporterExe, AConnectionString, AXmlFolder: string);
var
  Frm: TfrmXmlSalesImporter;
begin
  Frm := TfrmXmlSalesImporter.Create(AOwner);
  try
    Frm.edtImporterExe.Text := Trim(AImporterExe);
    Frm.edtConnectionString.Text := Trim(AConnectionString);
    Frm.edtXmlFolder.Text := Trim(AXmlFolder);

    if Frm.edtReportOutputFolder.Text = '' then
      Frm.edtReportOutputFolder.Text :=
        IncludeTrailingPathDelimiter(ExtractFilePath(AImporterExe)) + 'reports';

    Frm.UpdateDefaultReportFile;
    Frm.ShowModal;
  finally
    Frm.Free;
  end;
end;

class function TfrmXmlSalesImporter.BuildConnectionString(
  ADatabase: TIBDatabase): string;
var
  LUser: string;
  LPassword: string;
  LCharset: string;
begin
  Result := '';
  if not Assigned(ADatabase) then
    Exit;

  LUser := Trim(ADatabase.Params.Values['user_name']);
  LPassword := ADatabase.Params.Values['password'];
  LCharset := Trim(ADatabase.Params.Values['lc_ctype']);

  if LCharset = '' then
    LCharset := 'NONE';

  Result :=
    'Database=' + ADatabase.DatabaseName + ';' +
    'User=' + LUser + ';' +
    'Password=' + LPassword + ';' +
    'Dialect=' + IntToStr(ADatabase.SQLDialect) + ';' +
    'Charset=' + LCharset + ';' +
    'Pooling=true;';
end;

procedure TfrmXmlSalesImporter.FormCreate(Sender: TObject);
var
  LToday: TDateTime;
begin
  FRunning := False;
  FCancelRequested := False;
  FProcessHandle := 0;

  LToday := Date;
  dtReportFrom.Date := EncodeDate(YearOf(LToday), MonthOf(LToday), 1);
  dtReportTo.Date := LToday;

  seCompanyKey.Value := 1;
  seCreditCustomerCode.Value := 838;
  seUserCode.Value := 40;
  edtCurrency.Text := '1';
  seStartSequence.Value := 50907;
  seEndSequence.Value := 50921;
  seExpectedCount.Value := 15;

  chkRequireCompleteSequence.Checked := True;
  chkRequireProductInInventory.Checked := True;
  chkValidatePersistedSale.Checked := True;
  chkStopOnError.Checked := True;
  chkReportSearchSubdirectories.Checked := True;

  edtPriceTolerance.Text := '0.01';
  edtTotalTolerance.Text := '0.01';
  rbDryRun.Checked := True;

  dlgOpenImporter.Filter := 'Ejecutable del importador|PointSaleSoft.XmlSalesImporter.exe|Ejecutables|*.exe|Todos los archivos|*.*';
  dlgSaveReport.Filter := 'Libro de Excel|*.xlsx';
  dlgSaveReport.DefaultExt := 'xlsx';

  UpdateDefaultReportFile;
  SetRunning(False, 'Listo.');
end;

procedure TfrmXmlSalesImporter.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := not FRunning;
  if not CanClose then
    MessageDlg('Hay un proceso en ejecución. Cancélelo antes de cerrar la ventana.',
      mtWarning, [mbOK], 0);
end;

procedure TfrmXmlSalesImporter.btnBrowseImporterClick(Sender: TObject);
begin
  dlgOpenImporter.FileName := edtImporterExe.Text;
  if dlgOpenImporter.Execute then
  begin
    edtImporterExe.Text := dlgOpenImporter.FileName;
    if edtReportOutputFolder.Text = '' then
      edtReportOutputFolder.Text :=
        IncludeTrailingPathDelimiter(ExtractFilePath(dlgOpenImporter.FileName)) +
        'reports';
    UpdateDefaultReportFile;
  end;
end;

procedure TfrmXmlSalesImporter.btnBrowseXmlFolderClick(Sender: TObject);
var
  LFolder: string;
begin
  LFolder := edtXmlFolder.Text;
  if SelectDirectory('Seleccione la carpeta de XML', '', LFolder) then
    edtXmlFolder.Text := LFolder;
end;

procedure TfrmXmlSalesImporter.btnBrowseReportFolderClick(Sender: TObject);
var
  LFolder: string;
begin
  LFolder := edtReportOutputFolder.Text;
  if SelectDirectory('Seleccione la carpeta de reportes', '', LFolder) then
  begin
    edtReportOutputFolder.Text := LFolder;
    UpdateDefaultReportFile;
  end;
end;

procedure TfrmXmlSalesImporter.btnBrowseReportFileClick(Sender: TObject);
begin
  UpdateDefaultReportFile;
  dlgSaveReport.FileName := edtReportOutputPath.Text;
  if dlgSaveReport.Execute then
    edtReportOutputPath.Text := dlgSaveReport.FileName;
end;

procedure TfrmXmlSalesImporter.SequenceChanged(Sender: TObject);
begin
  if chkRequireCompleteSequence.Checked then
    UpdateExpectedCount;
end;

procedure TfrmXmlSalesImporter.chkRequireCompleteSequenceClick(Sender: TObject);
begin
  if chkRequireCompleteSequence.Checked then
    UpdateExpectedCount;
end;

procedure TfrmXmlSalesImporter.ReportDateChanged(Sender: TObject);
begin
  UpdateDefaultReportFile;
end;

procedure TfrmXmlSalesImporter.UpdateExpectedCount;
var
  LCount: Integer;
begin
  if seEndSequence.Value < seStartSequence.Value then
    Exit;

  LCount := seEndSequence.Value - seStartSequence.Value + 1;
  if LCount > 0 then
    seExpectedCount.Value := LCount;
end;

procedure TfrmXmlSalesImporter.UpdateDefaultReportFile;
var
  LFolder: string;
  LFileName: string;
begin
  if (Trim(edtReportOutputPath.Text) <> '') and
     (not SameText(Copy(ExtractFileName(edtReportOutputPath.Text), 1, 11),
       'Ventas_XML_')) then
    Exit;

  LFolder := Trim(edtReportOutputFolder.Text);
  if LFolder = '' then
    Exit;

  LFileName := Format('Ventas_XML_%s_%s.xlsx', [
    FormatDateTime('yyyymmdd', dtReportFrom.Date),
    FormatDateTime('yyyymmdd', dtReportTo.Date)
  ]);

  edtReportOutputPath.Text :=
    IncludeTrailingPathDelimiter(LFolder) + LFileName;
end;

procedure TfrmXmlSalesImporter.ValidateCommon;
begin
  if Trim(edtImporterExe.Text) = '' then
    raise Exception.Create('Debe indicar la ruta de PointSaleSoft.XmlSalesImporter.exe.');

  if not FileExists(edtImporterExe.Text) then
    raise Exception.Create('No existe el ejecutable: ' + edtImporterExe.Text);

  if Trim(edtConnectionString.Text) = '' then
    raise Exception.Create('Debe indicar la cadena de conexión de Firebird.');

  if Trim(edtXmlFolder.Text) = '' then
    raise Exception.Create('Debe indicar la carpeta de XML.');

  if not DirectoryExists(edtXmlFolder.Text) then
    raise Exception.Create('No existe la carpeta de XML: ' + edtXmlFolder.Text);
end;

procedure TfrmXmlSalesImporter.ValidateImport;
var
  LValue: Extended;
begin
  ValidateCommon;

  if seCompanyKey.Value <= 0 then
    raise Exception.Create('CompanyKey debe ser mayor que cero.');

  if seCreditCustomerCode.Value <= 0 then
    raise Exception.Create('El código del cliente a crédito debe ser mayor que cero.');

  if seUserCode.Value <= 0 then
    raise Exception.Create('El código de usuario debe ser mayor que cero.');

  if seEndSequence.Value < seStartSequence.Value then
    raise Exception.Create('La secuencia final no puede ser menor que la inicial.');

  if seExpectedCount.Value <= 0 then
    raise Exception.Create('La cantidad esperada debe ser mayor que cero.');

  if not TryStrToFloat(StringReplace(edtPriceTolerance.Text, '.',
    DecimalSeparator, [rfReplaceAll]), LValue) or (LValue < 0) then
    raise Exception.Create('La tolerancia de precio es inválida.');

  if not TryStrToFloat(StringReplace(edtTotalTolerance.Text, '.',
    DecimalSeparator, [rfReplaceAll]), LValue) or (LValue < 0) then
    raise Exception.Create('La tolerancia de total es inválida.');
end;

procedure TfrmXmlSalesImporter.ValidateReport;
begin
  ValidateCommon;

  if Trunc(dtReportTo.Date) < Trunc(dtReportFrom.Date) then
    raise Exception.Create('La fecha final no puede ser menor que la fecha inicial.');

  if (Trim(edtReportOutputFolder.Text) = '') and
     (Trim(edtReportOutputPath.Text) = '') then
    raise Exception.Create('Debe indicar la carpeta o el archivo de salida del reporte.');
end;

class function TfrmXmlSalesImporter.JsonEscape(const AValue: string): string;
var
  I: Integer;
  C: Char;
begin
  Result := '';
  for I := 1 to Length(AValue) do
  begin
    C := AValue[I];
    case C of
      '"': Result := Result + '\"';
      '\': Result := Result + '\\';
      #8: Result := Result + '\b';
      #9: Result := Result + '\t';
      #10: Result := Result + '\n';
      #12: Result := Result + '\f';
      #13: Result := Result + '\r';
    else
      if Ord(C) < 32 then
        Result := Result + Format('\u%.4x', [Ord(C)])
      else
        Result := Result + C;
    end;
  end;
end;

function TfrmXmlSalesImporter.BuildConfigJson(const ADryRun: Boolean): string;
var
  LPriceTolerance: string;
  LTotalTolerance: string;
begin
  LPriceTolerance := StringReplace(Trim(edtPriceTolerance.Text), ',', '.', [rfReplaceAll]);
  LTotalTolerance := StringReplace(Trim(edtTotalTolerance.Text), ',', '.', [rfReplaceAll]);

  Result :=
    '{' + #13#10 +
    '  "ConnectionString": "' + JsonEscape(Trim(edtConnectionString.Text)) + '",' + #13#10 +
    '  "XmlFolder": "' + JsonEscape(Trim(edtXmlFolder.Text)) + '",' + #13#10 +
    '  "ReportOutputFolder": "' + JsonEscape(Trim(edtReportOutputFolder.Text)) + '",' + #13#10 +
    '  "ReportSearchSubdirectories": ' + LowerCase(BoolToStr(chkReportSearchSubdirectories.Checked, True)) + ',' + #13#10 +
    '  "CompanyKey": ' + IntToStr(seCompanyKey.Value) + ',' + #13#10 +
    '  "CreditCustomerCode": ' + IntToStr(seCreditCustomerCode.Value) + ',' + #13#10 +
    '  "UserCode": ' + IntToStr(seUserCode.Value) + ',' + #13#10 +
    '  "Currency": "' + JsonEscape(Trim(edtCurrency.Text)) + '",' + #13#10 +
    '  "ExpectedRncEmisor": "' + JsonEscape(Trim(edtExpectedRnc.Text)) + '",' + #13#10 +
    '  "ExpectedStartSequence": ' + IntToStr(seStartSequence.Value) + ',' + #13#10 +
    '  "ExpectedEndSequence": ' + IntToStr(seEndSequence.Value) + ',' + #13#10 +
    '  "ExpectedCount": ' + IntToStr(seExpectedCount.Value) + ',' + #13#10 +
    '  "RequireCompleteSequence": ' + LowerCase(BoolToStr(chkRequireCompleteSequence.Checked, True)) + ',' + #13#10 +
    '  "RequireProductInInventory": ' + LowerCase(BoolToStr(chkRequireProductInInventory.Checked, True)) + ',' + #13#10 +
    '  "ValidatePersistedSale": ' + LowerCase(BoolToStr(chkValidatePersistedSale.Checked, True)) + ',' + #13#10 +
    '  "DryRun": ' + LowerCase(BoolToStr(ADryRun, True)) + ',' + #13#10 +
    '  "StopOnError": ' + LowerCase(BoolToStr(chkStopOnError.Checked, True)) + ',' + #13#10 +
    '  "PriceTolerance": ' + LPriceTolerance + ',' + #13#10 +
    '  "TotalTolerance": ' + LTotalTolerance + #13#10 +
    '}' + #13#10;
end;

function TfrmXmlSalesImporter.CreateTemporaryConfig(const AJson: string): string;
var
  LTempPath: array[0..MAX_PATH] of Char;
  LFileName: string;
  LUtf8: UTF8String;
  LStream: TFileStream;
begin
  if GetTempPath(MAX_PATH, LTempPath) = 0 then
    RaiseLastOSError;

  LFileName := IncludeTrailingPathDelimiter(StrPas(LTempPath)) +
    Format('PSSI_%d_%d.json', [GetCurrentProcessId, GetTickCount]);

  LUtf8 := UTF8Encode(AJson);
  LStream := TFileStream.Create(LFileName, fmCreate or fmShareDenyWrite);
  try
    if Length(LUtf8) > 0 then
      LStream.WriteBuffer(LUtf8[1], Length(LUtf8));
  finally
    LStream.Free;
  end;

  Result := LFileName;
end;

class function TfrmXmlSalesImporter.QuoteCommandLineArg(
  const AValue: string): string;
var
  I: Integer;
  LSlashCount: Integer;
  LNeedsQuotes: Boolean;
begin
  LNeedsQuotes := (AValue = '') or
    (Pos(' ', AValue) > 0) or
    (Pos(#9, AValue) > 0) or
    (Pos('"', AValue) > 0);

  if not LNeedsQuotes then
  begin
    Result := AValue;
    Exit;
  end;

  Result := '"';
  LSlashCount := 0;

  for I := 1 to Length(AValue) do
  begin
    if AValue[I] = '\' then
      Inc(LSlashCount)
    else
    if AValue[I] = '"' then
    begin
      Result := Result + StringOfChar('\', (LSlashCount * 2) + 1) + '"';
      LSlashCount := 0;
    end
    else
    begin
      if LSlashCount > 0 then
      begin
        Result := Result + StringOfChar('\', LSlashCount);
        LSlashCount := 0;
      end;
      Result := Result + AValue[I];
    end;
  end;

  if LSlashCount > 0 then
    Result := Result + StringOfChar('\', LSlashCount * 2);

  Result := Result + '"';
end;

class procedure TfrmXmlSalesImporter.DrainPipe(AReadPipe: THandle;
  AStream: TMemoryStream);
var
  LAvailable: DWORD;
  LRead: DWORD;
  LToRead: DWORD;
  LBuffer: array[0..4095] of Byte;
begin
  while True do
  begin
    LAvailable := 0;
    if not PeekNamedPipe(AReadPipe, nil, 0, nil, @LAvailable, nil) then
      Break;

    if LAvailable = 0 then
      Break;

    LToRead := LAvailable;
    if LToRead > SizeOf(LBuffer) then
      LToRead := SizeOf(LBuffer);

    LRead := 0;
    if not ReadFile(AReadPipe, LBuffer[0], LToRead, LRead, nil) then
      Break;

    if LRead = 0 then
      Break;

    AStream.WriteBuffer(LBuffer[0], LRead);
  end;
end;

class function TfrmXmlSalesImporter.ReadProcessOutput(
  AStream: TMemoryStream): string;
var
  LRaw: UTF8String;
  LWide: WideString;
begin
  Result := '';
  if AStream.Size = 0 then
    Exit;

  SetLength(LRaw, AStream.Size);
  AStream.Position := 0;
  AStream.ReadBuffer(LRaw[1], AStream.Size);

  try
    LWide := UTF8Decode(LRaw);
    Result := LWide;
  except
    Result := string(LRaw);
  end;
end;

function TfrmXmlSalesImporter.ExecuteTool(const AArguments: string;
  out AExitCode: Cardinal; out AOutput: string): Boolean;
var
  LSecurity: TSecurityAttributes;
  LStartup: TStartupInfo;
  LProcessInfo: TProcessInformation;
  LReadPipe: THandle;
  LWritePipe: THandle;
  LCommandLine: string;
  LCommandBuffer: PChar;
  LWaitResult: DWORD;
  LOutputStream: TMemoryStream;
  LWorkDir: string;
begin
  Result := False;
  AExitCode := Cardinal(-1);
  AOutput := '';
  LReadPipe := 0;
  LWritePipe := 0;
  LCommandBuffer := nil;
  FillChar(LProcessInfo, SizeOf(LProcessInfo), 0);
  LOutputStream := TMemoryStream.Create;
  try
    FillChar(LSecurity, SizeOf(LSecurity), 0);
    LSecurity.nLength := SizeOf(LSecurity);
    LSecurity.bInheritHandle := True;

    if not CreatePipe(LReadPipe, LWritePipe, @LSecurity, 0) then
      RaiseLastOSError;

    if not SetHandleInformation(LReadPipe, HANDLE_FLAG_INHERIT, 0) then
      RaiseLastOSError;

    FillChar(LStartup, SizeOf(LStartup), 0);
    LStartup.cb := SizeOf(LStartup);
    LStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
    LStartup.wShowWindow := SW_HIDE;
    LStartup.hStdOutput := LWritePipe;
    LStartup.hStdError := LWritePipe;
    LStartup.hStdInput := GetStdHandle(STD_INPUT_HANDLE);

    LCommandLine := QuoteCommandLineArg(edtImporterExe.Text) + ' ' + AArguments;
    GetMem(LCommandBuffer, (Length(LCommandLine) + 1) * SizeOf(Char));
    StrPCopy(LCommandBuffer, LCommandLine);

    LWorkDir := ExtractFilePath(edtImporterExe.Text);
    if LWorkDir = '' then
      LWorkDir := GetCurrentDir;

    if not CreateProcess(nil, LCommandBuffer, nil, nil, True,
      CREATE_NO_WINDOW, nil, PChar(LWorkDir), LStartup, LProcessInfo) then
      RaiseLastOSError;

    FProcessHandle := LProcessInfo.hProcess;
    CloseHandle(LProcessInfo.hThread);
    CloseHandle(LWritePipe);
    LWritePipe := 0;

    repeat
      DrainPipe(LReadPipe, LOutputStream);
      Application.ProcessMessages;
      Sleep(30);
      LWaitResult := WaitForSingleObject(FProcessHandle, 30);
    until (LWaitResult <> WAIT_TIMEOUT) or FCancelRequested;

    if FCancelRequested and (LWaitResult = WAIT_TIMEOUT) then
    begin
      TerminateProcess(FProcessHandle, CCancelledExitCode);
      WaitForSingleObject(FProcessHandle, 5000);
    end;

    DrainPipe(LReadPipe, LOutputStream);

    if not GetExitCodeProcess(FProcessHandle, AExitCode) then
      RaiseLastOSError;

    AOutput := ReadProcessOutput(LOutputStream);
    Result := AExitCode = 0;
  finally
    FProcessHandle := 0;
    if LCommandBuffer <> nil then
      FreeMem(LCommandBuffer);
    if LWritePipe <> 0 then
      CloseHandle(LWritePipe);
    if LReadPipe <> 0 then
      CloseHandle(LReadPipe);
    if LProcessInfo.hProcess <> 0 then
      CloseHandle(LProcessInfo.hProcess);
    LOutputStream.Free;
  end;
end;

procedure TfrmXmlSalesImporter.SetRunning(const AValue: Boolean;
  const AStatus: string);
begin
  FRunning := AValue;
  lblStatus.Caption := AStatus;

  pnlCommon.Enabled := not AValue;
  pgcModes.Enabled := not AValue;
  btnClose.Enabled := not AValue;
  btnCancelProcess.Enabled := AValue;

  if AValue then
    Screen.Cursor := crHourGlass
  else
    Screen.Cursor := crDefault;
end;

procedure TfrmXmlSalesImporter.AppendOutput(const AText: string);
begin
  if Trim(AText) = '' then
    Exit;

  memOutput.Lines.Add(AText);
  memOutput.SelStart := Length(memOutput.Text);
  memOutput.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TfrmXmlSalesImporter.btnExecuteImportClick(Sender: TObject);
var
  LConfigFile: string;
  LArguments: string;
  LOutput: string;
  LExitCode: Cardinal;
  LSuccess: Boolean;
  LConfirmation: Integer;
begin
  LConfigFile := '';
  try
    ValidateImport;

    if rbCommit.Checked then
    begin
      LConfirmation := MessageDlg(
        'Se ejecutará una CARGA REAL en Firebird.' + #13#10 + #13#10 +
        'Rango e-NCF: ' + IntToStr(seStartSequence.Value) + ' - ' +
          IntToStr(seEndSequence.Value) + #13#10 +
        'Cantidad esperada: ' + IntToStr(seExpectedCount.Value) + #13#10 +
        'Cada XML confirmado se guarda en una transacción independiente.' + #13#10 + #13#10 +
        '¿Continuar?', mtConfirmation, [mbYes, mbNo], 0);

      if LConfirmation <> mrYes then
        Exit;
    end;

    memOutput.Clear;
    FCancelRequested := False;
    SetRunning(True, 'Preparando configuración temporal...');

    LConfigFile := CreateTemporaryConfig(BuildConfigJson(rbDryRun.Checked));

    LArguments := '--config ' + QuoteCommandLineArg(LConfigFile);
    if rbCommit.Checked then
      LArguments := LArguments + ' --commit'
    else
      LArguments := LArguments + ' --dry-run';

    if chkStopOnError.Checked then
      LArguments := LArguments + ' --stop-on-error'
    else
      LArguments := LArguments + ' --continue-on-error';

    SetRunning(True, 'Ejecutando importador...');
    LSuccess := ExecuteTool(LArguments, LExitCode, LOutput);
    AppendOutput(LOutput);

    if FCancelRequested then
      SetRunning(False, 'Proceso cancelado por el usuario.')
    else
    if LSuccess then
      SetRunning(False, 'Proceso terminado correctamente.')
    else
      SetRunning(False, 'El importador terminó con código ' + IntToStr(LExitCode) + '.');
  except
    on E: Exception do
    begin
      SetRunning(False, 'No fue posible ejecutar el proceso.');
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;

  if (LConfigFile <> '') and FileExists(LConfigFile) then
    DeleteFile(LConfigFile);
end;

function TfrmXmlSalesImporter.BuildReportOutputArgument: string;
begin
  Result := '';
  if Trim(edtReportOutputPath.Text) <> '' then
    Result := ' --output ' + QuoteCommandLineArg(Trim(edtReportOutputPath.Text));
end;

procedure TfrmXmlSalesImporter.btnExecuteReportClick(Sender: TObject);
var
  LConfigFile: string;
  LArguments: string;
  LOutput: string;
  LExitCode: Cardinal;
  LSuccess: Boolean;
begin
  LConfigFile := '';
  try
    ValidateReport;

    memOutput.Clear;
    FCancelRequested := False;
    SetRunning(True, 'Preparando configuración temporal...');

    LConfigFile := CreateTemporaryConfig(BuildConfigJson(True));

    LArguments :=
      '--config ' + QuoteCommandLineArg(LConfigFile) +
      ' --excel-report' +
      ' --from ' + QuoteCommandLineArg(FormatDateTime('dd/mm/yyyy', dtReportFrom.Date)) +
      ' --to ' + QuoteCommandLineArg(FormatDateTime('dd/mm/yyyy', dtReportTo.Date)) +
      BuildReportOutputArgument;

    SetRunning(True, 'Generando reporte Excel...');
    LSuccess := ExecuteTool(LArguments, LExitCode, LOutput);
    AppendOutput(LOutput);

    if FCancelRequested then
      SetRunning(False, 'Proceso cancelado por el usuario.')
    else
    if LSuccess then
      SetRunning(False, 'Reporte generado correctamente.')
    else
      SetRunning(False, 'El reporte terminó con código ' + IntToStr(LExitCode) + '.');
  except
    on E: Exception do
    begin
      SetRunning(False, 'No fue posible generar el reporte.');
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;

  if (LConfigFile <> '') and FileExists(LConfigFile) then
    DeleteFile(LConfigFile);
end;

procedure TfrmXmlSalesImporter.btnCancelProcessClick(Sender: TObject);
begin
  if not FRunning then
    Exit;

  if MessageDlg('¿Cancelar el proceso en ejecución?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    FCancelRequested := True;
    lblStatus.Caption := 'Cancelando proceso...';
  end;
end;

procedure TfrmXmlSalesImporter.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
