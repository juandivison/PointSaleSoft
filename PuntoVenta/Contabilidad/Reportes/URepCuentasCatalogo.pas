unit URepCuentasCatalogo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, QRExport;

type
  TqckRepCtaCatalogo = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRHTMLFilter1: TQRHTMLFilter;
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepCtaCatalogo: TqckRepCtaCatalogo;

implementation
Uses UDatModCatalogo,  UDatModCompania;
{$R *.DFM}

procedure TqckRepCtaCatalogo.QRExpr2Print(sender: TObject;
  var Value: String);
begin
  if Value = '000-00-00' then value :='';
end;

procedure TqckRepCtaCatalogo.QRExpr3Print(sender: TObject;
  var Value: String);
begin
  if Value = '000-00-00' then value :='';
end;

procedure TqckRepCtaCatalogo.QRExpr4Print(sender: TObject;
  var Value: String);
begin
  if Value = '000-00-00' then value :='';
end;

procedure TqckRepCtaCatalogo.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if Value = '1' then Value := 'DB'
  else Value := 'CR';
end;

end.
