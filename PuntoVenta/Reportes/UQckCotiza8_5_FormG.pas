unit UQckCotiza8_5_FormG;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckCotiza8_5_FormG = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
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
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel23: TQRLabel;
    QRBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel22: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText29: TQRDBText;
    QRSysData3: TQRSysData;
    TPag: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBRichText2: TQRDBRichText;
    QRLabel3: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape18: TQRShape;
    QRShape23: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape24: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr5: TQRExpr;
    QRDBText14: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr8: TQRExpr;
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
    procedure QRDBText30Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckCotiza8_5_FormG: TqckCotiza8_5_FormG;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatModReportes, UDatModFactura;


{$R *.DFM}

procedure TqckCotiza8_5_FormG.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckCotiza8_5_FormG.AllDataSets.Add(dmCompania.tblCompania);
  qckCotiza8_5_FormG.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckCotiza8_5_FormG.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=GlbBuscarCodigoVendedor(GlbcodVendedor);
end;

procedure TqckCotiza8_5_FormG.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin

end;

procedure TqckCotiza8_5_FormG.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckCotiza8_5_FormG.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckCotiza8_5_FormG.PageNumber);
end;

procedure TqckCotiza8_5_FormG.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckCotiza8_5_FormG.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  //if SetLogoCia(_ximagen) then
  //if (_ximagen <> '') then
  //QRImage1.Picture.LoadFromFile(_ximagen);
end;

procedure TqckCotiza8_5_FormG.QRDBText30Print(sender: TObject;
  var Value: String);
begin
  if (uppercase(Value) = 'COTIZACION') then
  Value := '';
  if (Value = '') And  (Not dmFactura.qryVentaFacturaCOMENTARIO.IsNull) then
  Value:= dmFactura.qryVentaFacturaCOMENTARIO.Value;
end;

procedure TqckCotiza8_5_FormG.QRDBText9Print(sender: TObject;
  var Value: String);
begin    
  if Not dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.IsNull then
  if (dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.Value <> '') then  
  Value:= dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TqckCotiza8_5_FormG.QRBand1BeforePrint(Sender: TQRCustomBand;
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

end.
