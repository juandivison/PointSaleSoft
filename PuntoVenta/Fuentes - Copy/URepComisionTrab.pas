unit URepComisionTrab;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepComisionTrab = class(TQuickRep)
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
    QRLabel1: TQRLabel;
    QRTARIFA: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRExpr4: TQRExpr;
    QRDBText4: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText14: TQRDBText;
    QRExpr11: TQRExpr;
    QRExpr14: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel5: TQRLabel;
    QRBand4: TQRBand;
    QRExpr6: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr13: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private

  public
     labelCretrioRep : string;
  end;

var
  qckRepComisionTrab: TqckRepComisionTrab;

implementation
   uses UDatModComisiones, UDatModCompania;
{$R *.DFM}

procedure TqckRepComisionTrab.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value:=labelCretrioRep;
end;

end.
