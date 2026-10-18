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
    //function BuildDetailLines(QDetail: TIBQuery; const AEsOperacionE44, AHayDescuentoGlobal: Boolean): TStringList;
    function BuildDetailLines(QMaster, QDetail: TIBQuery;const AEsOperacionE44, AHayDescuentoGlobal: Boolean): TStringList;
    function BuildAdjustmentLines(QMaster, QDetail: TIBQuery; const AEsOperacionE44: Boolean): TStringList;
    function BuildFiscalTotalsLine(QMaster: TIBQuery; const AEsOperacionE44: Boolean): string;

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
    function FormatAmount4(const AValue: Currency): string;
    function RoundMoney2(const AValue: Currency): Currency;
    function RoundMoney4(const AValue: Currency): Currency;
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
    '  iif(vm.FORMA_PAGO = ''6'',vm.iddgii_motivo_ncr,null) As MOTIVO_NOTA,'#13#10+
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
    '           NULLIF(TRIM(vm.NOMBRE_CLIENTE_GENERAL), '''')) AS RazonSocialDelComprador,'#13#10+
    '  c.RNC_NUMERO AS RNCDelComprador,'#13#10+
    '  c.ID_MUNICIPIO AS CodigoMunicipioComprador,'#13#10+
    '  c.ID_PROVINCIA AS CodigoProvinciaComprador,'#13#10+
    '  a.NOMBRE AS NombreComercialEmisor,'#13#10+
    '  a.RNC_NUMERO AS RNCEmisor,'#13#10+
    '  a.CALLEYNUMERO AS DireccionEmisor,'#13#10+
    '  a.ID_MUNICIPIO AS CodigoMunicipioEmisor,'#13#10+
    '  a.ID_PROVINCIA AS CodigoProvinciaEmisor,'#13#10+
    '  na.NUMERO_NCF_REFERENCIA AS NCFReferencia,'#13#10+
    '  iif(abs(coalesce(vm.PORC_DESCUENTO,0)) > 0.0001,'#13#10+
    '      abs(coalesce(vm.MONTO_DESCUENTO,0)), 0) AS Descuento,'#13#10+
    '  ABS(COALESCE(vm.MONTO_RECARGO,0)) AS RecargoBruto,'#13#10+
    '  COALESCE((SELECT SUM(ABS(COALESCE(vd.TC_MONTOITBISRECARGO_GLB,0)))'#13#10+
    '              FROM VENTAS_DET vd'#13#10+
    '             WHERE vd.NUMERO = vm.NUMERO'#13#10+
    '               AND vd.STATUS_DET = ''A''),0) AS ItbisRecargoGlobal,'#13#10+
    '  ABS(COALESCE(vm.PROPINA,0)) AS Propina,'#13#10+
    '  vm.OBSERVACION AS Comentarios,'#13#10+
    '  (''0'' || vm.TIPO_INGRESO) AS TipoIngresos,'#13#10+
    '  ABS(vm.VALOR_TOTAL_DET) AS Monto_Venta,'#13#10+
    '  ABS(COALESCE(vm.MONTO_EXONERADO_ITBIS,0)) AS Monto_ITBISEXONERADO,'#13#10+
    '  ABS(COALESCE(vm.MONTO_TOTAL_ITBIS,0)) AS TotalITBIS'#13#10+
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
    '  abs(COALESCE(d.VALOR_TOTAL_DET,0)) AS ValorTotalDet,'#13#10+
    '  abs(COALESCE(d.PORC_DESC_ITEM,0)) AS PorcDescItem,'#13#10+
    '  abs(COALESCE(d.MONTO_DESC_ITEM,0)) AS MontoDescItem,'#13#10+
    '  abs(COALESCE(d.TC_MONTORECARGO_GLB_DET,0)) AS MontoRecargoGlobalDistribuido,'#13#10+
    '  abs(COALESCE(d.TC_MONTOITBISRECARGO_GLB,0)) AS ItbisRecargoGlobal,'#13#10+

    '  abs(COALESCE(d.ITBI_DET,0)) AS ItbisBaseE44,'#13#10+
    {
      ITBI_DET es el ITBIS final persistido de la línea en PointSaleSoft.
      Es la misma fuente que consume la ruta Firebird directa. No reconstruirlo
      desde DC_ITBIS_CLD + TC_MONTOITBISRECARGO_GLB: en líneas con descuento
      por ítem esa combinación puede omitir el ajuste fiscal del descuento.
    }
    '  abs(COALESCE(d.ITBI_DET,0)) AS Monto_Itbis_det,'#13#10+
    '  COALESCE(d.DESCRIPCION, d.DESCRIPCIONPRODUCTO) AS Descripcion,'#13#10+
    '  d.CODIGO_PROD AS Codigo,'#13#10+
    '  u.DESCRIPCION AS Unidad '#13#10+
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
    '  tpv.ECF_TPAGO AS CondicionesReferencia,'#13#10+
    '  t.ECF_FPAGO AS TipoPagoFiscal,'#13#10+
    '  p.MONTO_PAGADO AS MontoPagado,'#13#10+
    '  COALESCE(f.FECHA_VENCE,'#13#10+
    '           v.FECHA + COALESCE(c.CANT_DIAS_CREDITO, 30)) AS FechaLimitePagoReferencia '#13#10+
    'FROM VENTAS_MAST v '#13#10+
    'INNER JOIN NCF_ASIGNADOS n ON n.SERIE = v.SERIE_NCF_ASIGNADO '#13#10+
    'LEFT JOIN CLIENTES c ON c.CODIGO_CTE = v.CODIGO_CTE '#13#10+
    'LEFT JOIN FACTURAS f ON f.NUMERO_TRN_VTA = v.NUMERO '#13#10+
    'LEFT JOIN tipo_pago tpv ON tpv.CODIGO = v.FORMA_PAGO '#13#10+
    'LEFT JOIN DETALLE_PAGOS p ON p.SERIE_TRN = v.NUMERO '#13#10+
    'LEFT JOIN tipo_pago t ON t.CODIGO = p.TIPO_PAGO '#13#10+
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

function TFacturaTxtBuilder.FormatAmount4(const AValue: Currency): string;
var
  OldDecSep: Char;
begin
  OldDecSep := DecimalSeparator;
  DecimalSeparator := '.';
  try
    Result := FormatFloat('0.0000', AValue);
  finally
    DecimalSeparator := OldDecSep;
  end;
end;

function TFacturaTxtBuilder.RoundMoney2(const AValue: Currency): Currency;
begin
  if AValue >= 0 then
    Result := Trunc((AValue * 100) + 0.5) / 100
  else
    Result := Trunc((AValue * 100) - 0.5) / 100;
end;

function TFacturaTxtBuilder.RoundMoney4(const AValue: Currency): Currency;
begin
  if AValue >= 0 then
    Result := Trunc((AValue * 10000) + 0.5) / 10000
  else
    Result := Trunc((AValue * 10000) - 0.5) / 10000;
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
    if (QPagoRef = nil) or QPagoRef.IsEmpty then
      raise EFacturaTxtBuilder.Create('La E34 no pudo determinar las condiciones del e-CF referenciado.');

    Result := NullToStrTrim(QPagoRef.FieldByName('CondicionesReferencia'));
    if Result = '' then
      raise EFacturaTxtBuilder.Create('La E34 no pudo heredar las condiciones de pago del e-CF referenciado.');
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

  // Las E34 llevan Condiciones heredadas, pero los montos de pago
  // permanecen vacios en Factura.txt. IdesiToolECF no valida pagos de notas.
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
  {
    El contrato actual de Factura.txt conserva TipoIngresos tambien en E34,
    incluyendo E34 que modifica E32. AEsNota y ATipoReferencia se mantienen
    en la firma para no degradar compatibilidad con el codigo existente.
  }
  Result := NullToStrTrim(QMaster.FieldByName('TipoIngresos'));
end;

function TFacturaTxtBuilder.ResolveBuyerName(QMaster: TIBQuery): string;
begin
  Result := NullToStrTrim(QMaster.FieldByName('RazonSocialDelComprador'));
end;

function TFacturaTxtBuilder.ResolveBuyerMunicipio(QMaster: TIBQuery): string;
begin
  Result := NormalizeGeoCode(NullToStrTrim(QMaster.FieldByName('CodigoMunicipioComprador')));
end;

function TFacturaTxtBuilder.ResolveBuyerProvincia(QMaster: TIBQuery): string;
begin
  Result := NormalizeGeoCode(NullToStrTrim(QMaster.FieldByName('CodigoProvinciaComprador')));
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
  ENcf, NcfRef, TipoRef, Condiciones, FechaLimite, TipoIngresos, TipoEcf: string;
  EsNota, EsOperacionE44: Boolean;
  RecargoBruto: Currency;
begin
  ENcf := NullToStrTrim(QMaster.FieldByName('ClaveAcceso'));
  if ENcf = '' then
    raise EFacturaTxtBuilder.Create('ClaveAcceso / e-NCF no puede venir vacío.');

  TipoEcf := GetTipoEcf(ENcf);
  EsNota := IsNota(ENcf);
  NcfRef := NullToStrTrim(QMaster.FieldByName('NCFReferencia'));
  TipoRef := GetTipoReferencia(NcfRef);
  EsOperacionE44 := (TipoEcf = 'E44') or ((TipoEcf = 'E34') and (TipoRef = 'E44'));

  Condiciones := ResolveCondiciones(QMaster, QPago, QPagoRef, EsNota);

  {
    E34 hereda TipoPago/Condiciones del comprobante original.
    Si la referencia era a credito, PreSend requiere FechaLimitePago.
    Se toma primero la fecha real de FACTURAS del documento original;
    solo si no existe se usa el plazo del cliente sobre la fecha original.
  }
  if EsNota and (Trim(Condiciones) = '2') then
  begin
    FechaLimite := '';
    if (QPagoRef <> nil) and
       (not QPagoRef.IsEmpty) and
       (not QPagoRef.FieldByName('FechaLimitePagoReferencia').IsNull) then
      FechaLimite := DateFieldToTxt(
        QPagoRef.FieldByName('FechaLimitePagoReferencia')
      );

    if FechaLimite = '' then
      raise EFacturaTxtBuilder.Create(
        'La E34 de credito no pudo heredar FechaLimitePago del e-CF referenciado.'
      );
  end
  else
    FechaLimite := ResolveFechaLimitePago(QMaster, Condiciones);

  TipoIngresos := ResolveTipoIngresos(QMaster, EsNota, TipoRef);

  {
    Contrato V2:
    La cabecera conserva el recargo comercial bruto de PointSaleSoft.
    La base fiscal que ASLAN debe recibir se transporta por separado
    en las líneas tipo 3, distribuida por IndicadorFacturacion.
  }
  RecargoBruto := 0;
  if not QMaster.FieldByName('RecargoBruto').IsNull then
    RecargoBruto := QMaster.FieldByName('RecargoBruto').AsCurrency;

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
    Fields[6] := FormatAmount(RecargoBruto);
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
    if (TipoEcf = 'E31') or (TipoEcf = 'E44') or (TipoEcf = 'E45') then
      Fields[17] := DateFieldToTxt(QMaster.FieldByName('FechaVencimientoSecuencia'))
    else
      Fields[17] := '';
    Fields[18] := TipoIngresos;
    Fields[19] := DateFieldToTxt(QMaster.FieldByName('FechaEmision'));
    Fields[20] := Condiciones;
    if EsOperacionE44 then
      Fields[21] := ''
    else
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

function TFacturaTxtBuilder.BuildDetailLines(QMaster, QDetail: TIBQuery;
  const AEsOperacionE44, AHayDescuentoGlobal: Boolean): TStringList;
const
  TOLERANCIA_FISCAL = 0.01;
var
  Line: string;
  Fields: array[0..11] of string;

  Cantidad, PrecioSalida, ValorTotalDet, MontoItbisDet, PorcDescItem: Currency;
  ItbisBaseE44, MontoDescItem, MontoDescFiscal: Currency;
  MontoLineaFuente, MontoObjetivo, BrutoRepresentado, NetoReproducido: Currency;
  DescPorcentajeReproducido: Currency;

  MontoTotalFuente, DescGlobal, RecargoGlobal, PropinaGlobal: Currency;
  TotalDetalleEsperado, TotalDetallePreparado, ResiduoE44: Currency;
  MayorMontoE44: Currency;

  Indicador, SerieActual, SerieResiduoE44: Integer;
  EsDescItemReal: Boolean;

  function CalcularMontoObjetivoE44: Currency;
  var
    BaseE44: Currency;
  begin
    {
      IMPORTANTE:
      VALOR_TOTAL_DET NO contiene TC_MONTORECARGO_GLB_DET.
      Por tanto aqui NO se resta MontoRecargoGlobalDistribuido.

      Base exenta de la linea:
        VALOR_TOTAL_DET - ITBI_DET

      Si existe descuento GLOBAL, PointSaleSoft lo redistribuyo en
      MONTO_DESC_ITEM y VALOR_TOTAL_DET ya esta neto de ese descuento.
      Como el descuento global viaja aparte en registro tipo 3, se agrega
      de vuelta para obtener el detalle previo al ajuste global.
    }
    BaseE44 :=
      QDetail.FieldByName('ValorTotalDet').AsCurrency -
      QDetail.FieldByName('ItbisBaseE44').AsCurrency;

    if AHayDescuentoGlobal then
      BaseE44 :=
        BaseE44 +
        QDetail.FieldByName('MontoDescItem').AsCurrency;

    Result := RoundMoney2(BaseE44);
  end;

begin
  if QMaster = nil then
    raise EFacturaTxtBuilder.Create(
      'BuildDetailLines requiere QMaster para validar el total fuente.'
    );

  Result := TStringList.Create;

  ResiduoE44 := 0;
  SerieResiduoE44 := 0;
  MayorMontoE44 := -1;

  {
    ================================================================
    PRE-PASS E44:
    determinamos si existe solamente un residuo de redondeo.
    ================================================================

    Factura.txt V2 valida:

      DetalleFuente
      - DescuentoGlobal
      + RecargoGlobal
      + Propina
      = MontoTotalFuente

    Despejando:

      DetalleFuenteEsperado
      = MontoTotalFuente
      + DescuentoGlobal
      - RecargoGlobal
      - Propina

    El recargo global NO forma parte de CalcularMontoObjetivoE44.
  }
  if AEsOperacionE44 then
  begin
    MontoTotalFuente := RoundMoney2(
      QMaster.FieldByName('Monto_Venta').AsCurrency
    );

    DescGlobal := 0;
    RecargoGlobal := 0;
    PropinaGlobal := 0;

    if not QMaster.FieldByName('Descuento').IsNull then
      DescGlobal := RoundMoney2(
        QMaster.FieldByName('Descuento').AsCurrency
      );

    if not QMaster.FieldByName('RecargoBruto').IsNull then
      RecargoGlobal := RoundMoney2(
        QMaster.FieldByName('RecargoBruto').AsCurrency
      );

    if not QMaster.FieldByName('Propina').IsNull then
      PropinaGlobal := RoundMoney2(
        QMaster.FieldByName('Propina').AsCurrency
      );

    TotalDetalleEsperado := RoundMoney2(
      MontoTotalFuente +
      DescGlobal -
      RecargoGlobal -
      PropinaGlobal
    );

    TotalDetallePreparado := 0;

    QDetail.First;
    while not QDetail.Eof do
    begin
      if QDetail.FieldByName('ValorTotalDet').AsCurrency <
         QDetail.FieldByName('ItbisBaseE44').AsCurrency then
      begin
        Result.Free;
        raise EFacturaTxtBuilder.CreateFmt(
          'E44 inconsistente en serie %s: ITBIS base mayor que el total de linea.',
          [QDetail.FieldByName('serie').AsString]
        );
      end;

      MontoObjetivo := CalcularMontoObjetivoE44;

      if MontoObjetivo < 0 then
      begin
        Result.Free;
        raise EFacturaTxtBuilder.CreateFmt(
          'E44 inconsistente en serie %s: monto exento de linea negativo.',
          [QDetail.FieldByName('serie').AsString]
        );
      end;

      TotalDetallePreparado :=
        TotalDetallePreparado + MontoObjetivo;

      SerieActual := QDetail.FieldByName('serie').AsInteger;

      {
        Si hace falta reconciliar un centavo, lo colocamos en la linea
        de mayor monto para reducir el impacto relativo.
      }
      if (SerieResiduoE44 = 0) or
         (MontoObjetivo > MayorMontoE44) then
      begin
        MayorMontoE44 := MontoObjetivo;
        SerieResiduoE44 := SerieActual;
      end;

      QDetail.Next;
    end;

    TotalDetallePreparado := RoundMoney2(
      TotalDetallePreparado
    );

    ResiduoE44 := RoundMoney2(
      TotalDetalleEsperado -
      TotalDetallePreparado
    );

    {
      Aqui NO debe aparecer 100.00.
      Para TRN 123485 debe ser:
        Esperado  = 955.99
        Preparado = 955.98
        Residuo   =   0.01
    }
    if Abs(ResiduoE44) > TOLERANCIA_FISCAL then
    begin
      Result.Free;
      raise EFacturaTxtBuilder.CreateFmt(
        'E44: detalle fuente no reconcilia con el master. ' +
        'Esperado=%.2f, Preparado=%.2f, Residuo=%.2f.',
        [TotalDetalleEsperado, TotalDetallePreparado, ResiduoE44]
      );
    end;

    if (Abs(ResiduoE44) > 0.0001) and
       (SerieResiduoE44 = 0) then
    begin
      Result.Free;
      raise EFacturaTxtBuilder.Create(
        'E44: existe residuo de redondeo y no fue posible seleccionar una linea para reconciliarlo.'
      );
    end;
  end;

  {
    ================================================================
    PASS DE GENERACION
    ================================================================
  }
  QDetail.First;
  while not QDetail.Eof do
  begin
    Cantidad := QDetail.FieldByName('Cantidad').AsCurrency;

    if Cantidad <= 0 then
    begin
      Result.Free;
      raise EFacturaTxtBuilder.CreateFmt(
        'Cantidad invalida en la serie de detalle %s.',
        [QDetail.FieldByName('serie').AsString]
      );
    end;

    if QDetail.FieldByName('IndicadorFacturacion').IsNull then
      Indicador := 1
    else
      Indicador :=
        QDetail.FieldByName('IndicadorFacturacion').AsInteger;

    if (Indicador < 1) or (Indicador > 4) then
    begin
      Result.Free;
      raise EFacturaTxtBuilder.CreateFmt(
        'IndicadorFacturacion invalido en serie %s: %d.',
        [QDetail.FieldByName('serie').AsString, Indicador]
      );
    end;

    PrecioSalida :=
      RoundMoney4(QDetail.FieldByName('Precio').AsCurrency);

    ValorTotalDet :=
      QDetail.FieldByName('ValorTotalDet').AsCurrency;

    MontoItbisDet :=
      QDetail.FieldByName('Monto_Itbis_det').AsCurrency;

    ItbisBaseE44 :=
      QDetail.FieldByName('ItbisBaseE44').AsCurrency;

    PorcDescItem :=
      QDetail.FieldByName('PorcDescItem').AsCurrency;

    MontoDescItem :=
      QDetail.FieldByName('MontoDescItem').AsCurrency;

    {
      PointSaleSoft no mezcla descuento global con descuento real por item.
      Cuando hay descuento global, MONTO_DESC_ITEM es su distribucion y
      NO debe emitirse como MontoSubDescuento.
    }
    EsDescItemReal :=
      (not AHayDescuentoGlobal) and
      (MontoDescItem > 0.0001);

    if EsDescItemReal then
      MontoDescFiscal := RoundMoney2(MontoDescItem)
    else
      MontoDescFiscal := 0;

    MontoObjetivo := 0;

    if AEsOperacionE44 then
    begin
      if ValorTotalDet < ItbisBaseE44 then
      begin
        Result.Free;
        raise EFacturaTxtBuilder.CreateFmt(
          'E44 inconsistente en serie %s: ITBIS base mayor que el total de linea.',
          [QDetail.FieldByName('serie').AsString]
        );
      end;

      {
        CRITICO:
        NO sumar ni restar MontoRecargoGlobalDistribuido aqui.
      }
      MontoObjetivo := CalcularMontoObjetivoE44;

      SerieActual := QDetail.FieldByName('serie').AsInteger;

      if (SerieActual = SerieResiduoE44) and
         (Abs(ResiduoE44) > 0.0001) then
      begin
        MontoObjetivo := RoundMoney2(
          MontoObjetivo + ResiduoE44
        );
      end;

      if MontoObjetivo < 0 then
      begin
        Result.Free;
        raise EFacturaTxtBuilder.CreateFmt(
          'E44 inconsistente en serie %s: monto exento de linea negativo.',
          [QDetail.FieldByName('serie').AsString]
        );
      end;

      {
        Con descuento real por item, PrecioSalida representa el bruto
        exento anterior al subdescuento.
      }
      PrecioSalida := RoundMoney4(
        (MontoObjetivo + MontoDescFiscal) / Cantidad
      );

      MontoLineaFuente := MontoObjetivo;
    end
    else
    begin
      {
        Rama NO E44 sin cambios funcionales.
      }
      if EsDescItemReal then
        MontoLineaFuente := RoundMoney2(ValorTotalDet)
      else
        MontoLineaFuente := RoundMoney2(
          PrecioSalida * Cantidad
        );
    end;

    BrutoRepresentado := RoundMoney2(
      PrecioSalida * Cantidad
    );

    NetoReproducido := RoundMoney2(
      BrutoRepresentado - MontoDescFiscal
    );

    if Abs(
         NetoReproducido -
         MontoLineaFuente
       ) > TOLERANCIA_FISCAL then
    begin
      Result.Free;
      raise EFacturaTxtBuilder.CreateFmt(
        'Serie %s no puede representar precio/descuento a 4 decimales sin alterar centavos. ' +
        'Bruto=%.2f, Descuento=%.2f, NetoFuente=%.2f, NetoReproducido=%.2f.',
        [QDetail.FieldByName('serie').AsString,
         BrutoRepresentado,
         MontoDescFiscal,
         MontoLineaFuente,
         NetoReproducido]
      );
    end;

    if (not AEsOperacionE44) and
       EsDescItemReal and
       (PorcDescItem > 0.0001) then
    begin
      DescPorcentajeReproducido := RoundMoney2(
        BrutoRepresentado *
        PorcDescItem /
        100
      );

      if Abs(
           DescPorcentajeReproducido -
           MontoDescFiscal
         ) > TOLERANCIA_FISCAL then
      begin
        Result.Free;
        raise EFacturaTxtBuilder.CreateFmt(
          'Descuento por item inconsistente en serie %s. ' +
          'Precio x Cantidad x %%=%.2f, MontoSubDescuento=%.2f.',
          [QDetail.FieldByName('serie').AsString,
           DescPorcentajeReproducido,
           MontoDescFiscal]
        );
      end;
    end;

    Fields[0] := '1';
    Fields[1] := FormatAmount4(Cantidad);
    Fields[2] :=
      NullToStrTrim(QDetail.FieldByName('Descripcion'));
    Fields[3] := FormatAmount4(PrecioSalida);

    if AEsOperacionE44 then
      Fields[4] := '0.00'
    else
      Fields[4] := ResolveTasaDetalle(QDetail);

    Fields[5] :=
      NullToStrTrim(QDetail.FieldByName('Codigo'));

    Fields[6] :=
      ResolveUnidad(
        NullToStrTrim(QDetail.FieldByName('Unidad'))
      );

    if AEsOperacionE44 then
      Fields[7] := '4'
    else
      Fields[7] := IntToStr(Indicador);

    Fields[8] := FormatAmount(MontoLineaFuente);
    Fields[9] := FormatAmount(MontoDescFiscal);
    Fields[10] := FormatAmount(PorcDescItem);

    if AEsOperacionE44 then
      Fields[11] := '0.00'
    else
      Fields[11] := FormatAmount(MontoItbisDet);

    Line := JoinFields(Fields);
    Result.Add(Line);

    QDetail.Next;
  end;
end;

function TFacturaTxtBuilder.BuildAdjustmentLines(QMaster, QDetail: TIBQuery; const AEsOperacionE44: Boolean): TStringList;
const
  TOLERANCIA_FISCAL = 0.01;
var
  DescPorIndicador: array[1..4] of Currency;
  RecargoRawPorIndicador: array[1..4] of Currency;
  ItbisRecargoPorIndicador: array[1..4] of Currency;
  RecargoFiscalPorIndicador: array[1..4] of Currency;
  I, Indicador, IndicadorAjuste, IndMayor: Integer;
  DescHeader, RecargoHeader, MontoDesc, PorcDesc: Currency;
  RecargoRaw, ItbisRecargo, TotalDesc, TotalRecargoRaw: Currency;
  TotalItbisRecargo, TotalFiscalEsperado, TotalFiscalRedondeado: Currency;
  Residuo, MayorBase: Currency;
  PreciosIncluyenItbis, HayDescItemReal: Boolean;
  Fields: array[0..7] of string;

  procedure AddAjuste(const ATipo: string; const AIndicador: Integer;
    const AFuente, AFiscal: Currency; const ADescripcion: string);
  begin
    Fields[0] := '3';
    Fields[1] := ATipo;
    Fields[2] := IntToStr(AIndicador);
    Fields[3] := '$';
    Fields[4] := '0.00';
    Fields[5] := FormatAmount(AFuente);
    Fields[6] := FormatAmount(AFiscal);
    Fields[7] := ADescripcion;
    Result.Add(JoinFields(Fields));
  end;

begin
  Result := TStringList.Create;

  FillChar(DescPorIndicador, SizeOf(DescPorIndicador), 0);
  FillChar(RecargoRawPorIndicador, SizeOf(RecargoRawPorIndicador), 0);
  FillChar(ItbisRecargoPorIndicador, SizeOf(ItbisRecargoPorIndicador), 0);
  FillChar(RecargoFiscalPorIndicador, SizeOf(RecargoFiscalPorIndicador), 0);

  DescHeader := 0;
  RecargoHeader := 0;
  if not QMaster.FieldByName('Descuento').IsNull then
    DescHeader := RoundMoney2(QMaster.FieldByName('Descuento').AsCurrency);
  if not QMaster.FieldByName('RecargoBruto').IsNull then
    RecargoHeader := RoundMoney2(QMaster.FieldByName('RecargoBruto').AsCurrency);

  PreciosIncluyenItbis :=
    (not QMaster.FieldByName('INDICADOR_MONTO_GRAVADO').IsNull) and
    (QMaster.FieldByName('INDICADOR_MONTO_GRAVADO').AsInteger = 1);

  HayDescItemReal := False;
  TotalDesc := 0;
  TotalRecargoRaw := 0;
  TotalItbisRecargo := 0;

  QDetail.First;
  while not QDetail.Eof do
  begin
    if QDetail.FieldByName('IndicadorFacturacion').IsNull then
      Indicador := 1
    else
      Indicador := QDetail.FieldByName('IndicadorFacturacion').AsInteger;

    if (Indicador < 1) or (Indicador > 4) then
    begin
      Result.Free;
      raise EFacturaTxtBuilder.CreateFmt(
        'IndicadorFacturacion inválido en ajuste fiscal. Serie=%s, Indicador=%d.',
        [QDetail.FieldByName('serie').AsString, Indicador]
      );
    end;

    if AEsOperacionE44 then
      IndicadorAjuste := 4
    else
      IndicadorAjuste := Indicador;

    MontoDesc := QDetail.FieldByName('MontoDescItem').AsCurrency;
    PorcDesc := QDetail.FieldByName('PorcDescItem').AsCurrency;

    if (DescHeader > TOLERANCIA_FISCAL) and
       (MontoDesc > TOLERANCIA_FISCAL) and
       (PorcDesc > 0.0001) then
      HayDescItemReal := True;

    if DescHeader > TOLERANCIA_FISCAL then
      DescPorIndicador[IndicadorAjuste] :=
        DescPorIndicador[IndicadorAjuste] + MontoDesc;

    RecargoRaw := QDetail.FieldByName('MontoRecargoGlobalDistribuido').AsCurrency;
    ItbisRecargo := QDetail.FieldByName('ItbisRecargoGlobal').AsCurrency;

    if (RecargoRaw < 0) or (ItbisRecargo < 0) or
       (ItbisRecargo - RecargoRaw > TOLERANCIA_FISCAL) then
    begin
      Result.Free;
      raise EFacturaTxtBuilder.CreateFmt(
        'Recargo fiscal inválido en serie %s. Recargo=%.2f, ITBISRecargo=%.2f.',
        [QDetail.FieldByName('serie').AsString, RecargoRaw, ItbisRecargo]
      );
    end;

    RecargoRawPorIndicador[IndicadorAjuste] :=
      RecargoRawPorIndicador[IndicadorAjuste] + RecargoRaw;
    ItbisRecargoPorIndicador[IndicadorAjuste] :=
      ItbisRecargoPorIndicador[IndicadorAjuste] + ItbisRecargo;

    QDetail.Next;
  end;

  if HayDescItemReal then
  begin
    Result.Free;
    raise EFacturaTxtBuilder.Create(
      'PointSaleSoft reportó descuento global y descuento por ítem en la misma transacción.'
    );
  end;

  {
    E44/E34->E44: todos los ajustes globales se consolidan en indicador 4
    y MontoAjusteFiscal conserva exactamente el monto comercial persistido.
    No se descuenta ITBIS del recargo porque el e-CF viaja completamente exento.
  }
  if DescHeader > TOLERANCIA_FISCAL then
  begin
    for I := 1 to 4 do
      TotalDesc := TotalDesc + DescPorIndicador[I];
    TotalDesc := RoundMoney2(TotalDesc);

    if Abs(TotalDesc - DescHeader) > TOLERANCIA_FISCAL then
    begin
      Result.Free;
      raise EFacturaTxtBuilder.CreateFmt(
        'Distribución de descuento global inconsistente. Detalle=%.2f, Master=%.2f.',
        [TotalDesc, DescHeader]
      );
    end;

    for I := 1 to 4 do
      if DescPorIndicador[I] > 0.005 then
        AddAjuste('D', I, RoundMoney2(DescPorIndicador[I]),
          RoundMoney2(DescPorIndicador[I]), 'Descuento global');
  end;

  if RecargoHeader > TOLERANCIA_FISCAL then
  begin
    for I := 1 to 4 do
    begin
      TotalRecargoRaw := TotalRecargoRaw + RecargoRawPorIndicador[I];
      TotalItbisRecargo := TotalItbisRecargo + ItbisRecargoPorIndicador[I];
    end;

    TotalRecargoRaw := RoundMoney2(TotalRecargoRaw);
    TotalItbisRecargo := RoundMoney2(TotalItbisRecargo);

    if Abs(TotalRecargoRaw - RecargoHeader) > TOLERANCIA_FISCAL then
    begin
      Result.Free;
      raise EFacturaTxtBuilder.CreateFmt(
        'Distribución de recargo inconsistente. Detalle=%.2f, Master=%.2f.',
        [TotalRecargoRaw, RecargoHeader]
      );
    end;

    TotalFiscalRedondeado := 0;
    MayorBase := -1;
    IndMayor := 0;

    for I := 1 to 4 do
    begin
      if AEsOperacionE44 then
        RecargoFiscalPorIndicador[I] := RoundMoney2(
          RecargoRawPorIndicador[I])
      else if PreciosIncluyenItbis then
        RecargoFiscalPorIndicador[I] := RoundMoney2(
          RecargoRawPorIndicador[I] - ItbisRecargoPorIndicador[I])
      else
        RecargoFiscalPorIndicador[I] := RoundMoney2(
          RecargoRawPorIndicador[I]);

      if RecargoFiscalPorIndicador[I] < 0 then
      begin
        Result.Free;
        raise EFacturaTxtBuilder.CreateFmt(
          'Base de recargo negativa para IndicadorFacturacion=%d.', [I]
        );
      end;

      TotalFiscalRedondeado :=
        TotalFiscalRedondeado + RecargoFiscalPorIndicador[I];

      if RecargoRawPorIndicador[I] > MayorBase then
      begin
        MayorBase := RecargoRawPorIndicador[I];
        IndMayor := I;
      end;
    end;

    if AEsOperacionE44 then
      TotalFiscalEsperado := TotalRecargoRaw
    else if PreciosIncluyenItbis then
      TotalFiscalEsperado := RoundMoney2(TotalRecargoRaw - TotalItbisRecargo)
    else
      TotalFiscalEsperado := TotalRecargoRaw;

    TotalFiscalRedondeado := RoundMoney2(TotalFiscalRedondeado);
    Residuo := RoundMoney2(TotalFiscalEsperado - TotalFiscalRedondeado);

    if Abs(Residuo) > 0.01 then
    begin
      Result.Free;
      raise EFacturaTxtBuilder.CreateFmt(
        'Residuo inesperado al preparar recargo para ASLAN. Esperado=%.2f, ' +
        'Redondeado=%.2f, Residuo=%.2f.',
        [TotalFiscalEsperado, TotalFiscalRedondeado, Residuo]
      );
    end;

    if (IndMayor > 0) and (Abs(Residuo) > 0.0001) then
      RecargoFiscalPorIndicador[IndMayor] := RoundMoney2(
        RecargoFiscalPorIndicador[IndMayor] + Residuo);

    for I := 1 to 4 do
      if RecargoRawPorIndicador[I] > 0.005 then
        AddAjuste('R', I, RoundMoney2(RecargoRawPorIndicador[I]),
          RecargoFiscalPorIndicador[I], 'Recargo global');
  end;

  QDetail.First;
end;

function TFacturaTxtBuilder.BuildFiscalTotalsLine(QMaster: TIBQuery; const AEsOperacionE44: Boolean): string;
var
  Fields: array[0..6] of string;
  MontoTotal, TotalItbis, ItbisExonerado: Currency;
begin
  MontoTotal := RoundMoney2(QMaster.FieldByName('Monto_Venta').AsCurrency);
  TotalItbis := RoundMoney2(QMaster.FieldByName('TotalITBIS').AsCurrency);
  ItbisExonerado := RoundMoney2(QMaster.FieldByName('Monto_ITBISEXONERADO').AsCurrency);

  Fields[0] := '4';
  Fields[1] := FormatAmount(MontoTotal);

  if AEsOperacionE44 then
  begin
    Fields[2] := '';
    Fields[3] := '';
    Fields[4] := FormatAmount(MontoTotal);
    Fields[5] := '';
    Fields[6] := '';
  end
  else
  begin
    Fields[2] := FormatAmount(TotalItbis);
    if ItbisExonerado > 0.005 then
      Fields[3] := FormatAmount(ItbisExonerado)
    else
      Fields[3] := '';
    { Igual que la ruta Firebird directa: no inventamos MontoGravadoTotal,
      MontoExento ni MontoNoFacturable. El modelo/ASLAN los deriva del detalle. }
    Fields[4] := '';
    Fields[5] := '';
    Fields[6] := '';
  end;

  Result := JoinFields(Fields);
end;

function TFacturaTxtBuilder.GenerateFacturaTxt(const ANumeroTransaccion: Integer; const AOutputFile: string): TFacturaTxtBuildResult;
var
  StartedTx: Boolean;
  QMaster, QDetail, QPago, QPagoRef, QComentarios: TIBQuery;
  Header, FiscalTotals: string;
  Details, Adjustments: TStringList;
  Content: TStringList;
  NcfRef, TipoEcf, TipoRef: string;
  BuyerRnc, BuyerName, FechaVencSec: string;
  EsOperacionE44: Boolean;
  MotivoNota: Integer;
  DescGlobal, RecargoGlobal, PropinaGlobal: Currency;
  DetalleE44, TotalE44Esperado, TotalMaster: Currency;
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
  Adjustments := nil;
  Content := nil;
  try
    try
      QMaster := LoadMaster(ANumeroTransaccion);

      TipoEcf := GetTipoEcf(NullToStrTrim(QMaster.FieldByName('ClaveAcceso')));
      NcfRef := NullToStrTrim(QMaster.FieldByName('NCFReferencia'));
      TipoRef := GetTipoReferencia(NcfRef);

      if not ((TipoEcf = 'E31') or
              (TipoEcf = 'E32') or
              (TipoEcf = 'E44') or
              (TipoEcf = 'E45') or
              (TipoEcf = 'E34')) then
        raise EFacturaTxtBuilder.Create(
          'Factura.txt M1 solo soporta E31, E32, E44, E45 y E34. Tipo recibido: ' + TipoEcf
        );

      if TipoEcf = 'E34' then
      begin
        if NcfRef = '' then
          raise EFacturaTxtBuilder.Create('E34 requiere NCFReferencia.');

        if not ((TipoRef = 'E31') or
                (TipoRef = 'E32') or
                (TipoRef = 'E44') or
                (TipoRef = 'E45')) then
          raise EFacturaTxtBuilder.Create(
            'Factura.txt M1 solo soporta E34 contra E31, E32, E44 o E45. Referencia: ' + TipoRef
          );

        if QMaster.FieldByName('MOTIVO_NOTA').IsNull then
          raise EFacturaTxtBuilder.Create('E34 requiere IDDGII_MOTIVO_NCR.');

        MotivoNota := QMaster.FieldByName('MOTIVO_NOTA').AsInteger;
        if (MotivoNota < 1) or (MotivoNota > 5) then
          raise EFacturaTxtBuilder.CreateFmt(
            'IDDGII_MOTIVO_NCR invalido para E34: %d. Debe estar entre 1 y 5.',
            [MotivoNota]
          );
      end;

      {
        Alcance M1 de identificacion del comprador:
        E31, E44 y E45 requieren comprador identificado.
        E34 hereda ese requisito cuando modifica uno de esos tipos.
        E32 y E34->E32 pueden operar sin comprador identificado, sujeto a
        la validacion de monto de IdesiToolECF.
      }
      if (TipoEcf = 'E31') or
         (TipoEcf = 'E44') or
         (TipoEcf = 'E45') or
         ((TipoEcf = 'E34') and
          ((TipoRef = 'E31') or (TipoRef = 'E44') or (TipoRef = 'E45'))) then
      begin
        BuyerRnc := OnlyDigits(NullToStrTrim(QMaster.FieldByName('RNCDelComprador')));
        BuyerName := Trim(NullToStrTrim(QMaster.FieldByName('RazonSocialDelComprador')));

        if BuyerRnc = '' then
          raise EFacturaTxtBuilder.Create(
            TipoEcf + ' requiere RNC/Cedula del comprador para Factura.txt.'
          );

        if (BuyerName = '') or SameText(BuyerName, '***Generico***') then
          raise EFacturaTxtBuilder.Create(
            TipoEcf + ' requiere nombre/razon social real del comprador para Factura.txt.'
          );
      end;

if TipoEcf = 'E45' then
begin
  BuyerRnc := OnlyDigits(
    NullToStrTrim(
      QMaster.FieldByName('RNCDelComprador')
    )
  );

  if BuyerRnc = '' then
    raise EFacturaTxtBuilder.Create(
      'E45 requiere RNCComprador.'
    );

  if (Length(BuyerRnc) <> 9) and
     (Length(BuyerRnc) <> 11) then
    raise EFacturaTxtBuilder.Create(
      'E45 requiere un RNCComprador de 9 u 11 dígitos.'
    );
end;

      if (TipoEcf = 'E31') or (TipoEcf = 'E44') or (TipoEcf = 'E45') then
      begin
        FechaVencSec := DateFieldToTxt(QMaster.FieldByName('FechaVencimientoSecuencia'));
        if FechaVencSec = '' then
          raise EFacturaTxtBuilder.Create(
            TipoEcf + ' requiere FechaVencimientoSecuencia para Factura.txt.'
          );
      end;

      EsOperacionE44 := (TipoEcf = 'E44') or ((TipoEcf = 'E34') and (TipoRef = 'E44'));

      DescGlobal := 0;
      RecargoGlobal := 0;
      PropinaGlobal := 0;
      if not QMaster.FieldByName('Descuento').IsNull then
        DescGlobal := QMaster.FieldByName('Descuento').AsCurrency;
      if not QMaster.FieldByName('RecargoBruto').IsNull then
        RecargoGlobal := QMaster.FieldByName('RecargoBruto').AsCurrency;
      if not QMaster.FieldByName('Propina').IsNull then
        PropinaGlobal := QMaster.FieldByName('Propina').AsCurrency;

      QDetail := LoadDetail(ANumeroTransaccion);

      {
        E44 y E34->E44 se transportan como exentos.
        Los ajustes globales D/R viajan aparte como IndicadorFacturacion=4.
        Para no duplicarlos, la base del detalle retira únicamente ITBI_DET:

          VALOR_TOTAL_DET - ItbisBaseE44

        Antes de escribir el TXT verificamos contra el total persistido.
      }
      if EsOperacionE44 then
      begin
        DetalleE44 := 0;
        QDetail.First;
        while not QDetail.Eof do
        begin
          DetalleE44 := DetalleE44 +
            (QDetail.FieldByName('ValorTotalDet').AsCurrency -
             QDetail.FieldByName('ItbisBaseE44').AsCurrency);
          QDetail.Next;
        end;

        TotalE44Esperado :=
          DetalleE44 - DescGlobal + RecargoGlobal + PropinaGlobal;

        TotalMaster := QMaster.FieldByName('Monto_Venta').AsCurrency;

        if Abs(TotalE44Esperado - TotalMaster) > 0.02 then
          raise EFacturaTxtBuilder.CreateFmt(
            'E44/E34->E44 no cuadra para Factura.txt. DetalleExento=%.2f, ' +
            'Descuento=%.2f, Recargo=%.2f, Propina=%.2f, Esperado=%.2f, Master=%.2f.',
            [DetalleE44, DescGlobal, RecargoGlobal, PropinaGlobal,
             TotalE44Esperado, TotalMaster]
          );

        QDetail.First;
      end;

      QPago := LoadFormaPago(ANumeroTransaccion);

      if NcfRef <> '' then
        QPagoRef := LoadFormaPagoRef(NcfRef)
      else
      begin
        QPagoRef := CreateQuery(
          'select cast(null as varchar(10)) CondicionesReferencia, ' +
          'cast(null as varchar(10)) TipoPagoFiscal, ' +
          'cast(null as numeric(18,2)) MontoPagado, ' +
          'cast(null as date) FechaLimitePagoReferencia ' +
          'from RDB$DATABASE where 1=0'
        );
        QPagoRef.Open;
      end;

      QComentarios := LoadComentarios(ANumeroTransaccion);

      Header := BuildHeaderLine(QMaster, QPago, QPagoRef, QComentarios);
      Details := BuildDetailLines(QMaster,QDetail, EsOperacionE44, Abs(DescGlobal) > 0.0001);
      Adjustments := BuildAdjustmentLines(QMaster, QDetail, EsOperacionE44);
      FiscalTotals := BuildFiscalTotalsLine(QMaster, EsOperacionE44);

      if Trim(AOutputFile) = '' then
        raise EFacturaTxtBuilder.Create('La ruta de salida de Factura.txt es obligatoria.');

      Content := TStringList.Create;
      Content.Add(Header);
      Content.AddStrings(Details);
      Content.AddStrings(Adjustments);
      Content.Add(FiscalTotals);
      WriteUtf8NoBom(AOutputFile, Content.Text);

      Result.OutputFile := AOutputFile;
      Result.ENcf := NullToStrTrim(QMaster.FieldByName('ClaveAcceso'));
      Result.TipoEcf := TipoEcf;
      Result.DetailCount := Details.Count;

      if StartedTx then
        FTransaction.Rollback;
    except
      if StartedTx and FTransaction.InTransaction then
        FTransaction.Rollback;
      raise;
    end;
  finally
    Content.Free;
    Adjustments.Free;
    Details.Free;
    QComentarios.Free;
    QPagoRef.Free;
    QPago.Free;
    QDetail.Free;
    QMaster.Free;
  end;
end;

end.


