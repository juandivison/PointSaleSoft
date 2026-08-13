unit UUtilecfGastos;

interface

uses
  Windows, SysUtils, Classes, Forms;

type
  TGastoEcfTimbre = record
    CodigoSeguridad: string;
    ENCF: string;
    FechaEmision: TDateTime;
    TieneFechaEmision: Boolean;
    FechaFirma: TDateTime;
    TieneFechaFirma: Boolean;
    MontoTotal: Currency;
    TieneMontoTotal: Boolean;
    UrlImage: string;
    XmlFirmado: string;
  end;

  TGastoEcfCliResult = record
    Estado: string;
    Mensaje: string;
    TrackId: string;
    ENCF: string;
    ExitCode: Cardinal;
    TieneTimbre: Boolean;
    Timbre: TGastoEcfTimbre;
    SalidaCompleta: string;
  end;

function ResolverEjecutableEcfGastos(
  out AExePath: string;
  out AError: string
): Boolean;

function EjecutarECFGasto(
  const AExePath: string;
  ATrn: Integer;
  out AResultado: TGastoEcfCliResult;
  out AError: string;
  ATimeOutMS: Cardinal = 600000
): Boolean;

implementation

uses
  StrUtils, UGlobal;

procedure LimpiarTimbre(var ATimbre: TGastoEcfTimbre);
begin
  ATimbre.CodigoSeguridad := '';
  ATimbre.ENCF := '';
  ATimbre.FechaEmision := 0;
  ATimbre.TieneFechaEmision := False;
  ATimbre.FechaFirma := 0;
  ATimbre.TieneFechaFirma := False;
  ATimbre.MontoTotal := 0;
  ATimbre.TieneMontoTotal := False;
  ATimbre.UrlImage := '';
  ATimbre.XmlFirmado := '';
end;

procedure LimpiarResultado(var AResultado: TGastoEcfCliResult);
begin
  AResultado.Estado := '';
  AResultado.Mensaje := '';
  AResultado.TrackId := '';
  AResultado.ENCF := '';
  AResultado.ExitCode := Cardinal(-1);
  AResultado.TieneTimbre := False;
  LimpiarTimbre(AResultado.Timbre);
  AResultado.SalidaCompleta := '';
end;

function DecodeProtocolValue(const S: string): string;
begin
  { El encoder C# sustituye primero '%' y luego '|'. Para revertirlo hay que
    decodificar en el orden inverso. }
  Result := StringReplace(S, '%7C', '|', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '%25', '%', [rfReplaceAll, rfIgnoreCase]);
end;

function StartsTextLocal(const APrefix, AValue: string): Boolean;
begin
  Result := AnsiCompareText(
    Copy(AValue, 1, Length(APrefix)),
    APrefix
  ) = 0;
end;

procedure SplitByPipe(const S: string; AItems: TStrings);
var
  I: Integer;
  Token: string;
begin
  AItems.Clear;
  Token := '';

  for I := 1 to Length(S) do
  begin
    if S[I] = '|' then
    begin
      AItems.Add(Token);
      Token := '';
    end
    else
      Token := Token + S[I];
  end;

  AItems.Add(Token);
end;

function ParseDateTimeDgii(const S: string; out AValue: TDateTime): Boolean;
var
  Raw: string;
  DatePart: string;
  TimePart: string;
  P: Integer;
  Sep: Char;
  P1, P2: Integer;
  DayValue, MonthValue, YearValue: Integer;
  HourValue, MinuteValue, SecondValue: Integer;

  function ReadInt(const AText: string; ADefault: Integer): Integer;
  begin
    Result := StrToIntDef(Trim(AText), ADefault);
  end;

begin
  Result := False;
  AValue := 0;
  Raw := Trim(S);

  if Raw = '' then
    Exit;

  Raw := StringReplace(Raw, 'T', ' ', [rfReplaceAll]);
  P := Pos(' ', Raw);
  if P > 0 then
  begin
    DatePart := Copy(Raw, 1, P - 1);
    TimePart := Trim(Copy(Raw, P + 1, MaxInt));
  end
  else
  begin
    DatePart := Raw;
    TimePart := '';
  end;

  if Pos('-', DatePart) > 0 then
    Sep := '-'
  else if Pos('/', DatePart) > 0 then
    Sep := '/'
  else
    Exit;

  P1 := Pos(Sep, DatePart);
  P2 := PosEx(Sep, DatePart, P1 + 1);
  if (P1 <= 0) or (P2 <= 0) then
    Exit;

  if Length(Copy(DatePart, 1, P1 - 1)) = 4 then
  begin
    YearValue := ReadInt(Copy(DatePart, 1, P1 - 1), -1);
    MonthValue := ReadInt(Copy(DatePart, P1 + 1, P2 - P1 - 1), -1);
    DayValue := ReadInt(Copy(DatePart, P2 + 1, MaxInt), -1);
  end
  else
  begin
    DayValue := ReadInt(Copy(DatePart, 1, P1 - 1), -1);
    MonthValue := ReadInt(Copy(DatePart, P1 + 1, P2 - P1 - 1), -1);
    YearValue := ReadInt(Copy(DatePart, P2 + 1, MaxInt), -1);
  end;

  HourValue := 0;
  MinuteValue := 0;
  SecondValue := 0;

  if TimePart <> '' then
  begin
    P1 := Pos(':', TimePart);
    if P1 <= 0 then
      Exit;

    P2 := PosEx(':', TimePart, P1 + 1);
    HourValue := ReadInt(Copy(TimePart, 1, P1 - 1), -1);

    if P2 > 0 then
    begin
      MinuteValue := ReadInt(Copy(TimePart, P1 + 1, P2 - P1 - 1), -1);
      SecondValue := ReadInt(Copy(TimePart, P2 + 1, 2), -1);
    end
    else
      MinuteValue := ReadInt(Copy(TimePart, P1 + 1, MaxInt), -1);
  end;

  try
    AValue := EncodeDate(YearValue, MonthValue, DayValue) +
              EncodeTime(HourValue, MinuteValue, SecondValue, 0);
    Result := True;
  except
    Result := False;
  end;
end;

function ParseCurrencyInvariant(const S: string; out AValue: Currency): Boolean;
var
  LocalValue: string;
begin
  Result := False;
  AValue := 0;
  LocalValue := Trim(S);

  if LocalValue = '' then
    Exit;

  if DecimalSeparator <> '.' then
    LocalValue := StringReplace(
      LocalValue,
      '.',
      DecimalSeparator,
      [rfReplaceAll]
    );

  try
    AValue := StrToCurr(LocalValue);
    Result := True;
  except
    Result := False;
  end;
end;

function ReadValueAfterEquals(const S: string): string;
var
  P: Integer;
begin
  P := Pos('=', S);
  if P <= 0 then
    Result := ''
  else
    Result := DecodeProtocolValue(Copy(S, P + 1, MaxInt));
end;

function ParseStatusLine(const ALine: string;
  var AResultado: TGastoEcfCliResult): Boolean;
var
  Items: TStringList;
begin
  Result := False;

  if not StartsTextLocal('D7G|', Trim(ALine)) then
    Exit;

  Items := TStringList.Create;
  try
    SplitByPipe(Trim(ALine), Items);
    if Items.Count < 5 then
      Exit;

    AResultado.Estado := UpperCase(Trim(DecodeProtocolValue(Items[1])));
    AResultado.Mensaje := Trim(DecodeProtocolValue(Items[2]));
    AResultado.TrackId := Trim(DecodeProtocolValue(Items[3]));
    AResultado.ENCF := UpperCase(Trim(DecodeProtocolValue(Items[4])));
    Result := AResultado.Estado <> '';
  finally
    Items.Free;
  end;
end;

function ParseTimbreLine(const ALine: string;
  var AResultado: TGastoEcfCliResult): Boolean;
var
  Items: TStringList;
  I: Integer;
  Item: string;
  FechaValue: TDateTime;
  MontoValue: Currency;
begin
  Result := False;

  if not StartsTextLocal('D7GT|', Trim(ALine)) then
    Exit;

  Items := TStringList.Create;
  try
    SplitByPipe(Trim(ALine), Items);
    if Items.Count < 3 then
      Exit;

    LimpiarTimbre(AResultado.Timbre);
    AResultado.Timbre.CodigoSeguridad :=
      Trim(DecodeProtocolValue(Items[1]));
    AResultado.Timbre.ENCF :=
      UpperCase(Trim(DecodeProtocolValue(Items[2])));

    for I := 3 to Items.Count - 1 do
    begin
      Item := Items[I];

      if StartsTextLocal('fechaEmision=', Item) then
      begin
        if ParseDateTimeDgii(ReadValueAfterEquals(Item), FechaValue) then
        begin
          AResultado.Timbre.FechaEmision := FechaValue;
          AResultado.Timbre.TieneFechaEmision := True;
        end;
      end
      else if StartsTextLocal('fechaFirma=', Item) then
      begin
        if ParseDateTimeDgii(ReadValueAfterEquals(Item), FechaValue) then
        begin
          AResultado.Timbre.FechaFirma := FechaValue;
          AResultado.Timbre.TieneFechaFirma := True;
        end;
      end
      else if StartsTextLocal('montoTotal=', Item) then
      begin
        if ParseCurrencyInvariant(ReadValueAfterEquals(Item), MontoValue) then
        begin
          AResultado.Timbre.MontoTotal := MontoValue;
          AResultado.Timbre.TieneMontoTotal := True;
        end;
      end
      else if StartsTextLocal('urlImage=', Item) then
        AResultado.Timbre.UrlImage := ReadValueAfterEquals(Item)
      else if StartsTextLocal('xmlFirmado=', Item) then
        AResultado.Timbre.XmlFirmado := ReadValueAfterEquals(Item);
    end;

    if AResultado.Timbre.ENCF = '' then
      AResultado.Timbre.ENCF := AResultado.ENCF;

    AResultado.TieneTimbre :=
      (AResultado.Timbre.ENCF <> '') and
      (
        (AResultado.Timbre.CodigoSeguridad <> '') or
        (AResultado.Timbre.UrlImage <> '') or
        AResultado.Timbre.TieneFechaFirma or
        AResultado.Timbre.TieneFechaEmision or
        AResultado.Timbre.TieneMontoTotal or
        (AResultado.Timbre.XmlFirmado <> '')
      );

    Result := True;
  finally
    Items.Free;
  end;
end;

function RunAndCapture(
  const AExePath, AParams: string;
  ATimeOutMS: Cardinal;
  out AExitCode: Cardinal;
  out AOutput: string;
  out AError: string
): Boolean;
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  ReadHandle: THandle;
  WriteHandle: THandle;
  Buffer: array[0..8191] of Byte;
  BytesAvailable: DWORD;
  BytesRead: DWORD;
  WaitResult: DWORD;
  StartTick: DWORD;
  CmdLine: string;
  Stream: TMemoryStream;
  Raw: AnsiString;

  procedure DrainPipe;
  begin
    while PeekNamedPipe(
      ReadHandle,
      nil,
      0,
      nil,
      @BytesAvailable,
      nil
    ) and (BytesAvailable > 0) do
    begin
      if BytesAvailable > SizeOf(Buffer) then
        BytesAvailable := SizeOf(Buffer);

      BytesRead := 0;
      if not ReadFile(
        ReadHandle,
        Buffer,
        BytesAvailable,
        BytesRead,
        nil
      ) then
        Break;

      if BytesRead = 0 then
        Break;

      Stream.WriteBuffer(Buffer[0], BytesRead);
    end;
  end;

begin
  Result := False;
  AExitCode := Cardinal(-1);
  AOutput := '';
  AError := '';
  ReadHandle := 0;
  WriteHandle := 0;
  FillChar(PI, SizeOf(PI), 0);

  if not FileExists(AExePath) then
  begin
    AError := 'No se encontro el ejecutable e-CF: ' + AExePath;
    Exit;
  end;

  FillChar(SA, SizeOf(SA), 0);
  SA.nLength := SizeOf(SA);
  SA.bInheritHandle := True;

  if not CreatePipe(ReadHandle, WriteHandle, @SA, 0) then
  begin
    AError := SysErrorMessage(GetLastError);
    Exit;
  end;

  try
    if not SetHandleInformation(ReadHandle, HANDLE_FLAG_INHERIT, 0) then
    begin
      AError := SysErrorMessage(GetLastError);
      Exit;
    end;

    FillChar(SI, SizeOf(SI), 0);
    SI.cb := SizeOf(SI);
    SI.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
    SI.wShowWindow := SW_HIDE;
    SI.hStdInput := GetStdHandle(STD_INPUT_HANDLE);
    SI.hStdOutput := WriteHandle;
    SI.hStdError := WriteHandle;

    CmdLine := '"' + AExePath + '"';
    if Trim(AParams) <> '' then
      CmdLine := CmdLine + ' ' + AParams;

    if not CreateProcess(
      nil,
      PChar(CmdLine),
      nil,
      nil,
      True,
      NORMAL_PRIORITY_CLASS or CREATE_NO_WINDOW,
      nil,
      PChar(ExtractFilePath(AExePath)),
      SI,
      PI
    ) then
    begin
      AError := SysErrorMessage(GetLastError);
      Exit;
    end;

    CloseHandle(WriteHandle);
    WriteHandle := 0;

    Stream := TMemoryStream.Create;
    try
      StartTick := GetTickCount;
      repeat
        DrainPipe;
        WaitResult := WaitForSingleObject(PI.hProcess, 50);

        if WaitResult = WAIT_OBJECT_0 then
          Break;

        if (ATimeOutMS > 0) and
           (GetTickCount - StartTick >= ATimeOutMS) then
        begin
          TerminateProcess(PI.hProcess, 124);
          WaitForSingleObject(PI.hProcess, 5000);
          DrainPipe;
          AError := 'Tiempo de espera agotado al enviar el e-CF de gastos.';
          Exit;
        end;
      until False;

      DrainPipe;

      if not GetExitCodeProcess(PI.hProcess, AExitCode) then
        AExitCode := Cardinal(-1);

      if Stream.Size > 0 then
      begin
        SetLength(Raw, Stream.Size);
        Stream.Position := 0;
        Stream.ReadBuffer(Pointer(Raw)^, Stream.Size);
        AOutput := string(UTF8Decode(Raw));
      end;

      Result := True;
    finally
      Stream.Free;
    end;
  finally
    if PI.hThread <> 0 then
      CloseHandle(PI.hThread);
    if PI.hProcess <> 0 then
      CloseHandle(PI.hProcess);
    if WriteHandle <> 0 then
      CloseHandle(WriteHandle);
    if ReadHandle <> 0 then
      CloseHandle(ReadHandle);
  end;
end;

function ResolverEjecutableEcfGastos(
  out AExePath: string;
  out AError: string
): Boolean;
var
  BaseDir: string;
  EnvPath: string;
  Candidates: TStringList;
  I: Integer;
begin
  Result := False;
  AExePath := '';
  AError := '';
  BaseDir := IncludeTrailingPathDelimiter(ExtractFilePath(GlbRutaEcf));
  EnvPath := Trim(GetEnvironmentVariable('POINTSALE_ECF_EXE'));

  Candidates := TStringList.Create;
  try
    if EnvPath <> '' then
      Candidates.Add(EnvPath);
    Candidates.Add(BaseDir + 'IdesiToolECF.exe');
    Candidates.Add(BaseDir + 'ECF\IdesiToolECF.exe');
    Candidates.Add(BaseDir + 'Orders2Ecf.Cli.exe');
    Candidates.Add(BaseDir + 'ECF\Orders2Ecf.Cli.exe');

    for I := 0 to Candidates.Count - 1 do
      if FileExists(Candidates[I]) then
      begin
        AExePath := ExpandFileName(Candidates[I]);
        Result := True;
        Exit;
      end;

    AError :=
      'No se encontro la herramienta e-CF. Configure la variable de entorno ' +
      'POINTSALE_ECF_EXE o coloque IdesiToolECF.exe en la carpeta del sistema ' +
      'o en la subcarpeta ECF.';
  finally
    Candidates.Free;
  end;
end;

function EjecutarECFGasto(
  const AExePath: string;
  ATrn: Integer;
  out AResultado: TGastoEcfCliResult;
  out AError: string;
  ATimeOutMS: Cardinal
): Boolean;
var
  Output: string;
  ExitCode: Cardinal;
  Lines: TStringList;
  I: Integer;
  FoundStatus: Boolean;
begin
  Result := False;
  AError := '';
  LimpiarResultado(AResultado);

  if ATrn <= 0 then
  begin
    AError := 'El numero de operacion de gastos no es valido.';
    Exit;
  end;

  if not RunAndCapture(
           AExePath,
           '--gasto ' + IntToStr(ATrn),
           ATimeOutMS,
           ExitCode,
           Output,
           AError
         ) then
  begin
    AResultado.Estado := 'ERROR';
    AResultado.Mensaje := AError;
    AResultado.ExitCode := ExitCode;
    AResultado.SalidaCompleta := Output;
    Exit;
  end;

  AResultado.ExitCode := ExitCode;
  AResultado.SalidaCompleta := Output;
  FoundStatus := False;

  Lines := TStringList.Create;
  try
    Lines.Text := Output;

    { Buscar desde el final para usar la respuesta estructurada definitiva. }
    for I := Lines.Count - 1 downto 0 do
    begin
      if (not AResultado.TieneTimbre) and
         StartsTextLocal('D7GT|', Trim(Lines[I])) then
        ParseTimbreLine(Lines[I], AResultado)
      else if (not FoundStatus) and
              StartsTextLocal('D7G|', Trim(Lines[I])) then
        FoundStatus := ParseStatusLine(Lines[I], AResultado);

      if FoundStatus and AResultado.TieneTimbre then
        Break;
    end;
  finally
    Lines.Free;
  end;

  if not FoundStatus then
  begin
    AResultado.Estado := 'ERROR';
    AResultado.Mensaje :=
      'La herramienta e-CF no devolvio una respuesta D7G valida.';
    AError := AResultado.Mensaje;
    Exit;
  end;

  if (AResultado.ENCF = '') and AResultado.TieneTimbre then
    AResultado.ENCF := AResultado.Timbre.ENCF;

  Result := True;
end;

end.
