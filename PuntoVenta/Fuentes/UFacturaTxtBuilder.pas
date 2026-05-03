unit UFacturaTxtBuilder;

interface

uses
  Classes, SysUtils, DB, IBDatabase, IBQuery;

type
  EFacturaTxtBuilder = class(Exception);

  TFacturaTxtBuildResult = record
    OutputFile: string;
    ENcf: string;
    TipoEcf: string;
    DetailCount: Integer;
  end;

  TFacturaTxtBuilder = class
  private
    FDatabase: TIBDatabase;
    FTransaction: TIBTransaction;

    function CreateQuery(const ASql: string): TIBQuery;
    procedure EnsureConnected;

    function LoadMaster(const ANumeroTransaccion: Integer): TIBQuery;
    function LoadDetail(const ANumeroTransaccion: Integer): TIBQuery;
    function LoadFormaPago(const ANumeroTransaccion: Integer): TIBQuery;
    function LoadFormaPagoRef(const ANcfReferencia: string): TIBQuery;
    function LoadComentarios(const ANumeroTransaccion: Integer): TIBQuery;

    function BuildHeaderLine(QMaster, QPago, QPagoRef, QComentarios: TIBQuery): string;
    function BuildDetailLines(QDetail: TIBQuery): TStringList;

    function ResolveCondiciones(QMaster, QPago, QPagoRef: TIBQuery; const AEsNota: Boolean): string;
    procedure ResolvePaymentColumns(QMaster, QPago: TIBQuery; const AEsNota: Boolean; const ACondiciones: string; APayments: TStrings);
    function ResolveTipoIngresos(QMaster: TIBQuery; const AEsNota: Boolean; const ATipoReferencia: string): string;
    function ResolveBuyerName(QMaster: TIBQuery): string;
    function ResolveBuyerMunicipio(QMaster: TIBQuery): string;
    function ResolveBuyerProvincia(QMaster: TIBQuery): string;
    function ResolveFechaNcfModificado(QMaster: TIBQuery): string;
    function ResolveFechaLimitePago(QMaster: TIBQuery; const ACondiciones: string): string;
    function ResolveComentarios(QMaster, QComentarios: TIBQuery): string;
    function ResolveTasaDetalle(QDetail: TIBQuery): string;
    function ResolveUnidad(const AUnidad: string): string;
    function ResolveIndicadorToRate(const AIndicador: Integer): string;

    function GetTipoEcf(const AENcf: string): string;
    function GetTipoReferencia(const ANcfReferencia: string): string;
    function IsNota(const AENcf: string): Boolean;

    function SafeText(const S: string): string;
    function NullToStrTrim(AField: TField): string;
    function DateFieldToTxt(AField: TField): string;
    function CurrencyFieldToTxt(AField: TField): string;
    function FormatAmount(const AValue: Currency): string;
    function OnlyDigits(const S: string): string;
    function NormalizePaymentCode(const S: string): string;
    function NormalizeGeoCode(const S: string): string;
    function IsPaymentLabelText(const S: string): Boolean;
    function JoinFields(const AFields: array of string): string;
    procedure WriteUtf8NoBom(const AFileName, AContent: string);
  public
    constructor Create(ADatabase: TIBDatabase; ATransaction: TIBTransaction);
    function GenerateFacturaTxt(const ANumeroTransaccion: Integer; const AOutputFile: string): TFacturaTxtBuildResult;
  end;

const
  SQL_ECF_MASTER_DATA =
    'SELECT '#13#10+
    '  vm.NUMERO,'#13#10+
    '  vm.FECHA AS FechaEmision,'#13#10+
    '  cf.TIPO_NCF_IFISCAL AS TIPO_FACTURA,'#13#10+
    '  vm.ESTADO_VENTA,'#13#10+
    '  vm.REF_TRN_ORIGEN,'#13#10+
    '  vm.REF_NCF_ORIGEN,'#13#10+
    '  vm.REF_FECHA_ORIGEN,'#13#10+
    '  vm.REF_ESTADO_ORIGEN,'#13#10+
    '  na.NUMERO_NCF AS ClaveAcceso,'#13#10+
    '  cf.TIPO_NCFNCR AS TipoNCFFiscal,'#13#10+
    '  iif(vm.FORMA_PAGO = ''6'',coalesce(vm.iddgii_motivo_ncr,1),null) As MOTIVO_NOTA,'#13#10+
    '  (SELECT FIRST 1 r.INCLUYEITBISPVTA FROM REGISTRO r) AS INDICADOR_MONTO_GRAVADO,'#13#10+
    '  (SELECT FIRST 1 max(ncfa.FECHA)'#13#10+
    '     FROM NCF_ASIGNADOS ncfa'#13#10+
    '    WHERE ncfa.NUMERO_NCF = na.NUMERO_NCF_REFERENCIA) AS FECHA_DOC_REFERENCIA,'#13#10+
    '  vm.CODIGO_CTE AS CodigoCliente,'#13#10+
    '  c.CANT_DIAS_CREDITO,'#13#10+
    '  fa.FECHA_VENCE,'#13#10+
    '  COALESCE(D.FECHA_VENCE, '''') AS FechaVencimientoSecuencia,'#13#10+
    '  pa.ECF_TPAGO AS Condiciones,'#13#10+
    '  pa.ECF_FPAGO AS FormaPagoFiscal,'#13#10+
    '  COALESCE(NULLIF(TRIM(c.NOMBRE_FACTURAR), ''''),'#13#10+
    '           NULLIF(TRIM(vm.NOMBRE_CLIENTE_GENERAL), ''''),'#13#10+
    '           ''***Generico***'') AS RazonSocialDelComprador,'#13#10+
    '  c.RNC_NUMERO AS RNCDelComprador,'#13#10+
    '  COALESCE(c.ID_MUNICIPIO, a.ID_MUNICIPIO) AS CodigoMunicipioComprador,'#13#10+
    '  COALESCE(c.ID_PROVINCIA, a.ID_PROVINCIA) AS CodigoProvinciaComprador,'#13#10+
    '  a.NOMBRE AS NombreComercialEmisor,'#13#10+
    '  a.RNC_NUMERO AS RNCEmisor,'#13#10+
    '  a.CALLEYNUMERO AS DireccionEmisor,'#13#10+
    '  a.ID_MUNICIPIO AS CodigoMunicipioEmisor,'#13#10+
    '  a.ID_PROVINCIA AS CodigoProvinciaEmisor,'#13#10+
    '  na.NUMERO_NCF_REFERENCIA AS NCFReferencia,'#13#10+
    '  vm.PORC_DESCUENTO AS Descuento,'#13#10+
    '  ABS(vm.MONTO_RECARGO) AS Recargo,'#13#10+
    '  ABS(vm.PROPINA) AS Propina,'#13#10+
    '  vm.OBSERVACION AS Comentarios,'#13#10+
    '  (''0'' || vm.TIPO_INGRESO) AS TipoIngresos,'#13#10+
    '  ABS(vm.VALOR_TOTAL_DET) AS Monto_Venta,'#13#10+
    '  ABS(vm.MONTO_EXONERADO_ITBIS) AS Monto_ITBISEXONERADO,'#13#10+
    '  ABS(vm.MONTO_TOTAL_ITBIS) AS TotalITBIS'#13#10+
    'FROM VENTAS_MAST vm '#13#10+
    'LEFT JOIN CLIENTES c ON c.CODIGO_CTE = vm.CODIGO_CTE '#13#10+
    'LEFT JOIN COMPANIA a ON a.CODIGO = vm.CIA_KEY '#13#10+
    'LEFT JOIN NCF_ASIGNADOS na ON vm.SERIE_NCF_ASIGNADO = na.SERIE '#13#10+
    'LEFT JOIN FACTURAS fa ON fa.CODIGO_CTE = c.CODIGO_CTE AND fa.NUMERO_TRN_VTA = vm.NUMERO '#13#10+
    'LEFT JOIN NCF_TIPO_IFISCAL cf ON cf.TIPO_NCF = na.TIPO_NCF '#13#10+
    'LEFT JOIN tipo_pago pa ON pa.CODIGO = vm.FORMA_PAGO '#13#10+
    'LEFT JOIN DGII_SERIE_NFC D ON D.TIPO_CF = na.TIPO_NCF '#13#10+
    'WHERE vm.NUMERO = :NumeroTransaccion '#13#10+
    'AND ('#13#10+
    '      na.TIPO_NCF = ''32'''#13#10+
    '      OR ('#13#10+
    '          na.TIPO_NCF = ''34'''#13#10+
    '          AND ('#13#10+
    '                SUBSTRING(TRIM(COALESCE(na.NUMERO_NCF_REFERENCIA, '''')) FROM 1 FOR 3) = ''E32'''#13#10+
    '                OR SUBSTRING(TRIM(COALESCE(na.NUMERO_NCF_REFERENCIA, '''')) FROM 1 FOR 2) = ''32'''#13#10+
    '              )'#13#10+
    '         )'#13#10+
    '      OR ('#13#10+
    '          vm.CODIGO_CTE <> 0'#13#10+
    '          AND NULLIF(TRIM(COALESCE(c.RNC_NUMERO, '''')), '''') IS NOT NULL'#13#10+
    '         )'#13#10+
    '    )';

  SQL_ECF_DETALLE =
    'SELECT '#13#10+
    '  d.serie,'#13#10+
    '  coalesce(t.IDITBISECF,1) as IndicadorFacturacion,'#13#10+
    '  coalesce(ti.IDINDICADORBOSERV,1) AS Tipo,'#13#10+
    '  abs(d.CANTIDAD) AS Cantidad,'#13#10+
    '  abs(d.PRECIO) AS Precio,'#13#10+
    '  COALESCE(d.DESCRIPCION, d.DESCRIPCIONPRODUCTO) AS Descripcion,'#13#10+
    '  d.CODIGO_PROD AS Codigo,'#13#10+
    '  u.DESCRIPCION AS Unidad,'#13#10+
    '  abs(d.ITBI_DET) AS Monto_Itbis_det,'#13#10+
    '  abs(d.MONTO_DESC_ITEM) AS MontoDescItem '#13#10+
    'FROM VENTAS_DET d '#13#10+
    'LEFT OUTER JOIN UNIDADES u ON u.IDUNIDAD = d.TIPO_UNIDAD '#13#10+
    'LEFT OUTER JOIN TASA_ITBIS t ON t.IDTASAITBIS = d.IDTASAITBIS '#13#10+
    'LEFT OUTER JOIN INVENTARIO_PRODUCTO i ON i.CODIGO = d.CODIGO_PROD '#13#10+
    'LEFT OUTER JOIN TIPO_INVENTARIO ti ON ti.CODIGO = i.TIPO '#13#10+
    'WHERE d.NUMERO = :NumeroTransaccion '#13#10+
    '  AND d.STATUS_DET = ''A'' '#13#10+
    '  AND d.CODIGO_PROD > 0 '#13#10+
    'ORDER BY d.SERIE';

  SQL_ECF_FORMA_PAGO =
    'SELECT '#13#10+
    '  t.ECF_FPAGO AS TipoPagoFiscal,'#13#10+
    '  p.MONTO_PAGADO AS MontoPagado '#13#10+
    'FROM DETALLE_PAGOS p '#13#10+
    'INNER JOIN tipo_pago t ON t.CODIGO = p.TIPO_PAGO '#13#10+
    'WHERE p.SERIE_TRN = :NumeroTransaccion';

  SQL_ECF_FORMA_PAGO_REF =
    'SELECT DISTINCT '#13#10+
    '  t.ECF_FPAGO AS TipoPagoFiscal,'#13#10+
    '  p.MONTO_PAGADO AS MontoPagado '#13#10+
    'FROM DETALLE_PAGOS p '#13#10+
    'INNER JOIN tipo_pago t ON t.CODIGO = p.TIPO_PAGO '#13#10+
    'INNER JOIN VENTAS_MAST v ON v.NUMERO = p.SERIE_TRN '#13#10+
    'INNER JOIN NCF_ASIGNADOS n ON n.SERIE = v.SERIE_NCF_ASIGNADO '#13#10+
    'WHERE n.NUMERO_NCF = :NumeroNCFReferencia';

  SQL_ECF_COMENTARIO =
    'SELECT c.NUMLIN NumeroLinea, c.LINEA COMENTARIO '#13#10+
    'FROM LCOMENTARIO c '#13#10+
    'WHERE c.NUMERO_TRN = :NumeroTransaccion '#13#10+
    '  AND c.TIPO_OPE = :TipoOperacion';

implementation

constructor TFacturaTxtBuilder.Create(ADatabase: TIBDatabase; ATransaction: TIBTransaction);
begin
  inherited Create;
  if ADatabase = nil then
    raise EFacturaTxtBuilder.Create('ADatabase es requerido.');
  if ATransaction = nil then
    raise EFacturaTxtBuilder.Create('ATransaction es requerido.');

  FDatabase := ADatabase;
  FTransaction := ATransaction;
end;

procedure TFacturaTxtBuilder.EnsureConnected;
begin
  if not Assigned(FDatabase) then
    raise EFacturaTxtBuilder.Create('No hay TIBDatabase asignado.');
  if not FDatabase.Connected then
    raise EFacturaTxtBuilder.Create('La base de datos no está conectada.');
end;

function TFacturaTxtBuilder.CreateQuery(const ASql: string): TIBQuery;
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

function TFacturaTxtBuilder.LoadMaster(const ANumeroTransaccion: Integer): TIBQuery;
begin
  Result := CreateQuery(SQL_ECF_MASTER_DATA);
  Result.ParamByName('NumeroTransaccion').AsInteger := ANumeroTransaccion;
  Result.Open;
  if Result.IsEmpty then
  begin
    Result.Free;
    raise EFacturaTxtBuilder.CreateFmt('No se encontró información maestra e-CF para la transacción %d.', [ANumeroTransaccion]);
  end;
end;

function TFacturaTxtBuilder.LoadDetail(const ANumeroTransaccion: Integer): TIBQuery;
begin
  Result := CreateQuery(SQL_ECF_DETALLE);
  Result.ParamByName('NumeroTransaccion').AsInteger := ANumeroTransaccion;
  Result.Open;
  if Result.IsEmpty then
  begin
    Result.Free;
    raise EFacturaTxtBuilder.CreateFmt('No se encontraron líneas de detalle para la transacción %d.', [ANumeroTransaccion]);
  end;
end;

function TFacturaTxtBuilder.LoadFormaPago(const ANumeroTransaccion: Integer): TIBQuery;
begin
  Result := CreateQuery(SQL_ECF_FORMA_PAGO);
  Result.ParamByName('NumeroTransaccion').AsInteger := ANumeroTransaccion;
  Result.Open;
end;

function TFacturaTxtBuilder.LoadFormaPagoRef(const ANcfReferencia: string): TIBQuery;
begin
  Result := CreateQuery(SQL_ECF_FORMA_PAGO_REF);
  Result.ParamByName('NumeroNCFReferencia').AsString := Trim(ANcfReferencia);
  Result.Open;
end;

function TFacturaTxtBuilder.LoadComentarios(const ANumeroTransaccion: Integer): TIBQuery;
begin
  Result := CreateQuery(SQL_ECF_COMENTARIO);
  Result.ParamByName('NumeroTransaccion').AsInteger := ANumeroTransaccion;
  Result.ParamByName('TipoOperacion').AsString := '1';
  Result.Open;
end;

function TFacturaTxtBuilder.GetTipoEcf(const AENcf: string): string;
var
  S: string;
begin
  S := Trim(AENcf);
  if Length(S) >= 3 then
    Result := UpperCase(Copy(S, 1, 3))
  else
    Result := UpperCase(S);
end;

function TFacturaTxtBuilder.GetTipoReferencia(const ANcfReferencia: string): string;
var
  S: string;
begin
  S := Trim(ANcfReferencia);
  if Length(S) >= 3 then
    Result := UpperCase(Copy(S, 1, 3))
  else if Length(S) >= 2 then
    Result := 'E' + UpperCase(Copy(S, 1, 2))
  else
    Result := '';
end;

function TFacturaTxtBuilder.IsNota(const AENcf: string): Boolean;
var
  T: string;
begin
  T := GetTipoEcf(AENcf);
  Result := (T = 'E33') or (T = 'E34');
end;

function TFacturaTxtBuilder.SafeText(const S: string): string;
begin
  Result := Trim(StringReplace(StringReplace(S, #13, ' ', [rfReplaceAll]), #10, ' ', [rfReplaceAll]));
end;

function TFacturaTxtBuilder.NullToStrTrim(AField: TField): string;
begin
  if (AField = nil) or AField.IsNull then
    Result := ''
  else
    Result := SafeText(AField.AsString);
end;

function TFacturaTxtBuilder.DateFieldToTxt(AField: TField): string;
const
  MONTHS: array[1..12] of string =
    ('JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC');
var
  S, DD, MMM, YYYY: string;
  D: TDateTime;
  I, M: Integer;
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

  S := Trim(AField.AsString);
  if S = '' then
  begin
    Result := '';
    Exit;
  end;

  if TryStrToDate(S, D) then
  begin
    Result := FormatDateTime('dd-mm-yyyy', D);
    Exit;
  end;

  if (Length(S) = 11) and (S[3] = '-') and (S[7] = '-') then
  begin
    DD := Copy(S, 1, 2);
    MMM := UpperCase(Copy(S, 4, 3));
    YYYY := Copy(S, 8, 4);
    M := 0;

    for I := 1 to 12 do
      if MONTHS[I] = MMM then
      begin
        M := I;
        Break;
      end;

    if M > 0 then
    begin
      D := EncodeDate(StrToIntDef(YYYY, 1900), M, StrToIntDef(DD, 1));
      Result := FormatDateTime('dd-mm-yyyy', D);
      Exit;
    end;
  end;

  Result := S;
end;

function TFacturaTxtBuilder.FormatAmount(const AValue: Currency): string;
var
  OldDecSep: Char;
begin
  OldDecSep := DecimalSeparator;
  DecimalSeparator := '.';
  try
    Result := FormatFloat('0.00', AValue);
  finally
    DecimalSeparator := OldDecSep;
  end;
end;

function TFacturaTxtBuilder.CurrencyFieldToTxt(AField: TField): string;
begin
  if (AField = nil) or AField.IsNull then
    Result := ''
  else
    Result := FormatAmount(AField.AsCurrency);
end;

function TFacturaTxtBuilder.OnlyDigits(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;

function TFacturaTxtBuilder.NormalizePaymentCode(const S: string): string;
var
  D: string;
begin
  D := OnlyDigits(S);
  if D = '' then
    Result := ''
  else if Length(D) = 1 then
    Result := '0' + D
  else
    Result := Copy(D, 1, 2);
end;

function TFacturaTxtBuilder.NormalizeGeoCode(const S: string): string;
var
  D: string;
begin
  D := OnlyDigits(S);
  if D = '' then
    Result := ''
  else if Length(D) = 5 then
    Result := '0' + D
  else
    Result := D;
end;

function TFacturaTxtBuilder.IsPaymentLabelText(const S: string): Boolean;
var
  T: string;
begin
  T := UpperCase(Trim(S));
  Result :=
    (T = 'CONTADO') or
    (T = 'VENTA A CREDITO') or
    (T = 'VENTA A CRÉDITO') or
    (T = 'CREDITO') or
    (T = 'CRÉDITO') or
    (T = 'GRATUITO') or
    (T = '1') or
    (T = '2') or
    (T = '3');
end;

function TFacturaTxtBuilder.JoinFields(const AFields: array of string): string;
var
  I: Integer;
begin
  Result := '';
  for I := Low(AFields) to High(AFields) do
  begin
    if I > Low(AFields) then
      Result := Result + '||';
    Result := Result + SafeText(AFields[I]);
  end;
end;

procedure TFacturaTxtBuilder.WriteUtf8NoBom(const AFileName, AContent: string);
var
  FS: TFileStream;
  UTF8: UTF8String;
begin
  ForceDirectories(ExtractFileDir(AFileName));
  FS := TFileStream.Create(AFileName, fmCreate);
  try
    UTF8 := UTF8Encode(AContent);
    if Length(UTF8) > 0 then
      FS.WriteBuffer(Pointer(UTF8)^, Length(UTF8));
  finally
    FS.Free;
  end;
end;

function TFacturaTxtBuilder.ResolveCondiciones(QMaster, QPago, QPagoRef: TIBQuery; const AEsNota: Boolean): string;
begin
  if AEsNota then
  begin
    if (QPagoRef <> nil) and (not QPagoRef.IsEmpty) then
      Result := '1'
    else
      Result := '2';
    Exit;
  end;

  Result := NullToStrTrim(QMaster.FieldByName('Condiciones'));
  if Result = '' then
    Result := '1';
end;

procedure TFacturaTxtBuilder.ResolvePaymentColumns(QMaster, QPago: TIBQuery; const AEsNota: Boolean; const ACondiciones: string; APayments: TStrings);
var
  I: Integer;
  Tipo: string;
  Monto: string;
  TienePagoPositivo: Boolean;

  procedure SetPago(const ACodigo, AMonto: string);
  var
    P: Integer;
    Cod: string;
  begin
    Cod := NormalizePaymentCode(ACodigo);
    P := -1;

    if Cod = '01' then P := 0 else
    if Cod = '02' then P := 1 else
    if Cod = '03' then P := 2 else
    if Cod = '04' then P := 3 else
    if Cod = '05' then P := 4 else
    if Cod = '06' then P := 5 else
    if Cod = '07' then P := 6 else
    if Cod = '08' then P := 7;

    if (P >= 0) and (Trim(AMonto) <> '') and (Trim(AMonto) <> '0.00') then
    begin
      APayments[P] := AMonto;
      TienePagoPositivo := True;
    end;
  end;

begin
  if APayments.Count < 8 then
    for I := APayments.Count to 7 do
      APayments.Add('');

  for I := 0 to 7 do
    APayments[I] := '';

  TienePagoPositivo := False;

  if AEsNota then
    Exit;

  QPago.First;
  while not QPago.Eof do
  begin
    Tipo := NullToStrTrim(QPago.FieldByName('TipoPagoFiscal'));
    Monto := CurrencyFieldToTxt(QPago.FieldByName('MontoPagado'));
    SetPago(Tipo, Monto);
    QPago.Next;
  end;

  if (not TienePagoPositivo) and (Trim(ACondiciones) = '1') then
  begin
    Tipo := NullToStrTrim(QMaster.FieldByName('FormaPagoFiscal'));
    if Trim(Tipo) = '' then
      Tipo := '01';

    Monto := CurrencyFieldToTxt(QMaster.FieldByName('Monto_Venta'));
    if (Monto = '') or (Monto = '0.00') then
      raise EFacturaTxtBuilder.Create('Venta de contado sin forma de pago ni monto válido para Factura.txt.');

    SetPago(Tipo, Monto);
  end
  else if (not TienePagoPositivo) and (Trim(ACondiciones) = '2') then
  begin
    Monto := CurrencyFieldToTxt(QMaster.FieldByName('Monto_Venta'));
    if (Monto = '') or (Monto = '0.00') then
      raise EFacturaTxtBuilder.Create('Venta a crédito sin monto válido para Factura.txt.');

    SetPago('04', Monto);
  end;
end;

function TFacturaTxtBuilder.ResolveTipoIngresos(QMaster: TIBQuery; const AEsNota: Boolean; const ATipoReferencia: string): string;
begin
  Result := NullToStrTrim(QMaster.FieldByName('TipoIngresos'));
  if AEsNota and (ATipoReferencia = 'E32') then
    Result := '';
end;

function TFacturaTxtBuilder.ResolveBuyerName(QMaster: TIBQuery): string;
begin
  Result := NullToStrTrim(QMaster.FieldByName('RazonSocialDelComprador'));
  if Result = '' then
    Result := '***Generico***';
end;

function TFacturaTxtBuilder.ResolveBuyerMunicipio(QMaster: TIBQuery): string;
begin
  Result := NormalizeGeoCode(NullToStrTrim(QMaster.FieldByName('CodigoMunicipioComprador')));
  if Result = '' then
    Result := NormalizeGeoCode(NullToStrTrim(QMaster.FieldByName('CodigoMunicipioEmisor')));
end;

function TFacturaTxtBuilder.ResolveBuyerProvincia(QMaster: TIBQuery): string;
begin
  Result := NormalizeGeoCode(NullToStrTrim(QMaster.FieldByName('CodigoProvinciaComprador')));
  if Result = '' then
    Result := NormalizeGeoCode(NullToStrTrim(QMaster.FieldByName('CodigoProvinciaEmisor')));
end;

function TFacturaTxtBuilder.ResolveFechaNcfModificado(QMaster: TIBQuery): string;
var
  S: string;
begin
  S := DateFieldToTxt(QMaster.FieldByName('FECHA_DOC_REFERENCIA'));
  if S = '' then
    S := DateFieldToTxt(QMaster.FieldByName('REF_FECHA_ORIGEN'));
  Result := S;
end;

function TFacturaTxtBuilder.ResolveFechaLimitePago(QMaster: TIBQuery; const ACondiciones: string): string;
var
  Dt: TDateTime;
  DiasCredito: Integer;
begin
  if Trim(ACondiciones) <> '2' then
  begin
    Result := '';
    Exit;
  end;

  Result := DateFieldToTxt(QMaster.FieldByName('FECHA_VENCE'));
  if Result <> '' then
    Exit;

  Dt := QMaster.FieldByName('FechaEmision').AsDateTime;
  if not QMaster.FieldByName('CANT_DIAS_CREDITO').IsNull then
    DiasCredito := QMaster.FieldByName('CANT_DIAS_CREDITO').AsInteger
  else
    DiasCredito := 30;

  if DiasCredito <= 0 then
    DiasCredito := 30;

  Result := FormatDateTime('dd-mm-yyyy', Dt + DiasCredito);
end;

function TFacturaTxtBuilder.ResolveComentarios(QMaster, QComentarios: TIBQuery): string;
var
  L: TStringList;
  Base, S: string;
begin
  Base := NullToStrTrim(QMaster.FieldByName('Comentarios'));
  L := TStringList.Create;
  try
    if (Base <> '') and (not IsPaymentLabelText(Base)) then
      L.Add(Base);

    if Assigned(QComentarios) then
    begin
      QComentarios.First;
      while not QComentarios.Eof do
      begin
        S := SafeText(QComentarios.FieldByName('COMENTARIO').AsString);
        if (S <> '') and (not IsPaymentLabelText(S)) then
          L.Add(S);
        QComentarios.Next;
      end;
    end;

    Result := SafeText(StringReplace(Trim(L.Text), sLineBreak, ' | ', [rfReplaceAll]));
  finally
    L.Free;
  end;
end;

function TFacturaTxtBuilder.ResolveIndicadorToRate(const AIndicador: Integer): string;
begin
  case AIndicador of
    0, 1: Result := '18.00';
    2: Result := '16.00';
    3, 4: Result := '0.00';
  else
    Result := '18.00';
  end;
end;

function TFacturaTxtBuilder.ResolveTasaDetalle(QDetail: TIBQuery): string;
var
  Indicador: Integer;
begin
  if not QDetail.FieldByName('IndicadorFacturacion').IsNull then
    Indicador := QDetail.FieldByName('IndicadorFacturacion').AsInteger
  else
    Indicador := 1;
  Result := ResolveIndicadorToRate(Indicador);
end;

function TFacturaTxtBuilder.ResolveUnidad(const AUnidad: string): string;
var
  S: string;
begin
  S := SafeText(AUnidad);
  if S = '' then
    Result := 'UND'
  else
    Result := S;
end;

function TFacturaTxtBuilder.BuildHeaderLine(QMaster, QPago, QPagoRef, QComentarios: TIBQuery): string;
var
  Fields: array[0..26] of string;
  Payments: TStringList;
  ENcf, NcfRef, TipoRef, Condiciones, FechaLimite, TipoIngresos: string;
  EsNota: Boolean;
begin
  ENcf := NullToStrTrim(QMaster.FieldByName('ClaveAcceso'));
  if ENcf = '' then
    raise EFacturaTxtBuilder.Create('ClaveAcceso / e-NCF no puede venir vacío.');

  EsNota := IsNota(ENcf);
  NcfRef := NullToStrTrim(QMaster.FieldByName('NCFReferencia'));
  TipoRef := GetTipoReferencia(NcfRef);
  Condiciones := ResolveCondiciones(QMaster, QPago, QPagoRef, EsNota);
  FechaLimite := ResolveFechaLimitePago(QMaster, Condiciones);
  TipoIngresos := ResolveTipoIngresos(QMaster, EsNota, TipoRef);

  Payments := TStringList.Create;
  try
    Payments.Capacity := 8;
    ResolvePaymentColumns(QMaster, QPago, EsNota, Condiciones, Payments);

    Fields[0] := '2';
    Fields[1] := ENcf;
    Fields[2] := ResolveBuyerName(QMaster);
    Fields[3] := NullToStrTrim(QMaster.FieldByName('RNCDelComprador'));
    Fields[4] := NcfRef;
    Fields[5] := CurrencyFieldToTxt(QMaster.FieldByName('Descuento'));
    Fields[6] := CurrencyFieldToTxt(QMaster.FieldByName('Recargo'));
    Fields[7] := CurrencyFieldToTxt(QMaster.FieldByName('Propina'));
    Fields[8] := ResolveComentarios(QMaster, QComentarios);
    Fields[9] := Payments[0];
    Fields[10] := Payments[1];
    Fields[11] := Payments[2];
    Fields[12] := Payments[3];
    Fields[13] := Payments[4];
    Fields[14] := Payments[5];
    Fields[15] := Payments[6];
    Fields[16] := Payments[7];
    Fields[17] := DateFieldToTxt(QMaster.FieldByName('FechaVencimientoSecuencia'));
    Fields[18] := TipoIngresos;
    Fields[19] := DateFieldToTxt(QMaster.FieldByName('FechaEmision'));
    Fields[20] := Condiciones;
    Fields[21] := NullToStrTrim(QMaster.FieldByName('INDICADOR_MONTO_GRAVADO'));
    Fields[22] := ResolveBuyerMunicipio(QMaster);
    Fields[23] := ResolveBuyerProvincia(QMaster);
    Fields[24] := ResolveFechaNcfModificado(QMaster);
    Fields[25] := NullToStrTrim(QMaster.FieldByName('MOTIVO_NOTA'));
    Fields[26] := FechaLimite;

    Result := JoinFields(Fields);
  finally
    Payments.Free;
  end;
end;

function TFacturaTxtBuilder.BuildDetailLines(QDetail: TIBQuery): TStringList;
var
  Line: string;
  Fields: array[0..6] of string;
begin
  Result := TStringList.Create;

  QDetail.First;
  while not QDetail.Eof do
  begin
    Fields[0] := '1';
    Fields[1] := CurrencyFieldToTxt(QDetail.FieldByName('Cantidad'));
    Fields[2] := NullToStrTrim(QDetail.FieldByName('Descripcion'));
    Fields[3] := CurrencyFieldToTxt(QDetail.FieldByName('Precio'));
    Fields[4] := ResolveTasaDetalle(QDetail);
    Fields[5] := NullToStrTrim(QDetail.FieldByName('Codigo'));
    Fields[6] := ResolveUnidad(NullToStrTrim(QDetail.FieldByName('Unidad')));
    Line := JoinFields(Fields);
    Result.Add(Line);
    QDetail.Next;
  end;
end;

function TFacturaTxtBuilder.GenerateFacturaTxt(const ANumeroTransaccion: Integer; const AOutputFile: string): TFacturaTxtBuildResult;
var
  StartedTx: Boolean;
  QMaster, QDetail, QPago, QPagoRef, QComentarios: TIBQuery;
  Header: string;
  Details: TStringList;
  Content: TStringList;
  NcfRef: string;
begin
  EnsureConnected;
  StartedTx := not FTransaction.InTransaction;
  if StartedTx then
    FTransaction.StartTransaction;

  QMaster := nil;
  QDetail := nil;
  QPago := nil;
  QPagoRef := nil;
  QComentarios := nil;
  Details := nil;
  Content := nil;
  try
    QMaster := LoadMaster(ANumeroTransaccion);
    QDetail := LoadDetail(ANumeroTransaccion);
    QPago := LoadFormaPago(ANumeroTransaccion);
    NcfRef := NullToStrTrim(QMaster.FieldByName('NCFReferencia'));
    if NcfRef <> '' then
      QPagoRef := LoadFormaPagoRef(NcfRef)
    else
      QPagoRef := CreateQuery('select 1 from RDB$DATABASE where 1=0');
    if NcfRef = '' then
      QPagoRef.Open;
    QComentarios := LoadComentarios(ANumeroTransaccion);

    Header := BuildHeaderLine(QMaster, QPago, QPagoRef, QComentarios);
    Details := BuildDetailLines(QDetail);

    Content := TStringList.Create;
    Content.Add(Header);
    Content.AddStrings(Details);
    WriteUtf8NoBom(AOutputFile, Content.Text);

    Result.OutputFile := AOutputFile;
    Result.ENcf := NullToStrTrim(QMaster.FieldByName('ClaveAcceso'));
    Result.TipoEcf := GetTipoEcf(Result.ENcf);
    Result.DetailCount := Details.Count;

    if StartedTx then
      FTransaction.Rollback;
  except
    if StartedTx and FTransaction.InTransaction then
      FTransaction.Rollback;
    raise;
  end;

  Content.Free;
  Details.Free;
  QComentarios.Free;
  QPagoRef.Free;
  QPago.Free;
  QDetail.Free;
  QMaster.Free;
end;

end.
