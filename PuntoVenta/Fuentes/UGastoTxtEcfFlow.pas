unit UGastoTxtEcfFlow;

interface

uses
  Windows, SysUtils, Classes, IBDatabase, IBQuery,
  UGastoTxtBuilder, UUtilecfGastos;

function BuildGastoTxtPath(
  const AOutputDir: string;
  const ATrn: Integer
): string;

function ProcesarEnvioEcfGastoTxt(
  ADatabase: TIBDatabase;
  ATransaction: TIBTransaction;
  const AExePath: string;
  ATrn: Integer;
  const AOutputDir: string;
  out AResultado: TGastoEcfCliResult;
  out AMensaje: string;
  ADescargarXml:Boolean=True
): Boolean;

implementation

uses
  DB, UUtilecf, UEcfEnvioGastos;

type
  EGastoTxtEcfFlow = class(Exception);

  TGastoEnvioSnapshot = record
    CiaKey: Integer;
    TipoCF: string;
    ENCF: string;
  end;

function EnsureDir(const ADir: string): string;
begin
  Result := Trim(ADir);

  if Result = '' then
    Result := IncludeTrailingPathDelimiter(
      ExtractFilePath(ParamStr(0))) + 'gasto_txt';

  Result := IncludeTrailingPathDelimiter(Result);

  if not DirectoryExists(Result) then
    if not ForceDirectories(Result) then
      raise EGastoTxtEcfFlow.Create(
        'No fue posible crear el directorio: ' + Result);
end;

function BuildGastoTxtPath(
  const AOutputDir: string;
  const ATrn: Integer): string;
var
  BaseDir: string;
  TrnDir: string;
begin
  BaseDir := EnsureDir(AOutputDir);
  TrnDir := IncludeTrailingPathDelimiter(
    BaseDir + 'TRN_' + IntToStr(ATrn));

  if not DirectoryExists(TrnDir) then
    if not ForceDirectories(TrnDir) then
      raise EGastoTxtEcfFlow.Create(
        'No fue posible crear el directorio del gasto: ' + TrnDir);

  Result := TrnDir + 'Gastos.txt';
end;

procedure LimpiarResultado(var AResultado: TGastoEcfCliResult);
begin
  AResultado.Estado := '';
  AResultado.Mensaje := '';
  AResultado.TrackId := '';
  AResultado.ENCF := '';
  AResultado.ExitCode := Cardinal(-1);
  AResultado.TieneTimbre := False;
  AResultado.Timbre.CodigoSeguridad := '';
  AResultado.Timbre.ENCF := '';
  AResultado.Timbre.FechaEmision := 0;
  AResultado.Timbre.TieneFechaEmision := False;
  AResultado.Timbre.FechaFirma := 0;
  AResultado.Timbre.TieneFechaFirma := False;
  AResultado.Timbre.MontoTotal := 0;
  AResultado.Timbre.TieneMontoTotal := False;
  AResultado.Timbre.UrlImage := '';
  AResultado.Timbre.XmlFirmado := '';
  AResultado.SalidaCompleta := '';
end;

function DecodeProtocolField(const S: string): string;
begin
  Result := S;
  Result := StringReplace(Result, '%7C', '|', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '%25', '%', [rfReplaceAll, rfIgnoreCase]);
end;

procedure SplitProtocolLine(const ALine: string; AParts: TStrings);
var
  S: string;
  P: Integer;
begin
  AParts.Clear;
  S := ALine;

  while True do
  begin
    P := Pos('|', S);
    if P = 0 then
    begin
      AParts.Add(S);
      Break;
    end;

    AParts.Add(Copy(S, 1, P - 1));
    Delete(S, 1, P);
  end;
end;

function ValueAfterEquals(const S: string): string;
var
  P: Integer;
begin
  P := Pos('=', S);
  if P > 0 then
    Result := Copy(S, P + 1, MaxInt)
  else
    Result := S;

  Result := DecodeProtocolField(Result);
end;

function TryParseProtocolDate(
  const S: string;
  out AValue: TDateTime): Boolean;
var
  T: string;
  D, M, Y: Word;
  P1, P2: Integer;
begin
  Result := False;
  AValue := 0;
  T := Trim(S);

  if T = '' then
    Exit;

  { dd-MM-yyyy o dd/MM/yyyy }
  if (Length(T) >= 10) and
     (T[3] in ['-', '/']) and
     (T[6] in ['-', '/']) then
  begin
    D := StrToIntDef(Copy(T, 1, 2), 0);
    M := StrToIntDef(Copy(T, 4, 2), 0);
    Y := StrToIntDef(Copy(T, 7, 4), 0);

    if (D > 0) and (M > 0) and (Y > 1900) then
    begin
      try
        AValue := EncodeDate(Y, M, D);

        if Length(T) > 10 then
        begin
          T := Trim(Copy(T, 11, MaxInt));
          if T <> '' then
          begin
            { El componente hora se intenta con la configuracion regional. }
            if TryStrToTime(T, AValue) then
            begin
              { TryStrToTime reemplaza la fecha; se corrige abajo. }
            end;
          end;
        end;

        AValue := EncodeDate(Y, M, D) + Frac(AValue);
        Result := True;
        Exit;
      except
        Result := False;
      end;
    end;
  end;

  T := StringReplace(T, 'T', ' ', [rfReplaceAll]);
  P1 := Pos('Z', T);
  if P1 > 0 then
    Delete(T, P1, 1);
  P2 := Pos('+', T);
  if P2 > 10 then
    T := Trim(Copy(T, 1, P2 - 1));

  Result := TryStrToDateTime(T, AValue);
end;

function TryParseProtocolCurrency(
  const S: string;
  out AValue: Currency): Boolean;
var
  T: string;
  OldSep: Char;
begin
  AValue := 0;
  T := Trim(S);
  if T = '' then
  begin
    Result := False;
    Exit;
  end;

  OldSep := DecimalSeparator;
  try
    DecimalSeparator := '.';
    Result := TryStrToCurr(T, AValue);
  finally
    DecimalSeparator := OldSep;
  end;
end;

function ParsearSalidaGastoTxt(
  const AOutput: string;
  var AResultado: TGastoEcfCliResult): Boolean;
var
  Lines: TStringList;
  Parts: TStringList;
  I: Integer;
  L: string;
  D: TDateTime;
  C: Currency;
begin
  Result := False;
  Lines := TStringList.Create;
  Parts := TStringList.Create;
  try
    Lines.Text := StringReplace(AOutput, #13, '', [rfReplaceAll]);

    for I := 0 to Lines.Count - 1 do
    begin
      L := Trim(Lines[I]);
      if L = '' then
        Continue;

      if Copy(L, 1, 4) = 'D7G|' then
      begin
        SplitProtocolLine(L, Parts);
        if Parts.Count >= 5 then
        begin
          AResultado.Estado := DecodeProtocolField(Parts[1]);
          AResultado.Mensaje := DecodeProtocolField(Parts[2]);
          AResultado.TrackId := DecodeProtocolField(Parts[3]);
          AResultado.ENCF := DecodeProtocolField(Parts[4]);
          Result := True;
        end;
      end
      else if Copy(L, 1, 5) = 'D7GT|' then
      begin
        SplitProtocolLine(L, Parts);
        if Parts.Count >= 8 then
        begin
          AResultado.TieneTimbre := True;
          AResultado.Timbre.CodigoSeguridad :=
            DecodeProtocolField(Parts[1]);
          AResultado.Timbre.ENCF :=
            DecodeProtocolField(Parts[2]);

          if TryParseProtocolDate(
               ValueAfterEquals(Parts[3]), D) then
          begin
            AResultado.Timbre.FechaEmision := D;
            AResultado.Timbre.TieneFechaEmision := True;
          end;

          if TryParseProtocolDate(
               ValueAfterEquals(Parts[4]), D) then
          begin
            AResultado.Timbre.FechaFirma := D;
            AResultado.Timbre.TieneFechaFirma := True;
          end;

          if TryParseProtocolCurrency(
               ValueAfterEquals(Parts[5]), C) then
          begin
            AResultado.Timbre.MontoTotal := C;
            AResultado.Timbre.TieneMontoTotal := True;
          end;

          AResultado.Timbre.UrlImage :=
            ValueAfterEquals(Parts[6]);
          AResultado.Timbre.XmlFirmado :=
            ValueAfterEquals(Parts[7]);
        end;
      end;
    end;
  finally
    Parts.Free;
    Lines.Free;
  end;
end;

function EsMensajeSecuenciaUtilizada(const ATexto: string): Boolean;
var
  S: string;
begin
  S := UpperCase(Trim(ATexto));
  Result :=
    (Pos('SECUENCIA YA HA SIDO UTILIZAD', S) > 0) or
    (Pos('NUMERO DE SECUENCIA YA HA SIDO UTILIZAD', S) > 0) or
    (Pos('NÚMERO DE SECUENCIA YA HA SIDO UTILIZAD', S) > 0);
end;

function EstadoNormalizado(const AEstado: string): string;
var
  S: string;
begin
  S := UpperCase(Trim(AEstado));

  if Pos('ACEPTADO', S) > 0 then
    Result := 'ACEPTADO'
  else if Pos('SECUENCIA_USADA', S) > 0 then
    Result := 'SECUENCIA_USADA'
  else if (Pos('IN_PROCESS', S) > 0) or
          (Pos('EN PROCESO', S) > 0) or
          (Pos('PENDIENTE', S) > 0) then
    Result := 'IN_PROCESS'
  else if Pos('RECH_LOCAL', S) > 0 then
    Result := 'RECH_LOCAL'
  else if Pos('RECHAZADO', S) > 0 then
    Result := 'RECHAZADO'
  else
    Result := 'ERROR';
end;

procedure ConfigurarTransaccion(
  ATransaction: TIBTransaction;
  ADatabase: TIBDatabase);
begin
  ATransaction.DefaultDatabase := ADatabase;
  ATransaction.Params.Clear;
  ATransaction.Params.Add('read_committed');
  ATransaction.Params.Add('rec_version');
  ATransaction.Params.Add('wait');
  ATransaction.Params.Add('write');
end;

procedure ConfigurarQuery(
  AQuery: TIBQuery;
  ADatabase: TIBDatabase;
  ATransaction: TIBTransaction);
begin
  AQuery.Database := ADatabase;
  AQuery.Transaction := ATransaction;
end;

function BuildReservaKey(
  ACiaKey,
  ATrn: Integer;
  const ATipoCF: string): string;
begin
  Result := Format(
    'GASTO|CIA=%d|TRN=%d|TIPO=%s',
    [ACiaKey, ATrn, Trim(ATipoCF)]);
end;

procedure CargarSnapshot(
  ADatabase: TIBDatabase;
  ATrn: Integer;
  out ASnapshot: TGastoEnvioSnapshot);
var
  Tr: TIBTransaction;
  Q: TIBQuery;
begin
  Tr := TIBTransaction.Create(nil);
  Q := TIBQuery.Create(nil);
  try
    ConfigurarTransaccion(Tr, ADatabase);
    Tr.StartTransaction;
    ConfigurarQuery(Q, ADatabase, Tr);

    Q.SQL.Text :=
      'SELECT COALESCE(CIA_KEY, 0) AS CIA_KEY, ' +
      '       COALESCE(TIPO_CF, '''') AS TIPO_CF, ' +
      '       COALESCE(ECF, '''') AS ECF ' +
      'FROM TRANS_OPERACION_MASTER ' +
      'WHERE NUMERO = :TRN';
    Q.ParamByName('TRN').AsInteger := ATrn;
    Q.Open;

    if Q.IsEmpty then
      raise EGastoTxtEcfFlow.CreateFmt(
        'No existe la operacion de gastos numero %d.',
        [ATrn]);

    ASnapshot.CiaKey := Q.FieldByName('CIA_KEY').AsInteger;
    ASnapshot.TipoCF := Trim(Q.FieldByName('TIPO_CF').AsString);
    ASnapshot.ENCF := UpperCase(Trim(Q.FieldByName('ECF').AsString));

    Tr.Commit;
  finally
    if Tr.InTransaction then
      Tr.Rollback;
    Q.Free;
    Tr.Free;
  end;

  if ASnapshot.CiaKey <= 0 then
    raise EGastoTxtEcfFlow.Create(
      'La operacion no tiene CIA_KEY valido.');

  if (ASnapshot.TipoCF <> '41') and
     (ASnapshot.TipoCF <> '43') then
    raise EGastoTxtEcfFlow.Create(
      'La operacion debe tener tipo e-CF 41 o 43.');

  if Length(ASnapshot.ENCF) <> 13 then
    raise EGastoTxtEcfFlow.Create(
      'La operacion no tiene un e-NCF reservado valido.');
end;

procedure PersistirResultado(ADatabase: TIBDatabase; ATrn: Integer;
  const ASnapshot: TGastoEnvioSnapshot; const AResultado: TGastoEcfCliResult);
begin
  PersistirResultadoEcfGasto(ADatabase, ATrn, ASnapshot.CiaKey,
    ASnapshot.TipoCF, ASnapshot.ENCF, AResultado);
end;

function ProcesarEnvioEcfGastoTxt(
  ADatabase: TIBDatabase;
  ATransaction: TIBTransaction;
  const AExePath: string;
  ATrn: Integer;
  const AOutputDir: string;
  out AResultado: TGastoEcfCliResult;
  out AMensaje: string;
  ADescargarXml:Boolean): Boolean;
var
  Snapshot: TGastoEnvioSnapshot;
  Builder: TGastoTxtBuilder;
  BuildRes: TGastoTxtBuildResult;
  OutputFile: string;
  ExeFullPath: string;
  WorkDir: string;
  CmdLine: string;
  OutputText: string;
  ExitCode: DWORD;
  CliStarted: Boolean;
  ProtocolParsed: Boolean;
begin
  Result := False;
  AMensaje := '';
  LimpiarResultado(AResultado);

  try
    if ADatabase = nil then
      raise EGastoTxtEcfFlow.Create(
        'No se recibio una conexion Firebird valida.');

    if ATransaction = nil then
      raise EGastoTxtEcfFlow.Create(
        'No se recibio una transaccion Firebird valida.');

    ExeFullPath := ExpandFileName(Trim(AExePath));
    if not FileExists(ExeFullPath) then
      raise EGastoTxtEcfFlow.Create(
        'No se encontro IdesiToolECF.exe en: ' + ExeFullPath);

    CargarSnapshot(ADatabase, ATrn, Snapshot);

    OutputFile := BuildGastoTxtPath(AOutputDir, ATrn);

    Builder := TGastoTxtBuilder.Create(
      ADatabase,
      ATransaction);
    try
      BuildRes := Builder.GenerateGastosTxt(
        ATrn,
        OutputFile);
    finally
      Builder.Free;
    end;

    if UpperCase(Trim(BuildRes.ENcf)) <> Snapshot.ENCF then
      raise EGastoTxtEcfFlow.Create(
        'Gastos.txt fue generado con un e-NCF distinto al reservado.');

    WorkDir := ExtractFilePath(ExeFullPath);
    CmdLine := Format(
      '"%s" --gasto-txt "%s" --xml-firmado=%d',
      [ExeFullPath, ExpandFileName(BuildRes.OutputFile),Ord(ADescargarXml)]);

    OutputText := '';
    ExitCode := Cardinal(-1);

    CliStarted := ExecAndCapture(
      CmdLine,
      WorkDir,
      OutputText,
      ExitCode);

    AResultado.ExitCode := ExitCode;
    AResultado.SalidaCompleta := OutputText;
    ProtocolParsed := ParsearSalidaGastoTxt(
      OutputText,
      AResultado);

    if not CliStarted then
    begin
      if Trim(AResultado.Estado) = '' then
        AResultado.Estado := 'ERROR';
      if Trim(AResultado.Mensaje) = '' then
        AResultado.Mensaje :=
          'No se pudo ejecutar IdesiToolECF.exe --gasto-txt.';
    end
    else if not ProtocolParsed then
    begin
      AResultado.Estado := 'ERROR';
      AResultado.Mensaje :=
        'IdesiToolECF.exe no devolvio una respuesta D7G valida para Gastos.txt.';
    end;

    if ResultadoRequiereReasignacionSecuencia(AResultado, '') then
    begin
      AResultado.Estado := 'SECUENCIA_USADA';
      if Trim(AResultado.Mensaje) = '' then
        AResultado.Mensaje :=
          'Este numero de secuencia ya ha sido utilizado.';
    end;

    PersistirResultado(
      ADatabase,
      ATrn,
      Snapshot,
      AResultado);

    AMensaje := AResultado.Mensaje;

    { Un rechazo fiscal es un resultado procesado. El caller decide si
      corresponde reasignar secuencia o mostrar el rechazo. }
    Result := ProtocolParsed or
              (UpperCase(Trim(AResultado.Estado)) = 'SECUENCIA_USADA');
  except
    on E: Exception do
    begin
      AMensaje := E.Message;
      if Trim(AResultado.Estado) = '' then
        AResultado.Estado := 'ERROR';
      if Trim(AResultado.Mensaje) = '' then
        AResultado.Mensaje := E.Message;
      Result := False;
    end;
  end;
end;

end.
