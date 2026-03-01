unit UQckReporteFacturaDespA;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckFacturaDespA = class(TQuickRep)
    QRBand3: TQRBand;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel10: TQRLabel;
    QRBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    TPag: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel11: TQRLabel;
    qrtipoVenta: TQRLabel;
    QRDBText11: TQRDBText;
    QRImage1: TQRImage;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    qrLabelOrigen: TQRLabel;
    qrLabelDestino: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckFacturaDespA: TqckFacturaDespA;

implementation

uses uglobal, UDatosVentas, UDatModCompania, UDatModClientes, UDatModDespacho,
  UQckReporteFactura, UDatModReportes;

{$R *.DFM}

procedure TqckFacturaDespA.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckFacturaDespA.AllDataSets.Add(dmCompania.tblCompania);
  //qckFacturaDespA.AllDataSets.Add(dmDespacho.tblDespachoMasterRep);
end;

procedure TqckFacturaDespA.QRExpr3Print(sender: TObject; var Value: String);
begin
  if Value = '0.00' then value:='';
end;

procedure TqckFacturaDespA.QRDBText10Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckFacturaDespA.QRDBText9Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckFacturaDespA.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  xGrafico : String;
begin
  xGrafico:=FileToUse('Grafico','Logo.jpg');
  if (xGrafico <> '') then
  QRImage1.Picture.LoadFromFile(xGrafico);
  QRLabel2.Caption := FormatDateTime('dd-mmm-yyyy', ExtraerFecha(dmDespacho.tblDespachoMasterRepAFECHA.Value));
  dmReportes.qryDivInventario.Close;
  dmReportes.qryDivInventario.Open;
  if dmReportes.qryDivInventario.Locate('INVENTARIO_ID',
  dmDespacho.tblDespachoMasterRepAINV_ID_ORIGEN.Value,[]) then
  qrLabelOrigen.Caption:= dmReportes.qryDivInventarioDESCRIPCION.Value;

  if dmReportes.qryDivInventario.Locate('INVENTARIO_ID',
  dmDespacho.tblDespachoMasterRepAINV_ID_DESTINO.Value,[]) then
  qrLabelDestino.Caption:= dmReportes.qryDivInventarioDESCRIPCION.Value;

end;

end.
