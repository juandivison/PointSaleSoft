unit URepReciboIngGen;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckReciboIngresoGen = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel2: TQRLabel;
    qrLabelReimprimir: TQRLabel;
    QRExpr4: TQRExpr;
    QRDBText2: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel6: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel12: TQRLabel;
    QRDBText15: TQRDBText;
    ChildBand2: TQRChildBand;
    ChildBand3: TQRChildBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText20: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    ChildBand4: TQRChildBand;
    QRLabel8: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText16: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
  private

  public
    valorNCF : String[19];
    xtipoVenta : String;
  end;

var
  qckReciboIngresoGen: TqckReciboIngresoGen;

implementation
uses UDatModConectar, UDatModIngresos, UDatModCompania, UGlobal;
{$R *.DFM}

procedure TqckReciboIngresoGen.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckReciboIngresoGen.AllDataSets.Add(dmcompania.tblCompania);
end;

procedure TqckReciboIngresoGen.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  If dmIngresos.qryRepIngMasterOBSERVACION.IsNull and
     dmIngresos.qryRepIngMasterCONCEPTO.IsNull then
  Value:='';
end;

procedure TqckReciboIngresoGen.QRDBText15Print(sender: TObject;
  var Value: String);
begin
  if not dmIngresos.qryRepIngMasterOBSERVACION.IsNull then
  Value:=Value + '/'+dmIngresos.qryRepIngMasterOBSERVACION.Value;
end;

procedure TqckReciboIngresoGen.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  Value:=dmIngresos.qryRepIngMasterCODIGO_CTE.AsString+')'+Value;
end;

procedure TqckReciboIngresoGen.QRLabel6Print(sender: TObject;
  var Value: String);
begin
  PAbrirtablaMoneda('2',dmIngresos.qryRepIngMasterFECHA.Value);
  Value:=InsertarComa(FloatToStrF(GlbMontoTasa('1'),ffCurrency, 5, 2));
end;

end.
