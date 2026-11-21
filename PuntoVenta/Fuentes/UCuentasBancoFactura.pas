unit UCuentasBancoFactura;
interface
uses Classes, DB;
procedure CargarLineasCuentasBanco(AData: TDataSet; ALines: TStrings);
implementation
uses SysUtils;
procedure CargarLineasCuentasBanco(AData: TDataSet; ALines: TStrings);
var Banco, Titular, Cuenta: string;
begin
  ALines.Clear;
  if (AData = nil) or not AData.Active then Exit;
  AData.DisableControls;
  try
    AData.First;
    while not AData.Eof do
    begin
      Banco := Trim(AData.FieldByName('FACT_DESCBANCO').AsString);
      Titular := Trim(AData.FieldByName('FACT_TITLAR').AsString);
      Cuenta := Trim(AData.FieldByName('FACT_DESCNUMCTA').AsString);
      if (Banco <> '') or (Titular <> '') or (Cuenta <> '') then
      begin
        if ALines.Count > 0 then ALines.Add('');
        if Banco <> '' then ALines.Add(Banco);
        if Titular <> '' then ALines.Add(Titular);
        if Cuenta <> '' then ALines.Add(Cuenta);
      end;
      AData.Next;
    end;
  finally
    AData.First;
    AData.EnableControls;
  end;
end;
end.
