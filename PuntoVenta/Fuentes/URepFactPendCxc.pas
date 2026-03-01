unit URepFactPendCxc;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckFactPendCxc = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    SummaryBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRDBText6: TQRDBText;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckFactPendCxc: TqckFactPendCxc;

implementation
  uses UDatModCompania, UDatModCxc, uglobal;
  
{$R *.DFM}

procedure TqckFactPendCxc.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDateTime('dd-mmm-yy',dmCxc.qryFactPendientes.Params[0].Value) +
  ' al ' + FormatDateTime('dd-mmm-yy',dmCxc.qryFactPendientes.Params[1].Value);

end;

procedure TqckFactPendCxc.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if Length(value) > 0 then
  Value:=Value + ') ';
end;

procedure TqckFactPendCxc.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrTpaginas.Caption:= IntToStr(glbTPag);
end;

end.
