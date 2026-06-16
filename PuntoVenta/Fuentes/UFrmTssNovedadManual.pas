unit UFrmTssNovedadManual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, DB, IBDatabase,
  IBQuery, IBCustomDataSet, RxDBCtrl, RxLookup,
  Grids, DBGrids,
  WinSkinData;

type
  TfrmTssNovedadManual = class(TForm)
    pnlTop: TPanel;
    lblTitulo: TLabel;
    lblSubTitulo: TLabel;
    pnlBottom: TPanel;
    btnGuardar: TBitBtn;
    btnNuevo: TBitBtn;
    btnInactivar: TBitBtn;
    btnReactivar: TBitBtn;
    btnCerrar: TBitBtn;
    lblCompania: TLabel;
    lkpCompania: TRxDBLookupCombo;
    lblCodigoEmp: TLabel;
    lkpEmpleado: TRxDBLookupCombo;
    btnBuscarEmpleado: TBitBtn;
    lblCedula: TLabel;
    edtCedula: TEdit;
    lblSalario: TLabel;
    edtSalario: TEdit;
    lblTipoNovedad: TLabel;
    cbTipoNovedad: TComboBox;
    lblFechaInicio: TLabel;
    dtpFechaInicio: TDateTimePicker;
    lblFechaFin: TLabel;
    dtpFechaFin: TDateTimePicker;
    lblCantDias: TLabel;
    edtCantDias: TEdit;
    lblNumeroLicencia: TLabel;
    edtNumeroLicencia: TEdit;
    lblCodigoInterno: TLabel;
    edtCodigoInterno: TEdit;
    lblTextoLibre: TLabel;
    edtTextoLibre: TEdit;
    lblSalarioNuevo: TLabel;
    edtSalarioNuevo: TEdit;
    lblGrid: TLabel;
    grdNovedades: TRxDBGrid;
    dsCompaniaLookup: TDataSource;
    dsEmpleadoLookup: TDataSource;
    dsNovedades: TDataSource;
    qryCompaniaLookup: TIBQuery;
    qryEmpleadoLookup: TIBQuery;
    qryNovedades: TIBQuery;
    qryExec: TIBQuery;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure cbTipoNovedadChange(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnBuscarEmpleadoClick(Sender: TObject);
    procedure lkpEmpleadoChange(Sender: TObject);
    procedure grdNovedadesDblClick(Sender: TObject);
    procedure btnInactivarClick(Sender: TObject);
    procedure btnReactivarClick(Sender: TObject);
  private
    FDatabase: TIBDatabase;
    FTransaction: TIBTransaction;
    FCurrentId: Integer;
    FCiaFieldName: string;
    FCompaniaNameField: string;
    FHasCodigoCiaField: Boolean;
    FHasCiaKeyField: Boolean;
    FHasModPorField: Boolean;

    procedure ConfigureQueries;
    procedure IniciarTransaccionSiNecesario;
    function CreateQuery: TIBQuery;
    function FieldExists(const ATableName, AFieldName: string): Boolean;
    function FirstExistingField(const ATableName: string;
      const AFields: array of string): string;
    procedure DetectarEstructuraTabla;

    procedure CargarCatalogos;
    procedure CargarCompanias;
    procedure CargarEmpleados(const AFiltro: string);
    procedure AsignarCompaniaDefault;
    procedure RefrescarGrid;

    procedure LimpiarCampos;
    procedure DesactivarCamposNovedad;
    procedure ConfigurarCamposPorTipoNovedad;
    procedure ValidarAntesDeGuardar;
    procedure GuardarNovedad;
    procedure InsertarNovedad;
    procedure ActualizarNovedad;
    procedure CambiarEstadoNovedad(const AActiva: Boolean);
    procedure CargarNovedadSeleccionada;
    procedure AplicarEmpleadoSeleccionado;

    function GetTipoNovedad: string;
    function GetCodigoEmpleadoSeleccionado: Integer;
    function GetCodigoCiaSeleccionada: Integer;
    function GetSalarioEmpleadoSeleccionado: Double;
    function TextoHabilitado(AControl: TWinControl): Boolean;
    function StrToIntSeguro(const AValue, AFieldName: string): Integer;
    function StrToFloatSeguro(const AValue, AFieldName: string): Double;
    function DataSetFieldAsText(ADataSet: TDataSet;
      const AFieldName: string): string;
    function SqlQuote(const S: string): string;
    function UsuarioActual: string;
    procedure MostrarEmpleadoActual;
  public
    property Database: TIBDatabase read FDatabase write FDatabase;
    property Transaction: TIBTransaction read FTransaction write FTransaction;
  end;

var
  frmTssNovedadManual: TfrmTssNovedadManual;

implementation

uses
  UDatModConectar;

{$R *.dfm}

procedure TfrmTssNovedadManual.FormCreate(Sender: TObject);
begin
  FCurrentId := 0;

  if not Assigned(FDatabase) then
    FDatabase := dmConectar.IBDatabase1;
  if not Assigned(FTransaction) then
    FTransaction := dmConectar.IBTransaction1;

  ConfigureQueries;
  DetectarEstructuraTabla;
  CargarCatalogos;
  LimpiarCampos;
  ConfigurarCamposPorTipoNovedad;
  RefrescarGrid;
end;

procedure TfrmTssNovedadManual.ConfigureQueries;
begin
  qryCompaniaLookup.Database := FDatabase;
  qryCompaniaLookup.Transaction := FTransaction;
  qryEmpleadoLookup.Database := FDatabase;
  qryEmpleadoLookup.Transaction := FTransaction;
  qryNovedades.Database := FDatabase;
  qryNovedades.Transaction := FTransaction;
  qryExec.Database := FDatabase;
  qryExec.Transaction := FTransaction;
end;

procedure TfrmTssNovedadManual.IniciarTransaccionSiNecesario;
begin
  if not Assigned(FDatabase) then
    raise Exception.Create('No se ha asignado la conexion Database.');

  if not Assigned(FTransaction) then
    raise Exception.Create('No se ha asignado la transaccion Transaction.');

  if not FDatabase.Connected then
    FDatabase.Connected := True;

  if not FTransaction.InTransaction then
    FTransaction.StartTransaction;
end;

function TfrmTssNovedadManual.CreateQuery: TIBQuery;
begin
  Result := TIBQuery.Create(nil);
  Result.Database := FDatabase;
  Result.Transaction := FTransaction;
end;

function TfrmTssNovedadManual.FieldExists(const ATableName,
  AFieldName: string): Boolean;
var
  Q: TIBQuery;
begin
  Result := False;
  Q := CreateQuery;
  try
    Q.SQL.Clear;
    Q.SQL.Add('select 1');
    Q.SQL.Add('from rdb$relation_fields rf');
    Q.SQL.Add('where upper(trim(rf.rdb$relation_name)) = :tabla');
    Q.SQL.Add('and upper(trim(rf.rdb$field_name)) = :campo');
    Q.ParamByName('tabla').AsString := UpperCase(Trim(ATableName));
    Q.ParamByName('campo').AsString := UpperCase(Trim(AFieldName));
    Q.Open;
    Result := not Q.IsEmpty;
  finally
    Q.Free;
  end;
end;

function TfrmTssNovedadManual.FirstExistingField(const ATableName: string;
  const AFields: array of string): string;
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

procedure TfrmTssNovedadManual.DetectarEstructuraTabla;
begin
  IniciarTransaccionSiNecesario;

  FHasCodigoCiaField := FieldExists('TSS_NOVEDAD_MANUAL', 'CODIGO_CIA');
  FHasCiaKeyField := FieldExists('TSS_NOVEDAD_MANUAL', 'CIA_KEY');

  if FHasCodigoCiaField then
    FCiaFieldName := 'CODIGO_CIA'
  else if FHasCiaKeyField then
    FCiaFieldName := 'CIA_KEY'
  else
    FCiaFieldName := '';

  FCompaniaNameField := FirstExistingField('COMPANIA',
    ['COMPANIA', 'NOMBRE', 'NOMBRE_CIA', 'DESCRIPCION', 'RAZON_SOCIAL']);

  FHasModPorField := FieldExists('TSS_NOVEDAD_MANUAL', 'MOD_POR');
end;

procedure TfrmTssNovedadManual.CargarCatalogos;
begin
  if cbTipoNovedad.Items.Count = 0 then
  begin
    cbTipoNovedad.Items.Add('LM - Licencia maternidad');
    cbTipoNovedad.Items.Add('LD - Licencia medica/discapacidad');
    cbTipoNovedad.Items.Add('LV - Licencia voluntaria');
    cbTipoNovedad.Items.Add('OT - Otro movimiento manual');
  end;

  CargarCompanias;
  CargarEmpleados('');
  AsignarCompaniaDefault;
end;

procedure TfrmTssNovedadManual.CargarCompanias;
begin
  qryCompaniaLookup.Close;
  qryCompaniaLookup.SQL.Clear;

  qryCompaniaLookup.SQL.Add('select c.codigo,');
  if FCompaniaNameField <> '' then
  begin
    qryCompaniaLookup.SQL.Add('       c.' + FCompaniaNameField + ' nombre_compania,');
    qryCompaniaLookup.SQL.Add('       cast(c.codigo as varchar(20)) || '' - '' ||');
    qryCompaniaLookup.SQL.Add('       coalesce(c.' + FCompaniaNameField + ', '''') display_compania');
  end
  else
  begin
    qryCompaniaLookup.SQL.Add('       cast(c.codigo as varchar(20)) nombre_compania,');
    qryCompaniaLookup.SQL.Add('       cast(c.codigo as varchar(20)) display_compania');
  end;
  qryCompaniaLookup.SQL.Add('from compania c');
  qryCompaniaLookup.SQL.Add('order by c.codigo');
  qryCompaniaLookup.Open;
end;

procedure TfrmTssNovedadManual.AsignarCompaniaDefault;
begin
  if qryCompaniaLookup.Active and (not qryCompaniaLookup.IsEmpty) then
  begin
    if not qryCompaniaLookup.Locate('CODIGO', 1, []) then
      qryCompaniaLookup.First;
  end;
end;

function TfrmTssNovedadManual.SqlQuote(const S: string): string;
begin
  Result := '''' + StringReplace(S, '''', '''''', [rfReplaceAll]) + '''';
end;

procedure TfrmTssNovedadManual.CargarEmpleados(const AFiltro: string);
var
  Filtro: string;
begin
  Filtro := Copy(Trim(AFiltro), 1, 60);

  qryEmpleadoLookup.Close;
  qryEmpleadoLookup.SQL.Clear;
  qryEmpleadoLookup.SQL.Add('select e.codigo, e.codigo_cia, e.cedula,');
  qryEmpleadoLookup.SQL.Add('       e.nombre, e.apellido, e.salario,');
  qryEmpleadoLookup.SQL.Add('       cast(e.codigo as varchar(20)) || '' - '' ||');
  qryEmpleadoLookup.SQL.Add('       coalesce(e.nombre, '''') || '' '' ||');
  qryEmpleadoLookup.SQL.Add('       coalesce(e.apellido, '''') nombre_completo');
  qryEmpleadoLookup.SQL.Add('from empleado e');

  if Filtro <> '' then
  begin
    qryEmpleadoLookup.SQL.Add('where cast(e.codigo as varchar(20)) containing ' +
      SqlQuote(Filtro));
    qryEmpleadoLookup.SQL.Add('   or upper(coalesce(e.cedula, '''')) containing ' +
      SqlQuote(UpperCase(Filtro)));
    qryEmpleadoLookup.SQL.Add('   or upper(coalesce(e.nombre, '''')) containing ' +
      SqlQuote(UpperCase(Filtro)));
    qryEmpleadoLookup.SQL.Add('   or upper(coalesce(e.apellido, '''')) containing ' +
      SqlQuote(UpperCase(Filtro)));
  end;

  qryEmpleadoLookup.SQL.Add('order by e.nombre, e.apellido');
  qryEmpleadoLookup.Open;
end;

procedure TfrmTssNovedadManual.RefrescarGrid;
var
  CiaExpr: string;
begin
  if FCiaFieldName <> '' then
    CiaExpr := 'm.' + FCiaFieldName
  else
    CiaExpr := 'e.codigo_cia';

  qryNovedades.Close;
  qryNovedades.SQL.Clear;
  qryNovedades.SQL.Add('select m.id, m.codigo_emp,');
  qryNovedades.SQL.Add('       ' + CiaExpr + ' codigo_cia,');
  if FCompaniaNameField <> '' then
    qryNovedades.SQL.Add('       coalesce(c.' + FCompaniaNameField + ', '''') compania,')
  else
    qryNovedades.SQL.Add('       cast(null as varchar(120)) compania,');
  qryNovedades.SQL.Add('       e.cedula,');
  qryNovedades.SQL.Add('       coalesce(e.nombre, '''') || '' '' ||');
  qryNovedades.SQL.Add('       coalesce(e.apellido, '''') empleado,');
  qryNovedades.SQL.Add('       m.tipo_novedad, m.fecha_inicio, m.fecha_fin,');
  qryNovedades.SQL.Add('       m.cant_dias, m.numero_licencia,');
  qryNovedades.SQL.Add('       m.codigo_interno, m.texto_libre,');
  qryNovedades.SQL.Add('       m.salario_nuevo, coalesce(m.status, ''A'') status');
  qryNovedades.SQL.Add('from tss_novedad_manual m');
  qryNovedades.SQL.Add('left join empleado e on e.codigo = m.codigo_emp');
  qryNovedades.SQL.Add('left join compania c on c.codigo = ' + CiaExpr);
  qryNovedades.SQL.Add('order by m.fecha_inicio desc, m.id desc');
  qryNovedades.Open;
end;

function TfrmTssNovedadManual.GetTipoNovedad: string;
var
  S: string;
begin
  S := Trim(cbTipoNovedad.Text);
  Result := UpperCase(Copy(S, 1, 2));
end;

function TfrmTssNovedadManual.TextoHabilitado(AControl: TWinControl): Boolean;
begin
  Result := Assigned(AControl) and AControl.Enabled;
end;

function TfrmTssNovedadManual.StrToIntSeguro(const AValue,
  AFieldName: string): Integer;
begin
  if not TryStrToInt(Trim(AValue), Result) then
    raise Exception.Create('Valor invalido en ' + AFieldName + '.');
end;

function TfrmTssNovedadManual.StrToFloatSeguro(const AValue,
  AFieldName: string): Double;
var
  S: string;
begin
  S := StringReplace(Trim(AValue), ',', '.', [rfReplaceAll]);
  if not TryStrToFloat(S, Result) then
    raise Exception.Create('Valor invalido en ' + AFieldName + '.');
end;

function TfrmTssNovedadManual.DataSetFieldAsText(ADataSet: TDataSet;
  const AFieldName: string): string;
begin
  Result := '';
  if (ADataSet <> nil) and (ADataSet.FindField(AFieldName) <> nil) and
     (not ADataSet.FieldByName(AFieldName).IsNull) then
    Result := Trim(ADataSet.FieldByName(AFieldName).AsString);
end;

function TfrmTssNovedadManual.GetCodigoEmpleadoSeleccionado: Integer;
begin
  Result := 0;
  if qryEmpleadoLookup.Active and (not qryEmpleadoLookup.IsEmpty) then
    Result := qryEmpleadoLookup.FieldByName('CODIGO').AsInteger;
end;

function TfrmTssNovedadManual.GetCodigoCiaSeleccionada: Integer;
begin
  Result := 1;
  if qryCompaniaLookup.Active and (not qryCompaniaLookup.IsEmpty) then
    Result := qryCompaniaLookup.FieldByName('CODIGO').AsInteger;
end;

function TfrmTssNovedadManual.GetSalarioEmpleadoSeleccionado: Double;
begin
  Result := 0;
  if qryEmpleadoLookup.Active and (not qryEmpleadoLookup.IsEmpty) then
  begin
    if qryEmpleadoLookup.FindField('SALARIO') <> nil then
    begin
      if not qryEmpleadoLookup.FieldByName('SALARIO').IsNull then
        Result := qryEmpleadoLookup.FieldByName('SALARIO').AsFloat;
    end;
  end;
end;

procedure TfrmTssNovedadManual.MostrarEmpleadoActual;
var
  CodigoCia: Integer;
begin
  edtCedula.Text := DataSetFieldAsText(qryEmpleadoLookup, 'CEDULA');
  edtSalario.Text := FormatFloat('0.00', GetSalarioEmpleadoSeleccionado);

  CodigoCia := StrToIntDef(DataSetFieldAsText(qryEmpleadoLookup,
    'CODIGO_CIA'), 0);
  if CodigoCia <= 0 then
    CodigoCia := 1;

  if qryCompaniaLookup.Active and (not qryCompaniaLookup.IsEmpty) then
  begin
    if not qryCompaniaLookup.Locate('CODIGO', CodigoCia, []) then
      qryCompaniaLookup.Locate('CODIGO', 1, []);
  end;
end;

procedure TfrmTssNovedadManual.DesactivarCamposNovedad;
begin
  edtCantDias.Enabled := False;
  dtpFechaFin.Enabled := False;
  edtNumeroLicencia.Enabled := False;
  edtCodigoInterno.Enabled := False;
  edtTextoLibre.Enabled := False;
  edtSalarioNuevo.Enabled := False;
end;

procedure TfrmTssNovedadManual.ConfigurarCamposPorTipoNovedad;
var
  Tipo: string;
begin
  Tipo := GetTipoNovedad;
  DesactivarCamposNovedad;

  lkpEmpleado.Enabled := True;
  lkpCompania.Enabled := True;
  btnBuscarEmpleado.Enabled := True;
  cbTipoNovedad.Enabled := True;
  dtpFechaInicio.Enabled := True;
  edtTextoLibre.Enabled := True;

  if (Tipo = 'LM') or (Tipo = 'LD') then
  begin
    edtCantDias.Enabled := True;
    dtpFechaFin.Enabled := True;
    edtNumeroLicencia.Enabled := True;
  end
  else if Tipo = 'LV' then
  begin
    edtCantDias.Enabled := True;
    dtpFechaFin.Enabled := True;
  end
  else if Tipo = 'OT' then
  begin
    dtpFechaFin.Enabled := True;
    edtCodigoInterno.Enabled := True;
    edtTextoLibre.Enabled := True;
  end;

  lblCantDias.Enabled := edtCantDias.Enabled;
  lblFechaFin.Enabled := dtpFechaFin.Enabled;
  lblNumeroLicencia.Enabled := edtNumeroLicencia.Enabled;
  lblCodigoInterno.Enabled := edtCodigoInterno.Enabled;
  lblTextoLibre.Enabled := edtTextoLibre.Enabled;
  lblSalarioNuevo.Enabled := edtSalarioNuevo.Enabled;
end;

procedure TfrmTssNovedadManual.LimpiarCampos;
begin
  FCurrentId := 0;
  edtCedula.Clear;
  edtSalario.Text := '0.00';
  edtCantDias.Clear;
  edtNumeroLicencia.Clear;
  edtCodigoInterno.Clear;
  edtTextoLibre.Clear;
  edtSalarioNuevo.Clear;

  dtpFechaInicio.Date := Date;
  dtpFechaFin.Date := Date;
  dtpFechaFin.Checked := False;

  if cbTipoNovedad.Items.Count > 0 then
    cbTipoNovedad.ItemIndex := 0;

  AsignarCompaniaDefault;
  if qryEmpleadoLookup.Active and (not qryEmpleadoLookup.IsEmpty) then
    qryEmpleadoLookup.First;
  MostrarEmpleadoActual;
end;

procedure TfrmTssNovedadManual.ValidarAntesDeGuardar;
var
  Tipo: string;
  SalarioNuevo: Double;
begin
  Tipo := GetTipoNovedad;

  if GetCodigoEmpleadoSeleccionado <= 0 then
    raise Exception.Create('Debe seleccionar el empleado.');

  if GetCodigoCiaSeleccionada <= 0 then
    raise Exception.Create('Debe seleccionar la compania.');

  if not ((Tipo = 'LM') or (Tipo = 'LD') or (Tipo = 'LV') or
          (Tipo = 'OT')) then
    raise Exception.Create('Tipo de novedad no valido.');

  if (Tipo = 'LM') or (Tipo = 'LD') or (Tipo = 'LV') then
  begin
    if Trim(edtCantDias.Text) = '' then
      raise Exception.Create('Debe indicar la cantidad de dias.');

    if StrToIntSeguro(edtCantDias.Text, 'cantidad de dias') <= 0 then
      raise Exception.Create('La cantidad de dias debe ser mayor que cero.');
  end;

  if ((Tipo = 'LM') or (Tipo = 'LD')) and
     (Trim(edtNumeroLicencia.Text) = '') then
    raise Exception.Create('Debe indicar el numero de licencia medica.');

  if dtpFechaFin.Checked and (dtpFechaFin.Date < dtpFechaInicio.Date) then
    raise Exception.Create('La fecha fin no puede ser menor que la fecha inicio.');

  if TextoHabilitado(edtSalarioNuevo) and (Trim(edtSalarioNuevo.Text) <> '') then
  begin
    SalarioNuevo := StrToFloatSeguro(edtSalarioNuevo.Text, 'salario nuevo');
    if SalarioNuevo <= 0 then
      raise Exception.Create('El salario nuevo debe ser mayor que cero.');
  end;
end;

function TfrmTssNovedadManual.UsuarioActual: string;
begin
  Result := Copy(GetEnvironmentVariable('USERNAME'), 1, 12);
  if Result = '' then
    Result := 'SISTEMA';
end;

procedure TfrmTssNovedadManual.GuardarNovedad;
begin
  if FCurrentId > 0 then
    ActualizarNovedad
  else
    InsertarNovedad;
end;

procedure TfrmTssNovedadManual.InsertarNovedad;
begin
  IniciarTransaccionSiNecesario;
  qryExec.Close;
  qryExec.SQL.Clear;
  qryExec.SQL.Add('insert into tss_novedad_manual (');
  qryExec.SQL.Add('  codigo_emp,');
  if FCiaFieldName <> '' then
    qryExec.SQL.Add('  ' + LowerCase(FCiaFieldName) + ',');
  qryExec.SQL.Add('  tipo_novedad, fecha_inicio, fecha_fin,');
  qryExec.SQL.Add('  cant_dias, numero_licencia, codigo_interno,');
  qryExec.SQL.Add('  texto_libre, salario_nuevo, status, in_por');
  qryExec.SQL.Add(') values (');
  qryExec.SQL.Add('  :codigo_emp,');
  if FCiaFieldName <> '' then
    qryExec.SQL.Add('  :codigo_cia,');
  qryExec.SQL.Add('  :tipo_novedad, :fecha_inicio, :fecha_fin,');
  qryExec.SQL.Add('  :cant_dias, :numero_licencia, :codigo_interno,');
  qryExec.SQL.Add('  :texto_libre, :salario_nuevo, ''A'', :in_por');
  qryExec.SQL.Add(')');

  qryExec.ParamByName('codigo_emp').AsInteger := GetCodigoEmpleadoSeleccionado;
  if FCiaFieldName <> '' then
    qryExec.ParamByName('codigo_cia').AsInteger := GetCodigoCiaSeleccionada;
  qryExec.ParamByName('tipo_novedad').AsString := GetTipoNovedad;
  qryExec.ParamByName('fecha_inicio').AsDateTime := dtpFechaInicio.Date;

  if dtpFechaFin.Checked then
    qryExec.ParamByName('fecha_fin').AsDateTime := dtpFechaFin.Date
  else
    qryExec.ParamByName('fecha_fin').Clear;

  if Trim(edtCantDias.Text) = '' then
    qryExec.ParamByName('cant_dias').Clear
  else
    qryExec.ParamByName('cant_dias').AsInteger :=
      StrToIntSeguro(edtCantDias.Text, 'cantidad de dias');

  if Trim(edtNumeroLicencia.Text) = '' then
    qryExec.ParamByName('numero_licencia').Clear
  else
    qryExec.ParamByName('numero_licencia').AsString :=
      Copy(Trim(edtNumeroLicencia.Text), 1, 30);

  if Trim(edtCodigoInterno.Text) = '' then
    qryExec.ParamByName('codigo_interno').Clear
  else
    qryExec.ParamByName('codigo_interno').AsString :=
      Copy(Trim(edtCodigoInterno.Text), 1, 20);

  if Trim(edtTextoLibre.Text) = '' then
    qryExec.ParamByName('texto_libre').Clear
  else
    qryExec.ParamByName('texto_libre').AsString :=
      Copy(Trim(edtTextoLibre.Text), 1, 120);

  if Trim(edtSalarioNuevo.Text) = '' then
    qryExec.ParamByName('salario_nuevo').Clear
  else
    qryExec.ParamByName('salario_nuevo').AsFloat :=
      StrToFloatSeguro(edtSalarioNuevo.Text, 'salario nuevo');

  qryExec.ParamByName('in_por').AsString := UsuarioActual;
  qryExec.ExecSQL;
  FTransaction.CommitRetaining;
end;

procedure TfrmTssNovedadManual.ActualizarNovedad;
begin
  IniciarTransaccionSiNecesario;
  qryExec.Close;
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update tss_novedad_manual set');
  qryExec.SQL.Add('  codigo_emp = :codigo_emp,');
  if FCiaFieldName <> '' then
    qryExec.SQL.Add('  ' + LowerCase(FCiaFieldName) + ' = :codigo_cia,');
  qryExec.SQL.Add('  tipo_novedad = :tipo_novedad,');
  qryExec.SQL.Add('  fecha_inicio = :fecha_inicio,');
  qryExec.SQL.Add('  fecha_fin = :fecha_fin,');
  qryExec.SQL.Add('  cant_dias = :cant_dias,');
  qryExec.SQL.Add('  numero_licencia = :numero_licencia,');
  qryExec.SQL.Add('  codigo_interno = :codigo_interno,');
  qryExec.SQL.Add('  texto_libre = :texto_libre,');
  qryExec.SQL.Add('  salario_nuevo = :salario_nuevo');
  if FHasModPorField then
    qryExec.SQL.Add('  , mod_por = :mod_por');
  qryExec.SQL.Add('where id = :id');

  qryExec.ParamByName('codigo_emp').AsInteger := GetCodigoEmpleadoSeleccionado;
  if FCiaFieldName <> '' then
    qryExec.ParamByName('codigo_cia').AsInteger := GetCodigoCiaSeleccionada;
  qryExec.ParamByName('tipo_novedad').AsString := GetTipoNovedad;
  qryExec.ParamByName('fecha_inicio').AsDateTime := dtpFechaInicio.Date;

  if dtpFechaFin.Checked then
    qryExec.ParamByName('fecha_fin').AsDateTime := dtpFechaFin.Date
  else
    qryExec.ParamByName('fecha_fin').Clear;

  if Trim(edtCantDias.Text) = '' then
    qryExec.ParamByName('cant_dias').Clear
  else
    qryExec.ParamByName('cant_dias').AsInteger :=
      StrToIntSeguro(edtCantDias.Text, 'cantidad de dias');

  if Trim(edtNumeroLicencia.Text) = '' then
    qryExec.ParamByName('numero_licencia').Clear
  else
    qryExec.ParamByName('numero_licencia').AsString :=
      Copy(Trim(edtNumeroLicencia.Text), 1, 30);

  if Trim(edtCodigoInterno.Text) = '' then
    qryExec.ParamByName('codigo_interno').Clear
  else
    qryExec.ParamByName('codigo_interno').AsString :=
      Copy(Trim(edtCodigoInterno.Text), 1, 20);

  if Trim(edtTextoLibre.Text) = '' then
    qryExec.ParamByName('texto_libre').Clear
  else
    qryExec.ParamByName('texto_libre').AsString :=
      Copy(Trim(edtTextoLibre.Text), 1, 120);

  if Trim(edtSalarioNuevo.Text) = '' then
    qryExec.ParamByName('salario_nuevo').Clear
  else
    qryExec.ParamByName('salario_nuevo').AsFloat :=
      StrToFloatSeguro(edtSalarioNuevo.Text, 'salario nuevo');

  if FHasModPorField then
    qryExec.ParamByName('mod_por').AsString := UsuarioActual;
  qryExec.ParamByName('id').AsInteger := FCurrentId;
  qryExec.ExecSQL;
  FTransaction.CommitRetaining;
end;

procedure TfrmTssNovedadManual.CambiarEstadoNovedad(const AActiva: Boolean);
var
  Id: Integer;
begin
  if not qryNovedades.Active or qryNovedades.IsEmpty then
    Exit;

  Id := qryNovedades.FieldByName('ID').AsInteger;
  IniciarTransaccionSiNecesario;
  qryExec.Close;
  qryExec.SQL.Clear;
  qryExec.SQL.Add('update tss_novedad_manual set');
  if AActiva then
    qryExec.SQL.Add('  status = ''A''')
  else
    qryExec.SQL.Add('  status = ''I''');
  if FHasModPorField then
    qryExec.SQL.Add('  , mod_por = :mod_por');
  qryExec.SQL.Add('where id = :id');
  if FHasModPorField then
    qryExec.ParamByName('mod_por').AsString := UsuarioActual;
  qryExec.ParamByName('id').AsInteger := Id;
  qryExec.ExecSQL;
  FTransaction.CommitRetaining;
  RefrescarGrid;
end;

procedure TfrmTssNovedadManual.CargarNovedadSeleccionada;
var
  CodigoEmp, CodigoCia: Integer;
begin
  if not qryNovedades.Active or qryNovedades.IsEmpty then
    Exit;

  FCurrentId := qryNovedades.FieldByName('ID').AsInteger;
  CodigoEmp := qryNovedades.FieldByName('CODIGO_EMP').AsInteger;
  CodigoCia := StrToIntDef(DataSetFieldAsText(qryNovedades, 'CODIGO_CIA'), 1);

  if qryCompaniaLookup.Active then
    qryCompaniaLookup.Locate('CODIGO', CodigoCia, []);
  if qryEmpleadoLookup.Active then
    qryEmpleadoLookup.Locate('CODIGO', CodigoEmp, []);

  MostrarEmpleadoActual;
  cbTipoNovedad.ItemIndex := cbTipoNovedad.Items.IndexOf(
    DataSetFieldAsText(qryNovedades, 'TIPO_NOVEDAD') + ' -');
  if cbTipoNovedad.ItemIndex < 0 then
  begin
    if DataSetFieldAsText(qryNovedades, 'TIPO_NOVEDAD') = 'LM' then
      cbTipoNovedad.ItemIndex := 0
    else if DataSetFieldAsText(qryNovedades, 'TIPO_NOVEDAD') = 'LD' then
      cbTipoNovedad.ItemIndex := 1
    else if DataSetFieldAsText(qryNovedades, 'TIPO_NOVEDAD') = 'LV' then
      cbTipoNovedad.ItemIndex := 2
    else
      cbTipoNovedad.ItemIndex := 3;
  end;

  if not qryNovedades.FieldByName('FECHA_INICIO').IsNull then
    dtpFechaInicio.Date := qryNovedades.FieldByName('FECHA_INICIO').AsDateTime;

  if not qryNovedades.FieldByName('FECHA_FIN').IsNull then
  begin
    dtpFechaFin.Checked := True;
    dtpFechaFin.Date := qryNovedades.FieldByName('FECHA_FIN').AsDateTime;
  end
  else
    dtpFechaFin.Checked := False;

  edtCantDias.Text := DataSetFieldAsText(qryNovedades, 'CANT_DIAS');
  edtNumeroLicencia.Text := DataSetFieldAsText(qryNovedades,
    'NUMERO_LICENCIA');
  edtCodigoInterno.Text := DataSetFieldAsText(qryNovedades,
    'CODIGO_INTERNO');
  edtTextoLibre.Text := DataSetFieldAsText(qryNovedades, 'TEXTO_LIBRE');
  edtSalarioNuevo.Text := DataSetFieldAsText(qryNovedades,
    'SALARIO_NUEVO');
  ConfigurarCamposPorTipoNovedad;
end;

procedure TfrmTssNovedadManual.AplicarEmpleadoSeleccionado;
begin
  if not qryEmpleadoLookup.Active or qryEmpleadoLookup.IsEmpty then
    raise Exception.Create('No hay empleado seleccionado.');
  MostrarEmpleadoActual;
end;

procedure TfrmTssNovedadManual.cbTipoNovedadChange(Sender: TObject);
begin
  ConfigurarCamposPorTipoNovedad;
end;

procedure TfrmTssNovedadManual.btnGuardarClick(Sender: TObject);
begin
  try
    ValidarAntesDeGuardar;
    GuardarNovedad;
    MessageDlg('Novedad guardada correctamente.', mtInformation, [mbOK], 0);
    RefrescarGrid;
    LimpiarCampos;
    ConfigurarCamposPorTipoNovedad;
  except
    on E: Exception do
    begin
      if Assigned(FTransaction) and FTransaction.InTransaction then
        FTransaction.RollbackRetaining;
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfrmTssNovedadManual.btnNuevoClick(Sender: TObject);
begin
  LimpiarCampos;
  ConfigurarCamposPorTipoNovedad;
end;

procedure TfrmTssNovedadManual.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTssNovedadManual.btnBuscarEmpleadoClick(Sender: TObject);
var
  Filtro: string;
begin
  Filtro := '';
  if not InputQuery('Buscar empleado',
    'Codigo, cedula, nombre o apellido:', Filtro) then
    Exit;

  Filtro := Copy(Trim(Filtro), 1, 60);
  CargarEmpleados(Filtro);

  if qryEmpleadoLookup.IsEmpty then
  begin
    MessageDlg('No se encontraron empleados con ese criterio.',
      mtInformation, [mbOK], 0);
    CargarEmpleados('');
    Exit;
  end;

  qryEmpleadoLookup.First;
  AplicarEmpleadoSeleccionado;
end;

procedure TfrmTssNovedadManual.lkpEmpleadoChange(Sender: TObject);
begin
  if qryEmpleadoLookup.Active and (not qryEmpleadoLookup.IsEmpty) then
    MostrarEmpleadoActual;
end;

procedure TfrmTssNovedadManual.grdNovedadesDblClick(Sender: TObject);
begin
  CargarNovedadSeleccionada;
end;

procedure TfrmTssNovedadManual.btnInactivarClick(Sender: TObject);
begin
  try
    CambiarEstadoNovedad(False);
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TfrmTssNovedadManual.btnReactivarClick(Sender: TObject);
begin
  try
    CambiarEstadoNovedad(True);
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

end.
