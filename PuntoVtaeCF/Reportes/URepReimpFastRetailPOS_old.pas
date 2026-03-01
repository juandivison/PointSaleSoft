unit URepReimpFastRetailPOS;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepReciboReimpFRetailPOS = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    qckRepComprobante: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel18: TQRLabel;
    ChildBand4: TQRChildBand;
    ChildBand3: TQRChildBand;
    QRLabel20: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel25: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRDBText14: TQRDBText;
    ChildBand5: TQRChildBand;
    ChildBand6: TQRChildBand;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel34: TQRLabel;
    ChildBand8: TQRChildBand;
    QRLabel24: TQRLabel;
    QRDBText25: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel33: TQRLabel;
    ChildBand9: TQRChildBand;
    ChildBand10: TQRChildBand;
    QRLabel32: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel35: TQRLabel;
    QRExpr5: TQRExpr;
    QRDBText16: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText24: TQRDBText;
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QRLabel20Print(sender: TObject; var Value: String);
    procedure QRLabel24Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure ChildBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand9BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure ChildBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure QRLabel12Print(sender: TObject; var Value: String);
  private

  public
    valorNCF : String[19];
    ncfDesc  : String;
    xtipoVenta : String;
    nombreCteGenerico : String;
    strcopia : String;
  end;
var
  qckRepReciboReimpFRetailPOS: TqckRepReciboReimpFRetailPOS;

implementation

uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  UFormVtaCafeteria, UDatModReportes, udatmodfactura, UDatModInventario;

{$R *.DFM}

procedure TqckRepReciboReimpFRetailPOS.QRDBText4Print(sender: TObject;
  var Value: String);
begin
 Value :='RNC-'+VALUE;
end;

procedure TqckRepReciboReimpFRetailPOS.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  //qrLabelRNC.Caption:='';
  qckRepReciboReimpFRetailPOS.AllDataSets.Add(dmCompania.tblCompania);
  qckRepReciboReimpFRetailPOS.AllDataSets.Add(dmFactura.qryVentaFactura);
  if Assigned(frmProcVentaRapida) then
  qckRepReciboReimpFRetailPOS.AllDataSets.Add(frmProcVentaRapida.Totales)
  else
  qckRepReciboReimpFRetailPOS.AllDataSets.Add(frmVentaCafeteria);
end;

procedure TqckRepReciboReimpFRetailPOS.QRLabel19Print(sender: TObject; var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckRepReciboReimpFRetailPOS.QRLabel20Print(sender: TObject; var Value: String);
begin
  if (valorNCF <> '') then
  begin
    Value:=Value +' '+ Trim(valorNCF);
  end else Value:='';
end;

procedure TqckRepReciboReimpFRetailPOS.QRLabel24Print(sender: TObject; var Value: String);
begin
  Value := xtipoVenta+strCopia;
end;

procedure TqckRepReciboReimpFRetailPOS.QRLabel2Print(sender: TObject; var Value: String);
begin
  Value:= 'Número : ';
end;

procedure TqckRepReciboReimpFRetailPOS.QRLabel1Print(sender: TObject; var Value: String);
begin
  if qckRepReciboReimpFRetailPOS.xtipoVenta = 'COTIZACION' then
  Value:= 'COTIZACION ';
end;

procedure TqckRepReciboReimpFRetailPOS.QRLabel14Print(sender: TObject; var Value: String);
begin
  //if Length(nombreCteGenerico) > 0 then
  //Value := NombreCteGenerico;
  //if (Length(frmProcVentaRapida.TotalesNombreCliente.Value) > 0 ) then
  Value :=dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value;
  //frmProcVentaRapida.TotalesNombreCliente.Value;
end;

procedure TqckRepReciboReimpFRetailPOS.ChildBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (xtipoVenta = 'CONTADO') then
  begin
    QRLabel28.Enabled:=False;
    QRLabel29.Enabled:=False;
    QRLabel31.Enabled:=False;
    QRLabel30.Enabled:=False;
    ChildBand4.Height:=1;
  end;
end;

procedure TqckRepReciboReimpFRetailPOS.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
end;

procedure TqckRepReciboReimpFRetailPOS.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{  if Assigned(frmProcVentaRapida) then
  begin  dmFactura.qryVentaFacturaPORC_DESCUENTO .Value
    if frmProcVentaRapida.TotalesMontoDescAdicional.Value > 0 then
    begin
      QRDBText16.Visible := False;
      QRDBText16.SendToBack;
      QRDBText24.Visible := True;
      QRDBText24.BringToFront;
    end else
    begin
      QRDBText16.Visible := True;
      QRDBText16.BringToFront;
      QRDBText24.Visible := False;
      QRDBText24.SendToBack
   end;
  end;}
end;

procedure TqckRepReciboReimpFRetailPOS.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmCompania.tblCompaniaOBSERVACION.IsNull then
  PageHeaderBand1.HasChild:=false;
end;

procedure TqckRepReciboReimpFRetailPOS.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //dmInventario.qryTipoUnidadDESCRIPCION.Value;
  if Not dmFactura.qryVentaFacturaDetTIPO_UNIDAD.IsNull then
  begin
    if (QRLabel26.Enabled = false) then
    begin
      //QRDBText22 = DescUnidadMedida
      if dmInventario.qryTipoUnidad.locate('IDUNIDAD',dmFactura.qryVentaFacturaDetTIPO_UNIDAD.Value,[]) then
      begin
        qrLabel35.Caption:= dmInventario.qryTipoUnidadDESCRIPCION.Value;
        qrLabel35.Top := 22;
        qrLabel35.BringToFront;
      end;
      QRLabel33.Top := 22;
      QRLabel33.BringToFront;

      QRSubDetail1.Height := 37;
      if (GlbImpTUnidadEnRcbo = 0) then
      begin
        QRSubDetail1.Height := 20;
        qckRepReciboReimpFRetailPOS.QRLabel26.Enabled := False;
        qckRepReciboReimpFRetailPOS.QRDBText20.Enabled:= False;
      end;
    end else
    if not dmFactura.qryVentaFacturaDetTIPO_UNIDAD.IsNull and (GlbImpTUnidadEnRcbo = 1) then
    begin
      QRSubDetail1.Height := 53;
      if GlbImpCodProducto = 0 then
      begin
        QRSubDetail1.Height := 20;
        qckRepReciboReimpFRetailPOS.QRLabel26.Enabled := False;
        qckRepReciboReimpFRetailPOS.QRDBText20.Enabled:= False;
      end;
    end else
    begin
      QRSubDetail1.Height := 37;
      //QRDBText22.Enabled:=False;
      if GlbImpCodProducto = 0 then
      begin
        QRSubDetail1.Height := 20;
        qckRepReciboReimpFRetailPOS.QRLabel26.Enabled := False;
        qckRepReciboReimpFRetailPOS.QRDBText20.Enabled:= False;
      end;
    end;
  end else
  if (GlbImpTUnidadEnRcbo = 0) then
  begin
    //QRDBText22.Enabled:=False;
    QRSubDetail1.Height := 37;
    if GlbImpCodProducto = 0 then
    begin
      QRSubDetail1.Height := 20;
      qckRepReciboReimpFRetailPOS.QRLabel26.Enabled := False;
      qckRepReciboReimpFRetailPOS.QRDBText20.Enabled:= False;
    end;
  end;
end;

procedure TqckRepReciboReimpFRetailPOS.ChildBand9BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Length(dmFactura.qryVentaFacturaDetSERIE_PROD.Value) = 0 then
  ChildBand9.HasChild:= False;
end;

procedure TqckRepReciboReimpFRetailPOS.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
end;

procedure TqckRepReciboReimpFRetailPOS.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;

end;

procedure TqckRepReciboReimpFRetailPOS.ChildBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrLabel27.Caption:= GlbPiedePaginaFactura;
end;

procedure TqckRepReciboReimpFRetailPOS.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  if Length(Value) = 9 then
  Value:='RNC:'+Value 
  else Value:='CÉDULA:'+Value;
end;

procedure TqckRepReciboReimpFRetailPOS.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  case dmFactura.qryVentaFacturaFORMA_PAGO.Value of
  1 : Value:='Efectivo';
  2	 : Value:='Tarjeta';
  3	 : Value:='Cheque';
  4	 : Value:='Travel Check';
  5	 : Value:='Promoción';
  6	 : Value:='Devolucion';
  7	 : Value:='Credito Normal';
  0	 : Value:='CUADRE';
  8	 : Value:='Credito Directo';
  9	 : Value:='Cupon';
 10	 : Value:='Nota Crédito';
 11	 : Value:='Otro';
 12	 : Value:='Tarjeta Debito';
 13	 : Value:='Tarjeta Propia';
 15	 : Value:='Financiamiento';
 16	 : Value:='Venta Crédito';
 17	 : Value:='Consignación';
 end;
end;

end.
