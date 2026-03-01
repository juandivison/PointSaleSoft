unit UqckRepVeh;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepVeh = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel12: TQRLabel;
    QRSysData2: TQRSysData;
    qrCriterio: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel13: TQRLabel;
    procedure QRDBText11Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepVeh: TqckRepVeh;

implementation
  uses UDatModClientes, UDatModCompania;
{$R *.DFM}

procedure TqckRepVeh.QRDBText11Print(sender: TObject; var Value: String);
begin
  if (value = '0') then value:='';
end;

end.
