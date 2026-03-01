unit UQckFactServIngeservis8_5_NCotizaN;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckFactServIngeservis_NCotizaN = class(TQuickRep)
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
    QRDBText18: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
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
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText1: TQRDBText;
    QRLabel26: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSysData3Print(sender: TObject; var Value: String);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckFactServIngeservis_NCotizaN: TqckFactServIngeservis_NCotizaN;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  URepComprobante, UDatModFactura;
                                     
{$R *.DFM}

procedure TqckFactServIngeservis_NCotizaN.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckFactServIngeservis_NCotizaN.AllDataSets.Add(dmCompania.tblCompania);
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

procedure TqckFactServIngeservis_NCotizaN.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=GlbBuscarCodigoVendedor(glbcodVendedor);
end;

procedure TqckFactServIngeservis_NCotizaN.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    tmp : String;
begin
  //tmp:=frmProcVentaRapida.rxVentaDescripcionEspecial.Value;
  if (Length(tmp) > 0) then
  begin
    //QRDBRichText1.Enabled:=True;
    //QRDBRichText1.BringToFront;
    //QRDBText8.Enabled:=False;
    //QRDBText8.SendToBack;
  end else
  begin
    //QRDBRichText1.Enabled:=False;
    //QRDBRichText1.SendToBack;
    //QRDBText8.Enabled:=True;
    //QRDBText8.BringToFront;
  end;
end;

procedure TqckFactServIngeservis_NCotizaN.QRDBText21Print(sender: TObject;
  var Value: String);
begin
 // if not dmFactura.qryVentaFacturaCANT_DIAS_CREDITO.IsNull then
 // Value := Value +' a '+dmFactura.qryVentaFacturaCANT_DIAS_CREDITO.AsString+' DIAS';
end;

procedure TqckFactServIngeservis_NCotizaN.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:='NCF: '+Value;
end;

procedure TqckFactServIngeservis_NCotizaN.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckFactServIngeservis_NCotizaN.PageNumber);
end;

procedure TqckFactServIngeservis_NCotizaN.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckFactServIngeservis_NCotizaN.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if SetLogoCia(_ximagen) then
  if (_ximagen <> '') then
  QRImage1.Picture.LoadFromFile(_ximagen);
end;

end.
