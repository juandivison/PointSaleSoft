unit USincronizarPrecioUnidadSurtidora;

interface

uses
  SysUtils, DB, Variants, Classes, IBQuery, IBCustomDataSet,
  USincronizarTablaInv;

function SincronizarPrecioUnidadSurtidora(
  APrecioOrigen: TDataSet;
  APrecioDestino: TDataSet;
  AProductoOrigen: TDataSet;
  AProductoDestino: TDataSet
): Boolean;

function SincronizarTodosPreciosUnidadSurtidoraDeProducto(
  APrecioOrigen: TDataSet;
  APrecioDestino: TDataSet;
  AProductoOrigen: TDataSet;
  AProductoDestino: TDataSet;
  ACodProductoOrigen: Integer
): Integer;

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
          ' para sincronizar. Detalle: ' + E.Message);
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

function GetFieldInt(ADataSet: TDataSet; const AFieldName: string; ADefault: Integer): Integer;
begin
  Result := ADefault;

  if FieldExists(ADataSet, AFieldName) then
  begin
    if not ADataSet.FieldByName(AFieldName).IsNull then
      Result := ADataSet.FieldByName(AFieldName).AsInteger;
  end;
end;

function DatasetAsIBDataSet(ADataSet: TDataSet; const ADataSetName: string): TIBDataSet;
begin
  if ADataSet = nil then
    raise Exception.Create(ADataSetName + ' no asignado.');

  if not (ADataSet is TIBDataSet) then
    raise Exception.Create(ADataSetName + ' debe ser TIBDataSet para sincronizar por SQL directo.');

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

procedure AddFieldIfExists(AList: TStrings; AOrigen: TDataSet; const AFieldName: string);
begin
  if FieldExists(AOrigen, AFieldName) then
    AList.Add(AFieldName);
end;

procedure BuildPrecioUpdateFields(AList: TStrings; AOrigen: TDataSet);
begin
  AList.Clear;

  AddFieldIfExists(AList, AOrigen, 'DESCRIPCION');
  AddFieldIfExists(AList, AOrigen, 'CANTIDAD');
  AddFieldIfExists(AList, AOrigen, 'PRECIOVENTA1');
  AddFieldIfExists(AList, AOrigen, 'PRECIOVENTA2');
  AddFieldIfExists(AList, AOrigen, 'PRECIOVENTA3');
  AddFieldIfExists(AList, AOrigen, 'PRECIOVENTA4');
  AddFieldIfExists(AList, AOrigen, 'PORCUTILIDAD1');
  AddFieldIfExists(AList, AOrigen, 'PORCUTILIDAD2');
  AddFieldIfExists(AList, AOrigen, 'PORCUTILIDAD3');
  AddFieldIfExists(AList, AOrigen, 'PORCUTILIDAD4');
  AddFieldIfExists(AList, AOrigen, 'COD_USUARIO_UPD');
  AddFieldIfExists(AList, AOrigen, 'FECHA_MOD');
  AddFieldIfExists(AList, AOrigen, 'MOD_POR');
end;

procedure BuildPrecioInsertFields(AList: TStrings; AOrigen: TDataSet);
begin
  AList.Clear;

  AddFieldIfExists(AList, AOrigen, 'DESCRIPCION');
  AddFieldIfExists(AList, AOrigen, 'CANTIDAD');
  AddFieldIfExists(AList, AOrigen, 'PRECIOVENTA1');
  AddFieldIfExists(AList, AOrigen, 'PRECIOVENTA2');
  AddFieldIfExists(AList, AOrigen, 'PRECIOVENTA3');
  AddFieldIfExists(AList, AOrigen, 'PRECIOVENTA4');
  AddFieldIfExists(AList, AOrigen, 'PORCUTILIDAD1');
  AddFieldIfExists(AList, AOrigen, 'PORCUTILIDAD2');
  AddFieldIfExists(AList, AOrigen, 'PORCUTILIDAD3');
  AddFieldIfExists(AList, AOrigen, 'PORCUTILIDAD4');
  AddFieldIfExists(AList, AOrigen, 'COD_USUARIO_IN');
  AddFieldIfExists(AList, AOrigen, 'FECHA_IN');
  AddFieldIfExists(AList, AOrigen, 'IN_POR');
  AddFieldIfExists(AList, AOrigen, 'COD_USUARIO_UPD');
  AddFieldIfExists(AList, AOrigen, 'FECHA_MOD');
  AddFieldIfExists(AList, AOrigen, 'MOD_POR');
end;

function ProductoExisteEnDestino(AProductoDestino: TDataSet; ACodProductoDestino: Integer): Boolean;
var
  IBProducto: TIBDataSet;
  Q: TIBQuery;
begin
  Result := False;

  IBProducto := DatasetAsIBDataSet(AProductoDestino, 'INVENTARIO_PRODUCTO destino');
  EnsureTransaction(IBProducto, 'INVENTARIO_PRODUCTO destino');

  Q := TIBQuery.Create(nil);
  try
    Q.Database := IBProducto.Database;
    Q.Transaction := IBProducto.Transaction;
    Q.SQL.Text :=
      'select first 1 CODIGO ' +
      'from INVENTARIO_PRODUCTO ' +
      'where CODIGO = :CODIGO';
    Q.ParamByName('CODIGO').AsInteger := ACodProductoDestino;
    Q.Open;
    Result := not Q.IsEmpty;
  finally
    Q.Free;
  end;
end;

function PrecioExisteEnDestino(APrecioDestino: TDataSet; AIdUnidad, ACodProductoDestino: Integer): Boolean;
var
  IBPrecio: TIBDataSet;
  Q: TIBQuery;
begin
  Result := False;

  IBPrecio := DatasetAsIBDataSet(APrecioDestino, 'PRECIO_UNIDADSURTIDORA destino');
  EnsureTransaction(IBPrecio, 'PRECIO_UNIDADSURTIDORA destino');

  Q := TIBQuery.Create(nil);
  try
    Q.Database := IBPrecio.Database;
    Q.Transaction := IBPrecio.Transaction;
    Q.SQL.Text :=
      'select first 1 IDUNIDAD ' +
      'from PRECIO_UNIDADSURTIDORA ' +
      'where IDUNIDAD = :IDUNIDAD ' +
      '  and COD_PRODUCTO = :COD_PRODUCTO';
    Q.ParamByName('IDUNIDAD').AsInteger := AIdUnidad;
    Q.ParamByName('COD_PRODUCTO').AsInteger := ACodProductoDestino;
    Q.Open;
    Result := not Q.IsEmpty;
  finally
    Q.Free;
  end;
end;

procedure EjecutarUpdatePrecioDestino(APrecioOrigen: TDataSet; APrecioDestino: TDataSet; AIdUnidad, ACodProductoDestino: Integer);
var
  IBPrecio: TIBDataSet;
  Q: TIBQuery;
  Campos: TStringList;
  I: Integer;
  SQLSet: string;
begin
  IBPrecio := DatasetAsIBDataSet(APrecioDestino, 'PRECIO_UNIDADSURTIDORA destino');
  EnsureTransaction(IBPrecio, 'PRECIO_UNIDADSURTIDORA destino');

  Campos := TStringList.Create;
  Q := TIBQuery.Create(nil);
  try
    BuildPrecioUpdateFields(Campos, APrecioOrigen);

    if Campos.Count = 0 then
      raise Exception.Create('No hay campos disponibles para actualizar PRECIO_UNIDADSURTIDORA destino.');

    SQLSet := '';
    for I := 0 to Campos.Count - 1 do
    begin
      if SQLSet <> '' then
        SQLSet := SQLSet + ', ';
      SQLSet := SQLSet + Campos[I] + ' = :' + Campos[I];
    end;

    Q.Database := IBPrecio.Database;
    Q.Transaction := IBPrecio.Transaction;
    Q.SQL.Text :=
      'update PRECIO_UNIDADSURTIDORA set ' + SQLSet +
      ' where IDUNIDAD = :IDUNIDAD_KEY ' +
      '   and COD_PRODUCTO = :COD_PRODUCTO_KEY';

    for I := 0 to Campos.Count - 1 do
      SetQueryParamFromField(Q, APrecioOrigen, Campos[I], Campos[I]);

    Q.ParamByName('IDUNIDAD_KEY').AsInteger := AIdUnidad;
    Q.ParamByName('COD_PRODUCTO_KEY').AsInteger := ACodProductoDestino;

    Q.ExecSQL;
  finally
    Q.Free;
    Campos.Free;
  end;
end;

procedure EjecutarInsertPrecioDestino(APrecioOrigen: TDataSet; APrecioDestino: TDataSet; AIdUnidad, ACodProductoDestino: Integer);
var
  IBPrecio: TIBDataSet;
  Q: TIBQuery;
  Campos: TStringList;
  I: Integer;
  SQLFields: string;
  SQLValues: string;
begin
  IBPrecio := DatasetAsIBDataSet(APrecioDestino, 'PRECIO_UNIDADSURTIDORA destino');
  EnsureTransaction(IBPrecio, 'PRECIO_UNIDADSURTIDORA destino');

  Campos := TStringList.Create;
  Q := TIBQuery.Create(nil);
  try
    BuildPrecioInsertFields(Campos, APrecioOrigen);

    SQLFields := 'IDUNIDAD, COD_PRODUCTO';
    SQLValues := ':IDUNIDAD_KEY, :COD_PRODUCTO_KEY';

    for I := 0 to Campos.Count - 1 do
    begin
      if FieldNameInArray(Campos[I], ['IDUNIDAD', 'COD_PRODUCTO']) then
        Continue;

      SQLFields := SQLFields + ', ' + Campos[I];
      SQLValues := SQLValues + ', :' + Campos[I];
    end;

    Q.Database := IBPrecio.Database;
    Q.Transaction := IBPrecio.Transaction;
    Q.SQL.Text :=
      'insert into PRECIO_UNIDADSURTIDORA (' + SQLFields + ') ' +
      'values (' + SQLValues + ')';

    Q.ParamByName('IDUNIDAD_KEY').AsInteger := AIdUnidad;
    Q.ParamByName('COD_PRODUCTO_KEY').AsInteger := ACodProductoDestino;

    for I := 0 to Campos.Count - 1 do
    begin
      if FieldNameInArray(Campos[I], ['IDUNIDAD', 'COD_PRODUCTO']) then
        Continue;
      SetQueryParamFromField(Q, APrecioOrigen, Campos[I], Campos[I]);
    end;

    Q.ExecSQL;
  finally
    Q.Free;
    Campos.Free;
  end;
end;

procedure ReabrirPrecioDestinoSiAplica(APrecioDestino: TDataSet; ACodProductoDestino: Integer);
var
  IBPrecio: TIBDataSet;
begin
  if APrecioDestino = nil then
    Exit;

  if not (APrecioDestino is TIBDataSet) then
    Exit;

  IBPrecio := TIBDataSet(APrecioDestino);

  try
    if IBPrecio.Active then
      IBPrecio.Close;

    try
      IBPrecio.Params[0].Value := ACodProductoDestino;
    except
      // Si el dataset no usa parametros, no detenemos la sincronizacion SQL directa.
    end;

    IBPrecio.Open;
  except
    // No detenemos la sincronizacion por fallo de refresco visual del dataset.
  end;
end;

procedure AsegurarProductoDestino(
  AProductoOrigen: TDataSet;
  AProductoDestino: TDataSet;
  ACodProductoOrigen: Integer
);
begin
  EnsureOpen(AProductoOrigen, 'INVENTARIO_PRODUCTO origen');
  EnsureOpen(AProductoDestino, 'INVENTARIO_PRODUCTO destino');

  if not ProductoExisteEnDestino(AProductoDestino, ACodProductoOrigen) then
  begin
    // Producto nuevo creado en DB1: primero se sincroniza a DB2 conservando el mismo CODIGO.
    SincronizarInventarioProductoPorCodigo(AProductoOrigen, AProductoDestino, ACodProductoOrigen);
  end;

  if not ProductoExisteEnDestino(AProductoDestino, ACodProductoOrigen) then
    raise Exception.Create(
      'No se pudo sincronizar el producto destino CODIGO=' + IntToStr(ACodProductoOrigen) +
      '. No se sincronizaran precios para evitar registros huerfanos.'
    );
end;

function SincronizarPrecioUnidadSurtidora(
  APrecioOrigen: TDataSet;
  APrecioDestino: TDataSet;
  AProductoOrigen: TDataSet;
  AProductoDestino: TDataSet
): Boolean;
var
  IdUnidad: Integer;
  CodProductoOrigen: Integer;
  CodProductoDestino: Integer;
  ExistePrecioDestino: Boolean;
  IBPrecioDestino: TIBDataSet;
begin
  Result := False;

  EnsureOpen(APrecioOrigen, 'PRECIO_UNIDADSURTIDORA origen');

  if APrecioOrigen.IsEmpty then
    raise Exception.Create('El dataset PRECIO_UNIDADSURTIDORA origen no tiene registro activo.');

  RequiredField(APrecioOrigen, 'IDUNIDAD', 'PRECIO_UNIDADSURTIDORA origen');
  RequiredField(APrecioOrigen, 'COD_PRODUCTO', 'PRECIO_UNIDADSURTIDORA origen');

  if APrecioOrigen.State in [dsEdit, dsInsert] then
    APrecioOrigen.Post;

  IdUnidad := GetFieldInt(APrecioOrigen, 'IDUNIDAD', 0);
  CodProductoOrigen := GetFieldInt(APrecioOrigen, 'COD_PRODUCTO', 0);

  if IdUnidad <= 0 then
    raise Exception.Create('IDUNIDAD invalido en PRECIO_UNIDADSURTIDORA origen.');

  if CodProductoOrigen <= 0 then
    raise Exception.Create('COD_PRODUCTO invalido en PRECIO_UNIDADSURTIDORA origen.');

  // Regla final:
  // Las DB se mantienen igualadas. Si el producto no existe en destino,
  // se sincroniza primero INVENTARIO_PRODUCTO conservando el mismo CODIGO.
  AsegurarProductoDestino(
    AProductoOrigen,
    AProductoDestino,
    CodProductoOrigen
  );

  CodProductoDestino := CodProductoOrigen;

  ExistePrecioDestino := PrecioExisteEnDestino(
    APrecioDestino,
    IdUnidad,
    CodProductoDestino
  );

  if ExistePrecioDestino then
    EjecutarUpdatePrecioDestino(APrecioOrigen, APrecioDestino, IdUnidad, CodProductoDestino)
  else
    EjecutarInsertPrecioDestino(APrecioOrigen, APrecioDestino, IdUnidad, CodProductoDestino);

  IBPrecioDestino := DatasetAsIBDataSet(APrecioDestino, 'PRECIO_UNIDADSURTIDORA destino');
  if IBPrecioDestino.Transaction.InTransaction then
    IBPrecioDestino.Transaction.CommitRetaining;

  ReabrirPrecioDestinoSiAplica(APrecioDestino, CodProductoDestino);

  Result := True;
end;

function SincronizarTodosPreciosUnidadSurtidoraDeProducto(
  APrecioOrigen: TDataSet;
  APrecioDestino: TDataSet;
  AProductoOrigen: TDataSet;
  AProductoDestino: TDataSet;
  ACodProductoOrigen: Integer
): Integer;
var
  BmkPrecio: TBookmark;
begin
  Result := 0;
  BmkPrecio := nil;

  EnsureOpen(APrecioOrigen, 'PRECIO_UNIDADSURTIDORA origen');

  if ACodProductoOrigen <= 0 then
    raise Exception.Create('ACodProductoOrigen invalido.');

  RequiredField(APrecioOrigen, 'COD_PRODUCTO', 'PRECIO_UNIDADSURTIDORA origen');

  // Aseguramos una sola vez el producto destino antes de recorrer precios.
  AsegurarProductoDestino(
    AProductoOrigen,
    AProductoDestino,
    ACodProductoOrigen
  );

  APrecioOrigen.DisableControls;
  try
    if not APrecioOrigen.IsEmpty then
      BmkPrecio := APrecioOrigen.GetBookmark;

    APrecioOrigen.First;

    while not APrecioOrigen.Eof do
    begin
      if GetFieldInt(APrecioOrigen, 'COD_PRODUCTO', 0) = ACodProductoOrigen then
      begin
        if SincronizarPrecioUnidadSurtidora(
          APrecioOrigen,
          APrecioDestino,
          AProductoOrigen,
          AProductoDestino
        ) then
          Inc(Result);
      end;

      APrecioOrigen.Next;
    end;

    if (BmkPrecio <> nil) and APrecioOrigen.BookmarkValid(BmkPrecio) then
      APrecioOrigen.GotoBookmark(BmkPrecio);

  finally
    if BmkPrecio <> nil then
      APrecioOrigen.FreeBookmark(BmkPrecio);

    APrecioOrigen.EnableControls;
  end;
end;

end.
