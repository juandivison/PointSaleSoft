unit URepCtaCtrl;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, QRExport;

type
  TqckRepCtasCtrls = class(TQuickRep)
    QRBand1: TQRBand;
    QRExpr6: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr7: TQRExpr;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRBand4: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRBand5: TQRBand;
    QRLabel7: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText9: TQRDBText;
    QRDBText8: TQRDBText;
    QRHTMLFilter1: TQRHTMLFilter;
  private

  public

  end;

var
  qckRepCtasCtrls: TqckRepCtasCtrls;

implementation
uses UDatModCatalogo,  UDatModCompania;

{$R *.DFM}

end.
