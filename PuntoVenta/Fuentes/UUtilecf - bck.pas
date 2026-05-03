unit UUtilecf;

interface
 Uses Forms,Sysutils, Windows, Dialogs, Controls,
    ShellApi, DateUtils, Messages, Graphics,IniFiles, Variants,
    StrUtils, ExtCtrls, Shlobj,Classes,
    Math,  StdCtrls, Registry, comObj, ComCtrls;



function RunAndCaptureStdOut(const ExePath, Params: string; out ExitCode: Cardinal): string;
procedure SplitPipeLine(const Line: string; var Estado, Mensaje, TrackId, Encf: string);
function EjecutarECF_y_Mostrar(const ExePath, TRN: string;var msg:string):boolean;

implementation
uses
  UGlobal, UUtilecftimbre;

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
begin
  Result := '';
  ZeroMemory(@SA, SizeOf(SA));
  SA.nLength := SizeOf(SA);
  SA.bInheritHandle := True;

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

    Cmd := '"' + ExePath + '" ' + Params;

    if not CreateProcess(nil, PChar(Cmd), nil, nil, True, NORMAL_PRIORITY_CLASS, nil, nil, SI, PI) then
      RaiseLastOSError;

    // Muy importante: cerrar el lado de escritura en este proceso
    CloseHandle(StdOutWrite);

    repeat
      ok := ReadFile(StdOutRead, Buffer, SizeOf(Buffer), BytesRead, nil);
      if ok and (BytesRead > 0) then
        Result := Result + String(AnsiString(Copy(Buffer, 1, BytesRead)));
    until not ok or (BytesRead = 0);

    WaitForSingleObject(PI.hProcess, INFINITE);
    GetExitCodeProcess(PI.hProcess, ExitCode);
  finally
    CloseHandle(StdOutRead);
    if PI.hThread <> 0 then CloseHandle(PI.hThread);
    if PI.hProcess <> 0 then CloseHandle(PI.hProcess);
  end;
end;

procedure SplitPipeLine(const Line: string; var Estado, Mensaje, TrackId, Encf: string);
var
  P1, P2, P3, P4: Integer;
  tmp: string;
  function UnEscape(const S: string): string;
  begin
    // Quitar escapes simples que pusimos en C#
    Result := StringReplace(S, '%7C', '|', [rfReplaceAll]);
  end;
begin
  Estado := ''; Mensaje := ''; TrackId := ''; Encf := '';
  if Copy(Line, 1, 3) <> 'D7|' then Exit;

  // Partir manualmente por '|'
  // Formato: D7|<ESTADO>|<MENSAJE>|<TRACKID>|<ENCF>
  P1 := Pos('|', Line);             // después de D7
  if P1 = 0 then Exit;
  P2 := PosEx('|', Line, P1 + 1);   // fin ESTADO
  if P2 = 0 then Exit;
  P3 := PosEx('|', Line, P2 + 1);   // fin MENSAJE
  if P3 = 0 then Exit;
  P4 := PosEx('|', Line, P3 + 1);   // fin TRACKID
  if P4 = 0 then Exit;

  Estado  := Copy(Line, P1 + 1, P2 - P1 - 1);
  Mensaje := UnEscape(Copy(Line, P2 + 1, P3 - P2 - 1));
  TrackId := UnEscape(Copy(Line, P3 + 1, P4 - P3 - 1));
  Encf    := UnEscape(Copy(Line, P4 + 1, MaxInt));
end;

function EjecutarECF_y_Mostrar(const ExePath, TRN: string; var msg: string): boolean;
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
  var T: string;
  begin
    T := S;
    while (Length(T) > 0) and (T[1] <= ' ') do Delete(T, 1, 1);
    while (Length(T) > 0) and (T[Length(T)] <= ' ') do SetLength(T, Length(T) - 1);
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
        while (j <= Length(S)) and (S[j] in ['0'..'9']) do Inc(j);
        // longitud mínima razonable de un e-CF (E + 2 dígitos tipo + 9..12)
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
        if line = '' then Continue;
        if ContainsText(line, 'ACEPTADO CONDICIONAL') then begin AEstado := 'ACEPTADO'; Break; end;
        if ContainsText(line, 'ACEPTADO')            then begin AEstado := 'ACEPTADO'; Break; end;
        if ContainsText(line, 'RECHAZADO')           then begin AEstado := 'RECHAZADO'; Break; end;
      end;
      if AEstado = '' then
      begin
        // usa exit code si no se detectó texto
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
        if tmp <> '' then begin AEncf := tmp; Break; end;
      end;

      // 3) Mensaje de error (última línea significativa)
      AMensaje := '';
      for k := L.Count - 1 downto 0 do
      begin
        line := TrimAll(L[k]);
        if line = '' then Continue;
        if StartsWith(line, 'D7|') or StartsWith(line, 'D7T|') then Continue;
        if StartsWith(line, '[LOG]') then Continue;
        if StartsWith(line, '[API') then Continue;
        if ContainsText(line, 'DGII RECHAZÓ') then Continue;
        if ContainsText(line, 'JSON') then Continue;
        if (line <> '') and (line[1] in ['{','[']) then Continue; // probable JSON
        // esta debería ser la línea de error más humana (p.ej. "Este número de secuencia ya ha sido utilizado.")
        AMensaje := line;
        Break;
      end;
    finally
      L.Free;
    end;
  end;

  function PrettyEstado(const S: string): string;
  begin
    if AnsiSameText(S, 'ACEPTADO') then Result := 'Aceptado'
    else if AnsiSameText(S, 'RECHAZADO') then Result := 'Rechazado'
    else if AnsiSameText(S, 'ERROR') then Result := 'Error'
    else Result := S;
  end;

begin
  OutAll := RunAndCaptureStdOut(ExePath, TRN, ExitCode);

  SL := TStringList.Create;
  try
    SL.Text := OutAll;

    Estado := ''; Mensaje := ''; TrackId := ''; Encf := ''; ReturnTimbre := '';

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
      if Encf = '' then Encf := '(desconocido)';
      if Mensaje = '' then Mensaje := 'Error no especificado.';
      msg := 'e-CF: ' + Encf + #13#10 +
             'Estado: ' + PrettyEstado(Estado) + #13#10 +
             'Error: ' + Mensaje;
      Result := False;
      Exit;
    end;

    // 4) Aceptado: opcionalmente guardar timbre
    Result := True;
    if ReturnTimbre <> '' then
      UUtilecftimbre.GuardarTimbreEjemplo(StrToIntDef(TRN, 0), ReturnTimbre);

    msg := 'ECF ACEPTADO.'#13#10'TrackId: ' + TrackId + #13#10'NCF: ' + Encf;
  finally
    SL.Free;
  end;
end;
end.
