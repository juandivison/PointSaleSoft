unit UReporteValoresEntregadosCuadre;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepValoresEntxRuta = class(TQuickRep)
    QRBand3: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    TPag: TQRLabel;
    qrTpaginas: TQRSysData;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRBand5: TQRBand;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRExpr9Print(sender: TObject; var Value: String);
    procedure QRExpr10Print(sender: TObject; var Value: String);
    procedure QRExpr11Print(sender: TObject; var Value: String);
    procedure QRExpr16Print(sender: TObject; var Value: String);
    procedure QRExpr12Print(sender: TObject; var Value: String);
    procedure QRExpr13Print(sender: TObject; var Value: String);
    procedure QRExpr15Print(sender: TObject; var Value: String);
    procedure QRExpr14Print(sender: TObject; var Value: String);
    procedure QRExpr7Print(sender: TObject; var Value: String);
    procedure QRExpr6Print(sender: TObject; var Value: String);
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRExpr8Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRExpr17Print(sender: TObject; var Value: String);
    procedure QRExpr18Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepValoresEntxRuta: TqckRepValoresEntxRuta;

implementation
Uses UDatModReportes;
{$R *.DFM}

procedure TqckRepValoresEntxRuta.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  Value :=FormatDateTime('dd-mmm-yyyy',dmReportes.qryDatosRepDifVendedores.Params[0].Value)+
   ' a '+FormatDateTime('dd-mmm-yyyy',dmReportes.qryDatosRepDifVendedores.Params[1].Value);
end;

procedure TqckRepValoresEntxRuta.QRDBText16Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRDBText15Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRDBText14Print(sender: TObject;
  var Value: String);
begin
   if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRDBText13Print(sender: TObject;
  var Value: String);
begin
    if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRDBText12Print(sender: TObject;
  var Value: String);
begin
    if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRDBText5Print(sender: TObject;
  var Value: String);
begin
   if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRDBText2Print(sender: TObject;
  var Value: String);
begin
    if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRDBText11Print(sender: TObject;
  var Value: String);
begin
    if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr9Print(sender: TObject;
  var Value: String);
begin
    if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr10Print(sender: TObject;
  var Value: String);
begin
    if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr11Print(sender: TObject;
  var Value: String);
begin   if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr16Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr12Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr13Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr15Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr14Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr7Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr6Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr8Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr2Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr1Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRDBText8Print(sender: TObject;
  var Value: String);
begin
   if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr17Print(sender: TObject;
  var Value: String);
begin
 if Value = '0.00' then Value := '';
end;

procedure TqckRepValoresEntxRuta.QRExpr18Print(sender: TObject;
  var Value: String);
begin
 if Value = '0.00' then Value := '';
end;

end.
