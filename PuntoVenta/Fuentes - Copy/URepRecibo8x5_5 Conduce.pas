unit URepRecibo8x5_5Conduce;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQCKFactRepuesto8x5_5Conduce = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qckRepComprobante: TQRBand;
    PageFooterBand1: TQRBand;
    ChildBand1: TQRChildBand;
    ChildBand4: TQRChildBand;
    QRBand4: TQRBand;
    QRDBText14: TQRDBText;
    qrtipoVenta: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText23: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText20: TQRDBText;
    QRExpr5: TQRExpr;
    QRDBText5: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText1: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure qrtipoVentaPrint(sender: TObject; var Value: String);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSysData4Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
  private

  public
    valorNCF : String[19];
    xtipoVenta : String;
  end;

var
  QCKFactRepuesto8x5_5Conduce: TQCKFactRepuesto8x5_5Conduce;

implementation

uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  URepComprobante, UDatModFactura, UDatModUsuarios, UDatModReportes;

{$R *.DFM}

procedure TQCKFactRepuesto8x5_5Conduce.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QCKFactRepuesto8x5_5.AllDataSets.Add(dmCompania.tblCompania);
  QCKFactRepuesto8x5_5.AllDataSets.Add(frmProcVentaRapida.rxSolDatoscte);
end;

procedure TQCKFactRepuesto8x5_5Conduce.QRLabel19Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TQCKFactRepuesto8x5_5Conduce.qrtipoVentaPrint(sender: TObject;
  var Value: String);
begin
  if xtipoVenta = 'COTIZACION' then
  Value:= 'COTIZACION ' else
  Value:=xtipoVenta;
end;

procedure TQCKFactRepuesto8x5_5Conduce.PageFooterBand1BeforePrint(
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

procedure TQCKFactRepuesto8x5_5Conduce.QRExpr2Print(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = '/' then
  value:='';
end;

procedure TQCKFactRepuesto8x5_5Conduce.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = ',' then
  value:='';
end;

procedure TQCKFactRepuesto8x5_5Conduce.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //qrLabel24.Caption:= GlbPiedePaginaFactura;
end;

procedure TQCKFactRepuesto8x5_5Conduce.QRSysData4Print(sender: TObject;
  var Value: String);
begin
  Value:= Value;
end;

procedure TQCKFactRepuesto8x5_5Conduce.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
  Value := dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.Value;
end;

procedure TQCKFactRepuesto8x5_5Conduce.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  if Not dmCompania.tblCompaniaOBSERVACION.IsNull then
  begin
    if Not dmCompania.tblCompaniaCIUDAD.IsNull then
    Value:=Value + ' '+dmCompania.tblCompaniaCIUDAD.Value;
  end;
end;

procedure TQCKFactRepuesto8x5_5Conduce.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  dmUsuarios.qryUsuarios.Close;
  dmUsuarios.qryUsuarios.Open;
  if dmUsuarios.qryUsuarios.Locate('CODIGO_EMPLEADO',dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value,[]) then
  Value:= dmUsuarios.qryUsuariosCODIGO.Value;
end;

procedure TQCKFactRepuesto8x5_5Conduce.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  {case dmFactura.qryVentaFacturaFORMA_PAGO.Value of
  1 : Value:='Efectivo';
  2	 : Value:='Tarjeta';
  3	 : Value:='Cheque';
  4	 : Value:='Travel Check';
  5	 : Value:='Promoción';
  6	 : Value:='Devolucion';
  7	 : Value:='Credito Normal';
  0	 : Value:='CUADRE';
  8	 : Value:='Credito Directo';
  9	 : Value:='Cupon';
 10	 : Value:='Nota Crédito';
 11	 : Value:='Otro';
 12	 : Value:='Tarjeta Debito';
 13	 : Value:='Tarjeta Propia';
 15	 : Value:='Financiamiento';
 16	 : Value:='Venta Crédito';
 17	 : Value:='Consignación';
 end;  }
 Value:='CONDUCE A CREDITO';
end;

procedure TQCKFactRepuesto8x5_5Conduce.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  Value:=value+' Dias';
  //tblCompania.RNC_NUMERO + Str(Tel. :) + tblCompania.TELEFONO + Str(Fax. :) + tblCompania.FAX
end;

procedure TQCKFactRepuesto8x5_5Conduce.QRDBText16Print(sender: TObject;
  var Value: String);
begin
   Value:='-'+Value;
end;

procedure TQCKFactRepuesto8x5_5Conduce.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  Value:=dmFactura.qryVentaFacturacodigo_cte.asstring+' '+
   + Value;
end;

end.
