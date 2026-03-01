unit URepReciboIngresoAIFarmacia;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckReciboIngresoAIFarmacia = class(TQuickRep)
    QRBand4: TQRBand;
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
    QRDBText1: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText31: TQRDBText;
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
  qckReciboIngresoAIFarmacia: TqckReciboIngresoAIFarmacia;

implementation

uses UDatModConectar, UDatModClientes, UDatModIngresos, UDatModCompania, UGlobal,
  UDatmodDatosGenerales;

{$R *.DFM}

procedure TqckReciboIngresoAIFarmacia.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckReciboIngresoAIFarmacia.AllDataSets.Add(dmcompania.tblCompania);
  qckReciboIngresoAIFarmacia.AllDataSets.Add(dmIngresos.qryRepIngMaster);
    qckReciboIngresoAIFarmacia.AllDataSets.Add(dmDatos.qryMembrete);
  if Length(GlbLogoServSam) > 0 then
  begin
    if FileExists(GlbLogoServSam) then
    QRImage1.Picture.LoadFromFile(GlbLogoServSam);
  end;
end;

procedure TqckReciboIngresoAIFarmacia.QRLabel26Print(sender: TObject;
  var Value: String);
begin
  If dmIngresos.qryRepIngMasterOBSERVACION.IsNull then
  Value:='';
end;

procedure TqckReciboIngresoAIFarmacia.QRLabel6Print(sender: TObject;
  var Value: String);
begin
  PAbrirtablaMoneda('2',dmIngresos.qryRepIngMasterFECHA.Value);
  Value:=InsertarComa(FloatToStrF(GlbMontoTasa('1'),ffCurrency, 5, 2));
end;

procedure TqckReciboIngresoAIFarmacia.QRLabel10Print(sender: TObject;
  var Value: String);
begin
  if not dmCompania.tblCompaniaWEBSITE.IsNull then
  Value:=LowerCase(dmCompania.tblCompaniaWEBSITE.Value) +
  ' '+LowerCase(Value);
end;

procedure TqckReciboIngresoAIFarmacia.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  xGrafico : String;
begin                //if (GlbFarmacia = 1) and (GlbFact55Pulg = 1) then
  if (GLBSAM = 0) or (GlbFarmacia = 1) then
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
    //QRLabel10.Caption:='';
    //QRLabel10.Enabled:=False;
  end;   
end;

end.
