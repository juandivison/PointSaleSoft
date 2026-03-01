unit URepReimpTicketSurtidoraNew;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db,StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, TBXGraphics;

type
  TqckRepReciboReimpTicketSurtidoraNew = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    qckRepComprobante: TQRBand;
    PageFooterBand1: TQRBand;
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
    QRDBText14: TQRDBText;
    ChildBand8: TQRChildBand;
    QRLabel24: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText8: TQRDBText;
    QRExpr5: TQRExpr;
    QRDBText16: TQRDBText;
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
    SummaryBand1: TQRBand;
    ChildBand11: TQRChildBand;
    ChildBand10: TQRChildBand;
    ChildBand12: TQRChildBand;
    ChildBand13: TQRChildBand;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel29: TQRLabel;
    QRSysData1: TQRSysData;
    QRLoopBand1: TQRLoopBand;
    QRDBText29: TQRDBText;
    QRDBText33: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText21: TQRDBText;
    QRExpr1: TQRExpr;
    ChildBand2: TQRChildBand;
    QRDBText9: TQRDBText;
    QRDBText13: TQRDBText;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText1: TQRDBText;
    ChildBand3: TQRChildBand;
    QRLabel26: TQRLabel;
    QRDBText23: TQRDBText;
    ChildBand4: TQRChildBand;
    ChildBand5: TQRChildBand;
    QRDBText24: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText11: TQRDBText;
    ChildBand6: TQRChildBand;
    QRExprMemo1: TQRExprMemo;
    QRDBText30: TQRDBText;
    qrLablNCFAfectado: TQRLabel;
    ChildBand14: TQRChildBand;
    QRLabel28: TQRLabel;
    qrEncuesta: TQRImage;
    QRImage1: TQRImage;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    qrCodigoSegecf: TQRLabel;
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
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure QRDBText20Print(sender: TObject; var Value: String);
    procedure ChildBand11BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand10BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLoopBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRLoopBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText33Print(sender: TObject; var Value: String);
    procedure QRDBText29Print(sender: TObject; var Value: String);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure ColumnHeaderBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
    procedure ChildBand7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand14BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText12Print(sender: TObject; var Value: String);
  private
    procedure ProcIncrementaPapel;

  public
    valorNCF : String[19];
    xtipoVenta : String;
    nombreCteGenerico : String;
    strcopia : String;
    procedure SetParameterValues;
  end;
var
  qckRepReciboReimpTicketSurtidoraNew: TqckRepReciboReimpTicketSurtidoraNew;
  tRec:integer;
  hCImpreso:boolean;
//  lasBandPrint : boolean;
implementation

uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  UFormVtaCafeteria, UDatModReportes, udatmodfactura, UDatModInventario,
  URepReimpTicketSurtidora, UQrJpgHelper, UUtilecftimbre;
           

{$R *.DFM}

procedure TqckRepReciboReimpTicketSurtidoraNew.QRDBText4Print(sender: TObject;
  var Value: String);
begin
 Value :='RNC-'+VALUE;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if dmCompania.tblCompania.state = dsInactive then
  dmCompania.tblCompania.Open;
  
  hCImpreso:=False;
  //qrLabelRNC.Caption:='';
  dmFactura.qryVentaFacturaDet.first;
  tRec:=0;
  if Assigned(qckRepReciboReimpTicketSurtidoraNew) then
  begin
  if (qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1) then
  begin
  end;
  qckRepReciboReimpTicketSurtidoraNew.AllDataSets.Add(dmCompania.tblCompania);
  if Assigned(frmProcVentaRapida) then
  qckRepReciboReimpTicketSurtidoraNew.AllDataSets.Add(frmProcVentaRapida.Totales)
  else
  qckRepReciboReimpTicketSurtidoraNew.AllDataSets.Add(frmVentaCafeteria);
  IF (dmFactura.qryVentaFacturaCODIGO_CTE.Value = 0) THEN
  ChildBand1.Height:=0;
  end;

  dmreportes.qryFPagoTicket.Close;
  dmreportes.qryFPagoTicket.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
  dmreportes.qryFPagoTicket.Open; //dmreportes.qryFPagoTicket.Sql.Text
  dmreportes.qryFPagoTicket.Last;
  QRLoopBand1.PrintCount:=dmreportes.qryFPagoTicket.RecordCount;
  dmreportes.qryFPagoTicket.First;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRLabel19Print(sender: TObject; var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRLabel20Print(sender: TObject; var Value: String);
begin
  if (valorNCF <> '') then
  begin
    if (valorNCF[1] = 'E') then
    Value:='e-NCF:'+Trim(valorNCF)
    else
    Value:='NCF:'+Trim(valorNCF);
  end else Value:='';
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRLabel24Print(sender: TObject; var Value: String);
begin
  if GlbEsCopia then
     Value :=xtipoVenta+' (COPIA)'
  else
  Value := xtipoVenta+strCopia;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRLabel2Print(sender: TObject; var Value: String);
begin
  Value:= 'Numero : ';
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRLabel1Print(sender: TObject; var Value: String);
begin
  if xtipoVenta = 'COTIZACION' then
  Value:= 'COTIZACION ';
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  Value:=Value;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (GlbMSubTotalSinITBIS = 1) then
  begin
    QRExpr5.Enabled:=True;
    QRExpr5.Visible:=True;
    QRExpr5.BringToFront;
  end else
  begin
    QRExpr1.Enabled:=True;
    QRExpr1.Visible:=True;
    QRExpr1.BringToFront;
  end;
  if (ABS(dmFactura.qryVentaFacturaMONTOPREPAGADO.Value) =0) then
  begin
    QRLabel12.Enabled:=False;
    QRDBText13.Enabled:=False;
    PageFooterBand1.Height:= 86;
  end;
  if (abs(dmFactura.qryVentaFacturaMONTO_EXONERADO_ITBIS.Value) = 0) then
  begin
    QRLabel3.Enabled:=False;
    QRDBText20.Enabled:=False;
    if (ABS(dmFactura.qryVentaFacturaMONTOPREPAGADO.Value) =0) then
    PageFooterBand1.Height:=64
    else
    PageFooterBand1.Height:=86;
    //QRShape1.Top:=66;
    QRLabel12.Top:=70;
    QRLabel12.BringToFront;
    QRLabel12.visible:=true;
    QRDBText13.Top:=70;
    //QRShape2.Top:=86;
  end;
  if (dmFactura.qryVentaFacturaMONTOPREPAGADO.IsNull) and (dmFactura.qryVentaFacturaMONTOPREPAGADO.Value =0) then
  begin
    PageFooterBand1.Height:=64;
  end;
  if dmReportes.qryFPagoTicketMONTO_PAGADO.IsNull or (dmReportes.qryFPagoTicketMONTO_PAGADO.Value = 0) then
  QRLoopBand1.Height:=0;
  if (dmFactura.qryVentaFacturaMONTO_DESCUENTO.Value = 0) or
  (dmFactura.qryVentaFacturaMONTO_DESCUENTO.IsNull) then
  begin
    QRLabel16.Enabled:=False;QRDBText16.Enabled:=False;
    QRLabel17.Top:=QRLabel16.Top;
    QRDBText17.Top:=QRLabel16.Top;
  end;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
  Value:=StringReplace(value,'-','',[]);
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRDBText18Print(
  sender: TObject; var Value: String);
begin
  if not dmfactura.qryVentaFacturaFECHAVENCENCF.IsNull then
  Value := 'Válida Hasta:'+FormatDatetime('dd/mm/yyyy',dmfactura.qryVentaFacturaFECHAVENCENCF.Value)
  else
  Value:='Fecha Vence: '+Value;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  //if (dmFactura.qryVentaFacturaDetCANTXUNIDAD.Value > 0) then
  // Value :=Format('%8.2f', [dmFactura.qryVentaFacturaDetCANTIDAD.Value /
  // dmFactura.qryVentaFacturaDetCANTXUNIDAD.Value]);
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRSysData1Print(
  sender: TObject; var Value: String);
begin
  Value:='Total Items: '+InttoStr(tRec);
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.ChildBand7AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  Inc(tRec);
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrprinter.PageNumber > 1 then
  begin
    PrintBand:=False;
    exit;
  end;
  if (dmFactura.qryVentaFacturaFORMA_PAGO.Value = 6) then
  begin
    dmreportes.qryNCFAfectado.Close;
    dmreportes.qryNCFAfectado.Params[0].Value:= dmFactura.qryVentaFacturaSERIE_NCF_ASIGNADO.Value;
    dmreportes.qryNCFAfectado.Open;
    dmreportes.qryNCFAfectado.First;
    if Not dmreportes.qryNCFAfectadoNUMERO_NCF.IsNull then
    qckRepReciboReimpTicketSurtidoraNew.qrLablNCFAfectado.Caption:='NCF modificado:'+
    dmreportes.qryNCFAfectadoNUMERO_NCF.Value;
    if not dmreportes.qryNCFAfectadoNUMERO_NCF.IsNull then
    begin
    qckRepReciboReimpTicketSurtidoraNew.qrLablNCFAfectado.Enabled:=True;
    qckRepReciboReimpTicketSurtidoraNew.ColumnHeaderBand1.Height:=88;
    end else
    begin
      qckRepReciboReimpTicketSurtidoraNew.qrLablNCFAfectado.Enabled:=False;
      qckRepReciboReimpTicketSurtidoraNew.ColumnHeaderBand1.Height:=66;
    end;
  end else          
  if (dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value = 0) or
    (dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value = 2) then
  begin
    QRDBText18.Enabled:=False;
    QRLabel5.Top  :=33;
    QRDBText15.Top:=33;
    qckRepReciboReimpTicketSurtidoraNew.qrLablNCFAfectado.Enabled:=False;
    if (dmFactura.qryVentaFacturaFORMA_PAGO.Value <> 6) then
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
  //if (hCImpreso) then
  //begin
  //  ColumnHeaderBand1.Height:=0;
  //end;  
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if (GlBCuadros = 1) or (GLBImpComAdic = 1) then
  begin
    if not dmFactura.qryVentaFacturaDetDESCRIPCIONADICIONAL.IsNull
    and (Length(dmFactura.qryVentaFacturaDetDESCRIPCIONADICIONAL.Value)>0) then
    value:=value+''#13''+dmFactura.qryVentaFacturaDetDESCRIPCIONADICIONAL.Value
  end else 
  if GlbImpReciboSinPreg = 1 then
  Value:=Value +' L'+InttoStr(tRec);
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.ProcIncrementaPapel;
var flag : boolean;
begin
  {flag:=true;
  repeat
  begin
    if (qckRepReciboReimpTicketSurtidora.PageNumber > 1) then
    begin
      qckRepReciboReimpTicketSurtidora.Page.Length:=qckRepReciboReimpTicketSurtidora.Page.Length + 0.25;
      qckRepReciboReimpTicketSurtidora.Prepare;
     flag:=False;
    end else break;
  end;
  until flag = true;}
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.ChildBand8BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrprinter.PageNumber > 1 then
  PrintBand:=False;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrprinter.PageNumber > 1 then
  PrintBand:=False;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.ChildBand9BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrprinter.PageNumber > 1 then
  PrintBand:=False;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRLabel14Print(sender: TObject;
  var Value: String);
begin
  if (trim(nombreCteGenerico) <> '') then
  Value:='NOMBRE CLIENTE:'+nombreCteGenerico
  else
  if GLBCodigoCteFct = 1 then
  Value :='NOMBRE O RAZON SOCIAL:'+dmFactura.qryVentaFacturaCODIGO_CTE.AsString+'-'+dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value
  else
  Value :='NOMBRE O RAZON SOCIAL:'+dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRDBText10Print(
  sender: TObject; var Value: String);
begin
  Value:=StringReplace(value,'-','',[]); 
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRDBText16Print(
  sender: TObject; var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRDBText17Print(
  sender: TObject; var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRDBText20Print(
  sender: TObject; var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.ChildBand11BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
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
  ChildBand11.Height:=34
  else
  QRLabel29.Caption:='Bultos:'+svalue;
  except
  end;
  if dmFactura.qryVentaFacturaComentario.IsNull then
  begin
     ChildBand11.Height:=55;
  end else
  ChildBand11.Height:=76;
  //QRLabel29.Caption:='Bultos:';
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.ChildBand10BeforePrint(
Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  //if length(GlbPiedePaginaFactura) < 37 then
  //qckRepReciboReimpTicketSurtidoraNew.ChildBand10.height:= 22;
  //qckRepReciboReimpTicketSurtidoraNew.qrLabel27.Caption:= GlbPiedePaginaFactura;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRLoopBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  dmreportes.qryFPagoTicket.Next;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRLoopBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if dmReportes.qryFPagoTicketMONTOPAGADODET.Value = 0 then
  begin
    QRLoopBand1.Height:=0;
  end else
  begin
    if dmReportes.qryFPagoTicket.RecordCount > 1 then
    QRDBText33.Enabled:=True
    else  QRDBText11.Enabled:=True;
  end;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRDBText33Print(
  sender: TObject; var Value: String);
begin
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
  Value:=StringReplace(value,'-','',[]);
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRDBText29Print(
  sender: TObject; var Value: String);
begin
{
   dmreportes.qryFPagoTicket.Close;
  dmreportes.qryFPagoTicket.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
  dmreportes.qryFPagoTicket.Open;
  if dmreportes.qryFPagoTicketDESCRIPCIONDGII.IsNull then
  Value:='Efectivo'
  else if not dmreportes.qryFPagoTicketDESCRIPCIONDGII.IsNull then
  Value:= dmreportes.qryFPagoTicketDESCRIPCIONDGII.Value;
  exit;
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
}
  Value:=Trim(Value);
  if (GlbFarmacia= 1) then
  begin
    if (Value = 'OTROS 1') then
    Value:='Cxc (ARS)';
  end else
  begin
    if (Value = 'OTROS 1') then
    Value:='C X C';
  end;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRDBText21Print(
  sender: TObject; var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.ColumnHeaderBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  //if qckRepReciboReimpTicketSurtidoraNew.PageNumber > 1 then
  hCImpreso:=True;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (hCImpreso) then
  begin
    PrintBand:=False;
  end;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.SummaryBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (dmFactura.qryVentaFacturaMonto_Cambio.Value = 0) or
     (dmFactura.qryVentaFacturaMONTO_CAMBIO.IsNull) then
  SummaryBand1.Height:=0;   
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRLabel13Print(
  sender: TObject; var Value: String);
begin
  //Value:='#Trn:'+dmFactura.qryVentaFacturaNUMERO.AsString;
  if not dmFactura.qryVentaFacturaNUMERO.IsNull then
  Value := Format('#Trn:%.6d', [dmFactura.qryVentaFacturaNUMERO.AsInteger]);
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRDBText1Print(
  sender: TObject; var Value: String);
begin
  Value:=Value;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.ChildBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
{  if (dmFactura.qryVentaFacturaMONTO_CAMBIO.IsNull) Or
     (dmFactura.qryVentaFacturaMONTO_CAMBIO.Value = 0) then
  begin
    ChildBand2.HasChild:=False;
  end;}
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QuickRepNeedData(
  Sender: TObject; var MoreData: Boolean);
begin
  if not dmFactura.qryVentaFacturaDet.RecordCount =
  dmFactura.qryVentaFacturaDet.RecNo then
  MoreData:=True;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.ChildBand7BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if Length(dmFactura.qryVentaFacturaDetSERIE_PROD.Value) = 0 then
  begin
    ChildBand9.HasChild:= False;
  end;
  if dmFactura.qryVentaFacturaDetSERIE_PROD.IsNull or
     (dmFactura.qryVentaFacturaDetSERIE_PROD.Value = '') then
  begin
    ChildBand5.Height:=0;
  end;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.ChildBand6BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  ChildBand6.Height:=0;
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.ChildBand14BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (GlbImpQREncuesta = 1) and FileExists('qrEncuesta.jpg') then
  qrEncuesta.Picture.LoadFromFile('qrEncuesta.jpg');
end;
                                              
procedure TqckRepReciboReimpTicketSurtidoraNew.ChildBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
   codseg,femision,rutaqr: string;
begin
  if (GlbActivaECF = 0) or (GlbValidarECF = 0)  then
  PrintBand:=False else PrintBand:=True;

{  if GlbActivaECF = 0 then
  begin
    ChildBand4.Height:=0;
    QRImage1.Visible:= False;
    QRLabel30.Visible:= False;
    QRLabel31.Visible:= False;
    qrCodigoSegecf.Visible:= False;
    qrFechaFDigital.Visible:= False;
  end else
  begin
    rutaqr:=UUtilecftimbre.GetRutaTimbre(dmFactura.qryVentaFacturaNUMERO.Value,codseg,femision);
    if FileExists(rutaqr) then
    begin
      //LogInformacionTxt('Asignando CodigoQR ->'+rutaqr+ ' codseg='+codseg);
      QRImage1.Picture.LoadFromFile(rutaqr);
      qrCodigoSegecf.Caption :=codseg;
      qrFechaFDigital.Caption:=femision;
      ChildBand4.HasChild:=False;
      PrintBand:=True;
    end else
    begin
      LogInformacionTxt('Ruta codigo QR, no existe ->'+rutaqr);
      ChildBand4.Height:=0;
    end;
  end;}
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.QRDBText12Print(
  sender: TObject; var Value: String);
begin
  if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
  Value := Format('%.6d', [dmFactura.qryVentaFacturaNUMERO_FACTURA.AsInteger]);
end;

procedure TqckRepReciboReimpTicketSurtidoraNew.SetParameterValues;
var
   codseg,femision,rutaqr, urlimage: string;
begin
  if (dmFactura.qryVentaFacturaMONTO_CAMBIO.IsNull) Or
     (dmFactura.qryVentaFacturaMONTO_CAMBIO.Value = 0) then
  begin
    ChildBand2.HasChild:=False;
  end;
  if GlbActivaECF = 0 then
  begin
    ChildBand4.Height:=0;
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
       qckRepReciboReimpTicketSurtidoraNew.PrinterSettings.PrinterIndex );
       qrCodigoSegecf.Caption := codseg;
       qrFechaFDigital.Caption:= femision;
       ChildBand4.HasChild    := false;
    end else
    begin
      rutaqr:=UUtilecftimbre.GetRutaTimbre(dmFactura.qryVentaFacturaNUMERO.Value,codseg,femision);
      if FileExists(rutaqr) then
      begin
        QRImage1.Picture.LoadFromFile(rutaqr);
        qrCodigoSegecf.Caption :=codseg;
        qrFechaFDigital.Caption:=femision;
        ChildBand4.HasChild:=False;
        //t PrintBand:=True;
      end else
      begin
        LogInformacionTxt('Ruta codigo QR, no existe ->'+rutaqr);
        ChildBand4.Height:=0;
      end;
    end;
  end; 
  if length(GlbPiedePaginaFactura) < 37 then
  qckRepReciboReimpTicketSurtidoraNew.ChildBand10.height:= 22;
  qckRepReciboReimpTicketSurtidoraNew.qrLabel27.Caption:= GlbPiedePaginaFactura;
end;

end.
