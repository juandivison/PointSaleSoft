unit UFormProductosServicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, RXCtrls,
  RXDBCtrl;

type
  TfrmProductosServ = class(TForm)
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
    DBStatusLabel2: TDBStatusLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProductosServ: TfrmProductosServ;

implementation

uses UDatModRegOpeDiaria;

{$R *.dfm}

procedure TfrmProductosServ.FormCreate(Sender: TObject);
begin
  dtmTransOpeDiaria.tblProductosServicios.Close;
  dtmTransOpeDiaria.tblProductosServicios.Open;
end;

procedure TfrmProductosServ.BitBtn1Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblProductosServicios.State in [dsBrowse] then
  begin
    dtmTransOpeDiaria.tblProductosServicios.Insert;
    dbedit2.setfocus;
  end;
end;

procedure TfrmProductosServ.BitBtn2Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblProductosServicios.State in [dsBrowse] then
  dtmTransOpeDiaria.tblProductosServicios.Edit;
end;

procedure TfrmProductosServ.BitBtn3Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblProductosServicios.State in [dsInsert, dsEdit] then
  dtmTransOpeDiaria.tblProductosServicios.Cancel;
end;

procedure TfrmProductosServ.BitBtn4Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblProductosServicios.State in [dsInsert, dsEdit] then
  begin
    dtmTransOpeDiaria.tblProductosServicios.Post;
    dtmTransOpeDiaria.tblProductosServicios.ApplyUpdates;
    try
      dtmTransOpeDiaria.tblProductosServicios.Transaction.CommitRetaining;
    except
        dtmTransOpeDiaria.tblProductosServicios.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmProductosServ.BitBtn5Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblProductosServicios.State in [dsBrowse, dsInactive] then
  begin
    dtmTransOpeDiaria.tblProductosServicios.Close;
    dtmTransOpeDiaria.tblProductosServicios.Open;
  end;
end;

end.
