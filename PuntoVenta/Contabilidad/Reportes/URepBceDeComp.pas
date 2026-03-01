unit URepBceDeComp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, DB, RxMemDS;

type
  TqckBalancedeComp = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel11: TQRLabel;
    QRSysData3: TQRSysData;
    QRBand4: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    qrfecha: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    rxTotal: TRxMemoryData;
    rxTotalDebito: TCurrencyField;
    rxTotalCredito: TCurrencyField;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckBalancedeComp: TqckBalancedeComp;

implementation
  uses UDmRep,uglobal;
{$R *.DFM}

procedure TqckBalancedeComp.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Imprime(dtmodrep.rxbalancecompdebito.Value,dtmodrep.rxbalancecompcredito.Value,1) then
  PrintBand := True else PrintBand := False;
end;

procedure TqckBalancedeComp.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrfecha.Caption:=' AL '+formatdatetime('dd-mmm-yyyy',glbfechainicial);
end;

procedure TqckBalancedeComp.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if value  = '0.00' then value :='';
end;

procedure TqckBalancedeComp.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  if value  = '0.00' then value :='';
end;

end.
  