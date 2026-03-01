unit UInventarioHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, rxToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  RXCtrls, Buttons;

type
  TfrmInventarioHist = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    Label5: TLabel;
    Label6: TLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBStatusLabel4: TDBStatusLabel;
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
  frmInventarioHist: TfrmInventarioHist;

implementation

uses UDatModInventario, UGlobal;

{$R *.dfm}

procedure TfrmInventarioHist.BitBtn1Click(Sender: TObject);
begin
 if dmInventario.tblInventarioHistorico.State = dsBrowse then
  begin
    dmInventario.tblInventarioHistorico.Insert;
    dmInventario.tblInventarioHistoricoSTATUS.Value:='A';
    dmInventario.tblInventarioHistoricoFECHA_INICIO.Value :=ExtraerFecha(date);
    dmInventario.tblInventarioHistoricoFECHA_FINAL.Value  :=ExtraerFecha(date);
    DBEdit3.SetFocus;
  end;
end;

procedure TfrmInventarioHist.BitBtn2Click(Sender: TObject);
begin
  if dmInventario.tblInventarioHistorico.State = dsBrowse then
  dmInventario.tblInventarioHistorico.Edit;
end;

procedure TfrmInventarioHist.BitBtn3Click(Sender: TObject);
begin
  if dmInventario.tblInventarioHistorico.State = dsBrowse then
  dmInventario.tblInventarioHistorico.Cancel;
end;

procedure TfrmInventarioHist.BitBtn4Click(Sender: TObject);
begin
  if dmInventario.tblInventarioHistorico.State in [dsEdit,dsInsert] then
  begin
    if dmInventario.tblInventarioHistorico.State = dsInsert then
    begin
    end;
    dmInventario.tblInventarioHistorico.Post;
    dmInventario.tblInventarioHistorico.ApplyUpdates;
    if not dmInventario.tblInventarioHistorico.Transaction.InTransaction then
    dmInventario.tblInventarioHistorico.Transaction.StartTransaction;
    try
      dmInventario.tblInventarioHistorico.Transaction.CommitRetaining;
    except
    dmInventario.tblInventarioHistorico.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmInventarioHist.BitBtn5Click(Sender: TObject);
begin
  if dmInventario.tblInventarioHistorico.State in [dsInactive, dsBrowse] then
  begin
    dmInventario.tblInventarioHistorico.Close;
    dmInventario.tblInventarioHistorico.Open;
  end;
end;

procedure TfrmInventarioHist.FormCreate(Sender: TObject);
begin
  BitBtn5Click(Self);
end;

end.
