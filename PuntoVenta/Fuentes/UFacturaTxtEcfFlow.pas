unit UFacturaTxtEcfFlow;

interface

uses
  Windows, SysUtils, Classes, IBDatabase,
  UFacturaTxtBuilder;

type
  TFacturaTxtEcfResult = record
    Success: Boolean;
    ExitCode: DWORD;
    OutputFile: string;
    ENcf: string;
    TipoEcf: string;
    DetailCount: Integer;
    OutputText: string;
    CommandLine: string;
    WorkingDirectory: string;
  end;

function EjecutarFacturaTxtECF(
  const AExePath: string;
  const ANumeroTransaccion: Integer;
  const AOutputDir: string;
  ADatabase: TIBDatabase;
  ATransaction: TIBTransaction;
  out AResult: TFacturaTxtEcfResult): Boolean;

function BuildFacturaTxtPath(const AOutputDir: string; const ANumeroTransaccion: Integer): string;

implementation

uses
  UUtilecf, UGlobal;

function EnsureDir(const ADir: string): string;
begin
  Result := Trim(ADir);
  if Result = '' then
    Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'ecf_txt';

  Result := IncludeTrailingPathDelimiter(Result);
  if not DirectoryExists(Result) then
    ForceDirectories(Result);
end;

function BuildFacturaTxtPath(const AOutputDir: string; const ANumeroTransaccion: Integer): string;
var
  BaseDir: string;
begin
  BaseDir := EnsureDir(AOutputDir);
  Result := BaseDir + Format('Factura_%d.txt', [ANumeroTransaccion]);
end;

function BuildFacturaTxtArtifactDir(const AExeFullPath, AENcf: string): string;
var
  BaseDir: string;
begin
  BaseDir := IncludeTrailingPathDelimiter(ExtractFilePath(ExpandFileName(AExeFullPath)));
  Result := IncludeTrailingPathDelimiter(BaseDir + 'out\factura_txt\' + Trim(AENcf));
end;

function NormalizarSalida(const S: string): string;
var
  Tmp: string;
begin
  Tmp := Trim(S);
  if Tmp = '' then
    Result := 'Sin respuesta del ejecutable.'
  else
    Result := Tmp;
end;

procedure ValidateFacturaTxtStructure(const AFileName: string);
var
  SL: TStringList;
  I: Integer;
  Linea: string;
begin
  if not FileExists(AFileName) then
    raise Exception.Create('No se encontró el archivo Factura.txt para validar: ' + AFileName);

  SL := TStringList.Create;
  try
    SL.LoadFromFile(AFileName);

    if SL.Count = 0 then
      raise Exception.Create('Factura.txt está vacío.');

    Linea := Trim(SL[0]);
    if Linea = '' then
      raise Exception.Create('La primera línea de Factura.txt está vacía.');

    if Copy(Linea, 1, 3) <> '2||' then
      raise Exception.Create('La primera línea de Factura.txt debe iniciar con "2||".');

    if SL.Count < 2 then
      raise Exception.Create('Factura.txt no contiene líneas de detalle.');

    for I := 0 to SL.Count - 1 do
    begin
      Linea := Trim(SL[I]);

      if Linea = '' then
        raise Exception.CreateFmt('Factura.txt contiene una línea vacáa en la posición %d.', [I + 1]);

      if I = 0 then
      begin
        if Copy(Linea, 1, 3) <> '2||' then
          raise Exception.Create('El encabezado de Factura.txt es inválido.');
      end
      else
      begin
        if Copy(Linea, 1, 3) <> '1||' then
          raise Exception.CreateFmt(
            'La línea %d de Factura.txt debe iniciar con "1||". Valor encontrado: %s',
            [I + 1, Linea]
          );
      end;
    end;
  finally
    SL.Free;
  end;
end;

function EjecutarFacturaTxtECF(
  const AExePath: string;
  const ANumeroTransaccion: Integer;
  const AOutputDir: string;
  ADatabase: TIBDatabase;
  ATransaction: TIBTransaction;
  out AResult: TFacturaTxtEcfResult): Boolean;
var
  Builder: TFacturaTxtBuilder;
  BuildRes: TFacturaTxtBuildResult;
  OutputText: string;
  ExitCode: DWORD;
  OutputFile: string;
  CmdLine: string;
  WorkDir: string;
  ExeFullPath: string;
  ArtifactDir: string;
begin
  FillChar(AResult, SizeOf(AResult), 0);
  Result := False;

  ExeFullPath := ExpandFileName(Trim(AExePath));

  if ExeFullPath = '' then
    raise Exception.Create('La ruta de IdesiToolECF.exe es obligatoria.');

  if not FileExists(ExeFullPath) then
    raise Exception.Create('No se encontró IdesiToolECF.exe en: ' + ExeFullPath);

  if ADatabase = nil then
    raise Exception.Create('ADatabase es obligatorio.');

  if ATransaction = nil then
    raise Exception.Create('ATransaction es obligatorio.');

  OutputFile := BuildFacturaTxtPath(AOutputDir, ANumeroTransaccion);
  WorkDir := ExtractFilePath(ExeFullPath);

  Builder := TFacturaTxtBuilder.Create(ADatabase, ATransaction);
  try
    BuildRes := Builder.GenerateFacturaTxt(ANumeroTransaccion, OutputFile);
  finally
    Builder.Free;
  end;

  if Trim(BuildRes.OutputFile) = '' then
    raise Exception.Create('La generación de Factura.txt no devolvió ruta de salida.');

  if not FileExists(BuildRes.OutputFile) then
    raise Exception.Create('No se encontró el archivo Factura.txt generado: ' + BuildRes.OutputFile);

  if BuildRes.DetailCount <= 0 then
    raise Exception.Create('Factura.txt no contiene líneas de detalle.');

  ValidateFacturaTxtStructure(BuildRes.OutputFile);

  CmdLine := Format('"%s" --factura-txt "%s"', [ExeFullPath, ExpandFileName(BuildRes.OutputFile)]);

  if GlbValidarECF = 0 then
    Exit;

  ArtifactDir := BuildFacturaTxtArtifactDir(ExeFullPath, BuildRes.ENcf);
  PrepareFreshFacturaTxtArtifacts(ArtifactDir);

  if not ExecAndCapture(CmdLine, WorkDir, OutputText, ExitCode) then
    raise Exception.Create('No se pudo ejecutar IdesiToolECF.exe.');

  AResult.OutputFile := BuildRes.OutputFile;
  AResult.ENcf := BuildRes.ENcf;
  AResult.TipoEcf := BuildRes.TipoEcf;
  AResult.DetailCount := BuildRes.DetailCount;
  AResult.ExitCode := ExitCode;
  AResult.OutputText := NormalizarSalida(OutputText);
  AResult.CommandLine := CmdLine;
  AResult.WorkingDirectory := WorkDir;
  AResult.Success := (ExitCode = 0);

  Result := AResult.Success;
end;

end.
