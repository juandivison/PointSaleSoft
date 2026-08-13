unit UEcfGastoTimbre;

interface

uses
  SysUtils, Classes, IBQuery, UDatModConectar;

function GetUrlImageTimbreGasto(
  trn: Integer;
  var codseg: string;
  var femision: string): string;

implementation

uses
  UGlobal;

function GetUrlImageTimbreGasto(
  trn: Integer;
  var codseg: string;
  var femision: string): string;
var
  q: TIBQuery;
begin
  Result := '';
  codseg := '';
  femision := '';

  q := TIBQuery.Create(nil);
  try
    q.Database := dmConectar.IBDatabase1;
    q.Transaction := dmConectar.IBTransaction1;

    {
      GASTOS mantiene su timbre en ECF_GASTO_ENVIO.
      No usar la tabla de timbre del flujo de INGRESOS.

      FIRST 1 + ORDER BY ID DESC evita tomar una secuencia anterior
      rechazada/reasignada cuando el mismo TRN tuvo varios intentos.
    }
    q.SQL.Text :=
      'SELECT FIRST 1 ' +
      '  CODIGO_SEGURIDAD, ' +
      '  COALESCE(FECHA_FIRMA, FECHA_EMISION, FECHA_CREACION) AS FECHA_TIMBRE, ' +
      '  URL_IMAGE ' +
      'FROM ECF_GASTO_ENVIO ' +
      'WHERE TRN = :TRN ' +
      '  AND ESTADO STARTING WITH ''ACEPTADO'' ' +
      'ORDER BY ID DESC';

    q.ParamByName('TRN').AsInteger := trn;
    q.Open;

    if q.IsEmpty then
    begin
      LogInformacionTxt(
        'GetUrlImageTimbreGasto: no hay timbre ACEPTADO para TRN ' +
        IntToStr(trn));
      Exit;
    end;

    if not q.FieldByName('CODIGO_SEGURIDAD').IsNull then
      codseg := q.FieldByName('CODIGO_SEGURIDAD').AsString;

    if not q.FieldByName('FECHA_TIMBRE').IsNull then
      femision := q.FieldByName('FECHA_TIMBRE').AsString;

    if not q.FieldByName('URL_IMAGE').IsNull then
      Result := Trim(q.FieldByName('URL_IMAGE').AsString);

  except
    on E: Exception do
    begin
      LogInformacionTxt(
        'Error GetUrlImageTimbreGasto -> ' + E.Message);
      codseg := '';
      femision := '';
      Result := '';
    end;
  end;

  q.Free;
end;

end.
