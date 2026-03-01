unit UREpListadoOrdenesCompraRes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckListadoOrdenesCompraRes = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText14: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRGroup3: TQRGroup;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText15: TQRDBText;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel18Print(sender: TObject; var Value: String);
    procedure QRLabel17Print(sender: TObject; var Value: String);
  private

  public
    labelCretrioRep : string;
  end;

var
  qckListadoOrdenesCompraRes: TqckListadoOrdenesCompraRes;

implementation
uses UDatModCompania, uglobal, UDatModReportes;
{$R *.DFM}

procedure TqckListadoOrdenesCompraRes.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmreportes.qryReporteOrdenesCompCODIGO_EMPLEADO.Value = 0) then
  QRLabel12.caption:='Usuario No Asignado' else
  begin
  if not dmreportes.qryReporteOrdenesCompOrdenCreadaPor.IsNull then
  QRLabel12.caption:='Creada Por:'+dmreportes.qryReporteOrdenesCompOrdenCreadaPor.Value;

  if not dmreportes.qryReporteOrdenesCompOrdenRecibidaPor.IsNull then
  QRLabel12.caption:=' :: Recibida Por:'+dmreportes.qryReporteOrdenesCompOrdenRecibidaPor.Value+
  ' :: En Fecha : '+ FormatDateTime('dd/mm/yyyy', dmreportes.qryReporteOrdenesCompFECHA_RECIBIDA.Value);
  end;
end;

procedure TqckListadoOrdenesCompraRes.QRLabel18Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + dmReportes.qryReporteOrdenesCompNUM_ORDEN.AsString;
end;

procedure TqckListadoOrdenesCompraRes.QRLabel17Print(sender: TObject;
  var Value: String);
begin
  if (labelCretrioRep = '') then
  Value:='' else 
  Value:=labelCretrioRep; 
end;

end.
