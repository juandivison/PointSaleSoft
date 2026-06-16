unit URepReimpTicketFarm_ARS;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckRepReciboReimpTicketFarmaciaARS = class(TQuickRep)
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
    QRLabel5: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel11: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel25: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRDBText14: TQRDBText;
    ChildBand8: TQRChildBand;
    QRLabel24: TQRLabel;
    QRDBText25: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText8: TQRDBText;
    QRExpr5: TQRExpr;
    QRDBText16: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText18: TQRDBText;
    ChildBand7: TQRChildBand;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText6: TQRDBText;
    ChildBand9: TQRChildBand;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    qrLabelRNC: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText20: TQRDBText;
    QRLoopBand1: TQRLoopBand;
    QRDBText29: TQRDBText;
    QRDBText33: TQRDBText;
    rbSummary1: TQRBand;
    ChildBand10: TQRChildBand;
    ChildBand11: TQRChildBand;
    ChildBand12: TQRChildBand;
    ChildBand13: TQRChildBand;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel27: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText32: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    qrCompania: TQRLabel;
    qrCliente: TQRLabel;
    qrCedula: TQRLabel;
    qrTelefono: TQRLabel;
    qrAfiliado: TQRLabel;
    qrdbCompania: TQRDBText;
    qrdbCliente: TQRDBText;
    qrdbCedula: TQRDBText;
    qrDbTelefono: TQRDBText;
    qrDbAfiliado: TQRDBText;
    ChildBand2: TQRChildBand;
    QRLabel23: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText23: TQRDBText;
    QRLabel6: TQRLabel;
    ChildBand3: TQRChildBand;
    QRImage1: TQRImage;
    QRLabel30: TQRLabel;
    qrCodigoSegecf: TQRLabel;
    QRLabel31: TQRLabel;
    qrFechaFDigital: TQRLabel;
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QRLabel20Print(sender: TObject; var Value: String);
    procedure QRLabel24Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRSysData1Print(sender: TObject; var Value: String);
    procedure ChildBand7AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure ChildBand8BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand9BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure QRLoopBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRLoopBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand10BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand11BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText33Print(sender: TObject; var Value: String);
    procedure QRDBText29Print(sender: TObject; var Value: String);
    procedure ColumnHeaderBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
    procedure ChildBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    procedure ProcIncrementaPapel;

  public
    valorNCF : String[19];
    ncfDesc  : String;
    xtipoVenta : String;
    nombreCteGenerico : String;
    strcopia : String;
    procedure SetParameterValues;
  end;
var
  qckRepReciboReimpTicketFarmaciaARS: TqckRepReciboReimpTicketFarmaciaARS;
  tRec:integer;
  hCImpreso:boolean;
//  lasBandPrint : boolean;
implementation

uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  UDatModReportes, udatmodfactura, UDatModInventario,UQrJpgHelper, UUtilecftimbre;
           

{$R *.DFM}

procedure TqckRepReciboReimpTicketFarmaciaARS.QRDBText4Print(sender: TObject;
  var Value: String);
begin
 Value :='RNC-'+VALUE;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  hCImpreso:=False;

  dmFactura.qryDatosVtaARS.Close;
  dmFactura.qryDatosVtaARS.Params[0].Value := dmFactura.qryVentaFacturaNUMERO.Value;
  dmFactura.qryDatosVtaARS.Open;
  dmFactura.qryDatosVtaARS.First;
  if (dmFactura.qryDatosVtaARS.RecordCount = 0) then
  ChildBand10.Enabled:=False;

  dmFactura.qryVentaFacturaDet.first;
  tRec:=0;

  qckRepReciboReimpTicketFarmaciaARS.AllDataSets.Add(dmCompania.tblCompania);
  qckRepReciboReimpTicketFarmaciaARS.AllDataSets.Add(dmfactura.qryDatosVtaARS);
  qckRepReciboReimpTicketFarmaciaARS.AllDataSets.Add(dmFactura.qryVentaFacturaDet);

  if Assigned(frmProcVentaRapida) then
    qckRepReciboReimpTicketFarmaciaARS.AllDataSets.Add(frmProcVentaRapida.Totales);

  if (dmFactura.qryVentaFacturaCODIGO_CTE.Value = 0) THEN
    ChildBand1.Height:=0;

  if (dmFactura.qryDatosVtaARS.RecordCount = 0) then
  begin
    ChildBand10.Height:=0;
    ChildBand1.Height :=40;
  end else
  begin
    ChildBand1.Height:=95;
    QRLabel14.Enabled:=False;
    QRLabel14.Visible := False;
    qrLabelRNC.Enabled:=False;
    qrLabelRNC.Visible:= False;

    qrCompania.Top  := 3;
    qrdbCompania.Top:= 3;
    qrCliente.Top   := 21;
    qrdbCliente.Top := 21;
    qrCedula.Top    := 40;
    qrdbCedula.Top  := 40;
    qrTelefono.Top  := 59;
    qrDbTelefono.Top:= 59;
    qrAfiliado.Top  := 78;
    qrDbAfiliado.Top:= 78;
  end;

  dmreportes.qryFPagoTicket.Close;
  dmreportes.qryFPagoTicket.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
  dmreportes.qryFPagoTicket.Open; //dmreportes.qryFPagoTicket.Sql.Text
  dmreportes.qryFPagoTicket.Last;
  QRLoopBand1.PrintCount:=dmreportes.qryFPagoTicket.RecordCount;
  dmreportes.qryFPagoTicket.First;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRLabel19Print(sender: TObject; var Value: String);
begin
  Value:=VarNombreUsuario + '  #Trn:'+dmFactura.qryVentaFacturaNUMERO.AsString;;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRLabel20Print(sender: TObject; var Value: String);
begin
  if (valorNCF <> '') then
  begin
    Value:='NCF:'+Trim(valorNCF);
  end else Value:='';
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRLabel24Print(sender: TObject; var Value: String);
begin
  Value := xtipoVenta+strCopia;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRLabel2Print(sender: TObject; var Value: String);
begin
  Value:= 'Numero : ';
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRLabel1Print(sender: TObject; var Value: String);
begin
  if xtipoVenta = 'COTIZACION' then
  Value:= 'COTIZACION ';
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  Value:=Value;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //Original top si no es con itbis exonerado
  //if (dmFactura.qryVentaFacturaDESCRIPCION_NCF.IsNull) or
  //   (Pos('ESPECIAL',UpperCase(dmFactura.qryVentaFacturaDESCRIPCION_NCF.Value)) < 0) THEN
  if (GlbMSubTotalSinITBIS = 0) then
  begin
    QRExpr2.Enabled:=True;
    QRExpr2.Visible:=True;
    QRExpr2.BringToFront;
  end else
  begin
    QRExpr5.Enabled:=True;
    QRExpr5.Visible:=True;
    QRExpr5.BringToFront;
  end;
  if (abs(dmFactura.qryVentaFacturaMONTO_EXONERADO_ITBIS.Value) = 0) then
  begin
    QRLabel3.Enabled:=False;
    QRDBText20.Enabled:=False;
    PageFooterBand1.Height:=88;
    //QRLabel34.Top:=72; //nota de credito
    //QRDBText23.Top:=70;//nota de creidto
    
    QRShape1.Top:=66;
    QRLabel25.Top:=70;
    QRDBText9.Top:=70;
    //QRShape2.Top:=111;
    //QRLabel12.Top:=116;
    //QRLabel13.Top:=132;
    //QRDBText13.Top:=132;
    //QRDBText11.Top:=115;//montopagado
  end;
  //ProcIncrementaPapel;
  if dmReportes.qryFPagoTicket.State = dsBrowse then
  if dmReportes.qryFPagoTicket.RecordCount = 0 then
  QRLoopBand1.Enabled:=False
  else QRLoopBand1.Enabled:=True;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRDBText18Print(
  sender: TObject; var Value: String);
begin
  if not dmfactura.qryVentaFacturaFECHAVENCENCF.IsNull then
  Value := 'Válida Hasta:'+FormatDatetime('dd/mm/yyyy',dmfactura.qryVentaFacturaFECHAVENCENCF.Value)
  else
  Value:='Fecha Vence: '+Value;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  //if (dmFactura.qryVentaFacturaDetCANTXUNIDAD.Value > 0) then
  // Value :=Format('%8.2f', [dmFactura.qryVentaFacturaDetCANTIDAD.Value /
  // dmFactura.qryVentaFacturaDetCANTXUNIDAD.Value]);
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRSysData1Print(
  sender: TObject; var Value: String);
begin
  Value:='Total Items: '+InttoStr(tRec);
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.ChildBand7AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  Inc(tRec);
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  {if qrprinter.PageNumber > 1 then
  begin
    PrintBand:=False;
    exit;
  end; }
  hCImpreso:=False;
  if ((dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value = 0) or
    (dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value = 2)) and
    ((dmFactura.qryVentaFacturaNUMERO_NCF.Value <> '') or
     (not dmFactura.qryVentaFacturaNUMERO_NCF.IsNull) ) then
  begin
    //if dmFactura.qryVentaFacturaNUMERO_NCF.IsNull then
    //begin
      QRDBText18.Enabled:=False;
      QRLabel5.Top:=32;
      QRDBText15.Top:=32;
      ColumnHeaderBand1.Height:=49;
    //end;
  end;
  if (dmFactura.qryVentaFacturaNUMERO_NCF.IsNull) or (dmFactura.qryVentaFacturaNUMERO_NCF.Value = '') then
  begin
    QRDBText18.Enabled:=False;
    QRLabel5.Top:=32;
    QRDBText15.Top:=32;
    ColumnHeaderBand1.Height:=49;  
  end;

  if (dmFactura.qryDatosVtaARS.Recordcount = 0) then
  begin
    if (UpperCase(dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value) = 'GENERICO') or
     (Pos('GENERICO', UpperCase(dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value)) > 0) then
    begin
      qrLabelRNC.Caption:='';
      QRLabel14.Top:=5;
      if Length(nombreCteGenerico) > 0 then
      ChildBand1.Height:=23
      else ChildBand1.Height:=0;
    end else
    qrLabelRNC.Caption :='RNC CLIENTE:'+dmFactura.qryVentaFacturaRNC_NUMERO.Value;

    if dmFactura.qryVentaFacturaRNC_NUMERO.IsNull OR (trim(dmFactura.qryVentaFacturaRNC_NUMERO.Value) = '') then
    begin
      qrLabelRNC.Caption:='';
      QRLabel14.Top:=5;
      if Length(nombreCteGenerico) > 0 then
      ChildBand1.Height:=23
      else ChildBand1.Height:=0;
    end;
  end;
  if (hCImpreso) then
  begin
    ColumnHeaderBand1.Height:=0;
  end;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if GlbImpReciboSinPreg = 1 then
  Value:=Value +' L'+InttoStr(tRec);
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.ProcIncrementaPapel;
var flag : boolean;
begin

end;

procedure TqckRepReciboReimpTicketFarmaciaARS.ChildBand8BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrprinter.PageNumber > 1 then
  PrintBand:=False;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrprinter.PageNumber > 1 then
  PrintBand:=False;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.ChildBand9BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrprinter.PageNumber > 1 then
  PrintBand:=False;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRLabel14Print(sender: TObject;
  var Value: String);
begin
  if (trim(nombreCteGenerico) <> '') then
  Value:='CLIENTE:'+nombreCteGenerico
  else
  if GLBCodigoCteFct = 1 then
  Value :='RAZON SOCIAL:'+dmFactura.qryVentaFacturaCODIGO_CTE.AsString+'-'+dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value
  else  
  Value :='RAZON SOCIAL:'+dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value;
end;

{
procedure TqckRepReciboReimpTicketFarmaciaARS.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  dmreportes.qryFPagoTicket.Close;
  dmreportes.qryFPagoTicket.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
  dmreportes.qryFPagoTicket.Open;//dmreportes.qryFPagoTicket.Sql.Text
  if dmreportes.qryFPagoTicketDESCRIPCIONDGII.IsNull then
  Value:='Efectivo'
  else Value:= dmreportes.qryFPagoTicketDESCRIPCIONDGII.Value;
  Exit;

  case dmFactura.qryVentaFacturaFORMA_PAGO.Value of
  1  : Value:='Efectivo';
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
 18	 : Value:='CoberturaARS';
 end;
end;
}

procedure TqckRepReciboReimpTicketFarmaciaARS.QRLoopBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  dmreportes.qryFPagoTicket.Next;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRLoopBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qckRepReciboReimpTicketFarmaciaARS.Page.Length:=
  qckRepReciboReimpTicketFarmaciaARS.Page.Length + 0.347;
  if dmReportes.qryFPagoTicket.RecordCount > 1 then
  QRDBText33.Enabled:=True
  else  QRDBText23.Enabled:=True;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.ChildBand10BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  svalue : string;
begin
  if (xtipoVenta = 'CONTADO') then
  begin

  end;
  if dmFactura.qryDatosVtaARS.State = dsBrowse then
  begin
    if dmFactura.qryDatosVtaARS.RecordCount = 0 then
    PrintBand:=False;
  end else PrintBand:=False;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.ChildBand11BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if length(GlbPiedePaginaFactura) < 37 then
  ChildBand11.height:= 22;
  qrLabel27.Caption:= GlbPiedePaginaFactura;
  //ProcIncrementaPapel;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRDBText33Print(
  sender: TObject; var Value: String);
begin
  //if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRDBText29Print(
  sender: TObject; var Value: String);
begin
  Value:=Trim(Value);
  if (Value = 'OTROS 1') then
  Value:='Cxc (ARS)';
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.ColumnHeaderBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  hCImpreso:=True;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (hCImpreso) then
  begin
    PrintBand:=False;
  end; 
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QRLabel6Print(
  sender: TObject; var Value: String);
begin
  Value:='#Trn:'+dmFactura.qryVentaFacturaNUMERO.AsString;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.QuickRepStartPage(
  Sender: TCustomQuickRep);
begin
  //ProcIncrementaPapel;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.ChildBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (GlbActivaECF = 0) or (GlbValidarECF = 0)  then
  PrintBand:=False else PrintBand:=True;
end;

procedure TqckRepReciboReimpTicketFarmaciaARS.SetParameterValues;
var
   codseg,femision,rutaqr, urlimage: string;
begin

  if GlbActivaECF = 0 then
  begin
    ChildBand3.Height:=0;
    QRImage1.Visible:= False;
    QRLabel30.Visible:= False;
    QRLabel31.Visible:= False;
    qrCodigoSegecf.Visible:= False;
    qrFechaFDigital.Visible:= False;
  end else
  begin
    urlimage:=GetUrlImageTimbre(dmFactura.qryVentaFacturaNUMERO.Value,codseg,femision);
    if (urlimage <> '') then
    begin
       SetQrUrlAsJpgToQRImage(
       urlImage,
       QRImage1,
       45,  // mm (ajústalo si quieres más grande/pequeño)
       PrinterSettings.PrinterIndex );
       qrCodigoSegecf.Caption := codseg;
       qrFechaFDigital.Caption:= femision;
    end else
    begin
      rutaqr:=UUtilecftimbre.GetRutaTimbre(dmFactura.qryVentaFacturaNUMERO.Value,codseg,femision);
      if FileExists(rutaqr) then
      begin
        QRImage1.Picture.LoadFromFile(rutaqr);
        qrCodigoSegecf.Caption :=codseg;
        qrFechaFDigital.Caption:=femision;
      end else
      begin
        LogInformacionTxt('Ruta codigo QR, no existe ->'+rutaqr);
        ChildBand3.Height:=0;
      end;
    end;
  end;
 
  if length(GlbPiedePaginaFactura) < 37 then
  ChildBand10.height:= 22;
  qrLabel27.Caption:= GlbPiedePaginaFactura;
end;

end.
