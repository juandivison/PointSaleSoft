unit URepTicketVta;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, IBCustomDataSet,
  IBQuery;

type
  TqckTicketVta = class(TQuickRep)
    qryDatosVenta: TIBQuery;
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qryDatosVentaNUM_TRN: TIntegerField;
    qryDatosVentaNUMFACT: TIBStringField;
    qryDatosVentaCODIGO_PROD: TIBStringField;
    qryDatosVentaDESCRIPCION: TIBStringField;
    qryDatosVentaHORA: TDateTimeField;
    qryDatosVentaCANT: TFloatField;
    QRDBText4: TQRDBText;
    qryDatosVentaFECHA: TDateTimeField;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
  private

  public

  end;

var
  qckTicketVta: TqckTicketVta;

implementation
uses UDatModConectar, UCompania, UDatModCompania;
{$R *.DFM}

end.
