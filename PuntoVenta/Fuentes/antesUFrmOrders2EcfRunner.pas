unit UFrmOrders2EcfRunner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, FileCtrl, ShellApi, ComCtrls, IniFiles,
  WinSkinData,
  Buttons;

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
    procedure AnyParamControlChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dtpkFechaTrnDiariaExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FIniPath: string;
    FUpdatingUi: Boolean;
    FOldLbFoldersWndProc: TWndMethod;
    FOldGbFoldersWndProc: TWndMethod;
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
	function IsModeRecoverTimbre: Boolean;									  
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
    function GetSelectedEcfType: string;
    function GetSelectedOutputCurrency: string;
    function GetSelectedSaleCondition: string;
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
  public
  end;

var
  frmOrders2EcfRunner: TfrmOrders2EcfRunner;

implementation

uses
  UGlobal, UFrmOrderFilePicker,
  UTasaDolar, UImpresionVentas,
  UFormNumCompFiscal;

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

procedure TfrmOrders2EcfRunner.FormCreate(Sender: TObject);
begin
  Caption := 'Orders2Ecf Runner';
  dtpkFechaTrnDiaria.DateTime := ExtraerFecha(GlbFechaTrnDiaria);
  FIniPath := GetDefaultIniPath;
  FUpdatingUi := False;
  rgMode.ItemIndex := 0;

  chkLegacyImport.Checked := True;
  chkOpenReport.Checked := True;
  chkOpenOutputFolder.Checked := False;
  chkShowTotalDop.Checked := True;

  OpenDialogExe.Filter := 'Orders2Ecf CLI|Orders2Ecf.Cli.exe|Executable (*.exe)|*.exe|Todos (*.*)|*.*';
  OpenDialogExe.Options := [ofFileMustExist, ofPathMustExist, ofEnableSizing];

  InitializeOptionCombos;

  memLog.Clear;
  StatusBar1.SimpleText := 'Listo';

  LoadSettings;
  SyncModeControls;
  UpdatePaymentUi;
  UpdateCommandPreview;

  gbFolders.Caption := 'Archivos seleccionados';
  btnAddFolder.Caption := 'Seleccionar...';
  btnRemoveFolder.Caption := 'Quitar';
  btnClearFolders.Caption := 'Limpiar';
  lblHint.Caption := 'Seleccione o arrastre archivos .xls/.xlsx desde carpeta local o compartida';
  lblModeHelp.Caption := 'Normal: flujo regular. Recover Timbre: recupera QR/código/fecha para un e-NCF existente.';																													
  EnableDragDropTargets;
  ProcMostrarTasa;
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
    cbOutputCurrency.Items.Add('USD - D'#243'lares Estadounidenses');
    cbOutputCurrency.Items.Add('DOP - Pesos Dominicanos');
    cbOutputCurrency.ItemIndex := 0;

    cbSaleCondition.Items.Clear;
    cbSaleCondition.Items.Add('credito - Venta a cr'#233'dito');
    cbSaleCondition.Items.Add('contado - Venta al contado');
    cbSaleCondition.ItemIndex := 0;

    cbPaymentMethod.Items.Clear;
    cbPaymentMethod.Items.Add('1 - Efectivo');
    cbPaymentMethod.Items.Add('2 - Cheque / Transferencia / Dep'#243'sito');
    cbPaymentMethod.Items.Add('3 - Tarjeta D'#233'bito / Cr'#233'dito');
    cbPaymentMethod.Items.Add('4 - Venta a cr'#233'dito');
    cbPaymentMethod.Items.Add('5 - Bonos / Certificados');
    cbPaymentMethod.Items.Add('6 - Permuta');
    cbPaymentMethod.Items.Add('7 - Nota de cr'#233'dito');
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
    edtExtraArgs.Text := Ini.ReadString(INI_SECTION_MAIN, 'ExtraArgs', '');

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
    Ini.WriteString(INI_SECTION_MAIN, 'ExtraArgs', Trim(edtExtraArgs.Text));
    Ini.WriteInteger(INI_SECTION_MAIN, 'EcfTypeIndex', cbEcfType.ItemIndex);
    Ini.WriteInteger(INI_SECTION_MAIN, 'OutputCurrencyIndex', cbOutputCurrency.ItemIndex);
    Ini.WriteInteger(INI_SECTION_MAIN, 'SaleConditionIndex', cbSaleCondition.ItemIndex);
    Ini.WriteInteger(INI_SECTION_MAIN, 'PaymentMethodIndex', cbPaymentMethod.ItemIndex);

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
procedure TfrmOrders2EcfRunner.Log(const S: string);
begin
  memLog.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' | ' + S);
  memLog.SelStart := Length(memLog.Text);
  memLog.Perform(EM_SCROLLCARET, 0, 0);
  Application.ProcessMessages;
end;

procedure TfrmOrders2EcfRunner.SetRunningUI(const ARunning: Boolean);
begin
  btnRun.Enabled := not ARunning;
  btnClose.Enabled := not ARunning;
  btnBrowseExe.Enabled := not ARunning;
  btnAddFolder.Enabled := not ARunning;
  btnRemoveFolder.Enabled := not ARunning;
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

  if not ARunning then
  begin
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
  if lbFolders.ItemIndex >= 0 then
    lbFolders.Items.Delete(lbFolders.ItemIndex);
  UpdateCommandPreview;
end;

procedure TfrmOrders2EcfRunner.btnClearFoldersClick(Sender: TObject);
begin
  lbFolders.Items.Clear;
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
    if (EcfType = 'E31') and AForce then
    begin
      cbOutputCurrency.ItemIndex := 0; // USD
      cbSaleCondition.ItemIndex := 0;  // credito
      SelectPaymentMethodCode(4);
    end
    else if ((EcfType = 'E32') or (EcfType = 'E44') or (EcfType = 'E45')) and AForce then
    begin
							 
		   
      cbOutputCurrency.ItemIndex := 1; // DOP
												   
								   
		 
																			  
		   
											   
      cbSaleCondition.ItemIndex := 1;  // contado
      SelectPaymentMethodCode(1);
		  
    end;
  finally
    FUpdatingUi := False;
  end;
  
  try
    EcfType := GetSelectedEcfType;
    if AForce then
    begin
      if EcfType = 'E31' then
      begin
        cbOutputCurrency.ItemIndex := 0; // USD
        cbSaleCondition.ItemIndex := 0;  // credito
        SelectPaymentMethodCode(4);
      end
      else if (EcfType = 'E32') or (EcfType = 'E44') or (EcfType = 'E45') then
      begin
        cbOutputCurrency.ItemIndex := 1; // DOP
        cbSaleCondition.ItemIndex := 1;  // contado
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
  IsCredit := SameText(GetSelectedSaleCondition, 'credito');

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
	        if GetSelectedEcfType = 'E32' then
          SelectPaymentMethodCode(1)
        else
          SelectPaymentMethodCode(1);
  	end;
    cbPaymentMethod.Enabled := True;
  except
    FUpdatingUi := False;
  end;
end;

procedure TfrmOrders2EcfRunner.ValidateInputs;
var
  I: Integer;
  FilePath: string;
  PayCode: Integer;
begin
  if not FileExistsSafe(edtExePath.Text) then
    raise Exception.Create('Debe seleccionar Orders2Ecf.Cli.exe.');

  if (lbFolders.Items.Count = 0) and (not IsModeReprint) and (not IsModeRecoverTimbre) then
    raise Exception.Create('Debe seleccionar al menos un archivo de Orden.');

  for I := 0 to lbFolders.Items.Count - 1 do
  begin
    FilePath := Trim(lbFolders.Items[I]);

    if FilePath = '' then
      raise Exception.CreateFmt('El archivo #%d est'#225' vac'#237'o.', [I + 1]);

    if not FileExists(FilePath) then
      raise Exception.CreateFmt('El archivo no existe: %s', [FilePath]);
  end;

  if IsModeReprint and (Trim(edtNcf.Text) = '') then
    raise Exception.Create('En modo Reprint debe indicar el NCF/e-NCF.');

  if IsModeRecoverTimbre and (Trim(edtNcf.Text) = '') then
    raise Exception.Create('En modo Recover Timbre debe indicar el NCF/e-NCF.');
  if IsModeReprint and chkLegacyReplay.Checked then
    raise Exception.Create('No combine Reprint con Legacy Replay.');

  if IsModeRecoverTimbre and chkLegacyReplay.Checked then
    raise Exception.Create('No combine Recover Timbre con Legacy Replay.');
  if IsModeDummy and chkLegacyReplay.Checked then
    raise Exception.Create('No combine Dummy con Legacy Replay.');

  PayCode := GetSelectedPaymentMethodCode;
  if (PayCode = 5) and (GetSelectedEcfType <> 'E32') then
    raise Exception.Create('La forma de pago 5 (Bonos / Certificados) solo aplica para E32.');

  if SameText(GetSelectedSaleCondition, 'credito') and (PayCode <> 4) then
    raise Exception.Create('Cuando la condici'#243'n de venta es cr'#233'dito, la forma de pago debe ser 4 - Venta a cr'#233'dito.');
end;

function TfrmOrders2EcfRunner.BuildCommandPreview: string;
var
  Parts: TStringList;
  Extra: string;
  FinalCmd: string;
begin
  Parts := TStringList.Create;
  try
    Parts.Add('Vista previa de parámetros:');
    Parts.Add('');

    FinalCmd := '';
    if lbFolders.Items.Count > 0 then
    begin
      Parts.Add('--input-list="<seleccion.json>"');
      FinalCmd := '--input-list="<seleccion.json>"';
    end
    else
      Parts.Add('--input-list=(sin archivos)');

    if FinalCmd <> '' then
      FinalCmd := FinalCmd + ' ';
    FinalCmd := FinalCmd + '--fecha-factura=' + FormatDateTime('yyyy-MM-dd', dtpkFechaTrnDiaria.DateTime);
    Parts.Add('--fecha-factura=' + FormatDateTime('yyyy-MM-dd', dtpkFechaTrnDiaria.DateTime));

    FinalCmd := FinalCmd + ' --ecf-type=' + GetSelectedEcfType;
    Parts.Add('--ecf-type=' + GetSelectedEcfType);

    FinalCmd := FinalCmd + ' --output-currency=' + GetSelectedOutputCurrency;
    Parts.Add('--output-currency=' + GetSelectedOutputCurrency);

    if chkShowTotalDop.Checked then
    begin
      FinalCmd := FinalCmd + ' --show-total-dop=true';
      Parts.Add('--show-total-dop=true');
    end
    else
    begin
      FinalCmd := FinalCmd + ' --show-total-dop=false';
      Parts.Add('--show-total-dop=false');
    end;

    FinalCmd := FinalCmd + ' --sale-condition=' + GetSelectedSaleCondition;
    Parts.Add('--sale-condition=' + GetSelectedSaleCondition);

    FinalCmd := FinalCmd + ' --payment-method=' + IntToStr(GetSelectedPaymentMethodCode);
    Parts.Add('--payment-method=' + IntToStr(GetSelectedPaymentMethodCode));

    if IsModeDummy then
    begin
      FinalCmd := FinalCmd + ' --mode=dummy';
      Parts.Add('--mode=dummy');
    end
    else if IsModeReprint then
    begin
      FinalCmd := FinalCmd + ' --reprint=' + Trim(edtNcf.Text);
      Parts.Add('--reprint=' + Trim(edtNcf.Text));
    end
    else if IsModeReplay then
    begin
      FinalCmd := FinalCmd + ' --mode=replay';
      Parts.Add('--mode=replay');
    end
	else if IsModeRecoverTimbre then
    begin
      //FinalCmd := FinalCmd + ' --mode=recover-timbre --ncf=' + Trim(edtNcf.Text);
	  FinalCmd := FinalCmd + ' --mode=recover-timbre';
      FinalCmd := FinalCmd + ' --ncf=' + Trim(edtNcf.Text);
      Parts.Add('--mode=recover-timbre');
      Parts.Add('--ncf=' + Trim(edtNcf.Text));
    end			
    else
      Parts.Add('--mode=(normal)');

    if (not IsModeRecoverTimbre) and chkLegacyImport.Checked then
    begin
      FinalCmd := FinalCmd + ' --legacy-import';
      Parts.Add('--legacy-import');
    end;

    if (not IsModeRecoverTimbre) and (chkLegacyReplay.Checked or IsModeReplay) then
    begin
      FinalCmd := FinalCmd + ' --legacy-replay';
      Parts.Add('--legacy-replay');
    end;

    if (not IsModeRecoverTimbre) and chkLegacyNumbering.Checked then
    begin
      FinalCmd := FinalCmd + ' --legacy-numbering';
      Parts.Add('--legacy-numbering');
    end;

    Extra := Trim(edtExtraArgs.Text);
    if Extra <> '' then
    begin
      Parts.Add('');
      Parts.Add('Extra:');
      Parts.Add(Extra);
      FinalCmd := FinalCmd + ' ' + Extra;
    end;

    Parts.Add('');
    Parts.Add('Comando final:');
    Parts.Add(FinalCmd);

    Result := Trim(Parts.Text);
  finally
    Parts.Free;
  end;
end;

function TfrmOrders2EcfRunner.BuildCommandLine: string;
var
  I: Integer;
  ModeArg, Extra, FechaFacturaArg: string;
  InputListFile: string;
  HasFiles: Boolean;
begin
  Result := '';

  HasFiles := False;
  for I := 0 to lbFolders.Items.Count - 1 do
  begin
    if Trim(lbFolders.Items[I]) <> '' then
    begin
      HasFiles := True;
      Break;
    end;
  end;

  if HasFiles then
  begin
    InputListFile := BuildInputListJsonFile;
    Result := '--input-list=' + QuoteArg(InputListFile);
  end;

  FechaFacturaArg := '--fecha-factura=' + FormatDateTime('yyyy-MM-dd', dtpkFechaTrnDiaria.DateTime);

  if Result <> '' then
    Result := Result + ' ' + FechaFacturaArg
  else
    Result := FechaFacturaArg;

  Result := Result + ' --ecf-type=' + GetSelectedEcfType;
  Result := Result + ' --output-currency=' + GetSelectedOutputCurrency;

  if chkShowTotalDop.Checked then
    Result := Result + ' --show-total-dop=true'
  else
    Result := Result + ' --show-total-dop=false';

  Result := Result + ' --sale-condition=' + GetSelectedSaleCondition;
  Result := Result + ' --payment-method=' + IntToStr(GetSelectedPaymentMethodCode);

  if IsModeDummy then
    ModeArg := '--mode=dummy'
  else if IsModeReprint then
    ModeArg := '--reprint=' + Trim(edtNcf.Text)
  else if IsModeReplay then
    ModeArg := '--mode=replay'
  else if IsModeRecoverTimbre then
    ModeArg := '--mode=recover-timbre --ncf=' + Trim(edtNcf.Text)
  else
    ModeArg := '';

  if Trim(ModeArg) <> '' then
    Result := Result + ' ' + ModeArg;

  if (not IsModeRecoverTimbre) and chkLegacyImport.Checked then
    Result := Result + ' --legacy-import';

  if (not IsModeRecoverTimbre) and (chkLegacyReplay.Checked or IsModeReplay) then
    Result := Result + ' --legacy-replay';

  if (not IsModeRecoverTimbre) and chkLegacyNumbering.Checked then
    Result := Result + ' --legacy-numbering';

  Extra := Trim(edtExtraArgs.Text);
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
  UpdateCommandPreview;
end;

procedure TfrmOrders2EcfRunner.cbEcfTypeChange(Sender: TObject);
begin
  ApplySuggestedOptionsFromEcfType(True);
  UpdateCommandPreview;
end;

procedure TfrmOrders2EcfRunner.cbSaleConditionChange(Sender: TObject);
begin
  if FUpdatingUi then Exit;
  UpdatePaymentUi;
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
    if btnRun.Enabled then
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
  Line, Tag, Value: string;
begin
  Result := '';
  Tag := '[REPORT] XLSX generado:';
  for I := memLog.Lines.Count - 1 downto 0 do
  begin
    Line := Trim(memLog.Lines[I]);
    P := Pos(Tag, Line);
    if P > 0 then
    begin
      Value := Trim(Copy(Line, P + Length(Tag), MaxInt));
      if Value <> '' then
      begin
        Result := Value;
        Exit;
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
    Log('No se encontr'#243' el reporte XLSX para abrir autom'#225'ticamente.');
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
    Log('No fue posible abrir el reporte autom'#225'ticamente. ShellExecute=' + IntToStr(Integer(OpenRes)));
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

procedure TfrmOrders2EcfRunner.btnRunClick(Sender: TObject);
var
  Params: string;
  ExitCode: Cardinal;     
  Ok: Boolean;
begin
  if rgMode.ItemIndex = 0 then
  begin
    if MessageDlg('¿Desea proceder con la creación de la(s) factura(s)?',mtWarning,[mbyes,mbno],0)=mrNo then
    exit;
  end;
  try
    ValidateInputs;
    SaveSettings;
    Params := BuildCommandLine;

    memLog.Clear;
    Log('Ejecutable: ' + edtExePath.Text);
    Log('Parámetros: ' + Params);

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
      end
      else
        Log('Proceso finalizado con error. ExitCode=' + IntToStr(ExitCode));
    finally
      SetRunningUI(False);
      UpdateCommandPreview;
    end;
  except
    on E: Exception do
    begin
      SetRunningUI(False);
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
begin
  edtNcf.Enabled := IsModeReprint or IsModeRecoverTimbre;
  lblNcf.Enabled := IsModeReprint or IsModeRecoverTimbre;
  lblModeHelp.Enabled := True;

  if not (IsModeReprint or IsModeRecoverTimbre) then
    edtNcf.Text := '';

  if IsModeNormal then
    chkLegacyImport.Checked := True;

  chkLegacyImport.Enabled := not (IsModeReprint or IsModeRecoverTimbre);
  chkLegacyNumbering.Enabled := not (IsModeReprint or IsModeRecoverTimbre);
  if IsModeReplay then
  begin
    chkLegacyReplay.Checked := True;
    chkLegacyReplay.Enabled := False;
  end
  else
    chkLegacyReplay.Enabled := not (IsModeReprint or IsModeRecoverTimbre);

  if IsModeReprint then
  begin
    chkLegacyReplay.Checked := False;
    chkLegacyImport.Checked := False;
    chkLegacyNumbering.Checked := False;
    chkLegacyImport.Enabled := False;
    chkLegacyNumbering.Enabled := False;

    HelpText := 'Reprint: rehace Excel/PDF/XML de auditor'#237'a desde un e-NCF existente. No env'#237'a a DGII.';
    StatusBar1.SimpleText := 'Modo: Reprint';
  end
  else if IsModeDummy then
  begin
    if chkLegacyReplay.Checked then
      chkLegacyReplay.Checked := False;

    chkLegacyImport.Enabled := True;
    chkLegacyNumbering.Enabled := True;

    HelpText := 'Dummy: prueba el proceso sin env'#237'o fiscal real. '#218'til para validar salida.';
    StatusBar1.SimpleText := 'Modo: Dummy';
  end
  else if IsModeReplay then
  begin
    chkLegacyImport.Checked := False;
    chkLegacyImport.Enabled := False;
    chkLegacyNumbering.Enabled := True;

    HelpText := 'Replay: reutiliza NCF existente y ejecuta el pipeline legacy/replay. No env'#237'a a DGII.';
    StatusBar1.SimpleText := 'Modo: Replay';
  end
  else
  begin
    chkLegacyImport.Enabled := True;
    chkLegacyNumbering.Enabled := True;
    chkLegacyReplay.Checked := False;
    chkLegacyReplay.Enabled := True;

    HelpText := 'Normal: flujo regular del CLI seg'#250'n la configuraci'#243'n. Se recomienda Legacy Import para completar el proceso.';
    StatusBar1.SimpleText := 'Modo: Normal';
  end;

  lblModeHelp.Caption := HelpText;
  UpdatePaymentUi;
  UpdateCommandPreview;
end;

procedure TfrmOrders2EcfRunner.rgModeClick(Sender: TObject);
begin
  SyncModeControls;
end;

procedure TfrmOrders2EcfRunner.chkLegacyReplayClick(Sender: TObject);
begin
  if IsModeDummy and chkLegacyReplay.Checked then
  begin
    chkLegacyReplay.Checked := False;
    MessageDlg('Legacy Replay no aplica en modo Dummy.', mtWarning, [mbOK], 0);
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

    SL.SaveToFile(FileName);
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
      if btnRun.Enabled then
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
      if btnRun.Enabled then
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
begin
  edtTasa.ReadOnly:=False;
  edtTasa.Text:=FloattoStr(GlbMontoTasaByFecha('2',dtpkFechaTrnDiaria.Date));
  edtTasa.ReadOnly:=True;
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
end;

procedure TfrmOrders2EcfRunner.Button2Click(Sender: TObject);
begin
  GlbEsCopia:=True;
  UImpresionVentas.ReImprimeFacturaContado;
end;

end.



