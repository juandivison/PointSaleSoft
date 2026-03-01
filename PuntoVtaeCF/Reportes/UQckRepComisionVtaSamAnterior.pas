unit UQckRepComisionVtaSam;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckReoComisionVtaSam = class(TQuickRep)
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
    QRSysData1: TQRSysData;
    QRLabel14: TQRLabel;
    qrLabelCriterioDatos: TQRLabel;
    QRGroup2: TQRGroup;
    QRBand3: TQRBand;
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
    QRLabel24: TQRLabel;
    QRLabel2: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr11: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
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
  qckReoComisionVtaSam: TqckReoComisionVtaSam;

implementation

uses UDatModReportes;
 
{$R *.DFM}

procedure TqckReoComisionVtaSam.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckReoComisionVtaSam.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckReoComisionVtaSam.QRDBText8Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckReoComisionVtaSam.QRDBText10Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckReoComisionVtaSam.QRExpr2Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckReoComisionVtaSam.QRExpr11Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckReoComisionVtaSam.QRExpr10Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckReoComisionVtaSam.QRExpr9Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckReoComisionVtaSam.QRExpr7Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckReoComisionVtaSam.QRExpr17Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckReoComisionVtaSam.QRExpr16Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckReoComisionVtaSam.QRExpr15Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckReoComisionVtaSam.QRExpr14Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckReoComisionVtaSam.QRExpr13Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckReoComisionVtaSam.QRExpr12Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckReoComisionVtaSam.QRExpr8Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

end.
