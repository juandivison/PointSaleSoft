unit UEcfApiSwitch;

{
  Checkpoint 10 — selector fiscal no invasivo Delphi 7 / IBX / Firebird 2.5.
  - Si no se han instalado las tablas del nuevo modulo, conserva ASLAN.
  - Si existe un intento IDESI_API para la transaccion, bloquea cualquier
    redireccionamiento a ASLAN, incluso si el operador cambio el parametro.
  - No transmite, no calcula importes y no modifica datos.
  - CP12-H3: utiliza EXCLUSIVAMENTE dmConectar.IBTransaction1.
    Si estaba inactiva, inicia y revierte SOLO la lectura propia.
}

interface

uses
  IBDatabase, UEcfCanalConfig, UEcfApiIntento;

function ResolverCanalEcfTransaccion(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  const ARncEmisor: string; ANumeroTrn: Integer): TEcfCanalConfiguracion;

{ Solo consulta: conserva canal y ambiente del intento historico.
  No autoriza POST ni altera datos. }
function ResolverCanalEcfConsulta(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  const ARncEmisor: string; ANumeroTrn: Integer;
  out ATieneIntento: Boolean; out AIntento: TEcfApiIntento): TEcfCanalConfiguracion;

implementation

uses
  SysUtils, IBQuery, DB, UDatModConectar;

function ExisteTablaEcf(ADatabase: TIBDatabase;
  ATransaction: TIBTransaction; const ANombre: string): Boolean;
var
  Q: TIBQuery;
begin
  Result := False;
  Q := TIBQuery.Create(nil);
  try
    Q.Database := ADatabase;
    Q.Transaction := ATransaction;
    Q.SQL.Text :=
      'SELECT FIRST 1 RDB$RELATION_NAME FROM RDB$RELATIONS ' +
      'WHERE RDB$RELATION_NAME = :NOMBRE ' +
      'AND COALESCE(RDB$SYSTEM_FLAG, 0) = 0';
    Q.ParamByName('NOMBRE').AsString := ANombre;
    Q.Open;
    Result := not Q.Eof;
  finally
    Q.Free;
  end;
end;

function ResolverCanalEcfConsulta(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  const ARncEmisor: string; ANumeroTrn: Integer;
  out ATieneIntento: Boolean; out AIntento: TEcfApiIntento): TEcfCanalConfiguracion;
var
  TieneConfig, TieneIntentos: Boolean;
  IniciadaAqui: Boolean;
begin
  if (ADatabase = nil) or (ATransaction = nil) or
     (dmConectar = nil) or
     (ADatabase <> dmConectar.IBDatabase1) or
     (ATransaction <> dmConectar.IBTransaction1) or
     (not ADatabase.Connected) then
    raise Exception.Create('Switch e-CF requiere IBDatabase1 e IBTransaction1 globales.');
  if ANumeroTrn <= 0 then
    raise Exception.Create('Numero de transaccion invalido para switch e-CF.');

  Result.RncEmisor := Trim(ARncEmisor);
  Result.Canal := ceAslan;
  Result.Ambiente := aeTest;
  Result.BaseUrl := '';
  Result.ClientId := '';
  ATieneIntento := False;
  AIntento.IdIntento := '';
  AIntento.RequestUtf8 := '';

  IniciadaAqui := not ATransaction.InTransaction;
  if IniciadaAqui then ATransaction.StartTransaction;
  try
    TieneConfig := ExisteTablaEcf(ADatabase, ATransaction, 'ECF_CANAL_CONFIG');
    TieneIntentos := ExisteTablaEcf(ADatabase, ATransaction, 'ECF_API_INTENTO');
    if (TieneConfig or TieneIntentos) and (Trim(ARncEmisor) = '') then
      raise Exception.Create('No se puede resolver canal e-CF: RNC emisor vacio.');

    if TieneConfig then
      Result := CargarConfiguracionCanalEcf(ADatabase, ATransaction, ARncEmisor);

    if TieneIntentos and (Trim(ARncEmisor) <> '') then
    begin
      ATieneIntento := CargarIntentoApiPorFactura(
        ADatabase, ARncEmisor, ANumeroTrn, AIntento);
      if ATieneIntento then
      begin
        { El documento historico prevalece sobre un cambio de canal posterior. }
        if not SameText(AIntento.RncEmisor,Trim(ARncEmisor)) then
          raise Exception.Create('RNC no coincide con intento fiscal historico.');
        Result.Canal := ceIdesiApi;
        Result.RncEmisor := AIntento.RncEmisor;
        if SameText(AIntento.Ambiente,'TEST') then
          Result.Ambiente := aeTest
        else if SameText(AIntento.Ambiente,'PROD') then
          Result.Ambiente := aeProd
        else
          raise Exception.Create('Ambiente historico IDESI desconocido.');
        Result.BaseUrl := AIntento.BaseUrl;
        Result.ClientId := AIntento.ClientId;
      end;
    end;

    if (Result.Canal = ceIdesiApi) and (not TieneIntentos) then
      raise Exception.Create('Falta migracion ECF_API_INTENTO. Canal API bloqueado.');
  finally
    if IniciadaAqui and ATransaction.InTransaction then
      ATransaction.Rollback;
  end;
end;

function ResolverCanalEcfTransaccion(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  const ARncEmisor: string; ANumeroTrn: Integer): TEcfCanalConfiguracion;
var
  Previo: TEcfApiIntento;
  TieneIntento: Boolean;
begin
  { Contrato anterior conservado: un intento previo BLOQUEA una nueva emision. }
  Result := ResolverCanalEcfConsulta(ADatabase,ATransaction,
    ARncEmisor,ANumeroTrn,TieneIntento,Previo);
  if TieneIntento then
    raise Exception.Create('La factura ya tiene intento IDESI_API (ID=' +
      Previo.IdIntento + ', Estado=' + Previo.EstadoLocal + '). ' +
      'No enviar de nuevo ni cambiar a ASLAN; consultar/conciliar.');
end;

end.
