unit URepVentaCajaxRutaResumen;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckVentaCajaxRutaResumen = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRTARIFA: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRGroup2: TQRGroup;
    QRExpr2: TQRExpr;
    QRDBText10: TQRDBText;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr3: TQRExpr;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckVentaCajaxRutaResumen: TqckVentaCajaxRutaResumen;

implementation
 uses UDatModReportes, UDatModCompania;
{$R *.DFM}

procedure TqckVentaCajaxRutaResumen.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,dmReportes.qryDatosRepVxCajasResumen.Params[0].Value)+' al '+FormatDatetime(Shortdateformat,dmReportes.qryDatosRepVxCajasResumen.Params[1].Value);
end;

procedure TqckVentaCajaxRutaResumen.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

procedure TqckVentaCajaxRutaResumen.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value :='';
end;

end.
