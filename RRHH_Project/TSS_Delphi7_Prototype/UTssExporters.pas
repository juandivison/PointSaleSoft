unit UTssExporters;

interface

uses
  SysUtils, Classes, DB, UTssTypes, UTssFormatUtils;

type
  TTssExportResult = class
  public
    Success: Boolean;
    RecordCount: Integer;
    FileName: string;
    MessageText: string;
  end;

  TTssBaseExporter = class
  private
    FDelimiter: string;
  protected
    function BuildLine(ADataSet: TDataSet): string; virtual; abstract;
  public
    constructor Create;
    function ExportDataSet(ADataSet: TDataSet; const AFileName: string): TTssExportResult;
    property Delimiter: string read FDelimiter write FDelimiter;
  end;

  TTssAutodeterminacionExporter = class(TTssBaseExporter)
  protected
    function BuildLine(ADataSet: TDataSet): string; override;
  end;

  TTssNovedadesExporter = class(TTssBaseExporter)
  protected
    function BuildLine(ADataSet: TDataSet): string; override;
  end;

  TTssBonificacionInfotepExporter = class(TTssBaseExporter)
  protected
    function BuildLine(ADataSet: TDataSet): string; override;
  end;

  TTssDependientesAdicionalesExporter = class(TTssBaseExporter)
  protected
    function BuildLine(ADataSet: TDataSet): string; override;
  end;

  TTssRectificativaIR3Exporter = class(TTssBaseExporter)
  protected
    function BuildLine(ADataSet: TDataSet): string; override;
  end;

function CreateTssExporter(AKind: TTssExportKind): TTssBaseExporter;

implementation

constructor TTssBaseExporter.Create;
begin
  inherited Create;
  FDelimiter := TSS_DEFAULT_DELIMITER;
end;

function TTssBaseExporter.ExportDataSet(ADataSet: TDataSet;
  const AFileName: string): TTssExportResult;
var
  SL: TStringList;
begin
  Result := TTssExportResult.Create;
  Result.Success := False;
  Result.RecordCount := 0;
  Result.FileName := AFileName;

  if ADataSet = nil then
  begin
    Result.MessageText := 'Dataset no asignado.';
    Exit;
  end;

  if not ADataSet.Active then
  begin
    Result.MessageText := 'Dataset no activo.';
    Exit;
  end;

  SL := TStringList.Create;
  try
    ADataSet.DisableControls;
    try
      ADataSet.First;
      while not ADataSet.Eof do
      begin
        SL.Add(BuildLine(ADataSet));
        Inc(Result.RecordCount);
        ADataSet.Next;
      end;
    finally
      ADataSet.EnableControls;
    end;

    SL.SaveToFile(AFileName);
    Result.Success := True;
    Result.MessageText := 'Archivo generado correctamente.';
  finally
    SL.Free;
  end;
end;

function TTssAutodeterminacionExporter.BuildLine(ADataSet: TDataSet): string;
begin
  Result := TssJoinFields([
    TssFieldStr(ADataSet, 'CLAVE_NOMINA'),
    TssFieldStr(ADataSet, 'TIPO_DOC'),
    TssOnlyDigits(TssFieldStr(ADataSet, 'NUMERO_DOCUMENTO')),
    TssFieldStr(ADataSet, 'NOMBRES'),
    TssFieldStr(ADataSet, 'PRIMER_APELLIDO'),
    TssFieldStr(ADataSet, 'SEGUNDO_APELLIDO'),
    TssFieldStr(ADataSet, 'SEXO'),
    TssFieldDateDDMMYYYY(ADataSet, 'FECHA_NACIMIENTO'),
    TssFieldMoney(ADataSet, 'SALARIO_COTIZABLE'),
    TssFieldMoney(ADataSet, 'APORTE_VOLUNTARIO'),
    TssFieldMoney(ADataSet, 'SALARIO_ISR'),
    TssFieldStr(ADataSet, 'TIPO_INGRESO'),
    TssFieldMoney(ADataSet, 'OTRAS_REMUNERACIONES'),
    TssOnlyDigits(TssFieldStr(ADataSet, 'RNC_CED_AGENTE_RET')),
    TssFieldMoney(ADataSet, 'REMUNERACION_OTROS_AGENTES'),
    TssFieldMoney(ADataSet, 'SALDO_FAVOR_PERIODO'),
    TssFieldMoney(ADataSet, 'REGALIA_PASCUAL'),
    TssFieldMoney(ADataSet, 'PREAVISO_CESANTIA_VIATICO'),
    TssFieldMoney(ADataSet, 'RETENCION_PENSION_ALIMENTICIA'),
    TssFieldMoney(ADataSet, 'SALARIO_INFOTEP')
  ], Delimiter);
end;

function TTssNovedadesExporter.BuildLine(ADataSet: TDataSet): string;
begin
  Result := TssJoinFields([
    TssFieldStr(ADataSet, 'CLAVE_NOMINA'),
    TssFieldStr(ADataSet, 'TIPO_NOVEDAD'),
    TssFieldDateDDMMYYYY(ADataSet, 'FECHA_INICIO'),
    TssFieldDateDDMMYYYY(ADataSet, 'FECHA_FIN'),
    TssFieldStr(ADataSet, 'TIPO_DOC'),
    TssOnlyDigits(TssFieldStr(ADataSet, 'NUMERO_DOCUMENTO')),
    TssFieldStr(ADataSet, 'NOMBRES'),
    TssFieldStr(ADataSet, 'PRIMER_APELLIDO'),
    TssFieldStr(ADataSet, 'SEGUNDO_APELLIDO'),
    TssFieldStr(ADataSet, 'SEXO'),
    TssFieldDateDDMMYYYY(ADataSet, 'FECHA_NACIMIENTO'),
    TssFieldMoney(ADataSet, 'SALARIO_COTIZABLE_SDSS'),
    TssFieldMoney(ADataSet, 'APORTE_VOLUNTARIO_SDSS'),
    TssFieldStr(ADataSet, 'TIPO_INGRESO'),
    TssFieldMoney(ADataSet, 'SALARIO_ISR'),
    TssFieldMoney(ADataSet, 'OTRAS_REMUNERACIONES'),
    TssOnlyDigits(TssFieldStr(ADataSet, 'RNC_CED_AGENTE_RET')),
    TssFieldMoney(ADataSet, 'REMUNERACION_OTROS_AGENTES'),
    TssFieldMoney(ADataSet, 'SALDO_FAVOR_PERIODO'),
    TssFieldMoney(ADataSet, 'REGALIA_PASCUAL'),
    TssFieldMoney(ADataSet, 'PREAVISO_CESANTIA_VIATICO'),
    TssFieldMoney(ADataSet, 'RETENCION_PENSION_ALIMENTICIA'),
    TssFieldMoney(ADataSet, 'SALARIO_INFOTEP')
  ], Delimiter);
end;

function TTssBonificacionInfotepExporter.BuildLine(ADataSet: TDataSet): string;
begin
  Result := TssJoinFields([
    TssFieldStr(ADataSet, 'TIPO_DOC'),
    TssOnlyDigits(TssFieldStr(ADataSet, 'NUMERO_DOCUMENTO')),
    TssFieldStr(ADataSet, 'NOMBRES'),
    TssFieldStr(ADataSet, 'PRIMER_APELLIDO'),
    TssFieldStr(ADataSet, 'SEGUNDO_APELLIDO'),
    TssFieldStr(ADataSet, 'SEXO'),
    TssFieldDateDDMMYYYY(ADataSet, 'FECHA_NACIMIENTO'),
    TssFieldMoney(ADataSet, 'MONTO_BONIFICACION')
  ], Delimiter);
end;

function TTssDependientesAdicionalesExporter.BuildLine(ADataSet: TDataSet): string;
begin
  Result := TssJoinFields([
    TssFieldStr(ADataSet, 'CLAVE_NOMINA'),
    TssFieldStr(ADataSet, 'TIPO_DOC_TITULAR'),
    TssOnlyDigits(TssFieldStr(ADataSet, 'NRO_DOC_TITULAR')),
    TssFieldStr(ADataSet, 'TIPO_NOVEDAD'),
    TssFieldStr(ADataSet, 'TIPO_DOC_DEPENDIENTE'),
    TssOnlyDigits(TssFieldStr(ADataSet, 'NRO_DOC_DEPENDIENTE')),
    TssFieldStr(ADataSet, 'NOMBRES_DEPENDIENTE'),
    TssFieldStr(ADataSet, 'PRIMER_APELLIDO_DEPENDIENTE'),
    TssFieldStr(ADataSet, 'SEGUNDO_APELLIDO_DEPENDIENTE')
  ], Delimiter);
end;

function TTssRectificativaIR3Exporter.BuildLine(ADataSet: TDataSet): string;
begin
  Result := TssJoinFields([
    TssFieldStr(ADataSet, 'TIPO_TRABAJADOR'),
    TssFieldStr(ADataSet, 'TIPO_DOC'),
    TssOnlyDigits(TssFieldStr(ADataSet, 'NUMERO_DOCUMENTO')),
    TssFieldStr(ADataSet, 'NOMBRES'),
    TssFieldStr(ADataSet, 'PRIMER_APELLIDO'),
    TssFieldStr(ADataSet, 'SEGUNDO_APELLIDO'),
    TssFieldStr(ADataSet, 'SEXO'),
    TssFieldDateDDMMYYYY(ADataSet, 'FECHA_NACIMIENTO'),
    TssFieldMoney(ADataSet, 'SALARIO_COTIZABLE'),
    TssFieldMoney(ADataSet, 'APORTE_VOLUNTARIO'),
    TssFieldMoney(ADataSet, 'SALARIO_ISR'),
    TssFieldMoney(ADataSet, 'OTRAS_REMUNERACIONES'),
    TssOnlyDigits(TssFieldStr(ADataSet, 'RNC_CED_AGENTE_RET')),
    TssFieldMoney(ADataSet, 'REMUNERACION_OTROS_AGENTES'),
    TssFieldMoney(ADataSet, 'SALDO_FAVOR_PERIODO'),
    TssFieldMoney(ADataSet, 'REGALIA_PASCUAL'),
    TssFieldMoney(ADataSet, 'PREAVISO_CESANTIA_VIATICO'),
    TssFieldMoney(ADataSet, 'RETENCION_PENSION_ALIMENTICIA')
  ], Delimiter);
end;

function CreateTssExporter(AKind: TTssExportKind): TTssBaseExporter;
begin
  case AKind of
    tekAutodeterminacion:
      Result := TTssAutodeterminacionExporter.Create;
    tekNovedades:
      Result := TTssNovedadesExporter.Create;
    tekBonificacionInfotep:
      Result := TTssBonificacionInfotepExporter.Create;
    tekDependientesAdicionales:
      Result := TTssDependientesAdicionalesExporter.Create;
    tekRectificativaIR3:
      Result := TTssRectificativaIR3Exporter.Create;
  else
    Result := nil;
  end;
end;

end.
