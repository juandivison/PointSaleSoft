unit UREpListadoOrdenesCompra;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckListadoOrdenesCompra = class(TQuickRep)
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
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText13: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText14: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText15: TQRDBText;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRGroup3: TQRGroup;
    QRBand4: TQRBand;
    QRLabel18: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText16: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel18Print(sender: TObject; var Value: String);
    procedure QRLabel17Print(sender: TObject; var Value: String);
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private

  public
    labelCretrioRep : string;
  end;

var
  qckListadoOrdenesCompra: TqckListadoOrdenesCompra;

implementation
uses UDatModCompania, uglobal, UDatModReportes;
{$R *.DFM}

procedure TqckListadoOrdenesCompra.QRGroup2BeforePrint(Sender: TQRCustomBand;
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

procedure TqckListadoOrdenesCompra.QRLabel18Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + dmReportes.qryReporteOrdenesCompNUM_ORDEN.AsString;
end;

procedure TqckListadoOrdenesCompra.QRLabel17Print(sender: TObject;
  var Value: String);
begin
  if (labelCretrioRep = '') then
  Value:='' else
  Value:=labelCretrioRep;
end;

procedure TqckListadoOrdenesCompra.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value:=Value;
end;

end.
