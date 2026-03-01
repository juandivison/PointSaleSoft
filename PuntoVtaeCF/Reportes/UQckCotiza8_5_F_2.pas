unit UQckCotiza8_5_F_2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckCotiza8_5_F_2 = class(TQuickRep)
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
    QRDBText18: TQRDBText;
    QRExpr4: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBRichText2: TQRDBRichText;
    QRLabel3: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel25: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText22: TQRDBText;
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
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRLabel26Print(sender: TObject; var Value: String);
    procedure QRLabel27Print(sender: TObject; var Value: String);
    procedure QRLabel28Print(sender: TObject; var Value: String);
    procedure QRLabel29Print(sender: TObject; var Value: String);
    procedure QRLabel30Print(sender: TObject; var Value: String);
    procedure QRLabel31Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckCotiza8_5_F_2: TqckCotiza8_5_F_2;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatModReportes, UDatModFactura;


{$R *.DFM}

procedure TqckCotiza8_5_F_2.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckCotiza8_5_F_2.AllDataSets.Add(dmCompania.tblCompania);

end;

procedure TqckCotiza8_5_F_2.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=GlbBuscarCodigoVendedor(glbcodVendedor);
end;

procedure TqckCotiza8_5_F_2.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin

end;

procedure TqckCotiza8_5_F_2.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckCotiza8_5_F_2.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckCotiza8_5_F_2.PageNumber);
end;

procedure TqckCotiza8_5_F_2.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckCotiza8_5_F_2.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if SetLogoCia(_ximagen) then
  if (_ximagen <> '') then
  QRImage1.Picture.LoadFromFile(_ximagen);
end;

procedure TqckCotiza8_5_F_2.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' ' + dmfactura.qryPorcOtrosCargosCotizaPORCGADMIN.AsString+'%';
end;

procedure TqckCotiza8_5_F_2.QRLabel26Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' ' + dmfactura.qryPorcOtrosCargosCotizaPORCGADMIN.AsString+'%';
end;

procedure TqckCotiza8_5_F_2.QRLabel27Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcOtrosCargosCotizaPorcTrans.AsString+'%';
end;

procedure TqckCotiza8_5_F_2.QRLabel28Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcOtrosCargosCotizaPorcDirTec.AsString+'%';
end;

procedure TqckCotiza8_5_F_2.QRLabel29Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcOtrosCargosCotizaPorcItbisDirTec.AsString+'%';
end;

procedure TqckCotiza8_5_F_2.QRLabel30Print(sender: TObject;
  var Value: String);
begin
  if dmFactura.qryRepCotizaNewMONTODESCITBISIMPREVISTO.Value > 0 then
  Value:=Value + ' '+dmfactura.qryPorcOtrosCargosCotizaPORCIMPREVISTO.AsString+'%'
  else Value:='';
end;

procedure TqckCotiza8_5_F_2.QRLabel31Print(sender: TObject;
  var Value: String);
begin
  if dmFactura.qryRepCotizaNewMONTODESCITBISIMPREVISTO.Value > 0 then
  Value:=Value + ' '+dmfactura.qryPorcOtrosCargosCotizaPorcItbisImprevisto.AsString+'%'
  else Value:=''
end;

procedure TqckCotiza8_5_F_2.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  if dmFactura.qryRepCotizaNewMONTODESCITBISIMPREVISTO.Value <= 0 then
  Value := '';
end;

procedure TqckCotiza8_5_F_2.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  if dmFactura.qryRepCotizaNewMONTODESCITBISIMPREVISTO.Value <= 0 then
  Value:='';
end;

procedure TqckCotiza8_5_F_2.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if not dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.IsNull then
     if (dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.Value <> '') then    
  Value:= dmFactura.qryRepCotizaNewNOMBRE_CLIENTE_GENERAL.Value;
end;

end.
