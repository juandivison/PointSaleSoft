unit UAuditoriaECF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WinSkinData;

type
  TfrmAuditoriaECF = class(TForm)
    pnlDatos: TPanel;
    lblRutaExe: TLabel;
    edtRutaExe: TEdit;
    btnBuscarExe: TButton;
    lblTRN: TLabel;
    edtTRN: TEdit;
    lblENCF: TLabel;
    edtENCF: TEdit;
    btnAuditar: TButton;
    pnlEstado: TPanel;
    lblEstadoTitulo: TLabel;
    lblEstado: TLabel;
    lblOrigenTitulo: TLabel;
    lblOrigenXML: TLabel;
    memResultado: TMemo;
    OpenDialog1: TOpenDialog;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarExeClick(Sender: TObject);
    procedure btnAuditarClick(Sender: TObject);
    procedure edtTRNKeyPress(Sender: TObject; var Key: Char);
    procedure edtENCFKeyPress(Sender: TObject; var Key: Char);
  private
    function EjecutarCapturandoSalida(
      const AExePath, ATrn, AEncf: string;
      out ASalida: string;
      out AExitCode: Cardinal): Boolean;

    function EsTRNValido(const AValor: string): Boolean;
    function EsENCFValido(const AValor: string): Boolean;

    function BuscarLineaD7A(const ASalida: string): string;
    procedure SplitPipe(const AValue: string; AParts: TStrings);
    function DecodeD7(const AValue: string): string;
    procedure MostrarResultadoAuditoria(
      const ASalida: string;
      const AExitCode: Cardinal);

    function QuoteCmd(const AValue: string): string;
  public
  end;

var
  frmAuditoriaECF: TfrmAuditoriaECF;

implementation
  uses UGlobal;
{$R *.dfm}

const
  AUDIT_TIMEOUT_MS = 180000; // 3 minutos

procedure TfrmAuditoriaECF.FormCreate(Sender: TObject);
begin
  Caption := 'Auditoria e-CF - XML Firmado vs PointSaleSoft';

  if (GlbRutaEcf = '') then
  edtRutaExe.Text := IncludeTrailingPathDelimiter(
    ExtractFilePath(Application.ExeName)) + 'IdesiToolECF.exe'
  else
  edtRutaExe.Text := GlbRutaEcf;

  memResultado.Clear;
  lblEstado.Caption := 'PENDIENTE';
  lblEstado.Font.Color := clNavy;
  lblOrigenXML.Caption := '-';

  OpenDialog1.Filter := 'IdesiToolECF.exe|IdesiToolECF.exe|Ejecutables (*.exe)|*.exe';
  OpenDialog1.Options := OpenDialog1.Options + [ofFileMustExist, ofPathMustExist];
end;

procedure TfrmAuditoriaECF.btnBuscarExeClick(Sender: TObject);
begin
  OpenDialog1.FileName := edtRutaExe.Text;

  if OpenDialog1.Execute then
    edtRutaExe.Text := OpenDialog1.FileName;
end;

procedure TfrmAuditoriaECF.edtTRNKeyPress(
  Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmAuditoriaECF.edtENCFKeyPress(
  Sender: TObject;
  var Key: Char);
begin
  Key := UpCase(Key);

  if not (Key in ['E', '0'..'9', #8]) then
    Key := #0;
end;

function TfrmAuditoriaECF.EsTRNValido(
  const AValor: string): Boolean;
var
  I: Integer;
  S: string;
begin
  Result := False;
  S := Trim(AValor);

  if S = '' then
    Exit;

  for I := 1 to Length(S) do
    if not (S[I] in ['0'..'9']) then
      Exit;

  Result := True;
end;

function TfrmAuditoriaECF.EsENCFValido(
  const AValor: string): Boolean;
var
  I: Integer;
  S: string;
begin
  Result := False;
  S := UpperCase(Trim(AValor));

  if Length(S) <> 13 then
    Exit;

  if S[1] <> 'E' then
    Exit;

  for I := 2 to Length(S) do
    if not (S[I] in ['0'..'9']) then
      Exit;

  Result := True;
end;

function TfrmAuditoriaECF.QuoteCmd(
  const AValue: string): string;
begin
  Result := '"' + StringReplace(
    AValue, '"', '\"', [rfReplaceAll]) + '"';
end;

procedure TfrmAuditoriaECF.btnAuditarClick(Sender: TObject);
var
  LExe: string;
  LTrn: string;
  LEncf: string;
  LSalida: string;
  LExitCode: Cardinal;
  LOk: Boolean;
begin
  LExe := Trim(edtRutaExe.Text);
  LTrn := Trim(edtTRN.Text);
  LEncf := UpperCase(Trim(edtENCF.Text));

  if not FileExists(LExe) then
  begin
    MessageDlg(
      'No se encontro IdesiToolECF.exe en la ruta indicada.',
      mtError,
      [mbOK],
      0);
    edtRutaExe.SetFocus;
    Exit;
  end;

  if not EsTRNValido(LTrn) then
  begin
    MessageDlg(
      'Indique un numero de transaccion valido.',
      mtWarning,
      [mbOK],
      0);
    edtTRN.SetFocus;
    Exit;
  end;

  if not EsENCFValido(LEncF) then
  begin
    MessageDlg(
      'El eNCF debe tener el formato E + 12 digitos.' + #13#10 +
      'Ejemplo: E310000002020',
      mtWarning,
      [mbOK],
      0);
    edtENCF.SetFocus;
    Exit;
  end;

  btnAuditar.Enabled := False;
  Screen.Cursor := crHourGlass;

  lblEstado.Caption := 'AUDITANDO...';
  lblEstado.Font.Color := clNavy;
  lblOrigenXML.Caption := '-';

  memResultado.Clear;
  memResultado.Lines.Add(
    'Ejecutando: ' + LExe +
    ' --audit-ecf ' + LTrn + ' ' + LEncf);
  memResultado.Lines.Add('');

  Application.ProcessMessages;

  try
    LOk := EjecutarCapturandoSalida(
      LExe,
      LTrn,
      LEncf,
      LSalida,
      LExitCode);

    if Trim(LSalida) <> '' then
    begin
      memResultado.Lines.Add('--- Salida IdesiToolECF ---');
      memResultado.Lines.Add(LSalida);
    end;

    if not LOk then
    begin
      lblEstado.Caption := 'ERROR EJECUCION';
      lblEstado.Font.Color := clRed;

      MessageDlg(
        'No fue posible ejecutar la auditoria.' + #13#10 +
        'Revise la salida mostrada en el formulario.',
        mtError,
        [mbOK],
        0);

      Exit;
    end;

    MostrarResultadoAuditoria(
      LSalida,
      LExitCode);
  finally
    Screen.Cursor := crDefault;
    btnAuditar.Enabled := True;
  end;
end;

function TfrmAuditoriaECF.EjecutarCapturandoSalida(
  const AExePath, ATrn, AEncf: string;
  out ASalida: string;
  out AExitCode: Cardinal): Boolean;
var
  LSecurity: TSecurityAttributes;
  LStartup: TStartupInfo;
  LProcess: TProcessInformation;

  LReadPipe: THandle;
  LWritePipe: THandle;
  LNullInput: THandle;

  LCmd: string;
  LWorkDir: string;
  LCmdBuffer: PChar;

  LBuffer: array[0..4095] of Char;
  LBytesRead: DWORD;
  LBytesAvailable: DWORD;
  LBytesToRead: DWORD;

  LChunk: string;
  LProcessCode: DWORD;

  LStartTick: DWORD;
  LTimedOut: Boolean;

  procedure LeerDisponible;
  begin
    repeat
      LBytesAvailable := 0;

      if not PeekNamedPipe(
        LReadPipe,
        nil,
        0,
        nil,
        @LBytesAvailable,
        nil) then
        Exit;

      if LBytesAvailable = 0 then
        Exit;

      LBytesToRead := LBytesAvailable;

      if LBytesToRead > SizeOf(LBuffer) then
        LBytesToRead := SizeOf(LBuffer);

      LBytesRead := 0;

      if not ReadFile(
        LReadPipe,
        LBuffer[0],
        LBytesToRead,
        LBytesRead,
        nil) then
        Exit;

      if LBytesRead > 0 then
      begin
        SetString(
          LChunk,
          PChar(@LBuffer[0]),
          LBytesRead);

        ASalida := ASalida + LChunk;
      end;

    until LBytesRead = 0;
  end;

begin
  Result := False;
  ASalida := '';
  AExitCode := Cardinal(-1);

  LReadPipe := 0;
  LWritePipe := 0;
  LNullInput := INVALID_HANDLE_VALUE;
  FillChar(LSecurity, SizeOf(LSecurity), 0);
  LSecurity.nLength := SizeOf(LSecurity);
  LSecurity.bInheritHandle := True;
  LSecurity.lpSecurityDescriptor := nil;

  if not CreatePipe(
    LReadPipe,
    LWritePipe,
    @LSecurity,
    0) then
  begin
    ASalida := 'CreatePipe fallo. Error Windows=' +
      IntToStr(GetLastError);
    Exit;
  end;

  try
    SetHandleInformation(
      LReadPipe,
      HANDLE_FLAG_INHERIT,
      0);

          // PointSaleSoft es una aplicacion GUI y normalmente NO tiene
    // STD_INPUT_HANDLE valido. Si heredamos ese handle, CreateProcess
    // puede fallar con ERROR_INVALID_HANDLE y no recibimos ninguna salida.
    // Usamos NUL como stdin heredable para el proceso de consola.
    LNullInput := CreateFile(
      'NUL',
      GENERIC_READ,
      FILE_SHARE_READ or FILE_SHARE_WRITE,
      @LSecurity,
      OPEN_EXISTING,
      FILE_ATTRIBUTE_NORMAL,
      0);

    if LNullInput = INVALID_HANDLE_VALUE then
    begin
      ASalida := 'No se pudo abrir NUL para stdin. Error Windows=' +
        IntToStr(GetLastError);
      Exit;
    end;
    
    FillChar(LStartup, SizeOf(LStartup), 0);
    LStartup.cb := SizeOf(LStartup);
    LStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
    LStartup.wShowWindow := SW_HIDE;
    LStartup.hStdOutput := LWritePipe;
    LStartup.hStdError := LWritePipe;
    //LStartup.hStdInput := GetStdHandle(STD_INPUT_HANDLE);
    LStartup.hStdInput := LNullInput;

    FillChar(LProcess, SizeOf(LProcess), 0);

    LCmd :=
      QuoteCmd(AExePath) +
      ' --audit-ecf ' +
      QuoteCmd(ATrn) + ' ' +
      QuoteCmd(AEncf);

    LWorkDir :=
      ExcludeTrailingPathDelimiter(
        ExtractFilePath(AExePath));

    GetMem(
      LCmdBuffer,
      (Length(LCmd) + 1) * SizeOf(Char));

    try
      StrPCopy(
        LCmdBuffer,
        LCmd);

      if not CreateProcess(
        nil,
        LCmdBuffer,
        nil,
        nil,
        True,
        CREATE_NO_WINDOW,
        nil,
        PChar(LWorkDir),
        LStartup,
        LProcess) then
      begin
        ASalida :=
          'CreateProcess fallo. Error Windows=' +
          IntToStr(GetLastError);
        Exit;
      end;
    finally
      FreeMem(LCmdBuffer);
    end;

    try
      CloseHandle(LWritePipe);
      LWritePipe := 0;

      LStartTick := GetTickCount;
      LTimedOut := False;

      repeat
        LeerDisponible;

        if not GetExitCodeProcess(
          LProcess.hProcess,
          LProcessCode) then
        begin
          ASalida := ASalida + #13#10 +
            'No se pudo obtener ExitCode del proceso.';
          Break;
        end;

        if LProcessCode <> STILL_ACTIVE then
          Break;

        if (GetTickCount - LStartTick) >= AUDIT_TIMEOUT_MS then
        begin
          LTimedOut := True;

          TerminateProcess(
            LProcess.hProcess,
            99);

          ASalida := ASalida + #13#10 +
            'ERROR: La auditoria excedio el tiempo maximo de ' +
            IntToStr(AUDIT_TIMEOUT_MS div 1000) +
            ' segundos.';

          Break;
        end;

        Application.ProcessMessages;
        Sleep(25);

      until False;

      WaitForSingleObject(
        LProcess.hProcess,
        2000);

      LeerDisponible;

      if GetExitCodeProcess(
        LProcess.hProcess,
        LProcessCode) then
        AExitCode := LProcessCode
      else
        AExitCode := Cardinal(-1);

      Result := not LTimedOut;

    finally
      if LProcess.hThread <> 0 then
        CloseHandle(LProcess.hThread);

      if LProcess.hProcess <> 0 then
        CloseHandle(LProcess.hProcess);
    end;

  finally
    if LNullInput <> INVALID_HANDLE_VALUE then
    CloseHandle(LNullInput);
      
    if LWritePipe <> 0 then
      CloseHandle(LWritePipe);

    if LReadPipe <> 0 then
      CloseHandle(LReadPipe);
  end;
end;

function TfrmAuditoriaECF.BuscarLineaD7A(
  const ASalida: string): string;
var
  LLines: TStringList;
  I: Integer;
  LLine: string;
begin
  Result := '';

  LLines := TStringList.Create;
  try
    LLines.Text := StringReplace(
      ASalida,
      #13#10,
      #10,
      [rfReplaceAll]);

    for I := 0 to LLines.Count - 1 do
    begin
      LLine := Trim(LLines[I]);

      if Pos('D7A|', LLine) = 1 then
        Result := LLine;
    end;
  finally
    LLines.Free;
  end;
end;

procedure TfrmAuditoriaECF.SplitPipe(
  const AValue: string;
  AParts: TStrings);
var
  I: Integer;
  LStart: Integer;
begin
  AParts.Clear;

  LStart := 1;

  for I := 1 to Length(AValue) do
  begin
    if AValue[I] = '|' then
    begin
      AParts.Add(
        Copy(
          AValue,
          LStart,
          I - LStart));

      LStart := I + 1;
    end;
  end;

  AParts.Add(
    Copy(
      AValue,
      LStart,
      Length(AValue) - LStart + 1));
end;

function TfrmAuditoriaECF.DecodeD7(
  const AValue: string): string;
begin
  Result := StringReplace(
    AValue,
    '%7C',
    '|',
    [rfReplaceAll, rfIgnoreCase]);
end;

procedure TfrmAuditoriaECF.MostrarResultadoAuditoria(
  const ASalida: string;
  const AExitCode: Cardinal);
var
  LProtocolLine: string;
  LParts: TStringList;
  LEstado: string;
  LOrigen: string;
  LMensaje: string;
  I: Integer;
begin
  LProtocolLine :=
    BuscarLineaD7A(ASalida);

  if LProtocolLine = '' then
  begin
    lblEstado.Caption := 'RESPUESTA INVALIDA';
    lblEstado.Font.Color := clRed;
    lblOrigenXML.Caption := '-';

    memResultado.Lines.Add('');
    memResultado.Lines.Add(
      'No se encontro la linea de protocolo D7A|...');

    memResultado.Lines.Add(
      'ExitCode=' +
      IntToStr(Integer(AExitCode)));

    Exit;
  end;

  LParts := TStringList.Create;
  try
    SplitPipe(
      LProtocolLine,
      LParts);

    if LParts.Count < 7 then
    begin
      lblEstado.Caption := 'RESPUESTA INVALIDA';
      lblEstado.Font.Color := clRed;
      lblOrigenXML.Caption := '-';

      memResultado.Lines.Add('');
      memResultado.Lines.Add(
        'La linea D7A no contiene todos los campos esperados.');

      Exit;
    end;

    LEstado :=
      UpperCase(
        Trim(LParts[1]));

    LOrigen :=
      UpperCase(
        Trim(LParts[5]));

    LMensaje :=
      DecodeD7(LParts[6]);

    if LParts.Count > 7 then
    begin
      for I := 7 to LParts.Count - 1 do
        LMensaje :=
          LMensaje + '|' + DecodeD7(LParts[I]);
    end;

    lblEstado.Caption := LEstado;
    lblOrigenXML.Caption := LOrigen;

    if LEstado = 'CUADRADO' then
    begin
      lblEstado.Font.Color := clGreen;

      MessageDlg(
        'Auditoria completada.' + #13#10 +
        'El XML firmado esta cuadrado con PointSaleSoft.' + #13#10 +
        'Origen XML: ' + LOrigen,
        mtInformation,
        [mbOK],
        0);
    end
    else if LEstado = 'INCONSISTENTE' then
    begin
      lblEstado.Font.Color := clRed;

      MessageDlg(
        'Se detectaron inconsistencias entre PointSaleSoft ' +
        'y el XML firmado.' + #13#10 +
        LMensaje,
        mtWarning,
        [mbOK],
        0);
    end
    else
    begin
      lblEstado.Font.Color := clRed;

      MessageDlg(
        'La auditoria retorno ERROR.' + #13#10 +
        LMensaje,
        mtError,
        [mbOK],
        0);
    end;

    memResultado.Lines.Add('');
    memResultado.Lines.Add(
      '--- Resultado interpretado ---');

    memResultado.Lines.Add(
      'Estado: ' + LEstado);

    memResultado.Lines.Add(
      'TRN: ' + DecodeD7(LParts[2]));

    memResultado.Lines.Add(
      'eNCF: ' + DecodeD7(LParts[3]));

    memResultado.Lines.Add(
      'Cantidad diferencias: ' + DecodeD7(LParts[4]));

    memResultado.Lines.Add(
      'Origen XML: ' + LOrigen);

    memResultado.Lines.Add(
      'Mensaje: ' + LMensaje);

    memResultado.Lines.Add(
      'ExitCode: ' +
      IntToStr(Integer(AExitCode)));

  finally
    LParts.Free;
  end;
end;

end.
