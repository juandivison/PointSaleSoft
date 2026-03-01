unit URepCumpleanioCte;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckListadoCumpleAnio = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRSysData1: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText2: TQRDBText;
    PageFooterBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRSysData2: TQRSysData;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qckListadoCumpleAnio: TqckListadoCumpleAnio;

implementation

uses uDatModClientes, UDatModCompania, UGlobal;
{$R *.DFM}

procedure TqckListadoCumpleAnio.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckListadoCumpleAnio.AllDataSets.Add(dmCompania.tblCompania);
end;

end.
