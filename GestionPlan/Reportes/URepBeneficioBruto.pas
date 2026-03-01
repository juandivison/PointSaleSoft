unit URepBeneficioBruto;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckBeneficioBruto = class(TQuickRep)
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    procedure QRLabel1Print(sender: TObject; var Value: String);
    
  private

  public

  end;

var
  qckBeneficioBruto: TqckBeneficioBruto;

implementation

uses UDatModReportes;

{$R *.DFM}

procedure TqckBeneficioBruto.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('dd-mmm-yyyy',dmReportes.qryDatosResumenBeneficioBruto.params[0].Value)+
  ' a '+FormatDateTime('dd-mmm-yyyy',dmReportes.qryDatosResumenBeneficioBruto.params[1].Value);
end;

end.
