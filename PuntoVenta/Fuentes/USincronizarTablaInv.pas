unit USincronizarTablaInv;

interface

uses
  SysUtils, DB, Variants, Classes, IBQuery, IBCustomDataSet;

function SincronizarInventarioProducto(
  AOrigen: TDataSet;
  ADestino: TDataSet
): Boolean;

function SincronizarInventarioProductoPorCodigo(
  AOrigen: TDataSet;
  ADestino: TDataSet;
  ACodigoOrigen: Integer
): Boolean;

implementation

function FieldExists(ADataSet: TDataSet; const AFieldName: string): Boolean;
begin
  Result := (ADataSet <> nil) and (ADataSet.FindField(AFieldName) <> nil);
end;

procedure EnsureOpen(ADataSet: TDataSet; const ADataSetName: string);
begin
  if ADataSet = nil then
    raise Exception.Create(ADataSetName + ' no asignado.');

  if not ADataSet.Active then
  begin
    try
      ADataSet.Open;
    except
      on E: Exception do
        raise Exception.Create('No se pudo abrir ' + ADataSetName +
          '. Detalle: ' + E.Message);
    end;
  end;
end;

procedure RequiredField(ADataSet: TDataSet; const AFieldName, ADataSetName: string);
begin
  if not FieldExists(ADataSet, AFieldName) then
    raise Exception.Create(ADataSetName + ' no tiene el campo requerido ' + AFieldName + '.');
end;

function SameTextD7(const S1, S2: string): Boolean;
begin
  Result := AnsiCompareText(Trim(S1), Trim(S2)) = 0;
end;

function GetFieldStr(ADataSet: TDataSet; const AFieldName: string): string;
begin
  Result := '';

  if FieldExists(ADataSet, AFieldName) then
    Result := Trim(ADataSet.FieldByName(AFieldName).AsString);
end;

function GetFieldInt(ADataSet: TDataSet; const AFieldName: string; ADefault: Integer): Integer;
begin
  Result := ADefault;

  if FieldExists(ADataSet, AFieldName) then
  begin
    if not ADataSet.FieldByName(AFieldName).IsNull then
      Result := ADataSet.FieldByName(AFieldName).AsInteger;
  end;
end;

function CodigoBarraEsReal(const ACodigoBarra: string): Boolean;
begin
  // Regla acordada: solo aplica regla de codigo de barra si la longitud es mayor de 7.
  Result := Length(Trim(ACodigoBarra)) > 7;
end;

function FieldNameInArray(const AFieldName: string; const ACampos: array of string): Boolean;
var
  I: Integer;
begin
  Result := False;

  for I := Low(ACampos) to High(ACampos) do
  begin
    if SameTextD7(AFieldName, ACampos[I]) then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function DatasetAsIBDataSet(ADataSet: TDataSet; const ADataSetName: string): TIBDataSet;
begin
  if ADataSet = nil then
    raise Exception.Create(ADataSetName + ' no asignado.');

  if not (ADataSet is TIBDataSet) then
    raise Exception.Create(ADataSetName + ' debe ser TIBDataSet para sincronizacion espejo.');

  Result := TIBDataSet(ADataSet);
end;

procedure EnsureTransaction(AIBDataSet: TIBDataSet; const ADataSetName: string);
begin
  if AIBDataSet.Database = nil then
    raise Exception.Create(ADataSetName + ' no tiene Database asignado.');

  if AIBDataSet.Transaction = nil then
    raise Exception.Create(ADataSetName + ' no tiene Transaction asignado.');

  if not AIBDataSet.Database.Connected then
    AIBDataSet.Database.Connected := True;

  if not AIBDataSet.Transaction.InTransaction then
    AIBDataSet.Transaction.StartTransaction;
end;

procedure SetQueryParamFromField(AQuery: TIBQuery; AOrigen: TDataSet; const AParamName, AFieldName: string);
begin
  if not FieldExists(AOrigen, AFieldName) then
    Exit;

  if AOrigen.FieldByName(AFieldName).IsNull then
    AQuery.ParamByName(AParamName).Clear
  else
    AQuery.ParamByName(AParamName).Value := AOrigen.FieldByName(AFieldName).Value;
end;

procedure AddMirrorField(AList: TStrings; AOrigen, ADestino: TDataSet; const AFieldName: string);
begin
  if FieldExists(AOrigen, AFieldName) and FieldExists(ADestino, AFieldName) then
    AList.Add(AFieldName);
end;

procedure BuildMirrorFields(AList: TStrings; AOrigen, ADestino: TDataSet; AIncludeCodigo: Boolean);
var
  I: Integer;
  FieldName: string;
begin
  AList.Clear;

  for I := 0 to AOrigen.FieldCount - 1 do
  begin
    FieldName := AOrigen.Fields[I].FieldName;

    if (not AIncludeCodigo) and SameTextD7(FieldName, 'CODIGO') then
      Continue;

    if not FieldExists(ADestino, FieldName) then
      Continue;

    // Campos calculados o readonly no deben ser forzados por SQL si el dataset los marca asi.
    // Excepcion: CODIGO/CODIGO_TEXTO/CODIGO_BARRA se copian en modo espejo si existen.
    if ADestino.FieldByName(FieldName).ReadOnly and
       (not FieldNameInArray(FieldName, ['CODIGO', 'CODIGO_TEXTO', 'CODIGO_BARRA'])) then
      Continue;

    if AList.IndexOf(FieldName) < 0 then
      AList.Add(FieldName);
  end;

  // Garantizar que los campos de identidad espejo entren si existen.
  if AIncludeCodigo and (AList.IndexOf('CODIGO') < 0) then
    AddMirrorField(AList, AOrigen, ADestino, 'CODIGO');

  if AList.IndexOf('CODIGO_TEXTO') < 0 then
    AddMirrorField(AList, AOrigen, ADestino, 'CODIGO_TEXTO');

  if AList.IndexOf('CODIGO_BARRA') < 0 then
    AddMirrorField(AList, AOrigen, ADestino, 'CODIGO_BARRA');
end;

procedure NormalizarValoresEspejo(AQuery: TIBQuery; AOrigen: TDataSet; const AFieldName: string; ACodigoOrigen: Integer);
var
  CodigoTextoOrigen: string;
  CodigoBarraOrigen: string;
begin
  if SameTextD7(AFieldName, 'CODIGO') then
  begin
    AQuery.ParamByName(AFieldName).AsInteger := ACodigoOrigen;
    Exit;
  end;

  if SameTextD7(AFieldName, 'CODIGO_TEXTO') then
  begin
    CodigoTextoOrigen := GetFieldStr(AOrigen, 'CODIGO_TEXTO');
    if CodigoTextoOrigen = '' then
      CodigoTextoOrigen := IntToStr(ACodigoOrigen);
    AQuery.ParamByName(AFieldName).AsString := CodigoTextoOrigen;
    Exit;
  end;

  if SameTextD7(AFieldName, 'CODIGO_BARRA') then
  begin
    CodigoBarraOrigen := GetFieldStr(AOrigen, 'CODIGO_BARRA');
    if CodigoBarraOrigen = '' then
      CodigoBarraOrigen := IntToStr(ACodigoOrigen);
    AQuery.ParamByName(AFieldName).AsString := CodigoBarraOrigen;
    Exit;
  end;

  SetQueryParamFromField(AQuery, AOrigen, AFieldName, AFieldName);
end;

function ProductoExistePorCodigoDestino(ADestino: TDataSet; ACodigo: Integer): Boolean;
var
  IBDestino: TIBDataSet;
  Q: TIBQuery;
begin
  Result := False;

  IBDestino := DatasetAsIBDataSet(ADestino, 'INVENTARIO_PRODUCTO destino');
  EnsureTransaction(IBDestino, 'INVENTARIO_PRODUCTO destino');

  Q := TIBQuery.Create(nil);
  try
    Q.Database := IBDestino.Database;
    Q.Transaction := IBDestino.Transaction;
    Q.SQL.Text :=
      'select first 1 CODIGO ' +
      'from INVENTARIO_PRODUCTO ' +
      'where CODIGO = :CODIGO';
    Q.ParamByName('CODIGO').AsInteger := ACodigo;
    Q.Open;
    Result := not Q.IsEmpty;
  finally
    Q.Free;
  end;
end;

function ExisteOtroProductoConCodigoBarraReal(ADestino: TDataSet; ACodigo: Integer; const ACodigoBarra: string): Boolean;
var
  IBDestino: TIBDataSet;
  Q: TIBQuery;
begin
  Result := False;

  if not CodigoBarraEsReal(ACodigoBarra) then
    Exit;

  IBDestino := DatasetAsIBDataSet(ADestino, 'INVENTARIO_PRODUCTO destino');
  EnsureTransaction(IBDestino, 'INVENTARIO_PRODUCTO destino');

  Q := TIBQuery.Create(nil);
  try
    Q.Database := IBDestino.Database;
    Q.Transaction := IBDestino.Transaction;
    Q.SQL.Text :=
      'select first 1 CODIGO ' +
      'from INVENTARIO_PRODUCTO ' +
      'where CODIGO_BARRA = :CODIGO_BARRA ' +
      '  and CODIGO <> :CODIGO';
    Q.ParamByName('CODIGO_BARRA').AsString := Trim(ACodigoBarra);
    Q.ParamByName('CODIGO').AsInteger := ACodigo;
    Q.Open;
    Result := not Q.IsEmpty;
  finally
    Q.Free;
  end;
end;

function ExisteOtroProductoConDescripcion(ADestino: TDataSet; ACodigo: Integer; const ADescripcion: string): Boolean;
var
  IBDestino: TIBDataSet;
  Q: TIBQuery;
begin
  Result := False;

  if Trim(ADescripcion) = '' then
    Exit;

  IBDestino := DatasetAsIBDataSet(ADestino, 'INVENTARIO_PRODUCTO destino');
  EnsureTransaction(IBDestino, 'INVENTARIO_PRODUCTO destino');

  Q := TIBQuery.Create(nil);
  try
    Q.Database := IBDestino.Database;
    Q.Transaction := IBDestino.Transaction;
    Q.SQL.Text :=
      'select first 1 CODIGO ' +
      'from INVENTARIO_PRODUCTO ' +
      'where upper(trim(DESCRIPCION)) = upper(trim(:DESCRIPCION)) ' +
      '  and CODIGO <> :CODIGO';
    Q.ParamByName('DESCRIPCION').AsString := Trim(ADescripcion);
    Q.ParamByName('CODIGO').AsInteger := ACodigo;
    Q.Open;
    Result := not Q.IsEmpty;
  finally
    Q.Free;
  end;
end;

procedure ValidarConflictosEspejo(AOrigen, ADestino: TDataSet; ACodigoOrigen: Integer);
var
  CodigoBarraOrigen: string;
  DescripcionOrigen: string;
begin
  CodigoBarraOrigen := GetFieldStr(AOrigen, 'CODIGO_BARRA');
  DescripcionOrigen := GetFieldStr(AOrigen, 'DESCRIPCION');

  if ExisteOtroProductoConCodigoBarraReal(ADestino, ACodigoOrigen, CodigoBarraOrigen) then
    raise Exception.Create(
      'Conflicto de codigo de barra en INVENTARIO_PRODUCTO destino. CODIGO_BARRA=' +
      CodigoBarraOrigen + ' ya existe en otro producto. No se sincronizo CODIGO=' +
      IntToStr(ACodigoOrigen) + '.'
    );

  if ExisteOtroProductoConDescripcion(ADestino, ACodigoOrigen, DescripcionOrigen) then
    raise Exception.Create(
      'Conflicto de descripcion en INVENTARIO_PRODUCTO destino. DESCRIPCION="' +
      DescripcionOrigen + '" ya existe en otro producto. No se sincronizo CODIGO=' +
      IntToStr(ACodigoOrigen) + '.'
    );
end;

procedure EjecutarUpdateInventarioDestino(AOrigen, ADestino: TDataSet; ACodigoOrigen: Integer);
var
  IBDestino: TIBDataSet;
  Q: TIBQuery;
  Campos: TStringList;
  I: Integer;
  SQLSet: string;
begin
  IBDestino := DatasetAsIBDataSet(ADestino, 'INVENTARIO_PRODUCTO destino');
  EnsureTransaction(IBDestino, 'INVENTARIO_PRODUCTO destino');

  Campos := TStringList.Create;
  Q := TIBQuery.Create(nil);
  try
    BuildMirrorFields(Campos, AOrigen, ADestino, False);

    if Campos.Count = 0 then
      raise Exception.Create('No hay campos disponibles para actualizar INVENTARIO_PRODUCTO destino.');

    SQLSet := '';
    for I := 0 to Campos.Count - 1 do
    begin
      if SameTextD7(Campos[I], 'CODIGO') then
        Continue;

      if SQLSet <> '' then
        SQLSet := SQLSet + ', ';
      SQLSet := SQLSet + Campos[I] + ' = :' + Campos[I];
    end;

    if SQLSet = '' then
      raise Exception.Create('No hay campos SET disponibles para actualizar INVENTARIO_PRODUCTO destino.');

    Q.Database := IBDestino.Database;
    Q.Transaction := IBDestino.Transaction;
    Q.SQL.Text :=
      'update INVENTARIO_PRODUCTO set ' + SQLSet +
      ' where CODIGO = :CODIGO_KEY';

    for I := 0 to Campos.Count - 1 do
    begin
      if SameTextD7(Campos[I], 'CODIGO') then
        Continue;
      NormalizarValoresEspejo(Q, AOrigen, Campos[I], ACodigoOrigen);
    end;

    Q.ParamByName('CODIGO_KEY').AsInteger := ACodigoOrigen;
    Q.ExecSQL;
  finally
    Q.Free;
    Campos.Free;
  end;
end;

procedure EjecutarInsertInventarioDestino(AOrigen, ADestino: TDataSet; ACodigoOrigen: Integer);
var
  IBDestino: TIBDataSet;
  Q: TIBQuery;
  Campos: TStringList;
  I: Integer;
  SQLFields: string;
  SQLValues: string;
begin
  IBDestino := DatasetAsIBDataSet(ADestino, 'INVENTARIO_PRODUCTO destino');
  EnsureTransaction(IBDestino, 'INVENTARIO_PRODUCTO destino');

  Campos := TStringList.Create;
  Q := TIBQuery.Create(nil);
  try
    BuildMirrorFields(Campos, AOrigen, ADestino, True);

    if Campos.IndexOf('CODIGO') < 0 then
      Campos.Insert(0, 'CODIGO');

    SQLFields := '';
    SQLValues := '';

    for I := 0 to Campos.Count - 1 do
    begin
      if SQLFields <> '' then
      begin
        SQLFields := SQLFields + ', ';
        SQLValues := SQLValues + ', ';
      end;

      SQLFields := SQLFields + Campos[I];
      SQLValues := SQLValues + ':' + Campos[I];
    end;

    Q.Database := IBDestino.Database;
    Q.Transaction := IBDestino.Transaction;
    Q.SQL.Text :=
      'insert into INVENTARIO_PRODUCTO (' + SQLFields + ') ' +
      'values (' + SQLValues + ')';

    for I := 0 to Campos.Count - 1 do
      NormalizarValoresEspejo(Q, AOrigen, Campos[I], ACodigoOrigen);

    Q.ExecSQL;
  finally
    Q.Free;
    Campos.Free;
  end;
end;

procedure ReabrirDestinoPorCodigoSiAplica(ADestino: TDataSet; ACodigoOrigen: Integer);
var
  IBDestino: TIBDataSet;
begin
  if ADestino = nil then
    Exit;

  if not (ADestino is TIBDataSet) then
    Exit;

  IBDestino := TIBDataSet(ADestino);

  try
    if IBDestino.Active then
      IBDestino.Close;

    try
      IBDestino.Params[0].Value := ACodigoOrigen;
    except
      // Si el dataset no usa parametros, no detenemos la sincronizacion SQL directa.
    end;

    IBDestino.Open;
  except
    // No detenemos la sincronizacion por fallo de refresco visual.
  end;
end;

function SincronizarInventarioProducto(AOrigen: TDataSet; ADestino: TDataSet): Boolean;
var
  CodigoOrigen: Integer;
  ExisteDestino: Boolean;
  IBDestino: TIBDataSet;
begin
  Result := False;

  EnsureOpen(AOrigen, 'INVENTARIO_PRODUCTO origen');
  EnsureOpen(ADestino, 'INVENTARIO_PRODUCTO destino');

  if AOrigen.IsEmpty then
    raise Exception.Create('El dataset origen no tiene registro activo.');

  RequiredField(AOrigen, 'CODIGO', 'INVENTARIO_PRODUCTO origen');
  RequiredField(AOrigen, 'CODIGO_TEXTO', 'INVENTARIO_PRODUCTO origen');
  RequiredField(AOrigen, 'CODIGO_BARRA', 'INVENTARIO_PRODUCTO origen');
  RequiredField(AOrigen, 'DESCRIPCION', 'INVENTARIO_PRODUCTO origen');

  RequiredField(ADestino, 'CODIGO', 'INVENTARIO_PRODUCTO destino');

  if AOrigen.State in [dsEdit, dsInsert] then
    AOrigen.Post;

  CodigoOrigen := GetFieldInt(AOrigen, 'CODIGO', 0);

  if CodigoOrigen <= 0 then
    raise Exception.Create('CODIGO invalido en INVENTARIO_PRODUCTO origen.');

  // Modo espejo: la clave de sincronizacion es CODIGO.
  // CODIGO_BARRA y DESCRIPCION se validan como unicos, pero NO deciden el registro destino.
  ValidarConflictosEspejo(AOrigen, ADestino, CodigoOrigen);

  ExisteDestino := ProductoExistePorCodigoDestino(ADestino, CodigoOrigen);

  if ExisteDestino then
    EjecutarUpdateInventarioDestino(AOrigen, ADestino, CodigoOrigen)
  else
    EjecutarInsertInventarioDestino(AOrigen, ADestino, CodigoOrigen);

  IBDestino := DatasetAsIBDataSet(ADestino, 'INVENTARIO_PRODUCTO destino');
  if IBDestino.Transaction.InTransaction then
    IBDestino.Transaction.CommitRetaining;

  ReabrirDestinoPorCodigoSiAplica(ADestino, CodigoOrigen);

  Result := True;
end;

function SincronizarInventarioProductoPorCodigo(
  AOrigen: TDataSet;
  ADestino: TDataSet;
  ACodigoOrigen: Integer
): Boolean;
begin
  Result := False;

  EnsureOpen(AOrigen, 'INVENTARIO_PRODUCTO origen');
  EnsureOpen(ADestino, 'INVENTARIO_PRODUCTO destino');

  if ACodigoOrigen <= 0 then
    raise Exception.Create('ACodigoOrigen invalido.');

  RequiredField(AOrigen, 'CODIGO', 'INVENTARIO_PRODUCTO origen');

  if not AOrigen.Locate('CODIGO', ACodigoOrigen, []) then
    raise Exception.Create('No existe el producto origen CODIGO=' + IntToStr(ACodigoOrigen));

  Result := SincronizarInventarioProducto(AOrigen, ADestino);
end;

end.

