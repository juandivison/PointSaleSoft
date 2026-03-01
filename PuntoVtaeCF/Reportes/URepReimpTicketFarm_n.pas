unit URepReimpTicketFarm_n;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepReciboReimpTicketFarmacia = class(TQuickRep)
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
    QRLabel22: TQRLabel;
    ChildBand8: TQRChildBand;
    QRLabel24: TQRLabel;
    QRDBText25: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText8: TQRDBText;
    QRExpr5: TQRExpr;
    QRDBText16: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel27: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel23: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel33: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText18: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel29: TQRLabel;
    QRSysData1: TQRSysData;
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
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QRLabel20Print(sender: TObject; var Value: String);
    procedure QRLabel24Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure ChildBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure ChildBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRSysData1Print(sender: TObject; var Value: String);
    procedure ChildBand7AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
    procedure ChildBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand8BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand9BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure QRLabel12Print(sender: TObject; var Value: String);
  private
    procedure ProcIncrementaPapel;

  public
    valorNCF : String[19];
    ncfDesc  : String;
    xtipoVenta : String;
    nombreCteGenerico : String;
    strcopia : String;
  end;
var
  qckRepReciboReimpTicketFarmacia: TqckRepReciboReimpTicketFarmacia;
  tRec:integer;
//  lasBandPrint : boolean;
implementation

uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  UDatModReportes, udatmodfactura, UDatModInventario;
           

{$R *.DFM}

procedure TqckRepReciboReimpTicketFarmacia.QRDBText4Print(sender: TObject;
  var Value: String);
begin
 Value :='RNC-'+VALUE;
end;

procedure TqckRepReciboReimpTicketFarmacia.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  //qrLabelRNC.Caption:='';
  dmFactura.qryVentaFacturaDet.first;
  tRec:=0;
  if Assigned(qckRepReciboReimpTicketFarmacia) then
  begin
  if (qckRepReciboReimpTicketFarmacia.PageNumber > 1) then
  begin
  end;
  qckRepReciboReimpTicketFarmacia.AllDataSets.Add(dmCompania.tblCompania);
  if Assigned(frmProcVentaRapida) then
  qckRepReciboReimpTicketFarmacia.AllDataSets.Add(frmProcVentaRapida.Totales);

  IF (dmFactura.qryVentaFacturaCODIGO_CTE.Value = 0) THEN
  ChildBand1.Height:=0;
  end;
end;

procedure TqckRepReciboReimpTicketFarmacia.QRLabel19Print(sender: TObject; var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckRepReciboReimpTicketFarmacia.QRLabel20Print(sender: TObject; var Value: String);
begin
  if (valorNCF <> '') then
  begin
    Value:='NCF:'+Trim(valorNCF);
  end else Value:='';
end;

procedure TqckRepReciboReimpTicketFarmacia.QRLabel24Print(sender: TObject; var Value: String);
begin
  Value := xtipoVenta+strCopia;
end;

procedure TqckRepReciboReimpTicketFarmacia.QRLabel2Print(sender: TObject; var Value: String);
begin
  Value:= 'Numero : ';
end;

procedure TqckRepReciboReimpTicketFarmacia.QRLabel1Print(sender: TObject; var Value: String);
begin
  if xtipoVenta = 'COTIZACION' then
  Value:= 'COTIZACION ';
end;

procedure TqckRepReciboReimpTicketFarmacia.ChildBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var
  svalue : string;
begin
  if (xtipoVenta = 'CONTADO') then
  begin

  end;
  QRLabel29.Caption:='';
  svalue:='';
  try
  dmfactura.qrySumCantXTUnidad.First;
  QRLabel29.Caption:='';
  While Not dmfactura.qrySumCantXTUnidad.Eof Do
  begin
    svalue := svalue + dmfactura.qrySumCantXTUnidadBultos.AsString +':'+
    dmfactura.qrySumCantXTUnidadCANT.AsString+' ';
    dmfactura.qrySumCantXTUnidad.Next;
  end;
  if (svalue = '') then
  ChildBand4.Height:=34
  else
  QRLabel29.Caption:='Bultos:'+svalue;
  except
  end; 
  //QRLabel29.Caption:='Bultos:';
end;

procedure TqckRepReciboReimpTicketFarmacia.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  Value:=Value;
end;

procedure TqckRepReciboReimpTicketFarmacia.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
end;

procedure TqckRepReciboReimpTicketFarmacia.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //Original top si no es con itbis exonerado
  //if (dmFactura.qryVentaFacturaDESCRIPCION_NCF.IsNull) or
  //   (Pos('ESPECIAL',UpperCase(dmFactura.qryVentaFacturaDESCRIPCION_NCF.Value)) < 0) THEN
  if (abs(dmFactura.qryVentaFacturaMONTO_EXONERADO_ITBIS.Value) = 0) then
  begin
    QRLabel3.Enabled:=False;
    QRDBText20.Enabled:=False;
    PageFooterBand1.Height:=153;
    //QRLabel34.Top:=72; //nota de credito
    //QRDBText23.Top:=70;//nota de creidto
    QRShape1.Top:=66;
    QRLabel25.Top:=90;
    QRDBText9.Top:=88;
    QRShape2.Top:=111;
    QRLabel12.Top:=116;
    QRLabel13.Top:=132;
    QRDBText13.Top:=132;
    QRDBText11.Top:=115;
  end;
  //ProcIncrementaPapel;  
end;

procedure TqckRepReciboReimpTicketFarmacia.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
end;

procedure TqckRepReciboReimpTicketFarmacia.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
end;

procedure TqckRepReciboReimpTicketFarmacia.ChildBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if length(GlbPiedePaginaFactura) < 37 then
  ChildBand5.height:= 22;
  qrLabel27.Caption:= GlbPiedePaginaFactura;
  //ProcIncrementaPapel;  
end;

procedure TqckRepReciboReimpTicketFarmacia.QRDBText18Print(
  sender: TObject; var Value: String);
begin
  if not dmfactura.qryVentaFacturaFECHAVENCENCF.IsNull then
  Value := 'Válida Hasta:'+FormatDatetime('dd/mm/yyyy',dmfactura.qryVentaFacturaFECHAVENCENCF.Value)
  else
  Value:='Fecha Vence: '+Value;
end;

procedure TqckRepReciboReimpTicketFarmacia.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  //if (dmFactura.qryVentaFacturaDetCANTXUNIDAD.Value > 0) then
  // Value :=Format('%8.2f', [dmFactura.qryVentaFacturaDetCANTIDAD.Value /
  // dmFactura.qryVentaFacturaDetCANTXUNIDAD.Value]);
end;

procedure TqckRepReciboReimpTicketFarmacia.QRSysData1Print(
  sender: TObject; var Value: String);
begin
  Value:='Total Items: '+InttoStr(tRec);
end;

procedure TqckRepReciboReimpTicketFarmacia.ChildBand7AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  Inc(tRec);
end;

procedure TqckRepReciboReimpTicketFarmacia.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrprinter.PageNumber > 1 then
  begin
    PrintBand:=False;
    exit;
  end;
  if (dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value = 0) or
    (dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value = 2) then
  begin
    QRDBText18.Enabled:=False;
    QRLabel5.Top:=32;
    QRDBText15.Top:=32;
    ColumnHeaderBand1.Height:=49;
  end;

  if (UpperCase(dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value) = 'GENERICO') or
     (Pos('GENERICO',UpperCase(dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value)) > 0) then
  begin
    qrLabelRNC.Caption:='';
    QRLabel14.Top:=5;
    if Length(nombreCteGenerico) > 0 then
    ChildBand1.Height:=23
    else ChildBand1.Height:=0;
  end else
  qrLabelRNC.Caption :='RNC CLIENTE:'+dmFactura.qryVentaFacturaRNC_NUMERO.Value;

  if dmFactura.qryVentaFacturaRNC_NUMERO.IsNull or (trim(dmFactura.qryVentaFacturaRNC_NUMERO.Value) = '') then
  begin
    qrLabelRNC.Caption:='';
    QRLabel14.Top:=5;
    if Length(nombreCteGenerico) > 0 then
    ChildBand1.Height:=23
    else ChildBand1.Height:=0;
  end;
end;

procedure TqckRepReciboReimpTicketFarmacia.QRDBText8Print(sender: TObject;
  var Value: String);
begin
 if GlbImpReciboSinPreg = 1 then
  Value:=Value +' L'+InttoStr(tRec);
end;

procedure TqckRepReciboReimpTicketFarmacia.ProcIncrementaPapel;
var flag : boolean;
begin
  {flag:=true;
  repeat
  begin
    if (qckRepReciboReimpTicketFarmacia.PageNumber > 1) then
    begin
      qckRepReciboReimpTicketFarmacia.Page.Length:=qckRepReciboReimpTicketFarmacia.Page.Length + 0.25;
      qckRepReciboReimpTicketFarmacia.Prepare;
     flag:=False;
    end else break;
  end;
  until flag = true;}
end;

procedure TqckRepReciboReimpTicketFarmacia.QuickRepStartPage(
  Sender: TCustomQuickRep);
begin
  //ProcIncrementaPapel;
end;

procedure TqckRepReciboReimpTicketFarmacia.ChildBand2AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
  var
    x : smallint;
begin
  x:=0;
end;

procedure TqckRepReciboReimpTicketFarmacia.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrprinter.PageNumber > 1 then
  PrintBand:=False;
end;

procedure TqckRepReciboReimpTicketFarmacia.ChildBand8BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrprinter.PageNumber > 1 then
  PrintBand:=False;
end;

procedure TqckRepReciboReimpTicketFarmacia.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrprinter.PageNumber > 1 then
  PrintBand:=False;
end;

procedure TqckRepReciboReimpTicketFarmacia.ChildBand9BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrprinter.PageNumber > 1 then
  PrintBand:=False;
end;

procedure TqckRepReciboReimpTicketFarmacia.QRLabel14Print(sender: TObject;
  var Value: String);
begin
  if (trim(nombreCteGenerico) <> '') then
  Value:='NOMBRE CLIENTE:'+nombreCteGenerico
  else
  if GLBCodigoCteFct = 1 then
  Value :='NOMBRE O RAZON SOCIAL:'+dmFactura.qryVentaFacturaCODIGO_CTE.AsString+'-'+dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value
  else  
  Value :='NOMBRE O RAZON SOCIAL:'+dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value;
end;

procedure TqckRepReciboReimpTicketFarmacia.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  dmreportes.qryFPagoTicket.Close;
  dmreportes.qryFPagoTicket.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
  dmreportes.qryFPagoTicket.Open;
  if dmreportes.qryFPagoTicketDESCRIPCIONDGII.IsNull then
  Value:='Efectivo'
  else Value:= dmreportes.qryFPagoTicketDESCRIPCIONDGII.Value;
  Exit;

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
