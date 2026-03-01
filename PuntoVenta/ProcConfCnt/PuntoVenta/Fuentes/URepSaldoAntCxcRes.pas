unit URepSaldoAntCxcRes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepSaldoXantCxcRes = class(TQuickRep)
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel5: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepSaldoXantCxcRes: TqckRepSaldoXantCxcRes;

implementation
uses UDatModCompania, UDatModReportes;

{$R *.DFM}

procedure TqckRepSaldoXantCxcRes.QRExpr5Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then
  Value := '';
end;

procedure TqckRepSaldoXantCxcRes.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then
  Value := '';
end;

procedure TqckRepSaldoXantCxcRes.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then
  Value := '';
end;

procedure TqckRepSaldoXantCxcRes.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then
  Value := '';
end;

procedure TqckRepSaldoXantCxcRes.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then
  Value := '';
end;

end.
