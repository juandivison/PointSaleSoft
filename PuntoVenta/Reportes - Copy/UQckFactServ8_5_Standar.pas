unit UQckFactServ8_5_Standar;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckFactServ_8_5Standard = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    ChildBand2: TQRChildBand;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
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
    QRBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBRichText1: TQRDBRichText;
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
    QRDBText10: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr2: TQRExpr;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRExpr6: TQRExpr;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRDBText11: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape16: TQRShape;
    ChildBand4: TQRChildBand;
    QRDBText1: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText18: TQRDBText;
    QRExpr7: TQRExpr;
    QRDBText23: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText29: TQRDBText;
    qrLablNCFAfectado: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel8: TQRLabel;
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
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText25Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRExpr6Print(sender: TObject; var Value: String);
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure QRExpr7Print(sender: TObject; var Value: String);
  private

  public
     xtipoVenta : string;
     valorNCF : string;
     strCopia : string;
  end;

var
  qckFactServ_8_5Standard: TqckFactServ_8_5Standard;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatmodDatosGenerales, UTestImpFiscal,  URepComprobante,{ UDatModFactura, }UDatModReportes, UQckFactServ8_5BB,
  UDatModFactura;

{$R *.DFM}

procedure TqckFactServ_8_5Standard.QuickRepBeforePrint(
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
  qckFactServ_8_5Standard.AllDataSets.Add(dmCompania.tblCompania);
  qckFactServ_8_5Standard.AllDataSets.Add(dmDatos.qryMembrete);
  if dmReportes.qryViewVentasMastNUMERO_NCF.IsNull then
  qrLablNCFAfectado.Caption:=''
  ELSE
  if (Pos('B02',UpperCase(dmReportes.qryViewVentasMastNUMERO_NCF.Value)) > 0 )  then
  qrLablNCFAfectado.Caption :='';

  QRLabel8.Caption:=dmcompania.tblCompaniaEMAIL.Value+' '+
  dmcompania.tblCompaniaWEBSITE.Value;
end;

procedure TqckFactServ_8_5Standard.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  if dmReportes.qryViewVentasMastNOMBRE_VENDEDOR.IsNull then
  Value:=VarNombreUsuario
  else Value:= dmReportes.qryViewVentasMastNOMBRE_VENDEDOR.Value;
end;

procedure TqckFactServ_8_5Standard.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin
end;

procedure TqckFactServ_8_5Standard.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckFactServ_8_5Standard.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckFactServ_8_5Standard.PageNumber);
end;

procedure TqckFactServ_8_5Standard.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckFactServ_8_5Standard.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if (GlbRutaLogoDoc <> '') then
  begin
    if FileExists(GlbRutaLogoDoc) then
    QRImage1.Picture.LoadFromFile(GlbRutaLogoDoc);
  end;
  if dmReportes.qryViewVentasMastDESC_TIPONCF.IsNull then
  QRDBText23.Caption:='FACTURA';
  dmCompania.tblCompania.Close;
  dmCompania.tblcompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);
  QRLabel8.Caption := dmCompania.tblCompaniaEMAIL.Value;
end;

procedure TqckFactServ_8_5Standard.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Length(dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value) > 0  then
  Value:=dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TqckFactServ_8_5Standard.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
  valor : string;
begin
  Valor:= dmReportes.qryViewVentasDetDescripcion.value;
end;

procedure TqckFactServ_8_5Standard.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  Value:= Value+strCopia;
end;

procedure TqckFactServ_8_5Standard.QRDBText23Print(sender: TObject;
  var Value: String);
begin
  dmreportes.qryNCFAfectado.Close;
  dmreportes.qryNCFAfectado.Params[0].Value:= dmReportes.qryViewVentasMastSERIE_NCF_ASIGNADO.Value;
  dmreportes.qryNCFAfectado.Open;
  dmreportes.qryNCFAfectado.First;
  if (dmReportes.qryViewVentasMastFORMA_PAGO.Value = 6) then
  begin
    QRDBText29.Enabled:=False;
    qrLablNCFAfectado.Enabled:=True;
    if Not dmreportes.qryNCFAfectadoNUMERO_NCF.IsNull then
    qrLablNCFAfectado.Caption:='NCF modificado:'+
    dmreportes.qryNCFAfectadoNUMERO_NCF.Value
    else qrLablNCFAfectado.Caption:='';
    qrLablNCFAfectado.Enabled:=True;
  end else
  qrLablNCFAfectado.Enabled:=False;
end;      

procedure TqckFactServ_8_5Standard.QRDBText29Print(sender: TObject;
  var Value: String);
begin
  Value:='Válida hasta:' + Value;
  if dmReportes.qryViewVentasMastNUMERO_NCF.IsNull then
  Value:=''
  ELSE
  if (Pos('B02',UpperCase(dmReportes.qryViewVentasMastNUMERO_NCF.Value)) > 0 )  then
  Value:='';
end;

procedure TqckFactServ_8_5Standard.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmFactura.qryVentaFacturaCOMENTARIO.IsNull) or
  (Length(dmFactura.qryVentaFacturaCOMENTARIO.Value) = 0) then
  begin
    QRDBText30.Enabled:=False;
    QRLabel20.Enabled :=False;
  end;
end;

procedure TqckFactServ_8_5Standard.QRDBText16Print(sender: TObject;
  var Value: String);
begin
  Value:='RNC CLIENTE: '+Value;
end;

procedure TqckFactServ_8_5Standard.QRDBText2Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckFactServ_8_5Standard.QRDBText25Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckFactServ_8_5Standard.QRExpr3Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckFactServ_8_5Standard.QRExpr4Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckFactServ_8_5Standard.QRDBText11Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckFactServ_8_5Standard.QRExpr6Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckFactServ_8_5Standard.QRExpr5Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckFactServ_8_5Standard.QRExpr7Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

end.
