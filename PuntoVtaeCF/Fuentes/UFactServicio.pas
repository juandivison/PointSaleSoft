unit UFactServicio;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckFactServicio = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    qrtipoVenta: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText19: TQRDBText;
    QRImage1: TQRImage;
    QRDBText11: TQRDBText;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel24: TQRLabel;
    QRBand2: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRBand3: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText20: TQRDBText;
    QRShape1: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand4: TQRBand;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel10: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckFactServicio: TqckFactServicio;

implementation

uses UDatModCompania, UDatModClientes, UGlobal, UDatModFactura;

{$R *.DFM}

procedure TqckFactServicio.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckFactServicio.AllDataSets.Add(dmCompania.tblCompania);
  qckFactServicio.AllDataSets.Add(dmFactura.qryFactServFReimpDet);
end;

procedure TqckFactServicio.QRDBText17Print(sender: TObject;
  var Value: String);
begin
  Value:='RNC-' + Value;
end;

procedure TqckFactServicio.QRDBText18Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then Value:='';
end;

procedure TqckFactServicio.QRExpr2Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then Value:='';
end;

procedure TqckFactServicio.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then Value:='';
end;

procedure TqckFactServicio.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then Value:='';
end;

procedure TqckFactServicio.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  xGrafico : String;
begin
  xGrafico:=FileToUse('Grafico','LogoStandar.jpg');
  if (xGrafico <> '') then
  QRImage1.Picture.LoadFromFile(xGrafico);
end;

procedure TqckFactServicio.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel10.Caption := GlbPiedePaginaFactura;
end;

end.
