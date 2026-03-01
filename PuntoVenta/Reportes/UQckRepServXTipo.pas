unit UQckRepServXTipo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckListaServtXTipo = class(TQuickRep)
    QRBand1: TQRBand;
    qrtipoVenta: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel14: TQRLabel;
    qrLabelCriterioDatos: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText4: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText3: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRExpr5: TQRExpr;
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr8: TQRExpr;
    QRGroup2: TQRGroup;
    ChildBand2: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand4: TQRBand;
    QRExpr11: TQRExpr;
    QRLabel15: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRBand3: TQRBand;
    QRExpr7: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public

  end;

var
  qckListaServtXTipo: TqckListaServtXTipo;
  contCte : integer;

implementation

uses UDatModReportes, uGlobal, UFormConsServXTipo;

{$R *.DFM}

procedure TqckListaServtXTipo.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  Value:='TIPO: ' + Value;
end;

procedure TqckListaServtXTipo.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  contCte:=0;
end;

procedure TqckListaServtXTipo.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if contCte > 1 then
  PrintBand:=true else printband := false;
end;

procedure TqckListaServtXTipo.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  contCte:=contCte + 1;
end;

procedure TqckListaServtXTipo.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  contCte:=0;
end;

end.
