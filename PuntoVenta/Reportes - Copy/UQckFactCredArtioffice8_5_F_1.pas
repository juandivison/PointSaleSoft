unit UQckFactCredArtioffice8_5_F_1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckFactCredArtioffice8_5_F_1 = class(TQuickRep)
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
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
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
    QRDBText28: TQRDBText;
    QRDBRichText2: TQRDBRichText;
    QRExpr3: TQRExpr;
    QRDBText29: TQRDBText;
    QRExpr4: TQRExpr;
    QRSysData3: TQRSysData;
    TPag: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr5: TQRExpr;
    QRLabel34: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel35: TQRLabel;
    QRShape18: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel21: TQRLabel;
    qrLabelFactOrigen: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr6: TQRExpr;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure QRLabel24Print(sender: TObject; var Value: String);
    procedure QRLabel25Print(sender: TObject; var Value: String);
    procedure QRLabel26Print(sender: TObject; var Value: String);
    procedure QRLabel27Print(sender: TObject; var Value: String);
    procedure QRLabel28Print(sender: TObject; var Value: String);
    procedure QRLabel29Print(sender: TObject; var Value: String);
    procedure QRLabel30Print(sender: TObject; var Value: String);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSysData3Print(sender: TObject; var Value: String);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
  private

  public
     strtipodoc : string;
  end;

var
  qckFactCredArtioffice8_5_F_1: TqckFactCredArtioffice8_5_F_1;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  URepComprobante, UDatModFactura;


{$R *.DFM}

procedure TqckFactCredArtioffice8_5_F_1.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckFactCredArtioffice8_5_F_1.AllDataSets.Add(dmCompania.tblCompania);
 { if Assigned(frmProcVentaRapida) then
  begin
    qckFactServIngeservis_N.AllDataSets.Add(frmProcVentaRapida.rxSolDatoscte);
    qckFactServIngeservis_N.AllDataSets.Add(frmProcVentaRapida.Totales);
  end else
  begin
    qckFactServIngeservis.AllDataSets.Add(frmProcVentaRapidaNueva.rxSolDatoscte);
    qckFactServIngeservis.AllDataSets.Add(frmProcVentaRapidaNueva.Totales);
  end;}
end;

procedure TqckFactCredArtioffice8_5_F_1.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=GlbBuscarCodigoVendedor(glbcodVendedor);
end;

procedure TqckFactCredArtioffice8_5_F_1.QRLabel24Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcGAdmin.AsString+'%';
end;

procedure TqckFactCredArtioffice8_5_F_1.QRLabel25Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcItbisGAdmin.AsString+'%';
end;

procedure TqckFactCredArtioffice8_5_F_1.QRLabel26Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcTrans.AsString+'%';
end;

procedure TqckFactCredArtioffice8_5_F_1.QRLabel27Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcDirTec.AsString+'%';
end;

procedure TqckFactCredArtioffice8_5_F_1.QRLabel28Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcItbisDirTec.AsString+'%';
end;

procedure TqckFactCredArtioffice8_5_F_1.QRLabel29Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPORCIMPREVISTO.AsString+'%';
end;

procedure TqckFactCredArtioffice8_5_F_1.QRLabel30Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcItbisImprevisto.AsString+'%';
end;

procedure TqckFactCredArtioffice8_5_F_1.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin
  {tmp:=frmProcVentaRapida.rxVentaDescripcionEspecial.Value;
  if (Length(tmp) > 0) then
  begin
    QRDBRichText1.Enabled:=True;
    QRDBRichText1.BringToFront;
    QRDBText8.Enabled:=False;
    QRDBText8.SendToBack;
  end else
  begin
    QRDBRichText1.Enabled:=False;
    QRDBRichText1.SendToBack;
    QRDBText8.Enabled:=True;
    QRDBText8.BringToFront;
  end;
  }
end;

procedure TqckFactCredArtioffice8_5_F_1.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckFactCredArtioffice8_5_F_1.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckFactCredArtioffice8_5_F_1.PageNumber);
end;

procedure TqckFactCredArtioffice8_5_F_1.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckFactCredArtioffice8_5_F_1.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if SetLogoCia(_ximagen) then
  if (_ximagen <> '') then
  QRImage1.Picture.LoadFromFile(_ximagen);
end;

procedure TqckFactCredArtioffice8_5_F_1.QRDBText21Print(sender: TObject;
  var Value: String);
begin
 if dmFactura.qryVentaFacturaFORMA_PAGO.Value = 6 then
 Value:='DEVOLUCION';
end;

procedure TqckFactCredArtioffice8_5_F_1.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Not dmFactura.qryVentaFacturaNOMBRE_CLIENTE_GENERAL.IsNull then
  if (dmFactura.qryVentaFacturaNOMBRE_CLIENTE_GENERAL.Value <> '') then
  Value:=dmFactura.qryVentaFacturaNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TqckFactCredArtioffice8_5_F_1.QRLabel4Print(sender: TObject;
  var Value: String);
begin
  if (strtipodoc <> '') then
  Value:=strtipodoc;
end;

procedure TqckFactCredArtioffice8_5_F_1.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if value = '0' then value :='';
end;

end.
