unit UQckRepExistenciaVenta;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepExistenciaVenta = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText15: TQRDBText;
    SummaryBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand1: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRExpr6Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepExistenciaVenta: TqckRepExistenciaVenta;

implementation

uses UDatModCompania,UDatModInventario;

{$R *.DFM}

procedure TqckRepExistenciaVenta.QRExpr2Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0') then
  begin
    Value:='NO VENDER';
    QRExpr2.Color:= $005151FF;
  end else
  begin
    Value:='';
    QRExpr2.Color:= clWhite;
  end;
end;

procedure TqckRepExistenciaVenta.QRExpr6Print(sender: TObject;
  var Value: String);
begin
  if (Value = '0') then
  begin
    Value:='NO VENDER';
    QRExpr6.Color:= $005151FF;
  end else
  begin
    Value:='';
    QRExpr6.Color:= clWhite;
  end;
end;

end.
