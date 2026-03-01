unit UMarbetePolizaSsegPepin;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepMarbeteSegPepin = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText9: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText10: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckRepMarbeteSegPepin: TqckRepMarbeteSegPepin;

implementation
  uses UDatmodDatosGenerales;
{$R *.DFM}

procedure TqckRepMarbeteSegPepin.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckRepMarbeteSegPepin.AllDataSets.Clear;
  qckRepMarbeteSegPepin.AllDataSets.Add(dmDatos.qryRepPoliza);
  qckRepMarbeteSegPepin.AllDataSets.Add(dmDatos.qryRepPolizaDet);
end;

procedure TqckRepMarbeteSegPepin.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (dmdatos.qryRepPolizaDEtCASACONDUCTOR.Value = 0) then
  QRLabel24.Caption:=' ';
  if (dmdatos.qryRepPolizaDEtautoasistencia.Value = 0) then
  QRLabel25.Caption:=' ';
end;

end.
