unit UEcfApiCredencialesIni;

{
  PointSaleSoft / Delphi 7 / Windows 10-11.
  CP13.8: credenciales IDESI API por RNC emisor y ambiente en repconf_cr.ini.
  ClientSecretProtected se cifra con Windows DPAPI CURRENT USER.
  El INI no almacena secretos en texto plano. No imprime secretos ni tokens.
  Cada identidad de Windows debe aprovisionar sus propias credenciales.
}

interface

uses
  SysUtils, Classes;

type
  TEcfCredencialIdesi = record
    RncEmisor: string;
    Ambiente: string;
    BaseUrl: string;
    ClientId: string;
    ClientSecret: string;  { Solo en memoria; nunca escribir en logs. }
  end;

function LeerCredencialIdesiIni(
  const AIniPath, ARncEmisor, AAmbiente: string): TEcfCredencialIdesi;
procedure GuardarCredencialIdesiIni(
  const AIniPath, ARncEmisor, AAmbiente, AClientId,
  AClientSecret: string);
function UrlIdesiPorAmbiente(const AAmbiente: string): string;

function CifrarDPAPI(const ATexto, ASeccion: string): string;
function DescifrarDPAPI(const AProtegido, ASeccion: string): string;

implementation

uses
  Windows, IniFiles;

const
  DPAPI_UI_FORBIDDEN = $00000001;
  DPAPI_DESCRIPCION = 'PointSaleSoft IDESI API OAuth';
  MARCA_DPAPI = 'DPAPI_CURRENT_USER_V1';
  BASE64_CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

type
  TDPAPIBlob = record
    cbData: DWORD;
    pbData: PChar;
  end;
  PDPAPIBlob = ^TDPAPIBlob;

function CryptProtectData(var pDataIn: TDPAPIBlob; szDataDescr: PWideChar;
  pOptionalEntropy: PDPAPIBlob; pvReserved, pPromptStruct: Pointer;
  dwFlags: DWORD; var pDataOut: TDPAPIBlob): BOOL; stdcall;
  external 'crypt32.dll' name 'CryptProtectData';
function CryptUnprotectData(var pDataIn: TDPAPIBlob; ppszDataDescr: Pointer;
  pOptionalEntropy: PDPAPIBlob; pvReserved, pPromptStruct: Pointer;
  dwFlags: DWORD; var pDataOut: TDPAPIBlob): BOOL; stdcall;
  external 'crypt32.dll' name 'CryptUnprotectData';

function SoloDigitos(const S: string): Boolean;
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

function AmbienteValido(const S: string): string;
begin
  Result := UpperCase(Trim(S));
  if (Result <> 'TEST') and (Result <> 'PROD') then
    raise Exception.Create('Ambiente IDESI API debe ser TEST o PROD.');
end;

function UrlIdesiPorAmbiente(const AAmbiente: string): string;
begin
  if AmbienteValido(AAmbiente) = 'TEST' then
    Result := 'https://api-staging.idesisa.com'
  else
    Result := 'https://api.idesisa.com';
end;

function NombreSeccion(const ARncEmisor, AAmbiente: string): string;
begin
  if not SoloDigitos(Trim(ARncEmisor)) then
    raise Exception.Create('RNC emisor debe tener 9 u 11 digitos.');
  Result := 'ECF_IDESI_API_' + Trim(ARncEmisor) + '_' +
    AmbienteValido(AAmbiente);
end;

function EnBase64(const Bytes: AnsiString): string;
var
  I, A, B, C: Integer;
begin
  Result := '';
  I := 1;
  while I <= Length(Bytes) do
  begin
    A := Ord(Bytes[I]);
    B := 0;
    C := 0;
    if I + 1 <= Length(Bytes) then B := Ord(Bytes[I + 1]);
    if I + 2 <= Length(Bytes) then C := Ord(Bytes[I + 2]);
    Result := Result + BASE64_CHARS[(A shr 2) + 1];
    Result := Result + BASE64_CHARS[(((A and 3) shl 4) or (B shr 4)) + 1];
    if I + 1 <= Length(Bytes) then
      Result := Result + BASE64_CHARS[(((B and 15) shl 2) or (C shr 6)) + 1]
    else
      Result := Result + '=';
    if I + 2 <= Length(Bytes) then
      Result := Result + BASE64_CHARS[(C and 63) + 1]
    else
      Result := Result + '=';
    Inc(I,3);
  end;
end;

function ValorBase64(C: Char): Integer;
begin
  Result := Pos(C, BASE64_CHARS) - 1;
  if Result < 0 then
    raise Exception.Create('ClientSecretProtected no tiene codificacion Base64 valida.');
end;

function DesdeBase64(const S: string): AnsiString;
var
  I, A, B, C, D: Integer;
begin
  Result := '';
  if (S = '') or ((Length(S) mod 4) <> 0) then
    raise Exception.Create('ClientSecretProtected incompleto.');
  I := 1;
  while I <= Length(S) do
  begin
    if (S[I] = '=') or (S[I+1] = '=') then
      raise Exception.Create('Base64 invalido.');
    A := ValorBase64(S[I]);
    B := ValorBase64(S[I+1]);
    C := 0;
    D := 0;
    if S[I+2] <> '=' then C := ValorBase64(S[I+2]);
    if S[I+3] <> '=' then D := ValorBase64(S[I+3]);
    if (S[I+2] = '=') and (S[I+3] <> '=') then
      raise Exception.Create('Base64 invalido.');
    if ((S[I+2] = '=') or (S[I+3] = '=')) and (I+3 <> Length(S)) then
      raise Exception.Create('Base64 invalido.');
    Result := Result + Chr((A shl 2) or (B shr 4));
    if S[I+2] <> '=' then
      Result := Result + Chr(((B and 15) shl 4) or (C shr 2));
    if S[I+3] <> '=' then
      Result := Result + Chr(((C and 3) shl 6) or D);
    Inc(I,4);
  end;
end;

function EntropiaSeccion(const ASeccion: string): AnsiString;
begin
  Result := AnsiString('PointSaleSoft|IDESI_API|' + ASeccion + '|v1');
end;

procedure ConfigurarBlob(const ABytes: AnsiString; var ABlob: TDPAPIBlob);
begin
  ABlob.cbData := Length(ABytes);
  if ABlob.cbData = 0 then
    ABlob.pbData := nil
  else
    ABlob.pbData := PChar(ABytes);
end;

function CifrarDPAPI(const ATexto, ASeccion: string): string;
var
  Entrada, Entropia, Salida: TDPAPIBlob;
  Plano, Sal, Protegido: AnsiString;
begin
  Plano := UTF8Encode(WideString(ATexto));
  if Plano = '' then
    raise Exception.Create('No se permite guardar ClientSecret vacio.');
  Sal := EntropiaSeccion(ASeccion);
  ConfigurarBlob(Plano,Entrada);
  ConfigurarBlob(Sal,Entropia);
  FillChar(Salida,SizeOf(Salida),0);
  if not CryptProtectData(Entrada,PWideChar(WideString(DPAPI_DESCRIPCION)),
    @Entropia,nil,nil,DPAPI_UI_FORBIDDEN,Salida) then
    raise Exception.Create('Windows no pudo cifrar ClientSecret con DPAPI.');
  try
    SetLength(Protegido,Salida.cbData);
    if Salida.cbData > 0 then Move(Salida.pbData^,Protegido[1],Salida.cbData);
    Result := EnBase64(Protegido);
  finally
    if Salida.pbData <> nil then LocalFree(HLOCAL(Salida.pbData));
  end;
end;

function DescifrarDPAPI(const AProtegido, ASeccion: string): string;
var
  Entrada, Entropia, Salida: TDPAPIBlob;
  Cifrado, Sal, Plano: AnsiString;
begin
  Cifrado := DesdeBase64(Trim(AProtegido));
  Sal := EntropiaSeccion(ASeccion);
  ConfigurarBlob(Cifrado,Entrada);
  ConfigurarBlob(Sal,Entropia);
  FillChar(Salida,SizeOf(Salida),0);
  if not CryptUnprotectData(Entrada,nil,@Entropia,nil,nil,
    DPAPI_UI_FORBIDDEN,Salida) then
    raise Exception.Create('No se puede descifrar ClientSecret: ' +
      'verificar cuenta Windows, equipo y seccion RNC/ambiente.');
  try
    SetLength(Plano,Salida.cbData);
    if Salida.cbData > 0 then Move(Salida.pbData^,Plano[1],Salida.cbData);
    Result := string(UTF8Decode(Plano));
  finally
    if Salida.pbData <> nil then LocalFree(HLOCAL(Salida.pbData));
  end;
end;

function LeerCredencialIdesiIni(
  const AIniPath, ARncEmisor, AAmbiente: string): TEcfCredencialIdesi;
var
  Ini: TIniFile;
  Seccion, Protegido, Marcador: string;
begin
  if not FileExists(AIniPath) then
    raise Exception.Create('No existe el INI de configuracion fiscal.');
  Seccion := NombreSeccion(ARncEmisor,AAmbiente);
  Ini := TIniFile.Create(AIniPath);
  try
    if not Ini.SectionExists(Seccion) then
      raise Exception.Create('Credenciales IDESI no aprovisionadas para este RNC y ambiente.');
    Result.RncEmisor := Trim(ARncEmisor);
    Result.Ambiente := AmbienteValido(AAmbiente);
    Result.BaseUrl := Trim(Ini.ReadString(Seccion,'BaseUrl',''));
    Result.ClientId := Trim(Ini.ReadString(Seccion,'ClientId',''));
    Marcador := Trim(Ini.ReadString(Seccion,'Protection',''));
    Protegido := Trim(Ini.ReadString(Seccion,'ClientSecretProtected',''));
    if Result.BaseUrl <> UrlIdesiPorAmbiente(Result.Ambiente) then
      raise Exception.Create('BaseUrl no coincide con el ambiente IDESI autorizado.');
    if (Result.ClientId = '') or (Pos(' ',Result.ClientId) > 0) then
      raise Exception.Create('ClientId IDESI invalido o vacio.');
    if Marcador <> MARCA_DPAPI then
      raise Exception.Create('Proteccion de secreto IDESI no compatible.');
    if (Protegido = '') or Ini.ValueExists(Seccion,'ClientSecret') then
      raise Exception.Create('ClientSecret IDESI no cifrado o en formato antiguo.');
    Result.ClientSecret := DescifrarDPAPI(Protegido,Seccion);
  finally
    Ini.Free;
  end;
end;

procedure GuardarCredencialIdesiIni(
  const AIniPath, ARncEmisor, AAmbiente, AClientId,
  AClientSecret: string);
var
  Ini: TIniFile;
  Seccion, Protegido, Id: string;
begin
  if Trim(AIniPath) = '' then
    raise Exception.Create('Ruta INI requerida para proteger credenciales.');
  Seccion := NombreSeccion(ARncEmisor,AAmbiente);
  Id := Trim(AClientId);
  if (Id = '') or (Pos(' ',Id) > 0) then
    raise Exception.Create('ClientId obligatorio y sin espacios.');
  Protegido := CifrarDPAPI(AClientSecret,Seccion);
  Ini := TIniFile.Create(AIniPath);
  try
    { Se borra cualquier campo antiguo en claro antes de habilitar el nuevo. }
    Ini.DeleteKey(Seccion,'ClientSecret');
    Ini.WriteString(Seccion,'Protection',MARCA_DPAPI);
    Ini.WriteString(Seccion,'ClientSecretProtected',Protegido);
    Ini.WriteString(Seccion,'ClientId',Id);
    Ini.WriteString(Seccion,'BaseUrl',UrlIdesiPorAmbiente(AAmbiente));
  finally
    Ini.Free;
  end;
end;

end.
