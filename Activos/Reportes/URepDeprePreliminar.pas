unit URepDeprePreliminar;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqckRepDeprePreliminar = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    qrFecha: TQRLabel;
    QRExpr5: TQRExpr;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    procedure qrFechaPrint(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
    Preliminar : Boolean;
  end;

var
  qckRepDeprePreliminar: TqckRepDeprePreliminar;

implementation
uses UDatModuloActivos, UglobalActivos;
{$R *.DFM}

procedure TqckRepDeprePreliminar.qrFechaPrint(sender: TObject;
  var Value: String);
begin
  Value := FormatDateTime('mmm-dd-yyyy',glbFechaInicial);
end;

procedure TqckRepDeprePreliminar.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  if not Preliminar then  Value := 'DEPRECIACION'
  else Value := 'LISTADO PRELIMINAR ---> DEPRECIACION <---';
end;

procedure TqckRepDeprePreliminar.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  qckRepDeprePreliminar.AllDataSets.Add(dm.tblCompania);
end;

end.
