unit UReporteNomina;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckRepNomina = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrTpaginas: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRTARIFA: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRExpr8: TQRExpr;
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
  private

  public

  end;              

var
  qckRepNomina: TqckRepNomina;

implementation

uses UDatModNomina;

{$R *.DFM}

procedure TqckRepNomina.QRLabel3Print(sender: TObject; var Value: String);
begin
  Value := FormatDatetime(Shortdateformat,dmNomina.qryRepNomina.Params[0].Value)+' al '+FormatDatetime(Shortdateformat,dmNomina.qryRepNomina.Params[0].Value);
end;

procedure TqckRepNomina.QRDBText8Print(sender: TObject; var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepNomina.QRDBText7Print(sender: TObject; var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepNomina.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepNomina.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepNomina.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

procedure TqckRepNomina.QRExpr1Print(sender: TObject; var Value: String);
begin
  if Value = '0.00' then Value:='';
end;

end.
