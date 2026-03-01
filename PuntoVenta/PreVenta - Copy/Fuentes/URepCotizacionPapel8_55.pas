unit URepCotizacionPapel8_55;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckCotizacion8_55 = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRSysData3: TQRSysData;
    QRLabel32: TQRLabel;
    TPag: TQRLabel;
    qrtipoVenta: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    ColumnHeaderSubDetail: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel3: TQRLabel;
    GroupFooterSubDetail: TQRBand;
    QRShape15: TQRShape;
    QRLabel26: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText20: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText22: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText21: TQRDBText;
    QRBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    ChildBand2: TQRChildBand;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel10: TQRLabel;
    qrLabelCliente: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrtipoVentaPrint(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText13Print(sender: TObject; var Value: String);
  private

  public
    xtipoVenta : String;
    nombreCteGenerico : String;
  end;

var
  qckCotizacion8_55: TqckCotizacion8_55;

implementation
uses UDatosVentas, UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  URFactura, URFacturaStandar;

{$R *.DFM}

procedure TqckCotizacion8_55.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckCotizacion8_55.AllDataSets.Add(dmCompania.tblCompania);
  qckCotizacion8_55.AllDataSets.Add(frmProcVentaRapida.Totales);
end;

procedure TqckCotizacion8_55.qrtipoVentaPrint(sender: TObject;
  var Value: String);
begin
  Value := xtipoVenta;
end;

procedure TqckCotizacion8_55.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if (Length(Value) = 0) then
  Value := nombreCteGenerico;
end;

procedure TqckCotizacion8_55.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRDBText9.Enabled := False;
  qrLabelCliente.Caption := nombreCteGenerico;
  qrLabelCliente.BringToFront;
  QRDBText9.DataField:='';
end;

procedure TqckCotizacion8_55.QRDBText13Print(sender: TObject;
  var Value: String);
begin
  if Value = '0' then
  value:='';
end;

end.
