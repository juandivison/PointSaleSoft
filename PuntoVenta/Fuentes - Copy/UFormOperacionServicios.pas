unit UFormOperacionServicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, rxToolEdit, RXDBCtrl, Buttons, Grids,
  db,DBGrids, RxLookup, RXCtrls, WinSkinData, GetAnyDate;

type
  TfrmOperacionServicios = class(TForm)
    DBDateEdit1: TDBDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label11: TLabel;
    GetAnyDate1: TGetAnyDate;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
  private
    { Private declarations }
    procedure CalcularMontos;
  public
    { Public declarations }
  end;

var
  frmOperacionServicios: TfrmOperacionServicios;

implementation

uses UDatModFactura, UGlobal, UDatosVentas, UDatModReportes,
  URepComisionOpeServ;

{$R *.dfm}

procedure TfrmOperacionServicios.FormCreate(Sender: TObject);
begin
  dmFactura.qryVentaServicio.Close;
  dmFactura.qryVentaServicio.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmFactura.qryVentaServicio.Open;
  dmVentas.qryEmpleado.Close;
  dmVentas.qryEmpleado.Open;
  dmVentas.qryInventarioServTaller.Close;
  dmVentas.qryInventarioServTaller.Open;
  dmVentas.qryClientes.Close;
  dmVentas.qryClientes.Open;
end;

procedure TfrmOperacionServicios.BitBtn7Click(Sender: TObject);
begin
  if dmFactura.qryVentaServicio.State in [dsBrowse] then
  begin
    dmFactura.qryVentaServicio.Insert;
    dmFactura.qryVentaServicioFECHA.Value       := ExtraerFecha(GlbFechaTrnDiaria);

    dmFactura.qryVentaServicioSTATUS.Value      := 'A';
    dmFactura.qryVentaServicioFECHA_IN.Value    := Now;
    dmFactura.qryVentaServicioIN_POR.Value      := strUserName;
    dmFactura.qryVentaServicioCOD_USUARIO.Value := VarUsuarioGlb;
    dmFactura.qryVentaServicioPORC_COMISION.Value:= 30;
    dmfactura.qryVentaServicioCODIGO_CTE.Value := 0;
    RxDBLookupCombo2.SetFocus;
  end;
end;

procedure TfrmOperacionServicios.BitBtn2Click(Sender: TObject);
begin
  if dmFactura.qryVentaServicio.State in [dsBrowse] then
  begin
    dmFactura.qryVentaServicio.Edit;
    dmFactura.qryVentaServicioFECHA_MOD.Value:=now;
    dmFactura.qryVentaServicioMOD_POR.Value := strusername;
  end;
end;

procedure TfrmOperacionServicios.BitBtn4Click(Sender: TObject);
begin
  if dmFactura.qryVentaServicio.State  in [dsEdit, dsInsert] then
  begin
    if dmFactura.qryVentaServicioCODIGO_OPERARIO.IsNull then
    begin
      RxDBLookupCombo3.Color:=clYellow;
      raise Exception.Create('Favor indicar codigo del operador, gracias.');
    end;
    dmFactura.qryVentaServicio.Post;
    dmFactura.qryVentaServicio.ApplyUpdates;
    GlbSalvarQuery(dmFactura.qryVentaServicio);
  end;
end;

procedure TfrmOperacionServicios.BitBtn3Click(Sender: TObject);
begin
  if dmFactura.qryVentaServicio.State in [dsEdit, dsInsert] then
  dmFactura.qryVentaServicio.Cancel;
end;

procedure TfrmOperacionServicios.BitBtn5Click(Sender: TObject);
begin
  dmFactura.qryVentaServicio.Close;
  dmFactura.qryVentaServicio.Open;

end;

procedure TfrmOperacionServicios.RxDBLookupCombo1Change(Sender: TObject);
begin
  if dmFactura.qryVentaServicio.State In [dsEdit, dsInsert] then
  begin
    dmFactura.qryVentaServicioMONTO_SERVICIO.Value:= dmVentas.qryInventarioServTallerPRECIO.Value; 
  end;
end;

procedure TfrmOperacionServicios.CalcularMontos;
begin
  if dmFactura.qryVentaServicioMONTO_SERVICIO.IsNull then exit;
  if dmFactura.qryVentaServicio.State In [dsEdit, dsInsert] then
  begin
    dmFactura.qryVentaServicioMONTO_COMISION.Value:=
    dmFactura.qryVentaServicioMONTO_SERVICIO.Value  *
    dmFactura.qryVentaServicioPORC_COMISION.Value / 100;

    dmFactura.qryVentaServicioMONTO_DESCUENTO.Value:=
    dmFactura.qryVentaServicioMONTO_SERVICIO.Value  *
    dmFactura.qryVentaServicioPORC_DESCUENTO.Value / 100;

  end;
end;

procedure TfrmOperacionServicios.DBEdit2Change(Sender: TObject);
begin
  CalcularMontos;
end;

procedure TfrmOperacionServicios.DBEdit4Change(Sender: TObject);
begin
  CalcularMontos;
end;

procedure TfrmOperacionServicios.DBEdit6Change(Sender: TObject);
begin
  CalcularMontos;
end;

procedure TfrmOperacionServicios.DBEdit6Exit(Sender: TObject);
begin
  CalcularMontos;
end;

procedure TfrmOperacionServicios.BitBtn8Click(Sender: TObject);
begin
  GetAnyDate1.FechaCierre := GlbFechaTrnDiaria;
  if GetAnyDate1.Execute then
  begin
    dmreportes.qryRepVentaServicio.Close;
    dmreportes.qryRepVentaServicio.Params[0].Value:= ExtraerFecha(GetAnyDate1.Fecha);
    dmreportes.qryRepVentaServicio.Params[1].Value:= ExtraerFecha(GetAnyDate1.FechaFinal);
    dmreportes.qryRepVentaServicio.Open;
    qckRepComisionOpeServ:=TqckRepComisionOpeServ.Create(Nil);
    try
      qckRepComisionOpeServ.Preview;
    finally
    qckRepComisionOpeServ.Free;
    qckRepComisionOpeServ:=Nil;
    end;
  end;
end;

procedure TfrmOperacionServicios.DBEdit2Exit(Sender: TObject);
begin
  CalcularMontos;
end;

procedure TfrmOperacionServicios.RxDBLookupCombo3Exit(Sender: TObject);
begin
  RxDBLookupCombo3.Color:=clWhite;
end;

end.
