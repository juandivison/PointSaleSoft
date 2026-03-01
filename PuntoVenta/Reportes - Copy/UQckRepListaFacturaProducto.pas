unit UQckRepListaFacturaProducto;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckListaFactXCteXProducto = class(TQuickRep)
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
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRSysData1: TQRSysData;
    QRLabel14: TQRLabel;
    qrLabelCriterioDatos: TQRLabel;
    QRGroup2: TQRGroup;
    QRBand3: TQRBand;
    QRExpr20: TQRExpr;
    QRLabel2: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel3: TQRLabel;
    QRExpr22: TQRExpr;
    ChildBand2: TQRChildBand;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr4: TQRExpr;
    QRDBText8: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel7: TQRLabel;
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
    procedure QRExpr22Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckListaFactXCteXProducto: TqckListaFactXCteXProducto;

implementation

uses UDatModReportes;



{$R *.DFM}

procedure TqckListaFactXCteXProducto.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRDBText8Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRDBText10Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRExpr2Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRExpr11Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRExpr10Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRExpr9Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRExpr7Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRExpr17Print(sender: TObject;
  var Value: String);
begin
   if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRExpr16Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRExpr15Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRExpr14Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRExpr13Print(sender: TObject;
  var Value: String);
begin
    if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRExpr12Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRExpr8Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value :='';
end;

procedure TqckListaFactXCteXProducto.QRExpr22Print(sender: TObject;
  var Value: String);
begin
  Value := dmreportes.qryViewVentasHistCODIGO_PROD.AsString + '-'+Value;
end;

end.
