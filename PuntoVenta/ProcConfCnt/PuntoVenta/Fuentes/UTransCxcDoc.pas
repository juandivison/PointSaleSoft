unit UTransCxcDoc;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepTransCxcDoc = class(TQuickRep)
    TitleBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    qryLabelTipoDoc: TQRLabel;
    QRDBText2: TQRDBText;
    GroupFooterSubDetail: TQRBand;
    QRBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel32: TQRLabel;
    TPag: TQRLabel;
    qrtipoVenta: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
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
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    ChildBand3: TQRChildBand;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrtipoVentaPrint(sender: TObject; var Value: String);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private

  public
    valorNCF : String[19];
    xtipoVenta : String;
  end;

var
  qckRepTransCxcDoc: TqckRepTransCxcDoc;

implementation
uses UDatosVentas, UDatModCompania, UDatModClientes, UGlobal, UTransNcNbDev,
UDatModCxc, URFacturaStandar;


{$R *.DFM}

procedure TqckRepTransCxcDoc.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckRepTransCxcDoc.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepTransCxcDoc.qrtipoVentaPrint(sender: TObject;
  var Value: String);
begin
  Value := xtipoVenta;
end;

procedure TqckRepTransCxcDoc.QRLabel10Print(sender: TObject;
  var Value: String);
begin
  if (valorNCF <> '') then
  Value:=Trim(valorNCF) else Value:='';
end;

procedure TqckRepTransCxcDoc.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepTransCxcDoc.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

end.
