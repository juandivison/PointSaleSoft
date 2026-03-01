unit UQckFactServIngeservis8_5;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckFactServIngeservis = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    ChildBand1: TQRChildBand;
    QRShape1: TQRShape;
    QRExpr4: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr1: TQRExpr;
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
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel23: TQRLabel;
    QRBand1: TQRBand;
    QRDBText9: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel22: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBRichText1: TQRDBRichText;
    QRExpr2: TQRExpr;
    QRLabel34: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel35: TQRLabel;
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
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckFactServIngeservis: TqckFactServIngeservis;

implementation
uses UDatModCompania, UDatModClientes, UProcVentaRapida, UGlobal,
  URepComprobante, UProcVentaRapidaNueva;

{$R *.DFM}

procedure TqckFactServIngeservis.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckFactServIngeservis.AllDataSets.Add(dmCompania.tblCompania);
  if Assigned(frmProcVentaRapida) then
  begin
    qckFactServIngeservis.AllDataSets.Add(frmProcVentaRapida.rxSolDatoscte);
    qckFactServIngeservis.AllDataSets.Add(frmProcVentaRapida.Totales);
  end else
  begin
    qckFactServIngeservis.AllDataSets.Add(frmProcVentaRapidaNueva.rxSolDatoscte);
    qckFactServIngeservis.AllDataSets.Add(frmProcVentaRapidaNueva.Totales);
  end;
end;

procedure TqckFactServIngeservis.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=GlbBuscarCodigoVendedor(glbcodVendedor);
end;

procedure TqckFactServIngeservis.QRLabel24Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + frmProcVentaRapida.TotalesPorcGAdmin.Value;
end;

procedure TqckFactServIngeservis.QRLabel25Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + frmProcVentaRapida.TotalesPorcItbisGAdmin.Value;
end;

procedure TqckFactServIngeservis.QRLabel26Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + frmProcVentaRapida.TotalesPorcTrans.Value;
end;

procedure TqckFactServIngeservis.QRLabel27Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + frmProcVentaRapida.TotalesPorcDirTec.Value;
end;

procedure TqckFactServIngeservis.QRLabel28Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + frmProcVentaRapida.TotalesPorcItbisDirTec.Value;
end;

procedure TqckFactServIngeservis.QRLabel29Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + frmProcVentaRapida.TotalesPorcGAdmin.Value;
end;

procedure TqckFactServIngeservis.QRLabel30Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + frmProcVentaRapida.TotalesPorcItbisImprevisto.Value;
end;

procedure TqckFactServIngeservis.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin
  tmp:=frmProcVentaRapida.rxVentaDescripcionEspecial.Value;
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
end;

procedure TqckFactServIngeservis.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if SetLogoCia(_ximagen) then
  begin
  if (_ximagen <> '') then
  QRImage1.Picture.LoadFromFile(_ximagen);
  end else
  QRImage1.Enabled:=False;
end;

end.
