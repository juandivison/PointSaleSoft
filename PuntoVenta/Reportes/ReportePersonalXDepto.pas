unit ReportePersonalXDepto;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQckReporteGralXDepto = class(TQuickRep)
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRBand4: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel15: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr3: TQRExpr;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand5: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText18: TQRDBText;
    QRLabel10: TQRLabel;
    QRBand6: TQRBand;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel31: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel30: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel35: TQRLabel;
    QRSysData6: TQRSysData;
    QRDBText30: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText7: TQRDBText;
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel2Print(sender: TObject; var Value: String);
  private

  public
    tipoEmpleado : String;
  end;

var
  QckReporteGralXDepto: TQckReporteGralXDepto;

implementation

uses UDatModNomina;
{$R *.DFM}

procedure TQckReporteGralXDepto.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (DmNomina.QryPersonalDSECCION.Value <> '') then
  PrintBand:=False else PrintBand := True;
end;

procedure TQckReporteGralXDepto.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  Value := Value + ' '+ tipoEmpleado;
end;

end.
