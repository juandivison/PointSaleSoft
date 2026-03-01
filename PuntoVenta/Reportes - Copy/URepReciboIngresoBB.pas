unit URepReciboIngresoBB;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckReciboIngresoBB = class(TQuickRep)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    qrLabelReimprimir: TQRLabel;
    ChildBand2: TQRChildBand;
    QRBand3: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText8: TQRDBText;
    QRBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel25: TQRLabel;
    ChildBand4: TQRChildBand;
    QRLabel12: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText16: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr1: TQRExpr;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText21: TQRDBText;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel1: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel28: TQRLabel;
    QRDBText19: TQRDBText;
    QRExpr4: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    ChildBand3: TQRChildBand;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel26Print(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
  private

  public
   valorNCF : String[19];
    xtipoVenta : String;
  end;

var
  qckReciboIngresoBB: TqckReciboIngresoBB;

implementation

uses UDatModConectar, UDatModIngresos, UDatModCompania, UGlobal;

{$R *.DFM}

procedure TqckReciboIngresoBB.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckReciboIngresoByM.AllDataSets.Add(dmcompania.tblCompania);
  qckReciboIngresoByM.AllDataSets.Add(dmIngresos.qryRepIngMaster);
  //qckReciboIngresoByM.AllDataSets.Add(dmIngresos.qryFactura);
end;

procedure TqckReciboIngresoBB.QRLabel26Print(sender: TObject;
  var Value: String);
begin
  If dmIngresos.qryRepIngMasterOBSERVACION.IsNull then
  Value:='';
end;

procedure TqckReciboIngresoBB.QRLabel6Print(sender: TObject;
  var Value: String);
begin
  PAbrirtablaMoneda('2',dmIngresos.qryRepIngMasterFECHA.Value);
  Value:=InsertarComa(FloatToStrF(GlbMontoTasa('1'),ffCurrency, 5, 2));
end;

procedure TqckReciboIngresoBB.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + '-'+ dmIngresos.qryRepIngMasterCODIGO_CTE.AsString;
end;

end.
