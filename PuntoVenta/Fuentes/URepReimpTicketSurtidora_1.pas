unit URepReimpTicketSurtidora_1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepReciboReimpTicketSurtidora_1 = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ChildBand1: TQRChildBand;
    ColumnHeaderBand1: TQRBand;
    ChildBand2: TQRChildBand;
    ChildBand3: TQRChildBand;
    ChildBand4: TQRChildBand;
    PageFooterBand1: TQRBand;
    ChildBand5: TQRChildBand;
    ChildBand6: TQRChildBand;
    ChildBand7: TQRChildBand;
    QRLabel18: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel25: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRExpr5: TQRExpr;
    QRDBText16: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel29: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRSysData2: TQRSysData;
    ChildBand8: TQRChildBand;
    QRLabel23: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel14: TQRLabel;
    qrLabelRNC: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape3: TQRShape;
    QRSubDetail1: TQRSubDetail;
    DetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    ChildBand9: TQRChildBand;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText6: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand9AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private

  public
    valorNCF : String[19];
    ncfDesc  : String;
    xtipoVenta : String;
    nombreCteGenerico : String;
    strcopia : String;
  end;

var
  qckRepReciboReimpTicketSurtidora_1: TqckRepReciboReimpTicketSurtidora_1;
  tRec:integer;

implementation

uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  UFormVtaCafeteria, UDatModReportes, udatmodfactura, UDatModInventario;

{$R *.DFM}

procedure TqckRepReciboReimpTicketSurtidora_1.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  //qrLabelRNC.Caption:='';
  dmFactura.qryVentaFacturaDet.first;
  tRec:=0;
  if (qckRepReciboReimpTicketSurtidora_1.PageNumber > 1) then
  begin
  end;
  qckRepReciboReimpTicketSurtidora_1.AllDataSets.Add(dmCompania.tblCompania);
  if Assigned(frmProcVentaRapida) then
  qckRepReciboReimpTicketSurtidora_1.AllDataSets.Add(frmProcVentaRapida.Totales)
  else
  qckRepReciboReimpTicketSurtidora_1.AllDataSets.Add(frmVentaCafeteria);
  IF (dmFactura.qryVentaFacturaCODIGO_CTE.Value = 0) THEN
  ChildBand2.Height:=0;
end;

procedure TqckRepReciboReimpTicketSurtidora_1.ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
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
    QRLabel12.Top:=5;
    ChildBand2.Height:=0;
  end else
  qrLabelRNC.Caption :='RNC CLIENTE:'+dmFactura.qryVentaFacturaRNC_NUMERO.Value;
end;

procedure TqckRepReciboReimpTicketSurtidora_1.ChildBand9AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  Inc(tRec);
end;

procedure TqckRepReciboReimpTicketSurtidora_1.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
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

procedure TqckRepReciboReimpTicketSurtidora_1.ChildBand5BeforePrint(Sender: TQRCustomBand;
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
  ChildBand5.Height:=34
  else
  QRLabel29.Caption:='Bultos:'+svalue;
  except
  end;
end;

procedure TqckRepReciboReimpTicketSurtidora_1.ChildBand6BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if length(GlbPiedePaginaFactura) < 37 then
  ChildBand6.height:= 22;
  qrLabel27.Caption:= GlbPiedePaginaFactura;
end;

end.
