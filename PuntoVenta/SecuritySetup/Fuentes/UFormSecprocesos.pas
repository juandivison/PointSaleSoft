unit UFormSecprocesos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, Buttons, Grids, DBGrids, RXDBCtrl, StdCtrls, Mask, DBCtrls,
  RXCtrls, WinSkinData;

type
  TfrmProcesos = class(TForm)
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn1: TBitBtn;
    SpeedButton4: TSpeedButton;
    SkinData1: TSkinData;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcesos: TfrmProcesos;

implementation

uses UDatModUsuarios, uglobal;

{$R *.dfm}

procedure TfrmProcesos.SpeedButton2Click(Sender: TObject);
begin
  if dmUsuarios.tblProcesos.State = dsBrowse then
  begin
    dmUsuarios.tblProcesos.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmProcesos.SpeedButton3Click(Sender: TObject);
begin
  if dmUsuarios.tblProcesos.State in [dsinsert, dsEdit] then
  begin
    dmUsuarios.tblProcesos.Cancel;
  end;
end;

procedure TfrmProcesos.SpeedButton1Click(Sender: TObject);
begin
  if dmUsuarios.tblProcesos.State in [dsinsert, dsEdit] then
  begin
    dmUsuarios.tblProcesosPROCESOID.Value:= FsqlMaxNumero('PROCESOS','PROCESOID');
    dmUsuarios.tblProcesos.Post;
    dmUsuarios.tblProcesos.ApplyUpdates;
    if not dmUsuarios.tblProcesos.Transaction.InTransaction then
    dmUsuarios.tblProcesos.Transaction.StartTransaction;
    try
      dmUsuarios.tblProcesos.Transaction.CommitRetaining;
    except
    dmUsuarios.tblProcesos.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmProcesos.BitBtn9Click(Sender: TObject);
begin
  dmUsuarios.tblProcesos.first;
end;

procedure TfrmProcesos.BitBtn10Click(Sender: TObject);
begin
  dmUsuarios.tblProcesos.prior;
end;

procedure TfrmProcesos.BitBtn11Click(Sender: TObject);
begin
  dmUsuarios.tblProcesos.next;
end;

procedure TfrmProcesos.BitBtn12Click(Sender: TObject);
begin
  dmUsuarios.tblProcesos.Last;
end;

procedure TfrmProcesos.FormCreate(Sender: TObject);
begin
  dmUsuarios.tblProcesos.close;
  dmUsuarios.tblProcesos.open;
end;

procedure TfrmProcesos.BitBtn1Click(Sender: TObject);
begin
  dmusuarios.tblProcesos.close;
  dmusuarios.tblProcesos.Open;
end;

procedure TfrmProcesos.SpeedButton4Click(Sender: TObject);
begin
  if dmusuarios.tblProcesos.State = dsbrowse then
  dmusuarios.tblProcesos.Edit;
end;

end.
