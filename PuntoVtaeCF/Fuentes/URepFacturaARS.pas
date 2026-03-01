unit URepFacturaARS;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepFactARS = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBText14: TQRDBText;
    QRExpr1: TQRExpr;
    QRSysData3: TQRSysData;
    TPag: TQRLabel;
    QRSysData4: TQRSysData;
    qrtipoVenta: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand1: TQRBand;
    QRDBText18: TQRDBText;
    ChildBand2: TQRChildBand;
    QRLabel14: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr7: TQRExpr;
    ChildBand3: TQRChildBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    ChildBand1: TQRChildBand;
    QRLabel23: TQRLabel;
    QRExpr5: TQRExpr;
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepFactARS: TqckRepFactARS;

implementation
  uses UGlobal, UFormConciliarARS;
{$R *.DFM}

procedure TqckRepFactARS.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  Value:='Válida hasta:'+Value;
end;

procedure TqckRepFactARS.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckrepfactars.AllDataSets.Add(frmConciliacionDeFctSeguro.qryVentaFactCoberturaArs);
  qckrepfactars.AllDataSets.Add(frmConciliacionDeFctSeguro.qryVentaDet);
  qckrepfactars.AllDataSets.Add(frmConciliacionDeFctSeguro.rxSolDatoscte);
end;

procedure TqckRepFactARS.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if (Value <> '') then
  Value:= StrLeftPad(Value,5);
end;

procedure TqckRepFactARS.QRExpr4Print(sender: TObject; var Value: String);
begin
  if (Value <> '') then
  Value:='RNC: '+Value;
end;

end.
