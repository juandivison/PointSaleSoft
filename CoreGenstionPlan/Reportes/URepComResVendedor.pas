unit URepComResVendedor;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepResComVendedor = class(TQuickRep)
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
    QRTARIFA: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRGroup1: TQRGroup;
    QRExpr4: TQRExpr;
    QRBand5: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel4: TQRLabel;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRDBText2: TQRDBText;
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepResComVendedor: TqckRepResComVendedor;

implementation
  uses UDatModReportes, UDatModCompania;
{$R *.DFM}

procedure TqckRepResComVendedor.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value:='Desde '+FormatDateTime('dd-mmm-yyyy', dmReportes.qryRepComResXEmp.Params[2].Value)+
  ' A '+FormatDateTime('dd-mmm-yyyy', dmReportes.qryRepComResXEmp.Params[3].Value);
end;

end.
