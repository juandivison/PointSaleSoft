unit UQckRepPrecioXCantUnidad;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepPrecioXCantUnidad = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrdbP3: TQRDBText;
    qrdbP4: TQRDBText;
    qrdbP2: TQRDBText;
    qrdbP1: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText15: TQRDBText;
    SummaryBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
  private

  public

  end;

var
  qckRepPrecioXCantUnidad: TqckRepPrecioXCantUnidad;

implementation

uses UDatModCompania,UDatModInventario;

{$R *.DFM}

end.
