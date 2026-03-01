unit URFacturaStandar;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepFacturaEstandarNew = class(TQuickRep)
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
    QRLabel1: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText19: TQRDBText;
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
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel24: TQRLabel;
    qrLabelDescTipoComp: TQRLabel;
    QRDBText24: TQRDBText;
    QRImage1: TQRImage;
    QRDBText25: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    ChildBand3: TQRChildBand;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText26: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrtipoVentaPrint(sender: TObject; var Value: String);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText19Print(sender: TObject; var Value: String);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure TPagPrint(sender: TObject; var Value: String);
    procedure QRLabel35Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    valorNCF : String;
    xtipoVenta : String;
  end;

var
  qckRepFacturaEstandarNew: TqckRepFacturaEstandarNew;

implementation
uses UDatosVentas, UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  URFactura, UProcVentaRapidaNueva;

{$R *.DFM}

procedure TqckRepFacturaEstandarNew.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckRepFacturaEstandarNew.AllDataSets.Add(dmCompania.tblCompania);
  if Assigned(frmProcVentaRapida) then
  begin
    qckRepFacturaEstandarNew.AllDataSets.Add(frmProcVentaRapida.qryCliente);
    qckRepFacturaEstandarNew.AllDataSets.Add(frmProcVentaRapida.Totales);
  end else
  qckRepFacturaEstandarNew.AllDataSets.Add(frmProcVentaRapidaNueva.qryCliente);  
end;

procedure TqckRepFacturaEstandarNew.qrtipoVentaPrint(sender: TObject;
  var Value: String);
begin
  Value := xtipoVenta;
end;

procedure TqckRepFacturaEstandarNew.QRLabel10Print(sender: TObject;
  var Value: String);
begin
  if (valorNCF <> '') then
  Value:=Trim(valorNCF) else Value :='';
  if (GlbDescNCF <> '') then
  qrLabelDescTipoComp.Caption :=GlbDescNCF //Descripcion tipo Comprobante
  else qrLabelDescTipoComp.Enabled:=False;
end;

procedure TqckRepFacturaEstandarNew.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if (value = '-0.00') or (value = '0.00')
  then Value:=''
  else Value:='-'+value;
end;

procedure TqckRepFacturaEstandarNew.QRDBText19Print(sender: TObject;
  var Value: String);
begin
  if (value = '-0.00') or (value = '0.00') then Value:='';
end;

procedure TqckRepFacturaEstandarNew.QRDBText18Print(sender: TObject;
  var Value: String);
begin
  if (value = '-0.00') or (value = '0.00') then Value:='';
end;

procedure TqckRepFacturaEstandarNew.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (value = '-0.00') or (value = '0.00') then Value:='';
end;

procedure TqckRepFacturaEstandarNew.QRDBText23Print(sender: TObject;
  var Value: String);
begin
 if Value <> '0' then Value:=Value+'%';
end;

procedure TqckRepFacturaEstandarNew.QRDBText17Print(sender: TObject;
  var Value: String);
begin
  value:='RNC-'+VALUE;
end;

procedure TqckRepFacturaEstandarNew.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  xGrafico : String;
begin
  xGrafico:=FileToUse('Grafico','LogoStandar.jpg');
  if (xGrafico <> '') then
  QRImage1.Picture.LoadFromFile(xGrafico);

end;

procedure TqckRepFacturaEstandarNew.ChildBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (GlbDescNCF = '') then
  QRLabel4.Enabled := False;
end;

procedure TqckRepFacturaEstandarNew.TPagPrint(sender: TObject;
  var Value: String);
begin
//  Value := ' de '+IntToStr(glbTPag);
end;

procedure TqckRepFacturaEstandarNew.QRLabel35Print(sender: TObject;
  var Value: String);
begin
  Value := VarNombreUsuario;
end;

procedure TqckRepFacturaEstandarNew.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (GlbFirmaCajero = 1) then
  begin
    qrLabel7.Enabled:=false;
    qrLabel6.Enabled:=false;
    //qrLabel33.Enabled:=false;
    qrLabel34.Caption:='Firma Cajero';
  end;
end;

procedure TqckRepFacturaEstandarNew.ChildBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if Length(GlbPiedePaginaFactura) > 0 then
  QRLabel38.Caption:= GlbPiedePaginaFactura
  else QRLabel38.Caption:= '';
end;

end.
