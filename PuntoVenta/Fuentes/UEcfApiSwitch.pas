unit UEcfApiSwitch;

{
  Checkpoint 10 — selector fiscal no invasivo Delphi 7 / IBX / Firebird 2.5.
  - Si no se han instalado las tablas del nuevo modulo, conserva ASLAN.
  - Si existe un intento IDESI_API para la transaccion, bloquea cualquier
    redireccionamiento a ASLAN, incluso si el operador cambio el parametro.
  - No transmite, no calcula importes y no modifica datos.
  - CP10: utiliza su propia transaccion READ ONLY para no depender del estado
    de dmConectar.IBTransaction1 y no afectar las transacciones comerciales.
}

interface

uses
  IBDatabase, UEcfCanalConfig;

function ResolverCanalEcfTransaccion(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  const ARncEmisor: string; ANumeroTrn: Integer): TEcfCanalConfiguracion;

implementation

uses
  SysUtils, IBQuery, DB, UEcfApiIntento;

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

function ResolverCanalEcfTransaccion(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  const ARncEmisor: string; ANumeroTrn: Integer): TEcfCanalConfiguracion;
var
  TieneConfig, TieneIntentos: Boolean;
  Previo: TEcfApiIntento;
  TxLectura: TIBTransaction;
begin
  { Conservamos el parametro ATransaction para no modificar llamadas antiguas.
    No lo usamos: puede estar inactivo o pertenecer a una venta no confirmada.
    Todas las lecturas del selector utilizan una transaccion independiente. }
  if (ADatabase = nil) or (not ADatabase.Connected) then
    raise Exception.Create('Switch e-CF requiere conexion Firebird activa.');
  if ANumeroTrn <= 0 then
    raise Exception.Create('Numero de transaccion invalido para switch e-CF.');

  Result.RncEmisor := Trim(ARncEmisor);
  Result.Canal := ceAslan;
  Result.Ambiente := aeTest;
  Result.BaseUrl := '';
  Result.ClientId := '';

  TxLectura := TIBTransaction.Create(nil);
  try
    TxLectura.DefaultDatabase := ADatabase;
    TxLectura.Params.Clear;
    TxLectura.Params.Add('read_committed');
    TxLectura.Params.Add('rec_version');
    TxLectura.Params.Add('wait');
    TxLectura.Params.Add('read');
    TxLectura.StartTransaction;
    try
      TieneConfig := ExisteTablaEcf(ADatabase, TxLectura,
        'ECF_CANAL_CONFIG');
      TieneIntentos := ExisteTablaEcf(ADatabase, TxLectura,
        'ECF_API_INTENTO');

      { Compatibilidad para instalaciones anteriores a las migraciones. }
      if (TieneConfig or TieneIntentos) and
         (Trim(ARncEmisor) = '') then
        raise Exception.Create(
          'No se puede resolver switch e-CF: RNC emisor vacio.');

      if TieneConfig then
      begin
        Result := CargarConfiguracionCanalEcf(
          ADatabase, TxLectura, ARncEmisor);
      end;

      { CargarIntentoApiPorFactura realiza su propia lectura independiente.
        La identidad ya persistida nunca autoriza volver a ASLAN. }
      if TieneIntentos and (Trim(ARncEmisor) <> '') then
        if CargarIntentoApiPorFactura(ADatabase, ARncEmisor,
          ANumeroTrn, Previo) then
          raise Exception.Create(
            'La factura ya tiene un intento IDESI_API (ID=' +
            Previo.IdIntento + ', Estado=' + Previo.EstadoLocal + '). ' +
            'No reenviar por otro canal ni regenerar el body; conciliar.');

      if (Result.Canal = ceIdesiApi) and (not TieneIntentos) then
        raise Exception.Create(
          'Falta migracion ECF_API_INTENTO. Emision API bloqueada.');
    finally
      if TxLectura.InTransaction then
        TxLectura.Rollback;
    end;
  finally
    TxLectura.Free;
  end;
end;

end.
