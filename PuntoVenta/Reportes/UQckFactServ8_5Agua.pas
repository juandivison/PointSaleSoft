unit UQckFactServ8_5Agua;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckFactServ8_5Agua = class(TQuickRep)
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
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
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
    QRLabel22: TQRLabel;
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
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRSysData3: TQRSysData;
    TPag: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText30: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel34: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel35: TQRLabel;
    QRShape18: TQRShape;
    QRLabel3: TQRLabel;
    QRImage1: TQRImage;
    QRExpr3: TQRExpr;
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
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText11: TQRDBText;
    qrLablNCFAfectado: TQRLabel;
    PageFooterBand1: TQRBand;
    QRMemo1: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRMemo5: TQRMemo;
    QRLabel2: TQRLabel;
    QRLabel10: TQRLabel;
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
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure QRDBText29Print(sender: TObject; var Value: String);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure QRDBText20Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
  private

  public
     xtipoVenta : string;
     valorNCF : string;
     strCopia : string;
  end;

var
  qckFactServ8_5Agua: TqckFactServ8_5Agua;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatmodDatosGenerales, UTestImpFiscal,  URepComprobante,UDatModReportes;

{$R *.DFM}

procedure TqckFactServ8_5Agua.QuickRepBeforePrint(
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
  qckFactServ8_5Agua.AllDataSets.Add(dmCompania.tblCompania);
  qckFactServ8_5Agua.AllDataSets.Add(dmDatos.qryMembrete);
end;

procedure TqckFactServ8_5Agua.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckFactServ8_5Agua.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin
end;

procedure TqckFactServ8_5Agua.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckFactServ8_5Agua.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckFactServ8_5Agua.PageNumber);
end;

procedure TqckFactServ8_5Agua.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckFactServ8_5Agua.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if SetLogoCia(_ximagen) then
  if (_ximagen <> '') then
  QRImage1.Picture.LoadFromFile(_ximagen)
  else QRImage1.Enabled:=False;
  if dmReportes.qryViewVentasMastDESC_TIPONCF.IsNull then
  QRDBText23.Caption:='FACTURA';
end;

procedure TqckFactServ8_5Agua.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
  valor : string;
begin
  Valor:= dmReportes.qryViewVentasDetDescripcion.value;
end;

procedure TqckFactServ8_5Agua.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  Value:= Value+strCopia;
end;

procedure TqckFactServ8_5Agua.QRDBText23Print(sender: TObject;
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
    dmreportes.qryNCFAfectadoNUMERO_NCF.Value;
    qrLablNCFAfectado.Enabled:=True;
  end else
  qrLablNCFAfectado.Enabled:=False;
end;

procedure TqckFactServ8_5Agua.QRDBText29Print(sender: TObject;
  var Value: String);
begin
  if dmReportes.qryViewVentasMastFECHA_VENCE.IsNull then
  Value:='' else
  Value:='Válida hasta:'+Value;
end;

procedure TqckFactServ8_5Agua.QRDBText17Print(sender: TObject;
  var Value: String);
begin
  Value:= dmReportes.qryViewVentasMastCODIGO_CTE.AsString+'-'+Value;
end;

procedure TqckFactServ8_5Agua.QRDBText20Print(sender: TObject;
  var Value: String);
begin
  Value:= Value + ','+ dmReportes.qryViewVentasMastDESC_SECTOR.Value;
end;

procedure TqckFactServ8_5Agua.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  Value:=dmReportes.qryViewVentasMastCODIGO_CTE.AsString+'-'+Value;
end;

procedure TqckFactServ8_5Agua.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  if dmreportes.qryViewVentasMastFORMA_PAGO.Value in [7,8] then
  begin
    QRLabel10.Enabled:=True;
    Value:= FormatDateTime('dd/mm/yyyy', dmreportes.qryViewVentasMastFECHA.Value +
    dmreportes.qryViewVentasMastCANT_DIAS_CREDITO.Value);
  end else Value:='';
end;

end.
