unit URepSaldoXAntCxc;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepSaldoXAntCxc = class(TQuickRep)
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
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel9: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public

  end;

var
  qckRepSaldoXAntCxc: TqckRepSaldoXAntCxc;
  CodCteAuxi, cont : Integer;

implementation
uses UDatModCompania, UDatModReportes;
{$R *.DFM}

procedure TqckRepSaldoXAntCxc.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  cont:=0;
end;

procedure TqckRepSaldoXAntCxc.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if (Cont = 0) then
  CodCteAuxi := dmReportes.rxSaldoAntCxcCodigo.Value;
  Inc(cont);
end;

procedure TqckRepSaldoXAntCxc.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (Cont > 1) And (CodCteAuxi = dmReportes.rxSaldoAntCxcCodigo.Value) then
  begin
    PrintBand := True;
  end else
  begin
    printBand := False;
    CodCteAuxi := dmReportes.rxSaldoAntCxcCodigo.Value;
  end;
end;

procedure TqckRepSaldoXAntCxc.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //Detail Line

end;

procedure TqckRepSaldoXAntCxc.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then
  Value := '';
end;

procedure TqckRepSaldoXAntCxc.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then
  Value := '';
end;

procedure TqckRepSaldoXAntCxc.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then
  Value := '';
end;

procedure TqckRepSaldoXAntCxc.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if (value = '0.00') then
  Value := '';
end;

procedure TqckRepSaldoXAntCxc.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
 //if BandPrinted then
 Cont:=0;
end;

end.
