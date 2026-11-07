unit UEcfApiQaE31;

{
  Checkpoint 9 — preparacion MANUAL para QA E31, nunca emite.
  Ejecutar contra una factura TEST previamente comprometida en la BD.
  Valida PROC_VALIDA_VENTA_PERSISTIDA y crea un intento persistido una sola vez.
  Usa una transaccion IBX propia, de solo lectura, para el snapshot.
}

interface

uses
  IBDatabase, UEcfApiIntento;

function PrepararE31TestDesdeFacturaConfirmada(
  ADatabase: TIBDatabase; ANumeroTrn: Integer;
  const AOutputDir: string): TEcfApiIntento;

implementation

uses
  SysUtils, DB, IBQuery, UEcfApiPreparacionE31;

function PrepararE31TestDesdeFacturaConfirmada(
  ADatabase: TIBDatabase; ANumeroTrn: Integer;
  const AOutputDir: string): TEcfApiIntento;
var
  Tx: TIBTransaction;
  Q: TIBQuery;
  Mensaje: string;
begin
  if (ADatabase = nil) or (not ADatabase.Connected) or
     (ANumeroTrn <= 0) then
    raise Exception.Create('QA E31 requiere BD conectada y transaccion valida.');

  Tx := TIBTransaction.Create(nil);
  try
    Tx.DefaultDatabase := ADatabase;
    Tx.Params.Clear;
    Tx.Params.Add('read_committed');
    Tx.Params.Add('rec_version');
    Tx.Params.Add('wait');
    Tx.Params.Add('read');
    Tx.StartTransaction;

    Q := TIBQuery.Create(nil);
    try
      Q.Database := ADatabase;
      Q.Transaction := Tx;
      Q.SQL.Text :=
        'SELECT VALIDA, MENSAJE ' +
        'FROM PROC_VALIDA_VENTA_PERSISTIDA(:P_NUMERO)';
      Q.ParamByName('P_NUMERO').AsInteger := ANumeroTrn;
      Q.Open;
      if Q.Eof then
        raise Exception.Create('Validacion persistida no devolvio filas.');
      if Q.FieldByName('VALIDA').AsInteger <> 1 then
      begin
        Mensaje := Trim(Q.FieldByName('MENSAJE').AsString);
        raise Exception.Create(
          'E31 bloqueada por PROC_VALIDA_VENTA_PERSISTIDA: ' + Mensaje);
      end;
      Q.Close;
    finally
      Q.Free;
    end;

    Result := PrepararFacturaE31ParaApiTest(ADatabase, Tx,
      ANumeroTrn, AOutputDir);
  finally
    if Tx.InTransaction then
      Tx.Rollback;
    Tx.Free;
  end;
end;

end.
