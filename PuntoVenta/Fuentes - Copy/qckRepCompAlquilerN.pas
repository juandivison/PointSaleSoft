unit qckRepCompAlquilerN;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;
type
  TqckCompAlquilerN = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    TPag: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel11: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRExpr5: TQRExpr;
    QRDBText11: TQRDBText;
  private

  public

  end;

var
  qckCompAlquilerN: TqckCompAlquilerN;

implementation

uses UDatModInventario, UDatModCompania, Uglobal;

{$R *.DFM}

end.
