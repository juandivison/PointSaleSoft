unit URepTarjeta_dePago;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepTarjetaDePago = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRLabel22: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRSysData1: TQRSysData;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText13Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepTarjetaDePago: TqckRepTarjetaDePago;

implementation
uses   UDatModCompania, UDatModClientes, UProcVentaRapida, UDistCuotasFinanc,
  UDatModReportes;
{$R *.DFM}

procedure TqckRepTarjetaDePago.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepTarjetaDePago.AllDataSets.Add(dmCompania.tblCompania);
  qckRepTarjetaDePago.AllDataSets.Add(dmReportes.qryRepFinancDistcuota);
end;

procedure TqckRepTarjetaDePago.QRDBText13Print(sender: TObject;
  var Value: String);
begin
  //Value:=Value + '=' + dmPagos.tblPagosNUM_CUOTA.AsString;
end;

end.


