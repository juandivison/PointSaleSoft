unit UFormMetasXVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, Mask,
  DB, DBCtrls, RxCtrls, RxToolEdit, RxLookup;

type
  TfrmMetasXVendedor = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    Label4: TLabel;
    Label5: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    Label6: TLabel;
    SkinData1: TSkinData;
    BitBtn2: TBitBtn;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBDateEdit2Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMetasXVendedor: TfrmMetasXVendedor;

implementation
    uses UDatModComisiones, UGlobal;

{$R *.dfm}

procedure TfrmMetasXVendedor.BitBtn10Click(Sender: TObject);
begin
  dmComision.tblMetasPorVendedor.Prior;
end;

procedure TfrmMetasXVendedor.BitBtn11Click(Sender: TObject);
begin
  dmComision.tblMetasPorVendedor.next;
end;

procedure TfrmMetasXVendedor.BitBtn12Click(Sender: TObject);
begin
  dmComision.tblMetasPorVendedor.Last;
end;

procedure TfrmMetasXVendedor.BitBtn9Click(Sender: TObject);
begin
  dmComision.tblMetasPorVendedor.First;
end;

procedure TfrmMetasXVendedor.SpeedButton1Click(Sender: TObject);
begin
  if dmComision.tblMetasPorVendedor.State in [dsinsert, dsEdit] then
  begin
    //dmComision.tblMetasPorVendedorIDTIPOVEH.Value:= FsqlMaxNumero('tipo_vehiculo','IDTIPOVEH');
    dmComision.tblMetasPorVendedor.Post;
    dmComision.tblMetasPorVendedor.ApplyUpdates;
    if not dmComision.tblMetasPorVendedor.Transaction.InTransaction then
    dmComision.tblMetasPorVendedor.Transaction.StartTransaction;
    try
      dmComision.tblMetasPorVendedor.Transaction.CommitRetaining;
    except
    dmComision.tblMetasPorVendedor.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmMetasXVendedor.SpeedButton2Click(Sender: TObject);
begin
  if dmComision.tblMetasPorVendedor.State = dsBrowse then
  begin
    dmComision.tblMetasPorVendedor.Insert;
    dmComision.tblMetasPorVendedorFECHAINI.Value:= GlbPrimerDiaMes(GlbFechaTrnDiaria);
    dmComision.tblMetasPorVendedorFECHAFin.Value:= GlbUltimoDiaMes(GlbFechaTrnDiaria);
    dmComision.tblMetasPorVendedorSTATUS.Value:='A';
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmMetasXVendedor.SpeedButton3Click(Sender: TObject);
begin
  if dmComision.tblMetasPorVendedor.State in [dsinsert, dsEdit] then
  begin
    dmComision.tblMetasPorVendedor.Cancel;
  end;
end;

procedure TfrmMetasXVendedor.BitBtn1Click(Sender: TObject);
begin
  dmComision.tblMetasPorVendedor.Close;
  dmComision.tblMetasPorVendedor.Open;
  dmComision.qryEmpleados.Close;
  dmComision.qryEmpleados.Open;
end;

procedure TfrmMetasXVendedor.FormCreate(Sender: TObject);
begin
  dmComision.qryEmpleados.Close;
  dmComision.qryEmpleados.Open;
  dmComision.tblMetasPorVendedor.Close;
  dmComision.tblMetasPorVendedor.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmComision.tblMetasPorVendedor.Open;  
end;

procedure TfrmMetasXVendedor.DBDateEdit2Change(Sender: TObject);
begin
  if dmComision.tblMetasPorVendedor.State in [dsEdit, dsInsert] then
  dmComision.tblMetasPorVendedorFECHAFin.Value:= GlbUltimoDiaMes(GlbFechaTrnDiaria);
end;

procedure TfrmMetasXVendedor.BitBtn2Click(Sender: TObject);
begin
  if dmComision.tblMetasPorVendedor.State in [dsBrowse] then
  dmComision.tblMetasPorVendedor.Edit;
end;

end.
