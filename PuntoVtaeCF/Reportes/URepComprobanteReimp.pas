unit URepComprobanteReimp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepReciboReimp = class(TQuickRep)
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
    QRDBText12: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
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
    QRLabel23: TQRLabel;
    QRLabel27: TQRLabel;
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
    QRLabel36: TQRLabel;
    QRDBText22: TQRDBText;
    ChildBand2: TQRChildBand;
    ChildBand7: TQRChildBand;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText24: TQRDBText;
    ChildBand11: TQRChildBand;
    QRLabel5: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QRLabel20Print(sender: TObject; var Value: String);
    procedure QRLabel24Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure ChildBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText22Print(sender: TObject; var Value: String);
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
    procedure ColumnHeaderBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure QRDBText24Print(sender: TObject; var Value: String);
    procedure ChildBand11BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel12Print(sender: TObject; var Value: String);
  private

  public
    valorNCF : String[19];
    ncfDesc  : String;
    xtipoVenta : String;
    nombreCteGenerico : String;
    lblcopia : string;
  end;

var
  qckRepReciboReimp: TqckRepReciboReimp;

implementation

uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  UFormVtaCafeteria, UDatModReportes, udatmodfactura, UDatModInventario;


{$R *.DFM}

procedure TqckRepReciboReimp.QRDBText4Print(sender: TObject;
  var Value: String);
begin
 Value :='RNC-'+VALUE;
end;

procedure TqckRepReciboReimp.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepReciboReimp.AllDataSets.Add(dmCompania.tblCompania);
  if Assigned(frmProcVentaRapida) then
  qckRepReciboReimp.AllDataSets.Add(frmProcVentaRapida.Totales)
  else
  qckRepReciboReimp.AllDataSets.Add(frmVentaCafeteria);
end;

procedure TqckRepReciboReimp.QRLabel19Print(sender: TObject; var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckRepReciboReimp.QRLabel20Print(sender: TObject; var Value: String);
begin
  if (valorNCF <> '') then
  begin
    Value:='NCF:'+Trim(valorNCF);
  end else Value:='';
end;

procedure TqckRepReciboReimp.QRLabel24Print(sender: TObject; var Value: String);
begin
  Value := xtipoVenta+ lblCopia;
end;

procedure TqckRepReciboReimp.QRLabel2Print(sender: TObject; var Value: String);
begin
  Value:= 'Numero : ';
end;

procedure TqckRepReciboReimp.QRLabel1Print(sender: TObject; var Value: String);
begin
  if qckRepReciboReimp.xtipoVenta = 'COTIZACION' then
  Value:= 'COTIZACION ';
end;

procedure TqckRepReciboReimp.QRLabel14Print(sender: TObject; var Value: String);
begin
  if not dmFactura.qryVentaFacturaNOMBRE_FACTURAR.IsNull then
  Value :=dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value
  else Value :='';
end;

procedure TqckRepReciboReimp.ChildBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrLabel27.Caption:= GlbPiedePaginaFactura;
end;

procedure TqckRepReciboReimp.ChildBand4BeforePrint(Sender: TQRCustomBand;
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

procedure TqckRepReciboReimp.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  Value:=Value;
end;

procedure TqckRepReciboReimp.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
end;

procedure TqckRepReciboReimp.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
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

procedure TqckRepReciboReimp.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmCompania.tblCompaniaOBSERVACION.IsNull then
  PageHeaderBand1.HasChild:=false;
end;

procedure TqckRepReciboReimp.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
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
        qckRepReciboReimp.QRLabel26.Enabled := False;
        qckRepReciboReimp.QRDBText20.Enabled:= False;
      end;
    end else
    if not dmFactura.qryVentaFacturaDetTIPO_UNIDAD.IsNull and (GlbImpTUnidadEnRcbo = 1) then
    begin
      QRSubDetail1.Height := 54;
    end else
    begin
      QRSubDetail1.Height := 37;
      //QRDBText22.Enabled:=False;
      if GlbImpCodProducto = 0 then
      begin
        QRSubDetail1.Height := 20;
        qckRepReciboReimp.QRLabel26.Enabled := False;
        qckRepReciboReimp.QRDBText20.Enabled:= False;
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
      qckRepReciboReimp.QRLabel26.Enabled := False;
      qckRepReciboReimp.QRDBText20.Enabled:= False;
    end;
  end;
end;

procedure TqckRepReciboReimp.ChildBand9BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Length(dmFactura.qryVentaFacturaDetSERIE_PROD.Value) = 0 then
  ChildBand9.HasChild:= False;
end;

procedure TqckRepReciboReimp.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
end;

procedure TqckRepReciboReimp.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;

end;

procedure TqckRepReciboReimp.ColumnHeaderBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  //if not dmFactura.qryVentaFacturaRNC_NUMERO.IsNull then
  //qrLabelRNC.Caption :='RNC'+dmFactura.qryVentaFacturaRNC_NUMERO.Value
  //else qrLabelRNC.Caption :='';  dmfactura.qryVentaFactura.sql.text;
  if dmFactura.qryVentaFacturaRNC_NUMERO.IsNull then
  ChildBand2.Height:=0;
end;

procedure TqckRepReciboReimp.QRDBText18Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  //if Length(Value) = 9 then
  Value:='RNC CLIENTE:'+Value
  ELSE
  Value:='';
  //else Value:='CÉDULA:'+Value;

end;

procedure TqckRepReciboReimp.QRDBText24Print(sender: TObject;
  var Value: String);
begin
  Value:='Válida hasta:'+Value;
end;

procedure TqckRepReciboReimp.ChildBand11BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmFactura.qryVentaFacturaNUMERO_NCF.IsNull then
  ColumnHeaderBand1.Height:=21;
end;

procedure TqckRepReciboReimp.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  dmreportes.qryFPagoTicket.Close;
  dmreportes.qryFPagoTicket.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
  dmreportes.qryFPagoTicket.Open;
  if dmreportes.qryFPagoTicketDESCRIPCIONDGII.IsNull then
  Value:='Efectivo'
  else if not dmreportes.qryFPagoTicketDESCRIPCIONDGII.IsNull then
  Value:= dmreportes.qryFPagoTicketDESCRIPCIONDGII.Value;
  {
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
 end;   }
end;

end.
