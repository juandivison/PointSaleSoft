unit uRepAvisoAtrasoPagoCuotaFinanc;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepAvisoAtraso = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText11: TQRDBText;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr4: TQRExpr;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText7: TQRDBText;
    QRSysData3: TQRSysData;
    QRDBText8: TQRDBText;
    QRSysData4: TQRSysData;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRExpr3: TQRExpr;
    QRDBText10: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRExpr5: TQRExpr;
    QRLabel18: TQRLabel;
    QRDBText14: TQRDBText;
    QRExpr6: TQRExpr;
    QRLabel19: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qckRepAvisoAtraso: TqckRepAvisoAtraso;

implementation

uses UDatModPrestamo, UDatModCompania;

{$R *.DFM}

procedure TqckRepAvisoAtraso.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepAvisoAtraso.AllDataSets.Add(dmcompania.tblCompania);
end;

end.
