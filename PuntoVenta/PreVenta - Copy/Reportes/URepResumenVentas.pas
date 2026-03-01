unit URepResumenVentas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckResumenVentas = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRTARIFA: TQRLabel;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand5: TQRBand;
    QRExpr3: TQRExpr;
    QRGroup1: TQRGroup;
    QRExpr1: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRImage1: TQRImage;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrTpaginasPrint(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckResumenVentas: TqckResumenVentas;

implementation

uses UDatModReportes, uglobal;

{$R *.DFM}

procedure TqckResumenVentas.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,dmReportes.qryResumenVentas.Params[0].Value)+' al '+FormatDatetime(Shortdateformat,dmReportes.qryResumenVentas.Params[1].Value);
end;

procedure TqckResumenVentas.QRExpr1Print(sender: TObject;
  var Value: String);
begin
  if dmreportes.qryResumenVentas.FieldByName('moneda').Value= '1' then value := 'Venta en RD$'
  else if dmreportes.qryResumenVentas.FieldByName('moneda').Value=  '2'
  then value := 'Venta en US$'
  else if dmreportes.qryResumenVentas.FieldByName('moneda').Value= '3'
  then value := 'Venta en Euros';
end;

procedure TqckResumenVentas.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  xGrafico : String;
begin
  xGrafico:=FileToUse('Grafico','Logo.jpg');
  if (xGrafico <> '') then
  qrImage1.Picture.LoadFromFile(xGrafico);
end;

procedure TqckResumenVentas.qrTpaginasPrint(sender: TObject;
  var Value: String);
begin
  Value := ' de '+IntToStr(glbTPag);
end;

end.
