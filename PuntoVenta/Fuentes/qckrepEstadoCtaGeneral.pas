unit qckrepEstadoCtaGeneral;

interface


uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  DB, MaskUtils, QuickRpt, QRCtrls, jpeg, StdCtrls, ExtCtrls, Forms;


type
  TqckEstadoCxcGeneral = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel30: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRSysData1: TQRSysData;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    qrLabelAviso: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel14: TQRLabel;
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qckEstadoCxcGeneral: TqckEstadoCxcGeneral;

implementation
uses UDatModCompania, UDatModClientes, UGlobal,
  UDatModReportes, UDatmodDatosGenerales;

{$R *.DFM}

procedure TqckEstadoCxcGeneral.QRLabel14Print(sender: TObject;
  var Value: String);
begin
  Value:='';
  if Not dmReportes.qryEstadoCxcBBTELEF_CONTACTO.IsNull then
     Value:=dmReportes.qryEstadoCxcBBTELEF_CONTACTO.Value;

  if Not dmReportes.qryEstadoCxcBBMOVIL1.IsNull then
  begin
    if (Value <> '') then
       Value:=Value + '/'+dmReportes.qryEstadoCxcBBMOVIL1.Value
    else
    Value:=dmReportes.qryEstadoCxcBBMOVIL1.Value;
  end;
end;

procedure TqckEstadoCxcGeneral.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  Value:= FormatDatetime('dd/mm', dmReportes.qryEstadoCxcBBFECHA_VENCE.Value)+
  ' '+Value;
end;

procedure TqckEstadoCxcGeneral.QuickRepBeforePrint(Sender: TCustomQuickRep;
 var PrintReport: Boolean);
begin
  if dmDatos.qryMembrete.State = dsInactive then
  dmDatos.qryMembrete.Open;
  qckEstadoCxcGeneral.AllDataSets.Add(dmDatos.qryMembrete);
end;

end.
