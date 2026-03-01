unit UFormComicionesXVtaProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormPagoComisionTrab, GetAnyDate, WinSkinData, DB, RxMemDS,
  IBCustomDataSet, IBStoredProc, StdCtrls, RxLookup, ExtCtrls, DBCtrls,
  Mask, RxToolEdit, RxDBCtrl, Buttons, Grids, DBGrids, RxCtrls, ComCtrls;

type
  TfrmComisionVtaXProd = class(TfrmComisionTrab)
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn1Click2(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComisionVtaXProd: TfrmComisionVtaXProd;

implementation

uses UDatModCompania, UFormFacturas, UDatModComisiones, UGlobal,UDatModFactura;

{$R *.dfm}

procedure TfrmComisionVtaXProd.BitBtn9Click(Sender: TObject);
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
        //dmfactura.qryVtaConDeliveryTrn.Close;
        //dmfactura.qryVtaConDeliveryTrn.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
        //dmfactura.qryVtaConDeliveryTrn.Open;
    
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
  //inherited;
end;

procedure TfrmComisionVtaXProd.BitBtn1Click2(Sender: TObject);
begin
  inherited;
  if dmComision.tblComisionTrab.State = dsInsert then
  dmComision.tblComisionTrabtipo_Comision.Value:=2;//Cant vendida x precio por unidad
end;

procedure TfrmComisionVtaXProd.FormCreate(Sender: TObject);
begin
  inherited;
  DBEdit3.Enabled:=False;
end;

end.
