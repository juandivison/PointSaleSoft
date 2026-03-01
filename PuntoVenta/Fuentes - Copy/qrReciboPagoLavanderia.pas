unit qrReciboPagoLavanderia;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, QuickRpt, QRCtrls, ExtCtrls;

type
  TqckrReciboPagoLavanderia = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabelTitulo: TQRLabel;
    QRLabelFecha: TQRLabel;
    QRShape1: TQRShape;
    QRLabelCliente: TQRLabel;
    QRLabelOrden: TQRLabel;
    QRLabelMetodoPago: TQRLabel;
    QRLabelMonto: TQRLabel;
    QRLabelObservacion: TQRLabel;
    DetailBand1: TQRBand;
    QRDBTextCliente: TQRDBText;
    QRDBTextOrden: TQRDBText;
    QRDBTextMetodoPago: TQRDBText;
    QRDBTextMonto: TQRDBText;
    QRDBTextObs: TQRDBText;
    QRDBTextFecha: TQRDBText;
    QRLabelGracias: TQRLabel;
    QRBandPie: TQRBand;
    QRLabelFirma: TQRLabel;
    QRShapeFirma: TQRShape;
  private
    { Private declarations }
  public
    procedure PrepararReporte(IDOrden: Integer);
  end;

var
  qckrReciboPagoLavanderia: TqckrReciboPagoLavanderia;

implementation

uses UDatModLavanderia;

{$R *.DFM}

procedure TqckrReciboPagoLavanderia.PrepararReporte(IDOrden: Integer);
begin
  with dmLavanderia do
  begin
    if tblLAV_PAGO.Active then tblLAV_PAGO.Close;
    tblLAV_PAGO.ParamByName('ID_ORDEN').AsInteger := IDOrden;
    tblLAV_PAGO.Open;
  end;
end;

end.

