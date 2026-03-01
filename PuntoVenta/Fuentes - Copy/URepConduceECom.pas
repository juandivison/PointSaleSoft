unit URepConduceECom;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepConduceECom = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel9: TQRLabel;
    ChildBand3: TQRChildBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    SummaryBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    PageFooterBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel19: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRDBText27: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText8: TQRDBText;
    ChildBand4: TQRChildBand;
    ChildBand5: TQRChildBand;
    QRMemo1: TQRMemo;
    TitleBand1: TQRBand;
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qckRepConduceECom: TqckRepConduceECom;

implementation
  uses UDatModCompania, UDatModClientes, UGlobal, UDatmodDatosGenerales,
  UDatModReportes;
{$R *.DFM}

procedure TqckRepConduceECom.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  if not dmDatos.qryMembreteLinea3.IsNull then
  Value:=Value +','+dmDatos.qryMembreteLinea3.Value;
end;

procedure TqckRepConduceECom.QRDBText18Print(sender: TObject;
  var Value: String);
begin
  if not dmDatos.qryMembreteLinea5.IsNull then
  Value:=Value +'        '+dmDatos.qryMembreteLinea5.Value;
end;

procedure TqckRepConduceECom.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  dmDatos.qryMembrete.Close;
  dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
  dmDatos.qryMembrete.Open;
  qckRepConduceECom.AllDataSets.Add(dmDatos.qryMembrete);
  qckRepConduceECom.AllDataSets.Add(dmReportes.qryViewVentasDet);
end;

end.
