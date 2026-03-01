unit UFormRegPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, RXCtrls, ExtCtrls,
  ToolEdit, RxLookup, Mask, DBCtrls, WinSkinData;

type
  TfrmProcPlanFunerario = class(TForm)
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
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    DBDateEdit1: TDBDateEdit;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Shape1: TShape;
    SpeedButton7: TSpeedButton;
    DBStatusLabel2: TDBStatusLabel;
    Label14: TLabel;
    DBEdit3: TDBEdit;
    Label15: TLabel;
    DBEdit4: TDBEdit;
    Label16: TLabel;
    DBEdit13: TDBEdit;
    Label18: TLabel;
    DBEdit14: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBDateEdit4: TDBDateEdit;
    DBDateEdit5: TDBDateEdit;
    DBDateEdit6: TDBDateEdit;
    Label12: TLabel;
    Label19: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label17: TLabel;
    lblCancelado: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label13: TLabel;
    Label20: TLabel;
    DBText1: TDBText;
    SpeedButton8: TSpeedButton;
    SkinData1: TSkinData;
    Label5: TLabel;
    DBText2: TDBText;
    Label6: TLabel;
    Label21: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label22: TLabel;
    DBText3: TDBText;
    Label23: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    RxDBLookupCombo5: TRxDBLookupCombo;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Label24: TLabel;

    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBEdit7Change(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure DBDateEdit1Change(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
  private
    { Private declarations }
    procedure procBuscaTarifa;
  public
    { Public declarations }
  end;

var
  frmProcPlanFunerario: TfrmProcPlanFunerario;

implementation

uses UDatmodDatosGenerales, UDatModUsuarios, Uglobal, UDatModFactura;

{$R *.dfm}

procedure TfrmProcPlanFunerario.BitBtn10Click(Sender: TObject);
begin
  dmDatos.tblPlanFunerario.prior;
end;

procedure TfrmProcPlanFunerario.BitBtn11Click(Sender: TObject);
begin
  dmDatos.tblPlanFunerario.next;
end;

procedure TfrmProcPlanFunerario.BitBtn12Click(Sender: TObject);
begin
  dmDatos.tblPlanFunerario.Last;
end;

procedure TfrmProcPlanFunerario.BitBtn9Click(Sender: TObject);
begin
  dmDatos.tblPlanFunerario.First;
end;

procedure TfrmProcPlanFunerario.SpeedButton1Click(Sender: TObject);
begin
  if dmDatos.tblPlanFunerario.State in [dsInsert, dsEdit] then
  begin
    //dmDatos.tblPlanFunerarioid.Value:= FsqlMaxNumero('SEC_PROCESOS','ID');
    if dmDatos.tblPlanFunerarioCODIGO_CTE.IsNull then
    begin
      MessageDlg('Debe indicar cliente',mtError,[mbok],0);
      Exit;
    end;
    dmDatos.tblPlanFunerario.Post;
    dmDatos.tblPlanFunerario.ApplyUpdates;
    if not dmDatos.tblPlanFunerario.Transaction.InTransaction then
    dmDatos.tblPlanFunerario.Transaction.StartTransaction;
    try
      dmDatos.tblPlanFunerario.Transaction.CommitRetaining;
    except
    dmDatos.tblPlanFunerario.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmProcPlanFunerario.SpeedButton2Click(Sender: TObject);
begin
  if dmDatos.tblPlanFunerario.State = dsBrowse then
  begin
    dmDatos.tblPlanFunerario.Insert;
    dmDatos.tblPlanFunerarioSTATUS.Value:='A';
    dmDatos.tblPlanFunerarioFECHA_APERTURA.Value:=ExtraerFecha(Now);
    dmDatos.tblPlanFunerarioFECHA_IN.Value:= Now;
    dmDatos.tblPlanFunerarioINS_POR.Value:= StruserName;
    dmDatos.tblPlanFunerarioCOD_UDUARIO.Value:= VarUsuarioGlb;
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmProcPlanFunerario.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.tblPlanFunerario.State in [dsinsert, dsEdit] then
  begin
    dmDatos.tblPlanFunerario.Cancel;
  end else
  begin
    if MessageDlg('Cancelar plan?', mtinformation,[mbyes,mbno],0)=mryes then
    begin
    if dmDatos.tblPlanFunerarioDetSTATUS.Value = 'A' then
    begin
      dmDatos.tblPlanFunerarioDet.Edit;
      dmDatos.tblPlanFunerarioDetSTATUS.Value:='C';
      SpeedButton6Click(Self);
    end;
    end;
  end;
end;

procedure TfrmProcPlanFunerario.FormCreate(Sender: TObject);
begin
  dmdatos.qryinventario.Close;
  dmdatos.qryinventario.Open;
  dmDatos.qryClientes.Close;
  dmDatos.qryClientes.Open;
  dmDatos.tblTipoPlan.Close;
  dmDatos.tblTipoPlan.Open;
  dmDatos.tblRelacion.Close;
  dmDatos.tblRelacion.Open;
  dmDatos.tblPlanFunerario.Close;
  dmDatos.tblPlanFunerario.Open;
  dmFactura.tblTipoCF.Close;
  dmFactura.tblTipoCF.Open;
  dmDatos.qryEmpleados.Close;
  dmDatos.qryEmpleados.Open;
end;

procedure TfrmProcPlanFunerario.SpeedButton7Click(Sender: TObject);
begin
  dmDatos.tblPlanFunerario.Close;
  dmDatos.tblPlanFunerario.Open;
end;

procedure TfrmProcPlanFunerario.SpeedButton4Click(Sender: TObject);
begin
  if dmDatos.tblPlanFunerarioDet.State = dsBrowse then
  begin
    dmDatos.tblPlanFunerarioDet.Insert;
    dmDatos.tblPlanFunerarioDetID_PLAN.Value:=dmDatos.tblPlanFunerarioID_PLAN.Value;
    dmDatos.tblPlanFunerarioDetSTATUS.Value:='A';
    DBEdit3.SetFocus;
  end;
end;

procedure TfrmProcPlanFunerario.DBEdit7Change(Sender: TObject);
begin
  if (dmDatos.tblPlanFunerarioSTATUS.Value = 'C') then
  lblCancelado.Visible:=True
  else
    lblCancelado.Visible:=False;
end;

procedure TfrmProcPlanFunerario.SpeedButton5Click(Sender: TObject);
begin
  if dmDatos.tblPlanFunerarioDet.State = dsBrowse then
  begin
    if dmDatos.tblPlanFunerarioDetSTATUS.Value = 'A' then
    begin
      dmDatos.tblPlanFunerarioDet.Edit;
      dmDatos.tblPlanFunerarioDetSTATUS.Value:='C';
      SpeedButton6Click(Self);
    end;
  end;
end;

procedure TfrmProcPlanFunerario.SpeedButton6Click(Sender: TObject);
begin
  SpeedButton1Click(Self);
  if dmDatos.tblPlanFunerarioDet.State In [dsEdit, dsInsert] then
  begin
    dmDatos.tblPlanFunerarioDet.Post;
    dmDatos.tblPlanFunerarioDet.ApplyUpdates;
    if not dmDatos.tblPlanFunerarioDet.Transaction.InTransaction then
    dmDatos.tblPlanFunerarioDet.Transaction.StartTransaction;
    try
      dmDatos.tblPlanFunerarioDet.Transaction.CommitRetaining;
    except
    dmDatos.tblPlanFunerarioDet.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmProcPlanFunerario.RxDBLookupCombo4Exit(Sender: TObject);
begin
  if dmDatos.tblPlanFunerarioDet.state in [dsinsert, dsEdit] then
  if dmDatos.tblPlanFunerarioDetNIVEL.Value = 1 then //principal
  dmDatos.tblPlanFunerarioDetCEDULA.Value:= dmdatos.qryClientesCEDULA.Value;
end;

procedure TfrmProcPlanFunerario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmDatos.tblPlanFunerarioDet.state in [dsinsert, dsEdit] then
  begin
    MessageDlg('Transaccion pendiente, favor guardar o cancelar', mtError,[mbok],0);
    Canclose:=False;
  end;
  if dmDatos.tblPlanFunerario.state in [dsinsert, dsEdit] then
  begin
    MessageDlg('Transaccion pendiente, favor guardar o cancelar', mtError,[mbok],0);
    Canclose:=False;
  end;
end;

procedure TfrmProcPlanFunerario.DBDateEdit1Exit(Sender: TObject);
begin
  if dmDatos.tblPlanFunerario.State = dsInsert then
  dmDatos.tblPlanFunerarioFECHA_PAGO.Value:=dmDatos.tblPlanFunerarioFECHA_APERTURA.Value + 30;
  procBuscaTarifa;
end;

procedure TfrmProcPlanFunerario.SpeedButton8Click(Sender: TObject);
begin
  if MessageDlg('Desea eliminar definitivamente este plan?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
    if MessageDlg('Los dependientes de este plan serán eliminados, desea continuar?', mtWarning,[mbyes,mbno],0)=mryes then
    begin
      dmdatos.tblPlanFunerarioDet.First;
      While Not dmdatos.tblPlanFunerarioDet.Eof do
      begin
        dmdatos.tblPlanFunerarioDet.Delete;
      end;
      SpeedButton6Click(Self);
    end;
    if dmdatos.tblPlanFunerarioDet.RecordCount = 0 then
    begin
      if dmDatos.tblPlanFunerarioSTATUS.Value = 'A' then
      begin
        dmDatos.tblPlanFunerario.Delete;
        SpeedButton1Click(Self);
      end;
    end;
  end;
end;

procedure TfrmProcPlanFunerario.DBDateEdit1Change(Sender: TObject);
begin
  procBuscaTarifa;
end;


procedure TfrmProcPlanFunerario.procBuscaTarifa;
begin
  if dmdatos.ibsqlBuscaTarifaPlan.Open then
  dmdatos.ibsqlBuscaTarifaPlan.Close;
  dmdatos.ibsqlBuscaTarifaPlan.params[0].Value:=dmDatos.tblPlanFunerarioid_tipo_plan.Value;
  dmdatos.ibsqlBuscaTarifaPlan.params[1].Value:=dmDatos.tblPlanFunerarioFECHA_APERTURA.Value;
  dmdatos.ibsqlBuscaTarifaPlan.ExecQuery;
  if not dmdatos.ibsqlBuscaTarifaPlan.FieldByName('Precio').IsNull then
  Label21.Caption := dmdatos.ibsqlBuscaTarifaPlan.FieldByName('Precio').Value
end;

procedure TfrmProcPlanFunerario.RxDBLookupCombo1Change(Sender: TObject);
begin
  procBuscaTarifa;
end;

end.
