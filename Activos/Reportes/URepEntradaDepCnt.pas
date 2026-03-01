unit URepEntradaDepCnt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqckRepDepAcntDet = class(TQuickRep)
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
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr7: TQRExpr;
    QRDBText1: TQRDBText;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel13: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    procedure qrFechaPrint(sender: TObject; var Value: String);
    procedure qrNoPaginaPrint(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qckRepDepAcntDet: TqckRepDepAcntDet;

implementation
uses UDatModuloActivos, UglobalActivos;
{$R *.DFM}

procedure TqckRepDepAcntDet.qrFechaPrint(sender: TObject; var Value: String);
begin
  Value:=FormatDateTime('yyyy-mm-dd',glbfechainicial)+ ' a '+
  FormatDateTime('yyyy-mm-dd',glbfechaFinal);
end;

procedure TqckRepDepAcntDet.qrNoPaginaPrint(sender: TObject;
  var Value: String);
begin
  Value:='de '+InttoStr(glbTPag);
end;

procedure TqckRepDepAcntDet.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckRepDepAcntDet.AllDataSets.Add(dm.tblCompania);
end;

end.
