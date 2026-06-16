unit ReportePersonalSimple;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  DB, StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQckReporteGralSimple = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRBand4: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText30: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  QckReporteGralSimple: TQckReporteGralSimple;

implementation

uses UDatModNomina, UDatModCompania;
{$R *.DFM}

procedure TQckReporteGralSimple.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if dmCompania.tblCompania.State = dsInactive then
  dmCompania.tblCompania.Open;
end;

end.
