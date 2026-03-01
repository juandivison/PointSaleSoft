unit qckRepCertificadoSAMNew;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, grimgctrl;

type
  TqckCertificadoSamNew = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRImage1: TQRImage;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText11: TQRDBText;
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
  qckCertificadoSamNew: TqckCertificadoSamNew;

implementation
 uses UDatModClientes; 
{$R *.DFM}

procedure TqckCertificadoSamNew.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckCertificadoSamNew.QRImage1.Visible:=True;
end;

procedure TqckCertificadoSamNew.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('dd',now);
end;

procedure TqckCertificadoSamNew.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('mmm',now);
end;

procedure TqckCertificadoSamNew.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value:=  FormatDateTime('yyyy',now);
end;

procedure TqckCertificadoSamNew.QRLabel4Print(sender: TObject;
  var Value: String);
begin
  if (not dmClientes.qryRepCertificadoSamFECHAINICIAL.IsNull
      and not dmClientes.qryRepCertificadoSamFECHAFIN.IsNull ) then
  Value:= FormatDateTime('yyyy-MM-dd',dmClientes.qryRepCertificadoSamFECHAINICIAL.Value)
  + ' a '+FormatDateTime('yyyy-MM-dd',dmClientes.qryRepCertificadoSamFECHAFIN.Value)
  else
  if (not dmClientes.qryRepCertificadoSamFECHAFIN.IsNull) then
  Value:=FormatDateTime('yyyy-MM-dd',dmClientes.qryRepCertificadoSamFECHAFIN.Value)
  else Value:='';
end;

procedure TqckCertificadoSamNew.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  Value:='Garantia #'+Value;
end;

end.
