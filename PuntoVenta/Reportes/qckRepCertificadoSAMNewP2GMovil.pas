unit qckRepCertificadoSAMNewP2GMovil;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, DB, RxMemDS;

type
  TqckCertificadoSamNewP2GMovil = class(TQuickRep)
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
    QRImage1: TQRImage;
    rxData: TRxMemoryData;
    rxDatax: TSmallintField;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qckCertificadoSamNewP2GMovil: TqckCertificadoSamNewP2GMovil;

implementation

{$R *.DFM}

procedure TqckCertificadoSamNewP2GMovil.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  rxData.Close;
  rxData.Open;
  rxData.Append;
  rxdatax.Value:=0;
  rxData.Post;
end;

end.
