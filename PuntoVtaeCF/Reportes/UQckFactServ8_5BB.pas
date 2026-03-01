unit UQckFactServ8_5BB;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckFactServ8_5BB = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
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
    QRDBText28: TQRDBText;
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
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRLabel27: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape16: TQRShape;
    QRDBText23: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    qrLablNCFAfectado: TQRLabel;
    ChildBand4: TQRChildBand;
    QRDBText18: TQRDBText;
    QRLabel11: TQRLabel;
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
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure qrLablNCFAfectadoPrint(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
     xtipoVenta : string;
     valorNCF : string;
  end;

var
  qckFactServ8_5BB: TqckFactServ8_5BB;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  URepComprobante,{ UDatModFactura, }UDatModReportes,
  UDatmodDatosGenerales;

{$R *.DFM}

procedure TqckFactServ8_5BB.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if dmDatos.qryMembrete.state = dsInactive then
  dmDatos.qryMembrete.Open;
  qckFactServ8_5BB.AllDataSets.Add(dmCompania.tblCompania);
  qckFactServ8_5BB.AllDataSets.Add(dmDatos.qryMembrete);
end;

procedure TqckFactServ8_5BB.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckFactServ8_5BB.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin
end;

procedure TqckFactServ8_5BB.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF:'+Value;
end;

procedure TqckFactServ8_5BB.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
 // TPag.Caption:= IntToStr(qckFactServ8_5BB.PageNumber);
 if dmReportes.qryViewVentasMastFecha_vence.IsNull then
 begin
   qrLablNCFAfectado.Top:=50;
   QRDBText11.Enabled:=False;
 end;
end;

procedure TqckFactServ8_5BB.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  //Value:=Value +' de ';
end;

procedure TqckFactServ8_5BB.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  //if SetLogoCia(_ximagen) then
  //if (_ximagen <> '') then
  //QRImage1.Picture.LoadFromFile(_ximagen);
  if dmReportes.qryViewVentasMastDESC_TIPONCF.IsNull then
  QRDBText23.Caption:='FACTURA';
end;

procedure TqckFactServ8_5BB.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Not dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.IsNull then
  if Length(dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value) > 0 then
  Value:=dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TqckFactServ8_5BB.QRLabel25Print(sender: TObject;
  var Value: String);
begin
  if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
  begin
    Value:='ITBIS Exonerado';
  end;
end;

procedure TqckFactServ8_5BB.QRDBText23Print(sender: TObject;
  var Value: String);
begin
  dmreportes.qryNCFAfectado.Close;
  dmreportes.qryNCFAfectado.Params[0].Value:= dmReportes.qryViewVentasMastSERIE_NCF_ASIGNADO.Value;
  dmreportes.qryNCFAfectado.Open;
  dmreportes.qryNCFAfectado.First;
  if (dmReportes.qryViewVentasMastFORMA_PAGO.Value = 6) then
  begin
    //QRDBText29.Enabled:=False;
    if Not dmreportes.qryNCFAfectadoNUMERO_NCF.IsNull then
    begin
      qrLablNCFAfectado.Caption:='NCF modificado:'+
      dmreportes.qryNCFAfectadoNUMERO_NCF.Value;
      qrLablNCFAfectado.Enabled:=True;
      qrLablNCFAfectado.BringToFront;
    end;
  end else
  qrLablNCFAfectado.Enabled:=False;
end;

procedure TqckFactServ8_5BB.qrLablNCFAfectadoPrint(sender: TObject;
  var Value: String);
begin
  //QRDBText29.Enabled:=False;
end;

procedure TqckFactServ8_5BB.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if not dmReportes.qryViewVentasMastFecha_vence.IsNull then
  Value := 'Válida Hasta:'+FormatDatetime('dd/mm/yyyy',dmReportes.qryViewVentasMastFecha_Vence.Value)
  else Value:='';// 'Fecha Vence: '+Value;
end;

procedure TqckFactServ8_5BB.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Length(dmReportes.qryViewVentasDetDESCRIPCIONPRODUCTO.Value) = 0 then
  ChildBand4.Height:=0
  else ChildBand4.Height:=20;
end;

end.
