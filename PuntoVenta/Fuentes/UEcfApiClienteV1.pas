unit UEcfApiClienteV1;

{
  PointSaleSoft / Delphi 7 / WinHTTP COM / IDESI API V1.
  CP13.8: transporte fiscal multi-RNC TEST/PROD, sin SQL y sin POST implicito.
  Todas las rutas se construyen contra host IDESI fijo segun ambiente.
  No se siguen redirecciones y no se deshabilita la validacion HTTPS.
  El caller confirma previamente el estado TRANSMITIENDO en Firebird.
  Error de red de POST => RESULTADO INCIERTO, nunca reintentar aqui.
}

interface

uses
  SysUtils, Classes, UEcfCanalConfig, UEcfApiIntento;

type
  TEcfApiRespuestaV1 = record
    StatusCode: Integer;
    BodyBytes: AnsiString;  { JSON UTF-8 o bytes XML segun ContentType. }
    ContentType: string;
    IdempotencyReplayed: string;
  end;

{ Sobrescribe ClientId desde el INI del RNC y comprueba ambiente/host. }
function ResolverConfiguracionIdesiIni(
  const AConfig: TEcfCanalConfiguracion;
  const AIniPath: string): TEcfCanalConfiguracion;

{ Obtener token ANTES de persistir TRANSMITIENDO; sin escribir en disco. }
function ObtenerAccessTokenIdesiV1(
  const AConfig: TEcfCanalConfiguracion;
  const AIniPath: string): string;
procedure LimpiarCacheTokenIdesiV1;

{ Unico POST posible. Requiere autorizacion y estado ya persistido. }
function EnviarIntentoIdesiV1UnaVez(
  const AIntento: TEcfApiIntento;
  const AConfig: TEcfCanalConfiguracion;
  const AAccessToken: string;
  AAutorizarPost: Boolean): TEcfApiRespuestaV1;

{ Consultas y descarga exclusivamente por IDESI API, sin POST fiscal. }
function ConsultarEstadoIdesiV1(
  const AConfig: TEcfCanalConfiguracion;
  const AIniPath, AENcf: string): TEcfApiRespuestaV1;
function ConsultarMetadatosIdesiV1(
  const AConfig: TEcfCanalConfiguracion;
  const AIniPath, AENcf: string): TEcfApiRespuestaV1;
function ConsultarDetallesIdesiV1(
  const AConfig: TEcfCanalConfiguracion;
  const AIniPath, AENcf, ARncComprador,
  ACodigoSeguridad: string): TEcfApiRespuestaV1;
function DescargarXmlFirmadoIdesiV1(
  const AConfig: TEcfCanalConfiguracion;
  const AIniPath, AENcf: string): TEcfApiRespuestaV1;

function ConstruirRutaDetallesIdesiV1(const AConfig:TEcfCanalConfiguracion;
  const AENcf,ARncComprador,ACodigoSeguridad:string):string;

implementation

uses
  Windows, ComObj, Variants, DateUtils, UEcfApiCredencialesIni;

const
  WINHTTP_OPTION_ENABLE_REDIRECTS = 6;
  WINHTTP_OPTION_SECURE_PROTOCOLS = 9;
  WINHTTP_TLS12 = $00000800;

type
  TCacheTokenV1 = record
    Key: string;
    Token: string;
    Vence: TDateTime;
  end;

var
  CacheTokens: array of TCacheTokenV1;
  TokenCS: TRTLCriticalSection;

function EsIdentificacion(const S: string): Boolean;
var
  I: Integer;
begin
  Result := (Length(S) = 9) or (Length(S) = 11);
  if not Result then Exit;
  for I := 1 to Length(S) do
    if not (S[I] in ['0'..'9']) then
    begin
      Result := False;
      Exit;
    end;
end;

procedure ValidarConfig(const C: TEcfCanalConfiguracion);
var
  Ambiente: string;
begin
  if C.Canal <> ceIdesiApi then
    raise Exception.Create('Operacion bloqueada: canal no es IDESI_API.');
  if not EsIdentificacion(Trim(C.RncEmisor)) then
    raise Exception.Create('RNC emisor IDESI invalido.');
  Ambiente := NombreAmbienteEcf(C.Ambiente);
  if (Ambiente <> 'TEST') and (Ambiente <> 'PROD') then
    raise Exception.Create('Ambiente IDESI no reconocido.');
  if C.BaseUrl <> UrlIdesiPorAmbiente(Ambiente) then
    raise Exception.Create('Host API no coincide con ambiente fiscal configurado.');
  if Trim(C.ClientId) = '' then
    raise Exception.Create('ClientId no configurado para RNC/ambiente.');
end;

function ResolverConfiguracionIdesiIni(
  const AConfig: TEcfCanalConfiguracion;
  const AIniPath: string): TEcfCanalConfiguracion;
var
  Cred: TEcfCredencialIdesi;
  Ambiente: string;
begin
  if AConfig.Canal <> ceIdesiApi then
    raise Exception.Create('No corresponde resolver credenciales para ASLAN.');
  Ambiente := NombreAmbienteEcf(AConfig.Ambiente);
  Cred := LeerCredencialIdesiIni(AIniPath,AConfig.RncEmisor,Ambiente);
  Result := AConfig;
  if (Trim(AConfig.BaseUrl) <> '') and
     (AConfig.BaseUrl <> Cred.BaseUrl) then
    raise Exception.Create('Inconsistencia BaseUrl entre Firebird e INI.');
  Result.BaseUrl := Cred.BaseUrl;
  Result.ClientId := Cred.ClientId;
  ValidarConfig(Result);
end;

function CodificarUrl(const S: AnsiString): string;
var
  I: Integer;
  Ch: Char;
begin
  Result := '';
  for I := 1 to Length(S) do
  begin
    Ch := S[I];
    if Ch in ['A'..'Z','a'..'z','0'..'9','-','_','.','~'] then
      Result := Result + Ch
    else
      Result := Result + '%' + IntToHex(Ord(Ch),2);
  end;
end;

function EnForm(const S: string): string;
begin
  Result := CodificarUrl(UTF8Encode(WideString(S)));
end;

function ValidarENcf(const AENcf: string): string;
var
  I: Integer;
begin
  Result := UpperCase(Trim(AENcf));
  if Length(Result) <> 13 then
    raise Exception.Create('e-NCF invalido para consulta API.');
  if Result[1] <> 'E' then
    raise Exception.Create('e-NCF invalido para consulta API.');
  for I := 2 to Length(Result) do
    if not (Result[I] in ['0'..'9']) then
      raise Exception.Create('e-NCF invalido para consulta API.');
end;

function VariantBytes(const S: AnsiString): OleVariant;
var
  I: Integer;
begin
  if S = '' then
    raise Exception.Create('No se permite body HTTP vacio.');
  Result := VarArrayCreate([0,Length(S)-1],varByte);
  for I := 1 to Length(S) do
    Result[I-1] := Ord(S[I]);
end;

function BytesRespuesta(const A: OleVariant): AnsiString;
var
  I, Bajo, Alto: Integer;
begin
  Result := '';
  if VarIsNull(A) or VarIsEmpty(A) then Exit;
  if not VarIsArray(A) then
    raise Exception.Create('Respuesta WinHTTP no contiene bytes.');
  Bajo := VarArrayLowBound(A,1);
  Alto := VarArrayHighBound(A,1);
  SetLength(Result,Alto-Bajo+1);
  for I := Bajo to Alto do
    Result[I-Bajo+1] := Chr(Integer(A[I]));
end;

function CabeceraOpcional(const AHeaders, AName: string): string;
var
  I, J, K: Integer;
  Linea: string;
begin
  Result := '';
  I := 1;
  while I <= Length(AHeaders) do
  begin
    J := I;
    while (J <= Length(AHeaders)) and (AHeaders[J] <> #10) do Inc(J);
    Linea := Copy(AHeaders,I,J-I);
    if (Linea <> '') and (Linea[Length(Linea)] = #13) then
      Delete(Linea,Length(Linea),1);
    K := Pos(':',Linea);
    if (K > 0) and SameText(Trim(Copy(Linea,1,K-1)),AName) then
    begin
      Result := Trim(Copy(Linea,K+1,MaxInt));
      Exit;
    end;
    I := J+1;
  end;
end;

function HttpIdesiV1(
  const AConfig: TEcfCanalConfiguracion;
  const AMetodo, ARuta, AContentType, AAccept, AToken,
  AIdempotencyKey, ACorrelationId: string;
  const ABody: AnsiString): TEcfApiRespuestaV1;
var
  Http: OleVariant;
  BodyVar, ResponseVar: OleVariant;
  Headers: string;
begin
  Result.StatusCode := 0;
  Result.BodyBytes := '';
  Result.ContentType := '';
  Result.IdempotencyReplayed := '';
  ValidarConfig(AConfig);
  if ARuta = '' then
    raise Exception.Create('Ruta HTTP IDESI vacia.');
  if (ARuta[1] <> '/') or (Pos('//',ARuta) <> 0) or
     (Pos('#',ARuta) <> 0) then
    raise Exception.Create('Ruta HTTP IDESI invalida.');
  if (AMetodo <> 'GET') and (AMetodo <> 'POST') then
    raise Exception.Create('Metodo HTTP IDESI no admitido.');
  if (AMetodo = 'POST') and (ABody = '') then
    raise Exception.Create('POST IDESI requiere body.');
  if (AMetodo = 'GET') and (ABody <> '') then
    raise Exception.Create('GET IDESI no admite body.');
  try
    Http := CreateOleObject('WinHttp.WinHttpRequest.5.1');
    Http.SetTimeouts(20000,20000,30000,60000);
    Http.Option[WINHTTP_OPTION_SECURE_PROTOCOLS] := WINHTTP_TLS12;
    { Prohibir redirecciones; evita enviar Bearer a otro host. }
    Http.Option[WINHTTP_OPTION_ENABLE_REDIRECTS] := False;
    Http.Open(AMetodo,AConfig.BaseUrl+ARuta,False);
    if AContentType <> '' then
      Http.SetRequestHeader('Content-Type',AContentType);
    if AAccept <> '' then
      Http.SetRequestHeader('Accept',AAccept);
    if AToken <> '' then
      Http.SetRequestHeader('Authorization','Bearer '+AToken);
    if AIdempotencyKey <> '' then
      Http.SetRequestHeader('Idempotency-Key',AIdempotencyKey);
    if ACorrelationId <> '' then
      Http.SetRequestHeader('X-Correlation-Id',ACorrelationId);
    if ABody <> '' then
    begin
      BodyVar := VariantBytes(ABody);
      Http.Send(BodyVar);
    end
    else
      Http.Send('');
    Result.StatusCode := Integer(Http.Status);
    ResponseVar := Http.ResponseBody;
    Result.BodyBytes := BytesRespuesta(ResponseVar);
    Headers := string(Http.GetAllResponseHeaders);
    Result.ContentType := CabeceraOpcional(Headers,'Content-Type');
    if SameText(AMetodo,'POST') and (AIdempotencyKey <> '') then
      Result.IdempotencyReplayed := CabeceraOpcional(Headers,'Idempotency-Replayed');
  except
    on E: Exception do
      { No propagar excepcion COM con URL que podria incluir codigoSeguridad. }
      raise Exception.Create('Fallo de transporte WinHTTP ('+E.ClassName+
        '). No asumir que el POST no llego al servidor.');
  end;
end;

{ Lector simple para respuesta OAuth; no se utiliza para analizar documentos fiscales. }
function ValorJsonRaiz(const S, AClave: string): string;
var
  I, J, Inicio, Nivel: Integer;
  Nombre: string;
  EnTexto, Escapado: Boolean;
begin
  Result := '';
  Nivel := 0;
  I := 1;
  EnTexto := False;
  Escapado := False;
  while I <= Length(S) do
  begin
    if EnTexto then
    begin
      if Escapado then Escapado := False
      else if S[I] = '\' then Escapado := True
      else if S[I] = '"' then EnTexto := False;
      Inc(I);
      Continue;
    end;
    if (S[I] = '{') or (S[I] = '[') then Inc(Nivel)
    else if (S[I] = '}') or (S[I] = ']') then Dec(Nivel)
    else if S[I] = '"' then
    begin
      Inicio := I+1;
      Inc(I);
      Escapado := False;
      while I <= Length(S) do
      begin
        if Escapado then Escapado := False
        else if S[I] = '\' then Escapado := True
        else if S[I] = '"' then Break;
        Inc(I);
      end;
      if I > Length(S) then Exit;
      Nombre := Copy(S,Inicio,I-Inicio);
      if Nivel = 1 then
      begin
        J := I+1;
        while (J <= Length(S)) and (S[J] in [' ',#9,#13,#10]) do Inc(J);
        if (J <= Length(S)) and (S[J] = ':') and (Nombre = AClave) then
        begin
          Inc(J);
          while (J <= Length(S)) and (S[J] in [' ',#9,#13,#10]) do Inc(J);
          if J > Length(S) then Exit;
          if S[J] = '"' then
          begin
            Inicio := J+1;
            J := Inicio;
            while (J <= Length(S)) and (S[J] <> '"') do
            begin
              if S[J] = '\' then
                raise Exception.Create('OAuth devolvio escape inesperado.');
              Inc(J);
            end;
            if J > Length(S) then Exit;
            Result := Copy(S,Inicio,J-Inicio);
          end
          else
          begin
            Inicio := J;
            while (J <= Length(S)) and (S[J] in ['0'..'9']) do Inc(J);
            Result := Copy(S,Inicio,J-Inicio);
          end;
          Exit;
        end;
      end;
    end;
    Inc(I);
  end;
end;

function TokenDeOAuth(
  const C: TEcfCanalConfiguracion; const Cred: TEcfCredencialIdesi;
  out AVence: TDateTime): string;
var
  FormBody: AnsiString;
  R: TEcfApiRespuestaV1;
  Tipo: string;
  Segundos, Margen: Integer;
begin
  FormBody := AnsiString('grant_type=client_credentials&client_id=' +
    EnForm(Cred.ClientId) + '&client_secret=' + EnForm(Cred.ClientSecret));
  R := HttpIdesiV1(C,'POST','/oauth/token',
    'application/x-www-form-urlencoded','application/json','','','',FormBody);
  if R.StatusCode <> 200 then
    raise Exception.CreateFmt('OAuth IDESI no autorizado (HTTP %d).',[R.StatusCode]);
  Result := ValorJsonRaiz(string(R.BodyBytes),'access_token');
  Tipo := ValorJsonRaiz(string(R.BodyBytes),'token_type');
  Segundos := StrToIntDef(ValorJsonRaiz(string(R.BodyBytes),'expires_in'),0);
  if (Result = '') or not SameText(Tipo,'Bearer') or (Segundos <= 30) then
    raise Exception.Create('OAuth IDESI: token o expiracion no valida.');
  Margen := Segundos div 10;
  if Margen > 120 then Margen := 120;
  if Margen < 10 then Margen := 10;
  AVence := IncSecond(Now,Segundos-Margen);
end;

function ObtenerAccessTokenIdesiV1(
  const AConfig: TEcfCanalConfiguracion;
  const AIniPath: string): string;
var
  ConfigEfectiva: TEcfCanalConfiguracion;
  Cred: TEcfCredencialIdesi;
  K: string;
  I, Idx: Integer;
  Vence: TDateTime;
begin
  ConfigEfectiva := ResolverConfiguracionIdesiIni(AConfig,AIniPath);
  Cred := LeerCredencialIdesiIni(AIniPath,ConfigEfectiva.RncEmisor,
    NombreAmbienteEcf(ConfigEfectiva.Ambiente));
  K := ConfigEfectiva.BaseUrl+'|'+ConfigEfectiva.RncEmisor+'|'+
    NombreAmbienteEcf(ConfigEfectiva.Ambiente)+'|'+Cred.ClientId;
  EnterCriticalSection(TokenCS);
  try
    Idx := -1;
    for I := 0 to Length(CacheTokens)-1 do
      if CacheTokens[I].Key = K then
      begin
        Idx := I;
        Break;
      end;
    if Idx >= 0 then
    begin
      if (CacheTokens[Idx].Token <> '') and
         (Now < CacheTokens[Idx].Vence) then
      begin
        Result := CacheTokens[Idx].Token;
        Exit;
      end;
    end;
    Result := TokenDeOAuth(ConfigEfectiva,Cred,Vence);
    if Idx < 0 then
    begin
      Idx := Length(CacheTokens);
      SetLength(CacheTokens,Idx+1);
    end;
    CacheTokens[Idx].Key := K;
    CacheTokens[Idx].Token := Result;
    CacheTokens[Idx].Vence := Vence;
  finally
    LeaveCriticalSection(TokenCS);
  end;
end;

procedure LimpiarCacheTokenIdesiV1;
begin
  EnterCriticalSection(TokenCS);
  try
    SetLength(CacheTokens,0);
  finally
    LeaveCriticalSection(TokenCS);
  end;
end;

function RutaEcf(const C: TEcfCanalConfiguracion;
  const AENcf: string): string;
begin
  Result := '/api/v1/ecf/'+CodificarUrl(AnsiString(C.RncEmisor))+'/'+
    CodificarUrl(AnsiString(ValidarENcf(AENcf)));
end;

function EnviarIntentoIdesiV1UnaVez(
  const AIntento: TEcfApiIntento;
  const AConfig: TEcfCanalConfiguracion;
  const AAccessToken: string;
  AAutorizarPost: Boolean): TEcfApiRespuestaV1;
var
  Tipo: string;
begin
  Result.StatusCode := 0;
  Result.BodyBytes := '';
  Result.ContentType := '';
  Result.IdempotencyReplayed := '';
  if not AAutorizarPost then
    raise Exception.Create('POST fiscal no autorizado por el despachador.');
  ValidarConfig(AConfig);
  Tipo := Copy(ValidarENcf(AIntento.ENcf),1,3);
  if (Tipo <> 'E31') and (Tipo <> 'E32') and (Tipo <> 'E34') and
     (Tipo <> 'E44') and (Tipo <> 'E45') and
     (Tipo <> 'E41') and (Tipo <> 'E43') then
    raise Exception.Create('Tipo e-CF no admitido en API publica V1.');
  if (AIntento.EstadoLocal <> 'TRANSMITIENDO') or
     (AIntento.Ambiente <> NombreAmbienteEcf(AConfig.Ambiente)) or
     (AIntento.BaseUrl <> AConfig.BaseUrl) or
     (AIntento.ClientId <> AConfig.ClientId) or
     (AIntento.RncEmisor <> AConfig.RncEmisor) or
     (AIntento.IdempotencyKey = '') or
     (AIntento.CorrelationId = '') or
     (AIntento.RequestUtf8 = '') or
     (Trim(AAccessToken) = '') then
    raise Exception.Create('Intento HTTP no coincide con RNC, ambiente o estado persistido.');
  { No se regenera el body ni se transmite dos veces desde esta funcion. }
  Result := HttpIdesiV1(AConfig,'POST','/api/v1/ecf',
    'application/json','application/json',AAccessToken,
    AIntento.IdempotencyKey,AIntento.CorrelationId,AIntento.RequestUtf8);
end;

function GetIdesiV1(
  const C: TEcfCanalConfiguracion;
  const AIniPath, ARuta, AAccept: string): TEcfApiRespuestaV1;
var
  ConfigEfectiva: TEcfCanalConfiguracion;
  Token: string;
begin
  ConfigEfectiva := ResolverConfiguracionIdesiIni(C,AIniPath);
  Token := ObtenerAccessTokenIdesiV1(ConfigEfectiva,AIniPath);
  Result := HttpIdesiV1(ConfigEfectiva,'GET',ARuta,'',AAccept,Token,'','','');
end;

function ConsultarEstadoIdesiV1(
  const AConfig: TEcfCanalConfiguracion;
  const AIniPath, AENcf: string): TEcfApiRespuestaV1;
begin
  Result := GetIdesiV1(AConfig,AIniPath,RutaEcf(AConfig,AENcf),'application/json');
end;

function ConsultarMetadatosIdesiV1(
  const AConfig: TEcfCanalConfiguracion;
  const AIniPath, AENcf: string): TEcfApiRespuestaV1;
begin
  Result := GetIdesiV1(AConfig,AIniPath,RutaEcf(AConfig,AENcf)+'/metadata','application/json');
end;

function ConstruirRutaDetallesIdesiV1(const AConfig:TEcfCanalConfiguracion;
  const AENcf,ARncComprador,ACodigoSeguridad:string):string;
var
  I: Integer;
  Ruta: string;
begin
  if Length(ACodigoSeguridad) <> 6 then
    raise Exception.Create('CodigoSeguridad requiere 6 caracteres.');
  for I := 1 to Length(ACodigoSeguridad) do
    if not (ACodigoSeguridad[I] in
      ['a'..'z','A'..'Z','0'..'9','+','/']) then
      raise Exception.Create('CodigoSeguridad invalido.');
  if (Trim(ARncComprador) <> '') and
     (not EsIdentificacion(Trim(ARncComprador))) then
    raise Exception.Create('RNC comprador no valido para /details.');
  Ruta := RutaEcf(AConfig,AENcf)+'/details?codigoSeguridad='+
    EnForm(ACodigoSeguridad);
  if Trim(ARncComprador) <> '' then
    Ruta := Ruta+'&rncComprador='+EnForm(Trim(ARncComprador));
  { La ruta completa nunca debe escribirse en logs: contiene codigoSeguridad. }
  Result := Ruta;
end;

function ConsultarDetallesIdesiV1(
  const AConfig: TEcfCanalConfiguracion;
  const AIniPath, AENcf, ARncComprador,
  ACodigoSeguridad: string): TEcfApiRespuestaV1;
begin
  Result:=GetIdesiV1(AConfig,AIniPath,
    ConstruirRutaDetallesIdesiV1(AConfig,AENcf,ARncComprador,ACodigoSeguridad),
    'application/json');
end;

function DescargarXmlFirmadoIdesiV1(
  const AConfig: TEcfCanalConfiguracion;
  const AIniPath, AENcf: string): TEcfApiRespuestaV1;
begin
  Result := GetIdesiV1(AConfig,AIniPath,RutaEcf(AConfig,AENcf)+'/signed-xml',
    'application/xml');
end;

initialization
  InitializeCriticalSection(TokenCS);
  SetLength(CacheTokens,0);

finalization
  SetLength(CacheTokens,0);
  DeleteCriticalSection(TokenCS);

end.
