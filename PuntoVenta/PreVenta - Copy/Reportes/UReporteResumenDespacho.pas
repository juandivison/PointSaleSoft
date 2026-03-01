unit UReporteResumenDespacho;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckResumenDespacho = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRTARIFA: TQRLabel;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand5: TQRBand;
    QRExpr3: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRLabel10Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckResumenDespacho: TqckResumenDespacho;

implementation

uses UDatModReportes;

{$R *.DFM}

procedure TqckResumenDespacho.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,dmReportes.qryResumenDespacho.Params[0].Value)+' al '+FormatDatetime(Shortdateformat,dmReportes.qryResumenDespacho.Params[1].Value);
end;

procedure TqckResumenDespacho.QRLabel10Print(sender: TObject;
  var Value: String);
begin
  if dmreportes.qryResumenDespacho.FieldByName('tipo_tranf').Value = 1 then
  Value:='Entrada' else
  if dmreportes.qryResumenDespacho.FieldByName('tipo_tranf').Value = 2 then
  Value:='Salida' else
  if dmreportes.qryResumenDespacho.FieldByName('tipo_tranf').Value = 3 then
  Value:='Devolucion';
end;

end.
