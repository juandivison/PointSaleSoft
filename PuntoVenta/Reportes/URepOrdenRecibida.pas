unit URepOrdenRecibida;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepOrdenRecibida = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    ChildBand1: TQRChildBand;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    ChildBand2: TQRChildBand;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    qrLabelCriterioDatos: TQRLabel;
    QRBand2: TQRBand;
    QRLabel19: TQRLabel;
    QRExpr1: TQRExpr;
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QRSysData2Print(sender: TObject; var Value: String);
    procedure QRDBText17Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepOrdenRecibida: TqckRepOrdenRecibida;
  CantDet : Integer;
implementation
   uses UDatModReportes;
{$R *.DFM}

procedure TqckRepOrdenRecibida.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  Inc(CantDet);
end;

procedure TqckRepOrdenRecibida.QRLabel19Print(sender: TObject;
  var Value: String);
begin
  Value:='Cantidad de Articulos : '+IntToStr(CantDet);
  CantDet:=0;
end;

procedure TqckRepOrdenRecibida.QRSysData2Print(sender: TObject;
  var Value: String);
begin
  Value:= Value + ' de ';
end;

procedure TqckRepOrdenRecibida.QRDBText17Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0') Or (Value = '0.00') then Value := '';
end;

end.
