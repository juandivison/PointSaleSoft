unit UCtrlIngresos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, DBActns, ActnList, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons,
  RxLookup, ToolEdit, Mask, DBCtrls, RXCtrls, ExtCtrls, ComCtrls,
  WinSkinData;

type
  TfrmIngresos = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Shape1: TShape;
    Label15: TLabel;
    Shape2: TShape;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBEdit13: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn7: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    TabSheet2: TTabSheet;
    RxDBGrid2: TRxDBGrid;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label16: TLabel;
    ActionList1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    DBEdit11: TDBEdit;
    RxDBLookupCombo5: TRxDBLookupCombo;
    DataSetFirst2: TDataSetFirst;
    DataSetPrior2: TDataSetPrior;
    DataSetNext2: TDataSetNext;
    DataSetLast2: TDataSetLast;
    DBEdit12: TDBEdit;
    Label11: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    DBEdit14: TDBEdit;
    Label13: TLabel;
    BitBtn16: TBitBtn;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
  private
    { Private declarations }
    function Cuadra:Boolean;    
  public
    { Public declarations }
  end;

var
  frmIngresos: TfrmIngresos;

implementation

uses UFormSelFecha, UGlobal, UProcesaPagoFct,UDatModIngresos,
  UDatModInventario;

{$R *.dfm}

procedure TfrmIngresos.BitBtn1Click(Sender: TObject);
begin
  if dmIngresos.tblIngresoMaster.State = dsBrowse then
  begin
    {if Not Cuadra then
    MessageDlg('Transaccion actual no cuadra, verifique',mterror,[mbok],0) else
    begin}
      dmIngresos.tblIngresoMaster.Insert;
      dmIngresos.tblIngresoMasterSTATUS.Value := 'A';
      dmIngresos.tblIngresoMasterMoneda.Value:= '1';//dmIngreso.ibtCompaniaMONEDA.Value;
      BitBtn7Click(Self);
      DBDateEdit1.SetFocus;
    //end;
  end;
end;

function TfrmIngresos.Cuadra: Boolean;
begin

end;

procedure TfrmIngresos.BitBtn7Click(Sender: TObject);
begin
  if dmIngresos.tblIngresoDet.State = dsBrowse then
  begin
    dmIngresos.tblIngresoDet.Insert;
    dmIngresos.tblIngresoDetSTATUS.Value := 'A';
    DBEdit6.SetFocus;
  end;
end;

procedure TfrmIngresos.BitBtn4Click(Sender: TObject);
begin
  if dmIngresos.tblIngresoMaster.State in [dsEdit, dsInsert] then
  begin
    dmIngresos.tblIngresoMaster.Post;
    dmIngresos.tblIngresoMaster.ApplyUpdates;
    if not dmIngresos.tblIngresoMaster.Transaction.InTransaction then
    dmIngresos.tblIngresoMaster.Transaction.StartTransaction;
    try
      dmIngresos.tblIngresoMaster.Transaction.CommitRetaining;
    except
    dmIngresos.tblIngresoMaster.Transaction.RollbackRetaining;
    end;
  end;

  if dmIngresos.tblIngresoDet.State in [dsEdit, dsInsert] then
  begin
    if dmIngresos.tblIngresoDet.State in [dsInsert] then
    begin
      dmIngresos.tblIngresoDetNUMERO_ing.Value:= dmIngresos.tblIngresoMasterNUMERO.AsInteger;
    end;
    dmIngresos.tblIngresoDet.Post;
    dmIngresos.tblIngresoDet.ApplyUpdates;
    if not dmIngresos.tblIngresoDet.Transaction.InTransaction then
    dmIngresos.tblIngresoDet.Transaction.StartTransaction;
    try
      dmIngresos.tblIngresoDet.Transaction.CommitRetaining;
    except
    dmIngresos.tblIngresoDet.Transaction.RollbackRetaining;
    end;
//t    if not dmIngresos.tblIngresoDetNUMERO_Ing.IsNull then
//t    begin
//t      dmIngreso.IBStpSumarIngDet.Params[0].Value:=dmIngresos.tblIngresoDetNUMERO.Value;
//t      dmIngreso.IBStpSumarIngDet.ExecProc;
//t    end;
//t    dmIngresos.tblIngresoMaster.Edit;
//t    dmIngresos.tblIngresoMasterValor_Ing.Value:= dmIngreso.IBStpSumarIngDet.Params[1].Value;
//t    dmIngresos.tblIngresoMaster.Post;
//t    dmIngresos.tblIngresoMaster.ApplyUpdates;
    if not dmIngresos.tblIngresoMaster.Transaction.InTransaction then
    dmIngresos.tblIngresoMaster.Transaction.StartTransaction;
    try
      dmIngresos.tblIngresoMaster.Transaction.CommitRetaining;
    except
    dmIngresos.tblIngresoMaster.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmIngresos.FormCreate(Sender: TObject);
var
  x : byte;
begin
  dmingresos.IBQryCliente.close;
  dmingresos.IBQryCliente.open;
  dmIngresos.tblIngresoMaster.Close;
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
    if frmSelFecha.ShowModal = mrOk then
    begin
      dmIngresos.tblIngresoMaster.Params[0].Value:=ExtraerFecha(frmselfecha.FechaIni.Date);
      dmIngresos.tblIngresoMaster.Params[1].Value:=ExtraerFecha(frmselfecha.FechaFin.Date);
      x:=0;
    end else x:=1;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
  if x = 1 then exit;
  dmingresos.IBTableTipoIng.Close;
  dmingresos.IBTableTipoIng.Open;
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.Open;
  dmIngresos.IBTableServicio.Close;
  dmIngresos.IBTableServicio.Open;
  dmIngresos.tblIngresoMaster.Open;
end;

procedure TfrmIngresos.BitBtn3Click(Sender: TObject);
begin
  if dmIngresos.tblIngresoMaster.State in [dsEdit, dsInsert] then
  dmIngresos.tblIngresoMaster.Cancel;
  if dmIngresos.tblIngresoDet.State in [dsEdit, dsInsert] then
  dmIngresos.tblIngresoDet.Cancel;
end;

procedure TfrmIngresos.BitBtn5Click(Sender: TObject);
begin
  if dmIngresos.tblIngresoMaster.State in [dsBrowse, dsInactive] then
  begin
    dmIngresos.tblIngresoMaster.close;
    dmIngresos.tblIngresoMaster.Open;
  end;
  if dmIngresos.tblIngresoDet.State in [dsBrowse, dsInactive] then
  begin
    dmIngresos.tblIngresoDet.close;
    dmIngresos.tblIngresoDet.open;
  end;
end;

procedure TfrmIngresos.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Si-Modificar Master  No-Modificar Detalle',mtInformation,[mbyes,mbno],0) = mryes then
    if dmIngresos.tblIngresoMaster.State = dsBrowse then dmIngresos.tblIngresoMaster.Edit
  else if dmIngresos.tblIngresoDet.State = dsBrowse then dmIngresos.tblIngresoDet.Edit;
end;

procedure TfrmIngresos.BitBtn16Click(Sender: TObject);
begin
  frmProcesaPagoFactura:=TfrmProcesaPagoFactura.Create(Nil);
  try
    frmProcesaPagoFactura.ShowModal;
  finally
  frmProcesaPagoFactura.Free;
  frmProcesaPagoFactura:=Nil;
  end;
end;

end.
