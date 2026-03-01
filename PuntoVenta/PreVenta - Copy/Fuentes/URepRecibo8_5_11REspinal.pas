unit URepRecibo8_5_11REspinal;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepRecibo8_5_11REsp = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qckRepComprobante: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    PageFooterBand1: TQRBand;
    ChildBand1: TQRChildBand;
    ChildBand4: TQRChildBand;
    ChildBand2: TQRChildBand;
    QRBand4: TQRBand;
    QRDBText14: TQRDBText;
    QRExpr1: TQRExpr;
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
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
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
    procedure QRLabel24Print(sender: TObject; var Value: String);
    procedure qckRepComprobanteAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure TPagPrint(sender: TObject; var Value: String);
    procedure QRSysData4Print(sender: TObject; var Value: String);
  private

  public
    valorNCF : String[19];
    xtipoVenta : String;
  end;

var
  qckRepRecibo8_5_11REsp: TqckRepRecibo8_5_11REsp;

implementation

uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  URepComprobante;

{$R *.DFM}

procedure TqckRepRecibo8_5_11REsp.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepRecibo8_5_11REsp.AllDataSets.Add(dmCompania.tblCompania);
  qckRepRecibo8_5_11REsp.AllDataSets.Add(frmProcVentaRapida.rxSolDatoscte);
end;

procedure TqckRepRecibo8_5_11REsp.QRLabel19Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckRepRecibo8_5_11REsp.QRLabel20Print(sender: TObject;
  var Value: String);
begin
  if (Not frmProcVentaRapida.rxVentaNCF.IsNull) And
     ( frmProcVentaRapida.rxVentaNCF.Value <> '' ) then
     if (Length(valorNCF) = 0) then 
     valorNCF := frmProcVentaRapida.rxVentaNCF.Value;

  if (valorNCF <> '') then
  Value:=Value +' '+ Trim(valorNCF) else Value:='';
end;

procedure TqckRepRecibo8_5_11REsp.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (valorNCF = '') then
  begin
    QRLabel20.Enabled:=False;
    //QRExpr5.Enabled:=false;
  end                                            
  else QRLabel20.Enabled:= True;
  if (xtipoVenta = 'CONTADO') then
  begin
    qrLabel2.Top:=78;
    QRDBText12.Top:=78;
    QRLabel28.Enabled:=False;
    QRDBText23.Enabled:=False;
  end;
end;

procedure TqckRepRecibo8_5_11REsp.qrtipoVentaPrint(sender: TObject;
  var Value: String);
begin
  if xtipoVenta = 'COTIZACION' then
  Value:= 'COTIZACION ' else
  Value:=xtipoVenta;
end;

procedure TqckRepRecibo8_5_11REsp.PageFooterBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
{  if (GlbSolicitaDVeh = 1) then
  begin
    if not frmProcVentaRapida.tblDatosVentaVehiculosMarca.IsNull then
    begin
      qrlabelDatosVehiculo.Enabled := True;
      qrLabelMarca.Enabled := True;
      qrLabelModelo.Enabled:= True;
      qrLabelPlaca.Enabled := True;
      qrLabelMontoInicial.Enabled := True;
      QRDBText1.Enabled           := True;
      qrdbTextMarca.Enabled       := True;
      qrdbTextModelo.Enabled      := True;
      qrdbTextPlaca.Enabled       := True;
      qrdbTextMontoInicial.Enabled:= True;
    end;
 end; }
end;

procedure TqckRepRecibo8_5_11REsp.QRExpr2Print(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = '/' then
  value:='';
end;

procedure TqckRepRecibo8_5_11REsp.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = ',' then
  value:='';
end;

procedure TqckRepRecibo8_5_11REsp.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  Value:= StringReplace(Value, '/', '', [rfIgnoreCase]);
  Value:=Trim(value); 
end;

procedure TqckRepRecibo8_5_11REsp.QRLabel24Print(sender: TObject;
  var Value: String);
begin
  Value:=GlbPiedePaginaFactura;
end;

procedure TqckRepRecibo8_5_11REsp.qckRepComprobanteAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if length(frmProcVentaRapida.rxVentaSerieProd.Value) = 0 then
  begin
    ChildBand2.Height:=1;
    QRLabel26.Enabled:=false;
  end;
end;

procedure TqckRepRecibo8_5_11REsp.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrLabel24.Caption:= GlbPiedePaginaFactura;
end;

procedure TqckRepRecibo8_5_11REsp.TPagPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+ IntToStr(glbTPag);
end;

procedure TqckRepRecibo8_5_11REsp.QRSysData4Print(sender: TObject;
  var Value: String);
begin
  Value:=value;
end;

end.
