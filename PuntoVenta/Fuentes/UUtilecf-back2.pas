unit UUtilecf;

{
  Delphi 7 – Utilidades para integrar con IdesiToolECF.exe
  - Ejecuta el CLI, captura salida y exit code.
  - Parsea JSON/etiquetas/Línea D7T| para traer: Estado, Encf, TrackId, Mensaje, Error, QrUrl, Timbre.
  - Devuelve mensaje NORMALIZADO y boolean (True si ACEPTADO).
}

interface

uses
  Windows, SysUtils, Classes,StrUtils;

type
  TEcfEstado = (eeDesconocido, eeAceptado, eeRechazado, eeError);

  TEcfResult = record
    Estado       : TEcfEstado; // aceptado/rechazado/error
    EstadoStr    : string;     // texto crudo del estado
    Encf         : string;     // e-NCF (E31…)
    TrackId      : string;
    Mensaje      : string;     // observaciones / mensajes de DGII
    Error        : string;     // error local (si aplica)
    QrUrl        : string;     // URL QR (si disponible)
    TimbreInfo   : string;     // “codigoSeguridad|encf|fecha...|monto|urlImage|qrFile=...”
    RawOut       : string;     // salida cruda del proceso
    ExitCode     : Cardinal;   // 0=ACEPTADO, 2=RECHAZADO, 1=ERROR (contrato de la herramienta)
  end;

/// Ejecuta IdesiToolECF.exe con el TRN indicado.
/// msg: siempre devuelve un texto claro y consistente para mostrar al usuario.
/// Return: True si ACEPTADO; False en cualquier otro caso.
function EjecutarECF_y_Mostrar(const ExePath: string; const TRN: string; out msg: string): Boolean;

/// (Opcional) Ejecuta y devuelve el record completo (por si quieres inspecciones más avanzadas)
function EjecutarECF_y_Resultado(const ExePath, TRN: string; out Res: TEcfResult): Boolean;

implementation

{==================== Helpers de proceso / captura ====================}

function RunProcessCapture(const ExeFullPath, CmdLine: string; out ExitCode: Cardinal; out StdOut: string): Boolean;
var
  SA: TSecurityAttributes;
  hRead, hWrite: THandle;
  SI: TStartupInfo;
  PI: TProcessInformation;
  Buffer: array[0..4095] of AnsiChar;
  BytesRead: DWORD;
  AppCmd: string;
begin
  Result := False;
  StdOut := '';
  ExitCode := 0;

  ZeroMemory(@SA, SizeOf(SA));
  SA.nLength := SizeOf(SA);
  SA.bInheritHandle := True;

  if not CreatePipe(hRead, hWrite, @SA, 0) then Exit;

  try
    ZeroMemory(@SI, SizeOf(SI));
    SI.cb := SizeOf(SI);
    SI.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
    SI.wShowWindow := SW_HIDE;
    SI.hStdOutput := hWrite;
    SI.hStdError  := hWrite;
    SI.hStdInput  := GetStdHandle(STD_INPUT_HANDLE);

    ZeroMemory(@PI, SizeOf(PI));

    // Construir command line
    AppCmd := '"' + ExeFullPath + '" ' + CmdLine;

    if not CreateProcess(nil, PChar(AppCmd), nil, nil, True, NORMAL_PRIORITY_CLASS, nil, nil, SI, PI) then
      Exit;

    try
      // Cerrar el lado de escritura en este hilo
      CloseHandle(hWrite);

      // Leer salida
      repeat
        if not ReadFile(hRead, Buffer, SizeOf(Buffer), BytesRead, nil) then Break;
        if BytesRead > 0 then
          StdOut := StdOut + String(AnsiString(Copy(Buffer, 1, BytesRead)));
      until BytesRead = 0;

      // Esperar proceso y obtener código de salida
      WaitForSingleObject(PI.hProcess, INFINITE);
      GetExitCodeProcess(PI.hProcess, ExitCode);

      Result := True;
    finally
      CloseHandle(PI.hThread);
      CloseHandle(PI.hProcess);
    end;
  finally
    CloseHandle(hRead);
    // hWrite ya cerrado arriba
  end;
end;

function UrlDecode(const S: string): string;
var
  i, L: Integer;
  Hex: string;
  C: Char;
begin
  Result := '';
  i := 1; L := Length(S);
  while i <= L do
  begin
    C := S[i];
    if (C = '%') and (i + 2 <= L) then
    begin
      Hex := Copy(S, i + 1, 2);
      try
        Result := Result + Chr(StrToInt('$' + Hex));
        Inc(i, 3);
      except
        Result := Result + C;
        Inc(i);
      end;
    end
    else
    begin
      if C = '+' then Result := Result + ' ' else Result := Result + C;
      Inc(i);
    end;
  end;
end;

function TrimCRLF(const S: string): string;
begin
  Result := S;
  Result := StringReplace(Result, #13, ' ', [rfReplaceAll]);
  Result := StringReplace(Result, #10, ' ', [rfReplaceAll]);
  Result := Trim(Result);
end;

{==================== Helpers de parseo mínimo ====================}

// Devuelve la última ocurrencia de un objeto JSON “{ … }” en el texto, o '' si no hay.
function ExtractLastJsonObject(const S: string): string;
var
  i, L, StartPos, Depth: Integer;
begin
  Result := '';
  L := Length(S);
  StartPos := 0; Depth := 0;

  for i := 1 to L do
  begin
    if S[i] = '{' then
    begin
      if Depth = 0 then StartPos := i;
      Inc(Depth);
    end
    else if S[i] = '}' then
    begin
      Dec(Depth);
      if (Depth = 0) and (StartPos > 0) then
        Result := Copy(S, StartPos, i - StartPos + 1); // nos quedamos con el último “{…}”
    end;
  end;
end;

// Obtiene el valor de una clave simple "key":"value" en un JSON muy básico (sin escapar complejo)
function JsonGetString(const Json, Key: string): string;
var
  k, p, q, r: Integer;
  needle: string;
begin
  Result := '';
  needle := '"' + Key + '"';
  k := Pos(needle, Json);
  if k = 0 then Exit;

  p := PosEx(':', Json, k + Length(needle));
  if p = 0 then Exit;

  // buscar primera comilla
  q := PosEx('"', Json, p + 1);
  if q = 0 then Exit;

  // buscar comilla de cierre
  r := q + 1;
  while (r <= Length(Json)) and (Json[r] <> '"') do Inc(r);
  if r > Length(Json) then Exit;

  Result := Copy(Json, q + 1, r - q - 1);
end;

// Busca pattern 'Label: valor' (case-insensitive). Devuelve la primera coincidencia.
function ReadAfterLabel(const Text, LabelName: string): string;
var
  p: Integer;
  S, Lb: string;
begin
  S := Text;
  Lb := LabelName;
  p := Pos(UpperCase(Lb), UpperCase(S));
  if p > 0 then
  begin
    S := Copy(S, p + Length(Lb), MaxInt);
    // comer espacios y :
    while (Length(S) > 0) and (S[1] in [' ', #9, ':']) do
      Delete(S, 1, 1);
    // tomar hasta fin de linea o punto y coma si existiera
    if Pos(#10, S) > 0 then
      Result := Trim(Copy(S, 1, Pos(#10, S)-1))
    else
      Result := Trim(S);
  end
  else
    Result := '';
end;

function ToEstadoEnum(const S: string): TEcfEstado;
begin
  if SameText(S, 'ACEPTADO') then
  begin
    Result := eeAceptado; Exit;
  end
  else if SameText(S, 'RECHAZADO') then
  begin
    Result := eeRechazado; Exit;
  end
  else if SameText(S, 'ERROR') then
  begin
    Result := eeError; Exit;
  end;

  Result := eeDesconocido;
end;

function HasPrefix(const S, Prefix: string): Boolean;
begin
  Result := Copy(S, 1, Length(Prefix)) = Prefix;
end;

{----------------- Parser principal de la salida del CLI -----------------}
function ParseEcfOutput(const OutText: string; ExitCode: Cardinal): TEcfResult;
var
  json, estado, encf, track, mensaje, err, qr, d7tLine: string;
  lines: TStringList;
  i: Integer;
begin
  FillChar(Result, SizeOf(Result), 0);
  Result.RawOut := OutText;
  Result.ExitCode := ExitCode;

  // 1) Buscar línea D7T|… (timbre codificado)
  d7tLine := '';
  lines := TStringList.Create;
  try
    lines.Text := OutText;
    for i := 0 to lines.Count - 1 do
      if HasPrefix(Trim(lines[i]), 'D7T|') then
      begin
        d7tLine := Trim(lines[i]);
        Break;
      end;
  finally
    lines.Free;
  end;

  if d7tLine <> '' then
  begin
    // formato: D7T|<timbre string con %7C para pipes>
    Result.TimbreInfo := UrlDecode(Copy(d7tLine, 4, MaxInt));
  end;

  // 2) Intentar JSON (último objeto { … })
  json := ExtractLastJsonObject(OutText);
  if json <> '' then
  begin
    estado := JsonGetString(json, 'Estado');
    if estado = '' then estado := JsonGetString(json, 'estado'); // por si viene en minúscula

    encf   := JsonGetString(json, 'Encf');   if encf   = '' then encf   := JsonGetString(json, 'encf');
    track  := JsonGetString(json, 'TrackId');if track  = '' then track  := JsonGetString(json, 'trackId');
    mensaje:= JsonGetString(json, 'Mensaje');if mensaje= '' then mensaje:= JsonGetString(json, 'mensajes'); // nota: en algunos casos es array serializado; tomaremos literal
    err    := JsonGetString(json, 'Error');  if err    = '' then err    := JsonGetString(json, 'error');

    // Armar resultado desde JSON
    Result.Estado    := ToEstadoEnum(estado);
    if Result.Estado = eeDesconocido then
    begin
      // si no es explícito, mapear por exit code
      case ExitCode of
        0: Result.Estado := eeAceptado;
        2: Result.Estado := eeRechazado;
        1: Result.Estado := eeError;
      else
        Result.Estado := eeDesconocido;
      end;
    end;

    Result.EstadoStr := estado;
    Result.Encf      := encf;
    Result.TrackId   := track;
    Result.Mensaje   := TrimCRLF(mensaje);
    Result.Error     := TrimCRLF(err);
  end
  else
  begin
    // 3) Parseo "labeled" (Estado:, TrackId:, Mensajes:, Secuencia:)
    estado  := ReadAfterLabel(OutText, 'Estado:');
    track   := ReadAfterLabel(OutText, 'TrackId:');
    encf    := ReadAfterLabel(OutText, 'NCF:');
    if encf = '' then encf := ReadAfterLabel(OutText, 'Secuencia:');
    mensaje := ReadAfterLabel(OutText, 'Mensajes:');

    Result.Estado    := ToEstadoEnum(estado);
    if Result.Estado = eeDesconocido then
    begin
      case ExitCode of
        0: Result.Estado := eeAceptado;
        2: Result.Estado := eeRechazado;
        1: Result.Estado := eeError;
      else
        Result.Estado := eeDesconocido;
      end;
    end;

    Result.EstadoStr := estado;
    Result.Encf      := encf;
    Result.TrackId   := track;
    Result.Mensaje   := TrimCRLF(mensaje);
    // Error: si no hay JSON, intentamos encontrar “ERROR|…”
    if Pos('ERROR', UpperCase(OutText)) > 0 then
      Result.Error := 'Execution error';
  end;

  // 4) Detectar QR URL si estuviera impreso en alguna parte (p. ej. 'urlImage=http...')
  qr := '';
  if Pos('urlImage=', OutText) > 0 then
    qr := Copy(OutText, Pos('urlImage=', OutText) + 9, MaxInt);
  if (qr <> '') and (Pos(' ', qr) > 0) then
    SetLength(qr, Pos(' ', qr) - 1);
  Result.QrUrl := qr;

  // 5) Normalizar EstadoStr si estaba vacío
  if (Result.EstadoStr = '') then
  begin
    case Result.Estado of
      eeAceptado : Result.EstadoStr := 'ACEPTADO';
      eeRechazado: Result.EstadoStr := 'RECHAZADO';
      eeError    : Result.EstadoStr := 'ERROR';
    end;
  end;
end;

function BuildUserMessage(const R: TEcfResult): string;
var
  base, extra: string;
begin
  base := '';
  case R.Estado of
    eeAceptado:  base := 'ACEPTADO';
    eeRechazado: base := 'RECHAZADO';
    eeError:     base := 'ERROR';
  else
    base := UpperCase(Trim(R.EstadoStr));
    if base = '' then base := 'RESULTADO';
  end;

  extra := '';

  if R.Encf <> '' then
    extra := extra + ' · NCF=' + R.Encf;

  if R.TrackId <> '' then
    extra := extra + ' · TrackId=' + R.TrackId;

  if (R.Estado = eeAceptado) then
  begin
    if R.QrUrl <> '' then  extra := extra + ' · QR=OK' else extra := extra + ' · QR=PENDING';
    if R.TimbreInfo <> '' then extra := extra + ' · Timbre=' + R.TimbreInfo;
  end;

  if (R.Estado = eeRechazado) or (R.Estado = eeError) then
  begin
    if R.Mensaje <> '' then
      extra := extra + ' · ' + R.Mensaje;
    if (R.Error <> '') and (Pos(R.Error, extra) = 0) then
      extra := extra + ' · ' + R.Error;
  end;

  if extra <> '' then
    Result := base + extra
  else
    Result := base;
end;

{==================== API pública ====================}

function EjecutarECF_y_Resultado(const ExePath, TRN: string; out Res: TEcfResult): Boolean;
var
  OK: Boolean;
  OutText, Args: string;
  Code: Cardinal;
begin
  FillChar(Res, SizeOf(Res), 0);
  Args := TRN; // puedes agregar flags (p.ej. '--check-cert-only') según contextos
  OK := RunProcessCapture(ExePath, Args, Code, OutText);

  if not OK then
  begin
    Res.Estado    := eeError;
    Res.EstadoStr := 'ERROR';
    Res.Mensaje   := 'Could not start IdesiToolECF process.';
    Res.ExitCode  := 1;
    Result := False;
    Exit;
  end;

  Res := ParseEcfOutput(OutText, Code);

  // Mapear exit code a estado si aún está desconocido
  if Res.Estado = eeDesconocido then
  begin
    case Code of
      0: Res.Estado := eeAceptado;
      2: Res.Estado := eeRechazado;
      1: Res.Estado := eeError;
    end;
  end;

  // True solo cuando ACEPTADO
  Result := (Res.Estado = eeAceptado);
end;

function EjecutarECF_y_Mostrar(const ExePath: string; const TRN: string; out msg: string): Boolean;
var
  R: TEcfResult;
begin
  Result := EjecutarECF_y_Resultado(ExePath, TRN, R);
  msg := BuildUserMessage(R);
end;

end.

