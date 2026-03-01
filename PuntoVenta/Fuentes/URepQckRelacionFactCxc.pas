unit URepQckRelacionFactCxc;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepRelacionFactCxc = class(TQuickRep)
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
    QRLabel9: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckRepRelacionFactCxc: TqckRepRelacionFactCxc;

implementation

uses UDatModReportes, UDatModCompania;

{$R *.DFM}

procedure TqckRepRelacionFactCxc.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckRepRelacionFactCxc.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepRelacionFactCxc.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel1.Caption := 
  'Desde ' + FormatDateTime('mmm-dd-yyyy',dmReportes.qryRelacionFacturas.Params[2].Value) +
  ' a ' + FormatDateTime('mmm-dd-yyyy',dmReportes.qryRelacionFacturas.Params[3].Value);
end;

end.
