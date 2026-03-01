unit URFactura;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepFacturaEstandar = class(TQuickRep)
    TitleBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape5: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    ColumnHeaderSubDetail: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    GroupFooterSubDetail: TQRBand;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr3: TQRExpr;
    QRShape15: TQRShape;
    QRLabel26: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape4: TQRShape;
    QRBand1: TQRBand;
    QRExpr4: TQRExpr;
    QRSysData3: TQRSysData;
    QRLabel32: TQRLabel;
    TPag: TQRLabel;
    qrtipoVenta: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRExpr2: TQRExpr;
    QRImage1: TQRImage;
    QRDBText1: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckRepFacturaEstandar: TqckRepFacturaEstandar;

implementation
uses uglobal, UDatosVentas, UDatModCompania;
{$R *.DFM}

procedure TqckRepFacturaEstandar.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckRepFacturaEstandar.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepFacturaEstandar.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  xGrafico : String;
begin
  xGrafico:=FileToUse('Grafico','LogoStandar.jpg');
  if (xGrafico <> '') then
  QRImage1.Picture.LoadFromFile(xGrafico);
end;

end.
