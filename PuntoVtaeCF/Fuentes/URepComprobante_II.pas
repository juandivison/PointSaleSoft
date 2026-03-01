unit URepComprobante_II;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepReciboNew = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    qckRepComprobante: TQRBand;
    SummaryBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel20: TQRLabel;
    QRDBText14: TQRDBText;
    qrLabelRNC: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText5: TQRDBText;
    ChildBand2: TQRChildBand;
    QRDBText7: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText10: TQRDBText;
    ChildBand3: TQRChildBand;
    QRLabel32: TQRLabel;
    QRDBText21: TQRDBText;
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
    ChildBand4: TQRChildBand;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    ChildBand5: TQRChildBand;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel19: TQRLabel;
    ChildBand6: TQRChildBand;
    QRLabel27: TQRLabel;
    ChildBand7: TQRChildBand;
    QRLabel23: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText23: TQRDBText;
    procedure QRLabel24Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel20Print(sender: TObject; var Value: String);
    procedure ChildBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
  private

  public
    valorNCF : String;
    ncfDesc  : String;
    xtipoVenta : String;
    nombreCteGenerico : String;
    
  end;

var
  qckRepReciboNew: TqckRepReciboNew;

implementation
uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal;
{$R *.DFM}

procedure TqckRepReciboNew.QRLabel24Print(sender: TObject;
  var Value: String);
begin
  Value := xtipoVenta;
end;

procedure TqckRepReciboNew.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  if qckRepReciboNew.xtipoVenta = 'COTIZACION' then
  Value:= 'COTIZACION ';
end;

procedure TqckRepReciboNew.QRLabel14Print(sender: TObject;
  var Value: String);
begin
  if Length(nombreCteGenerico) > 0 then
  Value := NombreCteGenerico;

  if (Length(frmProcVentaRapida.TotalesNombreCliente.Value) > 0 ) then
  Value := frmProcVentaRapida.TotalesNombreCliente.Value;
end;

procedure TqckRepReciboNew.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Length(frmProcVentaRapida.rxVentaSerieProd.Value) = 0 then
  ChildBand2.HasChild:= False;
end;

procedure TqckRepReciboNew.QRLabel19Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckRepReciboNew.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qrLabelRNC.Caption:='';
  qckRepReciboNew.AllDataSets.Add(dmCompania.tblCompania);
  qckRepReciboNew.AllDataSets.Add(frmProcVentaRapida.Totales);
end;

procedure TqckRepReciboNew.QRLabel20Print(sender: TObject;
  var Value: String);
begin
  if (valorNCF <> '') then
  begin
    Value:=Value +' '+ Trim(valorNCF);
    //qrLabelNcfDesc.Caption:=ncfDesc;
  end else Value:='';
end;

procedure TqckRepReciboNew.ChildBand4BeforePrint(Sender: TQRCustomBand;
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

procedure TqckRepReciboNew.ChildBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrLabel27.Caption:= GlbPiedePaginaFactura;
end;

procedure TqckRepReciboNew.QRDBText4Print(sender: TObject;
  var Value: String);
begin
 Value :='RNC-'+VALUE;
end;

procedure TqckRepReciboNew.QRDBText18Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(frmProcVentaRapida.rxVentaMoneda.Value)+Value;
end;

procedure TqckRepReciboNew.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(frmProcVentaRapida.rxVentaMoneda.Value)+Value;
end;

procedure TqckRepReciboNew.QRDBText13Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(frmProcVentaRapida.rxVentaMoneda.Value)+Value;
end;

procedure TqckRepReciboNew.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Assigned(frmProcVentaRapida) then
  Value:=SimboloMoneda(frmProcVentaRapida.rxVentaMoneda.Value)+Value;
end;

end.
