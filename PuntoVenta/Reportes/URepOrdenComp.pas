unit URepOrdenComp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, ATexto;

type
  TqckOrdenComp = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand4: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel14: TQRLabel;
    QRShape6: TQRShape;
    QRLabel17: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel4: TQRLabel;
    DineroEnLetras: TLetras;
    qrLabelMontoLetras: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRBand3: TQRBand;
    QRLabel6: TQRLabel;
    qrFirmas: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText30: TQRDBText;
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure QRLabel11Print(sender: TObject; var Value: String);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure QRLabel9Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRLabel8Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure qrLabelMontoLetrasPrint(sender: TObject; var Value: String);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel5Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRLabel15Print(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qckOrdenCompBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrFirmasPrint(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText30Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckOrdenComp: TqckOrdenComp;

implementation
uses UDatmodDatosGenerales;
{$R *.DFM}

procedure TqckOrdenComp.QRLabel13Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRLabel11Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRLabel10Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRLabel9Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRExpr1Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRDBText3Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRDBText4Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRLabel8Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRLabel2Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRLabel1Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRLabel3Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRLabel12Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRDBText6Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRDBText2Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.qrLabelMontoLetrasPrint(sender: TObject;
  var Value: String);
begin
  Value :='***'+UpperCase(Value)+'***';
end;

procedure TqckOrdenComp.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  DineroEnLetras.Numero :=dmDatos.qryOrdenEmpMONTO.Value;
  qrLabelMontoLetras.Caption:=DineroEnLetras.AsString;
end;

procedure TqckOrdenComp.QRLabel5Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRDBText7Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRLabel15Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRLabel6Print(sender: TObject; var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckOrdenComp.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if BandPrinted then
  begin
    dmDatos.qryOrdenEmp.edit;
    dmDatos.qryordenempstatus.value := 'P';
    dmDatos.qryOrdenEmp.Post;
    dmDatos.qryOrdenEmp.ApplyUpdates;
  end;
end;

procedure TqckOrdenComp.qckOrdenCompBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckOrdenComp.AllDataSets.Add(dmdatos.qryRepOrdCFirm);
end;

procedure TqckOrdenComp.qrFirmasPrint(sender: TObject; var Value: String);
var
  firmas:String;
begin
  dmdatos.qryRepOrdCFirm.first;
  firmas:='';
  While Not dmdatos.qryRepOrdCFirm.eof do
  begin
    firmas:=firmas + dmdatos.qryRepOrdCFirmNOMBRE.Value+'        ';
    dmdatos.qryRepOrdCFirm.Next;
  end;
  Value:=firmas;
end;

procedure TqckOrdenComp.QRDBText8Print(sender: TObject; var Value: String);
begin
  if UpperCase(Value) = 'NO APLICA' then
  Value := '' else Value:='Válido para :'+value+'***';
end;

procedure TqckOrdenComp.QRDBText30Print(sender: TObject;
  var Value: String);
begin
  Value:='Empleados '+Value;
end;

end.
