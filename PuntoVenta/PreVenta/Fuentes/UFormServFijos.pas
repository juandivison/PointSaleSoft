unit UFormServFijos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, RXCtrls, RXDBCtrl, StdCtrls, Buttons, Grids, DBGrids, Mask,
  DBCtrls;

type
  TfrmServiciosReg = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
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
  frmServiciosReg: TfrmServiciosReg;

implementation
uses UDatModFactura, UGlobal;
{$R *.dfm}

procedure TfrmServiciosReg.BitBtn1Click(Sender: TObject);
begin
  if dmFactura.tblServProgIgualas.State = dsBrowse then
  begin
    dmFactura.tblServProgIgualas.Insert;
    //dmFactura.tblServProgIgualasSTATUS.Value := 'A';
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmServiciosReg.BitBtn2Click(Sender: TObject);
begin
  if dmFactura.tblServProgIgualas.State = dsBrowse then
  dmFactura.tblServProgIgualas.Edit;
end;

procedure TfrmServiciosReg.BitBtn3Click(Sender: TObject);
begin
  if dmFactura.tblServProgIgualas.State in [dsEdit, dsInsert] then
  dmFactura.tblServProgIgualas.cancel;
end;

procedure TfrmServiciosReg.BitBtn4Click(Sender: TObject);
begin
  if dmFactura.tblServProgIgualas.State in [dsEdit, dsInsert] then
  begin
    if dmFactura.tblServProgIgualas.State = dsInsert then
    begin
      dmFactura.tblServProgIgualasCODIGO.Value := FsqlMaxNumero('SERV_PROG_IGUALAS','Codigo');
      if dmFactura.tblServProgIgualasCODIGO.IsNull Or (dmFactura.tblServProgIgualasCODIGO.Value = 0) then
      dmFactura.tblServProgIgualasCODIGO.Value := 1;
    end;
    dmFactura.tblServProgIgualas.Post;
    dmFactura.tblServProgIgualas.ApplyUpdates;
    if not dmFactura.tblServProgIgualas.Transaction.InTransaction then
    dmFactura.tblServProgIgualas.Transaction.StartTransaction;
    try
      dmFactura.tblServProgIgualas.Transaction.CommitRetaining;
    except
    dmFactura.tblServProgIgualas.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmServiciosReg.BitBtn5Click(Sender: TObject);
begin
  if dmFactura.tblServProgIgualas.State in [dsInactive, dsBrowse] then
  begin
    dmFactura.tblServProgIgualas.Close;
    dmFactura.tblServProgIgualas.Open;
  end;
end;

procedure TfrmServiciosReg.FormCreate(Sender: TObject);
begin
  dmFactura.tblServProgIgualas.Close;
  dmFactura.tblServProgIgualas.Open;
end;

end.
