unit UGastoTxtBuilder;

interface

uses
  Classes, SysUtils, DB, IBDatabase, IBQuery;

type
  EGastoTxtBuilder = class(Exception);

  TGastoTxtBuildResult = record
    OutputFile: string;
    ENcf: string;
    TipoEcf: string;
    DetailCount: Integer;
    PaymentCount: Integer;
  end;

  TGastoTxtBuilder = class
  private
    FDatabase: TIBDatabase;
    FTransaction: TIBTransaction;

    function CreateQuery(const ASql: string): TIBQuery;
    procedure EnsureConnected;
    function LoadMaster(const ATrn: Integer): TIBQuery;
    function LoadDetail(const ATrn: Integer): TIBQuery;

    function BuildHeaderLine(QMaster: TIBQuery): string;
    function BuildDetailLines(QDetail: TIBQuery): TStringList;
    function BuildPaymentLines(QMaster: TIBQuery): TStringList;

    function SafeText(const S: string): string;
    function EncodeField(const S: string): string;
    function NullToText(AField: TField): string;
    function DateFieldToTxt(AField: TField): string;
    function AmountFieldToTxt(AField: TField): string;
    function FormatAmount(const AValue: Currency): string;
    function OnlyDigits(const S: string): string;
    function NormalizeGeoCode(const S: string): string;
    function JoinFields(const AFields: array of string): string;
    procedure WriteUtf8NoBomAtomic(const AFileName, AContent: string);
  public
    constructor Create(ADatabase: TIBDatabase; ATransaction: TIBTransaction);
    function GenerateGastosTxt(
      const ATrn: Integer;
      const AOutputFile: string
    ): TGastoTxtBuildResult;
  end;

implementation

const
  SQL_GASTO_TXT_MASTER =
    'SELECT ' +
    '  m.NUMERO AS TRN, ' +
    '  m.FECHA AS FECHA_EMISION, ' +
    '  m.TIPO_CF AS TIPO_ECF, ' +
    '  COALESCE(NULLIF(TRIM(m.ECF), ''''), NULLIF(TRIM(na.ECF), ''''), ' +
    '           NULLIF(TRIM(na.NUMERO_NCF), '''')) AS ENCF, ' +
    '  (SELECT FIRST 1 d.FECHA_VENCE ' +
    '     FROM DGII_SERIE_NFC d ' +
    '    WHERE d.TIPO_CF = m.TIPO_CF AND d.ACTIVO = 1 ' +
    '    ORDER BY d.FECHA_VENCE DESC) AS FECHA_VENCE_SECUENCIA, ' +
    '  CASE m.FPAGO WHEN 1 THEN 1 WHEN 2 THEN 2 ELSE NULL END AS TIPO_PAGO, ' +
    '  CASE WHEN m.FPAGO = 2 THEN m.FECHA_VENCE ELSE NULL END AS FECHA_LIMITE_PAGO, ' +
    '  CASE WHEN m.TIPO_CF = ''43'' THEN NULL ELSE m.IND_MONTO_GRAVADO END AS IND_MONTO_GRAVADO, ' +
    '  CASE m.IDCODIGO_TPAGODGII ' +
    '    WHEN 1 THEN 1 WHEN 2 THEN 3 WHEN 3 THEN 2 WHEN 7 THEN 4 ' +
    '    WHEN 9 THEN 5 WHEN 11 THEN 8 WHEN 12 THEN 3 WHEN 18 THEN 2 ' +
    '    WHEN 19 THEN 2 WHEN 22 THEN 6 ELSE NULL END AS FORMA_PAGO_ECF, ' +
    '  m.MONTO AS MONTO_PAGADO_PROVEEDOR, ' +
    '  m.OBSERVACION AS COMENTARIOS, ' +
    '  p.TIPODOC AS TIPO_DOC_PROVEEDOR, ' +
    '  CASE WHEN m.TIPO_CF = ''41'' AND p.TIPODOC IN (1,2) ' +
    '       THEN NULLIF(TRIM(p.RNC_PROVEEDOR), '''') ELSE NULL END AS DOCUMENTO_PROVEEDOR, ' +
    '  CASE WHEN m.TIPO_CF = ''41'' AND p.TIPODOC = 3 ' +
    '       THEN NULLIF(TRIM(p.RNC_PROVEEDOR), '''') ELSE NULL END AS IDENTIFICADOR_EXTRANJERO, ' +
    '  CASE WHEN m.TIPO_CF = ''41'' ' +
    '       THEN COALESCE(NULLIF(TRIM(p.DESCRIPCION), ''''), NULLIF(TRIM(p.NOMBRE_ABR), '''')) ' +
    '       ELSE NULL END AS RAZON_SOCIAL_PROVEEDOR, ' +
    '  CASE WHEN m.TIPO_CF = ''41'' THEN NULLIF(TRIM(p.CALYYNUM), '''') ELSE NULL END AS DIRECCION_PROVEEDOR, ' +
    '  CASE WHEN m.TIPO_CF = ''41'' THEN p.ID_MUNICIPIO ELSE NULL END AS MUNICIPIO_PROVEEDOR, ' +
    '  CASE WHEN m.TIPO_CF = ''41'' THEN p.ID_PROVINCIA ELSE NULL END AS PROVINCIA_PROVEEDOR ' +
    'FROM TRANS_OPERACION_MASTER m ' +
    'LEFT JOIN PROVEEDORES p ON p.CODIGO_CTE = m.COD_PROVEEDOR ' +
    'LEFT JOIN NCF_ASIGNADOS_COMPRA na ' +
    '  ON na.SERIE = m.SERIE_NCF_ASIGNADO AND na.TIPO_NCF = m.TIPO_CF ' +
    'WHERE m.NUMERO = :TRN ' +
    '  AND COALESCE(m.STATUS, ''A'') <> ''C'' ' +
    '  AND m.TIPO_CF IN (''41'', ''43'')';

  SQL_GASTO_TXT_DETAIL =
    'SELECT ' +
    '  d.SERIE AS SERIE_LINEA, ' +
    '  d.COD_SERV_PROD AS CODIGO, ' +
    '  COALESCE(NULLIF(TRIM(d.OBSERVACION), ''''), NULLIF(TRIM(p.DESCRIPCION), '''')) AS DESCRIPCION, ' +
    '  COALESCE(d.IND_BIEN_SERVICIO, p.IND_BIEN_SERVICIO) AS IND_BIEN_SERVICIO, ' +
    '  d.CANTIDAD AS CANTIDAD, ' +
    '  d.PRECIO AS PRECIO, ' +
    '  d.VALOR AS VALOR_REGISTRADO, ' +
    '  t.IDITBISECF AS IND_FACTURACION, ' +
    '  COALESCE(d.MONTO_ITBIS, 0) AS MONTO_ITBIS, ' +
    '  COALESCE(d.MONTO_ITBIS_RETENIDO, 0) AS MONTO_ITBIS_RETENIDO, ' +
    '  COALESCE(d.MONTO_ISR_RETENIDO, 0) AS MONTO_ISR_RETENIDO ' +
    'FROM TRANS_OPERACION_DET d ' +
    'LEFT JOIN PRODUCTOS p ON p.CODIGO = d.COD_SERV_PROD ' +
    'LEFT JOIN TASA_ITBIS t ON t.IDTASAITBIS = d.IDTASAITBIS ' +
    'WHERE d.NUMERO = :TRN ' +
    '  AND COALESCE(d.STATUS, ''A'') <> ''C'' ' +
    'ORDER BY d.SERIE';

constructor TGastoTxtBuilder.Create(
  ADatabase: TIBDatabase;
  ATransaction: TIBTransaction);
begin
  inherited Create;

  if ADatabase = nil then
    raise EGastoTxtBuilder.Create('ADatabase es obligatorio.');
  if ATransaction = nil then
    raise EGastoTxtBuilder.Create('ATransaction es obligatorio.');

  FDatabase := ADatabase;
  FTransaction := ATransaction;
end;

procedure TGastoTxtBuilder.EnsureConnected;
begin
  if not Assigned(FDatabase) then
    raise EGastoTxtBuilder.Create('No hay TIBDatabase asignado.');

  if not FDatabase.Connected then
    raise EGastoTxtBuilder.Create('La base de datos no esta conectada.');
end;

function TGastoTxtBuilder.CreateQuery(const ASql: string): TIBQuery;
begin
  Result := TIBQuery.Create(nil);
  try
    Result.Database := FDatabase;
    Result.Transaction := FTransaction;
    Result.SQL.Text := ASql;
  except
    Result.Free;
    raise;
  end;
end;

function TGastoTxtBuilder.LoadMaster(const ATrn: Integer): TIBQuery;
begin
  Result := CreateQuery(SQL_GASTO_TXT_MASTER);
  Result.ParamByName('TRN').AsInteger := ATrn;
  Result.Open;

  if Result.IsEmpty then
  begin
    Result.Free;
    raise EGastoTxtBuilder.CreateFmt(
      'No se encontro el gasto E41/E43 numero %d.',
      [ATrn]);
  end;
end;

function TGastoTxtBuilder.LoadDetail(const ATrn: Integer): TIBQuery;
begin
  Result := CreateQuery(SQL_GASTO_TXT_DETAIL);
  Result.ParamByName('TRN').AsInteger := ATrn;
  Result.Open;

  if Result.IsEmpty then
  begin
    Result.Free;
    raise EGastoTxtBuilder.CreateFmt(
      'El gasto %d no contiene lineas activas.',
      [ATrn]);
  end;
end;

function TGastoTxtBuilder.SafeText(const S: string): string;
begin
  Result := Trim(
    StringReplace(
      StringReplace(S, #13, ' ', [rfReplaceAll]),
      #10,
      ' ',
      [rfReplaceAll]
    )
  );
end;

function TGastoTxtBuilder.EncodeField(const S: string): string;
begin
  Result := SafeText(S);
  Result := StringReplace(Result, '%', '%25', [rfReplaceAll]);
  Result := StringReplace(Result, '|', '%7C', [rfReplaceAll]);
end;

function TGastoTxtBuilder.NullToText(AField: TField): string;
begin
  if (AField = nil) or AField.IsNull then
    Result := ''
  else
    Result := SafeText(AField.AsString);
end;

function TGastoTxtBuilder.DateFieldToTxt(AField: TField): string;
var
  D: TDateTime;
begin
  if (AField = nil) or AField.IsNull then
  begin
    Result := '';
    Exit;
  end;

  if AField.DataType in [ftDate, ftDateTime, ftTimeStamp] then
  begin
    Result := FormatDateTime('dd-mm-yyyy', AField.AsDateTime);
    Exit;
  end;

  if TryStrToDate(AField.AsString, D) then
    Result := FormatDateTime('dd-mm-yyyy', D)
  else
    Result := SafeText(AField.AsString);
end;

function TGastoTxtBuilder.FormatAmount(const AValue: Currency): string;
var
  OldSep: Char;
begin
  OldSep := DecimalSeparator;
  DecimalSeparator := '.';
  try
    Result := FormatFloat('0.00', AValue);
  finally
    DecimalSeparator := OldSep;
  end;
end;

function TGastoTxtBuilder.AmountFieldToTxt(AField: TField): string;
begin
  if (AField = nil) or AField.IsNull then
    Result := ''
  else
    Result := FormatAmount(AField.AsCurrency);
end;

function TGastoTxtBuilder.OnlyDigits(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;

function TGastoTxtBuilder.NormalizeGeoCode(const S: string): string;
var
  D: string;
begin
  D := OnlyDigits(S);

  if D = '' then
    Result := ''
  else
  begin
    while Length(D) < 6 do
      D := '0' + D;

    if Length(D) > 6 then
      D := Copy(D, Length(D) - 5, 6);

    Result := D;
  end;
end;

function TGastoTxtBuilder.JoinFields(
  const AFields: array of string): string;
var
  I: Integer;
begin
  Result := '';

  for I := Low(AFields) to High(AFields) do
  begin
    if I > Low(AFields) then
      Result := Result + '||';

    Result := Result + EncodeField(AFields[I]);
  end;
end;

procedure TGastoTxtBuilder.WriteUtf8NoBomAtomic(
  const AFileName,
  AContent: string);
var
  FS: TFileStream;
  UTF8: UTF8String;
  TmpFile: string;
begin
  ForceDirectories(ExtractFileDir(AFileName));

  TmpFile := AFileName + '.tmp';
  if FileExists(TmpFile) then
    DeleteFile(TmpFile);

  FS := TFileStream.Create(TmpFile, fmCreate);
  try
    UTF8 := UTF8Encode(AContent);
    if Length(UTF8) > 0 then
      FS.WriteBuffer(Pointer(UTF8)^, Length(UTF8));
  finally
    FS.Free;
  end;

  if FileExists(AFileName) then
    if not DeleteFile(AFileName) then
      raise EGastoTxtBuilder.Create(
        'No fue posible reemplazar Gastos.txt: ' + AFileName);

  if not RenameFile(TmpFile, AFileName) then
  begin
    DeleteFile(TmpFile);
    raise EGastoTxtBuilder.Create(
      'No fue posible publicar Gastos.txt: ' + AFileName);
  end;
end;

function TGastoTxtBuilder.BuildHeaderLine(QMaster: TIBQuery): string;
var
  F: array[0..18] of string;
  TipoCF: string;
begin
  TipoCF := Trim(QMaster.FieldByName('TIPO_ECF').AsString);

  F[0] := '2';
  F[1] := 'GASTO1';
  F[2] := NullToText(QMaster.FieldByName('ENCF'));
  F[3] := TipoCF;
  F[4] := DateFieldToTxt(QMaster.FieldByName('FECHA_EMISION'));
  F[5] := DateFieldToTxt(QMaster.FieldByName('FECHA_VENCE_SECUENCIA'));

  if TipoCF = '41' then
  begin
    F[6] := NullToText(QMaster.FieldByName('TIPO_PAGO'));
    F[7] := DateFieldToTxt(QMaster.FieldByName('FECHA_LIMITE_PAGO'));
    F[8] := NullToText(QMaster.FieldByName('IND_MONTO_GRAVADO'));
  end
  else
  begin
    F[6] := '';
    F[7] := '';
    F[8] := '';
  end;

  F[9] := AmountFieldToTxt(QMaster.FieldByName('MONTO_PAGADO_PROVEEDOR'));

  if TipoCF = '41' then
  begin
    F[10] := NullToText(QMaster.FieldByName('TIPO_DOC_PROVEEDOR'));
    F[11] := NullToText(QMaster.FieldByName('DOCUMENTO_PROVEEDOR'));
    F[12] := NullToText(QMaster.FieldByName('IDENTIFICADOR_EXTRANJERO'));
    F[13] := NullToText(QMaster.FieldByName('RAZON_SOCIAL_PROVEEDOR'));
    F[14] := NullToText(QMaster.FieldByName('DIRECCION_PROVEEDOR'));
    F[15] := NormalizeGeoCode(
      NullToText(QMaster.FieldByName('MUNICIPIO_PROVEEDOR')));
    F[16] := NormalizeGeoCode(
      NullToText(QMaster.FieldByName('PROVINCIA_PROVEEDOR')));
  end
  else
  begin
    F[10] := '';
    F[11] := '';
    F[12] := '';
    F[13] := '';
    F[14] := '';
    F[15] := '';
    F[16] := '';
  end;

  F[17] := NullToText(QMaster.FieldByName('COMENTARIOS'));
  F[18] := IntToStr(QMaster.FieldByName('TRN').AsInteger);

  Result := JoinFields(F);
end;

function TGastoTxtBuilder.BuildDetailLines(
  QDetail: TIBQuery): TStringList;
var
  F: array[0..11] of string;
begin
  Result := TStringList.Create;

  QDetail.First;
  while not QDetail.Eof do
  begin
    F[0] := '1';
    F[1] := NullToText(QDetail.FieldByName('CODIGO'));
    F[2] := NullToText(QDetail.FieldByName('DESCRIPCION'));
    F[3] := NullToText(QDetail.FieldByName('IND_BIEN_SERVICIO'));
    F[4] := AmountFieldToTxt(QDetail.FieldByName('CANTIDAD'));
    F[5] := AmountFieldToTxt(QDetail.FieldByName('PRECIO'));
    F[6] := AmountFieldToTxt(QDetail.FieldByName('VALOR_REGISTRADO'));
    F[7] := NullToText(QDetail.FieldByName('IND_FACTURACION'));
    F[8] := AmountFieldToTxt(QDetail.FieldByName('MONTO_ITBIS'));
    F[9] := AmountFieldToTxt(QDetail.FieldByName('MONTO_ITBIS_RETENIDO'));
    F[10] := AmountFieldToTxt(QDetail.FieldByName('MONTO_ISR_RETENIDO'));
    F[11] := NullToText(QDetail.FieldByName('SERIE_LINEA'));

    Result.Add(JoinFields(F));
    QDetail.Next;
  end;
end;

function TGastoTxtBuilder.BuildPaymentLines(
  QMaster: TIBQuery): TStringList;
var
  F: array[0..2] of string;
  TipoCF: string;
begin
  Result := TStringList.Create;
  TipoCF := Trim(QMaster.FieldByName('TIPO_ECF').AsString);

  if TipoCF <> '41' then
    Exit;

  if QMaster.FieldByName('FORMA_PAGO_ECF').IsNull then
    raise EGastoTxtBuilder.Create(
      'E41 no tiene una forma de pago e-CF valida.');

  F[0] := '3';
  F[1] := NullToText(QMaster.FieldByName('FORMA_PAGO_ECF'));
  F[2] := AmountFieldToTxt(QMaster.FieldByName('MONTO_PAGADO_PROVEEDOR'));
  Result.Add(JoinFields(F));
end;

function TGastoTxtBuilder.GenerateGastosTxt(
  const ATrn: Integer;
  const AOutputFile: string): TGastoTxtBuildResult;
var
  StartedTx: Boolean;
  QMaster: TIBQuery;
  QDetail: TIBQuery;
  Header: string;
  Details: TStringList;
  Payments: TStringList;
  Content: TStringList;
  ENcf: string;
  TipoCF: string;
begin
  FillChar(Result, SizeOf(Result), 0);

  if ATrn <= 0 then
    raise EGastoTxtBuilder.Create('TRN de gastos invalido.');

  if Trim(AOutputFile) = '' then
    raise EGastoTxtBuilder.Create('La ruta de Gastos.txt es obligatoria.');

  EnsureConnected;

  StartedTx := not FTransaction.InTransaction;
  if StartedTx then
    FTransaction.StartTransaction;

  QMaster := nil;
  QDetail := nil;
  Details := nil;
  Payments := nil;
  Content := nil;

  try
    QMaster := LoadMaster(ATrn);
    QDetail := LoadDetail(ATrn);

    ENcf := UpperCase(Trim(QMaster.FieldByName('ENCF').AsString));
    TipoCF := Trim(QMaster.FieldByName('TIPO_ECF').AsString);

    if Length(ENcf) <> 13 then
      raise EGastoTxtBuilder.Create(
        'El gasto no tiene un e-NCF reservado valido.');

    if Copy(ENcf, 1, 3) <> 'E' + TipoCF then
      raise EGastoTxtBuilder.Create(
        'El e-NCF reservado no coincide con el tipo de gasto.');

    Header := BuildHeaderLine(QMaster);
    Details := BuildDetailLines(QDetail);
    Payments := BuildPaymentLines(QMaster);

    if Details.Count = 0 then
      raise EGastoTxtBuilder.Create(
        'Gastos.txt no puede generarse sin detalle.');

    Content := TStringList.Create;
    Content.Add(Header);
    Content.AddStrings(Details);
    Content.AddStrings(Payments);

    WriteUtf8NoBomAtomic(AOutputFile, Content.Text);

    Result.OutputFile := AOutputFile;
    Result.ENcf := ENcf;
    Result.TipoEcf := 'E' + TipoCF;
    Result.DetailCount := Details.Count;
    Result.PaymentCount := Payments.Count;

    if StartedTx then
      FTransaction.Rollback;
  except
    if StartedTx and FTransaction.InTransaction then
      FTransaction.Rollback;
    raise;
  end;

  Content.Free;
  Payments.Free;
  Details.Free;
  QDetail.Free;
  QMaster.Free;
end;

end.
