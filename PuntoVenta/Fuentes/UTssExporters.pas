unit UTssExporters;

interface

uses
  SysUtils, Classes, DB, Variants, UTssTypes;

type
  TTssExportResult = class(TObject)
  public
    Success: Boolean;
    FileName: string;
    MessageText: string;
    RecordCount: Integer;
  end;

  TTssBaseExporter = class(TObject)
  private
    FKind: TTssExportKind;
  protected
    function CleanText(const S: string): string;
    function OnlyDigits(const S: string): string;
    function CleanDocument(const S: string): string;
    function FieldText(ADataSet: TDataSet;
      const AFieldName: string): string;
    function FieldFloat(ADataSet: TDataSet;
      const AFieldName: string): Double;
    function FieldDate(ADataSet: TDataSet;
      const AFieldName: string): Variant;

    function PadRightText(const S: string; ALength: Integer): string;
    function PadLeftText(const S: string; ALength: Integer;
      AChar: Char): string;
    function FormatAmount16(const AValue: Double): string;
    function FormatDateTss(const AValue: Variant): string;
    function FormatDateInfotep(const AValue: Variant): string;
    function FormatTipoIngreso(const S: string): string;
    function FormatRnc11(const S: string): string;
    function FormatExento(const ACodigo: string; AValue: Double): string;
    function BuildExentos(ARegalia, APreaviso, APension: Double): string;
    function NormalizePeriodoMMAAAA(const S: string): string;
    function FormatOptionalDifferentAmount(ABase, AValue: Double): string;

    function GetRncFromDataSet(ADataSet: TDataSet): string;
    function GetPeriodoFromDataSet(ADataSet: TDataSet): string;
    function ProcessCode: string; virtual;
    function ExpectedHeaderLength: Integer; virtual;
    function ExpectedDetailLength: Integer; virtual; abstract;
    function BuildHeaderLine(ADataSet: TDataSet): string; virtual;
    function BuildSummaryLine(ADetailCount: Integer): string; virtual;
    function BuildDetailLine(ADataSet: TDataSet): string; virtual; abstract;
    function BuildOfficialFileName(ADataSet: TDataSet;
      const ARequestedFileName: string): string; virtual;

    procedure CheckLen(const ALine, AKind: string; AExpected: Integer);
    procedure CheckLenIn(const ALine, AKind: string;
      A1, A2, A3, A4: Integer);
    procedure CheckNoPipe(const ALine, AKind: string);
    procedure CheckDetailLine(const ALine: string); virtual;
  public
    constructor Create(AKind: TTssExportKind); virtual;
    function ExportDataSet(ADataSet: TDataSet;
      const AFileName: string): TTssExportResult; virtual;
    property Kind: TTssExportKind read FKind;
  end;

function CreateTssExporter(AKind: TTssExportKind): TTssBaseExporter;

implementation

type
  TTssAutodeterminacionExporter = class(TTssBaseExporter)
  protected
    function ExpectedDetailLength: Integer; override;
    function BuildDetailLine(ADataSet: TDataSet): string; override;
    procedure CheckDetailLine(const ALine: string); override;
  end;

  TTssNovedadesExporter = class(TTssBaseExporter)
  protected
    function ExpectedDetailLength: Integer; override;
    function BuildDetailLine(ADataSet: TDataSet): string; override;
    procedure CheckDetailLine(const ALine: string); override;
  end;

  TTssBonificacionExporter = class(TTssBaseExporter)
  protected
    function ExpectedDetailLength: Integer; override;
    function BuildDetailLine(ADataSet: TDataSet): string; override;
  end;

  TTssDependientesExporter = class(TTssBaseExporter)
  protected
    function ExpectedHeaderLength: Integer; override;
    function ExpectedDetailLength: Integer; override;
    function BuildHeaderLine(ADataSet: TDataSet): string; override;
    function BuildDetailLine(ADataSet: TDataSet): string; override;
    function BuildOfficialFileName(ADataSet: TDataSet;
      const ARequestedFileName: string): string; override;
  end;

  TTssRectificativaIR3Exporter = class(TTssBaseExporter)
  protected
    function ExpectedDetailLength: Integer; override;
    function BuildDetailLine(ADataSet: TDataSet): string; override;
    procedure CheckDetailLine(const ALine: string); override;
  end;

constructor TTssBaseExporter.Create(AKind: TTssExportKind);
begin
  inherited Create;
  FKind := AKind;
end;

function TTssBaseExporter.CleanText(const S: string): string;
begin
  Result := Trim(S);
  Result := StringReplace(Result, '|', ' ', [rfReplaceAll]);
  Result := StringReplace(Result, #13, ' ', [rfReplaceAll]);
  Result := StringReplace(Result, #10, ' ', [rfReplaceAll]);
  Result := StringReplace(Result, #9, ' ', [rfReplaceAll]);

  while Pos('  ', Result) > 0 do
    Result := StringReplace(Result, '  ', ' ', [rfReplaceAll]);

  Result := AnsiUpperCase(Result);

  { Normalizacion defensiva para archivos planos TSS/SUIR. }
  Result := StringReplace(Result, 'Á', 'A', [rfReplaceAll]);
  Result := StringReplace(Result, 'É', 'E', [rfReplaceAll]);
  Result := StringReplace(Result, 'Í', 'I', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ó', 'O', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ú', 'U', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ü', 'U', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ñ', 'N', [rfReplaceAll]);
  Result := StringReplace(Result, 'Ç', 'C', [rfReplaceAll]);
end;

function TTssBaseExporter.OnlyDigits(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;

function TTssBaseExporter.CleanDocument(const S: string): string;
var
  I: Integer;
  C: Char;
  V: string;
begin
  V := CleanText(S);
  Result := '';
  for I := 1 to Length(V) do
  begin
    C := V[I];
    if C in ['0'..'9', 'A'..'Z'] then
      Result := Result + C;
  end;
end;

function TTssBaseExporter.FieldText(ADataSet: TDataSet;
  const AFieldName: string): string;
begin
  Result := '';
  if (ADataSet <> nil) and
     (ADataSet.FindField(AFieldName) <> nil) and
     (not ADataSet.FieldByName(AFieldName).IsNull) then
    Result := CleanText(ADataSet.FieldByName(AFieldName).AsString);
end;

function TTssBaseExporter.FieldFloat(ADataSet: TDataSet;
  const AFieldName: string): Double;
begin
  Result := 0;
  if (ADataSet <> nil) and
     (ADataSet.FindField(AFieldName) <> nil) and
     (not ADataSet.FieldByName(AFieldName).IsNull) then
    Result := ADataSet.FieldByName(AFieldName).AsFloat;
end;

function TTssBaseExporter.FieldDate(ADataSet: TDataSet;
  const AFieldName: string): Variant;
begin
  Result := Null;
  if (ADataSet <> nil) and
     (ADataSet.FindField(AFieldName) <> nil) and
     (not ADataSet.FieldByName(AFieldName).IsNull) then
    Result := ADataSet.FieldByName(AFieldName).AsDateTime;
end;

function TTssBaseExporter.PadRightText(const S: string;
  ALength: Integer): string;
begin
  Result := Copy(S, 1, ALength);
  while Length(Result) < ALength do
    Result := Result + ' ';
end;

function TTssBaseExporter.PadLeftText(const S: string; ALength: Integer;
  AChar: Char): string;
begin
  Result := Copy(S, 1, ALength);
  while Length(Result) < ALength do
    Result := AChar + Result;
end;

function TTssBaseExporter.FormatAmount16(const AValue: Double): string;
var
  V: Double;
begin
  V := AValue;
  if (V > -0.005) and (V < 0.005) then
    V := 0;

  if V < 0 then
    raise Exception.Create('Monto negativo no permitido en TXT TSS.');

  Result := FloatToStrF(V, ffFixed, 18, 2);
  if DecimalSeparator <> '.' then
    Result := StringReplace(Result, DecimalSeparator, '.', [rfReplaceAll]);

  if Length(Result) > 16 then
    raise Exception.Create('Monto excede longitud TSS de 16 posiciones: ' +
      Result);

  Result := PadLeftText(Result, 16, '0');
end;

function TTssBaseExporter.FormatDateTss(const AValue: Variant): string;
begin
  Result := '        ';
  if not VarIsNull(AValue) then
    Result := FormatDateTime('ddmmyyyy', VarToDateTime(AValue));
end;

function TTssBaseExporter.FormatDateInfotep(const AValue: Variant): string;
begin
  { INFOTEP tambien usa DDMMAAAA. Se separa para evitar ambiguedad. }
  Result := FormatDateTss(AValue);
end;

function TTssBaseExporter.FormatTipoIngreso(const S: string): string;
var
  V: string;
begin
  V := OnlyDigits(S);
  if V = '' then
    V := '1';
  Result := PadLeftText(V, 4, '0');
  Result := Copy(Result, Length(Result) - 3, 4);
end;

function TTssBaseExporter.FormatRnc11(const S: string): string;
var
  V: string;
begin
  V := OnlyDigits(S);
  if Length(V) > 11 then
    raise Exception.Create('RNC/Cedula del empleador excede 11 digitos.');
  Result := PadLeftText(V, 11, ' ');
end;

function TTssBaseExporter.FormatExento(const ACodigo: string;
  AValue: Double): string;
var
  Codigo: string;
begin
  { Regla validada: si el monto es cero no se escribe el bloque 01/02/03. }
  if (AValue > -0.005) and (AValue < 0.005) then
  begin
    Result := '';
    Exit;
  end;

  if AValue < 0 then
    raise Exception.Create('Ingreso exento negativo no permitido.');

  Codigo := OnlyDigits(ACodigo);
  Codigo := PadLeftText(Codigo, 2, '0');

  Result := Codigo + FormatAmount16(AValue);

  if Length(Result) <> 18 then
    raise Exception.Create('Ingreso exento invalido: ' + Result);
end;

function TTssBaseExporter.BuildExentos(ARegalia, APreaviso,
  APension: Double): string;
begin
  { Se agregan al final solo los ingresos exentos con monto mayor que cero. }
  Result :=
    FormatExento('01', ARegalia) +
    FormatExento('02', APreaviso) +
    FormatExento('03', APension);
end;

function TTssBaseExporter.NormalizePeriodoMMAAAA(const S: string): string;
var
  V: string;
  M1, M2, Y1: Integer;
begin
  V := OnlyDigits(S);
  Result := V;

  if Length(V) <> 6 then
    Exit;

  M1 := StrToIntDef(Copy(V, 1, 2), 0);
  Y1 := StrToIntDef(Copy(V, 3, 4), 0);
  M2 := StrToIntDef(Copy(V, 5, 2), 0);

  if (M1 >= 1) and (M1 <= 12) and (Y1 >= 1900) then
    Result := V
  else if (M2 >= 1) and (M2 <= 12) then
    Result := Copy(V, 5, 2) + Copy(V, 1, 4);
end;

function TTssBaseExporter.FormatOptionalDifferentAmount(ABase,
  AValue: Double): string;
begin
  if AValue = 0 then
    Result := FormatAmount16(0)
  else if (AValue >= ABase - 0.005) and (AValue <= ABase + 0.005) then
    Result := FormatAmount16(0)
  else
    Result := FormatAmount16(AValue);
end;

function TTssBaseExporter.GetRncFromDataSet(ADataSet: TDataSet): string;
begin
  Result := OnlyDigits(FieldText(ADataSet, 'RNC_EMPLEADOR'));
  if Result = '' then
    Result := OnlyDigits(FieldText(ADataSet, 'RNC_NUMERO'));
  if Result = '' then
    Result := OnlyDigits(FieldText(ADataSet, 'RNC_CIA'));
end;

function TTssBaseExporter.GetPeriodoFromDataSet(ADataSet: TDataSet): string;
begin
  Result := NormalizePeriodoMMAAAA(FieldText(ADataSet, 'PERIODO_TSS'));
  if Result = '' then
    Result := NormalizePeriodoMMAAAA(FieldText(ADataSet, 'PERIODO'));
end;

function TTssBaseExporter.ProcessCode: string;
begin
  case FKind of
    tekAutodeterminacion: Result := 'AM';
    tekNovedades: Result := 'NV';
    tekBonificacionInfotep: Result := 'BO';
    tekDependientesAdicionales: Result := 'RD';
    tekRectificativaIR3: Result := 'RT';
  else
    Result := '??';
  end;
end;

function TTssBaseExporter.ExpectedHeaderLength: Integer;
begin
  Result := 20;
end;

function TTssBaseExporter.BuildHeaderLine(ADataSet: TDataSet): string;
var
  Rnc, Periodo: string;
begin
  Rnc := GetRncFromDataSet(ADataSet);
  Periodo := GetPeriodoFromDataSet(ADataSet);

  if Rnc = '' then
    raise Exception.Create('No se encontro RNC_EMPLEADOR en los datos.');

  if Length(Periodo) <> 6 then
    raise Exception.Create('Periodo TSS invalido. Debe ser MMAAAA.');

  Result := 'E' + ProcessCode + FormatRnc11(Rnc) + Periodo;
  CheckNoPipe(Result, 'encabezado');
  CheckLen(Result, 'encabezado', ExpectedHeaderLength);
end;

function TTssBaseExporter.BuildSummaryLine(ADetailCount: Integer): string;
begin
  Result := 'S' + PadLeftText(IntToStr(ADetailCount + 2), 6, '0');
  CheckNoPipe(Result, 'sumario');
  CheckLen(Result, 'sumario', 7);
end;

function TTssBaseExporter.BuildOfficialFileName(ADataSet: TDataSet;
  const ARequestedFileName: string): string;
var
  Path, Rnc, Periodo: string;
begin
  Path := ExtractFilePath(ARequestedFileName);
  Rnc := OnlyDigits(GetRncFromDataSet(ADataSet));
  Periodo := GetPeriodoFromDataSet(ADataSet);

  if Rnc = '' then
    raise Exception.Create('No se encontro RNC para construir el nombre del TXT.');

  if Length(Periodo) <> 6 then
    raise Exception.Create('Periodo TSS invalido para nombre de archivo.');

  case FKind of
    tekBonificacionInfotep,
    tekDependientesAdicionales:
      Result := Path + Rnc + '_' + Periodo + '_' + ProcessCode + '.txt';
  else
    Result := Path + ProcessCode + '_' + Rnc + '_' + Periodo + '.txt';
  end;
end;

procedure TTssBaseExporter.CheckLen(const ALine, AKind: string;
  AExpected: Integer);
begin
  if Length(ALine) <> AExpected then
    raise Exception.Create('Longitud invalida en ' + AKind + '. Esperada ' +
      IntToStr(AExpected) + ', obtenida ' + IntToStr(Length(ALine)) + '.');
end;

procedure TTssBaseExporter.CheckLenIn(const ALine, AKind: string;
  A1, A2, A3, A4: Integer);
var
  L: Integer;
begin
  L := Length(ALine);
  if (L <> A1) and (L <> A2) and (L <> A3) and (L <> A4) then
    raise Exception.Create('Longitud invalida en ' + AKind + '. Obtenida ' +
      IntToStr(L) + '. Longitudes permitidas: ' + IntToStr(A1) + ', ' +
      IntToStr(A2) + ', ' + IntToStr(A3) + ', ' + IntToStr(A4) + '.');
end;

procedure TTssBaseExporter.CheckNoPipe(const ALine, AKind: string);
begin
  if Pos('|', ALine) > 0 then
    raise Exception.Create('Formato invalido en ' + AKind +
      ': el layout oficial TSS no usa tuberias.');
end;

procedure TTssBaseExporter.CheckDetailLine(const ALine: string);
begin
  CheckLen(ALine, 'detalle', ExpectedDetailLength);
end;

function TTssBaseExporter.ExportDataSet(ADataSet: TDataSet;
  const AFileName: string): TTssExportResult;
var
  Lines: TStringList;
  Count: Integer;
  DetailLine: string;
  Bookmark: TBookmark;
  RealFileName: string;
begin
  Result := TTssExportResult.Create;
  Result.Success := False;
  Result.FileName := AFileName;
  Result.RecordCount := 0;

  if ADataSet = nil then
    raise Exception.Create('Dataset no asignado.');

  if not ADataSet.Active then
    raise Exception.Create('Dataset no esta abierto.');

  if ADataSet.IsEmpty then
    raise Exception.Create('No hay registros para exportar.');

  Lines := TStringList.Create;
  Bookmark := nil;
  try
    ADataSet.DisableControls;
    Bookmark := ADataSet.GetBookmark;
    try
      ADataSet.First;
      RealFileName := BuildOfficialFileName(ADataSet, AFileName);
      Result.FileName := RealFileName;

      Lines.Add(BuildHeaderLine(ADataSet));

      Count := 0;
      while not ADataSet.Eof do
      begin
        DetailLine := BuildDetailLine(ADataSet);
        if DetailLine <> '' then
        begin
          CheckNoPipe(DetailLine, 'detalle');
          CheckDetailLine(DetailLine);
          Lines.Add(DetailLine);
          Inc(Count);
        end;
        ADataSet.Next;
      end;

      Lines.Add(BuildSummaryLine(Count));
      Lines.SaveToFile(RealFileName);

      Result.Success := True;
      Result.RecordCount := Count;
      Result.MessageText :=
        'TXT TSS generado segun layout oficial validado AM/NV - sin pipes.';
    finally
      if Bookmark <> nil then
      begin
        ADataSet.GotoBookmark(Bookmark);
        ADataSet.FreeBookmark(Bookmark);
      end;
      ADataSet.EnableControls;
    end;
  finally
    Lines.Free;
  end;
end;

function TTssAutodeterminacionExporter.ExpectedDetailLength: Integer;
begin
  { Base minima sin ingresos exentos detallados. }
  Result := 312;
end;

procedure TTssAutodeterminacionExporter.CheckDetailLine(const ALine: string);
begin
  CheckLenIn(ALine, 'detalle AM', 312, 330, 348, 366);
end;

function TTssAutodeterminacionExporter.BuildDetailLine(
  ADataSet: TDataSet): string;
var
  SalarioSS, SalarioISR, SalarioInfotep: Double;
  Regalia, Preaviso, Pension: Double;
begin
  SalarioSS := FieldFloat(ADataSet, 'SALARIO_COTIZABLE');
  SalarioISR := FieldFloat(ADataSet, 'SALARIO_ISR');
  SalarioInfotep := FieldFloat(ADataSet, 'SALARIO_INFOTEP');

  Regalia := FieldFloat(ADataSet, 'REGALIA_PASCUAL');
  Preaviso := FieldFloat(ADataSet, 'PREAVISO_CESANTIA_VIATICO');
  Pension := FieldFloat(ADataSet, 'RETENCION_PENSION_ALIMENTICIA');

  Result :=
    'D' +
    PadLeftText(OnlyDigits(FieldText(ADataSet, 'CLAVE_NOMINA')), 3, '0') +
    PadRightText(FieldText(ADataSet, 'TIPO_DOC'), 1) +
    PadRightText(CleanDocument(FieldText(ADataSet, 'NUMERO_DOCUMENTO')), 25) +
    PadRightText(FieldText(ADataSet, 'NOMBRES'), 50) +
    PadRightText(FieldText(ADataSet, 'PRIMER_APELLIDO'), 40) +
    PadRightText(FieldText(ADataSet, 'SEGUNDO_APELLIDO'), 40) +
    PadRightText(FieldText(ADataSet, 'SEXO'), 1) +
    FormatDateTss(FieldDate(ADataSet, 'FECHA_NACIMIENTO')) +
    FormatAmount16(SalarioSS) +
    FormatAmount16(FieldFloat(ADataSet, 'APORTE_VOLUNTARIO')) +
    FormatOptionalDifferentAmount(SalarioSS, SalarioISR) +
    FormatAmount16(FieldFloat(ADataSet, 'OTRAS_REMUNERACIONES')) +
    FormatRnc11(FieldText(ADataSet, 'RNC_CED_AGENTE_RET')) +
    FormatAmount16(FieldFloat(ADataSet, 'REMUNERACION_OTROS_AGENTES')) +
    FormatAmount16(0) +
    FormatAmount16(FieldFloat(ADataSet, 'SALDO_FAVOR_PERIODO')) +
    FormatOptionalDifferentAmount(SalarioSS, SalarioInfotep) +
    FormatTipoIngreso(FieldText(ADataSet, 'TIPO_INGRESO')) +
    BuildExentos(Regalia, Preaviso, Pension);
end;

function TTssNovedadesExporter.ExpectedDetailLength: Integer;
begin
  { Base minima sin ingresos exentos detallados. }
  Result := 330;
end;

procedure TTssNovedadesExporter.CheckDetailLine(const ALine: string);
begin
  CheckLenIn(ALine, 'detalle NV', 330, 348, 366, 384);
end;

function TTssNovedadesExporter.BuildDetailLine(
  ADataSet: TDataSet): string;
var
  SalarioSS, SalarioISR, SalarioInfotep: Double;
  Regalia, Preaviso, Pension: Double;
begin
  SalarioSS := FieldFloat(ADataSet, 'SALARIO_COTIZABLE_SDSS');
  SalarioISR := FieldFloat(ADataSet, 'SALARIO_ISR');
  SalarioInfotep := FieldFloat(ADataSet, 'SALARIO_INFOTEP');

  Regalia := FieldFloat(ADataSet, 'REGALIA_PASCUAL');
  Preaviso := FieldFloat(ADataSet, 'PREAVISO_CESANTIA_VIATICO');
  Pension := FieldFloat(ADataSet, 'RETENCION_PENSION_ALIMENTICIA');

  Result :=
    'D' +
    PadLeftText(OnlyDigits(FieldText(ADataSet, 'CLAVE_NOMINA')), 3, '0') +
    PadRightText(FieldText(ADataSet, 'TIPO_NOVEDAD'), 2) +
    FormatDateTss(FieldDate(ADataSet, 'FECHA_INICIO')) +
    FormatDateTss(FieldDate(ADataSet, 'FECHA_FIN')) +
    PadRightText(FieldText(ADataSet, 'TIPO_DOC'), 1) +
    PadRightText(CleanDocument(FieldText(ADataSet, 'NUMERO_DOCUMENTO')), 25) +
    PadRightText(FieldText(ADataSet, 'NOMBRES'), 50) +
    PadRightText(FieldText(ADataSet, 'PRIMER_APELLIDO'), 40) +
    PadRightText(FieldText(ADataSet, 'SEGUNDO_APELLIDO'), 40) +
    PadRightText(FieldText(ADataSet, 'SEXO'), 1) +
    FormatDateTss(FieldDate(ADataSet, 'FECHA_NACIMIENTO')) +
    FormatAmount16(SalarioSS) +
    FormatAmount16(FieldFloat(ADataSet, 'APORTE_VOLUNTARIO_SDSS')) +
    FormatOptionalDifferentAmount(SalarioSS, SalarioISR) +
    FormatAmount16(FieldFloat(ADataSet, 'OTRAS_REMUNERACIONES')) +
    FormatRnc11(FieldText(ADataSet, 'RNC_CED_AGENTE_RET')) +
    FormatAmount16(FieldFloat(ADataSet, 'REMUNERACION_OTROS_AGENTES')) +
    FormatAmount16(0) +
    FormatAmount16(FieldFloat(ADataSet, 'SALDO_FAVOR_PERIODO')) +
    FormatOptionalDifferentAmount(SalarioSS, SalarioInfotep) +
    FormatTipoIngreso(FieldText(ADataSet, 'TIPO_INGRESO')) +
    BuildExentos(Regalia, Preaviso, Pension);
end;

function TTssBonificacionExporter.ExpectedDetailLength: Integer;
begin
  Result := 182;
end;

function TTssBonificacionExporter.BuildDetailLine(
  ADataSet: TDataSet): string;
begin
  Result :=
    'D' +
    PadRightText(FieldText(ADataSet, 'TIPO_DOC'), 1) +
    PadRightText(CleanDocument(FieldText(ADataSet, 'NUMERO_DOCUMENTO')), 25) +
    PadRightText(FieldText(ADataSet, 'NOMBRES'), 50) +
    PadRightText(FieldText(ADataSet, 'PRIMER_APELLIDO'), 40) +
    PadRightText(FieldText(ADataSet, 'SEGUNDO_APELLIDO'), 40) +
    PadRightText(FieldText(ADataSet, 'SEXO'), 1) +
    FormatDateInfotep(FieldDate(ADataSet, 'FECHA_NACIMIENTO')) +
    FormatAmount16(FieldFloat(ADataSet, 'MONTO_BONIFICACION'));
end;

function TTssDependientesExporter.ExpectedHeaderLength: Integer;
begin
  Result := 14;
end;

function TTssDependientesExporter.ExpectedDetailLength: Integer;
begin
  Result := 158;
end;

function TTssDependientesExporter.BuildHeaderLine(ADataSet: TDataSet): string;
var
  Rnc: string;
begin
  Rnc := GetRncFromDataSet(ADataSet);
  if Rnc = '' then
    raise Exception.Create('No se encontro RNC_EMPLEADOR en los datos.');

  Result := 'E' + ProcessCode + FormatRnc11(Rnc);
  CheckNoPipe(Result, 'encabezado');
  CheckLen(Result, 'encabezado', ExpectedHeaderLength);
end;

function TTssDependientesExporter.BuildOfficialFileName(ADataSet: TDataSet;
  const ARequestedFileName: string): string;
var
  Path, Rnc, Periodo: string;
begin
  Path := ExtractFilePath(ARequestedFileName);
  Rnc := OnlyDigits(GetRncFromDataSet(ADataSet));
  Periodo := GetPeriodoFromDataSet(ADataSet);

  if Rnc = '' then
    raise Exception.Create('No se encontro RNC para construir el nombre del TXT.');

  if Length(Periodo) <> 6 then
    raise Exception.Create('Periodo TSS invalido para nombre de archivo.');

  Result := Path + Rnc + '_' + Periodo + '_RD.txt';
end;

function TTssDependientesExporter.BuildDetailLine(
  ADataSet: TDataSet): string;
begin
  Result :=
    'D' +
    PadLeftText(OnlyDigits(FieldText(ADataSet, 'CLAVE_NOMINA')), 3, '0') +
    PadRightText(FieldText(ADataSet, 'TIPO_DOC_TITULAR'), 1) +
    PadRightText(CleanDocument(FieldText(ADataSet, 'NRO_DOC_TITULAR')), 11) +
    PadRightText(FieldText(ADataSet, 'NOMBRES_DEPENDIENTE'), 50) +
    PadRightText(FieldText(ADataSet, 'PRIMER_APELLIDO_DEPENDIENTE'), 40) +
    PadRightText(FieldText(ADataSet, 'SEGUNDO_APELLIDO_DEPENDIENTE'), 40) +
    PadRightText(FieldText(ADataSet, 'TIPO_DOC_DEPENDIENTE'), 1) +
    PadRightText(CleanDocument(FieldText(ADataSet, 'NRO_DOC_DEPENDIENTE')), 11);
end;

function TTssRectificativaIR3Exporter.ExpectedDetailLength: Integer;
begin
  { Base minima sin ingresos exentos detallados. }
  Result := 258;
end;

procedure TTssRectificativaIR3Exporter.CheckDetailLine(const ALine: string);
begin
  CheckLenIn(ALine, 'detalle RT', 258, 276, 294, 312);
end;

function TTssRectificativaIR3Exporter.BuildDetailLine(
  ADataSet: TDataSet): string;
var
  SalarioISR, Regalia, Preaviso, Pension: Double;
  TipoTrabajador: string;
begin
  SalarioISR := FieldFloat(ADataSet, 'SALARIO_ISR');

  Regalia := FieldFloat(ADataSet, 'REGALIA_PASCUAL');
  Preaviso := FieldFloat(ADataSet, 'PREAVISO_CESANTIA_VIATICO');
  Pension := FieldFloat(ADataSet, 'RETENCION_PENSION_ALIMENTICIA');

  TipoTrabajador := FieldText(ADataSet, 'TIPO_TRABAJADOR');
  if TipoTrabajador = '' then
    TipoTrabajador := 'N';

  Result :=
    'D' +
    PadRightText(TipoTrabajador, 1) +
    PadRightText(FieldText(ADataSet, 'TIPO_DOC'), 1) +
    PadRightText(CleanDocument(FieldText(ADataSet, 'NUMERO_DOCUMENTO')), 25) +
    PadRightText(FieldText(ADataSet, 'NOMBRES'), 50) +
    PadRightText(FieldText(ADataSet, 'PRIMER_APELLIDO'), 40) +
    PadRightText(FieldText(ADataSet, 'SEGUNDO_APELLIDO'), 40) +
    PadRightText(FieldText(ADataSet, 'SEXO'), 1) +
    FormatDateTss(FieldDate(ADataSet, 'FECHA_NACIMIENTO')) +
    FormatAmount16(SalarioISR) +
    FormatAmount16(FieldFloat(ADataSet, 'OTRAS_REMUNERACIONES')) +
    FormatRnc11(FieldText(ADataSet, 'RNC_CED_AGENTE_RET')) +
    FormatAmount16(FieldFloat(ADataSet, 'REMUNERACION_OTROS_AGENTES')) +
    FormatAmount16(0) +
    FormatAmount16(FieldFloat(ADataSet, 'SALDO_FAVOR_PERIODO')) +
    BuildExentos(Regalia, Preaviso, Pension);
end;

function CreateTssExporter(AKind: TTssExportKind): TTssBaseExporter;
begin
  case AKind of
    tekAutodeterminacion:
      Result := TTssAutodeterminacionExporter.Create(AKind);
    tekNovedades:
      Result := TTssNovedadesExporter.Create(AKind);
    tekBonificacionInfotep:
      Result := TTssBonificacionExporter.Create(AKind);
    tekDependientesAdicionales:
      Result := TTssDependientesExporter.Create(AKind);
    tekRectificativaIR3:
      Result := TTssRectificativaIR3Exporter.Create(AKind);
  else
    Result := nil;
  end;
end;

end.
