unit UQckRepVendedorXRuta;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckListaFactXRuta = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRBand1: TQRBand;
    qrtipoVenta: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText3: TQRDBText;
    QRExpr5: TQRExpr;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText4: TQRDBText;
    QRBand2: TQRBand;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRSysData1: TQRSysData;
    QRLabel14: TQRLabel;
    qrLabelCriterioDatos: TQRLabel;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRDBText5: TQRDBText;
    QRGroup2: TQRGroup;
    QRBand3: TQRBand;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    qrGroupRuta: TQRGroup;
    QRDBText6: TQRDBText;
    QRBand4: TQRBand;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRLabel2: TQRLabel;
    QRDBText12: TQRDBText;
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRExpr11Print(sender: TObject; var Value: String);
    procedure QRExpr10Print(sender: TObject; var Value: String);
    procedure QRExpr9Print(sender: TObject; var Value: String);
    procedure QRExpr7Print(sender: TObject; var Value: String);
    procedure QRExpr17Print(sender: TObject; var Value: String);
    procedure QRExpr16Print(sender: TObject; var Value: String);
    procedure QRExpr15Print(sender: TObject; var Value: String);
    procedure QRExpr14Print(sender: TObject; var Value: String);
    procedure QRExpr13Print(sender: TObject; var Value: String);
    procedure QRExpr12Print(sender: TObject; var Value: String);
    procedure QRExpr8Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckListaFactXRuta: TqckListaFactXRuta;

implementation

uses UDatModReportes;
 
{$R *.DFM}

procedure TqckListaFactXRuta.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRDBText8Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRDBText10Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRExpr2Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRExpr11Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRExpr10Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRExpr9Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRExpr7Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRExpr17Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRExpr16Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRExpr15Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRExpr14Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRExpr13Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRExpr12Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRExpr8Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckListaFactXRuta.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  Value:='RUTA: '+value;
end;

procedure TqckListaFactXRuta.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  Value := Value + ' ' +dmReportes.qryViewVentasHistDESC_RUTA.Value;
end;

procedure TqckListaFactXRuta.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if (value <> 'COLMADO') then
  Value:=StringReplace(uppercase(value),'COLMADO','',[rfReplaceAll]);
end;

end.
