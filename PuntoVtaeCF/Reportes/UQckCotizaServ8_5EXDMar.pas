unit UQckCotizaServ8_5EXDMar;
//dmReportes.qryViewVentasMast
//dmReportes.qryViewVentasDet
interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckCotizaServ8_5EXDMar = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText19: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText25: TQRDBText;
    QRDBText27: TQRDBText;
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
    QRExpr6: TQRExpr;
    QRImage1: TQRImage;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    ChildBand4: TQRChildBand;
    QRDBText1: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText18: TQRDBText;
    QRExpr7: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText31: TQRDBText;
    ChildBand5: TQRChildBand;
    QRDBText32: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel9: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText2: TQRDBText;
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
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRLabel9Print(sender: TObject; var Value: String);
  private

  public
     xtipoVenta : string;
     valorNCF : string;
     strCopia : string;
  end;

var
  qckCotizaServ8_5EXDMar: TqckCotizaServ8_5EXDMar;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatmodDatosGenerales,UDatModReportes, StrUtils, UDatModFactura;

{$R *.DFM}

procedure TqckCotizaServ8_5EXDMar.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if dmDatos.qryMembrete.state = dsInactive then
  begin
    dmDatos.qryMembrete.Close;
    dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
    dmDatos.qryMembrete.Open;
  end;
  qckCotizaServ8_5EXDMar.AllDataSets.Add(dmCompania.tblCompania);
  qckCotizaServ8_5EXDMar.AllDataSets.Add(dmDatos.qryMembrete);
end;

procedure TqckCotizaServ8_5EXDMar.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckCotizaServ8_5EXDMar.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin
end;

procedure TqckCotizaServ8_5EXDMar.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckCotizaServ8_5EXDMar.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  //TPag.Caption:= IntToStr(qckFactServ8_5EXDMar.PageNumber);
end;

procedure TqckCotizaServ8_5EXDMar.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckCotizaServ8_5EXDMar.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if SetLogoCia(_ximagen) then
  if (_ximagen <> '') then
  QRImage1.Picture.LoadFromFile(_ximagen);
  //if dmReportes.qryViewVentasMastDESC_TIPONCF.IsNull then
  //QRDBText23.Caption:='COTIZACION';
end;

procedure TqckCotizaServ8_5EXDMar.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  {
  if Length(dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value) = 0  then
  Value:='NOMBRE O RAZON SOCIAL:'+dmReportes.qryViewVentasMastNombre_Facturar.Value
  else
  Value:='NOMBRE O RAZON SOCIAL:'+dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value;
  }
  if Length(dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.Value) = 0  then
  Value:=dmFactura.qryRepCotizaNewNombre_Facturar.Value
  else
  Value:=dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TqckCotizaServ8_5EXDMar.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
  valor : string;
begin
  Valor:= dmFactura.qryRepCotizaDetNewDESCRIPCION.value;
  if Length(dmFactura.qryRepCotizaDetNewDESCRIPCIONADIC.Value) = 0 then
  QRSubDetail1.HasChild:=False;
end; 


procedure TqckCotizaServ8_5EXDMar.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  Value:= Value+strCopia;
end;

procedure TqckCotizaServ8_5EXDMar.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  Value:='RNC: '+Value;
end;

procedure TqckCotizaServ8_5EXDMar.QRDBText15Print(sender: TObject;
  var Value: String);
begin
  Value:='FECHA: '+Value;
end;

procedure TqckCotizaServ8_5EXDMar.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  //Value:=PadLeftCharacterStr(6,Value,'0');
  if Length(Value) = 1 then
  Value:= '00000'+Value
  else if Length(Value) = 2 then
  Value:= '0000'+Value
  else if Length(Value) = 3 then
  Value:= '000'+Value
  else if Length(Value) = 4 then
  Value:= '000'+Value;    
end;

procedure TqckCotizaServ8_5EXDMar.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  Value:='TELEFONO:'+Value;
end;

procedure TqckCotizaServ8_5EXDMar.QRLabel9Print(sender: TObject;
  var Value: String);
begin           
  if not dmFactura.qryRepCotizaNewRNC.IsNull then
  Value:='RNC:'+dmFactura.qryRepCotizaNewRNC.Value
  else Value:='';
end;

end.
