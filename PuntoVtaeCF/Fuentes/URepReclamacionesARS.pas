unit URepReclamacionesARS;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepReclamacionesARS = class(TQuickRep)
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
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRBand1: TQRBand;
    QRLabel11: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    ChildBand2: TQRChildBand;
    QRLabel23: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRExpr4Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepReclamacionesARS: TqckRepReclamacionesARS;

implementation
  uses UGlobal, UFormConciliarARS;
{$R *.DFM}

procedure TqckRepReclamacionesARS.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepReclamacionesARS.AllDataSets.Add(frmConciliacionDeFctSeguro.qryVentaFactCoberturaArs);
  qckRepReclamacionesARS.AllDataSets.Add(frmConciliacionDeFctSeguro.qryVentaDet);
  qckRepReclamacionesARS.AllDataSets.Add(frmConciliacionDeFctSeguro.rxSolDatoscte);
end;

procedure TqckRepReclamacionesARS.QRExpr4Print(sender: TObject; var Value: String);
begin
  if (Value <> '') then
  Value:='RNC: '+Value;
end;

end.
