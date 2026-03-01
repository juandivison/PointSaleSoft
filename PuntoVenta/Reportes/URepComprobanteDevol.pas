unit URepComprobanteDevol;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepReciboDevol = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    qckRepComprobante: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
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
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    ChildBand3: TQRChildBand;
    QRLabel19: TQRLabel;
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
    ChildBand2: TQRChildBand;
    QRLabel8: TQRLabel;
    QRDBText19: TQRDBText;
    qrLabelRNC: TQRLabel;
    QRDBText20: TQRDBText;
    ChildBand5: TQRChildBand;
    QRLabel26: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText22: TQRDBText;
    ChildBand6: TQRChildBand;
    QRLabel32: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText23: TQRDBText;
    ChildBand7: TQRChildBand;
    QRDBText25: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel24: TQRLabel;
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QRLabel20Print(sender: TObject; var Value: String);
    procedure QRLabel24Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure QRDBText20Print(sender: TObject; var Value: String);
    procedure ChildBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qckRepComprobanteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    valorNCF : String;
    xtipoVenta : String;
    nombreCteGenerico : String;
  end;

var
  qckRepReciboDevol: TqckRepReciboDevol;

implementation

uses UDatModCompania, UDatModClientes, UGlobal, UFormProcDevolucion,
  UProcVentaRapida;

{$R *.DFM}

procedure TqckRepReciboDevol.QRDBText4Print(sender: TObject;
  var Value: String);
begin
 Value :='RNC-'+VALUE;
end;

procedure TqckRepReciboDevol.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepReciboDevol.AllDataSets.Add(dmCompania.tblCompania);
  if Assigned(frmProcVentaRapidaEdicion) then
  qckRepReciboDevol.AllDataSets.Add(frmProcVentaRapidaEdicion.Totales)
  else
  if Assigned(frmProcVentaRapida) then
  qckRepReciboDevol.AllDataSets.Add(frmProcVentaRapida.Totales);
end;

procedure TqckRepReciboDevol.QRLabel19Print(sender: TObject; var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckRepReciboDevol.QRLabel20Print(sender: TObject; var Value: String);
begin
  if (valorNCF <> '') then
  Value:=Value +' '+ Trim(valorNCF) else Value:='';
end;

procedure TqckRepReciboDevol.QRLabel24Print(sender: TObject; var Value: String);
begin
  Value := 'Re-Impresion';//xtipoVenta;
end;

procedure TqckRepReciboDevol.QRLabel2Print(sender: TObject; var Value: String);
begin
  Value:= 'Numero : '
end;

procedure TqckRepReciboDevol.QRLabel1Print(sender: TObject; var Value: String);
begin
  //if qckRepReciboDevol.xtipoVenta = 'Devolucion' then
  Value:= 'DEVOLUCION';
end;

procedure TqckRepReciboDevol.QRLabel14Print(sender: TObject; var Value: String);
begin
  if Length(nombreCteGenerico) > 0 then
  Value := nombreCteGenerico;
  if Not frmProcVentaRapidaEdicion.TotalesNombreCliente.IsNull then
  Value:= frmProcVentaRapidaEdicion.TotalesNombreCliente.Value;
end;

procedure TqckRepReciboDevol.QRDBText20Print(sender: TObject;
  var Value: String);
begin
  if Length(value) > 0 then
  value:='RNC-'+Value;
end;

procedure TqckRepReciboDevol.ChildBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrLabel26.Caption:= GlbPiedePaginaFactura;
end;

procedure TqckRepReciboDevol.qckRepComprobanteBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if Not frmProcVentaRapidaEdicion.rxVentaTipoUnidad.IsNull and
  (frmProcVentaRapidaEdicion.rxVentaTipoUnidad.Value > 0) then
  begin
    if (QRLabel27.Enabled = false) then
    begin
      //qckRepComprobante.Height := 51;
      QRLabel33.Top := 20;
      QRLabel33.BringToFront;
      QRDBText22.Top :=20;
      QRDBText22.BringToFront;
      qckRepComprobante.Height := 37;
      frmProcVentaRapidaEdicion.rxVentaMontoBruto.Value;
    end else
    if not frmProcVentaRapidaEdicion.rxVentaDescUnidadMedida.IsNull then
    begin
      qckRepComprobante.Height := 54;
    end else
    qckRepComprobante.Height := 37;
  end else
  begin
    if (QRLabel27.Enabled = false) then
    qckRepComprobante.Height := 21
    else qckRepComprobante.Height := 37;
  end;
end;

procedure TqckRepReciboDevol.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Length(frmProcVentaRapidaEdicion.rxVentaSerieProd.Value) = 0 then
  ChildBand2.HasChild:= False;
end;

procedure TqckRepReciboDevol.QRDBText23Print(sender: TObject;
  var Value: String);
begin
  Value:=Value;
end;

procedure TqckRepReciboDevol.QRDBText18Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapidaEdicion) then
  Value:=SimboloMoneda(frmProcVentaRapidaEdicion.rxVentaMoneda.Value)+Value
  else
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(frmProcVentaRapida.rxVentaMoneda.Value)+Value;
end;

procedure TqckRepReciboDevol.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapidaEdicion) then
  Value:=SimboloMoneda(frmProcVentaRapidaEdicion.rxVentaMoneda.Value)+Value
  else
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(frmProcVentaRapida.rxVentaMoneda.Value)+Value;
end;

procedure TqckRepReciboDevol.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapidaEdicion) then
  Value:=SimboloMoneda(frmProcVentaRapidaEdicion.rxVentaMoneda.Value)+Value
  else
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(frmProcVentaRapida.rxVentaMoneda.Value)+Value;
end;

procedure TqckRepReciboDevol.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if dmCompania.tblCompaniaOBSERVACION.IsNull then
  PageHeaderBand1.HasChild:=false;
end;

end.
