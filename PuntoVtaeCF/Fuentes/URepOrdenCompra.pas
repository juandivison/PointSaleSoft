unit URepOrdenCompra;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepOrdenCompra = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
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
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand5: TQRBand;
    QRBand2: TQRBand;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRGroup1: TQRGroup;
    qrLabelReImp: TQRLabel;
    QRDBText13: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepOrdenCompra: TqckRepOrdenCompra;

implementation
uses UDatmodDatosGenerales;
{$R *.DFM}

procedure TqckRepOrdenCompra.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value := FormatDatetime('mmm-dd-yyyy',dmdatos.qryDatosOrdenImpFECHA.Value);
end;

procedure TqckRepOrdenCompra.QRExpr3Print(sender: TObject;
  var Value: String);
begin
 if value = '0.00' then value:='';
end;

end.
