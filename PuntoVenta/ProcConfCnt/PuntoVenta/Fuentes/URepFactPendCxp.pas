unit URepFactPendCxp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckFactCxpPendientes = class(TQuickRep)
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
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    SummaryBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckFactCxpPendientes: TqckFactCxpPendientes;

implementation

uses UDatModCxp, UDatModCompania;

{$R *.DFM}

procedure TqckFactCxpPendientes.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckFactCxpPendientes.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckFactCxpPendientes.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDateTime('dd-mmm-yy', dmCxp.qryFactPendCxp.Params[0].Value) +
  ' al ' + FormatDateTime('dd-mmm-yy', dmCxp.qryFactPendCxp.Params[1].Value);
end;

procedure TqckFactCxpPendientes.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if Length(value) > 0 then
  Value:=Value + ') ';
end;

end.
