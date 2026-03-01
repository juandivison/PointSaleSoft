unit UQckFactServ8_5_SAMNew;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, RxMemDS;

type
  TqckFactServ_8_5SAMNew = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    ChildBand2: TQRChildBand;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    ChildBand3: TQRChildBand;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel23: TQRLabel;
    QRBand1: TQRBand;
    QRLabel20: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBRichText1: TQRDBRichText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText24: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRSysData3: TQRSysData;
    TPag: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText30: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRExpr3: TQRExpr;
    QRShape16: TQRShape;
    ChildBand4: TQRChildBand;
    QRDBText1: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText29: TQRDBText;
    qrLablNCFAfectado: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo4: TQRMemo;
    QRDBText31: TQRDBText;
    ChildBand5: TQRChildBand;
    QRImage2: TQRImage;
    ChildBand6: TQRChildBand;
    QRDBText3: TQRDBText;
    rxVendedor: TRxMemoryData;
    rxVendedorNombreVendedor: TStringField;
    QRImage1: TQRImage;
    QRBand2: TQRBand;
    QRImage3: TQRImage;
    QRLabel19: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel1: TQRLabel;
    QRDBText11: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr7: TQRExpr;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSysData3Print(sender: TObject; var Value: String);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure QRDBText29Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public
     xtipoVenta : string;
     valorNCF : string;
     strCopia : string;
  end;

var
  qckFactServ_8_5SAMNew: TqckFactServ_8_5SAMNew;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatmodDatosGenerales, UTestImpFiscal,  URepComprobante,{ UDatModFactura, }UDatModReportes, UQckFactServ8_5BB,
  UDatModFactura;

{$R *.DFM}

procedure TqckFactServ_8_5SAMNew.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  {if dmReportes.qryViewVentasMastTIPONCFIFISCAL.Value In [4,5] then
  begin
    qrLabelExoItbis.Enabled:=True;
    QRLabel25.Enabled:=False;
  end;}
  if dmDatos.qryMembrete.state = dsInactive then
  begin
    dmDatos.qryMembrete.Close;
    dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
    dmDatos.qryMembrete.Open;
  end;
  qckFactServ_8_5SAMNew.AllDataSets.Add(dmCompania.tblCompania);
  qckFactServ_8_5SAMNew.AllDataSets.Add(dmDatos.qryMembrete);
  if dmReportes.qryViewVentasMastNUMERO_NCF.IsNull then
  qrLablNCFAfectado.Caption:=''
  ELSE
  if (Pos('B02',UpperCase(dmReportes.qryViewVentasMastNUMERO_NCF.Value)) > 0 )  then
  qrLablNCFAfectado.Caption :='';
end;

procedure TqckFactServ_8_5SAMNew.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:='';
  if dmReportes.qryViewVentasMastNOMBRE_VENDEDOR.IsNull and
  dmReportes.qryCantVendedoresSamCANTVENDEDORES.IsNull then
  Value:=VarNombreUsuario
  else
  begin
    if not dmReportes.qryCantVendedoresSamCANTVENDEDORES.IsNull then
    begin
      if dmReportes.qryCantVendedoresSamCANTVENDEDORES.Value > 1 then
      Value:= 'Múltiples Vendedores' else
      if dmReportes.qryViewVentasMastNOMBRE_VENDEDOR.IsNull then
      begin
        if (rxVendedorNombreVendedor.Value = '') or
        (rxVendedorNombreVendedor.IsNull) then
        Value:= VarNombreUsuario
        else
        Value:=rxVendedorNombreVendedor.Value;
      end
      else
      if not rxVendedorNombreVendedor.IsNull then
      Value:=rxVendedorNombreVendedor.Value
      else
      Value:= dmReportes.qryViewVentasMastNOMBRE_VENDEDOR.Value;
    end else
    Value:= dmReportes.qryViewVentasMastNOMBRE_VENDEDOR.Value;
  end;
end;

procedure TqckFactServ_8_5SAMNew.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin
end;

procedure TqckFactServ_8_5SAMNew.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckFactServ_8_5SAMNew.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckFactServ_8_5SAMNew.PageNumber);
end;

procedure TqckFactServ_8_5SAMNew.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckFactServ_8_5SAMNew.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if dmReportes.qryViewVentasMastDESC_TIPONCF.IsNull then
  QRDBText23.Caption:='FACTURA';
end;

procedure TqckFactServ_8_5SAMNew.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Length(dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value) > 0  then
  Value:=dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TqckFactServ_8_5SAMNew.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
  valor : string;
begin
  Valor:= dmReportes.qryViewVentasDetDescripcion.value;
end;

procedure TqckFactServ_8_5SAMNew.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  Value:= Value+strCopia;
end;

procedure TqckFactServ_8_5SAMNew.QRDBText23Print(sender: TObject;
  var Value: String);
begin
  dmreportes.qryNCFAfectado.Close;
  dmreportes.qryNCFAfectado.Params[0].Value:= dmReportes.qryViewVentasMastSERIE_NCF_ASIGNADO.Value;
  dmreportes.qryNCFAfectado.Open;
  dmreportes.qryNCFAfectado.First;
  if (dmReportes.qryViewVentasMastFORMA_PAGO.Value = 6) then
  begin
    QRDBText29.Enabled:=False;
    if Not dmreportes.qryNCFAfectadoNUMERO_NCF.IsNull then
    qrLablNCFAfectado.Caption:='NCF modificado:'+
    dmreportes.qryNCFAfectadoNUMERO_NCF.Value
    else qrLablNCFAfectado.Caption:='';
    qrLablNCFAfectado.Enabled:=True;
  end else
  qrLablNCFAfectado.Enabled:=False;
end;

procedure TqckFactServ_8_5SAMNew.QRDBText29Print(sender: TObject;
  var Value: String);
begin
  Value:='Válida hasta:'+Value;
  if dmReportes.qryViewVentasMastNUMERO_NCF.IsNull then
  Value:=''
  ELSE
  if (Pos('B02',UpperCase(dmReportes.qryViewVentasMastNUMERO_NCF.Value)) > 0 )  then
  Value:='';
end;

procedure TqckFactServ_8_5SAMNew.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmFactura.qryVentaFacturaCOMENTARIO.IsNull) or
  (Length(dmFactura.qryVentaFacturaCOMENTARIO.Value) = 0) then
  begin
    QRDBText30.Enabled:=False;
    QRLabel20.Enabled :=False;
  end;
end;

procedure TqckFactServ_8_5SAMNew.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if dmReportes.qryViewVentasDetDESCRIPCIONPRODUCTO.IsNull then
  QRSubDetail1.HasChild:=False;
end;

end.
