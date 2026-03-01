unit URepRecibo8_5_11Devol;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepRecibo8_5_11Devol = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qckRepComprobante: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    ChildBand1: TQRChildBand;
    ChildBand4: TQRChildBand;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel19: TQRLabel;
    ChildBand3: TQRChildBand;
    QRLabel23: TQRLabel;
    ChildBand2: TQRChildBand;
    QRBand4: TQRBand;
    QRDBText14: TQRDBText;
    QRExpr1: TQRExpr;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    TPag: TQRLabel;
    QRSysData4: TQRSysData;
    qrtipoVenta: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    qrlabelDatosVehiculo: TQRLabel;
    qrdbTextMarca: TQRDBText;
    qrLabelMarca: TQRLabel;
    qrLabelModelo: TQRLabel;
    qrLabelPlaca: TQRLabel;
    qrLabelMontoInicial: TQRLabel;
    qrdbTextModelo: TQRDBText;
    qrdbTextPlaca: TQRDBText;
    qrdbTextMontoInicial: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel14: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QRLabel20Print(sender: TObject; var Value: String);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrtipoVentaPrint(sender: TObject; var Value: String);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure ChildBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qckRepComprobanteAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure TPagPrint(sender: TObject; var Value: String);
  private

  public
    valorNCF : String;
    xtipoVenta : String;
  end;

var
  qckRepRecibo8_5_11Devol: TqckRepRecibo8_5_11Devol;

implementation

uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  URepComprobante, UFormProcDevolucion;

{$R *.DFM}

procedure TqckRepRecibo8_5_11Devol.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepRecibo8_5_11Devol.AllDataSets.Add(dmCompania.tblCompania);
  qckRepRecibo8_5_11Devol.AllDataSets.Add(frmProcVentaRapidaEdicion.rxSolDatoscte);
end;

procedure TqckRepRecibo8_5_11Devol.QRLabel19Print(sender: TObject;
  var Value: String);
begin
  Value:= VarNombreUsuario;
end;

procedure TqckRepRecibo8_5_11Devol.QRLabel20Print(sender: TObject;
  var Value: String);
begin
  if (valorNCF <> '') then
  Value:=Value +' '+ Trim(valorNCF) else Value:='';
end;

procedure TqckRepRecibo8_5_11Devol.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (valorNCF = '') then QRLabel20.Enabled:=False
  else QRLabel20.Enabled:= True; 
end;

procedure TqckRepRecibo8_5_11Devol.qrtipoVentaPrint(sender: TObject;
  var Value: String);
begin
  if xtipoVenta = 'COTIZACION' then
  Value:= 'COTIZACION ' else
  Value:=xtipoVenta;
end;

procedure TqckRepRecibo8_5_11Devol.PageFooterBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (GlbSolicitaDVeh = 1) then
  begin
    if not frmProcVentaRapida.tblDatosVentaVehiculosMarca.IsNull then
    begin
      qrlabelDatosVehiculo.Enabled := True;
      qrLabelMarca.Enabled := True;
      qrLabelModelo.Enabled:= True;
      qrLabelPlaca.Enabled := True;
      qrLabelMontoInicial.Enabled:= True;
      QRDBText1.Enabled          := True;
      qrdbTextMarca.Enabled      := True;
      qrdbTextModelo.Enabled     := True;
      qrdbTextPlaca.Enabled := True;
      qrdbTextMontoInicial.Enabled:= True;
    end;
 end;
end;

procedure TqckRepRecibo8_5_11Devol.QRExpr2Print(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = '/' then
  value:='';
end;

procedure TqckRepRecibo8_5_11Devol.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = ',' then
  value:='';
end;

procedure TqckRepRecibo8_5_11Devol.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  Value:= StringReplace(Value, '/', '', [rfIgnoreCase]);
  Value:=Trim(value); 
end;

procedure TqckRepRecibo8_5_11Devol.ChildBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrLabel24.Caption:= GlbPiedePaginaFactura;
end;

procedure TqckRepRecibo8_5_11Devol.qckRepComprobanteAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if length(frmProcVentaRapidaEdicion.rxVentaSerieProd.Value) = 0 then
  begin
    ChildBand2.Height:=1;
    QRLabel26.Enabled:=false;
  end;
end;

procedure TqckRepRecibo8_5_11Devol.TPagPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+IntToStr(glbTPag);
end;

end.
