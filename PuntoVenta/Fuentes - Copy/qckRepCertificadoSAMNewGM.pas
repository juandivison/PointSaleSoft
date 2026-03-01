unit qckRepCertificadoSAMNewGM;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, grimgctrl;

type
  TqckCertificadoSamNewGMovil = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRImage1: TQRImage;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckCertificadoSamNewGMovil: TqckCertificadoSamNewGMovil;

implementation
 uses UDatModClientes; 
{$R *.DFM}

procedure TqckCertificadoSamNewGMovil.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckCertificadoSamNewGMovil.QRImage1.Visible:=True;
end;

procedure TqckCertificadoSamNewGMovil.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('dd',now);
end;

procedure TqckCertificadoSamNewGMovil.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('mmm',now);
end;

procedure TqckCertificadoSamNewGMovil.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value:=  FormatDateTime('yyyy',now);
end;

procedure TqckCertificadoSamNewGMovil.QRLabel4Print(sender: TObject;
  var Value: String);
begin
  if (not dmClientes.qryRepCertificadoSamGFECHAINICIAL.IsNull
      and not dmClientes.qryRepCertificadoSamGFECHAFIN.IsNull ) then
  Value:= FormatDateTime('yyyy-MM-dd',dmClientes.qryRepCertificadoSamGFECHAINICIAL.Value)
  + ' a '+FormatDateTime('yyyy-MM-dd',dmClientes.qryRepCertificadoSamGFECHAFIN.Value)
  else
  if (not dmClientes.qryRepCertificadoSamGFECHAFIN.IsNull) then
  Value:=FormatDateTime('yyyy-MM-dd',dmClientes.qryRepCertificadoSamGFECHAFIN.Value)
  else Value:='';
end;

procedure TqckCertificadoSamNewGMovil.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  Value:='Garantia #'+Value;
end;

end.
