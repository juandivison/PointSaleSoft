unit UFormTransCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, RXCtrls, RXDBCtrl, Grids, DBGrids,
  RxLookup, ToolEdit, DB, Mask, DBCtrls, EditNew, WinSkinData;

type
  TfrmTransCaja = class(TForm)
    DBStatusLabel1: TDBStatusLabel;
    Panel1: TPanel;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DataSource2: TDataSource;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label6: TLabel;
    DataSource3: TDataSource;
    Label7: TLabel;
    edtBlcActual: TEditN;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
  private
    { Private declarations }
    procedure ActualizarCaja(codcaja:integer; accion:integer; monto:extended; var balance_actual:extended);
  public
    { Public declarations }
  end;

var
  frmTransCaja : TfrmTransCaja;
  BalanceActual: Extended;

implementation

uses UDatModCuadrexRuta, UGlobal, UFormSelFecha;

{$R *.dfm}

procedure TfrmTransCaja.FormCreate(Sender: TObject);
begin
  dmCuadrexRuta.qryCaja.close;
  dmCuadrexRuta.qryCaja.Open;
  
  dmCuadrexRuta.qryEmpleados.Close;
  dmCuadrexRuta.qryEmpleados.Open;

  dmCuadrexRuta.trnCajaTrn.Close;
  dmCuadrexRuta.trnCajaTrn.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmCuadrexRuta.trnCajaTrn.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmCuadrexRuta.trnCajaTrn.Open;
end;

procedure TfrmTransCaja.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmCuadrexRuta.qryDatosEmpleado.State In [dsBrowse, dsInactive] then
  begin
    dmCuadrexRuta.qryDatosEmpleado.Close;
    dmCuadrexRuta.qryDatosEmpleado.Open;
    dmCuadrexRuta.trnCajaTrn.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
    dmCuadrexRuta.trnCajaTrn.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
  end;
end;

procedure TfrmTransCaja.btnSalvarClick(Sender: TObject);
begin
  if dmCuadrexRuta.trnCajaTrn.State In [dsInsert, dsEdit] then
  begin
    if dmCuadrexRuta.trnCajaTrn.State In [dsInsert] then
    begin
      if Not RadioButton1.Checked then
      dmCuadrexRuta.trnCajaTrnMONTO.Value:=
      dmCuadrexRuta.trnCajaTrnMONTO.Value * -1;
      if RadioButton1.Checked then
      dmcuadrexruta.trnCajaTrnTIPO_TRN.Value:= 1 //entrada +
      else
      dmcuadrexruta.trnCajaTrnTIPO_TRN.Value:= -1;//retiro;
    end;
    dmCuadrexRuta.trnCajaTrn.Post;
    dmCuadrexRuta.trnCajaTrn.ApplyUpdates;
    if Not dmCuadrexRuta.trnCajaTrn.Transaction.InTransaction then
    dmCuadrexRuta.trnCajaTrn.Transaction.StartTransaction;
    try
      dmCuadrexRuta.trnCajaTrn.Transaction.CommitRetaining;
    except
    dmCuadrexRuta.trnCajaTrn.Transaction.RollbackRetaining;
    end;
    if (dmcuadrexruta.trnCajaTrnstatus.Value = 'A') then
    begin
      if RadioButton1.Checked then
      ActualizarCaja(dmcuadrexruta.trnCajaTrnCOD_CAJA.Value, 1,
      dmcuadrexruta.trnCajaTrnMONTO.Value, BalanceActual)
      else
      ActualizarCaja(dmcuadrexruta.trnCajaTrnCOD_CAJA.Value, -1,
      dmcuadrexruta.trnCajaTrnMONTO.Value, BalanceActual)
      //ActualizarCaja(codcaja:integer; accion:integer; monto:extended;
      //var balance_actual:extended);
    end;
  end;
end;

procedure TfrmTransCaja.btnInsertarClick(Sender: TObject);
begin
  if dmCuadrexRuta.trnCajaTrn.State In [dsBrowse] then
  begin
    dmCuadrexRuta.trnCajaTrn.Insert;
    dmCuadrexRuta.trnCajaTrnSTATUS.Value:= 'A';
    dmCuadrexRuta.trnCajaTrnFECHA.Value := ExtraerFecha(GlbFechaTrnDiaria);
    dmCuadrexRuta.trnCajaTrnCOD_USUARIO.Value:= VarUsuarioGlb;
  end;
end;

procedure TfrmTransCaja.btnCancelarClick(Sender: TObject);
begin
  if dmCuadrexRuta.trnCajaTrn.State In [dsInsert, dsEdit] then
  begin
    dmCuadrexRuta.trnCajaTrn.Cancel;
  end;{ else
  if (dmCuadrexRuta.trnCajaTrnstatus.Value = 'A') then
  begin
    dmCuadrexRuta.trnCajaTrn.Edit;
    dmCuadrexRuta.trnCajaTrnstatus.Value := 'C';
    dmCuadrexRuta.trnCajaTrn.Post;
    dmCuadrexRuta.trnCajaTrn.ApplyUpdates;
    if Not dmCuadrexRuta.trnCajaTrn.Transaction.InTransaction then
    dmCuadrexRuta.trnCajaTrn.Transaction.StartTransaction;
    try
      dmCuadrexRuta.trnCajaTrn.Transaction.CommitRetaining;
    except
    dmCuadrexRuta.trnCajaTrn.Transaction.RollbackRetaining;
    end;
  end;}
end;

procedure TfrmTransCaja.BitBtn1Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(Nil);
  if frmSelFecha.ShowModal = mrOk then
  begin
    dmCuadrexRuta.trnCajaTrn.Close;
    dmCuadrexRuta.trnCajaTrn.Params[0].Value := ExtraerFecha(frmSelFecha.FechaIni.DateTime);
    dmCuadrexRuta.trnCajaTrn.Params[1].Value := ExtraerFecha(frmSelFecha.FechaFin.DateTime);
    dmCuadrexRuta.trnCajaTrn.Open;
  end;
end;

procedure TfrmTransCaja.ActualizarCaja(codcaja:integer; accion:integer; monto:extended; var balance_actual:extended);
begin
  //dmCuadrexRuta.ibProcUpdateCaja.params[0].Value; out = monto_balance_actual
  dmCuadrexRuta.ibProcUpdateCaja.params[1].Value:= CodCaja;
  dmCuadrexRuta.ibProcUpdateCaja.params[2].Value:= Accion;
  dmCuadrexRuta.ibProcUpdateCaja.params[3].Value:= Monto;
  dmCuadrexRuta.ibProcUpdateCaja.ExecProc;
  BalanceActual:=0;
  BalanceActual := dmCuadrexRuta.ibProcUpdateCaja.params[0].Value;
  edtBlcActual.SetFloat(BalanceActual);
  dmcuadrexruta.trnCajaTrn.Edit;
  dmcuadrexruta.trnCajaTrnstatus.Value := 'R';
  btnSalvarClick(Self);
end;

procedure TfrmTransCaja.BitBtn9Click(Sender: TObject);
begin
  dmCuadrexRuta.trnCajaTrn.first;
  if dmcuadrexruta.trnCajaTrn.State = dsBrowse then
  ActualizarCaja(dmcuadrexruta.trnCajaTrnCOD_CAJA.Value, 0,
  0, BalanceActual);
end;

procedure TfrmTransCaja.BitBtn10Click(Sender: TObject);
begin
  dmCuadrexRuta.trnCajaTrn.Prior;
  if dmcuadrexruta.trnCajaTrn.State = dsBrowse then
  ActualizarCaja(dmcuadrexruta.trnCajaTrnCOD_CAJA.Value, 0,
  0, BalanceActual);
end;

procedure TfrmTransCaja.BitBtn11Click(Sender: TObject);
begin
  dmCuadrexRuta.trnCajaTrn.next;
  if dmcuadrexruta.trnCajaTrn.State = dsBrowse then
  ActualizarCaja(dmcuadrexruta.trnCajaTrnCOD_CAJA.Value, 0,
  0, BalanceActual);  
end;

procedure TfrmTransCaja.BitBtn12Click(Sender: TObject);
begin
  dmCuadrexRuta.trnCajaTrn.Last;
  if dmcuadrexruta.trnCajaTrn.State = dsBrowse then
  ActualizarCaja(dmcuadrexruta.trnCajaTrnCOD_CAJA.Value, 0,
  0, BalanceActual);  
end;

procedure TfrmTransCaja.DataSource1StateChange(Sender: TObject);
begin
  if dmCuadrexRuta.trnCajaTrn.State = dsBrowse then
  begin
    BitBtn9.Enabled:= true;
    BitBtn10.Enabled:= true;
    BitBtn11.Enabled:= true;
    BitBtn12.Enabled:= true;
  end else
  begin
    BitBtn9.Enabled:= false;
    BitBtn10.Enabled:= false;
    BitBtn11.Enabled:= false;
    BitBtn12.Enabled:= false;
  end;
end;

end.
