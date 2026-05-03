unit USincronizarTablaInv;

interface

uses
  SysUtils, DB, Variants;

function SincronizarInventarioProducto(
  AOrigen: TDataSet;
  ADestino: TDataSet
): Boolean;

implementation


function FieldExists(ADataSet: TDataSet; const AFieldName: string): Boolean;
begin
  Result := (ADataSet <> nil) and (ADataSet.FindField(AFieldName) <> nil);
end;

function GetFieldStr(ADataSet: TDataSet; const AFieldName: string): string;
begin
  Result := '';

  if FieldExists(ADataSet, AFieldName) then
    Result := Trim(ADataSet.FieldByName(AFieldName).AsString);
end;

procedure SetFieldValueIfExists(ADestino: TDataSet; const AFieldName: string; const AValue: Variant);
begin
  if FieldExists(ADestino, AFieldName) then
  begin
    if VarIsNull(AValue) then
      ADestino.FieldByName(AFieldName).Clear
    else
      ADestino.FieldByName(AFieldName).Value := AValue;
  end;
end;

procedure CopyCommonFields(
  AOrigen: TDataSet;
  ADestino: TDataSet;
  const AIgnorarCodigo: Boolean
);
var
  I: Integer;
  FieldName: string;
begin
  if (AOrigen = nil) or (ADestino = nil) then
    Exit;

  for I := 0 to AOrigen.FieldCount - 1 do
  begin
    FieldName := AOrigen.Fields[I].FieldName;

    // Nunca copiar el CODIGO del origen al destino,
    // porque puede estar desincronizado.
    if AIgnorarCodigo and (UpperCase(FieldName) = 'CODIGO') then
      Continue;                                  

    // Estos campos se controlan manualmente al final.
    if UpperCase(FieldName) = 'CODIGO_TEXTO' then
      Continue;

    if UpperCase(FieldName) = 'CODIGO_BARRA' then
      Continue;

    if FieldExists(ADestino, FieldName) then
    begin
      if not ADestino.FieldByName(FieldName).ReadOnly then
      begin
        if AOrigen.Fields[I].IsNull then
          ADestino.FieldByName(FieldName).Clear
        else
          ADestino.FieldByName(FieldName).Value := AOrigen.Fields[I].Value;
      end;
    end;
  end;
end;

function LocateDestinoInventario(
  ADestino: TDataSet;
  const ACodigoBarra: string;
  const ADescripcion: string
): Boolean;
begin
  Result := False;

  if ADestino = nil then
    Exit;

  // 1) Buscar primero por CODIGO_BARRA.
  if (ACodigoBarra <> '') and FieldExists(ADestino, 'CODIGO_BARRA') then
    Result := ADestino.Locate('CODIGO_BARRA', ACodigoBarra, [loCaseInsensitive]);

  // 2) Si no existe por CODIGO_BARRA, buscar por DESCRIPCION.
  if (not Result) and (ADescripcion <> '') and FieldExists(ADestino, 'DESCRIPCION') then
    Result := ADestino.Locate('DESCRIPCION', ADescripcion, [loCaseInsensitive]);
end;

procedure NormalizarCodigoTextoYCodigoBarra(ADestino: TDataSet);
var
  CodigoGenerado: string;
  CodigoTexto: string;
  CodigoBarra: string;
begin
  if ADestino = nil then
    Exit;

  CodigoGenerado := GetFieldStr(ADestino, 'CODIGO');
  CodigoTexto    := GetFieldStr(ADestino, 'CODIGO_TEXTO');
  CodigoBarra    := GetFieldStr(ADestino, 'CODIGO_BARRA');

  if CodigoGenerado = '' then
    Exit;

  if not (ADestino.State in [dsEdit, dsInsert]) then
    ADestino.Edit;

  // Si CODIGO_TEXTO no fue indicado, será igual al CODIGO generado.
  if FieldExists(ADestino, 'CODIGO_TEXTO') and (CodigoTexto = '') then
    ADestino.FieldByName('CODIGO_TEXTO').AsString := CodigoGenerado;

  // Si CODIGO_BARRA no fue indicado, será igual a CODIGO_TEXTO.
  CodigoTexto := GetFieldStr(ADestino, 'CODIGO_TEXTO');

  if FieldExists(ADestino, 'CODIGO_BARRA') and (CodigoBarra = '') then
    ADestino.FieldByName('CODIGO_BARRA').AsString := CodigoTexto;
end;

function SincronizarInventarioProducto(
  AOrigen: TDataSet;
  ADestino: TDataSet
): Boolean;
var
  CodigoBarraOrigen: string;
  DescripcionOrigen: string;
  CodigoTextoOrigen: string;
  ExisteDestino: Boolean;
begin
  Result := False;

  if AOrigen = nil then
    raise Exception.Create('Dataset origen no asignado.');

  if ADestino = nil then
    raise Exception.Create('Dataset destino no asignado.');

  if AOrigen.IsEmpty then
    raise Exception.Create('El dataset origen no tiene registro activo.');

  // Primero guardar el origen si está en edición o inserción.
  if AOrigen.State in [dsEdit, dsInsert] then
    AOrigen.Post;

  if not ADestino.Active then
    ADestino.Open;

  CodigoBarraOrigen := GetFieldStr(AOrigen, 'CODIGO_BARRA');
  DescripcionOrigen := GetFieldStr(AOrigen, 'DESCRIPCION');
  CodigoTextoOrigen := GetFieldStr(AOrigen, 'CODIGO_TEXTO');

  ExisteDestino := LocateDestinoInventario(
    ADestino,
    CodigoBarraOrigen,
    DescripcionOrigen
  );

  if ExisteDestino then
  begin
    ADestino.Edit;

    CopyCommonFields(AOrigen, ADestino, True);

    // En update sí copiamos CODIGO_TEXTO si viene indicado.
    if CodigoTextoOrigen <> '' then
      SetFieldValueIfExists(ADestino, 'CODIGO_TEXTO', CodigoTextoOrigen);

    // En update copiamos CODIGO_BARRA si viene indicado.
    if CodigoBarraOrigen <> '' then
      SetFieldValueIfExists(ADestino, 'CODIGO_BARRA', CodigoBarraOrigen);

    NormalizarCodigoTextoYCodigoBarra(ADestino);

    ADestino.Post;
  end
  else
  begin
    ADestino.Append;

    // Copiar campos comunes, pero nunca CODIGO del origen.
    CopyCommonFields(AOrigen, ADestino, True);

    // Si el usuario/origen indicó CODIGO_TEXTO, se respeta.
    if CodigoTextoOrigen <> '' then
      SetFieldValueIfExists(ADestino, 'CODIGO_TEXTO', CodigoTextoOrigen);

    // Si el origen indicó CODIGO_BARRA, se respeta.
    if CodigoBarraOrigen <> '' then
      SetFieldValueIfExists(ADestino, 'CODIGO_BARRA', CodigoBarraOrigen);

    // No asignar CODIGO aquí.
    // Se deja al TIBDataSet / GeneratorField / AfterPost:
    // GEN_NUM_INV_PROD -> CODIGO By 1.

    ADestino.Post;

    // Después del Post ya debería existir CODIGO generado.
    // Ahora completamos CODIGO_TEXTO y CODIGO_BARRA si faltan.
    NormalizarCodigoTextoYCodigoBarra(ADestino);

    if ADestino.State in [dsEdit, dsInsert] then
      ADestino.Post;
  end;
    
  Result := True;
end;

end.
