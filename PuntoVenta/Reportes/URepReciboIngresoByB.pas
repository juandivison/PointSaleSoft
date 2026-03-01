unit URepReciboIngresoByB;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckReciboIngresoByB = class(TQuickRep)
    QRBand4: TQRBand;
    ChildBand2: TQRChildBand;
    QRBand3: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand1: TQRBand;
    QRLabel25: TQRLabel;
    ChildBand4: TQRChildBand;
    ChildBand5: TQRChildBand;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel28: TQRLabel;
    ChildBand6: TQRChildBand;
    QRLabel31: TQRLabel;
    QRDBText19: TQRDBText;
    ChildBand7: TQRChildBand;
    QRLabel8: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText9: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr3: TQRExpr;
    QRDBText12: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    qrLabelReimprimir: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText21: TQRDBText;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRDBText18: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
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
  qckReciboIngresoByB: TqckReciboIngresoByB;

implementation

uses UDatModConectar, UDatModIngresos, UDatModCompania, UGlobal;

{$R *.DFM}

procedure TqckReciboIngresoByB.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckReciboIngresoByB.AllDataSets.Add(dmcompania.tblCompania);
  qckReciboIngresoByB.AllDataSets.Add(dmIngresos.qryRepIngMaster);
  //qckReciboIngresoByM.AllDataSets.Add(dmIngresos.qryFactura);
end;

procedure TqckReciboIngresoByB.QRLabel26Print(sender: TObject;
  var Value: String);
begin
  If dmIngresos.qryRepIngMasterOBSERVACION.IsNull then
  Value:='';
end;

procedure TqckReciboIngresoByB.QRLabel6Print(sender: TObject;
  var Value: String);
begin
  PAbrirtablaMoneda('2',dmIngresos.qryRepIngMasterFECHA.Value);
  Value:=InsertarComa(FloatToStrF(GlbMontoTasa('1'),ffCurrency, 5, 2));
end;

procedure TqckReciboIngresoByB.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + '-'+ dmIngresos.qryRepIngMasterCODIGO_CTE.AsString;
end;

end.
