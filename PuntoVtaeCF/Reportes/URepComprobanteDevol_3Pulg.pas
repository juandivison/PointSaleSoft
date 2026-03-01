unit URepComprobanteDevol_3Pulg;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepReciboDevol3Pulg = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    qckRepComprobante: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel18: TQRLabel;
    ChildBand4: TQRChildBand;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    ChildBand3: TQRChildBand;
    QRLabel19: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    ChildBand5: TQRChildBand;
    QRLabel26: TQRLabel;
    QRLabel23: TQRLabel;
    ChildBand7: TQRChildBand;
    QRDBText25: TQRDBText;
    QRLabel1: TQRLabel;
    QRExpr5: TQRExpr;
    QRSubDetail1: TQRSubDetail;
    ChildBand8: TQRChildBand;
    ChildBand9: TQRChildBand;
    QRLabel32: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText22: TQRDBText;
    ChildBand2: TQRChildBand;
    ChildBand6: TQRChildBand;
    QRLabel2: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText24: TQRDBText;
    ChildBand10: TQRChildBand;
    QRLabel12: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel36: TQRLabel;
    QRDBText9: TQRDBText;
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QRLabel20Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRDBText20Print(sender: TObject; var Value: String);
    procedure ChildBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand8AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure ChildBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure ChildBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    valorNCF : String[19];
    xtipoVenta : String;
    nombreCteGenerico : String;
  end;

var
  qckRepReciboDevol3Pulg: TqckRepReciboDevol3Pulg;

implementation

uses UDatModCompania, UDatModClientes, UGlobal, UFormProcDevolucion,
  UProcVentaRapida,UDatModFactura, UDatModReportes;

{$R *.DFM}

procedure TqckRepReciboDevol3Pulg.QRDBText4Print(sender: TObject;
  var Value: String);
begin
 Value :='RNC-'+VALUE;
end;

procedure TqckRepReciboDevol3Pulg.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepReciboDevol3Pulg.AllDataSets.Add(dmCompania.tblCompania);
  if Assigned(frmProcVentaRapidaEdicion) then
  begin
    qckRepReciboDevol3Pulg.AllDataSets.Add(frmProcVentaRapidaEdicion.Totales);
    qckRepReciboDevol3Pulg.AllDataSets.Add(frmProcVentaRapidaEdicion.rxSolDatoscte);
  end else
  if Assigned(frmProcVentaRapida) then
  begin
    qckRepReciboDevol3Pulg.AllDataSets.Add(frmProcVentaRapida.Totales);
    qckRepReciboDevol3Pulg.AllDataSets.Add(frmProcVentaRapida.rxSolDatoscte);
  end;

  if not dmReportes.qryViewVentasMastSERIE_NCF_ASIGNADO.IsNull then
  ProcNCFAfectado(dmreportes.qryViewVentasMastSERIE_NCF_ASIGNADO.Value)
  else
  ProcNCFAfectado(dmFactura.qryVentaFacturaSERIE_NCF_ASIGNADO.Value);
end;

procedure TqckRepReciboDevol3Pulg.QRLabel19Print(sender: TObject; var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckRepReciboDevol3Pulg.QRLabel20Print(sender: TObject; var Value: String);
begin
  if (Not dmFactura.qryVentaFacturaDetNUMERO_NCF.IsNull) And
     ( dmFactura.qryVentaFacturaDetNUMERO_NCF.Value <> '' ) then
     if (Length(valorNCF) = 0) then 
     valorNCF := dmFactura.qryVentaFacturaDetNUMERO_NCF.Value;

  if (valorNCF <> '') then
  Value:='NCF:'+Trim(valorNCF)
  else Value:='';
end;

procedure TqckRepReciboDevol3Pulg.QRLabel2Print(sender: TObject; var Value: String);
begin
  Value:= 'Numero : '
end;

procedure TqckRepReciboDevol3Pulg.QRLabel1Print(sender: TObject; var Value: String);
begin
  Value:= xtipoVenta;
end;

procedure TqckRepReciboDevol3Pulg.QRDBText20Print(sender: TObject;
  var Value: String);
begin
  if Length(value) > 0 then
  value:='RNC CLIENTE:'+Value;
end;

procedure TqckRepReciboDevol3Pulg.ChildBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrLabel26.Caption:= GlbPiedePaginaFactura;
end;

procedure TqckRepReciboDevol3Pulg.QRDBText23Print(sender: TObject;
  var Value: String);
begin
  Value:=Value;
end;

procedure TqckRepReciboDevol3Pulg.QRDBText18Print(sender: TObject;
  var Value: String);
begin
  //if Assigned(frmProcVentaRapidaEdicion) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
  //else
  //if Assigned(frmProcVentaRapida) then
  //Value:=SimboloMoneda(frmProcVentaRapida.rxVentaMoneda.Value)+Value;
  Value:= StringReplace(Value,'-','',[rfReplaceAll]);//RNC Cliente
end;

procedure TqckRepReciboDevol3Pulg.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  //if Assigned(frmProcVentaRapidaEdicion) then
  Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
  //else
  //if Assigned(frmProcVentaRapida) then
  //Value:=SimboloMoneda(frmProcVentaRapida.rxVentaMoneda.Value)+Value;
end;

procedure TqckRepReciboDevol3Pulg.QRDBText11Print(sender: TObject;
  var Value: String);
begin
   Value:=SimboloMoneda(dmFactura.qryVentaFacturaMONEDA.Value)+Value;
  //if Assigned(frmProcVentaRapidaEdicion) then
  //Value:=SimboloMoneda(frmProcVentaRapidaEdicion.rxVentaMoneda.Value)+Value
  //else
  //if Assigned(frmProcVentaRapida) then
  //Value:=SimboloMoneda(frmProcVentaRapida.rxVentaMoneda.Value)+Value;
end;

procedure TqckRepReciboDevol3Pulg.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if dmCompania.tblCompaniaOBSERVACION.IsNull then
  PageHeaderBand1.HasChild:=false;
end;

procedure TqckRepReciboDevol3Pulg.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if Not dmFactura.qryVentaFacturaDetTIPO_UNIDAD.IsNull and
  (dmFactura.qryVentaFacturaDetTIPO_UNIDAD.Value > 0) then
  begin
    if (QRLabel27.Enabled = false) then
    begin
      //qckRepComprobante.Height := 51;
      QRLabel33.Top := 20;
      QRLabel33.BringToFront;
      QRDBText22.Top :=20;
      QRDBText22.BringToFront;
      QRSubDetail1.Height := 37;
      //frmProcVentaRapidaEdicion.rxVentaMontoBruto.Value;
    end else
    if not dmFactura.qryVentaFacturaDetTIPO_UNIDAD.IsNull then
    begin
      QRSubDetail1.Height := 65;
      if GlbImpCodProducto = 0 then
      QRSubDetail1.Height := 22;
    end else
    QRSubDetail1.Height := 45;
  end else
  begin
    if (QRLabel27.Enabled = false) then
    QRSubDetail1.Height := 22
    else QRSubDetail1.Height := 42;
    if GlbImpCodProducto = 0 then
    QRSubDetail1.Height := 22;
  end;
end;

procedure TqckRepReciboDevol3Pulg.ChildBand8AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if Length(dmFactura.qryVentaFacturaDetSERIE_PROD.Value) = 0 then
  ChildBand8.HasChild:= False;
end;

procedure TqckRepReciboDevol3Pulg.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  if (not dmFactura.qryVentaFacturanombre_facturar.IsNull or (dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value <>'')) then
  QRLabel12.Caption :='NOMBRE O RAZON SOCIAL:'+dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value
  else QRLabel12.Caption:='NOMBRE O RAZON SOCIAL:'+dmFactura.qryVentaFacturaNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TqckRepReciboDevol3Pulg.ChildBand2AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if (dmFactura.qryVentaFacturaDESCRIPCION_NCF.IsNull) then
  begin
    ChildBand6.Height:=1;
    qckRepReciboDevol3Pulg.Page.Length:=
    qckRepReciboDevol3Pulg.Page.Length - 1;
  end;
end;

procedure TqckRepReciboDevol3Pulg.QRLabel13Print(sender: TObject;
  var Value: String);
begin
  Value:='NCF modificado:'+dmreportes.qryNCFAfectadoNUMERO_NCF.Value;
end;

procedure TqckRepReciboDevol3Pulg.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if not dmfactura.qryVentaFacturaFECHAVENCENCF.IsNull then
  Value := 'Válida Hasta:'+FormatDatetime('dd/mm/yyyy',dmfactura.qryVentaFacturaFECHAVENCENCF.Value)
  else
  Value:='Fecha Vence: '+FormatDatetime('dd/mm/yyyy',dmfactura.qryVentaFacturaFechaVence.value);
end;

procedure TqckRepReciboDevol3Pulg.ChildBand6BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if dmFactura.qryVentaFacturaRNC_NUMERO.IsNull then
  ChildBand10.Height:=0;
end;

procedure TqckRepReciboDevol3Pulg.QRDBText17Print(sender: TObject;
  var Value: String);
begin
  Value:= StringReplace(Value,'-','',[rfReplaceAll]);//RNC Cliente  
end;

procedure TqckRepReciboDevol3Pulg.QRDBText16Print(sender: TObject;
  var Value: String);
begin
  Value:= StringReplace(Value,'-','',[rfReplaceAll]);//RNC Cliente
end;

procedure TqckRepReciboDevol3Pulg.PageFooterBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (Abs(dmFactura.qryVentaFacturaPROPINALEGAL.Value) = 0) then
  begin
    QRLabel36.Visible:=False;
    QRDBText9.Visible:=False;
    QRShape1.Top :=68;
    QRShape2.Top :=92;
    QRLabel25.Top:=70;
    QRLabel25.BringToFront;
    QRDBText18.Top:=70;
    QRDBText18.BringToFront;
  end;
end;

end.
