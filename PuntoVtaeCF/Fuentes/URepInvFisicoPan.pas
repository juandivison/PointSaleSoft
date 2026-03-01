unit URepInvFisicoPan;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepInvFisicoPan = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRTARIFA: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText10: TQRDBText;
    QRExpr1: TQRExpr;
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepInvFisicoPan: TqckRepInvFisicoPan;

implementation
uses UDatModReportes;

{$R *.DFM}

procedure TqckRepInvFisicoPan.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  value:= FormatDatetime('dd-mmm-yyyy',dmReportes.qryRepInvFisicoPan.Params[0].Value) +
  ' a ' + FormatDatetime('dd-mmm-yyyy',dmReportes.qryRepInvFisicoPan.Params[1].Value);
end;

end.
