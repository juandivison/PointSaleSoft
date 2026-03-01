unit URepInspecciones;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepInspecciones = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRDBText13: TQRDBText;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    qrlabelFecha: TQRLabel;
    qrcriterioReporte: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRSysData2: TQRSysData;
    QRBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    procedure QRDBText10Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepInspecciones: TqckRepInspecciones;

implementation
uses UGlobal, UDatModCompania, URepAfiliaciones;
{$R *.DFM}

procedure TqckRepInspecciones.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  if (Value = '1') then
  Value:='Si' else Value:='No';
end;

end.
