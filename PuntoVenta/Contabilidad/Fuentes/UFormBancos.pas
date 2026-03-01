unit UFormBancos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Grids, DBGrids, RXDBCtrl, StdCtrls, Mask, RXCtrls,
  db, ExtCtrls, ComCtrls, Buttons, WinSkinData, RxLookup, RxToolEdit;

type
  TfrmBancos = class(TForm)
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnInsertar: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    tabRecord: TTabSheet;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    Splitter1: TSplitter;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBStatusLabel3: TDBStatusLabel;
    DBStatusLabel4: TDBStatusLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    btnInsertarTarifa: TBitBtn;
    btnmodtarifa: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    DBDateEdit2: TDBDateEdit;
    tabExaminar: TTabSheet;
    RxDBGrid2: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SkinData1: TSkinData;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnInsertarTarifaClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnmodtarifaClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBancos: TfrmBancos;

implementation
 uses UDatModCheques, uglobal;
{$R *.DFM}

procedure TfrmBancos.BitBtn4Click(Sender: TObject);
begin
  if dmcks.qrybancosdet.state in  [dsEdit,dsInsert] then
  begin
    if dmcks.qrybancosdet.state in  [dsInsert] then
    begin
      dmcks.qrybancosdetCODIGO.Value := dmcks.qrybancosCODIGO.Value;
      dmcks.qrybancosdetSERIE.Value  := FsqlMaxNumero('BANCOS_DET','SERIE');
    end;
    dmcks.qrybancosdet.Post;
    dmcks.qrybancosdet.ApplyUpdates;
    if not dmcks.qrybancosdet.Transaction.InTransaction then
    dmcks.qrybancosdet.Transaction.starttransaction;
    try
      dmcks.qrybancosdet.Transaction.CommitRetaining;
    except
    dmcks.qrybancosdet.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmBancos.BitBtn5Click(Sender: TObject);
begin
  if dmcks.qrybancosdet.state in [dsEdit,dsInsert]  then
  begin
    dmcks.qrybancosdet.cancel;
  end;
end;

procedure TfrmBancos.btnCancelarClick(Sender: TObject);
begin
  if dmcks.qrybancos.state in [dsEdit,dsInsert]  then
  begin
    dmcks.qrybancos.cancel;
  end;
end;

procedure TfrmBancos.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmcks.qrybancos.state = dsbrowse then
  begin
    dmcks.qrybancos.close;
    dmcks.qrybancos.open;
  end;
end;

procedure TfrmBancos.btnInsertarClick(Sender: TObject);
begin
  if dmcks.qrybancos.state = dsBrowse then
  begin
    dmcks.qrybancos.insert;
    DBEdit1.setfocus;
    DBEdit1.SelectAll;
  end;
end;

procedure TfrmBancos.btnInsertarTarifaClick(Sender: TObject);
begin
  if dmcks.qrybancosdet.state = dsBrowse then
  begin
    dmcks.qrybancosdet.Insert;
    dmcks.qrybancosdetMONEDA.Value := '1';
    dmcks.qrybancosdetSTATUS.Value:='A';
    dmcks.qrybancosdetFECHA_APERTURA.Value:=ExtraerFecha(Now);
    dmcks.qrybancosdetCODIGO.Value := dmcks.qrybancosCODIGO.Value;
  end;
end;

procedure TfrmBancos.btnModificarClick(Sender: TObject);
begin
  if dmcks.qrybancos.state = dsBrowse then
  begin
    dmcks.qrybancos.Edit;
  end;
end;

procedure TfrmBancos.btnmodtarifaClick(Sender: TObject);
begin
  if dmcks.qrybancosdet.State = dsBrowse then
  begin
    dmcks.qrybancosdet.Edit;
  end;
end;

procedure TfrmBancos.btnSalvarClick(Sender: TObject);
begin
  if dmcks.qrybancos.State In  [dsEdit, dsInsert] then
  begin
    if dmcks.qrybancos.State = dsInsert then
     dmcks.qrybancosCODIGO.Value:= FsqlMaxNumero('BANCOS','codigo');
    dmcks.qrybancos.Post;
    dmcks.qrybancos.ApplyUpdates;
    if Not dmcks.qrybancos.Transaction.InTransaction then
    dmcks.qrybancos.Transaction.starttransaction;
    try
      dmcks.qrybancos.Transaction.CommitRetaining;
    except
    dmcks.qrybancos.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmBancos.FormCreate(Sender: TObject);
begin
  dmcks.qrybancos.Close;
  dmcks.qrybancos.Open;
  dmcks.tblTipoctabanco.close;
  dmcks.tblTipoctabanco.open;
end;

end.

