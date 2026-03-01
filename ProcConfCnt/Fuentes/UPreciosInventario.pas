unit UPreciosInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RXCtrls, RXDBCtrl, ComCtrls, Grids, DBGrids,
  ToolEdit, DB, Mask, DBCtrls;

type
  TfrmPreciosInventario = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBStatusLabel4: TDBStatusLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBGrid1: TDBGrid;
    Label10: TLabel;
    DBGrid2: TDBGrid;
    DBText1: TDBText;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreciosInventario: TfrmPreciosInventario;

implementation

uses UDatModInventario, UGlobal;

{$R *.dfm}

procedure TfrmPreciosInventario.BitBtn8Click(Sender: TObject);
begin
  MessageDlg('Muy pronto...',mtInformation, [mbOK], 0);
end;

procedure TfrmPreciosInventario.BitBtn1Click(Sender: TObject);
begin
 if dmInventario.tblPrecioInventario.State = dsBrowse then
  begin
    dmInventario.tblPrecioInventario.Insert;
    dmInventario.tblPrecioInventarioSTATUS.Value:='A';
    dmInventario.tblPrecioInventarioFECHA_INICIAL.Value :=ExtraerFecha(date);
    dmInventario.tblPrecioInventarioFECHA_FINAL.Value :=ExtraerFecha(date)+365;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmPreciosInventario.BitBtn2Click(Sender: TObject);
begin
 if dmInventario.tblPrecioInventario.State = dsBrowse then
    dmInventario.tblPrecioInventario.Edit;
end;

procedure TfrmPreciosInventario.BitBtn3Click(Sender: TObject);
begin
  if dmInventario.tblPrecioInventario.State in [dsEdit,dsInsert] then
  begin
    dmInventario.tblPrecioInventario.Cancel;
  end else
  if MessageDlg('Borrar record?',mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    dmInventario.tblPrecioInventario.Delete;
    if Not dmInventario.tblPrecioInventario.Transaction.InTransaction then
    dmInventario.tblPrecioInventario.Transaction.StartTransaction;
    try
      dmInventario.tblPrecioInventario.Transaction.CommitRetaining;
    except
    dmInventario.tblPrecioInventario.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmPreciosInventario.BitBtn4Click(Sender: TObject);
begin
  if dmInventario.tblPrecioInventario.State in [dsEdit,dsInsert] then
  begin
    if dmInventario.tblPrecioInventario.State = dsInsert then
    begin
    end;
    dmInventario.tblPrecioInventario.Post;
    dmInventario.tblPrecioInventario.ApplyUpdates;
    if not dmInventario.tblPrecioInventario.Transaction.InTransaction then
    dmInventario.tblPrecioInventario.Transaction.StartTransaction;
    try
      dmInventario.tblPrecioInventario.Transaction.CommitRetaining;
    except
    dmInventario.tblPrecioInventario.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmPreciosInventario.BitBtn5Click(Sender: TObject);
begin
  if dmInventario.tblPrecioInventario.State in [dsInactive, dsBrowse] then
  begin
    dmInventario.tblPrecioInventario.Close;
    dmInventario.tblPrecioInventario.Open;
  end;
end;

procedure TfrmPreciosInventario.FormCreate(Sender: TObject);
begin
  BitBtn5Click(Self);
  dminventario.tblInventarioProd.Close;
  dminventario.tblInventarioProd.open;
end;

end.
