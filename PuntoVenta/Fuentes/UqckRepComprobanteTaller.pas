unit UqckRepComprobanteTaller;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepComprobanteTaller = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand2: TQRBand;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel25: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRDBText10: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText13: TQRDBText;
    ChildBand2: TQRChildBand;
    QRLabel27: TQRLabel;
    ChildBand3: TQRChildBand;
    QRLabel23: TQRLabel;
    ChildBand4: TQRChildBand;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRLabel27Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckRepComprobanteTaller: TqckRepComprobanteTaller;

implementation
uses UDatosVentas, Uglobal;

{$R *.DFM}

procedure TqckRepComprobanteTaller.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qrLabel27.Caption:= GlbPiedePaginaFactura;
end;

procedure TqckRepComprobanteTaller.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  if (dmVentas.qryRegServMasterRepSTATUS.Value = 'A') then
  Value:= 'Autorización Trabajos';
end;

procedure TqckRepComprobanteTaller.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if dmVentas.qryRegServMasterRepDetDESCRIPCIONESPECIAL.IsNull then
  begin
    ChildBand4.Enabled:=False;
    ChildBand4.Height:=1;
  end else
  begin
    ChildBand4.Enabled:=True;
    ChildBand4.Height:=19;
  end;
end;

procedure TqckRepComprobanteTaller.QRLabel27Print(sender: TObject;
  var Value: String);
begin
  if (dmVentas.qryRegServMasterRepSTATUS.Value = 'A') then
  Value:= 'Documento No Venta';
end;

procedure TqckRepComprobanteTaller.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if (dmVentas.qryRegServMasterRepSTATUS.Value = 'A') then
  Value := '';
end;

procedure TqckRepComprobanteTaller.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if not dmVentas.qryRegServMasterRepFECHA_ESTIMADA_ENTREGA.IsNull then
  begin
    QRLabel8.Caption:='F.Entrega:';
    QRDBText12.Enabled:=False;
    QRDBText15.Enabled:=True;
  end else
  begin
    QRDBText15.Enabled:=False;
    QRDBText12.Enabled:=True;
    QRLabel8.Caption:='F.Salida:';
  end;
end;

end.
