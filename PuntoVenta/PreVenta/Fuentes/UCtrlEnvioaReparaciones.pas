unit UCtrlEnvioaReparaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, ExtCtrls, Grids, DBGrids, DBCtrls, StdCtrls, Buttons,
  db, Mask, rxToolEdit, RXDBCtrl, RXCtrls, ComCtrls, WinSkinData;

type
  TfrmReparaciones = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBStatusLabel1: TDBStatusLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    DBDateEdit1: TDBDateEdit;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnInsertar: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    TabSheet2: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label8: TLabel;
    DBStatusLabel3: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    SkinData1: TSkinData;
    DBMemo1: TDBMemo;
    Shape1: TShape;
    BitBtn8: TBitBtn;
    BitBtn13: TBitBtn;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure RxDBLookupCombo3Change(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
  private
    { Private declarations }
    procedure Imprimir(tipo : smallint);
  public
    { Public declarations }
  end;

var
  frmReparaciones: TfrmReparaciones;

implementation

uses UDatModInventario, qckRepReparacionRecibo;

{$R *.dfm}

procedure TfrmReparaciones.BitBtn10Click(Sender: TObject);
begin
  dmInventario.tblReparacionesMaster.Prior;
end;

procedure TfrmReparaciones.BitBtn11Click(Sender: TObject);
begin
  dmInventario.tblReparacionesMaster.Next;
end;

procedure TfrmReparaciones.BitBtn12Click(Sender: TObject);
begin
  dmInventario.tblReparacionesMaster.Last;
end;

procedure TfrmReparaciones.BitBtn9Click(Sender: TObject);
begin
  dmInventario.tblReparacionesMaster.First;
end;

procedure TfrmReparaciones.btnCancelarClick(Sender: TObject);
begin
  if dmInventario.tblReparacionesMaster.State in [dsEdit, dsInsert] then
  dmInventario.tblReparacionesMaster.Cancel;
end;

procedure TfrmReparaciones.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmInventario.tblReparacionesMaster.State In [dsBrowse, dsInactive] then
  begin
    dmInventario.tblReparacionesMaster.Close;
    dmInventario.tblReparacionesMaster.Open;
  end;
end;

procedure TfrmReparaciones.btnInsertarClick(Sender: TObject);
begin
  if dmInventario.tblReparacionesMaster.State = dsBrowse then
  begin
    dmInventario.tblReparacionesMaster.Insert;
    dmInventario.tblReparacionesMasterSTATUS.Value  := 'A';
    //dmInventario.tblReparacionesMasterFECHA_IN.Value:= Now;
    //dmInventario.tblReparacionesMasterIN_POR.Value  := StrUserName;
    //DBLookupComboBox3.SetFocus;
    BitBtn1.Enabled:=true;
  end;
end;

procedure TfrmReparaciones.btnModificarClick(Sender: TObject);
begin
  if dmInventario.tblReparacionesMaster.State = dsBrowse then
  dmInventario.tblReparacionesMaster.Edit;
end;

procedure TfrmReparaciones.btnSalvarClick(Sender: TObject);
begin
  if dmInventario.tblReparacionesMaster.State in [dsEdit, dsInsert] then
  begin
    dmInventario.tblReparacionesMaster.Post;
    dmInventario.tblReparacionesMaster.ApplyUpdates;
    if not dmInventario.tblReparacionesMaster.Transaction.InTransaction then
    dmInventario.tblReparacionesMaster.Transaction.StartTransaction;
    try
      dmInventario.tblReparacionesMaster.Transaction.CommitRetaining;
    except
    dmInventario.tblReparacionesMaster.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmReparaciones.BitBtn1Click(Sender: TObject);
begin
  if dmInventario.tblReparacionesDet.State = dsBrowse then
  begin
    dmInventario.tblReparacionesDet.Insert;
    Edit1.enabled:=true;
{    dmInventario.tblReparacionesDetCODIGO.Value := FsqlMaxNumero('Servicio','Codigo');
    if dmInventario.tblReparacionesDetCODIGO.IsNull Or (dmInventario.tblReparacionesDetCODIGO.Value = 0) then
    dmInventario.tblReparacionesDetCODIGO.Value := 0;}
    dmInventario.tblReparacionesDetSTATUS.Value := 'A';
    DBDateEdit1.SetFocus;
  end;
end;

procedure TfrmReparaciones.BitBtn2Click(Sender: TObject);
begin
  if dmInventario.tblReparacionesDet.State = dsBrowse then
  dmInventario.tblReparacionesDet.Edit;
end;

procedure TfrmReparaciones.BitBtn4Click(Sender: TObject);
begin
  if dmInventario.tblReparacionesDet.State in [dsEdit, dsInsert] then
  dmInventario.tblReparacionesDet.cancel;
end;

procedure TfrmReparaciones.BitBtn5Click(Sender: TObject);
begin
  if dmInventario.tblReparacionesMaster.State in [dsEdit, dsInsert] then
  begin
    btnSalvarClick(Self);
  end;

  if dmInventario.tblReparacionesDet.State in [dsEdit, dsInsert] then
  begin
    if dmInventario.tblReparacionesDet.State = dsInsert then
    begin
      dmInventario.tblReparacionesDetNUMERO.Value:=
      dmInventario.tblReparacionesMasterNUMERO.Value;
    end;
    dmInventario.tblReparacionesDet.Post;
    dmInventario.tblReparacionesDet.ApplyUpdates;
    if not dmInventario.tblReparacionesDet.Transaction.InTransaction then
    dmInventario.tblReparacionesDet.Transaction.StartTransaction;
    try
      dmInventario.tblReparacionesDet.Transaction.CommitRetaining;
    except
    dmInventario.tblReparacionesDet.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmReparaciones.BitBtn6Click(Sender: TObject);
begin
  if dmInventario.tblReparacionesDet.State in [dsInactive, dsBrowse] then
  begin
    dmInventario.tblReparacionesDet.Close;
    dmInventario.tblReparacionesDet.Open;
  end;
end;

procedure TfrmReparaciones.FormCreate(Sender: TObject);
begin
  dmInventario.tblTipoTrn.Close;
  dmInventario.tblTipoTrn.Open;
  dmInventario.qryProveedores.Close;
  dmInventario.qryProveedores.Open;
  dmInventario.tblReparacionesMaster.Close;
  dmInventario.tblReparacionesMaster.Open;
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.Open;
end;

procedure TfrmReparaciones.Edit1Exit(Sender: TObject);
begin
  if (edit1.Text = '') then exit;
  if Not dmInventario.tblInventarioProd.Locate('codigo', strToInt(edit1.Text),[]) then
  MessageDlg('Codigo no encontrado, verifique', mtInformation, [mbOK], 0)
  else
  begin
    if dmInventario.tblReparacionesDet.state in [dsedit, dsinsert] then
    dmInventario.tblReparacionesDetCOD_PRODUCTO.Value:= StrToInt(edit1.Text);
  end;
end;

procedure TfrmReparaciones.RxDBLookupCombo3Change(Sender: TObject);
begin
  Edit1.Text := dmInventario.tblInventarioProdCODIGO.AsString;
end;

procedure TfrmReparaciones.BitBtn8Click(Sender: TObject);
begin
  Imprimir(0);
end;

procedure TfrmReparaciones.Imprimir(tipo: smallint);
begin                                                    //tipo = 1 = re-imprimir
  if (not dmInventario.tblReparacionesMasterNUMERO.IsNull) And (tipo = 0) then
  begin
    dmInventario.qryRepRepMaster.Close;
    dmInventario.qryRepRepMaster.Params[0].Value :=
    dmInventario.tblReparacionesMasterNUMERO.Value;
    dmInventario.qryRepRepMaster.Open;
  end else
  begin
    dmInventario.qryRepRepMaster.Close;
    dmInventario.qryRepRepMaster.Params[0].Value :=
    StrToInt(Inputbox('Re-imprimir recibo reparaciones','Entre numero',''));
    dmInventario.qryRepRepMaster.Open;
  end;
  qckReciboReparacion:=TqckReciboReparacion.create(nil);
  try
  qckReciboReparacion.Preview;
  finally
  qckReciboReparacion.free;
  qckReciboReparacion:=nil;
  end;
end;

procedure TfrmReparaciones.BitBtn13Click(Sender: TObject);
begin
  Imprimir(1);
end;

end.
