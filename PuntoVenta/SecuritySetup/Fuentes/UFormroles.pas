unit UFormroles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  RXCtrls, WinSkinData;

type
  TfrmRoles = class(TForm)
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn1: TBitBtn;
    SpeedButton4: TSpeedButton;
    SkinData1: TSkinData;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRoles: TfrmRoles;

implementation

uses UDatModUsuarios;

{$R *.dfm}

procedure TfrmRoles.BitBtn10Click(Sender: TObject);
begin
  dmusuarios.tblRoles.prior;
end;

procedure TfrmRoles.BitBtn11Click(Sender: TObject);
begin
  dmusuarios.tblRoles.next;
end;

procedure TfrmRoles.BitBtn12Click(Sender: TObject);
begin
  dmusuarios.tblRoles.Last;
end;

procedure TfrmRoles.BitBtn9Click(Sender: TObject);
begin
  dmusuarios.tblRoles.first;
end;

procedure TfrmRoles.SpeedButton1Click(Sender: TObject);
begin
  if dmusuarios.tblRoles.State in [dsinsert, dsEdit] then
  begin
    //dmusuarios.tblRolesid.Value:= FsqlMaxNumero('PROCESOS','PROCESOID');
    dmusuarios.tblRoles.Post;
    dmusuarios.tblRoles.ApplyUpdates;
    if not dmusuarios.tblRoles.Transaction.InTransaction then
    dmusuarios.tblRoles.Transaction.StartTransaction;
    try
      dmusuarios.tblRoles.Transaction.CommitRetaining;
    except
    dmusuarios.tblRoles.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmRoles.SpeedButton2Click(Sender: TObject);
begin
  if dmusuarios.tblRoles.State = dsBrowse then
  begin
    dmusuarios.tblRoles.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmRoles.SpeedButton3Click(Sender: TObject);
begin
  if dmusuarios.tblRoles.State in [dsinsert, dsEdit] then
  begin
    dmusuarios.tblRoles.Cancel;
  end;
end;

procedure TfrmRoles.FormCreate(Sender: TObject);
begin
  dmusuarios.tblRoles.Close;
  dmusuarios.tblRoles.Open;
end;

procedure TfrmRoles.BitBtn1Click(Sender: TObject);
begin
  dmusuarios.tblRoles.Close;
  dmusuarios.tblRoles.Open;
end;

procedure TfrmRoles.SpeedButton4Click(Sender: TObject);
begin
  if dmusuarios.tblRoles.State = dsBrowse then
  dmusuarios.tblRoles.Edit;
end;

end.
