unit qckRepREMAComprobante;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRMAComprobante = class(TQuickRep)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    TPag: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel11: TQRLabel;
    QRImage1: TQRImage;
    QRBand3: TQRBand;
    QRBand6: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand5: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    ChildBand1: TQRChildBand;
    QRDBText8: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel16: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText12Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRMAComprobante: TqckRMAComprobante;

implementation

uses UDatModInventario, UDatModCompania, Uglobal;

{$R *.DFM}

procedure TqckRMAComprobante.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRMAComprobante.AllDataSets.Add(dmCompania.tblCompania);
end;

procedure TqckRMAComprobante.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  xGrafico : String;
begin
  //xGrafico:=FileToUse('Grafico','Logo.jpg');
  //if (xGrafico <> '') then
  //QRImage1.Picture.LoadFromFile(xGrafico);
  QRLabel2.Caption := FormatDateTime('dd-mmm-yyyy',
  ExtraerFecha(dmInventario.qryEquiposEnRMAFECHA.Value));
end;

procedure TqckRMAComprobante.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 if dmInventario.qryEquiposEnRMADESCRIPCIONPROBLEMA.IsNull then
 PrintBand := False else
 PrintBand := True;
end;

procedure TqckRMAComprobante.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  Value:='Observación: '+Value;
end;

end.
