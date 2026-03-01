unit urepImpLabelCodBarra;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, QBarcode;

type
  TqckRepTickect = class(TQuickRep)
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    BarCode1: TBarCode;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepTickect: TqckRepTickect;

implementation

 uses ULabelImpCodBarra;
{$R *.DFM}

procedure TqckRepTickect.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  s : string;
begin
  s:=frmCodigoBarra.rxDatosCodigoProd.Value;
  frmCodigoBarra.qryProv.Close;
  QRLabel3.Caption:='';
  if Length(s) > 0 then
  begin
    frmCodigoBarra.qryProv.Params[0].Value:=StrToInt(s);
    frmCodigoBarra.qryProv.Open;
    if Length(frmCodigoBarra.qryProvCODIGOPROVEEDOR.AsString) > 0 then
    QRLabel3.Caption:='P' + frmCodigoBarra.qryProvCODIGOPROVEEDOR.AsString;
  end;
  BarCode1.Text:= frmCodigoBarra.rxDatosCodigoProd.Value;
end;

procedure TqckRepTickect.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepTickect.AllDataSets.Add(frmCodigoBarra.tblCompania);
  qckRepTickect.AllDataSets.Add(frmCodigoBarra.qryProv);
end;

procedure TqckRepTickect.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  Value:='REF'+Value;
end;

procedure TqckRepTickect.QRLabel2Print(sender: TObject; var Value: String);
begin
  Value:=FormatDatetime('dd-mmm-yy', Date);
end;

end.
