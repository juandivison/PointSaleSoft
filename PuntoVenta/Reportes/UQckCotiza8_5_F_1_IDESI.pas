unit UQckCotiza8_5_F_1_IDESI;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckCotiza8_5_F_1IDESI = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRImage1: TQRImage;
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
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel23: TQRLabel;
    QRBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel21: TQRLabel;
    QRShape18: TQRShape;
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
    QRExpr4: TQRExpr;
    QRExpr2: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBRichText2: TQRDBRichText;
    QRLabel32: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSysData3Print(sender: TObject; var Value: String);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure QRDBText30Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckCotiza8_5_F_1IDESI: TqckCotiza8_5_F_1IDESI;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatModReportes, UDatModFactura;


{$R *.DFM}

procedure TqckCotiza8_5_F_1IDESI.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckCotiza8_5_F_1IDESI.AllDataSets.Add(dmCompania.tblCompania);

end;

procedure TqckCotiza8_5_F_1IDESI.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=GlbBuscarCodigoVendedor(glbcodVendedor);
end;

procedure TqckCotiza8_5_F_1IDESI.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckCotiza8_5_F_1IDESI.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckCotiza8_5_F_1IDESI.PageNumber);
end;

procedure TqckCotiza8_5_F_1IDESI.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckCotiza8_5_F_1IDESI.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if SetLogoCia(_ximagen) then
  if (_ximagen <> '') then
  QRImage1.Picture.LoadFromFile(_ximagen);
end;

procedure TqckCotiza8_5_F_1IDESI.QRDBText18Print(sender: TObject;
  var Value: String);
begin
  Value:='US$'+value;
end;

procedure TqckCotiza8_5_F_1IDESI.QRDBText30Print(sender: TObject;
  var Value: String);
begin
  if (Value = 'Cotizacion') then
  Value := '';
end;

end.
