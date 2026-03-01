unit URepPlanesCte;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckPlanesXCliente = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    qrtipoVenta: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText19: TQRDBText;
    QRImage1: TQRImage;
    QRDBText11: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText20: TQRDBText;
    QRExpr1: TQRExpr;
    QRBand3: TQRBand;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape4: TQRShape;
    QRGroup1: TQRGroup;
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText18Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckPlanesXCliente: TqckPlanesXCliente;

implementation
Uses UDatmodDatosGenerales, uglobal;
{$R *.DFM}

procedure TqckPlanesXCliente.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if (dmDatos.qryPlanRepMasterCEDULA.IsNull) then
  Value:=dmDatos.qryPlanRepMasterRNC_NUMERO.Value else
  Value:=dmDatos.qryPlanRepMasterCEDULA.Value;
end;

procedure TqckPlanesXCliente.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  xGrafico : String;
begin
  xGrafico:=FileToUse('Grafico','Logof.jpg');
  if (xGrafico <> '') then
  QRImage1.Picture.LoadFromFile(xGrafico);
end;

procedure TqckPlanesXCliente.QRDBText18Print(sender: TObject;
  var Value: String);
  var
    i : Integer;
begin
  if (Value = '30-Dec-1899') then
  Value:='';
end;

end.
