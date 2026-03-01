unit URepDatosConduce;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckReporteConduce = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText9: TQRDBText;
    qrcriterioReporte: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrNombre: TQRLabel;
    QRLabel7: TQRLabel;
    ChildBand1: TQRChildBand;
    qrlabelFecha: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    
  end;

var
  qckReporteConduce: TqckReporteConduce;

implementation

uses UCompania, UGlobal, UDatModCompania, URepConduce;

{$R *.DFM}

procedure TqckReporteConduce.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckReporteConduce.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckReporteConduce.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if varTipousuario > 0 then
  PrintBand:=False
  else PrintBand:=True;
end;

end.
