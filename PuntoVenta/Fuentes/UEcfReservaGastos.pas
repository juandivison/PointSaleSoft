unit UEcfReservaGastos;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBQuery;

type
  TReservaEcfGastoResult = record
    IdReserva: Integer;
    SerieNcfAsignado: Integer;
    TipoCF: string;
    Correlativo: Int64;
    ENCF: string;
    FechaVencimientoSecuencia: TDateTime;
    Estado: string;
    EsNueva: Boolean;
  end;

function ReservarOReutilizarEcfGasto(
  ADatabase: TIBDatabase;
  ATrn: Integer;
  ACodigoUsuario: Integer;
  const ASerie: string;
  const ADivNegocio: string;
  const APECF: string;
  const AAICF: string;
  const ATipoCF: string;
  out AReserva: TReservaEcfGastoResult;
  out AMensaje: string
): Boolean;

function ReasignarSecuenciaEcfGasto(
  ADatabase: TIBDatabase;
  ATrn: Integer;
  ACodigoUsuario: Integer;
  const ASerie: string;
  const ADivNegocio: string;
  const APECF: string;
  const AAICF: string;
  const ATipoCF: string;
  const AENCFRechazado: string;
  const AMotivo: string;
  out AReserva: TReservaEcfGastoResult;
  out AMensaje: string
): Boolean;

function ActualizarEstadoReservaEcfGasto(
  ADatabase: TIBDatabase;
  ACiaKey: Integer;
  ATrn: Integer;
  const ATipoCF: string;
  const AEstado: string;
  const AMensaje: string;
  const ACodigoSeguridad: string;
  AFechaFirma: TDateTime;
  AIncluirFechaFirma: Boolean;
  out AError: string
): Boolean;

implementation

uses
  Windows;

type
  EReservaEcfGasto = class(Exception);
  EReservaEcfGastoConcurrencia = class(EReservaEcfGasto);

  TGastoSnapshot = record
    CiaKey: Integer;
    CodigoProveedor: Integer;
    Fecha: TDateTime;
    Monto: Currency;
    TipoDoc: Integer;
    Documento: string;
    NombreProveedor: string;
    Direccion: string;
    Ciudad: string;
    EcfActual: string;
    IndicadorMontoGravado: Integer;
    TieneIndicadorMontoGravado: Boolean;
  end;

procedure LimpiarResultado(var AReserva: TReservaEcfGastoResult);
begin
  AReserva.IdReserva := 0;
  AReserva.SerieNcfAsignado := 0;
  AReserva.TipoCF := '';
  AReserva.Correlativo := 0;
  AReserva.ENCF := '';
  AReserva.FechaVencimientoSecuencia := 0;
  AReserva.Estado := '';
  AReserva.EsNueva := False;
end;

function NormalizarTipoCF(const ATipoCF: string): string;
begin
  Result := Trim(UpperCase(ATipoCF));
  if (Result <> '41') and (Result <> '43') then
    raise EReservaEcfGasto.Create(
      'El modulo e-CF de gastos solo admite los tipos 41 y 43.');
end;

function BuildReservaKey(ACiaKey, ATrn: Integer;
  const ATipoCF: string): string;
begin
  Result := Format(
    'GASTO|CIA=%d|TRN=%d|TIPO=%s',
    [ACiaKey, ATrn, NormalizarTipoCF(ATipoCF)]
  );

  if Length(Result) > 64 then
    raise EReservaEcfGasto.Create(
      'La llave de idempotencia del gasto excede 64 caracteres.');
end;

function BuildReservaHistoricaKey(
  const AHashDoc, AENCF: string
): string;
var
  Sufijo: string;
  Base: string;
begin
  Sufijo := '|OLD=' + Copy(UpperCase(Trim(AENCF)), 4, 10);
  Base := AHashDoc;

  if Length(Base) + Length(Sufijo) > 64 then
    Base := Copy(Base, 1, 64 - Length(Sufijo));

  Result := Base + Sufijo;
end;

function BuildENCF(const ATipoCF: string; ACorrelativo: Int64): string;
var
  S: string;
begin
  if (ACorrelativo <= 0) or (ACorrelativo > 9999999999) then
    raise EReservaEcfGasto.Create(
      'El correlativo e-NCF esta fuera del rango de diez digitos.');

  S := IntToStr(ACorrelativo);
  while Length(S) < 10 do
    S := '0' + S;

  Result := 'E' + NormalizarTipoCF(ATipoCF) + S;
end;

function EsENCFValido(const AENCF, ATipoCF: string): Boolean;
var
  I: Integer;
  Tipo: string;
  ENCF: string;
begin
  Result := False;
  Tipo := NormalizarTipoCF(ATipoCF);
  ENCF := UpperCase(Trim(AENCF));

  if Length(ENCF) <> 13 then
    Exit;

  if Copy(ENCF, 1, 3) <> 'E' + Tipo then
    Exit;

  for I := 4 to 13 do
    if not (ENCF[I] in ['0'..'9']) then
      Exit;

  Result := True;
end;

function EsErrorConcurrencia(const AMessage: string): Boolean;
var
  S: string;
begin
  S := UpperCase(AMessage);
  Result :=
    (Pos('DEADLOCK', S) > 0) or
    (Pos('LOCK CONFLICT', S) > 0) or
    (Pos('UPDATE CONFLICT', S) > 0) or
    (Pos('CONCURRENT TRANSACTION', S) > 0) or
    (Pos('PRIMARY OR UNIQUE KEY', S) > 0) or
    (Pos('DUPLICATE VALUE', S) > 0);
end;

procedure ConfigurarTransaccion(ATransaction: TIBTransaction;
  ADatabase: TIBDatabase);
begin
  ATransaction.DefaultDatabase := ADatabase;
  ATransaction.Params.Clear;
  ATransaction.Params.Add('read_committed');
  ATransaction.Params.Add('rec_version');
  ATransaction.Params.Add('wait');
  ATransaction.Params.Add('write');
end;

procedure ConfigurarQuery(AQuery: TIBQuery; ADatabase: TIBDatabase;
  ATransaction: TIBTransaction);
begin
  AQuery.Database := ADatabase;
  AQuery.Transaction := ATransaction;
end;

procedure CargarGasto(AQuery: TIBQuery; ATrn: Integer;
  out AGasto: TGastoSnapshot);
begin
  AQuery.Close;
  AQuery.SQL.Text :=
    'SELECT ' +
    '  COALESCE(m.CIA_KEY, 0) AS CIA_KEY, ' +
    '  m.COD_PROVEEDOR, m.FECHA, COALESCE(m.MONTO, 0) AS MONTO, ' +
    '  COALESCE(m.ECF, '''') AS ECF_ACTUAL, ' +
    '  m.IND_MONTO_GRAVADO, ' +
    '  COALESCE(p.TIPODOC, 0) AS TIPODOC, ' +
    '  COALESCE(p.RNC_PROVEEDOR, '''') AS DOCUMENTO, ' +
    '  COALESCE(NULLIF(TRIM(p.DESCRIPCION), ''''), p.NOMBRE_ABR, '''') AS NOMBRE_PROVEEDOR, ' +
    '  COALESCE(p.CALYYNUM, '''') AS DIRECCION, ' +
    '  COALESCE(p.CIUDAD, '''') AS CIUDAD ' +
    'FROM TRANS_OPERACION_MASTER m ' +
    'LEFT JOIN PROVEEDORES p ON p.CODIGO_CTE = m.COD_PROVEEDOR ' +
    'WHERE m.NUMERO = :TRN';
  AQuery.ParamByName('TRN').AsInteger := ATrn;
  AQuery.Open;

  if AQuery.IsEmpty then
    raise EReservaEcfGasto.CreateFmt(
      'No existe la operacion de gastos numero %d.', [ATrn]);

  AGasto.CiaKey := AQuery.FieldByName('CIA_KEY').AsInteger;
  AGasto.CodigoProveedor := AQuery.FieldByName('COD_PROVEEDOR').AsInteger;
  AGasto.Fecha := AQuery.FieldByName('FECHA').AsDateTime;
  AGasto.Monto := AQuery.FieldByName('MONTO').AsCurrency;
  AGasto.TipoDoc := AQuery.FieldByName('TIPODOC').AsInteger;
  AGasto.Documento := Trim(AQuery.FieldByName('DOCUMENTO').AsString);
  AGasto.NombreProveedor := Trim(AQuery.FieldByName('NOMBRE_PROVEEDOR').AsString);
  AGasto.Direccion := Trim(AQuery.FieldByName('DIRECCION').AsString);
  AGasto.Ciudad := Trim(AQuery.FieldByName('CIUDAD').AsString);
  AGasto.EcfActual := Trim(AQuery.FieldByName('ECF_ACTUAL').AsString);
  AGasto.TieneIndicadorMontoGravado :=
    not AQuery.FieldByName('IND_MONTO_GRAVADO').IsNull;
  if AGasto.TieneIndicadorMontoGravado then
    AGasto.IndicadorMontoGravado :=
      AQuery.FieldByName('IND_MONTO_GRAVADO').AsInteger
  else
    AGasto.IndicadorMontoGravado := 0;
end;

procedure ValidarGastoParaReserva(const AGasto: TGastoSnapshot;
  const ATipoCF: string);
begin
  if AGasto.CiaKey <= 0 then
    raise EReservaEcfGasto.Create('La operacion de gastos no tiene CIA_KEY valido.');

  {
    E41 requiere identificar al proveedor real.
    E43 permite COD_PROVEEDOR=0 porque el comprador no forma parte
    del XML y el proveedor interno es opcional.
  }
  if (NormalizarTipoCF(ATipoCF) = '41') and
     (AGasto.CodigoProveedor <= 0) then
    raise EReservaEcfGasto.Create(
      'Debe seleccionar un proveedor antes de reservar un E41.');

  if AGasto.Fecha <= 0 then
    raise EReservaEcfGasto.Create('La fecha de la operacion de gastos no es valida.');

  if AGasto.Monto < 0 then
    raise EReservaEcfGasto.Create('El monto pagado al proveedor no puede ser negativo.');

  if NormalizarTipoCF(ATipoCF) = '41' then
  begin
    if not (AGasto.TipoDoc in [1, 2, 3]) then
      raise EReservaEcfGasto.Create(
        'E41 requiere TipoDoc 1-RNC, 2-Cedula o 3-Otro/Pasaporte.');

    if AGasto.Documento = '' then
      raise EReservaEcfGasto.Create(
        'E41 requiere el numero de identificacion del proveedor.');

    if AGasto.NombreProveedor = '' then
      raise EReservaEcfGasto.Create(
        'E41 requiere el nombre o razon social del proveedor.');
  end;

  if (AGasto.EcfActual <> '') and
     (not EsENCFValido(AGasto.EcfActual, ATipoCF)) then
    raise EReservaEcfGasto.CreateFmt(
      'La operacion ya tiene asignado el e-NCF %s, que no corresponde al tipo E%s.',
      [AGasto.EcfActual, NormalizarTipoCF(ATipoCF)]
    );
end;


procedure ValidarDetallesParaReserva(AQuery: TIBQuery;
  ATrn: Integer; const ATipoCF: string; const AGasto: TGastoSnapshot);
var
  TipoCF: string;
  SerieLinea: string;
  IndicadorFacturacion: Integer;
  IndicadorBienServicio: Integer;
  MontoItbis: Currency;
  MontoItbisRetenido: Currency;
  MontoIsrRetenido: Currency;
  TieneLineasGravadas: Boolean;
begin
  TipoCF := NormalizarTipoCF(ATipoCF);
  TieneLineasGravadas := False;

  AQuery.Close;
  AQuery.SQL.Text :=
    'SELECT d.SERIE, d.CANTIDAD, d.PRECIO, d.IND_BIEN_SERVICIO, ' +
    '       COALESCE(d.MONTO_ITBIS, 0) AS MONTO_ITBIS, ' +
    '       COALESCE(d.MONTO_ITBIS_RETENIDO, 0) AS MONTO_ITBIS_RETENIDO, ' +
    '       COALESCE(d.MONTO_ISR_RETENIDO, 0) AS MONTO_ISR_RETENIDO, ' +
    '       t.IDITBISECF AS INDICADOR_FACTURACION ' +
    'FROM TRANS_OPERACION_DET d ' +
    'LEFT JOIN TASA_ITBIS t ON t.IDTASAITBIS = d.IDTASAITBIS ' +
    'WHERE d.NUMERO = :TRN ' +
    '  AND COALESCE(d.STATUS, ''A'') <> ''C'' ' +
    'ORDER BY d.SERIE';
  AQuery.ParamByName('TRN').AsInteger := ATrn;
  AQuery.Open;

  if AQuery.IsEmpty then
    raise EReservaEcfGasto.Create(
      'Debe registrar al menos una linea de detalle antes de reservar el e-NCF.');

  while not AQuery.Eof do
  begin
    SerieLinea := AQuery.FieldByName('SERIE').AsString;

    if AQuery.FieldByName('CANTIDAD').IsNull or
       (AQuery.FieldByName('CANTIDAD').AsFloat <= 0) then
      raise EReservaEcfGasto.CreateFmt(
        'La linea %s debe tener una cantidad mayor que cero.', [SerieLinea]);

    if AQuery.FieldByName('PRECIO').IsNull or
       (AQuery.FieldByName('PRECIO').AsFloat < 0) then
      raise EReservaEcfGasto.CreateFmt(
        'La linea %s tiene un precio invalido.', [SerieLinea]);

    if AQuery.FieldByName('IND_BIEN_SERVICIO').IsNull then
      raise EReservaEcfGasto.CreateFmt(
        'Debe indicar Bien o Servicio en la linea %s.', [SerieLinea]);

    IndicadorBienServicio :=
      AQuery.FieldByName('IND_BIEN_SERVICIO').AsInteger;
    if not (IndicadorBienServicio in [1, 2]) then
      raise EReservaEcfGasto.CreateFmt(
        'Bien/Servicio invalido en la linea %s.', [SerieLinea]);

    if AQuery.FieldByName('INDICADOR_FACTURACION').IsNull then
      raise EReservaEcfGasto.CreateFmt(
        'La tasa ITBIS de la linea %s no tiene IDITBISECF configurado.',
        [SerieLinea]);

    IndicadorFacturacion :=
      AQuery.FieldByName('INDICADOR_FACTURACION').AsInteger;
    MontoItbis := AQuery.FieldByName('MONTO_ITBIS').AsCurrency;
    MontoItbisRetenido :=
      AQuery.FieldByName('MONTO_ITBIS_RETENIDO').AsCurrency;
    MontoIsrRetenido :=
      AQuery.FieldByName('MONTO_ISR_RETENIDO').AsCurrency;

    if (MontoItbisRetenido < 0) or (MontoIsrRetenido < 0) then
      raise EReservaEcfGasto.CreateFmt(
        'Las retenciones de la linea %s no pueden ser negativas.',
        [SerieLinea]);

    if (MontoIsrRetenido > 0) and (IndicadorBienServicio <> 2) then
      raise EReservaEcfGasto.CreateFmt(
        'La retencion ISR de la linea %s solo corresponde a servicios.',
        [SerieLinea]);

    if TipoCF = '43' then
    begin
      if IndicadorFacturacion <> 4 then
        raise EReservaEcfGasto.CreateFmt(
          'E43 exige IndicadorFacturacion=4 (Exento) en la linea %s.',
          [SerieLinea]);

      if (Abs(MontoItbis) > 0.005) or
         (Abs(MontoItbisRetenido) > 0.005) or
         (Abs(MontoIsrRetenido) > 0.005) then
        raise EReservaEcfGasto.CreateFmt(
          'E43 no permite ITBIS ni retenciones en la linea %s.',
          [SerieLinea]);
    end
    else
    begin
      if not (IndicadorFacturacion in [1, 2, 3, 4]) then
        raise EReservaEcfGasto.CreateFmt(
          'IndicadorFacturacion invalido para E41 en la linea %s.',
          [SerieLinea]);

      if IndicadorFacturacion in [1, 2] then
        TieneLineasGravadas := True;
    end;

    AQuery.Next;
  end;

  if TipoCF = '41' then
  begin
    if TieneLineasGravadas then
    begin
      if not AGasto.TieneIndicadorMontoGravado then
        raise EReservaEcfGasto.Create(
          'E41 con lineas gravadas requiere indicar si el precio incluye ITBIS.');

      if not (AGasto.IndicadorMontoGravado in [0, 1]) then
        raise EReservaEcfGasto.Create(
          'IND_MONTO_GRAVADO debe ser 0-No incluye o 1-Incluye.');
    end;
  end
  else if AGasto.TieneIndicadorMontoGravado then
    raise EReservaEcfGasto.Create(
      'IND_MONTO_GRAVADO no corresponde para E43; debe permanecer nulo.');
end;

procedure CargarConfiguracionSerie(AQuery: TIBQuery;
  const ASerie, ADivNegocio, APECF, AAICF, ATipoCF: string;
  out ACorrelativoActual: Int64;
  out AFechaVence: TDateTime);
begin
  AQuery.Close;
  AQuery.SQL.Text :=
    'SELECT FIRST 1 NCF, FECHA_VENCE ' +
    'FROM DGII_SERIE_NFC ' +
    'WHERE SERIE = :SERIE ' +
    '  AND DIV_NEGOCIO = :DIV_NEGOCIO ' +
    '  AND PECF = :PECF ' +
    '  AND AICF = :AICF ' +
    '  AND TIPO_CF = :TIPO_CF ' +
    '  AND ACTIVO = 1 ' +
    'ORDER BY NCF DESC';
  AQuery.ParamByName('SERIE').AsString := Trim(ASerie);
  AQuery.ParamByName('DIV_NEGOCIO').AsString := Trim(ADivNegocio);
  AQuery.ParamByName('PECF').AsString := Trim(APECF);
  AQuery.ParamByName('AICF').AsString := Trim(AAICF);
  AQuery.ParamByName('TIPO_CF').AsString := NormalizarTipoCF(ATipoCF);
  AQuery.Open;

  if AQuery.IsEmpty then
    raise EReservaEcfGasto.CreateFmt(
      'No existe una secuencia activa en DGII_SERIE_NFC para el tipo E%s.',
      [NormalizarTipoCF(ATipoCF)]
    );

  ACorrelativoActual := Trunc(AQuery.FieldByName('NCF').AsFloat);

  if AQuery.FieldByName('FECHA_VENCE').IsNull then
    raise EReservaEcfGasto.CreateFmt(
      'La secuencia E%s no tiene FECHA_VENCE configurada.',
      [NormalizarTipoCF(ATipoCF)]
    );

  AFechaVence := AQuery.FieldByName('FECHA_VENCE').AsDateTime;
end;

procedure ValidarVencimientoSerie(AFechaEmision, AFechaVence: TDateTime;
  const ATipoCF: string);
begin
  if Trunc(AFechaVence) <= Trunc(Date) then
    raise EReservaEcfGasto.CreateFmt(
      'La secuencia E%s esta vencida o vence hoy (%s).',
      [NormalizarTipoCF(ATipoCF), DateToStr(AFechaVence)]
    );

  if Trunc(AFechaVence) <= Trunc(AFechaEmision) then
    raise EReservaEcfGasto.CreateFmt(
      'FECHA_VENCE de E%s debe ser mayor que la fecha de emision.',
      [NormalizarTipoCF(ATipoCF)]
    );
end;

function BuscarReservaExistente(AQuery: TIBQuery;
  const AHashDoc, ATipoCF: string;
  out AReserva: TReservaEcfGastoResult): Boolean;
begin
  AQuery.Close;
  AQuery.SQL.Text :=
    'SELECT FIRST 1 ID, TIPO_CF, CORRELATIVO, NCF, ESTADO ' +
    'FROM ECF_RESERVA ' +
    'WHERE HASH_DOC = :HASH_DOC';
  AQuery.ParamByName('HASH_DOC').AsString := AHashDoc;
  AQuery.Open;

  Result := not AQuery.IsEmpty;
  if not Result then
    Exit;

  AReserva.IdReserva := AQuery.FieldByName('ID').AsInteger;
  AReserva.TipoCF := IntToStr(AQuery.FieldByName('TIPO_CF').AsInteger);
  AReserva.Correlativo := Trunc(AQuery.FieldByName('CORRELATIVO').AsFloat);
  AReserva.ENCF := Trim(AQuery.FieldByName('NCF').AsString);
  AReserva.Estado := Trim(AQuery.FieldByName('ESTADO').AsString);
  AReserva.EsNueva := False;

  if AReserva.TipoCF <> NormalizarTipoCF(ATipoCF) then
    raise EReservaEcfGasto.Create(
      'La reserva existente tiene un tipo de e-CF diferente.');

  if not EsENCFValido(AReserva.ENCF, ATipoCF) then
    raise EReservaEcfGasto.Create(
      'La reserva existente contiene un e-NCF invalido.');
end;

function GenerarIdReservaGasto(AQuery: TIBQuery): Integer;
var
  Secuencia: Integer;
begin
  AQuery.Close;
  AQuery.SQL.Text :=
    'SELECT GEN_ID(ECF_RESERVA_GEN, 1) AS ID ' +
    'FROM RDB$DATABASE';
  AQuery.Open;
  Secuencia := AQuery.FieldByName('ID').AsInteger;

  if Secuencia <= 0 then
    raise EReservaEcfGasto.Create(
      'ECF_RESERVA_GEN no devolvio un valor valido.');

  {
    ECF_RESERVA comparte una sola PK entre INGRESOS y GASTOS.
    Ambos modulos consumen ECF_RESERVA_GEN, por lo que Firebird
    garantiza un ID positivo y unico sin codificar el origen en el signo.
  }
  Result := Secuencia;
end;

function GenerarSerieNcfAsignado(AQuery: TIBQuery): Integer;
begin
  AQuery.Close;
  AQuery.SQL.Text :=
    'SELECT GEN_ID(GEN_SERIE_NCF_ASIG, 1) AS SERIE ' +
    'FROM RDB$DATABASE';
  AQuery.Open;
  Result := AQuery.FieldByName('SERIE').AsInteger;

  if Result <= 0 then
    raise EReservaEcfGasto.Create(
      'GEN_SERIE_NCF_ASIG no devolvio una serie valida.');
end;

function ENCFExisteLocal(AQuery: TIBQuery; const AENCF: string): Boolean;
begin
  Result := False;

  AQuery.Close;
  AQuery.SQL.Text :=
    'SELECT FIRST 1 NCF ' +
    'FROM ECF_RESERVA ' +
    'WHERE NCF = :ENCF';
  AQuery.ParamByName('ENCF').AsString := UpperCase(Trim(AENCF));
  AQuery.Open;
  if not AQuery.IsEmpty then
  begin
    Result := True;
    Exit;
  end;

  AQuery.Close;
  AQuery.SQL.Text :=
    'SELECT FIRST 1 SERIE ' +
    'FROM NCF_ASIGNADOS_COMPRA ' +
    'WHERE ECF = :ENCF_ECF OR NUMERO_NCF = :ENCF_NUMERO';
  AQuery.ParamByName('ENCF_ECF').AsString := UpperCase(Trim(AENCF));
  AQuery.ParamByName('ENCF_NUMERO').AsString := UpperCase(Trim(AENCF));
  AQuery.Open;
  Result := not AQuery.IsEmpty;
end;

function SiguienteCorrelativoLibreLocal(
  AQuery: TIBQuery;
  const ATipoCF: string;
  ACorrelativoActual: Int64
): Int64;
var
  Intentos: Integer;
  Candidato: Int64;
  ENCF: string;
begin
  Candidato := ACorrelativoActual + 1;
  Intentos := 0;

  while Intentos < 1000 do
  begin
    ENCF := BuildENCF(ATipoCF, Candidato);
    if not ENCFExisteLocal(AQuery, ENCF) then
    begin
      Result := Candidato;
      Exit;
    end;

    Inc(Candidato);
    Inc(Intentos);
  end;

  raise EReservaEcfGasto.Create(
    'No fue posible localizar una secuencia e-NCF libre en el rango local.');
end;

procedure RetirarReservaPorSecuenciaUsada(
  AQuery: TIBQuery;
  const AHashDoc, AENCF, AMotivo: string
);
var
  HashHistorico: string;
begin
  HashHistorico := BuildReservaHistoricaKey(AHashDoc, AENCF);

  AQuery.Close;
  AQuery.SQL.Text :=
    'UPDATE ECF_RESERVA SET ' +
    '  HASH_DOC = :HASH_HISTORICO, ' +
    '  ESTADO = ''SECUENCIA_USADA'', ' +
    '  MENSAJE = :MENSAJE, ' +
    '  UPDATED_AT = CURRENT_TIMESTAMP ' +
    'WHERE HASH_DOC = :HASH_DOC ' +
    '  AND NCF = :ENCF ' +
    '  AND COALESCE(ESTADO, '''') <> ''ACEPTADO''';
  AQuery.ParamByName('HASH_HISTORICO').AsString := HashHistorico;
  AQuery.ParamByName('MENSAJE').AsString :=
    Copy('Secuencia descartada por ASLAN/DGII. ' + Trim(AMotivo), 1, 1024);
  AQuery.ParamByName('HASH_DOC').AsString := AHashDoc;
  AQuery.ParamByName('ENCF').AsString := UpperCase(Trim(AENCF));
  AQuery.ExecSQL;

  if AQuery.RowsAffected <> 1 then
    raise EReservaEcfGasto.Create(
      'No fue posible retirar la reserva rechazada por secuencia utilizada.');
end;

procedure IncrementarSecuencia(AQuery: TIBQuery;
  const ASerie, ADivNegocio, APECF, AAICF, ATipoCF: string;
  ACorrelativoAnterior, ANuevoCorrelativo: Int64);
begin
  AQuery.Close;
  AQuery.SQL.Text :=
    'UPDATE DGII_SERIE_NFC SET ' +
    '  NCF = :NUEVO_NCF, ' +
    '  FECHA_UPD = CURRENT_TIMESTAMP ' +
    'WHERE SERIE = :SERIE ' +
    '  AND DIV_NEGOCIO = :DIV_NEGOCIO ' +
    '  AND PECF = :PECF ' +
    '  AND AICF = :AICF ' +
    '  AND TIPO_CF = :TIPO_CF ' +
    '  AND ACTIVO = 1 ' +
    '  AND NCF = :NCF_ANTERIOR';
  AQuery.ParamByName('NUEVO_NCF').AsFloat := ANuevoCorrelativo;
  AQuery.ParamByName('SERIE').AsString := Trim(ASerie);
  AQuery.ParamByName('DIV_NEGOCIO').AsString := Trim(ADivNegocio);
  AQuery.ParamByName('PECF').AsString := Trim(APECF);
  AQuery.ParamByName('AICF').AsString := Trim(AAICF);
  AQuery.ParamByName('TIPO_CF').AsString := NormalizarTipoCF(ATipoCF);
  AQuery.ParamByName('NCF_ANTERIOR').AsFloat := ACorrelativoAnterior;
  AQuery.ExecSQL;

  if AQuery.RowsAffected <> 1 then
    raise EReservaEcfGastoConcurrencia.Create(
      'La secuencia fue modificada por otra transaccion. Se reintentara.');
end;

procedure InsertarReserva(AQuery: TIBQuery;
  AIdReserva: Integer;
  const AHashDoc, ATipoCF, AENCF: string;
  ACorrelativo: Int64);
begin
  AQuery.Close;
  AQuery.SQL.Text :=
    'INSERT INTO ECF_RESERVA ' +
    '  (ID, HASH_DOC, SERIE, TIPO_CF, CORRELATIVO, NCF, ESTADO, MENSAJE, CREATED_AT) ' +
    'VALUES ' +
    '  (:ID, :HASH_DOC, :SERIE, :TIPO_CF, :CORRELATIVO, :NCF, :ESTADO, :MENSAJE, CURRENT_TIMESTAMP)';
  AQuery.ParamByName('ID').AsInteger := AIdReserva;
  AQuery.ParamByName('HASH_DOC').AsString := AHashDoc;
  AQuery.ParamByName('SERIE').AsString := 'E';
  AQuery.ParamByName('TIPO_CF').AsInteger := StrToInt(NormalizarTipoCF(ATipoCF));
  AQuery.ParamByName('CORRELATIVO').AsFloat := ACorrelativo;
  AQuery.ParamByName('NCF').AsString := AENCF;
  AQuery.ParamByName('ESTADO').AsString := 'RESERVADO';
  AQuery.ParamByName('MENSAJE').AsString :=
    'Reserva creada por el modulo e-CF de gastos.';
  AQuery.ExecSQL;
end;

function BuscarSerieNcfAsignado(AQuery: TIBQuery;
  const AENCF: string): Integer;
begin
  AQuery.Close;
  AQuery.SQL.Text :=
    'SELECT FIRST 1 SERIE ' +
    'FROM NCF_ASIGNADOS_COMPRA ' +
    'WHERE ECF = :ENCF_ECF OR NUMERO_NCF = :ENCF_NUMERO ' +
    'ORDER BY SERIE DESC';
  AQuery.ParamByName('ENCF_ECF').AsString := AENCF;
  AQuery.ParamByName('ENCF_NUMERO').AsString := AENCF;
  AQuery.Open;

  if AQuery.IsEmpty then
    Result := 0
  else
    Result := AQuery.FieldByName('SERIE').AsInteger;
end;

function InsertarOReutilizarNcfAsignado(AQuery: TIBQuery;
  const AGasto: TGastoSnapshot;
  const ATipoCF, AENCF: string;
  ACodigoUsuario: Integer): Integer;
begin
  Result := BuscarSerieNcfAsignado(AQuery, AENCF);
  if Result > 0 then
    Exit;

  Result := GenerarSerieNcfAsignado(AQuery);

  AQuery.Close;
  AQuery.SQL.Text :=
    'INSERT INTO NCF_ASIGNADOS_COMPRA ' +
    '  (SERIE, TIPO_NCF, NUMERO_NCF, FECHA, CODIGO_CTE, NOMBRE_COMPLETO, ' +
    '   CEDULA, DIRECCION, CIUDAD, MONTO, STATUS, CODIGO_USUARIO, ' +
    '   FECHA_INSERT, ECF) ' +
    'VALUES ' +
    '  (:SERIE, :TIPO_NCF, :NUMERO_NCF, :FECHA, :CODIGO_CTE, :NOMBRE_COMPLETO, ' +
    '   :CEDULA, :DIRECCION, :CIUDAD, :MONTO, :STATUS, :CODIGO_USUARIO, ' +
    '   CURRENT_TIMESTAMP, :ECF)';
  AQuery.ParamByName('SERIE').AsInteger := Result;
  AQuery.ParamByName('TIPO_NCF').AsString := NormalizarTipoCF(ATipoCF);
  AQuery.ParamByName('NUMERO_NCF').AsString := AENCF;
  AQuery.ParamByName('FECHA').AsDateTime := AGasto.Fecha;
  AQuery.ParamByName('CODIGO_CTE').AsInteger := AGasto.CodigoProveedor;
  AQuery.ParamByName('NOMBRE_COMPLETO').AsString := Copy(AGasto.NombreProveedor, 1, 80);
  AQuery.ParamByName('CEDULA').AsString := Copy(AGasto.Documento, 1, 20);
  AQuery.ParamByName('DIRECCION').AsString := Copy(AGasto.Direccion, 1, 80);
  AQuery.ParamByName('CIUDAD').AsString := Copy(AGasto.Ciudad, 1, 40);
  AQuery.ParamByName('MONTO').AsCurrency := AGasto.Monto;
  AQuery.ParamByName('STATUS').AsString := 'A';
  AQuery.ParamByName('CODIGO_USUARIO').AsInteger := ACodigoUsuario;
  AQuery.ParamByName('ECF').AsString := AENCF;
  AQuery.ExecSQL;
end;

procedure ActualizarMaestroGasto(AQuery: TIBQuery;
  ATrn, ASerieNcfAsignado: Integer;
  const ATipoCF, AENCF: string);
begin
  AQuery.Close;
  AQuery.SQL.Text :=
    'UPDATE TRANS_OPERACION_MASTER SET ' +
    '  TIPO_CF = :TIPO_CF, ' +
    '  ECF = :ECF, ' +
    '  SERIE_NCF_ASIGNADO = :SERIE_NCF_ASIGNADO, ' +
    '  FECHA_MOD = CURRENT_TIMESTAMP ' +
    'WHERE NUMERO = :TRN';
  AQuery.ParamByName('TIPO_CF').AsString := NormalizarTipoCF(ATipoCF);
  AQuery.ParamByName('ECF').AsString := AENCF;
  AQuery.ParamByName('SERIE_NCF_ASIGNADO').AsInteger := ASerieNcfAsignado;
  AQuery.ParamByName('TRN').AsInteger := ATrn;
  AQuery.ExecSQL;

  if AQuery.RowsAffected <> 1 then
    raise EReservaEcfGasto.Create(
      'No fue posible vincular el e-NCF con TRANS_OPERACION_MASTER.');
end;

function ReservarEnTransaccion(
  ADatabase: TIBDatabase;
  ATransaction: TIBTransaction;
  ATrn: Integer;
  ACodigoUsuario: Integer;
  const ASerie, ADivNegocio, APECF, AAICF, ATipoCF: string;
  out AReserva: TReservaEcfGastoResult
): Boolean;
var
  Q: TIBQuery;
  Gasto: TGastoSnapshot;
  HashDoc: string;
  CorrelativoActual: Int64;
  NuevoCorrelativo: Int64;
  FechaVence: TDateTime;
  IdReserva: Integer;
  SerieAsignada: Integer;
  ENCF: string;
begin
  Result := False;
  Q := TIBQuery.Create(nil);
  try
    ConfigurarQuery(Q, ADatabase, ATransaction);

    CargarGasto(Q, ATrn, Gasto);
    ValidarGastoParaReserva(Gasto, ATipoCF);
    ValidarDetallesParaReserva(Q, ATrn, ATipoCF, Gasto);
    HashDoc := BuildReservaKey(Gasto.CiaKey, ATrn, ATipoCF);

    CargarConfiguracionSerie(
      Q, ASerie, ADivNegocio, APECF, AAICF, ATipoCF,
      CorrelativoActual, FechaVence
    );
    ValidarVencimientoSerie(Gasto.Fecha, FechaVence, ATipoCF);

    if BuscarReservaExistente(Q, HashDoc, ATipoCF, AReserva) then
    begin
      SerieAsignada := InsertarOReutilizarNcfAsignado(
        Q, Gasto, ATipoCF, AReserva.ENCF, ACodigoUsuario
      );
      ActualizarMaestroGasto(Q, ATrn, SerieAsignada, ATipoCF, AReserva.ENCF);

      AReserva.SerieNcfAsignado := SerieAsignada;
      AReserva.FechaVencimientoSecuencia := FechaVence;
      Result := True;
      Exit;
    end;

    NuevoCorrelativo := SiguienteCorrelativoLibreLocal(
      Q, ATipoCF, CorrelativoActual
    );
    ENCF := BuildENCF(ATipoCF, NuevoCorrelativo);

    IncrementarSecuencia(
      Q, ASerie, ADivNegocio, APECF, AAICF, ATipoCF,
      CorrelativoActual, NuevoCorrelativo
    );

    IdReserva := GenerarIdReservaGasto(Q);
    InsertarReserva(Q, IdReserva, HashDoc, ATipoCF, ENCF, NuevoCorrelativo);

    SerieAsignada := InsertarOReutilizarNcfAsignado(
      Q, Gasto, ATipoCF, ENCF, ACodigoUsuario
    );
    ActualizarMaestroGasto(Q, ATrn, SerieAsignada, ATipoCF, ENCF);

    AReserva.IdReserva := IdReserva;
    AReserva.SerieNcfAsignado := SerieAsignada;
    AReserva.TipoCF := NormalizarTipoCF(ATipoCF);
    AReserva.Correlativo := NuevoCorrelativo;
    AReserva.ENCF := ENCF;
    AReserva.FechaVencimientoSecuencia := FechaVence;
    AReserva.Estado := 'RESERVADO';
    AReserva.EsNueva := True;

    Result := True;
  finally
    Q.Free;
  end;
end;

function ReasignarEnTransaccion(
  ADatabase: TIBDatabase;
  ATransaction: TIBTransaction;
  ATrn: Integer;
  ACodigoUsuario: Integer;
  const ASerie, ADivNegocio, APECF, AAICF, ATipoCF: string;
  const AENCFRechazado, AMotivo: string;
  out AReserva: TReservaEcfGastoResult
): Boolean;
var
  Q: TIBQuery;
  Gasto: TGastoSnapshot;
  HashDoc: string;
  CorrelativoActual: Int64;
  NuevoCorrelativo: Int64;
  FechaVence: TDateTime;
  IdReserva: Integer;
  SerieAsignada: Integer;
  NuevoENCF: string;
  ENCFActivo: string;
  EstadoActivo: string;
begin
  Result := False;
  Q := TIBQuery.Create(nil);
  try
    ConfigurarQuery(Q, ADatabase, ATransaction);

    CargarGasto(Q, ATrn, Gasto);
    ValidarGastoParaReserva(Gasto, ATipoCF);
    ValidarDetallesParaReserva(Q, ATrn, ATipoCF, Gasto);

    if not EsENCFValido(AENCFRechazado, ATipoCF) then
      raise EReservaEcfGasto.Create(
        'El e-NCF rechazado no es valido para reasignar la secuencia.');

    HashDoc := BuildReservaKey(Gasto.CiaKey, ATrn, ATipoCF);

    Q.Close;
    Q.SQL.Text :=
      'SELECT FIRST 1 NCF, ESTADO ' +
      'FROM ECF_RESERVA ' +
      'WHERE HASH_DOC = :HASH_DOC';
    Q.ParamByName('HASH_DOC').AsString := HashDoc;
    Q.Open;

    if Q.IsEmpty then
      raise EReservaEcfGasto.Create(
        'No se encontro la reserva activa que debe ser reemplazada.');

    ENCFActivo := UpperCase(Trim(Q.FieldByName('NCF').AsString));
    EstadoActivo := UpperCase(Trim(Q.FieldByName('ESTADO').AsString));

    if ENCFActivo <> UpperCase(Trim(AENCFRechazado)) then
      raise EReservaEcfGasto.CreateFmt(
        'La reserva activa cambio. Esperado %s y encontrado %s.',
        [UpperCase(Trim(AENCFRechazado)), ENCFActivo]
      );

    if EstadoActivo = 'ACEPTADO' then
      raise EReservaEcfGasto.Create(
        'No se puede reasignar una secuencia cuyo documento ya fue aceptado.');

    RetirarReservaPorSecuenciaUsada(
      Q, HashDoc, AENCFRechazado, AMotivo
    );

    CargarConfiguracionSerie(
      Q, ASerie, ADivNegocio, APECF, AAICF, ATipoCF,
      CorrelativoActual, FechaVence
    );
    ValidarVencimientoSerie(Gasto.Fecha, FechaVence, ATipoCF);

    NuevoCorrelativo := SiguienteCorrelativoLibreLocal(
      Q, ATipoCF, CorrelativoActual
    );
    NuevoENCF := BuildENCF(ATipoCF, NuevoCorrelativo);

    IncrementarSecuencia(
      Q, ASerie, ADivNegocio, APECF, AAICF, ATipoCF,
      CorrelativoActual, NuevoCorrelativo
    );

    IdReserva := GenerarIdReservaGasto(Q);
    InsertarReserva(
      Q, IdReserva, HashDoc, ATipoCF, NuevoENCF, NuevoCorrelativo
    );

    SerieAsignada := InsertarOReutilizarNcfAsignado(
      Q, Gasto, ATipoCF, NuevoENCF, ACodigoUsuario
    );
    ActualizarMaestroGasto(
      Q, ATrn, SerieAsignada, ATipoCF, NuevoENCF
    );

    AReserva.IdReserva := IdReserva;
    AReserva.SerieNcfAsignado := SerieAsignada;
    AReserva.TipoCF := NormalizarTipoCF(ATipoCF);
    AReserva.Correlativo := NuevoCorrelativo;
    AReserva.ENCF := NuevoENCF;
    AReserva.FechaVencimientoSecuencia := FechaVence;
    AReserva.Estado := 'RESERVADO';
    AReserva.EsNueva := True;

    Result := True;
  finally
    Q.Free;
  end;
end;

function ReservarOReutilizarEcfGasto(
  ADatabase: TIBDatabase;
  ATrn: Integer;
  ACodigoUsuario: Integer;
  const ASerie: string;
  const ADivNegocio: string;
  const APECF: string;
  const AAICF: string;
  const ATipoCF: string;
  out AReserva: TReservaEcfGastoResult;
  out AMensaje: string
): Boolean;
var
  Tr: TIBTransaction;
  Intento: Integer;
  UltimoError: string;
begin
  Result := False;
  AMensaje := '';
  UltimoError := '';
  LimpiarResultado(AReserva);

  if ADatabase = nil then
  begin
    AMensaje := 'No se recibio una conexion Firebird valida.';
    Exit;
  end;

  if not ADatabase.Connected then
  begin
    AMensaje := 'La conexion Firebird no esta activa.';
    Exit;
  end;

  if ATrn <= 0 then
  begin
    AMensaje := 'El numero de operacion de gastos no es valido.';
    Exit;
  end;

  for Intento := 1 to 3 do
  begin
    Tr := TIBTransaction.Create(nil);
    try
      ConfigurarTransaccion(Tr, ADatabase);
      Tr.StartTransaction;
      try
        if ReservarEnTransaccion(
             ADatabase,
             Tr,
             ATrn,
             ACodigoUsuario,
             ASerie,
             ADivNegocio,
             APECF,
             AAICF,
             ATipoCF,
             AReserva
           ) then
        begin
          Tr.Commit;
          if AReserva.EsNueva then
            AMensaje := 'e-NCF reservado: ' + AReserva.ENCF
          else
            AMensaje := 'Se reutilizo la reserva existente: ' + AReserva.ENCF;
          Result := True;
          Exit;
        end;
      except
        on E: Exception do
        begin
          UltimoError := E.Message;
          if Tr.InTransaction then
            Tr.Rollback;

          if (Intento < 3) and
             (EsErrorConcurrencia(E.Message) or
              (E is EReservaEcfGastoConcurrencia)) then
          begin
            Sleep(100 * Intento);
          end
          else
          begin
            AMensaje := E.Message;
            Exit;
          end;
        end;
      end;
    finally
      if Tr.InTransaction then
        Tr.Rollback;
      Tr.Free;
    end;
  end;

  AMensaje := UltimoError;
end;

function ReasignarSecuenciaEcfGasto(
  ADatabase: TIBDatabase;
  ATrn: Integer;
  ACodigoUsuario: Integer;
  const ASerie: string;
  const ADivNegocio: string;
  const APECF: string;
  const AAICF: string;
  const ATipoCF: string;
  const AENCFRechazado: string;
  const AMotivo: string;
  out AReserva: TReservaEcfGastoResult;
  out AMensaje: string
): Boolean;
var
  Tr: TIBTransaction;
  Intento: Integer;
  UltimoError: string;
begin
  Result := False;
  AMensaje := '';
  UltimoError := '';
  LimpiarResultado(AReserva);

  if ADatabase = nil then
  begin
    AMensaje := 'No se recibio una conexion Firebird valida.';
    Exit;
  end;

  if not ADatabase.Connected then
  begin
    AMensaje := 'La conexion Firebird no esta activa.';
    Exit;
  end;

  if ATrn <= 0 then
  begin
    AMensaje := 'El numero de operacion de gastos no es valido.';
    Exit;
  end;

  for Intento := 1 to 3 do
  begin
    Tr := TIBTransaction.Create(nil);
    try
      ConfigurarTransaccion(Tr, ADatabase);
      Tr.StartTransaction;
      try
        if ReasignarEnTransaccion(
             ADatabase,
             Tr,
             ATrn,
             ACodigoUsuario,
             ASerie,
             ADivNegocio,
             APECF,
             AAICF,
             ATipoCF,
             AENCFRechazado,
             AMotivo,
             AReserva
           ) then
        begin
          Tr.Commit;
          AMensaje :=
            'La secuencia ' + UpperCase(Trim(AENCFRechazado)) +
            ' fue descartada y se asigno ' + AReserva.ENCF + '.';
          Result := True;
          Exit;
        end;
      except
        on E: Exception do
        begin
          UltimoError := E.Message;
          if Tr.InTransaction then
            Tr.Rollback;

          if (Intento < 3) and
             (EsErrorConcurrencia(E.Message) or
              (E is EReservaEcfGastoConcurrencia)) then
            Sleep(100 * Intento)
          else
          begin
            AMensaje := E.Message;
            Exit;
          end;
        end;
      end;
    finally
      if Tr.InTransaction then
        Tr.Rollback;
      Tr.Free;
    end;
  end;

  AMensaje := UltimoError;
end;

function ActualizarEstadoReservaEcfGasto(
  ADatabase: TIBDatabase;
  ACiaKey: Integer;
  ATrn: Integer;
  const ATipoCF: string;
  const AEstado: string;
  const AMensaje: string;
  const ACodigoSeguridad: string;
  AFechaFirma: TDateTime;
  AIncluirFechaFirma: Boolean;
  out AError: string
): Boolean;
var
  Tr: TIBTransaction;
  Q: TIBQuery;
  HashDoc: string;
begin
  Result := False;
  AError := '';
  Tr := nil;
  Q := nil;

  try
    if ADatabase = nil then
      raise EReservaEcfGasto.Create('No se recibio una conexion Firebird valida.');

    HashDoc := BuildReservaKey(ACiaKey, ATrn, ATipoCF);

    Tr := TIBTransaction.Create(nil);
    ConfigurarTransaccion(Tr, ADatabase);
    Tr.StartTransaction;

    Q := TIBQuery.Create(nil);
    ConfigurarQuery(Q, ADatabase, Tr);
    Q.SQL.Text :=
      'UPDATE ECF_RESERVA SET ' +
      '  ESTADO = :ESTADO, ' +
      '  MENSAJE = :MENSAJE, ' +
      '  UPDATED_AT = CURRENT_TIMESTAMP, ' +
      '  CODIGO_SEGURIDAD = :CODIGO_SEGURIDAD, ' +
      '  FECHA_FIRMA = :FECHA_FIRMA ' +
      'WHERE HASH_DOC = :HASH_DOC';
    Q.ParamByName('ESTADO').AsString := Copy(Trim(AEstado), 1, 32);
    Q.ParamByName('MENSAJE').AsString := Copy(AMensaje, 1, 1024);

    if Trim(ACodigoSeguridad) = '' then
      Q.ParamByName('CODIGO_SEGURIDAD').Clear
    else
      Q.ParamByName('CODIGO_SEGURIDAD').AsString :=
        Copy(Trim(ACodigoSeguridad), 1, 64);

    if AIncluirFechaFirma then
      Q.ParamByName('FECHA_FIRMA').AsDateTime := AFechaFirma
    else
      Q.ParamByName('FECHA_FIRMA').Clear;

    Q.ParamByName('HASH_DOC').AsString := HashDoc;
    Q.ExecSQL;

    if Q.RowsAffected <> 1 then
      raise EReservaEcfGasto.Create(
        'No se encontro la reserva e-CF del gasto para actualizar su estado.');

    Tr.Commit;
    Result := True;
  except
    on E: Exception do
    begin
      AError := E.Message;
      if (Tr <> nil) and Tr.InTransaction then
        Tr.Rollback;
      Result := False;
    end;
  end;

  Q.Free;
  Tr.Free;
end;

end.
