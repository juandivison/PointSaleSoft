unit URepPromociones;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepPromociones = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand5: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr5: TQRExpr;
    QRGroup1: TQRGroup;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    QRExpr3: TQRExpr;
    QRBand4: TQRBand;
    QRExpr4: TQRExpr;
    QRLabel10: TQRLabel;
    QRExpr6: TQRExpr;
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepPromociones: TqckRepPromociones;

implementation

uses UDatModReportes;

{$R *.DFM}

procedure TqckRepPromociones.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value:= 'De '+FormatDateTime('dd-mmm-yy',dmReportes.qryRepPromociones.Params[0].Value)+
  ' al '+FormatDateTime('dd-mmm-yy',dmReportes.qryRepPromociones.Params[1].Value);
end;

end.
