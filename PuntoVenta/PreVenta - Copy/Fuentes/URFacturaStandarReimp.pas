unit URFacturaStandarReimp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckRepFacturaEstandarNewReimp = class(TQuickRep)
    TitleBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    ColumnHeaderSubDetail: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    GroupFooterSubDetail: TQRBand;
    QRShape15: TQRShape;
    QRLabel26: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand1: TQRBand;
    QRSysData3: TQRSysData;
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
    QRLabel1: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText20: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText21: TQRDBText;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
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
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel24: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText24: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText19: TQRDBText;
    QRImage1: TQRImage;
    QRDBText25: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel35: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrtipoVentaPrint(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText19Print(sender: TObject; var Value: String);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure TPagPrint(sender: TObject; var Value: String);
    procedure QRLabel32Print(sender: TObject; var Value: String);
  private

  public
    valorNCF : String[19];
    xtipoVenta : String;
  end;

var
  qckRepFacturaEstandarNewReimp: TqckRepFacturaEstandarNewReimp;

implementation
uses UDatModCompania, UDatModClientes, UGlobal, UDatModFactura;


{$R *.DFM}

procedure TqckRepFacturaEstandarNewReimp.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckRepFacturaEstandarNewReimp.AllDataSets.Add(dmCompania.tblCompania);
  qckRepFacturaEstandarNewReimp.AllDataSets.Add(dmFactura.qryFactReimpMaster);
  
end;

procedure TqckRepFacturaEstandarNewReimp.qrtipoVentaPrint(sender: TObject;
  var Value: String);
begin
  //Value := xtipoVenta;
  Value:='Venta a Credito';
end;

procedure TqckRepFacturaEstandarNewReimp.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if value = '-0.00' then Value:='';
end;

procedure TqckRepFacturaEstandarNewReimp.QRDBText19Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then Value:='';
end;

procedure TqckRepFacturaEstandarNewReimp.QRDBText18Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then Value:='';
end;

procedure TqckRepFacturaEstandarNewReimp.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepFacturaEstandarNewReimp.QRDBText23Print(sender: TObject;
  var Value: String);
begin
 if Value <> '0' then Value:=Value+'%';
end;

procedure TqckRepFacturaEstandarNewReimp.QRDBText17Print(sender: TObject;
  var Value: String);
begin
  value:='RNC-'+VALUE;
end;

procedure TqckRepFacturaEstandarNewReimp.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  xGrafico : String;
begin
  xGrafico:=FileToUse('Grafico','Logof.jpg');
  if (xGrafico <> '') then
  QRImage1.Picture.LoadFromFile(xGrafico);
end;

procedure TqckRepFacturaEstandarNewReimp.TPagPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+IntToStr(glbTPag);
end;

procedure TqckRepFacturaEstandarNewReimp.QRLabel32Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
end;

end.
