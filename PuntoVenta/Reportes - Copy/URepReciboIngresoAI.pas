unit URepReciboIngresoAI;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckReciboIngresoAI = class(TQuickRep)
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
    QRDBText12: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
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
    QRLabel28: TQRLabel;
    ChildBand6: TQRChildBand;
    QRLabel30: TQRLabel;
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
    QRDBText20: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRImage1: TQRImage;
    QRLabel10: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel26Print(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
   valorNCF : String[19];
    xtipoVenta : String;
  end;

var
  qckReciboIngresoAI: TqckReciboIngresoAI;

implementation

uses UDatModConectar, UDatModIngresos, UDatModCompania, UGlobal;

{$R *.DFM}

procedure TqckReciboIngresoAI.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckReciboIngresoAI.AllDataSets.Add(dmcompania.tblCompania);
  qckReciboIngresoAI.AllDataSets.Add(dmIngresos.qryRepIngMaster);
  if Length(GlbLogoServSam) > 0 then
  begin
    if FileExists(GlbLogoServSam) then
    QRImage1.Picture.LoadFromFile(GlbLogoServSam);
  end;
end;

procedure TqckReciboIngresoAI.QRLabel26Print(sender: TObject;
  var Value: String);
begin
  If dmIngresos.qryRepIngMasterOBSERVACION.IsNull then
  Value:='';
end;

procedure TqckReciboIngresoAI.QRLabel6Print(sender: TObject;
  var Value: String);
begin
  PAbrirtablaMoneda('2',dmIngresos.qryRepIngMasterFECHA.Value);
  Value:=InsertarComa(FloatToStrF(GlbMontoTasa('1'),ffCurrency, 5, 2));
end;

procedure TqckReciboIngresoAI.QRLabel10Print(sender: TObject;
  var Value: String);
begin
  if not dmCompania.tblCompaniaWEBSITE.IsNull then
  Value:=LowerCase(dmCompania.tblCompaniaWEBSITE.Value) +
  ' '+LowerCase(Value);
end;

procedure TqckReciboIngresoAI.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  xGrafico : String;
begin
  if (GLBSAM = 0) then
  begin
    if dmCompania.tblCompania.Locate('codigo', GlbCodigoCia,[]) then
    if FileExists(dmCompania.tblCompaniaLOGOCIA.Value) then
    if (Length(dmCompania.tblCompaniaLOGOCIA.Value) > 0) then
       QRImage1.Picture.LoadFromFile(dmCompania.tblCompaniaLOGOCIA.Value)
    else
    begin
      xGrafico:=FileToUse('Grafico','Logo.jpg');
      if (xGrafico <> '') then
      QRImage1.Picture.LoadFromFile(xGrafico);
    end;
    QRLabel10.Caption:='';
    QRLabel10.Enabled:=False;
  end;   
end;

end.
