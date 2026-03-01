unit UQckCotiza8_5_F_1ByM;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  MaskUtils, QuickRpt, QRCtrls, jpeg, StdCtrls, ExtCtrls, Forms;

type
  TqckCotiza8_5_F_1ByM = class(TQuickRep)
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
    ChildBand2: TQRChildBand;
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
    QRDBText17: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText24: TQRDBText;
    QRSubDetail1: TQRSubDetail;
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
    QRExpr4: TQRExpr;
    QRExpr2: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBRichText2: TQRDBRichText;
    QRLabel3: TQRLabel;
    QRImage1: TQRImage;
    QRLabel26: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape18: TQRShape;
    QRShape23: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRExpr5: TQRExpr;
    QRDBText1: TQRDBText;
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
    procedure QRDBText10Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckCotiza8_5_F_1ByM: TqckCotiza8_5_F_1ByM;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatModReportes, UDatModFactura;
  
{$R *.DFM}

procedure TqckCotiza8_5_F_1ByM.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckCotiza8_5_F_1ByM.AllDataSets.Add(dmCompania.tblCompania); 
end;

procedure TqckCotiza8_5_F_1ByM.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=GlbBuscarCodigoVendedor(GlbcodVendedor);
end;

procedure TqckCotiza8_5_F_1ByM.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin

end;

procedure TqckCotiza8_5_F_1ByM.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckCotiza8_5_F_1ByM.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckCotiza8_5_F_1ByM.PageNumber);
end;

procedure TqckCotiza8_5_F_1ByM.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckCotiza8_5_F_1ByM.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if SetLogoCia(_ximagen) then
  if (_ximagen <> '') then

  QRImage1.Picture.LoadFromFile(_ximagen);
end;

procedure TqckCotiza8_5_F_1ByM.QRDBText30Print(sender: TObject;
  var Value: String);
begin
  if (uppercase(Value) = 'COTIZACION') then
  Value := '';
  if (Value = '') And  (Not dmFactura.qryVentaFacturaCOMENTARIO.IsNull) then
  Value:= dmFactura.qryVentaFacturaCOMENTARIO.Value;
end;

procedure TqckCotiza8_5_F_1ByM.QRDBText9Print(sender: TObject;
  var Value: String);
begin    
  if Not dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.IsNull then
  if (dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.Value <> '') then  
  Value:= dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TqckCotiza8_5_F_1ByM.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  Value:= FormatMaskText('(000)000-0000;0;*', Value);
end;

end.
