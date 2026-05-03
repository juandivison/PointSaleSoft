unit UTssValidator;

interface

uses
  SysUtils, Classes, DB, UTssTypes, UTssFormatUtils;

type
  TTssValidator = class
  private
    class procedure AddMsg(AMessages: TStrings; const AMsg: string);
    class function Required(ADataSet: TDataSet; const AFieldName: string;
      AMessages: TStrings): Boolean;
  public
    class function ValidateDataSet(AKind: TTssExportKind; ADataSet: TDataSet;
      AMessages: TStrings): Boolean;
  end;

implementation

class procedure TTssValidator.AddMsg(AMessages: TStrings; const AMsg: string);
begin
  if AMessages <> nil then
    AMessages.Add(AMsg);
end;

class function TTssValidator.Required(ADataSet: TDataSet; const AFieldName: string;
  AMessages: TStrings): Boolean;
begin
  Result := False;

  if ADataSet = nil then
  begin
    AddMsg(AMessages, 'Dataset no asignado.');
    Exit;
  end;

  if ADataSet.FindField(AFieldName) = nil then
  begin
    AddMsg(AMessages, 'Campo no existe: ' + AFieldName);
    Exit;
  end;

  if Trim(ADataSet.FieldByName(AFieldName).AsString) = '' then
  begin
    AddMsg(AMessages, 'Registro ' + IntToStr(ADataSet.RecNo) +
      ': campo obligatorio vacio [' + AFieldName + '].');
    Exit;
  end;

  Result := True;
end;

class function TTssValidator.ValidateDataSet(AKind: TTssExportKind;
  ADataSet: TDataSet; AMessages: TStrings): Boolean;
var
  Ok: Boolean;
begin
  Result := False;

  if ADataSet = nil then
  begin
    AddMsg(AMessages, 'No hay dataset para validar.');
    Exit;
  end;

  if not ADataSet.Active then
  begin
    AddMsg(AMessages, 'El dataset no esta activo.');
    Exit;
  end;

  if ADataSet.IsEmpty then
  begin
    AddMsg(AMessages, 'No hay registros para exportar.');
    Exit;
  end;

  Ok := True;
  ADataSet.DisableControls;
  try
    ADataSet.First;
    while not ADataSet.Eof do
    begin
      case AKind of
        tekAutodeterminacion:
        begin
          Ok := Required(ADataSet, 'CLAVE_NOMINA', AMessages) and Ok;
          Ok := Required(ADataSet, 'TIPO_DOC', AMessages) and Ok;
          Ok := Required(ADataSet, 'NUMERO_DOCUMENTO', AMessages) and Ok;
          Ok := Required(ADataSet, 'NOMBRES', AMessages) and Ok;
          Ok := Required(ADataSet, 'PRIMER_APELLIDO', AMessages) and Ok;
          Ok := Required(ADataSet, 'SEXO', AMessages) and Ok;
          Ok := Required(ADataSet, 'FECHA_NACIMIENTO', AMessages) and Ok;
          Ok := Required(ADataSet, 'SALARIO_COTIZABLE', AMessages) and Ok;
        end;

        tekNovedades:
        begin
          Ok := Required(ADataSet, 'CLAVE_NOMINA', AMessages) and Ok;
          Ok := Required(ADataSet, 'TIPO_NOVEDAD', AMessages) and Ok;
          Ok := Required(ADataSet, 'FECHA_INICIO', AMessages) and Ok;
          Ok := Required(ADataSet, 'TIPO_DOC', AMessages) and Ok;
          Ok := Required(ADataSet, 'NUMERO_DOCUMENTO', AMessages) and Ok;
          Ok := Required(ADataSet, 'NOMBRES', AMessages) and Ok;
          Ok := Required(ADataSet, 'PRIMER_APELLIDO', AMessages) and Ok;
        end;

        tekBonificacionInfotep:
        begin
          Ok := Required(ADataSet, 'TIPO_DOC', AMessages) and Ok;
          Ok := Required(ADataSet, 'NUMERO_DOCUMENTO', AMessages) and Ok;
          Ok := Required(ADataSet, 'NOMBRES', AMessages) and Ok;
          Ok := Required(ADataSet, 'PRIMER_APELLIDO', AMessages) and Ok;
          Ok := Required(ADataSet, 'MONTO_BONIFICACION', AMessages) and Ok;
        end;

        tekDependientesAdicionales:
        begin
          Ok := Required(ADataSet, 'CLAVE_NOMINA', AMessages) and Ok;
          Ok := Required(ADataSet, 'TIPO_DOC_TITULAR', AMessages) and Ok;
          Ok := Required(ADataSet, 'NRO_DOC_TITULAR', AMessages) and Ok;
          Ok := Required(ADataSet, 'TIPO_NOVEDAD', AMessages) and Ok;
          Ok := Required(ADataSet, 'TIPO_DOC_DEPENDIENTE', AMessages) and Ok;
          Ok := Required(ADataSet, 'NRO_DOC_DEPENDIENTE', AMessages) and Ok;
          Ok := Required(ADataSet, 'NOMBRES_DEPENDIENTE', AMessages) and Ok;
        end;

        tekRectificativaIR3:
        begin
          Ok := Required(ADataSet, 'TIPO_TRABAJADOR', AMessages) and Ok;
          Ok := Required(ADataSet, 'TIPO_DOC', AMessages) and Ok;
          Ok := Required(ADataSet, 'NUMERO_DOCUMENTO', AMessages) and Ok;
          Ok := Required(ADataSet, 'NOMBRES', AMessages) and Ok;
          Ok := Required(ADataSet, 'PRIMER_APELLIDO', AMessages) and Ok;
          Ok := Required(ADataSet, 'SALARIO_ISR', AMessages) and Ok;
        end;
      end;

      ADataSet.Next;
    end;
  finally
    ADataSet.EnableControls;
  end;

  Result := Ok;
end;

end.
