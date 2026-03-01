unit UQckOrdenCompraNewBB;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
   StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckOrdenDeCompraNewBB = class(TQuickRep)
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
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    ChildBand3: TQRChildBand;
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
    QRDBText8: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
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
    QRDBText27: TQRDBText;
    QRSysData3: TQRSysData;
    TPag: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText10: TQRDBText;
    qrLabelReImp: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape16: TQRShape;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText31: TQRDBText;
    ChildBand4: TQRChildBand;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText26: TQRDBText;
    ChildBand5: TQRChildBand;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape18: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText18: TQRDBText;
    QRExpr4: TQRExpr;
    QRDBText1: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRDBText30: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
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
    procedure QRDBText31Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckOrdenDeCompraNewBB: TqckOrdenDeCompraNewBB;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  URepComprobante, UDatModFactura, UDatmodDatosGenerales;


{$R *.DFM}

procedure TqckOrdenDeCompraNewBB.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckOrdenDeCompraNewBB.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckOrdenDeCompraNewBB.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  if not dmDatos.qryDatosOrdenImpCONTACTO.isnull then
  Value:= dmDatos.qryDatosOrdenImpCONTACTO.Value //GlbBuscarCodigoVendedor(glbcodVendedor);
  else value := '';
end;

procedure TqckOrdenDeCompraNewBB.QRLabel24Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcGAdmin.AsString+'%';
end;

procedure TqckOrdenDeCompraNewBB.QRLabel25Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcItbisGAdmin.AsString+'%';
end;

procedure TqckOrdenDeCompraNewBB.QRLabel26Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcTrans.AsString+'%';
end;

procedure TqckOrdenDeCompraNewBB.QRLabel27Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcDirTec.AsString+'%';
end;

procedure TqckOrdenDeCompraNewBB.QRLabel28Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcItbisDirTec.AsString+'%';
end;

procedure TqckOrdenDeCompraNewBB.QRLabel29Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPORCIMPREVISTO.AsString+'%';
end;

procedure TqckOrdenDeCompraNewBB.QRLabel30Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + ' '+dmfactura.qryPorcApplicadoenFactServPorcItbisImprevisto.AsString+'%';
end;

procedure TqckOrdenDeCompraNewBB.DetailBand1BeforePrint(
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

procedure TqckOrdenDeCompraNewBB.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  //if (Value <> '') then Value:='NCF: '+Value;
end;

procedure TqckOrdenDeCompraNewBB.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TPag.Caption:= IntToStr(qckOrdenDeCompraNewBB.PageNumber);
end;

procedure TqckOrdenDeCompraNewBB.QRSysData3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +' de ';
end;

procedure TqckOrdenDeCompraNewBB.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  var
    _xImagen : String;
begin
  //if FileExists(_ximagen) then
  {if SetLogoCia(_ximagen) then
  begin
    if SetLogoCia(_ximagen) then
    if (_ximagen <> '') then
    QRImage1.Picture.LoadFromFile(_ximagen)
    else QRImage1.Enabled:= False;
  end else
  QRImage1.Enabled:= False;}
end;

procedure TqckOrdenDeCompraNewBB.QRDBText31Print(sender: TObject;
  var Value: String);
begin
  Value:='RNC-'+Value;
end;

end.
