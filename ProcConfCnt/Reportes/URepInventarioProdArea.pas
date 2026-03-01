unit URepInventarioProdArea;


interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepDatosInventarioXarea = class(TQuickRep)
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
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr4Print(sender: TObject; var Value: String);
  private

  public
     strLabelTiporep : String;
  end;

var
  qckRepDatosInventarioXarea: TqckRepDatosInventarioXarea;

implementation

uses UDatModReportes, UDatModCompania;

{$R *.DFM}

procedure TqckRepDatosInventarioXarea.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckRepDatosInventarioXarea.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckRepDatosInventarioXarea.QRExpr1Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckRepDatosInventarioXarea.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if dmReportes.qryRepInventarioProdMasBclDiv.FieldByName('FECHA_ULTIMA_TRN').IsNull then
  Value:='';
end;

procedure TqckRepDatosInventarioXarea.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckRepDatosInventarioXarea.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel8.Caption:=strLabelTiporep;
end;

procedure TqckRepDatosInventarioXarea.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then
  value:='';
end;

end.
