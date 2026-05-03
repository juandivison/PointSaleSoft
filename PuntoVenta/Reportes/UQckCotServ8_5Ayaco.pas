unit UQckCotServ8_5Ayaco;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckCotServ8_5Ayaco = class(TQuickRep)
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
    qrdbtextprecioSinConItbis: TQRDBText;
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
    QRExpr7: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape16: TQRShape;
    ChildBand4: TQRChildBand;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
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
    QRLabel1: TQRLabel;
    QRLabel26: TQRLabel;
    ChildBand5: TQRChildBand;
    QRDBText23: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText33: TQRDBText;
    qrdbtextprecioConItbis: TQRDBText;
    qrlblItbisenPrecio: TQRLabel;
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
    procedure ChildBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr7Print(sender: TObject; var Value: String);
    procedure ChildBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText33Print(sender: TObject; var Value: String);
    procedure QRLabel4Print(sender: TObject; var Value: String);

  private

  public
     xtipoVenta : string;
     valorNCF : string;
  end;

var
  qckCotServ8_5Ayaco: TqckCotServ8_5Ayaco;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatModReportes, UDatModFactura, UDatmodDatosGenerales;
{$R *.DFM}

procedure TqckCotServ8_5Ayaco.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if dmDatos.qryMembrete.state = dsInactive then
  begin
    dmDatos.qryMembrete.Close;
    dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
    dmDatos.qryMembrete.Open;
  end;
  qckCotServ8_5Ayaco.AllDataSets.Add(dmCompania.tblCompania);
  qckCotServ8_5Ayaco.AllDataSets.Add(dmDatos.qryMembrete);
end;

procedure TqckCotServ8_5Ayaco.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
  if (Value = '') then
  Value:=GlbBuscarCodigoVendedor(GlbcodVendedor);
end;

procedure TqckCotServ8_5Ayaco.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin
end;

procedure TqckCotServ8_5Ayaco.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckCotServ8_5Ayaco.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckCotServ8_5Ayaco.PageNumber);
end;

procedure TqckCotServ8_5Ayaco.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckCotServ8_5Ayaco.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if SetLogoCia(_ximagen) then
  if (_ximagen <> '') then
  QRImage1.Picture.LoadFromFile(_ximagen);
  //if dmReportes.qryViewVentasMastDESC_TIPONCF.IsNull then
  //QRDBText23.Caption:='FACTURA';
  dmCompania.tblCompania.close;
  dmCompania.tblcompania.open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);
  //QRLabel27.Caption:=dmCompania.tblCompaniaEMAIL.Value;
end;

procedure TqckCotServ8_5Ayaco.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Not dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.IsNull then
  Value:=dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TqckCotServ8_5Ayaco.QRLabel25Print(sender: TObject;
  var Value: String);
begin
  //if dmFactura.qryRepCotizaNewMONTO_EXONERADO_ITBIS.Value > 0 then
  //begin
  //  Value:='ITBIS Exonerado';
  //end;
end;

procedure TqckCotServ8_5Ayaco.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
  valor : string;
begin
  if (dmFactura.qryRepCotizaNewSHOWPRECIOCONITBIS.Value = 1) then
  begin
    qrdbtextprecioConItbis.Enabled:=True;
    qrdbtextprecioSinConItbis.Enabled:=False;
    qrlblItbisenPrecio.Enabled:=True;
  end else
  begin
    qrdbtextprecioConItbis.Enabled   :=False;
    qrdbtextprecioSinConItbis.Enabled:=True;
    qrlblItbisenPrecio.Enabled:=False;
  end;
  valor:= dmReportes.qryViewVentasDetDescripcion.value;
 if (dmFactura.qryRepCotizaDetNewDESCRIPCIONADIC.IsNull) or (
  (Length(dmFactura.qryRepCotizaDetNewDESCRIPCIONADIC.Value) = 0)) then
 QRSubDetail1.HasChild:=False;
end;

procedure TqckCotServ8_5Ayaco.ChildBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmFactura.qryRepCotizaDetNewDESCRIPCIONADIC.IsNull) Or
  (dmFactura.qryRepCotizaDetNewDESCRIPCIONADIC.Value = '') then
  begin
    PrintBand:= False;
    ChildBand5.Height := 0;
  end;
end;

procedure TqckCotServ8_5Ayaco.QRExpr7Print(sender: TObject;
  var Value: String);
begin
  Value:=SimboloMoneda(dmFactura.qryRepCotizaNewMONEDA.Value)+Value;
  Value:=StringReplace(value,'-','',[]);
end;

procedure TqckCotServ8_5Ayaco.ChildBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (GlbShowCtaBanco = 0) and (dmfactura.qryctabcofact.RecordCount = 0) then
  begin
    PrintBand:=False;
    QRMemo2.Visible:=False;
    QRMemo1.Visible:=False;
    QRMemo3.Visible:=False;
    QRMemo4.Visible:=False;
  end else
  begin
    if (dmfactura.qryctabcofact.RecordCount = 1) and (GlBAyaco = 0) then
    begin
      QRMemo3.Visible:=False;
      QRMemo4.Visible:=False;
      QRMemo4.Lines.Clear;
      QRMemo3.Lines.Clear;
      QRMemo2.Visible:=True;
      QRMemo2.Lines.Clear;
      QRMemo2.Lines.Add(dmfactura.qryctabcofactFACT_DESCBANCO.Value);

      QRMemo1.Visible:=True;
      QRMemo1.Lines.Clear;
      QRMemo1.Lines.Add(dmfactura.qryctabcofactFACT_TITLAR.Value);
      QRMemo1.Lines.Add(dmfactura.qryctabcofactFACT_DESCNUMCTA.Value);
    end;
  end;
end;

procedure TqckCotServ8_5Ayaco.QRDBText33Print(sender: TObject;
  var Value: String);
begin
  if GlBTapiceria = 0 then
  Value:='';
end;

procedure TqckCotServ8_5Ayaco.QRLabel4Print(sender: TObject;
  var Value: String);
begin
  if GlbEsCopia then
  Value:= Value+(' (Copia)');
end;

end.
