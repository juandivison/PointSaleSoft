unit UQckCotiServIngeservis8_5_NConduce;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  MaskUtils, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckCotiServIngeservis_NConduce = class(TQuickRep)
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
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape18: TQRShape;
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
    QRSysData3: TQRSysData;
    TPag: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText30: TQRDBText;
    QRShape23: TQRShape;
    QRLabel3: TQRLabel;
    QRShape24: TQRShape;
    QRLabel32: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText2: TQRDBText;
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
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSysData3Print(sender: TObject; var Value: String);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckCotiServIngeservis_NConduce: TqckCotiServIngeservis_NConduce;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  URepComprobante, UDatModFactura;


{$R *.DFM}

procedure TqckCotiServIngeservis_NConduce.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckCotiServIngeservis_NConduce.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckCotiServIngeservis_NConduce.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value:=GlbBuscarCodigoVendedor(glbcodVendedor);
end;

procedure TqckCotiServIngeservis_NConduce.QRLabel24Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcGAdmin.AsString+'%';
end;

procedure TqckCotiServIngeservis_NConduce.QRLabel25Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcItbisGAdmin.AsString+'%';
end;

procedure TqckCotiServIngeservis_NConduce.QRLabel26Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcTrans.AsString+'%';
end;

procedure TqckCotiServIngeservis_NConduce.QRLabel27Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcDirTec.AsString+'%';
end;

procedure TqckCotiServIngeservis_NConduce.QRLabel28Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcItbisDirTec.AsString+'%';
end;

procedure TqckCotiServIngeservis_NConduce.QRLabel29Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPORCIMPREVISTO.AsString+'%';
end;

procedure TqckCotiServIngeservis_NConduce.QRLabel30Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcItbisImprevisto.AsString+'%';
end;

procedure TqckCotiServIngeservis_NConduce.DetailBand1BeforePrint(
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

procedure TqckCotiServIngeservis_NConduce.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  //if not dmFactura.qryVentaFacturaCANT_DIAS_CREDITO.IsNull then
  //Value := Value +' a '+dmFactura.qryVentaFacturaCANT_DIAS_CREDITO.AsString+' DIAS';
end;

procedure TqckCotiServIngeservis_NConduce.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  //if (Value <> '') then Value:='NCF: '+Value;
end;

procedure TqckCotiServIngeservis_NConduce.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckCotiServIngeservis_NConduce.PageNumber);
end;

procedure TqckCotiServIngeservis_NConduce.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckCotiServIngeservis_NConduce.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  if SetLogoCia(_ximagen) then
  if (_ximagen <> '') then
  begin
    QRImage1.Picture.LoadFromFile(_ximagen);
  end;
end;

procedure TqckCotiServIngeservis_NConduce.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Not dmFactura.qryCotizacionConduceNOMBRE_CLIENTE_GENERAL.IsNull then
     if (dmFactura.qryCotizacionConduceNOMBRE_CLIENTE_GENERAL.Value <> '') then
  Value:=dmFactura.qryCotizacionConduceNOMBRE_CLIENTE_GENERAL.Value;
end;

procedure TqckCotiServIngeservis_NConduce.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  Value:= FormatMaskText('(000)000-0000;0;*', Value);
end;

end.
