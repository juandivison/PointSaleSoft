unit UClienteERPToLoanProcess;

interface

uses
  Windows, SysUtils, Classes, Registry, DB, IBDatabase, IBQuery;

//var
  // Si esta variable ya viene cargada desde otra unidad, la rutina la usa.
  // Si viene vacia, se intentara leer el valor GLBRUTADBLOAN del registro.
  //GLBRUTADBLOAN: string = '';

function SincronizarClienteERPALoanProcess(
  const ACodigoCliente: Integer;
  ADbERP: TIBDatabase;
  ATrERP: TIBTransaction;
  out AMsg: string
): Boolean;

function ObtenerRutaDbLoanProcess: string;

implementation
 uses UGlobal;
function TrimSafe(const S: string): string;
begin
  Result := Trim(S);
end;

function OnlyDigits(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;

function SeemsDbPath(const S: string): Boolean;
begin
  Result :=
    (Pos('\\', S) > 0) or
    (Pos('/', S) > 0) or
    (Pos(':', S) > 0);
end;

function ReadRegistryString(const ARootKey, AValueName: string): string;
var
  R: TRegistry;
begin
  Result := '';
  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;
    if R.OpenKeyReadOnly(ARootKey) then
    begin
      if R.ValueExists(AValueName) then
        Result := TrimSafe(R.ReadString(AValueName));
      R.CloseKey;
    end;
  finally
    R.Free;
  end;
end;

function ObtenerRutaDbLoanProcess: string;
var
  ValueName: string;
begin
  Result := '';

  if TrimSafe(GLBRUTADBLOAN) <> '' then
  begin
    if SeemsDbPath(TrimSafe(GLBRUTADBLOAN)) then
    begin
      Result := TrimSafe(GLBRUTADBLOAN);
      Exit;
    end
    else
      ValueName := TrimSafe(GLBRUTADBLOAN);
  end
  else
    ValueName := 'GLBRUTADBLOAN';

  Result := ReadRegistryString('Software\\IDESI S.A.\\LoadProcess', ValueName);

  if Result = '' then
    Result := ReadRegistryString('IDESI S.A.\\LoadProcess', ValueName);

  if (Result = '') and (CompareText(ValueName, 'GLBRUTADBLOAN') <> 0) then
  begin
    Result := ReadRegistryString('Software\\IDESI S.A.\\LoadProcess', 'GLBRUTADBLOAN');
    if Result = '' then
      Result := ReadRegistryString('IDESI S.A.\\LoadProcess', 'GLBRUTADBLOAN');
  end;
end;

procedure StartIfNeeded(ATrans: TIBTransaction; out AStartedHere: Boolean);
begin
  AStartedHere := False;
  if (ATrans <> nil) and (not ATrans.InTransaction) then
  begin
    ATrans.StartTransaction;
    AStartedHere := True;
  end;
end;

procedure CommitIfNeeded(ATrans: TIBTransaction; const AStartedHere: Boolean);
begin
  if (ATrans <> nil) and AStartedHere and ATrans.InTransaction then
    ATrans.Commit;
end;

procedure RollbackIfNeeded(ATrans: TIBTransaction; const AStartedHere: Boolean);
begin
  if (ATrans <> nil) and AStartedHere and ATrans.InTransaction then
    ATrans.Rollback;
end;

procedure AssignParamFromField(AParam: TParam; AField: TField);
begin
  if (AField = nil) or AField.IsNull then
    AParam.Clear
  else
    AParam.AssignField(AField);
end;

procedure AssignParamAsString(AQry: TIBQuery; const AParamName, AValue: string);
begin
  if TrimSafe(AValue) = '' then
    AQry.ParamByName(AParamName).Clear
  else
    AQry.ParamByName(AParamName).AsString := TrimSafe(AValue);
end;

procedure AssignParamAsInteger(AQry: TIBQuery; const AParamName: string; const AValue: Integer);
begin
  AQry.ParamByName(AParamName).AsInteger := AValue;
end;

function ObtenerCodigoClienteDestinoPorDocumento(
  AQry: TIBQuery;
  const ACedula, ARnc, APasaporte: string
): Integer;
begin
  Result := 0;
  AQry.Close;

  if TrimSafe(ACedula) <> '' then
  begin
    AQry.SQL.Text := 'select first 1 codigo from clientes where trim(cedula) = :PDOC';
    AQry.ParamByName('PDOC').AsString := TrimSafe(ACedula);
    AQry.Open;
    if not AQry.IsEmpty then
      Result := AQry.Fields[0].AsInteger;
    AQry.Close;
    if Result <> 0 then Exit;
  end;

  if TrimSafe(ARnc) <> '' then
  begin
    AQry.SQL.Text := 'select first 1 codigo from clientes where trim(rnc) = :PDOC';
    AQry.ParamByName('PDOC').AsString := TrimSafe(ARnc);
    AQry.Open;
    if not AQry.IsEmpty then
      Result := AQry.Fields[0].AsInteger;
    AQry.Close;
    if Result <> 0 then Exit;
  end;

  if TrimSafe(APasaporte) <> '' then
  begin
    AQry.SQL.Text := 'select first 1 codigo from clientes where trim(pasaporte) = :PDOC';
    AQry.ParamByName('PDOC').AsString := TrimSafe(APasaporte);
    AQry.Open;
    if not AQry.IsEmpty then
      Result := AQry.Fields[0].AsInteger;
    AQry.Close;
  end;
end;

function ObtenerNuevoCodigoClienteDestino(AQry: TIBQuery): Integer;
begin
  Result := 0;
  AQry.Close;
  AQry.SQL.Text := 'select gen_id(GEN_CODIGO_CTE, 1) as NUEVO_CODIGO from rdb$database';
  AQry.Open;
  if not AQry.IsEmpty then
    Result := AQry.FieldByName('NUEVO_CODIGO').AsInteger;
  AQry.Close;
end;

function SincronizarClienteERPALoanProcess(
  const ACodigoCliente: Integer;
  ADbERP: TIBDatabase;
  ATrERP: TIBTransaction;
  out AMsg: string
): Boolean;
var
  DbLoan: TIBDatabase;
  TrLoan: TIBTransaction;
  QSrc: TIBQuery;
  QDst: TIBQuery;
  RutaLoan: string;
  SrcStartedHere: Boolean;
  LoanStartedHere: Boolean;
  DocRncNumero: string;
  DocRncNumeroDigits: string;
  DocCedula: string;
  DocCedulaDigits: string;
  DocRnc: string;
  DocRncDigits: string;
  TargetCedula: string;
  TargetPasaporte: string;
  TargetRnc: string;
  CodigoDestino: Integer;
  ClienteExiste: Boolean;
begin
  Result := False;
  AMsg := '';

  if ADbERP = nil then
  begin
    AMsg := 'ADbERP es nil.';
    Exit;
  end;

  if ATrERP = nil then
  begin
    AMsg := 'ATrERP es nil.';
    Exit;
  end;

  RutaLoan := ObtenerRutaDbLoanProcess;
  if TrimSafe(RutaLoan) = '' then
  begin
    AMsg := 'No se pudo determinar la ruta de la base de datos LoanProcess. Revise GLBRUTADBLOAN o el registro.';
    Exit;
  end;

  DbLoan := TIBDatabase.Create(nil);
  TrLoan := TIBTransaction.Create(nil);
  QSrc := TIBQuery.Create(nil);
  QDst := TIBQuery.Create(nil);
  SrcStartedHere := False;
  LoanStartedHere := False;

  try
    StartIfNeeded(ATrERP, SrcStartedHere);

    QSrc.Database := ADbERP;
    QSrc.Transaction := ATrERP;
    QSrc.SQL.Text :=
      'select ' +
      '  CODIGO_CTE, TIPO_CLIENTE, FOTO, NOMBRE_CTE, CEDULA, RNC, RNC_NUMERO, ' +
      '  TELEF_CONTACTO, REFERENCIA, TELEF_REFERENCIA, OTRO_TELEFONO, FAX_CONTACTO, ' +
      '  CONDICION, LIMITE_CREDITO, EMAIL, WEBSITE, PAIS, CIUDAD, DIRECCION_CONT, ' +
      '  STATUS_CLIENTE, INSERTADO_POR, FECHA_INSERTADO, FECHA_MOD, MODI_POR, ' +
      '  CANT_DIAS_CREDITO, TIPO_NCF, OBSERVACION, LUGAR_DE_TRABAJO, ' +
      '  FECHA_NACIMIENTO, RUTA_FOTO ' +
      'from CLIENTES ' +
      'where CODIGO_CTE = :PCODIGO';
    QSrc.ParamByName('PCODIGO').AsInteger := ACodigoCliente;
    QSrc.Open;

    if QSrc.IsEmpty then
    begin
      AMsg := 'No existe el cliente ' + IntToStr(ACodigoCliente) + ' en PointSaleSoft.';
      Exit;
    end;

    DbLoan.LoginPrompt := False;
    DbLoan.SQLDialect := ADbERP.SQLDialect;
    DbLoan.Params.Assign(ADbERP.Params);
    DbLoan.DatabaseName := RutaLoan;
    DbLoan.DefaultTransaction := TrLoan;

    TrLoan.DefaultDatabase := DbLoan;

    DbLoan.Connected := True;
    StartIfNeeded(TrLoan, LoanStartedHere);

    QDst.Database := DbLoan;
    QDst.Transaction := TrLoan;

    DocRncNumero := TrimSafe(QSrc.FieldByName('RNC_NUMERO').AsString);
    DocRncNumeroDigits := OnlyDigits(DocRncNumero);

    DocCedula := TrimSafe(QSrc.FieldByName('CEDULA').AsString);
    DocCedulaDigits := OnlyDigits(DocCedula);

    DocRnc := TrimSafe(QSrc.FieldByName('RNC').AsString);
    DocRncDigits := OnlyDigits(DocRnc);

    TargetCedula := '';
    TargetPasaporte := '';
    TargetRnc := '';

    if DocCedulaDigits <> '' then
    begin
      if Length(DocCedulaDigits) = 11 then
        TargetCedula := DocCedula
      else
        TargetPasaporte := DocCedula;
    end;

    if DocRncDigits <> '' then
    begin
      if Length(DocRncDigits) = 9 then
        TargetRnc := DocRnc
      else if (TargetPasaporte = '') and (Length(DocRncDigits) <> 11) then
        TargetPasaporte := DocRnc;
    end;

    if DocRncNumeroDigits <> '' then
    begin
      if Length(DocRncNumeroDigits) = 9 then
        TargetRnc := DocRncNumero
      else if Length(DocRncNumeroDigits) = 11 then
        TargetCedula := DocRncNumero
      else
        TargetPasaporte := DocRncNumero;
    end;

    CodigoDestino := ObtenerCodigoClienteDestinoPorDocumento(QDst, TargetCedula, TargetRnc, TargetPasaporte);
    ClienteExiste := CodigoDestino <> 0;

    if not ClienteExiste then
    begin
      CodigoDestino := ObtenerNuevoCodigoClienteDestino(QDst);
      if CodigoDestino = 0 then
      begin
        AMsg := 'No se pudo obtener un nuevo codigo en LoanProcess usando GEN_CODIGO_CTE.';
        Exit;
      end;
    end;

    if ClienteExiste then
    begin
      QDst.SQL.Text :=
        'update CLIENTES set ' +
        '  TIPO_CLIENTE = :TIPO_CLIENTE, ' +
        '  FOTO = :FOTO, ' +
        '  NOMBRE = :NOMBRE, ' +
        '  CEDULA = :CEDULA, ' +
        '  PASAPORTE = :PASAPORTE, ' +
        '  RNC = :RNC, ' +
        '  TELEF_CONTACTO = :TELEF_CONTACTO, ' +
        '  REFERENCIA = :REFERENCIA, ' +
        '  TELEF_REFERENCIA = :TELEF_REFERENCIA, ' +
        '  OTRO_TELEFONO = :OTRO_TELEFONO, ' +
        '  FAX_CONTACTO = :FAX_CONTACTO, ' +
        '  CONDICION = :CONDICION, ' +
        '  LIMITE_CREDITO = :LIMITE_CREDITO, ' +
        '  EMAIL = :EMAIL, ' +
        '  WEBSITE = :WEBSITE, ' +
        '  PAIS = :PAIS, ' +
        '  CIUDAD = :CIUDAD, ' +
        '  DIRECCION_REAL = :DIRECCION_REAL, ' +
        '  DIRECCION_LOCAL = :DIRECCION_LOCAL, ' +
        '  STATUS_CLIENTE = :STATUS_CLIENTE, ' +
        '  INSERTADO_POR = :INSERTADO_POR, ' +
        '  FECHA_INSERTADO = :FECHA_INSERTADO, ' +
        '  FECHA_MOD = :FECHA_MOD, ' +
        '  MODI_POR = :MODI_POR, ' +
        '  CANT_DIAS_CREDITO = :CANT_DIAS_CREDITO, ' +
        '  TIPO_NCF = :TIPO_NCF, ' +
        '  OBSERVACION = :OBSERVACION, ' +
        '  LUGAR_DE_TRABAJO = :LUGAR_DE_TRABAJO, ' +
        '  FECHA_NACIMIENTO = :FECHA_NACIMIENTO, ' +
        '  RUTA_FOTO = :RUTA_FOTO ' +
        'where CODIGO = :CODIGO';
    end
    else
    begin
      QDst.SQL.Text :=
        'insert into CLIENTES ( ' +
        '  CODIGO, TIPO_CLIENTE, FOTO, NOMBRE, CEDULA, PASAPORTE, RNC, ' +
        '  TELEF_CONTACTO, REFERENCIA, TELEF_REFERENCIA, OTRO_TELEFONO, FAX_CONTACTO, ' +
        '  CONDICION, LIMITE_CREDITO, EMAIL, WEBSITE, PAIS, CIUDAD, ' +
        '  DIRECCION_REAL, DIRECCION_LOCAL, STATUS_CLIENTE, INSERTADO_POR, ' +
        '  FECHA_INSERTADO, FECHA_MOD, MODI_POR, CANT_DIAS_CREDITO, TIPO_NCF, ' +
        '  OBSERVACION, LUGAR_DE_TRABAJO, FECHA_NACIMIENTO, RUTA_FOTO ' +
        ') values ( ' +
        '  :CODIGO, :TIPO_CLIENTE, :FOTO, :NOMBRE, :CEDULA, :PASAPORTE, :RNC, ' +
        '  :TELEF_CONTACTO, :REFERENCIA, :TELEF_REFERENCIA, :OTRO_TELEFONO, :FAX_CONTACTO, ' +
        '  :CONDICION, :LIMITE_CREDITO, :EMAIL, :WEBSITE, :PAIS, :CIUDAD, ' +
        '  :DIRECCION_REAL, :DIRECCION_LOCAL, :STATUS_CLIENTE, :INSERTADO_POR, ' +
        '  :FECHA_INSERTADO, :FECHA_MOD, :MODI_POR, :CANT_DIAS_CREDITO, :TIPO_NCF, ' +
        '  :OBSERVACION, :LUGAR_DE_TRABAJO, :FECHA_NACIMIENTO, :RUTA_FOTO ' +
        ')';
    end;

    AssignParamAsInteger(QDst, 'CODIGO', CodigoDestino);
    AssignParamFromField(QDst.ParamByName('TIPO_CLIENTE'), QSrc.FieldByName('TIPO_CLIENTE'));
    AssignParamFromField(QDst.ParamByName('FOTO'), QSrc.FieldByName('FOTO'));
    AssignParamAsString(QDst, 'NOMBRE', QSrc.FieldByName('NOMBRE_CTE').AsString);
    AssignParamAsString(QDst, 'CEDULA', TargetCedula);
    AssignParamAsString(QDst, 'PASAPORTE', TargetPasaporte);
    AssignParamAsString(QDst, 'RNC', TargetRnc);
    AssignParamFromField(QDst.ParamByName('TELEF_CONTACTO'), QSrc.FieldByName('TELEF_CONTACTO'));
    AssignParamFromField(QDst.ParamByName('REFERENCIA'), QSrc.FieldByName('REFERENCIA'));
    AssignParamFromField(QDst.ParamByName('TELEF_REFERENCIA'), QSrc.FieldByName('TELEF_REFERENCIA'));
    AssignParamFromField(QDst.ParamByName('OTRO_TELEFONO'), QSrc.FieldByName('OTRO_TELEFONO'));
    AssignParamFromField(QDst.ParamByName('FAX_CONTACTO'), QSrc.FieldByName('FAX_CONTACTO'));
    AssignParamFromField(QDst.ParamByName('CONDICION'), QSrc.FieldByName('CONDICION'));
    AssignParamFromField(QDst.ParamByName('LIMITE_CREDITO'), QSrc.FieldByName('LIMITE_CREDITO'));
    AssignParamFromField(QDst.ParamByName('EMAIL'), QSrc.FieldByName('EMAIL'));
    AssignParamFromField(QDst.ParamByName('WEBSITE'), QSrc.FieldByName('WEBSITE'));
    AssignParamFromField(QDst.ParamByName('PAIS'), QSrc.FieldByName('PAIS'));
    AssignParamFromField(QDst.ParamByName('CIUDAD'), QSrc.FieldByName('CIUDAD'));
    AssignParamFromField(QDst.ParamByName('DIRECCION_REAL'), QSrc.FieldByName('DIRECCION_CONT'));
    AssignParamFromField(QDst.ParamByName('DIRECCION_LOCAL'), QSrc.FieldByName('DIRECCION_CONT'));
    AssignParamFromField(QDst.ParamByName('STATUS_CLIENTE'), QSrc.FieldByName('STATUS_CLIENTE'));
    AssignParamFromField(QDst.ParamByName('INSERTADO_POR'), QSrc.FieldByName('INSERTADO_POR'));
    AssignParamFromField(QDst.ParamByName('FECHA_INSERTADO'), QSrc.FieldByName('FECHA_INSERTADO'));
    AssignParamFromField(QDst.ParamByName('FECHA_MOD'), QSrc.FieldByName('FECHA_MOD'));
    AssignParamFromField(QDst.ParamByName('MODI_POR'), QSrc.FieldByName('MODI_POR'));
    AssignParamFromField(QDst.ParamByName('CANT_DIAS_CREDITO'), QSrc.FieldByName('CANT_DIAS_CREDITO'));
    AssignParamFromField(QDst.ParamByName('TIPO_NCF'), QSrc.FieldByName('TIPO_NCF'));
    AssignParamFromField(QDst.ParamByName('OBSERVACION'), QSrc.FieldByName('OBSERVACION'));
    AssignParamFromField(QDst.ParamByName('LUGAR_DE_TRABAJO'), QSrc.FieldByName('LUGAR_DE_TRABAJO'));
    AssignParamFromField(QDst.ParamByName('FECHA_NACIMIENTO'), QSrc.FieldByName('FECHA_NACIMIENTO'));
    AssignParamFromField(QDst.ParamByName('RUTA_FOTO'), QSrc.FieldByName('RUTA_FOTO'));

    QDst.ExecSQL;

    CommitIfNeeded(TrLoan, LoanStartedHere);
    CommitIfNeeded(ATrERP, SrcStartedHere);

    Result := True;
    if ClienteExiste then
      AMsg := 'Cliente ' + IntToStr(ACodigoCliente) + ' sincronizado en LoanProcess. Codigo destino existente: ' + IntToStr(CodigoDestino) + '.'
    else
      AMsg := 'Cliente ' + IntToStr(ACodigoCliente) + ' insertado en LoanProcess con codigo destino ' + IntToStr(CodigoDestino) + '.';
  except
    on E: Exception do
    begin
      RollbackIfNeeded(TrLoan, LoanStartedHere);
      RollbackIfNeeded(ATrERP, SrcStartedHere);
      AMsg := 'Error sincronizando cliente a LoanProcess: ' + E.Message;
      Result := False;
    end;
  end;

  QSrc.Free;
  QDst.Free;
  TrLoan.Free;
  DbLoan.Free;
end;

end.
