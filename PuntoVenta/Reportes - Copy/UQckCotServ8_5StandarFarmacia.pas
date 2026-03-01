unit UQckCotServ8_5StandarFarmacia;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckCotServ8_5Farmacia = class(TQuickRep)
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
    QRDBText2: TQRDBText;
    QRShape18: TQRShape;
    QRLabel3: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape16: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText16: TQRDBText;
    QRImage1: TQRImage;
    QRDBText28: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel21: TQRLabel;
    QRExpr8: TQRExpr;
    PageFooterBand1: TQRBand;
    QRDBText14: TQRDBText;
    QRLabel34: TQRLabel;
    QRShape23: TQRShape;
    QRLabel35: TQRLabel;
    QRShape24: TQRShape;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSysData3Print(sender: TObject; var Value: String);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText27Print(sender: TObject; var Value: String);
    procedure QRDBText25Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRExpr6Print(sender: TObject; var Value: String);
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure QRExpr7Print(sender: TObject; var Value: String);
    procedure QRExpr8Print(sender: TObject; var Value: String);
  private

  public
     xtipoVenta : string;
     valorNCF : string;
  end;

var
  qckCotServ8_5Farmacia: TqckCotServ8_5Farmacia;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatModReportes, UDatModFactura, UDatmodDatosGenerales;
{$R *.DFM}

procedure TqckCotServ8_5Farmacia.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if dmDatos.qryMembrete.state = dsInactive then
  begin
    dmDatos.qryMembrete.Close;
    dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
    dmDatos.qryMembrete.Open;
  end;

  qckCotServ8_5Farmacia.AllDataSets.Add(dmCompania.tblCompania);
  qckCotServ8_5Farmacia.AllDataSets.Add(dmDatos.qryMembrete);

  //qrEmail.Caption:=dmcompania.tblCompaniaEMAIL.Value+' '+
  //dmcompania.tblCompaniaWEBSITE.Value;
end;

procedure TqckCotServ8_5Farmacia.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=GlbBuscarCodigoVendedor(GlbcodVendedor);
  if (Value = '') then
  Value:=VarNombreUsuario;
end;

procedure TqckCotServ8_5Farmacia.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin
end;

procedure TqckCotServ8_5Farmacia.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckCotServ8_5Farmacia.PageNumber);
end;

procedure TqckCotServ8_5Farmacia.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckCotServ8_5Farmacia.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if SetLogoCia(_ximagen) then
  if (_ximagen <> '') then
  QRImage1.Picture.LoadFromFile(_ximagen);
end;

procedure TqckCotServ8_5Farmacia.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
  valor : string;
begin
 valor:= dmReportes.qryViewVentasDetDescripcion.value;
end;

procedure TqckCotServ8_5Farmacia.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmFactura.qryRepCotizaNewCOMENTARIO.IsNull) or
  (Length(dmFactura.qryRepCotizaNewCOMENTARIO.Value) = 0) then
  begin
    QRLabel20.Enabled:=False;
    QRDBText30.Enabled :=False;
  end;

  QRExpr8.Visible:=false;
  QRExpr4.Visible:=false;

  if (GlbMSubTotalSinITBIS = 1) then
  begin
    QRExpr4.Enabled:=True;
    QRExpr4.Visible:=True;
    QRExpr4.BringToFront;
  end else
  begin
    QRExpr8.Enabled:=True;
    QRExpr8.Visible:=True;
    QRExpr8.BringToFront;
  end;
  
end;

procedure TqckCotServ8_5Farmacia.QRDBText27Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckCotServ8_5Farmacia.QRDBText25Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckCotServ8_5Farmacia.QRDBText2Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckCotServ8_5Farmacia.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckCotServ8_5Farmacia.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[rfReplaceAll]);
  Value:=SimboloMoneda(dmFactura.qryRepCotizaNewMONEDA.Value)+Value;
end;

procedure TqckCotServ8_5Farmacia.QRExpr6Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckCotServ8_5Farmacia.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[rfReplaceAll]);
end;

procedure TqckCotServ8_5Farmacia.QRExpr7Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[rfReplaceAll]);
  Value:=SimboloMoneda(dmFactura.qryRepCotizaNewMONEDA.Value)+Value;
end;

procedure TqckCotServ8_5Farmacia.QRExpr8Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[rfReplaceAll]);
  Value:=SimboloMoneda(dmFactura.qryRepCotizaNewMONEDA.Value)+Value;
end;

end.
