unit UReporteDgt3;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  Tqckdgt3anexo = class(TQuickRep)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    qrNacion: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qckdgt3anexoAfterPreview(Sender: TObject);
    procedure qckdgt3anexoAfterPrint(Sender: TObject);
  private

  public

  end;

var
  qckdgt3anexo: Tqckdgt3anexo;
  num : integer = 0;
implementation
 Uses UDataModNomina;
{$R *.DFM}

procedure Tqckdgt3anexo.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inc(num);
  if num  > 25 then
  Begin
    qckdgt3anexo.NewPage;
    num :=1;
  end;
  if DmNom.qryRepPersonalSEXO.Value = 'M' then
  qrNacion.Caption :='DOMINICANO' else
  qrNacion.Caption := 'DOMINICANA';
end;


procedure Tqckdgt3anexo.qckdgt3anexoAfterPreview(Sender: TObject);
begin
  num:=0;
end;

procedure Tqckdgt3anexo.qckdgt3anexoAfterPrint(Sender: TObject);
begin
  num:=0;
end;

end.
