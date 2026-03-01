unit URepVentaFiscalDet;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepVentaFiscalDet = class(TQuickRep)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    TPag: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText5: TQRDBText;
    QRExpr3: TQRExpr;
    QRLabel1: TQRLabel;
    procedure QRLabel2Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepVentaFiscalDet: TqckRepVentaFiscalDet;

implementation

uses UDatModReportes;

{$R *.DFM}

procedure TqckRepVentaFiscalDet.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('dd/mmm/yy',dmReportes.qryRepLibroVentaDet.Params[0].Value) +
         ' al ' + FormatDateTime('dd/mmm/yy',dmReportes.qryRepLibroVentaDet.Params[1].Value);
end;

end.
