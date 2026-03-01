unit UQckRepOrdenAlmacen;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  DB, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepOrdenAlmacen = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel29: TQRLabel;
    QRDBText5: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText14: TQRDBText;
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qckRepOrdenAlmacen: TqckRepOrdenAlmacen;

implementation

uses UDatosVentas, UDatModFactura, UDatmodDatosGenerales;

{$R *.DFM}

procedure TqckRepOrdenAlmacen.SummaryBand1BeforePrint(
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

procedure TqckRepOrdenAlmacen.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  //dmFactura.qryVentaFacturaDet.Params[0].Value
end;

end.
