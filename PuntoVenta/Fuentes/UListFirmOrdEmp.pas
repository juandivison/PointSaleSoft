unit UListFirmOrdEmp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqckListFirmOrdComp = class(TQuickRep)
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    QRBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText30: TQRDBText;
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRLabel9Print(sender: TObject; var Value: String);
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRDBText30Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckListFirmOrdComp: TqckListFirmOrdComp;

implementation
uses UDatmodDatosGenerales;
{$R *.DFM}

procedure TqckListFirmOrdComp.QRExpr1Print(sender: TObject;
  var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckListFirmOrdComp.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckListFirmOrdComp.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckListFirmOrdComp.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckListFirmOrdComp.QRLabel9Print(sender: TObject;
  var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckListFirmOrdComp.QRLabel13Print(sender: TObject;
  var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckListFirmOrdComp.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckListFirmOrdComp.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  Value:=TrimRight(Value);
end;

procedure TqckListFirmOrdComp.QRDBText30Print(sender: TObject;
  var Value: String);
begin
   Value:='Empleados '+Value;
end;

procedure TqckListFirmOrdComp.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  Value:='Fecha: '+Value;
end;

end.
