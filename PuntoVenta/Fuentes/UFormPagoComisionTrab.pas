unit UFormPagoComisionTrab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, rxToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, Buttons, Grids,
  DB, DBGrids, ExtCtrls, RXCtrls, ComCtrls, IBCustomDataSet, IBStoredProc,
  RxMemDS, RxLookup, WinSkinData, GetAnyDate;

type
  TfrmComisionTrab = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBStatusLabel4: TDBStatusLabel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RxDBGrid4: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    DBEdit4: TDBEdit;
    BitBtn7: TBitBtn;
    ipStpInsertVentMast: TIBStoredProc;
    ibStpInsertVentaDet: TIBStoredProc;
    DBDateEdit2: TDBDateEdit;
    Label6: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    rxDatos: TRxMemoryData;
    rxDatosNumero: TIntegerField;
    rxDatosstatus: TStringField;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label7: TLabel;
    SkinData1: TSkinData;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBText1: TDBText;
    Label11: TLabel;
    DBEdit3: TDBEdit;
    edtNumFactBuscar: TEdit;
    Label12: TLabel;
    BitBtn9: TBitBtn;
    GetAnyDate1: TGetAnyDate;
    BitBtn8: TBitBtn;
    procedure BitBtn1Click2(Sender: TObject);
    procedure BitBtn2Click2(Sender: TObject);
    procedure BitBtn3Click2(Sender: TObject);
    procedure BitBtn4Click2(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtNumFactBuscarChange(Sender: TObject);
    procedure edtNumFactBuscarExit(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComisionTrab: TfrmComisionTrab;
  porcientoItbi : Real;
  Serie_Asignadoncf : Integer;
implementation

uses UDatModComisiones, uglobal, UDatModCompania, UDatModCxc,
  UDatModFactura, UFormFacturas, URepComisionTrab, UFormParamsRepComTrab;
{$R *.dfm}

procedure TfrmComisionTrab.BitBtn1Click2(Sender: TObject);
begin
 if dmComision.tblComisionTrab.State = dsBrowse then
  begin
    dmComision.tblComisionTrab.Insert;
    dmComision.tblComisionTrabtipo_Comision.Value:=1;
    dmComision.tblComisionTrabFECHA.Value := ExtraerFecha(GlbFechaTrnDiaria);
    dmComision.tblComisionTrabSTATUS.Value:='A';
    dmComision.tblComisionTrabFECHA_IN.Value   := ExtraerFecha(GlbFechaTrnDiaria);
    dmComision.tblComisionTrabIN_POR.Value     := strUserName;
    dmComision.tblComisionTrabCOD_USUARIO.Value:= VarUsuarioGlb;
    dmComision.tblComisionTrabFECHA_IN.Value   := Now;
    DBDateEdit1.SetFocus;
  end;
end;

procedure TfrmComisionTrab.BitBtn2Click2(Sender: TObject);
begin
 if dmComision.tblComisionTrab.State = dsBrowse then
  begin
    dmComision.tblComisionTrab.Edit;
    dmComision.tblComisionTrabFECHA_MOD.Value:= Now;
    dmComision.tblComisionTrabMOD_POR.Value  := StrUserName;
    dmComision.tblComisionTrabCOD_USUARIO.Value:=VarUsuarioGlb;
  end;
end;

procedure TfrmComisionTrab.BitBtn3Click2(Sender: TObject);
begin
  if dmComision.tblComisionTrab.State in [dsEdit,dsInsert] then
  begin
    dmComision.tblComisionTrab.Cancel;
  end else
  if MessageDlg('Borrar record?',mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    dmComision.tblComisionTrab.Delete;
    GlbSalvarQuery(dmComision.tblComisionTrab);
  end;
end;

procedure TfrmComisionTrab.BitBtn4Click2(Sender: TObject);
begin
  if dmComision.tblComisionTrab.State In [dsEdit,dsInsert] then
  begin
    if dmComision.tblComisionTrab.State in [dsInsert] then
    dmComision.tblComisionTrabSTATUS.Value:='A';
    dmComision.tblComisionTrab.Post;
    dmComision.tblComisionTrab.ApplyUpdates;
    if not dmComision.tblComisionTrab.Transaction.InTransaction then
    dmComision.tblComisionTrab.Transaction.StartTransaction;
    try
      dmComision.tblComisionTrab.Transaction.CommitRetaining;
    except
    dmComision.tblComisionTrab.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmComisionTrab.FormCreate(Sender: TObject);
begin
  dmCompania.tblcompania.Close;
  dmCompania.tblcompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);

  rxDatos.Close;
  rxDatos.Open;
  dmComision.tblComisionTrab.close;
  dmComision.tblComisionTrab.Open;
  dmComision.qryEmpleados.Close;
  dmComision.qryEmpleados.Open;
  dmComision.tblTipoInventario.Close;
  dmComision.tblTipoInventario.Open;
end;

procedure TfrmComisionTrab.edtNumFactBuscarChange(Sender: TObject);
begin
  dmComision.qryVentas.Close;
  dmComision.qryVentas.Params[0].Value:= StrToInt(edtNumFactBuscar.Text);
  dmComision.qryVentas.Open;
  if (dmComision.qryVentas.RecordCount = 1) then
  begin
    if dmComision.tblComisionTrab.State = dsBrowse then
    dmComision.tblComisionTrab.Append;
    dmComision.tblComisionTrabNUMERO_FACT.Value  :=dmComision.qryVentas.Params[0].Value;
    dmComision.tblComisionTrabFECHA_FACTURA.Value:=dmComision.qryVentasFECHA.Value;
    dmComision.tblComisionTrabFECHA.Value        := ExtraerFecha(GlbFechaTrnDiaria);
    dmComision.tblComisionTrabCOD_USUARIO.Value  := VarUsuarioGlb;
    dmComision.tblComisionTrabFECHA_IN.Value     :=Now;
    dmComision.tblComisionTrabIN_POR.Value       :=strusername;
    dmComision.tblComisionTrabMONTO_FACTURA.Value:=dmComision.qryVentasVALOR_TOTAL_DET.Value;
  end;
end;

procedure TfrmComisionTrab.edtNumFactBuscarExit(Sender: TObject);
begin
  edtNumFactBuscarChange(Self);
end;

procedure TfrmComisionTrab.BitBtn9Click(Sender: TObject);
var
  tRecordsDet : Integer;
  pulgadaInc : Real;
  flag : boolean;
begin
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);

  frmConsultaFacturas:=TfrmConsultaFacturas.Create(Nil);
  try                                     
    frmConsultaFacturas.BitBtn2.Caption:='Aceptar';
    if frmConsultaFacturas.Showmodal = mrOK then
    begin
      if dmComision.tblComisionTrab.State in [dsEdit, dsInsert] then
      begin
        if Not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
        dmComision.tblComisionTrabNUMERO_FACT.Value := dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger
        else
        dmComision.tblComisionTrabNUMERO_FACT.Value := dmFactura.qryVentaFacturaNUMERO_Factura.Value;
        dmComision.tblComisionTrabTIPO_PAGO.Value   := dmFactura.qryVentaFacturaFORMA_PAGO.Value;
        dmComision.tblComisionTrabMONTO_FACTURA.Value:=dmFactura.qryVentaFacturaVALOR_TOTAL_DET.Value;
        dmComision.tblComisionTrabFECHA_FACTURA.Value:=dmFactura.qryVentaFacturaFECHA.Value;
        dmComision.tblComisionTrabNUMERO_TRN.Value   :=dmFactura.qryVentaFacturaNUMERO.Value;
      end;
    end;
  finally
  frmConsultaFacturas.Free;
  frmConsultaFacturas:=nil;
  end;
end;

procedure TfrmComisionTrab.BitBtn5Click(Sender: TObject);
begin
  dmComision.tblComisionTrab.Close;
  dmComision.tblComisionTrab.Open;
end;

procedure TfrmComisionTrab.BitBtn7Click(Sender: TObject);
begin
   frmDatosRepComisiones:=TfrmDatosRepComisiones.Create(nil);
   try
     if frmDatosRepComisiones.showmodal = mrok then
     begin
    frmDatosRepComisiones.AbrirDatos;
    qckRepComisionTrab:=TqckRepComisionTrab.Create(nil);
    try
    qckRepComisionTrab.labelCretrioRep:=frmDatosRepComisiones.labelCretrioRep;
    qckRepComisionTrab.Preview;
    if frmDatosRepComisiones.chboxExportarPDF.Checked then
    begin
      ReportExport(qckRepComisionTrab,GlbRutaInformes+'\Comisiones'+FormatDateTime('dd-mm-yyyy',dmComision.qryListadoPagoComisionesFecha.Value)+'.pdf');
    end;
    finally
    qckRepComisionTrab.Free;
    qckRepComisionTrab:=nil;
    end;

    end;
   finally
   frmDatosRepComisiones.free;
   frmDatosRepComisiones:=nil;
   end;
end;

procedure TfrmComisionTrab.BitBtn8Click(Sender: TObject);
begin
  GetAnyDate1.FechaCierre:=now;
  if GetAnyDate1.Execute then
  begin
    dmComision.tblComisionTrab.Close;
    dmComision.tblComisionTrab.params[0].value:=ExtraerFecha(GetAnyDate1.Fecha);
    dmComision.tblComisionTrab.params[1].value:=ExtraerFecha(GetAnyDate1.FechaFinal);
    dmComision.tblComisionTrab.Open;
  end;
end;

end.
