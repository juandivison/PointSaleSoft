unit URepTransOpeDiaria;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckTransOpeDiaria = class(TQuickRep)
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
    QRGroup1: TQRGroup;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRGroup2: TQRGroup;
    QRDBText5: TQRDBText;
    QRBand5: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckTransOpeDiaria: TqckTransOpeDiaria;
  contDet : integer;

implementation

uses UDatModReportes;

{$R *.DFM}

procedure TqckTransOpeDiaria.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('dd/mmm/yy',dmReportes.qryRepTransOpeDiaria.Params[0].Value) +
         ' al ' + FormatDateTime('dd/mmm/yy',dmReportes.qryRepTransOpeDiaria.Params[1].Value);
end;

procedure TqckTransOpeDiaria.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  contDet:=0;
end;

procedure TqckTransOpeDiaria.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  contDet:=contDet + 1;
end;

procedure TqckTransOpeDiaria.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if contDet > 1 then
  PrintBand:=True
  else PrintBand:=False;
end;

end.
