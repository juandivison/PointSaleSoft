unit URepOrdenesTrabajoBB;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckRepOrdenesTrabajo = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel28: TQRLabel;
    QRDBText30: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    ChildBand1: TQRChildBand;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel7: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText12: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel7Print(sender: TObject; var Value: String);
  private

  public
     strRepCond : string;
  end;

var
  qckRepOrdenesTrabajo: TqckRepOrdenesTrabajo;

implementation
uses UDatModReportes, UDatModCompania;
{$R *.DFM}

procedure TqckRepOrdenesTrabajo.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if dmCompania.tblCompania.state = dsInactive then
  dmCompania.tblCompania.Open;
  qckRepOrdenesTrabajo.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepOrdenesTrabajo.QRLabel7Print(sender: TObject;
  var Value: String);
begin
  Value:= strRepCond;
end;

end.
