unit UEcfSecuenciaRemota;

interface

uses SysUtils, Classes;

type
  TRespuestaSecuencia = record
    HttpStatus: Integer;
    Resultado: string;
    RequestId: string;
    ReservaId: string;
    LoteId: string;
    Correlativo: string;
    ENcf: string;
    FechaVence: TDateTime;
  end;

function SolicitarSecuenciaTest(
  const AUrl, AToken, ARequestId, ADocumento, ARnc, ASucursal, ATipo: string;
  AConsultar: Boolean): TRespuestaSecuencia;

implementation

uses ComObj, Variants;

function Identificador(const S: string; AMax: Integer): Boolean;
var I: Integer;
begin
  Result := (Length(S) > 0) and (Length(S) <= AMax);
  for I := 1 to Length(S) do
    if not (S[I] in ['A'..'Z','a'..'z','0'..'9','.', '_', ':', '-']) then
      Result := False;
end;

function EnteroPositivo(const S: string): Boolean;
var I: Integer;
begin
  Result := (Length(S) > 0) and (Length(S) <= 20);
  for I := 1 to Length(S) do
    if not (S[I] in ['0'..'9']) then Result := False;
  if Result then Result := StringReplace(S, '0', '', [rfReplaceAll]) <> '';
end;

function FormTexto(const S: string): string;
var I: Integer; Bytes: AnsiString;
begin
  Result := '';
  Bytes := UTF8Encode(WideString(S));
  for I := 1 to Length(Bytes) do
    if Bytes[I] in ['A'..'Z','a'..'z','0'..'9','-','_','.','~'] then
      Result := Result + Bytes[I]
    else
      Result := Result + '%' + IntToHex(Ord(Bytes[I]), 2);
end;

procedure LeerObjetoPlano(const S: string; Campos: TStrings);
var P, Inicio: Integer; K, V: string;
  procedure Espacios;
  begin
    while (P <= Length(S)) and (S[P] in [' ', #9, #10, #13]) do Inc(P);
  end;
  function Cadena: string;
  begin
    if (P > Length(S)) or (S[P] <> '"') then
      raise Exception.Create('Respuesta de secuencia invalida.');
    Inc(P);
    Inicio := P;
    while (P <= Length(S)) and (S[P] <> '"') do
    begin
      if (Ord(S[P]) < 32) or (S[P] = '\') then
        raise Exception.Create('Respuesta de secuencia fuera del contrato.');
      Inc(P);
    end;
    if P > Length(S) then raise Exception.Create('Respuesta incompleta.');
    Result := Copy(S, Inicio, P - Inicio);
    Inc(P);
  end;
begin
  P := 1;
  Espacios;
  if (P > Length(S)) or (S[P] <> '{') then
    raise Exception.Create('Se esperaba objeto JSON de secuencia.');
  Inc(P);
  Espacios;
  while (P <= Length(S)) and (S[P] <> '}') do
  begin
    K := Cadena;
    Espacios;
    if (P > Length(S)) or (S[P] <> ':') then
      raise Exception.Create('Respuesta de secuencia invalida.');
    Inc(P);
    Espacios;
    V := Cadena;
    if Campos.IndexOfName(K) >= 0 then
      raise Exception.Create('Campo de respuesta duplicado.');
    Campos.Add(K + '=' + V);
    Espacios;
    if (P <= Length(S)) and (S[P] = ',') then
    begin
      Inc(P);
      Espacios;
      if (P > Length(S)) or (S[P] = '}') then
        raise Exception.Create('Respuesta de secuencia invalida.');
    end
    else Break;
  end;
  if (P > Length(S)) or (S[P] <> '}') then
    raise Exception.Create('Respuesta de secuencia incompleta.');
  Inc(P);
  Espacios;
  if P <= Length(S) then raise Exception.Create('Contenido JSON adicional.');
end;

function SolicitarSecuenciaTest(
  const AUrl, AToken, ARequestId, ADocumento, ARnc, ASucursal, ATipo: string;
  AConsultar: Boolean): TRespuestaSecuencia;
var
  Http, ByteBody: OleVariant;
  Body, Json, Accion, Fecha: string;
  Campos: TStringList;
  I: Integer;
begin
  Result.HttpStatus := 0;
  Result.Resultado := 'NO_DISPONIBLE';
  Result.RequestId := ARequestId;
  Result.ReservaId := '';
  Result.LoteId := '';
  Result.Correlativo := '';
  Result.ENcf := '';
  Result.FechaVence := 0;
  if (AUrl <> 'https://idesisa.com/ecf-cp4-qa.php') and
     (AUrl <> 'https://www.idesisa.com/ecf-cp4-qa.php') then
    raise Exception.Create('Endpoint de secuencias TEST no autorizado.');
  if (Length(ARequestId) <> 36) or not Identificador(ARequestId, 36) or
     (LowerCase(ARequestId) <> ARequestId) or
     not Identificador(ADocumento, 128) or not Identificador(ASucursal, 64) or
     ((Length(ARnc) <> 9) and (Length(ARnc) <> 11)) or
     (Length(ATipo) <> 3) or (Copy(ATipo,1,1) <> 'E') or (AToken = '') then
    raise Exception.Create('Contexto de solicitud de secuencia invalido.');
  for I := 1 to Length(ARnc) do
    if not (ARnc[I] in ['0'..'9']) then
      raise Exception.Create('RNC emisor invalido.');
  if AConsultar then Accion := 'consultar' else Accion := 'reservar';
  Body := 'token=' + FormTexto(AToken) + '&accion=' + Accion +
    '&request_id=' + FormTexto(ARequestId) + '&documento=' + FormTexto(ADocumento) +
    '&rnc=' + FormTexto(ARnc) + '&ambiente=TEST&sucursal=' + FormTexto(ASucursal) +
    '&tipo=' + FormTexto(ATipo);
  Campos := TStringList.Create;
  try
    try
      Http := CreateOleObject('WinHttp.WinHttpRequest.5.1');
      Http.SetTimeouts(3000, 3000, 5000, 5000);
      Http.Option[6] := False;
      Http.Option[9] := $00000800;
      Http.Open('POST', AUrl, False);
      Http.SetRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      Http.SetRequestHeader('Accept', 'application/json');
      ByteBody := VarArrayCreate([0, Length(Body)-1], varByte);
      for I := 1 to Length(Body) do ByteBody[I-1] := Ord(Body[I]);
      Http.Send(ByteBody);
      Result.HttpStatus := Integer(Http.Status);
      Json := string(Http.ResponseText);
      if Length(Json) > 8192 then raise Exception.Create('Respuesta extensa.');
      LeerObjetoPlano(Json, Campos);
      Result.Resultado := Campos.Values['resultado'];
      if Result.Resultado = '' then raise Exception.Create('Resultado ausente.');
      if (Result.Resultado = 'ASIGNADO') or (Result.Resultado = 'MISMA_RESERVA') then
      begin
        if (Result.HttpStatus <> 200) or
           (Campos.Values['request_id'] <> ARequestId) or
           not EnteroPositivo(Campos.Values['reserva_id']) or
           not EnteroPositivo(Campos.Values['lote_id']) or
           not EnteroPositivo(Campos.Values['correlativo']) then
          raise Exception.Create('Identidad de reserva invalida.');
        Result.ReservaId := Campos.Values['reserva_id'];
        Result.LoteId := Campos.Values['lote_id'];
        Result.Correlativo := Campos.Values['correlativo'];
        Result.ENcf := Campos.Values['encf'];
        if (Length(Result.ENcf) <> 13) or (Copy(Result.ENcf,1,3) <> ATipo) or
           (Length(Result.Correlativo) > 10) then
          raise Exception.Create('e-NCF de reserva invalido.');
        if Result.ENcf <> ATipo + StringOfChar('0', 10-Length(Result.Correlativo)) +
           Result.Correlativo then raise Exception.Create('Correlativo inconsistente.');
        Fecha := Campos.Values['fecha_vence'];
        if (Length(Fecha) <> 10) or (Fecha[5] <> '-') or (Fecha[8] <> '-') then
          raise Exception.Create('Vencimiento ausente.');
        Result.FechaVence := EncodeDate(StrToInt(Copy(Fecha,1,4)),
          StrToInt(Copy(Fecha,6,2)), StrToInt(Copy(Fecha,9,2)));
      end
      else if (Result.Resultado <> 'CONFLICTO_SOLICITUD') and
              (Result.Resultado <> 'DOCUMENTO_YA_RESERVADO') and
              (Result.Resultado <> 'SIN_LOTE') and
              (Result.Resultado <> 'NO_ENCONTRADA') and
              (Result.Resultado <> 'NO_AUTORIZADO') and
              (Result.Resultado <> 'NO_DISPONIBLE') then
        raise Exception.Create('Resultado fuera del contrato.');
    except
      Result.Resultado := 'NO_DISPONIBLE';
      Result.ReservaId := '';
      Result.LoteId := '';
      Result.Correlativo := '';
      Result.ENcf := '';
      Result.FechaVence := 0;
    end;
  finally
    Campos.Free;
  end;
end;

end.
