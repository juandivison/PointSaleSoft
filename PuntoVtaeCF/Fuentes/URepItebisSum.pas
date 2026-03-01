unit URepItebisSum;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, QRExport;

type
  TqckRepItbisSum = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRSysData3: TQRSysData;
    qrTpaginas: TQRLabel;
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
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText7: TQRDBText;
    QRExpr4: TQRExpr;
    QRLabel12: TQRLabel;
    QRExpr3: TQRExpr;
    QRExcelFilter1: TQRExcelFilter;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr5: TQRExpr;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel14: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel15: TQRLabel;
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRLabel9Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure SummaryBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRDBText2Print(sender: TObject; var Value: String);
  private

  public
    strmoneda : string;
  end;

var
  qckRepItbisSum: TqckRepItbisSum;

implementation
uses UDatModCompania, uglobal, UDatModFactura;

{$R *.DFM}

procedure TqckRepItbisSum.QRDBText3Print(sender: TObject; var Value: String);
begin
 // if dmFactura.qryRepItbisrnc_numero.IsNull then
 // Value:= dmFactura.qryRepItbiscedula.Value;
end;

procedure TqckRepItbisSum.QRLabel6Print(sender: TObject; var Value: String);
begin
  Value:= '';
  Value:= 'De '+ FormatDateTime('dd-mmm-yy',ExtraerFecha(dmfactura.qryRepNCFSum.Params[0].Value))+
          ' a ' + FormatDateTime('dd-mmm-yy',ExtraerFecha(dmfactura.qryRepNCFSum.Params[1].Value));
end;

procedure TqckRepItbisSum.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepItbisSum.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRepItbisSum.QRDBText4Print(sender: TObject; var Value: String);
begin
  if (Value = '') then
  Value:='*** Cliente Contado ***';
end;

procedure TqckRepItbisSum.QRLabel9Print(sender: TObject; var Value: String);
begin
  Value:=Value + strmoneda;               
end;

procedure TqckRepItbisSum.QRExpr3Print(sender: TObject; var Value: String);
begin
  //Value:=SimboloMoneda(dmFactura.qryRepItbis.params[2].Value)+Value;
end;

procedure TqckRepItbisSum.QRExpr2Print(sender: TObject; var Value: String);
begin
  //Value:=SimboloMoneda(dmFactura.qryRepItbis.params[2].Value)+Value;
end;

procedure TqckRepItbisSum.QRExpr1Print(sender: TObject; var Value: String);
begin
  //Value:=SimboloMoneda(dmFactura.qryRepItbis.params[2].Value)+Value;
end;

procedure TqckRepItbisSum.SummaryBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  QRLabel15.Caption:= 'Montos en '+SimboloMoneda(dmfactura.qryRepNCFSum.params[2].Value);
end;

procedure TqckRepItbisSum.QRDBText2Print(sender: TObject; var Value: String);
begin
  if (value = '0.00') then value:='';
end;

end.
