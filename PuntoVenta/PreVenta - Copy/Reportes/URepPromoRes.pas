unit URepPromoRes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepPromoResumen = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand2: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr3: TQRExpr;
    QRBand5: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr5: TQRExpr;
    QRGroup2: TQRGroup;
    QRGroup1: TQRGroup;
    QRExpr6: TQRExpr;
    QRBand4: TQRBand;
    QRExpr7: TQRExpr;
    QRLabel1: TQRLabel;
    QRExpr8: TQRExpr;
    QRBand6: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr4: TQRExpr;
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepPromoResumen: TqckRepPromoResumen;

implementation
uses UDatModReportes;
{$R *.DFM}

procedure TqckRepPromoResumen.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value:= 'De '+FormatDateTime('dd-mmm-yy',dmReportes.qryRepPromociones.Params[0].Value)+
  ' al '+FormatDateTime('dd-mmm-yy',dmReportes.qryRepPromociones.Params[1].Value);
end;

end.
