unit UFrmOrders2EcfRunner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, IBDatabase, Dialogs, StdCtrls, ExtCtrls, FileCtrl, ShellApi, ComCtrls, IniFiles,
  WinSkinData, IBCustomDataSet, IBUpdateSQL, IBQuery,
  IBTable, IBStoredProc, IBSQL, Buttons, Menus;

type
  TfrmOrders2EcfRunner = class(TForm)
    PanelTop: TPanel;
    lblExe: TLabel;
    edtExePath: TEdit;
    btnBrowseExe: TButton;
    gbFolders: TGroupBox;
    lbFolders: TListBox;                     
    gbMode: TGroupBox;
    rgMode: TRadioGroup;
    lblNcf: TLabel;
    edtNcf: TEdit;
    gbOptions: TGroupBox;
    chkLegacyImport: TCheckBox;
    chkLegacyReplay: TCheckBox;
    chkLegacyNumbering: TCheckBox;
    chkOpenReport: TCheckBox;
    chkOpenOutputFolder: TCheckBox;
    lblExtraArgs: TLabel;
    edtExtraArgs: TEdit;
    PanelBottom: TPanel;
    btnRun: TButton;
    btnClose: TButton;
    gbLog: TGroupBox;
    memLog: TMemo;
    OpenDialogExe: TOpenDialog;
    StatusBar1: TStatusBar;
    lblHint: TLabel;
    lblModeHelp: TLabel;
    btnAddFolder: TButton;
    btnRemoveFolder: TButton;
    btnClearFolders: TButton;
    dtpkFechaTrnDiaria: TDateTimePicker;
    Label1: TLabel;
    SkinData1: TSkinData;
    lblEcfType: TLabel;
    cbEcfType: TComboBox;
    lblOutputCurrency: TLabel;
    cbOutputCurrency: TComboBox;
    lblSaleCondition: TLabel;
    cbSaleCondition: TComboBox;
    lblPaymentMethod: TLabel;
    cbPaymentMethod: TComboBox;
    chkShowTotalDop: TCheckBox;
    lblCliPreviewTitle: TLabel;
    memCliPreview: TMemo;
    edtTasa: TEdit;
    Label2: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    Button2: TButton;
    rgProcessType: TRadioGroup;
    lblNcrNcfRef: TLabel;
    edtNcrNcfRef: TEdit;
    lblNcrReason: TLabel;
    cbNcrReason: TComboBox;
    btnCreateNcr: TButton;
    chkNcrDummy: TCheckBox;
    MainMenu1: TMainMenu;
    Mantenimiento1: TMenuItem;
    ablas1: TMenuItem;
    chkNcrFinalize: TCheckBox;
    lblEnvironment: TLabel;
    lblLastEcfCaption: TLabel;
    lblLastEcfValue: TLabel;
    chkRedondear: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBrowseExeClick(Sender: TObject);
    procedure btnAddFolderClick(Sender: TObject);
    procedure btnRemoveFolderClick(Sender: TObject);
    procedure btnClearFoldersClick(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure rgModeClick(Sender: TObject);
    procedure chkLegacyReplayClick(Sender: TObject);
    procedure cbEcfTypeChange(Sender: TObject);
    procedure cbSaleConditionChange(Sender: TObject);
    procedure cbPaymentMethodChange(Sender: TObject);
    procedure AnyParamControlChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dtpkFechaTrnDiariaExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure rgProcessTypeClick(Sender: TObject);
    procedure btnCreateNcrClick(Sender: TObject);
    procedure ablas1Click(Sender: TObject);
    procedure chkNcrFinalizeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FIniPath: string;
    FUpdatingUi: Boolean;
	FIsRunning: Boolean;
    FOldLbFoldersWndProc: TWndMethod;
    FOldGbFoldersWndProc: TWndMethod;
    FNcrRequestJsonPath: string;
    FNcrSummaryText: string;
    FStartupNoticeShown: Boolean;
    FEnvironmentType: string;

    procedure ShowStartupFiscalNotice;
    procedure RefreshEnvironmentInfo;
    procedure RefreshLastEcfSequence;
    function ReadConfiguredEnvironment: string;

    function BuildCommandLine: string;
    function BuildCommandPreview: string;
    function GetJoinedFolders: string;
    procedure Log(const S: string);
    procedure SetRunningUI(const ARunning: Boolean);
    function ExecuteAndCapture(const ExePath, Params: string; out ExitCode: Cardinal): Boolean;
    function ExtractReportPath: string;
    function ExtractLastGeneratedXlsxPath: string;
    procedure OpenReportIfAny;
    procedure OpenOutputFolderIfAny;
    procedure ValidateInputs;
    procedure SyncModeControls;
    function IsModeNormal: Boolean;
    function IsModeDummy: Boolean;
    function IsModeReprint: Boolean;
    function IsModeReplay: Boolean;
    function IsProcessingNcr: Boolean;
   	function IsModeRecoverTimbre: Boolean;
    function IsModeReportOnly: Boolean;
    procedure EnsureReportOnlyModeItem;

    function GetReportOnlyModeIndex: Integer;

    procedure LoadSettings;
    procedure SaveSettings;
    function GetDefaultIniPath: string;
    function OpenFileWithAssociatedExe(const AFileName: string): Boolean;
    function BuildInputListJsonFile: string;
    function JsonEscape(const S: string): string;
    procedure InitializeOptionCombos;
    procedure ApplySuggestedOptionsFromEcfType(const AForce: Boolean);
    procedure UpdatePaymentUi;
    procedure UpdateCommandPreview;
    procedure SyncProcessTypeControls;
    function BuildNcrCommandLine: string;
    function BuildConfirmationText: string;
    function GetSelectedEcfType: string;
    function GetSelectedOutputCurrency: string;
    function GetSelectedSaleCondition: string;
    function IsFxUsdRoundedCandidate: Boolean;
    function IsFxUsdV9NormalTest: Boolean;
    function ExtraArgsTieneOpcionFiscalConflictiva: Boolean;
    function GetSelectedPaymentMethodCode: Integer;
    procedure SelectPaymentMethodCode(const ACode: Integer);
    procedure AddOrderFile(const AFileName: string);
    procedure AddDroppedFilesFromHandle(const ADropHandle: HDROP);
    function IsExcelOrderFile(const AFileName: string): Boolean;
    procedure LbFoldersWindowProc(var Msg: TMessage);
    procedure GbFoldersWindowProc(var Msg: TMessage);
    procedure EnableDragDropTargets;
    procedure DisableDragDropTargets;
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure ProcMostrarTasa;
    procedure ResetNcrPayload;
    function CanUseCurrentVentaForNcr: Boolean;
    function SelectFacturaForNcr(out ANumeroVenta, ANumeroFactura: Integer; out ANcf: string): Boolean;
    function ExecuteCurrentProcess: Boolean;
    function IsNcrDummy: Boolean;
    function IsNcrFinalize: Boolean;
    function IsValidNcrReferenceNcf(const ANcf: string): Boolean;
    procedure EnsureValidNcrReferenceNcf(const ANcf: string);
    function LoadTextFileSafe(const AFileName: string): string;
    function ExtractJsonStringValue(const AJson, AName: string; out AValue: string): Boolean;
    procedure EnsureNcrJsonReferenceMatchesEdit(const AJsonPath, AExpectedNcf: string);
  public
    procedure PrepareNcrFromFacturaActual;                                                    
  end;

var
  frmOrders2EcfRunner: TfrmOrders2EcfRunner;

implementation

uses
  UGlobal, UFrmOrderFilePicker,
  UTasaDolar, UImpresionVentas,UFormFacturasOrder2Ecf,
  UFormNumCompFiscal, UFrmOrders2EcfNcrBuilder, UDatModFactura,
  UDatModCompania,
  UDatModReportes,
  UFormFacturas,UFrmEcfLegacyAdmin,
  UDatModConectar;

{$R *.dfm}

const
  INI_SECTION_MAIN = 'Main';
  INI_SECTION_FOLDERS = 'Folders';

function QuoteArg(const S: string): string;
begin
  Result := '"' + S + '"';
end;

function FileExistsSafe(const AFileName: string): Boolean;
begin
  Result := (Trim(AFileName) <> '') and FileExists(AFileName);
end;

function ExtractLeadingInt(const S: string): Integer;
var
  I: Integer;
  Digits: string;
begin
  Result := 0;
  Digits := '';
  for I := 1 to Length(S) do
  begin
    if S[I] in ['0'..'9'] then
      Digits := Digits + S[I]
    else if Digits <> '' then
      Break;
  end;

  if Digits <> '' then
    Result := StrToIntDef(Digits, 0);
end;

procedure SaveStringsAsUtf8(const FileName: string; Strings: TStrings);
var
  FS: TFileStream;
  U8: UTF8String;
begin
  U8 := UTF8Encode(WideString(Strings.Text));

  FS := TFileStream.Create(FileName, fmCreate);
  try
    if Length(U8) > 0 then
      FS.WriteBuffer(U8[1], Length(U8));
  finally
    FS.Free;
  end;
end;

procedure TfrmOrders2EcfRunner.FormCreate(Sender: TObject);
begin
  FStartupNoticeShown := False;
  FEnvironmentType := 'NO DETERMINADO';
  Caption := 'Orders2Ecf Runner';
  dtpkFechaTrnDiaria.DateTime := ExtraerFecha(GlbFechaTrnDiaria);
  FIniPath := GetDefaultIniPath;
  FUpdatingUi := False;
  FIsRunning := False;
  FNcrRequestJsonPath := '';
  FNcrSummaryText := '';
  if Assigned(chkNcrDummy) then
    chkNcrDummy.Checked := True;

  if Assigned(chkNcrFinalize) then
  chkNcrFinalize.Checked := False;

  EnsureReportOnlyModeItem;

  rgMode.ItemIndex := 0;
  rgProcessType.ItemIndex := 0;

  chkLegacyImport.Checked := True;
  chkOpenReport.Checked := True;
  chkOpenOutputFolder.Checked := False;
  chkShowTotalDop.Checked := True;

  OpenDialogExe.Filter := 'Orders2Ecf CLI|Orders2Ecf.Cli.exe|Executable (*.exe)|*.exe|Todos (*.*)|*.*';
  OpenDialogExe.Options := [ofFileMustExist, ofPathMustExist, ofEnableSizing];

  InitializeOptionCombos;
  cbNcrReason.Items.Clear;
  cbNcrReason.Items.Add('1 - Anulacion total');
  cbNcrReason.Items.Add('2 - Corrige texto');
  cbNcrReason.Items.Add('3 - Corrige montos');
  cbNcrReason.ItemIndex := 0;

  memLog.Clear;
  StatusBar1.SimpleText := 'Listo';

  LoadSettings;
  chkRedondear.OnClick := AnyParamControlChange;
  SyncProcessTypeControls;
  SyncModeControls;
  UpdatePaymentUi;
  UpdateCommandPreview;

  gbFolders.Caption := 'Archivos seleccionados';
  btnAddFolder.Caption := 'Seleccionar...';
  btnRemoveFolder.Caption := 'Quitar';
  btnClearFolders.Caption := 'Limpiar';
  lblHint.Caption := 'Seleccione o arrastre archivos .xls/.xlsx desde carpeta local o compartida';
  lblModeHelp.Caption := 'Normal: flujo regular. Recover Timbre: recupera timbre/XML firmado para un e-NCF existente; opcionalmente permite indicar los archivos de orden usados.';																													
  EnableDragDropTargets;
  ProcMostrarTasa;
  RefreshEnvironmentInfo;
  RefreshLastEcfSequence;
end;

procedure TfrmOrders2EcfRunner.FormDestroy(Sender: TObject);
begin
  DisableDragDropTargets;
  SaveSettings;
end;

procedure TfrmOrders2EcfRunner.InitializeOptionCombos;
begin
  FUpdatingUi := True;
  try
    cbEcfType.Items.Clear;
    cbEcfType.Items.Add('E31 - Factura de Credito Fiscal Electronica');
    cbEcfType.Items.Add('E32 - Factura de Consumo Electronica');
    cbEcfType.Items.Add('E44 - Regimenes Especiales Electronico');
    cbEcfType.Items.Add('E45 - Gubernamental Electronico');
    cbEcfType.ItemIndex := 0;

    cbOutputCurrency.Items.Clear;
    cbOutputCurrency.Items.Add('USD - Dólares Estadounidenses');
    cbOutputCurrency.Items.Add('DOP - Pesos Dominicanos');
    cbOutputCurrency.ItemIndex := 0;

    cbSaleCondition.Items.Clear;
    cbSaleCondition.Items.Add('credito - Venta a crédito');
    cbSaleCondition.Items.Add('contado - Venta al contado');
    cbSaleCondition.ItemIndex := 0;

    cbPaymentMethod.Items.Clear;
    cbPaymentMethod.Items.Add('1 - Efectivo');
    cbPaymentMethod.Items.Add('2 - Cheque / Transferencia / Depósito');
    cbPaymentMethod.Items.Add('3 - Tarjeta Débito / Crédito');
    cbPaymentMethod.Items.Add('4 - Venta a crédito');
    cbPaymentMethod.Items.Add('5 - Bonos / Certificados');
    cbPaymentMethod.Items.Add('6 - Permuta');
    cbPaymentMethod.Items.Add('7 - Nota de crédito');
    cbPaymentMethod.Items.Add('8 - Otras formas de pago');
    cbPaymentMethod.ItemIndex := 3;
  finally
    FUpdatingUi := False;
  end;
end;

function TfrmOrders2EcfRunner.GetDefaultIniPath: string;
begin
  Result := ChangeFileExt(Application.ExeName, '.ini');
end;

procedure TfrmOrders2EcfRunner.LoadSettings;
var
  Ini: TIniFile;
  Count, I, Idx: Integer;
  S: string;
begin
  Ini := TIniFile.Create(FIniPath);
  try
    if (GlBExpert = 1) then
      edtExePath.Text := GlbRuta2Ecf
    else
      edtExePath.Text := Ini.ReadString(INI_SECTION_MAIN, 'ExePath', edtExePath.Text);

    rgMode.ItemIndex := Ini.ReadInteger(INI_SECTION_MAIN, 'ModeIndex', rgMode.ItemIndex);
    edtNcf.Text := Ini.ReadString(INI_SECTION_MAIN, 'Ncf', '');
    chkLegacyImport.Checked := Ini.ReadBool(INI_SECTION_MAIN, 'LegacyImport', chkLegacyImport.Checked);
    chkLegacyReplay.Checked := Ini.ReadBool(INI_SECTION_MAIN, 'LegacyReplay', False);
    chkLegacyNumbering.Checked := Ini.ReadBool(INI_SECTION_MAIN, 'LegacyNumbering', False);
    chkOpenReport.Checked := Ini.ReadBool(INI_SECTION_MAIN, 'OpenReport', True);
    chkOpenOutputFolder.Checked := Ini.ReadBool(INI_SECTION_MAIN, 'OpenOutputFolder', False);
    chkShowTotalDop.Checked := Ini.ReadBool(INI_SECTION_MAIN, 'ShowTotalDop', True);
    if Assigned(chkNcrDummy) then
      chkNcrDummy.Checked := Ini.ReadBool(INI_SECTION_MAIN, 'NcrDummy', False);

    if Assigned(chkNcrFinalize) then
    chkNcrFinalize.Checked := Ini.ReadBool(INI_SECTION_MAIN, 'NcrFinalize', False);

    edtExtraArgs.Text := Ini.ReadString(INI_SECTION_MAIN, 'ExtraArgs', '');
    rgProcessType.ItemIndex := Ini.ReadInteger(INI_SECTION_MAIN, 'ProcessTypeIndex', rgProcessType.ItemIndex);
    edtNcrNcfRef.Text := Ini.ReadString(INI_SECTION_MAIN, 'NcrNcfRef', '');

    Idx := Ini.ReadInteger(INI_SECTION_MAIN, 'EcfTypeIndex', cbEcfType.ItemIndex);
    if (Idx >= 0) and (Idx < cbEcfType.Items.Count) then
      cbEcfType.ItemIndex := Idx;

    Idx := Ini.ReadInteger(INI_SECTION_MAIN, 'OutputCurrencyIndex', cbOutputCurrency.ItemIndex);
    if (Idx >= 0) and (Idx < cbOutputCurrency.Items.Count) then
      cbOutputCurrency.ItemIndex := Idx;

    Idx := Ini.ReadInteger(INI_SECTION_MAIN, 'SaleConditionIndex', cbSaleCondition.ItemIndex);
    if (Idx >= 0) and (Idx < cbSaleCondition.Items.Count) then
      cbSaleCondition.ItemIndex := Idx;

    Idx := Ini.ReadInteger(INI_SECTION_MAIN, 'PaymentMethodIndex', cbPaymentMethod.ItemIndex);
    if (Idx >= 0) and (Idx < cbPaymentMethod.Items.Count) then
      cbPaymentMethod.ItemIndex := Idx;

    Idx := Ini.ReadInteger(INI_SECTION_MAIN, 'NcrReasonIndex', cbNcrReason.ItemIndex);
    if (Idx >= 0) and (Idx < cbNcrReason.Items.Count) then
      cbNcrReason.ItemIndex := Idx;

    lbFolders.Items.BeginUpdate;
    try
      lbFolders.Items.Clear;
      Count := Ini.ReadInteger(INI_SECTION_FOLDERS, 'Count', 0);
      for I := 0 to Count - 1 do
      begin
        S := Trim(Ini.ReadString(INI_SECTION_FOLDERS, 'Item' + IntToStr(I), ''));
        if S <> '' then
          lbFolders.Items.Add(S);
      end;
    finally
      lbFolders.Items.EndUpdate;
    end;
  finally
    Ini.Free;
  end;
end;

procedure TfrmOrders2EcfRunner.SaveSettings;
var
  Ini: TIniFile;
  I: Integer;
begin
  Ini := TIniFile.Create(FIniPath);
  try
    Ini.WriteString(INI_SECTION_MAIN, 'ExePath', Trim(edtExePath.Text));
    Ini.WriteInteger(INI_SECTION_MAIN, 'ModeIndex', rgMode.ItemIndex);
    Ini.WriteString(INI_SECTION_MAIN, 'Ncf', Trim(edtNcf.Text));
    Ini.WriteBool(INI_SECTION_MAIN, 'LegacyImport', chkLegacyImport.Checked);
    Ini.WriteBool(INI_SECTION_MAIN, 'LegacyReplay', chkLegacyReplay.Checked);
    Ini.WriteBool(INI_SECTION_MAIN, 'LegacyNumbering', chkLegacyNumbering.Checked);
    Ini.WriteBool(INI_SECTION_MAIN, 'OpenReport', chkOpenReport.Checked);
    Ini.WriteBool(INI_SECTION_MAIN, 'OpenOutputFolder', chkOpenOutputFolder.Checked);
    Ini.WriteBool(INI_SECTION_MAIN, 'ShowTotalDop', chkShowTotalDop.Checked);
    if Assigned(chkNcrDummy) then
      Ini.WriteBool(INI_SECTION_MAIN, 'NcrDummy', chkNcrDummy.Checked);

    if Assigned(chkNcrFinalize) then
      Ini.WriteBool(INI_SECTION_MAIN, 'NcrFinalize', chkNcrFinalize.Checked);

    Ini.WriteString(INI_SECTION_MAIN, 'ExtraArgs', Trim(edtExtraArgs.Text));
    Ini.WriteInteger(INI_SECTION_MAIN, 'ProcessTypeIndex', rgProcessType.ItemIndex);
    Ini.WriteString(INI_SECTION_MAIN, 'NcrNcfRef', Trim(edtNcrNcfRef.Text));
    Ini.WriteInteger(INI_SECTION_MAIN, 'EcfTypeIndex', cbEcfType.ItemIndex);
    Ini.WriteInteger(INI_SECTION_MAIN, 'OutputCurrencyIndex', cbOutputCurrency.ItemIndex);
    Ini.WriteInteger(INI_SECTION_MAIN, 'SaleConditionIndex', cbSaleCondition.ItemIndex);
    Ini.WriteInteger(INI_SECTION_MAIN, 'PaymentMethodIndex', cbPaymentMethod.ItemIndex);
    Ini.WriteInteger(INI_SECTION_MAIN, 'NcrReasonIndex', cbNcrReason.ItemIndex);

    Ini.EraseSection(INI_SECTION_FOLDERS);
    Ini.WriteInteger(INI_SECTION_FOLDERS, 'Count', lbFolders.Items.Count);
    for I := 0 to lbFolders.Items.Count - 1 do
      Ini.WriteString(INI_SECTION_FOLDERS, 'Item' + IntToStr(I), lbFolders.Items[I]);
  finally
    Ini.Free;
  end;
end;

function TfrmOrders2EcfRunner.IsModeNormal: Boolean;
begin
  Result := (rgMode.ItemIndex = 0);
end;

function TfrmOrders2EcfRunner.IsModeDummy: Boolean;
begin
  Result := (rgMode.ItemIndex = 1);
end;

function TfrmOrders2EcfRunner.IsModeReprint: Boolean;
begin
  Result := (rgMode.ItemIndex = 2);
end;

function TfrmOrders2EcfRunner.IsModeReplay: Boolean;
begin
  Result := (rgMode.ItemIndex = 3);
end;

function TfrmOrders2EcfRunner.IsModeRecoverTimbre: Boolean;
begin
  Result := (rgMode.ItemIndex = 4);
end;

function TfrmOrders2EcfRunner.GetReportOnlyModeIndex: Integer;
var
  I: Integer;
  S: string;
begin
  Result := -1;

  for I := 0 to rgMode.Items.Count - 1 do
  begin
    S := UpperCase(Trim(rgMode.Items[I]));
    if (Pos('REPORT', S) > 0) or (Pos('REPORTE', S) > 0) then
    begin
      Result := I;
      Exit;
    end;
  end;
end;

procedure TfrmOrders2EcfRunner.EnsureReportOnlyModeItem;
begin
  if GetReportOnlyModeIndex < 0 then
    rgMode.Items.Add('Report Only - Solo reporte');
end;

function TfrmOrders2EcfRunner.IsModeReportOnly: Boolean;
begin
  Result := (rgMode.ItemIndex = GetReportOnlyModeIndex) and (GetReportOnlyModeIndex >= 0);
end;

function TfrmOrders2EcfRunner.IsProcessingNcr: Boolean;
begin
  Result := (rgProcessType.ItemIndex = 1);
end;

function TfrmOrders2EcfRunner.IsNcrDummy: Boolean;
begin
  Result :=
    IsProcessingNcr and
    Assigned(chkNcrDummy) and
    chkNcrDummy.Checked and
    not IsNcrFinalize;
end;

function TfrmOrders2EcfRunner.IsValidNcrReferenceNcf(const ANcf: string): Boolean;
var
  S: string;
begin
  S := UpperCase(Trim(ANcf));

  Result :=
    (S <> '') and
    (Copy(S, 1, 1) = 'E') and
    (Length(S) >= 3) and
    (Copy(S, 1, 3) <> 'E33') and
    (Copy(S, 1, 3) <> 'E34');
end;

procedure TfrmOrders2EcfRunner.EnsureValidNcrReferenceNcf(const ANcf: string);
begin
  if not IsValidNcrReferenceNcf(ANcf) then
    raise Exception.Create(
      'El e-NCF a modificar no es valido para una Nota de Credito.' + sLineBreak +
      'No se permite usar una E33/E34 como documento de referencia.' + sLineBreak +
      'Seleccione la factura original aceptada, por ejemplo E31/E32/E44/E45.');
end;

function TfrmOrders2EcfRunner.LoadTextFileSafe(const AFileName: string): string;
var
  SL: TStringList;
begin
  Result := '';
  if (Trim(AFileName) = '') or (not FileExists(AFileName)) then
    Exit;

  SL := TStringList.Create;
  try
    SL.LoadFromFile(AFileName);
    Result := SL.Text;
  finally
    SL.Free;
  end;
end;

function TfrmOrders2EcfRunner.ExtractJsonStringValue(
  const AJson, AName: string; out AValue: string): Boolean;
var
  P, I, J: Integer;
  Key: string;
begin
  Result := False;
  AValue := '';

  Key := '"' + AName + '"';
  P := Pos(Key, AJson);
  if P <= 0 then
    Exit;

  I := P + Length(Key);

  while (I <= Length(AJson)) and (AJson[I] <> ':') do
    Inc(I);

  if I > Length(AJson) then
    Exit;

  Inc(I);

  while (I <= Length(AJson)) and (AJson[I] in [' ', #9, #13, #10]) do
    Inc(I);

  if (I > Length(AJson)) or (AJson[I] <> '"') then
    Exit;

  Inc(I);
  J := I;

  while (J <= Length(AJson)) and (AJson[J] <> '"') do
    Inc(J);

  if J > Length(AJson) then
    Exit;

  AValue := Copy(AJson, I, J - I);
  Result := True;
end;

procedure TfrmOrders2EcfRunner.EnsureNcrJsonReferenceMatchesEdit(
  const AJsonPath, AExpectedNcf: string);
var
  Json, JsonRef: string;
begin
  if (Trim(AJsonPath) = '') or (not FileExists(AJsonPath)) then
    Exit;

  Json := LoadTextFileSafe(AJsonPath);

  if ExtractJsonStringValue(Json, 'referenceNcf', JsonRef) then
  begin
    if not SameText(Trim(JsonRef), Trim(AExpectedNcf)) then
      raise Exception.CreateFmt(
        'Inconsistencia en NCR: el JSON fue generado para el e-NCF [%s], ' +
        'pero el Runner tiene como referencia [%s].' + sLineBreak +
        'Cancele y vuelva a generar la NCR seleccionando la factura original correcta.',
        [Trim(JsonRef), Trim(AExpectedNcf)]);
  end;
end;

procedure TfrmOrders2EcfRunner.ResetNcrPayload;
begin
  FNcrRequestJsonPath := '';
  FNcrSummaryText := '';
end;
procedure TfrmOrders2EcfRunner.Log(const S: string);
begin
  memLog.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' | ' + S);
  memLog.SelStart := Length(memLog.Text);
  memLog.Perform(EM_SCROLLCARET, 0, 0);
  Application.ProcessMessages;
end;

procedure TfrmOrders2EcfRunner.SetRunningUI(const ARunning: Boolean);
begin
  FIsRunning := ARunning;
  btnRun.Enabled := not ARunning;
  btnClose.Enabled := not ARunning;
  btnBrowseExe.Enabled := not ARunning;
  btnAddFolder.Enabled := not ARunning;
  btnRemoveFolder.Enabled := not ARunning;
  gbFolders.Enabled := not ARunning and (not IsProcessingNcr);
  lbFolders.Enabled := not ARunning and (not IsProcessingNcr);
  btnClearFolders.Enabled := not ARunning;
  rgMode.Enabled := not ARunning;
  edtExePath.Enabled := not ARunning;
  chkOpenReport.Enabled := not ARunning;
  chkOpenOutputFolder.Enabled := not ARunning;
  edtExtraArgs.Enabled := not ARunning;
  dtpkFechaTrnDiaria.Enabled := not ARunning;
  cbEcfType.Enabled := not ARunning;
  cbOutputCurrency.Enabled := not ARunning;
  cbSaleCondition.Enabled := not ARunning;
  chkShowTotalDop.Enabled := not ARunning;
  memCliPreview.Enabled := not ARunning;
  rgProcessType.Enabled := not ARunning;
  edtNcrNcfRef.Enabled := not ARunning and IsProcessingNcr;
  cbNcrReason.Enabled := not ARunning and IsProcessingNcr;
  btnCreateNcr.Enabled := not ARunning and IsProcessingNcr;

  if not ARunning then
  begin
    SyncProcessTypeControls;
    SyncModeControls;
    UpdatePaymentUi;
  end
  else
  begin
    edtNcf.Enabled := False;
    chkLegacyImport.Enabled := False;
    chkLegacyReplay.Enabled := False;
    chkLegacyNumbering.Enabled := False;
    cbPaymentMethod.Enabled := False;
    rgProcessType.Enabled := False;
    edtNcrNcfRef.Enabled := False;
    cbNcrReason.Enabled := False;
    btnCreateNcr.Enabled := False;
  end;

  if ARunning then
    StatusBar1.SimpleText := 'Ejecutando Orders2Ecf...'
  else
    StatusBar1.SimpleText := 'Listo';
end;

procedure TfrmOrders2EcfRunner.btnBrowseExeClick(Sender: TObject);
begin
  if OpenDialogExe.Execute then
    edtExePath.Text := OpenDialogExe.FileName;
  UpdateCommandPreview;
end;

procedure TfrmOrders2EcfRunner.btnAddFolderClick(Sender: TObject);
var
  Files: TStringList;
  InitialPath: string;
  I: Integer;
begin
  if FIsRunning or IsProcessingNcr then Exit;
  Files := TStringList.Create;
  try
    if lbFolders.Items.Count > 0 then
      InitialPath := ExtractFileDir(lbFolders.Items[0])
    else
      InitialPath := '';

    if TfrmOrderFilePicker.Execute(Self, Files, InitialPath) then
    begin
      for I := 0 to Files.Count - 1 do
        AddOrderFile(Files[I]);
    end;
  finally
    Files.Free;
  end;
  UpdateCommandPreview;
end;

procedure TfrmOrders2EcfRunner.btnRemoveFolderClick(Sender: TObject);
begin
  if FIsRunning or IsProcessingNcr then Exit;
  if lbFolders.ItemIndex >= 0 then
    lbFolders.Items.Delete(lbFolders.ItemIndex);
  UpdateCommandPreview;
end;

procedure TfrmOrders2EcfRunner.btnClearFoldersClick(Sender: TObject);
begin
  if FIsRunning or IsProcessingNcr then Exit;
  lbFolders.Items.Clear;
  edtNcf.Text:='';
  UpdateCommandPreview;
end;

function TfrmOrders2EcfRunner.GetJoinedFolders: string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to lbFolders.Items.Count - 1 do
  begin
    if Trim(lbFolders.Items[I]) = '' then
      Continue;
    if Result <> '' then
      Result := Result + ';';
    Result := Result + lbFolders.Items[I];
  end;
end;

function TfrmOrders2EcfRunner.GetSelectedEcfType: string;
begin
  case cbEcfType.ItemIndex of
    1: Result := 'E32';
    2: Result := 'E44';
    3: Result := 'E45';
  else
    Result := 'E31';
  end;
end;

function TfrmOrders2EcfRunner.GetSelectedOutputCurrency: string;
begin
  if Pos('DOP', UpperCase(cbOutputCurrency.Text)) = 1 then
    Result := 'DOP'
  else
    Result := 'USD';
end;

function TfrmOrders2EcfRunner.GetSelectedSaleCondition: string;
begin
  if Pos('CONTADO', UpperCase(cbSaleCondition.Text)) > 0 then
    Result := 'contado'
  else
    Result := 'credito';
end;

// V10: E31/E32/E45 USD, contado o credito (segun tipo/pago permitido).
// El CLI valida por su cuenta la moneda fiscal y el ambiente TEST.
function TfrmOrders2EcfRunner.IsFxUsdRoundedCandidate: Boolean;
begin
  Result := (not IsProcessingNcr) and
    (IsModeNormal or IsModeDummy) and
    ((GetSelectedEcfType = 'E31') or
     (GetSelectedEcfType = 'E32') or
     (GetSelectedEcfType = 'E45')) and
    SameText(GetSelectedOutputCurrency, 'USD') and
    (SameText(GetSelectedSaleCondition, 'contado') or
     SameText(GetSelectedSaleCondition, 'credito'));
end;

function TfrmOrders2EcfRunner.IsFxUsdV9NormalTest: Boolean;
begin
  Result := IsModeNormal and IsFxUsdRoundedCandidate and
    SameText(FEnvironmentType, 'TEST');
end;

// Evita que un argumento manual sobrescriba la seleccion automatica.
// Esta comprobacion se utiliza solo en venta E31/E32/E45 USD contado/credito.
function TfrmOrders2EcfRunner.ExtraArgsTieneOpcionFiscalConflictiva: Boolean;
var
  Extra: string;
begin
  Extra := LowerCase(Trim(edtExtraArgs.Text));
  Result := (Pos('--mode=', Extra) > 0) or
    (Pos('--fx-usd-round-first', Extra) > 0) or
    (Pos('--fx-usd-fiscal-rounded', Extra) > 0) or
    (Pos('--fx-usd-normal-test', Extra) > 0) or
    (Pos('--fiscal-gross-reconcile', Extra) > 0) or
    (Pos('--ecf-type=', Extra) > 0) or
    (Pos('--output-currency=', Extra) > 0) or
    (Pos('--sale-condition=', Extra) > 0) or
    (Pos('--payment-method=', Extra) > 0) or
    (Pos('--show-total-dop=', Extra) > 0) or
    (Pos('--fecha-factura=', Extra) > 0) or
    (Pos('--input-list=', Extra) > 0);
end;

function TfrmOrders2EcfRunner.GetSelectedPaymentMethodCode: Integer;
begin
  Result := ExtractLeadingInt(cbPaymentMethod.Text);
  if Result <= 0 then
    Result := 1;
end;

procedure TfrmOrders2EcfRunner.SelectPaymentMethodCode(const ACode: Integer);
var
  I: Integer;
begin
  for I := 0 to cbPaymentMethod.Items.Count - 1 do
  begin
    if ExtractLeadingInt(cbPaymentMethod.Items[I]) = ACode then
    begin
      cbPaymentMethod.ItemIndex := I;
      Exit;
    end;
  end;
end;

procedure TfrmOrders2EcfRunner.ApplySuggestedOptionsFromEcfType(const AForce: Boolean);
var
  EcfType: string;
begin
  if FUpdatingUi then Exit;

  EcfType := GetSelectedEcfType;

  FUpdatingUi := True;
  try
    if AForce then
    begin
      if EcfType = 'E31' then
      begin
        cbOutputCurrency.ItemIndex := 0;
        cbSaleCondition.ItemIndex := 0;
        SelectPaymentMethodCode(4);
      end
      else if EcfType = 'E32' then
      begin
        cbOutputCurrency.ItemIndex := 1;
        cbSaleCondition.ItemIndex := 1;
        SelectPaymentMethodCode(1);
      end
      else if (EcfType = 'E44') or (EcfType = 'E45') then
      begin
        cbOutputCurrency.ItemIndex := 1;
        cbSaleCondition.ItemIndex := 1;
        SelectPaymentMethodCode(1);
      end;
    end;
  finally
    FUpdatingUi := False;
  end;

  UpdatePaymentUi;
end;

procedure TfrmOrders2EcfRunner.UpdatePaymentUi;
var
  IsCredit: Boolean;
begin
  IsCredit := SameText(GetSelectedSaleCondition, 'credito')
              or SameText(GetSelectedSaleCondition, 'crédito');

  FUpdatingUi := True;
  try
    if IsCredit then
    begin
      SelectPaymentMethodCode(4);
      cbPaymentMethod.Enabled := False;
    end
    else
    begin
      if GetSelectedPaymentMethodCode = 4 then
        SelectPaymentMethodCode(1);
      cbPaymentMethod.Enabled := True;
    end;
  finally
    FUpdatingUi := False;
  end;
end;

procedure TfrmOrders2EcfRunner.SyncProcessTypeControls;
var
  IsNcr: Boolean;
begin
  if FIsRunning then Exit;
  IsNcr := IsProcessingNcr;

  lblNcrNcfRef.Visible := IsNcr;
  edtNcrNcfRef.Visible := IsNcr;
  lblNcrReason.Visible := IsNcr;
  cbNcrReason.Visible := IsNcr;
  btnCreateNcr.Visible := IsNcr;

  lblNcrNcfRef.Enabled := IsNcr;
  edtNcrNcfRef.Enabled := IsNcr;
  lblNcrReason.Enabled := IsNcr;
  cbNcrReason.Enabled := IsNcr;
  btnCreateNcr.Enabled := IsNcr;

  if Assigned(chkNcrFinalize) then
  begin
    chkNcrFinalize.Visible := IsNcr;
    chkNcrFinalize.Enabled := IsNcr;

    if not IsNcr then
    chkNcrFinalize.Checked := False;
  end;

  if Assigned(chkNcrDummy) then
  begin
    chkNcrDummy.Visible := IsNcr;
    chkNcrDummy.Enabled := IsNcr and (not IsNcrFinalize);

    if not IsNcr then
      chkNcrDummy.Checked := False
    else if IsNcrFinalize then
      chkNcrDummy.Checked := False;

    // No forzar Dummy.
    // El usuario decide si desea vista previa o emisión real.
  end;
  

  rgMode.Enabled := not IsNcr;
  //btnRun.Enabled := not IsNcr;
  btnRun.Enabled := (not IsNcr) or IsNcrFinalize;
  gbFolders.Enabled := not IsNcr;
  lbFolders.Enabled := not IsNcr;
  btnAddFolder.Enabled := not IsNcr;
  btnRemoveFolder.Enabled := not IsNcr;
  btnClearFolders.Enabled := not IsNcr;

  cbEcfType.Enabled := not IsNcr;

  cbOutputCurrency.Enabled := not IsNcr;
  cbSaleCondition.Enabled := not IsNcr;
  cbPaymentMethod.Enabled := (not IsNcr) and SameText(GetSelectedSaleCondition, 'contado');
  chkLegacyImport.Enabled := (not IsNcr) and (not (IsModeReprint or IsModeReplay or IsModeRecoverTimbre));
  chkLegacyReplay.Enabled := (not IsNcr) and (not (IsModeReprint or IsModeRecoverTimbre));
  chkLegacyNumbering.Enabled := (not IsNcr) and (not (IsModeReprint or IsModeRecoverTimbre));
  chkShowTotalDop.Enabled := not IsNcr;

  if IsNcr then
  begin
    if IsNcrFinalize then
      lblModeHelp.Caption := 'NCR Finalize: repara/finaliza legacy de una E34 ya aceptada. No envia DGII ni reserva secuencia.'
    else
      lblModeHelp.Caption := 'NCR: crea Nota de Crédito Electrónica E34 para anulación total del e-NCF indicado.';

    StatusBar1.SimpleText := 'Modo: Procesar NCR';
  end
  else
    SyncModeControls;

  if IsNcr then
  begin
    edtNcf.Enabled := IsNcrFinalize;
    lblNcf.Enabled := IsNcrFinalize;

    if IsNcrFinalize then
      lblNcf.Caption := 'E34 a finalizar:'
    else
      lblNcf.Caption := 'NCF / e-NCF:';
  end else
  begin
    // Para Venta, SyncModeControls decide si edtNcf debe estar habilitado.
    lblNcf.Caption := 'NCF / e-NCF:';
  end;

  UpdateCommandPreview;
end;

function TfrmOrders2EcfRunner.BuildNcrCommandLine: string;
begin
  if (edtNcrNcfRef.Text = '') then Exit;

  EnsureValidNcrReferenceNcf(edtNcrNcfRef.Text);

  if Trim(FNcrRequestJsonPath) <> '' then
    EnsureNcrJsonReferenceMatchesEdit(FNcrRequestJsonPath, edtNcrNcfRef.Text);

  if IsNcrFinalize then
    Result := '--mode=ncr-finalize'
  else if IsNcrDummy then
    Result := '--mode=ncr-dummy'
  else
    Result := '--mode=ncr';

  Result := Result + ' --fecha-factura=' + FormatDateTime('yyyy-MM-dd', dtpkFechaTrnDiaria.Date) +
            ' --ecf-type=E34 --ncf-ref=' + Trim(edtNcrNcfRef.Text) +
            ' --ncr-reason=' + IntToStr(ExtractLeadingInt(cbNcrReason.Text));

  if IsNcrFinalize then
    Result := Result + ' --ncf=' + Trim(edtNcf.Text);

  if Trim(FNcrRequestJsonPath) <> '' then
    Result := Result + ' --ncr-request-json=' + QuoteArg(FNcrRequestJsonPath);

  if IsNcrFinalize then
    Result := Result + ' --legacy-import';

  if Trim(edtExtraArgs.Text) <> '' then
    Result := Result + ' ' + Trim(edtExtraArgs.Text);
end;


function TfrmOrders2EcfRunner.BuildConfirmationText: string;
var
  Lines: TStringList;
begin
  Lines := TStringList.Create;
  try
    if IsProcessingNcr then
    begin
      Lines.Add('Confirme los parámetros de la Nota de Crédito:');
      Lines.Add('');

if IsNcrFinalize then
  Lines.Add('Proceso: NCR FINALIZE - SOLO REPARA LEGACY, NO ENVÍA A DGII')
else if IsNcrDummy then
  Lines.Add('Proceso: NCR DUMMY / VISTA PREVIA - NO ENVÍA A DGII')
else
  Lines.Add('Proceso: NCR REAL - ENVÍA A DGII');

if IsNcrFinalize then
  Lines.Add('E34 a finalizar: ' + Trim(edtNcf.Text));

      Lines.Add('--fecha-factura=' + FormatDateTime('yyyy-MM-dd', dtpkFechaTrnDiaria.Date));
      Lines.Add('Tipo e-CF: E34 - Nota de Crédito Electrónica');
      Lines.Add('e-NCF a modificar: ' + Trim(edtNcrNcfRef.Text));
      Lines.Add('Motivo NCR: ' + cbNcrReason.Text);

      if Trim(FNcrSummaryText) <> '' then
      begin
        Lines.Add('');
        Lines.Add('Resumen NCR:');
        Lines.Add(FNcrSummaryText);
      end;

      if Trim(FNcrRequestJsonPath) <> '' then
        Lines.Add('JSON NCR: ' + FNcrRequestJsonPath);
    end
    else
    begin
      Lines.Add('Confirme los parámetros de la ejecución:');
      Lines.Add('');
      Lines.Add('Proceso: Venta');
      Lines.Add('Modo: ' + rgMode.Items[rgMode.ItemIndex]);

      if IsFxUsdV9NormalTest then
      begin
        Lines.Add('*** V10 E31/E32/E45 USD CONTADO: EMISION REAL EN TEST ***');
        Lines.Add('Se activan automaticamente --mode=normal,');
        Lines.Add('--fx-usd-fiscal-rounded y --fx-usd-normal-test.');
        Lines.Add('Puede reservar e-NCF, enviar a ASOTECH y persistir legacy.');
      end;

      if IsModeReportOnly then
      begin
        Lines.Add('Report Only: solo genera reporte.');
        Lines.Add('No reserva NCF, no envía DGII y no persiste legacy.');
      end;

      Lines.Add('Tipo e-CF: ' + cbEcfType.Text);

      if IsModeNormal or IsModeDummy or IsModeReportOnly then
      begin
        Lines.Add('Moneda salida: ' + cbOutputCurrency.Text);
        Lines.Add('Condición venta: ' + cbSaleCondition.Text);
        Lines.Add('Forma de pago: ' + cbPaymentMethod.Text);
        Lines.Add('Fecha operación: ' + DateToStr(dtpkFechaTrnDiaria.Date));
        Lines.Add('Archivos: ' + IntToStr(lbFolders.Items.Count));

        // Confirmacion previa para evitar interpretar montos DOP como USD.
        Lines.Add('');
        Lines.Add('*** IMPORTANTE: VERIFIQUE LA MONEDA DE LAS ORDENES ***');
        Lines.Add('Confirme que los PRECIOS y TOTALES digitados en Excel');
        Lines.Add('estan en la MONEDA DE ENTRADA configurada en Orders2Ecf.');
        Lines.Add('La moneda de SALIDA: ' + cbOutputCurrency.Text + ' solo controla la impresion.');
        Lines.Add('El indicador USD del Excel NO garantiza que los montos sean USD.');
        Lines.Add('Si digitó importes en RD$ y el sistema espera USD,');
        Lines.Add('la factura DGII podria multiplicarse por la tasa de cambio.');
        Lines.Add('Si tiene dudas, seleccione NO y revise las ordenes.');
      end
      else
        Lines.Add('NCF / e-NCF: ' + Trim(edtNcf.Text));
    end;

    Lines.Add('');
    Lines.Add(
      'AMBIENTE CONFIGURADO: ' +
      FEnvironmentType
    );

    if FEnvironmentType = 'PRODUCCION' then
      Lines.Add(
        '*** ATENCION: ESTA OPERACION AFECTARA PRODUCCION ***'
      );

    Lines.Add('');

    Lines.Add('');
    Lines.Add('Comando a ejecutar:');
    Lines.Add(BuildCommandLine);

    Result := Lines.Text;
  finally
    Lines.Free;
  end;
end;

procedure TfrmOrders2EcfRunner.ValidateInputs;
var
  I: Integer;
  FilePath: string;
  PayCode: Integer;
  ValidateSelectedFiles: Boolean;
begin
  if not FileExistsSafe(edtExePath.Text) then
    raise Exception.Create('Debe seleccionar Orders2Ecf.Cli.exe.');

  if IsProcessingNcr then
  begin
    if Trim(edtNcrNcfRef.Text) = '' then
      raise Exception.Create('Debe indicar el e-NCF a modificar para la NCR.');

    EnsureValidNcrReferenceNcf(edtNcrNcfRef.Text);

    if ExtractLeadingInt(cbNcrReason.Text) <= 0 then
      raise Exception.Create('Debe seleccionar el motivo de la NCR.');

    if Trim(FNcrRequestJsonPath) <> '' then
      EnsureNcrJsonReferenceMatchesEdit(FNcrRequestJsonPath, edtNcrNcfRef.Text);

    if IsNcrFinalize then
begin
  if Trim(edtNcf.Text) = '' then
    raise Exception.Create('Para finalizar legacy de una NCR debe indicar el e-NCF E34 en el campo NCF/e-NCF.');

  if Copy(UpperCase(Trim(edtNcf.Text)), 1, 3) <> 'E34' then
    raise Exception.Create('El e-NCF a finalizar debe ser una Nota de Crédito E34.');

  if Trim(FNcrRequestJsonPath) = '' then
    raise Exception.Create('Para ncr-finalize debe existir el JSON NCR usado para construir la nota.');
end;

    Exit;
  end;

  //if (IsModeNormal or IsModeDummy) and (lbFolders.Items.Count = 0) then
  //  raise Exception.Create('Debe seleccionar al menos un archivo de Orden.');
  if (IsModeNormal or IsModeDummy or IsModeReportOnly) and (lbFolders.Items.Count = 0) then
  raise Exception.Create('Debe seleccionar al menos un archivo de Orden.');

  //ValidateSelectedFiles := IsModeNormal or IsModeDummy or (IsModeRecoverTimbre and (lbFolders.Items.Count > 0));

  ValidateSelectedFiles := IsModeNormal or IsModeDummy or IsModeReportOnly or
  (IsModeRecoverTimbre and (lbFolders.Items.Count > 0));

  if ValidateSelectedFiles then
  begin
    for I := 0 to lbFolders.Items.Count - 1 do
    begin
      FilePath := Trim(lbFolders.Items[I]);

      if FilePath = '' then
        raise Exception.CreateFmt('El archivo #%d esta vacio.', [I + 1]);

      if not FileExists(FilePath) then
        raise Exception.CreateFmt('El archivo no existe: %s', [FilePath]);
    end;
  end;

  if (IsModeReprint or IsModeReplay or IsModeRecoverTimbre) and (Trim(edtNcf.Text) = '') then
    raise Exception.Create('En este modo debe indicar el NCF/e-NCF.');

  if IsModeReprint and chkLegacyReplay.Checked then
    raise Exception.Create('No combine Reprint con Legacy Replay.');

  if IsModeRecoverTimbre and chkLegacyReplay.Checked then
    raise Exception.Create('No combine Recover Timbre con Legacy Replay.');

  //if IsModeDummy and chkLegacyReplay.Checked then
  //  raise Exception.Create('No combine Dummy con Legacy Replay.');
  if IsModeReportOnly and chkLegacyReplay.Checked then
  raise Exception.Create('No combine Report Only con Legacy Replay.');
  
  if IsModeNormal or IsModeDummy then
  begin
    PayCode := GetSelectedPaymentMethodCode;

    if (PayCode = 5) and (GetSelectedEcfType <> 'E32') then
      raise Exception.Create('La forma de pago 5 (Bonos / Certificados) solo aplica para E32.');

    if SameText(GetSelectedSaleCondition, 'credito') and (PayCode <> 4) then
      raise Exception.Create('Cuando la condicion de venta es credito, la forma de pago debe ser 4 - Venta a credito.');

    if SameText(GetSelectedSaleCondition, 'contado') and (PayCode = 4) then
      raise Exception.Create('Cuando la condicion de venta es contado, la forma de pago no puede ser 4 - Venta a credito.');
  end;

  if IsNcrFinalize and IsNcrDummy then
  raise Exception.Create('No se puede combinar NCR Dummy con NCR Finalize.');

  // Solo V10 E31/E32/E45/E32/E45 USD contado/credito. El CLI tambien valida AmbienteTipo y URL,
  // por lo que el indicador visual del Runner nunca autoriza el envio por si solo.
  if IsFxUsdRoundedCandidate then
  begin
    if ExtraArgsTieneOpcionFiscalConflictiva then
      raise Exception.Create(
        'Retire argumentos de modo, fiscales, moneda, tipo, pago o fecha de Argumentos Extra. ' +
        'El Runner las construye automaticamente para E31/E32/E45 USD contado/credito.');

    if IsModeNormal then
    begin
      RefreshEnvironmentInfo;
      if not IsFxUsdV9NormalTest then
        raise Exception.Create(
          'V10 E31/E32/E45/E32/E45 USD contado/credito solo esta habilitada en ambiente TEST. ' +
          'Revise appsettings.json del ejecutable seleccionado. ' +
          'No se invocara el CLI ni se reservara e-NCF.');
      if not chkShowTotalDop.Checked then
        raise Exception.Create(
          'V10 E31/E32/E45/E32/E45 USD contado/credito requiere Mostrar total DOP. ' +
          'Active la casilla para imprimir el total fiscal canonico.');
    end;
  end;
end;

function TfrmOrders2EcfRunner.BuildCommandPreview: string;
var
  Parts: TStringList;
begin
  Parts := TStringList.Create;
  try
    Parts.Add('Vista previa de parametros:');
    Parts.Add('');

    if IsProcessingNcr then
    begin
if IsNcrFinalize then
begin
  Parts.Add('--mode=ncr-finalize');
  Parts.Add('--ncf=' + Trim(edtNcf.Text));
end
else if IsNcrDummy then
  Parts.Add('--mode=ncr-dummy')
else
  Parts.Add('--mode=ncr');

      Parts.Add('--ecf-type=E34');
      Parts.Add('--ncf-ref=' + Trim(edtNcrNcfRef.Text));
      Parts.Add('--ncr-reason=' + IntToStr(ExtractLeadingInt(cbNcrReason.Text)));
      if Trim(FNcrRequestJsonPath) <> '' then
        Parts.Add('--ncr-request-json=' + FNcrRequestJsonPath)
      else
        Parts.Add('--ncr-request-json=(se generará al diseñar la NCR)');
      if Trim(FNcrSummaryText) <> '' then
      begin
        Parts.Add('');
        Parts.Add('Resumen NCR:');
        Parts.Add(FNcrSummaryText);
      end;
    end
    else if IsModeNormal or IsModeDummy or IsModeReportOnly then
    begin
      if lbFolders.Items.Count > 0 then
        Parts.Add('--input-list="<seleccion.json>"')
      else
        Parts.Add('--input-list=(sin archivos)');

      Parts.Add('--fecha-factura=' + FormatDateTime('yyyy-MM-dd', dtpkFechaTrnDiaria.DateTime));
      Parts.Add('--ecf-type=' + GetSelectedEcfType);
      Parts.Add('--output-currency=' + GetSelectedOutputCurrency);

      if chkShowTotalDop.Checked then
        Parts.Add('--show-total-dop=true')
      else
        Parts.Add('--show-total-dop=false');

      Parts.Add('--sale-condition=' + GetSelectedSaleCondition);
      Parts.Add('--payment-method=' + IntToStr(GetSelectedPaymentMethodCode));

if IsModeDummy then
begin
  Parts.Add('--mode=dummy');
  if chkRedondear.Checked then
  begin
    if IsFxUsdRoundedCandidate then
      Parts.Add('--fx-usd-fiscal-rounded')
    else
      Parts.Add('--fx-usd-round-first');
  end;
end
else if IsModeReportOnly then
  Parts.Add('--mode=report-only')
else if IsFxUsdV9NormalTest then
begin
  Parts.Add('--mode=normal');
  Parts.Add('--fx-usd-fiscal-rounded');
  Parts.Add('--fx-usd-normal-test');
end
else
  Parts.Add('--mode=(normal, sin V9)');
  
      if not IsModeReportOnly then
begin
  if chkLegacyImport.Checked then
    Parts.Add('--legacy-import');

  if chkLegacyReplay.Checked then
    Parts.Add('--legacy-replay');

  if chkLegacyNumbering.Checked then
    Parts.Add('--legacy-numbering');
end
else
begin
  Parts.Add('');
  Parts.Add('Report Only: no reserva NCF, no envia DGII y no persiste legacy.');
end;

    end
    else if IsModeReprint then
      Parts.Add('--reprint=' + Trim(edtNcf.Text))
    else if IsModeReplay then
    begin
      Parts.Add('--mode=replay');
      Parts.Add('--ncf=' + Trim(edtNcf.Text));
    end
    else if IsModeRecoverTimbre then
    begin
      Parts.Add('--mode=recover-timbre');
      Parts.Add('--ncf=' + Trim(edtNcf.Text));
    end;

    if Trim(edtExtraArgs.Text) <> '' then
    begin
      Parts.Add('');
      Parts.Add('Extra:');
      Parts.Add(Trim(edtExtraArgs.Text));
    end;

    Parts.Add('');
    Parts.Add('Comando final:');
    Parts.Add(BuildCommandLine);

    Result := Trim(Parts.Text);
  finally
    Parts.Free;
  end;
end;

function TfrmOrders2EcfRunner.BuildCommandLine: string;
var
  I: Integer;
  Extra, InputListFile: string;
  HasFiles: Boolean;
begin
  if IsProcessingNcr then
  begin
    Result := BuildNcrCommandLine;
    Exit;
  end;

  Result := '';
  Extra := Trim(edtExtraArgs.Text);

  HasFiles := False;
  for I := 0 to lbFolders.Items.Count - 1 do
  begin
    if Trim(lbFolders.Items[I]) <> '' then
    begin
      HasFiles := True;
      Break;
    end;
  end;

  InputListFile := '';
if HasFiles and (IsModeNormal or IsModeDummy or IsModeReportOnly or IsModeRecoverTimbre) then
  InputListFile := BuildInputListJsonFile;

  if IsModeReprint then
    Result := '--reprint=' + Trim(edtNcf.Text)
  else if IsModeReplay then
    Result := '--mode=replay --ncf=' + Trim(edtNcf.Text)
  else if IsModeRecoverTimbre then
  begin
    if InputListFile <> '' then
      Result := '--input-list=' + QuoteArg(InputListFile) + ' ';
    Result := Result + '--mode=recover-timbre --ncf=' + Trim(edtNcf.Text);
  end
  else
  begin
    if InputListFile <> '' then
      Result := '--input-list=' + QuoteArg(InputListFile);

    if Result <> '' then
      Result := Result + ' ';
    Result := Result + '--fecha-factura=' + FormatDateTime('yyyy-MM-dd', dtpkFechaTrnDiaria.DateTime);
    Result := Result + ' --ecf-type=' + GetSelectedEcfType;
    Result := Result + ' --output-currency=' + GetSelectedOutputCurrency;

    if chkShowTotalDop.Checked then
      Result := Result + ' --show-total-dop=true'
    else
      Result := Result + ' --show-total-dop=false';

    Result := Result + ' --sale-condition=' + GetSelectedSaleCondition;
    Result := Result + ' --payment-method=' + IntToStr(GetSelectedPaymentMethodCode);

if IsModeDummy then
begin
  Result := Result + ' --mode=dummy';
  if chkRedondear.Checked then
  begin
    if IsFxUsdRoundedCandidate then
      Result := Result + ' --fx-usd-fiscal-rounded'
    else
      Result := Result + ' --fx-usd-round-first';
  end;
end
else if IsModeReportOnly then
  Result := Result + ' --mode=report-only'
else if IsFxUsdV9NormalTest then
  Result := Result + ' --mode=normal --fx-usd-fiscal-rounded --fx-usd-normal-test';

  if not IsModeReportOnly then
begin
  if chkLegacyImport.Checked then
    Result := Result + ' --legacy-import';

  if chkLegacyReplay.Checked then
    Result := Result + ' --legacy-replay';

  if chkLegacyNumbering.Checked then
    Result := Result + ' --legacy-numbering';
end;
  end;

  if Extra <> '' then
    Result := Result + ' ' + Extra;
end;

procedure TfrmOrders2EcfRunner.UpdateCommandPreview;
begin
  memCliPreview.Lines.Text := BuildCommandPreview;
end;

procedure TfrmOrders2EcfRunner.AnyParamControlChange(Sender: TObject);
begin
  if FUpdatingUi then Exit;

  if Sender = edtExePath then
    RefreshEnvironmentInfo;

  if Sender = chkNcrDummy then
  begin
    if Assigned(chkNcrDummy) and chkNcrDummy.Checked and Assigned(chkNcrFinalize) then
      chkNcrFinalize.Checked := False;
  end
  else if Sender = chkNcrFinalize then
  begin
    if Assigned(chkNcrFinalize) and chkNcrFinalize.Checked and Assigned(chkNcrDummy) then
      chkNcrDummy.Checked := False;
  end
  else if IsProcessingNcr then
    ResetNcrPayload;

  SyncProcessTypeControls;
  UpdateCommandPreview;
end;

procedure TfrmOrders2EcfRunner.cbEcfTypeChange(Sender: TObject);
begin
  ApplySuggestedOptionsFromEcfType(True);

  RefreshLastEcfSequence;

  UpdateCommandPreview;
end;

procedure TfrmOrders2EcfRunner.cbSaleConditionChange(Sender: TObject);
begin
  if FUpdatingUi then Exit;
  UpdatePaymentUi;
  UpdateCommandPreview;
end;

procedure TfrmOrders2EcfRunner.cbPaymentMethodChange(Sender: TObject);
begin
  if FUpdatingUi then Exit;

  if SameText(GetSelectedSaleCondition, 'contado') and (GetSelectedPaymentMethodCode = 4) then
  begin
    SelectPaymentMethodCode(1);
    MessageDlg('Cuando la condicion de venta es contado, la forma de pago no puede ser 4 - Venta a credito.', mtWarning, [mbOK], 0);
  end;

  UpdateCommandPreview;
end;

procedure TfrmOrders2EcfRunner.AddOrderFile(const AFileName: string);
var
  S: string;
begin
  S := Trim(AFileName);
  if S = '' then Exit;
  if not FileExists(S) then Exit;
  if not IsExcelOrderFile(S) then Exit;
  if lbFolders.Items.IndexOf(S) >= 0 then Exit;
  lbFolders.Items.Add(S);
end;

function TfrmOrders2EcfRunner.IsExcelOrderFile(const AFileName: string): Boolean;
var
  Ext: string;
  NameOnly: string;
begin
  Ext := LowerCase(ExtractFileExt(AFileName));
  NameOnly := ExtractFileName(AFileName);
  Result := ((Ext = '.xls') or (Ext = '.xlsx')) and (Copy(NameOnly, 1, 2) <> '~$');
end;

procedure TfrmOrders2EcfRunner.AddDroppedFilesFromHandle(const ADropHandle: HDROP);
var
  Count, I, Len: Cardinal;
  Buf: array of Char;
  FileName: string;
  SR: TSearchRec;
  FolderPattern: string;
begin
  Count := DragQueryFile(ADropHandle, $FFFFFFFF, nil, 0);
  for I := 0 to Count - 1 do
  begin
    Len := DragQueryFile(ADropHandle, I, nil, 0);
    SetLength(Buf, Len + 2);
    FillChar(Buf[0], Length(Buf) * SizeOf(Char), 0);
    DragQueryFile(ADropHandle, I, PChar(Buf), Len + 1);
    FileName := Trim(string(PChar(Buf)));

    if DirectoryExists(FileName) then
    begin
      FolderPattern := IncludeTrailingPathDelimiter(FileName) + '*.*';
      if FindFirst(FolderPattern, faAnyFile, SR) = 0 then
      try
        repeat
          if (SR.Name <> '.') and (SR.Name <> '..') and ((SR.Attr and faDirectory) = 0) then
            AddOrderFile(IncludeTrailingPathDelimiter(FileName) + SR.Name);
        until FindNext(SR) <> 0;
      finally
        FindClose(SR);
      end;
    end
    else
      AddOrderFile(FileName);
  end;
  UpdateCommandPreview;
end;

procedure TfrmOrders2EcfRunner.WMDropFiles(var Msg: TWMDropFiles);
begin
  try
    if (not FIsRunning) and (not IsProcessingNcr) then
      AddDroppedFilesFromHandle(Msg.Drop);
  finally
    DragFinish(Msg.Drop);
  end;
end;

function TfrmOrders2EcfRunner.ExecuteAndCapture(const ExePath, Params: string; out ExitCode: Cardinal): Boolean;
var
  SA: TSecurityAttributes;
  ReadPipe, WritePipe: THandle;
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  Buffer: array[0..2047] of AnsiChar;
  BytesRead: DWORD;
  WaitRes: DWORD;
  S: AnsiString;
  CmdLine: string;
  WorkDir: string;
begin
  Result := False;
  ExitCode := Cardinal(-1);
  ReadPipe := 0;
  WritePipe := 0;

  FillChar(SA, SizeOf(SA), 0);
  SA.nLength := SizeOf(SA);
  SA.bInheritHandle := True;
  SA.lpSecurityDescriptor := nil;

  if not CreatePipe(ReadPipe, WritePipe, @SA, 0) then
    RaiseLastOSError;

  try
    SetHandleInformation(ReadPipe, HANDLE_FLAG_INHERIT, 0);

    FillChar(StartInfo, SizeOf(StartInfo), 0);
    StartInfo.cb := SizeOf(StartInfo);
    StartInfo.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
    StartInfo.wShowWindow := SW_HIDE;
    StartInfo.hStdInput := GetStdHandle(STD_INPUT_HANDLE);
    StartInfo.hStdOutput := WritePipe;
    StartInfo.hStdError := WritePipe;

    FillChar(ProcInfo, SizeOf(ProcInfo), 0);

    CmdLine := QuoteArg(ExePath) + ' ' + Params;
    WorkDir := ExcludeTrailingPathDelimiter(ExtractFilePath(ExePath));

    if not CreateProcess(
      PChar(ExePath),
      PChar(CmdLine),
      nil,
      nil,
      True,
      CREATE_NO_WINDOW,
      nil,
      PChar(WorkDir),
      StartInfo,
      ProcInfo) then
      RaiseLastOSError;

    try
      CloseHandle(WritePipe);
      WritePipe := 0;

      repeat
        Application.ProcessMessages;

        while PeekNamedPipe(ReadPipe, nil, 0, nil, @BytesRead, nil) and (BytesRead > 0) do
        begin
          FillChar(Buffer, SizeOf(Buffer), 0);
          if not ReadFile(ReadPipe, Buffer, SizeOf(Buffer) - 1, BytesRead, nil) then
            Break;

          if BytesRead > 0 then
          begin
            SetString(S, PAnsiChar(@Buffer[0]), BytesRead);
            memLog.Text := memLog.Text + String(S);
            memLog.SelStart := Length(memLog.Text);
            memLog.Perform(EM_SCROLLCARET, 0, 0);
          end;
        end;

        WaitRes := WaitForSingleObject(ProcInfo.hProcess, 100);
      until WaitRes <> WAIT_TIMEOUT;

      while PeekNamedPipe(ReadPipe, nil, 0, nil, @BytesRead, nil) and (BytesRead > 0) do
      begin
        FillChar(Buffer, SizeOf(Buffer), 0);
        if not ReadFile(ReadPipe, Buffer, SizeOf(Buffer) - 1, BytesRead, nil) then
          Break;

        if BytesRead > 0 then
        begin
          SetString(S, PAnsiChar(@Buffer[0]), BytesRead);
          memLog.Text := memLog.Text + String(S);
          memLog.SelStart := Length(memLog.Text);
          memLog.Perform(EM_SCROLLCARET, 0, 0);
        end;
      end;

      if not GetExitCodeProcess(ProcInfo.hProcess, ExitCode) then
        RaiseLastOSError;

      Result := (ExitCode = 0);
    finally
      CloseHandle(ProcInfo.hThread);
      CloseHandle(ProcInfo.hProcess);
    end;
  finally
    if ReadPipe <> 0 then CloseHandle(ReadPipe);
    if WritePipe <> 0 then CloseHandle(WritePipe);
  end;
end;

function TfrmOrders2EcfRunner.ExtractReportPath: string;
var
  I, P: Integer;
  Line, Value: string;

  function TryExtractByTag(const ALine, ATag: string; out AValue: string): Boolean;
  var
    LP: Integer;
  begin
    Result := False;
    AValue := '';
    LP := Pos(ATag, ALine);
    if LP > 0 then
    begin
      AValue := Trim(Copy(ALine, LP + Length(ATag), MaxInt));
      Result := AValue <> '';
    end;
  end;

begin
  Result := '';

  for I := memLog.Lines.Count - 1 downto 0 do
  begin
    Line := Trim(memLog.Lines[I]);

    if TryExtractByTag(Line, '[REPORT] XLSX generado:', Value) then
    begin
      Result := Value;
      Exit;
    end;

    if TryExtractByTag(Line, '[REPORT-ONLY] XLSX generado:', Value) then
    begin
      Result := Value;
      Exit;
    end;

    P := Pos('InvoiceReportOnly_', Line);
    if P > 0 then
    begin
      Value := Copy(Line, P, MaxInt);
      P := Pos(':\', Line);
      if P > 0 then
      begin
        Value := Copy(Line, P - 1, MaxInt);
        if Pos('.xlsx', LowerCase(Value)) > 0 then
        begin
          Value := Copy(Value, 1, Pos('.xlsx', LowerCase(Value)) + 4);
          Result := Trim(Value);
          Exit;
        end;
      end;
    end;
  end;
end;

function TfrmOrders2EcfRunner.ExtractLastGeneratedXlsxPath: string;
var
  I, P: Integer;
  Line, Candidate: string;
begin
  Result := '';

  for I := memLog.Lines.Count - 1 downto 0 do
  begin
    Line := Trim(memLog.Lines[I]);
    P := Pos('.xlsx', LowerCase(Line));
    if P > 0 then
    begin
      Candidate := Copy(Line, 1, P + 4 - 1);

      P := Pos(':\', Candidate);
      if P > 0 then
        Candidate := Copy(Candidate, P - 1, MaxInt);

      Candidate := Trim(Candidate);

      if FileExistsSafe(Candidate) then
      begin
        Result := Candidate;
        Exit;
      end;
    end;
  end;
end;

procedure TfrmOrders2EcfRunner.OpenReportIfAny;
var
  ReportPath: string;
  I: Integer;
  OpenRes: HINST;
begin
  ReportPath := ExtractReportPath;
  if (ReportPath = '') or not FileExistsSafe(ReportPath) then
    ReportPath := ExtractLastGeneratedXlsxPath;

  if ReportPath = '' then
  begin
    Log('No se encontró el reporte XLSX para abrir automáticamente.');
    Exit;
  end;

  for I := 1 to 10 do
  begin
    if FileExistsSafe(ReportPath) then
      Break;
    Sleep(200);
    Application.ProcessMessages;
  end;

  if not FileExistsSafe(ReportPath) then
  begin
    Log('El reporte fue detectado en el log, pero no existe f'#237'sicamente: ' + ReportPath);
    Exit;
  end;

  Log('Abriendo reporte XLSX: ' + ReportPath);
  OpenRes := 0;

  if OpenFileWithAssociatedExe(ReportPath) then
    OpenRes := 42
  else
  begin
    Log('No fue posible abrir el reporte directamente. Intentando localizarlo...');
    OpenRes := ShellExecute(
      Handle,
      'open',
      'explorer.exe',
      PChar('/select,"' + ReportPath + '"'),
      nil,
      SW_SHOWNORMAL);
  end;

  if Integer(OpenRes) <= 32 then
    Log('No fue posible abrir el reporte automáticamente. ShellExecute=' + IntToStr(Integer(OpenRes)));
end;

function TfrmOrders2EcfRunner.OpenFileWithAssociatedExe(const AFileName: string): Boolean;
var
  ExeBuf: array[0..MAX_PATH] of Char;
  AssocExe: string;
  Res: HINST;
begin
  Result := False;

  FillChar(ExeBuf, SizeOf(ExeBuf), 0);
  if FindExecutable(PChar(AFileName), nil, ExeBuf) <= 32 then
    Exit;

  AssocExe := Trim(string(ExeBuf));
  if AssocExe = '' then
    Exit;

  Res := ShellExecute(
    Handle,
    'open',
    PChar(AssocExe),
    PChar('"' + AFileName + '"'),
    PChar(ExtractFilePath(AFileName)),
    SW_SHOWNORMAL
  );

  Result := Integer(Res) > 32;
end;

procedure TfrmOrders2EcfRunner.OpenOutputFolderIfAny;
var
  ReportPath, Dir: string;
begin
  ReportPath := ExtractReportPath;
  if (ReportPath = '') or not FileExistsSafe(ReportPath) then
    ReportPath := ExtractLastGeneratedXlsxPath;

  if FileExistsSafe(ReportPath) then
    Dir := ExtractFilePath(ReportPath)
  else if lbFolders.Items.Count > 0 then
    Dir := ExtractFilePath(lbFolders.Items[0])
  else
    Dir := '';

  if DirectoryExists(Dir) then
  begin
    Log('Abriendo carpeta: ' + Dir);
    ShellExecute(Handle, 'open', PChar(Dir), nil, nil, SW_SHOWNORMAL);
  end;
end;

function TfrmOrders2EcfRunner.ExecuteCurrentProcess: Boolean;
var
  Params: string;
  ExitCode: Cardinal;
  Ok: Boolean;
begin
  Result := False;
  ValidateInputs;

  if MessageDlg(BuildConfirmationText, mtWarning, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  SaveSettings;
  Params := BuildCommandLine;

  memLog.Clear;
  Log('Ejecutable: ' + edtExePath.Text);
  Log('Parametros: ' + Params);

  SetRunningUI(True);
  try
    Ok := ExecuteAndCapture(edtExePath.Text, Params, ExitCode);
    if Ok then
    begin
      Log('Proceso completado correctamente. ExitCode=0');
      if chkOpenReport.Checked then
        OpenReportIfAny;
      if chkOpenOutputFolder.Checked then
        OpenOutputFolderIfAny;
      Result := True;
    end
    else
      Log('Proceso finalizado con error. ExitCode=' + IntToStr(ExitCode));
  finally
    SetRunningUI(False);
  end;
end;

procedure TfrmOrders2EcfRunner.btnRunClick(Sender: TObject);
begin
 if FIsRunning then Exit;
  ExecuteCurrentProcess;
end;

function TfrmOrders2EcfRunner.CanUseCurrentVentaForNcr: Boolean;
begin
  Result := Assigned(dmFactura) and Assigned(dmFactura.qryVentaFactura) and
            (not dmFactura.qryVentaFactura.IsEmpty) and
            Assigned(dmFactura.qryVentaFacturaDet) and
            (not dmFactura.qryVentaFacturaDet.IsEmpty);
end;

function TfrmOrders2EcfRunner.SelectFacturaForNcr(out ANumeroVenta,
  ANumeroFactura: Integer; out ANcf: string): Boolean;
var
  Frm: TfrmConsultaFacturas2Ecf;
begin
  Result := False;
  ANumeroVenta := 0;
  ANumeroFactura := 0;
  ANcf := '';

  //if Assigned(Frm) then
  //FreeAndNil(Frm);

  Frm := TfrmConsultaFacturas2Ecf.Create(nil);
  try
    Frm.edtNcrNcfRef.Text:=edtNcrNcfRef.Text;
    if Frm.ExecuteForNcrSelection then
    begin
      ANumeroVenta := Frm.SelectedNumeroVenta;
      ANumeroFactura := Frm.SelectedNumeroFactura;
      ANcf := Frm.SelectedNcf;
      Result := True;
    end;
  finally
    Frm.Free;
  end;
end;

procedure TfrmOrders2EcfRunner.PrepareNcrFromFacturaActual;
var
  RefNcf: string;
begin
  if not CanUseCurrentVentaForNcr then
    raise Exception.Create('No hay una factura seleccionada con detalle disponible para NCR.');

  rgProcessType.ItemIndex := 1;
  SyncProcessTypeControls;
  RefNcf := Trim(dmFactura.qryVentaFactura.FieldByName('NUMERO_NCF').AsString);
  EnsureValidNcrReferenceNcf(RefNcf);
  edtNcrNcfRef.Text := RefNcf;
  if cbNcrReason.Items.Count > 2 then
    cbNcrReason.ItemIndex := 2;
  ResetNcrPayload;
  UpdateCommandPreview;
end;

procedure TfrmOrders2EcfRunner.btnCreateNcrClick(Sender: TObject);
var
  JsonPath, SummaryText: string;
  ReasonCode: Integer;
  ReasonText: string;
  NumeroVenta, NumeroFactura: Integer;
  NcfRef: string;
begin
  try
    if not IsProcessingNcr then
      Exit;

    ReasonCode := ExtractLeadingInt(cbNcrReason.Text);
    ReasonText := cbNcrReason.Text;

    if not SelectFacturaForNcr(NumeroVenta, NumeroFactura, NcfRef) then
      Exit;
                                           
    NcfRef := Trim(NcfRef);
    EnsureValidNcrReferenceNcf(NcfRef);

    // A partir de aqui la referencia queda fijada a la factura original seleccionada.
    // No permitir que una E34/E33 rechazada o previa se use como referencia.
    edtNcrNcfRef.Text := NcfRef;

if not TfrmOrders2EcfNcrBuilder.ExecuteNcrFromCurrentVenta(
  Self,
  NcfRef,
  ReasonCode,
  ReasonText,
  JsonPath,
  SummaryText) then
  Exit;

    EnsureNcrJsonReferenceMatchesEdit(JsonPath, edtNcrNcfRef.Text);

    FNcrRequestJsonPath := JsonPath;
    FNcrSummaryText := SummaryText;
    UpdateCommandPreview;

    Log('Factura seleccionada para NCR: NUMERO=' + IntToStr(NumeroVenta) +
        ' NUMERO_FACTURA=' + IntToStr(NumeroFactura) +
        ' NCF=' + edtNcrNcfRef.Text);
    Log('Payload NCR: ' + FNcrRequestJsonPath);

    ExecuteCurrentProcess;
  except
    on E: Exception do
    begin
      SetRunningUI(False);
      SyncProcessTypeControls;
      Log('ERROR: ' + E.Message);
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfrmOrders2EcfRunner.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrders2EcfRunner.SyncModeControls;
var
  HelpText: string;
  NeedNcf: Boolean;
begin
  if FIsRunning then Exit;
  NeedNcf := IsModeReprint or IsModeReplay or IsModeRecoverTimbre;

  edtNcf.Enabled := NeedNcf and (not IsProcessingNcr);
  lblNcf.Enabled := NeedNcf and (not IsProcessingNcr);
  lblModeHelp.Enabled := True;

  if not NeedNcf then
    edtNcf.Text := '';

  if IsModeNormal then
    chkLegacyImport.Checked := True;

  if IsModeReportOnly then
  begin
    chkLegacyImport.Checked := False;
    chkLegacyReplay.Checked := False;
    chkLegacyNumbering.Checked := False;
  end;

  chkLegacyImport.Enabled := (not IsProcessingNcr) and (IsModeNormal or IsModeDummy) and (not IsModeReportOnly);
  chkLegacyNumbering.Enabled := (not IsProcessingNcr) and (IsModeNormal or IsModeDummy) and (not IsModeReportOnly);
  chkLegacyReplay.Enabled := (not IsProcessingNcr) and (IsModeNormal or IsModeDummy) and (not IsModeReportOnly);

  if IsModeReplay then
  begin
    chkLegacyReplay.Checked := True;
    chkLegacyReplay.Enabled := False;
    chkLegacyImport.Checked := False;
    chkLegacyImport.Enabled := False;
    chkLegacyNumbering.Enabled := True;
    HelpText := 'Replay: relanza el proceso por e-NCF existente. No requiere seleccion manual de archivos.';
    StatusBar1.SimpleText := 'Modo: Replay';
  end
  else if IsModeReprint then
  begin
    chkLegacyReplay.Checked := False;
    chkLegacyImport.Checked := False;
    chkLegacyNumbering.Checked := False;
    chkLegacyImport.Enabled := False;
    chkLegacyNumbering.Enabled := False;
    chkLegacyReplay.Enabled := False;
    HelpText := 'Reprint: rehace Excel/PDF desde un e-NCF existente. Solo envia parametros minimos.';
    StatusBar1.SimpleText := 'Modo: Reprint';
  end
  else if IsModeRecoverTimbre then
  begin
    chkLegacyReplay.Checked := False;
    chkLegacyImport.Checked := False;
    chkLegacyNumbering.Checked := False;
    chkLegacyImport.Enabled := False;
    chkLegacyNumbering.Enabled := False;
    chkLegacyReplay.Enabled := False;
    HelpText := 'Recover Timbre: recupera timbre/XML firmado para un e-NCF existente. Puede indicar opcionalmente el/los archivos de orden usados para recrear la factura exacta.';
    StatusBar1.SimpleText := 'Modo: Recover Timbre';
  end  else if IsModeReportOnly then
begin
  chkLegacyImport.Checked := False;
  chkLegacyReplay.Checked := False;
  chkLegacyNumbering.Checked := False;

  chkLegacyImport.Enabled := False;
  chkLegacyReplay.Enabled := False;
  chkLegacyNumbering.Enabled := False;

  HelpText := 'Report Only: genera un reporte Excel de la factura calculada. No reserva NCF, no envia DGII y no persiste legacy.';
  StatusBar1.SimpleText := 'Modo: Report Only';
end
  else if IsModeDummy then
  begin
    if chkLegacyReplay.Checked then
      chkLegacyReplay.Checked := False;

    HelpText := 'Dummy: prueba el proceso sin envio fiscal real.';
    StatusBar1.SimpleText := 'Modo: Dummy';
  end
  else
  begin
    chkLegacyReplay.Checked := False;
    HelpText := 'Normal: flujo regular del CLI segun la configuracion seleccionada.';
    StatusBar1.SimpleText := 'Modo: Normal';
  end;

  lblModeHelp.Caption := HelpText;

  if IsFxUsdV9NormalTest then
    lblModeHelp.Caption :=
      'V9 TEST: E31/E32/E45 USD contado/credito. El Runner agrega los 3 flags fiscales automaticamente.';

  if not IsProcessingNcr then
  begin
    gbFolders.Enabled := True;
    lbFolders.Enabled := True;
    btnAddFolder.Enabled := True;
	
    gbFolders.Enabled := IsModeNormal or IsModeDummy or IsModeRecoverTimbre;
    btnAddFolder.Enabled := gbFolders.Enabled and btnRun.Enabled;
    btnRemoveFolder.Enabled := gbFolders.Enabled and btnRun.Enabled;
    btnClearFolders.Enabled := gbFolders.Enabled and btnRun.Enabled;
  end;

  UpdatePaymentUi;
  UpdateCommandPreview;
end;

procedure TfrmOrders2EcfRunner.rgModeClick(Sender: TObject);
begin
  SyncModeControls;
end;

procedure TfrmOrders2EcfRunner.rgProcessTypeClick(Sender: TObject);
begin
  ResetNcrPayload;
  SyncProcessTypeControls;

end;

procedure TfrmOrders2EcfRunner.chkLegacyReplayClick(Sender: TObject);
begin
  if IsModeDummy and chkLegacyReplay.Checked then
  begin
    chkLegacyReplay.Checked := False;
    MessageDlg('Legacy Replay no aplica en modo Dummy.', mtWarning, [mbOK], 0);
  end;
  if IsModeReportOnly and chkLegacyReplay.Checked then
begin
  chkLegacyReplay.Checked := False;
  MessageDlg('Legacy Replay no aplica en modo Report Only.', mtWarning, [mbOK], 0);
end;
  if IsModeReprint and chkLegacyReplay.Checked then
  begin
    chkLegacyReplay.Checked := False;
    MessageDlg('Legacy Replay no aplica en modo Reprint.', mtWarning, [mbOK], 0);
  end;

  if IsModeRecoverTimbre and chkLegacyReplay.Checked then
  begin
    chkLegacyReplay.Checked := False;
    MessageDlg('Legacy Replay no aplica en modo Recover Timbre.', mtWarning, [mbOK], 0);
  end;
  UpdateCommandPreview;
end;

function TfrmOrders2EcfRunner.JsonEscape(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
  begin
    case S[I] of
      '\': Result := Result + '\\';
      '"': Result := Result + '\"';
      #8: Result := Result + '\b';
      #9: Result := Result + '\t';
      #10: Result := Result + '\n';
      #12: Result := Result + '\f';
      #13: Result := Result + '\r';
    else
      Result := Result + S[I];
    end;
  end;
end;

function TfrmOrders2EcfRunner.BuildInputListJsonFile: string;
var
  SL: TStringList;
  I: Integer;
  TempDir, FileName, S: string;
begin
  TempDir := GetEnvironmentVariable('TEMP');
  if Trim(TempDir) = '' then
    TempDir := ExtractFilePath(ParamStr(0));

  if (TempDir <> '') and (TempDir[Length(TempDir)] <> '\') then
    TempDir := TempDir + '\';

  FileName := TempDir + 'orders2ecf_selection_' +
    FormatDateTime('yyyymmdd_hhnnss_zzz', Now) + '.json';

  SL := TStringList.Create;
  try
    SL.Add('{');
    SL.Add('  "files": [');

    for I := 0 to lbFolders.Items.Count - 1 do
    begin
      S := Trim(lbFolders.Items[I]);
      if S = '' then
        Continue;

      if I < lbFolders.Items.Count - 1 then
        SL.Add('    "' + JsonEscape(S) + '",')
      else
        SL.Add('    "' + JsonEscape(S) + '"');
    end;

    SL.Add('  ]');
    SL.Add('}');

    //SL.SaveToFile(FileName);
    SaveStringsAsUtf8(FileName, SL);
  finally
    SL.Free;
  end;

  Result := FileName;
end;

procedure TfrmOrders2EcfRunner.EnableDragDropTargets;
begin
  DragAcceptFiles(Handle, True);

  if Assigned(lbFolders) and lbFolders.HandleAllocated then
  begin
    gbFolders.HandleNeeded;
    DragAcceptFiles(gbFolders.Handle, True);
    FOldGbFoldersWndProc := gbFolders.WindowProc;
    gbFolders.WindowProc := GbFoldersWindowProc;
  end;

  if Assigned(lbFolders) then
  begin
    lbFolders.HandleNeeded;
    DragAcceptFiles(lbFolders.Handle, True);
    FOldLbFoldersWndProc := lbFolders.WindowProc;
    lbFolders.WindowProc := LbFoldersWindowProc;
  end;
end;

procedure TfrmOrders2EcfRunner.DisableDragDropTargets;
begin
  DragAcceptFiles(Handle, False);

  if Assigned(gbFolders) and gbFolders.HandleAllocated then
  begin
    DragAcceptFiles(gbFolders.Handle, False);
    if Assigned(FOldGbFoldersWndProc) then
      gbFolders.WindowProc := FOldGbFoldersWndProc;
  end;

  if Assigned(lbFolders) and lbFolders.HandleAllocated then
  begin
    DragAcceptFiles(lbFolders.Handle, False);
    if Assigned(FOldLbFoldersWndProc) then
      lbFolders.WindowProc := FOldLbFoldersWndProc;
  end;
end;

procedure TfrmOrders2EcfRunner.GbFoldersWindowProc(var Msg: TMessage);
begin
  if Msg.Msg = WM_DROPFILES then
  begin
    try
	 if (not FIsRunning) and (not IsProcessingNcr) then     
        AddDroppedFilesFromHandle(Msg.WParam);
    finally
      DragFinish(Msg.WParam);
      Msg.Result := 0;
    end;
    Exit;
  end;

  if Assigned(FOldGbFoldersWndProc) then
    FOldGbFoldersWndProc(Msg)
  else
    gbFolders.DefaultHandler(Msg);
end;

procedure TfrmOrders2EcfRunner.LbFoldersWindowProc(var Msg: TMessage);
begin
  if Msg.Msg = WM_DROPFILES then
  begin
    try
      if (not FIsRunning) and (not IsProcessingNcr) then
        AddDroppedFilesFromHandle(Msg.WParam);
    finally
      DragFinish(Msg.WParam);
      Msg.Result := 0;
    end;
    Exit;
  end;

  if Assigned(FOldLbFoldersWndProc) then
    FOldLbFoldersWndProc(Msg)
  else
    //lbFolders.DefWndProc(Msg);
    lbFolders.DefaultHandler(Msg);
end;

procedure TfrmOrders2EcfRunner.Button1Click(Sender: TObject);
begin
  frmMoneda:=TfrmMoneda.Create(Nil);
  try
    frmMoneda.Showmodal;
  finally
  frmMoneda.Free;
  frmMoneda:=Nil;
  end;
  ProcMostrarTasa;
end;

procedure TfrmOrders2EcfRunner.ProcMostrarTasa;
var
  Tasa: Double;
begin
  Tasa := GlbMontoTasaByFecha(
    '2',
    dtpkFechaTrnDiaria.Date
  );

  edtTasa.ReadOnly := False;
  edtTasa.Text := FormatFloat('0.00', Tasa);
  edtTasa.ReadOnly := True;
end;

procedure TfrmOrders2EcfRunner.dtpkFechaTrnDiariaExit(Sender: TObject);
begin
  ProcMostrarTasa;
end;

procedure TfrmOrders2EcfRunner.BitBtn1Click(Sender: TObject);
begin
  frmMantNumCombFiscal := TfrmMantNumCombFiscal.Create(Nil);
  try
    frmMantNumCombFiscal.ShowModal;
  finally
  frmMantNumCombFiscal.Free;
  frmMantNumCombFiscal:=Nil;
  end;

  if (dmFactura.tblDgii_SerieNCF.State in [dsEdit, dsInsert]) or
  (dmFactura.tblDgii_SerieNCF.UpdatesPending) then
  begin
    dmFactura.tblDgii_SerieNCF.Post;
    dmFactura.tblDgii_SerieNCF.ApplyUpdates;

    if not dmFactura.tblDgii_SerieNCF.Transaction.InTransaction then
      dmFactura.tblDgii_SerieNCF.Transaction.StartTransaction;
    try
      dmFactura.tblDgii_SerieNCF.Transaction.CommitRetaining;
    except
    dmFactura.tblDgii_SerieNCF.Transaction.RollbackRetaining;
    end;
  end;

  RefreshLastEcfSequence;
end;

procedure TfrmOrders2EcfRunner.Button2Click(Sender: TObject);
begin
  GlbEsCopia:=True;
  //UImpresionVentas.ReImprimeFacturaContado;
  GlbEsCopia:=True;
  //reimprime factura aqui
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);
  dmfactura.qryFactReimpMaster.close;
  dmfactura.qryVentaFactura.Close;
  dmreportes.qryViewVentasMast.Close;

  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try
    frmConsultaFacturas.BitBtn2.Caption := '&Re-Imprimir';
    frmConsultaFacturas.Showmodal;
  finally
  FreeAndNIl(frmConsultaFacturas);
  end;
end;

procedure TfrmOrders2EcfRunner.ablas1Click(Sender: TObject);
begin
  frmEcfLegacyAdmin := TfrmEcfLegacyAdmin.Create(nil);
  try
    frmEcfLegacyAdmin.AttachDatabase(dmConectar.IBDatabase1, dmConectar.IBTransaction1);
    frmEcfLegacyAdmin.ShowModal;
  finally
  frmEcfLegacyAdmin.Free;
  end;
end;

function TfrmOrders2EcfRunner.IsNcrFinalize: Boolean;
begin
  Result := IsProcessingNcr and Assigned(chkNcrFinalize) and chkNcrFinalize.Checked;
end;

procedure TfrmOrders2EcfRunner.chkNcrFinalizeClick(Sender: TObject);
begin
  if FUpdatingUi then Exit;

  if IsNcrFinalize then
  begin
    if Assigned(chkNcrDummy) then
      chkNcrDummy.Checked := False;
  end;

  SyncProcessTypeControls;
  UpdateCommandPreview;
end;

procedure TfrmOrders2EcfRunner.ShowStartupFiscalNotice;
var
  Msg: string;
begin
  Msg :=
    'Fecha de operacion: ' +
    FormatDateTime('dd/mm/yyyy', dtpkFechaTrnDiaria.Date) + #13#10 +
    #13#10 +
    'Tasa USD vigente: RD$ ' + edtTasa.Text + #13#10 +
    'Ambiente configurado: ' + FEnvironmentType + #13#10 +
    #13#10 +
    'Verifique estos datos antes de procesar facturas.' + #13#10 +
    #13#10 +
    'Desea abrir ahora la ventana de actualizacion de tasa?';

  if MessageDlg(
       Msg,
       mtWarning,
       [mbYes, mbNo],
       0
     ) = mrYes then
  begin
    Button1Click(nil);
  end;
end;

procedure TfrmOrders2EcfRunner.FormShow(Sender: TObject);
begin
  if FStartupNoticeShown then
    Exit;

  FStartupNoticeShown := True;

  ProcMostrarTasa;
  RefreshEnvironmentInfo;
  RefreshLastEcfSequence;

  ShowStartupFiscalNotice;
end;

function TfrmOrders2EcfRunner.ReadConfiguredEnvironment: string;
var
  FileName: string;
  SL: TStringList;
  I, P: Integer;
  S, Value: string;
begin
  Result := 'NO DETERMINADO';

  if Trim(edtExePath.Text) = '' then
    Exit;

  FileName :=
    ExtractFilePath(Trim(edtExePath.Text)) +
    'appsettings.json';

  if not FileExists(FileName) then
  begin
    Result := 'APPSETTINGS NO ENCONTRADO';
    Exit;
  end;

  SL := TStringList.Create;
  try
    SL.LoadFromFile(FileName);

    for I := 0 to SL.Count - 1 do
    begin
      S := Trim(SL[I]);

      if Pos(
           '"AMBIENTETIPO"',
           UpperCase(S)
         ) = 0 then
        Continue;

      P := Pos(':', S);

      if P <= 0 then
        Continue;

      Value := Trim(Copy(S, P + 1, MaxInt));

      if (Value <> '') and
         (Value[Length(Value)] = ',') then
        Delete(Value, Length(Value), 1);

      Value := StringReplace(
        Value,
        '"',
        '',
        [rfReplaceAll]
      );

      Value := Trim(Value);

      if Pos('PROD', UpperCase(Value)) = 1 then
        Result := 'PRODUCCION'
      else if (SameText(Value, 'TEST')) or
              (SameText(Value, 'PRUEBA')) or
              (SameText(Value, 'CERTIFICACION')) then
        Result := 'TEST'
      else
        Result := UpperCase(Value);

      Exit;
    end;
  finally
    SL.Free;
  end;
end;

procedure TfrmOrders2EcfRunner.RefreshLastEcfSequence;
var
  Qry: TIBQuery;
  Trn: TIBTransaction;
  TipoCf: Integer;
  Seq: Int64;
  SeqText: string;
begin
  lblLastEcfValue.Caption := '-';

  TipoCf :=
    StrToIntDef(
      Copy(GetSelectedEcfType, 2, 2),
      0
    );

  if TipoCf <= 0 then
    Exit;

  Qry := TIBQuery.Create(nil);
  Trn := TIBTransaction.Create(nil);

  try
    Trn.DefaultDatabase := dmConectar.IBDatabase1;

    Trn.Params.Clear;
    Trn.Params.Add('read_committed');
    Trn.Params.Add('rec_version');
    Trn.Params.Add('nowait');
    Trn.Params.Add('read');

    Qry.Database := dmConectar.IBDatabase1;
    Qry.Transaction := Trn;

    Qry.SQL.Text :=
      'select NCF ' +
      'from DGII_SERIE_NFC ' +
      'where SERIE = :SERIE ' +
      '  and TIPO_CF = :TIPO_CF';

    Qry.ParamByName('SERIE').AsString := 'E';
    Qry.ParamByName('TIPO_CF').AsInteger := TipoCf;

    Trn.StartTransaction;

    try
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        Seq := Trunc(
          Qry.FieldByName('NCF').AsFloat
        );

        if Seq <= 0 then
          lblLastEcfValue.Caption := 'Sin secuencias generadas'
        else
        begin
          SeqText := IntToStr(Seq);

          while Length(SeqText) < 10 do
            SeqText := '0' + SeqText;

          lblLastEcfValue.Caption :=
            GetSelectedEcfType + SeqText;
        end;
      end
      else
        lblLastEcfValue.Caption := 'Serie no configurada';

      Qry.Close;

      Trn.Commit;
    except
      if Trn.InTransaction then
        Trn.Rollback;

      raise;
    end;

  except
    on E: Exception do
    begin
      lblLastEcfValue.Caption := 'Error consultando secuencia';

      if Trn.InTransaction then
        Trn.Rollback;
    end;
  end;

  Qry.Free;
  Trn.Free;
end;

procedure TfrmOrders2EcfRunner.RefreshEnvironmentInfo;
begin
  FEnvironmentType := ReadConfiguredEnvironment;

  lblEnvironment.Caption :=
    'AMBIENTE: ' + FEnvironmentType;

  // TLabel transparente no pinta el color de fondo.
  lblEnvironment.ParentColor := False;
  lblEnvironment.Transparent := False;

  if FEnvironmentType = 'PRODUCCION' then
  begin
    lblEnvironment.Color := TColor(RGB(230, 230, 230)); // Gris claro
    lblEnvironment.Font.Color := clNavy;
  end
  else if FEnvironmentType = 'TEST' then
  begin
    lblEnvironment.Color := TColor(RGB(221, 240, 221)); // Verde suave
    lblEnvironment.Font.Color := clNavy;
  end
  else
  begin
    lblEnvironment.Color := clYellow;
    lblEnvironment.Font.Color := clBlack;
  end;
end;

end.




