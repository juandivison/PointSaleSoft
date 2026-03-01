unit URepVigenciaCxcCtes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqryvigenciaCxc = class(TQuickRep)
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qryvigenciaCxc: TqryvigenciaCxc;

implementation

uses UDatModReportes;

{$R *.DFM}

procedure TqryvigenciaCxc.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if (dmreportes.qryVigenciaCxcFECHA_ULT_PAGO.IsNull) or
     (dmreportes.qryVigenciaCxcFECHA_ULT_PAGO.Value = 0)  then
  Value :='No pago Reg.';
end;

procedure TqryvigenciaCxc.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if (dmreportes.qryVigenciaCxcFECHA_ULT_PAGO.IsNull) or
     (dmreportes.qryVigenciaCxcFECHA_ULT_PAGO.Value = 0)  then
  Value :='';
  if  value='0.00' then  value:='';
end;

procedure TqryvigenciaCxc.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if (dmreportes.qryVigenciaCxcFECHA_ULT_PAGO.IsNull) or
     (dmreportes.qryVigenciaCxcFECHA_ULT_PAGO.Value = 0)  then
  Value :='';
end;

end.
