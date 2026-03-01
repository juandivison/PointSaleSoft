unit URepReciboIngresoByM;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckReciboIngresoByM = class(TQuickRep)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel2: TQRLabel;
    QRDBText14: TQRDBText;
    qrLabelReimprimir: TQRLabel;
    ChildBand2: TQRChildBand;
    QRBand3: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr4: TQRExpr;
    QRDBText2: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel25: TQRLabel;
    ChildBand4: TQRChildBand;
    QRLabel12: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText11: TQRDBText;
    ChildBand5: TQRChildBand;
    QRLabel9: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel28: TQRLabel;
    ChildBand6: TQRChildBand;
    QRLabel31: TQRLabel;
    QRDBText16: TQRDBText;
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
    QRDBText10: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr3: TQRExpr;
    QRDBText12: TQRDBText;
    QRExpr1: TQRExpr;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel26Print(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
  private

  public
   valorNCF : String;
    xtipoVenta : String;
  end;

var
  qckReciboIngresoByM: TqckReciboIngresoByM;

implementation

uses UDatModConectar, UDatModIngresos, UDatModCompania, UGlobal;

{$R *.DFM}

procedure TqckReciboIngresoByM.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckReciboIngresoByM.AllDataSets.Add(dmcompania.tblCompania);
  qckReciboIngresoByM.AllDataSets.Add(dmIngresos.qryRepIngMaster);
  //qckReciboIngresoByM.AllDataSets.Add(dmIngresos.qryFactura);
end;

procedure TqckReciboIngresoByM.QRLabel26Print(sender: TObject;
  var Value: String);
begin
  If dmIngresos.qryRepIngMasterOBSERVACION.IsNull then
  Value:='';
end;

procedure TqckReciboIngresoByM.QRLabel6Print(sender: TObject;
  var Value: String);
begin
  PAbrirtablaMoneda('2',dmIngresos.qryRepIngMasterFECHA.Value);
  Value:=InsertarComa(FloatToStrF(GlbMontoTasa('1'),ffCurrency, 5, 2));
end;

procedure TqckReciboIngresoByM.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + '-'+ dmIngresos.qryRepIngMasterCODIGO_CTE.AsString;
end;

end.
