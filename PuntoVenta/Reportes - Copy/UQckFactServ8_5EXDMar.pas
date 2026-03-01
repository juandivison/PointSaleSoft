unit UQckFactServ8_5EXDMar;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, StrUtils, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckFactServ8_5EXDMar = class(TQuickRep)
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
    QRLabel21: TQRLabel;
    ChildBand5: TQRChildBand;
    QRDBText32: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText21: TQRDBText;
    qrLablNCFAfectado: TQRLabel;
    QRLabel9: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
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
  qckFactServ8_5EXDMar: TqckFactServ8_5EXDMar;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatmodDatosGenerales,UDatModReportes;

{$R *.DFM}

procedure TqckFactServ8_5EXDMar.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if dmDatos.qryMembrete.state = dsInactive then
  begin
    dmDatos.qryMembrete.Close;
    dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
    dmDatos.qryMembrete.Open;
  end;
  qckFactServ8_5EXDMar.AllDataSets.Add(dmCompania.tblCompania);
  qckFactServ8_5EXDMar.AllDataSets.Add(dmDatos.qryMembrete);
  if dmReportes.qryViewVentasMastFECHA_VENCE.IsNull then
  QRDBText29.Enabled:=False;
end;

procedure TqckFactServ8_5EXDMar.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckFactServ8_5EXDMar.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin
end;

procedure TqckFactServ8_5EXDMar.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckFactServ8_5EXDMar.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  //TPag.Caption:= IntToStr(qckFactServ8_5EXDMar.PageNumber);
end;

procedure TqckFactServ8_5EXDMar.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckFactServ8_5EXDMar.ColumnHeaderBand1BeforePrint(
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

procedure TqckFactServ8_5EXDMar.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  {
  if Length(dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value) = 0  then
  Value:='NOMBRE O RAZON SOCIAL:'+dmReportes.qryViewVentasMastNombre_Facturar.Value
  else
  Value:='NOMBRE O RAZON SOCIAL:'+dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value;
  }
  if Length(dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value) = 0  then
  Value:=dmReportes.qryViewVentasMastNombre_Facturar.Value
  else
  Value:=dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TqckFactServ8_5EXDMar.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
  valor : string;
begin
  Valor:= dmReportes.qryViewVentasDetDescripcion.value;
  if Length(dmReportes.qryViewVentasDetDESCRIPCIONPRODUCTO.Value) = 0 then
  QRSubDetail1.HasChild:=False;
end;

procedure TqckFactServ8_5EXDMar.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  Value:= Trim(Value);
end;

procedure TqckFactServ8_5EXDMar.QRDBText23Print(sender: TObject;
  var Value: String);
begin
  dmreportes.qryNCFAfectado.Close;            
  dmreportes.qryNCFAfectado.Params[0].Value:= dmReportes.qryViewVentasMastSERIE_NCF_ASIGNADO.Value;
  dmreportes.qryNCFAfectado.Open;
  dmreportes.qryNCFAfectado.First;
  if (dmReportes.qryViewVentasMastFORMA_PAGO.Value = 6) then
  begin
    QRDBText29.Enabled := False;
    qrLablNCFAfectado.Top := 40;
    if Not dmreportes.qryNCFAfectadoNUMERO_NCF.IsNull then
    begin
      qrLablNCFAfectado.Caption:='NCF modificado:'+
      dmreportes.qryNCFAfectadoNUMERO_NCF.Value;
      qrLablNCFAfectado.Visible:= True;
      qrLablNCFAfectado.Enabled:= True;
      qrLablNCFAfectado.Font.Color:= clRed;
    end;
  end else
  qrLablNCFAfectado.Enabled:=False;
end;

procedure TqckFactServ8_5EXDMar.QRDBText29Print(sender: TObject;
  var Value: String);
begin
  Value:='Válida hasta:'+Value;
end;

procedure TqckFactServ8_5EXDMar.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  Value:='RNC: '+Value;
end;

procedure TqckFactServ8_5EXDMar.QRDBText15Print(sender: TObject;
  var Value: String);
begin
  Value:='FECHA: '+Value;
end;

procedure TqckFactServ8_5EXDMar.QRDBText12Print(sender: TObject;
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

procedure TqckFactServ8_5EXDMar.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  Value:='TELEFONO:'+Value;
end;

procedure TqckFactServ8_5EXDMar.QRLabel9Print(sender: TObject;
  var Value: String);
begin
  if not dmReportes.qryViewVentasMastRNC.IsNull then
  Value:='RNC:'+dmReportes.qryViewVentasMastRNC.Value
  //Value:='RNC CLIENTE:'+dmReportes.qryViewVentasMastRNC.Value
  else Value:='';
end;

end.
