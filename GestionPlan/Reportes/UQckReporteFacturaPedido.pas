unit UQckReporteFacturaPedido;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckFacturaPedido = class(TQuickRep)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
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
    qrtipoVenta: TQRLabel;
    QRDBText11: TQRDBText;
    QRExpr5: TQRExpr;
    QRLabel12: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckFacturaPedido: TqckFacturaPedido;

implementation

uses UDatosVentas, UDatModCompania, UDatModClientes, UDatModDespacho,
  UDatModInventario;


{$R *.DFM}

procedure TqckFacturaPedido.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckFacturaPedido.AllDataSets.Add(dmCompania.tblCompania);
  qckFacturaPedido.AllDataSets.Add(dmInventario.qryProveedores);
end;

procedure TqckFacturaPedido.QRExpr3Print(sender: TObject; var Value: String);
begin
  if Value = '0.00' then value:='';
end;

procedure TqckFacturaPedido.QRDBText10Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckFacturaPedido.QRDBText9Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value:='';
end;

end.
