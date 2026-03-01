unit UQckCotServ8_5AyacoRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckCotServ8_5AyacoRep = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    ChildBand3: TQRChildBand;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBRichText1: TQRDBRichText;
    QRDBText9: TQRDBText;
    QRDBText19: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText24: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel25: TQRLabel;
    QRExpr5: TQRExpr;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape16: TQRShape;
    ChildBand4: TQRChildBand;
    QRDBText1: TQRDBText;
    QRImage1: TQRImage;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText36: TQRDBText;
    QRSysData3: TQRSysData;
    TPag: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText31: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText35: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText34: TQRDBText;
    QRDBText33: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText12: TQRDBText;
    QRShape3: TQRShape;
    QRDBText15: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape23: TQRShape;
    QRLabel34: TQRLabel;
    ChildBand5: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel13: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRLabel25Print(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure QRDBText28Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure ChildBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr7Print(sender: TObject; var Value: String);
  private

  public
     xtipoVenta : string;
     valorNCF : string;
     totalPag : integer;
  end;

var
  qckCotServ8_5AyacoRep: TqckCotServ8_5AyacoRep;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatModReportes, UDatModFactura, UDatmodDatosGenerales,
  UQckCotServ8_5Ayaco;
{$R *.DFM}

procedure TqckCotServ8_5AyacoRep.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if dmDatos.qryMembrete.State = dsInactive then
  begin
    dmDatos.qryMembrete.Close;
    dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
    dmDatos.qryMembrete.Open;
  end;
  qckCotServ8_5AyacoRep.AllDataSets.Add(dmCompania.tblCompania);
  qckCotServ8_5AyacoRep.AllDataSets.Add(dmDatos.qryMembrete);
  if (dmFactura.qryRepCotizaNewPORC_DESCUENTO.IsNull) or
     (dmFactura.qryRepCotizaNewPORC_DESCUENTO.Value = 0) then
     QRDBText11.Enabled:=False
  else
  QRDBText4.Enabled:=False;
end;

procedure TqckCotServ8_5AyacoRep.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
  if (Value = '') then
  Value:=GlbBuscarCodigoVendedor(GlbcodVendedor);
end;

procedure TqckCotServ8_5AyacoRep.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin
end;

procedure TqckCotServ8_5AyacoRep.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckCotServ8_5AyacoRep.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  //TPag.Caption:= IntToStr(qckCotServ8_5AyacoRep.PageNumber);
  IF QRPrinter.PageNumber > 1 THEN PrintBand:=False;
end;

procedure TqckCotServ8_5AyacoRep.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if SetLogoCia(_ximagen) then
  if (_ximagen <> '') then
  QRImage1.Picture.LoadFromFile(_ximagen)
  else
  QRImage1.Visible:=False;
  IF QRPrinter.PageNumber > 1 THEN PrintBand:=False;
  dmCompania.tblCompania.close;
  dmCompania.tblcompania.open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);
  QRLabel13.Caption:=dmCompania.tblCompaniaEMAIL.Value;  
end;

procedure TqckCotServ8_5AyacoRep.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Length(dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.Value) >0  then
  Value:=dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TqckCotServ8_5AyacoRep.QRLabel25Print(sender: TObject;
  var Value: String);
begin
  //if dmFactura.qryRepCotizaNewMONTO_EXONERADO_ITBIS.Value > 0 then
  //begin
  //  Value:='ITBIS Exonerado';
  //end;
end;

procedure TqckCotServ8_5AyacoRep.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
  valor : string;
begin
 valor:= dmReportes.qryViewVentasDetDescripcion.value;
end;

procedure TqckCotServ8_5AyacoRep.QRDBText18Print(sender: TObject;
  var Value: String);
begin
  Value:='Sucursal: '+Value + '  '+'RNC :'+dmDatos.qryMembreteLINEA4.Value;
end;

procedure TqckCotServ8_5AyacoRep.QRDBText28Print(sender: TObject;
  var Value: String);
begin
  Value:='TELEFONOS: '+VALUE;
end;

procedure TqckCotServ8_5AyacoRep.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  Value:='DIRECCION: '+VALUE;
end;

procedure TqckCotServ8_5AyacoRep.ChildBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  IF QRPrinter.PageNumber > 1 THEN PrintBand:=False;
end;

procedure TqckCotServ8_5AyacoRep.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then
  value:='';
end;

procedure TqckCotServ8_5AyacoRep.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then
  value:='';
end;

procedure TqckCotServ8_5AyacoRep.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmFactura.qryRepCotizaNewMONTO_DESCUENTO.Value = 0) then
  begin
    QRLabel5.Enabled:=False;
    QRDBText12.Enabled:=False;
    QRLabel25.Top:=27;
    QRExpr5.Top:=27;
    QRLabel22.Top:=54;
    QRExpr7.Top:=54;
    QRShape4.Top:=48;
  end;
end;

procedure TqckCotServ8_5AyacoRep.PageFooterBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (QRPrinter.PageNumber < totalPag) THEN
  PrintBand:=False;
end;

procedure TqckCotServ8_5AyacoRep.QRExpr7Print(sender: TObject;
  var Value: String);
begin
  Value:=SimboloMoneda(dmFactura.qryRepCotizaNewMONEDA.Value)+Value;
  Value:=StringReplace(value,'-','',[]);
end;

end.
