unit UQckRepListaFactura;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckListaFactXCte = class(TQuickRep)
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
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel13: TQRLabel;
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
  qckListaFactXCte: TqckListaFactXCte;

implementation

uses UDatModReportes;



{$R *.DFM}

procedure TqckListaFactXCte.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCte.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCte.QRDBText8Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCte.QRDBText10Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCte.QRExpr2Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCte.QRExpr11Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCte.QRExpr10Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCte.QRExpr9Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCte.QRExpr7Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCte.QRExpr17Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCte.QRExpr16Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCte.QRExpr15Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCte.QRExpr14Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCte.QRExpr13Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCte.QRExpr12Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCte.QRExpr8Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

end.
