unit URepComisionOpeServ;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepComisionOpeServ = class(TQuickRep)
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
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRGroup2: TQRGroup;
    QRBand6: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel5: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr5: TQRExpr;
    QRDBText4: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText14: TQRDBText;
    QRExpr8: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepComisionOpeServ: TqckRepComisionOpeServ;

implementation
   uses UDatModReportes, UDatModCompania;
{$R *.DFM}

procedure TqckRepComisionOpeServ.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value:='Desde '+FormatDateTime('dd-mmm-yyyy', dmReportes.qryRepVentaServicio.Params[0].Value)+
  ' A '+FormatDateTime('dd-mmm-yyyy', dmReportes.qryRepVentaServicio.Params[1].Value);
end;

end.
