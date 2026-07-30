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

type
  TProductoDestinoInfo = record
    Codigo: Integer;
    CodigoBarra: string;
    Descripcion: string;
  end;

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
  // Solo se usa como identificador cuando tiene mas de 7 caracteres.
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

procedure SetQueryParamFromField(AQuery: TIBQuery; AOrigen: TDataSet;
  const AParamName, AFieldName: string);
begin
  if not FieldExists(AOrigen, AFieldName) then
    Exit;

  if AOrigen.FieldByName(AFieldName).IsNull then
    AQuery.ParamByName(AParamName).Clear
  else
    AQuery.ParamByName(AParamName).Value := AOrigen.FieldByName(AFieldName).Value;
end;

procedure AddMirrorField(AList: TStrings; AOrigen, ADestino: TDataSet;
  const AFieldName: string);
begin
  if FieldExists(AOrigen, AFieldName) and FieldExists(ADestino, AFieldName) then
    AList.Add(AFieldName);
end;

procedure BuildMirrorFields(AList: TStrings; AOrigen, ADestino: TDataSet;
  AIncludeCodigo: Boolean);
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

    // Campos calculados o readonly no deben ser forzados por SQL.
    // Los campos de identidad se copian si existen en ambos datasets.
    if ADestino.FieldByName(FieldName).ReadOnly and
       (not FieldNameInArray(FieldName,
         ['CODIGO', 'CODIGO_TEXTO', 'CODIGO_BARRA'])) then
      Continue;

    if AList.IndexOf(FieldName) < 0 then
      AList.Add(FieldName);
  end;

  if AIncludeCodigo and (AList.IndexOf('CODIGO') < 0) then
    AddMirrorField(AList, AOrigen, ADestino, 'CODIGO');

  if AList.IndexOf('CODIGO_TEXTO') < 0 then
    AddMirrorField(AList, AOrigen, ADestino, 'CODIGO_TEXTO');

  if AList.IndexOf('CODIGO_BARRA') < 0 then
    AddMirrorField(AList, AOrigen, ADestino, 'CODIGO_BARRA');
end;

procedure NormalizarValoresEspejo(AQuery: TIBQuery; AOrigen: TDataSet;
  const AFieldName: string; ACodigoOrigen: Integer);
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
    // CODIGO_TEXTO se copia, pero no participa en la decision INSERT/UPDATE.
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

procedure LimpiarProductoDestinoInfo(var AProducto: TProductoDestinoInfo);
begin
  AProducto.Codigo := 0;
  AProducto.CodigoBarra := '';
  AProducto.Descripcion := '';
end;

procedure CargarProductoDestinoInfo(AQuery: TIBQuery;
  var AProducto: TProductoDestinoInfo);
begin
  AProducto.Codigo := AQuery.FieldByName('CODIGO').AsInteger;
  AProducto.CodigoBarra := Trim(AQuery.FieldByName('CODIGO_BARRA').AsString);
  AProducto.Descripcion := Trim(AQuery.FieldByName('DESCRIPCION').AsString);
end;

function BuscarProductoDestinoPorCodigo(ADestino: TDataSet; ACodigo: Integer;
  out AProducto: TProductoDestinoInfo): Boolean;
var
  IBDestino: TIBDataSet;
  Q: TIBQuery;
begin
  Result := False;
  LimpiarProductoDestinoInfo(AProducto);

  IBDestino := DatasetAsIBDataSet(ADestino, 'INVENTARIO_PRODUCTO destino');
  EnsureTransaction(IBDestino, 'INVENTARIO_PRODUCTO destino');

  Q := TIBQuery.Create(nil);
  try
    Q.Database := IBDestino.Database;
    Q.Transaction := IBDestino.Transaction;
    Q.SQL.Text :=
      'select CODIGO, CODIGO_BARRA, DESCRIPCION ' +
      'from INVENTARIO_PRODUCTO ' +
      'where CODIGO = :CODIGO';
    Q.ParamByName('CODIGO').AsInteger := ACodigo;
    Q.Open;

    if Q.IsEmpty then
      Exit;

    CargarProductoDestinoInfo(Q, AProducto);

    Q.Next;
    if not Q.Eof then
      raise Exception.Create(
        'Inconsistencia en INVENTARIO_PRODUCTO destino. Existe mas de un registro ' +
        'con CODIGO=' + IntToStr(ACodigo) + '.'
      );

    Result := True;
  finally
    Q.Free;
  end;
end;

function BuscarProductoDestinoPorCodigoBarraReal(ADestino: TDataSet;
  const ACodigoBarra: string; out AProducto: TProductoDestinoInfo): Boolean;
var
  IBDestino: TIBDataSet;
  Q: TIBQuery;
begin
  Result := False;
  LimpiarProductoDestinoInfo(AProducto);

  if not CodigoBarraEsReal(ACodigoBarra) then
    Exit;

  IBDestino := DatasetAsIBDataSet(ADestino, 'INVENTARIO_PRODUCTO destino');
  EnsureTransaction(IBDestino, 'INVENTARIO_PRODUCTO destino');

  Q := TIBQuery.Create(nil);
  try
    Q.Database := IBDestino.Database;
    Q.Transaction := IBDestino.Transaction;
    Q.SQL.Text :=
      'select CODIGO, CODIGO_BARRA, DESCRIPCION ' +
      'from INVENTARIO_PRODUCTO ' +
      'where trim(CODIGO_BARRA) = :CODIGO_BARRA ' +
      'order by CODIGO';
    Q.ParamByName('CODIGO_BARRA').AsString := Trim(ACodigoBarra);
    Q.Open;

    if Q.IsEmpty then
      Exit;

    CargarProductoDestinoInfo(Q, AProducto);

    Q.Next;
    if not Q.Eof then
      raise Exception.Create(
        'Inconsistencia en INVENTARIO_PRODUCTO destino. El CODIGO_BARRA=' +
        Trim(ACodigoBarra) + ' esta asignado a mas de un producto.'
      );

    Result := True;
  finally
    Q.Free;
  end;
end;

procedure ResolverExistenciaProductoDestino(AOrigen, ADestino: TDataSet;
  ACodigoOrigen: Integer; out AExisteDestino: Boolean);
var
  CodigoBarraOrigen: string;
  DescripcionOrigen: string;
  ExistePorCodigo: Boolean;
  ExistePorCodigoBarra: Boolean;
  ProductoPorCodigo: TProductoDestinoInfo;
  ProductoPorCodigoBarra: TProductoDestinoInfo;
begin
  AExisteDestino := False;

  DescripcionOrigen := GetFieldStr(AOrigen, 'DESCRIPCION');
  CodigoBarraOrigen := GetFieldStr(AOrigen, 'CODIGO_BARRA');

  if DescripcionOrigen = '' then
    raise Exception.Create(
      'DESCRIPCION vacia en INVENTARIO_PRODUCTO origen. CODIGO=' +
      IntToStr(ACodigoOrigen) + '.'
    );

  ExistePorCodigo := BuscarProductoDestinoPorCodigo(
    ADestino,
    ACodigoOrigen,
    ProductoPorCodigo
  );

  ExistePorCodigoBarra := BuscarProductoDestinoPorCodigoBarraReal(
    ADestino,
    CodigoBarraOrigen,
    ProductoPorCodigoBarra
  );

  if ExistePorCodigo then
  begin
    // CODIGO solo no identifica el producto. La DESCRIPCION debe coincidir.
    if not SameTextD7(ProductoPorCodigo.Descripcion, DescripcionOrigen) then
      raise Exception.Create(
        'Conflicto de codigo en INVENTARIO_PRODUCTO destino. CODIGO=' +
        IntToStr(ACodigoOrigen) + ' pertenece al producto "' +
        ProductoPorCodigo.Descripcion + '" y el origen contiene "' +
        DescripcionOrigen + '". No se actualizo el registro destino.'
      );

    // Si el codigo de barra real existe, debe pertenecer al mismo CODIGO.
    if ExistePorCodigoBarra and
       (ProductoPorCodigoBarra.Codigo <> ACodigoOrigen) then
      raise Exception.Create(
        'Conflicto de codigo de barra en INVENTARIO_PRODUCTO destino. ' +
        'CODIGO_BARRA=' + CodigoBarraOrigen + ' pertenece al CODIGO=' +
        IntToStr(ProductoPorCodigoBarra.Codigo) + ' "' +
        ProductoPorCodigoBarra.Descripcion + '". No se sincronizo CODIGO=' +
        IntToStr(ACodigoOrigen) + '.'
      );

    // Mismo CODIGO y misma DESCRIPCION: se actualiza el producto.
    // El CODIGO_BARRA puede ser corregido si no pertenece a otro producto.
    AExisteDestino := True;
    Exit;
  end;

  // Si el CODIGO no existe, un codigo de barra real ya usado impide insertar.
  // No se actualiza otro CODIGO solamente por coincidir el codigo de barra.
  if ExistePorCodigoBarra then
    raise Exception.Create(
      'Conflicto de codigo de barra en INVENTARIO_PRODUCTO destino. ' +
      'CODIGO_BARRA=' + CodigoBarraOrigen + ' ya pertenece al CODIGO=' +
      IntToStr(ProductoPorCodigoBarra.Codigo) + ' "' +
      ProductoPorCodigoBarra.Descripcion + '". No se inserto CODIGO=' +
      IntToStr(ACodigoOrigen) + '.'
    );

  // Una DESCRIPCION repetida no es conflicto. Si CODIGO y CODIGO_BARRA
  // son diferentes, se trata como otro producto valido y se inserta.
  AExisteDestino := False;
end;

procedure EjecutarUpdateInventarioDestino(AOrigen, ADestino: TDataSet;
  ACodigoOrigen: Integer);
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

procedure EjecutarInsertInventarioDestino(AOrigen, ADestino: TDataSet;
  ACodigoOrigen: Integer);
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

procedure ReabrirDestinoPorCodigoSiAplica(ADestino: TDataSet;
  ACodigoDestino: Integer);
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
      IBDestino.Params[0].Value := ACodigoDestino;
    except
      // Si el dataset no usa parametros, no detenemos la sincronizacion SQL directa.
    end;

    IBDestino.Open;
  except
    // No detenemos la sincronizacion por fallo de refresco visual.
  end;
end;

function SincronizarInventarioProducto(AOrigen: TDataSet;
  ADestino: TDataSet): Boolean;
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
  RequiredField(ADestino, 'CODIGO_BARRA', 'INVENTARIO_PRODUCTO destino');
  RequiredField(ADestino, 'DESCRIPCION', 'INVENTARIO_PRODUCTO destino');

  if AOrigen.State in [dsEdit, dsInsert] then
    AOrigen.Post;

  CodigoOrigen := GetFieldInt(AOrigen, 'CODIGO', 0);

  if CodigoOrigen <= 0 then
    raise Exception.Create('CODIGO invalido en INVENTARIO_PRODUCTO origen.');

  ResolverExistenciaProductoDestino(
    AOrigen,
    ADestino,
    CodigoOrigen,
    ExisteDestino
  );

  if ExisteDestino then
    EjecutarUpdateInventarioDestino(
      AOrigen,
      ADestino,
      CodigoOrigen
    )
  else
    EjecutarInsertInventarioDestino(
      AOrigen,
      ADestino,
      CodigoOrigen
    );

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


