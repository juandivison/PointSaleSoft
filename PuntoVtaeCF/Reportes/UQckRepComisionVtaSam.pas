unit UQckRepComisionVtaSam;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepComisionVtaSam = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRBand1: TQRBand;
    qrtipoVenta: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText11: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText4: TQRDBText;
    QRBand2: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel14: TQRLabel;
    qrLabelCriterioDatos: TQRLabel;
    QRLabel15: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand3: TQRBand;
    ChildBand1: TQRChildBand;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRGroup2: TQRGroup;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
  private

  public

  end;

var
  qckRepComisionVtaSam: TqckRepComisionVtaSam;

implementation

uses UDatModReportes;
 
{$R *.DFM}

end.
