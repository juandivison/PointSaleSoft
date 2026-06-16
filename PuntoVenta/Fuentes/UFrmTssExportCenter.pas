unit UFrmTssExportCenter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB, Grids, DBGrids,
  DBClient, FileCtrl, ShellAPI, IBQuery, IBCustomDataSet,
  UTssTypes,
  RxQuery, IBTable, IBStoredProc, Mask, RxToolEdit, RxDBCtrl, RxLookup;

type
  TfrmTssExportCenter = class(TForm)
    pnlHeader: TPanel;
    lblTitle: TLabel;
    lblSubTitle: TLabel;
    lblPeriodo: TLabel;                  
    edtPeriodo: TEdit;
    lblCompania: TLabel;
    lkpCompania: TRxDBLookupCombo;
    lblRnc: TLabel;
    edtRnc: TEdit;
    lblQuincenaPension: TLabel;
    cbQuincenaPension: TComboBox;
    lblClaveNomina: TLabel;
    edtClaveNomina: TEdit;
    lblSalida: TLabel;
    edtOutputFolder: TEdit;
    btnBuscarCarpeta: TBitBtn;
    pcMain: TPageControl;
    tsAutodeterminacion: TTabSheet;
    tsNovedades: TTabSheet;
    tsBonificacion: TTabSheet;
    tsDependientes: TTabSheet;
    tsRectificativa: TTabSheet;
    tsLog: TTabSheet;
    pnlClient: TPanel;
    grdPreview: TDBGrid;
    pnlBottom: TPanel;
    btnCargarDb: TBitBtn;
    btnValidar: TBitBtn;
    btnGenerarTxt: TBitBtn;
    btnAbrirCarpeta: TBitBtn;
    btnCerrar: TBitBtn;
    memLog: TMemo;
    dsPreview: TDataSource;
    cdsPreview: TClientDataSet;
    SaveDialog1: TSaveDialog;
    IBQuery1: TIBQuery;
    dsCompaniaLookup: TDataSource;
    qryCompaniaLookup: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure btnCargarDbClick(Sender: TObject);
    procedure btnValidarClick(Sender: TObject);
    procedure btnGenerarTxtClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnBuscarCarpetaClick(Sender: TObject);
    procedure btnAbrirCarpetaClick(Sender: TObject);
    procedure lkpCompaniaChange(Sender: TObject);
  private
    FCompaniaNameField: string;
    FRncCompaniaField: string;
    function CurrentKind: TTssExportKind;
    procedure ApplyVisualStyle;
    procedure Log(const S: string);
    procedure ClearLog;

    function FieldExists(const ATableName, AFieldName: string): Boolean;
    function FirstExistingField(const ATableName: string;
      const AFields: array of string): string;
    procedure CargarCompanias;
    procedure AsignarCompaniaDefault;
    procedure ActualizarRncCompania;
    function GetCodigoCiaSeleccionada: Integer;
    function GetRncCompaniaSeleccionada: string;
    function GetPeriodoTss: string;
    function GetClaveNominaTss: string;

    procedure PrepareDataSetForKind(AKind: TTssExportKind);
    procedure AddCommonWorkerFields;
    procedure AddEmployerFields;
    procedure SetEmployerFields;
    procedure AddFieldStr(const AName: string; ASize: Integer);
    procedure AddFieldFloat(const AName: string);
    procedure AddFieldDate(const AName: string);

    function ValidateCommonInputs: Boolean;
    function BuildDefaultFileName(AKind: TTssExportKind): string;
    procedure ShowPageHint(AKind: TTssExportKind);

    function GetPeriodRange(var AFechaIni, AFechaFin: TDateTime): Boolean;
    procedure ConfigureQuery(AQuery: TIBQuery);
    function CreateQuery: TIBQuery;
    function BuildClaveNomina(ATipoNomina: Integer): string;
    function NormalizeTipoIngreso(const ATipoIng: string): string;
    function GetQuincenaPension: Integer;
    procedure SetPensionParams(AQuery: TIBQuery; AFechaIni, AFechaFin: TDateTime);
    procedure AddPensionTotalSelect(AQuery: TIBQuery; ATrailingComma: Boolean);
    function AddBusinessDays(AStartDate: TDateTime; ADays: Integer): TDateTime;

    procedure LoadDatabaseData(AKind: TTssExportKind);
    procedure LoadAutodeterminacionFromDb;
    procedure LoadNovedadesFromDb;
    procedure LoadBonificacionFromDb;
    procedure LoadDependientesFromDb;
    procedure LoadRectificativaIR3FromDb;

    procedure AppendCommonWorkerFromQuery(AQuery: TDataSet);
    procedure AppendAutodetFromQuery(AQuery: TDataSet);
    procedure AppendNovedadFromQuery(AQuery: TDataSet; const ATipoNovedad: string;
      const AFechaInicio, AFechaFin: Variant; ASalario: Double);
    procedure AppendDependienteFromQuery(AQuery: TDataSet);
    procedure SplitApellido(const AApellido: string; var APrimerApellido,
      ASegundoApellido: string);
    function FieldAsText(ADataSet: TDataSet; const AFieldName: string): string;
    function FieldAsFloat(ADataSet: TDataSet; const AFieldName: string): Double;
    function FieldAsDate(ADataSet: TDataSet; const AFieldName: string): Variant;
    function NormalizeSexo(const ASexo: string): string;
    function BuildNovedadesExcelTemplateFileName: string;
    function BuildNovedadesExcelOutputFileName(const ATxtFileName: string): string;
    procedure TryUnprotectNovedadesWorksheet(const AWorkBook, ASheet: OleVariant);
    procedure SetExcelCellText(const ASheet: OleVariant; ARow, ACol: Integer; const AValue: string);
    procedure SetExcelCellNumber(const ASheet: OleVariant; ARow, ACol: Integer; AValue: Double);
    procedure WriteNovedadesExcelCurrentRow(const ASheet: OleVariant; ARow: Integer);
    procedure GenerateNovedadesExcelFromTemplate(const ATxtFileName: string);
  public
  end;

var
  frmTssExportCenter: TfrmTssExportCenter;

implementation

uses
  ComObj, UDatModConectar, UTssFormatUtils, UTssValidator, UTssExporters;

{$R *.dfm}

procedure TfrmTssExportCenter.FormCreate(Sender: TObject);
begin
  ApplyVisualStyle;
  edtPeriodo.Text := FormatDateTime('mmyyyy', Date);
  edtRnc.Text := '';
  edtRnc.ReadOnly := True;
  edtOutputFolder.Text := ExtractFilePath(Application.ExeName) + 'TSS_TXT';

  cbQuincenaPension.Items.Clear;
  cbQuincenaPension.Items.Add('Mes completo');
  cbQuincenaPension.Items.Add('Primera quincena');
  cbQuincenaPension.Items.Add('Segunda quincena');
  cbQuincenaPension.ItemIndex := 0;

  edtClaveNomina.Text := '001';

  SaveDialog1.Filter := 'Archivo TXT (*.txt)|*.txt|Todos los archivos (*.*)|*.*';
  SaveDialog1.DefaultExt := 'txt';

  ConfigureQuery(IBQuery1);
  ConfigureQuery(qryCompaniaLookup);
  FCompaniaNameField := FirstExistingField('COMPANIA',
    ['NOMBRE', 'NOMBRE_CIA', 'DESCRIPCION', 'RAZON_SOCIAL']);
  FRncCompaniaField := FirstExistingField('COMPANIA',
    ['RNC', 'RNC_NUMERO', 'RNC_CIA', 'CEDULA', 'RNC_EMPRESA']);
  CargarCompanias;
  AsignarCompaniaDefault;
  ActualizarRncCompania;
  PrepareDataSetForKind(CurrentKind);
  ClearLog;
  Log('Seleccione el reporte, indique periodo MMAAAA y presione Cargar DB.');
  Log('Novedades: IN/SA desde EMPLEADO, AD desde HISTORICO_EMPLEADOS, VC desde VACACIONES y LM/LD/LV desde TSS_NOVEDAD_MANUAL.');
end;

procedure TfrmTssExportCenter.ApplyVisualStyle;
begin
  Caption := 'Centro de Exportacion TSS / SUIR Plus';
  Color := clBtnFace;
  pnlHeader.Color := clNavy;
  lblTitle.Font.Color := clWhite;
  lblSubTitle.Font.Color := clWhite;
  lblPeriodo.Font.Color := clWhite;
  lblCompania.Font.Color := clWhite;
  lblRnc.Font.Color := clWhite;
  lblSalida.Font.Color := clWhite;
  lblQuincenaPension.Font.Color := clWhite;
  lblClaveNomina.Font.Color := clWhite;
  btnCargarDb.Caption := 'Cargar DB';
  lblSubTitle.Caption := 'Generacion TXT TSS usando datos reales de Firebird.';
  edtRnc.Color := clBtnFace;
  grdPreview.TitleFont.Style := [fsBold];
end;

procedure TfrmTssExportCenter.Log(const S: string);
begin
  memLog.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' > ' + S);
end;

procedure TfrmTssExportCenter.ClearLog;
begin
  memLog.Clear;
end;

function TfrmTssExportCenter.FieldExists(const ATableName,
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
    Result := not Q.Eof;
  finally
    Q.Free;
  end;
end;

function TfrmTssExportCenter.FirstExistingField(const ATableName: string;
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

procedure TfrmTssExportCenter.CargarCompanias;
begin
  qryCompaniaLookup.Close;
  qryCompaniaLookup.SQL.Clear;

  try
    qryCompaniaLookup.SQL.Add('select c.codigo,');
    if FCompaniaNameField <> '' then
    begin
      qryCompaniaLookup.SQL.Add('       cast(c.codigo as varchar(20)) ||');
      qryCompaniaLookup.SQL.Add('       '' - '' ||');
      qryCompaniaLookup.SQL.Add('       coalesce(c.' + FCompaniaNameField + ', '''')');
      qryCompaniaLookup.SQL.Add('       nombre_cia,');
    end
    else
      qryCompaniaLookup.SQL.Add('       cast(c.codigo as varchar(20)) nombre_cia,');

    if FRncCompaniaField <> '' then
      qryCompaniaLookup.SQL.Add('       coalesce(c.' + FRncCompaniaField + ', '''') rnc')
    else
      qryCompaniaLookup.SQL.Add('       cast('''' as varchar(20)) rnc');

    qryCompaniaLookup.SQL.Add('from compania c');
    qryCompaniaLookup.SQL.Add('order by c.codigo');
    qryCompaniaLookup.Open;
  except
    on E: Exception do
    begin
      qryCompaniaLookup.Close;
      qryCompaniaLookup.SQL.Clear;
      qryCompaniaLookup.SQL.Add('select 1 codigo,');
      qryCompaniaLookup.SQL.Add('       ''1 - COMPANIA 1'' nombre_cia,');
      qryCompaniaLookup.SQL.Add('       cast('''' as varchar(20)) rnc');
      qryCompaniaLookup.SQL.Add('from rdb$database');
      qryCompaniaLookup.Open;
      Log('Aviso: no se pudo leer COMPANIA. ' + E.Message);
    end;
  end;
end;

procedure TfrmTssExportCenter.AsignarCompaniaDefault;
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

function TfrmTssExportCenter.GetCodigoCiaSeleccionada: Integer;
var
  S: string;
begin
  S := Trim(VarToStr(lkpCompania.Value));
  Result := StrToIntDef(S, 0);

  if (Result = 0) and qryCompaniaLookup.Active and
     (not qryCompaniaLookup.IsEmpty) then
    Result := qryCompaniaLookup.FieldByName('CODIGO').AsInteger;
end;

function TfrmTssExportCenter.GetRncCompaniaSeleccionada: string;
begin
  Result := Trim(edtRnc.Text);
end;

function TfrmTssExportCenter.GetPeriodoTss: string;
begin
  // El usuario digita MMAAAA y el instructivo TSS tambien exige MMAAAA.
  Result := TssOnlyDigits(edtPeriodo.Text);
end;

function TfrmTssExportCenter.GetClaveNominaTss: string;
var
  S: string;
begin
  S := TssOnlyDigits(edtClaveNomina.Text);
  if S = '' then
    S := '001';

  if Length(S) > 3 then
    S := Copy(S, 1, 3);

  while Length(S) < 3 do
    S := '0' + S;

  Result := S;
end;

procedure TfrmTssExportCenter.ActualizarRncCompania;
var
  CodigoCia: Integer;
begin
  edtRnc.Text := '';
  if not qryCompaniaLookup.Active or qryCompaniaLookup.IsEmpty then
    Exit;

  CodigoCia := GetCodigoCiaSeleccionada;
  if CodigoCia > 0 then
    qryCompaniaLookup.Locate('CODIGO', CodigoCia, []);

  if (qryCompaniaLookup.FindField('RNC') <> nil) and
     (not qryCompaniaLookup.FieldByName('RNC').IsNull) then
    edtRnc.Text := Trim(qryCompaniaLookup.FieldByName('RNC').AsString);
end;

function TfrmTssExportCenter.CurrentKind: TTssExportKind;
begin
  case pcMain.ActivePageIndex of
    0: Result := tekAutodeterminacion;
    1: Result := tekNovedades;
    2: Result := tekBonificacionInfotep;
    3: Result := tekDependientesAdicionales;
    4: Result := tekRectificativaIR3;
  else
    Result := tekAutodeterminacion;
  end;
end;

procedure TfrmTssExportCenter.pcMainChange(Sender: TObject);
begin
  if pcMain.ActivePage = tsLog then
    Exit;

  PrepareDataSetForKind(CurrentKind);
  ClearLog;
  ShowPageHint(CurrentKind);
  Log('Presione Cargar DB para consultar los datos del periodo.');
end;

procedure TfrmTssExportCenter.btnCargarDbClick(Sender: TObject);
begin
  LoadDatabaseData(CurrentKind);     
end;

procedure TfrmTssExportCenter.AddFieldStr(const AName: string; ASize: Integer);
begin
  cdsPreview.FieldDefs.Add(AName, ftString, ASize, False);
end;

procedure TfrmTssExportCenter.AddFieldFloat(const AName: string);
begin
  cdsPreview.FieldDefs.Add(AName, ftFloat, 0, False);
end;

procedure TfrmTssExportCenter.AddFieldDate(const AName: string);
begin
  cdsPreview.FieldDefs.Add(AName, ftDate, 0, False);
end;

procedure TfrmTssExportCenter.AddCommonWorkerFields;
begin
  AddFieldStr('TIPO_DOC', 1);
  AddFieldStr('NUMERO_DOCUMENTO', 20);
  AddFieldStr('NOMBRES', 80);
  AddFieldStr('PRIMER_APELLIDO', 60);
  AddFieldStr('SEGUNDO_APELLIDO', 60);
  AddFieldStr('SEXO', 1);
  AddFieldDate('FECHA_NACIMIENTO');
end;

procedure TfrmTssExportCenter.AddEmployerFields;
begin
  AddFieldStr('RNC_EMPLEADOR', 20);
  AddFieldStr('CODIGO_CIA', 10);
  AddFieldStr('PERIODO_TSS', 6);
end;

procedure TfrmTssExportCenter.SetEmployerFields;
begin
  if cdsPreview.FindField('RNC_EMPLEADOR') <> nil then
    cdsPreview.FieldByName('RNC_EMPLEADOR').AsString :=
      GetRncCompaniaSeleccionada;

  if cdsPreview.FindField('CODIGO_CIA') <> nil then
    cdsPreview.FieldByName('CODIGO_CIA').AsString :=
      IntToStr(GetCodigoCiaSeleccionada);

  if cdsPreview.FindField('PERIODO_TSS') <> nil then
    cdsPreview.FieldByName('PERIODO_TSS').AsString := GetPeriodoTss;
end;

procedure TfrmTssExportCenter.PrepareDataSetForKind(AKind: TTssExportKind);
begin
  if cdsPreview.Active then
    cdsPreview.Close;

  cdsPreview.FieldDefs.Clear;

  case AKind of
    tekAutodeterminacion:
    begin
      AddEmployerFields;
      AddFieldStr('CLAVE_NOMINA', 3);
      AddCommonWorkerFields;
      AddFieldFloat('SALARIO_COTIZABLE');
      AddFieldFloat('APORTE_VOLUNTARIO');
      AddFieldFloat('SALARIO_ISR');
      AddFieldStr('TIPO_INGRESO', 4);
      AddFieldFloat('OTRAS_REMUNERACIONES');
      AddFieldStr('RNC_CED_AGENTE_RET', 20);
      AddFieldFloat('REMUNERACION_OTROS_AGENTES');
      AddFieldFloat('SALDO_FAVOR_PERIODO');
      AddFieldFloat('REGALIA_PASCUAL');
      AddFieldFloat('PREAVISO_CESANTIA_VIATICO');
      AddFieldFloat('RETENCION_PENSION_ALIMENTICIA');
      AddFieldFloat('SALARIO_INFOTEP');
    end;

    tekNovedades:
    begin
      AddEmployerFields;
      AddFieldStr('CLAVE_NOMINA', 3);
      AddFieldStr('TIPO_NOVEDAD', 2);
      AddFieldDate('FECHA_INICIO');
      AddFieldDate('FECHA_FIN');
      AddCommonWorkerFields;
      AddFieldFloat('SALARIO_COTIZABLE_SDSS');
      AddFieldFloat('APORTE_VOLUNTARIO_SDSS');
      AddFieldStr('TIPO_INGRESO', 4);
      AddFieldFloat('SALARIO_ISR');
      AddFieldFloat('OTRAS_REMUNERACIONES');
      AddFieldStr('RNC_CED_AGENTE_RET', 20);
      AddFieldFloat('REMUNERACION_OTROS_AGENTES');
      AddFieldFloat('SALDO_FAVOR_PERIODO');
      AddFieldFloat('REGALIA_PASCUAL');
      AddFieldFloat('PREAVISO_CESANTIA_VIATICO');
      AddFieldFloat('RETENCION_PENSION_ALIMENTICIA');
      AddFieldFloat('SALARIO_INFOTEP');
      AddFieldStr('ORIGEN', 40);
    end;

    tekBonificacionInfotep:
    begin
      AddEmployerFields;
      AddCommonWorkerFields;
      AddFieldFloat('MONTO_BONIFICACION');
    end;

    tekDependientesAdicionales:
    begin
      AddEmployerFields;
      AddFieldStr('CLAVE_NOMINA', 3);
      AddFieldStr('TIPO_DOC_TITULAR', 1);
      AddFieldStr('NRO_DOC_TITULAR', 20);
      AddFieldStr('TIPO_NOVEDAD', 2);
      AddFieldStr('TIPO_DOC_DEPENDIENTE', 1);
      AddFieldStr('NRO_DOC_DEPENDIENTE', 20);
      AddFieldStr('NOMBRES_DEPENDIENTE', 80);
      AddFieldStr('PRIMER_APELLIDO_DEPENDIENTE', 60);
      AddFieldStr('SEGUNDO_APELLIDO_DEPENDIENTE', 60);
    end;

    tekRectificativaIR3:
    begin
      AddEmployerFields;
      AddFieldStr('TIPO_TRABAJADOR', 2);
      AddCommonWorkerFields;
      AddFieldFloat('SALARIO_COTIZABLE');
      AddFieldFloat('APORTE_VOLUNTARIO');
      AddFieldFloat('SALARIO_ISR');
      AddFieldFloat('OTRAS_REMUNERACIONES');
      AddFieldStr('RNC_CED_AGENTE_RET', 20);
      AddFieldFloat('REMUNERACION_OTROS_AGENTES');
      AddFieldFloat('SALDO_FAVOR_PERIODO');
      AddFieldFloat('REGALIA_PASCUAL');
      AddFieldFloat('PREAVISO_CESANTIA_VIATICO');
      AddFieldFloat('RETENCION_PENSION_ALIMENTICIA');
    end;
  end;

  cdsPreview.CreateDataSet;
  dsPreview.DataSet := cdsPreview;
end;

procedure TfrmTssExportCenter.ShowPageHint(AKind: TTssExportKind);
begin
  case AKind of
    tekAutodeterminacion:
      Log('Autodeterminacion: EMPLEADO + NOMINA, acumulando salario bruto del periodo.');
    tekNovedades:
      Log('Novedades: IN mensual desde NOMINA.STATUS_NOMINA=R, SA/AD/VC/LM/LD/LV segun eventos.');
    tekBonificacionInfotep:
      Log('Bonificacion INFOTEP: NOMINA.BONIFICACION > 0.');
    tekDependientesAdicionales:
      Log('Dependientes: DESCUENTO_DEPENDIENTE_D/M. STATUS A=ID, otro=SD.');
    tekRectificativaIR3:
      Log('Rectificativa IR-3: EMPLEADO + NOMINA, base inicial.');
  end;
end;

function TfrmTssExportCenter.ValidateCommonInputs: Boolean;
begin
  Result := False;
  if Length(TssOnlyDigits(edtPeriodo.Text)) <> 6 then
  begin
    Log('Periodo invalido. Use MMAAAA. Ejemplo: 052026.');
    Exit;
  end;
  if GetCodigoCiaSeleccionada <= 0 then
  begin
    Log('Debe seleccionar la compania.');
    Exit;
  end;
  if Trim(GetRncCompaniaSeleccionada) = '' then
  begin
    Log('La compania seleccionada no tiene RNC configurado.');
    Exit;
  end;

  edtClaveNomina.Text := GetClaveNominaTss;
  if Length(GetClaveNominaTss) <> 3 then
  begin
    Log('Clave Nomina invalida. Use un codigo numerico de 3 digitos, ejemplo 001.');
    Exit;
  end;

  if Trim(edtOutputFolder.Text) = '' then
  begin
    Log('Debe indicar la carpeta de salida.');
    Exit;
  end;
  Result := True;
end;

function TfrmTssExportCenter.GetPeriodRange(var AFechaIni, AFechaFin: TDateTime): Boolean;
var
  S: string;
  M, Y: Integer;
begin
  Result := False;
  S := TssOnlyDigits(edtPeriodo.Text);
  if Length(S) <> 6 then
    Exit;
  M := StrToIntDef(Copy(S, 1, 2), 0);
  Y := StrToIntDef(Copy(S, 3, 4), 0);
  if (M < 1) or (M > 12) or (Y < 1900) then
    Exit;

  AFechaIni := EncodeDate(Y, M, 1);
  if M = 12 then
    AFechaFin := EncodeDate(Y + 1, 1, 1) - 1
  else
    AFechaFin := EncodeDate(Y, M + 1, 1) - 1;
  Result := True;
end;

procedure TfrmTssExportCenter.ConfigureQuery(AQuery: TIBQuery);
begin
  AQuery.Database := dmConectar.IBDatabase1;
  AQuery.Transaction := dmConectar.IBTransaction1;
end;

function TfrmTssExportCenter.CreateQuery: TIBQuery;
begin
  Result := TIBQuery.Create(nil);
  ConfigureQuery(Result);
end;

function TfrmTssExportCenter.BuildClaveNomina(ATipoNomina: Integer): string;
begin
  { La clave de nomina para TSS no depende del tipo de nomina
    semanal/quincenal/mensual. La indica el usuario en el formulario.
    ATipoNomina se conserva para no romper las llamadas existentes. }
  Result := GetClaveNominaTss;
end;

function TfrmTssExportCenter.NormalizeTipoIngreso(const ATipoIng: string): string;
var
  S: string;
  V: Integer;
begin
  S := TssOnlyDigits(ATipoIng);
  V := StrToIntDef(S, 1);
  if (V < 1) or (V > 8) then
    V := 1;
  Result := FormatFloat('0000', V);
end;

function TfrmTssExportCenter.GetQuincenaPension: Integer;
begin
  // 0 = mes completo, 1 = primera quincena, 2 = segunda quincena.
  // Cuando se genera el mes completo, se incluyen pensiones configuradas para
  // primera, segunda y ambas quincenas.
  Result := cbQuincenaPension.ItemIndex;
  if Result < 0 then
    Result := 0;
end;

procedure TfrmTssExportCenter.SetPensionParams(AQuery: TIBQuery; AFechaIni, AFechaFin: TDateTime);
begin
  if AQuery.Params.FindParam('fecha_ini') <> nil then
    AQuery.ParamByName('fecha_ini').AsDateTime := AFechaIni;
  if AQuery.Params.FindParam('fecha_fin') <> nil then
    AQuery.ParamByName('fecha_fin').AsDateTime := AFechaFin;
  if AQuery.Params.FindParam('q_pension') <> nil then
    AQuery.ParamByName('q_pension').AsInteger := GetQuincenaPension;
  if AQuery.Params.FindParam('codigo_cia') <> nil then
    AQuery.ParamByName('codigo_cia').AsInteger := GetCodigoCiaSeleccionada;
end;


procedure TfrmTssExportCenter.AddPensionTotalSelect(AQuery: TIBQuery;
  ATrailingComma: Boolean);
begin
  AQuery.SQL.Add('  (select coalesce(sum(');
  AQuery.SQL.Add('     case');
  AQuery.SQL.Add('       when :q_pension = 0');
  AQuery.SQL.Add('        and p.quincena_descuento = 3');
  AQuery.SQL.Add('         then p.monto * 2');
  AQuery.SQL.Add('       else p.monto');
  AQuery.SQL.Add('     end), 0)');
  AQuery.SQL.Add('   from empleado_pension_alimenticia p');
  AQuery.SQL.Add('   where p.codigo_emp = e.codigo');
  AQuery.SQL.Add('     and coalesce(p.status, ''A'') = ''A''');
  AQuery.SQL.Add('     and (p.fecha_inicio is null');
  AQuery.SQL.Add('          or p.fecha_inicio <= :fecha_fin)');
  AQuery.SQL.Add('     and (p.fecha_fin is null');
  AQuery.SQL.Add('          or p.fecha_fin >= :fecha_ini)');
  AQuery.SQL.Add('     and (:q_pension = 0');
  AQuery.SQL.Add('          or p.quincena_descuento = :q_pension');
  if ATrailingComma then
    AQuery.SQL.Add('          or p.quincena_descuento = 3)) total_pension,')
  else
    AQuery.SQL.Add('          or p.quincena_descuento = 3)) total_pension');
end;

function TfrmTssExportCenter.AddBusinessDays(AStartDate: TDateTime; ADays: Integer): TDateTime;
var
  Added: Integer;
  D: TDateTime;
  DayNum: Word;
begin
  if ADays <= 1 then
  begin
    Result := AStartDate;
    Exit;
  end;

  Added := 1;
  D := AStartDate;
  while Added < ADays do
  begin
    D := D + 1;
    DayNum := DayOfWeek(D); // 1=domingo, 7=sabado
    if DayNum <> 1 then
      Inc(Added);
  end;
  Result := D;
end;

procedure TfrmTssExportCenter.LoadDatabaseData(AKind: TTssExportKind);
begin
  ClearLog;
  PrepareDataSetForKind(AKind);
  ShowPageHint(AKind);

  if not ValidateCommonInputs then
    Exit;

  if not dmConectar.IBTransaction1.InTransaction then
    dmConectar.IBTransaction1.StartTransaction;

  case AKind of
    tekAutodeterminacion: LoadAutodeterminacionFromDb;
    tekNovedades: LoadNovedadesFromDb;
    tekBonificacionInfotep: LoadBonificacionFromDb;
    tekDependientesAdicionales: LoadDependientesFromDb;
    tekRectificativaIR3: LoadRectificativaIR3FromDb;
  end;

  Log('Registros cargados: ' + IntToStr(cdsPreview.RecordCount));
end;

function TfrmTssExportCenter.FieldAsText(ADataSet: TDataSet; const AFieldName: string): string;
begin
  Result := '';
  if (ADataSet <> nil) and (ADataSet.FindField(AFieldName) <> nil) and
     (not ADataSet.FieldByName(AFieldName).IsNull) then
    Result := Trim(ADataSet.FieldByName(AFieldName).AsString);
end;

function TfrmTssExportCenter.FieldAsFloat(ADataSet: TDataSet; const AFieldName: string): Double;
begin
  Result := 0;
  if (ADataSet <> nil) and (ADataSet.FindField(AFieldName) <> nil) and
     (not ADataSet.FieldByName(AFieldName).IsNull) then
    Result := ADataSet.FieldByName(AFieldName).AsFloat;
end;

function TfrmTssExportCenter.FieldAsDate(ADataSet: TDataSet; const AFieldName: string): Variant;
begin
  Result := Null;
  if (ADataSet <> nil) and (ADataSet.FindField(AFieldName) <> nil) and
     (not ADataSet.FieldByName(AFieldName).IsNull) then
    Result := ADataSet.FieldByName(AFieldName).AsDateTime;
end;

function TfrmTssExportCenter.NormalizeSexo(const ASexo: string): string;
begin
  Result := UpperCase(Trim(ASexo));
  if (Result <> 'M') and (Result <> 'F') then
    Result := 'M';
end;

procedure TfrmTssExportCenter.SplitApellido(const AApellido: string;
  var APrimerApellido, ASegundoApellido: string);
var
  P: Integer;
  S: string;
begin
  S := Trim(AApellido);
  P := Pos(' ', S);
  if P > 0 then
  begin
    APrimerApellido := Copy(S, 1, P - 1);
    ASegundoApellido := Trim(Copy(S, P + 1, Length(S)));
  end
  else
  begin
    APrimerApellido := S;
    ASegundoApellido := '';
  end;
end;

procedure TfrmTssExportCenter.AppendCommonWorkerFromQuery(AQuery: TDataSet);
var
  Ap1, Ap2: string;
begin
  SplitApellido(FieldAsText(AQuery, 'APELLIDO'), Ap1, Ap2);
  cdsPreview.FieldByName('TIPO_DOC').AsString := FieldAsText(AQuery, 'TIPO_DOC');
  if cdsPreview.FieldByName('TIPO_DOC').AsString = '' then
    cdsPreview.FieldByName('TIPO_DOC').AsString := 'C';
  cdsPreview.FieldByName('NUMERO_DOCUMENTO').AsString := FieldAsText(AQuery, 'CEDULA');
  cdsPreview.FieldByName('NOMBRES').AsString := FieldAsText(AQuery, 'NOMBRE');
  cdsPreview.FieldByName('PRIMER_APELLIDO').AsString := Ap1;
  cdsPreview.FieldByName('SEGUNDO_APELLIDO').AsString := Ap2;
  cdsPreview.FieldByName('SEXO').AsString := NormalizeSexo(FieldAsText(AQuery, 'SEXO'));
  if not VarIsNull(FieldAsDate(AQuery, 'FECHA_NAC')) then
    cdsPreview.FieldByName('FECHA_NACIMIENTO').AsDateTime := FieldAsDate(AQuery, 'FECHA_NAC');
end;

procedure TfrmTssExportCenter.AppendAutodetFromQuery(AQuery: TDataSet);
var
  Salario, OtrosIngresos, Regalia, Bonificacion, Vacaciones: Double;
begin
  Salario := FieldAsFloat(AQuery, 'SALARIO');
  OtrosIngresos := FieldAsFloat(AQuery, 'OTROS_INGRESOS');
  Regalia := FieldAsFloat(AQuery, 'REGALIA');
  Bonificacion := FieldAsFloat(AQuery, 'BONIFICACION');
  Vacaciones := FieldAsFloat(AQuery, 'VACACIONES');

  cdsPreview.Append;
  SetEmployerFields;
  cdsPreview.FieldByName('CLAVE_NOMINA').AsString := BuildClaveNomina(StrToIntDef(FieldAsText(AQuery, 'TIPO_NOMINA'), 0));
  AppendCommonWorkerFromQuery(AQuery);
  cdsPreview.FieldByName('SALARIO_COTIZABLE').AsFloat := Salario;
  cdsPreview.FieldByName('APORTE_VOLUNTARIO').AsFloat := 0;
  cdsPreview.FieldByName('SALARIO_ISR').AsFloat := Salario;
  cdsPreview.FieldByName('TIPO_INGRESO').AsString := NormalizeTipoIngreso(FieldAsText(AQuery, 'TIPO_ING'));
  cdsPreview.FieldByName('OTRAS_REMUNERACIONES').AsFloat := OtrosIngresos + Bonificacion + Vacaciones;
  cdsPreview.FieldByName('RNC_CED_AGENTE_RET').AsString := '';
  cdsPreview.FieldByName('REMUNERACION_OTROS_AGENTES').AsFloat := 0;
  cdsPreview.FieldByName('SALDO_FAVOR_PERIODO').AsFloat := 0;
  cdsPreview.FieldByName('REGALIA_PASCUAL').AsFloat := Regalia;
  cdsPreview.FieldByName('PREAVISO_CESANTIA_VIATICO').AsFloat := 0;
  cdsPreview.FieldByName('RETENCION_PENSION_ALIMENTICIA').AsFloat := FieldAsFloat(AQuery, 'TOTAL_PENSION');
  cdsPreview.FieldByName('SALARIO_INFOTEP').AsFloat := Salario;
  cdsPreview.Post;
end;

procedure TfrmTssExportCenter.AppendNovedadFromQuery(AQuery: TDataSet;
  const ATipoNovedad: string; const AFechaInicio, AFechaFin: Variant; ASalario: Double);
var
  OtrosIngresos: Double;
  Bonificacion: Double;
  Vacaciones: Double;
  Regalia: Double;
  SalarioInfotep: Double;
begin
  OtrosIngresos := FieldAsFloat(AQuery, 'OTROS_INGRESOS');
  Bonificacion := FieldAsFloat(AQuery, 'BONIFICACION');
  Vacaciones := FieldAsFloat(AQuery, 'VACACIONES');
  Regalia := FieldAsFloat(AQuery, 'REGALIA');

  cdsPreview.Append;
  SetEmployerFields;
  cdsPreview.FieldByName('CLAVE_NOMINA').AsString := BuildClaveNomina(StrToIntDef(FieldAsText(AQuery, 'TIPO_NOMINA'), 0));
  cdsPreview.FieldByName('TIPO_NOVEDAD').AsString := ATipoNovedad;

  if not VarIsNull(AFechaInicio) then
    cdsPreview.FieldByName('FECHA_INICIO').AsDateTime := AFechaInicio;

  if not VarIsNull(AFechaFin) then
    cdsPreview.FieldByName('FECHA_FIN').AsDateTime := AFechaFin;

  AppendCommonWorkerFromQuery(AQuery);

  cdsPreview.FieldByName('SALARIO_COTIZABLE_SDSS').AsFloat := ASalario;
  cdsPreview.FieldByName('APORTE_VOLUNTARIO_SDSS').AsFloat := 0;
  cdsPreview.FieldByName('TIPO_INGRESO').AsString := NormalizeTipoIngreso(FieldAsText(AQuery, 'TIPO_ING'));
  cdsPreview.FieldByName('SALARIO_ISR').AsFloat := ASalario;

  { Cualquier ingreso distinto de regalia es valido para ISR.
    Si hay bonificacion en una quincena, se reporta aqui como
    otras remuneraciones y luego el usuario puede generar la novedad BO. }
  cdsPreview.FieldByName('OTRAS_REMUNERACIONES').AsFloat :=
    OtrosIngresos + Bonificacion + Vacaciones;

  cdsPreview.FieldByName('RNC_CED_AGENTE_RET').AsString := '';
  cdsPreview.FieldByName('REMUNERACION_OTROS_AGENTES').AsFloat := 0;
  cdsPreview.FieldByName('SALDO_FAVOR_PERIODO').AsFloat := 0;
  cdsPreview.FieldByName('REGALIA_PASCUAL').AsFloat := Regalia;
  cdsPreview.FieldByName('PREAVISO_CESANTIA_VIATICO').AsFloat := 0;
  cdsPreview.FieldByName('RETENCION_PENSION_ALIMENTICIA').AsFloat := FieldAsFloat(AQuery, 'TOTAL_PENSION');

  SalarioInfotep := FieldAsFloat(AQuery, 'SALARIO_INFOTEP');
  if SalarioInfotep > 0 then
    cdsPreview.FieldByName('SALARIO_INFOTEP').AsFloat := SalarioInfotep
  else
    cdsPreview.FieldByName('SALARIO_INFOTEP').AsFloat := 0;

  if cdsPreview.FindField('ORIGEN') <> nil then
    cdsPreview.FieldByName('ORIGEN').AsString := FieldAsText(AQuery, 'ORIGEN');

  cdsPreview.Post;
end;

procedure TfrmTssExportCenter.LoadAutodeterminacionFromDb;
var
  Q: TIBQuery;
  FIni, FFin: TDateTime;
begin
  if not GetPeriodRange(FIni, FFin) then
  begin
    Log('Periodo invalido.');
    Exit;
  end;

  Q := CreateQuery;
  try
    Q.SQL.Clear;
    Q.SQL.Add('select');
    Q.SQL.Add('  ''C'' as tipo_doc,');
    Q.SQL.Add('  e.codigo,');
    Q.SQL.Add('  e.cedula,');
    Q.SQL.Add('  e.nombre,');
    Q.SQL.Add('  e.apellido,');
    Q.SQL.Add('  e.fecha_nac,');
    Q.SQL.Add('  e.sexo,');
    Q.SQL.Add('  e.tipo_nomina,');
    Q.SQL.Add('  e.tipo_empleado,');
    Q.SQL.Add('  coalesce(e.tipo_ing, 1) tipo_ing,');
    Q.SQL.Add('  sum(coalesce(n.salario_bruto, 0)) salario,');
    Q.SQL.Add('  sum(coalesce(n.otros_ingresos, 0)) otros_ingresos,');
    Q.SQL.Add('  sum(coalesce(n.regalia, 0)) regalia,');
    Q.SQL.Add('  sum(coalesce(n.bonificacion, 0)) bonificacion,');
    Q.SQL.Add('  sum(coalesce(n.vacaciones, 0)) vacaciones,');
    AddPensionTotalSelect(Q, False);
    Q.SQL.Add('from empleado e');
    Q.SQL.Add('inner join nomina n on e.codigo = n.codigo_emp');
    Q.SQL.Add('where e.status between ''A'' and ''Z''');
    Q.SQL.Add('  and n.fecha_nomina between :fecha_ini and :fecha_fin');
    Q.SQL.Add('  and n.status_nomina = ''R''');
    Q.SQL.Add('  and e.codigo_cia = :codigo_cia');
    Q.SQL.Add('  and coalesce(e.paga_afp, 0) = 1');
    Q.SQL.Add('group by');
    Q.SQL.Add('  e.codigo,');
    Q.SQL.Add('  e.cedula,');
    Q.SQL.Add('  e.nombre,');
    Q.SQL.Add('  e.apellido,');
    Q.SQL.Add('  e.fecha_nac,');
    Q.SQL.Add('  e.sexo,');
    Q.SQL.Add('  e.tipo_nomina,');
    Q.SQL.Add('  e.tipo_empleado,');
    Q.SQL.Add('  e.tipo_ing');
    Q.SQL.Add('order by e.nombre, e.apellido');

    SetPensionParams(Q, FIni, FFin);
    Q.Open;
    while not Q.Eof do
    begin
      AppendAutodetFromQuery(Q);
      Q.Next;
    end;
  finally
    Q.Free;
  end;
end;

procedure TfrmTssExportCenter.LoadNovedadesFromDb;
var
  Q: TIBQuery;
  FIni, FFin: TDateTime;
  FechaIni, FechaFin: Variant;
  Salario: Double;
begin
  if not GetPeriodRange(FIni, FFin) then
  begin
    Log('Periodo invalido.');
    Exit;
  end;

  Q := CreateQuery;
  try
    { IN - nomina posteada del periodo.
      Este bloque genera la novedad mensual base desde NOMINA.
      Suma primera y segunda quincena, siempre que STATUS_NOMINA = R. }
    Q.SQL.Clear;
    Q.SQL.Add('select ''NOMINA.STATUS_NOMINA=R'' origen,');
    Q.SQL.Add('       ''C'' tipo_doc,');
    Q.SQL.Add('       e.codigo, e.cedula, e.nombre, e.apellido, e.fecha_nac, e.sexo,');
    Q.SQL.Add('       e.fecha_entrada, e.fecha_salida,');
    Q.SQL.Add('       e.tipo_nomina, e.tipo_empleado, coalesce(e.tipo_ing, 1) tipo_ing,');
    Q.SQL.Add('       sum(coalesce(n.salario_bruto,0)) salario,');
    Q.SQL.Add('       sum(coalesce(n.otros_ingresos,0)) otros_ingresos,');
    Q.SQL.Add('       sum(coalesce(n.regalia,0)) regalia,');
    Q.SQL.Add('       sum(coalesce(n.bonificacion,0)) bonificacion,');
    Q.SQL.Add('       sum(coalesce(n.vacaciones,0)) vacaciones,');
    Q.SQL.Add('       cast(0 as double precision) salario_infotep,');
    AddPensionTotalSelect(Q, False);
    Q.SQL.Add('from empleado e');
    Q.SQL.Add('inner join nomina n on n.codigo_emp = e.codigo');
    Q.SQL.Add('where e.status between ''A'' and ''Z''');
    Q.SQL.Add('  and n.fecha_nomina between :fecha_ini and :fecha_fin');
    Q.SQL.Add('  and n.status_nomina = ''R''');
    Q.SQL.Add('  and e.codigo_cia = :codigo_cia');
    Q.SQL.Add('  and coalesce(e.paga_afp,0) = 1');
    Q.SQL.Add('group by e.codigo, e.cedula, e.nombre, e.apellido, e.fecha_nac, e.sexo,');
    Q.SQL.Add('         e.fecha_entrada, e.fecha_salida,');
    Q.SQL.Add('         e.tipo_nomina, e.tipo_empleado, e.tipo_ing');
    Q.SQL.Add('having sum(coalesce(n.salario_bruto,0)) <> 0');
    Q.SQL.Add('    or sum(coalesce(n.otros_ingresos,0)) <> 0');
    Q.SQL.Add('    or sum(coalesce(n.regalia,0)) <> 0');
    Q.SQL.Add('    or sum(coalesce(n.bonificacion,0)) <> 0');
    Q.SQL.Add('    or sum(coalesce(n.vacaciones,0)) <> 0');
    Q.SQL.Add('order by e.nombre, e.apellido');

    SetPensionParams(Q, FIni, FFin);
    Q.Open;
    while not Q.Eof do
    begin
      AppendNovedadFromQuery(
        Q,
        'IN',
        FieldAsDate(Q, 'FECHA_ENTRADA'),
        FieldAsDate(Q, 'FECHA_SALIDA'),
        FieldAsFloat(Q, 'SALARIO')
      );
      Q.Next;
    end;
    Q.Close;

    // IN - ingresos por fecha de entrada.
    // Solo aplica cuando el empleado entro en el periodo,
    // pero todavia no tiene nomina posteada STATUS_NOMINA = R.
    Q.SQL.Clear;
    Q.SQL.Add('select');
    Q.SQL.Add('  ''EMPLEADO.FECHA_ENTRADA'' origen,');
    Q.SQL.Add('  ''C'' tipo_doc,');
    Q.SQL.Add('  e.codigo,');
    Q.SQL.Add('  e.cedula,');
    Q.SQL.Add('  e.nombre,');
    Q.SQL.Add('  e.apellido,');
    Q.SQL.Add('  e.fecha_nac,');
    Q.SQL.Add('  e.sexo,');
    AddPensionTotalSelect(Q, True);
    Q.SQL.Add('  e.tipo_nomina,');
    Q.SQL.Add('  coalesce(e.tipo_ing, 1) tipo_ing,');
    Q.SQL.Add('  e.salario,');
    Q.SQL.Add('  cast(0 as double precision) otros_ingresos,');
    Q.SQL.Add('  cast(0 as double precision) regalia,');
    Q.SQL.Add('  cast(0 as double precision) bonificacion,');
    Q.SQL.Add('  cast(0 as double precision) vacaciones,');
    Q.SQL.Add('  cast(0 as double precision) salario_infotep,');
    Q.SQL.Add('  e.fecha_entrada,');
    Q.SQL.Add('  e.fecha_salida');
    Q.SQL.Add('from empleado e');
    Q.SQL.Add('where e.fecha_entrada between :fecha_ini and :fecha_fin');
    Q.SQL.Add('  and e.codigo_cia = :codigo_cia');
    Q.SQL.Add('  and not exists (');
    Q.SQL.Add('    select 1');
    Q.SQL.Add('    from nomina n');
    Q.SQL.Add('    where n.codigo_emp = e.codigo');
    Q.SQL.Add('      and n.fecha_nomina between :fecha_ini and :fecha_fin');
    Q.SQL.Add('      and n.status_nomina = ''R''');
    Q.SQL.Add('  )');
    Q.SQL.Add('order by e.fecha_entrada, e.nombre');

    SetPensionParams(Q, FIni, FFin);
    Q.Open;
    while not Q.Eof do
    begin
      AppendNovedadFromQuery(
        Q,
        'IN',
        FieldAsDate(Q, 'FECHA_ENTRADA'),
        FieldAsDate(Q, 'FECHA_SALIDA'),
        FieldAsFloat(Q, 'SALARIO')
      );
      Q.Next;
    end;
    Q.Close;

    // SA - salidas por fecha de salida.
    Q.SQL.Clear;
    Q.SQL.Add('select');
    Q.SQL.Add('  ''EMPLEADO.FECHA_SALIDA'' origen,');
    Q.SQL.Add('  ''C'' tipo_doc,');
    Q.SQL.Add('  e.codigo,');
    Q.SQL.Add('  e.cedula,');
    Q.SQL.Add('  e.nombre,');
    Q.SQL.Add('  e.apellido,');
    Q.SQL.Add('  e.fecha_nac,');
    Q.SQL.Add('  e.sexo,');
    AddPensionTotalSelect(Q, True);
    Q.SQL.Add('  e.tipo_nomina,');
    Q.SQL.Add('  coalesce(e.tipo_ing, 1) tipo_ing,');
    Q.SQL.Add('  e.salario,');
    Q.SQL.Add('  cast(0 as double precision) otros_ingresos,');
    Q.SQL.Add('  cast(0 as double precision) regalia,');
    Q.SQL.Add('  cast(0 as double precision) bonificacion,');
    Q.SQL.Add('  cast(0 as double precision) vacaciones,');
    Q.SQL.Add('  cast(0 as double precision) salario_infotep,');
    Q.SQL.Add('  e.fecha_entrada,');
    Q.SQL.Add('  e.fecha_salida');
    Q.SQL.Add('from empleado e');
    Q.SQL.Add('where e.fecha_salida between :fecha_ini and :fecha_fin');
    Q.SQL.Add('  and e.codigo_cia = :codigo_cia');
    Q.SQL.Add('order by e.fecha_salida, e.nombre');

    SetPensionParams(Q, FIni, FFin);
    Q.Open;
    while not Q.Eof do
    begin
      AppendNovedadFromQuery(
        Q,
        'SA',
        FieldAsDate(Q, 'FECHA_ENTRADA'),
        FieldAsDate(Q, 'FECHA_SALIDA'),
        0
      );
      Q.Next;
    end;
    Q.Close;

    // AD - cambios de salario desde HISTORICO_EMPLEADOS.
    Q.SQL.Clear;
    Q.SQL.Add('select');
    Q.SQL.Add('  ''HISTORICO_EMPLEADOS.SALARIO'' origen,');
    Q.SQL.Add('  ''C'' tipo_doc,');
    Q.SQL.Add('  e.codigo,');
    Q.SQL.Add('  e.cedula,');
    Q.SQL.Add('  e.nombre,');
    Q.SQL.Add('  e.apellido,');
    Q.SQL.Add('  e.fecha_nac,');
    Q.SQL.Add('  e.sexo,');
    AddPensionTotalSelect(Q, True);
    Q.SQL.Add('  e.tipo_nomina,');
    Q.SQL.Add('  coalesce(e.tipo_ing, 1) tipo_ing,');
    Q.SQL.Add('  h.fecha_cambio,');
    Q.SQL.Add('  h.salario_nuevo,');
    Q.SQL.Add('  cast(0 as double precision) otros_ingresos,');
    Q.SQL.Add('  cast(0 as double precision) regalia,');
    Q.SQL.Add('  cast(0 as double precision) bonificacion,');
    Q.SQL.Add('  cast(0 as double precision) vacaciones,');
    Q.SQL.Add('  cast(0 as double precision) salario_infotep');
    Q.SQL.Add('from historico_empleados h');
    Q.SQL.Add('inner join empleado e on e.codigo = h.codigo');
    Q.SQL.Add('where h.fecha_cambio between :fecha_ini and :fecha_fin');
    Q.SQL.Add('  and e.codigo_cia = :codigo_cia');
    Q.SQL.Add('  and (h.codigo_tipo_trans = 1');
    Q.SQL.Add('       or upper(coalesce(h.campo_cambiado, '''')) = ''SALARIO'')');
    Q.SQL.Add('order by h.fecha_cambio, e.nombre');

    SetPensionParams(Q, FIni, FFin);
    Q.Open;
    while not Q.Eof do
    begin
      AppendNovedadFromQuery(
        Q,
        'AD',
        FieldAsDate(Q, 'FECHA_CAMBIO'),
        Null,
        FieldAsFloat(Q, 'SALARIO_NUEVO')
      );
      Q.Next;
    end;
    Q.Close;

    // VC - vacaciones desde VACACIONES + EMPLEADO.
    // FECHA_EFECTIVA = inicio real.
    // CANT_DIAS = dias a disfrutar.
    // FECHAVACACIONES = fecha pago.
    Q.SQL.Clear;
    Q.SQL.Add('select');
    Q.SQL.Add('  ''VACACIONES'' origen,');
    Q.SQL.Add('  ''C'' tipo_doc,');
    Q.SQL.Add('  e.codigo,');
    Q.SQL.Add('  e.cedula,');
    Q.SQL.Add('  e.nombre,');
    Q.SQL.Add('  e.apellido,');
    Q.SQL.Add('  e.fecha_nac,');
    Q.SQL.Add('  e.sexo,');
    AddPensionTotalSelect(Q, True);
    Q.SQL.Add('  e.tipo_nomina,');
    Q.SQL.Add('  coalesce(e.tipo_ing, 1) tipo_ing,');
    Q.SQL.Add('  e.salario,');
    Q.SQL.Add('  cast(0 as double precision) otros_ingresos,');
    Q.SQL.Add('  cast(0 as double precision) regalia,');
    Q.SQL.Add('  cast(0 as double precision) bonificacion,');
    Q.SQL.Add('  cast(0 as double precision) vacaciones,');
    Q.SQL.Add('  cast(0 as double precision) salario_infotep,');
    Q.SQL.Add('  v.fecha_efectiva,');
    Q.SQL.Add('  v.cant_dias');
    Q.SQL.Add('from empleado e');
    Q.SQL.Add('inner join vacaciones v on v.codigo = e.codigo');
    Q.SQL.Add('where v.fecha_efectiva between :fecha_ini and :fecha_fin');
    Q.SQL.Add('  and e.codigo_cia = :codigo_cia');
    Q.SQL.Add('order by v.fecha_efectiva, e.nombre');

    SetPensionParams(Q, FIni, FFin);
    try
      Q.Open;
      while not Q.Eof do
      begin
        FechaIni := FieldAsDate(Q, 'FECHA_EFECTIVA');
        FechaFin := Null;
        if not VarIsNull(FechaIni) then
          FechaFin := AddBusinessDays(
            FechaIni,
            StrToIntDef(FieldAsText(Q, 'CANT_DIAS'), 0)
          );

        AppendNovedadFromQuery(
          Q,
          'VC',
          FechaIni,
          FechaFin,
          FieldAsFloat(Q, 'SALARIO')
        );
        Q.Next;
      end;
    except
      on E: Exception do
        Log('Aviso: no se pudo leer VACACIONES. ' +
          'Verifique tabla/campos CODIGO, FECHA_EFECTIVA, CANT_DIAS. ' +
          E.Message);
    end;
    Q.Close;

    // LM/LD/LV/OT manual desde TSS_NOVEDAD_MANUAL.
    Q.SQL.Clear;
    Q.SQL.Add('select');
    Q.SQL.Add('  ''TSS_NOVEDAD_MANUAL'' origen,');
    Q.SQL.Add('  ''C'' tipo_doc,');
    Q.SQL.Add('  e.codigo,');
    Q.SQL.Add('  e.cedula,');
    Q.SQL.Add('  e.nombre,');
    Q.SQL.Add('  e.apellido,');
    Q.SQL.Add('  e.fecha_nac,');
    Q.SQL.Add('  e.sexo,');
    AddPensionTotalSelect(Q, True);
    Q.SQL.Add('  e.tipo_nomina,');
    Q.SQL.Add('  coalesce(e.tipo_ing, 1) tipo_ing,');
    Q.SQL.Add('  e.salario,');
    Q.SQL.Add('  cast(0 as double precision) otros_ingresos,');
    Q.SQL.Add('  cast(0 as double precision) regalia,');
    Q.SQL.Add('  cast(0 as double precision) bonificacion,');
    Q.SQL.Add('  cast(0 as double precision) vacaciones,');
    Q.SQL.Add('  cast(0 as double precision) salario_infotep,');
    Q.SQL.Add('  m.tipo_novedad,');
    Q.SQL.Add('  m.fecha_inicio,');
    Q.SQL.Add('  m.fecha_fin,');
    Q.SQL.Add('  m.salario_nuevo');
    Q.SQL.Add('from tss_novedad_manual m');
    Q.SQL.Add('inner join empleado e on e.codigo = m.codigo_emp');
    Q.SQL.Add('where coalesce(m.status, ''A'') = ''A''');
    Q.SQL.Add('  and m.fecha_inicio between :fecha_ini and :fecha_fin');
    Q.SQL.Add('  and e.codigo_cia = :codigo_cia');
    Q.SQL.Add('order by m.fecha_inicio, e.nombre');

    SetPensionParams(Q, FIni, FFin);
    try
      Q.Open;
      while not Q.Eof do
      begin
        Salario := FieldAsFloat(Q, 'SALARIO');
        if FieldAsFloat(Q, 'SALARIO_NUEVO') > 0 then
          Salario := FieldAsFloat(Q, 'SALARIO_NUEVO');

        AppendNovedadFromQuery(
          Q,
          UpperCase(FieldAsText(Q, 'TIPO_NOVEDAD')),
          FieldAsDate(Q, 'FECHA_INICIO'),
          FieldAsDate(Q, 'FECHA_FIN'),
          Salario
        );
        Q.Next;
      end;
    except
      on E: Exception do
        Log('Aviso: no se pudo leer TSS_NOVEDAD_MANUAL. ' +
          'Ejecute el script de tablas complementarias TSS. ' +
          E.Message);
    end;
  finally
    Q.Free;
  end;
end;

procedure TfrmTssExportCenter.LoadBonificacionFromDb;
var
  Q: TIBQuery;
  FIni, FFin: TDateTime;
  Ap1, Ap2: string;
begin
  if not GetPeriodRange(FIni, FFin) then
  begin
    Log('Periodo invalido.');
    Exit;
  end;

  Q := CreateQuery;
  try
    Q.SQL.Clear;
    Q.SQL.Add('select');
    Q.SQL.Add('  ''C'' tipo_doc,');
    Q.SQL.Add('  e.cedula,');
    Q.SQL.Add('  e.nombre,');
    Q.SQL.Add('  e.apellido,');
    Q.SQL.Add('  e.fecha_nac,');
    Q.SQL.Add('  e.sexo,');
    Q.SQL.Add('  sum(coalesce(n.bonificacion, 0)) monto_bonificacion');
    Q.SQL.Add('from empleado e');
    Q.SQL.Add('inner join nomina n on n.codigo_emp = e.codigo');
    Q.SQL.Add('where n.fecha_nomina between :fecha_ini and :fecha_fin');
    Q.SQL.Add('  and n.status_nomina = ''R''');
    Q.SQL.Add('  and e.codigo_cia = :codigo_cia');
    Q.SQL.Add('group by');
    Q.SQL.Add('  e.cedula,');
    Q.SQL.Add('  e.nombre,');
    Q.SQL.Add('  e.apellido,');
    Q.SQL.Add('  e.fecha_nac,');
    Q.SQL.Add('  e.sexo');
    Q.SQL.Add('having sum(coalesce(n.bonificacion, 0)) > 0');
    Q.SQL.Add('order by e.nombre');

    SetPensionParams(Q, FIni, FFin);
    Q.Open;
    while not Q.Eof do
    begin
      SplitApellido(FieldAsText(Q, 'APELLIDO'), Ap1, Ap2);
      cdsPreview.Append;
      SetEmployerFields;
      cdsPreview.FieldByName('TIPO_DOC').AsString := 'C';
      cdsPreview.FieldByName('NUMERO_DOCUMENTO').AsString :=
        FieldAsText(Q, 'CEDULA');
      cdsPreview.FieldByName('NOMBRES').AsString := FieldAsText(Q, 'NOMBRE');
      cdsPreview.FieldByName('PRIMER_APELLIDO').AsString := Ap1;
      cdsPreview.FieldByName('SEGUNDO_APELLIDO').AsString := Ap2;
      cdsPreview.FieldByName('SEXO').AsString :=
        NormalizeSexo(FieldAsText(Q, 'SEXO'));
      if not VarIsNull(FieldAsDate(Q, 'FECHA_NAC')) then
        cdsPreview.FieldByName('FECHA_NACIMIENTO').AsDateTime :=
          FieldAsDate(Q, 'FECHA_NAC');
      cdsPreview.FieldByName('MONTO_BONIFICACION').AsFloat :=
        FieldAsFloat(Q, 'MONTO_BONIFICACION');
      cdsPreview.Post;
      Q.Next;
    end;
  finally
    Q.Free;
  end;
end;

procedure TfrmTssExportCenter.AppendDependienteFromQuery(AQuery: TDataSet);
var
  Ap1, Ap2, NombreCompleto, TipoNov: string;
  P: Integer;
begin
  NombreCompleto := Trim(FieldAsText(AQuery, 'NOMBRE_DEPENDIENTE'));
  P := Pos(' ', NombreCompleto);
  if P > 0 then
  begin
    Ap1 := Trim(Copy(NombreCompleto, P + 1, Length(NombreCompleto)));
    NombreCompleto := Copy(NombreCompleto, 1, P - 1);
    Ap2 := '';
  end
  else
  begin
    Ap1 := '';
    Ap2 := '';
  end;

  TipoNov := 'SD';
  if UpperCase(FieldAsText(AQuery, 'STATUS_DEP')) = 'A' then
    TipoNov := 'ID';

  cdsPreview.Append;
  SetEmployerFields;
  cdsPreview.FieldByName('CLAVE_NOMINA').AsString := BuildClaveNomina(StrToIntDef(FieldAsText(AQuery, 'TIPO_NOMINA'), 0));
  cdsPreview.FieldByName('TIPO_DOC_TITULAR').AsString := 'C';
  cdsPreview.FieldByName('NRO_DOC_TITULAR').AsString := FieldAsText(AQuery, 'CEDULA_TITULAR');
  cdsPreview.FieldByName('TIPO_NOVEDAD').AsString := TipoNov;
  cdsPreview.FieldByName('TIPO_DOC_DEPENDIENTE').AsString := 'C';
  cdsPreview.FieldByName('NRO_DOC_DEPENDIENTE').AsString := FieldAsText(AQuery, 'CEDULA_DEP');
  cdsPreview.FieldByName('NOMBRES_DEPENDIENTE').AsString := NombreCompleto;
  cdsPreview.FieldByName('PRIMER_APELLIDO_DEPENDIENTE').AsString := Ap1;
  cdsPreview.FieldByName('SEGUNDO_APELLIDO_DEPENDIENTE').AsString := Ap2;
  cdsPreview.Post;
end;

procedure TfrmTssExportCenter.LoadDependientesFromDb;
var
  Q: TIBQuery;
begin
  Q := CreateQuery;
  try
    Q.SQL.Clear;
    Q.SQL.Add('select');
    Q.SQL.Add('  e.tipo_nomina,');
    Q.SQL.Add('  e.cedula cedula_titular,');
    Q.SQL.Add('  d.cedula cedula_dep,');
    Q.SQL.Add('  d.nss,');
    Q.SQL.Add('  d.nombre_dependiente,');
    Q.SQL.Add('  d.status status_dep');
    Q.SQL.Add('from descuento_dependiente_d d');
    Q.SQL.Add('inner join empleado e on e.codigo = d.codigo_emp');
    Q.SQL.Add('where e.codigo_cia = :codigo_cia');
    Q.SQL.Add('order by e.nombre, d.nombre_dependiente');

    SetPensionParams(Q, 0, 0);
    Q.Open;
    while not Q.Eof do
    begin
      AppendDependienteFromQuery(Q);
      Q.Next;
    end;
  finally
    Q.Free;
  end;
end;

procedure TfrmTssExportCenter.LoadRectificativaIR3FromDb;
var
  Q: TIBQuery;
  FIni, FFin: TDateTime;
begin
  if not GetPeriodRange(FIni, FFin) then
  begin
    Log('Periodo invalido.');
    Exit;
  end;

  Q := CreateQuery;
  try
    Q.SQL.Clear;
    Q.SQL.Add('select');
    Q.SQL.Add('  ''C'' tipo_doc,');
    Q.SQL.Add('  e.codigo,');
    Q.SQL.Add('  e.cedula,');
    Q.SQL.Add('  e.nombre,');
    Q.SQL.Add('  e.apellido,');
    Q.SQL.Add('  e.fecha_nac,');
    Q.SQL.Add('  e.sexo,');
    Q.SQL.Add('  e.tipo_empleado,');
    Q.SQL.Add('  coalesce(e.tipo_ing, 1) tipo_ing,');
    Q.SQL.Add('  sum(coalesce(n.salario_bruto, 0)) salario,');
    Q.SQL.Add('  sum(coalesce(n.otros_ingresos, 0)) otros_ingresos,');
    Q.SQL.Add('  sum(coalesce(n.regalia, 0)) regalia,');
    AddPensionTotalSelect(Q, False);
    Q.SQL.Add('from empleado e');
    Q.SQL.Add('inner join nomina n on n.codigo_emp = e.codigo');
    Q.SQL.Add('where n.fecha_nomina between :fecha_ini and :fecha_fin');
    Q.SQL.Add('  and e.codigo_cia = :codigo_cia');
    Q.SQL.Add('group by');
    Q.SQL.Add('  e.codigo,');
    Q.SQL.Add('  e.cedula,');
    Q.SQL.Add('  e.nombre,');
    Q.SQL.Add('  e.apellido,');
    Q.SQL.Add('  e.fecha_nac,');
    Q.SQL.Add('  e.sexo,');
    Q.SQL.Add('  e.tipo_empleado');
    Q.SQL.Add('order by e.nombre');

    SetPensionParams(Q, FIni, FFin);
    Q.Open;
    while not Q.Eof do
    begin
      cdsPreview.Append;
      SetEmployerFields;
      cdsPreview.FieldByName('TIPO_TRABAJADOR').AsString :=
        FieldAsText(Q, 'TIPO_EMPLEADO');
      AppendCommonWorkerFromQuery(Q);
      cdsPreview.FieldByName('SALARIO_COTIZABLE').AsFloat :=
        FieldAsFloat(Q, 'SALARIO');
      cdsPreview.FieldByName('APORTE_VOLUNTARIO').AsFloat := 0;
      cdsPreview.FieldByName('SALARIO_ISR').AsFloat :=
        FieldAsFloat(Q, 'SALARIO');
      cdsPreview.FieldByName('OTRAS_REMUNERACIONES').AsFloat :=
        FieldAsFloat(Q, 'OTROS_INGRESOS');
      cdsPreview.FieldByName('RNC_CED_AGENTE_RET').AsString := '';
      cdsPreview.FieldByName('REMUNERACION_OTROS_AGENTES').AsFloat := 0;
      cdsPreview.FieldByName('SALDO_FAVOR_PERIODO').AsFloat := 0;
      cdsPreview.FieldByName('REGALIA_PASCUAL').AsFloat :=
        FieldAsFloat(Q, 'REGALIA');
      cdsPreview.FieldByName('PREAVISO_CESANTIA_VIATICO').AsFloat := 0;
      cdsPreview.FieldByName('RETENCION_PENSION_ALIMENTICIA').AsFloat :=
        FieldAsFloat(Q, 'TOTAL_PENSION');
      cdsPreview.Post;
      Q.Next;
    end;
  finally
    Q.Free;
  end;
end;

function TfrmTssExportCenter.BuildNovedadesExcelTemplateFileName: string;
var
  Candidate: string;
begin
  Result := '';

  Candidate := TssAddSlash(ExtractFilePath(Application.ExeName)) +
    'Plantilla-Excel' + #174 + '-de-Archivo-Novedades-v5.1.xls';
  if FileExists(Candidate) then
  begin
    Result := Candidate;
    Exit;
  end;

  Candidate := TssAddSlash(ExtractFilePath(Application.ExeName)) +
    'Plantilla-Excel-de-Archivo-Novedades-v5.1.xls';
  if FileExists(Candidate) then
  begin
    Result := Candidate;
    Exit;
  end;

  Candidate := TssAddSlash(edtOutputFolder.Text) +
    'Plantilla-Excel' + #174 + '-de-Archivo-Novedades-v5.1.xls';
  if FileExists(Candidate) then
  begin
    Result := Candidate;
    Exit;
  end;

  Candidate := TssAddSlash(edtOutputFolder.Text) +
    'Plantilla-Excel-de-Archivo-Novedades-v5.1.xls';
  if FileExists(Candidate) then
    Result := Candidate;
end;

function TfrmTssExportCenter.BuildNovedadesExcelOutputFileName(
  const ATxtFileName: string): string;
begin
  Result := ChangeFileExt(ATxtFileName, '.xls');
end;

procedure TfrmTssExportCenter.TryUnprotectNovedadesWorksheet(
  const AWorkBook, ASheet: OleVariant);
begin
  {
    La plantilla oficial de Novedades puede venir con la hoja protegida.
    Si intentamos escribir en A14:Y... sin desproteger, Excel lanza:
    "La celda o el grafico que intenta modificar estan protegidos".

    Primero intentamos desproteger sin clave. Si la plantilla tuviera
    contrasena real, Excel no permitira modificarla y se informara en el log.
  }
  try
    AWorkBook.Unprotect;
  except
  end;

  try
    AWorkBook.Unprotect('');
  except
  end;

  try
    ASheet.Unprotect;
  except
  end;

  try
    ASheet.Unprotect('');
  except
  end;

  try
    if ASheet.ProtectContents then
      raise Exception.Create(
        'La plantilla Excel NV esta protegida con contrasena. ' +
        'Abra la plantilla, desproteja la hoja y guardela junto al EXE o en la carpeta de salida.'
      );
  except
    on E: Exception do
      raise;
  end;
end;

procedure TfrmTssExportCenter.SetExcelCellText(const ASheet: OleVariant;
  ARow, ACol: Integer; const AValue: string);
begin
  {
    No usamos Range.NumberFormat := '@' porque algunas plantillas .xls
    protegidas/heredadas o algunas versiones de Excel lanzan:
    "No se puede asignar la propiedad NumberFormat de la clase Range".

    Para conservar ceros a la izquierda y fechas posicionales DDMMYYYY,
    escribimos el valor como texto mediante apostrofe oculto de Excel.
  }
  if Trim(AValue) = '' then
    ASheet.Cells[ARow, ACol].Value := ''
  else
    ASheet.Cells[ARow, ACol].Value := #39 + AValue;
end;

procedure TfrmTssExportCenter.SetExcelCellNumber(const ASheet: OleVariant;
  ARow, ACol: Integer; AValue: Double);
begin
  ASheet.Cells[ARow, ACol].Value := AValue;
end;

procedure TfrmTssExportCenter.WriteNovedadesExcelCurrentRow(const ASheet: OleVariant;
  ARow: Integer);
var
  FechaIni, FechaFin, FechaNac: string;
  Exentos: Double;
begin
  FechaIni := '';
  FechaFin := '';
  FechaNac := '';

  if (cdsPreview.FindField('FECHA_INICIO') <> nil) and
     (not cdsPreview.FieldByName('FECHA_INICIO').IsNull) then
    FechaIni := FormatDateTime('ddmmyyyy', cdsPreview.FieldByName('FECHA_INICIO').AsDateTime);

  if (cdsPreview.FindField('FECHA_FIN') <> nil) and
     (not cdsPreview.FieldByName('FECHA_FIN').IsNull) then
    FechaFin := FormatDateTime('ddmmyyyy', cdsPreview.FieldByName('FECHA_FIN').AsDateTime);

  if (cdsPreview.FindField('FECHA_NACIMIENTO') <> nil) and
     (not cdsPreview.FieldByName('FECHA_NACIMIENTO').IsNull) then
    FechaNac := FormatDateTime('ddmmyyyy', cdsPreview.FieldByName('FECHA_NACIMIENTO').AsDateTime);

  Exentos := FieldAsFloat(cdsPreview, 'REGALIA_PASCUAL') +
             FieldAsFloat(cdsPreview, 'PREAVISO_CESANTIA_VIATICO') +
             FieldAsFloat(cdsPreview, 'RETENCION_PENSION_ALIMENTICIA');

  SetExcelCellText(ASheet, ARow, 1, 'D');
  SetExcelCellText(ASheet, ARow, 2, FieldAsText(cdsPreview, 'CLAVE_NOMINA'));
  SetExcelCellText(ASheet, ARow, 3, FieldAsText(cdsPreview, 'TIPO_NOVEDAD'));
  SetExcelCellText(ASheet, ARow, 4, FechaIni);
  SetExcelCellText(ASheet, ARow, 5, FechaFin);
  SetExcelCellText(ASheet, ARow, 6, FieldAsText(cdsPreview, 'TIPO_DOC'));
  SetExcelCellText(ASheet, ARow, 7, FieldAsText(cdsPreview, 'NUMERO_DOCUMENTO'));
  SetExcelCellText(ASheet, ARow, 8, FieldAsText(cdsPreview, 'NOMBRES'));
  SetExcelCellText(ASheet, ARow, 9, FieldAsText(cdsPreview, 'PRIMER_APELLIDO'));
  SetExcelCellText(ASheet, ARow, 10, FieldAsText(cdsPreview, 'SEGUNDO_APELLIDO'));
  SetExcelCellText(ASheet, ARow, 11, FieldAsText(cdsPreview, 'SEXO'));
  SetExcelCellText(ASheet, ARow, 12, FechaNac);
  SetExcelCellNumber(ASheet, ARow, 13, FieldAsFloat(cdsPreview, 'SALARIO_COTIZABLE_SDSS'));
  SetExcelCellNumber(ASheet, ARow, 14, FieldAsFloat(cdsPreview, 'APORTE_VOLUNTARIO_SDSS'));
  SetExcelCellNumber(ASheet, ARow, 15, FieldAsFloat(cdsPreview, 'SALARIO_ISR'));
  SetExcelCellNumber(ASheet, ARow, 16, FieldAsFloat(cdsPreview, 'OTRAS_REMUNERACIONES'));
  SetExcelCellText(ASheet, ARow, 17, FieldAsText(cdsPreview, 'RNC_CED_AGENTE_RET'));
  SetExcelCellNumber(ASheet, ARow, 18, FieldAsFloat(cdsPreview, 'REMUNERACION_OTROS_AGENTES'));
  SetExcelCellNumber(ASheet, ARow, 19, Exentos);
  SetExcelCellNumber(ASheet, ARow, 20, FieldAsFloat(cdsPreview, 'SALDO_FAVOR_PERIODO'));
  SetExcelCellNumber(ASheet, ARow, 21, FieldAsFloat(cdsPreview, 'SALARIO_INFOTEP'));
  SetExcelCellText(ASheet, ARow, 22, FieldAsText(cdsPreview, 'TIPO_INGRESO'));
  SetExcelCellNumber(ASheet, ARow, 23, FieldAsFloat(cdsPreview, 'REGALIA_PASCUAL'));
  SetExcelCellNumber(ASheet, ARow, 24, FieldAsFloat(cdsPreview, 'PREAVISO_CESANTIA_VIATICO'));
  SetExcelCellNumber(ASheet, ARow, 25, FieldAsFloat(cdsPreview, 'RETENCION_PENSION_ALIMENTICIA'));
end;

procedure TfrmTssExportCenter.GenerateNovedadesExcelFromTemplate(
  const ATxtFileName: string);
var
  TemplateFile, ExcelFile: string;
  ExcelApp, WorkBook, WorkSheet: OleVariant;
  Row: Integer;
  Bmk: TBookmark;
begin
  if CurrentKind <> tekNovedades then
    Exit;

  if (cdsPreview = nil) or (not cdsPreview.Active) or cdsPreview.IsEmpty then
    Exit;

  TemplateFile := BuildNovedadesExcelTemplateFileName;
  if TemplateFile = '' then
  begin
    Log('Aviso: no se genero Excel NV. No se encontro la plantilla Plantilla-Excel-de-Archivo-Novedades-v5.1.xls junto al EXE o en la carpeta de salida.');
    Exit;
  end;

  ExcelFile := BuildNovedadesExcelOutputFileName(ATxtFileName);
  ExcelApp := Unassigned;
  WorkBook := Unassigned;
  Bmk := nil;

  try
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.DisplayAlerts := False;
    WorkBook := ExcelApp.Workbooks.Open(TemplateFile);
    WorkSheet := WorkBook.Worksheets[1];

    TryUnprotectNovedadesWorksheet(WorkBook, WorkSheet);

    try
      WorkSheet.Range['A14:Y65536'].ClearContents;
    except
    end;

    Row := 14;
    cdsPreview.DisableControls;
    try
      Bmk := cdsPreview.GetBookmark;
      cdsPreview.First;
      while not cdsPreview.Eof do
      begin
        WriteNovedadesExcelCurrentRow(WorkSheet, Row);
        Inc(Row);
        cdsPreview.Next;
      end;
      if Bmk <> nil then
        cdsPreview.GotoBookmark(Bmk);
    finally
      if Bmk <> nil then
        cdsPreview.FreeBookmark(Bmk);
      cdsPreview.EnableControls;
    end;

    if FileExists(ExcelFile) then
      DeleteFile(ExcelFile);

    WorkBook.SaveAs(ExcelFile, 56);
    WorkBook.Close(False);
    ExcelApp.Quit;

    Log('Excel NV generado desde plantilla: ' + ExcelFile);
  except
    on E: Exception do
    begin
      try
        if not VarIsEmpty(WorkBook) then
          WorkBook.Close(False);
      except
      end;
      try
        if not VarIsEmpty(ExcelApp) then
          ExcelApp.Quit;
      except
      end;
      Log('Aviso: TXT generado, pero no se pudo crear Excel NV desde plantilla. ' + E.Message);
    end;
  end;
end;

function TfrmTssExportCenter.BuildDefaultFileName(AKind: TTssExportKind): string;
var
  Rnc, Periodo, FileBase: string;
begin
  Rnc := TssOnlyDigits(GetRncCompaniaSeleccionada);
  Periodo := GetPeriodoTss;

  case AKind of
    tekAutodeterminacion:
      FileBase := 'AM_' + Rnc + '_' + Periodo + '.txt';
    tekNovedades:
      FileBase := 'NV_' + Rnc + '_' + Periodo + '.txt';
    tekBonificacionInfotep:
      FileBase := Rnc + '_' + Periodo + '_BO.txt';
    tekDependientesAdicionales:
      FileBase := Rnc + '_' + Periodo + '_RD.txt';
    tekRectificativaIR3:
      FileBase := 'RT_' + Rnc + '_' + Periodo + '.txt';
  else
    FileBase := TssExportKindToFilePrefix(AKind) + '_' +
      Rnc + '_' + Periodo + '.txt';
  end;

  Result := TssAddSlash(edtOutputFolder.Text) + FileBase;
end;

procedure TfrmTssExportCenter.btnValidarClick(Sender: TObject);
var
  Msgs: TStringList;
begin
  ClearLog;
  ShowPageHint(CurrentKind);
  if not ValidateCommonInputs then
    Exit;

  Msgs := TStringList.Create;
  try
    if TTssValidator.ValidateDataSet(CurrentKind, cdsPreview, Msgs) then
      Log('Validacion correcta para ' + TssExportKindToText(CurrentKind) + '.')
    else
      Log('Validacion con errores para ' + TssExportKindToText(CurrentKind) + '.');
    if Msgs.Count > 0 then
      memLog.Lines.AddStrings(Msgs);
  finally
    Msgs.Free;
  end;
end;

procedure TfrmTssExportCenter.btnGenerarTxtClick(Sender: TObject);
var
  Exporter: TTssBaseExporter;
  ExportResult: TTssExportResult;
  Msgs: TStringList;
  FileName: string;
begin
  ClearLog;
  ShowPageHint(CurrentKind);
  if not ValidateCommonInputs then
    Exit;

  Msgs := TStringList.Create;
  try
    if not TTssValidator.ValidateDataSet(CurrentKind, cdsPreview, Msgs) then
    begin
      Log('No se genera TXT porque existen errores de validacion.');
      memLog.Lines.AddStrings(Msgs);
      pcMain.ActivePage := tsLog;  
      Exit;
    end;
  finally
    Msgs.Free;
  end;

  if not TssEnsureFolder(edtOutputFolder.Text) then
  begin
    Log('No se pudo crear/verificar la carpeta: ' + edtOutputFolder.Text);
    Exit;
  end;

  SaveDialog1.InitialDir := edtOutputFolder.Text;
  SaveDialog1.FileName := ExtractFileName(BuildDefaultFileName(CurrentKind));
  if not SaveDialog1.Execute then
  begin
    Log('Generacion cancelada por el usuario.');
    Exit;
  end;

  FileName := SaveDialog1.FileName;
  Exporter := CreateTssExporter(CurrentKind);
  try
    if Exporter = nil then
    begin
      Log('No existe exportador para el tipo seleccionado.');
      Exit;
    end;
    ExportResult := Exporter.ExportDataSet(cdsPreview, FileName);
    try
      Log(ExportResult.MessageText);
      if ExportResult.Success then
      begin
        Log('Archivo: ' + ExportResult.FileName);
        Log('Registros exportados: ' + IntToStr(ExportResult.RecordCount));
        //t if CurrentKind = tekNovedades then
        //t   GenerateNovedadesExcelFromTemplate(ExportResult.FileName);
      end;
    finally
      ExportResult.Free;
    end;
  finally
    Exporter.Free;
  end;
  pcMain.ActivePage := tsLog;
end;

procedure TfrmTssExportCenter.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTssExportCenter.btnBuscarCarpetaClick(Sender: TObject);
var
  Dir: string;
begin
  Dir := edtOutputFolder.Text;
  if SelectDirectory('Seleccione carpeta de salida', '', Dir) then
    edtOutputFolder.Text := Dir;
end;

procedure TfrmTssExportCenter.btnAbrirCarpetaClick(Sender: TObject);
begin
  if TssEnsureFolder(edtOutputFolder.Text) then
    ShellExecute(Handle, 'open', PChar(edtOutputFolder.Text), nil, nil, SW_SHOWNORMAL)
  else
    Log('No se pudo abrir la carpeta: ' + edtOutputFolder.Text);
end;

procedure TfrmTssExportCenter.lkpCompaniaChange(Sender: TObject);
begin
  ActualizarRncCompania;
  PrepareDataSetForKind(CurrentKind);
  ClearLog;
  Log('Compania seleccionada: ' + IntToStr(GetCodigoCiaSeleccionada));
  Log('RNC usado para TXT: ' + GetRncCompaniaSeleccionada);
  Log('Presione Cargar DB para consultar la compania seleccionada.');
end;

end.