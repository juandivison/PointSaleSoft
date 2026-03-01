unit URepVencimientoProd;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepVencimientoProd = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText9: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr1: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr3: TQRExpr;
    procedure QRLabel5Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
  private

  public
    TipoReporte : String;
    todo:boolean;
  end;

var
  qckRepVencimientoProd: TqckRepVencimientoProd;

implementation

uses UDatModCompania, UGlobal, UDatModInventario;

{$R *.DFM}

procedure TqckRepVencimientoProd.QRLabel5Print(sender: TObject;
  var Value: String);
begin
  if (TipoReporte <> '') then
  Value:=TipoReporte
  else Value:='';
end;

procedure TqckRepVencimientoProd.QRExpr3Print(sender: TObject;
  var Value: String);
begin
   if Todo then
   begin
     if dmInventario.qryRepProdVenceDIASPORVENCER.Value > 0 then
     Value:='-'+value;
   end;
end;

end.
