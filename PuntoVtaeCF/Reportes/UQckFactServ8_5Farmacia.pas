unit UQckFactServ8_5Farmacia;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, StrUtils, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckFactServ8_5Farmacia = class(TQuickRep)
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
    QRExpr6: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText1: TQRDBText;
    QRExpr7: TQRExpr;
    QRLabel11: TQRLabel;
    ChildBand5: TQRChildBand;
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
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRDBText28: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText31: TQRDBText;
    PageFooterBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    ChildBand3: TQRChildBand;
    QRLabel2: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText2: TQRDBText;
    QRExprMemo1: TQRExprMemo;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSysData3Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure QRDBText29Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRLabel9Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRExpr7Print(sender: TObject; var Value: String);
    procedure QRExpr6Print(sender: TObject; var Value: String);
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
     xtipoVenta : string;
     valorNCF : string;
     strCopia : string;
  end;

var
  qckFactServ8_5Farmacia: TqckFactServ8_5Farmacia;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatmodDatosGenerales,UDatModReportes;

{$R *.DFM}

procedure TqckFactServ8_5Farmacia.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if dmDatos.qryMembrete.state = dsInactive then
  begin
    dmDatos.qryMembrete.Close;
    dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
    dmDatos.qryMembrete.Open;
  end;

  qckFactServ8_5Farmacia.AllDataSets.Add(dmCompania.tblCompania);
  qckFactServ8_5Farmacia.AllDataSets.Add(dmDatos.qryMembrete);
  if dmReportes.qryViewVentasMastFECHA_VENCE.IsNull then
  QRDBText29.Enabled:=False;
    
end;

procedure TqckFactServ8_5Farmacia.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TqckFactServ8_5Farmacia.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckFactServ8_5Farmacia.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  //TPag.Caption:= IntToStr(qckFactServ8_5EXDMar.PageNumber);
end;

procedure TqckFactServ8_5Farmacia.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckFactServ8_5Farmacia.QRDBText9Print(sender: TObject;
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

procedure TqckFactServ8_5Farmacia.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  Value:= Trim(Value);
end;

procedure TqckFactServ8_5Farmacia.QRDBText23Print(sender: TObject;
  var Value: String);
begin
  ProcNCFAfectado(dmReportes.qryViewVentasMastSERIE_NCF_ASIGNADO.Value);
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

procedure TqckFactServ8_5Farmacia.QRDBText29Print(sender: TObject;
  var Value: String);
begin
  Value:='Válida hasta:'+Value;
end;

procedure TqckFactServ8_5Farmacia.QRDBText15Print(sender: TObject;
  var Value: String);
begin
  Value:='FECHA: '+Value;
end;

procedure TqckFactServ8_5Farmacia.QRDBText12Print(sender: TObject;
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

procedure TqckFactServ8_5Farmacia.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  Value:='TELEFONO:'+Value;
end;

procedure TqckFactServ8_5Farmacia.QRLabel9Print(sender: TObject;
  var Value: String);
begin
  if not dmReportes.qryViewVentasMastRNC.IsNull then
  Value:='RNC:'+dmReportes.qryViewVentasMastRNC.Value
  else Value:='';
end;

procedure TqckFactServ8_5Farmacia.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  Value:=SimboloMoneda(dmReportes.qryViewVentasMastMONEDA.Value)+Value;
end;

procedure TqckFactServ8_5Farmacia.QRExpr7Print(sender: TObject;
  var Value: String);
begin
  Value:=SimboloMoneda(dmReportes.qryViewVentasMastMONEDA.Value)+Value;
end;

procedure TqckFactServ8_5Farmacia.QRExpr6Print(sender: TObject;
  var Value: String);
begin
  Value:=SimboloMoneda(dmReportes.qryViewVentasMastMONEDA.Value)+Value;
end;

procedure TqckFactServ8_5Farmacia.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  Value:=SimboloMoneda(dmReportes.qryViewVentasMastMONEDA.Value)+Value;
end;

procedure TqckFactServ8_5Farmacia.PageHeaderBand1BeforePrint(
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

procedure TqckFactServ8_5Farmacia.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (GlbTransparentaITBI = 0)  then
  begin
    QRExpr4.Visible:=false;
    QRExpr1.Enabled:=True;
    QRExpr1.Visible:=True;
    QRExpr1.BringToFront; 
  end else
  if (GlbMSubTotalSinITBIS = 1) then
  begin
    QRExpr4.Enabled:=True;
    QRExpr4.Visible:=True;
    QRExpr4.BringToFront;
  end else
  begin
    QRExpr1.Enabled:=True;
    QRExpr1.Visible:=True;
    QRExpr1.BringToFront;
  end;
  
  if (dmReportes.qryViewVentasMastCOMENTARIO.IsNull) or
     (dmReportes.qryViewVentasMastCOMENTARIO.Value = '') then
   begin
     QRLabel20.Enabled:=false;
     QRLabel20.Visible:=False;
   end;
end;

procedure TqckFactServ8_5Farmacia.ChildBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  //if (GlbFarmacia = 1) then
  //QRSubDetail1.HasChild:=True
  //else
  QRExprMemo1.Lines.Clear;
  if Length(dmReportes.qryViewVentasDetDESCRIPCIONPRODUCTO.Value) = 0 then
     PrintBand:=False
  else
  begin
    QRExprMemo1.Lines.Text:= dmReportes.qryViewVentasDetDESCRIPCIONPRODUCTO.AsVariant;  
    PrintBand:=True;
  end;
end;

end.
