unit UUtilecf;

interface

uses
  Forms, SysUtils, Windows, Dialogs, Controls,
  ShellApi, DateUtils, Messages, Graphics, IniFiles, Variants,
  StrUtils, ExtCtrls, ShlObj, Classes,
  Math, StdCtrls, Registry, ComObj, ComCtrls;

type
  TPipePair = record
    ReadHandle: THandle;
    WriteHandle: THandle;
  end;

function RunAndCaptureStdOut(const ExePath, Params: string; out ExitCode: Cardinal): string;
procedure SplitPipeLine(const Line: string; var Estado, Mensaje, TrackId, Encf: string);
function EjecutarECF_y_Mostrar(const ExePath, TRN: string; var msg: string): Boolean;
function UnescapePipes(const S: string): string;

function EjecutarProcesoCapturandoSalida(
  const ExePath, Params, WorkDir: string;
  out   ExitCode: Cardinal;
  out   StdOut, StdErr: string;
  const TimeOutMS: Cardinal = 600000  // 10 minutos
): Boolean;

function EjecutarECF_CLI(
  const ExePath: string;
  const TRN, ENCF: string;   // ENCF vacío => envío normal; con ENCF => --resend TRN ENCF
  var   Mensaje: string;
  const TimeOutMS: Cardinal = 600000
): Boolean;

function EjecutarECF_CLIDown(
  const ExePath: string;
  const ENCF: string;
  var   Mensaje: string;
  const TimeOutMS: Cardinal = 600000
): Boolean;
function EjecutarECF_DownQRXML(const ExePath, ENCF: string; var msg: string): Boolean;
function EjecutarECF_Reenviar(const ExePath, TRN, ENCF: string; var msg: string): Boolean;
function EjecutarECF_CheckCertOnly(const ExePath, TRN: string; var msg: string): Boolean;
function EjecutarECF_RefreshCert(const ExePath, TRN: string; var msg: string): Boolean;
function ExecAndCapture(const ACmdLine, AWorkDir: string;
  out AOutput: string; out AExitCode: DWORD): Boolean;
procedure DeleteIfExists(const AFileName: string);
procedure PrepareFreshFacturaTxtArtifacts(const AArtifactDir: string);
implementation

uses
  UGlobal, UUtilecftimbre;

function UnescapePipes(const S: string): string;
begin
  Result := StringReplace(S, '%7C', '|', [rfReplaceAll, rfIgnoreCase]);
end;

function ExecAndCapture(const ACmdLine, AWorkDir: string;
  out AOutput: string; out AExitCode: DWORD): Boolean;
var
  SA: TSecurityAttributes;
  hRead, hWrite: THandle;
  SI: TStartupInfo;
  PI: TProcessInformation;
  Buffer: array[0..8191] of Byte;
  BytesRead: DWORD;
  AppRunning: DWORD;
  Cmd: string;
  MS: TMemoryStream;
  TempAnsi: AnsiString;

  procedure DrainPipeToStream;
  begin
    while PeekNamedPipe(hRead, nil, 0, nil, @BytesRead, nil) and (BytesRead > 0) do
    begin
      if BytesRead > SizeOf(Buffer) then
        BytesRead := SizeOf(Buffer);

      if ReadFile(hRead, Buffer, BytesRead, BytesRead, nil) and (BytesRead > 0) then
        MS.WriteBuffer(Buffer[0], BytesRead)
      else
        Break;
    end;
  end;

begin
  Result := False;
  AOutput := '';
  AExitCode := DWORD(-1);
  hRead := 0;
  hWrite := 0;

  FillChar(SA, SizeOf(SA), 0);
  SA.nLength := SizeOf(SA);
  SA.bInheritHandle := True;
  SA.lpSecurityDescriptor := nil;

  if not CreatePipe(hRead, hWrite, @SA, 0) then
    Exit;

  try
    // El hijo NO debe heredar el extremo de lectura
    if not SetHandleInformation(hRead, HANDLE_FLAG_INHERIT, 0) then
      Exit;

    FillChar(SI, SizeOf(SI), 0);
    SI.cb := SizeOf(SI);
    SI.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
    SI.wShowWindow := SW_HIDE;
    SI.hStdInput := GetStdHandle(STD_INPUT_HANDLE);
    SI.hStdOutput := hWrite;
    SI.hStdError := hWrite;

    FillChar(PI, SizeOf(PI), 0);

    Cmd := ACmdLine;

    Result := CreateProcess(
      nil,
      PChar(Cmd),
      nil,
      nil,
      True,
      NORMAL_PRIORITY_CLASS or CREATE_NO_WINDOW,
      nil,
      PChar(AWorkDir),
      SI,
      PI
    );

    if not Result then
      Exit;

    // El padre ya no escribe al pipe
    CloseHandle(hWrite);
    hWrite := 0;

    MS := TMemoryStream.Create;
    try
      repeat
        AppRunning := WaitForSingleObject(PI.hProcess, 100);
        DrainPipeToStream;
      until AppRunning <> WAIT_TIMEOUT;

      // Drenado final obligatorio
      DrainPipeToStream;

      // Espera final de seguridad
      WaitForSingleObject(PI.hProcess, INFINITE);

      if not GetExitCodeProcess(PI.hProcess, AExitCode) then
        AExitCode := DWORD(-1);

      if MS.Size > 0 then
      begin
        SetLength(TempAnsi, MS.Size);
        MS.Position := 0;
        MS.ReadBuffer(Pointer(TempAnsi)^, MS.Size);
        AOutput := string(TempAnsi);
      end
      else
        AOutput := '';

      Result := True;
    finally
      MS.Free;
      CloseHandle(PI.hThread);
      CloseHandle(PI.hProcess);
    end;

  finally
    if hWrite <> 0 then
      CloseHandle(hWrite);
    if hRead <> 0 then
      CloseHandle(hRead);
  end;
end;

procedure DeleteIfExists(const AFileName: string);
begin
  if FileExists(AFileName) then
    SysUtils.DeleteFile(AFileName);
end;

procedure PrepareFreshFacturaTxtArtifacts(const AArtifactDir: string);
begin
  if Trim(AArtifactDir) = '' then
    Exit;

  if DirectoryExists(AArtifactDir) then
  begin
    DeleteIfExists(IncludeTrailingPathDelimiter(AArtifactDir) + 'tracking.txt');
    DeleteIfExists(IncludeTrailingPathDelimiter(AArtifactDir) + 'factura_txt.log');
  end;
end;

function RunAndCaptureStdOut(const ExePath, Params: string; out ExitCode: Cardinal): string;
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  StdOutRead, StdOutWrite: THandle;
  Buffer: array[0..16383] of AnsiChar;
  BytesRead: DWORD;
  Cmd: string;
  Ok: BOOL;
  MS: TMemoryStream;
begin
  Result := '';
  ExitCode := Cardinal(-1);

  ZeroMemory(@SA, SizeOf(SA));
  SA.nLength := SizeOf(SA);
  SA.bInheritHandle := True;
  SA.lpSecurityDescriptor := nil;

  StdOutRead := 0;
  StdOutWrite := 0;

  if not CreatePipe(StdOutRead, StdOutWrite, @SA, 0) then
    RaiseLastOSError;

  try
    // El hijo NO debe heredar el extremo de lectura
    if not SetHandleInformation(StdOutRead, HANDLE_FLAG_INHERIT, 0) then
      RaiseLastOSError;

    ZeroMemory(@SI, SizeOf(SI));
    SI.cb := SizeOf(SI);
    SI.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
    SI.wShowWindow := SW_HIDE;
    SI.hStdOutput := StdOutWrite;
    SI.hStdError := StdOutWrite;
    SI.hStdInput := GetStdHandle(STD_INPUT_HANDLE);

    ZeroMemory(@PI, SizeOf(PI));

    Cmd := '"' + ExePath + '"';
    if Trim(Params) <> '' then
      Cmd := Cmd + ' ' + Params;

    if not CreateProcess(
      nil,
      PChar(Cmd),
      nil,
      nil,
      True,
      NORMAL_PRIORITY_CLASS or CREATE_NO_WINDOW,
      nil,
      PChar(ExtractFilePath(ExePath)),
      SI,
      PI
    ) then
      RaiseLastOSError;

    // Este extremo ya no lo usa el padre
    CloseHandle(StdOutWrite);
    StdOutWrite := 0;

    MS := TMemoryStream.Create;
    try
      repeat
        BytesRead := 0;
        Ok := ReadFile(StdOutRead, Buffer, SizeOf(Buffer), BytesRead, nil);

        if (not Ok) or (BytesRead = 0) then
          Break;

        MS.WriteBuffer(Buffer, BytesRead);
      until False;

      WaitForSingleObject(PI.hProcess, INFINITE);

      if not GetExitCodeProcess(PI.hProcess, ExitCode) then
        ExitCode := Cardinal(-1);

      if MS.Size > 0 then
      begin
        SetLength(Result, MS.Size);
        MS.Position := 0;
        MS.ReadBuffer(Pointer(Result)^, MS.Size);
      end
      else
        Result := '';
    finally
      MS.Free;
      CloseHandle(PI.hThread);
      CloseHandle(PI.hProcess);
    end;
  finally
    if StdOutRead <> 0 then
      CloseHandle(StdOutRead);
    if StdOutWrite <> 0 then
      CloseHandle(StdOutWrite);
  end;
end;

//revisar por lentitud -sustituido por anterior
{
function RunAndCaptureStdOut(const ExePath, Params: string; out ExitCode: Cardinal): string;
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  StdOutRead, StdOutWrite: THandle;
  Buffer: array[0..4095] of AnsiChar;
  BytesRead: DWORD;
  Cmd: string;
  ok: BOOL;
  chunk: AnsiString;
begin
  Result := '';
  ExitCode := Cardinal(-1);

  ZeroMemory(@SA, SizeOf(SA));
  SA.nLength := SizeOf(SA);
  SA.bInheritHandle := True;

  StdOutRead := 0;
  StdOutWrite := 0;

  if not CreatePipe(StdOutRead, StdOutWrite, @SA, 0) then
    RaiseLastOSError;

  try
    ZeroMemory(@SI, SizeOf(SI));
    SI.cb := SizeOf(SI);
    SI.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
    SI.wShowWindow := SW_HIDE;
    SI.hStdOutput := StdOutWrite;
    SI.hStdError  := StdOutWrite;

    ZeroMemory(@PI, SizeOf(PI));

    Cmd := '"' + ExePath + '"';
    if Trim(Params) <> '' then
      Cmd := Cmd + ' ' + Params;

    if not CreateProcess(
      nil,
      PChar(Cmd),
      nil,
      nil,
      True, // inherit handles
      NORMAL_PRIORITY_CLASS,
      nil,
      PChar(ExtractFilePath(ExePath)),
      SI,
      PI
    ) then
      RaiseLastOSError;

    // ya no necesitamos escribir hacia el proceso
    CloseHandle(StdOutWrite);
    StdOutWrite := 0;

    try
      repeat    //este repeat es muy lento
        BytesRead := 0;
        ok := ReadFile(StdOutRead, Buffer, SizeOf(Buffer), BytesRead, nil);
        if not ok or (BytesRead = 0) then
          Break;
        SetString(chunk, Buffer, BytesRead);
        Result := Result + string(chunk);
      until False;

      if not GetExitCodeProcess(PI.hProcess, ExitCode) then
        ExitCode := Cardinal(-1);

      WaitForSingleObject(PI.hProcess, INFINITE);
    finally
      CloseHandle(PI.hProcess);
      CloseHandle(PI.hThread);
    end;
  finally
    if StdOutRead <> 0 then
      CloseHandle(StdOutRead);
    if StdOutWrite <> 0 then
      CloseHandle(StdOutWrite);
  end;
end;
}
procedure SplitPipeLine(const Line: string; var Estado, Mensaje, TrackId, Encf: string);
var
  P1, P2, P3, P4: Integer;

  function UnEscape(const S: string): string;
  begin
    Result := StringReplace(S, '%7C', '|', [rfReplaceAll]);
  end;

begin
  Estado  := '';
  Mensaje := '';
  TrackId := '';
  Encf    := '';

  if Copy(Line, 1, 3) <> 'D7|' then
    Exit;

  // Formato: D7|<ESTADO>|<MENSAJE>|<TRACKID>|<ENCF>
  P1 := Pos('|', Line);
  if P1 = 0 then Exit;
  P2 := PosEx('|', Line, P1 + 1);
  if P2 = 0 then Exit;
  P3 := PosEx('|', Line, P2 + 1);
  if P3 = 0 then Exit;
  P4 := PosEx('|', Line, P3 + 1);
  if P4 = 0 then Exit;

  Estado  := Copy(Line, P1 + 1, P2 - P1 - 1);
  Mensaje := UnEscape(Copy(Line, P2 + 1, P3 - P2 - 1));
  TrackId := UnEscape(Copy(Line, P3 + 1, P4 - P3 - 1));
  Encf    := UnEscape(Copy(Line, P4 + 1, MaxInt));
end;

function EjecutarECF_y_Mostrar(const ExePath, TRN: string; var msg: string): Boolean;
var
  OutAll: string;
  ExitCode: Cardinal;
  SL: TStringList;
  i: Integer;
  Estado, Mensaje, TrackId, Encf: string;
  ReturnTimbre: string;

  function StartsWith(const S, Prefix: string): Boolean;
  begin
    Result := (Length(S) >= Length(Prefix)) and
              (AnsiCompareText(Copy(S, 1, Length(Prefix)), Prefix) = 0);
  end;

  function ContainsText(const S, Sub: string): Boolean;
  begin
    Result := Pos(AnsiUpperCase(Sub), AnsiUpperCase(S)) > 0;
  end;

  function TrimAll(const S: string): string;
  var
    T: string;
  begin
    T := S;
    while (Length(T) > 0) and (T[1] <= ' ') do
      Delete(T, 1, 1);
    while (Length(T) > 0) and (T[Length(T)] <= ' ') do
      SetLength(T, Length(T) - 1);
    Result := T;
  end;

  function ExtractFirstENCF(const S: string): string;
  var
    i, j: Integer;
  begin
    Result := '';
    for i := 1 to Length(S) do
      if (S[i] = 'E') and (i < Length(S)) and (S[i+1] in ['0'..'9']) then
      begin
        j := i + 2;
        while (j <= Length(S)) and (S[j] in ['0'..'9']) do
          Inc(j);
        if (j - i) >= 12 then
        begin
          Result := Copy(S, i, j - i);
          Exit;
        end;
      end;
  end;

  procedure FallbackParse(const Text: string; var AEstado, AMensaje, AEncf: string);
  var
    L: TStringList;
    k: Integer;
    line, tmp: string;
  begin
    L := TStringList.Create;
    try
      L.Text := Text;

      // 1) Estado
      AEstado := '';
      for k := L.Count - 1 downto 0 do
      begin
        line := TrimAll(L[k]);
        if line = '' then
          Continue;
        if ContainsText(line, 'ACEPTADO CONDICIONAL') then
        begin
          AEstado := 'ACEPTADO';
          Break;
        end;
        if ContainsText(line, 'ACEPTADO') then
        begin
          AEstado := 'ACEPTADO';
          Break;
        end;
        if ContainsText(line, 'RECHAZADO') then
        begin
          AEstado := 'RECHAZADO';
          Break;
        end;
      end;

      if AEstado = '' then
      begin
        case ExitCode of
          0: AEstado := 'ACEPTADO';
          2: AEstado := 'RECHAZADO';
        else
          AEstado := 'ERROR';
        end;
      end;

      // 2) e-CF (Secuencia)
      AEncf := '';
      for k := L.Count - 1 downto 0 do
      begin
        line := TrimAll(L[k]);
        if ContainsText(line, 'SECUENCIA:') then
        begin
          tmp := Copy(line, Pos(':', line) + 1, MaxInt);
          AEncf := TrimAll(tmp);
          Break;
        end;
        // si no hay "Secuencia:", intenta extraer un token con pinta de e-CF
        tmp := ExtractFirstENCF(line);
        if tmp <> '' then
        begin
          AEncf := tmp;
          Break;
        end;
      end;

      // 3) Mensaje de error (última línea significativa)
      AMensaje := '';
      for k := L.Count - 1 downto 0 do
      begin
        line := TrimAll(L[k]);
        if GlbEsDebugFiscal = 1 then
          LogInformacionTxt(line);
        if line = '' then
          Continue;
        if StartsWith(line, 'D7|') or StartsWith(line, 'D7T|') then
          Continue;
        if StartsWith(line, '[LOG]') then
          Continue;
        if StartsWith(line, '[API') then
          Continue;
        if ContainsText(line, 'DGII RECHAZ') then
          Continue;
        if ContainsText(line, 'JSON') then
          Continue;
        if (line <> '') and (line[1] in ['{', '[']) then
          Continue; // probable JSON
        AMensaje := line;
        Break;
      end;
    finally
      L.Free;
    end;
  end;

  function PrettyEstado(const S: string): string;
  begin
    if AnsiSameText(S, 'ACEPTADO') then
      Result := 'Aceptado'
    else if AnsiSameText(S, 'RECHAZADO') then
      Result := 'Rechazado por DGII'
    else if AnsiSameText(S, 'RECH_LOCAL') then
      Result := 'Rechazado localmente (no se envió a la DGII)'
    else if AnsiSameText(S, 'NOT_FOUND') then
      Result := 'No encontrado en DGII'
    else if AnsiSameText(S, 'IN_PROCESS') then
      Result := 'En proceso en DGII'
    else if AnsiSameText(S, 'PENDIENTE') then
      Result := 'Pendiente de procesamiento'
    else if AnsiSameText(S, 'ERROR') then
      Result := 'Error'
    else
      Result := S;
  end;

begin
  OutAll := RunAndCaptureStdOut(ExePath, TRN, ExitCode);

  SL := TStringList.Create;
  try
    SL.Text := OutAll;

    Estado := '';
    Mensaje := '';
    TrackId := '';
    Encf := '';
    ReturnTimbre := '';

    // 1) Preferir líneas estructuradas D7| y D7T|
    for i := SL.Count - 1 downto 0 do
    begin
      if StartsWith(SL[i], 'D7|') then
      begin
        SplitPipeLine(SL[i], Estado, Mensaje, TrackId, Encf);
        Break;
      end
      else if StartsWith(SL[i], 'D7T|') then
      begin
        ReturnTimbre := StringReplace(Copy(SL[i], 4, MaxInt), '%7C', '|', [rfReplaceAll]);
        // seguimos buscando D7| por si aparece más arriba
      end;
    end;

    // 2) Si no hubo D7|, aplicar parser de respaldo sobre todo el log
    if Estado = '' then
      FallbackParse(OutAll, Estado, Mensaje, Encf);

    // 3) Mensaje final al usuario
    if not AnsiSameText(Estado, 'ACEPTADO') then
    begin
      if Encf = '' then
        Encf := '(desconocido)';
      if Mensaje = '' then
        Mensaje := 'Error no especificado.';
      msg := 'e-CF: ' + Encf + #13#10 +
             'Estado: ' + PrettyEstado(Estado) + #13#10 +
             'Error: ' + Mensaje;
      Result := False;
      Exit;
    end;

    // 4) Aceptado: opcionalmente guardar timbre
    Result := True;
    if ReturnTimbre <> '' then
      UUtilecftimbre.GuardarTimbreEjemplo(StrToIntDef(TRN, 0), UnescapePipes(ReturnTimbre));

    msg := 'ECF ACEPTADO.'#13#10'TrackId: ' + TrackId + #13#10'NCF: ' + Encf;
  finally
    SL.Free;
  end;
end;

// --- Versión simplificada: usa RunAndCaptureStdOut internamente ---
// Si en el futuro quieres stdout/stderr separados, aquí se puede extender con pipes dobles.
function EjecutarProcesoCapturandoSalida(
  const ExePath, Params, WorkDir: string;
  out   ExitCode: Cardinal;
  out   StdOut, StdErr: string;
  const TimeOutMS: Cardinal
): Boolean;
var
  dummy: Cardinal;
  usePath: string;
begin
  StdErr := '';
  ExitCode := Cardinal(-1);

  if WorkDir <> '' then
    usePath := WorkDir
  else
    usePath := ExtractFilePath(ExePath);

  // En esta implementación usamos solo stdout; el CLI actual escribe todo lo relevante ahí.
  StdOut := RunAndCaptureStdOut(ExePath, Params, dummy);
  ExitCode := dummy;

  Result := (ExitCode = 0);
end;

function EjecutarECF_CLIDown(
  const ExePath: string;
  const ENCF: string;
  var   Mensaje: string;
  const TimeOutMS: Cardinal = 600000
): Boolean;
var
  exitCode: Cardinal;
  so, se: string;
  params: string;
begin
  // Construcción de parámetros:
  //  - Con ENCF ? --resend TRN ENCF
  //  - Sin ENCF ? TRN
  if Trim(ENCF) <> '' then
    params := Format('--QRDown %s', [Trim(ENCF)])
  else
  begin
    Result:=false;
    exit;
  end;
  Result := EjecutarProcesoCapturandoSalida(
    ExePath,
    params,
    ExtractFilePath(ExePath),
    exitCode,
    so,
    se,
    TimeOutMS
  );

  // compone mensaje con stderr + stdout (si existen)
  Mensaje := '';
  if se <> '' then
    Mensaje := Mensaje + se;
  if so <> '' then
  begin
    if Mensaje <> '' then
      Mensaje := Mensaje + sLineBreak;
    Mensaje := Mensaje + so;
    LogInformacionTxt(so);
  end;

  // Éxito si ExitCode == 0
  Result := Result and (exitCode = 0);
end;

function EjecutarECF_CLI(
  const ExePath: string;
  const TRN, ENCF: string;
  var   Mensaje: string;
  const TimeOutMS: Cardinal
): Boolean;
var
  exitCode: Cardinal;
  so, se: string;
  params: string;
begin
  // Construcción de parámetros:
  //  - Con ENCF ? --resend TRN ENCF
  //  - Sin ENCF ? TRN
  if Trim(ENCF) <> '' then
    params := Format('--resend %s %s', [Trim(TRN), Trim(ENCF)])
  else
    params := Trim(TRN);

  Result := EjecutarProcesoCapturandoSalida(
    ExePath,
    params,
    ExtractFilePath(ExePath),
    exitCode,
    so,
    se,
    TimeOutMS
  );

  // compone mensaje con stderr + stdout (si existen)
  Mensaje := '';
  if se <> '' then
    Mensaje := Mensaje + se;
  if so <> '' then
  begin
    if Mensaje <> '' then
      Mensaje := Mensaje + sLineBreak;
    Mensaje := Mensaje + so;
  end;

  // Éxito si ExitCode == 0
  Result := Result and (exitCode = 0);
end;

function EjecutarECF_DownQRXML(const ExePath, ENCF: string; var msg: string): Boolean;
begin
  Result := EjecutarECF_CLIDown(ExePath, ENCF, msg);
end;

function EjecutarECF_Reenviar(const ExePath, TRN, ENCF: string; var msg: string): Boolean;
begin
  // Reenvío explícito: delega en EjecutarECF_CLI que construye "--resend TRN ENCF"
  Result := EjecutarECF_CLI(ExePath, TRN, ENCF, msg);
end;

function EjecutarECF_CheckCertOnly(const ExePath, TRN: string; var msg: string): Boolean;
var
  exitCode: Cardinal;
  so: string;
begin
  // Verificación del certificado sin enviar e-CF
  so := RunAndCaptureStdOut(ExePath, Format('--check-cert-only %s', [Trim(TRN)]), exitCode);
  Result := (exitCode = 0);
  if Result then
  begin
    if Trim(so) = '' then
      msg := 'Certificado válido.'
    else
      msg := 'Certificado válido.' + sLineBreak + so;
  end
  else
  begin
    if Trim(so) = '' then
      msg := 'Error al verificar el certificado.'
    else
      msg := 'Error al verificar el certificado.' + sLineBreak + so;
  end;
end;

function EjecutarECF_RefreshCert(const ExePath, TRN: string; var msg: string): Boolean;
var
  exitCode: Cardinal;
  so: string;
begin
  // Forzar refresh del certificado antes de procesar el e-CF asociado al TRN
  so := RunAndCaptureStdOut(ExePath, Format('--refresh-cert %s', [Trim(TRN)]), exitCode);
  Result := (exitCode = 0);
  if Result then
  begin
    if Trim(so) = '' then
      msg := 'Operación completada con certificado refrescado y e-CF procesado.'
    else
      msg := so;
  end
  else
  begin
    if Trim(so) = '' then
      msg := 'Error al refrescar certificado / enviar e-CF.'
    else
      msg := so;
  end;
end;

end.

