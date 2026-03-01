unit URepFacturaPuntoVenta;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepFactPuntoVenta = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText12: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel20: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel3: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRBand2: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    ChildBand1: TQRChildBand;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel23: TQRLabel;
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckRepFactPuntoVenta: TqckRepFactPuntoVenta;

implementation

uses UDatModCompania, UDatModClientes, UGlobal, UFormPresupuesto;

{$R *.DFM}

procedure TqckRepFactPuntoVenta.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrLabel19.Caption:= VarNombreUsuario;
  qrLabel27.Caption:= GlbPiedePaginaFactura;
end;

end.
