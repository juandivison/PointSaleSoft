unit UFrmTssExportCenter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, DateUtils, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB, Grids, DBGrids,
  DBClient, FileCtrl, ShellAPI,
  UTssTypes, UTssFormatUtils, UTssValidator, UTssExporters,
  IBQuery, IBCustomDataSet,
  IBStoredProc,
  RxQuery, Mask, RxToolEdit, RxDBCtrl, RxLookup, IBTable;

type
  TfrmTssExportCenter = class(TForm)
    pnlHeader: TPanel;
    lblTitle: TLabel;
    lblSubTitle: TLabel;
    lblPeriodo: TLabel;
    edtPeriodo: TEdit;
    lblRnc: TLabel;
    edtRnc: TEdit;
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
    btnCargarDummy: TBitBtn;
    btnValidar: TBitBtn;
    btnGenerarTxt: TBitBtn;
    btnAbrirCarpeta: TBitBtn;
    btnCerrar: TBitBtn;
    memLog: TMemo;
    dsPreview: TDataSource;
    cdsPreview: TClientDataSet;
    SaveDialog1: TSaveDialog;
    IBDataSet1: TIBDataSet;
    IBQuery1: TIBQuery;
    IBStoredProc1: TIBStoredProc;
    IBTable1: TIBTable;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupList1: TRxDBLookupList;
    RxDBComboEdit1: TRxDBComboEdit;
    SQLScript1: TSQLScript;
    procedure FormCreate(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure btnCargarDummyClick(Sender: TObject);
    procedure btnValidarClick(Sender: TObject);
    procedure btnGenerarTxtClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnBuscarCarpetaClick(Sender: TObject);
    procedure btnAbrirCarpetaClick(Sender: TObject);
  private
    function CurrentKind: TTssExportKind;
    procedure ApplyVisualStyle;
    procedure Log(const S: string);
    procedure ClearLog;
    procedure PrepareDataSetForKind(AKind: TTssExportKind);
    procedure LoadDummyData(AKind: TTssExportKind);
    procedure AddCommonWorkerFields;
    procedure AddFieldStr(const AName: string; ASize: Integer);
    procedure AddFieldFloat(const AName: string);
    procedure AddFieldDate(const AName: string);
    function ValidateCommonInputs: Boolean;
    function BuildDefaultFileName(AKind: TTssExportKind): string;
    procedure ShowPageHint(AKind: TTssExportKind);
  public
  end;

var
  frmTssExportCenter: TfrmTssExportCenter;

implementation

{$R *.dfm}

procedure TfrmTssExportCenter.FormCreate(Sender: TObject);
begin
  ApplyVisualStyle;
  edtPeriodo.Text := FormatDateTime('mmyyyy', Date);
  edtRnc.Text := '101000000';
  edtOutputFolder.Text := ExtractFilePath(Application.ExeName) + 'TSS_TXT';
  SaveDialog1.Filter := 'Archivo TXT (*.txt)|*.txt|Todos los archivos (*.*)|*.*';
  SaveDialog1.DefaultExt := 'txt';
  LoadDummyData(CurrentKind);
end;

procedure TfrmTssExportCenter.ApplyVisualStyle;
begin
  Caption := 'Centro de Exportacion TSS / SUIR Plus';
  Color := clBtnFace;
  pnlHeader.Color := clNavy;
  lblTitle.Font.Color := clWhite;
  lblSubTitle.Font.Color := clWhite;
  lblPeriodo.Font.Color := clWhite;
  lblRnc.Font.Color := clWhite;
  lblSalida.Font.Color := clWhite;
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

  LoadDummyData(CurrentKind);
end;

procedure TfrmTssExportCenter.btnCargarDummyClick(Sender: TObject);
begin
  LoadDummyData(CurrentKind);
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

procedure TfrmTssExportCenter.PrepareDataSetForKind(AKind: TTssExportKind);
begin
  if cdsPreview.Active then
    cdsPreview.Close;

  cdsPreview.FieldDefs.Clear;

  case AKind of
    tekAutodeterminacion:
    begin
      AddFieldStr('CLAVE_NOMINA', 20);
      AddCommonWorkerFields;
      AddFieldFloat('SALARIO_COTIZABLE');
      AddFieldFloat('APORTE_VOLUNTARIO');
      AddFieldFloat('SALARIO_ISR');
      AddFieldStr('TIPO_INGRESO', 2);
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
      AddFieldStr('CLAVE_NOMINA', 20);
      AddFieldStr('TIPO_NOVEDAD', 2);
      AddFieldDate('FECHA_INICIO');
      AddFieldDate('FECHA_FIN');
      AddCommonWorkerFields;
      AddFieldFloat('SALARIO_COTIZABLE_SDSS');
      AddFieldFloat('APORTE_VOLUNTARIO_SDSS');
      AddFieldStr('TIPO_INGRESO', 2);
      AddFieldFloat('SALARIO_ISR');
      AddFieldFloat('OTRAS_REMUNERACIONES');
      AddFieldStr('RNC_CED_AGENTE_RET', 20);
      AddFieldFloat('REMUNERACION_OTROS_AGENTES');
      AddFieldFloat('SALDO_FAVOR_PERIODO');
      AddFieldFloat('REGALIA_PASCUAL');
      AddFieldFloat('PREAVISO_CESANTIA_VIATICO');
      AddFieldFloat('RETENCION_PENSION_ALIMENTICIA');
      AddFieldFloat('SALARIO_INFOTEP');
    end;

    tekBonificacionInfotep:
    begin
      AddCommonWorkerFields;
      AddFieldFloat('MONTO_BONIFICACION');
    end;

    tekDependientesAdicionales:
    begin
      AddFieldStr('CLAVE_NOMINA', 20);
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

procedure TfrmTssExportCenter.LoadDummyData(AKind: TTssExportKind);
begin
  ClearLog;
  PrepareDataSetForKind(AKind);

  case AKind of
    tekAutodeterminacion:
    begin
      cdsPreview.AppendRecord(['NOM001', 'C', '00112345678', 'JUAN RAMON', 'DIVISION', 'PEREZ', 'M', EncodeDate(1985, 5, 18), 45000.00, 0.00, 45000.00, '01', 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 45000.00]);
      cdsPreview.AppendRecord(['NOM001', 'C', '00198765432', 'MARIA ELENA', 'SANTANA', 'ROJAS', 'F', EncodeDate(1990, 9, 7), 60000.00, 500.00, 60000.00, '01', 2500.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 60000.00]);
    end;

    tekNovedades:
    begin
      cdsPreview.AppendRecord(['NOM001', 'IN', EncodeDate(YearOf(Date), MonthOf(Date), 1), Null, 'C', '00122334455', 'CARLOS ALBERTO', 'MEJIA', 'DIAZ', 'M', EncodeDate(1994, 2, 12), 38000.00, 0.00, '01', 38000.00, 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 38000.00]);
      cdsPreview.AppendRecord(['NOM001', 'SA', EncodeDate(YearOf(Date), MonthOf(Date), 15), Null, 'C', '00155667788', 'ANA LUISA', 'GOMEZ', 'REYES', 'F', EncodeDate(1988, 11, 3), 0.00, 0.00, '01', 0.00, 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00]);
    end;

    tekBonificacionInfotep:
    begin
      cdsPreview.AppendRecord(['C', '00112345678', 'JUAN RAMON', 'DIVISION', 'PEREZ', 'M', EncodeDate(1985, 5, 18), 15000.00]);
      cdsPreview.AppendRecord(['C', '00198765432', 'MARIA ELENA', 'SANTANA', 'ROJAS', 'F', EncodeDate(1990, 9, 7), 20000.00]);
    end;

    tekDependientesAdicionales:
    begin
      cdsPreview.AppendRecord(['NOM001', 'C', '00112345678', 'ID', 'C', '00111122233', 'LUIS ANGEL', 'DIVISION', 'SANTANA']);
      cdsPreview.AppendRecord(['NOM001', 'C', '00198765432', 'ID', 'C', '00144455566', 'SOFIA MARIA', 'SANTANA', 'GOMEZ']);
    end;

    tekRectificativaIR3:
    begin
      cdsPreview.AppendRecord(['01', 'C', '00112345678', 'JUAN RAMON', 'DIVISION', 'PEREZ', 'M', EncodeDate(1985, 5, 18), 45000.00, 0.00, 45000.00, 0.00, '', 0.00, 0.00, 0.00, 0.00, 0.00]);
      cdsPreview.AppendRecord(['01', 'C', '00198765432', 'MARIA ELENA', 'SANTANA', 'ROJAS', 'F', EncodeDate(1990, 9, 7), 60000.00, 500.00, 60000.00, 2500.00, '', 0.00, 0.00, 0.00, 0.00, 0.00]);
    end;
  end;

  ShowPageHint(AKind);
  Log('Datos dummy cargados: ' + IntToStr(cdsPreview.RecordCount) + ' registros.');
end;

procedure TfrmTssExportCenter.ShowPageHint(AKind: TTssExportKind);
begin
  case AKind of
    tekAutodeterminacion:
      Log('Layout prototipo: Autodeterminacion v5.3 segun columnas de plantilla.');
    tekNovedades:
      Log('Layout prototipo: Novedades v5.1. Codigos visibles: IN, SA, VC, LV, LM, LD, AD.');
    tekBonificacionInfotep:
      Log('Layout prototipo: Bonificacion INFOTEP v1.4.');
    tekDependientesAdicionales:
      Log('Layout prototipo: Dependientes Adicionales v2.3. Codigos visibles: ID, SD.');
    tekRectificativaIR3:
      Log('Layout prototipo: Rectificativa IR-3 v1.7.');
  end;
end;

function TfrmTssExportCenter.ValidateCommonInputs: Boolean;
begin
  Result := False;

  if Trim(edtRnc.Text) = '' then
  begin
    Log('Debe indicar el RNC/Cedula del empleador.');
    Exit;
  end;

  if Length(TssOnlyDigits(edtPeriodo.Text)) <> 6 then
  begin
    Log('Periodo invalido. Use MMAAAA. Ejemplo: 052026.');
    Exit;
  end;

  if Trim(edtOutputFolder.Text) = '' then
  begin
    Log('Debe indicar la carpeta de salida.');
    Exit;
  end;

  Result := True;
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

function TfrmTssExportCenter.BuildDefaultFileName(AKind: TTssExportKind): string;
begin
  Result := TssAddSlash(edtOutputFolder.Text) +
    TssExportKindToFilePrefix(AKind) + '_' + TssOnlyDigits(edtPeriodo.Text) + '.txt';
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
      if ExportResult.Success then
      begin
        Log(ExportResult.MessageText);
        Log('Archivo: ' + ExportResult.FileName);
        Log('Registros exportados: ' + IntToStr(ExportResult.RecordCount));
      end
      else
        Log(ExportResult.MessageText);
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

end.
