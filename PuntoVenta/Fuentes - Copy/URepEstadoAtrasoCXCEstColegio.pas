unit URepEstadoAtrasoCXCEstColegio;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepAtrasoEstColegio = class(TQuickRep)
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckRepAtrasoEstColegio: TqckRepAtrasoEstColegio;

implementation

uses UDatModEstudiante, UDatosVentas;

{$R *.DFM}

procedure TqckRepAtrasoEstColegio.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  dmVentas.qryClientes.Close;
  dmVentas.qryClientes.Open;
  qckRepAtrasoEstColegio.AllDataSets.Add(dmVentas.qryClientes);
end;

procedure TqckRepAtrasoEstColegio.QRDBText5Print(sender: TObject;
  var Value: String);
  var  x: integer;
begin
  x:=Pos(value,'1899');
  if x > 0 then
  value:='';
end;

procedure TqckRepAtrasoEstColegio.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (dmEstudiante.qryRepPagosAtrasoEstudianteMONTO.IsNull) or
  (dmEstudiante.qryRepPagosAtrasoEstudianteMonto.Value = 0) then
  PrintBand := False;
end;

procedure TqckRepAtrasoEstColegio.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmEstudiante.qryRepPagosAtrasoEstudianteMONTO.IsNull) or
  (dmEstudiante.qryRepPagosAtrasoEstudianteMonto.Value = 0) then
  PrintBand := False;
end;

procedure TqckRepAtrasoEstColegio.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (dmEstudiante.qryRepPagosAtrasoEstudianteMONTO.IsNull) or
  (dmEstudiante.qryRepPagosAtrasoEstudianteMonto.Value = 0) then
  PrintBand := False;
end;

procedure TqckRepAtrasoEstColegio.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmEstudiante.qryRepPagosAtrasoEstudianteMONTO.IsNull) or
  (dmEstudiante.qryRepPagosAtrasoEstudianteMonto.Value = 0) then
  PrintBand := False;
end;

end.
