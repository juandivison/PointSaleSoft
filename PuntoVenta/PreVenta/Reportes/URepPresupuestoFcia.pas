unit URepPresupuestoFcia;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;


type
  TqckPresupuesto = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText17: TQRDBText;
    QRDBText25: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    SummaryBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
  private

  public

  end;

var
  qckPresupuesto: TqckPresupuesto;

implementation
  uses UDatModCompania, UGlobal,UFormPresupuesto;
{$R *.DFM}

end.
