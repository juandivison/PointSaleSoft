unit UTarifaPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, DBCtrls, StdCtrls, Mask, ToolEdit, RXDBCtrl, RxLookup, Grids,
  DBGrids, Buttons, RXCtrls, WinSkinData;

type
  TfrmTarifaPlan = class(TForm)
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    Label8: TLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure DBDateEdit3Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTarifaPlan: TfrmTarifaPlan;

implementation

uses UDatmodDatosGenerales, UGlobal, UFormSelFecha;

{$R *.dfm}

procedure TfrmTarifaPlan.SpeedButton1Click(Sender: TObject);
begin
  if dmDatos.tblTarifaPlan.State in [dsInsert, dsEdit] then
  begin
    dmDatos.tblTarifaPlan.Post;
    dmDatos.tblTarifaPlan.ApplyUpdates;
    if not dmDatos.tblTarifaPlan.Transaction.InTransaction then
    dmDatos.tblTarifaPlan.Transaction.StartTransaction;
    try
      dmDatos.tblTarifaPlan.Transaction.CommitRetaining;
    except
    dmDatos.tblTarifaPlan.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmTarifaPlan.SpeedButton2Click(Sender: TObject);
begin
  if dmDatos.tblTarifaPlan.State = dsBrowse then
  begin
    dmDatos.tblTarifaPlan.Insert;
    dmDatos.tblTarifaPlanSTATUS.Value:='A';
    dmDatos.tblTarifaPlanFECHA_INICIAL.Value:=ExtraerFecha(Now);
    dmDatos.tblTarifaPlanFECHA_FINAL.Value:=ExtraerFecha(dmDatos.tblTarifaPlanFECHA_INICIAL.Value)+ 365;
    dmDatos.tblTarifaPlanFECHA_IN.Value:= Now;
    dmDatos.tblTarifaPlanINS_POR.Value:= StruserName;
    dmDatos.tblTarifaPlanCOD_UDUARIO.Value:= VarUsuarioGlb;
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmTarifaPlan.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.tblTarifaPlan.State in [dsinsert, dsEdit] then
  begin
    dmDatos.tblTarifaPlan.Cancel;
  end;
end;

procedure TfrmTarifaPlan.SpeedButton7Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
  frmSelFecha.FechaIni.DateTime:=ExtraerFecha(GlbFechaTrnDiaria);
  frmSelFecha.FechaFin.DateTime:=ExtraerFecha(GlbFechaTrnDiaria);
  frmSelFecha.FechaFin.Visible:=False;
  frmSelFecha.Label2.Visible:=False;
  frmSelFecha.Label1.Caption:='Fecha';
  if frmSelFecha.ShowModal = mrok then
  begin
    dmDatos.tblTarifaPlan.Close;
    dmDatos.tblTarifaPlan.Params[0].Value:=ExtraerFecha(frmSelFecha.FechaIni.Date);
    dmDatos.tblTarifaPlan.Open;
  end;
  finally
  frmSelfEcha.Free;
  frmselfecha:=Nil;
  end;
end;

procedure TfrmTarifaPlan.SpeedButton8Click(Sender: TObject);
begin
  if MessageDlg('Desea eliminar tarifa?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
    dmDatos.tblTarifaPlan.Delete;
    SpeedButton1Click(Self);
  end;
end;

procedure TfrmTarifaPlan.FormCreate(Sender: TObject);
begin
  dmDatos.qryTipoPlan.Close;
  dmDatos.qryTipoPlan.Open;
  dmDatos.tblTarifaPlan.Close;
  dmDatos.tblTarifaPlan.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmDatos.tblTarifaPlan.Open;  
end;

procedure TfrmTarifaPlan.DBDateEdit1Exit(Sender: TObject);
begin
  if dmDatos.tblTarifaPlanFECHA_INICIAL.Value >
  dmDatos.tblTarifaPlanFECHA_FINAL.Value then
  begin
    MessageDlg('Fecha inicial no puede ser mayor que fecha final, verifique',mtError,[mbok],0);
    DBDateEdit1.SetFocus;
  end;
end;

procedure TfrmTarifaPlan.DBDateEdit3Exit(Sender: TObject);
begin
  if (dmDatos.tblTarifaPlanFECHA_Final.Value <
  dmDatos.tblTarifaPlanFECHA_INICIAL.Value) then
  begin
    MessageDlg('Fecha inicial no puede ser menor que fecha inicial, verifique',mtError,[mbok],0);
    DBDateEdit3.SetFocus;
  end;
end;

procedure TfrmTarifaPlan.DBEdit3Exit(Sender: TObject);
begin
  if dmDatos.tblTarifaPlanPORC_COMISION.Value < 1 then
  begin
    Messagedlg('Favor indicar numero entero para % comision. Ejmp: 10%',mtError,[mbok],0);
  end;
end;

end.
