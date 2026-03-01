unit URepVentaCajaXRuta;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckVentaCajaxRuta = class(TQuickRep)
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
    QRBand3: TQRBand;
    QRBand5: TQRBand;
    QRGroup1: TQRGroup;
    QRExpr1: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRGroup2: TQRGroup;
    QRExpr2: TQRExpr;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRBand6: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckVentaCajaxRuta: TqckVentaCajaxRuta;

implementation
 uses UDatModReportes, UDatModCompania;
{$R *.DFM}

procedure TqckVentaCajaxRuta.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,dmReportes.qryDatosRepVxCajas.Params[0].Value)+' al '+FormatDatetime(Shortdateformat,dmReportes.qryDatosRepVxCajas.Params[1].Value);
end;

procedure TqckVentaCajaxRuta.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckVentaCajaxRuta.AllDataSets.Add(dmcompania.tblCompania);
end;

procedure TqckVentaCajaxRuta.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckVentaCajaxRuta.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

end.
