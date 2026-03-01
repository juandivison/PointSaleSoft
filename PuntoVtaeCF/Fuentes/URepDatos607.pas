unit URepDatos607;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, QRExport, FieldsType,
  ExcelDatos;

type
  TqckRepData607 = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    qckRepDatos607: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText18: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRBand1: TQRBand;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel16: TQRLabel;
    procedure QRLabel15Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepData607: TqckRepData607;

implementation

uses UDatModFinanzas, UDatModReportes;

{$R *.DFM}

procedure TqckRepData607.QRLabel15Print(sender: TObject;
  var Value: String);
begin
  Value := Value + ' Desde ' +formatdatetime('dd-mm-yyy',dmFinanzas.qryRep607.Params[0].value)
  +'Hasta '+formatdatetime('dd-mm-yyy',dmFinanzas.qryRep607.Params[1].value);
end;

procedure TqckRepData607.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then value := '';
end;

procedure TqckRepData607.QRDBText10Print(sender: TObject;
  var Value: String);
begin
if (value = '0.00') then value := '';
end;

procedure TqckRepData607.QRDBText11Print(sender: TObject;
  var Value: String);
begin
if (value = '0.00') then value := '';
end;

procedure TqckRepData607.QRDBText12Print(sender: TObject;
  var Value: String);
begin
if (value = '0.00') then value := '';
end;

procedure TqckRepData607.QRDBText8Print(sender: TObject;
  var Value: String);
begin
if (value = '0.00') then value := '';
end;

procedure TqckRepData607.QRDBText3Print(sender: TObject;
  var Value: String);
begin
if (value = '0.00') then value := '';
end;

procedure TqckRepData607.QRDBText7Print(sender: TObject;
  var Value: String);
begin
if (value = '0.00') then value := '';
end;

procedure TqckRepData607.QRDBText6Print(sender: TObject;
  var Value: String);
begin
if (value = '0.00') then value := '';
end;

end.
