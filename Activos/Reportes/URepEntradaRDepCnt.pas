unit URepEntradaRDepCnt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqckRepDepAcnt = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    qrFecha: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrNoPagina: TQRLabel;
    QRSysData2: TQRSysData;
    QRBand2: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr6: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    procedure qrFechaPrint(sender: TObject; var Value: String);
    procedure qrNoPaginaPrint(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qckRepDepAcnt: TqckRepDepAcnt;

implementation
uses UDatModuloActivos, UglobalActivos;
{$R *.DFM}

procedure TqckRepDepAcnt.qrFechaPrint(sender: TObject; var Value: String);
begin
  Value:=FormatDateTime('yyyy-mm-dd',glbfechainicial)+ ' a '+
  FormatDateTime('yyyy-mm-dd',glbfechaFinal);
end;

procedure TqckRepDepAcnt.qrNoPaginaPrint(sender: TObject;
  var Value: String);
begin
  Value:='de '+InttoStr(glbTPag);
end;

procedure TqckRepDepAcnt.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepDepAcnt.AllDataSets.Add(dm.tblCompania);
end;

end.
