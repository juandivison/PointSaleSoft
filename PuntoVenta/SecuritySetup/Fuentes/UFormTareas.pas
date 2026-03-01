unit UFormTareas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  RXCtrls, RxLookup, ExtCtrls, WinSkinData;

type
  TfrmTarea = class(TForm)
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
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label1: TLabel;
    SpeedButton4: TSpeedButton;
    DBRadioGroup1: TDBRadioGroup;
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
  frmTarea: TfrmTarea;

implementation

uses UDatModUsuarios, uGlobal;

{$R *.dfm}

procedure TfrmTarea.BitBtn10Click(Sender: TObject);
begin
  dmusuarios.tblTareas.Prior;
end;

procedure TfrmTarea.BitBtn11Click(Sender: TObject);
begin
  dmusuarios.tblTareas.Next;
end;

procedure TfrmTarea.BitBtn12Click(Sender: TObject);
begin
  dmusuarios.tblTareas.Last;
end;

procedure TfrmTarea.BitBtn9Click(Sender: TObject);
begin
  dmusuarios.tblTareas.First;
end;

procedure TfrmTarea.SpeedButton1Click(Sender: TObject);
begin
  if dmusuarios.tblTareas.State in [dsinsert, dsEdit] then
  begin
    //dmusuarios.tblTareasIDTAREA.Value:= FsqlMaxNumero('TAREAS','');
    dmusuarios.tblTareas.Post;
    dmusuarios.tblTareas.ApplyUpdates;
    if Not dmusuarios.tblTareas.Transaction.InTransaction then
    dmusuarios.tblTareas.Transaction.StartTransaction;
    try
      dmusuarios.tblTareas.Transaction.CommitRetaining;
    except
    dmusuarios.tblTareas.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmTarea.SpeedButton2Click(Sender: TObject);
begin
  if dmusuarios.tblTareas.State = dsBrowse then
  begin
    dmusuarios.tblTareas.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmTarea.SpeedButton3Click(Sender: TObject);
begin
  if dmusuarios.tblTareas.State in [dsinsert, dsEdit] then
  begin
    dmusuarios.tblTareas.Cancel;
  end;
end;

procedure TfrmTarea.FormCreate(Sender: TObject);
begin
  dmUsuarios.qryProcesos.Close;
  dmUsuarios.qryProcesos.Open;
  dmusuarios.tblTareas.close;
  dmusuarios.tblTareas.Open;
end;

procedure TfrmTarea.BitBtn1Click(Sender: TObject);
begin
  dmusuarios.tblTareas.Close;
  dmusuarios.tblTareas.Open;
end;

procedure TfrmTarea.SpeedButton4Click(Sender: TObject);
begin
  if dmusuarios.tblTareas.State = dsBrowse then
  dmusuarios.tblTareas.Edit;
end;

end.
