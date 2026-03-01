unit URepRelVtasGastos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRelGastosVentas = class(TQuickRep)
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
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand5: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRelGastosVentas: TqckRelGastosVentas;
  contDet : integer;

implementation

uses UDatModReportes;

{$R *.DFM}

procedure TqckRelGastosVentas.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  if dmReportes.qryRepGastosVtas.Params.Count >= 2 then
  begin
    Value:=FormatDateTime('dd/mmm/yy',dmReportes.qryRepGastosVtas.Params[0].Value) +
         ' al ' + FormatDateTime('dd/mmm/yy',dmReportes.qryRepGastosVtas.Params[1].Value);
  end else Value:='';
end;

procedure TqckRelGastosVentas.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  contDet:=0;
end;

procedure TqckRelGastosVentas.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  contDet:=contDet + 1;
end;

procedure TqckRelGastosVentas.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if contDet > 1 then
  PrintBand:=True
  else PrintBand:=False;
end;

procedure TqckRelGastosVentas.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if dmReportes.qryRepGastosVtas.FieldByName('NUMERO_DOCUMENTO').IsNull  then
  Value:= dmReportes.qryRepGastosVtas.FieldByName('NUMERO_FACTURA').AsString
  else
  Value:= dmReportes.qryRepGastosVtas.FieldByName('NUMERO_DOCUMENTO').AsString;
end;

procedure TqckRelGastosVentas.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

end.
