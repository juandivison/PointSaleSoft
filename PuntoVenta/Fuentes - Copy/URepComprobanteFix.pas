unit URepComprobanteFix;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepReciboFix = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    qckRepComprobante: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRDBText19: TQRDBText;
    qrLabelRNC: TQRLabel;
    QRDBText20: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel10: TQRLabel;
    ChildBand2: TQRChildBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    ChildBand3: TQRChildBand;
    QRLabel32: TQRLabel;
    QRDBText21: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel18: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText23: TQRDBText;
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
    QRLabel3: TQRLabel;
    ChildBand7: TQRChildBand;
    QRLabel23: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText13: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qckRepComprobanteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText20Print(sender: TObject; var Value: String);
    procedure QRLabel19Print(sender: TObject; var Value: String);
  private

  public
    xtipoVenta : String;
  end;

var
  qckRepReciboFix: TqckRepReciboFix;

implementation
uses UDatModCompania, UDatModClientes, UDatModReportes, UGlobal;

{$R *.DFM}

procedure TqckRepReciboFix.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qrLabelRNC.Caption:='';
  qckRepReciboFix.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepReciboFix.qckRepComprobanteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Not dmreportes.qryViewVentasDetDESC_TIPOUNIDAD.IsNull then
  begin
    if (QRLabel27.Enabled = false) then
    begin
      QRLabel33.Top := 22;
      QRLabel33.BringToFront;
      QRDBText22.Top := 22;
      QRDBText22.BringToFront;
      qckRepComprobante.Height := 37;
    end else
    if not dmreportes.qryViewVentasDetDESC_TIPOUNIDAD.IsNull then
    begin
      qckRepComprobante.Height := 54;
    end else
    qckRepComprobante.Height := 37;
  end;
end;

procedure TqckRepReciboFix.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Length(dmReportes.qryViewVentasDetSERIE_PROD.Value) = 0 then
  ChildBand2.HasChild:= False;
end;

procedure TqckRepReciboFix.ChildBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (UpperCase(dmReportes.qryViewVentasMastDESC_TIPOPAGO.Value) = 'EFECTIVO') then
  xTipoVenta:='CONTADO' else
  xTipoVenta:=UpperCase(dmReportes.qryViewVentasMastDESC_TIPOPAGO.Value);

  if not dmReportes.qryViewVentasMastFORMA_PAGO.Value in [7,8,15,16] then
  //if (xtipoVenta = 'CONTADO') then
  begin
    QRLabel28.Enabled:=False;
    QRLabel29.Enabled:=False;
    QRLabel31.Enabled:=False;
    QRLabel30.Enabled:=False;
    ChildBand4.Height:=1;
  end;
end;

procedure TqckRepReciboFix.ChildBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel3.Caption:= GlbPiedePaginaFactura;
end;

procedure TqckRepReciboFix.QRDBText20Print(sender: TObject;
  var Value: String);
begin
  if length(value) > 0 then
  Value:='RNC-'+Value;
end;

procedure TqckRepReciboFix.QRLabel19Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
end;

end.
