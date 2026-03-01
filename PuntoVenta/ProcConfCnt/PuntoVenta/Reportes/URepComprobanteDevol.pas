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
    QRLabel24: TQRLabel;
    ChildBand2: TQRChildBand;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText19: TQRDBText;
    qrLabelRNC: TQRLabel;
    QRDBText20: TQRDBText;
    ChildBand5: TQRChildBand;
    QRLabel26: TQRLabel;
    QRLabel23: TQRLabel;
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
  private

  public
    valorNCF : String[19];
    xtipoVenta : String;
    nombreCteGenerico : String;
  end;

var
  qckRepReciboDevol: TqckRepReciboDevol;

implementation

uses UDatModCompania, UDatModClientes, UGlobal, UFormProcDevolucion;

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
  qckRepReciboDevol.AllDataSets.Add(frmProcVentaRapidaEdicion.Totales);
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

end.
