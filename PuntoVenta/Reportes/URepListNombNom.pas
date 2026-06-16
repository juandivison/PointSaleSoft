unit URepListNombNom;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqckRepNomNom = class(TQuickRep)
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText7: TQRDBText;
  private

  public

  end;

var
  qckRepNomNom: TqckRepNomNom;

implementation
uses UDataModNomina;
{$R *.DFM}

end.
