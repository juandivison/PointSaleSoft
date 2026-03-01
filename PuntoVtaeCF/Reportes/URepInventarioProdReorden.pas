unit URepInventarioProdReorden;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepDatosInvReorden = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText13: TQRDBText;
    QRLabel10: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr6: TQRExpr;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepDatosInvReorden: TqckRepDatosInvReorden;

implementation

uses UDatModReportes, UDatModCompania;

{$R *.DFM}

procedure TqckRepDatosInvReorden.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckRepDatosInvReorden.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckRepDatosInvReorden.QRExpr1Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckRepDatosInvReorden.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if dmReportes.qryRepInventarioProdMasBclRuta.FieldByName('FECHA_ULTIMA_TRN').IsNull then
  Value:='';
end;

procedure TqckRepDatosInvReorden.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckRepDatosInvReorden.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then
  value:='';
end;

end.
