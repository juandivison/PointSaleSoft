unit UQckFactServ8_5Limao;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckFactServ8_5Limao = class(TQuickRep)
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
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
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
    QRLabel19: TQRLabel;
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
    QRDBText22: TQRDBText;
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
    QRLabel2: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel34: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel35: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape18: TQRShape;
    QRLabel3: TQRLabel;
    QRExpr6: TQRExpr;
    QRImage1: TQRImage;
    QRDBText23: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText11: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape16: TQRShape;
    ChildBand4: TQRChildBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText18: TQRDBText;
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
    procedure QRLabel25Print(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
     xtipoVenta : string;
     valorNCF : string;
  end;

var
  qckFactServ8_5Limao: TqckFactServ8_5Limao;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatmodDatosGenerales, UTestImpFiscal,  URepComprobante,{ UDatModFactura, }UDatModReportes, UQckFactServ8_5BB;

{$R *.DFM}

procedure TqckFactServ8_5Limao.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if dmDatos.qryMembrete.state = dsInactive then
  begin
    dmDatos.qryMembrete.Close;
    dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
    dmDatos.qryMembrete.Open;
  end;
  qckFactServ8_5Limao.AllDataSets.Add(dmCompania.tblCompania);
  qckFactServ8_5Limao.AllDataSets.Add(dmDatos.qryMembrete);
end;

procedure TqckFactServ8_5Limao.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckFactServ8_5Limao.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin
end;

procedure TqckFactServ8_5Limao.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckFactServ8_5Limao.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckFactServ8_5Limao.PageNumber);
end;

procedure TqckFactServ8_5Limao.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckFactServ8_5Limao.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if SetLogoCia(_ximagen) then
  if (_ximagen <> '') then
  QRImage1.Picture.LoadFromFile(_ximagen);
  if dmReportes.qryViewVentasMastDESC_TIPONCF.IsNull then
  QRDBText23.Caption:='FACTURA';
end;

procedure TqckFactServ8_5Limao.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Length(dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value) > 0  then
  Value:=dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TqckFactServ8_5Limao.QRLabel25Print(sender: TObject;
  var Value: String);
begin
  if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
  begin
    Value:='ITBIS Exonerado';
  end;
end;

procedure TqckFactServ8_5Limao.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
  valor : string;
begin
 valor:= dmReportes.qryViewVentasDetDescripcion.value;
end;

end.
