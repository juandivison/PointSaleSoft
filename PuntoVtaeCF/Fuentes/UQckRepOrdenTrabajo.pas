unit UQckRepOrdenTrabajo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TqckOrdenTrabajo = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel28: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    procedure QRLabel13Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckOrdenTrabajo: TqckOrdenTrabajo;

implementation
uses UDatModCompania, UDatModClientes, UGlobal, UDatmodDatosGenerales,
UDatModReportes;

{$R *.DFM}

procedure TqckOrdenTrabajo.QRLabel13Print(sender: TObject;
  var Value: String);
  var
  xValue : string[5];
begin
  if not dmreportes.qryRepOrdenTrabajoNUM_ORDEN.IsNull then
  xValue:=PadLeftCharacter(5,dmreportes.qryRepOrdenTrabajoNUM_ORDEN.Value,'0');
  Value:=xValue;
end;

end.
