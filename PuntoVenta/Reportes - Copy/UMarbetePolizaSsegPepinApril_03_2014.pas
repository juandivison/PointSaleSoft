unit UMarbetePolizaSsegPepin;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepMarbeteSegPepin = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qckRepMarbeteSegPepin: TqckRepMarbeteSegPepin;

implementation
  uses UDatmodDatosGenerales;
{$R *.DFM}

procedure TqckRepMarbeteSegPepin.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckRepMarbeteSegPepin.AllDataSets.Clear;
  qckRepMarbeteSegPepin.AllDataSets.Add(dmDatos.qryRepPoliza);
  qckRepMarbeteSegPepin.AllDataSets.Add(dmDatos.qryRepPolizaDet);
end;

end.
