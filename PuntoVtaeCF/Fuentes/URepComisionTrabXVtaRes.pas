unit URepComisionTrabXVtaRes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepComisionTrabXVtaRes = class(TQuickRep)
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
    QRTARIFA: TQRLabel;
    QRBand3: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRLabel13: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText14: TQRDBText;
    QRExpr11: TQRExpr;
    QRExpr14: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand6: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private

  public
     labelCretrioRep : string;
  end;

var
  qckRepComisionTrabXVtaRes: TqckRepComisionTrabXVtaRes;

implementation
   uses UDatModComisiones, UDatModCompania;
{$R *.DFM}

procedure TqckRepComisionTrabXVtaRes.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value:=labelCretrioRep;
end;

end.
