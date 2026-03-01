unit URepValoresCatalogo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, QRExport;

type
  TqckCatConValores = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand4: TQRBand;
    QRSysData1: TQRSysData;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRHTMLFilter1: TQRHTMLFilter;
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qckCatConValores: TqckCatConValores;

implementation
Uses UDatModCatalogo,  UDatModCompania;
{$R *.DFM}

procedure TqckCatConValores.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if Value = '1' then Value := 'DB'
  else Value := 'CR';
end;

procedure TqckCatConValores.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckCatConValores.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if value = '0.00' then value := '';
end;

procedure TqckCatConValores.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmCatalogo.qrycatalogobalance_Act.Value = 0 ) and
     (dmCatalogo.qrycatalogobalance_Ant.Value = 0 ) then
     PrintBand := False else PrintBand := true;
end;

end.
