unit URepCompAbonoCXP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQckRepCompAbonoCXP = class(TQuickRep)
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
    ChildBand4: TQRChildBand;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    LabelNombUser: TQRLabel;
    ChildBand3: TQRChildBand;
    QRLabel23: TQRLabel;
    QRDBText14: TQRDBText;
    QRExpr1: TQRExpr;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText11: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    qrLabelReimprimir: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
   valorNCF : String[19];
    xtipoVenta : String;
  end;

var
  QckRepCompAbonoCXP: TQckRepCompAbonoCXP;

implementation

uses UDatModCompania, UDatModCxp;

{$R *.DFM}

procedure TQckRepCompAbonoCXP.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if dmCompania.tblCompania.State = dsInactive then
  dmCompania.tblCompania.Open;
  QckRepCompAbonoCXP.AllDataSets.Add(dmCompania.tblCompania);
  QckRepCompAbonoCXP.AllDataSets.Add(dmCxp.qryRepPgoDetalle); 
end;

end.
