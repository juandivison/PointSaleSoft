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
    class function FieldIn(ADataSet: TDataSet; const AFieldName, AValues: string;
      AMessages: TStrings): Boolean;
    class function OptionalFieldIn(ADataSet: TDataSet; const AFieldName,
      AValues: string; AMessages: TStrings): Boolean;
    class function FieldAsFloat(ADataSet: TDataSet;
      const AFieldName: string): Double;
    class function FieldAsText(ADataSet: TDataSet;
      const AFieldName: string): string;
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

class function TTssValidator.FieldAsText(ADataSet: TDataSet;
  const AFieldName: string): string;
begin
  Result := '';
  if (ADataSet <> nil) and (ADataSet.FindField(AFieldName) <> nil) and
     (not ADataSet.FieldByName(AFieldName).IsNull) then
    Result := Trim(ADataSet.FieldByName(AFieldName).AsString);
end;

class function TTssValidator.FieldAsFloat(ADataSet: TDataSet;
  const AFieldName: string): Double;
begin
  Result := 0;
  if (ADataSet <> nil) and (ADataSet.FindField(AFieldName) <> nil) and
     (not ADataSet.FieldByName(AFieldName).IsNull) then
    Result := ADataSet.FieldByName(AFieldName).AsFloat;
end;

class function TTssValidator.Required(ADataSet: TDataSet;
  const AFieldName: string; AMessages: TStrings): Boolean;
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

class function TTssValidator.FieldIn(ADataSet: TDataSet; const AFieldName,
  AValues: string; AMessages: TStrings): Boolean;
var
  V: string;
begin
  Result := True;
  if (ADataSet = nil) or (ADataSet.FindField(AFieldName) = nil) then
    Exit;

  V := UpperCase(Trim(ADataSet.FieldByName(AFieldName).AsString));
  if Pos(';' + V + ';', ';' + UpperCase(AValues) + ';') = 0 then
  begin
    Result := False;
    AddMsg(AMessages, 'Registro ' + IntToStr(ADataSet.RecNo) +
      ': valor invalido en [' + AFieldName + '] = ' + V +
      '. Valores permitidos: ' + AValues);
  end;
end;

class function TTssValidator.OptionalFieldIn(ADataSet: TDataSet;
  const AFieldName, AValues: string; AMessages: TStrings): Boolean;
begin
  Result := True;
  if (ADataSet = nil) or (ADataSet.FindField(AFieldName) = nil) then
    Exit;

  if Trim(ADataSet.FieldByName(AFieldName).AsString) = '' then
    Exit;

  Result := FieldIn(ADataSet, AFieldName, AValues, AMessages);
end;

class function TTssValidator.ValidateDataSet(AKind: TTssExportKind;
  ADataSet: TDataSet; AMessages: TStrings): Boolean;
var
  Ok: Boolean;
  SalarioSS, SalarioISR, Monto: Double;
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
          Ok := Required(ADataSet, 'SALARIO_COTIZABLE', AMessages) and Ok;
          Ok := FieldIn(ADataSet, 'TIPO_DOC', 'C;N;P', AMessages) and Ok;
          Ok := OptionalFieldIn(ADataSet, 'SEXO', 'M;F', AMessages) and Ok;

          SalarioSS := FieldAsFloat(ADataSet, 'SALARIO_COTIZABLE');
          if SalarioSS < 0 then
          begin
            Ok := False;
            AddMsg(AMessages, 'Registro ' + IntToStr(ADataSet.RecNo) +
              ': SALARIO_COTIZABLE no puede ser negativo.');
          end;
        end;

        tekNovedades:
        begin
          Ok := Required(ADataSet, 'CLAVE_NOMINA', AMessages) and Ok;
          Ok := Required(ADataSet, 'TIPO_NOVEDAD', AMessages) and Ok;
          Ok := Required(ADataSet, 'FECHA_INICIO', AMessages) and Ok;
          Ok := Required(ADataSet, 'TIPO_DOC', AMessages) and Ok;
          Ok := Required(ADataSet, 'NUMERO_DOCUMENTO', AMessages) and Ok;
          Ok := Required(ADataSet, 'SALARIO_COTIZABLE_SDSS', AMessages) and Ok;
          Ok := FieldIn(ADataSet, 'TIPO_NOVEDAD',
            'IN;SA;VC;LV;LM;LD;AD', AMessages) and Ok;
          Ok := FieldIn(ADataSet, 'TIPO_DOC', 'C;N;P', AMessages) and Ok;
          Ok := OptionalFieldIn(ADataSet, 'SEXO', 'M;F', AMessages) and Ok;
        end;

        tekBonificacionInfotep:
        begin
          Ok := Required(ADataSet, 'TIPO_DOC', AMessages) and Ok;
          Ok := Required(ADataSet, 'NUMERO_DOCUMENTO', AMessages) and Ok;
          Ok := Required(ADataSet, 'MONTO_BONIFICACION', AMessages) and Ok;
          Ok := FieldIn(ADataSet, 'TIPO_DOC', 'C;N;P', AMessages) and Ok;
          Ok := OptionalFieldIn(ADataSet, 'SEXO', 'M;F', AMessages) and Ok;

          Monto := FieldAsFloat(ADataSet, 'MONTO_BONIFICACION');
          if Monto <= 0 then
          begin
            Ok := False;
            AddMsg(AMessages, 'Registro ' + IntToStr(ADataSet.RecNo) +
              ': MONTO_BONIFICACION debe ser mayor que cero.');
          end;
        end;

        tekDependientesAdicionales:
        begin
          Ok := Required(ADataSet, 'CLAVE_NOMINA', AMessages) and Ok;
          Ok := Required(ADataSet, 'TIPO_DOC_TITULAR', AMessages) and Ok;
          Ok := Required(ADataSet, 'NRO_DOC_TITULAR', AMessages) and Ok;
          Ok := Required(ADataSet, 'TIPO_DOC_DEPENDIENTE', AMessages) and Ok;
          Ok := Required(ADataSet, 'NRO_DOC_DEPENDIENTE', AMessages) and Ok;
          Ok := FieldIn(ADataSet, 'TIPO_DOC_TITULAR', 'C;N', AMessages) and Ok;
          Ok := FieldIn(ADataSet, 'TIPO_DOC_DEPENDIENTE', 'C;N', AMessages) and Ok;
        end;

        tekRectificativaIR3:
        begin
          Ok := Required(ADataSet, 'TIPO_TRABAJADOR', AMessages) and Ok;
          Ok := Required(ADataSet, 'TIPO_DOC', AMessages) and Ok;
          Ok := Required(ADataSet, 'NUMERO_DOCUMENTO', AMessages) and Ok;
          Ok := Required(ADataSet, 'SALARIO_ISR', AMessages) and Ok;
          Ok := FieldIn(ADataSet, 'TIPO_TRABAJADOR', 'N;P', AMessages) and Ok;
          Ok := FieldIn(ADataSet, 'TIPO_DOC', 'C;N;P', AMessages) and Ok;
          Ok := OptionalFieldIn(ADataSet, 'SEXO', 'M;F', AMessages) and Ok;

          SalarioISR := FieldAsFloat(ADataSet, 'SALARIO_ISR');
          if SalarioISR < 0 then
          begin
            Ok := False;
            AddMsg(AMessages, 'Registro ' + IntToStr(ADataSet.RecNo) +
              ': SALARIO_ISR no puede ser negativo.');
          end;
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
