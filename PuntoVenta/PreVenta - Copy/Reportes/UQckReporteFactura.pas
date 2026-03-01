unit UQckReporteFactura;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckFactura = class(TQuickRep)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
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
    TPag: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel11: TQRLabel;
    QRBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    qrtipoVenta: TQRLabel;
    QRDBText11: TQRDBText;
    QRImage1: TQRImage;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
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
  qckFactura: TqckFactura;

implementation

uses uglobal, UDatosVentas, UDatModCompania, UDatModClientes, UDatModDespacho;

{$R *.DFM}

procedure TqckFactura.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckFactura.AllDataSets.Add(dmCompania.tblCompania);
  qckFactura.AllDataSets.Add(dmVentas.qryProveedor);
  //qckFactura.AllDataSets.Add(dmDespacho.tblDespachoMasterRep);
end;

procedure TqckFactura.QRExpr3Print(sender: TObject; var Value: String);
begin
  if Value = '0.00' then value:='';
end;

procedure TqckFactura.QRDBText10Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckFactura.QRDBText9Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckFactura.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  xGrafico : String;
begin
  xGrafico:=FileToUse('Grafico','Logo.jpg');
  if (xGrafico <> '') then
  QRImage1.Picture.LoadFromFile(xGrafico);
  QRLabel2.Caption := FormatDateTime('dd-mmm-yyyy', ExtraerFecha(dmDespacho.tblDespachoMasterRepFECHA.Value));
end;

end.
