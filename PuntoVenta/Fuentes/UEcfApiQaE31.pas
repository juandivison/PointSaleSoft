unit UEcfApiQaE31;

{
  CP12-H3 - E31 TEST manual: validar y preparar una factura YA COMPROMETIDA.
  No hace POST. SOLO dmConectar.IBTransaction1; no crea transacciones.
  Permite CommitRetaining en transaccion global YA activa SOLO con
  autorizacion expresa de quien ejecuta la prueba manual.
  Una transaccion activa puede tener SELECTs; IBX no certifica que sea
  de solo lectura. CommitRetaining confirma TODOS los cambios pendientes.
}

interface

uses
  IBDatabase, UEcfApiIntento;

function PrepararE31TestDesdeFacturaConfirmada(
  ADatabase: TIBDatabase; ANumeroTrn: Integer;
  const AOutputDir: string;
  AAutorizarCommitRetaining: Boolean = False): TEcfApiIntento;

implementation

uses
  SysUtils, DB, IBQuery, UDatModConectar, UEcfApiPreparacionE31;

function PrepararE31TestDesdeFacturaConfirmada(
  ADatabase: TIBDatabase; ANumeroTrn: Integer;
  const AOutputDir: string;
  AAutorizarCommitRetaining: Boolean): TEcfApiIntento;
var
  Tx: TIBTransaction;
  Q: TIBQuery;
  Mensaje: string;
  ActivaAlEntrar: Boolean;
  SavepointCreado: Boolean;
  QControl: TIBQuery;

  procedure EjecutarControlTx(const ASql: string);
  begin
    QControl := TIBQuery.Create(nil);
    try
      QControl.Database := ADatabase;
      QControl.Transaction := Tx;
      QControl.SQL.Text := ASql;
      QControl.ExecSQL;
    finally
      QControl.Free;
    end;
  end;
begin
  if (dmConectar = nil) or
     (ADatabase <> dmConectar.IBDatabase1) or
     (ADatabase = nil) or (not ADatabase.Connected) or
     (ANumeroTrn <= 0) then
    raise Exception.Create('QA E31 requiere IBDatabase1 conectada y TRN valido.');
  Tx := dmConectar.IBTransaction1;
  if (Tx = nil) or (Tx.DefaultDatabase <> ADatabase) then
    raise Exception.Create('IBTransaction1 no esta vinculada a IBDatabase1.');
  ActivaAlEntrar := Tx.InTransaction;
  if ActivaAlEntrar and (not AAutorizarCommitRetaining) then
    raise Exception.Create('IBTransaction1 activa: requiere autorizar ' +
      'CommitRetaining de la transaccion global antes de preparar.');

  { Nunca confirmar una transaccion ajena silenciosamente. Si el operador
    autorizo la global activa, primero se confirma su estado previo;
    esta accion tambien confirma operaciones ajenas que estuvieran pendientes. }
  if ActivaAlEntrar then
    Tx.CommitRetaining
  else
    Tx.StartTransaction;
  SavepointCreado := False;
  try
    if ActivaAlEntrar then
    begin
      EjecutarControlTx('SAVEPOINT SP_ECF_API_PREPARAR');
      SavepointCreado := True;
    end;
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
        raise Exception.Create('E31 bloqueada por PROC_VALIDA_VENTA_PERSISTIDA: ' + Mensaje);
      end;
      Q.Close;
    finally
      Q.Free;
    end;

    Result := PrepararFacturaE31ParaApiTest(ADatabase,Tx,
      ANumeroTrn,AOutputDir);
    { La foto fiscal y el intento PREPARADO se confirman juntos ANTES del POST. }
    if ActivaAlEntrar then
      Tx.CommitRetaining
    else
      Tx.Commit;
  except
    on E: Exception do
    begin
      if ActivaAlEntrar then
      begin
        if SavepointCreado and Tx.InTransaction then
        begin
          try
            EjecutarControlTx('ROLLBACK TO SAVEPOINT SP_ECF_API_PREPARAR');
          except
            on E2: Exception do
              raise Exception.Create('Fallo al revertir el SAVEPOINT E31: ' +
                E2.Message + '. Error original: ' + E.Message);
          end;
        end;
      end
      else if Tx.InTransaction then
        Tx.Rollback;
      raise;
    end;
  end;
end;

end.
