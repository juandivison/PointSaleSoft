unit URepReimpFastFoodPOS;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepReciboReimpFFoodPOS = class(TQuickRep)
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
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText14: TQRDBText;
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
    ChildBand2: TQRChildBand;
    ChildBand7: TQRChildBand;
    ChildBand11: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText15: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText22: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText26: TQRDBText;
    QRLoopBand1: TQRLoopBand;
    QRDBText28: TQRDBText;
    QRDBText33: TQRDBText;
    SummaryBand1: TQRBand;
    ChildBand14: TQRChildBand;
    QRLabel28: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    ChildBand15: TQRChildBand;
    QRLabel21: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel22: TQRLabel;
    ChildBand16: TQRChildBand;
    QRLabel27: TQRLabel;
    ChildBand17: TQRChildBand;
    QRLabel23: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    ChildBand3: TQRChildBand;
    ChildBand4: TQRChildBand;
    ChildBand5: TQRChildBand;
    ChildBand6: TQRChildBand;
    ChildBand12: TQRChildBand;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel25: TQRLabel;
    QRShape2: TQRShape;
    QRDBText9: TQRDBText;
    QRShape1: TQRShape;
    QRLabel36: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
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
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText26Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure ChildBand16BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand14BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLoopBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ChildBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand15AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public
    valorNCF : String[19];
    ncfDesc  : String;
    xtipoVenta : String;
    nombreCteGenerico : String;
    strcopia : String;
  end;
var
  qckRepReciboReimpFFoodPOS: TqckRepReciboReimpFFoodPOS;

implementation

uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  UFormVtaCafeteria, UDatModReportes, udatmodfactura, UDatModInventario;



{$R *.DFM}

procedure TqckRepReciboReimpFFoodPOS.QRDBText4Print(sender: TObject;
  var Value: String);
begin
 Value :='RNC-'+VALUE;
end;

procedure TqckRepReciboReimpFFoodPOS.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  //qrLabelRNC.Caption:='';
  qckRepReciboReimpFFoodPOS.AllDataSets.Add(dmCompania.tblCompania);
  qckRepReciboReimpFFoodPOS.AllDataSets.Add(dmFactura.qryVentaFactura);  
  if Assigned(frmProcVentaRapida) then
  qckRepReciboReimpFFoodPOS.AllDataSets.Add(frmProcVentaRapida.Totales)
  else
  if Assigned(frmVentaCafeteria) then
  qckRepReciboReimpFFoodPOS.AllDataSets.Add(frmVentaCafeteria);

  dmreportes.qryFPagoTicket.Close;
  dmreportes.qryFPagoTicket.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
  dmreportes.qryFPagoTicket.Open;
  dmreportes.qryFPagoTicket.Last;
  QRLoopBand1.PrintCount:=dmreportes.qryFPagoTicket.RecordCount;
  dmreportes.qryFPagoTicket.First;  
end;

procedure TqckRepReciboReimpFFoodPOS.QRLabel19Print(sender: TObject; var Value: String);
begin
  Value:=VarNombreUsuario + ' #Trn:'+dmFactura.qryVentaFacturaNUMERO.AsString;;
end;

procedure TqckRepReciboReimpFFoodPOS.QRLabel20Print(sender: TObject; var Value: String);
begin
  if (valorNCF <> '') then
  begin
    Value:='NCF:'+ Trim(valorNCF);
  end else Value:='';
end;

procedure TqckRepReciboReimpFFoodPOS.QRLabel24Print(sender: TObject; var Value: String);
begin
  Value := xtipoVenta+strCopia;
end;

procedure TqckRepReciboReimpFFoodPOS.QRLabel2Print(sender: TObject; var Value: String);
begin
  Value:= 'Número : ';
end;

procedure TqckRepReciboReimpFFoodPOS.QRLabel1Print(sender: TObject; var Value: String);
begin
  if qckRepReciboReimpFFoodPOS.xtipoVenta = 'COTIZACION' then
  Value:= 'COTIZACION ';
end;

procedure TqckRepReciboReimpFFoodPOS.QRLabel14Print(sender: TObject; var Value: String);
begin
  if (trim(nombreCteGenerico) <> '') then
  Value:='NOMBRE CLIENTE:'+nombreCteGenerico
  else if GLBCodigoCteFct = 1 then
  Value :='NOMBRE O RAZON SOCIAL:'+dmFactura.qryVentaFacturaCODIGO_CTE.AsString+'-'+dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value
  else Value :='NOMBRE O RAZON SOCIAL:'+dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value;
end;

procedure TqckRepReciboReimpFFoodPOS.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
end;

procedure TqckRepReciboReimpFFoodPOS.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
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

procedure TqckRepReciboReimpFFoodPOS.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmCompania.tblCompaniaOBSERVACION.IsNull then
  PageHeaderBand1.HasChild:=false;
end;

procedure TqckRepReciboReimpFFoodPOS.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
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
        qckRepReciboReimpFFoodPOS.QRLabel26.Enabled := False;
        qckRepReciboReimpFFoodPOS.QRDBText20.Enabled:= False;
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
        qckRepReciboReimpFFoodPOS.QRLabel26.Enabled := False;
        qckRepReciboReimpFFoodPOS.QRDBText20.Enabled:= False;
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
      qckRepReciboReimpFFoodPOS.QRLabel26.Enabled := False;
      qckRepReciboReimpFFoodPOS.QRDBText20.Enabled:= False;
    end;
  end;
end;

procedure TqckRepReciboReimpFFoodPOS.ChildBand9BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Length(dmFactura.qryVentaFacturaDetSERIE_PROD.Value) = 0 then
  ChildBand9.HasChild:= False;
end;

procedure TqckRepReciboReimpFFoodPOS.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
end;

procedure TqckRepReciboReimpFFoodPOS.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;

end;

procedure TqckRepReciboReimpFFoodPOS.ColumnHeaderBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  //if not dmFactura.qryVentaFacturaRNC_NUMERO.IsNull then
  //begin
  //  qrLabelRNC.Visible:=True;
  //  qrLabelRNC.Enabled:=true;
   // qrLabelRNC.BringToFront;
    //qrLabelRNC.Caption :='RNC'+dmFactura.qryVentaFacturaRNC_NUMERO.Value
  //end
  //else qrLabelRNC.Caption :='';
end;

procedure TqckRepReciboReimpFFoodPOS.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  //f (Value <> '') then
  //f Length(Value) = 9 then
  Value:='RNC CLIENTE:'+Value
  //else Value:='CÉDULA:'+Value;
end;

procedure TqckRepReciboReimpFFoodPOS.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  IF dmFactura.qryVentaFacturaRNC_NUMERO.IsNull then
  ChildBand2.Height:=1;
  if (dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value = 0) or
  (dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value = 2) then
  ChildBand1.Height:=1; 
end;

procedure TqckRepReciboReimpFFoodPOS.QRDBText26Print(sender: TObject;
  var Value: String);
begin
  Value:='Válida hasta:'+Value;
end;

procedure TqckRepReciboReimpFFoodPOS.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' NCF:'+dmFactura.qryVentaFacturaNUMERO_NCF.Value;
end;

procedure TqckRepReciboReimpFFoodPOS.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  dmreportes.qryFPagoTicket.Close;
  dmreportes.qryFPagoTicket.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
  dmreportes.qryFPagoTicket.Open;
  //if dmreportes.qryFPagoTicketDESCRIPCIONDGII.IsNull then
  //Value:='Efectivo'
  //else Value:= dmreportes.qryFPagoTicketDESCRIPCIONDGII.Value;
  
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
 end; }
end;

procedure TqckRepReciboReimpFFoodPOS.ChildBand16BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrLabel27.Caption:= GlbPiedePaginaFactura;
end;

procedure TqckRepReciboReimpFFoodPOS.SummaryBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (dmFactura.qryVentaFacturaMonto_Cambio.Value = 0) or
     (dmFactura.qryVentaFacturaMONTO_CAMBIO.IsNull) then
  SummaryBand1.Height:=0;
end;

procedure TqckRepReciboReimpFFoodPOS.ChildBand14BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (xtipoVenta = 'CONTADO') then
  begin
    QRLabel28.Enabled:=False;
    QRLabel29.Enabled:=False;
    QRLabel31.Enabled:=False;
    QRLabel30.Enabled:=False;
    ChildBand14.Height:=1;
  end;
end;

procedure TqckRepReciboReimpFFoodPOS.QRLoopBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  dmreportes.qryFPagoTicket.Next;
end;

procedure TqckRepReciboReimpFFoodPOS.ChildBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if dmFactura.qryVentaFacturaMONTO_RECARGO.Value = 0 then
  begin
    QRLabel37.Enabled:=False;
    QRDBText24.Enabled:=False;
    ChildBand3.Height:=0;
  end;
end;

procedure TqckRepReciboReimpFFoodPOS.ChildBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if dmFactura.qryVentaFacturaMONTO_DESCUENTO.Value = 0 then
  begin
    ChildBand4.Height:=0;
  end;
end;

procedure TqckRepReciboReimpFFoodPOS.ChildBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if dmFactura.qryVentaFacturaMONTO_TOTAL_ITBIS.Value = 0 then
  begin
    ChildBand5.Height:=0;
  end;
end;

procedure TqckRepReciboReimpFFoodPOS.ChildBand6BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if dmFactura.qryVentaFacturaPROPINALEGAL.Value = 0 then
  begin
    ChildBand6.Height:=0;
  end;
end;

procedure TqckRepReciboReimpFFoodPOS.ChildBand15AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if (GlbPiedePaginaFactura = '') then
  ChildBand16.Height:=0;
end;

end.
