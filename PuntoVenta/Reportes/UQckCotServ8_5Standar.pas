unit UQckCotServ8_5Standar;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckCotServ8_5Standar = class(TQuickRep)
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
    QRLabel11: TQRLabel;
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
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr2: TQRExpr;
    QRShape24: TQRShape;
    QRLabel35: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape18: TQRShape;
    QRLabel3: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape16: TQRShape;
    ChildBand4: TQRChildBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel21: TQRLabel;
    QRImage1: TQRImage;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText18: TQRDBText;
    qrEmail: TQRLabel;
    QRDBText16: TQRDBText;
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
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QRDBText27Print(sender: TObject; var Value: String);
    procedure QRDBText25Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRExpr6Print(sender: TObject; var Value: String);
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure QRExpr7Print(sender: TObject; var Value: String);
  private

  public
     xtipoVenta : string;
     valorNCF : string;
  end;

var
  qckCotServ8_5Standar: TqckCotServ8_5Standar;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatModReportes, UDatModFactura, UDatmodDatosGenerales;
{$R *.DFM}

procedure TqckCotServ8_5Standar.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if dmDatos.qryMembrete.state = dsInactive then
  begin
    dmDatos.qryMembrete.Close;
    dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
    dmDatos.qryMembrete.Open;
  end;

  qckCotServ8_5Standar.AllDataSets.Add(dmCompania.tblCompania);
  qckCotServ8_5Standar.AllDataSets.Add(dmDatos.qryMembrete);

  qrEmail.Caption:=dmcompania.tblCompaniaEMAIL.Value+' '+
  dmcompania.tblCompaniaWEBSITE.Value;
end;

procedure TqckCotServ8_5Standar.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=GlbBuscarCodigoVendedor(GlbcodVendedor);
  if (Value = '') then
  Value:=VarNombreUsuario;
end;

procedure TqckCotServ8_5Standar.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin
end;

procedure TqckCotServ8_5Standar.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckCotServ8_5Standar.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckCotServ8_5Standar.PageNumber);
end;

procedure TqckCotServ8_5Standar.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckCotServ8_5Standar.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if (GlbRutaLogoDoc <> '') then
  begin
    if FileExists(GlbRutaLogoDoc) then
    QRImage1.Picture.LoadFromFile(GlbRutaLogoDoc);
  end;
  //if dmReportes.qryViewVentasMastDESC_TIPONCF.IsNull then
  //QRDBText23.Caption:='FACTURA';
end;

procedure TqckCotServ8_5Standar.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Not dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.IsNull then
  Value:=dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TqckCotServ8_5Standar.QRLabel25Print(sender: TObject;
  var Value: String);
begin
  //if dmFactura.qryRepCotizaNewMONTO_EXONERADO_ITBIS.Value > 0 then
  //begin
  //  Value:='ITBIS Exonerado';
  //end;
end;

procedure TqckCotServ8_5Standar.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
  valor : string;
begin
 valor:= dmReportes.qryViewVentasDetDescripcion.value;
end;

procedure TqckCotServ8_5Standar.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmFactura.qryRepCotizaNewCOMENTARIO.IsNull) or
  (Length(dmFactura.qryRepCotizaNewCOMENTARIO.Value) = 0) then
  begin
    QRLabel20.Enabled:=False;
    QRDBText30.Enabled :=False;
  end;
end;

procedure TqckCotServ8_5Standar.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  Value:='CONTADO';
end;

procedure TqckCotServ8_5Standar.QRDBText27Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckCotServ8_5Standar.QRDBText25Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckCotServ8_5Standar.QRDBText2Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckCotServ8_5Standar.QRExpr3Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckCotServ8_5Standar.QRExpr4Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckCotServ8_5Standar.QRExpr6Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckCotServ8_5Standar.QRExpr5Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckCotServ8_5Standar.QRExpr7Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

end.
