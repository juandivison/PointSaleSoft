unit URepCotizacionPapel8_55;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckCotizacion8_55 = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qckRepComprobante: TQRBand;
    PageFooterBand1: TQRBand;
    ChildBand1: TQRChildBand;
    ChildBand4: TQRChildBand;
    QRBand4: TQRBand;
    QRDBText14: TQRDBText;
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
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr4: TQRExpr;
    QRLabel6: TQRLabel;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText23: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    ChildBand3: TQRChildBand;
    QRLabel10: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText20: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr6: TQRExpr;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrtipoVentaPrint(sender: TObject; var Value: String);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRLabel24Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure TPagPrint(sender: TObject; var Value: String);
    procedure QRSysData4Print(sender: TObject; var Value: String);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
  private

  public
    valorNCF : String;
    xtipoVenta : String;
    totalPag : Integer;
    nombreCteGenerico : string;
  end;

var
  qckCotizacion8_55: TqckCotizacion8_55;

implementation

uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  URepComprobante, UDatModFactura;

{$R *.DFM}

procedure TqckCotizacion8_55.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckCotizacion8_55.AllDataSets.Add(dmCompania.tblCompania);
  qckCotizacion8_55.AllDataSets.Add(frmProcVentaRapida.rxSolDatoscte);
end;

procedure TqckCotizacion8_55.QRLabel19Print(sender: TObject;
  var Value: String);
begin
  Value:='Usr:'+VarNombreUsuario;
end;

procedure TqckCotizacion8_55.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //if (valorNCF = '') then
  //begin
    //QRLabel20.Enabled:=False;
    //QRExpr5.Enabled:=false;
  //end else
  //QRLabel20.Enabled:= True;
  if (xtipoVenta = 'CONTADO') then
  begin
    qrLabel2.Top:=78;
    QRDBText12.Top:=78;
    QRLabel28.Enabled:=False;
    QRDBText23.Enabled:=False;
  end;
end;

procedure TqckCotizacion8_55.qrtipoVentaPrint(sender: TObject;
  var Value: String);
begin
  //if xtipoVenta = 'COTIZACION' then
  Value:= 'COTIZACION ';// else
  //Value:=xtipoVenta;
end;

procedure TqckCotizacion8_55.PageFooterBand1BeforePrint(
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

procedure TqckCotizacion8_55.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  Value:= StringReplace(Value, '/', '', [rfIgnoreCase]);
  Value:=Trim(value);
end;

procedure TqckCotizacion8_55.QRLabel24Print(sender: TObject;
  var Value: String);
begin
  Value := GlbPiedePaginaFactura;
end;

procedure TqckCotizacion8_55.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrLabel24.Caption:= GlbPiedePaginaFactura;
end;

procedure TqckCotizacion8_55.TPagPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+ IntToStr(glbTPag);
end;

procedure TqckCotizacion8_55.QRSysData4Print(sender: TObject;
  var Value: String);
begin
  Value:= Value;
end;

procedure TqckCotizacion8_55.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if length(dmFactura.qryVentaFacturaDetSERIE_PROD.Value)= 0 then
  begin
    ChildBand3.Height:=1;
    QRLabel10.Enabled:=false;
  end;
end;

procedure TqckCotizacion8_55.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  Value:='RNC-'+Value;
end;

procedure TqckCotizacion8_55.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  if Not dmCompania.tblCompaniaOBSERVACION.IsNull then
  begin
    if Not dmCompania.tblCompaniaCIUDAD.IsNull then
    Value:=Value + ' '+dmCompania.tblCompaniaCIUDAD.Value;
  end;
end;

procedure TqckCotizacion8_55.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if dmCompania.tblCompaniaOBSERVACION.IsNull then
  begin
    if Not dmCompania.tblCompaniaCIUDAD.IsNull then
    Value:=dmCompania.tblCompaniaCIUDAD.Value
    else Value:='';
  end;

end;

end.
