unit URepItebisResumen;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, QRExport;

type
  TqckRepItbisResumen = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRSysData3: TQRSysData;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel16: TQRLabel;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText7: TQRDBText;
    QRExpr4: TQRExpr;
    QRLabel12: TQRLabel;
    QRExcelFilter1: TQRExcelFilter;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRExpr7: TQRExpr;
    QRDBText11: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr16: TQRExpr;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRBand2: TQRBand;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpr32: TQRExpr;
    QRShape4: TQRShape;
    QRExpr33: TQRExpr;
    QRExpr34: TQRExpr;
    QRGroup2: TQRGroup;
    QRDBText12: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRLabel9Print(sender: TObject; var Value: String);
    procedure SummaryBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRExpr12Print(sender: TObject; var Value: String);
    procedure QRExpr11Print(sender: TObject; var Value: String);
    procedure QRExpr10Print(sender: TObject; var Value: String);
    procedure QRExpr9Print(sender: TObject; var Value: String);
    procedure QRExpr8Print(sender: TObject; var Value: String);
    procedure QRExpr7Print(sender: TObject; var Value: String);
  private

  public
    strmoneda : string;
  end;

var
  qckRepItbisResumen: TqckRepItbisResumen;

implementation
uses UDatModCompania, uglobal, UDatModFactura;

{$R *.DFM}

procedure TqckRepItbisResumen.QRLabel6Print(sender: TObject; var Value: String);
begin
  Value:= '';
  Value:= 'De '+ FormatDateTime('dd-mmm-yy', ExtraerFecha(dmfactura.qryRepItbis.Params[0].Value))+
          ' a ' + FormatDateTime('dd-mmm-yy', ExtraerFecha(dmfactura.qryRepItbis.Params[1].Value));
end;

procedure TqckRepItbisResumen.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepItbisResumen.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepItbisResumen.QRDBText4Print(sender: TObject; var Value: String);
begin
  if (Value = '') then
  Value:='*** Cliente Contado ***';
end;

procedure TqckRepItbisResumen.QRLabel9Print(sender: TObject; var Value: String);
begin
  Value:=Value + strmoneda;               
end;

procedure TqckRepItbisResumen.SummaryBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  //QRLabel15.Caption:= 'Montos en ' + SimboloMoneda(dmFactura.qryRepItbis.Params[2].Value);
end;

procedure TqckRepItbisResumen.QRDBText2Print(sender: TObject; var Value: String);
begin
  if (Value = '0.00') then Value:='';
end;

procedure TqckRepItbisResumen.QRExpr12Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value:='';
end;

procedure TqckRepItbisResumen.QRExpr11Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value:='';
end;

procedure TqckRepItbisResumen.QRExpr10Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value:='';
end;

procedure TqckRepItbisResumen.QRExpr9Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value:='';
end;

procedure TqckRepItbisResumen.QRExpr8Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value:='';
end;

procedure TqckRepItbisResumen.QRExpr7Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0.00') then Value:='';
end;

end.
