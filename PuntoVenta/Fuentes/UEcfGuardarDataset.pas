unit UEcfGuardarDataset;
interface
uses DB, IBDatabase, IBCustomDataSet;
procedure GuardarDatasetEcf(ADataSet: TIBDataSet);
implementation
uses SysUtils;
procedure GuardarDatasetEcf(ADataSet: TIBDataSet);
begin
  if ADataSet = nil then raise Exception.Create('No existe dataset de gastos.');
  if not (ADataSet.State in [dsEdit, dsInsert]) and not ADataSet.UpdatesPending then Exit;
  if not ADataSet.Transaction.InTransaction then ADataSet.Transaction.StartTransaction;
  try
    if ADataSet.State in [dsEdit, dsInsert] then ADataSet.Post;
    if ADataSet.UpdatesPending then ADataSet.ApplyUpdates;
    ADataSet.Transaction.CommitRetaining;
  except
    // La excepcion original debe llegar a la pantalla: no afirmar que se guardo.
    if ADataSet.Transaction.InTransaction then
      ADataSet.Transaction.RollbackRetaining;
    ADataSet.CancelUpdates;
    raise;
  end;
end;
end.
