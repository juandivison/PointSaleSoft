unit UEcfEnvioGastos;

interface

uses
  SysUtils, IBDatabase, UUtilecfGastos;

function ProcesarEnvioEcfGasto(
  ADatabase: TIBDatabase;
  const AExePath: string;
  ATrn: Integer;
  out AResultado: TGastoEcfCliResult;
  out AMensaje: string;
  ADescargarXml:Boolean=True
): Boolean;

function ResultadoRequiereReasignacionSecuencia(
  const AResultado: TGastoEcfCliResult;
  const AMensajeProceso: string
): Boolean;

function ResultadoEsRechazadoConTrackId(
  const AResultado: TGastoEcfCliResult
): Boolean;

function ResultadoEsRechazadoSinTrackId(
  const AResultado: TGastoEcfCliResult
): Boolean;

procedure RegistrarLogEcfGasto(
  const AContexto: string;
  const AMensaje: string
);

procedure PersistirResultadoEcfGasto(ADatabase: TIBDatabase; ATrn, ACiaKey: Integer;
  const ATipoCF, AENCF: string; const AResultado: TGastoEcfCliResult);

implementation

uses
  IBQuery, Classes;

procedure LimpiarResultado(var AResultado: TGastoEcfCliResult);
begin
  AResultado.Estado := '';
  AResultado.Mensaje := '';
  AResultado.TrackId := '';
  AResultado.ENCF := '';
  AResultado.ExitCode := Cardinal(-1);
  AResultado.TieneTimbre := False;
  AResultado.Timbre.CodigoSeguridad := '';
  AResultado.Timbre.ENCF := '';
  AResultado.Timbre.FechaEmision := 0;
  AResultado.Timbre.TieneFechaEmision := False;
  AResultado.Timbre.FechaFirma := 0;
  AResultado.Timbre.TieneFechaFirma := False;
  AResultado.Timbre.MontoTotal := 0;
  AResultado.Timbre.TieneMontoTotal := False;
  AResultado.Timbre.UrlImage := '';
  AResultado.Timbre.XmlFirmado := '';
  AResultado.SalidaCompleta := '';
end;


type
  EEnvioEcfGasto = class(Exception);

  TGastoEnvioSnapshot = record
    CiaKey: Integer;
    TipoCF: string;
    ENCF: string;
  end;

function IntentarDirectorioLog(const ADir: string): Boolean;
begin
  Result := False;

  try
    if Trim(ADir) = '' then
      Exit;

    if DirectoryExists(ADir) then
    begin
      Result := True;
      Exit;
    end;

    Result := ForceDirectories(ADir);
  except
    Result := False;
  end;
end;

function ResolverDirectorioLogEcfGasto: string;
var
  DirPrimario: string;
  DirAplicacion: string;
  DirTemporal: string;
  TempBase: string;
begin
  DirPrimario :=
    IncludeTrailingPathDelimiter('C:\Electronico') +
    'logs\gastos';

  if IntentarDirectorioLog(DirPrimario) then
  begin
    Result := IncludeTrailingPathDelimiter(DirPrimario);
    Exit;
  end;

  DirAplicacion :=
    IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) +
    'logs\gastos';

  if IntentarDirectorioLog(DirAplicacion) then
  begin
    Result := IncludeTrailingPathDelimiter(DirAplicacion);
    Exit;
  end;

  TempBase := GetEnvironmentVariable('TEMP');
  if Trim(TempBase) = '' then
    TempBase := GetEnvironmentVariable('TMP');

  if Trim(TempBase) <> '' then
  begin
    DirTemporal :=
      IncludeTrailingPathDelimiter(TempBase) +
      'PointSaleSoft\logs\gastos';

    if IntentarDirectorioLog(DirTemporal) then
    begin
      Result := IncludeTrailingPathDelimiter(DirTemporal);
      Exit;
    end;
  end;

  Result := '';
end;

function RecortarLog(const ATexto: string): string;
const
  MAX_LOG_TEXT = 30000;
begin
  Result := ATexto;

  if Length(Result) > MAX_LOG_TEXT then
    Result :=
      Copy(Result, 1, MAX_LOG_TEXT) +
      #13#10 +
      '[LOG TRUNCADO A ' + IntToStr(MAX_LOG_TEXT) + ' CARACTERES]';
end;

procedure RegistrarLogEcfGasto(
  const AContexto: string;
  const AMensaje: string
);
var
  DirLog: string;
  Archivo: string;
  Linea: string;
  Stream: TFileStream;
begin
  {
    Este log NO depende de GlbEsDebugFiscal ni de DEBUG.
    Debe existir también en producción.

    Ruta primaria:
      C:\Electronico\logs\gastos\ecf_gastos_YYYYMMDD.log

    Si no existe permiso sobre C:\Electronico:
      <carpeta exe>\logs\gastos\...
      %TEMP%\PointSaleSoft\logs\gastos\...
  }
  try
    DirLog := ResolverDirectorioLogEcfGasto;
    if DirLog = '' then
      Exit;

    Archivo :=
      DirLog +
      'ecf_gastos_' +
      FormatDateTime('yyyymmdd', Date) +
      '.log';

    Linea :=
      FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now) +
      ' | ' + Trim(AContexto) + ' | ' +
      RecortarLog(AMensaje) +
      #13#10;

    if FileExists(Archivo) then
      Stream := TFileStream.Create(
        Archivo,
        fmOpenReadWrite or fmShareDenyNone)
    else
      Stream := TFileStream.Create(
        Archivo,
        fmCreate or fmShareDenyNone);

    try
      Stream.Seek(0, soFromEnd);
      if Length(Linea) > 0 then
        Stream.WriteBuffer(Linea[1], Length(Linea));
    finally
      Stream.Free;
    end;
  except
    {
      El logger nunca puede tumbar facturación.
      Si fallan las tres rutas, simplemente se continúa.
    }
  end;
end;

procedure ConfigurarTransaccion(
  ATransaction: TIBTransaction;
  ADatabase: TIBDatabase
);
begin
  ATransaction.DefaultDatabase := ADatabase;
  ATransaction.Params.Clear;
  ATransaction.Params.Add('read_committed');
  ATransaction.Params.Add('rec_version');
  ATransaction.Params.Add('wait');
  ATransaction.Params.Add('write');
end;

procedure ConfigurarQuery(
  AQuery: TIBQuery;
  ADatabase: TIBDatabase;
  ATransaction: TIBTransaction
);
begin
  AQuery.Database := ADatabase;
  AQuery.Transaction := ATransaction;
end;

function BuildReservaKey(
  ACiaKey, ATrn: Integer;
  const ATipoCF: string
): string;
begin
  Result := Format(
    'GASTO|CIA=%d|TRN=%d|TIPO=%s',
    [ACiaKey, ATrn, Trim(ATipoCF)]
  );
end;

function EsMensajeSecuenciaUtilizada(const ATexto: string): Boolean;
var
  S: string;
begin
  S := UpperCase(Trim(ATexto));
  Result :=
    (Pos('SECUENCIA YA HA SIDO UTILIZAD', S) > 0) or
    (Pos('NUMERO DE SECUENCIA YA HA SIDO UTILIZAD', S) > 0) or
    (Pos('NÚMERO DE SECUENCIA YA HA SIDO UTILIZAD', S) > 0);
end;

function ResultadoRequiereReasignacionSecuencia(
  const AResultado: TGastoEcfCliResult;
  const AMensajeProceso: string
): Boolean;
var
  Estado: string;
begin
  Estado := UpperCase(Trim(AResultado.Estado));
  if (Estado <> 'RECHAZADO') and (Estado <> 'SECUENCIA_USADA') then
  begin
    Result := False;
    Exit;
  end;

  Result :=
    (Estado = 'SECUENCIA_USADA') or
    EsMensajeSecuenciaUtilizada(AResultado.Mensaje) or
    EsMensajeSecuenciaUtilizada(AMensajeProceso) or
    EsMensajeSecuenciaUtilizada(AResultado.SalidaCompleta);
end;

function ResultadoEsRechazadoConTrackId(
  const AResultado: TGastoEcfCliResult
): Boolean;
begin
  Result :=
    (UpperCase(Trim(AResultado.Estado)) = 'RECHAZADO') and
    (Trim(AResultado.TrackId) <> '');
end;

function ResultadoEsRechazadoSinTrackId(
  const AResultado: TGastoEcfCliResult
): Boolean;
begin
  Result :=
    (UpperCase(Trim(AResultado.Estado)) = 'RECHAZADO') and
    (Trim(AResultado.TrackId) = '');
end;

function EstadoNormalizado(const AEstado: string): string;
var S: string;
begin
  S := UpperCase(Trim(AEstado));
  if (S = 'ACEPTADO') or (S = 'ACEPTADO CONDICIONAL') then Result := 'ACEPTADO'
  else if (S = 'IN_PROCESS') or (S = 'EN PROCESO') or (S = 'PENDIENTE') then Result := 'IN_PROCESS'
  else if (S = 'SECUENCIA_USADA') or (S = 'RECH_LOCAL') or
          (S = 'RECHAZADO') or (S = 'NOT_FOUND') or (S = 'NO_CONFIRMADO') or
          (S = 'ERROR') then Result := S
  else Result := 'NO_CONFIRMADO';
end;

function MensajeCompletoParaPersistir(
  const AResultado: TGastoEcfCliResult
): string;
var
  Publico: string;
  Completo: string;
begin
  Publico := Trim(AResultado.Mensaje);
  Completo := Trim(AResultado.SalidaCompleta);

  if Completo = '' then
  begin
    Result := Publico;
    Exit;
  end;

  if (Publico <> '') and
     (Pos(UpperCase(Publico), UpperCase(Completo)) = 0) then
    Result := Publico + #13#10 + Completo
  else
    Result := Completo;
end;


{ Obtiene la longitud real del campo MENSAJE en Firebird }
function MaxCaracteresMensaje(
  ADatabase: TIBDatabase;
  ATransaction: TIBTransaction;
  const ATabla: string): Integer;
var
  Meta: TIBQuery;
  TipoCampo: Integer;
begin
  Meta := TIBQuery.Create(nil);
  try
    ConfigurarQuery(Meta, ADatabase, ATransaction);

    Meta.SQL.Text :=
      'SELECT F.RDB$FIELD_TYPE AS TIPO_CAMPO, ' +
      '       F.RDB$CHARACTER_LENGTH AS MAX_CARACTERES ' +
      'FROM RDB$RELATION_FIELDS RF ' +
      'JOIN RDB$FIELDS F ' +
      '  ON F.RDB$FIELD_NAME = RF.RDB$FIELD_SOURCE ' +
      'WHERE RF.RDB$RELATION_NAME = :TABLA ' +
      '  AND RF.RDB$FIELD_NAME = ''MENSAJE''';

    Meta.ParamByName('TABLA').AsString :=
      UpperCase(Trim(ATabla));

    Meta.Open;

    if Meta.IsEmpty then
      raise EEnvioEcfGasto.CreateFmt(
        'No se encuentra metadata de %s.MENSAJE.',
        [ATabla]);

    TipoCampo := Meta.FieldByName('TIPO_CAMPO').AsInteger;

    if (TipoCampo = 14) or (TipoCampo = 37) then
    begin
      if Meta.FieldByName('MAX_CARACTERES').IsNull then
        raise EEnvioEcfGasto.CreateFmt(
          'Longitud no disponible para %s.MENSAJE.',
          [ATabla]);

      Result :=
        Meta.FieldByName('MAX_CARACTERES').AsInteger;

      if Result <= 0 then
        raise EEnvioEcfGasto.CreateFmt(
          'Longitud invalida para %s.MENSAJE.',
          [ATabla]);

      if Result > 1024 then
        Result := 1024;
    end
    else if TipoCampo = 261 then
      Result := 1024
    else
      raise EEnvioEcfGasto.CreateFmt(
        'Tipo no soportado en %s.MENSAJE (%d).',
        [ATabla, TipoCampo]);
  finally
    Meta.Free;
  end;
end;

{ Ajusta el mensaje a la capacidad real de la columna }
function MensajeParaCampo(
  const ATexto, ATabla: string;
  const AMaxCaracteres: Integer): string;
const
  MARCA_LOG = ' [ver log GASTOS]';
begin
  if Length(ATexto) <= AMaxCaracteres then
  begin
    Result := ATexto;
    Exit;
  end;

  if AMaxCaracteres > Length(MARCA_LOG) then
    Result :=
      Copy(ATexto, 1,
        AMaxCaracteres - Length(MARCA_LOG)) +
      MARCA_LOG
  else
    Result := Copy(ATexto, 1, AMaxCaracteres);

  RegistrarLogEcfGasto(
    'MENSAJE_RESUMIDO',
    'Tabla=' + ATabla +
    ' Original=' + IntToStr(Length(ATexto)) +
    ' Guardado=' + IntToStr(Length(Result))
  );
end;


procedure CargarSnapshot(
  ADatabase: TIBDatabase;
  ATrn: Integer;
  out ASnapshot: TGastoEnvioSnapshot
);
var
  Tr: TIBTransaction;
  Q: TIBQuery;
begin
  Tr := TIBTransaction.Create(nil);
  Q := TIBQuery.Create(nil);
  try
    ConfigurarTransaccion(Tr, ADatabase);
    Tr.StartTransaction;
    ConfigurarQuery(Q, ADatabase, Tr);

    Q.SQL.Text :=
      'SELECT COALESCE(CIA_KEY, 0) AS CIA_KEY, ' +
      '       COALESCE(TIPO_CF, '''') AS TIPO_CF, ' +
      '       COALESCE(ECF, '''') AS ECF ' +
      'FROM TRANS_OPERACION_MASTER ' +
      'WHERE NUMERO = :TRN';
    Q.ParamByName('TRN').AsInteger := ATrn;
    Q.Open;

    if Q.IsEmpty then
      raise EEnvioEcfGasto.CreateFmt(
        'No existe la operacion de gastos numero %d.',
        [ATrn]
      );

    ASnapshot.CiaKey := Q.FieldByName('CIA_KEY').AsInteger;
    ASnapshot.TipoCF := Trim(Q.FieldByName('TIPO_CF').AsString);
    ASnapshot.ENCF := UpperCase(Trim(Q.FieldByName('ECF').AsString));

    Tr.Commit;

    RegistrarLogEcfGasto(
      'PERSISTIR_OK',
      'TRN=' + IntToStr(ATrn) +
      ' Estado=' + //Estado +
      ' ENCF=' + ASnapshot.ENCF +
      ' TrackId=' //+ Trim(AResultado.TrackId)
    );
  finally
    if Tr.InTransaction then
      Tr.Rollback;
    Q.Free;
    Tr.Free;
  end;

  if ASnapshot.CiaKey <= 0 then
    raise EEnvioEcfGasto.Create('La operacion no tiene CIA_KEY valido.');

  if (ASnapshot.TipoCF <> '41') and (ASnapshot.TipoCF <> '43') then
    raise EEnvioEcfGasto.Create(
      'La operacion debe tener asignado un tipo e-CF 41 o 43.'
    );

  if Length(ASnapshot.ENCF) <> 13 then
    raise EEnvioEcfGasto.Create(
      'La operacion no tiene un e-NCF reservado valido.'
    );

  if Copy(ASnapshot.ENCF, 1, 3) <> 'E' + ASnapshot.TipoCF then
    raise EEnvioEcfGasto.Create(
      'El e-NCF reservado no coincide con el tipo de comprobante.'
    );
end;

procedure PersistirResultado(
  ADatabase: TIBDatabase;
  ATrn: Integer;
  const ASnapshot: TGastoEnvioSnapshot;
  const AResultado: TGastoEcfCliResult
);
var
  Tr: TIBTransaction;
  Q: TIBQuery;
  Estado: string;
  HashDoc: string;
  ENCFResultado: string;
  IdEnvio: Integer;
  MensajePersistir: string;
begin
  Estado := EstadoNormalizado(AResultado.Estado);
  MensajePersistir := MensajeCompletoParaPersistir(AResultado);

  RegistrarLogEcfGasto(
    'PERSISTIR_INICIO',
    'TRN=' + IntToStr(ATrn) +
    ' Estado=' + Estado +
    ' ENCF=' + ASnapshot.ENCF +
    ' TrackId=' + Trim(AResultado.TrackId) +
    #13#10 + MensajePersistir
  );

  HashDoc := BuildReservaKey(
    ASnapshot.CiaKey,
    ATrn,
    ASnapshot.TipoCF
  );

  ENCFResultado := UpperCase(Trim(AResultado.ENCF));
  if ENCFResultado = '' then
    ENCFResultado := ASnapshot.ENCF;

  if ENCFResultado <> ASnapshot.ENCF then
    raise EEnvioEcfGasto.CreateFmt(
      'ASLAN/DGII devolvio el e-NCF %s, distinto al reservado %s.',
      [ENCFResultado, ASnapshot.ENCF]
    );

  Tr := TIBTransaction.Create(nil);
  Q := TIBQuery.Create(nil);
  try
    ConfigurarTransaccion(Tr, ADatabase);
    Tr.StartTransaction;
    ConfigurarQuery(Q, ADatabase, Tr);

    { La reserva compartida solo se actualiza por HASH_DOC de GASTOS. }
    Q.SQL.Text :=
      'UPDATE ECF_RESERVA SET ' +
      '  ESTADO = CASE ' +
      '    WHEN ESTADO = ''ACEPTADO'' THEN ESTADO ' +
      '    ELSE CAST(:ESTADO_NUEVO AS VARCHAR(32)) END, ' +
      '  MENSAJE = CASE ' +
      '    WHEN ESTADO = ''ACEPTADO'' AND :PRESERVAR_ACEPTADO = 1 THEN MENSAJE ' +
      '    ELSE :MENSAJE END, ' +
      '  UPDATED_AT = CURRENT_TIMESTAMP, ' +
      '  CODIGO_SEGURIDAD = COALESCE(:CODIGO_SEGURIDAD, CODIGO_SEGURIDAD), ' +
      '  FECHA_FIRMA = COALESCE(:FECHA_FIRMA, FECHA_FIRMA) ' +
      'WHERE HASH_DOC = :HASH_DOC ' +
      '  AND NCF = :NCF';
    Q.ParamByName('ESTADO_NUEVO').AsString := Copy(Estado, 1, 32);
    Q.ParamByName('PRESERVAR_ACEPTADO').AsInteger :=
      Ord(Estado <> 'ACEPTADO');
    
    Q.ParamByName('MENSAJE').AsString :=
    MensajeParaCampo(
      MensajePersistir,
      'ECF_RESERVA',
      MaxCaracteresMensaje(
        ADatabase, Tr, 'ECF_RESERVA')
    );


    if AResultado.TieneTimbre and
       (Trim(AResultado.Timbre.CodigoSeguridad) <> '') then
      Q.ParamByName('CODIGO_SEGURIDAD').AsString :=
        Copy(Trim(AResultado.Timbre.CodigoSeguridad), 1, 64)
    else
      Q.ParamByName('CODIGO_SEGURIDAD').Clear;

    if AResultado.TieneTimbre and
       AResultado.Timbre.TieneFechaFirma then
      Q.ParamByName('FECHA_FIRMA').AsDateTime :=
        AResultado.Timbre.FechaFirma
    else
      Q.ParamByName('FECHA_FIRMA').Clear;

    Q.ParamByName('HASH_DOC').AsString := HashDoc;
    Q.ParamByName('NCF').AsString := ASnapshot.ENCF;
    Q.ExecSQL;

    if Q.RowsAffected <> 1 then
      raise EEnvioEcfGasto.Create(
        'No se encontro la reserva ECF_RESERVA correspondiente al gasto.'
      );

    { Primero actualizar el historial independiente del modulo de gastos. }
    Q.Close;
    Q.SQL.Text :=
      'UPDATE ECF_GASTO_ENVIO SET ' +
      '  ESTADO = CASE ' +
      '    WHEN ESTADO = ''ACEPTADO'' THEN ESTADO ' +
      '    ELSE CAST(:ESTADO_NUEVO AS VARCHAR(32)) END, ' +
      '  TRACK_ID = COALESCE(:TRACK_ID, TRACK_ID), ' +
      '  MENSAJE = CASE ' +
      '    WHEN ESTADO = ''ACEPTADO'' AND :PRESERVAR_ACEPTADO = 1 THEN MENSAJE ' +
      '    ELSE :MENSAJE END, ' +
      '  INTENTOS = COALESCE(INTENTOS, 0) + 1, ' +
      '  CODIGO_SEGURIDAD = COALESCE(:CODIGO_SEGURIDAD, CODIGO_SEGURIDAD), ' +
      '  FECHA_EMISION = COALESCE(:FECHA_EMISION, FECHA_EMISION), ' +
      '  FECHA_FIRMA = COALESCE(:FECHA_FIRMA, FECHA_FIRMA), ' +
      '  MONTO_TOTAL = COALESCE(:MONTO_TOTAL, MONTO_TOTAL), ' +
      '  URL_IMAGE = COALESCE(:URL_IMAGE, URL_IMAGE), ' +
      '  XML_FIRMADO = COALESCE(:XML_FIRMADO, XML_FIRMADO), ' +
      '  FECHA_UPDATE = CURRENT_TIMESTAMP ' +
      'WHERE CIA_KEY = :CIA_KEY AND ENCF = :ENCF';
    Q.ParamByName('ESTADO_NUEVO').AsString := Copy(Estado, 1, 32);
    Q.ParamByName('PRESERVAR_ACEPTADO').AsInteger :=
      Ord(Estado <> 'ACEPTADO');

    if Trim(AResultado.TrackId) = '' then
      Q.ParamByName('TRACK_ID').Clear
    else
      Q.ParamByName('TRACK_ID').AsString :=
        Copy(Trim(AResultado.TrackId), 1, 100);

    
    Q.ParamByName('MENSAJE').AsString :=
    MensajeParaCampo(
      MensajePersistir,
      'ECF_GASTO_ENVIO',
      MaxCaracteresMensaje(
        ADatabase, Tr, 'ECF_GASTO_ENVIO')
    );


    if AResultado.TieneTimbre and
       (Trim(AResultado.Timbre.CodigoSeguridad) <> '') then
      Q.ParamByName('CODIGO_SEGURIDAD').AsString :=
        Copy(Trim(AResultado.Timbre.CodigoSeguridad), 1, 64)
    else
      Q.ParamByName('CODIGO_SEGURIDAD').Clear;

    if AResultado.TieneTimbre and
       AResultado.Timbre.TieneFechaEmision then
      Q.ParamByName('FECHA_EMISION').AsDateTime :=
        AResultado.Timbre.FechaEmision
    else
      Q.ParamByName('FECHA_EMISION').Clear;

    if AResultado.TieneTimbre and
       AResultado.Timbre.TieneFechaFirma then
      Q.ParamByName('FECHA_FIRMA').AsDateTime :=
        AResultado.Timbre.FechaFirma
    else
      Q.ParamByName('FECHA_FIRMA').Clear;

    if AResultado.TieneTimbre and
       AResultado.Timbre.TieneMontoTotal then
      Q.ParamByName('MONTO_TOTAL').AsCurrency :=
        AResultado.Timbre.MontoTotal
    else
      Q.ParamByName('MONTO_TOTAL').Clear;

    if AResultado.TieneTimbre and
       (Trim(AResultado.Timbre.UrlImage) <> '') then
      Q.ParamByName('URL_IMAGE').AsString :=
        Copy(Trim(AResultado.Timbre.UrlImage), 1, 1024)
    else
      Q.ParamByName('URL_IMAGE').Clear;

    if AResultado.TieneTimbre and
       (Trim(AResultado.Timbre.XmlFirmado) <> '') then
      Q.ParamByName('XML_FIRMADO').AsString :=
        Copy(Trim(AResultado.Timbre.XmlFirmado), 1, 1024)
    else
      Q.ParamByName('XML_FIRMADO').Clear;

    Q.ParamByName('CIA_KEY').AsInteger := ASnapshot.CiaKey;
    Q.ParamByName('ENCF').AsString := ASnapshot.ENCF;
    Q.ExecSQL;

    if Q.RowsAffected = 0 then
    begin
      Q.Close;
      Q.SQL.Text :=
        'SELECT GEN_ID(GEN_ECF_GASTO_ENVIO_ID, 1) AS ID ' +
        'FROM RDB$DATABASE';
      Q.Open;
      IdEnvio := Q.FieldByName('ID').AsInteger;
      Q.Close;

      Q.SQL.Text :=
        'INSERT INTO ECF_GASTO_ENVIO (' +
        '  ID, CIA_KEY, TRN, TIPO_CF, ENCF, ESTADO, TRACK_ID, MENSAJE, ' +
        '  INTENTOS, CODIGO_SEGURIDAD, FECHA_EMISION, FECHA_FIRMA, ' +
        '  MONTO_TOTAL, URL_IMAGE, XML_FIRMADO, FECHA_CREACION' +
        ') VALUES (' +
        '  :ID, :CIA_KEY, :TRN, :TIPO_CF, :ENCF, :ESTADO, :TRACK_ID, ' +
        '  :MENSAJE, 1, :CODIGO_SEGURIDAD, :FECHA_EMISION, :FECHA_FIRMA, ' +
        '  :MONTO_TOTAL, :URL_IMAGE, :XML_FIRMADO, CURRENT_TIMESTAMP' +
        ')';
      Q.ParamByName('ID').AsInteger := IdEnvio;
      Q.ParamByName('CIA_KEY').AsInteger := ASnapshot.CiaKey;
      Q.ParamByName('TRN').AsInteger := ATrn;
      Q.ParamByName('TIPO_CF').AsInteger := StrToInt(ASnapshot.TipoCF);
      Q.ParamByName('ENCF').AsString := ASnapshot.ENCF;
      Q.ParamByName('ESTADO').AsString := Copy(Estado, 1, 32);

      if Trim(AResultado.TrackId) = '' then
        Q.ParamByName('TRACK_ID').Clear
      else
        Q.ParamByName('TRACK_ID').AsString :=
          Copy(Trim(AResultado.TrackId), 1, 100);

      Q.ParamByName('MENSAJE').AsString := MensajeParaCampo(
        MensajePersistir, 'ECF_GASTO_ENVIO',
        MaxCaracteresMensaje(ADatabase, Tr, 'ECF_GASTO_ENVIO'));

      if AResultado.TieneTimbre and
         (Trim(AResultado.Timbre.CodigoSeguridad) <> '') then
        Q.ParamByName('CODIGO_SEGURIDAD').AsString :=
          Copy(Trim(AResultado.Timbre.CodigoSeguridad), 1, 64)
      else
        Q.ParamByName('CODIGO_SEGURIDAD').Clear;

      if AResultado.TieneTimbre and
         AResultado.Timbre.TieneFechaEmision then
        Q.ParamByName('FECHA_EMISION').AsDateTime :=
          AResultado.Timbre.FechaEmision
      else
        Q.ParamByName('FECHA_EMISION').Clear;

      if AResultado.TieneTimbre and
         AResultado.Timbre.TieneFechaFirma then
        Q.ParamByName('FECHA_FIRMA').AsDateTime :=
          AResultado.Timbre.FechaFirma
      else
        Q.ParamByName('FECHA_FIRMA').Clear;

      if AResultado.TieneTimbre and
         AResultado.Timbre.TieneMontoTotal then
        Q.ParamByName('MONTO_TOTAL').AsCurrency :=
          AResultado.Timbre.MontoTotal
      else
        Q.ParamByName('MONTO_TOTAL').Clear;

      if AResultado.TieneTimbre and
         (Trim(AResultado.Timbre.UrlImage) <> '') then
        Q.ParamByName('URL_IMAGE').AsString :=
          Copy(Trim(AResultado.Timbre.UrlImage), 1, 1024)
      else
        Q.ParamByName('URL_IMAGE').Clear;

      if AResultado.TieneTimbre and
         (Trim(AResultado.Timbre.XmlFirmado) <> '') then
        Q.ParamByName('XML_FIRMADO').AsString :=
          Copy(Trim(AResultado.Timbre.XmlFirmado), 1, 1024)
      else
        Q.ParamByName('XML_FIRMADO').Clear;

      Q.ExecSQL;
    end;

    Tr.Commit;
  finally
    if Tr.InTransaction then
      Tr.Rollback;
    Q.Free;
    Tr.Free;
  end;
end;               

procedure PersistirResultadoEcfGasto(ADatabase: TIBDatabase; ATrn, ACiaKey: Integer;
  const ATipoCF, AENCF: string; const AResultado: TGastoEcfCliResult);
var
  Snapshot: TGastoEnvioSnapshot;
begin
  Snapshot.CiaKey := ACiaKey;
  Snapshot.TipoCF := ATipoCF;
  Snapshot.ENCF := AENCF;
  PersistirResultado(ADatabase, ATrn, Snapshot, AResultado);
end;

function ProcesarEnvioEcfGasto(
  ADatabase: TIBDatabase;
  const AExePath: string;
  ATrn: Integer;
  out AResultado: TGastoEcfCliResult;
  out AMensaje: string;
  ADescargarXml:Boolean
): Boolean;
var
  Snapshot: TGastoEnvioSnapshot;
  ErrorCli: string;
  CliEjecutado: Boolean;
begin
  Result := False;
  AMensaje := '';
  LimpiarResultado(AResultado);

  RegistrarLogEcfGasto(
    'ENVIO_INICIO',
    'TRN=' + IntToStr(ATrn) +
    ' EXE=' + Trim(AExePath)
  );

  try
    if ADatabase = nil then
      raise EEnvioEcfGasto.Create('No se recibio una conexion Firebird valida.');

    CargarSnapshot(ADatabase, ATrn, Snapshot);

    RegistrarLogEcfGasto(
      'SNAPSHOT_OK',
      'TRN=' + IntToStr(ATrn) +
      ' CIA=' + IntToStr(Snapshot.CiaKey) +
      ' Tipo=' + Snapshot.TipoCF +
      ' ENCF=' + Snapshot.ENCF
    );

    RegistrarLogEcfGasto(
      'CLI_INICIO',
      'TRN=' + IntToStr(ATrn) +
      ' ENCF=' + Snapshot.ENCF +
      ' EXE=' + Trim(AExePath)
    );

    CliEjecutado := EjecutarECFGasto(
      AExePath,
      ATrn,
      AResultado,
      ErrorCli,600000,ADescargarXml
    );

    { La decisión de reasignar no puede depender de que el CLI haya terminado
      con éxito ni de que una versión concreta devuelva exactamente
      SECUENCIA_USADA. Primero preservamos toda la información disponible y
      detectamos el caso recuperable en Estado, Mensaje, error del proceso y
      salida completa. }
    RegistrarLogEcfGasto(
      'CLI_RESULTADO',
      'TRN=' + IntToStr(ATrn) +
      ' Ejecutado=' + BoolToStr(CliEjecutado, True) +
      ' ExitCode=' + IntToStr(Integer(AResultado.ExitCode)) +
      ' Estado=' + AResultado.Estado +
      ' TrackId=' + AResultado.TrackId +
      ' ENCF=' + AResultado.ENCF +
      #13#10 +
      'Mensaje=' + AResultado.Mensaje +
      #13#10 +
      'ErrorCli=' + ErrorCli +
      #13#10 +
      'SalidaCompleta=' + AResultado.SalidaCompleta
    );

    if ResultadoRequiereReasignacionSecuencia(AResultado, ErrorCli) then
    begin
      AResultado.Estado := 'SECUENCIA_USADA';

      if Trim(AResultado.Mensaje) = '' then
      begin
        if Trim(ErrorCli) <> '' then
          AResultado.Mensaje := ErrorCli
        else
          AResultado.Mensaje :=
            'Este n?mero de secuencia ya ha sido utilizado.';
      end;
    end
    else if not CliEjecutado then
    begin
      if AResultado.Estado = '' then
        AResultado.Estado := 'ERROR';
      if AResultado.Mensaje = '' then
        AResultado.Mensaje := ErrorCli;
    end;

    try
      PersistirResultado(
        ADatabase,
        ATrn,
        Snapshot,
        AResultado
      );
    except
      on E: Exception do
      begin
        AMensaje :=
          'El proceso de e-CF devolvio estado [' + AResultado.Estado + '].' +
          #13#10 + AResultado.Mensaje +
          #13#10#13#10 +
          'Error al persistir el resultado del modulo GASTOS: ' + E.Message;

        RegistrarLogEcfGasto(
          'PERSISTIR_ERROR',
          'TRN=' + IntToStr(ATrn) +
          ' ENCF=' + Snapshot.ENCF +
          ' Estado=' + AResultado.Estado +
          #13#10 + AMensaje
        );

        Result := False;
        Exit;
      end;
    end;

    AMensaje := AResultado.Mensaje;

    { Boolean = el resultado pudo ser procesado por Delphi. Un rechazo fiscal
      sigue siendo un resultado válido del negocio. En particular,
      SECUENCIA_USADA debe regresar True para permitir que btnEnviarEcfClick
      continúe hacia la reasignación automática. }
    Result := CliEjecutado or
              ResultadoRequiereReasignacionSecuencia(AResultado, AMensaje);

    RegistrarLogEcfGasto(
      'ENVIO_FIN',
      'TRN=' + IntToStr(ATrn) +
      ' Result=' + BoolToStr(Result, True) +
      ' Estado=' + AResultado.Estado +
      ' TrackId=' + AResultado.TrackId +
      ' ENCF=' + AResultado.ENCF +
      #13#10 + AResultado.Mensaje
    );
  except
    on E: Exception do
    begin
      AMensaje := E.Message;

      RegistrarLogEcfGasto(
        'ENVIO_EXCEPTION',
        'TRN=' + IntToStr(ATrn) +
        ' Clase=' + E.ClassName +
        ' Mensaje=' + E.Message
      );

      Result := False;
    end;
  end;
end;

end.

