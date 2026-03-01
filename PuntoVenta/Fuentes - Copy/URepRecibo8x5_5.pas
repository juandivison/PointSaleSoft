unit URepRecibo8x5_5;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQCKFactRepuesto8x5_5 = class(TQuickRep)
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
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel20: TQRLabel;
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
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
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
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText10: TQRDBText;
    QRMemo1: TQRMemo;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel18: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel17: TQRLabel;
    qrExpTotalItbisTransp: TQRExpr;
    QRDBText4: TQRDBText;
    ChildBand2: TQRChildBand;
    QRDBText9: TQRDBText;
    ChildBand3: TQRChildBand;
    QRLabel23: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
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
    procedure TPagPrint(sender: TObject; var Value: String);
    procedure QRSysData4Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRLabel32Print(sender: TObject; var Value: String);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText29Print(sender: TObject; var Value: String);
    procedure QRDBText25Print(sender: TObject; var Value: String);
    procedure QRDBText32Print(sender: TObject; var Value: String);
    procedure QRDBText33Print(sender: TObject; var Value: String);
    procedure QRDBText28Print(sender: TObject; var Value: String);
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    valorNCF : String[19];
    xtipoVenta : String;
  end;

var
  QCKFactRepuesto8x5_5: TQCKFactRepuesto8x5_5;

implementation

uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  URepComprobante, UDatModFactura, UDatModUsuarios, UDatModReportes;

{$R *.DFM}

procedure TQCKFactRepuesto8x5_5.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QCKFactRepuesto8x5_5.AllDataSets.Add(dmCompania.tblCompania);
  QCKFactRepuesto8x5_5.AllDataSets.Add(frmProcVentaRapida.rxSolDatoscte);

  dmreportes.qryNCFAfectado.Close;
  if not dmReportes.qryViewVentasMastSERIE_NCF_ASIGNADO.IsNull then
  dmreportes.qryNCFAfectado.Params[0].Value:= dmReportes.qryViewVentasMastSERIE_NCF_ASIGNADO.Value
  else
  dmreportes.qryNCFAfectado.Params[0].Value:= dmFactura.qryVentaFacturaSERIE_NCF_ASIGNADO.Value;
  dmreportes.qryNCFAfectado.Open;
end;

procedure TQCKFactRepuesto8x5_5.QRLabel19Print(sender: TObject;
  var Value: String);
begin
  //Value:='Usuario:'+VarNombreUsuario;
end;

procedure TQCKFactRepuesto8x5_5.QRLabel20Print(sender: TObject;
  var Value: String);
begin
  if (Not dmFactura.qryVentaFacturaNUMERO_NCF.IsNull) And
     ( dmFactura.qryVentaFacturaNUMERO_NCF.Value <> '' ) then
     if (Length(valorNCF) = 0) then 
     valorNCF := dmFactura.qryVentaFacturaNUMERO_NCF.Value;

  if (valorNCF <> '') then
  Value:=Value +' '+ Trim(valorNCF) else Value:='';
  //if dmfactura.qryVentaFacturaFECHAVENCENCF.IsNull then
  //begin
  //  QRDBText1.Enabled:=False;
  //end else QRDBText1.Enabled:=True;
end;

procedure TQCKFactRepuesto8x5_5.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qrPrinter.PageNumber > 1 then
  begin
    PrintBand:=False;
    Exit;
  end;
  //dmFactura.qryVentaFacturaNUMERO_ncf.value

  case dmFactura.qryVentaFacturaFORMA_PAGO.Value of
  1 : xtipoVenta:='CONTADO';
  2	 :xtipoVenta:='CONTADO';
  3	 : xtipoVenta:='CONTADO';
  4	 : xtipoVenta:='CONTADO';
  5	 : xtipoVenta:='Promoción';
  6	 : xtipoVenta:='Devolucion';
  7	 : xtipoVenta:='CREDITO';
  0	 : xtipoVenta:='CUADRE';
  8	 : xtipoVenta:='Credito Directo';
  9	 : xtipoVenta:='Cupon';
 10	 : xtipoVenta:='Nota Crédito';
 11	 : xtipoVenta:='Otro';
 12	 : xtipoVenta:='CONTADO';
 13	 : xtipoVenta:='CONTADO';
 15	 : xtipoVenta:='Financiamiento';
 16	 : xtipoVenta:='CREDITO';
 17	 : xtipoVenta:='Consignación';
 else
 xtipoVenta:='CONTADO';
 end;

 qrtipoVenta.Caption:=xtipoVenta;

  //if (valorNCF = '') then
  //begin
    //QRLabel20.Enabled:=False;
    //QRExpr5.Enabled:=false;
  //end
  //else QRLabel20.Enabled:= True;

  if (xtipoVenta = 'CONTADO') or (xtipoVenta = 'DEVOLUCION') then
  begin
    QRLabel2.Top:=109;
    QRDBText12.Top:=109;
    QRLabel39.Enabled:=false;
    QRDBText23.Enabled:=false;
    QRLabel36.Enabled:=false;
    QRDBText8.Enabled:=false;
  end;
  QRLabel10.Caption:='RNC :'+dmCompania.tblCompaniaRNC_NUMERO.Value +
  ', Tel.' + dmCompania.tblCompaniaTELEFONO.Value +
  ', Fax.' + dmCompania.tblCompaniaFAX.Value;

  if (frmProcVentaRapida.rxSolDatoscte.RecordCount > 0) then
  begin
    QRLabel12.Caption:=frmProcVentaRapida.rxSolDatoscteNombre.Value;
    QRLabel13.Caption:=frmProcVentaRapida.rxSolDatoscteDireccion1.Value;
    QRLabel14.Caption:=frmProcVentaRapida.rxSolDatoscteTelefono.Value;
    QRDBText5.Enabled:=False;
    QRDBText7.Enabled:=False;
    QRDBText6.Enabled:=False;
  end;
  if dmreportes.qryClientes.state = dsInactive then
  dmreportes.qryClientes.Open;
  if dmreportes.qryClientes.Locate('CODIGO_CTE',
  dmFactura.qryVentaFacturaCODIGO_CTE.Value,[]) then
  begin
    if Length(dmFactura.qryVentaFacturaTELEF_CONTACTO.value) > 0 then
  QRLabel14.Caption:=','+QRLabel14.Caption+ dmreportes.qryClientesMOVIL1.Value
  else
  QRLabel14.Caption:=dmreportes.qryClientesMOVIL1.Value;

  if Length(dmreportes.qryClientesMOVIL2.Value) > 0 then
  if length(QRLabel14.Caption) > 0 then
  QRLabel14.Caption:=','+QRLabel14.Caption+ dmreportes.qryClientesMOVIL2.Value
    else
  QRLabel14.Caption:=QRLabel14.Caption+ dmreportes.qryClientesMOVIL2.Value;

  if Length(dmreportes.qryClientesOTRO_TELEFONO.Value) > 0 then
  if length(QRLabel14.Caption) > 0 then
  QRLabel14.Caption:=','+QRLabel14.Caption +dmreportes.qryClientesOTRO_TELEFONO.Value
  else
  QRLabel14.Caption:=QRLabel14.Caption + dmreportes.qryClientesOTRO_TELEFONO.Value;                                      
  if (QRPrinter.PageNumber > 1) then
  begin
    PrintBand:=False;
  end;
  end;
 QRDBText1.Enabled:=True;
  if dmFactura.qryVentaFacturaNUMERO_NCF.IsNull then
  QRDBText1.Enabled:=False
  ELSE
  if (Pos('B02',uppercase(dmFactura.qryVentaFacturanumero_ncf.value)) > 0 )  then
  QRDBText1.Enabled:=False
  ELSE
  if (Pos('B04',uppercase(dmFactura.qryVentaFacturanumero_ncf.value)) > 0 )  then
  QRDBText1.Enabled:=True
end;

procedure TQCKFactRepuesto8x5_5.qrtipoVentaPrint(sender: TObject;
  var Value: String);
begin
  if xtipoVenta = 'COTIZACION' then
  Value:= 'COTIZACION ' else
  if dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8] then
  Value:= 'CREDITO' else
  if dmFactura.qryVentaFacturaFORMA_PAGO.Value in [6] then
  Value:= 'DEVOLUCION'
  ELSE Value:= 'CONTADO';
  //Value:=xtipoVenta;
end;

procedure TQCKFactRepuesto8x5_5.PageFooterBand1BeforePrint(
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

procedure TQCKFactRepuesto8x5_5.QRExpr2Print(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = '/' then
  value:='';
  Value:=StringReplace(Value,'-','',[rfReplaceAll]);
end;

procedure TQCKFactRepuesto8x5_5.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = ',' then
  value:='';
end;

procedure TQCKFactRepuesto8x5_5.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  Value:= StringReplace(Value, '/', '', [rfIgnoreCase]);
  Value:=Trim(value);
end;

procedure TQCKFactRepuesto8x5_5.QRLabel24Print(sender: TObject;
  var Value: String);
begin
  Value := GlbPiedePaginaFactura;
end;

procedure TQCKFactRepuesto8x5_5.TPagPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+ IntToStr(glbTPag);
end;

procedure TQCKFactRepuesto8x5_5.QRSysData4Print(sender: TObject;
  var Value: String);
begin
  Value:= Value;
end;

procedure TQCKFactRepuesto8x5_5.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
  Value := dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.Value;
end;

procedure TQCKFactRepuesto8x5_5.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  if Not dmCompania.tblCompaniaOBSERVACION.IsNull then
  begin
    if Not dmCompania.tblCompaniaCIUDAD.IsNull then
    Value:=Value + ' '+dmCompania.tblCompaniaCIUDAD.Value;
  end;
end;

procedure TQCKFactRepuesto8x5_5.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if dmCompania.tblCompaniaOBSERVACION.IsNull then
  begin
    if Not dmCompania.tblCompaniaCIUDAD.IsNull then
    Value:=dmCompania.tblCompaniaCIUDAD.Value
    else Value:='';
  end;

end;

procedure TQCKFactRepuesto8x5_5.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  if dmFactura.qryVentaFacturaFORMA_PAGO.Value = 6 then
  begin
    Value:='NCF modificado:'+dmreportes.qryNCFAfectadoNUMERO_NCF.Value
  end else
  begin
    Value:='Válida hasta:'+FormatDateTime('dd/mm/yyyy',dmFactura.qryVentaFacturaFECHAVENCENCF.Value);//dmreportes.qryNCFAfectado.params[0].value
  end;
end;

procedure TQCKFactRepuesto8x5_5.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  dmUsuarios.qryEmpleados.Close;
  dmUsuarios.qryEmpleados.Open;
  if dmUsuarios.qryEmpleados.Locate('CODIGO',dmFactura.qryVentaFacturaCODIGO_VENDEDOR.Value,[]) then
  Value:= dmUsuarios.qryEmpleadosNOMBRE.Value;
end;

procedure TQCKFactRepuesto8x5_5.QRLabel32Print(sender: TObject;
  var Value: String);
begin
  if abs(dmFactura.qryVentaFacturaMONTO_EXONERADO_ITBIS.Value) > 0 then
  QRLabel32.Caption:='Itbis Exonerado'
  else QRLabel32.Caption:='ITBIS %';
end;

procedure TQCKFactRepuesto8x5_5.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  case dmFactura.qryVentaFacturaFORMA_PAGO.Value of
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
 end;
end;

procedure TQCKFactRepuesto8x5_5.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if (value = '0') then
  Value:='30 Dias'
  else
  Value:=value+' Dias';
  //tblCompania.RNC_NUMERO + Str(Tel. :) + tblCompania.TELEFONO + Str(Fax. :) + tblCompania.FAX
end;

procedure TQCKFactRepuesto8x5_5.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrPrinter.PageNumber > 1 then
  PrintBand:=False;
end;

procedure TQCKFactRepuesto8x5_5.QRDBText29Print(sender: TObject;
  var Value: String);
begin
  Value:=UpperCase(value);
end;

procedure TQCKFactRepuesto8x5_5.QRDBText25Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(Value,'-','',[rfReplaceAll]);
end;

procedure TQCKFactRepuesto8x5_5.QRDBText32Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(Value,'-','',[rfReplaceAll]);
end;

procedure TQCKFactRepuesto8x5_5.QRDBText33Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(Value,'-','',[rfReplaceAll]);
end;

procedure TQCKFactRepuesto8x5_5.QRDBText28Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(Value,'-','',[rfReplaceAll]);
end;

procedure TQCKFactRepuesto8x5_5.QRExpr5Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(Value,'-','',[rfReplaceAll]);
end;

procedure TQCKFactRepuesto8x5_5.QRDBText16Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(Value,'-','',[rfReplaceAll]);
end;

procedure TQCKFactRepuesto8x5_5.QRExpr1Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(Value,'-','',[rfReplaceAll]);
end;

procedure TQCKFactRepuesto8x5_5.QRDBText17Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(Value,'-','',[rfReplaceAll]);
end;

procedure TQCKFactRepuesto8x5_5.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  dmreportes.qryConfReportes.Close;
  if dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8,15] then
  dmreportes.qryConfReportes.Params[0].Value:=6 //Fact a Credito
  else
  dmreportes.qryConfReportes.Params[0].Value:=4;
  dmreportes.qryConfReportes.Open;
  if Length(dmreportes.qryConfReportesNOTAPIEPAGINAFACTCREDITO.Value) > 0 then
  begin
    QRMemo1.Lines.Clear;
    QRMemo1.Lines.Add(dmreportes.qryConfReportesNOTAPIEPAGINAFACTCREDITO.Value)
  end else
  if Length(dmreportes.qryConfReportesDESCRIPCION.Value) > 0 then
  begin
    QRMemo1.Lines.Clear;
    QRMemo1.Lines.Add(dmreportes.qryConfReportesDESCRIPCION.Value)
  end else
  QRMemo1.Lines.Clear;
  if GlbTransparentaITBI = 1 then
  begin
    qrExpTotalItbisTransp.Visible:=True;
    QRExpr2.Visible:=False;
  end else
  begin
    QRExpr2.Visible:=True;
    qrExpTotalItbisTransp.Visible:=False;
  end;
end;

procedure TQCKFactRepuesto8x5_5.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (Length(dmFactura.qryVentaFacturaDetDESCRIPCIONAdicional.Value) = 0) or
     (GlbFarmacia = 1) then
   ChildBand2.Height :=0
  else
  ChildBand2.Height:=18;
end;

end.
