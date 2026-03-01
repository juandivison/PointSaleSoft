unit URepComprobanteNuevo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepReciboNuevo = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    qckRepComprobante: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel18: TQRLabel;
    ChildBand4: TQRChildBand;
    ChildBand3: TQRChildBand;
    QRLabel20: TQRLabel;
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
    QRLabel24: TQRLabel;
    ChildBand2: TQRChildBand;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText14: TQRDBText;
    qrLabelRNC: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel26: TQRLabel;
    ChildBand5: TQRChildBand;
    QRDBText5: TQRDBText;
    ChildBand6: TQRChildBand;
    QRLabel23: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    ChildBand7: TQRChildBand;
    QRLabel32: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText22: TQRDBText;
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QRLabel20Print(sender: TObject; var Value: String);
    procedure QRLabel24Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure ChildBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qckRepComprobanteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText22Print(sender: TObject; var Value: String);
  private

  public
    valorNCF : String;
    ncfDesc  : String;
    xtipoVenta : String;
    nombreCteGenerico : String;
    xTotalesNombreCliente : String
  end;

var
  qckRepReciboNuevo: TqckRepReciboNuevo;

implementation

uses UDatModCompania, UDatModClientes, UGlobal,
  UProcVentaRapidaNueva;

{$R *.DFM}

procedure TqckRepReciboNuevo.QRDBText4Print(sender: TObject;
  var Value: String);
begin
 Value :='RNC-'+VALUE;
end;

procedure TqckRepReciboNuevo.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qrLabelRNC.Caption:='';
  qckRepReciboNuevo.AllDataSets.Add(dmCompania.tblCompania);
  qckRepReciboNuevo.AllDataSets.Add(frmProcVentaRapidaNueva.Totales)
end;

procedure TqckRepReciboNuevo.QRLabel19Print(sender: TObject; var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckRepReciboNuevo.QRLabel20Print(sender: TObject; var Value: String);
begin
  if (valorNCF <> '') then
  begin
    Value:=Value +' '+ Trim(valorNCF);
    //qrLabelNcfDesc.Caption:=ncfDesc;
  end else Value:='';
end;

procedure TqckRepReciboNuevo.QRLabel24Print(sender: TObject; var Value: String);
begin
  Value := xtipoVenta;
end;

procedure TqckRepReciboNuevo.QRLabel2Print(sender: TObject; var Value: String);
begin
  Value:= 'Numero : ';
end;

procedure TqckRepReciboNuevo.QRLabel1Print(sender: TObject; var Value: String);
begin
  if qckRepReciboNuevo.xtipoVenta = 'COTIZACION' then
  Value:= 'COTIZACION ';
end;

procedure TqckRepReciboNuevo.QRLabel14Print(sender: TObject; var Value: String);
begin
  if Length(nombreCteGenerico) > 0 then
  Value := NombreCteGenerico;

  if (Length(frmProcVentaRapidaNueva.TotalesNombreCliente.Value) > 0 ) then
  Value := frmProcVentaRapidaNueva.TotalesNombreCliente.Value;
end;

procedure TqckRepReciboNuevo.ChildBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrLabel27.Caption:= GlbPiedePaginaFactura;
end;

procedure TqckRepReciboNuevo.ChildBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (xtipoVenta = 'CONTADO') then
  begin
    QRLabel28.Enabled:=False;
    QRLabel29.Enabled:=False;
    QRLabel31.Enabled:=False;
    QRLabel30.Enabled:=False;
    ChildBand4.Height:=1;
  end;
end;

procedure TqckRepReciboNuevo.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Length(frmProcVentaRapidaNueva.rxVentaSerieProd.Value) = 0 then
  ChildBand2.HasChild:= False;
end;

procedure TqckRepReciboNuevo.qckRepComprobanteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Not frmProcVentaRapidaNueva.rxVentaTipoUnidad.IsNull then
  begin
    if (QRLabel26.Enabled = false) then
    begin
      QRLabel33.Top := 22;
      QRLabel33.BringToFront;
      QRDBText22.Top := 22;
      QRDBText22.BringToFront;
      qckRepComprobante.Height := 37;
    end else
    if not frmProcVentaRapidaNueva.rxVentaDescUnidadMedida.IsNull then
    begin
      qckRepComprobante.Height := 54;
    end else
    qckRepComprobante.Height := 37;
  end;
end;

procedure TqckRepReciboNuevo.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  Value:=Value;
end;

end.


uses URepComprobanteNuevo;


uses URepComprobanteNuevo;


uses URepComprobanteNuevo;


uses URepComprobanteNuevo;


uses URepComprobanteNuevo;


uses URepComprobanteNuevo;


uses URepComprobanteNuevo;


uses URepComprobanteNuevo;
