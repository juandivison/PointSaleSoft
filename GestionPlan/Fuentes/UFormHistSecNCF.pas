unit UFormHistSecNCF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RXCtrls, RXDBCtrl, ToolEdit, Grids, DBGrids,
  DB, Mask, DBCtrls, RxLookup, WinSkinData;

type
  TfrmMantHistoricoNCF = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    RxDBGrid1: TRxDBGrid;
    DBDateEdit1: TDBDateEdit;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label5: TLabel;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMantHistoricoNCF: TfrmMantHistoricoNCF;

implementation

uses UDatModFactura, UGlobal;

{$R *.dfm}

procedure TfrmMantHistoricoNCF.FormCreate(Sender: TObject);
begin
  dmFactura.tblTipoCF.Close;
  dmFactura.tblTipoCF.Open;
  dmFactura.tblQryHistoricoSecNCF.Close;
  dmFactura.tblQryHistoricoSecNCF.Open;
end;

procedure TfrmMantHistoricoNCF.BitBtn10Click(Sender: TObject);
begin
  dmFactura.tblQryHistoricoSecNCF.prior;
end;

procedure TfrmMantHistoricoNCF.BitBtn11Click(Sender: TObject);
begin
  dmFactura.tblQryHistoricoSecNCF.next;
end;

procedure TfrmMantHistoricoNCF.BitBtn12Click(Sender: TObject);
begin
  dmFactura.tblQryHistoricoSecNCF.last;
end;

procedure TfrmMantHistoricoNCF.BitBtn1Click(Sender: TObject);
begin
  if dmFactura.tblQryHistoricoSecNCF.State in [dsBrowse] then
  begin
    dmFactura.tblQryHistoricoSecNCF.Insert;
    dmFactura.tblQryHistoricoSecNCFFECHA_ASIGNACION.Value:=ExtraerFecha(Date);
    RxDBLookupCombo1.setfocus;
  end;
end;

procedure TfrmMantHistoricoNCF.BitBtn2Click(Sender: TObject);
begin
  if dmFactura.tblQryHistoricoSecNCF.State in [dsBrowse] then
  dmFactura.tblQryHistoricoSecNCF.Edit;
end;

procedure TfrmMantHistoricoNCF.BitBtn3Click(Sender: TObject);
begin
  if dmFactura.tblQryHistoricoSecNCF.State in [dsInsert, dsEdit] then
  dmFactura.tblQryHistoricoSecNCF.Cancel
  else
  begin
    if MessageDlg('Eliminar record?',mtInformation, [mbyes,mbno], 0)=mryes then
    begin
      dmFactura.tblQryHistoricoSecNCF.Delete;
      //dmFactura.tblQryHistoricoSecNCF.Post;
      dmFactura.tblQryHistoricoSecNCF.ApplyUpdates;
      try
        dmFactura.tblQryHistoricoSecNCF.Transaction.CommitRetaining;
      except
        dmFactura.tblQryHistoricoSecNCF.Transaction.RollbackRetaining;
      end;      
    end;
  end;
end;

procedure TfrmMantHistoricoNCF.BitBtn4Click(Sender: TObject);
begin
  if dmFactura.tblQryHistoricoSecNCF.State in [dsInsert, dsEdit] then
  begin
    dmFactura.tblQryHistoricoSecNCF.Post;
    dmFactura.tblQryHistoricoSecNCF.ApplyUpdates;
    try
      dmFactura.tblQryHistoricoSecNCF.Transaction.CommitRetaining;
    except
        dmFactura.tblQryHistoricoSecNCF.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmMantHistoricoNCF.BitBtn5Click(Sender: TObject);
begin
  if dmFactura.tblQryHistoricoSecNCF.State in [dsBrowse, dsInactive] then
  begin
    dmFactura.tblQryHistoricoSecNCF.Close;
    dmFactura.tblQryHistoricoSecNCF.Open;
  end;
end;

procedure TfrmMantHistoricoNCF.BitBtn9Click(Sender: TObject);
begin
  dmFactura.tblQryHistoricoSecNCF.First;
end;

end.
