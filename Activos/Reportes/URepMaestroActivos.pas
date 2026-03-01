unit URepMaestroActivos;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqckMaestroActivos = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrNoPagina: TQRLabel;
    QRBand2: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrtotalacumulado: TQRLabel;
    QRLabel19: TQRLabel;
    qrtotalacum: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel12: TQRLabel;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRExpr3: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText14: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRBand5: TQRBand;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    procedure qrNoPaginaPrint(sender: TObject; var Value: String);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qckMaestroActivos: TqckMaestroActivos;

implementation
uses UDatModuloActivos, UglobalActivos;
{$R *.DFM}

procedure TqckMaestroActivos.qrNoPaginaPrint(sender: TObject;
  var Value: String);
begin
  Value:='de '+InttoStr(glbTPag);
end;

procedure TqckMaestroActivos.QRLabel4Print(sender: TObject;
  var Value: String);
begin
  Value:=Value +FormatDateTime('dd "de" mmm "de" yyyy',dm.qryMaestroActivosFECHA_ULT_ACT.Value);
end;

procedure TqckMaestroActivos.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then value := '';
end;

procedure TqckMaestroActivos.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qckMaestroActivos.AllDataSets.Add(dm.tblCompania);
end;

end.
