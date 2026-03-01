unit UFormProyecto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, rxToolEdit, RXDBCtrl, StdCtrls, DBCtrls, Buttons, Grids, DBGrids,
  Mask, RXCtrls, WinSkinData;

type
  TfrmProyecto = class(TForm)
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
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    btnRefrescar: TBitBtn;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProyecto: TfrmProyecto;

implementation
uses UDatModNomina, Uglobal;
{$R *.dfm}

procedure TfrmProyecto.BitBtn10Click(Sender: TObject);
begin
  dmNomina.tblProyectos.Prior;
end;

procedure TfrmProyecto.BitBtn11Click(Sender: TObject);
begin
  dmNomina.tblProyectos.Next;
end;

procedure TfrmProyecto.BitBtn12Click(Sender: TObject);
begin
  dmNomina.tblProyectos.Last;
end;

procedure TfrmProyecto.BitBtn9Click(Sender: TObject);
begin
  dmNomina.tblProyectos.First;
end;

procedure TfrmProyecto.SpeedButton1Click(Sender: TObject);
begin
  if dmNomina.tblProyectos.State In [dsInsert, dsEdit] then
  begin
    if dmNomina.tblProyectos.State In [dsinsert] then
    dmNomina.tblProyectosCODIGO.Value:= FsqlMaxNumero('Proyectos','CODIGO');
    if dmNomina.tblProyectosCODIGO.IsNull Or
    (dmNomina.tblProyectosCODIGO.Value = 0) then
    dmNomina.tblProyectosCODIGO.Value := 1;
    dmNomina.tblProyectos.Post;
    dmNomina.tblProyectos.ApplyUpdates;
    if Not dmNomina.tblProyectos.Transaction.InTransaction then
    dmNomina.tblProyectos.Transaction.StartTransaction;
    try
      dmNomina.tblProyectos.Transaction.CommitRetaining;
    except
    dmNomina.tblProyectos.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmProyecto.SpeedButton2Click(Sender: TObject);
begin
  if dmNomina.tblProyectos.State = dsBrowse then
  begin
    dmNomina.tblProyectos.Insert;
    dmNomina.tblProyectosSTATUS.Value       := 'A';
    dmNomina.tblProyectosFECHA_INICIAL.Value:= ExtraerFecha(GlbFechaTrnDiaria);
    dmNomina.tblProyectosFECHA_FINAL.Value  := ExtraerFecha(GlbFechaTrnDiaria+30);
    dmNomina.tblProyectosIN_POR.Value   := StrUserName;
    dmNomina.tblProyectosFECHA_IN.Value := Now;
  end;
end;

procedure TfrmProyecto.SpeedButton3Click(Sender: TObject);
begin
  if dmNomina.tblProyectos.State in [dsinsert, dsEdit] then
  begin
    dmNomina.tblProyectos.Cancel;
  end;
end;

procedure TfrmProyecto.btnRefrescarClick(Sender: TObject);
begin
 dmNomina.tblProyectos.close;
 dmNomina.tblProyectos.open;
end;

procedure TfrmProyecto.FormCreate(Sender: TObject);
begin
  dmNomina.tblProyectos.Close;
  dmNomina.tblProyectos.Open;
end;

end.
