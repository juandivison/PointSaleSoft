unit UFormInteres;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, ToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, RXCtrls, Buttons,
  Grids, DBGrids, WinSkinData, IBCustomDataSet, IBTable;

type
  TfrmPorcientoInteres = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit4: TDBDateEdit;
    DBDateEdit5: TDBDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    SkinData1: TSkinData;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    tblInteres: TIBTable;
    tblInteresCODIGO: TIntegerField;
    tblInteresFECHA_INICIAL: TDateTimeField;
    tblInteresFECHA_FINAL: TDateTimeField;
    tblInteresPORCIENTO: TFloatField;
    tblInteresPORC_MORA: TFloatField;
    dstblInteres: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPorcientoInteres: TfrmPorcientoInteres;

implementation

uses UDatModPrestamo, uGlobal;

{$R *.dfm}

procedure TfrmPorcientoInteres.BitBtn1Click(Sender: TObject);
begin
  if tblInteres.State = dsBrowse then
  begin
    tblInteres.Insert;
    DBDateEdit4.SetFocus;
  end;
end;

procedure TfrmPorcientoInteres.BitBtn2Click(Sender: TObject);
begin
  if tblInteres.State = dsBrowse then
  tblInteres.Edit;
end;

procedure TfrmPorcientoInteres.BitBtn3Click(Sender: TObject);
begin
  if tblInteres.State in [dsEdit, dsInsert] then
  tblInteres.cancel;
end;

procedure TfrmPorcientoInteres.BitBtn4Click(Sender: TObject);
begin
  if tblInteres.State in [dsEdit, dsInsert] then
  begin
    if tblInteres.State = dsInsert then
    begin
      tblInteresCODIGO.Value := FsqlMaxNumero('INTERES','Codigo');
      if tblInteresCODIGO.IsNull Or (tblInteresCODIGO.Value = 0) then
      tblInteresCODIGO.Value := 1;
    end;
    tblInteres.Post;
    tblInteres.ApplyUpdates;
    if not tblInteres.Transaction.InTransaction then
    tblInteres.Transaction.StartTransaction;
    try
      tblInteres.Transaction.CommitRetaining;
    except
    tblInteres.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmPorcientoInteres.BitBtn5Click(Sender: TObject);
begin
  if tblInteres.State in [dsInactive, dsBrowse] then
  begin
    tblInteres.Close;
    tblInteres.Open;
  end;
end;

procedure TfrmPorcientoInteres.FormCreate(Sender: TObject);
begin
  tblInteres.Close;
  tblInteres.Open;
end;

procedure TfrmPorcientoInteres.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tblInteres.Close;
end;

end.
