unit UFormCentroDeCostos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, RXDBCtrl, StdCtrls, Buttons, Grids, DBGrids, Mask,
  db, DBCtrls;

type
  TfrmCentroDeCostos = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBStatusLabel2: TDBStatusLabel;
    DBGrid1: TDBGrid;
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
  frmCentroDeCostos: TfrmCentroDeCostos;

implementation

uses UDatModRegOpeDiaria, uglobal;

{$R *.dfm}

procedure TfrmCentroDeCostos.BitBtn1Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblCentroDeCostos.State in [dsBrowse] then
  begin
    dtmTransOpeDiaria.tblCentroDeCostos.Insert;
    dtmTransOpeDiaria.tblCentroDeCostosCODIGO.Value:= FsqlMaxNumero('centro_costo','codigo');
    if dtmTransOpeDiaria.tblCentroDeCostosCODIGO.isnull then
    dtmTransOpeDiaria.tblCentroDeCostosCODIGO.Value:= 1; 
    dbedit2.setfocus;
  end;
end;

procedure TfrmCentroDeCostos.BitBtn2Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblCentroDeCostos.State in [dsBrowse] then
  dtmTransOpeDiaria.tblCentroDeCostos.Edit;
end;

procedure TfrmCentroDeCostos.BitBtn3Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblCentroDeCostos.State in [dsInsert, dsEdit] then
  dtmTransOpeDiaria.tblCentroDeCostos.Cancel;
end;

procedure TfrmCentroDeCostos.BitBtn4Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblCentroDeCostos.State in [dsInsert, dsEdit] then
  begin
    dtmTransOpeDiaria.tblCentroDeCostos.Post;
    dtmTransOpeDiaria.tblCentroDeCostos.ApplyUpdates;
    try
      dtmTransOpeDiaria.tblCentroDeCostos.Transaction.CommitRetaining;
    except
        dtmTransOpeDiaria.tblCentroDeCostos.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCentroDeCostos.BitBtn5Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblCentroDeCostos.State in [dsBrowse, dsInactive] then
  begin
    dtmTransOpeDiaria.tblCentroDeCostos.Close;
    dtmTransOpeDiaria.tblCentroDeCostos.Open;
  end;
end;

procedure TfrmCentroDeCostos.FormCreate(Sender: TObject);
begin
  dtmTransOpeDiaria.tblCentroDeCostos.Close;
  dtmTransOpeDiaria.tblCentroDeCostos.Open;
end;

end.
