unit UFrmOrderFilePicker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, FileCtrl, ComCtrls,
  WinSkinData;

type
  TfrmOrderFilePicker = class(TForm)
    pnlTop: TPanel;
    lblRoot: TLabel;
    edtRoot: TEdit;
    btnBrowseRoot: TButton;
    pnlCenter: TPanel;
    dirTree: TTreeView;
    fileList: TFileListBox;
    pnlButtons: TPanel;
    btnAdd: TButton;
    btnRemove: TButton;
    btnClear: TButton;
    pnlRight: TPanel;
    lblSelected: TLabel;
    lbSelected: TListBox;
    pnlBottom: TPanel;
    lblHint: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure btnBrowseRootClick(Sender: TObject);
    procedure dirTreeChange(Sender: TObject; Node: TTreeNode);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure fileListDblClick(Sender: TObject);
  private
    procedure LoadRoot(const ARoot: string);
    procedure ExpandNodePath(Node: TTreeNode);
    procedure PopulateChildren(Node: TTreeNode);
    procedure AddSelectedFilesFromFileList;
    procedure WarnIfPotentiallyIncompleteSelection;

    procedure dirTreeDeletion(Sender: TObject; Node: TTreeNode);

    function ExtractOrderNo(const AFileName: string): string;
    function LooksLikeServiceFile(const AFileName: string): Boolean;
    function HasNonServiceSiblingWithSameOrderNo(const AOrderNo, ACurrentFile: string): Boolean;

    function NormalizeFileNameOnly(const AFileName: string): string;
    function ExtractDigitsAfterMarker(const S, Marker: string): string;
    function ExtractDigitsAfterSharp(const S: string): string;
  public
    class function Execute(AOwner: TComponent; AFiles: TStrings; const AInitialPath: string = ''): Boolean;
  end;

implementation

{$R *.dfm}

function NormalizePath(const S: string): string;
begin
  Result := Trim(StringReplace(S, '"', '', [rfReplaceAll]));
end;

function ParentPath(const APath: string): string;
var
  S: string;
begin
  S := ExcludeTrailingPathDelimiter(APath);
  Result := ExtractFileDir(S);
  if SameText(Result, S) then
    Result := S;
end;

{ TfrmOrderFilePicker }

class function TfrmOrderFilePicker.Execute(AOwner: TComponent; AFiles: TStrings; const AInitialPath: string): Boolean;
var
  F: TfrmOrderFilePicker;
  I: Integer;
begin
  Result := False;
  F := TfrmOrderFilePicker.Create(AOwner);
  try
    if Trim(AInitialPath) <> '' then
      F.LoadRoot(AInitialPath)
    else
      F.LoadRoot('\\');

    for I := 0 to AFiles.Count - 1 do
      if F.lbSelected.Items.IndexOf(AFiles[I]) < 0 then
        F.lbSelected.Items.Add(AFiles[I]);

    Result := (F.ShowModal = mrOk);
    if Result then
      AFiles.Assign(F.lbSelected.Items);
  finally
    F.Free;
  end;
end;

procedure TfrmOrderFilePicker.FormCreate(Sender: TObject);
begin
  fileList.Mask := '*.xls;*.xlsx';
  fileList.MultiSelect := True;
  edtRoot.Text := '';
  dirTree.OnDeletion := dirTreeDeletion;
end;

procedure TfrmOrderFilePicker.dirTreeDeletion(Sender: TObject; Node: TTreeNode);
begin
  if (Node <> nil) and (Node.Data <> nil) then
  begin
    StrDispose(PChar(Node.Data));
    Node.Data := nil;
  end;
end;

procedure TfrmOrderFilePicker.LoadRoot(const ARoot: string);
var
  RootPath: string;
  RootNode: TTreeNode;
begin
  RootPath := NormalizePath(ARoot);
  if RootPath = '' then Exit;

  edtRoot.Text := RootPath;
  dirTree.Items.BeginUpdate;
  try
    dirTree.Items.Clear;
    RootNode := dirTree.Items.AddChild(nil, RootPath);
    RootNode.Data := Pointer(StrNew(PChar(RootPath)));
    RootNode.HasChildren := True;
    dirTree.Selected := RootNode;
    RootNode.Expand(False);
  finally
    dirTree.Items.EndUpdate;
  end;

  try
    fileList.Directory := RootPath;
  except
    fileList.Directory := '';
  end;
end;

procedure TfrmOrderFilePicker.PopulateChildren(Node: TTreeNode);
var
  Path: string;
  SR: TSearchRec;
  Res: Integer;
  ChildPath: string;
  ChildNode: TTreeNode;
  HasRealChildren: Boolean;
begin
  if Node = nil then Exit;
  if Node.Count > 0 then Exit;
  if Node.Data = nil then Exit;

  Path := string(PChar(Node.Data));
  if Path = '' then Exit;

  HasRealChildren := False;
  Res := FindFirst(IncludeTrailingPathDelimiter(Path) + '*.*', faDirectory, SR);
  try
    while Res = 0 do
    begin
      if ((SR.Attr and faDirectory) <> 0) and (SR.Name <> '.') and (SR.Name <> '..') then
      begin
        HasRealChildren := True;
        ChildPath := IncludeTrailingPathDelimiter(Path) + SR.Name;
        ChildNode := dirTree.Items.AddChild(Node, SR.Name);
        ChildNode.Data := Pointer(StrNew(PChar(ChildPath)));
        ChildNode.HasChildren := DirectoryExists(ChildPath);
      end;
      Res := FindNext(SR);
    end;
  finally
    FindClose(SR);
  end;

  Node.HasChildren := HasRealChildren;
end;

procedure TfrmOrderFilePicker.ExpandNodePath(Node: TTreeNode);
var
  P: string;
begin
  if Node = nil then Exit;
  if Node.Data = nil then Exit;

  P := string(PChar(Node.Data));
  edtRoot.Text := P;
  PopulateChildren(Node);
  try
    fileList.Directory := P;
  except
    fileList.Directory := '';
  end;
end;

procedure TfrmOrderFilePicker.btnBrowseRootClick(Sender: TObject);
var
  Dir: string;
begin
  Dir := NormalizePath(edtRoot.Text);
  if Dir = '' then
    Dir := '\\';

  if SelectDirectory('Seleccione la carpeta raiz', '', Dir) then
    LoadRoot(Dir);
end;

procedure TfrmOrderFilePicker.dirTreeChange(Sender: TObject; Node: TTreeNode);
begin
  ExpandNodePath(Node);
end;

procedure TfrmOrderFilePicker.AddSelectedFilesFromFileList;
var
  I: Integer;
  FullPath: string;
begin
  for I := 0 to fileList.Items.Count - 1 do
    if fileList.Selected[I] then
    begin
      FullPath := IncludeTrailingPathDelimiter(fileList.Directory) + fileList.Items[I];
      if lbSelected.Items.IndexOf(FullPath) < 0 then
        lbSelected.Items.Add(FullPath);
    end;
end;

procedure TfrmOrderFilePicker.btnAddClick(Sender: TObject);
begin
  AddSelectedFilesFromFileList;
end;

procedure TfrmOrderFilePicker.fileListDblClick(Sender: TObject);
begin
  AddSelectedFilesFromFileList;
end;

procedure TfrmOrderFilePicker.btnRemoveClick(Sender: TObject);
begin
  if lbSelected.ItemIndex >= 0 then
    lbSelected.Items.Delete(lbSelected.ItemIndex);
end;

procedure TfrmOrderFilePicker.btnClearClick(Sender: TObject);
begin
  lbSelected.Items.Clear;
end;

function TfrmOrderFilePicker.NormalizeFileNameOnly(const AFileName: string): string;
begin
  Result := UpperCase(ChangeFileExt(ExtractFileName(Trim(AFileName)), ''));
end;

function TfrmOrderFilePicker.ExtractDigitsAfterMarker(const S, Marker: string): string;
var
  P, I: Integer;
  U: string;
begin
  Result := '';
  U := UpperCase(S);
  P := Pos(UpperCase(Marker), U);
  if P <= 0 then Exit;

  P := P + Length(Marker);

  while (P <= Length(U)) and (U[P] = ' ') do Inc(P);

  I := P;
  while (I <= Length(U)) and (U[I] in ['0'..'9']) do Inc(I);

  if I > P then
    Result := Copy(U, P, I - P);
end;

function TfrmOrderFilePicker.ExtractDigitsAfterSharp(const S: string): string;
var
  P, I: Integer;
begin
  Result := '';
  P := Pos('#', S);
  if P <= 0 then Exit;

  Inc(P);
  while (P <= Length(S)) and (S[P] = ' ') do Inc(P);

  I := P;
  while (I <= Length(S)) and (S[I] in ['0'..'9']) do Inc(I);

  if I > P then
    Result := Copy(S, P, I - P);
end;

function TfrmOrderFilePicker.ExtractOrderNo(const AFileName: string): string;
var
  S: string;
begin
  Result := '';
  S := NormalizeFileNameOnly(AFileName);

  Result := ExtractDigitsAfterMarker(S, 'PEDIDO');
  if Result <> '' then Exit;

  Result := ExtractDigitsAfterMarker(S, 'ORDEN');
  if Result <> '' then Exit;

  Result := ExtractDigitsAfterSharp(S);
end;

function TfrmOrderFilePicker.LooksLikeServiceFile(const AFileName: string): Boolean;
var
  U: string;
begin
  U := NormalizeFileNameOnly(AFileName);

  Result :=
    (Pos('SERV-', U) > 0) or
    (Pos('SERVICIO', U) > 0) or
    (Pos('N' + #186, U) > 0) or
    (Pos('N' + #176, U) > 0) or
    (Pos(' NO ', ' ' + U + ' ') > 0);
end;

function TfrmOrderFilePicker.HasNonServiceSiblingWithSameOrderNo(const AOrderNo, ACurrentFile: string): Boolean;
var
  I: Integer;
  OtherPath, OtherName, OtherOrderNo: string;
begin
  Result := False;
  if Trim(AOrderNo) = '' then Exit;

  for I := 0 to lbSelected.Items.Count - 1 do
  begin
    OtherPath := lbSelected.Items[I];
    if SameText(OtherPath, ACurrentFile) then
      Continue;

    OtherName := ExtractFileName(OtherPath);
    OtherOrderNo := ExtractOrderNo(OtherName);

    if SameText(OtherOrderNo, AOrderNo) and (not LooksLikeServiceFile(OtherName)) then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure TfrmOrderFilePicker.WarnIfPotentiallyIncompleteSelection;
var
  I: Integer;
  FullPath, FileName, OrderNo: string;
  WarnList: TStringList;
begin
  WarnList := TStringList.Create;
  try
    for I := 0 to lbSelected.Items.Count - 1 do
    begin
      FullPath := lbSelected.Items[I];
      FileName := ExtractFileName(FullPath);

      if LooksLikeServiceFile(FileName) then
      begin
        OrderNo := ExtractOrderNo(FileName);

        if (OrderNo = '') or (not HasNonServiceSiblingWithSameOrderNo(OrderNo, FullPath)) then
          WarnList.Add(FileName);
      end;
    end;

    if WarnList.Count > 0 then
      MessageDlg(
        'Advertencia:' + #13#10 + #13#10 +
        'Se detectaron archivos de servicio sin su archivo companero del mismo numero de orden:' + #13#10 + #13#10 +
        WarnList.Text + #13#10 +
        'Puede continuar, pero verifique que la seleccion sea correcta.',
        mtWarning, [mbOK], 0);
  finally
    WarnList.Free;
  end;
end;

procedure TfrmOrderFilePicker.btnOkClick(Sender: TObject);
begin
  WarnIfPotentiallyIncompleteSelection;
  ModalResult := mrOk;
end;

end.
