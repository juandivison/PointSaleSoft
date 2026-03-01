unit URepInventarioProdSerie;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepDatosInventarioSerie = class(TQuickRep)
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
    QRSubDetail1: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel13: TQRLabel;
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckRepDatosInventarioSerie: TqckRepDatosInventarioSerie;

implementation

uses UDatModReportes, UDatModCompania;

{$R *.DFM}

procedure TqckRepDatosInventarioSerie.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckRepDatosInventarioSerie.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckRepDatosInventarioSerie.QRExpr1Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckRepDatosInventarioSerie.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if dmReportes.qryRepInventarioProdMasBclRuta.FieldByName('FECHA_ULTIMA_TRN').IsNull then
  Value:='';
end;

procedure TqckRepDatosInventarioSerie.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value:='';
end;

procedure TqckRepDatosInventarioSerie.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then
  value:='';
end;

procedure TqckRepDatosInventarioSerie.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (dmReportes.qryInventarioSerie.RecordCount > 0) then
  begin
  if dmReportes.qryRepInventarioProdMasBclRutaCODIGO.Value =
     dmReportes.qryInventarioSerieCODIGO.Value then
  PrintBand:=True else PrintBand:=False;
  end else PrintBand:=False;
end;

procedure TqckRepDatosInventarioSerie.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (dmReportes.qryInventarioSerie.RecordCount = 0) then
  PrintBand:=False;
end;

end.
