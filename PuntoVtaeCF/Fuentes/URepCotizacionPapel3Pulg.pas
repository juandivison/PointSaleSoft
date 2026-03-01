unit URepCotizacionPapel3Pulg;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckCotizacion3Pulg = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qckRepComprobante: TQRBand;
    PageFooterBand1: TQRBand;
    ChildBand1: TQRChildBand;
    ChildBand4: TQRChildBand;
    QRBand4: TQRBand;
    QRDBText14: TQRDBText;
    QRSysData3: TQRSysData;
    qrtipoVenta: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr4: TQRExpr;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText29: TQRDBText;
    ChildBand3: TQRChildBand;
    QRLabel32: TQRLabel;
    QRDBText20: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    ChildBand2: TQRChildBand;
    QRLabel10: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel6: TQRLabel;
    ChildBand5: TQRChildBand;
    ChildBand6: TQRChildBand;
    ChildBand7: TQRChildBand;
    QRExpr3: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText23: TQRDBText;
    ChildBand8: TQRChildBand;
    QRLabel23: TQRLabel;
    QRLabel19: TQRLabel;
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
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure ChildBand7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    valorNCF : String[19];
    xtipoVenta : String;
    nombreCteGenerico : string;
  end;

var
  qckCotizacion3Pulg: TqckCotizacion3Pulg;

implementation

uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  URepComprobante, UDatModFactura, URepCotizacionPapel8_55;

{$R *.DFM}

procedure TqckCotizacion3Pulg.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckCotizacion3Pulg.AllDataSets.Add(dmCompania.tblCompania);
  //qckCotizacion3Pulg.AllDataSets.Add(frmProcVentaRapida.rxSolDatoscte);
end;

procedure TqckCotizacion3Pulg.QRLabel19Print(sender: TObject;
  var Value: String);
begin
  Value:='Usr:'+VarNombreUsuario;
end;

procedure TqckCotizacion3Pulg.QRBand4BeforePrint(Sender: TQRCustomBand;
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
    //qrLabel2.Top:=78;
    QRDBText12.Top:=78;
    QRLabel28.Enabled:=False;
    QRDBText23.Enabled:=False;
  end;
end;

procedure TqckCotizacion3Pulg.qrtipoVentaPrint(sender: TObject;
  var Value: String);
begin
  //if xtipoVenta = 'COTIZACION' then
  Value:= 'COTIZACION ';// else
  //Value:=xtipoVenta;
end;

procedure TqckCotizacion3Pulg.PageFooterBand1BeforePrint(
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

procedure TqckCotizacion3Pulg.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  Value:= StringReplace(Value, '/', '', [rfIgnoreCase]);
  Value:=Trim(value);
end;

procedure TqckCotizacion3Pulg.QRLabel24Print(sender: TObject;
  var Value: String);
begin
  Value := GlbPiedePaginaFactura;
end;

procedure TqckCotizacion3Pulg.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrLabel24.Caption:= GlbPiedePaginaFactura;
end;

procedure TqckCotizacion3Pulg.TPagPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+ IntToStr(glbTPag);
end;

procedure TqckCotizacion3Pulg.QRSysData4Print(sender: TObject;
  var Value: String);
begin
  Value:= Value;
end;

procedure TqckCotizacion3Pulg.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if length(dmFactura.qryVentaFacturaDetSERIE_PROD.Value)= 0 then
  begin
    ChildBand2.Height:=0;
    QRLabel10.Enabled:=false;
  end;
end;

procedure TqckCotizacion3Pulg.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  Value:='RNC-'+Value;
end;

procedure TqckCotizacion3Pulg.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  if Not dmCompania.tblCompaniaOBSERVACION.IsNull then
  begin
    if Not dmCompania.tblCompaniaCIUDAD.IsNull then
    Value:=Value + ' '+dmCompania.tblCompaniaCIUDAD.Value;
  end;
end;

procedure TqckCotizacion3Pulg.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if dmCompania.tblCompaniaOBSERVACION.IsNull then
  begin
    if Not dmCompania.tblCompaniaCIUDAD.IsNull then
    Value:=dmCompania.tblCompaniaCIUDAD.Value
    else Value:='';
  end;

end;

procedure TqckCotizacion3Pulg.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  Value:='No.'+Value;
end;

procedure TqckCotizacion3Pulg.QRDBText15Print(sender: TObject;
  var Value: String);
begin
  Value:='Fecha:'+Value;
end;

procedure TqckCotizacion3Pulg.ChildBand7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmfactura.qryRepCotizaNewCIUDAD.IsNull) And
     (dmfactura.qryRepCotizaNewTELEF_CONTACTO.IsNull) then
     ChildBand7.Height:=0;
end;

procedure TqckCotizacion3Pulg.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmFactura.qryRepCotizaDetNewSERIE_PROD.IsNull or (
  dmFactura.qryRepCotizaDetNewSERIE_PROD.Value = '') then
  begin
    PrintBand:=False;
    ChildBand2.Height:=0;
  end;
end;

end.
