unit URepReciboAbonoCXC;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckReciboAbonoCXC = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel20: TQRLabel;
    qckRepComprobante: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel18: TQRLabel;
    QRLabel25: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel10: TQRLabel;
    ChildBand4: TQRChildBand;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    LabelNombUser: TQRLabel;
    ChildBand3: TQRChildBand;
    QRLabel23: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    qrLabelReimprimir: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel11: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel24Print(sender: TObject; var Value: String);
  private

  public
   valorNCF : String[19];
    xtipoVenta : String;
  end;

var
  qckReciboAbonoCXC: TqckReciboAbonoCXC;

implementation

uses UDatModIngresos, UDatModCompania;

{$R *.DFM}

procedure TqckReciboAbonoCXC.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckReciboAbonoCXC.AllDataSets.Add(dmCompania.tblCompania);
  //qckReciboAbonoCXC.AllDataSets.Add(frmCobrarFacturas.);
end;

procedure TqckReciboAbonoCXC.QRLabel24Print(sender: TObject;
  var Value: String);
begin
  Value := xtipoVenta;
end;

end.
