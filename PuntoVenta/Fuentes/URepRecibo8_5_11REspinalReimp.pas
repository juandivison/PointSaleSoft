unit URepRecibo8_5_11REspinalReimp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepRecibo8_5_11REspReimp = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    qckRepComprobante: TQRBand;
    PageFooterBand1: TQRBand;
    ChildBand1: TQRChildBand;
    ChildBand4: TQRChildBand;
    QRBand4: TQRBand;
    QRDBText14: TQRDBText;
    QRExpr1: TQRExpr;
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
    QRLabel20: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel22: TQRLabel;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
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
    QRDBText1: TQRDBText;
    ChildBand2: TQRChildBand;
    QRLabel28: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel33: TQRLabel;
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
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure TPagPrint(sender: TObject; var Value: String);
    procedure QRSysData4Print(sender: TObject; var Value: String);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private

  public
    valorNCF : String[19];
    xtipoVenta : String;
  end;

var
  qckRepRecibo8_5_11REspReimp: TqckRepRecibo8_5_11REspReimp;

implementation

uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  URepComprobante, UDatModFactura;

{$R *.DFM}

procedure TqckRepRecibo8_5_11REspReimp.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepRecibo8_5_11REspReimp.AllDataSets.Add(dmCompania.tblCompania);
  qckRepRecibo8_5_11REspReimp.AllDataSets.Add(frmProcVentaRapida.rxSolDatoscte);
end;

procedure TqckRepRecibo8_5_11REspReimp.QRLabel19Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckRepRecibo8_5_11REspReimp.QRLabel20Print(sender: TObject;
  var Value: String);
begin
  if (Not dmFactura.qryVentaFacturaDetNUMERO_NCF.IsNull) And
     ( dmFactura.qryVentaFacturaDetNUMERO_NCF.Value <> '' ) then
     if (Length(valorNCF) = 0) then 
     valorNCF := dmFactura.qryVentaFacturaDetNUMERO_NCF.Value;

  if (valorNCF <> '') then
  Value:=Value +' '+ Trim(valorNCF) else Value:='';
  //if (dmFactura.qryVentaFacturaTIPONCFIFISCAL.Value = 0) or (   //consumidor final o ncr consumidor final
  //mFactura.qryVentaFacturaTIPONCFIFISCAL.Value = 2) then
  if (Pos('CONSUMO',UPPERCASE(dmFactura.qryVentaFacturaDESCRIPCION_NCF.Value))>0) OR
     (Pos('FINAL',UPPERCASE(dmFactura.qryVentaFacturaDESCRIPCION_NCF.Value))>0) OR
     (Pos('NOTA DE',UPPERCASE(dmFactura.qryVentaFacturaDESCRIPCION_NCF.Value))>0) THEN
  begin
    QRDBText1.Enabled:=False;
    //QRLabel5.Left:=614;
    //QRDBText15.Left:=681;
  end;  
end;

procedure TqckRepRecibo8_5_11REspReimp.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (Length(dmFactura.qryVentaFacturaDetNUMERO_NCF.Value) = 0) then
  begin
    QRLabel20.Enabled:=False;
    //QRExpr5.Enabled:=false;
    QRDBText1.Enabled:=False;
    //QRLabel5.Left:=614;
    //QRDBText15.Left:=681;    
  end                                            
  else QRLabel20.Enabled:= True;
  if (xtipoVenta = 'CONTADO') then
  begin
    qrLabel2.Top:=78;
    QRDBText12.Top:=78;
    QRLabel28.Enabled:=False;
    QRDBText23.Enabled:=False;
  end;
  if (dmFactura.qryVentaFacturaFORMA_PAGO.Value = 7) or
     (dmFactura.qryVentaFacturaFORMA_PAGO.Value = 8) then
     QRBand4.HasChild:=True
  else QRBand4.HasChild:=False;
end;

procedure TqckRepRecibo8_5_11REspReimp.qrtipoVentaPrint(sender: TObject;
  var Value: String);
begin
  if xtipoVenta = 'COTIZACION' then
  Value:= 'COTIZACION ' else
  Value:=xtipoVenta;
end;

procedure TqckRepRecibo8_5_11REspReimp.PageFooterBand1BeforePrint(
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

procedure TqckRepRecibo8_5_11REspReimp.QRExpr2Print(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = '/' then
  value:='';
end;

procedure TqckRepRecibo8_5_11REspReimp.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = ',' then
  value:='';
end;

procedure TqckRepRecibo8_5_11REspReimp.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  Value:= StringReplace(Value, '/', '', [rfIgnoreCase]);
  Value:=Trim(value);
end;

procedure TqckRepRecibo8_5_11REspReimp.QRLabel24Print(sender: TObject;
  var Value: String);
begin
  Value := GlbPiedePaginaFactura;
end;

procedure TqckRepRecibo8_5_11REspReimp.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrLabel24.Caption:= GlbPiedePaginaFactura;
end;

procedure TqckRepRecibo8_5_11REspReimp.TPagPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+ IntToStr(glbTPag);
end;

procedure TqckRepRecibo8_5_11REspReimp.QRSysData4Print(sender: TObject;
  var Value: String);
begin
  Value:= Value;
end;

procedure TqckRepRecibo8_5_11REspReimp.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if length(dmFactura.qryVentaFacturaDetSERIE_PROD.Value)= 0 then
  begin
    ChildBand3.Height:=1;
    QRLabel10.Enabled:=false;
  end;
end;

procedure TqckRepRecibo8_5_11REspReimp.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
  Value := dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.Value;
end;

procedure TqckRepRecibo8_5_11REspReimp.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  Value:='RNC-'+Value;
end;

procedure TqckRepRecibo8_5_11REspReimp.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  if Not dmCompania.tblCompaniaOBSERVACION.IsNull then
  begin
    if Not dmCompania.tblCompaniaCIUDAD.IsNull then
    Value:=Value + ' '+dmCompania.tblCompaniaCIUDAD.Value;
  end;
end;

procedure TqckRepRecibo8_5_11REspReimp.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if dmCompania.tblCompaniaOBSERVACION.IsNull then
  begin
    if Not dmCompania.tblCompaniaCIUDAD.IsNull then
    Value:=dmCompania.tblCompaniaCIUDAD.Value
    else Value:='';
  end;

end;

procedure TqckRepRecibo8_5_11REspReimp.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  Value:='Válida hasta:'+Value;
end;

end.
