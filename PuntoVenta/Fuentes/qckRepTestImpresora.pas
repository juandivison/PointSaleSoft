unit qckRepTestImpresora;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, RxMemDS;

type
  TqckRepFuenteImpresora = class(TQuickRep)
    rxDaa: TRxMemoryData;
    rxDaaLinea: TStringField;
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qckRepFuenteImpresora: TqckRepFuenteImpresora;

implementation

{$R *.DFM}

procedure TqckRepFuenteImpresora.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  Value:=Value + QRDBText10.Font.Name;
end;

procedure TqckRepFuenteImpresora.QRDBText9Print(sender: TObject; var Value: String);
begin
Value:=Value + QRDBText9.Font.Name;
end;

procedure TqckRepFuenteImpresora.QRDBText8Print(sender: TObject; var Value: String);
begin
Value:=Value + QRDBText8.Font.Name;
end;

procedure TqckRepFuenteImpresora.QRDBText7Print(sender: TObject; var Value: String);
begin
Value:=Value + QRDBText7.Font.Name;
end;

procedure TqckRepFuenteImpresora.QRDBText6Print(sender: TObject; var Value: String);
begin
Value:=Value + QRDBText6.Font.Name;
end;

procedure TqckRepFuenteImpresora.QRDBText5Print(sender: TObject; var Value: String);
begin
Value:=Value + QRDBText5.Font.Name;
end;

procedure TqckRepFuenteImpresora.QRDBText4Print(sender: TObject; var Value: String);
begin
Value:=Value + QRDBText4.Font.Name;
end;

procedure TqckRepFuenteImpresora.QRDBText3Print(sender: TObject; var Value: String);
begin
Value:=Value + QRDBText3.Font.Name;
end;

end.
