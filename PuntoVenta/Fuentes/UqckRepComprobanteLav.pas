unit UqckRepComprobanteLav;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepComprobanteLav = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand2: TQRBand;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel25: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRDBText10: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText13: TQRDBText;
    ChildBand2: TQRChildBand;
    QRLabel27: TQRLabel;
    ChildBand3: TQRChildBand;
    QRLabel23: TQRLabel;
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public

  end;

var
  qckRepComprobanteLav: TqckRepComprobanteLav;

implementation
uses UDatosVentas, Uglobal;

{$R *.DFM}

procedure TqckRepComprobanteLav.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrLabel27.Caption:= GlbPiedePaginaFactura;
end;

end.
