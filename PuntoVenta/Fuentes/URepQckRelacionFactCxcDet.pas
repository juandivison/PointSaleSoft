unit URepQckRelacionFactCxcDet;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepRelacionFactCxcDet = class(TQuickRep)
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRDBText13: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText14: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRBand3: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckRepRelacionFactCxcDet: TqckRepRelacionFactCxcDet;

implementation

uses UDatModCompania, UDatModReportes;

{$R *.DFM}

procedure TqckRepRelacionFactCxcDet.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckRepRelacionFactCxcDet.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepRelacionFactCxcDet.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel1.Caption :=
  'Desde ' + FormatDateTime('mmm-dd-yyyy',dmReportes.qryRelacionFacturas.Params[2].Value) +
  ' a ' + FormatDateTime('mmm-dd-yyyy',dmReportes.qryRelacionFacturas.Params[3].Value);
end;

end.
