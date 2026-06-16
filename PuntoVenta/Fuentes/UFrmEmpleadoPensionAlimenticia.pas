unit UFrmEmpleadoPensionAlimenticia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, DB, IBDatabase, IBQuery,
  IBCustomDataSet, RxLookup, RxDBCtrl,
  Grids, DBGrids;

type
  TfrmEmpleadoPensionAlimenticia = class(TForm)
    pnlTop: TPanel;
    lblTitulo: TLabel;
    lblSubTitulo: TLabel;
    pnlBottom: TPanel;
    btnGuardar: TButton;
    btnNuevo: TButton;
    btnInactivar: TButton;
    btnReactivar: TButton;
    btnCerrar: TButton;
    pnlDatos: TPanel;
    lblCiaKey: TLabel;
    lkpCompania: TRxDBLookupCombo;
    lblCodigoEmp: TLabel;
    lkpEmpleado: TRxDBLookupCombo;
    btnBuscarEmpleado: TButton;
    lblBeneficiario: TLabel;
    edtBeneficiario: TEdit;
    lblDocumento: TLabel;
    edtDocumento: TEdit;
    lblConcepto: TLabel;
    edtConcepto: TEdit;
    lblMonto: TLabel;
    edtMonto: TEdit;
    lblQuincena: TLabel;
    cbQuincena: TComboBox;
    lblFechaInicio: TLabel;
    dtpFechaInicio: TDateTimePicker;
    lblFechaFin: TLabel;
    dtpFechaFin: TDateTimePicker;
    lblTextoLibre: TLabel;
    edtTextoLibre: TEdit;
    lblEstado: TLabel;
    cbVigente: TCheckBox;
    lblSalarioEmpleado: TLabel;
    edtSalarioEmpleado: TEdit;
    pnlGrid: TPanel;
    lblGrid: TLabel;
    grdPensiones: TRxDBGrid;
    dsEmpleadoLookup: TDataSource;
    dsCompaniaLookup: TDataSource;
    dsPension: TDataSource;
    qryEmpleadoLookup: TIBQuery;
    qryCompaniaLookup: TIBQuery;
    qryPension: TIBQuery;
    qryExec: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnInactivarClick(Sender: TObject);
    procedure btnReactivarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnBuscarEmpleadoClick(Sender: TObject);
    procedure lkpEmpleadoChange(Sender: TObject);
    procedure lkpCompaniaChange(Sender: TObject);
    procedure grdPensionesDblClick(Sender: TObject);
  private
    FDatabase: TIBDatabase;
    FTransaction: TIBTransaction;
    FCurrentId: Integer;
    FIdField: string;
    FCiaFieldName: string;
    FDocumentoField: string;
    FObservacionField: string;
    FCompaniaNameField: string;
    FHasStatusField: Boolean;
    FFechaInicioFieldExists: Boolean;
    FFechaFinFieldExists: Boolean;
    FInPorFieldExists: Boolean;
    FModPorFieldExists: Boolean;
    FLoading: Boolean;

    procedure ConfigureQueries;
    procedure IniciarTransaccionSiNecesario;
    procedure CargarCatalogos;
    procedure CargarCompanias;
    procedure AsignarCompaniaDefault;
    procedure CargarEmpleados(const AFiltro: string);
    procedure RefrescarGrid;
    procedure LimpiarCampos;
    procedure ValidarAntesDeGuardar;
    procedure GuardarPension;
    procedure InsertarPension;
    procedure ActualizarPension;
    procedure CambiarEstadoPension(const AVigente: Boolean);
    procedure CargarPensionSeleccionada;
    procedure AplicarEmpleadoSeleccionado;
    procedure DetectarEstructuraTabla;
    procedure MostrarSalarioEmpleado;

    function FieldExists(const ATableName, AFieldName: string): Boolean;
    function FirstExistingField(const ATableName: string;
      const AFields: array of string): string;
    function GetQuincenaDescuento: Integer;
    function GetCodigoEmpleadoSeleccionado: Integer;
    function GetCodigoCiaSeleccionada: Integer;
    function GetSalarioEmpleadoSeleccionado: Double;
    function GetTotalPensionesVigentesEmpleado(ACodigoEmp, AQuincena: Integer;
      AExceptId: Integer): Double;
    function StrToFloatSeguro(const AValue, AFieldName: string): Double;
    function UsuarioActual: string;
    function LookupValueAsString(ALookup: TRxDBLookupCombo): string;
    function DataSetFieldAsText(ADataSet: TDataSet;
      const AFieldName: string): string;
    function SqlQuote(const S: string): string;
    function StatusWhereExpr(const AAlias: string): string;
  public
    property Database: TIBDatabase read FDatabase write FDatabase;
    property Transaction: TIBTransaction read FTransaction write FTransaction;
  end;

var
  frmEmpleadoPensionAlimenticia: TfrmEmpleadoPensionAlimenticia;

implementation

uses
  UDatModConectar;

{$R *.dfm}

procedure TfrmEmpleadoPensionAlimenticia.FormCreate(Sender: TObject);
begin
  if not Assigned(FDatabase) then
    FDatabase := dmConectar.IBDatabase1;

  if not Assigned(FTransaction) then
    FTransaction := dmConectar.IBTransaction1;

  FCurrentId := 0;
  FLoading := False;

  ConfigureQueries;
  DetectarEstructuraTabla;

  if cbQuincena.Items.Count = 0 then
  begin
    cbQuincena.Items.Add('1 - Primera quincena');
    cbQuincena.Items.Add('2 - Segunda quincena');
    cbQuincena.Items.Add('3 - Ambas quincenas');
  end;

  CargarCatalogos;
  LimpiarCampos;
  RefrescarGrid;
end;

procedure TfrmEmpleadoPensionAlimenticia.ConfigureQueries;
begin
  qryEmpleadoLookup.Database := FDatabase;
  qryEmpleadoLookup.Transaction := FTransaction;

  qryCompaniaLookup.Database := FDatabase;
  qryCompaniaLookup.Transaction := FTransaction;

  qryPension.Database := FDatabase;
  qryPension.Transaction := FTransaction;

  qryExec.Database := FDatabase;
  qryExec.Transaction := FTransaction;
end;

procedure TfrmEmpleadoPensionAlimenticia.IniciarTransaccionSiNecesario;
begin
  if not Assigned(FDatabase) then
    raise Exception.Create('No se ha asignado Database al formulario.');

  if not Assigned(FTransaction) then
    raise Exception.Create('No se ha asignado Transaction al formulario.');

  if not FDatabase.Connected then
    FDatabase.Connected := True;

  if not FTransaction.InTransaction then
    FTransaction.StartTransaction;
end;

function TfrmEmpleadoPensionAlimenticia.FieldExists(const ATableName,
  AFieldName: string): Boolean;
var
  Q: TIBQuery;
begin
  Result := False;
  IniciarTransaccionSiNecesario;

  Q := TIBQuery.Create(nil);
  try
    Q.Database := FDatabase;
    Q.Transaction := FTransaction;
    Q.SQL.Clear;
    Q.SQL.Add('select 1');
    Q.SQL.Add('from rdb$relation_fields rf');
    Q.SQL.Add('where upper(trim(rf.rdb$relation_name)) = :tabla');
    Q.SQL.Add('and upper(trim(rf.rdb$field_name)) = :campo');
    Q.ParamByName('tabla').AsString := UpperCase(Trim(ATableName));
    Q.ParamByName('campo').AsString := UpperCase(Trim(AFieldName));
    Q.Open;
    Result := not Q.Eof;
  finally
    Q.Free;
  end;
end;

function TfrmEmpleadoPensionAlimenticia.FirstExistingField(
  const ATableName: string; const AFields: array of string): string;
var
  I: Integer;
begin
  Result := '';
  for I := Low(AFields) to High(AFields) do
  begin
    if FieldExists(ATableName, AFields[I]) then
    begin
      Result := UpperCase(AFields[I]);
      Exit;
    end;
  end;
end;

procedure TfrmEmpleadoPensionAlimenticia.DetectarEstructuraTabla;
begin
  FIdField := FirstExistingField('EMPLEADO_PENSION_ALIMENTICIA',
    ['ID', 'ID_PENSION']);

  if FIdField = '' then
    raise Exception.Create('EMPLEADO_PENSION_ALIMENTICIA no tiene ID.');

  FCiaFieldName := FirstExistingField('EMPLEADO_PENSION_ALIMENTICIA',
    ['CODIGO_CIA', 'CIA_KEY']);

  FDocumentoField := FirstExistingField('EMPLEADO_PENSION_ALIMENTICIA',
    ['DOCUMENTO_BENEFICIARIO', 'DOCUMENTO_BENEF',
     'CEDULA_BENEFICIARIO']);

  FObservacionField := FirstExistingField('EMPLEADO_PENSION_ALIMENTICIA',
    ['TEXTO_LIBRE', 'OBSERVACION']);

  FCompaniaNameField := FirstExistingField('COMPANIA',
    ['NOMBRE', 'NOMBRE_CIA', 'DESCRIPCION', 'RAZON_SOCIAL']);

  FHasStatusField := FieldExists('EMPLEADO_PENSION_ALIMENTICIA', 'STATUS');
  if not FHasStatusField then
    raise Exception.Create('EMPLEADO_PENSION_ALIMENTICIA debe tener el campo STATUS.');
  FFechaInicioFieldExists := FieldExists('EMPLEADO_PENSION_ALIMENTICIA',
    'FECHA_INICIO');
  FFechaFinFieldExists := FieldExists('EMPLEADO_PENSION_ALIMENTICIA',
    'FECHA_FIN');
  FInPorFieldExists := FieldExists('EMPLEADO_PENSION_ALIMENTICIA', 'IN_POR');
  FModPorFieldExists := FieldExists('EMPLEADO_PENSION_ALIMENTICIA',
    'MOD_POR');
end;

procedure TfrmEmpleadoPensionAlimenticia.CargarCatalogos;
begin
  FLoading := True;
  try
    CargarCompanias;
    AsignarCompaniaDefault;
  finally
    FLoading := False;
  end;

  CargarEmpleados('');
end;

procedure TfrmEmpleadoPensionAlimenticia.CargarCompanias;
begin
  IniciarTransaccionSiNecesario;
  qryCompaniaLookup.Close;
  qryCompaniaLookup.SQL.Clear;

  try
    qryCompaniaLookup.SQL.Add('select c.codigo,');

    if FCompaniaNameField <> '' then
    begin
      qryCompaniaLookup.SQL.Add('       cast(c.codigo as varchar(20)) ||');
      qryCompaniaLookup.SQL.Add('       '' - '' || coalesce(c.' + FCompaniaNameField + ', '''')');
      qryCompaniaLookup.SQL.Add('       nombre_cia');
    end
    else
      qryCompaniaLookup.SQL.Add('       cast(c.codigo as varchar(20)) nombre_cia');

    qryCompaniaLookup.SQL.Add('from compania c');
    qryCompaniaLookup.SQL.Add('order by c.codigo');
    qryCompaniaLookup.Open;
  except
    on E: Exception do
    begin
      qryCompaniaLookup.Close;
      qryCompaniaLookup.SQL.Clear;
      qryCompaniaLookup.SQL.Add('select 1 codigo,');
      qryCompaniaLookup.SQL.Add('       ''1 - COMPANIA 1'' nombre_cia');
      qryCompaniaLookup.SQL.Add('from rdb$database');
      qryCompaniaLookup.Open;
    end;
  end;
end;

procedure TfrmEmpleadoPensionAlimenticia.AsignarCompaniaDefault;
begin
  if not qryCompaniaLookup.Active or qryCompaniaLookup.IsEmpty then
    Exit;

  if qryCompaniaLookup.Locate('CODIGO', 1, []) then
  begin
    try
      lkpCompania.Value := '1';
    except
    end;
  end
  else
  begin
    qryCompaniaLookup.First;
    try
      lkpCompania.Value := qryCompaniaLookup.FieldByName('CODIGO').AsString;
    except
    end;
  end;
end;

function TfrmEmpleadoPensionAlimenticia.SqlQuote(const S: string): string;
begin
  Result := '''' + StringReplace(S, '''', '''''', [rfReplaceAll]) + '''';
end;

procedure TfrmEmpleadoPensionAlimenticia.CargarEmpleados(const AFiltro: string);
var
  Filtro: string;
  Cia: Integer;
begin
  IniciarTransaccionSiNecesario;

  Filtro := Copy(Trim(AFiltro), 1, 60);
  Cia := GetCodigoCiaSeleccionada;
  if Cia <= 0 then
    Cia := 1;

  qryEmpleadoLookup.Close;
  qryEmpleadoLookup.SQL.Clear;
  qryEmpleadoLookup.SQL.Add('select e.codigo, e.codigo_cia, e.cedula,');
  qryEmpleadoLookup.SQL.Add('       e.nombre, e.apellido, e.salario,');
  qryEmpleadoLookup.SQL.Add('       cast(e.codigo as varchar(20)) || '' - '' ||');
  qryEmpleadoLookup.SQL.Add('       coalesce(e.nombre, '''') || '' '' ||');
  qryEmpleadoLookup.SQL.Add('       coalesce(e.apellido, '''') || '' | '' ||');
  qryEmpleadoLookup.SQL.Add('       coalesce(e.cedula, '''') nombre_completo');
  qryEmpleadoLookup.SQL.Add('from empleado e');
  qryEmpleadoLookup.SQL.Add('where e.codigo_cia = :codigo_cia');

  if Filtro <> '' then
  begin
    Filtro := UpperCase(Filtro);
    qryEmpleadoLookup.SQL.Add('and (cast(e.codigo as varchar(20)) containing ');
    qryEmpleadoLookup.SQL.Add(SqlQuote(Filtro));
    qryEmpleadoLookup.SQL.Add('or upper(coalesce(e.cedula, '''')) containing ');
    qryEmpleadoLookup.SQL.Add(SqlQuote(Filtro));
    qryEmpleadoLookup.SQL.Add('or upper(coalesce(e.nombre, '''')) containing ');
    qryEmpleadoLookup.SQL.Add(SqlQuote(Filtro));
    qryEmpleadoLookup.SQL.Add('or upper(coalesce(e.apellido, '''')) containing ');
    qryEmpleadoLookup.SQL.Add(SqlQuote(Filtro) + ')');
  end;

  qryEmpleadoLookup.SQL.Add('order by e.nombre, e.apellido');
  qryEmpleadoLookup.ParamByName('codigo_cia').AsInteger := Cia;
  qryEmpleadoLookup.Open;
end;

function TfrmEmpleadoPensionAlimenticia.StatusWhereExpr(
  const AAlias: string): string;
begin
  Result := 'coalesce(' + AAlias + '.status, ''A'') = ''A''';
end;

procedure TfrmEmpleadoPensionAlimenticia.RefrescarGrid;
begin
  IniciarTransaccionSiNecesario;
  qryPension.Close;
  qryPension.SQL.Clear;

  qryPension.SQL.Add('select p.' + FIdField + ' id_pension,');
  qryPension.SQL.Add('       p.codigo_emp,');

  if FCiaFieldName <> '' then
    qryPension.SQL.Add('       coalesce(p.' + FCiaFieldName + ', e.codigo_cia) codigo_cia,')
  else
    qryPension.SQL.Add('       e.codigo_cia codigo_cia,');

  if FCompaniaNameField <> '' then
    qryPension.SQL.Add('       coalesce(c.' + FCompaniaNameField + ', '''') compania,')
  else
    qryPension.SQL.Add('       cast(null as varchar(120)) compania,');
  qryPension.SQL.Add('       coalesce(e.nombre, '''') || '' '' ||');
  qryPension.SQL.Add('       coalesce(e.apellido, '''') empleado,');
  qryPension.SQL.Add('       p.beneficiario,');

  if FDocumentoField <> '' then
    qryPension.SQL.Add('       p.' + FDocumentoField + ' cedula_beneficiario,')
  else
    qryPension.SQL.Add('       cast(null as varchar(30)) cedula_beneficiario,');

  qryPension.SQL.Add('       p.concepto, p.monto, p.quincena_descuento,');

  if FFechaInicioFieldExists then
    qryPension.SQL.Add('       p.fecha_inicio,')
  else
    qryPension.SQL.Add('       cast(null as timestamp) fecha_inicio,');

  if FFechaFinFieldExists then
    qryPension.SQL.Add('       p.fecha_fin,')
  else
    qryPension.SQL.Add('       cast(null as timestamp) fecha_fin,');

  qryPension.SQL.Add('       coalesce(p.status, ''A'') status,');
  qryPension.SQL.Add('       case when coalesce(p.status, ''A'') = ''A''');
  qryPension.SQL.Add('            then ''Vigente'' else ''Inactiva'' end estado,');

  if FObservacionField <> '' then
    qryPension.SQL.Add('       p.' + FObservacionField + ' observacion')
  else
    qryPension.SQL.Add('       cast(null as varchar(120)) observacion');

  qryPension.SQL.Add('from empleado_pension_alimenticia p');
  qryPension.SQL.Add('left join empleado e on e.codigo = p.codigo_emp');

  if FCiaFieldName <> '' then
    qryPension.SQL.Add('left join compania c on c.codigo = coalesce(p.' +
      FCiaFieldName + ', e.codigo_cia)')
  else
    qryPension.SQL.Add('left join compania c on c.codigo = e.codigo_cia');

  qryPension.SQL.Add('order by p.codigo_emp, p.beneficiario');
  qryPension.Open;
end;

procedure TfrmEmpleadoPensionAlimenticia.LimpiarCampos;
begin
  FCurrentId := 0;

  FLoading := True;
  try
    AsignarCompaniaDefault;
  finally
    FLoading := False;
  end;

  CargarEmpleados('');

  if qryEmpleadoLookup.Active and not qryEmpleadoLookup.IsEmpty then
  begin
    qryEmpleadoLookup.First;
    try
      lkpEmpleado.Value := qryEmpleadoLookup.FieldByName('CODIGO').AsString;
    except
    end;
  end;

  edtBeneficiario.Clear;
  edtDocumento.Clear;
  edtConcepto.Text := 'Pension alimenticia';
  edtMonto.Text := '0.00';
  edtTextoLibre.Clear;
  cbVigente.Checked := True;

  if cbQuincena.Items.Count > 0 then
    cbQuincena.ItemIndex := 0;

  dtpFechaInicio.Date := Date;
  dtpFechaInicio.Checked := True;
  dtpFechaFin.Date := Date;
  dtpFechaFin.Checked := False;
  MostrarSalarioEmpleado;
end;

function TfrmEmpleadoPensionAlimenticia.LookupValueAsString(
  ALookup: TRxDBLookupCombo): string;
begin
  Result := Trim(VarToStr(ALookup.Value));
end;

function TfrmEmpleadoPensionAlimenticia.DataSetFieldAsText(ADataSet: TDataSet;
  const AFieldName: string): string;
begin
  Result := '';
  if (ADataSet <> nil) and (ADataSet.FindField(AFieldName) <> nil) and
     (not ADataSet.FieldByName(AFieldName).IsNull) then
    Result := Trim(ADataSet.FieldByName(AFieldName).AsString);
end;

function TfrmEmpleadoPensionAlimenticia.GetCodigoEmpleadoSeleccionado: Integer;
var
  S: string;
begin
  S := LookupValueAsString(lkpEmpleado);
  Result := StrToIntDef(S, 0);

  if (Result = 0) and qryEmpleadoLookup.Active and
     (not qryEmpleadoLookup.IsEmpty) then
    Result := qryEmpleadoLookup.FieldByName('CODIGO').AsInteger;
end;

function TfrmEmpleadoPensionAlimenticia.GetCodigoCiaSeleccionada: Integer;
var
  S: string;
begin
  S := LookupValueAsString(lkpCompania);
  Result := StrToIntDef(S, 0);

  if (Result = 0) and qryCompaniaLookup.Active and
     (not qryCompaniaLookup.IsEmpty) then
    Result := qryCompaniaLookup.FieldByName('CODIGO').AsInteger;
end;

function TfrmEmpleadoPensionAlimenticia.GetQuincenaDescuento: Integer;
begin
  Result := cbQuincena.ItemIndex + 1;
  if Result < 1 then
    Result := 1;
end;

function TfrmEmpleadoPensionAlimenticia.GetSalarioEmpleadoSeleccionado: Double;
var
  CodigoEmp: Integer;
  Q: TIBQuery;
begin
  Result := 0;

  if qryEmpleadoLookup.Active and not qryEmpleadoLookup.IsEmpty then
  begin
    CodigoEmp := GetCodigoEmpleadoSeleccionado;
    if CodigoEmp > 0 then
      qryEmpleadoLookup.Locate('CODIGO', CodigoEmp, []);

    if qryEmpleadoLookup.FindField('SALARIO') <> nil then
    begin
      if not qryEmpleadoLookup.FieldByName('SALARIO').IsNull then
      begin
        Result := qryEmpleadoLookup.FieldByName('SALARIO').AsFloat;
        Exit;
      end;
    end;
  end;

  CodigoEmp := GetCodigoEmpleadoSeleccionado;
  if CodigoEmp <= 0 then
    Exit;

  Q := TIBQuery.Create(nil);
  try
    Q.Database := FDatabase;
    Q.Transaction := FTransaction;
    Q.SQL.Clear;
    Q.SQL.Add('select salario');
    Q.SQL.Add('from empleado');
    Q.SQL.Add('where codigo = :codigo');
    Q.ParamByName('codigo').AsInteger := CodigoEmp;
    Q.Open;
    if not Q.Eof and not Q.FieldByName('SALARIO').IsNull then
      Result := Q.FieldByName('SALARIO').AsFloat;
  finally
    Q.Free;
  end;
end;

function TfrmEmpleadoPensionAlimenticia.GetTotalPensionesVigentesEmpleado(
  ACodigoEmp, AQuincena: Integer; AExceptId: Integer): Double;
var
  Q: TIBQuery;
begin
  Result := 0;
  if ACodigoEmp <= 0 then
    Exit;

  Q := TIBQuery.Create(nil);
  try
    Q.Database := FDatabase;
    Q.Transaction := FTransaction;
    Q.SQL.Clear;
    Q.SQL.Add('select coalesce(sum(p.monto), 0) total_pension');
    Q.SQL.Add('from empleado_pension_alimenticia p');
    Q.SQL.Add('where p.codigo_emp = :codigo_emp');
    Q.SQL.Add('and ' + StatusWhereExpr('p'));

    if FIdField <> '' then
      Q.SQL.Add('and p.' + FIdField + ' <> :id_actual');

    if AQuincena = 1 then
      Q.SQL.Add('and p.quincena_descuento in (1, 3)')
    else if AQuincena = 2 then
      Q.SQL.Add('and p.quincena_descuento in (2, 3)')
    else
      Q.SQL.Add('and p.quincena_descuento in (1, 2, 3)');

    Q.ParamByName('codigo_emp').AsInteger := ACodigoEmp;
    if FIdField <> '' then
      Q.ParamByName('id_actual').AsInteger := AExceptId;
    Q.Open;
    if not Q.Eof then
      Result := Q.FieldByName('TOTAL_PENSION').AsFloat;
  finally
    Q.Free;
  end;
end;

function TfrmEmpleadoPensionAlimenticia.StrToFloatSeguro(const AValue,
  AFieldName: string): Double;
var
  S: string;
  PComma, PDot, I: Integer;
  DecimalChar, ThousandChar: Char;
begin
  S := Trim(AValue);
  S := StringReplace(S, 'RD$', '', [rfReplaceAll, rfIgnoreCase]);
  S := StringReplace(S, ' ', '', [rfReplaceAll]);

  PComma := 0;
  PDot := 0;
  for I := Length(S) downto 1 do
  begin
    if (S[I] = ',') and (PComma = 0) then
      PComma := I;
    if (S[I] = '.') and (PDot = 0) then
      PDot := I;
  end;

  if (PComma > 0) and (PDot > 0) then
  begin
    if PComma > PDot then
    begin
      DecimalChar := ',';
      ThousandChar := '.';
    end
    else
    begin
      DecimalChar := '.';
      ThousandChar := ',';
    end;

    S := StringReplace(S, ThousandChar, '', [rfReplaceAll]);
    S := StringReplace(S, DecimalChar, DecimalSeparator, [rfReplaceAll]);
  end
  else
  begin
    S := StringReplace(S, ',', DecimalSeparator, [rfReplaceAll]);
    S := StringReplace(S, '.', DecimalSeparator, [rfReplaceAll]);
  end;

  if not TryStrToFloat(S, Result) then
    raise Exception.Create('Valor invalido en ' + AFieldName + '.');
end;

function TfrmEmpleadoPensionAlimenticia.UsuarioActual: string;
begin
  Result := Copy(GetEnvironmentVariable('USERNAME'), 1, 12);
  if Result = '' then
    Result := 'SISTEMA';
end;

procedure TfrmEmpleadoPensionAlimenticia.MostrarSalarioEmpleado;
var
  Salario: Double;
begin
  Salario := GetSalarioEmpleadoSeleccionado;
  edtSalarioEmpleado.Text := FormatFloat('0.00', Salario);
end;

procedure TfrmEmpleadoPensionAlimenticia.ValidarAntesDeGuardar;
var
  Monto, Salario, TotalActual, TotalConNuevo: Double;
  CodigoEmp, Quincena: Integer;
begin
  CodigoEmp := GetCodigoEmpleadoSeleccionado;
  if CodigoEmp <= 0 then
    raise Exception.Create('Debe seleccionar el empleado.');

  if Trim(edtBeneficiario.Text) = '' then
    raise Exception.Create('Debe indicar el nombre del beneficiario.');

  Monto := StrToFloatSeguro(edtMonto.Text, 'monto');
  if Monto <= 0 then
    raise Exception.Create('El monto debe ser mayor que cero.');

  Quincena := GetQuincenaDescuento;
  if (Quincena < 1) or (Quincena > 3) then
    raise Exception.Create('La quincena de descuento no es valida.');

  Salario := GetSalarioEmpleadoSeleccionado;
  if Salario <= 0 then
    raise Exception.Create('El empleado no tiene salario valido para validar.');

  if Monto > Salario then
    raise Exception.Create('El monto de la pension no puede ser mayor al salario.');

  TotalActual := GetTotalPensionesVigentesEmpleado(CodigoEmp, Quincena,
    FCurrentId);
  TotalConNuevo := TotalActual + Monto;

  if TotalConNuevo > Salario then
    raise Exception.Create('La suma de pensiones vigentes supera el salario.');

  if dtpFechaFin.Checked and dtpFechaInicio.Checked and
     (dtpFechaFin.Date < dtpFechaInicio.Date) then
    raise Exception.Create('La fecha fin no puede ser menor que la fecha inicio.');
end;

procedure TfrmEmpleadoPensionAlimenticia.GuardarPension;
begin
  if FCurrentId > 0 then
    ActualizarPension
  else
    InsertarPension;
end;

procedure TfrmEmpleadoPensionAlimenticia.InsertarPension;
begin
  IniciarTransaccionSiNecesario;

  qryExec.Close;
  qryExec.SQL.Clear;
  qryExec.SQL.Add('insert into empleado_pension_alimenticia (');
  qryExec.SQL.Add('  codigo_emp, beneficiario, concepto, monto,');
  qryExec.SQL.Add('  quincena_descuento');

  if FCiaFieldName <> '' then
    qryExec.SQL.Add('  , ' + FCiaFieldName);
  if FDocumentoField <> '' then
    qryExec.SQL.Add('  , ' + FDocumentoField);
  if FFechaInicioFieldExists then
    qryExec.SQL.Add('  , fecha_inicio');
  if FFechaFinFieldExists then
    qryExec.SQL.Add('  , fecha_fin');
  qryExec.SQL.Add('  , status');
  if FObservacionField <> '' then
    qryExec.SQL.Add('  , ' + FObservacionField);
  if FInPorFieldExists then
    qryExec.SQL.Add('  , in_por');

  qryExec.SQL.Add(') values (');
  qryExec.SQL.Add('  :codigo_emp, :beneficiario, :concepto, :monto,');
  qryExec.SQL.Add('  :quincena_descuento');

  if FCiaFieldName <> '' then
    qryExec.SQL.Add('  , :codigo_cia');
  if FDocumentoField <> '' then
    qryExec.SQL.Add('  , :documento');
  if FFechaInicioFieldExists then
    qryExec.SQL.Add('  , :fecha_inicio');
  if FFechaFinFieldExists then
    qryExec.SQL.Add('  , :fecha_fin');
  qryExec.SQL.Add('  , :status');
  if FObservacionField <> '' then
    qryExec.SQL.Add('  , :observacion');
  if FInPorFieldExists then
    qryExec.SQL.Add('  , :in_por');

  qryExec.SQL.Add(')');

  qryExec.ParamByName('codigo_emp').AsInteger := GetCodigoEmpleadoSeleccionado;
  qryExec.ParamByName('beneficiario').AsString := Copy(Trim(edtBeneficiario.Text), 1, 120);
  qryExec.ParamByName('concepto').AsString := Copy(Trim(edtConcepto.Text), 1, 120);
  qryExec.ParamByName('monto').AsFloat := StrToFloatSeguro(edtMonto.Text, 'monto');
  qryExec.ParamByName('quincena_descuento').AsInteger := GetQuincenaDescuento;

  if FCiaFieldName <> '' then
    qryExec.ParamByName('codigo_cia').AsInteger := GetCodigoCiaSeleccionada;

  if FDocumentoField <> '' then
    qryExec.ParamByName('documento').AsString := Copy(Trim(edtDocumento.Text), 1, 30);

  if FFechaInicioFieldExists then
  begin
    if dtpFechaInicio.Checked then
      qryExec.ParamByName('fecha_inicio').AsDateTime := dtpFechaInicio.Date
    else
      qryExec.ParamByName('fecha_inicio').Clear;
  end;

  if FFechaFinFieldExists then
  begin
    if dtpFechaFin.Checked then
      qryExec.ParamByName('fecha_fin').AsDateTime := dtpFechaFin.Date
    else
      qryExec.ParamByName('fecha_fin').Clear;
  end;

  if cbVigente.Checked then
    qryExec.ParamByName('status').AsString := 'A'
  else
    qryExec.ParamByName('status').AsString := 'I';

  if FObservacionField <> '' then
    qryExec.ParamByName('observacion').AsString := Copy(Trim(edtTextoLibre.Text), 1, 120);

  if FInPorFieldExists then
    qryExec.ParamByName('in_por').AsString := UsuarioActual;

  qryExec.ExecSQL;
  FTransaction.Commit;
  RefrescarGrid;
end;

procedure TfrmEmpleadoPensionAlimenticia.ActualizarPension;
begin
  IniciarTransaccionSiNecesario;

  qryExec.Close;
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update empleado_pension_alimenticia set');
  qryExec.SQL.Add('  codigo_emp = :codigo_emp,');
  qryExec.SQL.Add('  beneficiario = :beneficiario,');
  qryExec.SQL.Add('  concepto = :concepto,');
  qryExec.SQL.Add('  monto = :monto,');
  qryExec.SQL.Add('  quincena_descuento = :quincena_descuento');

  if FCiaFieldName <> '' then
    qryExec.SQL.Add('  , ' + FCiaFieldName + ' = :codigo_cia');
  if FDocumentoField <> '' then
    qryExec.SQL.Add('  , ' + FDocumentoField + ' = :documento');
  if FFechaInicioFieldExists then
    qryExec.SQL.Add('  , fecha_inicio = :fecha_inicio');
  if FFechaFinFieldExists then
    qryExec.SQL.Add('  , fecha_fin = :fecha_fin');
  qryExec.SQL.Add('  , status = :status');
  if FObservacionField <> '' then
    qryExec.SQL.Add('  , ' + FObservacionField + ' = :observacion');
  if FModPorFieldExists then
    qryExec.SQL.Add('  , mod_por = :mod_por');

  qryExec.SQL.Add('where ' + FIdField + ' = :id');

  qryExec.ParamByName('codigo_emp').AsInteger := GetCodigoEmpleadoSeleccionado;
  qryExec.ParamByName('beneficiario').AsString := Copy(Trim(edtBeneficiario.Text), 1, 120);
  qryExec.ParamByName('concepto').AsString := Copy(Trim(edtConcepto.Text), 1, 120);
  qryExec.ParamByName('monto').AsFloat := StrToFloatSeguro(edtMonto.Text, 'monto');
  qryExec.ParamByName('quincena_descuento').AsInteger := GetQuincenaDescuento;
  qryExec.ParamByName('id').AsInteger := FCurrentId;

  if FCiaFieldName <> '' then
    qryExec.ParamByName('codigo_cia').AsInteger := GetCodigoCiaSeleccionada;

  if FDocumentoField <> '' then
    qryExec.ParamByName('documento').AsString := Copy(Trim(edtDocumento.Text), 1, 30);

  if FFechaInicioFieldExists then
  begin
    if dtpFechaInicio.Checked then
      qryExec.ParamByName('fecha_inicio').AsDateTime := dtpFechaInicio.Date
    else
      qryExec.ParamByName('fecha_inicio').Clear;
  end;

  if FFechaFinFieldExists then
  begin
    if dtpFechaFin.Checked then
      qryExec.ParamByName('fecha_fin').AsDateTime := dtpFechaFin.Date
    else
      qryExec.ParamByName('fecha_fin').Clear;
  end;

  if cbVigente.Checked then
    qryExec.ParamByName('status').AsString := 'A'
  else
    qryExec.ParamByName('status').AsString := 'I';

  if FObservacionField <> '' then
    qryExec.ParamByName('observacion').AsString := Copy(Trim(edtTextoLibre.Text), 1, 120);

  if FModPorFieldExists then
    qryExec.ParamByName('mod_por').AsString := UsuarioActual;

  qryExec.ExecSQL;
  FTransaction.Commit;
  RefrescarGrid;
end;

procedure TfrmEmpleadoPensionAlimenticia.CambiarEstadoPension(
  const AVigente: Boolean);
var
  Id: Integer;
begin
  if not qryPension.Active or qryPension.IsEmpty then
    raise Exception.Create('Debe seleccionar un registro del listado.');

  Id := qryPension.FieldByName('ID_PENSION').AsInteger;

  IniciarTransaccionSiNecesario;
  qryExec.Close;
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update empleado_pension_alimenticia set');

  if AVigente then
    qryExec.SQL.Add('  status = ''A''')
  else
    qryExec.SQL.Add('  status = ''I''');

  if FFechaFinFieldExists and (not AVigente) then
    qryExec.SQL.Add('  , fecha_fin = coalesce(fecha_fin, current_date)');
  if FModPorFieldExists then
    qryExec.SQL.Add('  , mod_por = :mod_por');

  qryExec.SQL.Add('where ' + FIdField + ' = :id');
  qryExec.ParamByName('id').AsInteger := Id;

  if FModPorFieldExists then
    qryExec.ParamByName('mod_por').AsString := UsuarioActual;

  qryExec.ExecSQL;
  FTransaction.Commit;
  RefrescarGrid;
end;

procedure TfrmEmpleadoPensionAlimenticia.CargarPensionSeleccionada;
var
  CodigoEmp, CodigoCia: Integer;
begin
  if not qryPension.Active or qryPension.IsEmpty then
    Exit;

  FCurrentId := qryPension.FieldByName('ID_PENSION').AsInteger;
  CodigoEmp := qryPension.FieldByName('CODIGO_EMP').AsInteger;
  CodigoCia := StrToIntDef(DataSetFieldAsText(qryPension, 'CODIGO_CIA'), 0);

  FLoading := True;
  try
    if (CodigoCia > 0) and qryCompaniaLookup.Active then
    begin
      qryCompaniaLookup.Locate('CODIGO', CodigoCia, []);
      try
        lkpCompania.Value := IntToStr(CodigoCia);
      except
      end;
    end;
  finally
    FLoading := False;
  end;

  CargarEmpleados('');

  if qryEmpleadoLookup.Active then
    qryEmpleadoLookup.Locate('CODIGO', CodigoEmp, []);

  try
    lkpEmpleado.Value := IntToStr(CodigoEmp);
  except
  end;

  edtBeneficiario.Text := DataSetFieldAsText(qryPension, 'BENEFICIARIO');
  edtDocumento.Text := DataSetFieldAsText(qryPension, 'CEDULA_BENEFICIARIO');
  edtConcepto.Text := DataSetFieldAsText(qryPension, 'CONCEPTO');
  edtMonto.Text := FormatFloat('0.00', qryPension.FieldByName('MONTO').AsFloat);
  edtTextoLibre.Text := DataSetFieldAsText(qryPension, 'OBSERVACION');
  cbQuincena.ItemIndex := qryPension.FieldByName('QUINCENA_DESCUENTO').AsInteger - 1;

  if not qryPension.FieldByName('FECHA_INICIO').IsNull then
  begin
    dtpFechaInicio.Date := qryPension.FieldByName('FECHA_INICIO').AsDateTime;
    dtpFechaInicio.Checked := True;
  end
  else
    dtpFechaInicio.Checked := False;

  if not qryPension.FieldByName('FECHA_FIN').IsNull then
  begin
    dtpFechaFin.Date := qryPension.FieldByName('FECHA_FIN').AsDateTime;
    dtpFechaFin.Checked := True;
  end
  else
    dtpFechaFin.Checked := False;

  cbVigente.Checked := UpperCase(DataSetFieldAsText(qryPension, 'STATUS')) = 'A';
  MostrarSalarioEmpleado;
end;

procedure TfrmEmpleadoPensionAlimenticia.AplicarEmpleadoSeleccionado;
var
  CodigoEmp, CodigoCia: Integer;
begin
  if FLoading then
    Exit;

  if not qryEmpleadoLookup.Active or qryEmpleadoLookup.IsEmpty then
    Exit;

  CodigoEmp := StrToIntDef(LookupValueAsString(lkpEmpleado), 0);
  if CodigoEmp > 0 then
    qryEmpleadoLookup.Locate('CODIGO', CodigoEmp, []);

  CodigoCia := StrToIntDef(DataSetFieldAsText(qryEmpleadoLookup,
    'CODIGO_CIA'), 0);

  if (CodigoCia > 0) and qryCompaniaLookup.Active then
  begin
    FLoading := True;
    try
      qryCompaniaLookup.Locate('CODIGO', CodigoCia, []);
      try
        lkpCompania.Value := IntToStr(CodigoCia);
      except
      end;
    finally
      FLoading := False;
    end;
  end;

  MostrarSalarioEmpleado;
end;

procedure TfrmEmpleadoPensionAlimenticia.btnGuardarClick(Sender: TObject);
begin
  try
    ValidarAntesDeGuardar;
    GuardarPension;
    MessageDlg('Pension alimenticia guardada correctamente.',
      mtInformation, [mbOK], 0);
    LimpiarCampos;
  except
    on E: Exception do
    begin
      if Assigned(FTransaction) and FTransaction.InTransaction then
        FTransaction.Rollback;
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfrmEmpleadoPensionAlimenticia.btnNuevoClick(Sender: TObject);
begin
  LimpiarCampos;
end;

procedure TfrmEmpleadoPensionAlimenticia.btnInactivarClick(Sender: TObject);
begin
  try
    CambiarEstadoPension(False);
    MessageDlg('Registro inactivado. No sera incluido en reportes.',
      mtInformation, [mbOK], 0);
    LimpiarCampos;
  except
    on E: Exception do
    begin
      if Assigned(FTransaction) and FTransaction.InTransaction then
        FTransaction.Rollback;
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfrmEmpleadoPensionAlimenticia.btnReactivarClick(Sender: TObject);
begin
  try
    CambiarEstadoPension(True);
    MessageDlg('Registro reactivado correctamente.', mtInformation,
      [mbOK], 0);
    LimpiarCampos;
  except
    on E: Exception do
    begin
      if Assigned(FTransaction) and FTransaction.InTransaction then
        FTransaction.Rollback;
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfrmEmpleadoPensionAlimenticia.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEmpleadoPensionAlimenticia.btnBuscarEmpleadoClick(Sender: TObject);
var
  Filtro: string;
begin
  Filtro := '';
  if InputQuery('Buscar empleado', 'Codigo, cedula, nombre o apellido:',
    Filtro) then
  begin
    Filtro := Copy(Trim(Filtro), 1, 60);
    CargarEmpleados(Filtro);

    if qryEmpleadoLookup.IsEmpty then
    begin
      MessageDlg('No se encontraron empleados con ese criterio.',
        mtInformation, [mbOK], 0);
      Exit;
    end;

    qryEmpleadoLookup.First;
    try
      lkpEmpleado.Value := qryEmpleadoLookup.FieldByName('CODIGO').AsString;
    except
    end;
    AplicarEmpleadoSeleccionado;
    lkpEmpleado.SetFocus;
  end;
end;

procedure TfrmEmpleadoPensionAlimenticia.lkpEmpleadoChange(Sender: TObject);
begin
  AplicarEmpleadoSeleccionado;
end;

procedure TfrmEmpleadoPensionAlimenticia.lkpCompaniaChange(Sender: TObject);
begin
  if FLoading then
    Exit;

  CargarEmpleados('');
  if qryEmpleadoLookup.Active and not qryEmpleadoLookup.IsEmpty then
  begin
    qryEmpleadoLookup.First;
    try
      lkpEmpleado.Value := qryEmpleadoLookup.FieldByName('CODIGO').AsString;
    except
    end;
  end;
  MostrarSalarioEmpleado;
end;

procedure TfrmEmpleadoPensionAlimenticia.grdPensionesDblClick(Sender: TObject);
begin
  CargarPensionSeleccionada;
end;

end.
