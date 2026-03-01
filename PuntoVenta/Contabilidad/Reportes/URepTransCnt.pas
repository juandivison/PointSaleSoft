unit URepTransCnt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqckRepTrnCnt = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel1: TQRLabel;
    qrFecha: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRSysData2: TQRSysData;
    QRExpr5: TQRExpr;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRSysData3: TQRSysData;
    qrNoPagina: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText8: TQRDBText;
    procedure qrFechaPrint(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckRepTrnCnt: TqckRepTrnCnt;

implementation
uses UDmRep,uglobal;
{$R *.DFM}

procedure TqckRepTrnCnt.qrFechaPrint(sender: TObject; var Value: String);
begin
  Value := 'De '+Formatdatetime('mmm-dd-yyyy',GlbFechaInicial)+ ' a '+
  Formatdatetime('mmm-dd-yyyy',GlbFechaFinal);
end;

procedure TqckRepTrnCnt.QRDBText3Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckRepTrnCnt.QRDBText4Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckRepTrnCnt.QRExpr3Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckRepTrnCnt.QRExpr4Print(sender: TObject; var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckRepTrnCnt.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrNoPagina.caption:=' de '+InttoStr(glbTPag);
end;

end.
