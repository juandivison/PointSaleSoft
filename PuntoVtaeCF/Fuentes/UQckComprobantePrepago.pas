unit UQckComprobantePrepago;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckComprobanteAbonoPrep = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel3: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    PageFooterBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText10: TQRDBText;
    ChildBand1: TQRChildBand;
    QRDBText11: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure PageHeaderBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public
     hCImpreso : boolean;
  end;

var
  qckComprobanteAbonoPrep: TqckComprobanteAbonoPrep;

   
implementation
uses UDatModCompania, UGlobal, UDatModFactura;
{$R *.DFM}

procedure TqckComprobanteAbonoPrep.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  hCImpreso:=False;
  qckComprobanteAbonoPrep.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckComprobanteAbonoPrep.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  Value:='Cliente:'+Value;
end;

procedure TqckComprobanteAbonoPrep.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  Value:='Celular:'+Value;
end;

procedure TqckComprobanteAbonoPrep.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  Value:='Forma Pago: '+Value;
end;

procedure TqckComprobanteAbonoPrep.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  Value:='Usuario: '+Value;
end;

procedure TqckComprobanteAbonoPrep.PageHeaderBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if (dmFactura.qryAbonoPrepagoNOTA.IsNull) or (dmFactura.qryAbonoPrepagoNOTA.Value = '') then
  ChildBand1.Height:=0;
end;

end.
