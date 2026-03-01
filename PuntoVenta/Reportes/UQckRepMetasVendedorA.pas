unit UQckRepMetasVendedorA;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepMetaXVendedorA = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRBand1: TQRBand;
    qrtipoVenta: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText10: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
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
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRSysData1: TQRSysData;
    QRLabel14: TQRLabel;
    qrLabelCriterioDatos: TQRLabel;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRDBText5: TQRDBText;
    QRGroup2: TQRGroup;
    QRBand3: TQRBand;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
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
  private

  public

  end;

var
  qckRepMetaXVendedorA: TqckRepMetaXVendedorA;

implementation

uses UDatModReportes;
 
{$R *.DFM}

procedure TqckRepMetaXVendedorA.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckRepMetaXVendedorA.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckRepMetaXVendedorA.QRDBText8Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckRepMetaXVendedorA.QRDBText10Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckRepMetaXVendedorA.QRExpr2Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckRepMetaXVendedorA.QRExpr11Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckRepMetaXVendedorA.QRExpr10Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckRepMetaXVendedorA.QRExpr9Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckRepMetaXVendedorA.QRExpr7Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckRepMetaXVendedorA.QRExpr17Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckRepMetaXVendedorA.QRExpr16Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckRepMetaXVendedorA.QRExpr15Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckRepMetaXVendedorA.QRExpr14Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckRepMetaXVendedorA.QRExpr13Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckRepMetaXVendedorA.QRExpr12Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckRepMetaXVendedorA.QRExpr8Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

end.
