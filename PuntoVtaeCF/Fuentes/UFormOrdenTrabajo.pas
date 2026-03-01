unit UFormOrdenTrabajo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, RxLookup, StdCtrls, Buttons, rxToolEdit,
  db, Mask, DBCtrls, ExtCtrls, RXCtrls, ComCtrls, WinSkinData, GetAnyDate,
  Menus;

type
  TfrmOrdenTrabajo = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    Shape1: TShape;
    Label11: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    SpeedButton1: TSpeedButton;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBEdit8: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit9: TDBEdit;
    BitBtn17: TBitBtn;
    TabSheet2: TTabSheet;
    RxDBGrid2: TRxDBGrid;
    DBMemo1: TDBMemo;
    DBText1: TDBText;
    Label10: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBGrid1: TRxDBGrid;
    BitBtn7: TBitBtn;
    GetAnyDate1: TGetAnyDate;
    SkinData1: TSkinData;
    DBEdit1: TDBEdit;
    RxSpeedButton5: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    ConsultarActivos1: TMenuItem;
    Consultar1: TMenuItem;
    ReportexFechaEntrega1: TMenuItem;
    BuscarCliente1: TMenuItem;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    BitBtn13: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ReportexFechaEntrega1Click(Sender: TObject);
    procedure ConsultarActivos1Click(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
  private
    procedure PostearEnVentas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdenTrabajo: TfrmOrdenTrabajo;

implementation
uses UDatosVentas, uglobal,
  UDatModCompania, UDatModReportes,
  UBuscarClientesPersonasP,
  UMaestroClientes, UDatModUsuarios, UDatModClientes, UActivapermisos,
  UQckRepOrdenTrabajo, UProcVentaRapida, UDatModCalculos,
  URepOrdenesTrabajoBB, UFormConsultarOrden, UFormCalcPrecioCuadros,
  UDatModPanaderia;
{$R *.dfm}

procedure TfrmOrdenTrabajo.FormCreate(Sender: TObject);
begin
  dmVentas.qryClientes.Close;
  dmVentas.qryClientes.Open;
  dmVentas.qryEmpleado.Close;
  dmVentas.qryEmpleado.Open;
  dmVentas.tblOrdenTrabajo.Close;
  dmVentas.tblOrdenTrabajo.Open;
   dmVentas.tblOrdenTrabajo.Close;
   dmVentas.tblOrdenTrabajo.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
   dmVentas.tblOrdenTrabajo.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);
   dmVentas.tblOrdenTrabajo.Open;
end;

procedure TfrmOrdenTrabajo.BitBtn1Click(Sender: TObject);
begin
  if (dmVentas.tblOrdenTrabajo.state = dsBrowse) then
  begin
    dmVentas.tblOrdenTrabajo.Append;
    dmVentas.tblOrdenTrabajoFECHA.Value:= ExtraerFecha(GlbFechaTrnDiaria);
    dmVentas.tblOrdenTrabajoCOD_MONEDA.Value:='1';
    dmVentas.tblOrdenTrabajoSTATUS.Value:='A';
    dmVentas.tblOrdenTrabajoIN_POR.Value:=strusername;
    dmVentas.tblOrdenTrabajoFECHA_ENTREGA.Value:=now;
    dmVentas.tblOrdenTrabajoCODIGO_USER.Value := VarUsuarioGlb;
    DBDateEdit2.SetFocus;
  end;
end;

procedure TfrmOrdenTrabajo.SpeedButton1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    FrmBuscarClientesPersonas.CodigoCliente := -1;
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      if dmVentas.tblRegServicioMaster.State In [dsBrowse] then
      dmVentas.tblOrdenTrabajo.Edit;
      dmVentas.tblOrdenTrabajoCODIGO_CTE.Value := FrmBuscarClientesPersonas.CodigoCliente;
      //dmVentas.tblRegServicioMasterNOMBRE_CLIENTE.Value:= FrmBuscarClientesPersonas.nombrecliente;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmOrdenTrabajo.BitBtn17Click(Sender: TObject);
var
  codcte : integer;
begin
  frmClientes:=TfrmClientes.Create(Nil);
  try
    dmclientes.tblClientes.Tag:=-1;
    dmclientes.tblClientes.DisableControls;
    dmclientes.tblClientes.Locate('CODIGO_CTE', dmVentas.tblOrdenTrabajoCODIGO_CTE.Value,[]);
    dmclientes.tblClientes.Tag:=0;
    dmclientes.tblClientes.EnableControls;

    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;
    While Not dmUsuarios.qryRoles.Eof Do
    begin
      ActivaPermiso(TForm(frmClientes), 1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
      dmUsuarios.qryRoles.Next;
    end;
    frmClientes.Showmodal;
    codcte := dmClientes.tblClientesCODIGO_CTE.Value;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
  if dmVentas.tblOrdenTrabajo.State in [dsEdit, dsInsert] then
  begin
     dmVentas.tblOrdenTrabajoCODIGO_CTE.Value :=  codcte;
  end;
  dmventas.qryClientes.Close;
  dmventas.qryClientes.Open;
end;

procedure TfrmOrdenTrabajo.BitBtn2Click(Sender: TObject);
begin
  if (dmVentas.tblOrdenTrabajo.state = dsBrowse) then
  dmVentas.tblOrdenTrabajo.Edit;
end;

procedure TfrmOrdenTrabajo.BitBtn4Click(Sender: TObject);
begin
  if (dmVentas.tblOrdenTrabajo.state In [dsEdit, dsInsert]) then
  begin
    GlbSalvarQuery(dmVentas.tblOrdenTrabajo);
  end;
end;

procedure TfrmOrdenTrabajo.BitBtn3Click(Sender: TObject);
begin
  if (dmVentas.tblOrdenTrabajo.state In [dsEdit, dsInsert]) then
  dmVentas.tblOrdenTrabajo.Cancel
  else
  if (dmVentas.tblOrdenTrabajo.state In [dsBrowse]) then
  begin
    if MessageDlg('Eliminar Transacción?', mtInformation, [mbYes, mbNo],0)= mrYes then
    dmVentas.tblOrdenTrabajo.Delete;
    GlbSalvarQuery(dmVentas.tblOrdenTrabajo);
  end;
end;

procedure TfrmOrdenTrabajo.BitBtn5Click(Sender: TObject);
begin
  if (dmVentas.tblOrdenTrabajo.state In [dsBrowse]) then
  begin
    dmVentas.tblOrdenTrabajo.close;
    dmVentas.tblOrdenTrabajo.Open;
  end;
end;

procedure TfrmOrdenTrabajo.BitBtn8Click(Sender: TObject);
begin
  dmReportes.orden_trab_num := dmVentas.tblOrdenTrabajoNUM_ORDEN.Value;
  dmReportes.qryRepOrdenTrabajo.Close;
  dmReportes.qryRepOrdenTrabajo.Filtered := False;
  dmReportes.qryRepOrdenTrabajo.Params[0].Value := ExtraerFecha(dmVentas.tblOrdenTrabajoFECHA.Value);
  dmReportes.qryRepOrdenTrabajo.Params[1].Value := ExtraerFecha(dmVentas.tblOrdenTrabajoFECHA.Value);
  dmReportes.qryRepOrdenTrabajo.Open;
  dmReportes.qryRepOrdenTrabajo.Filtered := True;
  //UQckRepOrdenTrabajoBurgos
  qckOrdenTrabajo:= TqckOrdenTrabajo.Create(Nil);
  try
    qckOrdenTrabajo.Preview;
  finally
  qckOrdenTrabajo.Free;
  qckOrdenTrabajo:=Nil;
  end;
end;


procedure TfrmOrdenTrabajo.PostearEnVentas;
begin

end;
procedure TfrmOrdenTrabajo.BitBtn7Click(Sender: TObject);
begin
  GetAnyDate1.FechaCierre := ExtraerFecha(GlbFechaTrnDiaria);
  if GetAnyDate1.Execute then
  begin
   dmVentas.tblOrdenTrabajo.Close;
   dmVentas.tblOrdenTrabajo.Params[0].Value := ExtraerFecha(GetAnyDate1.Fecha);
   dmVentas.tblOrdenTrabajo.Params[1].Value := ExtraerFecha(GetAnyDate1.FechaFinal);
   dmVentas.tblOrdenTrabajo.Open;
  end;
end;

procedure TfrmOrdenTrabajo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 113) then
  BitBtn1Click(Self)
  else if (key = 116) then
  BitBtn4Click(Self);
end;

procedure TfrmOrdenTrabajo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (dmVentas.tblOrdenTrabajo.state In [dsEdit, dsInsert]) then
  begin
    MessageDlg('Hay una transacción activa, verifique', mtWarning, [mbOk],0);
    CanClose:=False;
  end else CanClose:=True;
end;

procedure TfrmOrdenTrabajo.ReportexFechaEntrega1Click(Sender: TObject);
begin
  frmConsultaOrdenes:=TfrmConsultaOrdenes.Create(nil);
  try
    if frmConsultaOrdenes.ShowModal = mrOk then
    begin
      frmConsultaOrdenes.Abrir;
      //URepOrdenesTrabajoBB - Burgos
      qckRepOrdenesTrabajo:=TqckRepOrdenesTrabajo.Create(nil);
      try
        qckRepOrdenesTrabajo.strRepCond := frmConsultaOrdenes.labelCretrioRep;
        qckRepOrdenesTrabajo.Preview;
      finally
      qckRepOrdenesTrabajo.free;
      qckRepOrdenesTrabajo:=nil;
    end;
    end;
  finally
  frmConsultaOrdenes.free;
  frmConsultaOrdenes:=nil;
  end;
end;

procedure TfrmOrdenTrabajo.ConsultarActivos1Click(Sender: TObject);
begin
  dmVentas.tblOrdenTrabajo.Filtered:=False;
  dmVentas.strFilerFName:='Status';
  dmVentas.strFilterValue:='A';
  dmVentas.strFilterIsInt := False;
  dmVentas.tblOrdenTrabajo.Filtered:=True;
  CheckBox1.Checked:=True;
end;

procedure TfrmOrdenTrabajo.Consultar1Click(Sender: TObject);
begin
  dmVentas.tblOrdenTrabajo.Filtered:=False;
  dmVentas.strFilerFName:='Status';
  dmVentas.strFilterValue:='R';
  dmVentas.strFilterIsInt := False;
  dmVentas.tblOrdenTrabajo.Filtered:=True;
  CheckBox1.Checked:=True;
end;

procedure TfrmOrdenTrabajo.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  dmVentas.tblOrdenTrabajo.Filtered:=False;
end;

procedure TfrmOrdenTrabajo.BitBtn13Click(Sender: TObject);
begin
  frmCalcPrecioArticulo:=TfrmCalcPrecioArticulo.Create(Nil);
  try
    frmCalcPrecioArticulo.xcodCte := 0;
    frmCalcPrecioArticulo.qryCliente.Close;
    frmCalcPrecioArticulo.qryCliente.Params[0].Value:= dmVentas.tblOrdenTrabajoCODIGO_CTE.Value;
    frmCalcPrecioArticulo.qryCliente.Open;
    frmCalcPrecioArticulo.xcodCte := dmVentas.tblOrdenTrabajoCODIGO_CTE.Value;
    if frmCalcPrecioArticulo.ShowModal = mrOk then
    begin
      if (dmVentas.tblOrdenTrabajo.State = dsBrowse) then
      dmVentas.tblOrdenTrabajo.Edit;
      dmVentas.tblOrdenTrabajoMONTO_TOTAL.Value:= dmPanaderia.tblPrecioCuadrosPRECIOVENTA.Value;
      DBEdit8.SetFocus;  
    end;
  finally
  frmCalcPrecioArticulo.Free;
  frmCalcPrecioArticulo:=Nil;
  end;
end;

end.
