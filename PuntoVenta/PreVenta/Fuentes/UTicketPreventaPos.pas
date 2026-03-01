unit UTicketPreventaPos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckTicketPreventaPos = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    qckRepComprobante: TQRBand;
    SummaryBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    qrLabelRNC: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel10: TQRLabel;
    ChildBand2: TQRChildBand;
    ChildBand3: TQRChildBand;
    QRLabel32: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    ChildBand4: TQRChildBand;
    ChildBand5: TQRChildBand;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel19: TQRLabel;
    ChildBand6: TQRChildBand;
    ChildBand7: TQRChildBand;
    QRLabel23: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText22: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel12: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText7: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    ChildBand8: TQRChildBand;
    QRLabel1: TQRLabel;
    procedure QRLabel24Print(sender: TObject; var Value: String);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure ChildBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRLabel14Print(sender: TObject; var Value: String);
  private

  public
    valorNCF : String[19];
    ncfDesc  : String;
    xtipoVenta : String;
    nombreCteGenerico : String;
    
  end;

var
  qckTicketPreventaPos: TqckTicketPreventaPos;

implementation
uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  URepComprobante_II, UDatModFactura;
{$R *.DFM}

procedure TqckTicketPreventaPos.QRLabel24Print(sender: TObject;
  var Value: String);
begin
  Value := xtipoVenta;
end;

procedure TqckTicketPreventaPos.QRLabel19Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckTicketPreventaPos.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qrLabelRNC.Caption:='';
  qckTicketPreventaPos.AllDataSets.Add(dmCompania.tblCompania);
  qckTicketPreventaPos.AllDataSets.Add(dmFactura.qryVtaConDeliveryTrn);
end;

procedure TqckTicketPreventaPos.QRDBText4Print(sender: TObject;
  var Value: String);
begin
 Value :='RNC-'+VALUE;
end;

procedure TqckTicketPreventaPos.ChildBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if dmFactura.qryVtaConDeliveryTrn.RecordCount = 0 then
  ChildBand5.Height:=0;
end;

procedure TqckTicketPreventaPos.QRLabel14Print(sender: TObject;
  var Value: String);
begin
  if (nombreCteGenerico <> '') then
  Value:=nombreCteGenerico
  else if not frmProcVentaRapida.qryTicketPreventaMastNOMBRE_CLIENTE_GENERAL.IsNull then
  Value:=frmProcVentaRapida.qryTicketPreventaMastNOMBRE_CLIENTE_GENERAL.Value;
end;

end.
