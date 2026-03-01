unit UFactFormatoECom;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, RxMemDS;

type
  TQckFactServ_8_5ECom = class(TQuickRep)
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
    QRDBText23: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText29: TQRDBText;
    qrLablNCFAfectado: TQRLabel;
    ChildBand5: TQRChildBand;
    QRDBText31: TQRDBText;
    QRDBText17: TQRDBText;
    rxVendedor: TRxMemoryData;
    rxVendedorNombreVendedor: TStringField;
    QRShape17: TQRShape;
    QRLabel21: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRLabel26: TQRLabel;
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
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRExpr6Print(sender: TObject; var Value: String);
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText25Print(sender: TObject; var Value: String);
    procedure QRDBText27Print(sender: TObject; var Value: String);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
     xtipoVenta : string;
     valorNCF : string;
     strCopia : string;
  end;

var
  QckFactServ_8_5ECom: TQckFactServ_8_5ECom;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatmodDatosGenerales, UDatModReportes; 

{$R *.DFM}

procedure TQckFactServ_8_5ECom.QuickRepBeforePrint(
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
  QckFactServ_8_5ECom.AllDataSets.Add(dmCompania.tblCompania);
  QckFactServ_8_5ECom.AllDataSets.Add(dmDatos.qryMembrete);
end;

procedure TQckFactServ_8_5ECom.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=VarNombreUsuario;
end;

procedure TQckFactServ_8_5ECom.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin
end;

procedure TQckFactServ_8_5ECom.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TQckFactServ_8_5ECom.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(QckFactServ_8_5ECom.PageNumber);
end;

procedure TQckFactServ_8_5ECom.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TQckFactServ_8_5ECom.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  //t if SetLogoCia(_ximagen) then
  //t if (_ximagen <> '') then
  //t QRImage1.Picture.LoadFromFile(_ximagen);
  if dmReportes.qryViewVentasMastDESC_TIPONCF.IsNull then
  QRDBText23.Caption:='FACTURA';
    dmCompania.tblCompania.close;
  dmCompania.tblcompania.open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key, []);
  //QRLabel21.Caption:=dmCompania.tblCompaniaEMAIL.Value;
end;

procedure TQckFactServ_8_5ECom.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Length(dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value) > 0  then
  Value:=dmReportes.qryViewVentasMastNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TQckFactServ_8_5ECom.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
  valor : string;
begin
  Valor:= dmReportes.qryViewVentasDetDescripcion.value;
  if (dmReportes.qryViewVentasDetDESCRIPCIONPRODUCTO.IsNull) or (
  (Length(dmReportes.qryViewVentasDetDESCRIPCIONPRODUCTO.Value) = 0)) then
  begin
    QRSubDetail1.HasChild := False;
  end;
end;

procedure TQckFactServ_8_5ECom.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  Value:= Value+strCopia;
end;

procedure TQckFactServ_8_5ECom.QRDBText23Print(sender: TObject;
  var Value: String);
begin
  ProcNCFAfectado(dmReportes.qryViewVentasMastSERIE_NCF_ASIGNADO.Value);
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

procedure TQckFactServ_8_5ECom.QRDBText29Print(sender: TObject;
  var Value: String);
begin
  Value:='Válida hasta:'+Value;
  if dmReportes.qryViewVentasMastNUMERO_NCF.IsNull then
  Value:=''
  ELSE
  if (Pos('B02',UpperCase(dmReportes.qryViewVentasMastNUMERO_NCF.Value)) > 0 )  then
  Value:='';  
end;

procedure TQckFactServ_8_5ECom.QRDBText11Print(sender: TObject;
  var Value: String);
begin
Value:=StringReplace(value,'-','',[]);
end;

procedure TQckFactServ_8_5ECom.QRExpr6Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TQckFactServ_8_5ECom.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TQckFactServ_8_5ECom.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TQckFactServ_8_5ECom.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TQckFactServ_8_5ECom.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TQckFactServ_8_5ECom.QRDBText25Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TQckFactServ_8_5ECom.QRDBText27Print(sender: TObject;
  var Value: String);
begin
  Value:=StringReplace(value,'-','',[]);
end;

procedure TQckFactServ_8_5ECom.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (not dmReportes.qryViewVentasMastFORMA_PAGO.Value  in [7,8,11,15,15,18])
  or (dmReportes.qryViewVentasMastFECHA_VENCEFCT.IsNull) then
  begin
    QRLabel26.Visible := False;
    QRLabel26.Enabled :=False;
    QRDBText33.Visible:= False;
    QRDBText33.Enabled := False;
  end;
  if (dmReportes.qryViewVentasMastFECHA_VENCEFCT.Value = 0) or
     (dmReportes.qryViewVentasMastFECHA_VENCEFCT.IsNull) then
  begin
    QRLabel26.Visible := False;
    QRLabel26.Enabled :=False;
    QRDBText33.Visible:= False;
    QRDBText33.Enabled := False;  end;
end;

end.
