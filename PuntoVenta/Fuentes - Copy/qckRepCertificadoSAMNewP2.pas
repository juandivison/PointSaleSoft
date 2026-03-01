unit qckRepCertificadoSAMNewP2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckCertificadoSamNewP2 = class(TQuickRep)
    QRImage1: TQRImage;
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
  private

  public

  end;

var
  qckCertificadoSamNewP2: TqckCertificadoSamNewP2;

implementation

{$R *.DFM}

end.
