unit URepReciboIngGenPOS;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  db, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckReciboIngresoGenPOS = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRExpr4: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    ChildBand1: TQRChildBand;
    qrLabelReimprimir: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel16: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel1: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel3: TQRLabel;
    ChildBand3: TQRChildBand;
    ChildBand4: TQRChildBand;
    QRLabel31: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    ChildBand5: TQRChildBand;
    QRLabel28: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText5Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckReciboIngresoGenPOS: TqckReciboIngresoGenPOS;

implementation
uses UDatModConectar, UDatModIngresos, UDatModCompania, UGlobal;

{$R *.DFM}

procedure TqckReciboIngresoGenPOS.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  Value:=dmIngresos.qryRepIngMasterCODIGO_CTE.AsString+')'+Value;
end;

procedure TqckReciboIngresoGenPOS.QRLabel4Print(sender: TObject;
  var Value: String);
begin
  if not dmIngresos.qryRepIngMasterOBSERVACION.IsNull then
  Value:='Observación: '+dmIngresos.qryRepIngMasterOBSERVACION.Value
  else
  ChildBand3.Height:=0;
end;

procedure TqckReciboIngresoGenPOS.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if dmcompania.tblCompania.State = dsInactive then
  dmcompania.tblCompania.Open;
  qckReciboIngresoGenPOS.AllDataSets.Add(dmcompania.tblCompania);
end;

procedure TqckReciboIngresoGenPOS.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  Value:='Usr:'+Value;
end;

end.
