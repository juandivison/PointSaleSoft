unit UTicketCtrlEntradaV1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, SvQrBarcode, DB, RxMemDS;

type
  TqckTicketEntradaV1 = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    SvQRBarcode1: TSvQRBarcode;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qckTicketEntradaV1: TqckTicketEntradaV1;

implementation

uses UGlobal, UDatModReportes, UDatModCompania;

{$R *.DFM}

procedure TqckTicketEntradaV1.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
end;

end.
