unit URepItbisResXDia;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepItbis_ResXDia = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel32: TQRLabel;
    TPag: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText2: TQRDBText;
    PageFooterBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    procedure QRLabel6Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepItbis_ResXDia: TqckRepItbis_ResXDia;

implementation

uses UDatModCompania, uglobal, UDatModFactura;

{$R *.DFM}

procedure TqckRepItbis_ResXDia.QRLabel6Print(sender: TObject; var Value: String);
begin
  Value:= '';
  Value:= 'De '+ FormatDateTime('dd-mmm-yy',ExtraerFecha(dmfactura.qryRepItbis.Params[0].Value))+
          ' a ' + FormatDateTime('dd-mmm-yy',ExtraerFecha(dmfactura.qryRepItbis.Params[1].Value));
end;

end.
