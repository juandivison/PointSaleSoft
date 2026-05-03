unit UFrmEcfLegacyAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB, Grids, DBGrids,
  IBDatabase, IBCustomDataSet, IBTable;

type
  TTableUi = class(TObject)
  public
    TableName: string;
    TabSheet: TTabSheet;
    Grid: TDBGrid;
    DataSource: TDataSource;
    Table: TIBTable;
    constructor Create;
    destructor Destroy; override;
  end;

  TfrmEcfLegacyAdmin = class(TForm)
    pnlTop: TPanel;
    lblTitle: TLabel;
    lblFilter: TLabel;
    edtFilter: TEdit;
    btnApplyFilter: TBitBtn;
    btnClearFilter: TBitBtn;
    PageControl1: TPageControl;
    pnlBottom: TPanel;
    btnOpen: TBitBtn;
    btnRefresh: TBitBtn;
    btnInsert: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnPost: TBitBtn;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btnApplyFilterClick(Sender: TObject);
    procedure btnClearFilterClick(Sender: TObject);
  private
    FDatabase: TIBDatabase;
    FTransaction: TIBTransaction;
    FItems: TList;
    FOwnsDbObjects: Boolean;
    procedure AddManagedTable(const ATableName, ACaption: string);
    function CurrentItem: TTableUi;
    procedure RequireAttachedDatabase;
    procedure OpenCurrent;
    procedure OpenAll;
    procedure CloseAll;
    procedure RefreshCurrent;
    procedure UpdateStatus;
    procedure CommitRetainingSafe;
    procedure RollbackRetainingSafe;
    function BuildFilterExpression(const ATableName, AText: string): string;
    function FieldExists(ATable: TDataSet; const AFieldName: string): Boolean;
  public
    { Conectar desde el formulario llamador:
      frmEcfLegacyAdmin.AttachDatabase(dmFactura.IBDatabase1, dmFactura.IBTransaction1);
    }
    procedure AttachDatabase(ADB: TIBDatabase; ATR: TIBTransaction);
  end;

var
  frmEcfLegacyAdmin: TfrmEcfLegacyAdmin;

implementation

{$R *.dfm}

{ TTableUi }

constructor TTableUi.Create;
begin
  inherited Create;
end;

destructor TTableUi.Destroy;
begin
  if Assigned(Table) then
  begin
    if Table.Active then
      Table.Close;
    FreeAndNil(Table);
  end;
  FreeAndNil(DataSource);
  inherited Destroy;
end;

{ TfrmEcfLegacyAdmin }

procedure TfrmEcfLegacyAdmin.FormCreate(Sender: TObject);
begin
  Caption := 'Administracion Legacy e-CF / Auditoria Manual';
  Position := poScreenCenter;
  Width := 1180;
  Height := 720;

  FItems := TList.Create;
  FDatabase := nil;
  FTransaction := nil;
  FOwnsDbObjects := False;

  AddManagedTable('ECF_RESERVA', 'ECF_RESERVA');
  AddManagedTable('ECF_TIMBRE', 'ECF_TIMBRE');
  AddManagedTable('ECF_TIMBRE_LOG', 'ECF_TIMBRE_LOG');
  AddManagedTable('NCF_ASIGNADOS', 'NCF_ASIGNADOS');
  AddManagedTable('VENTAS_MAST', 'VENTAS_MAST');
  AddManagedTable('VENTAS_DET', 'VENTAS_DET');
  AddManagedTable('DETALLE_PAGOS', 'DETALLE_PAGOS');
  AddManagedTable('FACTURAS', 'FACTURAS');
  AddManagedTable('FACTURAS_PENDIENTES', 'FACTURAS_PENDIENTES');
  AddManagedTable('TRANS_CXC', 'TRANS_CXC');
  AddManagedTable('IMP_VENTAS_LEDGER', 'IMP_VENTAS_LEDGER');
  AddManagedTable('IMP_VENTAS_LEDGER_INVOICE', 'IMP_VENTAS_LEDGER_INVOICE');
  AddManagedTable('IMP_VENTAS_LEDGER_FILE', 'IMP_VENTAS_LEDGER_FILE');

  if PageControl1.PageCount > 0 then
    PageControl1.ActivePageIndex := 0;

  StatusBar1.SimpleText := 'Conecte el formulario con AttachDatabase(...) y presione Abrir.';
end;

procedure TfrmEcfLegacyAdmin.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  CloseAll;

  if Assigned(FItems) then
  begin
    for I := FItems.Count - 1 downto 0 do
      TObject(FItems[I]).Free;
    FreeAndNil(FItems);
  end;
end;

procedure TfrmEcfLegacyAdmin.AttachDatabase(ADB: TIBDatabase; ATR: TIBTransaction);
var
  I: Integer;
  Item: TTableUi;
begin
  if ADB = nil then
    raise Exception.Create('AttachDatabase: ADB no puede ser nil.');

  if ATR = nil then
    raise Exception.Create('AttachDatabase: ATR no puede ser nil.');

  FDatabase := ADB;
  FTransaction := ATR;

  for I := 0 to FItems.Count - 1 do
  begin
    Item := TTableUi(FItems[I]);
    Item.Table.Database := FDatabase;
    Item.Table.Transaction := FTransaction;
  end;

  StatusBar1.SimpleText := 'Conexion asignada. Presione Abrir para consultar las tablas.';
end;

procedure TfrmEcfLegacyAdmin.AddManagedTable(const ATableName, ACaption: string);
var
  Item: TTableUi;
begin
  Item := TTableUi.Create;
  Item.TableName := ATableName;

  Item.TabSheet := TTabSheet.Create(Self);
  Item.TabSheet.PageControl := PageControl1;
  Item.TabSheet.Caption := ACaption;

  Item.Table := TIBTable.Create(Self);
  Item.Table.TableName := ATableName;
  Item.Table.BufferChunks := 100;
  Item.Table.CachedUpdates := False;

  Item.DataSource := TDataSource.Create(Self);
  Item.DataSource.DataSet := Item.Table;

  Item.Grid := TDBGrid.Create(Self);
  Item.Grid.Parent := Item.TabSheet;
  Item.Grid.Align := alClient;
  Item.Grid.DataSource := Item.DataSource;
  Item.Grid.Options := Item.Grid.Options + [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit];

  FItems.Add(Item);
end;

function TfrmEcfLegacyAdmin.CurrentItem: TTableUi;
begin
  Result := nil;
  if Assigned(PageControl1.ActivePage) then
  begin
    if (PageControl1.ActivePage.PageIndex >= 0) and
       (PageControl1.ActivePage.PageIndex < FItems.Count) then
      Result := TTableUi(FItems[PageControl1.ActivePage.PageIndex]);
  end;
end;

procedure TfrmEcfLegacyAdmin.RequireAttachedDatabase;
begin
  if (FDatabase = nil) or (FTransaction = nil) then
    raise Exception.Create('Debe llamar AttachDatabase(IBDatabase, IBTransaction) antes de abrir las tablas.');

  if not FDatabase.Connected then
    FDatabase.Open;

  if not FTransaction.InTransaction then
    FTransaction.StartTransaction;
end;

procedure TfrmEcfLegacyAdmin.OpenAll;
var
  I: Integer;
begin
  RequireAttachedDatabase;
  Screen.Cursor := crHourGlass;
  try
    for I := 0 to FItems.Count - 1 do
    begin
      try
        with TTableUi(FItems[I]).Table do
        begin
          if not Active then
            Open;
        end;
      except
        on E: Exception do
          StatusBar1.SimpleText := 'No se pudo abrir ' + TTableUi(FItems[I]).TableName + ': ' + E.Message;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  UpdateStatus;
end;

procedure TfrmEcfLegacyAdmin.OpenCurrent;
var
  Item: TTableUi;
begin
  RequireAttachedDatabase;
  Item := CurrentItem;
  if Item = nil then Exit;

  if not Item.Table.Active then
    Item.Table.Open;

  UpdateStatus;
end;

procedure TfrmEcfLegacyAdmin.CloseAll;
var
  I: Integer;
  Item: TTableUi;
begin
  if FItems = nil then Exit;

  for I := 0 to FItems.Count - 1 do
  begin
    Item := TTableUi(FItems[I]);
    if Assigned(Item.Table) and Item.Table.Active then
      Item.Table.Close;
  end;
end;

procedure TfrmEcfLegacyAdmin.RefreshCurrent;
var
  Item: TTableUi;
begin
  Item := CurrentItem;
  if (Item = nil) or (not Item.Table.Active) then Exit;

  Item.Table.DisableControls;
  try
    Item.Table.Close;
    Item.Table.Open;
  finally
    Item.Table.EnableControls;
  end;

  UpdateStatus;
end;

procedure TfrmEcfLegacyAdmin.CommitRetainingSafe;
begin
  if Assigned(FTransaction) and FTransaction.InTransaction then
    FTransaction.CommitRetaining;
end;

procedure TfrmEcfLegacyAdmin.RollbackRetainingSafe;
begin
  if Assigned(FTransaction) and FTransaction.InTransaction then
    FTransaction.RollbackRetaining;
end;

function TfrmEcfLegacyAdmin.FieldExists(ATable: TDataSet; const AFieldName: string): Boolean;
begin
  Result := Assigned(ATable) and Assigned(ATable.FindField(AFieldName));
end;

function TfrmEcfLegacyAdmin.BuildFilterExpression(const ATableName, AText: string): string;
var
  S: string;
begin
  Result := '';
  S := Trim(AText);
  if S = '' then Exit;

  S := StringReplace(S, '''', '''''', [rfReplaceAll]);

  if SameText(ATableName, 'ECF_RESERVA') then
    Result := Format('(NCF = ''%s'') or (HASH_DOC = ''%s'') or (ESTADO = ''%s'')', [S, S, S])
  else if SameText(ATableName, 'ECF_TIMBRE') then
    Result := Format('(NCF = ''%s'') or (RNC_CLIENTE = ''%s'')', [S, S])
  else if SameText(ATableName, 'ECF_TIMBRE_LOG') then
    Result := Format('(ENCF = ''%s'') or (TRN = %d)', [S, StrToIntDef(S, -999999)])
  else if SameText(ATableName, 'NCF_ASIGNADOS') then
    Result := Format('(NUMERO_NCF = ''%s'') or (NUMERO_NCF_REFERENCIA = ''%s'') or (DGII_STATUS = ''%s'')', [S, S, S])
  else if SameText(ATableName, 'VENTAS_MAST') then
    Result := Format('(NUMERO = %d) or (NUMERO_FACTURA = %d) or (SERIE_NCF_ASIGNADO = %d)', [StrToIntDef(S, -999999), StrToIntDef(S, -999999), StrToIntDef(S, -999999)])
  else if SameText(ATableName, 'VENTAS_DET') then
    Result := Format('(NUMERO = %d) or (NUMERO_FACTURA = %d)', [StrToIntDef(S, -999999), StrToIntDef(S, -999999)])
  else if SameText(ATableName, 'DETALLE_PAGOS') then
    Result := Format('(NUMERO = %d) or (NUMERO_FACTURA = %d)', [StrToIntDef(S, -999999), StrToIntDef(S, -999999)])
  else if SameText(ATableName, 'FACTURAS') then
    Result := Format('(NUMERO = %d) or (NUMERO_TRN_VTA = %d)', [StrToIntDef(S, -999999), StrToIntDef(S, -999999)])
  else if SameText(ATableName, 'FACTURAS_PENDIENTES') then
    Result := Format('(NUMERO_FACT = %d)', [StrToIntDef(S, -999999)])
  else if SameText(ATableName, 'TRANS_CXC') then
    Result := Format('(NUMERO_DOC = %d)', [StrToIntDef(S, -999999)])
  else if Pos('IMP_VENTAS_LEDGER', UpperCase(ATableName)) = 1 then
    Result := Format('(NCF = ''%s'') or (ORDER_NO = ''%s'') or (HASH_DOC = ''%s'')', [S, S, S]);
end;

procedure TfrmEcfLegacyAdmin.UpdateStatus;
var
  Item: TTableUi;
begin
  Item := CurrentItem;
  if Item = nil then
    StatusBar1.SimpleText := 'Sin tabla activa.'
  else if Item.Table.Active then
    StatusBar1.SimpleText := Item.TableName + ' abierto. Registros visibles: ' + IntToStr(Item.Table.RecordCount)
  else
    StatusBar1.SimpleText := Item.TableName + ' cerrado.';
end;

procedure TfrmEcfLegacyAdmin.btnOpenClick(Sender: TObject);
begin
  OpenAll;
end;

procedure TfrmEcfLegacyAdmin.btnRefreshClick(Sender: TObject);
begin
  RefreshCurrent;
end;

procedure TfrmEcfLegacyAdmin.btnInsertClick(Sender: TObject);
var
  Item: TTableUi;
begin
  OpenCurrent;
  Item := CurrentItem;
  if Item <> nil then
    Item.Table.Insert;
end;

procedure TfrmEcfLegacyAdmin.btnEditClick(Sender: TObject);
var
  Item: TTableUi;
begin
  OpenCurrent;
  Item := CurrentItem;
  if (Item <> nil) and (not Item.Table.IsEmpty) then
    Item.Table.Edit;
end;

procedure TfrmEcfLegacyAdmin.btnDeleteClick(Sender: TObject);
var
  Item: TTableUi;
begin
  Item := CurrentItem;
  if (Item = nil) or (not Item.Table.Active) or Item.Table.IsEmpty then Exit;

  if MessageDlg('Desea eliminar el registro actual de ' + Item.TableName + '?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    Item.Table.Delete;
    CommitRetainingSafe;
    RefreshCurrent;
  end;
end;

procedure TfrmEcfLegacyAdmin.btnPostClick(Sender: TObject);
var
  Item: TTableUi;
begin
  Item := CurrentItem;
  if (Item = nil) or (not Item.Table.Active) then Exit;

  if Item.Table.State in [dsEdit, dsInsert] then
    Item.Table.Post;

  CommitRetainingSafe;
  RefreshCurrent;
end;

procedure TfrmEcfLegacyAdmin.btnCancelClick(Sender: TObject);
var
  Item: TTableUi;
begin
  Item := CurrentItem;
  if (Item <> nil) and Item.Table.Active and (Item.Table.State in [dsEdit, dsInsert]) then
    Item.Table.Cancel;
  RollbackRetainingSafe;
  RefreshCurrent;
end;

procedure TfrmEcfLegacyAdmin.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEcfLegacyAdmin.PageControl1Change(Sender: TObject);
begin
  UpdateStatus;
end;

procedure TfrmEcfLegacyAdmin.btnApplyFilterClick(Sender: TObject);
var
  Item: TTableUi;
  F: string;
begin
  Item := CurrentItem;
  if Item = nil then Exit;
  OpenCurrent;

  F := BuildFilterExpression(Item.TableName, edtFilter.Text);
  Item.Table.Filtered := False;
  Item.Table.Filter := F;
  Item.Table.Filtered := F <> '';
  UpdateStatus;
end;

procedure TfrmEcfLegacyAdmin.btnClearFilterClick(Sender: TObject);
var
  Item: TTableUi;
begin
  Item := CurrentItem;
  if Item = nil then Exit;
  edtFilter.Text := '';
  if Item.Table.Active then
  begin
    Item.Table.Filtered := False;
    Item.Table.Filter := '';
  end;
  UpdateStatus;
end;

end.
