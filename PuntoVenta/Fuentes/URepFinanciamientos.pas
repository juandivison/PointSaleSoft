unit URepFinanciamientos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepFinanciamientos = class(TQuickRep)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    TPag: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText14: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure TPagPrint(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepFinanciamientos: TqckRepFinanciamientos;

implementation
uses UDatModReportes, uglobal;

{$R *.DFM}

procedure TqckRepFinanciamientos.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('dd/mmm/yy',dmReportes.qryRepFinanciamientos.Params[0].Value) +
         ' al ' + FormatDateTime('dd/mmm/yy',dmReportes.qryRepFinanciamientos.Params[1].Value);
end;

procedure TqckRepFinanciamientos.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if dmreportes.qryRepFinanciamientosFECHA_ULT_PAGO.IsNull then
  Value:='';
end;

procedure TqckRepFinanciamientos.TPagPrint(sender: TObject;
  var Value: String);
begin
  Value:= ' de '+ inttostr(glbTPag);
end;

end.
