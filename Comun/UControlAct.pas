Unit UControlAct;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db,ExtCtrls, DBCtrls, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, rxToolEdit,
  Mask, RXCtrls, DBTables, WinSkinData;

type
  TfrmControlSistema = class(TForm)
    Panel1: TPanel;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    DBNavigator2: TDBNavigator;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    DBDateEdit2: TDBDateEdit;
    chkMaster: TCheckBox;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    BitBtn1: TBitBtn;
    dsqryControlDet: TDataSource;
    dsqryControl: TDataSource;
    SkinData1: TSkinData;
    procedure btnInsertarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkMasterClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControlSistema: TfrmControlSistema;

implementation
  uses  UGlobal, UDatModControl;
{$R *.DFM}

procedure TfrmControlSistema.btnInsertarClick(Sender: TObject);
begin
  if chkMaster.Checked = false then
  begin
    if dmcontrol.qrycontrol.state = dsbrowse then
    dmcontrol.qrycontrol.insert;
    dmcontrol.qryControlFECHA_In.value := now;
    dmcontrol.qryControlIN_POR.value := strusername;
    dbedit1.SetFocus;
    dbedit1.SelectAll;
  end else
  begin
    if dmcontrol.qrycontroldet.state = dsbrowse then 
    dmcontrol.qrycontroldet.insert;
    dmcontrol.qryControldetFECHA_in.value := Now;
    dmcontrol.qryControldetin_POR.value   := Strusername;

    dmcontrol.qryControlDetSISTEMA.Value:=dmcontrol.qryControlSISTEMA.Value;
    dmcontrol.qryControlDetSUB_SISTEMA.Value:=dmcontrol.qryControlSUB_SISTEMA.value;
    dmcontrol.qryControlDetCOD_CIA.Value := dmcontrol.qryControlCOD_CIA.Value;
    dmcontrol.qryControlDetSTATUS.value  := 'A';
    dbedit4.SetFocus;
    dbedit4.SelectAll;
  end;
end;

procedure TfrmControlSistema.btnSalvarClick(Sender: TObject);
begin
  if chkMaster.Checked = false then
  begin
    if dmcontrol.qrycontrol.State in [dsEdit,dsInsert] then
    begin
      dmcontrol.qrycontrol.post;
      dmcontrol.qrycontrol.ApplyUpdates;
    end;    
  end else
  begin
    if dmcontrol.qrycontroldet.State in [dsEdit,dsInsert] then
    begin
      dmcontrol.qrycontroldet.post;
      dmcontrol.qrycontroldet.ApplyUpdates;
    end;
  end;
  if not dmcontrol.qryControlDet.Transaction.InTransaction then
  dmcontrol.qryControlDet.Transaction.StartTransaction;
  try
    dmcontrol.qryControlDet.Transaction.CommitRetaining;
  except
  dmcontrol.qryControlDet.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmControlSistema.btnModificarClick(Sender: TObject);
begin
  if (chkMaster.Checked = false) then
  begin
    if dmcontrol.qrycontrol.state = dsbrowse then 
    dmcontrol.qrycontrol.edit;
    dmcontrol.qryControlFECHA_MOD.value := now;
    dmcontrol.qryControlMOD_POR.value := strusername;
  end else
  begin
    if dmcontrol.qrycontroldet.state = dsbrowse then
    dmcontrol.qrycontroldet.edit;
    dmcontrol.qryControldetFECHA_MOD.Value := now;
    dmcontrol.qryControldetMOD_POR.Value := strusername;
  end;
end;

procedure TfrmControlSistema.btnCancelarClick(Sender: TObject);
begin
  if (chkMaster.Checked = false )then
  begin
    if dmcontrol.qrycontrol.state = dsbrowse then
    begin
      dmcontrol.qrycontrol.edit;
      dmcontrol.qrycontrolstatus.value:='C';
      btnsalvarclick(self);
    end else dmcontrol.qrycontrol.cancel;
  end else
  begin
    if dmcontrol.qrycontroldet.state = dsbrowse then
    begin
      dmcontrol.qrycontroldet.edit;
      dmcontrol.qrycontroldetstatus.value:='C';
      btnsalvarclick(self);    
    end else dmcontrol.qrycontroldet.cancel;
  end;
end;

procedure TfrmControlSistema.btnCerarAbrirresClick(Sender: TObject);
begin
  if (dmcontrol.qrycontroldet.state = dsBrowse ) and
  (dmcontrol.qrycontrol.state = dsBrowse ) then
  begin
    dmcontrol.qrycontrol.close;
    dmcontrol.qrycontrol.open;    
  end;
end;

procedure TfrmControlSistema.FormCreate(Sender: TObject);
begin
  dmcontrol.qrycontrol.close;
  dmcontrol.qrycontrol.filtered:=false;
  dmcontrol.qrycontrol.open;
end;

procedure TfrmControlSistema.chkMasterClick(Sender: TObject);
begin
  if (dmcontrol.qryControl.State = dsbrowse) and (dmcontrol.qryControldet.State = dsbrowse) then
  begin
    if (chkmaster.Checked = false)then
    begin
      chkmaster.Caption:='Master';
      DBNavigator2.DataSource:=dsQryControl;
    end else
    begin
     DBNavigator2.DataSource:=dsqryControlDet;
     chkmaster.Caption:='Detalle';
    end;
  end else
  Begin
    MessageDlg('Tablas debe estar en modo browse',mtWarning,[mbok],0);
    chkmaster.checked:=false;
  end;
end;

procedure TfrmControlSistema.BitBtn1Click(Sender: TObject);
begin
   {qckRepSistControl:=TqckRepSistControl.create(nil);
   try
     qckRepSistControl.preview;
   finally
   qckRepSistControl.free;
   qckRepSistControl:=nil;
   end;}
end;

end.
