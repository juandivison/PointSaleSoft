unit UQckRepOrdenAlmacenPOS;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  DB, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepOrdenAlmacenPOS = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRLabel5: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    SummaryBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel29: TQRLabel;
    ChildBand2: TQRChildBand;
    ChildBand3: TQRChildBand;
    ChildBand4: TQRChildBand;
    QRLabel23: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape1: TQRShape;
    QRLabel17: TQRLabel;
    QRShape2: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    ChildBand5: TQRChildBand;
    QRDBText10: TQRDBText;
    ChildBand6: TQRChildBand;
    QRDBText11: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText13: TQRDBText;
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSysData1Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRDBText9Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepOrdenAlmacenPOS: TqckRepOrdenAlmacenPOS;
  tRec:integer;

implementation
uses UGlobal, UDatosVentas, UDatModFactura, UDatmodDatosGenerales;

{$R *.DFM}

procedure TqckRepOrdenAlmacenPOS.SummaryBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
 var
    svalue : string;
begin
try
  if (dmfactura.qrySumCantXTUnidad.State = dsInactive) then
  begin
    dmfactura.qrySumCantXTUnidad.Close;
    dmfactura.qrySumCantXTUnidad.Params[0].Value :=dmVentas.qryRepOrdenConduceNUM_TRN.Value;
    dmfactura.qrySumCantXTUnidad.Open;
  end;
  dmfactura.qrySumCantXTUnidad.First;
  QRLabel29.Caption:='';
  While Not dmfactura.qrySumCantXTUnidad.Eof Do
  begin
    svalue := svalue + dmfactura.qrySumCantXTUnidadBultos.AsString +':'+
    dmfactura.qrySumCantXTUnidadCANT.AsString+' ';
    dmfactura.qrySumCantXTUnidad.Next;
  end;
  //if (svalue = '') then
  //ChildBand4.Height:=34
  //else
  QRLabel29.Caption:='Bultos:'+svalue;
  except
  end;
end;

procedure TqckRepOrdenAlmacenPOS.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrprinter.PageNumber > 1 then
  PrintBand:=False;
end;

procedure TqckRepOrdenAlmacenPOS.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrprinter.PageNumber > 1 then
  PrintBand:=False;
end;

procedure TqckRepOrdenAlmacenPOS.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qrprinter.PageNumber > 1 then
  PrintBand:=False;
end;

procedure TqckRepOrdenAlmacenPOS.QRSysData1Print(sender: TObject;
  var Value: String);
begin
  Value:='Total Items: '+InttoStr(tRec);
end;

procedure TqckRepOrdenAlmacenPOS.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  tRec:=0;
end;

procedure TqckRepOrdenAlmacenPOS.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  Inc(tRec);
end;

procedure TqckRepOrdenAlmacenPOS.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  Value:=dmVentas.qryRepOrdenConduceCOD_CLIENTE.AsString + '-' + Value;
end;

end.
