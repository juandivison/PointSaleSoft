unit URFacturaStandarReimpREsp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckRepFacturaEstandarNewReimpREsp = class(TQuickRep)
    TitleBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    ColumnHeaderSubDetail: TQRBand;
    GroupFooterSubDetail: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand1: TQRBand;
    QRSysData3: TQRSysData;
    TPag: TQRLabel;
    qrtipoVenta: TQRLabel;
    ChildBand1: TQRChildBand;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText19: TQRDBText;
    QRImage1: TQRImage;
    QRDBText25: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText28: TQRDBText;
    QRBand2: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel35: TQRLabel;
    QRDBText29: TQRDBText;
    QRExpr4: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText20: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    ChildBand2: TQRChildBand;
    QRLabel4: TQRLabel;
    QRDBText11: TQRDBText;
    QRExpr3: TQRExpr;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrtipoVentaPrint(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure TPagPrint(sender: TObject; var Value: String);
    procedure QRLabel30Print(sender: TObject; var Value: String);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText29Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRDBText19Print(sender: TObject; var Value: String);
  private

  public
    valorNCF : String;
    xtipoVenta : String;
  end;

var
  qckRepFacturaEstandarNewReimpREsp: TqckRepFacturaEstandarNewReimpREsp;

implementation
uses UDatModCompania, UDatModClientes, UGlobal, UDatModFactura,
  URFacturaStandarReimp;


{$R *.DFM}

procedure TqckRepFacturaEstandarNewReimpREsp.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckRepFacturaEstandarNewReimpREsp.AllDataSets.Add(dmCompania.tblCompania);
  qckRepFacturaEstandarNewReimpREsp.AllDataSets.Add(dmFactura.qryFactReimpMaster);  
end;

procedure TqckRepFacturaEstandarNewReimpREsp.qrtipoVentaPrint(sender: TObject;
  var Value: String);
begin
  //Value := xtipoVenta;
  Value:='Venta a Credito';
end;

procedure TqckRepFacturaEstandarNewReimpREsp.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if value = '-0.00' then Value:='';
end;

procedure TqckRepFacturaEstandarNewReimpREsp.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepFacturaEstandarNewReimpREsp.QRDBText23Print(sender: TObject;
  var Value: String);
begin
 if Value <> '0' then Value:=Value+'%';
end;

procedure TqckRepFacturaEstandarNewReimpREsp.QRDBText17Print(sender: TObject;
  var Value: String);
begin
  value:='RNC-'+VALUE;
end;

procedure TqckRepFacturaEstandarNewReimpREsp.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  xGrafico : String;
begin
  xGrafico:=FileToUse('Grafico','LogoStandar.jpg');
  if (xGrafico <> '') then
  QRImage1.Picture.LoadFromFile(xGrafico);
end;

procedure TqckRepFacturaEstandarNewReimpREsp.TPagPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+IntToStr(glbTPag);
end;

procedure TqckRepFacturaEstandarNewReimpREsp.QRLabel30Print(
  sender: TObject; var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckRepFacturaEstandarNewReimpREsp.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  //qrLabel24.Caption:= GlbPiedePaginaFactura;
  if (GlbFirmaCajero = 1) then
  begin
    qrLabel7.Enabled:=false;
    qrLabel6.Enabled:=false;

    qrLabel33.Enabled:=false;
    qrLabel34.Enabled:=false;
    
    qrLabel5.Caption:='Firma Cajero';
  end;
end;

procedure TqckRepFacturaEstandarNewReimpREsp.QRDBText29Print(
  sender: TObject; var Value: String);
begin
  if (Value <> '') then
  Value:='NCF:' + Value
  else Value:='';
end;

procedure TqckRepFacturaEstandarNewReimpREsp.QRDBText9Print(
  sender: TObject; var Value: String);
begin
  Value:='['+Value+']';
end;

procedure TqckRepFacturaEstandarNewReimpREsp.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  //tif length(frmProcVentaRapida.rxVentaSerieProd.Value) = 0 then
  //tbegin
  QRSubDetail1.HasChild := False;
  //t  ChildBand2.Height := 1;
  //t  QRLabel26.Enabled := false;
  //t end;

end;

procedure TqckRepFacturaEstandarNewReimpREsp.QRDBText19Print(
  sender: TObject; var Value: String);
begin
  if (not dmcompania.tblCompaniaCIUDAD.IsNull) then
  Value:=Value + ' '+ dmcompania.tblCompaniaCIUDAD.Value;
end;

end.
