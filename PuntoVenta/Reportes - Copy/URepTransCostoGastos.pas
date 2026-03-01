unit URepTransCostoGastos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckTransCostosGastos = class(TQuickRep)
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
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    ChildBand1: TQRChildBand;
    QRLabel13: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRGroup2: TQRGroup;
    QRDBText5: TQRDBText;
    QRBand5: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel6: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel1: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckTransCostosGastos: TqckTransCostosGastos;
  contDet : integer;

implementation

uses UDatModReportes;

{$R *.DFM}

procedure TqckTransCostosGastos.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('dd/mmm/yy',dmReportes.qryRepTransOpeDiaria.Params[0].Value) +
         ' al ' + FormatDateTime('dd/mmm/yy',dmReportes.qryRepTransOpeDiaria.Params[1].Value);
end;

procedure TqckTransCostosGastos.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  contDet:=0;
end;

procedure TqckTransCostosGastos.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  contDet:=contDet + 1;
end;

procedure TqckTransCostosGastos.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if contDet > 1 then
  PrintBand:=True
  else PrintBand:=False;
end;

procedure TqckTransCostosGastos.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  Value:=dmReportes.qryRepTransOpeDiariaIDTIPO_COMPRA.AsString+
  ')'+Value;
end;

procedure TqckTransCostosGastos.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRMemo1.Lines.Clear;
  QRMemo1.Lines.Add('Forma Pago');
  QRMemo1.Lines.Add('01-Efectivo, 02-CHEQUE/TRANSFERENCIAS/DEPOSITO');
  QRMemo1.Lines.Add('03-TARJETA CREDITO/DEBITO, 04-COMPRA A CREDITO');
  QRMemo1.Lines.Add('05-PERMUTA, 06-NOTA DE CREDITO, 07-MIXTO');
end;

procedure TqckTransCostosGastos.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  Value:= '0'+Value;
end;

procedure TqckTransCostosGastos.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  Value:='RNC-'+Value;
end;

end.
